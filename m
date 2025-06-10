Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B10BF9DA
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529173; cv=fail; b=GHhJ6/TebRZOiAn7vV0TBo7zZFP9zcqoa0qFnXKBqwFIahEko/5Oo6vh/Jmx4SS2kKrPWbe7QDgkMVVh3GO+05EpNFoAtdM3yP+bxaFlLz6P1HmF3FBzTuqYX+PJUzlNqgF9lQF8LE4URdVHqOpd1WV9WLazUEA5xbXUKvDgzvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529173; c=relaxed/simple;
	bh=mBiAzt36bO3GuaLRFZ64sb8b8OsTUIZEVU8dmKBu5WQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YNU24LY8MJPjtewxpLxWZGG4z9YoWLpCIrCEuXkVbBTq4THmVapm4BTEpqbddJs82XIX5oDup29sJgxcRFRjr6VbfeyEXll/B5dDDzDVg/SrayQJJmodKrSppM7NdqW8AVo5NnBoOOxK7HGBj2p8AE8F0IO1iVAj3HQbV46dcvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MI6Dv9+X; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MI6Dv9+X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUtVg6u4idtjBpUgFx4lbxxh6C1Q3zYgXk2Pb3LcCZHo32BTR1+yJtKFqytl8135gtN+NZS7aPy/hyggLVftKyBCFzNinSzkY27sU5rYiRtc9wWMsVvjvfT6/R4ID+1sDHhSqxc/XRgV4P3aV/PSHwVkH+s2w0e21bKlnbn0JgyxFPLMSiT2oBD2x80QFrY0nZnANLnE+3JmxPU0tAE7E+Jyg/XJB2DRwr2Jqn3eNOYtVe/hi8DkSkL7w9j65dxmG6V+8qTU7J3VpOzHBhvqblF7TA0IdyEGOGL0bTJTUGYf47fqYtF4WfT1VkUFxL4Krsp+LKKRarv4jFPIyB6hlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAStVSkVQ/5AqLXyJmQKKMkbWfIJhux+SI+LjM/ynLE=;
 b=Jxc2h+Y1lkX4eEAVa7AsipXxrhwKhdxllxTr/94GHER1GS0AJev2i+9TLS0MXGeRVYQS08KCBgYHWz8VfEGB8MyGy4F/RNpQfuNPivP/dTIxzOBnUVzY3KTAxbVkmFBW9H77OsCqP3jd6YWzPSPmc07Cup6jAoooBTp/Su4YR33HUvc8QECYUDGUDFr6W8WVJFwdThKfO6fjs05RRX4Z+uvdpOS5iChbFHKfIZd2AAnQ4Sm0OKBzwikkLN/x54t/8jikJ/k+POjDXkUUzu0QrTWMd+F8KYGfH7Ejxbpic32+4NWBXYhYFrI5AfccS0fbiDzVLyWLeNadQkuPRoUO6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAStVSkVQ/5AqLXyJmQKKMkbWfIJhux+SI+LjM/ynLE=;
 b=MI6Dv9+XP8saNhJt8lbdIakiYh+KTigdao1wIZCWSqxTh0nI0P1buMaZqACjhA3OA7HoqNcAf5T9MrLS06XPeiXykIfHTUQRwbAS+c9GnUG9cOwVzc2hqOl7YiuUYXdBNpzn582imvoKWRlzw4wdRrl2+L4A/BV+b1CnhAIhcqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10510.jpnprd01.prod.outlook.com
 (2603:1096:400:307::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:19:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:19:25 +0000
Message-ID: <87a56g8bzn.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 01/37] ASoC: ti: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:19:24 +0000
X-ClientProxiedBy: TYCPR01CA0194.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10510:EE_
X-MS-Office365-Filtering-Correlation-Id: cf321e37-be63-400c-46aa-08dda7d5fbef
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yk8EwBFXboEufs6vDy/s+XJN3LDJusWUUQkxtG1r5S0SsfANopSIj7lZ7aN9?=
 =?us-ascii?Q?p9TqQrt4y4N+CN/5kTEhRSCYto0+3XhWfnDRJ2oC2/nrCrCJvg+skhzAI86B?=
 =?us-ascii?Q?3743qXbfzuF9GGbTht/hhsKMA/4sm4J4akj2JTqWDJq+y3aMS6hWe805L3YF?=
 =?us-ascii?Q?mQ3ZrjddteoB8JBQtRBSITJ8DyEbeawKs7V9lq7lb85HtTO7+JH5EZTjGbFO?=
 =?us-ascii?Q?L2zcO++pDlwJdPB7KRVC1dO30U0qCqAAw6bGKy6hEdrpN2ri6rpEdDdBAF78?=
 =?us-ascii?Q?WnVN32uMKbXjm76oHWVhsLc0eA0axCMGyUnJL1I/FDLdovVvCm/EPW7tNtEA?=
 =?us-ascii?Q?2OqPR3cezIFQHcqo+bR3jROc3SMZXdsdaKeQeaY3HwUO17QQtXyW7bhbwPn8?=
 =?us-ascii?Q?89qalLXqxy5A4KKpgkS3ts1vd9bP1qwtLCdZ9rWXAmzWPNXoDKKYMh+fgUZH?=
 =?us-ascii?Q?YsuiDU1K24h6p1ol9vMKwEVZct1ipAHlZ+IbXHhpdCcnASXiRDTRLmcqMOIX?=
 =?us-ascii?Q?rBRebpDYv7lfwQ3uWSGqoEPwceEPBJPbuIAGgudEX5OZgJKBgr679WqYpkDB?=
 =?us-ascii?Q?U0z3OScMCqJ8ZbNES4zYOBHaWMYwUOEX2WF+FCdIvSQ+14TuqXoK9ZSqO7ir?=
 =?us-ascii?Q?bxhrnYQ3Sil5Ss0pi6beXU2mdakpRryMSP+Uxd4L0sVUuxpI1Xfm8hCRiAg7?=
 =?us-ascii?Q?vhtteMUqaZPNKW6hAIvQYaTjcHC0TP/HFXiDdknjxfv2ttwT/G//8i7Vg7le?=
 =?us-ascii?Q?Fi25kBf5goDlFUcGzLmDI6c0g5KhCuAXwbS2hJMoIgo+L+PgaMkSJb/I73de?=
 =?us-ascii?Q?T8+I2GPozUCsqpkZASQZNe4zEZpuM5gfp6PkEzeJRrvGOplw0tLW3Pxzlfuk?=
 =?us-ascii?Q?YkScWEZAoq85yALGKFz1hUBG0Qc38FfQkAKFjzIp0aafEGvFWbFOT0GlOL6e?=
 =?us-ascii?Q?bOQojHsuWTLSSVuR8VONv+i5i5V/ttL8HxR+HJh7qNFydsA6zZyTdXnV5/jq?=
 =?us-ascii?Q?TsF+VNM8kETABCS3oY7yY+c5t1EVg38sanz4nknh78aT+i2f4jZNw986qYDv?=
 =?us-ascii?Q?l1CTxlHr9diExNqYm6zppuHgL/cgKtFtkerpveDHlv7xLD9NREAziFNaHfxP?=
 =?us-ascii?Q?Qfl0/esgAbyohyzV1qiz5iaLO/bjpjJhbTLKVuKfenRmd2Xfc7+NY3jVd6va?=
 =?us-ascii?Q?R6OuJ6+EIjIyq2yWXZ+cqm7wUO6Oyruk5IXKBM7yxvux+EOyB1m+YwfFgqWZ?=
 =?us-ascii?Q?rj4fjfS0QVYNBEfbXDfAgL/p308S45q6AGtDSUnZiJVjlTwgIBRxtPXs3BqS?=
 =?us-ascii?Q?q8IPHp6xXRwQlvFdhj7Xt0GyUKiT01C1PwljF5Q/w/aEdQrs0xX9G1eVw9mJ?=
 =?us-ascii?Q?568iQ5Jkjwqo9M7d0nRYqrfpjLR65NasAX9YvZX3KnKlt7STqvNMbPRtb5BE?=
 =?us-ascii?Q?irgxmayB8Hm03zTNCttGasaAlAhWXiWf9OnOWOB/zVO6omG7f5ePJDxQoCI1?=
 =?us-ascii?Q?pjCKB+wpxUYfa6v8P/oqeN8P4wsMRppGHXEj/GuoT/3YKKGjqipr6hk1CA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8xzQjMDSUddazYUd5DUluNzSfkgSFih62GxDlB4pAxSch4eVYJhPi4+/eTFD?=
 =?us-ascii?Q?Lunpe2CRSmtv2MOC7By/X63YJT1XSUaZK1sNXa0x+W5oCBK5ElmHL9qBmqMZ?=
 =?us-ascii?Q?k+bvgWRdGmaWCc2VXkUJ1ggGkIGRE6WHUiSlTOsS7wnRlK8+W5uVSX4zP+aH?=
 =?us-ascii?Q?4tKq+BM0oycES+Z2NxCYm5rMU++o6/TlmT2l2r33uO1C4zHEiydotFfBZt7y?=
 =?us-ascii?Q?2QYZwLTjjmTNOowRmasE60Ug7bYEK7ai94yskZchbQbXiY3HG9xWj5oAP5Rr?=
 =?us-ascii?Q?ToDt2od7nQl+97bfC3mCU970lgYoH1j/IhJ/Mi8RkMd7lJGecKLxGlJPGHEi?=
 =?us-ascii?Q?DG05yCLy03CUtjRERZqkou+IM/zPER15vo0KXlNp6DnzyR3JPo7aVKHckZ+H?=
 =?us-ascii?Q?a1x9L2XA0ZZ1fRchZTNwYUzxp3sAVboobkYgLTAdQvMAVNQ4RHPDklMqv1MI?=
 =?us-ascii?Q?hF/lKQ0LebpeDwlu50QqNS8iwYaRKyisSZ4UJX98kbrDQ6BAcOYtEP3oMGVV?=
 =?us-ascii?Q?feMskNrD7cOB9Qd7FisRPHMY36fIwCrCKCo+AMFOmMvYeN6d4e28eaV++HFp?=
 =?us-ascii?Q?1B+cTUmupfCI4VfnPaFrs1FbkG4FaG6q/Se2NpUSQWcFVvNEGnPSJOKt+hrW?=
 =?us-ascii?Q?QAMLXa10vO992cjzTxoXxV9WqElomMlevUS8WL00Zf9Kqc8AXoMUf1d0952L?=
 =?us-ascii?Q?yfvsD6XB1pF7rKz2jJqoDLcchwLwSZo+qnySBw0Amk7Y3sXwtg24HQbgFnFu?=
 =?us-ascii?Q?ns42X387LAT3ETylhZp9IHcBq1iIpjCwG+mKM/rriJIikdC2kNgWwFhJIesB?=
 =?us-ascii?Q?aGQce+LavqQU1KGQhhfwlyEOGJQmo8xNceRqf1bGF8bfPTeOiOu7EtkfdwwO?=
 =?us-ascii?Q?B6wb6IG9SxPUohKkTMHGpB5W06nqXAMNyimRAKBNNNa5VbMUfmrXmk5zS57R?=
 =?us-ascii?Q?QBXE3iOTIs7Epq7p3V2ijHSjnOAn8TpDINKB45a+YKKgKIseXfvb0rvLhhcW?=
 =?us-ascii?Q?hi7WBP4tgawEGE4rwLA2Y7t40JZbf+Gw56f2puwutCbVesS7Cn3kPGXsXCTf?=
 =?us-ascii?Q?lcFBGBSXC3nhnwqRLeTmwEhtC68Dsy4LvNo3xPrn/JujHiTRSjtSzj/D09iW?=
 =?us-ascii?Q?x+SWmZ1j9vJhbWX3xrMRjABAVmmyhNH1Yus6xcHQp8mV9kzy44B0QbtIzt20?=
 =?us-ascii?Q?8G8nNo3yCYblUKrznQFtMfVpB8vkQ6XAD3QcHPhThWxe71DgxlFava4o3BVE?=
 =?us-ascii?Q?yb/F+Xh7G6q9Ys3dS3Ygj80w9ynjC2IY5PE+7OwgR0j7GLCoMMo8nq+JFvrN?=
 =?us-ascii?Q?OEBsZo/ARPiqhVoMRa+WXuSyX4Z0MPRdDQ03gy/HhPj0rUNWtbY9pvxqnHWc?=
 =?us-ascii?Q?XHcNaDcTsn7eKp/n+yi8Li2MDS7g96R0xEkLfjZQ2/UO82sYfqcirsTKLwZd?=
 =?us-ascii?Q?tYMhUyAhpFah2lSN9RZ6fh/XmEYpclm+nkJHTdp0v0NgcuHe9oI0PpYhtgJb?=
 =?us-ascii?Q?EYFNGlYzuMWhU7SzG3GPy7Cg1rxPnMIE84Uqik1I1efdP6Ak3PwyXdMHSUAu?=
 =?us-ascii?Q?jkMaISgMLYTcSLFi7OoY83NdHOaZXxLqy8wI05T98mUlSutMchQcXvXU3UFf?=
 =?us-ascii?Q?nSFbuaviS0+iPecv3zoD2CY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf321e37-be63-400c-46aa-08dda7d5fbef
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:19:25.4575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8P/E0MWnx2/V+pPPiUO1W0+mbPDNMQZbJzobh4gqADurLcn0H9WZ2Kp4XMxT2wzvhZel5kg6xIOl7CUNSoWF9fWR0BO8CppIl05/HvBZZS92hpru90QOY/N/RuK8TqJ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10510

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index e22e41af32269..f9c292cb7428f 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menu "Audio support for Texas Instruments SoCs"
+menu "ASoC support for Texas Instruments"
 depends on DMA_OMAP || TI_EDMA || TI_K3_UDMA || COMPILE_TEST
 
 config SND_SOC_TI_EDMA_PCM
-- 
2.43.0

