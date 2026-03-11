Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A586F3009D4
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243359; cv=none; b=WsO97FkbENofPWOU/xlR4t/SeGIi5RK4XsVs3EAg3OsNcfgX+jtAX7eHjWy3O1xja+qEug/QmqcBY5LD0syCLK6m0mQa2XXKCoVk8LAoZHFf1lOLGcsAe30A+bkoQRcfOtVqdYUDaF0OxuAF4QGDVmE/PxtebSD2M5pRrdwRCrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243359; c=relaxed/simple;
	bh=pNwFOm0Wh96y2hU36jI8YhwLHAj5jF2XiNkPbx6ov4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TuHrXjPZKGQnm2xWF70bNpLvbAa2OMQE445fyeU3Am9WN48a+UlGsKoro9RQi1Ygfr0ufen1JMqSJvf72OMOeWL2OPiSNtJ0P/KGWjdXWhSDEoDWnitoECoYv4PuiXxCu6urNiZ71YgZp2Z9pdm6F9Yb1W54aiwjXsWU8vJZaKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSz20nBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jrc+ZdVo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSz20nBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jrc+ZdVo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BCM5921439671
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 15:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=olpuWjflpCrEijmH4haIO7FbhHoolMIpYw2
	2yV90U0Q=; b=HSz20nBCMBL0yBfqMChXRVioYRZCNm8gZw+puIeRwcWLe6S22kq
	PoYJ3euZVl63MR7x48fqdTGl2eiLnLNpqIubtwtzIDUArDL1LVkqC3FG70Z81Dx7
	qdI4n+H2ijoTGkK8iqd1KwWayM+KqY6yYvJo7nNV2tK840n0BsbdhHfIEmSH/uic
	8m7oq0N0NDMafJsCUFIHpDPUF3AWmfwcXEoTXTNWdYzLZ03iWQubR3kDzm5rReQU
	iMjtTFFhgdnVKjO/zdGThulgRZ57KYN402Xs89ALButAUj9sCcK6dDNWaR0O4flu
	0qtm0HQhc1YFMFkVFZoRqz1z4RPy7KzjOag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu38yhyny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 15:35:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091f12ed3bso201847141cf.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 08:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773243356; x=1773848156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=olpuWjflpCrEijmH4haIO7FbhHoolMIpYw22yV90U0Q=;
        b=jrc+ZdVoDGZqSPAIf/s8kbqH/1mzWBh/zGF+j8ZKHHHsv8vQ/U3QkFkoePnh7DLte5
         uO7o8kx78BCEke6woZDu8VP8mT/pGgIXYRZCne/Lv6ASf/NjtBgM0DjbfAvmwnfE+WKy
         boEDyvnvlMUx45VxkABEJVn5c/knfnCm7hsucACicT3KwQVyEWPVioIk4/0xNz70hqQf
         GaWxGfpujQHz1xvfs8oNPWd4JcJMerNC6eDB+CO4KQM52DuprGqV0KfZmyb+LbM5n8ww
         sSaa1ZmV9D2SGgoQsNCjzFmqhMfGZJl1YRx7cMsuH84nrh6nu7NvGYU7yRIaYZu5fP7J
         eCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773243356; x=1773848156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olpuWjflpCrEijmH4haIO7FbhHoolMIpYw22yV90U0Q=;
        b=EubGyCWodVMe46j9alhHz9uxbWMdejTmfwXgmtbkanKLPZlSfBKuq+XxyTO6pTUVxa
         ljvRUeInvEFdGwWixwC54iDYSDwh/mLlFy6AWg6dPAqXG/0rQDfIprugsCjAdxcTTXRZ
         vh2i66CewJ6v9B7Ip5Gd7xWW5heiRxH/6qRmqsJbm6ouZt0+Lqfig2rMxAr5jqxilHM6
         EEJWtAaeOqSGw2gelmhnBt/rL3bniFAZl1fzGSGqGvLdaxyH5i0XS1f5fVxDVl2hjEKl
         4gqE3zIXBORLe8cr+TkXX9pDgSqli1Sw85pyPStpIk5BGW6F4F0t9kZIwgMhvdQTZfPu
         QeYw==
X-Forwarded-Encrypted: i=1; AJvYcCXll2DnQ8OLTGro9xPSutrzdXDZ/VMOTpgnDM7MiicsnHlANvZx98ny11DbFvBG29wXILuAowFOwKMOYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/UFmwCCB/DwIeu0c8KGa04Tcn1Z37nvXVIcnVRequX3l5PVzB
	15uvl6ZjGreGD83Ej6yQt2g0s4K8WOGN/BVx/+7O5FuaRGVkxsVbCQ8w6t3DrU6WHpecqWb6UZg
	wF9ehXoTKf1LnXnqYgdUkR3ae8qbJSoGtS8IUnW3afDJgaSzXleux1OXaCf7KPYIeiQ==
X-Gm-Gg: ATEYQzxsUF0bFVlcL9uuKkK9HgYZZt4Zgh8+wmN+WXwmAoRm5XXOH5bvzZgXV19z+W2
	9bHDZXh6r9ZsrxrBis5SLbJFvtFuPidoedxGBx5NJ5SL99M584g5tZNfcaDnJz6C2hpPK5C3Nh2
	yr59m+mY60dG7Q7xMJLr1JqTn/xT2sbZtpZKtuUnJkOKPqIeybODBNde1iRFHfIt9+5xepeZM5z
	x/z1hcaUxRy/PpqxdNP8uKCdhaZ42cwbR/2dK0v0scSOOSKbCn/1GdnNwlvTHHsFB7gc5VjH8ba
	BXT5rFEB5nOy2GsL6g6yiEWS/zfRRkQeU0Hb0OJIxgMVauwZ0OWjvNpLwX/JA1pZrD9dcXZEOLP
	vZqXFcLf++30+DmjIe9Z9eU3ApT/UV0f08GWh
