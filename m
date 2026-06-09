Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1F33C1994
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 06:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780987268; cv=none; b=gS2/KwsUXjBAxK1IRpOapJXRRNPbZlzWMgqhxZXsmjNsOa/P4ruvaql/iTi6qrxeWEXq8kAE3IOhs/inpqTapgVmr2LCGSwUd6bdUoq3MuIsXC1nSDZuK6/ccuZvb3fb3NSUoE3ZMVrccWUqd6kRhKfQPxypPUHJzBG52nGmO+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780987268; c=relaxed/simple;
	bh=G5Fd3C2/IIYhIJNTsrByruYUUtNsAZFI8dkJ/69ojR0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SazmdrRyuUUh2xhrbdlyHcIL+PSHEOARsl9nxKFO8U0iaErOwe8IJ1ciyAnopVEo/AQcGe5x1ZqWgv+uNTUL/2Mp5+Jm5NWzghUOnau2zXiILzYGoha1Y6uWKeefMdBSx3YLOqWl6ZFXybhbCpVDRZk1noRHdLc2PnzYSvyxW74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HyibZdut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIJlCWLW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HyibZdut";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIJlCWLW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wXcC1064824
	for <linux-sound@vger.kernel.org>; Tue, 9 Jun 2026 06:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lxzSeBH+ykp
	PP0MVObrals7OD4WQHIlu99LVG0RRhPY=; b=HyibZdutvuz3DXrbcJrQhkY5u2F
	OkaNkjODr7R2Y98+XogWKOZ0CdN9nZB9HEkJrSUFhXmVET6Aa1OALHQAqKYhGYeN
	SQtCX8QsKL5FLVQ5UqxuCIpOsKq1TKWNpn42zxjc1pVrLQgBhOsoof4Ehk91nJfT
	bxqb4VR8NQyrZwBDt7fjYpRjFJ9STiNPrSgdYtvOLBck/Id+0g6jyDwKi/xgqbmM
	e15Xaqloz0BhRcGV+o2kmNSNKa9ZtstnSgJX3bf+VFF1g+NczCSeffMR+e41QoCs
	EZQfZP7g89lmnbonOpynfznQvzgP/Obxr9Rg5t1XywlNk15sg2aL4nCibQw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m4dt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 06:41:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d99333358so5038824a91.3
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 23:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780987263; x=1781592063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxzSeBH+ykpPP0MVObrals7OD4WQHIlu99LVG0RRhPY=;
        b=QIJlCWLW2jbZ/w2+r4hVzgRRmi97W483hevuxb3Jf+c39TA8dIdjyism9jz0YDtary
         t3G755+XQwSL66RmXnP6b9MQHpT0DDIfWmaUPtXJr2p7ZOMSY2zXt3r8lTfcZAJNhdSP
         3k1QHeku1f81wLLrx6kJAvzyO7+FmB/OFblYHooC7DnVl7DKa/kD0mQ4iA0d5ivQYjEx
         FrztMejsNxM/5VWghGzQfv5GmzrKjkg4wvdQseWFZA4iFNMqCO/XHdn9ZdF3bjjs2qIr
         B/LpYem1seoSgzmE0/6m53Ki3YAkxce7+2zuSTtuYGd2x3gu8tD7CY683XEi9oSRBw8t
         38/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780987263; x=1781592063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lxzSeBH+ykpPP0MVObrals7OD4WQHIlu99LVG0RRhPY=;
        b=G+4pccSMVwVoFaNbmaZLetnr32hzfOJuGOZAETiln5LHgXjm+/jV8n2msNYDjcEiSd
         Lvvb0GBlrJKBogictDWPVRNku9x4DL8iSDcQcW74tAuW28kvx5piqRFPva5f9+HeWMuq
         03k9k2Jzi0uExF0IrNv430G6oncDIPH+q06J72Tuk/S5gELfZlfIYagTutcVPG0Rir/v
         OnHoIhUTe8MGSspxXXjv6+VQme6KYqfzkUsiWdbR2EDfOnaWEHLEPz66hsTd9VkNBPQ0
         cNJuT1ANgb/a9+h0qfil9fYSRHQKYJ7TyPYe9UuFHTmn9n/l0reEhJQ+nUMbeGuMyhqu
         w3XA==
