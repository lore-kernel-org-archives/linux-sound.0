Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FD827814C
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975803; cv=fail; b=DxEGPulynRMHWb60+zyZoyhmi1Twotz+oaOvYz6SQsPZ16F60H4dQw/zVIM8OH3Y5zdz2UBQtF82Lc9R8k+iWxQFVlYHFUkZFXBFvuVD5mIDfioCCHdNCs5vRrG8+PHIr+zhh77BgjoCYXL3dBTxYp/tjUTRnRQLZttV89V/UxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975803; c=relaxed/simple;
	bh=kVrhsKWwk2SaP8uL5xqTqXuMwgI1AxVpkNVPz/vT4OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G/aa5LqeZ1SjfdyhRHNMdUcVNKicJCDQ7fHZ7IT3ttAwi8NG2GWSY1RCY34HhInsV5sDVm8ooXrhsLLPPoGvf0NGvK2b4WWMIB5ROwYkal09Gz3VsMS6DExld6YoBMIuJKISPUlGyr+0QH1o8DCz8ZBN8x1IAGuZJy9MEUx8/R8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=V+YYlaQL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XkKlN7tI; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="V+YYlaQL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XkKlN7tI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAolp3745048;
	Mon, 20 Oct 2025 10:55:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cgkyWFIFJxX71bZ2xCcTofEhMVQ6VZb50ep9XkluenA=; b=
	V+YYlaQLWc0X8HdbkgsNUEmEEqT2q95RZc078z46rXGV35Ige8FqOjIfFOv5B3zA
	XjF59FRuKOtmFjRMzBdFcVGsssRftXxXXDFOMPtmXCLkGYv1uJs5Dgbni6K/5lT1
	RpPIR2bmTxflgPfHWfcLt3QEdoNqZXjllY6tq1QruJ3nkiHokKTTU1cqLT5ddKyZ
	l7lzzChP0EUzQlvY/ZZAtKupXm2gQwE73HuiohHEMOoUcv1h9YlfKhX6eTFlH6Bn
	zmXl90VTBMAGk/bAlqDOuVoJBXJmPiqUZhCncPTgCNn21NclNAbDGRLU5UNBIPRE
	HxjSuHRx4i3cWJQpChlrGw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020092.outbound.protection.outlook.com [52.101.56.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49wnc4r8dp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgkTzMh2z2FVIngTFABNCBxQJjF5gSG36/FLH14qD+MESBz0pDcj2fgpCMg84iGv/bzBQ8xXhOmS2VgiQ2rvocw7plT0LtIq+34mlJlqmVTfpDPS+kikFxvPAZ9wKgAc+JbJpOvopm8TXwHEumnOV0w9kNB/49j1eIpBzJodycceJ4OtesQIAt0cxGngjXVBOx4mUq+RQrnjmaUUBx9wZpvNaPnSP+Xt9mB30kPgw6/whenaUI14uxQH+PYSsMy6cvaiugxiEJyZjx5bx3dmbnSEMvkJydJTUBCT6ce4T53fG8A8mSwM1UlyAr3qiK5nK1XIVcfWh9BzyJVYOc1J2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgkyWFIFJxX71bZ2xCcTofEhMVQ6VZb50ep9XkluenA=;
 b=nh84y0IQyjGsSg5mL8u01oMC5HRlVtmwqLDWAavbUogwVWFc7LQxykTDdhedQ9Af7G21acwrk1f+7igARPpcdlHOGeLOfg9HFoZJnMl1WaGzrb8l9ovy5GBVbJZkEqsMdVHHW+4zf/x2yHBUAB1lbkVA0NjUR/QspxWMiM5dtdMBp6m9g7VbO5Lg/Ors5kL9cRKLUpx78NU/Skwg3Tfw3XJ69KbhbXeYP+GgcYJVPhGHkBEsn0k2MTf5hnhGRruRGG40U6p45Pag4rHJv7eC6ygLjY0CTMiKO5Ep6iHJblekR/OHEdQeOckdzY6Wf3VgSql5HFggw/5g7uf1G0l7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgkyWFIFJxX71bZ2xCcTofEhMVQ6VZb50ep9XkluenA=;
 b=XkKlN7tImW/OjiWxpGAOVBG2hRKKsUY1wqDJWgVcbMCQVWxKUf+AZQTHvlxF0+hzufsddHbb3WpqG0h3PVYr0R2OB/ozqvh5HrmGh7HWePpSJAMtBRiq72YtY9J/3qtKBUPrhuthd8p24oh/B2q86U3mIf8OAwFFY1xA+fv5NTs=
Received: from PH7P220CA0170.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::22)
 by CO1PR19MB4872.namprd19.prod.outlook.com (2603:10b6:303:f3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 15:55:25 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::3e) by PH7P220CA0170.outlook.office365.com
 (2603:10b6:510:33b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Mon,
 20 Oct 2025 15:55:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BEAEA40657D;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B63DD822540;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 13/19] ASoC: SDCA: Add SDCA FDL data parsing
