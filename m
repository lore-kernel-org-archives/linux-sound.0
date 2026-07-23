Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA764582CE
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804560; cv=none; b=jHoFR1j2Kr7vlW+vYWOLr1auvERPkSHICJDkTvVDIkCtaNeghPpAXpKMka0q9MUeP4rAsHFyx9CBvTPy2+bUOBGcLfYHXGMzvm8xAo10pg53ANObY9cmGzY7qKn0LDbmH9QX166e6F/ZpWs3RyksrYceCken4stQwuvXTLvJtxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804560; c=relaxed/simple;
	bh=gVQBnEi6KfpZxNVfJW+f4MjonEtxu8zuPVunuzdXreA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F2omVVI8WUJYC6ygvuVfEU6b0czzzdKsOYQV0c+lbwUwjJLRJPz74nGKIGqJvJ7KTlIH+HUHetKO1Df37Mh6RiSENjmni5vwwa/pwiYktq3vozpbAOODsFFJid8RnOGpv2vonxHn0di5eWd2DHuAgn06dF6JT32/Rw6DkpoNbt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hs9vDMyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYsesYWW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hs9vDMyN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYsesYWW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qxWd3789846
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xMGxsZrM8YF
	EKIw+mBat0Z0b9cENMeFop/qw+Rc0aSg=; b=Hs9vDMyNMX3/QuR+0SBWZ2N3D8j
	jdgTZdpj8r1Z01JzPWqZfIQz+YvTfMW0cPpUxH5PitfpqcUI0+Sfb+DY4yuYXxvj
	tlkoPQTgMOcDXNHWEie+qvf6bk4HdyzNYH1td2eJ1PLX5imoHkx7NrijAZXrhMpn
	VCw/fnsL1Tnwn9xDxsJ3a1Z0CsrWTbkcNUiWjD2VVg/oGz3HPBJb3+uHE0XrGUmd
	HVotmik4mGyu691k5YBhZv1N3TFsGTpWtMTpu/sdl+L0wZB7Eo89tgF1Tz9xRmgo
	65IxuXp94jGUKeA5xsCrreUrfEJkcZPaX5oOX8R1kJYCcbEXU75zLCMECIQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b52etg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:02:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38edd45cbc4so378739a91.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804558; x=1785409358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMGxsZrM8YFEKIw+mBat0Z0b9cENMeFop/qw+Rc0aSg=;
        b=NYsesYWWmaLjZeGA1Ab/84v2A6HRuQxTMhzsiw8LLZ82TYxEzTotlOGOC3eKPsH26e
         XkgxGqAbGf3NpjmxvcZVAvEikXgGKIVbfgjIyuh75bS5FiAfx5d4CRPBglAVDBn4G6l7
         hmlknBPhfDT735lWqhVDShHpiBmS+NGxJcVPBoMlv4wmzhyDP92V60yarghPVsu65WON
         8yieDdkqqzOtX4QWX4QVM7MijmOD/a4zNDKSo7mmaa0+gSV49EOhq4Zae3OJOm1st+iD
         m2ccQRY2J1IxNjucdOWt61NlnhUyyx7yBbEIMF2RYAmrC0UhcY0dBgnZVzbmiPmRmsGS
         Tljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804558; x=1785409358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMGxsZrM8YFEKIw+mBat0Z0b9cENMeFop/qw+Rc0aSg=;
        b=cQwnBmCfPiNz2ionPU9yhjOt/U/UhKNAiU5q8BrWXFaDoYNNCsjhlFPGultTarNzlj
         qDcbnaUkPEg+Oc3dVsS34s0RxQqMMHnF9PNq/gs9qF6vPD5fKb0ZIlNXAOICDHnlefSk
         vNB7QHaiWgLgzRtEsMM3HjVPKuNC/HL84ovAQcYQ7u8QO2jWSV0li3l2WUjX8psb1iam
         0vPRgln75rzk9PydByQICAM2XLG62D6LJm/P/pNgs9oyAn3pgQRp4BEuxPcbUSO7gANK
         Q60+jGXZr1PC5is0fWhEHWhzX9UhXMd4DrAMA2s2WHWI4Nat4Bxy6jPM9bmUJWTBfmfC
         lhsw==
X-Forwarded-Encrypted: i=1; AHgh+RrErN+Bu76LfFFZ5Jycy9g08ntq36cYL+tadEzviuqwEnul3+Vl5fODFcbSPyqniFFmwKrt2Hok4Y5IKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGECLl+eqXrgWhweEE4iA1DwOtHUFF/D8qxrtxMp/T5mVDyJha
	H7m4jeX7xKR2VTTy1WUuTFcuIydzxwbXtrOzZ5qM6rnJq6Hct4IeLs49hYdj60X73KEK4PGBIyG
	0Jpr0D6+swsag78FaSTQesurfKiQBH/xQwidt39vapDBx6peoXo16UHa9qsc/9OPjFA==
