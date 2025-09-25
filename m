Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768E72F5487
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797662; cv=fail; b=TE3R7vD6imasSY/OOdX/28x6VAY7Nk59/ClLA3F8qUxf5lSJRQsIKy4voQKV2c/w7fAP7RX+rPTI1+S45niKdlODSoBlHtyjlYa8iRF3GvkhNlX6cCmEFWi38NGU6MeqtHCZTqnRPRg0dIGgzPFlCGGegd3U1HkyuZGUBypE08I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797662; c=relaxed/simple;
	bh=x+LOlTZpno5OvC6APUAPhq8Z7aiDPXS5iLbooY1VVgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pFnVVPCwwINZW0G/3263v1dYh+eTXZ1hSX95L5K0ON0nj4nrHEeHLOwWWVUOg7sw/s37xv7N/DWSQiSoARA4LHkyOVckGtKhDIrI8zdWvlayuEbQfxzQAEH4cpLnyRnHipjWCxiCRnD5KA8l0Cl8NATD7TLibQcrWSLNgxhiMGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=D4Ypo1NJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zMMG1SvS; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="D4Ypo1NJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zMMG1SvS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P4cfHc2734368;
	Thu, 25 Sep 2025 05:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=UIrXm2LmHtBbufMKTI2W8F+JR1VtYQPET+0iPEJaUmE=; b=
	D4Ypo1NJGdSE7lrJ7zTZhMAcTeTJJA3TaKrnjaDvoUhUTjFL5UebcBDgM+N/pXfD
	AECNw3O4KITDPxivF7GybldizhpqdkBgE2KyICdEQDdRK0a5aMu8fFfeIayyijC6
	x+00vBGVjqI0VT7bKamad7+W+0xN5iFffMN44RIshQYmDzG4QlqH3GE/R8L7J4Ef
	H68tIBoLg12/NKthWm7ypKihtUbi7+inwZ2N1NY516Zl8YhBairnb4MUUZgew0tv
	MANu1hT2i0kKuBZR46xqOw21UeA4lL7F+qbFuSlaLq7k2PAA9pGXuXAhwsdnBUag
	RwSgOZGeG1pRuzlYMMMzuw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023083.outbound.protection.outlook.com [40.93.201.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49cjmds8wu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzUT9JurKzYx1VIGqmZUJZy4MLo7YMvr06Dppr4XzyNhOvp/BnGejYA5RIDWwnNPlYPKLyQ7jDEMIYyA8IVySmZ/ZTs6m3hQdo9IBKK9qx4Ki3tML/GJANMUQPbF/xuOBAGbuhiRceVhW7KE2de9H06F3xRNZddXxwcG55YOlyvpylu0p9Ic1t1s+v28TyHg4dK+0RUU60H980iTTNefcBdrTlJhsjq0Ehp7F3/t/H7XDP+qADS2HKd2OksN5Na52V0c6FlisnBoI/uMbgnCkdTgJNMg4svdjV61/CO4HyronCxxroxLbVxMpPmXRPaUcMZ2i8P/secXbQutwiIiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIrXm2LmHtBbufMKTI2W8F+JR1VtYQPET+0iPEJaUmE=;
 b=Mg2RH+EFGALpT73KntANmTVA28Cy/GgatblXbS5UHX5KS/gr0+3PKGjHxElx3xjFxy1Y5AXfs+Dp+Zv/olqwrvEYy2BeTMOYpYJlfcQXbSLWfefYLBN/KTBoojLvTsVeWggAGgrn0hF7ZbE2Aswkwh+uqQ47+Kz3wh15KMkyhu1sVA5+uM8ZvB0yDQmpY/ExvHejLKHrgJj4I6QhwQfke39xLV7AUUteCv6OFoG3/nHYvt43l94ISOgxFSH1BNYUaW9W7P1nXu72plKazipXZSwBLPUQV8BVZvrgqWr8i5EpnLDagn1ALhon5ivzM7GzBM569Ja6Nt9AmCp/e8aedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIrXm2LmHtBbufMKTI2W8F+JR1VtYQPET+0iPEJaUmE=;
 b=zMMG1SvSoSD+dig7Hbx1Wx9NzQb+2dFAtHKG2HFDFL94CEBDwL6JJYpvK8UQ7/ERokw48RL/L16MBdk1qKp/dbHJdsbJuzh4aC1k1tcns/O6EZevLW8ZAFFo+nsdq51p2jRoSGx4rFM7X1YMUmVHiS4Gjy6xRosMOOP4JKAej1Q=
Received: from MW4PR03CA0030.namprd03.prod.outlook.com (2603:10b6:303:8f::35)
 by SN7PR19MB7307.namprd19.prod.outlook.com (2603:10b6:806:34d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 25 Sep
 2025 10:53:49 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:303:8f:cafe::56) by MW4PR03CA0030.outlook.office365.com
 (2603:10b6:303:8f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Thu,
 25 Sep 2025 10:53:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 25551406556;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 101A182024B;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 04/19] ASoC: SDCA: Pass SoundWire slave to HID
Date: Thu, 25 Sep 2025 11:53:26 +0100
Message-ID: <20250925105341.194178-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
References: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|SN7PR19MB7307:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cc7b47df-5ba2-47fc-2e41-08ddfc21ce0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xfEteSoCyNPQ/SMuiV7ittvn5bRgWcr9aYHKCS8YUAubS8G11xKxCOT8lTZi?=
 =?us-ascii?Q?+s7MQVMAN4subJ+pYz4CkdzgrNL9FxG0CWmhGEQarKsEx9oCawSdxA+F3z7m?=
 =?us-ascii?Q?F5bYb9D0lnMyAeW9WyguWOOQURbl87bUA2cOaaQG520kMb9Bf2jSVWrlMwdV?=
 =?us-ascii?Q?3HW+Ap3ki7/s8hZJzTs6SotmdCK3NdlzEmr/8uRdiM29W779wsOWlvEqC5WV?=
 =?us-ascii?Q?f1VGcJaTkdvaRqAnCtzfDnWHgs2ZHP21dXZt86Wm285aKlaJqAvj7O1eaW5r?=
 =?us-ascii?Q?LMlPndcQ+l4zw0a+oNJ7168rGadInncbfc4RP8usewMUXn/wwT29vo0nLbcv?=
 =?us-ascii?Q?I063S6AAObeJYUJx0wnC+teFc/sXBWlXPHOaG2IkIZSOZW/rNysSCD5WgBG9?=
 =?us-ascii?Q?UtUASAgumXjTxuYjzyRozGQw+r1Y0tLdkfUgs5QAA/5E3MkTU112a+RuNXU1?=
 =?us-ascii?Q?597Y0K3soktZy75As5kNQskuQKrFgZvl5Yo7/S/0zySLrbvKlu5s5r5JwuLa?=
 =?us-ascii?Q?9ifF1aViilhWwMZ9GfDpxS4sBfVN1ad2WYz8zvmdaqVuS44Bexq1bTtkjuWm?=
 =?us-ascii?Q?/9nc/2JbjRtktyyWOAxwM9UfzgM0OI8SUVAaiG/Az3lZpaO6vyajWyJoZhpZ?=
 =?us-ascii?Q?v13clLx6dnkft2+4ozTkJ/8Hfafm8c/p0CX0NxRUIrc763lDPwxSZ8RGdDqn?=
 =?us-ascii?Q?9GMkkgW1WJwWrf3v/wOEASSPMviNnCh9Y8i32uHCBBkZYThAKPm6naTInuQz?=
 =?us-ascii?Q?Rfh0YkWL2YN4TO231HgI/KYZpKmQqTZCAO4w14CBhe+ozyxqCE0QvTfw0ASM?=
 =?us-ascii?Q?s9xlGzYXnV53oaU9dc00b34x4OTE8NVCsiEC1J3961B1eSUYX6jsElurFhQU?=
 =?us-ascii?Q?uLterMMYgfinVrPF6vqSg1T9+PV8Bb3MXNhp1gpvPJxt5v+vbEGbi8RKZb1M?=
 =?us-ascii?Q?06sosfDf6dMVbOgtAwx/qyWaGPsG6cAcZ8fL54veQ6FfajfJ9sfYaIvvw6r4?=
 =?us-ascii?Q?I2SE1vDqxW9PWk9zX+ATKDtRE9QAZHWb51Mlljj0jf9WPNkceJ53VrQBJCI7?=
 =?us-ascii?Q?jw4mCyO1kfoUD8OSOW35TjCZuE21z7AuBfXU54X5wHfQh+UOkQZCmVwyDKUs?=
 =?us-ascii?Q?8u7AnKhjqEL+S2TI2VEBOgtGi36C9z3XLebgG3TXijfs7aqZ/lel1WazC3rf?=
 =?us-ascii?Q?SUZ27CBr1nfOf7PDo3uU5DxqA0GKZYAETEFCRNS3tY3mfxx9PTU/J4n9UvvT?=
 =?us-ascii?Q?VvIZTvnDbcvAGazeTEYPfnkvE2hLZ9pVRxQRrYAAPspH8YT1jUFgnYyGaHY0?=
 =?us-ascii?Q?X0bFu0m/kHezUZPa9T7fkreuxq5aDSrL3zA4RQa47CFN1/I7bFcB7/pWR1Ld?=
 =?us-ascii?Q?qKDnpjWkfCDYK3eBuRqJdjp+gDAid52jFtf1Av/nGVnewUGoxbi4flH1kCbl?=
 =?us-ascii?Q?7i24oK/xaknVxTHZPXomy1Z5wT02iAxjDYgB+RDd1d/YP+N/tsYUX0wOWaQr?=
 =?us-ascii?Q?pTa66F0ItqDSvw6oISCLOgk9DBROxuYcxfr1?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:47.4390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7b47df-5ba2-47fc-2e41-08ddfc21ce0d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7307
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfXx9jdu5PQzLfw
 k2v7qYR1fdlH8jIs0xr8SoqZ+veA/ziGYCHSOOqiyZLhtP8Vz/QHLcnPN5CavywXLuDvNcYeWHy
 jor2BvhYT40z1bQhlphSw6O+Ze+2rHpzIDMMOQJN5Q2N7zy4/4gxo+Xv4ifwDEQq6rDWFFHsAPa
 JbC4lPPFS0SFvXJkUrZW3aRamy3pWFMwitQmX/n+sHDpONoT56ZHV5TjbfIlY9yafrL1gUnC9q5
 qLMaD//sPWUwv7pcPG8M+hKWumsgKHRfAsvRT4MzHZbzHjj3yjRKxYlYXAAJTONlVXyYNHlo5Hy
 9JwEz8zFGb8hhKK57NeZa5uOKDJD6gdFBfPwx0yW+x7xq7le0juUef4L3Q+15o=
X-Proofpoint-GUID: YsJpXlCKJoh3MmsWB2zZ-IXliUDUUEUx
X-Proofpoint-ORIG-GUID: YsJpXlCKJoh3MmsWB2zZ-IXliUDUUEUx
X-Authority-Analysis: v=2.4 cv=ap6yCTZV c=1 sm=1 tr=0 ts=68d51f41 cx=c_pps
 a=Kl5DSHqeMBbv3ZYbUOuQHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8
 a=w1d2syhTAAAA:8 a=--uAHVF7q1budoVWL4UA:9
X-Proofpoint-Spam-Reason: safe

The SDCA HID code can't assume that the struct device it is passed is
the SoundWire slave device. HID is represented by a Function in SDCA and
will thus likely be implemented by a child driver. Update the code to
explicitly pass in the SoundWire slave device.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_function.h   |  2 +-
 include/sound/sdca_hid.h        |  8 ++++++--
 sound/soc/sdca/sdca_functions.c | 20 ++++++++++++--------
 sound/soc/sdca/sdca_hid.c       | 12 +++++-------
 4 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index ea68856e4c8c4..51e12fcfc53cd 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1332,7 +1332,7 @@ static inline u32 sdca_range_search(struct sdca_control_range *range,
 	return 0;
 }
 
-int sdca_parse_function(struct device *dev,
+int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 			struct sdca_function_desc *desc,
 			struct sdca_function_data *function);
 
diff --git a/include/sound/sdca_hid.h b/include/sound/sdca_hid.h
index 8ab3e498884ef..3a155835e035e 100644
--- a/include/sound/sdca_hid.h
+++ b/include/sound/sdca_hid.h
@@ -12,10 +12,14 @@
 #include <linux/hid.h>
 
 #if IS_ENABLED(CONFIG_SND_SOC_SDCA_HID)
-int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity);
+
+int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
+			struct sdca_entity *entity);
 
 #else
