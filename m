Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5515C3126A9
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429494; cv=fail; b=DwYNRmB50bZ7X5cScu2qQXgujzC9OBgHj5grSruP6oNg5HHJmp1hiCJrmZ9ZZKK1uglYOwKNiemPGVJjQDIxOJWJhSF8TVdI5lorKaYFK39DwxH5wlgOGC/DybDQu077gTgs1YAoZSows8toXCQudnji4kTKv8KmLZwV5bm1g5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429494; c=relaxed/simple;
	bh=O8xqmY3s/fJ31o+QuDxu6Rh75dP/QIjXNXsH5l8Ur9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ef4fmv08omOfzNi2wc+7Seg/IC17fWyDQ6XzZaBsXoW29NxCQwgUlT8aCyxSsCyq8xRFJ0qExnlPrJVIHMSZZGLzH0scdaRkx6E6A2C7s+2GvBBOCmV5XeCkJXBB8/dYyFZLIZzOxmAEMDjB1EYFomwJ9CmyJUGGTmaloV5DKWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=en68eSU+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mTu/vDrf; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="en68eSU+";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mTu/vDrf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A63tDsb019774;
	Thu, 6 Nov 2025 05:44:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=u5mroy7+qEo4b/Bv8QWdR3ZjHYOLQfkNgUdQtRAOhtg=; b=
	en68eSU+w/hqPrP3u7GwgZyDa6dQJQkmq9//eCKHfb1r0Tv9khH3n4ja5mvc/cAi
	rS0gRUrqCWkkwpYMxh8n9L7iHmYb8g/kiGI4wHRImatPaaiZB+bdvBdn0FSPaWLX
	7hVpDR7++bNi7wCOeN86dZQc7s6Sv9h6F54b1gBqSQxsEvIXxx818uzLHfCC+fIa
	6e/hRsXJseVLtpQPOTsdGeCPaYEJc3yadSn4if7B7Fvgw9/oJaUlPWRLxqMBLHUh
	DUF6mhYNEiLz5ambUzM+Coclg4bj+0g0V+JG5yihOjQ4Igts+ChCVx6zveqwgs35
	qi6fPKojo03vjAZDY8n2Vg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023092.outbound.protection.outlook.com [40.107.201.92])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a7bwx3b5n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:44:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YS2aFAhwATrFZKkd/ikil7wnDtanvIeylMkLbGHxS+Lei9HLGJJYx2OillHQD7UPD2y43+9bhGdFcsXsTFKKAQHb8ZumcTUDfKzaT36fopi5GAGHUqecB6pD6PEk1WwYUmKVLmBLM8v/IkXm0sBLjPSoV0AdkmRkxVB3gyCx5cnuYfgdC1ox4TyhoP6Kvl1CzWPzug7gxesy6EkZrZKWbAddw1t8c88hsVwWUzWWitSIBd/HXQZoa3cBtH9t7IBqBQJNOUIEvTlS7vdwsv8SjpmqToguHNexFaPtNIKgKe27m+ubokJDzQUMovYnEX2ThQbs++fR6okCs2hLUkLwLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5mroy7+qEo4b/Bv8QWdR3ZjHYOLQfkNgUdQtRAOhtg=;
 b=xt1ymyiyZ0Xf4juAmgr1i+il9rhI9IAxOdUPAcELLlhEf4l6rO8mdZjvN8jfnvxydNzvWaoGgdYgUhzVbNj3Eb6kxR7eER7EpOam7UQqm2CTalcylfeRuSxc+IpvaT1ULiNfd7doVKCBn5bFmGMAdJaYHPZ8/oTo92x9m64gOAknrP9m2u9/tQ5dlkl2vELOu3pyp6Mbt92oluPlucFwocbrQ04Asd8ViTgOrnCzE1Ij03/b/e8zA5xImDJ0QuOA7rDJOQdIZrXI58B0imJ9Tr/XUN2ady3axcljaBz4jxKQipmQmueXj6pOOap+346CPmrQpwHxyRB/3j1KDcaR3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5mroy7+qEo4b/Bv8QWdR3ZjHYOLQfkNgUdQtRAOhtg=;
 b=mTu/vDrfX/zrFZQ+c4xtyGv3FhPuePV514kWq+XDr64Org7Cum45TPgHvuwu+tIQYvfFMKFGjxN2W7TDqKZe2qRY+ExHlDHgfNshFjasQsc+SkBSvd/Jge9Bhdc0StPzhcAC7b9qPJXpsthGoXzJ5SQ4VnP75RaH4dpqNTLqufo=
