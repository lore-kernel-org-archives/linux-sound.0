Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794791782;
	b=OBB9Z24ZDrkanVkFTQ+hIBZZyIN7/3Cfpi8GzrPX5fEY5vwQ8E7HlioMVdC656R4O8/e
	 JcjLsBcr47cc/u/XAihbzx9e5L86hZHb9CYanuEgytWEUOo7sd8D46RjppDYeh3W2uZZo
	 pTak3kqKTmBLxu4lF4tqxxiOHSGEFfrv6aFSFVjQ+Tm2O2zS8GxNQUDuBQj0osXy5XcSC
	 hpKUVxltDOkgJq5H7lzlhoE8AibQtTdJIk0h0hv9ems27SDcu28gDkdxHjI6IVo0YRY5D
	 zCzMkADddi1pwAEQtiKJCxhrsc3kqqt+agZz0shcVKfGxcV7Rq/cSPmjmsh37ioBg3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794791782;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=pVq7VkF9dD5m1CygfnbjvELArViYj41ZGSAnCcqPlME=;
	b=R1d23Lm1hcvL8cqBCWN9fGCHMrfsoqYSDV+signSibRXqaC9r88AOg6lxUHsKnPG5EcD
	 c3hsVjjgIWn3F7Oi/oEG2g9JXYG0RfvwJTiiGXec5yuz2+xQ57YEhUSKYsLXZCxBILdXG
	 x8Jrnp6DoihUjRfzmkFVdA8ThMCPGmfqo8O4aAJX4go1s3IF2K2y2sUuHtvYHLLiN7/Ez
	 8q1PKBomDOoSliGKyGdJO3Qg3qkbuIBjFV2zcmq9/z78fwY1nU34skyS0SUblGIr65b8u
	 BWt61cDl9yb9qvX5yAu2T8FSXdwUoA5Avi0u45O6+8bUsbaYYX4s7ZlGPH1W1igOi8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=NS1bs3dJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.32
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91581606A32C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 01:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91581606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=NS1bs3dJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3FukFuC/Rtl0Mcsj2P7EcMVvv/pTQQEVU3GsLLaCZS0R9raXrzbzreratkiMXUgSPsqB2kawLXMeW5VKXJgJJWLlVZuft6p0DQL1PVlPxOm6HqMIjadhvAg5X4CY0L5/jEJT+I4ErPUdZoqZgtufSeIT81pHi5KqrHiJFOzchhaYxQZxMMTYNykpkjcY++Jxs9dUhQWgFMeVXilts7Qkz98a5BxoGj0aOjCdmK3pJS+Os7zl4z9ZF5kb9d+QVuR5HE9PL1b01O/UxybHKt5qnSQLea3WHF0jMgVgflYuwpi4W3Y78QzeatF0viKBQAqNO3ru+c1jdmZyXppu+Kx2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVq7VkF9dD5m1CygfnbjvELArViYj41ZGSAnCcqPlME=;
 b=UMKpD8W3PU1W1STN7pzUwVxkGchUpwWaEQBl+Zvv/mhjSMIGUMfEMV3KSeiSejYru/omAJJAybFz3HWm473EouJ85HeZ8qRBj4JjHVk6Et5u53+A5hTh4jmcR8qVqAnwxmnUoBs/vAt7N93BUMrDTUjuRrZf84xGS7xUMeIrQeAEpyw/AnIl3JM+um4x9hE9wvC7EFKk5J6tuZ+gCHBjWuQvKnNy5nC2amyEJsrvGtDwBQAx6V2Wn08yYqnk/Wstv48de/Zpyv3Xt4q7xBSIQoQR0Hbp6xSJ0Q1TpImLcGXG9lfXJZHV9B3Qzuvt+q2lsLJXPOhvdsUW62MeZA3oTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVq7VkF9dD5m1CygfnbjvELArViYj41ZGSAnCcqPlME=;
 b=NS1bs3dJmI9eDj7pUOdpT5Di8au8fTuWFckGNpvi20RrrGwJhuBcy2a8vj2/piTjQJe5PStE6IcY+IHZprAWcCQBiGPP7y2VuA8Pssurn01Y7SkZ3NJe6HQ36E0+4PwBiOhWJVBeQEEGU9eQFzG2Ebj0oTzuVPHrUQ9ua+okY7A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB15598.jpnprd01.prod.outlook.com (2603:1096:405:292::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 01:16:18 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 01:16:18 +0000
Message-ID: <87o6bp37a6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alvin =?ISO-8859-2?Q?=A9ipraga?= <alvin.sipraga@analog.com>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 08/27] ASoC: soc-generic-dmaengine-pcm: use snd_soc_component_unregister()
In-Reply-To: <avW_0Tnvts3ArV8-@analog.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
	<87o6bu28ko.wl-kuninori.morimoto.gx@renesas.com>
	<avW_0Tnvts3ArV8-@analog.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Nov 2026 01:16:18 +0000
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB15598:EE_
X-MS-Office365-Filtering-Correlation-Id: 355c3ea6-1793-48b7-71ce-08df437f3787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|38350700014|10067099003|4143699003|11063799006|56012099006|261026121527099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ws0ipdUkSnmD9HqtE8lBP3OA6LLZVRZGu8ZQgdQoGjKSFWe+hIQ57YfOkrqBBpciXQcjUjlBxwKlMyDRlSIUDM5d1OufyEjqvy/1FGGMvdIqJgEN5Jwvxag8qrULT3BqJJ/NlyfiVne4Gzd9v57Q2TmgSUwGIz2rL10y3D/szPSpuKgL5TP+vaOUnV4/i8gKl8ELiEpctttEMuRQgy7fLHg9shQHl6Xt/bStlZHYUEB9ogZCj+hjsE2f4MHWPoZVZ90He09U6R8QVdOGxok2Iuvzr562ImnxfhHNvcKiffmz3TceynV89++UEX/RN0Qv4SgEpYFzAeXPN9NKy8fGa8oLp2HR5Lghp2bXOlhmJpqWTfHhRrtv6t1rWqCKTIOEuBT5SRk+WWz5Ws2O0bCSpq6/wKZpMMyYoJEU9BHqI6j9nNKPXxDCBzX032qJ+2JmxX3juDYTuiuxhByvHLGc6eDsUHJMDVVeLBMId3XpMwq0WhpsKGipqCKvAehM02CPZ0IWoLyvSxrE9L3sutBG4A63eOjCNG2gW84NP7jzmRGsnejltohQudf1CRUl2lm7/bHy+ZcLZGC4ufEoauFt2XsLl2TsazWgJCBQQJW9JJDH86TCRGJ1Iskfdx/nJ5+Y2k3RbOHMv18tvCdQwWg95E9EDLTxEkadgyfrEMfi8CWkEANoq5tyIvecd4UwPz1ciryh7sKkS/fyWGFyBJFKv8RXV0XYABmPQAAHCJpQhRQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(38350700014)(10067099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HxKi4/3NTTGjrxfaYI6t/A22rMlJpkaFxMsAoU45o9T0QD0uf+kZidfgirFH?=
 =?us-ascii?Q?R8NzY2Id1A7VhIngcvBP9RIAef/tGYg06sK/PYf6AudS0+A5oVTvF7Zgn/mc?=
 =?us-ascii?Q?lzJQPv0f0RgkHvemJYxaBWyU7YoFuEZxveZPfmtCPydrt2G2Y052WRZtDYCq?=
 =?us-ascii?Q?2/H1VkWV46qCsxL5qJVvyr5XfkUwXB7QaGi0cBrBrqop8uZC03lzZUcuqKw/?=
 =?us-ascii?Q?zjC88lfGQf6QCqgoxH26CNZZVXGBy2RrsIQbwmHKLVd9Rs/vhvbWzRoEv1CQ?=
 =?us-ascii?Q?Snky++QHc5bxDLOQBf636xOiyg/VM/vIBZ2JoGk2mp+TzsFSm3abx87jijAt?=
 =?us-ascii?Q?k50VKRq6rmqgeg+HjzQGSiR1ToU4qJSc7VULqnZFK0drm3fksS4Muc9GoZRx?=
 =?us-ascii?Q?cZb639ZrI0Xp3i0lTRBKUCmQbInB/YryC6G5gcOuhm+v9ibQypa4jeDHzQVH?=
 =?us-ascii?Q?VWqMjhn3AXXxw2Ebr5g3vUdA8kp64e99b+lXNuHId/FO929USyNwsZHKSu7g?=
 =?us-ascii?Q?w54LADIVbi9qSRDI2HZDJazwLqyvOb8Q8DaDqAfR9GTCeHTMT9BSKVXjtwde?=
 =?us-ascii?Q?L5VgssCJF6KCDIZkvVv4uCE27SXWEmsNRgLrSmt4WeVK0Cbz4oZshYpZlDrd?=
 =?us-ascii?Q?p9Mge/DQkbV+AFSFMILcY6LqWZhpEoVekp0rnwO40wUZfM59t1da/jVrlEDz?=
 =?us-ascii?Q?QLKhi3HP88NUNLUiNgvFcOuR/pIB2o08776rul/pYILs5ug0zvNhc60ViE+D?=
 =?us-ascii?Q?5to8DWi94IakXbhwInjiRXSWE5Fsyp3NuwrocEIyPzcYagiH1C1sWftr+duj?=
 =?us-ascii?Q?gwhaGnSY9f/hD77deF5wHIwvotFDywtMAlkYKnsJXwgqTqmicb4FD8McbTQU?=
 =?us-ascii?Q?bAKI/egEBGl8mE6QQrC8sdiXVLwiZ9gTcZk/hGTNYQkdjVRYB6kuD69PTInH?=
 =?us-ascii?Q?x+/p4MUV22p5TLy4a16JQDqxYF65mc6TCDeasxdZgqIA1qHMkSWgNiYRfDtX?=
 =?us-ascii?Q?fNcICn934XMHV524mcfMS5bIezWiNAqvUrGnkV91GohMMZ5IcbLh6xjj1C2J?=
 =?us-ascii?Q?sX+y6OBDNyV4KqXLwce3Wgazh7Z8NGcZR+FiHHobqpiA7DTxmXPJpyF8xwaZ?=
 =?us-ascii?Q?eXK0HMxI6MZVKSwo4IJlkgn3x6TPP2xZWjsuJNG64oe63OiG0RyZUkUIDJWN?=
 =?us-ascii?Q?NnU497GzPKY/J7gAuHWbYK3eMlOqcgo5zWYcseysc/CfsQLFMYdcepyaqA+D?=
 =?us-ascii?Q?YmqE7DqsJUAOg05B1RNh8Z4ajx7Pwp3ocmSNZZ554HLtHP8crQvKRFAMLakV?=
 =?us-ascii?Q?tcAYhFxNuaNfuvhwjz66vvKR4SPAtzs+Bt//RGZ3sEqn+14p+tXCN8WBtjsd?=
 =?us-ascii?Q?x1hkIm3Wy6dVZJHb5YBU2nie+wY6fZ40AwWt2FmwbG49j61nl7TMZN+gg7+8?=
 =?us-ascii?Q?G9MSuUXCD6yhhMD9QHRO63jAPf3vaZi2UpmHJ54er/cRoAUwmdQ1RPbto8iP?=
 =?us-ascii?Q?fI0AD3it8H8NtgcVfLNe9vAguCyToGPIW08thQklUeI1BE9E7IwYMDxVXZrM?=
 =?us-ascii?Q?2NZo5yuGAQP6SHb1SusccdE9l8AQt7lL8q1r2047X4VXL4NSWwPXSDmgJ+9S?=
 =?us-ascii?Q?znuyvmugZaLGmPLVzoBlBfV2kM9frE4/qkiqpmVVbDTgJ93PIbKgB2p1XQ5+?=
 =?us-ascii?Q?rrw02gsSV0M+K1/ap12RF6UZiM1Ws+p3fOfv9EtB2yRXFaUrHKHuwOSzcuXZ?=
 =?us-ascii?Q?yR0uORjKFHFAazOWDBUsswAfQ33Sz5U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 355c3ea6-1793-48b7-71ce-08df437f3787
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 01:16:18.3261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WnKHNVV+D6hdY4F9BM8d4chOlNiC8jfjCa6RTGygv3R6li1mNRpk09z7oMD+F1czSOIXRGc0jRM9WLDUZ5j90y9/U/5NulJBYWDnvQckHuF4gR/kyTTCHutM8eOR074O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15598


Hi Alvin

Thank you for your review

# Office365 is back !

> (Z) expanded is:
> 
> 	component = snd_soc_lookup_component(dev, SND_DMAENGINE_PCM_DRV_NAME);
> 
> which will walk the global component_list until it finds a component
> matching the dev and SND_DMAENGINE_PCM_DRV_NAME.
> 
> If there's more than one snd_dmaengine_pcm component registered on the
> same dev, how do we know that this lookup will pick the correct one?
> 
> It looks like the code was written with the assumption that there can
> only be one snd_dmaengine_pcm component per dev. But I didn't look at
> the history.
> 
> Does such a case exist? If not, maybe the easier solution (for now) is
> to check if one has already been registered before registering another
> one:
> 
> int snd_dmaengine_pcm_register(dev, config, flags)
> {
> 	component = snd_soc_lookup_component(dev, SND_DMAENGINE_PCM_DRV_NAME);
> 	if (component)
> 		return -EBUSY;
> 
> 	...
> }
> 
> Then you don't have to worry about the 2x unregister problem sashiko
> pointed out.
> 
> In general there are not many users of this lookup feature. Besides
> snd_dmaengine_pcm there's just mtk-soundcard-driver.c and
> fsl_asrc_dma.c. Both look a bit weird too. So maybe there's a way to get
> rid of it altogether...

Yes, sashiko has pointed that 2nd unregister() will be issue, but after
careful consideration, the issue is not new unregister side, but
driver side which is calling mulipul unregister().
The driver which is using devm_ register() shouldn't call unregister, IMO.
I have posted that driver side fixup patch.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
