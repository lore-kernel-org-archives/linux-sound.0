Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1B1364021
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 06:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039109; cv=none; b=tOEo7zS+ZTm+6Nkq1DD3GbRHP/TkaXQ+FR4hmY/lVFZcVMuCLFEGb6jFpugY2Hrm1Gk4uTMEdQJkw+rXLWmDVSG49siXIjz7G70+nA0ubSOSAfMq7NH6mRHfQuHw+85UuvYo6YygPZj99QMQchqWrff0SGO3GzV/QXUFzEoXafs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039109; c=relaxed/simple;
	bh=KvhN5EIM3XXPaotrLaYPSuOdgBSYq4SNpSPqi8ZqfN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMt09cf5nyHV7Ut1l1ky6Po/gxNFEhmAKVPihc5byy2iNBGmCegURW7FfN4rEW0Oh5yS2KiNDTEmRg8Hj9eHESHKlejOsILO5iELcbZuATqwEoLvavEYMkTCh9cWAW6Aax1zgZlWH7rDagOAxyJYkNRVEsphXZEhLucEWLEj+JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmFK+nWg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kpqAWjPF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmFK+nWg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kpqAWjPF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62936dGL716509
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 06:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K4gYoo9JoJP
	OJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=; b=cmFK+nWgaDRXEf7HW4kJDJoEKa0
	1ycRV0TDgd+0gtsdmZ+4bfDhLlM3XRafP87CNKDp37kDvzXxu24zvDSFjtWqXNqK
	BjUQtCnXh2ehPKgN7XFpgnLO4XViA69vcuXfrjNbrdTyYl29KI+1dvKDq6iUhkQC
	AuccxYKMnwUbSkU1rEnD2Rzoq6BBQMEqm5VFRtwAtF6Ilwf5vVPpruEhPC0X1NmR
	poto8vkAFhAQdEFYP3UlkChMQY0qkTCFKmuBpwt5g5FmihfPSIK8ewurd2h4jED5
	OXIgY1svOB20ZiovTNA4me17eYrdnQI3lPnY06yEq+g/lVokHKdz9o56REw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qevhsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 06:51:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd722c1a69so1249112985a.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 23:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039106; x=1773643906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4gYoo9JoJPOJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=;
        b=kpqAWjPFG2FDzh+EOcuQSRskd6a1qNXs5qx0+50lBkXlkPavQm2JyMbKtyat712NaR
         Q1rA/G4O+lBfiBUP6MigCvrmctMKKtc+pCFKF+Pa/lMLdAcTYkFEDqrH52oHPT3ggCFl
         5urxfo4QM6HbnBbyihLiJxTpRHpZTu3dGnOUkgj+zYFB9OP7SHsdWr8vC/IoqxoO80/8
         I7VRUB9311qNJdOM1t065zCixOirUJ9hK5+mmBEb3ZjD7H1J0U//ojzjdo5bMbannm8w
         KgDbYPzs5EqISGiwJzTh602SUHE9qqQbYYJwDposkuXDHfQGB/PMr0+J00lv4ft7p7II
         Aquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039106; x=1773643906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4gYoo9JoJPOJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=;
        b=suBCntCNQ0exReSycreV3Znt3kyqZgZkqvyo+nJ0QMxCSbk8FAQ63jFNgqpWAKzrk5
         KBpmfVjzb7kcMPWvddr8xEscz5DNoN8LeB5im4wU/m/s4avxivsRFbx7l8ghiK181Bgf
         Hg7Bs80GecAeM693HUyd4PRWyp1ZOAm708YZdpoKQzDXTQU3QGOXQxEfdC2OYSB5zNKi
         nF7Ck0vQDNUbY8CuYQMuzvbbu1x3O7X4T8E/bbn+RKu2lF9yIG1jBYgjAECBFhinS/3Q
         A0mXe9xIrV17FENTVjAhRtMU6N31zCNVBEind/IRsvax7Cou34UYYY1hQ3qOb9Z/m4Tp
         TA+g==
