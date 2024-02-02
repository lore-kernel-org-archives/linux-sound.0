Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F7F146917
	for <linux-sound@vger.kernel.org>; Fri,  2 Feb 2024 15:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706888504; cv=none; b=eLvhHAoag+wbVTA9aZ5jBpVoZUunw9NixP9No1Tornt3ajFI3SPbxjdAz5aUJRgaSQazUvPh6MB/Jhtcolq/Ze1nmDSyadgRJVqHP8rF2ZOtVyXxSpObxBnt2okKHwxy2Z3mj+p0INByH5tl+wB4I0Kjiywisx+1laqT+3AT2xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706888504; c=relaxed/simple;
	bh=scWCCSNr1Q3lv9FkWzECrNcLle7Ox7YalRe8vTccd4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DxvyxCrqcEZOlOQ6rBl76AxrsHTj725+u2mVNnSSp/KH2gvO2rJfOo3VGpxRc8RQokvMbG0laHjmgkLpOtX0hthhaPXSujB5DoxJrvpdFPB4Csjkd0PFSLMzraRzt7OZM2l4DGUyhwyi6xiqmikxn7Gk+AFoQPrqQ9j7vNOAHIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zdSjn+pz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zdSjn+pz"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5113a97a565so577341e87.3
        for <linux-sound@vger.kernel.org>; Fri, 02 Feb 2024 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706888501; x=1707493301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTaE595ceD/5+24qRv22P7o3MSmNjYJJN4DZfYKGFdg=;
        b=zdSjn+pzgqCXHaQj2HLnL2H+BliDJ3UvQ6QpRa8YnAzD5Ol+jhop8XZrBify/XfeSC
         b231xBp3i8a3WZo7uuERJtHDatYFylDKNMYiauAISg9SjGV+UL7HE24Da/nJKHqVPqBH
         y9cowYtIGBL2hJs+DYIJ3emiHqRVB+Uk/9rtTbnziYXKQMh6uQ7O2nafytV/bX6JKKH3
         DX9s2Sz92K3ZaDTZmmOHAVSGANplR+ZzpscB0SG28fz+7wT/2osn40lIV9IZzsQ0JQEO
         EnO+3E5pzt/1TtYhFGPXy+IHgPd1Z6DdLEwhoFWVzj/RevwB48xox39sObAuS48kcDT7
         1oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706888501; x=1707493301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTaE595ceD/5+24qRv22P7o3MSmNjYJJN4DZfYKGFdg=;
        b=V2VChzzwKbWcYRoGyenlpJFndPasW3iVfQp8rdCuzlD+hqiGCcvjqoMUhGOXyG1gA3
         MqF2gWBwjXnyRABHwys/iJQMg4EnkbbuzFFLLeW+Xnopf+UnME/4Eq3EMiLA95lB9a0p
         o3tfoN/CuGlKq34egV6QsGNdGG93Ze/2KAFqRqs+V5Q65F5KjA3CmPbhQK90CQpNnHD5
         ojHulXEO+hXfttsgv8qLFrGahPB4gBK1h0w0XYNaYKgr6wX08XpUJIQHdgCGgMcZHrKF
         mxIr/qWkbILf88F2SoLDc5VwmTfDGayZO3v4Kl9SMNCio37AlmkVzf8nfshJZjZNa7vw
         RAxw==
X-Gm-Message-State: AOJu0YwmVTnlnYvEnn2GzaLS1k05ft/n9zj65ObWj0+u5IAFxrOgBOYy
	zELkgmevBX43puWxWB1eAD9AcMQJDX45QkCix9HSVo9r659iHwEcXYuzsRoPCMw=
X-Google-Smtp-Source: AGHT+IHGdGRJSDguuQBM/q+45C0xJUE3HWzzBXrNL1nVnq4WR1VewqBP5WknN4Upn68unEhG+XLvNQ==
X-Received: by 2002:a05:6512:707:b0:511:3622:508e with SMTP id b7-20020a056512070700b005113622508emr1363443lfs.62.1706888500980;
        Fri, 02 Feb 2024 07:41:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVkuv4Il9EedgVLpQq/ZhdclgzdmtTwnPPSDBsrgSnZo+gjyW9AHgkjtA+/h21aEJrXSM0g1Sj80CLaSu1E5KvA4lvxLsn460edSq0v+V53kBD0D+qR7Aup78/Hhj+2CZqq04PyCdookc7Mqu53p6Ef0iliIChxx/NYodMp70e3QHW5z1l8YYdk4MXG24+VwQYHaTIXy4N4QFMbI0A70BnG2aDH07mIL9KD0FGVXoKP4oyTC690lDHVbZXfeGriepHqBiaYDn43d1ynKeutgJROqaBopUTFKb6d+jurU5MSKqJvhnAF
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id cu9-20020a170906ba8900b00a37116e2885sm624819ejd.84.2024.02.02.07.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 07:41:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] ASoC: codecs: tx-macro: Mark AMIC control registers as volatile
Date: Fri,  2 Feb 2024 16:41:33 +0100
Message-Id: <20240202154134.66967-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240202154134.66967-1-krzysztof.kozlowski@linaro.org>
References: <20240202154134.66967-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just like DMIC, the AMIC control registers are volatile.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index cdceccf64ac8..2d4f6c04332b 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -432,6 +432,8 @@ static bool tx_is_volatile_register(struct device *dev, unsigned int reg)
 	case CDC_TX_TOP_CSR_SWR_DMIC1_CTL:
 	case CDC_TX_TOP_CSR_SWR_DMIC2_CTL:
 	case CDC_TX_TOP_CSR_SWR_DMIC3_CTL:
+	case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
+	case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
 		return true;
 	}
 	return false;
-- 
2.34.1

