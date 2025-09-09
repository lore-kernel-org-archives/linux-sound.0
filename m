Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162033376A2
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420427; cv=none; b=cbXjGaMuFKLIUAVdLBLVJFqJQNMgZoyt4huB9TGMGWXyPAxPs42R0iNTFVw7GPmRusrvxebvJ35QqrbIjksluHawkKvqHC+LAKyHqhc3jm2uwZfL5OKwEVzkfA2eFOOYM7soYXndyZhpG8k76vfJPTbfMQND5HyA4bXD7vp+MHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420427; c=relaxed/simple;
	bh=xynzZT1z5POGIc4N3XzfJCxYHyhm4ZuoIB7XsD7Wp5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXEAScl8eq9YRQCXLjW1oMYiSK8skk7KOTWazlMR5cPDjbST68dnLG8dqQGFr4c7fOxZH9o99errS2MhIK1icyCSZYR7d4fjLxCy6p5Nj7ceAosqh50VMzXbsYlbZf4TXsIpDLbgMhWqdzD0ab/hlfSyQ/mlOFwf1qV0RwwE75Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqMA9b+0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqMA9b+0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LTXF032460
	for <linux-sound@vger.kernel.org>; Tue, 9 Sep 2025 12:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TPzPoz+34pn
	bFavfODKxfN4gcHuvBPdQUqluwL3fPFo=; b=YqMA9b+05lDoCQ7Y7vnkNuX/t88
	Zh+i0M0JbPQsrW9d2e4bL9x+oZ9NR8TYTi3d6A9QajzLvrDCXkzJNOaBcdhIyukb
	cdnnbgGXXUZu77/wHiM1zcZ+c4ULmlznKO8ERWscay5TyKfOV4swzyMLMAfsU/s4
	aMvvMxRAoc3IiLxZ/htA0c+x7OHr8JZFi267x1Nt5vE0FSNJmM1FEMXhR7/vmpiv
	0MILjUd69AjOkFTyMdir7Sgh2QsROwcgJLpOpbT5+nl2Zug2pb6tQu4MOx6rbK0U
	ZkkNWy3t8KzWA/b1JuHc11VI6QDC6KRoksizUb4paUpzJLhTMInO3RbjtgA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m023m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 12:20:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7224cb09e84so121179936d6.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 05:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420424; x=1758025224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPzPoz+34pnbFavfODKxfN4gcHuvBPdQUqluwL3fPFo=;
        b=A7MOs21CuRkYPSIJToQH/fRyvdd8fl6fSBlgYqBK7JLFDZ2sBUUfIlgdCv2JuVZxTt
         kvfFNh4WFS8o2pe1WnBtHCyQK4noX1Vwk1ZJAqqKRSiwXDnSB5db/b5yqOkWkOWl1E5t
         +XoNajnualApgeDwkIZRC86QMMEZ5nFdOKYLjvXwLClfcXNKQIw9hcZSTaPxCmts4r0R
         42dwYZdJYvJmn/vrOtHdld3/AiCEIwMCmhflP/0G4km+ikMg0P1aWOcOXHm4O1+OcEP1
         9QtDDkn9UHX+sSWMeIAt8YPDMsiyMYT8FWDRS5TprvBbYsdSGwDMojXD0tEgbSsMF6p4
         57pg==
X-Forwarded-Encrypted: i=1; AJvYcCUlq2uAKsCDC1L+fuXe+cQ0BzV7TZ9jk7RCt4xn1PnCHiISnfV6t5tSF5dLtje1fTQa7J5nfYsZj/5Vig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxy5EoCD0UJkQngKNjQY4ieJ4hkfsknY6HE1nHLuLfo6x3HSTn
	zU1y/Y6hhLwaadKGbvvZxGz6TXQmEhbSnM59KVWHZBh4DRuHD1UlQX7GVe1yQnaq/WDOAXQN8dH
	F9YyD/DwmzykqhFTqcGRvkYi5h2VcBpoIavQbQe3b+pCUFBgUU4VhM883/usCryAFdQ==
X-Gm-Gg: ASbGncvtNVgmXWrxrJ05Ah9/8V6IMtXHtedALm4/T/dRyLbEPG3DYuyEFrhxTwD9lmj
	cmf22vgO5gGg0IXEfq39KAjzYiI/KczRyohuzwdRgeMB4Ykt69vhhIPHt2uRZ9OnM19p0gagN76
	7k++kcwL9gq6uzxP0NMrwkTDuXE14BSrW5cPPYaNpjftbz4I/MoK6tXGHWYD6FY7kexxZZBO7ho
	kOxNFhilcoRAvSqR5v3Tb4671dHYyQ3Tx5RKLTaOQxuV/4WFh3jVR1YTpgvJwy1Y97zvIRqyElB
	ySKHren8uS/ugVhvyMcZIEPGVfYWZxRskmVmF11hRw939RnkkdTnCA==
