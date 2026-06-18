Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE413F0A9E
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781782113; cv=none; b=KHsaS0C9HhphYhhsVPS/RKMCVsXAfGiNW+H1aYGxa5jJtFu8bHhqVt8+fTm0P7b6uiZNOxDsXbV24PA8mClOZcNIh1TJqOVoPa7YfW6aBfDzJx2pQ/l0frWDznU4edK+uBX/lnYPZetdMcXf3rqZwEZ+U2pYf/BGS6tmQIFp1Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781782113; c=relaxed/simple;
	bh=m6fNSJy3QkAxJP8pAzbB7WkgyCb1W7sL4ipsO1U7nHo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wbb2mRtFH0bTqdEK7U+zHn3gBiPqiRHRaaR4zs/sNeFodWOT2QWJjP5IW6FiWorS7fCEc4TFw8DCpbnmF+xET2b7pCypKTatNhzzWpQOH/F5tZEJnqX9zr2pV0scvHSkvkA5C0Qjwm3uHgDW6IH+y2fxYbB4Zw2X9kyg33y9iUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Grq9qqTu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7DiIrQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Grq9qqTu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7DiIrQk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAruc71536490
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/5h+P94GfQSkUDbb1xQIeOdb8TyPFbx5hbC
	hCvaTXzg=; b=Grq9qqTuS4P+rw7Ci8xC85aFN4JnSV9suYJ9e3IdqtCPirFJHu6
	xrclwg1asPOdmwwxDp+5fllOkJq4DnYC2+bIwJ26AqzvHL8YbgA2VzzIGoZrzx+8
	aeIYvSZhbNmKy6uBOMZQIzm002tuGDDK+LIiRBkjEz5h23lWmeWDkD/woN2FRakA
	QmOW+xxwhRg/ZlvjrdJvWxHJtqyzSjtqaiqgMtDeoepmJRZhYG63WC0+K+hiD3fX
	VsmHVsG/v95Ic1CYw5mhnKts1j3qguk1FrQ5LPOvFtrKSFtaBPwfrRbIDJ3hopFi
	NPSN7uxEcpGnF13Cq2N/o5fqpJo4dajxFzQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev12kk75e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:28:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6b7c75550so8271195ad.2
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781782105; x=1782386905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/5h+P94GfQSkUDbb1xQIeOdb8TyPFbx5hbChCvaTXzg=;
        b=P7DiIrQk1GmrqV+sPSJ5tR0ErBHGJ0t7bcuAHezxuMxmKG2IXJWwB3cp6fDw1B66a0
         qjuZJD8URFkzvofRah+u/9bWcpKoxwP0n3JYvzlx4zkF3ljqHbB087sKkfEweyEb0fSl
         4dQ4R4RB6Eux7jz3WaIDZ3ZNzAeH4vm+fgeaK3JlDCqXd7Y5zIHr4/Sly7R4OCkKJ6r0
         jYvgmjlnxgIezKgfhNpEGrNMzk6ZO7PMAJnWqsJVQ8MeO2ORDNxyLuzva9oP+XQcO25c
         uZNw2MwEroMsp/lqx6r+yR4mK503tEGsWp3N2h6Qi3cUQqQ9FJN6+G2SyJa/UHZZORwe
         2oMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781782105; x=1782386905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5h+P94GfQSkUDbb1xQIeOdb8TyPFbx5hbChCvaTXzg=;
        b=kUnI4PMOYT7PiV6oP1nLoBVcYPvhYhD8lCDdPClRQkBiRwSlMJCAL0A1AR7xHyJdi4
         2+/FkEY90TD3Yxmd/b2lZoOqu3EY0DHGe1eYvoyvfjDnKqZbrh5vLEFOm05T+3igKBQq
         9fIOoteaNcN8rrWsh1oZbkQTuJs+bd7d/dEOZufq/fsOqDMqJXSv8ZT1YkcZ0KG2UTvt
         5EPz/VhLfZyHBJhgDXD8I6qyPej7peBdYhL4xZ9GOCBhL6umWGg5OK5X8ySSliOfgPbK
         /6Kl59ZVgErC1l2dEqf4lBmPcbZaPjM9VfH1Ds9+tgCE8p+ChEVN+PtpCbv0jXpkdIEE
         OQXw==
