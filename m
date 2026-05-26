Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61312E091B
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761375; cv=fail; b=OdK1tNbAslSPeS6KZ4NfdvFqgHm5vuectnhI28EuvLyqxSn+S85/fuWR2wX8XBE8AcvVuK/3e7gPxavePGKv/x4CqqWa69/FgYS5peSLQd0z8BcCu6HlHdWhLM5WdfzWdlO1yNZ8tqn8VRxuW1JvRyQZ7Q0zUMxFsOMNoJJF6+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761375; c=relaxed/simple;
	bh=M7A7Ide2FzHIQVE2gR6Sa71/cz54nWrfiM7mAAy9Hcc=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=krbqT1bywKj1wjtJoxfWZIj4mhVSRlcYg7xrrcspqfW03i9PvFCyf8VwLVjoCHpOBqD7FBSSNAcrSySw9pbRlAoX/LeIgUSlZkJmigKgp2ovdTbDRQnlpQMZA+SpjMWUCHBhCApK3pH9zjv19KI5btQMFeDpCb1IKwK9S4bTi7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KkBg8jEH; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KkBg8jEH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIgiYZyAxHHxq6E/VsDtg4f4J8jarGgWH8ADIOf6qT/UT38qj7R2adrOV/vV18DhDNHseP+2JjRWs2UvYadRTVUrdpI7oy76+4Rl6bHq4YwGjDPuYv0SAJqYLUGgeUZq6EAREB/+2+6QMQh7NWtxkioiFcMvEVmObe6H34GlsqUWexPNu1eUTFq6UQS5ZmXaJ5DGrcXKj3ElPwS1MNRT9D6z0tP4cosJ9DdzC002wl0LZvnEPooM7de33qS+wdSHU3OPYdF6wZNXwzXY83CySjeJV827EZ6LiE9AJU/CCYgxEljLQ+jcE/0p3xvSxV7NDL+bfAp1r9FcRl7isgUhow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3u+Dq3CfZyBfap8ZAT1sXqaqnFbA77HeTbPvxNLDcg=;
 b=RaB7yDx7f3rDtCDSIpeOW8kymyKx+9Yews6mWDEEIAYD2qF5mdglg5YhYbGMDX7Gbyzz73/xRz/oHp5rTahdcobiop4JlFNrXEuZfbO+33rRHBA1Iv0gK/Bq+q13kOaBV0+kPpDe85uHNcVTysPUIzexgl00siRZIcCiXJS6cdVdUyul0QmarAjnFg7M7fzof/7eoodR8fub/YwhTEDhjndIJ/mVzA2fNsdEDiSE+09+ckG94tF7dMbjRki6V9CC1Jm4/vgy1LQXvlDcSmRCTQcbW11HpjCc8h+okHF6A9gN8UE4q6udN6gb+pdIvpRXLJc7FC+vRrgCT/EKXrGFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3u+Dq3CfZyBfap8ZAT1sXqaqnFbA77HeTbPvxNLDcg=;
 b=KkBg8jEHWYXw8BGjTJc51YmqSFCqMIYgXix/wuoM56DgBFg9gW7Tvey4nsFjlD/m0cmv70ISP2z5CXXMToxjCAQGZuP236QaYceequrlIXKLPr0M83J6QS6cJOQ30uG5V2MnnDD4PGc0DuMM82TEY5JguaDrLxJw9UWtHPWr8wI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB16271.jpnprd01.prod.outlook.com (2603:1096:405:2ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:09:29 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:09:29 +0000
Message-ID: <87bje2j51j.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 18/83] ASoC: codecs: ab8500: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:09:01 +0000
X-ClientProxiedBy: DS7P220CA0034.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:223::32) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB16271:EE_
X-MS-Office365-Filtering-Correlation-Id: 872f87bd-ac57-415a-743d-08debacbd1ef
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014|56012099003|18002099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	2Yq0JbIYiTKx/XEf61GWTjYNRPc2r8X9JC83zL3mFnmehyVYjV0DJGOBu+1PRCMFDDOPIjfsin6J1UXpoBOVT+HttJ0ppz2eGYcBKeHt0XxgRRe4zjffDOWNfSMvt3gklk8FEsTxGU8KEZz1zrzNcNEdI1u6X1Ui/+mH4307ffjw8REGdlL7m2HRE17JdxLmTD0uHsEKDgleEQS8po4w/ALoUAGgwBOL5upD7aPW5OqLH7DPjEZoeYbMZk1BW3gesMTczTbpZ6vZFcMOe2eoFSqVXAM6yS/GzCn/TD+b3ZHfI8C69Yxrl09+JS29rRUHvOWdVA2AbowNNk2zJGT4ZYQ92xVAWr6CaQHrZf5akKF0ss6OwoGyIWO/Fl9HOXsg7ajfUeVxiNktJCeMTzs2/gV8X1XreisICPUIJERE0KeUG/3zjqUhbHemax7Lsr8KvhGFmU7mvM2qcG7tA1nR7yp1qajlji9hjHR9pufLS9U257cMAcQQs3yR5Ep8B7i1C/kwDMDKfa8Z7TWaboukf3u3I4/RIlQB0HwUICgkQSylBu0aYeE4oqnFE9qwMZ66hhclpgFiNY3flxwXqP/H0nq4K+ltUPzEwdBq6YyYEhxdWpTLdA8G44XLUGsBTmq35Fmtqg+1gk/MyWZuxzqT58dB4OfwR/SMbTvgSQptkDr8Uyx+8aPC/TLRqSitp3VeqFJHPVdUJ+5h2o78sufr/ZbI3dG0vtDmOKFWlmUOBaoME7rx8LJovO8dlVwKD+DtNOYXZgI7Jq5APahvpGAnB10972TjV2CClw/9kw8SrlY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(56012099003)(18002099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4EPLVnZpK1BBtbtweIHzMrGduY3nC0yA5lPCGFuil2A/JQGc31T1l/JaEOb+?=
 =?us-ascii?Q?RD6IcoJa0b5BH1TPHWS+wbqL9ol0m2usPVOaSFYftl+QT3rHkU52kuMLvVqc?=
 =?us-ascii?Q?q3MbIgViuCSG2WI1J1VKzNJ47YFBUl7D6PMGkP9Fbtg3iibGJxXqfEoySGHq?=
 =?us-ascii?Q?rcHfp3P3K9/lNHA7LtEt8M1lNqVvEX8xRD7GmXNYEUQ6UD74nbgnVUUxzjNm?=
 =?us-ascii?Q?unHYGtPaBfcXYMqsA3XgIrzAXZZ+n323sLCcYkABPGuBoTua5nnE7XKzZfed?=
 =?us-ascii?Q?+qqcTBedJGXO7nm4pqYDPOTolVYCdoF0Hbf1eAEOCdCWQiwhSNicvJzrxaHN?=
 =?us-ascii?Q?xcrsLZguuL0QQ4/ubNyYIf18Z29yg3Epve1yqThoBKkAEHJuMXxCYI7Cq2BM?=
 =?us-ascii?Q?MdFQ6ezZWH0+lh3tTv2ARL16/uhXrUINVQGLxrCcFKE3qePx1DjE6jK5XmdC?=
 =?us-ascii?Q?H8yhzR0U9jfkCpsj5GwSD2OB6bdynlMVblCYlQC1cPxL07XH98ImVDqaFAfP?=
 =?us-ascii?Q?YhH30L6uWDMLruS86JTN7qcorufYIL4Zu180rGp1fjMCAKFC1JMRFmvVTfhy?=
 =?us-ascii?Q?gM+J63fMzsy6lEqZ86NhEAT4eMtbHnp8QqGpXK7IAboKDVyKkfm35iyuAa6W?=
 =?us-ascii?Q?IlELGjbRsmEXDNNwG29wDJH6lS9SFy2+y1gMluhfAdQrPggKatFwuDwMOCKT?=
 =?us-ascii?Q?JFE6VREsomifpfste0J950o01MbGoTlkUHG2No5Ptl+wd+Z3eqH8UCkyevvP?=
 =?us-ascii?Q?eICVCDb4R9AbsTwlnNHhTmDQ9nywcPoxVpnRQDhMEylrHBFF1J3dJZtpbpU0?=
 =?us-ascii?Q?xWZbGB19lQ7Zet9kksiSJrkc6SCNnYT/YcDIpNSrfawRtODHCBiK+qCG2iR6?=
 =?us-ascii?Q?mTFnWy/uw23vcdQVEhcwubgmKVKot2msHCD5PUYeGWglLR2tVBY2+lBEq0Hs?=
 =?us-ascii?Q?hMzSUOsjg0FkUJgcSzvTjeXxu7IZDybWM7m4q7gtbN3BCGOIDVGHnLzURrVz?=
 =?us-ascii?Q?YfHAsx8yVTVvgrbOjVi+DR4dVBUjfT+OmS/K/58glsFbrkX5dQO07mQtJ+Tw?=
 =?us-ascii?Q?+18Lr5VeJdS7Chp9u6FLsuSJnKJAGSw/dpc1KBOq6NLKHdwcl2pXfDT4CsOR?=
 =?us-ascii?Q?UGpyBtTR739pYrv816jImOHtGF/PiEcGjEvo32FuYiH5gSJ6v9wp6E48E/Hs?=
 =?us-ascii?Q?BORwkdFn4v9jTTgZD4oYNyhAWOcBkVLctCEn7TPnGxFe9kReETOnx5jLNUOo?=
 =?us-ascii?Q?roofWnI8eyYKFUdpDgbWVz1M5jtXnK2g/DdySe0qiv6JjuqehRT8qySB4MFR?=
 =?us-ascii?Q?EENpLqTt0PYOqR+GvpntU5xi6HF4KLcktwprqIjWQIkNvUF7N5uHcskM1BR8?=
 =?us-ascii?Q?gtIFPkEgtuNeShWyqE17Ja9HN9CGIex9xMM3Tz2evAdWSeuQFjJT9D+asY8X?=
 =?us-ascii?Q?/Ew5H4mIrfz/Ej+13LdGVibbEDn/mIrV+19/WLJNvH/uXpSe9VaZ6TfOsif9?=
 =?us-ascii?Q?Gemtea4MzMTfXepW3TCTm7s7nkCfktWfe+uuF/n1stq6zjX+dBdDjpPDDeJ2?=
 =?us-ascii?Q?kySNb6Wypk/J1WB8ZjK1ywtLoF1r1DfpcWNvCytUz4lO3xRhAtHgr6bft+Yt?=
 =?us-ascii?Q?e8SbiBF3si4REDk7Q72z/s6zxPEefd4nDfBvBzKetG0iFfYH5PuF69z2dVNw?=
 =?us-ascii?Q?ETkpMOMmhQckb9ClZDC+BD01sffHuafCzijzHedI4GRV1cLfZMDlvZo0SffE?=
 =?us-ascii?Q?6ZSREZ9fPTM9fEWl7pNLhClQUa/5f50gaF/rFs7zlMSkDjpRojG5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 872f87bd-ac57-415a-743d-08debacbd1ef
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:09:29.7849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dl9gr+i1ykrT9bbD8Rge0B3gCSrsJxgdz+7vFkdJzu7FSUJBudQfFz/njImCUPfDuIZIni1pUMFhinT23RrlYYubq2lNs7y0AV7Jn0s/7OKlQ/CZLaR0O23+JccVFt+L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16271

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ab8500-codec.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 6e8ef9cd1b31a..74bea9c4fd16e 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -2081,9 +2081,22 @@ static int ab8500_codec_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 ab8500_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ab8500_codec_ops = {
 	.set_fmt = ab8500_codec_set_dai_fmt,
 	.set_tdm_slot = ab8500_codec_set_dai_tdm_slot,
+	.auto_selectable_formats = &ab8500_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver ab8500_codec_dai[] = {
-- 
2.43.0

