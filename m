Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C7233C534
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652669; cv=fail; b=jGh4DjftLC8PZ1ClOP8Ox6sQ2EpdS3TEgfqVGAuNAsxiM627ynl03JEQ8rfe4bVU0Z61B/eBMT6OdcW/tsPl8YEev1tiU6IAAZ66ikoByp5TEpV3diLFHBNZiwSJwCHy6DOq4uBqEhoyfBt9AqscD2o0mqKdsfysVI4LJruMy18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652669; c=relaxed/simple;
	bh=JfAPRd9/b8i7BAVhJxSFAhqGNOSibRcTI/0SB/MD+hM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P3SIF26IhCtGr3JbsSVQusd077b9uPr18A8UuloHbLsKFkLP2XeWE2dvoD4mHwdyqc55w/xXBJTAoQlcVhvjs5tYifsdjEHM+6cz/UX74oQbkHtHVy9L5oTLrtvn9e9c5Mh9cbZ79jOgAVAPCYUIeIs02lVM2HEpoDF8BBhlYvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TjS9/YAs; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=maO/ukMv; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TjS9/YAs";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="maO/ukMv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK5sZPr451043;
	Thu, 20 Nov 2025 09:30:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Vnn5KM/gq0SdhY87N+BvocCtDEWq3aOYCAFxL963AvM=; b=
	TjS9/YAsUtd82DInqd0f2UsIFyYAre5h/LJ/M+EoKJiDDnFAcDw8MsLCXEAcAcBt
	m8rj8wjWuYyoqZCqRDwK5zyH1wxgtfgYDbsANF0x940AEnLZFysTuttPvBnA1p17
	pua2XSqH5cKn8c29U321c8+7MYHeFrOX1uxKGNhXYhIxNpAn0jGujSTpfZPd88YG
	lko9yT5vMHIc5f/wJCwHZ1usDN9bWjmNFHnWloqRnjbbf6xQFVVvJRumosgek/Nf
	EIMb0DXvocA+e6kE3TbShLYzdtleJ0hDm90Hc7pVa+jAkh5v303osB7wCcUa5H/D
	wTNzKapwc2fRlvhZ1qO0Dg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021105.outbound.protection.outlook.com [52.101.62.105])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1enjt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:30:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HL1yXpYyvzR9L+qaDJcDpY1w/f2sT+UfCf7ldKDQhpF71k8E/KcOHYJAa10fO+ppuy9I4M/AeNGNAQiA63EkDF89ZJd/rTTokZWre8nx5VfaMy8BOc7+tB6gKjw5mTutbIQkPy+XJ7p5uqJr47g167brsqfQGAWGbHr7IkQLi0SzosSBDX44Fl2WjVSvE92mbhbQLtbxYZJXTaYrED9UFC3Yq8NTHSiGtr7RAbQqE+BjuQmDAYIujDmFZ8Q3AtkTGfA4GGcqHwmhaqUPm4B8CRIDhBIUON9MdRkKqWPMo6BySu1RjUCupgXkcdmoWOLMSeFy8ieN5h4NJAgki0P8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vnn5KM/gq0SdhY87N+BvocCtDEWq3aOYCAFxL963AvM=;
 b=yAgjqkMsmnWusffX5HsudNbg6KUFCk2lblI9CO1UMKBkL1GOkV2gu9lMChqiKVZBYbKAVj6G20fFFLxyRwfMzls5xrgfTt9RWh4r9rCXQRlQV0P+iJVIwj3U7a3n6hWLBK2PV5sfXzAyYzTVNxmGov1zChc2F8E5is3H0YuEUji6+cgXUwXXQ3oe3RqbZ3ssozjJxjCSiPADkaapD3/s9CxQZp6B4vCHqYjOANPLpYspAGSk/CgQ7xk1S9xDXmgzt4z88KQtjJrkybmsQpLTsAfdHBz2ernRIbZaLHqf39AUVMiEv48gvfdEaTtf9AvZux9EgTorUwefYZSaXIUcLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vnn5KM/gq0SdhY87N+BvocCtDEWq3aOYCAFxL963AvM=;
 b=maO/ukMvrzGv+iZz5xGivPPszXdVHMjX4U3OyhC8omOWuSPep69ZlFDxaUTTD4qr4GWkZpxGgQs3snzmSuAe2cWhUzdaPU8ieS/dz8l/MZGC8OaahmyLrCrWxF+DCnosepk51OnB/v54O+ILTrRx9zNqg/cJUC5/5MloSMfsqy0=
