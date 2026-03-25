Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5951730DEA5
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 05:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774417468; cv=none; b=BV/PPCNbairArOlGCtKJK7TGM5UfBFPKR7w+XobZZmwxCchUlkt32Iqzyvh5GeU1VvfXyr5RbG3iNMtl3tTyXJfar3EMmtKPgQDMptot8uVwH52pYJbMQoQ8BRxdNZ+7Vj+NzjjQVg+eKyvCHoTAxKd7X3TwToGZ+5DnfxJ3aT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774417468; c=relaxed/simple;
	bh=WLCe/t+HeqUO/8BoXNHtP30S8rRP4nNzjYoPWvfllu4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Hg9tPB+jb0fgn8CsI3OVKewcnsNNrAfakQS1SSt1bWY3wmkWGhba6EeTZiDb7nKV1KE2ydtmWmNeCj9FV8aTbpN5af8hERU6mHyEA1GPWrP/Iblr2MWUGOJGYbxmtB2ifKQ5cxKrM0nzZE0J+7VC2GQGDVU2OCg4J3noklUbvDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URn7TDI+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULezFNDx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="URn7TDI+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ULezFNDx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4YOHd2973577
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 05:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OhXXZsU144nDOV3KurrA1K9ytfHO9jrkfCu
	aPOLINoM=; b=URn7TDI+tAM59AXWGvXay9DxDSkJw9bhLcbeLfR3ZcmzaMaX2Vd
	zigEr7WI/ezdjzHECsxm6S8ihDnUwCjpNEGpd+tMTYlkBeMRi1NKXO/aFho7bc5o
	++wV3PGcHUNIPRyK030tIkDfobFZYx1m0v7UPdW57fIHLZHAPMeA4eeva/mwJVU0
	JfpR7Q2jXXz+SiEq4YUrU8tlM50HDXharvTkqMSAhp53sCRCV5q+NcQmmwobZVZS
	KDH+p+anqNaXcXPONgS6qvLzrszOYynyTM/bdKx6DVoEDoyYDumdSGWLe8IlY258
	J1os/UnGKl4EyfXEEa3oO4nvrrx1Lz6A7kQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4hnkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 05:44:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aeb90532f6so35725635ad.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 22:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774417465; x=1775022265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OhXXZsU144nDOV3KurrA1K9ytfHO9jrkfCuaPOLINoM=;
        b=ULezFNDx7s1ywKyObJoBBdBtu2O6KCp8DuaEDFlpMtO1Gf1muGC0MP9QUYMmixSuvY
         AcqrFRJsV2wxSdnni4ArhUStIk9XGnkT+5MZhrcq3xIZ0nzNda/yJOz+NPosTWkAL+fd
         DLRcIxaR7/CXqWh6gtqUneMB4lONvblFpOiEgQW+0SnprfrtXsJo0J8E1neamKZXwhlR
         R6zlhJHPulJDPCiUgHJGAou7hz/QJ7sH58OGlbEL2GTeOxRN22CCef5T3IQYCC7bTSy5
         JavkPDM6e+w+gRXS8t4RykpmF7HOdYL+1HNDLgli4ymIH3zaB/9l31U3VKywytya6mJn
         Ylxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774417465; x=1775022265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhXXZsU144nDOV3KurrA1K9ytfHO9jrkfCuaPOLINoM=;
        b=gEYVYZ0czxb2f1Rur+JrdmStcdCYt5l8imPUuAQUjrIwwWQIGSk3oE0VUanqC3DJk7
         Ow50GMsAd6Gw4cJ3inc79h3EgImtGychKoOCPr2TRuTyPVypkMhOt1U/REhuYWo1UZmW
         Mls5sPj8qrTY9kvAcjJTvUc8PhYeFt/Pw8iW1FqGhj/28kRSJvR+4+Q4Y2KB+PsHG/GA
         ty0RaiJvxkG2FvALhHvvRJyABTrVUhBvLTEaYeu9qA0Kn+WH3f9SPBnzYMWkNKBPE5VJ
         NfXu1P9w1t6KXlU0f+aU05/4o/6mqfHmKmrfMfBGYNqLXiIPrfwQQyrOdJppC8Wa3ESL
         oAsg==