-static inline int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
+
+static inline int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
+				      struct sdca_entity *entity)
 {
 	return 0;
 }
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 5f76ff4345ff5..2d5d20e23e3c4 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1253,7 +1253,8 @@ static int find_sdca_entity_ge(struct device *dev,
 }
 
 static int
-find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
+find_sdca_entity_hide(struct device *dev, struct sdw_slave *sdw,
+		      struct fwnode_handle *function_node,
 		      struct fwnode_handle *entity_node, struct sdca_entity *entity)
 {
 	struct sdca_entity_hide *hide = &entity->hide;
@@ -1328,7 +1329,7 @@ find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
 						      report_desc, nval);
 
 			/* add HID device */
-			ret = sdca_add_hid_device(dev, entity);
+			ret = sdca_add_hid_device(dev, sdw, entity);
 			if (ret) {
 				dev_err(dev, "%pfwP: failed to add HID device: %d\n", entity_node, ret);
 				return ret;
@@ -1339,7 +1340,7 @@ find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
 	return 0;
 }
 
-static int find_sdca_entity(struct device *dev,
+static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
 			    struct fwnode_handle *function_node,
 			    struct fwnode_handle *entity_node,
 			    struct sdca_entity *entity)
@@ -1381,7 +1382,8 @@ static int find_sdca_entity(struct device *dev,
 		ret = find_sdca_entity_ge(dev, entity_node, entity);
 		break;
 	case SDCA_ENTITY_TYPE_HIDE:
-		ret = find_sdca_entity_hide(dev, function_node, entity_node, entity);
+		ret = find_sdca_entity_hide(dev, sdw, function_node,
+					    entity_node, entity);
 		break;
 	default:
 		break;
@@ -1396,7 +1398,7 @@ static int find_sdca_entity(struct device *dev,
 	return 0;
 }
 
-static int find_sdca_entities(struct device *dev,
+static int find_sdca_entities(struct device *dev, struct sdw_slave *sdw,
 			      struct fwnode_handle *function_node,
 			      struct sdca_function_data *function)
 {
@@ -1448,7 +1450,8 @@ static int find_sdca_entities(struct device *dev,
 			return -EINVAL;
 		}
 
-		ret = find_sdca_entity(dev, function_node, entity_node, &entities[i]);
+		ret = find_sdca_entity(dev, sdw, function_node,
+				       entity_node, &entities[i]);
 		fwnode_handle_put(entity_node);
 		if (ret)
 			return ret;
@@ -1927,12 +1930,13 @@ static int find_sdca_clusters(struct device *dev,
 /**
  * sdca_parse_function - parse ACPI DisCo for a Function
  * @dev: Pointer to device against which function data will be allocated.
+ * @sdw: SoundWire slave device to be processed.
  * @function_desc: Pointer to the Function short descriptor.
  * @function: Pointer to the Function information, to be populated.
  *
  * Return: Returns 0 for success.
  */
-int sdca_parse_function(struct device *dev,
+int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 			struct sdca_function_desc *function_desc,
 			struct sdca_function_data *function)
 {
@@ -1953,7 +1957,7 @@ int sdca_parse_function(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = find_sdca_entities(dev, function_desc->node, function);
+	ret = find_sdca_entities(dev, sdw, function_desc->node, function);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
index 967f7ec6fb79d..53dad1a524d4b 100644
--- a/sound/soc/sdca/sdca_hid.c
+++ b/sound/soc/sdca/sdca_hid.c
@@ -82,15 +82,13 @@ static const struct hid_ll_driver sdw_hid_driver = {
 	.raw_request = sdwhid_raw_request,
 };
 
-int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
+int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
+			struct sdca_entity *entity)
 {
-	struct sdw_bus *bus;
+	struct sdw_bus *bus = sdw->bus;
 	struct hid_device *hid;
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	int ret;
 
-	bus = slave->bus;
-
 	hid = hid_allocate_device();
 	if (IS_ERR(hid))
 		return PTR_ERR(hid);
@@ -103,8 +101,8 @@ int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
 
 	snprintf(hid->name, sizeof(hid->name),
 		 "HID sdw:%01x:%01x:%04x:%04x:%02x",
-		 bus->controller_id, bus->link_id, slave->id.mfg_id,
-		 slave->id.part_id, slave->id.class_id);
+		 bus->controller_id, bus->link_id, sdw->id.mfg_id,
+		 sdw->id.part_id, sdw->id.class_id);
 
 	snprintf(hid->phys, sizeof(hid->phys), "%s", dev->bus->name);
 
-- 
2.47.3

