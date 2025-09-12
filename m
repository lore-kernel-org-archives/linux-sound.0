Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20242EB5B9
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673339; cv=fail; b=BHXkfE58P5qaGGHmZsqsRq9LgSLajfwmV9aESXKZgFKFKjIGYy1KoubPenvX9Si52/MFpz9T5B4sYX2aGfLEUEzSqY91gEQhU1hsO4ErNn8YQ/ttGO3ov3f+mNj09TC1wuen6FwsuOAn/V9dVahtG7oGEaT0u+T6ivhoak/kXwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673339; c=relaxed/simple;
	bh=9wnKQIrUxJR8/FFNIZr8pyx5DVFqKSJ26nKUMX9/YzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jdiV4ksvESUtfw4wmTWtKWP+B+CqnKtDwKm2J7GTR9Kj0J0Jb5o/D/EozjaTJ+wtSrcjQYWC+P6pz2L0vB6i67tXlichyrcissuhmKgOhu+UEjTYsUXqS6SHGIvRNGraKv8v/po34XuM62ziUKp+P9mHwPq7MlNYrhge9kA/3kU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EZxXWatn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=a5zaqs2h; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EZxXWatn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="a5zaqs2h"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C5xntB3622022;
	Fri, 12 Sep 2025 05:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Cmbb0JQNh6jhwUuwnJhR5SmYArt8JVSy7J5GbpzrxUI=; b=
	EZxXWatnfUvqCXoPVC+fgnng0O34KuYkE4ixD1JEdPe58OlxRRUeVXp2LDwQyL88
	tKW++C1jLwMX0lTU9av018FSWzDwyeRfqPpnLwxAi6QzKur1+uefJ06MRQQNffYr
	axaesn9VEv6XwbiGUB4XCgwEY0hEMfBdLBmdlPq6ODW/6x5KTMqRUrd/Zp2EW7gV
	2YGBq1R0ar2PK6QT3yQf3h5N5tnBTELcBXh1y25ABbmq/fFajB4mAPeuhwhrtOJW
	oZ3yB2d32T2MeDpV69V3G8AyzF6tmpSsI9Fyp3MVslsIlnT8x7/9AIdtue4CMNfu
	jDAk/98qyeYAs/4XCuzWkg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2096.outbound.protection.outlook.com [40.107.93.96])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 494due08yn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fV86Khl4xxlI3mP+5HNIMoK3WtPHBvXKmWPOBC0tDdw3Uu8smxqeT06tv2Ls8kWuwkifQrrnTLiIx/RUF/LuuJNnjChIz1aCQC6FRwr2YuTp/BbRUeM2D8tjZhdzPB9jBLUuwueNNN8tADor+xBZ5z2x+g1ohqUnkSW7OYT0Quj6hZFuZtMBs33A3BAJj0nggDqESbyBXzY6iW9gEOQfriTOWBT/Um31yrrnlrI5tEFwDn6XalBWeITnmG1g/e9jNDVL8kzE3T4tUicBFNo0nabs1hqdWHB7AAKOtdnk1PkNB0XA7bjywqJoXWRBcLm4eF9RCXviUkoYDo/dSymgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cmbb0JQNh6jhwUuwnJhR5SmYArt8JVSy7J5GbpzrxUI=;
 b=xFnxEUIdRaS1SZcC2JuoAJsLv9SfU2Fgv6zIS/4ddvqjKD1fbvoQ74KnfhfM3DolFGwS9AtaBytVRrTt2TagV6lOB9ol1A+Y7/KeJyfAVzoKlQTr3rA94dbv0H9rJMPbrJJTAf6hpe4SJlNHsrLCjncDH++MvCDI/g70NAYlz9zwerYM4qohPVgv5EV1HJUFZo+b1Zygsn4vutmG18mXqyCVg4Wv5eWnaJuWLPan9Re+fOWEu4DqLm0zclXu8oHMMYLyRcAUVvQUhm7gtKLLbaGH0CpvRd4qjPDP7KE3cIzuNhG+tnsqvm3Jsn+ReemXvs8uq1+ip7ntiDICZiEpbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cmbb0JQNh6jhwUuwnJhR5SmYArt8JVSy7J5GbpzrxUI=;
 b=a5zaqs2hpVwXqy5BRX0tqJp0op2PxakFo8b46ko26KS3y5vcQatG4nw88xnbd/0yt1O0X++PFMiz8myuA8+EWp1WeWt3DzTcRitRSkynofquR9ZtyNOmTwzS5TtUmuG6lGp+ETpIsjTutCKLrfzgXKc+BYiYu9WT2sYfEoKeRKk=
Received: from BY5PR13CA0018.namprd13.prod.outlook.com (2603:10b6:a03:180::31)
 by MW5PR19MB5649.namprd19.prod.outlook.com (2603:10b6:303:1a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.33; Fri, 12 Sep
 2025 10:35:13 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::bd) by BY5PR13CA0018.outlook.office365.com
 (2603:10b6:a03:180::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.8 via Frontend Transport; Fri,
 12 Sep 2025 10:35:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 39776406560;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1A67C822549;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 10/19] ASoC: SDCA: Parse XU Entity properties
