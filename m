Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539924;
	b=wsOsMh0hHOqBCxn8vZxtkIks3+LmMm85JZpFD08HO18LjzI7a6Y5zapATlWDLJkzXhYJ
	 Q55Nz0jAQanCJ5hgeHtYgssasPLAwmvX2mCX+gA1H2rmrnN23sG4GoksPbBhUqcFJ89l/
	 1IBYTRS+GK39jwjkzDgnegvDiReNgfUwQWJyyJ7kKQsDq1qe6+K+u6zHU5qkJCNLTn1tY
	 1Uap4kymRxDA0QZU/t8Z0Nj1B2imuRbVttDNmjyfV8kJCRj6Qlyb/qNa2hr5IgYgN4jiK
	 0eGJOC7wIDdryYJ66bEwoKpmRH0JCqiWCnggkEi9IzvC4PiF3HMGXO7aSQyFKMt/Ytw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID;
	bh=ffk4YQzeNnCAs3ZskrsO2BWcOw3Pl3rB7ma4V38WJp0=;
	b=zUcrlpvIHWd0ytCJQN3/KPtuaGIHLiMXqVZ5nYR6tLX5vFWLYlBU4s/oJYtulB1C3/hD
	 NZXiMtuLi6mMpKlArwW0ZIxihXPuxNgT0S5NssnVIqaXS8GvE6bNk8m8Wo9qgP7uC4y3T
	 m5QsrV2uzdSNHDoidAxzvz6ED2HS+ii7l7GzjcjPNfcQAMapl5vq+DHzcd2pJ2eqHCjLC
	 oLpJOU+R0iTNC5u/5d1njRp2Rul0aZRbSKKDJWOrfILP34ie7x/wxv24Wx6rkkeTrBXey
	 OHRAtxuw5tfI2pyD9sOjXg0ut4vKDZjNFT6SOcBel4bkUfwQJne4W0cQG2jZMihfz1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Hrg19vq/";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88023606A330
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88023606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hrg19vq/
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dee593f18so4519535f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539922; x=1796144722; darn=vger.kernel.org;
        h=message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ffk4YQzeNnCAs3ZskrsO2BWcOw3Pl3rB7ma4V38WJp0=;
        b=Hrg19vq/nmpSkshYEQFNnq4MLH9pMGwVNXUeMCELtxzVyGYYj29mgWksjtcFIbDwLs
         AbJr0FbAGIj+OAuwkYGhJtjtlr84P51ClxGM12lnimBaq5nZjaUo6XVrgSqlCu45b6gs
         pn99ahpQAypu7stapx4vvOj5QU4mJAK+RitHmpV9YiPOZa6J0blVCNu62ImeQEjWQpQw
         r36sH8i/APTE1TatM001bN5TFmc2F6mKrGE9qpuEXnBngCCHUflgS8ih70GW9HHwfAPL
         ghi+s2geL8FoIke3QBdPkgdEQpCphhQKV7E7z9Kgsn3s8vc1uUvB1HgMvM/ZudeKtE6f
         SWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539922; x=1796144722;
        h=message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ffk4YQzeNnCAs3ZskrsO2BWcOw3Pl3rB7ma4V38WJp0=;
        b=Jf69UvxLMESh6zxXi4Owl4oQZSfp/TiMENuOQGYp91WDRGr92+i5y472p0DDeW5jPd
         Q26Mqc1SQCewV6n5eE3DRYqX/DsNXkkQPfgjaF9P+DFNqI74hocJ22dYmmY/zVVuO/cy
         Y/Q4YuEfrR/CcVgHbrmcK2gHK2FFLplc97J3CoJJ7E9Y1gW0pCZqDOh3xtaHOVcda4DZ
         DmRABlhwx4T9CRSIEnrFtGphgoRDn4lP3K6a83Hz4MDc+kqglh51cbWy1y1vzIeJxe+3
         pfeSlSkaZPb+3BNcN+wjguOO+2ZrCTYQ34pIEOmlbw9kkn9OOeRnCox3b9Bv+88sBRBJ
         WRdA==
