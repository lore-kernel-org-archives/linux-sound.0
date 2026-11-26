Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.46.229.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692034;
	b=Z/58AvFOstWNMO1zGKaR96afX8xgTxlzYbroCIoYdLBh/T4kiXFBFO94lXdkNaO8ks6B
	 vxtGLrPjZrj/5dc+BmQhj9pT6A7GZ3gL77w5gHbP8X1LxKc9N/HvS9LER6c/ig+/V/bGe
	 /DuDttdjBk3k9fkYnzfvEJNKiQdlw4X93EM1b5BnUBVVzBxL5SxMcH/+j4nuUSZRLR1L6
	 RYl1xLWm9BJmvPli26DNoiqh6An4tmD8c+jsJeWxqswnraT29qeBO+7CLAa1/ObmxNNi6
	 A8vUm4PtTFIWycuXU5ziA+sRpiTB1+xt5vP36bE8A7xzkr+eMA7q01W5aFa6Z7H0Lyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692034;
	h=DMARC-Filter:Received:X-Originating-IP:Date:X-CM-HeaderCharset:From:
	 To:Cc:Subject:X-Priority:X-Mailer:X-CM-CTRLMSGS:
	 Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	 X-Coremail-Locale:X-CM-TRANSID:X-CM-SenderInfo:X-Coremail-Antispam;
	bh=Yq34MxAonp8w7fkcH+HHmtU/LVeO6dwKSjZpLb84G90=;
	b=tFLCeDix10RtZoSXRnQoFLSIjtby5afXt065ZlE38dRhFyISs2nfrGRvi9ue2BCFn+Ya
	 S0sF+3mXplUVf9+EbmuRnmZs1EapRZ4Aadrq2DHFnFc1xAXdq2zwdzg7mK6giMcJvVU3m
	 CPDZVQ7dJJSG1dY3S9TxZ9EZIVJ9vsKoVnOatth/+F7T17J9D8flF3yEWkhhV0BmS1Xdt
	 xpuOyEvYsm8Fvna0fNBRpGGiablv4LOn5W5PZ+GFp+NZnj5IhNa4q8iue/si40A+AtNhA
	 kbq0K1RkJLJnMG5p89hPLpdsOFHLZMeVje9GuE/d07PwWNmHg4+lXGwvyuHb4yxkHLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=207.46.229.174
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8DD606A68C;
	Thu, 26 Nov 2026 11:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A8DD606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from xuhx$hust.edu.cn ( [10.12.190.107] ) by ajax-webmail-app1
 (Coremail) ; Thu, 26 Nov 2026 19:20:28 +0800 (GMT+08:00)
Date: Thu, 26 Nov 2026 19:20:28 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
To: "Takashi Iwai" <tiwai@suse.com>, "Jaroslav Kysela" <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: ctxfi: Fix UAF when freeing a running system timer
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2025.3-cmXT6 build
 20260810(6c94e3b5) Copyright (c) 2002-2026 www.mailtech.cn hust
X-CM-CTRLMSGS: =?B?ucJHcTiH6nJ5xwDR7hwMki1N8jM=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <2e224b35.12c4.1a21795e092.Coremail.xuhx@hust.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:IAEQrMCGzs_8FQhrKAMRAA--.5210W
X-CM-SenderInfo: bgsqjkayqyjmo6kx23oohg3hdfq/1tbiAQQDB2sHuvQfwQACs-
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

