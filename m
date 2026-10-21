Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555869;
	b=cnZIU+AJycQoIBPiZ0QgwU9bYS5HZtNdlIf2vXEuQqlC4wwstF3Sib84nWy1372nDAc2
	 lVVlbt99r0FaV7+wxU59U6uiWrDU1nPzpYGVwcox+Gkhh9siNuTMqI/CtPfCyNcMY5g+W
	 hiNBSkS73RyWUKMjhkcJd6UEP5rtI1hZAKFF1KXHRav8Bulvx0tIVd05vPoLOB/ipmoST
	 CiFfYmpgKfvv/pvm28sgQoT8qIcqXaAao1v14oRd5cacFY8D5L1rJowPX99pPlGvHrIpv
	 dxjB1z7yQEab1LwAj3CiwWvatH7O1dFowZQmhZy6s1fkflXP90rBUZGGuDhhSyseNXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zhuJnKWcj8cUHo/PEz1Va/bf1tnOQvpmNsWA1F5i0cs=;
	b=brpdggBCgNOfjkbFDSwHX0FLB7Pyx1QOvE42BXrwwoDEMO0lV2WpJnik9yDIqLFMUKBa
	 d3LxWFzG+TEBYv1kskg1cNn6UEXs+9Jdpu+EiR02jFzXGjpoQv1NOx4PgzUZ3oqriIVrB
	 NaIodm6xbEqjTC33SAmobWL4jjysnTu0CX1RBRSoiiEq2i9L7ewsepxmXWnNP4bli7CW/
	 KgT48MBnFXZGvqRX3AX2md++PWxj5KcEZjI5wqGzP38UyBOkPCGQskpcZMfWUONH9R0KT
	 F/6XbrgjFTug0VKyhDVnGD+V8w/gRQIyrhlYhhcjaaOjZYT1DeEu8pctfA/VCqbm0pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gk90BPHI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5ESlgtM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75083606A31E
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 04:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75083606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gk90BPHI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5ESlgtM
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FU7W1957047
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 04:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zhuJnKWcj8c
	UHo/PEz1Va/bf1tnOQvpmNsWA1F5i0cs=; b=gk90BPHIPojeGzVUtpXoQJ8fPSK
	uW171tR3eTqIBZrHbpUVJvjnKbpOQbRkKzancOWX7RE/QrR7Cyc1HVbY7LqK588D
	ZyqYfW8bNIm/wKruUfmMEGDxD8gEjS7I7iba/VQ3Xqrhxej4IYnCW/7p1t1ir+z/
	LR/sbwI0m0bsnTcR0l3+GFb6TINbVPvqNfZC5iKirvrXlIDlJxDIBJ3SaL7qSs/E
	pSvUEtCOtrLsy8a3ZIidPEOSeftQxzUxeiWhXUMOpDjvhWrkXuWDjOdKKcingH3l
	CLh5PY2Sgr/CGsUzWGVUB4/6jcRXI0cPz8XSk2UVrmliOFTgGQBk+GWAnDw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hvbcmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 04:11:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso2157842eec.0
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 21:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792555867; x=1793160667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhuJnKWcj8cUHo/PEz1Va/bf1tnOQvpmNsWA1F5i0cs=;
        b=W5ESlgtMrONpjJMsVy19YU7cjhfCbXxUh9awRGePlAnKTZMTvnLuznS1MUtuL1rxm1
         wo8616lBFpekGJYQ1pfjpWl+M1s7kL1YvSl+i35EeymTgO4o63tPx7CAiMFm+kI+T9eJ
         AStYbI9IzTNWzrnW6ywV+YQ2yxXQDtqaRmn9C7tKurTAaU0Wrqggtj5OE6cxVfuJn3bn
         Wfkkj7YCpdEDVT0hw4x3Lbd9W9DZjX6HDRapqcxpsjVE0sakwekKwAxlVtgqyV0Mp2ju
         tVMcbt/gT6GLCV/V7RMc/NAFoD/I8KLWPWkVcZGKPB8+95XvVao+1YA5g3ZCDH/rTNDb
         kkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555867; x=1793160667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhuJnKWcj8cUHo/PEz1Va/bf1tnOQvpmNsWA1F5i0cs=;
        b=N5ydvpOGjM3vouY0ra9ReMmoDlrqnvNVsVnqdnCMYrvHrvPQIKLxoHrE3vHv1g6UMD
         QaY/47vuop+hS3J3rxh1M/NHjC/JE5nrV1WGAS8OIxvpkneFqQZP4FClAE3RTb0E+p9V
         zR/mBJAb/jiy/osN9FfrXDHrSQsPbuMbxUHmW7wXzxWHkC8wVs25mz5wTVP8UBCCY73K
         MtwbTubexxuAKK4icF5d2kOcJH/+xugys0ijxqiCviWWCm+Nw4I7MMOcWH8QfTHfqODN
         rMlfTHPuhbnvb83a9LKaJbU8AYEbLqG/ra5RcGUZjwlenT5+acCBcZ4eHqbLgMeu8kCR
         QhSA==
