Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDB6356756
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 07:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620030; cv=none; b=KbHcGvdbeMWeku7fkj2yQfnYUKGzHZ7B4GepYejG5TtTqGbe+MTmdpnLmtcZagax9AhNo2REZUOvRD9wHHRECavIgwtQxpj37udb4Xiv/CieYnnOPwn0YdMyIcVnDHwjwkooruWHua7BKkifQTlcVmzCz4s25rlt1tAIPfgRwKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620030; c=relaxed/simple;
	bh=hRceb/2EQpmlP8QJH3a+Ib7rKOmy+Cb/m46LR67EXqc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LnmAu19nuQmYK2qaAhXMMhp87WIn8fGWKPJ34fVqOrk0aoBjRpQYzj36LUanX/WZaDVFgyFUDfGQ5dk4zmhClR7TYle2QsgHjUKVIegfp5JcsRzlNr/QxEOj7jiS0a06RxC9G1GEdz3Mqe1ZeAuU88MnBlamhFqBy0/S9GTC708=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=KVDwgeoz; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="KVDwgeoz"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66L7koD533031040, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784620010; bh=+YTkHeXa7EOUCkMZxVh4rg/KoiEmphR7pKIdtpyaU5o=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=KVDwgeozA+3mALaDR0UfjC4ztQORGIiBnvWCpPnlcK0k/qpCe2+Tmy5u9pBjEdwjc
	 KP+3X8trLjpMChF2Do08WJ+LS1oL4hLYwjDSBKG8BB41q9O6olUrMcZL6SWTjw7oYA
	 3VfDVBFriDazMe0INXyE3flFA+EApam4sx+iMcdfkyrsj+tVV65xAFyv6wimss5TFp
	 FOPR0t9M53OUGuZR6gxrIjCYBnA4dN5jH15YJctrqwTE+rgTrxf8RlS52rltpvWVaO
	 Pu2vupcEuC1YD9qBpBjO5fMe2jJGVBj7g1Z8ZyCb1NvuFoj7x2Raq47kEdrR7/TnJ+
	 BN/InjA9H54CQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66L7koD533031040
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jul 2026 15:46:50 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 21 Jul 2026 15:46:51 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 21 Jul 2026 15:46:50 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Tue, 21 Jul 2026 15:46:50 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: ALSA: hda/realtek - Add quirk for Dell Pro QC1255
Thread-Topic: ALSA: hda/realtek - Add quirk for Dell Pro QC1255
Thread-Index: Ad0Y5DVG+tQyhmJsTjKUwyDtJgH2Zg==
Date: Tue, 21 Jul 2026 07:46:50 +0000
Message-ID: <e13d08e96ac449b6994d56dfe6ce3f5c@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
Content-Type: multipart/mixed;
	boundary="_002_e13d08e96ac449b6994d56dfe6ce3f5crealtekcom_"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--_002_e13d08e96ac449b6994d56dfe6ce3f5crealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Vendor want to add more SSID.
They forgot to list all the supported SSIDs.

BR,
Kailang

--_002_e13d08e96ac449b6994d56dfe6ce3f5crealtekcom_
Content-Type: application/octet-stream;
	name="0001-alc236-dell-dt-hp-noise.patch"
Content-Description: 0001-alc236-dell-dt-hp-noise.patch
Content-Disposition: attachment;
	filename="0001-alc236-dell-dt-hp-noise.patch"; size=1744;
	creation-date="Tue, 21 Jul 2026 07:39:41 GMT";
	modification-date="Tue, 21 Jul 2026 07:38:37 GMT"
Content-Transfer-Encoding: base64

