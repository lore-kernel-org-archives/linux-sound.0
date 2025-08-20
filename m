Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA81F9C1
	for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 16:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755707898; cv=fail; b=R1iaBrqqZW8fSK0KKzpSPuEPicYorLpWSfGmGz12HMDfy+iSUEARHZq5Ki6cgQvbuQv4fRJxDU389RE3b4/kw011B0LF74TaaITjt/yXn6I2Ya4F+Gdte/fO+btytPheG5H+TR0oQUMfOAMmEvqFKafFhq8HkEJzdClbrwgy4xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755707898; c=relaxed/simple;
	bh=j8I9nOiMTw0fioZ5B7HwahRuJeuxl8MgyPIV+3zcDzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKCvYiWlng3ovYrQwNJZDEKd/fiYdreGyKUxd0WJwGI7yhzylgP9wO3+PzITZ57vZ9U7dhRY8sYo97O43cim50+7+E1XX4/gBArTq6Pxhn6RdQ7MSpY6pbUOJk3xawUDH879no6UGPizvmBZQQQhF6oouOGenaiZ/i+Xn/eIAds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=phS26LW2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NZ33S+Zj; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="phS26LW2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NZ33S+Zj"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57KEZ8at368910;
	Wed, 20 Aug 2025 11:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=aUDjp7qH9UkD8cPAiUlriduXFlhlL4FmQFYxUkSxnzE=; b=
	phS26LW2fLQBfcShjHlKIHkgM3Wjo/PPkfwgaTu9dpGTG7gKKu4Q20DD7blJRBhX
	495S7+mXqibN9k3vkgrlvh3JT5/IhgY+Lc0bPmHL9yFJ3CBHrdgDjY4qkXRVRrH3
	l4htGKXyOYAd0iaR5ymLUEDVkJyct38s9Up6sDL5j5E1uBF+n1cEj/UqXI4YGt+1
	9QByUDMFZNAFSpzSM0IyV2RhdQ/g47AvcrPEFNkJJhICkFbXOhw1q12+3IH8h4KW
	rer0RmAsNvvs8FFe+ErozEbTAAXtPsZQN2vNgbuCrmPi66hfqXxdvTxnGz9xCcmz
	CCZJ7LXKi5XX8WmG6A8Jng==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2110.outbound.protection.outlook.com [40.107.243.110])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48myd99j37-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 11:38:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBUeBVLaNRiyuVTxtsii3l3iKw3xBEJaX4tpzBpp/DD0K08Wf/VY02bjZwIh1OXxTT1xtnwiA0I9Fd2LlFcNoY/ZxTKreaOTMy3MppaKM52AwrGcDVcWrN9KfgW816VJ1tEDZN1EaOKRbGdO8p0ZIoih6aDSu3AxzEjTVFccGl/sR+vB3zFZISzseOnjgKV7YNHbdb4PupI3zqyajd7PakmJ+ejN2zMzb4PK1MiNDebRlrSAyPcnALQfBywJF9US94gdBjLRK6fNkb03M1v9bzTDKO0pC2oSIGAc2Vnd+e5S+biMcsr52kJ517/CEmORcgpIY4WafVsMnTth0KbmKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUDjp7qH9UkD8cPAiUlriduXFlhlL4FmQFYxUkSxnzE=;
 b=eHjrBlQwoXWgcu7w7sKQYniT+/rHLQZOK/hr75+TgcQLqudttA+5ucVDcXZCdVZ8DmJb3Vldla7gXsi57T8ANKwoxQxMvKV335CX3ZP4tfuiHT/ylZMZ53f5T0L1Ie2FRb+AO2s+Lvq5DBphHNaXeHSLe2j6MNp3NR2yHrdnOu89GyLJDgBOGhJNYDebsM8UVULr32fEn/xrU79xree9+3GJX3bV6eehlo6QI/6Ll9kBcKNZLcHudnFqL3GOodSmStYCputJrzK01wYJrp3cVO5roDNfrDq7iN5rs78ine8nSlQ8Bb1AcLsXNEAg9EzOp5c9fuMEZbePGYjvtfzbEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUDjp7qH9UkD8cPAiUlriduXFlhlL4FmQFYxUkSxnzE=;
 b=NZ33S+ZjIcIV0WvF1644BkIL8poblkmzP48CvEsUukBfaoNxc5Xz6BI2dR88M6yqCkEpr8S9dFfHm2TJ1ulEg+X8+vd4r6k2HOnXwoLJQ0jDKwNkfe/igaUwyAH9/ybGV7rYoT8Y4C9sib2cMsAf3xWXPTesXbcYb0rpl3fEtfg=
