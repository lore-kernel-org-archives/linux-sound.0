Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42932302142
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 15:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087087; cv=none; b=VQ6IeF0i15E4GyYT2gv77XL7LGPEqS6473hTV9ALn3KcKa1aWYkz0uZ5/f36MO8rBM3ZUNtuUr0xQxaQN1zIlTaRuONJpayw9gzab1QJoYcRhIySGogF3RrjPDyT3a9Gx9e+lg4rodnymWXR1VA/pSYi/J9THElsKAURVPTFKm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087087; c=relaxed/simple;
	bh=4NDb3BHQkI2X3E5eiL6I24at9ebSdCFIXHWDhEFcgdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPSav8BFErMq593oZPxvbMvpwD0Rp/SibuI+4zyzov7lxMbuZ4FDW2V5Gtc3rnKbL5FNVOtzfqKG9Uv+5coSd/CcDm1jnfLkDBGhJkVsx8JUD0is9/5nrTW06kd9Nao7iMdxr6nE+5EIjkvWhb4NckPTBMRN87doKR9tzPIjjPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUwp4wVt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUwp4wVt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58574dMX013622
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 15:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C34AfntxGUQ
	tcgOzSpdk0iKg2eP3zakUjCy6JAxDmas=; b=SUwp4wVt6ASuoS6rYrViinDZGie
	SaaQrW3UEBd5x3XBMZjjFNlExG7iHL5Cw0JePdgPjghpNzYwZh1pdlJp0TyWiaJV
	xEDVSIWcgUr/iwbffMUJJWxrZK8ddMz2o2sAYHC3u3ozePpd137T9XGgPvtObqeP
	HNc+uvNSoqI1irQog11R9ti9VzpkamQBFROMw2DsShxdgza/wYi/jF+UIW5iqhis
	2c449B48cUBkkwbYSyagOiAxEUYTMyRorOi011UfOPCQiKCesoZ0hVISP6urpD/s
	bNOxhD/YBjn+PAKEqpWYd6KX8e8Ip7OqvPpWvCQdqp1qKtoNEKG41yEbqUw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyfj9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 15:44:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5d58d226cso49640391cf.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 08:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087083; x=1757691883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C34AfntxGUQtcgOzSpdk0iKg2eP3zakUjCy6JAxDmas=;
        b=eUe+UtpA0tB/1qF3X2ajgOtA/veT8gEPb331JszWIiuCzY2lfD/ph2vckQw6JXFqsr
         CVvDjTdirqgS3QVwJbb1LCFW0WkX44itrWJQdV0Vt07vqCX3FD4zZOpFE0D7lxkiTv05
         8zz3t67r+i21YtE/u5OUDN7Fsh1K3CiDRUSbJRq8dcygO/Iq79c7dAjzbWCGZq4CnAjJ
         Kx9RnnP4fDS/H0WW9X8fTk4adgDE1BXb6pkpWTQ8J+Zy53xYurvt3+gMhNOhkBHDzcyB
         n7VcWVF31Nl8J9hzKAocUOmeQlQCuNc5d1NVsEIj4G+lBssjOV/IjKmLdzSuPjHKmAd7
         hx7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgiyfLjI8n1F1KeuzY9+j2O+kaosL6abB6eFUrvD8PCo4YDhGXmVsjB2pNOnTctfPXDQgRpYOlO9yTKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpUEuraGiaLu0f5SOtMISV+93lgaRduxcOzBrSFjMhmwEDwVDG
	+4e+b3ZO/mc5BdTYlMVZEQHEe1bga+YuEbAxXlmE/4cFIkBcz+sz/c9RqE25HiTYNU5qBbC4yM1
	ZbluRJPfW1eu0Te0/hT8rTBaLzCw90/UC5KshRFeqythrvsppvyJgmP/YfBOp1EsRkg==
X-Gm-Gg: ASbGncsNhHoSbapopjrj4s3zwyhRrrKtymCrRdTobvP6rYs2ZJ5Jf0F+KwwBPhHndAN
	EQK1iWsRx8wGh0iackq4MP7+jKPIA9I0WjGwswfRCrISGa2CqOtBApXS9Rulsq5pK2I67YInmYz
	dwgkJfD8wftBEgMtmUcy7qASaW6K2SkT4P1RKfS8qRpOp+BHsdINk25pZuslm7nECY2+z/OgrWO
	6fBsi8YtTRHECUvaGKDzmjRrE+ewRi3gt5wtkXc26Cy4ZGE7YdqRVzn64Xf2ZrMXEz0Sc1U9jic
	Us9K/YYhw/dDJlQwXC9cX/jdTYFMUBYgIa0RPxnH6BxkGq73FP3bZA==
X-Received: by 2002:a05:622a:38c:b0:4b4:9273:9689 with SMTP id d75a77b69052e-4b4927397f8mr122517241cf.81.1757087083227;
        Fri, 05 Sep 2025 08:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTqgTAeXKIaPrM79+DCWFqyIZktp8nLWlrRyAjPgHUYjE2/tgNnLfxITtxh9nMlLdrVZT6lw==
