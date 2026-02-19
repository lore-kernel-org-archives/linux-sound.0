Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0108F34CFBB
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 16:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771520130; cv=pass; b=ihppRGvByQFEW3ihEnZzdcn32Fe2dKCSQIK+o2yTxSOwCKj97ypY5bzX5x3kxe0yeVci2thhakmrSG3SOZPxhC9WFYpeTNpPUg8eoA6xlKbapSJfwVGPFL4H10J14jhwVyHdR7pWseKuBH4etyIQkdHCOPS9HuEhRj/ZuUOkyt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771520130; c=relaxed/simple;
	bh=fnWYXmcOuxUXDrP0JfTkiHghTLvUFQQ50yPS9GmwgUo=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=I75M2trw+/Yxc5MfkcMxNMzIT7hq9NI/s/SmTU9LLYMIun795E1pW28o8JNx2YRjn+U7XLaTmZJzd/hYzK+D9uiphNGqJogqj+cXC9ULhO7ip1F0+1Qnm5EM0hTPtCrR0tCMJCzJRBEZ6zfYuLFmmzAltgRrTMopqX8z+Ll2EIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=zPNuIyx4; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="zPNuIyx4"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-794911acb04so11914977b3.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 08:55:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771520128; cv=none;
        d=google.com; s=arc-20240605;
        b=K7OSVcan+dIPl3ALf52AeRVwthFWn2OX+GKsoRr+5HH1zQWJCiYqYS3AW4i7VfUpIP
         bd1x2kpoVjDG/aPEIeCQau1sfpisUtWTB+h0XsWtvHqwfQvdkTP9hCULz7Jy0lCOSS9e
         wKiZkPWphkoohuUc3vCDmnFA4Sm3MGj8seQUF+1Ar93By8VeHba1NUXeOcQUWYfET+h8
         rlV+KZPA9H0ssihiPYTAQ5hL+qd0mkBYX9e8hxpEkXeWj7EdHVZt0sI9m2mHc2cL/DLT
         BDEa2UQwCPomnhIP0gu1uqV4IS6fahmUumn3I/j1sxlVnDXncHQuTu6oJMz4+c3zExnG
         rqKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=fnWYXmcOuxUXDrP0JfTkiHghTLvUFQQ50yPS9GmwgUo=;
        fh=dhjmmy/MFrxaB9lZf4NPtksLe2368t2BYRQhhlC7BaY=;
        b=RqAd9mjuAagQIY6jbjh4nZ35y//hAiz66GYf67HtO4v5lZlhIoztHzhn42YPreI6mJ
         zEyHwpkAPS804Z+Wn3OWO0t8AFPFnnwS6w0+b0V5dpeXL3AgI6PkfbzEUd3vXaCW3nk4
         uJGoEiNS5Wc3XIfrdZ9pqlr69eUGFIE/378Oopjq6H601jep9VPS2YEIl8A6Fhdu1dz7
         FWKTPbxED4hVOmOz+foxRcc+e39dGDpotApDaUtZQbUw3uco1PhIEM6t4u/APGoWcL8w
         3cxm9c4uGuRFwx4crKYFOvqZ92NakPtBnQNj7n9C76fpMRqGOvi2RUd/U2wKNI6LpEXa
         Bowg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1771520128; x=1772124928; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fnWYXmcOuxUXDrP0JfTkiHghTLvUFQQ50yPS9GmwgUo=;
        b=zPNuIyx4KairnlxWtr7H52Y65sVyEy/d8uYcch/z/NF/ZEP8y05Jj397KdBYxhhGhD
         lehbKe1vPEWsCKPet3lIUDYXGeGCrEuKlo0N9vokELg7ZtODmTzGC0LBdvLWYF30L7He
         FA2xm7/F32lNqZQISLJRGKYUzuYQgWEimOAI0IjLKcQKh1A4OdQpud7hNXd+bxH6m054
         hJajFn7OD8PyKr5v8PnEyBlrANVWh4shT7i0swDzCOOC41d9DfgBCBiq9VteDdpVSFsM
         XD0ETAEe3DMlTbSWRI4za0UFwD+2fk/7h9K7oF7mf7FBtVt+TizEIrPy1hjZdyA7KWuF
         2eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771520128; x=1772124928;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fnWYXmcOuxUXDrP0JfTkiHghTLvUFQQ50yPS9GmwgUo=;
        b=Ex7IVFyiX1J49LrEF2j7dTDywklCuBfah7m9vt0U7P3GYD77IwqnDX9EmjMr3rkW3n
         cOwlrDCxQYEerF7rxHtAG6UUfs+8VIl2Dmc/jAEe8+rsDSGg2a3qn68IeZExuT1G9ozl
         HT9vif1eE2qhGzROEBJEOExACwM0a/7JS7Wc2n9NKkvDmYPrMtbZazr6dCSDMjpo4gAb
         f/+D3B0mzCqNeDJ2VTaB0+kS1gkYFxRiZq50wNcebna4Na/8KagQtAtuZi5EmNB9/2fY
         AAGHnegGus8WfOeHywwN1V8oyHfg8RkvI7uMHgFdzD3r8jGfH1CJBGa/2HSP4Qg/FQZA
         M1Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXrtUOaKZH53AnCINewfc/Sdmv7DmTEys5DTNyMetbeaiN65We1DYfALU/m0sPzZBj2C4alpBfQRVzaHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsKyJNPqwtiyGty9vhANAWaUqKyBUpIipiGx0tZGQklfbTWWa8
	wzqcyU0Kz+tVGzoS4pgca24Ksfq8xk0iet1ckHrgJwjSqtUY1zdZn7nNYyR4svNvJpGVzCrRDeH
	swiCijJB1s0UOojTrrljm/ycHFtouL7UMFN0gUx//
