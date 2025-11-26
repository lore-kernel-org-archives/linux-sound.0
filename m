Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5310B30171B
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 14:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167309; cv=none; b=X9bVqla3wKS2ti9f3POiLEIqyNJJlRMORv51BfPOGec85VIqPmqN9lax1i0asregDFrFUnE61wmMk1rXgFAe1xxwJyO7H5Na6yPsLafYL8NxsS0TmbC3IBNGDRqLzV6iknfzc1HO/QT6x55d7mISbMayv90gt/iUsZzqxZdTjLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167309; c=relaxed/simple;
	bh=RN30k8HzM73JgGT4+Hmg4UWVBm1+ESD5dIcHIzaZOQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VK5xC4gzA3tfslkKfhZHKjC2eLLjvrG1lTgwS68JNqL4nS2PLmA9+qQqPUbTlP49tMHGirF4bGCkZ3kAmy9QiARUs+yRxP1xRxYet+HRo/rukVMu9uVWJ72unF8Egw2xaz+xmRTfI7k1n4kefsVji2sBrwNwU2D8ALQ4ITlVv2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u4XnVqsX; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u4XnVqsX"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59578e38613so7773853e87.2
        for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 06:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764167304; x=1764772104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99lpnDtwvR5Caoe15DElF4/nsM1rUy76fnsNsLLTs4A=;
        b=u4XnVqsXhUgUuNrM6sCQ/+wFu2/nLoEhJvb5gjhzLyztc53eSubWAHkn7kLXRzXSek
         +h7bhQGh0Ntfbh9nlKeOHQgoIINugaAugdrMT/wbPqZ7j9+ceAIJiMC2DW7zaneqVqlQ
         VetOL0H209f6ODEJuIRs5kMhbDHwPstVHb8t1NnDl0T9K5wGVMP2JbvdtEQD6Ngahk0a
         zDZs0+i2P96RPzguhIDn9Vn0zfz8R0Oqk2I+PC2sEX8Qz09FY8Zff0ZYj4cVUCFphKl+
         1VyaWSkTh+kuhtykMvWQJtCrBaZDiY61Fr/GB2VfCRa4vLAHDxJPtz64p9m25dgVuIIN
         KUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764167304; x=1764772104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99lpnDtwvR5Caoe15DElF4/nsM1rUy76fnsNsLLTs4A=;
        b=Ag2p09c30fsVR4QjGli1lBbYDUcCUEg0yYc4hiyOlIPSjtO+oWf80UigbNDFkViv9N
         nsHZJRVd0rYeY2JiAVmtmzEhriBb43CZpxGmW8GyHjrInOhbVDMzL1mcUjwi6uhR69oR
         zmNKUxxfocpj2zQ7YnRH0RgZXaJf0liXTR5DM7cD/w1WVvY4tJVxsh0d1Z9lPo/J6k0Z
         7eBDNrl7m6Kmclygm9QPAAI+CZhi4PMAQrnNZBkffnXidyW0XlP6hWJrczZ66eV4UQS7
         WepY/yhnOEi6CHvP13p7+4wqVdR67UMqX4mv2Gax2phL0za7vZVDVTfblWdjlpSw8iop
         LJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCWNqCWANjCf99/xeOk3YAty1cBxcAuzMbOfXqbZH0v1wqYVrk9cwhMATIMKP/l7llre26AZSN1fgTsRTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn4NfxqNZTx9phwX4QzoL1W4kfnO8Imrcw07Q2eTS50ARg0c3S
	glohhKYgVMY0lnTVms1lOpl8j0IAM6bpVb75B6V/SAf41fEHmLEmOzTu6LLonSzJKZO/ZHrTojh
	Z06asQLNtXu6b9O3MC4vLNscyzku0OfN2vhTVuEpYlg==
X-Gm-Gg: ASbGnctoF+gKxxaU6G2J6OftpiGvOX3ra7S6DIv/XEy2TyV+Ys62x5DVr6sVAuws5lt
	ORnef68nd4kuLxYRXjXR5aCWFaQZfuLjGuH9UpFXtDkE7Mtms0rl0GAffeYH85L9sHNolhHkPO7
	kEVORw8bOLDdAJKxzx1V2rZlSOF27/CWYvbTZxKgYfILtaIRC2eZVb1+x6EjjUy0MDlJTq8JFk8
	B1qwA17VlsnhDQVo5Pj3yKdGbBkXqzSf1Yo1xkMwNyqiBBHxmOWEXGDe/DhGP9RYkwHQ0tbr6zv
	inc/6HSj02tFo0MyrF0MvJ5Tnps=
X-Google-Smtp-Source: AGHT+IHk3ZX4aUUBolMwiCMXAcXiwyT2Dyate9UnnaEtVgZgfmV77bNvl6bV8cACmOgABB87QFqEt5N/Ut+6mcoRVj0=
X-Received: by 2002:a05:6512:12c4:b0:595:7d95:eacd with SMTP id
 2adb3069b0e04-596b4e4b76dmr2588737e87.8.1764167304291; Wed, 26 Nov 2025
 06:28:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
In-Reply-To: <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 15:28:12 +0100
X-Gm-Features: AWmQ_bk2gQa2v3AxwtOwsX10QuQjgn1DPsSzq3G8PlY09kgQ-V2J9JlUGzmza-k
Message-ID: <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
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

On Wed, Nov 26, 2025 at 3:24=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> Hi Bartosz,
>
> On 12/11/2025 13:55, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Some qualcomm platforms use shared GPIOs. Enable support for them by
> > selecting the Kconfig switch provided by GPIOLIB.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >   arch/arm64/Kconfig.platforms | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
> > index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3=
fd0f29e277af94f20 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -316,6 +316,7 @@ config ARCH_QCOM
> >       select GPIOLIB
> >       select PINCTRL
> >       select HAVE_PWRCTRL if PCI
> > +     select HAVE_SHARED_GPIOS
> >       help
> >         This enables support for the ARMv8 based Qualcomm chipsets.
> >
>
> I have noticed the following kernel warning on our Tegra platforms ...
>
>   ERR KERN OF: /__symbols__: could not find phandle 794981747
>
> Bisect is pointing to this commit and reverting this does prevent it. I
> am not sure if anyone else has seen this?
>

I assume it comes from drivers/of/base.c:1295 - could you please post
a stack trace of how you're getting there?

Bart
