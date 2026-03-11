Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B672038D008
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 20:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773260124; cv=pass; b=Qf+1PRAQXCEka7Lt02CCi5g7i/XfKbpdJGGrRRRnR4xkdrmYA2kdUV77w3LYZxKfg6oDjYodcEoTBEdZTxHxAtatayeuZiMkjJTBQDJ4Aohri9sDy6fCJOhAWEIMVLtL9EhlRbyPc7m/OrSoK87PMZMv4eRvlSJGwtQ6BPu2sYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773260124; c=relaxed/simple;
	bh=qCUYBGAUOheU0nTCcMZyCl5y4dtCdasyHwmyMVbOBCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6VCVD+SBKp3w3B0MYHeKuk3qzQYC/pP403690IkRO/h61XQCXQ245F+PXtx+BnmxIg1l3X2jHDqT14CuoeTiNRnSZXz9R0HYmfMjbCgVoDBPIQzJUJ9TvYbFisbbGQKqIG2H3zbjbLKDhMTSIW4mouS1yPFB1XsuPujFThYE9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWe/prAY; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWe/prAY"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b886fc047d5so33405066b.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 13:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773260121; cv=none;
        d=google.com; s=arc-20240605;
        b=fqO0F+woJD53UEjYKtIGy7ChY7HGRvBeswI6AAp1GZyhpvxo0voD4YGs8v+AB4af9b
         E/bkOPcrfP7SvNYPT6nFEJUN0ABCKP1jkLFe6/CsT/FNiz8B2aVbldgCpITVSBjHG8pX
         ZcrcwcwDqim5aM0SsxUFe5RV9oS+jItq+5T3uBD+SMlTVJ+rEXaMu/av3EQVWcFsXxgY
         HgOahjOKCJEcyuWuqP8RjEbEIBEIP7RIyUi67dsD+557yqBlDB0yJM6043qaR9ld2jsM
         ECxVrjyTX8pc8iXtarQmusrhnvmz3GWDsBMkWsNnhrNept9l04HhxnrTQ9uwGw4KzzPS
         1f6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        fh=WXd4yPSFUmch7g3VwTRZ4Hi7CzVBbAUQJgMhiVnjbNE=;
        b=jV+aI+mcUejAbBxvrvqS9FERiSsWt2f+HiGidfQJmV2jdh+JO8ExvNCjkjEhd+Y9UR
         ha+DUe+cU2NQ1rwlkYagVzDrwEORZ75QXcdFHcFJjPYFEuNPqum3mSsVIOpbXBhCDq4D
         9IMhP4twr6QQL8ueNCIShQNPeAUeuUNRWFieevQ0FnS27B7+MNxlAS/Grwy93rQGyF/y
         Bp9rabwL6AcbTOnQIjRK3pHMzYMlpkaaReefKng+7G2J4fU1rk8rD7KOgABzJhwxugIk
         K8EXmbZGc8oGCiyCsMiT406gwXvt5NzVwTsFiBHzA6L9Rugz8NCVLRzP6V+Jz+h97XAU
         HB8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773260121; x=1773864921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        b=nWe/prAYzvBDiutVXiO6S+1K2vIf87NlcJjxfML+QuWQ2JitCchpJ0EET506sfrXvv
         yTqYq99l9QF3PfHVikdeebx8GwUPquPD9q449ZlwFS+Gmq4WtrvtfFwT3NRZxQL5R5Vd
         LmxYUDee4Gq/dzzYlZixAwza8lw7PWwWTa0XW8fQ13XWdwmB4OjH3rBvrsIz0DPh8/Vt
         opkVQQY1LGDxOUs5vestd7+UHQ24SjLdOTWKX1ix7I+rEA+8wEqUpk2vVsZ4FZCgoY7R
         k1FrYcNQAn/VR0SG2J+xoY64k5Hkt2owRDbGWJ29GCC34FAy65MIdVnhQhXTBbMWjhCg
         QFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773260121; x=1773864921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        b=nEssyWw8mgDdXQ5teqfjZ9LFXQ7d+coNQ50yOel4bbdiLA2mKGPSvlSRjxuYTwNcqj
         KFUNPDMZchI+64lhXj/ZKwgF99qwdszeBOblliJeVtmt6KUCea1pQ3KVa8DL3HJ2r8ap
         a4OPrHOK18Ygi9xmp9GjjsQyB5VjNlgqpZQxzrC/D0HIcZddlsLp/WWzJQtk4Wg0Wl1v
         X1HjQcQF4MTtFd8CcZAgHMxEwBJzIfn8cwQAWuk4jsjdCSmSOS5CJlTLzta4zT5oF/Bx
         C7AymdwiTl5yaZqDcmV5C9W5b7XLXDk83s07smYYyG29wU+a6X60BqhKMlObprqcKaU4
         fsXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1hFxHNoYl//nhCthWXzB+iN4ZXgAwJIjUaL0vzdyyskYnntJzeecp1lJ9WdHlbcRE8E/aIAhr9nwbbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzde4vIE9wOyz/vbOXTOPjI/TchVoRvHgZx/KiWdj2gPKoCbL0z
	H3ijJ2jJtaCm3cg4nhN3gqu9Wo0I3ak3j1ttwbmuNz0FGM1MZXjwblg93E70zqHEgTwwAgmryzW
	qikW/DhV/ysGqw8jxUg15Zdbc2lusKSY=
