# 🧠 Feed-Forward Neural Network for MNIST Digit Recognition

This MATLAB-based project implements a customizable feed-forward neural network to classify handwritten digits from the MNIST dataset. It includes network construction, forward propagation, accuracy evaluation, and visual analysis of misclassified digits.

---

## 🗂 Project Structure

Feed-Forward-Neural-Network-for-Text-Recognition/
├── make_ffnet.m # Build a feed-forward neural network architecture
├── ffnet_eval.m # Forward-pass evaluation of a given network
├── show_failed.m # Utility to visualize misclassified images
├── test_net.m # Main script to load data, run inference, and show results
├── weights.mat # Pre-trained network weights (to be loaded into net.w)
├── digits.mat # MNIST test dataset (10 classes in test{1} to test{10})
└── README.md

yaml
Copy
Edit

---

## 🧪 How It Works

### 1. `make_ffnet.m`
Creates a feed-forward neural network with:
- Custom number of layers and neurons
- Bias neuron configuration
- Randomly initialized weights (Xavier initialization)
- Activation functions:
  - ReLU for hidden layers
  - Tanh for the output layer
- Mean Squared Error as loss function

### 2. `ffnet_eval.m`
Runs forward propagation:
- Applies weights and activation functions layer-by-layer
- Computes neuron outputs for classification tasks

### 3. `test_net.m`
- Loads the MNIST digit dataset and pretrained weights
- Evaluates model accuracy on test set
- Identifies and collects misclassified samples
- Calls `show_failed` to visualize misclassifications with predictions

### 4. `show_failed.m`
- Constructs a 10×10 grid of misclassified digits
- Displays prediction errors for visual debugging

---

## 🧠 Model Details

| Parameter       | Value              |
|----------------|--------------------|
| Input neurons   | 784 (28x28 pixels) |
| Hidden neurons  | 800 (customizable) |
| Output neurons  | 10 (digit classes) |
| Hidden activ.   | ReLU               |
| Output activ.   | Tanh               |
| Bias neurons    | Yes (except output)|
| Loss function   | Mean Squared Error |

---

## 📊 Sample Output

After running `test_net.m`, you’ll get output like:

Recognition of 0: success rate 98.00% (1000 samples)
Recognition of 1: success rate 97.90% (1000 samples)
...
Overall Accuracy: 97.84%

yaml
Copy
Edit

You’ll also see a grid of misclassified digits annotated with the digit it was mistakenly classified as.

---

## ▶️ How to Run

1. Open MATLAB
2. Ensure `digits.mat` and `weights.mat` are in the working directory
3. Run:

```matlab
test_net
📁 Required Files
digits.mat: Must contain variable test{1}, ..., test{10}, each a matrix of size [samples × 784]

weights.mat: Must contain w as a cell array with pre-trained weights

🛠️ Customization
You can modify the neural architecture in test_net.m:

matlab
Copy
Edit
% Create a 3-layer NN: 784 -> 800 -> 10
net = make_ffnet(3, [784, 800, 10], [true, true, false]);
You can also swap out activation functions in make_ffnet.m if you want to test other non-linearities like sigmoid or softmax.

📌 Notes
Backpropagation and training code are not included. We assume pre-trained weights.

This framework focuses on architecture definition and inference analysis.

👤 Author
MD Nahin Hossain Uday

📜 License
This project is open for academic and personal use. Contact the author for licensing inquiries for commercial or institutional use.
