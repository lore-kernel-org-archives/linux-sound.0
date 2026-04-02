Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACFB3A0E8A
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117510; cv=none; b=oTEDh5j2TW/E+eFDgCKEni4IsdBnKXe4VzISqhfddJB91Un/22O2Kl/UK7DyRi2e9ScFIi06dOwczjOzW2FFlwNds2wzvYA3OUXtrQPctJRkNEKsi75nA7gMv+7DA7BuC5ERIRXZjsBKMK9AtK0fXJLwb2n39jvy9b1jrAZR9jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117510; c=relaxed/simple;
	bh=Nn5W6j2KgfG3MXrQpHQ1hcxXhxv/yUbhKAiv5Knj23A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aq7XWz3SSKqBFvehNix3Md4Q0rDq+VxxREiM78BxIPYSriOYdcS7J3ClJsTR39UJd4wGEgAZTDTBoqJlp0urJAgMBxR6ZvO66+KD6wOXhkIduY5jXm+TgZJx24j5SOT7uv0phFyb6uG4ThlS6nJVr1aZAJiPRQb8cMJA8QPu3M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VunrPcgz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ax1EiWH7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VunrPcgz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ax1EiWH7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324QrDT1551679
	for <linux-sound@vger.kernel.org>; Thu, 2 Apr 2026 08:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=it+OAEpYU8v
	0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=; b=VunrPcgzCR4Khhq5LSz9P3y5QWz
	rd3i7ujxBJdTYvcqnClTpViVW2hCkxj0siCNTQmKHHrJiMNo86Att8TNMcEMV9KY
	8oNUeU6gaxrC+uq3T+Wo56M4427r45hc2qLxYjK4WWYgpbmgNarClxWyQfeJHFV0
	LBVpODUNzfsA/qekN0Ti4c2YE3E4Yn+EFOg/2v8VuLE+dBfVJKAW7Jyi72OQmo0b
	AmtdYp9wjFCTQBNiBQlyUUQ3tqds/b4Zsr79+hdimJdY+wXayXiEujNRJKlY8Rry
	EOBh2O26HPZffO6iy71w9w+mRz1rzdk/2Qb1D5bq9Ci4MrAt3/aqQgBsUcg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heerwce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 08:11:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093b92f327so18374321cf.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117494; x=1775722294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=ax1EiWH7sS+miN0M3o/OGtuXIKfiJrkJPHNejtx56wmvOv8ZP9EGs0IyqgCWGAUsbw
         kcD4pXhDAE2/jZMbX4HzO3SYW4OZn+adGyo+YC/CdynJoSZ01/MIYKMIlmtY0a9tc5Vb
         ApX909+XWEmiaxywD/GmrB0b7W+4OMFlrmrcv6+uJrSGycKs1YvqA8ZHxBfvb9ergjq9
         3owJEckXynyL/gWDwpHu2oJUgZ/vT3ictMWgLmtd4bJ0seHfzmzZs8QoVG+6+8RighFd
         UMGmtnQcVAXTJOgkaOMkkKKIq1ZCCLEIdfV3v1PsaFJvWHQerBqXgSAnpKqKZuP2S4A5
         TgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117494; x=1775722294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=AqMhIveSmV8TmNtF1g7IQ1yUz8jcKOe47Stk1GDhfmRd3QdlsH37HUioDOsDJVk7Mn
         5VQkcei9jHsyjCsM8OYi/+7lOQ7pDPtgL8mDT/a47nBKrgBEYAsrzo24NTkdn6O1XQ+4
         31XKBTBX8fotjmrf+vP0wW64z9KTCNz72rlzScC4eQOO8rXkwJop4P1Ro94/heVIAXCB
         4Fnp5grRb3DaaGKpvQZORM4/ZH6yvtmUnib0EoHPaWSCM5BXCaueP1oabU0eS4uAiWHQ
         qINgWrCa7q4ToGeCTh9ZCbhMFculd6kd3WDfvzLfcCfvqJRZ58VaWiBIWksy4AVf6ugY
         CXqw==
