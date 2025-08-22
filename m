Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA332FA0E5
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859779; cv=none; b=rcLO89bwJ18M/D8Vh4/hJkSwiWy7XQNvO0zWWLeWjduW5u0kNLh75MLkegM6+8LclUiLfz6zezKbWqURUU9HOiP3mLZhtq2g/v3Qu8GiISFL9J+jHrx38/CMtIsKHF561kwfIgSrDN9NDp9Daqo6ckYrGVjT9YN56OLNNgUqbN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859779; c=relaxed/simple;
	bh=asxvysqqAjgkKstONlIrpBzxu2GRO9SXusBJVqCmX5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iU4HjqG/OTiei+4sXyB65RiUIE/9INDbWQ2jK2Wzsh/oQSZB1C+PWm3u/5zVS92LN39lmw+53WS8/hg+LvljWAS2XDgu6G5tyKkzb+K5+09RxT68dOoYEYcEZhEWqOHN0BOL/4j/dINIe09xuyr28SO9uT5VYsmUGqq0LB5ScLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hO9XTDjW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hO9XTDjW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UH4Y005806
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WCblndB5WM/
	7lEa4Lxpv6vxarG8aRPyFWHgtcjT569A=; b=hO9XTDjW1Eq/ynBaonlnvuT/TGr
	Lo/up7YFycRVngRSwP5vC211CGfK5jE5zLxNggmmdfGN29m9NZmEcRASQcxyEt1J
	7G+seHnBPib6twNe16KSOePt7La0pNzw354AHv3oLGK5MCEPCq9DbWCsByZz4Fe5
	QVh4jmia8xUbeUZWfbuK5VNDQyYKpV9K6Liel6PTIDci9TT6vSWB0cdf8SiKt8/L
	CjWJ+X3JitWdmRoYQw5fmQUzQWb0cqfINxMwVqgW8lyv3xOHbX4VeFyhZCKtzTWu
	fGylvbqfjTdXz+fyQByTfoj3Hg+lNPF3FvD1voNY7HMNf/krumTZD6+s6mw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290wrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d9f5bdf67so8703646d6.0
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 03:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859776; x=1756464576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCblndB5WM/7lEa4Lxpv6vxarG8aRPyFWHgtcjT569A=;
        b=ED8NGeZY3uJyBlL7ZecT3/M46oYRyr0t6Q4XiMfxz17cG/lREbfM1cUa2scxx5vOAQ
         j9Y3HEMq0gY/L4wtZGglMZFBNglzDcCykL7zKXj3VkSJnDSQyvvP8tmnwO5ar04UOn3w
         Mj9PTcEGaOsXZZ5+IW4/mogpbXYF5lArYP7Y72uSmPGB+YErFgWB6U4NbU9OQdSl+aJJ
         zN22TrFjdUqxg6iswjdffA8nxyNzlw3JfICwzfF4+JiryOhyUBtBvmJF1GXd049ko31y
         PBoAeLgwA5jjHrKjqjjQzZOpDZkni7HIrpul6iSDBSMG5MJH5zw0aDjRTq4MdyQrtSQj
         hX4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtPRb053PmT+PI6uiUGdi+9SrUcj0C33IZJz2lnoguT+So/VCI6KV0eoeMGhOnc7iRFKjXyTWHthBPsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznJ+Wu8kjrQoSXi3GH51+jwXtf+czV5wtn6h/+WmRuD9RSq0g9
	bIDvKW7iIU+uKSDj5/GGPjr4jiZJEJwCKHbYHcmS7ZpnO4vo6Y0sgQwIbxcTowD7N9CTl8h1nQe
	apD/oIwfLUEIXxZXDk+e6ohfnoWz5yQX5bfor0dcU7wiHPSvGcEh65xKQR3KdjTix3OmYwRyF9Q
	==
X-Gm-Gg: ASbGncsZ6kJ2RNI1DCW11SanjaN+mqrVITJyKBxpkQ6ahkGI2v5y12I4PxGpj+JfwLA
	0fqlyNQN0UwkQSyjR19vn+aNrwH2fq43TFPBEGsjNoUSi51N3VQsoCEh3f9NnuMU6ndojbIjj1P
	KDo542cSOvREQ7Ewv5Ze9y3SW40VIrdcx5WTosIiB61ScvV9PYEDC7Hi3t88y1fMGb3e9KoNE9u
	LH/J2MfgggkFXtAcVI6R50OX8C+BRQQIDfNQx+VL7H/e7BTeXQURUq9kwfTQP9JgbSGMlSHA0CM
	bxzSiV1yb90GQpQrLXfuYogCZgkJshQ9NzVZSYCwyUvgtEPAbjLUfw==
X-Received: by 2002:a05:6214:500d:b0:70d:6df4:1afb with SMTP id 6a1803df08f44-70d97259921mr28591336d6.57.1755859776099;
        Fri, 22 Aug 2025 03:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1sltVyJoaXvdkN/CS1sTPSfuTTarGRljY+oqL1ag+7erN2DvvnbX/OYAcjAovJ7/4cO1sLA==
X-Received: by 2002:a05:6214:500d:b0:70d:6df4:1afb with SMTP id 6a1803df08f44-70d97259921mr28591146d6.57.1755859775540;
        Fri, 22 Aug 2025 03:49:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e4249bsm31367155e9.25.2025.08.22.03.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:49:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/8] ASoC: codecs: wcd939x: get regmap directly
Date: Fri, 22 Aug 2025 11:49:24 +0100
Message-ID: <20250822104927.2621866-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a84b41 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=lWraB9NP_8A8gAq8GzkA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Jsvp8YH390eWE2hPclX5gcyEV7B7YFjV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4VCCZdDW8xfk
 /+ACgM217WimYqF9AmAoJCFymMJjtpoKSk3BVHRllPTeBKEhhplyQhkZNMxw2VlElRn7UpRU2OQ
 Q6hjskejUE3r/QUfH4UFWVxF5ulkYeY0KzlPEzx5l/gIeUtCM1UtzTu2B2bRP/gkoWBeGbHCg5Z
 TQr29199BuBBMRqbEdz2Zhobvb5YVxHLR3CXQ+DSG4kCV9MlbGu8QIavp6t3KICOT1IYAb94FGW
 MbUn9sCXUEBAyWWCjfRv15Rzugv/jmDMp1Jjgyr5W/BdywXOb4uXyGn2s6dn/zAIdoiAVfG1TPs
 Qky3g6vbx4IpPnh2+DleId7HoOisFk65/sZyofR9ez9InPxoNya+ZA4UlvHwWdZscM7ZYRg+kco
 VRfz1a1IFLiXKw8V2yCbBD6MBZLrIw==
X-Proofpoint-ORIG-GUID: Jsvp8YH390eWE2hPclX5gcyEV7B7YFjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

for some reason we ended up with a boiler plate for dev_get_regmap in
wcd939x codec and started exporting a symbol for this. Remove this
redundant wrapper and direclty get regmap.

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
index 6bbdfa426365..ac45699ec067 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3373,10 +3373,10 @@ static int wcd939x_bind(struct device *dev)
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

