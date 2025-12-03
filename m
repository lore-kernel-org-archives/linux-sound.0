Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7207F34CFD4
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764778378; cv=none; b=tyP00WOb5fSoFDY+fXC/W2lTWdqhm4cBgh5/3o1qkaFuuLGhxugzUO6iMIS+UlpGFOkNxhIxRjr5AdkT5PleKD7/q4/TXVcG4DKp1RBAyV0RX3NHQtRSpWFsjs+lc6dbojUzw9epVLcXTnoRmhYMQSGtRMuhfrTpPbZjC/0A9yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764778378; c=relaxed/simple;
	bh=543uZbtWiMVGOhMt1EFi6MWdkGU4JZJce/ZXu+LOHz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzE+HKI5g0WSOGQ/ftlv3j0bZuTCapMd/TKFfkZ0sv5iBxdiPybdcfl1/DwCRWxd7oKEgazhw3J7voNYCz9YGVZJBpxL8WEpeDg0CQD48Kl7JbRPgC61nuEkNZ9l/g5eXUdKQkcB8O4IajrsP9uGlFsXkeEfIGbdaliC0IF6g+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guHAPy12; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TvJBKjhk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guHAPy12";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TvJBKjhk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3BkDGM2436513
	for <linux-sound@vger.kernel.org>; Wed, 3 Dec 2025 16:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqQszyJu9Cnrc6QCnRzCmahKIVnEK44SZYk5kehv1Xk=; b=guHAPy12PijowAkc
	m7HaFIsf0gpgPFyFt8gth1OZ8lHJl9RtTP1avZ+FEXzYr5de6c4pHDBrc8DV/whl
	cWKzif7d5BMH7KBFErCEfeQUChdWcC+BuRe94iB7NxrWt8h57NnyI+13ay8uCoCI
	ciV011fcZKMtKWHRS7QTTp1LOo3MwacfYwfW65KOPoRC8mWzqGKK6nSEyf9WqiiO
	SbPbPAYp/cQw36Yq5zg/XhlSliXSV5oEhx0DiAI/j0FbhmhoD+Oy7PL//ve1esp7
	AECxSa8yGjzN9ywU89LsBhIedQH4W6pAgkEUe+s3rf1aKS17b++o+HcfYsu7xKJg
	ocSCCg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmd8ryc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 16:12:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b51db8ebd9so1026126785a.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 08:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764778374; x=1765383174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqQszyJu9Cnrc6QCnRzCmahKIVnEK44SZYk5kehv1Xk=;
        b=TvJBKjhkBPSSn2OpMztRQMLc9mnRFmtVgv2owSPnW/ce6EcErjRzf2bAg5GzseDdaN
         d80RZSOEqdLMcQP+37oLLQs/AZCXGdYQbkvp9n5Pfp0CscEeKkwEm/7r5/GNrRoQQQC0
         8SCLxICJ6NwOuMjYxSb0roHrGdZWTHFY4dvrXBAXOGac0dtZhTO4axuAw3iOrVr+4f4n
         ERADD7TLoYE7dGH/0zzxAajGO2fcrh7pCsx1BE44qvedCgxkPEl4wnrIHXepUB0bSqFQ
         mck2hPhMvKv+4AbOA1fmdnj22Bpn1YLgOcm2BagQy+30KKY0LIZXBR2jPFSbfJu0R4sA
         ORbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764778374; x=1765383174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NqQszyJu9Cnrc6QCnRzCmahKIVnEK44SZYk5kehv1Xk=;
        b=N9Oz8dgoUDgfsRV+U3BU52uenP+lEd9PkE4M8azOx/TGx9Jl1tlR3u/mM0dKhyFSp9
         79sWwSGg/bv0Pl31smvh9B7pI7bc9lFi6gPZkD1YCXLoj0wKjAda+1wxYEMbZHsC+gaY
         JX382EH+UKbZes5fx3v9Py8PTZRbtClzPnTCKabZfWkqy3ilE88I6BGW+p6gxijzFld7
         pNbokTIn5g2zVYH/igNr2FYF4XvV6Ul0xLKjjdMLIRORqttPctT1dSua7EI3+EfoMDzA
         meaYeH3J+r+fegozsIV2Wp87Qn1JOvY3Vc+UBKWhEOQydFolbTM4sBd689fJ+e8hWC0n
         1CMA==
