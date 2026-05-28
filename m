Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A951232C923
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994722; cv=none; b=bn67phVbuV9A96XE4x5Q9/BviJ77Srxh9R6/DnrLjr8fYX8/wPnSCwSmb2I7cV0HCDH5Zeu0sg51136bkzFkvYEBXil4vdbFCttRTqvMDMdk+PdDQiAG71+/m8hzKGLEhWl8tcKxsUMPfFcXb66vYlglAZ43LFrWdMBdQ8i046M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994722; c=relaxed/simple;
	bh=f8ON3seXiBC4PP8iYLytKvnzTFD/bo/frUMYwfPs5SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o0J8xYtG22WfKe03KleGS0F9PxKIo6ozweALk9GWuqCKFAa16DSifls0XWBumt8H4VayWFLLKUzGoAQhpY9VwE9FVziRwNTNWYPXshfOgM6F8Ik3iU2tZuWPJG/osG5WnrbPa6YiRHY8MFIdWWyo7ENah/PhOb2ILqqvZ31HQ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEdmOLUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EnRnEOTT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEdmOLUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EnRnEOTT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SHHWc1566557
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+PFci7Clpma
	ENpXCHboxKKWeOXbrMw24+6hrewU5IwA=; b=CEdmOLUpNl+K32eaUYKB6HxyDSN
	LF3OeUB99rxfdorFhFHHSn2AL8mB0T75I2kksQ2b1NZ6M4NL8eaMtDcu8p3hkfCw
	s9r4ZASq0MJAd+f2T7ndu4ci60X7lPgWFMJCfS/vKau/Q3zmZJvQ2QuhBd4Ljs3Q
	K4IQ1yn/XSFFlhit1cg3TzXkkF2F4XwKs+x7ON/tp6Ih3XzAwXVT7x2wsWqsy24e
	c+EWSCP0L8PsU1WX+hd7icLeMwBD+HYdsTCumhiQ9s2DZ/2+nDbUT+YalYjuTsCJ
	OzAkheU3fwaLBbcqlDBplAoG+lKkFU/HrmRrDA3whRYbBGp5aXp+4e9n4Aw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynm8wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516da5a1db4so138670281cf.0
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779994718; x=1780599518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PFci7ClpmaENpXCHboxKKWeOXbrMw24+6hrewU5IwA=;
        b=EnRnEOTT8i1i3eGG/ZD1Ksv6qbRVQF2Yb6QS+bVgM5t716x4ZPKfZ1X0NvuIiVv6go
         gR8mkPaNsvl5nW12rWTUGHFug9OBjVB9ljFu0iI5n5/kgZppXvvDCOITCLWTzgM3yhCT
         81gLQujytFwCsFAZPHGBUbjYNbaHnph5UYd6TG6NoT5GUWcSUNUSkx0BF8JPAhVEyak2
         7ax8xmKaab+TSP0mMOUB9Y7ZT11AbDhMdhzs+NyoLzyVtPXGPCl1vw80AzffAi4cHzkf
         lUDNtTD1G667Nnn7ROuuwmJyO/RgWqxvZXkFkBztOT60h/nDvkPUd00bKPOdFYwUo9yS
         +cuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994718; x=1780599518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+PFci7ClpmaENpXCHboxKKWeOXbrMw24+6hrewU5IwA=;
        b=JWR9jlpkoDQMjFcAjbGfvyUkgeIv3AYpVXfFbyWB4Y2EZzipY0Yk6mcA+SwlAE/RfS
         JcPdGL8suJlMndJNsWWduyWmdWTz5/O6FhWcnbl0Cz7A4XjlbeADomtATNQIwUaor/uO
         XtAw0GyL3jayuvG4k4VY7BpXGd03VKbNDcf6hvJovPaJXPMhe08dPyfqCMIQUZtzaYQf
         1jza91Z7l4UDKlRem1+tViJCaNXU5vVfkVFbVMFf9o72yuoFk3SKAuezkuETEkEY2mgz
         b9E+7NcFDO5nee0zcVZn8FhnMoBu0QTsvhBlJ+69v1dmsRpPX5PYa5nHqIidNC0paWAa
         zABg==
