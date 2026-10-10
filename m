Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C978722B8AB
	for <linux-sound@vger.kernel.org>; Sat, 10 Oct 2026 02:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600526; cv=none; b=IxGy59kpe4i055LwGqqDtz43noOkKXqtrv5fK5qcMJTR2QaeZsZ/ADbx15fCEw5V/nAC04yjMphGnR19pxOyRtGNJ2n+5LzpXrm4t58jjgP74Ixqy8cF4/mxYf2xI7W3wMOZUY8jY0v6YCWk6oCL5L3dDR8NrFhYoQqDYrcYqBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600526; c=relaxed/simple;
	bh=PR8UKdZZVI65hHMoanhVFfK2UYdeJJzvlhtOcX9oidg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3H0vO2vY7Z+fpyfEB9EG5EscPD6U0PhzjeXhN9Qf/EwKw4kmXPfuVXhfZm+W4OGIf3K56n1efJPFNn3lrPBAwO8ciwp298igxZyn+yMZufAxYzQtLB8zOxa8HRKdUYyjQP8pwXuM6pXrEzNsOWOkqhbb1zRxHUfpHJrTtk7E6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YndYrzF6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YndYrzF6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso186096a91.3
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 19:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791600525; x=1792205325; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ol+wvlr2CdZCdXa+I/bU7xRVzRqJragTtCzufPOHHa8=;
        b=YndYrzF6jCtaHnRQgKf1m3MRopG9sNpN9THcpHxcxO5bKaRZKuKRFxcfkKvox18KQ4
         gER+ddoaUHD+6fcJrmxUx2CJ806r5ng3HT07x7f7kG/SNTqQAJ4d25RTFONVuHBrCq8Y
         nfsgnKxPviVKQlXW/xVU0BJSGl8b0pypk3w6kszsp0ZU47JAa+iBn6l4suCFDw2Ch7Iw
         kpXhBBTvyu2R4+8MpwIWuMIZSce86qtd01yLTAUhCvL9XoGavdBNeLFFr1rcgQPsc9w3
         Jn0u3ZMQHoxCrDUP1/rDRXn4pS5z2izqP7fhPOn1qiZ37YKHbDmiXqgH+QWeyyJpOwSb
         5uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600525; x=1792205325;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ol+wvlr2CdZCdXa+I/bU7xRVzRqJragTtCzufPOHHa8=;
        b=wvsEGwzWkRzK321cBtJ9GQZg1JYD4N4qUdx+MJ3aIRw9CYaQ4caiW/qz9H6KM1npIp
         Q+WxEax9IP3L4NRmMwqZa9eSdK76RYuX5lgXR6AWaINeqBmVh39u6y/l14zsJ7r06eB1
         XuoOz1uqsusIiPSv1UEJxdiSSbVlN7bXYAoZzM06JqU9rnSL99BpOgM3bM9kRoCrI1a5
         BE4rLx6Pd995gzinFh35YcJYT6Tla1tOg6KaOl1V+GwvbwKAOk+3I0yqbZOs+NCvXR0a
         UgQze57HZDYZDHuOMlLDDrD9uxNCWafukFfQ+UQ9bSp8JNour1pC8iS0B7cgUbjyJ30T
         BamQ==
X-Forwarded-Encrypted: i=1; AKwUvByw2W9AbhH2nY0KyKSJhQmulruqEtlXYoOwWXKXpfvzYQ2UIP1WBe+9+/mgheyJfBWNFIOmrvhbitDnYA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIubPj6No35zU3Jy16u2txuAHuOF7bBNYnIHMR+S76L5tbfynxa
	7RV4BigQr4AyZpAIl8vz9UdiNXG4RkOHmO1KQDTui0rv5PLdzXczoY77
X-Gm-Gg: AYBFou3OZ8qUbugCsxu/Xr9juTBkkXmSbMNmc6kJhtskebSFL2Cr8zkP2YuZZ4PGSmr
	EijZRdVDGk35aX4ehwQFWOinDJCFHZCOvI9+C4ENag21PpKWh5R3Ro64t8dva1GQ8OdoPP4/Dyg
	GI6MlaDfBNIzdkTGnWaH+drdI4kRB/sNlHfUkBNaH8SmSx8wIJktVqtc8AZpb5CP9vhnoXHR+rJ
	yEDTYkYLvGALv1C0nMTms8uTSHyVPxUVbmRNzYY/5HOLrFtdPFgUli3pxkF+T3ADQ88mKzzqO7x
	ZB/yu2PeX4wAnJ14XYPGUylzZq0CIwGaw5qTVt5cshRtMvYgPs4jnFq7pHx5S3NA5DTY+f7UOju
	NHSRAkFzazc67MGyY4aKAqV37Cx1vnSuyYUYKcq9h3cTXdrV2VNdCgeEIG75ZxHInc+Gh9sWg7Z
	SEI6JmbJqb/BPOFJmK0MhOFzCls58Buw58hoJtvqz81A1EU6y8VeMsSeREzdM/oPZyMRm9eoM/d
	KchSku1DXV8ZVGnWT7LYwQAgD1B8gpsQBpWA16Icg01Mvsd1JRk2vuG5vFOcJxg+vuRrN3XLgBo
	9YfRMCm3tb4S0Po9yaxF9ULYnaOdoCKIKxsl42f9+XSvU251v6E=
X-Received: by 2002:a17:90b:5887:b0:3ab:364a:9532 with SMTP id 98e67ed59e1d1-3ab3acc548fmr3728946a91.44.1791600525144;
        Fri, 09 Oct 2026 19:48:45 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed040dsm7675161a91.6.2026.10.09.19.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:48:44 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple Silicon Mac
 audio
Date: Sat, 10 Oct 2026 12:48:34 +1000
Message-ID: <m3VYUqb-SXeeNuWXNMFX0A@gmail.com>
In-Reply-To: <20261009-daring-objective-flounder-c0b66d@quoll>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
 <20261009-daring-objective-flounder-c0b66d@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 9 October 2026 5:17:53=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:32PM +1000, James Calligeros wrote:
> > +    patternProperties:
> > +      "^dai-tdm-idle-mode-[0-9]$":
> > +        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode
>=20
> This looks like you put several slots into one. TDM slot is for one
> slot, no?

The codec bus keepers (which these properties exist to support) only
need to be configured on one codec for the left and one codec for the
right. We use the "main" L and R woofer codecs for this purpose, so
the extension of the properties like this allows us to specify which
codec's bus keeper should be set up, as we need to support machines
with 6, 4, 2 and 1 speaker(s).


