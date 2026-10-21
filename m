Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595305;
	b=jh/qeLgWouVysC5R9Qs1pG931z1pPRdyZAT1uks6G4ZN7ZvVd+TlyIRW7yHwvK8mLFIj
	 YYQhpD4825Ol0pCAeRfBSXla//zM26benvXtc2SPPzsA5yXx9VohbK8a51+lHhq3Dj+yG
	 pXnfFRtQOfR7o4XC7dS1smTS20L2IzWK3+k9hKtkx2Ewz/O51ITCldcpPpEdpzX8CR5Lg
	 D5gb6bbQ4iHZJhNxe7aA+go6BhjRnEtIeKdVqrK3ILJCq0ODpXECMc/LHPIHc5XR2y48N
	 9J8S9XWit7r4EzR/0INerNuaesx5IxUxVz1G6GPXB7vXSrSiuZFVu0MzYnvxNfV0UjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=m0Hjc8l32fjqZfSZIiJhNxKSLbC3uFZbj2Kv1jpon6Y=;
	b=UhcgL3qOwG7O/J5gmfLfzeVXSlxj4/Kq043QIFZu6tptafIXI94ntb2f5VtNMkMOCZM4
	 OJSZgh8sz+sdaS7kNofCJoTPVfdBMAIK5sOYzbUuhfhixuIe9irRjQl79ODESMt+0Pl8u
	 EceTgVjEScHweyZKZmCJjQupNw1eCIdPKIt2hKp1LTcjWm3W/bPrLkKBFAVD5Ol3/7AD7
	 S+bi/RqrkZ1rH51g9HyRC44CTxIdVxAh/0G/V4NgFVdI6SL0FawE6UQWJe+eCEJTQw/Bh
	 KF4xUcGTTAm3AXLbn6XEvpUDyjqIGMdzN+iKLT3Smkyxn30F/JxmWhFwVh2iNo3lprA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aEz4v8+K;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9899B60A260A
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 15:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9899B60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aEz4v8+K
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso4754405e9.3
        for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 08:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792595298; x=1793200098; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m0Hjc8l32fjqZfSZIiJhNxKSLbC3uFZbj2Kv1jpon6Y=;
        b=aEz4v8+KtCtKYXQtprtheQe+nu3i6WHB0t9CkNtxjc1EyOCQQO+xcgyXR4+XAfwuy1
         Hc4qRI/tl6HJbHdmfD9xwo6IxJhj+KyZ454C9l7KO2pnL2AoOzapeohi0HD9sQOCv7zw
         O/oEPOqGiZpwii+fQmir6NxjA66IBT+pQuZK5G0qZEPk042E6cEl1vGa4L8ze/oUowNz
         Nd2N9vLMWb9kSxoycap1DHahTguVtugM/Vsl179fsEdGYoAKIRVM/ZzXmnCJiFkeL+Ez
         WAP/De04r4zZMpo3pW3f8JGUcqJzr6PvioHyfq/k8UYGaJaPvnNc/lqLx8yNyuJjBmGG
         x1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595298; x=1793200098;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0Hjc8l32fjqZfSZIiJhNxKSLbC3uFZbj2Kv1jpon6Y=;
        b=K1phA8BeFG6Vy10sQM6AunJe2dDYWtyq2lsoUNveNhir6JdMjwifiwseDBEmsFl+ff
         rugdcDAnuRIS6ND/zxSV9pbhfLFC+cWZflnoB4xqjfwoklJIwHdk9PdyTDaLGXCASvTT
         FFKV7lqXyaT5Fj3HoU8xg8WppGPNh5yWS7wUoFuXLLXSWnJg3rR+TaFnvgXKlYaLzAme
         HohHcRZRZg9By982Sw9Iv7q432DPbnlPmO4Esx1nNAUmfB4zKkDcm7C0syaJXiq3v7sL
         sfBjyE6YgegiSoHxvwZniJd7Pkirqepl8d29PlhQLbS4ghDDhyUx9KZSwLa/QZKYaUXS
         j+DQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6aBs7FQruEBtvcmSSzMEbaCAKXYphl/adLfGnzJnxaMj0CaauYOryhGwwi2NcqJK9LCJzt10XSc6cAA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIfjfLQEb+DA3QCPB15Y11zPtUwDr+WCV3nUt3lzZpLTfwh5iQ2
	/XMyX5/AeTF+ufRxvE6tBRrweaxXBIXq7Gm0EDDUJWr1a8iVViEnBcKTFseRni/478A=
