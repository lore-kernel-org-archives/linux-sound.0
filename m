Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7128D261591
	for <linux-sound@vger.kernel.org>; Sun,  7 Sep 2025 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244142; cv=none; b=aB7YM9IuUYJuuI4QnsilpOeuzsIm8qA1zOX7KoZ+S+7fS71EWMNV8hPRzn7IrFgSh0iDSudK7cvLtXAJbiXqwOHB8zbtycfjaGlVAmLYObdc3ziKcjpIA8zkoAUdJbwPwSERksAbopaB643CckeHn4tr1ARzw3PhMRcO5DyYYsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244142; c=relaxed/simple;
	bh=3K5xmPHboti1L/ErBrejTcSDf/a3Rugqu21m6y+BMzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IXBVzjx0qBJqsx8U/NvCq/bG7thzS313xWnkmifQQ3CBd6/0T5aiHEkvA68vkZ0c97eXgZt6AyJx4O1n7glPSzPFouOXn/2G6FMldBpyW9xJ1Js0kZoZHS+WRR8VG/iQJgjIiATqFaMOkfsuo9fm1KNlKBFyRp6KejstlPXcfzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvTDF2ZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvTDF2ZJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5878jMdd010785
	for <linux-sound@vger.kernel.org>; Sun, 7 Sep 2025 11:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lB0PeZTreDY
	Q4uFWa9S5tmFsvOqmEo73wcjiWz8cRXI=; b=KvTDF2ZJcLVrljw7rPebhZAiebp
	nzFJmMMvWd3dc5kxBQG8RL8it8O5t4PaqetQlc2kx5LrRs81Sn/CifmDHNQZK+IZ
	OfFTH+LkAlq5JOHp3eWF7yxGk92AUxIKebjSKu8v9OyiGuGZYPMK4SnXr/XunH89
	67zt0DUxm90G7/ICahQ+pBRTmjKBN4kwFCqauptzq9vA+ST+XOHHURCjMoE8Ww2x
	S72WoTHycHb761y6eiCPEqW7Ry+7GQX8Dt8bIifYn0/B4/vGSO1z7QvD4P4oOczy
	9ohSu8wEbjNYm4c8wUHjy2HAW/WLDa3nmcO1xLn/B8+TKJKnQygb8WsMwiQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d1va0wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 11:22:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70ddadde46bso73250216d6.2
        for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 04:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244138; x=1757848938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lB0PeZTreDYQ4uFWa9S5tmFsvOqmEo73wcjiWz8cRXI=;
        b=lvpE5r9Hz1CCckOBeNbw4DOQEpldw9TAq7XLJqzD5jGCpXw+/jACjhHKYTqtCoIFNX
         ykcwIOReWwMMRS/c+7fxPk+fwxTeHY2dJd38yJmI2D4cnxZZJSAAT0jwN34NlyPhuuNL
         TZIz1Xl491tRvzJcmZoHST3xRO/B/PUaiN/JmIrGwA6B7v7kL9g+3IhE+szFdRHfCTbR
         zkAlKgL3NkX7Nnihj04X+yfkrt/31/GLn4il6Bl5yZ+XB87GqpZlb8XtjzHzPB+XC7GW
         kiq1q02SMRnIq8FCSnE0Qr4XWmZo+77d6DY8xJJO+cXxwV5Cy8Y2RcvTE1CSN1zcrgQp
         kQ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZmrI8V33a/dU1KJEFpO05ZziRk346qrCyktyCjgdLZODIi0ZNyKu3UiV7lK5S28DlbGkrzlFpaEr2PA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLB+WFNbPIcoSwjXfxhvvbwYd9ztAY6JlQUKzAasS9NIpnOGOs
	eNCL14Sa3Sa8u991f0lk0UJjoT1DEF1UXYyAfvQM1VQ+7VE4U3GKXF3/SEIPBHey/knJfCWT+Mo
	a1xgjmkb473ZlnIRQkxSAQKROf8E1FESuTaT1Pl7yUUqpTNE7/TuFfpJh9FEcToppKA==
X-Gm-Gg: ASbGncttYUTbzaXLPXj/iQqWZ0VxGzni96O8Kdkn3ELmoOZ5Ac49q9EjbmnwTadsV2T
	+gYlJACxOaRpQgQ8kB30Vt2WVYFm4hKqs24irVAVnCQPkrVW3z8vcoEYug6lt+/Sm/ka+ysSsp7
	98KGgCcbe/LA+NiIlSSjFigvLypkUqCPE2HT0e5Uqm2uy+hr4jza39U+7Nk4w9cxEGHGJjRd/8z
	PbXqvqytoCO/C0oUCZBkyo7Kwa+fXE8Nd2Ds6u22q7rpV0XyGwLG3LRbBbsbJh6zZgQ7MZMTLjK
	gGezcRnWNB6Lp6jsPoegsB4Su997H9h+NyREJkflFaH6WdbnEJ9Q1w==
