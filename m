Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011068.outbound.protection.outlook.com [40.107.74.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E719149C41
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692544; cv=fail; b=Y4MPYt5X1HS4tn73bG3Ba3zCbexr1/5FTsgNnedxaN891D5HIPXCLdaQIBAnDLPn4IK9LYyczZwGHgIrkOqVuwrxgeRogSyTow7N0gnUiMCFo9o0cFDC+gdF7b6fY29c1sL7T0EzJJTwmlvI4B1D6FLhZ68ETzgmf7x1j6xZaV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692544; c=relaxed/simple;
	bh=be/Z7ZH8fjmf5iDnGtAUK7j3gZAKRD2VMfcKQXNYkUU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pdDOsgpKflwbNhALvitJz6FcTplCI8awfffSEWouhTt2zP+w5178c89pOlTvuLKkr9VvXB7wfs2ekuy4ZMyaF7Jdpt+fUSlbpnuA5YGJZ1BTEuABdSPbtQ1eriNvqKjizGrj7G8bESzIGygnLwuVKWNeUszrOLRG4hnQemhOL9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n1+0pXGU; arc=fail smtp.client-ip=40.107.74.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n1+0pXGU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sx70h1TUhZEultRZB1iKqOAuZp18l57njjTRtn20EbUD3LVuX1AD3d0TGWardCgxz53LL+ShnI3SHzp6VnmqnZdzQdifIHasIa/+UhOZw0OKwaIFU31rSMr9YVqxRDd9CXBOPrARvHBBj/DLY4YIm0Jlk7yQuzFy/DLOc9b/JAQdkcdD9tSpdjkvOeaY/YhjU3InDHMJAXta062ddEpDAxK88TLFxR0rg7UaScoisYTSu2O8K02MJ+JhtkK8AQLpS0shf9AuRgghhjmsjDRbPDfSOHn5ab04lR6kZrZ7wdxdFY2a4tb2Js/Yd2De+jXiDyKNJo4PGEyK+f9o9I2NcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2EptjFTwvBumHJkjqtmi8LtJaGXayEHsg4WXlXBGFU=;
 b=eGKQHPJQM9CqwWKaW1A/o5+rgD8uAIGXtPdZ10zFKsyCgO+hATOSHPR8q7sf0q5BaB3K9mtwxQzhK+VZD9R+VG/0pkCTfF2yBlV14AWocb1O3+rTNku1MTNa0XSYtkWEMfV4GGP/Kav2AKAS67sdc4/IIN2F4+w0kT2l44IM0ugJU3MDK7PrJzS7E8WhD+ej3Dmry9V9hQ916dqLxCGxQtdPuSK1gDHI6XJNIb4RRnuFZxCiafei2v2njB7qO9R711qXsguMgA7d/HXuKmdYOqJawMNAxR1F+xyuY13Lk7MdmuatggXGKnpXYHVbahhpJStcE7gdaxWXoV6Yx3617w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2EptjFTwvBumHJkjqtmi8LtJaGXayEHsg4WXlXBGFU=;
 b=n1+0pXGUAffOEzO1WT/4CVSrsFE+yHPg55qcIl7EboRl7lE3puoYp3pTXg4aAFZpeWhQelt/MT1QHor58Ks7GV51D1BkR13I1XM0dvgSOp2pnolsv7Ax0xwnwD+im+Uhgch7niW2DPMyzRjr6uUASZdVDhOf/0e29RLX4KYgPZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:42:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:42:19 +0000
Message-ID: <87wm9hzqf9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 06/39] ASoC: fsl: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:42:18 +0000
X-ClientProxiedBy: TYCP301CA0053.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: c230a9a8-75d2-41eb-184e-08dda9525e69
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9cfad+fGCvxvks9mrYNgmiJYeK8qbSyGNmaMDBVucAJ8WtmCoTvobt3F+Ua3?=
 =?us-ascii?Q?3Y+992ITrlGGW6YvZZq50v6r7JYIHHLlz/jrD/XAwb2qNQCszZOipzuy1fGk?=
 =?us-ascii?Q?nCzDlMxOtdV5rsAzKvMJ4/x7To3QjfWr+HhRZ4SzI135kHtVuTGiTY7UN338?=
 =?us-ascii?Q?N39yC4kNJqsGI7G/flfmGNqhRjr9jWIVBu8iMOEJUMDiwoZbyN7gvuodULlG?=
 =?us-ascii?Q?iC9MDVNUZW2Ccrprqtds+F8AdYby2346bhLEGAOsFZcv500D69KdCuig3+uJ?=
 =?us-ascii?Q?G+SrtlndfaH1OT0216+fa3EyDxT6VyHraK6MxYA1HhGtajx1DHLYryU/FFqR?=
 =?us-ascii?Q?6nFyJdpB+hxcs0WmK+fG9UHEgsvl7znVBhfsTySzZnU9+HpQE9/Qu+Gcnu8S?=
 =?us-ascii?Q?TjG0B6ZKWh3/rJGbrIkvscBMKIR5gFhmdlk1Pq0SIdFzhDFjhNWnyLPoJb3L?=
 =?us-ascii?Q?pXNBq14VDT800+hZS8vYLralb2fXdMF76GKWiHvQlTu8EEdy628kwc/SfTTk?=
 =?us-ascii?Q?CVcgoO5rLvq7PdXJEkG5lxhR0azmfjdGBQFc72mqLj88PLqyOdV8+No8np/g?=
 =?us-ascii?Q?KkkK85cop14ZbJAOl4Kop50L+qdniLxl8i95p/rKwNH7SMERC1i1J5IYzy5f?=
 =?us-ascii?Q?qjfynQNgtk/Vyn43w0n3FGU/UeUrugQzrKk3/BLiZ6KccGZDyksWPNMvuZLk?=
 =?us-ascii?Q?TDMnu0fAY7c0XO8sEQqcS9sRQ0dO0Cdd/KZTzoStadY33PSCeKIsQ6xvELEa?=
 =?us-ascii?Q?LrQeVuWodZ1FeJywGW99/QOH4s1jbsdfS+HSBY4i+LD+yzeDJCMLGo0nMIPH?=
 =?us-ascii?Q?VtqKAXZ7CozUZ2mtlpnLkuSBYjnJKV6yUtZ0lqQwyM7egNiRUv0aXS43IFa1?=
 =?us-ascii?Q?EegXFElw0eJCtwDn22vMU+8UKa7izzqSYTvcePhU9DF8g4IHUZRvGRl7TJPz?=
 =?us-ascii?Q?nPYRHmy3LfaPbSL2VXT3Wo5eq6nb6EYCLIJMkQkYnvd3AtlmKEwDKo+84yJw?=
 =?us-ascii?Q?yiDv16cs9vjwg5LPLEye3aBPzuniu9ZCZOXCH60qKvqDIKFYBHPqQheTqgUr?=
 =?us-ascii?Q?1WEDiDIZju7AHSm6BZh6qISxTHeNsjGIOC9W3sl5zF9W8dl+yZ1OfPIIGoE2?=
 =?us-ascii?Q?a1AUOsyy13YFmVi2iIqmUxFKt6SYYrbHONxIQSmruVAgQ7xhFoejDbpPsrGy?=
 =?us-ascii?Q?dEvstN3KYjEpk0fQkhgUT1V/SQ/MF6c0km9C4FESWZ6yAM1xO5hoXJrExUvF?=
 =?us-ascii?Q?wUkY1PTCpqLhe7+WBKbUQ9I8fqLA9l/p33b3yrGCLpZNRxh9szI20HNQ9Xey?=
 =?us-ascii?Q?Yn31afTgglmIlkaw7JB0miufJtdiiD8oF0LHdKRfhiGHXhkaGHgPifT8QiNu?=
 =?us-ascii?Q?mWjgLYW/ctuKrndP8yZ4ZuA2ebnlCsHAkUWQC8TbQPUxoNglPQCQv7X1omH2?=
 =?us-ascii?Q?N/1ws6zGfDaDSbZiGHQHxNgyU5yZsIo5aBWSHmR/VB4NSgECxcm6ekZS73gm?=
 =?us-ascii?Q?VCCwsfMq3c4IDR7nYhsBa+AwhvnNtOxZ5fsJMjTzKMHYHa+QxbwbDFCe6w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DNaCdCeGI7TRb+RkT1rRDpm/fzPgxnXz/Bwex8CPOl5H2WHQFBk4oQRUQ10f?=
 =?us-ascii?Q?XWi8yEeomi5WR/q82YoMgNdG+ZWOAMvPboGll4cr7Flp+2YG3bGTXdftPeEK?=
 =?us-ascii?Q?07rJXaudDO3eZL9gt7LHiwNWgzjDjyx4fm9G2WapNvTgxolAxPpwz507d0Yn?=
 =?us-ascii?Q?n80ZdA/b6lpGX2+cOId8LvgU+lTJ3E7B715318+CShuKeKAHr4caNxfgJbfc?=
 =?us-ascii?Q?5vTgCylz3EroKfK0Tvy2ae+Nt4SDkLeDGlQkHwAi4yzSoAqey2AZLBsnS/TT?=
 =?us-ascii?Q?ueHnhUXOfgpiXZ+etOpwDO0HiWuDsJWbUfrnmgqXZaYl9tMnbvMGRexInZUa?=
 =?us-ascii?Q?aBAcuBp3YkAm+m5+5e+H0NkbglH4ZTSxTfTZ5POu23VHG1IhGlb37vDIXuda?=
 =?us-ascii?Q?LrjFBX/V6nX64WZEmGjockwBsn4eHPnB3c5WIIvSvd3YfqsrxbUYcFiI/XAB?=
 =?us-ascii?Q?vvk4nvsqdE5bCoNClGzq7DRHC6hE9RwV57dwue3ajHHE4ZBFxhJi3IstU2/c?=
 =?us-ascii?Q?mQ2zEXJan63Yq6PJN18isH5i4Rr4TxYNZUfxfDStb8YWTlt06i5NXRsrmcgj?=
 =?us-ascii?Q?L2DPCtuupiv4gkYW+12ISLKxIBEQREh2N5GeyVSxv+E7tFvmAx/rl8u9PW0B?=
 =?us-ascii?Q?VQuvvhdEYiVYmdm2Iq0IplQWImNIIA9IqNxYBJ23c+IC/ooAr/2ynIqIt3kC?=
 =?us-ascii?Q?K47QgXKI/MkHvsu1bEjILxW2qA67fg8sSgoYu5LuXbz4nQgpGDN5VTfU/GG/?=
 =?us-ascii?Q?eRrdnhcBOykyLOB7h5ju3wcbPbGIvYRJxQKXtxlmK3Or/ZGPEtbMiKODIfBj?=
 =?us-ascii?Q?k0qOazzN4N9dIsRdFoGss9Gw24e28hpRnqUBZWc+8lV3850/wzAq6oXG5IcB?=
 =?us-ascii?Q?pz2LdoNrOZzfEAi23MXGDT2rgO1fq05t7iFPHoobKTT6eH12Ba/ea5zAztCQ?=
 =?us-ascii?Q?KqwlkqyOodY1plmDtDrq/LwiX7YILojITKwZZxwpttl5DSTcDl0NVo2O4Lz+?=
 =?us-ascii?Q?gEwcZqkysSfOsVFFRVNIAsIPaVGq+axXhah1fLvQZiF7eM7A/whJYnuPc7ke?=
 =?us-ascii?Q?IsW0foy7XAcJbb/bIzvH8VbGQEPouOJtr+FfTBbu2Q65feWHfhkyzLJGBGh7?=
 =?us-ascii?Q?wSvsZaTXOhf/C9D9lFKYpXmJ8fz030IqQMii7YrJBiyky4NAgdvYzQ2IEobK?=
 =?us-ascii?Q?bkpr6oGdE8WLPDjVtwbd3AN8x0flro1+wdpbXil2W/4vjXAiom8E1PmUUJA9?=
 =?us-ascii?Q?Jfz4gyMk8Z1NTGdDRmLydK2fnFxac3NfYPoCjheAlPvllB8meauTmvK0+Uba?=
 =?us-ascii?Q?/ljjAlAWHkpK4KtsQSKFjzJphPC6WPP/uN3IScceOlVFz29zMkY0eG37HNvJ?=
 =?us-ascii?Q?x0D3NRSH83YEDILlr8ei/1Z87Pz9+DBAeDjPOC1MByzWl+DBfgzuayW0ziew?=
 =?us-ascii?Q?37VnX95W3T9vKoRbuKZ5mZQejsvBI71WWloi1MNFfsUW+8LkzOtHCYImfybI?=
 =?us-ascii?Q?TeemANWesYQQG4WRn6J0/wTKLAAiytlgZJbDyG6bR9zBnK+Hbbpsd6mT0lZW?=
 =?us-ascii?Q?MkDeh8cMORBRKW/bV8+hUkUykMlSHDrqHUNN7Oyb8t0BUv7dns2+MTFjQtxj?=
 =?us-ascii?Q?wzAUBOlxHbgXg2FQz5oZrts=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c230a9a8-75d2-41eb-184e-08dda9525e69
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:42:19.4696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHzIhoCoO/cj/KNGBqJOYn9a6DN8v3YpT3Oc7mdF5q9m5NY+G28eYhyR3iO+TNpm6AdrqKTXTDZaXlkYj88quLa7YairaIK7GoCYlr5JN7K3tcIOj57VD/XKyHME+f89
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index c4cf3cff58ded..c4a00b22bc2a1 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menu "SoC Audio for Freescale CPUs"
+menu "Freescale"
 
 comment "Common SoC Audio options for Freescale CPUs:"
 
-- 
2.43.0

