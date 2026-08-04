Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6CB3F211A;
	Tue,  4 Aug 2026 07:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827014; cv=none; b=Ej1SGfZDhysMY9HF0Gc86hD0UGB5A21QQZv7otJW9dwOBu5o+36fAO3MobLoi53JqNVjqrf9utL+rFnlxByhEBw75Nd+aWk8P1L8OZiQKaCbBGMW7wGkTrUQzXYMgxPCAA/bmALerk0YTybEpEL+EVAPcoOPkMEHq+wotIdVYBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827014; c=relaxed/simple;
	bh=xIT8buKU7qS11U7G7GvmQ7PBI5iXTMZKfJR0pO4yVbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=urScUjaEgu22eIgyZCDQHgbbdd6vRQHXy1uslwgUau87kA8npqFcstg48pl3OvApEeb3Qo+IbtVfSSWKwJ/kn9m5GSHsYb914xwcpCXxCZHWxYV02sOZmJVY6he1O6YhVmomSWD4Xo2V+ik5b9tELnWe9I3/yw3hzTCAUcuN+ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9GMG3gM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9GMG3gM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67429jjd2203758;
	Tue, 4 Aug 2026 07:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QYRPjZJL0o2
	eVAO3NoHU0dy/KEYQXXv3NSEZFsMw5BI=; b=Y9GMG3gM+gOaulskPiNSaYDhjIs
	xvYNtkedPSRRYBGLIVmMJ1VdrgrVY1VVJPi2T2tULfuDH+qd1ztaIFk/1MjGiRKA
	A1N3mXnwGy6mbGP6l6WpJOHN62VUTRDUqIpHDcBVQlvVmZvJxwYONZFpltSjQGCI
	Fj1BAMO5+DZbp8zOV/qUfSBYNvtbsN9ObmUNIG0OcGsqT8nzbj1sXt5ccR+SpfKT
	09X4rdl3j2w5WSRXDAuda9/IeR835PtoHZDA9MuKytfa1GCwEQoWRG/8Kpd2ZNE4
	2wPrhliS4fnEr2mZysv9VToXhCXn+2wxFVJyw/rb21zwfYbKdrFi0tiCx7A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu72711sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67473HFR031289;
	Tue, 4 Aug 2026 07:03:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vjhjng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:17 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67473Fh6031213;
	Tue, 4 Aug 2026 07:03:17 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 67473Glr031272
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:16 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 88497642; Tue,  4 Aug 2026 12:33:14 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 5/7] dt-bindings: sound: qcom,sm8250: allow TDM slot properties
Date: Tue,  4 Aug 2026 12:33:05 +0530
Message-Id: <20260804070307.117119-6-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NCBTYWx0ZWRfX3+GMBhrmg3oz
 86R8trrfIN9P8/+RRhq4eLR+a7MU+taUIabglYlvj3ptyyRjTPxNd4IjAJH8Mo7eu7sj3W1Ym1t
 lnFPFlr0rjoqFstHp0jt81QWPUFOIc8=
X-Authority-Analysis: v=2.4 cv=Z6Lc2nRA c=1 sm=1 tr=0 ts=6a718eb8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=J_9nTuYritXGVYYHN_gA:9
X-Proofpoint-GUID: zAaQtz2X3xZnMsxQwRg4tWPH4Qo4P2uu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NCBTYWx0ZWRfX/tQIC98cpNA5
 wfL1fnwQPJHJqgUj5a+89CTJBytTvDUOk6gnZRbvYp5QjfT8J8ZnNR2eOlhetgrT4s2CmRid/FA
 lGD18l0JzYtldVKmO/SNxQoJeMRn+zFAppUa6IHX/zxy/vOMz15e10TbRnf4fA2LmhvaTd2n7vw
 2ghYklIoMTWhNGsQWFGHdRFYcdOVb2WmhW6ibQ5uKiyoQ0lkPTnRkrJSq3f3e873wOGK5M+94xo
 Qm2R9Me1f/D/cDBHCSiFzS4gaBmurWFhYZ6kuA792HlB7PdvNn+jvLHq564nIyxGHR0ygw0LnZi
 0uNn9CihO+AIJ34M6EWq2oSJXNWL6Icz7H5iNXHrsvnEjSIThKkTdGibscUjkJF8MkaaexjwLsc
 KKxuUUw9spw6W07oFd+rOWOKIv3YwVoXlqdIPGrMd9xTCNTpPWg7KhYj6YJf79jOrEHZaUEJ1Gk
 YqRFWZg1UkCVKlZ+vuw==
X-Proofpoint-ORIG-GUID: zAaQtz2X3xZnMsxQwRg4tWPH4Qo4P2uu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040054

Allow standard dai-tdm-slot-* properties in the CPU and codec child
nodes of a DAI link.

The QCOM machine driver parses these child nodes to configure TDM slots
on the active CPU and codec DAIs.  The properties are already defined by
the common tdm-slot binding, but qcom,sm8250.yaml currently rejects them
because the CPU and codec child nodes set additionalProperties: false.

Permit dai-tdm-slot-num, dai-tdm-slot-width and dai-tdm-slot-[rt]x-mask
there so boards using TDM backends can describe the slot layout without
schema warnings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,sm8250.yaml           | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index c1bd19299763..3e7216d61a5e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -95,6 +95,19 @@ patternProperties:
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
@@ -114,6 +127,19 @@ patternProperties:
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

