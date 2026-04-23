Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBBE379EE6
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776939249; cv=none; b=pcmJyvv2IbTCRnJ4FPmTsRSmPdhI8rmLI5iXtyaxBuzeEOiEpe3E/5VrJekcvMmo/wARyW2qVO/9hqkLiHb35c3rcIFoLNi39G2FWcSyttjRrxkWn69jqCTILEd8qvQbBG9fYjNjN/hN14ZQDmnUShzL3IAPcnAoZGU0sJEXawA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776939249; c=relaxed/simple;
	bh=9Gi2UeJiHgL8A1nFLQOErKqePeAwxk/3845DEoBewrA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=I5epA7z8ZUPCgWqli27cypw+DUbKCViWgmYeg+GF6RsYsagBSxs1qqghRsnYNi0JwA6tRASetpmClZwvEi1JqPIiXxuBCbs8QAyqGq+zFm4YzHaT9hD8r+cO6wSzrVhoiViffEVxO0ENipVMCfkSlKeRRI20OuslRj7L5Yw6ml8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=l69/rEP7; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="l69/rEP7"
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 291FB3FEB4
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 10:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1776939243;
	bh=ibjJki248JoN3yaZbt15RJg6fscWNGTYVJ5M96Tgzeg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=l69/rEP7ph6JMrlUmm5zo6KHIWFr/Dep7aVV2YG374Lhm1UTdhHqKp5mZ49FxBQSj
	 PnjNCo+cBVv2B7Gp8MZWeTVTVyy00Bdqq9lO1vH3kUBm+kfs1LnqqQ+8eBwYDVO8S/
	 qGI0do7q+QZfFjlxwGVXM86Cih74+7CvXmHtFeFVXIvBEQK31B/kYYoAl13iCQRo1U
	 lGKbEQUoqjaALX8oBty/N50aUe+hsVo3UdQWy0PgODfu9ejWU+RTP/MuFCbzH0q6Ps
	 hGRURS8RaX/vv73F1Qh08BbzZIAJI3A05I74QYxte2mqoYiYEKqfnLfDGwFtLFaYsJ
	 BFmxluaNl/QcOb5hNvS7OUs96fNid98blCJfoCXa3Dd730kzUjE0i6iufqOmxak+OX
	 1ImPh/b8yYrF8oGqp45pTGk0zJL0G5U8mQIa2IlkRl3v0FkWK/KVelfOlkGw+K12yP
	 5NXr06JjOYMFVZz7gkYGfpirzR6/CvX2UyWFooKFqUQwzT4unThKda4Wtfa+G8v7cQ
	 yDbNIOSQcJQ1lhMx7+12CZBnJJ5aaT4bC4ffd/BvPpr9R/PmJI6fqdWcyKVLCN7hl5
	 4GR1PSU4KtE/oL8EyZJlQu62jbB4cB7b9WPgrVJVIO5+trEe9X3qKe7IHa5Br4YuWn
	 L672G4WIlEjOB4k/o+3nov7c=
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24308165dso74913735ad.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 03:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776939242; x=1777544042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibjJki248JoN3yaZbt15RJg6fscWNGTYVJ5M96Tgzeg=;
        b=RJpElYXSO7jMLX4PqrgCQg1D7cI8i56Mlpb4v5M4ISOZZduhTpSV6tRhXRKAK7PFrV
         i4KUFkakpnQ35G1WKN1dzsgWFHOnkuA6ls5jqLWKSTn32nZdstzcgSLNDbINEpbO4XD3
         4XGEmGslbXYlJNG9qcymcjfZPmnTwacd3gJkPToUK3xq0VnfNlvYEvW+kt8tksx87N/X
         T1U8nzaTv5U0x+hZ8Ex6UF0blsUZg63g236TOr3sNCFG/hJUn07egl7qdHuz5t0MehjN
         asgYN7Uxn+4YmURK640z4KAgnRhiGKXqFi647KQpVPJD0yUGRMa8UUltcO3VH7Iby/PU
         MVYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oKiFW1pOdsU69JJQquhwMI2ZAyCVjGUbxPsr4Z9cSWlcpjNpB49NeRJAcs69pjZQYEli3jSk3PUBZgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhqt/3/+FFvE4M8x+msdws2Frrkt7LU98dzxjD6Zr2s1wAYBPA
	Go8DIH6KTugMUex3ilyKu2B7dSoh23g5/OY6uT47yfeQiTLmE9cdQinrQWK1yyJyRAt9Z/m4AXC
	nmQrve4bCrfONvF/8X0ejRMjM6VGBXnom2VWh6PQvUkpw6di2guPzlvvURzF6mqcTwEix1y37fN
	AOIPLf
