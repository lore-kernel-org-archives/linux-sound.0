Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81D51E5B88
	for <linux-sound@vger.kernel.org>; Wed,  1 Oct 2025 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330822; cv=none; b=W9ZrycdgVm6t5kCUqiGkR4XbJscXwlgkxz/QLeGowrQUFnxfxX+paiwbLvSLvtJ4kXuti/1/8rS39FNKaAxF0pVBRUCLrYm4bH33EWALrnZ3i6znIeHRzJSW9WctjktZAwW7wjEaghpGJ2PhLEzFEgIEB9z09g+QESxb0ykJNYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330822; c=relaxed/simple;
	bh=rrOC8v605BCDBPVmayK2iE30qmCNfSK7T+Vnosdb5Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JwCTTSuaabvXrrIOygG0XO9pZviHaHeZJkzCDJUgtOLgZB3QeOi5MRSXbcpUogHB3s6cltiMD5+esh2HDZfipEKsIYlIHQt0oj0+LlZxC913v1VdV408WLOzLG0n9WQ0+qwMKha/iLoBmKC0hoSDwHiz766RTR+dyRZIUU+CNDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrvEnoNZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrvEnoNZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5919KLER002357
	for <linux-sound@vger.kernel.org>; Wed, 1 Oct 2025 15:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=98Gzg36v+XGldnSVXhb1o5X/kk59eIv9iOf
	72j0wzB0=; b=NrvEnoNZCxX8fSW/28D4O18iLRakaQcQL+cDxGPzfAsw0tgjV85
	WPrkpdMZg9UE/PbJ/CEo61AxQ1dLCfQfvdqJ6PFVGev+Ngr9Em8mZQ33dpWzbkgj
	ogJ5Wn16E/NDDjA7NEdRdvMITNcmhNNDCpsjDjw8GNPveS1S5rZG+obRDwcLLkM3
	v1UuFgCD0n4BOkMirCWJC3gH0XZs1e5jP/FWS21NAyWdfrFXQOVt8S3H8iTk66Iw
	BIc5yVTECXPZzxQ0xU10GKPk0Q+LRvPUgIHKFupokL4mq4HDq44IvjmaOL/5SrPR
	sX4ybhaRwRzGcRE/PyNPQuFkAswL10XX5Uw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr8cmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Oct 2025 15:00:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dfc05dec2fso145296001cf.3
        for <linux-sound@vger.kernel.org>; Wed, 01 Oct 2025 08:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759330813; x=1759935613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98Gzg36v+XGldnSVXhb1o5X/kk59eIv9iOf72j0wzB0=;
        b=AzSWmG+o1A60r2O0rVxb7hxxEiBQsI5LidhcUizOGAk5zZ273Q4BkXocwhrCSATbBc
         Er7ErCLDTukJbW14xi/Sj8GsuJr2cSOVJPhs58Jlz8o2mO4o5wmEhsSHG4U/827X8BWB
         iYuZ6evtTPrZ8pioMVDQ8mIYTw29DDBCcrFKjHZUh25qw0mW6SIImEN46bCO2X5dddTQ
         PVimL11CIOCswTZPwmGoNATvYF+j2fB9V2ncT59kgua4sbY9BVfZ1Oq93qBbtDmylUHr
         Sz1NU47IxxO9T+wzooyMNTHirZm+0E37yec72wOHUWGGe4l/krQ2RSLRsbU+zdLLyJUJ
         7xLg==
X-Forwarded-Encrypted: i=1; AJvYcCWWY5REL5I7MwtzzhE7v+kA/Ltzn7mlqi1AHyUvDlvb7t58iwrxptCaj8YDEK3QY5kjYsuFFnmVnS7Haw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdG2FL+olfoo4cEJkj5MNZkh7J47aEuxvGROvIGe/0BKBlKTM1
	KX/mQA15YHmwPgkPTpuEIIDL7VP9QZSxsEFWsCH2PTc1W+ogqzv8SYonyCEFSxIh+rmu4XwE0rF
	CWfalCWw3+Uf28735YXwmR9cvxkeOSHjHljCVQTe63eidP/Aif4Y3EhuuHLBAYSwpAQ==
