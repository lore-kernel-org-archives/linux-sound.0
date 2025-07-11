Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3BC27C15A
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228410; cv=fail; b=Rn/lmeF8ntnZjg666E6yUZH1EsELo4oNh5cdzhgEvYooRIjEhkT/UDwf3ors7+ZAHPdMqTnDj2pH7iZkuqB5wDoEQ9iwitOHTi6xESbIhORMLy+YGcc0aUH2lHSGG6jH62eNX+heLfmmNmw/nSM9Lr1JoJxRae7Jnwy2xab/Nxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228410; c=relaxed/simple;
	bh=2EeYCEdHVb8oOa/uhhE6vX9GpdgblNvuBSfRnNelY/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EKN+Y0oe027V3F6JyWd9dKWZdaoiXIeL7OkpAOz/mc8ofuvzBDe7uJn9C2+/vcPSkDTpn5k68BMDWawzJKFQcQf1JR7m0NizAsdGWpbSzsKxb69FXva40ZYxINJrxn4P0aqdouKvn/W9Ck39VFAwwkeZGzWUi6LVSiaVTFWLRic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=njAI1T+D; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=r/3Yqjxu; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="njAI1T+D";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="r/3Yqjxu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B50W5I029797;
	Fri, 11 Jul 2025 05:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=vjXHd9xRBfOoVCkje6MIliwQFLto8n0yIlumV2v5T/M=; b=
	njAI1T+DD8VoWrcysz0EcYzBJpEyCx0cggsfcrmr8yjB8woiWsCYGjEJJD7orK26
	E/VVocPidltzeKllzICXOtMp1Dq5lK2R7DlfUNiI6/M6L6AkiQlWaK3rpV+1rzLX
	ChFgHGRKvEOlq5mDqlAnVdgJwVOUC4HtXc4EA5LEyW6M/ZjtFpa88uZKPTqyGA3R
	XXCdeJh7RVwDL4wjXStzJ3TKqAlER+/Byb2Qu1/BP7PHn1isM4j52bqJWDowiujX
	OcGO3pl1KXgiaHtunyh2sLCxRjn55na0nmFz7KLYP+i7xn7G28IBmT9sGNAdJtQw
	c3cM8AXD+4lWN7vK2/UocQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2133.outbound.protection.outlook.com [40.107.244.133])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47sev6dy6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 05:06:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbJWsO/bCh83zgJIWj0WoJ0tWOejgjqiZTOBSPjiifixxLR6fLuB6eArzzyBIny2eQxIp8mOCM8HqYYwOIHyKFdpMqFqfnEgmgaQgkQggN2Qph8KeT+WGbezymdbFC3Vrc2xkVdUBTBYzNhlCxM+WkRDPu/gDH67kPHbZoVIQHTtqsngCFB3OXqQhTiSJi9f6CNMvRnco8ZSxVtvEXUYdvQzx08nL0RQiZny7amOlsVTRtcfPY6N/dhSRhhM9nfnVUVbtRz0oYgpkUeWked911BTdTH14OgfwofT446XxxMv/rI2Gl8igvO6QT9uqk/SuJT2Zgbx2v0RIRwTZ/N18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjXHd9xRBfOoVCkje6MIliwQFLto8n0yIlumV2v5T/M=;
 b=h56NvsAXvZzl4sM72JZzt8gqB/68HU1IAv/wl4NIrSqxdR1Psp6zPK92V/qBGZLzWbM6T1ejqhZYibAGwPNF8WXagjY2j7K1ZdoqqDcHt+4vBU78eJRX754hCcHalPQR7dJ+f3cOy7ckHqbNmwB52c/px0aQAkklyHtLEDUGW8lpI+zq8fNUptf72mrt08fYDvHOXPpCOzoWUUM3jDL1QyLOny94sX50NTPkrmFHhKx8M4KDQvPUMacv4xiL6hkXXBGc6hw+h/5lh2M7iWmZbBvhSvRdRpfWyWe3rWVvE+wAts4jLpeFFDeGMTl28o0+UyTuUmfXqQB2wQHrwZLjNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjXHd9xRBfOoVCkje6MIliwQFLto8n0yIlumV2v5T/M=;
 b=r/3Yqjxuno2HgZyak68Am9XZo93R60ud18jBnVaYy+lJTMXU5bqR65xWsNUmaaPX9/oLYNvCFgGqk48agjE6BqUonqyFTUsXk4mhr5An+WZJ6vAY0KWSO6Xc6CrAbv2oSPUN9GktTkknAUrkrE86m5zdjeMTTd8n94Pk3C05NOk=