Date: Mon, 20 Oct 2025 16:55:06 +0100
Message-ID: <20251020155512.353774-14-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|CO1PR19MB4872:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 82f365bc-93ea-4b55-c653-08de0ff11439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m213Gx7pxN3uk2BN2GyPXKInGqv5veFnETdC2BMDVJd0q3aIy3D0NXYuruKw?=
 =?us-ascii?Q?uHoLA5SQzdGKro1inFnPOHJPKsvwaDAM9q6A+4oJ55Db3BoaQFZZsgSzDTM6?=
 =?us-ascii?Q?OFIqn/CwRN9xvWV/9RD1xQ2UMe2ADtBSf4moaJU2af51aVmJzO9/yjUMtaf+?=
 =?us-ascii?Q?beHwUtz5FCRp8OwmLAhmpVdiDkK1O5oDnG3PdvGS3F9QsJDxoZVQ+POSCyyI?=
 =?us-ascii?Q?S/w1ZTxh5Z7Fv2bp8gymSGd8cd4o8XpGFclWRlL3x49s4HHtv+dH+ZhkIdcD?=
 =?us-ascii?Q?Gnhup9LxsBTfyP8rs5G3E+Ei1ywzb6z0qCmqdmISyMk6YEr1PrO0uydPFX6h?=
 =?us-ascii?Q?sKfBsezyNX0w9ODz2+CqKn1qMkXo3LlmVIiyCRS4mJWLKbMWSW7EPoAvqbyC?=
 =?us-ascii?Q?zJbhg+yjtL225yCPyhCcYbM4xi/DmQP3Kx3UcvYEaJlm0KkwgPcmcFwfr8t0?=
 =?us-ascii?Q?yeYWu+N6tbnXyzRg41xx9YPx7i7q6nC1eDt1naJfxily9Etxnyz2nwWWrcEA?=
 =?us-ascii?Q?EZ4rvRmJDh1WFkHC9Ot35QF51fOWwJS5O/NX4bIexffH7QandmvfPWPjUBSU?=
 =?us-ascii?Q?RowP/UxWJK3jnvztV69L0Edpvlzt7tH2FF4+xRFhj/oBL5p9Lk/cOyP8sODs?=
 =?us-ascii?Q?loOU7MK/VY1qVcsJfPvSTtS32tsCveakROPrAJjO7+kcNAcYJWyR25B/RtCk?=
 =?us-ascii?Q?W5E9asS9Kn4dTSd+eqfNKYlsjqr+YIf86/5lHurvAsD1vn6LFYAvpdHRPyvn?=
 =?us-ascii?Q?lkAiOELVTbBRtm/RWAweS/dVyVrwBHEPWTs5XR3lP+Bmkai4T4lbjzBvirbL?=
 =?us-ascii?Q?OW5DlNHyhYwWoS0mMuYmOXDZW15PYnJxORuwG47IV3mPGbL6eADwnwVaRt5R?=
 =?us-ascii?Q?ye0KVR+Re0UmtF/eeifnETNnnPiFfXyAp5Udi1gqJhpJ65dzx1oEAbRFz8ez?=
 =?us-ascii?Q?P1sa+Tpr9oObFM2BD8g3V6xJ1VngXMOIE/1cqDaxmCguglIZywXL8CpCmaR9?=
 =?us-ascii?Q?i9h1hKZia3kd8Z1lq19aJiDS6E4+AlpbHxQxeTBSB4RMjdQWp3uvwg/w47YX?=
 =?us-ascii?Q?l3vf7oUDTF6PZQvzzGNoLRLFXFQUa1wMZAOysITsckHDwTbaZYRK/O7p1IJC?=
 =?us-ascii?Q?gFD4kG+Drxk0l7TdjFxRaU6cL0sFR3a9kbN5BX5yzEA3AXD2t9lsfMnYlyd0?=
 =?us-ascii?Q?kcwexi+BWG+y5yWlZskn8T/F2V1M28fPH1Y+vWuVGQPruOdeZoetp7TXjlkb?=
 =?us-ascii?Q?UY7iQHNXRgR9NqIjvHUaDbFglV6Xtrh+5I8YaBCbUgqtZlc+/J9Hzzndbtao?=
 =?us-ascii?Q?gp2y40W7ayGNvFlS6ynsXnpRHBdfRdNpYTMZARNXyj1XtRr20cgLcSbiTn9L?=
 =?us-ascii?Q?3qUQnSKomDokLs7xT2gRbLBRlgg/Dl+8mxIgRLa0iE3JwFSbPNF703pKu4PI?=
 =?us-ascii?Q?CRF3ghRGsbrme2S97PcJwd8sVpZbBaW46zM++K9Jk0FvTuPaYqAgOXB70iTv?=
 =?us-ascii?Q?cp+AcGnIx8sTAqaoZKr4r8AqWpx1tisPCcIfWD6IzoXHsoX0TUS0YztgnwBx?=
 =?us-ascii?Q?T3iN36ACoK+aaJfC4xI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:23.1308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f365bc-93ea-4b55-c653-08de0ff11439
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4872
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfX5/3Ibtv94Xeq
 g+J7xCeTGvgE6E4iLJ+K7b1WUgqN6Vt6c6w8lEnFnVmblDJ4EfhUyNEcM3/QTFwdSfjvd+6MrhQ
 iqlPmE0Vn0vExFxwjPFxhFPOQ7kRrI2AgIFRkoYOZnj8XLfKpEhoxyfJaJ0oYASc0Xw6/xrQlcL
 nRlEokkpn4UEjevF6BK2/jThuu+K+iHsXmL5VkMHqSQhoki37TwYwvgFzGXldqCsGAGgulnL6Ro
 xh2XEkEtyU+58EUc1hO4J1kPnC0My9+Re+uig4Z/LIdxMr9r5QBp9wWSiRRJ1VXg9Ypoeans+xa
 WEuqZ3h1I0EwayYSGHZ9jQq+g60danJRv5WzhyC9iZl9JJAClqeJPAMgSUapsxPFFv7ds3ctUn6
 qE+2EKyqS2oJfoMJIU3n0o4gDV0e0w==
