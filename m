Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ADE416CE6
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012284; cv=none; b=TCj1JYJ0wuAMcDsxnmSd2z4jEOqvQin0RhbgAWzGLDMTcnNLuu+Z7TOpqLq3nwJVQ+K+CjpwzPQG42zdCEJW35oxskDsSqaV4fQtZVC/gANokxcAHbTiRiMOuYCH+1Au1Ho1JBQcvjxMrUO64Bkiuyrk462QFZ2rhb6LchBfinU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012284; c=relaxed/simple;
	bh=zNk6pJWd+v88a+9NOUGNQabXaXiV9hjQTgWFhpjOWl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNg3e3mn2wf/ju04ktDDboBKA1LJxMPQN7m239zcvTIu84SVjb1br51dn+v9xPjqS1xMDpbWEN67u7175+KLlnf3/ufw6TfvejPuu8PAWMB7P8JOFQMxkMv4GAkjL8D+36W+AulSRZA59Yk1zg0rz4nQa/PwdQEHLKHtpn+pvm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59ccf81e6feso1864819e0c.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 06:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012281; x=1781617081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/PRbin0hiFf0sv0V65HKQzKM0CIanlyTiYsPPuNvzs=;
        b=V56RkycZ2DlFkKtQiTtAFkyuGWrNrUns9DzwFLH9YzmSHTYTuUMQDtmBqAZmmRULlW
         vMNa9KyGyKjDP2dF1zHCUtazIWf3EJOcvSqC4K1+lU7U5mITl0lGACHdvpGLjiPsbhuN
         tVgtOpAZR6uUYi2d5CDgrvy+9zcE5mMjML3bgh1QD54NB7LmkClJb+Mn05v7cl+HtOPD
         T1IahKnkkc5vrpqD2JFIONN2lufEua1KiF3nQqx58si+xcnQLbHtCr9Gup02GR5e1KmZ
         FFzAUAIu+ZFRSkx8sfxOAcxFgql0lBUdljzH061GGPz4oM2wjMYIcqlBlK+Nm7G1insi
         IyvA==
X-Forwarded-Encrypted: i=1; AFNElJ99bxnt41b1is2D2HT+efq3YxH81/0oYFNK3giM5yKJ7fT2wrdTlv8YAklMvHU1tauQ5GRED1dji0/7Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxON4EfkUWJrw2o8h3JwCyMglRLc32Ex9k8abPI4zJbmOi4x2Ey
	LEo8GyNfvo6F0RajfIRlcZB3Dg3ocJBGBkc5IZzczEQsl1fYTc0+hT+Qd0+E9RPIFGw=
X-Gm-Gg: Acq92OHpAp6JZ6O8WvA31f8UikIzjV6uK7h6xSToNjrqS4ggT2JhQE7cwGwIAp9mwtp
	62hOiZ5opPHaOWE1Aw2kkjMRr+gVwg+fesbddBfAXB99M1QBheXnX6pKiUaOfSj6lHW8Je3kstG
	cclqEWjzqNjy/L6DmBPeI/johrFz4+6aXYOL2NuXG4jiY8yDer/yf91+2vXG7IPukUuJDrp6ayn
	GIXtykcnazFkpP1nUoi510dNvQ1vMkQiQYdXzf1JwUIs0hEvrGZJmfin0Kdd4YwZNKkwSl7TM7A
	Io+3DirEuoZZGVXgf6dX2GMQphqvmX3qDZzqrBD+Hx8PEcOahhlREaAn+VzaVSig1s67TFVd2GE
	68b1pb0ujcrPRuAc7pOgzPKDs7F0RszC+amuqvTLt+C5MYcMJ/5r25GXoudzcRlxNyZfKXvgj3G
	UC7mHC45AxC0XluWEbkjzaJfviWlhkxIlJVw2CgBvBn1L8Z2iJyu75RVkADuxTg6Kfmgm+ate6z
	zs=
