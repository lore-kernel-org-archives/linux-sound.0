Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705AD45D1B1;
	Wed,  5 Aug 2026 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933752; cv=fail; b=HcITsa7CmhJLdGXynUmtSqQDQnEN061pvTlHgyyhCIGUcbpnWNzNOpEQp5ENEFfqAYDIzvLs5gyxAX9PeLn+rWBOGWdf0D1eCRbZ2aNUYfU/mkzOT6eJD6D0gUt+VK8JwHzZrN10aYQ0jpd/kG3rqICFQgei6LYfgWyBKjqn4As=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933752; c=relaxed/simple;
	bh=+y6FC4m4qaXkla0uqGrP73sdQpEg0gHVaWConi8o0RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NV0G1FU255uR1McH8ysDE0u4bfRgDtM/I+ANrVttNMp8MleTZud0mepYnVeWiIz+ZA4zmem7D4TeWD15AoJmjtNpUjzMApE8/5vTkJDcCm4XjKsj3ZnUVX4vXGBRYu4xuSXJuOhr93wnucXEQPDZKCtbqtuOk/oS3g36SfRzs1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FKCfb4yn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ixF0115f; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FKCfb4yn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ixF0115f"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6754uRgR3419307;
	Wed, 5 Aug 2026 07:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ROdiI9I2uH/JuVUTktPomLbPTjoGpdoxvDQtNVLGlz4=; b=
	FKCfb4yn1QcxFxpT5EPWw6hkPZE2K1CaDltIfnkTo5q4wgVSNwCUUXkJ5BrqdHIC
	D4ugBQMv1HiURKnXbWKvq69SQI2VFQs2wnK1feWn5Ac/4eLRbycYKyBIcPFgF6E3
	P7Id1dVhGNXR4tssTUuQTqLuxMLPM2VthZh9vvIRid8Ppve768snGDYgtikbMqEs
	466lJ7TdXJqMmAJiJEm+oSD5PngZqpQpIB3M+uvt3UxRnOJGLiB+JJxiaHE7ZmaJ
	ZPmVZ4e9FSJaiEBz4j1E6DhaVMBMYuq0Gym8wF7bLVMY/iDrf0bTlWX365O5a5SI
	x2jnReFaOoRVLagDKRQ/hA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020103.outbound.protection.outlook.com [52.101.61.103])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fse6vnmdq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 07:42:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qch22bfEIgb1MMZpmdYTYXyitFHJXY0LZeJ33Zc/MJ5qQ812ZQsPH5JLWUSdfQ+AYfGQscYAupo4mhznqYhi4pSfvbP/jmV3RY7ZRvJwtXD5Mm0fo5ffCduOr53XooYe1rZDQR1Ix04yMw8heaU+TXVQN/DJ4RopTMgM/q1Fc7kJ4HsNytYednaiodZFCVk643RhlBmFndw1oDWJaZ3IYicFU+jXBVmQrcVYLxMFCMOu1fIlRrYsSgoZu44lSGokRhinLng9LZueZuLQKz9RfNfySpHs2NPf6AHbYB5/kKCvqCwU4by/QH291l05w4lXXBmuPx0nBxEUvUHvylnmig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROdiI9I2uH/JuVUTktPomLbPTjoGpdoxvDQtNVLGlz4=;
 b=sq27tf/rH3qRb9nu9kUg9eAkVVxivY63AltlWQxGPkpK9MPoNXexcGzjDoAohNwn1abfTHs1QpFNAZ3bT+/gCMiQb7neJA2wzPj8JVZMiTBGt1EyfaRZUinFH3SRRnE4l7AD8PVjeJn6oK/GQsyuJn0/zARqTivQOCu0EQCykc3qPgYggNO7A+sdXXT4QCX7x1pC/0Pxw5bJaFrL27dKiVfATDeeF92XtNeBErNNwx48g1oik5EtFfaEcqySE+LWTNNIM1JroM2+32Tp+q/Fp0PpfiI4hwIejNwcOf7oXxSC4E3YchXfsX53DUaAg453MqAxNwW1hcYC4I3yG/tnhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROdiI9I2uH/JuVUTktPomLbPTjoGpdoxvDQtNVLGlz4=;
 b=ixF0115fyTuD27gpJoxmpkUJRQ8L28xwb4aTD8+mFN4Hhp/oD+1IBIOxofNqulyyehORxNCeygfRi2m9y1OVxNbGjBymTWrLM5s/LGFBvGr4Y/snXav/zsdODOjWy4RrgKUWtJlzwtnfO8tbWffMhglyxuVSL6MacBDb7yER+f4=
