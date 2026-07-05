Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D2078F2B
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 23:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783295462; cv=fail; b=FQaFZcSJfefPZDTKLRByr1WoipfIZLXKxawvgLkhqJ+8A9qhdutkV/uZ0X0akP54HcJmyX6WWTsYS1qUMHynLEJxBA2GS/pADhiGMhZ3FVBvAw/sjpf1hU4ITa6E0ikLnARXyLVI4Atk3Xfgs/3hOf5PRd9jB8pAwHLCkifX1wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783295462; c=relaxed/simple;
	bh=uYupMOnSjkalxdYjaQZzzT+r2X5cJbC0asyfGm1jIN4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bu8q9+P+K5INv9OkAJfA00SPb0cmZQ6vmCrAo2cyfiWsmD1UXBG8BHw8SZKQhItP6EkrYCXlU0kVSqsGX8+bilnEiUR6FDQbuN5dvjIeyQtR2wkjvzmEqLRKpcBfdf6AU2q5JL0euPMJzygkk398xd64gyNyH4BF1vLOMagx4ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YYcXCsQa; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YYcXCsQa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKskZpI65KiIV8YYDm6VLU48ZL+6rf8VUtE4CFepWrYv4KKPJyZk5VjAhTESbMnGt3crv1EdK88s7Pd6tMVS0S+Kk/Y6/ZevAobzUqC1e3/HdUJrdjKmbwwCs83DChJefNFT3sledVZN/IH/YLytcpJ+UJKGb0mr86mer3ovTNts0VUFX4N05tg/FgsNgOH4XBkSqt2L6NGSVgEtNuY3HP01YEl8CODyXQKJ35hhnDcYJW3srtCFtjkS2Uib5rj4TC6s9TreqorYQmuuir6Hbl06pDB4TRHjkSXe9ZyujVJkcN84iYuoh3LTyeob249gud5QuEbpx+5uiF9GpNygBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yBfM6jUZqFpc93tauVWTf/Vxkg255Kd8To+89R1eBw=;
 b=fHp7FdKQqcVCTX4c1kuR/eavWfFLnWfjPZfqhoYszFGbXrMOykIpBgR4HnU+CB9rZLoPU/SHExZsWAiSKnGPBvkDUeYbZU8kLFWjUq7cAOlI6Z7awxabfst7owhu6kkALOfGbhJGT1+fOqOhbnDIVOxUV9AxkH7QTrH0WHWhOHTdrW3xi72m9HklcqZe2tyfUYlzL24fk+5SnL3M9w6CMdZSSTsDcx273xi5RvFrlaQAUb3M6ISC47kyE/E+qiopU1lnL9bL7frLskjG3DFCHDIQ/0PlcncI/6ixbsbGL53fQHJZT8S4x7y2bgJfXJo2ANlpvkxmetRw7Q6aSfoNwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yBfM6jUZqFpc93tauVWTf/Vxkg255Kd8To+89R1eBw=;
 b=YYcXCsQa0+KaylgjKwB0L2wK3ab8XmrPqSaJVB1HOR8FnIozOK9He1j2xcPJOBeI+j/snPcGX4WfQtQ9rEhrPdzpE/OChXcHmvgTziqjiMPbI4q18FZvdjRCwDjvBSQLcxwDc4M/2SHDruzYO/vJS+AqI2N8okY3+coAwuf1xcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB9605.jpnprd01.prod.outlook.com (2603:1096:604:1c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Sun, 5 Jul
 2026 23:50:57 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Sun, 5 Jul 2026
 23:50:57 +0000
Message-ID: <8733xxc7xb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	bui duc phuc <phucduc.bui@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,
	"Kai\ Vehmanen" <kai.vehmanen@linux.intel.com>,	Lars-Peter Clausen
 <lars@metafoo.de>,	Liam Girdwood
 <lgirdwood@gmail.com>,<linux-sound@vger.kernel.org>,	Mark Brown
 <broonie@kernel.org>,	Nicolin Chen <nicoleotsuka@gmail.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,	Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [PATCH 0/8] ASoC: add [devm_]snd_soc_register_component_with_name()
In-Reply-To: <52993b7b-d8db-4ca2-92b6-a23e6cb05b7d@intel.com>
References: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
	<64a890c1-5db9-4bfe-bf28-4ab5e4d1b1af@intel.com>
	<87v7aw64xb.wl-kuninori.morimoto.gx@renesas.com>
	<52993b7b-d8db-4ca2-92b6-a23e6cb05b7d@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 5 Jul 2026 23:50:56 +0000
X-ClientProxiedBy: TYCP286CA0127.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB9605:EE_
X-MS-Office365-Filtering-Correlation-Id: e7785286-6463-45bf-c95f-08dedaf0420f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|52116014|11063799006|56012099006|4143699003|6133799003|22082099003|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info:
	4vosLxuGcfeqTWlG93ntoCHwEB0u1CN7IhFHdl1geNK8Zwzfzly5UDdI5eXBLJ+9uvi/TcsGkYbLDBeHTUkjh9n+vlgnbQn1MCRwpq5ak+KDRN/C5QI54PMJf4ne+OR0H6SGaOs7oPTuzt+643xQdYeTaz/uPdlJft1liCw79uGkH3a0hoB1t+RRP0OF0Pc4HrMBES6l9j0OrrNf069ideXJx/EBxPtm9E0GjdzJueGNDc5ZW/Fi5zU8ooC/wZOnYx8qtSCaOCJaa86383wVteKyR7tg9qqS/Hn1qG9wJLxForE4QMTsjUxLoQjX9GKKlG8SGxyucwSCe0sBKkUUpI8GKzrnSWi7H+wv/SDlMVJYI2fChfRnQ/cJeauT9/g7dam6duFKjAFSrqYAZ1ckhN55+O36gMAclh3IOqa6CvbWAUGL3e86Tmtp1SB9f5zv3PZOxyBDlAijYuUlzbZESumN/4LNshMjhx5vjjJLZbGuWyFKbV3Fuyy5SvWuV6XQc2tBTkTHFDuCNV6Gj//pabrizdvHUFeA6xW9DD2htQAY1v/L1ynSmrZi1MuKSToQYEx3g6HCzdsyHlCFkNtrjAQi3MUDszq+LPY0/+Cq/cIDPHE43h3tI+NCaO5svoRatuHBEFHJv4fHqkb237vgnZ8b/X7T8uzIbmpkpzITiXSEWfYNyjm31Rkx9tLdeMr3G6XeGWdsuzkXNR7aJICGMLhxjnFlQTasP2KAgHvi/Yo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(52116014)(11063799006)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003)(3023799007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rb+NgJNnszPXK9TNRCqSbEuxkbxV0RZCqnJ9kbZVHfQvR2rFsKSJPyyNQRuW?=
 =?us-ascii?Q?ar8QuL1yK56DWdZNBk0YDsXlAckoXAOcKPu/ff/iQSC6JYMVmMdN5ovOQI9C?=
 =?us-ascii?Q?MlVrvsbjqMmhnH3Qkuh18FBgP+gsC6qzGADiqCLdE5FaRNNsquh+bgDB8vqR?=
 =?us-ascii?Q?5sTMPRTIEbqtDEWCfEPD9RUjcEv3wQjkHWtlP/6dRvkH9l6MF8xdxJQxJKjg?=
 =?us-ascii?Q?vlhEf2bmuolruLiQ4mXKs7/x23Z7w7FdoPiaK9TYgh/XkUcH8YHfeA3ZRIDJ?=
 =?us-ascii?Q?w3Ef2jNd9yMd4yxB8UMeMBhOXSU64tYbt8s9ue9IIYP9xICBGMQEHH4HIHnf?=
 =?us-ascii?Q?OEu+7URg1Pvn9f3d8sJOZTfAsEckh6JOLPD1Td3FOlR/l273eJ6DBcFc2+bO?=
 =?us-ascii?Q?9nRLDVzjN6bsg/qKT9MOP1mbDyJE02cNPRls3MbM9okKpXQoM7rpKzL8KW28?=
 =?us-ascii?Q?fL1EvcHrogx1kury3D3YGDnlbwsl9UvRnXEp2vNEtGmSIULydxYhQyHT5v+o?=
 =?us-ascii?Q?MkqNVkZ6twsIOHDjoDFP+sewIEV1fN9kdepjSbZFsY35p54TApNhSRBLxxW6?=
 =?us-ascii?Q?ZZAzHYmC14tj9lP5S3dtw9IDzGN5v3SdO4MWq8DniCU3IWMOHCuy0ogI/AXO?=
 =?us-ascii?Q?Y6GP4kcBuMxPttI+OwXB2khiD5B3JxhYQg4VVb9EJbjrNIfv7Eg0CwF5A71F?=
 =?us-ascii?Q?S4itGTKADaqsPh5qwx7PiUgaL6LQVSHaEqtfNsSQKSUJxmiRW4yetSUJudqx?=
 =?us-ascii?Q?3lF5v41Zh0ChylPpfW/V2PvlcaMTcs1WEPbcHOYm7vrAf4o/WsIFUuEro0il?=
 =?us-ascii?Q?0VxkCD5+LFgqrImLz2k1AY08oHnVKmx5c+tbfHjhkofNe3A5AzG8UeTl1e+b?=
 =?us-ascii?Q?Dn2Pu5Dl0I/fYXA0Ax50Fx0rFDJhe0HL0GJ5ZgYHvguz1xihSlbn2Z2J414h?=
 =?us-ascii?Q?B3peYn5gSLeM9B0OYRJ9167E0ausv87CwOIrK77UZz6tEdj6kE073VHLuDtI?=
 =?us-ascii?Q?po8xust6XEV9aixWw3jWR2CRJE0spFwiYw88Ta2BCxs9XqeI1KheVHAGS4w4?=
 =?us-ascii?Q?imfoeIVZd2Uqh0yh2P92N5+OibVpJYR8offDdTM2uKmgaKtFo4epgVSI3DnE?=
 =?us-ascii?Q?ZmYUJsAiyRQ9HKB1E5iAp1Mx0xXicWP41tHUyMh4YsHLZwrdIWIxHVKnaJ7T?=
 =?us-ascii?Q?ojb35cytJrX4c0KcsLkhIUmM3PTtQMXnY1aHLGmNWOFlGp/vRbRaCT0PW5sR?=
 =?us-ascii?Q?RoS5jHltWJ6nNXzaZKFGQ7qygidKCmog9qDZ49nWZeCXGtHV+d8DcFe8DIN8?=
 =?us-ascii?Q?0UYiywxvyTpZcnkmDQeq95B5j5qd3RQ/gV7XPSc9BBNhqI5761PO96+TdKoS?=
 =?us-ascii?Q?Z1x+yXjKJCLWUEs9ZK69QxpTKAFgpwRfwM+VnWchn5nb4tpRXc1GYhel3w9D?=
 =?us-ascii?Q?Twyc6kaOUIc/ElkmQZKXEh3Cb+Y7S9ahxx+22qB6lX9i0jlB/3YaLKzOaPzH?=
 =?us-ascii?Q?GU1yzJVd7WDlU/0mGjRlKvop+Q9WC0KsuXG9zYU5WY5+xWGLNpljJVhh8SjT?=
 =?us-ascii?Q?I9vouGSzccGrKeqrCw7mVeZlZUFKK0OIkW/B8wrPCqdeAtAN4vUAV8zMPDNf?=
 =?us-ascii?Q?ZfUmZcMqCyW/xDDcSr3BHFg23zye75wNCz5OQwu6XB9bzV/b0M5AQdfVpeTM?=
 =?us-ascii?Q?vTvb+6mOG9JmXZX2PbyHNq4dQJj+DrsQPnOn53O+28N2iG7yO4Qch+V+iHy9?=
 =?us-ascii?Q?kvYfnkuOevzRU63a4uhWrmgG6dcu+Jg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7785286-6463-45bf-c95f-08dedaf0420f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2026 23:50:57.0163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewtwTWp7i9nrw+Dk1rsgV3IOJXM8ZJ0Hv1CLuGQB2mQsn/odUdX14GiI4RFOYKIoHdQRPDuwdv2feLmkqnjabFFPax85omJ9lk9hVkLQwUFTvotIWnI1i0MKTBVB2rd+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9605


Hi Cezary

> Well, now I know why other people seem to avoid the (very important for 
> ASoC) subject.  Given the scope of it - literally every function and 
> struct - I'd have preferred an open discussion.  I wouldn't mind an 
> opinion from owners of other large headers either e.g.: dd and 
> dma/dmaengine - is this the general route the kernel is taking -or- just 
> the ASoC thing?

I'm very welcome if there are any opinions, etc.

Some comments.
Fundamentally, there are not so many codes which get changed the
method in Component case. We are already using functions to set/get
members. However, there were many ambiguous rules around register/init.
Affected drivers are which is using non-register function to register
Component (= this patch-set target).

But all Card drivers registration will be updated, in my plan.
Basically, Component/DAI registration needs driver = the object itself
is allocated by ASoC.
But in Card case, it doesn't have driver today. Card object itself have
callback functions, and thus, each driver need to have object and register
it. I want to follow the same style for Card as for Component/DAI.

> Provided there is a getter/setter per field, we won't avoid the runtime 
> problems - one could simply replace xx->id with xx_set_id().  It will be 
> easier to log/catch the problem, though.

At least, there is no big diff for the members which can be used from each
drivers. just replace xx->id = xx; to xx_set_id() only;

To be precise, necessary restrictions might be added. For example it can be
set once, etc.

And we can avoid to set the member which shouldn't be updated from each
driver, and/or, we can standardize the configuration methods.

> Since you're about to touch most of code lines in sound/soc/, perhaps it 
> is a good time to do something about the prefixes/naming convention. 
> The headers I've mentioned - dd and dma/dmaengine - have rather short 
> and crisp prefixes.  Having to do 'snd_soc_' e.g.: 
> snd_soc_component_xxx() (repeat for all other ASoC types) every time 
> kills 100char limit quickly.

About longer vs shorter naming, I/We had similar discussion before. The
result was it is better to be "longer name but easy to understand" than
"shorter name but difficult to understand".

This is a separate topic from it, but historically, we had both
snd_soc_xxx() and asoc_xxx() before. There was no rules for naming.
And we unified them to snd_soc_xxx().

But, yes, I will update all drivers to use new function (ex, xx->id to
xx_set_id(), etc).

If you have prefixes suggestion, and Mark agreed, I'm happy to replace
to use it in that timing.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
