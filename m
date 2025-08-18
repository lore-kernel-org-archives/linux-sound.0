Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B172E31E101
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521465; cv=none; b=BCEgON35MPvM1H7BMX2vw0b6fY77VbZCtM4GWJdPUWXOOGpcdPl/rBWxxu3c+kobpQppGwVIqm0LaZEMVJIF5kruaPcHx/hmr8GS17qZ85GJfFgLnc3wAJf/o9LnR7kUNWwfme3xV2tuPrCkQoDQr0NqP4W1w8452qm3OrjTfB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521465; c=relaxed/simple;
	bh=MXxOA0e23yUVQE19DoFyqAM/igT2n25s22U/pbkdpu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRzOzUAqOe0AITZ3W0WoULyei/Zsd2epKuZxoKrCYXruUsG8U44CTaKOla5Tagn6c8YC0dYTvl6gVOtm2tbpdiAKn8hSyuaBJUTZOj+U3r55+42rTO7wF+7dQiZHdDkrqFB1Fwx9DGe8HvqqayxhPhq2G0AUy1JzxjPE27NRHfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c9SwftKQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c9SwftKQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8Ucb5014629
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T9OutginLD4
	JovrJM4X4CKlX+fhBcBPqmCHNdCEWKNo=; b=c9SwftKQIR74PiFy9Ts9TikpQ/d
	3tXHf+yU3kM/eAHA/zIj+X5W8RdzPDW09cRaNmixQQOSxODRyecU8xMddw5XJTQV
	hVnJ+16+vHTQA2Ga3DBu6ftt8s4HEwDiMG41CXxeGyYOfnMQFHHf/lErJmPVFO46
	n3kqtRk4TduwwQzKDZlfkqD1BHvfdtU3ON1b89BCORAHHCxYzMFIeF8A9hgAtQCY
	f1Ehyjw+NVpEJ4HR7D239cLM6JReoRiLCoo8qXQBbphz5gGdDFO2CKBKWLVNQZRz
	iji7v0Q21lC+lHkN0o+8QXYbBKhiejRnuepbeT4npd/p4poS9PdRwdflkWg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh074rsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:51:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70ba7aa13dbso70239256d6.1
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521462; x=1756126262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9OutginLD4JovrJM4X4CKlX+fhBcBPqmCHNdCEWKNo=;
        b=rEgqtMUcKqWU2D3kBHeVtrI011njx2+m03NDRvdi8T65PD/uIWPlPTlhMMFl/fa6xU
         6uEJDBJcuDpiiXg4GiRWTAUUMXubRvQ+ZXSe4fxem2KPWVkUWHOSOzERqwVG48syx9Eh
         RXHsDrL6KY4nmb8f9jnBrCptXwyMJoPNcn4ZT575m3SK8nb1OW62gc7ZgaQgugF2Re/q
         bZLqmd4U5bmoiQ4VkGbUeMBTEAV1OHTki2biX3vR5cHDQ01QwpbvC1RNV0IxNm4UXyvX
         EePAsR/0Xbx4/8299h1yV56NGKnNhCLqz7I/epRf7AkENNc74GW3cY6zmVKRe7ehixqE
         AucQ==
X-Forwarded-Encrypted: i=1; AJvYcCXISySCObWII+PddbrlOzuhorRx9OkxdCwd4GhqLE3HAGcVO6ODYIvPD+vdDAsC6GWoohlgL0cTu+hcBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW2uxgGHOZA5EU1fBvmKUyr/aaklhimWX4Zbs4p7+v9RjMdbmv
	NczMw51bn13st618mhJK0FnXGN+7MLCdJRQo/nLp43rpm1A02tqi8TM8auJWBEpKaOG/8+LQANB
	k7UVAeMInLdk3trniNTN88S8qiaAio8JH+11qsuZ1Q89Xj1CA2H/NEdGAR4SZE+9zQg==
X-Gm-Gg: ASbGncthpZrDyH0/yGyn5upR9A27KDQRVjH7tQR9meUyGRfQxsOYTZKMKmD0bUp59SF
	9BuoaUya0YVKQiDlP0OChBT139LcKd/v2CdiNzAs1Q1A2RIARxfPpDkx/KaDotZi4ZlEtw8SrTm
	g6NajMAHAcr2UDU39neP2nFHfzTj0pHyi019q7E1BQ2nz8HpqybTMWmOPuqU4aHSVsZtvCKmtUj
	LoOgzzb71KMrUEKVZpFHDQhsKmAaqHDOAGYEUf7CASKZep9IYtHQIoXCTvC9Xel/P7FgCufyOHL
	czz8eZ2OlFOnDkI5kn+GZm2wBXD/wg2ttnsWYGkQqb85Rip0I2FFfA==
X-Received: by 2002:a05:6214:1250:b0:70b:b660:4d62 with SMTP id 6a1803df08f44-70bb6604deamr48746926d6.2.1755521461665;
        Mon, 18 Aug 2025 05:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPgoUzQkhRctOz2bsEP6KkdrUtGiGkLED0ER7M4x3mmHheX7uMf63MEYPSJMwsa22+gItE/g==
X-Received: by 2002:a05:6214:1250:b0:70b:b660:4d62 with SMTP id 6a1803df08f44-70bb6604deamr48746656d6.2.1755521461193;
        Mon, 18 Aug 2025 05:51:01 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9b27sm12537347f8f.44.2025.08.18.05.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:51:00 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 4/6] ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
Date: Mon, 18 Aug 2025 13:50:53 +0100
Message-ID: <20250818125055.1226708-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MU0IUCcT7NHH0aC2z1yW1VW4oqCz1ydX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX24bMLfmNjSLz
 XSqyy2O2x4Fm4lC8zB7KVl/XJRAwTAQhYu/GxFT3+Kzk+3e/12EapGJ/YOepbEToBlt7SQnsXbY
 vReGQnJ1xL8wefG0LvLw4ODLXZoFxswCXhPd4JUNnH5ANkRCjuP9sC8ELqYw5OpOS6AVLj9Yk5T
 agyu44T2aAuDV0klV6FmC3bt79dtXZ42l1IlXffvrR7dNbfpqy1arsC6SLfZ3tejIVXyjArGODS
 cIq//vVcMBe1PjdnXHBYgW7Y6BP7+Llv1T8QFK7eaowDcziwgMLBzelL+UkoYyhODOzTe24Q5ml
 9CxoxMdGEntixqqDgERwam9NTH+ruAefL2Otbhk1GFY6itSlHCIzZjVDpU4EkYX3zHCeTtQDbtO
 U/rrvKP1
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a321b6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2ggkzc9sqBovd5WwaRoA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MU0IUCcT7NHH0aC2z1yW1VW4oqCz1ydX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Fix spelling mistakes in I2S_INTF_TYPE defines.

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 617bda051cf8..efc918452e2a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -462,8 +462,8 @@ struct param_id_i2s_intf_cfg {
 } __packed;
 
 #define I2S_INTF_TYPE_PRIMARY		0
-#define I2S_INTF_TYPE_SECOINDARY	1
-#define I2S_INTF_TYPE_TERTINARY		2
+#define I2S_INTF_TYPE_SECONDARY		1
+#define I2S_INTF_TYPE_TERTIARY		2
 #define I2S_INTF_TYPE_QUATERNARY	3
 #define I2S_INTF_TYPE_QUINARY		4
 #define I2S_SD0				1
-- 
2.50.0

