Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6DD399019
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 11:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054803; cv=none; b=YdYXAbJJ7GkMx0yOcnsFJk6KBnmcvFmMyBevB8F0lYSGNrHFkv4YDoZHPZvGcLHCYwzwVuxWaxk1ebInSCd5CpwXoGRbZ5q3ntICD8hk33iQ5H2A7IMhSDO0wZGIVYdiLwB9Xf7LkBO6+7daJ/IpudAhtV+ZjKZFowuChd12Mv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054803; c=relaxed/simple;
	bh=gYJlb63Zd53dsZ7vgXD5qYT6doFbEv5m6uL2BgBrnwk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uNcJeYvd8WV7LIusrYnrcCIcr9lXfbbUSnMxEYTU0Gi2rZGwrPxFaAGheewxmojeGWuPO3zfn9qhuL4DGIEYDhG61x6IOAFJbPc/Lj0xokWk3/mJ++1QSLFwZPjICDntKMV0fMMSmgvUQgr/gSt7pv8HIwKvwMI7ErBqX2Q5CUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX9X/fB7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YOKc+sXG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX9X/fB7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YOKc+sXG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WDnO3773276
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 11:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zLiURaoEZ7L
	H+73e94RS9tg/hkXxyFDfy3q31wGb3cU=; b=RX9X/fB7VT4k+OiKrYdL6e7EBs6
	PM1VN0l8VkzHkWhBE+Hlw/Eav1Y9KtP6dqq8ZKH87rn+Nm4BkLJkpa+K3jF4Fw+f
	u5esUEq8v5CSk8Goj93Lfc7w1ATPh//r56BgrjaMxu2AidbKRWh7l4Q8N1nD4YhG
	h69q+PCxyCiMPeCEty1QZ7OQKUbDJDVrr8/J8zBbv2FcNho1Ir6hTp/IOHcRXHqE
	pyiyZ9sOKvnlRhzE6ckQjx40cGxQ2m/NYh0epCh+NlwweisSdL1OaDtLJzdJLq4y
	yJvY3WE6bpyfMJ4UCmnXFAXQnQH2P5tZ8M6qvjEchh3bx5z4d4dyo2Df9Fw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8jce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 11:13:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae6961bff0so297669235ad.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 04:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054799; x=1773659599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLiURaoEZ7LH+73e94RS9tg/hkXxyFDfy3q31wGb3cU=;
        b=YOKc+sXG7B83/UaZfD77frfk/em0YaXtSURsZ24qnFeqV+dmA9P54px1+xhjc12V1F
         HU/5mHCdZebds6nUkgrtlIq7dQOPAYqkU4+8pW9tFSC0Zad7jRdevrzxjLa2VQg44Umu
         +ZzgpEG1E1GAuR7RwWlGGGJRaltA+Bi8907Ln6OwcGLS0kzj5oY79uN57lbgEGgC3Yrv
         qgY+Xrtb/Ld8c5lLrs7kiKS8E0tdZSyzuX6k39NslwlXhXf+IrWMB3vAM/gLePNAP25O
         K9BzDcj5lkrwNRoVMOv/Lreof9FTgepb7ckPF8BFx6kzv3WtwV20JYjDkEHmuwDlis2L
         NduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054799; x=1773659599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zLiURaoEZ7LH+73e94RS9tg/hkXxyFDfy3q31wGb3cU=;
        b=ZpM8Xn9n7gqIul2aSp0sSqdAiB8b6lmB6yr9QgQTWm0Zi+4yZH06ZzxQj1vRq1lXIA
         Y5dCvTAHSBLFEBDG8+UHevs1VBBC+oY1foraC9ZwysOEOYFuVoGBw7iBM/eZD2inYjht
         VAV2C999eowejdOps3wgvv5NTEnYBXdYocqTcdhfmcGvGs44ZqQqoeUtTZ1RgT+15q/6
         1/bmFW1A6q0ChkSsbgHO9V3Hh3aY5r6RuRgH+jALMOAtYEi0dz2T/00t36RPQZ0ECJUL
         b3F9LbtLQDs+J5siUVSU7ag7qRQOzgyvEA2qF4diLBV5JG2RdEzt6ndlXMQD+dGMT0CG
         2EDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU0D5vwQiShyZEZX/esrKx1VzLYTRuS2cRs4zaYjBNpTmvHP26nB+OErSfIVVkpmMsvTt13SXv2iikXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywso2TBchltXRSszjvlveoxjd0Rw1G0OPKOuH4a8H95K3a1nMcd
	lQ8+QskhCxTBXIiI9b0bGwt0BTA+7H3e63ZDnP5/vcfqTxipIHJYsiW9syT2k2FqSr8VSsJDexW
	O56mmNcO1QOEZjXPWQVObUSdlBqRCQ+mqpD/WQGOsTt9Fbz71b42b5OnUMtKZ73u5Jw==
