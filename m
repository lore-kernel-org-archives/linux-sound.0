Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5A4264628
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807208; cv=fail; b=Kzi2bdpgp1/k6BKhA9KDaxbNQ+3IZcCqRSZ2A5EOYVkg2rzWhKLzJEVDgqIdoOHi0XDmEooSx6iNCcYWHSqIP0ldDYI4AEP8883Z4fgAmjriEhP/JTzaX1WvKZktED8MnBGK4WliNpJmOYajl+6VCaJlveG0Qt1pZkQHGqrnmoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807208; c=relaxed/simple;
	bh=oVfq86MQxYZIQiS3fQNjWDRF8wbix3QCLrzwvfOUlfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qxErQwcnfqIPquPwpHjD4/ieFMTgBFq5RZPkqOv7vvLks701Dmwh0VRP++bl4wwGbuP4jMMOkmQgzjY4pP+DqMyOHvJ1dEpI+vLYE9dQiQkWJhsz5D8A3pu4ewpIvmgePZmaC0nvDXpMU1Fvdi1DrxwrR6A8HPEcQV3Z8lHptpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YJYU491N; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=VESKAbA4; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YJYU491N";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="VESKAbA4"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58PAN04R1391147;
	Thu, 25 Sep 2025 08:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9MBzxFDw0LUzhQLWfJJ1arvKqnIygaxtDc0ewA23BM4=; b=
	YJYU491NWSN9Qnp6B64LtrgcSr2ztnuUbW28pBOjUSeyjvqLVX71W0nH9S2J+q82
	noThovCOoaKZRBjWD9Jnsx4cbZ9sH8ncoaoUXLRTmt6/DXfW7B//6qfYafu8eC0x
	zp0t2Mtwb2yGT9YxCMRnh3JZOCFQ28Opm1fBJz1A9KS9cZk5lsdVHets/JBVuKja
	v130wy+S3rRjq5H5jvAWph5oZj/kLkwbbzv6hX9bIQiFoiiT7x7wuBXrMtIzfjya
	F43Nrk5XcRaXQJFuMloajaNZG1K3CGLIHZGPZBfH+9zBLlWfkARIcrLXPY6aY8Ie
	pBEONMoMLrGonCdiurtMkg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021114.outbound.protection.outlook.com [40.107.208.114])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49cjmdses2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 08:33:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIZfXY9YHgUWSoItVNxtvDkixSNmGfIXg87VNPTZM/Gr+0iUqFSxevWJK9f1QMs16X9lFYDMGMFXhxhn+2VnQ6U+/EjNMAL/P8emNdQAOXGSogS0ineJYA+oirAnuAiLi28KMTyZY7p8qdVQb4h5NOifKHywPsg+YJcy31gboXCiFErwk0a9nqcouo7HTT002QXuIaoKEJaccewEByyd8uqlGSY+WN4oslBwoXmSGnzaNpoFXEreIMsznJSLNgssK6EhcAJXOmAown1kIcgJWWawZlyt77ZAc6bmcrQEiR3FLa0AcjrzzUQChB/2+g2NzVgy+yLo4fFZ7Am18ov4Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MBzxFDw0LUzhQLWfJJ1arvKqnIygaxtDc0ewA23BM4=;
 b=qSvfHM4E2bAhjax0+VPVx6veAQfXl+s+Eis/5NZOJTQcQrS58Fle35wP71O6f2V0GR9Hl6OXdm4YOox1fBGCN5SRimAHLIqghhL2U+2033+A0u1RjRsDohUJXBFwavQybqiGa0khqAcVuoS4Q9GUCQVygpxKpgOW1r5eofYc6iiC+php7NJlsulwf03+TaReHAY7eNyqwYbD0Hn/emvk74AnR5j+4zOG8FdtQjRyfrnJP1xa90GPjGeL7m9XBPkYyjVyfqxhAqQ+nNwJNJ7u0Q/Zn9RTHHXPuJAngkhFybgZou9gYp7NrgqO8cFMjMEkvU8iy5EQoVBS0C4Rzvho7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MBzxFDw0LUzhQLWfJJ1arvKqnIygaxtDc0ewA23BM4=;
 b=VESKAbA4o0m0TFr4e+p7RkNjw1L/TnbzJ8ZIOQC98ivNhhnE0QzYXDTF9pDAGsNgfhX+5lYWfngioi4sp2XPLOusXt2ycHWO65A5L6JX2rNdV+Zdi6q8wotQc9hjNF9oqrC8rSnTGFvbS75YPM/7X8XQOs6FDoR3o5D/L7YmLxM=
