Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF77233BBBC
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870083; cv=none; b=P72qkS9CZ+M9vSpbRZw5lYgSbuHw/K/eiGdVNJNU3RSmFonTZt+zG3NdlLy53C/8QuGdRr+Po7R6gjxtrvkqY3a4ZUtnsw5a8L4Js5DjvfT1PZxmZnkucHpQrbpW6wPQpOohAy1MWqWmIimuhGnW/oPh0uGtgJKX2pFPf11kYC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870083; c=relaxed/simple;
	bh=KvhN5EIM3XXPaotrLaYPSuOdgBSYq4SNpSPqi8ZqfN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j16dKwoGeWqZAEfFbYh21R+bisinYu8/PAyyZgbgCLXxWnz8tsD2GyK2E1wktRcB29PXhM98GL+wmDahv5kcVs+eSltfnpp7G8bjDDFRx5/yeQzwvviK1eRc4gZROC6u01eHigDqmcWDPfoKlQWx9TIS9VEcev1z3OU5CDnaTFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQCq6Q+O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuWZtmid; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQCq6Q+O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuWZtmid"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NC2hhi3151787
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K4gYoo9JoJP
	OJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=; b=NQCq6Q+O2FeHjLFGEWtVf9EKOMK
	svQJaP+fIfVj46ZNjebQtx25ni115KQASMvJPdDw8D3kJDsN/cjI6Pn9KulS/AtA
	W4KQkyzPIIKSmbwBVEUTNWxA7UpjKwkf58ZoGDpfEBBREm2fqT70hnZnSDePqtB9
	DNZdeAabpwvPqa0N7i18GmiFW9meLDuI83gl104ASSayZsAD0B77cFvY2WV5dFex
	tAG04zrddMw6zE8S+SGCgzQcWwQCxs1Iaw14gqwY1GK2OLZVjGaG7CsdOqXqYdjT
	0FDhV8Qua1GtkKGXZ8yf62h902dcZPlT7A3Ya8hW5tM3EIlCmgANBnm/Q0A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj895np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb403842b6so4855777685a.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 10:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870080; x=1772474880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4gYoo9JoJPOJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=;
        b=cuWZtmidmb+0Q2Yf7vwqK9ACnWVQAYc4/60wyD1oJiGuOsAjxdwdJs5LD5SwQtk1MJ
         BacmtfQTrVfpzuGI45rnwTaRa6x8xgmWrDuFpNJK81GpglmaWxxxwahiFKTnaGQtdm32
         J22ZrTO0DuHgDorL0H7FtozsuzgSp7WC/EChnbV7hukIs6pfPP/ujHQMHJXQr90Gx1Ln
         lw1y1pufRSTk51kQc48QRgwqYxl6xViSLrZNGOES5vjSbjR9QloHtKiTxC9PpVdvdXTa
         UASblWXoqTq6GteZwyDqKT575So8MjIIgdODgNy6zO47QeDKxpbqWM5nVrJfeesTmPkJ
         h0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870080; x=1772474880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4gYoo9JoJPOJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=;
        b=BtdoFP/hW7otU2fVXDUPxOw64Hml0BQYzBjKxmMR1bz3IrrgeDrpiEL3JN3QRGpU9S
         9F7MYxC51/D4HZYvKs9gtHiXbAwPFZiMxrTpqDNdxmzRjhQZnC2yjjjmkx7+KKPOPBI0
         +nHdapAx8JgPYhv5+C6KnHNDLeK7rMImQuKGbqGw76u1gpxIhIF9fhx/wm9Rt3ETz4k6
         PoRmhHfHsKidftffbdbBESyeqzERCUCwUNbO6HIDHCQCUO2P7GRvZVlIqlSfgKAFtt7j
         XrECUpAmeDV5UcPNaOvMfG7qRuPCU2WNtlbw8FNXjYs6NSkM/Q+5CaVcD6fCOA3a7Lo1
         1cuA==
