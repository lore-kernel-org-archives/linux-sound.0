Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011006.outbound.protection.outlook.com [40.107.74.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CEE25DB0B
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529299; cv=fail; b=ffjYW2O6ubPq/4PiyN/tX96NMhDcTVpQwj7hQZxNgb3fhq8KWQubCTHtG4bsHy41tuzuUmRG4TYxy4CQ5bDuNeV3Pi6pugMewLJu16mU7UbpG/Ccu2n89kw835x/C3lgmYzCSF1C9cG8J/5wnywx8kHjg1ZtUVKCa5W+hyEV6NM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529299; c=relaxed/simple;
	bh=B85uzXTq80LnU6FWybtbQiBKzi6Hf0TftxjK9ik2PY8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uhFgeVYVY2mLQHkTkbDwSuZfuoFPSf3z9Zocv8NsjJH4nXXN9facKdEeRsiYHu/ccaY1BasOwGx1l696wX8cE9Z0Oqr2GCIb6/nwo6h/z+wyHj4ONqYxO018QPn4SVU/Hl4NVil8q44Jw7CBgfuIzMk9Qv9ciAQQ89HAu1AKzrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P+CHywSw; arc=fail smtp.client-ip=40.107.74.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P+CHywSw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmEAy3E6qjq9g1PGG3aWL7ig9awVKQTrerH4w5AY/UXljT1PDoImd+y/rTdFlzbMps7n9jg6t0aPamy1sGeM79ZULuuj7kI6EdzVZ0o477g2WfqDjOYk7+hrvqdYl6VVyI7foCjv5+l60rKyYpEVB+ABzR5AtESaUFqhWzwXRTzYjidhb3rOed8XYa1tbaad0c1RlDlKNBmvUPUZkma+piFCjHdiav55aCRCWeCGM1+1bSy2Re8vdeSOpot7FyBh6DhDQBgyWyvvX0ES5ydRBHnUUnpwy9yfxo2VJK3uDQE/yLrwyAv1ZH9cjKVDxhNRCrSsAuDrX3kWw46GuEm97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44aKtVWaum8prE15vAcyimrXZaHoGe5Ht/+GuYRDpDc=;
 b=lRGbC7LaRuTGEJTaMAO6hJC/QwKnClT1g0/3sD1u3Ek+WDlaegT2Qav3vs99Lq+xZxe9KYFGMHhPV7mLPhXJuJi9U3rP9hDsf8DgC1BywlpAZbqwRVCZumeVP6TETZ3FL/N0cAPyQHqSIj85I5VzqPzL19zaXYn9Eoycpl7OZ/BxRt9oZByBAiyo3GAMNGYUxro5ZkKTwowYtudw8vT9vGLaYz8sN9rsR+n7OhdtMuKye/q8TOxrx6vVl7yfMTmjjuomU0BhTCCAvrK5ygiZpOtCnh7xlaTKcZVaUIBkP8WSnKFXAyzpTKXYGEOj2TslGcWm43a9EGnzmpZXr9LkYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44aKtVWaum8prE15vAcyimrXZaHoGe5Ht/+GuYRDpDc=;
 b=P+CHywSwNtLxIhgquSacy1O+3b4K+YtC+O3GZMiW1vLgeJdWR5OrR/H8sAnMPBruMgW60LU65Koiz4SBjtF/t4fgCigc0SG4ggrnQ/IPe9iSEj3hxGrVzdu2ZvFYwgiqDYXqcmukRknTYmgkKOVexHRKNKD8gQVYF24xEV3hbMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15231.jpnprd01.prod.outlook.com
 (2603:1096:604:3b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 04:21:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:21:35 +0000
Message-ID: <87plfc6xbl.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 15/37] ASoC: sprd: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:21:35 +0000
X-ClientProxiedBy: TYAPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15231:EE_
X-MS-Office365-Filtering-Correlation-Id: 39230110-dd26-4652-999e-08dda7d6498c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z4MJFa6Di2TFiol/i7SO/mPMOyvirLBbr6H6+MYKHUdSlezT2enTebG8LUpb?=
 =?us-ascii?Q?8urlYyJ1vDu4ZBNN7hLjb4lX42/OeVh/6LXR27YHoRBhn4cP3YR8+pt4y++v?=
 =?us-ascii?Q?snNDgnYZ5yDLBiRnOB8COOy76l/XJVPtNKFxC5qZJ8027HuLRAsrX1RTuh5M?=
 =?us-ascii?Q?QXsfQpvGvqFnfOBGoTuJtHlh+lGU9szsNO7bSn7/m51pF4TRKgozcoV2f0vC?=
 =?us-ascii?Q?KHrjNmeUDBG0ZKq4o8wYnygfnSUJoeJWZ5AwTThq73JedaIS/WNGkU+t2MXa?=
 =?us-ascii?Q?qM6zKd0CCuZ7zJPUD3OacEtj9mqyuSh2zMGNED5xg0fnfsDmFW5H2sHP6mlB?=
 =?us-ascii?Q?PnzMCkMl2qE96SNMKrlCYrww6/KIUsNtIQpvu72M7pMWnm58Et/OCjq1wBsO?=
 =?us-ascii?Q?keV9DB+bI8VAfzD57evsLZ6k25DCR2WZBh0LfcldSzD6BhUH5IxSM5pJsTve?=
 =?us-ascii?Q?LNPcF511qKTJaRoIDi2UvVYYRAn2kHEhDCBcFDmSjkadXdjJ3hCzsEq6qm+v?=
 =?us-ascii?Q?NdclFuKSkwyVE1rq4x/uuhA5Y5+HWNwpvLVYJuWB70/I9fK9WcIF3QezYzmY?=
 =?us-ascii?Q?Ur489RwfJuKQ978id8TNujYCmrntOS+uoVuJqlaQiuVs6ynhppDH9ofKpjak?=
 =?us-ascii?Q?ihKr4p/I+wmQDy3NHjzqgA15MjVXaLm0ukhqymSnJKYFzNSLTdoRQSJpRXOF?=
 =?us-ascii?Q?3gbYRbBsE9LuhvcectndBjSpUYa3uqvkkzY+BzM2hufRohTfCyrpwN9fpk6r?=
 =?us-ascii?Q?wq3Qkhekr6lbf4gT20N1OiiO4D7HT5B7fYDD6dHFHgOcxQZmjyuFMS+VOpL/?=
 =?us-ascii?Q?FZnhcgy7o7MLj6csheLXts8aLSDRIrwjZwMSz3jphCtFSmQb4u7Z3SjO8tx+?=
 =?us-ascii?Q?dgz8w2w1L5Y2diTJfbGXEbG3hDX3am/KJjDuDcO3QyXWb7riLvDXAtC78Ghn?=
 =?us-ascii?Q?su3M470xP8ckoPsGa3XnWedI8dK6cnnJKUjQ24kMBoxWa6TTXj2wg7fOm1xf?=
 =?us-ascii?Q?daBFcj8w5rKe76LCAZyy+ZRFm2lE4ltyjhayrI6nNT1vyOKPlB6SIBQ1INCq?=
 =?us-ascii?Q?cd9RwOlM0FNWYJtMLlB9kFiw/EaEbtS2HLYLjy89TUokh7ZkSYGpwxX7eRsK?=
 =?us-ascii?Q?y53kt0cwKT4ND8BvsxTlQS+WW573WEarua7afNX0Vq4iQbFA+wnqfQLXOQuT?=
 =?us-ascii?Q?7kW20P+8HO15NkbaPNnbSZ2Rexu5WxNOGbGXdIGTUdLXZOABQmXTvKiO5bWk?=
 =?us-ascii?Q?5uHuRsZFwvtVrTIXeeoEt3VlcJ7E4IHilX4TXAyMTx21QF6AnvfTme6xEKFJ?=
 =?us-ascii?Q?71ka6EF+RhpPAskmJtWZDhF7rR8zUl9XoFfz/8EkHZAV6C2oGNilTimdKfpW?=
 =?us-ascii?Q?S4207kMWRpoQJ2FVgUS29wxDKKeBCvNO9eKR7BqRb9VKQaLLTA+uh42kBftd?=
 =?us-ascii?Q?1m3c99zJXdM9OVQSpJISRiRezs0B9OMpspKb+dOGu3+tNBRzZVfaitqwwldl?=
 =?us-ascii?Q?gnVs/pcW9tKQNNBpSXnO2tRe1D0yO2Tf2vMjddRpS1jlhkbj6WRceUp7Ig?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Zm3Bzu2UULCXPUE3/vmFWMZoqreGPLCozU+nk8z22IP7s/wZHSG0dXZQV7S?=
 =?us-ascii?Q?AZYAnYTGqfW2HMNQC0ETUzUItD7M+lzjndcz/Yi1yA+u9ZlteAh+UBe4reuA?=
 =?us-ascii?Q?5VRcyqaI7+B/zTTJgj6xuOZg8xST9a930gw+NmiQC+Lxab0OwwrUo1BREzk3?=
 =?us-ascii?Q?4lLSa099Sj0633qXX4scf2NCshwxkBVA6HOvSI9+toTApTr0yCtjPfG0L7/Y?=
 =?us-ascii?Q?IVGgGFpCZUAAtc8LPj26v2GxkPfkDvRBWh2V1CCvmwjxhSRyv6X5/Weh8gIT?=
 =?us-ascii?Q?m5HinXGrA+A1bkCVSRaDwLETdz0Xp8G5H7DNx+CiDH17UNL8RFweBTKdHfoM?=
 =?us-ascii?Q?hO04UGLL+OgTtuCG2J64B6HN1BzW7bUgFJQFIsB33VK9zpFwEIH8AllhrBy6?=
 =?us-ascii?Q?IsbeV6hLZbuNQS075irFQ5rNzbCXfrZlKVZFJpl0rfw8rt+zk5+awcFQrrpm?=
 =?us-ascii?Q?ZhSN1S1+hENplrXICh1M0j41W6kXLn9gY8t9PKi14QSMqmGyrV7JDeWFCzrX?=
 =?us-ascii?Q?lOuS7ixZgTNQsLQe0daqgIsyHHIMJcgkq+pD5Fp9Uzh55sMI7OdmAGYxOUt/?=
 =?us-ascii?Q?5QCaHNxm7strEz8xTrPURJ3HE4ndy0SnZmHHyRyfhTu50sDKB/4lNinqkMp0?=
 =?us-ascii?Q?S+wvWnkOmkdldeW4FD5cQpCfczmX9VAUDp75F8JNxBRwLkgb1srIsKEk+GLh?=
 =?us-ascii?Q?50mgJvjWlud4vp7a1Xr83/ktMPBOayhEjKNRhXyLEreraiE6IgY8WEbgqh8/?=
 =?us-ascii?Q?kvDX3P8WGKpFhau5+NtmXhvu3UXDRzymVu1oEchc73KuM6re9Dsg42s+o7Ta?=
 =?us-ascii?Q?lM2fK6xXT3ezgCcWcdtnbPhujc2ArTyrGkYEWU5pvSLpMCNQ8HnzxZAxb3xd?=
 =?us-ascii?Q?QaOJwcU97L/4Sr2bFacy0EJMKpM9lXxjrldY4uKtIyuSO/JVsLHGmC7Mbgvd?=
 =?us-ascii?Q?spObNUQqdDsOL6LdgtF/mnSR5EfIWgwW+awkjhNYqwY9W9Hn1497PPFrKhcy?=
 =?us-ascii?Q?CE01QkaNC4dOF/Fly9cYzFpVj8taVyvv74fD4U23OzfMi2dWAFnlI3pTYnIz?=
 =?us-ascii?Q?FNhhDKnV47jyw18xpWeE06/3b62wY2xbAtmiYfcbLjkEovD58SkG52Kdxfmg?=
 =?us-ascii?Q?85fKQWE2kciSL6plUrvVeOOkAHxIoCKizvL1Guyqt+VmL0F+VN4hc3GqiUav?=
 =?us-ascii?Q?CJ5hCS+CNL+hYRCf/sI+PXeOJalkKgkr+OmMr0vaxYAGYeKy1BX9nS9nbaTD?=
 =?us-ascii?Q?5HykWU2jUmUFe6GE0WKSfpsRLAeqQJ0Mdq92doxGjYHtkqsDbb/ECYZGanlI?=
 =?us-ascii?Q?8IsWU78SrDBMwMuYydIHqDIO4st24N9VOTQ/5A4Vq7ZzX3m35JEuefDM1uLb?=
 =?us-ascii?Q?d4TON8DcJ9m3zi9V/fMFntM2ZyNjgd5rJWMJQN5JJHFOQsNB0j/xFwQHB5TK?=
 =?us-ascii?Q?cRKOarsINrvYymmd8FfevO4JzSmczXMUmaH+e77lphyAa0ksw62zGS5m5WCg?=
 =?us-ascii?Q?Uahpsq6ljIahH8tIbZQ8/CEeGrflKYwSmT3I9KBk1Arx6YyZ7uBdtym2+cqD?=
 =?us-ascii?Q?Fob2iGuFaUN5+AN2j5KL3D8JibGR8Nz8D674K10u7360kbqLz4vg7xlYhhuo?=
 =?us-ascii?Q?Ce7xmgI3IvDYuKyF5RiyiNs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39230110-dd26-4652-999e-08dda7d6498c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:21:35.6545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXAfCvdRXUjm9aVdnY4JuWCwUEor/fudk5FpgDYHav61MmJ19IVNSR9xqy0Hl5Qbo5XWUunxQGyZRz2qo1rr8HIqVqfQajhveMfXJo7UlS+R3Qv6FmS2r2cg5oPJdmK2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15231

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sprd/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sprd/Kconfig b/sound/soc/sprd/Kconfig
index 5e0ac82785721..acefcad85a1a2 100644
--- a/sound/soc/sprd/Kconfig
+++ b/sound/soc/sprd/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for Spreadtrum"
+
 config SND_SOC_SPRD
 	tristate "SoC Audio for the Spreadtrum SoC chips"
 	depends on ARCH_SPRD || COMPILE_TEST
@@ -14,3 +16,5 @@ config SND_SOC_SPRD_MCDT
 	  Say y here to enable multi-channel data transfer support. It
 	  is used for sound stream transmission between audio subsystem
 	  and other AP/CP subsystem.
+
+endmenu
-- 
2.43.0

