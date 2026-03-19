Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ED73C196F
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 10:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773915669; cv=pass; b=qpXntdN2bwF+B0JNe1Z5dKZ3wqy9ZZf95bpI3F6M8zhPzR9XKBQiv9ah5Xotyfw0GtQ2pJEUFN2q63Nagvu9Cae7FVojjMybgZVHWBtfuj/5faLuOcH9tzrerD9bsnQJllZZzR5nws5e3lw4mGOh1aouy7ph5AciLRjsYLJWo/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773915669; c=relaxed/simple;
	bh=EOBg1E8bSC7/K/EM2Et+DCchEoY8FzoKvXB9qNQLcZo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=YrKcmai4PTW4hyxO4KWBAC5lBqRV+ubG/jaACp5Svtod7sdR4fouPsiBwRVRjqIwX/0Zr4y0zCTSgOixVOa6sn0ic/jLYn9MSIGcTHXGR5L/j/z9MRyujGU/sUxR3AQK0IskXR4JlCbi5L6aUcE+CpwD5MtZJNw7lKp6EHDjJaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuxUwvUK; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuxUwvUK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b527ac5d0so343228f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 03:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773915663; cv=none;
        d=google.com; s=arc-20240605;
        b=bKYhDXXBIU+Q45zlVLlToD491sXY8bflprR9eAFkC0V07wZlO3UVqc4qo3gikvjkSt
         oU/Q5p+sl+XMhLo8OwRoOwINIOcic+/gc3PuC4lE1hggVRxmeXUp/Egj3tJH+707YleQ
         f1JB+E2tiRsGG10qfQfMJayTs3Z5zmuRM3TGo9lRs3jEbPCuPDtJiEdMLAFr3VQaSmqG
         dF8ngIDQEWvt23c3cx+yb86ZmqyLtMaFySIMKALwEaSAy3QG6RhviK3HNNyvdv9z4zwM
         gsTZznFDAWnSBG9Er5zDUrJHR1Muh4L4pvDiDmWIzsC9cK7x49Fv3RoGsrJtGZcAPXTq
         xDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=bz37tf2R8JmtMOJjrsbGiqXUPmbzjbhjYJ0T8dKfsU0=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=fzYigw0mt3SSMaI5VPuzHVRIU4roA3dKNhwZDQO9WX2NK/7mKyolzbN5REtTdjwKTt
         sOyz7M3tXGwkz7vIqBROSW7ONAvW6gBVugTSzmI9L6aL5Guekv0nfrYQXQ14XM95aIFr
         oqKYqHHtbfrEa6S7bNAIrxHK7eUUdOEwKUIoQzInN8rBVJZFG2lyUkNvMgEtJFu/hieI
         2ayqDTMEPaNoTKHzXzk9z9Gjw9cd+wLxjBjdseudloxgpkKaCyZ7ST/AMW3wk0aZ0dVX
         xb1+94ef0uMMwRfnWsVmLKUJaoYL2Rxms9uOlGy4hm3q+lXVXVgxjsq0w5/QXmuXtZ2n
         4yAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773915663; x=1774520463; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bz37tf2R8JmtMOJjrsbGiqXUPmbzjbhjYJ0T8dKfsU0=;
        b=VuxUwvUKj/7XAmBIbqHxvPTFG3jAKsDpQiX/0IPmpjmPCt+InRatihSH73Z6dZgOrF
         D7c8cGF3kkoZSFZ8o2JFJxQSAt8+NO8Y5f6A8qNTVt/5m9ueYLTrFmkmgK88eZxktKQy
         e9xCO0drwaxgWUs8D5yP/eRmz5xDmzdMk1KDLfTBsuuRf81DDp/bBoTUSisLQO9MOLpQ
         k9RsYhY55oOlgsdAeybqP1rjjBqUh2G7vJO9OwNMI//XjhpkkYh8LQ6lbX0uIVlZOOjN
         jCLXowLJ/5JdHnnCnqDhlvADeRLfqVzbZ5Vy/O53dHPcO03s44KsMtdTyHcqKg4di2nX
         oSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915663; x=1774520463;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bz37tf2R8JmtMOJjrsbGiqXUPmbzjbhjYJ0T8dKfsU0=;
        b=TMmQTmxrYtfnEdfHKbpakHK3aMF0g0QYSQHUDrCDYH8loHLF063HT+OLzHO8h3Fv2Q
         dqaGUFK/B37F8SUEofguaoOyn5vY3lxPOuSUg528hG2ofvZ8wwIBcKvCkSktcNJggObV
         zjwJ++wwSTyGMXbSNVw4u05N/rUUQSfRGtdpbo28kF6dpBztLUpTT9ntXPt+y82vJi30
         jJsVv6rpbc3VHWpXL37BD+iSf3Ku6zLM2aCn5Iydp9XGU49TTd0R7M1Mvq93hV9laoXS
         CsAvNhKliepAZPyEPu+2XdAxo9CnQnA1te2eh+Om9lqvpC2z1ypgnDnpsiUGsfj1tYQn
         Mz0A==
