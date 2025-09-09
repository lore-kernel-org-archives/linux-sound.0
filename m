Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19D63376AE
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420432; cv=none; b=DNxcCy4MdVou01NCTP9ojJx2/4hVpi5ROo/qdjibheT1tknxMrswMaig8pxzEPsU0RapymYf7fl+i1nBFIcBsML24VbMvMgU60sW3L4EVaopfNHDW2mTajc3e92l1Hxseffqa0nYyLjbPLtRjaH4D6NK+Gz6R/stnBdKeMmXstE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420432; c=relaxed/simple;
	bh=Vob2QVOiy3TJum+gYviV62RlyAAAfxmjXX+ywQHAW1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=friTedh0AUWi+w15yvWIZwAHfQX7n3zFPczJHHe9wzTzNM6jrVke4MxHtmz++SV2miFiIx9PW3+hOki2TrrSWS9tCt4HlaZGDqgp8NVUqRCRcRBYMGw81I7Sh9/mncJjZ7VPD2/qTxvzSfSP2ktWhHGPYkcR02zDpOkp+vOv5DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mup4SmyB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mup4SmyB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LRcT029803
	for <linux-sound@vger.kernel.org>; Tue, 9 Sep 2025 12:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8G8MT1LjzV5
	F7x7h2zP9USaReyOZ6QfiVzZlkcEwqQo=; b=mup4SmyBrX3q3NupGxjVD7ylL3O
	d4yLScnxDeH4FNQGGIDQbx65SaIle3x14fvG3KUBi/v92eTD2ctopYm747WnKG2r
	/ebIzFVjLTXvIDjpTVnQNER4i+VaDmqkttrdbvzTIA2RQ4Yz6L9wu8ertV7VC/Q8
	YIbIPVQat7yenzmcLPXchlXfpM0IqhlXp3QtIoM/VPeImePgSjzva+6H3tb4zilF
	AJ6IKPBz0+p72QDrzi+VfFqm/PSLhB+8GjUo7FohY9/Zj3lhB1vbG+d2KPFazihr
	Ihz/eUG84ncooXYJYZHi8FBMVLMjtpYmoy2kp0gpVx7iW4S2dOH4rVOf0vg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37vn0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 12:20:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5e9b60ce6so130813681cf.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 05:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420428; x=1758025228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8G8MT1LjzV5F7x7h2zP9USaReyOZ6QfiVzZlkcEwqQo=;
        b=e70Ulel+dGjmF5rIIQIfFLemlwHBOjqVYONJGZxUmoAYRFkSAmIJklfHmo2t2+7KT3
         IXPd2Hj73W/sCfxP6d7CBOPz0y6GbwbCbhKcO04zjaspA/U5aqm7mp4amNXtd4/pzGkn
         Woanmkx/LTixUlKllqwTM8fQcGpHzXk5eQ+XawnMyiXOtt5L8ZQkYRrMC6MX8NIBWkp/
         GigEz2R3Z7PgtB0A8Y1LJDeHQB9QLGxrkviKEdoWKUiC8p8Ck0VH3wROET2BR6Pc38Jc
         mJFIa7OfNggdoUqV4YSVW0fuVTgNrx2SR+Fs0VRl+0+s5v3U1DlTMrZml2O+f9KUHznx
         +W6w==
X-Forwarded-Encrypted: i=1; AJvYcCUzuH/LVLAbrYZ/eSzbsYj4PCpuMmdDccEr+1GSsgLT+uMv/qVf7oznbY0AwMK939pDg/nqFajOlbVdkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmStsACyOz5t0xzQ3OMpetPzLbtEMSoB8VMjrLs5a+/SLpsfq1
	ep6UFyFYqFGACVUzBjSv8H3rI3dbasaD2rET1hxnLKFwzY2crOXW4vKVHFdxfRH7QOlhpP2dQ/v
	1ePARXY02u8iyn4Ao/348/R3/15g0W2FaNpiQk+tCnpY+LlLRshbbCH8g3ujEBH1BDA==
X-Gm-Gg: ASbGnct5QyhXrEC2vSyzHZAGNqVsLVTyt9lG+aB6zLY+qMYD3fv+YG3eaIRGPQr3Wci
	JqN2/n4jMgHkc6dXBdKHqrkXPrwybjR1vK0BoAW9tYPnkEhUlC555qaili9yt7SNc6olE9+POjh
	4EMLZeMItUZtJ73nU4F9DkZ5pbLlQiFWi/4TLfxGKGUhKvD6HJLNeZ/Lkv+QskrMT00jPkyyEGH
	XBxtpK9p9JwfQKUZIcgvhzM5yOHrX+r6GssM+ve5uqUcS4ek8Fah44/H75v8Tw+hTEznXAViXqY
	+YCMg3XGW/vDOtEiT97E3D15VLaXYdfvg71boQKS8U34CbNSymhVIg==
X-Received: by 2002:a05:622a:4816:b0:4b5:146b:4f23 with SMTP id d75a77b69052e-4b5f8593458mr120757111cf.72.1757420427347;
        Tue, 09 Sep 2025 05:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyE4o5g2tzXIgE/waSqSN++D8rmhx3Yy+KxD2D6Mc7aqdCmqk4G3HEZ9A5YJcSuuGHZBatKg==
X-Received: by 2002:a05:622a:4816:b0:4b5:146b:4f23 with SMTP id d75a77b69052e-4b5f8593458mr120756711cf.72.1757420426575;
        Tue, 09 Sep 2025 05:20:26 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:26 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 09/13] ASoC: codecs: wcd-common: move component ops to common
Date: Tue,  9 Sep 2025 13:19:50 +0100
Message-ID: <20250909121954.225833-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: JbwS7Rsf8ajbZ4BzZLAK5zNSU3Tsd5Yf
X-Proofpoint-GUID: JbwS7Rsf8ajbZ4BzZLAK5zNSU3Tsd5Yf
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c01b8e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eQjB__F64b99YC4tFhYA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX0vRWQrBwko4Y
 OXrjRKgpVHjcfcX1QE6l1/GGXp+MQNGb+dfIc6He5abynr5/lWDyD82qSpTqcMgxyml8X3VNq81
 qIguaOUVF/eV9NuCVdhBxcfqYBRMdKlGkx9eraHVbiohBa4YFyZ5RmUpPfYXiWk9uT7q2MQZWfl
 yV18K6f6D0etdZrsnMsNa7mQxW1ublYvJfuVuZgYuxTwU5HTTL+UkFj5tpZslgwi+ZvLiqIb5lJ
 DHBJcloxhX3sFyg+VAKWgW8VEBzKWQftnnr4Fd8YRAO8pxczmhV2EIHYaASbYFrRZDV/M35VUaC
 0ZdComCrJfFck3mcMohi1xw6ZVIlMfe3FpSZl+NsmRft7L/gWpUSHbrh+YVdT5K7qI1Y6KxQm3t
 9cHc335A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

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
index 8f3c0806cdc9..7a48cc5064cc 100644
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

