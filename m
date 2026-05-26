Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38D308F38
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762526; cv=fail; b=BqFJ8HmOrAqQ+XdnV0NAu0nj7z6nT5ryO3ZnQGeFJmm96iw0QRiCr+qej7/ZqmSOFA45FqRT2hhIlwRWx2fS4gsmbldTuwdzwg2+NVqn64pGjMTwwSaQwRn5evfdJi8/BcdbCTsLQzKvD3/VtdeHzwCCipQ4aaLqxWJ8uGyhHJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762526; c=relaxed/simple;
	bh=h07aen1WPFa+z7zCHCxsTk0jUlKHO8GdPC7Pu84Jx8w=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TQhP6riLhr7nyHp2Mj/L1+Op31JETYLSTBnQ+IsL3CUlB9oXv2XDbIESNrez9XEV/Wo5AgikBM0c63zFLBK28cDSN+Q5cNrbzjCUF0g/iksPvBZtXyt2oGW28iT7biiRC6mcreta9MzMI2Fz1JxiR0NktM6e7RPN/Tg43mO/AJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DoiNyeGe; arc=fail smtp.client-ip=52.101.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DoiNyeGe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GU49LtVxMZu6I/99vz8fPBKRl0K6VzkMP7n/u2nAYKeYk+sqDCqCt14QH+bD58nN08F+iku2VKpepSxthZgAcXvd2xDAQmt0BZKrXO2oCsEWoGGP3PWF8BrwNSkObLqwJwkbThfFNyvlB7j9dTm6CrzaQnkx7BcaFGUMlh/kuQuforCe0v1ME39AGr09CnjUTb33ZTTOdFgbHmUPo6X4QaS1tPwC/C8I1EmXD2igxvfuJEVuMn+aqPqZ9DII3ump77d6TxAMQyNSmf5TF0tFqA9L8cHCP/ynncO4rJuP4/o7TzZyV56bcuBM9PbwNWSPdtl8uyy9miml8qpRgbtm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUxXyDmoHplqr/IKRyEqWZvZfMMZi02OFaNBeLS2umM=;
 b=m/mdjXcq4nzEdDwEz8GGIeEZOFguVDAaYyw8UfRl14DfD1buwZDMb+XnUPTdkWL3ziEb+4NhnTXyx0DTwB+I1p4Nr/v1Cil+MFKRtup/KdkoGFLBUUgeU1LZ0ot9hkm992Mx6AiSZKaxv+zXKrxaNXTdBbU4KFTuuPzUputTiuTcTqIvq7dcHqidzzvEL/LcghMI5KRwO9agKoZKy4AM1ovIKgxZiBn+uTgg6/V1QQgT3exg7XPi/TTFnMeFpT4Y3KTgIKMI4cUCP2a7Kj5JdMjqpwweVgWOWcGydJIIbv/kN72PQTtVY6b0WP2l6IBxomZF4svkRTovgJ9VYOpUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUxXyDmoHplqr/IKRyEqWZvZfMMZi02OFaNBeLS2umM=;
 b=DoiNyeGeUKLg2yEtpoTFVxtoNWjY0KGaNXj8asbfdIPPccPajUoF9+02a+mljP0U1wpynQw4rgJKavgtZlPCzC8fb1s3n+th6AFmzI0KnT6wyrH72F/hya1jnClzC1lD9lDl8MlZ1dZhGLvvudoZ4MUxHQ01MtCp5YTI49kXF90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB11158.jpnprd01.prod.outlook.com (2603:1096:400:3df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:28:41 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:28:41 +0000
Message-ID: <87tsruewfc.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 80/83] ASoC: ti: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:28:39 +0000
X-ClientProxiedBy: TYWPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB11158:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a5b735-0df6-413b-6357-08debace805d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|56012099003|22082099003|18002099003|921020|38350700014|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	QxutKgM7b7/A7wkQdRZouC9OjbgkjJxsVihovQ3j2j1lVsRoguAGpIgS6dsPmJWUUyzeFVn0wbk3lPgoS3rWXEVlnMfrwpEOsv+wHMxnnxkR1Vj9CXWnRMBM1aImYU0fWsUH+2ltrnPWW4O8usBChcT4Xy9FMVa+W3Tc21mCt0+2Zr5guypkfQNcZYrQgpN9ZdzWFWbPBu0OipQ8orlmb47fQ3A8rLKPmpI/TSWX5q1P0D0tnZnXo02LNp23tak/mLhiMJlbo96nScp7hI/CdpGfFvBdVlXiNeNmQ+gXgFP+jonDyOL2cVWAt+D1PgjMYiK/CH3FUPSyf6Ns1QG8xwCYHstgJnEBm2ghrDuyVIpSBHLo+qmAZkJcuUq/LKTU92e1RQgJRi/n117bs+kFspc+OauFqbvvJedaxVz1uwOJKvIAzvM/Nfg+wLLWPQ864QjNq4oClRYPPdiHANW1jApWOjs6tXiLO1xPipv9f7lc94FeUbpren1DHEUco1CU6eL7gnpmTwEyk9Rwwrn4KcQRvO4tWnJNjWAX+TNnsL4B0ghrq1bz6HIADTG53cImsRk3tSSffTAytjTnK1yJLpraun99NCkeW54i7+mDhAWzpOLNOb8/h30GWIbzBHBXrNLyEKE2KW9LpTj1/cbceEe22rMVq5WKEZxuMKSMkWPCzWaSzC9lMob6bFv7LVSzKt35gqtey8UT8J9IYBBEb718RmCdJ90yG3DZxqA6JGzOGEpX7S+muUOkV9cIaR3bFc/EpeVUgUTX24kMCJx6PtttumHLEfebhS1GbQVo1vI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(921020)(38350700014)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f5KjDSp9SWhE3Oki9B3GzyfwpO9F3Q4ihjP1dqiEEzsArBk2tHFuls/8USBK?=
 =?us-ascii?Q?VqYaYaYKx17x0oOVRwOUmLIGZrn/l6tJO/6+prKLUMbA5jKiaKRtNjEdsn+p?=
 =?us-ascii?Q?uaDosTsy6oabJsnzvYmlp0b9EzqfLMU8igwMe+BCyLhVrGYZTW0nIpZongmI?=
 =?us-ascii?Q?+H9T9qGX44RrHKWTAHpiLvylAFy2tYlOS9xY7+W4Adks1CKMKRuEs1KRY/AF?=
 =?us-ascii?Q?gbbErxaQhqLCr3e8tWjNUSB3UGjuO/W1tjUdbXRQsNTZ5R/vYgEEj62ZeNU5?=
 =?us-ascii?Q?nSAAOc49AInOLpa7b4BVQqAa+vDfpp5V6ORa/+k8pnTe7FBawwexiwFjq0Vg?=
 =?us-ascii?Q?W+PEkc6TOHLY1h59IjPRgAoYy44YGqXAOfkIN7CcHBhVAIo6BbQTgNDcQ6w5?=
 =?us-ascii?Q?76DUwkhyEjIgxDVON7A3qAnxgORITu4giLQQqSZVZ8TRd2xfspYtuD3TbrGe?=
 =?us-ascii?Q?pytHXNfk1xaFzLCqJjATrvp2KaAe+wOGOcFRUfuXVdiRcvd39ix6autStEzX?=
 =?us-ascii?Q?EA2HTBPR3tuustDoRnUgxiYBDQyS9hdqlbFnHr8mUKvPDabckfgkv9BnSlyk?=
 =?us-ascii?Q?BrrCq+CPmR/2f8XTp3iYAg3nY7rC0y7C3Z5Pm6J+ijWaJ0p/UoNIttSFaC9a?=
 =?us-ascii?Q?40jAX+xAqm2y9eSSpDGscHI9tz0C7dxYe6e07h4iqlYt2SpROXiSiCiC5WCF?=
 =?us-ascii?Q?OGb4379Tr0lbxFoiylk9LltcSS6NV39dHrKgDsHpCT34ERQ95MoLAGki0eJo?=
 =?us-ascii?Q?ggVEYDVR4yP9XN4lKBngU7nWeB5KxWRQV0cOLBCDg5jfFEMVcaYXneyZwTQB?=
 =?us-ascii?Q?U9jt90R8M7I3el68s+GoJrCRxTtn4mG5nzNW0I60TRV9Ugk0NaRNYXGGwfk/?=
 =?us-ascii?Q?GYZRX1LVdN+gcP++0+6rg4cMKnA/kL/o6jIJQOE6Gi1UlWgN4xU7fs+/FVRh?=
 =?us-ascii?Q?NdGe9LV553CzvU/+KiboyhZLRNlBYw17YmXPwvDZR6ync2z5rQRgz0aZvXzr?=
 =?us-ascii?Q?7prMH/HILzr/FLWMB4N+v34LE62cHEaALr15O/8gVcvzVVZH//PGrC4Sc8V3?=
 =?us-ascii?Q?voKpa83/Qb/NHEhG3y7wz62yeGEeG+VT0prDpaIx1hwQBmQDdtkfvPv7zw5R?=
 =?us-ascii?Q?qMMOsRVU7fdTiYjDkYsLa0JEDw9b5cBSQJH96UvshqaAlWz5DpO0iVkVUQbs?=
 =?us-ascii?Q?svn7D/a+0+n1Lgkm5KlYDZzKykvB39nKdwGv2CptFWKaqj+3bPa/VeocBIrU?=
 =?us-ascii?Q?ostbQTYImr84W79DohF4mh8uhl4jynjcZXND6zA4vujLWFbWnZv4R9U6wZf/?=
 =?us-ascii?Q?OJzuyOUNs9yy6KFkLrTMg4R6BXINym2V8/ps+TQloewj1kT20oXD0GMuoGpm?=
 =?us-ascii?Q?pC+lsZ2zBX8u8BVpmKZteFKGeZ7KD3WgMVlczSX2UOp74FuWdFt0Zkqdz55Q?=
 =?us-ascii?Q?w4o/isuuDipMtGrE5xBWw4YV0AfiCJ1xR8HyDAipGjBrfZHjZE3ZmBsd8VxE?=
 =?us-ascii?Q?ZoRnWiP26vAV1iJatTrHP83frV9Do5JWJeB02l17bfZJJGxxvhlZ6wSFrj/F?=
 =?us-ascii?Q?qMyY0hUsrVEY0NUHT8uSDh7dMWQzinaHqh3jzeJQ1G1IacTMq6/vi3PUfM32?=
 =?us-ascii?Q?zrmr2nV5ZvndamPzAoj6SFdeh1NoGZIMoClmz4v3Rhe6a6x2Vk4sQC48FOTd?=
 =?us-ascii?Q?9l8ugtd/UFhJJUU2/qih8CoKwnbSP+Mu02KqB21JQw+q07He8xpBc8iSt5Xo?=
 =?us-ascii?Q?dIe9BPhZ+OB5KDG0CjPqeh1mxz1aSG4f+Au67N1vwOZNUj5EMN7y?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a5b735-0df6-413b-6357-08debace805d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:28:41.4129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wGmRfBk+GGBCjoLTnT8C+fHNU/H2WLItGw3UBUvr3lKOP099ilKmZeAgolS2H3mXBUAW5YTecvh+6MAXhvXtpofBFo25k6PiAvGQPr1UCs3QGJwVdnWVww5SBC5cNrb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/davinci-i2s.c   | 14 +++++++++++++-
 sound/soc/ti/davinci-mcasp.c | 14 ++++++++++++++
 sound/soc/ti/omap-mcbsp.c    | 12 ++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 059967f0e632c..ec7eb2f19b6fc 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -743,6 +743,17 @@ static int davinci_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 davinci_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
 	.probe		= davinci_i2s_dai_probe,
 	.shutdown	= davinci_i2s_shutdown,