X-Forwarded-Encrypted: i=1; AJvYcCWFNUgeqeEhmQFL0IB7KbYIsDGX/PMx1sOQGwFd9uaQokO0y+VO0VaLF/d/XGygxphtYVFu3w6Orcf8Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo7W+l94sQTUhpbxxhwDGgLKn/1iW+J4l1cDrD1lXd/xBB4IIo
	1/uBsmo0M45NabP9M3Fy8xTrpR+sNQsxX8vEaMTGqN8xoE4hvbtSBC1sw48M25dTBjwp6RqPnP1
	tc7wfHcVL8gw80dZSXrWNqt+0ea/Fgd7ZQJl5KvyUlZc3O0EzSmXBB8d2RjLiEWWE8A==
X-Gm-Gg: ATEYQzw7QqmDMHsgLPGDXiMX93jNjwKfK3s3SzpDEeKnx5GA9oU5oS3zS/uCu4U8tpP
	uMpxJWUevN8CyaKdQIMnlUK/n8XzZQdJ76CB1XMlMjHswVSRlKnKa2pnsa+CoyrcAUiIHYgzIZl
	o0N7qtaY7aFzscaNESke54RkB8BkkV6Ye8ZGOe81/N4yOuiYkkQWfr76Ik5f7kC/CrLB6XiQ6V9
	Gx8HTgd3QclWii/frAZ6R1iX3dhkYYUet1g/K1Nj+1mt2u8O5g4hW51FViCaCGIFJInrcNB/NVN
	pjyq363dWCJzGHv4lMqq6UY5ZeltmjxFOz5ZSb6n8biVUJN4A50zw1YpupDZ/nyCp1CmfXX+MPD
	5jQO9QPFzlByp0QSeC/Ppf2deuEVURL3iB2Dz35eP1aFaUbZnYUhEjvA=
X-Received: by 2002:a05:622a:1e89:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50d4c1176c4mr34007061cf.67.1775117494377;
        Thu, 02 Apr 2026 01:11:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1e89:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50d4c1176c4mr34006791cf.67.1775117493979;
        Thu, 02 Apr 2026 01:11:33 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:33 -0700 (PDT)
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
Subject: [PATCH v9 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Thu,  2 Apr 2026 08:11:09 +0000
Message-ID: <20260402081118.348071-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: _HdEvqAHx1LnQ5W2IbzvwRXBrwZX8kf4
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce24b7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: _HdEvqAHx1LnQ5W2IbzvwRXBrwZX8kf4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX0K+gui+lncQJ
 WyR/3kL8br0sgJEM9RdfhvzKiwLqfhGmlGlyTOxrVMKXdgB0Y56zlDQzbnrvVVw/umwdiPdbnxE
 0HuyFeCnzvSa0IfpWA5gK915BUyNEQ4gIK6XnE3BGbHYjAY1cLH6dRGYza3hFLQlydPk5oNqTbr
 50pqYwNLGPAgBCsra/eNo0lr7HeqjhqImT81MmpLa5iXiPDh1DGjGEHOsRkvAasYq3Fw0FkJzSv
 d5QpgAvswc0syo/7+juBn6TKQDgQz6v6GKPMAlvUgmMcr1tYsK+pincGR51hpwEaFrid2wfAuAs
 OTkuElQSLySS2ZdBCU5f7VP62oDLUv3LJDbQO4GVl7JacOW3oa2M3b3Q6qj6GV0SoTO26QV4F9m
 CbL6c4yp66ZUU99CJ/8+5dUjN/gkZipneEWUA/IncT/dM4zYT0a3sEV/76RLdPvrYrTe2sJqvbj
 lkrbdHT5F/vudhLAPvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072

As prepare can be called mulitple times, this can result in multiple
graph opens for playback path.

This will result in a memory leaks, fix this by adding a check before
opening.

Fixes: be1fae62cf25 ("ASoC: q6apm-lpass-dai: close graph on prepare errors")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 5be37eeea329..ba64117b8cfe 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -181,7 +181,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * It is recommend to load DSP with source graph first and then sink
 	 * graph, so sequence for playback and capture will be different
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
 		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
-- 
2.47.3

