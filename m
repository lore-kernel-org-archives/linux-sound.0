Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010066.outbound.protection.outlook.com [52.101.229.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF82E3CF054;
	Thu, 14 May 2026 22:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778799329; cv=fail; b=VA9cmzuWory5tC28u80dw5TBcBi1aTuN9hQGlPwVuAAY6bmKPZPkU4YVamo5Bi6SGekrd9aht0getyG3+IhQlK/BS0WAF3Tzqk5XTMeT3TxQv3F0OPlhVu5gTA6s0pA/bvAXwcD9k4tLZvZCIr5z795CXqAelHY3kOR6Dy0CwI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778799329; c=relaxed/simple;
	bh=1g46E0tb4ldjzoA1n4Nbq2clpIKbaBY/bdQ8+wsiW0o=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EOBA8/JBHsuxpWi7YtWWYg0G8NL0Pfkn0aoZAGC3n2SHAJDhkhkJ4w15NafFu/MZ+3cFj8+HswY52v+Dpyx614LAA0ZDZcBzHfTsQZFT+CUXmRJHfKqnfh0rVywGjD8VMD11kI7sFPWzOX3KbkyfAVV36pg2it006PBDV4kS2rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eUSGIjhX; arc=fail smtp.client-ip=52.101.229.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eUSGIjhX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZVagFIpimo5heIQAzhuW5R+vEq/tDuMW7EvlBOje7qPTwjRnWQBSnv49PgRNPKhmArrKNTLaMdINk5B0ILbWvLmEik76TgQELzzAI58Xw5/eVAUZ6fr8eiH9TsIZjUHrTuPgUcThal8rEikAfF4vC7k267xKu1N7o+tSYcs/iXO2xs+AtlJuWMmzEgVmFrZiZHoy1ESTaufLFk8Tmr28QZIBgBgHhPp7tSFQjk58SJIgyDut7p2KZsYybvdN01Bqv67sAPt6VBDEIr3+hD17AdniaDHSIibX7zvS4xPySgxEERHnzqFgSHQXAsqB2JXMoe0uji0sRG2oB3aTGIccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZcnmdzv3x7SoXeR3ObkTLj5tDBiMWGGng+l2fEeeP0=;
 b=F6LtGkwbul94dx1cym17d9j5q5hQbdVWFShQfkJHsrBNAnjxHdVl3dtf+J8oWZwSBh2hjGiqtGVA/5vBj6lQoOsS3iEQKRORtox1Glu5Yjw4EMraNrlpq9eTwn+YSCLyfYcEEHp40NzCE3ccHIiXD2YKK0GPALgcefYe1AYtJJHydBBHf370LviJoM61/HdctZQOezUMl9ICo7hadJAsvV12VZYWvBKs3ycHM/ZgWheqf/aFcLctLdqIgyl5e0wMQ6I2tyCRJ4rjJpWkbkjZSnjD39AldHW2YSnmmxOjs5m85wRwKZxXyFHzWZepQ1WTXmevfy2aKKQwu5AA9xlYjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZcnmdzv3x7SoXeR3ObkTLj5tDBiMWGGng+l2fEeeP0=;
 b=eUSGIjhXTdQUKFGxO4+A8KaAuy1D+owa1nHZMKxb7WA/DEEKsa6mS/qPaE8phU/+N197fDctuYzRSte6OVOe44hrs7vPKqnFGNXI5NILLMvHIt9VoLWiyqls81qUuS/hCmPVY6JXSbVHdENrabF8vLXyUMFl4cj8JZg6aVPlXnU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB8454.jpnprd01.prod.outlook.com (2603:1096:400:158::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Thu, 14 May
 2026 22:55:24 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 22:55:24 +0000
Message-ID: <87tss9wqhx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sen Wang <sen@ti.com>
Cc: Mark Brown
	<broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela
	<perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] ASoC: simple-card-utils: support system-clock-id DT property
In-Reply-To: <20260514212802.3569643-1-sen@ti.com>
References: <20260514212802.3569643-1-sen@ti.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 14 May 2026 22:55:23 +0000
X-ClientProxiedBy: TY4P301CA0097.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: d597fcf1-a1f5-42c6-d807-08deb20be1ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	w5MGMF1TPKseYP7hIWZ2JO7fDNd08YBiUI1BkN6Ee+KpXiCA4h2STq4gQTssVaQZMUy8dWhYP4WiAL0kr/hnc7aLmDG2GEt98GZZIzSp0JSOin/YJi5pQz97VRCDSJSgWlVoxhd3xzolI23M35u4fLFEtbHGLE+tAPooX/SLJPGBONLmNjDnX9vH6vNnki87On1kKFQd+ZYYJiWsxJBtc1IBHLm99cx8pPn5dxeYlM0L8GVQ5Zl1EHs/uskWoF99jW8yPz4R6mp55tj0mLoA+738nDcDOc93TJBU9AhsqHcGK45phdMD1gQbW7xVIk6U1VQGpn+xiSUtYU2LaQcfK7KbAYzILV3daN4pKgtOE+myz3PU3DL1rA5a1D3UQUEkdogfs0tXmxrMNKc4rS5RzqJtIkLke1Z9Et9rI22wok7qhwJVf0fg22eEvF2tH/zjvCjpUoGfh2tQJ4oZedeFgRzjbcmM8boSjwKLae4GNNW33P/Q5AVyZm7M0VSzAHBJea8AJHNrSZt8yor5U/X/sKqXA6mTEmUy4oWLiuGRcBiU5rqGHsP+6YnzztlUc46IKmssRGE6k4d+VYMfqfRs1XzjMxZdwB+zawJRlV7seZYaYCsbiXnXuVfH6Z20bb7XYqjDhct1WQ95IxJr60IZumg+W/TogdoG94ePa0m2RCMJ3X7xGPeyCweU8/gK+W/rG/OpdH4MtJntreq5Zcg/qYuOsPmjzxoetHEF7vAiUdow9cMARZV2nxPcLn47ZCyi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WbHtpJG7jjb4tFhXk6wOG3aJIR2M9Z1ADjmg3TlK3wYtiz7v0vUMY0w5tMi2?=
 =?us-ascii?Q?EucpYpXVa9coP8MwBOkJ+T7EVNxk85tn2MeJreQ59RYgyZbyYJgLbQ03bvlV?=
 =?us-ascii?Q?cm1lwY4gVe4n0kaXkdAwtDlkN7LIz79n7oPy5cbWnTLG32qfw2iEPWJLUauH?=
 =?us-ascii?Q?rjTlLTb6JkTD5V5MbuT1D1+L+rMghCgDahtX2RVip15Z63aIbFuHuQshjTvv?=
 =?us-ascii?Q?5Qy8MLhcKRRsXYwsiXHqDvIlALVOdEarFif/8gT0XmMA8bVUqvvHj7kSLVih?=
 =?us-ascii?Q?3a2EKZt0PRQtpEUMC+pSnNSwsRwIrDiBbzgFAIFLC/iy/JKCA6UOGDPoRstN?=
 =?us-ascii?Q?QTZkoJTCR/tCEw+f++IjAYRp+E7+An25EDGfBdK1endySMPXBteuukOVvdxQ?=
 =?us-ascii?Q?flGyRlp7PcsZqhg4Xv+TrVTE0nUbEsm5fudEivVzY9pskK8XZAIa0u914w7z?=
 =?us-ascii?Q?o4/jek6Gpk5iciijCSgngMiXRHI1z0VGOdCgi7MPAv05ECf+nYNrAqpLY2YT?=
 =?us-ascii?Q?fZGF0zXZv8fcL8++9JLi+V1ld68e9xiwWR+TP8ua7EMB3OXvQJQb5LpXi7d/?=
 =?us-ascii?Q?1SKMwErIhjT8rJLy6SspMkCdA5Z0B4dgu/vEbkpcOoPtXLdX+Ch//bFA/XsG?=
 =?us-ascii?Q?NsMIC0NU4y536TMZDlYsu6/5/J3o0fmDRjHyIv4yQ1JDNAWsegWihYByBiwg?=
 =?us-ascii?Q?BdVoC+mstGGYjLYzdf13Pk6VGXV8Su9Ok5ZqkfG+qwqg7xOBAXcv33oOwE52?=
 =?us-ascii?Q?9PfCMHOvXVsmCsYH4S7r8EwGuHc9yjH40OINYRPHU84fWD+A5d6TBYMHqd9B?=
 =?us-ascii?Q?xpTjIOeDS4QvBwpIJjGmA4X9ShEw0LhF5htEMuUzN3VwR4vNOThRibZpFQyt?=
 =?us-ascii?Q?WpBYPpIQnAbbWtR71kdyeBlvi/UI1CxBzdPgfqXivoxdywQT06aAhdVSsJtT?=
 =?us-ascii?Q?1SMSzgdQ0EntWGSTqIeC9NgfbKxBiG4heBe32lb6tqwcctawPtXRqZzv1ozy?=
 =?us-ascii?Q?SwEIwFQTQopUcOVVhR6A86u15/Hw1TJc0rSfI/M9G+7qJGq1kaTHXwA35gCW?=
 =?us-ascii?Q?oIS75RncLOKfSBx94r/pxotrhuRU/S2N4J/IuGNu3gi6PGcY8o2Bj0Q89j11?=
 =?us-ascii?Q?KmLnAc9THZ4tdGe6vii72i6pX1Cmtoj44nj88HaGQ8wkn1mAAbXcK9I5ea5k?=
 =?us-ascii?Q?Fas6olZ+3xLoDDvf660h1M8c+a7kvh+6FwBXd2OQPBpxNVevCQ4yfeyIHwHE?=
 =?us-ascii?Q?jgbnnSzUB9ote6p2pqXP1nK+UrQv/Oa6d8wpZtTRfOD0U0IcgXnBWXFOYDso?=
 =?us-ascii?Q?CAsFZzbDi8vy2EI+inOtSOnRwqJnsJ3L7p5e4MmdqDE24d0TtwafaHDjqKFg?=
 =?us-ascii?Q?WNUOce9CAK7UxDRRieTx9fXgsmpVoMmmBPkCbPVjH45MlKeM27PaYr+S01IZ?=
 =?us-ascii?Q?LbXb1W9N2LKWumesWdfJhQ8r4QOLDkd5Zue06dvRdCUBqiOZkHmlR6boNp5p?=
 =?us-ascii?Q?n2r+PvttuHhvuJmKLSbvFN3HLnFmhNXn+OESG16qq0VxAon4b05FDbjHpUAA?=
 =?us-ascii?Q?pZxk4XQooOYZR/3F+gtGZlQCSC/QFgO15oqM2xO++S+sfa6amaZfJOzAUIc+?=
 =?us-ascii?Q?l8wmlLJZY3Nrll73poqovAQGZNaNXoQaTmnSKPKgeursOCCBr5qDVdqa0msk?=
 =?us-ascii?Q?ov0vG+cDzB6XAW3dtMzo4fwMnNpbQAVfCV2LuwRXorJs9STiXQEJUor6pr1E?=
 =?us-ascii?Q?LK+odICRWWm5g3Ud+LvQkfdbo5ZGEwLvzdK23TgAmu7WkUrEpbAE?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d597fcf1-a1f5-42c6-d807-08deb20be1ed
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 22:55:23.9184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVOxTd7+5a999OZcGpDht4n+e1Fdp33Y5wrtaTN4eh14Fbak3I821X2X4Z6o9PhDZpm2KL+rZ1n0gbKPpXE0mbIIzJXik2a91UrbeZ1SIdnXPxqOu/gxYowJ+DhgrRcY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8454


Hi Sen

> Looking for feedbacks & on this before I draft a proper series w/
> dt-binding.
> 
> The generic machine driver never had a mechanism to adjust for various
> clk_ids that is tailored for individual codec & cpu peripherial driver.
> simple_util_dai_init() has hardcoded 0, thus making non-default clock IDs
> unreachable from DTS. Boards needing a specific clk_id have had no choice
> but to write dedicated machine drivers.
> 
> This adds an optional "system-clock-id" u32 property to the cpu/codec
> sub-node. When absent clk_id stays 0, preserving identical behaviour
> for all existing boards.
> 
> Signed-off-by: Sen Wang <sen@ti.com>
> ---

Looks good for me (except DT bindings)

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
