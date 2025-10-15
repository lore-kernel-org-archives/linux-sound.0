Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E4821CC6A
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534299; cv=none; b=uTn0iRJyeYcRilBoc3UY5EdBMdOsU1PnV6yhqE9ODk8t7WZAvy6JQMGov7fj0+z3TMljI8cGCnhT4528V3G6GygeBjYX+x8gTpXgzMkJhK8uUPlaRNJaRT055gxdqMPpHARQ2E3QTv1eohZvjJYoMgS+Od2O94lR80qBlYQ8nTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534299; c=relaxed/simple;
	bh=PF8KzK7QUo1Pnp8R3uu5jVDc2qztm42DD2eaGLKLB8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLSvNjh7wpSo5aHXmM0uUWpzB2EFyXg3aUVmX3VLdUsgQJ7ljOkljw7UjCDR6ssKi6yUyL620Z8EKIhoSPpwbG9cpf2y6PuQ2yKmrp9HvDhsaSFecHhIgqwjxCj/sVfdVoF9JRDuvLdmeuvhoSLvDRfu+BT/BL2xNERRY6e+K5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eaMNKWYk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eaMNKWYk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAwR75009231
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=siHiEg0ChON
	De0CD1JcwzaBFof10K1E7cJD3IESL4/Q=; b=eaMNKWYkF6I6aWt8cgRya5gIy2K
	dFimXc2SE5MVoyTR2l8BY38gxHp9zfJc+UiWumO4VAWx4CTfWP4ZFuj1vfzJSMro
	HddfFiZTaXjeMtF45/Wm9krg1/V7IN3soUhUxHA2WF/WXz0pjoZQ8dlTeQ1nzK+s
	fCSgxTucz32XqVrm+gNpNHgEBHQS/fZMSfwlxoqhEXZdzYjanMWhiu1RxdMC2MNr
	EoRBvatUFFxVRx+Q6/YdvE+prw5ps7N3Ngxb73TM3UWIJQ0W3b9P7CiLs8rvTP+r
	kWGAK0xxJBt2DZGJuTIA/dX/6/Gv9xkQ3Jose3l8vaJgy2KQVrQlbi23iJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c4ec9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8645d39787bso4041736985a.2
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 06:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534295; x=1761139095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siHiEg0ChONDe0CD1JcwzaBFof10K1E7cJD3IESL4/Q=;
        b=SgfjV7+jmqDfYb/nQaXSNFW4wAwg0f0P/G/f3X64P3a2Yxtxj/3yngbN9WMv37WcBz
         I/G35SXxpeoK356b+jvS7H0s2o/beDwROeGBUXc6D3htoLIXVEqpQ/k/f4EqxtznNfx1
         +1iFx/Dt+uEsa0/9f1D8vfNAoIi+vf0yEY821KNlb/RV5w/F8MeGQjkFhMIlBvnpZAHh
         0eYNGsQlpdTdgKL3N2mHowJC0Bq5Wug65/elqURadnh3nXLvXuv7fVFsfSyCz0yb09ay
         96aULFrv8ft2wMnlhNwKk8n2FyVgn+QfE8dhmMGKSm3s8b8dc2/q6rRl93y56rbrROBH
         PndQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG6Du4HRivwMGCgs05+W6VfOjTeHC0uKpkIjdbTtBQ9npnPLgkRsyIEJSk5CtLjF9qW3fDjHxUTdicxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8n/9P4blvhvKjUfRTQb5h/DoOz52Fe260sg4pF2rXiGMns+Qu
	2B9cdhlmrA06CTnxz85dU5VCdpWYHWWVi09oKymayoHwrQsoMWvHsmXtV3gc51eKobJii/o67MW
	PeAKSo7F9ZHx7BdDpT70IBYtBuH4Pu/eK0isMQSLsKK/3SCBbtiEEi8Ffe0Why69XOA==
X-Gm-Gg: ASbGncsJyWVbgGLseHMact8YQP8wdnb1MzAdCl18SyKsqr8od4BNNaXZEupSoNMF+C6
	/MhLUcwtbesHOxtqcaLFd+4BI0sikQaaPqUx2VdBa8JWmnEV/YIXOJOzIxolacHGgC+2c41d8r8
	I3SlaxRF32vsn7PlMT0rSNgLR0DmP0gxH1Q3Iq4ZZbiaiHblmOHqjLfrK9N30BhUU0pihA3COkU
	yednIwguKdhAc77gNgpuAxVjENMf633lkhFH06avfEIh1mZsQKWWWohAEj1ruvc/zY8ZVlgx4nh
	zB8WC8TvaNvXS+b3j00z4hkhbhvxHf+lRlrCMgOy7QzUx86XtOZRAA==
