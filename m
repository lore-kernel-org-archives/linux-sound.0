Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0AC4DEC24
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 14:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159944; cv=none; b=Q7HKb8m9JuedBU0BfmcPz0u8YGqABUbtHj7qi357M4GPcN6MGdtpzqbRheKlbic8BHaomYYmOwYK6tZ2pw0+tFrNbmkAhijODwfv1kgZuflv0WYofz9Cv4yXRgvDUyljM1Zk9NVL52uLqIL6kzRNSjD4UTlMMNTGqNqkkkRqzo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159944; c=relaxed/simple;
	bh=pAP5FVZwFnM3EjU9mKSll1tEBjEYoJ0+jPm8EdKke5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0la14F7rDaRwEKdBNTyi319cTLLj+f43obPakOqxf/92Xcl1oKnugHdl6W2Vrm8AvlU3l/pNVE6Fm98eC8zrJ7zyxN/nx9lieJ7pUIJSKK0jDWdnPhaiOh+iU1e8KQkOp33UY3tKWEig1oVSws8in5nYUIfq4jmU3JUAj4L0sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpkAfoOI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e1guCVLe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpkAfoOI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e1guCVLe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE6QcD2494912
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 14:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=imUbnlv596X
	lyAxqeH0fVXsj8dbOlTAi5i39vOkJEdA=; b=JpkAfoOIqpcWnALU9UgvS7DQKzf
	Iak84YZ3x5x0DatsnxYTgOLQHLLp7XbPBOqygELybWOzYiF6BA0IaCrnWyBYymlh
	gugz/BtjtYkgYPz6NYRy/s/1pjURxtqlUMo2+ExJHos7EIvIsTvZ2K2ueGmYEOxy
	ySieonLKoCNvvxqRADkGP6eHVvSUrUgRPaFQIBGSyum9dPogaP6sCdInFoTt4kS/
	wWeKF4/YGbeP00vbnX9WObWq0PgtDmL8BLGSGw5/In0KCbzQnprurrLDNncIIcxn
	fW5hf9PySehygsx8RaBg2BmjEy4gBKMNPPtFTnCieFprT5gCuEkCR63ZxXA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8aysr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 14:12:18 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1665200f4c2so8752061c88.0
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 07:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159937; x=1792764737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=imUbnlv596XlyAxqeH0fVXsj8dbOlTAi5i39vOkJEdA=;
        b=e1guCVLe3NaGfDESbOKvRYlFnA5/xcDH+x9Ytir3RjzbfwLW0UrOoygagpPkYuzUC2
         hfCYoCDPDH6mgblaqyuP5viuSct5+6eG30+c8PXSGOiRkmzqoQa1KlaAvckGKQPXVOop
         A5P96LXIuqu2iJyqV9Y5o41FtlaFLFihajP76amKOd1i9yFeMeCGqCtA2o+1KLjCQ/DX
         t2gcxvKGoHQr+a56npYFfoJVGwfopf+ZG9rsBp0bskuO6c43viA6DKjjzfTaSFUpyw96
         u8Kda5M0Nox3uj+G9Xi1HqJPALGo7ZXO65KPbCDjDEJCEtrk9bm6/4FcafokhjJQEMOO
         J5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159937; x=1792764737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=imUbnlv596XlyAxqeH0fVXsj8dbOlTAi5i39vOkJEdA=;
        b=A3v25pckhfr4DfskHgHVi7DohhAEV+IeRznOrWAssOeroAIOsRdVHTQXxaKY0jniM8
         SBnQVAQCPhPvUtPGbjvbNNZi7Vx/tgr4ktEY3appsIGbK4G3xrVrR2T8gd5WdUNTFs8U
         t2nlqQlGnh/rCgoSH6YwMfE3C+UUWpCw29kZQDPNAbXAD2msNEkK0K4R/C3ExU93CZIQ
         vhLA5SFUKqZrAn5/SqBy/b9f9pe+k6VCRCLKJZFbq3WKkTmxOLpIib8rIqZc/aGXbMR2
         nmzQeP9XJmku+fX+IpHCYDZbUXG3I110Nx1V6FXGYUKLQIROqz5atLBIFoXW2HqEH/8f
         2l+A==
