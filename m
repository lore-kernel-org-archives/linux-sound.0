Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE94A175A9D
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398487; cv=fail; b=Xzv7c5xSC6ZAErBDPZXWBPi9kau9d0H+2sufKNhl1Il++nUgedmwZUrOyQB14pdW2GwG+p8jlxdmJcoI5Ekbk9QRzn8+xRUg1cbz6r3WaeS7fslKkbbUyz9FSt0He+zrVbnxG5rKy4nJazxF4SdIgc0P8DOENjoxy5xMBNkD9Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398487; c=relaxed/simple;
	bh=7VuOeGHE0nlj9yS1UH57kPbU928doZWOt5AuZUHAinA=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=Zg67F5ugj1WyUv2TmghBYkiHYMkfRZ2eKEs7BvsE4u6LMT61aaPQRxo8aXBObXOHAVQ/wB+kCmvVzBG5fdxkpmpuRHVmud5AZ2az9hn7ESJCP/WV0ZuMnEdfc81PSdfFCO+nhLv79WdZdORHz1fajk/g1+uHVqOVuKFTKG+G3xY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fcTOilx6; arc=fail smtp.client-ip=52.101.125.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fcTOilx6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KW9T+UvELsdKsSX8CALySNT3JvN3j7ob4MREY96QGkRZ26zC/653+1NWh4tKdeMf5xoqmYvPicqWD4CU7xcgKTq8vYf/PBKE8DpL2IqGJ/rAxeOj/ba0pZd2E+3KUQ7AFlhFGbKsJZdRZilWey2WdbpV16qj8Z5yc58T1yctzlBIipOUahiJcHhcvbvPZrVsthUGhw1ctUm2MusZ+Um0dUQo3j2426jy+tlkIuKLlJnjT32WKef0cY5HgqD2rehJd11kbHzBP52hUhCMeqYIHloiXcenPc3209U0p1ur9iqmE4pZ/mUq9AgxKkZaTR7WGqt40D+rnifb6jMtVjPsdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQAqEOMh6vyndfN/ElwgPp9HF4SCqy1SAbL1CS2WNgA=;
 b=VhJlMcZBM4RCOBmz7sldmRVnJt8xeqovIkuxtDTT4RpeifNOgzR7rER9jlt6tH3DykaDYPwD4kZ+1mjPgIcARDlUpFPNBYzSxpAPf71e2JHyZv95/klBlOOWl12/yC1j9pZy1dICHmXGzOoOXuN4tUMlBjwMjMckNVjJWQBf+/pV9HN9jM3VEtO/3M4mbImQarl98oqV08f1S4gHI7WsAIha0nsY+e02PM2sHtjYGwWSRgLUaumLusoU61nkrdexDXpINt2TdDll/oYpyDaXmnvTE0qzwbnTAQ8OBKZiKls4QESiPiHIIQIoKtXa9Iwa3Odl0oFbyhneS7wr/ZoPSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQAqEOMh6vyndfN/ElwgPp9HF4SCqy1SAbL1CS2WNgA=;
 b=fcTOilx6WglIZiwBAokuNjzhUrSvvGPZWN2thiAa5LFu6d/A9+IyPQlzC0nHblQligPk+910wBad73bcP+49hr9L2MNEdZbPSSamLuVL9mJFZILoK2RfaUQadpcnIjxml0+pCXoz3Ja9iPVI4+IGMsCVIgjAZ2nbjbfZ3a28vl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OS9PR01MB13291.jpnprd01.prod.outlook.com
 (2603:1096:604:313::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:21:21 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:21:21 +0000
Message-ID: <874ig7yvse.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-card: don't use card->dai_link[] in for_each_card_prelinks()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:21:21 +0000
X-ClientProxiedBy: TYWPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::18) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OS9PR01MB13291:EE_
X-MS-Office365-Filtering-Correlation-Id: b00b14e1-89cf-4136-58be-08df0959a9b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|52116014|376014|1800799024|38350700014|56012099006|10067099003|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	J7yGp/wJ4AaHPMFQ7GuQa15UhKH2QhgIiTHk4RA8sc1dvzXohMdPdNEeRuo9K10P655SUjuhjTX5i4UKnnPNVAoisVl61K4yVrEkf2+fHEUcToRLKaO0D/OaJQhc4TESX8Yj9r/SKjd2ajUKy0JiroD6ozAQGh33GBposDhOhyCjKZ3m9ES4E1hAGDuh1+2UfPp46BsgWUjgYlGS5+wcIpqDedfd+k+dBNTheWch0FyetYV3itoeOdLao0CuROCVnP+PnpNp3ukVk2BomlCcFfd5WbJ8DGOXR4QTtevpdOrdDRUQ+2yrw48d+fl7lhf1SgtsKgnvf52QiKigJHnyL+/lL6Q6yTsbg+iO1ihQofu7QILkGM70c4Pl4+0N5+A50G7loTnJBJmOaKFQle8Q+PgrvODOpDxUPXpRC7LcNNgrzkoKgimD0Mq3j2oO7ppVWP4m1bxuM1cq6LYzeatPtOauKbfv/KtxB5TZ9OM1IeHiuyqjFzd7oT3TSOvyonHhysEIgfJUOyxATr2HngYXOePAg9JCPqmStdS0qvXtmQnKIcZixqMi2+mupd3p+o/g8+JE13iEKRsSgMCWiUFwMb3Fgk0xdZS012McZMQmd7WUUmVgLEET/VyeZHPuy8RW3Q43rVDcd++8cdYt5/QmtOrcuC19IaWopB6hFu9MW1c6S+NVFjnfN/JNmw5HTNVjSaTRQFkwE4V02rd1AUSvMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(376014)(1800799024)(38350700014)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7TnzHp+qedJ/LO1XoDvXK1mkHwuOTeYoOVQJoeNlQZY24iGvnOVN0o+DkIkp?=
 =?us-ascii?Q?vTFBZiZMiPDVDM1QH3XZICtzjwESgagyMyWJTExHzJyK5L11UZ+8Bod+caRk?=
 =?us-ascii?Q?bpyQVRzev5kFbfR5MN1zCw9oxAexkS9BOgOlfMrh6NvKRn3MscdgHFvgrG0P?=
 =?us-ascii?Q?Ls167DZjDpaAIbw1ckx5A2hatx75DxIiW4CPveN2ASIMfTiWFG12igNXrDH5?=
 =?us-ascii?Q?GWx4pZMVEkBiLIHU1aXuNprRBik6vWVJwofZYuZVF3qyWWujg509wUw8qIRY?=
 =?us-ascii?Q?nE79TtJO7mpkVUP6K5WRVQC+AgM22SnVp2dOA1H9avZ/94UMlq8DXibiqQQq?=
 =?us-ascii?Q?TXUzqtW2e1xlsLNB5H0CpoCJRmncMqk08Gvm0sGfZ1BSsRecbWbIomSZDuJA?=
 =?us-ascii?Q?JXtM/EKRcEzp4xEwo+6gqD5LYTVO9rfTNSC8HPdJL3foIUYsAnUZp8L7wenY?=
 =?us-ascii?Q?LQWfOolt8rjt/1rpPd9QDfq7e5pTmaTiROFbLa384Y63yrzxU2nq+Ek9NzDJ?=
 =?us-ascii?Q?gKG5xj9r9CRJFqyBbcv2izvWY2VOdGmEcbPIEk8gf9LXASG1J3kf9Z2nuhHU?=
 =?us-ascii?Q?MvE3WxTtryPF7vA6W7OpQ+ShuTZB4LvLtK5w1PsMrbopPjee+58QepP5ABnh?=
 =?us-ascii?Q?ACUoUNl7ijRk4DCB7CwlHnXID0ct5Q0cnc0tsW85Dx5iecMsS0Ggcbn4tWiP?=
 =?us-ascii?Q?K2wRN0zNuf9Aedy7fsrVRaMAosHIyLax0zP8dGWWnmnZ9BVhAxv24Re8ph07?=
 =?us-ascii?Q?xbfEYGCvOhYrowZJXPlM98jCuD44+Uz5y+7ErhuGxEOWZc7do5PonerQw0xq?=
 =?us-ascii?Q?9oPd7mKaFFQbAHU+p1yKcOuoH4t0yDdeqvbdLELE5T9/kQu+yKJ3toov0jqU?=
 =?us-ascii?Q?Z7lACe4tJrNob+HaiY41l1TAdBH1Y1A9uYOfF1PnV0W8oySMJN7gFXHPuMcV?=
 =?us-ascii?Q?RfbhXUuA3u1mNLIkObbTK/RSwtMfmeBVD4Xizq4dM+NmMo6czc4/pr7lU8nQ?=
 =?us-ascii?Q?8iqSrCNu+zwBKoSpejB+2XXDQJkrmMIcjE/etLM/peta8Eubb4SGeM5eGzsz?=
 =?us-ascii?Q?BEAQ83VuSlLlM+/5au5Vb2R/SScVQruN7y3Ci4kc38Ag00cQTlxKvNHzpUDs?=
 =?us-ascii?Q?TDU3xCVkiiVQjZbwenk2RYtKh0/qvSQHaJT2Fj7X+1FqS3qF0eQApf04Ti0P?=
 =?us-ascii?Q?Kd9LqcvXGvE456Ho/F0xlC378kG2GELGj/GYfpPAsXl2c58PuR9vUBR+1TVx?=
 =?us-ascii?Q?3hVIdhSk04p413odnW8Eu7wauy456Pa1ZYos/mGVeW7LYnXvUBdcbjK+r0go?=
 =?us-ascii?Q?E1A4+CejHZTSukmSje/3CA70ogUvVONGnxatqayI3DI++T/exJVDdwOx6yxe?=
 =?us-ascii?Q?95Eh5hT6uTK/uwDG1cockw+X0uOlnURb1phXaEEHmNf28BxYFNJ+4KaTq/Vp?=
 =?us-ascii?Q?wLg9YGIIaNHT8KIe4xtbG6lMIyJ1bP78McmBidNVHMgq+7zP/1sOND/qYr+e?=
 =?us-ascii?Q?ZJnxSveiQl7OOs9B0g1+sCOkwhXdFwz4ow+3U9sJhCm66fCMB1KzuT1vsYGc?=
 =?us-ascii?Q?zohcjjQMBnC3ppMxN94X3F6eO7pFw0X2frDb/MJPBtcxV+TwI1dMovnAUmZ2?=
 =?us-ascii?Q?DogYWSrLHaMZaEV3B8Qn/yF0Pn1OGYKdYjQMCUOBA5CvLM7J5zIH61RO9rGY?=
 =?us-ascii?Q?nwcVHS07tiklrJDFsTFwBogkLAT1rRmzwI1GUHeoBvF0gTygH3EQJlfLj1+H?=
 =?us-ascii?Q?jl7G40bflRTp2Lh62POpY2SGfRw2GQ0jEHzLtSRlTpg60yiZxq9I?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b00b14e1-89cf-4136-58be-08df0959a9b3
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:21:21.4986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58hfasfBmSLTkjqGeEykFUyEWm9HrBzEFevPSqvS1Lm1tyaJgZ1IdcjAgtRUwG8UFawsegDIWyeMUFdQ/z2L26kwAdP7XE5gCorcgN7IvYr/4xUPV651LDnOy4iJqJZg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13291

We can directly use "dai_link" in for_each_card_prelinks() (A),
no need to use "card->dai_link[i]" (B) there. tidyup it.

	static void soc_card_check_tplg_fes(...)
	{
		...
(A)		for_each_card_prelinks(card, i, dai_link) {
			...	       ^^^^^^^^^^^^^^^^^
			dev_dbg(...,
(B)				card->dai_link[i].name);
			...	^^^^^^^^^^^^^^^^^
		}
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b9c70268d49fe..8149981f0dc2f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1859,7 +1859,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 			}
 
 			dev_dbg(card->dev, "info: override BE DAI link %s\n",
-				card->dai_link[i].name);
+				dai_link->name);
 
 			/* override platform component */
 			if (!dai_link->platforms) {
-- 
2.53.0

