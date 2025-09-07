Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E747826159E
	for <linux-sound@vger.kernel.org>; Sun,  7 Sep 2025 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244139; cv=none; b=gkztKln5QPfKZDWTfeaHsy2wYzn3cqENjoOR/bKsRYdOxYJuEOdEruLRsTY6ojL7Vc83Pxv7EUe/Gis/kjXcKnULc6j5PW9NBWqN4HNe5mvnXj8x37aeOKFHgSPqbYLSbmdMjzOhKdWeTdZQ4mJXcWIqwhgS9u+wx7dGZL2oyQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244139; c=relaxed/simple;
	bh=RaGs/JcYJazl3T2QABS2PSlg4s45XNkUmSTbNSq8uvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f3HX/U+C4hmmlB6/MNb0lLHAHLk/SrWEjsoLmETM16LY7JnpaUYzpbs9GBnPKWUQn+/Pi1LIiJwdT9NaoOedtUY6SF/M9YX7HIBt6HvcACBlxj2Uf+8/027dCrPVAaAXke3yXEtO6y5XePyCMnX4ycqXh2aFk9+7tGIs/eKuO7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSJTT50w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSJTT50w"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5878jdNt010918
	for <linux-sound@vger.kernel.org>; Sun, 7 Sep 2025 11:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rLqhhlt0UVl
	462APauRQDyDpQSR6L5J1VPQ3O453Elg=; b=XSJTT50wJq4CNJnbDfFQGDhn3HG
	UT8BHAhf3oBT2y0mSyOuWCQhGE6e0VpLeneCqHek0k2UF/1KPCubdWh/6/cbrZxO
	bAZgqifAhdPY6dQN44gfIOuQSOfganhTU8QrkEIihLOwdyM2I/hGuB5m/1bTkKJG
	QgwNxE7Oxizs1RrW2lYoj1QiC2VlZNnk0H15SyQjR7T8XriYuNNUgayUUNr467KO
	HWMVxmbqFzUQJSl+/Fw4Kvy7K5gBSpS1VwFS7SNc0+4eEYblPfWkY4y5cFEBfUO+
	4O0MHeesG7gd8p5P+KDYQKZByYKM24dvNgaEPnCRKFxOt2bD5HMilhH32gg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d1va0w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 11:22:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7224cb09e84so79882136d6.1
        for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 04:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244135; x=1757848935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLqhhlt0UVl462APauRQDyDpQSR6L5J1VPQ3O453Elg=;
        b=LQS77D6ifYE55l5AoF+ME3OH1bdiYC40CIcQVY9tZiy3u0NKT61fFe2rwDCxB7tWlZ
         kN9glkF3slpWRIM3uN0YU+fHnXQ2AmjzPgqc1kBandoJFCqzsllgpSvQNBV2J3XYu91B
         9Vfn/9hKWNwLoXAkpUb1yc3J1H5JjjnnutEJu3PwLwaBu1hqXrJZI8HpGhi13s7xFfhH
         NNxue7o9nm2y/+JUaLtbtdq5ESCugrzL81nel51ArpoZ9FcwsS3KJIC2HCRpo3hLrGVX
         c9f1UGETcANLtbTiT5Qz/2805ApN5IXPvtH35yMvAZYDnrCEyukVImBVZ1owiZeEmTPP
         XDuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT5O096XaTleUbKvyZ8y2OUubS8MQTxpWwgtd9VutPb0J4ur6n6nsz2F/QLaec1e4PoCyu0EuyZrrWcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMmeIRxXJuq/8yHlYLT+xw67qxylhaGcgddm0RJMGUCax/t5/
	ZBt0TA7hBe5Mar94vZpjhNto0pxOoed4XKoFhcdJw/nt4xq4ZtIVDN6Z3kLQ//wrXVXFB7tUl2E
	q9TBg1MOS9gW2seFbFQSsbyZVALbwKmBZ+Xk0Ot1DD0f7oiQMf8YgwtDjGiT+UjaQ5w==
X-Gm-Gg: ASbGnctnw47ibYzo0w26fHmKqWZdaQEBhUh320Rp4dolOrwRlzXAlR53QCSscDfrFEO
	JOViHJG7UBrhVNAAXHR43KcYa5Np1/PG7rI9lGBCzaJKYbFEAn8bDcooOvlM8rCqM4dZ1dE8cg0
	DMoVdfW8/fLKKtYYju/M4pXbGLqXuEJBlQ8xhC+SVwW6c3HSKWh6CihDFFjlb2jxY3sCWTXqmZ+
	MBdCJp6xaR3Oj+J1ipEQTy7RmfJThHVwZZZBNXuVgxut4Rtqj4f5oqpFH8HJ2hsaXGDUJtWIPff
	hTubQG04ZrxSRnYE2xGhEsdutItQPxjeSgKpNl+2JJE9Z3njGB1XPQ==
