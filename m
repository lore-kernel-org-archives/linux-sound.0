Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40BE383C6F
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305546; cv=none; b=aqOTQWtjS8VzQyrCffiDkALIU41s8aEa407PwJSsSVGKQFzB4dkD0d0C412x1eH8r6EJ/DidFS83yn4/Of6MMKtY7ZPwTiY2bVfaizY1+taAlUUp1k0UOR3sVWNoW55q/O5fQm46c+bZdjn966Dr5byzQ3aBJIXlzb4Ayo5X9cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305546; c=relaxed/simple;
	bh=Nn5W6j2KgfG3MXrQpHQ1hcxXhxv/yUbhKAiv5Knj23A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmim3DLdjqGmlEihwTpFzYXZRaSyvf1lYiyERnVm9cOoo1MBKdSICi/cj6yZvfKnsxc3sefBf2xAOfYmqYdmA259AzlwaYjc5IDPSmhuA1jxzOTk8IDCNXNb4pZ3D+m/XYttIrmzcg+FcErP/6rgiAPnrB8UapCORpcin1ag/BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QHbJWsIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSxYg5FJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHbJWsIx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSxYg5FJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHrD9X618994
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=it+OAEpYU8v
	0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=; b=QHbJWsIx/8lLLj6n3P/BeISv0aQ
	kBaTFMKLD+cxAyz55BUhVzExBgrs1cgJiYNojyZnCC30x68+kVZQnUGvcA91hvNH
	CdOu4Dt3MncJkU2NlH//PlKCKSxfgoIGhVeF7hC9N3trUtDWcyqm7CV7ai3T3Zql
	DGHOlqB1c+T9ZTxmhm//WsOlc/hFc+sRghEtJUs3endX3fg7XeHUMitHUHx/E3JU
	QWj06u13jBrbiLLbGd2qxJ8mkOT2Ux2Hq2nT4nKhInbYhBROWXaQl4BtZ0RjJb4s
	XtYkpGWEYq3fpELYZ6gJiXG+Vc4/PMO9WvCblHBrSIyDYDd7xAcMS1jnlBg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgjys6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094741c1c1so38712121cf.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 15:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305542; x=1774910342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=gSxYg5FJvmJUWNNPuyFqPVTw8NXuJDjIWJNPOETNL/QXuLed5zx8ISFcFOlOPo5XtE
         NahxU2a8HRjN/6k3WByFBJMHsBhB/R1rMbNrau+bpJ4Rf72Jl3uZV8++u+bp4n5HrOkN
         TsM8inZeN5VTpyBShdFkyWoVMgSbhJx2WVuQ0lJlbSfbpT6sgeQZKuudIs8eL9qm0oLA
         QNbFfC7wJToeRViSvhOCW2xWOOK8ZSxfUeGw5WBxQxdGSVDASNfAlfSHQ48AALCHLtif
         oZUAbCfYOzQ6FznZlMiFLKAfJEDtqVckrJoxSRxID1yTOeopgvye5w8oqX1z6cuSWIM1
         tLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305542; x=1774910342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=Vnfu9bqEsXQc8Hy8JgsdfrMURaqoLqzO4SbseNdiF34cslreY6EA1knqHdDUKIfS8X
         7w19LB8mDN+G4KZ9+iBq+Ipqq9rluyigv3Spgxrh3HjE4UwLh0B4ET6qSUW31+kVeJgP
         u9gk2TTGhGH2BbAn7H6QbeC1y96qoD7PptNXNsBdavKvyPrJmdSBPTMOwKvWQaHCNV45
         Xz0DsC1kLpySglJsd36uP/MLxs123xHwnr1PtNZ20rsdzt/zuS4+AemffpP48yfctDzi
         oKEkcB6ip3Gupk6lrNNuqS+1VNW0e3PTRFYVys0sTZ3K3e4HtptO6uf1ci5uT85fBnIj
         cP3A==
X-Forwarded-Encrypted: i=1; AJvYcCVMhWizSIf4wasKXJ1yOU5qya1vYW3uNbw4l9pfuB3HDAAMr7v1eNKZTLbRpqG1v7vk3uvk0Q3XPYmOIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6UReZv5Y/Pv4ZvxF3MXCJdjXgxU+p7TAUuTv0LW5bRt5gRsRH
	PhNOsYfZN6qMMOcqa1L85foU10JJeCFYXPnGzoqebvaQp1J9yjCyR+nsb4uEO3P3hpL4OPXdQFO
	SPaGep6AJm3ejhP3aCCh+Cej8c1Gmi0h9Q09QLUeiHFZGUPPfs4rNtJ/uDvdh6xWh6g==
X-Gm-Gg: ATEYQzyytxwcciqyxxfTXdRuQAuz0CAIGC5XS/UfFHERD6XgN0Yh3tbChtClOWalbOR
	+xRfJ7JicS+XRvVtrXgPJmwkL5eo5olOsKK0COFxoK6klfy8l/bLwxSe41spa7xvX2xPD0ganV5
	L3WXYOae5/y+44JFMnSDZCU1ysKF7/kzJXlCSUmbGuQMncAfEsVz1mEMcrUTDLuFtABoNDif9vK
	blrGRnLmOI3RgQuxvuDTdVxY7DLNWrvJk70Oc9YM0rQPjg+MkmVwPjOk4+x10pGcZuLPxk/gorP
	QE57vqcGJ2jvnqo+NUImobmvyoBxVJzShcYa5frtPewvJdYwkMErSudQfQdZXUP0LdSG7WZ0Be0
	YdN6hUjnoOilfjkasDhS4Nr81YlH1jXa8kQFu5vhlhash1RMFmgUBw18=
X-Received: by 2002:a05:622a:5d0b:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-50b373a041dmr159958991cf.8.1774305542226;
        Mon, 23 Mar 2026 15:39:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5d0b:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-50b373a041dmr159958711cf.8.1774305541822;
        Mon, 23 Mar 2026 15:39:01 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:01 -0700 (PDT)
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
Subject: [PATCH v7 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Mon, 23 Mar 2026 22:38:36 +0000
Message-ID: <20260323223845.2126142-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: hL4Pgpq_BX-a2JghZc6OEBXjDqJqyZXm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX041ro7FpQ4Fm
 GxaF6jNQzCSmefhfnRGbAATmz2ID7ieueJhmCTR5QTbtgN/ZYpaln4ZIPu5hOzi1sqyLpUfo08Q
 vduQNEsqO/CvGGfXDV2f7hnc3OdbhahBmZCxQmNDpd66Uj/X5+63WJe7kZO+KDeYsh4bAYWjI+N
 gXA1eQCIHTIKIWQUU/DF4H9MdEGuC0QWBEKMXOjlUm29/ApZXoz0enskuPK8/tQCL5rLEU32wdB
 CjolPk3GdFXzgMB27f7rBw3njOl5LKwgfQYh/PUKfwAXc/FFnitQuupe2O76HQaHTe+AXipBs4i
 9A5HTyEvKJBiUqCaAR44O0lxW49zKEr6J1ZJBWsHwXWL1KubCeZn+jcFKlhE25QkhjRwtzT1yeP
 RkTMkq/B3a/qKUvEUWUy6PuzrfqWJkl3rwz1rm7REbOzN22uk2laN2+8KwTCr+KCSS7p81IrQkf
 56aeTSjMoseZuG/Z+dw==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c1c107 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: hL4Pgpq_BX-a2JghZc6OEBXjDqJqyZXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167

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

