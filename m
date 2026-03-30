Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69DC3D4138;
	Mon, 30 Mar 2026 14:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879287; cv=fail; b=U67YyC3AvOwAmoMXxd/VOslZm01bAhGoSoG/nSlwqetDk3ln8f6Iazm65RIgAFK6gImXfzsh3rzu/t4HuG2Rg8rgthqmCNAdW4pcJbEVTh8Y6VwcRrqtIK3rQbOu9RWgVP9N0ncNZVdj9YY1lNMYgQmP+yE91P3oJXDzacKSdi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879287; c=relaxed/simple;
	bh=N+MvROyHHYTgRDsmI+QDYZIOK61NOiPTfMs8VeBjjK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EEeNmX4RZmskKdR1/GCUeUZLpEazlmPpPRijqIgnkbvox63Q8xwcESSwW9ypiNslq8qs7uZS9I372+Ip4Sw/VTwG5Yq6nP7P7IK1XOAS0UZBy4NPNEcjLr0wpwMrXaVlMB/0qp4Kv3va4pPe8IWzJfVi89PR9WUxCsYAxGtoQbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hDTG9B8K; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=x6Liah0P; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hDTG9B8K";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="x6Liah0P"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4uoaj046784;
	Mon, 30 Mar 2026 08:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=q0yx8qyjgRl3qPVqmoWezfV28DD8/iHHRdDfpkE6VGA=; b=
	hDTG9B8KISd/29CXmMv/NEUrkwUYaIV3JWgqf4FfgGI14vLZ/pWDQMQrWkEzDxdE
	e3wHNREdKGE+jWl7sgJuhmGtVaVHRElQ+G+Nj+8rVqs6iO/7htHhIx4O3R2XGZUw
	QICzzMTCfMhYuYDJ7J0wR6KYQIpDkyNZwgoh52P9ILjZW1EtVMgyxBHZPu24Cjfs
	ypsIYe11Zt1+ZwsDsSEe/vw07x073k6ITHDV8lU+DND28Q4ollRNyXqTt8Q/vf0C
	PRcCITPfCVa5dwgP4fAXd8K2nRusUS0AexXzhAU5B5oeyP9SIMfNh9fJ238GLRSn
	KNiwklEE/tvkvZA/OyKEJw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023110.outbound.protection.outlook.com [40.107.201.110])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d6ccxsvga-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 08:47:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lj+E6y+CAOmF6OS4mTcmmXAa/G7utpBwlt/UaIULMo6WxpyOXvf1t3KPYJwBY8VjUvyVIpIwHg5Te5vKUzRbLpSjnVPNsWZMsgA7nIDJ4/BxdaronPDGoIZCbmjHbdhZWgmDmvE8519bomNaFW1uZ0zdPi14NRclhcI+Rpnv6lcDCXlXvkomWFKyudhwj3oPbHAppE/+nsGYnHOmwOkMIEItmZXSfxiLJsoXKp+vjRGNIuZ+TOo3/vB+W+2PqX47x5hadpA8ALS6l9kl8INpRxz5m2cnBYpYxsDbwfn9nbs/w7cktdroBVGLeNUbEprJ9jxkMresK9Ah6Mixv2o+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0yx8qyjgRl3qPVqmoWezfV28DD8/iHHRdDfpkE6VGA=;
 b=pPJHYpaM6JvIRkXafiIzNGhNJ9AQuuI7XTGS1wvJ+UzkyFW1wYlmZ0jrKC4faYctlHKLwzcOcSN2/pb64HDbnYSguNLycgt4tKnGyCltpZWWuzEO699SOSAkqdVN5eNHqcbgYrsv8agCMNnnlb9vXB8H0ViOeotpDmknxFhS5jaojOeK+UgYkBLKbJZQUmgiG0RQ7/ftuGMuXKxVniqyk7TckiCw5+4D4KpJsBfoLtpcWLM1Mkqd8uQLDVKhREDpW4wpfj5PAhNnNPE+g+kppnaSwbu8RlOZI8mMMN5dp82skn1xYqu8ROGN8vqr5L7Y7JX8rxfeWd74hXnFDex3Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0yx8qyjgRl3qPVqmoWezfV28DD8/iHHRdDfpkE6VGA=;
 b=x6Liah0PeJpaPIGyjyvZVPEs6ioj15/wVU5CoFTEqbn6LwBQmQ1RNjeszI+aV79clVnaGQ7xYmiA3JhqEE6nGc21BO1q9lGI+jslIrVjIA7LBn9aQ+sBhJnzynSc8zF77+vxPMeOtu3a/e7NbJh5owl/Bu8+FlJgZYuzjDc/NCs=
