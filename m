Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0D139B4AD
	for <linux-sound@vger.kernel.org>; Sat, 30 May 2026 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134453; cv=pass; b=T+Ku3n/3TxhxEspRJYiFESnezv9FHvhADQ24U1DezCcUyaR4pgdI0R0BIupbBvzWxnSeTrHjANKs7uT3LY2zJAFhkx8DIYRRcZZD1EDIk10Ts0rg5LDOPsWev+Dz0COIc93LPoax+PB+mMb+HejUx5tSDLs7cS6AckfDYc4wnPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134453; c=relaxed/simple;
	bh=YnLY/uIq0MHeIUU0GiHv7hsHvbJb3s5yfhW9DXpM1N0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPF7HmTeexBSxY66EF4NScucDoViWYAE2MRy4Ok9kFnb/RDS4mo5tjUk7g2mjMs8FmvHsTAiELtFgMkYnJbpPgoXqGVfU60c+mEImGJk/kPjsQP9UVtgXbg4eKBHXXD82BOAq0yBpU3+Io/VL8y0DyzbIy8ut2oMxARpKwxFqA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMfBgqEr; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMfBgqEr"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so32614046d6.2
        for <linux-sound@vger.kernel.org>; Sat, 30 May 2026 02:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780134451; cv=none;
        d=google.com; s=arc-20240605;
        b=EVd/rbgNL+jE/4iRUgeyvvAIxciHwoB3yVZTZidAZTLaImeLpEAMDb9pG0P+BxsXXN
         Xr6HkrjOK6mHTkPIS2pOzCMki1BXm+7jwTJlKezrOxJ/tKf7UArS1eYoXZWEsFfmZ8Id
         RxyFj9JAYl+JwKpXPLQyUAwM2ftOmzmMkTjWL9FhvATEFZuYxLP6fWx1jUkn2Ngmmi3t
         auOqrg7K9e0/VeBMyj4LtyEyh6MOndUqRrRxZYLNl//dVp2XAPWzGq2Ysaw8TdUQNSEb
         wlQQoZ0uTifMnTJRn2OmfysKtCjz5zwBBFxAjdzCjA6u0JhfjOgoA2tp7hW4munSSSXc
         fEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oz3YRZffQ26ZGbOw1AGWWjvLi6zaQG9IZbhnachZ1JQ=;
        fh=lflRCqeg4EWZjitYsMJdsBY7JNBtWPVzPj0n04F8y3Q=;
        b=hKzwbaYFqnnBu1r81eM01XGDgEvX3gQdLCfTWAivxBYkIj50M5DfMtUXD5BnMVByqe
         qdayMi3u0vT7PSxCJLbtzgOOhpexEKtmWfNfeyR5AQQf4Y3oMg66crUOBPPNJZeYLAT0
         FYWzc62/9JxEDajKFGlMl9Bpp+83WM6GeiR3s5+yuUN/67NBW3yeoHqNlYkLBF/XrY/S
         304V7TcF5JJCEngc0tukJ45ui9Swb0KLkY9V/I06VKmwOn/aj/lcj909E3rdskUwiEoZ
         mBh5fsyROiM76q8HPOq9ulLkJPJvkZ8MpO/ejxnrGZjHOP+CDF8v9rqabEyfag5VZ4EN
         as2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134451; x=1780739251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oz3YRZffQ26ZGbOw1AGWWjvLi6zaQG9IZbhnachZ1JQ=;
        b=QMfBgqEr7K+THe+HBKxkPElNK9tZRLxyYElolXOFwWoF+durMlKLcQ3h5xa8J1Aa2f
         0SMJ1xcZjKJEQcBOIWhKLIFJWDVQNFbyvLmEsWrV9UxFJNklMLHD8G3AWiCUlW2W1HEE
         uiHz/ARjGQdQeb3GJA6tSsqpUr+ROD3eQoTClIxTlfRNVcjYMeXxuQdqK/yA189I1RcN
         kRmPt6xgp3P+U7Jy3iR2rHXGeP7z3ip2ZYU/SrSiVy60tN6UjI0y+yizs2DnnS92xScP
         2/V0MDlOtB+wZiyVMSOkX72tOUVpb0s3RW1qGSQX3F/TKPsrxZBVGT/js/r52mRrpufb
         x23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134451; x=1780739251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oz3YRZffQ26ZGbOw1AGWWjvLi6zaQG9IZbhnachZ1JQ=;
        b=VKTM4cPjjt6t3k4bJTLSainEVjDKOH2NOYSuOpEd7ii0kJTYhpPzetM3TLeAuUdFrY
         I/SIPfAA966+FBOXgJVT7VmXQPJnwV6Y0HFla7als0beed/SH/iS/bHrT4TLfRjOUq9m
         SPwD5hAKGEUA+0hggSV9ViFk5YWJVZFbOfB15v3MB3eynTJBStbQMPNA8/d7EQAmLhln
         A+8TiBL5gmpGZQcDdBe/X0KJzIj1x8P/ph/G//FMGl5GCrumiwwArB27o/IXJg8Pxdnp
         ggj12017l9Fcs2aJIN/iKuFIKIShuCIRtkJfOwXEcYNirczDMNljr94w3qUx1EeRHh7+
         hKjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CNU/rr3nwXPVNLLKL7AhDnL9oZfmVCMqyQFdvXVZgB3V7ST3Dy4Oo60cWcf7hiX+N8F4NDNUF27477g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVN1FFEKdkNd6bD66dBHBdBUfqgSeJWPxEhRj+ztCthk4Mp2IC
	YcJ3yX5Cjr6UhdsF+nprxOPtejFNy06vpboFdMd0jLtseAspuGUtyYwAgYZeKfFtpZaCgOSDv9q
	fW3bWU96Jacq2qwoG77wdofATN0keyqQcj1DPU+ZXKg==
