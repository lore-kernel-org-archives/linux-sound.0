Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010013.outbound.protection.outlook.com [52.101.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF2BFC0B
	for <linux-sound@vger.kernel.org>; Thu, 10 Apr 2025 00:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744244385; cv=fail; b=l2+6j8alR3O/zoP5xqS9ERMJnIPUZJqhpX9edgTIJBvG4ZqM2aTw1louV4uc8UGhpRuBvENjGyGcoKDJFNHF8ZWhchTLeHF6Si3NKUmxf1RaB/p1o5ALxxAv4szdbOodFYpsibz3Heh0tpa95RTpdNM92ghCLrbABo1fRVJrsbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744244385; c=relaxed/simple;
	bh=+vccVZ2Dh3JTvozdqsPizmJbna3WdGjS4ZMuyrrute8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tBtNQypy6Aic+mgcimdKxBvz4VXD9N4Gh/TfZ3/xi/7QGSzvcQzCQQGeda7m9z69KBeS7gwnrH1yMTJjPlyKQlbkqiTgQ4dBKuX1ZVM7WUaVgHn6cXVMiaP+A5Ocf5JEpBZFZBb9tZ1uWz22WU9+Ml9b4Y4hdO1+ITJKWFcGzt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SaAefA+u; arc=fail smtp.client-ip=52.101.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SaAefA+u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sY4Fjh8ZKkkj6Aqfw3RaB96rWSb2drehht7x1tKuSQ1y4VwELtBZQV5Iau6mVykTM/XdqrQAS6poQFAsBOJ1VA0meSV8H5z2Jz+iHOj3F78FbzIFnEzuvAMvBgTvkQkER4gUtwzFPDYUgGcWSHHmoVA90v0pe322cZBSPPyLM/A+uVH5YhylmKTdP/kvL1Yz2OB2ImF/YTyTVumBsmdpKr248P0O1ga3aXm55rM47sBSTINMnBvrB+e0gj/6C2r3IVJK/bLY0yxQRubCoSb6DEyRnNDK+Tyyh1JFpM9xP8i3YhsnDLM8BdIsp/hNv683XNdL17lw9XEbhEUjTvu9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9WsHPwXc0e6CRPEC2w9/3xn74qmg5RnF2bcsGysCKA=;
 b=Jms3AApFH2eyO8acK6dTLoYmoZ4UBZyZowKFG5SYP0PFvXpjIXLolChCumqBB4GMU2UNK2gaGNqlzWaQzExJLyajVAK35rj0r4Nm+48A8YBoRHGSe/KRilycOYMH9PzorhzZjjpB4ImHOwhWUDcH/apQ0qHHvUZGYWEsfzr+BWGeBrTA0UoQQgUgdfrtmliLQustdLeDEmzLeD36gEl4SSda+SffdW48kVh+yG3hkwyYXgJyjvD98XN3n+j9PX0AkDkqrb5ouUWGRpEWvcmU7X+KFpXr1/GBLeHPoQFdQ7xHMu9O5yPdbr+lZV6vlgbK86En1knhR8NIGZByb4iwig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9WsHPwXc0e6CRPEC2w9/3xn74qmg5RnF2bcsGysCKA=;
 b=SaAefA+uXRh11GQB88uZ7Mhl/hTF3ouMix4RWkVdg+1ZaJ1KDC+6eBMXQqc67sEUFOfcyQROdEGvwHQDkMo36JJlzvy7TnAoUtQ6nLMLlNEBZbFXa6RaWYmqM8EGaiFxBfuTsY9AYE4wkKMNpvpjX9AUu8Cfd6GW/0zQcf3xT24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8193.jpnprd01.prod.outlook.com
 (2603:1096:604:173::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 00:19:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 00:19:35 +0000
Message-ID: <871pu0na09.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Bard Liao" <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela
	<perex@perex.cz>,
	"Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
	Kiseok Jo
	<kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown
	<broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Peter\
 Ujfalusi" <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	"Vijendar\
 Mukunda" <Vijendar.Mukunda@amd.com>,
	Benjamin Bara
	<benjamin.bara@skidata.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH 1/7] ASoC: soc-component: use dapm->component instead of container_of()
In-Reply-To: <921a38aa-8a75-4561-b505-14961d9e20b5@intel.com>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
	<87o6x69h4y.wl-kuninori.morimoto.gx@renesas.com>
	<921a38aa-8a75-4561-b505-14961d9e20b5@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 10 Apr 2025 00:19:34 +0000
X-ClientProxiedBy: TYCP286CA0199.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: fa30d4ee-7871-4fa3-8afb-08dd77c55f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TUkSwa4+aByHhzYQC18QlSu3pk5u2CiZTCiyS/0o3bwro8JMKmtxven9Erbl?=
 =?us-ascii?Q?5nhledql6ugP6chm1o/nGSarnBhw68XL/2p/VIucMKwAXKMxx3xWPfjZ6w2k?=
 =?us-ascii?Q?6cXk3X6r+B0CYz3oK6unSsMiFvDy0SRhwjXPJ/9D4E48tIaQjzpaBe/nYFQ+?=
 =?us-ascii?Q?DkiQNN2HltD+VwNGi3ByIMhSVAr6jv6XAjJ553VMKXxowgtKsmvMnw1qPEPC?=
 =?us-ascii?Q?ARGGFMlt7phgTraPHLmnvG964f6FbdoHnq0Wx2YsICQcZLfyU1o00YXnrInb?=
 =?us-ascii?Q?kbi5+wq0Z5QWaj5yf/VcxhDB4HN/1CPTMHkPnpUitrZbYOzW0WsApiW7ZRI/?=
 =?us-ascii?Q?wnqYHJ2ft9FycSpTU+eVtl0t+zz0/FQeQS/Ne0fHhDy+LtE9AtwE1vsbObRk?=
 =?us-ascii?Q?II/HThYiloKI3VfBjmXLLJPlleM+Ej16LQ/TUfqpb5z6Y+CDhmZ0769p1iSr?=
 =?us-ascii?Q?kRPjnULLW2UeAMAna2m9lHcxB89bhLTJM97sMwUdwATWBRN6LZlQqvz/VcyM?=
 =?us-ascii?Q?lyrFi7MkuLa9axXCEIU+i+fXVfGlBcvb+MSaLHv8rKlA3A6RComDPVKyBNvg?=
 =?us-ascii?Q?f6lsznEPiiHkAseS6uHq/Zc+HhAqD9KpPFs2Nocr7jou/pZrHQyAZc+YzBhJ?=
 =?us-ascii?Q?c7OohTMvtl2kX6kstSGWtSv1yOmhZGIRbZSDnfxdrq2ME00m9wDKZW0NhZS9?=
 =?us-ascii?Q?0QuglglRS8dnqhrkwFtsJdEpHWJs4Dftful1luX4Ia9LR6HqUIyR251iOpoM?=
 =?us-ascii?Q?Sfry/1xHO6t2Wgq0V6ad775aXjv9jzG4Lb9DXMRQthFPyHYko5zLB36JVJnL?=
 =?us-ascii?Q?7gj6nDnpUJkMorI87foxQA6+M6v8dYb6vjSLEOZeajVxFntSMybtFxD6Xsyu?=
 =?us-ascii?Q?+ZHicXJrlxNZwGyZSftm3nhfkNIU6qRd166Gjje6KEhtcY3rjXvuUYcBZRyg?=
 =?us-ascii?Q?3I8RibIV1XSIw45iHbebVXPciPbceTXcEgFoeYUsPy45ri9kZbef/uL3Ad4P?=
 =?us-ascii?Q?EC5ijOIvuK7Sj3XI+yM5r7bQL2x9fIxrzEA9+pC9JqkwjbJwC7rD4BzMqI+C?=
 =?us-ascii?Q?l0XtDc+UFwzAMHKmplHECDdJXssiz2PFO+WyudfdcMRSmD8bJdlQIcfbDeAI?=
 =?us-ascii?Q?jiIzt8fq3FrRiivNdAtitA9oc2UTXn51fgJpBtl79P0ebca8NHNMf710MYh/?=
 =?us-ascii?Q?8UIjYyp5JBiin56+AjazqnVxH1eEuC8XP2bwGsHGEfDpoByJU3UnKEcBU6lS?=
 =?us-ascii?Q?CjOf7UQuPfrCD/2fM4HRyAKKkoOFxf8ps9tWNXN3Q7eILERb93ttxDJ1PvwE?=
 =?us-ascii?Q?QMkfFem08busjBtEEq86cnKkw32d6+GLbt+T5TnIbD6+x0Uq7tEBEPpMn/G4?=
 =?us-ascii?Q?PwuZUUM+yAOpIqyqGeVLVoT4K6jgvN14QJcOBFhYNWvN4YKHEHCNe5gOn0WB?=
 =?us-ascii?Q?qdYIQWvFnBhZJxYQZxqjKrjVyKJKKYYT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UWnH5DF4mlG0pi2xVgG5VJoL5xdV1GyxdwV09XpbtwCzKCwY4nrhxVyM5x8d?=
 =?us-ascii?Q?J8/WGPOa3wAQdvwJFtvYgnviCzAd6ac9Mstlhxc9TPhKaM90LGsQqC9MqXfb?=
 =?us-ascii?Q?Gon4A+Yi6O6lek+OHVNliR8HVIjY6Gs/D5MWKMf0C10RQOKcWv5Eya+zVb2z?=
 =?us-ascii?Q?Jgipezek9KtAZ3KM506+tCnnH3GtEPQZLRhYP1zqgMbNEA6kfxs1tHk2+t5P?=
 =?us-ascii?Q?RLsXkWsvCxIFfbrlZKA1nMUEGKyytHX/sHiUM9a7OMYHq+XhQIWyBLRhdM5N?=
 =?us-ascii?Q?FcUIa+WsLV4XjUN1eTm/7j3+VD4+C25NX8k9YcpF+AbOGlF+ZkoKIyl8BH1u?=
 =?us-ascii?Q?zbeoT+xRdf674pJ7VzUUnR+VK8jNuqF3IAzrZ4m0oTvlculEFJL6cU8oX0ZX?=
 =?us-ascii?Q?BEPU2BRKB3HbAyhy8jJ6LC92gZdXk8wNOiNEFzmtlh6p7bTn5Wh9bkdHTY78?=
 =?us-ascii?Q?IJTPT8gu3I6p3rHW2OrZdk03LO7Fz74e/s5CcORSWHJDxxCPwlSOIirC5sa1?=
 =?us-ascii?Q?VVwN534+1wnF++Zv5l7lA4vClBkd47hJfT9BFA1qCeRLrGgAQC11QZcTz7PI?=
 =?us-ascii?Q?UMPcxYTg9lhgnXaUI5Oz3GT3AVsxN6xjwlBkfQlsde9wOgq6W4xL2abwqGZK?=
 =?us-ascii?Q?MkkthbFmMgdtdplu35q5Ngz7qqdaSflLJza8JD9HZLREfH18AZUMocYAfTFI?=
 =?us-ascii?Q?RW8Xg/nMELeZu4nYr5HXrEevcQnLsfGm96feg2TdwvQ38j88T0LBqd+UG5yy?=
 =?us-ascii?Q?ezM92eokiY2gCTU7L25uOX4chcGR4lj1CO4TRz5qOd7/YZJiXk1Jatv7kIZW?=
 =?us-ascii?Q?upf6q3TJQJmRmfLV4WGDfa/Z4hKK+ItmIVGVpm4nti7EIsCXy5h9ZK7yHT7Z?=
 =?us-ascii?Q?FWjae28yDeT1fRZ3XXGqHP/4aASqDGd9Q4LcxD680MXwzfA7V2pQ2z78ck2h?=
 =?us-ascii?Q?QIv9MeVDnM2yQcn4c6DiwgWBWN+GApUgJcXbTr9qkZG6c/ntkaoEF7ulGimH?=
 =?us-ascii?Q?CdSyXYWKRUyHcUOY4kitvzXRTNmWkYTGSNkGz8tLs1ZboW77cwRlZAs20rRQ?=
 =?us-ascii?Q?rX+ZFPvX2vEe2jx1ej8JDzcahOTVn7vkgGypYLeCq0MVASKh1Io5MrIVL5T+?=
 =?us-ascii?Q?hLIXNlEG2+1doYpfrXuq6GrlxcA7abtU863BIn3dbIfk4Z9VNCfMjerBpZBw?=
 =?us-ascii?Q?UkVQjH5gwLzHRbVv+ue9Vv6RW1/sRv4htLz/qQfyWJCYY/Z5GVQyOHDLwmWY?=
 =?us-ascii?Q?piJLt39dFCqfTx+ALZXHPeQyh47WrSzReDl80DqCPdCARy1GeU993Y66GJgQ?=
 =?us-ascii?Q?F9UtgqgSn0Y320LWuWwYGMdc/dAqhfOHcOKAOw+YNSSMMcOEhPpj6n6iUWIX?=
 =?us-ascii?Q?RffGuSs6yTeqMGLQ1LWGBZzmpzY6yYlrptBuhPOcdLzuwORNP434mn1Gl7Vq?=
 =?us-ascii?Q?AdOY/7QK8aCL9cOpJWLsw7TYky3ND58akcfGyV82OFBtjlSbx5Z2RVQ6fp4j?=
 =?us-ascii?Q?rFyeTMrbVrBY/zUd4t0utMyRgOu9Vivkf+CzL2MN44SAqA5RmS57c1Gwxh4I?=
 =?us-ascii?Q?EWENekOJmSZ8QZ2/PEufe6CFmwa08Ppwezn9/VhIratZY/HYWKQ9fR/DgVf6?=
 =?us-ascii?Q?CQ299sye7pNTzvbHTPPqW2c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa30d4ee-7871-4fa3-8afb-08dd77c55f83
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 00:19:35.2504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3e93foseagpoMsAA3SKtPV5FVGwunzBxto3BsgSczjrfQAu3cn1szigh0yo7CHw0W0ltbOdsYuSCpQuKHAntjd/wDqtpYOw0e3CBv6Gq5Hb4sOti9Z4dRCZETQaCSj2B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8193


Hi Cezary

Thank you for your review.

> >   static inline struct snd_soc_component *snd_soc_dapm_to_component(
> >   	struct snd_soc_dapm_context *dapm)
> >   {
> > -	return container_of(dapm, struct snd_soc_component, dapm);
> > +	return dapm->component;
> >   }
(snip)
> Why not drop the wrapper all along? Personally, I find assignment 'comp 
> = dapm->component' more readable than the wrapper above. We have very 
> long prefixes in sound/soc/ in general, and the devs end up reaching 
> char line-limits.

Ah, yes indeed. I didn't notice this patern.

> I'd rather focus on 'struct snd_soc_dapm_context' exclusively. A valid 
> pointer to this type is required for many functions found in 
> include/sound/ yet the struct is more of framework-internal entity. 
> Strict separation between dapm-context "for the framework" from 
> dapm-context "for the user" would grant better readability benefits.

I confused about this.
If we drop snd_soc_dapm_to_component() function, and directly
use dapm->component, isn't it going to be the opposite of separation?

If my understand was correct of "strict separation", "user" can use
dapm-context pointer, but can't access to its member variable,
like struct clk ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
