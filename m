Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAB63090C2;
	Wed, 17 Dec 2025 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989162; cv=fail; b=W75Y6hamrAo7zVR8k8dQoUfUW3xtrthBlGj/ErOu/R10aeDjtlwW5e0f/kNUbpA89BQNIf2HkSnFSxNcC/u/IcHdeLlmqDXK0qogGLau0IRclbyMWuWao/ojO+QbUwKo5Ps1H6LKqhU7cg6isGPzjLWFU+qXB9UkriunwpkqrvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989162; c=relaxed/simple;
	bh=c+odFPmNCIK5B3jEdZJOW4B15aYqzMyzmpfGL3mnrrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sje3Nh+eS4rHDYEdvm34s/9PCHhubpEtnzXIQVA2t026CqAiGwj7pDgwkk4i0iFg6LABh+Fp8VSbhYz5sd2U3FPEvWGMR3KbK/GXTsqgUkQ7VOLoeMAFMkeRi8hen2buyWCdEn0pVUZVxwecL/c4Pau/CunUhCiyOCD9aHSbWyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pZNruEp6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CSVRKI2t; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pZNruEp6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CSVRKI2t"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH5bW0d3194221;
	Wed, 17 Dec 2025 10:32:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Qr5A99GhoE5jftNgg12pzrx/HEDoZQskQ3aiCy/oflw=; b=
	pZNruEp62fdRoMihmWdXpFBi6eSvgfFai6P9+dlZ1fG77oSDD/MIlOlkjB02yuJJ
	JmVD+JoBSgw/x6f+aPOeME6V0fNvSjpoOYNHonbhhBcQugPfUQgscq+vwAimKPnS
	Epa8lsKX030bdTHGNQeITO5sdQ73Wq7qEymGM/Yw5sIjKd7UCx/Dk8wu7ylMEUiW
	Fmf5ZfMLSD/VWRQ8MBYmWP+Bsu4PLzQ5WiV0oWda0HEtxxY4sPHFoEjqWflZ5lZP
	Be+0jXf591CFsae6k4u6c5t6qoyosm6DHVYYTuLnnCheeMFF8XOxAKakwJAc3kja
	VPqoZpOrQpiX4WRCg7IZpg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022133.outbound.protection.outlook.com [40.107.209.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15ejd3kf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 10:32:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ji79KC9V3/x5cG3GSsehxJ13yWCzSVGeArELZARhuh1FxKbIlOrRPUqrXGMzavXlbOQahD4cGKBUqmceZ9Gp6ENV2H6ZJXkFICXsh4Q/p332eTKWhznJtsK0SzA8Do8CXSvE7joUerlrXLUt74IhWYIuOAL0xr1yUINc4b5ldKQCLZKgFCtMg4r17sj+heeEWhAQK7Xa0C6HlnubuQFGJrmYea/NoeSbRMpZ0Px5hcs1IVJwFFeQtr4f2jKBDsDeKJoY83Si1IZkics/Slqbsq0xdRQbbOb4DoPA557NtKGG0MSAA5JUek7Do6wfBvBA64WijazaKk2gTpCyBm1OAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qr5A99GhoE5jftNgg12pzrx/HEDoZQskQ3aiCy/oflw=;
 b=k4nkTc4vX8nBzJX3mui1Km2hrW+eu5qUCooQC1Ls+do7MiUWQfmsipkccH7FbRWyGwA5LW+pkONk1xXvD4xIyF/Kxc3j/LW5IBZtf1b51nfMFUPjeUZI2yYyQdJqpq3AdUxKJJuR5s/faLtx/bIELelFP67jF8HfQ9fk64o5kZ+5ljhdtTKW/CYoDSSD6XtRQh1pYUZizWbifZ7cy1SKoEiWNdYCcdpjK1gU6veOzq4R5pffMo8d9TpeHRsZEeT0Ch+p7pJ22johsvUVIa/47vIY3P4Hx6AobOaiiI4KKVtxwC63Cbrz+STayBadCvXCOuJzmThs/9KeCFOKgZNTLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qr5A99GhoE5jftNgg12pzrx/HEDoZQskQ3aiCy/oflw=;
 b=CSVRKI2tq6PjoLyMyPj9iz+ScwGYvs0iA1mG06IE9DkPMyuMTzzutCEmTkM+uPJUzkKKC3Gq8LYCxrwhzJz+cA2iJzeHlOxFU4L7kBXLnvZUGh57ojHZFbiJVYZQgYh5VLTvONWWYkSMUUc+gQxK8IpznXFOTj9Vq83t+k6/vq4=
Received: from BN0PR07CA0005.namprd07.prod.outlook.com (2603:10b6:408:141::20)
 by DS7PR19MB6280.namprd19.prod.outlook.com (2603:10b6:8:97::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.13; Wed, 17 Dec 2025 16:32:31 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:141:cafe::23) by BN0PR07CA0005.outlook.office365.com
 (2603:10b6:408:141::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Wed,
 17 Dec 2025 16:32:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Wed, 17 Dec 2025 16:32:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0A92D406545;
	Wed, 17 Dec 2025 16:32:28 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ED698820258;
	Wed, 17 Dec 2025 16:32:27 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, yung-chuan.liao@linux.intel.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L56 with feedback
Date: Wed, 17 Dec 2025 16:32:26 +0000
Message-ID: <20251217163227.1186373-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217163227.1186373-1-rf@opensource.cirrus.com>
References: <20251217163227.1186373-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|DS7PR19MB6280:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 36984cd2-2866-4da7-520c-08de3d89deca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OmdFcHmrrQVAdh1tApwAERDLV4IYcIYXRcX+F6+QW6z1ztuz6V9SFj94LsHm?=
 =?us-ascii?Q?UDxYlOb+qDzP2YtD1p8ep2FM8uMTetlt2+2pOVy4+v5ER3KMkQo4hXgE0fYi?=
 =?us-ascii?Q?MSPiHVOwcpWE4GTyRyybmx08JtUMypFGS4PbITSwh27mrRCUzRFfJJm7Xujy?=
 =?us-ascii?Q?jBFKrR+lmK2zBXJQgNx96GtGR5sy3eX1Btkrgkbl9OD8/gMBMRrhOzBC0ziE?=
 =?us-ascii?Q?8TlEgo/0LzOTeJ7/k165LBY3naZ0pLH9WadpT2NWsUH6WTDqfRAxJU/19j6G?=
 =?us-ascii?Q?dNbxwTmB+FtRTzB1h1RybUNW2D3L5ttpSsA07bcv1vZY7jafHAIkkSkUJq99?=
 =?us-ascii?Q?e9gyItNk5Ez//z6K7RryCDzCtL1UdH/k5qBiVmq+AQTksvzOp69ZcuMHxfzp?=
 =?us-ascii?Q?WU36XN0rPBMYysDcGZ0gKK0CU/14NvmMrfR4YMzicspS83u++lCZnsUE87Q3?=
 =?us-ascii?Q?fmKoaDzD6NwbYEpvNsSf+ga63q1kfn+2OTNuOd2IacwV6IFx8e6RFcgaQFfJ?=
 =?us-ascii?Q?4n452AmiEK0D877Gy5dBNz6poF6lp1zRJJC6nvf9V55QMc27hh0u+CE/YQ3c?=
 =?us-ascii?Q?d1nfpbPGCIKILvecgq5wZi4aSgbub8/JnoFKN0rbhI2ggjSIamKSlHuFLfVd?=
 =?us-ascii?Q?Stbom61KCnGuDSXHhibj2WZ5jMuv8MBDfMXwQA2dI1wPTxSF6HouJOTspwUy?=
 =?us-ascii?Q?F27TIYBt2zijlS16rmq4XLBhcssIqQZwFn46sW0c7790gOnaVpVht6EUbqB+?=
 =?us-ascii?Q?904UW5wEuhFWHIRdN+17yvPs5yrEUV2NCk6v3E1D5/xvfrSIkD7LU49Pl6LB?=
 =?us-ascii?Q?VBEKNInuo3nk+RPyg3it7TK7I1zaowdL6tAXBsCQ0bYUtEn5fGvU0rzA7rT6?=
 =?us-ascii?Q?/Edf/jCxP49t3OZHMNxLr6uoRokMlkUYh8coAWtjEq0ddjp9h8ueR1/RIe+m?=
 =?us-ascii?Q?+RWFZwCZH5nViotAAa1vcj0GdRn6XpqS4+CKlrv20bvqN7HlKMlI7NzbwnxL?=
 =?us-ascii?Q?X4qy15O9l259kXKDOogR3yBZ//VVXBo1yAN2mgLC+oNdpTenhmQ1a+w7qm5f?=
 =?us-ascii?Q?8woAnB27KfFFLubCldATO+FoL1f425OIDAjXLlOp8Oli0R44hQOUhXF8hjG/?=
 =?us-ascii?Q?ngqgUU+hMPrEaIeYzFjecJWM0YZ5302D8TVbw9PAUMvCOYFs8uZz1sUubWvW?=
 =?us-ascii?Q?7rMEVFRIdYiZ474Lzj+OxbFuRSpI0bOSnfEKCYeEjnb7qb1whrngT6xXswMf?=
 =?us-ascii?Q?XagRKcBJ2DjNFDNIEjoABl8T5WUqSoecKBwldCH7lm/Ui5/6RvLDR1B5bUO6?=
 =?us-ascii?Q?z+4HerOAXNc3dFkfDQ46fji3atXpwX2IY7hZLiIQS5HmXxaSATHhSRmQQP7d?=
 =?us-ascii?Q?7yF/ZLqEEIN1sQjfw5lrih83LUpejC3rixovu6truWhqz+PO8lGTnRJ5UZcx?=
 =?us-ascii?Q?yNl3fJe5MDeryPGrEMWHGEdmDASgaanDrNqHU7CF4GRX14EHVUISb845JeGH?=
 =?us-ascii?Q?iRGOsjxZM7+8oXM5YxqZyqgdTToTefn6y3KH1r4oBTAxEhN0HAnYr/Z0z6il?=
 =?us-ascii?Q?VDe5su533wZvfA9JtNM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 16:32:28.8614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36984cd2-2866-4da7-520c-08de3d89deca
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6280
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=6942db23 cx=c_pps
 a=o+9IzLN2JPavfcgUIASn6g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=w1d2syhTAAAA:8 a=e4OndPtaZQPyItGUYBEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMCBTYWx0ZWRfXzQ1Z5ElD1Qly
 N92C7nZCROlMsBN/gwVWz7sPzISB7yLqIUXsImtukjuDWdeemUxw8zQetxZGfIZ9Z689BsXa9th
 A6irbD3zUBRb2iDafrMKpG1woHUgd+yHYhUzB/GgZskrH5/g91PGmOqUGEM+cBP9X8sIbbp96Uu
 zDyRxUqR8WAQ9/2zZnLUCjof7WuhodVRkG2PS1WNRxgfqUxIzmr05JKJYtIZ16fsK4n1y/v3nb7
 QZ1qkg0ZapoBWaiiSb+IhLKUR6UUSC0+5QKU6Csy8QtCeogLGvXGDvUNxVn0ftTtbK4QiCQ7qHX
 PkbcYGYPcRm+ew0Zy2j7ezaxN0RrFQLSo0pMXeLCkDxe41OZXJsTnnjeA2ufn6Fo+dcOtn2X4Pw
 U9++CdIptZYO01bOYJfzcshXGp6hdg==
X-Proofpoint-ORIG-GUID: P4InvgfySRiJTu7fRWj7MSfhYEeGPI1Q
X-Proofpoint-GUID: P4InvgfySRiJTu7fRWj7MSfhYEeGPI1Q
X-Proofpoint-Spam-Reason: safe

From: Stefan Binding <sbinding@opensource.cirrus.com>

Add a match for 6x CS35L56, 3x on link 0 and 3x on link 1.
To support the CDB35L56-EIGHT-C board using 6 amps.

This is the same as the existing 8-amp configuration
mtl_cs35l56_x8_link0_link1_fb, but reduced to 6 amps.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index ec9fd8486c05..f0cf956ffb82 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -699,6 +699,27 @@ static const struct snd_soc_acpi_adr_device cs35l56_1_fb_adr[] = {
 	},
 };
 
+static const struct snd_soc_acpi_adr_device cs35l56_6amp_1_fb_adr[] = {
+	{
+		.adr = 0x00013701FA355601ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_r_fb_endpoints),
+		.endpoints = cs35l56_r_fb_endpoints,
+		.name_prefix = "AMP6"
+	},
+	{
+		.adr = 0x00013601FA355601ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_3_fb_endpoints),
+		.endpoints = cs35l56_3_fb_endpoints,
+		.name_prefix = "AMP5"
+	},
+	{
+		.adr = 0x00013501FA355601ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_5_fb_endpoints),
+		.endpoints = cs35l56_5_fb_endpoints,
+		.name_prefix = "AMP4"
+	},
+};
+
 static const struct snd_soc_acpi_adr_device cs35l56_2_r_adr[] = {
 	{
 		.adr = 0x00023201FA355601ull,
@@ -1069,6 +1090,21 @@ static const struct snd_soc_acpi_link_adr mtl_cs35l56_x8_link0_link1_fb[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_cs35l56_x6_link0_link1_fb[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l56_6amp_1_fb_adr),
+		.adr_d = cs35l56_6amp_1_fb_adr,
+	},
+	{
+		.mask = BIT(0),
+		/* First 3 amps in cs35l56_0_fb_adr */
+		.num_adr = 3,
+		.adr_d = cs35l56_0_fb_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr mtl_cs35l63_x2_link1_link3_fb[] = {
 	{
 		.mask = BIT(3),
@@ -1189,6 +1225,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-mtl-cs35l56-l01-fb8.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = mtl_cs35l56_x6_link0_link1_fb,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-cs35l56-l01-fb6.tplg"
+	},
 	{
 		.link_mask = BIT(0),
 		.links = mtl_cs42l43_l0,
-- 
2.47.3

