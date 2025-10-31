Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719D4346FAB
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911308; cv=none; b=UFKIhO6LL7O0tiY3p/7xH74gmuwUSRp1LbUrYaEeB0PNk4JHmPkSJaAYNXnQoH3ELw/r6SkJp/F6dfaD00BSX04frYk3BOYZO4epmxQ0o6QH7kwo5nyRr0Dirr11yxLvE5uDcCdldwM3YOLqlgRQ02Wi1g1PKeUykwBl5QwU5tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911308; c=relaxed/simple;
	bh=IjhQRZlTTXmUt5sgJp27pvl7YrbqCsNF6Y9gX3XiQ7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ufMtAuSLoFqKrazI1RdaWRG5x09hZKt0rPmMXVbvVlcO+obBgliDJN9XWHE+fyuhxyzxoX9xSc98oaHYGlRljBOYoKp3sHMFQHJfSCMD9UJrf0Z2nO3+Q7DZM0hwM5XmO5RrDNhUJRp5qF9czSDgNaEUP2d6sctD7tEMbZeJb5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hlp8vBse; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayuBRYAi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hlp8vBse";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayuBRYAi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8Ftwc832760
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qgwrHL4mIWD
	XlhnJhcTW8PlWmQLURwHl1NklGm/TfcM=; b=Hlp8vBseqWneaa3Km3YHyMxDWMo
	whU9ic2x/1hC24GHsLsmsUbosJj3nd9VXL+g5NDsl7hznzKjYpo5CwaF/MVSPudy
	GUn+bw5/S76LMKbgi0IWRW8gcCGNc1YZ7nu0zoG6BvmtaF9xpQegsZ0fh4zrIzCd
	zYmMxr4wqQMaJFf/UqgCpIKSEE1qVIBakmPoKCJkanZ0dROvqVpR9jBr7bw99c7m
	WmMndsI54i2eLfRdlVXM2wppes+Xd5NgAFFLUtsndkgyI392aNlfmpY56gPWrq4T
	8wcwpb6q9xkwOxM4YzLFXau/ffY5zUzD2Y2RSk9UYSz8VkXSNvSvUu7Z7Nw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ffb2319-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:48:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ecf9548410so62736621cf.1
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 04:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761911305; x=1762516105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgwrHL4mIWDXlhnJhcTW8PlWmQLURwHl1NklGm/TfcM=;
        b=ayuBRYAiSxg7cGxCeK8xF6WFtD/AaF2Zw3NZNI2RRp/1O9/3Htk5ch3zQ3gz9055u4
         B+qXfxrMzxvAZ8bTxd/ghPmBFMxrHQmrDonkwDlH5dB9hZFf0I3xyHj29FEzpbAQI/L1
         FqdU5jTXjqPdU48nyh+GNjXhNte/a0SIoVT3iQi2BdXDh/bRlEvdxvUnqnWyH43HIUH8
         icmXRMoDOSXq5iCsj0Wa6tJifezctdKuil+hLyQ+Y2ShM6GGOGM6Xn1g1hzdb7ZtUQpM
         tYlVB53kacYanUaJd7OpX60oHm8VK07s+WtJfBZRuKytzzvCY+mR3JUVwRCAuqwVbsZq
         xOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911305; x=1762516105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgwrHL4mIWDXlhnJhcTW8PlWmQLURwHl1NklGm/TfcM=;
        b=jLcUByf8ZdaMru+5iapTH7J9hY91n7Xg38Fjevpu+UzpIj0rUoGtoEAF7mO4w1tIoW
         CIRF8HY8K4JtLW7/zjT1jp6kByA3wCgos1my5pbRKNY8C7opXKRRGWtuWaGAk8LHkovq
         lO1z1Ok4T7ein7eOZNMNNb1lR48ccd+hSy/AQj9oNG2YVvkyLfq904GksKUv6A22D2ap
         R5qIDgx9N3TykFWkeid4/PS7Hm2R6fE5yaQA53kFMPduvzFFSSM5TrCBwG8IQuhcWHLl
         YPsEwVt3Hduu4BkaxvvxPAtrX/X94QZ0gIS+pXIxVJQjUJvc5PqFStdmf3/WjCwWkEqi
         eMEA==