X-Gm-Gg: AR+sD103mkJaV4BqBoB6tkjfgJUc4zulAc8/e+vdIU6nTQPLnjvcCtN9jz/H01YQin2
	7aEIBW3umF8UWOTb2LIfy8eB7pNpYjoXct0x6+GtE3PWI1scjeYvagsE3+ao8U/mnGZlbAVXV+y
	7h8STzzsE8x6geeujkXVXhEYO9QP/MflxcolgSqd+pYU82++yuOWlr2Vl3tg8MPSisgyfwLGngs
	1qPcvQHRlWXJzIwBpR3zC6Lq5jwfgEJ46NYNuuEeGACLXY9TrUW7zt+HGh25u2Ay1BU6H7ctvLr
	yJutDMSwMm4y23xz6CImFCKA3hiFhfU7L/eqwsEK2bT5YR+XrUsPDwQTm1C+kjLuQCNZ2ryTG5D
	In6dD1zpxhEOC4v12Tg==
X-Received: by 2002:a17:90b:1802:b0:38d:c50a:714 with SMTP id 98e67ed59e1d1-38ec6a51c6cmr2618601a91.27.1784804558010;
        Thu, 23 Jul 2026 04:02:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1802:b0:38d:c50a:714 with SMTP id 98e67ed59e1d1-38ec6a51c6cmr2618532a91.27.1784804557545;
        Thu, 23 Jul 2026 04:02:37 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e081985sm19639783eec.23.2026.07.23.04.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:02:37 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
Date: Thu, 23 Jul 2026 16:32:30 +0530
Message-Id: <20260723110231.1586417-2-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723110231.1586417-1-sarath.ganapathiraju@oss.qualcomm.com>
References: <20260723110231.1586417-1-sarath.ganapathiraju@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX6let6IW2+q3t
 m1nOTM5dtxLGf1qPLN+DFsfd03dnzFgpCSGFu+R6/AY+N+MflESqj7EAGBH2gdttEOy/eDcag0A
 7ME2G0lN/Iv5o9iwmKqo/lZvnT+/+t9ERe2CIIMNYw8ikUnO34kFvCb+WHxmz8clkLVZJPeyqa6
 ym9p2cnzbpBOD0E6eB9B+widkyAeoSD4NZ2LIaPehKyKUM4ziRxmc/f9EicvrQ08i6RcxC/3fXL
 hlWe6T6S3EFaG8rAKnf5e/3CY1bMS7iFfvC34uHgPlvIBaMrIocwUgWnSx3MAv+mtCeYHNGa/o9
 M53ZYOTwbSKS+gjL80GVEpNPKApFEHVAOl8MkxMQRZv/q8GnNFRQPGbu+17HilSMDPm2l2zZdRk
 cG8y30yI1VVSI9pd7R7IBc1Hp2SFOr0sSuOP3K4UAHOphlNtq8ex+f60MIsnUIwTvKR6HCZRcWu
 ejkZ3sLXHBYh4evCe+Q==
X-Proofpoint-GUID: UVoS9JfUaSncIt88z4pSy5189W-yFk15
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX/1KfzYKVnFOt
 6VPD2dcqZ2dKX66BRozMW7j1/VjED7Zm6UZNRtoHxobRafvRGMSx5oEUV5CRiwEaM8QH9klqKPg
 k0AcUXIgPUHXv7cuZ3gNBfuELpi3kTw=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61f4ce cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=_iO14NNoP_ubr7RZT9UA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: UVoS9JfUaSncIt88z4pSy5189W-yFk15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230108

Add a binding for the Qualcomm LPASS VA CSR rate generator node that
exposes the lpass_heartbeat_pulse clock on hawi.

The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
start of the DMAs and Codec Interfaces for the audio usecase and can
serve as a periodic wakeup source for the DSP.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 .../bindings/clock/qcom,lpass-va-csr.yaml     | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml b/Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml
new file mode 100644
index 000000000000..b4bc33a86640
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,lpass-va-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS VA CSR heartbeat pulse clock provider
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+  - Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
+
+description:
+  The LPASS (Low Power Audio Subsystem) VA CSR block contains a rate
+  generator that produces a periodic HeartBeat Pulse, also known as
+  the RateGen Pulse. This pulse synchronizes the start of DMAs and
+  Codec Interfaces for audio usecases and can serve as a periodic
+  wakeup source for the DSP.
+
+properties:
+  compatible:
+    enum:
+      - qcom,hawi-lpass-va-csr
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@7ee0000 {
+        compatible = "qcom,hawi-lpass-va-csr";
+        reg = <0x0 0x07ee0000 0x0 0xe000>;
+        #clock-cells = <0>;
+      };
+    };
-- 
2.34.1

