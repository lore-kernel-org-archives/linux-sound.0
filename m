Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA9D32A3C3
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 18:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760724888; cv=none; b=kblrI2kWXx/+E2ouseXu+Z6xRZabVKev32tEEI8hWpnMwD5H+hP/ai7Dm5iP7s+WjKNmOZ/fyDVZzwdxTPOWiQp70D7h8oxYwmXBgmvU4mKuhweM5jxLXp+eHgNOS+MZQRw17kG0Ds1KmtZAFlgeWtTFEame2RuEbh7KyOkuVGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760724888; c=relaxed/simple;
	bh=ZwC6n7pCPxif6D+I/G208r1tw6fi7IyhziiTTtA6pqA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RvETHdADNWIYf4kdJLMj6B+lM05Rhc/GUJSccV93O6OMlu6qZE+08KyriS/Tm/qRzk7cYFXSLcHCcZiBWEn/ibyUphxouqpDoRdgO2m1aVvqqDWNc7hSH3YfwbeBnLZwf5GyFSh/8hYZqanWiXagrh57nUyfnzvYrBv7kEGNykY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmfwjvp8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmfwjvp8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47117f92e32so10661945e9.1
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 11:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760724885; x=1761329685; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZwC6n7pCPxif6D+I/G208r1tw6fi7IyhziiTTtA6pqA=;
        b=nmfwjvp8a+zG+3y2NY7RkqM/P1tzjJNj5GxqUsXAJC6dq7S7oDAFDk+F6X0rLAEH1L
         Mf6ipHpNxX/Cmgikf+lOAcshf3kXouVwwdPgxg7RCf6dRQUCuUCsjbHigoN2zlHbbGSD
         srnfkBPDLabnsfN/Xe0TfgrZp6OFvASG0Qy5CKEbDUpG5n4GjlRdMr9F4IrcXHRwk9NX
         9X7He2wLouHltwJKKHSzLpMLx9z0C3IBWKWMeCv9MB077/014PsrAyuUUJ1tOrBPfWGr
         tsPHF6Tig2UAxrA6K9VwcZDNSk398D8RihTKNeDPvkJuTwk1+pIXDFEsSIL9yOKpDWTL
         ON4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760724885; x=1761329685;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZwC6n7pCPxif6D+I/G208r1tw6fi7IyhziiTTtA6pqA=;
        b=rj0DKtLB2mnS0MKKUHAiyApHLPcR25Ge/gwyHKPUyDQ4KGUPFhcyO9PJ5rTnr9GwZ7
         Tt8Fcczex/cadgL+1Dy2ks2+hO1yWbpgr7ucI/uM57Hk/K/MLT0x7HGXiWpTz2WrK6ih
         vReFT91pjOSUPcQaZMKZojC3PsskZZJgD9dIkZcSv/lZRk5bq0FaRGrjhb6K+KVoL/g/
         IBPe+ccr+T7x+d8mGGMF90ylMB9hyY3t0RHMHwNGl0mLUL5NoneT1PW6AbPkl6VsytzG
         ktXFWZ2JDGWcs4M3jUbi7dvPwLnEPCktFjZ5/xBUOXghjCjEGxcM9yW1byAMKVqA/YrZ
         WaZg==
X-Forwarded-Encrypted: i=1; AJvYcCUdMCFzmB8slSjiwBC5ZZXZomFQjPmkPiSO2m3gyAdNA9IugbXX/3o0KJTYA0n+syIG/yxJFtwRjh9QoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqhWEiKd8E68dCoryAj5zoSmykMGwqX85sWbAFDjzCaBN7uMT/
	K9liNumUU6XJteIE6W4ulNjtsPUKjjuuJ+bsoLZspwYccKdrm/PA30C1
X-Gm-Gg: ASbGncuHGgIAxBbkBYHzdnbzdRA/xLywvwYIwEGDizCXVvcb+rlgyUuZ1DXWbxL9i3E
	E1lpKzXFIPsiaEr0LPTofY3gqaZrgmJJMqNT9RNRmxorOFgO4bo4HzuNP+pKM8f3pMa5Mky8yaX
	h0fVI6xICWeImbzO5uObMIOZ0liOX0elG0TtNmlQx8PPdbaZ3AxXsq+3qUKc2lDBWpTn4yIpRMT
	XU/PyzWO5zIG18xaZ13+8Oin/rvY2ifYPdyNfOSjUUWU/q/aoQGUuhyvkBEUrqWVrfniufZbS4M
	IT4ANRGA6RxID5XbZHaM7ltf/ReWM8CMa88hj6XGfbElxb1J3msM/rOmtJZjhdbx+9hkrxk5mBg
	mZS32Ul/YLtKTcDwoyT4ZgmdjyOq/7gNBGFMdO7mneraf/KhLmDwQnNUG4/Rl5PGjQsXjgMTxos
	QUk6hPZ5SoAnu9iGYAdpG+gjb3szwOoqK03hLx0zjQxhnfcns4uWWGptxKuD4QtbDuJj8=