Q3VycmVudGx5LCBjdF9zeXN0aW1lcl9mcmVlIGlzIGFsaWFzZWQgdG8gY3Rfc3lzdGltZXJfcHJl
cGFyZSwgd2hpY2gKY2FsbHMgdGltZXJfZGVsZXRlX3N5bmNfdHJ5KCkuIFdoaWxlIGN0X3N5c3Rp
bWVyX3ByZXBhcmUoKSBtdXN0IHJlbWFpbgpub24tc2xlZXBpbmcgYmVjYXVzZSBpdCBjYW4gcnVu
IHVuZGVyIHRoZSBQQ00gc3RyZWFtIGxvY2ssIHVzaW5nCnRpbWVyX2RlbGV0ZV9zeW5jX3RyeSgp
IGluIHRoZSBmcmVlIHBhdGggaXMgdW5zYWZlOiBpZiB0aGUgdGltZXIKY2FsbGJhY2sgaXMgY29u
Y3VycmVudGx5IHJ1bm5pbmcgb24gYW5vdGhlciBDUFUsIHRpbWVyX2RlbGV0ZV9zeW5jX3RyeSgp
CnJldHVybnMgLTEgd2l0aG91dCB3YWl0aW5nIGZvciBjb21wbGV0aW9uLiBUaGUgY2FsbGVyIHRo
ZW4gcHJvY2VlZHMgdG8KZnJlZSB0aGUgY3RfdGltZXJfaW5zdGFuY2Ugb2JqZWN0LCByZXN1bHRp
bmcgaW4gYSB1c2UtYWZ0ZXItZnJlZSBpbiB0aGUKc3RpbGwtcnVubmluZyB0aW1lciBjYWxsYmFj
ay4KClJlcGxhY2UgdGhlIGN0X3N5c3RpbWVyX2ZyZWUgbWFjcm8gd2l0aCBhIGRlZGljYXRlZCBm
dW5jdGlvbiB0aGF0IGNhbGxzCnRpbWVyX3NodXRkb3duX3N5bmMoKSwgd2hpY2ggd2FpdHMgZm9y
IGFueSBydW5uaW5nIGNhbGxiYWNrIHRvIGZpbmlzaAphbmQgcHJldmVudHMgdGhlIHRpbWVyIGZy
b20gYmVpbmcgcmVhcm1lZCBiZWZvcmUgdGhlIGluc3RhbmNlIGlzIGZyZWVkLgoKCkNjOiA8c3Rh
YmxlQHZnZXIua2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSGFueGlhbmcgWHUgPHh1aHhAaHVz
dC5lZHUuY24+Ci0tLQpzb3VuZC9wY2kvY3R4ZmkvY3R0aW1lci5jIHwgIDggKysrKysrKy0KMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L3NvdW5kL3BjaS9jdHhmaS9jdHRpbWVyLmMgYi9zb3VuZC9wY2kvY3R4ZmkvY3R0aW1lci5jCi0t
LSBhL3NvdW5kL3BjaS9jdHhmaS9jdHRpbWVyLmMKKysrIGIvc291bmQvcGNpL2N0eGZpL2N0dGlt
ZXIuYwpAQCAtMTExLDExICsxMTEsMTcgQEAKCnN0YXRpYyB2b2lkIGN0X3N5c3RpbWVyX3ByZXBh
cmUoc3RydWN0IGN0X3RpbWVyX2luc3RhbmNlICp0aSkKeworIC8qIG5vbi1zbGVlcGluZzogYWxz
byBydW5zIHVuZGVyIHRoZSBQQ00gc3RyZWFtIGxvY2sgKi8KY3Rfc3lzdGltZXJfc3RvcCh0aSk7
CnRpbWVyX2RlbGV0ZV9zeW5jX3RyeSgmdGktPnRpbWVyKTsKfQoKLSNkZWZpbmUgY3Rfc3lzdGlt
ZXJfZnJlZSBjdF9zeXN0aW1lcl9wcmVwYXJlCitzdGF0aWMgdm9pZCBjdF9zeXN0aW1lcl9mcmVl
KHN0cnVjdCBjdF90aW1lcl9pbnN0YW5jZSAqdGkpCit7CisgLyogbWF5IHNsZWVwOiB3YWl0IGZv
ciBhIGNhbGxiYWNrIHJ1bm5pbmcgb24gYW5vdGhlciBDUFUgKi8KKyBjdF9zeXN0aW1lcl9zdG9w
KHRpKTsKKyB0aW1lcl9zaHV0ZG93bl9zeW5jKCZ0aS0+dGltZXIpOworfQoKc3RhdGljIGNvbnN0
IHN0cnVjdCBjdF90aW1lcl9vcHMgY3Rfc3lzdGltZXJfb3BzID0gewouaW5pdCA9IGN0X3N5c3Rp
bWVyX2luaXQs
