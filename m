Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3955425A354;
	Thu, 30 Oct 2025 13:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761831812; cv=none; b=dxNQ4+/KBuV5lrPV/gMfKLCZ6Cy/iStcKp34ObJgf+L4fCb5UdhfrmbAocwAK8V6XjHoXFehqwHsug0Qes7bQ0o90eCPu9EsNo97lEi+eFmEHK/7MHmRT3MSrDLalPcYT+XZquU90bdNm0zAyxgg2qmZ2+i76hmDLJQjaLssmKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761831812; c=relaxed/simple;
	bh=+MGk1Y3VPikDiOf9J0ZfQJWgfYODUyIASv3ygzp6UYw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A5NP+RMq148W71AVzl+65S7F6hzzRFSwDP+lr8YB3ky3fh+EIUTgb/y1DE1IvGtBBDX0+tiJKPONtku4dPUKtVjSYePYCisBrhvMIWQnYpQ8bz2i0+V0KdhvMKjAoXwY+Tu5flXWriMJyPWszRdg8wJKh/5TMVQ+hVi278Mykeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VsKbr63m; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VsKbr63m"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2079D4E41406;
	Thu, 30 Oct 2025 13:43:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E705D6068C;
	Thu, 30 Oct 2025 13:43:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDF8A11808A57;
	Thu, 30 Oct 2025 14:43:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761831805; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vd/kfU9OxYb1b6llU5Rmw3RyZb77Ylq8cw6lND80BU4=;
	b=VsKbr63mPIs9yUvMKlkj3cNdzhRSAdzBvvf+pP5P1v3o9sHqExExNM501MGKnXkvdo5ITC
	iWeeE0K2WtXQC6fvAJUcEZm5KOxs431qM7Oo+rzyVuITNX+0N515WVLe/Z9mCM/QGdd5L/
	u5KRMiaWIlXu6FHp3//Ebcmr0rzaAFayHVBJ38WwrfD+nC+bDAd9OpBhjcrp6ocWfItjyw
	U3F9QQagbDox04QrE/9OUNBDP7Z7zYx6OmhZvOaJSJgMXJTDQ8b7F+gjzdEO6yxu8t6Ypf
	SSJn8xc7K0Noaet2ES4GCuVOG4UXOLyE6cTvw46ChwKydLojNFvfVXZQXsAFgQ==
Date: Thu, 30 Oct 2025 14:43:19 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, Mark Brown
 <broonie@kernel.org>
Cc: David Rhodes	 <david.rhodes@cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jaroslav Kysela	 <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Nikita Shubin	 <nikita.shubin@maquefel.me>, Axel Lin
 <axel.lin@ingics.com>, Brian Austin	 <brian.austin@cirrus.com>,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni
  <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] ASoC: cs4271: Fix cs4271 I2C and SPI drivers
 automatic module loading
Message-ID: <20251030144319.671368a2@bootlin.com>
In-Reply-To: <06766cfb10fd6b7f4f606429f13432fe8b933d83.camel@gmail.com>
References: <20251029093921.624088-1-herve.codina@bootlin.com>
	<20251029093921.624088-2-herve.codina@bootlin.com>
	<06766cfb10fd6b7f4f606429f13432fe8b933d83.camel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Alexander,

On Wed, 29 Oct 2025 12:20:27 +0100
Alexander Sverdlin <alexander.sverdlin@gmail.com> wrote:

...

> > diff --git a/sound/soc/codecs/cs4271-spi.c b/sound/soc/codecs/cs4271-spi.c
> > index 4feb80436bd9..28dd7b8f3507 100644
> > --- a/sound/soc/codecs/cs4271-spi.c
> > +++ b/sound/soc/codecs/cs4271-spi.c
> > @@ -23,11 +23,24 @@ static int cs4271_spi_probe(struct spi_device *spi)
> >  	return cs4271_probe(&spi->dev, devm_regmap_init_spi(spi, &config));
> >  }
> >  
> > +static const struct spi_device_id cs4271_id_spi[] = {
> > +	{ "cs4271", 0 },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(spi, cs4271_id_spi);
> > +
> > +static const struct of_device_id cs4271_dt_ids[] = {
> > +	{ .compatible = "cirrus,cs4271", },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, cs4271_dt_ids);  
> 
> So currently SPI core doesn't generate "of:" prefixed uevents, therefore this
> currently doesn't help? However, imagine, you'd have both backends enabled
> as modules, -spi and -i2c. udev/modprobe currently load just one module it
> finds first. What is the guarantee that the loaded module for the "of:"
> prefixed I2C uevent would be the -i2c module?
> 

I hesitate to fully remove cs4271_dt_ids in the SPI part.

I understood having it could lead to issues if both SPI and I2C parts
are compiled as modules but this is the pattern used in quite a lot of
drivers.

Maybe this could be handle globally out of this series instead of introducing
a specific pattern in this series.

But well, if you and Mark are ok to fully remove the cs4271_dt_ids from the
SPI part and so unset the of_match_table from the cs4271_spi_driver, I can
do the modification.

Let me know if I should send a new iteration with cs4271_dt_ids fully removed
from the SPI part.

Also, last point, I don't have any cs4271 connected to a SPI bus.
I use only the I2C version and will not be able to check for correct
modifications on the SPI part.

Best regards,
Hervé