X-Forwarded-Encrypted: i=1; AL+hErHHZ1LF7DHeAjVIo5fTWaXgG0OJL0qTSCCgvlsZyIWZ9IaljKo6W3abZWZeTRWJmGSttD+o1S7sf/V7MA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Yo+M3N5zJ31ExkNaamWD2RGdECZnh5WgkMyleoSdLWFy/h4sQ
	RxwVf1jNXutOpfypn4J2TUU2S/scTM8dwEjBwu0F9GCrXMBekU7vkOR1
X-Gm-Gg: AZFdTZd7xE1flUD+uoS6WUAD/w+CS6K1HKWLrgBippVQAqKLJms9rahf18QmmvDiI0g
	1v+VdEw0kvGwq0TkFSfyf1nWjkr8wYJBg4VgXfPOGzJs6kWU+xeIsKTycFpQrELv7PyGx8OB0UJ
	Qhhj0/mT2UJP/Q7X+T2tHk9cII6hu/8afzhCOM+Ai55mVolnqKiIgX+bE0XejQrawxh7QFAwWyl
	Up6LA+2ER23mUJtqZ8+Go/0Jjz2V95YcA9uOtuewGU8fM4GBpkU6b1RfFGqrr9qKDKLp3C/z+EM
	w28zFLhNmaSjPx8S3wEfYEpFLLXwJoNCutZ2l3UKKTzzdfa8e5hZq6PwYK3lpcqd4IKksfZXj3m
	4zWpbckNgJD8ucC9nLMy8Q0UpuRhcSS14MRAuJ4pbIMftA07Znfi0dLVU/il9lC6sMUwhW/T6FV
	d+yiTwIWD5yNqWedCgKhmqFmmmUOKpXfLyjxavRoipxR6oqCM7Q5eBeYKabc3TXg48csqUjxmDC
	NdQ+uAX2ue7xOg0GF8uDfJumcu9v6regY0VUZywVaFkR8dQvoqrGPpJ
X-Received: by 2002:a05:600c:37c9:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb888251b4mr276173155e9.32.1795539921735;
        Tue, 24 Nov 2026 09:05:21 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm458176075e9.3.2026.11.24.09.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:05:21 -0800 (PST)
Date: Tue, 24 Nov 2026 09:05:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: vkoul@kernel.org
Cc: srinivas.kandagatla@oss.qualcomm.com, andersson@kernel.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v6] soundwire: qcom: check clk_prepare_enable() return values
Message-ID: <e5fda000d0dc4f168120c8ec91a752d5@gmail.com>

