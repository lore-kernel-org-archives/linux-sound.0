Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ECC1C0DC3
	for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 14:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714485785; cv=none; b=gPHJ5AOMunPgM6DPDN9IaaE08g/Q8uClZY6JzuUrb0/rIcXaKwWIfEmIP171rjbNmq3sOJ+sFBqdvbvCrlPSArPN85vRG/sKlZz2IdUBJy6WkZdARwiXpa3COJmTF8nq08KGbHc6ullxgce0toNz9Jeq+6fUbxAsRKQx+fAh1kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714485785; c=relaxed/simple;
	bh=ZJVoQsuYVbU6eX1WKifNhQyvCwwvs/Q4umjN6N4+yu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JciBAl7HM4yWtMT6bLW/GFFqA9t3yyKw0qoo6BYyuo0KF4WzFdOfXWywX4+4u4U2G/+ZllNyotRlnAp5+a0rtyb+9wISNBtFdQzUiJpBqlRDNG4KwUrdCEv6ogRbNf/CQ6KyoYIHleuRDbSBXpJUl/cCkP0p2wNMqluoB89uL4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ldtTebgW; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ldtTebgW"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-572a06e47a7so607745a12.3
        for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 07:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485781; x=1715090581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wnYPNchoJMJHPXPE9uqd4IXLQ1+2DNP0wbgQTer3qE=;
        b=ldtTebgWlJEzlLX5URZHyCeDlBnLJo17vVkTKPqhfmAzHM0S6AMjXqnlDPltjsOQMq
         JrVRkUUv/AiQ+FU0lMwKViuNVZ00cMd5W8NhR3Ab9dmNCPZ/9MVoqCw1n/G6GMfjp/Ec
         prqLaFJ4tZrWJXFR4vAQxLUvq4Fvk6PqQoEqFTvFZTXp4upNrbpcL6j1NLAtjbcgV9mr
         5xyIiDDZTs4QcYSWRODOKRqABrkHrWeK9b3Vn2wBApmupjVhBwpb36eCvi58HZBMbZSD
         kSStiGAM1WqLfYMk/eg2fH+ud+ULPLKOk1/Leb9ijfkE+cLoXmuGDDintLheRTDy/kEj
         oiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485781; x=1715090581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wnYPNchoJMJHPXPE9uqd4IXLQ1+2DNP0wbgQTer3qE=;
        b=b7OsUn+Nvhvw1SHepPYJMBdDKXs6WXD4Tdkly770HDtWGcxfte/LsgKWrDcKwWo9vD
         xzKy7t71J0QDv4oEm5MBmNBYU88SoQOCLQnqf9yZIpGX+m34YLd6PWEva0wfy0JioL+O
         SfAdHJ8jmVm0gvgMlVRpgr0Q6Si+9qBpGuNMcqLkVyei80L/JZD579W8WRGgHTuqcuwQ
         BFOL9hwPspI5WqfS31DzjlUL93lJf4XZ4x1GL8NGdEqx97iiBp0NaMtU/2FZoM4eTGiB
         12HlNyW82Tl4jYXci5goookGhCd/Qi9QTh1OEte3TgHmN6+nT0/R8FgGTba5c8wGwkF0
         40Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVVn1AF1JOH4xajTQgykx1kW25FtKu/cf/ooaXf8PffX34BegzYOpcJyz6eCi2LeM77ZFhz6fKTKWcPisLHuM7d7aibmNPvqOuEe/s=
X-Gm-Message-State: AOJu0YzxySws5TzcH8EEsMX7uiWOgUJvfldqktA0Nl1PsUOgCkeFayDx
	unq3H+zvfRHQFeGYod5fULlfwe8PAQB5cqB85c4OK0OCGRnUB/eJTk8AZC66DJU=
X-Google-Smtp-Source: AGHT+IHfqH0vbD3bQInQbBF2YUx3yEJaJuYtVm+BQiqXb8Xkd6Z+iJPnJ+JbD3G3lpGOTc/Xz5AyMg==
X-Received: by 2002:a17:907:76a4:b0:a58:94c1:88c9 with SMTP id jw4-20020a17090776a400b00a5894c188c9mr10358426ejc.54.1714485780892;
        Tue, 30 Apr 2024 07:03:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:16 +0200
Subject: [PATCH 07/13] ASoC: img: Use snd_soc_substream_to_rtd() for
 accessing private_data
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-7-6f8a8902b479@linaro.org>
References: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ZJVoQsuYVbU6eX1WKifNhQyvCwwvs/Q4umjN6N4+yu4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnz7LqN72vQN5f6xW+8v1IAmdOUCMPS6bcOV
 4KOBcs83WmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD58wAKCRDBN2bmhouD
 12uLD/wJ78QXDNb2piUOxSHgAlHla7As9001viT+koWXU/H7+DT8NtdMhT51dhbsQHiwJTtlPtD
 v3rC/wbLFAMaGDIiWvpnu6k+B052j/BXEI/AehuKgv4cRWhNtPKvFOKq1xqdWsRw0716H2t9hFG
 2jji38Y55VThEkJU2s/2A+dyolipm/A2PYgxMVJTO2l5DA469GyAQo6sBIY2U/cunIB3Nd5iXjE
 Q3am7Lu9EXrAVEs3BW97SbLIHkYf0T5TAzmd8NGKPpDxyuCZXX18ORVI6i9N7ObF7t002ooK2kS
 ojdOtbdfw+8odlw1cUk0WmcG2BmcKgq60G25WepWhGsaV86YzAG4j0PmBLoDpKaIajgntlgaXru
 C59rV1W8tr/ZE1ju9NExCpppLGnkJdg1uS/O8ht/KxBbXbi7EIaeuB9CgaJ61HQpTjOo7fl4Wbf
 Rpr2d48ma59TnUEfG2V3VYPvbYQlMec8a+1gOtwjG9C7eGdUDWFPtphMaW/PQOdGdwQE6of966h
 08q8aydTVqPyc6BlBswO7GuRGZvbVbSjXzYlnWR3btBq5N/fAyyLJVZQAR/CLmHCNxuMnquGLnh
 Ki9ObapaRsHnKsbyLXLqmRwcEn/t2Ywexl6X3EbXj9/YMjD5OQJehn/bvQ8tFvT1+BObAtIFNxa
 lE5v1KAME9l6c0Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/img/img-i2s-in.c  | 2 +-
 sound/soc/img/img-i2s-out.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index dacc29fcf24b..b69a364d619e 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -395,7 +395,7 @@ static int img_i2s_in_dma_prepare_slave_config(struct snd_pcm_substream *st,
 	struct snd_pcm_hw_params *params, struct dma_slave_config *sc)
 {
 	unsigned int i2s_channels = params_channels(params) / 2;
-	struct snd_soc_pcm_runtime *rtd = st->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(st);
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	int ret;
 
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index f442d985ab87..6f9831c6d6e0 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -401,7 +401,7 @@ static int img_i2s_out_dma_prepare_slave_config(struct snd_pcm_substream *st,
 	struct snd_pcm_hw_params *params, struct dma_slave_config *sc)
 {
 	unsigned int i2s_channels = params_channels(params) / 2;
-	struct snd_soc_pcm_runtime *rtd = st->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(st);
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	int ret;
 

-- 
2.43.0

