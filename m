Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACB2256C60
	for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902870; cv=none; b=f2erzDIRNpmdwM3zLt4JmGJ+1RKmwhsPIF0ZMlzNacjT5YA9OBD1mR658CYoN3KQZZRaUlxL39wmoftciZosGEGPaRa7/hCxngYU3rtuhTYFC/0uoxlgDepCMTGnWdYpjVjWN4MIBk/Evy6WTpN/2ip7o/bDlwEzJBafKNEUEUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902870; c=relaxed/simple;
	bh=hJEhHBHgmcwkLGn7ADU+TBJtnvqkH4aaspjSeICJrEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lIueJANDq7SKSmku02QAZeDtA6OIHc+XDA2sf/ez95Uq3YnAxclsr8trB6cCP+ma4D6ji0QVEoa4u96+S5BXWTvcubye5g190pheYLdwY0yLkJe1AD2zqbCq5wa+PMNBUBtH+kX7BBmcRp4nHK4XctE1Ts1Z2u9Y6g65WYDCwyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=flRyaYqp; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="flRyaYqp"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913d129c1aso3915873f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 04:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742902867; x=1743507667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPKG26aBT6MGmMvi54w+dEW5MMoDzMUIu/y68UikHrA=;
        b=flRyaYqpIoHDWb/GhPNgMRLoc0AvD/ObTBvINIpHY09sagiCxJdWtkqYkMyUp8P5Xp
         ktvCxaAPQJzafUDmnsGdzElQoMZNtaHrR6v9KM1tw8K5PZlKlmwD0FdN1hqjltA1Usit
         NVP1p+Kl5wB3u+9Q/Kwh24rMloQIMbnOmv0RqeadXLU35wqL5uR6HwbFTFf9relFvVHB
         6QZ1PsreiTD4hbOxyluudh+p8l0Rs1vpDDqOlHtIVIVBw0Qz/Tz94oBYM3+08d62fYCP
         vVLSJMnqks3lI5/RYa8Rb+7BZO88TGFpVp/TNDN0Q2ut74bWeCst17MMQppyUVl6zZAl
         67vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902867; x=1743507667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPKG26aBT6MGmMvi54w+dEW5MMoDzMUIu/y68UikHrA=;
        b=Wubez9b+oLrOmQv6qAQnFOnBvT6fiq8umTdD1pp0faMUeSnxmHmH71Ylg7KN1STFOQ
         FMOuSE1u4i1R/Y8K/NvMicrSM/htS783aq53YxxYqq2eqP9QkqczYbFyfBGS57uTmIBe
         L4ZCB/fLNKz8Da7CP64HEsYwc8MmQVB3GW6pOURyOjIBzP4Q9e2qidNDk5gznVysZfoJ
         UqZwBQaGWta3EfJ3aIqtxUP8J/l0Um0bipVlE1zYwTP8TbqUWDt+C/Fb0zwZKxX58TRJ
         OYJ+s81ZspsKdamKPKPIhBiZRidiJAoBM+HFeKqU86rK+xEkCt1oNVs+PiZUJN0F+Wca
         cTcw==
X-Forwarded-Encrypted: i=1; AJvYcCU3kIke69n3hm+DitDsqwyQfd94GDOfAxEbWxQwE6A6GUlsSvaBzl5pBoYXKTCI8ub48Lu3bhvDWjFdNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMi1u/Ss1B4+jAmJm/DyFjm47eyW9IlMeUY4z+Lz2OxD1oahyB
	W61RtzV3GipT0LjJPw5N9UuD228kmcIgKKD3G+I2GDcqR4Sm+gfZ+W8iZGARNTg=
X-Gm-Gg: ASbGncsgxjJN0njNPcpb2Ns1PlBLux64ZzpH9wFycGFtOis8dyMA//dC8L6NGFqdkjP
	ypCLdeRTNNdLFpJF5AztOgj4gpRh+GzLgt1p1KVeALiP+D1SdDftp9HeaA1dP1hkBRfiwO3lJAz
	AG98D6NTtI2AudbzmNIUqNjd3/dyo8g44O+bnHSU172Fj56R/wI4F7UYS+7d9Y78FFktrYzVEi/
	oVJtjctj95MeUUYHjz8UgHrZRWy/Gi4Bsmay2NNNJvcb41DwqjUvyM+YPufmofiv8EPGCz+WST2
	SYbGP3f67jmJgb9wPSfMZxFa25UECWYFr4lTnuhhu17RwoblHNfDZhCeOvq0eCmSi//KeQ==
X-Google-Smtp-Source: AGHT+IFqEVrx5mCJtplG7+w7CWWWndtmmBeTngl+nxKo8qHTXdRc7GMle1DFI7FxDeYhfsG7z+7Agw==
X-Received: by 2002:adf:9dce:0:b0:39a:c9ae:9eea with SMTP id ffacd0b85a97d-39ac9aea552mr1090347f8f.10.1742902867202;
        Tue, 25 Mar 2025 04:41:07 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13213330f8f.29.2025.03.25.04.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:41:06 -0700 (PDT)
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
Subject: [PATCH v5 3/6] ASoC: codecs: wcd-mbhc: cleanup swap_gnd_mic api
Date: Tue, 25 Mar 2025 11:40:55 +0000
Message-Id: <20250325114058.12083-4-srinivas.kandagatla@linaro.org>
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

