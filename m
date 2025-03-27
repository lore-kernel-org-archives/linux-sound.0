Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75D220E708
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070008; cv=none; b=gEhQjL7NfbL1EunyMX8yVON4nFitTuoTGMylWw986+IbgyaghNGUHePbZbbCZlaiPiDQRCN/nlUMn1I28LGQFVYB3bh2oNFlDmN577pF6O1sfseMZgziuboAnrlm7L0/6XtEEAujA9jF6E9ksXEQNFsrkOn+VM4kgYo6gMHZr5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070008; c=relaxed/simple;
	bh=hJEhHBHgmcwkLGn7ADU+TBJtnvqkH4aaspjSeICJrEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hkftyu8mFkFJbT201My2AXDNHO/LXB08HeTOv/g1gp0mn8L6J/wxQ3ebvUdmwP5Szn8szDbERF7Wsb9TiFiEq1wC5APebJy+4K2dlMG2peYdlFa8Gd226ZMr45D/SpfEeENtCoKJhKY+cDGh+A2PwiYD6f6I2HBrMChcAE1lBZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ceu7Q+36; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ceu7Q+36"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3912c09be7dso404307f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 03:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070005; x=1743674805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPKG26aBT6MGmMvi54w+dEW5MMoDzMUIu/y68UikHrA=;
        b=Ceu7Q+36KGy6V5utgRpQHgV9yxlDboAqbtPgoGDeffikMAs64n8xQgbzUnigbp+9pn
         KDQYZHAkpn7BS4eLaNlOPyiG+Jsif6Wt7564ujuKZDYM8SalpSGqKsUxJRAzTim9z6w0
         +b4uYMxt8qjwalm3ZDsojEOndxbMIxmiprbPxnRTAzn21KASsM1zIo5IGxnO3oa0OmMw
         Shz3YS0SK9H81MetouV+VLoFMwfTnMu4oUUDt+psSM8Z60y2L+MIcl+kJ9mPUM7VgM+F
         16Ez7IlqT2YOQw4/Kp1gIIZGgfTbF7R4gDlufgvLFHQ4z1MiGp+IGnNjf6V+Eo+Ej8Uf
         7Lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070005; x=1743674805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPKG26aBT6MGmMvi54w+dEW5MMoDzMUIu/y68UikHrA=;
        b=pj9WpSBN9tU2OVSSEKE9naXZ+cTc47wpWCJbjf/hkXd4JFz+Suc6fLylf3vvAiv43m
         Hr1wSDBpJ3MPcMlIRNgnMbygI0Q7DyvyU3wltTXY3BbWfTX/JTnwPzej/QrNEQnwxYKM
         T6ZBs6icNOQPi06Ql9QnIWVg9sBzmgnWPolktTEoaLN9vELwtfSJn0gKhzrbdjqLcn29
         AZd8hVDYU+14bLVtnVEh3slwQU07CafU+5Bekg2mtKUoZNXlYoIjSHTSXfaMuVcYCPuG
         ZQD849ZITONLLfAVE6OmgvuteuWKpwoS5oFytuW6u+0Jd1yirVsytukiU7HBXhaYSzQv
         aHJg==
X-Forwarded-Encrypted: i=1; AJvYcCWFAmXQTLZoDqCnP/uZ9ypIn1rfQhZUJDM/ko05IGpuiYb3ZXSJdHMz09RYYLo84AVHniTcc5AgSvB9bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2wG30Muj8UsK1JKArTNsKuTgTNwYsX65gBnwepXyKDIZG3Ixd
	yONLxQM3vufqNTWEE0PJTYdZhxgpxIgPT+6w3qyGsreXQkviTr72GVjkMoUtPbo=
