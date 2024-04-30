Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219B91A38CB
	for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714485768; cv=none; b=YYqXqPSwTn/dS82/MvyxPeAc08Ul4iQYYZ7yVemGwjZCv72lGlr4wMPoRbi1Qomgv4zG7+JKCnkX7WAjkl5wCASFpEY3FBa1CPonhYeMkq8cmyYYMAag0bVH9cJCPWPNgJahsx0KjH/yuOSIAWtW2aVZqb0r5uW/7/KscAvHsSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714485768; c=relaxed/simple;
	bh=WaTWh6A8XvKFs+19MMAHdgA+abbpsyoPq1iDSypgs+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WaO+6rAuDy3uP4c1h4qur/sBcUpxxd65/D1dHF/orJi5BNFFgPSqfPAdI5rC5iDKX+vdUjuvKUIZBUHi0lmYX9lyfEjH4DQ3U/NKmp0WL09ulWr55AboRX1odU4IG8EJ0s3VJJFE1wWGLf81mTQnA/pzcC3pWujiAyxVGhOjuGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qXMUD8s5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qXMUD8s5"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a58eb9a42d9so412786766b.0
        for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 07:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485764; x=1715090564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Lk1lue097q/WOSyrBvWDsG60XQkpuZqlzoh3fFX8H4=;
        b=qXMUD8s5yCZbgTUQybhxAeNfSALWk6K0PyaISj56e0GbTkSL/slLjnMU6L/vVh+GAS
         z/AiY/u2BfmRmjojeJkntc1TcRWwwsi3hdVTbRN/+g8Qz+Il0kIyG/Nf3XbLfbTiLE5J
         m49rOVhR01gOjMAVjNh3QpWDL//7F1UGE3WEUPLU2eLDjDMYZU8D7eIraAVAatdSwqnF
         +flPUGA8pcfEJvE+AI8yZwyesZnqpG61BBT8cuTCkHwH0f0Z07AL3/Byl8sXFzZLX6Wh
         eDfr9I+9yUrJrrkFJctswfBisVEGA7/+09PyUPP6AaLBg/+svkd0KNQ2xhHVoXjCUqo6
         /1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485764; x=1715090564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Lk1lue097q/WOSyrBvWDsG60XQkpuZqlzoh3fFX8H4=;
        b=LD8aXe68N/aWKkASzM2in1Wj/T6uc3Fi0vrMmnAWvvRvLF+jk7ttcJCT3V07tS0ikH
         0sKoUDaiueBWmV5NC9asmb5AN0tH/PAYrcSyT7YIVLfxHtYdD8ys0kApNvR1+649dEZ2
         JhGdiSaeJOk8eMCgCS1wTGl8KWR180ds+vTm5ANpFdu8r8nMhlXdu84vE4dS43+pQS16
         5eRz/hzf291iyo4RoDUjLzUK0uwl7LEwVTZiJbOd0bTwdi97SYzj8RwMdzJbbbgw9k1l
         Zj0ttOUP5/GFPWVlMY9F+pyojXLdrWfPtA7f7eIVjPi45ytgjm7gAqA5uIbeatRjOuLA
         JnfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3O/alnDvcxOzfeI4ygWqJygvrX80aNyvMEHuaQQxU2wASuGfa3ofz0XazibjG4zYVOSytVh2JbVYBXv3PL2f83CIDlONCGp4nz/4=
X-Gm-Message-State: AOJu0YySkTopE6KfdeyvRsZoWUZUZwU+GEuYcgSdWfT+ru7P5zYqB6Vj
	4CkI3qFFDNIqcdr8f0Hdlpay2IzvzcRIY7raXvSZQfcDOcsbTknHq7W6SKqh9Ww=
X-Google-Smtp-Source: AGHT+IEe6L8iR4uGhiIxTqGIW4asn+4q9EAd3lfdb1piiCjrm73a/9Wg4NOc67T8NvbSyWss22Ri9g==
X-Received: by 2002:a17:906:ff42:b0:a55:b345:63ec with SMTP id zo2-20020a170906ff4200b00a55b34563ecmr2134852ejb.15.1714485764472;
        Tue, 30 Apr 2024 07:02:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:12 +0200
Subject: [PATCH 03/13] ASoC: ti: Use snd_soc_substream_to_rtd() for
 accessing private_data
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-3-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=704;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WaTWh6A8XvKFs+19MMAHdgA+abbpsyoPq1iDSypgs+0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnvj78Se5sQ1IGtmZPj3Apt3l8lrraNbdATP
 5UZknZzzu2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD57wAKCRDBN2bmhouD
 1/rKEACNiDDDmi+VKdGySua5uR69g1WVV9N9njkaGa6BQYvqocDTXh2A5T950fbqbmHniXfNShS
 JZsCqqwu5KxhFaDGF7+cJT9d8h+f+7+N7XdkXJiLCDqED/vhEdXSK+RJxvjyb2UGCtkF2vXvq3I
 qq11t/wIu9DJwANQ/5NqaRpQUsdJGIYQrngiCXGTVr86HT4kWz6cB50Fq2Rc1Nwer1MNbFgNXPD
 EjdcTuqvqRJxRoo0qJQ1uv5PK8ANQ1WI38IhHUgC9cSPyb8BjmRNwBk/6M8bqGZXxd2GI3h0DzD
 8V7Ep+O/4i5WkC/o/RdS0k/Jvzkfl794WdVSrh5ko0yoTWBfgLKB0pDzT5Td5wsGDLH4nLzQX/V
 5FUZJy3lvXFB5nrv9g3mS+E8KOagd4bqA8hkkVqkp5amB7IyjqR87us8YZTtD99ZhtHJ8VBMkd+
 fbJwxHjx4G4Tlbdh0zvD3QybwWSvS6+wPWtlX37WjHLAiWt8YIsZU7wDGSPZJGubhB71ork6bJk
 ATYI7HLcuqJT/iIWO4n1K+oIgsMbXTSo/c+WM1q9Tc22MWyviROO784jazEoZ1HWS2txtvOqMzf
 OBzZt/XtPghj+yRRLI6/+9SDQsMxuhH//frbs22BShcGa8gdvXz3dj2VkoB0xwDtpQ8OPZ7XHdl
 o8rt6UoEwW2rmsw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/ti/omap-hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 4513b527ab97..639bc83f4263 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -40,7 +40,7 @@ struct hdmi_audio_data {
 static
 struct hdmi_audio_data *card_drvdata_substream(struct snd_pcm_substream *ss)
 {
-	struct snd_soc_pcm_runtime *rtd = ss->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(ss);
 
 	return snd_soc_card_get_drvdata(rtd->card);
 }

-- 
2.43.0