X-Gm-Gg: ATEYQzzaTMAtHegzAYF2/7Ky9au05wbGLSc9rWX95+w6FThAfybo6ANq0fedxXEs5ZP
	09JpV7otv+N95JnJ+0sklLsky0USu/8UozD+jAMrasxbZPpA+HRhhiPUo0nVS7nzd84wQDCMBR6
	bb52yuH8wWtwvyLC1UsVpc89jNJbeAEysIRBsg7LN7DF6657YtQmSdM9i3eg8w4h8e4ETZ8M71n
	KFKvjwxsdj/8oMtzKfBcsvJTK1FcqcPw36SScVQV9GAQhdPmR4ylxU7M2MBrKlGrVnpVxBjNtRm
	uQF9gn6xNDwAEkpTQiDiVTZJbmBnlJ1cq3XfYebvvrhzsaD4jTWD1HyxItGatEdwK+01a4NCKET
	dLu3PdxV1BPjXKzErrO2AO3mQvySHZWM+H9UyLquD4Df9Zx+fHnw4Phn8AA==
X-Received: by 2002:a17:902:d48b:b0:2ae:51bb:9809 with SMTP id d9443c01a7336-2ae82444376mr111788115ad.36.1773054799176;
        Mon, 09 Mar 2026 04:13:19 -0700 (PDT)
X-Received: by 2002:a17:902:d48b:b0:2ae:51bb:9809 with SMTP id d9443c01a7336-2ae82444376mr111787955ad.36.1773054798670;
        Mon, 09 Mar 2026 04:13:18 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840c9967sm145405925ad.90.2026.03.09.04.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:13:18 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v1 1/4] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Mon,  9 Mar 2026 16:42:57 +0530
Message-Id: <20260309111300.2484262-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: s59yZ4jpaB9gU8GlmQIXF6Iv5QVcq44E
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aeab50 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ToWtgBs4AJHCE2l4FVQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMyBTYWx0ZWRfXwOjNOXRnQElI
 VHenvBvKCufqLbbLHFzsZsxg96Ol6hgqbBYZMM1Z/mtwdguqbMhTtZSIhFQOwK1QwtxUzWdKYZL
 LwnH72JE5WCjpikefR8d5jef7uOzcAQxBPbNGuxGgxvk6/yjvcwaQVNS4J8zKLJbqsDMGdb6a5I
 LE1Hhac53bOslFYSI5XKmV4o+MU/GN1vVaZGz5tTz3vgDA4WfDTIebsQMWRE4AIbAtxXDyeTOMf
 T7Qq1JJQye5696WYIc7iWQoM4gb0JcicWTl7UJxAonodMMTsl19hwIrltj8SDFrgUFd0N/k8dLr
 n+Mm5WYUq/LUZGg6x0CexpdZEHVNuJlPRvJDma0iQM3B+Fye6xeF5CwEAS/+9C8EHHRD54rqcsT
 gjAXUM3zcXfHPEZ6GmFr/GanEeA61alE/0HECK0UIu5QDEkf+W15NJeYtsKFIu0MPjHhAyrhhs2
 EeNDsD3TZD08ddlZz6w==
X-Proofpoint-ORIG-GUID: s59yZ4jpaB9gU8GlmQIXF6Iv5QVcq44E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090103

Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
describe Digital Audio Interface (DAI) child nodes.

Add #address-cells and #size-cells to allow representation of multiple
DAI instances as child nodes, and define a dai@<id> pattern to document
per-DAI properties such as the interface ID and associated clocks.

Qualcomm platforms like talos integrate third-party audio codecs or use
different external audio paths. These designs often require additional
configuration such as explicit MI2S MCLK settings for audio to work.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 41 ++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544d..1d770cbcb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,34 @@ properties:
   '#sound-dai-cells':
     const: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+# Digital Audio Interfaces
+patternProperties:
+  '^dai@[0-9]+$':
+    type: object
+    description:
+      Q6DSP Digital Audio Interfaces.
+
+    properties:
+      reg:
+        description:
+          Digital Audio Interface ID
+
+      clocks:
+        minItems: 1
+        maxItems: 3
+
+      clock-names:
+        minItems: 1
+        maxItems: 3
+
+    additionalProperties: false
+
 required:
   - compatible
   - '#sound-dai-cells'
@@ -29,7 +57,18 @@ unevaluatedProperties: false
 
 examples:
   - |
-    dais {
+    #include <dt-bindings/sound/qcom,q6afe.h>
+
+    bedais {
         compatible = "qcom,q6apm-lpass-dais";
         #sound-dai-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dai@16 {
+           reg = <PRIMARY_MI2S_RX>;
+           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "mclk";
+        };
     };
-- 
2.34.1