X-Gm-Message-State: AOJu0YzvgSFXd+2tGafBy0iNp/pvgqPVVvnjhZocBTT8w6CxD9WXo6MQ
	BaRh6JdNY8+38W0yYR4q6+KkHM3Fr1StR9dP2JOYCT0WrdsnhLXBGK1u1gY+TJ/D3N2K8XelxHd
	HknYcBUXS5CW1gLGD4/rVypJWDKcakszJwlEaI/etXNOL1bllDlOFPMKKKgL50qlM0A==
X-Gm-Gg: Acq92OGPUp9elWXvQaLhn+Yeel+J1m42+tDyHaenrJ9oYE9AaahpXHL8eweKFw2UkeW
	IuS/rxjEoX/aPqxzmq3sovYuvR06Po158WuXj/HCeuwux1Vt9NXzKQ4HiNTI9XVKcA2mO9jZZFY
	fVDxma+cvXMpuegFnJq2efgVVhK5xvvNCE996Dv8MmvnozEAxDAyK/jv0WqSbEGXv/aWKpmF/Y5
	EkEHsOjk21gZFEDN0SoHJzyLu13G8o4of1OmUV64GfsE+97qayUuUjj993y2HjdJIXT7qkb4djv
	3Z/LMhjE4uP4GhnaVYq/TWfiu6f5dgFcx6ZE2hoKakaX5S5QgK5dZsGe2mOz3PHr8nClljPy41O
	w/X2lpTzAWj2RxkosxUvTlaNYcYuGK/JssQORQARdUFCEf1jFsiV4O+EE8ZWK
X-Received: by 2002:a17:90b:2f85:b0:36d:b680:3029 with SMTP id 98e67ed59e1d1-3751f35bda5mr1780798a91.1.1780987263162;
        Mon, 08 Jun 2026 23:41:03 -0700 (PDT)
X-Received: by 2002:a17:90b:2f85:b0:36d:b680:3029 with SMTP id 98e67ed59e1d1-3751f35bda5mr1780755a91.1.1780987262731;
        Mon, 08 Jun 2026 23:41:02 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668f9bsm17898953a91.7.2026.06.08.23.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:41:02 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 2/3] ASoC: qcom: q6apm-dai: add VMID-based SCM assignment
Date: Tue,  9 Jun 2026 12:10:37 +0530
Message-Id: <20260609064038.492641-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
References: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MCBTYWx0ZWRfX1c9HtdzBknWu
 fs/6+fpOBaaj+AJ/oPMNCGxAeA7V3vDaUUt4aAQANHcd91ze6Kys8rHWdw5Na7J9FFj2kxyxe9f
 MJ0Pmw/PX9/Kvf4ggQV8JZVoiNxS6K3SA2vUWqIrUhwwWwiN5K9XnT71EzcPKcKSfWFlmhYBTZp
 3ofajc4RdKQ+g8vvS/etFCuB+6kfWxBQ8ZD8Mp84bkpbnlF2ep/yHTuBT092Fos2AaTuse5xfeM
 a+hMIe9il04ltMonvf4+dr8Xt4g/cSbmxs8h+qBQMIFp+WD1HVAhFpqj4FzLMvixSjjMb618X5a
 Yg6sibHe1AYh50h3faSsaDytWwa0eNfPf1yb6un+9vmIt9m1UTY61E8u7Y5j+KBVqKuK6J5Ev3X
 2kU8Ff8O/necwQF3kt8zRKuh0HxlNU80sTWs1DnBvRSE73UlUxmDKWago/EMeqTx+zv6jMUtwMw
 NveCfjEWPIEPWOLc/6g==
