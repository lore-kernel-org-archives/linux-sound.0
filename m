Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F38D3A7F4C
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 01:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789523160; cv=fail; b=slYALGBP3R3WarY0s43IIpddbw91vfMj1VBUWbPnuqyRljJWCiRHaoLxem7ifOKmvvGfWTcZujcCeTMWoMu8BPOwVTRd4Zt/5KpLdWoyK3QcmDSV9BJr6Zdb1J1M2LZGoCN8buqjfHWGxkJCPWpQsUhS1V2UKUYjCrftgiGRdr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789523160; c=relaxed/simple;
	bh=EgniJOuGJkNvq5+o6RNJDc/kWDkLuBP6xh4U09dUQM0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ehnVhZYv9pjxr1vwArCnbOYRzsDLRv9nUd9gt9bOujKacx9UxjaPtxzkmzIZpQpxzpvR80B8qBEL+vdAwvJr1Hc2IyinwmbF78B7/3ojopx5kkwtbykEA4fdxt4qeLbM2sKtjA+deLqBUBREO9Cdp2h9ZAOWowGFDSedXZCkXJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Evt/Zspn; arc=fail smtp.client-ip=52.101.228.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Evt/Zspn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQ2ocVbUjp1zn7vaiTEOl59x3bd1trs1cUL4an5JGrggkBKcyWHw9aw49bub5lohSIggHe/8sNL+OpHGNYLNfZoAQCYkOBSj7/5CdhFNdV30tuzc1D6IFetVGeQkoujPj8aZnvB2kxtUQq0bwZO50BihkzmY+iMVWO2FknLnMGsabMHtbyCT0eV8TZ0VNIJn2sseYSYVG9wN4DO13UXODFAScDo/I604oxH+Y4D5IkjfF5Z4nMj05l+yEiYppnTdzMG6hjESolyed30NcUEAeKokpB3Yxaq97bMMMbtqj8VbReRiID1G3iEm3A3xLlpGmKDfQSe7pWrywv6RWE8DyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgniJOuGJkNvq5+o6RNJDc/kWDkLuBP6xh4U09dUQM0=;
 b=mhKqZ7hk8dx8ikFhRMiVIuscAzR5NJj0tAJYmLO9bWO6UvlR1N/Za3ieScyoc4Xl03/Rz8IawwAtqQ3rLG9b3qh8HVEnSFyW39gLilxGY3edcjkfQLdPUzHyMrMkCIpqGCaoTC4ArmgwhjjdhzC2/ksMzZl4Vrgn2vFXY22tRlCuv1fIQEjpFdEbYGnI5m3ZhCwuSlcPw971vH5tnTb2KPebp0sCTmK9SGqwSSdm1Z623MeBB5nTIKNKIJPW1hbuGqE+l+y0mdX0IgdlZwlgcZGE5Nxz7e0kdPQ46E66onVUN9NUiTL3nf8Gdm9M0DyeH8vsa1qRJtUaaR9uhAOlJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgniJOuGJkNvq5+o6RNJDc/kWDkLuBP6xh4U09dUQM0=;
 b=Evt/ZspngnDnsOypkARPVWPt42yDQln+KiIzr58sygx4eJRW9Q/SBt1/Q4RoJujEVGuhIdE+pL2oHGg4rormwH/gY7Iev2Z+kWRYpUnmL7kL7w13yJZIl2/5nXOhzHpcMAWeCjCJqXq6IxeaUeYPbLeYf7NbCGJUyIbSP8ha44A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYVPR01MB10671.jpnprd01.prod.outlook.com
 (2603:1096:400:2ad::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 01:45:33 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 01:45:32 +0000
Message-ID: <87cxuevuir.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alvin =?ISO-8859-2?Q?=A9ipraga?= <alvin.sipraga@analog.com>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 07/10] ASoC: soc-dai: rename snd_soc_dai_stream_active()
In-Reply-To: <aqnojhexUNccmf7O@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
	<87h5jsli4y.wl-kuninori.morimoto.gx@renesas.com>
	<aqiS7yz4IIYzU6ml@analog.com>
	<874ifrrsy5.wl-kuninori.morimoto.gx@renesas.com>
	<aqke4IixnU_L9osp@analog.com>
	<87fqzavx57.wl-kuninori.morimoto.gx@renesas.com>
	<aqnojhexUNccmf7O@analog.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 16 Sep 2026 01:45:32 +0000
