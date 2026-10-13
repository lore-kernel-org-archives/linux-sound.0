Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FA9538D6B
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 18:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917778; cv=pass; b=dCxu17uIeZdP0F9AFXzbQKL/PPqlehV9yd4EZ3jdTh2Mw86UN2hLR73XdNhyv7q5grtjNekccTJGHMmp4zIDlHWJlCPDMYvd8ECQVlc+2svOIQ3h8j7X/JH+adauw09i9e+InEUMnZky+DVdPlrjTk1tF/Csv9q2Ofx5F7CUBHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917778; c=relaxed/simple;
	bh=Npz6MJpL4OKnNkDARrkMIsl8yNRoSsqdy7nWQsZF4+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGr2HbKK+G9YlXA/zUwgbrKCVU90HmJBY+vjHrv314IzDvvSV8F0jngkTPf2zqyl2Ul1DaN8SrJcFyzXhznaN3KZ1TGcqySqLInTl/KPRTAZwk+w7GFEkuMv0DOhvncxwuyQx0R1b1/9M2IJSUIXcMZCBPMNoRX+/IBp27rHKpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3lQaqLb; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3lQaqLb"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so299426eec.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 11:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791917776; cv=none;
        d=google.com; s=arc-20260327;
        b=k0e3RPTRoXVl+/mZwc8IJuSpoSpVaqJBt9spn9t6celbg+YspwoyZW1FViTDRubQI+
         45MgQ5+6mZQZVeinzeYcoHCHNMR6IZN30iY5LUXFlZ5YmnzcUb2W5rm7Z1d7Sw+DwP/D
         6GOVXuMUGyLeRBZD9GXuoOmVHHUdw5FlLSWvIeR8oaLWVYSZH5eBd+tRnO/o5nRze/X5
         DnT+7AdPWeEOcR6b+NBtL+cu3aCbNtbsQkuHtGmnwKMDtFtfdlkqyWIuMiLA2ftsdRcj
         J6ThQNn8Kx/isWSyvb5pbaPrW7cPAlg29VUIfM6TGLdmWbJx1a7y0rb6V3ZnesxQORMd
         Uzuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sAjbH1ILtBe08WoVw3eugZuZwwhY23ii0JyU7xvzgIk=;
        fh=WmzXZjx4BSo4JukK5dmYDzPwTMHzcYrgKLPVY9cinkg=;
        b=fcnVMOKCrLR3ZfU3lymhIRB8OtZEIGLT5x4ISrmd/PmW4nv+nlYCb97IWY1G3h3/tZ
         i2+tWZL7CXE+Q0eFwTezJNugkFtosRumMs3Amx608MeKbD5Y1jZRl2mgsw/DlXig6h1J
         sdX4ZrFXSL5m4mfgD9uXms6sivh1ffFho65SJSyQpF9GRb2peR4IS0BYDnBof2gS0bEi
         IgLGsyCo0WH4o0akimBmPLQnMUIFX1+fv4nRf1iqw2PESrZJ3rp81Jg0Tcp09YekHCp2
         JMvehKzr5r2EmEiJ2Ir9WSFQm8JWow+0zRkiQCMewJ0oJ7T0bdv51P/hbgBmT/Dy+HU6
         p3rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917776; x=1792522576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sAjbH1ILtBe08WoVw3eugZuZwwhY23ii0JyU7xvzgIk=;
        b=e3lQaqLb6B5aGi4qjkf7UDw3znnRWVPNZ/Xi+a/e49uRYul0g8nN3D+HFHfop7vbjL
         SUpnXHSx/ai8Clo9ZQZyGwK/BduRM55DGLUUFwuUfa7uKEmFbozcNJktf4WZYxBj9Wdp
         Sru/3KWrKuUurJ2O4T8SfucLWJvHrmhCf2J9BxbTGuR+e8KKU+5CjHCo/KoqWMLVosWz
         0ufpIlt4gYUzVkR7df1yx97L7SfuujTjvqhLZsw6akRiUJfRjO1e7Gkx+u2C1Yra2mvv
         FskhKDm1Oot32W6RsNRW0IgWfoKtIZT9g204eWHvYRquz7zcQD58g8vMh9V2Frh5QBTs
         5u/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917776; x=1792522576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAjbH1ILtBe08WoVw3eugZuZwwhY23ii0JyU7xvzgIk=;
        b=jjIVZMc2bzpkH1/QnT2nQV8h46+yd+QQ9zO1OH8lDBx9QdeU9Mh90pGBIMUbUX4kgD
         Nf4eGGU5Xnul8NDR2woxFD+BMEMMP74NTUILf7F/Cj9M/aIl1KtURFlDQbrdzsMH4ppM
         nvdl5nO5U5ksyQkrobEsAXeAyOpZKbr4iTCbw6rG87nryB2PAOE/MZ+qntmO54RAwp4B
         LGLSFv91KsUDXEbXvozHqgmLniWd5ils1ZsxZv8es63+nxfXyhyI2vS3H72JDm1NFVnh
         PStua9KGevxv8C0ob1djkvzBnVERLJxSDnJAgRTaWNFnQ0rqzv/2vqvmLCKlCZOwKg6M
         uZvw==
