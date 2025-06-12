Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407AE1494A8
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692601; cv=fail; b=HXt8TD6c33LZv9McylyEv0SObeMfPxGGRubR5vI6Xe9QtviImUC4hezrCKh0FaQWxGvftm9Oop6Wk5rcjf8gSc4isTtLFID+vekLAL0UH1cZI73Qe70Bv4fA1ZPhMpttRx4/tXiKul15DopZEyQYPfIchvbElHLq0v9Fzk1gYZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692601; c=relaxed/simple;
	bh=uRuDV8SqwjZFw3QshEEh6eQEVbko6n2ZaQc4TfS9Ak8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YcNBYYKsljlqanMUtfmkwKPKPCeQHPmtzDeU8M8mCWqzdxpAjHDyzAu6GsThyai98FQ2KsydqLT4yppUSydZ0XOynw8YGy6OJ0pCYRctJ8/2o+Nerfr15X7MCqFgahGiAGyjA2dnrHor2TXZpGcw4cq9lBJFgV5R9ORMdna/qTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mSWJjeya; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mSWJjeya"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAfvHGNJ4HAw8ihHmjz+Yb8ULKlUP71RMe2dm2QrnbPCohInHFZizoBsJJYiO0zjWIGtsOufUgj+956nYP4FIgXqwa4Qyig3gyJApwo3F2i+mwKrLbOuVCYFS0fNbYXvLD/NbdR1YKk9B2cEmr/oVgFi7WWqrUrs3brr0kbnhQ+X5iekGwebUHKYctZy4vGywmAoP/egyxmQ9nod5DRysg699+asrin4GiFAXzlf2mbpuO9wD9HVmw8XhkWB3gZrGdeqca5FnHb01JyOVIEipP25u4U4I8lWJM4DtuZheitJT/8WrU0GYnHAnnpSRHJb9A+l+kpciohlv1P8ZEg54A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odXzjuSjYo8EWg4mU6RfvwTq00fmgwsHGIpQGNhWdoA=;
 b=FnVZuhLVAjVXA7M5BRX91SZYm57Q5rKIivqgZipvRXOxaFpFUC8EQrVPymqSc8ILIIxGevCe1jbHzRynEfxHv2hCYBL0drF1Ib0zlNlQNyy3xtmW4J0rP4Uhar7aiBlGKJuwY+6OqWdByUl0qkQS8/LQj3PiFOHurb5xJUFybBvSyV2mc3GLQo7PwsxTB5v6yEpmwtKnI1+wigf9VfuMzs801n2R3vygNTBv8upMqs+H2E8y3q0xQESggdw1OV61vQbqruKXpyRbqLRnsz219e7woTsw7MyzvIz7TmZJR4tecGfdFFEfQWGyxtCdatJiK3Zxt9hWS68OFo6jJlxxng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odXzjuSjYo8EWg4mU6RfvwTq00fmgwsHGIpQGNhWdoA=;
 b=mSWJjeyaryc2LC0fqgnuy938OFq45/fmSeRwm8qgTjH1KQZt88NO2liVpRlxpu4/s2r81JCYAnKOUM8gBbgoiAWL1iojLsrjlCCSXEPX9w63tHT50iO0RgRo+hbTpgVNMq9iQ5JmaAPw/5lum07TP1E82/jmReuEIUfNyCvjEHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:43:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:43:17 +0000
