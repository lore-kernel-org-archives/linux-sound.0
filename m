Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555878;
	b=yjpVSSad4o2o60yod14ufwWHv6IKhLL3zVHn9asdOnWZu1Vg1zQpEDxBck8AnJSJUt2T
	 Cybud3GgSJc5emwPu9tu5ZKnwhQR+VFDi3Ff0J8pci/2fusNXZLzwobe/sBvWJoIRfSxW
	 AeZTXZ4Ug8QxyVl88xytNb6eA1Idnyy25+UkGLPQtQarv5nAO87mST7N3Rb/Sl0hnGTjP
	 6Cocl17RCUXoUcGnx9UNudZrESx1/Vg56reZRZYKXQ2O95vU72G2deGZgTWMtdUcaxlRD
	 iiaCKzsWXgFO79NcZBpQAWc4eixMGqpo9znjPpRxC6yCVAWLBk9tZbHo27OVQr2ID5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zEW8Hl8s+Y1giZRO3PaVOKx3H/aD5JuoFm4LfqgU3JM=;
	b=kH5NSmakgokhqYTYFc3rKVjx1InPVd4PC+MsI+k3qBBL4I2PuCM56Y11d4W3mxaTCeRt
	 Zoulj/omiWZneHvavkROT7GpTq3itYv3w5nQMclRcRhZVwkJBIAAO6GQDJg5cGTTSI7ZC
	 6XsTqpJviyj1DANqUPLvDY7e5mK8LOs7IL2OdttHD+DjHvTKCHkx5yAoQsxXHORXmSsS+
	 +pvQsEqErKbA1OmrP/ZpiN+NAghlD1VkFwK5gSMIAQNljqy+weAJbr6urC9KsqRavwAeY
	 y2EdCycV6FdKuGz9kyyFajBTWLcRlEK7kEiB5MeE35j8kfWqCshi5dK/ZFSgbX+jhVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CtSBq4Me;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h3J1ZXKt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3805606A320
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 04:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3805606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CtSBq4Me;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h3J1ZXKt
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2EwKO3469315
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 04:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zEW8Hl8s+Y1
	giZRO3PaVOKx3H/aD5JuoFm4LfqgU3JM=; b=CtSBq4Medn9+GjTSEqjuyt6Mtww
	aGpV7VC5msNvFk22L1TH8CKz58hIEaXkQWVO/S8FcUSuhlvNihJkhlrHwfUdAd8H
	kOlr+TCO5eBE0to9k++Czk2mHjw1RxoqRKlgw3ycVRrwpuhtKVRJqM2VWxpkvlVU
	JXhSjBC2OeIpaPiUb1TnFdwEt/ZRlSS54EWyYgxEpQYtXrykHRUvVHsKXjEgb7Wt
	8Nydno7kSjxVo8OacT+bn8NqjcW3jpPsrlH11OMwCaxtraj9yMJ5Q2tGzIE1go/a
	qVDxBWGV88pgg2BZ8t4NlqCk1ifDjasatTT+O4A4RWZeQi9W/y6xXT4k+qg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2bfy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 04:11:16 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso537965c88.0
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 21:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792555876; x=1793160676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEW8Hl8s+Y1giZRO3PaVOKx3H/aD5JuoFm4LfqgU3JM=;
        b=h3J1ZXKtCQL4BK7dE02NXiYdPK4jTcoqH4aEQv+OhV9kG9tlEtewvk6XxZd70dYpom
         wn7ug/uzsHHkbyFCiQuSiQSUDcj/A7g8E6Y+O8aZK/B+GaLUMsYQ7oMCB9bOoIq3BY9T
         GYwSfNKO66+qWRrK1rozJtkD3eWbS2SBZ3q+C9x3IvCaOadIULgY6OFC52s4ApFLin0i
         BeiVi6Fu0LuOKpnDx7i9BJjOBw5YaUeB3vMdZdEoPnE8fFSdQW+H1X0swmwwQus8Cw66
         GezKiMlzvTf1LyjcBU2APmWxPshNQ7x+B3lU8Z39+tWQckNci+IORNxEWJoT5I73ueCW
         qWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555876; x=1793160676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEW8Hl8s+Y1giZRO3PaVOKx3H/aD5JuoFm4LfqgU3JM=;
        b=cG0lfhw0vhBBzil6RRTsNFJapy3Du7G9Ml0ANX2nUSyfsRAl8vtxdxGzdkXlSHDXa3
         YR35yg9ZRW8W6QcD79UW7BLYdh60zEKTXgxKmXhhS4VrMDAS8GhR1CkRwPC07vVNZdrS
         Hrf1iynmGN5ywgvDo7ov94QjuffKFauauRfGcBS0G11xbF6dVVT660L+wd9I2+SHHDLt
         k0aSyLoB5448syJdF6Au63cKu34r5pb7Fwi1KmzN3RLMExVOUYFpUIP323jNNS4f4Cnw
         Bt0mFKdqr5ESRAWabkXkfu2BsMF+/3EcQKMeNS6AVMeqbZHIMokuxjO+I8CnvPGpUG8/
         HxJQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5TJrqRui7MSktSos38HAxtqEVmNVYsSPHnMhaRY/ZKMYW4TgtG16am9FBo1Hf+xvh0Pptxoot/HO+AQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJWKnncvn6BHXCMsLU35+twykfIIXQRNQF65e7cJxLV1qYdJuEk
	ByN2t3aiG6WaepvFmmDglQCyUUyVhZxOVxUWHKoS53FuogVCKWUe9eN5hQaQEycphMk3DG85dOo
	OvcO8HSfJpv93gSeByIPKUd70tJKfavIM2Q5CZrW+nk0USGKKOaK8/dJpXSjfx5bt/w==
