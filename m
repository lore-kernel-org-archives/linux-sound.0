Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56EE3128CA
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 11:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736832; cv=none; b=UrVSsUz2gDKlodzQMAjL37hWt1AdZB/g+uDLEuxRzrd7Dwj9cI6GKIaryjzUMVRLeDGV/dN6ekkleCB1O3eO2jnx0uFIJyxoIYmh3OoECMKmEVlv8zxVzsmzLRMp5olEXLAVcCC3IQyiqR/9XN+0J0cWsODJy17urAD2Ia6UG3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736832; c=relaxed/simple;
	bh=/Lq1lPRHXdJOiVrLRakI46aOAQVAhyDdlFz3qv+W8D4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CgaW2iAGnRArQ7+DAYYc6dDtn/pWdxlMOoefS3YIxMiq+wlGPzSO+Ec/XQiimieXgw6SDhCl5SH/cm/9RQ6s0/QJkHOFNVL+1HICSQWB1tF9z/DeNuZDoXViOmce36fmEhJlpSWitrPelbd7vmfgz8XDTfApTkMEh5QNMDwkJjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxWxNvxu; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxWxNvxu"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-426fc536b5dso4922574f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 04:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761736829; x=1762341629; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7ql16YW9WqR8j8DuPKb3smT3vuE3z26xd898qIsWDm8=;
        b=GxWxNvxuYleJmWgmNxL5KbhLK0lvEyJnNPbupu+h2MmNUYndxNVq87f9Ze/jKewx6R
         gyChdHkvGta1D3VUWILjVwiKpBxj1viVNMvqqd4/c7kvSTPbIR9yHjOv7qvgGyNVykoG
         HIm71Tbec0k/UvQmUqirMjvYoW0Yf2q05VCkTIVjfqQD3EKdVwF0zWDB34/NTmNDHaH5
         DU9dnUeyF1ckvDS3ODJTfhs/7v2hGnJocyfkQ23UByPbAaI0/yzy2HypzAzy8qFybsfQ
         AslnqKs797lLnZwi633FvWGwC8wyoQ1NKq/qzJjT31aTNMbU6+eg8VC7JArMRJ1LME4n
         1B9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736829; x=1762341629;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ql16YW9WqR8j8DuPKb3smT3vuE3z26xd898qIsWDm8=;
        b=Wt81UYRd3frEiFNyjoIF9whJfcSHFl5UjciL94y/I9Tzpwo9zYzf15yMMUkfpeW+R7
         O/PrgS7E/cFwt7nj+BYOveZRQf6ZGaRvCBxWq6xHnsuajk8aV6antRdtZGQqScdkvYGx
         iIgvSr6uDF/HiRjjpVlavaNTo71MoWG5bPsTYJG25xaSeHP/YlTfC8x0Silw7NZiKhIw
         W1s2JU/R7skoD5zm0RkCI+siF9sKwnq4HuPld8Vr/GDJ1gV5mibVC6rJbmEa8ZbokGZZ
         goXIQBFY9BUfODghv/tdGdqqyNpRseOverHgKPY9TLD6ceey1LBdGi4OF+dyhICkBSyf
         tAHA==
X-Gm-Message-State: AOJu0YxGDbp8JfzKxADeyqAAeNApPUPj4cvgKkK7w02QwddFDAZ/UtuL
	v1Mpy4lVZPBMaRp3iN/4PcrS72YbppWysGL16PPxFEjKt4qPzhBjl50v
X-Gm-Gg: ASbGncvknglj7jSfgjDi5XIhUVxszw6I16pNpLnHlERQrUBQMP8LugW28g2poy4XzI4
	dIwAsyQckoxCF3FepCHNG98x84HmTAYWtdBbyrigY/j7nSxUpFa1W3/oFuHkvdQtx8784CMBKqi
	P83L6INJgu4QK1YS7m5bbxi3VuApfbkQ6wVHBLPprKgCGkcIYIrB97B7rj8L3MSw7lk6NAJV6AS
	XQegfrYnmdat0DryvWZdm+trbIz7jhuTqnPgPaWU7zU5pPdbzdbqiLP9ny6H+lM0ekGvKO8LB0P
	e1imRwGM9sTURXn6dgCLSvljifV5h5xKrb5QsaAWBzBPJZnoQxn1jf12HScGXRumO3Dyv28+BFP
	0JSkNmzwL/FYMuJovO4FeombPh6RQNpI4QFo7qGH+Ivjh6al8i97980YpOmg8j6PnR5MsQYLoRm
	LHmmIpaK6KJZrXci5b5vTkLUHm67+TORBrjiazfdM4Vy10P0jKtB5ssTM1
