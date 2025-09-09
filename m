Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6516B338F5B
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420433; cv=none; b=KakkPUi9h/7+pQ5i0CzzHs69bByNTUsHG8pY4sSWeBai/Hc3LhS0b/31TKdW0IpHX3mDE9CTjtVqIL94ukp6oCopjPQkGpTDEo46qJVkQWOSjR56BDupCekjRpWKv6ca/Aeqs+MhraVqKVeb3vHj6dfBKkPOXI3Oc7/qxBU1hXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420433; c=relaxed/simple;
	bh=3K5xmPHboti1L/ErBrejTcSDf/a3Rugqu21m6y+BMzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgqEMX0UTsoCsKmKPKivqgHRyq80BaG6pLisblNx2J23in2+bcQnfWDt3f9aEG/f06pb9qhK8uQl/WtEg3ViBvHhn6telRNpGo9WIO8x4lKf7iuvIwoZ4fNsmsZNsvaxgdWGsJWAtXT7hJK1TMyDazdtjhsgUAB7wiFPtutZ8J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IT8Qnq3O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IT8Qnq3O"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LRuH009159
	for <linux-sound@vger.kernel.org>; Tue, 9 Sep 2025 12:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lB0PeZTreDY
	Q4uFWa9S5tmFsvOqmEo73wcjiWz8cRXI=; b=IT8Qnq3O0SyQxaG76SvjknEAwao
	LUMvaDLMmKxpAUmsKQAsRV8TUyWx4C/xCZeNaW79+ha0Ke0hGtAn2NnzWCpJd2AB
	8ePamP9xbbGzTYwZ1EKWMpencTO3L/TGUhajy8t1+DJRr9cR2G2KcAwfwGdhUDRT
	jt9o+3wNCpAXbPVcDYao5yGu3lV9OFO82M1aetgzt3S3HucJgFvr3tXSQHCq9IhU
	UQ4gD9Pv2wGPeYUt+dOLZ2RpWtVRevnSQ6wgxDI20ChQpFzQpmpXIIrZhAaxxdSL
	c7iP8Xs898NN5FgSFned4Nb6sDMuRhfNw6cOdDBCPBEkF8MQbWKEpFAZSDQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdvybp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 12:20:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-72108a28f05so219394976d6.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 05:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420430; x=1758025230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lB0PeZTreDYQ4uFWa9S5tmFsvOqmEo73wcjiWz8cRXI=;
        b=hFwKOTRYxcTXWHfloNbcjIlpW9TLaNNPP8V/wAASoUZMP8KtLbWJlc/zm7/zg4aMLw
         C2jUBODEYgBxbiG0P4aDZ/xsIJV+6TI+zHcWxie2+vkF0xtwJ6IUzvndz5jrW/EOiA4p
         QFd2xy6javcdWHwX3c0dMCm+mbiMUXNoxkGJLsFo0mWyDcBJXxY27Uh1pWfR87O/BGXF
         TpvnY/eyATtljQYREGchYVyK2h75TH/zGbEyihQPWhm6HU5MqLE3eqzW/IA2louD31Ys
         dQPAD+maaG3M+P5QI1L/ThV8sW87Gcs+AkAKpiV9JXE1fOqvVu9TJ3axRhBAWbo8sOI7
         teqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIKbgnt2aKqBiLd2Y1MqjnmiSYvmDRZY/rHsNMvbGnbIh5Q58+aUUfpeCrsiJeXX/wLOjx5QZFtk0inw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB+HUz6T5Nmq/T7jwR8CjdX6H8lDLbi0VapINxof1hRDpgKq0T
	OhB+mFO9xP7ULxxde2vm5vWl7LDNnk2hcYul1jEdLbB9oCfayHdSMZHAeSl1d8Pln1fvOuVrIsm
	prBDppBQvrGrfXdp3nt4/DOtDUagxCOcjsAj8t67dWBuQ7Na2GK1RaVzvNdRSPbfsOA==
X-Gm-Gg: ASbGncu4RqgQLOZwYqxOqUttFVZIazFNMwlKGn2303WcDwQf2g82vYwLkR241o8ZwOL
	nLMfodRIdWMU+ysbpQKlUKL+j04W/GvQ0kYHw+SAWGNTvJpbiqOgi0ZjPBKoDrJVMZdfJhWYcLN
	V5AY9y5GdteYL9K5HMcK7EpqkECkje4xUq8oyQCYw/zSw2TwhQcRCT5w2FmiVy80LuIa+FnOdOC
	mSZ99unGE4ugDbVYVVl9V2BoQ88Zvo+sEOt9mUUGdS4jwpOUWaUHIm43If1SmqDJuMlpPPMCqi9
	ZuA90EmXpnKLUJ3/e63u+V9F6CbkJhudzCSIp9wjo9XpcdOByiuriQ==
X-Received: by 2002:a05:6214:1d22:b0:713:eb89:2d83 with SMTP id 6a1803df08f44-7393ca97d6cmr108893326d6.35.1757420430211;
        Tue, 09 Sep 2025 05:20:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIkqRPqZ80G2kS2sZppCLlkzHqKSS7y8bRlsnibaLdSQA0Ndi1sbn9C8H832lif8DyRXP1Sw==
X-Received: by 2002:a05:6214:1d22:b0:713:eb89:2d83 with SMTP id 6a1803df08f44-7393ca97d6cmr108892886d6.35.1757420429603;
        Tue, 09 Sep 2025 05:20:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 10/13] ASoC: codecs: wcd939x: get regmap directly
Date: Tue,  9 Sep 2025 13:19:51 +0100
Message-ID: <20250909121954.225833-11-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: vs29YiWqoXedn89jzpJzyxiwI02n7A_D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXzYo9mTjGpCcf
 GW22YtJNSMI9YlzjvftcG0P7hqfRbsZgESuZ50ufJlCBIbqDTCoCYC4t8v5K5ZuvFisuqg5Txjh
 53xBn7LuBrIpDrr5/xq/AbuGptNFkrCMDL0sjG/tEaVVV0ocqL1DH9fjJi7Q6MlRxYRSMY7bgBD
 JwxU+nd1mPcu9gRfmjKN5AhSUsiiKD13MbHHem4oA+k3u8jZalIvvAvc7NJ/KWaORmVWCL6kMIu
 Oix4loN9TVnTXHioMPIjdeYysDB5CkXD8SZja1pf705uaigHUPj/c0D3p3t+mWoip9eB2+bUjx0
 LItvO/tFmlK3aM2hvDrwcXYB8LbaZ6uZr+7LuBmot+8R+nyptR6rRDq96SvQm9VtTGF+PV21T/a
 imXJscDk
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c01b8f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jWMDT5uzmWzhJut3sAYA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: vs29YiWqoXedn89jzpJzyxiwI02n7A_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

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