X-Forwarded-Encrypted: i=1; AFNElJ/qTKqZTW0cHc+teuprjFBSE+p1aAiZJSgWh+xJr/2nVjEA+uZC2tAez+hez1tLI9KrCTuqpvD6Ish0yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy7cNz5qI2E/aDyBD+nA3JCdfjo4KJCxKgZfzss7TcyNr2aLF6
	/mX7DliHuHjuv5mnLEs42fnUXLjZImX7ronTXG9uh4hzKlzsEve2Vm8Azar3Va63O12KwpU3Kd+
	VWiBetUTv7MptB/KL8S07HIdakKXH/rshtM0PbQpFXLLTvD78bUzGZWxTRLnfnzlZMg==
X-Gm-Gg: Acq92OEw3HVOsNS09xk5/hAeEt91jDR8cnXNI6i1qxhivEyUDcOFdMdcEFyUge8xx7V
	UbvR6xyvSQoxCeeUzey1OnXBbNKikz1jwqxq0HVH5eVjUeDobasQQTgr1mWtPM8G2dAbGVUkHG7
	eStI/1uYC/zHNjvhqHcbwhanO9rM5N8AKNDJRlEG/P6Bld+hpxLIILi20znvOBfHxgIpglGgpSj
	Ugfnt4EMzIK6NdDl94UPBeA7bpWpAJaw++aJeXdMzaBqYhq9n7QiAOe0rQ2uQLYxzEQyE0mmmmv
	gkQqI5GSnagzBed/uOrLOZg4ZeJbpWAf+n2N7A6+ek1Auw06WFlyXYJkM0w7l4MaxNwam5Kv/F4
	Jq63fSCKmzOmXcEMtQlwm49Ctzb2vNGuIX7nSqzyhXqm9vxqdETHKkKmZRwVZ5+fXddFcnA==
X-Received: by 2002:ac8:5756:0:b0:50f:c5d3:a191 with SMTP id d75a77b69052e-5172cb3807cmr1741931cf.13.1779994717814;
        Thu, 28 May 2026 11:58:37 -0700 (PDT)
X-Received: by 2002:ac8:5756:0:b0:50f:c5d3:a191 with SMTP id d75a77b69052e-5172cb3807cmr1741601cf.13.1779994717321;
        Thu, 28 May 2026 11:58:37 -0700 (PDT)
