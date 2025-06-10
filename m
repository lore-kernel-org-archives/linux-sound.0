Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010059.outbound.protection.outlook.com [52.101.228.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FC525DAEA
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529342; cv=fail; b=o9MtOSZRZ1LPBEind2rVI1ZtOcQFe1oLynCVkyE0+KQj6A9PcWOy4fPY9BkjzRXai/Ix11CVXXindJA/Q9QYy8AlaTF5cCCJx5d21rMJwHSqsGapnzl3IuFd51ary3Xlul6j+vHbUrW0YnnAkeCcfjx60odd4UNFQ6/OlgzHtGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529342; c=relaxed/simple;
	bh=5LC70SC3+0xCUyy2fIcyMMTVY3YaLGQVBSUdzVkoyX8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rnUG9RH4auMyGjaCbFJMvbn9WQtskRbwZNrxAob+RC75WcOmo7mJiUPf2X9UDV/zQJSWfGUylRF0tMtJIdArFUDeQyGu9nytSeIJ5k5uhyTiuBtatOWa5wQxZ6HgaQwduE7hLXcT4TDtJGTu2uRyweY2w2jaEZzyCpoI3U8XLE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=afjONyDI; arc=fail smtp.client-ip=52.101.228.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="afjONyDI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y865JZsbdMy6IF6KTmlhYvt6jL0Z/0JrtBV8ltKN08BBA8t5Jbxzpb+r+i6gXAAO+DoZwnazzni8uo6eLYEyhmmsfcUA47XZJv8NI0Dmzcm2/0lFDEbG3qaZKvnNzBSNxBWnQrPNsY2SRePO4QM0j6TlFSWZUKQ+eI1Th6CgvRok5yqcVVYWEt+qi++jOMALBujUAeFFMZgVG3tZrwQrIP5ZOalHZQSSDRTk+z96IxkpBpAEdJ3HIOfKTqyTRjEpwal0Rt++ZriDahujgQzpiW75pe4lJtoryFRNi55AhJohjCkNwEuKeAUXHPhqIsUcrPKonEFbbIA6gQe3a1YwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87n8Pp+4OaA1y8Ue9+gijyQGAmWERvW543f/p5rpFGQ=;
 b=DIq9o459+M1nr+SSB16zGsWwj7d59iLv3CEUi08zZ9301VcN8uo5zzTL6xBPnj6El362S08W9aqj8imQBJeTjjCN7Scbx4LvjkioAfv1Dfjs3F3qLzJhKrYpZyEPGb583Fa6/wz9/UKpWyoIJfRrDgBy7Ve7J9/vFiKq+jF6P7gd1aySLU8KAEUn1uA8aCdsD/452FDOblwz+6nTaXRkaO8+Xkx5ZUzwI+7jRmt0ov23Up+B5bwUD8oRVis4aOKRZT5BNX+wQibKwr4OEfUXkFCa3vnsUCq461e9j/u0AZj49XJI5lDKHdXcbIS4w5hsNjVj3o7oy5v/jm0HkN7mQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87n8Pp+4OaA1y8Ue9+gijyQGAmWERvW543f/p5rpFGQ=;
 b=afjONyDI5+I1FyniNSRUwPPaApZxFe4e9Eg1S1+p60OIMIDqYNgeubZSJ57rbVZAn8O/flRP93S8A7pxwL8gzS9LJ36DR2ElHld6pbrfiIaCTdjY01DNESMRFtO/D94lDlZYwZfRtJpeYqnmdonr9E8igVUvWCthR6/3BoaJliU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15231.jpnprd01.prod.outlook.com
 (2603:1096:604:3b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 04:22:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:22:18 +0000
Message-ID: <87frg86xae.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,	Jaroslav Kysela <perex@perex.cz>,
	=?ISO-8859-2?Q?=22Martin_Povi=B9er=22?= <povik+lin@cutebit.org>,	Claudiu
 Beznea <claudiu.beznea@tuxon.dev>,	Andrei Simion
 <andrei.simion@microchip.com>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Paul Cercueil <paul@crapouillou.net>,
	Shawn Guo <shawnguo@kernel.org>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,	Fabio Estevam
 <festevam@gmail.com>,	Daniel Mack <daniel@zonque.org>,	Haojian Zhuang
 <haojian.zhuang@gmail.com>,	Robert Jarzmik <robert.jarzmik@free.fr>,	Heiko
 Stuebner <heiko@sntech.de>,	Daniel Baluta <daniel.baluta@nxp.com>,	Orson
 Zhai <orsonzhai@gmail.com>,	Baolin Wang <baolin.wang@linux.alibaba.com>,
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,	Mario
 Limonciello <mario.limonciello@amd.com>,	Yu-Chun Lin
 <eleanor15x@gmail.com>,	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,	Nikita
 Shubin <nikita.shubin@maquefel.me>,	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,	Vinod Koul
 <vkoul@kernel.org>,	Shengjiu Wang <shengjiu.wang@nxp.com>,	Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,	Sudeep Holla
 <sudeep.holla@arm.com>,	Elinor Montmasson
 <elinor.montmasson@savoirfairelinux.com>,	Binbin Zhou
 <zhoubinbin@loongson.cn>,	Keguang Zhang <keguang.zhang@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,	=?ISO-8859-1?Q?=22N=EDcolas_F?=
 =?ISO-8859-1?Q?=2E_R=2E_A=2E_Prado=22?= <nfraprado@collabora.com>,	Geert
 Uytterhoeven <geert+renesas@glider.be>,	Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,	Sameer Pujar <spujar@nvidia.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 22/37] ASoC: ux500: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:22:18 +0000
X-ClientProxiedBy: TYAPR01CA0012.jpnprd01.prod.outlook.com (2603:1096:404::24)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15231:EE_
X-MS-Office365-Filtering-Correlation-Id: ed67b5cd-7658-40ab-add0-08dda7d6632e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h5PszY2MnUtlzcSij8SP3c9itlvP0gygoIh9hTcFTb4vVguFXJjOV345Y7Hm?=
 =?us-ascii?Q?h3z25Oobat1D1Djg0/ZLsimVIQKatciqcmg7OsLy15AB+Pur3OnTKJoWHkWZ?=
 =?us-ascii?Q?hUVVCnvtjV70MxKVykz4o9NgJtF75tAZHE4AtsM2InKM3JD6r45P7JCjtYSj?=
 =?us-ascii?Q?+33kczgHVzuojK/ih6r0rZDUvTkZ5r8T354rJRfiJbqIk23AA/a8oPzpD//T?=
 =?us-ascii?Q?he/JojsOCWO4zBVba3LAbJn4agzf8KGwSKJWk/WIOFiV+HiYf8sYDqsHCQuL?=
 =?us-ascii?Q?EnW2tbQ8pFXUMWIzpg89zHPX1Yenb7mDJhuq4J2dQeHSA/ofngTvsPBbhIfp?=
 =?us-ascii?Q?b1x2Ax4+fi6Nhzd6hvttOSkV3+cH0g2FfpdhxAJLXqiwQQpRSBLCuwrstfNk?=
 =?us-ascii?Q?FUnrTT0LowpaOyj+5STF/X6oJmc/v1ExIpOGXtMBB4XYctX7Fc3+lbtIP6BZ?=
 =?us-ascii?Q?iYaSnti+axQJlez8vhdqmPIUosyYLBsFlSGNDJEc6pjT7PRopmAsQUt2Qq5D?=
 =?us-ascii?Q?cmRIYge2sbfN1guXeo1YaH4fRfW7ww94stsRf0qqFBnP2NWfCY8Kh/8WGmjn?=
 =?us-ascii?Q?KgVsQTR4TQBybER9QVdq2hbE5H6OsFIrUQGHjy9Ak1rMHY7zX/723ZxCjLUy?=
 =?us-ascii?Q?vpt4j5HLUDFq5giBPucg4UAw4a5/sk7RNZAyPbxgYOwZeUkmSM/jnYJNNBKD?=
 =?us-ascii?Q?HKFUYvBP/lbjxOMd7+RsCb7PyWHob6J6iGdMx4o6bkSoIJOWAqSoHdHwsLDE?=
 =?us-ascii?Q?IfhHpks8HBdigzUitGVDvUzEPGtdJYsRbKKNZSZfBUF7ac+Ci/LxJuyPGWol?=
 =?us-ascii?Q?J1WM3G8sPxpAKd2icCoq31GElz33muwVUk/RPE3Vw3tSuCBv7IEK8LbNKre9?=
 =?us-ascii?Q?AzQt7m61zqob4VSxHhP23iZEKmz+sJP8LtLgkCTBrIprBSQ/aDNrKVcP+IKt?=
 =?us-ascii?Q?YGazr3/je+bOPaEz7ykDEms7F802iv/m9tPQWTehafYeFjToKe4Yw4OZMPlk?=
 =?us-ascii?Q?tZoxVN57y0vdBoBbPn/cjnvjdwJG45ZALiRqKzDVdu8LHJFn1yUNA8hoP8cl?=
 =?us-ascii?Q?6IrvihzsxQdoCQpNilOYjZtnTx7wVKnLhg2Pdc6wIA9+FcunxMxu3qtCI5Ng?=
 =?us-ascii?Q?+jH9s2W199jr2OGeEYFdU5Un5pf9xSqXWTvN/+RkAE1m519M4pUUlAXbNzmC?=
 =?us-ascii?Q?RSK0Jw+JRSXrmEdRxhwUbIBmYvjrVEMjv9A9r9M2OBT5FGc2vNzbNJl9Vbq6?=
 =?us-ascii?Q?ifOoBRJoXzLovOiUSqJqkkfBzHR1goh5ZOn/qwA77MgCUKCFEJLO5HmVJQSZ?=
 =?us-ascii?Q?psYwpB9+A6gXclItPJcSclOEhgnpSglCJpSvC7NOhX9KaGkOO3CfigU8xmbU?=
 =?us-ascii?Q?rUQAC9k3lHVzPVPcQZBdThrmsiCHRY1FmlNBufg5Tb7As7vRrqYh6w0SZHz8?=
 =?us-ascii?Q?X9zvHvUS871ujfTK2BgI6XmLxJ4Rh7gbESnKFtQX7NlYKEx5DniScDGUhi0H?=
 =?us-ascii?Q?A+Cskug2W1nRpHscgUgLJKuAfInU1HkmI4eVENJ/5hbWj9nilyymTR/NLQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZJAU3g2LV4Zzuaay8wmRC/CU8cw99EorJ1Lr3jykbhUHNl4QmJw3bAUxBrH9?=
 =?us-ascii?Q?ZOOg7H9wyGb+1SjhU7EkyHpFOkHBND4tO6ImyBVsOBHKk8uK2ieHS5QzndTI?=
 =?us-ascii?Q?G/cv5AI57J+tOtycyuFWUbJNBaz6v8pJ0xjTaIncRg07E1jK2eEJyUV/xupn?=
 =?us-ascii?Q?BPb+1ZryMYJNrolikq+ug6qvmJkr8tBDal17caaGmmq0tPJJxA+zvvuCDusO?=
 =?us-ascii?Q?81v/0A6Xj3VIvTDypfbjCD+Pk8pswIwFgjp7C5IoPepSRfsXF6bs8nE04/ss?=
 =?us-ascii?Q?j61vmNSBT/wCdn0OSfdVKwg8MCh20wHA/LmdYMrDs20EyU2lHAUYZ0wF/Cr5?=
 =?us-ascii?Q?oH7gOOEcJ4TBiF+K4MHVwTXmvPi10B6flk0hcLI6GKFCmMgilDTIpvtz8/jQ?=
 =?us-ascii?Q?1E61loIxJJat9CRBBON5m3ARfxYfOmtGRJsgGuPVutBBqBwsQXOc0ciH/9Hz?=
 =?us-ascii?Q?peA6xrmjmkMOIfAOse/bWbdiSu+wGQLtJsqhPlq4vs+iTmn5Yb3AtfnH6hpq?=
 =?us-ascii?Q?DxwyKG2QEiFIv+9Gdly32h6FxO7FT+YSew3TKb43BPiNLBQyoreV9vgLCVUP?=
 =?us-ascii?Q?+SC67+jKLrMHRK+Ae2wWJ8CJEi3P55qy3xuSLd5vyIoF2g5LvV7+A9+I3zgQ?=
 =?us-ascii?Q?wzXEXgg8jAUi85AF0byHNvo1m1JHJPl/MvVMZ/JpmgR4dmFIFbLFc9f+GX+m?=
 =?us-ascii?Q?n25CxhFEoU1t8+AkiYWjwJJwDdIQN4zqvAv2HAFtlABPMJwrHmlpZc8EjlLk?=
 =?us-ascii?Q?S07pmP75D/qKeKidoses2ovX/tf7sdfxFuqRrN9vpr0D4l0EXHXspiuGsnjw?=
 =?us-ascii?Q?u+EGx786rQfWwGMZ6AZi0bY/WjFMn2LJwkevmqxwtl4IzzTuxGpOBvUeXF9m?=
 =?us-ascii?Q?BZwZUCxjAHxRyBVdOr776NJfSkNHGktbGZRgwHgP277hdpc9sgaUqNGE9b3R?=
 =?us-ascii?Q?8+IM9KSOfcvF8x9Sxz71kAIm4Qd+l2MrQ780uYQSxQ2TQ44cwM3d24dRaITl?=
 =?us-ascii?Q?jA/U+PkRO6dSMLcjhtNGXue3aKliAgwUKg34qFJWyu4Sws0rL6+qdS2rM3OD?=
 =?us-ascii?Q?lTZr9dpj+r/6KslZ4bSCk7ZrTOYRfN94+O3nxHpl+uwutlA+RpQdLl89KGw1?=
 =?us-ascii?Q?5HS6jl4YWZm/pQP3uGKXnZPai2CMOULiDfIhPijxQ3L3wBy9HhaYr+ADaW7W?=
 =?us-ascii?Q?zd5jFWLX+mb0fxbVRNmqzq+g6SOWcIkwBv/p1x2N6/pTltqwMu1kCpGQkrN8?=
 =?us-ascii?Q?KgATyA0IMHSa7pdn+95djgrPSX35Z8fEX87s72/oJN0SqqxBcYlewlmFySl/?=
 =?us-ascii?Q?TR6tL6IBBqMO8IrvPuXnjm+HmIYX+RZUXsnDD497TZC/uT9ZbXLEoOV9UfMJ?=
 =?us-ascii?Q?TgiGGZsDf89AAf/YVzom+FUF2THRk7R8VxyTEZfHbS6s6j3Z+R9Vu38h2/z+?=
 =?us-ascii?Q?EJw437CnHak7r3rqGB7OdwmpYmowb7d6264cq2wi6QyZh976+Ah2XehnMaTh?=
 =?us-ascii?Q?lKj2Ck3ekTFyU/Xj2JBx8zDNKaYzt1VGESwhHfuoB1JtoUiulBgYGm1/Ezdc?=
 =?us-ascii?Q?AD3qzGGiCgtnrkKgS0xGXIN5JnTPIr+DwCCFu4GAaUo4x58a9hz1i0fzi/Yz?=
 =?us-ascii?Q?CTCBkBDSyuzgKhhgvIn8/Ok=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed67b5cd-7658-40ab-add0-08dda7d6632e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:22:18.6527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvyjDB+LfjSVIBS7rBM6r8xG6RYRm9+Za5ZMG6bgQnSh0J/IP0EYYqi4ixOsrRCDzAEPGbI3pzBpr1yo1FOUFsYDgaiLBVre6TWdrfYcqyFRpdX2y3SBKmzZtJlIVzls
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15231

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ux500/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ux500/Kconfig b/sound/soc/ux500/Kconfig
index 34b2438b52d36..1df73c5936e93 100644
--- a/sound/soc/ux500/Kconfig
+++ b/sound/soc/ux500/Kconfig
@@ -3,7 +3,7 @@
 # Ux500 SoC audio configuration
 #
 menuconfig SND_SOC_UX500
-	tristate "SoC Audio support for Ux500 platform"
+	tristate "ASoC support for Ux500"
 	depends on SND_SOC
 	depends on MFD_DB8500_PRCMU
 	help
-- 
2.43.0

