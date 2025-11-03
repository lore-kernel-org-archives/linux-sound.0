Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFC3318140
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 15:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182558; cv=fail; b=EoJbXwMDSeXGxMPGDidp9F/NmyEBrw4egcO4QM/gGlnU7Td0DvOZUTusS6HEqwR4sjWUi0m6GAeMjCA11D4lcVeVu2TjPpE5Ed3yHwbUbAsBNOXI+/MMexguj9QyhfakWmA//9bcMpnoKCZAc6z5i5bzC3ps0r1/Sf09oYvRKHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182558; c=relaxed/simple;
	bh=ceGRUrtc7jZmmJxRuy/JUAlQfyYooE+QujxfOX8yQuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AYNNRZX5qPy4VTch/Gz+QZAr5PrgUu1BarOsX+NymCNVrK8rrMrMpqlcsYfX6tH6RQ/+Qm99MN6cWqpWWHHdJUYHorJejpAjCXFsc/F644V+gtJVX8N685EDS5KY0d8nP8dAjik47fNERcrFMaktjuOFuiBakdvSwQX5QD861BM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Lz5sx7fO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=L9skCPys; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Lz5sx7fO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="L9skCPys"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A35toUj2534298;
	Mon, 3 Nov 2025 09:08:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=oa2rWBegxJzgZkWV7c3zcXTK7v7zOdc1aC8Eaj/q5MY=; b=
	Lz5sx7fOM41W9DzcD7JETPjhw7/SNu11e1h/DBtaOHS7979yDnCNv4GzX0ETQPVN
	WomyNKb5gSpeID2mRn2SwffVtD8NqTt6D1LpAICyksSSwUTzACao80/aKypzan/X
	sWldbCrRwXKpcWre0y1mbQ/fzD3cHtQiEMMNGcfRjtg/5DKxNEyuwCVfO16PC4SC
	ikpOvn1sa/23Ij9c5smFFnR7SvM/cPtCKdgxTokY9O6SpH91VTBDA1+YM6TxYV7/
	V843v8gtWPoLWplhXXAdXYZCfKLvZlxp97qkjZZ15hs6IQppd7eJhrnp1pYQ0z3m
	5LfVujA3lj3JLJy1XKUF2Q==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020074.outbound.protection.outlook.com [52.101.201.74])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a5fkwt69q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:08:23 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4gty6AzhQWkcublwcsNz+ltRxbAQ9lQDxdyCMyVDeh0nG2t3TF0A3k0XBUbCoDlx5N9vYh5lFeUapNhrbNU69BW09JEP2ELonTrlwrC/IBpXFSYZM0JnXMMfP42ypmld79itCJwlDoHvMcQ+fpM+jXekkYJ4g0wC5ELuZ/nmio5B5XDGFUphsi4ZyNWOcUD3nWqUv4m3VPmKwuNR8Sd21Z3nXYlY3fXVAxGhPWJeuAAiKt1njAkIudoDV3a7kMhrolru++jFUEGcihQ8pizASsyzlOP2aF7cg7DBLlWQm3XHHZdl5Z3/xzVu2BW+3XGmws8GG0OuTdeFo7HN1kFEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oa2rWBegxJzgZkWV7c3zcXTK7v7zOdc1aC8Eaj/q5MY=;
 b=YdbdR9KQgQgisVJQjr4pFqTzBQShBfTdD2IDOhKTnfWnddO/dDa93qY53Rt1iAIw636n9Uz7ZHBL81hJVFCPppCCIO7OgKmuN6SHA32ELoMRazaKd4j0HqIuIOjjTSOV4JXWzt8w7cTbWlpHseIvsDBuuUn8H6FPQXjS4717TU78wlhxdRL9jHeSMa636a9SPyopVad9fH13ZYbrrEQJIRkhcKZ8kApSfRuTs3n/55mU2F0b3m0OFj5G2cYc0Kkquezyv3rdm84OgXipFw64T3Yc9nwvVyDaPqOh3M09V0k9/HxkDG/qr1yWDI7CIShqKvH5pkQxabH39Sbcc25sCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oa2rWBegxJzgZkWV7c3zcXTK7v7zOdc1aC8Eaj/q5MY=;
 b=L9skCPysxD5/5edLPPttqlZQgj7hvNsI3HLcC0Z2zKgMvoDFY5Zt6/+5jRRsWldaCp/cRvuF45y0CJDkLCVQSDImY6MtRvdzVU+G0d37Bv0KloNft9cj57ce2Peqz/ft03gOG2lA4M3vPPkTNtD7wxMJ1gjqTEveH6EBLUS+Sqk=
