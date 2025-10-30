Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CD11E868
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 14:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832914; cv=none; b=YtMiuJYv9rfS0Ttxd2YRl0Wamr+83UCBEujTDxRiO/B3Ut42x75bFQgytlxUwh+PsejsdqWeUvJIwiRnB/wBSmSz5I//x1HHIVSPkMJ/8h81uFaFKu9DOuaQnKr+BpfHi811GlXGeKfpGFL/x66Nlvl3Kf3czjIrB6F09TJTYEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832914; c=relaxed/simple;
	bh=Ez9Ck8a0vFDjWaFW7yQc/XxQm/vx9CpdxqOM5+Cz0DU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D0lJuGm9xorS4SezOzQlwZUxojqUcaIzqbvkJ+qu0x7MR0WPOywGMq1LWOGuOHilmMUAFE6CsC+xsK7Zs3p4yh82ercSwvULoI4QA+yNagQO681pVJBC6Kc9CWbIUciOVRQ6M2Eu3/Q9GXTTAltVRzzJiKES4ctuxQDy4pXVcHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IieA8myW; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IieA8myW"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b6d3effe106so47624066b.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 07:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761832911; x=1762437711; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K9kue/PqLi5iz0mudeRJtK6kDoEwYvI49bfICJqSOLY=;
        b=IieA8myWdu/Dpkf2LmoO7mbEJ2XAkeT964T1IyDbrinoKqFdC20pRkj/2i6nlcFe8W
         8i5VUydkYR34bsUk3qMeXXfFjbBljDqdHv3TmY2uPxl1vmiWsiTgfRs+LpbvUKIZQPEQ
         DE1iLOnmwtc8NA8h+1srB67KfeDqpGfm9HSqrMBbIqlg2JzkR1Q15DjcroGQrvPHTbLH
         zwWfd3Jw+S/LR6jjweGDJfa0I4MJLBfPBj30VK99IF5LzOwM+d95j8A7zEyR8RxPyXsj
         u6bykVc09rfZ46FV7QeBMcW/0fLt0RZgnn+RhsZJgIsxydoufZGUI/GhFmLcihj8ZPTX
         Ta0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761832911; x=1762437711;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K9kue/PqLi5iz0mudeRJtK6kDoEwYvI49bfICJqSOLY=;
        b=Hf4THt1ha9i2xIK4KMkZwJiXbjOeaCRHjyo7NCzuCuDZ5eIuooPjYvS3LetFNZupcr
         U5hSBILGKZyFKMELf/acD7x+5IueBsFFOAzj7g5d7aDB0hQBJlLnq+jJbWfZ1MPHhHzP
         thX5IQDe2LQ7FhqEX9f7YmQYW/EEn41lahxl2SPnVOvsKiSwXeGf9lvGnG2pQ1EoDKgR
         f7qCLkG1Uk5BcNQrJNZ14ebL2sq9xYHSKABEZRdzY1lyjgttmdL1KsjCNtcdnTbNjmT9
         qSihGGIDAQl2QZyJlJrEuEsGgDnN20PEi3OjsJb8lc07/e010gFECURTKScjIAo6cOnE
         z2zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhKeN4VcyHelYosuPfW4GqRu8ZE7TfVKtNW3HAbkVsPMCfLT0s9mv2mpq1vilsRoMis0OQOuCiKrAX5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVYOTgkrBf8Eh2ATV6O5ezSX1ms9tCyWJMrIfwbQQ2QzdWQ4Q2
	A0T8BbE6H5/ZpsDEJ0MF44LkqnUFAZthu4gDTOxO/erUZQGCwW5v9bzT
X-Gm-Gg: ASbGncvBKP5BvbZNUExFjSP2K9W6HAyRtgX1aTjeSupu1sTgNcs/Adp2xXZS90QrQJO
	9520kZ1IM67RjLOigTGM5pJfuCvDFczItnR8ymyUyLPBo9aR2Bo53LrW/CYl5RtvQLYhi0WnjE4
	Q+a10QsKB/rw5QeQEONgmzaBtH8qkxTVeTj+BlOHHV1noVN057iuLSqwalBeaK/S2cA4nhoy9BO
	aHttFWghk9PGE22YkcuX9Z/e12jxmAo042hekRmOpYSqoyEz7G8i/Gg8FuNeCg4iz2pKODEh9GJ
	wfIvushXLms9v09UpKvdCO3c8u59PRVppsvTQyABFs72n7rz3T44PKLZEJ78ft8wKY4wVxQ0dsM
	yKZoKXo25GgA9H4g49/5IPXUXI/ygfktywKeQP7zJsVaC8Jde2/3T7IHpi/GeRF4+SZ9f+TUyb3
	VovunCoXaOMacFS1W2g4Xvstg5ORYLcVyc2pFaqA9jtdgnevwIFh2ua8DcPVvxxRtX43W5SMKfP
	2Qi0w==
