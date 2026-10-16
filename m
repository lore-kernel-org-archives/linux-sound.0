Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EB24DF4C2
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159949; cv=none; b=g44CiGBS4vUdQsxPMQ3Bo70UPNOjtFaxIueEn5g92PL2kPv1JxgvOBpvM3nJHURecx0urt6dBqLQfhHgEH8mshk9Bfq5EazU1liUEsNTb3vhtVJlT/VgRSoQWImABpx/wCI5vjKud193yVl3DEXBGNn0gF8K6usXeGPFuNHX14Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159949; c=relaxed/simple;
	bh=rgkPiQLDuHZhgT4/G3OtHq/Z5hWpRHeWeCpWLYt4AxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlUyECxxvn3yPanIluzBe/NXXQv2B1CIZtIysY7NEpAA+c4WkOqMhrbbflOWcZWIHM3aZBoIFfE6B0vkrnZxaVWCbS3zfswqDv73xZ+Dlvxtta39ZT3Z8wj19360+LR77FJGW2TjkvjTzIEBx2VJySl64hClizHLqSNJdrlbgQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEWhKm/W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLCZNsav; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QEWhKm/W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLCZNsav"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE6Qst2494915
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 14:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gg6081YpwKP
	psw+SvH8/3fphksCH2ss8wRm7fjhCQ3c=; b=QEWhKm/W4rSTaCcyhn9nHZdoMpM
	o8jg0ISKYn+3wjWf/GwfkZczX7PGudFZzxhsgyYf6oXRHUu3i4DtzjQEuwFdaxzp
	UpuFP0xXOgmS0726PnL0u+zmF03FMEH339f2bJkU57iqQ0waC4plzemTwvFPZzQ9
	wSo1Z14UPRBGnrN3l45gWksGPK+d6KcVfAzGP5v3kC8QVqOPbSdIPGdImy2ELDOn
	bn93b35qQRFjqZY7YKzeCul4pIpCGZvzJZyQcVzS8ilI0WYXUsNRSZNW3EBGhDFp
	MRN6GcNAqF2dclVyzrkInkc01rOnUIvMSbyqwU7dCXKjEzrWDX23Nrfvjcg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8aysw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 14:12:20 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-155a75f91e1so1086645c88.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 07:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159940; x=1792764740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gg6081YpwKPpsw+SvH8/3fphksCH2ss8wRm7fjhCQ3c=;
        b=HLCZNsavGiaXdpvaINF28EIs3HAi/jkXutLWGlYcJpZXObWpavSj3B6F86R4TtqeV/
         akiOGK2eVubD7Ezp+KM0n5oHA+kDiSkVY/tIFkzuh+btMYPxNo86Opi68UYRAlW/mZmG
         bGXC/DQjD7JZw8loqGUvxw/Zc+EI4li+ABXPA5OV3RNE1BPUIEtx+FJ8IeF6Q/mk9XP7
         STXK7lPrNAX/yQB4w+E/teBBpl03QSlHLAq39WEQRrhbsBrMmDrpqHBSTNdcS+0N/HMS
         ur+LdxW2MOjkcBBVUOTXa2zBB978NQdHBFdP8C/Wugx821a7284YWkQuKMyGv0cP67Vy
         2pRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159940; x=1792764740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gg6081YpwKPpsw+SvH8/3fphksCH2ss8wRm7fjhCQ3c=;
        b=N6x08AXrUuihS+PBv9wFKN3pZz+RpY2PSuQSUPkMMgHbQuNQYOup6DSwNHKfsaSTGf
         1KqgtYLIvQJ/vFcMM4ir+TU25JgfdJzP86oUnzNXYEBYKBtLuK9YloZTEhaJCguyt/7V
         H6wVurSf8VrxqktRTYIjnVQxKG9faP7SuoUTYdsT4X7DGRKlAK0Ce/lX1dIarQEWlSGZ
         ZWO7c0Y/Xo+nCyvFGqOZH3/gzDhG79rHiL5GM2T1UQA+g2m4FXhrxNMOu5GAzIhqunY0
         aPUFDuSxlRgowUMrhiybrWMlfvqunHVY5y7ayYDhGUuW1ZWwz+qfwuS8UXsMCXrmrylz
         LM1g==