X-Forwarded-Encrypted: i=1; AJvYcCXfNXCDOf/PKPQ7z6IMavgLzPK3KI5S2g0k7XgBhF7Xeu/x0WRK1nsn77v5JulIR7OOE+JZAwjflQygig==@vger.kernel.org
X-Gm-Message-State: AOJu0YySVuHPMPR+/xQqHUSCQn1evlLE8xnbpMcKXE6hBJv34qj7RzEI
	i1Xlu+m1iR8Mt1XQ+9OcncKkye783XXaSNvUBCRGIUCDxADs0E4gw9NItcl26HGV9m6PLfZivDs
	aIIDQ9T5IfGNiidi4kCsPDEk1a8z8zGcF7uOr34HAxwx7JUGDqK0ThdobwCg3/mqQtg==
X-Gm-Gg: AZuq6aKFPnByWtvSZ1tcBr07MQ8BnRm0j1Ah8EGTwAHdtz14I7xhhoG/l+PFpmfw0Zm
	Nljsf7vEIsNw1I9YMHsn5EBmE0JLRFsIQpbG647iUE+O9XRlcp+6v3KT5NYISmlQj4nQKCJiuBD
	20A7qC7PoFzkd34WDZBV6+Acre98WDtgmtf2czavajTOZ+6ZQD1A+5fzNAlsblAd7Gtf1hRe4C6
	leMtz0f6Sfp+KU4fFIEEmQayI95BuqHm84vfiaZ7aRPW2tMVRYevUAKTLweUlfUQn6TSBgaJN3f
	q6e7//Loem+A6pHpbtPlagBgX3gKZpnimvAiQZpz8iy0Ql+KirkYqShDySpiM1isR6592ntS7Hj
	nySNjVc6qd8i2bhEy5cCdaxO5dLlrGHoPWc16afMLdzwuFggOQ0F4FWY=
X-Received: by 2002:a05:620a:f0d:b0:8ca:2a04:3ff3 with SMTP id af79cd13be357-8cb8ca03fe5mr1202489885a.30.1771870080376;
        Mon, 23 Feb 2026 10:08:00 -0800 (PST)
X-Received: by 2002:a05:620a:f0d:b0:8ca:2a04:3ff3 with SMTP id af79cd13be357-8cb8ca03fe5mr1202483585a.30.1771870079897;
        Mon, 23 Feb 2026 10:07:59 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:07:59 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v2 04/14] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Mon, 23 Feb 2026 18:07:30 +0000
Message-ID: <20260223180740.444311-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX/J5w+cvrZ6aT
 GwZFkSynxv6Bpoz+oS45W5WLCHS9QnogqJpyGVueB5MK5eGLI3YAoiq+w+c6Gr8lsUiYU/WdvoY
 jRK3K8IIg04ann1cnaRwan3kPdT7FMDvpXTam0b+XaG9kQoE0IFHZ/c2s/audZO4xMCyPrO+D8p
 AngLT17cujlSi/lCQ40KkpYVlIiRL4/FUYP4CZZMmvdQGkLfXnK91zX+kdfOkdbFLxBECRl3G67
 ssd6Fn1scU4Gb/WbagtF6ncza2J0YC5v88VA5M+5h3eJuDtbx7CCchPcI2UJdElYkfsOjQKhs9U
 4HQqOElGxsruOyPP0FHA3RAsULYfhlHhlSGeeV5stCtGyLChOEA4IO/DxcEtxUBM6om5I6pIb1L
 nv3kC/VdNGJUTIgX5MrCbpllD6H2chv1Hy9dQeIcj1m+N668vez4uHGoDEJhVOzoAYu5g9PDeIX
 E6YBnMZ/R0bBjL8KiDg==
X-Proofpoint-GUID: OuY5YE72vfYQyFuzC6iOsfRS9aqsZKzL
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699c9781 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: OuY5YE72vfYQyFuzC6iOsfRS9aqsZKzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230156

As prepare can be called mulitple times, this can result in multiple
graph opens for playback path.

This will result in a memory leaks, fix this by adding a check before
opening.

Fixes: be1fae62cf25 ("ASoC: q6apm-lpass-dai: close graph on prepare errors")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 528756f1332b..f68d4b4974f3 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -181,7 +181,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * It is recommend to load DSP with source graph first and then sink
 	 * graph, so sequence for playback and capture will be different
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
 		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
-- 
2.47.3

