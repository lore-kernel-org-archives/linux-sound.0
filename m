Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F343D1531E3
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672074; cv=fail; b=mHsWBywKQVU9WTY1QekhWbEtGFWmQNZrjvP6cP/nvB+RuJDx5YfSLH0+bWsbNkhpOw8ZL9u71PxxPfZaZALUgaFinHXjuASEC7XU0SzOibdDJjYiq28Z2HS7frTWm/j8Ml+KU407qfgxjmc019nBn1pQZDMwa5Reqvi62i2oGv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672074; c=relaxed/simple;
	bh=3VPocn50BGtqRb0F4qB/8618sA16Z3E0kAfCxyolIKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RY4QJleaNXdPCo+QGYAgJkn9bc/vU8SIE11668dVSwwXABFbvSz93P1c/y3aEwCv1ZNK6GiDAGhYg/fAP7wM8RcOLprD6i8R+r1rjjRytiKlQGW6vNDviZSYSQc3XmW3qdfJEpy+mWZ+ZX0OdTX1it/NZmwtY8gEvtsTVUHcpso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ODubcd2P; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=O5110XrN; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ODubcd2P";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="O5110XrN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N6RxEl004528;
	Mon, 23 Jun 2025 04:47:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=iApq0D+NkMALGZ86gnc5q21akBP6MdOuePajZ0IT24k=; b=
	ODubcd2PyK9SOFekh8nUgzGzTsGFaEs7LVGCdCPfTUe8WK/4r3V9GPUIUpeQJibm
	XGJDaVt4K+W5IjRx6TZ6ZbGcORtLrSkDypD6yHyxA+2s8+CqzhguwPa+OeWlk+KO
	dz5PW34JqrUXKkJiAsADCvre8JcgAwEKewAflAa2nYFa6OP2R9su76CjVy7dIJgY
	BgXmGj58i10x/u331QAhoYBxzhJib0mMqUnWQJDKz/XLSVv+lNfOmpVQ3NpZdpUL
	moXJu806s6N9YLKe0j0Hne6+ofyW9lab2dl++GWwEuWCuso4nqnVi+TaXF8cVQZS
	4Ni+95VhGEx8PsXF5P9emw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2135.outbound.protection.outlook.com [40.107.223.135])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47e5tysdbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 04:47:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNAFmIiOvbnV3QJSjD7aclXcugL4550QrNls7uH1cIpxvnV3mNgPdkE/G9+trt9RGa6HQpx2NJVkZIFEzfH+4eKhKOM7wRwlQKL5Xz0YzaJR6J0iejqLzaxKYcKk8E2zPRLNyu4MFALViYNdh1Ir1jap9X0zQZ3G6LbbSCGm/iCc1MCaPPm27Joa3P0msPZzmH8FkkuyEAR15NlT/Tq6ZjyDHlq2tQHjOpX35WPuv2CxKi2iZaDjZTCcPkilOKN5AdWsWjyTkngfCfAyxef1rKUXYL5U+jebQ/PF38fPE6cwx2Qum/1phXiww/ahHA3DZ7apelY6onnturSTY8QXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iApq0D+NkMALGZ86gnc5q21akBP6MdOuePajZ0IT24k=;
 b=vKtC9ZE4SOv5v+cgCA2tQXfibotJNvvk2aphXcsSVptmTEnXnxVGkTw4CNe0ynzFlQrvbWsS+PZWtX6EdVnhgu/CZKuZ+oioEFkLgohbpw0perj0YG1nQLgKZppb8JU4KucUMrNrcni0qV1AmpasGGYZMtCANUEj+v02d7lM+0fqpRAxgnVEVjU/bCp6KreLgQcLZWnJGpyDQ7PFtUkY99nqT1iF/M1ltlXFnnKjTfAJ1lkMNO/OTQWiomva/7i/sllrIJwh5sZN/lz3LbBUudkurR70DPzGyg9bAuOEsqiPkmfsAqvItji3T1gaotizWRQnXJ1MCxDSyqoMg2I+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iApq0D+NkMALGZ86gnc5q21akBP6MdOuePajZ0IT24k=;
 b=O5110XrN0FuYHigklvNAtJh0NApf1HIhpxeoarsuNf2NFFPiyvduMbmrH4qYiagbOvoYB9XMK64fNuJ9fmXdv5Iec7l8ZwIU06AmV5kKi3F+CXSTEgm313Ey8WcJ/2EQKZc75NnzOMjabwy1pkENG5Pst6Lk2OW/+OCYn2A63q0=