X-Gm-Message-State: AOJu0YxJ39+WAqNt3Rrp6PvAdMlgpEJ/tDUAUk0WaXVMajN94BVe/yiF
	ZIYfg8NrAMQGl2ZSY8QtLnpxZ/hutIbupuzIVRtxltI5uSvBGsoPMtYPgVD0GVpJsVvaA/KFM+o
	qjU/TOVZDIl+BLi2AO3iWVZmui0NC0YUygUfabQI=
X-Gm-Gg: ATEYQzxS4nf/qxsTpKzwkdLSjJ9L4URwpbvgmRjQZBK3iSHxQtXssLYzS7MhgJUuhCd
	LbQmWsIa4oudCLOZQ8hxYOABgZGTCndyZ1ItheSWhM0rUpCGCW6tGmaAfeNALAyLFOYIR5knTzb
	+X/CA0A/+St+gigm8iL8mUG0FHnNan9vly44jE5v4wsPFkSD1afLPJzkeJaRlDGchO5OLH57quU
	q+JLEES5SWfrUC1C5LXKojoEGTck+AZcBjqC+0bbBCmwJFu+G7rNTCZatQ2miZG1WsSYt9s3lVy
	AE3Y
X-Received: by 2002:a05:6000:401e:b0:43b:5188:f59f with SMTP id
 ffacd0b85a97d-43b527cce7emr11227677f8f.45.1773915663221; Thu, 19 Mar 2026
 03:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Philip Willoughby <willerz@gmail.com>
Date: Thu, 19 Mar 2026 10:20:51 +0000
X-Gm-Features: AaiRm50HY2_mExjCoD7pO8jKcfxAQWcBosvyYTGYZiYZBaIHlafMmF1UvcKaTos
Message-ID: <CAKSkzptzJOhbzNZXhnJVuSfS247eQAKV2MnPnzBqhzf_uWQWUg@mail.gmail.com>
Subject: [PATCH] ALSA: usb/line6: support the Pod HD Pro
To: linux-sound@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000f7db0c064d5dec28"

--000000000000f7db0c064d5dec28
Content-Type: text/plain; charset="UTF-8"

This patch adds support for the Line6 Pod HD Pro rackmount effects unit.

The Pod HD Pro and the Pod HD 500 are basically the same internals
packaged 2 different ways. From the attached computer's point of view
they are the same, other than they have different USB product IDs.

I have tested with my Pod HD Pro that this works.

$  cat /proc/asound/cards
0 [BRIO           ]: USB-Audio - Logitech BRIO
                     Logitech BRIO at usb-0000:03:00.3-2, super speed
1 [NVidia         ]: HDA-Intel - HDA NVidia
                     HDA NVidia at 0xe7080000 irq 173
2 [MIDI           ]: USB-Audio - AF16Rig MIDI
                     Arturia AF16Rig MIDI at usb-0000:49:00.1-1.4, full speed
3 [Cortex         ]: USB-Audio - Quad Cortex
                     Neural DSP Quad Cortex at usb-0000:49:00.3-3.2, high speed
4 [Audio          ]: USB-Audio - Zenith II Main Audio
                     Zenith-II-Main-Audio
5 [Headphone      ]: USB-Audio - Zenith II Front Headphone
                     Zenith-II-Front-Headphone
6 [Audio_1        ]: USB-Audio - AF16Rig Audio
                     ARTURIA AF16Rig Audio at usb-0000:49:00.1-1.1, high speed
7 [GM800          ]: USB-Audio - GM-800
                     BOSS GM-800 at usb-0000:03:00.3-1.4.3, high speed
8 [KATANA         ]: USB-Audio - KATANA
                     BOSS KATANA at usb-0000:03:00.3-1.3.3, high speed
9 [TD50X          ]: USB-Audio - TD-50X
                     Roland TD-50X at usb-0000:03:00.3-1.4.2, high speed
10 [GP10           ]: USB-Audio - GP-10
                     BOSS GP-10 at usb-0000:03:00.3-1.3.2, high speed
11 [PODHDPRO       ]: Line6-PODHD - POD HD PRO
                     Line 6 POD HD PRO at USB 1-1.4.1:1.0

