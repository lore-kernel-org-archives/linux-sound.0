Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46302F617B
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859775; cv=none; b=uZalJOB5Czrh9E4LBloufrH6zWzqFYfOlfy4bbD5vjUvpQrAOQB8DYaf70C6eJLURF15TLhMHCulurbtJK5k+jW9peSjGBwVpPi8BOsTl0ZsKpL69qdNh0VVkqDR/Ru1iga/Q/uOf3OmQ9ZkuAcxSnA4HdC4vtFvpRpSrSepZvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859775; c=relaxed/simple;
	bh=93GrgaiWaZtCKjuG5PPu0kwmkEEb4zw1zaJIOqGGrto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Li0OvqhlMjv4xkpupFyn2f/DQhEw1WS0WJuIAuldpONQWbfuLkex7ZmdqYvIhSem6d0LTN02oPzcbiJ+TBqW5BCWvzn9a65mi+62OO8GzxkmK+np6foeHaLcHIqQummWCYw5F1fgUkkMHcfCslaCfZ7JR2fGGJloySLW+QZw0n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoQLVjHq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoQLVjHq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UUIN024258
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QvpftBrG1J9
	rWY0MKQPnpSUD1XG+6hxhXllVH2PX48o=; b=MoQLVjHqPjkyopWKBLC3dq1QiUB
	bjU++ATNVu/1tzImZ5zGWI889QWaBH9BdDTyrOT/PYzUfqCL4PWycN5unJzbZFEm
	H5VUGZV+hkdCfnmWxLD3rOawdXiyhMS5dXRfGHxwZXAr8Gl/StMD+FcBBoMXtgvS
	ug6+3MyNgBVx5puAA3hCTOeFXIEY61NfVWHcZPfqxuSqKvHIMHtt3wTMNGvSuBXb
	gZpyAue4ePnbXGZoxqFmfotWH371E+HQG4JgAkRMu22VXNP34FuSOMUTh4tAyoiF
	CuGnl4UIB0UWgGwhh3JIrGl0btQcI8x1QyfaM5Xl+kF5f+ETC5NxErA1Ouw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ah08k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109bf1f37so42926781cf.2
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 03:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859772; x=1756464572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvpftBrG1J9rWY0MKQPnpSUD1XG+6hxhXllVH2PX48o=;
        b=w3DA9rtRbzODSqxfBuynT1aMDE5LH7p5ry5uQjTjwz+QT3N+Xz0FR+ylsUXBjEcg1O
         07rMfnraHqWbnWK8mQv95vrQgt++NWvRhjbw1rkuFOs+cnXV5UfLRXdAyAEi/Rv6pzE5
         hceIdhi0CgKz2uiS2Wf9AQn6hfle+0zsO1Qk+d+UlkxExs6l73rYB14lAGaT+MaURad7
         08t+9cJeQkIUor2d4DisFbe4rk9EW24ECZEk68Eq23mQ+WNRWblcX8Yl//ORChSGgHhP
         HGfyRZRqZ02K9s/9hDpRtUzkM5I+XyqJy77E+AOPRUFx1pg3/JvK5k/M0nacFLIKlatA
         Lz4w==
X-Forwarded-Encrypted: i=1; AJvYcCUH45P5VSiVyiR7eCEBwY6JkN2F8wxun0vbQJmaDSNb/30R1Nmwd3vE2WTd+i8lT4Jv0YH5xcPWEweKmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4SE90WcDNL+XX/lzUO8SpD1yCoS9NlWvOoTlpjUxbBAvxwKZ+
	ODmheFkHHj/pxntXQ5UXEI7zfVLok/T7dAu/uTEG9eONCNF+g/7Zwzrb0KCMyKFQjNPY/5DXmII
	+NmiFSIxu8+TrsjTNykaFvrPeQsf0ob9FmZWqvBp5BqSa+pKwMbjpg2s+10cq/+kj1Q==
