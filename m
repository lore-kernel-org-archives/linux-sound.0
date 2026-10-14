Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF284DD3AD
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969246; cv=none; b=NYdPdKDBB3dneVMjSOrhZqex3o8k+ydFXojGscHmEjj1SqklYVHXu1/BDjb4rxa/w43wNpHarm6+MB4UotexB6rueKacu6VT8VKovyl9kCp4i7Z1Df2Sp/TTL4lh3G8hQCb/Oz9qpSgyGYdE3+pAm8t5o1b7nw2e8NHOj+k25fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969246; c=relaxed/simple;
	bh=oUcG6hWiHKgVmRBsl03kZHtJ+9y4PxAqvuNaXBrwIjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sEF4/oj9UjadYDklqfrfujgzSL7lwhuilBA6XAH08bOlhwa7RpGGhgD7/vdysWJZOCN+Bu3XtNgbK/cHgQ9L5woltYNI6grHjAbN7+YFAp9+BSKYbiTe7H83tpOwItBrLrg7W0ONdnagQEty6WeekahVdhSkb7Hk0rqkqsrnZ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYc5CdcX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1qHvTev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYc5CdcX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1qHvTev"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67kiV2685322
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ypr/81MA1en+4T6MDdNE7UBWj33JC3lzWIfnwCPJ6Q=; b=CYc5CdcXpKqwx2LX
	m9aHXErRCSg5SUGBYN0hLSYl9jxTIv35/IkMTetSdvYjCfeGA01Yor0uy8amuc2s
	piZhkafbfQVSc0+g9jQgLh2cMOPTbKH3aUDt5hnwc2F7d8eLaVh3OeRtecw3taj4
	8jWy8ktfkudE7EhoBx6gY5DG2LPBSfnGRCctK7/MgGe9lthr5eeyPDDuC+HcmDAA
	3Dhl1/qxzWeFRLy0ClPXo04ZbZ4AGjQbNNHXvjtKgBJBAUfO34XXce+VQa/kAaol
	EW6NoSiXh2iCcnYogb+86xpABJMHWxfRk/2ZsSy3N/kNN/9BsB4fEvs12MGCQmPu
	CF0P1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u0rh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:14:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e617b5e9b3so27318205ad.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969240; x=1792574040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ypr/81MA1en+4T6MDdNE7UBWj33JC3lzWIfnwCPJ6Q=;
        b=d1qHvTevfWn9N5HrsRyc2DBxYriTissaHUhc2uJPAuZdB1PpAb/K5J9TzAWYZQtvNC
         LCZADoU4a81XT9kIeC6xRMRN0GuNguIxOoe2zV484PYtq4TaiSVHyAMQVDxLqS1thcCL
         pI+yeB/V4eYPGBFBCyHV7SkmxP8NOFk2Mn973EAkJc5ZOcBc0iSWONWvUFjHiDemLZoR
         5gQpwOmwcOAv2ypK6qYhNqijWHKb1e1s5Bmg4FmDKiNSJtYqH2HwmVgd9FFstJsTLxe5
         zyBpFkpJTcPcF73DiOplhwIaqVoRNsTXe2/z7qozYoMAvRKBMyRUz+ukg3lg7382W1+V
         RQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969240; x=1792574040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ypr/81MA1en+4T6MDdNE7UBWj33JC3lzWIfnwCPJ6Q=;
        b=QrApfAHI8Z57H1lVeMNcpLyx1No2+ZbLFWm7dR4+igcSfYHIhK0y8VZ71Ku2bLTUYK
         QppQM/tcR+yPMSB0UBziKyxBkMV1UA0gWwNzdTjqpcV2fHCKmTS6o/Yq2GKN9dt3TU7c
         SYVuiWSC837LfvNtnsR/AUeeiYTj2/tK4SRRb2dYCZJZryC2BgvcoGa24Ql5xdof4P8B
         /pEOThdrFeDrOkj2SDymMrVIQ5zOLFa6F9+EKTft/pjnQwtQVGrSu/t2VPM05OaLH596
         B7OT4IWU/zq+Ov+hNEQzuVUaY6Tk1JwCmnojpTtGvrX9iec8fe0Dx11hudCiz10JD07h
         VZVg==
