Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A327718
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692610; cv=fail; b=DOTc31UxbecBBJEXYTxG+t+CqB8YKSCi18x1nugGt1MLAsIaul/0vFcWiHfQsub1JR8hPw6y6k01p8KopDqmNDcWy5+5yTgugjfxnyympfGAMurfwAm5TESgS2OQp2lzg8gfFlnyKe2HhTeTV9WX/WYOTHngT8pnfXelFXFeG84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692610; c=relaxed/simple;
	bh=c2RD8FEzgvivO0gvD0aSE3wisiYU+8oFXKAsOdl7OFo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UUBoUiKuCAGwKkOWw2k7EjuFVf0miUpmx++MKUjNfEzdgKv/uAP68MEeJH6CpBH+fFTcprKdmnIroLL1f6jViAR4PJyfRvuaziB+lQ12acE0nalA4JmKwKE8RjW05ZNKyoTq3cY0tbcSzDVvUjLpq/8f1/AFcDck0MD45KFCW1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Nrb2Mx2X; arc=fail smtp.client-ip=52.101.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Nrb2Mx2X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knfCKi5MdeZiA58uIs9IJ0mgalJVDIGGoLyHLqw9pTGX7YPxk769BgH6T9RlppWTc43dYh+Xpk1lgXnmSTNI1VljjxA5Rb2Id3ge3lE0y5nEXJrQ+kTNCqxjmG9TCB9JW6Y23MDAn/5qRyRvzdbuDnDSt0W8a1zcVpiueWk3DewtJhQ6d+u60miMnkUBbxQSePpXNv0Pi3I71k5YG/Vi19T2oY+mhVinqC8qwIVyOGY/XJf2sVsTokYKaZM6DP9fczkd5EgN5kQ/HgIdKg2SZzhibwuF7ieF7EBMKyiENdbOT08IFyNxFGgckHlgOGMt3Y52CJ636ErmJisJIQTQcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtP4UEGG0I9iANgwFoYl01WCvGIsp2PbEGFMGXZyua8=;
 b=KWuCmXEMobs0KZVIb10xmEO8dHIT1L/F8OJDHE4L+G6QFJrdswTxYSiFP+8GdPNn4IomlBgmraTy0UUnsTFB/PjP7vieWBsEqYubfckLYA0RZlLtUIEZJeWkedr431+VVePFIikLIScF0EpBvGyWYbzfMsLJYfTR7uVmX8CE0d7RBLI7goX7ou2/cpuVGxprolfE1r5ysxpUQ7vGIJ2m8I9NpKx1meD8MWf6EVYpkIVw+nykSoSREhbL8U4Po+MSXPoj2hB+JS9qoao/GI5CkD2VkqpOVgmvlg6eMKuDj0Pc5Z1l8fyaNNJObtvOPm6aA1pIhfB6TLxfoGCVe2bEgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtP4UEGG0I9iANgwFoYl01WCvGIsp2PbEGFMGXZyua8=;
 b=Nrb2Mx2XiMkhL2qvNnXmr0ap+QuC/AtnVcZEhfk7agc3NvEbH0GD0Nmu9waXRlYD/lDQZA/8KenEvbdLkclF3/gvnwXTDWQgKb055MJsadeLy7FhLu/OzuT1J+MeVb1c7WMxm6tCLW8hLaFexpDsDqIkd1FBiAJc4IdTGKNy+Q0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:43:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:43:26 +0000
