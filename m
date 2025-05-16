Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97B615530C
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747387305; cv=none; b=aiKUnXfEpSbibqeEHZRNy/Y5ubTuzx/rIfjzZ5zn8X5/YXAxBbhpT+EKc85iDjX6k9hVWML3C3DGt2Gv9MQUbgouWP8DuMcVmgxD3n78EV3ETpgTZveyZFSumb3vsQlBfm2NAlzbSgXVfKU0CHSxziiAqxNsHp6FMaMjNgf8HRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747387305; c=relaxed/simple;
	bh=B0v8zU29rY2q8QLEddDx7dOrND9I7IQ0KaYpXqJAq2E=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nJG4uB7qPLH6J3Hh91jjFCx3u450AH0i1hN8kNCsRsCK3oFuKe8AVdI3IaFlEKxZGOk+ttjbmJyzZABuFJpFE9hzVjQo1zGwjuO+1TZh/LX4PYnYoQIcRFMhRs5h08qGeux+khPg8fMFviS+d0V5bRKt9936HHHFq5pmqFpGBV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=aNAonh0l; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="aNAonh0l"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 54G9LPHB0637585, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1747387285; bh=B0v8zU29rY2q8QLEddDx7dOrND9I7IQ0KaYpXqJAq2E=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=aNAonh0lphRGbOyAaBIge9Dpgf8PrFXSVmY4AJNHFTDw7I2jGxyGaWLyx3on9skzk
	 PycF3hcEf36rgPO+fTp11p/0YmqxvQhxJtAho5kvBWMYV/c+/RIJc4jiH8lJ5835YD
	 yWigRj59bar5iU/eQk0N6x1tw9GL1Q7bQba1VNK7hn/YgwqcIYxhk0eFJ+7il6jWAW
	 1XiqHGeglTmDsvX9mZQeRGazy0X7LSs6swM1KIzZLJb7Dm+sZPip4n3cFPZAopMKdk
	 fc3PP4GEwc86ss5GVnb4XGMixvNdUmr2+vddLycrtoT5cfohsZZU4IiGBXiI28b3yx
	 vCxTXOQZ2B2sg==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 54G9LPHB0637585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 17:21:25 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 May 2025 17:21:25 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 16 May 2025 17:21:25 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Fri, 16 May 2025 17:21:25 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: restore auto-mute mode for Dell Chrome platform
Thread-Topic: restore auto-mute mode for Dell Chrome platform
Thread-Index: AdvGQy8L1k7zLFr0QiGWt2p8V7CA1w==
Date: Fri, 16 May 2025 09:21:24 +0000
Message-ID: <ee8bbe5236464c369719d96269ba8ef8@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
Content-Type: multipart/mixed;
	boundary="_002_ee8bbe5236464c369719d96269ba8ef8realtekcom_"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--_002_ee8bbe5236464c369719d96269ba8ef8realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch was approved by Google guy.

BR,
Kailang

--_002_ee8bbe5236464c369719d96269ba8ef8realtekcom_
Content-Type: application/octet-stream;
	name="0002-dell-chrome-res-automute.patch"
Content-Description: 0002-dell-chrome-res-automute.patch
Content-Disposition: attachment;
	filename="0002-dell-chrome-res-automute.patch"; size=1004;
	creation-date="Thu, 15 May 2025 02:08:47 GMT";
	modification-date="Fri, 16 May 2025 07:32:51 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2NjY0NzdlMjlkZjMwMzk4ZGMwOTIyYTM4M2YyMzU0M2NjZDM1MTNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMTYgTWF5IDIwMjUgMTQ6NTM6MzcgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIHJlc3RvcmUgYXV0by1tdXRlIG1vZGUgZm9yIERlbGwgQ2hyb21lIHBs
YXRmb3JtCgpUaGlzIGJvYXJkIG5lZWQgdG8gc2h1dGRvd24gQ2xhc3MtRCBhbXAgdG8gYXZvaWQg
RU1JIGlzc3VlLgpSZXN0b3JlIHRoZSBBdXRvLU11dGUgbW9kZSBpdGVtIHdpbGwgb2ZmIHBpbiBj
b250cm9sIHdoZW4gQXV0by1tdXRlIG1vZGUgd2FzIGVuYWJsZS4KClNpZ25lZC1vZmYtYnk6IEth
aWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kv
aGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4
IDg3NzEzN2NiMDlhYy4uMmVhZGVlN2Y5YjM4IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3Bh
dGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtNjgx
MSw3ICs2ODExLDEwIEBAIHN0YXRpYyB2b2lkIGFsYzI1Nl9maXh1cF9jaHJvbWVib29rKHN0cnVj
dCBoZGFfY29kZWMgKmNvZGVjLAogCiAJc3dpdGNoIChhY3Rpb24pIHsKIAljYXNlIEhEQV9GSVhV
UF9BQ1RfUFJFX1BST0JFOgotCQlzcGVjLT5nZW4uc3VwcHJlc3NfYXV0b19tdXRlID0gMTsKKwkJ
aWYgKGNvZGVjLT5jb3JlLnN1YnN5c3RlbV9pZCA9PSAweDEwMjgwZDc2KQorCQkJc3BlYy0+Z2Vu
LnN1cHByZXNzX2F1dG9fbXV0ZSA9IDA7CisJCWVsc2UKKwkJCXNwZWMtPmdlbi5zdXBwcmVzc19h
dXRvX211dGUgPSAxOwogCQlzcGVjLT5nZW4uc3VwcHJlc3NfYXV0b19taWMgPSAxOwogCQlzcGVj
LT5lbl8za3B1bGxfbG93ID0gZmFsc2U7CiAJCWJyZWFrOwo=

--_002_ee8bbe5236464c369719d96269ba8ef8realtekcom_--