X-Google-Smtp-Source: AGHT+IHULzXErkSsEG3TMr3Q8o0v4oD7pQEX9oBN3fzux7GpGFXrbKGi1PsMMby5frMRS0kt4tylZA==
X-Received: by 2002:a05:6000:290e:b0:426:f10c:c512 with SMTP id ffacd0b85a97d-429aefef407mr1859148f8f.43.1761736828809;
        Wed, 29 Oct 2025 04:20:28 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5985sm25843460f8f.25.2025.10.29.04.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:20:28 -0700 (PDT)
Message-ID: <06766cfb10fd6b7f4f606429f13432fe8b933d83.camel@gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: cs4271: Fix cs4271 I2C and SPI drivers
 automatic module loading
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>, David Rhodes	
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela	 <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Nikita Shubin	 <nikita.shubin@maquefel.me>,
 Axel Lin <axel.lin@ingics.com>, Brian Austin	 <brian.austin@cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni
	 <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
Date: Wed, 29 Oct 2025 12:20:27 +0100
In-Reply-To: <20251029093921.624088-2-herve.codina@bootlin.com>
References: <20251029093921.624088-1-herve.codina@bootlin.com>
	 <20251029093921.624088-2-herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Herve,

On Wed, 2025-10-29 at 10:39 +0100, Herve Codina wrote:
> In commit c973b8a7dc50 ("ASoC: cs4271: Split SPI and I2C code into
> different modules") the driver was slit into a core, an SPI and an I2C
> part.
>=20
> However, the MODULE_DEVICE_TABLE(of, cs4271_dt_ids) was in the core part
> and so, module loading based on module.alias (based on DT compatible
> string matching) loads the core part but not the SPI or I2C parts.
>=20
> In order to have the I2C or the SPI module loaded automatically, move
> the MODULE_DEVICE_TABLE(of, ...) the core to I2C and SPI parts.
> Also move cs4271_dt_ids itself from the core part to I2C and SPI parts
> as both the call to MODULE_DEVICE_TABLE(of, ...) and the cs4271_dt_ids
> table itself need to be in the same file.
>=20
> Fixes: c973b8a7dc50 ("ASoC: cs4271: Split SPI and I2C code into different=
 modules")
> Cc: stable@vger.kernel.org
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
> =C2=A0sound/soc/codecs/cs4271-i2c.c |=C2=A0 6 ++++++
> =C2=A0sound/soc/codecs/cs4271-spi.c | 13 +++++++++++++
> =C2=A0sound/soc/codecs/cs4271.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 -------=
--
> =C2=A0sound/soc/codecs/cs4271.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A04 files changed, 19 insertions(+), 10 deletions(-)
>=20
> diff --git a/sound/soc/codecs/cs4271-i2c.c b/sound/soc/codecs/cs4271-i2c.=
c
> index 1d210b969173..cefb8733fc61 100644
> --- a/sound/soc/codecs/cs4271-i2c.c
> +++ b/sound/soc/codecs/cs4271-i2c.c
> @@ -28,6 +28,12 @@ static const struct i2c_device_id cs4271_i2c_id[] =3D =
{
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(i2c, cs4271_i2c_id);
> =C2=A0
> +static const struct of_device_id cs4271_dt_ids[] =3D {
> +	{ .compatible =3D "cirrus,cs4271", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, cs4271_dt_ids);
> +
> =C2=A0static struct i2c_driver cs4271_i2c_driver =3D {
> =C2=A0	.driver =3D {
> =C2=A0		.name =3D "cs4271",
> diff --git a/sound/soc/codecs/cs4271-spi.c b/sound/soc/codecs/cs4271-spi.=
c
> index 4feb80436bd9..28dd7b8f3507 100644
> --- a/sound/soc/codecs/cs4271-spi.c
> +++ b/sound/soc/codecs/cs4271-spi.c
> @@ -23,11 +23,24 @@ static int cs4271_spi_probe(struct spi_device *spi)
> =C2=A0	return cs4271_probe(&spi->dev, devm_regmap_init_spi(spi, &config))=
;
> =C2=A0}
> =C2=A0
> +static const struct spi_device_id cs4271_id_spi[] =3D {
> +	{ "cs4271", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, cs4271_id_spi);
> +
> +static const struct of_device_id cs4271_dt_ids[] =3D {
> +	{ .compatible =3D "cirrus,cs4271", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, cs4271_dt_ids);

So currently SPI core doesn't generate "of:" prefixed uevents, therefore th=
is
currently doesn't help? However, imagine, you'd have both backends enabled
as modules, -spi and -i2c. udev/modprobe currently load just one module it
finds first. What is the guarantee that the loaded module for the "of:"
prefixed I2C uevent would be the -i2c module?

> +
> =C2=A0static struct spi_driver cs4271_spi_driver =3D {

--=20
Alexander Sverdlin.