Received: from BYAPR08CA0011.namprd08.prod.outlook.com (2603:10b6:a03:100::24)
 by LV5PR19MB9010.namprd19.prod.outlook.com (2603:10b6:408:2f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 16:37:24 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::44) by BYAPR08CA0011.outlook.office365.com
 (2603:10b6:a03:100::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 16:37:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Wed, 20 Aug 2025 16:37:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6B31A406553;
	Wed, 20 Aug 2025 16:37:21 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5B0A0820249;
	Wed, 20 Aug 2025 16:37:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/3] ASoC: SDCA: Reorder members of hide struct to remove holes
Date: Wed, 20 Aug 2025 17:37:17 +0100
Message-ID: <20250820163717.1095846-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250820163717.1095846-1-ckeepax@opensource.cirrus.com>
References: <20250820163717.1095846-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|LV5PR19MB9010:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 28a7eb70-9e14-4586-8125-08dde007d6cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?64sjEf/au9H2JMJsQj1I0tW7iapoEWAi8Pj/NbMlWm9Q/Z5UH3Kt9kQCCgP5?=
 =?us-ascii?Q?GLzy4AJNfypknp9v56bwD2Zv7But8yt5zE9hTh540Dj4iN7S48SWatXgrf2V?=
 =?us-ascii?Q?2FpXyOepqdPwS1n57Cj9Q/bPFLQfSqsRswwsrZg/fZVLNwPSVQBQ20z5jqeM?=
 =?us-ascii?Q?MNcUMiO4W5tS6K1kBlCLBXGfW0sA85BBA44x8XJNY7VRmKt1s22mngqmZRQu?=
 =?us-ascii?Q?X4bcOgqrqpemaTAYwwigFCFSrth4YB1tRG9ONpGzkavFT3gujwfASzaIx4Hl?=
 =?us-ascii?Q?uGhboF7W3kmnrrbWQkzB3z4SpBtHjRge4czc3T3fiWj6KEjQRWzlm7tEanVs?=
 =?us-ascii?Q?XhATh08dnyTd75Eb3TQHGdfbbLef/yxXZjzgI9uQzRpi734QN0i9gzKfE2rF?=
 =?us-ascii?Q?uQF1e79SDx0pUb/hMssvU7FSVDae3VoGudvbRzG+ceWPeJ0hs7Ym/+GtcUpY?=
 =?us-ascii?Q?wCIGu/AfmmOSL2iQUuIk9GJIXOscWNLzbqRFLKY8Y6kBHJ2YAG+BmcMdot4Q?=
 =?us-ascii?Q?1YGfWIlXAizyYUBKqVUSEg1NGW0/laAdUWoZw64IlbqVukQJtsfgMpZ8AN0T?=
 =?us-ascii?Q?wva1ZX3s2szsEURf65eL183k39ohWyLXYlvgT2rSU2wwzc28Crb+K0+lTFNj?=
 =?us-ascii?Q?hFhS+FvbpQ6HA2GReGFhoKC4BD+T2oA1089SFYSDw159OdNjba4EoHRpYECT?=
 =?us-ascii?Q?TKwF9blSFEyDKhEdku2IpP/b+Gb8qWih9vbaC/KGGuReMxUtH7cdky64axWt?=
 =?us-ascii?Q?1EY+UMerkpiBczAbalAEmsCdaYvHlhuO0vLtj6zaq+v0jas/dH5IS913ZP3F?=
 =?us-ascii?Q?C5DLbaOW7yn7OPyAQ1auUsiJzxNnyRRXpHB07GJVdLO7Lkxpv0PHbCE8KYFD?=
 =?us-ascii?Q?orZ9ICyzwQaSS2tXLAh36KgeUOs7zCpFgc5849VW5SIviRSxCZh4kxadTvDy?=
 =?us-ascii?Q?bZi3qw4CGGJzDJbJSubJY6IN+oYnD3k7hjEFhFWw5MYe9BAG+dlxw4Hl/dT1?=
 =?us-ascii?Q?rN2FW4dgjOExdAtRXgUU5V9Kz7DzE08lKss1BsLD7CTFzOzdyWGPd6Hhegum?=
 =?us-ascii?Q?dM4tbZNCYvV9be6qLNd8dO8uadTcPm+rdtzBFtJ2jD++c72IY/Q0D7RFusat?=
 =?us-ascii?Q?htxk3ZjkGl4K1liJDBJLRkVuX4p+ysMHhps6gMqzdne49rV07pNaxJ0BXUaN?=
 =?us-ascii?Q?XwcPV3SBrhKuzpbHqZGUlw+LhF2dNFT2/DZA94UUlO3F7/0dYcuf0N0BjTVY?=
 =?us-ascii?Q?AwsG6jmgdYHrtiFjhl6WK4q+Fi/Tq55IUeWUIS1LyjDAvKrUIKP68Zfd9UZK?=
 =?us-ascii?Q?n9/OJOz2e1fxrlKD6b61Ak5k7C+LDxpSmSZDUPbylM/UmGL0iuGtOpBYmnOj?=
 =?us-ascii?Q?9PmPzGIQs1v0hLDT9aV6nwsZLCvrAN4mulI5AziixMazeTOdhHzG/CQtvFpt?=
 =?us-ascii?Q?z8T7WWjT4YQIDixtNKZ5IgWgcUNn34FmMt57GFER4Af7KRbqEjQLoVljGSuF?=
 =?us-ascii?Q?U1bYHFNySGV3ddYvrspxfyHUEiH9+Ila8fD2?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 16:37:22.6689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a7eb70-9e14-4586-8125-08dde007d6cd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR19MB9010
