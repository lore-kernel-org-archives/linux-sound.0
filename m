Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E98132C92B
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507023; cv=none; b=tWN5c2/2adYhfbb/IyhPEFLs6Oa99BH0d0GIVuwPd5AClx3e9uOJOeGqT9IS6NATklZKKyvfLG/s++xee8pAoTXQ41PogXSbnezs1WUcxuQdE4enzpoIXgknk53IPs9EEDipKnju9wvnJJBFDt6y2mbCWK+vyrzUZ8OpjAUxn3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507023; c=relaxed/simple;
	bh=43+5PkYSSLecE9SQrt5AZOxblPUn6fLI2obB0pdB7Rg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujZwvex7k0hz3vOTPseXr59kHVZ96R9HboiZaoYAihLGf5q/EJTYc+UVUgGqhwXG4UdS8Xm/sRj3pTca56FAVMyGWd0Itvfe3QDgoc3LID5lFndmKzdKq3Qa8qngdWjTsuiSaTOK5i6KVgNIb3A1EWydVjDAat8s5PgdLwQ89Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=natD1mSe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="natD1mSe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA63C4AF0B
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 09:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507022;
	bh=43+5PkYSSLecE9SQrt5AZOxblPUn6fLI2obB0pdB7Rg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=natD1mSetH8Dli+imFjbLI90gUdb/Uv762wLtvqt4msRA8kIpu+wi1zlQ/E1mLo/p
	 PpN9ufEgR+Z1bka8eFPaaifhWJcdtNZxjytv8QNqgAlrUCXi6s+msBLJfqPaa4nPo+
	 m02QBKjg5EEqKlLS3may3ZtWyYl4g0/uGjoz7nMvS74PWR1B2egQU4udeLA3appSOx
	 c6jczh98DgRCNdn7hB/8mdsFo9lIVFDW/C9liBwPoPXrSzNzZv5LzbEUbc4+yGtdRF
	 nkWZjUjvcto7yX2g47h92jC4C4MgzGnOwgPbi5rCem0DLV7bBNXFYZq7+J1A8Vyn4q
	 AR7BJkpfnIelw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59b679cff1fso5354444e87.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 01:43:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVeI58LzzbQ+4c/rWuKABobYYqw0AnygIm5t5LNIkTm0UwpNVwOKDKTe/KzXMKEBQ+EX34Go5X1e5AlKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc716D1vUdgmOzl0ebG4oVewmL5M5vt/763PQGlJyvSvbbt7cl
	rjXxM7mG7MyG6hOsNCtOAS2Y3jotfpKhl1eJ2P0vd4DzEFEYDBahtL8AIIQC+rsKBWIoVcCHN0L
	1Fbk1T/O/nePLVACPxr0Zd0ZBlftWxyqJpR4eDovppA==
X-Received: by 2002:a05:6512:a8a:b0:59d:d64e:b3d7 with SMTP id
 2adb3069b0e04-59e040343d1mr474018e87.46.1769507021467; Tue, 27 Jan 2026
 01:43:41 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:43:40 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:43:40 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260122-sound-cleanup-v1-2-0a91901609b8@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com> <20260122-sound-cleanup-v1-2-0a91901609b8@nxp.com>
Date: Tue, 27 Jan 2026 01:43:40 -0800
X-Gmail-Original-Message-ID: <CAMRc=MfDP0PHTm9_vzSArVr7APK7qPiqZQERkPpBFKoPQrw2rg@mail.gmail.com>
X-Gm-Features: AZwV_Qh39_2kP-cSLOqOUxaAXibtQvi4PDbgUOq2L_s8-r1mjDdVrjD7WkEZ9LU
Message-ID: <CAMRc=MfDP0PHTm9_vzSArVr7APK7qPiqZQERkPpBFKoPQrw2rg@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: codec: Remove pxa2xx-ac97.c
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peng Fan <peng.fan@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Jan 2026 13:44:58 +0100, "Peng Fan (OSS)"
<peng.fan@oss.nxp.com> said:
> From: Peng Fan <peng.fan@nxp.com>
>
> With commit ce79f3a1ad5f ("ARM: pxa: prune unused device support") and
> commit 2548e6c76ebf ("ARM: pxa: pxa2xx-ac97-lib: use IRQ resource"), there
> is no 'pxa2xx-ac97' platform device created by machine level code, so this
> driver could be removed.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