X-Forwarded-Encrypted: i=1; AKwUvBw7yNShfpSJYpNUDUvh0Qazh/tWLd5Fq9uA2nx7QwAjHdokJeO/fQL5k0MFKHkmWliIdHf9tnksDgooQw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJsH+h6ulJnRFzKiEFM2fP4GOGv002v8u0R6633N8HqmdP3ykFI
	8foQpxFJ9y+23zVzzMbRo5c9amSOy4NBt5PMaF3dK1ac3MhxF6rh+cOAvMoiiWhZI/7t54LCMOd
	aEQ15JilTXQqv/9BXBHweaEBk/F1E6qMbRnYXWh+/WwB1TmQYVsgPF104i5R2Ujm0YA==
X-Gm-Gg: AYBFou0zrX1hU8kTNWYc0bgOLWQfKQ3hljt51kv1MxdHL4rqOM9gQt018BcgmrKi/ux
	9JUFg2K3epnI/U4ZqXKuHyqbvN7N03T41+GVaLJ6bddfqe7wO/Ab2iHYARyndMklVR+XzUlyLsI
	VWzXqPoWa75wcIa7qWtMUhUkcEdlLJ+UXZm5VbwxCWA4V/gEbDaec4dxGx20r6PwCZgZfqtjdgS
	0AfDnD/2noiYxOacWFoMKKMBODr66+cee0OUOu+5PJVz495kKolL2TyoM3ZWMzijZin/DkR4tJN
	FOr4/LOUOSDyg7JJukDsrlVWpvMdkhXb3Z0gTHegCSE02RUhFgVabX5971kKnIVUC8fi9/LkC6l
	gR4VFJmeCnWW0y8J3U3dyVmfT4XuN5cWhmBgmQ7dsG2+pwq2n1TsF8yYzDOY=
X-Received: by 2002:a05:7022:913:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-18511232282mr132407c88.16.1792159939803;
        Fri, 16 Oct 2026 07:12:19 -0700 (PDT)
X-Received: by 2002:a05:7022:913:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-18511232282mr132314c88.16.1792159938892;
        Fri, 16 Oct 2026 07:12:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm6997682c88.1.2026.10.16.07.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:12:18 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology
Date: Fri, 16 Oct 2026 22:11:53 +0800
Message-ID: <20261016141153.1346219-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
References: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfXzHaQ0aeI87qG
 gBzrWCGSn46BCts1Qq9bZZkM54EawVwvukaMdZJPd1fC2yM1il/73c63XsThQ7sxXU+Yc0IgwMr
 slT9eRkwnhIXG2RA7+TZs8ilT8F+mCM=
X-Proofpoint-ORIG-GUID: o-_uM1S1Kx_TzUwBdd8X6Dv7BpVqihFw
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad230c4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pRitcdQJkKt4eD0iFYsA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX7vOauaYqvVMs
 XgAO5n5k6dQecZKJ4cv50bixbE4pNtnC2pVIpOPJtuTZhjX/cPSRRSlAj+s9muRKJtIF0nwUmjH
 K6sL11AnV6+389CVOrw6VhijKuheUwK2q9/WYAdfN6bvsBuT8f3IdjNnZrr0zjsvudN4tPG7sVx
 8/BjavbgEH0GM1ZWnkN7SihhjrxtVFVznLd+0eMmkeCdv3Taq98DzECIbBfxEhIzS1zPuN2Lrt+
 bc4icVbyECqzqIwNFTHNnRyaEz7HmF7p9TMYxX4wEuuRg3RUMTZ+j2KTh6iPSGHDUAyITtWAscU
 UUCWKJSCwoEqXroUIS3Vb394BDxOZkQS+/NJj+UWHsSlqzvOzbKqlvffTOFUm/P90yEyTMUX7e0
 abr4el/if1Fs09LAOSBU0TJQ9EoYTj2lbY9yR1q1S4SXrDbNIcTWfDSKGAyb6J/m1Y/1KEp3e8d
 RWZwViZ42boh/HUjIYw==
X-Proofpoint-GUID: o-_uM1S1Kx_TzUwBdd8X6Dv7BpVqihFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

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
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 72ccaea1feb3..bfbcf259002e 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -321,11 +321,10 @@ int q6apm_alloc_fragments(struct q6apm_graph *graph, unsigned int dir, phys_addr
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
@@ -357,13 +356,15 @@ static int __q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int gr
 
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
 
@@ -850,6 +851,21 @@ static int q6apm_audio_probe(struct snd_soc_component *component)
 
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

