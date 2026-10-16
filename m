Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7974DAFAB
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 14:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159938; cv=none; b=HEdN+Tzwmg1vAuuXXwQPwvvGeYhwdOzl0PzbC2Uq8YyoKsrDM9bXLlBiEEvLe9E+BJSxlV6TNTAMJI6j6vGNK57c0o/tl1dlZuPwirXdqWgaKmI4JsGGcChAJ1L+TOivr9Dlbo8G45V2pn9FvErq/qEOILWXHSbQz5d5psoeVjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159938; c=relaxed/simple;
	bh=DyaBOf+OwSUzR1R9eT0BmgFC8LjBn0yOH1OGqxKZC7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mon6yut3t1ZFgpniNfcaP0kn0gXuHjRNHecNThdTqm5eEVEmbImyOkwpct0drPKoMcG0WQrM4euMISRnZUmckCucY5ZOl2fIUySejnqe15wFs2qIuJ9/f66r2lS/Y5YDitjihxSjNqHB2FNQEGvhf57EKuzP7A+zuov3IVotjaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3uO4mBV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xb+u0G14; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3uO4mBV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xb+u0G14"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5iuR1910950
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 14:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n01F7caqk2A
	Q9IQPp17tJ6fpAiihtAXb5gqOLoDFVCE=; b=K3uO4mBVqcAXEcNok7dRyQccDx6
	ZaaORXxI39UBGi4/EV0xwZPrvi8kwev855N5KiJb/6ZNLdidJhN5zt1xcoM6v3eQ
	NVwd6Tdv5iVX59rg3a03Sg6PJSBweahi6uxioOE5f0NM44QwvJreAjdKFTmmJxOm
	kouP5X5x+A4R+VSjJCUfNp57CQ2w6a3jzic88iaEKVTpSq6XAYbEjnQfptjkPtrF
	DbjBNLfVYAc7lzqs+kfsxjOs1vP+olP7WVIYOyT5L44EXFTK2RwNVDF+b118LpCu
	rsHEBS6pOlkeIe2fq70SzEpMX25y+XiGJZG0+GZxZFd05mUrKcMI03HxrfA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8pd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 14:12:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1665200f4c2so8752002c88.0
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 07:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159932; x=1792764732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n01F7caqk2AQ9IQPp17tJ6fpAiihtAXb5gqOLoDFVCE=;
        b=Xb+u0G14UThvQqVeqIsOCjnrYFAHX38roc2QLRaciPezirh/b3VVcnxnZzKOsvYLGo
         XQK/p9xAmfe+ePAezG83RsrEqRUfWfdhnSdMffMY0mLobLJJkcuGOKKfq7ovO2JXgvIM
         YX0n4gLd+WlHyaFkVZeYFVH5u7yeY0FPpCNEUgbPBTUUQ3jLSnRCA+coiqf9vhPVTu3T
         yuiFRuPmR9m5R8UvftjO+Qv75TsNRa1AYraJw1/zDiHleWnMeJ0eu6pTZFaCiVZu8tZO
         RsrHyavneoCU4w4pOTCJXVgE7f4D2QEQSQlzhlcWdaOqVzMFFBkdHg5WzEHc8PweXTHK
         KaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159932; x=1792764732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n01F7caqk2AQ9IQPp17tJ6fpAiihtAXb5gqOLoDFVCE=;
        b=UtI3UwZQlW7HjcPJjwyyhcdpVma5sVtfpGNrjvtV+Z6eENetpL45NtV/8RaZa+TznT
         0M6SL4AKdaVIVk7NLkBf0/pAq3yVop8pYRA3wsCm6fLa0weAi1NL5F9wjJbLjVNEjncH
         hsYZx3Ta/Q2Zh2R1Qjk5Eb9aVzxRT8ye/l0GLUO4vjjD3K3pyJS44Cj+JMW8veQReh11
         AAu/mt65nohQOcutN9snuqoQ74t4I8sMDLFV6AhsWjaio1tPX7vxBNUhNRoo4+vQnt3I
         tvh556fPnDB5jDVghQRhja56ZvrZEgG7DbXWBG71FPqRa82j8DryaF1nOUUJ87LmJkHH
         D2EQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH3eYsm8H7YK3wjknt9XkmdtnIKM3+YuWZDwH89j5/1ErNMKx6jcSlnGuZGOlMv0FEFh/yYtMDgrscHA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK8j63mIC4ZxmTpCKyVkHzFxwybwEhp0M9O9Dn60La+bHST+F4q
	/BYaq1S/fW3RzjawWvjslXXMfYa+sIbChu2guIRppdbdN6KYXMqzQd27y56+TRdrsppCqGdn5kJ
	ylmyqruyBZjiJi3EvCLt16njIbVdu6R8b4WBrbtkEnoCzXA3VLVn8uMscEikyIkLc8Q==