Received: from MW4PR04CA0370.namprd04.prod.outlook.com (2603:10b6:303:81::15)
 by CH2PR19MB3943.namprd19.prod.outlook.com (2603:10b6:610:9e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:08:19 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:303:81:cafe::46) by MW4PR04CA0370.outlook.office365.com
 (2603:10b6:303:81::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 15:08:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.0
 via Frontend Transport; Mon, 3 Nov 2025 15:08:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1D352406542;
	Mon,  3 Nov 2025 15:08:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7DFB4820259;
	Mon,  3 Nov 2025 15:08:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 02/13] ASoC: SDCA: Fix missing dash in HIDE DisCo property
Date: Mon,  3 Nov 2025 15:07:57 +0000
Message-ID: <20251103150808.4015208-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
References: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|CH2PR19MB3943:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 23a35abf-4c3e-443b-f809-08de1aead253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G41NhBT1ic05sfpI7H5SpLN+96HzHXMnsl5/wJA5FASdE+C6rpVRApuicp7L?=
 =?us-ascii?Q?t2jonZ8VfzgjcwSp7mIhYwB16XcAIV5MVnXJaJXYlI1rRk+Zwzb1cdCtg9lp?=
 =?us-ascii?Q?7cYRnT0su6n6Bwc2uMe2Gi5T9edzfeOq9UtAQ/p70LFKG7oo855e8oApYcRL?=
 =?us-ascii?Q?dKzc1bMiWvojGGfD7tItgbRrHG0rvyZh9J63OXyxv6AZXxhVS4qEPzYx3dwW?=
 =?us-ascii?Q?UjayQoivAs0fWadaz5QPsUu5x9eSF9S7cVgtI/chEW8RqPoAalH3C88DWvE3?=
 =?us-ascii?Q?tWEhlvopLOG8ih58QU23yzkMHXEPlf5TTVM/ZQNlZbUsJ8aQ/lyoAqi3d0dR?=
 =?us-ascii?Q?jRcJ/zB0+VctSyHc2mV2tc4SF9MYaXoOoCn3cTgxMh2VKLgTGRuG8WiM3fbr?=
 =?us-ascii?Q?TuXOVqR0lbiCTKLkjYa8EQ04JclCAHu/ygmTBNbl7cGtprAFnn7MTtOQLSy9?=
 =?us-ascii?Q?FV6IuKIaZccX+210CiX+hPjUZmd9+YbmoKIhWUrotw2tKoaCJd/6PDPJ4HH+?=
 =?us-ascii?Q?CCgONarix4YBYiCg6LxKOu519pIvQbVMssgDJRHpCQPzyGe2NDbLiGEfuoA1?=
 =?us-ascii?Q?afEPLxzvL0gqkbADDSriayWroENyDW/+f5EsCx8FAyDheLiNmSCcFD7+Azly?=
 =?us-ascii?Q?lX5dtH91fapaulDqzPfknRSlV8MsXrS4KgcFxSchKys5L8mP/wifI4SZhlta?=
 =?us-ascii?Q?5gBMmUoobC29oQe7GvnYowCfYFqbVhXtegv77oGR0YdvuukLzSs3bBjun6e+?=
 =?us-ascii?Q?Dv9TBMJgMGDXSW62cF53wtyT2nveG05Wq5rt7ZNXhFUKR1Jj8v70MnqgMueK?=
 =?us-ascii?Q?ZWqmka56uL/35jRK6twxu/Q0pLD+NLXmidcBnFFpIr8FNBBpmgNpFQ2sEYRN?=
 =?us-ascii?Q?ezWgjsA/NWOFmCSOky5XlNJ9CSDNDRT5a6z8jmpVZVAA3JbRTKhCffmCEh9D?=
 =?us-ascii?Q?ZB3Rf2c87RaYaVjR+3WqaaZjJJHLGisO0F3LUXNLKAmgTVT4UgCzOepdVHyZ?=
 =?us-ascii?Q?VYq8mzPR/mcG0TFwH9s3q0kCoMLe/Tt/DrNtctp72cIE0jWQSYGBsOJ2pCJV?=
 =?us-ascii?Q?qXvO8abqf8JI/TjC6PHg8NnKGytPxIzUG6+7XEHZo8Gg1HYgkxUMIfednmYs?=
 =?us-ascii?Q?FJHZWUmuWev3HW4PtbMhHjrfkusZ8UrkXxoFxtm3MyuJGXzHKxx2NabgVRXZ?=
 =?us-ascii?Q?XDlWBiIPuxVWMBq8RCMCNOlHtPLuXkDfQTBjhZwZ6arYFhfmuc5/+5VeDh0h?=
 =?us-ascii?Q?3B4/keGWg1RRaeW/71u9xFrJYSFLHsQSj9b7xHJWWJWSPBLbZisRsi0xg7gG?=
 =?us-ascii?Q?QozY7iQIG52pBs3T2w13lxoGGB4c9WChMXDfkcT43NqOxneFnG+oRp6U6pZc?=
 =?us-ascii?Q?RyHONX6tjc2/3Ag11/22Yf76U/1Tp4PdVxFsrG1Ad6wdFzLbeg17lpfTviOU?=
 =?us-ascii?Q?4JitnWR90c3i0oVhLI7JlFISEzxyfdkTG+o5SrcnOaM/Xu0csrG1xNtaucLi?=
 =?us-ascii?Q?Qnf468stiAqLIgQi0uwU94DZMvpnvDHpYIgVigPaTsyxfCtY2JYbS2Cll5ip?=
 =?us-ascii?Q?KiIwE5ab0I1iZ0fp29w=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:08:18.3229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a35abf-4c3e-443b-f809-08de1aead253
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3943
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=6908c567 cx=c_pps
 a=9mF5moCRh3baUhQ7ZsOuTg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=Uc5XiwNe9-nZHr_u4vAA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: foD8aXG4504_TBC80fO4NSmUEBM1f4_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNyBTYWx0ZWRfX0alTb39kwcmJ
 Ghe9eL64Z6iTgY6aT3nMp1vmM035eEvXTxdgAO0EmAyKAzlChPBMJc8agrmFVRjCOlJIZ9A4JVv
 s2RLK8kG4fbPWaEkljb/1sWG4C94vfWvYXuSSv9JuXLg+E46hRcKA102/1z/lIp6Mshn9anINjo
 PyRDsn09EnJJ+35pzjE96JW+63VgHVqrQtJP4tK2KeQd1ng6Hpb6Q5OPlWB2a9oxijpiJR4rnBe
 uBvkaqaU72mrxgBnWNc2Z49ln8Kqyd97dX3XJPryeC97VnQ6ZNpxOkRdmyY6zd3Kbz4reFIlGpi
 3dfrjVykF52HZwHkJoFsmWzK0XATttUOnxZOYi1eOqye6ThOTieV1TPKuj+iXD0EzrPfIugTeqY
 K2KkYliP2KwLZdmvOS33qAeKEwRE4A==
X-Proofpoint-GUID: foD8aXG4504_TBC80fO4NSmUEBM1f4_a
X-Proofpoint-Spam-Reason: safe

The property name is "mipi-sdca-RxUMP-ownership-transition-max-delay",
with a dash between max and delay. Add the missing dash.

Fixes: 13ef21dffe76 ("ASoC: SDCA: add support for HIDE entity properties and HID descriptor/report")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 sound/soc/sdca/sdca_functions.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index b2e3fab9bd959..8ebc5161c9f85 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1321,7 +1321,7 @@ find_sdca_entity_hide(struct device *dev, struct sdw_slave *sdw,
 	unsigned char *report_desc = NULL;
 
 	ret = fwnode_property_read_u32(entity_node,
-				       "mipi-sdca-RxUMP-ownership-transition-maxdelay", &delay);
+				       "mipi-sdca-RxUMP-ownership-transition-max-delay", &delay);
 	if (!ret)
 		hide->max_delay = delay;
 
-- 
2.47.3

