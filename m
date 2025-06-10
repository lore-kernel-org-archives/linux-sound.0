Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AE425DAEA
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529336; cv=fail; b=hbk/8hgaR+GhNAmSoecAE9JituXOf8YHiFn6TtkoYp8ci3INVZtiiP+72f93tMvmUz2S1SD6u6bPGLtdsTsZf5LYVxqf7+nrxUsndHWrzoVBnsSqElZa2o7JhbZj4BzIehpFxbX9BufnQ/+SrARPtDbt1+YtrCja0YvwOZmJoi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529336; c=relaxed/simple;
	bh=8BwhcCls0hVgm6gU+Dxb9wHGFX4UQU0zc7wMDM7RXis=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=j6BmzTngGfQK/G/LJF/rmVaoPKSRHtFqkbXylE8n1oVUer78drruuLPmSuQl8p/ogShYS+s7ZDCeImFbfTmIhBvGJdQn8MdYSx9CxEmnFCOCHEzw61D/b/4Y3oux9a8i/FogmWTGcEUqJQCU2RoFZ6EGpTXlQE8TxAlJxv3AWr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jV43n3WW; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jV43n3WW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZ5tUN3IK+EAM5g0nz529ctjO1athX5ysWUzLZx3QGb7B9fCbP181occnWdeQmuKl8Wa5EQVAbzcjTPddx4Z+FnbLDMtCzLG6/lWp68fOWwSyusvBN25Q+Bp3DQKEkRkQ8kXmho54CwaKdig1cgUORK6eCAOfu3CpJ1lBl/HEfh7f8PtNnutaMCNhohttT5P9toiKCEnuPJgshK326STr+zAcj+A/3qbi9gOGoJKW4Qw1lIP5UHqmRyRCoNZTpJe2+Xb7mL+i3QBi83N9A5qCtUZaR/8K+IXrqJaJFFncY5h/hpE7jawzRZDnT5+n7DBKLZwyPt6/sJOPpeSrxandQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0TBRvM9KmRbFPufLDNH0YwzTBUyFjeCmQ+6OQPjWiw=;
 b=WHZTSGaaIdQp472kf2+AyixfguF03MARGNQqOeYPlaFwu7ZasUwdWZL6DypbkKSW3x6eRi6psOALgZMgpPnLE/Wfvvu25+smcR60mxyMRqXdbrkNYQ3Ri/X0zC9PI2kjuF/WCCAmhIQyhopoFjBtKiU9KdAf+el2qfWTr2G644sUgEx4KW0e/xJPlQSrZw4f03vEsN87RQ3pGj6oyRyU2A+HdMMCQ8lV7zMxk/as0gyqhvmjyMuM7+PRCQ/mxTTEXAtSg6cPvHt668QtzYuyPxQyReWg6mtP8kvq4ZeMu/S+3mB1nwrNfaWN7YRv84sg2DaBiSmXoLEC8EWHanUEiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0TBRvM9KmRbFPufLDNH0YwzTBUyFjeCmQ+6OQPjWiw=;
 b=jV43n3WWt5tDeWcjVRYi87WILD76bBsLSJ1uN9o2AVj1gtILzpWGx6Eod1a3bS3sgQz7pcx04qeEnoaOCiLN9QuPfaDkxkRUojqPz1cc+5Sw57A7Go8iHSrJ5uqsVXk/Q0mPgIVp96WMieWN5AaI4OVOTNuUmelnBE0wv8ooDts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15231.jpnprd01.prod.outlook.com
 (2603:1096:604:3b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 04:22:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:22:12 +0000
Message-ID: <87h60o6xak.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,	Jaroslav Kysela <perex@perex.cz>,
	=?ISO-8859-2?Q?=22Martin_Povi=B9er=22?= <povik+lin@cutebit.org>,	Claudiu
 Beznea <claudiu.beznea@tuxon.dev>,	Andrei Simion
 <andrei.simion@microchip.com>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Paul Cercueil <paul@crapouillou.net>,
	Shawn Guo <shawnguo@kernel.org>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,	Fabio Estevam
 <festevam@gmail.com>,	Daniel Mack <daniel@zonque.org>,	Haojian Zhuang
 <haojian.zhuang@gmail.com>,	Robert Jarzmik <robert.jarzmik@free.fr>,	Heiko
 Stuebner <heiko@sntech.de>,	Daniel Baluta <daniel.baluta@nxp.com>,	Orson
 Zhai <orsonzhai@gmail.com>,	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,	Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,	Olivier Moysan
 <olivier.moysan@foss.st.com>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,	Chen-Yu Tsai
 <wens@csie.org>,	Jernej Skrabec <jernej.skrabec@gmail.com>,	Samuel Holland
 <samuel@sholland.org>,	Thierry Reding <thierry.reding@gmail.com>,	Jonathan
 Hunter <jonathanh@nvidia.com>,	Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>,	Masami Hiramatsu <mhiramat@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,	Michal Simek
 <michal.simek@amd.com>,	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,	Mario
 Limonciello <mario.limonciello@amd.com>,	Yu-Chun Lin
 <eleanor15x@gmail.com>,	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,	Nikita
 Shubin <nikita.shubin@maquefel.me>,	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,	Vinod Koul
 <vkoul@kernel.org>,	Shengjiu Wang <shengjiu.wang@nxp.com>,	Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,	Sudeep Holla
 <sudeep.holla@arm.com>,	Elinor Montmasson
 <elinor.montmasson@savoirfairelinux.com>,	Binbin Zhou
 <zhoubinbin@loongson.cn>,	Keguang Zhang <keguang.zhang@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,	=?ISO-8859-1?Q?=22N=EDcolas_F?=
 =?ISO-8859-1?Q?=2E_R=2E_A=2E_Prado=22?= <nfraprado@collabora.com>,	Geert
 Uytterhoeven <geert+renesas@glider.be>,	Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,	Sameer Pujar <spujar@nvidia.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 21/37] ASoC: tegra: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:22:11 +0000
