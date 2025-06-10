Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1822F25DB15
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529416; cv=fail; b=ADmUJEDfHd7B/Xx8tSR2Z58jr1wjviEDrc5HPzAJpqBmPXty583V9Z1F41XCoPkhHSmcV3I1T+qFnKaBT/yRycHyQ54LDFhntRfnzLwj/0Rg0XKu5Z8TN4kl1qCGy70FX4vNTeWl6OE8AAXQB5+1qTxpCd6dBOZHeuwMcb34YgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529416; c=relaxed/simple;
	bh=HDSejezYGTET+aUcdAndSvFM31I8fTrP0ocyZnR1ynY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lFliv+R8iEv6vbJefyTjA+tj0h8vE7rEq7BgaFu1y6NXZMa1I7a/fVKc2YuwStyGFqFp0Bblk4LO+CQewoFXshKSRdh3auLetsNscfN558tcCeL9EVrgvAL01k2QPxt5e4t46s2HkQrQ7MD79UaL7979So959PLa0a3DOF5pUFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VOntlDCe; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VOntlDCe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9LHZR/VbnlUTKrOhxhbqofdWt4cNqDfh0giGgq47lbPqofTSJujEYuw527GMdR/6J2sVW4yM9jIQ8jPCsSB35meMARr/zh/GSZwKkqNmw1AD+br0xtfxqaZISO1ltB7jwbTacQcp6kkwN8cu1b8i/ueEIc8nwJtg7aQORrmminb5WJmma3G65+UF/OCkPy90wwjl0Fiy1p9gPfDckUR0sPEJIDL04l9OLInCwbceTPS3rT1HLa0rjvCI1Tlp2R+fhpyPN5rl9I9OBiNYc0b6pAhXTyd65hhQPejKc6xxTY61TJ5SiiiP7sOFOMa8d4vQzCb0VixEkyx3wQXuYrPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PikOZquqTfeZ1I/lUVaAKgENDLZfZWcHxCt4P+oeT+k=;
 b=uq/RSiuIlq7JXYRQnwumRlIPaVJhs0yl3DGtWVMQKiPBx6+RdKJJBuHOjZ8TgQfHGRNJ//I1cfZFPLpy04LTLgVKnsHdmRG+vkm/CHkaX35oKsueJd2tobrh4oQ+Oit82W43N3sC3V1Mqg/9Yzy+OZk8+s3UEpFWjcAB5ZIDUiezfbRPzb1dPAI6o/055gFnJpm64dUWf5R0WsQiZ/QsTG0JCwaaZLsH2x9DCXsyq0sldmoKQLqjSvJCEDCogHTP0Bnn9BANziUfOTlCtzq1AGaT31wK0jA6rjqiX8pNsyWoRHTnbBHWaoHJ07P9kXxZ7P8UF8S9EvYhabKydbhVnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PikOZquqTfeZ1I/lUVaAKgENDLZfZWcHxCt4P+oeT+k=;
 b=VOntlDCeUpmCMya1v/pS2OV5gGH7MEPjziVVixf4DmT3yGlF4FJeLUWTIXJumicaShety4IIx1hGS6nRPYf0UXvROcZ0P5mJd/bTOa3sKJ1lQBJjkoitbxKrPc0fdte1SZlzvCf1xnpTUvDZ83wn9lhBuCqtUaoW6lbSPDcrFWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12373.jpnprd01.prod.outlook.com
 (2603:1096:604:2e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:23:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:23:32 +0000
Message-ID: <87wm9k5inw.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 35/37] ASoC: uniphier: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:23:32 +0000
X-ClientProxiedBy: TYCP286CA0187.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: 649761ff-fbeb-46a8-6221-08dda7d68f50
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s2R4iK32GVBRxGZOB4O3hvwMx8DyoyFHKlxelcIwPha4Fb/gn1jhgXcFk+VC?=
 =?us-ascii?Q?UzZRZnY4Muf5/Fib1OKXVFuQ2lKStDM9iIoAxheKC+sb2Fwz8p9qhK0m+QD+?=
 =?us-ascii?Q?bg4mf3+X7iXk26dSwGJYzDwsd3bbYiw89ffFqpk6+LkVBndq2DgUnltAhHxs?=
 =?us-ascii?Q?qR6odfnfE5JI7vJzFGDIRvliyj5xlMt+NdEL3ffwEdNp1jRIoyhhtufCiaY/?=
 =?us-ascii?Q?JI3PO8btMfLASB2StYYzjxtBpwLA3ANc2uMe+PhcSLOnw3cnibIdyJEjLMCg?=
 =?us-ascii?Q?595Kr2lQCtsM+HKUw0jARoCy7u6Kd7UUvxzfIPQUR4+rEUmc4JR9D9lbgwcN?=
 =?us-ascii?Q?zwjLXbg03xCxHdxy5OcFEf3PQmPytBM2QOesvCTUYcNnV464/usW0z0fV8nE?=
 =?us-ascii?Q?8K/Qfd4SYoliVv0/9AZVhvU9nmkfi/NForMDc2Gw4XKdWE9iu6ZniNQDXTnv?=
 =?us-ascii?Q?EWjwx8EkVHXI5qIuGP8QZlurFV2NkAGNySQOTWHK/RXQVyumd1qJw5qAtyxb?=
 =?us-ascii?Q?DW8vZacK9cjDJ+h7CvQxUQCXtaBcNrB+VlgGDNB8yNhrIx+2qXGGdsuExrKu?=
 =?us-ascii?Q?pLt8HLmJLTy6WpqodmljdFAD7jJxjF/m4KDrKl9+TYHLzIllHaqMWV33TTXf?=
 =?us-ascii?Q?/gNPwj9TnAOtu9lB4Mwo05xV4nCj/4HEIRyctoNiTYj6zWQoMbOVX5UGYOjZ?=
 =?us-ascii?Q?erXB1RwkcoMLQGWVAQNzbqptthkYtmExVBiX5smJWiZQdDbNFaa46Zne+RCp?=
 =?us-ascii?Q?2j5p0p8Kf8uTt9XWb7m/RMF9P12Pb0cjN5+WN7FQFrS8cXjqhq4JUTuSOm4h?=
 =?us-ascii?Q?O7O1bBTv8PCiKH6acpgPk+/KVTZMVopR0vjN0hp/oXIctfMkiJV+Lt3JYABo?=
 =?us-ascii?Q?9siRGGY3+5EI75QXzV2QR7IJaYakmXL3pERcqf9Y/U/tn0CmtBBTGia7Uc0k?=
 =?us-ascii?Q?IMDXEr4Que1vbzJ32KN9q0yr026G0xsNSrqPjZJSmxjVtcon3hNjpPFylDyP?=
 =?us-ascii?Q?5TuqEhxMhqcMsdSTWklXPyJML5mOj3TPnnEDQr31UT2Urb8G9RkXeYSj9N3Y?=
 =?us-ascii?Q?u/cOICA7KkyoGeiMiIaQD9tk3G5iOhSQWBrAN16f7IJxnda69ZUEYrKH0FCH?=
 =?us-ascii?Q?kztrQq7gDb5f/15RCIeY47R3gv7qeAZhmvzz7jECAu+MECQC5OqBPUTVPTzn?=
 =?us-ascii?Q?f9X4KZSaLdORK1xj+M5VRoHodJKtpi2GDtjorpnnIKZuPVP9whb1NbPvOy7L?=
 =?us-ascii?Q?Aj4tl+YYFX3olM4mRJFRQpchbTPpq44OZSogb2E6SV4TV8Ditu8bn//9tnYm?=
 =?us-ascii?Q?5g18TyPTbM+DTEdszpM7UJ0JUY65Wyadmb2rTBgDQOedHKbgi/tks7pv6W45?=
 =?us-ascii?Q?zC6vNnfIlA0rr+eLQZd+LNdlwg+HXJoaRTefRE9EDwfFnE6l4iYxgB9W1rX6?=
 =?us-ascii?Q?bya+0hLTR/zGoDgHhi468tb2UZCe1xqaO3zs+oqk+FToNkXwag8cQNx3Gy3M?=
 =?us-ascii?Q?lxSEbajNwsH5u7btoNIx5bwflGTPThCOgNQHDhKAVfNBhD3SvkodxaGCkA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9NqwR/SEQgkwTiY4udGAJHZ8wr5Qx9yodZVhZXZVd2DpgcNEb5fY4V0M0KVS?=
 =?us-ascii?Q?P6+9GXAbEOlhy/g441qfj0xtSwS8u+J5pbKum882NZaR3zKP395dXZDWpWeC?=
 =?us-ascii?Q?4UYmomkn/UKm7Q6YASjCRqCMzrkideCt7EU2PQU9nwT+QqBbU28/5LZ7rwFY?=
 =?us-ascii?Q?jMP9VqAx8XxXc9fkrNb/5h1uEwryoMFGI2mDLHmzRvle/W6ATG1/9jgLoF/i?=
 =?us-ascii?Q?7WQ/N0CdY4rgXooSBcC+d0P4jpS6kSS0G2g3/fPrTVMbLATKFa+CDU7w6gwy?=
 =?us-ascii?Q?Nbx2tA8ZhTRV+Hb3ai7RvgAnBUhLA39qwhHRHzBOpaykH1nfjXhNomadTPAp?=
 =?us-ascii?Q?ZjGclMYFOEed43zXbOGWoEqQuB7wj1uAEJtJbuWbohODaamK2zPm2gF+WflZ?=
 =?us-ascii?Q?ObaCwBJIvrjuR7ZJjwI3bJ/gJ8OWWJ+zGBxftNuSv1qulmOfcaKSvybYokvS?=
 =?us-ascii?Q?pFnL1a6m40CAvw9iiZzUudhlcrTLhBalbVb2gFIdEKqOM3xd0vl5OhCtWPty?=
 =?us-ascii?Q?4zXrf1WPlRQaEH3HyPH9nau+TKrpM6QimoT30mQu52PjdXQ4+JK2DvncQw0V?=
 =?us-ascii?Q?UC21r+TNPlnTfQrYuUNtgPo+e1oI6jB7JK6n4bdvJcxsBmeSXfuPhCqzzB2g?=
 =?us-ascii?Q?G5mzKfBc1I9AFYCp91Bx1nzBIaGkScSTZTsPGQNQR3cccfnh4StLG4mAMEYT?=
 =?us-ascii?Q?/e8Ev66Rndn8WhETPhqcjGYi/MwfMZlv2J0jT+Ai5At6ByJeV3gVx1TXyKfO?=
 =?us-ascii?Q?Gpvhs5G1uR0FkHysK4E8eP/IcF/S4xC3LA6Fa2VIdGUnwgqqXgZSfGSpTBS6?=
 =?us-ascii?Q?31XvoBZtd6JQr5gcFFYHpH4eAWzZQ7Up17GiW8polYvNl7+m9ucbeNwmkkRB?=
 =?us-ascii?Q?EJilXAYnztRXn8vqxagpZ3j+3L6/sF09zIykxFSBMn3ClnMsJGy2x7vlGAaW?=
 =?us-ascii?Q?h/4lfg9Ydm46oHewMuEXvzZYgbrLDQqAlSO0P83BgoOF4oIgdKbovW+6c2JF?=
 =?us-ascii?Q?awd/qdOZWocF6BOHcD5IqmTFeiYFlRBHOrsHS0qrdyQjP159IwqTB42aO5f4?=
 =?us-ascii?Q?CPeX+K+Lb0wOUdi45tYo7VTfJiPZ0LJWSeVoTfrqgFRxEhYzt+e+EBWPLM28?=
 =?us-ascii?Q?bUj/tlStyFAyWW0H0SbCpJHlgcqzj5LB+2BYyHSBwmBn3sHJSCG1o7qhK/r5?=
 =?us-ascii?Q?8Zxzz/FEpL72X7zndB52nOidN683CWEwYRNoX35TDMOlVN3wBJ/Vzlj8ZLhh?=
 =?us-ascii?Q?QviKO8fOIWGs0YyZvv3dDDKXKvoiAEHCZR9VMv9ne3C62hxWrUdWyjQtjBaQ?=
 =?us-ascii?Q?xIA+nmPtiopcAYOUIFQLJ9/6PloBC2d3jxFhU2SNv7lWjWvQ37H9vZL8mdeW?=
 =?us-ascii?Q?hF+UTCmWA9s5sJVRatfdwiYVNg7PQkSzPsInFz35R02InJF1R3ywCcfTsp42?=
 =?us-ascii?Q?/SWmWVvAWKoTTS4u5YNx6UlcH7elXYBv/c8vK/9pIkN/g4T6Wq1XIgo1bApI?=
 =?us-ascii?Q?DTntYqqE9MlC18pC6hogST+jpDOCe6HaIjI5k27qtkw5+JZzUjrtEQcAxnuo?=
 =?us-ascii?Q?x/o4SAp4s7WKRW62fqLfKTdZGwh3JSi++9zeBUEsf7KJmAfThc8lxM2wAeeG?=
 =?us-ascii?Q?BI3lScdHzZTP2FY36MRbcGQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 649761ff-fbeb-46a8-6221-08dda7d68f50
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:23:32.7158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LySLZWtF2mBr1yPQeQKitsuJllchBeVW8tjHcQrmHMYH52EZTzpTykFXbdFBreqZ60u2cW7wt59YgvMdrSbPxP+7fQtz0SzSGxAiKTo8GIV2dEF234CIJJQdPa5hhAi0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/uniphier/Kconfig | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/sound/soc/uniphier/Kconfig b/sound/soc/uniphier/Kconfig
index ddfa6424c656b..45140d49c6adf 100644
--- a/sound/soc/uniphier/Kconfig
+++ b/sound/soc/uniphier/Kconfig
@@ -1,18 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
-config SND_SOC_UNIPHIER
-	tristate "ASoC support for UniPhier"
+menu "ASoC support for UniPhier"
 	depends on (ARCH_UNIPHIER || COMPILE_TEST)
