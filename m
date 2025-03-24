Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5E9EEA8
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 07:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742801425; cv=none; b=mQ8dVNOWrqPmUSvTD4C7WXasEH2zO4fIbiqMk+ryVtyIYeFnkwt0ezI0L6lmQDTJuN7jdtTzQ50D2li6yhmLBHMnveFCd1W2KKWY/muHbothfM25UQ548stX3QFF0mt1/pyQZPZTM49zmcJSTWn+bDThVAVSY4jBRIZN5mRxUTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742801425; c=relaxed/simple;
	bh=lwS7fGyY3ghDEpokPLpMM0HJbUP8WS4SiI9P4rR2lGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NE/N13/nt3FSHXb7RgF6SDmfgMHKvHe0KfyCJUxvgt1nn5/IS24aUTYvSNHgPU7q38o1cD+OX5pe45hF3I+l64DbJja3mHxuk+arLr6RDp3UdCGtSwZ25nls8VEJRO/ZOCWRrV0cFgN+KAN+3JdJ1i9wvFwjlS3BBy6sNH9X5II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XBC7nYxi; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XBC7nYxi"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54954fa61c8so4259654e87.1
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 00:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742801421; x=1743406221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NU2FVsh97m7TP1y3tfx9WOUJoAfHylfE9LhCzm81iVg=;
        b=XBC7nYxixEpGkdQEk1CarDA23eFeP3hhNPALtj/79IGhZfdG/WZqb/O+OcvDs8AWOT
         JImPnpBeQxipOwB8UqIZmkW8GGgemZGiMjpdg/ftg3QLL9w44/C7BS9vYZS4RlMdPJj7
         5EVmG9Io3vIk5h7RpP39kDVnAaHpckTCBAoQsKbLmCy9jj91kXYODrLMTIdjwX/8VmvU
         Y5aPydeYBpvv7zIQYAewVkGuDtk7bqL9RSFlA55cEVehR3pK5JFvKP89yDw8IQVKS+lJ
         FtlmSnv4fx8yjV7F5bKSUy2OZbYhJ7lZt6scHGutTXBtfl7GHaGLSDGXmZePLhvO8iuZ
         cXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742801421; x=1743406221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NU2FVsh97m7TP1y3tfx9WOUJoAfHylfE9LhCzm81iVg=;
        b=YRDZzwwe1oBQyrTtyKALtSgxVaUb8TakbFbXlasv4M6md8Rvl8zNkzjNt29+ME3lRb
         Y2PCJzFeBao7rVQWKvAtQ7SjmVBEUp/XOUP/MakLh2MlRFvHX24V05Y0htHq5ADfc05H
         v7WTIYcOswTBDTt2imt3XPbOQIr54gCkCro9jgnyVG1shyYLThu2xRVX9mhIweV7t5pL
         uUtDmI/91E+ahQJXFiaQ7fqk5kDBqzMEDtfkwXTwhg9G75UMhRw5Yc9ksnrTkshPdQWa
         VyWmd70BFpUaZ0ig1Ij5rJASOHpQDzfe6kZ2Qg9LqeWYlfFngY4F+qzh2rdv3xY9adNI
         PeBw==
X-Forwarded-Encrypted: i=1; AJvYcCWL5VFWW3AWyvgNf4vyycyyNjSSNwL6niRK2mqXjKq5NoO8PNHE5o8q0Lbdk4eH6qpOtiCosC6h366DeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+hD/1mD3Z1AK/KHoPaeJWHzt97KJXKoiwKB/+OZUEEWnUxQB5
	wOMiaGI8J8AoUZz0wlvhCHVRWf1ugJBFmQ1B/IvkHHT2zQDb25yzc16mNabvy86HCLmVeB+B68d
	rtMzV3fioK2UTorAy9Cqx5qBRsznTLuv2k/RzFw==
X-Gm-Gg: ASbGnctQia0/jUwnbPoPM8bzGBrNYLp5HWVUitMNxWEw84FDMv1efQHLDC4c+wmFfMG
	huI6DbtWVStDDwZgicIeACIVAl8yGkgbK0jGAbskPzisMqOKJNTW7SFFuM7GF05KXox3vlbRrl7
	UI4MUJBspWJOZpEOf0UXbtIT4=
X-Google-Smtp-Source: AGHT+IE7ElI0Wie88BjvIx4/nAvhgrv4C9qAG+SVDsK5xNXRaCwIrYfp4uSH7h+9tbFwPhfRFVhl7PG+FIJIC44x9zQ=
X-Received: by 2002:a05:6512:318c:b0:549:8f06:8225 with SMTP id
 2adb3069b0e04-54ad6512f29mr3163266e87.53.1742801421294; Mon, 24 Mar 2025
 00:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-1-27afa472e331@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v1-1-27afa472e331@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:30:09 +0100
X-Gm-Features: AQ5f1Jp89LHUfGV1BvkWIJcCi8kryB-sXnI19w6Nw7WZk7DWQ3yMLvoYji6l6JQ
Message-ID: <CACRpkda=gb=u94CqYC8LuBtqg7x0eUVyJnuixLuyNonZ0=X3Kg@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: codec: wcd939x: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

thanks for your patch, and thanks a *LOT* for working on the gpio descripto=
r
task!!

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

The patch as such is perfect:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

However we need to watch out for users:
$ git grep qcom,wcd939
arch/arm64/boot/dts/qcom/sm8650-hdk.dts:                compatible =3D
"qcom,wcd9395-codec", "qcom,wcd9390-codec";
arch/arm64/boot/dts/qcom/sm8650-hdk.dts:                compatible =3D
"qcom,wcd9395-usbss", "qcom,wcd9390-usbss";

reset-gpios =3D <&tlmm 107 GPIO_ACTIVE_LOW>;

arch/arm64/boot/dts/qcom/sm8650-qrd.dts:                compatible =3D
"qcom,wcd9395-codec", "qcom,wcd9390-codec";
arch/arm64/boot/dts/qcom/sm8650-qrd.dts:                compatible =3D
"qcom,wcd9395-usbss", "qcom,wcd9390-usbss";

reset-gpios =3D <&tlmm 107 GPIO_ACTIVE_LOW>;

Mention in the commit message that the in-tree DTS files have the right
polarity set up already so we can expect this to "just work".

I would also mention that the current code in the driver is quite ugly:
it doesn't even request the GPIO before starting to use it :/

Yours,
Linus Walleij
