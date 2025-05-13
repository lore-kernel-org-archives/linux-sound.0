Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D74B2144A3
	for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127710; cv=none; b=gOO2/NU/kORelPfpEFXGv+UCLeeEew63+HC0hv23BpolOyvxl6eQtFbRMoLN64TlHWfALjXgeEEkgvF+QtCYHmb3FwFk3THxcEKiiNITiT+QJk7qolwCUhKMwIQ1CU/TjGF/l6/o70tjzA8yVgUVfonPRUa7trkoiewlJodqi1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127710; c=relaxed/simple;
	bh=W06RFHPV8gonnsmgauUbgxPzser5B7x04G1quNKfCEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sW5T05ucdTyrgL82m00D+r2z7PY5kQ9IacIv7+kaTHGxTJ0uYYhY2DsyQizuyeFN+cqtWGrsbe4S3WHWsylQfa8A347aWAo0spjrErAuKA/PrDo2EQ4PSZp8BEyH8atXbJYrkW2bPJXscukQ8N+o0YhiPMdfd/7IJwXOAS55Av8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfi8nwt/; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfi8nwt/"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54d98aa5981so8587249e87.0
        for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 02:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747127706; x=1747732506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAi9rrC5F3j79jXbmUzojQw3jaZE4Bz634vHF8LgQG8=;
        b=nfi8nwt/P7ekgP9NWzXr6wPMOgiCLtCZEX5G6Vic0bG06xGlKxt1EZeNRRqfRVjsBQ
         Oz+3IEXvrj1AMrto3DSMlWEe6igUX48AJmmPkQC2iuYP5g37ZPsfSN0LUQ2PLSWcNK+q
         2GUckCnQ8UKDo2t4nTszF7+WNR7QnFBRglQ9txIACU8EcFOS7W7G+77iFf5WENCPQQuY
         tcxjQVpFsRstsVjZELXgJG6QgLj9TofZhRyF0p5NrxkmGuV6YfAD0LbGrPyDqhX3D+C5
         5/SxB+tKpsfVenlzf91+Ivxv0+Nh4CmSdR21YJBec4YyvxfVETMajP+I83ylD4cCIk7n
         5EWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127706; x=1747732506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAi9rrC5F3j79jXbmUzojQw3jaZE4Bz634vHF8LgQG8=;
        b=G+3XfdiGef9V5IydW4Yve3/etjbiGe/awO5TdYxgo560GJ1ylOOESV96/7ZaKECOym
         o8D4tcVBf335CAOUiIHQid8stvPRpxWiGALWk6TU3PlG/kEsXb2fAujYMy8Ew0c8SXKl
         v/C2kRa//4nGxDX3nA2dt5pQU83cc8FGDu2vqO+1t0Rq2UBln2y1+T0O0qWtfObMFg0T
         b9bUv5pMkmGtUHGe5TDY1NlWuoz5K02186qRh6EtLoJWoiZoGU2JGL0EKYhM8X/8YdsQ
         5ZSzkW7p2KCV7NLKdGwp/hIil8szpSGFaT26T+6ZqpE5HXOTwqKzImv5r5tIKRGnXMxG
         0lvA==
X-Forwarded-Encrypted: i=1; AJvYcCXLrjjWR94heH7tK7JP0oXbdiXorV9WNE1hEpkJNE0hqxYUCnZrqNQ2Yo2ewcegjmBitw5FERMVPn6fJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTW4XfKQFRKt70RlQplIF4LAP8tSb16EUn7D5lSJTIXrHWyaAx
	jHrAUCurTyVmhpie3FnGJntl+YAAtK2g4rFC/Mlm9TxFkcqd6dG4Zely1jSxnCd4avYs5aI53Jf
	laOgFG6H4zsBX/Ywk5hRJuyypNJXFPp2/Z8ZmVQ==
X-Gm-Gg: ASbGncvt0hdGCGFJX/XLo0yaXnBbEh8qfFSwPB5Alo+mKO0x6xVcH/6aEl7cvFJ42VU
	/vUOM/wcSe/HClwFlo97kzsTXGS2/S8XQVXgdGOZ/iezEqC7/N0tuOQwCWN+MfsPr+TpJ1bADgO
	2RHEI1WXysjBO6gDtflfaHtebutox8OBbv
X-Google-Smtp-Source: AGHT+IG5Frmll3jan8XW4q+c/ZaO7HyTn73Ya+M5QP0nrAUGDePv5va3dllLSktvNB1+Cx7B6+76W/dccZj2jM4v9L4=
X-Received: by 2002:a05:6512:228b:b0:545:154:52b0 with SMTP id
 2adb3069b0e04-54fc67c95e9mr6259507e87.22.1747127706188; Tue, 13 May 2025
 02:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-csl42x-v2-0-e8056313968f@nxp.com> <20250428-csl42x-v2-9-e8056313968f@nxp.com>
In-Reply-To: <20250428-csl42x-v2-9-e8056313968f@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:14:54 +0200
X-Gm-Features: AX0GCFvRRz_CuxUgIsjJYkT-hxEyuMzIQVYUiGbnvV1LNLCfN6Vvua5kol4mBmU
Message-ID: <CACRpkdbBKo8Qp5em+CngJOAQF+FPohfsi_V2SLUpNEsim=XykQ@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] ASoC: codec: cs42l52: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 4:11=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>    polarity GPIOD_OUT_LOW, set consumer name.
>  - Use gpiod_set_value_cansleep to configure output value.
>
> Checking the current driver using legacy GPIO API, the
> reset value is first output HIGH, then LOW, then HIGH.
>
> Checking the datasheet, the device remains in Power-down state until
> RESET pin is brought high.
>
> Since the driver has been here for quite long time and no complain on
> the reset flow, still follow original flow when using GPIOD
> descriptors.
>
> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong.
> And the binding use reset-gpio as example, not same as driver using
> "cirrus,reset-gpio", and there is no in-tree DTS has the device,
> so all should be fine with this patch.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
