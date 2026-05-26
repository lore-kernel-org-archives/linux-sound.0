Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142A22EC0A2
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762151; cv=fail; b=Hk5gSKxvJ4wiwCope2/LXIQMOh8Yyyp1jmvMYRC60y60VjNVKUIkCx9gHWjOXLeTEkmiBsHa7b49QIl+lB1Eg/WGBkk1wza++DlecgkS3/JWCGpg8sQ/V8oGQV0QAUE7ctbyjfeFelR/YGIQsVD9utdi8goUBW/UPLab09jyL18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762151; c=relaxed/simple;
	bh=HybiCYEK5z/Dk0jHHypvz2SwQFN1YhvPGSkZF7CRaGE=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=C6zll3St91WN7Ncgcw753iVNRvIo59iyt4dPQi4qsrYig6Q9Cw3J/WAX+o3q6r1TZLxzTSGCTLRR0ZfSpL8YeRzFSV/5UPe+fLvnKGeAFGPFvi/+xZt6qEfohibyVPQIeb7IkXtDRYA2aQEGdK+pbGFJqAdpjjvQ+seWX7LfVTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p8z38gEc; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p8z38gEc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+n4skJC9hWqrt7k6h21EuoRA9UdY9l1Q2Yh/DQuG0Q4uaWH0pj5Vyg0Q4SY2GUeCldOuSUTWowjKhBOVxWfYCcfMXy1v7y7mZupsDfYcNaB7Lrl0on8ReiDbg1J8G/yfHldUIh+Byl5MlhUM5HooxEhCT9angjkuE64wN87/Jp4kd9+Rj31mne0Qic3vhS0NWpo1lNfNu4fBGkhNZKzv6JwhZF/MJg03AgsfNweYqF6jani+8NIMdVPCzXMcGRa+vviCWOk73eEee/dslRABKXxW1smM4EUyaNy4dnvrKCwEn3jm/Uq6J5tAO3Xg6NAdpuqvQ3B4AJSdfAo/Jg4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGERAKoKZEABFyfFQmurQimc3pzY8nplDgDhWOkCik0=;
 b=hn08ALERB3pd1GUmLKaqrQi7vQNr8JBQ8TrPd6Od8a0LoMCW21j84fRkcntwmvCsg87WJSvP7FOvqxnUgc6IdXLzqRJSFs8FxPKAweVINZSQKs4DQUnJL1sX0uJ35m0YH3WCYxSUiCzMoFuVV4bFiydGmCjfKgVVyWTavEDszNYz6tb4sFJPsFMr3eeIyfnHyr3uWZ6GbCr8Naq7n83wKxw8JOZxR32s7/cIT18STXI6e0DzrMpTNHGvgHGqBNuGuavt1BbHEkn8W5Ekmf3J57fRkaA4w2vX/uADD9wycQ0+l95oWJvoF+muGbEKtVB9xWXFfcAdyWo3d8mPokxRAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGERAKoKZEABFyfFQmurQimc3pzY8nplDgDhWOkCik0=;
 b=p8z38gEcvac/bUeQ5VF0p5iuot+Kw5RIQK/ztwcpiP030ZTvhL8wGdZsMFbkHg3B7zkfcxL09Wi9nxswcCBy1jRw+AbQSx27jvqZw+5wTaARiYokNHFsk0dBsnC5Ub5QlTHG/AZxgFzV0QnbK8z0UujCvjdTLVFQQR/pbrEJcx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13148.jpnprd01.prod.outlook.com (2603:1096:604:30f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:22:27 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:22:27 +0000
Message-ID: <87tsrugba6.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 55/83] ASoC: codecs: tlv320*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:22:26 +0000
X-ClientProxiedBy: TY4P301CA0114.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13148:EE_
X-MS-Office365-Filtering-Correlation-Id: 559aaf93-0983-4a7d-b2e7-08debacda113
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014|11063799006|22082099003|18002099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	T4h3MMNIL63vKBG8K1kqKrAD2Bo5OV9kB2OntFXLG3xNvNAUFWTkHbO0efpBfL2Ku2rrHJXE/7PTYmK4NbmxXRz6i/ubAYDIRqtKYANi89UtLQwK+703fnHh6jYMG7q4ZwcjY2v3+CV1O4X9E/sUlig0lS0J0rF9RlUk7d5F3+YZIlZbpY8fJMMnqcKjeBlMBK9yYBa6J++Xl6elacHMeR7oZxD07BUqVIX9zduU9vaToE+P1rj9jDJDGQ68E8i4tAPLXaBltF8kkO4+oQFofKDAmguPyNtyvLDpGDaVIhWf4QEQ3c2o+PKeUGqSm1hN/bM6Q5jUeELeX8h7QnQ1R0ynLppzfyzmnqSl6OAENpkLqX+OqPBnA3ml+X/3zc1JJvsKtjMs7RvzJKcibb1Fj9m0VOsR+byqchiBfeXDbLWJUHnRDlyUzl4hK1vWzmhfgxf88l/oVzuUH9lXcSmSOHjc6ie7Ba38QKLhhooWuu3tA8/1jpmm3JxpHDuSYnINmzRuz8vZhFlIQ/kMnpVghK+1B5SoGzdou2aNvrWXWkJ1az8eGSbQhl1nojREfCpl+EMGg9szsMK2OwGh82s3mZgqOEPEyEwq2ApP69nxWGHUE2vjl/qWdhxuxl7hFA+z548a2SfJHbqq7jzU4yMWY0W8aQOsjCuCxo0/CsdjNhW0Fi5bVGzTFV+azrmemM5EgJ8VnYWHkHdd4MA7zw2hf8ZwA4BbI7SQGleIGWUkxZqi/Eee0nh4j2lPXhrbp7jyeh39uTJ0LKRNiI1ZNHkxKLeCXzohKTL5fOXGeSmEi1s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014)(11063799006)(22082099003)(18002099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5a4U3jGTtPD3iAddytdnn79iKo82YdmluroRvBAN6XPNR22RPn0ihqvLqyF4?=
 =?us-ascii?Q?kFkxp3iYSKizlRcjmCvc5E+SHnPj5HGsChNoA++E+bH33SROdy2In+dssBGk?=
 =?us-ascii?Q?GRtUvEd7QflCijjYh71cOz/aTaF51kv2q6dtuh5AvggNCUG0NoopwYTsN0vZ?=
 =?us-ascii?Q?6wvG0h28rJwC1xZ3nuqEbfMA9jBRm+nDwepkzYfbNbs5o5rWnKAMSCZJZfaZ?=
 =?us-ascii?Q?GeJHjGv/WIaZ8N+KJuFQLWed6bUfnaVtdty7I4DFng8ZpElwL0n36CCn9GBa?=
 =?us-ascii?Q?tiVvzgUSn6HIBBlBEJYhHlikQ4ixkmC9JlFk6wFAK3PVgAHcA7I53V5LK8d8?=
 =?us-ascii?Q?kNw3lgWi1Iz9plHDo4vMJQ1S1gUU1wXhkVfoPTP89c2w/cCnF28M+70LQS1i?=
 =?us-ascii?Q?W3kGWwZ+YvE2Pw9QXlF3qtEDxw61uJcZwcuylmdATJ2PWy56eeNn1nvB5DSS?=
 =?us-ascii?Q?UctsfTMCJJeUCSgQ80YpJU4S2mGakYHo0CYXyOz3kfdfrAUwa/SIh/PZZIrK?=
 =?us-ascii?Q?W8qb5ML1MP5EWWS98a9LH/679mzxinPgWMi3VGZqCYRsQV2fWZzQlyq0GsC+?=
 =?us-ascii?Q?JJWgs2+riTjo5eO8eYpU0fZO+3ShOkISsbQN6tlqsGqjnO+fGEPRtKjBwfdS?=
 =?us-ascii?Q?+yQBHZY2qQpBYSfJTTrSBMsAcWopY9gR5nF83XzaRVvUNQrJSKmKiSnu1C/W?=
 =?us-ascii?Q?Dyg9PjW8KovL4qQTgoMRq+wMVd5MASXJrKgbNmxtgKXHR0LdXxXBREofynjR?=
 =?us-ascii?Q?ub8efLxNGUfKESKVG+1lNHm2B4+r3PsxhL5Qp3FgTdkqxLk+153emcG9UMSQ?=
 =?us-ascii?Q?HfHmexVwOEqmqMY2K6k7Qk8+slRh5GGF9oeG+32Pz8NAXOLg4owjUV1iL4pn?=
 =?us-ascii?Q?FE7Qm511+RmMcVYetfMIWhtpUEqah6+DeCP43TeQnSlne9DSa6/EPfBryqd6?=
 =?us-ascii?Q?KEg1U/G0agoOejlG3oqyFTqS9MQePKgQN3a8zb0MN9qBGMIe+PAd3jQ3Jald?=
 =?us-ascii?Q?2stC4g8LbPie8BW3fHVBVKAbG+k0aVldeXsOHc1Sv7P5BkAGATKHzHyYG47L?=
 =?us-ascii?Q?BXFN0gNkd1ENoRwgMUlaQBtNmpT5XrT4r3SU76vx6xVZaoPldlcMcCMiXlEH?=
 =?us-ascii?Q?jTxnZFqnelS82Px+Wh7jM4IggyWBBjp/3XryjM/7jJXFmv+Ng3htMNVVUlWO?=
 =?us-ascii?Q?bJ/Obq18/OU92rVlOQgQV+5YNKxm2Ll/dEbwxOUhuf0l188rydUdPtwvMtIe?=
 =?us-ascii?Q?FO8v25DSLNPjFBL2id/61SWHmsL2F7gCL+NDd45vrkPSy1jvdYfFNbt0Uciz?=
 =?us-ascii?Q?hAAJRNZexbFKc5g3leJgBJjTrupRfyDXFbBqt0CCfSN4na6VjVlwWhHxTLze?=
 =?us-ascii?Q?mCuKkHiy1MUK00oaOqXw+adDvUtlyfXWb7ZWi5nh9yK+n+OG5P32pa2Ra5Md?=
 =?us-ascii?Q?+9/s9lnjaOjaYCEukjZZ1WXs3Dha6L1CjEWgeDuBfghzxP+TM2BWiT/q6Q+k?=
 =?us-ascii?Q?qheXJ13uKsGSxQnft3T1pfo27ub/eSUNN3CNbVwGwnojqULATlOH7CkYenex?=
 =?us-ascii?Q?52OubpgvslrHVaen2ahWa6YqsVZGxFUdZAJdKlwtYPs8vik9qRW2rf9i3/f9?=
 =?us-ascii?Q?fBhNM9Oo24P7/0k4poIQ+Jtboviax5ZGDA/6feoR4+ylGpLfrBtl+91U06Hq?=
 =?us-ascii?Q?DQdLzRIbNWVVPGdQGh9mGLN6aRrwmP7guzstUv26ar46IwaBNUPQ4PAhVI7r?=
 =?us-ascii?Q?woRes1tzq1si93Tq0ejL8pZkjqO8/99ihvPqz9ZJxxmAO5LMtKM0?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 559aaf93-0983-4a7d-b2e7-08debacda113
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:22:26.8540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgfhOJ3fN0L+vEVR75K/dfxYGwMOVx1da6A2KR9pKJCGRioIt8vKVe5r23sFd4yjoOoehZ7k4rNNvJG9H+F1ttE0tBC9PJHti1muDCHON0GLiWIsHGFU4f6kRgOjIv4E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13148

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tlv320adc3xxx.c | 15 +++++++++++++++
 sound/soc/codecs/tlv320adcx140.c | 12 ++++++++++++
 sound/soc/codecs/tlv320aic23.c   |  9 +++++++++
 sound/soc/codecs/tlv320aic26.c   |  8 ++++++++
 sound/soc/codecs/tlv320aic31xx.c | 11 +++++++++++
 sound/soc/codecs/tlv320aic32x4.c |  8 ++++++++
 sound/soc/codecs/tlv320aic3x.c   | 15 +++++++++++++++
 sound/soc/codecs/tlv320dac33.c   |  8 ++++++++
 8 files changed, 86 insertions(+)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index d7d958ecd8db5..ff6880f5ac63a 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -1362,10 +1362,25 @@ static int adc3xxx_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 adc3xxx_selectable_formats[] =
+{
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops adc3xxx_dai_ops = {
 	.hw_params	= adc3xxx_hw_params,
 	.set_sysclk	= adc3xxx_set_dai_sysclk,
 	.set_fmt	= adc3xxx_set_dai_fmt,
+	.auto_selectable_formats	= adc3xxx_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(adc3xxx_selectable_formats),
 };
 
 static struct snd_soc_dai_driver adc3xxx_dai = {
diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 4eb9cea272760..c29584d77649b 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -916,10 +916,22 @@ static int adcx140_set_dai_tdm_slot(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+static const u64 adcx140_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adcx140_dai_ops = {
 	.hw_params	= adcx140_hw_params,
 	.set_fmt	= adcx140_set_dai_fmt,
 	.set_tdm_slot	= adcx140_set_dai_tdm_slot,
+	.auto_selectable_formats	= &adcx140_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int adcx140_configure_gpo(struct adcx140_priv *adcx140)
diff --git a/sound/soc/codecs/tlv320aic23.c b/sound/soc/codecs/tlv320aic23.c
index 04ec8fb5c6e5b..f31ffa189580d 100644
--- a/sound/soc/codecs/tlv320aic23.c
+++ b/sound/soc/codecs/tlv320aic23.c
@@ -507,6 +507,13 @@ static int tlv320aic23_set_bias_level(struct snd_soc_component *component,
 #define AIC23_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 tlv320aic23_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops tlv320aic23_dai_ops = {
 	.prepare	= tlv320aic23_pcm_prepare,
 	.hw_params	= tlv320aic23_hw_params,
@@ -514,6 +521,8 @@ static const struct snd_soc_dai_ops tlv320aic23_dai_ops = {
 	.mute_stream	= tlv320aic23_mute,
 	.set_fmt	= tlv320aic23_set_dai_fmt,
 	.set_sysclk	= tlv320aic23_set_dai_sysclk,
+	.auto_selectable_formats	= &tlv320aic23_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320aic26.c b/sound/soc/codecs/tlv320aic26.c
index e5dfb3d752a3a..43f2416b67297 100644
--- a/sound/soc/codecs/tlv320aic26.c
+++ b/sound/soc/codecs/tlv320aic26.c
@@ -208,11 +208,19 @@ static int aic26_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 #define AIC26_FORMATS	(SNDRV_PCM_FMTBIT_S8     | SNDRV_PCM_FMTBIT_S16_BE |\
 			 SNDRV_PCM_FMTBIT_S24_BE | SNDRV_PCM_FMTBIT_S32_BE)
 
+static const u64 aic26_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops aic26_dai_ops = {
 	.hw_params	= aic26_hw_params,
 	.mute_stream	= aic26_mute,
 	.set_sysclk	= aic26_set_sysclk,
 	.set_fmt	= aic26_set_fmt,
+	.auto_selectable_formats	= &aic26_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 1d2e0ea6d4fed..a39bbad5023b1 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1422,11 +1422,22 @@ static const struct snd_soc_component_driver soc_codec_driver_aic31xx = {
 	.endianness		= 1,
 };
 
+static const u64 aic31xx_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops aic31xx_dai_ops = {
 	.hw_params	= aic31xx_hw_params,
 	.set_sysclk	= aic31xx_set_dai_sysclk,
 	.set_fmt	= aic31xx_set_dai_fmt,
 	.mute_stream	= aic31xx_dac_mute,
+	.auto_selectable_formats	= &aic31xx_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index d850945572151..8d333d3f3813d 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -924,11 +924,19 @@ static int aic32x4_set_bias_level(struct snd_soc_component *component,
 			 | SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_3LE \
 			 | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 aic32x4_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
 static const struct snd_soc_dai_ops aic32x4_ops = {
 	.hw_params = aic32x4_hw_params,
 	.mute_stream = aic32x4_mute,
 	.set_fmt = aic32x4_set_dai_fmt,
 	.set_sysclk = aic32x4_set_dai_sysclk,
+	.auto_selectable_formats	= &aic32x4_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index b12c1952823ba..cbce8196ba715 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1487,6 +1487,19 @@ static int aic3x_set_bias_level(struct snd_soc_component *component,
 			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE | \
 			 SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 aic3x_selectable_formats[] =
+{
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops aic3x_dai_ops = {
 	.hw_params	= aic3x_hw_params,
 	.prepare	= aic3x_prepare,
@@ -1494,6 +1507,8 @@ static const struct snd_soc_dai_ops aic3x_dai_ops = {
 	.set_sysclk	= aic3x_set_dai_sysclk,
 	.set_fmt	= aic3x_set_dai_fmt,
 	.set_tdm_slot	= aic3x_set_dai_tdm_slot,
+	.auto_selectable_formats	= aic3x_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(aic3x_selectable_formats),
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index 223c49dfc4506..c70da992c0e24 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -1450,6 +1450,12 @@ static const struct snd_soc_component_driver soc_component_dev_tlv320dac33 = {
 			 SNDRV_PCM_RATE_48000)
 #define DAC33_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 dac33_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops dac33_dai_ops = {
 	.startup	= dac33_startup,
 	.shutdown	= dac33_shutdown,
@@ -1458,6 +1464,8 @@ static const struct snd_soc_dai_ops dac33_dai_ops = {
 	.delay		= dac33_dai_delay,
 	.set_sysclk	= dac33_set_dai_sysclk,
 	.set_fmt	= dac33_set_dai_fmt,
+	.auto_selectable_formats	= &dac33_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver dac33_dai = {
-- 
2.43.0

