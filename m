Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6134E1E98F3
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 02:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755569448; cv=fail; b=gyT38juCy5UwW2bhw/HMGHWEVfyrfNrOoMmNPXQE/lIE6OpqTxwxJPdcGv9uz0e09SsqUqosmGIVECREXe/zLV9q+HOnL2vltp1Ls5ACvTfWxagKJBNxXc27l6IZS83+Ez2CKIjDZgxW+SXN27A2CfmyCQY+6qLBK6pGvE31MS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755569448; c=relaxed/simple;
	bh=CYHT2mDuiUxcvRIEKx/6kB7zJ1+jtzWoyfGliLaWVLk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oXmtSR3zM99KK+yNcmo+fE9rjvkc+0tIIoFVbJGZFZfgiuHc1Yu7Vb09OZluMhChPJXHNPe+Y0T/MJ9VqmGmfqgSyQw+Ew6SqhjzfboP+7V7I0UM5AYNBunGBVUN3vRT+7nll7o7VC0pCLim5ZclZy/BuROrxbwIh2tgqh/ifbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PwV119W4; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PwV119W4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUajgTT/dpRcspxs4M2k/hf3LSRJ0+GMzoenl6ekLGoeRNAgFZhSwbUzWIPRaCYh8IkYhZsfjkocI+mgO9qDEXwj2HKH5EZwvYcmmXvRvdZe9Ezi/ZaRbF8v98ZXvJCsDM7fQHMWAqsilVuWFVXtNdlwVFT8vHowc4TW5460b+HjbPmzmDS+X/GYmu61icnM2GVicqppsBQqzYKUl/AgfKJCBAMLtJb32MlyAEQSe0VY3jPl+To+7fajH9JRCz3TmUQqZ3XorfLHPPHJrZdocLRNofy0CVZNBTbBR5tIn+EvpoLLix0qX5Ixly1UEmZniAt7HoBFkP8eRjoBDmCV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYHT2mDuiUxcvRIEKx/6kB7zJ1+jtzWoyfGliLaWVLk=;
 b=joLlS1VVnnzHzzc24pD0/DdjWeyKrpj7Q1GpBKimSXgNPYbJ7c7KyrYOUO4op89W+vutvJTTX7A7BMu7ZubDryV7sdcsuSmKn+9htO/rPqiy7yyWbq5J9D+g/86JN62gh8vy3JI+hCSBdlT3xJrBMlMS6ZpBZKcrmD12DDBZUUV7rLUcz0H0PcGhvHN2rnYPZYrDwcVUWPllbZdg4en9ugBkViuoaOczOfXc4Og0L5jFLpSHex5ql+qRE/57DkgaEAjKu0rtvv/lQwQAUzIdF6vUbCMHLzG3/owWtVoo89XxhI6B3xR6c4WI8revso1ta96LyUr/nQAic/M6EcK2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYHT2mDuiUxcvRIEKx/6kB7zJ1+jtzWoyfGliLaWVLk=;
 b=PwV119W4FlmbhWjP0wjI85qDRJR244vYAevso0KH/Pp205ACiTgSEjhcImGWQkKeyoDj9FB9ryKsDk++hqgOyTrX083/lJrtgodXIoEEyokN/lEY0f6a62hqtGi0nWfwmXamULedvLHLTWZcTKBuJmxN4Ir3weISdC0qupc856s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYTPR01MB10936.jpnprd01.prod.outlook.com
 (2603:1096:400:39f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 02:10:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 02:10:43 +0000
Message-ID: <87a53wysbh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, J. =?ISO-8859-1?Q?Neusch=E4fer?=
 <j.ne@posteo.net>, =?ISO-8859-2?Q?Ond=F8ej?= Jirman <megi@xff.cz>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: soc-core: care NULL dirver name on snd_soc_lookup_component_nolocked()
In-Reply-To: <87ect8ysv8.wl-kuninori.morimoto.gx@renesas.com>
References: <87frdoyswf.wl-kuninori.morimoto.gx@renesas.com>
	<87ect8ysv8.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Aug 2025 02:10:42 +0000
X-ClientProxiedBy: TYAPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:404:28::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYTPR01MB10936:EE_
X-MS-Office365-Filtering-Correlation-Id: 8effdd84-bdbb-4ce8-de17-08dddec59a0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-2?Q?hMh+bqzsr+ee51UoTQ//DeFZ6VUGdI8t3USQD7Hjp6Vb+DZ3SioXbw+vMM?=
 =?iso-8859-2?Q?ECdiz/oPIt47l5QlA4ZAC13Lra0V/A5Tr+vH4w8SV46yyl+65ugiW7HdDK?=
 =?iso-8859-2?Q?LVo0jcgy7byv6P+4c1n0SY3P+dsYta7iufwTmwQhr8hSm5lGdHRUrhmiqi?=
 =?iso-8859-2?Q?fLAhAs9ZngrxZkABel3j3y+QYWSseACnLVyFs4Q9fzbQ3RZpC4Weg9JUCg?=
 =?iso-8859-2?Q?Et9M4YmU8MoBVfxdkS7iHt1W2oEAAl9ypi9R8fZcnloAH3R0udjhDTSo+S?=
 =?iso-8859-2?Q?Y5B0Ukm+aFibJINKgRCIks2f7ivIjI0HtMD//7pV78qeaZebkoYM5KgVn0?=
 =?iso-8859-2?Q?S/Yl24EAKbwrGLOP9C0JB0Mz0SnYDpisdkQzVXbXlygx8hFS5bAF/oyTZU?=
 =?iso-8859-2?Q?Kb6De9zZ8kDe5JxGLGBzOAnsEy1ZcDcd60L7fFtK2eedPs5ySrGA51dUnK?=
 =?iso-8859-2?Q?ACF3wjON+KxcJn3XkBQeDXVZpgo5NfGSTagZi7hCHof7Opw37ZCb8HAVyj?=
 =?iso-8859-2?Q?DsNQk9Ih322S06YL/0nRqmxBUzxfyDTH+XPPGQCVFXLO7u39JQQnBxnTdM?=
 =?iso-8859-2?Q?7lHWFUtrQH10NEYRpIh7WhQ1BbMvJosaPNLMag1wMDQOlUOLwTlAE7tTo5?=
 =?iso-8859-2?Q?1UMmWE4dmrg5egUcedb93s9WpgShS0Riz9faHAZTfXX038p5zsSljIjg2K?=
 =?iso-8859-2?Q?35EKrCsb7t0i+RuN/v6JnYa3248FRRqEfToUqTzz8Ot64vYVe2ya+e4xCB?=
 =?iso-8859-2?Q?O0IccVM5lESV1hWoGFqTevlUu1JoXYQ55FJnMl1euIqqwp2y2ouXccJ8kL?=
 =?iso-8859-2?Q?l9KCkLOW4V7cbNaeBZSa4fQE25flWGjLNixW5NfKh+NV9t3u24CQ2pfJRi?=
 =?iso-8859-2?Q?uhW59hW1p/MN9Wo3NaoJOg4fFmxTQJFfX8GiEze6Rogf5lPzP50UdsRDOG?=
 =?iso-8859-2?Q?UIA45myrDHCnyceMwlVY7av7OorVX+zXQMQCcwI/sKr2bngPbhmbKRQYie?=
 =?iso-8859-2?Q?WBS+c+adwQZadOJ5AOFbwP7mtJ98+y8FlSYcPwpP8yudS7EvwfoNFHyOr2?=
 =?iso-8859-2?Q?GXtfCjydhOQjQixUQK5EJpJZ/XFa9YyjGYiab+W8cEi9caTJFHvonygF4O?=
 =?iso-8859-2?Q?sNr43AmaMWRpBQKBcZpYuURfSZj4tIt2I3koeP0booId0YSK6da9imXoBt?=
 =?iso-8859-2?Q?+1F5CeFVfx+00Awbi2ViICiISJeN+oKzfSG7PUuojZCdL79Nnw09eJB1OZ?=
 =?iso-8859-2?Q?OOspNP75RLdRHZBCWKIUvaSPSn57kKHCFxZKSbr3TPki3lKyrmG557iAOE?=
 =?iso-8859-2?Q?xpURpvjq8armhPcD6YqUUWCGZ7Y9NazsdXlhagfehCWMYdLOyI8lz8nnD6?=
 =?iso-8859-2?Q?xf4n/oI1zSK3kfq0Uv5dsHtLYLnfVCu8MyZAyv73OeTVVwbKs5yTe9yLU/?=
 =?iso-8859-2?Q?5RiB0yg+DY80N8FKCuCK3CtrqcbMP5hNpEC4fwtBKjtREIy460uauYAXtK?=
 =?iso-8859-2?Q?s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?ck/wDlQmsPXhzsk5xxpaUhZqBiezQSUP2AfmTPoZyM7/mvbAdrhbAmr80j?=
 =?iso-8859-2?Q?MvLAhDnC0dWBakITiYVbv/ps5faHvb5z6B42aCfuhXw+6NzXgxyLRXbNEO?=
 =?iso-8859-2?Q?vl1MCp9Eihq4k/Zp0yFIKS88OMzEcOlzTFt8BKNUxmu3PJaz4pccUjVKxJ?=
 =?iso-8859-2?Q?aeKaFqfEfDDGOl7bGkv/mTFH5sH8gZTLJI03AfeLHV9vsAjiQA3pcQ7P/K?=
 =?iso-8859-2?Q?AmIk4fGwxD1YVK/PG7KauyattmHd7rMWTnTe9Zx04YGKZMEKQqgTMTz827?=
 =?iso-8859-2?Q?NYh6ziP8JTjRSPzWBTmSZpN81Zzr7WFdDlbMGNv6ElITu/2Jv2WEIrVrEg?=
 =?iso-8859-2?Q?z0RwvNU/+2lI7skTFtBaMeSLufKcwngML13fpzbbhrES41lCaiy7cxxzYt?=
 =?iso-8859-2?Q?coErxmv9qtgz1peF4llVyniDt+WguXKCe6J+x2GwDk6r3RXbBpvbMOiPyj?=
 =?iso-8859-2?Q?epNMl84Gq8yP6RNeYV6btHYhvJwYPsT5YrpUuCmg2zdiNYVPD4LmcDGjRS?=
 =?iso-8859-2?Q?/Cg441KbWFk/E/iJ//mw0D9HO9qfx1LSxn+H9etJjrWx7ICtL354etvknY?=
 =?iso-8859-2?Q?Xx555v1DeihXVw1KQrOE7NmfTQVdLYhfDx+XBJCsXQjsYDoAN6xNUZUaM5?=
 =?iso-8859-2?Q?sFDhzsFWN2LmEQwealIEJqeqFfDvWhgGWQPIvDASX5nyOkz03bScEnHN2j?=
 =?iso-8859-2?Q?1RPDcygI3d+dJ2MgwBsHQ7alUGBboFrs7s6Snwps+imzdwO3zrRIpKqlvH?=
 =?iso-8859-2?Q?4nPiZ2ILAewgoRDouZmUt0HzFL57Gf0+ejNkDCoWTMAyieC6ISD4K6hnEf?=
 =?iso-8859-2?Q?mvnf8v7+KK/XPNGKHWytn64rMlyQblA+XczGf0gK2jkfz4tO9CU/5mLzVZ?=
 =?iso-8859-2?Q?UsGk5vnQkYsrM3q7VRfyqeFZ2T+f5oS8o2nK2l3qMWKn4OuL5WZqVU9V62?=
 =?iso-8859-2?Q?W5GnWoLzKTiYKf3+NND3aHj3ntfEeVGOOABz/ofsm3s+G+l6Ty7PS6z9Zh?=
 =?iso-8859-2?Q?u4OYPfE4zDW/GBIug2Rz4+MBOsz68XKOmQxmJ+RNTbW0JgDsjWp/UatZ1V?=
 =?iso-8859-2?Q?rQJ1qKgyoA+a9vayvMmbNn8jOAm8A0QDPbJdDGnHaeRPuqTnJ7cOEP2eQE?=
 =?iso-8859-2?Q?EaJgtVB04eUb43hCw3eiq0022W8d6Wad0znXE9cOl3XmNHjq46NL8fZqNr?=
 =?iso-8859-2?Q?yvg7/eW0DQMkc7SfkZhaltrX2Vzgu8u+rwA24BTdnbr+HPDgduLqZAP02z?=
 =?iso-8859-2?Q?kyK84edFfbhzA88hiqKlTdVn9r5h9Ff0Yds50BCqdGKOuwASE+jXauN46J?=
 =?iso-8859-2?Q?CMJlNDci2vbJsnzZfXDeZg53frbtEtJo3507qedasAO8Efaq64dfYOdqOJ?=
 =?iso-8859-2?Q?TVyHKItETWRtv3YlJqZlvZlg4qPlrYEygXTCyio1c24yrj7wqGYDd2Lphd?=
 =?iso-8859-2?Q?G23+VXq/zSNFrth5JNWM38BIZS6mi8jAQ3nTkHLuUaUhOgp/94kI2D7UE9?=
 =?iso-8859-2?Q?XwMj0Z2mUtIMIw7bbhT83R04JGgTRm95eiYkYv6d/KZavReje4lz7Qpnow?=
 =?iso-8859-2?Q?gWjtcOtJu3QSEp1YVAGTvHH5rKDVXRpSU3r+EeJOJqAHd95/QzFuwttTGS?=
 =?iso-8859-2?Q?wzUHUMaAYOkngId2Ztl01eawgqCdweZQJTnyxeWkaWYn9HGxNlkiOZG1TI?=
 =?iso-8859-2?Q?E6gvHw4pCMmsD5lKZHk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8effdd84-bdbb-4ce8-de17-08dddec59a0d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 02:10:43.2331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ezw8qnaipPLCduKmWyb/NdxQIb0OrdTePF6hY4/VU2ngJZSvASd7Bic1lZVUFamLFZWQARPphV0Q+l2eVmIgrmtKU2t06lmHwheGPjRavLphYxASWn+MFsrGdS4zyrXo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10936


Hi

> soc-generic-dmaengine-pcm.c uses same dev for both CPU and Platform.
> In such case, CPU component driver might not have driver->name, then
> snd_soc_lookup_component_nolocked() will be NULL pointer access error.
> Care NULL driver name.

Reported-by: Ond=F8ej Jirman <megi@xff.cz>
Closes: https://lore.kernel.org/r/arxpwzu6nzgjxvsndct65ww2wz4aezb5gjdzlgr24=
gfx7xvyih@natjg6dg2pj6

Thank you for your help !!

Best regards
---
Kuninori Morimoto