Message-ID: <87cyb9zqde.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 20/39] ASoC: intel: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:43:26 +0000
X-ClientProxiedBy: TYCP286CA0208.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: 146abb9b-80df-4f0f-ea44-08dda9528691
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qsvvY2Z+orid1Njs8uLGdpPtq5y7PblionfnnKJ+p0RZEPdqg+lG1wAn1bW/?=
 =?us-ascii?Q?XppQujlwMmlH6UV/p8l/K6v5gdLNHcRegKUFsJKAr6HgfZoWYjwHy8AsP4ge?=
 =?us-ascii?Q?QGVwqpudFX3uxrnatZVj2WYrxTEy5iU142ZxiTCfB3Ne1X7WUA2fKJzFtnsm?=
 =?us-ascii?Q?Y1h8EOVREM/Zo5ck50W7VYav8wYd7bMnF2Vc80sz3QJeLb/5hq3cfs9aZ3pg?=
 =?us-ascii?Q?cAMCfYjW7aSfPZ28Ilxsr16n5sI6Eas9ulc5wxkIvmbDZr5wuPcAvo/WpRY8?=
 =?us-ascii?Q?l4SOcbG+zahYxWkoKjbCR+A5ce7Z6S2FS5/96TLmcW7WyMJkWuHOdQnsn7/u?=
 =?us-ascii?Q?jVlxUJPDsPeqpgNhkm+OMxTC//r9+KOb5tjJMUHWurkZ8OP8du/mMgfOTFd7?=
 =?us-ascii?Q?hbpvTFrqS3cVSLC1/RxIVtE4bxf4nXl9+S7Dqk/SkqM2XH7AmBvr2Dpux3B5?=
 =?us-ascii?Q?MvqPEp7e/kAdaEPf4AimZ/xoJ6Ebf8LKyYivl5pQwdi65ZdwaT7f1S1rG3OK?=
 =?us-ascii?Q?FLBPvX+8ynyQOvoK+qhgzLVAYzxQCy7+Ek7PFLHs6KXeNb6Bmizu6yu6QAYj?=
 =?us-ascii?Q?LpSnBMFoO7wWRBBMpl9gOaDzUy4dmszQDPkdWGqOh06sNvsbxouQ0Xz05Cfe?=
 =?us-ascii?Q?Xz6KbVWqoPQVjN8C2CsEfD3L4+hx/U8aQ0mzoW545IIWsuD5L426LSTfToTC?=
 =?us-ascii?Q?sQcWxs8sRQe2lMp7gNF/vdpcsFucbNAnAivCxoyjvpUplV90SqAyn3NyULiu?=
 =?us-ascii?Q?MjPPvIuyiX37gXG7hVC0/8+T+s2XAqpGmpp2mF60FiTR8LJm72Fw8t/CwRq5?=
 =?us-ascii?Q?ZN56N8C5cvhKMVbL6QefK4FcAN7JdxpU0FTI8g2uAE14lv32jcJew+fQOwHE?=
 =?us-ascii?Q?+QkkgEFGi7AiHRPKeIz0RKtVAdRtZ03gs9yENdEvKCY/H1u9TjI91Ina6nWP?=
 =?us-ascii?Q?wHzr7oFx3QWirWl6hB1PrczEdCp0XJsmgrQxVjH/9o1MYWfndXrxUt9M4NnJ?=
 =?us-ascii?Q?lmWbF3hXcWXzWaXTeqBc0XVFRo0B/7nC6Ef5UblWxF2CkTKyhumhfH1sCHAK?=
 =?us-ascii?Q?8jCg2rYd0/MBNHmh5Djkw1EyOmMDtkeyWKwRokiphaiOGaY+O3tdh0MKasnY?=
 =?us-ascii?Q?io9/77ZcDZ3n73O6i07VIcNcLpGGY0RXbWozWxcTpZvrkA0Df3goPt/is9ws?=
 =?us-ascii?Q?n01m8kOk43u4fcXJwrsN1Rvaa1siwt7BYHPHJurrC0/OKc0g+7dR8jzmJENc?=
 =?us-ascii?Q?Gi0I0uQCbcYt+VHphad39c/jrZlyVgF5foxprFR+z4IjVnIBsM76rAukMSik?=
 =?us-ascii?Q?Y+k6OOvVKX4C9xqphSRgtFLU0jDC3DfaaYv8a8iAg39d8e61dMA35ykgoxlz?=
 =?us-ascii?Q?LunrYLWJ5djQAwY4UZbRmEHv2Lqt/N3O+h9FgBO67Oo+PPWCQaEsqs/VgpWQ?=
 =?us-ascii?Q?STdejX9xmtTrMZ999ZFelmgWJB/6d2Xnq5ufLBvLB3C+cMdC6nhlk5ofI/pZ?=
 =?us-ascii?Q?NMIvks6lGUzKdTZV0vyNjD/5dJCxumHpNj0M0yINFmVvlr07qlGIB1pKAA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EDikGTA4vt+Y8UuuNv3j6mIZ4HRpTOOoV/WkQQg+/8PLSRz0SEqlvzPnK52H?=
 =?us-ascii?Q?PAha6CpitmeifEPjem0sB7hlNBtZeNspU5JeY7xuTkY60CFAsH5LQkZDmmHj?=
 =?us-ascii?Q?bs2HkwkZocjS9meWlV5gZtaZWpG1Ao/EVX3nJyk6xGuxqlt8X1tz21WBDevd?=
 =?us-ascii?Q?Ripf4Jz4whymCiweUwnCbL8h6DwDBMvqxwJ9K5Ka82iclX74GuUBye2HNDYV?=
 =?us-ascii?Q?3mhnxr5PYUBQJRJHMP8qfD9P2scgqMUeZee7FGbHf8fhS7c99oZ7EzSXkQNc?=
 =?us-ascii?Q?VP/4CS2OGyMo2QDWOQczV8qNIIDX62vLa5SBZhqHxWWSyuLvs2TfuBWZlqbP?=
 =?us-ascii?Q?npxvM1z1oow/h7L4lzyEEuG3JHbDsRLUqNfmVWZBGCGrOXcO4ipOMBCJ04Y8?=
 =?us-ascii?Q?wIag/fHm8tBGZ0DT1O+crF3paJXW0PRRGKk3yP09fm+MrMMpvhY3x5+k+RW4?=
 =?us-ascii?Q?V+0psi18pGz2cfxkL8GPjqfn/uIHVY4G0ggKiixHxljZG/A5IdP4vBNF88E9?=
 =?us-ascii?Q?cnqWPxxKS9fnG0uYXj1kZ76XSxc+5/RUkn5L0Ig2SLX5H1X3fjyAvB0Aa0WT?=
 =?us-ascii?Q?1v6X7Qf9DxYvcAlgOG/aywdi8yHurSWejGQuHzzrQfDw+5fnoS4TdgCv64nK?=
 =?us-ascii?Q?WEELIQ0BukfilBW8K3v2FMOJKhf1hMXs0S6GFPw5Dl/Vry/n4hsGuOpV9wlm?=
 =?us-ascii?Q?lR86cnPHGbafOsnfkz3D3r0OYgamOOMdpuLesjjU4q3Rtl8M8V3JGQirl5rb?=
 =?us-ascii?Q?w70bL2wI5O+dEVBk0YEr1zxQ8feHf3/fUvZYvN2e4MDuYduOgdQrBFbYRS5S?=
 =?us-ascii?Q?tNoHKD4eILxtsC+Arqoqz5AwgqfRTZoF1Wx8ALk8kW1aZ2we8RcJu1lqrlpz?=
 =?us-ascii?Q?4qSSlAveY+lgoZLOz56kPnPE9SXfqxyHrR6sCbPIGIP91gri7T3CAA2I4+Ma?=
 =?us-ascii?Q?wFY7PnN2+uySkwPKuL6W9LnVloGoUmOQbCrFIesW6t3krf2U0gahU01+FyW0?=
 =?us-ascii?Q?IT9rteU5nv2T8CukZ8+5KwyJZzSsLwBcj1jkeyj0GBRdv67ECzAeVKt6D4jx?=
 =?us-ascii?Q?FZiCd6NjEGMw8qYFTvN+eYDjajyJ7bMD5IjJUhyz+m2hAjEUCojgH5j3BP3q?=
 =?us-ascii?Q?Vn8hTEEYP3p14UB2q7vM9uRd/VwwshO1t6yv1/e1gY/ES+xV9CGKDHCACT1C?=
 =?us-ascii?Q?I5ri9QE7w4WY+LULaOo+XqaIN5gq1LX1L0lSR7CC/9q7Ks7mEaLfBrsZEkSn?=
 =?us-ascii?Q?i+Lv9kRbUFtrqlj+RQMNsy7681fCLmLIRljT9xO5iKsODSPMJxqPfiCYWa/Z?=
 =?us-ascii?Q?KJSw6nYIPqbtfHQOF0UTitHagD6ps/eW8nbOi4A3Y2ss7UYZtPtfcfb4PBbJ?=
 =?us-ascii?Q?TC7bbpMCDLODeYMCWwm7/f5obnDlmfpbn6Bs8TUT1Ylns2TFasMrH08oji7b?=
 =?us-ascii?Q?12EX1ASArBwjdSyDcy3R3PkHx2liqdCVIAjZ0SzXiq0fpOlhRSHOvo6+obHV?=
 =?us-ascii?Q?B0+B57sg6Ld6aQviKmPhWZeOQnPBE15rsFyYXivooq1o4d1wpTOYYA0I6Kza?=
 =?us-ascii?Q?elAvPVDnJrDl8Bdljd+SIyfkUQSVBz94lwMpmm9v+RhnqejU509WYe2+vdgk?=
 =?us-ascii?Q?FJebSWMagLSLr7KYviBSGKg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146abb9b-80df-4f0f-ea44-08dda9528691
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:43:26.7984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yEl898kal1LDlTpsrNjolMq86FbGu23h4FLri/jybbRWu5vYNYjwt7jTk0wr3ufY98DOJCFvyALJTjO8Aw4CnxYgRI4SErKhRiPBNWDyBeaoB6YQtYt39eft4tDC0qJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 2db494b0e3cff..412555e626b81 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "Intel"
+
 config SND_SOC_INTEL_SST_TOPLEVEL
 	bool "Intel ASoC SST drivers"
 	default y
@@ -115,3 +117,5 @@ source "sound/soc/intel/avs/boards/Kconfig"
 
 # ASoC codec drivers
 source "sound/soc/intel/boards/Kconfig"
+
+endmenu
-- 
2.43.0

