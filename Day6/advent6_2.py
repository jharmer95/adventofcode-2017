import sys


def main(inputFile):
    with open(inputFile) as f:
        s = f.read()
        banks = [int(i) for i in s.split('\t')]
    numBanks = len(banks)
    valDict = {tuple(banks): 0}
    numCycles = 0
    while True:
        mxIdx = banks.index(max(banks))
        mxNum = banks[mxIdx]
        banks[mxIdx] = 0
        for _ in range(mxNum):
            mxIdx += 1
            if mxIdx >= numBanks:
                mxIdx = 0
            banks[mxIdx] += 1
        numCycles += 1
        if tuple(banks) in valDict.keys():
            print(numCycles - valDict[tuple(banks)])
            break
        valDict[tuple(banks)] = numCycles


if __name__ == '__main__':
    main(sys.argv[1])