X-Gm-Gg: AYBFou3hLK4fTAkSFlbFa8UoFMO3322ThggQEcd5QvWRoC3UxVBoeX/dHk2cwMzj19u
	4YtmEPWFyq1Q/CPTGQ37E98YKf/bQ9HQi4/X5zZ2pDO7wUTZnwRcjbiN9ZB4UcV1JieKLOT8j+Y
	ETLYK9YqIFiB5UGEfrNjDBopuvu8P5grbf9n8NpsPa9a0j7SaUUwbyr5Rk/B4OFezglfweoQI0t
	jUfRTMlSO3JybL+ufsfi2wbBBDGl4Dgt882S94Pc562GYq9J9we/mUZ0UDUZ/zm+DofOn5WEqqL
	SYcZ8BzMeVgh9CQH6DekuyvyEU7sqtQK36l49pdsrvANkKtFmzwFcqiPjg4F6Sxo1ttxbEd0yhn
	WaVgrU8H797P9jtGbse46ZiCcAPxTNpQguGWv6TviMixmDWkhfiyeKUeXUHxz/1/u4e9mrJx9c5
	Dj3Av8tHxLTNhsqBpWrWeilo1YtO8rcLSj+fwkL/6mL/cTQnq3QAzWLIDnrYSWBHDcbLethFQRY
	RUApogXZE/rLtVR28molVxZcSeHBRuKgmV079x/a9GhQOrVwBxwmhEswSMU9GXolvFDbO4630U=
X-Received: by 2002:a05:600c:6296:b0:4a1:df50:5758 with SMTP id 5b1f17b1804b1-4a1fd8cb920mr50004785e9.1.1792595297894;
        Wed, 21 Oct 2026 08:08:17 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm36794605e9.11.2026.10.21.08.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:17 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec
 driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
Date: Wed, 21 Oct 2026 17:08:09 +0200
Message-Id: <179259528986.4070168.179126639869298765.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2307; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=aT/Bvwr1IC3lec+0KVaFiCrr+0v7baOk1896xqidnfQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk3rsaXnu399Vj82hve2avywriU/6z0t5/K4BMyhdGpI
 sSP9cedjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenANzkp4wMLxVKdWfazw34tVSo
 LJAvcne0rSDrowsXO4PktqyfL6b0h+GvXKuDmBjT5pJZ+eztVi5G+Y/WXk2b/XTul0jV5CObErW
 ZAQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The S4 requires additional clock control bits to be turn on while enabled.
> The S4 has 8 TDM lanes, instead of 4 on previous SoC.
> Update the widget accordingly.
> 
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/g12a-toacodec.c | 49 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 21941ee552c5..9cfed3702354 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c
> @@ -41,6 +41,9 @@
>  #define  CTRL0_BCLK_SEL_LSB		4
>  #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
>  
> +#define CTRL0_BCLK_ENABLE_SHIFT		30
> +#define CTRL0_MCLK_ENABLE_SHIFT		29

Please follow the indentation convention in place (2 spaces)

> +
>  #define TOACODEC_OUT_CHMAX		2
>  
>  struct g12a_toacodec {
> @@ -141,6 +144,16 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
> +			    &g12a_toacodec_out_enable),
> +	SND_SOC_DAPM_SUPPLY("I2S BCLK Gate", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_SHIFT, 0, NULL, 0),
> +	SND_SOC_DAPM_SUPPLY("I2S MCLK Gate", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_SHIFT, 0, NULL, 0),

BCLK Gate => BCLK EN, same for MCLK

> +
> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -226,6 +239,16 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>  	{ "OUT Capture", NULL, "OUT EN" },
>  };
>  
> +static const struct snd_soc_dapm_route s4_toacodec_routes[] = {
> +	{ "SRC", "I2S A", "IN A Playback" },
> +	{ "SRC", "I2S B", "IN B Playback" },
> +	{ "SRC", "I2S C", "IN C Playback" },
> +	{ "OUT EN", "Switch", "SRC" },
> +	{ "OUT Capture", NULL, "OUT EN" },
> +	{ "OUT EN", NULL, "I2S BCLK Gate" },
> +	{ "I2S BCLK Gate", NULL, "I2S MCLK Gate" },

Audio signal does not go through those Gate elements
They should be supply path connected to OUT EN.

-- 
Jerome

