Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011048.outbound.protection.outlook.com [52.101.125.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AD5305691
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762417; cv=fail; b=miT3ZgBoWFLf6rWzaKWJbZJSqi54CmWc/n/tj4I+6t3akDIYA8jI6rPvvhGGRJ62PJMrE9Sa7rK5zBqsW0tZumwNcp3Pa+wmfFaP15iW2BXw2wIFNcjgiC/oIQtDbzkcnHUBqiUMQEj6fEfuPfKOCH7ikU92Gy/jVCfg4gQgmgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762417; c=relaxed/simple;
	bh=w+3GUCije+pVpFh3ok4p5VvxchONF0IyQXznM1ocGe8=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Tyg7DyKcCAeR6mI3+6/TXHzC1nTpV7lyGwWcEi/ffmMuW4vQMj7vQ/njqPZSCa56B0eQmqf29plLaUbc5ttUd0jM1KGtFIE6iELd7kAQu9lpfISFwcqIP1s+O9Ma8qaQR9f82YQHGMcqtOvolixxrK/EUCd24tMO7AaikhHZfxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ny6v8i/Y; arc=fail smtp.client-ip=52.101.125.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ny6v8i/Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlMOxSwjQafTvdaL9pd5iTlobiJC5EV/e+CVMoyrb9mTcCg1tUIhZr0aPsv1VtIAij21MJVNgsQL5SU1WfQFD/8elfqvpuUlA3uYmromg2KzcNDd3/8UQbWIGLGIhwBg072KXgQjSEGXLzQs3khBuFe9QhSYikogEu1uzKHwLzaw4vm9Hwbocx297ATX6x2gneSa4Fly9jTMafEQFkqaTgi905AVN2i6qLQ3KlixsR6QjlCS5zIwD8H5ttVQVVnD/7fUR4FDnTSYpTAjwkDp3eQo4ilgzibd3O9w0jttJK5pY3lgN4dBNbob2F8NVEvwR3FdWt8/Cd32nRIfdLwkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gy+qt5Ouxl7H4lGQYA8WGO5QKff8RTDGb44bvu+TMlE=;
 b=HCz+nPvHFdm5CyfMcPUd1DdcVxdx3+FE7hFjoPJDgVBtk+vzPUxW1WpZFTOLptLQygEaFMTceyz4Xddex39URHywERzIKpVUsKA/MaXevQbQnCM+ZmMHOUzXtSp5tyDbjYqTVPDhJufQOo9+LHaG3siVBdoQSeOKjui4OUVL++ig62qzgdeP32qR4ZtsHBZQD3Ohj9mQUG9qN6Tfe+MfMIuK+FlnBGHBBDfcJ/UKJZHFwctbxlKphDeL8gRhNz4ad4tAQHHHmkpubzkoYKwdSigAj3fgHdH2a5iwdLkrq8+FIIM1TgcTExl1ICFVvZANBW03fOeKRsinQUgKJhBqqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gy+qt5Ouxl7H4lGQYA8WGO5QKff8RTDGb44bvu+TMlE=;
 b=Ny6v8i/YKdw3k2oxgDONr4/tvkOnLYdoVqS2E/c4Kx0qguRlOXTUIA37ADpAB6u6WLdJKs2Eesfj0jqRvH6OSELjWyuMlrIODz03maJat+ao2TNixCnJrM+LvXy/7Hpx7Y9vCfoJiT14T+bXEBKMq/GN4OV3z/d5XYf819fRJq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB13144.jpnprd01.prod.outlook.com (2603:1096:405:119::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:26:53 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:26:53 +0000
Message-ID: <874ijugb2s.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 73/83] ASoC: rockchip: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:26:52 +0000
X-ClientProxiedBy: TYWP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB13144:EE_
X-MS-Office365-Filtering-Correlation-Id: 613bc4fc-d446-4afd-9081-08debace3fd5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|376014|921020|38350700014|18002099003|56012099003|22082099003|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	I8TlTBA0pYn1bgu8K0aJEh21EnTY+QAF/Mb2LyHeKf+e3sWULhUFm6S1N9ovgqMKHqhof++6bjpxGeJV8cZKNvbsk0FJ4k6azI7QY4NqMOSK+MJQJ0BG2MWI6APc/21sorAsWWMr+Qmb4W/efq2qjEcuhe8v4AJfi/yZrEl6AmGWGMT66HeAzVWto+UT7/Y5iXIOoqfch8ntQkBvgq0G2CUtRxXaQRHznRZbTwm2ZppW2rkVMBMOkl20MBqZTx7HLj4xLI8GUC+Pz7hWyaZarbFO27XqQ7NDUr5NTqsv3a/KMgikit9lj8bKxw8akJIIs9RMTICZkhZFXFEdON97BeZC3T5pSdSUyVXYzykVN4cBPGe5QLYqtFWX5xPaLW7rpRh7yrf/RB7bNcOnC0AjzOfgjEKpcPG3lNbj517/tzw9pr+DHUepCfz4ba3Mnz8t+tRbFYnNzeN4FYQcvDLSxm77YntwMM0OUI/nlDjpzgIwQJKM19oUg83h8r2md+qOAaTob51xYQ2NGd0Zys/glNq9M0JUFr8hHr6c4bNgcptG/npiuhgl1AdJJaD00CP1pifbK8iyJhCRB2f6KlTtsRwJCoZeAz+EWSZGV+n2hy4uX3UMv2g7kjcnsQUuaxTq9YYZR3vMGm8xbzqJqfpalysqJQegu6QrXTBkcXcvs73gQCu9QX0U1Ju+M3G+iq33ogsof/qcI/D3X/KcY46eaVUSRBDs8HtCa1fqBQYDbuVQiCp4BywIKSUvTaY2UMcwjM47JeyM3bsl96pUoIBmcAYnO4vG3UnmsV8GZLS5AQQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+K7dnkKyd1kUeGb2bteKE+ZYXEttfqeoPw6BCv4iYVu5wJWtZ1GDyM9tmDR9?=
 =?us-ascii?Q?vtAqPzbfjWo/JusQ92+SFo6gBnNnzT7++lWrDwyFneRYXgkQBCFk5P7IJctA?=
 =?us-ascii?Q?Zt2gKm2NazXpvQVKB/SSnNw+3gr23xtB63eIjJGFOvplJyGtiYl71iPK5h4O?=
 =?us-ascii?Q?2ov4hc7qWUQVUJT6bJDm8fxi813NWh5D81LttJISg8F9s+LkLY3Kwluq8LHm?=
 =?us-ascii?Q?i7wDB7gioyTDxn4ip/P8ynR9ft0AYrgggJh3ixhL5jjk0/vUxBcLrB0IrRRV?=
 =?us-ascii?Q?vkUNoKdVtmvREALYoRKeli3Y8ZP2TT6qRXXmDLfZ5j0hTk0ugJmB7waGIqRW?=
 =?us-ascii?Q?6FHGeatJ+qhIKQuKFZXQZbDnTv/MZ9DVLsH+pzQmIdGKirmg9nufHq9kzZeM?=
 =?us-ascii?Q?K9bI2QSRKmZzhIqThzJTheRnKdc72yjVS3SIqCQHZ+ULGATCjpelc9jgYWO4?=
 =?us-ascii?Q?hQYiV80/550hwnTffwPhoESkbURyIimr1dIZ6eA2D6A7e5bTUEU5sehZyQiH?=
 =?us-ascii?Q?oiuW0Z/2fIcMs8UfgxsVxmYrCnlatdq/UbQgm3c4jpqthk3GtEdi0QYOGiZJ?=
 =?us-ascii?Q?x9d7zRHxzllrB5iQtqv+pg9fVQLez4Rb9/i7A8lcpmGz/ozwgOpUAFKAc+kt?=
 =?us-ascii?Q?bhgLyAYpNS4+/XSF5kfRBh7Mt66VtX37SHtvr3PRXqX+6iIT4DhlT82IVQsP?=
 =?us-ascii?Q?cLnz3ljx9FrVr7jR77MFWnJlHNS53wvmCslekpLnlDbWAXSYnC7MOdjYsTYq?=
 =?us-ascii?Q?SFiuQSjZtcKo8bvjUlJypKCKQ6/WAueZYpfuF3JNzKg66OMk6WYSAW6q5QoU?=
 =?us-ascii?Q?FJ8Jrm8/k8893mifN99DcLfEdjvwR2jkNgS1+DG6PwV4+/jQEDY9z8wf4IC/?=
 =?us-ascii?Q?5C9ZNnK4D/EzzuVPO+noYymp2XKNBwasHQ1yvbB2tirfwrgmNIrH2dUNuHCb?=
 =?us-ascii?Q?V4uxnr0q0vsiNceLPyMh/v8G3Sn6qP/t834n13XStaTIwiwpuHM7aBNVmbXh?=
 =?us-ascii?Q?T7ENKsd614h/zdrWDAzs3LaRflzE447zN9msb6NJCzJLix0niyeMKuhAoymA?=
 =?us-ascii?Q?HpilAiXv7ZFSCy7DooRXw3clTZ6LiSzxb3YE/k0qklEpkwfuiWmgxZhuyier?=
 =?us-ascii?Q?DoEfDuMxkIfILjlg/KRKYOgdC3XP+O6Fdnc+2FmjDma3csMYa+64xhGpyFgX?=
 =?us-ascii?Q?MJykSbq4uAyJQ+x7bEQKiIVHGzNvN7xPtRT+KbHSi2/SEaZuI02e3OxNqxfE?=
 =?us-ascii?Q?PSlry2ah6i+Bn7+q+/4ri74Dorg5B+i8/qrXOzOsfEb6hLSTo2T+VUzBMoH/?=
 =?us-ascii?Q?RwX9ZY5SYnvs/Fq6UGcKG16QqKvP2ZE2m/2rvFQtVmaX54EMebawLAPx7K/t?=
 =?us-ascii?Q?103Ec54mzu0Biuxtw9/2sd69WPchSkrwhd9Xj+cl3hlKdWLRMlSesVMCuJ6V?=
 =?us-ascii?Q?12fcO7BfUeH13BoiTI312mrukNaqithz+B1iOSM6V+ekG6rmTZnFvjcIs5fo?=
 =?us-ascii?Q?qoHAgBN74Kb29h4VNKpSsIi1RKQS0wBr95LitDq+AhZ+Rvij4rF9hXw4nsVR?=
 =?us-ascii?Q?ljwuQXLIhsys+h3/98W5eRUQhyni61WXfwmO8Q9TxK7n/YrOtcOmyrhQ3znm?=
 =?us-ascii?Q?VlJD0A2jbyfydszmDvJozuH/iHS4owId9rU2lG+bFpZbS8lXwLLEz1wKskDf?=
 =?us-ascii?Q?prExvgefdiFo8k15ntR2BtFXhWrCnyfenkfa5NSuMFKyr1epkJHvKsPS/RKt?=
 =?us-ascii?Q?ixy6k0qj/a+kFcS5JstGTIrGVS3XfYdnzbxZlDH1RGsDM1mdlvyK?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613bc4fc-d446-4afd-9081-08debace3fd5
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:26:53.1318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fgno7KW4G20cGzNmVHGmZ8kvnewnc1Mpc+IqBZ+3qxQt0W1uemfdB+O9GLjx/l2162DcLE6XLFKYr6zpEi7xaEbrgDI5NoeRDpSvFMok8+LraW0RlCSs00yowDBdwP+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13144

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/rockchip/rockchip_i2s.c     | 25 +++++++++++++++------
 sound/soc/rockchip/rockchip_i2s_tdm.c | 27 +++++++++++++++++------
 sound/soc/rockchip/rockchip_pdm.c     | 14 ++++++++----
 sound/soc/rockchip/rockchip_sai.c     | 31 +++++++++++++++++++--------
 4 files changed, 71 insertions(+), 26 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 49ff86b35ef18..37d9989c90c78 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -537,13 +537,26 @@ static int rockchip_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 rockchip_i2s_dai_selectable_formats =
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
 static const struct snd_soc_dai_ops rockchip_i2s_dai_ops = {
-	.probe = rockchip_i2s_dai_probe,
-	.hw_params = rockchip_i2s_hw_params,
-	.set_bclk_ratio	= rockchip_i2s_set_bclk_ratio,
-	.set_sysclk = rockchip_i2s_set_sysclk,
-	.set_fmt = rockchip_i2s_set_fmt,
-	.trigger = rockchip_i2s_trigger,
+	.probe				= rockchip_i2s_dai_probe,
+	.hw_params			= rockchip_i2s_hw_params,
+	.set_bclk_ratio			= rockchip_i2s_set_bclk_ratio,
+	.set_sysclk			= rockchip_i2s_set_sysclk,
+	.set_fmt			= rockchip_i2s_set_fmt,
+	.trigger			= rockchip_i2s_trigger,
+	.auto_selectable_formats	= &rockchip_i2s_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rockchip_i2s_dai = {
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 28fa253a51877..692b99c82d481 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -830,14 +830,27 @@ static int rockchip_i2s_tdm_set_bclk_ratio(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 rockchip_dai_selectable_formats =
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
 static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
-	.probe = rockchip_i2s_tdm_dai_probe,
-	.hw_params = rockchip_i2s_tdm_hw_params,
-	.set_bclk_ratio	= rockchip_i2s_tdm_set_bclk_ratio,
-	.set_fmt = rockchip_i2s_tdm_set_fmt,
-	.set_sysclk = rockchip_i2s_tdm_set_sysclk,
-	.set_tdm_slot = rockchip_dai_tdm_slot,
-	.trigger = rockchip_i2s_tdm_trigger,
+	.probe				= rockchip_i2s_tdm_dai_probe,
+	.hw_params			= rockchip_i2s_tdm_hw_params,
+	.set_bclk_ratio			= rockchip_i2s_tdm_set_bclk_ratio,
+	.set_fmt			= rockchip_i2s_tdm_set_fmt,
+	.set_sysclk			= rockchip_i2s_tdm_set_sysclk,
+	.set_tdm_slot			= rockchip_dai_tdm_slot,
+	.trigger			= rockchip_i2s_tdm_trigger,
+	.auto_selectable_formats	= &rockchip_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_component_driver rockchip_i2s_tdm_component = {
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index c69cdd6f24994..7734c30969850 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -377,11 +377,17 @@ static int rockchip_pdm_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 rockchip_pdm_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rockchip_pdm_dai_ops = {
-	.probe = rockchip_pdm_dai_probe,
-	.set_fmt = rockchip_pdm_set_fmt,
-	.trigger = rockchip_pdm_trigger,
-	.hw_params = rockchip_pdm_hw_params,
+	.probe				= rockchip_pdm_dai_probe,
+	.set_fmt			= rockchip_pdm_set_fmt,
+	.trigger			= rockchip_pdm_trigger,
+	.hw_params			= rockchip_pdm_hw_params,
+	.auto_selectable_formats	= &rockchip_pdm_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define ROCKCHIP_PDM_RATES SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index ed393e5034a49..4ee2b01ce7a99 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -956,16 +956,29 @@ static int rockchip_sai_set_sysclk(struct snd_soc_dai *dai, int stream,
 	return 0;
 }
 
+static const u64 rockchip_sai_selectable_formats =
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
 static const struct snd_soc_dai_ops rockchip_sai_dai_ops = {
-	.probe = rockchip_sai_dai_probe,
-	.startup = rockchip_sai_startup,
-	.shutdown = rockchip_sai_shutdown,
-	.hw_params = rockchip_sai_hw_params,
-	.set_fmt = rockchip_sai_set_fmt,
-	.set_sysclk = rockchip_sai_set_sysclk,
-	.prepare = rockchip_sai_prepare,
-	.trigger = rockchip_sai_trigger,
-	.set_tdm_slot = rockchip_sai_set_tdm_slot,
+	.probe				= rockchip_sai_dai_probe,
+	.startup			= rockchip_sai_startup,
+	.shutdown			= rockchip_sai_shutdown,
+	.hw_params			= rockchip_sai_hw_params,
+	.set_fmt			= rockchip_sai_set_fmt,
+	.set_sysclk			= rockchip_sai_set_sysclk,
+	.prepare			= rockchip_sai_prepare,
+	.trigger			= rockchip_sai_trigger,
+	.set_tdm_slot			= rockchip_sai_set_tdm_slot,
+	.auto_selectable_formats	= &rockchip_sai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_driver rockchip_sai_dai = {
-- 
2.43.0

