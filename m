Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047003A9616
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 08:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773908413; cv=none; b=AaQGl5RmMo2ZgY9tZ2ihvavZGLAnKmxgVpjKVfWvwZX9TEOABNonSr2w4Z7Y3hHdNRCntr9vAvq0r6brTZKUtZlnuesvWXxpZWVcFA91AwO6LErbE17aTAK0Xov0bSvyLB0/D2h5Fi6Rnz6SBLPV+gieyP5wuuVlwS6jRrW24Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773908413; c=relaxed/simple;
	bh=DLUD7pcn99NHYMMjNd5R8QZlNyOd1KCacY8BaU8u4uY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qo48zBLSebT+E1EQBpYHNBwgGIcsblnOCl8JCcwhkGbbJjLfn6I5f1JZShW/+n4J1xm8PsArzjtx6j1sI0w48zqGtUnodUPC2IE3QCSpQYU/mr0iuwsHXNp+oln2S4wctUgBehzjH+z7Rh6g7yTCRChap+K4Pz0JB5AtSoY4Ixo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=bmbYDwa1; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="bmbYDwa1"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62J8Jo4mA3374378, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773908390; bh=mJt7nViUIXfdIj2NwlDjCiQH1cgNzvQsimaNZpI+4d0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=bmbYDwa1oamqq6C2VC7TbiMwt0CTNCdlUhFYJ4EdTlg8Ptmw4DTsSu/d4Oyf7wFu7
	 AnS9MNh6JjVvAvcGDFVpFUVH9TjqS4s9cTfy7M3XCXaR4P4AG/2ldYbrB3KMDcWpbH
	 0e1Ug2gUqm4uo+KcZuMT0+KC1neEfjzzP1alkyVFlGPaic6w6iCcCm23POipFjRAMX
	 2g4CvfOrMNdbg9zjo/wY9aYHYLybwcp1hjO4eW+8jAjgxwSHI3xNxXL4Vz3EC5V2VZ
	 bs92xbBJF0jGtqeaa74pLD24jZ7MXqnh2bPezgomlQWyMLTiHF1U+iXFw6BsujacY+
	 O+UV9au5NsBhQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62J8Jo4mA3374378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Mar 2026 16:19:50 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 19 Mar 2026 16:19:49 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Thu, 19 Mar 2026 16:19:49 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        Chris Chiu
	<chris.chiu@canonical.com>
Subject: Fix speaker mute LED for HP EliteBoard G1a
Thread-Topic: Fix speaker mute LED for HP EliteBoard G1a
Thread-Index: Ady3eK5w59bdlfMNTFqK9E9hUhRblQ==
Date: Thu, 19 Mar 2026 08:19:49 +0000
Message-ID: <279e929e884849df84687dbd67f20037@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
Content-Type: multipart/mixed;
	boundary="_002_279e929e884849df84687dbd67f20037realtekcom_"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--_002_279e929e884849df84687dbd67f20037realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

HP EliteBoard G1a platform, the speaker mute LED failed to function.
Attach patch will fix it.

Thanks.

BR,
Kailang

--_002_279e929e884849df84687dbd67f20037realtekcom_
Content-Type: application/octet-stream;
	name="0000-hp-nexusx-mute-led-v001-2-1.patch"
Content-Description: 0000-hp-nexusx-mute-led-v001-2-1.patch
Content-Disposition: attachment;
	filename="0000-hp-nexusx-mute-led-v001-2-1.patch"; size=2265;
	creation-date="Thu, 19 Mar 2026 07:48:48 GMT";
	modification-date="Thu, 19 Mar 2026 08:14:41 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhYjllYmY1ZGZmNGYzMDljMWUwMjFiZDZmZjc2MzA5MWRlY2FiMjAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMTkgTWFyIDIwMjYgMTU6NDk6NDYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEZpeGVkIFNwZWFrZXIgTXV0ZSBMRUQgZm9yIEhQIEVsaXRlQm9hcmQg
