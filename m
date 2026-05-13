Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011015.outbound.protection.outlook.com [40.107.74.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4853439A06F
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 23:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715372; cv=fail; b=QtwqdxQLSN0FqKkUWnTg9UFQo6nRPs0k5PDwgIJ+qjTKyRz0lPj79kVcryjQwZtg9TxnEHxbv/0Tf86Ma8y0R/q7pVUTT/sxhvaZ/EE1v6lxnykBNVasJ7eWLdj4xqoEXrnL4zTjJssIwSSsJAJo/oqyZsx2bmcdqqvzS3mQTIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715372; c=relaxed/simple;
	bh=yB1WiNMbLASDPtEYC5zA0PhF/IZ+Tc3e7sgVL9fX3HM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tygiQ9Ocw7oTbo6vtS37Ss7ZRI7AnYYG8bn4rIVXylCiFtNFaT6AYvDc5szfrPWDuK5zgzlEYhBJKZwcPriOz+ND3Q4oJ1dl9Mc3Z/ABPVzghzozb+eYVZIOSrTI9Q9Bd5s/ggUwNN9bsZCsJWiHpAFvnWzuB7K/jTjxU7484u4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wp9IxHW7; arc=fail smtp.client-ip=40.107.74.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wp9IxHW7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKeGjTwds3dW2YwHnhr/mRF7M8bHhaEdsgnTDJfX3jNudN/K3+83Wnm7qZd2AzKVh2gwP3tYpLmPs0Dv2m0DK2BMVYe1Zn8oHFkKGWnqwb8bY3dUpWo8mwgJP1DjjVOpLJV6jDED5CH5Me6N3mXVZGoV2HiC2+5dkyCPFZIp0CPEEldqKAGGscEnTW+C4CW9P90xI9LNN8DxgV7gSmPz57Q1LMFpnHO6rn5MUkeoo0+h3rBdZxP4fOj+BgKJ6u/TH6ZcAHiPmIyX6va3vsAmVz34eW1T1wviKAjz4oBffSPn3v+/yxNbAf6vYgxdIJPaZ6o9wdRd/3m6knoB5WAd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hijQCV6onNjJkEsr7VNY+rzM/UdJMyrQWBVT+zqfqVU=;
 b=Gu/RTB0oFbFiMgRkqZWRAEMC88nyZlbet5B375wzn0CIUiKsFFmsO8xzvClEiDR2zzDDqFssL7j7LDuiza6+Ngr0nrUFug4q/szFSXY/vZ5qK0yJsGLnkXWOXPJ6Wu4933wKieEFhSqTPws2c0inW6cCgtrZ6iRSpTuQrAGFXeHon+li32K9vmyx/aWYjQQvSvm1EUPG2ePEF3JwpasvXkknkYOhJ3qwOHCLShKffiA7jr/c6f36GF3usIqbm5ZxtEMWOgr/ug3N78TGOw6qxPncBM36WzrHXl/aoDgW8cfHu9rQcJE5hxOIryepxmfosQ1wtBYeSC0wb4cijPOySw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hijQCV6onNjJkEsr7VNY+rzM/UdJMyrQWBVT+zqfqVU=;
 b=Wp9IxHW78RsYKkr4taWdDXzrD53p5Mc6qiM5oq03iuC8hH1rfIgWD3/KLV9QhuLocNP242DT8ccrqKZxYeHozSZHMIX83Z6N8tK3o5x+YgHLAkbfcgF0X06aLF/UL2Cz973lPifvU2KcGyw1RwoEkDBN+f7sqr0r2EXJUo81BSI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB9654.jpnprd01.prod.outlook.com (2603:1096:400:208::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 23:36:05 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 23:36:05 +0000
Message-ID: <877bp69923.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Cc: <linux-sound@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: soc-core: add soc_rebind_card()
In-Reply-To: <959b6684-8d56-46f0-b614-f6457af09cdb@intel.com>
References: <87zf245bc3.wl-kuninori.morimoto.gx@renesas.com>
	<87y0ho5bbf.wl-kuninori.morimoto.gx@renesas.com>
	<959b6684-8d56-46f0-b614-f6457af09cdb@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 13 May 2026 23:36:05 +0000
X-ClientProxiedBy: OS3P286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f5::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0bc2e8-0503-4018-23f9-08deb14866cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|4143699003|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	M8tRrv0tTFPv4w015MxCu/hCl0aQL35VtFoNBT3ahSNd+YzCR8ggXko9AGJMlMI7ouXnzqOgw/A8Ra8eYj4uAuf1YsXBmO5O4wUCF+OOkRHY9RoHpDoLcu1zTMzRopt/CT1rC04tRMaOJ4KS7pTf6MCHK7ZIA9z9zDTShyhoyH2LUsRhXw0tquV9Kz74KN49Zdtzg66KgLX0cXbLZOTVM88OQkB7dxtDLOxLEjerXPY9GABBRDZ5UNY0+jieFd/Zc+j+cy3Wb4Ez+SaDMckOWu57ndFcd92ezkvH0u/V6s6ogdj73OkKw8NAqV9W645i7cS7ubCO5ncEr9HpRQ8aNJXHxrVaNnmr/w7IhuMfk7JsPfnozlQwbqKtpYqnISzK2zAir6Gj71u+bhIC0StVBeLIO6Kxv5ScPoW15ERw/pbShmkYOQDGHf1juHL0Piiq0Cgz2CmRfWs5yhk5Nyx7uCTjgViw1WLpnKCJj/w0WX5ujNTgmj74NlPLatb+idsJjGnfzTeoTnJtigDafjGnsojPIyvsF7xtPKixGGldc5QgTWR+oAZVm56tKlPKdo76i/8+8HZeqNUCESyl1PHieoCjN0iEiEGofwV/nRFLKXrfQdoAljIBy7Vu2jibAmH1l8b9TCODLWSZsVLzIb2t0Ru0k9iHi7bsCE2ZbW2nVp4hI6A9H8Js4BUflOXjwlzlRzyE0wd4p7hNWyI3i5wBn9mnXrSvt8xe/E3W5mN3l6YJnF6fsBBkr91KzqUqDrlZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(4143699003)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CoqCNDUQf22C+IDYh89wBEeoYLRH/bm07DbU3NbpBS8PIkYvpyU2kRft8NH2?=
 =?us-ascii?Q?aUyQzKsK+OHaAUa1UOMFDpVz6fB6hmwUmE/2m4YepE7mhb2lRsAVs3L+pf8P?=
 =?us-ascii?Q?TP75+tOH2ICNXxuGiJ/huVtrX+slOeJT24MYCxc9pg41qwn1uiuB4NlD5rVI?=
 =?us-ascii?Q?/uF9Ayu5XKZKvNWY3wmPBLVvU0bEYmvuVtMUN+3405QLJlvAgOiNFtZL1WoM?=
 =?us-ascii?Q?8n5G0ScE5FN0X9m0TKok+o2xD9PxW1LCvHYmEdh/7AzJR+MUQ4H/rv2k0/ol?=
 =?us-ascii?Q?9LwEiJt85e6GcyfP/zmkUm9ByBmu6tpz8YljIZLmqYDjBYPgM2zBAFG/wgwB?=
 =?us-ascii?Q?t70vqFX8vldW9ydUvoeMTgIwiLQtdGa9N0X73gD90aVOEtYfQQlHfHwtXh/+?=
 =?us-ascii?Q?y0c2r3GkM7DPghZJ/AYkPWeNtT+fu0z6dUxWJKKzl9wYlAdj1DqzkfShqMoi?=
 =?us-ascii?Q?kSM40h59GaIx8Nf+6Vk09T21lL1ZPjSjySkFadvG9PHBZaql5pGN0goq2kE2?=
 =?us-ascii?Q?jsOUVuRqLW7kqpiKQlnYjZJSxNsHae4bNtfj16hfrHZRx2MplTvcgjwp6FQw?=
 =?us-ascii?Q?o9chAWz6aaSdZjFexylxw219BdrVZbKTHKr7p43CJWaCgxo0DSwY0V5vVoDG?=
 =?us-ascii?Q?bxgqojHbm3Zc2ABVjJQnrDc1T2rHuM3cB3n5L6BLwf0PL50Genk+/CfB1kfN?=
 =?us-ascii?Q?9CiYXlg2qhL020hWD/I5dLiUxqo6vIfSyTgg8uU/mQLb6sKw97UzoOp+qCjc?=
 =?us-ascii?Q?wKNeEl6QOwVqNh72tp9vsXK80yFFtDtUXF1qHVzH2LmUNNngzslnj6JdtYnU?=
 =?us-ascii?Q?I8qMaWk94gws8HP2gFkoeu/nmzJ9bl8XL/qKue/4++cr0fvO4hWBG0QJPe87?=
 =?us-ascii?Q?R3F8gSFuGOAfj+pXO8n3my7Y/fmGW2XTIIT4MUouz2WoAQpzZ8kpJvZROhnT?=
 =?us-ascii?Q?GBRN8Fx29/PTMxgJgRZRfm+zJ7mszanAqpLa7ykrWvNzaixa70/UBWDsLfJT?=
 =?us-ascii?Q?tKsWip3yOKUQ7QMjWf6hM8ByTU1UhEmzAy1rI7sTVyJQnj4lyWshIh3vK9Pw?=
 =?us-ascii?Q?/P+2wl1ALcwI+T7troDjn7ii8xEAK2lJ9iYNGU9gGadEe3CXpfTqULIhS6zy?=
 =?us-ascii?Q?cY7qs1K5uA/HOKGEEWfCTxk09e0vpsQqK9Aty0wqathDZ1qwpMtJ5LtoM5+s?=
 =?us-ascii?Q?p2ogfJwTt32e4YlvAhS53TlWaBoh828Nh4hAin4Pqzh8yrzxPYQeZOazzQtd?=
 =?us-ascii?Q?VfrcraWGh64bvOwolVZzc/SflNBRSdVjf49UeDTYdBEteSLGiBP2r2U+J4o3?=
 =?us-ascii?Q?qPmbfJglKc1LXdSiBLFmbz12oTVLkbPLE+yHV0Ykdbe9ZTVu+YX7WNA9aPEr?=
 =?us-ascii?Q?R6x/fSMLfLbYjtnb40WBex9kaAXtqoqH28EpdzDGLhINEHw19My/k7KzOXla?=
 =?us-ascii?Q?PyeabDmlJ15xYt8vuzHqROmT+jM9KRS9jFC0cNkaY5B2J2i0xeKvMCrZrL/q?=
 =?us-ascii?Q?19+bTxfAqmtqi0NL13uvZiCos1rNkXd0+lN8/G9IyR3iEPGiu1umFa5St/Ea?=
 =?us-ascii?Q?/JmD86DfL6OvnJyh3vyH21oNZFpqdDhEeflQ4Q+JhEsWYEYgSekznWxFGeGd?=
 =?us-ascii?Q?9me0OZ5ra3GaXY1GXpKxdb+DeWxiiVkG8JevoSHkikKUgC8jfgHrVxjKm8QW?=
 =?us-ascii?Q?bUa1buJoSQ5DOEU5Jgk8Wr4x6ciz/Lc1nBeKk5tz61UgFyJJ77s+cyl7K+CP?=
 =?us-ascii?Q?HjxNii9AVUxqxwAXDMAdu7R7ePeTCRY19XXyjecBcsyaSKZ0yYXA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0bc2e8-0503-4018-23f9-08deb14866cd
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:36:05.4664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2jrEmsbywIRkl1t08dpI/Po6u6z2W+NcAX60dtTb21TwpTuFxtqOdSnnEsB72XPV61HIo1lD3UqI5gnynLxpBFKt74gbxyCXGOtbYZEcRCsar3ziOvtm2y8lqcZhDtn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9654


Hi Rojewski

Thank you for your review

> > +	soc_rebind_card();
> 
> The naming is off.  Clearly, we're not dealing with a card - many cards 
> could be bound here.
>
> As previous patches related to the subject removed the rebind_card() 
> function, I'm not sure we want it back.  Perhaps a readable macro instead?
> 
> #define for_each_unbound_card(card, c)
> 	list_for_each_entry_safe(card, c, &unbind_card_list, list)

Biggest concern here is that snd_soc_add_component() will goes to
soc-component.c, and it can't use "unbind_card_list" which will goto
soc-card.c as local variable (because of capsuling).

So, using #define is not enough. We would like to makes it as
"card function", and call it from soc-component.c.

How about "soc_try_bind_card_all()" or something ?

Note is that I would like to rename card function as "[snd_]soc_card_xxx()"
when it goes to soc-card.c
ex)
	soc_bind_card()		-> soc_card_bind()
	soc_unbind_card()	-> soc_card_unbind()
	soc_try_bind_card_all()	-> soc_card_try_bind_all()

Thank you for your help !!

Best regards
---
Kuninori Morimoto
