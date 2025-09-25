Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290B2129E6E
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 00:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758490; cv=none; b=SnBIGvhO13oNedFDkGd8kV2Aa/3cQA6NPmnou4fRgZiVNabn/5zMyS5v3lBgTpB4MdcRFjijvksE8+zPnIy6q4UGCgXZVgeeWTwffiduXIZ9ioXxFaYDffIim/+X2o5LVxPOVi0wWSYJsTZseoBYYrVYggPCO61GNM0clMLG9nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758490; c=relaxed/simple;
	bh=2S7wvWXh52vu+wnRGR4BJ3o9wnSisMc90P+h+1e08P0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwdTZ8y5zQxrGkJJiil1gj4r654CRkj39UNxc5OhiveQqr4irrYSxYl8RSfHHRSl/MLKs1zb1dW+QAMb8KmPYrYL1eF37McZtkwIBKqZBgDXYY62To6CJNqsIbfkNJGsS7cg4/FonP/qQh0JWkjc7WGYhvb+7shSa0d15WuqJB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3JG/jjX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3JG/jjX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD3t89018716
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 00:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n0OEBm1RnS26Z+eRtG67meW0s1XrkCDmtmh5F61o6fY=; b=J3JG/jjXnjU9J6kh
	HRWik2cqrz3L5uXVC0Xarh43HNyE2gxAxt66SDMNXO2wN2KwSzTkjscx7RDH2ypT
	OQzUA/mD3Qi/jXrydDFlXgSYMcBB7FPQBwIfm+4fdqSd+Fr0XhJHje2a1BIWzDWY
	S3onsTiYMY80V0396B7iT0tmYN89vIaK96ccpG4p64YMZKV4B+N25+mdVCQVwo6J
	GQWzVrTgDwSoGUHSn/ZSBoQ06BdxhZCcXYN+ZLe4pg8yxqQiXZqHm7tEiwXow3DY
	Drrs6snLHqfcYa4tUxvWTMdtd9iqFq7i+8QAkadvETPF8WPMzd3zOghPuWFfrtDQ
	dJ841g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjyek4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 00:01:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f4912fe36so277675b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 17:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758488; x=1759363288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0OEBm1RnS26Z+eRtG67meW0s1XrkCDmtmh5F61o6fY=;
        b=g29PWlbunlpsYcfBwB9lURzP+KUXvJgVR6i8rKGhcoNRSHgwvH+EViaPNYfdmIuFzb
         HIDKWy3ueIFaI5JbYo000C5UH6ht1Jodl4voSPBRV2N9HQhI4licCrPfrLb9yQiGNNhU
         exrUuX58hJtek+v+ynrYgkyokzyK0mDqSA7OyRAzt2/2NWFL9ij34uN6mLxnU7X/Xb/Y
         bnqk7tG3ET7vU+NAo0FZTKg+p0bkrZKKSzp9JqVOLJgv+BnNB1bGcXK1rxGS/Wdh/gY1
         FL8nJ1KDCkfiDO/p3cs3jW88v5+QphD/gxeb2aagvNBTQxWABB3WhFfWcO2t4rduglM7
         NkGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5ZFcvwMg2NlTJ6JI7r7skT4D0yn51oaUoHkPa3S9et/eN/3QYVmjFU8U9HA8JZ9cFTq70eoZrNL8jSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdnGEI18cjo6bLEIlB0yYqKPB93CBtj1w9koPX3rl5YLesGs/C
	5lkG+6aa9nimX/qhgyMRNMRIBFOPIgdlE+Qv7XmhESh3ARg/qewwd62kwbcVapvSqS0Q6dukgDM
	DvijED0zz93luJkmzC4r8BW7oXlGE1XM3VfAu95xdMEQ25ar+d0jGJH5PvGGu6K3i/A==
