Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E1E18756A
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533451; cv=fail; b=uIIYBAcaDre5pMiBhuJTxsZVIbc06gLAsptuRtxQ2OTyCE9IxaZoF9P9ayE6O+nNYVi+1dChyTtCnVZfmPv7gXKLaZSirqPXpQ+BQNrggkwXAoWKH840ClfiURpzWl2HXiIBkGnOPe/gflnchV6pFCVIOfAQU+cJ/3Lzf6avJuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533451; c=relaxed/simple;
	bh=9eMLMDSm6AZWuYmGr3DAyrCbmu9yOh3jXVZuU5ZB8oc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dNsTajPhvWkai0b18ebwilAJGQETek21DkrCm3lAULs3/n/GPBhzsR/RTDimnQE5bhs8J/zBmW1m5Oe9B6q1IN9dimiMLi3n97ug+CPGhgx6ub/MmHTA3mSmcFGOSdhaNaeXVN70LO8D3RVEvL2o5mof+l9QxFXmHogVxuSUuQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Qztl3GGQ; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Qztl3GGQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKrlIGydJkAeAeb23G2Bltr6xlpgsX4bVH5H9foFGw49c47PWr9WQ24OqHJnXKctg82plzBI73UT7FY9yFU04sVWBvQTWsnUYeP4SFDpJ8VSqeVop1kd4NwFe0kyNljUepyjTp54wDX3X7k0p5uJ7wJHHCiuef9UUEccsKZUmiD2OTk2v4qvShki2+d+2ZW3XulwshKjfaYk48XovKpgVm2HAEqGs4r41AmuKguRaBsPhsVOjGONlXXibLewYY+t6bySK43XEvM3czXhb7XYqmSk9GDcXijngSObHVdgc8Hfd2gUMORTjiYHnAiNsMXGY1Wfj8nNMEWYx/qiqbuK/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrdtwtlCLeHmplZiwLYSMvysi8mvJr9fhPVhjjnOuCg=;
 b=DaPmxleBkge9K00AwM2gHgi4Kag7AmpkcUy14sL1Sg6f/vI6BMgZjXfJue/e3tdk6aqG8VrhfCsG4FdSq4NZvtN0/ct/ZMck2kM1jp0ZBq5Wt36C6uOuEWWbf/SVPG/Aj+cEx6rm8MThDVPBBTMMVNz0Iar4Lm7sKP+9/zcrMG9FHTNEtTkLVr3QyJdsZddA4p8VZ5Hs5aKzkGMRPyBwrkipxMOBDfGU6UraCteggQHcvQiDLXDukh63WX75xxsh7oU4UpHZWZXd6kWfc/T8IkfAPDUMZWKm2/bdsL1QFOgRfelwuFrYnXrjYOHdPEXzo251hquXRc8iSQTQ0ZJOVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrdtwtlCLeHmplZiwLYSMvysi8mvJr9fhPVhjjnOuCg=;
 b=Qztl3GGQREEAi+IfzJkkSm6pBN1dbr0hGkD1vK79WErxE+jxie52W/Iyo/CnSsa0rhPh7IAocTbOZY7Z6zp23Y+Vu/0qYENimxcJ7PT7T5mvJfotvicac65ezAfppsgik2DIv6AXfDJfTZdacqd+oQTDt4Fqb6aa/xCWQKRBYXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:30:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:30:48 +0000
