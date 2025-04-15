Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DED33E4
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723881; cv=none; b=esUVVfNUBsXSNn+E3iQXw5hDaBfWQ5o9qQkidoGcBJHMJxXW5urqtH8ZCChrmEQy6vRjfNXGy0x4PQ3KRUpXXRgfl1dVUjEOYqCPYaRO+pdQjgTo+ex28yZw0aqKpqBPojVAPhCmDYpcHxQiX8Igb1fttQtiWUWv6x1E0JUnCfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723881; c=relaxed/simple;
	bh=GvfmE/eBZ2/aRfUOlGi5PJS1SLxONEyNYd1JH900fW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqbhd7iDcOkX6LAxLeuMF7DdySwsZQ/55fNmgbNljZ8dIjEgEXLaPolSgb92UkCSANWMOVfdzqY/ASJK5ljh8QxFbeOQXeI9YEaWzHD+zZZimAXr9aAQeIT8iuWFWZPwSaYHKFGXaDzfBibvZ31lI9yh4u+on9xw/3qOH8B/UAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PLHX54V0; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PLHX54V0"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30c461a45f8so48993861fa.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744723876; x=1745328676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eug+7WZO7KWDYOJu0WrkQfNoikV10bCs+DYBAICnEU0=;
        b=PLHX54V0BgMryQWa6LnZlLdqOPV9s9QnsVc//C6Zo7jr5LSW3bHz9sLsX0qIVdQ8ln
         3gUKXpwOBjT6MWfu3h0CGpR/bS8il2DiTe24rbkg8MYh79N+3JeWGagEmfkN+gzS8guy
         g+oqvlArnoL7NlAd+oftiy8zFQ71ALT+gmgdaGCZXHIZN3vc9JOedtnK4s4VkeAc3H+G
         4bPZcuvuQ+kKwZbBFN+mZ9/7FKGIa1ikll38j/oYKQ0VXBl6T3oKXB5SMdxRyyFAGPLh
         TtIpxExGgmZpoKyIM38vVsL0nw4bhKbS01siHxDb1ZmT/rE5ijkGLqusjDIlNcFSnq4X
         BiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723876; x=1745328676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eug+7WZO7KWDYOJu0WrkQfNoikV10bCs+DYBAICnEU0=;
        b=KhZsaQ/f03yvb3lQ/Puu3jckYztYFMvHpqdtL/x6IoLqusJ6ck8qISYluRXPvPMsid
         Yc8hmgR3KpAAp+7Ij0v6yG8nIUn6I4iI3Zyg1p00YIND8jSML/Xoy+ZDorQcNHhI5npG
         actuMTB+Owfyo3u2ip2PsiIqUIHn1NXeA3QKig/+pzUaacpSKW3BrbM8O9sZ0KeQGP/g
         uf6AkNfp4HzWphutNZXlL9mZFhaG5cYE224iEyuP2j1VN4cnn/WtCYOWDJllM5OYPZKH
         2fp1SfSiqJtgcsW2H9g1vORtiupTeOC/XsiP7hKeTOOdvJ3hcCOWQcMuniSwjgJ75Haj
         Hzmg==
X-Forwarded-Encrypted: i=1; AJvYcCUTftkOoSUFbqQeG32Q/Dq37ZY/UEqlXCrrqSaErUD186Aj5bXeYpm+zwVtW7Kss9LBbsN4NdF2/R9f3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKbKwS1svZw3kOdmM6eJochz4YyfOldVxSXiOy0swZrzgutgQ6
	6eMTHMVKziKzBrBO7A0wNLF8Qtv1U2QvOC879A9hg2/0RzbWmswkpILr77zGpmxhy+NukW+BpaJ
	jRa6MiQyC9UiyzdDEIvl+B9PyZNWAG05T6WV/zQ==
X-Gm-Gg: ASbGnctdVuhmnjvcTP752fZ9+0tf6oiw/ychNSBXSK1TqXhL/0aL86AQS1kdxVCuwzF
	ZDaTzV/Uk7+zFstvpLrRoExVY0kdHsNyWVlOrRk2pYk9ne12jTit3sNOIveodgZhuTg9+ZuZBX0
	sXtnmieLMCGFBkiOF0kiHnCA==
X-Google-Smtp-Source: AGHT+IFZev9RFyJCNmmQraspcvfhrbsLl68EnSdbuJYcS/l62aD0avrIYML3YObdQCZ3x2MmS3i5RX8xRk8V7dFCwXM=
X-Received: by 2002:a2e:bcc1:0:b0:30c:523a:a84 with SMTP id
 38308e7fff4ca-31049a7e538mr59706231fa.32.1744723876267; Tue, 15 Apr 2025
 06:31:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com> <20250408-asoc-gpio-v1-7-c0db9d3fd6e9@nxp.com>
In-Reply-To: <20250408-asoc-gpio-v1-7-c0db9d3fd6e9@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 15:31:03 +0200
X-Gm-Features: ATxdqUEQNMpQWYYn2o7kRD2SxefyzEZHkzT9pv-wDTuqunbvAd_GIf-5Wu2lh9g
Message-ID: <CACRpkdZA_bOWt0yqm0mmou6Rp_TA7+L=K9XeU4KXoL=A69e0JA@mail.gmail.com>
Subject: Re: [PATCH 7/7] ASoC: codec: tpa6130a2: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	patches@opensource.cirrus.com, Peng Fan <peng.fan@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 3:41=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>    polarity GPIOD_OUT_LOW, set consumer name.
>  - Use gpiod_set_value to configure output value.
>
> While at here
>  - reorder the included headers.
>  - Drop sound/tpa6130a2-plat.h because no user is creating the device usi=
ng
>    platform data
>
> Checking the DTS polarity, all users are using GPIOD_ACTIVE_HIGH.
> so all should work as expected with this patch.
>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

(...)
> -static const struct i2c_device_id tpa6130a2_id[] =3D {
> -       { "tpa6130a2", TPA6130A2 },
> -       { "tpa6140a2", TPA6140A2 },
> -       { }
> -};
> -MODULE_DEVICE_TABLE(i2c, tpa6130a2_id);
(...)
>         },
>         .probe =3D tpa6130a2_probe,
> -       .id_table =3D tpa6130a2_id,

IIRC the DT-only I2C drivers still require this ID table,
unintuitive, but I think that's how it is.

(Others may correct me!)

Yours,
Linus Walleij