X-Gm-Gg: AYBFou3RjbFCH8zNrUwjOEmnSMTYOtqKJPjoVoqxO+ZB52EeloB4D3umbSOhFZ0sBKc
	9uY1dNVRlGXTX44uWrptEO2U3OjCzQiMPBdB5jdneunm8KQc7wAIHn4H3yxasxnnIWpolf0lt5i
	YVIADnoys57Qys2pfwZfGN7TBW1vumqV9ZGYA7/CdEK7iCLqFbHhkOcC3521TFnq4AJzuol3tDL
	IYfc9F9MQk/lpdYyruLbHnofuAKkjbIGR9VekVUcoCPe38jaLWVwbgkBDSn5HWGaZ9yxyPgDkvI
	W6mvQF+uLP7wJyt8VTT8h8pG/yNzfnJEuQ1sRELuVO0v2PuRV9KaMesORSJapfFgyByl2qgP8fI
	udvdp0o6beZusT85OV7QFSUYXP1OT2qzlKyfupOFUFxF9/h7BNZcAbJJUreQ=
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr1822890c88.25.1792555875982;
        Tue, 20 Oct 2026 21:11:15 -0700 (PDT)
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr1822831c88.25.1792555875196;
        Tue, 20 Oct 2026 21:11:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2915427c88.22.2026.10.20.21.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:11:14 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, stable@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/3] ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology
Date: Wed, 21 Oct 2026 12:10:44 +0800
Message-ID: <20261021041044.2080369-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021041044.2080369-1-shengchao.guo@oss.qualcomm.com>
References: <20261021041044.2080369-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TnOIGX6bcnZ_fgY7Dv9o5fNcrkRiL6p-
X-Proofpoint-ORIG-GUID: TnOIGX6bcnZ_fgY7Dv9o5fNcrkRiL6p-
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad83b64 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pRitcdQJkKt4eD0iFYsA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfX8ZWsfeQgF5/W
 SA7WCWXbqH1M9d5iiEUiWWp9a4qTkS45kIrH8FU8GQ8lVMtunA7HNpCKGbV35L90WRaBZLGVD8J
 rxZpgR8ViXWX+NYCcg1Yyry0QjzFMuY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfX6XDvAHc0VTv+
 JW5OSbk4yE1FLtju1Ry6PZTTFSmZbui9bMfetlQreljn1r9tUN/13xGtWTqutn1fYaz2SHneQiC
 Y1BktevMAPwfI4CWJswdDqxA73BxKJPGAiEC+pwLDUxeuyHF+Uw4fSs7g9vgn7uxzUtQvMvn8CX
 oBajuAEljHLwAiZPmEsClzTeMuwt79OlSi9ImjRZZcqIqlxRFUuquUO8f0/gJaY8w36hzwF6E9V
 KYVCAlnxPUDEbp/usMe9KHGxEIPmdyD1gltv77JNrJys9C8gQeBLBLWPGM9+MaxnafXHyTQ6aUE
 I6EzpAYDXTqKDOrSigo9+19Q7VEG68Xj6h6pWtbQM4p6HSAdMZxUKCYsDqltLA5ExAYEEjyNt8R
 jkdzP8S9LSv5se0PqaMv0ihhYqs607PsyNydnivk9/Vt1UwMSeQyjuhoADvIjP/Wb7fzovPkX0N
 rP3NUuKxKFRtx3Q527A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210016

