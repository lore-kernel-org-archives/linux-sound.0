Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D83A22D4DD
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 14:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764770795; cv=none; b=UGmt9f4cqHfI66VqwYgPbnlmFXmdF9TI/hEiqDW6JTyaHvYoVDy5EzeGIWgQeypbDNexmjrpwN59VbsZZ90UmsidPcJBOSAkVfttVEftel/N5iDIKQdTFYgww+NTw1IW3vbmZqeQl+UIeijjegu6/ECNTxTAMMJAgforYgnDICM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764770795; c=relaxed/simple;
	bh=ULORD3Nee9iQt6IG5z5ND4VmHm+dsifxczAT6/IsbVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cxxSB9jkhtXR4V66eSe5Tpve9ULta5H82LrPjy9Bvo4MHMTgVt51i+bKvskVnbThiIJDRxhCQVQbm+3a1qe+egapBux1sV9IzNh7s+n80GXQtFktpR+d+m1PCEKshIXeScKeM2numqjJF4LCH7Jq1x3j4c1dPamLvnNDGTL2N3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtVkBttU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K3HRf/CU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtVkBttU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3HRf/CU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B3bbP1536211
	for <linux-sound@vger.kernel.org>; Wed, 3 Dec 2025 14:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YUOiQ+4tRELv6WOPEPoKfZ0qRhT6spqTIFQ
	UmRxj4gU=; b=XtVkBttU/VErFv7rMCFAUD7QY0m/9kah7KTLM0Pzk6wHEEpWkKx
	NWJa4X3j55fEBgLmeeVEYVqKM2juJ59s+zBYgvNp/sGNrJMJaV6Bfc6/AySV5FRw
	xvQ8rlW/DFVEM0AhzRPvtsBVnPCxv/kETk+peSdXPje7tXa8S5b4RwXBpl9z2mW/
	742KNUZRYO0/KlDXzh4QyoysYHGW9sB+VSXnHsKGRT1W9wdXOG+xMUvYEERMCkfm
	toObCEFMd9K8XHDZNSEGVim0cI0gD/SLm+cqtVa11nKUhwSu+i57xANg2VoV8+BB
	fMym8WFz+pD+OORobG8MmbMr8Wuo7Bh14fA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0hrfjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 14:06:32 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9351ea95712so7032533241.0
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 06:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764770792; x=1765375592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUOiQ+4tRELv6WOPEPoKfZ0qRhT6spqTIFQUmRxj4gU=;
        b=K3HRf/CUF93/Vx/LAH+PuqXL8vU4Td/AWlNfs3WW0SVRijxW7rYC/RHfNdii4wOul4
         h0f2BceRr5QMp0d1CjWGZRDyVWPlN/T7n/ByKcnsctzIyrIp7LsJEINc27u3dfWIQJpZ
         x0JWVNmpWaWmomF3/re0RzrbwYi90bYQHBaGe36y/c8b6aqQyHNBtmNQldRU8EbnVpZ1
         MQbYGbaivXxmodUfZcx/BLLaJptWW/W74z7e2mroYI1jwEqHWpfqUrqgPW3C1Yoyiw9f
         aBwnW2/cXhJXqtYHpHZW4E+iTLZ5X9fJFPoUggpJOjqsAJ5JDJjvF3iHbNjJhpv12tG0
         k+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764770792; x=1765375592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUOiQ+4tRELv6WOPEPoKfZ0qRhT6spqTIFQUmRxj4gU=;
        b=BgFeV+bKH6+uutlZI1t5kondqFBjTZ9+csvpA9FJOJVfkW9OYZE2GNsojJU8o+htr4
         kWR7VO01BjdeBknv24pQLo1bEkZvpJrUr+5WaBvDQ5cYh1UeOinLqEdzby1d4O89keyK
         145P+gJyx/Lwjag1+Uau15CBpt6opnWR0u6g0gi3eVISKVYBfGfCKAVf5mU8F/fhVAAs
         IHip1eDWoPhoNO+J1oU80cYbW3hNsNuOb+t+o3/P4acJF+W7nJSO0mU7iMBo337hCpWL
         UHlVdJUC7vCO4up/DTIQC5WBn0tojBRBRvR0r2gU53Cnziky0qqwvvPba542W7+Mnrv3
         v6LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl27Zj9IbrHDdCtthoNhU23XFWLyyIEGw7gCPj0FSvmxBAscxi90pYvUY3pak8xB5Ybx7mmWU1InNaug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzA1WSr9U8UsuG654VAlX3+KXis0Rweyc0gMG5vZvcTOPjfbkf
	5+0042GxHRAW1x2PAUYd7fpndzFJY44Z4a15gNx/3x2Z+4VdJDm+949BfwBkosmA7zBlp2pgF3t
	Bqz1pBq4TXmKFzBauvFJa3f4/rGqRf7KMyHqqSoha5ubQs8UvJsbTODoNvY4j2pX50Q==
