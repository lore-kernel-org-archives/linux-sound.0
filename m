Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF36F26A1B4
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643602; cv=none; b=V4v1XZkhwhEhNXpLML+WwKo6w1JGaiK8dElvjmib6JSDLf8pvINX3IliiHJgSyRJYF7E2SnfMM1CIzyakOB0ZviWgf/viHY1d55LD3vlcwhSCG7rNpA2ymgUpz6kS/CjnJKHwPmLGsyg6lidqzx3IK6//o4Xxwdn9UBdIvGuVqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643602; c=relaxed/simple;
	bh=BCY95S5YwyhuN7eprWN+F7brDc0QM3mQom5N5iyKPjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HwFVJudlKotPW0pqc8daWRNs7/eVz9+lpVwhnmc2xeLTuTr54/DgBYOrAH+f6Yfx3VjX6UGzg7m8gGkBBnwza2IKiXf9KhNew8grZ/Gd3MmMbpCril4+lq6iwIk9pU3Y0s9q4BmoH2BvXbLZDsci7d1FKWT+7408xKKPE+prkTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGF4TJCO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGF4TJCO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILaK6F007889
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 08:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BsvjJCHHiTx
	Tor+DpQ8GKlT0ZZeN/JEv0ETifCmbtVc=; b=HGF4TJCOB58H8VfjEUyt3c1jeT+
	1veTtGVBFp3jqXFjZ3dSvBryT1efjThfW+8F9V6WEPTE3+uRbVGBVGxXSicx64ui
	QjsGh/uLNtrpWvvc/NebhrpYK8tfKYXBzsoEDQ92aB8XUiGgM7btkbwncg3vGvYl
	2h/YPF+HtO/z+D+u6Cx/q2fo/BoQJcJp+njhA8LyeymcbPOBGRqp0k0so2dReK3v
	MxUvjMT9oWmc6nerR36QYl8BWx0A8J1Cdub1RQikNheSGIbzjUDxooqhkuboMCP5
	dldKV/+MDa0b2Kgu2MkCLjYvdVv6ZuDsdvPTkaZncAdoLKK7TLFc/XajRvw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4kmfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 08:33:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30e7f19c8cfso3959578a91.2
        for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 01:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643598; x=1748248398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsvjJCHHiTxTor+DpQ8GKlT0ZZeN/JEv0ETifCmbtVc=;
        b=f6c96EElj2qjtrZWK7qRd6wOoWGwCTQo2kaywp3OrnKn7kVKinJEZL5W60z8biBieJ
         RQbz2FTSdkkzqbi/FsfbfUqIDn/VifEplZqwSbunHs0UihMZuB/FreMN9AkM1JW9KkyN
         MVIarmXZlm1wtRTNkGNJ0ByDjvjyyWYVNv/HKPL8m2a6J6XXEJIrdNeDKDIDTt6MnxiW
         YBGwp9uPxZgf7rsj/zWMHZeDIoBgJogPD8l6830dH8tQdKPETBUX/uJtS/KpUVi4/ZTl
         z2//E4paZYYUSBd6BYPOxEtl87IihWOzGzSfmjEn8ob3gEhXWVMV2BxdAzIUELVbA9TX
         bU2A==
X-Gm-Message-State: AOJu0YzYlkUPKgpEfyO/RruCLFMtHx/oxJSmQ7GjFc15teVXebXNi4+M
	9RtaBa02W5K0ub3+yeT8mgubkWxXK5EIEn601CQzJSTiSQlbiEbUu5QkcrgZO0GL83hd+itB59w
	FA+nUdK0z5Gc71z9ELsmq8R8w3iZSEGqmxASbQf5pm0ZuFPc83RhNaOr9/aZpmIrnKg==
X-Gm-Gg: ASbGncvSVJnnXqzjq3zgmepFB1IbiJIN2gbvEl4O84F+cz6UooeJtPRrctSZZRYSB5U
	ThJfM5O1enzjH/lQY21X2CB7fw7PoHBB/wwAs4wlwQnfN3p4Ko6B1d1XnK7aHV2gT1Q9+Y4ML0V
	0MqxMrFFUHyWzJgEJ4pNEMOBEoXAYlYVyIKIAg5c16/Z75el3BxVXsdre5AmRAXismOKTnJAlN8
	R2S8aoK7Xhz+8Ys9mwoXy0bUlg63DnHIjo8FWn1M7py9LjKPx84ualmawfrq9v3iB2UprFP5Ftz
	j0Yug8pfUvlls0yuOvFpiQBURrwUwvhazI4VrDGumPBcutV7
X-Received: by 2002:a17:90b:28c5:b0:2fc:3264:3657 with SMTP id 98e67ed59e1d1-30e7d2ded9bmr22199423a91.0.1747643598427;
        Mon, 19 May 2025 01:33:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK16vnqAO96Pzvim2OZIqPkjJATrLQNDQbP19YpepwUrlpJVdSfxpSAk8bvv0p3I37g+7Cyg==
X-Received: by 2002:a17:90b:28c5:b0:2fc:3264:3657 with SMTP id 98e67ed59e1d1-30e7d2ded9bmr22199395a91.0.1747643598063;
        Mon, 19 May 2025 01:33:18 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e6af9d586sm7003887a91.11.2025.05.19.01.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:33:17 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS9100 and QCS9075 sound card
Date: Mon, 19 May 2025 14:02:43 +0530
Message-Id: <20250519083244.4070689-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dh9fF0S4NKE8pSQLoSTzWQVXBEx4iIuF
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682aeccf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=kbphIXzXdx9KadpZM_wA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: dh9fF0S4NKE8pSQLoSTzWQVXBEx4iIuF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MCBTYWx0ZWRfX9SZ61VbvL8d/
 Q8bASGg4IVOaOL7MOgVobfY2mXICeg5qzEUiYH2KTNIS46bSukhznNmfuxG5Rk+hO9zMgDLxIsG
 cjV8RnoqIIqyDXDUfrFomJZH6wOmXAuNMLa1AxRLXvuNvVWNSnt0JDQ4Gm2fRE+IAjvlEO3BJyq
 hKI2NP+ww1+0W8f/Ogw3Ph3XFpND6ykTjU9emgL4bZfhk3xWXmhxw4sn6vy2fBU+49NYNLd1SU2
 /MZvFDCewJlCXSlFRudVnqHsxz9uaf8KFICJx4dLnmw14E0gRP7gEpZOn3WyPmXjJ8bjNxOlblc
 r8mVLFvfArVIKYz63n2H6Z+kF+fdiua41NNJO3R23r3a4Yh7P/x+lrWNNhuXDdopN2sm18c6oY+
 Y7cBAPTD2SkK2uyCip0fo8XP0MWOy0GvIOs2dUdppEabj55bhUvXDNfMLcbA1d36UMwWEX3E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190080

Document the bindings for the Qualcomm QCS9100 and QCS9075 board
specific sound card.

The bindings are the same as for other newer Qualcomm ADSP sound cards,
thus keep them in existing qcom,sm8250.yaml file, even though Linux driver
is separate.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 4e208cb7f6c6..5c6e990dc55c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -31,6 +31,8 @@ properties:
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
+          - qcom,qcs9075-sndcard
+          - qcom,qcs9100-sndcard
           - qcom,qrb4210-rb2-sndcard
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
-- 
2.34.1

