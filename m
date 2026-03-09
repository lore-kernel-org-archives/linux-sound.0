Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2273644D4
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 06:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039110; cv=none; b=RouEbvTYTmzBqRXDSRyAskixT+cUgW/ePtG5+Pq51rhqwbgzmra1qDo5ZjI4kvdVWO2PRtPrs5ofwJTGmDE9UsTLBQJc5GRQdrYn0VqKvqvQL76vMuyHyZ47klnvd0HIPg5+HuhyB7nUPEHFubR2oOuu1DqfKPTEpAPiGpxAfIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039110; c=relaxed/simple;
	bh=AhoflfyPSEypIadA7rENraHqNcIi0OFcEnzEL9v8we8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJk7YbfpsqjNR9v2fbTnsLHT2mzcnse5t4sxDWAL8khWlNIEfa5SXJPpS0MeKPQ6gUi+c2NQRZHQiuC/s5j6yaDi8CHyhuKV+u0qg2/2Wzzw5xQ4IQyMZY/KteyJoyLRjvx6SQH0ZqHFdGM0w7iYD764CkdzaBlHacbkCiyCVfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBcKiFzu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZDmKguH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBcKiFzu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZDmKguH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62942o4c224227
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 06:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PS19lL6QwLa
	ikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=; b=iBcKiFzufATgRy1zoFZUpiklVX1
	gM/lcFTu0FiYJV9KviNHHAsDawcynm3Z9nGlgCyStSF9pnf6m+gK060G2KG2Jpw8
	s0ihg8zrNjyFIXgm7LFn9N0MABW8QjhjzIzJxvzEr1bRCrsl7+Tee00EGsA4hNnC
	dtP04U6bGsgR/hKhNEhI/B/Fz3lIzy6uIGA7d2A5QjEVKSvpz2TuVAJVQMZx4QMX
	/d5eYMTZ/iCegvUKnTf+QNsTDE8ktDyi7UvDZOBHKFN7ibU2x7RDoqgwH2f6Ukar
	zYh10Z0xdOIGradw1DWXyY0dLjmvTqRG4xAvJ2mETX5Yu4PaTnYgNFa88AQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbbg48k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 06:51:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd80c4965aso760054985a.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 23:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039108; x=1773643908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS19lL6QwLaikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=;
        b=aZDmKguHDK330XP+2Q/TSicIxzwjNP4meONO/B19zt6XKNIRUbGoOsjtr3tQMOgLtM
         6BeWLw3Bh1IYYSsZqAKUsmQua+ObYNIAHXR87mlquMgmTrMyXwlECILaG/Lqv9dO9cJ/
         LgKBkcWWn05VEUpV9jtvc8ZzrNWEBObq5FT9sSBisRMI+8Nt00hdTI64BYAfCu5VzF2I
         V7DiOzSMgqoSqYBwtNduhuO5gCZoIvaGJUx+n+IiVIqNi17uWVB25JXop/kxFwyPXbKq
         a3qQ/r0BnoSda3WY3Sy/kl45uiqdwCFYGCtSxaSfHPRXyM1wVpDkr9Wdh/NT93GBf+9F
         Ybmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039108; x=1773643908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PS19lL6QwLaikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=;
        b=lsuHH6d2VGtQZOm9Pyj9xmWlAn7LSRXmUh1hAtJoPfLGLV5EA83q5xdc8pI4Ktad5k
         wxgfYnZTaEiaSN9EyZaaDhzVfvHEU78V8p29KIFswxpalY9vgCmzXJp+ATWewvfMMFrf
         IA5kxtNhlyyCUk70MvZFt5OBCcRxoKLvUZLE75jpPGk5X8npjYzo5B0/gLaJM+C+HNM8
         WIUv7jyDIaRSTbzWAT12fGUfJF/TyvYywuMWOaWK0tc7yMn7/w++iQim4T/PmZgsKH+t
         p06tEtKdLwPT21oYXCDaqW1SjgNs74N2rQ+uvp2dxzZCYndCiue5CD0Idbn+/rFJKXVf
         HEEw==
