Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AB637701A
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778405936; cv=none; b=fe0hNBj9jzbj+yF9p9GDJwY6d2JMcURdBPurR0skdLAx7RWTbDdmMGKG/aLRIqIJy66lYc9RqcHeYSEsWUPuZrSdjNQzmQLnLUIAZtLejO8QT0QSILcukQ/59y91nacT8ZEykpVXUsrnOw8dZkueQLg4GPhAjUeOtPyNQyv40is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778405936; c=relaxed/simple;
	bh=PVi+2MaTW4F58HbY/LzcffuLVi8iEiq0tF4trAhu0Cs=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=hT5O88L6Y7zSrXz/7aIDqkZ7Ti75xJ1P7XXFAQlgWd1S/Lj60TDWDW9QcwgyewxLv/WX8a5v6qp1UHQ6IuaTRI9TZqVVoAxVQ18OzGhPfc2fCXrqsNKt3ZQDckC2MUD4UBv0/En7R0XafAyL6cgnT99x/LUnhlTu+oDKpbaAtdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGQmsF0J; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGQmsF0J"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso19150195e9.3
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 02:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778405932; x=1779010732; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PVi+2MaTW4F58HbY/LzcffuLVi8iEiq0tF4trAhu0Cs=;
        b=JGQmsF0JltjQwtXIPDIyu2te6feb0UH45psQbsBtOMLyBWmxM7M1o97flOZUn1asXq
         NFT9jm3ZTtHDiUeMXi4U6Wbnbl8PQbStvzsrRwR+1Iq/J5eTehYhwT7JReMoPIM1FY4f
         mnxzreTCpRE6nTz9UunQk7FSnV33ZBumaeIs0RsHHV+Rcb8eFFVwzO3Bei628WX+kuqO
         jRgel9Q98kN0CqxivTQNgpT9xvxb41zcuXlBeWiqwHKm10oyegSAWibXApVah43yVATQ
         icX6oXX9Xcnd8lDoW34cqa201S4TE1bH5y9TMy8u0LwIaf+FMLMpUrQJ9uEvY+piA0KJ
         lhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778405932; x=1779010732;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVi+2MaTW4F58HbY/LzcffuLVi8iEiq0tF4trAhu0Cs=;
        b=dvWs95Ls6Q3kHKGQ916eu+56VrKEbhKLyjnWzccdOuIlXrwTRfdtRgAiXvj/tz8NA/
         7wC2gb9M1MzvLa+9OivgrNDL9yGs/GqrnWgDl55rJKjI1HGcRHMVRQrf7N4Q+XbSEX/o
         NYXge/9vocknxukRjdtiD06DsynJQY/3zpLELkSv7iiFfG94lU7synDgKv4x/JQp/kcA
         9hYtGYiJbX9/ddEdzXELXyG65D3O8vD6cs/Y1rvgsFaCb6QczVLY809aISMSzsON2h9Y
         B0VWnyj7ZfnpQ/WFgS0SxCRIClfhoWLKndnefkbtkCoblYlqFZP4szGEpbsZSbnLsGwI
         TMGA==
X-Gm-Message-State: AOJu0YzWRNJTEhfXSjhFiBslKogqHa1EZtxhKX75i5N8waed8gmI43v+
	7SzhniDInbvvv7cyJEDmzfNVR7/WvrKxkojU5aPFbbscsZ7Ud11Zq6hxVqfz5A==
X-Gm-Gg: Acq92OHkEL5A9jxDdXLSNkOBw0oDgYpfY8vdIdjJE5M8KhKfedzSeywjkT6ypYbV7o9
	sOGktAt6ST5T72bBRMcgztKXMCy/sW8KnAZZvWfsM+FlxG81b1/HtTb4RDniW6If+dkvRv1uwII
	mn0zesGxIdsxluvlBWSZzr6yOWTzRn+4ea1x7zIElnzkuPMEOfG6N6iGu3ZVWMtcOBpnXa6AYmi
	TmYDv9wzkhJrd8fy8Oamy8tf/LXmbFMH7Wbz/phQXxVOWcWOT44jBCC37b878RMeHxnm6EZU6Qv
	z5LreCj0q1gSCSVAww+CCerFgI3rk56hRP4YWcjnNcJan3VDmPyyYthXmWMqP4q6OH7e7d0zpdv
	32o+o27zGzOhuPBhmK82o0iHxxkV37S6iuSmut5We573S2bLfyRDqgZ6DIH9DF5vZR0/p4HPtq9
	LJdW6HsYYWFusc8sH9adMo2fyNEMhNmOoZLQ==
