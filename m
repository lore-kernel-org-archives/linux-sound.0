Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2BA14A62B
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692620; cv=fail; b=USdGTXyNO4QmN2eqRWdy8AeoswjC4M8u0oK37lV6Kh3Y/2mWRCo/APt1Gd9j9ZHKPjknt3veiScpF30/1a585MQQhZtZWJAc+BCBMj14vAjkxWQ1qo8Y+rGoeYY+aQnnmBvYAv8JARkX2lVr++eaZh7G/keHY33cHudPM3r97Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692620; c=relaxed/simple;
	bh=1BD+y5Nx45QaJAA/kgfNMfM9T6Hsy2bx8Z/3ipwAb/c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TZcMEL0aTSG4PYWAtCy3HsLEi7HGHvp5qleCspzRP6vZAubyUnNVpGRzLcbBTB9u1FraiqPTRLrn1fYGVVGD4r4g6QUTEEk4YL+ZpMjmF+eYlHJEjsJpWouAPzNfqTdcpz9WlXxCP7xfiy1lt6GfUdR4gGVD2vU1IJmbsURZ9oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DZF978M4; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DZF978M4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1YxIVkvhSdgriX5A99CPvCoCsy1pd5YV/xPPCkEwy8aD140RXqHZ9a5zbCKHxpyt3VWYv6eeXF5PxwAZ0N6/EgUmvOBsASNoUyf99nIhy0HhPoCBH4wxpcVLrCNAblQapTN3IAjmQZqen1iGjkTPuW5qv2s1nPGlDwtng3lG/Z7aFmiqh5oagWHjTSeLUDnB77KwbNPbs1D4HTtDAPf9UCGSi9kMKs4R/llr7L0e/aM8soYMMaQfChnFZVeVi3GXTK/ZMEyHuzQwfEUGNmfx2MwZw7klGneNOhWtPqfxZYZcAiMvWuyHt4FJeyWOxHKa1iE3P4hnopK4NF5LmI6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPuGwcA5E4q0191umUksmhxrx7vlGAciMlEs7HC1pzc=;
 b=T+XicGE7RhIsw51m1Klqd6B+34WE0RxLboSkQxsr3Nxsvy4cDVUQb9ZZsiKiAnjh3G+MEhkrU7bJg8cxg8ghVBIK2nZQGLFjVFkLYp9T5USXHlhDJh7b7MD+aJPPhl6O+iM1K8akKdR0EsS4h6QyGrbhvkQCTJXsodx1hZAnm2k3dzYRH9OoUcNCY0WMkr3n8xShRcxxu+Np+bxoMCD+nsShDDz0itz6zX0JLmpfgFbFkMSrX9Ogai4vQBJKHSRziAVOvrVsSADme3VmTcxH7+AMvX4Zk38c2bBSk1pLLhtARDEXzlSvIAelFIms6a8Sqgg0Y0umRjMOLpGA4ypIQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPuGwcA5E4q0191umUksmhxrx7vlGAciMlEs7HC1pzc=;
 b=DZF978M4Yj0QoWll7f6DX2WMDiiWyux40j4rS2SBMm/RBQO61OoCTzwBI6GofTL7FoYRVfS6sVxXIYqWMeMsoHOMBUExip4EVFh02415GnY1DneZORbRpBpRdGGawGwDUVxsuYI3rpsyex/Q9tSxDmFpRxxfsrIAUzXEikXJhHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9824.jpnprd01.prod.outlook.com
 (2603:1096:400:223::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 01:43:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:43:36 +0000
Message-ID: <87a56dzqd4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 22/39] ASoC: sunxi: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:43:35 +0000
X-ClientProxiedBy: TYCP286CA0139.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: 01083208-23d0-490c-9a18-08dda9528c22
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aWDBT86D+ZT5lzy4Y3Q40Co4IRAYNNi51Mc+MRA4f94iDk62owmFSCHR21JP?=
 =?us-ascii?Q?K3gldyVv+d62SmE0WLxFVru8uIZ5qoevN1B6GG9SlT+TkoYtEVP1tGWSG/Q4?=
 =?us-ascii?Q?wt5h0pl0me/S5N5aN2nNReuNVAurWSuzS/DRcsJFqV7CqeoEI/NOm7mluKJw?=
 =?us-ascii?Q?ozqZAVXjgLLx/ndzwqRGblG8ViFXSmuIAUBxNe5QA3LDJP9/fz0wOkx3P+NE?=
 =?us-ascii?Q?Pxv+uDfpg/xzNcACOPeURwUBblu+LA2+KczNO6zlxv7qmZtezPqlZRMzaTbS?=
 =?us-ascii?Q?mPsWXEcttQ6JCxf258IhlCOUzVNavpJ5Bkozt87BxP+yqHGWERW2oM8JPcRr?=
 =?us-ascii?Q?8ks4oEF8R1IyEJcEPlNUjgDUwywXzNPgUtGeoVhAf6jgsyIMCtjpSeDebeNq?=
 =?us-ascii?Q?0kR856UJjjMfaL+wWj1q+kVe8g7BYW/cfd+cmgsRZNyc9YxJhV7d0r5jm9cl?=
 =?us-ascii?Q?ZkEZrgASHIPDdH3YZMNhdRHqwGllMRs4xCfJ/RZ9z4dRIPocsvRpz4CFq2ie?=
 =?us-ascii?Q?bnVoUkbLpQbRqHETgh10I8n9cCHxmffcWceqZDevOjanXgeBYRbIVaspdLqg?=
 =?us-ascii?Q?TL9GXFuZGTjP+sy+m7Me31wd4WF7fjuTn/5bptXLDxf/oxzwsSrvfWPjOzCF?=
 =?us-ascii?Q?gr9uXtGgNtyF9kLHDYItf3d3QOd6HdCqUtkU6Pfip8f3Xp2YPEIB97Gcpp6x?=
 =?us-ascii?Q?DX+tCTnXGWPHCGwysxw+4urnezOBiTIQZXrxUkP4H2P7MtIRU9PTFldcc3a3?=
 =?us-ascii?Q?4DlqSBhihSCeB9qHN/im2JDZzHqxyNQiKaKBdKR+6Jlu/h+7H3WSarkvWwJJ?=
 =?us-ascii?Q?p0UGwi5SjGnfymi2JM63KgQVK+o9lrkjKDqxE8m79Af9krOsg9AVIVOMUmzA?=
 =?us-ascii?Q?klkfE2qrRy5G3B0Wb0HTFA6p2RpOA93IBMsh5/6G+EMkFYcUoZ558BB7wPYh?=
 =?us-ascii?Q?kWgdYwsiWynHNutnDDrENez0nTdmKtJHhvR5XksMCgwCyatbonxfzZ5F7BK9?=
 =?us-ascii?Q?7zavLnGqZn7oCYAeRUZytXD3Yx4Dunv7SF7KSWc/Wzk+NETclvzBnQZX8bKZ?=
 =?us-ascii?Q?xMjeY5/ufF6MN7CEFdnvhW7BijkCe5Xt3EjA+vV6nV6coAQz4wR8eiiBYgDp?=
 =?us-ascii?Q?c/2l7qrGAsQmksvKRPsY19UGk6vKuJdXRtnAC2Hze0zsBRtrzZ9Kztf8BIJt?=
 =?us-ascii?Q?5fg1kr/QSQr011WRKbwhblXl7hC5YHibmB476UcyMhfAcRSLIrRjoBYA9fqC?=
 =?us-ascii?Q?oVXizpYJXcpa/GVOMIZzgeSkGv/JUMbPjxgJVOew/JusIWpr7hcit4ySb29r?=
 =?us-ascii?Q?MglxmZDD6pF804kaMmIIjDMmJvoDFs/Q0TccBVaxq2pEP9SQhmP+6coqeC3R?=
 =?us-ascii?Q?dlaTjGFggV4yX1nix8HxwjDkhr4TWcAslrzwoZRwugM1Wieu+XNBvHgIisQp?=
 =?us-ascii?Q?2SSPil6d8SNIdfvHw/uZjC5+8eAFpV6/QvNQr7/+fYFE5Rzq9r+2WMnNTO4D?=
 =?us-ascii?Q?J1MxAzItQqfS/ei4r8DmwxV/mmbCCH7i7BbTBYe4Af86kMd4yqrl8OcivA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ShLu3K5oRQaSw+hgwN2X4wcDWTEUh/HzjhZMP+IKgU/c1wW6yTxHtXWKYx/x?=
 =?us-ascii?Q?7nfYF4Wrz8EZC9rjvtYZ5fIS2RNCf7mVKflMhr7UwnHf7NglVVb98ypqgqXy?=
 =?us-ascii?Q?MkHxUU8NT/rOBrbiggCn6m5oR7n2WNUw9FkRMvILtpaJ1GGnJMF4x4uoQSdM?=
 =?us-ascii?Q?OLr9Z3RrBBNYF6a5Nc66YX1JFJ/zjNzl3ZSqLicCvgn66Kwa35lU1wsHfoQ9?=
 =?us-ascii?Q?QjZjjckiXeIOqm3zh5uofWTlNYOvaPM/EtKnMXDmCHNu4KVp4n97GrG3Og+e?=
 =?us-ascii?Q?yK7Ld1DOu1iIcRdz5sDFiIuGFNZlF8o+t8gMw6HUSRgBFhtxCL750xulFutI?=
 =?us-ascii?Q?seoTJpPh/2taB9KFQ+CSc1JAqNkrYigBVGhPtZ7a09nepf0b0UHjL57kqdFK?=
 =?us-ascii?Q?Oh+fuhMbpzmjutCdVj2MHf6sF2PA7pqspXYLWXjBevIGUafEOZXqFsiQAfCp?=
 =?us-ascii?Q?ZqBJYX8VjEBR9dkDZBRqSVdIC06KYKC8i0B323Wh7jBJiYCOBt54AT6YT/Rz?=
 =?us-ascii?Q?ITAOv7SSJLPsTTSYNe/VfyDsbEfjwm2/X3RN4Ee8Q+41/jFtSvO/BvnSmvuz?=
 =?us-ascii?Q?oLv+XknnuCJYNm9KtoVShw5mTJq5GNvZPN+PnNTI8tXHdCZ8yO/kwQEa1aRx?=
 =?us-ascii?Q?CqeIfjrmNqbaahP7HqOCwJCJIkXjDT75sM9cPDccK1cV/ye0MiVQfh4NhbYB?=
 =?us-ascii?Q?SOo3LWzaZNEeO3k9ctTU+mcVAmlO5BBoxR5ObHnOrmW8OANHKF1ZgOBeldvr?=
 =?us-ascii?Q?oj7PaOwbK/Vbb8x7wmdmP8JUlOnqcSjUdFP5NaoRR3W5oOu0FN3KEkNAdMOy?=
 =?us-ascii?Q?ofxcfNrW75WVnKbGiW3SnCBE9oBc0BzJCf81H4OnngJd7TUSWaoY00/Vw1UG?=
 =?us-ascii?Q?idtBq4C7EphZAeR5aIGbByIXSreppuTeYntHexM6c5i3P3hHuI1WpBhHSbdx?=
 =?us-ascii?Q?3H6gkaF12BoUnSXaaZZCwvSot6guA3i4ORp3TvURTW30pjc6Nv+Ouq08erEn?=
 =?us-ascii?Q?K0hEDKyg3KHFobMMb7e93bdluGS19z0lCq0lIbsXySS390MpkfJdGbETtjGZ?=
 =?us-ascii?Q?QbT7CYYiRpcwUUXIItmf09Wt3yYkIlihfwjfJhTEg+v70tKQSywlwedw7ZiF?=
 =?us-ascii?Q?jIGvN/t+3gXOR5jY9oe4pkZYAY5XCyt4I+oo2okJcDFa+qLd4QW15SJzfztr?=
 =?us-ascii?Q?6QmnLd3PF3CTbj35CSAqPVEG0hWWxUdIwXzlZBd32b8l4jZLU5Z6EfpOgSDY?=
 =?us-ascii?Q?Tm7062lBZMStLRQNyqwXBsCpCSFIwPQu0DuCA27utwRAVe5rVT5BBwpxyMN0?=
 =?us-ascii?Q?tuG1myM6J+kBLG8Uqo/JmA7A/kdFKaoIp4H7nPSb5MuMEVQue9SAoGxn7sJi?=
 =?us-ascii?Q?ey4uBWElkCmg7DZUMSMLqpPj+0JQqN11jbOM6FxWs1kGSpB7D9Ls1d8GaSGe?=
 =?us-ascii?Q?wTxPInECUTyndd6d/wKwDhELcYWBwlrdShijq8Q2pAjS1fre54zGsAXVv6I7?=
 =?us-ascii?Q?GZvEdVn/fqvbsprHRqgYngEwB5Pkhk0XZax74HGlb9LYSqbjguvDlWuEe6c0?=
 =?us-ascii?Q?Gm6Uc2Mc/Kcn0+2IF5csbu8DMOJ/WoZRdigEc2bwj4DHhx8g9tyzVMGkxyes?=
 =?us-ascii?Q?fn3/MjVx4BOdTBroi7pvve0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01083208-23d0-490c-9a18-08dda9528c22
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:43:36.1676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvpVZ+g99/PZ8eWBjAlKmyjyaAuOrWyBsgweGsQJXbabs2sE4xrxy8ZSTh6BcVOyggrAFaqKrJrtONWsPBU8JR3YedMYQ/BA2Sn+409MmpJPrurXPqqd4juPG1Qmf0kL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9824

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
---
 sound/soc/sunxi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
index 1f18f016acbb8..205f422d9ded1 100644
--- a/sound/soc/sunxi/Kconfig
+++ b/sound/soc/sunxi/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menu "Allwinner SoC Audio support"
+menu "Allwinner"
 	depends on ARCH_SUNXI || COMPILE_TEST
 
 config SND_SUN4I_CODEC
-- 
2.43.0

