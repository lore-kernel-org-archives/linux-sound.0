Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076153FB31;
	Fri, 10 Jan 2025 02:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736475929; cv=fail; b=nmfSf1aXatILBxDiEk9K6ZATxT0PMK0ylpZ9EOoAdkpgCJ/lRvlMcS+mLg17qibBoafr/4TzxXGI8gNGcntIQBUMZIeWcBwIJzwa9qei/PDMhgPl3jeYReecHtxBs+6y3CGGriRkcf1Uq5v/XoR8P/kHia71JqKQrX/dWJWY0Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736475929; c=relaxed/simple;
	bh=wQ5LL4i+GmRJgz0u/6JJvI7w1iSDZSUxeqW6XQTinj8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nU0KuhLjKVifKSNcw0pcOWRSq9bOG2lSy6puOMfQqNmHEgBY67EhZCpjpQwFOJR4NuPPwk0BR/nVojuzNTHRACAQ2HtPKMnuYxQE4KO/j0j+NcMTOId329NgwCHTQXCnaz58U0ov13s15bG6xSTRjnYj6EbcCd9vZNG5MloJ9TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U48fZKeL; arc=fail smtp.client-ip=52.101.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U48fZKeL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXkpcotP/koVutqouqbiF15cJfca+D3c4s/0XjIiu6DR5kMCvEbV5A7xHWiCiGvRyRxCH2GwiLyGU2mh6ZAswliyqKxIjh0zQO8Fo+fHfbbCnHO1Db77JyjL5bDTu76lYsg4qX3GttTqrAOaxwo0ZAhfTCXbYppa9MoRyA6FzsCuA3HrksyBO7g+15/AFD3gfUcTx5t2tgC0KO8XxaqHqeo6HozisZ/1sVk7TfAoMngohwELMUoK1sy/xygKJ3RwbvY4CIf8kimXtqmntVNr2iy8pUnyBQTJ1Q9nIi1tJibZb5WkG1UIAMk50QIwi9E45TgBGgWUQ5B0TAbYBEVWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1zmUFWZu4EaxGGcs0gLrLcQmGuYQH1JjDlOKc65nxY=;
 b=f6w4+LQQ6+mKQfYH5DJlinS1zNj2hjmFBKerP4JyD2zg+E8zO83ceOhBLjxqgQ0zZR3t6APsAPkcBH2ckzwoCL4rsWT6oTx9NGW/DYfapTFJcx98A3HlokfnCU1gFtt3rqiXbDQ6yZVgFuJNaaJP63Zzw1qlk5kRu9TRoEPvKg+Fr8n+u3o4OdhC6fFunBiz7dlDq4JJr883koNdm8LaTGYt6FpGMJKEp/T+fbzMRWbovVP3p4pfLLnDOvM8UxoTCqstRuWizjR823DTw2wo7cL4h9NAghKwxphkw9LxZS9ESqTMGCgRpQVp1HCeLngSN7DOSFxku2GGBn6vB2wWsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1zmUFWZu4EaxGGcs0gLrLcQmGuYQH1JjDlOKc65nxY=;
 b=U48fZKeLLxHDrJpfLPcUWRGw1RnBEkTnhY18avfXdT46ncgldZvAnhCbTArm7+1oiMh6HWwfABR8oEGSY7oNanzi7XXYOT8mMh01NAYMyBxNkRKTx1w8qs7+VmvcqOfp3awuJCcqh7Cf6DWAUZuYKNLpu9jsCaFNBgKeeTiYnpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TYRPR01MB13558.jpnprd01.prod.outlook.com
 (2603:1096:405:18c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 02:25:23 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%5]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 02:25:23 +0000
Message-ID: <87cygvwgks.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] ASoC: simple-card-utils: fix priv->dai_props indexing
In-Reply-To: <146532e5-1329-433e-852b-e6d400eb5347@gmail.com>
References: <20241220151213.2462-1-laurentiumihalcea111@gmail.com>
	<87h66v8bsc.wl-kuninori.morimoto.gx@renesas.com>
	<197add46-752d-4779-98ff-1cde2543dd63@gmail.com>
	<87y0zk26ko.wl-kuninori.morimoto.gx@renesas.com>
	<146532e5-1329-433e-852b-e6d400eb5347@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 10 Jan 2025 02:25:23 +0000
X-ClientProxiedBy: TYXPR01CA0050.jpnprd01.prod.outlook.com
 (2603:1096:403:a::20) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TYRPR01MB13558:EE_
