Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555873;
	b=bqtMnd5DXfpYDmSZpucN/U98sObKAGrEXqGzW33TWoOI4txf9fTH1mgbxkgHNXL5nNy6
	 //TL+d0kJvp0eUwQw3GOrVEAI3yTk+DmLbr8JED/xSNVtENEXzf5LAYcQsdEdsdfA7lGX
	 rGplbkhdzLKp2BEJmufMmKAsEulnI+nXazv3WUQ0FE1RQZW/T0b/pQRBINuYVIT3JViku
	 bB72ayE9m+hzisuFFpoPOTMbpFFtl1TgrSCsCawubnxVDhhG4LpL/nDS2ymuSWEdLiFNT
	 1aqfY5RXMJbhrgsj0EkNW73gyptbOOebEuQZfYVeAE0bVJEdm6vkqQbOa/M6UPcedgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5zA0Rbfy8As1tn/Vj7thw7Vz3e4ADheFVIdzKIvos/I=;
	b=w2NklG9Sc3adHAzA8s73fnlVGynZzQIkxnuk+pIXtvUwocZA8MUbsfoCv/QXoI64b5XU
	 KIl9/tqW7NBhNrdDKN0eMYgKQbzTPXy3rajHsG4mTFoHQGcc83/TlxBeFEMmjxgfvG3BL
	 q4She9LDWdKpAk17k2SHk3ylDOyVpdJ0EdPgUmIqcphpzg+t/W+jpQCPthotHfFe4S9eU
	 YnoKx4FbYZs43MmwYoyEgSoW4kKLtJvdGpxrzD9Kix6gNtA5u0F3JgDP/zbb8f15BGO45
	 jhU1ZWvxcKlGKtplZNaG06oGWPio2uOw/HOMBqbvWbvsmsrixAiQGg19AZw48CPaOfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E81QFQEG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FJMEKiYX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546A4606A32F
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 04:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 546A4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E81QFQEG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FJMEKiYX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2EtEN299877
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 04:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5zA0Rbfy8As
	1tn/Vj7thw7Vz3e4ADheFVIdzKIvos/I=; b=E81QFQEGf3F3YRiQIo+9COzUgEC
	NLj7QRd5rGi2pQ86kyUv1mWrL2/uPx0VQgJ07o1BTBTeYZt7RdCfCcv+1NtdXw24
	2ht8ndf6Tsbvvbu7aQ7dFJXz04GCcYB/zMKJuiksSFaFKONdOxReLgScYVVlwNAk
	asXCiFzBuzyhcKA+d9wW7lxzYQwhe2pRUd0e7ckZnhZG71h26FEvQHWlMtbU1ebC
	mIrhxFcsEjO+mpAEw2eIe9KciqkqRvxdZ2ovCKFapq4D8Xk3U/nmr3vcSYPkCYTS
	HUmFF9durhAdZbWoLvqNVy+jDMkXAyb39XlXhQ+wmnvV1plYsTLb5WzCCvw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4svnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 04:11:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso536579eec.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 21:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792555872; x=1793160672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zA0Rbfy8As1tn/Vj7thw7Vz3e4ADheFVIdzKIvos/I=;
        b=FJMEKiYXrjotqPl8loe3RbYyifm648fRYpqIL3hd10Y4w2P3HbYSDEzfBvq6nr6fsx
         GA5cwObOiQvrKdpyrLj2slQEsiiWYJ2qukPjJgy/n7Ad9CBOmJGELhhuQz7689oB1CqH
         XmvhossNxoY5kAHMHEam0sk1QAe1UusoUL33i6o3ThXl1Oei4qHy2GB9+gvqjvnIECgD
         6j3or3Tass46wLeqFRVCMocxclD6np531t+DkFHXxCQz5sQ1kQmm+m5LnuA27I5p7cN+
         7Wxh7KFC14SNnWxVeCCRDKVT6gfYbsoBmYo5Tnd7YtFdXU6SaQXX0LBeiOxIeSpVPQD9
         mx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555872; x=1793160672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5zA0Rbfy8As1tn/Vj7thw7Vz3e4ADheFVIdzKIvos/I=;
        b=BUyMVsXQn81hrgHS9R9Osa9pGDuLXf3nPAJ4c4aCurAr9cdl+Y05o+8v8Nv4jxEEHi
         TOHL2P2LzoHz3dNKZgrayaMqCaBHNp917gTy5vJfn6458hio5pcW0LYFLShmhIM1M5sv
         3XcU93abqzZjnzOJexd5rU/2WTk7h8R99VjDM+2LFKsot2nEmE5PYVuotC464u9tdS1+
         A/wOP2ZOsDBnEZVSBHwyJRYSHPbT4OPP196v1SkIX/E3RksffvFeqEy+KuvKu3I7+ffi
         3NwnmEMU7gqxvXj5Q3YvuAmJpggxNayrRuf4+aDphMPE0+aC7XbANU1/aS0tUhQPXmZf
         zrvg==
X-Forwarded-Encrypted: i=1; AKwUvBwnxSzrs5uv15AGCA/Iiw2GLTa4izzG/ljE4dudPvbFQksiiac5vkZRneRidBZDXxPFny3tuEs1bnfWLw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIOH4Roij1PzJDIBaNF7z7mcNe6/fQ4Zcsu4fkDetcRL6cGHtew
	cxivy2EkOjdEtb0P/lujBAby3TEntimIEytuG0htI33dwjZcW2AaDBpLyONL87a6oeBr8rcXS6l
	D0p0UIa0EEXLMb5LlQLdpQq2MfTxealGKRPWXztgj86t9FoqLQmmeSgWFSglgV/byJw==