X-Gm-Gg: ASbGncsxOYe75RN/KPEHyaFHp2YhCkZLDEWxjrXt5tuCn+uUFTfjZvV8dj+NJZlC/nm
	Tz3aeBauCxXvfGBQMsBLLSYbx+mUMBFtGkh/jPXFxmdySIpYPFSfBt/GmEvFVdJpjrQaqRIUlG4
	eH26/ISHNYTxCRDl5aLHOVuiiwLLaGrKRYegf9D3kFB3bINBmQrPog7KWBD1u7zJjGSU1yrjC7Z
	D65IQVyb07+KIvkatCLGRLf8EtEuPEt9VZ9iH7K7h41qcZ5odabl2D1V5DWrGUBlAWhHfAfVg6k
	0KNFuMYh8sgn5t05nSuD/SrOQt8vge+XNwEfWBodfifEt/GUzuRhMTPGTo3zQYZHvNkDxF7DGiG
	3eqFVZhhY7r8lRq8=
X-Received: by 2002:a05:6a20:6a26:b0:251:a106:d96c with SMTP id adf61e73a8af0-2e7bf478c02mr1819140637.10.1758758487673;
        Wed, 24 Sep 2025 17:01:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzNuh3Av7R4gC2b8bh95S8AHR2YvjRgTYw7k8EaoMUcQxNqLDTZ5+Kh+DD6EFGVU/5rSBkGA==
X-Received: by 2002:a05:6a20:6a26:b0:251:a106:d96c with SMTP id adf61e73a8af0-2e7bf478c02mr1819075637.10.1758758486852;
        Wed, 24 Sep 2025 17:01:26 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55a1bafsm423152a12.43.2025.09.24.17.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:01:26 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:01:16 -0700
Subject: [PATCH 2/5] ASoC: dt-bindings: qcom,sm8250: Add kaanapali sound
 card
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-audio-v1-2-5afa926b567c@oss.qualcomm.com>
References: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
In-Reply-To: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758482; l=903;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/I5Gh2eYLKEy7ErQmMVLe2xAiiZ0xMLF0xKldvwzBHo=;
 b=bPIPTCEb/BeOXHS2eoDQIMQ8sca42xqvYdM4rkqZt569KYm880F8rolGAlZZ8emwzp8bsy4jQ
 qob/B10CMOlDWm5qg2BPkSn3LkOJjHLFK5byvJmjZi4uZX37sIRdAEB
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: 6rfl5Q5TVwWHfCXnHfzbj8ECWBQLW36B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX2TY17KkI8ajY
 FaJ7dfn8JXB6kkwzWVjpO7E7BSZEn0V3Tc2D5pFLKToWhV1OTZmHHVqbggQDQt/sjzY8zeohpYh
 G8iFAncHM5LYz4gfeKb83F8kZwRsRJ76Wb9pYqHzs56Wn8p2NiOuotu/uwkquMyRf1t0DoQrcUs
 EZEdaIni6II1DZv35BfhoRPyOZwGecKzD3e2whAF7HD2fsOPxGrljSWpvlwq1hkNMkWUDaaTRxG
 I7/+jgA93TcgmyIPS4U82holz7X+ayH2vIlMRzuNb8XhMVoeBdaQU46WnZoGip9r6EGcfzL9T0y
 ZlJGBHxmYJe7lIAt8Fi92Hby5l4HMUlLTyMnlE/pdbYu5huZteY/GsuQrOkOPoThKFj+1tPtdbf
 bL2M0jro
X-Proofpoint-GUID: 6rfl5Q5TVwWHfCXnHfzbj8ECWBQLW36B
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d48658 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MCV5zX6qGx6s6p2FbZwA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1011 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add bindings for Kaanapali sound card, which looks fully
compatible with existing SM8450.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 8ac91625dce5..708bae805403 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -23,6 +23,7 @@ properties:
           - const: qcom,sdm845-sndcard
       - items:
           - enum:
+              - qcom,kaanapali-sndcard
               - qcom,sm8550-sndcard
               - qcom,sm8650-sndcard
               - qcom,sm8750-sndcard

-- 
2.25.1

