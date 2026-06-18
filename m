Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCCC19DF55
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781782536; cv=none; b=kuKXnyuYkVg+uhfQhsI3tC2az8Acx3XVh99wdqgClJlUqr+PdWHD3yJkmNG+CBtGTIA9fEf2InA+04hXezJWUWzvnvZTMAPy8dATIzTJUE3Jiul7ES4y0gzbWeNwNlPNRQIEkccdaR6U+eyOulBe9FZc1gyv534x/x7lpzPY/eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781782536; c=relaxed/simple;
	bh=mlb3na05TSFuumjcboA5bHq99pBRdGeM8PJe1BADJk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SYZYavcKsR9EJ2xctGbj3Zfuq7f4inEcjSB0wtOuiS/X9YeAzBW7l2keSFyFCUituSq8d3tPL1/S6RaJYcfibZHxd2PrXDwJP7qOHzRmcXSGsgASYCyU2hN7atcdk/J061i3x8QTmSgR5usOQE103+VXZvaQiknSLdRAwachkBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOKJSaMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cY8tgqcK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOKJSaMD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cY8tgqcK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IArf2C3763684
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c24HNE6lCA8
	fpSztzgUnXvl+DfaDo/AAtNxdyNGgpeo=; b=UOKJSaMDiviT73FR9EwfxjtxFdC
	5HyLYwsYDcz9gObNjlpHyqjeh+gHy1nQ7YuRldJBiMn7sZkTefLoLEEHTUBS5Lq8
	7hVgnr2zz0Q7Wkfn3SNV6FN0RxYfA1eGJDOJ+T5je88+NMROx74POdOSZjkKO5IQ
	+hNeUW8O5hejZzW+xjGn38nhU7iY8O7b/+d3FKkSYvanNUxBEE9xkR6j/MEi5fyb
	BRgURjDh6/X+89SUlahMbUcv3TlgRGClL5lrjz4XcZ+HPfml5E3wp+JEFNRKcS91
	AY/o46cCwk+9NnsF+ZVyHeDItEVSb1BZ4W6qY+J/5fqoTBH7hkaK6LPPufA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vk35wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:35:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37c3620a6faso605581a91.0
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781782534; x=1782387334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c24HNE6lCA8fpSztzgUnXvl+DfaDo/AAtNxdyNGgpeo=;
        b=cY8tgqcKc7NdTzCJ+3OlJyUOZSJZsY4y0lyA4QA6qwtQk+YJL6MM5+h6Q9YqXcdA0d
         0LhIx0DBAkK/OXV4Gbvjji06+ujAKpKV5wwzg8DWvUf4pz5wG+sSJLQhnjJ8vOXgIGqJ
         clPEggVGgyq+2SmpKPGu5uzDCG8/GkEhjzAr9UYZAzShEbo4/dv3Vj0GbYbyz9AfwFu9
         4YlvYZm4rGtfAUR0ix0qmyKdZ+X7sZ4e0P7Y9kAJwztJtjcMI/ipD46zFwEzbYL8jhDh
         ByJzP39MgEYYIShKhXEgNj4bwkdWYcAGq4EaoDRoSH9Ud3z0938IFpHdDAcRCcptJpj9
         hJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781782534; x=1782387334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c24HNE6lCA8fpSztzgUnXvl+DfaDo/AAtNxdyNGgpeo=;
        b=qOWu0qc4Vr8suJvdkUEyktUhOErYJKALtZksCZIo0Y3vM7cCxVWECdCxzHuCUhtTyO
         TeTJi7i+02E6NO/9xNnwCSxkWqRwBbUy4kzyKUqw+MQMvt6a3ZZ4lBAJSVbbhzyVLU+D
         OVos1c/4wBMoL4cwnHHMK5y+KN9a1o6BaYIlnLhWkACQ/WDHAYlv2M34MJHNE+wyhJsP
         bSIPmiyxNyxg5PZLgoL0JMx03yDrnfhdtwD/21wB9JYR/P2aFO7+/vjpGV8wk75Xguhg
         YNQQRwLQdVFEmeGMnPw1SYmyTF0bPIeQi4UluqNNT6hgTE7SZTVapAXkMSYBz/xpVKo8
         25Dg==
X-Forwarded-Encrypted: i=1; AFNElJ81esHleHsf0ctscEsMW/aJLhXlvj1pHMmQ9m3HheIVrtkGnMMTc3G01yRM3FS4WouJdPif/dPf85MuWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhp6kOx0xqex8gXcSNqIR4eyILU0ty8HL5gBD4Iqcj1L35yX4y
	z09Pjh+5vQ+JxhnNPMjM7qwMo9yA5iH1enSCBKVASdS5OWbAGZbgfEng7VdlM8nO12I9zYIgV+X
	N1+gTbXLqjXMk/ceAYM927aaRiTEm3vfwsssfWveJVpTuPjRXz/MmL1BFsDojWDUXSg==