X-Gm-Gg: AYBFou2sgffeZS/xH1U7FPP9mjsV2X+By/5YOVz47QoPmuzighltWSIlwUlaxv8ddZS
	JR2M7C6T5F7yg0xMzo4z6alIOGLeu8YyKeC7ERhI/YSwQ+Byne82/aFj97NhZFvYNW1PBY56aMB
	JmZpvXLvTmTEZ7Nw5rKXfvgZtjthUKG9b8ipt2NDDVixKJgXSBBLTTDfNzP+wtsG6jUVk8a+Icj
	qANLziJOmiQjzE4G7f+fn9rjq2nDNY2vi9r5un8PRZdmaYuAiPpKdt165z1WbmgDbB8wCsudQS6
	UtbN9sW6p21GrhaJK5nFfHwwB2aIDsgOgWBD6ibvMfb2pdUlveDMKz+69YxtsAzgm6yEi6mUkEl
	HawcQiz7Ev/MUBuUOpZijteAj7E+MU81rSIqKOHl+6ImvJNIBmU8C7fXKouI=
X-Received: by 2002:a05:7022:2507:b0:151:ece6:b16b with SMTP id a92af1059eb24-190a4c1fa2emr1644323c88.7.1792555871669;
        Tue, 20 Oct 2026 21:11:11 -0700 (PDT)
X-Received: by 2002:a05:7022:2507:b0:151:ece6:b16b with SMTP id a92af1059eb24-190a4c1fa2emr1644271c88.7.1792555871045;
        Tue, 20 Oct 2026 21:11:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2915427c88.22.2026.10.20.21.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:11:09 -0700 (PDT)
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
Subject: [PATCH v2 2/3] ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
Date: Wed, 21 Oct 2026 12:10:43 +0800
Message-ID: <20261021041044.2080369-3-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: wJamuXG97BMV2aeVyG3vciEOcKrhBJzB
X-Proofpoint-GUID: wJamuXG97BMV2aeVyG3vciEOcKrhBJzB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfX8n+K4b8O+IOg
 tfQb5sR2LH1eI7geSdam7FzjxdBbf4NoR9zyekw5dgw8lpyUzEqbO0u0JNJ6bM3h2wgW1NR5HKx
 Xc/Tg9Ags7TxudG/ptQbfZ14trCe9v4=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad83b60 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RRt428QXv51Blb0ChN0A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfX1AOrmhjP3EIY
 0u/vmA/NZx92mxj+UXwevYcGgyXEsuJnz3adCbYuAAB8bKc4crpkM3v4927ct4555VoZPNoCudN
 tgV40noVN5RdSxe++ixCL1wkr2Gop0/iwKGo4E4vuSG8YF8n5nUy9s1sf4Bny2eNPqiYsPMUpr/
 wwGc6CEDqBx6acOjRb5VnuNuECKXUivEIyRRJFW1M+Cl8Pp7/uluQ8/yRz4Ec7moJ/9eVugikbG
 CsMPMomAzVxFTUrsEHs9VThgK6CNWimVbOiwuJhNPC+5VQ2Emk+JuHPbAosYs+b9msGKzWY8q5S
 uJj4sJo0NCr6eUaEUOeL8BuDe1WrgXU88bNXNUKPDH0BHJhAPplGNv38Wj1Ww6zRD5yTt+NX2QK
 0ZKpl1BBgJvwO+TFPYnMG9Aemh+VEXugb32XQ4M0RErXbljkh1HymEwBgLds+frsRTOcLxT17O9
 ja93vYkwLC573Gz5KIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210016

Push/pull graphs map two shared-memory regions per graph, the circular
buffer and the position buffer, and keep a separate DSP handle for
each. The map path tags its token with APM_MMAP_TOKEN_MAP_TYPE_POS_BUF
so the response lands in the right handle, but the unmap path sends a
bare graph ID and the response handler always clears mem_map_handle.

Unmapping the position buffer therefore wipes the circular buffer's
handle and leaves pos_buf_mem_map_handle set. A subsequent unmap of the
circular buffer is skipped, leaking that DSP mapping, and a remap of
the position buffer is skipped because the stale handle looks valid.

Tag the unmap token the same way as the map token and decode it in the
response handler to clear the matching handle.

Fixes: 7c1ac23b178a ("ASoC: qcom: audioreach: Add support for shared memory push/pull modules")
Cc: stable@vger.kernel.org
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index fa7f5dfca418..0e5219a6513f 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -329,8 +329,9 @@ static int __q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int gr
 	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct audioreach_graph_info *info;
 	uint32_t mem_map_handle;
+	uint32_t pos_mask = is_pos_buf ? APM_MMAP_TOKEN_MAP_TYPE_POS_BUF : 0;
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(sizeof(*cmd),
-						APM_CMD_SHARED_MEM_UNMAP_REGIONS, graph_id);
+					APM_CMD_SHARED_MEM_UNMAP_REGIONS, (graph_id | pos_mask));
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -966,9 +967,16 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
 					result->opcode);
 
-			info = idr_find(&apm->graph_info_idr, hdr->token);
-			if (info && !result->status)
-				info->mem_map_handle = 0;
+			graph_id = hdr->token & APM_MMAP_TOKEN_GID_MASK;
+			is_pos_buf = hdr->token & APM_MMAP_TOKEN_MAP_TYPE_POS_BUF;
+
+			info = idr_find(&apm->graph_info_idr, graph_id);
+			if (info && !result->status) {
+				if (is_pos_buf)
+					info->pos_buf_mem_map_handle = 0;
+				else
+					info->mem_map_handle = 0;
+			}
 
 			wake_up(&apm->wait);
 			break;
-- 
2.43.0

