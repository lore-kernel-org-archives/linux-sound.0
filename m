Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA791347DD
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 05:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764135700; cv=none; b=mWOfZAKaRxM7egliMHFOPFL6m164WHyH4x0+V1h2Ahpwohu75yTDohndgN7HEYjSCKaY6oSM2QUWejHK7vdK+A/c4dMiUmN134DOe3IuqxIkhLJkNJ4dHJs7aShh4s6L+1dIknyt1ybadRpQ8+26h2Ad0vIypRRhVzKobai0Occ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764135700; c=relaxed/simple;
	bh=kN8wNtyrFPMNkBMnseS+/dcIHc+YV5MfHN3kVM6Rs2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iAAdAJv6/khCwKQOSTYuz6n5T+R3EH73gOEKnJXLG6AZvBKtqD3E8rr8oOtVteMruR3hJs0PzzhB/GlsF6u8lfzSMhTOHBmN2hFk4NoL5DdzaKtjlpN5b7j/P1gLSlzS4+vekh1biPu8Bqxw1PcxKy5hAhIl2yBNFKSnO96U28I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMl8ZHZw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMl8ZHZw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso3774830f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 21:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764135697; x=1764740497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QW5cVIdovQWDv+bqBSbnBeQJjt2jpyUHW2uxiLg7ptY=;
        b=hMl8ZHZwS4caHB0Ci3qjK+NWP7BXgUlsP6OVAOyeGYnZokr6WnE1yppHgz2nlDwgOx
         Sp70VgzXXs6U0d8weRaO/BoyZ9TNBnwQ1RkBR4cZMbSkk+8BGB2nXCHKBdPL4qfZ3Qm5
         E4jLBp5amIOR8v82YPXN4iRvOvEtRFL7AJehRVvqQifbPQnHpupzshtXch32JeErp00d
         6xsShR2yp5CtfEF2uPCs9Lror+SLxjtelr36I7pPAxqKY5jao0vVoSiNGgk0XmLe5K9W
         wB4tF3lqHX3CDvBF4XZ3XRjG/fx+Ueun3awCFWxafqSHEQ1l57kf7bXsWt2zdOjKAAw5
         trpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764135697; x=1764740497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QW5cVIdovQWDv+bqBSbnBeQJjt2jpyUHW2uxiLg7ptY=;
        b=iGvPsdnRGnOPz3RE37QLeLCLoMJsxA79WGGlv7AewSCtQzvjxsY5kP/tnX4WfWx2yt
         2U4+ZyNQstBucy403Fr8Xc/IuDbMkwOtsQHcZYe9ZoUdi/8CSNDYlTDsA6tadbz+HQYj
         eaipfSOEDBogWjLxPMUX/o8W8V6TpOYs64cqSGd5MdbcwHyser+eb9mkIno0WCsDRMM2
         nwMpNvfmEez1bj5/A+cD7H6QqRpX37hEm3m1mN8vLP6m0ZxvGaFuRFoesJgYPb+19W36
         zIk0wANd8M5bhjcUfjTzZ44lPzy16h11QvU+ttzdCDfkOSt3Y3vsX+pu+tQWi3Rm7deb
         +hLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgODdvmvLu7TA0E2ZAA8OIEd9Bpy5Swb3iPf8e38Bm352bTR/NhCFtmVgMhp53Q5+Li8RWUbcVDSM4ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YweGqkiM4H66RtCsbJwK9kaP9hkoNCkncwdX0DkT1a1LiJUO+XD
	NcfyZY8xYl3d8R36nzO8jZV6wgdWQu+4HtlyVu7L51wL4X5oVZEOYns4
