Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627132;
	b=0+qtKTN7p3xCBUsqtfFsUY4Pb4XIhsMz2PqbBV2LVZJQdCV4P4akIpYC0YumWqWVUQBl
	 jl5nQEDfbr8BNl0S1ZwSQPrFlq9YnC6l6V1iFFpBz2hk+qnaF530TyRezCiIhz8VDCdEQ
	 Y7iIRkFqErcKXzWxqcft39XFwPLLyD8fr4EDwQTGJgYqXF6nBBAiwdR2R9e5kQtJ9+i8U
	 aw0EMqYITnVT2hU3KdiMvedYTk4PpzmZoCrV+JfNd4DUwMV8NHBlAp3xzYjzPwf83Ihn6
	 B+0lgCqKKCbRY1SN1vXp5uRmCI0E3q7nhgFO8luo+FNfEQJqRC6mUceav+mICFWvFsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kI6WO7B1bFoCDY489fGVqBNmwCW+vKG4+l+43lYDWrg=;
	b=1Dnisg2XRDVp8w+WyhNZvJapFgjZdiwE10FpG6OSUkm67lSqp20jaF+2qnD9dwvuGv+L
	 sJTXjGHtVbRLXC909MUPzhBKmy0rf7vVkiba5n29c7yrxwkPsO0LNQGI3DEzYKaOo9/9v
	 4Dq+fp9+9kRVQ0ri8TGYPFXFwgsKwpL+aFHlrzv6a2EbGImKeSHmHs91iCQGiZpnblOi6
	 zhbJBy52Zg9jgfe7RqprgaYRT9gxkcyH/EEC8jdpZK+j8pbDv/La9p4kg0HZ7kicOTfTt
	 LUNfPeqCtiq2t2yEjbbEoEOLigV/qP+KzucVtiRjIEfyiSiZzWLqSM2kP+KwOPpb9Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G1iJMuxO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEOv2SsE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6A6606A338
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 17:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D6A6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G1iJMuxO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEOv2SsE
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQTjd326990
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 17:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kI6WO7B1bFo
	CDY489fGVqBNmwCW+vKG4+l+43lYDWrg=; b=G1iJMuxOVFwU03Cd0CtyNTtNVIH
	GTRSRWyKNl7IuxT2OK5K5n+6jgXAwFvdP9RT9duVZzFY7YFprSmMftEhjxWl1D0e
	bHK3RorB64CYeKdbV/d78QfLQcwMbwveuniTzA/5V2k2qHrjX4WJLmGKvtRBUpTK
	VCDliT2afRvLZdutIO+pqY20p0gZ4H/vG9sPagFmBWMZo6hOT8RFXp0ukcHUcVOE
	xXshzDI9Tvxg0RCS+HS5o04rSskTiHwyv5wgI+D9fRv4lgZEjK26KBYiAFWGqn/U
	1KYkRS9pTFbNfZLVWRInA1NEjZRKUsl9w6pXeUIP1/WQ3d1fx75Jd8Pz6MA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2c0y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 17:18:50 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4dca1ef03so73618987b3.2
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 09:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795627130; x=1796231930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kI6WO7B1bFoCDY489fGVqBNmwCW+vKG4+l+43lYDWrg=;
        b=cEOv2SsE+DFX9QOEJLLjtm4wwmr7qAJy/gpuqGiWJeSrMNsdCVr2i9krDYH5OHAMyB
         aif6JuzEwz86gMkIAvV888MHPpYJCTlu8pi3fmh34LLK3bNxJind9/gPvoYywtrmq4UT
         HYCZKGa14Mal61XSXPVWbLpYLlmw5/W+t5vSMGzKBfi5XmqpzwucPgBW9J51itoxGR1m
         z3K9GX2KDYcDStPia9y0jOva6wMkGQNsJEIUO+1hPqJCfCVWMrDwm97kdP8XBMXC4/2W
         AezeGMC73Ijg8rBXcTYy8+0CwaaPTWAAifphNKRD3JaQ7uH0aVbuK49nA8KumczOA9G/
         mhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627130; x=1796231930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kI6WO7B1bFoCDY489fGVqBNmwCW+vKG4+l+43lYDWrg=;
        b=viV8G4UDv/5rXx/lVUNqYyFo6//N/hAzHpQPCLhM2fkAeDZviH1yjMlBpA55ZrZlS5
         f8+DwFE8HOeimxGHNMyFZs7pMim44uApR1nwTp5W1/+JzCTIj8LtgN+d9C1EZ4TsbVq2
         FrYypdm+JmZMp830r/ZuBlBAAB9DUNOUS4TLH8DpdJWWCvyj+vvO7CxU1e/mUpg2OL15
         4escG79uQ2IyBQWFawwxEHWyfVI0NQA2X1ki3BwgdBDQSjA8kYtY4b+XQTtHE+mheU8U
         eSebE7P4TC3/d+icCKkutYxj9PkrfHW9pKNuUW38KbDAf5dxgt2GV2p90BCjRB2i3CxC
         zWIg==
