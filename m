Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D344A22DFA3
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752165305; cv=fail; b=qayTj4HLQ3ROjHF/43NdlF21Pfcov3IvDPXlhwgX4qrXAJm3js5Zr7Pff4Osmucm3DJxyxkqz63MKIIeS+tj9eWJXxqgEFKXmh3qxaHbGXrzD2HmzQVaYiozRRNgW0Pwb6E/H8tteBr52Xb2girrApPGdytr2DjvcDDHtkJox/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752165305; c=relaxed/simple;
	bh=z4h19lFAm3yuXEIUdHBKazbFliGUwE50etnZnotKpAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QPtF0wYZ8vSxi+87Vy7dP+MVkdkqVs+4E+kZbeGI3waBTwq1wsA2Tf76Eh2GmaMJw3lDsp4UvIfGcIeRL/0Y04I23EIjAGGiXu5q3Vi7v0ORRflTJYzxO/ZAwsFHxFA7kx/pElAIw3Pcf+ieqcbf1VjkrzEFCx66wvSe8YeMxb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=b7mpp2Pd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Jo/D9P+L; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="b7mpp2Pd";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Jo/D9P+L"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ABipdI030533;
	Thu, 10 Jul 2025 11:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uDQchl8CHH05aVHs3qZ3HCKBRMr+3GLcLNFMEjl3oCA=; b=
	b7mpp2PddCBXK5I5BM41D+sTJ1yIvSZOvK/mOi3UfLx7SG+nrgHzwKu09dFZTIiT
	muf5dHDfKX8TvL1yK0jD5Pvibxf/F2DT6UVUboylMJFZaEdywjiec2eah8QaRV5r
	Vq3OSQBf+qvpV++wSA6G9Rvf/2eoDbGmqdpCxII1uDPgMEoZzpzKT5gwsAyE1F3k
	fUv0vZSnEusT6+TMMuEQPzRRhUmRnWOhpWitNbaN/XGrBrSNzJhO37qTiKbeodNG
	DQsp3NebIBfEPZfsgtheWe3GDEzsiLccQJscv4cx2Hcz34mjlOE11btNvT+078tD
	Az6ZG7+2+l7s4pClgHpwdw==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2103.outbound.protection.outlook.com [40.107.102.103])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47sev6c115-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 11:34:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZq1ioL4fwTR3csOxZqf0eHUJhNcdhiu4yCzmJTI0ogxHt1TDWzmHkjlLGmSHDiFbvLcxOAr+iLiz5esVjajYrO7deHW1pCQfTmPUjjb9YbpN2kfxVfdKv7HVu0YyRqAMjCr5XdR398NKYcuLXFfLRKQNa9DTv2vEfpgn3KeW8qM7KR76qyl7shK2CL2ikO4ZkUt089wacQymc3dtI5e5nHSa+0U5KGQA8VRKep/6UBcTFvV2NC4aNPpYjB/OSm72HVcwMiunhsf5MXwHiwtjVioIpI3zeIuqMiUvyoCnT2s8dMSLqYlUPpnzrfTrIBO19fMg8TLe+i9CP2WonF0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDQchl8CHH05aVHs3qZ3HCKBRMr+3GLcLNFMEjl3oCA=;
 b=pnkkkQi0mLcKtUJYOrckRh9VL4G8yy+2Rh7aaTZ3uP2A4oboMUrFEkjZClXhquh+z1/clUmHQLhyxDLJmTesU4QEobMvwO84xSSJy2vT1scNWYgCGtgaJ3dkKhOU/nDhF98AhpxdnKQHWrB4tAbkcH8V8QSI+TlEnGEmVUopcUNs5/RKwsHMAuu8UKU5ksczyg+R2Vw5DNAlfmZITb3s79nCwCrqjU/ThPpThDuU6Z0q0j4+s5H9q4NZT6tpZ6BmhekvKsO3eEkc6qCjp2AeRg4nyiMbLBYHvGiU4PQWv1MQDYv5VdB510bemSfMb2eDj3MjnWSheS7zIla2ockbeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDQchl8CHH05aVHs3qZ3HCKBRMr+3GLcLNFMEjl3oCA=;
 b=Jo/D9P+LKz3JtJfOE85/hTck+smi6bj5xpbFYc+2BigThEDkiTX7uBIzKd1rlGSTUx3muYBSJ0Cxy8yZoa8GIt7ZI5MbNWuxVpVIM7AKq8rAIVaLyw8BhKSVSSijqZkzUuXD/lK+4mOKTbZIITwpt49GJzeiP7MF8T3lfp0PTVA=