Received: from CH0PR03CA0302.namprd03.prod.outlook.com (2603:10b6:610:118::24)
 by MW3PR19MB4315.namprd19.prod.outlook.com (2603:10b6:303:44::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.15; Mon, 23 Jun
 2025 09:47:23 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::59) by CH0PR03CA0302.outlook.office365.com
 (2603:10b6:610:118::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 09:47:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 09:47:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CFA1D406553;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A579C82255F;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v2 4/7] ASoC: SDCA: Minor selected/detected mode control fixups
Date: Mon, 23 Jun 2025 10:47:13 +0100
Message-Id: <20250623094716.1874443-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623094716.1874443-1-ckeepax@opensource.cirrus.com>
References: <20250623094716.1874443-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|MW3PR19MB4315:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4f973678-0279-48b7-3a8f-08ddb23af391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8yUXAaTb2jmXyA0P/YT3TqEFuKlH0qfGUxc9Csh/OEAXChz8zi6QXN1eZHqp?=
 =?us-ascii?Q?HJ/auKnhOGsyX66I6tkOL7FGssHJ2s06DaRrBJ3wNfwEPWBoLdMRUD6bbu6E?=
 =?us-ascii?Q?QqpjvXTn6S7RZwEvFsbhSg+uYPdNxOW3rOtBrAJMlx1Q8lPmaVXeGehIdzeu?=
 =?us-ascii?Q?rDO6Ap5l199ls16Gpq98/HgzkE9AXxZs/4mJyAP/ioDryIdTVmtluWRJrWfA?=
 =?us-ascii?Q?rZMub405swNgTzwAB0BGi7aS/RTS53o+A6sE0S/fRvdXY1hiEn7b91h0YrBb?=
 =?us-ascii?Q?TWxldhQVicCKnKtyXLuwPpGtZhwYu8W7mWBE/OzPWdertK5XivRlnlaxEZm5?=
 =?us-ascii?Q?ByFgX/HGCii5pSdnG8T2NR4fJmBreGioKimmXlIfmuooAszoM+j6pMhUTgMz?=
 =?us-ascii?Q?LO1+VBaeqMsuuF+cnK6c41tx3YG6CM8o/rpdjL82a29kgtfaPD5F4t02I17E?=
 =?us-ascii?Q?4BtQ195MbG/9Dzd4aX7p3JLjLEtgTntOTR3Ed0d659ZKvdEivm4P3zxczD+d?=
 =?us-ascii?Q?A4nvn+0iG18XfUGh3YvHZ4j71N5DTxDINozTQuH3cQrKNVhp1OGzt90aQLe8?=
 =?us-ascii?Q?nTshhR/VyEE3nsgtgqNPq9g9zawsS7DYV5+s9A93GaYyGLLiQaaJOQMlmd/X?=
 =?us-ascii?Q?gr1yhu9jn4kn8PZpD5qcSy0EekvdlWDeHFCZenph9eP94dQh4fqhbtLT4u49?=
 =?us-ascii?Q?PyT42cRM1208Lq1KNXRXRyg1SzsFKzSIDrNFjbWNoCuE0qZG0eCiOX9OTlty?=
 =?us-ascii?Q?49XJueKPoBrDlhEiZ5OfdoUaDwcnsETH4vXxlMxoatjYWYbMqEsizpBSSg0i?=
 =?us-ascii?Q?T4Mo9mYyl2twD2Tsb7h1YQyHNcKERfg+JvRaYF4s8cvo5IueEQt7wZme1fLl?=
 =?us-ascii?Q?5VJn7GSifvKGyAGE45Wd8oGbPqo5zQdSrqHDupyRJ+SKicKeZsDfRDOLOPBL?=
 =?us-ascii?Q?JWrtNyvJhLGObwXFuK/GppEduWl4Tza+cQdc0Us1nXeE+EGOOFNe8WAjS8OV?=
 =?us-ascii?Q?9MsEAT2cDY2akXt/IxvE3Hc53KpjGFEreo4xDe1nWnKK+td/U1bKbLtWVEQl?=
 =?us-ascii?Q?gSnUSIWTjX8HctONJO0BZBCQ09NqHQdUo2ehoVHz194Orye/ZTIcpm5RmJ+h?=
 =?us-ascii?Q?qvV9J0DYoZA5RltCRHKgLYtLFa8qdE9kf5diFwt+bhVwkpBk4xomPe99T9ii?=
 =?us-ascii?Q?neqm0NTnY+FA22srztHVQ+3EiTW6HCs6kIp+CEAOoKPLUh0Wiy+pAZQrlSSA?=
 =?us-ascii?Q?EOvmhMN83z2kD59SfL/7Mraehm1RRvPoDszaXxeHwItOZT5mnt1evjlxncxC?=
 =?us-ascii?Q?Ka6N++n1WG2Xj4U5FZC8W/+If8kGmocZfF+2YlkvA3YCbhGbFxJez6emYRaM?=
 =?us-ascii?Q?OxinRBPNdvz9/rGDvUOGONZQ7/Cs8LkOdbdwnlePfw82XLMUyqmnNM6rpXe0?=
 =?us-ascii?Q?fh8OSPi/yMHOiohi56/dygfgPSF7KhG5tSYCtAYt+50YN548Ob7SM0bRChtb?=
 =?us-ascii?Q?P/j1xIFKVW1b6/5PFG6rF2ihlVEG1X0ZyKRQ?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:47:21.8327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f973678-0279-48b7-3a8f-08ddb23af391
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4315
X-Proofpoint-GUID: zRuzWbUj4BymyWBaAqmUHdGDf15_vxKN
X-Proofpoint-ORIG-GUID: zRuzWbUj4BymyWBaAqmUHdGDf15_vxKN
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=685922af cx=c_pps a=SfKpAED18FmY9QLmYdbp3w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=PIROGRAch6tWaaTk4LYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1NyBTYWx0ZWRfX2yl8BX0rf03M DzkRtOjTQs5/nsIIli/SPyWCzdMRsGuP6CgDxkKrG3h5reGbLKm/MMQOrS0qu5jJrdYqtJ70er/ XD38cdFXpYxYtZp0Q0pGl9sD37TRCDVcxejrDPezcx2LMTnPoNOf4PVP/NB5d22XXzDGt26Yyk7
 QnTNiFe4CuE81NJOybUkxzk7GBf8h9UftrF25qScnfgMsEhBLyAneZamFWKIc4cm5HiCzikZxfY fQHFE9qzFCm6PPJSoqC8vDGZRab3vbQZtIhAaiLRroCLczognySMkLh8sYeBHsYh4SRQJsv6diR 6Y/Zu4Oc40kt7LzwgkNjumsqFp7vjZ4fbcku9Ad8SUgF3CMI+OR95auvAPonT0b0QSPfOQnn4Vk
 k5fDD21c1yJ0Th9oWWOxBmR/piZxIgD+ad13k2f/Js+Xv9XM8ECgp5FhQvvAm2+FZA0ut/HO