X-Forwarded-Encrypted: i=1; AKwUvBxVi6xMSMJsoceeRBnbMH+SjUNO0H4Y2yIB2Iln+sJXe3Mvd4rvJlnsbK1EWIYSqfb3AmfS41MIoco1+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYINQw1wyJkfN+r1s7kVbNy+JksljHE/3daSARi1+wWvPwDFHwew
	4SRhBY7rhd5UAR/hEgdZatjuCOVWv+rXK/L1n1cKytV9LOqxjpSOMq57gENnV+ISPrYr0e8Jivi
	YK/vP2kVguhejm9lverUrsKNNVGOULLw=
X-Gm-Gg: AYBFou0oWSkHu9yDLeW2afxMVuHHa5wPNrvms+tdVKjxS65saPuMd4x7MC/cxyYtKXj
	oTnPWvDQD9Vas8ZIC9Tst7vZqFc7Q6L2lI2q8FyRynoz+UAkd0hjpQQlnyPvsbs75QyGjSAqGzs
	OvJq0BQDJIPPAv6q4tZxn/7CnIFKF8Spl1HihMSYoI+sENJJVeMlp5ICGIoJ4FM/I+sR+EVdM8W
	CA5axHxCmxW1ex0pYu20cD+sQbrj2MjFgp/2Mvm2ElbN2KXCEZAliulsZZZQFsJ9oMI0Z+/EJph
	aNT8F7BlI7cui6ekGaxrIt6hjWL9BiXcAUhbMdsB0cGsHfa9zB7wyjR4hdpNiF9CzZ5KuFAqEDi
	+wEyXiOgB/nrq
X-Received: by 2002:a05:7301:4714:b0:359:d728:ea39 with SMTP id
 5a478bee46e88-359d728ec5amr11295040eec.25.1791917775546; Tue, 13 Oct 2026
 11:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013183226.513658-1-clamor95@gmail.com> <20261013183226.513658-3-clamor95@gmail.com>
 <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk>
In-Reply-To: <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 13 Oct 2026 21:56:03 +0300
X-Gm-Features: AclHuK_OtQxv-lLSRNaI0a5fKQ3a0f0GrZurL_z_b4XMUDM8898Nfx1Ak8Ju-Do
Message-ID: <CAPVz0n0X58xfwhQo=V_5UQBc_cLfG8CqFPuoG4FqN9MM8MFisw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Support WM8994 by machine driver
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:5=
2 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:32:26PM +0300, Svyatoslav Ryhel wrote:
> > Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
> > machine driver. The WM8994 codec is found on devices like LG Optimus 2X
> > (P990/star) and Samsung Captivate Glide (SGH-i927).
>
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * tegra_wm8994.c - Tegra machine ASoC driver for boards using WM8994 =
codec.
>
> Please make the entire comment a C++ one so things look more
> intentional.
>
> > +static const struct snd_kcontrol_new tegra_wm8994_controls[] =3D {
> > +     SOC_DAPM_PIN_SWITCH("Int Spk"),
> > +     SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
> > +     SOC_DAPM_PIN_SWITCH("Internal Mic 2"),
> > +     SOC_DAPM_PIN_SWITCH("Mic Jack"),
> > +     SOC_DAPM_PIN_SWITCH("Line Out"),
> > +     SOC_DAPM_PIN_SWITCH("FM Radio"),
> > +};
>
> There's no Line Out or FM Radio widgets, you should get errors during
> probe.

These codec targets. LINEOUT(1P/1N/2P/2N) to Line Out and IN1LP/RP are
used by LG Optimus 2X P990 (star) for FM Radio.
