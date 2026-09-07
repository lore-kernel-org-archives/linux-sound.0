Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C584399E5
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 08:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770322; cv=none; b=SxBK8FG5CE7jWwljf/1B4yAate1DQljzA3n47OUH7qoO7EUsdM04lM9oRXQW/HlyJDF3BRerMl79ey7wYSQOkXujJxdd9DTmwTrgJ5sKUPNfCJzmLBoH0UmiQSjl2nnQKHRz1QguOcJS+hcG0Zh2JcqaLmTE3S/vcVELFIy/PIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770322; c=relaxed/simple;
	bh=KSMNo8g9EzvzwyGzuw9rT37GzWc3bg5wEFNUMeWd3m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wrf/VORuFyPRJiqKiTLt7fmw/qraD9TCEVVDv3fQK6oo0mSV8+XIVEoLpee6nqxdyRMXm/c6EzeRFAwOoLenKxwD9UM3C2RQwDi7nYI/RTmcXftUXIxd9gmHSJJdab5cix6WY4hdoHLiUWOexNIkX7SYhhA9AcX2uF8pMGEc4wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5Xu8pKf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKjnsxOp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5Xu8pKf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKjnsxOp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777eWS3903344
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 08:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ip+eqAI2Rmw
	ja7TOAXqTLr12NGGvPjVQ2o1ftxzlnKw=; b=V5Xu8pKfscCanne5RdqZbZbv202
	ETrilp+J6RiBrhsE6t8prwrm9uPVAUL5WMoGIcsPXThNk0zh1xoFpbXldBW1wJNt
	wrOR0PORIlees9NixTlZ7jOT6DFkOjGkxB8Zi9+mZViE80XZHVucKyalIrQ7i0S7
	HDBF2BhbAb3gqqciPNfbD5qhIei/ZSXoErEZO/0HpPifloasjh5kY+B2szIlLrJd
	HIuZn4nZ+lMLfo/NYTudOA548nRtIqUYQoX6HYSxT2OB3tej2Tgw7AsbzoEVj87y
	3HPm6S1+biQww5SOcUV8kyPnp9b8KkU0bcOEHiZeSzvHo/q0zTPVLmz8ZkA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany5xvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 08:38:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494cce712so596532985a.3
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 01:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770317; x=1789375117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ip+eqAI2Rmwja7TOAXqTLr12NGGvPjVQ2o1ftxzlnKw=;
        b=gKjnsxOpiHXM5tUTgXzj3U5s1N7LS2oPP/SUZgUuEzhyzG7p56PJcEMsRsmR83ChQ+
         hOkXhxxmEYJL9NARhvRtrQDdY3KgJ3cHi7iuRC8O3SRor0tQbCi+cjE4H6wubfeUqLG5
         m/0QWW+MhsAwNtgy8Nb00+jNZTN3FvVETigT+SH0K0dqkT+Vs8YLfEj1ZUAqJ68yKDnR
         IEHkhFQEdNXgGhcS+6d6+OI4LiCZpGCVxi1cwiMEhw3w7gXTtvlzpco10VQheUzjFq9x
         eMgjIhObOROa0lO3WRSpPjZGi1GJF9am/4zHsl4KRDYXP4rskFBm0PrIv1pNgBubsYCh
         PtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770317; x=1789375117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ip+eqAI2Rmwja7TOAXqTLr12NGGvPjVQ2o1ftxzlnKw=;
        b=Ox9p6TkKcrOg7Qmyo7aJI0OuFLkWe9UQ4Ho7QUH0h+0CLSuD/sNFf+8VYgDTFTbriI
         pDMPJwUXPr5JeHfxwhxpqn9Iaf9ECALg9hgRC0RPeWeU8wRTumpZifKd56g3DrhD5gGl
         HrxFw0P4n+cVUusxJa59abct/o6YF/mOPV7qnSACZsMoFvhs2PmZz0TmZM+Z2wibpsp/
         GTTcS/qOWtUusY+paboJMq7KN6v/7Ub1sT7f29j10DI4q7YRwjgImJDXXyCLCi6mmYVX
         mQ0Vh68WTqbhLfLl+PrnFlZtXXEdJpmh2Zstp0ZF4ZUbj5KOTiIk3Jwt4Bp6+d/WPBkB
         UWJg==
X-Forwarded-Encrypted: i=1; AKwUvBwuG//KMLhrSEtUU6ovQO80ReBNnOOZhBh/Pr8PbOTO03yMSXx41GCfSpV+k3N81ZKTY9qKBY/KduZ57A==@vger.kernel.org
X-Gm-Message-State: AFuF++m1C4lQQ8ywQ7rY4o853S5S3N9fRH6hV+W7531CAjl0Z3E/yfg4
	PjSduwCoYkOnxCrWJmFF+yE7WmqCZdQkJDnUf1YAnPyScq6pY6Q5mL/S8VbeSSlmCFoKP290Wla
	pVN//E9JJLSTXvi1YZBY1mZJBXmoUB1mYkvSuJc64X+/nFa+Cl3nEdNC/AcyGat13lw==