RnJvbSAzMWM0MTI1OTQ0NzA3Mjg5MDI3NWQ5OTMwMzFiMTE1Y2FmNDYzOWViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgMjEgSnVsIDIwMjYgMTU6MTQ6MjIgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBxdWlyayBmb3IgRGVsbCBQcm8gUUMxMjU1CgpWZW5kb3Igd2Fu
dCB0byBhZGQgbW9yZSBtYWNoaW5lIG9uIHRoaXMgd29ya2Fyb3VuZC4KCnBhdGNoOiA5NzI3MmE1
NzA0YmYgKCJBTFNBOiBoZGEvcmVhbHRlayAtIEZpeGVkIEhlYWRwaG9uZSBub2lzZSBpc3N1ZSBm
b3IgRGVsbCBRQ00xMjU1IikKU2lnbmVkLW9mZi1ieTogS2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJl
YWx0ZWsuY29tPgpkaWZmIC0tZ2l0IGEvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5j
IGIvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jCmluZGV4IGE5ZGExNDk4MzlhZC4u
YjAwOGI2Yzg1ZjRlIDEwMDY0NAotLS0gYS9zb3VuZC9oZGEvY29kZWNzL3JlYWx0ZWsvYWxjMjY5
LmMKKysrIGIvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jCkBAIC03MDI2LDcgKzcw
MjYsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtd
ID0gewogCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDBjYzMsICJEZWxsIE9hc2lzIDE0IExvdyBX
ZWlnaHQgTVRMLVUiLCBBTEMyODlfRklYVVBfREVMTF9DUzM1TDQxX1NQSV8yKSwKIAlTTkRfUENJ
X1FVSVJLKDB4MTAyOCwgMHgwY2M0LCAiRGVsbCBPYXNpcyAxNiBNVEwtSC9VIiwgQUxDMjg5X0ZJ
WFVQX0RFTExfQ1MzNUw0MV9TUElfMiksCiAJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MGNjNSwg
IkRlbGwgT2FzaXMgMTQiLCBBTEMyODlfRklYVVBfUlRLX0FNUF9EVUFMX1NQSyksCi0JU05EX1BD
SV9RVUlSSygweDEwMjgsIDB4MGU2YiwgIkRlbGwgUHJvIFFDTTEyNTUiLCBBTEMyMzZfRklYVVBf
REVMTF9IUF9QT1BfTk9JU0UpLAorCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDBkNTYsICJEZWxs
IFBybyBUb3dlciBRQ1QxMjU1IiwgQUxDMjM2X0ZJWFVQX0RFTExfSFBfUE9QX05PSVNFKSwKKwlT
TkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwZDU4LCAiRGVsbCBQcm8gTWljcm8gUUNNMTI1NSIsIEFM
QzIzNl9GSVhVUF9ERUxMX0hQX1BPUF9OT0lTRSksCisJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4
MGQ1YSwgIkRlbGwgUHJvIFNsaW0gUUNTMTI1NSIsIEFMQzIzNl9GSVhVUF9ERUxMX0hQX1BPUF9O
T0lTRSksCisJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MGU2YiwgIkRlbGwgUHJvIFRvd2VyIFFD
VDEyNTUiLCBBTEMyMzZfRklYVVBfREVMTF9IUF9QT1BfTk9JU0UpLAorCVNORF9QQ0lfUVVJUkso
MHgxMDI4LCAweDBlNmMsICJEZWxsIFBybyBTbGltIFFDUzEyNTUiLCBBTEMyMzZfRklYVVBfREVM
TF9IUF9QT1BfTk9JU0UpLAogCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDBlNmQsICJEZWxsIFBy
byBNaWNybyBRQ00xMjU1IiwgQUxDMjM2X0ZJWFVQX0RFTExfSFBfUE9QX05PSVNFKSwKIAlTTkRf
UENJX1FVSVJLKDB4MTAyOCwgMHgxNjRhLCAiRGVsbCIsIEFMQzI5M19GSVhVUF9ERUxMMV9NSUNf
Tk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDE2NGIsICJEZWxsIiwgQUxD
MjkzX0ZJWFVQX0RFTEwxX01JQ19OT19QUkVTRU5DRSksCg==

--_002_e13d08e96ac449b6994d56dfe6ce3f5crealtekcom_--
