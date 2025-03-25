Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD5A2571C9
	for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 11:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902874; cv=none; b=tnu2Wr+UNcDLLzKXR1pEiy55eUdKQpWjZnF4gJ3OiOhYiyPJwcUFYll115DLig65A2a1nEdPP/A1ZA3JtEaPnhr398QAyUw0gF+l5mlDhsPQcwqUHe0Tu5pEENs0zHVWl404aNO/2D2b8pCjBOFj+5mDTUit0y6ewcGviTNjHD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902874; c=relaxed/simple;
	bh=A0WtHTs89u0NRiqeb7jtxP3PC6SiQD+qIJMNWTfSuvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ONuMTz0PT2KnPMqFWisd/eF/Z51Bztlun/Bd6XMFUCdRT++11NSGJ1BV3OFOc/x1wixlWLkDgJSOY+wtUpLNsYyIxyd7nAFo45X1Jg2jO2cQqKUZfvdTqc0OGsYAy0CLhaeYAauQpd8HWx6P7Cq7byyI+2//Ge+3M0M+UAxyC5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wiJ7JQ22; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wiJ7JQ22"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2937016f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 04:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742902870; x=1743507670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciCsmE+euFjZCUyipJS5apSViu1JxNfFN5bCQJg2zCQ=;
        b=wiJ7JQ22WojqGzrhJ8Pl+cTT8qIbgdtpPw1H5fgulafVZdOcoggMP508EQlSHIugSy
         u4FUL4udk5AUOI9r/sLg3gYySlqPBblpBL+7njJyH8DEdSzvpNtSsea3sqeOdIVQ4P9K
         Ry45Iv8R19LXzFe/A5PJYShS4xvTibjZt/Scr/svzlzqC3NRnvoMG27Pjzw5slBNTkBH
         tgRABLHmbq4zdLOVLuqlsim8cGrJ9kIKyLC4kl5W7hZgTRAjktbsLqMlEZcqBoS3OJDl
         ErZhxOiLn9DNv6fzw8/cgQJDlS4IVZLqKQ53AJ7oKZIG77CE8APAD6bYJDsvbtdSzuId
         R4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902870; x=1743507670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciCsmE+euFjZCUyipJS5apSViu1JxNfFN5bCQJg2zCQ=;
        b=IRk6jSU/Ilg+qaRirlzSzGASh6Q7IrQbchQURHPTqXirM4UD9WMu0hMhO6qNj+mxjU
         Az/+nVPRhpwOu+twYL1DcNlTj8gQh6m5vy1zs/dskpHtYuZFj9m47vptAFuwzOXczMRI
         DhWcIddO8TKH/O98OVtpWbBODQiMnp4VPj6aMjm0yxbVEsOH51PJ5smaKMZeDxQfsyN+
         kgzaKyAO4vMqko7LD5b/ZnxK9eFqHzxwwjG8Ld94tK4x7n9hi2cy4nclztBobsvdt/RH
         /ZdfLYP2+RTWRstJfeuBnJnjlY7gGzgFANfy3F6H+akQ80A1+vN52TAPy7ynFJ5+AArS
         0hgw==
X-Forwarded-Encrypted: i=1; AJvYcCUhSXSAJ0ow66HWwH5MxBCpok2aVARSWqTLK8ezj3FVUkgbK+g9lgpV+dPwn4bBojY4fdcgMsJixeFnzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE8d6j8sB5SqmGv7n+7FAeg6WUc/K4O2zvKom6HiZpq1Al22Ce
	dCgQc57SZlIvEqAZm1/DhVXkkQWWclyAFMySlGO2kHuGoja6eSfY+6FRCtO+/sE=
X-Gm-Gg: ASbGncsZBLjTobhkPFynqtORMCYNYjW4iQAuwdXHM7Cvh+Y14michUnLuzMveKoFArf
	HB0QY8YuD68uStHAsQbdbp9M4OSM8gRPH0vsmzBuoG1jxmzTGF57l8SZ2125G96u0C9aKhLJjCK
	ti3qlbUBC/Y/EJY2GxDVxbAtlSI4UZDR/QcyyAEun9mT5ksL5VuG++OeIweLpRJ0pQdk7DOiMfb
	YDM4P8SLOsj6VEPZluy+7TCywFCyRn4MuFr5VgLEerE2ErvbzMHwfoc5P3lZb9plEHZKpOof5DC
	XM/xJyhUFPwVDmc90FAfJOWxVJfZdV/BLEwrr37tkKHWyUrFQ9Yf6iV5AIloEXTPk4CfyQ==
