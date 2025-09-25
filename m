Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E33B1E1C02
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 00:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758493; cv=none; b=icVyzy9jVUc25vTymOESUf483ZqP4ZBGPeR2w+9eNucgRMeIeo2f04B8TZtRQLTr4FXBpAXuOpdVPcTH1MTTpofRulcj9Bww4JIttRY3L+uT8rXwKhaR4z7GIyzzChTNQYlXLXUTFsRaSEi9riAP0oDt2K3QwHwa9DdefUWpE8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758493; c=relaxed/simple;
	bh=Su9n4IWzFdYgbeyNcKf8HkcOSMRJH2fLIJ24DfS54sA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qgyoy5FHmEaHpuMeX9ab0Wlf1QxO3BAFW4OM4aDf7nC780sJiegY/rTe8cvrIH+/aIkfxYwVq6+j4UzAFU8QsJ7Nz1O5kI9Wyk482Uqv9oDcrUOJJsaY/g9jyEyklHs40s0ZvSjm/VehZ9Pt529eGUHEkbkLPOqUsOpME+y7cSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvvhqSFG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvvhqSFG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCOWdL016437
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 00:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+svYFEPeRE+GlBruHatPNgcWNOtS+5u/A2E9N88AYg=; b=LvvhqSFGDFTiTNjG
	xdHI9P1CN+ammYOtGcJdHjU/xlGbPeQGDyIPqBTSJY4hEl6rA+R49+3a+EZfj0sV
	FPgY6mRE6EU85cwr87OJ6rO6rp6KvHSRlLWibbGYoOYb66SZIsXeENXUWdy2V4aU
	BruMKkOqAmuv86jyZGslYOoQyNtxzqENiuIRpXD8aGqjn9Han/ObZ/S6SsiVSZBo
	/pUBzN5ax/PWDsq0ipnAspGqIk9ZBNAnQ9zXkduwLUPWCJ1ex9rFeFtQSnpXLFMx
	uw1KcoRCNzGy6Ia40s9wHw4V4/IEXac+XEqXJHXuh6lwhkwYmCzzJyz0ewSKwT4K
	HEHAGw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhwxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 00:01:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eaa47c7c8so365688a91.3
        for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 17:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758491; x=1759363291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+svYFEPeRE+GlBruHatPNgcWNOtS+5u/A2E9N88AYg=;
        b=Pn91aOSy3pgssfn8l7cEkes79fit6O1CXIKwg/+dnW9RYTynuwsOxHYOBQezq8VcGQ
         2//Hotr3DG3ZXuQAL1QkSRpuMDhDyBlT1mtaha/Y03EUNu7J2ZK/ycjn9lIC8m4eK70t
         5o9LjYX2D59njCPLvuMGYNWqUYHHt4jo6D2E+Z650ARo2j8g4cKa7U2EoXrg7IzV7TCA
         hwSdz2dqZpynPtsxVNcxOJTzLshtwxVjhM5k3+Iu3gyKF/F/ArLjqjj20qVY68PzvnwF
         jVPf1BAauXPJnBJ+bYuLJuy3RnlLrOT269yZNZsSX2k3BCTVVuzzCxEivkfUXyyuWxX6
         5ObA==
X-Forwarded-Encrypted: i=1; AJvYcCUZoHhhZrHC93sgHLShpzdJeSwiTlx9afL8BjVYXxg/m8pdIlWVaywph/PBoGZyUv59Ts/Ifm9ea4FKrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPxgSX6O8/sj414F2gLAruZRnchta84jOssZeI319zatg38TZx
	VNQNlIiO+00zpwiMfMNaM6gL5IOEyz73MDfo+Jv2eORsa4yG3H/7rle/O5iU9lKaQRbadtfOYrb
	MS+Up4S4FFl44c5c+L9bY+5cyrkDZEvhaoKqeuvJ8H4l7moAdE4Pz1gySUzZXU49AZg==