X-Forwarded-Encrypted: i=1; AL+hErEv1zJTzefaAsFOC64nn4fQQ+EmaOREIL6qoxeg3KnbnOg3PPeOuAVQRSHSVu7s8arVgSoFrx72LWyWJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/8kA+YKpGZe7IW5hPNVT/x2yjADJj94lLi4wPaTUQznpSQ+Pns
	aisYjrwTZ5BNbIDxtrlQvZiOTIxmzUTuwb0bFM7kaFzhIo45yf1Ljk5OTo52bwENdGcWJKofULx
	X0sCuXcpXG2prR0aYtuE4tx28T3Eq81BLBjLfBtrZ5ghSwqiJhFBnPOOubqvKC9W25w==
X-Gm-Gg: AZFdTZelbIIZr57ZJce91oiI2tWWy10b8jXBxiK15k1GHtdNrPrsI25LOyV9AP8P3Bw
	+zLNNOMGAQh/FPq8J4rtra9ehGFX/9wlQ/ZhlsOS6KY3o+kRKOizZ4GqEw31N3Xo/cPgNJuHyxK
	8d//0WHafyU15Op/FFrETHcXJnfPyt9wKs4nvJEe3nCdjMxZSWl+9Gix0a8SRubv7kFgGDud1bo
	0Q5/ngJi9L0ivnyzlI86NElDrG7a7sC8KZ2v2AgxxZIRKDsHgLV/MrA1j/evaPgHs8R+L2sbUPH
	DxCS+mQ1eNvqII/VOAquNMmn46B0CeuPozQmG/CSTXuOrDggcyRMbsnICfOAWa7eRRqorVCJIM/
	EUTUcB4quMeu6LYQHVPlGg+xpY7xmljwrpl69DPjsoIwk5R3otmdHKyytzC0zpAMB
X-Received: by 2002:a05:690c:4d47:b0:8b3:22c:b420 with SMTP id 00721157ae682-8b520329516mr80939037b3.5.1795627129604;
        Wed, 25 Nov 2026 09:18:49 -0800 (PST)
X-Received: by 2002:a05:690c:4d47:b0:8b3:22c:b420 with SMTP id 00721157ae682-8b520329516mr80938827b3.5.1795627129010;
        Wed, 25 Nov 2026 09:18:49 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm42096548f8f.21.2026.11.25.09.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:18:47 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: dt-bindings: qcom: Add Glymur LPASS macro codecs
Date: Wed, 25 Nov 2026 17:18:31 +0000
Message-ID: <20261125171831.1458954-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b07187a cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=FrxuNgF20hPgSuSYAXgA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: Yg_c9edStyFQmZgC3bI1wjic2JZAIqmF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfXxjhgb2fPZu4I
 xqMvHCWgjL5hrDodNs6Aup20LJDmJ+rsveNCbuVPNAOE//LjXVFbOg8EwMSJCFWndziZAqi9H+l
 D8t4h8XRNeP6oiHudNsXKpoTEMlqPzY8scssocKhk9Q2+Lg/PAp/tI/8daf7q1THrMc0Jq3v5WL
 a3IZh50hX6B1fvxShAo8VoIbtAwNkoQtlF9nSyM9sdT2097h7zlrGp0+NT5DkQhtPA/+d8yjhPR
 n7cZfNLkBCPonyEShsLMSMxL5isM2xv1X6eyJmu8D0p60jVTmpryilpv4P7SVz8uRn0RkvVf1xX
 H70VDqjOb1MBiVIvV3u3ACXkk+xogsCf64LWb2WuQMo0kFxwQX00UZAGyIGbpk88vwN2ATGUREL
 Yri8R98js1K2o7WtcHOsdsJ676UBjNb9Jk1ceytpjdy6a0XK/VbbwyNzA+HF7RmJDJLMGxLLwfN
 UFdjZ1HknfJymFDgYdA==
X-Proofpoint-ORIG-GUID: Yg_c9edStyFQmZgC3bI1wjic2JZAIqmF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX5jLTXaoUZrxu
 9xMVh1MEcJ6vhl6kIGyNuRcj154mzAlpAkXbX5FIxqJkwNy4wwffwiSxghyoccc4dhwod3ZbR7f
 PcCSoeZwRDqQFD7y9XyaKQOAuFxW1tQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250068

Add qcom,glymur-lpass-rx-macro and qcom,glymur-lpass-tx-macro to the
compatible enums for lpass-rx-macro and lpass-tx-macro bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 67a4a9536d06..5e1940fc3e9f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-lpass-rx-macro
+              - qcom,glymur-lpass-rx-macro
               - qcom,kaanapali-lpass-rx-macro
               - qcom,sm8650-lpass-rx-macro
               - qcom,sm8750-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index f9702a11ef82..6f5648a973cd 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-lpass-tx-macro
+              - qcom,glymur-lpass-tx-macro
               - qcom,kaanapali-lpass-tx-macro
               - qcom,sm8650-lpass-tx-macro
               - qcom,sm8750-lpass-tx-macro
-- 
2.53.0

