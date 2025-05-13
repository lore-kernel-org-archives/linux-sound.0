Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A9828DB40
	for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 12:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140873; cv=none; b=HU214XZf0uo0pb7/BCV9nRZ7wFbFNFsIqhq+towsWFvM7gLAgnd0x19EjBk+JvGSKZIGLLBg9gSPXhkByD4zwTCD3PadXwxLM8Gu2dCYXMGsXcsfAxdU1TvZ8Masc6p6KCDz/1TAenGJzk5cZdHtACoXOhGofbXHfdeGMAeamac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140873; c=relaxed/simple;
	bh=FldTC7QPzO/JuYsWl1oV51mqVB8rbH1BdDCuwPf3AX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0ljePfSO5ONuMKkO6LrbG5N02uk8Gw+vonu8q+H8VJdhMy/ZOB8W8qqsyt6MoHg1htFRdGwDNhbR4DyNgJyhy0pW/HbyoUk62coiM27Brxs7yGgFfwUTeJ9cdkykRPvsXjV10b+yFH0aFkNyXUeY3U80MiVNjv/DV8B1Iai+CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBjDClJE; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBjDClJE"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-310447fe59aso51491581fa.0
        for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747140869; x=1747745669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6OgU1k6A4H6ei9goCYDt4Oj811juJ96ljNmi3AbJV0=;
        b=IBjDClJEpm0vNhQ4L94lnHelAUHxiXLqCnDPMhWKMlflmIVS++Ne/4mZTMUivviHHU
         x+WkJQPSb8RTSUlGNCpzAKhSFlECxozKfHGzJpgZ8K0EB7YpyiZddR04/wvpW8LcYOHD
         fXW5Av0z7rou18ZN+riFWXV6iBocEPpZx3J87L7B/V73Y07eWzc3QLwi9Ap7uFz2cOex
         0eHZEmpsiHO+aox36YglnakUkPmkANcKy56eMmOZ/W9qpaY3++F+cEp2m6v7EvknmM5k
         8FS/qS7EaGZDuTupCpUp5Ia7sV1eMUAT+kSg6HRaMMUxwejLrU2MtSwkq/uY7fQ+EuKJ
         ABSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140869; x=1747745669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6OgU1k6A4H6ei9goCYDt4Oj811juJ96ljNmi3AbJV0=;
        b=Vpnvhe0MhCI+qFeWtBUPmLELILe6w4HYpcqCi880TcclH1NQ2ibAOhmAeaaDtQAFjG
         q10lfnZgeXF7uWnpl/5qSakv7YrsZFrNACvWUaTVuYUZbRKAajBdCYr+wBK76eAdGbLg
         CiHOmWBP9XSpsj5hWaAgricfUtkzJzomQ1pbH3ZbQi6MfT271ivWH+WbBRkuRSYHRK7e
         jlks0AGWLUPod7yos6YcFJY7Ke8+SSYEXH0S6F0Y1/ykQVgsTofMK9dnU524ce+u6Gwc
         1EyWBS3ZXWZ8YmGOmudQ1SyvElwqYbQR/JbhOdpTeFk+H96C0l2BL2PYXs6/n5jP3/tc
         moVg==
X-Forwarded-Encrypted: i=1; AJvYcCWJe6fBXgiCL1HnzU1fUMuRxYEzbtrV3vtW47XgbwEKLlna8Arlj41bBxVc09JLoJu5VqT3+qtOy5K/Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKHZ5MlZD1jhenErtTNllXK4/08D8d3JQ02FXfuMXHHpOjqTTe
	9N6hhfB2MQryX2GDzLNcXw5XKh1569eUWSGdpjJ0E1PpOny3rAeK071rEKIRyekC5yW2JPLTNHc
	7oSV2uWR2IBL4+Om/1DFfs0YmfSnMj0shE1OkAg==
X-Gm-Gg: ASbGnculFHHY/sKBNJgLnzwQgsvvhILFysXlL/kJcNf+Tf5A6FtTVjdqQPlgzPJk8oi
	B9xiGNbtjGkg88RFgSnf7ci5Zdwy4kvY4ssp04PWck3RwijaigNcBc3IMtxDaWGU9MpOYAIlduO
	wxuDlrzb6r2euM17S6ofa/ecEWByR52jUL5ot7UFjqLVg=
X-Google-Smtp-Source: AGHT+IFIqmhHDo8vb7POzdyLwF7ZPulGmRIq/MhufmURuwlm8UfvslfSSIYa2FrwrYENtbF5p5QmKMmvXbe1e8Aw0JE=
X-Received: by 2002:a2e:be89:0:b0:30b:fd28:a771 with SMTP id
 38308e7fff4ca-326c43ed095mr69143841fa.0.1747140869246; Tue, 13 May 2025
 05:54:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-csl42x-v3-0-e9496db544c4@nxp.com> <20250506-csl42x-v3-3-e9496db544c4@nxp.com>
In-Reply-To: <20250506-csl42x-v3-3-e9496db544c4@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 14:54:17 +0200
X-Gm-Features: AX0GCFsrWir3tfYihH5SvRkpnFH_pjBd6oI5teeB7olEtOSu9RNDEIYNOTiuEtM
Message-ID: <CACRpkdZj1j+mUA40+pdVz83UUqSR4Gow6Z6u5yQn48MCA7cQRw@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] ASoC: codec: cs42l56: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 9:31=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>    polarity GPIOD_OUT_LOW, set consumer name.
>  - Use gpiod_set_value_cansleep to configure output value.
>
> Checking the current driver using legacy GPIO API, the
> nreset value is first output HIGH, then LOW, then HIGH.
>
> Checking the datasheet, nreset is should be held low after power
> on, when nreset is high, it starts to work.
>
> Since the driver has been here for quite long time and no complain on
> the nreset flow, still follow original flow when using GPIOD
> descriptors.
>
> Commit 944004eb56dc ("gpiolib: of: add a quirk for reset line for Cirrus
> CS42L56 codec") added quirks, so the gpio request API will work as before=
.
>
> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
> no in-tree DTS has the device, so all should be fine.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
