Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA27279DAB
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975757; cv=fail; b=qh8MvHv1grE0zO8tajT4ey3w/WYvZM9fYFxqGZPQ+S3xivzYCYSyFeCqbrvAx6Hq38yUWYAvP46QZKmd4YIRlp9yCbv4S/nE2Z/NeXVOFGqy+7PlYvQApsp5cESsa+3jPlxOzg6K734ORNIrbMhXYPbmp4ptPgYmHDnIUo9jmyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975757; c=relaxed/simple;
	bh=OW7VRfoYdudgRiB9bk/DnMGAPk2xCynOeYZT+xB07eM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L23DKauXQGGi6/nYUK3lJsJgi8S6EAQlp7SKUOIE2cx4DEAGYSeP6/qDNuIy22kr6kQ0DL4RhuTmd1b7pamYLkQWIIsvG5NP2cyMqBK9nex7unNGuTHUxpHKwZXW9n8MirE1LB7KnEiJNPbUuAmTesv5pUNqz8J0Akse6qzOUnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fMz/lmKE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kOWxBAwP; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fMz/lmKE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kOWxBAwP"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAolo3745048;
	Mon, 20 Oct 2025 10:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uk3KPklrbNmsCxleEv24MOjk1Vy9pDRWRyVyK+TaKnE=; b=
	fMz/lmKECbD/vLDOH2c19qe8JlKSyxUi0q3kyhT94rtcSMys2lzBF5brAexL4V/B
	IvF2iDEsE3e80q2MNxz8c39XNtrS7GiBJI5GbiXpZcyisE1X82nuTMgwcr95QfCj
	ROcfZJyYXDrp6hWOOoGO7rv/Avp6AjJ2Df2zYFyZ2EvIOljDu+Btjna6zSUKhjsQ
	hJVJONeQCU50e8vO4AmdKNswigjjlRQOF3MQekN6HweQoqApWQs+MxfwGM/ahLi2
	KCoZl5y7sp9xrNuaz03HQO4gTXTT77ShQ5IJ6d9oJNWOy/DiCdcnnSEYB8XM81lq
	f3LuGhLQ2wvHiSMzbANBfQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022143.outbound.protection.outlook.com [52.101.53.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49wnc4r8dh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLk9ewv3UMhDnP8n3CahetALHLmJBYgMDo6Q+UbYYDZeJKql6ELkFYdAH3KrLtfg3IzRc0+QdeW5qxlJKTDQ7GRW9nYC6yZr3aLxy42VShvr3Q/DRKCOEpmmEmgpSJHbgl02leYBTSJ2FMElsLckqY0bonhUztDXI7pX6zlDtNuUhD9GhGr//s6664Wq8Gy7WlQR2cpRjAHOsoejjWFkiTKCbAfJtqfuF0vOsmeQy+BV5Ju3kwfK1ptXsw3N/B2X1UvxMouCK6vwBnlFmZ9ecHILfqiRQPzN+7SNGseL06pyzabmFTFm8S1BAQeWI0KBpmFqFvdPV9PLUqfMS8P/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uk3KPklrbNmsCxleEv24MOjk1Vy9pDRWRyVyK+TaKnE=;
 b=An4Bx18n+zLSAB/42msfFUMzK4zcGrbmGfVGFx3wVMgWVAaI53XkBSTR37iU9rznwAkptZtFpfLiJRxhHZTqCg9iXcIz/i9ZNY4XEPH8yP3Dk3bge8WyKP/y9zEI8Z1JK39mIPyooWkowWkin5t2n/2HYUDEN5U10y48EaSA4BmD6k6zIZzw4VoB1eIMF9OPS37WPFg/9yW48zy1pWNrM+np2OvUKv2G09LBiQBP9BBllD1jpM3ZiNp8FrbEu4+UaMhtcvVa475wMIS8I6dVIzwFHT6pHruTw2++xJ3xgSFRaORil4Lt1kgANFXkbxP6qLjWhK0XJO+g0O0zYu9wDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk3KPklrbNmsCxleEv24MOjk1Vy9pDRWRyVyK+TaKnE=;
 b=kOWxBAwPsd2CuxA1DRg9M6riz5zsZn+PmAj9LO38SlQhIce8GIrhCD35msRjgk/qRabjsWLMHasgEKW5ih/TGJEcKThPUf6x6q2bk3iCnCgh0CPsmz11j5egCCjnZ59iaLXCVDiHZTp6nZNld6HuwXsFKSFtg4u0GuTw5joWEBQ=
Received: from SJ0PR05CA0051.namprd05.prod.outlook.com (2603:10b6:a03:33f::26)
 by LV0PR19MB9240.namprd19.prod.outlook.com (2603:10b6:408:328::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Mon, 20 Oct
 2025 15:55:24 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::9f) by SJ0PR05CA0051.outlook.office365.com
 (2603:10b6:a03:33f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.10 via Frontend Transport; Mon,
 20 Oct 2025 15:55:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8CD71406565;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 79C86822540;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 09/19] ASoC: SDCA: Force some SDCA Controls to be volatile
Date: Mon, 20 Oct 2025 16:55:02 +0100
Message-ID: <20251020155512.353774-10-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|LV0PR19MB9240:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3547d669-7108-46ae-531a-08de0ff11379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6bb/ropJF0PJ5sbDA6+PxahR2MV7cdyOczOMOeug7QbbYs0xytQ9Gby+tWfh?=
 =?us-ascii?Q?uJmCdGL271G8aefamkGjB3VmXEEO/v+hQxoqU5KxQXtEB+aT+luw91LamqIU?=
 =?us-ascii?Q?7lKgxvU0KHczTCKvrcCvJMSOarJLDOigttRHkFusGXOhyAGMcRLnK/PorVoK?=
 =?us-ascii?Q?ylNUqoo4WpDNJW59lSJXEdfITmOGI1Z+awtU1Z99eDqDc4XY4b8TCjb1kTgE?=
 =?us-ascii?Q?RebQtJBIkuTqBhTZhHV1wlpwj3EHejIPhlJv4Ll6xldNPS/RXXLpa2yHaLKN?=
 =?us-ascii?Q?VBmwS0ewE12rrLzTIMkeZVntXTKfH1QgvKL6E9wrK22GnPPBig92Y2bZNFNm?=
 =?us-ascii?Q?n+gMJRd3YfEeMsOtbmukA6tSOqVl1YSRtfNApeOPw5P2LMyFBIU318p8o6WG?=
 =?us-ascii?Q?0pWPINLJw2ZIVVfRC/WCb6RaEdb1oX4d7DtbA6TjYYkJtVtLF3N2YT9aEoWF?=
 =?us-ascii?Q?jxwjneJawzUZzF468eXMSmk6jPQConpo16HpiIDCI/gqj8kmplxW4oW6KPEq?=
 =?us-ascii?Q?GXSQ8SixwYxQlOxf4VwrWlaW8teN9/7SPISb9oDavXdhGWQunWVUUFjDt18G?=
 =?us-ascii?Q?jlWWQ5AnG96j5tgS2QlSmffWgwG0TF5byGoOi6P5CdReE0AElW/s1IVSVijl?=
 =?us-ascii?Q?C0pgPD0LRmZ5E89bsECWLbBGquGqQY9mHWzT1bTZTNr9OfZiiOLdodXCOY7D?=
 =?us-ascii?Q?7GQeqRbxElff1k58iUrSUHviUBKYFVotbPZJgrVMBEigxWNISVgkFcbaOvcI?=
 =?us-ascii?Q?aox4qQyg26Y6w+t84GbqOGtjBQU0GGvjuktovy1V/4jvmdzCf68bIWB2EcDa?=
 =?us-ascii?Q?Vh54wUzJmsAeN17Gw7gLnTFgsZyH2jkCUqqXcooBDzxae0sAcKPpEw4dY1Uw?=
 =?us-ascii?Q?s0hl5igxQfv50IlcQglyrPAZWd/iCyVlwy3hqqzRGD32a2ZXd7xkXfHsSCUG?=
 =?us-ascii?Q?QdkTPJ0I5QstY5Tr29eVb9d8ZwlGixL3CUfjzteplvMhfwJskqQXB794k189?=
 =?us-ascii?Q?lwArQlhkgoINlcgjLnhRyIVWAnJ4w6973RYjmSYuTBa1akASMY8Qy+Hwg0y2?=
 =?us-ascii?Q?Cna/1BSbHCe2IuzZgAbd6lYHE0HvRDVFK3y4/Vby/I5wfUVl0u1SkKLmqgz4?=
 =?us-ascii?Q?EM6Xrz6J2Uhib/LlFbdzQsl2un9HHk0wnehuM+hb+0h/fPB8Ap2iu+Hk4geT?=
 =?us-ascii?Q?PJKCBs2UIua4FXfQj+6qGlJuLp04Xi1oa+JvDhPE8ucjrU0SO5yAFWo1sSPO?=
 =?us-ascii?Q?4dxaWA1Y4Ls5wKJ4Fio5CGm2oIvm+Du8gRAUvrqc3wXVbo3wLS1mH3bysfVW?=
 =?us-ascii?Q?tw6RsHuiu0FKXZcbmPJn2dR0vQh6+FaF+iA5gl3XKUdTaRjcDVHP0fWCOe1w?=
 =?us-ascii?Q?1noRNPSJUHAEJBfGwRUjhqRU/QUKSux//qc9g4HRiAS6b38slgXCMQAX7ml0?=
 =?us-ascii?Q?9F+B5xgKwERdFNwF8LpP6ZuWbjiF/gWivryIK+jfi9NYreudwtkS8VZLwZeE?=
 =?us-ascii?Q?zRQS9z+ewmXV24vdYJc33J1L5hpwVbmvTajZEh72EYBS1I5cIuILukq+r09H?=
 =?us-ascii?Q?jSp6druFwL9F+ZaiQvs=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:21.8170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3547d669-7108-46ae-531a-08de0ff11379
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9240
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfXxrntRMAxZOd9
 UeTfhXDtU2xEItfgvxN1OIhUWGbVQAfVlr+5e4XxkoqFE11bNK8XkEqo+TynSgfedepuinb4dXu
 mRF9NskWaGUsBP7VJFK/VSE4E8XvX/ceLjehm+lwtFI/yUJabb8XOSU2gEv8Fflt3bjQkUo/Qlb
 nWTlbOA1LE6v7YT0EpaUwTgzDaholjcCW8NbD5OUvmMYNhLy3/9NXTy3lDFqtyWn1tln1B7rOQa
 zajkEwY6wgfN/AeJccRVKMcA3WX7OQwVK8/nYUMWEOz0ORB13g/PZieoJsA0FLAwSELKI4BSaQD
 fTCTXRcXvmZzDfjEcFewUHs396gSK60U5+Yb8GHUeDjgzlKLEYMF5gLXckhvuXUpShpRjgJJ+1S
 OPmVrJyLsAozhOa0knhDOTGiokJ9SQ==
X-Proofpoint-GUID: Ekk1Sls1yVeCXZJK-8Ln2jhPmZptwSBp
X-Proofpoint-ORIG-GUID: Ekk1Sls1yVeCXZJK-8Ln2jhPmZptwSBp
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=68f65b6f cx=c_pps
 a=taCrSF+MhsyXuYDq+ZG44w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=ouDB0LvNsPAk7ljP0nkA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
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

