Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED983587A4
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 12:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741431; cv=none; b=ljqs87Anhr3V3D8JLwfZTdIbARaXQo+N17tPAvWuzsJ+EjAnLWjM+6TwR8nugsOp1kgw4YGLlqJYv8rwTtSuEVuZX5EVru0x5u9u2fwapduIkYsAMcv14bmg+iRAg+97HPCHsL2mFszU9ZzvhAVqcPvbrsE4mjiPpVSr/4pWBcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741431; c=relaxed/simple;
	bh=ni2P6AAAIna0hjFuAO82zYVMn0J7WfuU6b6IJiF1kKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXRXVjb9knIiiGpwOFnaQJSi4rNtNFLJs+DEvr+eZyg99H5CX731tChip56QMT2gTUZueGlTCbyF0DCQoQfvCv87Zpe0ffOjai1Vpp0CTAwPeaLhNeIBRZzEe6Jz8Pl0clcMpaKF15fToHdaUsHFZw0vFT+HIArwd71CZy9hsvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F87I/2HK; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F87I/2HK"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-592f1988a2dso1030521e87.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761741427; x=1762346227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7av6/+8iNuXmmgvTwlUka4Y7XmkOmuVd9YoxH52DeM=;
        b=F87I/2HK8EHJQ7q4NQauRZSN2gkF3Pa6uWaxKT5wFbnJ02O9XJM9CVQa76aAk0TSaF
         76edmu0GN4qf8O7hLOGmgl2m1E/wZWlSCbCwBKWravWbrzWOVNd2Wqlt7J+Ua6qOxZxV
         Vo25gJ6FNxMMGcNYpCsgsF/Dew11WFweBBQN5b/PSxkUJYaDWPJMhjW8sS4ajHDy6GUk
         UcOdOSnXu53Sjp2FtHMI3QAxxu+nHioY2KQfxl0H50DDrK7277Tkwx4zmGEf+2VqRYAC
         XTokfkhjUfDrPSSnkP3OTTs8R08HxGteHAfjxqZNthOIwQp4OQb3FHhc2UN/G9S0PpM9
         LdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741427; x=1762346227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7av6/+8iNuXmmgvTwlUka4Y7XmkOmuVd9YoxH52DeM=;
        b=OzFW5opQ+VdPi/a2XUaF/dEpLEfnWE3Nfwzw2NqbbWfek3dUlozHaNt8p7HHu9C2/I
         BQYWALEwwLRrFo7ZoZwJi7v39ezW7TuqZGarCcoo2BJoDYdLse+VTJIrdbxDvVyRqwnN
         a0aYBLQcbdcCvQuD4vSb03DJOSxmDN27TuKN46Qq56ckGoPL1Oe3ZKyw1D/1cF97c8b7
         L0Iwg/0y6qrWWG4PVYyBN9U729pIZZUD3c1LRFKzcxeDjsQY5UyO4hGhfKc5y672/96k
         i/L05KeA/3jluFen3uqMfxNq/SIrAznl/DsZR+OjZtsuwAy7mvppQ3zn+GtvdeDthaF4
         SLcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/MEep11aZByKypFXAqOYYlaxXc7pzXHhlawCY76kjz+u6V9OvBg/5SsHYzqMa/kPc0hqiZQhK7VsReQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeh/PK7UXc3GwSUwcr8UUTcXLZpdp8TWstsmDV73pH20Phyvuy
	po/b1XNjKI+WOtuoPeun42S0Fxqzi3ewmuwlxmB9rL/7mUvUaH9xyZwedEdrkxfbEuVQxHFJr5s
	+FQXp3PuDmybviza/SaRF481xjTTBMc4x3byOQeAXqg==
X-Gm-Gg: ASbGncufGK1Mf3TP9YTolo2Gn3D1eE/Sg1WXoNIRVGfF2qsABHjHWguinjHTeMxGJjx
	YrEJx3TCRnAUVgecqIj6wl8JKdR3nbpD9H7z+KXaZq+LCdZAuaHjUouV18KbsrFHBe62vtVVYyz
	uA9eJhxMcBbMh50qE3NC0QcEHIlCItvCq1LGKFfHraDmD5jeAEvSCvdgWy4QxngsCwp37XL3IUZ
	rWPv8hYEUzXYQBPEsGe61Oi3X45pL7fswer573jU4EPeRnPInxaObovI2UApRaf76s+ipZK7b/w
	WhnUX94kkkq57AgkhsTwqiQgnvM=
X-Google-Smtp-Source: AGHT+IEUmGu04036ormM4pltNB2Am321w2VXbEnKTAs3EJCIFCtIkYSiyRchfH1o5wZ/LZR6U90hsv4wZnUUYh2RdrI=
X-Received: by 2002:a05:6512:31d5:b0:591:c763:78e5 with SMTP id
 2adb3069b0e04-5930ee00135mr2032537e87.23.1761741427164; Wed, 29 Oct 2025
 05:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-1-71c568acf47c@linaro.org> <aQH9gE_fB119CW3l@smile.fi.intel.com>
In-Reply-To: <aQH9gE_fB119CW3l@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 13:36:55 +0100
X-Gm-Features: AWmQ_blmOzETrnBiOxNQNAG3OMw6fz-E4Nx4SOD4Wgu8a41SpvuD7mJ9RHyBeG8
Message-ID: <CAMRc=MdKfXJx-cxNr1uOCkifD6YVE2t5w4hkuYy7jcnidiid2Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] string: provide strends()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 29, 2025 at 12:20:37PM +0100, Bartosz Golaszewski wrote:
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
>
> ...
>
> > +/**
> > + * strends - Check if a string ends with another string.
> > + * @str - NULL-terminated string to check against @suffix
> > + * @suffix - NULL-terminated string defining the suffix to look for in=
 @str
> > + *
> > + * Returns:
> > + * True if @str ends with @suffix. False in all other cases.
> > + */
> > +static inline bool strends(const char *str, const char *suffix)
> > +{
> > +     unsigned int str_len =3D strlen(str), suffix_len =3D strlen(suffi=
x);
> > +
> > +     if (str_len < suffix_len)
> > +             return false;
> > +
> > +     return !(strcmp(str + str_len - suffix_len, suffix));
> > +}
>
> Can you rather re-use strcmp_suffix() from drivers/of/property.c?
>

I think that strends() and its boolean return value are a bit more
intuitive to use than strcmp_suffix() and its integer return value,
the meaning of which you typically have to look-up to figure out. If
there are no objections, I'd like to keep it and - when it's upstream
- convert property.c to using it instead. Also: the name
strcmp_suffix() could use some improvement, seeing how I wasn't able
to find it, even though I looked hard across the kernel source, while
I easily stumbled upon a similar implementation of strends() already
existing in dtc sources.

Bart
