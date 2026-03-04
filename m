Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6288736656F
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 13:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629657; cv=none; b=bSfZZuHxQ0XkjBs4zwQb/SE6OPG7wwF3WXUsmaufiZnlRZlTQoCpAOjsHUJbTCQQeRu1a6ZeZijUB7Y4pB2mY4btPDhkm8Qfov3k8pua6kepaQMmzwJLrwJZyyqcPD/bxhB4yQwABe+Hma8UpLNeKuR6e9wkkWmshTso7npJC4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629657; c=relaxed/simple;
	bh=B8mb+C29aHmXpiZ0KkyuEWv+QuyMzs+RA8VA08jucnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CCq7h9EL+COV2PzCC2TJbaWi+jw6UYf+Zitn+kcvq5S8GTh2HskvMi6LD1ozSxKw/6xt3pspcrjnbTPnyrmqQwynyYacKR7c2HbOOrl6fme/oxy+esFaemNFHGDmha5T583TKEIAVm0fM9Ro+OaQa6u4mYLbYB2PxG6W5ZKZFNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cuj6cgSt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CG+cJpCE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cuj6cgSt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CG+cJpCE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624C23DE2306019
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 13:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aC+um2a762g
	fpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=; b=Cuj6cgStN4kjz668yR/qAVmo+Kc
	XsfiX5oIvM3r0+YMII5R4fmjpS2iFHigIlIdUOI1nsn8OkB2Qv4GLBOZIFd3AWGz
	VFzlSnzz6xkXaxDga6ibPe0NTxfdJH21omDyvHwbODg6Q7XHY3nmlQAVRY4aKNyQ
	HQywL4QhnQwdq0HwypHRzBfCV0hywoU8r5zpnixwtOFqE3nSVqqShwEDV2TQ2/L2
	bcNA8xhhMvqZGDPcjh99aYZVlQixfdlWHm7JE/AiF8dZwForeR/5SRxOPylWv8TS
	Kj4/fZpHt7kklRbA0tfUWgea2mugITJN+q6FO8nw6ECMaMhd3tzGQTnM4/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpau8t743-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 13:07:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70d16d5a9so3984718185a.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 05:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629652; x=1773234452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC+um2a762gfpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=;
        b=CG+cJpCEHcvrbwkwtrLTvn5eG9mXj03lyab5Ii5v9S/5bUd05jQ0fm0UompK7wzUSu
         Ibp7vkkUeL3Rer0wA0PkN+S/qVW0fKA3c2qmXIcjEPmdQyApyq6Euk+EwG+fa/ESF184
         url88bJEleRE2nt1Tk/z3mmBlN/SZEmeNJWtKVnsq1YjWbJA/6t2BOww6URfcoSQ8l+s
         LcF4OkRvCwnb8N1L+tIQ7hMf4evas5zwrKu2b27Zg98DN/G63VlKUxiy21GOb1YCe2sv
         8Hf3QPpb2HreqyC41ynqx6sQdYFFSE+xKTP52iS1btmICIeXv4QkLl3fMCrVwyqQu6ev
         WKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629652; x=1773234452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aC+um2a762gfpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=;
        b=o6ogqBKop22LjnLLpYPiDKUTOClIhHiRA2ioX2qjSxSj2oprsctzhLPlXKiZYnZSHj
         jIrcBkpKc+NiFW6lO+i1PRUmcbHWlf/vsT2dbv8AOtMJDaqWJOwL2+3bDEbb2p7YFTvb
         yqJarnPAzQb2heHKXBdHV10XcvUeH4ayj6mYtr3U6+2ZYkMiqeMq/9spUQi9q1P5h9I5
         Yvl55mSUbPgeKAUFr49H+u/WaeaGatT2mK8A9ONKPaWyXvVbBXdO6s2is+/zGuddUdeB
         gpYsge7ZSJTuyhfFaDkFIOH2LX+8Bl+K8p9O80NnP+M7uz+tY9BgnG7SS12rRupY66Ph
         h60w==
X-Forwarded-Encrypted: i=1; AJvYcCWb0FwPUSFKGrzL80UxoqptlS0n8B6WOxccvKsf63zRUU3O9Ds5ssMBQIgAZC+7w5/fDkgGqp2bZd9dVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhN6uA3JSMp1/kz6jqICPfXPf1NAc1Ju4nHcPzNUnpbSTvTCYv
	hbtA7ZqZKUkZM22pF14pZvi23O+PELxfW1U+cI0Gx7FSggaNPXTTITqNL2ETUSetvrdBpD4THX8
	egnUkGfoCE2+NZxiGE3ML3Lj6B4e9kJiH1XrMXdoKAPHOE8RDfxwQ3lr3OwkXmgZvSw==
