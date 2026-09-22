Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AAC4C10C7
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070212; cv=none; b=UcQTFKQ7V1opyVB169J3FIiAvLCAPxQMsWzGHa3qYd+yxmiOuCsiTQ25CrxBXaPgUg5xCu7/R1wvx6l7ztJdaITyi09tACcHHXFOjBZ0E1QMKT6BYVLGsqmKk7IWKeCSbt7d7Blz2HK6N8BNSYqaJY5AVYr2rhKSZvGwuMKZva8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070212; c=relaxed/simple;
	bh=Dw7u3gycMBUuusWdFunc7MB0te8LR8j9fzuF/6sKLO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pf0khTno5dQcJ2hKT5t10qp8u5RJMNQ8nCy1nyhi8y+JhkI6Fjwhi76gEuV5dn+w8UGqn4PRN50F1nfFWdp4u4fCHz9YZhv4eesMJEaA0h1J4fW+S11TdjNd/V1/wiWZLPo1bvIldnq13m0dJCA1kiRT7ysAAdzQ86EXanT3nZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaipGbOC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZkqiUp9v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaipGbOC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZkqiUp9v"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6qxep2165608
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WCX5BCf48amXglknlAvtG2fxTSb4kKRHLRbJKsFlN48=; b=WaipGbOCENlfYCV9
	xpwbpwgrlibILapO9nVe+ZPQ3pr78UKZeDlzwQGn5TRK3qt6RG+nAwVojxo7S8Gi
	lf8zwh5baxT8zIs/vN4OEikPPJZgKC/9m93Q/Tfl7D7BI6vV+XMGKVnfPIMnsK2l
	I6UJLfJ5mVXPkJQxCXRxj2Y/t8jmBEHaz90WIW05N92UR9a2en2Mu1Py4McLafdy
	SnZ7LYz7U+noxrvfBqdOYacXyDeDbfBOp90g4l8QuwpreIVTRBROx/OTVv8aUhbX
	ZmW5cBJ3f4jmx6/Xb26LRdu12fhqCuuEbve6uVjDQeeQaRSgepuibktUKO8mJ6MK
	QttNPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xeub4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso3675647a91.1
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 02:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070209; x=1790675009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCX5BCf48amXglknlAvtG2fxTSb4kKRHLRbJKsFlN48=;
        b=ZkqiUp9vXEECkobusViDxGvskUemifu2y1uP25NA3gvQJwikZXzCyWctib6cnVdYFw
         mTYAgkpojXR+eTPTuoCM/LGZa/nHynHaidH0pMIONxtCWVEZb3yPdy/B+BGB/9746LmS
         JamcBfgOLj6PRWMtVKS3XKTa6OOLJKctBh6i/MMKXFMmuJecGjG+tOECMa2ycGdMopIw
         LZ+aXeEQpTnWzgTissoXiYv55cUVNwHR6rf3UfZuYK3FevsBufeLolzFkQr4iYSgTG50
         kyIusAi5XSukZ4JNhx1WmGBrvur+5Eq7HamZnF4boaOx2NvBUHOlXeOsb8zWVgJ3h1yi
         maDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070209; x=1790675009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCX5BCf48amXglknlAvtG2fxTSb4kKRHLRbJKsFlN48=;
        b=HNDgeqdn+tiu9gJj6DY1mYTpPt0wAv9RfU7A6ox1HyQwFldTb1mzCSMji/K9zw4gWR
         5bnIWXNP+t/WXDeMf+gUFE3ANDyhZaeEwcGjdfy3mx4RvdH39GtpD6aP6/IqbQ3egIHS
         tNLFkgPo1mEaqpWLyu4knu24Q00WAKhSXI0L3WpoOiOelkybVI/4HYF/njBAviv/1uat
         JdMsvpIYIWPSf7ZErr60v7ruNaFqvg+esCjmIrY+EP94d48Y+v8j/hUg1mCQzJfk3qeI
         1nlv/OgHeUvrnt6FUo+l1hOrjX4uHRFtnKxs/iVBes7QIqICD4Daglo6+k1dj3vMGV4J
         q8jQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbh7VoUNZ1/AXYvmvvGrsq4g7oz4ezEjaYPLWpbmQWYInt2scWz1z8x9kYGdTydNhB8Jgnh25CVP0GKw==@vger.kernel.org
