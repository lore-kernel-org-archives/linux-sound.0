Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D8838E5F1
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 12:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799735; cv=none; b=DobwxFocRve6f6MEZM80iDxex/IibBht+8AzVu/r1SYZum1vpS3GIPSl5XlU0azYZGfkQ6ULxxHukdYdebpgrrnJfFwWzTM0v7K59h9aCREy4JgROpKp5BeS87CEY33zDCWORiGmFND6XXSaHwWPJC1MiSS2HYMZI9G/fjZPpzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799735; c=relaxed/simple;
	bh=AhoflfyPSEypIadA7rENraHqNcIi0OFcEnzEL9v8we8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBcpeGJ2hYhodg46pcgiRTdnB3mKHKvAhXEfMjneA9w8uanVaH1TzaXG6h/3bjoNo7283Sd3ZKxbsFK+K3uwqxhY3du95esUhLfE946QE5Pg7asgwU8INc0RZ94eoKrHllt7j6fFUBEjbR9RTbf6rPSe29h5O96MOkYJvP550cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYETanTp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHrddHAo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYETanTp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHrddHAo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BanHG1451621
	for <linux-sound@vger.kernel.org>; Fri, 6 Mar 2026 12:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PS19lL6QwLa
	ikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=; b=VYETanTpP9TKbfw8VB9Q1wzGu2f
	81uLF3VdflICc8WVRkd1rvVwhCU0iaAZSYRe+unDyhiY3uBXgaTw5T5a6xGtJu5o
	v0Cosrptta2XIYPalxG6L631WHKhnC+6i5f3jf4M/HFrTK6eQyI3ORYhStO101MW
	q1rdH4DQTZumHS1d80YmIz9musaIzLNRee6uOzHdX1ntq6fwzriEOD+IKTNZsMEZ
	oqzgAHxwSA/efwk8DSGikwhsP85ee3oEznxbDFq+IJCdGc4X4ZcY4PuWgz3vKIyw
	lFoAhp4rZSZRfBmQiQln8Iy/59MOPQ2hTgohXfXGBXtBDfuYKLiLSHJAksA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9agh5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 12:22:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb390a0c4eso5695534385a.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 04:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799726; x=1773404526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS19lL6QwLaikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=;
        b=OHrddHAo83B86rMGxrGrGa2eUuvzQmYMnxpA361W5V7qoTwTz2v/nJIov1Xc3vnnJ4
         hAQvodmRq610hxRuQR7b1SiuW3qNLBtvMt2xypB0DIoTYFhqWt70wYma9hE0Xt8/HKKH
         2vFu72LndCOXlUPTO6XeDMfEsPpR4MPbiy/e1t7oX8tFwn3vm59yZqDm9sl4ZdV7bkSj
         lw8hVar/XoDITX9upja7IWfWFiBAKyQsOW/87JycuLn/Ku5SvIh2mXq6P50CGRPUbkQB
         90DJ+tH+Reyo8IARq93H8yoSAmG/rTmoHnHZiKb9THd/7nssiaVuRuEg04sZa4T1xwYn
         s5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799726; x=1773404526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PS19lL6QwLaikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=;
        b=sNHEDGoZyQQap3+phJaBaxIRFWAV/B7oWSRAR+xiC824fkbilKFAlvbBeQXPMDnCrH
         mMEqhggDqo+7I3iZXJF5O1SKN22W6QosyONYMxv57ACSAUneHngLIB5kfrcdnaGehXhk
         L3V+5I+X7i+L2q4hoiKkeAOHFSecWi2QIsApaIENf1wGuKS7rkCe6/k5gq4rB+00yWju
         jZbIdX7be1UEjyPAhPzkbMRODVwVeSM4v6XQy4Nne4XBHu8aGX3CagCyJo1sWqbc316X
         FH4uYNqM1TRt1liCQqIjdJYIUCLp7oMQoX/L4YDN1UZDjESfWjQbdqnizA3l0EPLDVlg
         UfTg==
