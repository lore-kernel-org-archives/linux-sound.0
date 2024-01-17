Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856FB225AF
	for <linux-sound@vger.kernel.org>; Wed, 17 Jan 2024 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705504341; cv=none; b=EpmsW9FjXwk5QBEgW8YIcl42An4SUQZVjOzUhntYKaQ5TSKeeQb7EtuClNuu2/kvbiKEuJdQMnF155vgk5xgLXJDcZxbMkbkrfzJkcyLeh1JP04uI/FxwAyGtTkrEuTb1yq8zc4ZSKZvN+L2+y7WaLNFxPEi+umEidFQ8CnW28Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705504341; c=relaxed/simple;
	bh=zTLF4pKwDUhmIJpTw+ifYX48G8Y/tLdkZCXLW1dsOdg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=XW2K/vciHjy2+kQlN9cRjn4yAmcHff7/Bjxz9D6HcMb6xy37yU0G4sE2K6EC2uY95nH0+eWCHe7uYIbOwpVZ9JeQZz8+DB53sfYzUUiYx2/ZnnwrA72fUQ7GIWo9BUOGGdKY9PHSUrdOlvnE8IVXxud9yg65bDOFoUU/+1JsbrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IrakBhjW; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IrakBhjW"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78329cb6742so550510785a.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jan 2024 07:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705504338; x=1706109138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZ5dWg/o67onmhTzNFtXrOTvUPTxoBK6DGUcni7z13M=;
        b=IrakBhjWYcTx281uJkfflWwa2NOYOeI1bCsGnxGVZrm6IjaBFUx7p0duk6zyKECBmQ
         dY/7X03ylYyCkWz59EehpkTbs8mKqgtBHJSZ/QWQeK9fDPI283k0wJ5UmQqtlYKrPGvm
         OWbP23UZMsfMSm6B5xliduX7ujbSXRKph1AgCZgFWgKSMVdp1T9fLtX8ov9Ec9aeYYom
         baa9xku1mtGfyq662seh7VQELl01Wg64sLh8kFd8W0DgONwth41KNlNEvdhFNdGIab1q
         MyE30R3wPb+HvgHbmC1dHoBz3oqYYXHlpjMqxwL0GJYb5nPqsbQk+O9wFMXudX9GodPm
         tceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705504338; x=1706109138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZ5dWg/o67onmhTzNFtXrOTvUPTxoBK6DGUcni7z13M=;
        b=d2VZmuUhP9fgAqv3RZVeCyhQv72X/FMnhjFXQaJccVSwebYsKO5LJLHB0YqilfRvRc
         j03+08JCbnhF7cEqNpyu2NSIw8YcACOUCfpJb/OZNpKLHf00+eyE6qESMItfPmMMMf/3
         F0Tfz94ahvHGVkHpguCTMFKkrqVI52kznqKewJmPvhmZj8BHOlZjP3Q+Tiuc697ptfd+
         NfqEv6S28BWT+/5XOd9UO6ZY/rGPB/RAds6D+zeaxgA/ogtevWm7Maj0x5EI+x5ihyvW
         XQK9QLR94QN8/sG3DyURoI+/OZ4Fuw+RzswvP0lhZjJ+pW1Y0oKeJrmEgbZJdINMageG
         3bcQ==
X-Gm-Message-State: AOJu0YyLoleeCqjmw/ybM4stzJ78IEtz2YsyztC9JwLr9+D1tJMXh5ly
	pYnmU2Q1rChZPcjEiliBqrqQ7u43FaM4eg==
X-Google-Smtp-Source: AGHT+IFuzN2ZXkdL1furtqKyL/+PADgDDPC7U/QwREJrS3KVsloHm7pc6AYqgLOErGBf8DiUCfrogw==
X-Received: by 2002:a05:620a:55b0:b0:783:54a1:136f with SMTP id vr16-20020a05620a55b000b0078354a1136fmr5882267qkn.58.1705504338226;
        Wed, 17 Jan 2024 07:12:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id m7-20020a05620a24c700b007816cf21f7asm4519337qkn.76.2024.01.17.07.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 07:12:17 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] ASoC: codecs: wcd938x: handle deferred probe
Date: Wed, 17 Jan 2024 16:12:06 +0100
Message-Id: <20240117151208.1219755-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WCD938x sound codec driver ignores return status of getting regulators
and returns EINVAL instead of EPROBE_DEFER.  If regulator provider
probes after the codec, system is left without probed audio:

  wcd938x_codec audio-codec: wcd938x_probe: Fail to obtain platform data
  wcd938x_codec: probe of audio-codec failed with error -22

Fixes: 16572522aece ("ASoC: codecs: wcd938x-sdw: add SoundWire driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index faf8d3f9b3c5..0aaf494844aa 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3589,7 +3589,7 @@ static int wcd938x_probe(struct platform_device *pdev)
 	ret = wcd938x_populate_dt_data(wcd938x, dev);
 	if (ret) {
 		dev_err(dev, "%s: Fail to obtain platform data\n", __func__);
-		return -EINVAL;
+		return ret;
 	}
 
 	ret = wcd938x_add_slave_components(wcd938x, dev, &match);
-- 
2.34.1

