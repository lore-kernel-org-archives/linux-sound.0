Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775886;
	b=U2a1Rcybh4gFXpg3WV0qkwhH+R5rgzctcuSlGMZ1HFbNgEt5J7pW+Og4qH/bCw6PDQsx
	 088j1qJlWMrbfGo7mzeoN6G5T7VZJiJI0heoipznVFNS4P9ezEyJpyTsytJgeSt0WZEwp
	 xNFkvG2v3CP4pj4fJJiYi7RmkOKO0c3PSKD7/F6Z8pBQP0hB3C5nmdxoB83y61gty370i
	 0jVqhIyiq7vlpOV9ycfN/davS5CTYBdIRNoifTG4lki4xrGLsi0UhIqopZDO43bnMR2pj
	 oYTtjBwEklHqAVNF8mTCZ/rfo6HysCP2oKNcePzXWkEVOtVazII8PuEEjh34AhlQFGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
	b=UDTKIADfd9QOf3zPML4XkA/mmW/Ikc1EfryBtXSNVC9P3NjD/Nj9gq8Wt4+PE9nk/hV6
	 koTX8HLXbCtA5r3bwsMblzUiAfRqIzTEWxA3Luc0ipJc379h83TF3ZMhsDDLgfu+/ijBq
	 MyYB/1jrVo1WWWQH6NGQHjr/VVDOqug55tgK83tHlM315Pxf1bFal84GwFTz/PytT2cKM
	 +lHcqumOLZKob2GsWZbB3L00vyGS2qtWnRyfwgj4YYRCJBKkmYRBnRYCd51kAkYyTPFPU
	 9T2rD/5oUqlTWmx4UZnKijG4QlG2VtAr/xNbS8HsLz1+FZc/mXuD4XTTpYQjPZyCy0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHBfgWfY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JlF5tTdT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6358560A2619
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6358560A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHBfgWfY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JlF5tTdT
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG2q4W3228251
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5T+eklRSuPX
	OFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=; b=CHBfgWfYo193RQkrldZ8J0KogoN
	ppn3J4x+BoXgvo6Ii7dPPtTab9kJlel/eIEE3Ed4Yw5Gn5UH1K7296cuSUfGjMoF
	5FqcMZPKI1ZjQr/CrVJdnjfn9c3w+agHBix8+6C9hfSe2TNEdFc//hPs4ZI3g7Lz
	GruvMK/PUYuQcKTpkhyte4Et8bY3H2va6T8bEJQRPQcsYyosF4jiapUgwYBbNnkn
	dbk+79V0OCQAsjEPsWsXUc1yPrr2A3DBTqBccndaaII8kugvthM+40TQB1uZCC3M
	y0M2d+sgDmbSe4552H1MiZF2YG9l81R7luns2EHgwUjN8gZFtGBWBzFxe2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart09hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so151554485a.3
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775885; x=1793380685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
        b=JlF5tTdToMf1M8+qngUfLf4dSVnbTeDbH1qstrEDxu32HlUsDBNjqDidKGJvKgGtzZ
         B9UGPi4rPk9XwIByN3B4JoArAbOlx/14pl23T8aMlRtA+ZRIomrOUY3Z0+wU1qEF7dxs
         CnhzVSz7tl2rodGPYDBvOxz8jCCogqlN7DZPwivOnvAM5yGu2X8FXFjuvaoiEOJi01sU
         /620IM9o4qk2SJ+rxCO87/1/iWrJr1QpJ4GxBHy30hm/Y3TTotHfxC7qyARBaqSab/l7
         dg4tatfmnuUGIUW2V0ZFK6RXlpP+f98LCjovVJvsvne6VyPR17KZyvoMm58ZCH9qu8BJ
         trdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775885; x=1793380685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
        b=juXOoIoFqCn+c4QDP6v0ip5M4e1NVoSgpsXHOYigqd5fYpLhyaQoDc2O4YvjFbvQ1d
         Dr3exBePassbIBoUMMAd2ik5HWd36/akrK5V5JSCG4vXk4S7/aMGuNKn+ofAiKoVkIuQ
         69Vo7Kwc8L4uDOhWJUGpykb6LkdwFlUwinPwRMv7c+bc1VWSqP0NMvQddd/NTVuTHEMM
         fGhd0JKkpyk5UzPW13huimhZBUcrQ4P4isi74RFwTQ48oTMF95loQ20xBPvDaPLyjx12
         c7+yPEQAFLxvz78xJh2fL2uZ6p3G8PxsZ5BEqEvTTFZIjvrgRQiGdhdW+HOTd00IWsc6
         SFTA==