X-Gm-Gg: ASbGncv9AlrSXlhQO+vKwRADMuDlPXb1km40qdDRGOeifAMW9pRXCGzYA/bmAzg/jfc
	lxJJQYYCWpwSjm2Jr47jN1DTSINbwKYAeQpFzlz5qLCbujDO9lRd1SNQKcDNoGiMcvEN6Wl/uty
	7CTNxU407LBSqlZZadRYKiPn42HB1nayd7x83vz8g1NMCpttJgmv5pVpRItwFqlez2ZZFfszhbi
	G6NvKnsH/HHhIx29ipm6UdIZE6PSAkQZcI7Enmsuy2eFzxHhn/gaty11b2/D1Q627uR+yy6ne6a
	VvEG7ikbWvFU2sIxYccpswuW+qEVIRlvEBJUvj60PXHx3CdxhdDSZd05cJRgj9twlpnymg==
X-Google-Smtp-Source: AGHT+IHKTr77rgy7z6tUorkVmyaYsLpGj6E/y8viXassXOAOlt53NZQ+U4mnCJz68CeYjAZ0eVwnWQ==
X-Received: by 2002:a5d:6daa:0:b0:391:42f2:5c7b with SMTP id ffacd0b85a97d-39ad17466a4mr3085783f8f.16.1743070005118;
        Thu, 27 Mar 2025 03:06:45 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac3ce3dd1sm10843204f8f.88.2025.03.27.03.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:06:44 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v6 3/6] ASoC: codecs: wcd-mbhc: cleanup swap_gnd_mic api
Date: Thu, 27 Mar 2025 10:06:30 +0000
Message-Id: <20250327100633.11530-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Remove confusing and unused argument in swap_gnd_mic api, the second
argument active is not really used, and always set to true in the mbhc
drivers.

The callback itself is used to toggle the gnd_mic lines when a cross
connection is detected by mbhc circuits, so there is no need of this
argument.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 2 +-
 sound/soc/codecs/wcd-mbhc-v2.h | 2 +-
 sound/soc/codecs/wcd937x.c     | 2 +-
 sound/soc/codecs/wcd938x.c     | 2 +-
 sound/soc/codecs/wcd939x.c     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index d589a212b768..4b7c3d6080a1 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1260,7 +1260,7 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 			if (pt_gnd_mic_swap_cnt == mbhc->swap_thr) {
 				/* US_EU gpio present, flip switch */
 				if (mbhc->cfg->swap_gnd_mic) {
-					if (mbhc->cfg->swap_gnd_mic(component, true))
+					if (mbhc->cfg->swap_gnd_mic(component))
 						continue;
 				}
 			}
diff --git a/sound/soc/codecs/wcd-mbhc-v2.h b/sound/soc/codecs/wcd-mbhc-v2.h
index b977e8f87d7c..a5d52b9643f5 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.h
+++ b/sound/soc/codecs/wcd-mbhc-v2.h
@@ -194,7 +194,7 @@ struct wcd_mbhc_config {
 	int num_btn;
 	bool mono_stero_detection;
 	bool typec_analog_mux;
-	bool (*swap_gnd_mic)(struct snd_soc_component *component, bool active);
+	bool (*swap_gnd_mic)(struct snd_soc_component *component);
 	bool hs_ext_micbias;
 	bool gnd_det_en;
 	uint32_t linein_th;
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index c9d5e67bf66e..b2fb8520c823 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2646,7 +2646,7 @@ static void wcd937x_dt_parse_micbias_info(struct device *dev, struct wcd937x_pri
 		dev_warn(dev, "Micbias3 DT property not found\n");
 }
 
-static bool wcd937x_swap_gnd_mic(struct snd_soc_component *component, bool active)
+static bool wcd937x_swap_gnd_mic(struct snd_soc_component *component)
 {
 	int value;
 	struct wcd937x_priv *wcd937x;
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index f2a4f3262bdb..dfaa3de31164 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3235,7 +3235,7 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
 		dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
 }
 
-static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component, bool active)
+static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
 {
 	int value;
 
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 4a417a92514d..546aa88a398c 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3215,7 +3215,7 @@ static void wcd939x_dt_parse_micbias_info(struct device *dev, struct wcd939x_pri
 }
 
 #if IS_ENABLED(CONFIG_TYPEC)
-static bool wcd939x_swap_gnd_mic(struct snd_soc_component *component, bool active)
+static bool wcd939x_swap_gnd_mic(struct snd_soc_component *component)
 {
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 
-- 
2.39.5

