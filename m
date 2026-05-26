Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA142F7F11
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762164; cv=fail; b=GSOYjkN2PFIU6Cp4dIoPP7Wd0ZMgm2lAvZLJe0SjERzleEbFicNZHj0WazAUvcYSpcQONJrxRL28p4CcPfS5wsdJTkpAFT9vSd8KEbal00mDtMgeIMRwKjk4+x6IZJ/14fAJeftxxoTLmCAjVjJqbIeMTe7DtU+SmahMHocVYfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762164; c=relaxed/simple;
	bh=QUojBtFc3CrhGYSdDC+lF7yBD8bS9zIKEkVxlmrzuN8=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RlLG9sMWl52/SJWSLBEglxvRyPGliSjbeT6lIitm+Re5tDvFQh1CZNdu04/ACcPpqPMXym0Q9rsLorIyzq6MboCO7TSpXYwPwOZ255rYEBSFPO67JqqYo8BkD1vOPa/HNv8knGy3dPfhM484olSKhVSfXSnqkSaS0qaWRDi8quo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ffa/aS5P; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ffa/aS5P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2ROvxfXNvLqA9DX2ZdOspJ27HYRNrOBiEIF4nD18o7zYJe+toRTnDlkeDDhYo9KI3gbz8qoj/I/Yu29+gSUzQhbxnm/eUlbeY85Jv8YQPXaiZr2gUeT/lWl73OYZTftYorMoEN27YYmm8BxV6EUZbydQOVjIR6oKvJnHau5ZkT+asIjeKlA0QL5KbFP68Fdj5e5U7IHcXTWaV5TSugGM85vEfDxfs12QM+iSeloUUX9dUGkyVpvNZwJEFHa521ub8ADqpFiISVqN7Tbre3nTlv84a14dq+ytSr4MtWU0xsDB3a+fMrfkGfshwGOwL7THvjyH4t/fnhBhw0Ys+SWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSS2gPR0gBxDugL41vCg6mKUr10zbsEox8dShaLfzoU=;
 b=gjKuKtT7Z5ET7h22ToBuj0mlgoAGlGnFd4FqvCQPm7JlalC3jfB+9mLMdI8gNnP6coYEsluJSU7MNCr/dCAexLNQOPRlQKGd1V+IgA/6GDM0kEVvUEkZtToop0Erw358mCxnXohC9KAd/6uJ8ikdyCl3y9rkh1wTk/9waixYQnN725/jGwmgJL/6nmTFZU/obmQNR4Op+tujU4dNn3Xvpyli9esL8m4XLR5cbZvxHwc3+NaOTJEScjSuIIzg/wTuIiuP5/H7ylASREwJJP9eePNkCOweMLMuxZaWBL2aVg5kc4NZyjc+EddB/RwyxY/jRPXKwSMUoSbFru+rhExg+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSS2gPR0gBxDugL41vCg6mKUr10zbsEox8dShaLfzoU=;
 b=Ffa/aS5Px3TOIhEazDCirEglCgjyKLWfd98//MVi0f44DdfGbmJTPtGTbLl+mWzQk2RIT9PQ4oPe5WA/jhbBn+vxCxe3h5/BkKfYIhqwWnFds2eK1YYpOC4aNa0Cr8kXro+enltE1IhbpmhbJ52TuuD+jpdYLJKR9snz+EKexY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13148.jpnprd01.prod.outlook.com (2603:1096:604:30f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:22:39 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:22:39 +0000
