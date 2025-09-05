Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EB030217E
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 15:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084743; cv=none; b=RX0+Y6kmDB+EoYs3WPPFm55xlb8Tji7/h28CmatlGtjptVE2mivSPXviHp0q/38/Xawk+0oCi7fvrIaDcsjGF0ybKHb6/0JHSclyDYCqxhqq/N8FQVeWG3wgkwDTaU/6o22tVYwTfP8w2WzAQnskV5RyVbFAxHmsl5hag9EDXNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084743; c=relaxed/simple;
	bh=wW7dIF9hg5FlDqjmM6YX0iZNQQw1lXp/0P0KvOe/ibA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a3/mtD7PsA0KnxBU01PNGb7p9QKfUtEcawEQkQ1pmUW4Fw1mtaY5TpGkvb/EnEIMzdIsVBYWQIVTgpYqRNMMNP2UhwngmlQhk8RnK285Da3cDs8XRTrHhVN1NwgdAB6QC4HwfoLR4uesKMnijCqWkQEk6zR1aELaHLorz8WUtiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8bMpnTz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8bMpnTz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856h5h2023074
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 15:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rams1MK76xG
	xbvTN1cUvij9c/QYVcgdlDejUrDnGUzQ=; b=M8bMpnTzdQb6zjIt7wcxk5/qLLj
	k0VtqjhsZGPc/Odh6vsdX7lViuVGNxVMun3TZdW/mgr2Fj2Dukp9TjCrtCMzLgkz
	eOaP1A5F973wcLwBoa8J6ukLxHn5+RvdbkV1k37xWBQAqDWHfopMnVfbDzCCLNpX
	jjbnZKL9kGN3Bl4O3Ed6YMEV+0TcOXCr52Q7vBKAxZViJ6U7g4xjIMkU+PXNSKkJ
	xHCXFxe6Zxkk0i7zFhIj8Yx2nC4qazzv8bMnFYYY+3EGF/aZ/oOVOkfRXuxU0i+J
	4raDyAP41fa/7JtHxJXdqNuXXv3xWKO6E93QN9gcDHRMt0S1yLSgGidYs3Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eunr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 15:05:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b521ae330b0so178488a12.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 08:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084740; x=1757689540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rams1MK76xGxbvTN1cUvij9c/QYVcgdlDejUrDnGUzQ=;
        b=qU3rFBg7je/RAsNVFXVFZ+Dpwi8peR0L3AIhziIZxDVJZD3y1QWRkKNJKgGuYwB0aZ
         +oETGmTXE3c4g0Fdd07PL3AxkFLo0nyZ7hePjyghNn7nzA/CZdWUU04EcNqX2dLGyiKu
         HHb8IiWhhoLzJHBYJE3JNhJghDeXbHqjSl/QNoSV3o3B9xxctx1oB47+Fea69Gk0anT+
         oTL0OjmMT0PZ48gDGm36w2RwZdrSn17aCmaNAKGVJG4QnupqYduT58OqDXZ2TForttwg
         RwsBHGMA4n/RvAsfc/FhMQRPTsolMIhKvgZaV151BUR1ysPWm+FEHHcZ7AC0vw44fDGN
         S45g==
X-Gm-Message-State: AOJu0YydybLTbGowoQOwHomUWXUblVn3nh/9Cw52vUGMkML2dsfm/YOZ
	zw8LF6jQsRx2AsiR1gGIleiWEyKKMS253hZqktc1ZSzLKZZ0VeE8O8nydW/qntPy6k5irxUSEJV
	QqMxUS/nzGrI08MFVqCf0xPa0LUyYByExbJBSpJOC2Z2rq31zWTtUQmc497EUkCmjTQ==
X-Gm-Gg: ASbGnctrt3oO1zpM+dRlQvV1iCNnsRc0MVQJhOJ4vzNTqCDMM9OxAb8yGrmMxSt+g4T
	4NS4n0PxWWu5eNrO/c1mimIE1ZAZpOgDsR2oX5KdzPiJMrXELxvJsOPC46Ap4k3tv1KIzhrOwmw
	C7LKAJXA+oQsbA4vqd24OwK9m3bgZ0JKuwqrWXI+Rxxq/Pe3lxoCWPx8tLT6XY4AYZVlLKsJLVm
	7GsAQY/zicRl/VibsijQehXLg+NU14RwG2+KoampDOwfetZmYVyABiJ9lvgoy+R7CXrve3+Qa0J
	xhmhtrUHrm24GUb6llpTyr0ARkihnL/zL+3R+mL2/RJx6tdHnVaEKBxfGh+IernaP8C4/IfYOoL
	w
X-Received: by 2002:a17:90b:5310:b0:32b:a2b9:b200 with SMTP id 98e67ed59e1d1-32ba2b9b3b7mr6442902a91.13.1757084740314;
        Fri, 05 Sep 2025 08:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx5KPPwVlb9iZR8T9g1aFHZ/PhPD4GNA1cvU17UqhbW9am2w2sCrWdN4XEZM5Yy+9fYcUdSw==
X-Received: by 2002:a17:90b:5310:b0:32b:a2b9:b200 with SMTP id 98e67ed59e1d1-32ba2b9b3b7mr6442858a91.13.1757084739852;
        Fri, 05 Sep 2025 08:05:39 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcf04b8sm28882840a91.26.2025.09.05.08.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:05:39 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 3/3] ASoC: qcom: sc8280xp: Fix DAI format setting for MI2S interfaces
Date: Fri,  5 Sep 2025 20:34:45 +0530
Message-Id: <20250905150445.2596140-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _S9xFHY4Rm6faeJ95ox5OLo_BkFN_Vrw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX9rbMzLT+5gYH
 bHh5nXiva/VEddoft7FRSl4ldKMAs4uAVgRtjEVbhsJvkZwqgF/7dn369uGrigFWA2mqJbU2u8Z
 il1VoADvVqoMMytT9v/WH5UmZ5iJ4N/u0cezHWhmLs1KnlutZC2wkq6UVUBo+ETcLm2RsoDZ8c4
 KeecWbMQggQF6EwtORmIUcNHP1eV4uX8cCNHBbTmGDcciRWDqcXd+TiKA/R88hfBR3LJJi1ILkv
 naq8fJ1GKJBlVLtJLbAt+uuwZqLBOO9CM4dIP8glkj1tFXwTbmBNaUYdD83riU8dSjw+hg9PwYw
 9zkZ//yVI3UBK15tI4yfL1036zy5vUiFaV7dO8YwMscmM6RCWFqzbmbuI2J7Tv5Nme5tNfY39IC
 rEO0FbtZ
X-Proofpoint-ORIG-GUID: _S9xFHY4Rm6faeJ95ox5OLo_BkFN_Vrw
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68bafc45 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tfJ7er6LdcoPz7dJv_wA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

The current implementation does not configure the CPU DAI format for
MI2S interfaces, resulting in -EIO errors during audio playback and
capture. This prevents the correct clock from being enabled for the
MI2S interface. Configure the required DAI format to enable proper
clock settings. Tested on Lemans evk platform.

Fixes: 295aeea6646ad ("ASoC: qcom: add machine driver for sc8280xp")
Cc: <stable@vger.kernel.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 73f9f82c4e25..3067b95bcdbb 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -32,6 +32,10 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
+	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
+		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+		break;
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
 		/*
-- 
2.34.1

