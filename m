Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6533164A9
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182537; cv=fail; b=tTZ7EOV0GzO2/pgsOVGGn+8jz7bNXxpepNg3LlWApugU5tZi/T6TxnflJKJu4U99ENCUcICNk/jZDFxL/D5X9L+Vpn9jg5eGHYrD1tFVcYFAY5EHXejAssW2XLRri4cVQOjyphH0EyBpdxD/kfQFDSgL3jjrOakXzjpbH7vXdNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182537; c=relaxed/simple;
	bh=0H1C6IH6pc92qE6ioMo/Fj6HU9E55iiW8HZZrCyi6GM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ibCGG153RaINfIQCipDNNtiZ8wvoEki0GaTWd5qKEEvE5taBlvjdlTQu8+wse4Kx86SHcpbzJDhO8tfdio95Tf4nwxjk4+Gu1yxwdSy7XNgUXqiMN/iXr9NIzoOqR1jsXURhjydM3YSvhFhG35kcaFjN+I62x0EaKJSXiyT9/+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=llLSXBaf; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hk5xy1/1; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="llLSXBaf";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hk5xy1/1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A35JB9S874130;
	Mon, 3 Nov 2025 09:08:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=GYTGpS8NFqeyab9wAWpCVw0oOaLPm1kq9SqUMvJeajY=; b=
	llLSXBafpFnwVdf/raJfh7K8BjnVCG8Ijmc/uh77uEUXi7ga0eOCOAcdMpY14Juw
	Df39IWj9QapXsgo+/XDt+/LRu+bURS/56kHEckmQuHrQaTDKI3k0/eyRHz93iz11
	BScvYQ3vCQe41srvaB6tXrsfre+LMmR+ImdiGSbzXKZ3SBhklJcgz9CJh8/XC2Ek
	bS2c2t3hWlW7/Xm3FhyPWWwSDd14GKE2xHTN568Huql2snGeLgNFrjS0LJf9KMC7
	dLAHKHTmwRqiDzsRzPIjYcmD2OPheBHbhynHvxGOhiAj7tOH2bQpH2g5EwwxkGS7
	MkJ/f+fU2CcOvHn9sJYTNA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023118.outbound.protection.outlook.com [40.93.196.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a5emg26r2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:08:31 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQomWUj1LlDzTE4DWSHqKyr6alXX8vFr1nNyX0urMSdpU/3lxitiffbjVC/pO4y3Vp01ONv/gdi0LOA79bP6UU/wGR8cBABtc2kXtqTF5jO2Hs97s6455g6s1jO5MoEO+Ypd4GzAAsVCMNU53C8H4v1b3uQn9KBaL5HgDYBADAMPg/MpjQJttQOw9GHnaLUMevHOZU3KpPRgvUP+XNRFTOHNKyeLk8AG/tYhVj0JXVRrZVZAZGyxEOpQjTOtBL2UH13MMsEydk3hw/74p6nUMOjxwSgqLIgQ8iAQFyOL1Tx/ofDmry17JIKKxM+p4DBWwJcjG9z/byHchjfrXkdddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYTGpS8NFqeyab9wAWpCVw0oOaLPm1kq9SqUMvJeajY=;
 b=jbUF7ChW8ngsztfCyjJvByQgg31M4OlzLUkB4+ZmAMO9Gh5ky85cmOoYe0LNR2KT/LBQ8acG/b8iKO2Q5frUqUWMOUqCxko5Sy4ev65orbgxkOSy6Dkw/sz2dS0uvul5DIAjFEMIC/+ilPPuGTp4xHJpwd/8Yq1a2aLxU8b0jeyGwSNtOzxcNNmQYAzqO7enIPiWilr+ssVRVbparE0X27vbXDGml2cvcKEe4K5J2Vi0GOVpqEwoyVjqYKmFIxKmakF95LJrTmVU65cg3OmgnfrRAZzvXfQNMCkmzjgY+5vy6n3cg1pii2QPpXgw9KpjANsj5lEiPDdwhLOC7vHcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYTGpS8NFqeyab9wAWpCVw0oOaLPm1kq9SqUMvJeajY=;
 b=hk5xy1/1zq4D9/63xLETBIweuSFnaSm0NdsAp0IuHnnAdxoz/rD5FRUmFDD5O6yezda+AH9RDA2xoZakfJ57qgfAN8ImFOFO8YbiGtt8sC9A6p6gSGV81DFkOSJZbu2sEHUizFVRvDNxwPRG1nVITn4kAEj79ysVdkRq8aqkbho=
Received: from MW4PR04CA0377.namprd04.prod.outlook.com (2603:10b6:303:81::22)
 by IA1PR19MB8291.namprd19.prod.outlook.com (2603:10b6:208:3ed::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Mon, 3 Nov
 2025 15:08:23 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:303:81:cafe::4c) by MW4PR04CA0377.outlook.office365.com
 (2603:10b6:303:81::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 15:08:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.0
 via Frontend Transport; Mon, 3 Nov 2025 15:08:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6433E406642;
	Mon,  3 Nov 2025 15:08:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D1C95820258;
	Mon,  3 Nov 2025 15:08:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 13/13] ASoC: SDCA: Add basic SDCA function driver
Date: Mon,  3 Nov 2025 15:08:08 +0000
Message-ID: <20251103150808.4015208-14-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
References: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|IA1PR19MB8291:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f03dd077-a020-410b-41a7-08de1aead443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hQarYof+lFiaRSyeTsj84thjdegsRH72VmY68rFQTWTaJC8WVkvlCYL3+Fn5?=
 =?us-ascii?Q?lu3DPq6Z29veH88fzXk538hbvla/lbpvBJlJ3i5US5qyJEGjPHGgZQ01Cv6x?=
 =?us-ascii?Q?PI734bEnmWfphJIjbZHhPPPUGl1rI9KR77LwgBSG1ANRSpwjdvYrXSdJRsEw?=
 =?us-ascii?Q?9EsNMT1tq9G+1Ub5jXYWtc18oSIfYLNRnk0U+/6mZTIOpSsgbvp7v6vTx/1h?=
 =?us-ascii?Q?cMAa4CPcoQica6TxGwaPnQElZyh8ukYbD/LtkOxkCX9e1uM0oOFbdNIHxdHv?=
 =?us-ascii?Q?ZvFGsWX5hf40/P5omXU7BTHg3C4ttaRfMalUJb5dhMYBOpvYn/N8F26n7DWZ?=
 =?us-ascii?Q?OFXYHft0GeK6qRaHeJ9QaK3N2f3CsT/ltO+HQfFoCC0d6wfRYy4HrYdmqHF1?=
 =?us-ascii?Q?BKQ6+Vi6FA2U6BLa0RcdPniVk+ELuzWUyTcfg6gVHLnCUoOEEFLKs+cCGmAF?=
 =?us-ascii?Q?AXn/YdRBCr4/g//BQUt5JvUOOXLUENdqiKVMIvDPy/PvfY4sd7mJD6oEWNl4?=
 =?us-ascii?Q?D4PqrwcP/TrGUZBqfhS7bXUvALMR/+Mam5yBZDpBtCc/di7bsOa6e1LIX+WN?=
 =?us-ascii?Q?Kj+bO9ShI/QMn8NvT11gqfg3+NZCbVIYvOxXgK09EsURDo0jlT/VlEGDXSbr?=
 =?us-ascii?Q?eCy40PX1X+9JgU7ljFcZ5Kgms8aB0U8iHJy5pRMgpsiZBAGQVqO65lCBInnP?=
 =?us-ascii?Q?oiFVb3sCwQi/OgOMWJSvcsNReVITpKmFVhr/K2cDPU/KnFGLI7Bd3Luz4+vt?=
 =?us-ascii?Q?AVL2f5AUofjSmuGgbQPHhZ2nzWqcsYSB0IBmFh00/b96sgzw5jJGfxQDlPbG?=
 =?us-ascii?Q?TqjTygCWygQekxywQKInoe4dLuv4FzWQqr323rCknA//iGGDv0sY85gIDZpp?=
 =?us-ascii?Q?n/veb+RyU5q7eOBcS14TtvXz84VdF2e00gzM3zJ7MKRBZkHzCXE7OU+vmxaE?=
 =?us-ascii?Q?34vZ5jMUgoJXYOMu8LvWlSinhCkJ/HRFAz51oVhVDnT8hztEfVGUCHbUs8Sj?=
 =?us-ascii?Q?PB0GglYpOLp7K5rd0P9i/Hbc4fXffLXj5zweFI0mL13VDIjYg72A4BFA63sD?=
 =?us-ascii?Q?sB/lShPihMGRXkJ2KZU4FEqjZO1bI6ZMyfWVrsOG0kAfw72HCBfrR4IYAFMk?=
 =?us-ascii?Q?hod8o+ZiQbtJGYsBXA+JFf4ErYUIAIUT0Z0anTi8t8itV4nCY3C5Zn7MsHxU?=
 =?us-ascii?Q?ngZxWIv+u0nTxREV7vPWImOCEauJsMD6rSNjcrom37rNmoKC/OuHJxubMcA6?=
 =?us-ascii?Q?6zTywPCqYPEAxrC7AaJnL0ZlOiktIiF65r5p6e22F5bwjmsRwtjSLWQ5Jy15?=
 =?us-ascii?Q?IUProkH+tr5OzFOh9u2UapSRFUT4TzxehmTfq917fNhMQMwZFlcTJSI3p+cz?=
 =?us-ascii?Q?Jo6xnKLhJ7bq9v6PIWFmveZ43Ufs0Jd7ItOqa/6C3a6+wnVbEHNe2/CatIg5?=
 =?us-ascii?Q?Ihi2UtFq4CkIzra2W2MZfkQxSojYJQ8aq8GUWqxq9bGsnYB8Ify8SzQIJQ4S?=
 =?us-ascii?Q?BAYWhlMl+HpAx26rrzVdMF1NGaZ6q0wXbmUmNjSUnZyoJNooVuNd1It6T7R3?=
 =?us-ascii?Q?BZSFUeSVGOq+Jm+W3j0=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:08:21.5691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f03dd077-a020-410b-41a7-08de1aead443
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB8291
X-Proofpoint-GUID: JLt7-bcLJEljzv6dt24KFVhsKWooxvtt
X-Authority-Analysis: v=2.4 cv=Mu5fKmae c=1 sm=1 tr=0 ts=6908c56f cx=c_pps
 a=emGy3M2YSyErp0/4l4UmgA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8
 a=JfUX2HHz7D_845OBrMAA:9 a=HE_01F9_QflCRFonrIQr:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: JLt7-bcLJEljzv6dt24KFVhsKWooxvtt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNyBTYWx0ZWRfX0ivTX5Qvksm7
 TYMMUC3us5/v11b3eUJl8XT+f0JE150TtzypdPyz1nl/R8HUX4ZNl64H66lyACj02ug0AI38tHo
 Lyp6NS+bOdwZ4zdfewIeijzRbwoz7OqTHFI+9G5nCVc3HYF8ckZmQ+Qm3qajX4RqyG65f2GTqHu
 ZrRD5S86iQqK7ORd3p2GgG2A2uKuaYAsvke1MUOFJdC2pxUcy1UABbLQr+5EX83s5X6qGhL3gdn
 X0y//KhBflJVkKbGKGOHMhB/EXrIGKxt6PbUdEIcGxH/7WcPaCgu0G2KGuJKc1Ar2c+KBRDhwhH
 t7u1/KbI4Eus3cfho6pNLaiQJdSpON6LxI61+qCMC6SnPItxu5jna1o+FsGk8xgVDx/6RO+tcqQ
 WNlVVY65G2/gUXEthavI+MBOm6XbYg==
X-Proofpoint-Spam-Reason: safe

Add a driver to support the individual SDCA functions within the class
driver. Use the SDCA helpers to parse the DisCo information and register
a function driver based on those properties. Manage the boot of the
function, reset, FDL, defaults. Manage the function level register map.

Co-developed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Add some extra comments to clarify some code
 - Remove spurious error print
 - Flip order of recache mark dirty and cache only

 sound/soc/sdca/Kconfig               |   7 +
 sound/soc/sdca/Makefile              |   2 +
 sound/soc/sdca/sdca_class_function.c | 460 +++++++++++++++++++++++++++
 3 files changed, 469 insertions(+)
 create mode 100644 sound/soc/sdca/sdca_class_function.c

diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 56e3ff8448762..0a37e94a60302 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -39,6 +39,7 @@ config SND_SOC_SDCA_OPTIONAL
 
 config SND_SOC_SDCA_CLASS
 	tristate "SDCA Class Driver"
+	select SND_SOC_SDCA_CLASS_FUNCTION
 	select SND_SOC_SDCA
 	select SND_SOC_SDCA_FDL
 	select SND_SOC_SDCA_HID
@@ -47,4 +48,10 @@ config SND_SOC_SDCA_CLASS
 	  This option enables support for the SDCA Class driver which should
 	  support any class compliant SDCA part.
 
+config SND_SOC_SDCA_CLASS_FUNCTION
+	tristate
+	help
+	  This option enables support for the SDCA Class Function drivers,
+	  these implement the individual functions of the SDCA Class driver.
+
 endmenu
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index 95db4cef34833..f6b73275d9649 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -7,7 +7,9 @@ snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_FDL) += sdca_fdl.o
 
 snd-soc-sdca-class-y := sdca_class.o