Date: Fri, 12 Sep 2025 11:34:55 +0100
Message-ID: <20250912103504.2679226-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|MW5PR19MB5649:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5cdf738d-1ffe-43ae-590d-08ddf1e80e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sRmkdpSa6RABeylrP0h5PbejkWPPQLMv4LAD8eYwEm/OSDPZ/1bvt+XkjY9P?=
 =?us-ascii?Q?lrNAxzfjo6UB4pXw3IeugpCOkmLhgBC0HUXJKTyAIqwlD1G2FFUPPSQFLUmv?=
 =?us-ascii?Q?0VD+QmkQJ4AFFsJIXXxUema1goxrCQDCtoLhV1Hf7ojYTYQoUJy5DLnsZ29b?=
 =?us-ascii?Q?iQ+HgYNObGBgbJQ4oQ+DM0/j4h7U+hqYwwkpWvPxLi1NVee4wXQpqbuKl6DZ?=
 =?us-ascii?Q?6GRKHce0ydmLYxS2OkznHC/uYQD2XCkg+TXfRjI/sBLy5u/hA4h4ts1BaMPW?=
 =?us-ascii?Q?FEhqs4jXm1TA3QyccbDQ1VJMcMuSnG7dWzlcFTXIW+NdS6ceJBYot+9VnYeI?=
 =?us-ascii?Q?S+HY1skrivc+txTJY6PwHEDj6wdb9PEmAAuu+GCLqaq+8v5DePk3AqLx3bQT?=
 =?us-ascii?Q?eEBMNy/1NwgjAtcQUYzaX3HeiDcg+nOFKoG/Rkkg4DRX+8U6U2a9anSDcO+P?=
 =?us-ascii?Q?pTpL/lfA1zUGutN4Bgh79HD7NsV3c2fmhIr/vO8AIVJ+DVXMfVz4y+CjAdZJ?=
 =?us-ascii?Q?BBwt+aeQAmh9SsGTf4G0o+AH0wEgPaDfb2i51lFoHJOXcrV10UHq4bxJaPE9?=
 =?us-ascii?Q?BWVJ7jbd9tnoYrsvyULL8ohSWLjQL65a5OMrYYvGfCCp5G7J5apOrB52ehzI?=
 =?us-ascii?Q?IDyR1zcRmFOFUDw9iOoEcRYqmy0aiUAaMhpA7+18s+skIYn/4n7BU49rEu86?=
 =?us-ascii?Q?yEJ4S8EodB7ugUiKWJ+78QsiZf833K0/WtSguecEBpxrr4lScL8bc17w1H/N?=
 =?us-ascii?Q?1WT9+WMlF16BbDxrwAzIvaqX3RUofJQWCJrkzUphLqLttYG6qTZ9AjKrlgkc?=
 =?us-ascii?Q?r5BRRhrNssdB+dT+jiq/Ai+JlvwHaBUs4cF4sYFHVQzfhaSWabp7v7nIiEkx?=
 =?us-ascii?Q?O+TiysvdbH3N7BQAZ7SGACeVpKMLyuqkS/q4ZqGFtA7g1x9kp4ana8W/8aDe?=
 =?us-ascii?Q?2D5A9Vd7zLIVGMH2jUYPGeP50HP73YzcbGD7gu/6DeRT546jnUPw6gINxITb?=
 =?us-ascii?Q?r8xLO8BpAivZi1aT3SwIE7u3rWDPxK2gbgRprWDCmcVK5BusaDqrKsnpMlHj?=
 =?us-ascii?Q?qFBN7ZYg2xX9WoU6cTpegf6kFyqpCx/WmVEAUM2hSin3V92xjLY9Dn2mgdDb?=
 =?us-ascii?Q?cYJFZpQvJaXgCau/fJBtdgMf7k1x1iPOgKfoXTdKSKgrveau+hogyFZ6HHtj?=
 =?us-ascii?Q?kc0BvgOPOfbdhOPeN1lrdj2mBJIUVGr9PCybxMz7FxM2r77dIzq5UW+fJ61c?=
 =?us-ascii?Q?+qjJrkshR8c6UXllk36sBvbXAsR2zPZhOl5b5zL12SwN1lH6RqzUU0mI5kZE?=
 =?us-ascii?Q?lOOi+afOhYLiTl41B17+E95QIKDMaGe/cowqoAQTJVCdtKyRzCtei4847QCD?=
 =?us-ascii?Q?ECYx3/v/VXTDrhTGB8GTEHHjTv8KK9yROBKpIFbD9IPBHrU3LRncjoHMofjd?=
 =?us-ascii?Q?dlzXer3mxD0SS2ko1eww1FAokDH7ubSwYN2gmb6if8ex5A3vYh1eg9KArmfs?=
 =?us-ascii?Q?YbXbLHcn4XVrQEWS0DV/BBj14B5mu9vMUy80?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:12.4812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdf738d-1ffe-43ae-590d-08ddf1e80e1d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR19MB5649