-	help
-	  Say Y or M if you want to add support for the Socionext
-	  UniPhier SoC audio interfaces. You will also need to select the
-	  audio interfaces to support below.
-	  If unsure select "N".
 
 config SND_SOC_UNIPHIER_AIO
 	tristate "UniPhier AIO DAI Driver"
 	select REGMAP_MMIO
 	select SND_SOC_COMPRESS
-	depends on SND_SOC_UNIPHIER
 	help
 	  This adds ASoC driver support for Socionext UniPhier
 	  'AIO' Audio Input/Output subsystem.
@@ -21,7 +14,6 @@ config SND_SOC_UNIPHIER_AIO
 
 config SND_SOC_UNIPHIER_LD11
 	tristate "UniPhier LD11/LD20 Device Driver"
-	depends on SND_SOC_UNIPHIER
 	select SND_SOC_UNIPHIER_AIO
 	help
 	  This adds ASoC driver for Socionext UniPhier LD11/LD20
@@ -31,7 +23,6 @@ config SND_SOC_UNIPHIER_LD11
 
 config SND_SOC_UNIPHIER_PXS2
 	tristate "UniPhier PXs2 Device Driver"
-	depends on SND_SOC_UNIPHIER
 	select SND_SOC_UNIPHIER_AIO
 	help
 	  This adds ASoC driver for Socionext UniPhier PXs2
@@ -41,10 +32,11 @@ config SND_SOC_UNIPHIER_PXS2
 
 config SND_SOC_UNIPHIER_EVEA_CODEC
 	tristate "UniPhier SoC internal audio codec"
-	depends on SND_SOC_UNIPHIER
 	select REGMAP_MMIO
 	help
 	  This adds Codec driver for Socionext UniPhier LD11/20 SoC
 	  internal DAC. This driver supports Line In / Out and HeadPhone.
 	  Select Y if you use such device.
 	  If unsure select "N".
+
+endmenu
-- 
2.43.0

