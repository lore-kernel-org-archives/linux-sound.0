Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246B872637
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692582; cv=fail; b=LmKj25pY3I7rZxh2Wy+grJo9ScB1zE7TtaDmDJDCMEjmH6u963C+UbDuBWUotvRKTsaoxiW+IV5r4QBG9NiTALiebAG93/CTZ6iLyWVWftiqi7iRO0p/vz8pbPt6KOB2IW5taMlJu1WI4ZK7SN/+Kp1o5ochhsEfEnkwTkXHP8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692582; c=relaxed/simple;
	bh=zR/0gf6Kljt0g/Hgwhb8MsJF+j35Kytzk8M1apSg7Ug=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=C12uO/LiCOe4s1fWykUnLuA0PQ+tgXwqEzBhwNspSFj/tGJIhgBaa/5+NmlhmU7lnTrwsspBR+RWPYdTZMStmLuThT14ruNB79cI9OaEADJbYVKKgHW5xbSsGxnUrd1mNIZn140sMNodOg6jB2unGXd3VZmd5D9SfOmti8KswTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a5G1qLP5; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a5G1qLP5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlRs3eMFUS23yFeEvm811ayXKiEjuSD0cLjrabNY3NU/p4RcaYJJA8DBgKsHkaXmpPQdIDr3eKZCsEcInJTF8XDP+H6nofFSOrNPBdjbqYcN9iJJYVOV6p/Z9luYVJJrlo2yhpi7GS/B91MqC1Gc69hYNYFuJ2B6zj7n0TFfoka7fMD5Iwj3nj5JhPADCfgR9/SdNDTG54G7pYmjiSOJk9gw5r2NLMgTGn3xWcImGD+KMiMxzGjiOxVUpdrZoHHARgtSCEZwli0NcpmkuGf128H02dOxKQofMU9WQnu+h7Ypd9jRn9UnK3ZmPi9Mb7oG4ZCa633joo1TYYl9tn8uTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5akabE4T6KzFEjO0NfIoO1AvnMuRablKEcYCpU3XoM8=;
 b=nWESLmynrDHUJ1GBk83F5FB28l7eHskJlauVR0Jr7KRWK5Pcwt9CZIrOV+W1SbUUKKhimlAD5Kaqx+JI8Cdpl+ajyPOST1akPu64swjXxV8/vCZ8id0gJLMfu9DjBMlfazVxEC+RaGcv0zRP2ElToD1HihMAAMhne3/oaBI5Xv9bcRsTTqL1iq5WltrPh8SMV5FolEF1GI4C4omgqniNXkfWfYiwEa7TBMWwRO4cI4/4UVLq6PD4D/ohJwx4HbCcQbY+TZCHSjxFI0ZeLDuzSOgShYLi/q8AaPUMzeNHqGJLwc8CM66gHIjaOhKbL3xQvbwQ25r7mQaNLe3jx2w21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5akabE4T6KzFEjO0NfIoO1AvnMuRablKEcYCpU3XoM8=;
 b=a5G1qLP5QN8lJFzUoRvrWloJ3dFa+QMDdAA7S4F4ttZ/SP0WlqpgUmnda0hQZrJdrOTAIXdMBZ0Zvfct53Vek6gnP+Fu1uh8n01qgOAVccwmxEUS13PHNOE7CVclLMS36mARVvOkz3lWBRaTUVptuimHtFsgNQDq0Qw7wDgwoqg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:42:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:42:59 +0000