Received: from BY3PR03CA0027.namprd03.prod.outlook.com (2603:10b6:a03:39a::32)
 by BN5PR19MB8966.namprd19.prod.outlook.com (2603:10b6:408:2ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 11:44:32 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::a6) by BY3PR03CA0027.outlook.office365.com
 (2603:10b6:a03:39a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 11:44:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 11:44:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 18E4B40655E;
	Thu,  6 Nov 2025 11:44:26 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E140A82254C;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 11/13] ASoC: SDCA: add function devices
Date: Thu,  6 Nov 2025 11:44:20 +0000
Message-ID: <20251106114422.906370-12-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|BN5PR19MB8966:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 34058f83-adcd-405f-54f3-08de1d29d8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+vQ38/O3Ht4E4WnJ3MH1j1zYRPFxF02bKR6CEwW8mmi66v9Lna69QFWNx0b8?=
 =?us-ascii?Q?5MA8E43W2bWjUAdzaVXQjjh+N5+/DWc0sfNdOZPVbFIMNyyFZ8SFNkW70mV9?=
 =?us-ascii?Q?3OJMvz4PrOdpZT6+kj7ni5wRdZa7QfkCxyUKqpMMfHlPkT5WzdsWMrfHOvSa?=
 =?us-ascii?Q?L50nOOIFHzR2UXNUqLabXKdPt0EjAu5W7QFo1kvAi9h+BbzwzBCf/LFzcYA+?=
 =?us-ascii?Q?KELx1kXFWGUEbNjeotkeq4ywpfwLeY3+LY/2JBzv1ZpO1h+1YfU6JT4AVxeo?=
 =?us-ascii?Q?TN+XBXltylUNGwVTl9lsR485XFUvf8daTJ+KOoYyGmH27MWOY0nSu3V40akq?=
 =?us-ascii?Q?DJ6hfE/QLOeCJLQWKl6cgbOGOGHXd8Sa9tCaCEj8mlHxtiiABoPgcFnQC7wj?=
 =?us-ascii?Q?2tXSLxEm0W0E13UQMECMELY9se/2dAzGdqjRCTNixcW6yR22afvWLn5VJ9rm?=
 =?us-ascii?Q?SeyT/WPUTXEHXh8NzX5gRWXQaybcKsgr6pKKtFwzSxJqxJhNGKBbU/NbvBKD?=
 =?us-ascii?Q?QIA1PJwroh/VHbWdx0KFk0Wf/byxDCEChRu1zhZJUV9+e2znRtfuiF4pRkzK?=
 =?us-ascii?Q?vSYOcCOJjxSnvQDVJWCzhZ0y1WR3gT39UMAt78Ijk2XloFouCQhJ1Na15tbg?=
 =?us-ascii?Q?yzpIcEKIR+iwS+371Qd38IWBVlUijD00JovPw82S6DkxwXsckTs3OP2q4QNk?=
 =?us-ascii?Q?cYZPWi1XFubBDtxqZpwqOwxi1KXHLQoM2LD6N+j20vHTAb+4RCQkisOGIZv5?=
 =?us-ascii?Q?95AQwN+IhMuWKalZTwwG/rC1BOagg6y9FNontVFga7HA1/qGYI0erppLODWU?=
 =?us-ascii?Q?WozbZx/q6hYFJc41NfE7h8alrDAXsZpYF75LwSF4zqn74ehhW2sPeijs21Vl?=
 =?us-ascii?Q?Q3qg1qUY1iaXeWPtJ259YbMBRMzthH8SBpH+k2cOwQZorKOMCNfWUerJvkDD?=
 =?us-ascii?Q?gzE1B/t6RyKvPgWHFQdWheM51YHIQY49XsSyxyK9Uz+34gvchozFbu7bSMH/?=
 =?us-ascii?Q?Dr2WiSyEBJJIl4jVJ81LpQoZeBU9lPnPYT+CD90LK4bHgoGGz43OledltYbR?=
 =?us-ascii?Q?gCFcxGgJcjF0H4EPzox0YC0cjVgHE7H3CP5BVmRoGx76xbZb+GDXFZbaL2cm?=
 =?us-ascii?Q?AteCvK+fWYguPVPcGtFeIWU62JnUiH4qfx6HiNnoRGXP1t1a1JtqEbYitlvB?=
 =?us-ascii?Q?LCoKvnqGz93pxJiTCoZPzP2SnFcTA07yhfgZ2KMEkJBDOLCchj5Ad7hRClzL?=
 =?us-ascii?Q?U5eQaqISx481xOIb7ByBdkbydYfpNIVXIAFhF0jkJ7FgJDC0BzDpYHuB4z2a?=
 =?us-ascii?Q?W6kNDf2nPsyCs3mjvtrBQNLs2Ncb4kTDSHIw5SiJ2/lkIRLRRVbw7H0QcEnZ?=
 =?us-ascii?Q?KmqLBowyeOQwpdZbD0htd6HCAsSMJSXCPf1urWbV/pKmbJmTzrBRt0PD1nSg?=
 =?us-ascii?Q?x3ZOZ6aRojP6QPAaDEJIuTG4ztCpzFStf7V0oUd/wcrwjGMQpYQNke7BOdLJ?=
 =?us-ascii?Q?7jou1B9rmSBHlnR7CRSdvSXELn722adOdUGu/Q+IzYmW9XLxFF+nSrtqDByw?=
 =?us-ascii?Q?Z26LjKwz417koOt9MzM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:44:30.0997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34058f83-adcd-405f-54f3-08de1d29d8fb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR19MB8966
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfX2UZt+2VXBeLM
 PuuAZ8J04k8nbCYeCt7QwRl+GbYFn5xOtkGKyJBQj6MHdIakyuy1Ige7yxC6rhqcd1pflA8x70e
 UqKIHWHa4Lf6Kc1fFeP6OjDnt5xgqQ5S/YcCFKuOD9Is5sy6jirFK/PDFJYVYubhtek0AQ/q5U/
 GsXgl063QzHLo1O/9jBJGVOnZY06qazh/QKjc5YJfsU0Lp2Zg/2F7gU7ZtHYQtuTd2Jhzt1MFiu
 k2YqIc8RLqeVi4paycZvSMm5urSKFBWyeNKg7vwbQ/cOpz2EDJz/SSGtuZnLNP752vn8bwUiz4T
 rIBx4AWPHo8L2Dohb1PxSw5KljNTLqy86b5len9T+q7lF5EskdmvmmitBLIOpZGrgWDGkdbUr3w
 4x7YhwrHEIeBYOeUkuN5poZoacGDzg==
