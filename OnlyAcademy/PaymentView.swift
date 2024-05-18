import SwiftUI
import SwiftData

struct PaymentView: View {
    var plan: String
    @State private var cardNumber: String = ""
    @State private var expiryDate: String = ""
    @State private var cvv: String = ""
    @State private var cardHolderName: String = ""
    @State private var isProcessing: Bool = false
    @State private var paymentSuccess: Bool = false

    // Usando ModelContext
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack {
            Text("Pagamento \(plan)")
                .font(.largeTitle)
                .padding()

            TextField("Nome no cartão", text: $cardHolderName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Número do cartão", text: $cardNumber)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Data de validade", text: $expiryDate)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("CVV", text: $cvv)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if isProcessing {
                ProgressView()
                    .padding()
            } else {
                Button(action: processPayment) {
                    Text("Pagar")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .alert(isPresented: $paymentSuccess) {
            Alert(title: Text("Sucesso"), message: Text("Pagamento realizado com sucesso!"), dismissButton: .default(Text("OK")))
        }
    }

    private func processPayment() {
        isProcessing = true
        PaymentManager.processPayment(plan: plan, cardNumber: cardNumber, expiryDate: expiryDate, cvv: cvv, cardHolderName: cardHolderName) { success in
            isProcessing = false
            if success {
                savePaymentData()
                paymentSuccess = true
            } else {
                paymentSuccess = false
            }
        }
    }

    private func savePaymentData() {
        let newItem = Item(timestamp: Date())
        modelContext.insert(newItem)
        do {
            try modelContext.save()
        } catch {
            // Handle the Core Data error appropriately
            print("Erro ao salvar os dados: \(error.localizedDescription)")
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(plan: "PREMIUM MENSAL")
    }
}