X-Gm-Gg: ASbGncsV1mR1cwF8tx9U6XN/+gzSU6rP3VPp7ig9jAeQhi24EcexUcDdt8Na4T3tkVw
	zXYycPN5soPZVsvvL9XoK+Ckv5U0oQUuBQ/n9xAab+LkCZpkZjV3DNF0ZOEyrkq+dh2fZxE1yJB
	syu2Vp0vaITg0wpSCyEhX7cI2UN/O8wf7YtBwf0KL0vPYSD2qXcPXu/1yWNd5uUNRJQAxulenhz
	jzkXq3OeLJfWczyzxzRy3ccs28Ml4zOVa6Jwy7ZykIWyIKGuri60OToG8mDgBOdEQa2NWkHwODD
	c3CT+VDkaMywhTSRZwFzkZDkz8vzBTqHXwNnR902WioA0n2B7q4JSsWnTbl4651WLli+EwbrXiY
	dBTRMHDHdjZZal7NdXPOH10VPPA==
X-Received: by 2002:a05:6102:3f08:b0:5db:25b5:9b4f with SMTP id ada2fe7eead31-5e48e336a73mr729340137.26.1764770790002;
        Wed, 03 Dec 2025 06:06:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/Ehkc5vdz4n+xhETW2nUztusFVbDphsyvPLJ9Tv1PMzZwViPNNdecsSwshFOFC+SeK3YFng==
X-Received: by 2002:a05:6102:3f08:b0:5db:25b5:9b4f with SMTP id ada2fe7eead31-5e48e336a73mr729134137.26.1764770788498;
        Wed, 03 Dec 2025 06:06:28 -0800 (PST)