X-ClientProxiedBy: TYCPR01CA0202.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::15) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYVPR01MB10671:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f3881b-5b61-471a-1748-08df13943209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|38350700014|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eFJBZr4GxYcqWHKdndL4r/KGUtI3006Ux/JjfKP67s3pkmG2rRlqlmHb+MBjrkaOPkISSzD5u6m1v2ZiAL9qCzoKrShCNNpX000Nu6JKcUFXdvSqdPKGGrVHiYdOKPXZ+iCF/bJwCjnZuv25ncEupOE6yJO6GpZ+X2r+oWdkBadmvSQrqMlGq357VS98Hny/54mCA7JO/HZfCoNStZcq2qAOUPVm3S3KRICZpXhDSog5YAuLmGy2bR6+73RyfwutYvDSpyy4vWdzmsykNReLTXo6rrQvsTS+kGrFiQ976a9V+9oNc9fkYB6A9pgJ9ITnI5Na9K/2K8Yx0ESZUSpg3rvB68pUeyAll8Sto4b3B5GJIwpC/d9j/vQGz1sGDE83xAbDQiV5uK5187a09jbr/HSpN6jxm4zatbKWI2s2Qlg02Dx/vjEuyy6FMcF5JogQ/KIeEcbATKlgMvfNDhlTrZGh6lgyuGBv6CnMWPmb5psTJ1jG6q2iY4wtreKjzOtCxMsCCkbcsXHvpm5CPua2WZ0su5Gez0BHx7bafzR6h/ihD4C9P93DZ1RoA/2yVDRMJhjFVFGyDwXqj0BweaayiPu7uc2jAbrZJl1USEqRv/dmOZaHZl1AjM9HILCOaFGMltnxjjh06zjynJSoS6MWk9atvkMoELas3Z2IaxJlYr+G9og/LyRqAiyCiAZgBeRDXDdM9N+gCdhYNVule5A8YhhqJiNJIWjw6QfyU+UTM7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(38350700014)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0usvjRSq4VuIRoMpeplENe1cmJrSrmKBW2LXaW5Q62L41sDSN0nWWEYjV434?=
 =?us-ascii?Q?N4ce5jokOu9HxO7Pp40nHAR35n/flD/1prOp9c1UkF2EGBBC4eFQJYMSCy87?=
 =?us-ascii?Q?cegDQYQjYveEdJZyjLKlSN3KGTCVV4DoowP7gzTa8lYyCGmoMrg/8dgbbxLy?=
 =?us-ascii?Q?F2TtsQUT1ynL0oseVN2uUhhAKmGbnQn/w3ZFxcNrhBwq6fF+dfgiIegjOMxy?=
 =?us-ascii?Q?hajpGltSaKAyYzyrC5tLPaXzQCGrSjfcom/Om92FkUPmpsEkX67lMrvH4diH?=
 =?us-ascii?Q?Gk33Ev2n5vEQqypfufHxtJgL+jE8lHJgYncCZP6zzgIpgFP+SPPYMaTbhR7A?=
 =?us-ascii?Q?8vQSh20QwJ8bBGPbEWCxKonV59mNVkKigfjVdVSrILx29yiF1+LOzESWOjHm?=
 =?us-ascii?Q?T96rj9tYVsaru+GKORHuuvKS0OjsnU/pC+OX9AuBbBRkoR3LHVcueN30tl4Q?=
 =?us-ascii?Q?LbX9TGC13L0quP6WuBdpi0K1XdQjd44GKCfz+f3WNfSKrcYWI9WzkQPwEyhO?=
 =?us-ascii?Q?SNz/1oE3q4yCmyC8zRhHyqVr9bjgn3fKcHZKvN4Omd4+ma77RJiSHF/U/Ri2?=
 =?us-ascii?Q?SYC0t7sNPWNqoJZPf/LkHPdh+Qob/7UFvhbVxPx8SIWuDoaa2fNgdAKkFJ/l?=
 =?us-ascii?Q?SNQUcRQMTAyfFhtQNFyLLFdvXe5cDi5eC7DyHJSjjKc12H+RFHp0KD8tOENV?=
 =?us-ascii?Q?NYKICU9FFVFnn2QykV6KjGQ5IkYXYTRPfZiMEruPhYRWSo84lVpsJQUvj1UG?=
 =?us-ascii?Q?XpznbMGWv2EJmMO6dusNzORZY2b321aB/J+YxdTb0/mQPD3kmQk6ddrh1/tf?=
 =?us-ascii?Q?/O4p1TMLyvHfA0f3b+hMyFT1qqQj1YntmoCpQk4bsrJNB1XrWIRTbUsvBclk?=
 =?us-ascii?Q?jyJ4EJ3JstDoDVwIsLgGj1BDsk9UK3RfgclEebkfo16Yw8NViaNx2o2HWAhf?=
 =?us-ascii?Q?9b+yCIRRwVikgcLcKmhDV0XDHRcactipfU9yuV/vW4fED2+u44bTU/p04w8o?=
 =?us-ascii?Q?i8y6fJa9N2EheDJ5uxHTAy5ZKFxrWw7P1yijWcd0t90dzgOUJHsr/kOnbhMx?=
 =?us-ascii?Q?WuZa08YCx03vP6vw+oI7KBoClGFJOOlq+NMYj6rQ0JYEWG9jFZIZlu5HRptn?=
 =?us-ascii?Q?0ZYTXhIWww+JDUwtAdua2OGaYox/ukFnsCJHiuon2Vnu8Fzdr2yq+C2eB95C?=
 =?us-ascii?Q?1MPWSR/MBY7i/i2hEA3aq0alMONQJY0zGmR2TtaDMneNEPZdKealOzLgaow6?=
 =?us-ascii?Q?hAEDTKGIX6tUKvQPm4AjRHMta3eeS1ZQz+j2TG04Q+W545LbP72KonsQhOf/?=
 =?us-ascii?Q?Uo7XFT4l8Y7K+kzyoKZ674o4t01cNtTs1olqk6rhEwfZTGzqZULu1h4xKmBV?=
 =?us-ascii?Q?HyFj01qvsWIf54AyxB2srwrT7X9x1+Y0ejPT8s2s2lyD7I5U5pmwHDCTVkbB?=
 =?us-ascii?Q?NcLQUV16fEOAlEXixVLFiY2DHvJLwNotM3vSYkGnYVqBjnxxcQ60M35epeMe?=
 =?us-ascii?Q?HdjqABBVwhTR5IhUgVF3nVxILUdMGdoDo8T+0i6StxBxvk52A9x0lo3gzIFt?=
 =?us-ascii?Q?Bx/mTw4QsgayIsqN2O3RtcUO4rbikoP2oOhy22nmUxGKqt+DFemYazHtugnF?=
 =?us-ascii?Q?nEbNyZTBuVIA4wx24q6iKImMkbxQH4fzCeMYHkBwv+8mbCJV/gXDFRzQt4Q4?=
 =?us-ascii?Q?EBkwtGV56x6XqH8+YwHC8lJ4Qiw4Q1ACaVW/2aUofwnAqOFU3SJNPo1tUgl+?=
 =?us-ascii?Q?rJcjv8IqS5RDsBwVIKoYelr3R4C9RpIJ2gfLxBPnvERE3tX83zDB?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f3881b-5b61-471a-1748-08df13943209
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 01:45:32.8449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 74clowymHanc9oOBEmZfC4oSAOdahTZH7i9hIP+QIP75bcTcja/KeQpFKy3urF7dVBa4vvYjnW2oqZJAkBkAnDMl7Of/GZjm5QjkGykeNlaZNZ84aAT8kjsO3ZXw6dgb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10671


Hi Alvin

Thank you for your review/help

> Making it a bool would be an improvement I think. But it will require a
> few driver changes, and I think it's out of the scope of your
> series. But good you agree with the reasoning.

Thanks.
Yes, not to break existing code, let's keep "unsigned int" for a while

> That's a good reason to change it then. And to be honest, I can't give
> you a good reason for why it feels OK to me... I guess that's the
> problem with English ;-D

Hehe :)

> I think changing _action() => _active_update() is intuitive and makes
> good sense.

Thank you

> Yea, I see your grepping point. I see from your mail agent that you are
> an emacs user. Normally I do a fuzzy projectile grep[*] of the form:
(snip)
> [*] helm-projectile-rg

Nice to know that you are the Helm user :)

Thank you for your feedback.
I will prepare v2 patch.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