X-Gm-Gg: ASbGncvoQm1BisImMWavdtkN1bwI7Ty9tOjLpm48rX9T95i2i8lV6sDGo4rzzvGq63h
	p5OSyWMh6OFHjITaIwbQlVJBngohJg70FXcGsSY6ZLZLeQ27PTv+rpvUq3BQco8IM4snxAmyVEI
	TNiqVMEVreK2wE1V6JfxjpROBHmE03Niui+XrN+WdbPgPOojue8R8szQW/+IKmIYPp7xXCrswop
	2KaANk+xtCgMHxTENmZ5LTnY6BVsgn05WJXZXv5B9j1T5IMkfbzYJQWAyfgWVq6vzf6rFV0kBT/
	dt5TmEno4j+GuQEytT1OHU4A4wIJiVLn2i8uZieHMICXwgwBgHuw2iLvNnM=
X-Received: by 2002:a05:622a:309:b0:4d6:acc6:752f with SMTP id d75a77b69052e-4e41de7315amr42568971cf.69.1759330812950;
        Wed, 01 Oct 2025 08:00:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx571d49HxGU0B/X9+gUUZRIikwYyAXb9VNnJW/EZEvrFqfK5Fk227camoyVPoXwaLVq76mQ==
X-Received: by 2002:a05:622a:309:b0:4d6:acc6:752f with SMTP id d75a77b69052e-4e41de7315amr42568091cf.69.1759330812235;
        Wed, 01 Oct 2025 08:00:12 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b69bc0bsm37147955e9.3.2025.10.01.08.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 08:00:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: srini@kernel.org, robh@kernel.org
Cc: krzk+dt@kernel.org, gregkh@linuxfoundation.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: slimbus: fix warning from example
Date: Wed,  1 Oct 2025 16:00:02 +0100
Message-ID: <20251001150003.417472-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX0fzkSYNQO98Z
 QukOvlWZT0ScNblv/TgQ9TXfJMscEFpCrvwt5Mqii4VIaSwpv2C+lKcJbXCYYEtug5EoAK6xbDt
 hqdwIKbvlvaorPeelq4vBEe/c3MyMCJNTFz9stSSsi7IdcyoY/XUvmFWT1HbFNtsAxb+/Mep5M9
 RvnKeGrFxKRZPMH49PQ1AT/7jw3TixkWlyMSSju6qDhpq6k24vuPNvWHInHMVMpvIOCSbjHw0FU
 jJ2Rd+GIyZAm4xvFPalTlFnaZ9CcH2F0I1EuBaXAfg4EHZCO7THk4G4ozyYe1OnzIVGiHETu7Ay
 qK2wcmWWW+W9cc0TF3s8EI8uxXnTEkDof8Gd/NGZwfzbnkpgq28VtrPOcw3wNIZhE5TL7akPYyx
 zr113IDJNlQtKBW9SmBkmAQLUD4Mxw==
X-Proofpoint-ORIG-GUID: 4KQBtAM_s-5KqCcG0G3DORXPfVLBb4YR
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68dd4203 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=f5vYYIzMdUIQFJOv_x4A:9 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 4KQBtAM_s-5KqCcG0G3DORXPfVLBb4YR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082

Fix below warnings generated dt_bindings_check for examples in the
bindings.

Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-codec@1,0' does not match
any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0-9a-f]+$'
        from schema $id:
http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
slim@28080000 (qcom,slim-ngd-v1.5.0): #address-cells: 1 was expected
        from schema $id:
http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' is a required property
        from schema $id:
http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-names' is a required
property
        from schema $id:
http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#


Fixes: 7cbba32a2d62 ("slimbus: qcom: remove unused qcom controller driver")
Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/slimbus/slimbus.yaml     | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/slimbus/slimbus.yaml b/Documentation/devicetree/bindings/slimbus/slimbus.yaml
index 89017d9cda10..5a941610ce4e 100644
--- a/Documentation/devicetree/bindings/slimbus/slimbus.yaml
+++ b/Documentation/devicetree/bindings/slimbus/slimbus.yaml
@@ -75,16 +75,22 @@ examples:
         #size-cells = <1>;
         ranges;
 
-        slim@28080000 {
+        controller@28080000 {
             compatible = "qcom,slim-ngd-v1.5.0";
             reg = <0x091c0000 0x2c000>;
             interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
-            #address-cells = <2>;
+            dmas = <&slimbam 3>, <&slimbam 4>;
+            dma-names = "rx", "tx";
+            #address-cells = <1>;
             #size-cells = <0>;
-
-            audio-codec@1,0 {
+            slim@1 {
+              reg = <1>;
+              #address-cells = <2>;
+              #size-cells = <0>;
+              codec@1,0 {
                 compatible = "slim217,1a0";
                 reg = <1 0>;
+              };
             };
+          };
         };
-    };
-- 
2.51.0