Message-ID: <87ldpxzqe5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 14/39] ASoC: sdca: Standardize ASoC menu
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,	Jaroslav Kysela
 <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	=?ISO-8859-2?Q?=22Martin?=
 =?ISO-8859-2?Q?_Povifff=B9er=22?= <povik+lin@cutebit.org>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Paul Cercueil <paul@crapouillou.net>,
	Jerome Brunet <jbrunet@baylibre.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Kevin Hilman <khilman@baylibre.com>,	Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,	Shawn Guo
 <shawnguo@kernel.org>,	Sascha Hauer <s.hauer@pengutronix.de>,	Pengutronix
 Kernel Team <kernel@pengutronix.de>,	Fabio Estevam <festevam@gmail.com>,
	Daniel Mack <daniel@zonque.org>,	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,	Srinivas Kandagatla
 <srini@kernel.org>,	Heiko Stuebner <heiko@sntech.de>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Daniel Baluta <daniel.baluta@nxp.com>,	Orson Zhai
 <orsonzhai@gmail.com>,	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,	Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,	Olivier Moysan
 <olivier.moysan@foss.st.com>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,	Chen-Yu Tsai
 <wens@csie.org>,	Jernej Skrabec <jernej.skrabec@gmail.com>,	Samuel Holland
 <samuel@sholland.org>,	Thierry Reding <thierry.reding@gmail.com>,	Jonathan
 Hunter <jonathanh@nvidia.com>,	Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>,	Masami Hiramatsu <mhiramat@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,	Michal Simek
 <michal.simek@amd.com>,	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,	Alexander Sverdlin
 <alexander.sverdlin@gmail.com>,	Elinor Montmasson
 <elinor.montmasson@savoirfairelinux.com>,	Binbin Zhou
 <zhoubinbin@loongson.cn>,	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
