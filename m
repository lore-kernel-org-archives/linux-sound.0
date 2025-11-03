Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CAD3168F8
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 15:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182558; cv=fail; b=YzAZWes5gBmlBU/EFPqS8SsPT4VC4BtJhKBWS3Yg+KgRRgkVDE4xfje7UI0UavKzxWBOPZVTGV4Xdek2VNID7WZSky5CHTqmef0D65OyCJZoEQIsbf3aNt89/WKdU5MyqOTsgz0AnLf3Agb4DIosnlKOedBSj/QBCOmeHoFY8Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182558; c=relaxed/simple;
	bh=8TzFrKVvL+tPCRhY5DBxdvhGdVJqM1LNLLLk4RgyasQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KavGpVnyXTJHOh1dM0JHTuoIl0l5vInZROvEZGC80vpEFcXLy+/L71N4dKAeUykzoodazjXnneXZGD8e4Xnz4Xb1mfu5+egPMNaIHvkTIuuwzxVG37u2Gv4dOHnMnhqa5OgF704k67VcoiLZgeCH+Ga5zIu9/x4+Tc7UIkoJXpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DvRHszEM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yE4dcrDG; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DvRHszEM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yE4dcrDG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A35tnWV2534295;
	Mon, 3 Nov 2025 09:08:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=v0BAcMmdBOyqtp2/BBsCPGHfE1VhJtEYdh46mYP8o6I=; b=
	DvRHszEMRbDMOwP9g7ooMccmyIXamj0u3HLv1FQbLRsxeHqxL2sTG7SW7kUgVLBq
	TaSFR88AlMoBB8mL7hxHVyzSLciW3xy0cOk4btlzlu6dKoAN8oSVTCWlkZ8IAYmT
	/Yql1dW95MvnUqVcmK89fY5h/Dp4LRIjbsrZWNgGSTf04DXRtcowBxNTXMXYzKh7
	KFB4Y4HLRm1bh14jiPmX1wa7Bll9kZbiYThmz7pJ/FF/BicliYhYq3NtrdmU3bY4
	F6+WV+5uWZehKLBJc97GnHEBIBalK8HCxH7rEEx23owto3kMwUNSiWL3pHcay+OM
	CpPGwEb/KHdVTFlwhbDwSA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020121.outbound.protection.outlook.com [52.101.46.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a5fkwt6a1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:08:28 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qe19RUQCohO3OBUMcTi3/5loxSQbhnYpcNWOIgIlpFBRF1Q4+JQtbkyvT+98Saph7eXd3NrHErmOHctqPT5aQN3pYahpPD7VSVb/hlQNeywpZT18/YLv2Nx5BxCgsVZJEJmhWT67bpoiMldxcwF5M/oT8ev1YcTtXdJfQZhRNbx7F0dqYyRRJbZuYsVNyuOjxqmssxG+2L0vfWOQffZEDsyCaT79+lzswAs5J1n0pjbY4pjWwOTUb+0jhTo4I9rh7n/JEYuqHOMUGlT8EnPhGzsJNWSyg9TR7xuG2LzhYHoQ+SvfW9Vq0rKXEeYgxIRQtT4YeFWD7fHAgDRwnC1uQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0BAcMmdBOyqtp2/BBsCPGHfE1VhJtEYdh46mYP8o6I=;
 b=uwKOun2U030+OAsaZkBVaxodm6NqM/h/Gm6DmvZmsJQGjeIGZkrKJdXntBpINN5yl+m6TuL33wbEERqD2kXzRSYbJiu0O/WU29Kw89asaaq7PJcJrb8UnjcoeDHNWfERpmKe+rvlWabpatrnSeQiR6FozzY1ujPZjgFOtYV+vF4HkMjSItTsKYwBIo0OfEA/NcnIi2QV+MHaamEibTCc7wUDE7M0c6w5qRhbPnTVtsebNmtulhVkUF7icZjng54FOz441+izL+yLJiNKaFBnMzr/LBFQ+xnWklW7VVFZbTb4ki5FKmL4ZIbPPXOy9AihRcRoziIyFI24XtgpHMj4JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0BAcMmdBOyqtp2/BBsCPGHfE1VhJtEYdh46mYP8o6I=;
 b=yE4dcrDGhW6Mis+9xwTDFihdXT6pGZEZUrnolZL5aK5GJfVwPIMfEwMvJj67NbPBk6s+dKIyLtOjKNgxsP0OCjsv8Y8JZ9Hon92r+1b+QOzrj4ajWaLMwhcfz09KfC0Ss0yd8P+1R217CyVPfqRQiDKAY0HVQ/3dILwSBrhz6B0=
Received: from BN9PR03CA0870.namprd03.prod.outlook.com (2603:10b6:408:13d::35)
 by LV8PR19MB8270.namprd19.prod.outlook.com (2603:10b6:408:186::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:08:23 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:13d:cafe::ca) by BN9PR03CA0870.outlook.office365.com
 (2603:10b6:408:13d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 15:08:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Mon, 3 Nov 2025 15:08:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5D15840657E;
	Mon,  3 Nov 2025 15:08:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CBD32820257;
	Mon,  3 Nov 2025 15:08:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 12/13] ASoC: SDCA: Add basic SDCA class driver
Date: Mon,  3 Nov 2025 15:08:07 +0000
Message-ID: <20251103150808.4015208-13-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|LV8PR19MB8270:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 97e222d1-4a17-4ff8-d92c-08de1aead425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nBFOniYj1V1Lj7Likt+ClzwGP7yKuqJDAy78If5lLEkmaxjUfjVpv6oNpLKe?=
 =?us-ascii?Q?0jCrNnUBiLH+7KeJoDeT+3e8cFdudowbAWY+r3P38z1czmcbteYpaVuBufFY?=
 =?us-ascii?Q?cGVbfvfZZ0774WDXv14PUx8lBRBVDH2IOdUPmmrlP3yVhjkyZEMVOqRmRBur?=
 =?us-ascii?Q?wPFA7fx0Y+7+/TGlSOVXLZYRD1MPwfShydv+ufyoeR95C0afc1GCQFdVBxTv?=
 =?us-ascii?Q?EdP4DYJnhFsO08lOFgDczAyGcfFFI16IxBzrgZ3xREI6WN91KPZaOpHTtx5y?=
 =?us-ascii?Q?OK7/5VxIVRYwS8bacmDp5kq7RVQRgyc3A5vAZHCk3RkcUv5dgdUAUutBsKgL?=
 =?us-ascii?Q?CuDuPe8CLUYYUOBcUDuSGR04hyH3KXGtlvG193vux3ncljnh0h3bq6tZ4dmh?=
 =?us-ascii?Q?4yhOm+W8eIsVsbwJ8uEgN2Em8Dzzi/PDXJF9jiQEFOfOrnAKq1PheAbLfrpc?=
 =?us-ascii?Q?IUcoj0e3FOuXICvxwnhr1j2kjx1Tmz++1s1m65Jd9IzwleQyz7b22uwXHCHs?=
 =?us-ascii?Q?9la/Sq3tzlR5f179JfAanQajD96N0kFhYe/LmpWQH/qFKVrihOEjoduKrqux?=
 =?us-ascii?Q?8RfrWjGjzY5xyDsN1aJmSn1Sz/Hz/OW5P+zr3yk24TMGQJg9Ljvun1D0vxsd?=
 =?us-ascii?Q?3SPCaQnSNLU9BBkV29MAklF/XT5oauy6N9PeUL5i4/3GLCOvUcco0rqBfzuk?=
 =?us-ascii?Q?t8orXc8ChDAXmyquckKxIbKtMOvTy01AbSsrQC/aJGqxwd2R+HoO9thH1yNN?=
 =?us-ascii?Q?R5qbCxcA1w7ZKC/OYmKtlsRTMmbrJ0E4a80oweou/iYBOCjRZs3BybS3po1F?=
 =?us-ascii?Q?qkafuL1zW7MPEOsKxrna8GR6Jn0zcemm4dT/K9ezJ5bbVjRlFuuS69zNm8js?=
 =?us-ascii?Q?5pgPO0XApGjCCFs2WIDBtMD9GEHezIp4iLroCROGNvhI2YtQ+jLdwExwAfvr?=
 =?us-ascii?Q?yAZ5pHW4H5l1FpxYUZ6E6AKyMsJX/dBUjdiK0qd7AXSw+8UcKE69tVVe9V3V?=
 =?us-ascii?Q?mB60NEJHSHFBRbO+FGWhX0V3mJ3ALZndWbTWOGEKwBH96N7SEgkhB5eTxFWd?=
 =?us-ascii?Q?DkczEmlc+ZqANXfe04TMqn8Gx3pFlHIbnvUXHkY4mL84nuw6f8zYLNvPUli9?=
 =?us-ascii?Q?DSs5Tcc+l+BgK5PRp5EMvLfJnckpnHdUh2OJHylNCklP3FBLzMSQIzvXslpX?=
 =?us-ascii?Q?Vc+Geg8Y4XRq+KXAudo05Sv7RJ0SUYM08/QefLNCHrfUdR3q8R63OTzV8gFh?=
 =?us-ascii?Q?inFoL+wu6qqkPZtAODnWYHWvxnMtcOSRmHikkMaCWkTyfngChJ2CqDcvVRXl?=
 =?us-ascii?Q?j5oQj1c+QT7+gTQhVbAiQThqrJJWWn07cWU61YQTKSAiGEmxTNSn30TyRsR0?=
 =?us-ascii?Q?nFpZhDrlYrT8Zp4xaS7dpnLRluf8zoEcPSCXMS5nrkhdnjOOOirdF882AoFc?=
 =?us-ascii?Q?nzE4RXZ2JYyNfPYwBSBbl2BAjZVuI0ciJ1/UNrN+1FZ2QerOlKPjGwQOpHqB?=
 =?us-ascii?Q?lbySFOlbPm2+X4o0w+JDbaM5lCu0PrCGYJVph49/qyw9gP2M/HF/PtyI5hnq?=
 =?us-ascii?Q?KzsMLcNVkm9AlM6g6QM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:08:21.4973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e222d1-4a17-4ff8-d92c-08de1aead425
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8270
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=6908c56c cx=c_pps
 a=pjPKNKgC2VgaEdt9hcwoBQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8
 a=TZXF__h9C0KKyec-8QIA:9 a=HE_01F9_QflCRFonrIQr:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 8SwH1wyp9kSOnkA1hneWTSyE7UyNZWJB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNyBTYWx0ZWRfX/TKMnf63rfcy
 J7VHzvOWsDqQ5aARtgZ7U9/hA/aKpBYZl9PH3VwcaXeuDKsbCw0PVsmprL4P4wNy5sKzBQVAH59
 81rV8dF1Nz0WI+4k7eBn8NFy6rZwTEjzZUMaooNoBZ6eObgGpDzIkND0MS14VS5kyE+jT0AuxN1
 aZecUc+e7rkjpIpZM2Vq3bBoGsu2DnI6j/skj+mUKC1I1BRtDpI4T4jQzukdmUHwCxDkgBrK1ro
 5r+pDEsqkTf5YGZUI7Zk4wzcUGNH1A5BFCKFwvPwHBxpW7AfP5MxTlfCoc7bHTLywcW/XdK/yvG
 xMpIJ7dmp6tWz1djbwoHoNSqN7d3CVKZ3/6izPVlxiy7P1JEXUYy0zwoP12P7RUoYh/PIxEh66u
 g1/zxqYgTw8imnjjWuiuCM2q0qTQGA==
X-Proofpoint-GUID: 8SwH1wyp9kSOnkA1hneWTSyE7UyNZWJB
X-Proofpoint-Spam-Reason: safe

Add a device level driver as the entry point for the class driver.
Additional auxiliary drivers will be registered to support each function
within the device. This driver will register those function drivers and
provide the device level functionality, such as monitoring bus
attach/detach, the device level register map, and the root for the IRQ
handling.

Co-developed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Update some info prints to dbg prints.

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
index e7f36d668f159..56e3ff8448762 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -37,4 +37,14 @@ config SND_SOC_SDCA_FDL
 config SND_SOC_SDCA_OPTIONAL
 	def_tristate SND_SOC_SDCA || !SND_SOC_SDCA
 
+config SND_SOC_SDCA_CLASS
+	tristate "SDCA Class Driver"
+	select SND_SOC_SDCA
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

