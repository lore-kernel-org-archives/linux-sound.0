Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE8C2DE6FB
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 13:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759842825; cv=none; b=GnceDgHyflK+QINUZc1NFWrRl1v17iutVJgU28R8poIvVGt0a+gSUfryFDTs8MVb2ItdMoeD0iPs/n6tFhqJKL6vt+FTRVcr4kHx9OQtq4KPQCB7RZid/ryvSflFbiQnoC6lVe+FIqj0jfmaemgTv6R5QyqxBZ7ld7zdRIYIEGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759842825; c=relaxed/simple;
	bh=t0N+x/VGNAQttY2sxorx9dZNMTxHZKG1OWxQ7z8PFso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edu08al1YjEULR/HreqRDyd99b/5pCxf0Anc/7pW+4d0/1zlzYH+MSEGXwzGJH15epM9+SvSxUhXVIiUWZWbTRuEofDwExlNZswY/TeDtaPdv46kYQcqe+nWY4vY/3peaBCQot6oa8geHZf2932NCUJNqR3PF498HJtWpCTeFS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OpkeMj9c; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OpkeMj9c"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-36527ac0750so59219291fa.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759842822; x=1760447622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0N+x/VGNAQttY2sxorx9dZNMTxHZKG1OWxQ7z8PFso=;
        b=OpkeMj9cbEuqd2iTllQwOT9yVdO2fmEEfS/m+hUM0tUHgN48mBoIkT9BLHmLCL7Wlb
         1I4Wl4IqdVR7OrwMlzUdgd2raaJAlK+p0VBkNvpOODbVkbOslgiYx7G5jMQzGM9jdWKF
         FiVgfSs/g3PoEGlT4PO2KF5C0QOpj3sXe4xDurS7S/SlJpbZ9vXXC5lihfFxMDyriyy1
         ooeiOGOPQDcAchF5JGqJzFx0H/4WFsylmkV0hcQnJCR5bOxvJcFA1UxD7SrZ0u+87u90
         ODudjpiY1i3XQEsYtgz7Hog3C8bUp0VzKEpfQJUtinC2s6OpzK6JOSILBD8EsvgMkr74
         dTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759842822; x=1760447622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0N+x/VGNAQttY2sxorx9dZNMTxHZKG1OWxQ7z8PFso=;
        b=rT42dlZEKEJL0UPxpE4tAxBUV96Ie1nHZUSvuSfoZWmE0UByRjDsGGGIbPqlFKX2V5
         F381u8exlpJJ8zKHBcGOqQl2/jFd3u304r6aoKfj1ZAkjD6ZHgUYqUE7zzx+Fameex8L
         J4pT2gxBiI9nUGqQylQxC2HR+ujJ4uhTIUyfjO4rvsmpFkRRoVYfu4p6r2TqD4LIyVh4
         re9CjS/2FBGm9TkGnAm2PK39ya3upU07zFg3rgE20ZqEUEBqWDF0BqBZ1sEZIA7gtaou
         I6WNxRyUeThUzjeaP1Q7o44Yb7prgQle679h89v8IGV4A7e8TD3EKPfTp11a4pt3lcUJ
         wBlw==
X-Forwarded-Encrypted: i=1; AJvYcCVspVaKe3+zzIm0PN5+ENx6OygVXu7ol4UQvPWyIblpVToPAJwedoBkr/2rwht23axv/mV9TWi7jVkhxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqLkzTo/ZTu9Ax8svro6sLePyCktvgB/Jp4eEYiNmLIJQCWl6z
	5Vw1uRTVrTo2r4PTsLU3olPpPY6UqGwMJeU1SCbTk2TGx3lRKjRqeEMeAgM6+GE1jjaUEHmbwao
	9fDkVBFgOXMSGb4sHT3EKO5GIr1CbIdGUdx3r3lnBCA==
X-Gm-Gg: ASbGnctwNET9LVaWJogpyytPPnfHVcIlsIeoVlirUaPPv7zHWr+3djuhcO8+VDcN7o0
	Gr114PBQWWso3DGG34m5MqwnRetOpkHkZZ6Rvn1HmSBAT30le9sWKTXyohlGytiY4KfV7/LOL8T
	B9y3C6sgJ5oYXsuvfvtvLunm6x/peUp+UAi+8yLP2yM25xvYoj5/WMtPgMZ28NRLGIkFXxGq1zZ
	N6CQ6+iZo31q09h8klApzLACICkDVIxDVSLi8N7ISlFiCsXfiiXr9FlHqWC5dA=
X-Google-Smtp-Source: AGHT+IG7P5Lsywws5bBPOT8E7JIpupmd0eu9fkYQI1gC/FvLSNAcnVdx2QxXsM+KX1p4mn8AU407934CqwjnV4QazxU=
X-Received: by 2002:a2e:9a14:0:b0:36e:21a0:f212 with SMTP id
 38308e7fff4ca-374c38477a4mr56218171fa.29.1759842821852; Tue, 07 Oct 2025
 06:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org> <CAMRc=MfwEHGV-HZQURR3JNg1HatAeWO17qbRmkWUXTSBWj5jSg@mail.gmail.com>
 <80347dcf-419b-489e-9b0e-d901fbacc71a@kernel.org>
In-Reply-To: <80347dcf-419b-489e-9b0e-d901fbacc71a@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 Oct 2025 15:13:29 +0200
X-Gm-Features: AS18NWAq4ASQRRUa58ojinY89n-hm2wwAP_Re2fgpRgz7dBtx-tBmKEba_o3nR0
Message-ID: <CAMRc=McaZV=tUkzDGMYxXqkuEYw_KasKcv8QGdjw709UYZuGhg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 11:55=E2=80=AFPM Srinivas Kandagatla <srini@kernel.o=
rg> wrote:
>
> >
> > If they were called "reset-gpios" then we could (and should) use
> > Krzysztof's reset-gpio driver here, but we have many cases where
> > that's not the case and the names (and implied functions) are
>
> Yes, these codec drivers are due to be moved to use reset-gpios.
>

You will still need to keep support for the current "powerdown-gpios"
property in existing device tree sources so that doesn't change
anything. And what about shared pins other than reset? 'dc-gpios' for
display, other 'powerdown' instances, 'enable-gpios', all kinds of
uncommon names like: `dlg,cs`, `wlf,ldo2ena`, `speaker-enable`,
`maxim,enable`? It's not likely we will create a separate abstraction
for each of them. What I'm proposing is a sane, catch-all mechanism
for shared GPIOs that right now use a rather wonky hack. Also: the
drivers have no business knowing that they request GPIOs that can be
shared. This is why I want to hide it inside GPIOLIB.

Bartosz
