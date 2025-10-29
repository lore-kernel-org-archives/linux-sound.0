Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4564A345721
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749024; cv=none; b=SHYqFqLVZGI1BbLnadznXN0LxbPWZgnVr9iuzDOZkvZa7qkalgWwacH9tg0C+mnuGfCoDiXjqn5vH4MDusupitdRvqH1tn0Sfzp0HnCSz8wnYbLK2R2TOEzsux81onyz1M0h0KxAvHDwA2ZD/fJgLJ12rjrqxsVwgUewPLNH5X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749024; c=relaxed/simple;
	bh=Q4MX9SlPQmMJ4CcUBynx4ietUSAeT1pRBUKc3e+j1qU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dYhP/tMuHKVCLdYiWAih+fWhtzkSkyriz108uIQR4kTTBvVGCc5bJrJnUqZcoMDUx8/nlmR8IYJQAV88X1qeWM54Y6HuQ3nX+2SdzL/Oi6yHn6/f6WpbuodeTHq8j9SHnZCTA2QdzTD1S0lYb4jZNpVQ9INX0gjMvaSNcihanMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KX2zZNaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqsHX8ZS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KX2zZNaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqsHX8ZS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T93G5F4155544
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 14:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nUtjA9zjZYqM21NPenW/TF7z83CiW4ruI7h
	h5gWZ9l8=; b=KX2zZNaXPXvadPtQrRFhgKLMK2KawjY63PQxWMLM435exHbBrIC
	LnGsFNdNg2PdaFgip70D7BZnAe3pTzknxIcAthzB/BsS6PwNC7eWZvcxPKWRTJsA
	cTRgzj1qp5avNKiBJPgrmfLOzzKe4fNZgxZquAPsRHU+Gm85UJfLbv88y5OgdAcy
	xUeNaG1ksNdoJE0/Zd7J7ipIS8Y54DmQq8EHyEjbh9CyKgh+yQZ+iKNVdr6s8RhA
	uTyF8ANG2HEdyWIiAaLDezB3LokuuHybGqi2aoUvjNuzNfZ7Wg8z1FkpmcWhFevG
	3I23xZ4KWgYSMjJg/+pK3nMabvQFt5h3wlQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3fy0s192-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 14:43:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ecf5d3b758so103696381cf.1
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761749021; x=1762353821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nUtjA9zjZYqM21NPenW/TF7z83CiW4ruI7hh5gWZ9l8=;
        b=jqsHX8ZSLRl30isBdgFXlVMOs+fkcHid3CBUnzE389K34PXYKnO+HWivtFpGF9bkfE
         9+IY6St1J/WaQ/u6sfq3oUd3uO+eKWPqQUMbG6ZfZYiuIsgX2RrrhPjcuVptIxeoNxLG
         iYwUqQUnFiN8ndpLKW7yxVAXmC3wPZ+G5hTsd5L86eU004cnyPDKeo2o5cmPg9s2Ms4q
         gRZAD40pYj25uEvwLPpfgVqrDV6ZRuM2mEcZrRvHJBODazNXXdwuDaUP5rFnYjeNw/iG
         kDNJ6ZD6NHIUAy7YJseJQRCOaICqcfI/Ewz8YoOGhvSaArt9FiRKD9glE5HgL8s1lF58
         kTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749021; x=1762353821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUtjA9zjZYqM21NPenW/TF7z83CiW4ruI7hh5gWZ9l8=;
        b=eXiq2lGoUXFs5kBR8UuartiObZQnWXLgkY4kfrk2p0vNJDwzEgWp9Oolw/Wvvu9Euv
         R0wfxBZnlA4ysJYDhcxNMVFtbvuCd+r76Zh2r0u+56WFXjvhDc6AwypdOcLdZhhe/aqs
         1XB6nbXZo5cYC1Vn+afoOU2V+9OgW/eyCE/rp34sYYCnOdT05QsT6pMMgKhQskrPMbEN
         LEe4guPvDWUOhAkSDaDPrhAFL6wfZs8Fo/mfaEPMl66qaEmfi1eDFwNZ5zyihgqugndh
         01O+VKmm5UmwwOfuvZjLnFg1Kc36KBFgg+XMwgSa38wh5lw4MA+aHTQgIwxx1eogWq0u
         wRfg==
X-Forwarded-Encrypted: i=1; AJvYcCWhq6N20w9SFGX9bkv43UwvGh7LYS5H8MK0vE9y6UHBD0sOYyDSDGo5EgLjMHNE372Pwr+yJq4QRNsOCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5dnFzEpOQklX6FdalJbvfP+vkiLgui/KkoibRovBK288V/Ws/
	FcMXoYWKZBAzP48jIFag1ATjeioJLMvPX/PMrJ8hdjvXq+n8z1hk/KBed/Wvm17hoMifR6tZ6ky
	avSKdIYHbCAg1G8uoPmMV4+snav1RHWjEQcxxrnyJ4uVcNbHzKD0G0bLTXFXgFRmMSQ==