X-Gm-Message-State: AFuF++nB8tic1b2qpSTQgWNNALgI4a/2yDGjO0ODrycmuim4LU8zaJC8
	KMUbzn8jENC1xIhL92scZTWpwwDZmn8MGaacAq3mEXFDz5YcS8MHIbkJzqh7NSJoImTrHe/sFgo
	A6GfpdC8ugVgKZ5Lqeh+ELYZ4T37Vt+ZJZzL29Cq1eQCfweNTDUHC1fm5WmXFuTnYgg==
X-Gm-Gg: AYBFou3ARH6O4mUjoaeUhB5o6nJK6dWa7EGy+fBsAs0+6INraxKqDxJRON9eFUIy7uT
	bMzILN/oCkuc4/ithXhHkJi1BRIHLvpX1vQRGabow6k8H586pVq3HlK+KfkIgWnPfoez/iJPLW0
	2ARLCgWcyutUbhW5mioSY7DNMrlLC++XRnpZlhSe8GvPRwMUlUhXwc3iw/2r2lychvw4SjnJndY
	4oj93/rLI8GCyjeEhe2rqHDAy7335bo60tbEbmLvmZcO8lAI56i3kyryAwjUlUXzIw4sWzHMrs1
	sySwNsrF2wUFW0FH6Jx7t89rNnu7U5Vy5pTaqhGQYn7FN8rrIWSiRl3HZvMJQg2vXjvxtZ259wX
	tlqhPLHjfYpk0I8464lS0SXD9XTxm3hyhL0c=
X-Received: by 2002:a17:90b:4ad0:b0:3a0:4146:293d with SMTP id 98e67ed59e1d1-3a0732851bbmr622488a91.62.1790070208724;
        Tue, 22 Sep 2026 02:43:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4ad0:b0:3a0:4146:293d with SMTP id 98e67ed59e1d1-3a0732851bbmr622422a91.62.1790070207397;
        Tue, 22 Sep 2026 02:43:27 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3776183c88.13.2026.09.22.02.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:43:27 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 15:12:31 +0530
Subject: [PATCH v4 2/8] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-add_shikra_support-v1-2-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790070192; l=975;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=Dw7u3gycMBUuusWdFunc7MB0te8LR8j9fzuF/6sKLO4=;
 b=ucyvmbAnZBU9xU+YER0LlTRJswgvXYL7O1Oq+wB/Zf3Wv00b811Qus7uuBjCzvcPXCY/iUMuy
 CAKL4KQM0NoAktpbpA+LO7mL04ruSk/vtYIKzL/gqXfydITwGD/SDJB
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: -UvH4R3D2L9TKCteKlG0t-FqVUun1qNR
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab24dc1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QNNIS7QUJBVbuyI2g7kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: -UvH4R3D2L9TKCteKlG0t-FqVUun1qNR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfXyURpSVq3UlRJ
 Gnj1zlElRFlzYQE3e7BBan6UHXHC8Ftsq8d5R/9ROVlIGwTLw5Qup4s08uxova3pXacnqMpn3Om
 iOCwbM9q2lT/p1JjXD8y73bJi8hgpMaVMQtNX8fDylp6/MojN1/XqukA6vPhedqCDG2IltYeozA
 tNAMXwOa39v9syKap7Yi7fIEnPR3Dd15UfxbKAtNA1I7h/4ksRQtPUCW4Vndo+ahuZeVKjaoRHw
 g7BJq2rloyhvQvJMfFu1RFUlW6+c03zmAJEOO/uhrj9i6HcuQp5hITUBnQrVhcCG5Qj/eTLjq1Z
 q2Mj4+zzwYOdMtuqKaY+xERBRp6WGF5xaz0uQRmQlsrq/3qCtUwMOz4pxtgXnOXQJF1YNCWzhYu
 GcP+6bdfjpWe7cjq4vqhZ9BOWgXNMIg4uJXkgmPDnwasTsfMs5b6QBR5W2i/PcvcrvYU+co5FHY
 qoMQQ2KNq4G529iKJEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX37WE5L89BLmu
 Ss4RXG32k97zv0urZpofmTwkBizVxVQuFlgO0mt5IHHweIColETeOd150Yn0c0cZF9cNBNdBWHV
 guzzBNubELZeTySr/nkwl1d1tPjzVgI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220139

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad682019fa..573b2145e1c4 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.7";
 	case LPASS_CODEC_VERSION_2_8:
 		return "v2.8";
+	case LPASS_CODEC_VERSION_2_9:
+		return "v2.9";
 	default:
 		break;
 	}

-- 
2.34.1

