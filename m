Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D0D338F53
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829559; cv=none; b=nadI9emTe6lDubCSx8JL0UA6GGZmnvlHY78MsE9peDJlIgysz6qFD75bpb/AdNppdySejj4Ml6mEN50DX+PVQoLT/50QlOLzZGxgI6putLHrmuip80zHWRCwQnzU0wNbjIBTzWAoDZcfq5Bmfp2z7egHDO6Bm0HuXHjNm/VAqlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829559; c=relaxed/simple;
	bh=HG+b+jRIRTWPpc1sxXtE1A4aG886oTSQcaj4r4e1v4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWaDKMQ8rR+ukxc7Tli4vgasm+mK3o2xHe+Vp7ZSe+Ge4cdCw6k/swIdUEqpxSfbrwDIpreu1x7/Su8i4lfhkLqaONzFLKLdYbReE30WK9sYYTYUDqoOi/KSgnj0ed9Ols+pw0vkwz8DJk3w+tziEpmRBUb0XYCbQ4SKYjeIfeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTg2TTxn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTg2TTxn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqAsa023409
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 16:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XfwpEgA5iMz
	nAO8LzxBPMwKlKMUGeLCboiF0FAzcPH4=; b=nTg2TTxnJhNoLL9BaeDyIlshZcE
	3FP/R9RRpXL1yQQ2Dz/zhPjQ19QdKxfR530jmSehI36+qqT79hqt3J8u/ZMlZEGD
	A6eqjw+GlSbohphegWsRzYwUjR/Xy6/L/qL64W0z0N1mGGNcy1ALKRFqlIz4j8Bk
	enGJAaxU7XvCmtaqHV8Te956ZCkBjBu9SlJ7BCvuw3kpKL+ccBtuUatfWXiFsxaO
	jIBGPy58JcxYtiicwrbsTczPZw0EW+mJgZQ3H+nGzIwWfIFNYEBsfQve9zVD0k/o
	umajJEAtkKNTR3xyaeWsclsvV7TRZttOWR2WHQNQtpEVnF7wJ68hzIms1Hg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp8mag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 16:12:37 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-53b17394ddaso1982596e0c.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 09:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829556; x=1757434356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfwpEgA5iMznAO8LzxBPMwKlKMUGeLCboiF0FAzcPH4=;
        b=XJ6XehitzqTJ3AHZN32KOCG1nfsGcFkpXu61Z9MWSDAWDffyolYcdCL9Vf3dOiqQ6Z
         qgKamZPK1mmtzRUKuzQSJ7vOOqQ/sKyl2+wZvM7Oe+PAo/1Qhq7ce0DaKxEOBpqWar4u
         o3VBE70W1POoXK+edd/C9ycYvF1YizFaapKsc8wYlOUO1nEphCe+cGJna9MgP9MnvEDY
         0xTDpRWRqDRIX5l4KTvJFXQYtgbiFRXGuJfhcxKShvVFmKmr1R69xhINOeNw7/UwePhh
         FAG7e4cVBYNAMe/v2Dc6poDgJ64/yuvmBAhLVt/V3tTM+eoMU+ilkcXhfky27s7xYCVV
         QcQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpfWmRMntS2X9Mi/cA7vSLGPd0R3Mdx/8EoFJgUDv+sokx1tYgjPrGg9Cw7/Awt0M95eD9tabvPh594g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX5PCTUctHsfrvmkpUF1WEy6U3VVTKQNuznkbCl1+ISCTO31Db
	8itjngDJd6WXJkw3DGEFMbW9PoCVE0oXXTqNe8Yt4mFtOhxq2XDJX7qcXKHaiABhy+BTJCSXk7o
	YgaeRrex7WOfVdEJluQKfcSATkmIjafr50THG9a8cOth/NYyFlP8ic2fJpCcqtZ88RA==
