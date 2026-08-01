Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F3131E831;
	Sat,  1 Aug 2026 05:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785563196; cv=none; b=teMZUZSF8gOwbFBDCqypsk7j5pvdebi58QlQj1cvyW5hfjYThoNtVRJm92PFRxN3v1SGWeeOoEN0OVmZ7rskUtXgCC7qyMskMeCv/OH4W/AUDOZwUPt1pCfmfKY4YhLD0gZmpLksHD4FOQaLVF3nPDL2cjP3OfZGBS0Ln5XcuD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785563196; c=relaxed/simple;
	bh=LgJMd/unLlwC9IjExxMD/hTtiFE0Un60hFfPUFAPneQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R5T67hQI36Xp217cOyi/gqu07UDEm7bIdT/SgEgFuhb4jA2fJOHPAJoM+GFjUVZ7P5bnLpQqFc3wpMx5pBakL4O+K4x6cSRBJaQdWZuXzsmfarwKr77f9PO7MHGD6f8MFYV7kPaib5yHOdoCWUA9HjH50x0v5bSCX5XEcHnge18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFHO/9TA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFHO/9TA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713FlBk1759492;
	Sat, 1 Aug 2026 05:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qNtPOZMqErd
	qPwLDY5fY6dr0DNbSz0+81eYfuNWiVoM=; b=IFHO/9TANZpe+ct/p4hyygO5V+J
	tRrp8rATG39WkuNm/vKCRyyuRjlYHU14ceWnbjHX06KO1KjwEis+7g9IS7D+Bh+c
	0Z5EWstkOW1Y9X6WAzJaCfQ86o4hKBr8tcv/eg0SyjXLDvr8JBXaex20ih9s7FTP
	BAGUnlDViZYszEFF4BKb5fRemlApXThxyAD0GXRjtuYEnAV3lsG9qNuVw+JfHHK9
	iRkp1WPN+bRZHDA/TgNhbjY11FLCoq8DL9iFsG7Ca3T/CC8bs5YkCZ8BB9+6mxxI
	Erdg3jwd6fyVjB1BJKJ/z3sv46dujNniINDcD4C1maeot22nqvLqWFi6Ctg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6g9mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6715kFC3017041;
	Sat, 1 Aug 2026 05:46:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vh0uuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:15 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6715kFUG017019;
	Sat, 1 Aug 2026 05:46:15 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6715kFB0017016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:15 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 15356C0A; Sat,  1 Aug 2026 11:16:13 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v5 5/7] dt-bindings: sound: qcom,sm8250: allow TDM slot properties
Date: Sat,  1 Aug 2026 11:16:08 +0530
Message-Id: <20260801054610.4047089-6-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX+06BNtX07vh3
 uOkURSeTn/Nph+NLXinwqobolOYVc6CypnlUPoopjL2C4AI0Q1HgjlpjTBqFvIvNE+n3OdspbNw
 TaZ0dVSTRGh7wqwpGsA1b/wdy5SYrVY=
X-Proofpoint-GUID: SNUq7WX70JzjARvCRBbBtYkg3gFtjyC9
X-Proofpoint-ORIG-GUID: SNUq7WX70JzjARvCRBbBtYkg3gFtjyC9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX2EX0HNkqhcfd
 yuAbBWjsaSSkDWtbUx+BH1zuU+d29XHnAGa7h1qk3BhwJ5IPv4xJoznHiC2wKzpGq7Vfi4P07Sy
 Z7HCFnDoNE0JC2BC2/xcsC62VyzdPvFl12x8il6zy/fGg6+CSAXGLAGP2YS5QoBBjvZCNu6WDSO
 IO1d82IFohsbhoUdVp0cxL+8edH9lJieqSXeTlub9FJ3l9vwINhkn/wuygDIqG1dS22C8G5yr7Q
 GqvA0wkMYN5dB7w5aGXrojJOKiEWNiHY5MuXCge/3gT2wc9lL1WbdlMkoerrTbkICzWVjLUV+Qr
 i0f4lFOYjAHGVM8+g4K3N949Gh7JQ1Us7hUpYF6fv4nL4e9iJmB3We0pcYMhBpTHN7N+ivNDiaY
 wdKfZXl/GGWCb2sU6GoqFeP3VqWG0adDoFm+qcajwdcQ2yiz4ZxS+DolMRiqwmDULotOqPwax76
 jm1yazZtDotNYX0k0bg==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6d882b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=J_9nTuYritXGVYYHN_gA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010037

Allow standard dai-tdm-slot-* properties in the CPU and codec child
nodes of a DAI link.

The QCOM machine driver parses these child nodes to configure TDM slots
on the active CPU and codec DAIs.  The properties are already defined by
the common tdm-slot binding, but qcom,sm8250.yaml currently rejects them
because the CPU and codec child nodes set additionalProperties: false.

Permit dai-tdm-slot-num, dai-tdm-slot-width and dai-tdm-slot-[rt]x-mask
there so boards using TDM backends can describe the slot layout without
schema warnings.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,sm8250.yaml           | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index bd5f5a6268a3..66a0f66b7b90 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -92,6 +92,19 @@ patternProperties:
           sound-dai:
             maxItems: 1
 
+          dai-tdm-slot-num:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: Number of slots in use
+
+          dai-tdm-slot-width:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: Width, in bits, of each slot
+
+        patternProperties:
+          '^dai-tdm-slot-[rt]x-mask$':
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            description: Slot mask for active TDM slots
+
       platform:
         description: Holds subnode which indicates platform dai.
         type: object
@@ -111,6 +124,19 @@ patternProperties:
             minItems: 1
             maxItems: 8
 
+          dai-tdm-slot-num:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: Number of slots in use
+
+          dai-tdm-slot-width:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: Width, in bits, of each slot
+
+        patternProperties:
+          '^dai-tdm-slot-[rt]x-mask$':
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            description: Slot mask for active TDM slots
+
     required:
       - link-name
       - cpu
-- 
2.34.1

