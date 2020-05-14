
def take(n, gen):
	g = gen()
	return [ next(g) for i in range(0, n)]


def gen_1():
	while True:
		yield 1

def gen_fib():
	a, b = 0,  1
	while True:
		yield a
		a, b = b, a+b


def main():
	print(take(20, gen_1))
	print(take(20, gen_fib))


if __name__ == "__main__":
	main()