X-Gm-Gg: AeBDietrd2nRbPAv3Z7K8B8RbG6hIF6uZBu+/sK4KYoaChy7nI/l+fctfz3qBaAAPtO
	y5+jPdGTLW1MRzVlU2QN4AUxmfS9uxqnZdKLhDoQkNbt24vgBH5OOU/H3JpyZvlZReMcTuhGAIT
	JU2+MZxakV2ACfv6AT3yTb+zPL9BhX/vgDfsQfU0vv+CTP4fCKMBoX+MJhfEdrKNAvs8Gh1MlY3
	/wVK5wHLNIhAk/maqZpH4+lllLRfg+xFDrxEejWP++XpKamIgRd7ZYq2o4kt+pW76XsRTRBcsJd
	LC4O9Qr5MewPoNNx3d1EfLryk+7NebrrR46B3MZt3Ivuir/4fmVmvC6kyFsOHAwqmZOQMgOcLrg
	AA6MpZ+pingwKPW63/FilhsGT/jLgh+icKZCTxU1tqmfXfTpZ
X-Received: by 2002:a17:903:2986:b0:2b2:4c58:5ba7 with SMTP id d9443c01a7336-2b5f9f43679mr284364765ad.30.1776939241763;
        Thu, 23 Apr 2026 03:14:01 -0700 (PDT)
X-Received: by 2002:a17:903:2986:b0:2b2:4c58:5ba7 with SMTP id d9443c01a7336-2b5f9f43679mr284364515ad.30.1776939241379;
        Thu, 23 Apr 2026 03:14:01 -0700 (PDT)
Received: from localhost.localdomain ([103.155.100.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab405f3sm187974685ad.78.2026.04.23.03.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:14:00 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: oder_chiou@realtek.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rt722-sdca: add FU06 Playback Switch for speaker mute control
Date: Thu, 23 Apr 2026 18:13:38 +0800
Message-ID: <20260423101338.1040131-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rt722-sdca codec driver exposes FU06 Playback Volume but no
corresponding mute switch. Without a user-facing ALSA switch, UCM
cannot attach the speaker mute LED via snd_ctl_led, and PipeWire
cannot drive hardware mute.

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 sound/soc/codecs/rt722-sdca.c | 77 ++++++++++++++++++++++++++++-------
 sound/soc/codecs/rt722-sdca.h |  4 ++
 2 files changed, 67 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 79b8b7e70a334..23d2f63d68ef3 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -517,6 +517,61 @@ static int rt722_sdca_fu1e_capture_put(struct snd_kcontrol *kcontrol,
 	return changed;
 }
 
+static int rt722_sdca_set_fu06_playback_ctl(struct rt722_sdca_priv *rt722)
+{
+	int err;
+	unsigned int ch_l, ch_r;
+
+	ch_l = (rt722->fu06_dapm_mute || rt722->fu06_mixer_l_mute) ? 0x01 : 0x00;
+	ch_r = (rt722->fu06_dapm_mute || rt722->fu06_mixer_r_mute) ? 0x01 : 0x00;
+
+	err = regmap_write(rt722->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU06,
+			RT722_SDCA_CTL_FU_MUTE, CH_L), ch_l);
+	if (err < 0)
+		return err;
+
+	err = regmap_write(rt722->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU06,
+			RT722_SDCA_CTL_FU_MUTE, CH_R), ch_r);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static int rt722_sdca_fu06_playback_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = !rt722->fu06_mixer_l_mute;
+	ucontrol->value.integer.value[1] = !rt722->fu06_mixer_r_mute;
+	return 0;
+}
+
+static int rt722_sdca_fu06_playback_put(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
+	int err, changed = 0;
+
+	if (rt722->fu06_mixer_l_mute != !ucontrol->value.integer.value[0] ||
+		rt722->fu06_mixer_r_mute != !ucontrol->value.integer.value[1])
+		changed = 1;
+
+	rt722->fu06_mixer_l_mute = !ucontrol->value.integer.value[0];
+	rt722->fu06_mixer_r_mute = !ucontrol->value.integer.value[1];
+
+	err = rt722_sdca_set_fu06_playback_ctl(rt722);
+	if (err < 0)
+		return err;
+
+	return changed;
+}
+
 static int rt722_sdca_set_fu0f_capture_ctl(struct rt722_sdca_priv *rt722)
 {
 	int err;
@@ -718,6 +773,8 @@ static const struct snd_kcontrol_new rt722_sdca_controls[] = {
 			RT722_SDCA_CTL_FU_CH_GAIN, CH_R), 8, 3, 0,
 		rt722_sdca_set_gain_get, rt722_sdca_set_gain_put, boost_vol_tlv),
 	/* AMP playback settings */
