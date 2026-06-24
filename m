Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955C6270575
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304685; cv=none; b=N0AGkOnjSDW51oK03mwsPVyAGm+fscW3NSLNex3qpG65p9yq3RqFNHz8cXBU9SY7K4jdxy4PFndEnD5GXFyawaEQXdY31B0V36E4JTcpo/G0KT2nzUGIeIfpXX9h/RdW4Hp2KvXb646k3tOX8unrFwPatHGp/vGW2xLl+vIBld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304685; c=relaxed/simple;
	bh=eZo39qhLyvlAUlOFOqxSsPU8dkPu4Bs479NnLzmPJTc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=INIaTuuDiX1au2flmhyfILb9qP7ANOl2oVjVXt0IEOZqHZI1D6skQkXYCi42nhnK21wL0iuYMJnC9oQXgXnyuVDIaLCCzP1xps+HKOXkXeoR46fcBWPKLYmgqzG13xDqdZ834ASj18idkJ+YO1NNrYG38yNAUa8fk+hbbrCkqFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaT/rlPO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvRaWLzL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaT/rlPO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvRaWLzL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANcVE2583064
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 12:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JIlj/6TL+DDi2KnVNO6MdSCt0pCD5yfjFQu
	KSLgghBg=; b=iaT/rlPOZSl1vhHHhTgrOCbzvtOR+jpMzNNRyiQzlAXp+2AS0Hs
	hqFs2rrSHok6COXE7KNlbFtCPrUuVPpJxzW4EX/Hlgm2Bth7QnIlehtwRCDp3WVQ
	AXrj4saElshWNvKpzVtzw4Jfd1CuOElIbZb0zxEfYRlTbuBMflEYaPw+nl2Dyqko
	c2gSt6R/CaGNj7NZ9+JQLOwSi0zQaueNa7I4kE8fyjJn3dnKNDfcCJrGzcGKtUP0
	+NnO0Ob94EwCsHZr/5cp+HTfzMewsjhB3GD77q7It1WGC+QVdkR7dOYVQIdmNznR
	h2RY+1PbPNd0Htk74hyZi8Xu0xppF3Rc6pw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f00evb3e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 12:38:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88fc985a65so634182a12.2
        for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 05:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782304682; x=1782909482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JIlj/6TL+DDi2KnVNO6MdSCt0pCD5yfjFQuKSLgghBg=;
        b=gvRaWLzLx5Es4Wwsyzyy6UaNtZG6nuJ2z63B7wzeQ5hUezgNBlHzEULXC7rZ+Wxtbe
         LoOfPGKo8HXSzCHgq7omERRNyFIvcb0RrTi84lZKMQ3949o0NadWsuNyjPJZqF4khvVO
         oYEEJWyM7S/JXUVkWFRhamFzl7qFPI2z1u0peap3VsqZdFk5M0rzqTJWA6q92xbjwGju
         fHnu/A3BOmNUyblzI7fu2962saGjY0HwjEYatROCWFmMGucxN1F0nMJth2Nf81HltDXY
         C8jOMIld8T6tKBRun4Ii7aZLT65zPHINRaLFvfCw2qPEibXO+lBRiLQQOFGbrmTqD1/k
         Qk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304682; x=1782909482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIlj/6TL+DDi2KnVNO6MdSCt0pCD5yfjFQuKSLgghBg=;
        b=Xb9J4Qdivgb5y8xtl6GEWIvmw8X0yuiFI3yyL6HH8x9Kzb/J9Iru7Jm407OswLEgny
         pCQkmIwII2srAXdXPkwaS8P4Z0pr5ou1ScT2KM0pFbkXKMH09MOPv2LpmxetMFe5Fe0S
         7I364gE0uD89NFT//Up2x0ULTnCwtkFAZLiOvkd87Ij8pHv5Y2i3ZLAvsFFU0qEbFLmn
         Te+9PPwpKzfv1dcdl/JtsrlsyhRpVAfZBCXifKwSvINcZTTvYpUuDWQwa1tL0S05rkxR
         pg6db68waKcy+p/iOlL7+wAmAUWX4tEk1eSGAL9q98miQUGC0swcH3UKRd36zxSWOFdw
         zoiA==