X-Received: by 2002:a05:622a:30f:b0:4e7:222e:6725 with SMTP id d75a77b69052e-4e7222e7357mr143717891cf.8.1760534295284;
        Wed, 15 Oct 2025 06:18:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0npG9+1zbTGtTaMbasPsz8fCXlWoscmPo0jpNvyvC4yD+pVmLW3dGwrcnf6T/u6dz3SeqvA==
X-Received: by 2002:a05:622a:30f:b0:4e7:222e:6725 with SMTP id d75a77b69052e-4e7222e7357mr143717161cf.8.1760534294610;
        Wed, 15 Oct 2025 06:18:14 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm262081245e9.11.2025.10.15.06.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:18:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 8/9] ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer
Date: Wed, 15 Oct 2025 14:17:38 +0100
Message-ID: <20251015131740.340258-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sXfMqoXPopdFvHLHYKw-7p9WXCl3s-_b
X-Proofpoint-ORIG-GUID: sXfMqoXPopdFvHLHYKw-7p9WXCl3s-_b
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ef9f18 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ngjuI6RAwNlUvKc_ZX4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX0OxjTrjCjScI
 JQQHyNQCAhXxJSSxcAGXkpZJlU9vqdsDOXoe8TI1Tv2D5BEGqDwGtjWB444f8jetDlO12wKsmqL
 ubIOXgyj3rndyW0i0ngIZ65CecPa+WA5xbw1ShB2eeTYE/xfDm7xhjj2IB9W4nsXJqsNEWyhX3L
 aOufH0FQagNhxQSFMDB7PxaLEaQPNRNWrGnDYRbCc+U3PowQoXQh5n/phWqi35kYBY+6KIKyASo
 cV3zqMLS40+zTRTzLnT/vDCPJpXI8lbvIQ+dWRjn0dAFjNhe64r1wq4k0RJizufN2PkUxY/YXr3
 GuzkGpjXKLuhhxB854Mr+/Q73+q6JvXXI2QUNiEiQlm+6HIF6nANjap1IbAU+CqivvfXPMlznUb
 rhQQmFSNbSb7QIkAhJk4f4vyZBFOSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

make use of q6asm_get_hw_pointer to get the current hardware read/write
pointer and remove any additional code that does calculate this manually.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index db2ea8973ac9..c2a33d6a0827 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -58,7 +58,6 @@ struct q6asm_dai_rtd {
 	phys_addr_t phys;
 	unsigned int pcm_size;
 	unsigned int pcm_count;
-	unsigned int pcm_irq_pos;       /* IRQ position */
 	unsigned int periods;
 	uint64_t bytes_sent;
 	uint64_t bytes_received;
@@ -190,12 +189,10 @@ static void event_handler(uint32_t opcode, uint32_t token,
 		prtd->state = Q6ASM_STREAM_STOPPED;
 		break;
 	case ASM_CLIENT_EVENT_DATA_WRITE_DONE: {
-		prtd->pcm_irq_pos += prtd->pcm_count;
 		snd_pcm_period_elapsed(substream);
 		break;
 		}
 	case ASM_CLIENT_EVENT_DATA_READ_DONE:
-		prtd->pcm_irq_pos += prtd->pcm_count;
 		snd_pcm_period_elapsed(substream);
 		if (prtd->state == Q6ASM_STREAM_RUNNING)
 			q6asm_read(prtd->audio_client, prtd->stream_id);
@@ -227,7 +224,6 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 	}
 
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
-	prtd->pcm_irq_pos = 0;
 	/* rate and channels are sent to audio driver */
 	if (prtd->state == Q6ASM_STREAM_RUNNING) {
 		/* clear the previous setup if any  */
@@ -479,11 +475,13 @@ static snd_pcm_uframes_t q6asm_dai_pointer(struct snd_soc_component *component,
 
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
+	snd_pcm_uframes_t ptr;
 
-	if (prtd->pcm_irq_pos >= prtd->pcm_size)
-		prtd->pcm_irq_pos = 0;
+	ptr = q6asm_get_hw_pointer(prtd->audio_client, substream->stream) * runtime->period_size;
+	if (ptr)
+		return ptr - 1;
 
-	return bytes_to_frames(runtime, (prtd->pcm_irq_pos));
+	return 0;
 }
 
 static int q6asm_dai_hw_params(struct snd_soc_component *component,
-- 
2.51.0

