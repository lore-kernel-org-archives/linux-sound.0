Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05642609D6
	for <linux-sound@vger.kernel.org>; Sun,  7 Sep 2025 11:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244135; cv=none; b=lEAcTTpC8TURLcy8XhPt43meoTYoTSRv+TgG3UKsSsobcnDk6Etp+2oro+rexNflkQKdAOojrA83c36pF6M3fUol10MLdP7V0jRCbzhfn5pwYiyRg3pxRzAvBAoVwkQSPhKuozHw3SI6twSZb6BVRTE/pxtsoXHF9PODlCvdr90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244135; c=relaxed/simple;
	bh=4NDb3BHQkI2X3E5eiL6I24at9ebSdCFIXHWDhEFcgdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmfNTKccW3VfEaSvwIxrT16hU8PPA+5tdQANi78O4H1U5kRB1xrVQ0E8/+drVecz9Zt3gEYZCfTfSOgfk8WLMMmN0Gc6or0g264eeGolqGmdcv3qM+1sOGJ12+AWih27EmLxqvHpfyx0paDJM3caxD906bf5hAeH2NGXZa20758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ngxpD6Di; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ngxpD6Di"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587A13Ra023227
	for <linux-sound@vger.kernel.org>; Sun, 7 Sep 2025 11:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C34AfntxGUQ
	tcgOzSpdk0iKg2eP3zakUjCy6JAxDmas=; b=ngxpD6DiTSnOloHgWf17hm9Y7BU
	E74SVflxMk3pXFt3S813oUxQATelCqix1zx2Xriutb22A/VxcqFIdbJ+ZLp9bHNo
	LFWkjlJG7wp+X0Dy5cbfJWydstFyvDf96Hsv8PnUMmIIi2gAc97HkM4/02hS8gke
	WUfO1vONuVVEPXCHFTXBZEWAQYI3PLqo13MxvscZa0aXUf65lICnSA8XGzzM/aND
	LYg38pheViYFtn4ay6TnwnUApk5Bo/idF8r/43/ZcTtXXkpCvBM5xJIgUo6qDz+7
	ry914O1yZQhoua3TRObbaQHuwhYeyO3wC1nqayQz+THX+mazC6iXecw4iWw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8a024-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 11:22:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-72631c2c2f7so80686876d6.0
        for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 04:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244132; x=1757848932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C34AfntxGUQtcgOzSpdk0iKg2eP3zakUjCy6JAxDmas=;
        b=QP8fy1FG56cawFTz3x1pUnqQ65LO3ymDKDWWWP195JUjJwb1WTjHr5i9zaHGrKdzh0
         +93E/dZD1PxzdpEWfVRACSrY0psCibXq8Ep8H4l1kb3EgpQRi42ArA+bEg/1ySU6CAHk
         r+yJMkGIwn7B6WKtmhJ+fOTVhWor2fdCAzkmHFj5emtUGlp12muiMnxtL4toZp6/Jp2E
         wN7w07cyZGwLwdhkcRAYhWcGgy4h0zN3Nsz9PClXEGo5i5qfMoEqn8qmrzqa5EbXaULN
         BskvxYg4tLwU9wFuZkUZMw1wE5fqbgNuIARYv81HwZ4hlaKbHnVdNAZ2AGO8QcnrvKKa
         Ilcg==
X-Forwarded-Encrypted: i=1; AJvYcCXlRKhGWBcF9tfD1z7J9T5Npr+JIk+r2BHLbg3/SU8YudzRqpN4KIqmFjMWgEeZSQlhMt9rFLGnioKJhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz11fHNlWPAAW0jI/fQpGktafr2D6p7N0xZ3m6HDHHTbPfJrFaD
	I/Q/lQ2N3PI631xbR50ZqEShilGRE3DtzuZvKyMpdon7eH2RivFGk/n0YUurQcP5/DxQTbfa8nV
	u0AscOUppTRa7IN8ZDTAFS9TEo+qbrVe9INXyD4AodHeRUoqHiPnNw/D8Qdodz2tjIw==
X-Gm-Gg: ASbGncs3RCKjnPAWoW3cpOaxnqXUzKCJ2lFZWvrn5R3u3dje/LxZ8mPNpWiRLItjBlG
	9KfG+jnPKI3sPItMfBuWX/hHUzOxIFsE7IMW9QbQmmEruGtjexmoseDbCkIBVsSu7KujKXn16Gp
	3+Wuh6f2FiPDiny0z5RbILj9k1mBUfnNFxp7froWRdRjmIGwEOvm9+W2bcQDE0rUQ2FHXRpZxO3
	tFnfRTio/xla3anaTU3WHGbL7GNHGpEnHRuKmnzHUfkOhoJgUmLnOrYzFrZ1scK9/8pfOEgbBDq
	cGXwocVZAbhKPI2Us8dy8/2SwLex+ugL98qLh6EbCxKsHRVF4B4ecA==
X-Received: by 2002:a05:6214:906:b0:73a:9990:86db with SMTP id 6a1803df08f44-73a99908866mr35908026d6.54.1757244132053;
        Sun, 07 Sep 2025 04:22:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg0TJWxyVgH3qoIWMjlj7I91G0WIKAiEW4a9z6OIa5BAvnN8JP8rB+xr4IPBPnqkC8IxArXw==
X-Received: by 2002:a05:6214:906:b0:73a:9990:86db with SMTP id 6a1803df08f44-73a99908866mr35907866d6.54.1757244131615;
        Sun, 07 Sep 2025 04:22:11 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 06/13] ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper
Date: Sun,  7 Sep 2025 12:21:53 +0100
Message-ID: <20250907112201.259405-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX0+7cGUEu7twv
 0xtjD/f5WGTNTVhOdwEigsAymzi/5uTVUPAzZrOQcHtLFQtu0pAm+on2yRht97o+fw6SWZe3w9r
 TUbEzBssl2P8ErE55ghZo587zf6i+Fp0fruImG3QqmjuqSqj5qy4sv4VQrdMZq8MZLoJZhnPFsx
 lQmPs0IlRjtLo0OUunz3LeIWCA38Vxg7jYKlRCqVHP8xuY5KRQDn9y0kEWDaUuKI/ffJuhWHFjH
 zzfkoDLLDQRo2FiI2l6vWBE++TGz8rBMzbLhJ83Xyio/pjp01ErXZFJeJ10RzsUK5x7kS9URCaK
 vqVD3xn2jSv4WbsSGHsxnv0LMIhky4cJRN7erd6UWC0uiKCMvLn1+V09g78RLy/mZrhoV9bN6PM
 ldT0zyNx
X-Proofpoint-ORIG-GUID: XpzmUq_AoZhJPBbBzGhkJbMI7wSFsqQp
X-Proofpoint-GUID: XpzmUq_AoZhJPBbBzGhkJbMI7wSFsqQp
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bd6ae4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WmG1VI7HpiTX60UEcG8A:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

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

