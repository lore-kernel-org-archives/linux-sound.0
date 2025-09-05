Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159AD31B833
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087083; cv=none; b=fecf94Iap1uFralSpVQ1Wp8nREuUnyBZ//Z4iUUVAIJLss18eHPdGpc6pUei3W8/MCm/251yt7lP3B6rbCA9p9Pkx8R56M9BZ5yceoDetGxeRONh0C7GYtSk76Ex8225S4A3S7KCTMRW8MFb6VVOtxlQN7bUKjqBwA0t7b2cROw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087083; c=relaxed/simple;
	bh=ikumlZWRZ31uELt9Gx3EsqoON5ydu7Y5Jeqw2vQ5WF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rs2NTQq5Rs/kvuSiC0y4ECHyEbIGgqiAsD/AI+wpFKUpywdC6FSrYpCXyQS37nrrdk6EKUEWolrpttSF3+OCOJq88HICAhCGa+sGFtkfBWDext2cB5FQ7RSk3vvxjAZmb+jCF0WHoyi2DlUFUHYOAQnaECCV7WfR0au+Q5Gr/wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D02YYZIB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D02YYZIB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857nnRp031806
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 15:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O3dcTOpjTe1
	fHGNnpmdRKX8jenRcrbq/0mDRIoxdxMI=; b=D02YYZIBUITV5pwlOSftAd7xBpI
	fbZh8JWiJSbEES+tHBf6yJYg/X100rNTm1sLqFgzy/n4hs8sisCcMsWfxrzPYgyU
	F3wvrrHp6MLV8r7x3DwDgeqKe2UWqA5PShOmDJRJZT5TXdmQAxjXYovvjCUXrYjs
	XaGYrBo+g4Qyecbav2B5z7VQbicTVtLKCCO+nlLfOWN7eox3sOAlLB9PaXpPnmeE
	ONVKkLBlVIQrH/MCdaOnKwMGyda9qqgR4x83L86E5S7RZ+TPr/+e5kuhxeOyI2qW
	ZhkSZvmd7VNptORsMo79rfm1Pqe1S2sRG4+ciReNwSTEjoE5uJKmqOgeGvw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0bnvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 15:44:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b35083d560so50177001cf.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 08:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087080; x=1757691880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3dcTOpjTe1fHGNnpmdRKX8jenRcrbq/0mDRIoxdxMI=;
        b=Kkon1ZKGAXHjz10N4bt7K3svYsS6g7JvH9apOyOwCgpSAzCkJ3hAl4F4gnJwf6V62Q
         jkgnMV+xlwHpysOgCNRs9CcBCAVloxOpHSG8oGlBc4af9qNeGcUi4yovihQngQ3r+9iH
         2cgAdV39uwKhRv39uzzfknXbxcEO8rYxAygdURmhgi4s7qZi3CsteXGer4wFIyI78KeN
         Kjujbxr4d+/P9Pwi7vMgrvoJIalWpLRNRXyly+FlCqvVxYhIU0wRkTv46aM9/9Caoo6D
         PRYoq8Bt1Q9LaM3c8xXFFEZ2XyhXvS8AiABdrVwQ3QVpWd0h70q2kDMGfWvZwvSeA/Vz
         TamQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7iuSk3bMVuBxSE2ZTsRCZC5vO7jksFOfoh3aaUQ9GJa3R5wrt2VrzXgZxDeUBL3HvUU/GJtZkqXXkww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaYR7B/MsmJXqdR5s72Zf6MaeDZIHtgXXVY88kmw0TkcUG2p3k
	A1J/WRn1geZBetb+wylKD+IDAZBJo3XBKV/PiQVIV5ws0/pDd5cH7fgQs4RcKEwlTwfvh0qdQRq
	4Ll32eHV3WhxMmKgdRe4KPMfRFneklIcFJKRCv4DZgeHQYlsjz74lcTZTrPACzeosOg==
