Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D641A1487E9
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692624; cv=fail; b=u9KxYkufLwQGurscC9VXcJ9TXG8IqmAYbTXti0Mg7DFPhOntgAaT5iMqJPKzbgu8pYeNO9QOWH1XQ+YVUAfaL47eBOSy9T0MMq+KBt14PSxxq0TU954XnCEeDSLmqTNtbPzkInuV0Lh7utCn07XcuVQNowja5pGbtGtoKhKRuvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692624; c=relaxed/simple;
	bh=v99UljD1CoBerC2lzllABfCIO0/G+F+9x5U5B8ri4oA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=N1zJRM7QTIKQ6ZOM2jBNzC8ng2JlXGAhXgZDscj1Wbfcs91FcUlNc4M33R6YqEZW/it72MC59MpD5lDfqBB3Tovm7h4Wl5tlcxSINiL8TLhZT0sCXCUyLwx+mHxmdCz76hDcIGbQun1iZFdP9FcdFFlj0XXxrhAM2y35Oj6nXHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=InyrQR3x; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="InyrQR3x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwEy5hMcjOd6Bq5KGSVeRzg4zFdwUa7RSgySWG7DSpNIMQRP8PQKgcgcOWqzEOW6cD/gdDbq+1gak8EFfVPWBfEvuiRcfWrfPmcskrOXGnSxW8VJ3yvWWd3pfkkR+g9/U5TH/sdpBDUJZ+i/KJguL1wPRVT0MKy/vRvf7jKnVTPa4N3majQQBvJH2bGxlXT5McCumrdIOYAW9ZKRpqgbNvBaNE2NAJfkfzD2ck40bp2f1sjw43ekUhyj0RwzVVYSVscf0qdqfiZCnSuZTcq0A8FBfTz62byyxm+0+7CdpgaIw2gFIN73iCyYQA/IsisPrcLJzdCMwAF0GdbPCUpl3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wz8ESsTVfmG2z56IGxkc/mMVrpZ7TreM1m5rUdT6uJ4=;
 b=X+3YNdZ0hj1SK2jjJvwI2wq7YbqoFzJQZRSj6TsSqda16vX4iyuxadLGB781r39IynHCBhLwWvhoyvKLgzvZibcVVoJTxW6vIJ/Gkpsfv730SHEOIYvAal4iGzAAJ7LqvKN4BSp/j0+wXDLqFoj5oxPucdNVhIjJYe+yKxt7vE2uVCT0JUkVaE2vHvPDbT87XgSv89QpBKDlLzbAAB0AXzkjJRTKnKr3A2GCuqry0rF02Et0DUkpNp5CoE+GFRvl+gpzIzzFt4kuh4JRk3GZ0rSV5z9Zj7mbuXlU9MkG4eL33+3gzOoZ+WAcfV7qHrKA32E9C73mUabTHJYqhPNMiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz8ESsTVfmG2z56IGxkc/mMVrpZ7TreM1m5rUdT6uJ4=;
 b=InyrQR3xhyPhD5w9qZE7paXUwTrXREoH3QBXghTM2grwdSqhqgLuR7nuTehulffgmwAPDXyrrfOXcvfTM4ws+UyMlnBWK447A8U5+RdwFCKyJSl25uES2Pi+JMh+N3RJWrVDofJLec6lRzPbHf0d/bjBfW+U9cZK1eorWlrcq0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9824.jpnprd01.prod.outlook.com
 (2603:1096:400:223::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 01:43:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:43:40 +0000
Message-ID: <878qlxzqd0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 23/39] ASoC: tegra: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:43:40 +0000
X-ClientProxiedBy: TYCP286CA0128.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: 388fc52b-8499-453d-d6e7-08dda9528ee3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T8vP/qxivhIRp+sVlBiNLBeFmIx/BL3zZ31M4vcn/hbjN2lyotTEpgVbq8DD?=
 =?us-ascii?Q?A53+YUBy2bB4LzsIqm7CZLgx2v+TXGyFIcIdSwvVV+MurVjM21So4wMGQ4Qy?=
 =?us-ascii?Q?j+ajfFhCkMaQ2JzS2OhLQ6RrRs+EWWAyVeEaVAPkBgJmnVx8ggVCsH1u7JNW?=
 =?us-ascii?Q?91+zlstuLmIUOcP2zW3aWMh8fC98ySok2H/qLUU+RSVKCHql/hefSQ9YHJBv?=
 =?us-ascii?Q?ktc7iEOidjMZYmzaSGMZQ7Io1Wd4eCUZ9h598kfP3DYMhctUlYf/xg4/vofk?=
 =?us-ascii?Q?WTP1NnMvdVZGH6IWbJxyeOtA1k+Zv16+7bJEWbTTxKxKKtNKv0dc3/o+diss?=
 =?us-ascii?Q?2svb+IjPm2xIH9oS3KLW7LtiNiih/A+hNTkG99wMz9oLgivtVJclXU1Bpb1B?=
 =?us-ascii?Q?KrkENS8RTxkuow6fdW5G7iKLrvWvPaDCFWWlEdejv7DlotZqmn3ZTcK5qKdQ?=
 =?us-ascii?Q?B1ROCQWeSMVTzekPTF+FqQ8+I5eRl7ghQPF10o1b3Ng9/QNIJoTTTzErkmiC?=
 =?us-ascii?Q?gKqYVyglEdXqQnHNkMISQCj8SW2I13q/CGzp0u+E8bR0RVADP3wfF3C18XkK?=
 =?us-ascii?Q?VC4mm2R5nKLpuOnJPDDoHByEL/Ds9aeowTBeG1q0H1g/K6pZkp+bF4/YuUhh?=
 =?us-ascii?Q?VTHQ+dHi5ZNddrlM3bfmapDrXEy5k3WgMs5PY7Pek/+XB+RQ48xBBSQRrmTd?=
 =?us-ascii?Q?L7zUy/G9Ke40Idz24Ph8U07uoCECgYhBfXTEA4q+itCSvXkpxT80fY+uGsRk?=
 =?us-ascii?Q?wNNINAlMmZ7ndp4nMnUEPbWQjmyZ4+mX/hj5a1uSb9Nl+AnczXqAFLFnYfWp?=
 =?us-ascii?Q?OOg8fzkG+cFZcpaQd/KfQNG81J3oDDDH1XMwm9bJM9FcSh0Md1Bv31T0uy0z?=
 =?us-ascii?Q?3eT1rKqPLqKHMFDvmr/dHhss7sDxwFeypvKwvvwC3HBIW5CudYIS44kHvhvW?=
 =?us-ascii?Q?2Lwfo2UCSQ7iwf9o62+OOG6pzUFH85lSS9zvijwdVoGxCapw6yNfdi8LSDMU?=
 =?us-ascii?Q?FZCuynE6nB2SBR8PrLH37hlcn6t0/sLxA3TAF8QKeBMqKUJ7wGVqf5qFoVKJ?=
 =?us-ascii?Q?NtCVF5HseKef+OVHdYRVGzAo1u8+CqySOEfQPUAsS6v5gL4FMwZCHLGcRwer?=
 =?us-ascii?Q?pAuGMklL3JQCzSZ4Kml9XhkjnQVwlI9YenORb3S6rivJkZiqN8Yuo7LBDLP4?=
 =?us-ascii?Q?8SUUIBFyx8dver/Vt09VrzgfQTg4f92BDef3oeJR/7734vYr7gQUkQS0Oyea?=
 =?us-ascii?Q?0fpuYGUztm0hllpcaxcdMt+kPj+w6AMPnGUSZJsyS34AR3X7FfzMYRw6BeO6?=
 =?us-ascii?Q?Laa9mnPw5Gey5Qc4F+1+H5DvPNft8tJ2iQPK5B9bYu5OakXm7gRujghyzDMQ?=
 =?us-ascii?Q?oUt/Xt8+mYyDPcq7beXQ7vho2oj3PZJO5aHGcDtqu6UKYvSnqOWqCB0sBXDT?=
 =?us-ascii?Q?8k2POtq6Gsdr24PE/knVhNx+IGRYclsRjzR6gcK9zuQZDrUGu3Xb6yq1o20C?=
 =?us-ascii?Q?oUDpdDs8KIdaHmu+KaK+uZKV1n8t4/FRy4r9gdEE2Ny7RqcfK/Mn28iuwA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tN3FH30BbA6BVPeCmJqW1MLs+tQQDALIQ26LRvN6NXjOQ9eNZCGMSpnbR9yu?=
 =?us-ascii?Q?dBRUve42R/+xK0EsB35WANSuXd6M7xEVbAqMrz7oIxA9VzrqIQpqYYWhAb7T?=
 =?us-ascii?Q?RuKFhHhF5eEpBqLv+L7XH0fIjNBlomu37txXECpdWgWlV+D9GYbjBKO1KHrV?=
 =?us-ascii?Q?ngYlIfgHFUqYDXzScOnFZWlQjl3sO0sIF2gNtch6VnZbAft5JIeHAOcNdjP3?=
 =?us-ascii?Q?xYHQH5d19e9Ja/LnpwGEJIIBW9VsBQoIy/hIeWRhOwVpOnQM0UU20M7gE2XC?=
 =?us-ascii?Q?T4fLuICveRMa+IkPJro2NWouyTrazaTr64Q6hj+miaNAfmCFT7im3Jg716LE?=
 =?us-ascii?Q?uU5wFJ6Ehw1rMCVpf5+GtJ0tjbQb61uM2BJaB2vSmXhc7hThOwTaNd3fTY0+?=
 =?us-ascii?Q?GTc5r0jH3SilXWUyY2E+0sEaoHYAjg+y5tHsbUPAmO5nMA9hWjDF+l2LDBVh?=
 =?us-ascii?Q?Yw+CLiskr+U8atqbLCcdZCf/kNFLQh9PTq1/Imz1CU46wsiAo33gzFD2+3rp?=
 =?us-ascii?Q?duoCasbxS5pyzcp7pEuY20XdViPaI1yoKtGItCzSDCDD/SiVip1slfUFLxRT?=
 =?us-ascii?Q?7pIqS3vbTiOQ78F0fYoDvdszu2gOZq/fdzE25pkDK1Ry/yAhDy/F3AKVEvCF?=
 =?us-ascii?Q?kvgKbcydbjRr9ACJ5+XLBjd4ifatnr1gjOirWO8iGFuI38yd8UbdG/PksMcr?=
 =?us-ascii?Q?lVfBNPsbFjto3NR544t4dJpVfNjy18isumKbBjQchWicNi9LxvQhv3hJEH30?=
 =?us-ascii?Q?HZDlAtmB1dKszFMi/1g8IQaTB1p5ErroRc3BVwANtbB7JEMnc0MVxjHR3yfU?=
 =?us-ascii?Q?znRkH3UIdHGHYHikmEYKTVbc5qAn9ORLuBL0NgOaJlI7JfiVmxBm0FyKB0xp?=
 =?us-ascii?Q?xDv+4J5LzLEOFwhDtqNFZ6/Q0wJkpo0o2/IZnK7XvA4U5GrGeD0R0u98/dqa?=
 =?us-ascii?Q?w1gQxvqNYWLtIa0UR4HWqoI0jfsUoDVWo2gs4sj+ERwg7UpdCxXHnrvMXHc3?=
 =?us-ascii?Q?3WJc+CXkvVK6LYZrxl4MgUZSRPy5NM6DfsfHB69VtXPS0thv8GwPrAd0DPpX?=
 =?us-ascii?Q?xCIlMQwri7cM7xIJGYFozmY6yWY2IMDVHF2I9398+Q/KFlXL/dLORK/m8VRs?=
 =?us-ascii?Q?K60P4ISJVvkEZXfXN/OGB8Yby7E95Nxd+Oei9BDtayecCTrP5ANK99xPwin3?=
 =?us-ascii?Q?QLpJZRtYPoReo11CPsmJBv4PKIekJRx0U1AJGkDl4/xKqPZnkFL3YuB6GwLg?=
 =?us-ascii?Q?+oWz6dQgFg2oIHYn7TmJAlhwjMeCLz5LtqndvF0KusgXUUo0QSajNFfrygTm?=
 =?us-ascii?Q?OGlVoVreIDiDCfcH6Pj1YP9vC7O2J7/dl/PgXXiD8leiRidd5lRr7d/xuRAv?=
 =?us-ascii?Q?E8uBWt7hISoecLsf6WPznN3zCMTPu0vS0iZTHbr4YW7Xis6DzCaWGWYbh8xl?=
 =?us-ascii?Q?LZSXnKYhzjhcLQvH4CVUCNdkhJLVM23InzSBkt58c+jMFDiugE8nBOcixwMT?=
 =?us-ascii?Q?jrUjnMgXDn69LTGmqpUfJxewFCZS7JKfRoji3al7jkv9E6wGACam3LsiaeAT?=
 =?us-ascii?Q?jv22e+aJGfF7sOveSu0qghL2PZugDvVb9K8HM4HN9z6NmnxB/gCvSu01DTTl?=
 =?us-ascii?Q?peK0GIN1+bRNPXuI+2U4kOE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388fc52b-8499-453d-d6e7-08dda9528ee3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:43:40.7658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmWLAAyFVj3Pt3TyIwCbCig/8nRQMoWQhwasVLxBEMOsnvJera/r+Is2uOW0fcWjJ1b6MOvyqeb+rHZfIm5lxDQmmHv1Lz+iV5A+3pEWVL3jmyQguCgmMSW4DdcBnAct
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9824

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 sound/soc/tegra/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 2463c22e9cf6d..71203a9197ede 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "Tegra"
+
 config SND_SOC_TEGRA
 	tristate "SoC Audio for the Tegra System-on-Chip"
 	depends on (ARCH_TEGRA && TEGRA20_APB_DMA) || COMPILE_TEST
@@ -293,3 +295,5 @@ config SND_SOC_TEGRA_SGTL5000
 	  Colibri T30.
 
 endif
+
+endmenu
-- 
2.43.0