Since buffers are mapped once in pcm_new() and unmapped in pcm_free(),
the unmap relies on the graph info still being registered. During card
teardown, however, soc_cleanup_card_resources() removes the components
before it frees the PCM runtimes. q6apm-audio's remove callback unloads
the topology, which frees every audioreach_graph_info, so by the time
q6apm_dai_pcm_free() runs the idr lookup fails and the unmap silently
returns -ENODEV. The DSP keeps the old mapping.

When the card is bound again, for example after unbinding and binding
any codec on it, pcm_new() maps the same buffer once more, the DSP
rejects it and the front-end PCM is not created:

  qcom-apm gprsvc:service:2:1: Error (1) Processing 0x0100100c cmd
  qcom-apm gprsvc:service:2:1: DSP returned error[100100c] 1
  q6apm-dai ...: Audio Start: Buffer Allocation failed rc = -22
  snd-sc8280xp sound: ASoC: can't create pcm MultiMedia1 Playback :-22

Release the circular and position buffer mappings of all graphs in
q6apm_audio_remove() while the graph info still exists. The unmap
helper now takes the q6apm instance directly, since it is called from
the APM component rather than from a q6apm-dai child device.

Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
Cc: stable@vger.kernel.org
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 0e5219a6513f..bed3b64e8310 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -322,11 +322,10 @@ int q6apm_alloc_fragments(struct q6apm_graph *graph, unsigned int dir, phys_addr
 }
 EXPORT_SYMBOL_GPL(q6apm_alloc_fragments);
 
-static int __q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id,
+static int __q6apm_unmap_memory_fixed_region(struct q6apm *apm, unsigned int graph_id,
 					     bool is_pos_buf)
 {
 	struct apm_cmd_shared_mem_unmap_regions *cmd;
-	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct audioreach_graph_info *info;
 	uint32_t mem_map_handle;
 	uint32_t pos_mask = is_pos_buf ? APM_MMAP_TOKEN_MAP_TYPE_POS_BUF : 0;
@@ -358,13 +357,15 @@ static int __q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int gr
 
 int q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id)
 {
-	return __q6apm_unmap_memory_fixed_region(dev, graph_id, false);
+	return __q6apm_unmap_memory_fixed_region(dev_get_drvdata(dev->parent),
+						 graph_id, false);
 }
 EXPORT_SYMBOL_GPL(q6apm_unmap_memory_fixed_region);
 
 int q6apm_unmap_pos_buffer(struct device *dev, unsigned int graph_id)
 {
-	return __q6apm_unmap_memory_fixed_region(dev, graph_id, true);
+	return __q6apm_unmap_memory_fixed_region(dev_get_drvdata(dev->parent),
+						 graph_id, true);
 }
 EXPORT_SYMBOL_GPL(q6apm_unmap_pos_buffer);
 
@@ -851,6 +852,21 @@ static int q6apm_audio_probe(struct snd_soc_component *component)
 
 static void q6apm_audio_remove(struct snd_soc_component *component)
 {
+	struct q6apm *apm = dev_get_drvdata(component->dev);
+	struct audioreach_graph_info *info;
+	int id;
+
+	/*
+	 * The card core removes components before freeing the PCMs, so
+	 * q6apm-dai's pcm_free() runs after the topology (and graph_info)
+	 * is gone and can no longer unmap. Release the DSP mappings here,
+	 * otherwise the next pcm_new() fails to map the same buffer again.
+	 */
+	idr_for_each_entry(&apm->graph_info_idr, info, id) {
+		__q6apm_unmap_memory_fixed_region(apm, id, false);
+		__q6apm_unmap_memory_fixed_region(apm, id, true);
+	}
+
 	/* remove topology */
 	snd_soc_tplg_component_remove(component);
 }
-- 
2.43.0