Received: from CH0P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::17)
 by PH7PR19MB6636.namprd19.prod.outlook.com (2603:10b6:510:1ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:30:33 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::4d) by CH0P220CA0029.outlook.office365.com
 (2603:10b6:610:ef::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 15:30:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:30:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F232440655F;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D4AAD82025A;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 12/13] ASoC: SDCA: Add basic SDCA class driver
Date: Thu, 20 Nov 2025 15:30:21 +0000
Message-ID: <20251120153023.2105663-13-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
References: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|PH7PR19MB6636:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9c43586f-f5f8-4750-ef95-08de2849bebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0+NK/HpNQs52SulA+w4zM22gB0Rt7SrSQY0mS3aRfPUIfS5S6z4mK3Z8WlhG?=
 =?us-ascii?Q?0vLF5cChcXaTCVKqxWdMQcvQ4yDvSDv4VPhGvzztztgGStsauRRT3cDiQj4v?=
 =?us-ascii?Q?aCMh1BsT7VAulnhyY52GUSjyXZyHWoK3iNeRr2TFWJzbJn80BLKMTkJh8Wn9?=
 =?us-ascii?Q?+vv69Lq6VOBojH/eI5J4uPkOL6BVXeCqaC4c7307UEuh4UGS5rQAaMIHnWOr?=
 =?us-ascii?Q?jG8wdFYiNiG+Hy3VayLVSYaz9VYrGTuLkPICfkkJmRXgHtn66pgMxhRQzb3D?=
 =?us-ascii?Q?NxXcvZfWrtM+hqB1lGmvj88Rjk/fqN9qjKxbIPvJ9Iis751bAaBDjGBYj4AB?=
 =?us-ascii?Q?cijDsQeB//NzmdqiSkVLuz46TzrNytZeuSFCeJsuiKgZpeph/K1NuzK6P7vX?=
 =?us-ascii?Q?UYaMt79dCL5lD6nVUbdg3OMNMZJdEUblZzf0vHT4d21Thbgk/0fQBnF4cLqy?=
 =?us-ascii?Q?ZRPhMJ9sODzqfynYN3DlMDH+CtMLylq9GVXY0lMarmOJsbXyvF6JCS9QkPBn?=
 =?us-ascii?Q?sZY2ALl7q/IQbFwpYiGFcum3h0xuwvZAjztvl9iqnSciR+UxTiMAyIwt6n/Z?=
 =?us-ascii?Q?fNATMoHSdtiWLCNQcCHkosacqUZ8R6VOlYY5vf7TqW9HEwTSPsua/HJmGkHf?=
 =?us-ascii?Q?C+KJtVeDSQvgnGit5pdec/PwR2Drx96Z87atpBMg4yon6mRTJer9OOaK9kIw?=
 =?us-ascii?Q?74Xii2XnvX1KVFTk60wBzl3G0wlfIwKBl4o3jd+vg1B0fSrqF4uLx+ctsvV5?=
 =?us-ascii?Q?yeohjihfAbQ9CwA4mYWG8zyPFNNTFyBmYrB3/6X+sKXn3kUw/LM5uhpx7vNo?=
 =?us-ascii?Q?v3xs8uFCwU4nvCp4ikmHlHlSpufEsd9dqokzXqzlhyvdD/nlvqN/OgW4+MJO?=
 =?us-ascii?Q?Gbid1xXsdiuIXTAdaZoz4+9wI2OPDe24z3uVu19/3g9xGA+fX5UfSAocmv3Z?=
 =?us-ascii?Q?10bBjtPNMsXHfTtJQUrLOb/mZF4weBFOiDfcOiYZecWJ99rqOQM5CUYL/5RP?=
 =?us-ascii?Q?shbXcM0uA4RMGTainwr5ibsKfbflk4OSJ0BQeEz+qizmtu7xG8Ncej8gRCpF?=
 =?us-ascii?Q?IwwfFOTS0oYYpFiwA05NJjmjx3exqd/eqT759Mof+wm7iCL/mYNUoFSBMBSb?=
 =?us-ascii?Q?YiVuVfIif9gl7hfrUbo6yOtMjF/dFke8XOmYT//hKlZfzBcr8YuX9yRnROhY?=
 =?us-ascii?Q?YIgT6L6F/Md3WJjKeAgJ+KC8ueBWj1XkvzkS9Wp30jZgTyLCkl70wnvhGfPm?=
 =?us-ascii?Q?ba1eb9wmsYNfYbTA/JxiwnupjzLXsVfhAcAjFYbV4fmaS8oRZjLLNArZumg6?=
 =?us-ascii?Q?fzaVFM2P2L1GZwpUnc9jz04Ioxfeqcq6OVrqjb+g3DyEkMSnMaaQ8dTDUod+?=
 =?us-ascii?Q?YW18yBAGOlciXJvZAg/pxsSZiOSz6LSYCgCbdFOFlSo/G5zNeyXytywp66Nm?=
 =?us-ascii?Q?hRlcumoddqXcBTKbi75xX+l63hfDlBeEJN4tuNhAXx9z+qFAnUfVUXuLdNTU?=
 =?us-ascii?Q?SBAtmwrkoBq3kwG2KdT1za/1aUF0zryibcNh+ohRp6RYFioReTECMYsGQidu?=
 =?us-ascii?Q?LLPVc/lPSlIOh5AHWwk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:30:32.8523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c43586f-f5f8-4750-ef95-08de2849bebb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6636
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691f3425 cx=c_pps
 a=j9YS1grUKdii23dO5U7Bdg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8 a=QyXUC8HyAAAA:8
 a=XzTDFQMnW7AdnzpR8z4A:9 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-GUID: WBA8JUefmPob3NV3zizz535IGAzT978P