Message-ID: <87qzmygb9t.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 57/83] ASoC: codecs: twl4030: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:22:38 +0000
X-ClientProxiedBy: TYCP286CA0365.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13148:EE_
X-MS-Office365-Filtering-Correlation-Id: 897e6494-2bc3-475b-c688-08debacda879
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014|11063799006|22082099003|18002099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	sFaZ2xXdlvgWq/BShFnHKvsiTWaXPot7EWdseaw4xyIXNFGRB01fIt+lu9E23vzhnEBmUS7Adb4kdg+dOf22UOmNqIa9cOvhC7nA1J2RCcqd/l1faatKkN5SyzopdagFcuOx2A4iJiZkGiV597CpO+5O+XtdiBFdrWzwxFu4GRDzyori7ObQKgvoZFGbPUqVdAkrSba9H1jtRyB2buIfSuVNOLaLPCe+CnqzwP8I2zHwGDvxu+EElnqcpO0dAL6BtOBb4eCowiCjKEYVNd+iaeu+93pgoni1amO/Fgo94qF8tSqCD+6VwjfzILLv/lszv6cKFnJs507ZucOPYP18d3/wcia3NG4RMPGbYoczry+Db8OO9CFU5WCfo5d2jV7nReM81U5j261Glt6kOdKaJO3N1GivozQAEglpn+JkolT+CG7crCFkYjLGOXkakBOF8TLgav/qFAqM0qG27YEfJOhLw0bgPZrLrRimLOs5HMhu3r8WejKismJuvicqSCbN5AXkan2LL0Bpr9k9Dl2foUv5iFp6PoAp8ZK9sLAUpy6QB7dcVlBMhOfOL9nOZlcTcgO8KXfbKILh/pPT6aInBRFaTsykjL57KmyeS3ZW/yCluGLpwyGDis+YoZDmFInZCLkRQt+O0BgY/KHxG89jRu9lSB4bksqfHVrwpdtVfsnVBo/q+TxxXuPsug5pOjHPmFIR0UeBoS5vOAJYrc0WYJIKOKMkTUsSAqeDc+Dg7rvaIUgAfV7rwcFzSPlPldHMkKcvsenLT7qgN/FkhmlmscSIytik9eCAqfRXFokJGio=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014)(11063799006)(22082099003)(18002099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ByI17jwkBYT4tJPN/Q2d0iB6YRPJIgao0CfftTQwxUU5zHlG1X3BmOIMd+EH?=
 =?us-ascii?Q?jwn6m2DC8XkNNH9n9bFAw+U+dVYswIVPMJV7S8ag22tKjJlVIQEBxjpXsA+v?=
 =?us-ascii?Q?kt/6tEClKzGHBbwW5LaSTuPCMtJB50OXmev7XR9qbkAGzHpncD6FrbRFaPuI?=
 =?us-ascii?Q?/b+dN8H6UZQ4WuRNpOTDfwtOBz7R1SUXtU9BMfJrFOIbufNxsUtGYjxnGEId?=
 =?us-ascii?Q?Au8qt76qDZXXtpuRzqYVJU14QVagQ7zygRJ9+HpTBNRks7vj/Qoj3tLsyUeX?=
 =?us-ascii?Q?IbdbgnKvbodF+WNv56UXvxwon5dm7n8Q+6Le5VH4vJwct9pMsHhgafO8h7Ue?=
 =?us-ascii?Q?EBoll6/gPzi+quAKr6FEHNXekzg5mVxqQrx/dyn5XYNggCpS+y4EbqscRRBc?=
 =?us-ascii?Q?gr5blfgQjvpqXYue4wX+IOhAsgG5bf9Dj/BJ6Vih+lpGnjPuj5moX6e+HyE6?=
 =?us-ascii?Q?FLJI5CvSz6tORFK/7bf10zK0KQ3YHr8EC27XWaw44ps1wJbtJVzHYMfT9wyc?=
 =?us-ascii?Q?+mP5tJSw7yNazuOEG5RF0LbY6GK55Oi9Sk9fEDK7cHVcMwNoUXbqawPJaCDl?=
 =?us-ascii?Q?lxd9YmUMsji1uyN5jVBn7ndAt9UeaokI1aFKJqJ5GrR2KeFnj8QXZKh/qMyu?=
 =?us-ascii?Q?8TkIBxRw+GF09rkVwgWRpKRyBoLsK6TpGXYqeESuN21uC05ab03Fdg+HkhEy?=
 =?us-ascii?Q?CqV4Dtawiorz8ZgzSoffhoObSmAs8CmMFZKyrejKoh9Ac0dNflF97OU5Z+D8?=
 =?us-ascii?Q?YuRDwvsEta0C+xhwMNawlUdH0cjNRpznzgznhWuB+0FNve479Z7ENI2BDghy?=
 =?us-ascii?Q?1kHOU9i4bwfTylhiQUWS25od/Y02sYj91Qi+BodDLpyk2h4RcClrQ+RKWd1n?=
 =?us-ascii?Q?q+7vLZhI8/2HJz8XnafF6BBLS5QiMhwXMEI260SMadb2tpZK5U4pAx6O+74i?=
 =?us-ascii?Q?qui1Jo9kXaBZwzwgAVZ8yuxPFwd9Z1s1RjitWoXhjssSvZjzw7T26JH0eymb?=
 =?us-ascii?Q?mX9weN6QCqoKxONlORp/Ir2+m75InJHBUltdV0wC1lP50/Lpz4REhglVzWgD?=
 =?us-ascii?Q?ndnnQU8coA6dfz6PFqJyq+f7mJEiNRyaabZNca0wF9H2fdRPZarJFF/2KH15?=
 =?us-ascii?Q?1j9LiJR6TQ/a/LgI67BCOb65B8oOfmpUGETd15Q/q5EEp5AsR4+BDm9f8gu8?=
 =?us-ascii?Q?oLss3XUn7nnsC3ytSFUMwXxLhnnDxNet7VOYK0hymVL43LXYm7dWAUzkRM73?=
 =?us-ascii?Q?2YhARzFKjImI3Wxz8B+E4EtZFr3psUMuOb3LHMorYdMrRyTiFtIb4lTp/dm1?=
 =?us-ascii?Q?rU2kc8BBuzZ97a2c9IqUESCZSR3tyzvDBxMV/DXsTmzCYHtVGu/UHkRj8W/q?=
 =?us-ascii?Q?C4OVruGPUXOUHuvK+PAtbRuS9f/9CO+1fsEvzvnzzKobmVZBSRFViLBvNGXW?=
 =?us-ascii?Q?pn+sebPA3MsVjsN0y/NIP4zT7BEoKXXJDQM/SRf8ZNendArKTYr7a2NvWT1I?=
 =?us-ascii?Q?f/7nZA4vFJ/1yOuzf7NMM8Z6RhEQ1ieCclaVkxqYraV8Sf62Yv59eOaUwAj7?=
 =?us-ascii?Q?n+jGipE8IK0NsJs5wAIi6mZyT0nLInUfyDrDt5vRie1NvF1/EMMST8aYMXFM?=
 =?us-ascii?Q?eTE/f1PFw1C3gnKmYRMdDRB9qPaL7rk5V68GkmD1fynh3oomPkC6oBcP3fNi?=
 =?us-ascii?Q?mETBaWR6ix1S3HYCd305ATIpBtx8SaOdfP+2Og8buiMBwCkVDucU9BFuONbg?=
 =?us-ascii?Q?Y8vSlHCu+DIOc8eeqUjx4qdqIGDMeYbkvGv0yB41O5Mfig+S+ek7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 897e6494-2bc3-475b-c688-08debacda879
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:22:39.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmfa1GuqTf9TkBl0Xu33uAYGQHFqGzPXr20R+zhaeQ7XsGXytCHnGpierQr87QueWRZ1uB+QM494yGM2W4kffEOgQw6+H9Eth2ep5yfuPDHtd3mVFTS8fe88jEQKhTEK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13148

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/twl4030.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 9476cdfd4dde9..345bb6243fb89 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -2097,6 +2097,10 @@ static int twl4030_voice_set_tristate(struct snd_soc_dai *dai, int tristate)
 #define TWL4030_RATES	 (SNDRV_PCM_RATE_8000_48000)
 #define TWL4030_FORMATS	 (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 twl4030_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops twl4030_dai_hifi_ops = {
 	.startup	= twl4030_startup,
 	.shutdown	= twl4030_shutdown,
@@ -2104,8 +2108,14 @@ static const struct snd_soc_dai_ops twl4030_dai_hifi_ops = {
 	.set_sysclk	= twl4030_set_dai_sysclk,
 	.set_fmt	= twl4030_set_dai_fmt,
 	.set_tristate	= twl4030_set_tristate,
+	.auto_selectable_formats	= &twl4030_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
+static const u64 twl4030_voice_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops twl4030_dai_voice_ops = {
 	.startup	= twl4030_voice_startup,
 	.shutdown	= twl4030_voice_shutdown,
@@ -2113,6 +2123,8 @@ static const struct snd_soc_dai_ops twl4030_dai_voice_ops = {
 	.set_sysclk	= twl4030_voice_set_dai_sysclk,
 	.set_fmt	= twl4030_voice_set_dai_fmt,
 	.set_tristate	= twl4030_voice_set_tristate,
+	.auto_selectable_formats	= &twl4030_voice_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver twl4030_dai[] = {
-- 
2.43.0