X-Gm-Message-State: AOJu0YwSV+svBCGNFsxjuuPQ0DGoCqodX9v/S6jJy6WXCubLI/BcIqVs
	K80pSBl4PtJNW95zenVaEqi7xugK9FfnXck+v7Ajkjbr+PEZVOBd79V9jqMm14L1yrhY1q4gOTH
	k/KvEqF9mj4hUndhwQzlN+7XrBeZVOfajk1T4heJaIcFQGNaMk6rT5l+6NqpedtAJbKHlLYtqKw
	==
X-Gm-Gg: AfdE7cnRR+D5MsoFcDRatj3wVTdWz8iDnjUzmRWrlkuGBkS8dCV4HzpcRra8z1VDRID
	alKpe5BvIJK41sS1pvvd+3hggpsQw4w8tH7hJhr6jkfjPw+Pfus5eWgLJV12UMJzWmgGaHa2WPL
	e7VOhUWqbPQf1Y5UNRTMx3D2yrP20D/OWMy8Yu1h21AkpSrzJI1bSrmoyoFLFkzzgVhliKMrX+n
	mOvdw7Y6yJ6/T3DWrpLv7SsQ+TTnRsLkPpfvayuVd67EYLnoyVejYwh78Nc95B8aa4cyjHC+rgL
	LQQaCJGiL2hCyBDEihUpk3GYRNhDVXG5MHbRhCEbQpi9urkAl+lnATwnK84mzP2HcY5mgU//wCL
	8SBgxn2rTQU2muo2RF5qZ7F808N/dYgh7PV6RSEo=
X-Received: by 2002:a17:902:da8d:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2c6bc0bdc32mr81673365ad.14.1781782105294;
        Thu, 18 Jun 2026 04:28:25 -0700 (PDT)
X-Received: by 2002:a17:902:da8d:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2c6bc0bdc32mr81673025ad.14.1781782104804;
        Thu, 18 Jun 2026 04:28:24 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327aca9dsm191971965ad.50.2026.06.18.04.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:28:24 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1] ASoC: qcom: q6apm-dai: add carveout SCM assignment for mDSP buffers
Date: Thu, 18 Jun 2026 16:58:10 +0530
Message-Id: <20260618112810.2009847-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX5R89JWfydrCq
 VOPuq4OSfDbddWOn51Ic1+0sGI3rbmWu+8y1l4Jl22Mgg/DgFfoUX1bMbUJ/MpcjdJOCh/x3DwV
 ikETV0VGgE4xzl5FvRcw7iKAmVUifHHCOUo1DRX15oJM/zmVgarpu2F4bERW4pvv2chQJ4hNL9O
 ffePqowEuCcm/ps7Qk9inGRI8LjZiCZ5wLgaQe3vmMI7N+RMKnzH5gbEzM+HJ91vSlylP7luJBh
 alb9FBiqoWlcHCf4HbLg+FIc8mqL2UqNNnzVgK4CKGGEvQIC8CcKll2kN4ePdTo6D5++OBdrCJB
 yX707dTrWqVolQ3SnNV2H2SSV/Y2avbH4KnNLU9ZGX43MIbaJolQGrq8yw2FHTGl6A8INAwzDvi
 b71tI8N8TPSmXSiSnjLlSJZw8pF8fFWtUjMMVtAjNM0w5IvveL6Xg5CJ/Qz0eNs2lTd/5SGV6GG
 MUTX5bFANPQPMeEsd/g==