X-Proofpoint-ORIG-GUID: PCtoL4Zvk5n2gBChMV2T0TKpMT22NU22
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a27b580 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=J2t13yfLkB8ZkNUaoHQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: PCtoL4Zvk5n2gBChMV2T0TKpMT22NU22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090060

Add optional VMID-based SCM memory assignment for q6apm fixed PCM DMA
buffers when qcom,vmid is provided in DT.

On platforms where audio processing runs outside HLOS, LPASS PCM DMA
buffers must be shared with secure/non-HLOS VMIDs so both endpoints can
access the same payload memory.

On platforms where audio runs on mDSP and buffers are backed by
secure/stage-2 managed memory, HLOS-only ownership is not sufficient for
DSP access. Optional VMID-based SCM assignment provides the required
shared ownership model for those systems.

Keep HLOS as an RW owner and grant configured destination VMIDs RW
access so both playback and capture data paths remain functional.

Assign and unassign SCM permissions at fixed-buffer lifetime boundaries:
assign in pcm_new() after fixed buffer allocation/map, and restore HLOS
ownership in pcm_free() before unmap.

This avoids reassigning the same fixed buffer in stream-lifecycle paths
and aligns ownership transitions with the fixed DMA pool lifetime.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/Kconfig           |   1 +
 sound/soc/qcom/qdsp6/q6apm-dai.c | 178 +++++++++++++++++++++++++++++--
 2 files changed, 170 insertions(+), 9 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e6e24f3b9922..82f496e53acb 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -101,6 +101,7 @@ config SND_SOC_QDSP6_ASM_DAI
 
 config SND_SOC_QDSP6_APM_DAI
 	tristate
+	select QCOM_SCM
 	select SND_SOC_COMPRESS
 
 config SND_SOC_QDSP6_APM_LPASS_DAI
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index bf1f872a09f4..ae7bcf980236 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -14,6 +14,7 @@
 #include <asm/div64.h>
 #include <asm/dma.h>
 #include <linux/dma-mapping.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 #include <sound/pcm_params.h>
 #include "q6apm.h"
 
@@ -34,6 +35,8 @@
 #define COMPR_PLAYBACK_MAX_NUM_FRAGMENTS (16 * 4)
 #define COMPR_PLAYBACK_MIN_FRAGMENT_SIZE (8 * 1024)
 #define COMPR_PLAYBACK_MIN_NUM_FRAGMENTS (4)