X-Proofpoint-ORIG-GUID: WBA8JUefmPob3NV3zizz535IGAzT978P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMiBTYWx0ZWRfXwLT0gvznmcH1
 qfFoj5EaQMLQbewOhT2R8B+G8NL1G38iu+YWWoV7HnfvfSBj7y/P4UpFaUuF96/KhI0Iral/vKu
 VkisOpic1MPAKbu0xplD6c0eOeRA02bjHs+4IC5vNdgnGv0YGLEIZffDIUjPFIChx2f72NL1IEs
 uytAHJBYDLTVd3nX/YaWpSujDxaJG8+Dw9PqwulKoXE0OJ8hkrnhmJkt8MOKUeo5h2Ak01TK7m0
 2oFWyWgabv/J5xPg0OzPhVv/MzGH31gDnx86HpWdtZ+3D+5U2Ep1jvQpkBE3zosjbZJASoulOA7
 D3GhfMpMUqs3D4SkjaDrFw7M12S10c9rTiOTkpb8mpMY4eX9M6+zK3Q8tWD7gPWcdTowxkMWLtJ
 4PoRRE1PredeVE6M6l5tMUp4HB12RA==
X-Proofpoint-Spam-Reason: safe

Add a device level driver as the entry point for the class driver.
Additional auxiliary drivers will be registered to support each function
within the device. This driver will register those function drivers and
provide the device level functionality, such as monitoring bus
attach/detach, the device level register map, and the root for the IRQ
handling.

Co-developed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v3:
 - Switch select SND_SOC_SDCA to depends on SND_SOC_SDCA to ensure the
   depends on ACPI in SND_SOC_SDCA is considered.

 include/linux/soundwire/sdw_registers.h |   2 +
 sound/soc/sdca/Kconfig                  |  10 +
 sound/soc/sdca/Makefile                 |   4 +
 sound/soc/sdca/sdca_class.c             | 304 ++++++++++++++++++++++++
 sound/soc/sdca/sdca_class.h             |  37 +++
 5 files changed, 357 insertions(+)
 create mode 100644 sound/soc/sdca/sdca_class.c
 create mode 100644 sound/soc/sdca/sdca_class.h

diff --git a/include/linux/soundwire/sdw_registers.h b/include/linux/soundwire/sdw_registers.h
index 0a5939285583b..cae8a0a5a9b04 100644
--- a/include/linux/soundwire/sdw_registers.h
+++ b/include/linux/soundwire/sdw_registers.h
@@ -355,4 +355,6 @@
 /* Check the reserved and fixed bits in address */
 #define SDW_SDCA_VALID_CTL(reg) (((reg) & (GENMASK(31, 25) | BIT(18) | BIT(13))) == BIT(30))
 
+#define SDW_SDCA_MAX_REGISTER			0x47FFFFFF
+
 #endif /* __SDW_REGISTERS_H */
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index e7f36d668f159..cbce51be0ba93 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -37,4 +37,14 @@ config SND_SOC_SDCA_FDL
 config SND_SOC_SDCA_OPTIONAL
 	def_tristate SND_SOC_SDCA || !SND_SOC_SDCA
 
+config SND_SOC_SDCA_CLASS
+	tristate "SDCA Class Driver"
+	depends on SND_SOC_SDCA
+	select SND_SOC_SDCA_FDL
+	select SND_SOC_SDCA_HID
+	select SND_SOC_SDCA_IRQ
+	help
+	  This option enables support for the SDCA Class driver which should
+	  support any class compliant SDCA part.
+
 endmenu
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index babe3fa2bb3ff..95db4cef34833 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -6,4 +6,8 @@ snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_FDL) += sdca_fdl.o
 
