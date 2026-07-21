Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011070.outbound.protection.outlook.com [52.101.125.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754CD3FE37A
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598197; cv=fail; b=di6y2FcqHExZ/r5Tck+btHTgcLrzIlfCps7OT6ettJPAp32bpXydY/17kPdF+eg57FrJ1Qanyj20+3UQwYGf0+5d1+Fo2IdL32tAsvs6rCgaZNIYbput8PJbTOtNdVzvEWOI25wo9D4v+q2UMrn6GVhNjhj0D8VQqc2iLwM8cao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598197; c=relaxed/simple;
	bh=y6+x5B5px/jnGNLRMJIbtvh5jokuwNxfCPawhKHs9tc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qOkdU9FAhbqI9/0ZBkV0/JpMYEQ3Im0ABkC70a90RHW2rmO/lhTOWsxz17SwTUnO/8Wp3pSHzcEwie8nqncJP7SrPD7oVDJQO/QAlAySTpOhmBgOE4cywShKkuX0dNJn5CSEp8+4LlUiisI1tG+M34KsO8Xv6KKQ4avVvrLrrWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Cjb1epXF; arc=fail smtp.client-ip=52.101.125.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Cjb1epXF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANNshf+PfYfn/xT7Fl2bj1GaH0QN3/7zqlhwI/LC6TMWaFxpl2qVgZrzSPJBsJ3kEL2GyEElwDxkWgaikIRA5OpS6Ies8Vr7h+CzEHxNeig6LPezW1XakDPOurOALmrsQvsSR7juYwdtorKB0iDsg/sQCgZOOB62UVL05kCgjXhJbRVyIPbCBLmKmOqKindCuoib6NEeLa3Me3vQhNa8Jl97GcawKD8Vkw6U3SyCAwlezc7UsXq8a7TCLgxYAEUYxAtWvhtY2izp/ERuDeVQE9l79IacHNwqH89vh4Zaqa74u/qKbtnqazXQW5hD++kofAI2k5lDuBhi2/Wj6aYS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyCpMXuhgJ8G16Kqq6io8QT+84/m1H0R/LKG3bcWU7A=;
 b=VvVp6KYsjz3pEET51h2sUNWhALnRswM7WPKvf9GJALjYYItsPCW6A24bdecVGefhgFYiokYpbyZFHWtW+VcvDeqPkjiosvnIWItHJ87xzKammLzWpZiATMhdmigzwVme1uGyQK/r9xxI9We2F2KyUAJwQ8ENDL7uQa4a0mFTVIElBeOy98ECAT15NEx+Fo9dx7FJMdLbItnyDvFxXfn+LYSQdHqq81JZGhS8ERQGW8Q5pJL77dYZVBSxjIodRF0YIu1+Po/egh9duMacleEFvmkWIy6vL6dGeJ+A83EwxsZAYZkZ493f1nbBv3PFrWO2r2Yy84hqOG/11brqh9MIKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyCpMXuhgJ8G16Kqq6io8QT+84/m1H0R/LKG3bcWU7A=;
 b=Cjb1epXFJjlxdBmbqk6Vw68gNJzrC2EdIb8F3OrMDZHDQvHhuu0k4KnyXlRS52IB9NcLeNBRLZtNo+6yqrBltyGjy0Glo+iVAeGTKP1/q5EM786uCUXmawgf7B6xHLyxVgdP7gfgUNRAufSudAJa4dAbYxRkSzTfE0etutV7ck4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB13531.jpnprd01.prod.outlook.com (2603:1096:405:1c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Tue, 21 Jul
 2026 01:43:14 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:43:14 +0000
Message-ID: <87h5lti0cu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: ti: ams-delta: use &pdev->dev instead of card->dev
To: Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ldb5i0do.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldb5i0do.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:43:14 +0000
X-ClientProxiedBy: TYCP286CA0084.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB13531:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c92292-9dfc-4dae-8fcb-08dee6c96e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vSBbOc4Gp+3dXC0aB9EkBmzCQeIckoQFMtrE7TiCy7i1JBERED34xPHjtpoNSVzch1uwf10s9/entAHQBMTcjaafSs6TiuIq24gVymu1i27WSrbLZJapRKiJQihvlbdk6LSyarWFdYF/6hcpZ3EnI/B7ZUqVeYmEt9N9oJ7vSm/d7RoY+fLVGHqRHJl7VdhD8smDdaBXFVB48Z2Z8MU6jDId+j2Qdt/iXu3mm+GLyG9Nli4HIsWqs6ltkVXiyijsYKsO8B+ICan+VdNbHHB6l4iaWWFTIgBY1aj131oK7g9a7d38XqUO4rSm/U3MZ6wHoEdIK1kgRHBVjsPtcWIjvIcVHJdXKCkhaeLePibDmQfclJXAjYJ20nRJx3aYO0Oo/1kd1GCiAXlh92sokYKLWbCROVZPUVg07S9XZOVxXstxMEYfGdXA4SgCn2jxQUQagRMcGzaQYLPLRKX58hQQEn37IMBc4HdqMWfC2SbVPXjUAeMtleFcToFBzC0maOe3hyId7AkH7Fj2rA1wH/FLSAq+81MOS0HAU6lcQyWdXxBRtHSwG/+iuR+jKBcrWom+0/OHx7wVLgd9tQaLQHNF2t0OGct4Di5gjjCbsrcthC9aVAPam1LWcSX4vmEeDc4h2ZgrtSI7BGqxPfTfraJdaC0+ubdcfhKabaWTDocLSs3tdBd9ZFYENkB9pkug7r78vFU2SvMTwK7S00zjwJybmetkSjhOx7vm8l8RQOyIB0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aEvyPnKbb4PkKpz+MoD39GfVdNzK8SVJxx7xDSsYr1Ou3UpNLVYllACpzusu?=
 =?us-ascii?Q?m4ceK35d5FVVzL9sOSH7c6pBa0TlwDr2pGKePSy9Cfw6jlHbRZWD0d31F4iu?=
 =?us-ascii?Q?2UIOByjlvQcV8chSkk8ik9xVRsq5FAWb8oFsbkWErVkKpGXvEDMnX9m2Amb+?=
 =?us-ascii?Q?P4rslgRiA7MiwlGCQtw54DHB1XQ87A0PLym+ly8sqQc94OZksXVamXc7fjfi?=
 =?us-ascii?Q?MSaRkkW/JHuYkrlPvKa4RWH08Bf+O0SMxhOirDJHwYEfFfeIz5XLNli7OFUM?=
 =?us-ascii?Q?v7tHZt6YGDSn8hhZJyKeZO6zophUfEwMJe4k8dSqXS8S6wLxQgRTaj/LJpot?=
 =?us-ascii?Q?1KoutCQZFZf0P44BwbhWSwezC0Wul9yiQLoGOlH0MN5T7tlX7AepqvaTc1F6?=
 =?us-ascii?Q?0ULyW+G9tFTTbIdmnRJCXiOI4Koa8OO0ZeQ0/zJYge3JuoMCHvwcZFpN8yrV?=
 =?us-ascii?Q?0R31/QXas7W9aApxMq7cXsMql+uinAPyKz18IRysCXlC/zVIH0s9KCcB8xok?=
 =?us-ascii?Q?zyG9aEzq5kFtHv1ci6gdm0OGNX+Wf2sk1AmDKlPTIrqcFyJP0Xh8x4nPr65F?=
 =?us-ascii?Q?7yHtigqbOi47Zr3DGts5eO0zPTO3XXYZlLSv89WBzMI79p2mSK1UXkk55vC0?=
 =?us-ascii?Q?W1M3Q8BOw5h3Us4flliiVL0OzyhGwrYkRcx346BzSZF/AjwQ2ItHceLY9yMX?=
 =?us-ascii?Q?7oZLyqgF1NzV4gyNuTVk8+aZuO2EsLLu2QC4hDfkrnV3uzfIiojPbAgpsBfT?=
 =?us-ascii?Q?EA/MB5jQIlnULasmPzghLNofppNOlhflXcoivRMWSizodBZQJDvhSAWL4y4q?=
 =?us-ascii?Q?h3fmGgIn0FGWEcSVJeBWwY7pvNf7QkRY4NLWeXyeLHPqqm3pZ7mDu2JxsjSh?=
 =?us-ascii?Q?fNTusyzXsAvXLHa7WydklD9ssYJyZCJUxHUl8fm2mCPaq73obwfZcpD5RT9Z?=
 =?us-ascii?Q?mMVdGHonS+kSiPVkhkYjharambmPsEgU8WyQHr6mIUfhs6bc1NDIuTiPI69l?=
 =?us-ascii?Q?uD4h95x8WvKwJiVUqdV61tllErEXXLBnH5lZz8zv3N+cfzqVd6XzoLiL18Kd?=
 =?us-ascii?Q?K9Fw4/hmjbtslZQ9n/8V4myswMZ7HESvC0NwOMY5aky9+2YuGo/sw1iJUH5p?=
 =?us-ascii?Q?dfhJp1fgVvkd+1/wYuSWLCrIytVi9tOONp0F5FjY6D0RzmYc7eNBlgRO/mb8?=
 =?us-ascii?Q?tlVI4yCKL5zQ8Eiv0EmXM7HZqYa76V5I11o1PNp2ifjyHUw+Gydw/N5JZR/4?=
 =?us-ascii?Q?xKdlyLFloI/J+zeMgwECVLXZThieV6v11hGB2azrySz41CJjzNzCiAd9PV+G?=
 =?us-ascii?Q?EGIXCkYDvwtwmie+iH1a2jYqcddHBXWPlokjV3oiuRkH0dN9HhurBphS4yqL?=
 =?us-ascii?Q?EnohbveAxCQFMRRivZ8SYGGsk0ZV6h24i2Nm8n1eYs0ojfbRQYCPs0IpsZ9A?=
 =?us-ascii?Q?E6lOJ0jONHGkW5vO0MOFICYTrwa/LXcc6upv1tGOe4d/jftnMimZxdroKFcJ?=
 =?us-ascii?Q?+xTxM88osTsvz+nQqqFhHBpAVNlK+swiWhyuY07X9dFbUvR8HgxH6vUTaBgo?=
 =?us-ascii?Q?g1DajjC+ncFOKvXZd8HE57Q9VkChbI/8M2OKRxdPodhhKINeNRGio02CRp+t?=
 =?us-ascii?Q?5C4sOqiRdJ1GUCcehuRLu3MHnFSHOwGMw0fJni5sXQYJgDpUXXO8rhdl1Ov0?=
 =?us-ascii?Q?/W0sb0DhFsk6L/ZEoewGnelEeaAlUinHNg1NV0xm6x4u4t8Bi14QEj55gYWb?=
 =?us-ascii?Q?xT0vglbYf9vlA+e2YUKOrY69ntTBne6VYe0rlDe/AN06FYzvCAU/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c92292-9dfc-4dae-8fcb-08dee6c96e09
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:43:14.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pu7EOG9w9BPDXgnL11lUcYd/5tf8jx9UrbZ4Of3Dub0FyHSdY8LfQSFjTNp6ZZJDx37CwiPPlFlb3b3YIOtSxa7sgjcqa5XyaOqT9/gtXHg2JVrxRmo52Oty2Vce0ciB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13531

ams_delta_probe() will be updated when Card capsuling.
To makes its review easy, use &pdev->dev instead of card->dev.
These are same

	card->dev = &pdev->dev;

No functional change, but is preparation for Card capsuling.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/ams-delta.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 61252359d5cb2..6a0a3a2073bfa 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -562,12 +562,12 @@ static int ams_delta_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 
-	handset_mute = devm_gpiod_get(card->dev, "handset_mute",
+	handset_mute = devm_gpiod_get(&pdev->dev, "handset_mute",
 				      GPIOD_OUT_HIGH);
 	if (IS_ERR(handset_mute))
 		return PTR_ERR(handset_mute);
 
-	handsfree_mute = devm_gpiod_get(card->dev, "handsfree_mute",
+	handsfree_mute = devm_gpiod_get(&pdev->dev, "handsfree_mute",
 					GPIOD_OUT_HIGH);
 	if (IS_ERR(handsfree_mute))
 		return PTR_ERR(handsfree_mute);
-- 
2.53.0

