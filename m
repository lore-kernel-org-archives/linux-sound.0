Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F629EEA8
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742801465; cv=none; b=vChgtBEA21VbUZnrUw/DLMjM4pOk5MhVJbRu2Kf2nDm8GSrmTGoFV+VFqlK7mIjFWIP32MZLCMRcytjRqLA3ciWbkC3DA3xJDWuv17cbWD95CpQpTdodSMBS3lsMgu1gyXt7j3iki/JIB5qDfi/Mwk9hQX0p6qK3aoTAa8TIsS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742801465; c=relaxed/simple;
	bh=wFVPP9vrm/IpUuXPozdTr3WZBrU9bbE4t2LjemtCNYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=inqN+33dZiChvSsMJip0Y2MjpPdylOTuFJc5mVYkOrkTu9wjc0MBtzvF9AewPVl//cce8HhsTzL3VyZ1eHgH2VWOPGM5BTmY8eJDCohiNHfcKKoukdhRYeiFthlaOG09izEgC4dWehkGHd0AmyOkYli/AcYiQH7euWI2qAZ0Ly4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PMS8LhNq; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PMS8LhNq"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499614d3d2so4630302e87.3
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742801460; x=1743406260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
        b=PMS8LhNq7rRUO385P4lXW0rU9qKg8qHy7iNAP14PbUvuYpHdJwsPafAvU7mBZkAt74
         oZ63my8crKLFLangHhp2bbcP1ZbXRVFz/gcX8kqTttN1DJMS47ItXCAvv5dJBgvyJB+W
         xp36pG1IoP1D/qW0HQOt7rq/Ept4rYSUHshiI069ahdLD7t0GQcg6XuzfzIj5zE1rtJH
         CX6lLcnrUJAGd0RSkFU0nPcO5VF9EVsYnUjx9of1q4Hy5fT2Ex4WcUWyC1zMvARoJzpm
         c1GCCMbcLYyQn5RO+ki9PI7byFYbfPZFCIkmmB9yIsVIkKkmbbETnfzLTr1c8wa10tLv
         aqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742801460; x=1743406260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
        b=f1UMKxjYIXp+oIAi/8MpLo2zJr/v5hPkNV7cGRyU6h00pmnDGnLpVuoo2TCJPBqno2
         AFuGokRTRpKbwiOywMDnBeEiP9nLalflYUl9iwdvUisLafBJxYJQkSqenifaK2UJQkcU
         dZU2CT9P7EXl2Qw7B3O37hkiN4f4hR9a2vvOJgEdvNBUr6cxaYepiVJ93saS1VqfrtHr
         Jdjs9JgbiCm2p2oAl1AK0JBpiU6wpcbiAYSAZ2NlpN0AqgylZ1qpiKC8uUw8K36oM0uM
         oeVawgu9Fna8r/uBk4MayLbQ2O93sSj0g9XjyqfB7M11xbGp1n67SzuMh5O4b7M9N69A
         bOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDfAebQjK5vmFu+qQR2DsIp3IUqKGvoT7k0kdgKBHr0AErnVU4TlerUGvD2kgAdFg/hYAKdi9lHoVQ+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvYm9NNhNAsG5ie4NBr9wbWw2kPLFCD7+kCtnA8lhUNYAgnwBK
	fdRhtZ0BbrIMT3ae1UxY2STzsE3YfQiel9Ibl1krrxxKNAnkIOvPxA32HJOyWXmMH826g0C/oyk
	HpcwghqmbibVPN9gyFY/Dmpnw6s6H/WmQyNvEMA==
X-Gm-Gg: ASbGncua5ocQjAimOn1PfiWbZvZ7qRR0F7Qzd6OxIzqf4/yoaYyCgIm2b8AFZXvp82x
	phZ5DXYw8mqCHOv7F7WAcg1EF7uN8tl3Ru2q1gpv+Rsk/aEK2cH+EZiPkDtxEw2+fP0m/Iq/mPX
	cn1ZF9W/ZycTiMjM/5DdUhgLE=
X-Google-Smtp-Source: AGHT+IFfY75E83XPsnnpR4d1GJLdT3BEM1cMFJPNDF5onGmESgudM5Wglz+nZtIx6LfxsWNWpFn+XfQWwGmynVuCBtU=
X-Received: by 2002:a05:6512:b99:b0:549:6460:6b6a with SMTP id
 2adb3069b0e04-54ad64fbfbamr3771531e87.46.1742801460181; Mon, 24 Mar 2025
 00:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:30:49 +0100
X-Gm-Features: AQ5f1JotataG0hZSkN3AGVCpQIszAGWu_3pPzj94x551CNQv3UQ4vd0DTWvGPVg
Message-ID: <CACRpkdZmaAg-CMp1PhR69-VPnP43DigtaEy8aAd0MhUJ0gcWOQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 3:28=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use dev_gpiod_get to get GPIO descriptor.
>  - Use gpiod_set_value to configure output value.
>
> With legacy of_gpio API, the driver set gpio value 0 to assert reset,
> and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
> DTS, so set GPIOD_ASIS when get GPIO descriptors, and set value 1 means
> output low, set value 0 means output high with gpiod API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