X-MS-Office365-Filtering-Correlation-Id: 44cd7396-6f1a-4019-cde0-08dd311e0981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s+wRzLoRCQQV4QogP+DKjhW23BEHryvcTortI0n9TdFETkZcmiGELSJCypBZ?=
 =?us-ascii?Q?IPIoOj3VDWujZPuWcfQUmRLlMdhiX9llAzApr+NWqweWZVIrQAUiDNZzcwRb?=
 =?us-ascii?Q?ssy2THWbTxQyCLOVkBj3qF8eOlOy8T7kkOpe7tl2iAJBbYengFId4npyskQj?=
 =?us-ascii?Q?WflysJgcKyvcLn4w3BqdWJtOF2R0xevrR/yRbwewEN5WkrMGtlhwTGmb6r+X?=
 =?us-ascii?Q?cztjyFxq248zDCyzHR+ReO/Ln5zslbL2tqv57D0OKQCmL4sjlHaBVsfzpSgE?=
 =?us-ascii?Q?KtcbVIR/UB4E/GROi27TBBjX++aRUsrUGy1ihjVpHBDeOzIVJOrf99gY87bc?=
 =?us-ascii?Q?F1omwHrfso2tC4tXgKEHyZckMY5H7P2cBLGPh9VPN40j7idu4jNBYGZCtLBU?=
 =?us-ascii?Q?P9Ht3kkds9isfOizQmh6AaQzIVPUBX0pXGBX8plU4uulCBgq995dnvy36K9D?=
 =?us-ascii?Q?KPb/FR6pe+5khh79DsuT4fN2dwIe+aW+Z42s9NfpDoOeCcAOQfltuEB7H8OQ?=
 =?us-ascii?Q?sSZGGXJdFeWKzkP9ZZaB5NkM8ZlxKlQj7UYsNLMK8fuBjjV9+dz/vh/MZ51U?=
 =?us-ascii?Q?IxkkeuIQ9ytbjo7NXEIbkD0SSu8Yu06fOhd7aSjD+07WJSOcPu0yCfk9qPkf?=
 =?us-ascii?Q?WpPMj5VxK9mHf2702e75u1UtIURW0pJw+eDH0gplWpr7TxDMQDInw8u0/aeQ?=
 =?us-ascii?Q?I2YD2d2ZVyv8IRnICc5b5piM7Qtgk02RKnXYX39XDEuDhKioSrNCFXufIWUB?=
 =?us-ascii?Q?ZXZSj9ncqb/LO7zI3hnijscYXBUTQMoYhesvo5bn2DsRLnb/4vZvryHBk7Aj?=
 =?us-ascii?Q?kKvhsANQThahMf3rtUy15TbM8HWM8POOfnwufmwwEcAKefgNyhOcuFJD53MU?=
 =?us-ascii?Q?3EfepVsqQW5sgvMyF2wEBKQdJ08G1kIE/bI3npobxpXI1fGMsUPgBFrgnkJL?=
 =?us-ascii?Q?JWAAVRyYziK3ukWP/iutxmZyBtOOkaTunuaTxVSa2stPWJ0o27h4psB3DLLE?=
 =?us-ascii?Q?gznXzqAuHaYApsdutym+iAD7cfnxmscagwuFotqn6kKM1cb9mzJMTDg5rXp3?=
 =?us-ascii?Q?I7fbsq7YVtxU+NxtqI+4vlZHiTfx59xP+Wmod19TsImRV5zGyunA9lx4mvjE?=
 =?us-ascii?Q?evtdJwjNQpjSRmjljEgrTNfvYfSW98a/UmUaVNenLM3Gd7O9FCe1juVIQnkt?=
 =?us-ascii?Q?+b7zRPxYRbW4m8yebKFT3wXHwO28Rw2CTEFKeK2wR1njodm+njthuWM/fw5/?=
 =?us-ascii?Q?FexNGR0M+OdjeftXEYWhlh8rXwonseEUNnlVCMMYtobW0BVeMmfTy8FZEaw5?=
 =?us-ascii?Q?pmsraqE52a4B6Izd/90nM4lz2mj6wbs0Zd+I7zKp6pxSMii4OwkAU46zHv+p?=
 =?us-ascii?Q?hQOv/s/5xLOgEIpmYn6kkUsE6w7Aj9j3ULn9eAoxJeaoffMgQoqFz07UYtz/?=
 =?us-ascii?Q?wGoGrKAmr+mLjz2vQ0blMt1N1hwCFXoC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kt4jqVtWRmfz/aQGzOP/11M48CnX89LPlsvwW5y2uE/k4UJAknOKcjZN+/84?=
 =?us-ascii?Q?q/iavFlqZDFWHM8RXPDwcHvc8ol+/0dViPCcwIqxDTM+NiAmL1gviBzJwNlM?=
 =?us-ascii?Q?olkd1fRZl+oRUR+6LyjNCK/YhHbbfy+N1VwnNsNZFQHq5hpGLquCBebVRe/a?=
 =?us-ascii?Q?w5rwx29duMy/NgHR3HIB9cx25P0Hwv2V7P0tR5Yq6h4XgZzUU4ygmCk8IsCl?=
 =?us-ascii?Q?hYK6BGSGzZ9pB3UMu7hRCeoDtB3b1fWAowoU/gpMAcZT7kFf04dPeUMi/Wku?=
 =?us-ascii?Q?+v7ZZ0jzeU4Ll/gCDAXNTXNgFT4fqsZZaL07motVfwLr43idqO5HTw2ANmnI?=
 =?us-ascii?Q?VqsELCNV8grslfrdVDtiQPmqw8D2XIAwke0XSfKYQ951OgopV8rGBBlxBdQ2?=
 =?us-ascii?Q?9QlX8cD9PJf75SuQcRHZoBo6DTdkjrpvl1Asw8rXMauBLZlIEkIYem+s4fvm?=
 =?us-ascii?Q?NmdvCGqnqVGAn/3Kt38TZs4D8zevAkpOZ6/a54l/0pAceP5zBSxGZq1s8+oS?=
 =?us-ascii?Q?nvUMFjIyUnxrsR7Ni/iPvpG1k8aq/RLDxRptLKBu9QjImOsbk8I6mJ7e8BAd?=
 =?us-ascii?Q?8N04kpkuunP7k2DQ10X3DwAy1qSudvlGr8RTvsiK2iiwFkItAFTSGmqcj/fU?=
 =?us-ascii?Q?4E5Yc87jXdyyryLcyVqlWMQp9O0crIFIBmBmxRQCF0xC5FekRuyH3I1no0hs?=
 =?us-ascii?Q?/8a7MsTNd1q/dT/3fu/nMwy4upbk1CNCe23tRjUJsL1C4955kcaclyjQXfAX?=
 =?us-ascii?Q?3oFLf1CvholJDQ/MNx/1tPyP2n8w+3mQ4MHKWxrHputbElWNmOTRbqIlSH1/?=
 =?us-ascii?Q?Un+VJ1EhOsP0HUqksz+Vdq5NZYSmcT1X6Lb2k4X1mOl/ISFg6LdPGXz7sF/8?=
 =?us-ascii?Q?Q/z+eD1wpCt9HHkzCdvwX9E4NPKnPR0tA4DFu5aPduopDXoRdNQIVRMuI3hA?=
 =?us-ascii?Q?JTWD+GbgffC/n3rlzwgzV57RMbvAW62Un+Ze/dkxSCatZ6DncUwyXBaVMh94?=
 =?us-ascii?Q?mHlIRH2K2a+U52ELGKQuLAuUP14xg1eCHBWAy3qIw66ZeXBMdaFDLVflE/wi?=
 =?us-ascii?Q?Xx5CgOwcBSwI3nPX1lwjEkw+ICuFoI/NfpHxr0KF4BDbrJ7VaQKOzC5PNB/i?=
 =?us-ascii?Q?W71++4OXEBnX8TWyVnXhQPMif9XdaSG4oRt7ctkl/XshG3sJ2rm4MuhbXSWR?=
 =?us-ascii?Q?j/18nlOu0JmKwhrsvaCzpMM7GJYBcQNllKvqCTI31E+Z5GYkumbvlvEVO/F1?=
 =?us-ascii?Q?46+TRjUNZGzSKBQeFWWJF9fFf96VNE8D0u3mQcXmnQT5EmsD/ekjl9OnCIfQ?=
 =?us-ascii?Q?mt+t5WiTfuLC/MPkIumqUpi5jsDs+lnQKQ1SKpgYZ8Y05+lHU0pQvUw1HCWX?=
 =?us-ascii?Q?uLnRXawDavepsNQkyliyzKBzrFMTK82OxpMLSZ1Mw6Tp3qo+cU5XOEjJHi/h?=
 =?us-ascii?Q?EUxAHAuL1XuJePLdwUoMhSMLxhjwDeg/vaP7lGVYqXywaPURP6hxDew5lOEc?=
 =?us-ascii?Q?7lxzeip1ifPFKD1QBGkAiUzBXC11wxhWWSwfqYkIYQWT1E2kEn2/p/gfRhOi?=
 =?us-ascii?Q?LnbFV5MJ6wItDuDcDLZi7c26htSnxm7xEbx+Uhg4WvkzHsxXmzb+hZBOjA+1?=
 =?us-ascii?Q?94H1snitgOQ1p+r6+4NlvGY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44cd7396-6f1a-4019-cde0-08dd311e0981
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 02:25:23.5670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xg2PTjwq9G4El5fFjQBi0Let0WENgi3PP3ZrBgnjtI9j4i8JQkDL+6rBh3OQ9Zf8+mE4UY6D6jGkaJZ2CIUE+BsuTKILj3CEgbPM/NdQIKYi/BX9np1exWSsanIpFTVh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13558


Hi Laurentiu

Thank you for your reply

> > -	simple_priv_to_props(priv, rtd->id);
> > +	simple_priv_to_props(priv, rtd);
> 
> ah, thanks for the clarification! correct me if I'm wrong here but the issue
> that I see with the suggested approach is that we have some places in which
> simple_priv_to_props() is used before the RTD is created.
> 
> Example scenario: in audio-graph-card2 we call graph_link_init() (which uses simple_priv_to_props)
> before the card is registered (during which the RTD is created).

Do you mean like this ?

Before created RTD: ID is not yet updated : use         simple_priv_to_props()
After  created RTD: ID is         updated : use runtime_simple_priv_to_props()

Is this correct ?
If so, do we need to use them differently ?
In the end, it end up doing the same thing, I think.

If my understanding was correct, it will just makes people confuse, and I
don't want to makes code complex. I think just adding comment why it
don't/can't use rtd->id directly is simple and enough (almost all user
don't care small detail of macros :) but what do you think ?


Thank you for your help !!

Best regards
---
Kuninori Morimoto