X-Received: by 2002:a05:6214:19cf:b0:721:93da:1071 with SMTP id 6a1803df08f44-72bc63d5524mr181628236d6.34.1757420423743;
        Tue, 09 Sep 2025 05:20:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx9B5eQuWu1c22UXV1vqE7IrMf74q5eda4y7xVZ3+ujKA8u0UsRcyYvdmAg8NK2DMFxclBww==
X-Received: by 2002:a05:6214:19cf:b0:721:93da:1071 with SMTP id 6a1803df08f44-72bc63d5524mr181627136d6.34.1757420422295;
        Tue, 09 Sep 2025 05:20:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 05/13] ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
Date: Tue,  9 Sep 2025 13:19:46 +0100
Message-ID: <20250909121954.225833-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX0BmxK5dVv5vv
 KNOqA8tpE7WPCKeZMkaoCKXx05fCE4brLl+4oT3E/c39myqS5phfrUqUoAie83IV0/87hV8at2g
 XHVqQMLf3mV4SK2PMlFuLcSsMLUNtM4zgBf4n32Bb77UFqQ5YgUHgjUhQOhAUhBxEjrC6W5kKlp
 bAAFWWZzgfo39gSsSC80Gs9DsByuDccSwQRZHu+9OoU0qicA3BNFl3Tj+Eq1HmW9G+Hlqy+isuZ
 UYsTJez3vSB/FPQlieLDAf1OyzeDKNGZzogv4xVaB/lq/B5FcJBTILvZ41ylUy+d1ZI66bqPrtg
 VyCxixs0AYLEY9IuP7B5XgUEuuZmxpj+huzsbeWtda7GiXT1n4CyjWh7dMgQTj48oLPLYb9jxiu
 HySeH26v
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c01b89 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VO0QnzvMDvqADXZeruwA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: AELrYs6W492_tFIysaYjhj1U2d1c7vID
X-Proofpoint-ORIG-GUID: AELrYs6W492_tFIysaYjhj1U2d1c7vID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

use of_sdw_find_device_by_node helper function, rather than duplicating
this function in every codec driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x-sdw.c | 6 ------
 sound/soc/codecs/wcd937x.c     | 4 ++--
 sound/soc/codecs/wcd937x.h     | 2 --
 sound/soc/codecs/wcd938x-sdw.c | 7 -------
 sound/soc/codecs/wcd938x.c     | 4 ++--
 sound/soc/codecs/wcd938x.h     | 6 ------
 sound/soc/codecs/wcd939x-sdw.c | 6 ------
 sound/soc/codecs/wcd939x.c     | 4 ++--
 sound/soc/codecs/wcd939x.h     | 6 ------
 9 files changed, 6 insertions(+), 39 deletions(-)

diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 1bfe7383b311..e7cc699bd8bc 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -78,12 +78,6 @@ static struct sdw_dpn_prop wcd937x_dpn_prop[WCD937X_MAX_SWR_PORTS] = {
 	}
 };
 
-struct device *wcd937x_sdw_device_get(struct device_node *np)
-{
-	return bus_find_device_by_of_node(&sdw_bus_type, np);
-}
-EXPORT_SYMBOL_GPL(wcd937x_sdw_device_get);
-
 int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index de2dff3c56d3..b78f37c582ca 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2788,7 +2788,7 @@ static int wcd937x_bind(struct device *dev)
 		return ret;
 	}
 
-	wcd937x->rxdev = wcd937x_sdw_device_get(wcd937x->rxnode);
+	wcd937x->rxdev = of_sdw_find_device_by_node(wcd937x->rxnode);
 	if (!wcd937x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		return -EINVAL;
@@ -2797,7 +2797,7 @@ static int wcd937x_bind(struct device *dev)
 	wcd937x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd937x->rxdev);
 	wcd937x->sdw_priv[AIF1_PB]->wcd937x = wcd937x;
 
