Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAC813E03E;
	Tue, 22 Oct 2024 06:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729578935; cv=none; b=muECR/Mz80TBQOSCtg5YWWPqENpWPK6M32zlsCgU+6M0VkNkQopkKvjyjCbI3l+5+9C/mFEuhnqvMzmr0I1vltytabc5UypJPiFC+K8OTS58d+ESqbEHgEEBtwlwDEtt4V7Pf34GlMHKI1PxTF4CFtiebf3lnizT0uTyCYHN1u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729578935; c=relaxed/simple;
	bh=f/4LPkUrDgub4VPiv5XgAEJ7tHTuc6Y+P4YkJHZv/kA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=izFy7zXxXvYFfzpepiOreOhfl91sL1ySLgdPEmH+dTuewKg+sBjk9sTOKXjv0Nj1MnFviwXTMGAYAid73uO9XKOIDJiqLCS/SaiYkTZKufwlBPJGfiaR3436wF5JGryd/buj2agV4w6Nq+Rukh4qXBW+wo3thXljaayETLuAFtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3VTEpom; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3VTEpom"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315baec681so54063255e9.2;
        Mon, 21 Oct 2024 23:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729578932; x=1730183732; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f/4LPkUrDgub4VPiv5XgAEJ7tHTuc6Y+P4YkJHZv/kA=;
        b=Z3VTEpombUMH/ufnHcV9nwh9PrntSV4w8lzJreyQ50c73K9Y7KX0F6ONdxqueTs4B2
         ysR8H5nB0y9gzOsWLLMatIxGjdm8ECk4k1MQU6fUhdUi1RCrq0ZwAmhb6Nt1PGHYAR0b
         C79m/I2a+nqDaLq3bd1st9IukHmVMOwVqb2VDyZ2Us7fYjua1egL4hqbIXbgVd9mnsFX
         UZCwrREkS+ojG2ZB2F9gRxdVwCyEdz/IIA4r+b0qgj4pzDJy8RHQtvOTCgRRqfiqiQdo
         Bz+ArmmcN7uEb8WHtK/DkobFgrtCH4JBGq1s3TQ8w+Uf5I29+sjvyscBR5xlb6+RzSEh
         EX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729578932; x=1730183732;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/4LPkUrDgub4VPiv5XgAEJ7tHTuc6Y+P4YkJHZv/kA=;
        b=wBfLzJO+3+qRtdXSZQaMKKMzyLPM5uYRnVChmlxJHJBDjDo4x4ZBKGfHAkb/sLbQSw
         26tz27BDoOibWjvuvYpyHpSqSrUuaf1RRlbxCVsVecuUsp7OPTuTv4bT7IPXOalFj4Bf
         zrv5iwert2hZSGwBAVhA84qt0dh1f+a4uQ6hVRbeuwn9GtBF+GiHumMXInTQ559LT/Wx
         abNxeWnCE4meUePeoS/hwR8JgpAJjo0XIPxpM5V+CcUDm4ORn42t2vYbhvEUx+/XfVE9
         x2XJIPcOpGIedQVPTM5+QVq3exvgz6dSGWFMgv65wlhJESb0SpiRCHG22oDuRG+6sNsc
         e1OQ==
X-Forwarded-Encrypted: i=1; AJvYcCULAlWg1FifQ+DNRcruBSaI6gKz+17k+aC85WwIppc1LgswzriS1Tj0hiLVpxlnxMheSLfOQacZng0/@vger.kernel.org
X-Gm-Message-State: AOJu0YxRtd9re4mOvEjaEWxZ0iGjOem1kFfMiGJXcigHLqS5rAhiH92z
	2QHlIyYpLSNBFoVU0SmqLuMTkxZ1lE3mUcPVjBTGMvoiaBVdaiaS
X-Google-Smtp-Source: AGHT+IFTNXLsxN1R6wim6OUD8zZTTf4YG0tq1SCP94X8xnPM3vGFANeN3Se88tG012MdQ1W1KO52KA==
X-Received: by 2002:a05:600c:3b25:b0:42f:8515:e4a8 with SMTP id 5b1f17b1804b1-431616331e8mr114512855e9.6.1729578931543;
        Mon, 21 Oct 2024 23:35:31 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef15:2100:888:d3c6:a442:4910? (p200300f6ef1521000888d3c6a4424910.dip0.t-ipconnect.de. [2003:f6:ef15:2100:888:d3c6:a442:4910])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c2bf3sm78051685e9.38.2024.10.21.23.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 23:35:30 -0700 (PDT)
Message-ID: <d8bd85955bc5051f50b473028698f1c9d6b802ce.camel@gmail.com>
Subject: Re: [PATCH 4/4] ASoC: codecs: adau1373: add powerdown gpio
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Mark Brown <broonie@kernel.org>, Nuno Sa <nuno.sa@analog.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood
	 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	 <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Date: Tue, 22 Oct 2024 08:39:49 +0200
In-Reply-To: <7a8b1560-c091-4e87-a6f4-7ca7453b7414@sirena.org.uk>
References: <20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com>
	 <20241021-adau1373-shutdown-v1-4-bec4ff9dfa16@analog.com>
	 <7a8b1560-c091-4e87-a6f4-7ca7453b7414@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-10-21 at 16:30 +0100, Mark Brown wrote:
> On Mon, Oct 21, 2024 at 03:46:48PM +0200, Nuno Sa wrote:
> > If the powerdown GPIO is specified, we use it for reset. Otherwise,
> > fallback to a software reset.
>=20
> Ideally we'd also put the device into reset when we unload, but that's
> not essential.

Alright... I can do a v2 with that. Will just wait for some more feedback o=
n the
rest.

- Nuno S=C3=A1
