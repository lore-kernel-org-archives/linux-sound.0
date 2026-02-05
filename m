Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A71943CEE7
	for <linux-sound@vger.kernel.org>; Thu,  5 Feb 2026 17:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311661; cv=none; b=TRQIRTM0p+Sxr6KPSUq+a3Kmy2dFpeft9t3JehB6+o/49m58Z8A9UBQa0Zwj6EtD6kB8ICAVL7GwtEHY3SfUYWHbxux2IDkeA+sl7a9fzwLO8PNnGv/Ir87+Uq/rZZOtygJRHVTGbedqpWG4HoXAbx8IRH2kLPrduuwnCItMnnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311661; c=relaxed/simple;
	bh=XaUu0VWsXIOKq9aElMOeuD+T1g8fF6us2kR3AzJirng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5tYxyfyq9aIZ5NbEaVegPveIL86iYevL+CuTleFK+SaYJnF6Gvjq1xInvZ3WU9EHkT/IWwI7HYaXqKwdb7T9oQr0elzvY7UO/jw/fCdYHh5UO7QZ7cOXtFPV52H/gAA77Bl1zYzJlz3+9bi/WpKcp9db+XeZKozQIKAT1dKvnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtTyeQhk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4fseVDl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtTyeQhk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4fseVDl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615BjjI24125690
	for <linux-sound@vger.kernel.org>; Thu, 5 Feb 2026 17:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZoB2N4YhuCT
	U3IhDeytsYqmgYo6gsKL6Ikjrrs1blzw=; b=jtTyeQhkMU0n33LtUdb/sfVLWLC
	x9dhbYT9AefdJAD6dbEWxYEKT9zObdeGkGFOfdMoDj8/oJOwnzq99QVoU3U0Ujhn
	B2zwNI5o+jiPT0LjxrTuBNrD9aOQvks8z31Mg/MlFZjGwlA2ah794ADQGMguoWpi
	/LJC1WLotDpVeMTV1WAYv3KXtjLVVLnYHLj7YRH45fqVIbbebfqLh3qJ8DLguBqj
	AuWw3A0lnmE84c/Db10PkzJlqJkh3K+h0N0UQTLrQN0VyAXFHjkYMh9XhlgQj0PT
	ooH/Wv9dmtv1MErRxcUnbPWvQlMdaeh3QEM7XMdsNsGRWodEUva7ExDPZyg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tm8s22b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 17:14:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b315185aso492967585a.2
        for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 09:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311659; x=1770916459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoB2N4YhuCTU3IhDeytsYqmgYo6gsKL6Ikjrrs1blzw=;
        b=Q4fseVDlDkyLG1yRzXcHBaLVBSWsl5Qqoo11heCQFC8oq+N3ALqbD2MU/86swVFnJ3
         9hTXhzvO9mjLl8jy40KLf+6K5bRdeofOEGpnChBfdEmbMTq9s7NJSIKgj97VLVOp76Z6
         ZrbLQnRuN/GSFJZj7/00aNQuj3nbk3diijfxlKT6zUHZcheZ9hsr6RnPZ3yfcVvbQ9Am
         +eUBeqL45wJhrEhtIrSHuGavxapYpZjaT8Wl3SWOHPfc9IGnP2UJolh08kbnYCJHjRHs
         38QiPgnjIOe5tbjTQXGjSgF1NRHakU3YddRre5gBm88jlWUXjWK2LuNk5X8rDQsa+xX/
         VSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311659; x=1770916459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZoB2N4YhuCTU3IhDeytsYqmgYo6gsKL6Ikjrrs1blzw=;
        b=sccY6LIv1+ZRllNsfpxcoKQZusAIYRkqWChj/gRc/Hstqxfp9ZAUJk87JbZ6bhiYtA
         oiCNhgKoGBzhDMqI+vCizHTpiek1w1hFN8LAXPf3sljlCQIldk/mwhvLX+pIPGoH6TVu
         yAh79pRY3t6xY7Vpeha/GrroTz0zWNtk8w8+k4qGLYLaOqaWkKwoGnGpmmVmzAODmaPJ
         ovk30hqIW3z2z1b0B3mXx2HDUJv2hMH5IPkgVRJIxKpG+LF2+IuC3EHmPraQJPYWVnnI
         huaXOScBfWknoJL1bxPk0bd6tGe4DwEvk2go8L+Pf9Lv3u5ir9hKGtlop8pcDnsTFkR3
         XOcA==