X-Gm-Message-State: AOJu0YylsqCOcpRcVexfIvVvC5cIifhDNEPxxS6YpvC6XVhe2Jou0ClQ
	d0cBm0yk8YXoIuKHl2D1yW3SKy8eVX8IJjvi9hZSyS9MiBV3ed8r2Bc28yZqltz/D2gIQQquFHD
	jiPjn1w+vB7Q/15yBw3uuLMXUgeoRqkA8vajdw3/Capp3SYwMjCcDlHk4SWLBelK2MQ==
X-Gm-Gg: ASbGnctx92uLddgheWqrdHR+7wN6xuEUDoYqRLrwWnSLxdRT1QnIDg230VmrUClU1p0
	PrR+ak1hMmdk7SL//ajMWsx9NvGK6Bo+sPdTZgpei2gigQGtPQDm6O0BovCgMwuREHik4JdAvLm
	BkmEwv/4KcFPHogGpKu/zE32O3nynRuSPWlpfl+uk+GhOvM/8x4LOE6sn/Sp7VobWmfKnYP5BrX
	b4XGvIE2LR7XgqJa52Okp0udKr5O2YXUgjgVXP7FC0xPeZeoH8ljkwTbpFmbPE8WWmmTQBAfEtt
	XDyzhuUVCan8w9sQoYTilhRLCyVpIJQj3bcPGbTEFoOaUd27xlIgGJT+Lse+25BL8hS8rRFLJ1W
	Ssj0onnrrF5W0d+H7OMPB84dCPTnBbXKFnA==
X-Received: by 2002:a05:620a:2902:b0:8b5:5a02:8658 with SMTP id af79cd13be357-8b5e6a923c9mr375913485a.55.1764778374431;
        Wed, 03 Dec 2025 08:12:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbE2KBuawB4wi3v4A5xeU22zVmkxn5Wqy2t+Sz9WHgOn7UoHqiKV0A015/doABPqTp0AFP7Q==
X-Received: by 2002:a05:620a:2902:b0:8b5:5a02:8658 with SMTP id af79cd13be357-8b5e6a923c9mr375869785a.55.1764778370225;
        Wed, 03 Dec 2025 08:12:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b021cd2sm23688295e9.1.2025.12.03.08.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 08:12:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 03 Dec 2025 17:12:38 +0100
