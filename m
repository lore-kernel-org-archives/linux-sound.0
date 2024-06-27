Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2154A198850
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719499491; cv=none; b=drbVZJdjr9414ySBdORsd1qDKb6gz70vVDrNiZd4yAbVpqHB2xAAy9wal9JIcTWmZk7Phky/gIxPs2IU4FT3W0kGmoU7HUtPpsf5/QNA03u352xM4dmDF21362U49dOmdRptrbEM7IgsZ91d5wMx0ZLiEgPGrunBdwqN0sKQCzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719499491; c=relaxed/simple;
	bh=F35vvznymN/8f2H0UImbT7wPJ9fTXmwdtHkeoQQ+rQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h/1zKox+edc4NP+xtvsd94YD0HA+eo3+SIg4ikQPzpIbH3l8i01Uwma/xkpx2uoRUnseR5fGaXKPxn1T3pUb5ZrRzTqKlPxtxzs1bwJCGKExpHrKdM7FBIPNe3QF0NXHfGUqY05n6dehy4vPs9zwI7QS1MmeJtTLRyZbZL5/EQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pEImIsAh; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pEImIsAh"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so90678921fa.3
        for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719499487; x=1720104287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlNY/dyZo4bLPWLizU4SMkpFGmMEgHoN8M4MjWgPapY=;
        b=pEImIsAhDxgFCI6FkeI5d3TNr3bszxFWCx2INF533HXvlMQzAZru9FJgUoDfddP1M0
         uroBM4KwEZEkuI/kmeM/U9eiWkiFdpK/uOY8UIuqNIohedXolPYgIBtj099XDlWR6zpV
         W/bBlH95RR2vfA35BheOVqv446AQ/9Ouv7Spts2t3SaNx+frz+oroccfPXzaye380oCa
         NzsNWzJ46WU6rhBCFUD2SpHkYY04DZfSlGzvZiFPmA56HEUuDIfVJHEfROV+tjBaSjcl
         GCRnhwNA7Y2Yk/oxzHySydbmjZjPWRrd/Dc+NEN3FFkgcD7LDfd/daD0HJTNu6XMMXH7
         Qbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499487; x=1720104287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlNY/dyZo4bLPWLizU4SMkpFGmMEgHoN8M4MjWgPapY=;
        b=A42iAjuNvwENd9XPiVNtkydJO3f1us0zq7wNyHkaV4V+7jM1n04K0WlBC6lz5bc8m2
         77nDwMEeqnSr7hmqCjZlMs2lRDACKP8vD1DL2MA/WqXULuSP8uBvor/YZEr4oeNfIW1Y
         BSrU1yZMhp6VrMq7SY7u6LPkGG2AUf6qaKp51UsU8aFxlhEfkxkvkeM+vTcKvRDB5vjg
         tI6qbXEW0uu35AFsLs40Jp8wrUXOmjjoNPUceSBTsSFcwfWBkxSKTWRfEv4xtkSwecxW
         2eSAM/brQ3qvIuUPbDOHvZjfShWqnfCjlWIrAzMe3jmXQGxDbBwQIB07ss2WB2+QmmDU
         9APA==
X-Forwarded-Encrypted: i=1; AJvYcCXNyDQ6qbXmEQJRtaH8SWMPLV3wD8mqaSc4r+8HmywOGTjRl4M2cvyxrCxmwLU6wtJRc5IZ+3Ny3RK9XRUGoibutPmtw5MWLlp8v1Q=
X-Gm-Message-State: AOJu0YzMfOYcT3O6OuBUhutRD1VL3Q9eLryKU/Q/+2aV1Qt6jYy1i+jS
	wuxWGO24O+Yi6aC6ZvRU+AD/JTusY7K3nWRJw4ExLG6Wf7BP2C1K8EHEc8JNeZ0=
X-Google-Smtp-Source: AGHT+IF7MinfYvXVoTXJi5SETWWXqYH/k8D5k7VHPbg+6myxhpRpGj2sS5YLKdpHsMBPQimcfJStLA==
X-Received: by 2002:a2e:bc88:0:b0:2ee:4c72:204e with SMTP id 38308e7fff4ca-2ee4c7223e0mr13713361fa.0.1719499487248;
        Thu, 27 Jun 2024 07:44:47 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564b7b7c1sm31254075e9.23.2024.06.27.07.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:44:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 15:44:39 +0100
Subject: [PATCH v2 2/6] ASoC: codecs: wsa883x: parse port-mapping
 information
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v2-2-6cc1c5608cdd@linaro.org>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
In-Reply-To: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=F35vvznymN/8f2H0UImbT7wPJ9fTXmwdtHkeoQQ+rQs=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfXrYdYtEgJSwT/6tXfD237j0hmBqYC3Ai+LFf
 uvQizkgZgyJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn162AAKCRB6of1ZxzRV
 NyDtCACJtoKKlxy2htKGj3YtUwpRZwvO/uEyIApp3T8ZS37ZV/CqYNLXodSsxp/aZ3+YqxD/ZGH
 995VMVZ0aB5Z9TL63bvifep1aKuH9nyJuQaJFeRqG3vMyHe22T+ODBZlxOeHxl6fCs3eTv1XdsP
 kPGFKixVGZFfP33jxRmndIphWK4VCm8LijB1dp49PkK33wJ3UWQ/hjXVwEh2/FsiQr8hRXVPZZg
 3RftzNggXmHQ1vvnXibfpibFeubdq4GJYNILbUurD6dW8TjopF+NdbWGew15Kd0q44Z7CEXznn2
 hf7pVnjeNmV+DdPt1F1fjuyGXdAh4mCciyK86uBNCfklHoIp
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Add support to parse static master port map information from device tree.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index a2e86ef7d18f..5443a5c4100c 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1399,6 +1399,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	wsa883x->sconfig.direction = SDW_DATA_DIR_RX;
 	wsa883x->sconfig.type = SDW_STREAM_PDM;
 
+	/**
+	 * Port map index starts with 0, however the data port for this codec
+	 * are from index 1
+	 */
+	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
+					WSA883X_MAX_SWR_PORTS))
+		dev_dbg(dev, "Static Port mapping not specified\n");
+
 	pdev->prop.sink_ports = GENMASK(WSA883X_MAX_SWR_PORTS, 0);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;

-- 
2.25.1

