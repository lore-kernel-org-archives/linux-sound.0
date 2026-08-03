Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08633A75BB;
	Mon,  3 Aug 2026 19:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785787005; cv=none; b=hkstnwySQyg70wvgW6SKEO8X8v4u7lDZ+40A4L5uOfW8xO6tgSq70GzFTCoB5PdrErMf1JpxFb2zPgogbJcy6aQdwAdnPsEPEtbh0d7BVKhDVB+zMQ1WGjvHozOVCTV/FZZDnLEtjKuxS+j6VkFZ3yKMiII8MpDxy32cV8a/1p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785787005; c=relaxed/simple;
	bh=jSXMUE++9iyZDMAv+UTATYO7Y4ekLjdmdndbKeOoDag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hwxcFVbiyq/eZToVYh2dOtwiNorRY/A9IhJSsmMRT1HHUkDf3ONCsr1ONgFlTNh37+zN3OzfN1ZpCfyNutjknDb8SSnFIhecbUPOGtcPYbNlUxVamOc0i44Ph4LgHJUqIuhYXb9p6TVJCK/ROUOORJ1pweNQuslyKHr9oDR5VhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PX384XK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PX384XK7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Jkeis1750046;
	Mon, 3 Aug 2026 19:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mo2qOvKcZ5z
	lCVWwnFudFUbv9RdggTp2ubbmk/lsxTE=; b=PX384XK7vX1nNxYu2hTje77nnkg
	YY+VfuNOeACHXqMhsyW0vfc3u7ayPY9vi6EOJJPzvTXa0Zquf0y8wXwKOQDwrSJI
	PektXCgF/8DBj5Ma95Y31FsyF+yp4YTIsN4DPIwHIl18xPlfTNe4TX60N10EsEA2
	ZW9CYehs40Pl3sv1FvjvKcgAnfmdsrYI8+Gx368LZew/0nXwFhIF0+1teAk0w2ye
	Cyo+7BJ4LMTltE83R3kuRhCgd7bUiwrEzyVbTzzSzKJWGnaijKECc7Gp67sNre3g
	xpzreJELxILoUBYEs0Bt94rh/XN0lXWDuoOTPUFDStMduf1bJowYz4faKjA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r0qt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 673JuTRO016785;
	Mon, 3 Aug 2026 19:56:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vj9wvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:29 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 673JuT0Y016768;
	Mon, 3 Aug 2026 19:56:29 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 673JuTd9016767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:29 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id EBA28642; Tue,  4 Aug 2026 01:26:26 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 5/7] dt-bindings: sound: qcom,sm8250: allow TDM slot properties
Date: Tue,  4 Aug 2026 01:26:22 +0530
Message-Id: <20260803195624.3606352-6-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803195624.3606352-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260803195624.3606352-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a70f270 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=J_9nTuYritXGVYYHN_gA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3NiBTYWx0ZWRfXxt6qWc6unxn3
 b6N8tg5uvVstTimgNTmOuM/5eJxqlWoZor6L/cZboXdveIh7IQzJc2F8wzy9WeKMCZyk4y4s/0q
 bcQBsf1nVFbVAj8IuymBuqQv+zjq0d0=
X-Proofpoint-GUID: cKeuVIZ0GZ4TqwREAbGNHlfI9solQ6ic
X-Proofpoint-ORIG-GUID: cKeuVIZ0GZ4TqwREAbGNHlfI9solQ6ic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3NiBTYWx0ZWRfX3cJrUSgr+/xh
 7CqDOv9x63HaCJ0heI21ehw16wMDIGrnfnb6b+oC9UXoqvnHOsTZLw7iNB2c8UeOpSTkbswGWvS
 EHO2lFjWZI9EI1YWd52hr436xPwAr31qqh+NlGLwt9iqnyiIaH7UDNQbTfuIiPULZwdDM91RLcO
 odmGwy+ztLqtQ7kfAhycXmLEwbgn+0P0fpEwjPR7YsigOh7iZpyx1Sg1vvdyzJhnoS3dDsQNHUu
 SXyJIBGuZ0oF26cWUVtoKzwthwrJUj/YZEmfKYd+Yug9QhGt5tPGjHmm58ZxYcG89InLfnQKhtz
 7basWhs6FjE5T0sSA2FeREcuqX9IYFzDYhPq8l9LGiJQciqWRAKcnPDIMeyVMULE4Z4CMpnQm3a
 QGbrdRBB5JY5ISL3vRnvc5K7+YX/8/5CHLUd1Qs1vJZagJx5ykVW0HEJ5Sb+Xvxyjhu4UZSCQql
 Zg0D45P4BTDKfTfbFKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030176

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
index d12ac528c33f..1d251b591781 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -93,6 +93,19 @@ patternProperties:
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
@@ -112,6 +125,19 @@ patternProperties:
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

