Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD152C0F7C
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691399; cv=none; b=bHHztr0eTGT4gKO+cWeSI0jj1yOdDJ7d7ckpBPEH7LclWM5mi7TOAfcUdYf670ScvT0uaUF4dM6nlV7HMQPlN1/l4BCKZ8Bz0CpR7zhcoCez613flfvoo/UVHyPPWpRAaf4guMgUKyHuUbjcU5uqb/DAfK5H4qYvF4uTB+J3cLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691399; c=relaxed/simple;
	bh=LESmruKeD2k8Y/UOmXpKXEPzU2PTrrL35FLqSlgIXnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3o3kjjfJAR15ZNx8FQs82PClPrsaTLuXSROYTeztS31Ei1LwNHsAARQaKB0TpKoMJNhl5PSlGnlJVFXdC7vgAbtg1QXf7yPZx01akCHsHYXaTzAu1EMNpXv5R0lFH9GBTgrwkjLUeocosKvUhKxRrAMXFTsCzYp9Esu2vwiWl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vvs8WIIa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vvs8WIIa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H811NM020559
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jds3ynaWk7m
	aZGNZjrrK77wITeMIM7azLHelkM5HaYE=; b=Vvs8WIIaA+MClM56+aqCOe6SuSr
	1AbISnzMQpH3rhNAPS8FpKvEITIBIiq2LxEhryRNoCVUcWDlaqqhUSiZPBIbDIDZ
	Pr/bUyWeBK+56UtEViuutFvXskd/ajkFGF8o+l1jJrNge9CistZlldZr3HCYxtsv
	Go6iiXuIU2BngdgpnwRHXVLHK0r1qZIjopbgF+9/4H/kHzZr+SIt44h02hvI50Dh
	BkXDN/YJOstnq78wPy14n3FPd2Mv3vSAFDH8BmYggU5cxJ86Uz98wnFqFvMsG3mj
	wh03OIgvSnKAQTFV0L8t+O3+fnS4Ya/hrTgk4hr/gyt8GsSGVr2grBDybwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvpmyge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-872d2ad9572so601293185a.3
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 01:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691396; x=1761296196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jds3ynaWk7maZGNZjrrK77wITeMIM7azLHelkM5HaYE=;
        b=Yka1nkywAjGFdRDEFDyug/FbXPg8X3XRtqxas7wBJ5kauKqXkZtBDIDla2njjyaK1Z
         RORqD2v2ZnvrTod4Z1W1vJfOGAqu2R5GJdViLHEyGfvHqLGp2JEQvy5R4hqDOmiF5Nng
         JTClPsaZs/ftXBC5tgNkjb+gKW1UztU+LcMOdeONeGjWkBueACMAZsRyRKNkue7XWf16
         bVqcgbWnbMcBMo9ePmVPdV693uAmC8YfQq9skoWksTMvIIvdr/M2QcT1xqyq/PHZYTOR
         qa9V81psMU8BH675oMVLrrqsQAXt8su7eLFkzunY7yOQZvTlhPA1QwuR+snuDI0ZVfB6
         AZjA==
X-Forwarded-Encrypted: i=1; AJvYcCXtkZYg2eDKY1yA+rCHGnJFC3iwOuhL8EMRkO/KR/l9tvQRPct6PeDrW54wMM8gJOvKc4SMRQ8E72T2Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvUm5xMxAvDiTr5u6NJlDOJkc8VDtEsTu1+/Fod9PPIigwmHn4
	yblZg5L6TpU+5H7YeI/P+tuEFQgYq7lZkFGjt/rah6g/AzYG7osYpHmUBogwOBqPVWeYZPBQmNr
	2SiD0uK8DRnZtksqGWM47HohC40Dciodjt/s5nKA1OZlmOP6N/jyz/JkJPDiGCJWqaQ==
X-Gm-Gg: ASbGncswBB2LR9G21v1XJ8SzcqEin1+L7Okla978dlf6UKUCzdAgKV0zkQiE1/yQeiH
	6u2h97kwex6xjuq3ZS6jAgHjRPMlBtdVPsM0KSIUp1odCTSgpzXxPINhrB0TpWKQKYASKQ5CkmV
	8O9ko9lECF+pySdPVKiAiHm/l2rwfv+vs8KvucQCSOE5y0NqBMaBQEwkVjkkOpKZEBlTYIuYLx6
	3yA37QDZOquFEcjh12mbIWVQNZKATD3vUgbelu+ZfEwije3dhpD0gVMGwN6t6m1UsgZSqrHbnVw
	MmdM2UMNdTFVmFTHZQ3fKdW4THGaokTVkPIWbNIQlBo/Vx8IdlF5JMJPDt9tqW2S3K1l0pysJnj
	hi3QtQ58W73dm
X-Received: by 2002:ac8:5749:0:b0:4dd:9798:38d9 with SMTP id d75a77b69052e-4e89d397004mr38905921cf.67.1760691395746;
        Fri, 17 Oct 2025 01:56:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJT3vbnCxYuVgQ4mEr8+d9Mj708NZgxZGZG8reI6nw6g7Yp3T00H1A9aIFVKRbqUf7+MnIqw==
