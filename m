Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE92A3126A9
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429491; cv=fail; b=lpYEjZe/5DLvbX2dT8pS8F3ioqb9cPTxXXVnNXZyF9qN3HR1TcFAsWCcanNygqmmR7PzvvebOTFR4DBORzip1uiguO/jB3EFSUHmfoDgrrQipFH5dm8tKteGLaXRjYRT7UDyPwhoarQDclkTX4Tn3JqcffVJk/AOeYCMaAkDjtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429491; c=relaxed/simple;
	bh=qOb2KlBvEtxZ+S9HOJDaVAS3arIbXNPLOwedsWm7/GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UkCAJscUy2pZEypJ8G1l3zEYKDX9hmy/YxHkeUpfXD737S36J2mcgVg45vR4m0nsHpduRs1tq5lADrEI7V9bv9HzhIvn23MhGoHoKr700nATIIMwBwfed5Thc/gL7M1/mOVpfs9K4u3Y0C0kKAwFiRGDn44OjkcpBCF/L/G+3jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LQPRFmkY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EobHhviW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LQPRFmkY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EobHhviW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A65KBnR1440822;
	Thu, 6 Nov 2025 05:44:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=LonVTb2vUDmWMuoYBeW2VogW822fkJ94HOFRrL5DmAk=; b=
	LQPRFmkYVYt6ax5zD3pmBt9uVg52F1Th/6X2s0Kd4Jsg/oEc2V+CW1aKOrRLk3FD
	piO/JFJQHcu8bgeKO8K1K65Iw6zMUwIHirfM9GPU4xmn3ZZIQmMoXmAhAK7ksJzF
	OGsP/TEGdv4swhiov8pxreYyaxqGT69dvQ7XYD0HgI19kG1+2414vC23VbYv9tVO
	PqBiLtENvha0eBQ1CznlwuY3dsgDK4tRxU7NdNcEMNfgfZGF/X6SO2AW7KAfSh3z
	8e85zELVphK1VCBDTDK1+hXux4ZOuy/oxxirdoTIsEiJ7cAOmQbAFo57XU3MCfR3
	jOGMRuAIXivRqq5wwAZt5g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021090.outbound.protection.outlook.com [40.93.194.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a783wun4p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:44:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJJWsbkbw0NDYZ+FCk18qDorAdFLXdOD7/Du8uzYfT7l3PekHHzCI2LE//Mk/rHpUtAKpdmcZy+aWubWy8DACRrC9qfi+DArGq5J3Owm4ZyiWsmp7eWzEO43rnIlgZLOzvMO/RKElLJIzPiky8GQmH4z19gg5Ziws7vT1PwJlIXDHSqHgzfNZTgiXw4iCkGeHaySqGYLtUckaV0kbkRH6EnO8nn5apMIg5ZHuIZ/Qu1rwRDCgpS2U/MLPRJvtQ+QVSYuJOGbhjHcqWCUqgv/AgpqT6wnoT37UAPr7/ZODUF8i7gzoWTtYm3Bjcre5y/vBMVnk0r8CJ01jxJFj9bGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LonVTb2vUDmWMuoYBeW2VogW822fkJ94HOFRrL5DmAk=;
 b=IxWneFgw9XqXttWE7CBH16hNZi9eWUAfG4wzU9olTNwl5514as7rncsk/Glhk+00acnJ7yxEOawm9LimKRqp+K/C/CNs0HNneWZB9+9nJHQ2439adejP1I5vhIuH6PCiCwHr9TNI1HgtiWZ7M7h3oOTCB55/8naETwH8ny1d9AcOM425wBof50rmaYK13TMdcV1brG7IVpFNrvyqveCi0QoBYZwH2b20eh7gwrgh/f3wRrLmUge8I8Vo9n2m3Y6neL4WIlXkmWmFvgqTjgIQIJDxCdOIpGBq9vB6i5IK+fH/XIFmGlJNSx4Nee+4d80kF0l50dGtqFJzy9ffetwAlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LonVTb2vUDmWMuoYBeW2VogW822fkJ94HOFRrL5DmAk=;
 b=EobHhviWbMQz6kY5W0yBOtOI2HrtpvZSNVtKPwqwn8t3KkMSVfxR0zY5lnjNz4a7B6GhafJ/I4n5I7rPXbZq6m1AYyNKv+khCob5TILpJ8/gbpFzEzFGzqL6ENuxi8hizSOa284R7nLvXJoUOqOxnlit9El3IA0m+ZitV7nBgb4=
Received: from CH2PR04CA0024.namprd04.prod.outlook.com (2603:10b6:610:52::34)
 by IA3PR19MB8735.namprd19.prod.outlook.com (2603:10b6:208:51b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 11:44:30 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::2e) by CH2PR04CA0024.outlook.office365.com
 (2603:10b6:610:52::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 11:44:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 11:44:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1EB1E40655F;
	Thu,  6 Nov 2025 11:44:26 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EAC3582254D;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 12/13] ASoC: SDCA: Add basic SDCA class driver
Date: Thu,  6 Nov 2025 11:44:21 +0000
Message-ID: <20251106114422.906370-13-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
References: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|IA3PR19MB8735:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 58beb581-8cff-43e6-0e93-08de1d29d8b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G5BSoSPDG6aNMGhpyQZZdVAvAq79K7zjZOScl3ZeEQ+6NBbBbfTgqKV62ZQo?=
 =?us-ascii?Q?ESKVraSSsRobADmjUTYRgLk++c4LfpHf3/bDj6a7FSU+wdiRCjebeg/1TpF7?=
 =?us-ascii?Q?OV4CECFd94frajvVFibHbSXV/gUAYujjVciBZpPJZfl099puGCrJznN/Rn3t?=
 =?us-ascii?Q?tJep/IA0qhHUYN2VtD6elo0D+vuF/moxyJ9Xu0HIIH27MRHdXzoP6ELptIOu?=
 =?us-ascii?Q?7PBKqy4rc4WnLw9W1tGn1xDq0SLdYo08g+jAnRr0kyZYKhkuBGuc6NCUtJBn?=
 =?us-ascii?Q?jXB6QIGQ9teUNn5C7UjgmjXhPmvCy+0/Z1G8pNGpVDHWMXGGk0rAybf3foj7?=
 =?us-ascii?Q?7ybg0eXZ7Z2D/XTde/AKVmZkNe/aVPEthI75/5fiN50RhjnYlVn6fjvu1Jv5?=
 =?us-ascii?Q?U1awN4snB5SWGKr8OzPceU+zQR521mefGwMpAXTCNYQKGCwu9bLHmXanKqH8?=
 =?us-ascii?Q?PH7CU6mQaFV8kp0qDUzc398+Rs/hiFtK5tsAuLZmhp4FKZAawRh3SMYax71W?=
 =?us-ascii?Q?pK9BP4dl3bzZ7CGGAtAZ95ga2ZdROGUkoLSKNi7gcg5V2StSwtX6sjCYORPb?=
 =?us-ascii?Q?F5OEE2Aoov1l93Y9YgcyMn7TPZUveI9sNnssjq5rRnkiQTXuqQgd1558VFd1?=
 =?us-ascii?Q?7jYQ12waRAp1EWhE3iWXVrryeigKf62phVj3rDaBsZUS5t/LcUKITecdVcu3?=
 =?us-ascii?Q?2wtg73qdxGV5rJ5G47lOFFFazXSi4aIwi7u5zaUOpBrw+vYRvu4rAgwZiGc/?=
 =?us-ascii?Q?c0iaPt0j3ZSu4KRYJwT8g+mr82UGDKU/Ig6B02Sq0PgN3JkSvuiYKWidBTws?=
 =?us-ascii?Q?M65BK5U2y4NWcURhdmmSW5QXRBcvcwniViYv+B8RFDUFtkr68vrwh9QbhC9b?=
 =?us-ascii?Q?fkTUegzxHufOlKpFfn+tDgEjFsSV4/snn2JlaJSu3QJm/2Ss/XsnyDbK+fSv?=
 =?us-ascii?Q?0SOiRta9PK0drKIkGpHpbUaP2WEn+mEhpvlsO/V9JeZc/IBZdvfvaxa2vwVu?=
 =?us-ascii?Q?58Vm26geq3T21rl8dtFwaYbZaysNgLQv0sxdejvJK9tpr+BZEEisdxW1j+B8?=
 =?us-ascii?Q?Qa0k0v4/WJW6d0GbqL7lRbHckjbj+GPB8Wr2SsFAKjp5nDQl5sGJ9jPd1PZC?=
 =?us-ascii?Q?lGe7TKn+tMwDh4YsH3+ySlhEi86GCXELbAJBlXAtu7QLFUg3EuZy5xxRnY13?=
 =?us-ascii?Q?9IMVwlWJIEatpjX1KpMKvef6XuEmf/7Z1tXQkMfnQPa2M/GeiRQGXtGVTFg7?=
 =?us-ascii?Q?i4oZYgHlwb8EbGJwi2ESph2cw3aBYvlLW6suI7UI060ho3JMd9PVI4ZqOgDo?=
 =?us-ascii?Q?QDQvD3C9NBWwK9zqTjCp5tskR3KK354xo2Qx5o3sNdrjaexMrVo0qZnbXJQO?=
 =?us-ascii?Q?2OhnXkY3icWM4YXEuQz+t4wo4qks6OP8Gj2PRlqEHVYtdTkcD5jZFKNkEJNm?=
 =?us-ascii?Q?PvpATIUhfswF5DCd5IJwWkD03RP3yfumEO77qCsBrKSqXCU6UU/l5HP9noMS?=
 =?us-ascii?Q?NNuUu8BS70x8rupbhYwr/Q8XdmQqQ9AxYAI0NIJsv5km2RZ4x8eB+SjxzYcc?=
 =?us-ascii?Q?dPm/RR8BuW95DTFMsIs=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:44:29.7361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58beb581-8cff-43e6-0e93-08de1d29d8b4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB8735
X-Proofpoint-GUID: Z49QDixIKC4tT7Jc7GglD-oayde3ltHg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfX+53oCkkVgvnV
 2E/FRioeUuepgHlNORNhuECglCkkTk0LgUJ8aaMPlOIUWj5kD1zElArpd6scJNwukI9ACSJUUlC
 hbeF6RFv2aR8yXqsKrhxZHoFwVs0g3VKsszD5se0DrB47jX2Tu4+sI3fWiUXE6alwSZHRrhHnMY
 QlmlKGvjsizLSOLtVe4FmadRmWcXLW7ewuEzPqUW5IVyRGq/GMl8V1ribi65QM1auuRlZa/r9OI
 YD/PxT3GpyRyluKY1cLGEhfihzEvwJRgEk1YVmi/sZWtD/R/eHwp6AohT3QnZtF3gWVenwdKqnJ
 xlyhfi4475kGm2Rhnv1nibp+JwlJNTcTiKsVASYlgXZEc80Bmm/gJlB4NohCrgjSIXqdY94+QVJ
 6HxxM/pJGfv5NXdwkAtKuI1MCvPk4g==
X-Proofpoint-ORIG-GUID: Z49QDixIKC4tT7Jc7GglD-oayde3ltHg
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=690c8a23 cx=c_pps
 a=1SMuVRNdJx3IktO2ty4UNg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8
 a=TZXF__h9C0KKyec-8QIA:9 a=HE_01F9_QflCRFonrIQr:22 a=cPQSjfK2_nFv0Q5t_7PE:22
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

No changes since v2.

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