X-Gm-Gg: ASbGncvtlLb1lfXfa+T0fk54WUGpTF8vpWV3QvTqEGLGX6zZnAjNbvbKfLwGZFG+gB7
	aWSR/K5UqWKGLfl5cDQC/NjYMA7+4COfHq3oYp8+tTqiCSS2K+zOMNKaLU7Ebne8mNySklMnyXm
	7ui1EyjApqsJ7CG5f3pa9vb9qsVRS153oCeypzcZLlF3sQtf4z0bmWZMpw8OSH7iSyE/M/KWyMl
	+5eoIW6LGUbqZcc96CcDFZnfXGoGdFkOWpPAI+Im3wm1Ig/ljci6uxZEQuDRiCf4vIyUFYj9nW6
	ifoFkV8ll2gwj4jTgvremqr6OeT+usqT6ZOBk6ZPLRDfy6bafvD3Gg==
X-Received: by 2002:ac8:5947:0:b0:4b0:7f2c:b27d with SMTP id d75a77b69052e-4b2aaa2b808mr22572051cf.22.1755859771410;
        Fri, 22 Aug 2025 03:49:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IES7Jy1nhGpx6D+85CwxK+Qgiqo2P4/BsEinxs93B/f9dsv/inAUbbS1wWDEuY9P9oa8wJ9Pg==
X-Received: by 2002:ac8:5947:0:b0:4b0:7f2c:b27d with SMTP id d75a77b69052e-4b2aaa2b808mr22571871cf.22.1755859770819;
        Fri, 22 Aug 2025 03:49:30 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e4249bsm31367155e9.25.2025.08.22.03.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:49:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v2 1/8] ASoC: codecs: wcd937x: set the comp soundwire port correctly
Date: Fri, 22 Aug 2025 11:49:20 +0100
Message-ID: <20250822104927.2621866-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2PiBvBZI33MVIodH0XHNuHZmHZx16r74
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a84b3d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0i9YUgi2cL8IzqKwLzsA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 2PiBvBZI33MVIodH0XHNuHZmHZx16r74
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6Pnv7g0cOvTD
 8G4BSNHFZbQxszozyMrHod8oZuxzpSpGTRpgxS4wPyOEnd0AMTEbN7sB7UWUeqroC1dUSIXxjII
 v8Nueware96N1DotY2hlJwvpmSqi+X8sOBsiYmAFGHS00TrH+Xdy3Wh0HgPeWkQyq8Pf0m1Jzs8
 i3Z2ULOtF2E7gmciWibc/n1GtAgk714/cT7ORUWROAAg90YaFcx7Awf/yKnzgSu6R0/u+RDRTqR
 WJ7noHM0tSbHvPepQHaU8S2SkixwwUU/3By61Hv2h27JJmKGZuMZmouVwbSLhLhblLddQCMhUpL
 nCv4p2fpLUD8WZhJvhDJBZFN/2t6K0GjJwmU2lPFAmgyBawEPobgrIR/SDELsJiIpa8D8gf0YvD
 QGG18iFIE6xsvpDYcbk+A89ZM/LmpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

For some reason we endup with setting soundwire port for
HPHL_COMP and HPHR_COMP as zero, this can potentially result
in a memory corruption due to accessing and setting -1 th element of
port_map array.

Fixes: 82be8c62a38c ("ASoC: codecs: wcd937x: add basic controls")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index ccd542033967..b78f37c582ca 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2046,9 +2046,9 @@ static const struct snd_kcontrol_new wcd937x_snd_controls[] = {
 	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum,
 		     wcd937x_rx_hph_mode_get, wcd937x_rx_hph_mode_put),
 
-	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
+	SOC_SINGLE_EXT("HPHL_COMP Switch", WCD937X_COMP_L, 0, 1, 0,
 		       wcd937x_get_compander, wcd937x_set_compander),
-	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
+	SOC_SINGLE_EXT("HPHR_COMP Switch", WCD937X_COMP_R, 1, 1, 0,
 		       wcd937x_get_compander, wcd937x_set_compander),
 
 	SOC_SINGLE_TLV("HPHL Volume", WCD937X_HPH_L_EN, 0, 20, 1, line_gain),
-- 
2.50.0