RzFhIHBsYXRmb3JtCgpPbiB0aGUgSFAgRWxpdGVCb2FyZCBHMWEgcGxhdGZvcm0gKG1vZGVscyB3
aXRob3V0IGEgaGVhZHBob25lIGphY2spLgp0aGUgc3BlYWtlciBtdXRlIExFRCBmYWlsZWQgdG8g
ZnVuY3Rpb24uIFRoZSBTeXNmcyBjdGwtbGVkIGluZm8gc2hvd2VkIAplbXB0eSB2YWx1ZXMgYmVj
YXVzZSB0aGUgc3RhbmRhcmQgTEVEIHJlZ2lzdHJhdGlvbiBjb3VsZG4ndCBjb3JyZWN0bHkgCmJp
bmQgdG8gdGhlIG1hc3RlciBzd2l0Y2guCkFkZGluZyB0aGlzIHBhdGNoIHdpbGwgZml4IGFuZCBl
bmFibGUgdGhlIHNwZWFrZXIgbXV0ZSBMRUQgZmVhdHVyZS4KClRlc3RlZC1ieTogQ2hyaXMgQ2hp
dSA8Y2hyaXMuY2hpdUBjYW5vbmljYWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcg
PGthaWxhbmdAcmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvaGRhL2NvZGVjcy9yZWFs
dGVrL2FsYzI2OS5jIGIvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jCmluZGV4IDMy
N2Y0ZGMxYjA5Zi4uOTEwNjQ5OGViMTlmIDEwMDY0NAotLS0gYS9zb3VuZC9oZGEvY29kZWNzL3Jl
YWx0ZWsvYWxjMjY5LmMKKysrIGIvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jCkBA
IC0zNzI1LDIyICszNzI1LDQyIEBAIHN0YXRpYyB2b2lkIGFsYzI0NV90YXMyNzgxX3NwaV9ocF9m
aXh1cF9tdXRlbGVkKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAogCWFsY19maXh1cF9ocF9ncGlv
X2xlZChjb2RlYywgYWN0aW9uLCAweDA0LCAweDApOwogCWFsYzI4NV9maXh1cF9ocF9jb2VmX21p
Y211dGVfbGVkKGNvZGVjLCBmaXgsIGFjdGlvbik7CiB9CisKK3N0YXRpYyB2b2lkIGFsYzI0NV9o
cF9zcGtfbXV0ZV9sZWRfdXBkYXRlKHZvaWQgKnByaXZhdGVfZGF0YSwgaW50IGVuYWJsZWQpCit7
CisJc3RydWN0IGhkYV9jb2RlYyAqY29kZWMgPSBwcml2YXRlX2RhdGE7CisJdW5zaWduZWQgaW50
IHZhbDsKKworCXZhbCA9IGVuYWJsZWQgPyAweDA4IDogMHgwNDsgLyogMHgwOCBsZWQgb24sIDB4
MDQgbGVkIG9mZiAqLworCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4MGIsIDB4MGMsIHZh
bCk7Cit9CisKIC8qIEpEMjogbXV0ZSBsZWQgR1BJTzM6IG1pY211dGUgbGVkICovCiBzdGF0aWMg
dm9pZCBhbGMyNDVfdGFzMjc4MV9pMmNfaHBfZml4dXBfbXV0ZWxlZChzdHJ1Y3QgaGRhX2NvZGVj
ICpjb2RlYywKIAkJCQkJICBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwICpmaXgsIGludCBhY3Rpb24p
CiB7CiAJc3RydWN0IGFsY19zcGVjICpzcGVjID0gY29kZWMtPnNwZWM7CisJaGRhX25pZF90IGhw
X3BpbiA9IGFsY19nZXRfaHBfcGluKHNwZWMpOwogCXN0YXRpYyBjb25zdCBoZGFfbmlkX3QgY29u
bltdID0geyAweDAyIH07CiAKIAlzd2l0Y2ggKGFjdGlvbikgewogCWNhc2UgSERBX0ZJWFVQX0FD
VF9QUkVfUFJPQkU6CisJCWlmICghaHBfcGluKSB7CisJCQlzcGVjLT5nZW4udm1hc3Rlcl9tdXRl
Lmhvb2sgPSBhbGMyNDVfaHBfc3BrX211dGVfbGVkX3VwZGF0ZTsKKwkJCXNwZWMtPmdlbi52bWFz
dGVyX211dGVfbGVkID0gMTsKKwkJfQogCQlzcGVjLT5nZW4uYXV0b19tdXRlX3ZpYV9hbXAgPSAx
OwogCQlzbmRfaGRhX292ZXJyaWRlX2Nvbm5fbGlzdChjb2RlYywgMHgxNywgQVJSQVlfU0laRShj
b25uKSwgY29ubik7CiAJCWJyZWFrOworCWNhc2UgSERBX0ZJWFVQX0FDVF9JTklUOgorCQlpZiAo
IWhwX3BpbikKKwkJCWFsYzI0NV9ocF9zcGtfbXV0ZV9sZWRfdXBkYXRlKGNvZGVjLCAhc3BlYy0+
Z2VuLm1hc3Rlcl9tdXRlKTsKKwkJYnJlYWs7CiAJfQogCiAJdGFzMjc4MV9maXh1cF90eG53X2ky
Yyhjb2RlYywgZml4LCBhY3Rpb24pOwotCWFsYzI0NV9maXh1cF9ocF9tdXRlX2xlZF9jb2VmYml0
KGNvZGVjLCBmaXgsIGFjdGlvbik7CisJaWYgKGhwX3BpbikKKwkJYWxjMjQ1X2ZpeHVwX2hwX211
dGVfbGVkX2NvZWZiaXQoY29kZWMsIGZpeCwgYWN0aW9uKTsKIAlhbGMyODVfZml4dXBfaHBfY29l
Zl9taWNtdXRlX2xlZChjb2RlYywgZml4LCBhY3Rpb24pOwogfQogLyoK

--_002_279e929e884849df84687dbd67f20037realtekcom_--
