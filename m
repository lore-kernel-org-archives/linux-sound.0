Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E113AFB12;
	Sun, 12 Jul 2026 13:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783863709; cv=none; b=cO7/0yQntyox2o8GTrsIikYTMDa9A+YMzZW/h/aj+21aQ8TNwooncJIWUZ8s3h8tiIFWshyjj2Bih1S+lJ3cBEAsFtmXsoSi29ha3NfZYvdAgyhjnRPY09n8R0lF/k6T/0kqaTVl0YA/oe1T390BwrnFWgPPhxh4Lkp7zbMQ99g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783863709; c=relaxed/simple;
	bh=9YcqKDMtOkMk2/jgBVSKrXKHVXz9lKXFnzWkvgP70Lw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TgxHitg5n/1RamnNxd52trvmh7uBjVsqH/y54+8UsecebvSL3IOMMGmfIDAWUDVNKesAAzw+iEQIJdJczzTaG3zMy1A3dvjXsbIpK6HQMSmU5jcVrETBZe5CGAzg4DamW8QKrpxNcGX2YnHwC5z4MzR6MXd7/+x7vn3+JBv+jYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgHEGYWG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgHEGYWG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDa1bM2490556;
	Sun, 12 Jul 2026 13:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HLZr4A0rfGN
	W53uUCmKYTEBEV+TAatjKV4uMYtAZWj0=; b=SgHEGYWGmC82Y6kVu0FaEbtFh2U
	8sS81u6/CURWtYie5b9j6kgVI3u1NhHiqQPXijrhzFpebsEmjYMlEXY/hDbiibNg
	DCD3Pz5V/sadSjba4aPtbSItHLCw8kGp87ePiqxPs5TBvL0n2xZAVkNbj8mlvK/9
	fZjzq5lhqbPT4aP9UGVGcypzPnAVFguNQ4WuZEgqFqmnh+jRmCwGVYxFWRKbGShJ
	PMkMIhM2OOuWkVjq6Xm+6ammwY8Hboue0x687T+p0gprJ7fg4n4DumNc00zcp/iO
	/jB4oCKHlOf/WTO7xabM3l/QqX1u+6weF4wOwQUkm+ehE5ZRFCUmXFEWQ4Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gjs6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66CDfFQ3026901;
	Sun, 12 Jul 2026 13:41:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewhmf82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:14 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66CDfENW026885;
	Sun, 12 Jul 2026 13:41:14 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66CDfEbl026874
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:14 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 56201641; Sun, 12 Jul 2026 19:11:12 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v4 5/7] Asoc: dt-bindings: qcom,sm8250: Add TDM slot properties
Date: Sun, 12 Jul 2026 19:11:08 +0530
Message-Id: <20260712134110.3306763-6-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a53997e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=Rfk8f6ugPP8LbJp4NhwA:9
X-Proofpoint-ORIG-GUID: R5l_HL7aSKkBg_YYLN48n3oJTzPNzbDM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE0MyBTYWx0ZWRfX0OMLelMY81uN
 IXODVgnBWNFYye6MLRvfISm2phWoIBH0lYezo7XEO1O0BC96gqtyjdDiSU/klDnBEiec85S4pgh
 hDnGAqwgsBR0KWOWLsavwrGl0AXs8YUXkmi7TqEdQlRn9tp0EQQABEXG4ZERXKwLnn90+w/RcSo
 dNaKFxbrtpsIPYaxAgwahhh1yPBtLzn6brFjHKIc/t5wjiPbLaZQMCVF9j0kBKHwstAQkqr5Ss6
 fVP7d59vPilKkNepHVnIc4remEvjxxZ9+aHUM2rQ9VGwETJoP8JJ5BqKfiuoAZGrMj/9fiLH5Tr
 +rGUGul5PhX9xyqnMG4lPZqb50pTKmDnOlpG6f/Mgrg9mgxJaXKvlFIFkhcUMdomd9ib5fcB/1H
 QFuTW9BDg98YRAhiXa293ICAw8lZayURuFSoL9GPS0Mb9yzqp2q1NM21K/ONNOu4hnOXcBws2WN
 3I8FuX9YiTs3JxXR8Sw==
X-Proofpoint-GUID: R5l_HL7aSKkBg_YYLN48n3oJTzPNzbDM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE0MyBTYWx0ZWRfX82HWoLiQdyUs
 Xlc1qC7l6VzwwhBmU6tHj75Ti0pKb20gEE3FezkOAsIjKp6kqoR9hzejB/ocdOdVwCB+UM9RE5b
 67uT3RUbdtC2svTof3/ibsy17cpcpGM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607120143

Add standard TDM slot properties in CPU and codec endpoint
nodes.

Some audio backends operate in TDM mode and require the slot
configuration to be described in Devicetree. The common TDM binding
defines dai-tdm-slot-num, dai-tdm-slot-width,
dai-tdm-slot-tx-mask and dai-tdm-slot-rx-mask for this purpose.

Permit these standard properties in endpoint nodes so TDM-capable
links can describe their slot configuration using the common binding.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,sm8250.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index dae440eca..28cf9289a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -85,12 +85,20 @@ patternProperties:
       cpu:
         description: Holds subnode which indicates cpu dai.
         type: object
+        $ref: tdm-slot.yaml#
+
         additionalProperties: false
 
         properties:
           sound-dai:
             maxItems: 1
 
+          dai-tdm-slot-num: true
+          dai-tdm-slot-width: true
+
+        patternProperties:
+          '^dai-tdm-slot-[rt]x-mask$': true
+
       platform:
         description: Holds subnode which indicates platform dai.
         type: object
@@ -103,6 +111,8 @@ patternProperties:
       codec:
         description: Holds subnode which indicates codec dai.
         type: object
+        $ref: tdm-slot.yaml#
+
         additionalProperties: false
 
         properties:
@@ -110,6 +120,12 @@ patternProperties:
             minItems: 1
             maxItems: 8
 
+          dai-tdm-slot-num: true
+          dai-tdm-slot-width: true
+
+        patternProperties:
+          '^dai-tdm-slot-[rt]x-mask$': true
+
     required:
       - link-name
       - cpu
-- 
2.34.1