Received: from MN2PR11CA0025.namprd11.prod.outlook.com (2603:10b6:208:23b::30)
 by BY1PR19MB7749.namprd19.prod.outlook.com (2603:10b6:a03:533::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 12:42:13 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:23b:cafe::5c) by MN2PR11CA0025.outlook.office365.com
 (2603:10b6:208:23b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Wed, 5
 Aug 2026 12:42:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Wed, 5 Aug 2026 12:42:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A410340655A;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 909B1822544;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, niranjan.hy@ti.com,
        oder_chiou@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 7/8] ASoC: SDCA: Add missing HID kernel doc
Date: Wed,  5 Aug 2026 13:42:04 +0100
Message-ID: <20260805124205.4152543-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
References: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|BY1PR19MB7749:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b604e1a6-3e0f-4dc0-71ee-08def2eef922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|61400799027|82310400026|7416014|376014|10067099003|11063799006|56012099006|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	W7BwDMU20P+hIxbAzireuwAMAsnajnYOVDXpxMy1zwPiI+1T5EJq6TIsv7PV9VBCh//WXd3oCAZTZcyPT3SMhyPPAUP7Smn+RnJqkt4GyGZeNpajmY2S5GUVMY2/bC2wVPuPi963So9eVW1oM5EGrT4hIjgi333uxJ2dbI7CcsqUUwgzY1+b17e6Z2PUNQaa3IcuUAxehuJ6m1VVw1Zer5LKMMI0g1gijcjV9Xe3IPRowCbe8iI+bfoQlbGMuwByhE0Kv5d33r6M7AUlxuQK93/KxFJaxzyAgDXwQRPPZI31aUtHykci5+tiuifL2eJBUpBV4xIIenSBLEyMArD6ZglvOqxSQuD3Ksuq11XRZ+ZoCWVAfWVZFfaj9bVmK8n61z8dba6ozkhJS2Za81enge34TmzI0tOojE1aO1upda6wfzoD3SmtfK89BK9NBYviVakpoR9sHm152EVj6wx2pvHOYyv7uwg0uLyiPJhQURGHraDBiPe5CH+dI/xDgri5BJG26/ybI90/wlOjB6Amu/SJfEcqZ8BB90FiOtxNBur3UqDxKK1hlPNuX1Mg8Sp1GJluI5YG1FoKO/PGsVa7Zpc0mfYknVgGLIppwN1X1ArCxD1onH7SNQukcMs+zz3FAeWiKHTc4+2z83DCFlBtPCtGpks9zJPkB562AaQgME7ADbkZMNLxYb9JJM5QoVx3tT4forgrqYOsDmLCmHcVNA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(61400799027)(82310400026)(7416014)(376014)(10067099003)(11063799006)(56012099006)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d69USm+kzeL1VDQGJC2uOR0AXT0+q2HXnoGzNY4GRnLToSFND/U5K5YJU/nlXSGlvfk3sLeEVtkygTziXnRKijdIQufOrhSMsauWj869Tz9bHzb1l7avs/UUm4joZ8HdcOVJx+efuaHkl0nci8NFHPJ8dgN3BDqCY26nCW88X+QCfnvepMGkehNKNmu9SkDm8fZ+LsIDT9/2PuiXdfLHieDZYM3N6fYGVbwsuJ/9mXTinviD6Y2al9x4Q84cptyQAXXz2EF2we88hEOrxFrXWeleMDvy0J+BJsO/WEP36sYu1qYWEAsuTcuxwYdqiQ9mCv3onWG5CqPyICnPqyYyYXnZylk03qWb8ilskeiH/EpmDDb475Ia17XbVIHxzBZ0vqGl30eyBNpnAx4nGKViCeHfU6P1obA56EDQxKsl09BD2t7k3iHI2Z9J29vsjuKN
X-Exchange-RoutingPolicyChecked:
	s55yKzuMVglCSu3l+oOr7raeMsjQoVQrhbCaq9IznE8/+ukwOWN+kzxgTrsWYsAZ1/U+zruFDRRnosx+MveCCUgZTXffIKfEO82TiGda7m8Q1S07GleDTJwnE0A6nyKq2yHg4iTtWvUuBk/7vSDkJMMvFpzsuBRQ9jlLUP6elINJYmjtEa5iXzMSCuKxuucReMazRptw4g4V29nv/Ph3PLi8haepi0EaVM8P1Z0n87Ayyo7HrVA96E1KvhfQc8qMWIYpZ7FymfSYMzGnDBXpfBB/Q8vNQgmJp5rrIRE+Tlyz38tCCF9kPRqlixsIY0bGWijWlbtavIrx2Bo5qEfovg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:42:12.6975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b604e1a6-3e0f-4dc0-71ee-08def2eef922
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR19MB7749
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfXygvgigbhh3Sv
 kL45wa9Hc/2+ZYoX7Mi1/5zu50W/CYv7045VhRiov8iINLzNgDDNmwXhoydfzgU1t1aKsVvc7Mn
 KnR5kOZ/mBfTMzWcqIQSx/NaW5bDqH4=
