Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF462F8EA8
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762226; cv=fail; b=gX8gjNA9fLsCzPpG0t6Y4AWFyWGA+8ht0Z7IKsWPEbqJbwWI7Oj6+vIwIwFxGZ6aQwqquTt9WrZ0sF34AjS0nREUOhc4ZXXNyxHQ5QCS4XdeoYECuE7kUvFIRglMrmVnNVoNTMUuVK4HHA8/Gw+9k1lhTV2xHlPJONZg8yew1rM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762226; c=relaxed/simple;
	bh=HnlQ6EgpBuxvdJ2rGY4pPVsriMxAEzMRTyDTketqKaw=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bOsW3vj/YLBNdRX+uNkIxX5k48HQ6pPQTyA0iV2eB1MbD8WN2j4s8Mqg5OEbVzYkW4R+Dv2m0PDNpLL2tMxoCSvxYY3Si+w8kSQukLusa40qZ5omIPS5g4VkJI06RsStE9kmXNSx+gE7e+Tv4socsOFeqilu5X8xvb7nW69jQZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wr7Zl7WL; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wr7Zl7WL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5oLP7ig/iWO4ugOmrfQAfb/GttPG0F/eM6RmZysXWEArBZAZl6Q1bral1tG87mLTFDMfz5bnQTFERhbDd9xqSyQDUR5XoYietcADQSc9YWMsxusyoE8xqRLKacFNAj2yR3n4bOxqYb4spv+w51JpZGVflb5uyN/K1rv69NCYEQOLL9bYm31QbsDnNVL8HKl4ZezU3LMzPlHsvbNGqZUfGQ9KESQeM0mZlg2wcw24CEj4s1Vc8pFNLap6OJf2CSzFsOdRXvjUNWTZim6h0qCIl6fQZZ7vLOo6C5T3nc83Zj1br3yr2nye2Fomxm8DKX8PH6MX/INtKvAgcJs2N7ruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qvym3xVqUdQH2WJyRrTbavy1RJYIG6aIWi+0X/51YlE=;
 b=nDZTTjVPdl01nLTBNHZoU/eOzZbNeyQX3iqxTvamKn5FN3K6i5Po1SB9j2wmfDU/CP+ihnScsq/sZfeJ8K4y0RNQbIbRjJQTr/pFyDXQM8j9o1Zv2lPkqQRnOEQK28aMby+K1oSRrzIJoD3ILrhisaEE9vcydBMn7otgkyAi+F+mq0DM6tevm6oXzBVnUcO70HFs9AEcSw6j+FiZJ5hJCrqI8r/TA7Ef45nYzraKLJ6qL/iICzh1uqzieFWcyzdsYHS0JpujCdrYDM4tZvbVsp+seLtDGHvI+MPcmGVdlOwmkfRJBshQoxL+0mr7LuLViDv7VHqIG2I1e7pKtMxD1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qvym3xVqUdQH2WJyRrTbavy1RJYIG6aIWi+0X/51YlE=;
 b=Wr7Zl7WL2lafXGMbXUU8F+KF6i9fEkLf7FNjqF9UuCvfWfW6NwGCUujZV9OCGNx1azG9aOQ/kRiOZ46chL8JnOrNjMB67S7KvNEvCLM1GjZUZJqp+Y1WZgXLsOaEIf/h89XPq6OfgDah9X3Ato8Lv0kZKTxZ/5klpo1lxN8Vock=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13148.jpnprd01.prod.outlook.com (2603:1096:604:30f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:23:41 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:23:41 +0000
Message-ID: <87mrxmgb8r.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 60/83] ASoC: codecs: zl38060: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:23:19 +0000
X-ClientProxiedBy: SY5P300CA0011.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fb::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13148:EE_
X-MS-Office365-Filtering-Correlation-Id: 01d7e84e-644f-4056-8dd3-08debacdcd54
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014|11063799006|22082099003|18002099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	w7TLfoFjooUWqPMQgpLHwXeW/qfP/MFCx2ki+rsKhxxCgbjh3oKNVnZkwi3qeYYg4nCMmMIG7qmmiy9fVVluge8sdVA1c2JL+8851H4sksyB54BMFHwFR4/pLx/HjNy5BSY26tKnOAY4to4L9dzzTP5UuEE1yM9RamfAyLCJUkP5c4B11T2ivBUHteV8YI3rrSmMBCGK+QHhv7r/FnljsPMRqh9qwdBayLo2VUELayUALRn1AWHAOX0JpU3JWIAsmt7651igh6xRh4m2FWEBqcnH2c4AT/0MEMAaGULxMkqsyfI0sjZht+EBGe1Aq1zPwZNXeW84l4Q/SqQbKmRJwG8+ieBgMGyfenfvgE9Y2Us+JgeQLLZSZthKKlJHp3Ek++4O71rvh0TVeaLWzoDyRHBe4h+XJo3olK3mxB9DJ5865hBhiqbdlVBz0ZyxOJpSotah/96kIsV46End6Qa7GosZrxU/10gHzfIdoHM8H5jGUWldL/pZjhzKm8cKEPOUQ+CwfrF5NFDVmb39djPpS2eX9EgGJvKI9z7vjixLQxmnfIW3cCMQ4a1AHYJgjqyxjOKwxhh/g4QgptdUOR4Z2Cqf3Niwd1uUnPvE8BSa2UnAgSW4aWZN2apRAf9Blx6bU7JQXXeRJREc47EnVVYBsjrpMRcyG/t0eNIlZg5IyqmLgHbmz6e2GphiB0zciWnyURV4WJZU7DBjBKDNHYWAn00bXoD/yrRtMFYHv3aFdkUVrnua47RN7rYy95Us88XuM6RFENfwoox3TXEqUIQK+wSqPOePQz/yAYrgZScPtn4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014)(11063799006)(22082099003)(18002099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rwDfZ1SPNmrXCG+zMkp5ndONJjHUSoe++ULhBPXh9gp3TOG82wtBYdUulilg?=
 =?us-ascii?Q?NlodLlp3/lChxS1Ttz2TuBvPTP7hJbPzEQFykYg+q+uz9fAX6GRwRZmQzYbH?=
 =?us-ascii?Q?LJ2RF95Pf1+1YnWylARwIPaIAhnFyZSqEwKajrhed4ZEQl8/fFXJyy551WR9?=
 =?us-ascii?Q?xmm3EzKWfVK2oDtAkgkaWJ/VTOT4NKMmDMM9Ww4LEi8AtliP7JSEVVntDE0o?=
 =?us-ascii?Q?UfLTnrXNbKIoKdU/kkOLHdl1LUVMlKWkW0J3NZjqDh+MphhxuwrrFz9PAwAy?=
 =?us-ascii?Q?vQzes1cRVUBy2w22ltw9gSBK8zmZbjZFy2ewwSIb++6dzp4DbKvKMrAiD1ww?=
 =?us-ascii?Q?B6u9uggDcIo1Ljg/8id48U0D8zaT5O3yN7yranEuWRp6JS1qZMGsTddqYFzS?=
 =?us-ascii?Q?8dMjiEl9kum1RJj5JafjD5m6Nq7SVI5mwpw3Cd6kvGuI+tFBtNk+BQCkrJuZ?=
 =?us-ascii?Q?9IGdIhveCTX5fX6NUWhwgYYQ6RdLyjo9L5UtWqeLrlYNOzpZ9VISGL7m8GW2?=
 =?us-ascii?Q?K+ggJryr5TIb5s8dPSPFR7icfBAO80stBy6XAMKW/LHNi1LgREEv4aGg9Y5p?=
 =?us-ascii?Q?D9VaHrmjLsyjFWFJhoRWUvnmw/YmSwMiC7VA2RtjNAjOiyq9SyFYCo9Jv2LD?=
 =?us-ascii?Q?wp9AmSJiLVkNZY4KGj2A5MTxmyGTckaRZY8T8FUfK5Us7ePFq5L2KhnAr4Pq?=
 =?us-ascii?Q?MEznbhfw7dl5sd5LES1LXQsYCIyVvkOJ0AftnH7tTE1t4P6G9MPwR6JKFhmX?=
 =?us-ascii?Q?TVygYTOVOIWQZPqykAGzl4DeunGJ/iwGGJQ0Ec/YkMZBY68havgbeBMNIDy+?=
 =?us-ascii?Q?j0/x4gcpc1smdmA1x3lrcqV31yf7id2UZ6XviGWJ3n7opTCJ1/E8A0hyGssN?=
 =?us-ascii?Q?SBNdBdKtQEV/GDYp8SvW5qpjS5ZGWlrj5+5jrcpqx+hcX6LSVjJCytUXCdYW?=
 =?us-ascii?Q?VrUVO7/HR0LGx//qJLQIO03cRMXG4hNxd6Lj6rdupLCyimGp0SiLLBBybJW1?=
 =?us-ascii?Q?15ze715uiCiWHDOXS8kMgWUdEOhSchK12OUm2ek1D0MD/9J3xB+OVmV1T3qN?=
 =?us-ascii?Q?zV+7+qtbE2sKAwX8b8iIrAyP9lj7AlEgfpyvvOrOL1mJbnIzkQDGKpRmqkmO?=
 =?us-ascii?Q?xlaO4M4kwqfTdBn9JNaQtiMmh7t7UZgVLOuZ185KnIe3Itbb53cQVT0axMr0?=
 =?us-ascii?Q?BZ5SmdecG+SLzOq++Gmj67KW3Rno0O2V6GYSLF1XeiicT+sqnFrH3ueUO58H?=
 =?us-ascii?Q?Q0TFU5ZJ3R1bN3GJnABkkO2F5xGNGKx5J0iVd5W6qBS/rWDeYXPWONQ7y2e3?=
 =?us-ascii?Q?MMZEhvFQXBQYP+DBEOml4vNC5rwOx0rN/OCk073GScW8W+Xt7Lq5bIVqaBd0?=
 =?us-ascii?Q?ffXXxAm5ovl+uZ1fHYoABURNFbQ5I4a/J0qz40ARpGfUqfTVVVdKta9nFKL7?=
 =?us-ascii?Q?AZlmvXaOGRVgoy1a29CyXtCdgthP9gBdOgyFJ3PsHvMBdnHIGCyorPvqq+8Y?=
 =?us-ascii?Q?bYFJhJvAztoVTlUFCT/Myk4c7yuRWTC9AJEoy5yR+HpCui1z0RcLZyt59Ad5?=
 =?us-ascii?Q?6JiKUKp01Q8fseAn3M2jKt6WbWRWvwtvjmR1kP/E6AiPqBQJoZft3BFUwlpS?=
 =?us-ascii?Q?HOQKGFB80DUpV8IlZz5JX7R53pG/cWLXHq20wumwhuvtVo5OaQudOPFjrLcY?=
 =?us-ascii?Q?58eCUS+TOcbToRfdFY52dXyBorG68lvg/hiFg1d2kMrDvdGe3f8UwLgMamlO?=
 =?us-ascii?Q?fuWAtoP/cIPF9q3/ceN1SvuhwuKCZ6VzyJSZyyr4jHpHg5z3cf76?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d7e84e-644f-4056-8dd3-08debacdcd54
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:23:41.0625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGLMZUx16aRRHpYVLGNpRECriGb9rQcGDx42EDoC7CkRaFW9J8n2oFkRzWMw2vGpXsdPf3G3KK4+trtfam5I1WXZxF83Pu5ooA9wCFKsSqd/Wrd0EcS0HIav7UzbcdfI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13148

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/zl38060.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/zl38060.c b/sound/soc/codecs/zl38060.c
index 7de4014e626d2..aa563cf6756a8 100644
--- a/sound/soc/codecs/zl38060.c
+++ b/sound/soc/codecs/zl38060.c
@@ -337,10 +337,16 @@ static const struct reg_sequence cp_config_stereo_bypass[] = {
 	{ 0x0202, 0x000F },	/* enable I2S1 + DAC   */
 };
 
+static const u64 zl38_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops zl38_dai_ops = {
 	.set_fmt = zl38_set_fmt,
 	.hw_params = zl38_hw_params,
 	.hw_free = zl38_hw_free,
+	.auto_selectable_formats = &zl38_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver zl38_dai = {
-- 
2.43.0