X-Gm-Gg: ASbGncv34UD3AhJTCbUUIqO/67KOrQfJF1c7mWH/MBzCIYyFfL2QWVwlksRWINag2zF
	/CpCSXbgUYMq3qL7BkNR3R7a6yEg5+1oEkieu7MeJ0F2Wo3F+hwN5KL0i0EanTJL+4Jnm0RGv/9
	LOXEUMuq+Qp60iHuUxxuVlQHNuGSra9XBkc2IVA97N7cDpSZ6r7FpNKL8GYkeUksnUmdQ9J9rK1
	DVsI4OEyi0Ok6rdWb5Wb5TIVyhank/0QQJEn5DbVR2CUnSEP9Q5+tBFdXbaC0ie0YGH/hHYfMdI
	qcPx6/LzFtWwROxCaUWkr3o5B4J+14IZKH7I7bGqX6qjVVbfyAoYSsyA+x5bJ+3AMnVSRH3s8O0
	EkBNeoHunENcb
X-Received: by 2002:a05:622a:112:b0:4e8:a3e0:8106 with SMTP id d75a77b69052e-4ed15c29a1cmr43483521cf.57.1761749021399;
        Wed, 29 Oct 2025 07:43:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExa12O4yxMcXaHXaMolo7+zrWVZU4hDShXRUR4ZvuDxC4zGr0GrN48ikAZFN2nClBkOKeCog==
X-Received: by 2002:a05:622a:112:b0:4e8:a3e0:8106 with SMTP id d75a77b69052e-4ed15c29a1cmr43483201cf.57.1761749020952;
        Wed, 29 Oct 2025 07:43:40 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e387a14sm50768215e9.3.2025.10.29.07.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:43:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH] ASoC: codecs: va-macro: fix revision checking
Date: Wed, 29 Oct 2025 14:43:35 +0000
Message-ID: <20251029144336.356816-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VJLQXtPX c=1 sm=1 tr=0 ts=6902281e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0zzDRROiBSe0RgzfM-IA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ulD1P8xp0MnkzuFPmDPyyCKy7dDTpqHW
X-Proofpoint-ORIG-GUID: ulD1P8xp0MnkzuFPmDPyyCKy7dDTpqHW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDExNCBTYWx0ZWRfXzSCSgjIW+l1V
 Pv/z6+pok0Ye8C1gxYa3q8/KvRzRkphMtjsWFHZCV690Q2Wfpzj3XNZYix0AtjQJfNLax+2P11k
 zZdx7zC7NVveReXM7OLVbVhLZ3sWaoebARFf+jzyqFTtQmOf71Nt+NvDBOiVlg70a3QFTN7RpnO
 IfalW56ev0WcbGl41FuN/heEZ4VndQhYEaUpwmKv7z9y6kk/d0iv0hNXGErf44banT7LboSYQ1g
 1hurcgAfWhYdQ2tejGPH70uxGkMkiZjFg4KdMGfaH/XkS4oFlhwQgZ+xWbKUKLuKI/j5oqKGJ4m
 4FBHd8wijRu1zZ+tR8PWF+1hs5kESwcDIizw9CmyoEasC2IivaHn4HZt9C5DI3NsXjpDKAl9CCl
 66YteCfcK6kSWao3HeS5tOlNPivCAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290114

The revision rework patch seems to have reversed the bit positions for
macro presence in core_id_1 register.

This broken RB1 and Arduino UnoQ audio.
Fix these bit positions to correctly reflect the register definition.

Fixes: 281c97376cfc ("ASoC: codecs: va-macro: Rework version checking")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 2b0ecc52c6be..fbe5ebeeaa80 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -67,10 +67,10 @@
 #define CDC_VA_TOP_CSR_CORE_ID_0		(0x00C0)
  #define CORE_ID_0_REV_MAJ			GENMASK(7, 0)
 #define CDC_VA_TOP_CSR_CORE_ID_1		(0x00C4)
-#define CORE_ID_1_HAS_WSAMACRO			BIT(3)
-#define CORE_ID_1_HAS_RXMACRO			BIT(2)
-#define CORE_ID_1_HAS_TXMACRO			BIT(1)
-#define CORE_ID_1_HAS_VAMACRO			BIT(0)
+#define CORE_ID_1_HAS_WSAMACRO			BIT(0)
+#define CORE_ID_1_HAS_RXMACRO			BIT(1)
+#define CORE_ID_1_HAS_TXMACRO			BIT(2)
+#define CORE_ID_1_HAS_VAMACRO			BIT(3)
 #define CDC_VA_TOP_CSR_CORE_ID_2		(0x00C8)
  #define CORE_ID_2_REV_MIN			GENMASK(7, 4)
  #define CORE_ID_2_REV_STEP			GENMASK(3, 0)
-- 
2.51.0

