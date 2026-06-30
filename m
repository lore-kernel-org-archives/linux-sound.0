Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010017.outbound.protection.outlook.com [52.101.229.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806A6199D8
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 23:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782863599; cv=fail; b=X7air7JBi6PdJcggFV2UojrVgXlvJUA1mQEJ7QQfe+n+PodZ78fASyNW+krQoFAUvhIbd42KkyMdW6cNLiT0XvFzp6+AahgJ2PAN/SdcNmNRY8itusLu+6yQdmQ7CSTw/iw4cWKmWlgNfsO6gx5nOgmsC5gN3NaZYmifi4oJVbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782863599; c=relaxed/simple;
	bh=d8/BrEDr1wdgWcZrZ+V4mzomzl86UdcBcLeNtCamvXY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=B5KUeIcnXKzcWiZ6dwLr3+WV4hv9b1mAhjFfiJqXwJGrUrmrB2Ln1MiWz+uwUeIaJ+/Jhs5+u7J510gu5nJzxoWI4fjM9uDQ7dWPTz1dS//yFs6GUTaDXqZfrScEN9Wtnh1/TXhTJ2h4+1kIi+jzgnXxZEXtE2SK24K/D0z0E6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Tk4cxmvq; arc=fail smtp.client-ip=52.101.229.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Tk4cxmvq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jpuio6BFNZf93mvgktq/RrwBkI3g8zKzhaIQ8g53lXde4jmJ8YqIcz5f3fL2nMU5OYi/ahFhp/eb1qSP2P4zeLT6yDymANIjAO2ziWFRvnfHcdcEKWsW1q/4Ms+EmC2xIi1RR43MctDfc6BQ0ONGmRinNavtx8Jkz5Sic8ni2hALbdrmOPtjlhDfU+pC68G7gZAW4FxJVCNT1RDLdij2K78aMXsBlfENOeZ6HYzrRAWiMzifFox/wZc0Tu1aFE91K9SEafSBFc0XYYAeJYDDUu7lJyz1WsLjOKNPPAn7trh5N6xevU0y8HK3rh7Ybwa9IUV8ALvMBtsRrtCt+Rp0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qV9W99r9mi7MyzM/xrAdyLPxV8KfWbB6FlWIeVSdFo=;
 b=oadv7IVVvaJese1/ucyHThBuQeE8HuRr+lDiPtZaQoKl1pAa+oS77HVD3DpNQQNrSz5cxwq40gHut2BAcgdYYy7MQMK3nkoeEUO7HwNQzcbhl+i+iY8wXHAImmDQFh5kGZr27FOYEPWNxKmuTiMquyKENvwLoeKAwK7++OVlkMascmqzYTYhLheukmKVBczG/rZ9s/46IhlyZOgYFE2C4sGzsBXXXATutJ/lLlE3igdyjK7Eivek94Uhp2auVG8tbCWkJGarWkbuVe+wosIm+M87D4WA7V6Fe0OJJix3377LDLM+4V4jM81a99eLGhKcmOWQMrdLabzVwwK9dhdqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qV9W99r9mi7MyzM/xrAdyLPxV8KfWbB6FlWIeVSdFo=;
 b=Tk4cxmvqmlju+XEUgb2STJoh4ne6+HYCawacnbp64FadQjmN1uOLzyUa5sGvFUNPxQbQIresYrKYhhPfnXgdLEk2n/F8hz2NvLYmeTAmoDrVGLZylDv0lWIX7Ut8m1je/bumfj/yjYbhYEufhCUMmmzBiRwef/e0AofXia7ghEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY6PR01MB17430.jpnprd01.prod.outlook.com (2603:1096:405:360::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 23:53:14 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 23:53:13 +0000
Message-ID: <87mrwbd1qu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 2/5] ASoC: soc-component: add component_name
In-Reply-To: <545d93d0-eded-46d9-8ce4-57a9ca795d26@sirena.org.uk>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
	<87cxxdesss.wl-kuninori.morimoto.gx@renesas.com>
	<545d93d0-eded-46d9-8ce4-57a9ca795d26@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jun 2026 23:53:13 +0000
X-ClientProxiedBy: TYCP286CA0164.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY6PR01MB17430:EE_
X-MS-Office365-Filtering-Correlation-Id: 53cf0b69-f333-484d-b6e5-08ded702bf72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|23010399003|376014|366016|1800799024|38350700014|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NrIyPaHoZQey7Md9XIACLcsWbZMjJkhzAFEli/2I4eu1IuBpXqNVn+CFzRGMqxIwrRnWwxcd2Q+sN85AEhZryvuOIY1CFTPZkRFxUyYjDhvXk33IyAO4kNrA93QyYfe6KrQYkscV91OObxHLCsWT6Q4m2BATY2500J2V7BXr/aPFU/psuE4V2Q7PILs5SPz4FBZwoZsAQEGtXpUhv3YnLcokOG+CtrbLXZzXoMB+hQp43ZAl3eaG1a9aT6S1wwKs4I8OJRjMJBn+eQH8rkgsfG5ceEA+9WeIyrBKwLIoq6SVRSjVRobczjA8oVT0pWVarpnaM8LKxDUFnVMuMXfSc3NNIkedL+vl32n+q2WXWVtnDE/hap/7gzG2nfXKOwlgytIGCaMQA3NMRL2Da+Ox936xRy5kct74zRbuLnxxqk0GJirA6wWfqMHVn/ouHS/7jf7UwAoK/TQWSgLx2b7vMHf/2KzyiEuEkNc5cD9Fy9Z+HYVhb+X2/Hbw8bj6aHWlTOsM93i4nWoI4IutMvPmox5diln+tPkCCBWFVyrclcRAW4cPzNSJMWqKKhdHTyp2LDXqNYIfuvxCvfjXLheDNCuD2z6pGczzRDPHKI6R9DeCiau/UrQqEQ4QqvWQkrExkQSfGn3/MycVF4k2A7TrYADH7RZe2/OO5sh+VcGeQ6a29RvwhEtRFNMwigEU1AjVDJks8BjvsGxH4tV6JPGm2SvS7qk5KQBgXJKiT9liM9k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(23010399003)(376014)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LaTYdViyRLaeb579rJEnrRRBWqRKA3I0nrtNR2zoAA0qyKYjlE19o1x2PKSQ?=
 =?us-ascii?Q?eLlLWHSsaSszDt1cA3V73OPL1UOGtc2Lf8L1yktMJf4ZqzK7Ry1oYZLwlj/i?=
 =?us-ascii?Q?oNvSjlBHFdRhCqhuXrOPwuiKnI+4HLxslBLmp1eSxfF+mI0HPWWv3r8U2CmY?=
 =?us-ascii?Q?zGjRTNhGgmgvAwJjQ2fC/9r1gkhAp60+dUAF6ilo2B6cywCJvEAhSe7YvH/O?=
 =?us-ascii?Q?Zaau/uNUTYdOcoD4b0Nakbsi9D26mYxXgEvuLE2Sr7jGavpKdjB6njiVkFBO?=
 =?us-ascii?Q?nveUjbJgs00ppT0x1xdslXA6SrNz/2NJ7A8L2vXKsQpeG7D844zE9Ezlpbl0?=
 =?us-ascii?Q?1+pz8XoEunFqSpBdaDK+u6iVOQWRO1Fw1hxLg2+NcceU+yvbHDBTtfoBhtCU?=
 =?us-ascii?Q?r7BiiMnEikRiK9hF/lkfnAolnI/dnmBBMPDmM9PlVnekBzHpK6jNI4behBeq?=
 =?us-ascii?Q?HH+VMshC1TONvFmvm2HFTvXmwlZLc/5Zz0IUQdDF07t3vAih2A+QEA5BmbTJ?=
 =?us-ascii?Q?+Ds1GBTXuTMxyHZmBPRIVqgDqqhHdqLqWsMEM66r/xCULD4woTY8+WCD6gwK?=
 =?us-ascii?Q?rFd4qGiEEfHgPzoqBxUGk1kC5MMhS4xw+f/eKWLE27TxQrH+bKD367MrRiKZ?=
 =?us-ascii?Q?N8dlR/WyEfOm0nHaO/9ZkYgzUHiB6ssEvwbC2jqw7aDzAIfnA4UGgO3SKL/A?=
 =?us-ascii?Q?+zY5f4GAhzZvVL6aZ2CuCY0mqmcktHKBnNE9z3CnZKYd2qrm/ZjoifVvW6cP?=
 =?us-ascii?Q?oHLiQcJsoY5pXLr29GS/zzWqziRjeH1MF/nP89vg66O9nQT/UR7jlAPdfXLG?=
 =?us-ascii?Q?a3v8ZtIaji4ublufvXc0n2OnBRgMVk/8QPTbOL9zXtELZgGz6M2w6znlizBh?=
 =?us-ascii?Q?tgZW4HNEwtxPopYw8jl70xs7EcPF0Z9id2M1IVbKXz5N+Nwoe0HiPBLTHKGO?=
 =?us-ascii?Q?UifZNVQFrDpzF5fBZUBI477TnpSuDg67xhLPb+MKhggbzhmdtDncry/nBRlq?=
 =?us-ascii?Q?nb6iQHrRp2HhAWlePMXNr0PLeYhbWqPoMu2GSjApBp/9C64jZ2BbgvWV44I8?=
 =?us-ascii?Q?CFZavSoa0pZH7bBBmmICu2eYM8fYYOuHj9G5pH+3vj+Ra15ajg7giak5RRX+?=
 =?us-ascii?Q?ojForskWvlrS4c+JcbmwjnGeTbtHuG6mzCp0ZR/8k3NtnusqqE+d0jUFzgMm?=
 =?us-ascii?Q?gAE88149KFTLAN4DH1mg1BsttUmbDCksvMjRytLLfcqfKkCH6eaMkr4MHgpP?=
 =?us-ascii?Q?qYeGMpSWk5o231Qqx/dhCoULzSnqgHXpicRAWx4qf/qH9j8XAQWRwhpgIhhH?=
 =?us-ascii?Q?2tazh6pjFdvUJE4DIJDTsO08Eu1zITuFcJ351FXKrer8PhzY/ZmutlNmx4+v?=
 =?us-ascii?Q?yxPm15y4VeeAgKlobc3gAHdGD0j8JAysC5L0sP0cXezYrTgKtl3i23tq6bZi?=
 =?us-ascii?Q?9FNweJ/FJmUkb3iEq3K7FkNxG0KaKms4EpbBWnsTs6g3AUbG5O2NBEiWQbf2?=
 =?us-ascii?Q?3z4MO2TiqJ4MHtmYb11xbuUtA8Lk8ReN2bEbtIrX7d6+k1NAC+0N0JiJil47?=
 =?us-ascii?Q?MYKgydsCBH1eLO2r9zZHMbwUOJp+ei6kzGWj7dyz3teJQlycaIvi6q1eRTaI?=
 =?us-ascii?Q?SZ88Q5qLJfk2+Y5Dy6s4VssmpxTDFnpn0o1TAtTgTBROY1/C01jErJ/sgBbQ?=
 =?us-ascii?Q?u8JFGc2He8b94mX64hAvZ3QEbLgUcVYbBFF/GtRVyCZ+fp3qYPUIwQi8O2O7?=
 =?us-ascii?Q?HuSvPtn/Yiw2GBeTvDNtAX4Y4P/9xKY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cf0b69-f333-484d-b6e5-08ded702bf72
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 23:53:13.8120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZwAKWaa/A+1DBzpr6CoJTo8EM9YfSFC/zVaH09nAa7Iiv8jyTyMRZ6xsdnYJC/RkG7Zi7PRGK2TjG/2eWBsuihRLNGptmljH4H4zKD7p5l74byKR6KH5IPXSrjIPc36
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17430


Hi Mark

> > Current component has component->name, but we can't setup it via
> > component_driver today, so the user need to use
> > snd_soc_component_initialize() / snd_soc_add_component() directly
> > instead of using snd_soc_register_component().
> 
> > @@ -2717,6 +2717,7 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
> >  	INIT_LIST_HEAD(&component->card_aux_list);
> >  	mutex_init(&component->io_mutex);
> >  
> > +	component->name = driver->component_name;
> 
> Should we handle the case where there's a name somehow already, this is
> user visible.  Preserve the existing value and/or warn.

Yes, indeed.
Thank you for your review.
Will fix in v2

Best regards
---
Kuninori Morimoto