X-Gm-Gg: AYBFou2IFNCRoVXYi8YFERpW9h2bc7pkQ8evGJdyRNvi3xBrLN+YvWePvyrEV17dYFm
	320MPReWob5iDe38ZgDQNijbIC9wPbtMSi7tDyLD8N0kqhlInaBhiuz8igCssw67tIp7AcuISIS
	VwtqJDmJ8vqOFQMenpwVr/LcxELReg6+FsOrQOeoO0W1I5/ENGQoVzoFCRwoSWjbeh3roGuMcIP
	8XVazbeK+A5Ji5ipD5VJ6CnveGRPxhrNf6k4PtgfMUJe2CTLu+P512cqfpsL7t4xc6WIbVnmIcL
	wQe4C3dB3GwVyCUeW6efoWZsvjOLO51HpLONmWR1m6vrOtRnCunoIxkGi2QxWxiBj3acyKhCDHO
	GB6EI0hfrXSfmgQ==
X-Received: by 2002:a05:620a:3d02:b0:936:ea3d:9313 with SMTP id af79cd13be357-9398037be5dmr1382137785a.20.1788770316925;
        Mon, 07 Sep 2026 01:38:36 -0700 (PDT)
X-Received: by 2002:a05:620a:3d02:b0:936:ea3d:9313 with SMTP id af79cd13be357-9398037be5dmr1382134685a.20.1788770316450;
        Mon, 07 Sep 2026 01:38:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:35 -0700 (PDT)
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
Subject: [PATCH v2 07/11] ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function driver
Date: Mon,  7 Sep 2026 09:37:21 +0100
Message-ID: <20260907083727.733705-8-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9e780d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=w1d2syhTAAAA:8 a=IEwj7ntJ1M3WgPGe5dsA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: jmqVVtIrr_MuzHDUiQsBDnKOZxFj-d0m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX4ykgdv5b+Kef
 xOIPsg0Q3HFrE6w7nonCL4kF1cCvNWX/aMLqbl7lHuc1oWPqxCjsSh4mvmRDKbjGpznYz6t3gvd
 UQuLNLDrMhADaio1YHWEFxg5501vQZWYW9eJOvlBuyEtL3DGHIaTyb22h18BDBpY5H11PHquVSk
 OJ+Qrqodn6JrRin4rPoY7mNU+GtbjIqYHl5M4fqK2aafYvMqyWirXuSmSpnE9y3us5++UKTuFtl
 LfTmSaUj+1rw5A7TqXQt8LgIVO3uYaZyHS8gaiHG3aTa7eWHBkCejC4W+6t2u4IZ6p2DeltDZM5
 g+tmh9Y/rsucC8L+ctP/oRo7Cv2rLZRJuijrqm4c5SyL1sSQueCkbyOuX3c0PkQpXxRvYQ+cZva
 ChnGyx1JXPSE81UVE74DrE08fRujB90WrpWnw+fjmK8XQSUw9SRdSH72ec/82xbwx/V1iCXqjmQ
 DWbKRlSxWjko+fxirfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX3NBt98ZpkRLY
 nvcBy/Ac4ahWQWYMVhsbzSfv+RaWitH2Miwbn4XnFilBO3B2AnO/no3c4OvJDm+WpobRxFA/OJK
 rFqpHsATB1MWM/TbvX+inRSVBcA1lqs=
X-Proofpoint-GUID: jmqVVtIrr_MuzHDUiQsBDnKOZxFj-d0m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

Add SDCA_FUNCTION_TYPE_SIMPLE_JACK to the class function driver's
auxiliary id table so a SimpleJack auxdev is bound and enumerated as
an ASoC component.  Wire set_jack for this function type so the machine
driver can register an ASoC jack against it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_class_function.c | 5 +++++
 sound/soc/sdca/sdca_functions.c      | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index ab043e23878e..713a34d5954a 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -408,6 +408,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	switch (drv->function->desc->type) {
 	case SDCA_FUNCTION_TYPE_UAJ:
 	case SDCA_FUNCTION_TYPE_RJ:
+	case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
 		cmp_drv->set_jack = class_function_set_jack;
 		break;
 	default:
@@ -593,6 +594,10 @@ static const struct auxiliary_device_id class_function_id_table[] = {
 		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_RJ_NAME,
 		.driver_data = SDCA_FUNCTION_TYPE_RJ,
 	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SIMPLE_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_SIMPLE_JACK,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(auxiliary, class_function_id_table);
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 47dedb62c24c..25f95575c731 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -79,6 +79,8 @@ static const char *get_sdca_function_name(u32 function_type)
 		return SDCA_FUNCTION_TYPE_SPEAKER_MIC_NAME;
 	case SDCA_FUNCTION_TYPE_RJ:
 		return SDCA_FUNCTION_TYPE_RJ_NAME;
+	case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
+		return SDCA_FUNCTION_TYPE_SIMPLE_NAME;
 	case SDCA_FUNCTION_TYPE_COMPANION_AMP:
 		return SDCA_FUNCTION_TYPE_COMPANION_AMP_NAME;
 	case SDCA_FUNCTION_TYPE_IMP_DEF:
-- 
2.53.0

