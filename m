Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E73141238
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 11:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708515045; cv=none; b=n8sSZXZG4xImZgToooH1NqxSAt25fUqV90q+EkCq9SHV2jPWzX0Ikw6+QF5Ci7kPnH274RYl7ECIpcBu94Jel+ia9lEP3oLxy19Sqq13ruor03SBxKT855M5KM6vy96099KSd0uhTLx/wrgwlbMXA7I+JufghoMTr8MhWSwbeVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708515045; c=relaxed/simple;
	bh=UvCheUVIoFjk4cSiZxMiMgUAjFsOzD0QEdp/BP6hA54=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ctdVR6igxbnConsoNsRQb7h3YejIqg2/JJITYHH7aTgX0jNnfqVlKYs+hrbSM3NdIQbrgMiUnIYT2vF2J98OnsuYt4qceRWNOQX4JKmcGhhUK03N6dqyWloXnbSYkzOorXwAcSBDKsbtdq82xYvPbZW9NWqSLIRO9EOHh6FiMwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NgFExfEB; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NgFExfEB"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3ed9cae56fso431326966b.1
        for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 03:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708515042; x=1709119842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMJuotCi10MIEivhgp+/HFVWVuz2YA+wsQ3N0tBEkCQ=;
        b=NgFExfEBtuPzOq8ifX7JMsESrD2wfANQfoyYYYAWm6BbP1NR1ERpkQrEcJF5rv/mdW
         L+ct51HifCgTodAllpbLQfI2wglCtnzVFEGHmKTKjuXPxIWRTN0rhG7nYJkgNTJoHQN3
         DXvt9jRzHN9fldGmzAKUiNRQ3V0xwRfwJhI+M6WpgaMoO4keRfBhjpQIRB9lhLeSSSvu
         NQhYWOGwAG/N+XocsMgxJ8F0MvTDwwYogMR7e1ZE1z5Lx0m6K06CGCEQy3jlrTLMLY1R
         f12M1mA78X9Sjaf9mu4Gn0wDSvswabxrSP3WoiaGcz+DJIGkXzdrY1vPw/wwxvSBF7rK
         V5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708515042; x=1709119842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMJuotCi10MIEivhgp+/HFVWVuz2YA+wsQ3N0tBEkCQ=;
        b=T2SfzPz5jzxxyvdFZKO73Sbk/kDKJqkHFAxz7ZVOOdtJZn9DvDFgsAVJVvzRecRw+g
         TvbZIjUpbr1BoG9912M2+HWBUnlrTwWN5T/cWXlcgVTSAE8hq0POQPFjvz/oXh94S20F
         IIfKFOHZES6uD1vpvWSm5Nkk1gXANPlPihO3fu2CXv7ulRUx6A2nbL43PZKqd2WR9jo4
         BbgBiW721aQ1M+ilUhszPCSmXArrUHcv5tEAni7b3bw2JcndzbDFoWwOKVBFOpWDJcoG
         sdFY/NkDy3L/tkxKaFlKyWuNvrPK6cp+92QWpqmRx+iTXKLcvgEAS+fLpIPc9/AUrNf/
         cTbg==
X-Forwarded-Encrypted: i=1; AJvYcCUFv74QFbfmi7zPuFwtCGj1y9KCbKRAdQfao3UyP3rjPOFDE9gOeo/5Ed9DWuLJI4/0PYPHmbPo9a23xNvfUwc26wswBdF+Vv2ACjA=
X-Gm-Message-State: AOJu0YzgxvfNBogECj8X/IyNWwFunm2Xj27O8KhKgp01GROE2oSbcyBQ
	tLQX9WRGRKbJ3O58pgdbiJATWPeaRgr6ONsYTNbodTtOnXeR5JyV1bPS452GoM4=
X-Google-Smtp-Source: AGHT+IGa30Y9sZCSRDuOG9iML0YaKidoEu1++hvS9trF/xcUXTGjRT1+VbSba/xh5BEu6evlsLJz4w==
X-Received: by 2002:a17:906:e085:b0:a3f:421:26a5 with SMTP id gh5-20020a170906e08500b00a3f042126a5mr4151010ejb.12.1708515041688;
        Wed, 21 Feb 2024 03:30:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id g1-20020a170906c18100b00a3e278c4a3fsm4393712ejz.53.2024.02.21.03.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 03:30:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [RESEND PATCH v6 v6 2/2] ASoC: codecs: wsa884x: Allow sharing reset GPIO