X-Gm-Gg: AYBFou2HJ7+9B6KLGY0I2hV1eHPgnz/jBaSHb7PFbJE6SBqJDOBrnfCh07kedwDdOvh
	ZPkAnHGYhVkkYlhBsbx64jQ467SZSoCS6iMVYnoTQf5gvK6Gi7vvSNNusam6G8RRQtrbw+pt7j3
	JyVVuyw0gPgskU2B0h2346x3LmyklsjuzmWkhA8h5OW9LVkxezw7LJ2XYlNJ/BvZWACyQn3axFn
	ocTx2liP3g98nKhVf3N/6ZS9oHaja0HLsOUabzdunbRSUcBKc/SwjIY12wQWb4Bb5qvRgAR/3px
	alsXblyfHiRxlxy3R+oVUJ1ehJDLeE90K7okHwTYg1Ivv4NMJPDoh36GFg8yRgGTLp+QErVrcTQ
	APzMYenUdRXu/ab9pXDZsRQNTJFLuS0iu0Fbz/rbYqTdNVkZmnkM5Tzh8xfI=
X-Received: by 2002:a05:7022:5f13:b0:159:2c6d:fcc3 with SMTP id a92af1059eb24-18512e254abmr49008c88.33.1792159931852;
        Fri, 16 Oct 2026 07:12:11 -0700 (PDT)
X-Received: by 2002:a05:7022:5f13:b0:159:2c6d:fcc3 with SMTP id a92af1059eb24-18512e254abmr48985c88.33.1792159931220;
        Fri, 16 Oct 2026 07:12:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm6997682c88.1.2026.10.16.07.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:12:10 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] ASoC: qcom: q6apm: Fix unmap regions response handling
Date: Fri, 16 Oct 2026 22:11:51 +0800
Message-ID: <20261016141153.1346219-2-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: F6A8j0F7iz3bhEwRLSnmCnjL_HtnMQBe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX/puSfPQAxpND
 JuZSxJ1b3S6AuCzH+rX+Bda4zIGhM251UG6sjJRtQ9wUHT6WQHweUl7TRXLRNk6uGC/gQqpXfbs
 9O+hpC7DGBjl3mNScQmk8/WDe3xpPn0=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad230bc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=UQ7_avvXQmqc8gSTc3kA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: F6A8j0F7iz3bhEwRLSnmCnjL_HtnMQBe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX701Lyu7sxzZS
 o9RogiAMiJYB3OOYwU1/lcU6hkOkf2MZwewYJBSUaJaOGRceQkv9YlKK3/YQ1p2vNZdNeAIYVoW
 j2XoEWRDyDXhbP4Kef1oTLOcxS3tY3xfN6faAdla8ePcW5YeXmY0Ox69fQ5rG3DF9YlreOCkaPk
 XYXTLHlUiB4yvQSXL5THGASMvqIu7bW+9z0C0vUZA5cOasWlyWHrOHv8owzYvk7neGfVM17/BPM
 LV4NPoDq9nWV5fZLMdsL7uANTR9oo3zV+o1E1Cdgbx7B4QKrjIFdN/7wsTVkqEpJyBNNejgV6lX
 hcqzmdtFTxFrLg8/E2S4REDgMDg5yQKoeQmSSbMnhMfThX1MNdaeTu2fm2LKtoHHZAyqlUYVYRP
 xeuPbPqaavmzzO3NDoClltkXRQBZo+AgRuPQxVne/sZ6Y8//B/qpy4VGNRwWHhgEg5SJC8kAZaQ
 2YoO1ELbSIx7bFwRjtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160056

The DSP acknowledges APM_CMD_SHARED_MEM_UNMAP_REGIONS with a
GPR_BASIC_RSP_RESULT packet whose payload carries the acknowledged
opcode and the status. apm_callback() stores hdr->opcode, i.e.
GPR_BASIC_RSP_RESULT itself, as the result opcode, so
audioreach_send_cmd_sync(), which waits for 0x0100100d, never sees a
match and gives up after five seconds even though the DSP has already
processed the command:

  qcom-apm gprsvc:service:2:1: CMD timeout for [100100d] opcode

Each mapped graph costs a five second stall on unmap, and the forced
status of 0 also hides real DSP failures from the caller.

Record the opcode and status from the response payload, like the other
basic-result commands do, and only drop the cached mapping handle when
the DSP reports success.

Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index ea6680925f21..702df80d2fb8 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -959,17 +959,16 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 			wake_up(&apm->wait);
 			break;
 		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
-			apm->result.opcode = hdr->opcode;
-			apm->result.status = 0;
-			rsp = data->payload;
-
-			info = idr_find(&apm->graph_info_idr, hdr->token);
-			if (info)
-				info->mem_map_handle = 0;
-			else
+			apm->result.opcode = result->opcode;
+			apm->result.status = result->status;
+			if (result->status)
 				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
 					result->opcode);
 
+			info = idr_find(&apm->graph_info_idr, hdr->token);
+			if (info && !result->status)
+				info->mem_map_handle = 0;
+
 			wake_up(&apm->wait);
 			break;
 		default:
-- 
2.43.0