X-Google-Smtp-Source: AGHT+IF0JTdKEiQNMaj66CfUpe4bYsSfOE4aj8Z5HReCu3uR/s99pqqLX+H/2CSyYdeTC/sC6+XkdA==
X-Received: by 2002:a5d:5f96:0:b0:391:2fe3:24ec with SMTP id ffacd0b85a97d-3997f91072amr14239891f8f.14.1742902870048;
        Tue, 25 Mar 2025 04:41:10 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13213330f8f.29.2025.03.25.04.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:41:09 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v5 5/6] ASoC: codecs: wcd938x: add mux control support for hp audio mux
Date: Tue, 25 Mar 2025 11:40:57 +0000
Message-Id: <20250325114058.12083-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
References: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi mux is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable.

move to using mux control to enable both regulator and handle gpios,
deprecate the usage of gpio.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 sound/soc/codecs/Kconfig   |  1 +
 sound/soc/codecs/wcd938x.c | 50 +++++++++++++++++++++++++++++---------
 2 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ee35f3aa5521..a2829d76e108 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2226,6 +2226,7 @@ config SND_SOC_WCD938X
 	tristate
 	depends on SOUNDWIRE || !SOUNDWIRE
 	select SND_SOC_WCD_CLASSH
+	select MULTIPLEXER
 
 config SND_SOC_WCD938X_SDW
 	tristate "WCD9380/WCD9385 Codec - SDW"
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index dfaa3de31164..209d0b64c8be 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -19,6 +19,7 @@
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
+#include <linux/mux/consumer.h>
 #include <linux/regulator/consumer.h>
 
 #include "wcd-clsh-v2.h"
@@ -178,6 +179,8 @@ struct wcd938x_priv {
 	int variant;
 	int reset_gpio;
 	struct gpio_desc *us_euro_gpio;
+	struct mux_control *us_euro_mux;
+	unsigned int mux_state;
 	u32 micb1_mv;
 	u32 micb2_mv;
 	u32 micb3_mv;
@@ -3237,15 +3240,22 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
 
 static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
 {
-	int value;
-
-	struct wcd938x_priv *wcd938x;
-
-	wcd938x = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	struct device *dev = component->dev;
+	int ret;
 
-	value = gpiod_get_value(wcd938x->us_euro_gpio);
+	if (wcd938x->us_euro_mux) {
+		mux_control_deselect(wcd938x->us_euro_mux);
+		ret = mux_control_try_select(wcd938x->us_euro_mux, !wcd938x->mux_state);
+		if (ret) {
+			dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
+			return false;
+		}
+	} else {
+		gpiod_set_value(wcd938x->us_euro_gpio, !wcd938x->mux_state);
+	}
 
-	gpiod_set_value(wcd938x->us_euro_gpio, !value);
+	wcd938x->mux_state = !wcd938x->mux_state;
 
 	return true;
 }
@@ -3261,11 +3271,24 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 		return dev_err_probe(dev, wcd938x->reset_gpio,
 				     "Failed to get reset gpio\n");
 
-	wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
-						GPIOD_OUT_LOW);
-	if (IS_ERR(wcd938x->us_euro_gpio))
-		return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
-				     "us-euro swap Control GPIO not found\n");
+	wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
+	if (IS_ERR(wcd938x->us_euro_mux)) {
+		if (PTR_ERR(wcd938x->us_euro_mux) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		/* mux is optional and now fallback to using gpio */
+		wcd938x->us_euro_mux = NULL;
+		wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
+		if (IS_ERR(wcd938x->us_euro_gpio))
+			return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
+					     "us-euro swap Control GPIO not found\n");
+	} else {
+		ret = mux_control_try_select(wcd938x->us_euro_mux, wcd938x->mux_state);
+		if (ret) {
+			dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
+			return ret;
+		}
+	}
 
 	cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
 
@@ -3581,6 +3604,9 @@ static void wcd938x_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(dev);
 	pm_runtime_dont_use_autosuspend(dev);
 
+	if (wcd938x->us_euro_mux)
+		mux_control_deselect(wcd938x->us_euro_mux);
+
 	regulator_bulk_disable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
 	regulator_bulk_free(WCD938X_MAX_SUPPLY, wcd938x->supplies);
 }
-- 
2.39.5

