Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59D938238A
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 06:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780987261; cv=none; b=sxk9ZjfNm6UHmVeJsdSw7jh9PRLipC77Q/EeQ5AGRn+nf8BkdpxCYc1Z+yXEwV5RRbULnPCy5RWi/2fwUj8nm1EUuEB2nSyhGwF0CNs7nnflFGyPXuU23yTcCCh95Oq7Yo1MtsrcZFjlFUY50KaN2IkatSMUD6qOMQuru8jhH18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780987261; c=relaxed/simple;
	bh=SUp45uL0Cj9+ZynVF4O6v6DjZsBdSrnlPjW29909kZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S+i4zwbIBUHJse2NxPwsihu6gscpBD9Rw/u8NgIv+y2FRdPPqCsmLYO8/7Bp4UwGT7qC3J/eCdsU95MSfoFXAyb9CLgkp8ay2AntjLxwcFCl6JKBUaKdB/fFTCRD+7gj39FprS4W9mf8lTLmEEDMKQzk2KKSnccXPrZqfTWrIOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZYKDhWF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmeiTuU3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZYKDhWF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmeiTuU3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6596HpAv1365161
	for <linux-sound@vger.kernel.org>; Tue, 9 Jun 2026 06:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c75jWvAaoCA
	pv/IIOdNGer60GpfGqCeVoO2cPGCyclc=; b=ZYKDhWF6gYt+8FKsxPmYrCH2k39
	4ElPvVKrdOmoXYurPRIzQWcMLKq6JMAOhVlRvZPNwd8r+BhI1itxVoB1tQXVFkj7
	PcNvNaiU6olFBgsL1WUO2OAg5ZEwyi4MlGWQTeVDxYpEjB0ZKf9wmjBelqluF2Mh
	WTS79BOzZilCLtqgcaE+/LZalPHtknkGG88jwDpvw/I2MBZo0Q58iXKUul3IylHP
	cmbkU6acjNSaXDOPINQWOMTV+bihURpPb08B4mO67eDtf60qarMAsOTSy9Lp0AVy
	VKcBxfRsgczVgs06P7BRIi2VVcaB/jITtJtA0IMrftHo0GRcZQb7roj767w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeer34h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 06:40:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so3926768a91.0
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 23:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780987258; x=1781592058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c75jWvAaoCApv/IIOdNGer60GpfGqCeVoO2cPGCyclc=;
        b=NmeiTuU35xt4YtKrqvuWjDlQit3SRfAhAHfVnFUa+5Ux0PhmJkbJ5cyGclIe6oDbHL
         ryNqaNcDcedv7GGOVJELjX2ya7fdPLQlAVXU7PDkgXtCbnVWWtK6TTMPRSYoY2EK8ypH
         mhUfRuY6MyUpzY7Aip0GDAchuJiMi1sa4lWngPpC5rRo8VtBVTxPwsTgIH/qxz6RWlOy
         t8P5imWfflHqwv5vC27f+hrMqfEdDK2TeevEDu5lpTrRc/2p97gYGqHWPHROY6NDZOJX
         T4tV5YMboY1rnnkx70mHezCZAHbRp58zWFKJ0ANhBnSQRZxa5D1iHWIiFc2l2BovEG17
         JFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780987258; x=1781592058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c75jWvAaoCApv/IIOdNGer60GpfGqCeVoO2cPGCyclc=;
        b=f4SF7RaZW075By4P+g9teF7GcxYGhTyhrVcWoosM5wQgogMeosQABNIjbRIAKb6nas
         uuu/W7qRbgbCZGcwgXo9TcSAo3Htpkz9Vs79xIJg4OfVlgs7/MJZUW3L1RCvsvx9sYfr
         Jy4ftNQTrCRpZvYXs/c2Pc858rLpCw8r+dcd0p4wdnFOcEF1oTdbYi6HcNeQR/fSYtD2
         bUKedCJm1QrsZ+xSGsNZrrBqx+OJ0YJPMsMZD7Z1Lf2OMeWXw7Ami/xskzIsYae7jk46
         /cpBYiT47MpWO80V1TmZbHkQ9SxkzaCbpDSY2YTTnnoQEg8A1YlsgnwNpDcqrSQuLoWr
         WYmA==