References: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Jun 2025 01:42:58 +0000
X-ClientProxiedBy: TYAPR01CA0089.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a8f885-0817-4518-8a9e-08dda95275fc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hg6T21P/I4uDQTvWGFQCcTzGK1NQqFqLgBusQagX/kg4IxA4bzroQ8lpPoUQ?=
 =?us-ascii?Q?3ixc5HAz4lhxkFFpOP2OiGLa92PeoIQfI0ZZ1azfcIrrc+7TdtcvjKr03ApD?=
 =?us-ascii?Q?Ltr0shx5rb8HIvf83F56ooRq532GAXWMpQszqpxrhzahkXs7eeddnrMaTM3Z?=
 =?us-ascii?Q?Ge9vNtJXJF20RYahfJnWJtClR/lsEC25a1lbkW4043DFur2xBPcJ8UL4mr1w?=
 =?us-ascii?Q?5NpJxICoB8gq/OVOVO1zE/qPKeB88n72HNuIrqOrnayRJiLF+YtZTCS8d6th?=
 =?us-ascii?Q?I0lwl/tvhOerAmOull/ga0LOjNqexq4Hofme5pgibUClFzVYql+vX5Yn2ELt?=
 =?us-ascii?Q?RqN1tOeTsvh58AQRIiJNymyDMclnumSjY2HGhJ64gMT1kV26zXxkENhSULBT?=
 =?us-ascii?Q?O+zXMv0OT8soGPxN4xqGYf5TYjIwFtT93S0jCVwPrYpJUJZCAcnVIkGr1GJc?=
 =?us-ascii?Q?z10BI6IqPP6CP4sje4O6ppd+sHppfeSod6aHOCIa1YGkOpxtuBod63Ba37Ps?=
 =?us-ascii?Q?3VQycFHS9Uvsl4jcvmenlmKSMI7Gv7AeR+7jYgKzOiF2orqvYkoDYYrhX/nx?=
 =?us-ascii?Q?Wvw6okoi9tfE1hGmlAHcZafRLN0t6fY1ATJylbGfX6Mz27MPzZmR/WZowuc7?=
 =?us-ascii?Q?iBRRviWFgoZ4Q4nTdrUl6wbpfmuJ8s136bWCkjNFVuWbghWaKYRrdljNk5r5?=
 =?us-ascii?Q?ShxajWXlST7i1yyMDI+9euelUmDlxNSpWjyq53oAH6fFPbKmvBSxLUNd8QgT?=
 =?us-ascii?Q?kVurbqr/67Mk16muQVlmurJ686j/qF9p9ywWNXJesbI2X+iYYkbhyvI3tamh?=
 =?us-ascii?Q?fkMjK+kPfLD/1tvZxKfSfVtv5VI9zxicqHftKBm6S4eO+6XQgH7WzInFEZkv?=
 =?us-ascii?Q?180WQr+K3KeXI09v33mke2vedHdpvLnBo0gDL8NPjZ1GZh4lBtDvgjKK0huJ?=
 =?us-ascii?Q?ydFiDoy3an3STLTDOLcdx56LgfTqugJTfKQkT79Yi3Onh2pfn5L32x1QZVl6?=
 =?us-ascii?Q?QlImbJpFAxqRHimzNN++Oe8uMTSl825k/C5h38k0rEw7N+iAOg8akDuedCai?=
 =?us-ascii?Q?dDqOIJmFAGDiuB61ndlFJVgx6XmhDaBF/zV/Aoz5JDw1gt+BRBO/mTHg1+KA?=
 =?us-ascii?Q?tEIrd7WRALOMYyMLt3rlKQ9/BGZrtTt7aZL2IDdlL6dNpRsE2GmDzZecsgoC?=
 =?us-ascii?Q?ki/uYPPd+0AYQEJJD6ZQVXTuIauPyzk2WfuqgFIPz1LZRNwlRPcN+zPGhZcC?=
 =?us-ascii?Q?ieR1Mn6HVTWUkvFK++7yU1+l6IV0Jeo1gzOJhJwvsHb4luWZwtLBSkFXnxzA?=
 =?us-ascii?Q?ccD5/gp2+tyhoAFNo2rqMDh54sNY4PGjw55j7WhcYU2tjTWhORk7hvsZiMUI?=
 =?us-ascii?Q?FVRVDpd2/FykyxJyHfpW6cGfcEK3hkUGcuhlZbsnGlPyS/HP7FVEiGMpF46Y?=
 =?us-ascii?Q?VZbEoGSS8QAaJLc3U2TV8UkJUG6HEQlgtSOwate4XCMuMkZ3qFR2v7p4/qNs?=
 =?us-ascii?Q?+N00SZl3UmZPWONEobxs/W0+j6a3ANVb0mEqJaaf23zH8veQmotRs0Sx9g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j0IWYEOstaS9SwCpzDsV70vSTYARpZ+9aj4kC6N11CvQV/k5K0Dw0FnTdNbf?=
 =?us-ascii?Q?3wBiI7fMtNTv4lH/sTARaMQuuVPAzU4tAC1jBkV74bcac+bYPQicb38pqMdo?=
 =?us-ascii?Q?Y8JTGZfxj1+pJcqHyukhEOlHjfBa45bVrisAtg8a2SNFi/rGfdXHEBTR6A+5?=
 =?us-ascii?Q?rits49NRTXb7N8mLu8QCs8grC4GMbf3imItK8cDYWwSGdgyY9KutzVSFGvZL?=
 =?us-ascii?Q?mqgw2HdUcxFrE4XwqjF5mDs3huWVylDY5efhAEmwZMKvhsHGsu1P4eidZyV3?=
 =?us-ascii?Q?xugwQt91CecMKO0YLJxTrMllgnqJDsHKv+n5pYKzXAs12zY1rgAY751ZA1ek?=
 =?us-ascii?Q?vNdivNLlLBOhEbjYAqZm4gCKlY7NaqL5il1Yk4i/+YRSh1bkg+MVLwl5w7YE?=
 =?us-ascii?Q?6jzGfrkNimRYhlZNr59Bogu/u+9uZSZ+LjGUPLtM5t62c721N090SjJzflIy?=
 =?us-ascii?Q?g3hN2DvPHLUpC2jVVYqTkr9cL1QHNCYaWULb7Llw9nbp+2Ipc10v+cIhO5oZ?=
 =?us-ascii?Q?uSiKG48Pm7fWe4jkOij12fC7NoLf9vbVNCX+YROuwH+wFpc/escEeurNZT95?=
 =?us-ascii?Q?AHk4dDRae1VYY8tdHpo7AOLFldIgSF44dNw7o8E9R8XCzCc0Iuwi85n/J+CO?=
 =?us-ascii?Q?7W+XW+t1XA6Vx9JQoMKjBOvCwA6E0kY+iiMdyabI0Vt02eHUaDxUZWANqAup?=
 =?us-ascii?Q?rJ6Hl6hiLNlppRoCMhN+gi+SIZ2rypSkPoxw1rxogLEBdQjbuwWhshZ7qma1?=
 =?us-ascii?Q?dGm4SR54wk5erDEsEqFgXJlmfatX7Qx+FTnyHggJidMHo0h2FVEpWaSgEi17?=
 =?us-ascii?Q?1q320b3HyjCNue2WjU6sILixdJne35z96cE/WvIbtR8+BU+LO3ZzdWpV2lOH?=
 =?us-ascii?Q?jDBmO0I/1qy0WNoagpjVcUutufJ1kgVngUTr8viviI11toYaRIFQuo6p9sr+?=
 =?us-ascii?Q?1WG4xP2q9lYQQu+1ZReAqiHOSs0zbCZlKREUqcWvSuVRlAzODtxEE8vQ6vmD?=
 =?us-ascii?Q?ml5JWh5yvUn1IBr9hn9wnLoNAJceKMutpXqrZaZL1DXBd226dca/N0Cr8qI5?=
 =?us-ascii?Q?mldFWsCTzM3lixEHReZsyLCJ01E6dXm8lY/TkBN3a2sCCoCms+Sfn8aGS5Tg?=
 =?us-ascii?Q?q3BQbteEoH0EO2zrnUJRN4XpATG2csVVOP6K1dMV6D6hyQWLHRLCt6jeod1c?=
 =?us-ascii?Q?pj/HAWkl/75D6vx1KwiGjw+13RoKLnpmFgSs8IHUau76P99Qjrzf3df/7XGY?=
 =?us-ascii?Q?HWOVja/0s2tDxELvg/gaeaKDmMr9D99TCs9C6uPZmg8mi8nfdg4o2denxXNH?=
 =?us-ascii?Q?92XYbH699eO8SlVZtBFx/gTXfbpc4T7CPoFluqGNvw6MAlk+f4F9zwigQRE7?=
 =?us-ascii?Q?zFf+fLzuXrMiOhTWAieBgscCdrF09SXu0AQh+Q8zvYk2V/JGxeF2FJPpY1yG?=
 =?us-ascii?Q?fYqlx15vove9PJfQ1r+EGE0WXBfb8MwJFwv7+Ww5On3iJD8gK/TmvEm2RHFo?=
 =?us-ascii?Q?ryIbt/6ZJoYkkPRhOUPVUXwb/F29W+x5oWG5nRWG8B49/G9gPM8GVedCR3PJ?=
 =?us-ascii?Q?ryjKuHkvl66hvElLqvQTJagS6dfjrvYjcwJEAbhOuy8HXgHRXKBA9XUX0cnJ?=
 =?us-ascii?Q?fCbBB9PIeW+Tlca6S4dz6SE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a8f885-0817-4518-8a9e-08dda95275fc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:42:59.0100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcfnQRlYoB9o/zM3Sn77dP9YCGML7QxBw7FegS4zye7SHxauS33tF8YMbqJSTvslJTnU/GBWXweHzkq7U1zu7IUPQVUo/QSjebKuiPtkT5X5DtODeD05hUHDE84hEMTg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sdca/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index ee20b9914aa1f..71d2a52b2b50e 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "SoundWire (SDCA)"
 
 config SND_SOC_SDCA
 	tristate
@@ -9,3 +10,5 @@ config SND_SOC_SDCA
 
 config SND_SOC_SDCA_OPTIONAL
 	def_tristate SND_SOC_SDCA || !SND_SOC_SDCA
+
+endmenu
-- 
2.43.0