X-Google-Smtp-Source: AGHT+IGStZ+dh8yVM8LCDsSNwdktgkY/Sq2aWVY3M4ozsGWWocHZl8zRjaDiyKmYeLs1M7NTvWtKrQ==
X-Received: by 2002:a05:600c:4507:b0:46e:376c:b1f0 with SMTP id 5b1f17b1804b1-47117876744mr36716415e9.7.1760724884856;
        Fri, 17 Oct 2025 11:14:44 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710cd833ebsm51894515e9.3.2025.10.17.11.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:14:44 -0700 (PDT)
Message-ID: <d51a3e4e0ea960df60d5ba91817ae50eba0a4026.camel@gmail.com>
Subject: Re: [PATCH 1/3] ASoC: cs4271: Fix cs4271 I2C and SPI drivers
 automatic module loading
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Mark Brown <broonie@kernel.org>, Javier Martinez Canillas
	 <javierm@redhat.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Herve Codina <herve.codina@bootlin.com>, David Rhodes	
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>,  Nikita Shubin <nikita.shubin@maquefel.me>, Axel Lin
 <axel.lin@ingics.com>, Brian Austin	 <brian.austin@cirrus.com>,
 linux-sound@vger.kernel.org, 	patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Oct 2025 20:14:43 +0200
In-Reply-To: <5f2aeb66-97d6-41b7-8c80-87674c1b14d8@sirena.org.uk>
References: <20251016130340.1442090-1-herve.codina@bootlin.com>
	 <20251016130340.1442090-2-herve.codina@bootlin.com>
	 <60fbaaef249e6f5af602fe4087eab31cd70905de.camel@gmail.com>
	 <20251017083232.31e53478@bootlin.com>
	 <d6bd466a5d11b016183db0ac3c25185fad3036fc.camel@gmail.com>
	 <4b851d47bf1d03988a27671ae21208cdeed76837.camel@gmail.com>
	 <5f2aeb66-97d6-41b7-8c80-87674c1b14d8@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mark, Wolfram and all,

On Fri, 2025-10-17 at 16:01 +0100, Mark Brown wrote:
> On Fri, Oct 17, 2025 at 04:41:53PM +0200, Alexander Sverdlin wrote:
>=20
> > indeed, that's what I've got for a fake I2C device:
>=20
> > # cat /sys/bus/i2c/devices/0-0010/uevent=20
> > OF_NAME=3Dcs4271
> > OF_FULLNAME=3D/soc/i2c@4000000/cs4271@10
> > OF_COMPATIBLE_0=3Dcirrus,cs4271
> > OF_COMPATIBLE_N=3D1
> > MODALIAS=3Dof:Ncs4271T(null)Ccirrus,cs4271
>=20
> > to me it looks like a bug somewhere in I2C core...
>=20
> IIRC this has been round the loop a few times and whatever you do
> something breaks.

it turns out it has been changed back in v4.18, with commit af503716ac14
("i2c: core: report OF style module alias for devices registered via OF"),=
=20

but the change is not symmetric with SPI, and SPI core doesn't call=20
of_device_uevent_modalias().

Not only is this inconsistent with SPI, but I anticipate yet another proble=
m
if SPI would also adopt the same mechanism:

for instance there are many CODEC drivers in sound/soc, which have
SPI and I2C backends modelled as distinct modules.

In the current situation most of them have MODULE_DEVICE_TABLE(i2c,
and are therefore broken regarding module autoloading.

"Reparing" them as Herve proposed would result in I2C modules being
loaded only via "of:" style modalias and SPI still via "spi:". Which
sounds all but consistent.

If SPI ever adopts the same of_device_uevent_modalias(), both backends
would require "of:" prefixed modalias, and it will not be possible to
load the proper one for the corresponding bus type.

What are your thoughs on this?

--=20
Alexander Sverdlin.