X-Gm-Message-State: AOJu0Ywopu9rZDf3ZKNAnkubkFXk6p205Wb9I5rA5/nEn5tcdt2ifVoH
	+fkSmgEylnRJ4+HpLiv/b4bHxufOg4l3m97RujVtJTeaqtpT9VnC69z2Uzrqay1grlu0Op4P32q
	RVkCWPjNrmkwk+dyfmYAJ5qFYb1/7HPuBMlnCRqW/OGHuus6vX8ngv9w4/yQAnz6ftw==
X-Gm-Gg: AfdE7cnLuSEsj/SGVlaoMRqWuZXMiIQC9940iNqZe5x3doFVmexEJ0+zax85Z6RL0ZY
	MXUr93Uek4oRX2Bu4325oUkW0eFMiK7hBx0w2LJxtEuMbFL0JhpRgt2lnUqi+/dGUciD0T6V+ST
	p+TJju9vQt2uXRJ3XGQgMcipWo5xXPrm8LCJiUj7avQhuqAdPES5BiAQYtGyMkMc8pzBECatfe8
	OYgnBBncO1CXbuMI3zGEH1aBM59A8qOXRYU0Rv2QZk7pyHaJwaBmU3fgM0/Twa0VLJ7a9UrPKJr
	tPj6TMx7c8ftoQ34x+lYsZx1OMZpQ/SSDhToyLhF1YaFRmjPLDhELXcINQdd3ADXB/cTQ3jwT92
	JZ2zFXg4j3d15Hgq1rZCuLJZ2Q/AirHXaL1WpUTQ=
X-Received: by 2002:a05:6a00:27a4:b0:845:352a:a207 with SMTP id d2e1a72fcca58-845a27c3137mr4255801b3a.34.1782304681899;
        Wed, 24 Jun 2026 05:38:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a4:b0:845:352a:a207 with SMTP id d2e1a72fcca58-845a27c3137mr4255760b3a.34.1782304681331;
        Wed, 24 Jun 2026 05:38:01 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb775sm2117980b3a.20.2026.06.24.05.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:38:00 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2] ASoC: qcom: q6apm-dai: add carveout SCM assignment for mDSP buffers
Date: Wed, 24 Jun 2026 18:07:48 +0530
Message-Id: <20260624123748.502781-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEwNCBTYWx0ZWRfXzBugmupYFInd
 LxEMCUoZubLE8zbw4rDJ2q/7nu85i6Nk7wbS0vOevw44/aDofH69fVfo6NpeaX0rAuL/1C0LgAy
 89jhYawZnN9RQoQD0gplkUiafLuAfSHrg5wfa0MJbqMSwJ0i+fdFU+K0nQ2c2G1Jq9AxsES/gsZ
 pMlCfJKqBAx6M5BjFMRkAc/P+W6Y9lJkw2gOrG7SnIdL7bkLdSq+zl5tAZ5Vdk481U8eSywJ/kM
 KfGty1Q6nvr4J83aH9r/zEZYbNdAgW/VJQMsozSvGFfzf6yD6oS4iuEF5igMGHCrEw7XtGkhJl2
 j1ezfWxpt1AAx7gaMeerLh0kRzfrykq5XwW8Rc8nmk31/iEQwrdNj++wghMCUTAPxXDGL/j+ZS1
 l1GDlHdJmRRbnaBG8ZHPaKQHBQovr/ESGfbyz44gWl1XZL3XKw1Neif9BCpjtu+lTmA689U6/8q
 Lz0ZJ75a9ROU3vkOF/A==