+#define Q6APM_MAX_VMIDS 8
+#define Q6APM_SCM_MAX_VMID 31
 #define SID_MASK_DEFAULT	0xF
 
 static const struct snd_compr_codec_caps q6apm_compr_caps = {
@@ -83,10 +86,106 @@ struct q6apm_dai_rtd {
 	bool notify_on_drain;
 };
 
+struct q6apm_scm_region {
+	phys_addr_t dma_addr;
+	unsigned int size;
+	u64 src_perms;
+	bool assigned;
+};
+
 struct q6apm_dai_data {
 	long long sid;
+	int num_vmids;
+	u32 vmids[Q6APM_MAX_VMIDS];
+	bool use_scm_assign;
+	struct q6apm_scm_region scm_regions[SNDRV_PCM_STREAM_LAST + 1];
 };
 
+static int q6apm_dai_assign_memory(struct snd_pcm_substream *substream,
+				   struct q6apm_dai_data *pdata)
+{
+	struct q6apm_scm_region *scm_region = &pdata->scm_regions[substream->stream];
+	struct qcom_scm_vmperm *dst_vmids;
+	int dst_count = 0;
+	int ret;
+	int i;
+
+	if (!pdata->use_scm_assign || pdata->num_vmids <= 0 || scm_region->assigned)
+		return 0;
+
+	if (!substream->dma_buffer.addr)
+		return -ENOMEM;
+
+	dst_vmids = kcalloc(pdata->num_vmids + 1, sizeof(*dst_vmids), GFP_KERNEL);
+	if (!dst_vmids)
+		return -ENOMEM;
+
+	/* Always keep HLOS RW so CPU can continue buffer access. */
+	dst_vmids[dst_count].vmid = QCOM_SCM_VMID_HLOS;
+	dst_vmids[dst_count].perm = QCOM_SCM_PERM_RW;
+	dst_count++;
+
+	for (i = 0; i < pdata->num_vmids; i++) {
+		/*
+		 * Probe-time validation rejects HLOS in qcom,vmid, so this is
+		 * only a defensive check for future non-DT vmids[] population.
+		 */
+		if (WARN_ON_ONCE(pdata->vmids[i] == QCOM_SCM_VMID_HLOS))
+			continue;
+
+		dst_vmids[dst_count].vmid = pdata->vmids[i];
+		dst_vmids[dst_count].perm = QCOM_SCM_PERM_RW;
+		dst_count++;
+	}
+
+	/* Nothing to assign beyond HLOS access. */
+	if (dst_count == 1) {
+		kfree(dst_vmids);
+		return 0;
+	}
+
+	scm_region->dma_addr = substream->dma_buffer.addr;
+	scm_region->size = ALIGN(BUFFER_BYTES_MAX, PAGE_SIZE);
+	scm_region->src_perms = BIT_ULL(QCOM_SCM_VMID_HLOS);
+
+	ret = qcom_scm_assign_mem(scm_region->dma_addr, scm_region->size,
+				  &scm_region->src_perms, dst_vmids, dst_count);
+	kfree(dst_vmids);
+	if (ret)
+		return ret;
+
+	scm_region->assigned = true;
+	return 0;
+}
+
+static int q6apm_dai_unassign_memory(struct snd_soc_component *component,
+				     struct snd_pcm_substream *substream,
+				     struct q6apm_dai_data *pdata)
+{
+	struct q6apm_scm_region *scm_region = &pdata->scm_regions[substream->stream];
+	struct qcom_scm_vmperm hlos = {
+		.vmid = QCOM_SCM_VMID_HLOS,
+		.perm = QCOM_SCM_PERM_RW,
+	};
+	struct device *dev = component->dev;
+	int ret;
+
+	if (!pdata->use_scm_assign || !scm_region->assigned)
+		return 0;
+
+	ret = qcom_scm_assign_mem(scm_region->dma_addr, scm_region->size,
+				  &scm_region->src_perms, &hlos, 1);
+	if (!ret) {
+		scm_region->assigned = false;
+		scm_region->src_perms = BIT_ULL(QCOM_SCM_VMID_HLOS);
+	} else {
+		dev_err(dev, "Failed to unassign DMA buffer %pa from VMIDs: %d\n",
+			&scm_region->dma_addr, ret);
+	}
+
+	return ret;
+}
+
 static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
@@ -218,13 +317,8 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	struct audioreach_module_config cfg;
 	struct device *dev = component->dev;
-	struct q6apm_dai_data *pdata;
 	int ret;
 
-	pdata = snd_soc_component_get_drvdata(component);
-	if (!pdata)
-		return -EINVAL;
-
 	if (!prtd || !prtd->graph) {
 		dev_err(dev, "%s: private data null or audio client freed\n", __func__);
 		return -EINVAL;
@@ -569,9 +663,13 @@ static int q6apm_dai_memory_map(struct snd_soc_component *component,
 	return ret;
 }
 
+static void q6apm_dai_memory_unmap(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream);
+
 static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct q6apm_dai_data *pdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm *pcm = rtd->pcm;
 	/*
 	 * Allocate one extra page as a workaround for a DSP bug where 32-bit
@@ -583,15 +681,17 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 	bool is_push_pull;
 	struct snd_pcm_substream *substream = NULL;
 
+	if (!pdata)
+		return -EINVAL;
+
 	graph_id = cpu_dai->driver->id;
 
 	/* Note: DSP backend dais are uni-directional ONLY(either playback or capture) */
 	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
 		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-	else  if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream)
+	else if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream)
 		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
 
