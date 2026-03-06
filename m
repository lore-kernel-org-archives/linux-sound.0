Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5657113E02A;
	Fri,  6 Mar 2026 01:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772760011; cv=none; b=c/WwCWAL14hESO28PgeT+QHlf9F4ScglH1u9WjyNISl3v3SifcKNOp8BLs8FV0wLNSYmFy8VNZZ9SE0rr2k2Ln9yDxYOI3RATd5kZR1RIW6H2aTmqN5vxeHJxCKTIEQ5DY3PS3JaIdr4+0k+9miX/vpjNRpozELo02k2oNfeJzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772760011; c=relaxed/simple;
	bh=TL+wLt44pgBx9EJhXm309YZSFcmyyn8SvDCCZ4sGULA=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=XaiYKwwwKeZthrBgwUT4T/WQoW8qgt8uKePvJCoRfne55+H6twVfY+sEjYxL6mHBolprjwG/XMkqrfwLI6SqONYhbg3fBdGXlYWSjl/ho66ugYEBOCOlQzkO/UVe433xIwvjW7CkMWd9lQqYF+Z1di1RJWt4mAOUavaVDIqWvIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 98658ad018fa11f1a21c59e7364eecb8-20260306
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:d8c0833e-8131-41ee-b5ac-af4eb2b0176b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:5,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:89c9d04,CLOUDID:3f2cedfc480467374eb21adee3d54911,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|898,TC:nil,Content:0|15|50,
	EDM:-3,IP:nil,URL:99|1,File:2|127,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 98658ad018fa11f1a21c59e7364eecb8-20260306
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1275104603; Fri, 06 Mar 2026 09:20:00 +0800
Content-Type: multipart/mixed; boundary="------------RZz0yaV7VnHpT5U98udgZUIh"
Message-ID: <b55f6ebe-7449-49f7-ae85-00d2ba1e7af0@kylinos.cn>
Date: Fri, 6 Mar 2026 09:19:57 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Gigabyte Technology to
 fix headphone
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260305024958.49026-1-zhangheng@kylinos.cn>
 <875x7axz4x.wl-tiwai@suse.de>
From: zhangheng <zhangheng@kylinos.cn>
In-Reply-To: <875x7axz4x.wl-tiwai@suse.de>

This is a multi-part message in MIME format.
--------------RZz0yaV7VnHpT5U98udgZUIh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Sorry, I didn't take a closer look. I will check it carefully next time.
--------------RZz0yaV7VnHpT5U98udgZUIh
Content-Type: text/plain; charset=UTF-8;
 name="v2-0001-ALSA-hda-realtek-Add-quirk-for-Gigabyte-Technolog.patch"
Content-Disposition: attachment;
 filename*0="v2-0001-ALSA-hda-realtek-Add-quirk-for-Gigabyte-Technolog.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA2ZDYwZjQxMDEyYTBkYjdmYzVlYmJkMWUwM2M0N2VkODM3NDk1MDIyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBaaGFuZyBIZW5nIDx6aGFuZ2hlbmdAa3lsaW5vcy5j