X-Gm-Gg: ASbGnctdx69Ug1Z0xkd/S2N9VuTV3i9xHdJLuBfYEgN0QZyWvFvBemh3NWwBNReHvJU
	LtbURUi6oAsCAIe8NvDvOZbkLXegO9V0xE+tnF0YwOlOlor8OcC6kZ55o+h6biicMKCxNjRwN0y
	gQFrdKltKt1XXFQBBLv821dhKfpNSLOtrfZ2khE1mqH51GiRlnh1464WDZDXHkVVoJzNHHz55pC
	+RZ9RnRj9H/aDWtlUT1eCD1XIqckL5421xvA97gy60fJzQ/YzijJbXxfOh2QSeZ9PrEZre2KPYf
	i/bR+fcN7egtegfiXEINqPP09EU3E3UMtnrLTCS7gklUoZzhYJM3li3pzKVbnnfRjBE4BxN2LtQ
	OvqZplEnLpjVa7kU=
X-Received: by 2002:a17:90b:3ccd:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-3342a24d0camr1338410a91.9.1758758490745;
        Wed, 24 Sep 2025 17:01:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaV1MnX02TYD3BQLtGJWED8QeZxgBJarFFcQxN2XBHT2cM4XiHYw2bzJAwiOj3sSHfjRjeOQ==
X-Received: by 2002:a17:90b:3ccd:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-3342a24d0camr1338372a91.9.1758758490079;
        Wed, 24 Sep 2025 17:01:30 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55a1bafsm423152a12.43.2025.09.24.17.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:01:29 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:01:18 -0700
Subject: [PATCH 4/5] dt-bindings: soundwire: qcom: Add SoundWire v2.2.0
 compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-audio-v1-4-5afa926b567c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758482; l=969;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=4kSso2MILnqK103U/1/KdVpFJnxXpd8qNZM4Ma3qnsU=;
 b=jZ8DysmahDdFKDbInq9PUpL8A3spyWaItze/o/MUBtwXAKE9U2+EmZx55b0hGZReEKvFfA9dD
 r5ne20KrobCBcl6vzWh0x0qcthQyQ7orKSPbCtTv4ihS3s3NI01P2Eu
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d4865b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=O9amS0TZr_c9kjyk9PUA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: MHoudfIxInKc4TmJzxu5KEl-ilw4MIVl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX2WnHsC54MBnN
 m/gUt0u4YXlnXgbjGqpzJExZa8nFhm45Qd9pQ6HquhISTpdPQq6Ji2+sGwZG8TO1ca/KnA38kOA
 KlsG4ngPGYYcy9SGBnIB/3PEg00J3fqkefGNDz6RX7PokBiV+fyAigD7hf9H+RB7WCN8FXC/QCQ
 LyieWJ6ujW3nM0syzWcqn403RCmCh1Z/pFHMcQQyhJCzoe2Y6iXVJ4XQEmHCDeONPuj9ngUhvif
 X7lZgOsrC+zvZiLPy7nal9mWeH8f0uBFQd6SzN2bK7t8p4/asHfwX7Bm5co9sYSyA2DNIq1Trdj
 a5XYZiwqRU6QV+MH719BzL5SvVcKqQNmMn7fkmI1kMMwU59lLqlR8sbmKxwzdXV/3jAN7zh5mU3
 U+aLA2Jw
X-Proofpoint-ORIG-GUID: MHoudfIxInKc4TmJzxu5KEl-ilw4MIVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add qcom,soundwire-v2.2.0 to the list of supported Qualcomm
SoundWire controller versions. This version falls back to
qcom,soundwire-v2.0.0 if not explicitly handled by the driver.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 95d947fda6a7..1c4b0bdbb044 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,soundwire-v2.1.0
+              - qcom,soundwire-v2.2.0
           - const: qcom,soundwire-v2.0.0
 
   reg:

-- 
2.25.1

