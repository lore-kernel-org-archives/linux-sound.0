Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C229F20AF9F
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 08:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065468; cv=none; b=ICAjBhsXAoZpJFk+pZcCwccsKt9219PR7vf7xgQYpIu4D37tJF/giaD+RmcwYEzvtKkuDtFkHqn1bDjd7C4/TfgIHR2sUPBj+Q2F24I4pLTTWM4qFKTikHPR7tpa3g9ZGnJcgT9o3gqfXK2IUMqEkMGm/cYky/XTQjWGte8RFQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065468; c=relaxed/simple;
	bh=Chd7hV87fMstfABp9jK5caNlln7CTMJpB06aC3hmqA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZfawypxAPjsoRHiP07MGpy9q5btqy638cFrDCg7W/OaezyPTVHuXsEWcZWx6ycVEvGVwVPGGadDfNC3Jm0aCjC32EFRtAfmKDMNQbVuZW74DRovFfxGlP3xj6ObgJ3/PpfrjMtwuHTC4i7YaF+NpzJvx++urTvJrGG6nrj2PU7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KSCHo55b; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KSCHo55b"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30c05fd126cso7255261fa.3
        for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 01:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743065465; x=1743670265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Chd7hV87fMstfABp9jK5caNlln7CTMJpB06aC3hmqA8=;
        b=KSCHo55bRWBA5XdXK8agew7wFlr0ZDszIuEN/1CNn4aVB54L02Oqmjy2YMnTAlu1EO
         X3xVTJvjHUHysLQunigsa0uC7Xqx6ZrVz7em0qEf/mEDigBp9y8m+shXyD3qnDAPJHxa
         kNLZUVZnPqO/ap1AYWO4WHoKjQbcsIniiY+yi9Mv6Kn8UBcANBMfuLoTNykJWInaGHZt
         +fW+yGtLzBFLWtOFZqvlV34VwxLT89IrBRQelkw3h9YTgPxVHIcjHfq7F5kgVaSWEB1x
         UgCbWa+3xJJjDVnGV1TSrLx70YF45OHOJaQbE9pf2UbZggIWCyK7EunKyUGEzd6bAMDC
         2BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065465; x=1743670265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Chd7hV87fMstfABp9jK5caNlln7CTMJpB06aC3hmqA8=;
        b=Z/a+tbv4utKHs1fC9J6ollI8w1A/b5FJqFZPDYMMGLnu7CEvtbIFKUl9jqkRR2QJsK
         GUqThai1y2M8lazcOPS+2WiCu+y+z8VnXHecNJ77cgbHBYdLah44E4toFeqDNDUauKRF
         2FHgliQBEEu5zcdzY2x0fGspbj9GbKzx+eiy2zqz52Xo9TiheFFXkjAExfMjAubKnS9H
         vFTIUgQSymRyygJkjpLb7wgEmXHYcJqT6QfdJWw6ElQrG61Zwp+Ksqk8XKrYWLrRgFLq
         gJGK4CS7q+CoyXN8jRk0WSmRknQED7zGYBdx4EV6z2Df18RkHk+gONcVWj6eTAfjGRFc
         oYHg==
X-Forwarded-Encrypted: i=1; AJvYcCXrWqnE0ULxfF4M6p/n4tuumLqM7XDZtODWotpeK51PnPzMwnGWLpIjEnECO3C3sphlX5OVE6UlsdT2dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4+osj6IoP7IBYhVg2/qHDksHMGeoEMZPUMqkOnlELOnd2jL3p
	V/MDQnLPUq7Udh/dizvliBSP+ZYXeDHLdnaaPoneeZViMmJT2ICnl24Qe4DFlTDIIp5lVEnEJlM
	9JRghxKzZGM4M/xHT/zuBMyVdkX2SI/X4Raud8g==
X-Gm-Gg: ASbGnctevGzh2685KcTv+CqK8+YuUsS0QMePL8H8zmT0JPp+fkZFeLcCJnQmW/mK5rU
	Clch2K6+n1CeoRlf7SBbncEje3zFoV5N8vEgt/3QCixy6Z8k9OPTR19QezDWe9anoYpSPJ5L4y/
	jS9LG61udrvzS9iDwlA1bIJhNU1bxmZQGse3+W5WXbBjQmPZ3bg0zDykpPzg==
X-Google-Smtp-Source: AGHT+IFPu0lCqg/NzG55Hhzb5Yfk7gIP1B9dtoDG00BoDotsQb/t1nSt3ZrZXOd20MXHsbzYgrruADonZ7RBeFn8M8M=
X-Received: by 2002:a2e:9219:0:b0:30d:b8a5:9b8d with SMTP id
 38308e7fff4ca-30dc5de5c3bmr8771991fa.16.1743065464987; Thu, 27 Mar 2025
 01:51:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com> <20250324-wcd-gpiod-v2-3-773f67ce3b56@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v2-3-773f67ce3b56@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Mar 2025 09:50:54 +0100
X-Gm-Features: AQ5f1Jr1uyS1LW_ZZ-k16r10JDuLde-qlxl8EiU9L7CNTVYt_fgQcsPB2i5r2DM
Message-ID: <CAMRc=MdGs5_EFfieiRBwMV6p+7pM+cTCCQ7ZuiOmrR4OtFmffQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: codec: wcd9335: Convert to GPIO descriptors
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
> - Use dev_gpiod_get to get GPIO descriptor.
> - Use gpiod_set_value to configure output value.
>
> With legacy of_gpio API, the driver set gpio value 0 to assert reset,
> and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
> DTS, so set GPIOD_OUT_LOW when get GPIO descriptors, and set value 1 mean=
s
> output low, set value 0 means output high with gpiod API.
>
> The in-tree DTS files have the right polarity set up already so we can
> expect this to "just work"
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