X-Forwarded-Encrypted: i=1; AJvYcCXCx1/L0bZu6ezF4vdm42NVC+ZqzujgZWaHRNSTy+9uwvnL+1pHV4fuIaRlFE4A0My4YZWmhoktBXS7xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YykfzuQi0/IRMQC7vp+8xqjdMiBwRXP8hhpIH7VsxYILSzweBvu
	A+pUvStDCFMbHXVCO8W+7BRHastqxA9TM2jk3Vft1WWE0kg135v+SHg9L3DVHIN0PTSfYjxzR8c
	oUrXMediqxCxownbZSCb26Ikp5s7okgOSVZ7+4SPWa71VUF5YXtQxt8xIsiMgKEsgzQ==
X-Gm-Gg: ASbGncucs6j1SPXB7pu4og4UFNsaUv1avvavf8zGVckillsq1bKhVD1WrMg1HBfCTFQ
	xZZWu7joqrPVx+hLvUaDEWXUyeL+ngWHHTEYMXLUhFzMwUXTLdGhpuuGJwSXZBZF1ZDCDQrwiUQ
	NsdhJKWUyzzZg0o+DsZtuz/zsxyb/D5wWE4axpX3E7gnJR8GNyf5dAF/KlWyWYbW8um1Odu/oRa
	KN/tbiuaAQe7WnKqxpqIdHoKEZu5jt0Y3DkjSrCmP+1byWwGA4UXMZUJRf3ZwE2mAyKE/dxdmnK
	jwp9EPLYAk+p06G6FIa993wHhxBk9ZCw3pJdCk02eBUKPfYsbmZk3HTxYpov9R5YaSR9J/xgTJ2
	W3uMoL8q2N0QR
X-Received: by 2002:a05:622a:5817:b0:4eb:a33e:6e32 with SMTP id d75a77b69052e-4ed30d56c17mr37055091cf.14.1761911304757;
        Fri, 31 Oct 2025 04:48:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6Uqx/qmZA1dGwjlYoTU2mJZKz2ZexJxlDQY0bz74P1DlKsZ4lpSFPWVkUeabKZk6Rn7XNfw==
X-Received: by 2002:a05:622a:5817:b0:4eb:a33e:6e32 with SMTP id d75a77b69052e-4ed30d56c17mr37054601cf.14.1761911304312;
        Fri, 31 Oct 2025 04:48:24 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47728aa915asm86831165e9.16.2025.10.31.04.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:48:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v2 1/6] ASoC: codecs: lpass-tx-macro: fix SM6115 support
Date: Fri, 31 Oct 2025 11:47:47 +0000
Message-ID: <20251031114752.572270-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XS75CkMXePla73uCeP0WvUJerZ5qBhd4
X-Authority-Analysis: v=2.4 cv=fpjRpV4f c=1 sm=1 tr=0 ts=6904a209 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wdEHzOyfiJQDvapTZ2sA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: XS75CkMXePla73uCeP0WvUJerZ5qBhd4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwNiBTYWx0ZWRfX2l9uJnY6Dma+
 N3yNL4aL7XFKAOY3oLlmxcf1BPrpozmyzI27jVgtIfQIfAxPgp3+VhRHaARkI3iQOGiwGY829nR
 gd+qalkzv2ir/cdoGusHSAf78NpUUTv9N/4wqIrnQfJCQ3Hf80jsDUpjyfCR1yRsDPOkVhB04SC
 NtPG8g2SvVMJeBoPuvc3QuY75ay40NSCanu/HGZrCuTGCVIX3i8K5HVkKkB3xS9GEozAyvW/xY7
 a6LojqDXGaepvc+ZOAkA5LH7avzR66o9pO9qZnhNjTaNDT56X7T+IkYQNGwcR5fx3eU4TtNHKT8
 Cfvq90rOPmdDxmvIT31mhzyJEWoBr5amSoD0aakGf0dJ3pHxfj6qsDVRJRe/rBEd0v9mOxmiYu1
 S39+QHaYC9DXtLsnZRn75gwKraqX6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310106

SM6115 does have soundwire controller in tx. For some reason
we ended up with this incorrect patch.

Fix this by adding the flag to reflect this in SoC data.

Fixes: 510c46884299 ("ASoC: codecs: lpass-tx-macro: Add SM6115 support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 1aefd3bde818..ac87c8874588 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2474,6 +2474,7 @@ static const struct tx_macro_data lpass_ver_9_2 = {
 
 static const struct tx_macro_data lpass_ver_10_sm6115 = {
 	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+				  LPASS_MACRO_FLAG_RESET_SWR,
 	.ver			= LPASS_VER_10_0_0,
 	.extra_widgets		= tx_macro_dapm_widgets_v9_2,
 	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9_2),
-- 
2.51.0

