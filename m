Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C174C8D
	for <linux-sound@vger.kernel.org>; Fri, 26 Jul 2024 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722003060; cv=none; b=QKQVEmFXnONRrOAzS/JsWktBTZ7HGJLvQ6P7Qp7TEyMN/T9tfAyg+KMZFUG4nNBfKJ03RK0pwOGfwojqedvxogB3rP5EDSRg6mlsJxuhMi26Hk+O99EbVlI8EWXc9260OC0UbxdmPbZSnNrxVYBopwOtcJ8/zwqfF2VS1PJoaW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722003060; c=relaxed/simple;
	bh=U0iQgUf77isNWPz5wSO/QalnZ8ymeec3WHS6WdettZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyosAF4sIou0KM0R+iYdKm60vnqPUfw2m8x4GU7o9WkbhmtSVW5+mx7JJA6lIGmZuSSoQu98EHrEbhrQ936jZKqxMFZOsf0q5k9esuLzjfa2mfD8XLyzt4wc9raxFLlPKLZ77Yc+D7pvM0bJnxp6ODnCEMjQLuhmQNzNVL33xq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ALCVqZPz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ALCVqZPz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42793fc0a6dso15704825e9.0
        for <linux-sound@vger.kernel.org>; Fri, 26 Jul 2024 07:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722003057; x=1722607857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEkK+be/9njUC3Is9y04g3ij2793OMGUHZjC8ZIJXBo=;
        b=ALCVqZPzjQ7Dn0u2cgQa9zAwxf8ZZ+aJFmNknjQyum6Cm3bXlyIXeeGs3OdwtwQ3ST
         Sqa6QferPSzs7am+Kf5afxWV4c8mTTEOL7kypiV/Q3J0/HjhD46iH2x52uU/a4/i4mtX
         hDATLep18wBYCNJttR/GmRNUe5B6AEfEa86I+0e3PuNB6fminA+PW39uSOAuH5zyCg+T
         7dWTHlqJ+YLb2iW0ZSFRhAwCkfpE9EcM7O1yeeTd7M4zVweTnZqU7oPMohogn3x+fBPD
         CtWXt5e7xfgm5pMrIbCnB0vJupPU7K3LKjkx9tFVLTL1VMQi+EylJ6cc6fHD/n3se1mR
         M2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722003057; x=1722607857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEkK+be/9njUC3Is9y04g3ij2793OMGUHZjC8ZIJXBo=;
        b=N2K7PaUlW9BNgxRk5eGX7qyFW3+7M4gNfm1CYKgoVDly8ELoqo50PjJdyrFnjSvNED
         rTzZ9BoZwwv0IJUTqTxLZlt5q6w3DtFTfGxgSEUXiR9nnJtxGVfzveo09Qu8GDLunBxV
         3LmZsD50vVL6JZTqQjQJgN1JaPI88/W1FsTb39lka8VmnOhd2+iUO7RHAixYg7XAmtxL
         DWdfXxwVB4eSrzpeRShj8lG000dzBWzibg5SN0q9/PbXVJs7ZcMYYdcdNpIk2AZ4Mtg8
         bxkqc06oOLJbl8rKXqYkdRMIl7snEiM/OQ6usY5xUqVZsAwpv9Fz9sZJWjXkT5N4bYx6
         EV2Q==
X-Gm-Message-State: AOJu0Yx99IEoNmHgwi9550WVD6IM1/SwCeyVJxXB+VQNJlmhTGy5vI1J
	/Q4g3h9VAqDMkJLzlZgbj5gB+80jnE+MYtdrfiZTsvByEaZ80KQ7Dd847Qn/h44=
X-Google-Smtp-Source: AGHT+IFV/ZpujOQQuNU4y5xUkqHK9TT5v4LwDRDBL4tAqj/tx/FvrWYNs9CZlkMnnbNmp4SxPWDCKQ==
X-Received: by 2002:a05:600c:45d0:b0:426:6945:75b8 with SMTP id 5b1f17b1804b1-4280579e92cmr43011845e9.31.1722003057369;
        Fri, 26 Jul 2024 07:10:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f941352asm120841115e9.41.2024.07.26.07.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 07:10:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 26 Jul 2024 16:10:41 +0200
