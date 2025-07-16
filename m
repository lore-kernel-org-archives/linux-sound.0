Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D462F50A7
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752669216; cv=none; b=L4Qpkji2yQeCvcOmjBWZiCjROFIfPbCGXLwUU9UZ1x7VtuYJeuyC0XCbHvacP7BACvsIZI6nROay/NJPayCKERzAgnFy/LSTOR0lQfR2GxFrtAnQBnJFPJhj4PfExQnVIF0NpaxHdKcktgBPYqg7/HLO7ppukkBSmWapTLvd06Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752669216; c=relaxed/simple;
	bh=zjhVvqySrSwwnLW11WVGyKNG12Gd3+0QhOKhI4XLesk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CtY+jGYbfRBGxDXnPu9o/ixhmHW2dtthFSS+2//wCVkAenWvO2CH+wUTf7nfm7S6+Y5t8PgUjWsxbZ/AKJJKZEVHcvr38qxFqRoRhCcpAbursc2q63vzbzAI6XL7653owxnghHJjBbp/Q7kwQ0semuBIipQiDUYA3Kmxgk2SdJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=go8gXOA8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="go8gXOA8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G63X9x029576
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 12:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R54aSxowHXp
	RiRjvZplb9BA0g0wx/yEa6TgqmAyLwd4=; b=go8gXOA8B82eFopyyptiL8OFTq4
	94Rxse6jI0Rew729F1XpyMsf4d4ExC+v/QZgLi9KEbumF+AzsnYq5iZqiLohNIlH
	RGilJMJ7chQs+dAW1MYr3jS92e657cqL9wWSn54uqF2zK4KmxdP+OVUNopqkoodQ
	lDRvy9TtPj2MhXzCgi/UjTryhFn6Easg4qsCGvKzSZoTWglNF9YySs4awYXlwogA
	bMxn9gDWciX4Cj5VEEf3P3/X5PwohuLf9HrggFBv173anFwf0xy3qaj8iKIew5mQ
	88dQVHl3Jus3WufKMbu9XBAxg0n3TqLZjpAdiSJoXXsbQ6wCGYxJRDoKatQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb3why-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 12:33:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e207330a45so556546385a.3
        for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 05:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752669212; x=1753274012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R54aSxowHXpRiRjvZplb9BA0g0wx/yEa6TgqmAyLwd4=;
        b=Nv5776rDtYoF7eZQ03BA3OpNZ7Kq059olHoHcj5ggQDRNG6/cyUwoMWHqXQKxP78zy
         6ymjPYI+0/B/E9qp7d9B5rZoKJieuw2ROcKjpUksLDKB5I3UP/9YbDrdXNPI+nqRaunx
         hczg0PH6szdZH9rAqInQuJpd1jUVsvvUFkMbNR7DRpgxHrCXZXwu4DsKTHXNv/CS81Yz
         +VizIavKO/M6o/qXIOlg0c6r1yXN/j70+l0p6xPi9//ghYylMfiInzoAM++/XS/1fajk
         KZwFPow+nYa5Nbvdmg9qlKdMNbd+jY4PtQBIMixdjNaqSqi5QsaPax2JI+4MAD9XUc2A
         /7LA==
X-Forwarded-Encrypted: i=1; AJvYcCU/8gg7OyPUBAvxlS8hCcbN8kw/4HGJC01aYEYKFtiqL1UBnPSWNjXR//pgV21HPFUEBghxVo+ybEaA3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnmmTEUMkKSNM5cm/u7HUBoEf66fFUXmwkVE705j9pDPbkSe8Z
	ZkuCMnmuCTK67O0JIGcC0dL6/DZCKC3UdOYmFawkEfieOGg63/76p3DJ1zl19dkGHbrjq2M2EXT
	Tef9P3RlBAcYJMf8lXzOxJC6pQs5zOzFFGVC0B3tWnYIKqMDvHtoZXQqG3mEAiZvYoQ==
X-Gm-Gg: ASbGncvxTo8AeYyE9upAa5nNuC1Zn5JfhrXSgNkcliCzAy1CljuTJLqUa4Z6p9UXHoe
	F9Qs6TfySdglsy/TLfq4mKCSqi9c5VsoS6HSvy8CzBTDYerPMEanzGNXwbkDorEVz9zMtmtQf8n
	/VqPjcSFrs0nSZzLL8g8gEG4VsxBWE8SPMVceK3ti/TLD+Ut2nAw+ZR1K5Yv55ZfoeBcX6PM7N/
	CPIi51T30AoF2/skXI/RHgH8VoF8hs4IhzpBZNwABYdR0Woo92hxq2zwvlzEeuXLESkuRq6LjsM
	WLTlI3s2NATPjLI7FLM7w+V/LpIJ8QBy72w22WqilNFcMlyLuRZMqA==