Received: from debian (71.248.69.85.rev.sfr.net. [85.69.248.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49099feef7esm3107165e9.0.2026.05.28.11.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:58:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com,
        mathieu.poirier@linaro.org, andersson@kernel.org, kees@kernel.org,
        verhaegen@google.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 6/6] ASoC: qcom: q6apm-dai: add push-pull and watermark event support
Date: Thu, 28 May 2026 19:58:05 +0100
Message-ID: <20260528185806.6316-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hdxbMkBeOobvtBJL8gOixBY5RpAEMlTQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5MSBTYWx0ZWRfX/DM+c3vEbQ2L
 MYp7Ddw5CV/6Voq2p88XrkHwd7Ib+14/RUBJDNSWLDUUmivtU5srC6Bgim3IApzyAOZqiaQlUzk
 n6tyCPMpsrPVm8GoaSuI9zmkqbgP0LNhdPs69Pc3PshApoFeapmNT+2wGZdd/O/fABbN9c43N1h
 FeAz6sV9Ro7T7Q+A+vEVjpMgVybGIkeZJptNhESBOzvakyVyr2u/oi30G9VKx7RztSeFxHOKJdz
 u5tP5hk5JNkqTHBUmDk5tDWp9i+4tl1nTBAdYDFugUnYuXeMUPZtO5r3t0LhUjwQtYj2Wl14KcO
 LryOz4E3WtRMeWVn4z4hryJi76RAujG/S3KxM5Qx/47Qo2fzVLd11YcTOTTstPX+Tzr8Tzn9s/5
 vNmxWIRC4pJvEYFx8+KDXBhXjOwssR+E/doP8d5ZhpRBCjDfzJq9oQLHCj/uz5TWM9VkZp/xu/0
 snSv/cvxhOVl5Eb3ntw==
X-Proofpoint-ORIG-GUID: hdxbMkBeOobvtBJL8gOixBY5RpAEMlTQ
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a18905e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hLrqdhl2Yb02WBc7oxehMg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=FoGQ1hqfDKlkNBk9xSEA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280191

Wire q6apm-dai to use push-pull shared memory graphs.

For push-pull graphs, configure the circular buffer and position buffer,
register watermark events, and use watermark notifications to report PCM
period elapsed. Skip legacy fragment queueing and ACK handling because the
DSP reads/writes directly from the shared circular buffer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 144 ++++++++++++++++++++++++-------
 1 file changed, 114 insertions(+), 30 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 3a1be41df096..bf1f872a09f4 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -18,6 +18,7 @@
 #include "q6apm.h"
 
 #define DRV_NAME "q6apm-dai"
+#define POS_BUFFER_BYTES	4096
 
 #define PLAYBACK_MIN_NUM_PERIODS	2
 #define PLAYBACK_MAX_NUM_PERIODS	8
@@ -62,8 +63,12 @@ struct q6apm_dai_rtd {
 	struct snd_codec codec;
 	struct snd_compr_params codec_param;
 	struct snd_dma_buffer dma_buffer;
+	struct sh_mem_pull_push_mode_position_buffer *pos_buffer;
+	uint32_t last_pos_index;
 	phys_addr_t phys;
+	phys_addr_t pos_phys;
 	unsigned int pcm_size;
+	unsigned int push_pull_size;
 	unsigned int pcm_count;
 	unsigned int periods;
 	uint64_t bytes_sent;
@@ -128,6 +133,9 @@ static void event_handler(uint32_t opcode, uint32_t token, void *payload, void *
 	struct snd_pcm_substream *substream = prtd->substream;
 
 	switch (opcode) {
+	case APM_CLIENT_EVENT_WATERMARK_EVENT:
+		snd_pcm_period_elapsed(substream);
+		break;
 	case APM_CLIENT_EVENT_CMD_EOS_DONE:
 		prtd->state = Q6APM_STREAM_STOPPED;
 		break;
@@ -234,24 +242,47 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 		q6apm_free_fragments(prtd->graph, substream->stream);
 	}
 
+	prtd->last_pos_index = 0;
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
-	/* rate and channels are sent to audio driver */
-	ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
-	if (ret < 0) {
-		dev_err(dev, "%s: q6apm_open_write failed\n", __func__);
-		return ret;
+	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
+		if (prtd->pcm_size != prtd->push_pull_size) {
+			ret = q6apm_push_pull_config(prtd->graph, prtd->phys, prtd->pos_phys,
+						     prtd->pcm_size);
+			if (ret < 0) {
+				dev_err(dev, "Push/Pull config failed rc = %d\n", ret);
+				return ret;
+			}
+
+			ret = q6apm_register_watermark_event(prtd->graph,
+							     prtd->pcm_size / prtd->periods,
+							     prtd->periods);
+			if (ret < 0) {
+				dev_err(dev, "WaterMark event config failed rc = %d\n", ret);
+				return ret;
+			}
+			prtd->push_pull_size = prtd->pcm_size;
+		}
+	} else {
+		ret = q6apm_alloc_fragments(prtd->graph, substream->stream, prtd->phys,
+					(prtd->pcm_size / prtd->periods), prtd->periods);
+		if (ret < 0) {
+			dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
+			return ret;
+		}
+
 	}
 
 	ret = q6apm_graph_media_format_pcm(prtd->graph, &cfg);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(dev, "%s: CMD Format block failed\n", __func__);
+		return ret;
+	}
 
-	ret = q6apm_alloc_fragments(prtd->graph, substream->stream, prtd->phys,
-				(prtd->pcm_size / prtd->periods), prtd->periods);
-
+	/* rate and channels are sent to audio driver */
+	ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
 	if (ret < 0) {
-		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
-		return -ENOMEM;
+		dev_err(dev, "Failed to set media format %d\n", ret);
+		return ret;
 	}
 
 	ret = q6apm_graph_prepare(prtd->graph);
@@ -265,13 +296,13 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 		dev_err(dev, "Failed to Start Graph %d\n", ret);
 		return ret;
 	}
-
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		int i;
-		/* Queue the buffers for Capture ONLY after graph is started */
-		for (i = 0; i < runtime->periods; i++)
-			q6apm_read(prtd->graph);
-
+	if (!q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+			int i;
+			/* Queue the buffers for Capture ONLY after graph is started */
+			for (i = 0; i < runtime->periods; i++)
+				q6apm_read(prtd->graph);
+		}
 	}
 
 	/* Now that graph as been prepared and started update the internal state accordingly */