Subject: [PATCH 1/6] ASoC: codecs: wcd937x-sdw: Correct Soundwire ports
 mask
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-1-d4d7a8b56f05@linaro.org>
References: <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
In-Reply-To: <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>, 
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1998;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=U0iQgUf77isNWPz5wSO/QalnZ8ymeec3WHS6WdettZs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmo65oM7TrQ4WPQo4XevW2lOaGA4R95dKCpZlv6
 wW46Z1aQP+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqOuaAAKCRDBN2bmhouD
 1/fvEACZejwshy7ORBUx21bbMgVsL7J/sztl10qJqNBoJeYs/gzMUsbENWm5JgO41XERX3/pfSo
 njQhapIsqRFLzlnen+Ok8TM/VRFoJUcXy5ttXSSOeSg/VRqNXO3op1XZQVgQkthRMruMwLtpQfv
 p7Ioldc0W1i2+muv17N+dtEVTsiVqQHDeMxTLZyUehIqIh0ujJG3Epa/uY+L49uSDoDKmpDPfQN
 Kb+BGzsuOCNeSorxevLNxmXad8la64bfdRXcxA29XsM5dht0wps8ECiIa4UEJRKowxISObJp/Wi
 ssDC4gmOguXoqxa/d1b7jCpx+6CnGgAWr85xitDbo0u/eJcBtJJuabta0yinmIHEjs34mRAae6X
 IT4p8mC7im5Ci/ErNcqoSwu1P2KrF0Hj3NyhrKBQ0UKUfgl1KyBk5xVHpLXEq4lLP4hpJMM+pZI
 XXKqLLfLc9owJQYBlFp0i/E4pq8xUpQOPTUAPBDnwoPe9tG0LXpApktVOEbv1EOCkMcelM1MitR
 zx6dHe1tFQ4WrJxFcx50DYUrsg3AVxtgH0HHPNC3w3Uy3ymLQc9RMGR7eTML5ZuqbMFf1gtzMjG
 R7VzVUxbGQomk/JoXeagI4n3whtWwoR3JUgTD3Bkx6oIpEqJHsIUYcdbaKuNM9S4TuyGGxPartk
 vl9HRMjVQGz3lGw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device has up to WCD937X_MAX_TX_SWR_PORTS (or WCD937X_MAX_SWR_PORTS
for sink) number of ports and the array assigned to prop.src_dpn_prop
and prop.sink_dpn_prop has 0..WCD937X_MAX_TX_SWR_PORTS-1 elements.  On
the other hand, GENMASK(high, low) creates an inclusive mask between
<high, low>, so we need the mask from 0 up to WCD937X_MAX_TX_SWR_PORTS-1.

Theoretically, too wide mask could cause an out of bounds read in
sdw_get_slave_dpn_prop() in stream.c, however only in the case of buggy
driver, e.g. adding incorrect number of ports via
sdw_stream_add_slave().

Fixes: c99a515ff153 ("ASoC: codecs: wcd937x-sdw: add SoundWire driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Cc-stable because I don't think the issue can lead to real
out-of-bounds read.
---
 sound/soc/codecs/wcd937x-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 3abc8041406a..0c33f7f3dc25 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -1049,7 +1049,7 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 	pdev->prop.lane_control_support = true;
 	pdev->prop.simple_clk_stop_capable = true;
 	if (wcd->is_tx) {
-		pdev->prop.source_ports = GENMASK(WCD937X_MAX_TX_SWR_PORTS, 0);
+		pdev->prop.source_ports = GENMASK(WCD937X_MAX_TX_SWR_PORTS - 1, 0);
 		pdev->prop.src_dpn_prop = wcd937x_dpn_prop;
 		wcd->ch_info = &wcd937x_sdw_tx_ch_info[0];
 		pdev->prop.wake_capable = true;
@@ -1062,7 +1062,7 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 		/* Start in cache-only until device is enumerated */
 		regcache_cache_only(wcd->regmap, true);
 	} else {
-		pdev->prop.sink_ports = GENMASK(WCD937X_MAX_SWR_PORTS, 0);
+		pdev->prop.sink_ports = GENMASK(WCD937X_MAX_SWR_PORTS - 1, 0);
 		pdev->prop.sink_dpn_prop = wcd937x_dpn_prop;
 		wcd->ch_info = &wcd937x_sdw_rx_ch_info[0];
 	}

-- 
2.43.0