X-Received: by 2002:ad4:5f8a:0:b0:721:cbee:3a6e with SMTP id 6a1803df08f44-72bc46d687dmr112669056d6.25.1757244135504;
        Sun, 07 Sep 2025 04:22:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9fQ3lQ/zOl5+ku2IT/XJU8YfYuiWMJ6J1AdFMTwN/bft0qt25NfO+mPTIYFbv5X4VWF4JmQ==
X-Received: by 2002:ad4:5f8a:0:b0:721:cbee:3a6e with SMTP id 6a1803df08f44-72bc46d687dmr112668936d6.25.1757244135045;
        Sun, 07 Sep 2025 04:22:15 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 09/13] ASoC: codecs: wcd-common: move component ops to common
Date: Sun,  7 Sep 2025 12:21:56 +0100
Message-ID: <20250907112201.259405-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: e_Y3-DxprkP8iBqF6dbcPVViFcrrmCTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNyBTYWx0ZWRfX8upXJIVMPBFL
 VWxebmQhkcap95gq00FbrC0v4qg9qhpxIvIQrEDFxfivN+FkWvcW0tRNKqagcaG01Fv/Usnc+vL
 TMX+TqTvOB5knQ3LcTajpzR4a5jtPDfPmfXNjTzMJqa1CVAiQF4oFMZdMUIKeQU6PcTKQwkYLKK
 CQALZv3ba1gy+96ZNdwtcgAbYmLBuw8P9MMbsUE6cZhARAo92jX2VA4PPk0g2nyo/K7hnuxiY6i
 VWsZvdDw3pgtzG36EvMlcx7A8daPIWrGIeXlaw9VmbKRfbxKYLsrU1t/FSqxSzAUmTAwH4KN3M5
 D99mY8LJuI+eyqX6JvMGe6io3jBNmmYGjfzo8zHK+AdvHk+5O8Y4J1sxUXliY8X5lCSMrmCSsDm
 +RO7APdL
X-Authority-Analysis: v=2.4 cv=cYXSrmDM c=1 sm=1 tr=0 ts=68bd6ae8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eQjB__F64b99YC4tFhYA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: e_Y3-DxprkP8iBqF6dbcPVViFcrrmCTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060027

component_ops for wcd97x, wcd938x, wcd939x soundwire codecs are exactly
identlical, move them to common driver to remove this duplicate code.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/wcd-common.c  | 27 +++++++++++++++++++++++++++
 sound/soc/codecs/wcd-common.h  |  1 +
 sound/soc/codecs/wcd937x-sdw.c | 29 ++---------------------------
 sound/soc/codecs/wcd938x-sdw.c | 20 ++------------------
 sound/soc/codecs/wcd939x-sdw.c | 29 ++---------------------------
 5 files changed, 34 insertions(+), 72 deletions(-)

diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
index 25c0a48ff858..585d3e036900 100644
--- a/sound/soc/codecs/wcd-common.c
+++ b/sound/soc/codecs/wcd-common.c
@@ -7,6 +7,8 @@
 #include <linux/device.h>
 #include <linux/of.h>
 #include <linux/printk.h>
+#include <linux/component.h>
+#include <linux/pm_runtime.h>
 
 #include "wcd-common.h"
 
@@ -66,5 +68,30 @@ int wcd_dt_parse_micbias_info(struct wcd_common *common)
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
index d94e8879a1d7..0d4e9f8e39f2 100644
--- a/sound/soc/codecs/wcd-common.h
+++ b/sound/soc/codecs/wcd-common.h
@@ -34,6 +34,7 @@ struct wcd_common {
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
index 1dc13b6fabfa..92714aef09d5 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1182,22 +1182,6 @@ static const struct sdw_slave_ops wcd9380_slave_ops = {
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
@@ -1262,7 +1246,7 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	ret = component_add(dev, &wcd938x_sdw_component_ops);
+	ret = component_add(dev, &wcd_sdw_component_ops);
 	if (ret)
 		goto err_disable_rpm;
 
@@ -1280,7 +1264,7 @@ static int wcd9380_remove(struct sdw_slave *pdev)
 {
 	struct device *dev = &pdev->dev;
 
-	component_del(dev, &wcd938x_sdw_component_ops);
+	component_del(dev, &wcd_sdw_component_ops);
 
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index 97a829e3ce4f..6aecad2a28aa 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -1378,31 +1378,6 @@ static const struct sdw_slave_ops wcd9390_slave_ops = {
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
@@ -1466,7 +1441,7 @@ static int wcd9390_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
 		regcache_cache_only(wcd->regmap, true);
 	}
 
-	ret = component_add(dev, &wcd939x_sdw_component_ops);
+	ret = component_add(dev, &wcd_sdw_component_ops);
 	if (ret)
 		return ret;
 
@@ -1481,7 +1456,7 @@ static int wcd9390_remove(struct sdw_slave *pdev)
 	struct device *dev = &pdev->dev;
 	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(dev);
 
-	component_del(dev, &wcd939x_sdw_component_ops);
+	component_del(dev, &wcd_sdw_component_ops);
 
 	if (wcd->regmap)
 		regmap_exit(wcd->regmap);
-- 
2.50.0