-	wcd937x->txdev = wcd937x_sdw_device_get(wcd937x->txnode);
+	wcd937x->txdev = of_sdw_find_device_by_node(wcd937x->txnode);
 	if (!wcd937x->txdev) {
 		dev_err(dev, "could not find txslave with matching of node\n");
 		return -EINVAL;
diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index d20886a2803a..0f96b7108a7e 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -549,8 +549,6 @@ int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-struct device *wcd937x_sdw_device_get(struct device_node *np);
-
 #else
 static inline int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
 		     struct snd_pcm_substream *substream,
diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index e822cc145250..a7514d716086 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -82,13 +82,6 @@ static struct sdw_dpn_prop wcd938x_dpn_prop[WCD938X_MAX_SWR_PORTS] = {
 	}
 };
 
-struct device *wcd938x_sdw_device_get(struct device_node *np)
-{
-	return bus_find_device_by_of_node(&sdw_bus_type, np);
-
-}
-EXPORT_SYMBOL_GPL(wcd938x_sdw_device_get);
-
 int wcd938x_swr_get_current_bank(struct sdw_slave *sdev)
 {
 	int bank;
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 711f373ece24..e2cb0758bca7 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3400,7 +3400,7 @@ static int wcd938x_bind(struct device *dev)
 		return ret;
 	}
 
-	wcd938x->rxdev = wcd938x_sdw_device_get(wcd938x->rxnode);
+	wcd938x->rxdev = of_sdw_find_device_by_node(wcd938x->rxnode);
 	if (!wcd938x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		ret = -EINVAL;
@@ -3409,7 +3409,7 @@ static int wcd938x_bind(struct device *dev)
 	wcd938x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd938x->rxdev);
 	wcd938x->sdw_priv[AIF1_PB]->wcd938x = wcd938x;
 
-	wcd938x->txdev = wcd938x_sdw_device_get(wcd938x->txnode);
+	wcd938x->txdev = of_sdw_find_device_by_node(wcd938x->txnode);
 	if (!wcd938x->txdev) {
 		dev_err(dev, "could not find txslave with matching of node\n");
 		ret = -EINVAL;
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index fb6a0e4ef337..dbafcae247f4 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -670,7 +670,6 @@ int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-struct device *wcd938x_sdw_device_get(struct device_node *np);
 int wcd938x_swr_get_current_bank(struct sdw_slave *sdev);
 
 #else
@@ -697,11 +696,6 @@ static inline int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-static inline struct device *wcd938x_sdw_device_get(struct device_node *np)
-{
-	return NULL;
-}
-
 static inline int wcd938x_swr_get_current_bank(struct sdw_slave *sdev)
 {
 	return 0;
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index f7a9323a9fea..e487a1bb0194 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -128,12 +128,6 @@ static struct sdw_dpn_prop wcd939x_tx_dpn_prop[WCD939X_MAX_TX_SWR_PORTS] = {
 	}
 };
 
-struct device *wcd939x_sdw_device_get(struct device_node *np)
-{
-	return bus_find_device_by_of_node(&sdw_bus_type, np);
-}
-EXPORT_SYMBOL_GPL(wcd939x_sdw_device_get);
-
 unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
 {
 	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 64f082e474c1..5a56c79a8922 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3383,7 +3383,7 @@ static int wcd939x_bind(struct device *dev)
 		goto err_put_typec_switch;
 	}
 
-	wcd939x->rxdev = wcd939x_sdw_device_get(wcd939x->rxnode);
+	wcd939x->rxdev = of_sdw_find_device_by_node(wcd939x->rxnode);
 	if (!wcd939x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		ret = -EINVAL;
@@ -3392,7 +3392,7 @@ static int wcd939x_bind(struct device *dev)
 	wcd939x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd939x->rxdev);
 	wcd939x->sdw_priv[AIF1_PB]->wcd939x = wcd939x;
 
-	wcd939x->txdev = wcd939x_sdw_device_get(wcd939x->txnode);
+	wcd939x->txdev = of_sdw_find_device_by_node(wcd939x->txnode);
 	if (!wcd939x->txdev) {
 		dev_err(dev, "could not find txslave with matching of node\n");
 		ret = -EINVAL;
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 3204fb10b58d..3f189e5cafd5 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -930,7 +930,6 @@ int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-struct device *wcd939x_sdw_device_get(struct device_node *np);
 unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev);
 
 struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd);
@@ -958,11 +957,6 @@ static inline int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-static inline struct device *wcd939x_sdw_device_get(struct device_node *np)
-{
-	return NULL;
-}
-
 static inline unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
 {
 	return 0;
-- 
2.50.0

