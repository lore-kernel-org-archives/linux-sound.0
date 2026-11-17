Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794926957;
	b=QK/BZ5uhoQiogf/yBEMp2+c38ZBV3k8+ZgcJqKw0iXELimoz6Gso+9EsFMPWfjlaSmLz
	 u/JYf+if7oevVe3UxheEqZGsgeIEPcwyY/cFYzXXgZexTB/L2VYZFfZGbtC7BNlUa8+zF
	 zLCnj1mOBZk7z36U+Sg+ps3bWIZHXvfRj94KQiXbDO14ODWUEFH8bzOrKzzrZk3UscmFO
	 XCpnOiGpbx/kFWLS4CIJ51o018ujkDJ80VoXSh9o2S8UsND8WR1Rsw29dsv2X31NmivTn
	 BmtSMPKS1F//5KKaX/v7PYgtF3I1aQj2nqHaJYg7EXbm45HNuVK/9rdFE8njxB8T59g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=KVB/e4UrF2Lv+S1TNzxhho32YKzKrH5oMmhz+C4qnUw=;
	b=OdtV6aK9HcFelitrwArXkUEpE98z5P7GpUi8Fx1CDRuezd7kiMzvIvp4zkN4tllwNeka
	 7Yhm2ML4KkgF/0FzAHJ0VJ5OkhoqY7ryCb1oZmAYNJRu/3Bd+jpu2m6ev0Oxp7N7yp9oj
	 AwgwfukAHmc1dkCxuSo5cNbRGeWIatA8GUm8fl/jNu0M3FRkOY1RWse/R9Whhizisq3Jl
	 xmMbPlCSQfE7IG79OJJsYz7Hqo/de6tvwr09xeDE1ZyqJDtQ6P50frMRANDazVioz4/pO
	 YVihe76JmfG1DBH1EvyiZTHo+Rahpc+M2iq58p+NQscnp1e1Ll9NT90H2XoFXqOfmJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U49GwSEl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB75606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 14:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB75606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U49GwSEl
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ed0890476fso35625825ad.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 06:49:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794926956; cv=none;
        d=google.com; s=arc-20260327;
        b=M0YflHU7h2sVGlYIiZUalGUdWC3hfLtJ+ZkeZ1/i5rZud++oklop+prPEN2/7s0kjv
         RJQTCpt30oT/3xazj9lCm2NRvGdAenBv1dAHLC/lLaJa+p07aSLCZc6BknNOq8qttxRE
         I16SkoZCyooAaeNvxwyx6z/yGh7Ii4zzJzFdeWmiC78P/UUkTtSLea1mdRjYIJJ4MdU+
         9qPBJNcLOPz0s04KPhE1N7DYGjS+4r9pv2HncZPebwYVu8sxY9dIErIIAcDpPl+wUS6i
         N6FMy/1bEUwpvJkV7+T6F9eKhf/oKz3Pn+zrfw95F7hSbod+pPSZz1fgSxtdyYoQC0Yw
         b6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KVB/e4UrF2Lv+S1TNzxhho32YKzKrH5oMmhz+C4qnUw=;
        fh=tf7QnDC+0hICjR1mVM+Q0SW4TPWzpuAhelkhgKIisOg=;
        b=QDZI+giWT5TqSizV6QyvCZ1DAHEe9ty3H+/Jm7d4VzmxSSa2ndB+p4ZOoufRkjuuJO
         J8Sm+JxJS3UWmCPTxOrM/3rtX08aBFVMAz0+WYwTpFuMQczx1xFUcJySim3k7MCf8B0u
         7dikKrj+B48PjOR+dOCMGTuIqX6oJGBcgEcwHPnPlGGzwSs/UQpu5Vjj2ozCmjXf9z72
         BY5C1pvuYcMe4N5OPM1d96D5uD6/y5FIUUUOwZ4+ottFqrgmaikN5iI5pKOrcbZgVnB6
         ljA9mjLLN80p0oTS4vgkGle1jIGii2Qv7ZHKX3uSTw+61c+mvmLJjazLGZG/sfkmEG5Y
         0xsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794926956; x=1795531756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KVB/e4UrF2Lv+S1TNzxhho32YKzKrH5oMmhz+C4qnUw=;
        b=U49GwSElp5u72o5L2bGO2ClJ2Gh7FIlO8SOg0BDHrdssNDZdDFeZUaTRIJ4I3tX/eE
         6AUOHHuwP2OnLRGt9OXsredSFXoqjWJhBUFl9X/SMd6KG+I5dEEU4rGxy+HgJqL3fPum
         Lj+29ud14PpWh/7iCWn++lmG2PE8vrpe2lW/r7HBlYKYUY2x6px163p24LWIteJq4d8M
         DSpQAqCRkj8LlJ8gF9e4mx+xMJnM+ISfX35W+Yn1bVTgaCffbzmeUzUmRR7IJbdXMh78
         KCO00PlRSWMdBQzzRE3SOqD5vY27Bc4YNTgZnbgmsTOG5youfSNRdGzsmNi5fuK3Zxa8
         OPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926956; x=1795531756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVB/e4UrF2Lv+S1TNzxhho32YKzKrH5oMmhz+C4qnUw=;
        b=ojSdKSCUGDoyaN1jf5BStP2WxAEwNjsOznpwTm8bMqZDowp4kknlbQka8C4vVDLJCw
         A8lRPW2YTgBAt4S4MHmsODgcgTTVX2pDWJT3lzYGLtBl8msiNwIIhfJQ647i4EBGRYI+
         sB3xVFXlse4FTaGYBhaM5i6W2LLMyssm01Fbg4IZqIrXnLoUgAth0mE/ozUzxJjpmoMI
         q8j43DGeSLMXz+LVLBmjeOohDF+/7mhZIxblSirjVaOKtrwyEyeMEqM5lRjfuszGb4Zx
         t2mtekXbikzNow49vDPCKAQWcm+5+P/c8UpsB9u45SSgMSs9nzzz0dCOQkOdXc7gInec
         J97g==