X-Proofpoint-ORIG-GUID: K9zPjP0qhOhFmhGBOFJvF1ZsF3UFFmmH
X-Proofpoint-GUID: K9zPjP0qhOhFmhGBOFJvF1ZsF3UFFmmH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEwNCBTYWx0ZWRfX84DXNNRCVjvC
 q6ZERaMdFr3X4ed6fhK3K6c5X288dKbo86KDCVqZU5JtWyGRZEM5z4Z8xglozadTLcm8fU71meh
 i1Wq03hJ67dvbffsXjI47fYqdO/kYic=
X-Authority-Analysis: v=2.4 cv=JbaMa0KV c=1 sm=1 tr=0 ts=6a3bcfaa cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6n8x5uLz0xxzw8YfkawA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240104

On targets like Shikra where audio processing runs on the mDSP (modem
DSP) instead of the ADSP, the DSP operates with stage-2 secured memory.
Unlike ADSP platforms where SMMU-mapped system RAM is directly
accessible, the mDSP cannot access buffers unless they are explicitly
SCM-assigned to the appropriate VMIDs. This requires allocating PCM DMA
buffers from reserved carveout regions and performing SCM assignment to
grant both HLOS and the mDSP shared RW access.

Add support for reserved-memory carveout regions listed in the
memory-region DT property of the q6apm-dais node. When qcom,vmid is
configured, the control-path carveout (memory-region index 0) is
SCM-assigned to HLOS + the configured destination VMIDs (RW) at
pcm_new() time and restored to HLOS-only at pcm_free().

For the data-path region (memory-region index 1), the device DMA pool
is attached via of_reserved_mem_device_init_by_idx() so that PCM buffers
are allocated directly from the carveout. The per-substream buffer size
is derived from the region (capped at BUFFER_BYTES_MAX) and the same
size is used consistently for the buffer-bytes constraint, the DSP
memory map, runtime->dma_bytes, and the per-substream SCM window so all
layers see a single coherent window. Only index 0 is SCM-assigned via
the carveout list; the data-path region is assigned per-substream, so
the carveout walk stops after index 0 to avoid double-assigning the
same physical region (which TZ rejects with -EINVAL).

Use a typed reserved-memory release callback for
devm_add_action_or_reset() instead of casting
of_reserved_mem_device_release(), so the function-pointer prototype
matches and stays CFI-clean.

All paths are gated on use_scm_assign and has_reserved_mem so existing
platforms without memory-region or qcom,vmid in DT are unaffected.

Depends-on: https://lore.kernel.org/all/20260609064038.492641-1-ajay.nandam@oss.qualcomm.com/
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
v1: https://lore.kernel.org/all/20260618112810.2009847-1-ajay.nandam@oss.qualcomm.com/

Changes since v1:
- Fix double SCM assignment of the data-path region: the carveout walk
  now stops after index 0, since index 1+ are assigned per-substream.
  Assigning the same physical region twice was rejected by TZ (-EINVAL).
- Size the per-substream buffer from the carveout (region / 4, capped at
  BUFFER_BYTES_MAX) and use that same size consistently for the
  buffer-bytes constraint, DSP memory map, runtime->dma_bytes and the
  SCM window (v1 mixed BUFFER_BYTES_MAX with the full region size).
- Use a typed reserved-memory release callback for
  devm_add_action_or_reset() instead of casting
  of_reserved_mem_device_release() (CFI-clean).