X-Proofpoint-ORIG-GUID: aXJDa7hbK8EljjmYSa7hPSVzsTOSIc-z
X-Proofpoint-GUID: aXJDa7hbK8EljjmYSa7hPSVzsTOSIc-z
X-Authority-Analysis: v=2.4 cv=FpcIPmrq c=1 sm=1 tr=0 ts=690c8a24 cx=c_pps
 a=HDWlEWCLQVEuMJptrEg8xw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=s4wzVoPRHm42yPvCsZEA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Use the auxiliary bus to register/unregister subdevices for each
function. Each function will be handled with a separate driver,
matched using a name.

If a vendor wants to override a specific function driver, they could
use a custom name to match with a custom function driver.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca.h                  |  13 +++
 sound/soc/sdca/Kconfig                |   1 +
 sound/soc/sdca/Makefile               |   4 +-
 sound/soc/sdca/sdca_function_device.c | 117 ++++++++++++++++++++++++++
 sound/soc/sdca/sdca_function_device.h |  15 ++++
 5 files changed, 148 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sdca/sdca_function_device.c
 create mode 100644 sound/soc/sdca/sdca_function_device.h

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index d58d602212771..67ff3c88705d5 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -15,18 +15,21 @@
 struct acpi_table_swft;
 struct fwnode_handle;
 struct sdw_slave;
+struct sdca_dev;
 
 #define SDCA_MAX_FUNCTION_COUNT 8
 
 /**
  * struct sdca_function_desc - short descriptor for an SDCA Function
  * @node: firmware node for the Function.
+ * @func_dev: pointer to SDCA function device.
  * @name: Human-readable string.
  * @type: Function topology type.
  * @adr: ACPI address (used for SDCA register access).
  */
 struct sdca_function_desc {
 	struct fwnode_handle *node;
+	struct sdca_dev *func_dev;
 	const char *name;
 	u32 type;
 	u8 adr;
@@ -59,6 +62,8 @@ void sdca_lookup_functions(struct sdw_slave *slave);
 void sdca_lookup_swft(struct sdw_slave *slave);
 void sdca_lookup_interface_revision(struct sdw_slave *slave);
 bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk);
+int sdca_dev_register_functions(struct sdw_slave *slave);
+void sdca_dev_unregister_functions(struct sdw_slave *slave);
 
 #else
 
@@ -69,6 +74,14 @@ static inline bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_qu
 {
 	return false;
 }
+
+static inline int sdca_dev_register_functions(struct sdw_slave *slave)
+{
+	return 0;
+}
+
+static inline void sdca_dev_unregister_functions(struct sdw_slave *slave) {}
+
 #endif
 
 #endif
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index a73920d07073e..e7f36d668f159 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -4,6 +4,7 @@ menu "SoundWire (SDCA)"
 config SND_SOC_SDCA
 	tristate
 	depends on ACPI