-
 	if (substream) {
 		is_push_pull = q6apm_is_graph_in_push_pull_mode_from_id(component->dev,
 									graph_id,
@@ -606,6 +706,14 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 		ret = q6apm_dai_memory_map(component, substream, graph_id, is_push_pull);
 		if (ret)
 			return ret;
+
+		if (pdata->use_scm_assign) {
+			ret = q6apm_dai_assign_memory(substream, pdata);
+			if (ret) {
+				q6apm_dai_memory_unmap(component, substream);
+				return ret;
+			}
+		}
 	}
 
 	return 0;
@@ -635,15 +743,25 @@ static void q6apm_dai_memory_unmap(struct snd_soc_component *component,
 
 static void q6apm_dai_pcm_free(struct snd_soc_component *component, struct snd_pcm *pcm)
 {
+	struct q6apm_dai_data *pdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_substream *substream;
 
+	if (!pdata)
+		return;
+
 	substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
-	if (substream)
+	if (substream) {
+		if (pdata->use_scm_assign)
+			q6apm_dai_unassign_memory(component, substream, pdata);
 		q6apm_dai_memory_unmap(component, substream);
+	}
 
 	substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-	if (substream)
+	if (substream) {
+		if (pdata->use_scm_assign)
+			q6apm_dai_unassign_memory(component, substream, pdata);
 		q6apm_dai_memory_unmap(component, substream);
+	}
 }
 
 static int q6apm_dai_compr_open(struct snd_soc_component *component,
@@ -1023,6 +1141,7 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 	struct device_node *node = dev->of_node;
 	struct q6apm_dai_data *pdata;
 	struct of_phandle_args args;
+	int vmids;
 	int rc;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
@@ -1035,6 +1154,47 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 	else
 		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
 
+	vmids = of_property_count_u32_elems(node, "qcom,vmid");
+	if (vmids == -EINVAL) {
+		pdata->num_vmids = 0;
+		pdata->use_scm_assign = false;
+	} else if (vmids < 0) {
+		return vmids;
+	} else if (vmids == 0) {
+		dev_err(dev, "qcom,vmid must contain at least one VMID\n");
+		return -EINVAL;
+	} else if (vmids > Q6APM_MAX_VMIDS) {
+		dev_err(dev, "qcom,vmid: %d VMIDs exceeds maximum of %d\n",
+			vmids, Q6APM_MAX_VMIDS);
+		return -EINVAL;
+	}
+
+	if (vmids > 0) {
+		int i;
+
+		rc = of_property_read_u32_array(node, "qcom,vmid",
+						pdata->vmids, vmids);
+		if (rc)
+			return rc;
+		for (i = 0; i < vmids; i++) {
+			if (pdata->vmids[i] == QCOM_SCM_VMID_HLOS) {
+				dev_err(dev, "qcom,vmid must not include HLOS VMID (%u)\n",
+					QCOM_SCM_VMID_HLOS);
+				return -EINVAL;
+			}
+			if (pdata->vmids[i] > Q6APM_SCM_MAX_VMID) {
+				dev_err(dev, "qcom,vmid[%d]=%u exceeds SCM max VMID %u\n",
+					i, pdata->vmids[i], Q6APM_SCM_MAX_VMID);
+				return -EINVAL;
+			}
+		}
+		pdata->num_vmids = vmids;
+		pdata->use_scm_assign = true;
+	}
+
+	if (pdata->use_scm_assign && !qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
 	dev_set_drvdata(dev, pdata);
 
 	return devm_snd_soc_register_component(dev, &q6apm_fe_dai_component, NULL, 0);
-- 
2.34.1

