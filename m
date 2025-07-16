Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B1D2F5317
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752669219; cv=none; b=sCxgO6IaAY+nsbG/uibjVHDna8DFBcLAAzr9GlSNR832O7z981WbqFF5wIVIfvBhXJHhCor2EWpHNU2grsazwCKYT9Wl5EcJOrZC7cOP+MVB4l+Cn4+oIZ3tyj32Jkj/hW+LN01vWO1YigSCnW5XbfNe1JLNHlIAhOVDEFBcbwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752669219; c=relaxed/simple;
	bh=yibIyJ86F2/IfQa5SjS5WXhbpmt6CUibLHc0JVss7P8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0/HrJDrkdi4STx58Q0Xacd8SP46PaFxxmUSJ99qAuPED/R59x6rNLOsepkVlhK/oA5MuYKvIM0CI7c9v3M009lEcZ+EJaH83ub0Sq9ydy1uaGKTLN1bfild6cEEvhe7J9RwZdv3CKdag8KdCMcK7D5XpwY9mZ3e9SRA0Xm8Fms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBCud2yJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBCud2yJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5qSCE023068
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 12:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jlH8rAJGwAT
	ewu+6bBhjIOTX5MRWqExEs1wQ0VHGYQg=; b=LBCud2yJs6PttBRPX/0Z/vKFZmh
	pIPsaxpF4ZeDmtn8Nuc1Ith5r92KW4n55TnXrSV3R2Ed+OxOydupPuNz8blfYdGi
	BXqFxYNC/epuhRq8nvBqfNRQWfOBB00th5fagKj7DRn/paeK1yJj9s6Kov56MgYr
	zRZLE7Ktb9Irrk/fy4EwGBp5pSHcDcnWH7GWmRougNOnNAXhFLw7+95xqIbD6xQ7
	vLi6LwmhLaA6HOpTchCNBmokFDCAWkHZmab1ROWhX65Ft969VUCult9veAD1UvX1
	w5gUwX28TV97mVJXToCH6t+4jTmAToCcbqYcrEyfvtv4rKu+8UzANHbKAeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrumk6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 12:33:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e2e237fb4eso525621285a.2
        for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 05:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752669215; x=1753274015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlH8rAJGwATewu+6bBhjIOTX5MRWqExEs1wQ0VHGYQg=;
        b=vNavShV5Pd+RhxgjgBU6G2N6r2TWU99IpmktFul5TiONeL//5qrieiZIFijtq6Ko42
         mP5spSlvafHdGAX7+esOAaXtEDmOghtq/Z7Se8bcq384Y8oEDKGdvhcw7Psp7mWGXF44
         mMcJaV2d+TQ51wwQ13vN0d7a896GNmHuNznpU6nOj3PA7K45oBCVXo1Vgv7z4U4vEvKC
         3yzAnJBYonC0H566m0NlwXEaOBhEw/ZXr3HcPjO6tZj2XOaM09+6DxQSEA6xiWxDqmD0
         Ez3WKi9gqRiViqpvpe3Ddg5Zrfu8fo1GhbnNsTnyHelWqN9CJDONDom27Ni9dhDB2bmp
         sJsA==
X-Forwarded-Encrypted: i=1; AJvYcCXhtGQRcjwg35/mdmQzBBk4uWeCR+A2+DrYiH60wNmX9uoxOboX290x1LIdtg1FSa4ZvX6M9ZlPTdF+/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTAMffLDIb0TbCaAlkgAEEzymSAgncKFlWG0J64t4jFf0raZXF
	f4JGSaNScvCbHTq8NnZ5/AoOHvSstWQihTRmym8O4b1O+22opnDIGo8p25L/7ztB3G2lUbRlMcf
	cXkoB0L8z9rRnkk/pFhg/Ll4g6IfSY32075I2gU2PLxIaPpb7WFf9zow4zPwfT7HAwA==