+	select AUXILIARY_BUS
 	help
 	  This option enables support for the MIPI SoundWire Device
 	  Class for Audio (SDCA).
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index be911c399bbde..babe3fa2bb3ff 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o \
-		  sdca_ump.o
+snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_function_device.o \
+		  sdca_regmap.o sdca_asoc.o sdca_ump.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_FDL) += sdca_fdl.o
diff --git a/sound/soc/sdca/sdca_function_device.c b/sound/soc/sdca/sdca_function_device.c
new file mode 100644
index 0000000000000..91c49d7389db0
--- /dev/null
+++ b/sound/soc/sdca/sdca_function_device.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// Copyright(c) 2024 Intel Corporation.
+
+/*
+ * SDCA Function Device management
+ */
+
+#include <linux/acpi.h>
+#include <linux/module.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/soundwire/sdw.h>
+#include <sound/sdca.h>
+#include <sound/sdca_function.h>
+#include "sdca_function_device.h"
+
+/*
+ * A SoundWire device can have multiple SDCA functions identified by
+ * their type and ADR. there can be multiple SoundWire devices per
+ * link, or multiple devices spread across multiple links. An IDA is
+ * required to identify each instance.
+ */
+static DEFINE_IDA(sdca_function_ida);
+
+static void sdca_dev_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct sdca_dev *sdev = auxiliary_dev_to_sdca_dev(auxdev);
+
+	ida_free(&sdca_function_ida, auxdev->id);
+	kfree(sdev);
+}
+
+/* alloc, init and add link devices */
+static struct sdca_dev *sdca_dev_register(struct device *parent,
+					  struct sdca_function_desc *function_desc)
+{
+	struct sdca_dev *sdev;
+	struct auxiliary_device *auxdev;
+	int ret;
+	int rc;
+
+	sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
+	if (!sdev)
+		return ERR_PTR(-ENOMEM);
+
+	auxdev = &sdev->auxdev;
+	auxdev->name = function_desc->name;
+	auxdev->dev.parent = parent;
+	auxdev->dev.fwnode = function_desc->node;
+	auxdev->dev.release = sdca_dev_release;
+
+	sdev->function.desc = function_desc;
+
+	rc = ida_alloc(&sdca_function_ida, GFP_KERNEL);
+	if (rc < 0) {
+		kfree(sdev);
+		return ERR_PTR(rc);
+	}
+	auxdev->id = rc;
+
+	/* now follow the two-step init/add sequence */
+	ret = auxiliary_device_init(auxdev);
+	if (ret < 0) {
+		dev_err(parent, "failed to initialize SDCA function dev %s\n",
+			function_desc->name);
+		ida_free(&sdca_function_ida, auxdev->id);
+		kfree(sdev);
+		return ERR_PTR(ret);
+	}
+
+	ret = auxiliary_device_add(auxdev);
+	if (ret < 0) {
+		dev_err(parent, "failed to add SDCA function dev %s\n",
+			sdev->auxdev.name);
+		/* sdev will be freed with the put_device() and .release sequence */
+		auxiliary_device_uninit(&sdev->auxdev);
+		return ERR_PTR(ret);
+	}
+
+	return sdev;
+}
+
+static void sdca_dev_unregister(struct sdca_dev *sdev)
+{
+	auxiliary_device_delete(&sdev->auxdev);
+	auxiliary_device_uninit(&sdev->auxdev);
+}
+
+int sdca_dev_register_functions(struct sdw_slave *slave)
+{
+	struct sdca_device_data *sdca_data = &slave->sdca_data;
+	int i;
+
+	for (i = 0; i < sdca_data->num_functions; i++) {
+		struct sdca_dev *func_dev;
+
+		func_dev = sdca_dev_register(&slave->dev,
+					     &sdca_data->function[i]);
+		if (!func_dev)
+			return -ENODEV;
+
+		sdca_data->function[i].func_dev = func_dev;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_dev_register_functions, "SND_SOC_SDCA");
+
+void sdca_dev_unregister_functions(struct sdw_slave *slave)
+{
+	struct sdca_device_data *sdca_data = &slave->sdca_data;
+	int i;
+
+	for (i = 0; i < sdca_data->num_functions; i++)
+		sdca_dev_unregister(sdca_data->function[i].func_dev);
+}
+EXPORT_SYMBOL_NS(sdca_dev_unregister_functions, "SND_SOC_SDCA");
diff --git a/sound/soc/sdca/sdca_function_device.h b/sound/soc/sdca/sdca_function_device.h
new file mode 100644
index 0000000000000..5adf7551d3a44
--- /dev/null
+++ b/sound/soc/sdca/sdca_function_device.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* Copyright(c) 2024 Intel Corporation. */
+
+#ifndef __SDCA_FUNCTION_DEVICE_H
+#define __SDCA_FUNCTION_DEVICE_H
+
+struct sdca_dev {
+	struct auxiliary_device auxdev;
+	struct sdca_function_data function;
+};
+
+#define auxiliary_dev_to_sdca_dev(auxiliary_dev)		\
+	container_of(auxiliary_dev, struct sdca_dev, auxdev)
+
+#endif
-- 
2.47.3