X-Gm-Gg: AZuq6aI40SWCYN50h991oUdXCs7zwKkQ014blDDKXwC6zmTmIeq1qp3b+FU3XVA+Hh9
	4k/IAqn0H+zSmyiO/r2kJzvA4JD2imN6kqntsgBQMQBmauemgdh6o2uZEgSRV2Ff8c1XKinP81e
	QI5DlE0IHrALKFlBJ6EMjTBkFOSWCzzZGid53irkQBsZIjGsJ8pp2i8od/dngG7+CgosrqVRze9
	hsEoIzWXtJ9B7p8rxk8iPoPRr6S1UAkDsVy34OtndUKZQzL6Z2830YnN0D4Wq3sqUiURDWjOMNp
	cLH9+rGb6qRpMg7BTbnGdgVyeoHOkQSM95qHDds8+EEZ4oQtysM=
X-Received: by 2002:a05:690e:1409:b0:649:422e:a6ab with SMTP id
 956f58d0204a3-64c21a4445fmr14693680d50.4.1771520127600; Thu, 19 Feb 2026
 08:55:27 -0800 (PST)
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 08:55:27 -0800
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 08:55:27 -0800
From: Sean Rhodes <sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 19 Feb 2026 08:55:27 -0800
X-Gm-Features: AaiRm516wF1sxrOcuAWxO6OrvzLEoVjv5D4mcrkOEAJHB63_sZScJkbj-w6mDnk
Message-ID: <CABtds-32mtqntq-XzC3=8DX0Y3pBFh=628dXThL5s_fGNkWpfw@mail.gmail.com>
Subject: [PATCH v6] ALSA: hda/realtek: Fix speaker pop on Star Labs
To: linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Stefan Binding <sbinding@opensource.cirrus.com>, Kailang Yang <kailang@realtek.com>, 
	Chris Chiu <chris.chiu@canonical.com>, Edip Hazuri <edip@medip.dev>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

