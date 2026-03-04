Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1482E8B9B
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629646; cv=none; b=qRFEQA44TWwxUAKntEqtASwtMapQD8m+5i5OSx1XxhZ2y/0N8MM3OzNyTn8HmMi0PoOwK292q90hqeeDoVFHwIxyLgKwAiBC8jQ3KDoiXFeg2Dud0oMuSjHuKzokczhmQag5mZ9OXK5QkxSGKC1dPjOn2Sad54GLAzkCir/3+qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629646; c=relaxed/simple;
	bh=AhoflfyPSEypIadA7rENraHqNcIi0OFcEnzEL9v8we8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sn0TePWJwR9ZjpkMejLE/hf8Q9nRK8AJdmWjpByCs66omv+9ul8bIOZ2O4Kaf6tKnx0wer5IGMHVxU3O31nVfHHI/xF1kCgGNqgiEMyeUC7tfIQuiXR0pmfp3WbJzNTM4U4a2U8+j1fviScQnwrPPsB8neem066vQkGGs9lKsI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6NMvo5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnoVotb7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6NMvo5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnoVotb7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624D3tx7957847
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 13:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PS19lL6QwLa
	ikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=; b=X6NMvo5DiaqLkarnGukacZIf3Pp
	KUpkBmh2/n4zstZh0MVQ5M/OLoFjyrL+xIf8hYkJ0frgdcnp+xgWICBgibFS3XjE
	FxpjOOJnO0okahQH9Aa8rseTNErMB7ayHHKf9kMG/3c2TfrIoa2+/wDdYhTJdHfK
	ZYq5j7wcHVPiM8QosHQ9sCzfNIaFyGREKyO9mYL2q8cFGkUe5dW2xT3NnJZLosyQ
	I3jBrjXV7058/OUhuCgbXF/nkeLIy2gsBYib/fQpp8NC+3UJK8r7jqn3GJ28qzCj
	3AxKQSAdy/KBVO85Th4dCob36Y3mIu9Uzdui3B1wYe33BE03ymONTh4hrHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp6qgaxbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 13:07:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71304beb4so788581985a.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 05:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629643; x=1773234443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS19lL6QwLaikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=;
        b=TnoVotb7k2U4qIj4GNsKstRDRVMCKlPKVz7lyqtGaaPx373P3kxmgu8Rc4kh+g/DAT
         pCuUYcBSejGNKJxRcirxaQGG2kpvvxlQqe/N6qIXtDlX+ZXuWHK6yGfpa4horXMzOj9W
         VXHU488x78UZd8W4WSf47CWndUaZj8CTbKYiyHe5XXoT+odr2/MG4WYK0boE/lTwxPT1
         e0YXBRyFx6mftmiiyIV7WjuIU/Yldnd80pzgq+C9HpC+bviSREb5TceA+oIeUOOvR5fB
         fL0Lk8OSpjKjKuk1Qqr3TGWSCd49Y/iwSclh8qrsW4jIX1qSuKNo5fjefKmzHppsI1xd
         OPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629643; x=1773234443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PS19lL6QwLaikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=;
        b=CM7zsaeoTMnVGkZY/vv7Im7yURisv01M7yMXHhhs+Ztg7A2hBfWEydrwocPknQCEyV
         YqpVE6li99T/eb7UdtFk9n1WTbctk0pejqGHv75bnT9XzP2JpKo173A5bL4RTVE3p8oI
         /TwxhplQTzFCos4tdiHHJfLxg/ktM75WtTcK8239Q6rNYcagUi9QkXZ7AjA8V+xKVr8m
         4jqWrPp1nWlxHGyQjekJn82Ac8opW2p1F55uhfPii35mJO470EbffHi1GwPkW9DjH+mS
         eOnymh9Tr6qBINPdk3Lh6nmZfcFH5b9xGaDnI/8LDubNWcHS23XGzeDcuZMSjHZ2GJhf
         R6Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUjtUlMPHAlc5vImlSvFHsVMzQuOspc+hGLMYxzD4m9M05/GnPpxT1S2rupfGcTyajWx/KiaPETxvfk3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaPUAaA6hQZteod7uie36XqUTFZBu8chHcQ8fQrhj1LY3YbTpp
	wegE6X5Ay40Npz/rAmQk/2659QqI4fXTf8sRYvOxlSRXxidXEKSQt/iQnPN9dso4SPMr83eVfC/
	9nStniC84Qxw1fxyScvIOmkEJoYsu6bqr6ZiJMfEpHKkXQmO8PdYI0h+dkEOu2blxSA==
