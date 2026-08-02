Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F6C3B83FE
	for <linux-sound@vger.kernel.org>; Sun,  2 Aug 2026 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785679121; cv=pass; b=egNSJuYrfooy9dh1pjJuu1nZA8tlFB2OvH2gChaiw8EFHGDBjCRYi5JvtPQzdRt+dEzzuBOX7Dk1ca31J3lHCuMk8azOYddj9iImKj9iKbCiykFbBTbOfQz5NfhNm3x+eM9B8R+H0CLmwGSAfohA9uoJ/E4YTUB7/KcfzbtOlVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785679121; c=relaxed/simple;
	bh=mt2hje9W7ssBp5KJ6MJtkOk/mvftQneiLd8BjtEKtJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Irshif9aRsYXSUAZNKUzcuOzGr7M5VsqAUos165cdruEFHkYNNp5tXv0S04qDSdRmSxGefGhTW4nCFWRfp/q/kvPWkW1pI9i5MaIzUwhv2MAle6COtKk1a/rfg5L1L+vB6YM+VKJaZDD15bkKAUwubPLKLLSRq9KvmsQuyVTkrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ecZa1r6u; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ecZa1r6u"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c16ac21acso15453541cf.0
        for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 06:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785679117; cv=none;
        d=google.com; s=arc-20260327;
        b=kPd55n9Q1oMy4UAAfDSDOsWzRlSdMAVT2Zl5d6j3hfWwqqSC9QepWjyxut4CC5YFko
         U1gPUYdSh6zYrufxJ+OHI3eq+M+rk61xgW8Yj1Z2XhfwWFVEbK246HSwUj7gRHiBcfmL
         XUprOjftJyWG0L1mo1lupfV323Jtqp3Zdq4VF4mCgQyFsBaxBRII+xCzaBjekhC5T0uE
         VJDp752CroyDjTe9lM/VoaxPFiOF2XBgVDqGrkjRF32B6q36tCFkHnW5RUhtpWWgu8Mg
         sixsabITDcEkcnt6wbNJ9EUzaDErwBTXpA8MxSxxMV4M03hgqgx/iGnxoKbG6MJRy35G
         FQIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p8VfjImXvp+P0j8zuvXRVoWtL2mhC1hJAfHYPdA8WrU=;
        fh=7J93b4Fy1Ktw0fegDDpMhph0SuqZdSWbeuYOBZy4nJ0=;
        b=spGxYSd6bWv3ibKp9bAw0hxEfXY18qJTCEw2WjTiiI50nZaH1srtwJjsPmDlFkuMlt
         nNoC49MQRqndnZuqSl6ADYuoBzTfew8G2yUGoWxIlYEzmK9pYB1UYzkca+7ByRdi0EwP
         iIjoPjsxzhglaIXa+t8i7u8xoLyHpwfrSL03MW/1Cmv/s8DK3v2jeFFCk0cQ7Ueh/jnZ
         dGwGk6JS0mva3QJmDTOkiQ314PvdlSvXqIIeB7JuaSxBiayAMZkDEZNmpH+Fi7JyGdDa
         CPlM2Fit5cYyUcKg46KOY2QUnwHw5+kdbPgQ+9x2hdvAu1BEXs5hgHOF6nlhCBsH60Ja
         fiEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785679117; x=1786283917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p8VfjImXvp+P0j8zuvXRVoWtL2mhC1hJAfHYPdA8WrU=;
        b=ecZa1r6uYd2iJeY3QeDZlAKKaKWuhwM7LnWwlHvS4z0k7mLp6Qhbh+urm5ofe7JfdF
         Avu3jLUrCOP+TEfw/6UuXuqxwMCgAmuVMKxAd2hIrGLZZJ6fAiDm6tcyEKAwcvZLhs+a
         IMDUmqc1fu4P/R8PKfo8kxWVUjJ/qze2RLTnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785679117; x=1786283917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8VfjImXvp+P0j8zuvXRVoWtL2mhC1hJAfHYPdA8WrU=;
        b=NP5Ne5FnKN/sY7jJ1uhNDq/Dj7BSLavvEEVZlDMoS2wI00RitJBSOUVrLv1emtZcCT
         tpHfPxHk4tbcNzM5OGJNOt9lIDVG0DJX2DTeRS+d3R4biCUXAxwDNZ7lo8kUaLyissNf
         P1Dnj0s6cVz891cO04+7EySNZyKHRIlkNCAaWHWwKamRzdjNwNUCIIpJBSPtHz1oMbNr
         lKq+XLDFlxFd7ZL4xaQEoyB5ruF7FOaN0uT1tysAMSDpxQK7P27htu0B68LYtlQ4fOwu
         k6tNevifwMVjmyYw58lmVW7CX/kGvmxhgW5J6bIcxmxjnq81T76k0kzGLEzsw+YX4lt7
         dSRQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSJVwN5RFddQyaiocbZ5miAPThRPtchlN5aPtySChGhud5sLsx3eM5YinR+mMzUKkJHc0uKI5TglCiGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy67D+LflxqDRezYGO/WsxdawWW32C1I9qBbr50v8IOTFu035t9
	KSTslwJNh7mzDSAN/sF+CI/hv8suogplaUlYPf6G0Mi5qa5O3NOC6hNBCmvbZahauNp/ukweTIg
	8DbS2xwNJ6Lvuph4/XXMmJa2cRZzxEcA/x4jbHc5x