X-Forwarded-Encrypted: i=1; AKwUvBxB4xKNFxb23zBLKZFBYDDUNTYQMxH4OMKXbB05H+vkFv3tSm0ASytdnNKGSYNaOhzVdIQoXZ3E+uT7wA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJI/MNnxZp6hZdOuFLtYknpfsc3TVhVFWz3lMgvzFkmLMadpHb9
	5+zOIEhNWkPboMtclWwSMY73Ystz0oSzdjNVkJDvMw6g9FISh0xppB1HZUFC5pgUCC95qA3Jnv9
	1Sg+VjLTTwWCo2AzopWTLFc0xiQhchZPce7432MKgcgi62v9PBtF2QFn/+HzPnrGrDw==
X-Gm-Gg: AYBFou35g2c5QDzzXZ0rpkJK1tYrbriWXI8PF5wiGhKYTNkAH3UfxnrFsba+ZweOuDM
	Lv5L0N6IGNTEsgntL1gpcC095mJOW48KQy5UUxzy3wrXXAjcL9StUu/wK+fDZuErGUeiun0VB2s
	uWe826jmH7v1t1/XslKFEkP0U07xjlHtiPZeF1IjF0lAYlTGTT8WMacfQ7SgBvOWyLtCjFjFuf/
	YaF2ssBK8uDG7sbGLoDim1Q4xrbbgc83vf5FBivs2fe7NXkh1siIbN9XZZyAGNLwKqqLFFK5AGX
	z5H82lKcO7MWHxJI0hsnQu2vjsVRHo8iIwyvyzWte+mBlDI0cp8DJ9nqFeE3HorAVpxmtBf4HnA
	waauPT+24FHhiPTaL5VkLHJ7bXTjjF5/oHeOWakce7tn++quKECuJJZRmIYE=
X-Received: by 2002:a05:701b:4584:b0:16f:1e21:7006 with SMTP id a92af1059eb24-18db7b92510mr4050318c88.1.1792555866912;
        Tue, 20 Oct 2026 21:11:06 -0700 (PDT)
X-Received: by 2002:a05:701b:4584:b0:16f:1e21:7006 with SMTP id a92af1059eb24-18db7b92510mr4050292c88.1.1792555866283;
        Tue, 20 Oct 2026 21:11:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2915427c88.22.2026.10.20.21.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:11:05 -0700 (PDT)
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
Subject: [PATCH v2 1/3] ASoC: qcom: q6apm: Fix unmap regions response handling
Date: Wed, 21 Oct 2026 12:10:42 +0800
Message-ID: <20261021041044.2080369-2-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfXwI2ETCA7DT0r
 M2BGtilqwIttacuE+N5IJHuYfjocYZX5655Jl9ZL+0JRS3SY8DHYq8BuJW35t/7mbRywIfclRIJ
 urEFPip3WDnFtESMKlFL3CV7zuAwtUbwTwjBxlndsHGQmGXqYxcXu/u/W/7CbTqJ70Hz6H+Uyaj
 HefkPSH+d36aTsuOIfsULBBGp25nGWZ9eqUfvDHAezQvrD0CBDD57k5v0EIpuoI+HFAfK5Qu0YM
 Mn/LT6vIU+Pc/1CvXf9K1y71oNeVhNlb20g2PLA6B69YYFzcK6NrMZEwCXiS3ITw0399aEGrR3n
 KvWvVIv9cjUj2x9XrXQR6ntJn9HDEronvfM2T9+s4b7X1ZlYiY8+TCKPVfxz/OhpXb35e+wFqaA
 Dc5pDjazBFJKK4wXxpKFYSVZ5/EI+iXmxfWxce+4B79EmfqrpVBPWGXpLV92JlTb5qDxfS8jxmK
 BQF+YLsKqYQDfCQJVVw==
X-Proofpoint-ORIG-GUID: kFbL-LnwuUoQcfLE_uaLr5JaFAQp7Prz
X-Proofpoint-GUID: kFbL-LnwuUoQcfLE_uaLr5JaFAQp7Prz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfXyjQr4SA1N9DM
 c1X0JX9MIG7padfN653LmsOmOo7XPhgGx23HswtxhObW/ZaICl+ryi9dkFrwfl8p7ohRFJYraUX
 SZZvViqTrEPkY8OYlDuakGFFdoUhWTY=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad83b5b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RRt428QXv51Blb0ChN0A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210016

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
Cc: stable@vger.kernel.org
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index b6b1ef6833b3..fa7f5dfca418 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -960,17 +960,16 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
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

