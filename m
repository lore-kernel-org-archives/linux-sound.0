Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011015.outbound.protection.outlook.com [40.107.74.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAF8301486
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762351; cv=fail; b=fkH3poJtqgiTPsRWsbvyDdqw5do2KRn9VFm20d0EB1CyGvpc2YsvbkfSLXt4ZyyqwAqvYc3UD2iShcCKItTGadX9Xj+B8ohWLCMAlMAJI42L8LbFKIysJAqmeXBbP0mOxyFuNI3MQh5L+oXt2LBlqXFlFYB/K2nQaWzwSRhDgFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762351; c=relaxed/simple;
	bh=ojERFawVfIa73KFlrxZux9zWaqrweZkicsBVIps+FqQ=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JLyyQV36K32whZtroDI/yv8gYeP7llc9v4WS2XuyEf7BIrhUTOnIvJjdmhakS2cPlYlZlHWESVkMDzK4uU6hCQonT0H36zzTEqsShhbqFAWruYJ72uPV//LAeOW2s6qyXkwPWi5fagAsRXsKio46c0izIyNfrAX9Wbiu6tFUaHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SNvLpIfd; arc=fail smtp.client-ip=40.107.74.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SNvLpIfd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhumTLWrA8b33CTekMwxq5vVB4gDyp1sv3sZzc9U7DmuKpp2vAbO10uglQlF15LhSffZj1fD4lMcxJlV+NLgOldDy37oRlfQP9Q+PexBEThXxUflYwI0PIqLGApC1sXrJBCgHy6RreRWZF8xD/mdZETUFEDnSSt/ci7nV4UAJ5LS5B4WSZ2RNLHn9Jo+EB7vqL0VCWQKHtrsAO21TIR2/KeOaSSBxGDh+6EsZB0qippNofvyWBcGCHDSuxJsbfWJl+jZxHZwyC0NlUDb2oKUh+SYYhaxvrKEM09plog3s0hmlaGp62qHhOhA7ayS44Ah9PNMw0/6/JpmQI75GftOMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4whYrw0X+/wfhEPo6YNcKNAzoGeUj/O272e3MghsJ/M=;
 b=hLmyhswPVMHox7uee49e25/cOfmO9Zn3lmbYNoMCULvIVHCpvNYcwt3V6lrjpUVkzwbDfebpdfxSxkM6gdvB5YhyOpXkrUeex7shYbwHndE1yS/KyMJ3sqm5NhmaJb6M2BPkrCpT9XCXl8I9Tk66PRTRzEF9ZPEmTTOtS8COZ2Dc0ruNmRKzhhCXbWwLv0+MFNUnXkfzOmeDVV51FVv1wInD2Ip4rLpf38E6bkt6yfBjSdPaapfTOICTyuLUNo/PlmbLEjDW3MW5Sv5hIzDfqoe4UUrPd8Odf476GpivPJFdsmh5DvETuxxQOZ5V8ZC7TmdmRC5N49W8SqqTUrP7oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4whYrw0X+/wfhEPo6YNcKNAzoGeUj/O272e3MghsJ/M=;
 b=SNvLpIfdf2KFt2FIpNxuOHEbzFt6+vUmkmtLQtzwC6SYB+ebh3EfNWP61WcRVGsOh9F07WZQdhVNYl/Gp7pCgt7cYGyMIiEgIYKUvJM3yXIXV0i2iHelJE2MZaZrWynj19OIvJi4reeU+8njcqZ9DL9NYQ1KQFELU5jenqIZCCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10158.jpnprd01.prod.outlook.com (2603:1096:400:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:25:44 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:25:44 +0000
Message-ID: <87a4tmgb4p.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Alvin_=A9ipraga=22?= <alsi@bang-olufsen.dk>,
 "J.M.B. Downing" <jonathan.downing@nautel.com>, =?ISO-8859-2?Q?=22Martin_?=
 =?ISO-8859-2?Q?Povi=B9er=22?= <povik+lin@cutebit.org>,
 =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>, =?ISO-8859-1?Q?=22?=
 =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Baojun Xu <baojun.xu@ti.com>, Bartosz
 Golaszewski <brgl@kernel.org>, Ben Bright <ben.bright@cirrus.com>, Benson
 Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Binbin
 Zhou <zhoubinbin@loongson.cn>, Bram Vlerick
 <bram.vlerick@openpixelsystems.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Chen-Yu Tsai <wens@kernel.org>, Cheng-Yi
 Chiang <cychiang@chromium.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Mack
 <daniel@zonque.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Rhodes <david.rhodes@cirrus.com>, Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Frank Li
 <Frank.Li@nxp.com>, Fred Treven <fred.treven@cirrus.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck
 <groeck@chromium.org>, Guoqing Jiang <guoqing.jiang@canonical.com>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, HariKrishna Sagala
 <hariconscious@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Herve Codina
 <herve.codina@bootlin.com>, Hsieh Hung-En <hungen3108@gmail.com>, James
 Ogletree <jogletre@opensource.cirrus.com>, Jarkko Nikula
 <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jihed Chaibi <jihed.chaibi.dev@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Kevin Cernekee <cernekee@chromium.org>, Kevin
 Hilman <khilman@baylibre.com>, Kevin Lu <kevin-lu@ti.com>, Kirill
 Marinushkin <k.marinushkin@gmail.com>, Kiseok Jo
 <kiseok.jo@irondevice.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kunihiko
 Hayashi <hayashi.kunihiko@socionext.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, M R Swami Reddy <mr.swami.reddy@ti.com>, Mark
 Brown <broonie@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Oder
 Chiou <oder_chiou@realtek.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Paul Cercueil <paul@crapouillou.net>, Peter
 Rosin <peda@lysator.liu.se>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Qianfeng Rong <rongqianfeng@vivo.com>, Ray
 Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Samuel Holland
 <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>, Scott Branden
 <sbranden@broadcom.com>, Sen Wang <sen@ti.com>, Sharique Mohammad
 <sharq0406@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Steven Eckhoff
 <steven.eckhoff.opensource@gmail.com>, Support Opensource
 <support.opensource@diasemi.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
 <thierry.reding@kernel.org>, Tim Bird <tim.bird@sony.com>, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Vishwas A Deshpande
 <vishwas.a.deshpande@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Yixun Lan <dlan@kernel.org>, Zhang Yi
 <zhangyi@everest-semi.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 69/83] ASoC: meson: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:25:43 +0000
X-ClientProxiedBy: TYCP286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: ea9265d5-d075-48d5-df63-08debace169f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|22082099003|18002099003|56012099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	+u664Y/l3u+ktCtEIprz7oLqndD2In8Hhk7wJiiBPynec4FYk8gh4WA30+y7+2hUQUT/DsKcR7qblUnIp+x9YdQiWQtYcss9rXaVjtkfpB5ImZt0t3OiK4KLiDS/nuu0MMi3r/qlB0hxx41UYPvmu1FJ/KI3QFW7rZ8QvaOrM/u3TDpHQ0OXnIxsgR9UdxPNlTM1ITP+2VYki+dN3WY9HnrjUXelX62yUP0i0un8vssrCbKbjGkKYd2cJONhFGiYqPiJb0lrddIHeI3QYlmdDcxHBksc5RzzP5R9+DEX3OS9UzN8BcwW1iEv5vIR6rB2JwBSgednuJd8BKU8b9x6U3sRAQpj8ocXz9f5YTznGY3FNETfCKEDMGYIbXiypfRXtDTINPXTxv4Q5lYtHTyrhDyBRQiFiub30sVaR0tC0ACAk1du+Hts7uStACHxqZnYfb187k3EQ5nx1dmz4QnHx2LaGAk6X1yOHBdM5dvMSASYWQaTADnoj5Jo5QUgLinGjU0bzBobFZhDBimIgrUcYnbJTvdCBaVJ4SrgacW+1uIAlfJX45oQ3KRI3SNBSrO0cObkMPcJ6PPeUKALb6RH1+VUP69QxzenaeONOXgG8SL7KlXW+pKpC/iycr4eZQBrU3/xO7p74hi2hpMUSF13fO8uD2jlffatCIqALSN2iC0tc3fnB+CMhsfv3+0gkrehfsw6oar0qq7OVL0grWaY3f2mE/5uI113mQEf91F3tlqflG5A4Zz6EVkIF5qX+T+uP53L4KCQjYUsJTW9ycr5x+2bPkZMKbHFQrBuisbaBv0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZHMt7OpR7T8u1bCa83eNMwpQ/I8oVTC2eUjwiypn2ytVTN11zBFoLPNHHBL9?=
 =?us-ascii?Q?YM6L4kZhYbN90x+bm5wL9BSezqxMlMccxDHURW8zsEcVkJkiJgDtKAo3hsEL?=
 =?us-ascii?Q?2B8fuM6tD816ufC4yRW0zlI0m8R+0OMKygroMW9xc+BEUOaPv9CY0QmNdwjZ?=
 =?us-ascii?Q?bi4kyAzhaVpmGoUMrONkk7AVYXtE55306lhf5gySQJ8YTWkEsyGwMJrta2oU?=
 =?us-ascii?Q?+hi76a4CFIniCRmoRPAUoubGek8vGoIZ/JLlvtjOcN2vmskwpHN/0WYqEJ5F?=
 =?us-ascii?Q?DOSyc8pmLLkRJO+rvXxXT/RTrMAh9QfT0swPQNj1t0gd4748UPSfmop/lo6N?=
 =?us-ascii?Q?AG+bX4dP8HavskWr9AwshM1/ve1fpdA5HfqrhwXaO8tQhEcA7e7AJ0LXGiWm?=
 =?us-ascii?Q?M2oPu8Z9kHmMjeHx6eK5k7Z3P9cw/dCTrp4ndny+jAS2h6TUGO7KxlHNksSg?=
 =?us-ascii?Q?oZvUNKzrGAg5LxMbr+rGrw+1PL1bRp5AEobibtYDQLk4jHEbayisZ6tInySH?=
 =?us-ascii?Q?GIA/iU6IRF0ap82FzlsG6Q6VqR5OSsIJxskFG544d4c4krgK5D6cmmuI+i0h?=
 =?us-ascii?Q?V+YUTZZBVdZFqIS/pl7wbJ6hV03eENPeLRrhSZayEQDkwRzvxLVXLUopTzvQ?=
 =?us-ascii?Q?GKzPChl63dEGJWPGWV9Jv/2/2unLOERUXfFwemDUJv6cVlnPdWVBWvb1o3WQ?=
 =?us-ascii?Q?sJ9H9J0KuyM92HXtRC2NkKEwLwJuGuvo6tq01DGl/U6keRIey39k0beYyIed?=
 =?us-ascii?Q?0F2A5iax5RHWrnxfCn/uBAJUFwV6DjN9NhtC4UqEBClFrNhNGGMyFf7kWvXT?=
 =?us-ascii?Q?TtivBrXoVSR3xR0J93RTyCRPM9f23rRAU0/QkLvcoda0xjHESvaaNE18Jccm?=
 =?us-ascii?Q?sA9tJrNSzooAF8R+DAZnFz6TA0CGqr1I12CQ2iQ08O5uZ+wlZPa9P1nbycDg?=
 =?us-ascii?Q?8DmRkZ8AQlLEzRYAhXzsUZxaau2bFeuVFXxR2nLay7ufDV2tuA8DHJG+cyoy?=
 =?us-ascii?Q?xUqBZm03EyKlbinhWM6Tz46l/QxhOaqLA5iabokGUXowY+raIxMkIDyardSB?=
 =?us-ascii?Q?XDJ+MowwrWOazFxZEh0FidkI1jihY64kfLBppXFx5EA+YUTF0EgwlHx5ZRpi?=
 =?us-ascii?Q?d4ZZYWZklU6AApJi98TYx+pRH3cYAa+hCQctNGE4YL2pdq5LcoCTDw7ewEdx?=
 =?us-ascii?Q?EzvoIcYws2BziXVuqCTPByyW98ajlMmjuGFs1PT5iqe2QtQX82eseYdo97oW?=
 =?us-ascii?Q?H7GwB/SW6G//R4GvxEZTCp5OnkWhs4rWB7Zsl0GI3E/TLjH1t7dY2EI2DVsB?=
 =?us-ascii?Q?DbMYio6PhZiYOj+qkLqp59Acc+5YjKfBWLPUsNlwgS+oHMWhqJYROekge1jw?=
 =?us-ascii?Q?nkCz8eAcdLkIX5y0f7TLBcjl17saCzUyQoGDqBTfg95gFF6l6UuiozvTB0Ys?=
 =?us-ascii?Q?oWRE9njoglwmuzLhNzQbNop8koR4Jrukqh1JaD7IekYOHu40C/h2DunjZijD?=
 =?us-ascii?Q?fiaRmaYeIJuFgS58wLcuerGZ8cX7gpUJnCoMMrFuex2++dlnN5wbjvi+Ithl?=
 =?us-ascii?Q?FXZ9CnQpnEwlaSjeS6P153ADR8rA40sby+aByjjFbjgpackLW9NeXLCZk4f0?=
 =?us-ascii?Q?ySUjvlsxYSBYhHh+0Y3nQZgu9ok63sAD5Cg2iixD7v+JoBMhf/iVf2V7Zz7R?=
 =?us-ascii?Q?rmOXPSt4smPEgl1jmbKE4qjnCWHnGK+WCUk+WeKVYwMMxRB+9KoABDKkKHni?=
 =?us-ascii?Q?O89v5slgxI7XIJCLQkNQTwu9h59TungFkgE8O0kTpg8NyANMtaXn?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9265d5-d075-48d5-df63-08debace169f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:25:44.0074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lxF/Y56LQXGiXxzx4yYswxcbDYqi4Yi5bgwhjugjZw31P6r0ThqIMf3iN42c56vn0tiGYmQPwCNVTRrNMzT4G1ejEYDJd9Y84Bpz+J/FKJOQzOODgv0BAl4DiMk1GGDN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/t9015.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index da1a93946d679..085f771eb244f 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -78,8 +78,14 @@ static int t9015_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 t9015_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops t9015_dai_ops = {
 	.set_fmt = t9015_dai_set_fmt,
+	.auto_selectable_formats = &t9015_dai_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver t9015_dai = {
-- 
2.43.0