X-Proofpoint-ORIG-GUID: NgyHXmP8tVTiY-ywjABeXesEXbidgE4g
X-Authority-Analysis: v=2.4 cv=F9NXdrhN c=1 sm=1 tr=0 ts=68c3f76a cx=c_pps
 a=i868GfrP2EoLkLq8pIF83w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=PNBlM2Yev1JeWuC6KiQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX01O10nDeYt6A
 k93fO6gYmWWMSsbzl6EKrp1CtS67PYaVqYSF9HDTDrOUc7Jrf9iz03sb+NZsmZ/jkPIlekfFZcr
 7R54E5u+1x2ycy3XKf6YAn8Zucxts3mKQEnNaIzqlph/Fh+oeA5VOa90t+iQXCZKFttK8CHZJpT
 l00/W750peGeCKkuD8ltvOmy3q13P90SSbPhThwU7w5N/iZpxZuPkEwXP4zYxQJSvA8/e0pOt6n
 o/KqO2p3KkTNz+5QIbxAg9MSbacROxD7LKBZIXssReZJBxeESZR6FKAeyxeaRhre9lBQkMqnZl2
 OyrKpbUWYTwTJNbzoB2lR3d7iBZuI1zzqIXXVNE+m31tU85oV/uVuvLc23+Y9c=
X-Proofpoint-GUID: NgyHXmP8tVTiY-ywjABeXesEXbidgE4g
X-Proofpoint-Spam-Reason: safe

Parse the DisCo properties for XU Entities.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 include/sound/sdca_function.h   | 23 +++++++++++++++++++++++
 sound/soc/sdca/sdca_functions.c | 25 +++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index ab9af84082c9..f2ce13162151 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1090,6 +1090,27 @@ struct sdca_entity_hide {
 	struct hid_descriptor hid_desc;
 };
 
+/**
+ * enum sdca_xu_reset_machanism - SDCA FDL Resets
+ */
+enum sdca_xu_reset_mechanism {
+	SDCA_XU_RESET_FUNCTION				= 0x0,
+	SDCA_XU_RESET_DEVICE				= 0x1,
+	SDCA_XU_RESET_BUS				= 0x2,
+};
+
+/**
+ * struct sdca_entity_xu - information specific to XU Entities
+ * @max_delay: the maximum time in microseconds allowed for the Device
+ * to change the ownership from Device to Host
+ * @reset_mechanism: indicates the type of reset that can be requested
+ * the end of an FDL.
+ */
+struct sdca_entity_xu {
+	unsigned int max_delay;
+	enum sdca_xu_reset_mechanism reset_mechanism;
+};
+
 /**
  * struct sdca_entity - information for one SDCA Entity
  * @label: String such as "OT 12".
@@ -1106,6 +1127,7 @@ struct sdca_entity_hide {
  * @pde: Power Domain Entity specific Entity properties.
  * @ge: Group Entity specific Entity properties.
  * @hide: HIDE Entity specific Entity properties.
+ * @xu: XU Entity specific Entity properties.
  */
 struct sdca_entity {
 	const char *label;
@@ -1123,6 +1145,7 @@ struct sdca_entity {
 		struct sdca_entity_pde pde;
 		struct sdca_entity_ge ge;
 		struct sdca_entity_hide hide;
+		struct sdca_entity_xu xu;
 	};
 };
 
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index cc0306aa14b2..76ef661a76f9 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1398,6 +1398,28 @@ find_sdca_entity_hide(struct device *dev, struct sdw_slave *sdw,
 	return 0;
 }
 
+static int find_sdca_entity_xu(struct device *dev,
+			       struct fwnode_handle *entity_node,
+			       struct sdca_entity *entity)
+{
+	struct sdca_entity_xu *xu = &entity->xu;
+	u32 tmp;
+	int ret;
+
+	ret = fwnode_property_read_u32(entity_node,
+				       "mipi-sdca-RxUMP-ownership-transition-max-delay",
+				       &tmp);
+	if (!ret)
+		xu->max_delay = tmp;
+
+	ret = fwnode_property_read_u32(entity_node, "mipi-sdca-FDL-reset-mechanism",
+				       &tmp);
+	if (!ret)
+		xu->reset_mechanism = tmp;
+
+	return 0;
+}
+
 static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
 			    struct fwnode_handle *function_node,
 			    struct fwnode_handle *entity_node,
@@ -1430,6 +1452,9 @@ static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
 	case SDCA_ENTITY_TYPE_OT:
 		ret = find_sdca_entity_iot(dev, entity_node, entity);
 		break;
+	case SDCA_ENTITY_TYPE_XU:
+		ret = find_sdca_entity_xu(dev, entity_node, entity);
+		break;
 	case SDCA_ENTITY_TYPE_CS:
 		ret = find_sdca_entity_cs(dev, entity_node, entity);
 		break;
-- 
2.47.3