X-Forwarded-Encrypted: i=1; AJvYcCX5ajnNTbfLUov7i0Je3NQJbpqdpzuxEniX5dBvdmbPcXeVdpoTcfIiePugNRyJiwXvfSbdaCEhhSntUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9CnStar+0PFOpkYEkj4oMcghOjDZOmgZhLaIisih+V8EQQZrw
	lDpwDjlb676VFVtbMIA9L2Zw9Z3az9jr0zXBU0Pix/tC9MR9U8hkx4WUOg2uDJP25DCU54WxnWw
	ct7mHsfmWWhPaio/5HVD8LpEb6P7sfd99zQ4wK93viMbz6KCS7elGwUVQsBkBSwKo2A==
X-Gm-Gg: ATEYQzz9N2PEwyOUAySQtbkPh8X35Jfco33+Y8wRD/kyUXE8DuAlMJjAYk2P3bE8peA
	PUdAbSViyrJv3ggY8gWucem2muAzR5wkSkZAxw1Ig4g8RqOV3nsew6B4ytJjQ0bGhlkMrgTuh+i
	U4HcQ48L52YRhdcf5AhSt7Hn26gdLuCO//892HIfb9bbhfQNCZDRYB2N6EQykdxpLTdpk9e5z5v
	1YcgaTrmWv/B8dIeFyzDHspYB3JseLn4yYnimM7s9rvDZ8I9SWAv5AQqYaYcIdN46SrhXNpWKjT
	uQ4yOTlDOWJNq7hV5ERa2TmzzEBcWIarJScKkOZIJJ5khNG71Hw03oPkMox95kRgSosie9h5wRN
	U1sjLal4RxxQecjJegPwojAHoZauC0YuD/y0SwCeTLV6BpHUHO1RjTaI=
X-Received: by 2002:a05:620a:d8a:b0:8c6:b247:4c with SMTP id af79cd13be357-8cd6d3ecdeemr229073685a.2.1772799726350;
        Fri, 06 Mar 2026 04:22:06 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8c6:b247:4c with SMTP id af79cd13be357-8cd6d3ecdeemr229069585a.2.1772799725934;
        Fri, 06 Mar 2026 04:22:05 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:05 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v4 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Fri,  6 Mar 2026 12:21:07 +0000
Message-ID: <20260306122115.509705-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8NaLVykPJ_6Gd9SEywyz1QJvKY4n3Czh
X-Proofpoint-ORIG-GUID: 8NaLVykPJ_6Gd9SEywyz1QJvKY4n3Czh
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69aac6ee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX0TQInsTvkFqt
 PZAJ0kEDsIcXq5KaAlhvyCay8HQHvkew+zOCVYo/DZc7QJiHuQI8cCBuCYQGZe9FrMSuRmrc1Jn
 dI7n0ZI20ZvWZ0bu/4aFOyTLQtg8wVwJyl+MxYYeKZLt1xgms1+sK5ehxMf5ZnSk6MUIpqxIe6w
 931uwExI7BUyfGtKcZ0SIo0hcV7U5svrMmXB3gKZztsy6kU34zOkNlkbYZPocEZNa/qL4i9HnRn
 GZKNnk5idZh9V1bbPKiP8qPXv2cgKMwmGrRvN0xnIaKB1GGyp5mxzjYK+UKMDJWR1Xy5zM1l47w
 0FR94jQ1H4vRqQWATM4/Caj4jBG7G8qpiSIGicoXj/qg+iPuvfGWtVR+oquUBrB9VyNFl0Mvsiz
 KH9s+Y9cAGdFeUrgY8WX42fKSKqZjBjQGqXBHMVpOpc2NvHnOwna5r0loyTHkWO3Kmblr6ectJJ
 q3EIrfBs/7OUdZbXhHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117

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
index de3bdac3e791..3eff45b241c9 100644
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
index ebd5e3ac0366..f190ad5e912a 100644
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

