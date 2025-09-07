Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8E02676F4
	for <linux-sound@vger.kernel.org>; Sun,  7 Sep 2025 11:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244143; cv=none; b=BlY1S32LqnSKu7oRc/ioR/HIr/4adG7Pj6u60mNy9bGkahUVyaLOi5W5oF/cAhnmBg9YtuiPbTLu8ETaJpdw21VNAWGcuBG9vRBeFBJTpzW8EguDM8FwiyKSuix2O1qlZXfG6WUBwojpATZVqR2a8kvbeBDijnnv4ukXoK3yqDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244143; c=relaxed/simple;
	bh=SVUoWsmSq4cUO/z4U/2qlZs54P0s1u7ZOQr9dToLxZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VnLxz/S4nXwvrkze4fkymv1XIz/gxheB18WQ1FCMjjbakRJjzG9QcuKXneEow1zJ+TPVmvYBVKbFUFcSpsggobLua0l4fTW2ZMObxRzMWz1wutZxuYrRHpA2dAKiUKp4tP4Ja4MuGeKwKjgWgx21tF7UZdD6jW72DVYzlrDugOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANQaIphG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANQaIphG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5878jQtI031125
	for <linux-sound@vger.kernel.org>; Sun, 7 Sep 2025 11:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/aX4MrtepdT
	dnJU9juLKPIRgCfBEk58eXLQDBNRQG8Q=; b=ANQaIphGDLXlfwEXoBiWUWoKv37
	ivh+R26lHsvkef3lGemWHYeKtmQK96nnGgSOt7Q67ulXzxSlNy/yf7F9DKaWLBIV
	ZxDVl0bRj/GLo6c9vLIClidFpmiV1ACdN0ZzhnFhMfSS5J7q9odQHREMF+K4dV+7
	UKeF/S4s1Ckh8dLG3IZCECFziCeE4OPGRdXoQHqqLD46Dsvgk3Mvq0Rv614xrNb8
	WANJFt4mkZBDQJ8XyRiEUvLUcLnQSFC7Aa386DY76YoySHfExI2aa5DB1EyNvtbX
	oBOncpWa0YnoLYwdO7BlkJ51xDnXKAId23M8Pl0gtsUVR4KSY+bTeTP3cLw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapa7tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 11:22:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7211f13bc24so74462526d6.1
        for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 04:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244140; x=1757848940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aX4MrtepdTdnJU9juLKPIRgCfBEk58eXLQDBNRQG8Q=;
        b=FXAd3gV31jymX6pJbyyqUlIqlYGilOa+Ze8feTVf4FK2XJAlGnJEW8PSbrn1JBNvqT
         hF4IucDbIaSvAMbSbsLMlGO+gStaFoJpH2iufrDj7Kkhgv9Cs8swYUke5KU7RDP+KjUw
         Vqdv9o85HOcuvXZgPnRLJIw0oe8QlpCYZ6B6aQEGBhYZs0np7wfWag8qgbcmy6jGqSYE
         lbIda087ZFscfJ4EzRepERMfXWw85+oeTykQJW0QKrKKpvfKSE6CUf8V1WW+PmKTHSju
         0ErYE1Qc7PMhWnEwcWmYO7IHJpk/rq+TZ1zWS0R9tAUaeLPdlyvHRo6C2w6iMtAlk2MZ
         nJhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoPKBrA0GA5MY8tLQrp6G5XO4oouFOVJYrHbnIh13cz2IGMFTD8XFf/jeL1L46LXti1BkWa0PdZsAflA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpPT6YiJFfDnCR2i8W9eAPZimQiuI0U7z0bq7Vt84ApJQ4NATS
	py6ivO9GwQLPayl9ioHb5zLcJ1ZHzCmKOSCytQuYom3Pr0u0nV4SNvtd6ejDVqjxankPL8iaWTE
	V/NZsaipHL5pjhq/Wg0kCDmnDOFi+ZgSyLNuHHlPRiXvV0ljZ2hwjJ05MsX4l5hw1nQ==
X-Gm-Gg: ASbGnctZ2c7Qd4ZAK2/P1lkl81knxPcB1ScH5eMb4gpV4nZzUblpQB57iz9F2R5vVUh
	/xeXblE9yICGdle8NQqDabz0l9PKH9ed9ypSz4+UOvwPJlyhm/NpbxzUh/HEjyCu+l5QQKAr0/H
	HZ+Reipr66AZ1COu1BzyYacHYkDr9Dcq3nEWzbG4V7wdwR5iNJV65ZSZ2nxDqrug+PAhANmVsdz
	c4iVcFs2Wt2uuLrhieWgj/gaXAwqmmfJN6+hdjkPnLgPxHGt+69YrrBJkTWInsVYGt4dXvappID
	LlgzogGuGdCSrSzGhZ07KHwgMrb6RIJUEl0N10fx17kFZ8pTyVbOKw==
X-Received: by 2002:a05:6214:f66:b0:722:970:3af1 with SMTP id 6a1803df08f44-73924e25c64mr48223176d6.22.1757244140084;
        Sun, 07 Sep 2025 04:22:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZsw8nfk2wEUFy1R5sDtoXTxDWWeotu9Ny5Hm1V8/xZCSSNEEcWT8jL2YnaanIb9iQapti2Q==
X-Received: by 2002:a05:6214:f66:b0:722:970:3af1 with SMTP id 6a1803df08f44-73924e25c64mr48222936d6.22.1757244139637;
        Sun, 07 Sep 2025 04:22:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 12/13] ASoC: codecs: wcd938x: get regmap directly
Date: Sun,  7 Sep 2025 12:21:59 +0100
Message-ID: <20250907112201.259405-13-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68bd6aec cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AeW90Tct3s7Q8B8mPpwA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: yXfg8UOFt87hgS7hGKTEuWBPRG8Q45bo
X-Proofpoint-ORIG-GUID: yXfg8UOFt87hgS7hGKTEuWBPRG8Q45bo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX9n2XSQKsGNHm
 J7T9lMkvYRtINQBWjCMN+XpwmpH27kQNlQMtRwF0/BC2M6yhxAlXGAOr2rbFODH8sjiniOpvTKs
 36PpYQfZEd6VXmgzmthqY0h4jzaNsFbkarQLEg79tQLLMjWEBBj4b9IXaikXH/loUr9+Jyi07Zp
 +/WywMGXoa8qSNB7Geu6QrdGLQF7ZWyNDmSmY/kKImsoNWaitEJnhXCXpOl5y7RqPUB4FFWNYKC
 Sf2QRnzc7DoCVeWBwRIXPhKTKG80Ueoj37AI5p1TK2J9rzWMTTcvoXuT0YHFCFZA0k0rRPeJSXI
 HWEzW8IpPqxW9umURR+BKbkIKqXLuoSGjn4rJ6Zq0dvCuuuB0TbAZ3uKlLXkb36TDonSJ4/0GDX
 /A+4OuvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

Remove usage of dev_get_regmap, as this its more efficient to directly
reference the pointer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/wcd938x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index e495f98972f1..e1a4783b984c 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3389,7 +3389,7 @@ static int wcd938x_bind(struct device *dev)
 		goto err_remove_tx_link;
 	}
 
-	wcd938x->regmap = dev_get_regmap(&wcd938x->tx_sdw_dev->dev, NULL);
+	wcd938x->regmap = wcd938x->sdw_priv[AIF1_CAP]->regmap;
 	if (!wcd938x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
 		ret = -EINVAL;
-- 
2.50.0