X-Gm-Message-State: AOJu0YwlIENT0YgF0jZ0FZnTF2j4pocR7D7aHikMMzsayojavUmVmi5f
	66JbB4/r43Nf58E6ApObK/mod/MBBsFLEHjql0ozbrHKRazkf4DI+1RSVOJo2NJhR3JVEBKSa6a
	3pGue2tA2jyupRSOvVka2gHtslmtJ3q3007KKTz3ydIICgkz2/S7/vCOZQ3AKpESSrg==
X-Gm-Gg: ATEYQzyNtRmsdNa1nXM1n7jMGsejxVhhWuGZFXTNpL1deWPCZHKind1hDfK6ZccaEmg
	DIU4GS0iGxSJD2ZJYRg1pGOmT7Ex1BKDkwC5bT5gUx2ZorSFi9YbIoMWHJi5v1dKvHL1N4XgDvS
	fXXvMeXp8cKFwO87/CXf6ZI/3qaHxbBx0jFeS0oskm7SUW7QTJgvt8giRyG5sdEQQ24jYNLBZp4
	LWW/9BLSkzXQADQt/7FfwC+ifv6mD+D2xZOG0pr3HUv1nu5b+NVn5eGAeFQOvr+F46Y7FdPZotZ
	ELav/lE6imE2hyhcqRlR4NsaotcDJJ2+48oJ7C7H+PNCreO2CayAtrASIrDrCacR2to6K1y1aWt
	+yRtPPQT2aHvj4p51i5A63xpMpf2pzAcgp+pn+9u9xZTKvy9OwL4=
X-Received: by 2002:a17:902:da91:b0:2b0:b18e:5d2b with SMTP id d9443c01a7336-2b0b18e684fmr19001545ad.52.1774417465371;
        Tue, 24 Mar 2026 22:44:25 -0700 (PDT)
X-Received: by 2002:a17:902:da91:b0:2b0:b18e:5d2b with SMTP id d9443c01a7336-2b0b18e684fmr19001295ad.52.1774417464922;
        Tue, 24 Mar 2026 22:44:24 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08365a62bsm223477415ad.46.2026.03.24.22.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:44:24 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1] ASoC: qcom: audioreach: explicitly enable speaker protection modules
Date: Wed, 25 Mar 2026 11:14:08 +0530
Message-Id: <20260325054408.1994556-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzOCBTYWx0ZWRfX6AdSE4JXpEDr
 zWsANMU8XMUd2QRz7+MVt14/lFxO0ksRSdbZbaYUhlfRik2Mui5vBaXvZN13syRrLXFx6KV6lcz
 2OJm9xZKW7k4vMiB7lROmWqBptLl15Dxe1lVOPfq85GYxPrkVqhqC8mVWRaQEpernOKzbvMS0nO
 BjVd3zlnmVzsdSNXGjCIf7ZSsCJ9EqmLsR1vsCBlfFLQ7JMh+tKvKUBJlF+sKhBGSWDZe57sTAz
 Oe8gIxnfk0TzpIwwXVHaK0Yk1hOAnlZ2FhwT9sfiBX5ocnjx71sLZfWEuG/ng1io+Qp1ArlXyKp
 9V58zGhh7vxZERAT3kgVxx08+GYQLEFLBq/xCxcE0EEXaPIH7ERMzvc4kgTI8aOQl/kLYqtCDUe
 ICyaImsDNLFWnwSGnh5LQ5uD2wcfpPdqNZM2a/As1tI60IEVjrTrFYOXyd19azjhQYogbVGVtr1
 twFltg3aVhiQRu5GOqA==
X-Proofpoint-ORIG-GUID: 52ybVmhr2D-XoDk5j3QQqCGnu8iY0jif
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c3763a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=FwfZqqFjWO-QNk8qJgwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 52ybVmhr2D-XoDk5j3QQqCGnu8iY0jif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250038

Speaker protection and VI feedback modules are disabled by default.
Explicitly enable them when configuring speaker protection.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 241c3b4479c6..ff8cd55b0d89 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1365,9 +1365,14 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 	case MODULE_ID_SPEAKER_PROTECTION:
 		rc = audioreach_speaker_protection(graph, module,
 						   PARAM_ID_SP_OP_MODE_NORMAL);
+		if (!rc)
+			rc = audioreach_module_enable(graph, module, true);
+
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION_VI:
 		rc = audioreach_speaker_protection_vi(graph, module, cfg);
+		if (!rc)
+			rc = audioreach_module_enable(graph, module, true);
 		break;
 
 	default:
-- 
2.34.1