X-Received: by 2002:ac8:5749:0:b0:4dd:9798:38d9 with SMTP id d75a77b69052e-4e89d397004mr38905791cf.67.1760691395327;
        Fri, 17 Oct 2025 01:56:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 10/12] ASoC: qcom: q6apm-dai: Use guard() for spin locks
Date: Fri, 17 Oct 2025 09:53:05 +0100
Message-ID: <20251017085307.4325-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f204c4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ctYtm_-0jrJ_p8CCq-gA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfX8aqblqkmozou
 22wqXs9dVn8J+9q7vti+1iybNEr2BJMvO13CYrz77dDU/q64TEV96a/f8v4+zpnWbOab0FqQVLs
 40P8AdHS1ZXnNqVyTy1ChngQCw2RGYkOjUPkXFRlzdRzPncdF8S8D6I7AuxgRO8gScbrgRC5o+F
 gieu6cRDpCi0pW315jHyIqVfFXd7fhUJEPcgjUF+i1dlHR4CRetES/777jQR3j/pTKm788EDmik
 bOp5+p8fttt6hJ9jA3va43a7jH3f9yH71zxMjzGdTy2Y+LrHWArE8jNCa/Y75YL6E5BtF6hNmgi
 aHlwKaOCTMgYnrbto/CUgKhAb/YjLkbkvI8OBUmZEOIafnQLU1291P7Lkczaz9VcR4KdolflFAm
 mpPxaJz24i0AAR833yGtt40e0tbxzg==
X-Proofpoint-ORIG-GUID: 2y60hzhba3s64Idr_eiv5PpRNr5qcD6n
X-Proofpoint-GUID: 2y60hzhba3s64Idr_eiv5PpRNr5qcD6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017

Clean up the code using guard() for spin locks.
No functional changes, just cleanup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 4ecaff45c518..865fb0b3bc06 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -149,33 +149,28 @@ static void event_handler_compr(uint32_t opcode, uint32_t token,
 {
 	struct q6apm_dai_rtd *prtd = priv;
 	struct snd_compr_stream *substream = prtd->cstream;
-	unsigned long flags;
 	uint32_t wflags = 0;
 	uint64_t avail;
 	uint32_t bytes_written, bytes_to_write;
 	bool is_last_buffer = false;
 
+	guard(spinlock_irqsave)(&prtd->lock);
 	switch (opcode) {
 	case APM_CLIENT_EVENT_CMD_EOS_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
 		if (prtd->notify_on_drain) {
 			snd_compr_drain_notify(prtd->cstream);
 			prtd->notify_on_drain = false;
 		} else {
 			prtd->state = Q6APM_STREAM_STOPPED;
 		}
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 	case APM_CLIENT_EVENT_DATA_WRITE_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
 		bytes_written = token >> APM_WRITE_TOKEN_LEN_SHIFT;
 		prtd->copied_total += bytes_written;
 		snd_compr_fragment_elapsed(substream);
 
-		if (prtd->state != Q6APM_STREAM_RUNNING) {
-			spin_unlock_irqrestore(&prtd->lock, flags);
+		if (prtd->state != Q6APM_STREAM_RUNNING)
 			break;
-		}
 
 		avail = prtd->bytes_received - prtd->bytes_sent;
 
@@ -200,7 +195,6 @@ static void event_handler_compr(uint32_t opcode, uint32_t token,
 				audioreach_shared_memory_send_eos(prtd->graph);
 		}
 
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 	default:
 		break;
@@ -581,14 +575,12 @@ static int q6apm_dai_compr_pointer(struct snd_soc_component *component,
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
-	unsigned long flags;
 	uint64_t temp_copied_total;
 
-	spin_lock_irqsave(&prtd->lock, flags);
+	guard(spinlock_irqsave)(&prtd->lock);
 	tstamp->copied_total = prtd->copied_total;
 	temp_copied_total = tstamp->copied_total;
 	tstamp->byte_offset = do_div(temp_copied_total, prtd->pcm_size);
-	spin_unlock_irqrestore(&prtd->lock, flags);
 
 	return 0;
 }
@@ -631,11 +623,9 @@ static int q6apm_dai_compr_ack(struct snd_soc_component *component, struct snd_c
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&prtd->lock, flags);
+	guard(spinlock_irqsave)(&prtd->lock);
 	prtd->bytes_received += count;
-	spin_unlock_irqrestore(&prtd->lock, flags);
 
 	return count;
 }
@@ -760,7 +750,6 @@ static int q6apm_compr_copy(struct snd_soc_component *component,
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	void *dstn;
-	unsigned long flags;
 	size_t copy;
 	u32 wflags = 0;
 	u32 app_pointer;
@@ -795,7 +784,7 @@ static int q6apm_compr_copy(struct snd_soc_component *component,
 			return -EFAULT;
 	}
 
-	spin_lock_irqsave(&prtd->lock, flags);
+	guard(spinlock_irqsave)(&prtd->lock);
 	bytes_in_flight = prtd->bytes_received - prtd->copied_total;
 
 	if (prtd->next_track) {
@@ -818,8 +807,6 @@ static int q6apm_compr_copy(struct snd_soc_component *component,
 		prtd->bytes_sent += bytes_to_write;
 	}
 
-	spin_unlock_irqrestore(&prtd->lock, flags);
-
 	return count;
 }
 
-- 
2.51.0

