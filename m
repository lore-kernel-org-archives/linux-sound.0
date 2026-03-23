Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B09738424C
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305554; cv=none; b=Klq3BVwTplDD0o+YA49tHpjA7GA9tsXuJF1XZnX6I1ps3Okwn1z8/uq938AnfHt3+wNCSoROiNYPahLFoEdRhEwqbjoUZFNtNDYCdar7J9HXuLd3DgxZdDbiquP/KFXfNa63I9/31defcLkhKDA5hkqpdhzykghQ/SihNPc2EbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305554; c=relaxed/simple;
	bh=UZ+5z9w9M74tpzVL8QkykGNl8XDOPEb0MSDzyxWPUz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIMahDCKTLC+9KuKnrmmAEeZs/y4LOFQXiDLU1mFHNJMKVm9i37Ob2l2sDu/oQJP6n+VqiCpYgPjfe7kzmAnMrJRHAoGab3YMSbTXajQPrF2v6Uyk112sjOJTZotPCJOkSNOw8kbo0x29GzsBWBRWZ40GGenw9dkRohi7OX2L5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiVQExZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=StIdLYY3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiVQExZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="StIdLYY3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqesI362575
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z0SMcOHJkzd
	ixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=; b=ZiVQExZU1enGt0QJtVH3pBGfkz7
	AfZcWpcNZ1MFuBqIH56MA8oQ0jvA3Fa5BVDD3cw32MGreuVJdKCnE/9pXrAc96bA
	S5NiMfNR4w/MaRiCgkcQUqHk9uXcfPwxwg+eZK3qbR80aXTz0b3QtOUGlrmb+qLk
	AVlFoShZJVkoYrFzCxqzEGzkJqaQDX07+Oy+Miz6m/AKj7V6Auh3J5rEVjD3OC38
	sXDtvAlcCeWmg7WAIBR/fM4lUdB0eMSuA613oqW5sJteWRy9igPtsPZMJStp5dXM
	MNvbGI4bUgl8Lzi/DWzTMO0BHOkI3xf9B98Ffjmjami8yX5c3ki5TuPQ2wA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k32eb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093b92f327so347589821cf.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 15:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305546; x=1774910346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=StIdLYY3+IUst2PNg0r/dFHDYqIl1a/nt4g9TRcz0V+ZNmJ3wsNjJhEM/xKYd9aLeZ
         GefPsVGN22b3t9e/38Fjbdcj132CaMLPK0jb8x+PC2CQwhkF4mEWvWb5kVrU74RqQ808
         mGKbiSjZUdQi586bDyuW2lteW1ysY69CemMcK5MGz0r9vrY2rhzV2sb1leaiTKu1CW3s
         Vms34URiYKmZiXvRk69RLHpOeGEIScmyRplvmoG1x2FVNFzkMavxNaK/PMX4mtOfRMAH
         OlnuQYl19k0nePKe98+FA8VQW4MJbXFWx5rUe2Y1UyIEhFZ8PEyy/gkMvT8Lzh2jmHev
         hg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305546; x=1774910346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=RQHkaElRQY4IAniJFsoUTBpeVTlMDnTfh2Fc8sE11+GwYDO5uw/qtnh/SIMaEui75j
         f5wZdP3yUE/t3MCxoauy8HUREfQC5X+4wdS2l4wvSQLaZBayoRN/20lgqskSIz0q/UPQ
         iETX0WXYTCGsNWPala6SDFFe65tSJcSmBqD74kc6rNYcQ31XfRksRjigouzac7OErxy1
         S8UDJO70HRdY9orSsmg0FO2mMC4YHYz+bV/1K9CaWIddSzEGHjpE9XCZi+GHv5C6D0gr
         G1Nlm0wembY59+gE2ohqYsdaDGYYsJXDRbUj9hU6mQDUe/BPS1hxmuYsnODSczdv9qYe
         CFNg==
X-Forwarded-Encrypted: i=1; AJvYcCWaFKh9GAvFTbBVUIFmhgyHu/tcCb661UxJCB8uZ/ekIWcNedCWL3BfSKjbiZf8xVawqG1m8XUXi2w51w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ/JuSIzFj8cUKe98+Kn/7Nv107clt11jQppJr5oCA80kzV7av
	NskIrLZrHJ6Fv/I0YkANpuqFtd4NzUt2UWugDZmUUNpsRA5hE3KZhvGGVadwoSEOiSIMwAhI+8H
	qh0SjlBsByuPmx0YqpPz0yS058hWeFkQLOsznZFi9TllBMazotSWNnzri/GMvBUFU6w==