--000000000000f7db0c064d5dec28
Content-Type: text/x-patch; charset="US-ASCII"; name="patch-willerz-l6.patch"
Content-Disposition: attachment; filename="patch-willerz-l6.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mmxb6ovl0>
X-Attachment-Id: f_mmxb6ovl0

ZGlmZiAtcnVwTiBsaW51eC02LjE4LjE0L3NvdW5kL3VzYi9saW5lNi9wb2RoZC5jIGxpbnV4LTYu
MTguMTQtd2lsbGVyei9zb3VuZC91c2IvbGluZTYvcG9kaGQuYwotLS0gbGludXgtNi4xOC4xNC9z
b3VuZC91c2IvbGluZTYvcG9kaGQuYwkyMDI2LTAyLTI2IDIyOjU5OjQ3LjAwMDAwMDAwMCArMDAw
MAorKysgbGludXgtNi4xOC4xNC13aWxsZXJ6L3NvdW5kL3VzYi9saW5lNi9wb2RoZC5jCTIwMjYt
MDMtMTkgMDk6MDA6MzAuMTAwNjE5OTQyICswMDAwCkBAIC0yNiw3ICsyNiw5IEBAIGVudW0gewog
CUxJTkU2X1BPRFgzLAogCUxJTkU2X1BPRFgzTElWRSwKIAlMSU5FNl9QT0RIRDUwMFgsCi0JTElO
RTZfUE9ESERERVNLVE9QCisJTElORTZfUE9ESERERVNLVE9QLAorCS8qIFRoZSBQT0QgSEQgUHJv
IGlzIHRoZSByYWNrbW91bnQgdmVyc2lvbiBvZiB0aGUgUE9EIEhEIDUwMCAqLworCUxJTkU2X1BP
REhEUFJPLAogfTsKIAogc3RydWN0IHVzYl9saW5lNl9wb2RoZCB7CkBAIC00MzYsNiArNDM4LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNlX2lkIHBvZGhkXwogCXsgTElORTZfREVW
SUNFKDB4NTA1NyksICAgIC5kcml2ZXJfaW5mbyA9IExJTkU2X1BPREhEMzAwIH0sCiAJeyBMSU5F
Nl9ERVZJQ0UoMHg1MDU4KSwgICAgLmRyaXZlcl9pbmZvID0gTElORTZfUE9ESEQ0MDAgfSwKIAl7
IExJTkU2X0lGX05VTSgweDQxNEQsIDApLCAuZHJpdmVyX2luZm8gPSBMSU5FNl9QT0RIRDUwMCB9
LAorCXsgTElORTZfSUZfTlVNKDB4NDE1NywgMCksIC5kcml2ZXJfaW5mbyA9IExJTkU2X1BPREhE
UFJPIH0sCiAJeyBMSU5FNl9JRl9OVU0oMHg0MTRBLCAwKSwgLmRyaXZlcl9pbmZvID0gTElORTZf
UE9EWDMgfSwKIAl7IExJTkU2X0lGX05VTSgweDQxNEIsIDApLCAuZHJpdmVyX2luZm8gPSBMSU5F
Nl9QT0RYM0xJVkUgfSwKIAl7IExJTkU2X0lGX05VTSgweDQxNTksIDApLCAuZHJpdmVyX2luZm8g
PSBMSU5FNl9QT0RIRDUwMFggfSwKQEAgLTUyOCw2ICs1MzEsMTkgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBsaW5lNl9wcm9wZXJ0aWVzIHBvZAogCQkuZXBfYXVkaW9fciA9IDB4ODYsCiAJCS5lcF9h
dWRpb193ID0gMHgwMiwKIAl9LAorCVtMSU5FNl9QT0RIRFBST10gPSB7CisJCS5pZCA9ICJQT0RI
RFBSTyIsCisJCS5uYW1lID0gIlBPRCBIRCBQUk8iLAorCQkuY2FwYWJpbGl0aWVzCT0gTElORTZf
Q0FQX1BDTSB8IExJTkU2X0NBUF9DT05UUk9MCisJCQkJfCBMSU5FNl9DQVBfSFdNT04gfCBMSU5F
Nl9DQVBfSFdNT05fQ1RMLAorCQkuYWx0c2V0dGluZyA9IDEsCisJCS5jdHJsX2lmID0gMSwKKwkJ
LmVwX2N0cmxfciA9IDB4ODEsCisJCS5lcF9jdHJsX3cgPSAweDAxLAorCQkuZXBfYXVkaW9fciA9
IDB4ODYsCisJCS5lcF9hdWRpb193ID0gMHgwMiwKKwl9LAorCiB9OwogCiAvKgo=
--000000000000f7db0c064d5dec28--
