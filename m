Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010056.outbound.protection.outlook.com [52.101.228.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED36291E
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 05:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734066640; cv=fail; b=AYcPkoXmDxty8Zi1zYw4HxV/sCcHZ5td1dmWjIXjZ2+QC3AOBtV1pdhQNPz50bxiciAkr42u206te7wWx+OVGKcbBLoO8ycUG5+kyOWU7v6FrBV6+CvB6PzMRacExEs3HpI1QPmEuEVx4LzdJIn2xBx6eVRb7byTrTkHbX8lChA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734066640; c=relaxed/simple;
	bh=qWw5F9mlUgQXv+QkmU5zyhhJUSvvxfb7Kx0+J3CUTTA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t4JUvQHTxXLx/K1N1onTUOcBJa8aS5i5G2Ljk9ykpVm8NWho6fEsUcRGhoy2Zm6rMCJX68/uQPdQe5Bj6J/agsqxSlnbSVro1osRB6BJy91fCFo9TbKGw0DXj56dQ6yuon4N3ElDU1C5pmpxyqfEEji+CK1eNwTW8MFaArch44U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Uhe08pVu; arc=fail smtp.client-ip=52.101.228.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Uhe08pVu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hT8SujPQ64+rXOBWiqmFnymXSxnV5VcrWJSVUzLxUm0hj5otl9cZfInTcBmBYdrz8SZZNRTwh3dzEM8Rid/RDoMbBcjT4NY9hpdD7YALMwL5WmKejZq2X21+2qK/N3kTZBbk5z7F2sgWHz7WiBxjXb/DDb/J5CB464wjG7mGEamABPi14DnXLbiE+2GwU3tsaCP99Ky/nIwa8DKjVfzUBWcZ6sFoH2Q1+tILX5Qpe6UJyPnqQpyBSHbCKjlDPlwGBBioJuzD37Hq2suQf5LzD6FOOM/kV7j45qtjw66oiElrlm8NikvOxDCitguCZiDfCu3bFMWCDU8JNJBywHRuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sqJB3acKeCRmchcdsZh9NiPV+d8a61MbC9M+ZKvZdw=;
 b=B0FwYNq62FCICkU0dsdCHOUHCLxdzYFeyyW3C3HSKKy0OYrvh6eouRvteaV6Z8+PSxOfskQgaw9J0hS93P5dLQkFtCfXri45C/oOJ6XP3bdVeAkXha6IuvZizMLhgH0poLppsNKlv9pZdTI0PVo3OS8n/jtcspQbToE8e5WFATrSHrfHd/LjyipCLZofCk0XVb2uXAFhyKv1BI5cOEYsv5BB6X4Kl2LNKsMSRmMxHvwUgvhj6Y3c8zn63LJvHI7T3sV1LKm/460mKWeUIDCOeotSmEaazbW91tdJ+vs29fw7Mwx6x0CTl1CwvQfB/lKJw0WDZQTNxXCH7eJKHnX75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sqJB3acKeCRmchcdsZh9NiPV+d8a61MbC9M+ZKvZdw=;
 b=Uhe08pVuwkM6v3WFNeWA0NrcocanVzHz5S5RJVuTK4MxZcmgWuix5ffhPE3dNWAbmOhsS2coAjln/xveqNiDI/Ff/FHBDcxZy6yhKZMukEUxNVKkwMO0KWFP3veHjDcCVywzHg4Qo0cJpIDZ7FWDmo4Ds+YQmQ7ct//60VwwkkI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11518.jpnprd01.prod.outlook.com
 (2603:1096:604:243::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 05:10:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 05:10:29 +0000
Message-ID: <8734is88xn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Stephen Gordon <gordoste@iinet.net.au>
Cc: Mark Brown <broonie@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: pcm3168a: Add option to force clock consumer
In-Reply-To: <e17b11ac-bd78-42e0-8fd9-272fb5a41bbe@iinet.net.au>
References: <ea504848-eeb1-4e8e-bbf2-394114802c20@iinet.net.au>
	<5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au>
	<cec27c80-ca7d-43a1-90e2-ce014e56e295@sirena.org.uk>
	<c2b9ae73-6a94-4184-9aab-8c95bd242b60@iinet.net.au>
	<3c39e10d-0d39-4343-bdec-fe3041361cc8@sirena.org.uk>
	<20241207125222.7aeedbf6@rpi5>
	<878qspobvg.wl-kuninori.morimoto.gx@renesas.com>
	<20241209231258.22f3902f@rpi5>
	<87o71kjm66.wl-kuninori.morimoto.gx@renesas.com>
	<e17b11ac-bd78-42e0-8fd9-272fb5a41bbe@iinet.net.au>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 13 Dec 2024 05:10:28 +0000
X-ClientProxiedBy: TYBP286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11518:EE_
X-MS-Office365-Filtering-Correlation-Id: dd567e7b-ab71-4754-b955-08dd1b34761c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DgziIArXAfi9yd+0LOqBue8eQ7XBJFyEmQQIV0k56e1nqz7w+6FvHAAps/2f?=
 =?us-ascii?Q?aTF0u0qTK19Oi+6Teh0lmtQivS2YmOxWf9O+7uByNF8rNxcdIqd8noLcL64P?=
 =?us-ascii?Q?B9nOKeQcjfDvAPNzNvyQjSzEEZS4hh8CgCRwoumpn7jsB58vmXFmhZMenwhQ?=
 =?us-ascii?Q?zefQD9eiI68Ie1yqg9HI0OS//+AFMWE03CBcF19OvXWdTOWf82WGUrHsKCQB?=
 =?us-ascii?Q?2qDx6aTQ97dkdjvfu7WjNZCNnoZPbOCeThCZnLPFgzSErcV8BXuo5f3M5OaQ?=
 =?us-ascii?Q?bMhs07xve2FO2b/zWEHYLwGgqaw3xNyCVOD/qKMOkB9R75jXKYDZCXI5I/6O?=
 =?us-ascii?Q?1LD/KwymMU/whzdANWzHl+wMIVYKm8mclihRfPqadXK1Y8QlEcMGAQ3CJRZ+?=
 =?us-ascii?Q?2UPDWWK3rdfeqkehV4PIKCdVq0CFusb2g6vHpNR27S+Ju0AeHTgplRdg+j3i?=
 =?us-ascii?Q?c0CQdyNgVi903S0ZBVGxGotoUiZdrKLCQ9vFiwpWYv0iuD+Emx8QXYNevdip?=
 =?us-ascii?Q?XJSlRRHR/LdV02fjnfoGAadSO4uNGC1TPrQqt3c792z1pj/dJWZdgyFvqmtK?=
 =?us-ascii?Q?P6OVDfXk1cT5I4Mj5FyNDg5OyuxTOYTiiGw44j43UquqxlDNXsGht0yQXtcj?=
 =?us-ascii?Q?PCOWvAZ2ya7kF6UOA1PUQ3Y8wkd+te3IdQzU+Vp594EZnVP9oFyODbPYsXoW?=
 =?us-ascii?Q?+s1JvRJqxtxVPKcoR1sT8jYv8vRz/021QWuLPL6tNKD9VAoaz0b4/ubD5y9i?=
 =?us-ascii?Q?0H5MOBlaHmMkdxVSBRVyCGZPkmWNMNA1QWCJgQl3houZ13rfy3je14DGX1Mv?=
 =?us-ascii?Q?G7HgSA5aNDNZdbzLjxkaoK3xa38zR6T4jxEZIZeb4/pMso8VrSGoyys4bwHl?=
 =?us-ascii?Q?d4H2E2lfruvobJ1DoZYVAczgv1XwPEK74rBti6NXnKSf64uALLs8AMXf7myb?=
 =?us-ascii?Q?xJU7/SZ4RIIjuw3SGdY9r0NF7WJYRTO+pGMiYRJ/HMqJtAKPzJTRdN3CJTDa?=
 =?us-ascii?Q?ZrRnGtOgXf7hpe6ZLvHuVv4peTO2p9rz6wOT2OScisSAFSddCc1SHjJtTSmr?=
 =?us-ascii?Q?0TEFXDiFVBRO0dCdieyRbC/+47aKkls0PGBB3gOFBseG0PdXkzXSz3rcycgb?=
 =?us-ascii?Q?cRiara/QnQ/CZ4E3o0rwnVE956gAZeODR+2NDM8LgEICKgZ+I0YE9u3xCsui?=
 =?us-ascii?Q?vIAq3SOb0dMhtKyRbeHwgSqya9myhVtuUBzx1B8nYmoc+41aUuvSdyCsfy2i?=
 =?us-ascii?Q?Dg9ikEH9vtYhJ46NasSK+NIUy8A1MQdj8IVJ74xkvCAeqhcXf3wUgD6PKZ1f?=
 =?us-ascii?Q?tDvrBABsYm98TyYRlCQ4Ej9o2FlEs8a45rdMokscW0xKjMZ86M+GMn+AfQ30?=
 =?us-ascii?Q?NBeXKvXXnZDO/pap5KrGGMsY8IxIlsR9A/TgfBkQeKKU274i3g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PjaVoBUjDFkS7JFaWEWAFuEKgxnayXihfCBU89fYXe3aQ6vY9zNCe5R1Q44J?=
 =?us-ascii?Q?+oIp4i3jqhixOsDCb9+iYxV3eoCu2dZ/eF9LSMppiJFDUI8uXlwaYHJyOSiZ?=
 =?us-ascii?Q?4K0+4B8f6J9/i4145axkfn2b5MrJuEL3BkHEZgU5EyRfZUfgXcfRek/CFPkZ?=
 =?us-ascii?Q?IgHOi1iCMOPHer9jwsyrRnfoNvSvFrRAfFFP0jfZFjnbjGhfaCD7rm/pudRL?=
 =?us-ascii?Q?VTwiz0NKgkzzOOw8DJOsX93uGZCG7etJ+Kahmifzb/pqSNN5i+w4v0Nhzo2E?=
 =?us-ascii?Q?BSiFrjVn9NVngmCKeG81d7QlUwYEnF5H8/J5lC5fOJ4aHCTuRaT9kTgd84qO?=
 =?us-ascii?Q?mpBaQsmERlc9Rp5knPEnc7YCDbI3qJXInr3oXWvxl7uhaazDaCvVmoKt11wI?=
 =?us-ascii?Q?0OMWc+PobupUPTyzUgL7IIrNc2MVxMlKGVA9npz2uYYhwibr+tlj3FpOyZtR?=
 =?us-ascii?Q?XHP234/CL9qzIJJSPXjq0X27vnWq0fsfw2vVFtqEAS2ssGx4ugfL3vfjNyaX?=
 =?us-ascii?Q?kriHASQnuxHRESb+wGoPQCaad046n+XmGxweyDbtmqhOTDDJam/6kNQS0dA+?=
 =?us-ascii?Q?YEBNkY1gjf+QsGwZr9OMqHJoY6orTtHuLe6dG8LzJy3847aOKhen1eU7LQpc?=
 =?us-ascii?Q?O+RNCdJUeGKesqW7XOaonyz7QuxCHQsN9NYdOPTNcVQuDebl7h9ZQeuM99AF?=
 =?us-ascii?Q?aNIffutN8An1TlpljTAoj6L9dKkToILqtJwQkKtWpNetH6CiV3hcmJaJbMkR?=
 =?us-ascii?Q?8EqbWZd90i4B7neA0jQzt4/mP2futV5whrNzjPCruyWKHVo8EHnwHtYkLa3B?=
 =?us-ascii?Q?R+mx7NKfO3Hm19UuL/oiwMpFGPHORUBsxpP34BauPCJDYEe6TH9kCjgrI0jH?=
 =?us-ascii?Q?Hf8TYhkSghVyGcu4JQwohV53cbjX7zjYPfw1m+ufMXavikXClAhh8cOp5sGT?=
 =?us-ascii?Q?O4eqrUBzKcv84jsCdkL7woghGiad78pUI7ItKIlGoYNx1QZQ2r1+kIDRe3A/?=
 =?us-ascii?Q?hIPtto2BfG8dOUp+SH3jiYfMYziaz6Na6VoEl9bHN3EMkpIVZWceBYfgnSpd?=
 =?us-ascii?Q?6FQliUUj7Xu+Zvfj0dMEKMCJb/T+20S/wqEPFszEaellx95jlfhvVTgMdmOo?=
 =?us-ascii?Q?Ql3Q3zxVqAGP72LG3uoKMvV0jVa+4lLLfT6WTImUMTO9TGLXYjfw4QSh6nvu?=
 =?us-ascii?Q?Fg7ZMRDBQYW+MU2BaUAzuxxcyIPRJGiDh/TkzcRfxey1nBHuCF5Pb4RG1vsQ?=
 =?us-ascii?Q?U1kOjgbu4KL99g54aro91Ds/7C6uf5iEXM+ggAqMCiQW0G6NtGSuRWDAMoRr?=
 =?us-ascii?Q?GUMvH1zgGzMM99ARAiOFwZIJ/S7SxQsMoZbE/oydGFqdVWRx9eBvBJWPJys+?=
 =?us-ascii?Q?zQhOEOx3apx8ypJY9YDaSW4QYF4F8+s7FO3koWeJl+ZyLQXEqWf+37eY5GvL?=
 =?us-ascii?Q?u3YujWuMl80eCNFv3YqhRzPZiJzc1JeWgtSxvh2TKLzLmuBj2su8iKAZ57kM?=
 =?us-ascii?Q?f12NcfDouL6jXkT+xzK5hU0SgYrDDJ52TAGM1y1qJGU5wx+e6843NuCVvmME?=
 =?us-ascii?Q?VbsTx3dKw82MeZopSterWssDuv1oZNviU0KQkGbS5f9Zo++abA0pKLLk31VX?=
 =?us-ascii?Q?jWmDXZ+qWe/33r/M6wlZpes=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd567e7b-ab71-4754-b955-08dd1b34761c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 05:10:29.3159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jO+s9TBzoTNieG6EmWVVkx30GzcwtuzCQ/1+EgWhrQVefeCfWf7C/nlwtG1uagx8rGwS8cgBPTNOzUq4byi+0va5HqqTnuJj1NdDfDGd5GtVRnMh5TT25ZzAEpW2amfO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11518


Hi Stephen, Mark

> >  From "Sound Card" point of view, setup directly Bx_Fx base instead of
> > CBx_CFx base is not a big deal. But if we do it, we need to have such
> > setting for each DAI, instead of common dai_link.
> > 
> > Now dai_link->dai_fmt is including 4 type of info
> > 
> > 	1. DAI hardware audio formats
> > 	2. DAI Clock gating
> > 	3. DAI hardware signal polarity
> > 	4. DAI hardware clock providers/consumers
> > 
> > I think we want to separate 4 (and maybe 2 too ?) from it to support
> > more flexible system ?
> > 
> > Legacy system
> > 	dai_link->dai_fmt		// include all 1, 2, 3, 4
> > 
> > New system
> > 	dai_link->dai_fmt		// include 1, 2, 3 (or 1, 3)
> > 	dai_link->cpus[idx].fmt		// include 4       (or 2, 4)
> > 
> > 	fmt = dai_link->dai_fmt | dai_link->cpus[i].fmt
> > 
> > "flip" has effect to 4 only, so New system has no issue with flipping
> > on dai_link->dai_fmt.
> 
> Hi Morimoto-san,
> 
> This is a great idea. I'd add that #4 could still be in 
> dai_link->dai_fmt, but the new field in CPU/codec 
> (snd_soc_dai_link_component.fmt) should override the setting (not a 
> simple OR). This would preserve backward compatibility (I think). It 
> greatly improves support for multiple codecs sharing clock lines, where 
> 1 codec is the producer and others are consumers. The bit/frame logic in 
> simple/graph cards should be able to be changed to handle this properly too.
> 
> Without this type of override, the original patch is needed (or the card 
> driver needs to write registers directly, which seems bad).
> 
> I will wait to hear Mark's opinion.

I'm now preparing the patch for it.
I want to more test it. I think I can post it next week if Mark is OK for it.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