X-Received: by 2002:a05:6122:d02:b0:5a4:b5ab:b5f8 with SMTP id 71dfb90a1353d-5b6347623a5mr1148902e0c.2.1781012281182;
        Tue, 09 Jun 2026 06:38:01 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6dcf24e93sm16856697e0c.15.2026.06.09.06.38.00
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:38:00 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59eb57ed4cbso1870717e0c.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 06:38:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/toEUp2VurvuNvFnpozRskehCrN3T4ZNkkvSK1F9T9qSra1tVgzVb4GiIQjPLiRIkd0Ei3TR7TQLogwQ==@vger.kernel.org
X-Received: by 2002:a05:6122:2a47:b0:59e:f988:51a with SMTP id
 71dfb90a1353d-5b634763bc1mr1142689e0c.1.1781012280533; Tue, 09 Jun 2026
 06:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87zf1le4fu.wl-kuninori.morimoto.gx@renesas.com>
 <178094130630.20828.12708103059145547835.b4-ty@b4> <fa7d7af8a780c27f85e29c518ba45e39ab18abad.camel@physik.fu-berlin.de>
In-Reply-To: <fa7d7af8a780c27f85e29c518ba45e39ab18abad.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jun 2026 15:37:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVWPxu-5BXAgWOBoWdNXxZ2zeAfTovXxftXsKuCUUDww@mail.gmail.com>
X-Gm-Features: AVVi8CdJQ9opFjMVwtIPNGUt6qVgHAl8SOhR-UuJZWuU9CAlreT_77PbJOB7tNs
Message-ID: <CAMuHMdXVWPxu-5BXAgWOBoWdNXxZ2zeAfTovXxftXsKuCUUDww@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: simple-card: remove platform data style
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Jaroslav Kysela <perex@perex.cz>, 
	Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, Rich Felker <dalias@libc.org>, 
	Takashi Iwai <tiwai@suse.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Tue, 9 Jun 2026 at 14:21, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Mon, 2026-06-08 at 18:55 +0100, Mark Brown wrote:
> > On Wed, 27 May 2026 06:45:26 +0000, Kuninori Morimoto wrote:
> > > ASoC: simple-card: remove platform data style
> > >
> > > Hi
> > >
> > > SuperH ecovec24/7724se are the last user of Simple Audio Card as
> > > "platform data style". It is mainly supporting "DT style" in these days.
> > >
> > > [...]
> >
> > Applied to
> >
> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2
> >
> > Thanks!
> >
> > [1/3] sh: ecovec24: remove FSI/DA7210/Simple-Audio-Card support
> >       https://git.kernel.org/broonie/sound/c/9cc93ebc85e7
> > [2/3] sh: 7724se: remove FSI/AK4642/Simple-Audio-Card support
> >       https://git.kernel.org/broonie/sound/c/deadb855b694
> > [3/3] ASoC: simple-card: remove platform data style
> >       https://git.kernel.org/broonie/sound/c/325fea33e141
> >
> > All being well this means that it will be integrated into the linux-next
> > tree (usually sometime in the next 24 hours) and sent to Linus during
> > the next merge window (or sooner if it is a bug fix), however if
> > problems are discovered then the patch may be dropped or reverted.
> >
> > You may get further e-mails resulting from automated or manual testing
> > and review of the tree, please engage with people reporting problems and
> > send followup patches addressing any issues that are reported if needed.
> >
> > If any updates are required or you are submitting further changes they
> > should be sent as incremental updates against current git, existing
> > patches will not be replaced.
> >
> > Please add any relevant lists and maintainers to the CCs when replying
> > to this mail.
>
> I actually wanted to keep the driver and convert it to using device-trees,
> not remove it. We have an out-of-tree patch for switching SuperH to device-
> tree support.

1. The sound driver is not removed at all.
2. s/SuperH/SH7751R/.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