X-Proofpoint-GUID: qSD2VyPgU-rPfi0cht6O874O9htSZ6rH
X-Proofpoint-ORIG-GUID: qSD2VyPgU-rPfi0cht6O874O9htSZ6rH
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=68f65b74 cx=c_pps
 a=Bu43dWwcgNc33qm5GBDoZg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=QyXUC8HyAAAA:8
 a=gdKTTE99PY5FDwdXciEA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Add parsing of ACPI DisCo information specific to FDL (File DownLoad).
DisCo contains a list of File Sets which can be requested by the device
and within each of those a list of individual files to be downloaded to
the device. Optionally the contents of the files may also be present in
a special ACPI table, called SWFT (SoundWire File Table).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca.h            |  5 ++
 include/sound/sdca_function.h   | 40 ++++++++++++++
 sound/soc/sdca/sdca_device.c    | 20 +++++++
 sound/soc/sdca/sdca_functions.c | 93 +++++++++++++++++++++++++++++++++
 4 files changed, 158 insertions(+)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 9c6a351c9d474..d38cdbfeb35f5 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/kconfig.h>
 
+struct acpi_table_swft;
 struct sdw_slave;
 
 #define SDCA_MAX_FUNCTION_COUNT 8
@@ -37,11 +38,13 @@ struct sdca_function_desc {
  * @num_functions: Total number of supported SDCA functions. Invalid/unsupported
  * functions will be skipped.
  * @function: Array of function descriptors.
+ * @swft: Pointer to the SWFT table, if available.
  */
 struct sdca_device_data {
 	u32 interface_revision;
 	int num_functions;
 	struct sdca_function_desc function[SDCA_MAX_FUNCTION_COUNT];
+	struct acpi_table_swft *swft;
 };
 
 enum sdca_quirk {
@@ -52,12 +55,14 @@ enum sdca_quirk {
 #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SDCA)
 
 void sdca_lookup_functions(struct sdw_slave *slave);
+void sdca_lookup_swft(struct sdw_slave *slave);
 void sdca_lookup_interface_revision(struct sdw_slave *slave);
 bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk);
 
 #else
 
 static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
+static inline void sdca_lookup_swft(struct sdw_slave *slave) {}
 static inline void sdca_lookup_interface_revision(struct sdw_slave *slave) {}
 static inline bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk)
 {
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 6dd44a7a8a359..f557206cec83d 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -13,6 +13,7 @@
 #include <linux/types.h>
 #include <linux/hid.h>
 
+struct acpi_table_swft;
 struct device;
 struct sdca_entity;
 struct sdca_function_desc;
@@ -1338,6 +1339,42 @@ enum sdca_cluster_range {
 	SDCA_CLUSTER_NCOLS				= 2,
 };
 
+/**
+ * struct sdca_fdl_file - information about a file from a fileset used in FDL
+ * @vendor_id: Vendor ID of the file.
+ * @file_id: File ID of the file.
+ * @fdl_offset: Offset information for FDL.
+ */
+struct sdca_fdl_file {
+	u16 vendor_id;
+	u32 file_id;
+	u32 fdl_offset;
+};
+
+/**
+ * struct sdca_fdl_set - information about a set of files used in FDL
+ * @files: Array of files in this FDL set.
+ * @num_files: Number of files in this FDL set.
+ * @id: ID of the FDL set.
+ */
+struct sdca_fdl_set {
+	struct sdca_fdl_file *files;
+	int num_files;
+	u32 id;
+};
+
+/**
+ * struct sdca_fdl_data - information about a function's FDL data
+ * @swft: Pointer to the SoundWire File Table.
+ * @sets: Array of FDL sets used by this function.
+ * @num_sets: Number of FDL sets used by this function.
+ */
+struct sdca_fdl_data {
+	struct acpi_table_swft *swft;
+	struct sdca_fdl_set *sets;
+	int num_sets;
+};
+
 /**
  * struct sdca_function_data - top-level information for one SDCA function
  * @desc: Pointer to short descriptor from initial parsing.
@@ -1351,6 +1388,7 @@ enum sdca_cluster_range {
  * error should be reported.
  * @reset_max_delay: Maximum Function reset delay in microseconds, before an
  * error should be reported.
+ * @fdl_data: FDL data for this Function, if available.
  */
 struct sdca_function_data {
 	struct sdca_function_desc *desc;
@@ -1364,6 +1402,8 @@ struct sdca_function_data {
 
 	unsigned int busy_max_delay;
 	unsigned int reset_max_delay;
+
+	struct sdca_fdl_data fdl_data;
 };
 
 static inline u32 sdca_range(struct sdca_control_range *range,
diff --git a/sound/soc/sdca/sdca_device.c b/sound/soc/sdca/sdca_device.c
index 4798ce2c8f0b4..405e80b979de8 100644
--- a/sound/soc/sdca/sdca_device.c
+++ b/sound/soc/sdca/sdca_device.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/property.h>
@@ -27,6 +28,25 @@ void sdca_lookup_interface_revision(struct sdw_slave *slave)
 }
 EXPORT_SYMBOL_NS(sdca_lookup_interface_revision, "SND_SOC_SDCA");
 
+static void devm_acpi_table_put(void *ptr)
+{
+	acpi_put_table((struct acpi_table_header *)ptr);
+}
+
+void sdca_lookup_swft(struct sdw_slave *slave)
+{
+	acpi_status status;
+
+	status = acpi_get_table(ACPI_SIG_SWFT, 0,
+				(struct acpi_table_header **)&slave->sdca_data.swft);
+	if (ACPI_FAILURE(status))
+		dev_info(&slave->dev, "SWFT not available\n");
+	else
+		devm_add_action_or_reset(&slave->dev, devm_acpi_table_put,
+					 &slave->sdca_data.swft);
+}
+EXPORT_SYMBOL_NS(sdca_lookup_swft, "SND_SOC_SDCA");
+
 static bool sdca_device_quirk_rt712_vb(struct sdw_slave *slave)
 {
 	struct sdw_slave_id *id = &slave->id;
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 6602727c73f73..b2e3fab9bd959 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2010,6 +2010,95 @@ static int find_sdca_clusters(struct device *dev,
 	return 0;
 }
 
+static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
+			      struct fwnode_handle *function_node,
+			      struct sdca_function_data *function)
+{
+	static const int mult_fileset = 3;
+	char fileset_name[SDCA_PROPERTY_LENGTH];
+	u32 *filesets_list __free(kfree) = NULL;
+	struct sdca_fdl_set *sets;
+	int num_sets;
+	int i, j;
+
+	num_sets = fwnode_property_count_u32(function_node,
+					     "mipi-sdca-file-set-id-list");
+	if (num_sets == 0 || num_sets == -EINVAL) {
+		return 0;
+	} else if (num_sets < 0) {
+		dev_err(dev, "%pfwP: failed to read file set list: %d\n",
+			function_node, num_sets);
+		return num_sets;
+	}
+
+	filesets_list = kcalloc(num_sets, sizeof(u32), GFP_KERNEL);
+	if (!filesets_list)
+		return -ENOMEM;
+
+	fwnode_property_read_u32_array(function_node, "mipi-sdca-file-set-id-list",
+				       filesets_list, num_sets);
+
+	sets = devm_kcalloc(dev, num_sets, sizeof(struct sdca_fdl_set), GFP_KERNEL);
+	if (!sets)
+		return -ENOMEM;
+
+	for (i = 0; i < num_sets; i++) {
+		u32 *fileset_entries __free(kfree) = NULL;
+		struct sdca_fdl_set *set = &sets[i];
+		struct sdca_fdl_file *files;
+		int num_files, num_entries;
+
+		snprintf(fileset_name, sizeof(fileset_name),
+			 "mipi-sdca-file-set-id-0x%X", filesets_list[i]);
+
+		num_entries = fwnode_property_count_u32(function_node, fileset_name);
+		if (num_entries <= 0) {
+			dev_err(dev, "%pfwP: file set %d missing entries: %d\n",
+				function_node, filesets_list[i], num_entries);
+			return -EINVAL;
+		} else if (num_entries % mult_fileset != 0) {
+			dev_err(dev, "%pfwP: file set %d files not multiple of %d\n",
+				function_node, filesets_list[i], mult_fileset);
+			return -EINVAL;
+		}
+
+		dev_info(dev, "fileset: %#x\n", filesets_list[i]);
+
+		files = devm_kcalloc(dev, num_entries / mult_fileset,
+				     sizeof(struct sdca_fdl_file), GFP_KERNEL);
+		if (!files)
+			return -ENOMEM;
+
+		fileset_entries = kcalloc(num_entries, sizeof(u32), GFP_KERNEL);
+		if (!fileset_entries)
+			return -ENOMEM;
+
+		fwnode_property_read_u32_array(function_node, fileset_name,
+					       fileset_entries, num_entries);
+
+		for (j = 0, num_files = 0; j < num_entries; num_files++) {
+			struct sdca_fdl_file *file = &files[num_files];
+
+			file->vendor_id = fileset_entries[j++];
+			file->file_id = fileset_entries[j++];
+			file->fdl_offset = fileset_entries[j++];
+
+			dev_info(dev, "file: %#x, vendor: %#x, offset: %#x\n",
+				 file->file_id, file->vendor_id, file->fdl_offset);
+		}
+
+		set->id = filesets_list[i];
+		set->num_files = num_files;
+		set->files = files;
+	}
+
+	function->fdl_data.swft = sdw->sdca_data.swft;
+	function->fdl_data.num_sets = num_sets;
+	function->fdl_data.sets = sets;
+
+	return 0;
+}
+
 /**
  * sdca_parse_function - parse ACPI DisCo for a Function
  * @dev: Pointer to device against which function data will be allocated.
@@ -2058,6 +2147,10 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 	if (ret < 0)
 		return ret;
 
+	ret = find_sdca_filesets(dev, sdw, function_desc->node, function);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
-- 
2.47.3

