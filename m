Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9340B389452
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 23:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082256; cv=none; b=VwkxcYKF78YffUDHUB297ETVDUkcSPnhCx/BH2FIh8TKZeJtvOz0NQBVz5BcdeSCc6EEEbZno79mcANAGKW1UFwHIjbAKUhHzZ/DDaKMHj+BI/aiBR2ukfm7/XSSeuDCBXOExYtc5MRB+4NryMB8dx+zCV6CrYiRwUwYWRokJy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082256; c=relaxed/simple;
	bh=3F7NPfQgsBWC+krUrJrikvhpia14WuZ4NzVUTU6mH/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bpANAvj4Q6nZ1FaFokokCJdSRSAQHOGnS8IKGVY4WpHiHcz/e3ob5yR+S/YJeb4pj3qCg632SnE7/H+Nac6mO1dOJh5+dKBXWYfOQnVhU8eyduT442X1qzC/PsJkkLlPijf8tNXXIJQJayVMd2k9MIIhU1U8VWUIdGjCacg0DwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWHk3mT/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CT4RsaD3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWHk3mT/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CT4RsaD3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALUJqJ1677388
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 23:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k6OvTwdyvHS
	f5U38KS+OQbIGILOhNgbNFvOpojZjEKQ=; b=MWHk3mT/Stt9agPcJufyVA8+JYa
	tKAy12Ez7sb/PCD9YpcpYWxVjnSmoiNdlfMbHW0MnhQfOBoJqhKlqSwFmIEDrw8v
	YtZMsPt8aXXh6HFkHuIWMi+xwz7Mk7AOKzzb7DWBtkasJ0v/VBZMk4AHGvUqDs37
	tC8Je8e3+jC9nRUUdd7uvf8VV3iviU9ybhP50rGh9RNprDTN38udaHQIngzxEJbo
	ZjzPPS36gz4BcFojLduUW1eNflPpI9T0aCgG+UPw07SEV2yx4B4QrWMUxxDgfoI+
	ob+tzXMCg/llKHoWeHy7kF5p+OboEqz+8m323YlQXoEj15c7FwzidTMgkPQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx2c4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 23:17:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso3361175ad.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 16:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082254; x=1789687054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6OvTwdyvHSf5U38KS+OQbIGILOhNgbNFvOpojZjEKQ=;
        b=CT4RsaD3zRN6fjRyQn7FGkSOdq4+hokklMiIi0SeCK8ysYSVJuA0Mh4/ZqyRtHUemW
         vxF2W7sUh+z6BR9kEGaR1kt6tQEp+9/41ptFnqogklqjcZsbKinKe8lJ4n2OvqxfgkP4
         hj71rEN6Y/FfEbWkh0jjJ67n0sWphslLKG2lv3l87lTu0+WzMOoe3kotdgM2qD74wyQX
         NVwiqgn1tJIcd9549a2cLl3vKOwkp+5zKL6jo0eUBuPuxbvwm3GNkDM3Nhxs0a2BheVc
         4f8YXoslhOSX9lm95B27AX2ZtQGRaKKvfkzPaBOfH2f9EpSb5KuEcjs3vurhmtRRmq2L
         oSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082254; x=1789687054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6OvTwdyvHSf5U38KS+OQbIGILOhNgbNFvOpojZjEKQ=;
        b=n4GW5h9Lj/CYu5KwQmdOBkei8VqEYwqla3YvwKTt/c+JwAdYj1SCIppSCWAVKs7dLY
         X+4GCJ+Q4AiodEZvBWwRtu3ukgmX1x+Tsnsi1mDV3B/1RClT4ta1EUTEfocbWkXNSHqB
         KO+Nafrm1V1nLE8rZf9j7qdVswompvhx2ypEyn8OUc3p4lJW3iQHn4RsMtWgzs95lk8Y
         WXW9WAZ7bXmw3wmfcL3Czqwxm/IdtGahBYT7DFQzfjkYGmH5WKyNvozDC07e8vNtwVPf
         7NhcHGdr4AcandClR9MqbLwsAoRCBIK9JpViQcgWFBtRlsljgh9UXhFG/vxEYReyL9we
         GNPQ==
