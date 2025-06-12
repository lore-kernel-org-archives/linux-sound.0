Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE40E153BF0
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692707; cv=fail; b=Fa444y2jvVkIKhV0n11myPs0IwW83NUS+oyejtLK9+a3E5BQRbYh79lz7s/XUcOKvEKTmnetK/IlmN+8WqC0HdDCx0nRQ8ijQ5r4VF9dsbZXPYd/9EuW8CSCcMDVNql+MM6pW3WBPKT6/hFng66an/GF+d8L16rDacNNe15KSxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692707; c=relaxed/simple;
	bh=lnt8WoWe1+/EvKEpbCQzNShrw/exx6XrSjBRSr3TXvs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AiPtXTsxTbsjCkR7Gu8cJ6HdpB7Ez+NxguTOKH3FwsQY8KYOYvghVYI9P3YsVvcXxordqc2hQ+TtnmoQESujpmuAMF8ySbOsLfHHAL7kfqbUo1GtCP82JVRllEruLXFVdPu1vNxG+SCO4XPAxuVXeODtJAo0wKee7CRJGx6HxK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aw2DkEvo; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aw2DkEvo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtjIfMN6bcWbVMUubMs6vqvCWhg1EsjG5xUA5E9lxNOSfoSr2xkCB/C5l5GbdaPqcSVJU1OXV2LT3hi7VYA3fmNzHzqdKZi6TAcmzrNspCYuPQbyTdkx+AIQI6RySrz0exMID8xXMY5IOrEdt0wRSvkLUQM1fMVaLv5qkD08SYDkfQfnV5qeGye/PFlPX4wvnawRJ43mnrRZy141p091Z9N9xZh8yvYGb6cIcHulEKdGUzK2nM9uwAETOvQwogz4FzVvgvoYMpioypZz9E4akJNLcshgpuftlfH8Dp1aemZeG/74yiPTMUiKN0hmAMChCzg4IuqilOWZIznmT3Kepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZWlo7el6+1NtrQk3/bwo3B815Y3+3/EbgX+ELzoLPk=;
 b=keeeTOsmd6iXPFAr+kPJhXrtCsPwRPpHeNbG6/zV5tMBjdqYpVSYLjvjy7eV1qHtoQVjqTEqsAux4zqWpyQBMacP7yx7Ky0wH++Bwx35l06/sMhFj4R0UdRbOX3AXn9ilgtDvym9ewPZswpbFOkUe2/GPOCuaIq5pS0pUSIvUnm+nI22ghza2h7nEq7iqehfBW/xyMpCJI5GCp+MdNc7xPJL0PlGi5gTby1gvOM1IfQgffP6r6yXi6tpduaNYAaKWanuEMC7pIfe2d4FSnBH4FhFmaSR6mYm5dn91dEpuljS8Y4VBzWFPAfxEKUKnwMhwZkRpD2DXKgDIvmUzwT+ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZWlo7el6+1NtrQk3/bwo3B815Y3+3/EbgX+ELzoLPk=;
 b=aw2DkEvoIPwRdTxd7WdE60yuwdxWpb5C5150R1adLOK0QOnRNKkp/3Fh3498u9hsy5LTyOsj1iGj7iEIHpZanvgDxopoAF7oeM8U46AjWZpW81BzsXQdcQZukMKRYfHCYUyNdwgyfUu9yTWJ/c2bByHNEb/NpJX0U38gE1ibG1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB16176.jpnprd01.prod.outlook.com
 (2603:1096:405:2ab::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:45:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:45:03 +0000
Message-ID: <87ldpxybq9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 39/39] ASoC: hisilicon: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:45:03 +0000
X-ClientProxiedBy: TYXPR01CA0050.jpnprd01.prod.outlook.com
 (2603:1096:403:a::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB16176:EE_
X-MS-Office365-Filtering-Correlation-Id: 356a7341-185b-454a-da88-08dda952c041
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a1czTvs+CJVW6wIfAz8oig9Ameli8/654wB/o2563L9pJYM0ocYVXhrCLflP?=
 =?us-ascii?Q?X5njOCNjKoZU7yTDI2tD9+B4IfFaj3td8WQTzsB/s03NeD3HWltqW1R0wXo0?=
 =?us-ascii?Q?73fyHIWprq7ZSA2/oAgTGm3u1osebHVjL98RXqwyx19IzgBFS5e0jnNsKa8x?=
 =?us-ascii?Q?hVjDpnfzTdZmfrCFhHUZwWynjAyxjEc9Naf8xTS4rwTiJtZYqEElNllTSj15?=
 =?us-ascii?Q?ZTFLFppZu5Kl2bScsLegOMj0klbVjMlio3KHPGYTOPvf9VpgFvfWJSjyldP2?=
 =?us-ascii?Q?dE126n2sFycQYnqVDynymAH71CqBJKuyFt2mS8GhIMGw2hNjK0qAOcXaNKzY?=
 =?us-ascii?Q?YjQE7wlxnxFwrBW6MpBDZQt+5z0+0zQvE/Qlrkh6QbGS76yxoG0hfMRut4Bf?=
 =?us-ascii?Q?Ul4TrdQ3WlZaD/XeVwYPO94kZPjqBW/Vc3Ma66ap/a6WgC2XoqTwbKkG1Ccu?=
 =?us-ascii?Q?XxtWT+Q4xmv3PdUGJebT3FnAnf5kIFG+zEnsANl0DB+CSePnZYAeC+MMeABS?=
 =?us-ascii?Q?Pu131v2jmvG8P0Xhx50S8eNAfxQWzyrNe3KNszVEqfWl0yk/txX9ppLPS1aI?=
 =?us-ascii?Q?3gI3cCYyeNWvePLL/CQQim8QDx+iMqA+m4x+/kt12mAm19mvgNYGuD/OjMhL?=
 =?us-ascii?Q?g10rKaltleRrJlbE9vjr9c5s/TzONdAisXPVAdJu6F3JDn8Vu9k11t/Br/Le?=
 =?us-ascii?Q?nxQnYmihGT4/mMB+JfX5R3HGzp2QyFOsU2MF81OvIz/S03YpgVLZ7qboLPcH?=
 =?us-ascii?Q?vkRF0UD4aQa8BTIMs9FXmfm3kXP+/aVlcYE4pdpCl5fYnwN9j+V7I+AwceYf?=
 =?us-ascii?Q?uik+NYjLu8b9ghsGHQt8EfiuVcL6BbEGzsWOBuG9cg6fS6aTcRRSwweAiCtf?=
 =?us-ascii?Q?Kg1Bhu/iQ5OcY+MIRcqIBjccYWx98D8KGR6nmj97qGcJwDJ60ThgkSEmADI5?=
 =?us-ascii?Q?2anS8/kWHpUv5nwjUv5B4UgQm7T4caMkbsGlKyRSd21etTElh5CNiR+CYfpx?=
 =?us-ascii?Q?KDkBqNR1lU5Dn7tkVYyljtSUSKmsz2ZARNl9dMPiSeuUsjtbPGzjDCK2OcRe?=
 =?us-ascii?Q?QjHL7yyHOa5ZcUaNE2IIOrwSKdjAbnIps2M17+QjpE1NDF1RI78+MUJ4xLOs?=
 =?us-ascii?Q?IL/ExW3opg6m+lPMzpmjpedY9p8VwCV0IG/nz+NT88UpAMvgGP3kK9X+BfuV?=
 =?us-ascii?Q?d09HdruhVbDeeJvQuR9QcEnLlSOhxliCGL7V1egj0+lFumI8lc3TTshJkHTv?=
 =?us-ascii?Q?wcnyHIQD6JUAAqpZorH4BfZEbe/rJBKQwyI2o4UV3egle6Y888fI+wsm3SB2?=
 =?us-ascii?Q?RA0B6FjZGUX8cez4sXw10PZvTf4EEhyBJI73L9+lcEEyvW+cVAxN+cnfKwoL?=
 =?us-ascii?Q?5bNly+wC8ekX+yzuMcYLzN3D8JP3zc3uyRcHhCFkAe7ab8s8mJN6hoZk98AX?=
 =?us-ascii?Q?45/LfubblPTfZjCFNyKaE8TIX7TuVgO+hS+0Cmde3m6Zy+0T8TPPUl8Ks0OB?=
 =?us-ascii?Q?zbRGZoXOD6ttkG3vNmH40dLweaGQXNbcro+BHbjmpQ3n9QV52yWlUdNy5A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZzjQ73bK1x+s9aGpiKRnf31nHYEcm9UlSkmqKjBqPfnqz6AEz6n+aiDkcgG8?=
 =?us-ascii?Q?crGOrAS8gycYa54wJwmXwCrHeroKBThqUtjI/zm5YjiRDmsH1Idjg5dYp2I6?=
 =?us-ascii?Q?PLJSiqvnj5zrdY7gfILgDewPUJP4bT+SCcYk3bsNDXXGvNiNC39JqZ27wlLP?=
 =?us-ascii?Q?gc9iizlXshAqLN5MMQlip+KWvvdddyGQFJBDnJFknGFvlRQ8AUwjaW6S9tyE?=
 =?us-ascii?Q?HD7Glx9Mz8jeHFYiTvFK+xDfsnPzFJm4wD/7rC6yMOxysM91VmnzFc4jMV9l?=
 =?us-ascii?Q?CHHwHpu+IPkgXCNFfVY3hJGtpQWMLCraVZBKf1Mo+h4mwy7IgPv0TixorV13?=
 =?us-ascii?Q?4i9+ujGH/vSDQpJwu2rLf4/LVtzvxlWf1yOOP/1e3xP/ZvoBao1e+lmVWeOk?=
 =?us-ascii?Q?IDLHUh/OYkvxTLAIVDV4xX+yOs23ZnIkCEm9AF2FBx5Lr59AtuRHU/ffuTT5?=
 =?us-ascii?Q?j2odPYnhpy08pmiAtZGdsQ1cGx4SiR8ZimzTs0AEEAMOvkZBJmfuqqzkcGnc?=
 =?us-ascii?Q?Twwf1URb/l4pBZHZBSdALlYwmikNr0voWkb0E5MoO2mf1GOyhl4EIhNGioAt?=
 =?us-ascii?Q?X/urXfPEkZU80bjY28P2ZPVJuTWXa5L/Zegy+BkTgcX60sORYghWyIxH1i7l?=
 =?us-ascii?Q?kP/sbPwoxhRgMPFHzXWdcpSByJMR9dri/wUBeLgcb5DfnSzQJZ9ES7ABKlzb?=
 =?us-ascii?Q?WU95CyBq/yjRVk0088iZYDUh/lDdJ8NWYEm5cPGoNsVoU9+VQNBLHcduhROl?=
 =?us-ascii?Q?gddp0tRkYKCMExYoQ5SL3HnKh3WQiDn2CQx3W8pm0TFmvlZ8FCBuo1vcIH6w?=
 =?us-ascii?Q?PzoSbhyHsUy909FHIaRsr8AzinOAg3GrdeAPbL/urm1zGnwBPzjTf8rNihZQ?=
 =?us-ascii?Q?szI+z18ZCMMq5DmFWH6mOfvObqtuFkWYDTJfWUqGtzgeNWKS1ONfUkwWduIa?=
 =?us-ascii?Q?oMeCLXUBNDGSmeaIh15sn375m+RiFpWl3P/unGZoWtLyyK2LbFUwL/Y1on1J?=
 =?us-ascii?Q?dqHynMQEdZmRMCdINkNmqkOfh0aw8oyDf1MWQhOFFLe1VpZRgtOut9EFWD2R?=
 =?us-ascii?Q?aUnnMODkhd5UcpWnjSgEkT0Z3XjEfQOlCM2O74djFOBhnehrms5Mnbg9NHHb?=
 =?us-ascii?Q?WpUsJ66qhvkJJRilnMlUkRxg5XiMwBvPruyosbxQKgMVd8+vOZyMnOu9nntf?=
 =?us-ascii?Q?GuqtUrH8AerozImXzFfuV9g8GB83bMfJT0AJpnCiL8sabbdpaTk569rM+EC0?=
 =?us-ascii?Q?y12Azm6fwBEP8kcspk/xPPB8I1P1tA41qLz/Ozfcg5QfjPFDibXqHEzKnZ7f?=
 =?us-ascii?Q?OTVuTdgpe4S/BZbX/kSuim0fbh/xNkbBK87H73lzRChw130j2O4UX9n5Q/um?=
 =?us-ascii?Q?5ZP6JG9MPXpXppN2jqvy9AO/7e8yVg25h9uVpUIky6tzl+WNO8uj32trSkUo?=
 =?us-ascii?Q?i5UezKqldAnBIqhx01BAZXNyeZLut7lkDHJs1t66YvucYtpZJxgUyooVYLWX?=
 =?us-ascii?Q?WllHI7RLL0y03LoMOFmzeVI+nny2kcli9uc8T5tIdsqZrn8OW/Dc5+dziq12?=
 =?us-ascii?Q?29Go3WOBmrpeQS3ehQ1ZexgvaYXQ7RlVcDnX3MBYsR9hbExewj1PtUjyZ7Xl?=
 =?us-ascii?Q?x3D0HlY2OBzbrgwJ31Cru/4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 356a7341-185b-454a-da88-08dda952c041
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:45:03.5822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLJIB1A1e1U7GI9HxJl5j0m8KGFkbaso21ebpxUW+Tvee8Q1rSw/oUP0b7BSeNEx+p7pLWXKpF0+AUbNIqSXxT9sDy1X/v98a3KbOgyOln2qtjcIPCaESuaP0gfmUs7Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16176

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/hisilicon/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/hisilicon/Kconfig b/sound/soc/hisilicon/Kconfig
index df8fbd8bb4b03..d95da932f3524 100644
--- a/sound/soc/hisilicon/Kconfig
+++ b/sound/soc/hisilicon/Kconfig
@@ -1,6 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "Hisilicon"
+
 config SND_I2S_HI6210_I2S
 	tristate "Hisilicon I2S controller"
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Hisilicon I2S
+
+endmenu
-- 
2.43.0

