Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA5F32E12C
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712118; cv=none; b=Oq+w6BoLHSBba+atwIqNmbd5nay4mMJQS6fNt5/SlrKzcoJU6sHLDcltyhq+FjTum/3MuXVR3UlnZ3Ho/W4TlAhQzH2BrrtptsDc5BFwNbK7QqBneokTxEgXUAAaQcge5wijVWd0aoIMZWMrFg9pfhK2pfpBrR299hNc9wdqS4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712118; c=relaxed/simple;
	bh=oBSQ36jdJ7p4tA1XVSYrHcaC7Cdr7NKmhbtw7QMAtY0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nyt6y+3HfPPCgHjk55NgMvuiUcqZo12tnZmYpZXbmfoajZiOfXdmbuB3nhkW3Zuf5DnZ8w/DSlvrJaRWAiwnHNNOGKQoPeIz1c9SfnGDx9I2+qYvB+21SV1JmJRABj3hUX5s0ghk6y+HSbjq6hEFn9NQsNR77+lQ/EhGmuF/J7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YaSMHW/U; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaSMHW/U"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4710022571cso17033965e9.3
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 07:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760712115; x=1761316915; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oBSQ36jdJ7p4tA1XVSYrHcaC7Cdr7NKmhbtw7QMAtY0=;
        b=YaSMHW/U6NiUrL9CYZGdmdE1nyNvkQjjNfHIm7xqERYdDkNffXI5OnXpBGjbWsvxQp
         WEfmyLICeKc1X+h4WgqCpyJWjaPRCMTsU3R6kUySTOWoi85503AmwS2+WQd454W6/Ddi
         NY4xZ5+eSkexTOy3XTLUSeusFTRsD4mcXPNBGoSEMIzQ7/XU6MBcDemJzIuOTkd+dahH
         7o+t7swraqG5EE5TapAsD9G0fnRYvgEyApBUvTDimZYSCGOkgqZ5u4kIXUfL0EY7JmDm
         wYsXpXKCi76f++xK4JGDSrGDxdyQuWjZa/7AmpWPGBSJG3sOgyw4ql4TzEUQTeR3El+M
         3ySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760712115; x=1761316915;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBSQ36jdJ7p4tA1XVSYrHcaC7Cdr7NKmhbtw7QMAtY0=;
        b=Ym9iCRxiRoZPRZSq00lvZBnWfKIgUEa+Svb3pfNVVxVYZJnmx+t+IsozaGNC1S3tRT
         Yy0OQUTFOlW2QfrgFe/1Zl1xkRd8rQiLO78PdDczABTyUKi0Xm77OZXFW8gDi2GrCfsM
         TfABZwxbIF8ZZYudLQwAFf7Hd9uBtSrBv/lcbmLVjyt1IVFGurKwPBPQ6USvqKj1UeK0
         CtqDgPFfaXZuhV23gN14mnUnfPaMNx6trYR2M0vgYypK9zBAUxU0A5WHJgUW4qrVcv/q
         hBcKe+jY6N35Y2IH6AmGrZAwLOT95SKuyO6RPbg60x51EFwaOeCLugX5rsgDirZ2ISSo
         LwMg==
X-Forwarded-Encrypted: i=1; AJvYcCVIASONuZYYeZ3T7NRXHkeJPNk4OkPZyVOxXk32N56KGXz7I4kKdI/SoG7jlE8864ucbssfxVpxQUzlKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVJYB6KE6V/TptaWURzP0Kknd+IU+GDmsPTbzeM2tENUdEfiZs
	Ikz0ehFGpZFkccMUdVbYKUUGyhWeQyU8Bidbtdz4cpiuPcCXzitilZML
X-Gm-Gg: ASbGncuteGZ3GBYqy7DP/NMofjwoCMS8VYSy0S93v5PAIZPrjXZ7/4Od+zeLJ2zKBgJ
	8osITyovRJ25qWtSaha46517N4tnBtzpH8PdJdFxqmDEpoyqivlk5az1juXY4knQ+xOqhoMq5Ht
	Bc/c1VwALas0MkhTaSndpzf/xGZ35f76y9P2qLVC5TjRG4ODnUWjUIX17DR9WYSNuy5etb3DKD/
	iBA6i5zWWmYRqeV/y+KDcHh7uQEI3Z0nTipnNzi4Wi4Q4sBCzHQK+tiC0nUl7bLmZLfFIj0AJS6
	q/eoT3C+rQTMj0puPQLaJenU4ilndjyN0Kn8JbzH6NR6gDD8ecBoJjJxO82kZ/VpjFlNwI1tqV0
	1XQTE03c4Y6PuydTn4WpwUTTDEeB6ibyaPD2Reu4fsHpT2toUCdlkajG4KRpPIqlBmDj7CP+MP8
	t7EXEFDDuEbkjz0s5ZsFtqE0TYCw+tm5LIMfQVXG8X1PH0KX0T8lNrMt7w
X-Google-Smtp-Source: AGHT+IFQ90ELFgU0BrRaQYi95P3mmgyQo0Qy2JEhRTubX1kCBJ5evBht5ezOrZITHn5ud/rQoINpsQ==
X-Received: by 2002:a05:600c:4e0b:b0:46d:27b7:e7ff with SMTP id 5b1f17b1804b1-4711791f4e1mr29369105e9.36.1760712114480;
        Fri, 17 Oct 2025 07:41:54 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144238easm86630495e9.4.2025.10.17.07.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:41:54 -0700 (PDT)
