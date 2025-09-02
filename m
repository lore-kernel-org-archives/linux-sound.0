Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2A430DEAD
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821680; cv=none; b=b+z1zaSezbpsMrvKeRwtuEKTsDylA8BVLsuhLDLFNRhGuwaZbTI9sNj6qRpWxR9YSbfpGlWor2AYEi2KDz4mbDU5SJbzXevhGAFegucnwbdORgL/5M/SEm1xHfidDxMjSPay7u51/zIskmOTs6UTAdY5hXC3MObhvawnoGFJQvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821680; c=relaxed/simple;
	bh=wc/7JbfhxWZb0IvcqrXcslNekS6+I2olIuv0yDvhRhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h21L2zCzGR5GYMAKFmqvC+A7xmIlmeUcaGx1Z3lfwNkLJGeQP91FIqSmjrVBhy6LtV183jpoaLCf6Di9aqg/8mVeS/vIStljglcZe10HueQ+W4e8amP6piNsKtqCbxcGyiLkBg/dKEQ56JgCnA88X9k5ifGurp6Y806tPhFV4Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFDzbKot; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFDzbKot"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B68rG020757
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 14:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ofBMOU8ZIZT
	vpxtjJjzxzmb9uOD74fydkc+Mw7BveZ4=; b=jFDzbKotkqypIshh5GCVuxtWybR
	GSkI3mvgBp18pQfU04reVVaQGEoK2AqUDG2uQwH+qAlL3+XErhVrluCEZfqpNu+h
	1AeBixrSKHKV5ZXwT8l5GzhXQ5IRmg9kWjgKSNQHC+JmHh42cOlYczm4fzTXJCuj
	ZnV/uLf1XKLoOhIbRaVeptLTmqE53YIfMZ0ly3rzAEah2JFUEMIQN0YbD74p5htn
	vYhtt06I0lSvMjuDFarm+OZqGdhsUqwIqmgg8SAdj8/UoXgIJwJiMcR2edyEIHTE
	vOdK1n0oDk+xFWhuI0lwh5zjgXlnWjItd2hsZe3YYF+D9RM1tf1BvrnhoGw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s03un-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 14:01:16 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-53040f4a9f0so233197137.0
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 07:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821674; x=1757426474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofBMOU8ZIZTvpxtjJjzxzmb9uOD74fydkc+Mw7BveZ4=;
        b=h4LWaxP30Sqdn2ZpdkG2Rext0x/0TTCc5+Ob+TpCWO5S2TEGWNZ6OYgeRm01iE+94G
         FdASSQwvsGYeSWwYJ++XTDffa/uavj0W1fbrx0FvBQtsOAVvKtlULTsdw+1biYuh7g71
         +dD5ca4n8csETYUEvquU/S7XvBg7V2eAMkC/23Yj5ZIBa9hXE6A9iyOnWRD5FTyEKRGK
         x9XjvpKguGUOTF02kXN6c1wuuXdLv3PDolsgaonOk+nifmj4mu+XWtLNP5nv4drbT+bB
         ggcIcr2GDy+JHflps3KwdLwHzijld7Fi/EBnC+dawJEmQ9sM/1PKMxRbFoI7eupT2adZ
         8asg==
X-Forwarded-Encrypted: i=1; AJvYcCUqIS6fzCD+NGuyihZxt0+Su0bERLRjlmZCdwHPA8oT4oSJbaHD9B+nxvZRciTe+XAhRK1SmYmeW7Saaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdQv1vUWAoGNK3VeJeThye92c1jrw3ljrmP5Cab4WXMsBUY935
	IPEx7+ddUVeBeT2VDLJ7EM0YG6GKQ+mmvOyM4/OvtpmdLWt9nZRfhWEy3jGKjAUsJb5mYdpyo0m
	Y1tPQwY91yFvv0IpftOaeo3SZSGCUFiLuRNjQbM6yaEpjPvajRgh3udbTxmo6Hoj9RA==
X-Gm-Gg: ASbGnculZ6EySTVL6LnMox7teiIoJKa0SKR9SHVD1uAnVAKAjinDzNJQ4rchDhD+BNL
	NgR2odzqCgG2VZMxEnPTAyP1ABedWGEIAl7D3hRfn6jwuqTlvxWBNtzyCHSoyNooL0ubmiwCfQR
	qSuDQw9e/K7gC1P5E2KPnjXs2s00NjLujXaMxqjTrQgMEb7M9P1K9wHTm5sNdt1vRe/viTdyctD
	UsELBtWZeE8q9AzQOqkEy3Rd91Y50WEvXWX7A4rY5i14fpOtVbVTnsDDP55E2V9jszJtdeibHvH
	BsBCqeEWUUlnM+0o/JZXoQuU002FPh0nJOfr7tl6L8eFUPeIwya7rg==
X-Received: by 2002:a05:6102:54a4:b0:525:42d2:790d with SMTP id ada2fe7eead31-52b1b902c6fmr3471048137.25.1756821671580;
        Tue, 02 Sep 2025 07:01:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE257wS09hktiVeXoKS7mdBQNq0fy2/WSA+DkddsrfqENMevrNa5o8DRsYPDgcJnlFqhk99Sw==
X-Received: by 2002:a05:6102:54a4:b0:525:42d2:790d with SMTP id ada2fe7eead31-52b1b902c6fmr3470791137.25.1756821670137;
        Tue, 02 Sep 2025 07:01:10 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm14381196f8f.40.2025.09.02.07.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:01:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: srini@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/6] ASoC: codecs: lpass-wsa-macro: add Codev version 2.9
Date: Tue,  2 Sep 2025 15:00:44 +0100
Message-ID: <20250902140044.54508-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RdM6gSBd0-5N6ExG_HRQE5Mt0uGyzSMv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXzUvRcmzlyfxb
 dl6gUkFhLV3ssM1/df8PizdSSbuU/zWbVyQdbNVmyQfErTF/u9yoKcghoFhh9GOIlEmwMZekFXn
 pQUsxy/EcMweqCMa6R7BOBp2jLxM2v91bDoqpiMNlsOdn/WDv65A3iAj/W22f06iS8ULJ5rXydE
 a9U+WBX+CA8a643/Mkbk5FIIUnLlzQL9J9ykpTP9qVuYuQM6ac5iY1eJGH0QPWM+Z3sCx5ZW+gA
 5C3oF01xImTmEliUDsSV2ZRwEUyZQBvvO31AjjdNPdQxNgrtIHWbm3aoqb8zfOpRiXnHIYx0O6d
 iSJ0+IA7mP5RKKB5XrE
X-Proofpoint-GUID: RdM6gSBd0-5N6ExG_HRQE5Mt0uGyzSMv
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6f8ac cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=aFUyGFNo807uSY4iGNgA:9
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508300019

Add support for lpass wsa codec macro version 2.9, which is available in
Qualcomm Glymur SoCs.

Its compatible with 2.8 w.r.t register layouts

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index da6adb3de21d..187805b39264 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2690,6 +2690,7 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		widgets = wsa_macro_dapm_widgets_v2_5;
 		num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_5);
 		break;
@@ -2838,6 +2839,7 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		wsa->reg_layout = &wsa_codec_v2_5;
 		def_count = ARRAY_SIZE(wsa_defaults) + ARRAY_SIZE(wsa_defaults_v2_5);
 		reg_defaults = kmalloc_array(def_count, sizeof(*reg_defaults),
-- 
2.50.0