X-Gm-Gg: AfdE7cnlIZCDGaN9cNqb4z97di6lrN5hWeOzEKerLQnBxnxuxuZuM0JCG936ZCn9xIb
	AhzCHuyM57TXbC+YmqQL6knROS2z482Rq8fPM8J5Vub5KPTleUEqpzzcqabWyjYTc003kjVIMxm
	NnTOsK20a+zB+h6apvQx9Fz4pCPESTqWQtNFMBeX8+jnQXcWLsCV9f4Dia6IGpk6Xkz32kemzzy
	yF7ilUmBqutF/DJrzhX2Ty0iN/3XCjKTE/Z75ZlLy4QXmnmEB+ANgQ2b7z8RfaaXjNLv/tBE0fw
	cN1s7qH5jF0TcG0YzlypqCGncCzf0dn53bYg9CJJteU+VEwzPW0cQUvvXoTHIhHZBpT3oefnY68
	5E/uVI1DBJ34hMHpNuNmgF2wmcpt7zEc2IaIiTXk=
X-Received: by 2002:a17:90b:1cd0:b0:36d:ee3b:fcae with SMTP id 98e67ed59e1d1-37ce4512df2mr3166713a91.6.1781782533976;
        Thu, 18 Jun 2026 04:35:33 -0700 (PDT)
X-Received: by 2002:a17:90b:1cd0:b0:36d:ee3b:fcae with SMTP id 98e67ed59e1d1-37ce4512df2mr3166671a91.6.1781782533508;
        Thu, 18 Jun 2026 04:35:33 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ca7a7sm9067856a91.7.2026.06.18.04.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:35:33 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Add MDSP carveout memory and update APM DAIs memory regions
Date: Thu, 18 Jun 2026 17:05:09 +0530
Message-Id: <20260618113509.2025881-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
References: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jDeWDSWwie9qZOvRatxCDGl_kMcc01CG
X-Authority-Analysis: v=2.4 cv=DNy/JSNb c=1 sm=1 tr=0 ts=6a33d806 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=giDWo1LGG_5EQGLNojYA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: jDeWDSWwie9qZOvRatxCDGl_kMcc01CG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX2qySA/80ZGOE
 +gS66LSai5vdoXHWc2tJaIcgcZHv/NDy98vVJlIsh44GjQzfxegr/IT7YNpRc4QFaC8cXSCb8Kp
 N8/pAPgu/KnW8uICUhjriVNrr/+aC34=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX5E8t8SCtjD0q
 b+8woVVga4qu8nSPa7zqo3yoifJ/ejYksdbeixbY2g8d0BEQ3P9xxy1suvh7fog6U2zyUs22bE0
 Lz3ekmMFBJXQeN/YzR8XjtgpHAnxME2MeRWNnsIv0PmgXMiJYitiNq/izD1upwIiIVaCn/1etjW
 C4A8p3UpPzaigh8VPIeKsligR2zo8hvCztBlqQAkZ6n/+rBl2ClsXHSiJNoEPMqXVLl/ShhTyzT
 qWFFHuHMW/Dtu/n6UK6ajgPnVNiZUjmVtJj616ObIzZvM9PmCvJu8IIOK/43isQui6utyEHBH3K
 LkZh+Qoq+AoBFdPUydwtvd/+htEYRtKKwBdPKlqF7EwHMTWFdQwDsc0IMzTR6/pNnJYVc1ZBV1/
 2OWZSUuwQT8uUEPCYTKUyEQNfY6duP51xBJfWr8wKPr21JFKXm/ovuaMWT82EkhQYZaOx2mj9KN
 R70AQ4aBWIqlz//ACTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180107

Add a dedicated MDSP carveout memory region for audio usecases on
Shikra and mark both existing audio heap and MDSP carveout regions
as shared DMA pools.

Update the Q6 APM DAI node to reference multiple memory regions,
where index 0 is used for control path buffers and index 1 is used
for MDSP data path buffers. This separation ensures proper memory
allocation and access for APM communication between APSS and MDSP.

Also add shared-dma-pool compatibility to the existing audio heap
region to align with upstream DMA pool usage.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 88954ee943ef..d744f7e38ca6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -365,7 +365,14 @@ smem_mem: smem@86000000 {
 		};
 
 		audio_heap_mem: audio-heap@86200000 {
-			reg = <0x0 0x86200000 0x0 0x100000>;
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86200000 0x0 0x40000>;
+			no-map;
+		};
+
+		audio_mdsp_carveout_mem: audio-mdsp-carveout@86240000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86240000 0x0 0x100000>;
 			no-map;
 		};
 
@@ -1935,7 +1942,10 @@ q6apmbedai: bedais {
 
 						q6apmdai: dais {
 							compatible = "qcom,q6apm-dais";
-							qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+							memory-region = <&audio_heap_mem
+									 &audio_mdsp_carveout_mem>;
+							qcom,vmid = <QCOM_SCM_VMID_LPASS
+								     QCOM_SCM_VMID_MSS_MSA>;
 						};
 					};
 
-- 
2.34.1

