Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB91972637
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692573; cv=fail; b=FD7WahdtuCTcrKIDFgxxGzlmKLgWtnZEwHQ0jjUtwzGxSVJAh0Drj3fP8OU6lWbopyf+SmS3Jtz4Ejei5cIzB4s6IKWrOnqTKhaoRU2hDlMPJhYJ3eNwCPBOJQyCuhPOh1uyJZIdBrNF14CYE0kXhTWgXGR4M6Jed3nNxGe6SRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692573; c=relaxed/simple;
	bh=BxzEh5UJvOm0XnbCoAFsUn5Vi8nMLZQKVADoM674oeQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XHnNTOAaBGjHLkGxLXFKigeLKGcJ3COvcP9YhepiFYVAJsDpWTvtg+M7tkkxEtz74WFSyVpPd1RgxhICBNB1gsNdWCxEjgwc5DnEt+ek6AjljAlPb8Do63Q1bvugJXAoPdB988kgr7pqpWdCzdyRU+6p7ZND/OSoYivAkxesD4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ChPSDASN; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ChPSDASN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pR5tCEwEHxvwd/17zo4TGby/hrdkkENmXh+yf38aauWA/yfST+c+UMZAecrCfAaULFvdR7hXr+3rNIn62KpBXKPZkZXiFPpuqsyYQE3m8gl+upLDEoRai3pyAp4joNOSC1f1NCsZv1f4/NV44oCrCpguvKyWckOijjJPE6HlhowtDJIexMBE8A/g0wa3Z2aa57vQoZAgpiCm6Dp2Qyy1QtaeG8cO1prpZUUGgKrkf5R8EUBulyt7A9wQyJ/RsYuXH0s1XThA2+nQma6ivc7mDM0g8hrQ/5/IncOmcZho9H6RrswaJf80bqo8QVwm8U+zDOxPAnhfA1OW5yv6+k32cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VE5+nFXi3sT7kEc18Xt0QvI/5N2gNzfkiaXU4XmMvLs=;
 b=ZRZxF568zpmgbkan1lUDTPIoNOq4VlWelRDruskVF+AXXN8fn5DRuhEbjXdLRGhixrI1jYX3Rdk1EliKz0asX6d+TeAxQq6sFYfDpkpVC7wwYtiakxHxfF+f23FVkg412JI0POM2yJF1Zi2gyJCnj+OXgkVOqujRhjanHyQFvBGCMDTk01TVyDfXkujpkDOsJ4aD53n7Xl4K1w4lKJpkZ3Na+PkCCqzEnkJ9Al0sLuJHOZvVfSGVOidIYh/AC+UnlmYLPVR2VAl4Sz4fGOaPZ18DajlRx89C5/iUeqL6JWRHMfMsmca4D6WyLArs6OKyWMT8MLLMB8c/0iuFGBPQSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VE5+nFXi3sT7kEc18Xt0QvI/5N2gNzfkiaXU4XmMvLs=;
 b=ChPSDASN1I7vIvRFT8k7uz5HtgM9z7tR8QtELGw72wl/HmoQhOvx/tAHFxxrSXIOD5g4fxyBnt0zy6erLIcLaMtK0SeTfQxq9AU72ljebiVipbuNsZAwdb4vPLqex6+ORV846IvIo6OczUV39ltxGezYZzHz7fVjcad7n2UgKX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:42:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:42:49 +0000
