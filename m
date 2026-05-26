Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011017.outbound.protection.outlook.com [52.101.125.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD5E30170F
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762196; cv=fail; b=RZV/AzzuInlKXOsGfqtpGZRBpHH2aDJ8dM9n8+BXDvNRrfL/Ufv9RA+ohwikAyQw7q/2PoMO7Hv87vvgWCh21TkgBJ04bLXsgaRFomOOZS0VNtw0bkZPUkFhGnxDLVeJcuSMLUCR4N2vCyXiBUcSpIxp8RIEx0stdwGZIrV5y14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762196; c=relaxed/simple;
	bh=Tgq+Pek9AFiRh55qRMAWbIpWfB85lYgrdufZju1tmPM=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pYuGVejWitTmnonbg8bvFAsxdZEpqYjC4HbXdZ6ZLWqB5EV8z8HxFP+wWNHX34UOfYxj0BBPl17Ts0oUuWyP4XesvhCFlfQ9V+8lMKZWBiUwDoeDop4rKD9CKBp64saSeTn98coxl7f87GaYhxHL4MRg1l3eo9+hNAvBVmOMxBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H7WKY0TH; arc=fail smtp.client-ip=52.101.125.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H7WKY0TH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7kljZnQeJzgmp21oo+01Js8u+9odl9CoeBLAcFnQGJk2gx09cNDe2SOMGxwgY/UvUAxYmrUXOGMBycu8CRcm74XTUs/cyA15yNZEi0Xn3PnUEFZxgFkhzu3ApvytG7guU/Tg4vKiuF1Ssq+svkT5NLn0FqrO0TJEMAaAL1jsvrP7lwVbPWBWOUbu5+Xxv2nnjHMA3eCmFxqui96eNKpV0IJ56W9ztD8sj3XebG8V8vh8RFdqg7JQU/lUqPFT3bLgitqIboeGteLHX3EBtNUlB59QURiITGHabUYz9MJsF59lqM3CbfSi50oZX/9uIXZCH8GyWjz/eHf9FzcApmFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmNyxMLhXcpddyzXL+wa+iPrfh0Bxj5xxvYfj135BbA=;
 b=DhZuFDnnWVNLJBSIdMfeSYyluinX+G7gVh1odiVPZv4TTEEQoEEJiAXL4UXXVy3qiARz8ozp7LvFjp4buVrNQO4TF4xxozxiV1cfTbq3i4ppiX9zK09MXVvTyzx8dtYR3l1JS58s6ONcwAoWFitE9C4N8D7DyIN5Vw4vUy3sAw7AoTuAEMcteZBXIUNQEwkjN9J6MkRLwGNIBUHuTuY0W38i65MiiAgG/gQKvOUEtb4uwSb4TkvnKmtEC8HTH1phtz/CaupZ+ArSpfmYyCFxDf5MQkhNvazOHc+jHkcTqDlFjd/i10RzOMikvG1pKKitTl2ZWfA47EGBeOVH4BgNkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmNyxMLhXcpddyzXL+wa+iPrfh0Bxj5xxvYfj135BbA=;
 b=H7WKY0THjZqGn2HNTpc/qf2gvyYCu4JXqBRVK/8SbDmd/8FMMzEl6fGvpz5h8lZWVNo8cArmHrhoLmQKRmd3QFWWYhx1XV6jlByKArDdoByTC33b4litBlEl2Yz3MKJNCMIUh+2LltXb7d6VWPiR1eqBtuVtGDAg6fLGzTNIFlk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13148.jpnprd01.prod.outlook.com (2603:1096:604:30f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:23:09 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:23:09 +0000
Message-ID: <87o6i2gb9h.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 59/83] ASoC: codecs: wm*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:22:52 +0000
X-ClientProxiedBy: KL1PR0401CA0009.apcprd04.prod.outlook.com
 (2603:1096:820:f::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13148:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b32d73c-64d3-4e98-bfa7-08debacdba58
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014|11063799006|22082099003|18002099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	t92a2dwfHOoKt+DA49BQYhODRfnuNcNDT3SbOSkS2jXTlymvM0ROzyxbd2gV/6ho5bNAWdTVTzBi8dXldiVE0nERnCDkcL6urjWQHmfLHHmzPvB0HuMt5X7N5U7DgPUtZz2dcjJ40XqCLnR+6fzcSfghjRO7Vp0nCDORoq38Ko35Fl71ES+lu1+uujD8j1B82LYsqdiUtjWEJKVH4ZuYSYKjH7t9IDu92M4a6O//SqNaCpYYPqGzIdFIWncT0eMgBLugbW57d6Hf7YFDI6GJHQVXJW4jNux3+/NQRinrQj3Ih2+gJi3/j3Fksq0jmqvGg0qrMPn3waofxxSnWNKe/Zk16sumRTAhsTHeBWVHkFKnPLVnmXDtw+BYwMHZmE0H0mIYyygy30qoo6yvojLLbiNsmjSSl4ODlqm1etzvrLp4VTwBqF/LJlprKmIgqtAaO97aeb/BZg3+YpzLMUH80kw29EOZWoZg/AqQVv/Dn1rOqC8eN5AenQ8cYk/JDLwjb3OsAWUNGD1mu9CwSKsdcbF/N2Qb1kRAN1YRzDFqHld0pyA4nshJ3WeRiUpb8ntyRUDZF5gHGnHwzUJhNwy8WQvkKhOlygMhV3RI+tCiupq1IoQufL5UiUkMwO2PxnnWjE83aeUp0ElLNcLU/7ue3EC4wWRrgs6rlgTDKTTCafrI27Kao23GwQ+371LxOT1YBsKZ0tR7W/QyWDb/BDw8So7MWaw5e3mZql2LbcisTtj1NpvOyXJ6Z9yK/w0kfza1n+bni5NqOoqDzHZEgXR7/9adDHkEfmVVP4pSm4Jy7x4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014)(11063799006)(22082099003)(18002099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IP7dBAYL7wcj/UiO2XkAie28rUu4Aslt2Tke/iVkWFKtDZh5dXkTPwwrB4nN?=
 =?us-ascii?Q?QhTQVvTUmX24q5lQV1dYYoHc2oVsMTZNNc7TNpKqGMwNrJqQYQD0zc6D+p+O?=
 =?us-ascii?Q?ZxUIzauybCO2LWuhY3LBP0NfXcHzFgMui0ljI4aq+8ACDL7dSf5jBc9PxJ7a?=
 =?us-ascii?Q?g0x4MqqAgb3cy61VlSllAI1Vik4M9s2M4Cj4kWSwVUkpjVpKiCSBkuyltrcy?=
 =?us-ascii?Q?TnyKIXfkOdmWaYRR4azDas7ZDwl4ruV54nq5/fpXcf8l0wdcD+5uK/5SPbSE?=
 =?us-ascii?Q?IqyevQkg9yqnXSCDwgdSmj9K5rPFMz5CL6Y0ptaSw0tytfi27B2ZxCd+f2Bb?=
 =?us-ascii?Q?UHsMGuh04k1b99+P211nRMnLY8YNahenCUWNOi4DbVEWkIlJWcxWzJsoX54P?=
 =?us-ascii?Q?H3n7+2TewJIe2oclyLdIhJxLlabaWWxpM8B3Gt+l5Z+JZq2XmUImv1AineYe?=
 =?us-ascii?Q?RPIFfmNTWC0N+7PPjL5V26ncqxOOFfELHAmJOw4On7UssIdEytwkUBf54q/l?=
 =?us-ascii?Q?nGcCXlkqdySojacDZmzOi1jVWr2Wxiq9vdsy4iBYa5V7KlhVIIBHZezWu7C7?=
 =?us-ascii?Q?8c9AZ89/M0o6pEFfi9IX8zDHQHRXInQsP9LJnWN8k/EVGAAaHcLJHGFizcVj?=
 =?us-ascii?Q?XNB2dF/DgQR9UnaueBGtAqaTqKqL1ukvjU9zYnhkFALOKp7wu1rtncxWKh1g?=
 =?us-ascii?Q?vo2gxtD85T2BQisx8O4UBJpPsu8bctfX2J2tshIHKzYYszaP5HxlTlX4tNVk?=
 =?us-ascii?Q?p3A6t/YvQWY+hmKRCN6vJWOz5YQo1Hat6/eRZg7e1CBTfYuOClUFlTA/rRKM?=
 =?us-ascii?Q?OuKrjc9EY3J8yNCaT3sZPGjflEQPI/rkS3CIV7GvPb/HYAVHB1QNseD21lQ2?=
 =?us-ascii?Q?+Jf7ZuwVHUTeKQ7G0VVDuDR+w4x+V1xWH101OROnfBzlDykemZ6efd9P3yBL?=
 =?us-ascii?Q?IcAHGDPL3pJwJY1Dkrk0Gj98zBZLpQHM0dBl8AVzNjGB+DzLwd8qcYOpDVBc?=
 =?us-ascii?Q?WR/flX5H2ZCIXlgl+nSNoB5bN/bJf3Td74WhgugaIg1vC0PkMehysXVaW9/t?=
 =?us-ascii?Q?MUmYne/YU86AI3LFL3BleY1lOV7TE8YJO1wY/Gbm8oNUpM7dHpMfLhWILTCo?=
 =?us-ascii?Q?M96ALl9R8d4fXfnxQQpztEyOIoDHr8oCJWc8JGMKqM8D5d6V6oU0foiOETPi?=
 =?us-ascii?Q?mL+Xx1Jk1xdC8WzDCISE3gxaCVJkKs1px2lNMIPd7rIseepBRslOlnRjftyJ?=
 =?us-ascii?Q?3NGKzWbIY6j6sSNeAmtE3lS/X1NgTXnRhdYayB8tLYxnTO7JgmDMJEJU4lyd?=
 =?us-ascii?Q?SY1/1HjhVpX1le330LMeBCp+68e+vy+4hnCugwfCa+WJuG0Z1XUDf0zfdimy?=
 =?us-ascii?Q?yYgWmXMAXHW40XK9vmTcTk9AJvVwGOvGybITMwJT/V6FSVl2B9l3Ny480/m/?=
 =?us-ascii?Q?IbF5C5ild5wD0t2bfd1zDgIsOQ6Y02Cet9d7mxeuQKCzyqPnayXeCDboIhu9?=
 =?us-ascii?Q?/RxxOBTEl6I5MUG+noWJ0C0JnooUkQj2UDKw/g2c3D4TrJuknmxwePUjf8XE?=
 =?us-ascii?Q?JNH2RR4BhGWYoKhi+GzvdtGc5p0A4OF+03GFVjKG1TdggeNtB1H58/Op1ZR8?=
 =?us-ascii?Q?xFDLSEE3e+ohgaOLt392ffG4TkUo0VqcL8syraWrrvSd1TdvAko4sa2zUiEN?=
 =?us-ascii?Q?pu2aE6tZlkvcnWizv8OKMUUYQkfks+qzhzo+PB5zLCVuQx6LADUKnflVEEsK?=
 =?us-ascii?Q?rvY4RmfSp4eI5vD8ncAlvQRgMcDg3YeMi6egiWJFTRlfc+8fRIgi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b32d73c-64d3-4e98-bfa7-08debacdba58
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:23:09.4034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yc8w0HCT91XpVoFPxrvlWReT8t/NCf8QjDOkdA9cM1UwgYaf2+nsmIxmW7Mpnzc2Xgxbzqv+V2RUln36AThteiyKdeJdO5DC3lWjJxBrL2Kgo6UqwFhHZCDNZ5tI+y/k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13148

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm2200.c | 10 ++++++++++
 sound/soc/codecs/wm5100.c | 10 ++++++++++
 sound/soc/codecs/wm8350.c | 13 +++++++++++++
 sound/soc/codecs/wm8400.c |  9 +++++++++
 sound/soc/codecs/wm8510.c | 12 ++++++++++++
 sound/soc/codecs/wm8523.c | 13 +++++++++++++
 sound/soc/codecs/wm8524.c |  6 ++++++
 sound/soc/codecs/wm8580.c | 15 +++++++++++++++
 sound/soc/codecs/wm8711.c | 13 +++++++++++++
 sound/soc/codecs/wm8728.c |  9 +++++++++
 sound/soc/codecs/wm8731.c | 13 +++++++++++++
 sound/soc/codecs/wm8737.c | 17 +++++++++++++++++
 sound/soc/codecs/wm8741.c | 13 +++++++++++++
 sound/soc/codecs/wm8750.c | 13 +++++++++++++
 sound/soc/codecs/wm8753.c | 21 +++++++++++++++++++++
 sound/soc/codecs/wm8770.c | 11 +++++++++++
 sound/soc/codecs/wm8776.c | 13 +++++++++++++
 sound/soc/codecs/wm8804.c | 15 ++++++++++++++-
 sound/soc/codecs/wm8900.c | 19 +++++++++++++++++++
 sound/soc/codecs/wm8903.c | 19 +++++++++++++++++++
 sound/soc/codecs/wm8904.c | 19 +++++++++++++++++++
 sound/soc/codecs/wm8940.c | 13 +++++++++++++
 sound/soc/codecs/wm8955.c | 19 +++++++++++++++++++
 sound/soc/codecs/wm8960.c | 13 +++++++++++++
 sound/soc/codecs/wm8961.c | 19 +++++++++++++++++++
 sound/soc/codecs/wm8962.c | 13 +++++++++++++
 sound/soc/codecs/wm8971.c | 13 +++++++++++++
 sound/soc/codecs/wm8974.c | 12 ++++++++++++
 sound/soc/codecs/wm8978.c | 12 ++++++++++++
 sound/soc/codecs/wm8983.c | 12 ++++++++++++
 sound/soc/codecs/wm8985.c | 19 +++++++++++++++++++
 sound/soc/codecs/wm8988.c | 13 +++++++++++++
 sound/soc/codecs/wm8990.c |  9 +++++++++
 sound/soc/codecs/wm8991.c |  9 +++++++++
 sound/soc/codecs/wm8993.c | 19 +++++++++++++++++++
 sound/soc/codecs/wm8994.c | 21 +++++++++++++++++++++
 sound/soc/codecs/wm8995.c | 21 +++++++++++++++++++++
 sound/soc/codecs/wm8996.c | 12 ++++++++++++
 sound/soc/codecs/wm9081.c | 18 ++++++++++++++++++
 sound/soc/codecs/wm9713.c | 13 +++++++++++++
 40 files changed, 562 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index ba8ce2e6e6150..da03a13ac6436 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -2066,10 +2066,20 @@ static int wm2200_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 wm2200_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm2200_dai_ops = {
 	.probe = wm2200_dai_probe,
 	.set_fmt = wm2200_set_fmt,
 	.hw_params = wm2200_hw_params,
+	.auto_selectable_formats	= &wm2200_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define WM2200_RATES SNDRV_PCM_RATE_8000_48000
diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index bd94fa53c3624..9efcb68444d1a 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -1501,9 +1501,19 @@ static int wm5100_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 wm5100_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm5100_dai_ops = {
 	.set_fmt = wm5100_set_fmt,
 	.hw_params = wm5100_hw_params,
+	.auto_selectable_formats	= &wm5100_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int wm5100_set_sysclk(struct snd_soc_component *component, int clk_id,
diff --git a/sound/soc/codecs/wm8350.c b/sound/soc/codecs/wm8350.c
index ad68ff1790e01..13e3fde87e149 100644
--- a/sound/soc/codecs/wm8350.c
+++ b/sound/soc/codecs/wm8350.c
@@ -1426,6 +1426,17 @@ EXPORT_SYMBOL_GPL(wm8350_mic_jack_detect);
 			SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8350_selectable_formats =
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
 static const struct snd_soc_dai_ops wm8350_dai_ops = {
 	 .hw_params	= wm8350_pcm_hw_params,
 	 .mute_stream	= wm8350_mute,
@@ -1434,6 +1445,8 @@ static const struct snd_soc_dai_ops wm8350_dai_ops = {
 	 .set_pll	= wm8350_set_fll,
 	 .set_clkdiv	= wm8350_set_clkdiv,
 	 .no_capture_mute = 1,
+	 .auto_selectable_formats	= &wm8350_selectable_formats,
+	 .num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8350_dai = {
diff --git a/sound/soc/codecs/wm8400.c b/sound/soc/codecs/wm8400.c
index 0eecc8657a38d..83e2d72a4a76b 100644
--- a/sound/soc/codecs/wm8400.c
+++ b/sound/soc/codecs/wm8400.c
@@ -1222,6 +1222,13 @@ static int wm8400_set_bias_level(struct snd_soc_component *component,
 #define WM8400_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8400_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops wm8400_dai_ops = {
 	.hw_params = wm8400_hw_params,
 	.mute_stream = wm8400_mute,
@@ -1230,6 +1237,8 @@ static const struct snd_soc_dai_ops wm8400_dai_ops = {
 	.set_sysclk = wm8400_set_dai_sysclk,
 	.set_pll = wm8400_set_dai_pll,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8400_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 /*
diff --git a/sound/soc/codecs/wm8510.c b/sound/soc/codecs/wm8510.c
index 589a895648132..beb9ebaa14c6e 100644
--- a/sound/soc/codecs/wm8510.c
+++ b/sound/soc/codecs/wm8510.c
@@ -546,6 +546,16 @@ static int wm8510_set_bias_level(struct snd_soc_component *component,
 #define WM8510_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8510_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8510_dai_ops = {
 	.hw_params	= wm8510_pcm_hw_params,
 	.mute_stream	= wm8510_mute,
@@ -553,6 +563,8 @@ static const struct snd_soc_dai_ops wm8510_dai_ops = {
 	.set_clkdiv	= wm8510_set_dai_clkdiv,
 	.set_pll	= wm8510_set_dai_pll,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8510_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8510_dai = {
diff --git a/sound/soc/codecs/wm8523.c b/sound/soc/codecs/wm8523.c
index 65108a041c92a..1668817f2f7c3 100644
--- a/sound/soc/codecs/wm8523.c
+++ b/sound/soc/codecs/wm8523.c
@@ -375,11 +375,24 @@ static int wm8523_set_bias_level(struct snd_soc_component *component,
 #define WM8523_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8523_selectable_formats =
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
 static const struct snd_soc_dai_ops wm8523_dai_ops = {
 	.startup	= wm8523_startup,
 	.hw_params	= wm8523_hw_params,
 	.set_sysclk	= wm8523_set_dai_sysclk,
 	.set_fmt	= wm8523_set_dai_fmt,
+	.auto_selectable_formats	= &wm8523_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8523_dai = {
diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
index 6b1a7450b0acc..75a997f7a8782 100644
--- a/sound/soc/codecs/wm8524.c
+++ b/sound/soc/codecs/wm8524.c
@@ -191,6 +191,10 @@ static int wm8524_hw_params(struct snd_pcm_substream *substream,
 			SNDRV_PCM_FMTBIT_S24_LE |\
 			SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8525_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops wm8524_dai_ops = {
 	.startup	= wm8524_startup,
 	.shutdown	= wm8524_shutdown,
@@ -198,6 +202,8 @@ static const struct snd_soc_dai_ops wm8524_dai_ops = {
 	.set_fmt	= wm8524_set_fmt,
 	.mute_stream	= wm8524_mute_stream,
 	.hw_params	= wm8524_hw_params,
+	.auto_selectable_formats	= &wm8525_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8524_dai = {
diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index ca7bbe5d4fc35..adbb1d3a77ec4 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -861,6 +861,17 @@ static int wm8580_playback_startup(struct snd_pcm_substream *substream,
 #define WM8580_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8580_selectable_formats =
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
 static const struct snd_soc_dai_ops wm8580_dai_ops_playback = {
 	.startup	= wm8580_playback_startup,
 	.set_sysclk	= wm8580_set_sysclk,
@@ -870,6 +881,8 @@ static const struct snd_soc_dai_ops wm8580_dai_ops_playback = {
 	.set_pll	= wm8580_set_dai_pll,
 	.mute_stream	= wm8580_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8580_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops wm8580_dai_ops_capture = {
@@ -878,6 +891,8 @@ static const struct snd_soc_dai_ops wm8580_dai_ops_capture = {
 	.set_fmt	= wm8580_set_paif_dai_fmt,
 	.set_clkdiv	= wm8580_set_dai_clkdiv,
 	.set_pll	= wm8580_set_dai_pll,
+	.auto_selectable_formats	= &wm8580_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8580_dai[] = {
diff --git a/sound/soc/codecs/wm8711.c b/sound/soc/codecs/wm8711.c
index 5271966b16150..a34ac8c3a170b 100644
--- a/sound/soc/codecs/wm8711.c
+++ b/sound/soc/codecs/wm8711.c
@@ -326,6 +326,17 @@ static int wm8711_set_bias_level(struct snd_soc_component *component,
 #define WM8711_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8711_selectable_formats =
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
 static const struct snd_soc_dai_ops wm8711_ops = {
 	.prepare = wm8711_pcm_prepare,
 	.hw_params = wm8711_hw_params,
@@ -334,6 +345,8 @@ static const struct snd_soc_dai_ops wm8711_ops = {
 	.set_sysclk = wm8711_set_dai_sysclk,
 	.set_fmt = wm8711_set_dai_fmt,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8711_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8711_dai = {
diff --git a/sound/soc/codecs/wm8728.c b/sound/soc/codecs/wm8728.c
index 6e6fd77c30203..5cb51cfdb6dd1 100644
--- a/sound/soc/codecs/wm8728.c
+++ b/sound/soc/codecs/wm8728.c
@@ -191,11 +191,20 @@ static int wm8728_set_bias_level(struct snd_soc_component *component,
 #define WM8728_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8728_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8728_dai_ops = {
 	.hw_params	= wm8728_hw_params,
 	.mute_stream	= wm8728_mute,
 	.set_fmt	= wm8728_set_dai_fmt,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8728_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8728_dai = {
diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index a2f0e2f5c4070..c4f57addf9ede 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -520,6 +520,17 @@ static int wm8731_startup(struct snd_pcm_substream *substream,
 #define WM8731_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8731_selectable_formats =
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
 static const struct snd_soc_dai_ops wm8731_dai_ops = {
 	.startup	= wm8731_startup,
 	.hw_params	= wm8731_hw_params,
@@ -527,6 +538,8 @@ static const struct snd_soc_dai_ops wm8731_dai_ops = {
 	.set_sysclk	= wm8731_set_dai_sysclk,
 	.set_fmt	= wm8731_set_dai_fmt,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8731_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8731_dai = {
diff --git a/sound/soc/codecs/wm8737.c b/sound/soc/codecs/wm8737.c
index 4eb42d19bc7ec..46daf2aaa5437 100644
--- a/sound/soc/codecs/wm8737.c
+++ b/sound/soc/codecs/wm8737.c
@@ -517,10 +517,27 @@ static int wm8737_set_bias_level(struct snd_soc_component *component,
 #define WM8737_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8737_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_AC97	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8737_dai_ops = {
 	.hw_params	= wm8737_hw_params,
 	.set_sysclk	= wm8737_set_dai_sysclk,
 	.set_fmt	= wm8737_set_dai_fmt,
+	.auto_selectable_formats	= &wm8737_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8737_dai = {
diff --git a/sound/soc/codecs/wm8741.c b/sound/soc/codecs/wm8741.c
index ca56fdfb50887..e49adc9808b4f 100644
--- a/sound/soc/codecs/wm8741.c
+++ b/sound/soc/codecs/wm8741.c
@@ -381,6 +381,17 @@ static int wm8741_mute(struct snd_soc_dai *codec_dai, int mute, int direction)
 #define WM8741_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8741_selectable_formats =
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
 static const struct snd_soc_dai_ops wm8741_dai_ops = {
 	.startup	= wm8741_startup,
 	.hw_params	= wm8741_hw_params,
@@ -388,6 +399,8 @@ static const struct snd_soc_dai_ops wm8741_dai_ops = {
 	.set_fmt	= wm8741_set_dai_fmt,
 	.mute_stream	= wm8741_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8741_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8741_dai = {
diff --git a/sound/soc/codecs/wm8750.c b/sound/soc/codecs/wm8750.c
index d3f1178c2d34e..b0b4447938303 100644
--- a/sound/soc/codecs/wm8750.c
+++ b/sound/soc/codecs/wm8750.c
@@ -659,12 +659,25 @@ static int wm8750_set_bias_level(struct snd_soc_component *component,
 #define WM8750_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8750_selectable_formats =
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
 static const struct snd_soc_dai_ops wm8750_dai_ops = {
 	.hw_params	= wm8750_pcm_hw_params,
 	.mute_stream	= wm8750_mute,
 	.set_fmt	= wm8750_set_dai_fmt,
 	.set_sysclk	= wm8750_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8750_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8750_dai = {
diff --git a/sound/soc/codecs/wm8753.c b/sound/soc/codecs/wm8753.c
index 95b23504f68dc..e6ed53fbeb9b4 100644
--- a/sound/soc/codecs/wm8753.c
+++ b/sound/soc/codecs/wm8753.c
@@ -1381,6 +1381,23 @@ static int wm8753_set_bias_level(struct snd_soc_component *component,
  * 3. Voice disabled - HIFI over HIFI
  * 4. Voice disabled - HIFI over HIFI, uses voice DAI LRC for capture
  */
+static const u64 wm8753_selectable_formats[] =
+{
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+};
+
 static const struct snd_soc_dai_ops wm8753_dai_ops_hifi_mode = {
 	.hw_params	= wm8753_i2s_hw_params,
 	.mute_stream	= wm8753_mute,
@@ -1389,6 +1406,8 @@ static const struct snd_soc_dai_ops wm8753_dai_ops_hifi_mode = {
 	.set_pll	= wm8753_set_dai_pll,
 	.set_sysclk	= wm8753_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8753_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8753_selectable_formats),
 };
 
 static const struct snd_soc_dai_ops wm8753_dai_ops_voice_mode = {
@@ -1399,6 +1418,8 @@ static const struct snd_soc_dai_ops wm8753_dai_ops_voice_mode = {
 	.set_pll	= wm8753_set_dai_pll,
 	.set_sysclk	= wm8753_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8753_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8753_selectable_formats),
 };
 
 static struct snd_soc_dai_driver wm8753_dai[] = {
diff --git a/sound/soc/codecs/wm8770.c b/sound/soc/codecs/wm8770.c
index d382b476c89c4..130a242530240 100644
--- a/sound/soc/codecs/wm8770.c
+++ b/sound/soc/codecs/wm8770.c
@@ -538,12 +538,23 @@ static int wm8770_set_bias_level(struct snd_soc_component *component,
 #define WM8770_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8770_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8770_dai_ops = {
 	.mute_stream = wm8770_mute,
 	.hw_params = wm8770_hw_params,
 	.set_fmt = wm8770_set_fmt,
 	.set_sysclk = wm8770_set_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8770_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver wm8770_dai = {
diff --git a/sound/soc/codecs/wm8776.c b/sound/soc/codecs/wm8776.c
index f3b02c77314f4..4d80577eedbe3 100644
--- a/sound/soc/codecs/wm8776.c
+++ b/sound/soc/codecs/wm8776.c
@@ -361,18 +361,31 @@ static int wm8776_set_bias_level(struct snd_soc_component *component,
 #define WM8776_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8776_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8776_dac_ops = {
 	.mute_stream	= wm8776_mute,
 	.hw_params      = wm8776_hw_params,
 	.set_fmt        = wm8776_set_fmt,
 	.set_sysclk     = wm8776_set_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8776_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops wm8776_adc_ops = {
 	.hw_params      = wm8776_hw_params,
 	.set_fmt        = wm8776_set_fmt,
 	.set_sysclk     = wm8776_set_sysclk,
+	.auto_selectable_formats	= &wm8776_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8776_dai[] = {
diff --git a/sound/soc/codecs/wm8804.c b/sound/soc/codecs/wm8804.c
index 94aa3c8de0ab6..2fc9634fe51f1 100644
--- a/sound/soc/codecs/wm8804.c
+++ b/sound/soc/codecs/wm8804.c
@@ -502,12 +502,25 @@ static int wm8804_set_clkdiv(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 wm8804_selectable_formats =
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
 static const struct snd_soc_dai_ops wm8804_dai_ops = {
 	.hw_params = wm8804_hw_params,
 	.set_fmt = wm8804_set_fmt,
 	.set_sysclk = wm8804_set_sysclk,
 	.set_clkdiv = wm8804_set_clkdiv,
-	.set_pll = wm8804_set_pll
+	.set_pll = wm8804_set_pll,
+	.auto_selectable_formats = &wm8804_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define WM8804_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
diff --git a/sound/soc/codecs/wm8900.c b/sound/soc/codecs/wm8900.c
index a9128cfa6ff17..8dfb8f209fb54 100644
--- a/sound/soc/codecs/wm8900.c
+++ b/sound/soc/codecs/wm8900.c
@@ -992,6 +992,23 @@ static int wm8900_mute(struct snd_soc_dai *codec_dai, int mute, int direction)
 	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	 SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8900_selectable_formats[] =
+{
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8900_dai_ops = {
 	.hw_params	= wm8900_hw_params,
 	.set_clkdiv	= wm8900_set_dai_clkdiv,
@@ -999,6 +1016,8 @@ static const struct snd_soc_dai_ops wm8900_dai_ops = {
 	.set_fmt	= wm8900_set_dai_fmt,
 	.mute_stream	= wm8900_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8900_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8900_selectable_formats),
 };
 
 static struct snd_soc_dai_driver wm8900_dai = {
diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 320d7737699d9..61874b915fd00 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1734,12 +1734,31 @@ static irqreturn_t wm8903_irq(int irq, void *data)
 			SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8903_selectable_formats[] =
+{
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8903_dai_ops = {
 	.hw_params	= wm8903_hw_params,
 	.mute_stream	= wm8903_mute,
 	.set_fmt	= wm8903_set_dai_fmt,
 	.set_sysclk	= wm8903_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8903_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8903_selectable_formats),
 };
 
 static struct snd_soc_dai_driver wm8903_dai = {
diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 9e5782e50f475..be5e4f6f2d99f 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -2026,6 +2026,23 @@ static int wm8904_set_bias_level(struct snd_soc_component *component,
 #define WM8904_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8904_selectable_formats[] =
+{
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8904_dai_ops = {
 	.set_sysclk = wm8904_set_sysclk,
 	.set_fmt = wm8904_set_fmt,
@@ -2034,6 +2051,8 @@ static const struct snd_soc_dai_ops wm8904_dai_ops = {
 	.hw_params = wm8904_hw_params,
 	.mute_stream = wm8904_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = wm8904_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(wm8904_selectable_formats),
 };
 
 static struct snd_soc_dai_driver wm8904_dai = {
diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index e631ec0722496..f155b8378e909 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -730,6 +730,17 @@ static int wm8940_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 			SNDRV_PCM_FMTBIT_S24_LE |			\
 			SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8940_selectable_formats =
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
 static const struct snd_soc_dai_ops wm8940_dai_ops = {
 	.hw_params = wm8940_i2s_hw_params,
 	.set_sysclk = wm8940_set_dai_sysclk,
@@ -738,6 +749,8 @@ static const struct snd_soc_dai_ops wm8940_dai_ops = {
 	.set_clkdiv = wm8940_set_dai_clkdiv,
 	.set_pll = wm8940_set_dai_pll,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8940_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver wm8940_dai = {
diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index c897a9ab764dd..f3255745ff717 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -845,12 +845,31 @@ static int wm8955_set_bias_level(struct snd_soc_component *component,
 #define WM8955_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8955_selectable_formats[] =
+{
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8955_dai_ops = {
 	.set_sysclk = wm8955_set_sysclk,
 	.set_fmt = wm8955_set_fmt,
 	.hw_params = wm8955_hw_params,
 	.mute_stream = wm8955_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8955_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8955_selectable_formats),
 };
 
 static struct snd_soc_dai_driver wm8955_dai = {
diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index a810732c6af00..093530ae872b7 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -1340,6 +1340,17 @@ static int wm8960_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8960_selectable_formats =
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
 static const struct snd_soc_dai_ops wm8960_dai_ops = {
 	.hw_params = wm8960_hw_params,
 	.hw_free = wm8960_hw_free,
@@ -1349,6 +1360,8 @@ static const struct snd_soc_dai_ops wm8960_dai_ops = {
 	.set_pll = wm8960_set_dai_pll,
 	.set_sysclk = wm8960_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8960_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver wm8960_dai = {
diff --git a/sound/soc/codecs/wm8961.c b/sound/soc/codecs/wm8961.c
index 504fc59e4be2a..af22de6c6e1ac 100644
--- a/sound/soc/codecs/wm8961.c
+++ b/sound/soc/codecs/wm8961.c
@@ -803,6 +803,23 @@ static int wm8961_set_bias_level(struct snd_soc_component *component,
 	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8961_selectable_formats[] =
+{
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8961_dai_ops = {
 	.hw_params = wm8961_hw_params,
 	.set_sysclk = wm8961_set_sysclk,
@@ -811,6 +828,8 @@ static const struct snd_soc_dai_ops wm8961_dai_ops = {
 	.set_tristate = wm8961_set_tristate,
 	.set_clkdiv = wm8961_set_clkdiv,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8961_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8961_selectable_formats),
 };
 
 static struct snd_soc_dai_driver wm8961_dai = {
diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index de18b1f85a32c..b0487b6762d30 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3061,6 +3061,17 @@ static int wm8962_mute(struct snd_soc_dai *dai, int mute, int direction)
 #define WM8962_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8962_selectable_formats =
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
 static const struct snd_soc_dai_ops wm8962_dai_ops = {
 	.hw_params = wm8962_hw_params,
 	.set_sysclk = wm8962_set_dai_sysclk,
@@ -3068,6 +3079,8 @@ static const struct snd_soc_dai_ops wm8962_dai_ops = {
 	.set_tdm_slot = wm8962_set_tdm_slot,
 	.mute_stream = wm8962_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8962_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver wm8962_dai = {
diff --git a/sound/soc/codecs/wm8971.c b/sound/soc/codecs/wm8971.c
index a5d2e91b66bba..388ee05d45206 100644
--- a/sound/soc/codecs/wm8971.c
+++ b/sound/soc/codecs/wm8971.c
@@ -601,12 +601,25 @@ static int wm8971_set_bias_level(struct snd_soc_component *component,
 #define WM8971_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8971_selectable_formats =
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
 static const struct snd_soc_dai_ops wm8971_dai_ops = {
 	.hw_params	= wm8971_pcm_hw_params,
 	.mute_stream	= wm8971_mute,
 	.set_fmt	= wm8971_set_dai_fmt,
 	.set_sysclk	= wm8971_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8971_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8971_dai = {
diff --git a/sound/soc/codecs/wm8974.c b/sound/soc/codecs/wm8974.c
index 4656652b8e97c..b9e8c544912b0 100644
--- a/sound/soc/codecs/wm8974.c
+++ b/sound/soc/codecs/wm8974.c
@@ -623,6 +623,16 @@ static int wm8974_set_bias_level(struct snd_soc_component *component,
 #define WM8974_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8974_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8974_ops = {
 	.hw_params = wm8974_pcm_hw_params,
 	.mute_stream = wm8974_mute,
@@ -631,6 +641,8 @@ static const struct snd_soc_dai_ops wm8974_ops = {
 	.set_pll = wm8974_set_dai_pll,
 	.set_sysclk = wm8974_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8974_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver wm8974_dai = {
diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index ad8064bbaaac8..25cc433c7653d 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -892,6 +892,16 @@ static int wm8978_set_bias_level(struct snd_soc_component *component,
 #define WM8978_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8978_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8978_dai_ops = {
 	.hw_params	= wm8978_hw_params,
 	.mute_stream	= wm8978_mute,
@@ -899,6 +909,8 @@ static const struct snd_soc_dai_ops wm8978_dai_ops = {
 	.set_clkdiv	= wm8978_set_dai_clkdiv,
 	.set_sysclk	= wm8978_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8978_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* Also supports 12kHz */
diff --git a/sound/soc/codecs/wm8983.c b/sound/soc/codecs/wm8983.c
index fab25f35fd141..3366166a2b771 100644
--- a/sound/soc/codecs/wm8983.c
+++ b/sound/soc/codecs/wm8983.c
@@ -943,6 +943,16 @@ static int wm8983_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+/* FIXME: it doesn't support DSP A/B for now */
+static const u64 wm8983_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8983_dai_ops = {
 	.mute_stream = wm8983_dac_mute,
 	.hw_params = wm8983_hw_params,
@@ -950,6 +960,8 @@ static const struct snd_soc_dai_ops wm8983_dai_ops = {
 	.set_sysclk = wm8983_set_sysclk,
 	.set_pll = wm8983_set_pll,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8983_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define WM8983_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index 2a64d5a851da8..0bb01d7d5f29f 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -1072,6 +1072,23 @@ static int wm8985_probe(struct snd_soc_component *component)
 	return ret;
 }
 
+static const u64 wm8985_selectable_formats[] =
+{
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8985_dai_ops = {
 	.mute_stream = wm8985_dac_mute,
 	.hw_params = wm8985_hw_params,
@@ -1079,6 +1096,8 @@ static const struct snd_soc_dai_ops wm8985_dai_ops = {
 	.set_sysclk = wm8985_set_sysclk,
 	.set_pll = wm8985_set_pll,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = wm8985_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(wm8985_selectable_formats),
 };
 
 #define WM8985_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
diff --git a/sound/soc/codecs/wm8988.c b/sound/soc/codecs/wm8988.c
index 741aecc7641a1..6f97c9aa453aa 100644
--- a/sound/soc/codecs/wm8988.c
+++ b/sound/soc/codecs/wm8988.c
@@ -762,6 +762,17 @@ static int wm8988_set_bias_level(struct snd_soc_component *component,
 #define WM8988_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8988_selectable_formats =
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
 static const struct snd_soc_dai_ops wm8988_ops = {
 	.startup = wm8988_pcm_startup,
 	.hw_params = wm8988_pcm_hw_params,
@@ -769,6 +780,8 @@ static const struct snd_soc_dai_ops wm8988_ops = {
 	.set_sysclk = wm8988_set_dai_sysclk,
 	.mute_stream = wm8988_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8988_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver wm8988_dai = {
diff --git a/sound/soc/codecs/wm8990.c b/sound/soc/codecs/wm8990.c
index 11dfbbbdcd920..c8fef187f5401 100644
--- a/sound/soc/codecs/wm8990.c
+++ b/sound/soc/codecs/wm8990.c
@@ -1151,6 +1151,13 @@ static int wm8990_set_bias_level(struct snd_soc_component *component,
  * 1. ADC/DAC on Primary Interface
  * 2. ADC on Primary Interface/DAC on secondary
  */
+static const u64 wm8990_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops wm8990_dai_ops = {
 	.hw_params	= wm8990_hw_params,
 	.mute_stream	= wm8990_mute,
@@ -1159,6 +1166,8 @@ static const struct snd_soc_dai_ops wm8990_dai_ops = {
 	.set_pll	= wm8990_set_dai_pll,
 	.set_sysclk	= wm8990_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8990_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8990_dai = {
diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index 225c235d3d895..2cb7fb9962af5 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -1195,6 +1195,13 @@ static int wm8991_set_bias_level(struct snd_soc_component *component,
 #define WM8991_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8991_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops wm8991_ops = {
 	.hw_params = wm8991_hw_params,
 	.mute_stream = wm8991_mute,
@@ -1202,6 +1209,8 @@ static const struct snd_soc_dai_ops wm8991_ops = {
 	.set_clkdiv = wm8991_set_dai_clkdiv,
 	.set_pll = wm8991_set_dai_pll,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8991_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 /*
diff --git a/sound/soc/codecs/wm8993.c b/sound/soc/codecs/wm8993.c
index 2a94b23319b53..140b9141a9b4a 100644
--- a/sound/soc/codecs/wm8993.c
+++ b/sound/soc/codecs/wm8993.c
@@ -1441,6 +1441,23 @@ static irqreturn_t wm8993_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const u64 wm8993_selectable_formats[] =
+{
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8993_ops = {
 	.set_sysclk = wm8993_set_sysclk,
 	.set_fmt = wm8993_set_dai_fmt,
@@ -1449,6 +1466,8 @@ static const struct snd_soc_dai_ops wm8993_ops = {
 	.set_pll = wm8993_set_fll,
 	.set_tdm_slot = wm8993_set_tdm_slot,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = wm8993_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(wm8993_selectable_formats),
 };
 
 #define WM8993_RATES SNDRV_PCM_RATE_8000_48000
diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 1d64c7c42ed12..94ef284ff15d9 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -3205,6 +3205,23 @@ static int wm8994_aif2_probe(struct snd_soc_dai *dai)
 #define WM8994_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8994_selectable_formats[] =
+{
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8994_aif1_dai_ops = {
 	.set_sysclk	= wm8994_set_dai_sysclk,
 	.set_fmt	= wm8994_set_dai_fmt,
@@ -3213,6 +3230,8 @@ static const struct snd_soc_dai_ops wm8994_aif1_dai_ops = {
 	.set_pll	= wm8994_set_fll,
 	.set_tristate	= wm8994_set_tristate,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8994_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8994_selectable_formats),
 };
 
 static const struct snd_soc_dai_ops wm8994_aif2_dai_ops = {
@@ -3224,6 +3243,8 @@ static const struct snd_soc_dai_ops wm8994_aif2_dai_ops = {
 	.set_pll	= wm8994_set_fll,
 	.set_tristate	= wm8994_set_tristate,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8994_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8994_selectable_formats),
 };
 
 static const struct snd_soc_dai_ops wm8994_aif3_dai_ops = {
diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index 799989a5bf0f2..9723877d030b8 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -2091,6 +2091,23 @@ static int wm8995_probe(struct snd_soc_component *component)
 #define WM8995_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8995_selectable_formats[] =
+{
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8995_aif1_dai_ops = {
 	.set_sysclk = wm8995_set_dai_sysclk,
 	.set_fmt = wm8995_set_dai_fmt,
@@ -2099,6 +2116,8 @@ static const struct snd_soc_dai_ops wm8995_aif1_dai_ops = {
 	.set_pll = wm8995_set_fll,
 	.set_tristate = wm8995_set_tristate,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = wm8995_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(wm8995_selectable_formats),
 };
 
 static const struct snd_soc_dai_ops wm8995_aif2_dai_ops = {
@@ -2109,6 +2128,8 @@ static const struct snd_soc_dai_ops wm8995_aif2_dai_ops = {
 	.set_pll = wm8995_set_fll,
 	.set_tristate = wm8995_set_tristate,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = wm8995_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(wm8995_selectable_formats),
 };
 
 static const struct snd_soc_dai_ops wm8995_aif3_dai_ops = {
diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index dface555f9288..25a6186e074a9 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -2703,10 +2703,22 @@ static const struct snd_soc_component_driver soc_component_dev_wm8996 = {
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S24_LE |\
 			SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8996_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8996_dai_ops = {
 	.set_fmt = wm8996_set_fmt,
 	.hw_params = wm8996_hw_params,
 	.set_sysclk = wm8996_set_sysclk,
+	.auto_selectable_formats = &wm8996_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver wm8996_dai[] = {
diff --git a/sound/soc/codecs/wm9081.c b/sound/soc/codecs/wm9081.c
index 2e4e0a76499d8..824e9c6b5f3e6 100644
--- a/sound/soc/codecs/wm9081.c
+++ b/sound/soc/codecs/wm9081.c
@@ -1230,12 +1230,30 @@ static int wm9081_set_tdm_slot(struct snd_soc_dai *dai,
 	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm9081_selectable_formats[] = {
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm9081_dai_ops = {
 	.hw_params = wm9081_hw_params,
 	.set_fmt = wm9081_set_dai_fmt,
 	.mute_stream = wm9081_mute,
 	.set_tdm_slot = wm9081_set_tdm_slot,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = wm9081_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(wm9081_selectable_formats),
 };
 
 /* We report two channels because the CODEC processes a stereo signal, even
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index b3bbecf074eed..8135d67ef6c2b 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -1068,6 +1068,17 @@ static int ac97_aux_prepare(struct snd_pcm_substream *substream,
 	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	 SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm9713_selectable_formats =
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
 static const struct snd_soc_dai_ops wm9713_dai_ops_hifi = {
 	.prepare	= ac97_hifi_prepare,
 	.set_clkdiv	= wm9713_set_dai_clkdiv,
@@ -1086,6 +1097,8 @@ static const struct snd_soc_dai_ops wm9713_dai_ops_voice = {
 	.set_pll	= wm9713_set_dai_pll,
 	.set_fmt	= wm9713_set_dai_fmt,
 	.set_tristate	= wm9713_set_dai_tristate,
+	.auto_selectable_formats	= &wm9713_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm9713_dai[] = {
-- 
2.43.0

