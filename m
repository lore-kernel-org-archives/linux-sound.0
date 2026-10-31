Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435031;
	b=CfoOfajBVnjhIY2voL/Ueu3KODzhBidJTuESg1VY9T7kYHzJuq99QtEvchD3FJ+GKKNC
	 4jJ280pxIOyETASugKtG3otxTXLnOmNnZsg1qIlfXSVcraLq9QeLouaf+KWq2/xVSfmeC
	 +XGcdFuUeKwMLF2WNn6wtKxJE/JpL2uf9C5F3XVzolKkI3G3FdaiGOIZZ+S5V5Qx6YuO+
	 VMwSgnWEgXg3oMCB9LJhaVKv+Sbc5Phe0D9BL0vkGHJ0axkCYKKVd9VVSmx46A07ZtRNi
	 8bFEAyB6X/5Q03VrQGLovhPMr7DN5hA91AML4Jzeqv/y/6rY2IA6/Qr7VZGksWJrMgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QFOpLTe4a0GH6IrBUWG1rlaEM4FZttQUc4FaLGB4FuY=;
	b=cUPhGRFKjJei/8EeqTBGG44t6LY+ewnAZusPQYzl7csEzgc//mjX5Fx6YYVst9hbcAwC
	 wh1gvS2gWMK8y/wPVEKC3UBhU3nU0Qk0n8tzqIvig6howhKnIxMM6IbROtJKV1wyHRqIN
	 gFYGHJSskEhBQ4WpbI/ltushJ671UvmVBaeXYt/AiUuQKX7RO6oeg/GymyfKMo+nfIsb7
	 oGs1GS8LhZpuWvNY/P8GQ2uzcexgDbACnWildo5PinpGt/F5GkN1dbC31LBaZ995xZ7Rj
	 eSTSR40zjFrsWDh5OCDOMsST7LMGeX0NvWYJy1chWdm0w6riGLTylTuVFQ9ywyFTSlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jWVWVG+j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EAGPj+uA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B70606A31F
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 08:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B70606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jWVWVG+j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EAGPj+uA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4abO31757100
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 08:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QFOpLTe4a0GH6IrBUWG1rlaEM4FZttQUc4F
	aLGB4FuY=; b=jWVWVG+jRk7JaZ/tPBpElR7fJTsO3IJ0QcE9wXVq159UaI7Dyq9
	OIpPRJt178AqfnV10bSQ5h914cCA7cPI5Gf6QBl8M0B83dSICQjp075NBsAUAbwu
	RmR9xjU4HmQlUo4DKoBiHsSXTAQqDlEFUCIigfQkxR8xxEqF0AhSuhbWDXCPBr3G
	jk6W43+ZzBCV3Eob8kuRSuQBTAMKSK8nMqmiqtogv4j7sJYEIPRCvUVGN5xcofZA
	89QQGriQY8l8IbHwEm5Pem5qGzD8sPSt3qRCI9P7g6nGXaWNjlZpDV/K1wMbjsY3
	q7wZuP0m+VSHtyCXkb3AWqvHYr6P0wfgKGA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxgpuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 08:23:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so6146941eec.0
        for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 01:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793435028; x=1794039828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFOpLTe4a0GH6IrBUWG1rlaEM4FZttQUc4FaLGB4FuY=;
        b=EAGPj+uAtBkGlTE9VjSru5XcqELeettSeimHb9HBNsVJx6EIVBQ6RCoYAMQ3xmVRHG
         2QhpsiDi1EAQpuz533H6s/EmoOnSvXBwdIWgJBgtkvRdq5nHQAfRb6GuoX3QX0I2TEP3
         BXsW9mvF68KAlcbLLaBhqTwMeNWkJqR816PwWoXinMMeUQE0zhBVR7b1Y2dZcqnVVeMU
         Ao01DlGcHd3+s8c/vf/t6MVrL/vmMSiFkbfr+TBlPFD6yVXjLKlOnX48xfNb4UYqGg5e
         aFREgKzX0i4KQtFaq07DdRAoYpSFXKKPxAw6MwkBRkezWqsAY6EMkQvN8WFd61MGl0R8
         iPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793435028; x=1794039828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFOpLTe4a0GH6IrBUWG1rlaEM4FZttQUc4FaLGB4FuY=;
        b=w4MbZvdYWZTMg0BevPzx5+/deLVEvX8zMsvaFOuhZiUZDoSej6b5rfBR3rwNgKqEcY
         BqLeclM/UxD+adljglXoVdCMPLqOdbRi9YtIvOa27/X6cT7UuYR73iseD2OHG9szSaSI
         LSW0CInfCBiuD3cc6rtUojD4fW/rzVUiyHAcjd/w4TwYBgBaGUCnoWIzpVz9MZCufU4c
         /PrlUBMxOuG7sbQr9uRCP+EDCsd/9yp02R9vjIIg70h0t46erIoidefWY7L/tNBw9t2p
         t6/A3c7NoVtT1TdGDiCM1TtyYfz3sKXDcHfRIkr32HhdinVul/3M7ZSUniIiN9V5F+KO
         o0/w==
X-Forwarded-Encrypted: i=1; AKwUvBxpJQ6T+TOCw6Q7u1yuSgUSZ/rmpjtSobxUxujigZ7+xIq1a5WIVgLRS3eh94mYAMFmwyoetXEYTzp4jQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLOjEszXO/wNIimr8TeZJcmBeSxXBMTJrPIK1jveZyXdPINwL8O
	4Bo5WabTHykc86EI/qXLSeX/HlNxlg32EFVuLBnrY0zGEN4lb3z/ZCel5Q774CYZ0z9Q1+WiEQY
	G6UN8CH//5HXsfkeOkTx4NFRU/57LupIe4ncvFq6pyFqCP+6eFU4JxOxc17H8mP0TYQ==
