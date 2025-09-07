Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0241E260565
	for <linux-sound@vger.kernel.org>; Sun,  7 Sep 2025 11:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244130; cv=none; b=cJM6u8JOU1a/3kJVykYMRnk14D8DRKa7OSeHCT4cZ5VuXzdp1TtNDsEtPG/kTudzCFPAnrS9Us1wgwAzRbpAvqxrbzwbExJOYcB3T1sXS7wkgvqfVNeHLDfk2+tmdZtdEl55BK39AWHAPJBaM3yQao34+Zxzutr44blE5MtCngM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244130; c=relaxed/simple;
	bh=vmg0oYOxevk5nWCek+pJEZ1daibBK7o4kDXZ315AyTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCXN21EOMvbQe1jZkjLxe5MW3dIau/swW1ey5XAdbdgxrq682W1SCNlJ4M6UeOe7opyNwWvO7dZnAb4PFzq82LfXgfFi8cImV3Jt+NobPLMPFSqQfbKUzC3GWF/mq2GQyRh3x/0FFTOU/vT7EmAm2qJ0OXxWUvWfpph5YoTuxLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHYYh/Gy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHYYh/Gy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5878jJbf030408
	for <linux-sound@vger.kernel.org>; Sun, 7 Sep 2025 11:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qv++HabcA9y
	4aEMaW0PNus8L2anA3PVptVFL6UgEzvw=; b=BHYYh/GywCEEllUmM8czti3kpiP
	jmKPIXFq7UMu+8U7utQRZ4+W0kzWJjmRZxn8B2s6aeME3VUZf5NiHghiX5njg+vm
	oz7Bc7fV0CDKgiRWkeQJdsMq0nSLxyepe3YaTfV+rJQvE0LWo3Sb5ws5YyUn9MEX
	UJxga/EG+kkshSlngzBlGW2yBpBSm5H3DeLkXKN0wQtWceHairHg1tU2goJEY6mF
	Z3AtosjEyFknYeLa0nQuX+wL8WZjc0cdv049DJKjL1cKnF1L1rFaoIeBWAOdHBJK
	jN4F3Y2v8TSidNayeLdiNQ1DDNOMbGRhGk1Q57MCL44KWvbsJl7Ozar8l5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapa7sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 11:22:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b302991816so82020041cf.0
        for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 04:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244127; x=1757848927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qv++HabcA9y4aEMaW0PNus8L2anA3PVptVFL6UgEzvw=;
        b=LQgjI+9V+Sfpa5ArpPvcTug1ft3sTSnRcR5w8BQQkvp01aH0hHlvGgbVZfV6MOeww1
         59HsI46Xik/gc3G6gl4eBO6T80qV0L5n5+uo/y043Yoe/85cFw+MVBgYYOu/BgKC+uD7
         p98/vfCU+C8PizRh+1UiMEVCX1JKasnhjFThCCw8QVidMjqoAEA3jCyLvf0EL+NE2ivW
         AG5HGpeZBa2JPM1Xp71V4lvhVf7Yc0rANaGMmws/tknhVCc7bspcvbvHZo/UVp9NvkWQ
         UT47WXyOGyQaB+eLeu66YBL6UEnLybJQ+KQFGMUVZskPF2PKrlKLbgTZmhCqZUOb65Fv
         WAaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8E0fXRQy6/7VJ+10n/xSAIYpNk1id30rojge8P6LoA8EpB44nMBEGKcEh1U094tASLJ423FO2O6sfDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ5oJ54z+BO6i1pWze9B/UYpDbIjl2RT1wwod+J15cckhFr+oG
	RICLBGcpsgcFC9kZgRRQZGZj2n9RICC0tDFVV7ju9txDVequvWS7iST74iIrwo5npmBDMmIhujS
	JFU9pEMckp83lK8UzGCIb6bRogSp440HfitLTSGF5F79AHpFXcQ9yZcYOoxrjH4RTPg==
X-Gm-Gg: ASbGnct5yCwxRDSwZX8fSYInzOBoGVu09HekoSLEY9tQzJZNm2mM4yEOvnpB8FNDnoV
	PPLIrRsxubexzjDrsTLbtGE+JjdFYA8Psi7rvLdjJcLSG+L7c6txQihUCf1pnsb1ihpjru2saah
	2J3kohuxO3lF2YA48AGP29ivOGi/fjr4XJ48KRXxc1cI2hqRB8keaMyjQtSjTG7askrlthERHFB
	pzQYReEt2pqmK3yu+FT2oa4ZB3MZiKtZNniISwd4otGK+lSeJXSzglyBSyQwu6YP7I04uIYxVPp
	vYEYI4QMN5yVCTWpHdWM9BNk+YsEJgFkD0wnpk11Ebp1eaieAVx8Ug==
X-Received: by 2002:a05:6214:1c83:b0:70d:fd01:992d with SMTP id 6a1803df08f44-739256c25b4mr45856806d6.16.1757244126696;
        Sun, 07 Sep 2025 04:22:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7Ha0LinNzdQ5tF3yzmhjnhQnXoWXzNDtA7vzB8FtVnKqzRVE31rhzNfuLm/+H9AQf/A/rfw==
X-Received: by 2002:a05:6214:1c83:b0:70d:fd01:992d with SMTP id 6a1803df08f44-739256c25b4mr45856616d6.16.1757244126247;
        Sun, 07 Sep 2025 04:22:06 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v4 01/13] ASoC: codecs: wcd937x: set the comp soundwire port correctly
Date: Sun,  7 Sep 2025 12:21:48 +0100
Message-ID: <20250907112201.259405-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68bd6adf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0i9YUgi2cL8IzqKwLzsA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: EL3PGl1TA8eDXs0E5UlI3wNAP4zW1slH
X-Proofpoint-ORIG-GUID: EL3PGl1TA8eDXs0E5UlI3wNAP4zW1slH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX53vaz54DDo+Y
 3kbHXjhH/FtWH36loKDrqXZB8J1YW0MD3nvfheyFmJQZPwyKw2USfIIZlPZ0fKtk2RS/wE16CuZ
 HUbYwisVkr+Y7HRc5/eDFgS4pZPvKSCi/lSKpkME+JjkVWXMH+dkBaqQ80dpBk567tsc2IzHI/l
 FGvg54hOgrVCsIj+Vgu0qeZKpqu7Xp/a+uym0sf8v2Y5Zovw/n2MECEAe2+hhinotd5Srl8geE6
 9mqfvsQvOK0sShM9zZ6ma6eufKJgwVOvC0uggbQ1voU1sjY1AFTHSRV+MEa9GHgwvog5WXyZBtc
 4sRlPmHomxude03Ji+bvcp8UZEt4Ju4GNCVvlSdi5m0FQmCSsxAPbE2A5nqxNppQVNPotytoILH
 OhoU7s3w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

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
index 3b0a8cc314e0..de2dff3c56d3 100644
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

