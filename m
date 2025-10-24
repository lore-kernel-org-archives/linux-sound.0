Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4622DF14A
	for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 07:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761290454; cv=none; b=PNgqUII/5bTjuUPMCYOMlH9WLlz0jp/w40Qg45doNHRhHeFYcysO/0U8gKrGTkBgil86VkIHNAxDyt4dIiaccAoD8tIKSe7AtD4wxMax2CfPbX4whkW7iShdyhPYqJTnECC9X9FnjqTVwL9ZQVkjlqqOG0+KY5pY+hw5Bp9Uo7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761290454; c=relaxed/simple;
	bh=CR+8roHK+/LDuQ73yW6ockKv+8Mv8IDa0Xrtz7eQhq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYoUVZbMW7Rs0kxCTQjlaw5ZeAFDg25toNjGIoY+BkQ7UYTjbCA0bUdYbZM48fQ4gx3wcinqFeRaeIiAD46Ld1TRxyEOjoIe1SCx14STw0lJX3q0ZwriPqNlYxXQhqtwm/HTEzXFm+EGCdEgrhx+ysctPaRnaggcGATNAV14I0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=do0n/H+0; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="do0n/H+0"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-592fb80c2faso787389e87.2
        for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761290451; x=1761895251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR+8roHK+/LDuQ73yW6ockKv+8Mv8IDa0Xrtz7eQhq0=;
        b=do0n/H+0YBdSMkTq7sBSXWn2/iExuSH4K0sIPxL9iTSfguBIyMA23Lt0sQVhm0PSy0
         0xOcYCLnv24GEMyEVQXR6ARjMO7Mu8VwfZzGGYTd2CkQ7DgrYJBnTyT8tXGIFBZcd+2z
         /7Aupadl9J7Add8zraBmNJfaTmayqpTtIQYwASfQ+2z9NaRvc8O2BOMxiTcgGNNatDjn
         aTy/UOiUjqg1hTXOt2qLk0r2MeMWkvJxIiPlV9sv20AD3ZIonIu05vFTjISc4bFpTg6o
         fjK97f4HJYjgLkswp9aaoSnhY2zJs1fHeFRj/b/czuWD1FFNJTn+X9mHV6UEvyS/RjPm
         4qIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761290451; x=1761895251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR+8roHK+/LDuQ73yW6ockKv+8Mv8IDa0Xrtz7eQhq0=;
        b=OO4DBef6grqHPkp3MTrA55Upe7qt8skM0DxCRy+jgLsCSeKH3Rmssu3rxlvluvf2OL
         Ckn7m7Cj46zTE2RWRCgz4eET9JpSBbsuz9kNx32G8YkR10jWvRfUX4A6OeglSHPrF1My
         f+tsqC3VEXB6UQFQ8Zp9l7tXlx2SBCOdhc/JB7eJwH3SNmrMsECQkC9l7SYtQXrZdH4/
         VXPa6gstJvcJ0Ek5mzHFoXS2LojOMQEIWZmSeIVSWVIhqqRfYlFti7FNJzNxedI9cmEm
         4hNrbMa/sQXtX2mugP6fBQUVX11fUk3B4oq6zqFhLd3V5QsyflWWGZbsqv0dQ64R+KmH
         f81A==
X-Forwarded-Encrypted: i=1; AJvYcCWM4Cbn+CbrRQDu14iGvCLMguR3jw1QaOKT9eZDuvGJSw+rm5w2WJbHJGatB3dE+/3CLqNeqQudYg0Bsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLN6dT8At2nm2qyjBPtC3x/x3mGG4DaHwEPyHq4+cEevIL2MWS
	ZIOR+GsJrwPfc3kDBmZv8BB2UpFttOEEMZVoNDpKpS0zKElbCGZsFoWbqZkIpFVvyM26GqbLviE
	lWTyhOsGA9l2us+pLkQ6D4ifUFjuoQouYNh72eQmq1A==
X-Gm-Gg: ASbGnctBjVQQ28w8OrKcGXMkg9BxlHChVhL6vSGixzfAY2kPbRa35HjLR49XIi9YmYg
	xet3CerJYFhmwDqM6AJBKaCbnGUgBlgZOcPEgys+SBbWGyUeCuxc1R3FJz3uqX1hwGJFd0uieCj
	JHD8qPnMaVNM4mhhK44o2cqtzrMqPPOFTzmwT87dTcyRtQOoDgYyi3pdCmV51pAlaHrX3uUWvBV
	xJAfF5Eh6Q/RhtjJvvtfpGgSXm8j4Mg4bc4nUhIz6Si2gLfcKtBi2KsO4F1uR+GwEVdvoNnWwKk
	R04QaPaCVmUaUizCZs5bPxbyxw==
X-Google-Smtp-Source: AGHT+IH0zdKNAnAn0HY8zeCAL8aa1oecPklr3WTZJPyPQRrZZ9JAeaLToU97/5gWoSWPOCpiqMgKR7gX6TBItcaDYYE=
X-Received: by 2002:a05:6512:220e:b0:592:f5f9:f5a9 with SMTP id
 2adb3069b0e04-592f5f9f709mr1849794e87.36.1761290451029; Fri, 24 Oct 2025
 00:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org> <db05003c-8ac5-49da-b0ce-e0b668f49caf@linux.intel.com>
In-Reply-To: <db05003c-8ac5-49da-b0ce-e0b668f49caf@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:20:39 +0200
X-Gm-Features: AS18NWBFHHtshqZfLTmGnpCECipG6SuC-vURJ7Hpik3InZgpuKVx4aYTO-AzQUA
Message-ID: <CAMRc=MdWjyTyJh5zfE5qncO8ABn7QSuV1CUZXa+cSMjWoXUrNA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] gpio: improve support for shared GPIOs
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Fri, Oct 24, 2025 at 9:17=E2=80=AFAM P=C3=A9ter Ujfalusi
<peter.ujfalusi@linux.intel.com> wrote:
>
>
>
> On 22/10/2025 16:10, Bartosz Golaszewski wrote:
> > Problem statement: GPIOs are implemented as a strictly exclusive
> > resource in the kernel but there are lots of platforms on which single
> > pin is shared by multiple devices which don't communicate so need some
> > way of properly sharing access to a GPIO. What we have now is the
> > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > doesn't do any locking or arbitration of access - it literally just han=
d
> > the same GPIO descriptor to all interested users.
>
> I had few stabs on this in the past, all got somehow derailed, one
> example was:
> https://lkml.org/lkml/2019/10/30/311
>

The main issue I see with this approach is adding an actual device
node for the shared GPIO which is now not accepted in DT bindings. We
only create nodes for actual HW components. All the information is
already in the device-tree, we just need to scan it which is what I'm
trying to do here.

Bartosz