X-Google-Smtp-Source: AGHT+IEm/43E4DI3T9Mp95lEihYPBVcNw0U7rk31oqk75XSv6jtyEKE8zvqZTUVdwgKohlYmGEoTqA==
X-Received: by 2002:a17:906:6a2a:b0:b0a:aa7e:a191 with SMTP id a640c23a62f3a-b703d5fa89dmr803764766b.57.1761832910405;
        Thu, 30 Oct 2025 07:01:50 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85398439sm1769963966b.36.2025.10.30.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 07:01:50 -0700 (PDT)
Message-ID: <40cf6de07208cdc624f71e276bfbff1e00079aef.camel@gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: cs4271: Fix cs4271 I2C and SPI drivers
 automatic module loading
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>, Mark Brown <broonie@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald	
 <rf@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai	 <tiwai@suse.com>, Nikita Shubin <nikita.shubin@maquefel.me>, Axel Lin
	 <axel.lin@ingics.com>, Brian Austin <brian.austin@cirrus.com>, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
Date: Thu, 30 Oct 2025 15:01:48 +0100
In-Reply-To: <1ae385ba6000fc5e90adadc6dcdc2fa8b19d5783.camel@gmail.com>
References: <20251029093921.624088-1-herve.codina@bootlin.com>
			<20251029093921.624088-2-herve.codina@bootlin.com>
			<06766cfb10fd6b7f4f606429f13432fe8b933d83.camel@gmail.com>
		 <20251030144319.671368a2@bootlin.com>
	 <1ae385ba6000fc5e90adadc6dcdc2fa8b19d5783.camel@gmail.com>
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

On Thu, 2025-10-30 at 14:54 +0100, Alexander Sverdlin wrote:
> > > > --- a/sound/soc/codecs/cs4271-spi.c
> > > > +++ b/sound/soc/codecs/cs4271-spi.c
> > > > @@ -23,11 +23,24 @@ static int cs4271_spi_probe(struct spi_device *=
spi)
> > > > =C2=A0	return cs4271_probe(&spi->dev, devm_regmap_init_spi(spi, &co=
nfig));
> > > > =C2=A0}
> > > > =C2=A0
> > > > +static const struct spi_device_id cs4271_id_spi[] =3D {
> > > > +	{ "cs4271", 0 },
> > > > +	{}
> > > > +};
> > > > +MODULE_DEVICE_TABLE(spi, cs4271_id_spi);
> > > > +
> > > > +static const struct of_device_id cs4271_dt_ids[] =3D {
> > > > +	{ .compatible =3D "cirrus,cs4271", },
> > > > +	{ }
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, cs4271_dt_ids);=C2=A0=20
> > >=20
> > > So currently SPI core doesn't generate "of:" prefixed uevents, theref=
ore this
> > > currently doesn't help? However, imagine, you'd have both backends en=
abled
> > > as modules, -spi and -i2c. udev/modprobe currently load just one modu=
le it
> > > finds first. What is the guarantee that the loaded module for the "of=
:"
> > > prefixed I2C uevent would be the -i2c module?
> > >=20
> >=20
> > I hesitate to fully remove cs4271_dt_ids in the SPI part.
> >=20
> > I understood having it could lead to issues if both SPI and I2C parts
> > are compiled as modules but this is the pattern used in quite a lot of
> > drivers.
> >=20
> > Maybe this could be handle globally out of this series instead of intro=
ducing
> > a specific pattern in this series.
> >=20
> > But well, if you and Mark are ok to fully remove the cs4271_dt_ids from=
 the
> > SPI part and so unset the of_match_table from the cs4271_spi_driver, I =
can
> > do the modification.
> >=20
> > Let me know if I should send a new iteration with cs4271_dt_ids fully r=
emoved
> > from the SPI part.
> >=20
> > Also, last point, I don't have any cs4271 connected to a SPI bus.
> > I use only the I2C version and will not be able to check for correct
> > modifications on the SPI part.
>=20
> I'd propose to drop SPI modifications in this case, because by doing this
> you actually introduce yet another problem for the I2C case you are inter=
ested
> in (namely if you'd enable both modules).

sorry again for the confusion, I meant only to drop "MODULE_DEVICE_TABLE(of=
, "
from SPI...

But seems that Mark actually has different opinion... Indeed=20

$ grep -F "MODULE_DEVICE_TABLE(of, " *spi*.c | wc -l

currently reports "17" out of 23 SPI-capable CODECs. I just don't see how
you are helping the I2C use case by doing this...

--=20
Alexander Sverdlin.
