Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B6130FC13
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 13:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764422299; cv=none; b=YQ4wveTwNDLFcOb0RdLrMSd67cby4sDDemPjtucMisaBYdBaSR7D1LVdo+6Yo890EmJ5eB/6bfTut/JhJ5leZWMe7mIW3TDS203xA7IDcHvkUPHV6wRUbQdEx2pUkMC26+6Ic+pKi2FainiDf6hUd5BpzoL5SDGltky1msZjsoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764422299; c=relaxed/simple;
	bh=exQ/yW6W3oFPrfMP4HI+spVKk10NGLuEbCbL4D1Pc5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jcb5lM3JlqwHdQ4Q5IcSwSHc2OR9OoZ/RqfiAeyNKMotOfbCDTH9ipY94pwZB7QpoCXaipwqppDQBuvtb4No33ACxIsR5A/fLMCRiuBxfUQMMPpGqU0meRanQoW+0YjHpHr6Vh0w4mO7wMHNvkcuBrQAn4jTz+X10fDAx+6jU6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fNP+TS5t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcWl0ZUC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fNP+TS5t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcWl0ZUC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ATAlZnR2664520
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 13:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uqOWIv7cuGi+zf6ysvS9UOkW7C7nCr+feFlHqhg/kcc=; b=fNP+TS5tkR2tGdXw
	VrmGtDkE8izfleAbFKWeYAmBDPvDopa+1maDpAga1AYOdWj02JH1xCyh4jHAN6H4
	UEh+p8vCCUelOdCeR22X/3sH9/vYnZVM+ErCxH3pXHET3Nk0ccGWUwmHD1VIhPbC
	MGMkCoZdCE+qqLuOZSTOBrvajjpDNR+e6zIU2c7eJkrumAoc9CqzVqbtK1j/HD1L
	vaCwfCYI/fuQPAJiAHGrctQFCLOrveCSAgZA+8B7H1JOMb9YvhezzIRRZ+Ri/ois
	arDNtARUJ1KoMgIOhcGdGHZVSmm4mUl3ZiTkLg0dNpjQwj84FLLwBb7rmylYUTxZ
	R2c9Bw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqqsqgte1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 13:18:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b55a033a2aso151702485a.0
        for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 05:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764422290; x=1765027090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqOWIv7cuGi+zf6ysvS9UOkW7C7nCr+feFlHqhg/kcc=;
        b=NcWl0ZUCmAokNlhV9ffjNrG6XGSlc8oR5tRhu/dNQHT0LrL7DkGSs1BZYOXLj89uOM
         jqX52r7KXwNQkqjh20HR1kX91FVYSe/kjk817d16t2srmqTnrhIa6cKPBxj7sccvGqOj
         k2VO5CCS3O+UDmI/HwyH8/vGeNCivQjgQi6XShHGo0+7gBwpWYf+j8X/q9oaVP7tVnOy
         KhN+SjBOF+F6DYbJfK2JeoKQKH/7uHABfmro9fIIB/yjGN6SV3Cd2zFurNpJgBnzWZGG
         5xhq8yuVaSndttZK3leFyBAqDrDJkiGT2IbIBsMfT9KpAUXM9YS0q+z1+0pjPf7WriZQ
         s5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764422290; x=1765027090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uqOWIv7cuGi+zf6ysvS9UOkW7C7nCr+feFlHqhg/kcc=;
        b=VwMOdB+xjrFAz4wCOZALKrIqwqoCXwCWsJ34PmfIs+H81Z95mar9BAFihTfG13H96Q
         ze4IYyUm1GF4GNbq387sZjeJsKg0hW4c5GT59Mw0Q6rUfV/H9wN2L2O0jra2e5v2/3c+
         29mG8C5LWGXUY+oeBgLcrY/SNw+cVSDvE1V8GHVLrpBGjUSoMkdqPuP1VomtOU//umMw
         TOVjaRQkf/sTQisVqRNacqNF3q6gmac3PH8tLDk/ylr21yvEm7w0o2ExH3s1NCOk/16S
         8wUSaCAJgifLYp57FrVaNY/yyoUQodC4v5PBA21qjuIPHZwAy1RvJAy4rVBPBO4mbC+5
         Ah6g==
X-Gm-Message-State: AOJu0Yz6XPq4n1diE7QQdg7eeceI9mHzUaBiH5JhCQMxJvoswQrTqvz2
	QlEkGaB2/O2OGdQCdYMZWLzO5cNkHNgKmxZN3nHnMwpjQgu9aTyMMaOMuzoW5u8cGKDAcTCSdxa
	j9AizJ6EGvHLyYpYsHDrlyprMDpJcCUq5VSdt35YPeXwG/kJ+7aijYKMLFiLyh7M48g==
X-Gm-Gg: ASbGncvMhsfFlYj9LkfwXldWJgEHyzGEOOavSBxTPueq7qGG/cPkNI3h4PYrPylxv2s
	sQEOgGGAy25txd4wO2HyYcTB0f3GHsU0jRGIt9wI08TAa7+U3zqU5Ah4Sy1A3YgBnfYnO+CX1uR
	w+4ILvBltkva/tuKSAeHQ1R93esZOo92KqGql9oeUqdJCjRRX7W1Cvel7jUnQYRT6dLu2swVoUn
	XgfmLwGinlWPuhn2xSIXiUPhaNW0qU/hnUdcIZyGFVB/BqZ2KCjD6HM/uS22IToYBKZYI4PyJdp
	7WL0xUMs7IskAf/BioanDAYBPwpU218lVDZFBEmdqJlPJ/CPsKJLq5+4d+iqPxsJ+m8RlFyO2aW
	FrUFzpWJQNJYcmcjOT/l+yEKuYj7ZI+4ljQ==
