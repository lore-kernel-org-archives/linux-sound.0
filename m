Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3FA267B07
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 13:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807217; cv=fail; b=W3NPOkjhBzZhAcA0Qd404sL++h4ivRwvmv5icvzZMjBCCRzM3zF0rulsadx23DCHcJNAFPaLFDvCq8yIlLPTdIJaDVd/Dy8siHnRc6gjSs/Y8FlJNC2pn7skKxzHXoASILkhmJ65V6yMW5BU5VaV2waRG5IerlVzuVFcoyqVX50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807217; c=relaxed/simple;
	bh=cxVIq98FyEbJybR/GuMf+n3hJ3gORtfIq1RuosKTSow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LQCTMwQDXeq3oIwwzA4gSt9QqA0EU8yJVQKoZhyjxjWY5YMFRq3dTTbMY8/4ZNl3l8+6aoZ2kjTvRROQ7kwlQpGtOasj0EH6t6z1NxXdw2ykR8IoQJN3dlEYidNgqyGS3ucQKPDiPrl/K+5tZEKktrRD1TFVQRzEYw3DpzPrcDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O4HEQTI7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GHfB9CDc; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O4HEQTI7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GHfB9CDc"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P1vHDj1785190;
	Thu, 25 Sep 2025 08:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=jOYV0RnLWV6MsH9a/EFaKrsya8o6uCwbM+rpddMXN90=; b=
	O4HEQTI7o/t4DF5dDucast3B10ck6nhDvNaMWVne7cS3gDbBXdBseiC+fjV31kT2
	vSuHs/IhoB15Nz0dy+tpniVaP9s7xmmiB/GPckleZLdlrHJshrDa+Dlty/Px+Zos
	cLvrt163bHznIQk00xBLoqVgRSEIY2Lmrcmzs3WTYx2klncC13hF1bT2tEIDTWYU
	bOvma7JkKI9Ws/nEX1fiXz7MCO9JrVWBLe3N8O9ss1OtMbNrMG43LqyMjL2QwCmw
	hnXOvDHKej3QVagncj6ywih3rwo6XtrGj6Bs8GwXXJkR7cBjvPI46Chtcy2HXyeG
	YmZpPuhUKYJXIVeRUvYQ8w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020127.outbound.protection.outlook.com [52.101.85.127])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49cvharn6d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 08:33:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7wH3TvoH8QRZS2uDmDYqRZRLAhiRzXoKJM7//Q75WrHLq910WvX9iC7QpIaEOOBo9iCQXiObijgfbjtMKH+unKAuiyIxc0A34PqtJSlOqtrf/Nfy0MvWhFyJ7RSmZF9gBPXohP9zyz7WzjwZTWS4E4RKbMaW9Pm6k05cB7tAEH/OG9dnTfF878spUQ2d6wOfEWMOo5qFPjl4JHWmkn9DK2B8aIH+tZxyAsDuZ+B+7ZZWZwsiRKuPgc1NqrnZsJM01Sh427lOryxhWlkoDMmXzk8TE3EtyWTUOSHm6oEgZ6lFuzxdL9yqu/WoOqeUiGDUxgWvsXxMAj+pjUT/9sGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOYV0RnLWV6MsH9a/EFaKrsya8o6uCwbM+rpddMXN90=;
 b=vD0461W07x6JfJnt8BxiOPTg0Es5Spr7Zp2It93Ov8Q5l/2twMixLX8d1F5u3xPuOCG7tpuaX8A9W5ThAfcpKCJBnqRBXChicp/JFnlO+v8sWNzzsH1PZ+DCLTDbUHNwgtgsMmrXAEuFzcKiFtzjTqUeoAmJfnGA3A9rI0MP4peK355hM35Edc0AEdNLDj0Cda2tmIYopvF5KiHOoV60waLG6tcksK/So5p62Bxl1IX4H/s39FNuXtWFiybqNNaoT+TC6161I641HaZf1Ur1B+af0YZzEPngg03zGNPDIj03T5SZCEO20FTowOuAo3SL8DPDwt3rJLxDYHCKMLkHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOYV0RnLWV6MsH9a/EFaKrsya8o6uCwbM+rpddMXN90=;
 b=GHfB9CDcXj58ZITSlluomjtfPOxqDjTzu/lscQ/gbCybtVoGKLKqfxnO9B4UskswnAixYuGvPZvcJYfhu1P73G4zTS8mYkFjEZhRauob2huETQ+4ied/uLgFlUXS68xXcU3EDJNo383XU3kDBjHXv6Xp9CJE9TRMDUuTs/xfnCE=
