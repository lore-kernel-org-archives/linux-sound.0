Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3BF1822F3
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208956; cv=none; b=ohki4TFtxvh4kr6w05c2k+RL4odhtnp0DLD3k8VOSpg30V+A+CwLkdu+J79TISRpjjn3lfu8SexVMd7+u4UVL1zjrNHVrwQWeXZp9KkrgdNGExz6acsPeNEDZrff1NiA8sPPFm80AL4Ml9GLz/9Qfqp64GWjZjKvOGZEwi6TgLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208956; c=relaxed/simple;
	bh=g2xHVarXvyCS+YBEFCdlIQ1R2j746Vst49InZdmOz3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WPhEbDk0FEw0dX8hbnfoBDjZ3XMqYF8m6vi3+0WGoPuXANsuQy6uLiAbUIFNA2zAPeP+UqfhdV2YRvMQ1+f891H9pvgzPpkQxWjJJEUe2OjjNIgC7B2jlCw9Q6Ujzhh0TO3E06hdDvEB5GOG3YHPh9rOV9bVMPqyIsVPCm6OrjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wt1pOzzM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wt1pOzzM"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a68b41ef3f6so9003566b.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208953; x=1718813753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8VimLKvT4ABsxFxevhxxNfg0qw4/IiIcQHT7uX7SMs=;
        b=Wt1pOzzM9gCxRC1biG7CNd9S/fjctZNnvTXHaqFZYpKwqLP/BbHNcbEFOdKT8OTYKG
         qpqm9Xx2kEf86NSjYKv8ThvakGvaHvySrOwZXATtPnybzgj+lgQhkOUnFtam6VEHkW0U
         9mc6CpPA+Xm3TH6v3VT9+PpDxQQO1EMf3D+35ZvZ7J6wfz5PLZMzTRtBdoIrstgVkodQ
         FM9UjTqPK2L9UOkZFwAH6TDZH9vlF7JS7ngHh5p4pEAo3oT6aoaWxIpOr8uDTjHAH1Kk
         Eainc76+AIRmaAHy0n/ls5nPNjps+LXDa/M5bSQM+vrJIuwrPP8F4XQmB0zogQfdMEiN
         bmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208953; x=1718813753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8VimLKvT4ABsxFxevhxxNfg0qw4/IiIcQHT7uX7SMs=;
        b=RwmqAdcQzMZJRHy4vCjeh8UTumxK1faiYWUdj3nUBh8Hs9t1Fkt1d1SB219l0W2dFr
         2iIbyjAMFlsSDToxCOlGyujZKm5UAzCsqR5TvNv4frLAhcyrzRqoTTGfm8BgpEBjRGFr
         IAp/3hcKz4PozR0dUSuTtOMX7aoElGFsvIHzC8Al3efR5OPIJhbVV5oeRUtcGbAoY299
         ca2nnrqbYIbqHy7SFs7EVq4ydDOGITrhQilHo9E3HEaoZ5o+3ypC3aOgkB7T/SrrAXYj
         G+1fr0wa+nlo3cCPlDfnc79StSZi8GZDiToOmvtZklIB6Z8NErXbeycoyKy7cBJMmJtT
         v3Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUNTwamO3YwUH9ZWeVeCFLBwojiaigCXsrgQrm2nJfUXmBZ8C5XWPMsZk/UBxCI/MKTgZQJqyz0bi3l6QSarFpH4P766nbVHcsIWOU=
X-Gm-Message-State: AOJu0YwRbNXV+rhQHcBtKo/EI/Qixc9jKRxYFy9T6OWUN62YZKG9J37/
	Y97wmimXPQrdY8B8m+TZrfCF6N/UWd4EaYTEe20xtPS2qrq4+s0olcojLHb7sMg=
