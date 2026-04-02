Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169DB39DBE7
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117509; cv=none; b=jQWO6Q2k7/mv21YtD/vU8UqawI47m/bu47iCEpgK2FtrEjHS3creplpXTToF9eiw952cOaFnQr1RSVAdsreN5LK8Mb88ZslWgvN0r/kzFunPTHmPKtaSjUc5dZnW8ckFeFH+zkTgRWjtsXj5RR7cQLNXOJnakkWyP8SY6p2qz7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117509; c=relaxed/simple;
	bh=aiDV+ay9pDagfXi99dECc3+gFHUApEvFgcp/SMLLkOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pqopg46AxuEqDGNYIrUyNQJuAnb6YEx7D7ifAm7SmZSDlNOMJbOB4QdueDXpCBflg7lXqADnqoSJCciYd4oBrtrsmMPGgTK/QDr1gq62uRM6Ev7m+YxMROSX1y0dAYUoCFgHARn82k1G9r098Us1Tw4XepHYCIDUgG4yp4UHtv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVOh9pWE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3kuIe8b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVOh9pWE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3kuIe8b"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326q0J53745952
	for <linux-sound@vger.kernel.org>; Thu, 2 Apr 2026 08:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yFv97piS34p
	vw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=; b=QVOh9pWEICPGgTVQyCUf2lFQUB3
	/3lHUE8RrAhf1r49B3XSffGuoEHAWWsQ1tp7fV31ETW4u8Clx3bL3vnhauJY0P3B
	YtWDeAS3hwXMj3EmEfFVIdye/XfKu1KB4GWS6jEmz4bHfyUfy5hIhz4JW6j/2O7O
	p1pFOy3NT4JtoYhBFwFYjfHfrqtdkucq95sX1a5IaPuoYdtGh/WwtutHvD2bP+l+
	wLoE/aiWO7Q9KycepcdLkYu9w3ZZRuDzb/KsmpHXFikQ5hWIQ5JOV+CHlzvTLV29
	2EwTfnpAN2j0umYyEKwGPkgr8U4jqSsK9XP5vjfPKHWMxhKqNRvXYSQbr8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324m7ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 08:11:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b802961ecso6108381cf.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 01:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117496; x=1775722296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFv97piS34pvw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=;
        b=R3kuIe8bKjjXm0vU2ggqOTTFVcPQ5cQefR1J+4rD9jfYqwyoJ9hi+X4RJC3iJuixgm
         WpW8WKrhmUuSe1m06UhwGf8Q3cydwEZo89sVzHjdF8gCcMq42k+OO+YGzpJEp9wJqYV9
         3t/0WSdXnDX0Ljfd1DQD6uLZyZiPwu9Pw8bY34TCoeTGwteH07Z21DgM2nXO2AWQFp4w
         DxIV/1vNH9ZuBq5pDtVJC5L5KZAJintNdxLh95NpPweiu9oa9E/W2CR+XtK43PIBpDdh
         uvnGqsfxBY5moTaGg56+pVoCdpTtkkyzJf9t3HC3kZUVM3Rba7CLnkeLZUtpyuILJ7WI
         adhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117496; x=1775722296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yFv97piS34pvw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=;
        b=ikiEhK/ozO8UpheNHmupBKXHTqXZi8CEdAOx7UzhC0LBfz4Tivy4dLWkspIPMegR/K
         AB7Mge6sR5mlELtixlfHSrQo0sj1L1PpMrOWFxCRM8yX9wkD97OMiUK1MIJKCG4WDByg
         RsJFCZuvIm0owtkI+IWolCI1Aw8SOyPMJVuQQnj2DomNYxW+FumSfMebk/bRka11MI65
         ZENuwO4d8LwqT+HPxa9fylAc930C0ag7fInSiYU5veZWFOcno3eJ3odnLZ+oIk4Ah2Sn
         ZT5YjKLHf6QMTIULZthnejet31ClQHLUOSn/6FvajOmioTCR0sZLytCHuYkoUb5rnETm
         S3yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtgICNlbDChumwgTAoAL25LuRyH941AaJwaMXDeCxQ/BrvRuEy1R1qoy6cP3ABmHLJfsEN4ws6nEbWIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8xRpT2kJ49mJSHRUP3ZIxtnUjOygAo1q6Q0U5CXOr2cz6L+sc
	RZirgRyKQCgscdiykq813oJeB22Dj8QlASRVTt4zLkkVtMNP9BAhYfVQvJmXDDr87kRksPTVKLD
	cYm7fb2SZLVGClHfw4qp4TOAgpWv4rVFbX+zv3lnCQzpsaGxTTFkU51e6c2EKbF9k5A==