X-Forwarded-Encrypted: i=1; AJvYcCXmOIusIltgARqSkh80L8UGWTepHQrpYgCkci3ZMvhKd4PEsv3aoMCBwvtHBxRh6ABzzqEj3J1sVOqJyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBtUf/y1aeWHv9R/UW7Go0IjM40c9CibuFV72sSpwi60HjM0cP
	X5+5dtGjO+lHZaoxAhZkhuWrOWU9VW40UU3Np+fcOoTnfrANDi9NZGEfWgWEzzBiVfkFMaII6q8
	ruhy/xKzHgzAt9slrR2MiZwHmC3NS7GqmTdXThMd/mTTHMiCWgJkuXWjdWzOnOSIm7g==
X-Gm-Gg: ATEYQzxwmbYgDrk6kEg1Vq5FSlX2HozSo7okT/jkDlFVmJ5yfkiYsXYSbkV30WEWYNW
	j8q1jsK45eOJ74y84u/PKjphLSMh0dEX/NpnqXEhvYq2/wuye2dXJhg4qLpIZB1ygSYVJEPwUfz
	/tVizF0AEmsJjdQtNtuKOxP7ZU5bw9k/rINvRO2Vth3r9BnDkODQOoQm0Vwwsl9rhrXZysFs/BE
	9BY8kUWg9sea/m3hlWlIQmYS7tLdQyLg/0NgIJRm0+EdCVCp8QLYvdpYlWbWqsF2AcPVex0hT/d
	TN8F/Y9NWzhdTEZGeOhqqZyKvemcUy2DNzEVWUjZqguwr9vQyalcs8MV167ztBJbgB50k1/CCG0
	hbueYkfhICQuOy0QP4AwH1CQFvSFZSlwX/XFArqBNOHi0RiQFO8L12hw=
X-Received: by 2002:a05:620a:4802:b0:8c9:ea68:3bb with SMTP id af79cd13be357-8cd63528271mr1556212185a.41.1773039107779;
        Sun, 08 Mar 2026 23:51:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4802:b0:8c9:ea68:3bb with SMTP id af79cd13be357-8cd63528271mr1556209885a.41.1773039107378;
        Sun, 08 Mar 2026 23:51:47 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:46 -0700 (PDT)
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
Subject: [PATCH v5 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Mon,  9 Mar 2026 06:51:29 +0000
Message-ID: <20260309065137.949053-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yqpBMf9OAALlzeQwxAi6BONQqb7ZYl4F
X-Proofpoint-ORIG-GUID: yqpBMf9OAALlzeQwxAi6BONQqb7ZYl4F
X-Authority-Analysis: v=2.4 cv=SumdKfO0 c=1 sm=1 tr=0 ts=69ae6e04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfXzUy7XuWaPywL
 7IRPr4MgWUpaUWUOg0BOVjma7c5rr9xacyUzs5JUAdewLAAqpyHyjrhtSIjHBqF081Zru6aiDdH
 a5ul7VO7vX6HpIKaQm6zbOfUZAbMbOdVyKVnnQgM4JxOvhR7akCdv/EfMA1tWVEP9m0ZMzCfTCo
 6/GVg5d/ebezkT9UpToVlBFN+hjNrMf/y8hBJMk1eA2BDN94M2T3PsBZ9ZfvQLwx3/mW8mExEYY
 XemwnavCPJxBqI82embl3pHPp4t7CL5kN5SPNVSA5N+1kS1ZIolDO7IUDqtCdpZ/L+ewFROPBwu
 Ezms7kPVrPoLdD0R1VIPV/5pW8RpB7U7Ss3ZnMdn3YGjOC/+4aGXkJ26+joV/q2Ih3OJIhMRq/m
 ARQLLvgFuxYCKEz0l5uzHZH1rBzGNWQiQU4JkZNfVBMLTYYLlNUrpQYHd+AOR+f9SQhQUuQp0kQ
 vI09TfucH3ZBiDc2DzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061

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

