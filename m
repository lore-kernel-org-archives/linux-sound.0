Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02F22FC008
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859784; cv=none; b=KNVDZmkMNkkh3By3bD/iueVfTBMPgHj9B53SYGLYa48Yd7dtuRAFEuELhEwu95EVw2KZ32GEuDUMOaY6GRucV3/XWg79xpER3YRTwlZlWcKq6WofOnam7IrobTEkBg1DKh0OkC+kb6UNW1znAD0MB/Swf0wXOjJGlWJh3lEniRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859784; c=relaxed/simple;
	bh=/5tS1Na4bhQKzK4q//dUm4k/XvEXFSaGVZ5qLzvaXmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+Z74hzfuWys5FDsJMp0qoVP7HbHMM0Pcz61Di10cYk0kZ4kMjZip6d9vYpIC+DvmIaL3CXpU/xy/4jmKp5a7jfnWqQbVW58+06ut1YC946bWzjB3vrxewGa4l+3uvPNUOWqY6uXqO92pe1THlWwTw/nNg0r6Ey6w8KlkVua47Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEAQ/hzc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEAQ/hzc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8ULuH003591
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mTLagKpBc2r
	L9dFOYPZ/ZlF6mHj5oBgr/ydkac/ztb8=; b=DEAQ/hzc5IuuC1J0CWynQFpe+K6
	GfZwe/49TGEvWBu9NmyRhCVeiL1zHStnGwQ541DwTVKBAfYPQo1mkk5T7TA8H5a0
	JWeP5SgXQnoF84nJ1WuI9MiQg4m91hdthwqSAox8kC5Wo4ms7F8sQpM9/W/5kn9E
	t+2d+zCgJQnyP0FAJyqsS9AVGFqiMNmZEbj2b/ViSVl3qbXZOxWsk+PfTXVcqUlk
	DlyGOzExVIVJpp/i/ervIIuMJbB3vjeiDj3JAWGPmaXEYo+/Dh+1R2LKmEZaF4Rm
	wei7ShHDF1KWjpegQLkYYn5K+NPydZPF3b/ktqrYtSoiZ3uq3e21OmVDigQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5298vfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d93f579a1so11843076d6.1
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 03:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859780; x=1756464580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTLagKpBc2rL9dFOYPZ/ZlF6mHj5oBgr/ydkac/ztb8=;
        b=vKmXpBF2nAp4JIQ4kqFeR4X2sxs/ugVKUWvVy7uzS9Ls/FDf0mgh5oxl7IFVuew3U8
         E0exzgLNgfpbpoDMjrQo+nqDmw+zIWvmL/liCTAz7H91MHJk/s9ZrqPW+Wa/KBXdYqwW
         6SgEkTDIzaOUdbhroSlPNdP0+G6emuWjH6b3ygyfwO7zqwYQoi4H9qChgyTj28z/0z9k
         w5j+gRLuECd8dTS0V9bD9iSSe6VhOL1K6vY20q0H7OL/zqfxJIGt06rg6EGcqgQ5OtAI
         vJrCShZHpZbWIpcIYsnctZKHmqKnj+TLBYSZMkJC+EbIeNNlXUItkvZ0cXM342/uQmcB
         6fcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEy/lyCL7XZaZkGO1x4JcJt5RQM/oXckwuHMdQwfxcydRsJ7h00mbtvZHqfbhxpdqu8u9JYzm0YFgwrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY0UPfkugj/Vyoctex17V/Vu6TwmxqgbPdd1ED7+iasi50n7wp
	szzKMRZQF9tVMnbdi8AP2eyXE22QhbjGB5RU2VrnE8Tnu6+HQ52iiDIyZxqAGGa4gxzTYWXSQXr
	kJHNqZB+9m/6yLn5sX3abXBUfrM3GD6PSugLROpx3uxhqt0H9Y4AbD+3VuaxYfXUO7A==
X-Gm-Gg: ASbGncuYAu6EfsMi+nuTsv3lNquRd5YqAzj+evAXfHoYXdNKuc2faTLbfmYBhUPCH5d
	WvbRuhQhzoBiukVcXUWO3gqb9xT4whoBYQPZaQPp4ln3uNfFYeFLQ41YL/plfWZke4u3Hay2WMC
	vioEDimIQnf2Q/2D100f24OIMCh9EJ/tFpWVNV8MQl3+5Ut7J48D+/kGy5ZwbBz6eD7+1bTcm4/
	vMxZ/2wU2T+k4itrBTsMaF2UQ4o0vK8Ibs1Q05xzsRnVD0OXhMJGwnBKUYKOxGaZuTx0BJKYLTj
	E8R2WwWidQ/QeGIjVc08tA0PQ5znoRUlniJ+ArwtGElV5yefLm3aoQ==
X-Received: by 2002:ad4:5bc5:0:b0:70d:749f:177 with SMTP id 6a1803df08f44-70d9738f13cmr22244196d6.33.1755859779919;
        Fri, 22 Aug 2025 03:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq8uCn1ut3eJy6YOI6AW0csMB8mZIwD16SLQFg3+7MgJapILlN9oofWVuaked14v2/lFDKjw==
X-Received: by 2002:ad4:5bc5:0:b0:70d:749f:177 with SMTP id 6a1803df08f44-70d9738f13cmr22244096d6.33.1755859779504;
        Fri, 22 Aug 2025 03:49:39 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e4249bsm31367155e9.25.2025.08.22.03.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:49:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 8/8] ASoC: codecs: wcd937x: get regmap directly
Date: Fri, 22 Aug 2025 11:49:27 +0100
Message-ID: <20250822104927.2621866-9-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a84b44 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=5pqs-Pqnn3KeH4UlXPsA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: K2-1LsoJJq60vyCrhqQXuwkEzUSRMFzR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX9q0UggbD3tJx
 7S40eo5gUb6JQOwPu861HORv2o/8NvuUmxNouFkUULX/h86oTAbxh64bhUv7D/wBjXhSpuFaHnO
 QqkgzN5ie1MdLAK8YfPbkr799CwyJD2PnX+bnC3ntDbSvKEXJmVQuVjdk0FPTTDhH/aWR032mVe
 YIvRPD5YHR2jo1ADlJItEIAwaTO2ONCTuUaNgToWmlRsXMTzHYQrJ6/uRTfAtlHaBRoairXWjO8
 10IbXSBhOSf2D1PbGWxp0OUXg0Bp/i0IWDY9v2fgzNoflkVsXEGm8ql6Uk8jaaKJklEy02k3SdB
 8TnfsoElxTWamu0SYUIUizLkDZAC0Z4kVaMe3GrmFUeLI2G7cfOSJcV6awm7mvGf/uXj8OJEt8r
 oV23gDZOEgnWcY89wt8d3fnDynJf4A==
X-Proofpoint-GUID: K2-1LsoJJq60vyCrhqQXuwkEzUSRMFzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

Remove usage of dev_get_regmap, as this its more efficient to directly
reference the pointer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 5c8faff3976d..2064d707ab0a 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2790,7 +2790,7 @@ static int wcd937x_bind(struct device *dev)
 		return -EINVAL;
 	}
 
-	wcd937x->regmap = dev_get_regmap(&wcd937x->tx_sdw_dev->dev, NULL);
+	wcd937x->regmap = wcd937x->sdw_priv[AIF1_CAP]->regmap;
 	if (!wcd937x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
 		return -EINVAL;
-- 
2.50.0