X-Proofpoint-ORIG-GUID: XMC9CDnFZLBPcrqiWcfhpNspkvETqZ9_
X-Proofpoint-GUID: XMC9CDnFZLBPcrqiWcfhpNspkvETqZ9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDE0NyBTYWx0ZWRfX72uTlyF2qpgZ
 0XNvYU+vrB1CX9LdH4g4gbW5IAfZNj7uX+XK6cmNEViOO+eOb0pqbUaLzyDdmQcz0CP6QUJIgue
 vtMP0q65OqNVGuAUulojNfo0H8HllyYkxX8OnJaCu/9+G6aXwYRopSHaKu/35K1Fm4CJyvF4XJA
 FlL6/VZ6UTbh7uEZ/vIUjAQ3eS8hJgVeisVj15Rz5w0gZomICdErb15Lami6s4rVN3EUwVYFyUW
 l6cVnS/uucPu9JSMZ0FsXqxWnmofv3mK5ixF0D002+UYhCj6FyRevPPbKE0koS8B2JiRkAper12
 xSIhM4DwcTevMiUrVGOh1fUwczrcnE0DTQroVDY/qyA+XCqhLi5qO7GAt6JWqZni8GjLR7+fMOY
 4UnnnYKumuZA77aakki2C7I5hWim3g==
X-Authority-Analysis: v=2.4 cv=WIwmnnsR c=1 sm=1 tr=0 ts=68a5f9f1 cx=c_pps
 a=boyZAcvaX7MgnFkYtrqV4Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=E6EehHSmfuKcd6GqUGsA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

Remove some padding holes in the sdca_entity_hide struct by reordering
the members.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 06ec126cdcc3..ea68856e4c8c 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1063,27 +1063,30 @@ struct sdca_entity_ge {
 /**
  * struct sdca_entity_hide - information specific to HIDE Entities
  * @hid: HID device structure
- * @hidtx_ids: HIDTx Report ID
  * @num_hidtx_ids: number of HIDTx Report ID
- * @hidrx_ids: HIDRx Report ID
  * @num_hidrx_ids: number of HIDRx Report ID
- * @hide_reside_function_num: indicating which Audio Function Numbers within this Device
- * @max_delay: the maximum time in microseconds allowed for the Device to change the ownership from Device to Host
- * @af_number_list: which Audio Function Numbers within this Device are sending/receiving the messages in this HIDE
- * @hid_desc: HID descriptor for the HIDE Entity
+ * @hidtx_ids: HIDTx Report ID
+ * @hidrx_ids: HIDRx Report ID
+ * @af_number_list: which Audio Function Numbers within this Device are
+ * sending/receiving the messages in this HIDE
+ * @hide_reside_function_num: indicating which Audio Function Numbers
+ * within this Device
+ * @max_delay: the maximum time in microseconds allowed for the Device
+ * to change the ownership from Device to Host
  * @hid_report_desc: HID Report Descriptor for the HIDE Entity
+ * @hid_desc: HID descriptor for the HIDE Entity
  */
 struct sdca_entity_hide {
 	struct hid_device *hid;
 	unsigned int *hidtx_ids;
-	int num_hidtx_ids;
 	unsigned int *hidrx_ids;
+	int num_hidtx_ids;
 	int num_hidrx_ids;
+	unsigned int af_number_list[SDCA_MAX_FUNCTION_COUNT];
 	unsigned int hide_reside_function_num;
 	unsigned int max_delay;
-	unsigned int af_number_list[SDCA_MAX_FUNCTION_COUNT];
-	struct hid_descriptor hid_desc;
 	unsigned char *hid_report_desc;
+	struct hid_descriptor hid_desc;
 };
 
 /**
-- 
2.47.2

