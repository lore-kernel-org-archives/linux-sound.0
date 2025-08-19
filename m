Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0C822FE02
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 09:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755595664; cv=none; b=tVHhV2LgzS3qvdFS7s7hGHT1RGkKThAJLo5oeU5zCNU+G0m9Xi80beTi2vLmt/0TNRxFUes3+JmpMdIKfLVm6cdmhaKKeB6DeNj/53R4CNfVgl88Uvszzi0+ROfJgz/MkjWI8zrCs/COdI5xSVhSH7nU5KyEnYiM3IftnW0Q5cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755595664; c=relaxed/simple;
	bh=mQUBUhTJIkEVd17LK62zreRv2cywfgL18mzSnA6eK8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bAhO6UWRO/xCpt3mksPMakj3OlG186dCA/omlwmLsyd2KCk4TnWLnVAhuoQ2I/1gvcvw6kFdo/ndNgnYwCBO4KVwL4D6koYvLjwnS1yeJditN9W9R8lfBVc2IOkjeruXtqXn1KOCQJS4FUiJQXmkZV6PC+42QYMed9j9UK/tKw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwgMvqx6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwgMvqx6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90nYo018342
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 09:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CyLYEil3TgY
	GIEbJLbRwKXtE0JhM9xLvHblciK6/Lyo=; b=PwgMvqx63YPuSxOJG+FYmgYCFMb
	sff3WprLut+iB4k4pW3+74b2MH6T+igimwSvHFuEcm9p7phUiCwBgUoAMewk4W71
	l/vqjaTii/wAL5HzLQxiIKXAYUrsOtYmJEl/RarK1r3mNDeBWBwEyabeJlWWD81x
	xQTCUqiVG6EWMKAN/iQ4N8plJS1/17b0KwnZ8bNjfp64a7a5zOJfy4/RQzAIT5ke
	oq+GUs0qdyLEMBKc/sG1WQjLtuZsEkkjeTmhs1V7m9rvgfEWkkVgWlut3C1rCEMO
	jqYqourv0VccXMGMoJL0Nt4pLYJWMBKigEoprJbb95/VzBY5gHd/xSb8r7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagyww5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 09:27:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e870614b86so2050951085a.2
        for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 02:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755595661; x=1756200461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CyLYEil3TgYGIEbJLbRwKXtE0JhM9xLvHblciK6/Lyo=;
        b=dgH5eKaDnfX6BtL+kR/Q9XmAE9hBMxD2sSVoiywnsq7s74zie/Gk0y63Hnxx8kutOL
         GSrohRT6XXtMwu5KydoXfF0noHPXo05GgJDstoC5CRv7ci+wqi+lkVicmGJC70Y8DWDw
         ONMRQ16BfSJZa/4Bczlxe54kIcUp1OJyJ/z6NjnBwOWk/WYiQwjjkUd3l9OL3xIFBEla
         tUw1OShIvggk8/n22LR0fPxJAX2o12zOMioOSs1GXlF2oQsPx88S1lDnHgI1rHK5f+la
         YchkVsturHDbyqKF617WO8qC/z8gGmu/oSJVnw2NE4umqY2yxdCgZQN+dibGk/0e+qoN
         v/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVq0RN2w49lO7nUco41WqX2JY68mjuA3DjaWkHTXKEP2rhi2X6Bsh75RIum5DfJuR0wDA4FkjgMLJoKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2RVxdlPtYOIAr3CX0iTKV9QMvdtwpJqO59Y3F7LfywYJHrk6v
	QdzTi7KeiMVDaY4+0IdiguqqwWy0WWdbReMs471Zvv1CfHKp+jM+txPeIYWTrVjSamntSc33kQy
	+/sIifncvlYL1LH8YIto62Ix9Zl4vNrxZr1+Pskf/Q1sZygWMGWC73AQ5saFy/2g/s45HTBA3Xw
	==
X-Gm-Gg: ASbGncuVZrTZlRcQllKL6pkD71xStevr+7rxXpEIK7Lad+iD/+rWgfdGpZMSVxiw8ep
	4MrHS+SzEvq3HOccuWbHtWGNpjXFSxJZcm8xduSg6lfqFon2JBdSsypMkgpPAY4ucOVpdA4vq/E
	WcBkB1sfbR4Wj/rsvEkzZKWCVT6iL7QXlyXJmBP38D+xBsqlLq9ABfzH1Gd18qNPdAXRw7yslvd
	2KTGbuYxpkXZ7ojBii1QTOZz3eFueQ+/6nlRTfTT3YV0UOJ1gBgyfX3WaDe7IlYOggFQHfWRkeK
	AzO9TQBWykJCgP1hNZSQozvLkDD3llVDUGtuEbV/qTId9MV/e/KyGw==
X-Received: by 2002:a05:620a:179f:b0:7e8:2cc9:a05c with SMTP id af79cd13be357-7e9f32d26e2mr247458985a.12.1755595660613;
        Tue, 19 Aug 2025 02:27:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1TjeG+Qnr0RzGfLzCytOelnNfUVpxdZzDk0Sv5IjBfeYEtkk+eUnZHC+HPE6u1SpsAIizbg==
X-Received: by 2002:a05:6214:c28:b0:709:e1c3:cbbd with SMTP id 6a1803df08f44-70c2b63c5bbmr17392576d6.21.1755595619040;
        Tue, 19 Aug 2025 02:26:59 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm2942284f8f.48.2025.08.19.02.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:26:58 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 4/6] ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
Date: Tue, 19 Aug 2025 10:26:50 +0100
Message-ID: <20250819092652.1291164-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819092652.1291164-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250819092652.1291164-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a4438d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2ggkzc9sqBovd5WwaRoA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9Du22DrGfXCHBR74KrIQamFdbpjYX3zx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX6f9dpBAqGEy3
 q66M0k09HQKvjVnUNEM/bCNzya2SZCViWrD6JQNh2gYZ88o6mH6fbWJJmdNNkXeHgA+p6le0fSg
 40M0RAPmC9FBXQQNlBElUJwYo2lmP+FzHo5R+f6WH7m8WHm7fKEwl5YZ0bmAdL1jmOl3EGusFPJ
 GlB4Ngi5iF+QNJtJcbkOy1E67Wp6qMrnfynJrC5d7rSTr31yZxUPGJJqQHDx0fpBPz8T87I2Lgd
 eal9qw1OFf2FXkKjm6enzmoooVsqf7mSM84Zl02Im8SJ8MdnGMlc4mMNSnwOmBvy49gNUJSwQ5J
 6CbsEKbTOYeFJ1m6asZwb/gInNGOkdqn2VhedUnqi5wmIpVwVUurkcu9+EfAkLpHHyBwVvwcwra
 Ualb9Kqi
X-Proofpoint-GUID: 9Du22DrGfXCHBR74KrIQamFdbpjYX3zx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Fix spelling mistakes in I2S_INTF_TYPE defines.

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 617bda051cf8..efc918452e2a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -462,8 +462,8 @@ struct param_id_i2s_intf_cfg {
 } __packed;
 
 #define I2S_INTF_TYPE_PRIMARY		0
-#define I2S_INTF_TYPE_SECOINDARY	1
-#define I2S_INTF_TYPE_TERTINARY		2
+#define I2S_INTF_TYPE_SECONDARY		1
+#define I2S_INTF_TYPE_TERTIARY		2
 #define I2S_INTF_TYPE_QUATERNARY	3
 #define I2S_INTF_TYPE_QUINARY		4
 #define I2S_SD0				1
-- 
2.50.0

