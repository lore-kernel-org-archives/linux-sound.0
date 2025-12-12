Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C6D30B53D
	for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 04:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765514744; cv=none; b=r/aKyAED7IujLqNbYrCS60RjXW23pgczc5GYwDyVKUYX2jdcOfXcNU8YPCUISABw6VsMnjxVr5IXr3MLx3xWN1CPxhIpRLiUU4Yu+vQGdF0ockGvexgl4tTWACHnnrVBNuQRGverYEJdkIO2SrlDe7+xA57/Ym66UuhvpLhHBb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765514744; c=relaxed/simple;
	bh=kN8wNtyrFPMNkBMnseS+/dcIHc+YV5MfHN3kVM6Rs2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Njb34iCapqm5S08tbXDNe438Q+jnSxbp+1MCt0Q1Oix9NYk19ppdkPpVypy8dpfBhw2q7sNvEjvjEXNcmkNXsmWx0TSK1o9977Yi2Y3DkozORk/4rZnrpFg58gC6Ndtt1P+iT1SbTIE3KbsDLHzQfSF9YOVFimToRr2xZNjuQxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdDNqWrR; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdDNqWrR"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42e2e40582eso487931f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 20:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765514739; x=1766119539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QW5cVIdovQWDv+bqBSbnBeQJjt2jpyUHW2uxiLg7ptY=;
        b=FdDNqWrRHFjb0QRCgIt6CYQ1b1ehtMK0IMrog2tmegKPR7uVukAEkz8QwR2hBjJSN7
         rbrgA4MBnnbYhFVmb1UEJWTb6hAluAiRk7F/Oety7o5TOjwS5OBoJJGZoXtoEjdxjFzp
         EXeHCg3eqJN/NLE6D+DkBlZlP+RWJBvd0IfUx3poByHlhmrmAul7LCuiUP+Nrg8575Rj
         Ah48dvm4xmlEwlEb4Va7vpLGoNsqtfcknpq+tnKabSt7+fqbjcBQ8yDp4kfTh6gqObHO
         9k5vZD6phVeZuEv434juw40QOH6ojSRbfuanSzC16ZW1amIfgPxkXhf+BebMpKiNLB/V
         aobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765514739; x=1766119539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QW5cVIdovQWDv+bqBSbnBeQJjt2jpyUHW2uxiLg7ptY=;
        b=tw51VoptjY6MI3jTSHfbqZC4MjgU2CvUVd3sSPZCHFN4sB7kKqkafL3YXwBteSzY3f
         MhEXSPPm3Cjas21zJm+uoR4DEH71cghfaryknRwWs949C1zEDqgw27pdRdPti0yv2Pnv
         O+Lj1msa+2Q228+eHOyIG0q1VdQhc5TQ2VhMPitACbAzMHlxNKBqnYQxJLJ4dT637M7F
         oWiGqjp+JP/FjcdsC8RgfE7bHRtE8M9otNEvyeI/xTh0AmGvWAY4nGTxLq30Wpp+3Ax/
         4w2xXL9MZZqoT+6wbLySXXxzz0UGawovUpTrLcJFowzXxRPTxRW6DSHAH89glLNuiGWc
         zcXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRcemeNoY2qriqtyrcHq9nr6IcKBYbHvXrkIUyV0cX6KvDIXKhM/Z6PxLoQhoWtrD2+mU/TfKRYHUZRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YymCtn/4k6Gluiws07j7KafY4GOKJRALNMzH2btaZpN3S2n2Li4
	fjPRouZTDdaEVwQYBidwVaeZ6MkqXsAkGHGYZJLoURsB42Zxcp4sZeDl
X-Gm-Gg: AY/fxX5yVBhjfiriYU/b9sAWo853jfBJLLefdajjsKR1nUSFUfYDy5RIepHxolnbpI8
	Fg9n5WTLE4eNKpoXsMYqIveNdrSJKY0Kkth5Fk1wgYD55iqeuikUE5BTsRNP0aUiztYMixYcllp
	36O6LWAPoC2BYT/heVmu7VlPQkmE6V7aiFcyJqEd/9YyeyAtiCiydAm/jEXlf/SVi5nrfVC0E94
	OMW3Bn7uAcnHS66j5TbswnzmeD1LE71JXLOVRO+ylVsYNN0yCg4rL7sDvfGh3Sg1NzO0o1fUqZz
	d+FF+bUwS6JjFqQsRafHWEuJEr/cHQqDn7QQl2Vr7c/3NG442lwRF+pKAKyrL9BvABrPx3P0nCP
	x0SKdKRqHqzXOUqpjO4ghZtsWMs5XQuU1Wc3foUTXYI+tm62ntzZXqivdAN8cRitKOBej4icYt0
	0o4wOZuvPDhSgwaQ==
X-Google-Smtp-Source: AGHT+IHxEK1dPtN1EkZbAF0nXgZC4Mys7ot/TMtb/qd/CFD63zDMK/TbKWYGp7RBSHzfv3pozTJ40w==
X-Received: by 2002:a05:6000:24c5:b0:429:8daa:c6b4 with SMTP id ffacd0b85a97d-42fb44d402amr567209f8f.21.1765514739163;
        Thu, 11 Dec 2025 20:45:39 -0800 (PST)
Received: from gmail.com ([147.161.143.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a665e3sm9861822f8f.6.2025.12.11.20.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 20:45:38 -0800 (PST)
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
Subject: [PATCH RESEND] ASoC: mediatek: mt8195: optimize property formatting error handling by using scnprintf()
Date: Fri, 12 Dec 2025 10:14:09 +0530
Message-ID: <20251212044408.1286-2-hariconscious@gmail.com>
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