Date: Wed, 21 Feb 2024 12:30:36 +0100
Message-Id: <20240221113036.23905-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221113036.23905-1-krzysztof.kozlowski@linaro.org>
References: <20240221113036.23905-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some boards with multiple WSA8840/WSA8845 speakers, the reset
(shutdown) GPIO is shared between two speakers.  Use the reset
controller framework and its "reset-gpio" driver to handle this case.
This allows bring-up and proper handling of all WSA884x speakers on
X1E80100-CRD board.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 53 +++++++++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index f2653df84e4a..a9767ef0e39d 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -13,6 +13,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -699,6 +700,7 @@ struct wsa884x_priv {
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WSA884X_MAX_SWR_PORTS];
 	struct gpio_desc *sd_n;
+	struct reset_control *sd_reset;
 	bool port_prepared[WSA884X_MAX_SWR_PORTS];
 	bool port_enable[WSA884X_MAX_SWR_PORTS];
 	unsigned int variant;
@@ -1799,9 +1801,22 @@ static struct snd_soc_dai_driver wsa884x_dais[] = {
 	},
 };
 
-static void wsa884x_gpio_powerdown(void *data)
+static void wsa884x_reset_powerdown(void *data)
 {
-	gpiod_direction_output(data, 1);
+	struct wsa884x_priv *wsa884x = data;
+
+	if (wsa884x->sd_reset)
+		reset_control_assert(wsa884x->sd_reset);
+	else
+		gpiod_direction_output(wsa884x->sd_n, 1);
+}
+
+static void wsa884x_reset_deassert(struct wsa884x_priv *wsa884x)
+{
+	if (wsa884x->sd_reset)
+		reset_control_deassert(wsa884x->sd_reset);
+	else
+		gpiod_direction_output(wsa884x->sd_n, 0);
 }
 
 static void wsa884x_regulator_disable(void *data)
@@ -1809,6 +1824,27 @@ static void wsa884x_regulator_disable(void *data)
 	regulator_bulk_disable(WSA884X_SUPPLIES_NUM, data);
 }
 
+static int wsa884x_get_reset(struct device *dev, struct wsa884x_priv *wsa884x)
+{
+	wsa884x->sd_reset = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(wsa884x->sd_reset))
+		return dev_err_probe(dev, PTR_ERR(wsa884x->sd_reset),
+				     "Failed to get reset\n");
+	else if (wsa884x->sd_reset)
+		return 0;
+	/*
+	 * else: NULL, so use the backwards compatible way for powerdown-gpios,
+	 * which does not handle sharing GPIO properly.
+	 */
+	wsa884x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(wsa884x->sd_n))
+		return dev_err_probe(dev, PTR_ERR(wsa884x->sd_n),
+				     "Shutdown Control GPIO not found\n");
+
+	return 0;
+}
+
 static int wsa884x_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
@@ -1838,11 +1874,9 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return ret;
 
-	wsa884x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_OUT_HIGH);
-	if (IS_ERR(wsa884x->sd_n))
-		return dev_err_probe(dev, PTR_ERR(wsa884x->sd_n),
-				     "Shutdown Control GPIO not found\n");
+	ret = wsa884x_get_reset(dev, wsa884x);
+	if (ret)
+		return ret;
 
 	dev_set_drvdata(dev, wsa884x);
 	wsa884x->slave = pdev;
@@ -1858,9 +1892,8 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 
-	/* Bring out of reset */
-	gpiod_direction_output(wsa884x->sd_n, 0);
-	ret = devm_add_action_or_reset(dev, wsa884x_gpio_powerdown, wsa884x->sd_n);
+	wsa884x_reset_deassert(wsa884x);
+	ret = devm_add_action_or_reset(dev, wsa884x_reset_powerdown, wsa884x);
 	if (ret)
 		return ret;
 
-- 
2.34.1

