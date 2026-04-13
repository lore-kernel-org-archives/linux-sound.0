Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23101CFBA
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 02:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776046020; cv=fail; b=YhrcjRloOnbu1C5VIy2ammO+OMcLNaHRYtSUvsCl+QkfB8Nx3enpB1lUyh9yJPzanRnJlA4GHM27bb0e4rIPUQkzNMMLwHVsfcbIgs214ML4FVUR2qRve6n7HrnzWdGZdkt531N9IzS4ND4ya1UfGepETVtzMlQoYy3VBoWJXms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776046020; c=relaxed/simple;
	bh=AWdnC94tvwwgGxxS9RfcVo8gGEIO4ifmOJum9jommPo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eLCg7k2I46Aeawd+lN70aqD8y0qtHvVwP+c0PbpGJm7bo8Sap9hhirG0tvuaaFu+hVJuqvk+ThexPSvp5a9h39Dt4TyQDc92/xLdeLCRg9NZL3g4GP0YTsOYsDdttXE9zMZkb5OG4ddEVYw82FoptzYK4bTsM9obsZ2V4T4KnRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ec8xAeaD; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ec8xAeaD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kxaxf9h6ciEGJav3SgAdmPaCpHQmqB9pUdQne8ecqDLrI1zPmah2SmdO9Be6wfdbdJer8ZbOkwXI3CafhsQSrhUhNotrXs7v3vTgTc/3MM/gm+dEArvVOwM/V0UJ21oDHPbu4ynmeXN+Ql4lZZ3lFNpzfe5YB2yL4vyfJ77lK7Jhg6LUQS63Y10BpxV475GFmjUQJOPckIkYJGmBO6e8u92Zr4282Yd4CxGhC6RdH9nF3WRmrHAEHtuu8M3Tkn7AFRyalZfCQy4AwnTEAF8iWy2C+qP690IluH/mMKj6Fxx4EL+X1y7x8GSWngeH44EuvTA7G5f0mKVqcdlJJS81Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLZrB4fBQEUVJNvyCvVohaFxMWn/x9zWvq8PpkbXKc4=;
 b=TsppBVIORAVqOlQdcMvZ5jjUdiGHZ3bDe4UiOzv3wXPGjG1CgUmczfeLZcB+rwGeQZoahktX2/zRRNupZVisjzHTLeZhKAmxZqgyTiIaTTxtTINvLhZyG8Nrqw0a/5rj0tfkbPwGnMcMbe3Nl/a3TdleKI4XufXshbY7RWKwET6YbuJeB1Q145k9RDbV6RDCqlOyw8Gcl20m/sFClYWuEX/WCxpJTKVlcCnNjOklkljedlb7GK+TJCww33O8g17nykvcdrJVbk7ieLRxWW4x6hgWGqgO/+U7tIKI6kC/SA/5nP6airxo5Y9qLNg4Tr7FDE4raakcfPptAaxQmkqK5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLZrB4fBQEUVJNvyCvVohaFxMWn/x9zWvq8PpkbXKc4=;
 b=ec8xAeaDUqXiIj8SZBYBq35z5SxmtF+KHH6/bEJ23sfMeYp6S19pMMkyroMxJ8qLEz56g6YN7Eku+BukiQ3O75olFCm2w0zBLt1PXPLXFL7wn6HNk+wOiv6V+bKh2ewX32gtyn25fooN3ks70GgGn6+oXBob1sXCjRYtmpzAQl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB16987.jpnprd01.prod.outlook.com (2603:1096:405:332::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 02:06:56 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.044; Mon, 13 Apr 2026
 02:06:56 +0000
Message-ID: <87jyub396o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <linux-sound@vger.kernel.org>,	Mark Brown <broonie@kernel.org>,	Amadeusz
 =?ISO-8859-2?Q?S=B3awi=F1ski?= <amade@asmblr.net>
Subject: Re: [PATCH v3] ASoC: core: use Complete rebind cards by default for all users
In-Reply-To: <87ikacdcdj.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0jsibki.wl-kuninori.morimoto.gx@renesas.com>
	<87bjgaxkdb.wl-kuninori.morimoto.gx@renesas.com>
	<a53ac4b3-1774-4e78-b88b-4316ffe73cd1@intel.com>
	<87ikacdcdj.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Apr 2026 02:06:56 +0000
X-ClientProxiedBy: TYCP286CA0121.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB16987:EE_
X-MS-Office365-Filtering-Correlation-Id: e3515f45-ed4e-42b2-0cf9-08de990156b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	atfCFhFTZnCcsqMk5y000bJSH/gdvVv7z5liOTjrxZU9nwHFwFgsVq93UWeKIS/1mDglZBXWXPvoQXI4dWvGPYzh10qc27MBD9FqVEu4ogtiwjdQ3wYo48x9ltHBpD9zj4vA0RSuISyQWb8mAbZTlLw6IFolI/oIamQ47L9oOp1LP6q+ly0MVI0XtawL+yGawW954qjteihRy/SjE03CR+wXpuzpYJK4dXBSPL7cYF98vzwlRIk61I72ktd2iigAmMlR2B4jpw/ZHLubgToLXajdTW1no4/5vpGaxDzs/filkch2ms5QxEyNUt5qIoYCW3zbZ9qAjC7wYfaMXx1OopKfZY9w3kHOQgiWagpqDOsAaR/ZRG85ygPyS44BYdJRSenA6aBBt8D0zHAwLhvoyvzJV2lzNSwtXChZafGSdp1BKpgPMr+Crn0sdrrvvYBR961FSdk88jZFIkmARqvUj8Lmf0QieI4KeA52Zds18QJgvRkDjRMUGDyJG7MqlPahOY/kU+TvK9vRPyzAoeimKy+ijx3vd4JvsgXByzfy1ji/ncg8FmNaL3yy3EUCBEA+PcYbm7WNhNcIjX4QBWQC5WbjzfEvphYvzARYPcLgYOOL/ynRzvj4X5kmUg2Wm7noXgojvynCr/a6T9/JB+YNz9ROpUB+gb65I8xmRNPHxXYQ6c+Yw1BxUm6qgObWRAQkL0yUeIM/6Kg/VMFtlOhQLUNy2PsSq6erPB9sY964fLvKgBrbHkAIcbzQBtpLxJKfay6ohJ/r50cPTtx00/wYiQr21eN9WSvJRLZn8ExmorU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wIyG6Dfj6NXt7MIcViUkd+eFpEQLuRAGVMxoMIgkmnwtOvTqBDYq+l2Uv5OQ?=
 =?us-ascii?Q?/T1ppTU6viamuoF1aZEWjfWduMAol7DfGvEafX+wpf2LnKSDqEeOi/MsfnJ4?=
 =?us-ascii?Q?/ZgGw3jNbDFrDCuZGl/LWI1c7Co8DQo6bR/l89FctdckSN/khF+DYdl9eZbZ?=
 =?us-ascii?Q?g7RBVXiLVcjYtAUqRk/ixW96S100+hoNiGZXXQj9PpsTc5TLlnHE2KrfkQ0L?=
 =?us-ascii?Q?GqARfF71d+f1MjlhSwiJnkRe+lF0WQgX5a3sgswzZvgbJZ/PoIoQvzbXIywP?=
 =?us-ascii?Q?jsUkfckkRh0V0+bf+mmlQjaX+eCSRq0vsu/g+j2hkb2NX4LX08h6FICkFPwY?=
 =?us-ascii?Q?fg0YgxOi09qnjL13431eOnx8rkX8M2CKMilE5focMfuaX3/kSUg8z06IgWTt?=
 =?us-ascii?Q?ltWe5iLxtR6Mieb2R0RseCREiUElzaybumdAl2DtihCoEgGHpljZmFpa1bWi?=
 =?us-ascii?Q?eLIqS5ohLNg6nA4h7+CHK17nGzUtksT2d6bv2w1xPUylNuepqkSC1mrKYFXf?=
 =?us-ascii?Q?IX7mxCux7iXS30JOWNPruteHs5bdnMEjk0xNpRe6gRv1YdsayX+21I3VfqPD?=
 =?us-ascii?Q?BVaOTIbCgYadWYbWaKmjrqlhOHQAb3GRmagVFPyVSqzc5yRGImhPixv4yN13?=
 =?us-ascii?Q?oU7V28JitNYzUbUVaodSkZjbCn2BTOHbkliWUa1qrULgohcl9io7A8wZOj5y?=
 =?us-ascii?Q?Jd+t6hJr2AU66VtQnDBBWWjAJ09kltBLUDtThNIz3tUKzRdpHyK0NIVqDp5g?=
 =?us-ascii?Q?emfowVaLzp3+ezEg5OMxtFTVvadFgLtWT78Nzy+XTOpft020Z0o3gdPoax5y?=
 =?us-ascii?Q?3/Bqs2GcOaz7bCz5ezrNB/Jk5PmqZ5UKRH/7AD/WmvaFvlvcqXvvdirGLdWl?=
 =?us-ascii?Q?klTX301ZlK3KxOdpjPGKKt60zk5FywJ/ROtZoennpssEJ8Nwy479gDO3cK4C?=
 =?us-ascii?Q?WWH96vkVPZHGmYmcuuHx5FtQGAQtMV2gVj+DwFWlhJyuno6dwRd/Ii5LrcMp?=
 =?us-ascii?Q?uFtDt8emAlBwlJ+eNKTGNyXmB0mVvgFRdlsZEcShn6A2lLoGHHliouaOvq2g?=
 =?us-ascii?Q?Qx7tiZE4YkETGbKb+zj+6GgaeEdp0Hpu0KIhUS9WrZjELp0Yl+kW4rxHlRwq?=
 =?us-ascii?Q?UsCMyFddbkZKJUlflXxpNWOj9IIy6TvZKdrriQ/PrW1fzkGB+QMHQkKj3dUS?=
 =?us-ascii?Q?23Wv9kADfNhsTEdkoncSvI0JkXKoKY+GtavHyK0Uyr4HRI34qgo1ubwo91xn?=
 =?us-ascii?Q?KEqrGf4TcCAiC8h9XW9nZP66jhliXMP/+MXxsO3TBYVZ+48uy+VJti91xU3k?=
 =?us-ascii?Q?X+/6rRyMQQEVcLe/RGFjmOIkPx6hb59u5/isxZ8FQ4mw/cg1iWvr7CpY3bvG?=
 =?us-ascii?Q?DO3IHg62JX5vcNBm4ER9+Ri6AIS4mfIJVD3tJoY2BjdEeWP9CQ2CQAsfR9jf?=
 =?us-ascii?Q?qtKbZqhD9xE7QygQVbo7/Okc/YDoBF8BwOmLCMX1G2qf99usIBM5BUOzcAaz?=
 =?us-ascii?Q?5EpV+cl0gTn+2h0wvph6o1LpHTmo73IzLlzg3zMlQzkrxyYhOS2L9teWUhE1?=
 =?us-ascii?Q?NJCWk6EfPGmMRmaTEdaWcS1pDaKXGAxH/bIubSUXG8fesItH5HK7PsfNYQrk?=
 =?us-ascii?Q?qvGKDj+Q4Hm31XzxBD3Lv0smtSouKyUoOp7oHyIbGuz/XT/N5ylPF89UQYRO?=
 =?us-ascii?Q?dDHbM76OKg0GuTpPs2IHhsDziGMk7+kpF2B/fXam/wVaPNTBoqU3SP+nI+fz?=
 =?us-ascii?Q?OSXq6U0TOlm33zHtxAUCsts82CchfiRZcilnMpsHYvYioQAXw+S4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3515f45-ed4e-42b2-0cf9-08de990156b1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 02:06:56.3241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUyAwRh6jiw3y67SI7xpyn/H7H2RcYTg5bHLvBNFR6AF/jhKCKqlX/H4iCgv0O3asQ7t81TAm+ehPFqc9KK7xbdFdvjvWeNGQAXxJ+PmXWpWIk/azEImBPxAODMe7G7Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB16987


Hi Cezary

Sorry to bother you, but I want to know the situation

> > >> +	ret = soc_card_bind(card);
> > >> +	if (ret == -EPROBE_DEFER)
> > >> +		list_add(&card->list, &unbind_card_list);
> > 
> > This does not look good i.e.: squelching 'ret' is required in 
> > EPROBE_DEFER case.  Otherwise binding deferral is not supported, leads 
> > to KASANs and eventually more serious problems.  I may have misled you 
> > in my previous review (v2) as existing code has explicit "if 
> > (card->devres_dev)", whereas in v2 of yours the 'ret = 0' was moved away 
> > from snd_soc_register_card() to snd_soc_rebind_card().
> 
> Yes indeed. Thank you for your feedback.
> Will fix in v4

Should I post v4 patch first ?

> > I've attached two callstacks and summary of operations which I've used 
> > to reproduce buggy deferral manually - no magic tests needed.  If you 
> > would like to see full dmesg/traces, let me know.
> > 
> > - case#1 is patch 1:1 as is
> > - case#2 after updating the code with 'ret = 0'. This means there is yet 
> > another bug I've not managed to hunt down. I'll continue debugging v3 
> > later this week.
> 
> Thank you for clarify the issue, but hmm... I couldn't reproduce the
> issue... I manually uses -EPROBE_DEFER for card, and use rebind().
> After that I unregistered card, but it works well...

Unfortunately, I can't re-produce the issue in my side.
So I guess Intel test is needed ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