Received: from SA1P222CA0111.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::8)
 by LV1PR19MB8910.namprd19.prod.outlook.com (2603:10b6:408:2b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Thu, 25 Sep
 2025 13:33:14 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:3c5:cafe::9d) by SA1P222CA0111.outlook.office365.com
 (2603:10b6:806:3c5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 13:33:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 13:33:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CFB35406555;
	Thu, 25 Sep 2025 13:33:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ABA3582024D;
	Thu, 25 Sep 2025 13:33:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/4] ASoC: SDCA: add function devices
Date: Thu, 25 Sep 2025 14:33:04 +0100
Message-ID: <20250925133306.502514-3-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|LV1PR19MB8910:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 25967f96-ac5f-4170-953a-08ddfc381331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?plbNMAj79QaryWIXpr+jaBjN5dEIAQnXnQajyTWZJQTLYPyycyBqsUHj4brN?=
 =?us-ascii?Q?6bj5E0HF9DdYGOE0MePOvNrwZVqyAOXkE0UV0v0BNioClG15jd7Gkm5Rz607?=
 =?us-ascii?Q?639Z0dfjQfXGNbfPqAaw7KyrVfBVsDNSu0mE8yAeP+xCyh56laks9oNjK2nU?=
 =?us-ascii?Q?tCjvoO8sVvWKtS5SYLBhrYuokBB1KZsoD9a6oFywP8HX2EPCuBgPfqp9u+GG?=
 =?us-ascii?Q?62oa/qYMSDNHLugwClE/Ep+YwqNtSgSdZbfyUa7Zr3yc1eNAd5Gi8WOzkn1m?=
 =?us-ascii?Q?UHXrIZRxicUpP3sL9uddA5+DGJXFGuQeTwRikpxIxEZcjf0yimzQVg8WxPsc?=
 =?us-ascii?Q?TgA/7RajpL9AKWAqQFajwh+GhTTxbMpc+rA+z+0BOvKfNvzAeW4Z/5TuN6NC?=
 =?us-ascii?Q?kBndn2QbltnFgL6GQvIa6qNRyCLXWpwywSEdysJBYFUkOhIgN7oZ85mt1K9g?=
 =?us-ascii?Q?gjim8ftdlsqgjT1iD+uffz5xamMt33E8nusU5+2bISd7DiRjur5cK8JVSiAf?=
 =?us-ascii?Q?ZXVQQXWhdmpMfk3FSTsAOj7yH5RnNpOe9GxTRD4cyWUgZKUvB0WsDa+BMZQY?=
 =?us-ascii?Q?7dsvkPfZ8p0yUxCIT6smAxM+Bm1kbI/fwIsBHYeV06Qiu9gkxWwfDrtiifJy?=
 =?us-ascii?Q?raxakAzJRWlFD8geKnXLfdXg3MJabFbLsrZRiqHb5qOnitFeUzIc0GtwSiYw?=
 =?us-ascii?Q?V6fO2dB044ETbTlnLIGlKvnbochHUxUtyZqqAMi9Pw2oo6Q0uxSIJ14QToZN?=
 =?us-ascii?Q?bZaXEcdDxTGCvyf+Qdd61B2mF4k6IFzdgV7Kl9EHHb7nNy/gTVO9N1vKuoCI?=
 =?us-ascii?Q?chN10O2zgN7r/75Fc/LSJJNjaguTsLWAZhjZ8DjtIZN5tU7sD/Up8zw0h0Z1?=
 =?us-ascii?Q?LvcdwwOYyLuOxpVuJi+11rwd87p3glDHRilvlFoxE78KmdbaB2UUCFgq6yl8?=
 =?us-ascii?Q?UCbQIJKzB8MXEFmPyEpP1NHtquV4YTSgioQ+vjqCadXt4GD1jYd3otpspnI3?=
 =?us-ascii?Q?PuuwgqyzjZQNsLaWNR+flPcLxWU+8X2tN1+DAcaS81uKm57E4/Y9c/lnGxcl?=
 =?us-ascii?Q?TGLty/4NG/5b/NuItgA3Eu3VSl+z6ByQghYAOla65Qta4tbZm8u7WwdSqjIa?=
 =?us-ascii?Q?idELTqk5SBakxmQl+qo36bWsWHd0Y3GWz+sUIr2/ujwjEu7KGupJ7aOrb3uf?=
 =?us-ascii?Q?FZx5z6gqg6Clq2W/bE+SVz6hExRjDn4VLV/mYMRv7UhARX8NgThE7op1DsFg?=
 =?us-ascii?Q?r4rSwAQlnENPhRw51G0uTHpNSevZxZn44lWDnwjsaOQ1d1fgvvFkH177THOc?=
 =?us-ascii?Q?HRf/NInX2o6fzj3BoKC/QcQKbpx2c6xMYLU/D/znLtVf7ggjtDIcTL2xmLA2?=
 =?us-ascii?Q?zdCfbSNlRmELdjZB0Fs+mK5k4VEALFQacj7D7+fWFcsWrhuhria17VBqOiGL?=
 =?us-ascii?Q?STJmTpd4pTzCehT6DkovPrcXcHp544PC2Y4grIpWBJzZrJ61kfQrLwhGg6ut?=
 =?us-ascii?Q?Gbtin4FPtud0XIFTX6tw52iCLLJxizk9Tg0AfIfoThtGKkl3qi6CwYBvmvi8?=
 =?us-ascii?Q?lKSc5mAIQRmUd4Oymng=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 13:33:12.4095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25967f96-ac5f-4170-953a-08ddfc381331
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR19MB8910
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEyNiBTYWx0ZWRfX6QhiGMb3UqiP
 Mpdw83dKYQM9PWVwYvhT2NPopYKtO4BWpUxKlbavq9/MdP491um9IAr7ZlQVmfnoZIbodlH9/kG
 +LKuo94sNmrWfTO82vbPpVtypARLtKpcVwRGDPEzGs2f/vXwJeTDfJsy2jhDSFaUHebBndTnTCO
 62p+ejVeD12l+iDrsNGm9taMwZGjYRtUvLETG8lUA60zHKmqmUvpvZs9JNTh8wnGRjH8l65PD7h
 0Afqvt9Xg6QPv8G3ipD8BlOYuQEWJV4HIzf9gXlJ11xu7LzIoNSk1oiwnwBlIw/g6DZoAGAzKax
 k4QqUAu4Fnnfq4VthN1SCNj4DCWk2VMKRKxqlB/fH3j5qSwh2kyurIwIwl1U64=