Message-ID: <4b851d47bf1d03988a27671ae21208cdeed76837.camel@gmail.com>
Subject: Re: [PATCH 1/3] ASoC: cs4271: Fix cs4271 I2C and SPI drivers
 automatic module loading
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald	
 <rf@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	 <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela	
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Nikita Shubin	
 <nikita.shubin@maquefel.me>, Axel Lin <axel.lin@ingics.com>, Brian Austin	
 <brian.austin@cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Oct 2025 16:41:53 +0200
In-Reply-To: <d6bd466a5d11b016183db0ac3c25185fad3036fc.camel@gmail.com>
References: <20251016130340.1442090-1-herve.codina@bootlin.com>
				<20251016130340.1442090-2-herve.codina@bootlin.com>
				<60fbaaef249e6f5af602fe4087eab31cd70905de.camel@gmail.com>
			 <20251017083232.31e53478@bootlin.com>
	 <d6bd466a5d11b016183db0ac3c25185fad3036fc.camel@gmail.com>
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

On Fri, 2025-10-17 at 15:25 +0200, Alexander Sverdlin wrote:
> > > > In order to have the I2C or the SPI module loaded automatically, mo=
ve
> > > > the MODULE_DEVICE_TABLE(of, ...) the core to I2C and SPI parts.
> > > > Also move cs4271_dt_ids itself from the core part to I2C and SPI pa=
rts
> > > > as both the call to MODULE_DEVICE_TABLE(of, ...) and the cs4271_dt_=
ids
> > > > table itself need to be in the same file.=C2=A0=20
> > >=20
> > > I'm a bit confused by this change.
> > > What do you have in SYSFS "uevent" entry for the real device?
> >=20
> > Here is my uevent content:
> > --- 8<---
> > # cat /sys/bus/i2c/devices/3-0010/uevent=20
> > DRIVER=3Dcs4271
> > OF_NAME=3Dcs4271
> > OF_FULLNAME=3D/i2c@ff130000/cs4271@10
> > OF_COMPATIBLE_0=3Dcirrus,cs4271
> > OF_COMPATIBLE_N=3D1
> > MODALIAS=3Dof:Ncs4271T(null)Ccirrus,cs4271
> > #=20
> > --- 8< ---
>=20
> that's what I get with SPI-connected CS4271, and this is actually what I'=
d
> expect (linux-next as of 2433b8476165):
>=20
> # cat /sys/bus/spi/devices/spi0.0/uevent
> DRIVER=3Dcs4271
> OF_NAME=3Dcodec
> OF_FULLNAME=3D/soc/spi@808a0000/codec@0
> OF_COMPATIBLE_0=3Dcirrus,cs4271
> OF_COMPATIBLE_N=3D1
> MODALIAS=3Dspi:cs4271
>=20
> > > If you consider spi_uevent() and i2c_device_uevent(), "MODALIAS=3D" i=
n the
> > > "uevent" should be prefixed with either "spi:" or "i2c:".
> > > And this isn't what you adress in your patch.
> > >=20
> > > You provide [identical] "of:" prefixed modalias to two different modu=
les
> > > (not sure, how this should work), but cs4271 is not an MMIO device,
> > > so it should not generate an "of:" prefixed uevent.
> > >=20
> > > Could you please show the relevant DT snippet for the affected HW?
> >=20
> > And this is the related DT part:
> > --- 8< ---
> > &i2c3 {
> > =C2=A0 status =3D "okay";
> >=20
> > =C2=A0 cs4271@10 {
> > =C2=A0 compatible =3D "cirrus,cs4271";
> > =C2=A0 reg =3D <0x10>;
> > =C2=A0 clocks =3D <&cru SCLK_I2S_8CH_OUT>;
> > =C2=A0 clock-names =3D "mclk";
> >=20
> > =C2=A0 ...
> > =C2=A0 };
> > };
> > --- 8< ---
> >=20
> > i2c3 is the following node:
> > https://elixir.bootlin.com/linux/v6.17.1/source/arch/arm64/boot/dts/roc=
kchip/rk3399-base.dtsi#L732
>=20
> the above looks OK to me on the first glance, I'm really puzzled what
> is the reason for "of:" prefixed MODALIAS in the uevent for an i2c device=
.
>=20
> I still believe, that the culprit is the creation of a platform device
> from the DT for an i2c device.
>=20
> I don't have any real I2C-connected CS4271, but I think I could fake one
> in any DT just to verify how uevents would look like on my side.

indeed, that's what I've got for a fake I2C device:

# cat /sys/bus/i2c/devices/0-0010/uevent=20
OF_NAME=3Dcs4271
OF_FULLNAME=3D/soc/i2c@4000000/cs4271@10
OF_COMPATIBLE_0=3Dcirrus,cs4271
OF_COMPATIBLE_N=3D1
MODALIAS=3Dof:Ncs4271T(null)Ccirrus,cs4271

to me it looks like a bug somewhere in I2C core...

--=20
Alexander Sverdlin.
