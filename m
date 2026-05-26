Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010022.outbound.protection.outlook.com [52.101.229.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7AF269CE7
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761848; cv=fail; b=jXYuJwcc8sreIhwChSQ6M03bjduvq+ANI1zab3x1GKEVYwHif7yOv/UPAb/f7ob5LjdmFeDDE8AdBEWtdunNhr1E/LZdMcRL+karSYhYQRmvvOen4ZLvo4fpOvNb40eRMfZAvn7ALUzQwgz5sOsQmP62miT3N/6qHuzQfUcVMHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761848; c=relaxed/simple;
	bh=zSNTKkcZQ1zbFJ0KNUKiqDP5skoz5/eb45Igp/z0v50=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YOji5tmbFcgxa1G+4LBmqe/NTh2LLdFxVGb9aRL2DP8lhI/yyk1khTvIKnD327KxtK/d/Zz1W9lJVtCi2t8eNE3inFFmajgysEohcqZKl8yhDQQ6gwIyF6r1e6ZRNvi/rcx53YBvcMo/FCnR/LMHfZxWw8D9GfV/tVPiqWX8Ouk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VPhBULK2; arc=fail smtp.client-ip=52.101.229.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VPhBULK2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jm4YnDgY/KLTIC+vW3H4f2p30ROQd8Prwan5PGhDqf2f5q2RiuqMvKVkPPt//2IV6wudBDC2EOHJIYP6L9+6hPhZ90rIB2JhEsI+RKPgfaCkqjm2y39v+4D+twCf2clCoyauVAUsP4bDO9gB4oXk/HcAs+0a5/af7mqOSvMCqd3vD1/88nTwPNqasjYJU3GMciYil6zrBTQclZ+VM3Y9NnS2L0NBFhdmbdi9iWON7F2UetIuhXzJ068mk03Mso0Jswioxjvs8n8j9icAgDP7fLLigS2AC1BlVPedULDv/ef0J0xOQarhrlO/j7euGNmXFY+8jpp8n2uAG1tqbow4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8H+mI6W3Tk/67L/7XmM3hKEhNWDRB0xOu37Ceyjhicc=;
 b=FoQvH6WIumSYqnv/RhYC+4lJ0DG9CLUYrWHaN4fl4I50BolPyBCxAteEggIOGud0o1A+lL6QjwTpIP6HcsKR6GsrjPyQQmrs1HzIKAsELVKNz2vtqLsprglOH1FeGwzgWD4O3wKX1EHI04GigJYW+iTsG+ntsGtMlimfH2KwtH4+8ZRwltmlEXhbnc7zDRW5k85V9pGEW5/UYLUo3Uv6tjHdVVQPYxVDtJMsIPsDACt+o2xWpTC7S6IHUniyIHCDBY0jDDBpHhaxnQvEFSQeUlwhrfztm9ZU54TVCy3jBDJfd01KmIabBuuFQP0z9OT1lTJBlziQNoDU4QnQca7kyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8H+mI6W3Tk/67L/7XmM3hKEhNWDRB0xOu37Ceyjhicc=;
 b=VPhBULK2ui53Pv5iy4oSqPgT/XQgTEDbbETvv+AA4mOcOq2wpPKgh08LweAeZY0I1cMOdbvgOaZ6P32dYwA9wH7qdWpsGlkjIY/WotQePHwoYutclK7TGda50S7aWcYxiqI5FQ3vpzb8diR9octNcac2B6qjaFacmjdQQ8+rmcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB11916.jpnprd01.prod.outlook.com (2603:1096:604:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:17:22 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:17:22 +0000
Message-ID: <87tsruhq3v.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 30/83] ASoC: codecs: cx2072x: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:16:56 +0000
X-ClientProxiedBy: PN4P287CA0118.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b0::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB11916:EE_
X-MS-Office365-Filtering-Correlation-Id: 8021e4f4-4993-498e-1db9-08debacceb7a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|921020|56012099003|18002099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	GjYqw3Dc2DEmpGOJlBq1xxA828T2WaToDSyarDAL34U7dFFqYstj92Bf4QKA+JaOIINaJx76wQplhrC1DkjiTd7apekKc4m3nwMKVcVtl1oEJktRVh5GJkm6w3fA2e7sEm7/vKRNC/tkWknNuQJiYlrJjsoweEvQbMAYMLlvs/r9XoYrDUXRIgOCpEGjPT5l0ZWZdEtbJZCIP2xhCOdDqeiwwQ2i8CQU0cJnZrW+hMLs8XgBkPUWyyWH4arxGuGzBf9B6aur7pW7Qj+6JO4aD8hjWSUoyWQ0NgPPn6LHh1yjOkTntb6Ztt3ZGSticjJ7VMmSeuv1dwtHMh59sHZQ5gbBTNOxagVQDjWNWKtedOkcf5vl/kZSPq8Z9PpUT05GGDNvvxNRBzLGcaJYxq8Rgfcoog5ymBruzGoP5ir6Db0fjfub4r2UlMczW+RcnsMRRLB0xPOG+EMhs6PrSkI2PSjHtV59Z0l89BOwZSaPyjbpkVfgjkt4zJpumiH9Zdqu3AkwEeekhweVBUOaCrQhm4aZi5/x86ZEDjib1bfC9lKd738q6ESs4a5bFzbwUHvxqLWLSH99/DjW3qth4jxicknvfd8Tg4SBu3UAIrChzqjW6UanW4v3rhrhrIuGG+/juvX3zo2IHZe4xBpds4Ye2xjPCqIImSwjk968qof7wJsBXlKNZ2Vt6B1TdUR9Prg+smylTN9GY1qejRAoDed+Ag7hCJ+j9tOM7HCXzYsk2tZfWJTLx/zVZfu+xUYQf/a6CeNP0qAA4sNR4GZtsWIwHHiYjpZfgmknatNDqsUa2BY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020)(56012099003)(18002099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j6AAvenX+wYeebrRqmwn9jQ+B8w+xQ2qEx1xVXtPzev1T9daEaekiHb2WPTy?=
 =?us-ascii?Q?zSNCNmIqMcb8miptLIsVkL9dQy3q7vPO0Ukmsfss58POIPAsaVib8D9IazfT?=
 =?us-ascii?Q?OQvDkbqOT5V8dklmoq9Ve0N7I4WhlzDYIIhVbkVJ4GoHbQwsi8TIqLaM2Dgx?=
 =?us-ascii?Q?UE+z+M7rhWxs8sXQ33nfnV62Z7qlBzR/hRreDCALToxAuKtJp7X9SmK8RHE/?=
 =?us-ascii?Q?Czl7r8GeIyA8ZS0AEWM+PD883krubkp5RGkbwdpfjyfY88QowrCku/kyu+KX?=
 =?us-ascii?Q?NugBV+EouAOO4tzlobbsNhJih5CtQMHg+mh6JlTjO8Ti/+EVI8l9DcEMSIJ3?=
 =?us-ascii?Q?f++iA9dEkBhNNhK7HUuOIWriSvMAT8LrQp6Gi+Vgx+9k/TYk3Tq8sL4wDZMJ?=
 =?us-ascii?Q?SmbFqa191Lp5ML8lulHxphEojRRijmAyl03R1KcQchYs/D8ESbqgcS6h7Rux?=
 =?us-ascii?Q?MrPJ41WGVAQG4xXP5QCqz5MgV9B9l8mIkQtoYT60kP4F6gfnaqhxc9+mwPEu?=
 =?us-ascii?Q?cDQQ4r8NH9RY0Bp00tur4IZVbnWiMLDAOg5pJ4ePMs/4aFeTN8DmEwbiH68g?=
 =?us-ascii?Q?BUPhqXK4xGJqkzN/vhIiSHG768PjgeDj3aFHea3d2y17gBpD3rvy0gBTH2v3?=
 =?us-ascii?Q?eWtcFBLLVo2tH/ABMHBLGBo1BV833OxyN6ZpFHyn/Bl48WOuulmFh8MyACqG?=
 =?us-ascii?Q?BSPFeOFBH3ZC/tHKsre1c0JEv+nQVdD2PejK56rKt6sQe4CDZHnsBvvjKjWN?=
 =?us-ascii?Q?hk1TmnLO3BnZkSAd1/js3UpFJrjNztJz/Gd5WYv3rxdLSzWu4aAsB8Lm/dx3?=
 =?us-ascii?Q?Szi8OgaBDWXDFbW1LfXmH3IOdIiErVr/socZV0JXDXGGRkMhupbax8ArhRiN?=
 =?us-ascii?Q?bLRwCuBEJu3FgQSVIXiwyLD7ttHm2aAI624yH1z59hNtQ+OdcBSUDy3ZEhq0?=
 =?us-ascii?Q?3YeQp422Ec4gAih4NVLKuyJ9e8tCLniXYuTG0E/qXD2fyrklXnzqzn1Zx5V/?=
 =?us-ascii?Q?lOkhtrj/dSU942XZqvdNASVpD1ow8Tg9a8WZP5xQ0eqQ/99070vfjT2yj8kz?=
 =?us-ascii?Q?WMzOL2XBUDIoe19i9gwxC1L4SOxihsti0XipESSKH1DW5BtX9lvB8VffJ1Ko?=
 =?us-ascii?Q?JuqZYAMKKiqOIUblfbLdK/3LeAUwlvNn7oeyLUuoI1dnI+HzUJ6zAKViPmQs?=
 =?us-ascii?Q?AGjzRU+sqoeMFdhREXBryflggyI98TFz2+D5H4a34uEDHMjq5+m+4HkOGeu+?=
 =?us-ascii?Q?9euvpJfkwzQCMtGp9EDesBTuQZVYTEMi1b/wRK9w/6H2VJ6W42NTduB5uF0l?=
 =?us-ascii?Q?9Z7tYRNl6+LLZ+JYFqcOuerilPrIriQc5Cw81xVUF+qpd9xZwonx6o568K+m?=
 =?us-ascii?Q?MQEZ/vJuhkKBziKhUnQjj4WcCDmJxRy0JffKeGsJ2i31PbT0kg9zJBhtRm/e?=
 =?us-ascii?Q?53SyTukx7NS+qGTEZo1VdEH40zv8JNR6oPDovYtGbSmLejEViGE5b+j9mDC7?=
 =?us-ascii?Q?XNiI/VU1b2AbPBvZ0/Sjg52tCPYR7tfvuX5FpSxUcfzIWqDGzWetkjjRDBPP?=
 =?us-ascii?Q?9beqcL2txNjqSZTE622EjNveMB+hAbg1O8bgl76Uk1eWDGzwLYhbH7mpHw1Q?=
 =?us-ascii?Q?c0qNvO8a5Z53IdfhhkBoU+wdTcUNBE7MSoBvQTX4dgv9ApeizvgSPPCAXd4j?=
 =?us-ascii?Q?u7//+xO9GGGuS98KiqM/d+Vva4ZXa1hS6/CClLTkSA61QTqbimvSDfLHSPkZ?=
 =?us-ascii?Q?wcxKO7bntlHW/aMGQwKtnTKgNdXLEpmZ0T6pSv+SLUet3ML9ghlO?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8021e4f4-4993-498e-1db9-08debacceb7a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:17:22.1724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSQM918R3MT81eKzxdkpfKDnH9LJ086s1BDvDAjkU7LrBuKRODjfPDZUw+eWBNMzRrjgy1+h9Wtcjk7FgGYXx3Ye1UyMuG4XPl4du5+Dj9s+8J97wH5Uv07DRmuE9KHz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11916

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cx2072x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 83c6cbd40804f..664f758e03258 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1522,6 +1522,16 @@ static const struct snd_soc_component_driver soc_codec_driver_cx2072x = {
 	.endianness = 1,
 };
 
+
+static const u64 cx2072x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 /*
  * DAI ops
  */
@@ -1530,6 +1540,8 @@ static const struct snd_soc_dai_ops cx2072x_dai_ops = {
 	.set_fmt = cx2072x_set_dai_fmt,
 	.hw_params = cx2072x_hw_params,
 	.set_bclk_ratio = cx2072x_set_dai_bclk_ratio,
+	.auto_selectable_formats        = &cx2072x_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 static int cx2072x_dsp_dai_probe(struct snd_soc_dai *dai)
-- 
2.43.0