Received: from quoll ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a8ccbf3sm52590115e9.12.2025.12.03.06.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 06:06:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ASoC: codecs: nau8325: Silence uninitialized variables warnings
Date: Wed,  3 Dec 2025 15:06:12 +0100
Message-ID: <20251203140611.87191-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1419; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ULORD3Nee9iQt6IG5z5ND4VmHm+dsifxczAT6/IsbVU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpMEPT2hovVVp8ix4DQsWVMCa+egexZ4u26M7Nx
 t2vT6lvEr2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTBD0wAKCRDBN2bmhouD
 17RlEACFWTHmhEw+KG1nxyfifW2dapBHHiRzk06E6asHMNjeI7PMuStEij5EF8PdpUgs7JfW0sf
 iEqU/DmzX/fMBRXA/vg3d8rHcpBVdHJrK8lnUKvXRh0XLEp8zZCd/YPmhwBuheP+oUjor9hzmwO
 C2ccYrEYrlmYDz8QOKqOL9TuY+W5R3tVloVi8I58pDO/vLPpC+pFuW2tRvxqPXhf7VCaSPAA67F
 Wn3o4ybfQpfP6cGXHPg4mlyPWRyMg1OATOTJjVHGUfDvYcpTWEA8SoTktHSDKN/GcU9Fpw0sh93
 kjj3qSexXhfJCKFb55ht9Kzqb4gqmsgUlx+5XRWuYU5mnFo9j8sdYpmF4THSwyBDDu6btQyI/wP
 4Hb/DGtcx+5SQ8H6HUfrmbDgEoNB6pslnEfY+W5DfWfCaow30yBlXC03a4Dq4vGiRgthJwoFKor
 +rVeGHoWSQQ9nOLCjHNyNcVdFWREqTzvSOWnoZJ+CTPTmcodk5Lm6A+qbdsOb+AX8+GEBA4G87v
 xRoOGNY2tfafpzVPK6sQimj72Rrp5DnLE15e2DY6zeJwsfeuYaIjhhj5ngIo2N/72I6XY2MGm5U
 +1hDBnDJZ1NWpFdZoklqIbPmipY/FtztM9mKbd+p3J5HYvIipPZTh++mWtXcQrt8gB0LummFnLH y8PZYX7VK4xje/Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: c0Kh5yY3w22M1HGZjTlR57PbLPKhjxFA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDExMiBTYWx0ZWRfXyFMYUG/3aYVI
 M2y42dOklN7/eYWygXaVs/f+pwTzOl0mMdx3IJklLVb6VXEOEoomAIlDObQwTCgaZA4DkabzKH1
 K3lbdiKdViFkhl5a7qA1FvjTz99TUvPnKgWiTqYrgRJML0fbkmNHhVJ2LvbpuWo/xVrT0WlfENC
 Wk9VMR0d3pZoMzY9o70WFReZSR55ebB5Ewi/lZ+btQjF8LhgOl0J+6gjkazzpHmNCm6hQ8ZG9io
 WNe9DLEIsx9cD7goTyZISt4NaOsNj49ln2v2PwOZhTJe6k6czZIfV6+9LMuQnilF0wZhOI2qgJL
 fLd/bcH9yaafJx+vZKI+ObXssuvjPDZ9s5ahvy+tfSXWYrgkxKv4UGNTU7/z/fGuAuT7l2EawN1
 Rr0AzxM/YS2/+RkEoOr2ipK3LETvmQ==
X-Proofpoint-GUID: c0Kh5yY3w22M1HGZjTlR57PbLPKhjxFA
X-Authority-Analysis: v=2.4 cv=V5lwEOni c=1 sm=1 tr=0 ts=693043e8 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uI0rWgL3eINdTr64SRQA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030112

clang W=1 builds warn:

  nau8325.c:430:13: error: variable 'n2_max' is uninitialized when used here [-Werror,-Wuninitialized]

which are false positive, because the variables will be always
initialized when used (guarded by mclk_max!=0 check).  However
initializing them upfront makes the code more obvious and easier, plus
it silences the warning.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/codecs/nau8325.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 3bfdb448f8bd..e651263a9812 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -386,7 +386,8 @@ static int nau8325_clksrc_choose(struct nau8325 *nau8325,
 				 const struct nau8325_srate_attr **srate_table,
 				 int *n1_sel, int *mult_sel, int *n2_sel)
 {
-	int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
+	int i, j, mclk, ratio;
+	int mclk_max = 0, ratio_sel = 0, n2_max = 0;
 
 	if (!nau8325->mclk || !nau8325->fs)
 		goto proc_err;
@@ -408,7 +409,6 @@ static int nau8325_clksrc_choose(struct nau8325 *nau8325,
 	}
 
 	/* Get MCLK_SRC through 1/N, Multiplier, and then 1/N2. */
-	mclk_max = 0;
 	for (i = 0; i < ARRAY_SIZE(mclk_n1_div); i++) {
 		for (j = 0; j < ARRAY_SIZE(mclk_n3_mult); j++) {
 			mclk = nau8325->mclk << mclk_n3_mult[j].param;
-- 
2.51.0