X-Received: by 2002:a05:6214:409:b0:705:16d9:16d8 with SMTP id 6a1803df08f44-73921a43c71mr54310366d6.6.1757244137734;
        Sun, 07 Sep 2025 04:22:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5eBODkSZVURMQjCWR3pl6xanbPUigNJP388aG1AvYCAc5ryRdK1uW5UH1WPpUVEq9eQbSMA==
X-Received: by 2002:a05:6214:409:b0:705:16d9:16d8 with SMTP id 6a1803df08f44-73921a43c71mr54310126d6.6.1757244137322;
        Sun, 07 Sep 2025 04:22:17 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 10/13] ASoC: codecs: wcd939x: get regmap directly
Date: Sun,  7 Sep 2025 12:21:57 +0100
Message-ID: <20250907112201.259405-11-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: b1QO2x_WG0Ck1nrMd0oSGtVSfgOv1OZN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNyBTYWx0ZWRfX+kOVq5qVA2Sv
 sJakTRilOcufzuQqE09n7woP2+YhmKUFmFFzC61D+rqbVkAKNu03Aoiw8d9Yfr9K2bnf5/e4Svn
 cOvzg2Ygp+0nqGcQfKF+cMDuSAOn79RgGS4Fz/49qEtve+16WJljl+JqyjqI7PmY196AnKTjx1s
 3+Xa19Qvbf1g0kiss9ZWMt5K+JSqnvESSpExS+msWiE2yKbHMiCXoObWQZQhVWiAidp5mQ/pb7W
 Es7Fuh2oZihkXf5y3S9tL1jQ1BzuyPrvSz7FHBnL+jm3ZmajVprV60xeN1o84pMegyA1hdq6JDH
 TA8cURpQiWcSfVt9AtYI6treqJuJDS22rn91Rvca1dYfzfJfl9WNUy/AGhvKyBU7hTJaju8lifD
 hU7nFrXk
X-Authority-Analysis: v=2.4 cv=cYXSrmDM c=1 sm=1 tr=0 ts=68bd6aea cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jWMDT5uzmWzhJut3sAYA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: b1QO2x_WG0Ck1nrMd0oSGtVSfgOv1OZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060027

for some reason we ended up with a boiler plate for dev_get_regmap in
wcd939x codec and started exporting a symbol for this. Remove this
redundant wrapper and direclty get regmap.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/wcd939x-sdw.c | 9 ---------
 sound/soc/codecs/wcd939x.c     | 6 +++---
 sound/soc/codecs/wcd939x.h     | 6 ------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index 6aecad2a28aa..38da706d80be 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -187,15 +187,6 @@ int wcd939x_sdw_set_sdw_stream(struct wcd939x_sdw_priv *wcd,
 }
 EXPORT_SYMBOL_GPL(wcd939x_sdw_set_sdw_stream);
 
-struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
-{
-	if (wcd->regmap)
-		return wcd->regmap;
-
-	return ERR_PTR(-EINVAL);
-}
-EXPORT_SYMBOL_GPL(wcd939x_swr_get_regmap);
-
 static int wcd9390_update_status(struct sdw_slave *slave,
 				 enum sdw_slave_status status)
 {
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index a414cd99b946..e74e6f013131 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3374,10 +3374,10 @@ static int wcd939x_bind(struct device *dev)
 	}
 
 	/* Get regmap from TX SoundWire device */
-	wcd939x->regmap = wcd939x_swr_get_regmap(wcd939x->sdw_priv[AIF1_CAP]);
-	if (IS_ERR(wcd939x->regmap)) {
+	wcd939x->regmap = wcd939x->sdw_priv[AIF1_CAP]->regmap;
+	if (!wcd939x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
-		ret = PTR_ERR(wcd939x->regmap);
+		ret = -ENODEV;
 		goto err_remove_rx_link;
 	}
 
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index ca6353222ea0..6bd2366587a8 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -918,8 +918,6 @@ int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
-
-struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd);
 #else
 
 static inline int wcd939x_sdw_free(struct wcd939x_sdw_priv *wcd,
@@ -944,10 +942,6 @@ static inline int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
-{
-	return PTR_ERR(-EINVAL);
-}
 #endif /* CONFIG_SND_SOC_WCD939X_SDW */
 
 #endif /* __WCD939X_H__ */
-- 
2.50.0

