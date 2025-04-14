Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03DD2AD2C
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 02:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744596126; cv=fail; b=oMoUAmdmreVr9mrQzsgpdWnlM9q3SE8zm4bgLUl7ixJiK6p39wmcNuVsvQZUiyovWTMR3BMaIiBxk2W2XrtqOOJAaCj05WWqfiAg2YPILzFbFGGtbrPnyOtkSMWrtu4HBDwY9sriLETj1eq0cGKym5o4Q88PzW7YEgMWKMjOj2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744596126; c=relaxed/simple;
	bh=jyoWDMSWIEf7LA3AaI8gouYEdYeh1yuK++CQJcS3HQc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=U+AijDc/9BE+sEzm2Ch2IALgAOVZeGgaVtktqhJ7hvtlR/XyvFqlpsek8Wvvog+jxvK0Hj4pT1p7IXTO/2I90/yQjna6lwa+AZU3qLK2b4xFWlJDiKbMz19qh/LJSGNqWeRUHPbX+SZdrZLdTwmWeYHDIcEclaeN4OnA7DR6foc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EUAO/sS/; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EUAO/sS/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjFIZAX6T+xG9SlmzfcfOLTaPpc6wEr5BkKuVSvazAymhDBgdbt+TJa7TjGuJ2S+nEdzfLTFBkREF31xcXk5lWGzqJMW+YxyfLlEqhAcGtZecWvHT76d12NflPgAaAXWw/Qp8Z62tXPC6RWJYhZrkmho93IYJM/UQyU7O3VIeP1lG7pJIbOSNu61NErZ9eO/LM30WP9coPImXEfHkuboydFzH2MLGCjokW9UYmRyZEqfk9F07zeYfVgZTVPTBjlZgae8s1sfb8dQkIsv7dYvQI34nMSDKYs+/rHL/Kg6zJe6+vg++PlCxo99sqarBdZp+U70w66GoGa1i6/+wE2cTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/y7HnNDinbtC1ILsxHMRiVnrklqHMx0v3pdXFHeC+Q=;
 b=OTW4ldBrg2NX532J3GlQqR7k3RgGwv+Hqv7V6Co9Hle73MQih/h5iBCKbKlSA/kVdLl7R6aEoGnbTvxg7jW21CwFpefSLQrZWat1UWZe77fzPMN3xOJw9N+yea8SDEXb32d0zHS1jI2vKqCEvQK/HzhQKjbnz0WkZONBV4evx8mLSVH4PS4kmfB/vtIcdd56YoiDKxsjTOelYL2RZG5W8Mm1lEML60oa2HVy2jfdMxd2Ip/PBYHlciBb4jnX11mliS37u3j4M6rSB7QBI+P88xrbIPYaprOa8g0puGgqRl1uzySlVjttmFZBSCgFvLxx8O0kiDrlaqD37Y3BiSMuRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/y7HnNDinbtC1ILsxHMRiVnrklqHMx0v3pdXFHeC+Q=;
 b=EUAO/sS/kD4y4/39I67HN9CLx6mowV0ymvd7zwsK7fqyR75udlQoWeLUHwBWVLQ5VCzptuO+fLVbHyxSPMmdhxyDQFRWhgEc/jvx/raaHZeMzhYfMgaYWP2Y1nXDvswe5hs7ovqEC12ToXPEKSKvYeW4bEINxfX/jUJEipE2nGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11478.jpnprd01.prod.outlook.com
 (2603:1096:400:37a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 02:01:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 02:01:56 +0000
Message-ID: <87jz7nlcvf.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87ikn7r5qm.wl-kuninori.morimoto.gx@renesas.com>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
	<87o6x69h4y.wl-kuninori.morimoto.gx@renesas.com>
	<921a38aa-8a75-4561-b505-14961d9e20b5@intel.com>
	<871pu0na09.wl-kuninori.morimoto.gx@renesas.com>
	<8734efh2s8.wl-kuninori.morimoto.gx@renesas.com>
	<fefd793a-3625-41a1-9fa1-ddd6cbbf3612@intel.com>
	<87ikn7r5qm.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Apr 2025 02:01:56 +0000
X-ClientProxiedBy: TYAPR01CA0051.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11478:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f1998bf-e8f1-4e0a-d280-08dd7af855cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/P3DVTcTtO0WuQ7y5AhD8dNmI8Ho2cgxJEc6J0IZocjsIap6Dktvc6Ni7gKQ?=
 =?us-ascii?Q?qEW7j1fE+7ojlfvCWm53Y4D4o96LBw7Df/bjE3QLraV0E/uEc6Fngvng9RUe?=
 =?us-ascii?Q?Y2JqO5wcKTxWd7kTWOxaEK3fbLp2T+XMetUrshIu60JIs3Qcg93LcZH3ETG4?=
 =?us-ascii?Q?SYTndvr0B/9VIsabRMoZyG6Frz8oceOhtECBlGfOHZ1T5tges+Me9Qwo42fe?=
 =?us-ascii?Q?GN5LR6Kb/HA/lNyKR1tY6E9DEYUHQ5oI/ECABcFf2pt6TpBD6Dfz6os+MOrx?=
 =?us-ascii?Q?qj/XOodBsMnDDxeMNPkGEgiQRRTxR4vLgqik6pNAU4c0f3cSBg8AsHhRLue9?=
 =?us-ascii?Q?69cscg/67CaaooTUywdNNhorSAb19NoSe2m014STaqYnInbPSJoCXEAafrHr?=
 =?us-ascii?Q?i8hmS+yArg+xoHA2xjAMKQUzZ9LNFTHIhqlT3ubf0eBpr8YkvXIbcyc+bgZ7?=
 =?us-ascii?Q?k/wrcFMjMsbwKxSaSxbOGGByMCxPi/1eXABN3w5a0FUMJgzquoZVzb5PdQvX?=
 =?us-ascii?Q?Fd5BGcO5RFCuIXYOkaFReGUFJ8TFycv9opXSEK2hAHwYjZ7bTmJU01WI+21d?=
 =?us-ascii?Q?oWamf8zsVedt/9N/P0JvHQa3sp6M5f4iVN1LaPXTfrEvV0buqE7iMsEy0LFG?=
 =?us-ascii?Q?bDAEncTyKyTRfh1BslGfMcM/KthyjqUj24epVYsHOrpw/FoL/24oTiuE2F1r?=
 =?us-ascii?Q?xJzufQ6Ruwl68GIc5mhg6tSKQjNqwC6SSTTV86u+GmGd7FaNvPvbG9K2vYnR?=
 =?us-ascii?Q?KgbTAwUicdIJ4qb2VpZTUT1P6elWRDx1TK42pXYUn+HE+zI0nRFjk/7c/jFc?=
 =?us-ascii?Q?Lo9thaf8ynpgSJ43iDEYOHh9ilCl4HBOccpx3VSs06kfio4LhMKplyIxqx3j?=
 =?us-ascii?Q?DSnjpbMY1H5YkOcWx81+3GyhLa8EHViTwXmTfVavr/xgSXfUtkeA4TQlCyp3?=
 =?us-ascii?Q?Hdbvd8RRmZq489OIsfUgniOSrnfY9cIAQ8hs89iI8bHgEa0IdJ8x1JWvYatb?=
 =?us-ascii?Q?5yQ8OpayVAJUk+wuJ8cR/ucDsoFyEl3wN6ihfC23StgBMTXkYZgljC1dMCLP?=
 =?us-ascii?Q?1fmyD/J5CPYU9WePuH/WJYTo9FEZaCwl+JhoT+MOH+p0Nc1kVFzcUxFG7Fbp?=
 =?us-ascii?Q?dj/JP0MZZ0CISzpOD0YQNd8ljuLXpxqHtG0dcGj9HjiqRMxDRY7lzqkahxRU?=
 =?us-ascii?Q?G6nAIGF5U1IiwDgPfI9lG62+YnqGKeMa9RRWADV0EpHtujg/V9/aVREhO4ws?=
 =?us-ascii?Q?2p1/1t+XVoVfQofGQZUC1i6L2Tiohu3lORwulU9a0ziHMQe/FQt/63ABWw+I?=
 =?us-ascii?Q?1xfFHKnBW2UvzuPGA/O4+DgvnjvLZ7m1GeKGo4+Sn3v8wlR3YSlu1Xx6ks++?=
 =?us-ascii?Q?kLtvJGGJexZmOc4KWQsj1Zz39Vhn0Sq/8ZebUnT3SmloOu/KJA5G5lt+i+y3?=
 =?us-ascii?Q?9EwIlRnA+B0hm8UqYto9hMde6mZXI9oMjWHhRGR40ltB1eSCnVMAvA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r/24lkndVCAIpQ1m3PLrH7Gji56lIdU6DdgwG1QFosQNTOgZxWG52dX7YT7/?=
 =?us-ascii?Q?ctTqECbqEHvpgVFGX7yr1yVuWssuBsBfo/k3oal8fyQS2m93Jln/lkfxxioL?=
 =?us-ascii?Q?6aaO6RgYyEurre3ZdTngrFadzrpVCG9ek3VVdEL0ZB41BBvaFSWI/lHzTOwV?=
 =?us-ascii?Q?o2Xv2/z/iNrhzwdjKwmen68qL/6SPPUvrE7lOkdPPG+drqjh0EwbvNzOxPPQ?=
 =?us-ascii?Q?xwOUhZlat36w9jRNEkjhJtP3gWK01zUdkX51STBLm5e6eoP4tLzrJXm7luHS?=
 =?us-ascii?Q?DY9Gwh9+GU802By5nrXNvrq27AvSyYgH1+X1gkbTWF5YJaRthXO5Y+oeXsoY?=
 =?us-ascii?Q?1qPXeMSsoW9HUxXR+GlT2w0c/tbw3yq5/NO80wpMdyaNWhbOOuw6xj6sPr1K?=
 =?us-ascii?Q?XIINsh3bshycNnEzwuJeNNti8MpMV7T6RH48J+fDT4y1nluPB3Arec2IieBb?=
 =?us-ascii?Q?jSVY7s0DMV0wNXR9+S/KZh/c0JdQpfgj6MYg6SmMyk0egkWwnttvHsUjQCF4?=
 =?us-ascii?Q?zC7CcD8HJIWubUUjVOKTbcadaLIgFzK0YZEgTa3xMJluaHK2VTyGB9HSbNpK?=
 =?us-ascii?Q?03NUQz/DBmpekJumsg4ZG+y8/0tA5Mvp9QttmsbqTEq4CTGDp9RWdtcT/jh/?=
 =?us-ascii?Q?GmUTK8dpuoJYFmv2d072NUTQIUGjlFYrPnyG9/nWKHT8l/HHQmWq2mOjKKeC?=
 =?us-ascii?Q?ABYAQy+F5qyJWuPKCPPTY+bO2n5SnBdDeBPNW3QgGG4+t4qpeSz/lzGjxL9k?=
 =?us-ascii?Q?1eB++SEw57xQRkBCmH/5nVBwTV7au0PsYEwr0AP7i/zce5529f3VESjlCPoL?=
 =?us-ascii?Q?DPo9kiqNI60uLVcYcxQgJgqL68t5yzvI36asyowllLW0Fr96pwTyPGUYhVPP?=
 =?us-ascii?Q?uVbA07/wRNO/YA6Ui+0m6r3Gein89BLOjNYSbp/q0IPUGOuJ5k9Eo6emHV+K?=
 =?us-ascii?Q?7yOIHFJYRnaLSnLl7S6bT7T38g3P+R210+xz2F/oHlRQ7fFgeOI7Vn+Bnf9O?=
 =?us-ascii?Q?LoYRXJrNLeRzXHbhUweCT/vuZhAy8IlvHs4pZuuBjKSAQrAH5LWIb9PawLV7?=
 =?us-ascii?Q?2gYNOMJKLALdL8R09ve3U4T76de9Pw3Qwn9+Urr4Gy9eQ40RzHD3p5KEdYXX?=
 =?us-ascii?Q?oNbglsY+v7oUeJ4n/gtmafil56bdEKtTuNF0QE069ZXwlcSfLHws1OFLnbg6?=
 =?us-ascii?Q?q7n37gqUZZpTN1/JEJQ/5R+VXaqSIwRn4gdvxlCzTJRMg1Hol9Gw8kXX2tut?=
 =?us-ascii?Q?Hwn+UWs4OYfdyJdv6GDVmtbcFaMqheM2LEkMJH+rbzRopST8k7ClyoahBRaV?=
 =?us-ascii?Q?2f1kChyBB5Wdz2RIJW3KWKYfoAIWL3pYkJgeoj7xNPD9VVkORYwtROTHluZt?=
 =?us-ascii?Q?g1UFR7RcbnDh05B2tACZY3Bhakpz8wCX5phf6iIUtBYWFNe0HazwGiVIrKeb?=
 =?us-ascii?Q?yDQXebb3Miuijj5Som0knnIQsJEM1DFHOawbQ5t20pL5k2chjh3c6+noTYZH?=
 =?us-ascii?Q?1KmzMwXqMV5I5YUIq1GBlfj1kJqxxPXL5CU32zrvD4jL0P7u4H6xj6NLzRlv?=
 =?us-ascii?Q?CJNtoZFUmJB6oaD0Ir/sdOZs+sh/v7prb5hnMGw6FuQCjPKLoYoAVYCnDv6r?=
 =?us-ascii?Q?nDmjM7RirPDQFQswtqLIj2c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1998bf-e8f1-4e0a-d280-08dd7af855cd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 02:01:56.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uygMjOvvKzXPZ66+CguUZ1VBj+N2Xe8JbwEFtjJETMe3AZAi+B9onyTygKsWZL8m+JnsAMs1W1Wg6REYaZlrtfvkVoNFLpM9/kNDzC2knoljulKB50GUMG0gtEoajDGk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11478


Hi Cezary, Mark

> 	dapm->card
> 	dapm->component
> 	dapm->dev
> 	dapm->bias_level
> 	dapm->idle_bias_off
(snip)
> 	snd_soc_dapm_new_controls()
> 	snd_soc_dapm_add_routes()
> 	snd_soc_dapm_disable_pin_unlocked()
> 	snd_soc_dapm_sync_unlocked()
> 	snd_soc_dapm_mutex_lock()
> 	...
(snip)
> To hide dapm_context details from user driver
> 	- define struct dapm_context name only in include/sound.
> 	- define struct dapm_context details in soc_dapm.c
> 
> To use dapm_context related feature in user driver
> 	- use snd_soc_dapm_xxx() function in all user driver

We have 2 way to get dapm_context (card vs component).
So if soc-dapm has function for these, we can remove dapm_context from
header (Not 100% sure for now, but maybe).
It will be big patch-set. I'm OK to create it. But what do you think ?

--- soc-dapm.c -------

static __snd_soc_dapm_xxx(dapm_context, ...)
{
	...
}

int snd_soc_dapm_xxx_for_card(card, xxx) {
	__snd_soc_dapm_xxx(card->dapm, ...);
}

int snd_soc_dapm_xxx_for_component(component, xxx) {
	__snd_soc_dapm_xxx(component->dapm, ...);
}

--- soc-dapm.h -------

#define snd_soc_dapm_xxx(x) _Generic((x, ...),			\
	struct snd_soc_card * :		snd_soc_dapm_xxx_for_card, \
	struct snd_soc_component * :	snd_soc_dapm_xxx_for_component)(x, ...)

Thank you for your help !!

Best regards
---
Kuninori Morimoto
