Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2226E15AF6
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692772; cv=fail; b=H0D/icD+C85trAjcfR6fw5ILGkMSJiWx8bUe6qH/GaWHgDTMQEu28kzL9BXk1lcZFcGf04FFzDOT/QGdgEYWy7jXNh8p6fCSaUyEEN0unMajZZs2mNWnGVyI2CMeOdDikXkAlqUQncXPrVSxwKFGTO7sWZUk93vgiWzgDVr1fQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692772; c=relaxed/simple;
	bh=JrSOnEQGmq9kphaKHNPoZFiYQHULbiHJYFRIppyT6Yk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Bc4zJiZ+/gOkQe+oh/4LBeexC1MN2yeHN68W/tJy6TphKdWTxaCnljeyzZGn4sqFUP3ouL6HxtpPUXCCiOS52KqsF9HwwZDTKXH91fBnbzcbaYc6ymEwKoy+Yq9cct2k6PC6iZjh2w5zK2ZdfmyOL8yFOtLlmeGw3dngeiQ9JF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iRYP/5VK; arc=fail smtp.client-ip=40.107.74.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iRYP/5VK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJuM9XeT870emuvvH6ooPTqFvuQc9IhhYPxecEkhRCvom0UXmpoOesgiLxE9I4tVnfKeblyx6cMDu1F2T0Eva+Br/H9JupGBTC6LyIZg0aWUTDuMzMS6oLVtkvoMo2X9CZA8/N3ULBT6TBYkECvqQF78XFID+5Z8g6ic/d8vpceUP1psZDkHpWnl1VYydHysxjl0dEr92xQ+pkulN5AlJKv/NLAMa1+X/9ywQ31K/mJ39N4zDn1tKF4VjeTqEvziLwjHp7m/aJGrnis4GkXTKK/Bsli55dpDJ5VNkWZ3vrNT+K6bwexehh9pNXc5WjsXr3+ypEbpKHNubRQecSmgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ux67MRQu+sIbBS9gi4tzOIpwkkjG4H3xco1rGVAP+eg=;
 b=G7aqZjvpN9rvU76xp9nZi/DoLitgaw/dp2PH6P6jhPfn4Dvb5karH16OlcdQ+VxPlHEB2z6/MYN9SOeWwJlkv9o4xvtLt65O6GmffgEM00WSNMnyac3P7u4a2qmYtP1vOa8t08FQOcPejyFK1OTe+TtU+0bnKYgaEImKcR6QHX4sLmX19KYZ9whNkTAzAIq+KeFMTZkQSl+iOJOfQv37EMQOcJGX4DEEQLWnFLRza+Uuumqfkrv6mLzmR3EeW18gXXKJCShJKJz+3EpArWpPaqW2u/BaYrFoC6gzaZTRJ879aXd+LvEp1yoIgLeImP/KxGzhHnoqYt/qUNuzxY+dBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux67MRQu+sIbBS9gi4tzOIpwkkjG4H3xco1rGVAP+eg=;
 b=iRYP/5VK8DzoilkS4MQEtW1Jr8i798Z/XqMUg6DXp9kbehIaN5XFjUoC1sccv89YSfQe7SRSZOMDvFKmaQ+5A9zIG19MRVC/bcz8gttjYi4eDVoOMrrzHQnRizLIcpueYB4veEJHfSkWdpplMaHWxHugctl0jx1XNp3Ob6fs/yo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB16176.jpnprd01.prod.outlook.com
 (2603:1096:405:2ab::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:46:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:46:08 +0000
Message-ID: <87jz5hybog.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,	Jaroslav Kysela <perex@perex.cz>,
	Martin =?ISO-8859-2?Q?Povi=B9er?= <povik+lin@cutebit.org>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Cezary Rojewski
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
 <michal.simek@amd.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Mario Limonciello
 <mario.limonciello@amd.com>,	Yu-Chun Lin <eleanor15x@gmail.com>,	Vijendar
 Mukunda <Vijendar.Mukunda@amd.com>,	Nikita Shubin
 <nikita.shubin@maquefel.me>,	Arnd Bergmann <arnd@arndb.de>,	Alexander
 Sverdlin <alexander.sverdlin@gmail.com>,	Vinod Koul <vkoul@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,	Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>,	Sudeep Holla <sudeep.holla@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,	Binbin Zhou
 <zhoubinbin@loongson.cn>,	Keguang Zhang <keguang.zhang@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	"=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,	Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,	Sameer Pujar
 <spujar@nvidia.com>,	linux-sound@vger.kernel.org
Subject: Re: [PATCH 32/37] ASoC: mediatek: Standardize ASoC menu
In-Reply-To: <2f9e2735-a95c-4839-ac8b-ad5d5fdc4012@gmail.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
	<871prs6x8s.wl-kuninori.morimoto.gx@renesas.com>
	<2f9e2735-a95c-4839-ac8b-ad5d5fdc4012@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Jun 2025 01:46:08 +0000
X-ClientProxiedBy: TYAPR01CA0004.jpnprd01.prod.outlook.com (2603:1096:404::16)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB16176:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f1df54-0ed9-47ad-2473-08dda952e71b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iDYfNmhP6lBfWILZxVwGqWeKFa2W/WUL2+POYQFl9XQQPqkEV9vaGjSgDQJH?=
 =?us-ascii?Q?1y/Ju4vyW1iMqwKy/TuTbAwcEG15t1f/+uHV0uf3+ErbKZwprVr5mJ3Lh+Dv?=
 =?us-ascii?Q?lw2wQdKxwTAaPLG8HvesqHfC/aQqaOVtfQs6XGSfxvFleycM7LLhKrZNLGI6?=
 =?us-ascii?Q?GbZXoviqf6YLyTHdymSxSk8k/qT/7v2giMbw8O/lvgK5sDNkqvU6WYwVbLFd?=
 =?us-ascii?Q?xZ3pHsX41q6oh88FXPQAD0lJXL16QPjYsWaxwy8G178ZgS7fixwHI1JY5hhX?=
 =?us-ascii?Q?h6splS48MbTpZOxjkGVoSLj+CUn9Xx4bW3L7R+kU+XtyC/uU5UASxwUd7tM7?=
 =?us-ascii?Q?6Ez/cJToqdJ0eVwv4n7wDkXEa6MvtPP9XLg9wM2FEsK5O7YvUPnPGB8VRLHy?=
 =?us-ascii?Q?v8WbCG/U2XNeMdNxGtWvcMMBqsiS4iFn9gfc649KwrD+Aue1kWTJllc2pTtE?=
 =?us-ascii?Q?GRPDZ/iJ1GBqWqRdPviAKrbJqfkin+K4T9pW1nbmvFw5kHw1ngh+LGb56YvQ?=
 =?us-ascii?Q?I3dfK8W1UJU/yHrZg5USEsYBjiIA9R2ycTDgbpw5bXnqg/GegewFyk8BCC/B?=
 =?us-ascii?Q?5CDgJ908AToIVXpEvRkJKUftBg7tmD9h+0rliS1/N7sOmPwmAtNImgJdAwin?=
 =?us-ascii?Q?WYsWknsnBsZ4rBf7azGsAXPdunK27OITnXaYhENgmpC8cwEvkn7WydL066o4?=
 =?us-ascii?Q?OvnE5/3GuOVt9XTpg7yc4rBi0ZG7tsAi04ozSlcGLxExGBLJBnNd0oi/ldFW?=
 =?us-ascii?Q?lFW68M1NuiYf5YKnpTaphaubK6yFjOT6wp2IbSY8Kjyso/4ybJ+iBNd4x8Um?=
 =?us-ascii?Q?fo0aLTj42oxUmmZlZVXv7AovbYCTThmwhPVmEnjlUX7N4VQyVXQlRFCnU4nb?=
 =?us-ascii?Q?PiOeq3vJ57uJg9jUpNfNzka3W29O7/d4bct8JM95HEwt2fmZBgAek4CnIW4L?=
 =?us-ascii?Q?4laCKAY2c4F8SqSBECljGtrqU2wnHsx9T2Up2LrLS/Ae2Ei+iqEAr3Lwk8p3?=
 =?us-ascii?Q?/suXNfQP8YOmYnvTJJ0mDMFPmW7KTlv1A95XHTxapDOuMwZvBOXEaImppfNg?=
 =?us-ascii?Q?IAPDSezLCOv4fvUN3Z2doMlbSBn6hC8OfmTagJh9cK2ihaq8H7pTtie1l5tw?=
 =?us-ascii?Q?SIT4hDEEu4qOl7YcuI/yGQ1Ci+meqIgALAL4MDPqNIjxGpXpWShF0dJu6egT?=
 =?us-ascii?Q?JcYuLWhcWrFrY9pVTNS9VhENhcvYBsz85+v+dD7wzNlUiBglBG0qR0ChurXU?=
 =?us-ascii?Q?jzFcPGLGxHXoV7jiNsvlWEXTJb/09NS5UxWjYcKemOaD/kYv1x7OXe/Dqnn9?=
 =?us-ascii?Q?46akHR5Sy2/QJ4o3zPKdDPSg5+pMQi8xSTDIqD9WWvtdunKpQ6CfcFKhOYqu?=
 =?us-ascii?Q?Yxpw4qMm5u+7IDfne69fGEs/ofXqSqfyrvXq3B+EfOwXX0mbNxoKgNa29c2r?=
 =?us-ascii?Q?2mjKvAg3NKKJpQQWYv1WzVC/BKn3pqWxwjrbPDHILdoTnLOt7lOBjJ8r05zm?=
 =?us-ascii?Q?NWjOqN6DJnZmiMIP0vaGIYN59pn2tljbbRxd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SsesLSEKwS3LwnNAstIFdEBqSkhwfN78oh1ohjzlcdMn5O7j62memxY/r9KT?=
 =?us-ascii?Q?o+2swn84buyD5hwqX1EDRPdXFKToWNCRRHSs09vFHoeDBjoO6dHhyiVsG7EL?=
 =?us-ascii?Q?rmuhCn3+oBXPL8dLKQW+TUGov379+S+eJjXvB8YIJv4+IHDRBHNLleWuBbI5?=
 =?us-ascii?Q?zW1cRJkLaNaQ8TEmWKgV9NVi5dhqywLzr991LI8nBwYZElRvMM86qwIq4uNJ?=
 =?us-ascii?Q?UOxrNcn3XAIHUl6h1zHGKDl7tYFTCcB+awfR8c2qt8SqDgwhHc35hLMJr5rf?=
 =?us-ascii?Q?/IoW6ouFXA+iF5V2xdm/VEcOlXEdSTyvLOureFgdwK/ivJWYI8oRawzKcbT1?=
 =?us-ascii?Q?rUobbEWeRuVSQlOrQNgLvx3RLU/vK0jTYu5v6XI+rLP7EoadZf2QI58RnB93?=
 =?us-ascii?Q?nXPXzhug+o607uruL7qCJ1mdE/+V9Z0Ovx1oRb6AM3wB4MdYY/k2hT/DFLt2?=
 =?us-ascii?Q?W3oP6WFOyZPx3TyRvxIuJRu8CQauhnX0rrGFG//SR6wSkzqRnyUtFggYPEUk?=
 =?us-ascii?Q?hy4ooy9i5oxYIelCtUtt76rxJUJsCh6eZPlkP4i+PCCNqq3hyDWuu+ygKhqw?=
 =?us-ascii?Q?k88wdgcj/35lyu4c9/yH3jOoZKzOwfGrPTc0Siwd5Qq3dobD3frexzXyum05?=
 =?us-ascii?Q?/273gkx6Epm5asM8Q34qHwrVAI0QsJ0a7OLuunnBIBM7yU9FlatDeYELu7HO?=
 =?us-ascii?Q?F+8c8jskq9pOdRBARGPJOFnikwNsCu3vjDaERCDeeN0XL/U1neAnv0piEVDb?=
 =?us-ascii?Q?BRENFWIHsJLrnZ00NXF2lm00FBcKPPf4KO68hJBEgibNMohbTV+xU5JOLP6A?=
 =?us-ascii?Q?VIB9Q6tDmXoC7wUS0Or4uHrZ2g0SxTRfg2QhonQjL+gZEOFRJgAriljqcKvv?=
 =?us-ascii?Q?Qs2bERXASAw/P2eH5MDJcVIKVyHEuXExtxe7RohXlyTA6ACjEx0GS/QnPn/w?=
 =?us-ascii?Q?Tex6UjKyb21+ALJv2QLSCX3C9UZOKKBRpW+sN0nbtHMRLO21MbagKcGMOERD?=
 =?us-ascii?Q?KuA70TOtUfjuG02MjZuJDAB4cwafsf++H7gGFuE+Q6iSbf2u1jIHjFrda01Q?=
 =?us-ascii?Q?MKkb55nLg3Xqd2ifLG5tt4WsEX4dA0sW9bw+m7zwLwQJbpqKP/v4exARmlLC?=
 =?us-ascii?Q?YvfRfIPELOMvuQtaZYV7llM2k8oMPCMXmMXe0tP5f0IQawtf9tvKsukK7bMy?=
 =?us-ascii?Q?sAFb9HbR4ZdhFYnX3XUdmFYtmN/W7D8EvUNcNz7Hd7QaRJfG+PuIprcoP6Gv?=
 =?us-ascii?Q?DXI4HEGRr+2fEdqiSLzOU0GzdmYBpbv5NT+h4S4LnErYmLpHDNtTtEGAe2Bo?=
 =?us-ascii?Q?seqJP8qOQFCeV03dgaA6MBLnnQ9YdM7P+0uDc5816qOYdrZLnxivdZ8KUNBE?=
 =?us-ascii?Q?kicVu7a32r/rKv8hrNnnKTCWntQFjsOhYKuFUK1U/GtG++CPM2/c+jVhOGgV?=
 =?us-ascii?Q?012japVlCVjTPoim+9aJSlwAif7y6g7QsbKIg0jOQn0aoEAbyzTMQs0A8Tru?=
 =?us-ascii?Q?1okCa6baMzbDj3uOIyyTOAh7kmG7dR4AFa7gU2/J419F4hSU5jqP58kkzzZR?=
 =?us-ascii?Q?l+y3U3Y+qk5fH7kQhJe1OxdnJNzqK9V2urgO83sx/RQBCa3d2jF4I/weEMYm?=
 =?us-ascii?Q?z46zMievDZh02Ox3cjsWlaI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f1df54-0ed9-47ad-2473-08dda952e71b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:46:08.8101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGkmstwIvohquVCtSjQl/rkahI9jXZ2vFCTFxck15pXyHm5q+WbZOJXRyUB4vY2eZG6jPkxAq+Tgn0wzbTSPl61P3fTMmeiAUOj3UUTrT4fu1Q9zpvbYKjo378KREMPs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16176


Hi Matthias

> > Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> > So, some venders are using menu style, some venders are listed each drivers
> > on top page, etc. It is difficult to find target vender and/or drivers
> > because it is very random.
> > 
> > Let's standardize ASoC menu
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> I wonder if we really need to split this up into patch per vendor if we 
> could do the whole thing in one go. Anyway for the MediaTek part:

I believe it makes backport easy for each vender.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
