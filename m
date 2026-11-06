Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968436;
	b=aOvw0Ldm9aB+lNICcEWKSdOQTFUW574KErIMk6EvH9RBaTjZiK7oIA6Jkg+x/rhJ5oBf
	 UrSjx5MehyqFDAwsUfBkUPdVzFyKY/vi/FpYSOldBpAlNbUMUP/XWoT/LJa4oQRhMbid0
	 218N0zpsfvyyuP2XdmgAjxb9Vht0lIw7EPUutG04/FARW7pZ9RWwPGjJFMzzQ+Nlinzc7
	 BXDNzlHJ4aG3QnTVe00V1qjEd9uuF3+fCyiqMTNzSmmdAX+L0qP7d5Tvu9eb7/m8dnQh6
	 N2FFJkBOAIv9Rgh7mNiYrcHTN4M8HBFsvvbMotxPbvKnVbZCQd8r0X7WEc8nOWcjNnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968436;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JocXPoVsdUtcdxW7NBMQrONstwXM+qnEOC7VUJB0LqA=;
	b=5T2QZpyYbhThwl2Q0ihXk49BIIDYugBbbpipx/MXDAY2sG9TNbXIEtP8rF4feV7g+ltp
	 gDjm7t1Y0r9s0VVXazoez2JHoJ6e3uWQvvs4qAzMZiqNjfilcZO2GQnFd4xnssRNyEQug
	 0YApWH07+xIb/O5Acwc7Izf5Iyx/ItbehVZeNs3xG0Dgik9dZTzgfLGsN4nG+HhknrL14
	 GM8w3I8za5Zdg8sGb9u83bNykpS8kADynYQY0wM01jxSq76+E91YWTDiTOigsyn5dfww0
	 s+KPooYbdj0+so9Ayzi5VWpRpC/JSpiUmI/xI5P6mTL/Xs8VTX5tyB7v0AWq/X4y3SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OlyAaNIM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYJt6jy5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76684606A330
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 12:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76684606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OlyAaNIM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYJt6jy5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APJ352593296
	for <linux-sound@vger.kernel.org>; Fri, 6 Nov 2026 12:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JocXPoVsdUtcdxW7NBMQrONstwXM+qnEOC7VUJB0LqA=; b=OlyAaNIMnTm3BD1u
	lq0VjSVjGqRsP3FldyXJHNSt6Fi2CoD1I3nuSFD6ossiHZKq8fuWeC1dXF+/oJaH
	r1Ole9EdRSanphAA6iWr1nNA58y++Csw/9TqG8y13PJICYOSyM6mY/PRAodInFGs
	ynsurc4SIk1apqw1q57wjDdX4fpsWuunT2jg5nJDKNNJjABQrZYDrMKgATUwgDxU
	e/PtCqZUsFlYGQPfQ9JJP9ivhlTM11+RRYRFitzPO5JPFqNETsl2tFlAjHVAXbAW
	Ot0yyxP5uq7KdfhHMYwoCYz7nXH1R4eMHri4GQ45d0qHnC35GHrZWUs35pzWjeM6
	zYtOTg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paaqyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 12:33:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1123784eec.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 04:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968433; x=1794573233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JocXPoVsdUtcdxW7NBMQrONstwXM+qnEOC7VUJB0LqA=;
        b=bYJt6jy51hoCvoA68B7rp2ItspN+bwmtfLrgjA+Gz48OFZ0Cs+Sp/KwMjzVGpQ/5EM
         2CmKrb0Y1lQFzvBcbAcfHLphSU6YJDwTp/kVH2oi1lS1oGXvnxmJrtjcPLCJpPXI8/d/
         1a181r4tltEh6YZDDnVOG+ZLQmQlGjw7HFGLogLlWfdJXjVOCK66dmEDbYl3kpQkWSHa
         +9Wdscd6ch7A94QfQUxZ7LW7ELwcsJynkINZDhZPKUg5vvutxJFHk2hUqZrRByRFMW2L
         njU+2tB4oyjZbdsNHCa2r5iQH2TGXqk6abDt64v/jgfAYbVkPLhN1n6mWIP07es+bNsQ
         i2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968433; x=1794573233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JocXPoVsdUtcdxW7NBMQrONstwXM+qnEOC7VUJB0LqA=;
        b=Nzq/tnjWQJ2ks0E6DSsvXGjr3jUQxcB33vg1KgSSXiyNMqZKCMkYIJhWE5ShFgi6gv
         OgtSdqsZrWZE+xC2+OG7wPQBa8I3WbNOztpX6QTKcp5TvBvqE9IQWnlTkqBsWD1CFGcj
         +ocFP3bp3tsgKa95Y2IUUw0ZtqN3WZ2Ux1KEfGXhNBw9XG1H31HEuPoHc9x+3UfKN+F3
         hQqr5jot3gbjTDNCTnZJtXuYmq54CZ1Lgzt0ZOT3TDv7jbAOgkfmGPrTQCflq3UT1+Vw
         6d7e5AQ9cLm1zIpFjQV5cWyIv6SlIryxQTMPqV/M5hCrmeU6LmAyZ3oT5kgnpj8E3GrK
         GwmQ==
X-Forwarded-Encrypted: i=1; AL+hErH9zNfNsTtipf/HCoT50YZQGlEhx7aXfRUmtUKKWUGm4aNH05L3xPesdIA2JTXW3TB5ZzHFp9igluD5Gg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+FZ0BWKkj+bRGrDF01XnN3PkbkEIa2sGq5kfOILp1omrxdjI4R
	CT6FnVQjM6Hq6KslBAdNamHgbJPz++DERa85GcQ7twwIHe2BzGYxgVjXrVwdvzdV5AiV/dFcEiq
	aNtbEd+NkrAfj1gc1jYxfk/FrX5Y0FPq6J/jjnPDkRdsK6u22pea5PmmM11dj14tb+w==
