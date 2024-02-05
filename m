Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C55C8F51
	for <linux-sound@vger.kernel.org>; Mon,  5 Feb 2024 03:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707104920; cv=none; b=HxjRh62EYWyZLYJm6HtKPF821r7c0BNYhm0Xk2ovdfBSweLB5R/dSL8ipsZk/Tm5PdYf2kISZPSXU36x3hpgFATKiSAPxwZBnwM4jk5bxjxTD2eMXR0t+WTPQmuHdUtAEWhLX2eagfcWlvDkSVyJZAPZ4UI3iUsWcCpmT6/YQlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707104920; c=relaxed/simple;
	bh=E403e1qkTiyl6aGx/m+h046jeUu9XUev9Q4AoU/sH5g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=MOpKyRYPfdrJkJCD69DY2yaB0GinRcSr6Cp2BDVT/jUARmswDQoKTeKTxSA9WD0F7FauWlw63KBK7UfHFgw/FZj6fvrLwX8tzqAcCKrR/+w0FQofIfvWjuFWU9zzarrGqQ0+4cRKrPZiKrLCveOPHuM0UAP2ECPN3vQWSFkhlYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=marcelg@gmx.com header.b=asRya9Ho; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=marcelg@gmx.com header.b="asRya9Ho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
	s=s31663417; t=1707104916; x=1707709716; i=marcelg@gmx.com;
	bh=E403e1qkTiyl6aGx/m+h046jeUu9XUev9Q4AoU/sH5g=;
	h=X-UI-Sender-Class:Date:From:Subject:To;
	b=asRya9HobR+i8vQzncIw46uzxB345PlZyJ3kD7Red6Oszr8es0p3jT8g9pze94YE
	 02Toieu0tSm7Dl8clriAqfu5vGOWk29TUbbxrpal7ONzC/loLaPVKsLovoYihDior
	 O+F4khEItE/lFnLaEsLkZ3VLWgGk0eMlIPi0MSa6X6euwgX7YD7XUaAAxrAkLM6zB
	 rgNdcecbSeKWN+8CyIiEmcf5WW1LBFcLXuhYLBATrCxomnPXjh6gB1jRahUwADxjw
	 QSV4lyJpe8lQYylCvpKLZG9I6Ch7VmI6ZS/OgmZXkSMthZv9/YC3uUeu7suX8obsf
	 I+N3pT1/j32IAKD91A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.141.65.70] ([103.108.231.70]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MEm2D-1rn4KO3DCt-00GGXo for
 <linux-sound@vger.kernel.org>; Mon, 05 Feb 2024 04:48:36 +0100
Message-ID: <655fb630-e5a8-4993-8706-085476c7fe2f@gmx.com>
Date: Mon, 5 Feb 2024 11:48:31 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: marcel <marcelg@gmx.com>
Subject: [PATCH] Add Asus VivoBook S 16X to quirks table for acp6x
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:lxGVFWGjy8HcFj6w7X0rmnHB+ysyAnsewGse+Ps6e/3pTItV7Sg
 hKEFbTfVFv78o4J5wXkAk6t+uyt5aVI4Id2mkRLWZhuDb1G0BnKmNQyIMgP076ptv3g0UV3
 ARK8TAuL6iWWc2JesZCqzWBL0JkuilPlTC1QRTMhc9PWkFRFfsm2IUBKC53pOS65OsGPla3
 Vy8PiVXCl6ef5MvfdoHWw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/rr4gj3aheA=;3gFoP/TMs9csXhgwG819cQ2d+gT
 pRpofh1GEcl6aGV2JvewX4QU3FucbgLbZhc5RqON9HH/R2qdeiDiSbjwlRS4f1JUwbU/WV3Bk
 CllA0zpUnwnfoqRhuDgYZQNosQq8wvrpiSqEnjq9mQso0pgM12nG61xctA6OIanabukzaqNAa
 SA5JlIYP7WGn/yiCuiTL2iG1F4DV9VEawGQswrjwPE2tPhZQisA2yriDdHsJo9fuH7X7bGTXM
 +Zcf8Gh+6WJUYdmLjw7DgfqYOvcR2QB/G+hAgmhUwJ8LWAd4R5gTSB/Vv345VrGSKqAgN/Jlc
 xflEbfXsv86zp+ahC0HiJnJJYLw95I5quCOzBi7nHxW6yKHEf67o9P/m0pRJ7Ifh7mF7QRrxA
 /B+tnRXmHVA/POTOuT0rBUiKaTVt9yVwMm8v8ZYPlE1Do8x8lptJc/0jGBASIwVIXV7cNffwX
 Iudd3brMF/vE/sUzxefNsXIh08dnArpvmuPDa4sTid7mByhyBABNmL9js6y7nT1IdZZoG/aUE
 PociJYRMmAvsEBDmi5TPA6o26K9DLeRtRVcS0KCrSUca3hc8v2bmfvJQtrE+Edqbp2rSCNujV
 9pVX9/cyW3o7Oq7pjJkCSARKeIK3SIPfYGX/HZK6tRsYIO+rItOyhnpQcyAspJim2gxwwQv8j
 3ZKEUb+dagCCYrRvoxuH6IhBHNpt+KAMJc4bwQ3b2yq3luO64vtBPDYQBdfMDk1x5/azQuWsd
 NKzTRaIQb5KqeIoNl390MAGWeWyp1sij03yZAfL+wrb+h3bZXsXRj6OvjVAGew9ErAZPzVg7P
 lNXh2RKLHyoTmtj1qPa7IaRG3HinxAA4I5l2bY59xyY/U=

VGhpcyBwYXRjaCBlbmFibGVzIG1pY3JvcGhvbmUgZHJpdmVyIG9uIEFzdXMgVml2b2Jvb2sgUyAx
NlggbGFwdG9wIGJ5IA0KYWRkaW5nIGl0IHRvIHF1aXJrcyB0YWJsZS4NCg0KU2lnbmVkLW9mZi1i
eTogTWFyY2VsIEdlcmFsdG93c2tpIDxtYXJjZWxnQGdteC5jb20+DQoNCi0gLSAtDQoNCi0tLSBz
b3VuZC9zb3VuZC9zb2MvYW1kL3ljL2FjcDZ4LW1hY2guYy5vcmlnwqDCoMKgIDIwMjQtMDItMDUg
DQoxMDoyNjoxMS4xMjM4OTcyMzMgKzA4MDANCisrKyBzb3VuZC9zb3VuZC9zb2MvYW1kL3ljL2Fj
cDZ4LW1hY2guY8KgwqDCoCAyMDI0LTAyLTA1IDExOjA0OjQwLjU1NDU2NjkwOSANCiswODAwDQpA
QCAtMjYyLDYgKzI2MiwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgeWNf
YWNwDQogwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCBETUlfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwg
Ik01NDAyUkEiKSwNCiDCoMKgwqDCoCDCoMKgwqAgfQ0KIMKgwqDCoMKgIH0sDQorwqDCoMKgwqDC
oMKgwqAgew0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZHJpdmVyX2RhdGEgPSAm
YWNwNnhfY2FyZCwNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLm1hdGNoZXMgPSB7
DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBETUlfTUFU
Q0goRE1JX0JPQVJEX1ZFTkRPUiwgIkFTVVNUZUsgQ09NUFVURVIgDQpJTkMuIiksDQorwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBETUlfTUFUQ0goRE1JX1BS
T0RVQ1RfTkFNRSwgIk01NjAyUkEiKSwNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fQ0KK8KgwqDCoMKgwqDCoMKgIH0sDQogwqDCoMKgwqAgew0KIMKgwqDCoMKgIMKgwqDCoCAuZHJp
dmVyX2RhdGEgPSAmYWNwNnhfY2FyZCwNCiDCoMKgwqDCoCDCoMKgwqAgLm1hdGNoZXMgPSB7DQoN
Cg==
