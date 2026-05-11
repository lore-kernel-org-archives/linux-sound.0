Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBC77081A
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 01:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778463257; cv=fail; b=ZiekoTLQAulliahmIgTKLawa6BVEE5DfSToJwZl3lkm2rQhx/+hVgWvTlMPk0tgAwcZfk4YVSErXsfg3LAvsDmN6VyByuctiQzTczQ+AD280Sm4nZMQjN7uvMkHvtqoPVXvegvSpjAQ7kmp7R+CPcPq/KV9zxTb0zmGKTz+TqAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778463257; c=relaxed/simple;
	bh=FZGGP0+2UQj38jyguUlIyPYC2fvRDYLQRdqdrqBTscA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TnMWCAlOfecQAyA9uZVWqUgIwqPdbFhsEMgP9r2XF4L6I7ldUjObDV4ICn75aewH0UJcglwKxO2Pkx8YMlSU4welXMYfC1xtl6m5FdUlD3yUXhI34usRyH+Yb0hxrcKikBgc+pd/DP1+2YJtRvjPMUzFeSLkTMeN4GpZMV/LUHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZLXds6um; arc=fail smtp.client-ip=52.101.125.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZLXds6um"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2r2HOvQeFw75siy3OefHB7ctDrSAFnF8MaFZkRggRP5sEEsC+XvGhjhRH45+0DR4hnge2tadNakpvDj83VrbKySctbI7OrLQ5nqQzzvKhzjZr+kfwGQLI9CyfJlEePNmf9ZbHisYNyeM0DENLNK0RL7VOIoT4TIB2YewjtbODpo5o0hzXDAg26jdVY4avwyEk+b4pkuXBrkLt9vqyWdr6pKc4OBOc2Rmo/iJZSUcJ8BaG2cr9OWOFmEc6uzLqniq1ZJdb29eWbPRbrN93qe3dnG/pImbfEbnx9KiA0wt6YWqQHmXFdb/y33+qWJVjkqodZP9zLCBf9/9WzbY5paWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L41rcmNry2GtpzPo/7YS7xrZBFTXVaZW0gnC2djvThQ=;
 b=wjjLCxvCzS+LlbfHqNg95SGJwcUqKweglLPRRypW6QVhtNkDDkPqmsdCV5nsdoZYd1V9zTDLgRieD7ilgIISvveVMbXVNKS3E7oQkkZd0spY2COENAnFHI47+qJl/o4uQkVuri0VpIp0d6yTa7xTDTfk8rttL8M4gdOEC2T/rd/Ds/JVUg/5Dlis83IxjDRJFgq9AQSUaBkdRdk1feccWlcV9GL9FRDWWWqNjJY6noxpFv+5i1oxqv1xOUfj/BJVnrPywBKWGNZfMxgH4Wa2tBRShISYZTZo2PejKWgtqvfGJ3YCsKN3gwfIzj7z6V+SMeVSs9GP9IetjQDkGyLhZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L41rcmNry2GtpzPo/7YS7xrZBFTXVaZW0gnC2djvThQ=;
 b=ZLXds6umcfbZivj8KhpU0B3Q2Ih4EhTie4yFhaY1cxQsonf1TRrf4dfXWePtW8vekqy94YQmelHzn8nRPFlAr9Hg9QQq9aaX4tCIw/H5xkZ2X96CeilOvZ52R6DSABH+irtlKPBoLpu6tb4wuyjd91wpP8VR0+TsDu45udmFwHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OS9PR01MB16456.jpnprd01.prod.outlook.com (2603:1096:604:2b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 01:34:09 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 01:34:09 +0000
Message-ID: <87ecjin300.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
In-Reply-To: <20260430140752.766130-1-cezary.rojewski@intel.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 May 2026 01:34:08 +0000
X-ClientProxiedBy: TYXPR01CA0061.jpnprd01.prod.outlook.com
 (2603:1096:403:a::31) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OS9PR01MB16456:EE_
X-MS-Office365-Filtering-Correlation-Id: aebf111e-4861-4523-e0b6-08deaefd65b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QRZy3IOkZ0HXkDNWZqlq3QpR864DtgGc3X27CX7Mc1RKFr9s5OOntgz5YL6F/Bve8R30fdXg5s8NJ5uo+YpY3U9mLKhD4AUVrrNKrMIRheVMQc9G4Ui6X9RpXFI2XGKSRXfba5BNx0GuO9IzZhfou7/SkN+kaLXxM/Nidt7MWwGq+zN/IJ7O/VBQUe37kWe6+gZpnwcMw1IvJ2nUn8PO7AGk5/OPuuxMCzT8GS2Gre7G/F0MpU7Wpz30/xxBhnERaKe5AQzNU7K8h0fIWyAzUwSqlXGqnLPKZbjUFEF7OIVZeCr3cXjdM4R9RVvrSd4IYQcgMPVtzsvbcsLjCz6jufUoBrCZQSvqen7wuMHS+lbyEOlp7x9he+iofIgj1fQXVZqYYC2dmXoIQuXvvoRW5ZBE7RRoZtD7oHiVsdvRziqwwAs640RAAm9PMmFmdkangVDJPBJJNWp9glB0CouEQrPC8GooFpYURn6Kr5bk0joHmLBB4CC30blewFdDeAJJ8pbqF9Aza5aSBJ63AYCtDOQz0/HaHeJDz8MrmXy0k8LoYAYRZ9GKiCTPbNcYGbI0WQmNUkRr/DSW5Z4WqMxEyUmJCgy8m5fpggyTkwFJplH0SSIkKsWmaPMjW/9Fzsyymsv33TUGTcBy0fLx9XqhqteV4fr+KfvyGDZckMvZkcc23VKUgn7RvySrKREDjGEvjvxUsva+1fsLF8a8sO1YU7qSeuczLLLM3YYaoL+atTkPNGdPnLvfaEdkaume0PTy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(3023799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4O0pV2/EUK2mPp75LBQuZ9VGH5LvDr0WMT7Pxh7vt9ovFS82AxFjaYfMVqZF?=
 =?us-ascii?Q?zANBEDaiC7WNgeky0RN7ykceOQqTAiwb3iX9a6h4sM50ud+r1oeLk/ilUL47?=
 =?us-ascii?Q?fqGX3iLCPShxwMYGgxsMNYCTFEx89/5r1mfML9v8jNB6Bv989Qb5vfbra3c/?=
 =?us-ascii?Q?cdDy4nIIP0Zdd3V+2kfzuHWTKjzoQHAKpVBDpPnBg5Ztnk/3tmVyvlL7LmUE?=
 =?us-ascii?Q?v6TIGT1LN/3YdFJhEmnBbBDQBXwZpN9WW1yQ3rHC+Xpi7Gh5UMUdlb5V/ON9?=
 =?us-ascii?Q?u8HQu5zRSu5O7+FcvbBV/bGjmNP5Bnq5oSY8IX2D2Evi2W701cYCHnqU6WJF?=
 =?us-ascii?Q?Mgjxksn2BSjfFtS25jrnPtix5I1MxCuyR2jwxpkK/AuwAxDjGwqKbJRTWfKg?=
 =?us-ascii?Q?bfHhDz8G9UUYdQyA6rxuLLdWqtePHKsjV5cBObwGmL698CGmOqDwiHwakwmm?=
 =?us-ascii?Q?yXp9uMT8DQlwFDdk+iWdv6/N8NRkSvs1tf0RCLV7jnCUiSRie+KTWA+zg1kN?=
 =?us-ascii?Q?BEEAZ46OvmEhuBYH1Lt2DcN1qH8Aof6a8DLMVJeyO2A93TAiHvnhzpzgdyVP?=
 =?us-ascii?Q?QTawA4S5YAxX8eKvDTKdElMRyTbyKdA1tFDp4WQ5+Mo3EXrO/8a0tLet1s8X?=
 =?us-ascii?Q?xIFkyIwD+TteNofqd6D8w5Qg9/MEz3Ck+tnIrMwwLSFT7yOqyJELCMbtp5mw?=
 =?us-ascii?Q?ZS8shWE8Q4WTx4DNzBiFBg37ClCTyAZ1iaDSRjGBFQSxvQOp5FUjahgVMPfZ?=
 =?us-ascii?Q?IEnOYf45lLIuzGIqOeNtkhQrY1rKWe7RMKFr1zMXrYMkCYmwmzTRhNTgCuu+?=
 =?us-ascii?Q?4GP1ZB1q06jZSxFmKrJH6ybWFJIDlaQJwj1XovcdGqb5g6Y6MhVndeXHafS5?=
 =?us-ascii?Q?KQg8NuiGIftxVXn47bX0DUIrF5ne93eebVjFPcIa3tak4TLmN1XAWOZHtlVR?=
 =?us-ascii?Q?w3eso+msY2vD9uqpGhpr6Hq5mvVD1YnVW229Ybv/Krjahbsi/7f4zkFeuBVI?=
 =?us-ascii?Q?FySPNXibD2UMDlZvMtDTh/lpPIn9Xedws+/NOQau7rp/EhIohVOp+0FJZL5Z?=
 =?us-ascii?Q?FCKvgBphe4xHxXJtWyeoEEzhMffHjMJRDlUnkCii/bYKvBnU91HBUOJQDw1E?=
 =?us-ascii?Q?z1ixxCXJJQ+ouLgTD6kvOoxaIMLXW4CZRXrOivkupnX2angBbRK4jSbp7yao?=
 =?us-ascii?Q?kBIhrVvEMXAQ58LryLd0Xg4A+Ag9PG9k8GS3FFc/L/LPdWbxRAdFW6W5XFYh?=
 =?us-ascii?Q?qKa+GdaXSNJup0I2TqeGL45oua3zShfein6Bm0bU5P5LmpnemRtAQY7KUIeR?=
 =?us-ascii?Q?bAdlviQx1FDi87ff22mmV98xgILfqNrhNcYYN7fqr3ffHRKrLiiDZ7m/hEcS?=
 =?us-ascii?Q?S56oOmThzCBxMpXHhmD6mOG2Go7+b3hlbZYwGdn+Oea08uBWnnIephWTDZCw?=
 =?us-ascii?Q?zGbbiYe9X2QFAADU3jHiCvLZx5va3KxA+annm0sKe1sL7btgxNtXUqQKnbRq?=
 =?us-ascii?Q?2WLl7Gslw31kenKGs3G4L+6qSzfUuWyBOzWD4jORK4F3/7SKAcq/Rmku7Eax?=
 =?us-ascii?Q?gCc3h2cC8k2AOg+O0j7z6j03MYyDnYR1YsAn7scHwYEROTxVnviK2IQAfRAN?=
 =?us-ascii?Q?m553oIfQIzHIk2xp6kr/0uZ05DSto+hsmsgiKzfFRAMkN1ChpRQ3qNu0k/AM?=
 =?us-ascii?Q?D80p+R5m5lamTrNHJv5v1/zv+0U9e4rFYP82v62MzeERSGVIASbgE2Q+DAw0?=
 =?us-ascii?Q?P6cJO3/erHK+gSro67djkwlE8v3PjCIO/VHeZeLnuCztTZGfcIsL?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aebf111e-4861-4523-e0b6-08deaefd65b0
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 01:34:09.2605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cx2elhsBVnIuZMXDWfCxiNcBaXU5gMOfcUDhhfdbfx+ZVZBtbIP6XLibeGnXwLqvcgB+QWqdo4u28ZyWFXO52uw6tX/OxPECZy70YX0wUEkb9vmLHOSbNGsMpu0g4tYh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16456


Hi Cezary

Thank you for the patch.
And sorry for my late response, it was long holiday in Japan.

> Commit a3375522bb5e2 ("ASoC: core: Complete support for card rebinding")
> completed the feature and at the same time divided ASoC users into two
> groups:
> 
> 1) cards that fail to enumerate the moment one of the components is
>    not available
> 2) cards that succeed to enumerate even if some of their components
>    become available late
> 
> Given the component-based nature of ASoC, approach 2) is preferred and
> can be used by all ASoC users.  By dropping 1) the card binding code can
> also be simplified.
> 
> Flatten code that is currently conditional based on ->devres_dev and
> convert snd_soc_rebind_card() to call_soc_bind_card().  The latter is a
> selector between managed and unmanaged card-binding behaviour to keep
> non-devm users happy.
> 
> With rebinding being the default, devm_snd_soc_register_card() takes
> form of its deferrable friend - all the devm job is already done by
> devm_snd_soc_bind_card().
> 
> Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---

It looks more simple, thank you !

2 questions.

Q1. this means, devm_ register user can use auto rebind, normal user can't,
    but is this correct ?
Q2. If so, list_xxx() can be done in devm_snd_soc_bind_card(), instead of
    normal snd_soc_bind_card(), but what do you think ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
