import numpy as np
import math


def predict(data):
    x1 = data.cumsum()
    z = (x1[:len(x1) - 1] + x1[1:]) / 2.0
    B = np.array([-z, z*z]).T
    Y = data[1:]
    u = np.dot(np.dot(np.linalg.inv(np.dot(B.T, B)), B.T), Y)
    a, b = u[0], u[1]
    return [a*data[0]/(b*data[0]+(a-b*data[0])*math.exp(a*i)) for i in range(len(data))]
    # Gray Forecast Model Function


if __name__ == '__main__':
    raw_data = np.loadtxt('conservation_1.txt')
    data = np.array(raw_data)
    # [5.0000, 12.4864, 13.9987,  16.0839, 17.201,
    # 17.7296, 17.9732, 19.0819, 20.0000,  21.2919,
    # 22.9647,  25.0000,  28.3612, 30.0000,  57.0000,
    # 66.6734,  88.8200,  105.5084, 101.0000, 52]
    predict_data = predict(data)  # Prediction
    result = np.ediff1d(predict_data)  # Diminishing
    print('Original result: ', data[1:])
    print('Prediction result: ', result)
    print('Relative error: ', (np.array(result[:len(data)])
                    - np.array(data[1:len(data)])) / np.array(data[1:len(data)]))