Message-ID: <87frg5zqdo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 18/39] ASoC: apple: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:43:16 +0000
X-ClientProxiedBy: TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eded43d-9dfd-4af4-0bba-08dda95280c8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oN4G64IdF/cOe6gJJfmm/EWP3tDAQdsV9/Pzrl8amwLMWWWcCMbVF0PwwywP?=
 =?us-ascii?Q?DSiVSCFl0YnpMmw7sATjrhgfKOb7x9cJXYv2JpWEg45Awf2qWWNm0QCzM3mO?=
 =?us-ascii?Q?fAHc6T3R8F1ZT9Elzos1qbj61SE9R/uTl04hYiZP6RlXIJG00wsn0M1BXCg4?=
 =?us-ascii?Q?EgYKtDRw+BWlJ1jH3zarWOQdg50+LDz8iTB8aXWYd8DMnw+8u/lOXr31QduP?=
 =?us-ascii?Q?8/QHqveKDtb9jGFxUV5vaMg9gXwwXCvpD/F1QJrBY/f/L+7ZthleRmHzGAvp?=
 =?us-ascii?Q?Gd7+3r7MFfsDmdIFPqWWFjcWtEuVBuuiA7P7sVWFS/ieail+TxiUfxcLZWHI?=
 =?us-ascii?Q?7eoRSdeMB0WRCpiLtB8PwKwHUGIdnMZiaiZtRJmEyWD0DGUCtSsrCSD7vJJw?=
 =?us-ascii?Q?x2ivvzPKXSS5PryAbeDobpnL06GJC/E/ujLWKFwmwnPBLA9sEJZqrv+Y5twa?=
 =?us-ascii?Q?t1qzRCFx9oJXCLfU9yTKLVitTl1SA8Kyz3gE+aqxP34yLuJI2UTsjCGbXs7J?=
 =?us-ascii?Q?8mq532MhAlrR8oZeHB/fM7kgXpjiZ6cMrcHawEns1ohlPLWiiW9cJIlqk+QW?=
 =?us-ascii?Q?C4lYZqF9yBzYNCUdxMJ1DP4JgxvPv0PGYYN99WN0WAkiGRrI5/avOQisyH2l?=
 =?us-ascii?Q?mrRPMs+9kxDMDIarr171cXcTnu8jNcdQFwjGnZwEejtS/43Gglx19V/6/V3F?=
 =?us-ascii?Q?IiWeXobaRujQXoAg0K0hBkYcTV2hzfL7OsRBjwyFxfvhyp4IAxTM63xJb/4w?=
 =?us-ascii?Q?+e0IkLbrMvnukbO7w3FFTiztl66dTj8GhEjGZI3A9InbAfohlDxXWu4if5GO?=
 =?us-ascii?Q?ksqMS+mZHUdD3aBqRYGsrL8ZE0Zhap0/FvScY3OFIX1NyK9BR2zxqr07La8B?=
 =?us-ascii?Q?kRLFKfkqp7y1CT/M0bcvOBlH77Yv80h3hJZSjIBkmDhqF+ZH/iA7jDl1nC6C?=
 =?us-ascii?Q?jqUSl643mo+jCwf88/qtsHBFScb7aC8jvdne3EcY0rJr6/VOZAGDJ4FWwmW1?=
 =?us-ascii?Q?G+vQMB0pFhqcZTKXlV1cXm8hVzasgfFLvpVPmqTv5MAc7nRLLwyeBrVq/Jtu?=
 =?us-ascii?Q?iIeeviDRwe7HU2ajuyTTWmhV6fD2NePpum350igZg6Pt3hOg7SLv11uOCOTm?=
 =?us-ascii?Q?SEzVBi3yhTUKULPLNJZ0fDaTGQkvbkhBg/TLiPUiC98CKqakmuXJrOjFYsyG?=
 =?us-ascii?Q?BBOUxWv7197eksgBEysxX14Hg6lO301rALnw6o7Ma3pIHPKhmUbH+KZnPLup?=
 =?us-ascii?Q?9OcBaR8a702eEB7PNrn0feNSE5rrDjQS3yCeH+jijbhl6zrKaqH++HhkYhVU?=
 =?us-ascii?Q?bNIuq2OlCh4r38+RMeSEGoy/4vBBm3HfNy7rsdtACKb6W4u5i8+SXiF2asP+?=
 =?us-ascii?Q?6uTYBSZfUvyzL17sADiHqvPjLDchlDzujXeeMdEgekwBE3h7ST+3Z2p6WI1Z?=
 =?us-ascii?Q?jCocu53kc6LOkkDtlPcGXCFmBibTi+eeurS1OBVwlpimp7CEY754NFZ/JGyB?=
 =?us-ascii?Q?XXHagrrn5XzDT7WxVo/IxbUVeXHUEw9fa7XHRWKDBfJ9war2P/8wCk3d5w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BeeubjsNq/BtSA33omwANVqMnm65pMgheB5TI91HDp7ze8Yv/F6i4ngYoyTj?=
 =?us-ascii?Q?MhcLBOj0STZS7b4XapDFK0X2QxWu3um1Veg8eQs+ybItMzlJ8F2Xe4142d/E?=
 =?us-ascii?Q?7LSI9KCSE7eO4XjvuJNWq4xeGyn9EbE5Y/PPp5/9j6WuuzrG7HEcyX7jbkfU?=
 =?us-ascii?Q?C9RrepN4r9GAr04c1pEIGwoUX48CMVm0aHXhV8e8pv9L6IJ5dRS1582rn3k3?=
 =?us-ascii?Q?LI/mm1UbE8KbsJ6tu5jIdmRH/gJh87wWaqKo6nd8kKsq54pi3Qk9nFoRDbAc?=
 =?us-ascii?Q?jDW8OYCQlLnwB/Lo2jCrw7e8g0Jt3S6Zk/+JFckA1r8oTBHgBpgAiaX9R+m/?=
 =?us-ascii?Q?HgssvX4A7z387FYYz3m6ggncxyTl0HPlxAe0PNDfZaWU5n/07njIPFDDXP3x?=
 =?us-ascii?Q?FR/fMqsi1Dfyp/CwCStHjxULfvX4GFtw6chnNVD9pdWFXBw1Qiq8wMYQAXRj?=
 =?us-ascii?Q?J3JpZhyMk+SpH62MSw7ueF3ZCHefFdtNXTrWOYACWHWsWlazDDUXgKkaVvgl?=
 =?us-ascii?Q?A8OEWZLrT9diq0Phn9O45EuXD84SQyv4e50kqRjFYaCYHmnq+xBqb0GW12z2?=
 =?us-ascii?Q?+aKwwPDwA2bBjigCEke/k7kA8cU5bzVPQnCHBe0nDvXFIwI6E1fbO2LezmxI?=
 =?us-ascii?Q?/mVFjtAJ6ikowEL5qIKu5AcItjCaedeHEoRKefV71R2cRezKFtBOMuEm7ZdA?=
 =?us-ascii?Q?05jg18cmgZyb78yylkQXSdqffiDSrRTPcfSCPM36HImGIIJuWUAjIroYwnxn?=
 =?us-ascii?Q?93Sqa84/ZNZ7xfQ76fLHt3+MdgtGGMEnXwqjiNXuwgxc1tsPtFVVxEiFOlld?=
 =?us-ascii?Q?ltnv0wr+HMBNxPTMFxaFSAqml2s2Erce4RX8hVE0rruqAgUM2QKdAQiXLfAh?=
 =?us-ascii?Q?d5oGb0uMhw0Qb8GKYPUzPv31QvAUqPSWqTt7Bv9l7cPFTJzdTAQFavfaMLic?=
 =?us-ascii?Q?BWjMGPDzLM7O4y4ukjTevJ2/EQAMN6+B2f2wlKXlEDnaHcg6IszQa18xqzZB?=
 =?us-ascii?Q?/hph/dD15F39kZi1PjCph0Cpz0qugZ1xWnGdfcKXCaaf3WNDu5OsAgLjtPn1?=
 =?us-ascii?Q?iNAiMzYwjksI5D6Ijpb2+sm/gTZBgIeooCPblIX4VCIgEDdNPa1XE+KYiGH5?=
 =?us-ascii?Q?PuWdD7AKiDeLTSGJyq4hN5sWFV3/B0qk+yQzAKU0ILKS7IEAP2BAVNYUR7jT?=
 =?us-ascii?Q?iDjH56M5OJMR5uqbdOUsHNVFiSt5N4p+F8ilou30Wv4RDCCZF+21lzu0K4rZ?=
 =?us-ascii?Q?Ag/QBzrhozKL+zt4MPMnknt9uIJngpY2QkHfS1oTmMoqklCeuUwBViNq11XK?=
 =?us-ascii?Q?U2k791/O5z0s7QNZ8xMa5Sr7KH6uUumSGoxhruXgGKgCsbJNorFlZjanUEll?=
 =?us-ascii?Q?yxRKHKqRp0nPOtWcB+9PhKTyA4GeWFTxMJ2PkJUNizmQnhPnaUnYmmsMIHad?=
 =?us-ascii?Q?chvu3/awqMOmS6maZHMBt2Gx5td78nM7ecWQmMyRSMexbY9jUX6RQExV5ktQ?=
 =?us-ascii?Q?kQwVoAEFTd0T/SIuzo5+2rvEBhidxFHgaGD9urx+Nwkx92u7rBYvLi3w/Tbu?=
 =?us-ascii?Q?vjArUIKw2yK+E3hoMy+EPaaEcUtjQjDUX5YyxyOP0ITGFhflgy/iHhMJp21X?=
 =?us-ascii?Q?i+6WKKyxuhLT4+XQdwIwMTs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eded43d-9dfd-4af4-0bba-08dda95280c8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:43:17.0850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pC91Kbmc7767BI40i54gpkO5FdwdSnFokBlu6BsS6m0OQnoAoWEYKTlPodp/WayTNGNm620BSrDasXKU9UniobjUJ83T9yGTEGWdtrEcSjWWu8XGEU+EDtxHb/zvHsE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/apple/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/apple/Kconfig b/sound/soc/apple/Kconfig
index 793f7782e0d72..947b800c70afa 100644
--- a/sound/soc/apple/Kconfig
+++ b/sound/soc/apple/Kconfig
@@ -1,3 +1,5 @@
+menu "Apple"
+
 config SND_SOC_APPLE_MCA
 	tristate "Apple Silicon MCA driver"
 	depends on ARCH_APPLE || COMPILE_TEST
@@ -6,3 +8,5 @@ config SND_SOC_APPLE_MCA
 	help
 	  This option enables an ASoC platform driver for MCA peripherals found
 	  on Apple Silicon SoCs.
+
+endmenu
-- 
2.43.0