Subject: [PATCH 1/3] ASoC: amd: acp-sdw-legacy: Fix confusing cleanup.h
 syntax
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-asoc-wrong-cleanup-h-continued-v1-1-5142be4874fb@oss.qualcomm.com>
References: <20251203-asoc-wrong-cleanup-h-continued-v1-0-5142be4874fb@oss.qualcomm.com>
In-Reply-To: <20251203-asoc-wrong-cleanup-h-continued-v1-0-5142be4874fb@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2259;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=543uZbtWiMVGOhMt1EFi6MWdkGU4JZJce/ZXu+LOHz4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpMGF7V+fZNI1QJO2gwVsb7vCTymR9t/liRPCi5
 jOqK2JyBPCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTBhewAKCRDBN2bmhouD
 14uGD/oCuy3no9CwhtWLNdxkneQFWwU/U/5/0WY6HMB7rhhzDIr9ns5dkWzQnk9rduYT4gEVDll
 v8zwvZzkq5vZptnxQzmNAWLTDQoJFB2Dc62rqVVm/dEQ2908FCX94e3UuvtZLD/d3HSrinzEwiv
 EAtaWyTl0BLtga9mhojWYraTNaB7x4M1vy668+Ss4GPRtFJZq6t97EsLt+zkXODGyHdvtNpW6Uz
 Hk8Sc8Liwy9H1jSXu5UtLn7JVAhJVSiEGJf2b86joCrcd2Jnh1+gD0fP2yBAku+4hQ/XwRZndTC
 TJWkGLSunEcBSvs1h8PyMQ/BmXfVCmjajHVOGefms9hh8FWeV1+fL0q/Tr0UtGDRFmEtWcrMKbo
 E0eiU6NGUsx0CEQSxb6I2/VbeVUbhKpS+xfHbnMpHFG1GxK2rmIKkMFaVongaV9aHGD3hgII2Zn
 ewUu29T/yzJKKg8YH0wpkUP7iC0rCua+MFKsB6IeHub1nmnq2X8ZN2lOIJeMdLRj02kC2TtFfE/
 zb6mCxpsfWcGfDMaqrGWTyYcCeMFGR6p/ni93l34mPPTDOH0oHVYs9OnIOjC+1N6nXAA1IKIFsq
 SgVgAmBAaJ3ezVv0UFWDDclajO6c7LgHOCaKqrmIVyixbmQTi4XzOIF1kNYpyHzVcQBbCjIHlCz
 T0vaJ93raYakneQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: CeSTBfR6FR3X1pCH3L0Pzi2m9M8hp3ys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDEyOCBTYWx0ZWRfXwlaTD7hRxByW
 oaXWFm+Y0+YN/6n6VXyX/wEasxp8ueUPcXNzO62o2XsBO6SnvlQ6dpyT9Ff4Q9lBuDThQB98HPs
 D49aNIEGby7ekPYysJSrZ9OObJGTWyaVec8EwJ7C7+YzukV43BJRLN5GamuIxTBvpfKTcsROVm0
 alu310bRQiJ0JYqoZE08GcOd0bNDw96taz1AJFNUgie6OlsVHdgyoyDp/yhdGTTpWY+T3/dMjim
 t1R5HcjihfvuJ0rBB+04pnLnUDs3uiknPtakOHx3fkFmCsV2on5yGFJPmQ2eL3iyefVZLmEwX1t
 tw5ZgQwYFhmmNeCstJu9amZh7tYT4Jx9wW9VjMbbxrhSSfrxDRylzF2yOEJAZE5jcXhbc5bBhQF
 799Bquzv7PPQfaF0SJ9515FvCb5xhA==
X-Proofpoint-ORIG-GUID: CeSTBfR6FR3X1pCH3L0Pzi2m9M8hp3ys
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=69306187 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ibVJ-gTn2yuHLo6HpAsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030128

Initializing automatic __free variables to NULL without need (e.g.
branches with different allocations), followed by actual allocation is
in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index fae94b9edd5a..9cb55d592c3c 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -358,8 +358,6 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
 	int sdw_be_num = 0, dmic_num = 0;
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
-	struct asoc_sdw_endpoint *soc_ends __free(kfree) = NULL;
-	struct asoc_sdw_dailink *soc_dais __free(kfree) = NULL;
 	struct snd_soc_aux_dev *soc_aux;
 	struct snd_soc_codec_conf *codec_conf;
 	struct snd_soc_dai_link *dai_links;
@@ -380,12 +378,14 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
 	num_confs = num_ends;
 
 	/* One per DAI link, worst case is a DAI link for every endpoint */
-	soc_dais = kcalloc(num_ends, sizeof(*soc_dais), GFP_KERNEL);
+	struct asoc_sdw_dailink *soc_dais __free(kfree) =
+		kcalloc(num_ends, sizeof(*soc_dais), GFP_KERNEL);
 	if (!soc_dais)
 		return -ENOMEM;
 
 	/* One per endpoint, ie. each DAI on each codec/amp */
-	soc_ends = kcalloc(num_ends, sizeof(*soc_ends), GFP_KERNEL);
+	struct asoc_sdw_endpoint *soc_ends __free(kfree) =
+		kcalloc(num_ends, sizeof(*soc_ends), GFP_KERNEL);
 	if (!soc_ends)
 		return -ENOMEM;
 

-- 
2.51.0

