Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46E0333747;
	Mon,  1 Dec 2025 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605261; cv=fail; b=qfT8BxXfHb1e8MA4a45vivhkqWIQeSyFhXUbEOYdn+WCrmlLpCLt6UzbhUMoKL8RNgkqE3BWxq3aDhu8AEl3FawVwCUQS2v84PSgcq+cfPjZF7296TB4xnTR8BDD5H4c82/pD9VHgWodIOC/ubn0Boku7JFf3xeTAzhJ3TRB/UI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605261; c=relaxed/simple;
	bh=g+/omYyHWp5O9TO4mVyhBL31W33MXgBL9IYPniO5/Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sPrvN8uPPue7dGIxsF9ATaAHp6jVbmDtkcb3gHmfrlWS2rLBnViki3pXHr5dSxyMPgYTlYlyvj8D6LDiGKnHrovnqPn6428CVvrGnlfhqQBARv23M8yTKrPKq/uWUoAZlNv8zu8zVfR4ZcUG6jUCMHDlSZNevP2drnAeWVpcl9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bmnT0Xvp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TIva/XHu; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="bmnT0Xvp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TIva/XHu"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1CdDik2335291;
	Mon, 1 Dec 2025 10:07:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=V6yPyzua2kSFwKqS
	4Wfd0Ur8tQmxP0JjTHAXPmVbFfM=; b=bmnT0Xvpq3G4+Zwr0Yc6Us4buraxjzda
	EBf20RxncswEzZAEUjhUcsZn2ReTexvdNEisuq5pkxKwVDokwum5O9Tw/pvTnfLI
	u2wMrMVQkGkSDm46eka1NnsYx0RymNt20vfam4XqOcOT+MmGxXNBSSb765EOA+VP
	l4hQsFWyMIFutmHXENlQ3gxs18KOBmA+5Cey6BxeM9NSZaGQuihCqzxHHHNOqWz9
	S9uu6emLOGoPO2EC80yJFUljUz4kv5g04OnklXHI9jyb1Jmh9aeqnC5WOT7+a+5F
	4dZHtt+ZmdGsULQ5SfhtNPGis80btKNKtD2+h1Lq8RLoTaFXFUdoeQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022122.outbound.protection.outlook.com [40.107.200.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4aqx4kj47b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 10:07:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIRdUWEdhxwGAFW4aHEsIa8zziDJTWLGO8uBdgsYu65h7wfjMDOkGqR1CXtCqPjYwkbeg+si+zbw9If43E93KeuqKKaVwoWCwPt+xraqv3WDTfikVpxeuzYfH7bbyt64glmgNzvisJd4oUwEKiSmkM9hMWUyfs7avp3a+r16B7TNO2ZujT88i7M1j75mkS6ioD5YG2jYu+Axe5/en6soZWinHW6eEZAZvIKbd5KmAxU3IFY0DaKAJznbsIf1QWbRt5iyq5m8/14ooNToJ1SMhTZHuu/nUGqQ49sR2v+IVQR65In15AgVZA5saOoq6kjT9ahP7lqCmsrmsW+I11KzAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6yPyzua2kSFwKqS4Wfd0Ur8tQmxP0JjTHAXPmVbFfM=;
 b=dH/X1dXavgQ5XGqwHdqAFgAZnjKW3uAHdD5tW7TJMcks2mslqK9Oo+Q5Ijfgvl8EWFbTEHszMYenVoPr9x4NbHz45419UJKXLu3b0S3giCrzEtTgBh3mMLEMLYcBf2TWWWcobPMYdYE8DauYyGCxrdcUYHnm+ViFDzR6gWzLwyHKNJdfEiE5YEkM/zjYNiO+gC2o1PfTaQAJCqjns35VDn8PYIX287KXHYw+QPwnt4z9PGzxougpqaED1IBqqwtCMeElsQ7lZcPtByev+XwTicJt4qTZr3zn4qWezjcyNDdgVG1VfGv9T6fm0WBr1L/MSKlrpQDh6Zw8nvneloSbvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6yPyzua2kSFwKqS4Wfd0Ur8tQmxP0JjTHAXPmVbFfM=;
 b=TIva/XHui7ifo3n1nxoKLVwJrUI0FGVgDTbf1ixlmrqimLH1KiNsBurS1jtO6v9d3CjsVKdAn3B+DfQSWY/UAKpAiFCX67srurUThjU9MoivSavN9W7c27GaCgjeBIdE6LvNtrJKhxX1cbhbls3qBI71Ui3I3s4uXVrS0cfpD+4=
Received: from CH0P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::14)
 by DM3PPFB7284C048.namprd19.prod.outlook.com (2603:10b6:f:fc00::754) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:07:31 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::bb) by CH0P220CA0002.outlook.office365.com
 (2603:10b6:610:ef::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 16:07:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 16:07:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ED251406541;
	Mon,  1 Dec 2025 16:07:29 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C91FF82254A;
	Mon,  1 Dec 2025 16:07:29 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: Don't use __free() in cs_dsp_load() and cs_dsp_load_coeff()
Date: Mon,  1 Dec 2025 16:07:29 +0000
Message-ID: <20251201160729.231867-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|DM3PPFB7284C048:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4d9b3fde-9e9e-44f9-ae2d-08de30f3bb75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sTydSmc6HarEbxKnkvY9HsxWQOV3wIg5g7c8fznMRbvLAIf6L7vtulvz6PIg?=
 =?us-ascii?Q?JsbuzyXf3R/BEYS5/CMYSHvJ1V8xEh16B+5urlDMgkw2ybShf6waPS95J8Lt?=
 =?us-ascii?Q?/v6OBYdCTGEVM2F/oW8gLKsKMKPAx5EsHAbCHHzz18o2jXJh8kbQF5TCoBB+?=
 =?us-ascii?Q?adPvLTvoe2xtLEaOUD5G5TKSfbtT/ztM0Ja6VhNv1/fiTPBGMB2POT+xKwiz?=
 =?us-ascii?Q?Jw98fPK60asw2INdt1T3EzhP5/bZnXcr0oFUIWWFcI0I0u81oqJmIOz4kT2V?=
 =?us-ascii?Q?Np+WZXB3C/vLj+F3S2an7VVntO1kAbBdXRLeI8kuhItbbpdI/IEOsMe/FGJw?=
 =?us-ascii?Q?Zv6+iT2XSGz3vKUsV2ceMHWgxjMQc9WX7sE2u02rIOAfYfqy0XSblzP8CaPF?=
 =?us-ascii?Q?b/N+itdQubgcLiQQ+j3XyPcMoJDBP6wyHP2K5iclkb7zLRPQmT6BxYgivubK?=
 =?us-ascii?Q?9XajdVUl1+ceFtJ0HBp4qyZRdABNVUdfqNIXqoyl51nkxjDU7So8h0CGScoW?=
 =?us-ascii?Q?/ua4dNh+INse43xqqgIvtBsphkHTsGR+8lgJjHp2FG9n6lJCYm/1NabxRbB+?=
 =?us-ascii?Q?xsWDoM1LVyGWyncTSi22QpxU5YjnY55wRM9ySyyoeOlZ3CEqI64JKAp5co+U?=
 =?us-ascii?Q?djHOUJ/BWgss9bwjZf4ZMZMEdz13vfe9o9EE75wi9/ZRYSTKCWu3reo2/+Cs?=
 =?us-ascii?Q?SAb+bsNe1ZfbpXWqAxJnt6gv62N52v8g618ToLfqBLRBTJRNg0Cavqbo1FQU?=
 =?us-ascii?Q?w2XdtA7IwQ67CqzjQQ6a/6sMN0mdYF/lPTssqH3jrDUqQ19cy1BjSPpEp5Vy?=
 =?us-ascii?Q?e1sZi+yzvhmlkuTCw6wzw0nV9D9B8gRr05XsZo0u9Fv/DBoqGAL3t1iZoyTe?=
 =?us-ascii?Q?utOuuy6Xxph7grNU/gU8E8UUn2dmU/0atv8mAwRUKsNhlFcKq60rN1sABZvh?=
 =?us-ascii?Q?fph/SrN7a0jfATBhlPfaBbD5IV8R/DeAkZ+KJMGxTQ0iG7/7Ka8EspNOLgI6?=
 =?us-ascii?Q?LvrkryT0CJvxOBGSnMuj+/dzkSJn6jBS1NxLY1MmQXZy5bua+zamwgHPUlO9?=
 =?us-ascii?Q?l03DdrSzzeVlZM/gAZ/q9dEwn1m9Jm4r9koY4F5pAkUiQOt9CnLvg1cce9f+?=
 =?us-ascii?Q?0pKWd5Y2q0v0Nf1Q7v4LbnCfqTwkYl8bZGeAwmNGzkNLkUHYtLhrZGI4Y7Aq?=
 =?us-ascii?Q?ANqU+sY10wb7z6z584FXQBktUZGfBOs1aAoJ3ZmI4KXUwKEx/zIABIrwikSN?=
 =?us-ascii?Q?I9zkDLnuPoPZrBu98v4QiX5vd/flMNufjKzlS2vF/67I5iAAr9NlkkYXKUWD?=
 =?us-ascii?Q?Z1SWZbyGljfZgEOEI5u9hMF5S06srKNbaPYWOH+jQXsT4OG7p9QdsAvL7F3P?=
 =?us-ascii?Q?6WszgXlZ1S/mu6HOUIxPXqAl/JV5iUxegNtNmT4cG5mWADqc5VJwGh1JX3BY?=
 =?us-ascii?Q?4+17FF+kElZbCLGPl7XPZ1P3T6//VC9BBIl/1lFO3vO4Qh3LGIpf1NbD0u2H?=
 =?us-ascii?Q?cI+Vb+WQoxNd9O0lTQLCA8TxJlnn8aLP0eL0ayLQ9WcChhqvskd7i+LDt3Aw?=
 =?us-ascii?Q?IJVfJDUs3zgCBz5XDbw=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:07:31.1041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9b3fde-9e9e-44f9-ae2d-08de30f3bb75
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFB7284C048
X-Authority-Analysis: v=2.4 cv=FJAWBuos c=1 sm=1 tr=0 ts=692dbd48 cx=c_pps
 a=jsJx5cRpnMcsqjM19+T+dw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=94RjKq15bhQcB833WOIA:9
X-Proofpoint-ORIG-GUID: IYbbKBOASOWsRKCzpJnA60-oUVgz5hRU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEzMSBTYWx0ZWRfX2OJ+RO0jdUYr
 F+WgF0gdsqzywXB4z0vrQVAa0OuYB7JV2EAm6pwXATgbSEu2Y2aMrt8iHxvUUVrzs2xhfo7OUDm
 LpmoxHpxQ6rp3QSy4goF2g8O8OBo3uDm25cKUoHxH3it10fKGlg2ZB7rxA02sdwkyGh+rmeS2ih
 QLMHulHvBgiJy6z1AUHXCO+f03JCKj9GAybXcgSZPvJWJcjXycfy0UDBUaE0pYIFn01zr4cqOWw
 wjZa2cU/ZmFqs+yG9dX++fIXujSjbsOcdUJ49hnPBNafUzAEgXFPiNRtqePLzSNVP318z6q4/1D
 ICP4mrBdfztOGfmT5lKwnvESIyhuAHCyIqPxKYNo33JusiYR790ChYteTul4mvPYdiDJ0IjrsAg
 4wVe+tOtLXvXI7iRw4INx1zfAO2Jmg==
X-Proofpoint-GUID: IYbbKBOASOWsRKCzpJnA60-oUVgz5hRU
X-Proofpoint-Spam-Reason: safe

Replace the __free(kfree) in cs_dsp_load() and cs_dsp_load_coeff() with
a kfree(buf) at the end of the function.

The use of __free() can create new cleanup bugs that are difficult to spot
because the defective code is idiomatically correct regular C. In these two
functions the __free() was mixed with gotos, and also used the suspect
declaration __free(kfree) = NULL;.

The __free() did not do anything to simplify the code. There aren't any
early returns after the pointer is set, and the __free() can be replaced by
a kfree() at the end of the function.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 900baa6e7bb0 ("firmware: cs_dsp: Remove redundant download buffer allocator")
---
 drivers/firmware/cirrus/cs_dsp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 525ac0f0a75d..c2614de47107 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1446,7 +1446,7 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 	const struct wmfw_region *region;
 	const struct cs_dsp_region *mem;
 	const char *region_name;
-	u8 *buf __free(kfree) = NULL;
+	u8 *buf = NULL;
 	size_t buf_len = 0;
 	size_t region_len;
 	unsigned int reg;
@@ -1601,6 +1601,8 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 
 	ret = 0;
 out_fw:
+	kfree(buf);
+
 	if (ret == -EOVERFLOW)
 		cs_dsp_err(dsp, "%s: file content overflows file data\n", file);
 
@@ -2132,7 +2134,7 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 	struct cs_dsp_alg_region *alg_region;
 	const char *region_name;
 	int ret, pos, blocks, type, offset, reg, version;
-	u8 *buf __free(kfree) = NULL;
+	u8 *buf = NULL;
 	size_t buf_len = 0;
 	size_t region_len;
 
@@ -2311,6 +2313,8 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 
 	ret = 0;
 out_fw:
+	kfree(buf);
+
 	if (ret == -EOVERFLOW)
 		cs_dsp_err(dsp, "%s: file content overflows file data\n", file);
 
-- 
2.47.3