X-Received: by 2002:a05:622a:38c:b0:4b4:9273:9689 with SMTP id d75a77b69052e-4b4927397f8mr122516131cf.81.1757087081455;
        Fri, 05 Sep 2025 08:44:41 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 05/12] ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper
Date: Fri,  5 Sep 2025 16:44:23 +0100
Message-ID: <20250905154430.12268-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bb056c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WmG1VI7HpiTX60UEcG8A:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: mgIO6N4auHb3KCQdRnY-7Tyzc6PbTulZ
X-Proofpoint-ORIG-GUID: mgIO6N4auHb3KCQdRnY-7Tyzc6PbTulZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXwT0GSLcLb4E6
 xvkLNfbXlzQu35rbhy0xG5zpfawG48R4JXlQpeL0IbiG0mCSVCIob+RuuYERKeearvYIs6y5N9E
 oGxr9z9E3otu8LXqOKgF5BxvUaYn8fS0xwWth+OioxdsxZSI2BeDeP0l4epUmLSTBXr/tROsWwT
 g9gOot8QB0GtYDUWpWJvLyK5Q0trjA69Q6rp+EUc/eWoSiKGJn/uZcZVIgV7xVX3kxsY5rtuZMe
 YivxPMx9XZEtAxWm38SLIuMzFNpAf+2M4oHlMfMWs9cy/vDFEvggNb+lbX4VzmJfUMRhshkB/GT
 Hgeclux+57LL2dvDYWC/c4IoqszNjaevliFgRYcfdIMQgQAfQ8yLzpbO53+ME6cc6J/EDIfckUI
 DM/1JpxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

use sdw_slave_get_current_bank() helper function, rather than duplicating
this function in every codec driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 sound/soc/codecs/wcd938x-sdw.c | 10 ----------
 sound/soc/codecs/wcd938x.c     |  3 +--
 sound/soc/codecs/wcd938x.h     |  7 -------
 sound/soc/codecs/wcd939x-sdw.c |  7 -------
 sound/soc/codecs/wcd939x.c     |  2 +-
 sound/soc/codecs/wcd939x.h     |  7 -------
 6 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index a7514d716086..8bcd8396f375 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -82,16 +82,6 @@ static struct sdw_dpn_prop wcd938x_dpn_prop[WCD938X_MAX_SWR_PORTS] = {
 	}
 };
 
-int wcd938x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	int bank;
-
-	bank  = sdw_read(sdev, SDW_SCP_CTRL);
-
-	return ((bank & 0x40) ? 1 : 0);
-}
-EXPORT_SYMBOL_GPL(wcd938x_swr_get_current_bank);
-
 int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index e2cb0758bca7..f8d7bf27a6ed 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1094,8 +1094,7 @@ static int wcd938x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
 	int bank;
 	int rate;
 
-	bank = (wcd938x_swr_get_current_bank(wcd938x->sdw_priv[AIF1_CAP]->sdev)) ? 0 : 1;
-	bank = bank ? 0 : 1;
+	bank = sdw_slave_get_current_bank(wcd938x->sdw_priv[AIF1_CAP]->sdev);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index dbafcae247f4..54ee56b7fbd6 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -669,9 +669,6 @@ int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
-
-int wcd938x_swr_get_current_bank(struct sdw_slave *sdev);
-
 #else
 
 static inline int wcd938x_sdw_free(struct wcd938x_sdw_priv *wcd,
@@ -696,9 +693,5 @@ static inline int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-static inline int wcd938x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	return 0;
-}
 #endif /* CONFIG_SND_SOC_WCD938X_SDW */
 #endif /* __WCD938X_H__ */
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index e487a1bb0194..477d6cf27d32 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -128,13 +128,6 @@ static struct sdw_dpn_prop wcd939x_tx_dpn_prop[WCD939X_MAX_TX_SWR_PORTS] = {
 	}
 };
 
-unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
-			 sdw_read(sdev, SDW_SCP_CTRL));
-}
-EXPORT_SYMBOL_GPL(wcd939x_swr_get_current_bank);
-
 int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 5a56c79a8922..85730ae40c2c 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -1017,7 +1017,7 @@ static int wcd939x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
 	int bank;
 	int rate;
 
-	bank = wcd939x_swr_get_current_bank(wcd939x->sdw_priv[AIF1_CAP]->sdev);
+	bank = sdw_slave_get_current_bank(wcd939x->sdw_priv[AIF1_CAP]->sdev);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 3f189e5cafd5..e70445b1a4bc 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -930,8 +930,6 @@ int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev);
-
 struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd);
 #else
 
@@ -957,11 +955,6 @@ static inline int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-static inline unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	return 0;
-}
-
 struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
 {
 	return PTR_ERR(-EINVAL);
-- 
2.50.0

