Received: from mail-200167.simplelogin.co (mail-200167.simplelogin.co [176.119.200.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCC9604D0
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 21:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=176.119.200.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708725390; cv=pass; b=ECQjHKKcByUhO7VNuytL2uE6c+c7QM9VNzp1lFYhueBo+Y/EEwnDr9UAcZNO7vqnJBJftnn78ARzyEXxvMTTu2cr7vXQUlYQ+6pnK2C4caL26SurpvQVAPy+F2jlvz5X5TQhLA8pBkcruKueDoYalh7yAzmnRUo25OTpSg48dL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708725390; c=relaxed/simple;
	bh=4VwRNU7bvlR5G2ONHZPdJAm5LLNMwWzEauFLdEorKIA=;
	h=MIME-Version:In-Reply-To:Date:Subject:Content-Type:From:To:Cc:
	 Message-ID:References; b=oqxSHflZxS6bzkfwr/vV5HLGkmwk7fXQPoQ20Wj/PJQaAnMEr7K82rHpxyh3OJ/8Mjc7PcAX74IGz2gR+b6Fg8V0mC4Wnt+LMHgInDOCD08Rwmh3HZmdCZTiuFhvvIVFV/FPVAGNH2NHloOtnXFh2U2Vv50Zx3OG+GXuSN1xPUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=willian.wang; spf=pass smtp.mailfrom=willian.wang; dkim=pass (1024-bit key) header.d=willian.wang header.i=@willian.wang header.b=JwptnxRF; arc=pass smtp.client-ip=176.119.200.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=willian.wang
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=willian.wang
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=willian.wang header.i=@willian.wang header.b="JwptnxRF"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1708725380;
	cv=none; b=eofOfR2hh6XuZY+6OGYsDHqZOgBDzG5dyKVplivTcImPnJ74bp0S7AzMnyrGIIc2/jMfc7xdK6Lodrmi8fF6D/YVerpS5STsCFkAiE95d4GPC7VfsDKRHHYw4TPMkGT32A5x0nwTM3NNQDlpuiTV+pMwIoajfqyTYP1KPmqDIzoIo6qFipQaYLUemaRelCx4zDnZ/gaygilQAIHb2LrHWxGIeN01qEmPxN2jvcINJx6D84RutT4R1PjjsfjuCKwLhaL2rVvxzIeSR2URavE29lDlPHGu9F5q+1E34lrfOa1+EH4qFh6ymu4zhgIg7Pkru0FFpkB0Av/g1Yx4EfkuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1708725380; c=relaxed/simple;
	bh=4VwRNU7bvlR5G2ONHZPdJAm5LLNMwWzEauFLdEorKIA=;
	h=In-Reply-To:Date:Subject:From:To:Cc:References; b=HTdjW3ZKdkDFM2UDapHUOw7+UZD7H4dbSi93qKQqj5tsh5HT4t/Xp47g4Zk5wGRHyFXI7OGFe4Ncdrin3np+h3afEkfbuRKPwFIQa0FdjUv+evKZsz6rToOKcyvdOyX00l+JVH0UMYxZ90aXp04xUipNYA7BaKrFXuQvUeMDKbu6Mv8nOlus+zE7DFCIK76Itr3GwORx/HzEBREXwyaB0/XbAPcMUEuZq2UC0jZyKEMsG/rtHRbSA36RY47flmC5sPp0HX7Pl1g0vd51WslAYwxp0SP5WJ6dsOsbn1d1mzNW2VWt67xxO6f6XdVYsr81yLMg9dNeO0FRZverGz2xIQ==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=willian.wang;
	s=dkim; t=1708725380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jXWWYApkZkg0NmnI8UnCjMNmyyL34tP1Aeiy3Rd+9b8=;
	b=JwptnxRFxkL/4cwvLl5nw8uU/bzf+0hZJZRYec6wCP4M3fmSpFcUScKPiyY3nwhxG2HJRJ
	ybiwnmajEBVNXy7sTY5WwUZjRCFELA5WEI1x9GAVGOPdWtRqDlURzCB1+lHMPM/L7WqkIj
	2TuxS77JfiFlugb1IL1P3yJjjJY2u4A=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <4786204abbd7acadd27a8cf487be91e524eaa444.camel@irl.hu>
Date: Fri, 23 Feb 2024 18:55:40 -0300
Subject: Re: PCI SSID and Codec SSID collision?
Content-Type: multipart/mixed; boundary="0000000000000e44c4061213a1bd"
Content-Transfer-Encoding: 7bit
From: Willian Wang <kernel@willian.wang>
To: Gergo Koteles <soyer@irl.hu>
Cc: tiwai@suse.de,alsa-devel@alsa-project.org,linux-sound@vger.kernel.org
Message-ID: <170872537997.7.10064075757981956606.273437309@willian.wang>
References: <170869932581.7.612391552809015627.273152461@willian.wang>
 <4786204abbd7acadd27a8cf487be91e524eaa444.camel@irl.hu>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 273437309
X-SimpleLogin-Want-Signing: yes

--0000000000000e44c4061213a1bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here is my attempt. I hope it doesn't break with the DuetITL mode, I
chose to create a special case for it instead of otherwise because
there is an european version of the 14IRP8 with different codec SSID
(https://bugzilla.kernel.org/show_bug.cgi?id=3D208555#c778, 0x17aa38bf
vs 0x17aa38be).

This is my first time contributing with a commit and I'm not sure if I
did everything correctly so please let me know. I also don't know if I
should send it to a specific email with you as CC or something like
that.

On Fri, Feb 23, 2024 at 12:10=E2=80=AFPM Gergo Koteles
<soyer@irl.hu> wrote:
>
> Hi Willian,
>
> On Fri, 2024-02-23 at 11:41 -0300, Willian Wang wrote:
> > Hi, I'm curious about the reasons for the fixup table to be the same
> > for PCI and Codec SSIDs and if the PCI SSID is usually more important
> > for it to be checked before the Codec. Anyway, would a simple
> > conditional statement to match these exact PCI and Codec SSID to set
> > the fixup manually be enough? There seems to already exist a manual
> > fix for TX300 and ROG Strix G17 there (not the same kind of fix and
> > with a FIXME comment, though). I have this exact laptop model and
> > would like to try to contribute to the code if it's not too
> > complicated.
> >
>
> I think it could be simple, like this function:
> alc298_fixup_lenovo_c940_duet7
>
> Feel free to contribute. Easier for you to test.
>
> This can help:
> The output of DuetITL 2021 amixer:
> https://linux-hardware.org/?probe=3D19173612af&log=3Damixer
>
>
> Regards,
> Gergo
>

--0000000000000e44c4061213a1bd
Content-Type: text/x-patch; charset="US-ASCII";
	name="0001-ALSA-hda-realtek-Add-special-fixup-for-Lenovo-14IRP8.patch"
Content-Disposition: attachment;
	filename="0001-ALSA-hda-realtek-Add-special-fixup-for-Lenovo-14IRP8.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lsz6xta20>
X-Attachment-Id: f_lsz6xta20

RnJvbSA5Yjg4YzI3NGU2Yzc5MzNiNGQwNTg0ODkyODI5NmRlNjE5MDVmNDkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBXaWxsaWFuIFdhbmcgPGdpdEB3aWxsaWFuLndhbmc+CkRhdGU6
IEZyaSwgMjMgRmViIDIwMjQgMTg6Mzg6NDggLTAzMDAKU3ViamVjdDogW1BBVENIXSBBTFNBOiBo
ZGEvcmVhbHRlazogQWRkIHNwZWNpYWwgZml4dXAgZm9yIExlbm92byAxNElSUDgKCkxlbm92byBT
bGltL1lvZ2EgUHJvIDkgMTRJUlA4IHJlcXVpcmVzIGEgc3BlY2lhbCBmaXh1cCBiZWNhdXNlIHRo
ZXJlIGlzCmEgY29sbGlzaW9uIG9mIGl0cyBQQ0kgU1NJRCAoMTdhYTozODAyKSB3aXRoIExlbm92
byBZb2dhIER1ZXRJVEwgMjAyMQpjb2RlYyBTU0lELgoKTGluazogaHR0cHM6Ly9idWd6aWxsYS5r
ZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDg1NTUKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsL2Q1YjQyZTQ4MzU2NmEzODE1ZDIyOTI3MGFiZDY2ODEzMWEwZDlmM2EuY2FtZWxA
aXJsLmh1ClNpZ25lZC1vZmYtYnk6IFdpbGxpYW4gV2FuZyA8Z2l0QHdpbGxpYW4ud2FuZz4KLS0t
CiBzb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRh
L3BhdGNoX3JlYWx0ZWsuYwppbmRleCAwZWMxMzEyYmZmZDUuLmFhMTY5NDRkNWMxMSAxMDA2NDQK
LS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9w
YXRjaF9yZWFsdGVrLmMKQEAgLTc0NDQsNiArNzQ0NCw3IEBAIGVudW0gewogCUFMQzI4N19GSVhV
UF9MRUdJT05fMTVJTUhHMDVfQVVUT01VVEUsCiAJQUxDMjg3X0ZJWFVQX1lPR0E3XzE0SVRMX1NQ
RUFLRVJTLAogCUFMQzI5OF9GSVhVUF9MRU5PVk9fQzk0MF9EVUVUNywKKwlBTEMyODdfRklYVVBf
TEVOT1ZPXzE0SVJQOF9EVUVUSVRMLAogCUFMQzI4N19GSVhVUF8xM1NfR0VOMl9TUEVBS0VSUywK
IAlBTEMyNTZfRklYVVBfU0VUX0NPRUZfREVGQVVMVFMsCiAJQUxDMjU2X0ZJWFVQX1NZU1RFTTc2
X01JQ19OT19QUkVTRU5DRSwKQEAgLTc0OTUsNiArNzQ5NiwyNCBAQCBzdGF0aWMgdm9pZCBhbGMy
OThfZml4dXBfbGVub3ZvX2M5NDBfZHVldDcoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCiAJX19z
bmRfaGRhX2FwcGx5X2ZpeHVwKGNvZGVjLCBpZCwgYWN0aW9uLCAwKTsKIH0KIAorLyogQSBzcGVj
aWFsIGZpeHVwIGZvciBMZW5vdm8gU2xpbS9Zb2dhIFBybyA5IDE0SVJQOCBhbmQgWW9nYSBEdWV0
SVRMIDIwMjE7CisgKiAxNElSUDggUENJIFNTSUQgd2lsbCBtaXN0YWtlbmx5IGJlIG1hdGNoZWQg
d2l0aCB0aGUgRHVldElUTCBjb2RlYyBTU0lELAorICogc28gd2UgbmVlZCB0byBhcHBseSBkaWZm
ZXJlbnQgZml4dXAgb24gdGhpcyBjYXNlLiBJZiBpdCB3ZXJlbid0IGZvciB0aGUKKyAqIFBDSSBT
U0lELCAxNElSUDggd291bGQgYmUgbWF0Y2hlZCB3aXRoIHRoZSBjb3JyZWN0IGNvZGVjIFNTSUQK
KyAqLworc3RhdGljIHZvaWQgYWxjMjg3X2ZpeHVwX2xlbm92b18xNElycDhfZHVldGl0bChzdHJ1
Y3QgaGRhX2NvZGVjICpjb2RlYywKKwkJCQkJICAgICAgY29uc3Qgc3RydWN0IGhkYV9maXh1cCAq
Zml4LAorCQkJCQkgICAgICBpbnQgYWN0aW9uKQoreworCWludCBpZDsKKworCWlmIChjb2RlYy0+
Y29yZS5zdWJzeXN0ZW1faWQgPT0gMHgxN2FhMzgwMikKKwkJaWQgPSBBTEMyODdfRklYVVBfWU9H
QTdfMTRJVExfU1BFQUtFUlM7IC8qIER1ZXRJVEwgKi8KKwllbHNlCisJCWlkID0gQUxDMjg3X0ZJ
WFVQX1RBUzI3ODFfSTJDOyAvKiAxNElSUDggKi8KKwlfX3NuZF9oZGFfYXBwbHlfZml4dXAoY29k
ZWMsIGlkLCBhY3Rpb24sIDApOworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBh
bGMyNjlfZml4dXBzW10gPSB7CiAJW0FMQzI2OV9GSVhVUF9HUElPMl0gPSB7CiAJCS50eXBlID0g
SERBX0ZJWFVQX0ZVTkMsCkBAIC05Mzc5LDYgKzkzOTgsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBoZGFfZml4dXAgYWxjMjY5X2ZpeHVwc1tdID0gewogCQkudHlwZSA9IEhEQV9GSVhVUF9GVU5D
LAogCQkudi5mdW5jID0gYWxjMjk4X2ZpeHVwX2xlbm92b19jOTQwX2R1ZXQ3LAogCX0sCisJW0FM
QzI4N19GSVhVUF9MRU5PVk9fMTRJUlA4X0RVRVRJVExdID0geworCQkudHlwZSA9IEhEQV9GSVhV
UF9GVU5DLAorCQkudi5mdW5jID0gYWxjMjg3X2ZpeHVwX2xlbm92b18xNElycDhfZHVldGl0bCwK
Kwl9LAogCVtBTEMyODdfRklYVVBfMTNTX0dFTjJfU1BFQUtFUlNdID0gewogCQkudHlwZSA9IEhE
QV9GSVhVUF9WRVJCUywKIAkJLnYudmVyYnMgPSAoY29uc3Qgc3RydWN0IGhkYV92ZXJiW10pIHsK
QEAgLTEwMjQ3LDcgKzEwMjcwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJr
IGFsYzI2OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzMWFmLCAi
VGhpbmtDZW50cmUgU3RhdGlvbiIsIEFMQzYyM19GSVhVUF9MRU5PVk9fVEhJTktTVEFUSU9OX1Az
NDApLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDMzNGIsICJMZW5vdm8gVGhpbmtDZW50cmUg
TTcwIEdlbjUiLCBBTEMyODNfRklYVVBfSEVBRFNFVF9NSUMpLAogCVNORF9QQ0lfUVVJUksoMHgx
N2FhLCAweDM4MDEsICJMZW5vdm8gWW9nYTkgMTRJQVA3IiwgQUxDMjg3X0ZJWFVQX1lPR0E5XzE0
SUFQN19CQVNTX1NQS19QSU4pLAotCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDM4MDIsICJMZW5v
dm8gWW9nYSBEdWV0SVRMIDIwMjEiLCBBTEMyODdfRklYVVBfWU9HQTdfMTRJVExfU1BFQUtFUlMp
LAorCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDM4MDIsICJMZW5vdm8gWW9nYSBEdWV0SVRMIDIw
MjEiLCBBTEMyODdfRklYVVBfTEVOT1ZPXzE0SVJQOF9EVUVUSVRMKSwKIAlTTkRfUENJX1FVSVJL
KDB4MTdhYSwgMHgzODEzLCAiTGVnaW9uIDdpIDE1SU1IRzA1IiwgQUxDMjg3X0ZJWFVQX0xFR0lP
Tl8xNUlNSEcwNV9TUEVBS0VSUyksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzgxOCwgIkxl
bm92byBDOTQwIC8gWW9nYSBEdWV0IDciLCBBTEMyOThfRklYVVBfTEVOT1ZPX0M5NDBfRFVFVDcp
LAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDM4MTksICJMZW5vdm8gMTNzIEdlbjIgSVRMIiwg
QUxDMjg3X0ZJWFVQXzEzU19HRU4yX1NQRUFLRVJTKSwKLS0gCjIuNDMuMgoK
--0000000000000e44c4061213a1bd--