X-Forwarded-Encrypted: i=1; AJvYcCXPP4JdYhO02BXK5SugeM0U7BRea/qxFSQXjLa4i3o8kcvvlLrZ9oMzRhAp6qliPxqJNx1oSct94Om0vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8d0akBz/plAHf+4+MYQeOCWruc2ksfsXdIUqBopi4gvBWRCvy
	SO476AdZXb/VDlqhv5Ph4EMf3XO0yuVzg0H6N5d+8AosYBuH4v3QMJnVYs3Vnvxk1FWVPjVnUWF
	TDWDyoUUflJhsAwZ/8c8VZNB4oI7/zbOc4dVZ5ine3Ap1TOyhURb/E5oUwM2ZLf42CQ==
X-Gm-Gg: ATEYQzyDqgiEBlVqFFmQxXF/R9sDOWDLlgh3OJayeSpmniMy5X7xsvm+V9rOfIJOiSI
	jRtpIYRF3fFcGQoKo22iysBpjBv9emPPIeefN/K/c+UFVIHYsbT/qqHewgMgTyD89A8AWk2KlQm
	0Ga4Hz5vwiPyqRcwkbrhGF8a22SrXAFhJZ3clBzN91WKV6mUONi96to0ui3DALHhz+MsoV348bR
	LF+wLhPJbgDw2vVY5MQ5FFlGdQlDqjYxqCn8lrASlWlQs7D2uZXyaSE9RdMCSZyfnnhJ/lYtV9E
	58GowBwcZSUiTx6X/s4lutAN9mU3CykRVZMqeP9e1A79i0IXp+rH7icAmQG5LJPxt8T0E7LdCWf
	lI8I4NYBUfTovV7g0Ma0ZRXRBzU7R9o46Gm67FmttI5ozxm2ofcpYfeI=
X-Received: by 2002:a05:620a:25cc:b0:8cb:52e0:15e8 with SMTP id af79cd13be357-8cd6d4a9f47mr1282177885a.76.1773039106252;
        Sun, 08 Mar 2026 23:51:46 -0700 (PDT)
X-Received: by 2002:a05:620a:25cc:b0:8cb:52e0:15e8 with SMTP id af79cd13be357-8cd6d4a9f47mr1282175585a.76.1773039105857;
        Sun, 08 Mar 2026 23:51:45 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:44 -0700 (PDT)
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
Subject: [PATCH v5 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Mon,  9 Mar 2026 06:51:28 +0000
Message-ID: <20260309065137.949053-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Xi-DXGouiwXaha48vvzg5RNo1Z7V1zDI
X-Proofpoint-GUID: Xi-DXGouiwXaha48vvzg5RNo1Z7V1zDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfXxLht0+Y+xoo1
 VgYImNuR1StCNCr64kqIP0oO3vahTBWEDhR5a6wkwJ4A2dT3mlYKakxPcR/S5m0xWdcqyh4fPNT
 XAnA6HM2oRBTt9V6Z0t4v535bcs2H9O5xr0PYZzF7gs2lyxoSqTj4MEIJU3u3qPB+xsECpW4+lr
 ufCmsg+BIvEh6VyEpwRk+aPjUDP+3LcFIFjuW8176+1bur1C8ihlZx7Stv2VRhWonGsO+iqsLgq
 nlLRK9N/UHSC7/49881W2C8FTq+WqyaWIcwo7mKvkqgSlMERrsnniFaXrigcM57pYwl76HDjsfB
 u38N3AHFDPX/jUfaIxbHmmze8TzgLEU30lxEHzH/NfPqSV/dNu1jnncK7BkwtJQ5hnYY+ds3Vpw
 oCGkHr6ZMO+mPlwn6og73evLnsANyzK+ZL+wA18pTiwSRH4mwj+ce8x1cWV6SVSeVknloUZLBjF
 w5IjHTpXTlbJpcBK5UQ==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69ae6e03 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061

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
index 528756f1332b..f68d4b4974f3 100644
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