+snd-soc-sdca-class-y := sdca_class.o
+
 obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca.o
+
+obj-$(CONFIG_SND_SOC_SDCA_CLASS) += snd-soc-sdca-class.o
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
new file mode 100644
index 0000000000000..349d32933ba85
--- /dev/null
+++ b/sound/soc/sdca/sdca_class.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/sdca.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_interrupts.h>
+#include <sound/sdca_regmap.h>
+#include "sdca_class.h"
+
+#define CLASS_SDW_ATTACH_TIMEOUT_MS	5000
+
+static int class_read_prop(struct sdw_slave *sdw)
+{
+	struct sdw_slave_prop *prop = &sdw->prop;
+
+	sdw_slave_read_prop(sdw);
+
+	prop->use_domain_irq = true;
+	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY |
+			      SDW_SCP_INT1_IMPL_DEF;
+
+	return 0;
+}
+
+static int class_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_status status)
+{
+	struct sdca_class_drv *drv = dev_get_drvdata(&sdw->dev);
+
+	switch (status) {
+	case SDW_SLAVE_ATTACHED:
+		dev_dbg(drv->dev, "device attach\n");
+
+		drv->attached = true;
+
+		complete(&drv->device_attach);
+		break;
+	case SDW_SLAVE_UNATTACHED:
+		dev_dbg(drv->dev, "device detach\n");
+
+		drv->attached = false;
+
+		reinit_completion(&drv->device_attach);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct sdw_slave_ops class_sdw_ops = {
+	.read_prop	= class_read_prop,
+	.update_status	= class_sdw_update_status,
+};
+
+static void class_regmap_lock(void *data)
+{
+	struct mutex *lock = data;
+
+	mutex_lock(lock);
+}
+
+static void class_regmap_unlock(void *data)
+{
+	struct mutex *lock = data;
+
+	mutex_unlock(lock);
+}
+
+static int class_wait_for_attach(struct sdca_class_drv *drv)
+{
+	if (!drv->attached) {
+		unsigned long timeout = msecs_to_jiffies(CLASS_SDW_ATTACH_TIMEOUT_MS);
+		unsigned long time;
+
+		time = wait_for_completion_timeout(&drv->device_attach, timeout);
+		if (!time) {
+			dev_err(drv->dev, "timed out waiting for device re-attach\n");
+			return -ETIMEDOUT;
+		}
+	}
+
+	regcache_cache_only(drv->dev_regmap, false);
+
+	return 0;
+}
+
+static bool class_dev_regmap_volatile(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SDW_SCP_SDCA_INTMASK1 ... SDW_SCP_SDCA_INTMASK4:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static bool class_dev_regmap_precious(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SDW_SCP_SDCA_INT1 ... SDW_SCP_SDCA_INT4:
+	case SDW_SCP_SDCA_INTMASK1 ... SDW_SCP_SDCA_INTMASK4:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static const struct regmap_config class_dev_regmap_config = {
+	.name			= "sdca-device",
+	.reg_bits		= 32,
+	.val_bits		= 8,
+
+	.max_register		= SDW_SDCA_MAX_REGISTER,
+	.volatile_reg		= class_dev_regmap_volatile,
+	.precious_reg		= class_dev_regmap_precious,
+
+	.cache_type		= REGCACHE_MAPLE,
+
+	.lock			= class_regmap_lock,
+	.unlock			= class_regmap_unlock,
+};
+
+static void class_boot_work(struct work_struct *work)
+{
+	struct sdca_class_drv *drv = container_of(work,
+						  struct sdca_class_drv,
+						  boot_work);
+	int ret;
+
+	ret = class_wait_for_attach(drv);
+	if (ret)
+		goto err;
+
+	drv->irq_info = sdca_irq_allocate(drv->dev, drv->dev_regmap,
+					  drv->sdw->irq);
+	if (IS_ERR(drv->irq_info))
+		goto err;
+
+	ret = sdca_dev_register_functions(drv->sdw);
+	if (ret)
+		goto err;
+
+	dev_dbg(drv->dev, "boot work complete\n");
+
+	pm_runtime_mark_last_busy(drv->dev);
+	pm_runtime_put_autosuspend(drv->dev);
+
+	return;
+
+err:
+	pm_runtime_put_sync(drv->dev);
+}
+
+static void class_dev_remove(void *data)
+{
+	struct sdca_class_drv *drv = data;
+
+	cancel_work_sync(&drv->boot_work);
+
+	sdca_dev_unregister_functions(drv->sdw);
+}
+
+static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
+{
+	struct device *dev = &sdw->dev;
+	struct sdca_device_data *data = &sdw->sdca_data;
+	struct regmap_config *dev_config;
+	struct sdca_class_drv *drv;
+	int ret;
+
+	sdca_lookup_swft(sdw);
+
+	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
+	if (!drv)
+		return -ENOMEM;
+
+	dev_config = devm_kmemdup(dev, &class_dev_regmap_config,
+				  sizeof(*dev_config), GFP_KERNEL);
+	if (!dev_config)
+		return -ENOMEM;
+
+	drv->functions = devm_kcalloc(dev, data->num_functions,
+				      sizeof(*drv->functions),
+				      GFP_KERNEL);
+	if (!drv->functions)
+		return -ENOMEM;
+
+	drv->dev = dev;
+	drv->sdw = sdw;
+	mutex_init(&drv->regmap_lock);
+
+	dev_set_drvdata(drv->dev, drv);
+
+	INIT_WORK(&drv->boot_work, class_boot_work);
+	init_completion(&drv->device_attach);
+
+	dev_config->lock_arg = &drv->regmap_lock;
+
+	drv->dev_regmap = devm_regmap_init_sdw(sdw, dev_config);
+	if (IS_ERR(drv->dev_regmap))
+		return dev_err_probe(drv->dev, PTR_ERR(drv->dev_regmap),
+				     "failed to create device regmap\n");
+
+	regcache_cache_only(drv->dev_regmap, true);
+
+	pm_runtime_set_autosuspend_delay(dev, 250);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, class_dev_remove, drv);
+	if (ret)
+		return ret;
+
+	queue_work(system_long_wq, &drv->boot_work);
+
+	return 0;
+}
+
+static int class_runtime_suspend(struct device *dev)
+{
+	struct sdca_class_drv *drv = dev_get_drvdata(dev);
+
+	/*
+	 * Whilst the driver doesn't power the chip down here, going into runtime
+	 * suspend lets the SoundWire bus power down, which means the driver
+	 * can't communicate with the device any more.
+	 */
+	regcache_cache_only(drv->dev_regmap, true);
+
+	return 0;
+}
+
+static int class_runtime_resume(struct device *dev)
+{
+	struct sdca_class_drv *drv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = class_wait_for_attach(drv);
+	if (ret)
+		goto err;
+
+	regcache_mark_dirty(drv->dev_regmap);
+
+	ret = regcache_sync(drv->dev_regmap);
+	if (ret) {
+		dev_err(drv->dev, "failed to restore cache: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	regcache_cache_only(drv->dev_regmap, true);
+
+	return ret;
+}
+
+static const struct dev_pm_ops class_pm_ops = {
+	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
+};
+
+static const struct sdw_device_id class_sdw_id[] = {
+	SDW_SLAVE_ENTRY(0x01FA, 0x4245, 0),
+	{}
+};
+MODULE_DEVICE_TABLE(sdw, class_sdw_id);
+
+static struct sdw_driver class_sdw_driver = {
+	.driver = {
+		.name		= "sdca_class",
+		.pm		= pm_ptr(&class_pm_ops),
+	},
+
+	.probe		= class_sdw_probe,
+	.id_table	= class_sdw_id,
+	.ops		= &class_sdw_ops,
+};
+module_sdw_driver(class_sdw_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SDCA Class Driver");
+MODULE_IMPORT_NS("SND_SOC_SDCA");
diff --git a/sound/soc/sdca/sdca_class.h b/sound/soc/sdca/sdca_class.h
new file mode 100644
index 0000000000000..bb4c9dd124296
--- /dev/null
+++ b/sound/soc/sdca/sdca_class.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ *
+ * Copyright (C) 2025 Cirrus Logic, Inc. and
+ *                    Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef __SDCA_CLASS_H__
+#define __SDCA_CLASS_H__
+
+#include <linux/completion.h>
+#include <linux/mutex.h>
+#include <linux/workqueue.h>
+
+struct device;
+struct regmap;
+struct sdw_slave;
+struct sdca_function_data;
+
+struct sdca_class_drv {
+	struct device *dev;
+	struct regmap *dev_regmap;
+	struct sdw_slave *sdw;
+
+	struct sdca_function_data *functions;
+	struct sdca_interrupt_info *irq_info;
+
+	struct mutex regmap_lock;
+	struct work_struct boot_work;
+	struct completion device_attach;
+
+	bool attached;
+};
+
+#endif /* __SDCA_CLASS_H__ */
-- 
2.47.3