Received: from SJ0PR05CA0141.namprd05.prod.outlook.com (2603:10b6:a03:33d::26)
 by DS4PPF86F4A2197.namprd19.prod.outlook.com (2603:10b6:f:fc00::a2e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.17; Thu, 10 Jul
 2025 16:34:30 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::17) by SJ0PR05CA0141.outlook.office365.com
 (2603:10b6:a03:33d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.7 via Frontend Transport; Thu,
 10 Jul 2025 16:34:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Thu, 10 Jul 2025 16:34:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7128F40654E;
	Thu, 10 Jul 2025 16:34:28 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5640C82024D;
	Thu, 10 Jul 2025 16:34:28 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        arnd@kernel.org, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ASoC: SDCA: Kconfig/Makefile fixups
Date: Thu, 10 Jul 2025 17:34:23 +0100
Message-Id: <20250710163424.1158958-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250710163424.1158958-1-ckeepax@opensource.cirrus.com>
References: <20250710163424.1158958-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|DS4PPF86F4A2197:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4ff828d8-4ae0-45e8-dc3f-08ddbfcfa4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Kzw/td8I3Bw1BIA9yjdzziXAZnq5+tCp0AKTdmPFEC1olxwVnEOrR6hrtLHH?=
 =?us-ascii?Q?quFNTTulx6v3zd++PLwALGIHD9vQNJJVS8uCL5PBpWOLhnQ5/Cr/2aMdy9EN?=
 =?us-ascii?Q?VhwTHxHo+pKubbXVTH5lgi7c6mNjhCs2qbyDBzsBiaCclYDE62BBJa1ooXZr?=
 =?us-ascii?Q?qRDOc4x/ntOoQLPcZtn0qqX5pLXzxRHNGtbqRo7KYYPek/xD4PKqt9E+mzL6?=
 =?us-ascii?Q?SlXcP0w0ZBDt29mfUxyB4aQPPKrWkICJqV1Mwo/crKplG7FJNSji8FlLqkh9?=
 =?us-ascii?Q?S+qAXPZKrEfQOrunLawNiuff1lJ7xj/DPv+4u06llcKjVuCns0nVtaYF/N2A?=
 =?us-ascii?Q?gkT24AZSy7rlGUuxzEi0311W2L13jY5OtdAL4Gu9zHb/Y62YPh2TunAeY/EE?=
 =?us-ascii?Q?4CoAQ5hnanaROxQoDb5SMdr0ZoaB+Mvi5QhRj3h7lvJ9KbA07UT2Jm/2m8ZH?=
 =?us-ascii?Q?iE7yYhcxU101MULCd9nbjXJxUrCIQu9weKjBvY/K/UJfzmnjQU8c6LHFyGyy?=
 =?us-ascii?Q?+BNXoCe6RmqPASfS4Zemv/nW/oGLkcXzycbfVQ8cYogi0YrINb487+3x0uOq?=
 =?us-ascii?Q?Gra8i8Ch6fLYvqbw7YkGlwDfPQNZFTYe79elygultV/pbqjIfI8KqQimYEYA?=
 =?us-ascii?Q?Mkb6Psc4yk9griPkEmBjDqDI/nwZc2WOGvZDrngxPpX9RcNHXjjrBpaUE7Dv?=
 =?us-ascii?Q?dzvPuFJBr+URZI8uYJqZYMfMX4UaR8NGdA8JSFMJVn4sGV6oGUEayI+dyETi?=
 =?us-ascii?Q?J88s+tbRzZDCchDjx5d38GHMDvqPad++jGDCtMhUz6smF3S+BxaYzhbomhx6?=
 =?us-ascii?Q?nfNrTrlCXjx1OiMauQpVcQ3VuxUkoeeZ9pOTTJISzj30FwpmDlRX+JFCfXxB?=
 =?us-ascii?Q?ZmpYAtkVfHE4f0E3iW6X5oL/4x+IgneLH0xCLlezKTGsfwlZjN/rLdGtqe6K?=
 =?us-ascii?Q?41DrOTvvWAzOH3JaQ3o7zvkJaKetPMj+rDOjaNqy5VntzlCYotN5NitcDGwS?=
 =?us-ascii?Q?MmAsJiv8eaNn3h/JrCqENxGW8HUZ5ykGqdCv046lCzY+iPzw+3grhEAyPpaA?=
 =?us-ascii?Q?KtVo3aMb/yLV+AMKkkP/BfpdBjmpOC/OUuUe1NC/2f3nQS9kjeJqX53ZgzOZ?=
 =?us-ascii?Q?jHjQXy1WaAQjKaN2SnAwfUEyLbccHzOYKb/8d33/MB/2L/SSqvETvsI8Tbyg?=
 =?us-ascii?Q?HwBcsDIzUGgEaBH3jhMKtGU8kK+z9HTjOceIlGVfvdX15GKa4wjkRIfmqzDu?=
 =?us-ascii?Q?v7VKsKbXyEIzSuRgOxCxN6zElInB+oQ0rrNUm45CGPUp+Gm/1NAYeXkhDrur?=
 =?us-ascii?Q?HCi5nYYmUrmSV1m8mfE5P0wpt0Bhwsm+FCGoyRm99RhkFuc6rKhrxDIvePMY?=
 =?us-ascii?Q?FYnL3a/GaD+eUDkZxjawl8WjYG+sJL7zmFF/t1qLgg5Ic8CQbgK53NYdLNyI?=
 =?us-ascii?Q?76HPRUfjpE/3KAQTD0QGCMCSwnPZNVgk5lQzikDtKEQ4GOGg5O+o1Xf787cA?=
 =?us-ascii?Q?wziWNZEyH1VguCexDLtDuXhzv5pHWCa1xr+/?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 16:34:29.5284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff828d8-4ae0-45e8-dc3f-08ddbfcfa4ab
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF86F4A2197
X-Authority-Analysis: v=2.4 cv=Zb8dNtVA c=1 sm=1 tr=0 ts=686feba4 cx=c_pps a=XrghfSq0YRpaM4zNBqhgeQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=aJg0CYbKQ9tmL8Qgw7UA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0MSBTYWx0ZWRfX/f1ObgK8wBKW LXAcIHJWZIZYd+O9kP+PwpDU7XZgwJPFyG/IbdcYbi5CCJbf/qCfc9RAW7/+mby/Qvsw2C96rvs jec6f15prtUq5bwnGAKgnul6Q7D20aIoiQyEK9EumdyBz91wj8LOWhL0TTRzZFsahccVmAlbCFZ
 s0HMs9A28b+APEqpblAeMAvpdXXIJz3Ojn1T/m/FrhrDqTfdNfWlJwyKlmCob5KkYogeP2EHQjQ BoEDn+8Dkz96fkieTniZ74rTZMj5dSyPYTDF6Ppw+gdEPjIsHcwTn8ALI0reGhio6+7G6A24J18 XyMsMhF2oGtoqWcxgYSGD9IemvyhaiS4Zkv/vDhlmldkfo0/8VMQ/sHZb6GzxP7OTSlPSdotxzD
 myNOZmkmKSN1jRfY86brRsL3S+h12G9J+EcJmHC4JyiPctQpMsSgNXHLHziAijHZqbQ8y1J9
X-Proofpoint-ORIG-GUID: uftO8yYBSh0FqLgpGbiUVZ9_kxz9HJQN
X-Proofpoint-GUID: uftO8yYBSh0FqLgpGbiUVZ9_kxz9HJQN
X-Proofpoint-Spam-Reason: safe

Tidy up a few bits of the SDCA Kconfig. Make the primary SDCA
symbol visible again, whilst this is selected directly in current
Intel systems it is not a given that is how other systems will use
the subsystem and a user can not directly disable the symbol if it
is being selected anyway.

Default both HID and IRQ to enabled, since typically if one wants
SDCA all the functionality will be expected.

Finally, update the IRQ support to match the changes made to the HID
support.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/Kconfig  | 15 ++++++++++-----
 sound/soc/sdca/Makefile | 10 ++++++----
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 2253a300dcc3..7fd4cbba87bf 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -2,25 +2,30 @@
 menu "SoundWire (SDCA)"
 
 config SND_SOC_SDCA
-	tristate
+	tristate "SDCA support"
 	depends on ACPI
 	help
 	  This option enables support for the MIPI SoundWire Device
 	  Class for Audio (SDCA).
 
-config SND_SOC_SDCA_OPTIONAL
-	def_tristate SND_SOC_SDCA || !SND_SOC_SDCA
-
 config SND_SOC_SDCA_HID
 	bool "SDCA HID support"
 	depends on SND_SOC_SDCA
 	depends on HID=y || HID=SND_SOC_SDCA
+	default y
+	help
+	  This option enables support for audio jack button reporting using HID.
 
 config SND_SOC_SDCA_IRQ
-	tristate
+	bool "SDCA IRQ support"
 	select REGMAP
 	select REGMAP_IRQ
+	depends on SND_SOC_SDCA
+	default y
 	help
 	  This option enables support for SDCA IRQs.
 
+config SND_SOC_SDCA_OPTIONAL
+	def_tristate SND_SOC_SDCA || !SND_SOC_SDCA
+
 endmenu
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index 1efc869c6cbc..58a8f3ef3feb 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -1,11 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-sdca-y	:= sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o
+snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o
 snd-soc-sdca-hid-y := sdca_hid.o
 snd-soc-sdca-irq-y := sdca_interrupts.o
 
-obj-$(CONFIG_SND_SOC_SDCA)	+= snd-soc-sdca.o
+obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca.o
 ifdef CONFIG_SND_SOC_SDCA_HID
-obj-$(CONFIG_SND_SOC_SDCA)	+= snd-soc-sdca-hid.o
+obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca-hid.o
+endif
+ifdef CONFIG_SND_SOC_SDCA_IRQ
+obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca-irq.o
 endif
-obj-$(CONFIG_SND_SOC_SDCA_IRQ)	+= snd-soc-sdca-irq.o
-- 
2.39.5