Message-ID: <87o6utzqef.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 12/39] ASoC: sof: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:42:49 +0000
X-ClientProxiedBy: TYWP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: 81594a3c-7090-4ab6-f858-08dda9527083
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QHPbo8Y5UmvkVEDxkZveimK7UoltxdlnDiNOqcp+9UjN/tsnwxvjpeaPsF8N?=
 =?us-ascii?Q?4OhUX59o1BkhXYC4Wt/Lu7/H1BwexCdu9R83/GnxGpH4QUuAwp13EoGXXC7k?=
 =?us-ascii?Q?lczK4fqSk+ZJUFlBZyHfkL2772Gqsmllxj8tEe7S5VQ8y9LgG2d6w66ilQdt?=
 =?us-ascii?Q?iMIcr3N/2Un0y0DBaEIrkZUTEvvdyvPQgSzoAVgOrHie3py0p31IGNWytMYI?=
 =?us-ascii?Q?dH6M4AFV+FoY0Vu3ip5+7XtKshpMyiYxBHR6X5gEgMpMpUDlVSDqFM9vQqQ3?=
 =?us-ascii?Q?Kh30ToX4YOfNJi6M0xw6jjL2b7UdEidLngASPREDSf97ZBrzFC+GlE7fUIXE?=
 =?us-ascii?Q?M0+3CHGl8vyf73LFO+Z9Kvu7ddCyP1ENsEO+XcsC+muzexY4Ul7ibnAX10gz?=
 =?us-ascii?Q?Y9n6AyhfxAIkgs6deXyh9bEQgMrngBR1j5FyKerbf5YLDUVSxIcss7/ik8YM?=
 =?us-ascii?Q?8gsD8PE2R0gt3uiX8StrHnM0tvzl/J1m/6faZWNsKIzY+0OI/K+heJxz05tC?=
 =?us-ascii?Q?GpbUiHYh1fSJeRts3l39Cv3LU836JRtudAZb/5CBRzPqozWkFa4IVYJ4K0LW?=
 =?us-ascii?Q?mHzmvJITDE2jxh0A/pgaFMCkDjdiZiW7smi+tiRPpELylUiUClSBnMjxPjdO?=
 =?us-ascii?Q?3LGod6whHAYdltZgPmyYVb/9XzLVL/JOeUOW0wF60hjUynTSGZSzc7AoW3p/?=
 =?us-ascii?Q?/fKXHYzhu7rb0T9kmr3rZiVx6/n3i7YF/oXXV+CQWQHI9YidrjTlEsiSnDfH?=
 =?us-ascii?Q?0dBjFICvDk17+5+14AiYN+N+X5JEUJjLzQd3n2zR2AlVvZgWxLhBhSflGG8a?=
 =?us-ascii?Q?K0Gfzcnt4J7JzPui0tfZeZswyKpRqblmmuGliveyhIFwG0Az/zmUnySwJg+/?=
 =?us-ascii?Q?5UGYf0gPiQQVcIezX7bdSN4JAYzBshIlFDKuA/m/j59jnL+kIkj2E8QqJq0+?=
 =?us-ascii?Q?0c/40cp9XjwnOxW1As7eys5cD34Wk4X4NaqnAzkoKzEn1/rdoN3cfxZvJ6Au?=
 =?us-ascii?Q?RnCSVAF0wkR0f3/10S3CmoOCTzrX/m1kkXE1HvlR6qSU0S2mf7vChBeXrMHe?=
 =?us-ascii?Q?EVmmwnl/S3R4TaciER4nWTrAki3yOxJUoT5t/D8CnnFOibiAg5esoX66JpwY?=
 =?us-ascii?Q?J+8BUGkLlkAlofurymaA0+xBSTu4LffWylWgEWgyc+C1p4XbBwc71HJAtpQO?=
 =?us-ascii?Q?U6BnDYAEGQsv08KsKNbl/GupmJnSF1u+WKtf5d0EO9KB/Ol4bbT+U2Pwok7O?=
 =?us-ascii?Q?upzL2rYkQ7A+kpXE87K52laXmUqwOGkVaBJtxLFuDRDy1RPfmN8P+UmTab+2?=
 =?us-ascii?Q?jEp/M95j8i+ilSZHM42UMIzCFR2pVG+Nc9vv7swxyjzB7WmLNoVw8pDdpQl3?=
 =?us-ascii?Q?EqjHyl4G7/435L0rth6NNjqiFfVdq/Ldu5YwItXku3ANwJcvwoxFyUMdPQ4e?=
 =?us-ascii?Q?mHrNMjJyGs9YBPFLiVolHMqZPl4yVbM7X7HiIT//wvW4wtJvnH5WjmTesTEQ?=
 =?us-ascii?Q?XKtbJSSUoFxcegd0VaV0Za5/ut6tceGaifhr/WgK+UuYd66XMtf3G3y1hA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a/cv1md1sqh5pp4bvrVV13OBmAcDH57/vw1MffoPYLSNyTH9wGtN+1BVZVN2?=
 =?us-ascii?Q?zdhkmBkSMj5CyhWBg0PX8TeRiDlnTfabGQ5c3sICDs6Uuv6j9Rxqt96k8M85?=
 =?us-ascii?Q?gkYDAasmRXA4RdrHZUxEtD1vW5xi02sjc//+Gfqnhk9iPAQe4tEIy275N6Rx?=
 =?us-ascii?Q?TT1ORIwUwDvDr7dypWQePOU8H0clYMmSjJZp2gUzbfDX0xsCoN0ZgAP1T4J+?=
 =?us-ascii?Q?goX4vNagHP6s9iIzHK6SbmsF0EAkusT8oxrg1x6aivo3GS1ek2pBAeE38P0O?=
 =?us-ascii?Q?eVdjCkF1LD08AZbJ1cnC06vLexFpOKl6g352InlCgY4/yrwlbFPA533YZjMb?=
 =?us-ascii?Q?eppqXYlZQydcJS3d1CiWDpHrlHweK11OhDhWUoikL2A6xU86pN4CWhRmCv5r?=
 =?us-ascii?Q?A1ii+dLEL3IFFRv55ChlMga/UJpkLD2umfwKblpXfmE2fL9yVX7H6S+lzXwX?=
 =?us-ascii?Q?Y3CFzR2og9ieJNa3rul8SJNTMwPNM/v+lNNTm/TdLEqOEGr5ATRhtlmyqaoO?=
 =?us-ascii?Q?nKyToC8884LV/Ed90tEyRDkU6QNxt9x87Uo8l9EVnnNmvgmmKSna6Tk98gv6?=
 =?us-ascii?Q?ux+b6sDdOe9Khfx+SCiKzPCb7CCpFXL/q/kjAyijY7GNZmByUm9Eqi4c4mdf?=
 =?us-ascii?Q?BGfoDd/dXeCoHhKYkaCEeF6TNRh7QGDUvUBSPQCHUfqdGAnbxAafVxZF3Qkn?=
 =?us-ascii?Q?f1TFjFODmuFxCSFpeQAkIAoHGEFT1z1jNz8gfpMyxRyxwMVYCZJVw1nQVQgf?=
 =?us-ascii?Q?AUDwiuSZ7wOcO0P/zGopqv4iya2O2zZbWeO8z45TZnMYfvFU4sgq5rJ+miEP?=
 =?us-ascii?Q?+i9P7JxQffO8X21cihgYFdWoDDJYM7rH0k2bUJPHyJAoiZzFslTio0dUdvaq?=
 =?us-ascii?Q?qstLRCaE+lxgAqH1MYTLDj9uxqE/CfkxBqlm1z2EvkIQoODn/W596N/Qh4BN?=
 =?us-ascii?Q?2Qjj8wUnzD6KjpDMuLdjr0AZ1EjqFMxe/M006B5z944CWERNoWz77oZ87S/H?=
 =?us-ascii?Q?c54k4Qcss9uhnfomEX4daVM+UgEpBWGBHSmSe+BNUdC425U9gXdg/95qXrqM?=
 =?us-ascii?Q?sQN0D+vkTfee3ngMlA1V8Cs/mXIhr6NWQcByAa9c+NXxYteQOZcyk1XrcXok?=
 =?us-ascii?Q?LKQbod+KqPIUu2r22Ey9/FGmbe/eLrGZoTlemZvXjMEKT5MnTaxN2uxaoO9d?=
 =?us-ascii?Q?Wkvrfc1MGaa52/9QpJ9t8DX1G+zS9mfP5tf1c2FiWscaTu6+gkk2Ly13SBZ4?=
 =?us-ascii?Q?hkcDyZEsGRD27ogrCyJk98TgNg1bi41JMV7MmocWWZ9YgyO/AQ3COdBulZHW?=
 =?us-ascii?Q?y8JK489bmQRGdEjc9HyhnuO1OpdPLPiQ37acCimgYuipcCfaQtOq9Vg9YelL?=
 =?us-ascii?Q?KuS5HcE9d5+NXpz1xATx6/JbhkeB0qm98CrqkQ88U31wJsLAr12co7omaXhr?=
 =?us-ascii?Q?SNs/da4f1jOSZDOgHfSGH2dZ2lTR3ee3V3f+zCtW1kMVYG4rLXMMhc1vxm/T?=
 =?us-ascii?Q?OfjCg0331idsKZkZ7HbN/5S1k9NE1oyoqXDLbMbaGGcl9hCU4kyaFfFWw5MA?=
 =?us-ascii?Q?uZ09s1aO6QFtoYU9oXN8NdH47vss900aMJ4CgwZHtAw7oXBqo4YAJn1ScB6h?=
 =?us-ascii?Q?jF8v7LdqjPEQPUzZD1lsq4w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81594a3c-7090-4ab6-f858-08dda9527083
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:42:49.8263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAnPjRCph1LxqBBrucnFS5SIznOahj6Ei1pVdQHS6NtObTDQnidFdh9aUXfpCPfpX7CycmheV3n1EZ/wOOgn92o3cAV03wu+9vlNjW2IpSLf4+hxcQRzEdPu1OCrHDyH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/Kconfig     | 4 +++-
 sound/soc/sof/Kconfig | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index 1b983c7006f18..ce74818bd7152 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -127,7 +127,6 @@ source "sound/soc/renesas/Kconfig"
 source "sound/soc/rockchip/Kconfig"
 source "sound/soc/samsung/Kconfig"
 source "sound/soc/sdca/Kconfig"
-source "sound/soc/sof/Kconfig"
 source "sound/soc/spear/Kconfig"
 source "sound/soc/sprd/Kconfig"
 source "sound/soc/starfive/Kconfig"
@@ -141,6 +140,9 @@ source "sound/soc/ux500/Kconfig"
 source "sound/soc/xilinx/Kconfig"
 source "sound/soc/xtensa/Kconfig"
 
+# SOF
+source "sound/soc/sof/Kconfig"
+
 # Supported codecs
 source "sound/soc/codecs/Kconfig"
 
diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 32ffd345e07fc..a487ab0b51c7e 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig SND_SOC_SOF_TOPLEVEL
-	bool "Sound Open Firmware Support"
+	bool "Sound Open Firmware (SOF) platforms"
 	help
 	  This adds support for Sound Open Firmware (SOF). SOF is free and
 	  generic open source audio DSP firmware for multiple devices.
-- 
2.43.0