Y2xrX3ByZXBhcmVfZW5hYmxlKCkgY2FuIGZhaWw7IHVuY2hlY2tlZCwgdGhlIGRyaXZlciBwcm9j
ZWVkcyB0bwp0b3VjaCByZWdpc3RlcnMgd2l0aCB0aGUgaW50ZXJmYWNlIGNsb2NrIG9mZiwgd2hp
Y2ggYWJvcnRzIG9uIGFybTY0LgpDaGVjayB0aGUgcmV0dXJuIHZhbHVlIGluIHRoZSBpbnRlcnJ1
cHQgaGFuZGxlciAocmV0dXJuaW5nIElSUV9OT05FLAphcyB0aGUgaW50ZXJydXB0IHN0YXR1cyBp
cyBub3QgcmVhZCBvciBjbGVhcmVkIG9uIHRoYXQgcGF0aCksIGluCnByb2JlLCBhbmQgaW4gdGhl
IHJ1bnRpbWUgcmVzdW1lIHBhdGggKHJldHVybmluZyB0aGUgZXJyb3Igd2l0aG91dAp1bm1hc2tp
bmcgdGhlIGxldmVsLWhpZ2ggd2FrZSBJUlEsIHdoaWNoIHdvdWxkIHN0b3JtIHdoaWxlIHRoZSBz
bGF2ZQprZWVwcyBkcml2aW5nIHRoZSBsaW5lKS4KCkZpeGVzOiAwMmVmYjQ5YWE4MDUgKCJzb3Vu
ZHdpcmU6IHFjb206IGFkZCBzdXBwb3J0IGZvciBTb3VuZFdpcmUgY29udHJvbGxlciIpCkZpeGVz
OiA3NGU3OWRhOWZkNDYgKCJzb3VuZHdpcmU6IHFjb206IGFkZCBydW50aW1lIHBtIHN1cHBvcnQi
KQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVy
IDx5YXNzMjcxMDZAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogU3Jpbml2YXMgS2FuZGFnYXRsYSA8
c3Jpbml2YXMua2FuZGFnYXRsYUBvc3MucXVhbGNvbW0uY29tPgotLS0KUmViYXNlZCBvbiBzb3Vu
ZHdpcmUgZml4ZXMgKHNkdy9maXhlcykgYXMgcmVxdWVzdGVkOyB0aGUgcnVudGltZS1yZXN1bWUg
aHVuawpub3cgc2l0cyBvbiB0b3Agb2YgInNvdW5kd2lyZTogcWNvbTogZGlzYWJsZSB0aGUgaW50
ZXJydXB0IGJlZm9yZSBnYXRpbmcKdGhlIGNsb2NrIi4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgog
ZHJpdmVycy9zb3VuZHdpcmUvcWNvbS5jIHwgMTUgKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3NvdW5kd2lyZS9xY29tLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKaW5kZXggMTQ3
ZTU1YjdhNjAuLmNhMzEyYzE4OTc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9xY29t
LmMKKysrIGIvZHJpdmVycy9zb3VuZHdpcmUvcWNvbS5jCkBAIC03NzgsNyArNzc4LDkgQEAgc3Rh
dGljIGlycXJldHVybl90IHFjb21fc3dybV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZf
aWQpCiAJdTMyIGk7CiAJaW50IGRldm51bTsKIAlpbnQgcmV0ID0gSVJRX0hBTkRMRUQ7Ci0JY2xr
X3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGspOworCisJaWYgKGNsa19wcmVwYXJlX2VuYWJsZShj
dHJsLT5oY2xrKSkKKwkJcmV0dXJuIElSUV9OT05FOwogCiAJY3RybC0+cmVnX3JlYWQoY3RybCwg
Y3RybC0+cmVnX2xheW91dFtTV1JNX1JFR19JTlRFUlJVUFRfU1RBVFVTXSwKIAkJICAgICAgICZp
bnRyX3N0cyk7CkBAIC0xNjc1LDcgKzE2NzcsMTEgQEAgc3RhdGljIGludCBxY29tX3N3cm1fcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZ290byBlcnJfaW5pdDsKIAl9CiAK
LQljbGtfcHJlcGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJcmV0ID0gY2xrX3ByZXBhcmVfZW5h
YmxlKGN0cmwtPmhjbGspOworCWlmIChyZXQpIHsKKwkJZGV2X2VycihkZXYsICJ1bmFibGUgdG8g
ZW5hYmxlIGlmYWNlIGNsb2NrXG4iKTsKKwkJZ290byBlcnJfaW5pdDsKKwl9CiAKIAljdHJsLT5k
ZXYgPSBkZXY7CiAJZGV2X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGN0cmwpOwpAQCAtMTgwMCw3
ICsxODA2LDEwIEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3dybV9ydW50aW1lX3Jlc3Vt
ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCQlkaXNhYmxlX2lycV9ub3N5bmMoY3RybC0+d2FrZV9p
cnEpOwogCX0KIAotCWNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKTsKKwlyZXQgPSBjbGtf
cHJlcGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKwog
CWVuYWJsZV9pcnEoY3RybC0+aXJxKTsKIAogCWlmIChjdHJsLT5jbG9ja19zdG9wX25vdF9zdXBw
b3J0ZWQpIHsKLS0gCjIuNTUuMAoK