X-Received: by 2002:a05:600c:46d2:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-48e51f32aebmr285283475e9.16.1778405931428;
        Sun, 10 May 2026 02:38:51 -0700 (PDT)
Received: from [192.168.0.5] ([151.67.112.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0c70sm116409995e9.6.2026.05.10.02.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 02:38:50 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------oeqwX7KwX9r1Q5cpL8SX3UGP"
Message-ID: <a1dd5dfd-8678-4dd9-b6af-68a1e078168a@gmail.com>
Date: Sun, 10 May 2026 11:38:49 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Takashi Iwai ` <tiwai@suse.com>, Jaroslav Kysela ` <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org
From: "eziogale@gmail.com" <eziogale@gmail.com>
Subject: ca0132: add generic parser fallback for broken DSP path

This is a multi-part message in MIME format.
--------------oeqwX7KwX9r1Q5cpL8SX3UGP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Some CA0132 implementations (e.g. Gigabyte GA-Z170X-Gaming G1)
produce white noise when using the DSP firmware path. Add a
QUIRK_GENERIC path that uses the standard HDA generic parser
instead, with custom pin configs that disable the broken auto-mute
from HP jack detection.

Also applies VREF_50 on the mic pin and adds an init_hook for
suspend/resume stability.

Kernel version: 6.18.24
The PCI SSID this was tested on: `1458:a046`
it's been tested with PulseAudio and speaker-test
That the DSP path (QUIRK_SBZ) remains unchanged for cards that work with it.

Thanks


--------------oeqwX7KwX9r1Q5cpL8SX3UGP
Content-Type: text/x-patch; charset=UTF-8; name="ca0132-generic-parser.patch"
Content-Disposition: attachment; filename="ca0132-generic-parser.patch"
Content-Transfer-Encoding: base64

LS0tIC9ob21lL2V6aW8vdG1wL2tlcm5lbC9saW51eC02LjE4LjI0L3NvdW5kL2hkYS9jb2Rl
Y3MvY2EwMTMyLmMuMAkyMDI2LTA1LTAyIDA5OjE5OjIxLjIxNzEzNzE1OCArMDIwMAorKysg
L2hvbWUvZXppby90bXAva2VybmVsL2xpbnV4LTYuMTguMjQvc291bmQvaGRhL2NvZGVjcy9j
YTAxMzIuYwkyMDI2LTA1LTEwIDExOjIxOjQxLjkzMzM1NTgyNSArMDIwMApAQCAtMjQsNiAr
MjQsNyBAQAogI2luY2x1ZGUgImhkYV9sb2NhbC5oIgogI2luY2x1ZGUgImhkYV9hdXRvX3Bh
cnNlci5oIgogI2luY2x1ZGUgImhkYV9qYWNrLmgiCisjaW5jbHVkZSAiZ2VuZXJpYy5oIgog
CiAjaW5jbHVkZSAiY2EwMTMyX3JlZ3MuaCIKIApAQCAtMTA2MCw2ICsxMDYxLDggQEAKICAq
LwogCiBzdHJ1Y3QgY2EwMTMyX3NwZWMgeworCXN0cnVjdCBoZGFfZ2VuX3NwZWMgZ2VuOwor
CiAJY29uc3Qgc3RydWN0IHNuZF9rY29udHJvbF9uZXcgKm1peGVyc1s1XTsKIAl1bnNpZ25l
ZCBpbnQgbnVtX21peGVyczsKIAljb25zdCBzdHJ1Y3QgaGRhX3ZlcmIgKmJhc2VfaW5pdF92
ZXJiczsKQEAgLTExNzUsNiArMTE3OCw3IEBACiAJUVVJUktfQUU1LAogCVFVSVJLX0FFNywK
IAlRVUlSS19OT05FID0gSERBX0ZJWFVQX0lEX05PVF9TRVQsCisJUVVJUktfR0VORVJJQywK
IH07CiAKICNpZmRlZiBDT05GSUdfUENJCkBAIC0xMzA0LDYgKzEzMDgsNyBAQAogCVNORF9Q
Q0lfUVVJUksoMHgxNDU4LCAweEEwMTYsICJSZWNvbjNEaSIsIFFVSVJLX1IzREkpLAogCVNO
RF9QQ0lfUVVJUksoMHgxNDU4LCAweEEwMjYsICJHaWdhYnl0ZSBHMS5TbmlwZXIgWjk3Iiwg
UVVJUktfUjNESSksCiAJU05EX1BDSV9RVUlSSygweDE0NTgsIDB4QTAzNiwgIkdpZ2FieXRl
IEdBLVoxNzBYLUdhbWluZyA3IiwgUVVJUktfUjNESSksCisJU05EX1BDSV9RVUlSSygweDE0
NTgsIDB4QTA0NiwgIkdpZ2FieXRlIEdBLVoxNzBYLUdhbWluZyBHMSIsIFFVSVJLX0dFTkVS
SUMpLAogCVNORF9QQ0lfUVVJUksoMHgzODQyLCAweDEwMzgsICJFVkdBIFg5OSBDbGFzc2lm
aWVkIiwgUVVJUktfUjNESSksCiAJU05EX1BDSV9RVUlSSygweDM4NDIsIDB4MTA0YiwgIkVW
R0EgWDI5OSBEYXJrIiwgUVVJUktfUjNESSksCiAJU05EX1BDSV9RVUlSSygweDM4NDIsIDB4
MTA1NSwgIkVWR0EgWjM5MCBEQVJLIiwgUVVJUktfUjNESSksCkBAIC0xMzI1LDExICsxMzMw
LDEzIEBACiAJeyAuaWQgPSBRVUlSS19SM0QsIC5uYW1lID0gInIzZCIgfSwKIAl7IC5pZCA9
IFFVSVJLX0FFNSwgLm5hbWUgPSAiYWU1IiB9LAogCXsgLmlkID0gUVVJUktfQUU3LCAubmFt
ZSA9ICJhZTciIH0sCisJeyAuaWQgPSBRVUlSS19HRU5FUklDLCAubmFtZSA9ICJnZW5lcmlj
IiB9LAogCXt9CiB9OwogCiAvKiBPdXRwdXQgc2VsZWN0aW9uIHF1aXJrIGluZm8gc3RydWN0
dXJlcy4gKi8KICNkZWZpbmUgTUFYX1FVSVJLX01NSU9fR1BJT19TRVRfVkFMUyAzCisKICNk
ZWZpbmUgTUFYX1FVSVJLX1NDUF9TRVRfVkFMUyAyCiBzdHJ1Y3QgY2EwMTMyX2FsdF9vdXRf
c2V0X2luZm8gewogCXVuc2lnbmVkIGludCBkYWMycG9ydDsgLyogUGFyYW1JRCAweDBkIHZh
bHVlLiAqLwpAQCAtOTgyMSw3ICs5ODI4LDcgQEAKIHN0YXRpYyBpbnQgY2EwMTMyX3ByZXBh
cmVfdmVyYnMoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiB7CiAvKiBWZXJicyArIHRlcm1p
bmF0b3IgKGFuIGVtcHR5IGVsZW1lbnQpICovCi0jZGVmaW5lIE5VTV9TUEVDX1ZFUkJTIDIK
KyNkZWZpbmUgTlVNX1NQRUNfVkVSQlMgMwogCXN0cnVjdCBjYTAxMzJfc3BlYyAqc3BlYyA9
IGNvZGVjLT5zcGVjOwogCiAJc3BlYy0+Y2hpcF9pbml0X3ZlcmJzID0gY2EwMTMyX2luaXRf
dmVyYnMwOwpAQCAtOTg0Miw2ICs5ODQ5LDExIEBACiAJc3BlYy0+c3BlY19pbml0X3ZlcmJz
WzBdLnBhcmFtID0gMHg3OEQ7CiAJc3BlYy0+c3BlY19pbml0X3ZlcmJzWzBdLnZlcmIgPSAw
eDAwOwogCisJLyogVlJFRl81MCBmb3IgbWljIHBpbiAqLworCXNwZWMtPnNwZWNfaW5pdF92
ZXJic1sxXS5uaWQgPSAweDEyOworCXNwZWMtPnNwZWNfaW5pdF92ZXJic1sxXS52ZXJiID0g
QUNfVkVSQl9TRVRfUElOX1dJREdFVF9DT05UUk9MOworCXNwZWMtPnNwZWNfaW5pdF92ZXJi
c1sxXS5wYXJhbSA9IDB4MjE7IC8qIElOIHwgVlJFRl81MCAqLworCiAJLyogUHJldmlvdXNs
eSBjb21tZW50ZWQgY29uZmlndXJhdGlvbiAqLwogCS8qCiAJc3BlYy0+c3BlY19pbml0X3Zl
cmJzWzJdLm5pZCA9IDB4MGI7CkBAIC05ODgyLDEwICs5ODk0LDIwIEBACiAJfQogfQogCitz
dGF0aWMgdm9pZCBjYTAxMzJfZ2VuZXJpY19pbml0X2hvb2soc3RydWN0IGhkYV9jb2RlYyAq
Y29kZWMpCit7CisJc3RydWN0IGNhMDEzMl9zcGVjICpzcGVjID0gY29kZWMtPnNwZWM7CisJ
c25kX2hkYV9zZXF1ZW5jZV93cml0ZShjb2RlYywgc3BlYy0+c3BlY19pbml0X3ZlcmJzKTsK
K30KKwogc3RhdGljIHZvaWQgY2EwMTMyX2NvZGVjX3JlbW92ZShzdHJ1Y3QgaGRhX2NvZGVj
ICpjb2RlYykKIHsKIAlzdHJ1Y3QgY2EwMTMyX3NwZWMgKnNwZWMgPSBjb2RlYy0+c3BlYzsK
IAorCWlmIChjYTAxMzJfcXVpcmsoc3BlYykgPT0gUVVJUktfR0VORVJJQykgeworCQlzbmRf
aGRhX2dlbl9yZW1vdmUoY29kZWMpOworCQlyZXR1cm47CisJfQogCWlmIChjYTAxMzJfcXVp
cmsoc3BlYykgPT0gUVVJUktfWlhSX0RCUFJPKQogCQlyZXR1cm4gZGJwcm9fZnJlZShjb2Rl
Yyk7CiAJZWxzZQpAQCAtOTkwNiwxNCArOTkyOCw1NSBAQAogCWNvZGVjLT5zcGVjID0gc3Bl
YzsKIAlzcGVjLT5jb2RlYyA9IGNvZGVjOwogCisJLyogVGhlc2UgbXVzdCBiZSBzZXQgYmVm
b3JlIGFueSBwYXRoIGlzIHRha2VuICovCisJY29kZWMtPnBjbV9mb3JtYXRfZmlyc3QgPSAx
OworCWNvZGVjLT5ub19zdGlja3lfc3RyZWFtID0gMTsKKwogCS8qIERldGVjdCBjb2RlYyBx
dWlyayAqLwogCXNuZF9oZGFfcGlja19maXh1cChjb2RlYywgY2EwMTMyX3F1aXJrX21vZGVs
cywgY2EwMTMyX3F1aXJrcywgTlVMTCk7CiAJaWYgKGNhMDEzMl9xdWlyayhzcGVjKSA9PSBR
VUlSS19TQlopCiAJCXNiel9kZXRlY3RfcXVpcmsoY29kZWMpOwogCi0JY29kZWMtPnBjbV9m
b3JtYXRfZmlyc3QgPSAxOwotCWNvZGVjLT5ub19zdGlja3lfc3RyZWFtID0gMTsKKwlpZiAo
Y2EwMTMyX3F1aXJrKHNwZWMpID09IFFVSVJLX0dFTkVSSUMpIHsKKwkJc3RydWN0IGF1dG9f
cGluX2NmZyAqY2ZnID0gJnNwZWMtPmdlbi5hdXRvY2ZnOworCisJCXNuZF9oZGFfZ2VuX3Nw
ZWNfaW5pdCgmc3BlYy0+Z2VuKTsKKworCQlzbmRfaGRhX2FwcGx5X3BpbmNmZ3MoY29kZWMs
CisJCQkoY29uc3Qgc3RydWN0IGhkYV9waW50YmxbXSkgeworCQkJCXsgMHgwYiwgMHg0MTAx
NDExMSB9LAorCQkJCXsgMHgwYywgMHg0MTQ1MjBmMCB9LCAvKiBTUERJRiBvdXQgKi8KKwkJ
CQl7IDB4MGQsIDB4MDEwMTQwMTAgfSwgLyogbGluZW91dCAqLworCQkJCXsgMHgwZSwgMHg0
MWM1MDFmMCB9LAorCQkJCXsgMHgwZiwgMHg0MTExMTFmMCB9LCAvKiBkaXNhYmxlZCAqLwor
CQkJCXsgMHgxMCwgMHg0MTExMTFmMCB9LCAvKiBkaXNhYmxlZCAqLworCQkJCXsgMHgxMSwg
MHg0MTAxMjAxNCB9LAorCQkJCXsgMHgxMiwgMHgzN2E3OTBmMCB9LCAvKiBtaWMgKi8KKwkJ
CQl7IDB4MTMsIDB4NzdhNzAxZjAgfSwKKwkJCQl7IDB4MTgsIDB4NTAwMDAwZjAgfSwKKwkJ
CQl7fQorCQkJfSk7CiAKKwkJY2EwMTMyX2luaXRfY2hpcChjb2RlYyk7CisKKwkJZXJyID0g
Y2EwMTMyX3ByZXBhcmVfdmVyYnMoY29kZWMpOworCQlpZiAoZXJyIDwgMCkKKwkJCWdvdG8g
ZXJyb3I7CisKKwkJZXJyID0gc25kX2hkYV9wYXJzZV9waW5fZGVmX2NvbmZpZyhjb2RlYywg
Y2ZnLCBOVUxMKTsKKwkJaWYgKGVyciA8IDApCisJCQlnb3RvIGVycm9yOworCQllcnIgPSBz
bmRfaGRhX2dlbl9wYXJzZV9hdXRvX2NvbmZpZyhjb2RlYywgY2ZnKTsKKwkJaWYgKGVyciA8
IDApCisJCQlnb3RvIGVycm9yOworCisJCXNwZWMtPmdlbi5pbml0X2hvb2sgPSBjYTAxMzJf
Z2VuZXJpY19pbml0X2hvb2s7CisJCXNwZWMtPmdlbi5hdXRvbXV0ZV9zcGVha2VyID0gMDsK
KwkJc3BlYy0+Z2VuLmF1dG9tdXRlX2xvID0gMDsKKworCQlzbmRfaGRhX3NlcXVlbmNlX3dy
aXRlKGNvZGVjLCBzcGVjLT5zcGVjX2luaXRfdmVyYnMpOworCQlyZXR1cm4gMDsKKwl9CiAK
IAlzcGVjLT5kc3Bfc3RhdGUgPSBEU1BfRE9XTkxPQURfSU5JVDsKIAlzcGVjLT5udW1fbWl4
ZXJzID0gMTsKQEAgLTEwMDE0LDYgKzEwMDc3LDEwIEBACiB7CiAJc3RydWN0IGNhMDEzMl9z
cGVjICpzcGVjID0gY29kZWMtPnNwZWM7CiAKKwlpZiAoY2EwMTMyX3F1aXJrKHNwZWMpID09
IFFVSVJLX0dFTkVSSUMpIHsKKwkJcmV0dXJuIHNuZF9oZGFfZ2VuX2J1aWxkX2NvbnRyb2xz
KGNvZGVjKTsKKwl9CisKIAlpZiAoY2EwMTMyX3F1aXJrKHNwZWMpID09IFFVSVJLX1pYUl9E
QlBSTykKIAkJcmV0dXJuIGRicHJvX2J1aWxkX2NvbnRyb2xzKGNvZGVjKTsKIAllbHNlCkBA
IC0xMDAyNCw2ICsxMDA5MSwxMCBAQAogewogCXN0cnVjdCBjYTAxMzJfc3BlYyAqc3BlYyA9
IGNvZGVjLT5zcGVjOwogCisJaWYgKGNhMDEzMl9xdWlyayhzcGVjKSA9PSBRVUlSS19HRU5F
UklDKSB7CisJCXJldHVybiBzbmRfaGRhX2dlbl9idWlsZF9wY21zKGNvZGVjKTsKKwl9CisK
IAlpZiAoY2EwMTMyX3F1aXJrKHNwZWMpID09IFFVSVJLX1pYUl9EQlBSTykKIAkJcmV0dXJu
IGRicHJvX2J1aWxkX3BjbXMoY29kZWMpOwogCWVsc2UKQEAgLTEwMDM0LDYgKzEwMTA1LDEw
IEBACiB7CiAJc3RydWN0IGNhMDEzMl9zcGVjICpzcGVjID0gY29kZWMtPnNwZWM7CiAKKwlp
ZiAoY2EwMTMyX3F1aXJrKHNwZWMpID09IFFVSVJLX0dFTkVSSUMpIHsKKwkJcmV0dXJuIHNu
ZF9oZGFfZ2VuX2luaXQoY29kZWMpOworCX0KKwogCWlmIChjYTAxMzJfcXVpcmsoc3BlYykg
PT0gUVVJUktfWlhSX0RCUFJPKQogCQlyZXR1cm4gZGJwcm9faW5pdChjb2RlYyk7CiAJZWxz
ZQpAQCAtMTAwNDQsNiArMTAxMTksOSBAQAogewogCXN0cnVjdCBjYTAxMzJfc3BlYyAqc3Bl
YyA9IGNvZGVjLT5zcGVjOwogCisJaWYgKGNhMDEzMl9xdWlyayhzcGVjKSA9PSBRVUlSS19H
RU5FUklDKQorCQlyZXR1cm4gMDsKKwogCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmc3Bl
Yy0+dW5zb2xfaHBfd29yayk7CiAJcmV0dXJuIDA7CiB9Cg==

--------------oeqwX7KwX9r1Q5cpL8SX3UGP--