Received: from BLAPR03CA0153.namprd03.prod.outlook.com (2603:10b6:208:32f::19)
 by MN0PR19MB5969.namprd19.prod.outlook.com (2603:10b6:208:37d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 13:33:13 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:32f:cafe::f3) by BLAPR03CA0153.outlook.office365.com
 (2603:10b6:208:32f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Thu,
 25 Sep 2025 13:33:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 13:33:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CF730406553;
	Thu, 25 Sep 2025 13:33:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B0B1B820257;
	Thu, 25 Sep 2025 13:33:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/4] ASoC: SDCA: Add basic SDCA class driver
Date: Thu, 25 Sep 2025 14:33:05 +0100
Message-ID: <20250925133306.502514-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|MN0PR19MB5969:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0b7d8b3f-c559-4a65-8588-08ddfc3812c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ffpp2m7IJsknIjfqwd+tGK/jXJFWBm2/bq8TWUrEcGc6wQekpl0ovsoBj2et?=
 =?us-ascii?Q?SkS9UdHODpvIwpHJjLbpmijY1Qpg9BytmIm/s0/j7O+C4E7I41wAsww7avuj?=
 =?us-ascii?Q?gsL7LllvBkc/q78Kl9uPtYe2jAy89OdflUFVU8e1zRPLjyoDfwjrxc39aja3?=
 =?us-ascii?Q?Tgcauz/m1CyEggMPjw8eo5Qh6xAUbXG9LBgHNIzs6ksnQHqWSLBwMxW3P6Gz?=
 =?us-ascii?Q?hJztiOMrnrDARTA+KaOSSnXSHS94pPTnRN1HASR/hafP9BlU8fW2GCQJlwQW?=
 =?us-ascii?Q?aM8OxD/kbis+wCInQc3XCAVl+2HouKK+HZ7WfFUVqXV2v9Kz+23CoVnwpppj?=
 =?us-ascii?Q?PG6I0Z14zq1kbN+11lU4OqkCk37FC6gKrd1pgl0+yzClmxuO68X0kG8Mfi5g?=
 =?us-ascii?Q?mBECmELrZSlQ6hjy80A4pmmYrMNA0WKNG7TbgFmjwrtE9H77jx2PxrtTDuTM?=
 =?us-ascii?Q?MS8J2hlEA1wI5dS7szUBJpQNLWCKXRTa1OkoBUKmA4Rw7/6qJPgQP0SKp9vz?=
 =?us-ascii?Q?MBqgkDNaVbdSxtQ01ndao8afk3ABpiEtMMgVRlOblNEG+v/5LPHYNBsfACtY?=
 =?us-ascii?Q?hpUV6bfkwACRKsI9GI8HG0ae49R/mU/S/mUk3F6ydS0v4GauwS9JHM6Ws8lV?=
 =?us-ascii?Q?Jj0qUSAuHvB+RiUZ83Z2Qt9buQGnc0+6ivaT559mSCgckZZ+H6dwxXpuV3z/?=
 =?us-ascii?Q?tlKzHHcdqX3VoQFMp33J0C/bhem7zagL51uoFQ52MrG0cELI2zUZXRs9ZoPD?=
 =?us-ascii?Q?bCVDkUl9ZF83/Vcq7VbCSMzrjuZ9T57LcTuabH0xDLxHxRw4jKekIKDqFGo1?=
 =?us-ascii?Q?VjSeMxz/1mDHYIFSTCpalf3MDjRnwkqpEPYQIpOKB5zcryAsaHbJJOxsj55F?=
 =?us-ascii?Q?B5j7nCzHSNk+20RK6IeATObpRsHnWY8IHnz6VkUJ04r0oh1bZ1MY49O53SdD?=
 =?us-ascii?Q?bOK0cUrkcRJyZScqqePLWm2S3pK3X5AUzHXWMlGVAxt7tSFUeWo2T/53sjGd?=
 =?us-ascii?Q?3QnQyN3kXxmkP4+DkCpVrgRmx8ief2mzI2flWIYJCNAWbWnjfji+TEJewtKx?=
 =?us-ascii?Q?Jnp6vAM76JakfnliS4S88G8zUegJ9V5WrDVFNCvRrZA819C7F5uefwgy4hby?=
 =?us-ascii?Q?qepPHcWmtOaYbv2ZDaPfDRptIKFWBrYbNnBv2U0feyRsXVRM04nzmOITzoFd?=
 =?us-ascii?Q?fEXfr45VJy8mQ9qeLQ3NJkeGkMLaVTkeDzcueS5s1opp1MKok87nbHvVD1Gc?=
 =?us-ascii?Q?FpPHK5nD/Q2oKe9sZjyQ1AmUspYKJ3qFqbqKX+ySKFvB9Csa0kT5UhSesEYN?=
 =?us-ascii?Q?oRzlnWS8uwlm7VZTrWR+pW7o+XhHQeyV83R8cq/UHTyoivvtEBiSwupwyk6/?=
 =?us-ascii?Q?VI9pnCPWIGg14QqV/CgnkzIF+VvNBUGTgngKOr+oNQSyxIz4VKPLZkfrfmp8?=
 =?us-ascii?Q?6kmRIWYqOwEaCYkm0o2p6PgV5dgLuS6mJ3jQLaADzqU5s8xD5b6Haw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 13:33:11.7643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7d8b3f-c559-4a65-8588-08ddfc3812c4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB5969
