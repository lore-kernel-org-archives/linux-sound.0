Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C472F7F06
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 22:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782859791; cv=fail; b=mHdalq9njsMLJUnSDW5jhAIEa4rW+0b473Valn+zZ0E+zEvVF/YCGt/qXAVDCQeXzo0rytEaV2JM20LPCQTNPpxNsAfud3B9USZny0liAqMwk5YS+OXJb2WK9DtkSMWUKfhKqCqIarJqfEA0OKq1u6ovAhlyW77zKL2Luo6oIMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782859791; c=relaxed/simple;
	bh=rbvEi0gkHKXPmilkcT19ZbEJPa3cmS9It4S+pnloLl0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dRU+9uD8k3yHexG+6Xrp4jKmf925ixbfHgCFrQ+e9mWXEM25DATa4FZx4M3GJvfYzRla+Kss2eCjY36plksyWxrAFgHMHDWzX/F/iye3Renc1VrDvdmB7l95Pyr2RDyF5WMkgXTeRw/N/HaTte1KUUKszQkOcvAH109xqJrt+tE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kF2mq16F; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kF2mq16F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVrCWxWYBJD5WrfZ8S9wgI6GLkcApb2+uhANf++Zag29NCyToQMBrNFfhA60pxG0/n7WJUuSyerdVMXz8fOZv4LhOLM2YYuVJnxSD9PLTXA2W5y/+vq3u4622MrbZoMRC17zH7FxeZDT27ekT2wGzg7OZBHjr8OXKNseHuiLkrqREssk3tD5eQBEKGPfXz/Y0Goz3Zzv99/HNP98g7dmjnmUyJjy5mtOspFYw0NBKKlo4xI7hzy74xmLNOdnR96uop1y4L9gjKW9cfxV1c/jq56tCyQAADhEOSSwlgA/1DXaPEsUoBJW4ES2b+K+GFqLvmj6Km1a9I6K32YqTq7ryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPVmYTp8UHmp46y2y5nZCQg2H18cLuHhxm46UpKPBiw=;
 b=RrzN89a+f7aFkgZ49t9loQYzDjc7OWZxfMO+kZZ6Fa+QwR3w1b39kmKZG4qlMzxysVMHQ8CiyLtmwjEQbSZDmm5+d1288VTBIgxFMf7R9RY3jDNXvE/KdW09gX9/c9wv795n2bo541SHpFyur8EQReqeBLCAGjEpQQtNETEIsiquV/jkFEJmYOFlohWPVDnQALe3aCSVzQiSWRhXKLVZr89KJ4aTZFuUtQHhiWOyDq9iIubImbuGE3JXY1mcFlCvHd5+8TjwRr6EnUAR5nsBwI0nvbAKK6/tvs4l9FtSggttiDx5HU6YtN4sloWY6iMxYOt+3htLNVQbHpN1c8/BqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPVmYTp8UHmp46y2y5nZCQg2H18cLuHhxm46UpKPBiw=;
 b=kF2mq16FY5PMsk+aum/o67cBZAXQX7wtjcndQGaWa1QIbNTw9A6Wr9DhVAwWj40r/aw/lmWRYnSsdEw9+GTaRYEoSJu93sUXQDpNFojKU9sE1OEz2cZ+vtMoOuryipC4fTnzeJeba4FFFCxAeVox7vLL2TuQsEWoOtqisbUI+QA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB9829.jpnprd01.prod.outlook.com (2603:1096:400:20b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 22:49:47 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 22:49:47 +0000
Message-ID: <87o6grd4ol.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela
	<perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood
	<lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>,
	Mark Brown
	<broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai
	<tiwai@suse.com>
Subject: Re: [PATCH 0/5] ASoC: intel: use component_name for Component name
In-Reply-To: <2965d6d5-6cf0-4fba-97a0-7a97861fbbaa@intel.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
	<d5e3fc22-8a17-4672-ba5f-167d8cab2aa8@intel.com>
	<87se66dyqp.wl-kuninori.morimoto.gx@renesas.com>
	<2965d6d5-6cf0-4fba-97a0-7a97861fbbaa@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jun 2026 22:49:46 +0000
X-ClientProxiedBy: TYCP286CA0146.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB9829:EE_
X-MS-Office365-Filtering-Correlation-Id: b027d6cb-c696-42b6-2d16-08ded6f9e260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|7416014|366016|376014|1800799024|38350700014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	UNKCn9KpMj8gecvYw3fhNPe2z0BqQ6/9MAl+RIIc4BoEpv3ob/Zmt61Y4aa7NvV7DQl3BTciJVy20Y2bgPAxrj0Y1fbgUUOcyNA8+t2Q694iu+hQG0VVyibyumRgSbwgaIPgTrHr7EZ5C3SJ67Miwbn5uYArwHuJitxq4+/Ud9uEnCELlcsWpfP6mF4b7VuStoilnx7j9LrBVZ0AIzOkwzU4QYwc9//hrUMz80LyqlCamFoT3gfinh4oB7/OEMIQ/rqfFi+ATEd7L5BMFcMt8pZDNIluIi7snQju3rEqyJJp+zgL5/TGAnp6VnF4t/5gsGTVWuKCA/0NckTQot9h9KHfvy0QOqpr8fmVxD6R5yYHUDl1ckSfUwuAfeqqKubK64zcZc0sMaLD3b/+gRBjJiTvZ4cQ/g/zcKONDPpo6ZoFuQd4BswSR3Tjtc1q8wvjClOqi8hzSllxjzEQ0uEw+adm912BWrO/4WmEC29KmqoUrVRQ6m24c9mAIT7z2ofWPaPBDnO3/xFzwwTLpebgbv9hlixAilQBXvkw9lC5UaMtoIzYsPmHE5GhAXcUIzqfnngKr5nhCmcSHHZKLy2kr5T4COZwoYDu54fDvtVhNi3HRRKkYoHPHTVQGW8Z2/GN0d3xCucZGTVNbPN6exSZKf0FrBeZ5MxZdcqpuwFU8N/EekFF2+zipPUAijyCsWNfDaUP4cOURqpanPZBerCKBDWdp40A5N5CcMFzijDD76A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AhLNJVprzBU3FeoV1VIh2Qa2dzdRx+uWIa7m/t6aha2hR5RzFdsWgsmwUonQ?=
 =?us-ascii?Q?JOj6ShqbK5l+rlizpVv9rm+Rw0PLBc6LttJV7RKsBOSY5gcf/IJT4A6ePEJe?=
 =?us-ascii?Q?42M/PwR72pnkN8deZ2tg3vdaVTyvetXgKNSveLrVtbYbaQ3CXhGighU8TX+k?=
 =?us-ascii?Q?qUzmnTRPv6ECIotKdNzcP/LNuk9bpoXbwF/SC5TDBWOdbgjH/8QFRoO3RWfe?=
 =?us-ascii?Q?de+xeXIyVck7Wi4xkrnMzAwxemgBkUnTyGY07/Frgdfw37cOi60oBzkeRXaG?=
 =?us-ascii?Q?gaxwse9O7gu3MU6ZMAmJIm5JQNDi3ST8IeiI8oGLTzq1eTP/Wp+4itYluica?=
 =?us-ascii?Q?N+pEtp3JwmJ43PdQEJaQEzxOV/DM5bU0vBjvculChAhaicJeD9ciS7cLB8Pq?=
 =?us-ascii?Q?3fPzRXBoIfbt66tEYM4J+UbPxrqxkxgX8yva8LkLqbnkAqdOvc04vf2DWZh6?=
 =?us-ascii?Q?bTVZ9Z9teKRHkR96TWjlkn+jLikZXZLVQsgHNVOSHteDeftVpQ4AMRmY1ybS?=
 =?us-ascii?Q?ja4AMcDcuCpSmEP7exzNwxWwpYC7KX0Hc/VYl0mS0KL+urWevYEXDS2rYIsR?=
 =?us-ascii?Q?Rr9TMFDky9jWQ3cpNEshFkH4z/vvj0uLAi0U2hGrymauT4dI1KCnrCnr+TFO?=
 =?us-ascii?Q?YnjHkLsOipI/LLiOHxUPYwkWjJlmRQBzQv2SbvDWa2VB7ub+Epj1UOFJc1Zy?=
 =?us-ascii?Q?vKrHiOwVuup6mLJxRGIRZ6HKqNUQN5bxD8rs5XBnod4ewipDV6eW2M9ztYNx?=
 =?us-ascii?Q?t0TjWg0b58wiOp1V7wjYjnEslDDWOiwz4RGXSKiz7SuisGf76k0WhR/QCnni?=
 =?us-ascii?Q?V/bUd/1AlHrhxIQliDt8fbRk8XyWyvef4jKqsEsi7NZWh/uGpkaINnNLinLW?=
 =?us-ascii?Q?L9Lys6fgNBngXPWyVFNojPAUTDUadutwQltbXQnE/VNlzd0+emtz09O0Lw/m?=
 =?us-ascii?Q?Xy01NhU6v6UQUeXU/TlQz/wj+pWSPKA2T8quBVSIqkp1/etF6nVoYpZS2IGA?=
 =?us-ascii?Q?nS9V5kvRQmAZGWghoqwXkg2/DNMvGLiJqzjmSn1Fa5DGCMvtN+gHuUNWHl0F?=
 =?us-ascii?Q?/G05OZWOn8rwluuTDGaprArHz5rTX56nJ314oT36NUZmvvP9tE6Bee7IRpjB?=
 =?us-ascii?Q?f/ynZ9VVA6vJea6I636TuSgbxpjyCMQeMYaY+FYGq4GaiQzf6DiA786921Ap?=
 =?us-ascii?Q?/x3iL7bppya7jrGTOcw2sYfFqJvSllqSMUScHrPRghMsnL2gMT4PTvGFvs35?=
 =?us-ascii?Q?KoTA5gQM/Z6MDNNI/WIXpTE5GG5eO3bU7NFqmdmfj6qUnW2dj8YHVMer+rlI?=
 =?us-ascii?Q?o1RNcuvaFpAFJVw4VLdYbyD/F9MZUdc5kHHHrud8mTc9lBY+vitJ2of0+/oL?=
 =?us-ascii?Q?VDCb3TptB2X2KCgeQpuy/JZxvuMc89DT4vmAUuy3oIeTRXeePyQM7ZQhLiFB?=
 =?us-ascii?Q?JbSlw28TcXX2VS33bF5f4H3wxPNoIGhamuZU14QZK1YTQH1kw2TIiODyt7sC?=
 =?us-ascii?Q?5ohxbbApTIDwtrdqw5GZRNW+uNTmBGTWDyJzg/+x9L63LJEY8p/z4Q9G7qp0?=
 =?us-ascii?Q?rbr5u+PySaMJSWwT3koWqDWpFhzXFHFjIGzyfOjNJNVKhKxatsbycENQLadI?=
 =?us-ascii?Q?Uy1kzaFKkRSrioOEm18mGvPPGad99E3IPnmrzcBa6viNrrQW6ZSsZbHxb4ld?=
 =?us-ascii?Q?qXsUGMJoZ0SA/6jXIvS8N8DE0larQn1tBg1SGpLdfqc9PyBwkiw58L87cPqM?=
 =?us-ascii?Q?KC6h0ahiBJ3x1Y36ycP6QFXc7UF1WjY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b027d6cb-c696-42b6-2d16-08ded6f9e260
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 22:49:46.9661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbQBUXSR6j43lXOIG1pwUaecNyn7YbL8Isk+I8u83HSgk3x/ZiBIXoZP5/u6depEnwuzfOlFpnPS16UdvUqwQgCpvYOXdK6MufwcM0sbMeOLejpCoHVRq58q0gZnXcEm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9829


Hi Cezary

Thank you for your feedback

> > But basically, I would like to capsuling DAI/Component/Card into each
> > soc-dai/component/card.c. Because current ASoC is not capsuled,
> > each driver can directly access to each members randomly.
> 
> What do you mean by "access each members randomly" ?

We can access each members without restriction, like below.
Because of this, there was a driver which is using the member a
way other than intended.

	component->aaa = aaa;
	component->bbb = bbb;
	component->ccc = ccc;


> > 	int snd_soc_register_component(...)
> > 	{
> > 		...
> > (B)		component = devm_kzalloc(...);
> > 		if (!component)
> > 			return -ENOMEM;
> > 
> > (X)		ret = snd_soc_component_initialize(...);
> > 		...
> > 	}
> I hope you do not mean to privatize/drop the 
> snd_soc_component_initialize() and snd_soc_component_add().  These give 
> us a) flexibility and b) dd-alike API (the device-driver API).

Yes, my plan is makes them local function.

We have snd_soc_register_{dai/component/card}(), but only component
has such style. The biggest reason is regsiter_component() allocs
component inside, but initialize() assues component already had some
member (->name, ->debugfs_prefix).

So, if user want to set own driver name, he need to
	- alloc component
	- call initialize()
	- call add()
This flexibility is simply needed to set the name.
But, I don't think it is strange that the *component_driver gives its
name.

And more, if component capsuling has done, you can't directly alloc
component.

> Moving on, does this mean we are getting dev_name()/dev_set_name() for 
> the component?
> 
> 	snd_soc_component_name(comp)
> 	snd_soc_component_set_name(comp, str)

?
You can set name via component_driver->name;

Thank you for your help !!

Best regards
---
Kuninori Morimoto
