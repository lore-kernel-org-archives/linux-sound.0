Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AABC3DC4C8
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 23:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783379497; cv=fail; b=U3z5iOUgvD5eoaOI9UB9MmR+uVeqZpldr95RkSGkrrs2oPhBtVl11AOUdiIoGEA5OjU6KW9GCqjlN8X9Gq/9JcxQqsConPqR0ZmNGLzEah5tQgTLoQnP17JVV5J7Lj5Z4TR2PocoOmWcj/pH/2XXSmG8vTRDFqYtiy+sSIIvRBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783379497; c=relaxed/simple;
	bh=Qpora4GUOPQlBJxDI9Onh1NZuiVmfxIARDbmYMLgl7s=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=a03J1UxVcdjH5207uW+f4c1i8NyxVMC7VhowYOFu7+7z7vQ70OtazL58ECJGcX/ld1oy1bx5/mBs7x/sPOIUYQBJmU5lL3OZBYwxkX3PGpAIQ/Is9sSBlnP1dTlB1Jj0d8pwpVCm2LP1iMvbCSelpd6s+gKJZdmQqiXJkGdVsVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DAvWGxRy; arc=fail smtp.client-ip=40.107.74.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DAvWGxRy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCKOsVb+U2z8yqAHyqqouDp0o2duHxX/F5krH+F8WM1kGNUpa2hrSc4vQszhghZc9t4EZA/G2qOpXb9afF2SWHxiucZU4v6jca7E9abd8Q0W4xZxrj084NX/7wW2G8mj+gd1BBYTiXU9L1fOS3ulcfug4MbUsTE3WTHvQdGJWehjz695iWQQL7SxJe3AXtq7SANr9/yaSU1k5AnjeILozNt161E3tB4ezaXcPrSM3oeG1CBs4z0wLjERktK70/mVB9pH9/E05GloNJ8npuAZh6KrcWm/BPNNzDOPXU/hJFVTNnO/SyifLvLg1+t3GC+XRFwJDMmoXN2UVoOA7Yx5pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qpora4GUOPQlBJxDI9Onh1NZuiVmfxIARDbmYMLgl7s=;
 b=MiArqJybfkdL5hu1CnaV1qEPKCYE+th2jydk52gKmRjAs6N2/yBslYJR6WphOiJdsAmXEIvHMvZlrvA7ggBJu5nzs40c8HFUm4ztoo54+qho0lRMNYK1Cag7+5SZgCeHBUm1eO1O0wyQSGwaZWVyHY1I1ui9umqmE1PVKBptneF9MhXFIj8efvjQreeTU7yK9SgMjOgk1INDZ2uXOzhtE27+djeWB3qKAb7QRZQ4XafNb58USmEcdJXiHvqVWCxZ7j8Hc8frz5iX+Pd3Dq7XMApl/gHhw1AGYFxad3yRwQ8hcWK3UNhmgY4yasa5hDL3v60iwDOI+Le8Ca1GdlME9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qpora4GUOPQlBJxDI9Onh1NZuiVmfxIARDbmYMLgl7s=;
 b=DAvWGxRypjU1tG/WoR5UxiIBSDvFz6PygrVefpbiakUL3U1wC3y4kumIG2yXBYqt1iIhXWqpy1xE1FWGEP3wYorp53wqM04Fkr8VvNPVD61TlmNzaWK3QnhJ2RkxPubVJrdU2zl7QcVnrln/ndVu8RgsJHC2c7I9SPpycSxy8B4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB17903.jpnprd01.prod.outlook.com (2603:1096:604:443::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 23:11:32 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 23:11:32 +0000
Message-ID: <87ik6rhfx7.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v3 00/12] ASoC: add and use new snd_soc_register_component()
In-Reply-To: <77e7ae97-a89c-4fce-8928-8a03177160fd@intel.com>
References: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
	<77e7ae97-a89c-4fce-8928-8a03177160fd@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 23:11:32 +0000