X-Received: by 2002:a05:620a:6910:b0:8cd:8751:2b26 with SMTP id af79cd13be357-8cda1a44d1amr390873585a.58.1773243355986;
        Wed, 11 Mar 2026 08:35:55 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:8cd:8751:2b26 with SMTP id af79cd13be357-8cda1a44d1amr390867485a.58.1773243355378;
        Wed, 11 Mar 2026 08:35:55 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854e67ea40sm22028805e9.7.2026.03.11.08.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 08:35:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ASoC: dt-bindings: ti,tas2770: Switch to undeprecated reset-gpios
Date: Wed, 11 Mar 2026 16:35:49 +0100
Message-ID: <20260311153548.94265-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1296; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=pNwFOm0Wh96y2hU36jI8YhwLHAj5jF2XiNkPbx6ov4Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsYvUQNsv+NnuXKnyv+Lywp7hI/VWkMr7MT7fN
 2EUaaBckN+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGL1AAKCRDBN2bmhouD
 1+0uEACWRKCLOCQYgBH3gyLRFbYFfyMrafjvem0REDmcATalrSJGeLBGowKAkCUq5iLFWXRr/Rc
 2JB7dJf5/Bk3noyKgoOjI30JzqFDMiSgC0zJsEOh8RKX87pUaUnUYjdX/PtIb4KQ2+zCTm5uFZv
 OMHhtSdiOQjZrlaAttT7S7Gwna9rsALAEMWEbPLmJHdJ4lBhBYYgwOhT8g8EGVkPw1IJ0e9DW2s
 5wXssSyhNJO1FVW6GR/H9z2lEBVkq1NqAyDO9/CVxcsYcnrLi7HohAbLr6ZcyE1sEYm52smH6A4
 wW3CdMtQwrQO0MQP06wtMgvhVplBjAvHjXeK1ccCR2s6i/G6oY+O2p6c+x3nlzoKf7/9SwvfgWJ
 gFpDr7hgE69OEUewX+p+qOAOh0KtETXQFBn9nfcLg82fOUWaykg4VoY+Rjt5yVHaQgwdiJKMyAA
 +r2k10sV9KGEb+36uaivjthVROuNInp7G3c7SexJKYRVWwoLeIfXKGds9qf1eo2VrtCG3wwH0gU
 Qvw6QNW8PBp0V36BeaSY3Ogs0y0duVfr/FNmZpfoHIksxVB1BB6E8QtBfdAX5eyfb4JDGVabdxU
 rb1rNLKw12MzhzWkjWlqwJNeJBXTnxceeABLyEPMsOZo3y5HONjLauT/LHuahSjDmvL9WNl9GWO J3spVN+ikDXvruQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzMSBTYWx0ZWRfX+N0haw4t96bh
 98AJgDeSttjn9ZmofBFiisSewhbR7aouh7K79KO3WzN8CdY0kt90MO256ukjPt994AcklJ/+cuC
 BlziZXRHbl3MbYFqQv1zwtO8rUKhybwEgPXActKMHnCAu2WPd46GMZZW8SKJgIw3QhNT5c5iKqM
 VMZVr87C/3U13Dd9RXNRuYpQwTpeZ9g9+uLTKQWUps+ioitu+wWa5SwD2X/8gFt35h0ZYqosOez
 T0nnZgKgo1R/gh+sPfZHgUd+knYwzitSaAmHR1xHxd2y9KRKXqKVn7gWpV8HltwoYgJrqzi0ZRC
 D+XB8akqrGfDTvmLd71L0vHDKBiudVFmgq9d+VLVPBLSwP0kXhveYWxqyKPx0ptAvPeNqSJawNa
 PJIqGGMnR4sEqQj2Bj1cjKKF9rwwDfUQvsokgh4gAfQEobyTVKyEWArN4dNVIJlxWiAGSHBcEya
 wOfn+3/4fPokmE3z5wQ==
X-Proofpoint-GUID: 0zwjEb8dPXLpDQWQkbJ-qPdtMFxnmPv4
X-Proofpoint-ORIG-GUID: 0zwjEb8dPXLpDQWQkbJ-qPdtMFxnmPv4
X-Authority-Analysis: v=2.4 cv=Cq+ys34D c=1 sm=1 tr=0 ts=69b18bdc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Qx_qmFkoX_yKp9fOl6YA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110131

GPIOs with "gpio" suffix were long time ago deprecated, thus
"reset-gpios" should be used.  Linux kernel supports both, thus this
only documents desired choice of ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/ti,tas2770.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2770.yaml b/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
index 8eab98a0f7a2..8d49fbcf0b9b 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
@@ -30,7 +30,7 @@ properties:
     description: |
        I2C address of the device can be between 0x41 to 0x48.
 
-  reset-gpio:
+  reset-gpios:
     maxItems: 1
     description: GPIO used to reset the device.
 
@@ -82,7 +82,7 @@ examples:
             #sound-dai-cells = <0>;
             interrupt-parent = <&gpio1>;
             interrupts = <14>;
-            reset-gpio = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
             shutdown-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
             ti,imon-slot-no = <0>;
             ti,vmon-slot-no = <2>;
-- 
2.51.0