Received: from CH3P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::33)
 by CYYPR19MB8119.namprd19.prod.outlook.com (2603:10b6:930:c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 13:47:21 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::42) by CH3P221CA0024.outlook.office365.com
 (2603:10b6:610:1e7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 13:47:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Mon, 30 Mar 2026 13:47:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BDEB6406554;
	Mon, 30 Mar 2026 13:47:16 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 90042820247;
	Mon, 30 Mar 2026 13:47:16 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/2] ALSA: hda/realtek: Add support for ASUS 2026 Commercial laptops using CS35L41 HDA
Date: Mon, 30 Mar 2026 14:46:18 +0100
Message-ID: <20260330134651.443439-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330134651.443439-1-sbinding@opensource.cirrus.com>
References: <20260330134651.443439-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|CYYPR19MB8119:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 964b2989-81f8-4fb4-22bd-08de8e62dbd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|376014|22082099003|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CH3GXc11SlNKPT+TR8slI0v6WKTTNJvsNLv+/zDCz4jZMDgn7olzbAvPUqK7vQ2oirtBvLJFM682FvopmLLLC+xHdOoDWLz/Om/6rnIDHuAQUHFcLRK+6wuK6e9qvbUPjFjAuTns02y+H2Mn6tOPrejdbh/SroWCaIRu+MBZ1QZmgyE+aol2FCokaqQN+1og4O1LPnodTBzqIkvFm/MwQ7FpHno1Ej1mR/4Dj2MN4fjrDLaPOcgsuA1r2Z3iU7wQ6sG3E8B3DVsRvLVXrLQlEWWVoZv2rP9SwZexIWQ+73Sn702q35VcTytyY0Uw21cqk7a4uelYEuVyfNsFGF5TGD05cvZ4ALyCzBHeBj0zIyLKtRiqCpFCdeJ46Djry9r5BZ5YQSRKD8S1YzLsvOC0nDU0gL5tZwQn/HNBo4o71bVaWJ4tLJNDUJNILNePiYUIcZn80IbgoruE4DkbydKe1+iOdX2tWqni4oL6zRpb0wLQUIx6KWvgtSOYOREW8o12FP7I8apWl2kmPDWWE8sNaQzXNk014wTk2v/xisSxKS6G06nrTEkn1jZRaD/umqpZV069lHQoWXyQ6ecgNnC4hQcElN+avbBw7VuiLug4USfwL4U25srOiQ2/WlU0SXf+nQMTymHxP23UzWAiV/7a5WjCPiSdLia+rqUzmPAIT33Vg7815ffcpB+5dvhu3GTZX8f+ZD21XTvMMuqRa1pq2Ah4w1bv5v5OJ+BeEYhWEbq7BWWn19fWSEPdCyLk4awX0T0BL1gChkNoQrSonYO7yg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(376014)(22082099003)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yYgXTic42E0ppq3UkKqYmiJ5Cgj/UQ+5dIAWeMxYqd2gcf7mX4qvoUE4SAufntZI8GQW/XpaNn3epBuyYLDaqPZlZVxkfjLlYTfnnTHVDuZVDSGvJUI5V5mrCR/I3VEQngwjqHP2IFW9VKf+7tEczNp3qeUu2skH7wH/NHPMAweTsbNfSAduAYTD6wQ9gqVH677VT1WiXAiaT6TjUSADi5N6Y59wrKExCKfrkVUTCH4GBxpBZ6HtBObQz4s4EHqwMuiaXx5FJ+tFiLn6UkankC7I+09jVkcfI/foYefB/RovArpyZpdCFEbVIeAzPRJIGlsPwtepEpd0H74ov4Q9pTBjIGNC/vwEE3pLCBSn4q8PEV16cniHagWPBTm8X6QcgLPBmqVs/6kJqx+atltCVv/b6yAsrzCvkQtiz3cmoeRoXl8X7ykAub+XhJqb/TTx
X-Exchange-RoutingPolicyChecked:
	TkH5qTgoBF7kxFtBAbVGKwcQbY+xb7PBsX9eDxmb/mYQDt4UYQw82QPPxQmmnrL9No2Ce88DqjGVRpYxNUCmfSoyyzkdb/OpW+a2cQg153MaPQqwprPpmbmzAh/aWS5mHyodWskyGEFqeFZFgurucd4J3glnljCethI+EzO+RBympJMtFCbQrPNSKsEj7mSvQW5ZwLDtHcYKLSosa9IhIhjAYDRIx1IfBQ2oeYxTdkz1kB16D5N0v2Q6gR53o1bEMNWef1D+luNHet/SGKy3D5rbSg5IwAbRQshewXD68mLJRp+sNaHHGRaIa0FdDwn2gI8LLJUbWE4Dv+QmFBwPJw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 13:47:17.7003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 964b2989-81f8-4fb4-22bd-08de8e62dbd6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR19MB8119
