Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF52A313269
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087092; cv=none; b=sH7ic+HKtbK/EF93Ym4MnRuwYuqlq60jAkKV7wdOQxH1xOhtaELuUq2MdgGX7CbApO54rYMOf06tvLj9yCmhn/34+D3DZMbkUiUFtJ1zXFrp9Df8krV8khPBgewgtpae4BBgunjS4yqunTKP3NnWscVDmnzPjVmcdQEmvOMti9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087092; c=relaxed/simple;
	bh=akR3Yzvusad4i+UCHWyqsSQvBIYsdFkmvXNaMfYcDRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9/F2+8PgW/ihWHiOGyIzFrHaqNc+f0XhYtdNjE5vb1/nkpjQ0cR1n81+Gik1Tg2XF5THrLTwy9a+hgRdcjzyfitkXnFbzC/VA+w8OyXpcor9BFK3PKz0KUekB0Bl3YSDmiKN2AP/UGWOM4xiwWl/g5eQPht/JSavAHIjtRieKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfH3DnsX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfH3DnsX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856tsQ5032189
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 15:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lZRvyA2vNm6
	fxL6Jok3NTa76zr2CFM+a5QQAwIqtQn0=; b=hfH3DnsXfaYQYAQaxk3qaca9ABp
	YyqyLU2Bx6rQwCqlMYz2UejRjwX7TKcKbnDBdVZZg01VhbLY/UOVcQKZxZIcBqUs
	6BXzvgQjLKRl09J2pw7wifQBYRTqWdX8as1bh01AL12BZWLrOO5hBhfKQSc9nZA+
	hFPgoSXeP4X9zVJSUgFz8/63pq9z//buhoLTnHT88FJ86AFJ4k1KTVU/fB+A7vZJ
	oZo79sU9b1PD4FEw7cEfpWs79jmAcRqwaQHOlLTpraWeXWdWCPj0kor7MMzKvN8B
	iz7xRbOb+tbV7SEKkvRgIrAjwYRYGrcyMPiAntGXQPzb+8aPQAqZfa4y4bA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpkrbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 15:44:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5e91fb101so33984811cf.0
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 08:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087089; x=1757691889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZRvyA2vNm6fxL6Jok3NTa76zr2CFM+a5QQAwIqtQn0=;
        b=QBerJKCa6LEWiehG6hgtR6aUz8/WS31J3nTjGvQOn6nX1AuWSs+cDYiNT0ydWC/Ins
         wrL4yVbUTpyj1CDXWc+j937sAeIKlcSK6i4gXgfNipAK6qHlxg0+xoO1gzSRQx7E2Axv
         LiulVnLEa6i9wrM8J8s9exq5E4Ow5u0cDIXTM4TiavvyHpCq2Z6kHFbglDif1L3OdD34
         vBhegEy1U4ifQEF1qM4UazdSf4aaUGX758Vv7eLuc3O08kpbYaUgmyHhDUUOGnBnhaP+
         cjtl40ML4XEQz8DhSpX3s1imCyWo72+Onfwc4cdSRfDyM/RtXhKP9/YJV9qBhQn3vtB7
         En0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaxZIZuAT/JcAG5qfOUmU8ste0kA9qQb8MabRuhBeKoKWMbho9XkncMbjIXG3hJIuFYbKCdphkMkpIRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAzpc4w5/9woi79ydV33wtB7sZX+cAopniozRO0EycqRb1gB5G
	AfQ1Ha1ZSAOzUYnRAlGfRh8u62bw+dJce+9Psk0HDkNfdPzza4ZG3tG8EhFBOELOKhDPG0nZazE
	Xa3VU57CNXc7tv3FTTSS87CVyYOanlRMHVs2oe23ED6xYVpi8I9GyBSi/w13mTbPXZQ==
X-Gm-Gg: ASbGncu1TgLSOU5IrkNdBq2aMeLqygoHfqUN7d9O4c6n0Ez/j3FQs3AcLLQ4S7WcYi+
	eT1JjoxF6N/rAkAPWrtA+ezCq1YIn1iPuFveHgedg4xpAq/zh7vGi6oKsfvn4rRdiJyXBGUb/ZP
	s74BE/nfBFH+3jNWGJu62D0XAfodqZFwCjO7QfnLRQdKahPlhwxf0/8amAotgJbzzKHeFmCIP1f
	gXiYOY4VRuypVWHgjeZuY4JFhreYStMKpkvefNaV4oS1j5yI45E7tL3KADwmkcKkWKjHegYdAjm
	wUg0Cbvepb2V8AFqNkjl7SJ+b/6JJv3i7BhJAB8VNmquxcwPa6JcsA==
X-Received: by 2002:a05:622a:a953:10b0:4b4:91f8:3b13 with SMTP id d75a77b69052e-4b491f83e49mr109615731cf.63.1757087088950;
        Fri, 05 Sep 2025 08:44:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSG0XGNMp/AQ4ikUx9DdF4h05Yh44/Dzm6gF3o/VyuLO/Ifik/KWlx9cIobfmm9FA2GXcPwQ==
X-Received: by 2002:a05:622a:a953:10b0:4b4:91f8:3b13 with SMTP id d75a77b69052e-4b491f83e49mr109615291cf.63.1757087088181;
        Fri, 05 Sep 2025 08:44:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 09/12] ASoC: codecs: wcd939x: get regmap directly
Date: Fri,  5 Sep 2025 16:44:27 +0100
Message-ID: <20250905154430.12268-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: UwXufIDw3KF4Va0dN0yFoMhVoSfSovkg
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bb0571 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jWMDT5uzmWzhJut3sAYA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: UwXufIDw3KF4Va0dN0yFoMhVoSfSovkg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX6I2WYsi1vofD
 FBXeMlB2tljmrmxLYQhiqQWaJFAlqd+1Kzw57zlMjti4qmUBA3xRZUUCo2bXcIHL0ANvHx85SqL
 i513/OYpPuyGwTtGtBREsCR9h7bR994++dZNO+lI1EZdoyGZFmyobmY5CwBxU7MdTPj0C+Fqsni
 oeJg8Mf0kYzF3ma25poQGTNR+3BD6Sku0H8C4XSCFIMfuxQJz2hkZg8CyvWYMf5DWI6FFy24Pxg
 MBi8lcPu7rCH+hbpT6DS7GAkLL39Ni2ukkNXDsFAHs0XgGZ7N5Uu0Jzme+rvspSqHBXeMisAcZp
 +2rrHhk1yXDxruZ0DgDrh56FnWf/5jBq5jvDZYUBgYVD2PVrhMMdiqCqrXivNiDi+kzfc0US/sc
 VXkXEkYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

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

