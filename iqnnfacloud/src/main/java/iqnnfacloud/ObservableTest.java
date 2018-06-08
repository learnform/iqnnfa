package iqnnfacloud;

import rx.Observable;
import rx.Subscriber;

public class ObservableTest {

	public static void main(String[] args) {
		// 创建事件源
		Observable<String> observable = Observable.create(new Observable.OnSubscribe<String>() {

			@Override
			public void call(Subscriber<? super String> subscriber) {
				subscriber.onNext("—————发布订阅————");
				subscriber.onNext("琴声绕梁三百回");
				subscriber.onCompleted();
			}

		});

		// 创建订阅者
		Subscriber<String> subscriber = new Subscriber<String>() {

			@Override
			public void onCompleted() {
				// TODO Auto-generated method stub

			}

			@Override
			public void onError(Throwable arg0) {
				// TODO Auto-generated method stub

			}

			@Override
			public void onNext(String arg0) {
				// TODO Auto-generated method stub
				System.out.println("我是订阅者");
			}
		};

		observable.subscribe(subscriber);
	}

}