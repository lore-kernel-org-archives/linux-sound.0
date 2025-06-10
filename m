Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8296825DAF0
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529312; cv=fail; b=PFnUSr/RRKvvgCGXtLrr6rFIM06IwKTe2BhLAirGF9JZQDMjDgFh95fQcP+hC1lnMffh7Z1sGvxXOOQC+lIe1j3Ut58c/MHpw0Jg+vxBR+wLUcRVRbWF8LruIBoyzUBOFuHLQXBVYG2w7kj47LFghjXUb8X+xuuFRe50UnpSxCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529312; c=relaxed/simple;
	bh=4mncJY3FO9YJcsZX1lPzrpzFrbFS0x5jSDHY7iEKaoo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pcuu08myIhnQqZdmBH4yPYtBEKRfbGyLq+4YnmgBfxYA3Hjz1TsTzoU9OtNb871BofsUvHHUwPCF4XzhwM7tzROZtveD6yJpjLRJHXn6olwc7/GAdrdwHBFHqAUhf+V+B0hj7LiWquKdo1nv3biaAsSk43zqJxH58oxTHgJ/jgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YugTF+f5; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YugTF+f5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXa8a0uQNshUWtbI+VjXw3aO95zTDUAGZTu2bu9k4jr4aVXU3VRpHosfHm5z3cl8Rhy0IhtXK6XoI3Jp7t5JDfzOwVs0+0g6gcxcydpyp47hPUTJJ/Id0TyovQi3dn3vMu5twFS9m55hglHNm/LHXtK7gfEVelnGjy9IlE/FzwbMnPmTq69YCiJBEBinpwHDoYImLiASu94u3SDj4RjAQYgyCdHneLnU1aIzQw9jx5zCMFKJqD4Ropr6e0lNSU8uWgmlvnr55uZo5KniHVwt0/MxqWlvSoHIs8zLUT9EVKun1rEQhyppWnnzvLJHYVAbuATha6IV3S9bZbFI+oN85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkD8QTS3Hq8cPvCH01BC2OPIE9pg9algRSfU6c2xTgU=;
 b=X4Kr2Ss5xzDl7PppTYPE1dYhB5wXeEO301q5u4Dc/AN8+ytGU7y5AnvXnE4kdy04VcsuExmQD015qVt6paVDthb0FuG6NJDi7QCUbSb11h5vAgKv0qEAiPMYGt9ydGpgRrIZPEJ/aX5RMluCkrf1dnZgRHFEIBHiw+0tk05YtynTLEiucjEM67gkH87dgf61yOaGabLw9Wbd3BjPj7G3ADzIQnQ5A9bUk5Th0eOmeCtSYCWijY8uBkIrCvkmnsmLVz/AMHY58bfTW9yrKhvFMPFA9hSoNT47WtjPxpuHLj3n0A2gxpERrNirsIQ0pZxP06uxHbwTGXdOlhA7ABv22Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkD8QTS3Hq8cPvCH01BC2OPIE9pg9algRSfU6c2xTgU=;
 b=YugTF+f5qDdf8+Php7RrE34s+DxNuLTnFTm/GnJR2ssn0C5nZqs8wjK54Wjd8wR2QsyXiQMLWVm21Ehx3L1lfvvmop4q58J4725iFxV1BDXnWJY8hSKY6VhQhsZx+OQ0Krxrk0DAp4GCCUeB3WwMcM/EkDpYazb1RAz6/9m3Qkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15231.jpnprd01.prod.outlook.com
 (2603:1096:604:3b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 04:21:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:21:47 +0000
Message-ID: <87msag6xb9.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 17/37] ASoC: atmel: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:21:46 +0000
X-ClientProxiedBy: TYCP286CA0357.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15231:EE_
X-MS-Office365-Filtering-Correlation-Id: 91fa2c34-969e-4dc1-34c1-08dda7d65083
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0pskrecV2ui90iTricX0R1mAyJdVHyhagJDo/VEG2mr86i1mgtpwr71xbvsD?=
 =?us-ascii?Q?Kfqhujwm5cgdBepG9ZMHMak9zMdHfBxYUp9uulX51MBy2KOCsGe0VfwqkgnL?=
 =?us-ascii?Q?+0zB7u2f0lOtG1uzn4CWVmn8SMiRDAtaINw+irO5rs6Ucy6eTz74nqFlAGf/?=
 =?us-ascii?Q?rPCJBLuJcx0ctXZbsV9yLZuVxn3l5bGU5erAdYms9k0+K0Rc8blTtocfO9Kn?=
 =?us-ascii?Q?UC1GJsABw7yREd/C6Maopt1aihqAIb4xpg7Ws2WtSa5K4nukjTcQSsCxepRj?=
 =?us-ascii?Q?hbRlKKrUDHLXThhm9/Hs1dFjQeUClDZLLJZXpoWhVQ6fY0ivuny6gQmedtJj?=
 =?us-ascii?Q?wzFORckxo6Glkc7milxdvXEdKK0hRFsic2kLK5HeKg9E4pRSQGMb70BfrFZ7?=
 =?us-ascii?Q?CEh6EKswy7WacBB+0qIooEqCiQEpW4pXF1BtrR0s2T9cDFDMvSM47wCkaTtH?=
 =?us-ascii?Q?dv0IPUaDT80NMR3K2xJ+kzfyZOYqOFlNKLo+XaqgV2JcFCkF7m5FQjqhVyyW?=
 =?us-ascii?Q?grTsu0rNIodHY2fqu//miUfP09mzJ/VMUp8pqJu2gLucCWVIp9cJpqgvA1Et?=
 =?us-ascii?Q?qUambGtxwTgNY4JDd1nyTWgTtBJZxb/PUKJeaUdFrSW+/k6cqvv1e5x6L7Xo?=
 =?us-ascii?Q?a0yVgfhlYi6YvVgtjVtBbUf3lStyW0mzZL5XpBfBPkDiYN7H22lKoxRssRss?=
 =?us-ascii?Q?UUeGqk7N/FmDt3awQIKe2xSZuKG+0MOglojiZlALIGEb1l2Jby4GpQ8V+Twv?=
 =?us-ascii?Q?fbQEJOojCrJKWWV2Yf37eDDV4U6jYwTPGC5Mg9iEUR/dXNPi/imUKa/B+k53?=
 =?us-ascii?Q?2mhVhH6KToEGZILSs/zioLxzT3sN6V7gwAakB3S2fhcZupf+IIgnB3Q0d404?=
 =?us-ascii?Q?AxQy3caQpDiuL5lRlGk6HdxTX10fXUn7ybYc7huYzX8gw+FG8tOSxGXNj2SN?=
 =?us-ascii?Q?tIbRshU3ftpuHdaVNq0HNonT7d+uvfwvswwI/dgJI4B6aMgo701ralgRE6l2?=
 =?us-ascii?Q?g0piRIfjNrnHBG0s11MAW/kbvJ/1p6k1yVIgQghykrPB4p+qe98KIEXEp8nm?=
 =?us-ascii?Q?i7PfU8ehi+2vdQt6DIV7KiyVb/5HNl9xwQbWjLAv54iCfEHvMZaDzPWQZ6Ag?=
 =?us-ascii?Q?sQPt8IFoFXawc4Dy0Y7w8xm4uKoAYYSzfXMK7dELJC97XAsrjF5grx1Ulxlc?=
 =?us-ascii?Q?PkoM2vkygiNM7hYE5bRKLrAU38ONQXZe+fI7NjnXzfWMEjWm0w9URVsMwKfc?=
 =?us-ascii?Q?TcH3oL8h5pYZEU4oNWScqpk99RPxSNmHrQ7cMfy2bq9sp6Z3aX9EJ8RPuExa?=
 =?us-ascii?Q?8GSOWAVvIVpwnzwV8qN8E0nKbndghCPbJfEKDyJr9IgmQihoVQ9hdK3LEhZd?=
 =?us-ascii?Q?b7tZFZFM/6PamebYE934/mftQdShp+1sjN0ioCjO+ijbKaKmdw5rq3K7raNy?=
 =?us-ascii?Q?d/xPGT2S9Bj+d0iiXvMGuDFqz7R45aFgPDzfnQXT6E3lICkKvx+FcFBPfkOm?=
 =?us-ascii?Q?uG6xy5TiilbL7MfW2ny1KRSVONYgm1bnxs180DeERniY21PefEhjwqkTJg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F9PqddTEMHTmwhUifVPyLY9nhPVTsr6U/d4mpvEPjJWxtWLuxBgv5AB11Zwh?=
 =?us-ascii?Q?ccKJALLy5gFDdfys0pBTYjsjJktrJUTO1tRfaR3zAKrFWmyD1uKLr4Lns/C9?=
 =?us-ascii?Q?JvW2+xzc9KUuZlHW247VW8b9IRicjNQ2SQKvRLpymlnx+A4z5XbEnixVySfu?=
 =?us-ascii?Q?v7bIF3tSWLa+kUc/GkY0FJL76PdmyT+TgfAuJPUuY2+lAxKmDfV/CFqb+jKs?=
 =?us-ascii?Q?/6BQHkbyKS+aIEToNq4Jlx1H/oTfVvYr21c3NxdT0RUtHrSqQcVzjp2TXwCx?=
 =?us-ascii?Q?zEMqn6oRa2r9Ob76IZuFEQqqAAKb5+k+qPa7hSncWGbIkT8Ntk0BjLmKCgLq?=
 =?us-ascii?Q?j0KCmqKwr8Loo0LWylO0hjczomVNRhS4fRt+97yij024ulrFrSFzIdQe4e1b?=
 =?us-ascii?Q?eNRjRud/gjT1jpYi4S08ZK65YZGcUFycF52YK/c/PgvgADI9qi38LYHWH7DO?=
 =?us-ascii?Q?kxIZ95WnVjfSjqD4d6km/pOMtLXowTsx1cGCw1QgMMsAxNZgr53KodolgnpR?=
 =?us-ascii?Q?+vZotQ0dEtQv4ejjUiY05sob99MdGigpmXKDh/RDAROoisqXQlrpEruBR3Nw?=
 =?us-ascii?Q?oFpyt+d178DuLyygKFLuNF44kMW3UK79yFp5N+PGEXjNGNcMUaLKhPrq19Mo?=
 =?us-ascii?Q?GD5EDGoaNmtXV3o3zrgBrzJ6hM2kaxRXD0TPLYneyyE6yzY1ttDeV24PJurb?=
 =?us-ascii?Q?2gmV8Nx3bjrQoaznLZoS3mJ8xApDpHXrKNolv/YpXUksanwdUQ0rV+bo7oYn?=
 =?us-ascii?Q?HjlxKECNtPvFl45cOn+uClKKBa0VDoA9pENkesqrUo6bDvJP9kyLEDD8AEEG?=
 =?us-ascii?Q?9Brz0ln1n+QXvjAiDqDU7p0G/MCSbA97FkCbGRzRxs0n0wnV7lvVXy5Q88Qs?=
 =?us-ascii?Q?APaPXWEC8TDwNTuYwk6In/Zn82fp8PSabb4+Q1oTX/uPrDq78nhLZNxgpsYY?=
 =?us-ascii?Q?+s2H9bZrtfGoqVKNf1+HxXAIMacFnSnPlXMl3Zkws6idWEoaIJ9pwpv60iJu?=
 =?us-ascii?Q?RJPZqwp6MSUEXpHCT/FQYZjifI8Pj0RFk9pp+FAspeT1M9kDTxru2SIcW06c?=
 =?us-ascii?Q?dwYL0/3v+TPBfLG4p2mBs44sGYS1E0dlouKJoYqKWg+S9TvMwYCs/laG9S1W?=
 =?us-ascii?Q?UTQXsdaIIv3FBEXabNbD6AzoU89kTLFEKsQrpnD64QniZursT+/vmMnA1c85?=
 =?us-ascii?Q?klxhIu4uif94zURWkQZZ2h3Qe1KKTzHijFmAw8pf2btjq9O/e4zMYRNB6kT+?=
 =?us-ascii?Q?1OiEiTzo0MxsKbzZncLGARXFreISKFeoW1m/ItjAM4SAMg16JOU81D2O8TNc?=
 =?us-ascii?Q?CDLb929OUNzJr2go4IedLmbOoQYbAv5dICGhsj9BvS+rdAnqkFEN7Hqps3CM?=
 =?us-ascii?Q?FoS4u2o5CUMA8epXWot1me67nivlzJMjZgpxWvw4Ghm/d2XCcp2zXK+vUl8P?=
 =?us-ascii?Q?tGW7wmN8eqAZmk0OCiuFF1FvQhBtOzHHRxUuyRZ2gq3uTF5T5UrhxPGcXhUv?=
 =?us-ascii?Q?kk/Vm9hhytpqmTMAUB5OeHH2oTVNuEMs4IjIYU7SV+awmbbmu3A9wsqvdo8n?=
 =?us-ascii?Q?3m24NwWD5yjy5JyXwmGLcs4luoCtl83sEkjnUzl0wlId81sB0VsBLA73b9u/?=
 =?us-ascii?Q?gMMwXnqVhxvrKmBRz1t4820=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fa2c34-969e-4dc1-34c1-08dda7d65083
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:21:47.3359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5BxLS5fN+RZ0Rhmi5sV0aR+9+QzzBSYJBWYlXWq+IHZCoe8S7MAsrjv9x3JIxaEQ40/XxZ3rRBanne5RkgNK/HZshsXHeNNCzTwJ81wL3Odc5zg0N6/nVhMwd+jTV7q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15231

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/Kconfig | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index 5d59e00be8238..e1a68c9cca70a 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -1,13 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SND_ATMEL_SOC
-	tristate "SoC Audio for the Atmel System-on-Chip"
+menu "ASoC support for Atmel"
 	depends on HAS_IOMEM
-	help
-	  Say Y or M if you want to add support for codecs attached to
-	  the ATMEL SSC interface. You will also need
-	  to select the audio interfaces to support below.
-
-if SND_ATMEL_SOC
 
 config SND_ATMEL_SOC_PDC
 	bool
@@ -176,4 +169,4 @@ config SND_MCHP_SOC_PDMC
 	  2 data lines. The signal path includes an audio grade programmable
 	  decimation filter and outputs 24-bit audio words.
 
-endif
+endmenu
-- 
2.43.0