Message-ID: <87wmddfq5z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 013/157] ASoC: qcom: sc7180: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:30:48 +0000
X-ClientProxiedBy: TYCPR01CA0151.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1778f3-326b-4b3d-f7c3-08dd560532ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vMWtM7MYo5p3ZtTDQhMmpv5FTsC5nV307tbcOV8FC50cpHJ4Wpz9FxsUQQYJ?=
 =?us-ascii?Q?+Fwdt+nFtgVxZE2ZGVKQPHBHxJMwTHyTcTgLSaujNN47On1wMyDpqMgVxKmm?=
 =?us-ascii?Q?4A6UtuOYiABWQIYJ4tX9PNc14q9FpmLpi1HN3jZVGT9bFz/PfDKffVlk9YrH?=
 =?us-ascii?Q?/dXZ8c0pjrrnXjwKuGMi12Kf632yNfnFaCiPZPGTC4xsSz1zGfRDmbkjA9tF?=
 =?us-ascii?Q?zxHgL2HGqbw8v12mwVr3JIV5txntTcP09dMd1rMhO8vnQ/Y1E5+hXh2Tpckj?=
 =?us-ascii?Q?98+ZsWkVrZmKKZXslFeWibZtvR4eZCCpS+Nr49qkQnJahFEPEge1jdDqF+bc?=
 =?us-ascii?Q?YrmlcwgWlBZAVoZcVjv2NYr9hV3irThcvcJ0h7YtD0ECu5dykbIZkH29/c2O?=
 =?us-ascii?Q?5kQT6prmpHEthl6ODdahwM9bLApwg5BfC11JUWdcZNZQIJMystE3kRacXHOb?=
 =?us-ascii?Q?kBytrYbpLLuzQQ+ATyIeOKrSfL7oW04RNr+A4tDsBGaiJ2oYpE46IGDhWCBU?=
 =?us-ascii?Q?CdCIuDvGtzTzqD1B6WwKWoZLQMUTk0j6Lb9FUb239V5bGDhjpqGWiuDzDYfE?=
 =?us-ascii?Q?bSF6q39/P/myq6Wfaej0laldlPe5iZEmQ373Wu0KbJnUINi1RdNk+c/mbGde?=
 =?us-ascii?Q?VvxeS4TZjRa19cUrazwiQ4UPp+9AAnmSAWxB+HX4Ho3jv1nur5okxD2oTKRQ?=
 =?us-ascii?Q?fwnaArUBRYkgvCMWWEdEvkXTiQuIUoLdDRA1EvP/VbmnNSL9rX8uCLYzBx7Z?=
 =?us-ascii?Q?1ETkUqRj0cemuL2QjxXbyFH88p+k9YWikIVN5JPUc8lUge8G28rzas+WDTGc?=
 =?us-ascii?Q?dquHEF6dKoW1qwP8mmZ8iKuH+tR3+qvRyKkU8A7quFgIQGXzddLvmGD8QE6q?=
 =?us-ascii?Q?Xzl1VTT/Q6tca6EvA57dYazbIhlKLbWGcIyijQreTnCOUQeydNZ6uz2oV2AU?=
 =?us-ascii?Q?hWWX+JwRvO9jfEpCbewlPkotZO7d94zZ6zNNtWkwn5pWDuoXaRnBWnLCi5yc?=
 =?us-ascii?Q?XHJl1jmJ3ibVx1hMPb/tFb650QY/1mqsB6NB/T8jYDpMBHxNuc4lwqBvB08W?=
 =?us-ascii?Q?cdHp+kA7SHGUprdI2ksCkCT2CHpFJG9kY4adzn7JJojf3O+v/CNwov/gdq7J?=
 =?us-ascii?Q?h8pLI+FhIuvpkAxbAtXk6rdBNTIoYN/3+XRKGktkY7g9gy96YASVK3xufCZh?=
 =?us-ascii?Q?+FIY1JiunCGNgMaPdQJKiWIIThDmiGvSG6WuvBReJC6eM7gWS18jnentSd7+?=
 =?us-ascii?Q?ZHJdGrxjMQwLnXIKmkX1uLm1E7oTjfkB5iF+oQbvRdwnVOny31Ivst9g+KPL?=
 =?us-ascii?Q?G9JvyPcb8MRdwTFObvy2id4DR0PBKKAQTo/5kigS5eEjax8gwgCpg+GyYoan?=
 =?us-ascii?Q?DDzUzw5xM2ft9HcMoSjl44RErnMaBgHJGckn0+oee+JUhvpYmngk6bmYPP5w?=
 =?us-ascii?Q?bvbxJI1ybxomcu1jY1VtOKy7dRXoahbS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EaLhn+VeC+O1OOVZrUXpzB3XdRlbShB4Mk4HdoQc2Hwg4MuO/5vbJjM+QBA2?=
 =?us-ascii?Q?vKQEKYddeXTBiO46jtI9KPwy9ZIeQADp3DbUnWWgy+Uz7ECZQJDcaPJv7vun?=
 =?us-ascii?Q?uNBM0emjoOCeRcwoQpghtd2p/zIBYJ9QexFcgmNn5TJtN7Og4d0phy+j2cpO?=
 =?us-ascii?Q?PZwGwsK52ZO8eFwZBUt1wDD+MiQv1kZwuDPSL++71F1FJtRV0ZwVPK9VqYhX?=
 =?us-ascii?Q?s2BJ1DwUvbvXpB1NFaQkvtNsWfAk4keSS5im8vR7Q+psb93MR/qIT/WwqfHt?=
 =?us-ascii?Q?W4VgUEAPKqG43v2qB4ro/UsyQMTFussVYD/Aj221O3xlzuWQFN7rq72Ap7dv?=
 =?us-ascii?Q?jEGuzmEPeTyOmzvF48kHAX5WChxt7Gi38nozLjIjE1tiClXHOSYVdkTAkEwU?=
 =?us-ascii?Q?bscPNeTewA6HAeiYwQO3XvoYX2R4J7fKfkU+8vD/IDbUgYCr30I8RIJTFU7R?=
 =?us-ascii?Q?JtIOnoqA9GLQGzkusoQq4A4o/GoKsXWPzcfGulcOMhnDSd2ZxmcZxu1CnfvG?=
 =?us-ascii?Q?ohewyZzHw+HgNxri+WY6+Q+P8rMeYUMFZ+rtgsmb74F2Kz2twd/7zyWxgQ6j?=
 =?us-ascii?Q?xeQulxl532cqqXqApQuur7gmLu9VZLGZCbmPCD7hnI1Po2yIBa8qV/oaPghU?=
 =?us-ascii?Q?7rqbpIud9K3s8BnF0JapxYvzvlYUHdDdtdK13PHUY2AEzNQolrqCJm2cWlWO?=
 =?us-ascii?Q?KidBNn/oLqYes7sdjVo/670NUJcC3ttiAygdJs8DFVnfqku99gb4N0IL6SM3?=
 =?us-ascii?Q?pMp/TFufCzIQLU/N/wSIDnFKxN91Uv9S7PmwmD/bX0ZNEyyQv5N0ufVORw1K?=
 =?us-ascii?Q?kSbnpW5Abr3bsXBLPOOQTf0TtfKSsZ2yneJgzNVfLioJrsbj1sRU6MqE83C4?=
 =?us-ascii?Q?8maFCUG+mkta4ahGl8bo2a6uiZG2+Um4IR33xVnhc7xrfiIQlKyzdj8oW0nC?=
 =?us-ascii?Q?3ITBPM/Z0Sd0j4lkIOuh5iR9B52mnXQUFbiOJsHMMoTai9UM796M8pa7rQ2l?=
 =?us-ascii?Q?hgDjI75jkHiLC5U5XKCkiOBcPCLoAcb+HicSKPpuyuYFmVS/sZMDn/Blg23o?=
 =?us-ascii?Q?2mAQaY10u/qTWVPIr7/h6adM9tNFnXljRVlyO2qqkRFjX8bijJkqTjWJ60Nd?=
 =?us-ascii?Q?4JCgUAZvvoQkcuD5ovH9ZxBQe/xgrHeFWpLyr33PP/RApmJLCnlOFzxj8pvW?=
 =?us-ascii?Q?ob1x3KL6+BU/ZznK/rF6yttoqSePi3P7HgxDhi+fTsWHq6rWR0n1YQQbJEjX?=
 =?us-ascii?Q?AU5DarnAVaqeFXaJs3R53IjjegsNuPhCgzXBFAiDoTQ/43E5xpqtr+2EpwXn?=
 =?us-ascii?Q?itnEb+wuALByFHNg2MZsMA8twKh2LGtZGr5jmgT264+lDmvOlNcipS7e5xob?=
 =?us-ascii?Q?79PZTP3Gl/HOuIht8Y1RB0olB6S+DNmGkvoZPlVBKkNF/CVMzWEvGZrKm6nZ?=
 =?us-ascii?Q?dDji7QfbPPgqQWVHKk77rxu+WKF4J0QPPn31Qjkgzh6n4JZ21+UzU5k6tBF1?=
 =?us-ascii?Q?VMqfKrD+D5C/fIWuW4HkRzgsNyS2SFVH/Ml8gSBtyO3cUW3ewkNZ+KgcD2N0?=
 =?us-ascii?Q?h6kGYwWlhs1uuAmv5ql+x+B7gTyhJT4flhBaTiGgkk9ExXPRUZryHSv8VrLf?=
 =?us-ascii?Q?O/p5i2MnvEQKzeGTcyZSniY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1778f3-326b-4b3d-f7c3-08dd560532ed
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:30:48.7590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4PSCoQkvcpeVwvf+l0uVWmZPYEoIAwKfrKM0vDAzPkP8TzEkBbLdkRpw15fN26IbjkIGr7Kt/kj0klQv75zFeImkvGvl2w0hy+vokOWcNHfHnwBisUO8/D/VuETUXYy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index d95710b1ea4e..84b6ac5d2a20 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -397,7 +397,7 @@ static int sc7180_adau7002_snd_startup(struct snd_pcm_substream *substream)
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
 		snd_soc_dai_set_fmt(codec_dai,
-				    SND_SOC_DAIFMT_CBS_CFS |
+				    SND_SOC_DAIFMT_CBC_CFC |
 				    SND_SOC_DAIFMT_NB_NF |
 				    SND_SOC_DAIFMT_I2S);
 		runtime->hw.formats = SNDRV_PCM_FMTBIT_S32_LE;
-- 
2.43.0