X-Gm-Gg: ATEYQzxEcWgoZNcKDVp4e/uHU5FwD9m9+gDbz/jK4U1cMvncKHr5X6xgG+lptQB9tty
	+oNm9USWAq1MWjua4GBhEh8RkFcKscLQNxip4jRAiBtlXZX14aAW7ZR5yGqsh8Fv/s8/keZ85rr
	VEafUeAFivfwyax7HMdp9JeAHKF+4Uhdd3g+pnsak8JKfAGAappgzD8pdhEX/35OzCl69yEO4oZ
	9drb24rqZZkVlHNMNFFk1hUFZ40z5QctlavPBkJ0hwBHkLRUSuTPBtCWi7swuKRJiuKZ+5PH3y2
	BQd76fYNLVXh+QlGyOYVvBXnLE7wVKVHUznhEEymGbaHn9y/98MZn00A8EGVAEkpwTLXJguKMwJ
	oUQUWmtZYegCVMGbiI0tcmyUJ7oeDxUkmaSvvUCF2bPJbEXW+sZAM2us=
X-Received: by 2002:a05:620a:d88:b0:8c7:d2b:b5c9 with SMTP id af79cd13be357-8cd5aec945cmr205979585a.9.1772629643538;
        Wed, 04 Mar 2026 05:07:23 -0800 (PST)
X-Received: by 2002:a05:620a:d88:b0:8c7:d2b:b5c9 with SMTP id af79cd13be357-8cd5aec945cmr205970985a.9.1772629642975;
        Wed, 04 Mar 2026 05:07:22 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:22 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v3 05/14] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Wed,  4 Mar 2026 13:07:03 +0000
Message-ID: <20260304130712.222246-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX/v/ftsLXuDAj
 9bGUoKnY9/UYNBXhJ1R4TK6hRzxUWwoFFRf6y/DhUtyCMOLbHndJ3IzTaBj/csp4QuORmKoREN+
 OkRwolKRSfR75f3lqDFzj7Fb8lSEBS0VqMt+L9rR4B2Mt8K+Zl5K/PsVvbso0L1GTN9m7vzbCD1
 lqpDX/CQYo8y5tMtoryv/fhNl+2VKgmpQyh2x25H7DWyhtiG6irtzJEGK3sToR3gHBsBiM9TQb7
 2r7Fc/yBhFE7Zy8OVWrCZQ+p5p0iKd3sgueasKtAraOA84JtWNZqLfBNiYu6+zmS6s2QjQ6QHjQ
 G7JBwOB6MPFOXgZvkyQmeT1yCHrKka8iqi3xiDiIE0zOdcH3pDoYv7pUEFYoFPJaYCVcoBxHw1H
 omWY4EAz7zIXI82qEeEydQYh1bVbTVTtywNP13U6ke0hYnamWP7e6fyipAWX8dX36e2Msnex1hB
 zOTSkW907eW9XSWntDg==
X-Authority-Analysis: v=2.4 cv=UJ3Q3Sfy c=1 sm=1 tr=0 ts=69a82e8c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: JZI-YnqLZ4JUFJ7M7t1rYytXU3LR5YMy
X-Proofpoint-GUID: JZI-YnqLZ4JUFJ7M7t1rYytXU3LR5YMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040105

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

