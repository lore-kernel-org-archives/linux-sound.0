Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2C125D91B
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529230; cv=fail; b=MaqHtxf6UgUKT9ZiCW+n2fbFPhL2OiHS+4J1uj2oJWUaZvT0vj1pYfMPT9tQWaTkx8uD/EKKFeaw3VG0z6RE877EB6ADNcLKiLxEEHU2kbYm1uux9L2OuIoN8jMVlVchMRrgncO5YXjQ6DEkOkWoL1BuMW+DZCG6alqn2wkEy78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529230; c=relaxed/simple;
	bh=lYicqefjODIdPSon/hW7qUDDKufUCiDuT5rz/bpwOAc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EnIpHbkthDBg4QDRCiO0cOLORzHvTF29uVCd1Qm6g/BZScKrWOmbUNEG725CUKH7Tb4v+aJKoe7kav2FN7fkXxlPjcolugp0goSThVYwcTyvYm8evRroCE3nwqd4yPNxvp/RTK6Y49AF8QF4xuSI8cb52PcJGMsCIEwpynHvpfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=J69XlxZL; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="J69XlxZL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAuECLTHjLgMaw7bjuA4vTkX/Cx+s7ebs7r0WEbPsl5hS5Tr3mhmg8LOCYJhIFnHU9+HOKwfEyoMZ/cZmjzXgRDZDKJzTSuMjQRlPecTQuRWihJc7afL2F3ZgPNVINj152UCFTQNO9Dxs1h9iL8qVKtyKcSko1efWFQEdPLclPwqPMqSjyzNxZsw25Oj9k9LoSZp62nMvO09QA+tDi3kIRjF93wImotXeOXZd7ePiKX+BbCcPSGc7+7OHWUtJSBGzXhN1qi6skXmd/NkYk+7R+KYwwN+dbvm4GC1Cg9r9hkdHYilVro0qPjYUmUi2IE8t1YxibrkBcoueZ0yUFsKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t52rpenAGc/trRKsFYE++MBkb0vEEzoZTf8Jw90nceY=;
 b=WK2CrCs/AbkbAPqDYQpkYSeshmZxo6wOJB+DKzYmqnUn3d/WX/vJrfWCVque+P1bJH4DiaIob0iEZirWa5Oa1wbGnvdEQ9PTaHN7UhtweTPhiudiumLJv9Ue+gMPCs6XENxZRfmDuSdOK1H6BMxUpDhglQTvh3B+Z81znqrlEwukw7DGbsQWji+QZA+dotneTN/cUBKR4/8HcLDaVQ/LNQ7rFMp7AUhZnYep3Z0IsqssapX/FEzIciKjrsZ3ZexSLYalTo4W+AKVb+NAnem8rtTcVD2CDSLhcbgbq466xSD7vTKvQgVwquaNw60JVxG5BUp+5RGasOaBtfQllzP37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t52rpenAGc/trRKsFYE++MBkb0vEEzoZTf8Jw90nceY=;
 b=J69XlxZL8KW//l/oBFwA4vyQwMvtPIzkogBHb5bSOm4jtWvgsfVNliMwmpc058quaGZEaFRp4LO5vi69s781m5/J8QPvGEdQJWFLZV9MgRDInVUEn8Tuqa2u2TrZaFzx7XNgA0PwYxQ9jBPiJgb8DPe8dwQ9GUnXuxdGvxvfNIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10510.jpnprd01.prod.outlook.com
 (2603:1096:400:307::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:20:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:20:25 +0000
Message-ID: <87zfeg6xdj.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 08/37] ASoC: mxs: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:20:25 +0000
X-ClientProxiedBy: TY4PR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10510:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c9f007-fe9f-4877-68b8-08dda7d61fd7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nW1wxfLwlpmeGCLS9Kejj28GxvlZtpOZ9E9JXbLK8v5IzpaGeMYSuJO8FUTA?=
 =?us-ascii?Q?CXSBKzzy6Avz4+V/j9w1PSHNZ5wMR09XAG7JqU7ePpjeHDMeQ2jet8OpJY3H?=
 =?us-ascii?Q?EEyCxBx27AvU6W1COn/WmeP7uGcHSYFrFifnagk6u3EaJ3h7YQ8cXxRjqn72?=
 =?us-ascii?Q?XOHGsHuR2H/2DXFrD9SyGsqDlDOu8pEitvVE8T7w12P6qPzFQq8UVwIO/pMC?=
 =?us-ascii?Q?XVHSp3E44O+LaqFEko5AoFZ2Wi1FWvU0h8E5b34Pg6cWuih7Gi6ri0YxDINo?=
 =?us-ascii?Q?lOwAoV5QvmqVXZFJ0zjlvDYTP3aImH/SHADyhZl/cVjSeUCFGL0hcMGZqL3h?=
 =?us-ascii?Q?yI+u0Y0IEPdJu8r0aRX+jnYd8yovWrWWVQiomkHgQOiuUwxhaQhGiQXPwlb1?=
 =?us-ascii?Q?shzAvErewxI1K+K/4YzFX3NeH58qTSwKbn11SvB56ZfG3P1xc6cXIPX2/S0K?=
 =?us-ascii?Q?OuWvdsQW4UMySseeLvOCd59UTN778BrMeuQNFhJ6faTdOTfOZat57sdSARkn?=
 =?us-ascii?Q?YbCeOdtcupWiVq1kygCC+kyKdZBU+rw99BoG8nr3QWwhfybfd6BvpsnntZye?=
 =?us-ascii?Q?J2XiWGqWvey38MPrHZmSARKU4Yo99vA6CltXOOBnLNURErrkzaJw6FdrcJO2?=
 =?us-ascii?Q?BYxxxa6xdH2YTOl5WExfkAbBjXxfCmuOt5t6MUvTu/GhBigY9GloNxCuAJFX?=
 =?us-ascii?Q?luf7D07AS0DLRnNee1YMgpcHQga4bI1wpzxEvfzzrnXgFz4L17Cdiddm4Vq0?=
 =?us-ascii?Q?E7e2ynoN952flN/xtKMzmpS9MMxIEPj/sUzHtS77LTFPKviBu7xpfaJJDrSZ?=
 =?us-ascii?Q?pJUQJ4AdgcEq+4+v+xHPuafjR7YjSj/qr3TYpTYNB0GxjLhzPFy+BVsz55pX?=
 =?us-ascii?Q?LSTkHmYm6PJh6QCr/7UdI0h/XG+2RxWmA5cVxf8JHQ0nL6mSnFB0FVKPHMqO?=
 =?us-ascii?Q?GBdER01Ox9g/J/s2azXwr4iL1uAhsPUG6OSRY+KHq1tuANc5IsbhTIH+E4u8?=
 =?us-ascii?Q?qCkn5Ay3Zp+U16L0KSmjCI1AaVhb0wZukRy//ZUUOnMCKWc0KLaMWKDPgzvq?=
 =?us-ascii?Q?49NWkRgmXEuQCQ5tdFLHObFDx+//VJBj/z9HYT8W+NOD43RhMK//7itiVeq3?=
 =?us-ascii?Q?sBxbimAxTmQubyb+++e/MNjN5eYVZZo4T1H3e1xk6uwXMy9a/rO1Okeb23Os?=
 =?us-ascii?Q?tO3uBM/PVDW9MKShwWdP/isZB1ca3JoSNuogB1HCzyEMBYK24QovkczdhUwS?=
 =?us-ascii?Q?zJu3LYx7SOd4Njah4ob1/998vtqFdBheU7eZdvBnDpJ6k+f7C6SNTgTBDulj?=
 =?us-ascii?Q?AnzmRBwJmUtnGcUGu83E6A5/pCt3d/Obs+y5A3l66H5eDpT3dfCtqA8SkRHL?=
 =?us-ascii?Q?oUWmyg/OH5gv+RRmJ2JuKoWgu0BUumM3hT7Lu2jIf9dbzrXlAD8Fe91UaRwn?=
 =?us-ascii?Q?jCh8lOIU1f5EBCgUBv5T7Xl+MVJWiWoyOzlpUpJYeblN8PIWIbQf4nLMjaD8?=
 =?us-ascii?Q?1PRItlwjNohzkUroOmj4cSW447kDZRDrCDmjPJM0sm2shrIqc4POfphAPg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NyJYlD5SA+KJarJ1gqSjEWTaL2XirN3Z7YTv56i5lV8Q3ezmotywklcQxsuU?=
 =?us-ascii?Q?LRboPmVsIzkGJ7YmkXFWc5pcf9ejMeAh88ydN9haVBOEIo4OfZ8DmnrgTubn?=
 =?us-ascii?Q?zlB7/jtChIzspFOPL87fbNBV7vU5UTXLsl9iKHSkNEL1/hR/x3g/P7q8zvQV?=
 =?us-ascii?Q?PoWziUYavd33JNLnel4O1jbUtBRDM3bkkKfnI28ajfLRyMoEjVpL78sHjUqK?=
 =?us-ascii?Q?nRuhWkj99efJwKhojNlCLGweoNEW9RxeX81SAsyFq2TgUrPhf8L0pHXIdmbs?=
 =?us-ascii?Q?HUgujIRNCe/Sp1vksJFwJ/UUuOtqmXr5HnBAzOqed/t2HCu6Xm4LaKbXlz7W?=
 =?us-ascii?Q?/jtWuNNoRNirJnzmQdwdFYNsgIygjf6mZvZI0ysG2WP+2RspGvorfHj2KkHZ?=
 =?us-ascii?Q?UlOIxzhE7Vw/tRj/IjQU5YXf4F995Bcs87LO5taqeJYtDglr63xLOKGuGTA9?=
 =?us-ascii?Q?Ml9DePlG2jnIwLeFe0Oxx4VpgKJtAvv0PzCOgb1PSxdtBi5zg+g2TWvLvMrZ?=
 =?us-ascii?Q?rIhzns2Nl9mGSc4KuzimlS9lqLtmTIw0fTW7+KJwGGLd5oFETAYC4J7vKsvX?=
 =?us-ascii?Q?Iq3xKuqJIADVVueBCpfo7pb7e+InY4T+mH/9Qp356T6jcJfss5blSKSqZjY7?=
 =?us-ascii?Q?SMDvoOJt9douulqMYB2xDU4k2ZETwQWVIf56qYpeLw7fvWk4neXr8zVWkEDr?=
 =?us-ascii?Q?j8CrNyz97EusRYoBv/uVy1WU7MN2TuWCfBxQ0mGTiza9sieFtpHjArY8RKiW?=
 =?us-ascii?Q?q//qdcZ5oCX7yakD8kS/pd0Cyrx2fTg6hE906ju+gDHJTdgz85BaNrylQ3SD?=
 =?us-ascii?Q?/YP12RqMBlPP1FVKXF3kHY+9gMuhTFWmAkZKhqaIDWgU2Szsx5INIYfWBaF4?=
 =?us-ascii?Q?w6z75vJKFojqbBwfCF+S7jEgppqQMY9nShnvro9G/RWO2UaLBF6PDvnczEEP?=
 =?us-ascii?Q?Ho3jiVtbvpb6qkxZuXNHjdhyo+YT8Pm7HXIkeYttzinGGROkRDrzEBFdDeBD?=
 =?us-ascii?Q?SKKt3/FbzZO5iBtIGtxSaEpWELTUeKr8LMftquwHRmQOrgmI5+OE7ZSnpxjq?=
 =?us-ascii?Q?XZV7+2G4340PjiFcp22eg/0zzzisolGwAcDBLi2I1KDIDwEU+xKeYuIirh8W?=
 =?us-ascii?Q?XaWfIVKGWc1mPZmUIjnuo438j5G76yfTGV02qNFfNvjCkwSR27X0WRlrQiSH?=
 =?us-ascii?Q?Jk7cMc3Z+NVps/W2WpzxXp8ObRm2jcuSEEkYlOZTpbOeciUwekwgX8v+6gMn?=
 =?us-ascii?Q?OZHy7FAmTzTiALhadaUWPvfzI3nmGM4zaljdAgGmh7HhYNm8NzhZKRTbQV68?=
 =?us-ascii?Q?tAUrVzFRSRXKhW8aUcLBxbjlVwnrWwLbJvdBKgD3aGLVI+Hvyscl8sDLh+UU?=
 =?us-ascii?Q?zXrgejlSzUroTT1rEC2bHOdt3dEV+mDgXGsqPigXq5FmBtptjHrJR2Yi8zB7?=
 =?us-ascii?Q?6Z/6Wjcb6Vx1Hw6N5rYkWnUdyTqNhDWynyv3Fg0gpDuEiTQCnTjW0AK8bdmn?=
 =?us-ascii?Q?xXMROjyMC62vjufFyu91St3h4p7U0kYBR0Xrl+BJFnRtBA71VZcqq5kTk8sk?=
 =?us-ascii?Q?eb6TvpSVJBCdNwQgtegEYp4XpwejwvCWsJMYyPHqcxM2ibjlme+VuVguuMmQ?=
 =?us-ascii?Q?M+sqRcmTkFAh85H+XrQeqEA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c9f007-fe9f-4877-68b8-08dda7d61fd7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:20:25.6937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TX5kYcx/y93GoO9km8tjfglKbIdgjAs8sddXNQImuzs/dyKX+X4+fqjKDU6s1JztfW7+ApzDXtz6YyA54p/MRRaESWgOtv4/x1Bm7szNYWXBujAcc4WlxeZB00tZfWm0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10510

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mxs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mxs/Kconfig b/sound/soc/mxs/Kconfig
index 402ef1ee7a325..608ef6583a2a0 100644
--- a/sound/soc/mxs/Kconfig
+++ b/sound/soc/mxs/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig SND_MXS_SOC
-	tristate "SoC Audio for Freescale MXS CPUs"
+	tristate "ASoC support for Freescale MXS"
 	depends on ARCH_MXS || COMPILE_TEST
 	depends on COMMON_CLK
 	select SND_SOC_GENERIC_DMAENGINE_PCM
-- 
2.43.0

