Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3ED383C76
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305556; cv=none; b=KKdor0BQUEHNmsozC0NIAnN1kTyzIgDHjGIu3NY76C3OXAsy7FjQmfA9F2DkOTCoSWuAfRjEZQxh+iXV2T7/nhyZihNg8TCRN6cPbBbnmN3+7/I7G0do0lZYDg/z8NPpaEQelKQy99Ii8ThKokz7JAsxL/Uc9z3XDPX2FoHJ7OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305556; c=relaxed/simple;
	bh=Fl/z/x1vRgiwJd1pRAYk5uDKCPsjPZHEyO/+LZ3AuNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxVmLxq+Ug88MQQYJkX5joJU3Dvgccj4wBVBkJLIrmX3eaivIADWahdFrKi4BFYunrZt+zpB8yVWoL70BfNITGCKf0g5sGbVziwx2vYpV0MJCORxzVdQc2RK98BaRFny4T/IsBQtqXSwQ8CcKrbe4c4xXiZ4JXeVwOo1e4bLPFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9ZXlE/k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ND4auYep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9ZXlE/k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ND4auYep"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqvxM618719
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ngH86D4QhHS
	BBEnIjfBcEjvZR9eSdOdxegad2SenX0M=; b=l9ZXlE/ktkebioi4FzAUZ02ej34
	pgAeldTbg2NoSIWwvGTH5otD3KdRozbqoZYzulw6KTsX2GlWc/ef4DkOMW+gHqgk
	RLPZDEib9+8twMergcK/ESCfG3iOs2HIuPNCJDTKI9sug0Z1uEq3U0NUrXsM7sO/
	hVgxxVDMH1TVFt3FvRgttsvPgd+2JDRBplnezT7w+JaHOol3ALsb8zw/SVJxKRW3
	mqRHdkMO2JkJe6mw4GpaapCL6kYGUbriosAcuxf/0JazNNSO1GuX/ErbXcrbaTyz
	dIfeKZN7cdeiB1MVgrBC61tzagHCKvMQCyUc3Q7VjwAHs4LLtq+xpuq14zg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgjyt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093787e2fdso156654691cf.2
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 15:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305553; x=1774910353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=ND4auYepQkmMZJbjA3zjL75Ogk0hcZyeqXmyyQ7oGABy4vEmfmF9K9lKkp0vFnFgLD
         gmc2l0ySavG7nNC2xtos4gTO2jbxeO9BWfLTxtfEYUbYdfoaGgn1mmlthDts4DaBg+0p
         z3HEYwVNqL1SShRzhbCjeZ201Mx1NVIFk+bY0MU/c/VIMdQRrBuTXU5IMhDXkA9eijPg
         FYqIm3pRLCATJeCmCAvy7vNt8QzgRCdMNa5GmJesn5F5bP1JOiTHvnXhpBeez7+qhdCb
         K9gKh7QG6xPbxUNX98kKpq4jLQnvDRqsSbEbT6iAK5slx7608XtvIDIGKXBZ+sCazg+P
         vstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305553; x=1774910353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=aHhCf2NfVHLOF5j/fSRjAnkCSPUPczAyYZ4F1PzsFZJee3ex8cUef8pSPjIjjtP61Q
         uSawuN/5vqdySxxhdOyfRpWzqEgDTZkqPgsZ/gL3nPQOXVfkPRrCS6XSCAdamHdvfnQd
         uNWE5LJ2Ea2wp6z5aS0Newrph0uTQMqf5Z8sP/wqOv2Hj68btYK/F/rLqKq72lctgnwk
         T1YGKSpTk4R/o3nMah5OGD3gU3Y9g6Mwd7ihzPFC+CQk8HzoVnenb/1kk9nxeTRmLi4w
         MtLX/P2q4VNPB0I8LOnSLM1tRYSajU9GsHCbUI0fEXZF8rnMMeDGzdms2VqNuh/V+JO8
         BupA==