X-Gm-Gg: AYBFou0rgoGTkdyGXPwCra9KrEB0NcPK+vUY+61hlQGNo0ep+L/Ks0NmYug3uRmYYGV
	6+keB7CxR3BATIznFk+0afmCTrxy9osMpcpZbtH9wbH+mhI1k9Wu32sc6T7CQGQg2jvWN32Bfeh
	jI104PYxzFFoDbxTMPR32to2r2QiwDHDEPeAf1ZdttlxOCR3WOggBdvMC/AjuY6Zcr8NZ5AM2as
	GhNF77tMiVnFcaglrt26eE0GCb9V1P66cVWt0glW0fqgSDzj+OtGAxPIxUCv3im2i5S2fa0SKQ3
	MFSKFQuqjHoCuLNicX7Sfg/J/qdSZtmQJ9XtrPGl32FDcCX9INJdP1CU2INPicdAvOKX+Po/g6p
	T7aF+QKVFK3019+FG5NJAitBLdsAeJx4seccY20ATFEIa6OYZOgjtBbcAIyuSDx0/LKefZvWjoF
	qGtFTn+Mu/
X-Received: by 2002:a05:7301:6486:b0:36e:97b4:1071 with SMTP id 5a478bee46e88-36f75b1f828mr2904894eec.14.1793968433157;
        Fri, 06 Nov 2026 04:33:53 -0800 (PST)
X-Received: by 2002:a05:7301:6486:b0:36e:97b4:1071 with SMTP id 5a478bee46e88-36f75b1f828mr2904868eec.14.1793968432652;
        Fri, 06 Nov 2026 04:33:52 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:52 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:05 +0530
Subject: [PATCH v6 v6 6/9] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-add_shikra_support-v6-6-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=4383;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=mGVuwOey0nL2okiqH1BEWpf/XgXM7S1XsWWb7FBfG/U=;
 b=hQMfUNyzCLlq/WhRNyjsQFhV/Yopy16A1JK3zhAj9tdqY7kBWBPgn9TbMDHqhoC1evBKWTbQ8
 g2hMibd/2W4CphSmI+2zIuBbpjv6AqsrkY2FLwGKNp1olG8fxFJgWJB
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: zjaot0XbsQVJGE2OX0wZVo0m0r0EDft_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX6CvsF+1tNbW/
 mrQLkpSbe/Ctf3fyhTYEAy7j+4o+4ebUOkzOovJSFFTL3UGRSFs6EgMXE7kiHePdQwaUcy7+oQC
 cXf9nHSYWUhPmpHNmYQRBazmPonnxqREwjnJRjblA0wvf0FhcAufV6GjN+/yzy1sdPx5nfZFATa
 USIiyJdMLWwmRHHZJB5hyGGxbBe6NLrjCSv8n9JgmeOwyLxj/gyVpP0KypdbDaDFfKoMjNCY/8p
 ncYXnGdehyagJoDP9MsbF7w4VwXalfTcGu/b6zEwL167BWQg+gjoLuL8LvJTIqz6TbuubuoSHmr
 EINEA5UVWK+sb5S53FppsRSCd7c0LSKDQLBBWU4z3i56DFmlqQ5H3f75Y/gIVQBUDo4UfvwPptr
 q3CmBkTWIo2ghjMoVc0o9TkrXRVMwQAWw3QsW/uhSSsByJeKZ0QzKN+6pzTwZhkzjqTSsI/ER0b
 sPFDDEWwMzbRJUb8NOQ==
X-Proofpoint-ORIG-GUID: zjaot0XbsQVJGE2OX0wZVo0m0r0EDft_
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aedc932 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QKLxUzbeBypczxc0BNYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX3Wkn8HeGIZaH
 qlHrDOuoxJd32wunQfSCMqARq1piJ3O2/8jCktT7MdszewBfd8th+GdSSTor9sokI/es1A3bzsS
 sYyCcecXQy4i5XfQtfUtZKoZu+ofacg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Document the RX, TX and VA macro codecs on the Qualcomm Hawi SoC as
standalone compatibles rather than using the SM8550 fallback, as their
clock inputs differ.

On Hawi, all three macros use an "lpr" vote instead of SM8550's
"macro" vote. "lpr" is the consumer-side vote name for the
LPASS_HW_LPR_VOTE and is distinct from the LPASS_HW_MACRO_VOTE used
by SM8550. The LPR vote is shared by all LPASS macros on Hawi and
Maili. LPR is the vote to put the LPASS block into sleep-disable
before accessing the LPAIF registers

The VA macro takes an additional "heartbeatpulse" clock sourced
from the LPASS VA CSR rate generator.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml           | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-tx-macro.yaml           | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml           | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index db63a75f108a..20fe0dcb65d5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-rx-macro
           - qcom,sc7280-lpass-rx-macro
           - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
@@ -154,6 +155,24 @@ allOf:
             - const: npl
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index d8682ff2e82c..2df72450d36f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-tx-macro
           - qcom,sc7280-lpass-tx-macro
           - qcom,sm6115-lpass-tx-macro
           - qcom,sm8250-lpass-tx-macro
@@ -142,6 +143,24 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-tx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 683ebf702ba8..7d56f9c36056 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-va-macro
           - qcom,sc7280-lpass-va-macro
           - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
@@ -185,6 +186,24 @@ allOf:
             - const: mclk
             - const: npl
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: heartbeatpulse
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

