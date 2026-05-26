Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579D81FDE31
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762399; cv=fail; b=fOMPmu0im0bE0VUS8AEA/SHx2/9WtTAmQLOdTZhU4rJdRdNwb/F35+Xj1HCyyhZrJc6v5s/A2xn0Omm2A3+Q6V+PxEDgb5oOz6jjkdcRp/llCTjDEB7ejocmibPCpvx5959Q5/v9TdT1Kh5bx2KYo2+BYR66jCmx5vzJeSl+cOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762399; c=relaxed/simple;
	bh=fPa3OlD0u3Q1tWOwWb3gvymgTz/icecLgvmXWn07v90=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lpfp2USfo6pZIgY76hGjBv8KMZCE1P+GNjviJX0j8ZJui1SGOhORzr+eRWPcVlq+knpUf3vPmQrU+wUTl/xwoZ6ZUbBDH7NuE7Sp9ZiPpc3XE8rFTM5MKMm9HGtNMolXd4UhpEKbXdusIPS8v2gijaZQM7Pnv3asorCm49uPIpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VWd1r4uP; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VWd1r4uP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NptU9V9l1HL6JgaTl/kP/fHg3oHG/1RWqFJL2l0Svi+peTvVoN9nn2OJhF5djeXKG6QjPJKo2ZXe6e9wigoyjLYwS7B1VitsBSbAEagoftL7He6H79J7q0sdL95+N3YHw2xSOf/3Z8MnwV8SONRJArUreI/5mmTADZdkHuNoObAbTCFYefXavpXCBkDu6oDOfz3ADw+jhjp7avBYvfw6P+T1nXsCRugkkBRbjxgGvLWIU9fqbNUNSNhf37cBPOoVNgQ1wf6KNxFwM5bjQQcLcBTLsqeUMJ4KCxK8CKhN8seWaiauYzaGgXpwqmOpllZxNPSqXF3/K4LdxzTGZ2xlsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4iKaUSXTt0EYjY16pHVjXJ6BUZubqJd6wZ35HEFjaE=;
 b=GK0IlDW3ESgMG8YcL3u3z1xxOHmfP08ah8Ieqfn/XOpdiEgxkHzRpQ2lWcgC9db6j7lWCG0P7ycoYfMeKXbLsMECxm4IQxdaww8Q/KB1Sb2UuPRssFg0Da5mEDV1bNG21Vz20PtSBTjFNSJu7nsLoRDR/t6Z+9dwWUNKkyBv7lNjS2nwpfkS498qqJK61+Evy0kxn5GXxB1do037rOPFFCC+5oUxJzfijB41k4Gu0w+XggHkmUAI2ZSdnTYB54sQU1EQXWXEEWjh1Xg8vi1XIOYFO03s1+EhRqXhmkijTdwn/qQorO8z3rTKCIhM6wwxhWYyZrSbGLaWhXGlw9jY1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4iKaUSXTt0EYjY16pHVjXJ6BUZubqJd6wZ35HEFjaE=;
 b=VWd1r4uPRoa+fceOCrwYUtitf3d3clEzDCwbFKbduuVNVfX9Dqmwo7vVSyxvjswC6ZehVDLZKa3wWkFjM8Jsp1u5WbGSytW86G9PFTXGLoL2FM0AC/izS2DHiwJJG1HaXP7jeS8GajemvvWtVOvuBjSwJyUhmhfZjMp3GLcncJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB13144.jpnprd01.prod.outlook.com (2603:1096:405:119::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:26:35 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:26:35 +0000
Message-ID: <877boqgb3b.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 71/83] ASoC: pxa: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:26:32 +0000
X-ClientProxiedBy: OS7PR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:604:254::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB13144:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a6b637-28ba-4901-b9bd-08debace3535
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|376014|921020|38350700014|18002099003|56012099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	X5LzsVx6exzogVQhdwEFw5716d6RUIo9UPh9Z/5VstZVa2wgBk2FD8XbdgixA37JVB/CjgYZsgQnzC9cAUrRayMx74sLpgHccyQh8zgNG9Q0sguTnuZzgSQ5zb0PEOTrLOxND82DxP0peEP2gEdzajmYvBTKcXyKo9OgIzOXdUfSqlm7EUGkcPa3LN6OWRrrYPbJlaNKlkIrZgvmVxDUrsMFn0nziLh+eZZXhzEJMIfyai6qeskHBm6r+4PxbyJFaQn+E7Qxqk9qkYH7l9WZUVEPaYLVCz8ySVCIfTQl1FctkZV0qIrOb9v2hL7wxgzhbFnYeMOO2ND34CBe9Q3zzlWH21smGOtb9ZsTavKICmgz9oj8VdXl8ZOiZbxXqJyDo8X++MPKA1txzrqMqbLEXzAcB2zIyUg81kdTvniCzNYTCjpB//6MSxX7qFryOdF8eAGOEPX/j8XM7JtM42CWneFOSXoqLXNU7ul+cjhbh1LpXX3CNXDs8YxcGuLsSp2MEroAu9ZhppX1s4ZgKxzA6Rw63/+4eyGHkjP8bmcNxCrVb1k/aCxCnxsJ/W07ZlOz1EIgQE5g3ZcmmJXtKnrg5eJfvW95XGp4LDFEl2uBlBK0X7MW1kHuMntx72mb2xLqJgAPv1DexpugULO50iW3gZyFJmj6EiEU9jn3w51pZm572hX3WtD00NUoQONuWuPciIJFiNEncWGS3TSn1RfZsJO0jM+4Kv3Q6jz3/eIZQNmpdIPzuFB1cLITNR7pIm7hm6Xx0u/m7EnNKQQsmX1io2gJAKXz3JnCbmp7xd0+lHk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?scRxyslTJfrKcg183I9xOgSRBmZ8OTI29pSrUHgdZ1Z139g+Ojh3Zyt0oKr1?=
 =?us-ascii?Q?TXnLDHSGxWzc/wtmWtfiCJywtbvZ9dA3/8O7lVG7kKS0lwqFI3lZOIJuf99l?=
 =?us-ascii?Q?81gs6J27iyytxm+XZie2bAjc8EVHw+ixcdEAmunMrE2o81jgQflKw2shA0Gu?=
 =?us-ascii?Q?Ll4ssiOA/PeXUMMYVQV8mjQqgafDID7zNwXuRTzvILzZdTqiocKefs9SjCE9?=
 =?us-ascii?Q?R6fU5VFXQ1XATJSewcUpHslSYHXiTkLXAoascgT0SxTl4gXO4pCtRPcFqdkD?=
 =?us-ascii?Q?bxStw6oavBE0SrTri9QbOqiSdNRfeXQzBW3Q1csm78e6xbYDU2iSaW7BVFtA?=
 =?us-ascii?Q?13tZWYkGjh3MKPec/sb3HJXIfw75UDw2pXAGAeRFAkarwKJQEqY/Szmqms5/?=
 =?us-ascii?Q?92h/A9npQ7PQCGa/FQZ07oAM0zWsTnPBtulzxEc3vhDxEJxEw1s/tWSMZiYI?=
 =?us-ascii?Q?2a3ogVEvXks60DmInwU6gjJVU/kN39iQXfdy8DKU15Sf7GCVnn0fX7k1fYTD?=
 =?us-ascii?Q?02BCQk81wuLOZg4mehuV09JdJTlfQFLN/Z2sXAhMVW8yPt0+nTjHG612RqQf?=
 =?us-ascii?Q?MliMexN+eLUib0o4WY8iwptVlRmnDE3TrMQCqxV6WcYurN/kIEC205Nc7qWL?=
 =?us-ascii?Q?eaydKmubOyeARXdE0maQU95oxyS0FdP5+GTN9nhIM1xcZLbZWluZ3DBmPuML?=
 =?us-ascii?Q?UUg/0c884RPDDAjP7aVhw0rq9ddFN1Jas2Naxl2swg0l4FoiewYNRIp3SjVi?=
 =?us-ascii?Q?z6NZ8DS3ZKE+giPE+JP9gLD18oIEvJF1jdtXJ0+j3IuiGSytauCMc2LRQb54?=
 =?us-ascii?Q?fq7oz5gmNFZZFMe0HWMhOJXhf2gyJWz4l5YXzu5fe11O83t3aDl63EjKC/0J?=
 =?us-ascii?Q?Vcet7PlaOyiSinKK5CoInCnYp2NQqMc92nDbhpIw1IxyJwoH1N3ORm95xgIw?=
 =?us-ascii?Q?Bh4RhsA5ESXCvSahIFlKK/ZjzpGpcyYAbbwm4SSFWF8XKjJ4qBCJFdnpzWLl?=
 =?us-ascii?Q?B5H9evMvgGiNuvuxS5xOaYsnEXG7F+iO+Dvla+QyTBdBr9He/oyAsQyWYlvo?=
 =?us-ascii?Q?cWqFHQml0asdKxvXf3jM+FZjGc+wRQWNFKwrDfQAgo+9Yxed4WCkXU0hpphb?=
 =?us-ascii?Q?1PFPU/1iK+NVXSjUdsyxx/Wkk2pqfRDgNnD/mX/dRAZn5NSUd/+FsrNka7BP?=
 =?us-ascii?Q?zexbOYMcEidUdvdM9cl1Rvc8lhGOn2csf3b8N9RmbuUWM6k1oq1mWgJajCvc?=
 =?us-ascii?Q?9qVUBz0YKiBVklMq5ic0aiyKmhH/Vwp2DjQ04+x/0Z+UNvb3mp76XARXIzQC?=
 =?us-ascii?Q?2aFmIitq9GicBRt3A78x17q1lruuofw1QioGNUf2Wrt/is94eZprnQ/4Nqfu?=
 =?us-ascii?Q?alOhSRzGXhBBYRk5+uZ1iJWPPIBqiJtzmIGQYyAU2tL53EyuGb0N7EFo7uwk?=
 =?us-ascii?Q?roFyY/DA7w79gFhkCSaeQ/9opLHSnHes6D2jAfRsIeSbFD/1RLA6u0ehED3v?=
 =?us-ascii?Q?AeCrtF0SPgAJV+K5DangnFxyNumGnCtn2XUbLxv+dujaXR6MzNBnBqBRkk7M?=
 =?us-ascii?Q?qPqW6i+nJBCLrs6Ug4hB5ErC75a6Q145FgzMCs36OniPEQFkY7Cv/+zzCsv7?=
 =?us-ascii?Q?dQFMoWs/H0JAnuOfaxZTUxW21pe9UT3qLKY/jB2BTf3yObY6VXH2KurSiz/D?=
 =?us-ascii?Q?J3meT5LSNYM8xlqz1KkWP5DZBq0Rfw8vIVBIiSKFIvnTS0uhrl7kV1T4J6nT?=
 =?us-ascii?Q?kUhXFs6k4AH/8vJ6K33bAJ54qeBnhvVMnT7gDeGBLb4hjLhaIQZe?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a6b637-28ba-4901-b9bd-08debace3535
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:26:35.4106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ka/tmRbeON7kBhdui55CP0N1tW5wnRa7x6fnD2d7hioZt6vIznZhBboc+g7aMywnv2Z43WS7hAICnnGQUcWz7QghBOpmpMTuwkby4CICYhx7svsauidQYwj7lW0oLNCg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13144

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/pxa/mmp-sspa.c   |  6 ++++++
 sound/soc/pxa/pxa-ssp.c    | 11 +++++++++++
 sound/soc/pxa/pxa2xx-i2s.c |  6 ++++++
 3 files changed, 23 insertions(+)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index fbbce81680cf8..f9066fbdd5718 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -339,6 +339,10 @@ static int mmp_sspa_probe(struct snd_soc_dai *dai)
 		SNDRV_PCM_FMTBIT_S24_3LE | \
 		SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 mmp_sspa_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops mmp_sspa_dai_ops = {
 	.probe		= mmp_sspa_probe,
 	.startup	= mmp_sspa_startup,
@@ -348,6 +352,8 @@ static const struct snd_soc_dai_ops mmp_sspa_dai_ops = {
 	.set_sysclk	= mmp_sspa_set_dai_sysclk,
 	.set_pll	= mmp_sspa_set_dai_pll,
 	.set_fmt	= mmp_sspa_set_dai_fmt,
+	.auto_selectable_formats	= &mmp_sspa_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver mmp_sspa_dai = {
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index f8054c1c59fae..5a27901bf4a5b 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -812,6 +812,15 @@ static int pxa_ssp_remove(struct snd_soc_dai *dai)
 
 #define PXA_SSP_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 pxa_ssp_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops pxa_ssp_dai_ops = {
 	.probe		= pxa_ssp_probe,
 	.remove		= pxa_ssp_remove,
@@ -823,6 +832,8 @@ static const struct snd_soc_dai_ops pxa_ssp_dai_ops = {
 	.set_fmt	= pxa_ssp_set_dai_fmt,
 	.set_tdm_slot	= pxa_ssp_set_dai_tdm_slot,
 	.set_tristate	= pxa_ssp_set_dai_tristate,
+	.auto_selectable_formats	= &pxa_ssp_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver pxa_ssp_dai = {
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index fe1df78926f59..008cf5ae2607e 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -328,6 +328,10 @@ static int  pxa2xx_i2s_remove(struct snd_soc_dai *dai)
 		SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 | SNDRV_PCM_RATE_44100 | \
 		SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000)
 
+static const u64 pxa_i2s_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops pxa_i2s_dai_ops = {
 	.probe		= pxa2xx_i2s_probe,
 	.remove		= pxa2xx_i2s_remove,
@@ -337,6 +341,8 @@ static const struct snd_soc_dai_ops pxa_i2s_dai_ops = {
 	.hw_params	= pxa2xx_i2s_hw_params,
 	.set_fmt	= pxa2xx_i2s_set_dai_fmt,
 	.set_sysclk	= pxa2xx_i2s_set_dai_sysclk,
+	.auto_selectable_formats	= &pxa_i2s_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver pxa_i2s_dai = {
-- 
2.43.0