X-Forwarded-Encrypted: i=1; AKwUvBzNIm2sgGpwPDL7vvhhjLmqiHTvt1Ta27pyh4+TDYlNuh9iGP8tGNU2ukfQ0L97RhSoyZtAAKB/FqHQKQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL622X4HBXn0t5AY8HcdFzJC4m5cqsCQk51k+d6+sKv8fXT+Zur
	onKQsLNW4bUMIs9XJhpvgpNqZGSNM38qLvaNomHWuZdVWczMq52W7QIPq4wki0BqPXV7wwMfsob
	J9/IyaFr9QMqD9xKnuH98xr7U7soR/v2n8ndiVOUL/A7vU2Vaiev4w2gLXCNYnQOOPQ==
X-Gm-Gg: AYBFou2+mfllHE4NO9AR1tbhzUCCZOISZg8Fz7ZZDymGx2tbneioa+KDZZgjqfo4Qh1
	gMBMpOSaJqBRwS5t33Q8slMdku2lnEYrJWYmlMl9pUAQ1RQZ0JH3z4X0q1jYDATaVAK29avQH6Q
	JSjuqD4ceLBTc85qYcMirn7uf/9NjeMEKb/pR5t1f+SzS0NvdcGkZ2Bn8PDXJQCNi988DENFqhI
	8qVUtLpKg5ANxYv267nKBJE4hQKPY2rdGzdzFH5+s21SbYmiruDfoJTdmYCHj2MCay1uQBO+2XL
	k/17bsQyHo6Sh5jhfyJYhzfrBSztxyHikG75i0bKv2VGGwlzVZFQrtUZ8+y8QkjILEmUYIfK7Hz
	H2vYwKGqwhyUQ15W+Ya4xsIgcHircR7CAdx5x+2aaJasvTMLrCOqWDVv6IRo=
X-Received: by 2002:a05:701b:42d1:20b0:15e:9126:c60f with SMTP id a92af1059eb24-18512e25085mr78890c88.29.1792159935559;
        Fri, 16 Oct 2026 07:12:15 -0700 (PDT)
X-Received: by 2002:a05:701b:42d1:20b0:15e:9126:c60f with SMTP id a92af1059eb24-18512e25085mr78849c88.29.1792159934931;
        Fri, 16 Oct 2026 07:12:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm6997682c88.1.2026.10.16.07.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:12:14 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
Date: Fri, 16 Oct 2026 22:11:52 +0800
Message-ID: <20261016141153.1346219-3-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfXyNnnZ6YZM61S
 TRAF2z6g88OS2XHcC9nB4LBWafAqHhYmStRu3wvXK61M9jGzjh2Ei7u4fZ7Mif2NPMjYxTYrBCJ
 uC+SOmRSCG+zT154UMhV6v3+gVP7oiY=
X-Proofpoint-ORIG-GUID: 8BeijUwANTL9lpVnvaYclyBKXjonluDS
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad230c2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=RRt428QXv51Blb0ChN0A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX9d7BTcVocenj
 h4zkWivmH4bA1LN1dtmf5uD32Q5aR5G3NhUiSsCc0duCE6v2EJneIo6jjBPtJ7k0UuKqQb9qobU
 jmMaOf+qoYN4iiK7O4MiH6JDOstyOXUsIIcgHBEwXO627AEc9lqvvl8FzNzUj9UOgdbKUVjpeJR
 8aSw+/JPgsf0D1LjA7MbWI1MBXfGDnJZ3Qix1jUC2mvQ3k1TJ0mQjeNR8IXF9ub0a23r+NHz3A9
 i/fjVAhciyg04+g/5G3Z/N3O0Ov0lJAlwSkljqEzGNA1SxRoOTYcf73GFZ1BobJrhrhT0a/tBBZ
 rJnrugW/eVqpb7hMpyAge9oET+9eG4A8GUbZ4bLQvf4tbENHsQ//FQTExhobeFdphkHd7F2kPzn
 YTH/CVurSfnMTCnrUlZ/tyGc3QnFU1bpvO9valR1xnOltm+0hbQY9eUKORGN05AKqwp8Hw83DFd
 c5O5S/CSNFCuewAKrNg==
X-Proofpoint-GUID: 8BeijUwANTL9lpVnvaYclyBKXjonluDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

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
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 702df80d2fb8..72ccaea1feb3 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -328,8 +328,9 @@ static int __q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int gr
 	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct audioreach_graph_info *info;
 	uint32_t mem_map_handle;
+	uint32_t pos_mask = is_pos_buf ? APM_MMAP_TOKEN_MAP_TYPE_POS_BUF : 0;
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(sizeof(*cmd),
-						APM_CMD_SHARED_MEM_UNMAP_REGIONS, graph_id);
+					APM_CMD_SHARED_MEM_UNMAP_REGIONS, (graph_id | pos_mask));
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -965,9 +966,16 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
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