X-Google-Smtp-Source: AGHT+IGTfvvCQj+ZNaFMkZ6wx7TiN7Ii9ExBRfK9lmhqZIRybLOb+747kCSXpsZax+KK21ylmXhTPA==
X-Received: by 2002:a17:906:a20a:b0:a6f:16c4:a5c4 with SMTP id a640c23a62f3a-a6f47d52367mr134173866b.20.1718208952754;
        Wed, 12 Jun 2024 09:15:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:21 +0200
Subject: [PATCH 08/23] ASoC: codecs: wcd934x: Constify static data
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-8-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=g2xHVarXvyCS+YBEFCdlIQ1R2j746Vst49InZdmOz3I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmeSFE+f/zsNCHQgFuBYKnXqNHmd/j2SQ58e
 6jiG2sco7GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJngAKCRDBN2bmhouD
 1yzcD/4yxf5LOsAQ3mrol2YYLGKoGQIRXfK3WfZuxOS/lBU0ucumfmz1z+oqUzYIqmccjQeKaXq
 NlGKJmaMY04RD+gyEGukOUDwSNI0d77Pf6bkVyzNe5924vuhazpCb58XhPOaAclJM0M6L2qwXXh
 7aLnQeNr4LC1yEyXxV4hVfxFyJHgRi8utspCKZKvtfhnwfm0xfURtYHoIg934GdiVpmbA/efN01
 zlWiGLeJcUr8tuFrykdDTP26XZVJaugMn9TjdcW2u2fHOnjX8SE2HlkckuvGFaTLFzw/N3/m9cw
 P3ClaU3RhJX58wtvJBETIVAYFeQgN++2cs9JQzQkTZovfsIeDNXWWWu6o3jDJj3IC6wxWpqE8nO
 yzuKEO65UNfyzwaV54XBGJu5lE37s4OsHPTbpwgYg7p0pRAAKhEdMnzTvB6Jr+qrF4Me8JQ903f
 wPrmt5RRRd04oMegWBw11QtzQVD0fmkQ3+9bntUc8pSnD/r6pKf5NJ1/TtJlNF7Nuh3VtUWyjXV
 o71thRJ5S/EcXAFiXbBCN58Q/re7UFQ5l/XRnQsvOIPO+bXA4bscNaiFerHEeBVYO7Q226iBweK
 soCp0AordfiLwFZ/Uh27/z7SZ3hFY5Z/EAMbunvdFmPkp9gciDgVreTzA6ihJR96wDL+i7JGQYD
 xzK1fG79wxsrJow==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify few static data (arrays with sample rates, MBHC
reg fields, regmap config), so make them const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index cdb68f34e55a..7885aa423886 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -480,7 +480,7 @@ struct interp_sample_rate {
 	int rate_val;
 };
 
-static struct interp_sample_rate sr_val_tbl[] = {
+static const struct interp_sample_rate sr_val_tbl[] = {
 	{8000, 0x0},
 	{16000, 0x1},
 	{32000, 0x3},
@@ -522,7 +522,7 @@ static const struct regmap_range_cfg wcd934x_ifc_ranges[] = {
 	},
 };
 
-static struct regmap_config wcd934x_ifc_regmap_config = {
+static const struct regmap_config wcd934x_ifc_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
 	.max_register = 0xffff,
@@ -1212,7 +1212,7 @@ static const struct soc_enum cdc_if_tx13_mux_enum =
 	SOC_ENUM_SINGLE(WCD934X_DATA_HUB_SB_TX13_INP_CFG, 0,
 			ARRAY_SIZE(cdc_if_tx13_mux_text), cdc_if_tx13_mux_text);
 
-static struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
+static const struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
 	WCD_MBHC_FIELD(WCD_MBHC_L_DET_EN, WCD934X_ANA_MBHC_MECH, 0x80),
 	WCD_MBHC_FIELD(WCD_MBHC_GND_DET_EN, WCD934X_ANA_MBHC_MECH, 0x40),
 	WCD_MBHC_FIELD(WCD_MBHC_MECH_DETECTION_TYPE, WCD934X_ANA_MBHC_MECH, 0x20),

-- 
2.43.0