X-Forwarded-Encrypted: i=1; AJvYcCVL4XpCuasa0XeeErysyNtnXZ7JatV6q3nhJ1Y/+CJsaOl6cIbhbUvwIvzMy628vjoDt9Tp0/ycrZzmIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoKwD9W9bRpFPaZ9Ql9B7EdC8zhqQ5OjT5gojHqfgNIX6cJ2z5
	SF482secDGJOzjOgsJNluxo5uqvsajVDWMs6JmnxJX7meSSIk++JCCRU1J/JqlHCDrMxmWRs2Wy
	uVgEj2sq/FPET89cAaB7mwik74qXF3a2LyvnymRLI9sKt1XqS3yDvjX9bMd6UMyI7Dg==
X-Gm-Gg: ATEYQzyG/meUCpsxG6/sOLShUUw/HyB/XEiqfyWfbIjEh9Hh84TYOgH2Gz8DDciiDgs
	5MLNZ8vQTUhaQ+8zw+5AbzGtH/mQh3e2VZhQ7ivWCPEpmdZD8lv0SCpRhTJqQYoycJWTL9Wll+T
	kohc19SaIcmHLvOPHYU+XJxnRmVxc9mmwYiBdzdywINf7Z3RjO3sBN4BjocApz0tN6M20pKyDUz
	8CPiEvrzCq9j2zQGMTqPseGeDgYWeR7EVzbRarLwpM360w2gHWL/VLqJCA0GPtdyyKYQe3J83zO
	6EGcX48QNFo55N1VMGYRMe8UAffu/PTl7KuYQD9WqZCjPxp/jkwlGmFbYBg2dj7iXMWXqIHoRqc
	CtA+4RHqeL4mHxFs1+J2elFCCCyLmKSjrftWj5r1u7nftOq0vCGXS4uA=
X-Received: by 2002:a05:622a:1f08:b0:50b:496c:baba with SMTP id d75a77b69052e-50b496cc8c4mr150377481cf.57.1774305552898;
        Mon, 23 Mar 2026 15:39:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1f08:b0:50b:496c:baba with SMTP id d75a77b69052e-50b496cc8c4mr150377131cf.57.1774305552516;
        Mon, 23 Mar 2026 15:39:12 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Mon, 23 Mar 2026 22:38:42 +0000
Message-ID: <20260323223845.2126142-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Yy1BSeid1aeAU1iqEqJBzKMgl94m2nRL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX/XxyhVXdSBBl
 24ov/u707gG8cNkhqKk7MY3WpCcxvbZGMSxJZILqxpPWt1yPXkaziXxAZW6T8Kie+leFA2n4WRp
 3bexn1nhzmPRoCSQ+Ur3pwC08g749KfaQDr046JmMx8eXby9+Ivay53eT0ZrbpKatxX6eQEdrhc
 dt07BDVzjHukzUqqByKKxyRzc8waWTeRwFDLUp9vxNCmBVcx5ElXMBdPxk3sR6jKtTdTUOmO0VA
 e7RAaEyiQXh4xd80/IQ5fQgf15EghKA5JPK0AFbMzzJRbf/uhtLMA3nmxzlCL+HhJfHYj9dWjn4
 142so38hYvlcDPAr3C2iNC3XoFZe2zdCk4a09y6fHn1zF2rSSwIDV2fRBE8iigahIUx09ir1vYb
 axOFgYe0RY62GvwP2gpVJ+Bzm3Yn3eu0zff9cu5TL1v/fUTbnmB27vdm6WNF1HTEnAKUK6k4hy0
 ooi6/s+gar67/tXUXAA==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c1c111 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Yy1BSeid1aeAU1iqEqJBzKMgl94m2nRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167

Fix the error message to reflect the actual graph stop error
instead of graph close error.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index ba64117b8cfe..87f6db12003e 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 		if (rc < 0)
-			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+			dev_err(dai->dev, "failed to stop APM port (%d)\n", rc);
 	}
 
 	if (dai_data->graph[dai->id]) {
-- 
2.47.3