X-Gm-Gg: ATEYQzwk4WfLTBD93LW8gz/9FSR5oTe/kIf8shG5RJLC4EEKy1eCKX2BaVOoXOLT/cB
	JghdeCHaSY1m0LhcYFy/ZUdTWhVVaMRbHs9SxUpqd2k5B7XgpXsLdoTyT71Ih2G2QZtL7f2L2uJ
	b5DYAhFbLceRxt5ema1wy0JnrhPrafC5rSF1NCzKh6556xCer7zD6n5SY0besJbMkHdaes3NVvb
	/bpd4dj8VhtVex+XizAokus2ImGprUWceLz/jRr5VaRDiVTaGd6uZO3Qv5PkssySAsVrsVob6Mp
	9lRyN1jALNBQgX3FiuJPv/Byu1yGfqFB0/9CFsNU5PMFEaGRFuoS8zzKbZuXsXt7RvGs7YoIfym
	4Pj4owqCMP5EmvCziOw==
X-Received: by 2002:a17:907:fd17:b0:b94:1df4:3525 with SMTP id
 a640c23a62f3a-b972e20f6c9mr213172366b.1.1773260120699; Wed, 11 Mar 2026
 13:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org> <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
In-Reply-To: <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 11 Mar 2026 22:14:43 +0200
X-Gm-Features: AaiRm50gZlAiM-5_F_zUlx0D2HjCtugUtf3WuAOsTMIp9Wv8sMtNxrZngwvWk-o
Message-ID: <CAHp75VevThmDMm6VoVB9P0YbUGGGsmgnzr2gn9=1xtJZt-kuQw@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO support
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:38=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
> On 12/11/2025 13:55, Bartosz Golaszewski wrote:

...

> On Tegra234, the main gpio controller has a total of 164 GPIOs (see
> the tegra234_main_ports in drivers/gpio/gpio-tegra186.c). The GPIOs
> are assigned a index by the kernel from 0-163, but these GPIOs are
> not contiguous with respect to the device-tree specifier.

If I may ask...

Why? Is it sparse because there are pads that can't be used as GPIOs?

> For example, in device-tree, if I have a shared-gpio with the
> following specifier ...
>
>   gpios =3D <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;
>
> The macro TEGRA234_MAIN_GPIO(AF, 1) evaluates to (23 * 8) + 1 =3D 185.

To me it sounds like a bad design of the driver for this SoC/platform.

> This is greater than 164 and this is causing the above crash because
> 'entry->offset' in gpio_device_setup_shared() is greater than
> 'gdev->ngpio' and this causes us to access invalid memory.
>
> This is what I have been able to determine so far and wanted to get
> your inputs.


--=20
With Best Regards,
Andy Shevchenko