X-Gm-Gg: ATEYQzzRRJN9PGMlpBa2I4xBFKj4NLPcZkXHgB31WANuyQUfVZSPxpaTqcEs6ytvBdv
	tOVviKX+dhuR67vFw5tZMQGjN8Q6M306Mf5vKNoDu6VbfSG4cqu5HC1KBXpUVzrKGjYnIQiAEAD
	wGRSQvouF+WxZyPKInvlIg2xFigetwwzgo1u9zA62FInOXBTmvBMwo/IlvQcxvF3H5EAQeYc22l
	qCZHHDLWDt6cRbJoJc8iLrp84+CYFKFRF5HNiIXwm+aGkvJiqsyEUqcS4Y9ppqzkIZfD/uf2FTP
	lVe+fIe7fykj1B44GbGS60J41pTIMrfVqdDbbhXlHo9fUd7D5ipkGSBQD1Ue9ZyzAQzrEuPTXtS
	lOu5BzBHibArtfsAOWKAX9vh/0xa1ZRkDOpZ0ohe9P3XdhnH0hMLXxi0=
X-Received: by 2002:a05:620a:bd3:b0:8ca:90de:43f5 with SMTP id af79cd13be357-8cd5afaa72cmr211910985a.63.1772629652488;
        Wed, 04 Mar 2026 05:07:32 -0800 (PST)
X-Received: by 2002:a05:620a:bd3:b0:8ca:90de:43f5 with SMTP id af79cd13be357-8cd5afaa72cmr211904285a.63.1772629651851;
        Wed, 04 Mar 2026 05:07:31 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:31 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 12/14] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
Date: Wed,  4 Mar 2026 13:07:10 +0000
Message-ID: <20260304130712.222246-13-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AJS1/0o2 c=1 sm=1 tr=0 ts=69a82e95 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8udmP7N65bQo3KbB_RsA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 1bZrPsvFmjfwqKj6e5BzIM0bJNEtB2R0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX+x5MD/btkp6x
 PuwnNvssJOk6NoYdPxAxGRo2V5ZSpNF+X7Uofp3fjAMvPlBxI2wPeA+QI84Ql8G+wkkRtXam4Aw
 bYlb0jWckKMXyyry9c9aM9V6RnFw48fekGH49hJ+vVq9mVaXIiWxAYiq4OGQRl/urBB/t19Pimt
 +cJHEn10ycvlxC0rZ35m82ZgIcuXMsTxLimh6rslQpo/W9nOyQDacxLLzQrcmPuKU0toe1cxncH
 xYGUpnoTK/dpIBC2XzzoUIX+Fgq6m5OYloRYT617kcw28qMNw+wj1TXs18Jd6uqS9mBYTHMdqBY
 jsuIdItC7GZt/ceNtMTEoJDD2Dm1DPerZlKHtYlcVnjLHtT/17EtKiQP3jIor29SNoHW9oZusPL
 D1xxTvmUdFJlMsmpnIKSK6RMjTj1RRlB/Wk2dyvihwA9oXJfO8PKQ0og5t5u7kYLTk55BonSS28
 Gx6gfpSjP5hNb6KuGig==
X-Proofpoint-GUID: 1bZrPsvFmjfwqKj6e5BzIM0bJNEtB2R0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040105

Start the graph at trigger callback. Staring the graph at prepare does
not make sense as there is no data transfer at this point.
Moving this to trigger will also help cope situation where pipewire
is not happy if display port is not connected during start.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 40 +++++++++++++++++--------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 472b2114c81e..70e283671f43 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -159,6 +159,31 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 	}
 }
 
+static int q6apm_lpass_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+				   struct snd_soc_dai *dai)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (!dai_data->is_port_started[dai->id]) {
+			ret = q6apm_graph_start(dai_data->graph[dai->id]);
+			if (ret < 0)
+				dev_err(dai->dev, "Failed to start APM port %d\n", dai->id);
+			else
+				dai_data->is_port_started[dai->id] = true;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -171,10 +196,6 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 		q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			q6apm_graph_close(dai_data->graph[dai->id]);
-			dai_data->graph[dai->id] = NULL;
-		}
 	}
 
 	/**
@@ -203,14 +224,6 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 		dev_err(dai->dev, "Failed to prepare Graph %d\n", rc);
 		goto err;
 	}
-
-	rc = q6apm_graph_start(dai_data->graph[dai->id]);
-	if (rc < 0) {
-		dev_err(dai->dev, "Failed to start APM port %d\n", dai->id);
-		goto err;
-	}
-	dai_data->is_port_started[dai->id] = true;
-
 	return 0;
 err:
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -254,6 +267,7 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_dai_ops q6i2s_ops = {
@@ -263,6 +277,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_dai_ops q6hdmi_ops = {
@@ -271,6 +286,7 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.hw_params	= q6hdmi_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
-- 
2.47.3

