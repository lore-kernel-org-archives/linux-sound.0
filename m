Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB026AAB6
	for <linux-sound@vger.kernel.org>; Sun,  7 Sep 2025 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244145; cv=none; b=iqqbJjN7GJa44c38w3peH2zbkviBPytzknTL44HJagqMwxyIWSfk8TGtV+7DvYFn0iQ5iu/jdmI/XbTbNuxg1qcEg+DbLEjRcuuvlDgcCU/6MDAXsuuguPutGMj4Ia7awB9zCgmlq1LQPaQ9zJFz/p0/CgCja6Lg0MPdTyjC9TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244145; c=relaxed/simple;
	bh=HmXyaDzSyYWKVyfOvvK8VoaY3HzpzmVHwTfs57fRK7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6PhphJcYkCCHTOCzkRFIG7wnSl6FbrRw8KbsW2Ez1bwRhxt1ZQ4Gl59Mr1mvsCNZxMITuz2p6JQcPIualSj0EIbR3dkUsR14h1BTVydkIOiuwnOYvRfhurH1bprxe5LtrzORM0ok/cpBAvAa0KOwtuIcvD8UYSfAWzH/DrNPB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiWZKGoZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiWZKGoZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5878jcF3017576
	for <linux-sound@vger.kernel.org>; Sun, 7 Sep 2025 11:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oOmSsAnlxpq
	Orq3+ovrwk8ydYShsFwbNuJh8B6XuDYY=; b=ZiWZKGoZV1M9lcxhq7xwPmnzXWm
	K5E6Y6nzy2QXnZqcL1ems66aetcXk7Xnyl9BJWoJkMkU6U4ug4IZI2i5rBkj4KaV
	GTvytP9+/+shMep1OVjIVoky85AUdTWiDVteag0/+WS9FAU+RmfYl8nf9jBzvMkg
	htpTuJlaYYzw1ohugwKb3yH1ponqHyFkUC5gxO/DSQtFv/H88e59PlE2cnrE2JdU
	Cd7Ky8ax8VHhasmzo3AWCsUzxY5BwGCMinnfjhsS96xhsrKUqDZlHgSBWoLf1H1m
	yOEY1a/nzOwOPAJ1wL1cAikrpdSt9/cGetER+KPK+6r4FRdBPzeYKoDMwyQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4ksw97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 11:22:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-72108a28f05so141284176d6.3
        for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 04:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244141; x=1757848941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOmSsAnlxpqOrq3+ovrwk8ydYShsFwbNuJh8B6XuDYY=;
        b=eTl1BE10sBprP82tZhBL4tENcemoesMDTWIgWDOHqkz+KaN2QdRB+QteGZqJcA5f2W
         MclDhbhsBHQCg7yq439XLSsls/LSqc/SEn25MAD+sZqH7815VOixr8XI3KozRuJAsiH9
         XJbV9fm3fwy3po76ll4Y4a57Ig8/XVprnHoyHNV3Wh1anrxkPCWYFq1llOxMHxWnulyJ
         Jow9U3ntLyWJamrm7Dj2rUIdyucsNiNab6XE9LBdHDJk9IaasRDfI5dmwTU9Ut8wI3Yn
         z4i7yCq3Dj8/1kQyb9RYzgBsHhjH4O/MHYF9FBHbSLKJHsMCCL8T+pa9mqzYNFsmckjv
         PZhg==
X-Forwarded-Encrypted: i=1; AJvYcCVnQK9xmVqPYlfQ/azSFovcO7DGCHwLZH5s/ZXX/YvIH8bLWEZlaT3ej2Tt/VhE2YDQg8XvXG3wsGWYgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOMiWVvmwMZgLRvuuYAQdA6Nf3HDfchdc22VpvZ23pmmAx9s7/
	jDu1pqfh0noJA8p64q6Td3kJgR9etElwuRfXp12qEM1M4sgg5+lygrYdVXIvjJo+GAAuADrD8rY
	gCqVnVwb41cd8+v+czWbutoxxWElztYLYXJbDbxEO1I9Rdl9xwH/e1AEwowpyoqlUqQ==
X-Gm-Gg: ASbGncurFhQ5h/o9gJfarrDY8kqwrLjPD3UPv4YUgHLpJpEvH4KMlk4u355SDPrzhRT
	XqOx5WpD+EOFEuad5vBBxWdhk1VOEAUT3t/BgsAQFBeRTpjK/+iGUhrqBBS7Y+DjjHrXUKTq+GA
	S2FMaTjW6WOgMI1DvziVvk7lMEhd6MzskRWWWdG6jmIxeefqge76CcMBj1BrwXzE+73++0J/0Cr
	dl8KR6vXcUK/ud9njJexPhBYpjLU0cKc2ESL5XS6NSDNPnXfA5gOvh/7bOhS+GpvOL2wkjgLLNn
	naVg8PJAKger1BqU9+hdsokGxX2k1sS2yWxmBxEwltdYLEVggv2dPw==
X-Received: by 2002:ad4:5ba8:0:b0:70d:ff7a:34de with SMTP id 6a1803df08f44-7393ca9adbdmr60235046d6.33.1757244141312;
        Sun, 07 Sep 2025 04:22:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbwMJmgf1oVOVVeL0AGbEaug+ceP0L8sBb/2UOe/KEvnQmT3R8vUXM1gRsJI54zSTpmJ5N3A==
X-Received: by 2002:ad4:5ba8:0:b0:70d:ff7a:34de with SMTP id 6a1803df08f44-7393ca9adbdmr60234756d6.33.1757244140888;
        Sun, 07 Sep 2025 04:22:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 13/13] ASoC: codecs: wcd937x: get regmap directly
Date: Sun,  7 Sep 2025 12:22:00 +0100
Message-ID: <20250907112201.259405-14-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX/IDu5IsmW5V4
 DAIFfEokJe3NOSuPVSxBu0QGktGav3bOsd+8Hy8LdyqQq7DpR6OP2TPNCDTD25G6DuqJJwjfLBO
 OxBIHEdnWLiZru5Cz2MMRwN2E9c4D1Amdz7HVYHQS6IFwhV6+1Z4yKHlkU3p3+aYeN4ut/DwKL6
 5aaZ1S8cGQXtiSO9RHZ1PL2jYX8C9mgGEm5eXf1pJLDRqDRJJQgAqamGLqG6klhuCakCWZb68wK
 ofnrwUoQKevMU2Opt7CRpAQCoin4btf8RAPvCEyEBjUOCS20nRiFIqG+dsbodj8q+cY3turcetU
 3PeUJ4mL+7t6I698/WPfzX5eSa05O3auVeSKmSlUdVcLx1G+3+/C0PxyUcPUzDLPG0QQEZU0oo4
 24cc/rf8
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bd6aee cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5pqs-Pqnn3KeH4UlXPsA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 7Ttc4cB2QBXorAX09kgTUlFgdO5YzK8A
X-Proofpoint-ORIG-GUID: 7Ttc4cB2QBXorAX09kgTUlFgdO5YzK8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

Remove usage of dev_get_regmap, as this its more efficient to directly
reference the pointer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 4c040e3862f4..421ec7a2d6bd 100644
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

