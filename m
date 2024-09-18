Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CCD3A1A8;
	Wed, 18 Sep 2024 09:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726651503; cv=none; b=RNY17L+9zw1PTbTsgIA18eHc7sv0NPrPOgfxX8vnlqWg2LpyBcRkzZ3ojol8FTQ7WG9yxo7k8mLfhV/kdigsRAi/Ibbsrz7ugfcyAwuVTErh7krlvV9k/WFymGMtdP5uOyPSCTktY4wJke+3fRZHXCmi1hiqOQ3QaIsq8+ycImk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726651503; c=relaxed/simple;
	bh=4Ckold4mqnpEic1raVAIRpA5fsbkH1jkSKs6+3JSmfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ln5fPGH/KLVhVYbHNgPfGkRv78rPQfqnCAZCb/t5QNhgZKLLgjIn3TfwQPOTIZ7SV8+Gm9VUIViKa9hrhEifdg8x+H272O7d5qMhhJPT5TZ8buW+I2s2e8Hl4wYWSSaPmknHiTCPOWN9KS87KfS08nhs7P+WiDdTDl2hOn0iMQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2z4cmAq; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2z4cmAq"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c423d496abso3626031a12.3;
        Wed, 18 Sep 2024 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726651500; x=1727256300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkNDpY07V25JTDLmYMQ0N8Bt4Opex80DRrP8orE+KJk=;
        b=N2z4cmAq7q3z5noUSMynX/R6CAzgLrSlP18xSUE97fi1r3/wtwAUFu1iHkGk8Ccedi
         oy8CecYY3hoy6OBALe27SaMHtBOTQjPHHGYhC6F49TG+CMnGTOcFZwWsjaBJNvb2MHHP
         65jUzR9AfWZYm4W9tsRTBih8iDnlDhb/hFncRSb0MMYqABMXbaSdU+skk2QdnS2NLS+G
         0bmwaIEkPOdspBvySEnSI2qY54shom5DIUOqt164CfbOWyz5RVwyZ01ocjxkd3gNlwJl
         bmYQDKV9SQjmItJbvrpWRPDCCDz73Zy/nwrS44eM+LCfn8/nwRjbVLhnz6E2LPhBSniI
         lZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726651500; x=1727256300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkNDpY07V25JTDLmYMQ0N8Bt4Opex80DRrP8orE+KJk=;
        b=ZY0EDt7n15rWSktokn3BP5qqj1mXliGgtFRy1/yHs2ZnqNSSU2F1Cbp6i/v/lF1bwV
         xuLQaIe6yvz4HC0jUKXNjmMOJ29IlGI8geA24j94y/84yQziutn/j7zurbI2YVU7iHiG
         ayp1ZX7MaNeIFOO9F0JXOOKpU5k+wFdeXWKDvJ5jmWPDOeW+JHjF0bAoqTvPLjVoIV8B
         hszgorPyl53RouQsbVU1NHc838MLj3WFN70l/E0GLEh12i0szIJ3GCQJchsgvh7GZY7X
         lgWuYdY/WIGd2GmuZ4hR/MPa3qM4ZfN/uVQJzgQKQMmPPTdMbGfOjRebA68OEIrPu4DZ
         Z73Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiGM4pwNh4JO0GtMcL8zkJ6Uc0Fux3dJbST5EIUO77rwNg6/1uKwpXb0lJCNl9gamkhSPNBCQmX1R0@vger.kernel.org, AJvYcCWyARgPKKmkbE7wmeIHiJQ/6LhpCUsZJPKeDx/qYgpV1GyG6O0CM5o4gh6AEhJMGq1vpWnyUaRCfQIk/aA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE6XjFXrUkm/3DMNGOu6vPmYKW2wNMXPTQKrLwsWUMMnTh4GoA
	Guh52Jc8E07Q0gyRXVIg+6mGNcJIbhDwE/LOEpRJOwa6rZOl4gx/tpu+6oNYeESlwUidJ7LmZid
	mpFYkc++9FuvRNLzzI2NpQ7s0WuI=
X-Google-Smtp-Source: AGHT+IELpoiFd0lCLB1yAYSsNv0EoCUJgRfKEMLoQxfu0an1ra0w4/nZbSMhzNKRAZncpaRhJTu+vGp40ilipQ7mj+Y=
X-Received: by 2002:a05:6402:2491:b0:5c3:d0b5:453f with SMTP id
 4fb4d7f45d1cf-5c41e18ad59mr26768552a12.12.1726651499548; Wed, 18 Sep 2024
 02:24:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <c44a6525d77941ef235825a58a9ea91f9f7d7042.1725518229.git.zhoubinbin@loongson.cn>
 <5a7357f7-da3b-4532-b055-ad33eb93fe1c@sirena.org.uk> <CAMpQs4JRz8x=zfB-DuDSxbcYDR=mtVET_AwawU+J9Vn=sx9LNw@mail.gmail.com>
 <eaa0b894-b4f7-4e4e-927d-216ff87e6f14@sirena.org.uk>
In-Reply-To: <eaa0b894-b4f7-4e4e-927d-216ff87e6f14@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 18 Sep 2024 15:24:45 +0600
Message-ID: <CAMpQs4LwAJoyRn7tT9BpiGcDcWyHPG11ZCPWB+ku6uzGikGcBA@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] ASoC: codecs: Add support for ES8323
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your explanation.

On Fri, Sep 13, 2024 at 10:44=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Fri, Sep 13, 2024 at 08:02:02AM +0600, Binbin Zhou wrote:
> > On Thu, Sep 5, 2024 at 8:05=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:
>
> > > > +/*
> > > > + * es8323 register cache
> > > > + * We can't read the es8323 register space when we
> > > > + * are using 2 wire for device control, so we cache them instead.
> > > > + */
> > > > +static u16 es8323_reg[] =3D {
> > > > +     0x06, 0x1C, 0xC3, 0xFC, /*  0 */
> > > > +     0xC0, 0x00, 0x00, 0x7C, /*  4 */
>
> > > There's a bunch of regmap reimplementation in the driver, the cache a=
nd
> > > I/O code all looks totally generic.  Just use regmap.
>
> > Sorry, I don't really understand this point.
> > Do you mean to use regmap_read()/regmap_write() instead of
> > snd_soc_component_read()/snd_soc_component_write()?
>
> > If so, are there any rules for using snd_soc_component_xxx()?
>
> No, it's fine to use the component wrappers if you happen to have a
> component to hand.  What's an issue is things like writing your own
> register cache code (the above bit is part of an open coded cache
> implementation), or I2C read/write functions if there's not something
> unusual with how the device does I/O.

Indeed, I misunderstood it before. As I understand it, we should use
regmap_config.reg_defaults instead of
snd_soc_component_driver.{read/write}.

Thanks.
Binbin