X-Proofpoint-GUID: LLCmVi5d0BLiemt6qyVlRVmgkRIO7yqz
X-Authority-Analysis: v=2.4 cv=HpVG3UTS c=1 sm=1 tr=0 ts=6a33d65a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wSi7XKbgxd81ijyHhsgA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: LLCmVi5d0BLiemt6qyVlRVmgkRIO7yqz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX+VKJOBS70pfW
 ud8Kmz8+ZciGJCJRGXgmu1i0AaVzG2Ehj7rgqsoL9seIkuqu17HF2Uo5wWMCc45wfXj+HNzGD5v
 UPvH0CCYSOyYiRGXRyCzLfhH0xr9poM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180107

On targets like Shikra where audio processing runs on the mDSP
(modem DSP) instead of the ADSP, the DSP operates with stage-2
secured memory. Unlike ADSP platforms where SMMU-mapped system RAM
is directly accessible, mDSP cannot access buffers unless they are
explicitly SCM-assigned to the appropriate VMIDs. This requires
allocating PCM DMA buffers from reserved carveout regions and
performing SCM assignment to grant both HLOS and the mDSP shared
RW access.

Add support for reserved-memory carveout regions listed in the
memory-region DT property of the q6apm-dais node. When qcom,vmid
is configured, all carveout regions are SCM-assigned to HLOS + the
configured destination VMIDs (RW) at pcm_new() time and ownership is
restored to HLOS-only at pcm_free().

For the data-path region (memory-region index 1), the device DMA pool
is attached via of_reserved_mem_device_init_by_idx() so that
snd_pcm_set_managed_buffer_all() allocates PCM buffers directly from
the carveout. The pool size is read from the DT node and capped at
BUFFER_BYTES_MAX.

All paths are gated on use_scm_assign and has_reserved_mem so existing
platforms without memory-region or qcom,vmid in DT are completely
unaffected.

Depends-on: https://lore.kernel.org/all/20260609064038.492641-1-ajay.nandam@oss.qualcomm.com/
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 207 ++++++++++++++++++++++++++++++-
 1 file changed, 205 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index f3dac2932afe..675cefa96305 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -15,6 +15,7 @@
 #include <asm/dma.h>
 #include <linux/dma-mapping.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/of_reserved_mem.h>
 #include <sound/pcm_params.h>
 #include "q6apm.h"
 
@@ -35,7 +36,8 @@
 #define COMPR_PLAYBACK_MAX_NUM_FRAGMENTS (16 * 4)
 #define COMPR_PLAYBACK_MIN_FRAGMENT_SIZE (8 * 1024)
 #define COMPR_PLAYBACK_MIN_NUM_FRAGMENTS (4)
-#define Q6APM_MAX_VMIDS 8
+#define Q6APM_MAX_VMIDS    8
+#define Q6APM_MAX_CARVEOUTS 8
 #define Q6APM_SCM_MAX_VMID 63
 #define SID_MASK_DEFAULT	0xF
 