X-Gm-Gg: ATEYQzy0nnbxY1rHR6e2T/5sZgk7oR0FmJu3pT5Gmv2bPzn5HTGJKvqTI7C7GA7pU7L
	8aoWFkBgxy3r4yae9ZnlLf6tifkAW3UJbqylaGv+5w1059Hhcc5jAltXSwWn7onu/BNYl9avgp1
	EbXpdxIkyr5XukWFdgiMWQ9Z3d23mSDQwAMQVuv+y94M3/idkoB3Aa0cisN0XEQt094079F8VcP
	0/LZHBpihuQZSS5HGpB9dGZEbWZMsjY3pJew158Wq5/Pj8iPV0zZJFqdf5HNq10VQia6mEmfAF8
	7zRJJsmn/NM1MEpNk6xfcEslXsxmmF75yD9sXKeEg7LzY2qCuGCnFAIhfxTb4b2ZX/aJ7Tyh6G3
	qpuj86/onyWnhwnXLarcmATsitqZVGPVFCC3gqrAcIT21OcPPXKg/upc=
X-Received: by 2002:ac8:5d4c:0:b0:50b:4001:ae11 with SMTP id d75a77b69052e-50b4001af81mr186284031cf.57.1774305545745;
        Mon, 23 Mar 2026 15:39:05 -0700 (PDT)
X-Received: by 2002:ac8:5d4c:0:b0:50b:4001:ae11 with SMTP id d75a77b69052e-50b4001af81mr186283741cf.57.1774305545284;
        Mon, 23 Mar 2026 15:39:05 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
Date: Mon, 23 Mar 2026 22:38:38 +0000
Message-ID: <20260323223845.2126142-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c1c10a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6P8UuP444nAwg2htitIA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX+EN1pQLFK43C
 Sy5zxKmMwk4UZLIreHECpD+AYvzsGH7RAewhfog31AsuqQPDdSDSlQOsnxP5dRlacRNjCYz3l1M
 zfeUfb7U8ICvziGMn3fxZOVxY/RW4yc5dEIPRHfB4X8Lg2P3U7eBwBNnpEMBMw/TRSbDns2oM7W
 /freGW9I2l/JksXBuSAL98hJd3df9GOcMRye7GX/jEGVXoeS72YNsBDi3T1Hdoha2CtA86KOw2F
 EkbSkzrFcSAWCGu0FFeIQo7qayBIl6SIIsf3NwQzu5bVUVJH/zBgotlvrqXbimMPH0g8AQfwuqM
 jPmBmdEm9cHFSaa5F5moNdXyB2PoyZ6OZFL6ZvKr3eR4HhT6uYL6qQTKEQmvYzMEXROhQumgA+m
 2v8lxbEmUHptDL163+L6e1VVbEhqsZ39VDkVO3ghl7OisOUfBQNMvBXkVUR8Mip2e1uKsFc5JfH
 3B32o/DI96iLP+6L6Jg==
X-Proofpoint-GUID: 0q2xZUr547A975KwdQTLrDnMXPZefLzC
X-Proofpoint-ORIG-GUID: 0q2xZUr547A975KwdQTLrDnMXPZefLzC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167

Add new dai ids entries for LPASS LPI MI2S and SENARY MI2S audio lines.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml       |  5 ++++-
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h   | 12 ++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 08c618e7e428..2b27d6c8f58f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -126,13 +126,16 @@ patternProperties:
             reg:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
-                # QUINARY_MI2S_RX - QUINARY_MI2S_TX
+                # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
+                # LPI_MI2S_RX_0 - SENARY_MI2S_TX
                 items:
                   oneOf:
                     - minimum: 16
                       maximum: 23
                     - minimum: 127
                       maximum: 128
+                    - minimum: 137
+                      maximum: 148
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 6d1ce7f5da51..45850f2d4342 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,6 +140,18 @@
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
 #define USB_RX			136
+#define LPI_MI2S_RX_0		137
+#define LPI_MI2S_TX_0		138
+#define LPI_MI2S_RX_1		139
+#define LPI_MI2S_TX_1		140
+#define LPI_MI2S_RX_2		141
+#define LPI_MI2S_TX_2		142
+#define LPI_MI2S_RX_3		143
+#define LPI_MI2S_TX_3		144
+#define LPI_MI2S_RX_4		145
+#define LPI_MI2S_TX_4		146
+#define SENARY_MI2S_RX		147
+#define SENARY_MI2S_TX		148
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.47.3

