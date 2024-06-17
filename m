Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4918C190053
	for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616841; cv=none; b=UoGuXbct36tzI3yrGBZWD62rkrFGHSfbMmwCdzeBeM98U1AJD0Z9YCFSvyi4l5VVLGBX2QulJf6p+fJVnHZTuB8hQWye0CQTpcnmCThnOAnCSn2CGLJOqOtq6G84TsRT27jTtmOrVyxPqUV3/v8ZgoPLTjggl/67T8E7tlFxCj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616841; c=relaxed/simple;
	bh=7NSvCXohwZLOOlJWIUDNVZNNLgZsT49wKsS05NVWjKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSD7YZUp45mRO7ZOGpxzegbc92d8EpeeIzkM5QcM5zY0FNWlnSDd1XbJTX770LofjLULgJW+/ubWQ6t6fpcz0u4hcVHM+8evoYVUSEwrgdnYQHizpoFcruIaJYWWRMfwivf9fU6KZPfYGseKpQI85KEDrVpy+VpzB8tUHxnh/Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=cMEnLm7d; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="cMEnLm7d"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-43fecdecd32so20686151cf.1
        for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 02:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718616838; x=1719221638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dwjk23maxDbhwXR6knY3QoiO7g9DUPuAbXWMaxi9WAo=;
        b=cMEnLm7d6rQXhTRW5L2AZ7V5TKBCztTO8KfFVrdF/clZ8fsAx8wMA56OQAuSsJ1GTf
         S1SlRlKjbU+mBs4ArY0kAghfr/raUNz/EQUTYSnYCgLqrnK9wjzV1AYbXrK+ObCTk6fA
         IfRq/QPSJL1GEPInW4UtjBDtHndx1u1LDWOv8cbgftXz/esjc8ArW7MxPVoIg+zvxKyu
         yJ1Ub9KUiPflSMCCRcFIL23KY4GJqkl9pvpANkSTXLiRIZKrJ0udfrUBJI/UHMtpnDnK
         zyoBFWhiOTFAVeUylZ6R6THjQfF7RydR0aR1Apu/Lhn1XOat0LPYPx/gmUCw4pqc6Xio
         RY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718616838; x=1719221638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dwjk23maxDbhwXR6knY3QoiO7g9DUPuAbXWMaxi9WAo=;
        b=R4iYbEsO7CWVB4IfnOHBMhIxI1DPbFY0XL1FxF4qYI0aKvhXB7Z4Vla/H8jstHUPyU
         uiKLUM5HpgOnhY5x/9lwoWB4VJtRAGO1abq/Kguw4n8gNjQzVOD5z37ZfdXn22unFF/g
         4pEYIhZYr19MtnDyR003LkrY7SOoYYmq+A4oPAvE18MAxdZNfy8Yl6CTjcErFDf9qChK
         I+xBBJiwH0XGqO/FKuQCF7oDhkc8jx76h5sMi9j8a1IlyrYzhKX7lhxpnN1+DttZRB4f
         HcY1Qmgn6guf1fTOlFJM21333dv7re4HWAXLZ4pfJZGS3QMwdYVlplOasB2pLVeqIngu
         Vf/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6OocmtQPgvC1BMCTPKiKNbL1eHepbQRlPejzMWxeb9VocCJd6i3q70o2o2QGspnhLyul/pnpgljCjL6f1ryA4EWl+IC/M5md+4+g=
X-Gm-Message-State: AOJu0YwEdAqHmJJ1FxuA0ikLaWnjM/NgmuaMdrw7anvZ71AGnsbECxyg
	X7W57znOcsnj9/HFfCX6W7gqbv+z4Vc3mPk4yQ0xZURR8DoOKSIQY7RY9UhQrazx0e4oXcCPp8V
	TEp9v1sDgqQ/z2duDJRSUs8fXlW/8mwgbF1bZrQ==
X-Google-Smtp-Source: AGHT+IEAX5KtNwSxz024jCUDuTs+t2XcQ1Uu/1Qu8JcsorpEu10yK9me2YfmiTGJCyrzuk8/c2n+Pk4pb6M+8oQC+gs=
X-Received: by 2002:a0c:fbc2:0:b0:6b2:9c0d:4849 with SMTP id
 6a1803df08f44-6b2afb7bb5cmr87920016d6.0.1718616838197; Mon, 17 Jun 2024
 02:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com> <20240614163500.386747-2-piotr.wojtaszczyk@timesys.com>
 <83cbf43e-c927-449f-8b7e-5c8d3ee8cece@kernel.org>
In-Reply-To: <83cbf43e-c927-449f-8b7e-5c8d3ee8cece@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Mon, 17 Jun 2024 11:33:47 +0200
Message-ID: <CAG+cZ06EeXUDiLsDXkz+6EHqJwpvv2MWwfpvB8AYw0=ZhUkTfQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, "J.M.B. Downing" <jonathan.downing@nautel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Chancel Liu <chancel.liu@nxp.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2024 at 12:01=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.

I'm sorry about that, it won't happen again.

> > +  dma-vc-names:
>
> Missing vendor prefix... but I don't really get what's the point of this
> property.

Is "nxp,lpc3xxx-dma-vc-names" acceptable?

>
> > +    $ref: /schemas/types.yaml#/definitions/string-array
> > +    description: |
> > +      names of virtual pl08x dma channels for tx and rx
> > +      directions in this order.
> > +    minItems: 2
> > +    maxItems: 2
>
> What part of hardware or board configuration this represents?
>
> It wasn't here and nothing in changelog explained it.

That's information which DMA signal and mux setting an I2S interface uses.
It's a name (bus_id field) of platform data entry from phy3250.c in
[PATCH v3 3/4].
It's used by snd_soc_dai_init_dma_data() in [PATCH v3 4/4] to give the
dmaengine a
hint which dma config to use. The LPC32xx doesn't have yet a dmamux driver =
like
lpc18xx-dmamux.c therefore it still uses platform data entries for
pl08x dma channels
and 'SND_DMAENGINE_PCM_FLAG_NO_DT | SND_DMAENGINE_PCM_FLAG_COMPAT'
flags in the devm_snd_dmaengine_pcm_register().
Typically instead of this platform data you would use regular 'dma'
and 'dma-names' if it had
proper dmamux driver like lpc18xx-dmamux.c

>
> Drop.
>
>
> > +
> > +  "#sound-dai-cells":
> > +    const: 0
> > +

The "dai-common.yam" doesn't declare a default value for this so
isn't it required? It's declared in others yaml files like:
Documentation/devicetree/bindings/sound/qcom,q6apm.yaml


--
Piotr Wojtaszczyk
Timesys