- Drop a debug print that triggered a -Wformat warning (%zu vs
  phys_addr_t).
 sound/soc/qcom/qdsp6/q6apm-dai.c | 238 +++++++++++++++++++++++++++++--
 1 file changed, 230 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index f3dac2932afe..44c5ad97efae 100644
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
@@ -188,6 +200,102 @@ static int q6apm_dai_unassign_memory(struct snd_soc_component *component,
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
 static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
@@ -469,7 +577,8 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 	struct device *dev = component->dev;
 	struct q6apm_dai_data *pdata;
 	struct q6apm_dai_rtd *prtd;
-	unsigned int assign_size = BUFFER_BYTES_MAX + PAGE_SIZE;
+	unsigned int buf_size;
+	unsigned int assign_size;
 	int graph_id, ret;
 
 	graph_id = cpu_dai->driver->id;
@@ -480,6 +589,9 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
+	buf_size = pdata->has_reserved_mem ? pdata->reserved_buf_size : BUFFER_BYTES_MAX;
+	assign_size = buf_size + PAGE_SIZE;
+
 	prtd = kzalloc_obj(*prtd);
 	if (prtd == NULL)
 		return -ENOMEM;
@@ -507,7 +619,7 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-						   BUFFER_BYTES_MIN, BUFFER_BYTES_MAX);
+						   BUFFER_BYTES_MIN, buf_size);
 		if (ret < 0) {
 			dev_err(dev, "constraint for buffer bytes min max ret = %d\n", ret);
 			goto err;
@@ -528,7 +640,7 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 	}
 
 	runtime->private_data = prtd;
-	runtime->dma_bytes = BUFFER_BYTES_MAX;
+	runtime->dma_bytes = buf_size;
 	if (pdata->sid < 0)
 		prtd->phys = substream->dma_buffer.addr;
 	else
@@ -538,8 +650,8 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 		void *pos_buffer;
 
 		assign_size += POS_BUFFER_BYTES;
-		prtd->pos_phys = prtd->phys + BUFFER_BYTES_MAX;
-		pos_buffer = (void *)(substream->dma_buffer.area + BUFFER_BYTES_MAX);
+		prtd->pos_phys = prtd->phys + buf_size;
+		pos_buffer = (void *)(substream->dma_buffer.area + buf_size);
 		prtd->pos_buffer = (struct sh_mem_pull_push_mode_position_buffer *)(pos_buffer);
 	}
 
@@ -660,7 +772,9 @@ static int q6apm_dai_memory_map(struct snd_soc_component *component,
 	else
 		phys = substream->dma_buffer.addr | (pdata->sid << 32);
 
-	ret = q6apm_map_memory_fixed_region(dev, graph_id, phys, BUFFER_BYTES_MAX);
+	ret = q6apm_map_memory_fixed_region(dev, graph_id, phys,
+					    pdata->has_reserved_mem ?
+					    pdata->reserved_buf_size : BUFFER_BYTES_MAX);
 	if (ret < 0)
 		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
 
@@ -716,7 +830,19 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
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
 
@@ -725,6 +851,12 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
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
 
@@ -758,6 +890,9 @@ static void q6apm_dai_pcm_free(struct snd_soc_component *component, struct snd_p
 	if (!pdata)
 		return;
 
+	if (pdata->use_scm_assign && pdata->num_carveouts)
+		q6apm_dai_unassign_carveout(component, pdata);
+
 	substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
 	if (substream)
 		q6apm_dai_memory_unmap(component, substream);
@@ -1157,6 +1292,11 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.remove_order   = SND_SOC_COMP_ORDER_EARLY,
 };
 
+static void q6apm_dai_reserved_mem_release(void *data)
+{
+	of_reserved_mem_device_release(data);
+}
+
 static int q6apm_dai_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1214,6 +1354,88 @@ static int q6apm_dai_probe(struct platform_device *pdev)
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
+						      q6apm_dai_reserved_mem_release,
+						      dev);
+			if (rc)
+				return rc;
+			pdata->reserved_buf_size = min_t(size_t, rmem->size / 4,
+							 BUFFER_BYTES_MAX);
+			pdata->has_reserved_mem = true;
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
+			/*
+			 * Only index 0 (control-path carveout) is SCM-assigned
+			 * via carveout_regions[]. Index 1+ are data-path DMA
+			 * pools handled per-substream by q6apm_dai_assign_memory()
+			 * in open(). Including them here causes a double-assignment
+			 * of the same physical region which TZ rejects with -EINVAL.
+			 */
+			if (idx > 1) {
+				of_node_put(mem_node);
+				break;
+			}
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
 
-- 
2.34.1