X-Proofpoint-GUID: nodDYIowgYHjMN-FslEB81nlMj-ijGHr
X-Proofpoint-ORIG-GUID: nodDYIowgYHjMN-FslEB81nlMj-ijGHr
X-Authority-Analysis: v=2.4 cv=N+MZ0W9B c=1 sm=1 tr=0 ts=6a732fad cx=c_pps
 a=l0LO6K05DF9RfVVG1F5aEQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=hatKmdsr-NMx2QPymcYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfXzfWy3QjEHGmP
 rt+Jqa+feRpXxD/UW30HREhZnwpRtQzKG2Qrc9/95dKItn6VGRAINo029wrFHgxCfXUVsc/UqPm
 avGPrfbPekem17qO8cdbO3zKCxST3v5QJrSTLgznIFv4C02eEzm3B3aD591S5CoLcmN9vCYyNni
 W0SRzftGgt4nPgwY/Wk2QqV9soS+hRsiklte/ujWUcxaI23xwMt4GKWpZMCDNxKQlKJAzFeKEn4
 gfSXAl076vRLusnz7uu/UbYZ2nSAgS7rtq+F60cyNm2CpEzuxrQ1e7EPBgehyPvI5LW5oqqkYXV
 WwH3OnTV3gtNSiI5+dumgY0dbebylQCWDQCWtYcIPhC2zHSbKYWWwOeYS77XblnPurfdaYPRe6M
 936IvUD0E7MvwZ4mmkfXGEDDs2L50TPzU8Nurek/4q4kLD6g/6CzWv4WVRRPcxHGR1yTDU6YZsh
 CG4qY1VbGyqlHF0OPJg==
X-Proofpoint-Spam-Reason: safe

Add missing kernel doc for the function sdca_add_hid_device()

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_hid.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
index 514f895bd90de..bee1b83c05f21 100644
--- a/sound/soc/sdca/sdca_hid.c
+++ b/sound/soc/sdca/sdca_hid.c
@@ -86,6 +86,12 @@ static const struct hid_ll_driver sdw_hid_driver = {
 	.raw_request = sdwhid_raw_request,
 };
 
+/**
+ * sdca_add_hid_device - create a new SDCA HID device
+ * @interrupt: Pointer to the SDCA interrupt information structure.
+ *
+ * Return: Zero on success, and a negative error code on failure.
+ */
 int sdca_add_hid_device(struct sdca_interrupt *interrupt)
 {
 	struct device *dev = interrupt->dev;
-- 
2.47.3