+	SOC_DOUBLE_EXT("FU06 Playback Switch", SND_SOC_NOPM, 0, 1, 1, 0,
+		rt722_sdca_fu06_playback_get, rt722_sdca_fu06_playback_put),
 	SOC_DOUBLE_R_EXT_TLV("FU06 Playback Volume",
 		SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU06,
 			RT722_SDCA_CTL_FU_VOLUME, CH_L),
@@ -807,27 +864,17 @@ static int rt722_sdca_fu21_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
 	struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
-	unsigned char unmute = 0x0, mute = 0x1;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		regmap_write(rt722->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU06,
-				RT722_SDCA_CTL_FU_MUTE, CH_L), unmute);
-		regmap_write(rt722->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU06,
-				RT722_SDCA_CTL_FU_MUTE, CH_R), unmute);
+		rt722->fu06_dapm_mute = false;
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		regmap_write(rt722->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU06,
-				RT722_SDCA_CTL_FU_MUTE, CH_L), mute);
-		regmap_write(rt722->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU06,
-				RT722_SDCA_CTL_FU_MUTE, CH_R), mute);
+		rt722->fu06_dapm_mute = true;
 		break;
 	}
-	return 0;
+
+	return rt722_sdca_set_fu06_playback_ctl(rt722);
 }
 
 static int rt722_sdca_fu113_event(struct snd_soc_dapm_widget *w,
@@ -1324,6 +1371,8 @@ int rt722_sdca_init(struct device *dev, struct regmap *regmap, struct sdw_slave
 	rt722->first_hw_init = false;
 	rt722->fu1e_dapm_mute = true;
 	rt722->fu0f_dapm_mute = true;
+	rt722->fu06_dapm_mute = true;
+	rt722->fu06_mixer_l_mute = rt722->fu06_mixer_r_mute = false;
 	rt722->fu0f_mixer_l_mute = rt722->fu0f_mixer_r_mute = true;
 	rt722->fu1e_mixer_mute[0] = rt722->fu1e_mixer_mute[1] =
 		rt722->fu1e_mixer_mute[2] = rt722->fu1e_mixer_mute[3] = true;
diff --git a/sound/soc/codecs/rt722-sdca.h b/sound/soc/codecs/rt722-sdca.h
index 823abee9ab76c..fc50beff94245 100644
--- a/sound/soc/codecs/rt722-sdca.h
+++ b/sound/soc/codecs/rt722-sdca.h
@@ -36,6 +36,10 @@ struct  rt722_sdca_priv {
 	bool fu0f_dapm_mute;
 	bool fu0f_mixer_l_mute;
 	bool fu0f_mixer_r_mute;
+	/* For AMP */
+	bool fu06_dapm_mute;
+	bool fu06_mixer_l_mute;
+	bool fu06_mixer_r_mute;
 	/* For DMIC */
 	bool fu1e_dapm_mute;
 	bool fu1e_mixer_mute[4];
-- 
2.43.0

