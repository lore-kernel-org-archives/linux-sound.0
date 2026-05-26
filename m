Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9F52E0938
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761971; cv=fail; b=DgUqv6T0qAG0ZU5oIYiU+67nj7q3IRjGwXi2+nkQUMH8wOQbE0/fxc5/6di7zNktMWmQezcEP3OJMJxVax5BTpGmRVQ96v5vAF0H4nW6jRBGNoO68sPjjH6a94y5WrxRhM5Gb52+cg0sEwjYniPqVbDBxk6nTyvtp9kYnwTViGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761971; c=relaxed/simple;
	bh=j+TEHqEny0QMR9tA5za682F5kLbSzvoCXeHVfhhX7dc=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YB3v3vEgmRnpuc/12y7sYqlrdf6VNLRNL2qi98BKLSiqZhG1NBOx9rG/rh5eLg6d3XOoXUuQURdh9tWLCJlkemIeRXcYdvhfqPryCqwi0FFRC4KUoratF35hEj/eDKOSAs4llqzZnK7ZqfdmSB1h00SLyHAcIum2sgsWi4PP3MM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a6Al8hsG; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a6Al8hsG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQoc9C4XoZL1MsEczGHSpQqxMXqxSceqbgSc2OIcJUdl193mru+B2PAwGkhtMyqgxdN72G5HrnpwM4XUxeyy6/vnlshJzfwpX5rk/fdcdc5FyzPe0MC8FnSXRluQ2KAXDKm2KQxA4RBPVFHC246mTEdLCVMSTQTADPnomdaflSR7H08mOvvnzU6JarC3jzbqFiVhLtIIXs5JZDh38cKAEpRV7PAQQu9hu4mHluKKPky3ddGX5R64T8KiPfGF26LaXPB1M/gkEpQxUjr+gf0tuDfpXr3Q1dN6EB5F3GIVOM1G4rJw7J6hHrJvreLBNaOxJOS1j9Z5Q9FCbJNBq9G2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXsT16YwTNrMryRnrL0G+K4KBM6XXsY+in6Jn9gERsQ=;
 b=go4y1vwWf7F3Xdhd8XstjpCnWOqpSLw+SzDJUncziy8sNXDYAFX6gIBrSQItH1H4mIobK5cFepWXJhqBpu9wDRnWGCxhmHC8rCYp3ICvxHS4KQz84cjTMsfqBJPZXA06P0bXKJ9U7skHFLb/DKkJGYW6GYDyFJoabet3dFYs9ll7wWABBA6kp50BmQP+nCLBjYY4yliQnxqVAHIWBh7lpHjCyRxmj7V0DtpM+c3qIXaYQ4Qu5gouJe0hrzaMQ7KwysP8XAp2EO0viYon7d5QtpJ0xu6BAIcACHAKDSJDJZTXHkJdrgo5Ap7rqO2XmH746yFOLKLtiv6+ynlq0KDxIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXsT16YwTNrMryRnrL0G+K4KBM6XXsY+in6Jn9gERsQ=;
 b=a6Al8hsG13uPlwM3cIiX2CAptcgIk5Hz3YxnT8jXTNwWQeTRFzdN+yh3RsoxnLyFhP9yaF1xOBaoUMGHq1LphSjdAuqcViRkfaCdw6UP6K37XJC5NDTcv4pk1Z4+ISH5kYA2N1MgQAFHZwEW7cdoXU3SszCj7Ow3mbwpPns9kac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11843.jpnprd01.prod.outlook.com (2603:1096:400:40a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:19:26 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:19:26 +0000
Message-ID: <87h5nuhpzn.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 39/83] ASoC: codecs: mc13783: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:19:24 +0000
X-ClientProxiedBy: TYCP286CA0308.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11843:EE_
X-MS-Office365-Filtering-Correlation-Id: eac28065-353c-4cfa-383a-08debacd35a7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|56012099003|22082099003|18002099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	sBwKc0UWomt80eLM7tjBTEOaSsiCNbY7KOoaUldNOavxBH/UVwAlZdvN4G6uQXnDMSeskIqiRHWI5jXbTmDhWqclrh9if5BzLAHBaQCyIGgKhonBW3d4jIH9a5pLz/XXv9g1WJKA/B9eyrC6mrw1Djli77G2E0tHmO2Y/XLiXaxmDx1lSF4w+zSVm/4rGvkXjmTPEFN3IJnDoZ8uk1BxHSXTxosYDB/KwRJNP+b2i2zX46XCXfl3pVzhCUffWLdAvFAyp3Jzpmr6Fw69RhZw6WKdbigjesjRySvcZl1EA23Pg7NFzgCPoxiOqnGt9QkDcfXszuND1wnyuyvJ9/rgjaoLi5dV6astCoWRKBan0Z+R/KodI4Hk/TrKOyaiCskBfzRNA7+lv63jFr0KDrbtbzzB0xo4hSeYt64qYmSwtyV3Fc8+behxllDYGy3ro96vgKVKLHD9POsvH/EGRWPheUCSx5QM29abeilfqD2feqltMm0tbmtFfz5pYvPKslcPCEOGmrsgeQaKt1L4WOX3xhC2hlA4i0Fk1HcWgg8cmipNn/sLQEXjL8jAQuSpia+vLXZsa+j6Lks6ufvwlH6UHaEE5Yem1TGkw2hRZXhrFVl2TJeaCDqVsmZnQO+1Jc65xYsqHxuXkLS1JSCoLGmfOkzSSQw0Iy+9xdZESBGUojMMKyvDIyUhcRjRUZrrf44F9y8tnlNXu19c/UpWOmw9R7fQrnv9zWVwx/A62n+20llk/AtVjjQRilpVZL6yQX8g84pYTY36vqfBFOOzv1ZmGG3udsF0XPjVyqY8h48QVHs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l3VSVY5+/XIcxthch2sitoVG1wuhhoc+9DAqxcToQ9eTmEXxOp/pMo1WyMB8?=
 =?us-ascii?Q?R2oZuRhUzYNTLlBu1vKuWcpx1kNuQhVMUFDupc6Fm2XxO1cXlxmUJNzQtloh?=
 =?us-ascii?Q?589uo5B4u2JRTaqJGkP3Ej/eoaE8sc5i7+yoX3PF0T3FJSOYE1au/64Dp24X?=
 =?us-ascii?Q?9n3d8FLVM0DsCyszBOJgCP4twY/bnnLtV9sZs7EH0zH201oTXdN2rYlQNl0C?=
 =?us-ascii?Q?AbAStpcGTRl6r43DDJw6++olW8yMMFUptwv0iBQ4B7XW2M99zHUsOQViJk4p?=
 =?us-ascii?Q?yzej/ahqS/E0LZ9Xn6qrwmBWg8p7KWRcHX0Lk5ig7nMxzBldM8qVI/R0LLHC?=
 =?us-ascii?Q?FuLkaVMcfIfpjMTuAuokbPyh8sefJqOks1W/2UlfC6qHaxNEsAVxLz6ojTwX?=
 =?us-ascii?Q?r7Q3iqpg8zPtEdN8SQOJSKQmyfFq7v+ahjYZ/TeG6fKVrnzUKMpsJj5/COO7?=
 =?us-ascii?Q?QxSGv1TevcLBnI7jCnqdaJZB9Epv0hkckInkckX9Ig24Im+IQhb01YIjWNWo?=
 =?us-ascii?Q?s39bTqD+u6LpmXgqR6pY10JLhsVybD2pu4lqmb6/bLhCMyXLaryeDwLMLzsE?=
 =?us-ascii?Q?3bSUCD3j4mAX4KWvVfBhIDcTrrIpAfPVk0KsGku66IvO1ygAC/Jnb2gU17QJ?=
 =?us-ascii?Q?I46iJRy43EPTTN43G20YblrByL339+/Q8m+b2Ce3QotZBgKLve/pxUNsXT8b?=
 =?us-ascii?Q?ruNDGqcjEEVJWgfn/1w5mNdqDHe3JMhzFX9Vv8O4s9b9XVv2QmWhkCBgFxA4?=
 =?us-ascii?Q?I7zh0M3KVwsvSonP4A1koSJ2Ki/mcqikNM+GzeAcg8vgS8FxdbShMX5yzN3/?=
 =?us-ascii?Q?u3Vds5j1Yht793JKSBSWpkt6C1c6gMTzFNVfItPOTcupevGmpo6B3HIkiXjg?=
 =?us-ascii?Q?MBDAEpwgqeG2dCpOtvtHnH78i/bKsQxrXgfZLtGVr9hc4qdN3jNhL3tetZ43?=
 =?us-ascii?Q?2msRu5eyC3AyiA2vdu/WxgpjOJgTN72TYyU9SxVnHw9X59xVwTG8aIqko1cn?=
 =?us-ascii?Q?YyYoH3lwaiIcs2PXgGtV1PI+tv8TvdJvLbQ//6CEHfq7W6APMFzpzRli6QJq?=
 =?us-ascii?Q?lzjG88YnqN8nMmSPxLxK3BiXk9gGdGDaYSG2fKD+k5sxIuYwxrjpebY2Us5f?=
 =?us-ascii?Q?qMBG45uFZNk91YmrkNKb7hoZGVrfh9t3j0r6BhiL1Mklq1qaEGzRGO+AqMCg?=
 =?us-ascii?Q?O8YxDgtZQqUc+9FFBE7YJ+Fb7qXwb4JZK+kJwiCRkD1E/N+MN4CZQjqnzj0A?=
 =?us-ascii?Q?QxAdyqJdkcKhLEB+Qb7d38cX54UqtgKwZ5oxzTGXdEHUCdYon0NiPWMyZLH6?=
 =?us-ascii?Q?4JK7wI6Zh4m4lCuZRCTVx6feFtr9kaFaS0P3tT+LgvQFx1Z98H8Irgba3bNH?=
 =?us-ascii?Q?ShDNfoD+9g36oLUKua+XGYTQ5LLGW03Jtz7PgoefQJ9EttxPpsHQYe9+rhiB?=
 =?us-ascii?Q?X/48h9bsAAP+bcl3AhlInmcrPejkqfke4fJn1lkgththYYeY2VyqRIN7ULl5?=
 =?us-ascii?Q?9WNvdSv5ktKaIA28lUKJkZxYKH1v3ibGEVG0zFbrPjj8mLYThb3TJlWD6MGl?=
 =?us-ascii?Q?tNecEmFfTBkSY7uGwEfPU6utBDx+m/BXKAIoYOOdBxI1WmhAkVRgp0e98bfi?=
 =?us-ascii?Q?wS2pWzxFsrpKJ7x7la1b7WhLqMVz1OOjHU9hQ2QgbhBfMDaiuxHjlSeAl0jB?=
 =?us-ascii?Q?1XBWVyq3WEpL/X9P9gPCKSE9th1X3eMcL6o+DGUszZkH+efIzyUSkfAxPmEw?=
 =?us-ascii?Q?eMS1DwEXpjNK0u2OuKYAq4XFB6cib2m1I4a40+8A0vLG3AthlHI7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac28065-353c-4cfa-383a-08debacd35a7
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:19:26.5992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiYoTULxg0f3YzQgOFbuLogN72jbBzynabMLOaETPeRpALerqwgBU1tRImN+oNmhy3YazBZ61Aleb3RWiOZNWzR/qiC836jga6/QnwTPFuXT949j9GiscxM0Z270MfGu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11843

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/mc13783.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/mc13783.c b/sound/soc/codecs/mc13783.c
index 086ac97e83866..a6231a12a9b09 100644
--- a/sound/soc/codecs/mc13783.c
+++ b/sound/soc/codecs/mc13783.c
@@ -637,11 +637,21 @@ static void mc13783_remove(struct snd_soc_component *component)
 #define MC13783_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 mc13783_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mc13783_ops_dac = {
 	.hw_params	= mc13783_pcm_hw_params_dac,
 	.set_fmt	= mc13783_set_fmt_async,
 	.set_sysclk	= mc13783_set_sysclk_dac,
 	.set_tdm_slot	= mc13783_set_tdm_slot_dac,
+	.auto_selectable_formats	= &mc13783_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops mc13783_ops_codec = {
@@ -649,6 +659,8 @@ static const struct snd_soc_dai_ops mc13783_ops_codec = {
 	.set_fmt	= mc13783_set_fmt_async,
 	.set_sysclk	= mc13783_set_sysclk_codec,
 	.set_tdm_slot	= mc13783_set_tdm_slot_codec,
+	.auto_selectable_formats	= &mc13783_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /*
-- 
2.43.0

