Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FA11898F8
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 14:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475246; cv=none; b=sBel5kmQomG59JfKnELYw38vF3f/szZCH4kpwVEmzjkXleyKINUiEm7EkA1q4pJ5We7R9CMy7JlR0nz55dyGtO6qv8j8FNam/QYwmrzNjOfklfLFvTdNMew4P6QoSioNtDaZkmgzjUuZrb5NZLTggWZBLxNo7eINzJKdHroOLHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475246; c=relaxed/simple;
	bh=0oWXzIw3NrgikdygKFftKQaLFa+eqJmNB4unNCQZN/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXX81L2KhnFK19olpnPgyiX7DVyEziUCj7tyB42Q3oJxofBHZpVPbJ7Kl6eK1i+rCtI0y0iX+A4TureqinjX3xRtEkFy5aMf+vdlMebOKcPda9Wg5y+2TJRWzSoNXjg5pfPDhN+pNaglscOw28eIJ77INezNhV7zMAqIWMlrzfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VNe2uO88; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VNe2uO88"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-591c9934e0cso7508572e87.0
        for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 06:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763475243; x=1764080043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/hsRoPuxK0ArN7QijjTpiqRdVM4dQQwSNJXwTgxb/s=;
        b=VNe2uO88x+g9NCHAPX7nefpVdY4ApelKS+cewHfdy2xv/JGpCeWYY9eUnvLm1R84gG
         aTdR04gzbaeTyBD1UV7uNHLLNADqvcHWAc7jAGmqRb0NzuMyx+xNDoZiswjL/UmTuWnk
         aouoWp42YBDfx1LxzXNVgxwY0wYlAT1rCPJC/DPckJuTAaLBx+3nkm9XFlQoGYu+oH01
         d/47THufSVxHyaBOe5p3+tB3j0cz0vF5gcOoGUH3kG3vzqf04c2np0t5iHlwRFP8PkwW
         ISXMjU6GwdjK43pL3Fnc7iCqf4/Ar+IH4zLU6cyU4bNfaEvTcOjDpa0XelcNXGVKobrC
         RxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475243; x=1764080043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y/hsRoPuxK0ArN7QijjTpiqRdVM4dQQwSNJXwTgxb/s=;
        b=JcLmL4WuxgjIEkeLMqXH6t1cVn5TZNpNmxPm7w5UOucv1iOHRgZenMtuWO1MT9Twcq
         LASL1QENL4jgjMHXK+onTTz1PXbTyq4O0Q//ePUEVMI5sJb9pOaJHxYS+uA2rZN7hpN+
         LtMmkPAhxMCcMAKVG/q+d74lnXUGPU6D823vLpOk88f0FgtFB3/i9EJYFsMAAdh6Tqso
         2Qjzo14cidORacVCW8lfBt/vygcUla4AkL+YGujHzPn/L4rErFwJSrBhnqSL7JS09VG3
         FpkVyVDm+grxeKTsxqhvqvcWJnTtgk9WAR5Rzmz9F/TqTIzHFUwl9LR/FZ/9O++IAf2D
         qYdA==
X-Forwarded-Encrypted: i=1; AJvYcCWnxyvPRLpM1mafnnUZvPEgjoxZIhdXe5zs8lXRPjgDXX+t7nrzyzkmRADKUVrkfH7+ZOBu56GAv2ed7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqG++AlSUJp7cTVOKwMSpumdvJzyAY4I7c0k2E4K34CkWiIknP
	4EdRj8edCuVQ6+QGsb7pksbMBO/Ma9rXPmHhSBjFjv7qjGUud89U2FMxQh9G+OciveIFybH6htv
	bhVQ+IXvPjsn4/f5DOssDjcdAna2RPtQpIU585ACdKQ==
X-Gm-Gg: ASbGncuG6oIoM88fD7i84HjdvajFJ4sH7N3QhLLyCXZP4VoXAFR7TTXHY8yqWw5ek/P
	hkuWJxwNCGexpq66anfDwpAEx/zIrlVji1tzx0bB/Iv+mLA2oZV6SuyOfMLWlnt/6pvg9SQJV7a
	jxCEt13O1Lz1rzCru7J2n9vusQbJDIdq0tPMeoFe3qzWARmHlz2NUqQD/24Wzz3v5gIyDi2urMz
	CfevgPRbAhIHCx/tYrJYhNzd+MKCjd6nQrsDYdqvFC9kqCrXgFp5lPsG5qXOrjnCDjetfAFk9GS
	gDuhS3WcjqGT6LwGGmlxn6rif/8wWw1orBvP
X-Google-Smtp-Source: AGHT+IGJQ03bHhvSLT/Jw/p5/ciRMIhXOi1kKvgTg/A2ei7jw24+PyQrUs9nkeMJrkLlGxvJrjx4mWLznFJMN8Rsc34=
X-Received: by 2002:a05:6512:3d21:b0:591:c346:1106 with SMTP id
 2adb3069b0e04-595841984b9mr4734076e87.9.1763475243255; Tue, 18 Nov 2025
 06:14:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <dbe20642-9662-40af-a593-c1263baea73b@sirena.org.uk>
In-Reply-To: <dbe20642-9662-40af-a593-c1263baea73b@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 15:13:49 +0100
X-Gm-Features: AWmQ_bm5Da4wHKOxjtJ__aJHgfbf47KWT_x6OWvp3Fig-m3IkJbVSEO16RWkPHU
Message-ID: <CAMRc=MesD5HchG_hfvN3H5ayu8gX_OvSsZQ4UO4f27gx1rRzSA@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Aishwarya.TCV@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 3:06=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Nov 12, 2025 at 02:55:36PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Some qualcomm platforms use shared GPIOs. Enable support for them by
> > selecting the Kconfig switch provided by GPIOLIB.
>
> This is causing boot failures for me in -next on the ARM FVP with
> defconfig, the select affects all platforms not just the Qualcomm ones.
> We get:
>
> [    0.137360] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000058
>
> ...
>
> [    0.140979] Call trace:
> [    0.141037]  gpio_shared_of_traverse+0x48/0x480 (P)
> [    0.141187]  gpio_shared_init+0x28/0x14c
> [    0.141314]  do_one_initcall+0x60/0x1d4
> [    0.141446]  kernel_init_freeable+0x24c/0x2c8
> [    0.141607]  kernel_init+0x20/0x140
>
> Full log:
>
>    https://lava.sirena.org.uk/scheduler/job/2101484#L692
>

Hi Mark!

Thanks for the heads-up. I'll try to fix it ASAP to avoid a revert.

I can't open the link:

500 Internal Server Error

FATAL: remaining connection slots are reserved for non-replication
superuser connections

Oops, something has gone wrong!

Any chance you could get the offending line out of this stack trace?

Bartosz
