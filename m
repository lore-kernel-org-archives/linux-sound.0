Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010059.outbound.protection.outlook.com [52.101.229.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E28628CF5D
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 03:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776223394; cv=fail; b=EVgSjOVV+DrnyOHGlP5clk92yeZ4jFLF2Ua5UgZsBNgm+5koOjLht8uSXhJrpaGDtncbAAT++uJXk/eTfmfr3d686niBjOb5spjAyfDL52RIMoJUVjnsBFxNJTYdsBfTiukxS/5sEb2wg3d/yVpFyDZExzPrtqlS0EBqtZiXgfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776223394; c=relaxed/simple;
	bh=eCFWfCvt0VV6+QtEtw8izNlggjrvfsVHlU3unT3jHGc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SXsSiyK3vmd6aiJm3cP3FBaDGUomkpsQF1WRGwKK4OhtgNI6F9nznDcJf8aSCijUDzQQaTuAXdtnxGsdXNxkhK1okMuO/70SlZwYfkPLb6RBzmqTp5rEgPUpTEDo2A89SxkzFHhgm3Kkf2/RTMqvmX+iJxFlOh6xEVPGhcmPGRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aOVmnBa1; arc=fail smtp.client-ip=52.101.229.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aOVmnBa1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5Ds8LgGI09fsIbKztEWxnjZtENNPueEPPGIds6gimBbeJOvRPBxOWOZ08FNpxFUuoRCbkWLchmcuwGL9b+20wfqw+Pdm6kFls9dHHlG23HaasQJWXYO9tJDj2ixTIAnkVglowHTqYooRk5f+l9KWiuevT9xjkC+n9dGGA4Y9+uFDaCq29use5LsJykq3YPQkikRSkLSbzieY/fRDeftUFPyoaJk7l3fvZLspQS7bN8KHqyaeZBMUe/8cu4dO+3ZIWhL6pwR/l2INamAMn7Fupt8tzAycsrjgrM4HWtoqdLB5k6uzpA0ePhrz1rETMjVLD4vHC4E4FXznyrexf8Ujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRsQjKFv0ASonFDwz1gqjIclquHyLoxfo6rPmQDBvao=;
 b=NDF46vc5HUc8c+CLcLS/l8E7XxcZHfQtUZbLk13emjpXVThrqFYxFu1ivR1dXtLACoMA771wVZGuBuq14eG9QL2GrkHNj00suHeffGy4OMtHDSIuQs5rodXfbKVdItVQGTQ8Qphr9uzKiKGTNwTJ9C4lvdJBQvOA0HmZjEGg3/mLqiLWbksYCD/ZQynINkV8qXnokQ8Hu4JRK1aLP5StpbaLZJ3F5GhaBue/atOg5Q19wzyeRjuZu7LuoPdxXgt2pHke0f32sDGgtcwVignOzQerVWZbLip0Lqm+3Qc9JLvWCZTmUc16zjIH2Lq8jRp77LvtgZ+aUlzKA7RQvgzGOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRsQjKFv0ASonFDwz1gqjIclquHyLoxfo6rPmQDBvao=;
 b=aOVmnBa1heQ/W6VebMjqneCNPrFZJzagUIh10/JLYM9TYpJSqXJ0TVrUDgtLV69WDAtGGoiox8w/cwoz8RxAsdYsIB6CfiREr6zNCnwnNG744XVfptrJxierbzu6EP0pMXKkpsdNEU1y6Wz7n3T2fQ59t2ijet6yGDTyBcuB1ss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB15895.jpnprd01.prod.outlook.com (2603:1096:604:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 03:23:09 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.048; Wed, 15 Apr 2026
 03:23:09 +0000
Message-ID: <87y0io7vqb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <linux-sound@vger.kernel.org>,	Mark Brown <broonie@kernel.org>,	Amadeusz
 =?ISO-8859-2?Q?S=B3awi=F1ski?= <amade@asmblr.net>
Subject: Re: [PATCH v3] ASoC: core: use Complete rebind cards by default for all users
In-Reply-To: <6b1025be-04fe-44b1-aaa0-703265d015b8@intel.com>
References: <87y0jsibki.wl-kuninori.morimoto.gx@renesas.com>
	<87bjgaxkdb.wl-kuninori.morimoto.gx@renesas.com>
	<a53ac4b3-1774-4e78-b88b-4316ffe73cd1@intel.com>
	<87ikacdcdj.wl-kuninori.morimoto.gx@renesas.com>
	<87jyub396o.wl-kuninori.morimoto.gx@renesas.com>
	<c54dc8ed-18b7-4914-835d-a17a0e32bda2@intel.com>
	<87o6jmpa2q.wl-kuninori.morimoto.gx@renesas.com>
	<6b1025be-04fe-44b1-aaa0-703265d015b8@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 15 Apr 2026 03:23:09 +0000
X-ClientProxiedBy: TYCP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB15895:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf8a62b-f7c8-4a48-476c-08de9a9e512d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OgE6NLIchSe25Dva99OJSwtXDMQ3/ByhJ/VjQ6TzQD3tmnLUyS1HDT35PAMw47QXZntzgIogRo7o5Rp+jpvHT5wqYoZFMzMH7SY+06fnEkGP3Cc8+p2vIypLhLmPPEWLdrxbO1EdB54Ft34ZmRKidSqigTxinoh/gaqqK9/wEcgxtREq0UoCeIf3/iU9R6jDdwzgPMRDVCsITtm3t0lkBcK9viSC3LMuJdZqdzrf5DjqrTwTOuddSqledImTV5JZKq0AWEY1hge7RuaW7j9u96maa1+FDyoSCowYIBOYcUZJUwCZXjr7CmKTlfq3942auh5JMeXrhVDVZAIJhIpcDI9i8rFcBSki9hg9LkFFz7ZUl9mwMhRK6RxG+WwsGi0PSoWSWW0F3H0a4mwl/wJvfevmt+HVsVxvZnKQcq3WlqHowgj9TVnoJAcrbxx4dEBdYBvDpuDf2jv3GfWGLqRPgPiJP3C/th+Zi5q2pa7TdbubnOcSzce5cSoodjtdE+d9zvJBmuFIa7f6QnkH94+vw30agh5achY11u3nth0sMkqYqFM7kYXWM6W43xakT5kD+24EuiR5Nf45tAvQIYYQpQvFab/YHQ/EEODn8yDPnmUxUwRizIq4evJ/Zth3wbfKwA3fA4+6v0DLVeqvag9UANxbUR4Xj+RpnIg5/RI0ryQCZiiUSn8I6RIRKmvgjfr/msZMGXfRelbIduA/FXth6tHqk/NhDFNckj6NwPtk0KaB7W1x2QNhj7OiKyKOTAS24rNNr95pYrUcRLrpNR4cqeiXXZTRENyaYd92jKJx/XQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sFUCJRuLOOTT6e42O+lBvpBwRXMG/c8KJvseCQRH4i27K/58E87YDMPDfZcC?=
 =?us-ascii?Q?yR1Ij8Zrvgv2idjB0CsbeCfOxKO1ZTNQm/UWpMAohvaZ3HELSAV/i0W6B0ZD?=
 =?us-ascii?Q?iykPlBeRQejI5c//oNWbrxubjCDklGvKv/c+IhSdHt9gLPWwhnco5YbvuW6p?=
 =?us-ascii?Q?RJbMvXDSBgcB9c5PAdgGhi1ED6H14rrdPy53V42MM/Wk6iRMgUmBZpYoOo79?=
 =?us-ascii?Q?J3muAYTnI+PydMYqTtZwXoFoEmsDOczwo3QEHmE2OFBYVZr4hB7x+rjFUMq2?=
 =?us-ascii?Q?m8k/IpkiQi5JzJKxYUIqAqRizurvpUYOgoW1MvWbOFIADo7a7qu61oXYhTQh?=
 =?us-ascii?Q?of6y3D99AdjeRyQFLZKVtQBXmrMo6cOewZKKCowzl17IDjq9gQks5pZQ4/mm?=
 =?us-ascii?Q?3s70dzxFPkNhoeAyOQfJtF0dmFnM8Vgt4py0qfToeUoIojCh8gsiIYETYzej?=
 =?us-ascii?Q?y7Qq8DkTbxW23GJmLw6ndYipVgYHA17Pm1OGOT5hbISZqsjg+KAp1VCHVdw2?=
 =?us-ascii?Q?wb69N9B+CzSni3teWQNWxWYBaNV8G6+e8Nv0VusjGNk7QViK3mMhJejX/3RE?=
 =?us-ascii?Q?9HV+qmtUzZvv5/0A4B9rd12CFyqXttn5JamvSP4KhbenSS9yzN8YvNCJO2rs?=
 =?us-ascii?Q?SnLqrrcanlP104dtr5SYXISEaxQ+BY9EqgbqxYV36FO2FmV/kXex3JkLBtcb?=
 =?us-ascii?Q?sSiR8NSq59TEdxnAHD37Iq7xykL9GX4byeLGxXXEJ/tryw/5BZ1NFJQQvMz8?=
 =?us-ascii?Q?+vRfN9OKZ7RwaKlVtUhsOS0ujgttKTEXwefhIJ+jZdiuKRlfaIPbaN67dq6E?=
 =?us-ascii?Q?QDf4+HuOKwrvf+CJYJxajgCWqT6HbsaVy/0bzobOlUcL5VcyZZTdjUFolE7z?=
 =?us-ascii?Q?BTsXhqGXG1IqhY/fy+f3jLzM+rVjnYLfvIThychLZZqs/pipDhn6lR7MH6vQ?=
 =?us-ascii?Q?HlexjF8vZE8LKCx5bLGi53GU3odnC8Cg1cjclIRrBsp3q1YkfIIXwHcRqsk3?=
 =?us-ascii?Q?GNLI/r9JWJpnDRJ1xCJbuwIqjL5J/lT2Ah1nXPmhlEPZAQ+3KDu4gL1QbrGD?=
 =?us-ascii?Q?nNKpfJG3cmg8Mljx0QTvfRimi1DAv3CP7IwB/96aQAKTVAuI6ljQlUP0hzAh?=
 =?us-ascii?Q?nwPmWvbjZ/FGqn4mwZY5n2xO00x3yvBJhD4NjqUWRZWUU2o5cqstHhgDkzyS?=
 =?us-ascii?Q?tA0xWIlh4MgP6JxdlZzuIs84Orq3K3lCpDTAzrUZei6vGhAGnehuGo67wqFb?=
 =?us-ascii?Q?9qTiQ+JXq0GUeC4wXww+4bD5zzLAOsARKi+KjSnk3TJ25J3tJc4Eqeic01C/?=
 =?us-ascii?Q?c54iZw78qjwhU3AEzJyCtyWGw/VAcykltaOIlZQ0HyWB5GScEaAWmGb5IFRy?=
 =?us-ascii?Q?Ubla9od/SYZmkBPxFzmUJ8pqDHV4Y/yd1CST6/CjNZH8MZ+gD/bkTeyR23WV?=
 =?us-ascii?Q?id/dTKHMgiBezL0+sayOpFTYgCm6+etxRCBsBhKDFwOADrmRCcDRv4eVYC+q?=
 =?us-ascii?Q?76FC84bk0WoLXtNTLThE8gLxonUQAitCHuaN5KmUtLo1stN5QHZUKy3WYmIj?=
 =?us-ascii?Q?j4UVDHGNjGD+cyRmECciAIm+KH4NIHJfA+d54IPJvH2sQnPCxif5ms1KrEX7?=
 =?us-ascii?Q?2WD8KwBInoQ3UsDopBqMHtcP5h+I1h1AoiTYet52X9NUg+g9+1A5/KJKOkO6?=
 =?us-ascii?Q?g5rF7v3E/BeEY9Ya35YyIA7A0KV2s06wS6eYS3Vlq3tI5/vZkVHjeIlg7jTU?=
 =?us-ascii?Q?aFFMjes1Rf+MUP+tylqdPoxNoQV54JUOhhvyjUpBzllfzym39D8G?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf8a62b-f7c8-4a48-476c-08de9a9e512d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 03:23:09.1788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Os5+XCDPxolKnICl8A/YLTTyzZABY+TEC81Bksx0Ak6nIvKMnhx4zSVHvV3zfLUw3aQHbuNgcwVezYR4axpW3N+YP1UosHTWY4kKxWXyugC+o/kIs3DYEBQS1W1/Pg5t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15895


Hi Cezary

Thank you for your feedback

> >> |_snd_soc_card_bind()
> >> |__snd_soc_unbind_card()
> >> |___snd_soc_link_exit() AKA rtd->dai_link
> 
> Sorry for the typos here. Meant to write:

Yes, I have noticed about this :) but OK, I could understand

> To the best of my knowledge snd_soc_tplg_component_remove() (and thus 
> soc_tplg_remove_link()) is called where it needs to. The problem is 
> ensuring the devres node carrying release=snd_soc_unregister_card() is 
> pushed last onto the devres-stack once all the bind-card activities 
> complete. I wouldn't count on the topology being the sole place where 
> problematic devm_xxx() can occur.

I'm not 100% understanding. Does it mean it uses "add", but "remove"
might not be called ? I think it is the reason why it will access freed
area ?

"remove" is called if needed is OK. Then, is it possible to call "remove"
when topology was gone, too (if it still exist) ?
Or use new devm which will call "remove" when rtd was gone ?
Then, it will be like this, rtd not exist when unbind was called ?

	- card bind
	- "add" rtd
	...
	- "remove" rtd // this not exist currently (?)
	- card unbind

> Moving on, I have an idea for reducing the size of existing code that 
> handles the rebinding/deferrable binding mechanism. Can send RFC 
> tomorrow after some more testing. To not keep you waiting, attaching a 
> preliminary version of the patch.

Hmm... in my quick check, it still looks like Card is handling the issue...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