X-Forwarded-Encrypted: i=1; AKwUvByJVY/vUP5gSZWuI0PVQZjr6bb6+TGElobqVPF5X6Gz1kgGF8Z3CYxrtkVYKsV4lrSB7CKMisY072/6fg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKmSqFS1kyOuwEz5LWTrYztO380NSoDdFOE3U2dSEXd9RXh2VhY
	xR7Z+pvdcFVXwTwDuREf2wqHELF9mbwa50wyXFasK83XeQWTmJJ5J8enaWCw19CnZYwf4DdNLJs
	FSwB7hCIfQ7VAibbcm3nX+A3o+Qb2i01Zt3JB0CWwq+Cl8ckoYpWjftjbcqKyxJnsEKbGjoP6QA
	==
X-Gm-Gg: AYBFou285PwaN3XR8tQTDBh2r/KUwtG3iYxEYo5hjw5PgKnF0zySRANNUGQfvfWMIk0
	BdLgS8MibMLDVx9iKahNngTRQ8141wFbNUJ38eGRULVmZA0kCXhP2OFRibkgW30nghrstn16Sfq
	DyoDaZcjDs5lmOJM3GSuM7JsK/1pLc1fn0lcs5h9ETLyU0DFI1/XpjnOQXT7aZ2Wrp01DN8JrF+
	FLV7l7fSqic9t3NT00lLPGY/uwVa29tJ0lauIJtuAzArmFxzcg5MkfcTAmO6pWoF4nK/iQtpJMX
	YPSIH60oqSHQ9YAwMbUqlOm2trjHKSQFv045SGgOomU9NIxa7VJorPeJtgZJ9D90k/mA/J1qGPO
	Sa/w6/Bafu2hgs73ZG5zKJc6tPveBbcNUtio=
X-Received: by 2002:a17:903:38cc:b0:2e8:773a:e902 with SMTP id d9443c01a7336-2e8773aeaafmr103675505ad.58.1791969240063;
        Wed, 14 Oct 2026 02:14:00 -0700 (PDT)
X-Received: by 2002:a17:903:38cc:b0:2e8:773a:e902 with SMTP id d9443c01a7336-2e8773aeaafmr103675355ad.58.1791969239582;
        Wed, 14 Oct 2026 02:13:59 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:13:59 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:48 +0530
Subject: [PATCH v5 2/9] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-2-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
In-Reply-To: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=1032;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=oUcG6hWiHKgVmRBsl03kZHtJ+9y4PxAqvuNaXBrwIjg=;
 b=Vd4dWRz1Z/Qkp94btMwxQ80xUaetQniWi4DQObCli6LiUTplYj+/SVP+6PNowZfAk+6X7UthW
 APfUQham+XRCOT1uHGxWRUz0BOEOUhq+R7aoQWXQ754di8XWBBDarl0
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfXwUrxOHmf+WjW
 qq6pT+djdGyI0WDYwGuWu/TRMAbZLznlP0aQ6z0jXFfZq2pl4e9menQlcHdEVYZyicJbG8hA8SL
 ngZxvw69dJODr9l+6pW7dghQAySv4PY=
X-Proofpoint-GUID: rKfq0UmV82bpDmY2rKK9tShwN5GHLd0u
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf47d8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nrwinYagBEXx2xsFsuYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX2zFoIhBEvh0w
 M2EhAahYu2iw8tilYUb5FqOSmU5YG6xf8OwjTPjUcY+EiaXTSrOnFa3oRDY3WTznyqIGwlV9tkx
 ldMu/6Mdv7cVqjW/3mrR2oLMiACSsWExxtFCXvbU1sCNFM+Xx07+F7HK+uZZJaI07DIX5wQFGit
 HD8kgk3FmgWC7Ndpk2OXhdrjUKQYIl0lFPFZHme8nSvfPSQrh5oLFkaJkR4lo5mTKxZd/FixzAO
 i2JbaRECScVcQKNdBsJEblGCE6qvSsr9HPkQk6/BJYzsqbV1I7ZNGoIPdMIHS2py0F/icC/ifRL
 l4g6Z3qNhFBJwfF6oqV6r+p0tHJNdKHQIAJOG0wk0QS/FYH1jv4EjDH2mJKhUrN9XXtXeW0066Y
 qFhdECAEg8Vy8TLFbdJdVMXZo6dM83tW5FfkQKpPehko+zIVCkTdYNqcnHqTPA9vO9+mrs+IuAB
 UuG/OFqMM8zSk0y/gFQ==
X-Proofpoint-ORIG-GUID: rKfq0UmV82bpDmY2rKK9tShwN5GHLd0u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140036

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad68201..573b2145e 100644
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

