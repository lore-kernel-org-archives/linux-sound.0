Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87C52FFDD6
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762342; cv=fail; b=bMVryhLClQrtz01QNJwLGajWYhTTuwXtKeSBFHDTVVf2UPk0KOpYk+yMEzvaHfMU63j6wVj58tpi908KooUZ4o7Ju2YOzSqzUw1dyffbok1kmrJprlstzUyUHO7CJGYcWbGGDVZ7wc/kN5GtgfLx53kVbRWdzRfQUxbh3h4ShaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762342; c=relaxed/simple;
	bh=nMX6AsMPQbDTnyfkrpIiN3r0WaVAHl6YEHU2lWj1C4c=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AkxI4WRTAkczF8N5e7XoLNH7xQ0dplS7izqHImxbHvzySNlxLBTwKkqIl6jIUMYHef8pEuIYLjdh4eottC+5UFQswv4JfHSOw1xakjgBSiovqTpTZeuAnnUy9D6uiwokl2kk0vi62ZQMaOu2B1g/rrwIMxmQtSolmuHJG+CNy8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TXMgKGLg; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TXMgKGLg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5AwNAOPWnfg81HHlloMrd6mlcwLe+ISc2011vT3j67qr7OKiTpOvv67JJXZdBerDcVtXSx8IyufXFhqRHJ9Qcxydyo1SUiY2l8ZRUbW032cCxPEjoYJZoBl+vjmuVupCEACITBTGhTmXoAhh1Y3HSUMaJBhnqwMTtLXS99KgCGe1nDFbF4YpMHjHPHPYwPvZ1ApXPwSE2M6Xm8AQRRyevfMu0yX9dhhOPF3H1P0gapJqANNd3MT3oMG8X5dVBVmdGz+xnhxffQoZCjlBEFgFWfe9HocMj/weMwrI/hJgQs0qtxCuHgUZQP3YFjYqZaKrjODNn37VvXYL5v2bdDdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoVKOrdLVTCL0U4tyW8NtytCGa3TYGkchU7XCvG9hmo=;
 b=JClU0XbhlLtk2g/QesbJmYWYPb6vP9diot2WQiC0Td9iue+at6DDZYm+EvDME0inWIGrPS0eQKv7dUTrRXr8kt+T5JCvQ5qL2rMTSCebpPesddxJ7XBQhgPAblmT4a+XJmxo/c3Q6eFyVhcoXDczlfAmqZedhYXYuZmXgKENBijoXxQ0zv4lbFRTn9grB6zFRhOaud6c3El+avITi9WTdl0DP3LXPdERHhhQBr6os66BxkLGbOn3tOV39gtqXxYEg6AnHGNWvUx6hlkls2T326QLZpL0R6Om6osyQsmuLDWjzYqPjPoPig7jTQPJTJLiyhxUpZRmczFYUHc/MP09Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoVKOrdLVTCL0U4tyW8NtytCGa3TYGkchU7XCvG9hmo=;
 b=TXMgKGLgYAaZnyjACoOcGP9h4aRSy8C5WR8fYwmpQd3gKkn8Nb76vaajLxVS19qC8Mj4vKBucSjH6DKSXDFUrVf9fFyuXHno7Xtk78bnDwiahRThu7Oi7IBAxw0LiZmrxrX0Y5HZnpX30IBVfuETSJZrgLCf9pQTrCy9gV8j6A4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10158.jpnprd01.prod.outlook.com (2603:1096:400:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:25:37 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:25:37 +0000
Message-ID: <87bje2gb4v.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 68/83] ASoC: mediatek: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:25:36 +0000
X-ClientProxiedBy: TYCP286CA0366.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: d29493be-6e0b-4fc3-17f7-08debace12de
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|22082099003|18002099003|56012099003|38350700014|921020|11063799006|6133799003|41080700001;
X-Microsoft-Antispam-Message-Info:
	3pAj1DRHueyp9DS+5oIC2cMero1rMBpGWwTDWFtC+Yf7dkWcfa0sns0D7FbgjxQBaM4mjQ4kZvrBG/PVrolQI0Sq9jhNw8FqiGIBLzcWUwt8EIk8nu4qbU/GR++AyROc0YHvyMBGj+a+wVKt09T01rIsRgmoBHZiSdsvOvSHaVr7uohOiapIYG4L10Q/39keydDKqPBHRL1ijgTxjxlPjxByvKzrCZ0V33zQkXRBJkDRYEYjYMwa9xWAI7DqPMiOb29Di3dnw7X/Y0sHgcORh2EZZfrMaaNrsoo9+4Zocyf0z9ibqIez51XGT4XccLtmdmwrcvJBI3MvhGmsufHJ0bOpaZ8/yDBgck7DUXIYQInNRrDWw15u/bQJg3EWRdfoggcvvz3KQlJ1XVntamQSQu8qt50L242NP1+wDAV+l9G1FOrYE5lRiy7wPyL6XI3/S2zy+wtQVCzA2FT9ihSV/HiWrUJfWa9aKyjELdNEw1DN2rNLi88iYwbT+ZpYoLBbL59IIKA9cTc/NwL91D3KshzdM36gkgroZhgrIlhSS3vclq7Xm4GHMJd8tV0jKrt2EVphaJszRnvcEuPmibpFbbrQ9kxkKCbyzvXlHSkxuQOrPOLJ5dWsI4hofbfiYnA/xivamc3EZh9b+/QCENfeNs47TqKeHKyPVSnksfY5fnGp9cNMUnp7kkiTPnCFM7uSMQ4j2TuJ97fPngSdCzYfKnckveHjdBJ7n5UpsLrsL2wGopqgGoyljQqxZsOFxzqXRFkIoNRLnKoApRjLH5aDpO1H8orydAeIIpGH4AT3zT4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020)(11063799006)(6133799003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?St5TqEC5W6HKivFFG8lVoP6PYJgYmlVr1QdwhYKLmUis1z2U3yBpVMoyzXkt?=
 =?us-ascii?Q?yERbsGLnqv1SRkOJjqg/62gox27+rQoJ/A1B241K9k8PAsVkOklQ5XoYgZfG?=
 =?us-ascii?Q?nRHifGowtZakks8yIeJBS3l/730V+1L91vcEhx9DchHVNYjyBPBEGxJ8YKZY?=
 =?us-ascii?Q?zAZKPiqPrpLaOR6uG1HbvDwnxKCVLkVUAJkkInrnOxG+Kwr6O5rs6jT7L3+e?=
 =?us-ascii?Q?3plvuM2BtC13vEWcjHeqPPDlG4dKWT6Q5MNHRMtLDiLpLwfQQTg1CZac0g58?=
 =?us-ascii?Q?nr7dSb0/nHG7jYHT8/A8v+gyY0oWI6SYril1vx4ksDPlmjFdEnRb3lltN0qj?=
 =?us-ascii?Q?W58hhAUcesQFav9dqoEjxHy2vtdLXfk9O4coUQkWhtKvOns2MK9GOvk5Pmf4?=
 =?us-ascii?Q?oYGcNUvgCMKji3be2Vi2zc7ar2H8On0dlkIV+TMS5yPmQf9qaMdB6PzsfR6C?=
 =?us-ascii?Q?7pRBU5TZS0ozOeN1G1NqflG1OfL3JVwiZcaWH8bB2NKySWviZb68drHiClQ0?=
 =?us-ascii?Q?P27oCUUQNIldvfX/XTxZ2Ho01o8q3+vOp9V93FtKYRTjTJXKCgwP1pHdpyUO?=
 =?us-ascii?Q?3VsE2dqky2oiz606h+7LgoNBHgn52gq8V+pYcPQ3isW3z5z/GzTF9CmlIBDj?=
 =?us-ascii?Q?c2fjXGPtlWE1+Gc5GyR6oIQ+M2Ku1/w5fNRk6WnAtBMdqToAzoYfQGTDuz/9?=
 =?us-ascii?Q?uMa27ayAb4UY8SHpGb3VDZ0aFcITcq9KM5g8trDSg2OsiH47Sap+0UH913LC?=
 =?us-ascii?Q?dBz8/oweHdQADGs1VNqYKQeSXIlI+FP24ZrheG0vyQ0V1wXciD6UgCmgGKkj?=
 =?us-ascii?Q?7G41XmIKZ8RnZFiwMwcfn9hO9p6L1Nwu480UC1JfColzL75SQMWvr2c0CfzJ?=
 =?us-ascii?Q?GCpRy/Hy38XcEavDpk7wvYgauxm0HC+aTwFE5kvkKAH//Gb0aOwT/9l3DEFM?=
 =?us-ascii?Q?GdKlt5mDtMbigHrSzuDjT1c87SfJOCpvr37E/K5NLnFuuNH/5xcHkExW7/8g?=
 =?us-ascii?Q?LdomHlUly1QVPftwe4H9pf1IktjEryTTYvQgbV7saJrlJMrSfzo35TSni5cK?=
 =?us-ascii?Q?qOxMiCGfIj/619jYMB3iB1CgCIWJvKWOrZ4diQD5nmw4rBr7iKFgBv9QYRSy?=
 =?us-ascii?Q?iBNppmcotfLgMyRLOJLyIFUSxljhCI6x5fdXNRejVYjXsuk5GymFv87uNHvV?=
 =?us-ascii?Q?xdLoQLOkXa0aTjRxtDyaGPmGugKd7cVf7w/CliZI19YWPrfgVkNer2JJ2NPS?=
 =?us-ascii?Q?wq60GIFe8Mb5lsV5Sed7wI3kNOkzFhKi9Sj38nUE8bjFj9Ul44tYJ8Zbai9W?=
 =?us-ascii?Q?3HOGRkdJe7112uy2d/RoGdhxPadVRs/ropEkxdraOf/uS6KDFm4B0EwddECv?=
 =?us-ascii?Q?m6jVSAssytl3pK3fO7TliH7cE2srO4epntTtjCIAQJvk30hM6qwxPx55dSPR?=
 =?us-ascii?Q?RbCu07o8OUyMfWBemW9n4yU9ahXkT1Dem/9DUL3WNIQtwR/XgMTwgOXe3gDN?=
 =?us-ascii?Q?zxo3yxsgzsaEtCu/qb0bpS/Ser84fzaZhCjCpwmhAryRVjxHwXw9oA8KiqnT?=
 =?us-ascii?Q?AqbmPD7HejPJH7G4R0XQNdT/dmpTx29pf5ixDaInsOzCbkHuSqPZG2uYiuFm?=
 =?us-ascii?Q?mfyYK5+1v9zBv45z/qhwsxB5iZkc1Bq3T2gN7MXJMcueUdvxSHU6HDIwM/71?=
 =?us-ascii?Q?pefAdRbK8LoPQX8esm7ACSPCK3URzTKGyhdP5sknFiVn7PMb4wuEyc0Pbi9P?=
 =?us-ascii?Q?b+sYZxHqWyaUl2hRxm6rMdHzA05llSfHFIRIXYyTzhPNcS4mOdwm?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d29493be-6e0b-4fc3-17f7-08debace12de
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:25:37.7109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeJ6PwjZwTcQGGs1TNSy9QYA2rrHAmzqafIC8naahuJ104C2Hsfi2UF2NNbgKiHgBpYGChXpuVVFo0To3fsb3AWSeaUsh2TgCFLzWblLZ4eAtJ/6Bzn8g3x3jsE9WGUH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 11 +++++++++++
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c  |  6 ++++++
 sound/soc/mediatek/mt8183/mt8183-dai-tdm.c  | 10 ++++++++++
 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c  | 12 ++++++++++++
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c  | 13 +++++++++++++
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 15 +++++++++++++++
 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c  | 11 +++++++++++
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c  | 11 +++++++++++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 17 +++++++++++++++++
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c  | 11 +++++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c  | 10 ++++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c  | 11 +++++++++++
 12 files changed, 138 insertions(+)

diff --git a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
index fc55ff47b7bc6..a88a0efc1309b 100644
--- a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
@@ -361,12 +361,23 @@ static int mtk_dai_etdm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mtk_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
 	.startup = mtk_dai_etdm_startup,
 	.shutdown = mtk_dai_etdm_shutdown,
 	.hw_params = mtk_dai_etdm_hw_params,
 	.trigger = mtk_dai_etdm_trigger,
 	.set_fmt = mtk_dai_etdm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 3709100a88659..4d9bc8f9a67f4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -867,10 +867,16 @@ static int mtk_dai_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mtk_dai_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops mtk_dai_i2s_ops = {
 	.hw_params = mtk_dai_i2s_hw_params,
 	.set_sysclk = mtk_dai_i2s_set_sysclk,
 	.set_fmt = mtk_dai_i2s_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c b/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
index 0d69cf4404073..afdcd9863bc37 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
@@ -681,11 +681,21 @@ static int mtk_dai_tdm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mtk_dai_tdm_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_tdm_ops = {
 	.hw_params = mtk_dai_tdm_hw_params,
 	.trigger = mtk_dai_tdm_trigger,
 	.set_sysclk = mtk_dai_tdm_set_sysclk,
 	.set_fmt = mtk_dai_tdm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_tdm_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c b/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
index a50aa294960b1..e72e5a1eb87b5 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
@@ -333,9 +333,21 @@ static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mtk_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_pcm_ops = {
 	.hw_params = mtk_dai_pcm_hw_params,
 	.set_fmt = mtk_dai_pcm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
index 7a8890d7122f2..38c7e0ddf4e21 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
@@ -562,11 +562,24 @@ static int mtk_dai_tdm_set_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 mtk_dai_tdm_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_tdm_ops = {
 	.hw_params = mtk_dai_tdm_hw_params,
 	.set_sysclk = mtk_dai_tdm_set_sysclk,
 	.set_fmt = mtk_dai_tdm_set_fmt,
 	.set_tdm_slot = mtk_dai_tdm_set_tdm_slot,
+	.auto_selectable_formats	= &mtk_dai_tdm_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
index 4dfaa761f9f73..338be2a8f36cd 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
@@ -2471,17 +2471,32 @@ static int mtk_dai_hdmitx_dptx_set_sysclk(struct snd_soc_dai *dai,
 	return mtk_dai_etdm_cal_mclk(afe, freq, dai->id);
 }
 
+static const u64 mtk_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
 	.hw_params = mtk_dai_etdm_hw_params,
 	.set_sysclk = mtk_dai_etdm_set_sysclk,
 	.set_fmt = mtk_dai_etdm_set_fmt,
 	.set_tdm_slot = mtk_dai_etdm_set_tdm_slot,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
 	.hw_params	= mtk_dai_hdmitx_dptx_hw_params,
 	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
 	.set_fmt	= mtk_dai_etdm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c b/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
index 8ca7cc75e21dc..d8d704d0a5790 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
@@ -296,9 +296,20 @@ static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mtk_dai_pcm_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_pcm_ops = {
 	.prepare	= mtk_dai_pcm_prepare,
 	.set_fmt	= mtk_dai_pcm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_pcm_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index 49440db370af0..2ff9bf5117b71 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -699,10 +699,21 @@ static int mtk_dai_tdm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mtk_dai_tdm_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_tdm_ops = {
 	.hw_params = mtk_dai_tdm_hw_params,
 	.set_sysclk = mtk_dai_tdm_set_sysclk,
 	.set_fmt = mtk_dai_tdm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_tdm_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 5dcc8ed26e009..02e8dd89cacd4 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2485,6 +2485,17 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 mtk_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
 	.startup	= mtk_dai_hdmitx_dptx_startup,
 	.shutdown	= mtk_dai_hdmitx_dptx_shutdown,
@@ -2492,6 +2503,8 @@ static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
 	.trigger	= mtk_dai_hdmitx_dptx_trigger,
 	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
 	.set_fmt	= mtk_dai_etdm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops2 = {
@@ -2502,6 +2515,8 @@ static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops2 = {
 	.trigger	= mtk_dai_hdmitx_dptx_trigger,
 	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
 	.set_fmt	= mtk_dai_etdm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
@@ -2513,6 +2528,8 @@ static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
 	.set_sysclk	= mtk_dai_etdm_set_sysclk,
 	.set_fmt	= mtk_dai_etdm_set_fmt,
 	.set_tdm_slot	= mtk_dai_etdm_set_tdm_slot,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
index cdc16057d50e2..539095b619bc4 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
@@ -297,9 +297,20 @@ static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mtk_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_pcm_ops = {
 	.prepare	= mtk_dai_pcm_prepare,
 	.set_fmt	= mtk_dai_pcm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index cb9beb172ed59..bfa5a71944382 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -724,12 +724,22 @@ static const struct snd_soc_dai_ops mt8365_afe_i2s_ops = {
 	.prepare	= mt8365_dai_i2s_prepare,
 };
 
+static const u64 mt8365_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mt8365_afe_2nd_i2s_ops = {
 	.startup	= mt8365_dai_i2s_startup,
 	.shutdown	= mt8365_dai_i2s_shutdown,
 	.hw_params	= mt8365_afe_2nd_i2s_hw_params,
 	.prepare	= mt8365_dai_i2s_prepare,
 	.set_fmt	= mt8365_afe_2nd_i2s_set_fmt,
+	.auto_selectable_formats	= &mt8365_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver mtk_dai_i2s_driver[] = {
diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
index 0ec114a566ad1..74c1b6df4515a 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
@@ -202,11 +202,22 @@ static int mt8365_dai_pcm1_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mt8365_dai_pcm1_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mt8365_dai_pcm1_ops = {
 	.startup	= mt8365_dai_pcm1_startup,
 	.shutdown	= mt8365_dai_pcm1_shutdown,
 	.prepare	= mt8365_dai_pcm1_prepare,
 	.set_fmt	= mt8365_dai_pcm1_set_fmt,
+	.auto_selectable_formats	= &mt8365_dai_pcm1_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver mtk_dai_pcm_driver[] = {
-- 
2.43.0