X-Forwarded-Encrypted: i=1; AKwUvBxxlQ4b/sQsn2RTKT2S1lyrFImC9kN1bvqswNsQBUzuFXkl9byakeTGPq8Jpir3cye8vc8EzVuJakWpZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJqKLwIZCsy7hf06FeAeDGCq2uuqNnRAP2DoGAR80Vr4ejy5hV8
	RoOs/qJUvrnLL0q+GebGMZfjpE6JWgVo9wKTol9D4S1cnwypDTTNK74kfQUyzGVG4byDp4iqliP
	hEZ8epz1bm63+LbTjxcIzcD9+lA0e0H2OUGZSQP8C/znSzgJh4JyafwREExv8w2mnsQ==
X-Gm-Gg: AYBFou2jVVsXpDHL7D5xm1zUFhtujaWwKTyX8Ng3cdRoKS/IOEQNaH3gSQUMK/OkqHp
	RgrrWj+yCT0bkfqwAssEUloILf3h8UmVYPLNZ6KnafwKeFfv3dBMGr+NdukK5YSGkEfM42NxOMj
	+XTN2fz4jDPMhcgRDn+wGqGGDENZ8gyaWqkElWeDLUlT5hLW9vfu/muB00xA1EbKMFTLfudP6Yw
	suqcQPvFMyspzh5kH4b/fvKy9AfBedLBU31qa2L7EDhgHdJT3Szev+pwYeU4u3GtKiUiCYoVjir
	JJTz/6dVkvPcCsg7LYc0z7/cLJXcvCRGTI9Z9C66kOReKjRmYuMjTMy5ondeW10LvFHKfiuUJ3m
	uTOg0Pv+seauq
X-Received: by 2002:a05:620a:6403:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f6f908691mr502263785a.26.1792775884600;
        Fri, 23 Oct 2026 10:18:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6403:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f6f908691mr502259185a.26.1792775884048;
        Fri, 23 Oct 2026 10:18:04 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 10/23] ASoC: qcom: audioreach: support up to four speakers in VI feedback
Date: Fri, 23 Oct 2026 18:14:20 +0100
Message-ID: <20261023171433.820092-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1VlNn2JScg7w
 Nkf7sWe+sTnV0iz+YaCfJLyTh27Ih4PF5o9G3Z15iPY24iMOqTpaSD8fc4KRTYyHM65kfiY+63f
 G2/Ib/xq4fVG5BtO3ws4bSMsT8PohM3Ts8vyT//JsWbZXEAjqVl41cmWD7+G2wt3FsEvmEtC+DF
 TRwRUfulWEv2cdlTVNaWo3i6LzR/GSLMGNy4y5ArKubfp2TRUfD/6gx8wrN924zM+E28BOhDL81
 gB2Xtq3B6qnQ/z1hKA158zIJjcr4hIOa6CJqiq3TCLDYOB6YNmCLxGatZCd0VvWlWig8d2nYsOu
 RZeecUQezKm72QPKna7mYx6BPdQikmKCYEhSWhmSd+vvfJvrEbeFbT+8e17mfZSTnEjWAe/41Ft
 PV3eXv/NOwaK6fHZa+M9YmSt6iaZtnNsSrVbK1zyDv+G5qMXbm3hJf0ryxFMXPFPzZiQyt5/81l
 v5gqUPSLmzhVqmnMG2w==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adb96cd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0B2h0znxLllEwdGFOn4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX0PQZJOlYug9g
 O0dAG4j/gsAs7IexL2I65dbxNU42uOoo+UrnkgbAFaSdGhsRwmuvtFIcdB+AiiqkJm6liwVij6v
 4YnFIBWrEYbDZgVFxrZjFHHI7ONEY+w=
X-Proofpoint-ORIG-GUID: vjo245Rp_hlGZtY31Yn_TMCHF-pwbdYP
X-Proofpoint-GUID: vjo245Rp_hlGZtY31Yn_TMCHF-pwbdYP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

audioreach_speaker_protection_vi() rejects more than two channels,
although the rest of the function scales with the channel count.
Laptops with four speakers need four.

Raise the limit to MAX_SP_VI_SPEAKERS (4).

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 2 +-
 sound/soc/qcom/qdsp6/audioreach.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 75995426b9f6..24198cde8158 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1508,7 +1508,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	u32 num_speakers;
 	void *p;
 
-	if (num_channels > 2) {
+	if (num_channels > MAX_SP_VI_SPEAKERS) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 4744d3117010..c8c7fa4f6f70 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -696,6 +696,8 @@ struct param_id_sp_op_mode {
 
 /* Speaker Protection VI */
 
+#define MAX_SP_VI_SPEAKERS			4
+
 #define PARAM_ID_SP_VI_OP_MODE_CFG		0x080011f4
 #define PARAM_ID_SP_VI_OP_MODE_NORMAL		0
 #define PARAM_ID_SP_VI_OP_MODE_CALIBRATION	1
-- 
2.47.3