X-Gm-Gg: ATEYQzyJVqQkk9pFY9uevqCg9efRwIywVUUAivodX4vKLAkGDqmUdshfQT6WOegnxAm
	CJyUXMAxCQiFYUWfS+9GY/wBw9Uc7oQ3zQpKKjgH/Qzzmon8OGhAeil4hbA+o8FG2zDHxC+OgTB
	ED9dZxWIiBqbdwHClds5vWuU8DB4MpWcfhZOpPR/m2YCr8F3sZu7dOgAG/jBIpq6KlEfNzQxqYK
	cUlfq3MFchZJc0M/Hpchgt8fBMkkm0wg/wqsIwy86mOWVDczOQ2opD4B0HC2oI4RzluF04twNV4
	5gIqhdTH92q76xDcPHC+lpgjkPrMG0VMmrbt7uHwMjcJce19nFjXTYYP8zzlriq+dWe5bryeOa7
	GRBCu+iAGTelPqoL8ZQPFfVvdireLh1La4RRzkGRIqEXNA71nd1K8/kw=
X-Received: by 2002:ac8:59d6:0:b0:50b:4d74:6614 with SMTP id d75a77b69052e-50d3bd9e18emr90671201cf.63.1775117495866;
        Thu, 02 Apr 2026 01:11:35 -0700 (PDT)
X-Received: by 2002:ac8:59d6:0:b0:50b:4d74:6614 with SMTP id d75a77b69052e-50d3bd9e18emr90670831cf.63.1775117495403;
        Thu, 02 Apr 2026 01:11:35 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v9 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Thu,  2 Apr 2026 08:11:10 +0000
Message-ID: <20260402081118.348071-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3MQN-UqvP8c464Y9hYveDfUA1IEiBOYa
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69ce24b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX9KjjNzlnvfMZ
 aYLM+Uj0ClqRJkf8epesweA4uWOKUYHbfEH6d1e4nrujKbIzzf6Jmed6JEW+vx2L5SddSHHOuOx
 pMvMD7SjvNNn2nIjNSOEJBoopdnjLyWTzSenjj8k4I5cMfCxsuoBYk7m3HWKnax4BoJGLJE9TdU
 JHem1hFtfTy0M3EQ8D7hXvVFBJ6lpTqAUi0qDWyHApm7eWOmlxntSaJBe9f75QcJPvF3dDcxqdw
 intZDQiGjYGwt1QLKQaHc+prdR+QFTI9s5eVa+mY/4Jon/G9NxN7frO39FHL37nR47CQ0+N4ClH
 wVX/xBgowvDrewdh3++Fw754EiOvJ+IUbfZNGxV9sijUYTMGMTp+jqf3CKI8aUnM1IkJNH/13AL
 b7WIvpOmZGJZPlTMet6TvRC2/nrYzI1V1n7pK1DpFcowLJRr8oaJvXRev1we3dg+MP18uEcKwDA
 znK5HE4RT3pCmrR7IkA==
X-Proofpoint-ORIG-GUID: 3MQN-UqvP8c464Y9hYveDfUA1IEiBOYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072

Reset queue pointer on SNDRV_PCM_TRIGGER_STOP event to be inline
with resetting appl_ptr. Without this we will end up with a queue_ptr
out of sync and driver could try to send data that is not ready yet.

Fix this by resetting the queue_ptr.

Fixes: 3d4a4411aa8bb ("ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 1 +
 sound/soc/qcom/qdsp6/q6apm.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 306e928e7b49..292be457764f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -317,6 +317,7 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_STOP:
 		/* TODO support be handled via SoftPause Module */
 		prtd->state = Q6APM_STREAM_STOPPED;
+		prtd->queue_ptr = 0;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2dc525c8be42..5751e80b3b92 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -215,6 +215,8 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
 
 	mutex_lock(&graph->lock);
 
+	data->dsp_buf = 0;
+
 	if (data->buf) {
 		mutex_unlock(&graph->lock);
 		return 0;
-- 
2.47.3

