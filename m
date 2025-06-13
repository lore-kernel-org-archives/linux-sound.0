Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011003.outbound.protection.outlook.com [52.101.125.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971821A5BA4
	for <linux-sound@vger.kernel.org>; Fri, 13 Jun 2025 05:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749794375; cv=fail; b=LKm34yiPDXfpGFxBbbFZVZyJEp9viDGwUfLMBMnhwm1B06phVQkP1BqdR+Mk8Iv3givfBmptzuU/KmNY9M71Kejyp06RnVPKCLIUxGpiLDvsBTSZF/dJ17Fd7zbvNtEjpiKID6mAxnTLPjuScYTTBrW41PKpslYKJrczG0jW8Ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749794375; c=relaxed/simple;
	bh=kMNnnXXjim+nATb9XDNNVQR1ispY5k8RmLoSxUasKGs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DZTv8FMgUgSb1hyAlNmYcG3EV91XvVKYUq1NzCrIHpRyWWYzTbVqtBY54Ac7NQlTEDqrL9A20C7gY6mV9a98Ody+YmOg+oXaxIeSvIsLpRJNefc6PSRMF/mtkz+VfjU0IyEZVTdx1wQg3UweaUFk8QH5WfYm4/t9WVoLiHRV/CE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ehShbP87; arc=fail smtp.client-ip=52.101.125.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ehShbP87"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mG7CqHole+2c0u3AZkyyjaV/Wwzo3oo4feqv9FxGvtQkF3keFXsBs6aPciG2J+SzZDvvguGiNv1kegn0qPk95hqGcztcqrzKrZf849F+vo8Mb+vpFNOQ40LrRa/kYNwjODwqavHC42TS69o/duidBnQp3epL46Rd++GKDEKkre9tA48kGzDqLR0Cu0L8pjtqlZywoGPokXMO/AzZJarpezEhBunTbVJrXxp4Iu3c44yrAgY9q0Bvhw5Q0cudqDY3yFudnUGI/uHmqGpA2+RMyW93rCSlLObn1PIZyI3KVZ128Uya2iH8GlhbHxAEB+r7G2DPDyaGgSl6aH/m20jeJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPKYTKm+baptCnxkHUPjmtapyiD5RTY0a9L+CyCtHgA=;
 b=TIQovm/CTMO2l9I7UFmGzLxhqA4fiakk29Eqy5hqV/1wmQk94W5eE0m2oSBYtqE2DLWrHwaY83nRivv/OaI865CodYqcUi5oE6Mb7rMRLhRvDfKjZMEwVZjiGI9UQZ6MYYDQYs5mFUX0eIqgLNDp5gSUwqAWx6amyoxjmbLsVxQoW0tBieL+/QaBHZsEbalmn4/bLIGkNX9Car5m+rsZMU/wRj5izyRb0T9QjFii7eF8LIO7GjM4YTU/OhoeoY5SoyfOs5zRJ2QzGBnJzWQZ1Z+yj0f0St1FzH8HPE4RBtANYVeXyfyePlYFxuS+A3NWCSQKSoK3V3prdkrrAzRr1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPKYTKm+baptCnxkHUPjmtapyiD5RTY0a9L+CyCtHgA=;
 b=ehShbP87mBIDcoHtOsQm/NbBOj54sFzhTaMoSiuLnhiCIXIVrKGTaZsDWiv6BZmC7gVNW12QO+Mv3PqLxHO/520lUsGWtpTVEAAG+PAxj8WGY5UFj5XpsfTOm9fjRhnSH4Sy2UiPwsAaQUGd/xCDSrT/5PsHbH7aMjoA0T3y2Ac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9723.jpnprd01.prod.outlook.com
 (2603:1096:604:1ea::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 05:59:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Fri, 13 Jun 2025
 05:59:31 +0000
Message-ID: <87tt4k89ml.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-ops-test: dynamically allocate struct snd_ctl_elem_value
In-Reply-To: <87v7p08ad1.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7p08ad1.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 13 Jun 2025 05:59:31 +0000
X-ClientProxiedBy: TYCP286CA0329.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: f455a334-8dff-4d06-3820-08ddaa3f76e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7AmA8ib9h7TeJ54+Rjl/uRUdRvaCdCdyB1pi5ooakm6/86E3WTVcdDzaMBTh?=
 =?us-ascii?Q?oJENwAHcbkMMzYr8SywIqYq/GYtumbXDPUL8JBz0Dvp8b+I9P9EKWHxa6VJG?=
 =?us-ascii?Q?A7G11JueLONZGod6mT78zZppwZC9ozurjrDc47RYS0VDzA+jHkfM1JSL3GI4?=
 =?us-ascii?Q?CVDAc4rOWtCtlP58ZJ2qEHtPKIx9Ljbfkc4noAKkmbhzfevyDrNX3GU1mYeS?=
 =?us-ascii?Q?lJrUPXmX3USgvPWh+RuctjztAE9dOLb0k7khVu/tJl1ybDFggvnuWQMiAH/I?=
 =?us-ascii?Q?BKqcDn5KU//9xdTGbgIXU51afK9oUQHr+ZoS6fIMxBva7HvARldy/UfhlVZa?=
 =?us-ascii?Q?Zor0le3QYz0caQOq7PiLDEsJa1OES0ig4S2N3tG8Z/KUP5nHRhgfzHBVty40?=
 =?us-ascii?Q?AYjXh5ev8D2yioWXxD8FJmqxvk6SV5Hldc7tVetU2BjmMTlySvmtkkrqQBDu?=
 =?us-ascii?Q?YSB/ovc8mhknobK7/w6OQLW0mERTV1KThUKJu8J6lM6KaxnEK4fgMgaSMcQg?=
 =?us-ascii?Q?Xf4lujSpb1ZLJj2gyqcsRszIhznBeyBQhSzIBU4DtfFs6cELyQ+Ra0/d4oUN?=
 =?us-ascii?Q?tSH278GrDU90sVLoG+76g1ajqeQdBL/EDtPoF5oJg5NbnQhSgHe9SPpgEEZx?=
 =?us-ascii?Q?sFZZwWDNWLHJSHEbgRr/QMlIJn2fcfqXITgnf1YUiX15ewqGhy0aS08gN+RP?=
 =?us-ascii?Q?wEyopbwr1qGfDeqH1aPR4jrGwId//Lv3JsuRnzlHNCl/+Pw0KqGApH5f6K6+?=
 =?us-ascii?Q?FFn83VAhhYzjkFJukqKNegwIZ5xa8lfzSLcj4BxbCkyyc0tL7Wn0eE+K/fib?=
 =?us-ascii?Q?dJaUlzW92txViU9bI4RGKKWQxwJYx44ULJFMxATdK5++ZXynI4aAtI/SWPl1?=
 =?us-ascii?Q?kvigSkcl3rSc173Bqm5XRe7+uxpVRq+BWx50LguhkcPqG9bvtX0Wua2j/DKq?=
 =?us-ascii?Q?2O8rXCC5sR2szMvvSGk6dkcp3E2xj6+wZhaqnfVmlahEIWeb3bB/JHSBRp3l?=
 =?us-ascii?Q?iRzHkELcI8Lxid1EFKVUwORktnc0XEZPEU7MAskm24+G0gv7qpJg2FfZcOuP?=
 =?us-ascii?Q?QGuF5JSpl0BE6X7IeGODee0JZOE54T6bl+uhR7EJ8G73vayAMp1Fbnvt4ZTR?=
 =?us-ascii?Q?A84Ex09Y+CXQCUVJt1PAlUk0WG9pVlD0kpHfY2VltvwUto87H7P20UwEBiZG?=
 =?us-ascii?Q?PmTKefh29GE6h3CDxEgDjmuxPDStcIGNCi/n7NQpTda1BYk4+1JdLNcWDLvX?=
 =?us-ascii?Q?DmKUpuaQ9ZfN4xKSLXhXfj2EYuI4RSTRf0qO6+t49yJrEfS5EtJ34EYtTy70?=
 =?us-ascii?Q?AiRVL59PnxHaaXgZKeQ57Hlzc1AXjfHODrUom6luNPOEji0FD2FGkqzbNnOH?=
 =?us-ascii?Q?3M+tXTW5GoDWepucN8kirp3DA0wBs3HPf1xx1fjuQWTFOK/WoOZI8DGig/Mt?=
 =?us-ascii?Q?BluOEsCS1jRLl9ycRxU+Ighved8G3NvxB2bQrGFd0Vf8zL/s8EowwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZKGRXy3Tsr4bDDnr/UITPrKqz3Z35LS+B3dya7WjcPpl9TuVxldbL2s0/q6M?=
 =?us-ascii?Q?VHmFc2h5CWHF9YT+sGJNf6UUPRBZl3+AXFBC8dXf1AR5RRrSqVUcjc/dLCkz?=
 =?us-ascii?Q?NyNpCZjz+iT2PrLv8PI8YqsM5nT/GZzGKllwzBDp16UVghxbCPR2hcMyUW8c?=
 =?us-ascii?Q?l3DZhGYP8lS1ySi/yJQNJxhV6JUXdSUWjEK8ntQpFC3zwBWhfCoUSPLyy73X?=
 =?us-ascii?Q?5HcFLtQvE37tDG10ahOgps/Oyq/3H5M+XeCfRX5QHjuiBcMPj6dMzx/szHXK?=
 =?us-ascii?Q?/yiQx5iXiMTWpfASxMNMi+20ysYixFWc1Wom3SVjfqAbcI3IO7p6Zw6N3oHk?=
 =?us-ascii?Q?C0T1M8sHr2PKzVLKBReArGBmNdUyb9SKah0XH3r0vk3wJDVaPurvRnA/XAGv?=
 =?us-ascii?Q?hIo3vSqI+PCciOyoOPNa7XOFhKGrgsVCR+1gKWGqcGdd6ZrtWLdwjehqskl7?=
 =?us-ascii?Q?C1OWPMJqlBiXKjAfXllGyr+GOuyQuL7D8E+zwN//+1p0VCy2J6D09WzOE7b4?=
 =?us-ascii?Q?r4RPrRBgwHDABeSYmWqGUNV7DVqsQh1syTbHJOhZHQruR5MFQ3RA9NMvByRA?=
 =?us-ascii?Q?j5kNq5Qfngjb99vKnwEKHtDOBWcaLemGTp1mZ1gZicSh0AP3FyQ3eO4rv0nn?=
 =?us-ascii?Q?vn3BSe7KAiU+AMEMTOL0dfks/jR5xkFMYYg1raFvink7AJEKhWuy5W9HsSkn?=
 =?us-ascii?Q?V0qN8xpLyrjl+475l7IifsHygulbU3CqJIrVDyN3fuY9Ameqtmr3wzZNS1aU?=
 =?us-ascii?Q?yKeDeyjraOJqhnn2OtV7D4c0V9SDe830OVYx9VmgpdWJdjlr/09CNi3tI7J3?=
 =?us-ascii?Q?M7h8kyQYCHZFniTwKrqYkOpWhCTAKgSl0qObfBoE+LBjZxmxzGtch6xuA0uZ?=
 =?us-ascii?Q?96zFVJRuhQ0xqWBuaWXonm1gAyamyHvJeEvNd8PEz1a5qBTCKKrzgvsfHiNf?=
 =?us-ascii?Q?8/PmPN4o//7agYE9s/eTrzJ51aDV294el+wMLzzR6+JjoIAveLWRwFVTFSv6?=
 =?us-ascii?Q?jqloplp2tQvdB/5P51BxtvEFqoYMW03vn8+0/cEA4g2R2zeID39Magb2X7mt?=
 =?us-ascii?Q?ucPrnrtK7i2uKHI6WC8gJ8TVBWCYfvNwHfz1a9AKKk3mYktLvUgH/GFJc6e7?=
 =?us-ascii?Q?+PhI7SrjXBnhVCvM8DU3TGwwPyaBouDkZab9Y9lNdcYcVwKjz1U8r8gxaL+d?=
 =?us-ascii?Q?jfO0yvMEw0ItS39sPp8I64zvBHoNznG4tZ6EThE1ibbYkpjj+vLzLx0mhV9d?=
 =?us-ascii?Q?7Q4n8R+VPaX6N2dEtEHLQwpNIU26La9yXbm/FlvaYwVVLcHJ1yd2v/1SWUst?=
 =?us-ascii?Q?PZBXwhCJO1Ne1ZoU6RuTwGwUlf+8aqtCP+dHR5iIZAfIaoU8xX7GeGnGZ8pa?=
 =?us-ascii?Q?en4WWM/QJMbeU9feyDs4IGSakPiaRLmKukV9AuN+/uavK3tE4xqxUop4By8f?=
 =?us-ascii?Q?MHMQqW50SitDGjMuwFN/0TEgDRbmNgAww3O3QUFeOQgoBK1DoiNJVE3pAn8S?=
 =?us-ascii?Q?yJhEXNaPSbX0TjzAwnf+r5Aa2ZAPd0IphrYNcKOlUtybao12f6ehwVYLODyu?=
 =?us-ascii?Q?LE9rbvaGlI/hUi3THwQTqGDhVSYGB3oslBHUuW3lifrqkS/nDquENZJqVrvJ?=
 =?us-ascii?Q?jJ8tJX9g/kEfH47PMLM9OVg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f455a334-8dff-4d06-3820-08ddaa3f76e9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:59:31.2329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1rj+DupAaVrZlHg5SJFyPxsJqd6ylXqWP6ZvORZOxCmiDm+6sU/F0AiCqkTPEreXNlZwxNqxy/Gg3jhJ7icVgbY7kMmIUfqfa4gbLSv9eH98+2dfLF1wUVxLaAWpDJ3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9723


Hi Mark

> This structure is really too larget to be allocated on the stack:
> 
> 	linux/sound/soc/soc-ops-test.c:520:1: error: the frame size of\
> 	1304 bytes is larger than 1280 bytes
> 	[-Werror=frame-larger-than=]
> 
> Change the function to dynamically allocate it instead.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> - I did compile test only
> 
>  sound/soc/soc-ops-test.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/soc-ops-test.c b/sound/soc/soc-ops-test.c
> index dc1e482bba6a..172c0ee97aa5 100644
> --- a/sound/soc/soc-ops-test.c
> +++ b/sound/soc/soc-ops-test.c
> @@ -481,22 +481,26 @@ static void soc_ops_test_access(struct kunit *test)
>  		.private_data = &priv->component,
>  		.private_value = (unsigned long)&param->mc,
>  	};
> -	struct snd_ctl_elem_value result;
> +	struct snd_ctl_elem_value *result;

Sorry for my noise, but I want to add comment here.
Please drop this patch. I will post v2 patch.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
