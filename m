Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793293179;
	b=sw+0dzsHWqpDpExz1ETaV+pPCb5I00a8ndx15ToU0Fut0Ru52kLnsofCd67E+yEHc8uF
	 BiPsTefWPRDjAiC375bvV2itBG/gFmGwVz5DwotpmJLYdaMmdxcWx23pDSlUkw6zM1hGu
	 d9rcoD7BkimXv83080G34DVljxI7kqiFkvM4GrkOmeLm+lk9phu/Yog21Q0kz1/jCbgee
	 6edBG+wAVGzpgi/4N8EhZp9AM+a2MiWbLIFcXALp+pzj3Uf2fhty9BuxW5l/Ucdyaq3Wt
	 qsKo+nsJstFLaQbiUXMIF+/fnf4FmXq2VcllajiUwLWW+G1O3uw2vNmo0ZXWfqROoZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TMKRLZBe9Zxx6OkgvRZd/gzaOpd1SutD5pCKyyI0lvo=;
	b=zb+oTj+jeBGwq+Xe11TDTSO9xDCH05sFuTshTek4tBRS+DDRZ6xYjSEsKJDJOfK40I0N
	 gPEKGfy9+JZyYzWS9BO6xiCiK4jyaydf6ibReYTaiPoC28ETVbCjIXFZPia+OB97XFTUo
	 MaF41kAaWzF2e0rX17vZ8bcGS8Wf1Usfi5HnL81JgMslrkGys4IhbzVre1x3+AIT1M6Lk
	 aR1KMConZOePaX/9a0BDsmGLhasRZ7s1UrfPr97JtpoBjn2VewleCktOcHU8jBZyO1rjS
	 RdK8Uu08kJolFbz6rFXlH4tSUgiemZNRra3GoEoXRmmU5z/h1slj3d9/xUeSIIYSBzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w/W3r7N/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4C5606A31D
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 16:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B4C5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w/W3r7N/
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4c9abc1824so63752666b.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 09:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793293177; cv=none;
        d=google.com; s=arc-20260327;
        b=O4QXVoyq/MBhkQ9ciNonK5/UPr798hx8oShqwfJoIOMuwNiouL3Q0/V9t+sHaha2Mp
         fwWWn0/RrMll0tEER60tRAGBBFOhyX/O8UlWiu1Sqph0BG0WwsyrtiJGq/etQuLnA/aZ
         i2uODXjA7YFte0fWeKdyTOBDdqUQskVD0+ZU+SKXE/cPANYtjNpslMxzkFSo127tusIq
         Fw5H6lNSFq4jxXQKydCWF7uMWdOJ/rx+NDq4iJBPOgk/MNzjEmFNvECdceQt2cZ2FIK8
         DezenwLOYqIWpMdEownhGRSnEG4/+TIakjj03EXWyll/TMSXJUY1Sd3G/uY1ziFb2w/9
         I7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TMKRLZBe9Zxx6OkgvRZd/gzaOpd1SutD5pCKyyI0lvo=;
        fh=pvPZORKz5LqRyndKmkt8vuKoecReJq9yh2YxS58gCRI=;
        b=OMWWbVwy4yDdNrwAfxv707TXu5fJyG4ZuNok7oIYvizuCfdAMKpf+0QAnAqYB027SO
         Pbrtom1TY7+cDr2L+l56BlGeAf77D7c3EIVo4F/0xpcFUxEM4buEgzDFwF8SDO7vvYnz
         UX7ZEOnv8TNnw7fmEVycc2P6NNHcNzdojyw0vnrfWPHMZR+jkXyPmyegy2Qcsm8fABkt
         NftmltVlpaE/mq9Jx05ZJ6dbny9h8mmZ9mcWTvaWAx61jlwd/M+HqxlwdwWcv7evjimE
         /py0WAClA4y85MTssPXjuGSM8Kp654fEeTS6Z1RJ8v0UA6ugezSSdgsONzqjJS5oJZcO
         mH5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793293177; x=1793897977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMKRLZBe9Zxx6OkgvRZd/gzaOpd1SutD5pCKyyI0lvo=;
        b=w/W3r7N/SJr54wDY1L/oCQ1C9mPzgXlh6wwRdJP0grwX/zuDPX9RiSp0M6F/kkt2PK
         ukEw0OavBDLUyYCHnzvmXZBeG7wvOtNnJsJmWLQyOb4iT/5dcOJl1TWC/WgG83/ZnzLk
         VhvPuu/Czm7XtDeSuHHTO+evFYN25LJlce7P1QJasKKOmay66IPleODyV/HSj0JH8J3P
         KvJJztkfPFVN07G+lw8LWo9rU/OKLBjQih8q/XKA3GgD1OQcQSI2sA/E2vCMwzLaEKQ9
         Hsr6sC9RlMZrKQ7+40zq+ah6k4NuGer5STNrkqm8FbbaYqoK8KnhESxA7aoN7hK6tH90
         YOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293177; x=1793897977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMKRLZBe9Zxx6OkgvRZd/gzaOpd1SutD5pCKyyI0lvo=;
        b=bytU7XhJqWueP2tGw3TMVRFwU3q/wp/gr3PyIoK8LqmcdeWLECQ+p5dkYS7zitjgjS
         sbC2ppaSKywgKzepZaiMgwUBXWPFa3GleFW9PnRT+Teld+HYJA0xZhD1k1gEgX1P2GK9
         32hpwwV8bcaV3TzIj+13y/Z4hf4IKG2uWfBX0521KRjfLmGtI0aBckF86j44TpSKyRQO
         4dC8QKkBWltO8dN54PAtUVTXs4BjPF+l2K7HaAXO77yk6aClu60/FvzuLqv1L6yHhplZ
         X7R8H2NfGc2Jj1l0DFVftq/HbHsO0Qc4WMRAZUbK5p/d2FE65gfVF/JxS67P8fuxYeJX
         vYQw==
