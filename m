Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949FF20B1FE
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065445; cv=none; b=VcvlJfX9mfutSe9upLMTzUgyUjAwbaa8d2fTGvWD3S5BC0ZJaF7qd9fCznw3WGHIZYoIW4jB35U4Usk+8S3qmiSz75p13H2gJe4bEPmdRC0PpGIoDoXD8CjiqL5MTTKdAshgESapq6gAc+DMUcHH59YrDfbl9yv+n8VEOqwHBjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065445; c=relaxed/simple;
	bh=SSuwDDlCfqr5CMC3oPcQO21KrxISnnKr5CAAJcA5Nlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVNzpZJihGstKCOoEbGZoa9X9iBJJm0bz2Admd5vKu5xSsYaoDiTPrWosPwim6OB7KFPvEGizCBaIXX+6efZQW1W6wg20cVhFNUi3PbXRrscGPLubKVMiC6y0sJ5MMqmPqTQcTlBYvwvM6aVlpmOEUPPjXuR8oioWKenh9wVebY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cJcfeXhf; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cJcfeXhf"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso7192761fa.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 01:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743065442; x=1743670242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrCm7V9nLgr1fSaq78mJmNgFm9htZIYRYnkNXr3wiks=;
        b=cJcfeXhfn0oAM5iO1RFH0NqwYN6PKK0dEBx9wf0jHwjBuHk/CpksYvnfirNW3fgMUh
         dMuDPXuE4ZDSMGLOZBv7CO73pKUI34VC6SoZNX+nkZS6Bi8IEGnGdmMURJkEbBF54deI
         VR0fzs9pZ8OfuGlvPTicWKxeRvoI1TslOmGEXpZmxdv1wl/KsaeENQ3lf9hL9Vdbqyp7
         K6F6WavIIxoofDravsJBe2la6npdnqXk/10FOeGR3rwmyXmgkr5nM1BwmFFUocbAtsuJ
         3HJkDqwC4sI+/DDDXEdUlS+QdtI2fcEt4eDZUiCPRXgo2HsnfsKe+nvLRHsOAAbibtTN
         69Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065442; x=1743670242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrCm7V9nLgr1fSaq78mJmNgFm9htZIYRYnkNXr3wiks=;
        b=aMrqnyIaOgntQEM9s3nkepoXqPYxWCQHcaXgvKH2OyGfrr6VLaZLWCWfHNCzmyQbXK
         lnXZDKW5w2hEmPzxsQfsctHRcBDUME1IteU9c12+nMJ/h8ktT2MS0Yx8Bls6X0NRdhd4
         FtPYt/FdHGOBASNgzoMlCj/SsEvL1hHZC2LFUtaVsu7g47TNJ/CmJMS0HOLISJqzg5N6
         2PxSjZTIrJmE4ISSkS1kOED7jf1Fv6ZMoYPSdR/pw2IXG/aiXqdmPM+gF+lYQFVrZ2/V
         H3whGIUNENgHjB/oFmxMtiMJuqHodBq/kA64DRo444OwcYIDFJq7FfvB+3zngR8Du4qp
         sC5g==
X-Forwarded-Encrypted: i=1; AJvYcCV6UFtZt6QYR8DpzsYXa73WTEGejnLOK8vn5/QY0CyQc2/QHSji6wBasbjq4V55u413Je5b+BQtq37G+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtx09w4P4bc9cctXjUam31a8oLCIwIbtKLRqtmuqz/PoZM72A6
	38vnG4iJJQB4yHx88/vEpDGXKFazTe3EBd9WIvFqdMXbGHdOg7iHW8maanXsacojyiXDUJC/v11
	sG9V5VTGDXiKn/o7Vfpk4r7uL6X9E5oAdb7BNOQ==
X-Gm-Gg: ASbGnct3qTRDGq0HZC6rnUUa068vjvgBCfRWuLn4/wuCb4HxbhPwEqSxk8a5xOV4SQ1
	R1ppkbTDMt+0dogQxYuW/5RyhQmvr76yscGQQKwxyrIDVYPcjbDppDjcoKfvm0rirEfJSfdzocy
	d0u/KsYM8K2ypJ2auErmbIattUOErwpupdgOQhQ9g6FCFKEf7CXTdMHPDwfA==
X-Google-Smtp-Source: AGHT+IGxgIMt5kbHn2L71WGjDAcLR0NypxnTQNv9HahK/pVgRmQpyy7Nbd63iN4iNHaoEbc5XYTKgBpyYWSQHq3EHrw=
X-Received: by 2002:a05:651c:198a:b0:30b:b9e4:13b0 with SMTP id
 38308e7fff4ca-30dc5e52989mr11888081fa.12.1743065441577; Thu, 27 Mar 2025
 01:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com> <20250324-wcd-gpiod-v2-2-773f67ce3b56@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v2-2-773f67ce3b56@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Mar 2025 09:50:30 +0100
X-Gm-Features: AQ5f1JrsE-JcUTWn7tcgiR5us3IYvBsJJdLl84KolEecUKrVowGr9GOKOQX6-6k
Message-ID: <CAMRc=MdXvwyXTjUj2cNQm8_c_fCoY4+kLA0C2D6k6MmNGkTEdw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Steev Klimaszewski <steev@kali.org>, 
	Johan Hovold <johan@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 12:52=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use dev_gpiod_get to get GPIO descriptor.
>  - Use gpiod_set_value to configure output value.
>
> With legacy of_gpio API, the driver set gpio value 0 to assert reset,
> and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
> DTS, so set GPIOD_OUT_LOW when get GPIO descriptors, and set value 1 mean=
s
> output low, set value 0 means output high with gpiod API.
>
> The in-tree DTS files have the right polarity set up already so we
> can expect this to "just work".
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
