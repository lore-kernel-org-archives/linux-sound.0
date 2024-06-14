Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E2919A2A8
	for <linux-sound@vger.kernel.org>; Fri, 14 Jun 2024 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718383620; cv=none; b=sbcuXMTX0jVnq62xRuDzGmXiwKuCCUddgILqdE0JvC9sRZPPVjlFkUgcpY/hdhvFdaBczKOdbQUPwHfQItdnCWKI4ro0v2OJSqE2MpCunT+erhNUlJdvSEW4Owt5LCx1T2CegsQcT4NiYnG8ptBx8rEuvTxD/mUYNLONABCOtHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718383620; c=relaxed/simple;
	bh=FLuaLPSxdc133WnTVEOu+S2w+iO0qN6ohvmaKluToUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwXKOKo+r0vRiJNqZOG7kF2qPtWzrBk2A+KDA4e/7r8iY5kdD9lbGJuICuJhFnWEjto6FY7NI82yElNu1GP7Mon/+5ApvCP+5A0rckFC8FshHZUlkiD3TLX9FYYKIPt6jwv8YVUAVaFjJE9dEqLFhKCCtHKrGb5jMqSHz8TuQyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=Cjgo+AQs; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="Cjgo+AQs"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7955f3d4516so307195185a.1
        for <linux-sound@vger.kernel.org>; Fri, 14 Jun 2024 09:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718383617; x=1718988417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yqs2Bs766IBEpVDwqnHittM7JULZRUAPIPpoZOOswLI=;
        b=Cjgo+AQsKl5aMGZBws658wrQqIHInzxJuijK6wYDpOoM/xFvvme5VKOkH/1V+VBzT1
         +6v9W/TKtjZg3hmvRfWVVxYukXnKus8X/ggao62VnR8YIC0TktEs756W+qJop4N61jqY
         15rk7J+dV9lcwvnHJy3hhwqQ6BrKLoP8kAdf+Mz0rfeXKngDRwbY7gCfAPtGSGmfmF9S
         8hBuy9s96DVv3rnwiQ5O3F5I3OH0LF4GEyqJxC9d7b6dih7lu9SOWC6ZocMpeKoAr/eT
         TCw1+t9W26uMYwdbtV0KKLI2z1OGarq1CHogIQc4fke2fWZh4e1Sd7SVs+HgjPlvluM6
         TaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718383617; x=1718988417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yqs2Bs766IBEpVDwqnHittM7JULZRUAPIPpoZOOswLI=;
        b=aoXDcxPZCnEIWVAWxn2/5Df9zsvmftwmtmLUsUpz8+lgcatlJ9JyFMz4Ll9PRpyRXr
         VCXLjYbX2tNMCyWEonTs+9QcFyV/xkaU84GdGy5ZnEedTsh6WPlQaHqTjPMlvh+zjhG2
         Bc+cNi6FQKC859PaKfktISnQ4olVJKdNTIYrASUeZFS5bvv+OHYqiri/M8AWepzf71+2
         HIKTEwhg7oWTPcFbAqFWiir56YgCnOh3GlBeMH2b8A7xmT8S+U2tpcg9ujiXQgnmtFN1
         ndBXCYN8jBiJjMhbu3wEWBXzdveT1Y/g5h9hnlfQClcmSdt6Su6nXFaY9hCqfs7RcYev
         gIww==
X-Forwarded-Encrypted: i=1; AJvYcCWysHZgC5/tbpLsAXTNqXZvr2QarDllz5/mGdmsZTknUFM4hFkWnOYHU9RcykqFOqhfzrpL56UtCs/z6124Je7RhjeUoAsSmyWATfA=
X-Gm-Message-State: AOJu0YzJiMrTTFVPvaorb8NyN+80LmUJvb5rpJ8N4+vWjb4ib3f1Wj3A
	5Plb75O2Pa0WURVr87Ogg9A0vwAlit0n8K4ApsjbNFmCHriVIU/QExHWBf0DWN5U8MLJtru/FDD
	qScMgpJoww2ZJft/wdy9nbqwlUjy5Pc7its7Vvg==
X-Google-Smtp-Source: AGHT+IG0IJ7dklCKXgFvzQnpQNQ7ndgkvwrYf/nZPEe1c+OWwBjZSeclPr61zSJ2azVgXqhXLF4vvSLpkv+cY1EpiAk=
X-Received: by 2002:a0c:c486:0:b0:6af:33ed:87de with SMTP id
 6a1803df08f44-6b2af2eef89mr48619646d6.20.1718383617492; Fri, 14 Jun 2024
 09:46:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <Zmgor8accyAiUkUO@finisterre.sirena.org.uk> <CAG+cZ06B+AexqvwZtNP5FX50AmghAFLa=1ebxmKLvMoyVJ529w@mail.gmail.com>
 <Zmxy-xA3YDU06Eht@finisterre.sirena.org.uk>
In-Reply-To: <Zmxy-xA3YDU06Eht@finisterre.sirena.org.uk>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 14 Jun 2024 18:46:46 +0200
Message-ID: <CAG+cZ05KomezPn0bAuZWrfO=rbyLdCU8_Xx11oEihUaD97gF8w@mail.gmail.com>
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Chancel Liu <chancel.liu@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 6:42=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Jun 14, 2024 at 06:24:50PM +0200, Piotr Wojtaszczyk wrote:
> > On Tue, Jun 11, 2024 at 12:36=E2=80=AFPM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > On a quick scan I can't see any architecture dependency for build,
> > > please add an || COMPILE_TEST for improved coverage.  As for all the
> > > other things enabled in this Kconfig file there is no need to explici=
tly
> > > depend on SND_SOC.
>
> > Ok. Later I will add a sound card driver to phytec3250 board which uses
> > arch/arm/configs/lpc32xx_defconfig config file so that the COMPILE_TEST
> > won't be needed.
>
> Why would a defconfig affect the Kconfig?
I guess when lpc32xx_defconfig enables the SND_SOC_FSL_LPC3XXX then the
COMPILE_TEST won't be needed or does it?


--=20
Piotr Wojtaszczyk
Timesys