X-Gm-Gg: ASbGncvfTeRjzJrmmjohTw5FRWgZy0pUDDJUShK7hIuKlwS96g6JaapgfzM02CYwTh7
	nCaluP2ngnn7hMHQrduw27IwXOHe9rulYjn1I+l0oJ2Uwas06cGFMwvTNvnIxGdl2g35R07YZIV
	Ea3OfV9iZ1DG937p1k4XqlB4sV8zvTeQkWIwqxWQw5mQ9qr8IJBt/CkLy/Ih/IWtf3BSWO9aGT6
	KH5nbjJOdtzxRkOIjCfuahL9JlLsHneU61J2YwFpIlcOo10lwCwjMMSezZrAakhJkh4FIhaMF+K
	JhV6Eax8J5tYS3Gc9Yf9bH6UOrBf2+wnJwqN676pjafcKxB7Ibn2gw==
X-Received: by 2002:a05:622a:1a19:b0:4b5:e15e:d5ef with SMTP id d75a77b69052e-4b5e15ed670mr54954191cf.49.1757087079927;
        Fri, 05 Sep 2025 08:44:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsTP+/oq/rU3gn4qxY8GGD+OI7+4fFO7Hkn/XxWCtszgnaXtzRjTNhePOlo1nQwVRWWK6iJA==
X-Received: by 2002:a05:622a:1a19:b0:4b5:e15e:d5ef with SMTP id d75a77b69052e-4b5e15ed670mr54953861cf.49.1757087079400;
        Fri, 05 Sep 2025 08:44:39 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 03/12] soundwire: bus: add sdw_slave_get_current_bank helper
Date: Fri,  5 Sep 2025 16:44:21 +0100
Message-ID: <20250905154430.12268-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: UEbrdEIId4CWnQmaEhIqwXiyzuZxd_D4
X-Proofpoint-ORIG-GUID: UEbrdEIId4CWnQmaEhIqwXiyzuZxd_D4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX4PyTBf5K0lV4
 Ht8hGMwnJ9+iUvS+ZLi69vKD+YBsIxReo6kdVIKo8FHxDLbSpR7gjXmxERSE8WOiiwhk6517Lkp
 5KJuuUqhMzDAnhorrAqWUuMtDmCE5Q/c0i3STmISToGzS4NJMABwZlySgsgbr5UzsrHmhzofKIK
 sI9IQvBOxRcQIp50Flm5+O/yykZBWhwH8eJsQKuIX8R+NtuY4wuB9YY3QyF3knxL8kj0LwBsVbD
 CFCCfu6eCiOaqZC62FRJUUPx9h+Z4655OSMkH//6EP/p9SzAqqYmbcU32IWpoq4VsNe+D7kihnD
 UNa7ndyXODYfkukJHgKly41weKM4Bc3c69w5HqtTNc12p80gygh9wVCtn1Ce+mbQowa5AiugKNH
 xH+7cjVH
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68bb0568 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=G7Fn18kybrAXfbFeA2QA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

There has been 2 instances of this helper in codec drivers,
it does not make sense to keep duplicating this part of code.

Lets add a helper sdw_get_current_bank() for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/bus.c       | 12 ++++++++++++
 include/linux/soundwire/sdw.h |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 4fd5cac799c5..55c1db816534 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1360,6 +1360,18 @@ int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
 }
 EXPORT_SYMBOL(sdw_slave_get_scale_index);
 
+int sdw_slave_get_current_bank(struct sdw_slave *slave)
+{
+	int tmp;
+
+	tmp = sdw_read(slave, SDW_SCP_CTRL);
+	if (tmp < 0)
+		return tmp;
+
+	return FIELD_GET(SDW_SCP_STAT_CURR_BANK, tmp);
+}
+EXPORT_SYMBOL_GPL(sdw_slave_get_current_bank);
+
 static int sdw_slave_set_frequency(struct sdw_slave *slave)
 {
 	int scale_index;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 096213956d31..e6a3476bcef1 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1089,6 +1089,8 @@ int sdw_stream_remove_slave(struct sdw_slave *slave,
 
 struct device *of_sdw_find_device_by_node(struct device_node *np);
 
+int sdw_slave_get_current_bank(struct sdw_slave *sdev);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1128,6 +1130,12 @@ static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
 	return NULL;
 }
 
+static inline int sdw_slave_get_current_bank(struct sdw_slave *sdev)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
 /* messaging and data APIs */
 static inline int sdw_read(struct sdw_slave *slave, u32 addr)
 {
-- 
2.50.0

