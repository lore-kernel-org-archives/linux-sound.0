Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010054.outbound.protection.outlook.com [52.101.229.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75C92F360A
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762013; cv=fail; b=Vs0hTIWGXbZiK6V0ju4Iy0mVjbCaC3LY7alTP8ScuYLH7K7klGI4rGwcP62++OYHZDyWiwjOc4ZPuZmCyaMYkw3r6IDdv34OqbfO8tY6klHsJSzB/kLKvbjEOJHJaZOhfgtxvTz2VdhORBSAkXVZI6qfU4Xe91lOHNq7Tshrs+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762013; c=relaxed/simple;
	bh=bVpsJ/Y/3lDGfv8lcZcmJddJkegMZPXWN7lkrmbTkSs=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uLcZ4BBzlMRpwd3h3uaR7PN9/jfjOVNBr8PmzJg2Fo2bJPzFLvWmab6yurhfH/y0MCauyzyGYdUQfoq5b+nr0pnF/osCQy7ohkVyeW0v/q89OPtnGUzelgXdPkSxIF4RtcYhmVuwBHCpzfSNHns1GuE0tDWEKeV6W/L2VOMY56c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UYAi3W4+; arc=fail smtp.client-ip=52.101.229.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UYAi3W4+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aL79IsudFRUwPmk0I9lxDfTLvyyWNHUTYL6peLRfNIrRC14Z8yqydlTa2P7F9MdGq3kYToOZLr9aDSq5cPYD6jIixEq3EULuchCuafjZ4+BeRds8pqXb1UDkhCs0yIB7St48Frupb4s6p6zojw8uLLVvlWE4WhRWYpMm3SsOJbXMbaVdiL9FijJWNEaVm0WhCM9fkkAUPHqNus8aznGid+Zoj4ps44dpjbDDZCLC2j8Lv+XR3oLhHBoU13/ZX2gbeTwi4f/0gshMIu793ADzwtmEwCNe35JD24N9jWYwfFn6eUdto7dfavvdZOUKQfl2vwrv6bN64V4KcM5NxXoriQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wu5YkdRqLO2FHbD8cY2YqhqNJZq4jGwDpyVtJiYnEhg=;
 b=kYAKNunLZ+BfdpGsoIQLxffzypT6ORwDKpyDZQFUnT/goJG5ZTLPVHNSiS1zrLJb8cnryNdvyBzjaNpOlbsrm11Ne2OMyQJvwlzk9cjk9zlM+ERMen7njtxsDsz+VVIeEn92GU3IIZrQJAMLEzPvDRQKRZRgVAkoS57zZMULS402KoZmP+vXfUrwpv/gRt3kxJPTN4AFZggjQlnLxv4RBqh7Sm7imJwZCSnD+5SJMJ1Jd1vWqcbgLdmuDWnA5SeBZmWm4hH+t/HvFWRZb5muQHoCPC8iLquKq+AOiRIVr9HaZnpHRJWRayD8BW9CMSX6uaC660ovr8Ygu/Una5L+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wu5YkdRqLO2FHbD8cY2YqhqNJZq4jGwDpyVtJiYnEhg=;
 b=UYAi3W4+V5fMSpJlwxJbF+A48DeGc79orsa1an7NrOCMEoO9LN1qs46weiIJb+e2vyIeaTUZFxqfMd+z9fedRbTydD6UhA4vieynWTwv+TMdD/EoJwuG9uri+mF5Z0nX7jwB9gtZVjT43kKjqcMx5+26W4CaPPeJ8+IPyZA1jz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11843.jpnprd01.prod.outlook.com (2603:1096:400:40a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:20:08 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:20:08 +0000
Message-ID: <878q96hpyg.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 45/83] ASoC: codecs: rtq912*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:20:07 +0000
X-ClientProxiedBy: TYCPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:1::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11843:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c447941-eae5-400e-d003-08debacd4eb3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|56012099003|22082099003|18002099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	a4HqfowKqk7gEIUmwLy8xqFtLTB/xEaeK9z0q9sZOC+wm3n+shKE/WcXe0Ddd5jPtx2F6aGj1E8zauK/VQAMRpIw1GOzd5Ucz2r4TNAR7a23iqtd6zL6U+8dyanoYT4TzrilVQJtacpzEMWodZyg7gbs8ZwYgFFgoe7TzQ5wkdbb5Jgtx/dAHx9FuwuuGU1pO58guaTWaystTQ19ws+6E7Edu3cRWcQFSAGuES1jjNkBz4qSvxYynTWbJ1LovublyzF3NGGkLLinRe0uQNLn6AHhyA0AGuJY9fp1NxRqm1qKq4FVSvU5JHj7La5RVbx6pdjP+yF9oPi//v0cDohNyeg25skYv4RCGUVOudFFd70DPEFAJsZY9FmvOL5OBYsDXymu3jYQB1neesydHBKKUKdpUhUAMZo/hpVXtvk89/7wI0XzFjj7y0lpwEbJJleRkgfWTw7RIu0AipVHZy38aB8Joc5UJel3U4odVURnHqPiYvR8LXS4gmVRkeWeyRzaRx4o9sA/uqO/TSU7iAXgJlZ3b1yITIHDQcIoVf2A17gxiU30CISh9OVx6f47m4IGDdbZSWO3EBETdvlAml/cQtbA6caqnj8Di7lTRDdFIpbTotinC3kIl73cczBG5e9rF8+mtdA+2FCmELMqTIdDGDWKKbWfazZKGfKmJdXvgAe5g1tmms2Datdwu6Hu3tgM40UvFz1EJXAfC9WDsB8zdAlmdLYpQdw2moIfC2N/N9M44gi9UMjRZRm4q682XQtTmUM4OpVXtffc+J3e9JCW3Cu7rwwiDzXRktMKtyDqhy4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kDTjWaaA/4h1fGarr5VSxP6EinEWtlm4j9D8CQylLoDj7A363KWiExIi4sZW?=
 =?us-ascii?Q?up6+gS+RwKwNVdD8J61mDUM6oqUxjcUdjIO96K5rTzigW/gLzYbp2WjcXqKc?=
 =?us-ascii?Q?TiOyKfO+aBjnDXwf7HhMB92q/V/6EebFDtFnGHEMEcB6JizQvIhQEb2jJjUk?=
 =?us-ascii?Q?UosVfhd60V/QnVyabaoQMOag+VigUF8FpvpfSd2wW3lTBgS4VAJ4RgnLnzhH?=
 =?us-ascii?Q?yxJTv0ZxJdTEPp3kKTNNkVNXEnmy3eq7XoD0xu5zCp0t6vlDTNQuaHolIXjs?=
 =?us-ascii?Q?IzMbULJCF5NlwoAMCDqrPMEqvu7ZUERRQfYJhMSeE38asGVJYOs+5wY0hSa5?=
 =?us-ascii?Q?iHx3fwim6ipbKWbbifjyiXTESxP8QkNMkgEq/poQyswxXvm7Uyg56tUPgaKn?=
 =?us-ascii?Q?tLvHLX/tjmX1Eszfb8fmTtjr2EpVYYXaBWFBtXCC7C9pdZ6DU2V9hU9AszqJ?=
 =?us-ascii?Q?Hi3KmTG9VVbPVD7YuBNo9L+4eD7nAkTNgAHwivT9BhRocLKWtt1uFvt34yEA?=
 =?us-ascii?Q?F/B4hkfjnTO8FvWnamaFcJ7Fbrcj6aH+7RV98fIZR8Mxfz8BJK1Nymoibpe1?=
 =?us-ascii?Q?FrVQLwthBV/Kv+1lqZ4VKxLHjXfUTzEedi9n9wefrAM9c4LgnYfTO8ZzJw0C?=
 =?us-ascii?Q?Nh/S82AArEI7NE/iQGzkalx83/tY5jDbARtMdGD4zVeSEit51XN5LrgGBob+?=
 =?us-ascii?Q?2BcQnYVoDCoyjxmQHoMhHrp8PS+G7Ykg9QZH5oCa+iAFehiABmUgyB6e6p2X?=
 =?us-ascii?Q?FYQcx82wmekW5/DB8TTZjNAPSO/g90qtEcMksO4p82CrV2Uf+lvuUFsSotVu?=
 =?us-ascii?Q?imF5npNNhVecybFsgnNU3bYIw06h68DppGMRTR+Rz4pQS4LTkyaEkji13vHE?=
 =?us-ascii?Q?pc3Ch59DzcWV12QKTwev9VuL9B0x6goZANHyffflyJleU76ZfzYOgkt868R3?=
 =?us-ascii?Q?9lkFj7qAmpkzuGkCj5jS+y3FyPwZcKPmYqvEIgnMZHCqmLC6Kxt2vHjcJcLU?=
 =?us-ascii?Q?sNdBcI49I5a4ZWDtOGeeTvBs7364MpAETsTx1btVzZOd7nrPoVlpbgPfzZol?=
 =?us-ascii?Q?bHu0I2wyGhU904OOAXChI/0ekox9H1+lu6V7j3K/Iuwn/wDQYp/k6Eu93S2r?=
 =?us-ascii?Q?SSPwIGDKPWRGFmqnQXlAwvzNakdv+6qSBVEZg3EUi0v48RCJAQXGPzDySDYk?=
 =?us-ascii?Q?rDuYXAQFwvOAVk8ob4yK25SgI3U+09Awle42bh5egU6PJWBqwy3e7KwXQ80Q?=
 =?us-ascii?Q?mXRLkxRlHgKGiMJjT5hC+Hj/ErlQedSN7T7a//zsNK9d0/LEDTI8tCz33t2D?=
 =?us-ascii?Q?A6II7Y7BpwKJY09C/LL8Vj3n8aIjPAYitXwxH+xaPlHy8EvHbgamx1phT2Np?=
 =?us-ascii?Q?drC/xt+zH8Va+CXnrKkHbuOHyxm1jg0L+Tonp/HCRhRr/ZXw8ZkfIMLqueAG?=
 =?us-ascii?Q?O2bD3Ye4NHRoWRF4OIeRdVLFUAVqkJH3gfI54e2e8mWJLrVRju9KhBzahdO0?=
 =?us-ascii?Q?iaS/NhRa6KQlax/OTkK8OSHhyT504qHlGGsurvW1qlJOVswZQxide0IPbqmo?=
 =?us-ascii?Q?/oifI7+Wl3gfZ9iuCaz//I0az0qZWfXXEcGk19Tmm18B1e0lnDyfhtPSMIGW?=
 =?us-ascii?Q?AMiosNQTQ6H7+GUXPdkHHoMODVeQNJ9lvkxtK69ZHDGU9Ah+FgYT3K4AXrQa?=
 =?us-ascii?Q?3rN/OzETPgU+vVN57x4VBdgyGHElAzyOcCwaky+A9N707dDg+56T8lRXHMiM?=
 =?us-ascii?Q?w9fk3d3EuGP+vz7gUE9yfxlGyU5Rs/xMBov+bjXshD3H537D6nLR?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c447941-eae5-400e-d003-08debacd4eb3
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:20:08.5793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ug57gbu8+3/4L4ZKCA4REBNl3aDpKEsFh6fWb7n3Hc9LqU4S6R+yLlNc72PlnglgLwxwAkk4z7v9N6S5nUXXYeXfdXmDeixhm7fUXRFRU9c5XufM4eMSHoCE1WhEIQ7X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11843

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rtq9124.c | 9 +++++++++
 sound/soc/codecs/rtq9128.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/codecs/rtq9124.c b/sound/soc/codecs/rtq9124.c
index 186904b31434c..a0f69763e53e9 100644
--- a/sound/soc/codecs/rtq9124.c
+++ b/sound/soc/codecs/rtq9124.c
@@ -287,10 +287,19 @@ static int rtq9124_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 rtq9124_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rtq9124_dai_ops = {
 	.set_fmt	= rtq9124_dai_set_format,
 	.set_tdm_slot	= rtq9124_dai_set_tdm_slot,
 	.hw_params	= rtq9124_dai_hw_params,
+	.auto_selectable_formats	= &rtq9124_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rtq9124_dai_driver = {
diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index 14a2c0723d33f..ad4704a6a6a5b 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -728,11 +728,20 @@ static int rtq9128_dai_mute_stream(struct snd_soc_dai *dai, int mute, int stream
 	return ret < 0 ? ret : 0;
 }
 
+static const u64 rtq9128_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rtq9128_dai_ops = {
 	.set_fmt = rtq9128_dai_set_fmt,
 	.set_tdm_slot = rtq9128_dai_set_tdm_slot,
 	.hw_params = rtq9128_dai_hw_params,
 	.mute_stream = rtq9128_dai_mute_stream,
+	.auto_selectable_formats	= &rtq9128_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.43.0