X-Forwarded-Encrypted: i=1; AKwUvBz/Z25zsagmqBRaHJpncXuwS58W9+N2TlDBCT91RyIpTBiUAZGK+KZ70kpbbUWkL1Q8yFWRki73uDw1iw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLwRwBEqh/7NhAKmJZMtmkwvVBJzTLk+UzYZyJ6qbUuaqQxZutN
	85RSofcAGGC9IN3slZOXIUGxvzJsO3fx+bIdU2I8kTstRJXTRZo9IChs6LzOAtyYZoqZrbdC5rj
	8M5rhp1hDQT0XTxbs6O0CkQEbkw6kiCQ=
X-Gm-Gg: AYBFou3MhtBL/oA5WRNVAdVMOtQ2QEVBMgkDCNuUwgMF7BZkQdM9amTZZNk0lpR5khR
	BeKX7r1nSx+vLGwbf4cCTHAq7Qe20wS9U8xJhq0GNyRpVLa6qWh3d7HtBKfQZMZIDgyQSvLSXrk
	CCiocB5Be7s0oZq8MArE29gbO+9ruuVkZSlk3n0vr8LALAnHp4dXL4/MOe9820QwW2ntFDieFos
	FcgpSq5mdqUQvc1FEYKC8B5d4UPcZ7MfX6+9vDd9JqBcz/74ECuecXF3ws1M+98b0JbVTwl0g2+
	YX9PYOw94wLd3gmnNJ5OlNmol8aHkAt8UD8ZSYxSKXHFMELyo4HigDkpLj+bkNA9jzfWXlylQxe
	VJuFmhsawFGwhuuL6VOikUo2En+YNeONLct6T/xlu9fVJ7iYjgN9g6yEpSZeaCTHw+fHT
X-Received: by 2002:a17:907:5c1:b0:c34:e9fe:82ed with SMTP id
 a640c23a62f3a-c49bdfb8a28mr524419866b.28.1793293177297; Thu, 29 Oct 2026
 09:59:37 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026125751.1700779-1-stjepan.poljak@gmail.com>
 <87pkwv385p.wl-tiwai@suse.de> <CAKVkeTxg4LWANUmqa4rzC-w8Ai62vcxeSU1FCAWSyA76iyK8yg@mail.gmail.com>
In-Reply-To: <CAKVkeTxg4LWANUmqa4rzC-w8Ai62vcxeSU1FCAWSyA76iyK8yg@mail.gmail.com>
From: Stjepan Poljak <stjepan.poljak@gmail.com>
Date: Thu, 29 Oct 2026 17:59:25 +0100
X-Gm-Features: AclHuK98Zm30j0tBYNImXihCxI3zMiNZFSiJRCGdpYIM09guBTiISqkFn91_MFY
Message-ID: <CAKVkeTypfVTfrJtEz6O-umJR8hUWqi+bKQCkD_uCihSTq=5gzA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: reset a MIDI device whose input is stuck
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Clemens Ladisch <clemens@ladisch.de>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 11:38=E2=80=AFAM Stjepan Poljak
<stjepan.poljak@gmail.com> wrote:
> Hi Takashi,
>
> Thanks for your time, and agreed. The host should have seen the
> disconnect and on xHCI it does. The Pi uses the downstream dwc_otg
> host driver, so I'll first check whether mainline dwc2 has the same
> problem and take it to the Raspberry Pi kernel or to linux-usb
> depending on that.
>
> Sorry for the noise: I sent a v2 yesterday, fixing the review bot's
> findings, before I had seen your reply. Please disregard it.

Please drop this patch. Takashi was right that resetting the device is
the wrong fix. The cause is in snd_usbmidi_urb_error(): -EPIPE falls
into the default case, so every stalled URB is logged and resubmitted at
once, and on the Pi that loop keeps the hub's disconnect from being
processed. I've sent a one-line fix for that instead:
https://lore.kernel.org/linux-sound/20261029165701.2004391-1-stjepan.poljak=
@gmail.com/

Stjepan