X-Gm-Message-State: AFuF++mpMX4gBLwd/uvwB2NhPVXHiBLF3c6QIo+RIyac+QyXyI8i3n1m
	atW4hPC7pQPOt8OQjZUEmmoy4gmh2hyp7ebXzy2ROVBN65IEEE63RCq2yZHu7tzPxa2mzf8V2NE
	T0FS1GKTid3sRXAwZkB1vfa935n4pMKYcuGpj79brlwN+EkA2XZFLNgrxSclrxNz8TA==
X-Gm-Gg: AYBFou2xO+cGZppFNzZ+JmoMe4GHtvxF7wwnG2WdKNlT695qwnojIVkmZpCRaQd/7tO
	Aai9AnNxNHLI99DKH7FwvJMRavosbMZ6MUiVVIs+TbFgsOuJRLhqlEILYQbfaRJXE8K10MlvZ1s
	FJufyIV5k4ilDHoaXpLqVetBRMClyk3ZzgW+IUSuOJsJLcoNKf8cqz9CJsn4BgwsHtF3Z4V2I41
	T8U96GVXyHtuG4tLlOuJSCmvOETY6cBRDzW2nwezjaA/hwRfSrccERQWc3JzySJZIkEdb4/IlNR
	LqL1NrlWlYmqf/Z6XWkgZZWe5bMuKC2B/geP3pu8zSCby3XM8OsbhQ/B+OJ2IoUMnVrEzINnZ+j
	x6GCJcAcCzZciODAo2tZ6lidGXMj8LAtwEcwR
X-Received: by 2002:a17:903:1508:b0:2d8:d4cc:be62 with SMTP id d9443c01a7336-2dd2a35aa10mr35020105ad.15.1789082254245;
        Thu, 10 Sep 2026 16:17:34 -0700 (PDT)
X-Received: by 2002:a17:903:1508:b0:2d8:d4cc:be62 with SMTP id d9443c01a7336-2dd2a35aa10mr35019515ad.15.1789082253829;
        Thu, 10 Sep 2026 16:17:33 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:17:33 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] arm64: defconfig: Enable Qualcomm PM4125 and WSA885X drivers
Date: Fri, 11 Sep 2026 04:46:42 +0530
Message-Id: <20260910231642.1794948-10-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX9Q3uPl3mHA0h
 p7E4iBVSNoonlvKgO0YYoEmExwxTqDv0bJdocIZq9ih/MQfpb620GhzSQ7fhOdI/XQzE6NEqd3X
 smVBFFFTT1bmkJn1uxyWjqEHxAg+322V7ZzONKas98ToIlXCj9KWNmtm6bOtZ+IZlClvO2tYKKa
 YUEXbSuPtOwdlYsfdO5a8OD8nhQ6um2ZcFMouy20Oij3DTKDa6iX837WeIemF7f1c6cAltdGOkn
 dQEFQpPz/7BXOcOXrqloarkTWqJUlByihq93ruUU955zqlvxcN3RFQDwY+dhtuY0yaTuJWQ8u4w
 vdI4m7rv5kLEbc80HvDICXDZWvajPMgH+GiPLft3ruWaztFvBg726N1+3W4ERDuAVQR/v03XhsT
 886ZvzhQVujKdGlzE5yrAXrtDtZREP7UfUPzmtmKGnoUEtWzeqbbaG8iNPM61uu/LlqEHiq87YC
 r07hEbAIySJFufHnoAQ==
X-Proofpoint-ORIG-GUID: -UQYQ3VwWTtNH6C8IxyRnhoNUDqOEvLF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfXwSxHop5iAvvm
 zspyOt2Re1smDUFPvRmQAN9qeA4TWqxMe/u7wlqLJg6pkQTj1JM1hscrWj1IuAbOZ9Q2emHG+zb
 YAZbfC8PTjbUMY/aoUXHm0Dj4lWegfA=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa33a8e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=rO3wVDe-YCVyVCuK1RsA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: -UQYQ3VwWTtNH6C8IxyRnhoNUDqOEvLF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

Enable the PM4125 and WSA885X I2C codec as modules in
arm64 defconfig.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f0947c8176a1..e8883d1c8b17 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1163,6 +1163,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
@@ -1185,6 +1186,7 @@ CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SOC_WSA883X=m
 CONFIG_SND_SOC_WSA884X=m
+CONFIG_SND_SOC_WSA885X=m
 CONFIG_SND_SOC_NAU8822=m
 CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m
-- 
2.34.1