@@ -99,6 +101,16 @@ struct q6apm_dai_data {
 	int num_vmids;
 	u32 vmids[Q6APM_MAX_VMIDS];
 	bool use_scm_assign;
+	/*
+	 * carveout regions from memory-region DT property
+	 * (index 0: control path, index 1+: data path)
+	 */
+	struct q6apm_scm_region carveout_regions[Q6APM_MAX_CARVEOUTS];
+	int num_carveouts;
+	/* true when memory-region DT property is present and DMA pool attached */
+	bool has_reserved_mem;
+	/* size of the data-path reserved region, capped at BUFFER_BYTES_MAX */
+	size_t reserved_buf_size;
 };
 
 static int q6apm_dai_assign_memory(struct q6apm_dai_rtd *prtd,
@@ -188,6 +200,103 @@ static int q6apm_dai_unassign_memory(struct snd_soc_component *component,
 	return ret;
 }
 
+static int q6apm_dai_assign_one_region(struct q6apm_scm_region *region,
+				       struct q6apm_dai_data *pdata)
+{
+	struct qcom_scm_vmperm *dst_vmids;
+	int dst_count = 0;
+	int ret, i;
+
+	if (region->assigned)
+		return 0;
+
+	dst_vmids = kcalloc(pdata->num_vmids + 1, sizeof(*dst_vmids),
+			    GFP_KERNEL);
+	if (!dst_vmids)
+		return -ENOMEM;
+
+	/* Always keep HLOS RW so CPU can continue carveout access. */
+	dst_vmids[dst_count].vmid = QCOM_SCM_VMID_HLOS;
+	dst_vmids[dst_count].perm = QCOM_SCM_PERM_RW;
+	dst_count++;
+
+	for (i = 0; i < pdata->num_vmids; i++) {
+		if (WARN_ON_ONCE(pdata->vmids[i] == QCOM_SCM_VMID_HLOS))
+			continue;
+		dst_vmids[dst_count].vmid = pdata->vmids[i];
+		dst_vmids[dst_count].perm = QCOM_SCM_PERM_RW;
+		dst_count++;
+	}
+
+	if (dst_count == 1) {
+		/* Nothing to assign beyond HLOS access. */
+		kfree(dst_vmids);
+		return 0;
+	}
+
+	ret = qcom_scm_assign_mem(region->dma_addr, region->size,
+				  &region->src_perms, dst_vmids, dst_count);
+	kfree(dst_vmids);
+	if (!ret)
+		region->assigned = true;
+	return ret;
+}
+
+static int q6apm_dai_assign_carveout(struct q6apm_dai_data *pdata)
+{
+	int i, ret;
+
+	if (!pdata->use_scm_assign || !pdata->num_carveouts)
+		return 0;
+
+	for (i = 0; i < pdata->num_carveouts; i++) {
+		ret = q6apm_dai_assign_one_region(&pdata->carveout_regions[i],
+						  pdata);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static void q6apm_dai_unassign_one_region(struct snd_soc_component *component,
+					  struct q6apm_scm_region *region)
+{
+	struct device *dev = component->dev;
+	struct qcom_scm_vmperm hlos = {
+		.vmid = QCOM_SCM_VMID_HLOS,
+		.perm = QCOM_SCM_PERM_RW,
+	};
+	int ret;
+
+	if (!region->assigned)
+		return;
+
+	ret = qcom_scm_assign_mem(region->dma_addr, region->size,
+				  &region->src_perms, &hlos, 1);
+	if (!ret) {
+		region->assigned = false;
+		region->src_perms = BIT_ULL(QCOM_SCM_VMID_HLOS);
+	} else {
+		dev_err(dev,
+			"Failed to unassign carveout %pa from VMIDs: %d\n",
+			&region->dma_addr, ret);
+	}
+}
+
+static void q6apm_dai_unassign_carveout(struct snd_soc_component *component,
+					struct q6apm_dai_data *pdata)
+{
+	int i;
+
+	if (!pdata->use_scm_assign || !pdata->num_carveouts)
+		return;
+
+	for (i = 0; i < pdata->num_carveouts; i++)
+		q6apm_dai_unassign_one_region(component,
+					      &pdata->carveout_regions[i]);
+}
+
+
 static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
@@ -716,7 +825,19 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 		if (is_push_pull)
 			size += POS_BUFFER_BYTES;
 
-		ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
+		/*
+		 * When a reserved DMA pool is attached (memory-region in DT), allocate
+		 * PCM buffers from it so the DSP accesses the carveout address directly.
+		 * Fall back to the standard fixed system-RAM buffer on other platforms.
+		 */
+		if (pdata->has_reserved_mem)
+			ret = snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+							     component->dev,
+							     pdata->reserved_buf_size,
+							     pdata->reserved_buf_size);
+		else
+			ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+							   component->dev, size);
 		if (ret)
 			return ret;
 
@@ -725,6 +846,12 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 			return ret;
 	}
 
