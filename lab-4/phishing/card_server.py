from flask import Flask, request, jsonify
import os

app = Flask(__name__)

# Define the file where data will be stored
data_file = "card_data.txt"

@app.route('/submit', methods=['POST'])
def collect_data():
    data = request.json
    
    name = data.get('name')
    card_number = data.get('cardNumber')
    expiry = data.get('expiry')
    cvv = data.get('cvv')
    
    if name and card_number and expiry and cvv:
        with open(data_file, 'a') as file:
            file.write(f"Name: {name}, Card Number: {card_number}, Expiry: {expiry}, CVV: {cvv}\n")
        return jsonify({"message": "Data received successfully"}), 200
    else:
        return jsonify({"message": "Invalid data"}), 400

if __name__ == '__main__':
    # Ensure the data file exists
    if not os.path.exists(data_file):
        with open(data_file, 'w') as f:
            pass
    app.run(debug=True, port=5000)
