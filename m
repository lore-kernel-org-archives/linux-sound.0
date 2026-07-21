Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010014.outbound.protection.outlook.com [52.101.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BA1439336
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 23:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676277; cv=fail; b=lyDBmH2UXN5UW47gP5jYQ1fnaCqn9ep2TGgCEOGTY7ulzzxzdQZnrf46c+6KbwSLUjqvd9OyzFancERnvRdqmkhIta66/Y8i9RsNgiGXVU9EOB7drtGHW4ECz4b2f6iyWQjt+sP2uB9TbZzjtqT5wtao17XIGMhVYM9QxXCCYbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676277; c=relaxed/simple;
	bh=0/D6FSQH2ZwbKEc5BFx9i5WVTXaCZa3TN6Bnt6TLWbg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ln3ar4flfIW1e3Phle8dMtYluUe8OFRXBZVZTIdLDCtsDPdxbPoLncC6HRPUMI2zkCsX6c9yyNR6t4jam5TwX/0MH41LPScRcj5bh+OiHa+qMMBt1CFQWTFC5fhTz12DxLFkHebeHubLBCLehzi7rYA+WiBigKt+PvA5dCVxL9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jJgD72t3; arc=fail smtp.client-ip=52.101.228.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jJgD72t3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J27PBO1UwdKY3xHv5fqo5TA+3k0XdSADnJdrkG5SdA3vVEwRbW0vDx61VwhdfAVJtFPNnsUoIPCY7OEaOYONzdBLRNOSM0e2nQQkEzqsT+FYnyyiFPhuKHqy5a6gXZKInwejJEt9ORdYBqAXM5OQx4nnjjSwzU9Jfr30JJ+NU8Q6SNlBLXJfToHmyxMyAbJIemHOXaalVzZBWvW5E0TdBkePHehcEWvV0tsg8BzvD3WSzoDGwjVGquY13rcxPbDDn7pVRUO04DDNQb4ARhnhWZq+tWkdoCeNBL+63JoR1cBWFQV+6SpI1/TJJqfv5yaGQPn32rqy6234gIf16PoSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXl3WDOkZc4IIZ5CCRAGXWfrtz9HKNvKIewvYbje4Ks=;
 b=X2d3/ppowWqr+ut+fpsME6IBgDKKaYh58UYYIGHxtS3xWm8IEsWVQnBvuxJCFeg4H1jtL8ydcaSNeTqtisrOUlRElsPntKO0E86BmICUyj219JQGMhDxENlHnfbBAY9lYDIPiPgWtlXW+cEzaf2c7zoUCJ0DmDOpEoCevqiGpF+BtYk6JEQq0sTrIrrtyHu2pfPj/bQfgzcqO8ARFjVocmqhzRP/eh39B8sDet2ip6wwyY8gC3Ci+pBwMMV6yQUuAygLkNiz+25BqRD+hH8F2X3+Bl71crvZurkSD161uhSQ8cNG849kY7rqDwpJxBsBYPmNCiKRJU6NkpBWp+XkTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXl3WDOkZc4IIZ5CCRAGXWfrtz9HKNvKIewvYbje4Ks=;
 b=jJgD72t3LJ2Zb/ShAXb6ic4iFwcUKlKKL7mgnBIo67uFCNNZDGF+BPFBiLCjYbPwJ53LRy5OUFXcCqr7ISsarQlGuJtRfSf4vHY1gBgpzlkSq3LdsfB1FjT0XTAdt6uGstGNIJYdObm1BpsP+umEkcHRtHXdFzdMRqn9mkTyQhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB8712.jpnprd01.prod.outlook.com (2603:1096:400:16b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 23:24:33 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 23:24:33 +0000
Message-ID: <8733xc0vv3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 06/12] ASoC: intel: avs: use snd_soc_register_component()
In-Reply-To: <4aa7a0b3-19f7-4108-b2eb-71f197e1391a@sirena.org.uk>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
	<87ik69jg3t.wl-kuninori.morimoto.gx@renesas.com>
	<4aa7a0b3-19f7-4108-b2eb-71f197e1391a@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 23:24:33 +0000
X-ClientProxiedBy: TYCP286CA0172.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a91523-8551-4159-24f7-08dee77f38c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|7416014|1800799024|366016|11063799006|10067099003|56012099006|4143699003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AmkwrT5q/52OzMqfHCTtm2G2hPlG5UDvV4QOXDEeuE4X2E58JYWSZNCpUgPOJz9hT/zD0UcG+zZZEGr2DbRQlXF4YRO/NlSTs/Yg2TxcFQmHqSkHiZ+J7ivto6fhCWrhBjPmOIkzzAyhxoGLB7+nYaDDp3eH+pp+z/KNbqMbDs4WEosyvDfW5AOCSh9tdjLJvvyk/l6kQSzAJlyNFP8qUSluOHGYBLt9iaw7W1EO5ihU1Vv3Xv3M/XjLaYrauNuuqiTGjhCDGVLfarXxx2GpXAHYDMS95aDPNZZhOxTz/KM9O6jyUEVcAs/dYXBcWQPiMQWZaW392wsUbNVTE5+aQQSMy5auuJppVhzfu+iQOnfljQfndsuhtRiYHlTMomDtbI0eyTbFqVIbUc4NXjImcinv7cNiggvTEvupCsDivqFdRe/gLmS33YYdTaolLe2LocSQx+O+mOgj9Mu/IZ3bl3kkzCoHJKrTIOhy/JQhSejQLgLmih7kx4BgC1BU+p25B7DFPseF+jZiVDdCa4ZDTn5SfTDxT9UjHF1C5wTWWnwwA7Oiubg3SNf5KYmiiwkkN8zIcoDpaSscPMj1iZtlTxOu9hf8Du/+mhCwGUoenjmsjjoq+QMRYP52WKiuYdBqAY3jRcbAwd7SU8yhvG324Nl8zyV7pxik/gLdPfJxLsyv27b42QyeHS+0XNKgISZYLQUwdjxDRIZbXJ2vh1UIpw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(7416014)(1800799024)(366016)(11063799006)(10067099003)(56012099006)(4143699003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YM0nLN2hodvQkVFRHGEgVPS6JvLCx+VEoxMQxkVD1qU6scDQoGR0kwVtWlTw?=
 =?us-ascii?Q?OrVSfCg0s5A5n1yU3clS0W2+2XN9VhrFWaQkgNyUzpEgRJSNSLcSCS1Pr2UC?=
 =?us-ascii?Q?MYpMcSIXjcEkSUNWeG9VOxP9Wlv/WTHnnS4Pf56lIQfiosXFs5PGRCz7oEGG?=
 =?us-ascii?Q?vHpX3slxRUEUVVYom708B9jNjXZEOQ3LamRG/iPNueVqZUi9m9AFSC49bNUj?=
 =?us-ascii?Q?+FfuxrrMd/H1bPdrA5es9Rp9jflYzDwoWYDlggzxv8EejLTNXSFFWg2d9tyW?=
 =?us-ascii?Q?vnwRzgQrqopgZpL0WbwOL2nH9d9xFTTqqbwd/7VwOsj+lXidjRXEJbJ+N3Kg?=
 =?us-ascii?Q?3u6D/h28qVdzjVfHECdA/XzVywHSDPGIqYgQOl+exRnaJcm4H06eyPPuK0Ce?=
 =?us-ascii?Q?SVeLoVXhWql66p+kBrSADyPVGLOYNo5HSh2Hsic4cOWoY+4uqP5eyGZGC7jA?=
 =?us-ascii?Q?TiKABiahYFBn9oMHvJJPz3Vnubj5NqAuwvdnn6L0LXmxRmdnX2Nyy/GQT84q?=
 =?us-ascii?Q?RhlGbQMV5ZUDi/+wEhrgNxulHMcCbXCu94JsNmZ9QftB6b7GCNwFifP76I69?=
 =?us-ascii?Q?/DJrLhClym/n4s2fv9TK5vnqE4nxh9PZseDjNVqmhXSwWinnr33MMh+s696i?=
 =?us-ascii?Q?j/4jqVL+ObrjnaZGsfDVaL6lvu2dSiElAw7us4e+u11oNiv1gPGPAs5bhAvD?=
 =?us-ascii?Q?YDgTBDZLsSbkxXxlU9T5knF36ugq47h+moI7gAXB6N7PhG0l35O8iaUW7EE4?=
 =?us-ascii?Q?Cwbf/WMVtYwT3UPAiEOiZfv56J5QGeascHRt0jpY1XsLaJoUWf+fitvASf2c?=
 =?us-ascii?Q?d+MLlrUXUaUVvlzxvjEi7lnnuGAL3PWhazwBu9Ib8KJQamkhoyCHslX4tsqt?=
 =?us-ascii?Q?E4GMh/vKwSTi8toS+bvizznsopi+tBlYr+s+tdSN+WT9/Sd5mczzL7El+Jp9?=
 =?us-ascii?Q?+s8CuhhQ5YWIT+0NwsxG5XPULXqh6qE2YKDVYbRtr4tX8hYcdRz19Ah89gmF?=
 =?us-ascii?Q?/SL6FPEaS0NLMubx0GQO3qpdF3P0cY1lF/ZiGoSwzBx8moavqH5MgzH1jMuN?=
 =?us-ascii?Q?iFoguWGhX78cixRgmkGiP5PovWQUXcN7rYbhUoZDM+U3FkPaVJ6DyRG7QqHL?=
 =?us-ascii?Q?y9n7Tz8OIluAm7fKxy/bs7frFybceMGp9WZvg+GN+2Cin37TSTvzT0iiXa1C?=
 =?us-ascii?Q?Ao7gKPOhCEl60BG2wH12LFkbLdugYmQOXClwM5rEGv52gxpfQOxXyR74V8/p?=
 =?us-ascii?Q?Ct+SPig337Kbb1TMjvzFXVLNHxULLITb9MbjCwZ+uwY9MIgE7ynVdotIWnqZ?=
 =?us-ascii?Q?z7ExrydFJq7OnLlvnTw8BbAhlOTOhMPBgPrAdTzHFk5EffU2iACZPI255hLo?=
 =?us-ascii?Q?O9KWo521wFTGfjQ3DZZO9wFjIFnRL//qkNLjFlzYXNJEj2CdRhs8ZOJrtZ31?=
 =?us-ascii?Q?n2ZmVomLaxhYuVqyQod2/MuXJD4LhHCy6W1gwipx5kkOh7BRuiERb6argKBl?=
 =?us-ascii?Q?HuRaLTJ7YuaFRnaFh/k4CdmWFLb4LrcYEE4Mgqp4dMeqI5JDtal2jIYJtejM?=
 =?us-ascii?Q?TGLe2+KE7VAeCSpa093bJ2EzPbb09RI/9RpFJCk0GrtTlZk9/qzvN381rfHk?=
 =?us-ascii?Q?Dueqlm5sOrp8+p2xPs/WIRKWS+W8M52l4plhFITBfw0D70FrYpL9qjpCEwKF?=
 =?us-ascii?Q?AJpnqLtC/v79Q3QfGpM48brg6o2a/WR+WMCsMGWAgb1srcMz7pbtV2feEVIf?=
 =?us-ascii?Q?nvI2AXZUtylDJJFYLgKWCMNCL+fE7cnIvFX9OV03bW5PGJ4d3WT/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a91523-8551-4159-24f7-08dee77f38c5
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 23:24:33.3640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iza4cK7pevos02g1gnNqJkwLSozkTGOMVS6AADh+SMydYcr32lTGSAZUk0RZ+F+WPIcEhGh4JUH5yjdbNMnjc0fuZJ8BKcg5WCCY8dE5hlEvuWR6NdPrg1TRS/n4qEZT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8712


Hi Mark

> > -       acomp->base.name = devm_kstrdup(dev, name, GFP_KERNEL);
> > -       if (!acomp->base.name)
> > +       acomp->base = snd_soc_component_alloc(dev);
> > +       if (acomp->base)
> > +               return -ENOMEM;
> 
> That test is the wrong way round.

Grr indeed.
Than you for your review. Will fix

> > -	ret = snd_soc_component_initialize(&acomp->base, drv, dev);
> > -	if (ret < 0)
> > -		return ret;
> 
> That was the only user of ret, this will fail a -Werror build.

OK, will fix too.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