X-Gm-Gg: ASbGncva9A2klwpwsDT7YzNm/gSRW0WylRb3+p4zSyFhAscYpkLI6SM57po6hD2u0Ew
	BCyqT5Pi/jSTqJiIIa+HoQ3kNF29TXNQak+14nsc7MbpUU8eVLkqcJBvqzUK1rmbRoYoZV3l4lf
	IJuUoJwJCRPvoq2tYNLT35A3b76i8PjHhaq7XH1AfbM/5OiXMMfnLrKlBkMF84vPuB73Zc9GbWB
	k7gADOtFrmrfDvqKBwAsSpoWvW+g+2runKhdJlB63uEF/sY6teT98qTmVKuPBYAWY9ZJBdHrPoa
	lVQnZJUnkYlC63sl6N66647j1i6DAhBYiW6eJrGpFOFO4r02xDMuAg==
X-Received: by 2002:a05:6122:181c:b0:543:6991:8f63 with SMTP id 71dfb90a1353d-544a0245d89mr2847505e0c.7.1756829555955;
        Tue, 02 Sep 2025 09:12:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/AW64XUiNKMzzm/MfHy36hagXtx5WIUMa11UNfoPF/ThD0Ck2204vpxusFiXXXWGCeVYkRQ==
X-Received: by 2002:a05:6122:181c:b0:543:6991:8f63 with SMTP id 71dfb90a1353d-544a0245d89mr2847450e0c.7.1756829553717;
        Tue, 02 Sep 2025 09:12:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0d32a2sm309894655e9.9.2025.09.02.09.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:12:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/7] dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
Date: Tue,  2 Sep 2025 17:11:52 +0100
Message-ID: <20250902161156.145521-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lkbESmX8QvRQO9-WHys6azQK-RMXQmq0
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b71775 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=9b2JUy4lzbIbXjLhPvkA:9
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lkbESmX8QvRQO9-WHys6azQK-RMXQmq0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX75rGBEh6YISM
 dGawojLllAKsgJjRV6RapV/RvjPEdVXMRhwOXIKXifdY6qGlbibU9j4WURRkirdhyMaT7tL/OCn
 j/edelnvIFGBU1IUkSFVXX+QaituINWxuz4d2sE+/KA2qSwqZ3KItXaP3fwWDCwq0y+pUS7HgCb
 B3dV4BXCnkUdlgQ7s4vxFFdS+SLRRiXDEDkIgJxrD/Z33yBkgHksSuALceDU3tsGVjnVrO2DIqP
 PwriVhtWW+VUONmaM8w55ryXwqOtexlJ6rq35UxU7VEbpyfQ+/EsWEw8pPwDj6slquao97k4r9p
 gU306oXlPeKeUSfWUBbT9gxjv3SZyyqOEOvMj1dpoC3Sbn1blXzbUGXpKUUlxA0S6Zl3PwVlsDA
 t7hmMqgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

Number of input and output ports can be dynamically read from the
controller registers, getting this value from Device Tree is redundant
and potentially lead to bugs.

Mark these two properties as deprecated in device tree bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soundwire/qcom,soundwire.yaml      | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 95d947fda6a7..7ea491f7e828 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -73,10 +73,12 @@ properties:
   qcom,din-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: count of data in ports
+    deprecated: true
 
   qcom,dout-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: count of data out ports
+    deprecated: true
 
   qcom,ports-word-length:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -223,8 +225,6 @@ required:
   - '#sound-dai-cells'
   - '#address-cells'
   - '#size-cells'
-  - qcom,dout-ports
-  - qcom,din-ports
   - qcom,ports-offset1
   - qcom,ports-offset2
 
@@ -257,9 +257,6 @@ examples:
         clocks = <&lpass_rx_macro>;
         clock-names = "iface";
 
-        qcom,din-ports = <0>;
-        qcom,dout-ports = <5>;
-
         resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
         reset-names = "swr_audio_cgcr";
 
-- 
2.50.0