X-Gm-Message-State: AOJu0Yyg0CFb/v4MBTyqH+GLyFfg1Kq/7gYixYLng/Cbo3okz5Y+VXtQ
	e/47qLtRNxxsOHvwgtwCEcHkdK+tK9WobjzBAB/yVn+NnKizOh/NwF+r36BDwe9ZtIZePh2cdcH
	LncY7iGf1Eaii5pPTvcZAb5lARA62noyp5+znRgB3GEJ/IWJjg4Jd0azXa8xYDTql4Q==
X-Gm-Gg: Acq92OGQ5yqJrzLzpcLa1FPrSRZHeUYFxMHwgD0BY4bJMaxzR0hh5R3QAcj7ZdKyTjD
	6cFGJVwLLTv2Z0E/HV2PP2RuyuL3S2SVQe2zfL8uzRBTpr9SBnyxBW23hv8rOmu1tV6Qsh0gpEF
	W5tiHVQ07q+IGrNXKEFumtl4iXUQzU6gmaxgDwTmM9WP8ADkQcfCQcSo3U5Vai0znZZ3pszbLxd
	CbQni/wGa9NG1qLE1x5oc3jZ2F/M36cuSzGWSmbBwYBfb/wH++rIeiBAh1jQxkynCDa7xWCK9BX
	i+T6e5Ah5NF/l26T3paPjEAOYLVAGvhdrBSyaPZZu0a512aoGDzXC7wYOmYW3X3LRxAyPRxqXIA
	IEnrSb7Ipqck4EN8ybA5lPPQu9HHQsEYIlxoooKzIryIcokY/DoQXQHz8Bh4E
X-Received: by 2002:a17:90b:3ec6:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-370eeff5ea4mr21160274a91.9.1780987258485;
        Mon, 08 Jun 2026 23:40:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec6:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-370eeff5ea4mr21160226a91.9.1780987258054;
        Mon, 08 Jun 2026 23:40:58 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668f9bsm17898953a91.7.2026.06.08.23.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:40:57 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 1/3] dt-bindings: sound: qcom,q6apm-dai: add optional qcom,vmid
Date: Tue,  9 Jun 2026 12:10:36 +0530
Message-Id: <20260609064038.492641-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
References: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a27b57b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=CLXHBV2uJxG-_-RflmEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MCBTYWx0ZWRfX8paRKDNg3nj/
 v/92rCQteXvOHdh2DBJ0m8BoJISh9urQjbw+gaH6zC4/yfvezbrd1y8CxCte9EhL4JXErKn4jMl
 yZ299dZwZJ2vUSJ17R8fgFDV7o68lwv18vCKtx1UxVcGLyCR5H8pSn3TI99ru10JmERxXERKHGB
 jh5KrKV50Xzo0whUYV90qPRCs+JFx9cVV0rviG9dXrLfxFOA6GVl6dLZiWGgrqf1Ay/fC4EKINU
 3/OydAqMaxkrQsyw6zjrX6gZWeNQRhayBMv51676lMEBLel0WV5A3TJPTOFqoC6m3JPyKvJe7cA
 vPtZAdCM9h/n+eyZoKBKDwg4bRxdenWOgF5/zw+Njmde8XUkXWWCECeW2QYlfJDGUorYHTdAUR6
 r0Rd7aEX1QKF8QaV7zL8TSBsslVmf1BfalHit8K7FWNyQzOIVH41Pnn/Ij+Ke0X9ZktJKVsK/ht
 /w3m5i9XJMxRqfnICFQ==
X-Proofpoint-ORIG-GUID: 5_jrhmDHCA_tbH_wTgFtdc3_QfWSNegx
X-Proofpoint-GUID: 5_jrhmDHCA_tbH_wTgFtdc3_QfWSNegx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090060

Add an optional qcom,vmid property for q6apm-dais nodes to describe
additional VMIDs that should be granted access to PCM DMA buffers.

The property is optional and bounded, and driver-side validation will
reject invalid values such as including HLOS in the list or VMIDs that
exceed 31, matching current SCM source-permission mask handling.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 9e5b30d9c6e6..b767625985a7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -20,6 +20,16 @@ properties:
     minItems: 1
     maxItems: 2
 
+  qcom,vmid:
+    description: Optional list of destination VMIDs to share PCM DMA buffers with.
+      HLOS retains RW access as source owner and must not be listed.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      minimum: 1
+      maximum: 31
+    minItems: 1
+    maxItems: 8
+
 required:
   - compatible
   - iommus
-- 
2.34.1