X-Gm-Gg: ASbGncsPZS+eXJhTgDkhWoQaSa4Hsmm9kxJrnvc52pJRzKoZUgFsuBaHNAgKD8MDM0p
	tm0dMsJJzqFaNaBa3OCTcRnkU3MbzLLrcAm3OWnH2l5KXMjsDl78JQwQ16d5nLH33c4bPVU0oLK
	dLcHCu/D4jlp5ZR+eygPsVo6SkSxTMiErDDafFVdGtU0XtOijmvW7Ue/8kfYzAC63ESTiD7skTS
	LeUbDQEGiinj/8G2Vsv6mYZHuMHg5oyuIjFe53rXZzmHVlyQzjtimZILrF/SemAn8T6RDugpi7z
	YWsCQH+pf2eXNV33+4S7do8fazSyNHe0jecsnBtE43FfyHBU0quaPKj0S/RM7msHQeq/x8qyKi1
	R0h3M9oUIWUIc69xx9wCrDJNHXLkCoie6uH7s1/hCobAKJjF3pDk370utV+g+WCTziO07rJ4yI6
	QYgHAJWlGcdG3J
X-Google-Smtp-Source: AGHT+IF5V48oVy47DDAvZnj5lN2hPNi8IKQoV7v+luO0VgruXL17m6le0MnbAaH8JmcsbJdk8AXskQ==
X-Received: by 2002:a05:6000:240b:b0:42b:3661:304a with SMTP id ffacd0b85a97d-42cc1d08715mr20198687f8f.38.1764135696988;
        Tue, 25 Nov 2025 21:41:36 -0800 (PST)
Received: from gmail.com ([147.161.143.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f363b0sm38658536f8f.13.2025.11.25.21.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 21:41:36 -0800 (PST)
From: hariconscious@gmail.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8195: optimize property formatting error handling by using scnprintf()
Date: Wed, 26 Nov 2025 11:05:02 +0530
Message-ID: <20251126053500.56353-3-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

Replace snprintf() with scnprintf() when constructing the property
and remove negative return error handling as scnprintf() returns the
actual number of bytes written to buffer.

snprintf() as defined by the C99 standard,returns the number of 
characters that *would have been* written if enough space were 
available.Use scnprintf() that returns the actual number of 
characters written.

Link: https://github.com/KSPP/linux/issues/105
Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch optimizes the error handling part of property formatting
using the scnrpintf().
Removed the error check ret < 0 as scnprintf() doesn't return the
negative value as per contract.
https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.scnprintf

Thank you.

 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 44 ++++++---------------
 1 file changed, 12 insertions(+), 32 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index fd4f9f8f032d..77c58c9ec3e2 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2652,14 +2652,9 @@ static void mt8195_dai_etdm_parse_of(struct mtk_base_afe *afe)
 
 		etdm_data = afe_priv->dai_priv[dai_id];
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-mclk-always-on-rate",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-mclk-always-on-rate",
+			    of_afe_etdms[i].name);
 		ret = of_property_read_u32(of_node, prop, &sel);
 		if (ret == 0) {
 			etdm_data->mclk_dir = SND_SOC_CLOCK_OUT;
@@ -2668,24 +2663,14 @@ static void mt8195_dai_etdm_parse_of(struct mtk_base_afe *afe)
 					 __func__, sel);
 		}
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-multi-pin-mode",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-multi-pin-mode",
+			    of_afe_etdms[i].name);
 		etdm_data->data_mode = of_property_read_bool(of_node, prop);
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-cowork-source",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-cowork-source",
+			    of_afe_etdms[i].name);
 		ret = of_property_read_u32(of_node, prop, &sel);
 		if (ret == 0) {
 			if (sel >= MT8195_AFE_IO_ETDM_NUM) {
@@ -2707,14 +2692,9 @@ static void mt8195_dai_etdm_parse_of(struct mtk_base_afe *afe)
 		dai_id = ETDM_TO_DAI_ID(i);
 		etdm_data = afe_priv->dai_priv[dai_id];
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-chn-disabled",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-chn-disabled",
+			    of_afe_etdms[i].name);
 		ret = of_property_read_variable_u8_array(of_node, prop,
 							 disable_chn,
 							 1, max_chn);

base-commit: 30f09200cc4aefbd8385b01e41bde2e4565a6f0e
-- 
2.43.0

