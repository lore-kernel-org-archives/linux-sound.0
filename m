Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906561CDFD5
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 01:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759800944; cv=none; b=fIyF3p/6cQU1+zgxEQhlDQRbYEFomGgkOryxnVwVI2dcHMml7U884VhFI0vB5ETULMXjfFYM1Tz+sOjPszjMosY4xW5s0gpCWNPPYBms7vDaoR2V0RzGh+CjM4fNZ2XWU/4/eYFLDWkofUpoFfyjyLRbbFL/UNzbqRRXoidhQ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759800944; c=relaxed/simple;
	bh=dSFf1E/J7CDTNdjk+dI/Pn6eRQ1aAq+eFCYCegQhb+0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sZxOJllzf4KDZA1uCZ1j9tg6r3d5ZEPlt03SSho2/uoz5r29C52OHOKakD8tkdjtiZ5lnuCO7CV+AcSJ2uT3VetrJ6wGD3f5EOMSQoMU4zOqOhje2X1RbJCf5z+MkKqDEGO+th+oPlhuJT9ywqqRtQTcUjIx8wVXFByGkpG0GZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VzcTr2ud; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VzcTr2ud"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e4ad36541so61311845e9.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Oct 2025 18:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759800941; x=1760405741; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ji+JD5QBQH6eDTa+kxfbkvWxEhikk+fAOwvZw23zzwY=;
        b=VzcTr2udTjA3MDdRH+KJrmifXi4DBDEqU3uQoIzZ9b0yX/+8GSbuOtiORwWHrYXRHM
         XZcZvbnXy/22Y4MKQ6Kw2fluzLqM0hBXpTvjTBmslNa/h4UEb9sw/jddKdhmFiceuPRM
         bVRx73bHpWJmltQ2jTU1mwqHxZ0sB1AjbHRbTSLMCqzeJCLQxY8qt/G2k6y0nOp2aUTJ
         3i9CVwbp55vsRVViHMYGRcesI4Ypa7tfu9KIsVCdpwC9Fag84TMLjZS25UJThDX8GD4k
         Dbw0+QyBbbNVUJywR0R4HLjxaD7aa6HpVBJrQbELiFozIN0mjujYF9d2ETa4RvrImji9
         C3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759800941; x=1760405741;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ji+JD5QBQH6eDTa+kxfbkvWxEhikk+fAOwvZw23zzwY=;
        b=kBqmcHFydLtMsv2JOXoCAupPTmwUzUm7ffscM8pCJQ3Rf72/mGXSN36wBTIdAK5adR
         M2e8VwIXoXr8R9e/jkXv9a70o81qvnxJEkAD+EiT/bX+rRfbQWUbCE/dzmE9h+RfKR6m
         1EvKzAQuWApphT0E75IdYxMc01teg2uS7LoqNRCIYCoqez7nDsrsTvPThL2O5KjMTBJq
         IQtvMXrHAGt5LTTFqmRdTrSPdEat4zy58TaM5ewfm//ntXDN9d1EvmScGbXyFXwQUDdo
         JLO8cR3B8AHPo7gSA8v5CI2wJYu1BBnnk3aqvxVXLXUm4ZmZVD37W0Io9BPWgMd+nSgt
         lQIA==
X-Forwarded-Encrypted: i=1; AJvYcCUg8n1b+GHn1D04mVTgn81KNoR7i5a4DwI1qCtdV6S4lqyjhT4H9ooYZZlyfkpoa+IXrdRcncHusnGaGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJnW7Jq8cvFi9S6UoqD/g8JAbND/bx9GZNFy4/jzQrUYv/TKI0
	6NLYWCAgayix73XkIRYYEe3bqkk9Wmc9wK46nnKCzGlSo1FHcM0nlpjGKs2kfHxf5DM=
X-Gm-Gg: ASbGncuvIfS7DEJgSdlfj29OFVEMx4ReSDp7U3IEDtbUAYrOf+6nefsoQVoo2iKxHyy
	eHpftkV2A8iLN4LiPv2lKHtxha/MVnK+vH+XBWE6lDMHtc9AcAJ+X93Ef1Uk1aSxCb9/XRqcE6T
	Ty9wXOnQb+YpgMIp7jbFdYuA3cBtYLdythee3RqaEtCkZRV2hhWzF9xam2Sbk9995ZgTxMrRw/U
	LD1CwL0cvFog6QS68wejqbB3XtqM3CDsfpLqVszpUC32VDJIZbHlHEQxUosBwiU7xPfFqA499Mw
	QSMs3WSWqa2dR3Wp+qKwQWeprxDV3rykqBBFJJNNPiYHdbyUIqcnZx4lj2abiVtywX9En0XlWKs
	QznJaJFnJu1k0jZfuh59tnzyTHo9HHfA4MYzBl7qTrly0yB4ME2e4xuz0j3dbRtqEdQ==
X-Google-Smtp-Source: AGHT+IGxegk5zS/vcDYXOHgkLn6TGJ/oSEBKxXzqmzD05DR2WTUPLYfCcOojl3EbamxexC7GUdL3oA==
X-Received: by 2002:a05:600c:8b6e:b0:46e:4499:ba30 with SMTP id 5b1f17b1804b1-46e71153ad0mr112226515e9.30.1759800940679;
        Mon, 06 Oct 2025 18:35:40 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa2d5bd52sm7679105e9.2.2025.10.06.18.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 18:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 02:35:38 +0100
Message-Id: <DDBPDACTUFEW.1VVHN1P0PC6YO@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 3/6] ASoC: soc: qcom: sc8280xp: add support for I2S
 clocks
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Neil Armstrong" <neil.armstrong@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org> <20251006-topic-sm8x50-next-hdk-i2s-v1-3-184b15a87e0a@linaro.org>
In-Reply-To: <20251006-topic-sm8x50-next-hdk-i2s-v1-3-184b15a87e0a@linaro.org>

On Mon Oct 6, 2025 at 7:37 PM BST, Neil Armstrong wrote:
> Add support for getting the I2S clocks used for the MI2S
> interfaces, and enable/disable the clocks on the PCM
> startup and shutdown card callbacks.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  sound/soc/qcom/sc8280xp.c | 104 ++++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 103 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 78e327bc2f07767b1032f09af7f45b947e7eb67a..ad4ee5c6fab8994f18de57284=
2f3dab6f4f5397e 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -4,6 +4,8 @@
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/of_clk.h>

^^

[..]

>  static const struct snd_soc_ops sc8280xp_be_ops =3D {
> -	.startup =3D qcom_snd_sdw_startup,
> +	.startup =3D sc8280xp_snd_startup,
>  	.shutdown =3D sc8280xp_snd_shutdown,
>  	.hw_params =3D sc8280xp_snd_hw_params,
>  	.hw_free =3D sc8280xp_snd_hw_free,
> @@ -162,6 +222,44 @@ static void sc8280xp_add_be_ops(struct snd_soc_card =
*card)
>  	}
>  }
> =20
> +static const char * const i2s_bus_names[I2S_MAX_CLKS] =3D {
> +	"primary",
> +	"secondary",
> +	"tertiary",
> +	"quaternary",
> +	"quinary",
> +};
> +
> +static int sc8280xp_get_i2c_clocks(struct platform_device *pdev,
> +				   struct sc8280xp_snd_data *data)
> +{

Could you please confirm that this should be _i2c_ clocks?

[..]

Best regards,
Alexey