X-Gm-Gg: ASbGnctLB2P09n8vuwMf9pMlaklT/XoHEUfqAtdPlz6OnFAl921gpK3/rldc/DRAXFD
	9ESiBw/Xzm0OvYC8QJ8R3vVR6mXCIvAQbBgobtfvveguPaJjrZjPu5gh4/mlSUFiUyNvzUNE8ZU
	GDIZaV8EytL4QhgnkIVjS7av067fN7mPBnMhz2y9EJTJNZ4kHzorJaC9R1Vx04ukMCg2uUmkrfJ
	UZ5TiL8tsyTRelWOOWcKA+3tqkwMWfquO2pXCVIy9J690jt+VUHf0CoCY7MGnYTRTdGGlczkuJx
	+Rqapsd1xrA9XzRI//er8vk60Ra0aWHsJTsAs0zlmKSiBsed/CmVKw==
X-Received: by 2002:a05:620a:a20c:b0:7e3:44e1:be4b with SMTP id af79cd13be357-7e344e1c048mr266093885a.31.1752669214499;
        Wed, 16 Jul 2025 05:33:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQGAK+k/pm+VAAiYbieT5s9SCZyiLFMahx58ymhGKiZvECv6WJDXL9w1xmtshVD5BdvFTvNg==
X-Received: by 2002:a05:620a:a20c:b0:7e3:44e1:be4b with SMTP id af79cd13be357-7e344e1c048mr266090085a.31.1752669213998;
        Wed, 16 Jul 2025 05:33:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e89c739sm19453335e9.32.2025.07.16.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 05:33:31 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/5] ASoC: codecs: wcd939x: move to using dev_get_regmap
Date: Wed, 16 Jul 2025 13:33:22 +0100
Message-ID: <20250716123323.5831-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716123323.5831-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250716123323.5831-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7qBqbsC7iHoDizUqueO7k5cs0BDZQW52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDExMiBTYWx0ZWRfXznx7Ha+YVXce
 ZutcRpYpJY1Gx5AZjEwqeoqBZi81F1QYgLptu89OFwijL2Abx902JzW22+qOdc7qZc3zr7qqNTq
 NKyRnSK1BjpM21lGFZzrAHKV2aA1nmeAzAsBcOzlNapClZq8ZONgvfIAme7GFAQIiRmMFUgftle
 iUVcpZCU0rwshh9ti5Wp1L/chi8iEjO9weNg/jlHTcNkRhk6SUAD8gJedNDMOGDShZo4mEZs/HV
 mb88NKZHLO1/jtDwcP3SFB7Lque2oriCeyNhBStT0HEdVDMvpSI1EI76ipvxKDuHFAPJOvbe+cb
 nrxPdT/VOjjOHpivzaCDMI30FI//MWNOlKco/ExzXQn5LciI8bOxZoftkh6TJuiljukCpuJi+pK
 tIJb2HFYuFhbQirpZzq181BWa5LUfr4FHmdcI2HOlScgirZbAHyajJ5E2+csgyyhCFU5Ysuc
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=68779c20 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZenZftWH51yG1dFpGBgA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 7qBqbsC7iHoDizUqueO7k5cs0BDZQW52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=715 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160112

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Ffor some reason we ended up with a boiler plate for dev_get_regmap in
wcd939x codec and started exporting a symbol for this. Remove this
redundant wrapper and direclty use dev_get_regmap from device pointer..

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd939x-sdw.c | 9 ---------
 sound/soc/codecs/wcd939x.c     | 6 +++---
 sound/soc/codecs/wcd939x.h     | 6 ------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index df71d7777b71..2b0aa2108f33 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -186,15 +186,6 @@ int wcd939x_sdw_set_sdw_stream(struct wcd939x_sdw_priv *wcd,
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
index 6bbdfa426365..18ccdba18291 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3373,10 +3373,10 @@ static int wcd939x_bind(struct device *dev)
 	}
 
 	/* Get regmap from TX SoundWire device */
-	wcd939x->regmap = wcd939x_swr_get_regmap(wcd939x->sdw_priv[AIF1_CAP]);
-	if (IS_ERR(wcd939x->regmap)) {
+	wcd939x->regmap = dev_get_regmap(wcd939x->txdev, NULL);
+	if (!wcd939x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
-		ret = PTR_ERR(wcd939x->regmap);
+		ret = -ENODEV;
 		goto err_remove_rx_link;
 	}
 
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 0ee0fbb49ff9..eba8205cdd0d 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -919,8 +919,6 @@ int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
-
-struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd);
 #else
 
 static inline int wcd939x_sdw_free(struct wcd939x_sdw_priv *wcd,
@@ -945,10 +943,6 @@ static inline int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
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