X-Gm-Message-State: APuU4Z/SNhlNb6KRxT9i9RQPzzkqe3EhaXB29ankhZBH0+1CJGOAB7GJ
	mKsQsg3qmCnZALpZ247MUaEp8LwDkyr6AVYf0+I5XnK9E6QKYPGr8Ve+aLLY/Q773Gf8byxWTno
	IhpDAtvCe2qgd6ef1zKDkCsZNw7sgKt8=
X-Gm-Gg: AZFdTZclWdJLkSWx2mVk7c6ESpQpFqJg/LQTYCMkRsNSimXZdNE9BrtM5VFATe7hssh
	tcGEgWJWPwx8FOlR9O3Z3OkmuoYU/wMuk6n4NsSl844YLw30ZXMXP6Si/miiA29xhuk7TOa6x+T
	K8WNAW4+EB4JlB8V0xlOVvyvr/lbt9NgwTCIK9ZGkdKuMHHA9W5+0Ag1MyGqr5KOaXxyIkeN3nJ
	HaKZnJYqBowkODUTNHLmQr/NxH8K22N968btgsSOSoeFzkIBUortr0K4o1Q/utVVVat4HuP3HSi
	svJVWiVrEtrLNvFMSLKf/5/LFfFfi4YnXi/244IrXo1BtL24TabqlHXNuCf0Iy/Sx7vKff4ErzY
	NlBSs7TreDyq4JNgbFO66HQ1Jv+Yrp184rLfPUg==
X-Received: by 2002:a17:903:15c8:b0:2ed:8bce:aa38 with SMTP id
 d9443c01a7336-2ee0d9f2610mr140026295ad.3.1794926955946; Tue, 17 Nov 2026
 06:49:15 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
 <d0219acc-0e2d-4bcd-b303-e7edaa236eec@linux.dev>
In-Reply-To: <d0219acc-0e2d-4bcd-b303-e7edaa236eec@linux.dev>
From: Ted Vera <tedvera@gmail.com>
Date: Tue, 17 Nov 2026 07:48:39 -0700
X-Gm-Features: AclHuK_37o3TJGBoLe9hp68xhk-6PXau-GH5p0zcyWlicUZlj4wuH7g4qBB6O7I
Message-ID: <CAFd_G9jmveC3oHQbfKOVaRK=6k1r8iygG8Y9s1XTuHC6ABtCeg@mail.gmail.com>
Subject: Re: ASoC: rt5677: Do not apply Yoga Book ACPI GPIO mappings to Samus
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, regressions@lists.linux.dev, 
	oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good morning, Pierre-Loiuis,
Not a prototype, it is the commercial release.
Thanks,
Ted

On Tue, Nov 17, 2026 at 1:12=E2=80=AFAM Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev> wrote:
>
> On 11/16/26 22:24, Ted Vera wrote:
> > Summary:
> > On a Google Pixel 2 LS Chromebook (Samus, EVT2) running Fedora 45
> > kernel 7.3.3-300.fc45.x86_64, the RT5677 codec repeatedly fails probe
> > with Failed to request POW_LDO2: -517 (-EPROBE_DEFER). The codec
> > appears in devices_deferred, no RT5677 ALSA card is registered, and
> > only HDMI audio is available.
> >
> > The driver=E2=80=99s ACPI GPIO mapping added by commit 0cc00de3dd5b map=
s GPIO
> > resource indexes 0 and 1 to reset and pow-ldo2 for every ACPI RT5677
> > device. Samus=E2=80=99s DSDT uses those resources for codec GPIOs (jack=
 detect
> > and mic-present), not Yoga Book-style external reset and power GPIOs.
> > The driver requests the mapped GPIOs before registering the codec=E2=80=
=99s
> > GPIO chip, which appears to cause the deferred-probe loop.
> >
> > Test and result:
> > I built a temporary module against the matching Fedora kernel source
> > that skips devm_acpi_dev_add_driver_gpios() on DMI board Samus. With
> > that module, the RT5677 device bound successfully, the bdw-rt5677 ALSA
> > card appeared, and laptop-speaker audio worked. Secure Boot remained
> > enabled. This strongly supports the ACPI GPIO mapping as the cause.
> >
> > Suggested fix: Restrict the mapping to devices whose ACPI GPIO
> > resource layout matches the Yoga Book, rather than applying it to
> > every RT5677 ACPI device.
>
> Humm, it's a 2015 device that I used in the past without issues. It was
> one of the early SOF devices... See commit bcb43fd.
> Is this a commercial version or an early prototype? I don't recall what
> EVT2 stands for in Chromebooks.
> Also adding Andy in Cc:, he was the one who suggested the GPIO fixes.
>
