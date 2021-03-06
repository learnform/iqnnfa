package iqnnfatest;

public class QuickSort {
	
	
	public static void main(String[] args) {
		int[] arr = {1,2,5,8,4,3,0,10};
		sort(arr,0,7);
	}
	public static void sort(int arr[], int low, int high) {
		int l = low;
		int h = high;
		int povit = arr[low];

		while (l < h) {
			while (l < h && arr[h] >= povit)
				h--;
			if (l < h) {
				int temp = arr[h];
				arr[h] = arr[l];
				arr[l] = temp;
				l++;
			}

			while (l < h && arr[l] <= povit)
				l++;

			if (l < h) {
				int temp = arr[h];
				arr[h] = arr[l];
				arr[l] = temp;
				h--;
			}
			for (int i : arr) {
				System.out.print(i+",");
			}
			System.out.println();
			System.out.println("---------------");
		}
			for (int i : arr) {
				System.out.print(i+",");
			}
			System.out.println();
			System.out.println("---------------");
		System.out.print("l=" + (l + 1) + "h=" + (h + 1) + "povit=" + povit + "\n");
		if (l > low)
			sort(arr, low, l - 1);
		if (h < high)
			sort(arr, l + 1, high);
	}
}
