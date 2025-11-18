Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95613093AD
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 22:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763506704; cv=none; b=hz/O68dwFMp0/jy5UCd98vzQFNx3RWr0aFtrSjj0MZ/Ew1N1uEPC+/c95ZH7Phnl5FLe2AY8K4uhzmmtCmKMfMdrlmiGYh+FFjJbTuk4D5Bj7JOzXXY3HJqQNF2hqhOhE2VYblpI961u7D4ry9pOo0G+scunPG/fVXKQcsZQGSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763506704; c=relaxed/simple;
	bh=w+61w5T6iw2L+z7yyBk2vWNFdM7DOlMNfukQs3rBBhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rVmdEmhAFCtUgxualuoo80nFHV15TRsgajanK3b8unUIld0OQXjirhOeaGsRaZu/n9L+p+UxtQa2KM+zVHEYhIY/Exqq8c3r36pdERE871tgAtnENk7M3x9Tv+EW2xaSLqYDXC1VL5yOVqZ7mCqkMOHXLQsctrANWLKaSzagiNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I999fFip; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I999fFip"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59582673e15so5018854e87.3
        for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 14:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763506701; x=1764111501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+61w5T6iw2L+z7yyBk2vWNFdM7DOlMNfukQs3rBBhU=;
        b=I999fFipZH0VMJs1NWl2Y2P+lyilTmSjlh8soGhqclYfpREVuHV9251IqgmuDrp931
         vliDmAVxF46vufxmK3SYHtaHsWW4GseQB58lh5Enx7qEoXiHTyIlDlUmtz98L3NgP9QX
         bEbDyhkTVeaFnZUdkTQcUwpIJtjCLAZHR1m8U7rmTJj1ANjMY+8DSXT6oCtzjYFIY0i2
         9FCP0HsG96HWD4Mcc1dLvdrgMN6Ux2r9ZYnjjpFW3X+5VzYiMetGONFJcQn1OlAQFnZP
         V25T6k/1OI881/GNv/ojfnDPDGK9lHVRZd3NRW6YgrNMDwyDTTbA8JioDFDdd9OgX2FV
         6ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763506701; x=1764111501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+61w5T6iw2L+z7yyBk2vWNFdM7DOlMNfukQs3rBBhU=;
        b=kbyyC+Ml+5R9HQX+8vo1vROQs62i7i7cDONtJEjBEaom/PqIgcSCzPz4vKFtxWz4iI
         QFEgmEwmXtLKQajKiS8IlxXHK6fwvYBP5QdPB1GqdMg/Wx6KSI+hhPYM55oYuIiuKxdX
         LI/J14j3Xjbz/1d5E7lSQ6+x1qnh1rPC75RzSeO/e7USPE5OzDZe0Hs5f63uL0JE1zKo
         MWMG9ppTWr1/cVTtPYbGen0NyCly4JkH7rzLsDLlW6uEn5s6qOMUQ1w/VBVbGzSGX4G/
         Bg6oGuse6RJLiCpV7kbJkd+9eLX1cgsn8R0pc49p1Oqlq99eVXLYJjqptj5B5ysv2YuE
         CygQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5sJHDIC7SArK1JjLMCbNBF5mAQgPj3qwq0WKfRidH8P7n9rR3Xkq3GTqRCxGJGG5ndLGKl1t6EHYkwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycUk24MGoYLrLl135TCNvOVASQ1Nfkb5Q2CxI58T1Lc6bTDtZi
	hXxnVF1+3GNIAlhAZZ+CQJ4BJhR6H6lF/7UXo5J7AeIM7IKNoUUNbiFgJ6mVBnNbXoDBP0LWebZ
	TkF5O+BTAJafGhiBLQ5r0ypmRBCikHAvUETE1ndi4Tg==
X-Gm-Gg: ASbGncuZN8ek5qEH7zysmA/8sOtE8jsWcpHCVoEjoOkmv/S1OeyqnlHE0l+vJytxrKu
	y4TbkPMQefywtj2xUnDWyD0Xn0685ToqsTr1KEjRBxToWXyTWI7Z0YBEtsiIdH1mL69gULgcWTz
	cwvZoGQBigW5zBFgQP90RD1qBVrP4Fd4LUJrHy+msewq0pUhCg9sc91cCKWsUEXHXamFajuIOar
	rb2XGQZIG2KJptKZAVHsTgtmnofgo1fruAHRkkJp59NSogKtYSLIzf+I219cmWsVJa+ndc=
X-Google-Smtp-Source: AGHT+IEgaegsgmXSR9c8Hx3M4QpdDNUJIc1KFnkqGODlEyosq51AmUd5jf6mWflPCoaxnA933h/YZYR/OFhWE8sa4io=
X-Received: by 2002:a05:6512:33d0:b0:592:f48e:c725 with SMTP id
 2adb3069b0e04-595841f9725mr5921930e87.34.1763506700860; Tue, 18 Nov 2025
 14:58:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org> <CACRpkdbqLyeaZx37yrKjDFWb=C5c=vK6aPgnW8cMQvwi_6Jiug@mail.gmail.com>
 <CAMRc=McySdUtj4foEf5a2db8jUEa=CnPmVVms2nwHoO2UYChSg@mail.gmail.com>
In-Reply-To: <CAMRc=McySdUtj4foEf5a2db8jUEa=CnPmVVms2nwHoO2UYChSg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 23:58:08 +0100
X-Gm-Features: AWmQ_bkpyyk7f39_4wc6746I8bnl6C3ILvHa9yZ2lrW5div8cVmrRRgtpGXas6k
Message-ID: <CACRpkdYjL3u2UyD8A9uLWf1wU6jQXvAOhU5+Y6+8QXeTAe1ksg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] gpio: provide gpiod_is_shared()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 9:06=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Tue, Nov 11, 2025 at 11:44=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> >
> > On Wed, Oct 22, 2025 at 3:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Provide an interface allowing consumers to check if a GPIO descriptor
> > > represents a GPIO that can potentially be shared by multiple consumer=
s
> > > at the same time. This is exposed to allow subsystems that already
> > > work around the limitations of the current non-exclusive GPIO handlin=
g
> > > in some ways, to gradually convert to relying on the new shared GPIO
> > > feature of GPIOLIB.
> > >
> > > Extend the gpiolib-shared module to mark the GPIO shared proxy
> > > descriptors with a flag checked by the new interface.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
>
> I think you wanted to leave this under v3?

Yeah probably, a bit messy in my inbox!

Yours,
Linus Walleij