+snd-soc-sdca-class-function-y := sdca_class_function.o
 
 obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca.o
 
 obj-$(CONFIG_SND_SOC_SDCA_CLASS) += snd-soc-sdca-class.o
+obj-$(CONFIG_SND_SOC_SDCA_CLASS_FUNCTION) += snd-soc-sdca-class-function.o
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
new file mode 100644
index 0000000000000..526b30e0e365d
--- /dev/null
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <sound/pcm.h>
+#include <sound/sdca_asoc.h>
+#include <sound/sdca_fdl.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_interrupts.h>
+#include <sound/sdca_regmap.h>
+#include <sound/sdw.h>
+#include <sound/soc-component.h>
+#include <sound/soc-dai.h>
+#include <sound/soc.h>
+#include "sdca_class.h"
+
+struct class_function_drv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct sdca_class_drv *core;
+
+	struct sdca_function_data *function;
+};
+
+static void class_function_regmap_lock(void *data)
+{
+	struct mutex *lock = data;
+
+	mutex_lock(lock);
+}
+
+static void class_function_regmap_unlock(void *data)
+{
+	struct mutex *lock = data;
+
+	mutex_unlock(lock);
+}
+
+static bool class_function_regmap_writeable(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_writeable(drv->function, reg);
+}
+
+static bool class_function_regmap_readable(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_readable(drv->function, reg);
+}
+
+static bool class_function_regmap_volatile(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_volatile(drv->function, reg);
+}
+
+static const struct regmap_config class_function_regmap_config = {
+	.name			= "sdca",
+	.reg_bits		= 32,
+	.val_bits		= 32,
+	.reg_format_endian	= REGMAP_ENDIAN_LITTLE,
+	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
+
+	.max_register		= SDW_SDCA_MAX_REGISTER,
+	.readable_reg		= class_function_regmap_readable,
+	.writeable_reg		= class_function_regmap_writeable,
+	.volatile_reg		= class_function_regmap_volatile,
+
+	.cache_type		= REGCACHE_MAPLE,
+
+	.lock			= class_function_regmap_lock,
+	.unlock			= class_function_regmap_unlock,
+};
+
+static int class_function_regmap_mbq_size(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_mbq_size(drv->function, reg);
+}
+
+static bool class_function_regmap_deferrable(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_deferrable(drv->function, reg);
+}
+
+static const struct regmap_sdw_mbq_cfg class_function_mbq_config = {
+	.mbq_size		= class_function_regmap_mbq_size,
+	.deferrable		= class_function_regmap_deferrable,
+	.retry_us		= 1000,
+	.timeout_us		= 10000,
+};
+
+static int class_function_startup(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
+
+	return sdca_asoc_set_constraints(drv->dev, drv->regmap, drv->function,
+					 substream, dai);
+}
+
+static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream,
+					     struct snd_pcm_hw_params *params,
+					     struct snd_soc_dai *dai)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
+	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
+	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
+	struct sdw_stream_config sconfig = {0};
+	struct sdw_port_config pconfig = {0};
+	int ret;
+
+	if (!sdw_stream)
+		return -EINVAL;
+
+	snd_sdw_params_to_config(substream, params, &sconfig, &pconfig);
+
+	/*
+	 * FIXME: As also noted in sdca_asoc_get_port(), currently only
+	 * a single unshared port is supported for each DAI.
+	 */
+	ret = sdca_asoc_get_port(drv->dev, drv->regmap, drv->function, dai);
+	if (ret < 0)
+		return ret;
+
+	pconfig.num = ret;
+
+	ret = sdw_stream_add_slave(sdw, &sconfig, &pconfig, 1, sdw_stream);
+	if (ret) {
+		dev_err(drv->dev, "failed to add sdw stream: %d\n", ret);
+		return ret;
+	}
+
+	return sdca_asoc_hw_params(drv->dev, drv->regmap, drv->function,
+				   substream, params, dai);
+}
+
+static int class_function_sdw_remove_peripheral(struct snd_pcm_substream *substream,
+						struct snd_soc_dai *dai)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
+	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
+	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
+
+	if (!sdw_stream)
+		return -EINVAL;
+
+	return sdw_stream_remove_slave(sdw, sdw_stream);
+}
+
+static int class_function_sdw_set_stream(struct snd_soc_dai *dai, void *sdw_stream,
+					 int direction)
+{
+	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops class_function_sdw_ops = {
+	.startup	= class_function_startup,
+	.shutdown	= sdca_asoc_free_constraints,
+	.set_stream	= class_function_sdw_set_stream,
+	.hw_params	= class_function_sdw_add_peripheral,
+	.hw_free	= class_function_sdw_remove_peripheral,
+};
+
+static int class_function_component_probe(struct snd_soc_component *component)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
+	struct sdca_class_drv *core = drv->core;
+
+	return sdca_irq_populate(drv->function, component, core->irq_info);
+}
+
+static const struct snd_soc_component_driver class_function_component_drv = {
+	.probe			= class_function_component_probe,
+	.endianness		= 1,
+};
+
+static int class_function_boot(struct class_function_drv *drv)
+{
+	unsigned int reg = SDW_SDCA_CTL(drv->function->desc->adr,
+					SDCA_ENTITY_TYPE_ENTITY_0,
+					SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(drv->regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(drv->dev, "failed to read function status: %d\n", ret);
+		return ret;
+	}
+
+	if (!(val & SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET)) {
+		dev_dbg(drv->dev, "reset function device\n");
+
+		ret = sdca_reset_function(drv->dev, drv->function, drv->regmap);
+		if (ret)
+			return ret;
+	}
+
+	if (val & SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION) {
+		dev_dbg(drv->dev, "write initialisation\n");
+
+		ret = sdca_regmap_write_init(drv->dev, drv->core->dev_regmap,
+					     drv->function);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(drv->regmap, reg,
+				   SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION);
+		if (ret < 0) {
+			dev_err(drv->dev,
+				"failed to clear function init status: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	/* Start FDL process */
+	ret = sdca_irq_populate_early(drv->dev, drv->regmap, drv->function,
+				      drv->core->irq_info);
+	if (ret)
+		return ret;
+
+	ret = sdca_fdl_sync(drv->dev, drv->function, drv->core->irq_info);
+	if (ret)
+		return ret;
+
+	ret = sdca_regmap_write_defaults(drv->dev, drv->regmap, drv->function);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(drv->regmap, reg, 0xFF);
+	if (ret < 0) {
+		dev_err(drv->dev, "failed to clear function status: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int class_function_probe(struct auxiliary_device *auxdev,
+				const struct auxiliary_device_id *aux_dev_id)
+{
+	struct device *dev = &auxdev->dev;
+	struct sdca_class_drv *core = dev_get_drvdata(dev->parent);
+	struct sdca_device_data *data = &core->sdw->sdca_data;
+	struct sdca_function_desc *desc;
+	struct snd_soc_component_driver *cmp_drv;
+	struct snd_soc_dai_driver *dais;
+	struct class_function_drv *drv;
+	struct regmap_sdw_mbq_cfg *mbq_config;
+	struct regmap_config *config;
+	struct reg_default *defaults;
+	int ndefaults;
+	int num_dais;
+	int ret;
+	int i;
+
+	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
+	if (!drv)
+		return -ENOMEM;
+
+	cmp_drv = devm_kmemdup(dev, &class_function_component_drv, sizeof(*cmp_drv),
+			       GFP_KERNEL);
+	if (!cmp_drv)
+		return -ENOMEM;
+
+	config = devm_kmemdup(dev, &class_function_regmap_config, sizeof(*config),
+			      GFP_KERNEL);
+	if (!config)
+		return -ENOMEM;
+
+	mbq_config = devm_kmemdup(dev, &class_function_mbq_config, sizeof(*mbq_config),
+				  GFP_KERNEL);
+	if (!mbq_config)
+		return -ENOMEM;
+
+	drv->dev = dev;
+	drv->core = core;
+
+	for (i = 0; i < data->num_functions; i++) {
+		desc = &data->function[i];
+
+		if (desc->type == aux_dev_id->driver_data)
+			break;
+	}
+	if (i == core->sdw->sdca_data.num_functions) {
+		dev_err(dev, "failed to locate function\n");
+		return -EINVAL;
+	}
+
+	drv->function = &core->functions[i];
+
+	ret = sdca_parse_function(dev, core->sdw, desc, drv->function);
+	if (ret)
+		return ret;
+
+	ndefaults = sdca_regmap_count_constants(dev, drv->function);
+	if (ndefaults < 0)
+		return ndefaults;
+
+	defaults = devm_kcalloc(dev, ndefaults, sizeof(*defaults), GFP_KERNEL);
+	if (!defaults)
+		return -ENOMEM;
+
+	ret = sdca_regmap_populate_constants(dev, drv->function, defaults);
+	if (ret < 0)
+		return ret;
+
+	regcache_sort_defaults(defaults, ndefaults);
+
+	auxiliary_set_drvdata(auxdev, drv);
+
+	config->reg_defaults = defaults;
+	config->num_reg_defaults = ndefaults;
+	config->lock_arg = &core->regmap_lock;
+
+	if (drv->function->busy_max_delay) {
+		mbq_config->timeout_us = drv->function->busy_max_delay;
+		mbq_config->retry_us = umax(drv->function->busy_max_delay / 10,
+					    mbq_config->retry_us);
+	}
+
+	drv->regmap = devm_regmap_init_sdw_mbq_cfg(dev, core->sdw, config, mbq_config);
+	if (IS_ERR(drv->regmap))
+		return dev_err_probe(dev, PTR_ERR(drv->regmap),
+				     "failed to create regmap");
+
+	ret = sdca_asoc_populate_component(dev, drv->function, cmp_drv,
+					   &dais, &num_dais,
+					   &class_function_sdw_ops);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 200);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = class_function_boot(drv);
+	if (ret)
+		return ret;
+
+	ret = devm_snd_soc_register_component(dev, cmp_drv, dais, num_dais);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register component\n");
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+}
+
+static int class_function_codec_runtime_suspend(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	/*
+	 * Whilst the driver doesn't power the chip down here, going into
+	 * runtime suspend means the driver can't be sure the bus won't
+	 * power down which would prevent communication with the device.
+	 */
+	regcache_cache_only(drv->regmap, true);
+
+	return 0;
+}
+
+static int class_function_codec_runtime_resume(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+	int ret;
+
+	regcache_mark_dirty(drv->regmap);
+	regcache_cache_only(drv->regmap, false);
+
+	ret = regcache_sync(drv->regmap);
+	if (ret) {
+		dev_err(drv->dev, "failed to restore register cache: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	regcache_cache_only(drv->regmap, true);
+
+	return ret;
+}
+
+static const struct dev_pm_ops class_function_pm_ops = {
+	RUNTIME_PM_OPS(class_function_codec_runtime_suspend,
+		       class_function_codec_runtime_resume, NULL)
+};
+
+static const struct auxiliary_device_id class_function_id_table[] = {
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SMART_AMP_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_SMART_AMP,
+	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SMART_MIC_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_SMART_MIC,
+	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_UAJ_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_UAJ,
+	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_HID_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_HID,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, class_function_id_table);
+
+static struct auxiliary_driver class_function_drv = {
+	.driver = {
+		.name		= "sdca_function",
+		.pm		= pm_ptr(&class_function_pm_ops),
+	},
+
+	.probe		= class_function_probe,
+	.id_table	= class_function_id_table
+};
+module_auxiliary_driver(class_function_drv);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SDCA Class Function Driver");
+MODULE_IMPORT_NS("SND_SOC_SDCA");
-- 
2.47.3