X-Forwarded-Encrypted: i=1; AJvYcCVkm+cvhQq1go6e1E+W2JsCEKXhbGWn3rwMVtbL+eqQzl7UoAbIYJsgTk01lMsq4nLMtvHmrH5tBuAGlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg8vyEdCNfVO41eQnP400NOGYf/2KKE3LbqMHfv0FoO65cxqrh
	RsTFwf5CnxcBShj+2vPUQAU+yBqiatEAnPMeWyTdwXd5iAmIPNsAnBZMNVkw66Y3yy+6kecPwX8
	rNdP4Z2YGuvWMpX62D8d9Y0APPeOJymycRzQlvHgyt2EYs2WQOz+Up8E0F0lsifctNA==
X-Gm-Gg: AZuq6aIp4UyJysLQyO1mZJerZHef8zDT2lJgrLaBP5gPsxdKXCcmGFN7cCcKqWN8acM
	CnliEw4OOdY13Ybj3NuAfHmrGOJH7aCiiEd8X7JHBp98Lr1H+BIjdbni93Cs8VCR+ZJfNNQERgy
	F8G7ZFP8STMza3R68iyW7Qqdo8SGAaHll3EXJZuM5Yd+11ict/QrxS8LcV9DahXkv45I69Kd4//
	RJfF4LkU153LvIjksyO0pTFwHgUD81wUu48pljq09J2JDrEEg6rKt7GnvBOC77TTae/dPog1uy1
	w45MxFaNtzu5xiNwr7vHoHIvxkGGI1c08YIIsZrJMQtEPGT21dTi+7TwDepfb3wxm47T+Y+gnWN
	HjnjvamnFeq8ec+zlnQxL5Hrnz9Qtm+bO7BUiP8Kj2H8=
X-Received: by 2002:a05:620a:2681:b0:8c9:eac6:4168 with SMTP id af79cd13be357-8ca2f80e2f2mr795714685a.9.1770311659541;
        Thu, 05 Feb 2026 09:14:19 -0800 (PST)
X-Received: by 2002:a05:620a:2681:b0:8c9:eac6:4168 with SMTP id af79cd13be357-8ca2f80e2f2mr795709685a.9.1770311659078;
        Thu, 05 Feb 2026 09:14:19 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:18 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        cnor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 03/10] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Thu,  5 Feb 2026 12:14:04 -0500
Message-ID: <20260205171411.34908-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vd76/Vp9 c=1 sm=1 tr=0 ts=6984cfec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfX6BwPEpVhRV5S
 ynuoSrpRNlpMgSxoYTSAQX57zjhcTXTzAYlgUkbT/FeroQR8eXdmQzqVnzHJ4ZLFvNXyFpF92ih
 hcG/3JMNigl6vH2UTXM+xUjQwdjktPMwebkXcGxKRby/uT7rx+vBMjjEmvZHu85Llk3rESdGBSI
 9x5by3iBporMt9xiTjPKUTtugFuJpSEaL1w+5o/O1fJBBDlAoommH1KdlqgVuHZfGiW/OnuwGiY
 H3YIXXZASOG5UuqpxV+zK4C30fdWIvMbXlNsOI4pixVLuRm0AdFQ0SnziAMYQrOdGocmi9c2dq9
 8/ebKo9Huf/7p0shqcxjgsNXBkRz02h0/aFPv8Gf7XxUH1DVy3JQUvG/E/IvYmA3v8F4P3XiCj6
 qg7al3QVn12EL/mDBX+qsmANEJOagw+ryUm9RmurNR6nakRTpvKOXUiDXt7cYCta2xKnk5aE/LX
 xouPmdZn7axfa2GaAnA==
X-Proofpoint-ORIG-GUID: pixQkZ_Q5s5siz88-drdtnMX-AB6WyxR
X-Proofpoint-GUID: pixQkZ_Q5s5siz88-drdtnMX-AB6WyxR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050130

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
index aaeeadded7aa..87e4474d680a 100644
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
index 1d5edf285793..2cfebd622be2 100644
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