+	if (pdata->use_scm_assign && pdata->num_carveouts) {
+		ret = q6apm_dai_assign_carveout(pdata);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -758,6 +885,9 @@ static void q6apm_dai_pcm_free(struct snd_soc_component *component, struct snd_p
 	if (!pdata)
 		return;
 
+	if (pdata->use_scm_assign && pdata->num_carveouts)
+		q6apm_dai_unassign_carveout(component, pdata);
+
 	substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
 	if (substream)
 		q6apm_dai_memory_unmap(component, substream);
@@ -1214,6 +1344,79 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 		pdata->use_scm_assign = true;
 	}
 
+	/*
+	 * Attach the data-path reserved memory region (index 1 in
+	 * memory-region, e.g. audio_mdsp_carveout_mem on shikra) as a DMA
+	 * pool so that snd_pcm_set_managed_buffer_all() allocates PCM
+	 * buffers from the carveout instead of system RAM. The size is read
+	 * from the DT node and capped at BUFFER_BYTES_MAX.
+	 * Index 0 is the control-path carveout (SCM-assigned separately).
+	 * Platforms without memory-region are completely unaffected.
+	 */
+	if (of_property_present(node, "memory-region")) {
+		struct device_node *rmem_node;
+		struct reserved_mem *rmem = NULL;
+
+		/* index 1 = data path (PCM DMA buffer pool) */
+		rmem_node = of_parse_phandle(node, "memory-region", 1);
+		if (rmem_node) {
+			rmem = of_reserved_mem_lookup(rmem_node);
+			of_node_put(rmem_node);
+		}
+
+		if (rmem) {
+			rc = of_reserved_mem_device_init_by_idx(dev, node, 1);
+			if (rc) {
+				dev_err(dev,
+					"failed to attach reserved memory pool: %d\n",
+					rc);
+				return rc;
+			}
+			rc = devm_add_action_or_reset(dev,
+				(void (*)(void *))of_reserved_mem_device_release, dev);
+			if (rc)
+				return rc;
+			pdata->reserved_buf_size = min_t(size_t, rmem->size,
+							 BUFFER_BYTES_MAX);
+			pdata->has_reserved_mem = true;
+			dev_dbg(dev,
+				"reserved PCM pool: base=%pa size=%zu buf_size=%zu\n",
+				&rmem->base, rmem->size,
+				pdata->reserved_buf_size);
+		} else {
+			dev_warn(dev,
+				 "memory-region index 1 not found, using system RAM\n");
+		}
+	}
+
+	if (pdata->use_scm_assign) {
+		struct device_node *mem_node;
+		int idx = 0;
+
+		while ((mem_node = of_parse_phandle(node, "memory-region",
+						    idx++))) {
+			struct reserved_mem *rmem;
+			struct q6apm_scm_region *r;
+
+			if (pdata->num_carveouts >= Q6APM_MAX_CARVEOUTS) {
+				dev_warn(dev,
+					 "memory-region: too many entries, ignoring rest\n");
+				of_node_put(mem_node);
+				break;
+			}
+
+			rmem = of_reserved_mem_lookup(mem_node);
+			of_node_put(mem_node);
+			if (!rmem)
+				continue;
+
+			r = &pdata->carveout_regions[pdata->num_carveouts++];
+			r->dma_addr  = rmem->base;
+			r->size      = ALIGN(rmem->size, PAGE_SIZE);
+			r->src_perms = BIT_ULL(QCOM_SCM_VMID_HLOS);
+		}
+	}
+
 	if (pdata->use_scm_assign && !qcom_scm_is_available())
 		return -EPROBE_DEFER;
 

base-commit: df8ed08e768021cfd059d910ba10b2c888beaeb6
-- 
2.34.1