T24gU3RhciBMYWJzIFN0YXJGaWdodGVyIChSZWFsdGVrIEFMQzIzMy8yMzUpLCB0aGUgaW50ZXJu
YWwgc3BlYWtlcnMgY2FuCmVtaXQgYW4gYXVkaWJsZSBwb3Agd2hlbiBlbnRlcmluZyBvciBsZWF2
aW5nIHJ1bnRpbWUgc3VzcGVuZC4KCk11dGUgdGhlIHNwZWFrZXIgb3V0cHV0IHBhdGhzIHZpYSBz
bmRfaGRhX2dlbl9zaHV0dXBfc3BlYWtlcnMoKSBpbiB0aGUKUmVhbHRlayBzaHV0dXAgY2FsbGJh
Y2sgYmVmb3JlIHRoZSBjb2RlYyBpcyBwb3dlcmVkIGRvd24uCgpUaGlzIGlzIGVub3VnaCB0byBh
dm9pZCB0aGUgcG9wIHdpdGhvdXQgc3BlY2lhbCBFQVBEIGhhbmRsaW5nLgoKVGVzdCByZXN1bHRz
OgotIHJ1bnRpbWUgUE0gcG9wIGZpeGVkCi0gc3RpbGwgcmVhY2hlcyBEMyAoUENJIDAwMDA6MDA6
MWYuMyBwb3dlcl9zdGF0ZT1EM2hvdCkKLSBkb2VzIG5vdCBhZGRyZXNzIHBvcHMgb24gY29sZCBi
b290IChHMyBleGl0KSBvciBhcm91bmQgZGlzcGxheSBtYW5hZ2VyCiAgc3RhcnQvc2h1dGRvd24K
CmpvdXJuYWxjdGwgLWsgKGJvb3QpOgotIHNuZF9oZGFfY29kZWNfYWxjMjY5IGhkYXVkaW9DMEQw
OiBBTEMyMzM6IHBpY2tlZCBmaXh1cCBmb3IgUENJIFNTSUQKICA3MDE3OjIwMTQKLSBzbmRfaGRh
X2NvZGVjX2FsYzI2OSBoZGF1ZGlvQzBEMDogYXV0b2NvbmZpZyBmb3IgQUxDMjMzOiBsaW5lX291
dHM9MQogICgweDFiLzB4MC8weDAvMHgwLzB4MCkgdHlwZTpzcGVha2VyCgpDYzogSmFyb3NsYXYg
S3lzZWxhIDxwZXJleEBwZXJleC5jej4KQ2M6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5jb20+
CkNjOiBTdGVmYW4gQmluZGluZyA8c2JpbmRpbmdAb3BlbnNvdXJjZS5jaXJydXMuY29tPgpDYzog
S2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpDYzogQ2hyaXMgQ2hpdSA8Y2hyaXMu
Y2hpdUBjYW5vbmljYWwuY29tPgpDYzogRWRpcCBIYXp1cmkgPGVkaXBAbWVkaXAuZGV2PgpDYzog
bGludXgtc291bmRAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnClN1Z2dlc3RlZC1ieTogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmNvbT4KVGVzdGVkLWJ5
OiBTZWFuIFJob2RlcyA8c2VhbkBzdGFybGFicy5zeXN0ZW1zPgpTaWduZWQtb2ZmLWJ5OiBTZWFu
IFJob2RlcyA8c2VhbkBzdGFybGFicy5zeXN0ZW1zPgotLS0KIHNvdW5kL2hkYS9jb2RlY3MvcmVh
bHRlay9hbGMyNjkuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc291bmQvaGRhL2NvZGVjcy9yZWFs
dGVrL2FsYzI2OS5jIGIvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jCmluZGV4IGI2
Njk2NWE1MjEwNy4uMDBhOTJkYTBiYTA1IDEwMDY0NAotLS0gYS9zb3VuZC9oZGEvY29kZWNzL3Jl
YWx0ZWsvYWxjMjY5LmMKKysrIGIvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jCkBA
IC0xMDE3LDYgKzEwMTcsMjQgQEAgc3RhdGljIGludCBhbGMyNjlfcmVzdW1lKHN0cnVjdCBoZGFf
Y29kZWMgKmNvZGVjKQogCXJldHVybiAwOwogfQogCisjZGVmaW5lIFNUQVJMQUJTX1NUQVJGSUdI
VEVSX1NIVVRVUF9ERUxBWV9NUwkzMAorCitzdGF0aWMgdm9pZCBzdGFybGFic19zdGFyZmlnaHRl
cl9zaHV0dXAoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCit7CisJaWYgKHNuZF9oZGFfZ2VuX3No
dXR1cF9zcGVha2Vycyhjb2RlYykpCisJCW1zbGVlcChTVEFSTEFCU19TVEFSRklHSFRFUl9TSFVU
VVBfREVMQVlfTVMpOworfQorCitzdGF0aWMgdm9pZCBhbGMyMzNfZml4dXBfc3RhcmxhYnNfc3Rh
cmZpZ2h0ZXIoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCisJCQkJCSAgICAgIGNvbnN0IHN0cnVj
dCBoZGFfZml4dXAgKmZpeCwKKwkJCQkJICAgICAgaW50IGFjdGlvbikKK3sKKwlzdHJ1Y3QgYWxj
X3NwZWMgKnNwZWMgPSBjb2RlYy0+c3BlYzsKKworCWlmIChhY3Rpb24gPT0gSERBX0ZJWFVQX0FD
VF9QUkVfUFJPQkUpCisJCXNwZWMtPnNodXR1cCA9IHN0YXJsYWJzX3N0YXJmaWdodGVyX3NodXR1
cDsKK30KKwogc3RhdGljIHZvaWQgYWxjMjY5X2ZpeHVwX3BpbmNmZ19ub19ocF90b19saW5lb3V0
KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAogCQkJCQkJIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAg
KmZpeCwgaW50IGFjdGlvbikKIHsKQEAgLTM4MDIsNiArMzgyMCw3IEBAIGVudW0gewogCUFMQzI0
NV9GSVhVUF9DTEVWT19OT0lTWV9NSUMsCiAJQUxDMjY5X0ZJWFVQX1ZBSU9fVkpGSDUyX01JQ19O
T19QUkVTRU5DRSwKIAlBTEMyMzNfRklYVVBfTUVESU9OX01UTF9TUEssCisJQUxDMjMzX0ZJWFVQ
X1NUQVJMQUJTX1NUQVJGSUdIVEVSLAogCUFMQzI5NF9GSVhVUF9CQVNTX1NQRUFLRVJfMTUsCiAJ
QUxDMjgzX0ZJWFVQX0RFTExfSFBfUkVTVU1FLAogCUFMQzI5NF9GSVhVUF9BU1VTX0NTMzVMNDFf
U1BJXzIsCkBAIC02MjM4LDYgKzYyNTcsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfZml4
dXAgYWxjMjY5X2ZpeHVwc1tdID0gewogCQkJeyB9CiAJCX0sCiAJfSwKKwlbQUxDMjMzX0ZJWFVQ
X1NUQVJMQUJTX1NUQVJGSUdIVEVSXSA9IHsKKwkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywKKwkJ
LnYuZnVuYyA9IGFsYzIzM19maXh1cF9zdGFybGFic19zdGFyZmlnaHRlciwKKwl9LAogCVtBTEMy
OTRfRklYVVBfQkFTU19TUEVBS0VSXzE1XSA9IHsKIAkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywK
IAkJLnYuZnVuYyA9IGFsYzI5NF9maXh1cF9iYXNzX3NwZWFrZXJfMTUsCkBAIC03MzcwLDYgKzcz
OTMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10g
PSB7CiAJU05EX1BDSV9RVUlSSygweDI3ODIsIDB4MTcwNSwgIk1FRElPTiBFMTU0MzMiLCBBTEMy
NjlWQ19GSVhVUF9JTkZJTklYX1k0X01BWCksCiAJU05EX1BDSV9RVUlSSygweDI3ODIsIDB4MTcw
NywgIlZhaW8gVkpGRS1BREwiLCBBTEMyOThfRklYVVBfU1BLX1ZPTFVNRSksCiAJU05EX1BDSV9R
VUlSSygweDI3ODIsIDB4NDkwMCwgIk1FRElPTiBFMTU0NDMiLCBBTEMyMzNfRklYVVBfTUVESU9O
X01UTF9TUEspLAorCVNORF9QQ0lfUVVJUksoMHg3MDE3LCAweDIwMTQsICJTdGFyIExhYnMgU3Rh
ckZpZ2h0ZXIiLCBBTEMyMzNfRklYVVBfU1RBUkxBQlNfU1RBUkZJR0hURVIpLAogCVNORF9QQ0lf
UVVJUksoMHg4MDg2LCAweDIwNzQsICJJbnRlbCBOVUMgOCIsIEFMQzIzM19GSVhVUF9JTlRFTF9O
VUM4X0RNSUMpLAogCVNORF9QQ0lfUVVJUksoMHg4MDg2LCAweDIwODAsICJJbnRlbCBOVUMgOCBS
dWdnZWQiLCBBTEMyNTZfRklYVVBfSU5URUxfTlVDOF9SVUdHRUQpLAogCVNORF9QQ0lfUVVJUkso
MHg4MDg2LCAweDIwODEsICJJbnRlbCBOVUMgMTAiLCBBTEMyNTZfRklYVVBfSU5URUxfTlVDMTAp
LApAQCAtNzQ2Niw2ICs3NDkwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfbW9kZWxfZml4
dXAgYWxjMjY5X2ZpeHVwX21vZGVsc1tdID0gewogCXsuaWQgPSBBTEMyOThfRklYVVBfVFBUNDcw
X0RPQ0tfRklYLCAubmFtZSA9ICJ0cHQ0NzAtZG9jay1maXgifSwKIAl7LmlkID0gQUxDMjk4X0ZJ
WFVQX1RQVDQ3MF9ET0NLLCAubmFtZSA9ICJ0cHQ0NzAtZG9jayJ9LAogCXsuaWQgPSBBTEMyMzNf
RklYVVBfTEVOT1ZPX01VTFRJX0NPREVDUywgLm5hbWUgPSAiZHVhbC1jb2RlY3MifSwKKwl7Lmlk
ID0gQUxDMjMzX0ZJWFVQX1NUQVJMQUJTX1NUQVJGSUdIVEVSLCAubmFtZSA9ICJzdGFybGFicy1z
dGFyZmlnaHRlciJ9LAogCXsuaWQgPSBBTEM3MDBfRklYVVBfSU5URUxfUkVGRVJFTkNFLCAubmFt
ZSA9ICJhbGM3MDAtcmVmIn0sCiAJey5pZCA9IEFMQzI2OV9GSVhVUF9TT05ZX1ZBSU8sIC5uYW1l
ID0gInZhaW8ifSwKIAl7LmlkID0gQUxDMjY5X0ZJWFVQX0RFTExfTTEwMVosIC5uYW1lID0gImRl
bGwtbTEwMXoifSwK
