Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53702F5338
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797664; cv=fail; b=CNlk2NRP9GRbb6U+5DMzCr+vSnpnp+iSMjhMwxdOGZKbFKR5Qi9N2zIotWB67bNBK98+dEyiV5OSIiQAsDyXjmgRy4iXe96eKBUFJf6oDLuvmaiue8vVkn+c5jn0pFXXo5URXbnIBa6v5KlGaoa9HFw4LsGmAXIF0xSIEJZOJDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797664; c=relaxed/simple;
	bh=OW7VRfoYdudgRiB9bk/DnMGAPk2xCynOeYZT+xB07eM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eVBPLxhpa30rtvdTV9kfj5C0lrhHsP/0PYMqRtqxFzawAbl/H9wZlDMMrGN9bkyHLojoCShJIRoPNHmzKD8ua2TC62TX1E9S5w0CEiMrxV9JK8ZdiAQMGI7h+k5mRfuWaTIL1D5+ARKHgYsaDXVCkmfUtciOPOoKFarsIHHfuJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QHt7Drz6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=k/uMgVWL; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QHt7Drz6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="k/uMgVWL"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P4cfHg2734368;
	Thu, 25 Sep 2025 05:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uk3KPklrbNmsCxleEv24MOjk1Vy9pDRWRyVyK+TaKnE=; b=
	QHt7Drz64pqnG3pOcHqxueUf+fOQRJASqvTN6ACrDzWaT+bJR155lHhas2H57grc
	VXfiHKmmPitb84QfuiXlfSkNMfOs1wodcrOV4SGgRkKJ42RXjhiK4Wp1ZLQB8db2
	/5aadylZz8dzE4A8P1b+TCH/CoVTOPpYDsevC2K8vVqoSAqs8VM8wwBfme4G6D8x
	webgpWVp6ozVm88Fjrsmjl2HC1asedoVhvYklSnpv5bYrd7Csq4n8hKaOphvI5cr
	ivpoPV3XKsm/a86BBGFh3vggz1jTpi/fC0zMEwYVHhsWCQ545PSWm2h5eSZEncxJ
	4fiTvnZJDEQ/fR+lf/3nfg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020097.outbound.protection.outlook.com [52.101.85.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49cjmds8x2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3u71606ghy3p0P2Ugt7mLWUDhosm8wSEkvF/VpERX3jvG7fC3DMx1qWdEMxMlXzUwX/G3i/qFb2LAWXxh3U3GYcwZsj/fDFz2OeI3x/Z7shVUJfKHwPdi03idXurqrG04ZKF75p0W4GVYPmcNq2aEofy0uJAQds6YMAa3+VFdgZ+uhQIh5l52EMkygqdHd/dfQg5b3Rt9Gl7XKsQtrIMRIhUFo67mcVflHLrz7O7QyYz0LvY3gSo6kslpoGxxCEkNj9W9WDWeRbOL6J/6hhSEgc+A96ymw607ez/UZEPFZjqdHENuXnFbr+SoozWqRJsWATrC0t6yxKaxAfcmPA/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uk3KPklrbNmsCxleEv24MOjk1Vy9pDRWRyVyK+TaKnE=;
 b=fpDxPc18ZKumjhtBUvGyUxl0cqdxfPS3sfsaFQAg98zUID1vbPiLd9Oyvj7N096E8CcLrzQpRC1uLgzRCtm9O/E1rr5EnqjcLYFcrV9+Rw5Ku15i/xq7rDkdGALqwgfJiq1FH4MjJDzzYVlMb1gcvJUsp/kBa3S3tqnqzluu/XtO4u/qKWOL+oxVhP9z5xGCTKss7ons4v0TN/CdxniNLWgxjx/gSGJbgLuLpNTZEQgOz0Tf0yRMu7B7/6g45ZEsjEGANfBgXEl7ttnnZ+8kkD4Q7FnffGDfyC9dNEPgoAhtG7cS1APekV8DwEjPrzbdE+oSe8hKd29WROAhEf1njQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk3KPklrbNmsCxleEv24MOjk1Vy9pDRWRyVyK+TaKnE=;
 b=k/uMgVWLoZvop2TXlM0arvilri411j9RoywinN6Z6K/jhkfXkRlvgludqb723KAvSFIEFVXbsREosMfdAWPwXkyzomoDUVWRexYS5Kwi3h9vRHltuHvZeJ08yi6o3C+qg1wcQH7qTVUV5A5Bfi574cyWaOSieidKbiXFkJmlMto=
Received: from BYAPR02CA0027.namprd02.prod.outlook.com (2603:10b6:a02:ee::40)
 by PH3PPFA6A2CF0AA.namprd19.prod.outlook.com (2603:10b6:518:1::c40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Thu, 25 Sep
 2025 10:53:52 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a02:ee:cafe::64) by BYAPR02CA0027.outlook.office365.com
 (2603:10b6:a02:ee::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Thu,
 25 Sep 2025 10:53:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 65E1D406569;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 51F55820249;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 09/19] ASoC: SDCA: Force some SDCA Controls to be volatile
Date: Thu, 25 Sep 2025 11:53:31 +0100
Message-ID: <20250925105341.194178-10-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|PH3PPFA6A2CF0AA:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b70588f7-fa12-4ee2-19d5-08ddfc21cfcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EbQ7F2FoG75ykUgDPG/R1397B9VG0gvinKfXbINgnR1vxIwVohS9aWU1LkjF?=
 =?us-ascii?Q?XNHdE1zmPk1G5aa/9pgh4v59EdmK1Y/LL5QgpLLHHZDMI/0lnT81/g+JVg4E?=
 =?us-ascii?Q?Zo15geNNdujqLsdcKkRHyPPM8U3yq7lVpxGaHqq4+8ymw4uM1wm5zxgoPQDw?=
 =?us-ascii?Q?mdHLRwfbmrft04FSZFsjatIJ6aT1tSHYTfCsj/lTPqE8RnrS2hMibKVThff6?=
 =?us-ascii?Q?ITnCxTQAiAjpicnP1wI3GzvwbFio2uwpAk3+RgZjyxmzaj/f0K11QgCfhTQI?=
 =?us-ascii?Q?yXTqGMnaDfIuRSoRpSdwD3e1skNyqJ9QtDOrPqJXQtukPs65+DqEucpQCQb3?=
 =?us-ascii?Q?Hp3JW0RWZ0JyeJwzzcNcWDxOadV1zUeYF02agLtvD6xs7PU7Oas9UTKMx/aY?=
 =?us-ascii?Q?R99SGOT8pJqig7fEZRFVGeT+uulGTMFjXP/amPuNRMeeCBJCtmsqxzmPwM/E?=
 =?us-ascii?Q?nQJdCGyzNYQwZdDupZdDJc6Ztv4nR2eCeCbKO4KPx9ykQfe1TlMrBV/ZfoZv?=
 =?us-ascii?Q?uOwjnbIyi3OzxkEshvyY5HLYaZk9OLX173sxwDbKJKGCayTFJO38lMfIAz/3?=
 =?us-ascii?Q?0NBlten5j2DpucZc5WOvT91KvrZYE700aDrxGjI2VqaV5OZguD7N1m2Cxgy3?=
 =?us-ascii?Q?74FBxEO4WLy5w1Cym9UXjfEt0pRzm2UEffsIfk968YEPL5j0twHu6W3eX5N5?=
 =?us-ascii?Q?Sn0oDj1SldOZRKyVRZCEA+N9Lq553Q2d7E5G67Ml6KB7zq5wpwswz4ib7iG4?=
 =?us-ascii?Q?s0BhkLlE/Un5I6SC/P8r1crF5m3Yp6em9qHdPH1jvaQT+BOfljCg9NO36htm?=
 =?us-ascii?Q?CBCCBbhofpWxWIjkw3xr9z3Vd8O0hF88MWdrhRjuwVAEz3VbyZRp7Sy+MVzC?=
 =?us-ascii?Q?WudNLNo5eqEMm5yCY4XTeYWpC2V64vKtGb5f4gSb2q+G1DNJt8HQGqh7zv1+?=
 =?us-ascii?Q?u2b84l/y5EPbXE8mgZfJBrQuadTuOkUbhOVLvxPODNzrpbqVyJp7ZlHRpzqV?=
 =?us-ascii?Q?2ZJxoX442rzHQNQzkxit7WtCdZf8m/oWPHK9aQ/dHureqGSUDtl7T7AW8/UB?=
 =?us-ascii?Q?NAHz7rRSiGQLoHnZ0YCBycIM3+O7hNsEDI4AZrQub4JdC6EcWZ63ZR/0w+nJ?=
 =?us-ascii?Q?2CFw5vJ+XRfqUsAO/LUyNKqjk7G/9SpRlCfofmE7/KHeU1hwBgFzQGUqnhGg?=
 =?us-ascii?Q?mTlGnyX3nrhW83Xmk6C7AlMxonj1l647S/UAfIHgay1p7mnpHoqjUsky9pPd?=
 =?us-ascii?Q?1164p81pWSsdVu/RuonTO2GiY1BXslZOtyJQIRydWkG855CPtFwUfPIUfnfW?=
 =?us-ascii?Q?JCxoeZz+brcyLiNUNl+sSopaDd0ZDLeyUTz0amj8SbJ6f+erC+Yd6n8FhfaB?=
 =?us-ascii?Q?1hJhzFB+8TysMWB78Z4Qp3ZMtR2cTNll2UAlaUaBg9js16LC1SP83426YcgZ?=
 =?us-ascii?Q?dno7jORYqFsCABYsS6d+Wr0b+f242r4d/0v4LFA4Lptu/vL+zt6dF5//xnL4?=
 =?us-ascii?Q?EW9jK5hCYRO/UOg51PuvwEp+C/8Bxp092blm?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:50.3626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b70588f7-fa12-4ee2-19d5-08ddfc21cfcd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA6A2CF0AA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfX2c0y7MEaZx0F
 rAIh5LNJVhoLMSWbj3FVvuuySRxhZ5Th4j8tu1wbRs5+Odr1A/+K50/zTL0gvOt5DGext3ukxvZ
 CBw6x+8o3nB9pO33pQhneeVD6QhCm4aVvxVChco1Fx5Qv9/o5HXeRfMuYxRFavxSU5oYsda6Bfy
 q0odbu/cF78K0j4KYb+YdY48ZASpuvMdRcsYyBA389/EizFCjl3H+mVwkOtaoR8adVMH44i24XQ
 75VZa+EV16qOuL9OIHwT+naRkfggF3ZMe6oyvkQSG5EURx5dc0cqFQEc57zwtdkxOAObHUEFK8K
 RqAF35aLSxeQOvX9l41nrmNzU6J6L1hs87jTWziXkpQPT0On2psASMAfGa1E2E=
X-Proofpoint-GUID: PQpdX6wlBDP5S3WWXA6E4M0n9nMV_OgK
X-Proofpoint-ORIG-GUID: PQpdX6wlBDP5S3WWXA6E4M0n9nMV_OgK
X-Authority-Analysis: v=2.4 cv=ap6yCTZV c=1 sm=1 tr=0 ts=68d51f45 cx=c_pps
 a=WbwzdlnB7+o+U6PX47Rpew==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=ouDB0LvNsPAk7ljP0nkA:9
X-Proofpoint-Spam-Reason: safe

Whilst SDCA does specify an Access Mode for each Control, there is not a
1-to-1 mapping between that and ASoC's internal representation. Some
registers require being treated as volatile from the hosts perspective
even in their Access Mode is Read-Write. Add an explicit list of SDCA
controls that should be forced volatile.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Reorder controls by entity

 include/sound/sdca_function.h   |  1 +
 sound/soc/sdca/sdca_functions.c | 58 +++++++++++++++++++++++++++++++++
 sound/soc/sdca/sdca_regmap.c    |  9 +----
 3 files changed, 60 insertions(+), 8 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 51e12fcfc53cd..ab9af84082c95 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -771,6 +771,7 @@ struct sdca_control {
 	u8 layers;
 
 	bool deferrable;
+	bool is_volatile;
 	bool has_default;
 	bool has_fixed;
 };
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 2d5d20e23e3c4..3e1df30f5d609 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -779,6 +779,62 @@ find_sdca_control_datatype(const struct sdca_entity *entity,
 	}
 }
 