@@ -752,7 +763,8 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
 	.set_fmt	= davinci_i2s_set_dai_fmt,
 	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
 	.set_tdm_slot   = davinci_i2s_set_tdm_slot,
-
+	.auto_selectable_formats	= &davinci_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver davinci_i2s_dai = {
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index f229f847eaf4e..da1713ca36c51 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1969,6 +1969,18 @@ static int davinci_mcasp_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 davinci_mcasp_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_AC97	|
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF;
+
 static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
 	.probe		= davinci_mcasp_dai_probe,
 	.startup	= davinci_mcasp_startup,
@@ -1980,6 +1992,8 @@ static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
 	.set_clkdiv	= davinci_mcasp_set_clkdiv,
 	.set_sysclk	= davinci_mcasp_set_sysclk,
 	.set_tdm_slot	= davinci_mcasp_set_tdm_slot,
+	.auto_selectable_formats	= &davinci_mcasp_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define DAVINCI_MCASP_RATES	SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 26af616c33f51..5734388a4e4b1 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1269,6 +1269,16 @@ static int omap_mcbsp_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 mcbsp_mcbsp_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mcbsp_dai_ops = {
 	.probe		= omap_mcbsp_probe,
 	.remove		= omap_mcbsp_remove,
@@ -1281,6 +1291,8 @@ static const struct snd_soc_dai_ops mcbsp_dai_ops = {
 	.set_fmt	= omap_mcbsp_dai_set_dai_fmt,
 	.set_clkdiv	= omap_mcbsp_dai_set_clkdiv,
 	.set_sysclk	= omap_mcbsp_dai_set_dai_sysclk,
+	.auto_selectable_formats	= &mcbsp_mcbsp_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver omap_mcbsp_dai = {
-- 
2.43.0

