Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010059.outbound.protection.outlook.com [52.101.229.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91AE271A71
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761543; cv=fail; b=QVOL8iQVXyunJBN0fkidBC99RsnIAOydURPQs1BixLiwDjVChQ+GvK1ppIzYeGvImEeh4a3+/v2WEaAu3MgGHRdgu9ndVEz18qMs2nrRi7KXiq8xiVRKd0hTCcbaNkYMqMbZyZYDg8N3p79zL91n8tIeC8aqjw/fJJ1fTNnBoE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761543; c=relaxed/simple;
	bh=vocNW0Fv0dKFeKoI67FNQCRWQ/heG+Wnkky1/+O+Nqk=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=plQQY4vpgJuNPNQH7/5G8esEAkzMfJOgPVVN66/PRCx469eu4rEx1Jq3AEf6FPGhdtLXgB2bTin71JFgTMf8N37mDbjWtYv+ru+jupxBL3oI12Kb3x84m+aNLbkWTQ2T26HM7Moya+eyMF59tOfxZg5+wyfpV7QaqsegH21mq8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dndUo5uw; arc=fail smtp.client-ip=52.101.229.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dndUo5uw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frCuWZ1S2DTSwRqZhWhnoiQI4Gt/xWYixD1MKjxD98DOU2pkRlfFCiGkjWq0M1b/WBtyysM9XM3QdbWcnYYIRSMrXWtwGcjqrJXKjfozeeTE1BlJwQ5yi/T6JUQC1WF7MN0ZHE+ifBfdFye1fNhgGsiTAgJaPFKJKbGTMFaHXCfvSJeIhVuHZxed4Xl+w9B96AV3VHXY8gXXSRX40AckCziYP5TLeV8XL+7s1KF2uljPubSEdoMzgdY9JPqTqjPNsiPxCBLTDSJMXFmh4db9K42JmcD4SfHAoVdhbJrcFXgQqCGI7TSozOKLgq5W9feyLElWxX5suPSF/fdXi0UN+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zwv3V+S84pKxUzmyLtvTm/2ag6UQofBoBkw5O2uWwIs=;
 b=Gmm+vGCHxBJ7cBY+aQlGtX8GQhK22kkVHUh5g8ry62jPvNTXUX8UlFSZ4cZjxw88f6tCyNz72TBPkWgd+7SFtzLWvLGBuFYnvVQqGtDaUf3mwX9Z5dcmNuRGlKrcLtWBvzE/vm3HIi5T973NGWI0iJlty3Ez6Ol7NEXmVuXvYVA4MKnDVzqTYQC6GlwQUSgAkQvuS67MEm7khXncwZFR/sIEGEoS5f4kh4YcZm3ddmudKeTDfz8qK2e1tMhg/Pdejx4Wl658D5UppAULvan2tpSMJXKo+UYBhpHYbis+hdMChTpbfmPLgtJTGpkhatTfyES7e/bq/tjKphY5A/Wzfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zwv3V+S84pKxUzmyLtvTm/2ag6UQofBoBkw5O2uWwIs=;
 b=dndUo5uwYDi9br0mk2+mftHKvvW8F5hij9avqbszDPiN2H+FtWNBrdtpOtNtE3jIVy6oPBYw4e/TkhwRx+VwYGTPHsIWOIzpwG9ItIGLUmljXM2eB+s1akZZN3ZRGdR0CeHzZS2JJaXmDlVcdUSDAUvFvkQ4UpKtQNT5cc4R+jE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB16271.jpnprd01.prod.outlook.com (2603:1096:405:2ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:12:18 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:12:18 +0000
Message-ID: <875x4aj4xh.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 22/83] ASoC: codecs: ak5*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:11:30 +0000
X-ClientProxiedBy: DUZPR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB16271:EE_
X-MS-Office365-Filtering-Correlation-Id: 420c14e1-b561-4f3c-aff5-08debacc368b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014|56012099003|18002099003|22082099003|3023799007|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	yXJiWzHK4dwlrQ2caCpuwcY6EIVd1IIPXnr0rPYFjQCC9pCpaso9zX8MUFF2FM424Bk5d5jbYvINVdtfqQ0tXBYXeda17Zwc0TXfzzW/aCv9iapWcr0i3++fo+0QrMhmsqGgn2gZIRNrhPEGdhMVtcaRrMrutlUa2mXWW0cFQajri4HK4IcYUCuIkRXxwQFXl6W+gPs49NSDU/pGjMPmQEXgdRp9ya76vF+BkEVpgXLIT2QBO/AxSSpvKhSnpCrhe0rREtboGwjTgWROY2F6NKDKCgHPW6NsRSlOqbZ3wluw2LPKTwelbWfntK2WEbJyiFBfIXLqilfhQ3Yv/5XcJwEFaqs6wjeENbJIJ2SIKHqK9cFJGfivD0O0pCIJ4bepr8DydsUHwINui3JMdLASuBADPaaN9xlU+q6EPHAxHCR1J7SmcWXak0LmCacoD6QsHZGZC+zDVYxNmZI/zOxU/FF6sWavOxsezbCPplI5klMRuvlHmI5mUtI99uFslkQ8ByKlMFxu8wb1zDSSQSK9o5MbOilzvMuDxVy5xHI0ZdPYWRUhsySNKufFbxL6lNmv8LNO+MmlGUYUqJEuH6+i+Tp0eOiVRsxTn7LdQWImDhomiCk5IQPFKHdtAVeuwzhDLogPYawS9i2+1ZWEsSuOTfPAW3K6CT+mdg1n32HrfAWruDSA80QI8KNtDOTyT9g6X7ZzLSpOnevgBwsMqVmAcHTwn7JUst5YnLx+vf6Z39jH3cTiVfHCYiehdA5GReoQcxNaKKFqiCTz9TYFTOhQ7CXZ1nOP/xi2lyY/KQf4JAI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(56012099003)(18002099003)(22082099003)(3023799007)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CcIEE5ol0C7e9jBrJ5R2uP/nc02rBi7ZTmH2WNTKrhXud4uEw3/K/KoWMRYp?=
 =?us-ascii?Q?iie6LI//TCptMyPIN5OOKNpfsChGhh2dClAKTQMyhSZCYtUqL+ySD8zu3rNB?=
 =?us-ascii?Q?AWJl1tMsMAcsv2db2xNv1M0SMDMnengKTxplfqPapA91PTFCf436+/QDtFwB?=
 =?us-ascii?Q?uwLfNHsNoWfiiyo9UQSvEdlgac8mSaVpB3cUASX3kqNXuhtWMDmuhyeLPuiC?=
 =?us-ascii?Q?ig8HzCOoft3dv3XcjvP7Oq8O8RvEzDy9f6rEbuNnoX6emcppVAuUn4ZsaXah?=
 =?us-ascii?Q?CthJKszLs9wQHWEXGkSOxmfMPJxsbhuc+qLWr8m0oh/tJbyY11wCnGKWuyLO?=
 =?us-ascii?Q?evAdFRbbmwUezEzLY6R5v2zdVeJcNVsQ5BRg4EcIsGLLGAGOn/r6d7PbGzF3?=
 =?us-ascii?Q?0LeHEzo86jMSX6cr26WL8/oBqJDavcGAZVvN885r+kZc2GOqihPxbLPQtlIc?=
 =?us-ascii?Q?KVwsh5uJfGdOQpFEjM9Y2TQORiENOoWhbVFV9B/dpesbrbRX2jgglGEPBHLK?=
 =?us-ascii?Q?3idr1H94LDuEa8J5CDY4238/J/S8NkwtqMNHNfeXzBya+E1fy6BknvRHJocq?=
 =?us-ascii?Q?dUgKNzKKYfS2B2UgnIW3vLpw36Xk/YpwvPFCyMb0tWYKKioIIs5devCxZkOi?=
 =?us-ascii?Q?rSVhnj4Uiqsamc1PwBtr2INm6tJYbpeeQh+BFO7J15eGtkmWgJH5K8RwxKh9?=
 =?us-ascii?Q?IXPmMoOhC3fvqHL3yMg6dV3+ZDzOT6Tc9AWkfd0Retr+dQI/KXbvixz+FHGs?=
 =?us-ascii?Q?br7uioqr8ETOGe7b+PWy4nRKLc5sFwvTiTBhyFhJJvZ1UOoplCr3QfOA/Vz4?=
 =?us-ascii?Q?gajuCGRiFYgAgIL9EylUHw2m+S9kwfvQe2JkyfLYfjfza91k28TSzooFoPEO?=
 =?us-ascii?Q?JWh/VW4wVPpWBI03ext7dHDIS5v/Sts7MBbdJ5fKxhArjYLGorjuurDrV69/?=
 =?us-ascii?Q?tAJpfkp9TyCYb+UuTdZNJXzlLdcNHqV7z0ig7VWKLC/z1CQ4wpPd5hcD1MyD?=
 =?us-ascii?Q?s9EFxWWQpPbh7xpm0ZECBmMP/14uzDZSpGpl3K3CQohMeGg+PgIa4+tm6oJX?=
 =?us-ascii?Q?DOx4ZUSCjYI2x+8RoGRBbTirJfKCwV7YCahTDlcHe5T7NG3h7PCFS857gPYX?=
 =?us-ascii?Q?uKTG5TqhKtgvjLR3sUB2JHWYWRLot6jpU7J0z6+gdv5isBMB9yMTSV2y1kwv?=
 =?us-ascii?Q?uQpyUboGzIXsONZ/ozyVz2TjotVp9GRSUt1MsndNrfl5za8ZCVbFOIxSHLG4?=
 =?us-ascii?Q?n+FhfnoKVY7FkCGevIINCC8mRXF2aTnA1jg2RRHyuROBt38x7l6dPMJyzxc3?=
 =?us-ascii?Q?8P71A2Qe4nbDE6vyXa2V0iGpbdcbMt/pBc15HMtfaqyS6AExwN0cEJyelYRd?=
 =?us-ascii?Q?ebFpgnGDbP5l1Z1/oLUuR3aS0qbiFZPjB56SbqXn84WNDXCg8LrwLSUJh3JJ?=
 =?us-ascii?Q?m3fu0O+8si9aISKeV0p0HyTiA0YHz0ONMOTHUQOg5b4dqchbJwjXVvQvTeq3?=
 =?us-ascii?Q?iY7zg701LHf2rgSCpgNEr10h6Q5+bw79nOOaeh3xPJ3qwrkfluN0aKC2yB5G?=
 =?us-ascii?Q?KC9ioxQm1bx96AHkNKs0eHf0gMlkz6T7MG/9Cm2MMTtweuI4SJzblnPCpA7D?=
 =?us-ascii?Q?vZnpPQ1W71hjQ61q5v92YDyYKvS/cTEqV/yhKEy2m+TIWAwQXPhsem/Os3Kd?=
 =?us-ascii?Q?x8IpwxduvkYCCtAH5lHMVv9eoO1rmKCkDrXTrLEk1R4DoG7Ft537hHk+HgGv?=
 =?us-ascii?Q?RH54ENelK3BNWsK7EjBzurqfa3ajSO9+fZm2YVdzf05EP542fxrS?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420c14e1-b561-4f3c-aff5-08debacc368b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:12:18.6031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hWKFugcKmocT09kjBPCH2TO9kzYY69Q5ruPWaR0DmIorAGGr0a7VVtb4qpduVwRnN72U3h5U9+Ar86AxSlrjWYwW84W+JdX6CqyplluI+ZDsqVtii3O1+lNP8s9nr9Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16271

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak5386.c | 6 ++++++
 sound/soc/codecs/ak5558.c | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/codecs/ak5386.c b/sound/soc/codecs/ak5386.c
index 6525d50b7ab20..933ca90b7e287 100644
--- a/sound/soc/codecs/ak5386.c
+++ b/sound/soc/codecs/ak5386.c
@@ -128,10 +128,16 @@ static int ak5386_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 ak5386_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ak5386_dai_ops = {
 	.set_fmt	= ak5386_set_dai_fmt,
 	.hw_params	= ak5386_hw_params,
 	.hw_free	= ak5386_hw_free,
+	.auto_selectable_formats	= &ak5386_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ak5386_dai = {
diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index 691db6565c20d..0c9cdf9a53bb4 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -285,12 +285,19 @@ static int ak5558_startup(struct snd_pcm_substream *substream,
 					  &ak5558_rate_constraints);
 }
 
+static const u64 ak5558_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops ak5558_dai_ops = {
 	.startup        = ak5558_startup,
 	.hw_params	= ak5558_hw_params,
 
 	.set_fmt	= ak5558_set_dai_fmt,
 	.set_tdm_slot   = ak5558_set_tdm_slot,
+	.auto_selectable_formats	= &ak5558_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ak5558_dai = {
-- 
2.43.0