bj4KRGF0ZTogVGh1LCA1IE1hciAyMDI2IDEwOjM1OjU5ICswODAwClN1YmplY3Q6IFtQQVRD
SCB2Ml0gQUxTQTogaGRhL3JlYWx0ZWs6IEFkZCBxdWlyayBmb3IgR2lnYWJ5dGUgVGVjaG5v
bG9neSB0bwogZml4IGhlYWRwaG9uZQoKVGhlIEJJT1Mgb2YgdGhpcyBtYWNoaW5lIGhhcyBz
ZXQgMHgxOSB0byBtaWMsIHdoaWNoIG5lZWRzIHRvIGJlIHNldAp0byBoZWFkcGhvbmUgcGlu
IGluIG9yZGVyIHRvIHdvcmsgcHJvcGVybHkuCgpMaW5rOiBodHRwczovL2J1Z3ppbGxhLmtl
cm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIyMDgxNApTaWduZWQtb2ZmLWJ5OiBaaGFuZyBI
ZW5nIDx6aGFuZ2hlbmdAa3lsaW5vcy5jbj4KLS0tCiBzb3VuZC9oZGEvY29kZWNzL3JlYWx0
ZWsvYWxjNjYyLmMgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3NvdW5kL2hkYS9jb2RlY3MvcmVhbHRlay9hbGM2NjIuYyBi
L3NvdW5kL2hkYS9jb2RlY3MvcmVhbHRlay9hbGM2NjIuYwppbmRleCA1MDczMTY1ZDFmM2Mu
LjNhOTQzYWRmOTA4NyAxMDA2NDQKLS0tIGEvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2Fs
YzY2Mi5jCisrKyBiL3NvdW5kL2hkYS9jb2RlY3MvcmVhbHRlay9hbGM2NjIuYwpAQCAtMzEz
LDYgKzMxMyw3IEBAIGVudW0gewogCUFMQzg5N19GSVhVUF9IRUFEU0VUX01JQ19QSU4yLAog
CUFMQzg5N19GSVhVUF9VTklTX0gzQ19YNTAwUywKIAlBTEM4OTdfRklYVVBfSEVBRFNFVF9N
SUNfUElOMywKKwlBTEM4OTdfRklYVVBfSDYxME1fSFBfUElOLAogfTsKIAogc3RhdGljIGNv
bnN0IHN0cnVjdCBoZGFfZml4dXAgYWxjNjYyX2ZpeHVwc1tdID0gewpAQCAtNzY2LDYgKzc2
NywxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBhbGM2NjJfZml4dXBzW10g
PSB7CiAJCQl7IH0KIAkJfSwKIAl9LAorCVtBTEM4OTdfRklYVVBfSDYxME1fSFBfUElOXSA9
IHsKKwkJLnR5cGUgPSBIREFfRklYVVBfUElOUywKKwkJLnYucGlucyA9IChjb25zdCBzdHJ1
Y3QgaGRhX3BpbnRibFtdKSB7CisJCQl7IDB4MTksIDB4MDMyMTQwM2YgfSwgLyogSFAgb3V0
ICovCisJCQl7IH0KKwkJfSwKKwl9LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFf
cXVpcmsgYWxjNjYyX2ZpeHVwX3RibFtdID0gewpAQCAtODE1LDYgKzgyMyw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgaGRhX3F1aXJrIGFsYzY2Ml9maXh1cF90YmxbXSA9IHsKIAlTTkRf
UENJX1FVSVJLKDB4MTA0MywgMHg4NDY5LCAiQVNVUyBtb2JvIiwgQUxDNjYyX0ZJWFVQX05P
X0pBQ0tfREVURUNUKSwKIAlTTkRfUENJX1FVSVJLKDB4MTA1YiwgMHgwY2Q2LCAiRm94Y29u
biIsIEFMQzY2Ml9GSVhVUF9BU1VTX01PREUyKSwKIAlTTkRfUENJX1FVSVJLKDB4MTQ0ZCwg
MHhjMDUxLCAiU2Ftc3VuZyBSNzIwIiwgQUxDNjYyX0ZJWFVQX0lERUFQQUQpLAorCVNORF9Q
Q0lfUVVJUksoMHgxNDU4LCAweGExOTQsICJINjEwTSBIIFYyIEREUjQiLCBBTEM4OTdfRklY
VVBfSDYxME1fSFBfUElOKSwKIAlTTkRfUENJX1FVSVJLKDB4MTRjZCwgMHg1MDAzLCAiVVNJ
IiwgQUxDNjYyX0ZJWFVQX1VTSV9IRUFEU0VUX01PREUpLAogCVNORF9QQ0lfUVVJUksoMHgx
N2FhLCAweDEwMzYsICJMZW5vdm8gUDUyMCIsIEFMQzY2Ml9GSVhVUF9MRU5PVk9fTVVMVElf
Q09ERUNTKSwKIAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgxMDU3LCAiTGVub3ZvIFAzNjAi
LCBBTEM4OTdfRklYVVBfSEVBRFNFVF9NSUNfUElOKSwKLS0gCjIuMjUuMQoK

--------------RZz0yaV7VnHpT5U98udgZUIh--