X-Proofpoint-Spam-Reason: safe

Make the names a slightly better match for the specification and add
some constants for the values rather than hard coding.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 include/sound/sdca_function.h | 9 +++++++++
 sound/soc/sdca/sdca_asoc.c    | 8 ++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index eaedb54a83227..e5166583d2581 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -318,6 +318,15 @@ enum sdca_selected_mode_range {
 	SDCA_SELECTED_MODE_NCOLS			= 2,
 };
 
+/**
+ * enum sdca_detected_mode_values - Predefined GE Detected Mode values
+ */
+enum sdca_detected_mode_values {
+	SDCA_DETECTED_MODE_JACK_UNPLUGGED		= 0,
+	SDCA_DETECTED_MODE_JACK_UNKNOWN			= 1,
+	SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS	= 2,
+};
+
 /**
  * enum sdca_spe_controls - SDCA Controls for Security & Privacy Unit
  *
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 83911dab73ae2..dd7b19083c85f 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -246,12 +246,12 @@ static int entity_early_parse_ge(struct device *dev,
 	if (!values)
 		return -ENOMEM;
 
-	texts[0] = "No Jack";
+	texts[0] = "Jack Unplugged";
 	texts[1] = "Jack Unknown";
 	texts[2] = "Detection in Progress";
-	values[0] = 0;
-	values[1] = 1;
-	values[2] = 2;
+	values[0] = SDCA_DETECTED_MODE_JACK_UNPLUGGED;
+	values[1] = SDCA_DETECTED_MODE_JACK_UNKNOWN;
+	values[2] = SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS;
 	for (i = 0; i < range->rows; i++) {
 		enum sdca_terminal_type type;
 
-- 
2.39.5