X-Gm-Gg: AYBFou3EFlNYrboy8uz3i6I4Bw/qdJkV8IeNEyQzOcAf8dzxtb25vmcpi5mKhn3BycT
	dLmHE2e3d7bFXQXe88moe/uXxL+sm/s1OJyvLs4cnXuwuJimXYk+znBCDiAx7nDe583rb3dYidI
	HOfuG+xyRJreCJynG69pKP8Z16m5AfTd/VEpJNjQ/fU4Uv25E/xak2nzqGSbd0qh4gyoexDJ55r
	xQooF9ObsQir8cy7fQWck1aqAzoxQ7XAZosnUfYRiSBEpldPvwitfs42ZQM0AHvErWDHAOwkcXz
	odDTKOr/8VfkTZxIUWAwt660vVIyt/Ua1W171QMQYzyrlpYnPIDWUH+MW3DNT2GNlN6vod1D0Pp
	TYVycwZsdgZzKRkD6TsoEMG8YsZQuLxlG7uCM5vuGSRzfxnGvIfptrq5zt15D3w27vJDs1FcuG8
	5BlI+ocz9Y2BOSxGEI0rBBaUb4Jgi6h3Oq
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr7309443eec.34.1793435028007;
        Sat, 31 Oct 2026 01:23:48 -0700 (PDT)
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr7309415eec.34.1793435027529;
        Sat, 31 Oct 2026 01:23:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm15329884eec.24.2026.10.31.01.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:23:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Date: Sat, 31 Oct 2026 16:23:18 +0800
Message-ID: <20261031082318.1146398-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: PZncliKQkncTHB2je2AdHaW3wpTqwHkd
X-Proofpoint-ORIG-GUID: PZncliKQkncTHB2je2AdHaW3wpTqwHkd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzMyBTYWx0ZWRfXyl/U9zKwIogk
 bKID36BQ65UZ5MtsQUQH4lg3ZLverPUgYct8Qj4wyz5k4WyogYSIfTml84oz/msE+F7pdsUGQL8
 feYQrlyZFjCWQ6c736yGfxF0N6BG2hw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzMyBTYWx0ZWRfXxXDkXk78O5IE
 95sOaQ2oVcnu76kUSkGL8vGQv7wlFAvPwGtGlYR7RmpYP3R7o7bfwL5O10CkDJQtewBG7WIVbTc
 PT6lGPrOSfr6/T/spMcZQQgPsUQvUIyQi6ItPYZd4SlPo/Ne71a44xQY0g8p1hXLvi8U6XjGmXO
 vBkoxdCadWriu/9VXR6VlXo+tE9NOq0iHV1svRW8z7L0CL+Q4EYN4dViqgQTLh18DR8wsAnJBSI
 NkZ7mPQjvziYtHEqVQ8cYnZQ8QQcfxAnJg0ZV6DPMO79d4oPTht9Se4p7vcQzXg5mA8/n2Ebdec
 AfIFfI4M4GMKL47jbeOa94y/9DhKf8CLJzImhRz59LPCGHtL5myR/X9CG1u80LVrk/mN1iN/K3O
 BGCrfwIjy8nlQHtJbN5JyK2qyPBeDh90r7UVelGGtg43x4I7+vh8n3f2PKWCUebKSn0gYrYUHhD
 nWO44SZ3qL6F8G0muKA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae5a595 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IADkTxCLwKcHhP5_0iUA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310033

Derive the backend channel count of TDM DAIs from the cpu DAI TDM
slot mask in the DT, using the same DAI ID ranges and tx/rx mask
selection as q6tdm_set_tdm_slot(), so the channel count always matches
the number of slots programmed into the DSP. Each board then gets the
channel count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on
RIDE. Keep the default of two when the link has no TDM slot
description, and fail the fixup on an invalid one.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v3:
- Propagate qcom_snd_get_dai_tdm_slots() errors other than -ENOENT
  instead of silently falling back to two channels (Prasad)
- Link to v2: https://lore.kernel.org/all/20261029022340.591372-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Cover all TDM DAIs (PRIMARY..QUINARY and AIF_TDM ranges), matching
  q6tdm_set_tdm_slot(), instead of only AIF_TDM_RX_8/TX_8 (Rafi)
- Link to v1: https://lore.kernel.org/all/20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com/

 sound/soc/qcom/sc8280xp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 9aae6aadd43d..8cc75a7ad866 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -303,6 +303,26 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	channels->min = 2;
 	channels->max = 2;
 	switch (cpu_dai->id) {
+	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+	case AIF_TDM_RX_0 ... AIF_TDM_TX_12: {
+		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
+		unsigned int mask;
+		int ret;
+
+		ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
+		if (ret == -ENOENT)
+			break;
+		if (ret)
+			return ret;
+
+		/* Same slot mask selection as q6tdm_set_tdm_slot() */
+		mask = (cpu_dai->id & 0x1) ? cpu_cfg.tx_mask : cpu_cfg.rx_mask;
+		if (mask) {
+			channels->min = hweight32(mask);
+			channels->max = channels->min;
+		}
+		break;
+	}
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.43.0