+static bool find_sdca_control_volatile(const struct sdca_entity *entity,
+				       const struct sdca_control *control)
+{
+	switch (control->mode) {
+	case SDCA_ACCESS_MODE_DC:
+		return false;
+	case SDCA_ACCESS_MODE_RO:
+	case SDCA_ACCESS_MODE_RW1S:
+	case SDCA_ACCESS_MODE_RW1C:
+		return true;
+	default:
+		break;
+	}
+
+	switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
+	case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(XU, FDL_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(XU, FDL_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(XU, FDL_STATUS):
+	case SDCA_CTL_TYPE_S(XU, FDL_HOST_REQUEST):
+	case SDCA_CTL_TYPE_S(SPE, AUTHTX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(SPE, AUTHTX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(SPE, AUTHTX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(SPE, AUTHRX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(SPE, AUTHRX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(SPE, AUTHRX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(MFPU, AE_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(MFPU, AE_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(MFPU, AE_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(SMPU, HIST_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(SMPU, HIST_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(SMPU, HIST_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(SMPU, DTODTX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(SMPU, DTODTX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(SMPU, DTODTX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(SMPU, DTODRX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(SMPU, DTODRX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(SMPU, DTODRX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(SAPU, DTODTX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(SAPU, DTODTX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(SAPU, DTODTX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(SAPU, DTODRX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(SAPU, DTODRX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(SAPU, DTODRX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(HIDE, HIDTX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(HIDE, HIDTX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(HIDE, HIDRX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(HIDE, HIDRX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(HIDE, HIDRX_MESSAGELENGTH):
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int find_sdca_control_range(struct device *dev,
 				   struct fwnode_handle *control_node,
 				   struct sdca_control_range *range)
@@ -930,6 +986,8 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 		break;
 	}
 
+	control->is_volatile = find_sdca_control_volatile(entity, control);
+
 	ret = find_sdca_control_range(dev, control_node, &control->range);
 	if (ret) {
 		dev_err(dev, "%s: control %#x: range missing: %d\n",
diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 72f893e00ff50..8fa138fca00ff 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -147,14 +147,7 @@ bool sdca_regmap_volatile(struct sdca_function_data *function, unsigned int reg)
 	if (!control)
 		return false;
 
-	switch (control->mode) {
-	case SDCA_ACCESS_MODE_RO:
-	case SDCA_ACCESS_MODE_RW1S:
-	case SDCA_ACCESS_MODE_RW1C:
-		return true;
-	default:
-		return false;
-	}
+	return control->is_volatile;
 }
 EXPORT_SYMBOL_NS(sdca_regmap_volatile, "SND_SOC_SDCA");
 
-- 
2.47.3