X-Received: by 2002:a05:620a:2a03:b0:828:faae:b444 with SMTP id af79cd13be357-8b32ad1083bmr4884678485a.20.1764422289972;
        Sat, 29 Nov 2025 05:18:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4lkIqGig4+ZGnJmui4QrJUzGkERmpZnJO5dkx5PRWlptxsWG94htFC/N53bln4MHSvlgMOA==
X-Received: by 2002:a05:620a:2a03:b0:828:faae:b444 with SMTP id af79cd13be357-8b32ad1083bmr4884672185a.20.1764422289418;
        Sat, 29 Nov 2025 05:18:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5163903sm723233866b.7.2025.11.29.05.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 05:18:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 14:17:55 +0100
Subject: [PATCH 3/6] ASoC: qcom: q6apm: Fix confusing cleanup.h syntax
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-3-c38b06884e39@oss.qualcomm.com>
References: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
In-Reply-To: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=exQ/yW6W3oFPrfMP4HI+spVKk10NGLuEbCbL4D1Pc5I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvKIMZsFaLBHAEasSphZnnag2VVGDy+bICMru
 B1tmp5FYI2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSryiAAKCRDBN2bmhouD
 18sCEACRaKsEHFkmdS5a27kd2Q2I6Wl4PYVLFz9ZU6hmzMWHMRExBbZHVx/R+9LDqGWhW0ou/RD
 uu3rlm200VJ15DtesrM/DGnttq2WCm17gQEI0a0r5o35WLn56W5d73eatxm527w0iEWLZTrklGg
 qSZ0frlRI2Ljhh1cg5GpR0hCAqLXS1hEBvSRYRrNWn4kU/NZUKpozqz3Is8r3XZNBJR0f9lqlIF
 o6QdmtTU9RQj7h7N9j0K+zG0kSym3GtGAh7DKu5dU5jWxWrLPkdtYf67c0S3xo/qyijy1ixqC19
 k/wv/lwBK3jL3NB8pAZjbEqdzwlwlM+2e62CLTOu3NULHpGyguAs9aPAoqhmKEDb7w2Vm7kvaVn
 tm9W4M86Bj9bgnxueGAaM+1goahU1G/7CoiM2PD/iSHcSZdwBkb7sojsjfIJduU+T7igm5KKZiQ
 iJBvJuNNOABQDOiyF1vWUx22fjmcabe+lBz5FrSDdwoU5+RVohBCpBNWu48mzxJg6Ft31iildGE
 YaXhK/yqDcZQ6Sp9evxPjdY/i3uAt0J1Zrs1YvZSU0tg62w44yffpuIgybTeppEyLS/MPMRG4C5
 35QjvGExapOOFxJo+m9mZ6g3ohrybypJny0pxvRTXesdK/y4IKVW+HcPMvi1dnAo8FXiuGCtko0
 fvbThPM4e61rP5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UqVu9uwB c=1 sm=1 tr=0 ts=692af292 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ioz4TsFobKP2bM_RzkUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: DeC6p8vM5Ge7pXVBfm6UY_boH9Fz2Hl-
X-Proofpoint-GUID: DeC6p8vM5Ge7pXVBfm6UY_boH9Fz2Hl-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDEwNiBTYWx0ZWRfXxZOtQfaR+JLk
 JtORPx6zgLWwf1jlD2c7mX+tbYMJIa6gVcHK41Fv4DxVIILhEdcD1AGZTViS/ZOtH6NLD4IkKzp
 no3FKTKN6gcYe0q6J0VGYyKgoCBGy5/rdQ3jnRi39z8HtBQxgZGqCoy5z/Gjyw/zMnVc3snwI7G
 ZY+wiHzfG+HThOE+YOdr113LBcST/UfXu+QxGvVqyV/J9yg5rJcJ7Y6vPz0uaAc8+5PVZsDWxWH
 r/9aaw6/LterZPIVA7KPPxS8fGuhXXBzvNkueue/gTBcnIqYkBfB+7GM0Li9uwsW2IQ1R62dvUG
 8GOayI7E6qBzbQOnLCqHSkNBoCVNgZfSEROShNd9WGnMB/Un/bvz7ONThBiuIqJSntd0HHVQ2m8
 zwgR+NhqzzFEkZfqR5YcS3EMb3is3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511290106

Commit 89cf2223ee7b ("ASoc: qcom: q6apm: Use automatic cleanup of
kfree()") did not make the code simpler but more complicated.  Already
simple code of allocation and free, without any error paths, got now
declaration with one constructor followed by another allocation, which
is in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 94cc6376a367..4e5ad04ece50 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -259,7 +259,6 @@ int q6apm_unmap_memory_regions(struct q6apm_graph *graph, unsigned int dir)
 {
 	struct apm_cmd_shared_mem_unmap_regions *cmd;
 	struct audioreach_graph_data *data;
-	struct gpr_pkt *pkt __free(kfree) = NULL;
 	int rc;
 
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
@@ -270,8 +269,9 @@ int q6apm_unmap_memory_regions(struct q6apm_graph *graph, unsigned int dir)
 	if (!data->mem_map_handle)
 		return 0;
 
-	pkt = audioreach_alloc_apm_pkt(sizeof(*cmd), APM_CMD_SHARED_MEM_UNMAP_REGIONS, dir,
-				     graph->port->id);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_pkt(sizeof(*cmd), APM_CMD_SHARED_MEM_UNMAP_REGIONS,
+					 dir, graph->port->id);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 

-- 
2.48.1