X-ClientProxiedBy: TYWPR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::23) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB17903:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f3b7a2-a62c-458c-2176-08dedbb3eb3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|376014|366016|23010399003|56012099006|11063799006|4143699003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	68k8fcgZ9TU9nycixV2zAoCTEhk3XDIe/uSX5GE6SndhhcMbqdwOyFvXJnm3C35twUvM9358yBsDsd+tiSCh9WBdQ4t+E3U55CK39Y3abL+0cYI+qmln0uoL9RXVTiS8C5jW6bS5W/HdKhslW+MmGHGEZWXECJEEvpaNhunt6/sFXTKcmDX6Ct+a00ZqeJUKAFvTAabeX1GW6IIBhFDTGx2M7qTlgKsbraVcD91UGCauS2rZTNTPh+i1wz0uqEqAU8t+ZU9qhqzr2xvM991R/YVtMnvTL5om7V7Kf1i0GbafoDvNVIt7BUBgNJW+S1DwbYzfoYFU4rclDwPbx200qb3F2F2RdMoont4PXkPdTTTYke9os7o6no84gLWMQn3RpSECN5V1BBqJYrc83Q0zDo4r9WxVkj/0HlgaXpqz81AiaMVKdstOimXTDgFSs9aGP7W53GJ0FIEiUQdK2nPRHXmK1ECLcedVlU+ivIs33cy5XCOvvbopPa3/e4WWcpDnBN5EcxfpCBLE22L5HliKlBGUleC0agj3xesTUvUfXKvx0BaDxFRsbAmr3LlAkIv+m6tuLQ/7UWRn7JqHZyt+7FwIHyzaV6hhY2B54mAd8HhhwMZbnraBSJR8ef92VLPa+ctivWLcP+AOtXXpYeYAZejKTEEDieV8xz0AUE0/RTnZQxvU8ZNzKzztVSMrNKZjpPX04RKcRpeoOxr+LJ/sQV9hoSRced/XyGYWGbQf2uU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hbuyz+39Jk2M30/4D7Nn2N+xQuMATcynOqOEYtEH7GSLS9xPHWPMll+1eWsE?=
 =?us-ascii?Q?65VTqN0ryhYBOFxEiKkQv/wbDKKOqiSI4/JvZatMCZvR+gDopvVFDSwx0dql?=
 =?us-ascii?Q?Ff9aITClESBxy3WNAyE8oTzEKfMIU0fY/wvI761cOe7ZVUCj992Qe00MGrYG?=
 =?us-ascii?Q?vF4XES+AF9ckcmw3Q1XCz3X+UeaKSAnPpXvGxFAEifH52z3ecRqoBpz7CHQA?=
 =?us-ascii?Q?OYDN1JBqDiWp65GXE0HSe6DFkQDuDDKkUXUUF7rwfIaqWP23Z2dGO51EYyIg?=
 =?us-ascii?Q?bmzJjXaB5QgB0H6BIau+aV/6zjyoL8O0NxV6mktd8lOPcwkuhYffhV06aJ6l?=
 =?us-ascii?Q?Xr419K9g2XN4h8GO84iTVIM6966xOwwqngrZcVypbSARg24WhA2RsBcLP1T9?=
 =?us-ascii?Q?gmk7V5RJqSY/We3vD16FHVeRzB36EeOB8r9zYALuUhwqRWs2K7My4jwqE4Za?=
 =?us-ascii?Q?eJeQJIsLlNidVoI9Ej9TnfcR/8xYXtRLj8OACIM9L0HFKwBZFOCtZEvTqjUa?=
 =?us-ascii?Q?ozN4SLtBrORw4Y9XGR8MSMOwXX/x2rXqFNFovB1o0HZFXVfOjfZq4RgPZZcc?=
 =?us-ascii?Q?HE0WG1cnpkkFVnLHJ4xCCe8mvTOh09z82gpMvoZGp8j/cUt23AuruPE1cGAO?=
 =?us-ascii?Q?JPTM5E4BtKWe/hpqrH1/05zgMHjUBGjd1ChHEHBcVqRFxJbYRmHeTjpHcDi8?=
 =?us-ascii?Q?tqT/BTUqYht2+glZaWA029Mfa6Ml/zjZLzBraoUnD4uPnmqKE3OIEHnbya4c?=
 =?us-ascii?Q?w1FTe4cPpCZCTN4bEuhxNULCbvtMlBSrLqNUeGs+4sdsFylz9aL0LlPVb6Mt?=
 =?us-ascii?Q?XiKkLnpFDIGGezUtG5JfxMw5D1t+6cvtKEeTtc9N0oDLGUQAe8+1520wmrv1?=
 =?us-ascii?Q?XVqFlhjqK3gGu4Whr5nel9WXvo+iCMFMIEiBBwA5HSvereu0NhBbMYrtNNHn?=
 =?us-ascii?Q?+qJfYEsxwLTans+knWnUQqH/u1ntTJTB8X5jWQRIS2zerTpFTZx68hTUMyBT?=
 =?us-ascii?Q?GSUqDO3LbPPgaAeDlGHutouwbHawY66qVXwSxnop+W08yJb1sVvlXTgnY9c4?=
 =?us-ascii?Q?OnEbPsp5Jlc/mjlAAHKUyHVoqkeUSTuxarwasjqdT9wM411iAO97JC0HToIy?=
 =?us-ascii?Q?RX2akMPR4Sx3XWd/J4QiQztR9STgdKX2cb97rZRzhewNiYRGxtfKMTh+Wlph?=
 =?us-ascii?Q?UbjkLD0aOI0vIHSTHWhzuJBu5B37FXlFXckWmUcfvZSEabYND2JzBznBjrnR?=
 =?us-ascii?Q?2/uTcHW2Otjhhgig0RAN1FW8OUP6aMI1DGULs9yuRdfDQ49xXXOfmup+gPzi?=
 =?us-ascii?Q?lLcFOShZ8f0l9Ml2v7nvKutt/nNToqa0j5BQhyE7DgwEvHU232K03964s3n9?=
 =?us-ascii?Q?KFGuTDpl+lTuj3HO9VPz/obMqAZSbv6Uq1JasHcAWGxm1MXUd9Crv0zi89f+?=
 =?us-ascii?Q?9VFP2tzYHmYI3z/0H4RF35q9XutAS6ByihLl1bfOmlpMB9XwYo60kdajDDI/?=
 =?us-ascii?Q?RB3MdtGvRF4XzJcjFiFBWfNyPLqLxvy5cmb0kaz4yxaQ9T+MZPJZgvO5mHvC?=
 =?us-ascii?Q?utE0lL5t8FAVLA4B+0W+/UqBnjVWtG32RamtW6aqy86GgfK0z7mkFRgLXDzp?=
 =?us-ascii?Q?PBiy7bixJykXEeRq/wZKStqyFlzjBllKX2suRqdfD5T1ndr8riZcKQTMI5oX?=
 =?us-ascii?Q?YG9uqbueC3WuIxv8Cp2AXIlMf7moafZZtMT1M6y9x0+q3KHpjXSAFoG6n/7k?=
 =?us-ascii?Q?qayOU4PzQdHy8UZf9JeVgdXVMUzmOO76hOXEmkScvl25dJ15zG+m?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f3b7a2-a62c-458c-2176-08dedbb3eb3c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 23:11:32.7147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87lPOhLzzF3blw6BBQGDVzILlf5HZPHYywOiAbmTak17gUkfLuAoi7ph7iw+k4XyhIp/7sARgbY+QUKbabHujQjOY9kX9KMtcyOQ5TDRWKFemTMLtU8Tni3VkV7GOB6X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17903


Hi Cezary

Thank you for your review

> Thank you for good discussion, addressing some and providing technical
> arguments for those comments we didn't square on.

Thank you too.

Actually, I had small concerned point in my original patch-set.
But it is resolved and become more nice patch-set because of discussion
with you. Thanks again.

> I've spent quite a while analyzing the subject and the outcome is:
> Is there something I can help with, to make the conversion easier?

Actually I have been already created full-patch-set (for Component/DAI/Card).
Of course it need to be more replace / brush-up, but remaining is just
posting them to ML.
It will be great help for me if you can review them.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
