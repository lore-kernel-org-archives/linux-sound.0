Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC59F9DA
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529180; cv=fail; b=CPPdnuFyJ6kSG7/OtEWmjnYYBSCTGBCrmnl3jczWXnAACAtuO8eYv8Q2jnc2slyPA071S4j7EQQrFcxrfuZ+Asab+Lp2+gBSZa7tlZPzRy0jH/UiUMqjNhoRP6Oz6J0JlPmqx6VjKfk/xPrxvrKNmmllPdp/xFcncBoiLSXSuI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529180; c=relaxed/simple;
	bh=7R/NPyWVKUZMiF+96uZE6OngY8veVizUOEPuWhkHAj8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tss2oz8TO4vBjqornEJORFYKKbT9UENTph1zL7L4rgGGs5MLJyRFNwunRQbSnkdkik8Fze88xquUp+agX8sRB/PnwXQPOh3g0slvMK0Ylv8IX3jCKy5hZd8zLs4qbne+/UcvhSsvfkANscpZLRJXC5bIe4iDGnyJvhKn1rHLpfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GI3UZk20; arc=fail smtp.client-ip=40.107.74.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GI3UZk20"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yP8db+ztgilrE6wBDpv/GNdqcfqAe3LIwRq2LdISW/7DoIsCsRPTy+VNCJ4hzc9QHUyWZgBJkNbPqv3ch8vRPBr6T3rg4OSKoMxMGjszIHDydHwT4jA2p9PX7a5HwI6dTeXnCAvOKhJJOiVGM+BKwSx3bK8y9yu+Fz/0F62OVMLmQltnzCalPQi7Ar3WfA+Lbx0/RRqVK8BJ9jCDfCpz8NirqTepKGdqb8tISEu4pocEIfX6zKysr3QGZh9Naao19K1SQTxY/KegNpRKhE51z2bpTQzD1J5qTSe1E10Q7YZJekF//VslOKZzkQXLyjaAartsOa2+Y+aWvWntgvLY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ag5fm+VgGd2sCzw+zfVikXtSO8jsXBXxk7rKRtdbGw=;
 b=k4BYB1e5HYlfFRt+abJl478lSjVua5OMYVLB+J8HaHUsr+Kndua8TOn8sjjVxtELAEeBlbykpk/gIHQa6uDrBKtoQtwGKoX02tzAZsluhBB4AOtAZvp/RpR1IWclNU1zgqtu3cGehCcvoS8iFWgAnrtoBAd4RblNWSDAwKzY//GIO4XYvIyFYbRMtFMj+8Xa7UyxkW/y60MmhGWIyGSzdmaFx9w+XCDYVb6TjYZC4dxUblpGzqanlvDzwTiQ48gbiXIY9kHFt/ZKxFOdjAzNPh518A+zlKkrabNPQ/DBRUl8b43NdR4hYdmrARV6vbzcR2FfrxAYycr+a76uypXKUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ag5fm+VgGd2sCzw+zfVikXtSO8jsXBXxk7rKRtdbGw=;
 b=GI3UZk20d6ZyyNM/OGoa1Ph0uSnQorpSbdZVkRVmAP26zr2Pv2qzoxLKfO6RZkJY1chIU9Y14j7LlW8fJPCPinfNG5x40lA1+F7KGbd12zhGwcDTAGGPJn+jRwLmrEHdCBMiBmOdp6GF+TVRyDkEjkiaMfl4mFWMRE/JmZDhBCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10510.jpnprd01.prod.outlook.com
 (2603:1096:400:307::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:19:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:19:33 +0000
Message-ID: <878qm08bzf.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 02/37] ASoC: adi: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:19:32 +0000
X-ClientProxiedBy: TYAPR01CA0072.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10510:EE_
X-MS-Office365-Filtering-Correlation-Id: e1890509-5f4f-4bda-cf22-08dda7d600c0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j89ifkyv6mPc8/0FFd2WpncaJjuyslxZSngqyNEEJ4LdKxXfQHB2QXR/N78e?=
 =?us-ascii?Q?t/RV+RNu8vQ9rgCEsn+OBAcryoHAI5gGn+1lahg8L9sX9wABPoo+o8uTCsjD?=
 =?us-ascii?Q?GKlndXJWJvQrKMtmLEArLwi+SbDlRESCaZoKuNoOOLnDW+aN9jSuznI+K2gi?=
 =?us-ascii?Q?5axWU9ept41JtovtgtybZAuxACQwRM/O0UUfDqGBJmGFTt+5wLhA86K11hj3?=
 =?us-ascii?Q?cmqXmwvVI1NXCDZgm4HmnIts8C23s/yu+Ot3Ba6OgqZOqdRNxpBjiRkJEiCK?=
 =?us-ascii?Q?IjynWFCbbogVWJ3YQvi2Kj49xcaMnz5usQOZeU2Ox8MBWTUAOYOcqJYz7bHV?=
 =?us-ascii?Q?jJIzjBdewlX/p6LOBpQC8eTKck8YdIHFrnAV4aQZImKNO1ZbL/sbT9bhQSJv?=
 =?us-ascii?Q?hOUON6v3+VJfiZKmM7GSMjiqG4pQpIU0PMjBaq8GSsfmBOdPn55iVJS2FDWz?=
 =?us-ascii?Q?bSJLL2QymDm652hsMTamckTk0pBINxSZy1J4egUdlqsWOZDFF8pIct8f2mQH?=
 =?us-ascii?Q?GseIklSwED0yKSSuoMXLTd8yDhqliFIZED+jKW/aCTvKCeTRwNI+BdezRkec?=
 =?us-ascii?Q?NzY3lCrUMvl3JBXauDVU8/E1RAbTJaJlU/xsxDi5yStZUf2ZBxxJABY0loDy?=
 =?us-ascii?Q?EvPBv+jFMBgUqObps2+SB5aHUp764ZyvFECqC+PmqOjadAp+8TIGLZuK8JTO?=
 =?us-ascii?Q?uZMS96dcJlwjn59o630Mb6tdAAannmSV/NjgG2Q2tmOkJd2KRfY8z0qJIBf6?=
 =?us-ascii?Q?sNvLG0YlFDMIpaF9R0nHEHauZ5CuhTNH21GGFNF6R0fRpgG5laTvUSy9lMq9?=
 =?us-ascii?Q?iz/Me2nG4EY3HAqoWq6OY/btldf9Ow5lxVMuHbT42KkVp6g10adVIdOXYT3l?=
 =?us-ascii?Q?JJVdtH27f21+mjTQz48sIbPxpvBQ/vXXbVW2f9nyRErHNNb3YKbSpwJG3Dnm?=
 =?us-ascii?Q?0viKuY6+3NfP5B+oHL+G5wRQ+0pkuHD1pOV/IXqrxm/lqZMk2CwP0wqLzVw9?=
 =?us-ascii?Q?FXqvj/VIMpieJb17QVIu9wCiucJS+lcdJvx/UsIo9BLsMyeKbJhmrUu43Xvo?=
 =?us-ascii?Q?Ftht3ajvH1FbdjridYd/AI8JLq9vb52EunG2wcHPNKPm8qanxZj+uGfMrKmU?=
 =?us-ascii?Q?oSh0+34/3VNQVKTkHY/XbteDqvjuoMhM3Yub1DdXJFqQ1t08yywiMdSXGYnP?=
 =?us-ascii?Q?5JSv6etcsSO58aXL8cyh2pyWvtSWWdta8ex6dsw3g198rv38PQrCCr3er+wQ?=
 =?us-ascii?Q?z5KrHHgZd/KtgdpxxzVn1UJjnSuo7/QrcPnW2p3gitnJiXiWbXhxrq2iFL/e?=
 =?us-ascii?Q?4l0yeK5ZZoPmj6FTvkwZsWGDj3/tIDeR10LIcwdvP41KLyRBqR9JnHN0ZZsc?=
 =?us-ascii?Q?kr0+cY714lor5GhyTTexkZ2jlfH+KFGJ/JRmHzauqhjXtcbvev/gKZECC2jB?=
 =?us-ascii?Q?fiQxX6LG9HCGZCAQUexFOlI6CLosCz3aoHsPbYWbSkb4IOG7rVfjfRXGxhjM?=
 =?us-ascii?Q?CRR/aljqLNn0RgiprnS8UNDZVyivhY2OpEYpJvPAuJmSPalQpy1JbbpjEQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?geP1ebMit9PZaIALyAL+74Yk7HdbEWsHf93T5HNXWW8cdj+Dse/DaTp059CD?=
 =?us-ascii?Q?7HJEu7PvsdSWnXW3xZvJgSQddhs6TtFYcrTkN7fl6elgg71br3o9P5mNxtcp?=
 =?us-ascii?Q?92s7YfF2TWQV1CCMFUt7ge2Igrn333FKTpL13FROm9zLZ5PhDhVUWJDWccW9?=
 =?us-ascii?Q?hEjjiMyh1qXDWFV5aRjRXApcd4ceEcXb1p8miA0u/RGpuvRHdBMxeuvu36eZ?=
 =?us-ascii?Q?+Yhkmp9kPsj9Z1apUANVwFsIzIKOkKPd9tqijrd4r9nYU7C9xyN69tL3t1XQ?=
 =?us-ascii?Q?EnEctYXjE0TbWUfuz7LD6HL/yYdHRuLZUX0EJ8ErvQsR3oSZk9P+ia82gvxt?=
 =?us-ascii?Q?oZLzpPnKV/GUqz3cgu7n8NUIBL96mkXXDtiX2OHhZl5W1qjjiOvVV/RmQmx2?=
 =?us-ascii?Q?kFWrH9CEgq3wo7ZT+xCOMjr1nZwhTS12YKknQWWy9uRBtVSdxtgLXtOuAk3c?=
 =?us-ascii?Q?thTJzikK47AUycUhyIwJX4sYNi3ZVfIgHBAhNyi6l7ArZvJj6w8VZckkBzil?=
 =?us-ascii?Q?XeOep8ypfOL2Yj4WyOmMpYoPwcBd9SukgIR9dWMZCWPN5C/MspZEYu2K95WA?=
 =?us-ascii?Q?Ay+Tixzkjmmq9MHSclkji0c5rjh9lXGEfe+2EwM+HP80iel53pfggJqJneSU?=
 =?us-ascii?Q?ajM5Wj9ou29DVK1ecxVWDamK4IQhrL8/gqXO2Emcz/KmOL1VryatWN0Ju2mH?=
 =?us-ascii?Q?6/NIcbALEsxrcnSRds/C7G5Nbie+1V7ydjB8bZS010xmoNkCXH/A4+QYnkXZ?=
 =?us-ascii?Q?YgeSxIuMy3UtJRMwO82trEj6UCYkEYEXYr1bM9KLUw0jJw+0wAMTKBJEgmjU?=
 =?us-ascii?Q?nuKvdftkKZs35dRgoyvyMe185+5PU4f0dPN2DSm8pI2fAy7IQIW5y+pINEUa?=
 =?us-ascii?Q?4Ti1dJxfs2jb8f2H/YGtMEdjwuUe9ZokbyQ95XWgWDWypCfU+8kXN1fhaLB7?=
 =?us-ascii?Q?oPH3Dv2MJQt8s2W6pg/nw1znhw2kcS0FKTHCW+fjS8BehwrXkg/ua9UWQVYf?=
 =?us-ascii?Q?n0WipkMpIX9kzjBEcJEj7OAVTWeZSrnyFyhKmcCCTOW+6T030UhBZPZ78Gfp?=
 =?us-ascii?Q?JinZzEntLUcPZR9hKGtNOWKhdIQcMkLHRMdG6peTr9+BA0pfE/sYNwzizCd6?=
 =?us-ascii?Q?YuZFgkYv/xKaGLWs6fCnNccrdp3271B8S0fWRB8ZIgUSTSQd2Uo+oKx2mEEg?=
 =?us-ascii?Q?ET8wtjau4t3M2OITvbjhQvpu21ciU99whzLjjBlw36Tw4/dUbbGv6SMZECfV?=
 =?us-ascii?Q?RtUwPSyadOSpw1pcw9lWEhhNQDoT43KhoeNAVY2ws8YfJsOCYvW+xs3JSHMn?=
 =?us-ascii?Q?HV95tE0btRnrrIvIscaYFvGed3rbY9xWKmHfEAWVRjnn6cWDT58m9iZ1CtcP?=
 =?us-ascii?Q?jLAToVBjJ9dl9gMArVfWbqt8LIUXLdnCJ0SutKdS/6XDYXOiIOaziYNQRH6u?=
 =?us-ascii?Q?mra3mTZoLlkb9GkR07Xbj2cMc9zSnmIurYE0hE2MElzW5/u0ZWF0WOeXzvde?=
 =?us-ascii?Q?RM9iPE1G09KSH3XIhjxIW4JHXlzFYM4pKdBBvj44IqjAcfq7FT78zxz8rUV+?=
 =?us-ascii?Q?Es9kWkiYf6lzv2UbQRt4/hZzpsU6WmCR6fWsjTm8JUT1of5eWWR11e34zwr0?=
 =?us-ascii?Q?OeNoU+b/q5+vZisYZ5skPLU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1890509-5f4f-4bda-cf22-08dda7d600c0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:19:33.5367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlvfX8HzLanqPTSzBENV7Rahh8erWEV20x7F4PkwHCQJf6ZRXLnM4ulBdI9W7F4suKqKjyb/An/4KN1g9iiaBuZBwkvUEO+Rwp0CgayOPNaZ+kJiEdyrvds83TB39p5P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10510

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/adi/Kconfig | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/adi/Kconfig b/sound/soc/adi/Kconfig
index 0236dc5b4e9f0..228805e245e10 100644
--- a/sound/soc/adi/Kconfig
+++ b/sound/soc/adi/Kconfig
@@ -1,12 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SND_SOC_ADI
-	tristate "Audio support for Analog Devices reference designs"
-	help
-	  Audio support for various reference designs by Analog Devices.
+menu "ASoC support for Analog Devices"
 
 config SND_SOC_ADI_AXI_I2S
 	tristate "AXI-I2S support"
-	depends on SND_SOC_ADI
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select REGMAP_MMIO
 	help
@@ -14,8 +10,9 @@ config SND_SOC_ADI_AXI_I2S
 
 config SND_SOC_ADI_AXI_SPDIF
 	tristate "AXI-SPDIF support"
-	depends on SND_SOC_ADI
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select REGMAP_MMIO
 	help
 	  ASoC driver for the Analog Devices AXI-SPDIF softcore peripheral.
+
+endmenu
-- 
2.43.0