X-Gm-Gg: AR+sD13/wLjwpV7LyPx0hgaAZNkgoNHsY7ZzQehjnWxAyrhsHtpQGLKQN0mnSZsXXhb
	7EJe+YZJMYkUCMqAIwqfitLmRv0uzxPu16BE3sh2kggaH0DH/xU5YftxOw4Xi1pB3aXVZyuCiee
	ezRL6fFn0Xe3hPxPCnkhrTC7F094vTg/LgkbJ6fyDm+K++/zguIFAgXwPn1C098r8l84hrXZq8V
	E+bvQUMNMNbNvjblo9lD3psB8/AK78FgdvM0ot6UBZCRsb5Vep18nrQENnTo5qSOQC4u8Lzd/8i
	nZwTZmT9FPzG70xHjOP3epaJvV0wglP69fmZxzl/DuX4bew=
X-Received: by 2002:a05:622a:489b:b0:517:9c91:6246 with SMTP id
 d75a77b69052e-52b567dd3c2mr146717171cf.44.1785679117290; Sun, 02 Aug 2026
 06:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731074255.1513402-1-yuhsuan@chromium.org> <8733wycn2p.wl-tiwai@suse.de>
In-Reply-To: <8733wycn2p.wl-tiwai@suse.de>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Sun, 2 Aug 2026 21:58:26 +0800
X-Gm-Features: AUfX_mxIqfjxlZngG7yIPny-MZFBzrARiG088agzLhRTIkmbT8pHU76oVrbjIqE
Message-ID: <CAGvk5PoFzm3FyMhyDgqbVKQWC7j4EXh65W2j29L7BWw8xCO1MQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: aloop: Fix spinlock deadlock in loopback_hrtimer_stop()
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Thanks. I actually encountered a CPU deadlock during the aloop stress
test. (Resent as plain text.)

Best,
Yu-Hsuan

Takashi Iwai <tiwai@suse.de> =E6=96=BC 2026=E5=B9=B48=E6=9C=881=E6=97=A5=E9=
=80=B1=E5=85=AD =E4=B8=8B=E5=8D=883:33=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, 31 Jul 2026 09:39:35 +0200,
> Yu-Hsuan Hsu wrote:
> >
> > In loopback_hrtimer_stop(), calling hrtimer_cancel() while holding
> > cable->lock triggers an AB-BA spinlock deadlock if the hrtimer softirq
> > is executing concurrently on another CPU:
> >
> > 1) CPU A runs loopback_trigger(STOP), acquires spin_lock(&cable->lock),
> >    and calls hrtimer_cancel(). Since hrtimer_cancel() is synchronous,
> >    it spins waiting for the executing callback to complete before
> >    returning.
> > 2) CPU B executes loopback_hrtimer_function(), which immediately tries
> >    to acquire spin_lock(&cable->lock).
> >
> > This mutual dependency leads to a CPU hard lockup and NMI watchdog
> > panic when multiple streams start and stop concurrently with small
> > period sizes.
> >
> > Replace hrtimer_cancel() in loopback_hrtimer_stop() with the non-blocki=
ng
> > hrtimer_try_to_cancel(), matching the behavior of jiffies timers
> > (timer_delete vs timer_delete_sync). If try_to_cancel returns -1
> > because the handler is running, CPU A releases cable->lock cleanly.
> > When the running handler subsequently acquires cable->lock, it observes
> > that the stream is no longer in running state (cleared by trigger STOP)
> > and terminates without re-arming the timer. Synchronous hrtimer_cancel(=
)
> > remains preserved in loopback_hrtimer_stop_sync() where cable->lock is
> > not held.
> >
> > Fixes: bf08a5f698dc ("ALSA: aloop: Add 'hrtimer' option to timer_source=
")
> > Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
>
> While I find it's fine to change like this, I wonder whether you
> really hit a CPU deadlock.  Or it's just hypothetical?
>
>
> thanks,
>
> Takashi
