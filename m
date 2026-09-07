Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DA8442B10
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770328; cv=none; b=SY+Xo1JfIN2/B7J3UqBj/84WiazkIY3Bl0pNbMWttGkmBuctgJoQQLpyzaAm1ZUBOzEUZMRLqfyr8uvUFfyXp4P0ZVi8Sn9+fPBM5L+YbaAmh60GKsHxVCSR8ZHw17f2ZTwuHuW4/Tt8L1kFItgKynFM+6cgFXgGhoJdhZJMBV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770328; c=relaxed/simple;
	bh=nGv5PetXuMnjGRkeIe8kY1eFNyjb5QBvGtSYOUuF9OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXn3/nWgKYbuo8N7yW5eZdIUyz0tyW78R7Ql4jmUBjVyOLYuE/baaI8kv9kCYPX4/1MTbMGEXv3+8Ve5prLqPjytjrjQaMmQpWrMMeONxkl480GCYTuI+Q+fREOlvOiX2jsSi5jLQiuxvZIUJ+2qbRx285cQRG1Y5SKT9rnqQ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fm3ix7CK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVJXd15K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fm3ix7CK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QVJXd15K"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777chJ2146240
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 08:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uo7ZUub3lrZ
	EEc8DFMNE8az0niDw3dx2TBatUAmNhAA=; b=Fm3ix7CKWGUCowiXlEr+Uue7Hnz
	3gZYvz4/FECE38qiTik1WO1XqhLpLh/tXjDOMSzVb7gh78zy406jE4pi9R17GJLH
	UidSOTET8i3AaPVVo+nrCNNrKZv1dnPUoDhu5/LUdElUHWucW09C+s6Wdju0oH09
	j8XC56KYJwf/VgX+RgK1tsXpEOMiSO4/HVFzmUYcihiXkVjDUk6NellH8RAQPv9F
	WozCSvnD1WMwEV9wB98ZPjg2WJbi6dMwzWk9mpchUF3AjKvhbCEA8lIOg7/dmyQZ
	kdzvmmxeSTi64DP3ccaVdoTvAb5ktBYX9Syt3lfykjVaW0uysSazeeuxLHg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jdvym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 08:38:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e53b8a302so631140185a.1
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770323; x=1789375123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uo7ZUub3lrZEEc8DFMNE8az0niDw3dx2TBatUAmNhAA=;
        b=QVJXd15Kh4aafzih0s6RurW4Pv3c0v7qIRxXWRBuRHGtLm6irC3tiGLiLUmMbYWqUK
         pSlqLy8byVBs5TLcY/K0kzSrYQrf8+ZkLJhVcS6DCVx22ciCnOpbSn19V/z7yR5xsyWr
         0GikyDnM8DLJiGlCWpYoL01JUDk7gMaNs4EqF+OVvhxFfaDWwoSsE355FdhTL8bq3xVX
         gp4oGOjJDIkuWj8JWvxgdOUHih6ghwPmH76dYeQPqcLGy12d7v5+4oCezFqP7+T8gS74
         0bCx89tAjGW8/NTKH/yEqRT27/UKMsBBamuFXksy+hb02dt1GUzq2SKigtHFle2R0r4D
         gP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770323; x=1789375123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uo7ZUub3lrZEEc8DFMNE8az0niDw3dx2TBatUAmNhAA=;
        b=S3pXHsuHjR/GlKnZla7NXPEkXWN4hkAKvUmJ6lFsn0gTJASY1ccIVcIwFjwFC1dqzT
         5c2ANm3WBSbcBHN5w7xZ1Y4kYPDJUA3Y+Nt96I3mhBolMDRX0knn9lpkDQ9af4SvSszs
         DXNu7tOYEHJk2VHtozS8uVRRCfb2qtAhchjJCjsoEiRlvZ29g9tfOX+305R6hQ1BtGWl
         ZCuJbwEvZcuSyV+eLWgHtL3bTJiFt1jT+W02AZpOxaEdq/tplR2krqDSSADKL/FRBXgK
         mIqUjwUfWXu1v2gd5WJVLduH5LDA+V1s6JbkpI1wScD0P9TmAsV2JHin0sj6v23MQzD/
         bUKw==
X-Forwarded-Encrypted: i=1; AKwUvBxU/tb2/jofem4hRnErP42/XyAlV3q9ISaZ33PaPXQgZrkv0JA2Zv3n/GNNL3IxSNeQXMoO70+oC4yGSA==@vger.kernel.org
X-Gm-Message-State: AFuF++nS28U9FVP4o839auEXJZfzy+E0shv1sSfEqSmlu9zlcbavaGp7
	j8WkgLWm0sWLSYeJvJNYJfmA2/4EBCX+S6NqXMW0FSNHiF2InVFLrgPX/GCsqwUuWVA86ovmWvg
	swyWjNEdgjarpVmwTwyIlr86FBWLEqMZRkwrHAT62K7ZG6skcqne/HwE5jMZpk8nBfw==