X-Received: by 2002:a05:620a:44c5:b0:7e3:49b5:d53f with SMTP id af79cd13be357-7e349b5d6b4mr66928985a.34.1752669211889;
        Wed, 16 Jul 2025 05:33:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsvE+VqtNvxlt0dhL+n9oaGEyO6NZwYTFbdXlPWS1CeSWMSp3UiwpgsU6Vom+DApz6OG/vjQ==
X-Received: by 2002:a05:620a:44c5:b0:7e3:49b5:d53f with SMTP id af79cd13be357-7e349b5d6b4mr66925085a.34.1752669211381;
        Wed, 16 Jul 2025 05:33:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e89c739sm19453335e9.32.2025.07.16.05.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 05:33:30 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/5] ASoC: codecs: wcd-common: move component ops to common
Date: Wed, 16 Jul 2025 13:33:21 +0100
Message-ID: <20250716123323.5831-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: Uy9CeY4bgsgl-0QHSasDQsKjdHhXtbSc
X-Proofpoint-ORIG-GUID: Uy9CeY4bgsgl-0QHSasDQsKjdHhXtbSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDExMiBTYWx0ZWRfX9jNtu0NEK8HJ
 AkQBYPs4y8AUFbvPDbAi6TihOLznsIwNEMrtnA8/ohXHMQbIUZ0L8P8qWIBOdSE4jmqbNRwChnv
 1aEMfECVYAWKg3pqfv/n/4V45rVMX2WtA+v4O4hsbuUduJ2Hvh7pLJkKUFK19B4G4229r8nVigF
 ghRhoj0nsD8yD7ia+o12JZ/B4IGSGkhuEDV7jeVP7cUHvdiUPvBPxCjBVfc0u2fGw/nhs7ZddtO
 bnzDlTJPzZqL4VyY/sLKalQlASV5N7QefpPq58rOQy93CEbxDLqBaOZa7g6F93aZPNCjgkbASaQ
 v5ytnQdoUamRkbMKrYz8rxDVq3o4TjQagE0QzOyzj/lTO5JPRsy3//l6Ku5/j2PmYeBz7QT8+aw
 aWA/4LcSZkqh8rzC4Un3Iu9ov9nHtpRz2X9oNMy/NjBGb8kk3rVOoXEe9s+EeqFo90MOmcZm
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68779c1d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=eQjB__F64b99YC4tFhYA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160112

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

component_ops for wcd97x, wcd938x, wcd939x soundwire codecs are exactly
identlical, move them to common driver to remove this duplicate code.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd-common.c  | 27 +++++++++++++++++++++++++++
 sound/soc/codecs/wcd-common.h  |  1 +
 sound/soc/codecs/wcd937x-sdw.c | 29 ++---------------------------
 sound/soc/codecs/wcd938x-sdw.c | 20 ++------------------
 sound/soc/codecs/wcd939x-sdw.c | 29 ++---------------------------
 5 files changed, 34 insertions(+), 72 deletions(-)

diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
index dffb0431a48c..0c1ffa015403 100644
--- a/sound/soc/codecs/wcd-common.c
+++ b/sound/soc/codecs/wcd-common.c
@@ -7,6 +7,8 @@
 #include <linux/device.h>
 #include <linux/of.h>
 #include <linux/printk.h>
+#include <linux/component.h>
+#include <linux/pm_runtime.h>
 
 #include "wcd-common.h"
 