X-Proofpoint-GUID: b8tPWfhMQM_UJhwHde427i5ZhC3glyvb
X-Proofpoint-ORIG-GUID: b8tPWfhMQM_UJhwHde427i5ZhC3glyvb
X-Authority-Analysis: v=2.4 cv=ap6yCTZV c=1 sm=1 tr=0 ts=68d5449c cx=c_pps
 a=rSpWrHmMTF20an4ACDPPuA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=s4wzVoPRHm42yPvCsZEA:9
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
 include/sound/sdca.h                  |  13 +++
 sound/soc/sdca/Kconfig                |   1 +
 sound/soc/sdca/Makefile               |   4 +-
 sound/soc/sdca/sdca_function_device.c | 117 ++++++++++++++++++++++++++
 sound/soc/sdca/sdca_function_device.h |  15 ++++
 5 files changed, 148 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sdca/sdca_function_device.c
 create mode 100644 sound/soc/sdca/sdca_function_device.h

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index d38cdbfeb35f5..ae369287797d4 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -14,18 +14,21 @@
 
 struct acpi_table_swft;
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
@@ -58,6 +61,8 @@ void sdca_lookup_functions(struct sdw_slave *slave);
 void sdca_lookup_swft(struct sdw_slave *slave);
 void sdca_lookup_interface_revision(struct sdw_slave *slave);
 bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk);
+int sdca_dev_register_functions(struct sdw_slave *slave);
+void sdca_dev_unregister_functions(struct sdw_slave *slave);
 
 #else
 
@@ -68,6 +73,14 @@ static inline bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_qu
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