X-Gm-Gg: AYBFou1yE4iUMot+/2ckVU5/GxM8+bl//rHBWtzjUMkZx+/Z0R7M0Cdi8qZZGqP6U0U
	Od92QFfAZWULQW/K7OteQsCRCivOI59xgIwKKeAKT/cX/ZTTdqGmSNkdFvh2HV1K9VBJE1Nd78u
	ny3q7v1uVP8Mz5Oo/5oF4BK0PILSGJ4mil2mtcSnklfD9zTAsqaR5ZC7Uz2PUIxJ/JPbHzghFbi
	AhNOeQ806FVztSkZ1wixbgyPk847HgcOf10SRrq9FxSsONWhuTIfa2e7x46+/lbFlv3llgaZeIp
	dsRz2CNo99h6EGva0WHn0K9wfQDBiiQjyqGfgX5CzplmDrqUE1PHTKJ6cuTQ6GUevbKyg32Qkn6
	BfG6WWGzkfeWP+Q==
X-Received: by 2002:a05:620a:1a03:b0:934:ab73:ac53 with SMTP id af79cd13be357-9398013bb1emr2209543185a.0.1788770318366;
        Mon, 07 Sep 2026 01:38:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:934:ab73:ac53 with SMTP id af79cd13be357-9398013bb1emr2209538885a.0.1788770317851;
        Mon, 07 Sep 2026 01:38:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 08/11] ASoC: SDCA: make find_sdca_control_reset() return void
Date: Mon,  7 Sep 2026 09:37:22 +0100
Message-ID: <20260907083727.733705-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rUmPeRfWN60DA4SvtJQWuHkb-sOaYBAC
X-Proofpoint-ORIG-GUID: rUmPeRfWN60DA4SvtJQWuHkb-sOaYBAC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX03SUoSm7xu14
 g0hQQbXMiLPGZsognJDdDFazzabUyCtNhZmQaY2u8mPmEWW7n4j+g4ydJFkpt32tqHbYdr9NjjM
 Yv6r3DTE5rOUflVL7Ssq2gw5tX5wNElEkiHVXDiWq9rwCR6rOTc1xR7uW9qnXu1nr3gkSZiPg38
 WNvpIgH9fhi37qFNMHl2oaRHcjgrqdHwKy9Ts1mh95PgL0rPqlsEeKcg6Ycy7rxJ4tnBKVPv6wS
 upCE6ls08jod7khyvIIRgl0ZTmIaZESw1K1rUUq8tvhyI7lVpPHdzdh6EN/fdzT3/P7MJVlYV8A
 1+b54fZ7LYTLEuZvMrwa+Ij+/w+yNaf9Pec6hsKdn7JADVun47Gsm9OMEKLM9+IniFJrBn5jSTN
 aBlNuKzCwvbti9G2K7mdnD7rHu2jkxz6DB/1Z06WY7Bh08kf5a9Cln2gaQiz2Wwl6ptubIU4g3Z
 NnLWooxi/cjURimniKw==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e7814 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=-Ca9_MJ7E5AnbNBKvfgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX0fyjnMt1nYo+
 Xh4rOyaMg+y9greejHMchmH+z0056Lo5DSvYDyIcysgRL7B/+M495HXPk2gKy3e3XzfskC8XPvU
 wb/delTO0Lsb6Kuo1SladHpIJbDimHA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070093

find_sdca_control_reset() only ever returns 0 -- it just sets
control->has_reset / control->reset for the framework-known
(entity type, control selector) mappings.  The int return + caller
error check in find_sdca_entity_control() are dead code.

Convert to void and drop the check.  No functional change.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_functions.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 25f95575c731..68a50552f4e4 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -922,8 +922,8 @@ static int find_sdca_control_value(struct device *dev, struct sdca_entity *entit
 	return 0;
 }
 
-static int find_sdca_control_reset(const struct sdca_entity *entity,
-				   struct sdca_control *control)
+static void find_sdca_control_reset(const struct sdca_entity *entity,
+				    struct sdca_control *control)
 {
 	switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
 	case SDCA_CTL_TYPE_S(FU, AGC):
@@ -950,8 +950,6 @@ static int find_sdca_control_reset(const struct sdca_entity *entity,
 	default:
 		break;
 	}
-
-	return 0;
 }
 
 static int find_sdca_entity_control(struct device *dev, struct sdca_entity *entity,
@@ -1032,9 +1030,7 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 
 	control->is_volatile = find_sdca_control_volatile(entity, control);
 
-	ret = find_sdca_control_reset(entity, control);
-	if (ret)
-		return ret;
+	find_sdca_control_reset(entity, control);
 
 	ret = find_sdca_control_range(dev, control_node, &control->range);
 	if (ret) {
-- 
2.53.0