@@ -62,5 +64,30 @@ int wcd_dt_parse_micbias_info(struct wcd_common *common)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(wcd_dt_parse_micbias_info);
+
+static int wcd_sdw_component_bind(struct device *dev, struct device *master, void *data)
+{
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static void wcd_sdw_component_unbind(struct device *dev, struct device *master, void *data)
+{
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+}
+
+const struct component_ops wcd_sdw_component_ops = {
+	.bind = wcd_sdw_component_bind,
+	.unbind = wcd_sdw_component_unbind,
+};
+EXPORT_SYMBOL_GPL(wcd_sdw_component_ops);
+
 MODULE_DESCRIPTION("Common Qualcomm WCD Codec helpers driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/wcd-common.h b/sound/soc/codecs/wcd-common.h
index ee101f8547d5..deb78241236b 100644
--- a/sound/soc/codecs/wcd-common.h
+++ b/sound/soc/codecs/wcd-common.h
@@ -29,6 +29,7 @@ struct wcd_common {
 	u32 micb_vout[WCD_MAX_MICBIAS];
 };
 
+extern const struct component_ops wcd_sdw_component_ops;
 int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
 int wcd_dt_parse_micbias_info(struct wcd_common *common);
 
diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 8f2819163527..59c353cafd31 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -983,31 +983,6 @@ static const struct sdw_slave_ops wcd9370_slave_ops = {
 	.interrupt_callback = wcd9370_interrupt_callback,
 };
 
-static int wcd937x_sdw_component_bind(struct device *dev,
-				      struct device *master, void *data)
-{
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-
-	return 0;
-}
-
-static void wcd937x_sdw_component_unbind(struct device *dev,
-					 struct device *master, void *data)
-{
-	pm_runtime_disable(dev);
-	pm_runtime_set_suspended(dev);
-	pm_runtime_dont_use_autosuspend(dev);
-}
-
-static const struct component_ops wcd937x_sdw_component_ops = {
-	.bind = wcd937x_sdw_component_bind,
-	.unbind = wcd937x_sdw_component_unbind,
-};
-
 static int wcd9370_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
@@ -1093,7 +1068,7 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 	}
 
 
-	ret = component_add(dev, &wcd937x_sdw_component_ops);
+	ret = component_add(dev, &wcd_sdw_component_ops);
 	if (ret)
 		return ret;
 
@@ -1107,7 +1082,7 @@ static int wcd9370_remove(struct sdw_slave *pdev)
 {
 	struct device *dev = &pdev->dev;
 
-	component_del(dev, &wcd937x_sdw_component_ops);
+	component_del(dev, &wcd_sdw_component_ops);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index 40c6896eb781..e43d6ac1c913 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1181,22 +1181,6 @@ static const struct sdw_slave_ops wcd9380_slave_ops = {
 	.bus_config = wcd9380_bus_config,
 };
 
-static int wcd938x_sdw_component_bind(struct device *dev,
-				      struct device *master, void *data)
-{
-	return 0;
-}
-
-static void wcd938x_sdw_component_unbind(struct device *dev,
-					 struct device *master, void *data)
-{
-}
-
-static const struct component_ops wcd938x_sdw_component_ops = {
-	.bind   = wcd938x_sdw_component_bind,
-	.unbind = wcd938x_sdw_component_unbind,
-};
-
 static int wcd9380_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
@@ -1261,7 +1245,7 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	ret = component_add(dev, &wcd938x_sdw_component_ops);
+	ret = component_add(dev, &wcd_sdw_component_ops);
 	if (ret)
 		goto err_disable_rpm;
 
@@ -1279,7 +1263,7 @@ static int wcd9380_remove(struct sdw_slave *pdev)
 {
 	struct device *dev = &pdev->dev;
 
-	component_del(dev, &wcd938x_sdw_component_ops);
+	component_del(dev, &wcd_sdw_component_ops);
 
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index b5a35c3b22e1..df71d7777b71 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -1377,31 +1377,6 @@ static const struct sdw_slave_ops wcd9390_slave_ops = {
 	.bus_config = wcd9390_bus_config,
 };
 
-static int wcd939x_sdw_component_bind(struct device *dev, struct device *master,
-				      void *data)
-{
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-
-	return 0;
-}
-
-static void wcd939x_sdw_component_unbind(struct device *dev,
-					 struct device *master, void *data)
-{
-	pm_runtime_disable(dev);
-	pm_runtime_set_suspended(dev);
-	pm_runtime_dont_use_autosuspend(dev);
-}
-
-static const struct component_ops wcd939x_sdw_component_ops = {
-	.bind = wcd939x_sdw_component_bind,
-	.unbind = wcd939x_sdw_component_unbind,
-};
-
 static int wcd9390_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
 {
 	struct device *dev = &pdev->dev;
@@ -1465,7 +1440,7 @@ static int wcd9390_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
 		regcache_cache_only(wcd->regmap, true);
 	}
 
-	ret = component_add(dev, &wcd939x_sdw_component_ops);
+	ret = component_add(dev, &wcd_sdw_component_ops);
 	if (ret)
 		return ret;
 
@@ -1480,7 +1455,7 @@ static int wcd9390_remove(struct sdw_slave *pdev)
 	struct device *dev = &pdev->dev;
 	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(dev);
 
-	component_del(dev, &wcd939x_sdw_component_ops);
+	component_del(dev, &wcd_sdw_component_ops);
 
 	if (wcd->regmap)
 		regmap_exit(wcd->regmap);
-- 
2.50.0