Received: from BL1PR13CA0270.namprd13.prod.outlook.com (2603:10b6:208:2ba::35)
 by BY3PR19MB5028.namprd19.prod.outlook.com (2603:10b6:a03:361::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.23; Fri, 11 Jul
 2025 10:06:23 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:2ba:cafe::ee) by BL1PR13CA0270.outlook.office365.com
 (2603:10b6:208:2ba::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.8 via Frontend Transport; Fri,
 11 Jul 2025 10:06:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.1
 via Frontend Transport; Fri, 11 Jul 2025 10:06:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4A7E040654E;
	Fri, 11 Jul 2025 10:06:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3178E82024D;
	Fri, 11 Jul 2025 10:06:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        arnd@kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/2] ASoC: SDCA: Kconfig/Makefile fixups
Date: Fri, 11 Jul 2025 11:06:15 +0100
Message-Id: <20250711100616.296329-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711100616.296329-1-ckeepax@opensource.cirrus.com>
References: <20250711100616.296329-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|BY3PR19MB5028:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: effe9df9-6806-4fa4-6283-08ddc0629688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t6og0V+6tksfetg19qUVvKM28gna4phlmdesFnudeJ++Ht1zuWAB8JJHGKe2?=
 =?us-ascii?Q?Ddj3aoi5N/N+uyEcmHhV99BZEm4SDWeydgvDXuh1rafJX3RF01eH5KYvNARl?=
 =?us-ascii?Q?qmGjXsvm49fDX+wLhwMXtAGMJ35OF0JDsmRcs8k0/qikX8wVdIMbbWrPDPgp?=
 =?us-ascii?Q?4EjkwmgTI8hInLi1SEkqtBTos/8pdEeGXqWHLTwpWPMy1i4pzvUy2DW6/8Qy?=
 =?us-ascii?Q?jkuXNj8w4/NpjyKLtw/FiGWbFtHU/VHAfxVA9FuVVYML2OnGjHcnvlp6upV9?=
 =?us-ascii?Q?otATIrnbMDpKks9IynAj74kdo7A2I7Te1wp9bKh/S1IMnHvRNvrgZhpXXaT1?=
 =?us-ascii?Q?AQW76fQYmyue+EC/emuUIbl/7WQPrBIQXiQiqeUXx70T8NsGj+HRGL43QZGw?=
 =?us-ascii?Q?MqyJkvSfh5eBKUGSDIn81jHlUDP5Rmec4F0gDMM8esPSVz78RcDc0/hi8Z/1?=
 =?us-ascii?Q?oOaZyuDnuvc/xnLL5o+59IKQuoZsmTKHeMnkebsoh9SEXuG5C8cc6WpWD9Nx?=
 =?us-ascii?Q?wh/i1C5ZObaBsPPnBXLZy/5engKKv/qUNPH5qYUbZM3ERFz6B2Y4xso1PWN0?=
 =?us-ascii?Q?mSc1gy0vlVkYjmwxD48MLnfkiRH4T7NgF3H2RFUjBnyCPmjDrhg6yjnZfxf2?=
 =?us-ascii?Q?AtNEz8OQLV9/7o9z/0mBy/4hpF1aGO97giJxtVRiL5TO+L6zaHksgppMG1zy?=
 =?us-ascii?Q?Cr/5h3tC4Yi50oBOfyIr93qfZcn+QoKC4X5NeWk2WNobi7qvxMsHu+WJ1tlt?=
 =?us-ascii?Q?3QRRwiHf9rPgj6NG/7m/74cfYca0fB7dP+qV9bP4IE1S8F6n6u+dKX0LGyZC?=
 =?us-ascii?Q?hayyFYL1IvgdRIEmGfQq01BaZ8iZblQYGogp1ObkbIOsrczSs60dwhS23mf5?=
 =?us-ascii?Q?VXk+yrv4iD/byWPqaCENNsm+a0XmCFOsjolbNjkxhiqP3Y3BzQReM0iFLhE8?=
 =?us-ascii?Q?D/L8FWrBEeaYHKnLn+lRKnFV1ws22bSeqZqXzCUNBf9iyW+2T5l2S7obwXdB?=
 =?us-ascii?Q?f5/o9ci7pfCPCgYXk5iBiL649B1Kldj0AoDhvyaA/bAlII8o2/tpDydeDhxl?=
 =?us-ascii?Q?LUJG/yNHzTjKMIdy68sahqRzgJdvJ5V/a3VoP+gIaKFdxp0f06/X8vQSMSks?=
 =?us-ascii?Q?9bSkviS+hTKGQJGiWKsQDwVIy3mbujc9mdWcOLcwZe2+ZehXtVTIjsoyk6sQ?=
 =?us-ascii?Q?UEQ7O7DXKBZ1a8DkVgNHmz4Mgvet9ZdlNVShE3VBZBnPrstnr7aFoGVo5o+L?=
 =?us-ascii?Q?OSxxcupxnqgS6IEdgg02jhPMnqQsLrAfRHuTQ4FSCoHLIRFItahs7nHiSvyt?=
 =?us-ascii?Q?PwP/i5DlbenLgnFoV/p6qhfUuh4gdggkLoiUJUxsx7UhWhNrMi4vA6gm+d4M?=
 =?us-ascii?Q?1N39KOMRBuCbSxrD9XTvTIFvwixvc775akKCWWmYY/YjwWpUxfdBVEJ6I3Hl?=
 =?us-ascii?Q?DyB8UR71fdN+vId0Uw+5fzO0dGCpbOT3/UGFjXa0GLl3pMLxDv9JYDPqnUCD?=
 =?us-ascii?Q?gnRoEeo+NHg+nb+kNHE0NrxGgA86TkU0FA9l?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 10:06:21.9171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: effe9df9-6806-4fa4-6283-08ddc0629688
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5028
X-Authority-Analysis: v=2.4 cv=Zb8dNtVA c=1 sm=1 tr=0 ts=6870e225 cx=c_pps a=V+OjpK3aUZD57wWhQcm3pw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=4Ho46E_K3Ql3wuxli30A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MSBTYWx0ZWRfX58T1a3aB8y0k IpoTBUJk5rM7HilI8UJQCzGoJ2pxQJyDjWwbNjI1Ds0MM5N+Ps6lTkGHM1eafUqFxeXE0kHxLW8 O7o+K+2nZnwlAX+wMamffxhk+wzqFD9+JDWBJ+V4NB1gDUi3MvWfPfMJoEmcbEmSUZYs8J/JrdD
 TkF9DU2CRbO7nzxG15GKsM4O7YoiRGBpxKmink9qyXUWgb+Ql/mjCyWDpGld7xovhPmDZ2B0hw0 cB46C6HAIg9yw3cRD0+R3fJ/G08ozo6c2TsSvXsAS/7MahJPTOqlU5IMNmDqBTQZ1Yj1tQths89 7RZt5G+SQgj5RGjhSviumChCRWk6YYMnUV3XjEgJ9cKzG/JsEP+DEKToKUMidLbofVYlQipdOr9
 u2OrKxvjDRk7unVtA/BP4hP0DyBHbxkA+KAaSdxIIngAFr8BAsytEKC2ypfEOUf33MXLL3bx
X-Proofpoint-ORIG-GUID: yaSlSPm14ZGbZf-yEi-RFebPfr_w75xO
X-Proofpoint-GUID: yaSlSPm14ZGbZf-yEi-RFebPfr_w75xO
X-Proofpoint-Spam-Reason: safe

Tidy up a few bits of the SDCA Kconfig. Default both HID and IRQ to
enabled, since typically if one wants SDCA all the functionality
will be expected.

Finally, update the IRQ support to match the changes made to the
HID support.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Don't expose SND_SOC_SDCA to the user.

 sound/soc/sdca/Kconfig  | 13 +++++++++----
 sound/soc/sdca/Makefile | 10 ++++++----
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 2253a300dcc35..6a3ba43f26bd9 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -8,19 +8,24 @@ config SND_SOC_SDCA
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
index 1efc869c6cbc3..58a8f3ef3feb2 100644
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