X-ClientProxiedBy: TYCP286CA0094.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15231:EE_
X-MS-Office365-Filtering-Correlation-Id: cf67a68d-3805-4bef-221c-08dda7d65f56
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qCISz/gbtRgXDx0pXQYHgrOrVX5BmhVRAtwy72slkve2eAuCvxUdx4If+2iX?=
 =?us-ascii?Q?SZeZYHyu+S0D3u07ZeRIp3Kcixy/DYJoyPzScYBxA7F4/kqijf/MFDGhoomo?=
 =?us-ascii?Q?NqcB57qBHAqEm/ESvf81CbYQ7r5G7ldR0N6XYSLmIdvBS3Y/aZGQrWgQm0y3?=
 =?us-ascii?Q?T1z8XjFC5H2njHe3zSRmXk/cO5Ii8ZKo76Ebys7Xtu8d1dwruSizsK6bQ/NH?=
 =?us-ascii?Q?ixBzkMP2mgH4xW/s/0eL2dOwlxea40zpLXL/bs4a4tljUu8+rRriajFLKGSX?=
 =?us-ascii?Q?LuOK68HklfLPQEe68Ot8y9gidfBKLThEskW6t+m5/BRDP3F1oDoy7els7MnV?=
 =?us-ascii?Q?qtBrhFCqft//nKpN0Fdnlr9EmPdptfvHk5rm4D3k/UVHw6mjlXjfn26alSXu?=
 =?us-ascii?Q?/i1wTFwDDSkU7YfICuwawG1Mmczb/de2buFpImQ3nHS+YYDWdm/fbpVNdtsL?=
 =?us-ascii?Q?R+Ix/kGo46TD/N0LN3kTbYAVjXzmiw9sENru0pJPWG0foX+ynySDEPOycQB0?=
 =?us-ascii?Q?1dyAWHr+hk1JA7eCyrP0kxBRQw22NGLJAwi9hue5gyEsn1LoGcwo6TjxXroM?=
 =?us-ascii?Q?Icdbi/ULhW1nlflCb9bffc/BF/x4SIwUwPlh/sI6vzKYd4p4xhdRdPbySkCJ?=
 =?us-ascii?Q?sK7z1Go2OxGwmRAB9ZKgifgljecfvUCFAjBp+usdXEXZn4XgjwJSuU0W6nR6?=
 =?us-ascii?Q?seBZsLwSDkvgxEIV1d8X/trA1YVj1iCAzKxqASFHb9fxdzg9JlUvi7hx2rJH?=
 =?us-ascii?Q?2DF1IU7AGgh6HLtBe62vnN3QWasC7qo7oMAjxQg1jmQZhXhZ4/dC+zWCUq5w?=
 =?us-ascii?Q?YLtL4ZuOIpVLyuGErjz46ulTSoRAVcwnm0ZPMCDkWRow/RWjfr8CKIL4kW2Z?=
 =?us-ascii?Q?gwka+wu6TkdOdUJSoJ9Z+WxJl/uYecpSb/XtKHBfRh5T10nxMJH0exBMDNOw?=
 =?us-ascii?Q?EuesCgFiVHV/biK7NdaPLjVDAd7t1cY2iaC8hEaX6Fwh4FSu/QD5RCPj0aEs?=
 =?us-ascii?Q?XECb46OAMPeQS84vHsbU1qhUQKbGsZJ9D+iiE/mpAUR+S1Z/eMiob5EpSJzP?=
 =?us-ascii?Q?qkzJI6r7PHRFhKIVkir9EX/Cm1rVBduJCQLTb44tDhrqvths571F6sOaxtug?=
 =?us-ascii?Q?3kmuG1KLSh2gdXYGKtm6ZFdGBK/oVYRd+XtiDUJlXSglnFzTt5GR1Rmo1TsL?=
 =?us-ascii?Q?er6O5JPPYuHAobuZ0Lgo0hihg0Rq22GFNpK34S6g1Theaa6/lq9TfwUD4Bib?=
 =?us-ascii?Q?X/A9PORZ5w41pPmVAG9iG5dP69tzOlp8F1x1/oxljnRPY6vBWTPXJM6y6ZTV?=
 =?us-ascii?Q?ohIAyqTxx7B8eC3K5Dbep1DZkr7JeZLD4gSxCalaQGSwYLqPm6XVyYU6S8SV?=
 =?us-ascii?Q?WEskwbyXQjqEN5kz3PqodZgFlG1uuHqYfB+ezSUvJ6uJFysKV1A9/NXM2Ct+?=
 =?us-ascii?Q?6SYQc5ZEqJp7+30/L4V3NBy7M5ot8JuMCxv4Im2rgp1c+xdqLFQlxXoS8MiH?=
 =?us-ascii?Q?4XmxFWkrwR08UX91AGbp+uXCnit49XQ66GKxw1Ryg2EgetioW8dqPLzK3A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RPVvtFRwAzj8ZDSddZHHJ3YrclqVOsoDAHbD5ZxH1igRaAUR1o9g1OqR8xLx?=
 =?us-ascii?Q?5JDrd1EBDbYpLU8zbY95VbAWEauKzvtGVEAQajdOdgoipjL+RC1VlswuT5RD?=
 =?us-ascii?Q?6N8VemnSyRxzSKkum4npDVCC1rmfC5v+xRlFAj0QHVSuN+2e1M7wfrlwYB+Y?=
 =?us-ascii?Q?7bGbVlVuv25ZIxvg6hyw0RMVPNqu+jDDqtRvhie0nrTTmZSNTvzQtKqxuEDq?=
 =?us-ascii?Q?tzc1mb1ytYdUiEKnIXXKuIDvNm/Bxooj5x/kz2MzOignQF18BmYUa88RBy8C?=
 =?us-ascii?Q?vSkKJ/vkteBU2vGRMqiRmJOtiIuP/PqE25ytf3yf1zAKb+4FCt4tNHjeFDrG?=
 =?us-ascii?Q?kAYOBI+gpPdyfEuA80BhYQ3M6ev8ndN73IX7OwrDy7RsZdMI7qbkxQV7pIuP?=
 =?us-ascii?Q?JAwnC85e23qmB4jZ96dA8Kv44Oi29rVH1di7ja0oZO/2VcCGWwmlWxDv9oyS?=
 =?us-ascii?Q?ctsbUlA0FrAmGo4SA5rqefsB3UzHVHRpiDZJbspGvsZTVYX9St5deDZLt04h?=
 =?us-ascii?Q?gnb1G5Xo+DvlVBSXpPSi+5z33gMz57MAqOQ16YpQ5UKkFCZ2kkujr65YJn+z?=
 =?us-ascii?Q?lgGjMB/YW00tuad+gSdUdUkBPWL10euW0YLDni8u/Ga4Dre5ETn4ltFaudLW?=
 =?us-ascii?Q?RCgJ9rrx2r+1iqJJHL8GsG9aV3D/DXwYvWv1j9Qh0YnrECBrHebsZx176itC?=
 =?us-ascii?Q?AeCjKpGqeZsm2nclxBNanGI/3AedFsih9qeIEJWAN52qN5947jDEHKxCAV9Z?=
 =?us-ascii?Q?CnXvSgOMq1TQLNXxRWvS7vlE50HeyJ4oaNutPVTbCKFY2YMfLimJcPvWN8AJ?=
 =?us-ascii?Q?JZ3aBYi2Ek2nPzpZGKvoGpGUlr5KyK2LXFPYr+7ASgaEco1DNCOmNMINv8Ld?=
 =?us-ascii?Q?S/b+kFe3cbcqsfpL8g6BBV+NFO5erfUnM2J006K4/xVHv7Aa6FVnP3RtB0HI?=
 =?us-ascii?Q?UQGzDqVGw/o/XJpP1aJh8unUOwKSn/5r13pMEJ72ETfSD5lCX9Y+z2YvNode?=
 =?us-ascii?Q?X0asd6CDL1AnExPfSshJVLeeQFJaGbWj7+cvO3nUu84+sssfpamz+m81aDH7?=
 =?us-ascii?Q?nYdKWGb1u7U5gmXTi+RaZCfwpLUv8nYRtO1+yVHSzEQRNnpmBEjn5k70QJQ4?=
 =?us-ascii?Q?iVnHa5mFboBI6kQvmimU3ZLFY3c1QTPZqu67z1MsNXWwPt/qdTuKSfAckQD8?=
 =?us-ascii?Q?ozxUgtu2boJmIqmR46G0V7cwk5Wj3HG0WSt67bxbjRJIl6+k8xeXhIC67DDe?=
 =?us-ascii?Q?StXcCe5Edf886IxyHNBWskJQG78nu+I3Wa0MNr4CT8qzyauOGQzrUcjnNuni?=
 =?us-ascii?Q?2NoY2ax2mu2jJ1lWl3WbSYsSrlwD1E0IJnEqmj+8rOOoil9HXEsAXpnNRtyq?=
 =?us-ascii?Q?LeLLGYTrrzoJMEADSYWjxXSCA+imn0TJKvQ/0lhVMak2PXIvoyQyXCK2tUlc?=
 =?us-ascii?Q?u2qK5m9YR4bEjFwSOLNL81f7s8J60226sVIe4MaLgte67MENs2aB4yFWkWRs?=
 =?us-ascii?Q?OuI3+bJkNsT6KYFmVARFmxw2Y3VrQ8vaaLLmKjTG1Lt3AsI1BrNOldl66xpb?=
 =?us-ascii?Q?7GAtjKhgEoTbxJ0bSHrH2ZX2tlE2MLqMeL/boMDp2N/L9xnoyG+toRjhne9z?=
 =?us-ascii?Q?9cDMr3/VnTKEURAEm+NzAG8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf67a68d-3805-4bef-221c-08dda7d65f56
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:22:12.1872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22nSftMn6AH8srxAjMrRuezRosR616uFcNTgyMTDviMbIHgBU3GRYhaxrqrmLwfYGULy23iwXFSRywXMq/BXzpXmbOnneWYHC3j6x59BifYZZE/8yQxqr0bKHijlzUve
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15231

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 2463c22e9cf6d..a7c687123b390 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for Tegra"
+
 config SND_SOC_TEGRA
 	tristate "SoC Audio for the Tegra System-on-Chip"
 	depends on (ARCH_TEGRA && TEGRA20_APB_DMA) || COMPILE_TEST
@@ -293,3 +295,5 @@ config SND_SOC_TEGRA_SGTL5000
 	  Colibri T30.
 
 endif
+
+endmenu
-- 
2.43.0