X-Proofpoint-ORIG-GUID: DBYfvc_yKdMansm_1me5jaUW3Z9E-AR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNyBTYWx0ZWRfXwW+Pv9tI8MOk
 hqT5hjMYojkCnVT+G7prfvXNqFX0OmonD37bbwYCtBfQsjjr51EOdtkjfIuWWGroSLrsOcszquM
 LHWny3UlEfAbAsVloDf+gP9nrYOtxOnBd0DE5wxJzE/sOdJwivnwwO2x6tpp4V88GEHeKXpA/TA
 l9l0J2gHq5a6RB5M8W9BboZNDXr4abevYIjJT2vwRTSifNdaSY00kr04R1dtXQyTmOLtiZ4xyr2
 Z2G5tizqygXih2uKSw2xRC1fz6q06Mia8MjkpxKNNE+gguGSdI8WqR5blHFwKQ/G5U20t7QyVWu
 xrkUthqSZc8tiH5GpsiEl/WZEyaDkXIhWK1eez8MA8eYz7/KkJAzV9hrJMjo8nlbu3eMYiyy68/
 esJFAQP9Kzo3vlAyKZRn/v4QB/ocvRC4hGaybgfq7fQLJ2PtMOn4HQwxteofFTrjc2alAuJj3Sz
 0yzRUcV7BDGPoa5K0+w==
X-Proofpoint-GUID: DBYfvc_yKdMansm_1me5jaUW3Z9E-AR1
X-Authority-Analysis: v=2.4 cv=Xvb3+FF9 c=1 sm=1 tr=0 ts=69ca7eed cx=c_pps
 a=ALzLegKRD8J3iQ32fiysVg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=2lyKzjhrc2nKIjESmZUA:9
X-Proofpoint-Spam-Reason: safe

Add support for laptops:
- ASUS PM5406CGA
- ASUS PM5606CGA
- ASUS P5406CCA
- ASUS P5606CCA

Laptops use 2 CS35L41 Amps with HDA, using Internal boost, with I2C or
SPI.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/realtek/alc269.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index eb664d57527f..b195b493beff 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7350,6 +7350,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x31e1, "ASUS B5605CCA", ALC294_FIXUP_ASUS_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x31f1, "ASUS B3605CCA", ALC294_FIXUP_ASUS_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x3391, "ASUS PM3606CKA", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1043, 0x3601, "ASUS PM5406CGA", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1043, 0x3611, "ASUS PM5606CGA", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1043, 0x3701, "ASUS P5406CCA", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x3711, "ASUS P5606CCA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x3a20, "ASUS G614JZR", ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS),
 	SND_PCI_QUIRK(0x1043, 0x3a30, "ASUS G814JVR/JIR", ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS),
 	SND_PCI_QUIRK(0x1043, 0x3a40, "ASUS G814JZR", ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS),
-- 
2.43.0