X-Gm-Gg: Acq92OFCF2+FyCmAZs7JdHTt2Zl2td6RUvKMkmpEFwmFuEqOGmEN45sHjklYvNi0D2f
	L+d4uTr/FTQVcZ2ySpbGWNFxlomf3NZAwh8UM4+3oggkf6GrQB0ULzVWpaH1r+Uojzc/Xf7gNJO
	7Sq3vhHTgtiMJuTw/lR8InyutxZLM45megnAKy1cv2wu7gQbOAm7idWLGC5OYLwlYqD3iWF6y4u
	VqQviIlaSibQYh1kttB6GACU3b3La10m1/xWv6vUqaHz9T5QSem0GSrDLQ5AWfBzknunjGsipEu
	LDerJqi0tPowImV66VvL+HMXEpxE98uCta7dwZAiN2pil5OcDxuVYh8rw8ztfPzUYROBhtusorJ
	wSB8=
X-Received: by 2002:a05:6214:3207:b0:8ca:10cc:fdbc with SMTP id
 6a1803df08f44-8ccefd98b0amr53330036d6.23.1780134450763; Sat, 30 May 2026
 02:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530052812.115994-1-manishbaing2789@gmail.com> <c8209301-774e-4ec5-8685-c8453a84ae61@kernel.org>
In-Reply-To: <c8209301-774e-4ec5-8685-c8453a84ae61@kernel.org>
From: Manish Baing <manishbaing2789@gmail.com>
Date: Sat, 30 May 2026 15:17:19 +0530
X-Gm-Features: AVHnY4KAZWNK2RT4qjWm79BISQq-qXuvBUOBtqIHpTd5Bcj1PcsZbOxPtlj136I
Message-ID: <CAJvdc_f4MPNcUn6C5VGB5f_mmyeq2jQ_Ln-4CWxNTF7fcXhsQA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

I sincerely apologize for the massive amount of noise I have created
on the mailing lists today.
I am new to the kernel patch submission process and made several major
workflow mistakes in rapid succession.
I am stopping all patch submissions immediately.
I will hold off on further submissions until I have properly verified
all in-tree users. I will then send a single, consolidated patch
series with corrected terminology and constraints.

Thank you for your patience and for taking the time to correct my
workflow. I will do better.

On Sat, May 30, 2026 at 2:50=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 30/05/2026 07:28, Manish Baing wrote:
> > Convert the Atmel AC97 controller binding from text
> > format to YAML schema.
> >
> > The binding constraints were updated during conversion to align with
> > actual driver behavior:
> > - Added previously undocumented 'clocks' and 'clock-names' properties.
> >   These are made required, as the driver unconditionally requests them.
> > - Removed 'ac97-gpios' from the required list, as the driver
> >   treats the reset pin as optional, and requiring it breaks existing
> >   .dtsi validation.
> > - Fixed the ac97-gpios array in the example to use standard
> >   comma-separated formatting.
> >
> > Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> > ---
> > Changes in v3:
> > - Updated the commit message to include the reasoning behind the proper=
ty changes,
> >   addressing Sashiko bot feedback.
> > Changes in v2:
> > - Added undocumented 'clocks' and 'clock-names' properties which are
> >   unconditionally required by the driver.
> > - Removed 'ac97-gpios' from the required list, as the driver treats
>
>
> Srsly, stop. I don't even know where to reply...
>
> Best regards,
> Krzysztof