X-Proofpoint-GUID: UWzUEtuxkMhJK3-R3Y8JtSV55CbpAHW-
X-Proofpoint-ORIG-GUID: UWzUEtuxkMhJK3-R3Y8JtSV55CbpAHW-
X-Authority-Analysis: v=2.4 cv=dL+mmPZb c=1 sm=1 tr=0 ts=68d544a0 cx=c_pps
 a=PGzkYtW+Y2OQBedXY5L5Qw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8
 a=KKJJS_gUGQNFtUsCjUAA:9 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEyNiBTYWx0ZWRfXycuZ8+5qwFaT
 G/UvwsQpnSeKMb2px2j2W6kQj+dXimKdx4REQ8tvPcHSdsaUswVuLAt/4c6iwJbwJw5xnAu1TMW
 nsWd2dBC7cD28+vvYzM3oHWNvEUElet4/rtO31Da2BiU3u5K5E0RSW/bdJkZpnL+eg1z0Vb1nFA
 NyeTjaCEvVOtEEyEQZ6Vtr1iebwTSxBncjjp+BppoIUBL1pZFX/CAbPM88ZMQ04UL3pYNTfQp4/
 mi+pHl9hLUA00kP7MwEgeIOau/wjvClKFbaD6/op1psorT10XLYV5Fn/442z6uixaRh5nXpIsNO
 8NkxitHhSR5oGPtWjqxLHHU/P4xFX8F6+l9mTzlBma6FZYK5/oLwZK9WgbXG8U=
X-Proofpoint-Spam-Reason: safe

Add basic driver to support core of the class driver.

Co-developed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
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
index 0000000000000..16e26574bc254
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
+		dev_info(drv->dev, "device attach\n");
+
+		drv->attached = true;
+
+		complete(&drv->device_attach);
+		break;
+	case SDW_SLAVE_UNATTACHED:
+		dev_info(drv->dev, "device detach\n");
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