@@ -286,6 +317,9 @@ static int q6apm_dai_ack(struct snd_soc_component *component, struct snd_pcm_sub
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	int i, ret = 0, avail_periods;
 
+	if (q6apm_is_graph_in_push_pull_mode(prtd->graph))
+		return 0;
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		avail_periods = (runtime->control->appl_ptr - prtd->queue_ptr)/runtime->period_size;
 		for (i = 0; i < avail_periods; i++) {
@@ -317,6 +351,7 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 		/* TODO support be handled via SoftPause Module */
 		prtd->state = Q6APM_STREAM_STOPPED;
 		prtd->queue_ptr = 0;
+		prtd->last_pos_index = 0;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
@@ -402,6 +437,14 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 	else
 		prtd->phys = substream->dma_buffer.addr | (pdata->sid << 32);
 
+	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
+		void *pos_buffer;
+
+		prtd->pos_phys = prtd->phys + BUFFER_BYTES_MAX;
+		pos_buffer = (void *)(substream->dma_buffer.area + BUFFER_BYTES_MAX);
+		prtd->pos_buffer = (struct sh_mem_pull_push_mode_position_buffer *)(pos_buffer);
+	}
+
 	return 0;
 err:
 	kfree(prtd);
@@ -436,6 +479,25 @@ static snd_pcm_uframes_t q6apm_dai_pointer(struct snd_soc_component *component,
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	snd_pcm_uframes_t ptr;
 
+	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
+		int retries = 10;
+		uint32_t index, fc1, fc2;
+
+		/* index is valid if frame_counter does not change while reading. */
+		do {
+			fc1 = READ_ONCE(prtd->pos_buffer->frame_counter);
+			index = READ_ONCE(prtd->pos_buffer->index);
+			fc2 = READ_ONCE(prtd->pos_buffer->frame_counter);
+		} while (fc1 != fc2 && --retries);
+
+		if (fc1 != fc2)
+			index = prtd->last_pos_index;
+		else
+			prtd->last_pos_index = index;
+
+		ptr = bytes_to_frames(runtime, index);
+		return ptr;
+	}
 	ptr = q6apm_get_hw_pointer(prtd->graph, substream->stream) * runtime->period_size;
 	if (ptr)
 		return ptr - 1;
@@ -468,7 +530,8 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
 }
 
 static int q6apm_dai_memory_map(struct snd_soc_component *component,
-				struct snd_pcm_substream *substream, int graph_id)
+				struct snd_pcm_substream *substream,
+				int graph_id, bool is_push_pull)
 {
 	struct q6apm_dai_data *pdata;
 	struct device *dev = component->dev;
@@ -490,6 +553,19 @@ static int q6apm_dai_memory_map(struct snd_soc_component *component,
 	if (ret < 0)
 		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
 
+	if (is_push_pull) {
+		if (pdata->sid < 0)
+			phys = substream->dma_buffer.addr + BUFFER_BYTES_MAX;
+		else
+			phys = (substream->dma_buffer.addr + BUFFER_BYTES_MAX) | (pdata->sid << 32);
+
+		ret = q6apm_map_pos_buffer(dev, graph_id, phys, POS_BUFFER_BYTES);
+		if (ret < 0)
+			dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
+	} else {
+
+	}
+
 	return ret;
 }
 
@@ -504,25 +580,30 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 	 */
 	int size = BUFFER_BYTES_MAX + PAGE_SIZE;
 	int graph_id, ret;
-	struct snd_pcm_substream *substream;
+	bool is_push_pull;
+	struct snd_pcm_substream *substream = NULL;
 
 	graph_id = cpu_dai->driver->id;
 
-	ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
-	if (ret)
-		return ret;
-
 	/* Note: DSP backend dais are uni-directional ONLY(either playback or capture) */
-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
+	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
 		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-		ret = q6apm_dai_memory_map(component, substream, graph_id);
+	else  if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream)
+		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+
+
+	if (substream) {
+		is_push_pull = q6apm_is_graph_in_push_pull_mode_from_id(component->dev,
+									graph_id,
+									substream->stream);
+		if (is_push_pull)
+			size += POS_BUFFER_BYTES;
+
+		ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
 		if (ret)
 			return ret;
-	}
 
-	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
-		ret = q6apm_dai_memory_map(component, substream, graph_id);
+		ret = q6apm_dai_memory_map(component, substream, graph_id, is_push_pull);
 		if (ret)
 			return ret;
 	}
@@ -547,6 +628,9 @@ static void q6apm_dai_memory_unmap(struct snd_soc_component *component,
 
 	graph_id = cpu_dai->driver->id;
 	q6apm_unmap_memory_fixed_region(component->dev, graph_id);
+
+	if (q6apm_is_graph_in_push_pull_mode_from_id(component->dev, graph_id, substream->stream))
+		q6apm_unmap_pos_buffer(component->dev, graph_id);
 }
 
 static void q6apm_dai_pcm_free(struct snd_soc_component *component, struct snd_pcm *pcm)
-- 
2.53.0

