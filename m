Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538EC25DAE3
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529305; cv=fail; b=b7riFHHvVRr+bj+DNv1DtjTjTzFB2hiyxg26j6NufbwMQat+cGETOSN+6NNAknfaxJZFexTT/+Zx9XLUCDuSTvyTFMOCfVd7PVZBFV3zPw0+OsvEut/4w95cqKwXjonLCxHYL7AAuAqOWoQaBibkClUrBUy8HtOu0UyrED1knl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529305; c=relaxed/simple;
	bh=C4UvivXQYVqbSXnA1Clm6e+M2ZSxvaJKsHMhYSA/N9s=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QdenjpPi8nUverIbPwupwhiXym5GTKh1aocMqZhWRNosp+yfdozz3qz3k6Lp6b85FBX/6dkz9IUC1ZpSDDn/70DQHpwTQVKXheLEqkJBcKjXo5xjn1Y4CSleMUeP0CgIk34L3ZsgStyK77aGLvKZmoYamPS3/1dwFJ/i+8IspCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U9TA7StC; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U9TA7StC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjjnsNp7f/3P2bwx3RAi66J9as2cBqr15u4BD9o+LkW7GFX4Cko37scjFMKDRHSl2DnjlvJoV7phm1VvF/on81OCGwCsPRae7UGh4OzdQOt/QNjaJlQHunrkomtSdDrV1Oxhgy1LUd24Ho3zuH1BlxuJ0Rww6ZPMEJeU7EI5nWAZSJyWHC7xGejdwPkIlmTe4UlJrf7ujJwaXFHZ+usR8kxXYhzxqK1wnb5HMKQg7TyWBY80mIhPN71JGdCKCnxeBPgze5K7+FmOw/1CnIaQ4uX4Cr6/lVL2jOJC3WHofqDTz9W/BFcqvTWuM05/IXY15SDZ8TMyqa7Zi0ixIzEXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZv41BNSmyJwyVXhsHZhBL2TdxCikSmTsVTiP2y/ec8=;
 b=k4PeY00NESenzko7RHja0N+/9Py+1Y4gAUeqX9fxKEhaGksjrd/J9pW2FtVtMzqwDP6iUz7BDe7EBFfiFLtnYa3CNmcwZO0xhqWEJYozl8v0WX7T1LkgMnIrfxGspI5OyTrBTDj8G+yRwqn5CC7HpTzxiNyFemG/aMmS2gGaaLjTCgheIByKZ/EFzabQ3q8BcNYNP80irPhadHX/eayj6855Ou6DZtuah2VtGYtnveaceViiUTYbsKkwFUtZDbbAEsIasGA801TFJLmCAQ82Wy+/Q/5V/3WFhxrVMx7C3A3V+IYpvZY4TrzmS1K/CQdn9hloSARzLfiYpPlMAxqHvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZv41BNSmyJwyVXhsHZhBL2TdxCikSmTsVTiP2y/ec8=;
 b=U9TA7StCoOYDhiAvApeefwfprI1e3XqF3fFZo6PoC38wFEpR81PJjj8t2pi+Qr6oPxVsOlWMPC1QkwzN+MijTisACPsjXYQvO5ui2EckSGH5oNM6X/w3chDVJrGvr+zGzE7fBLbVu9yKQrXJwC6A0ypYsfnL08wr3glLKSBFQBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15231.jpnprd01.prod.outlook.com
 (2603:1096:604:3b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 04:21:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:21:41 +0000
Message-ID: <87o6uw6xbf.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 16/37] ASoC: apple: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:21:40 +0000
X-ClientProxiedBy: TYCPR01CA0180.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15231:EE_
X-MS-Office365-Filtering-Correlation-Id: a5eeb53d-b65e-4c30-56dd-08dda7d64cdf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zKLaPGD4M7eeXwct7Xx6PZ5D22MPlGE3g1yOkVdhiWKcPlBliiswZqQTbvD4?=
 =?us-ascii?Q?FPTokVmdJlYACNdiZ6mLWQElNt+7ArXz15kXTRmHPk645WCcQXqd/wquFRzE?=
 =?us-ascii?Q?OOzarIJLtkjZuHHwosnGi6bzx41eYmxgaV4c2eDU7WPyctl32UdLA9+f/4J8?=
 =?us-ascii?Q?bdYxFDitK12soU6rclsACuknmWkMOunOtWHMijWXrAj9YFrNFWAJpV40qPXt?=
 =?us-ascii?Q?47XKAJ23xlQA3CoQ7MXWrOLQUvl28aJCTp3J7escjzSD5D1E1lXl11WsjIQa?=
 =?us-ascii?Q?ZXh6s2zKKy7M/TpxiVhiCXej/6c+ky3dYmo0XMii9kPfQPIzxbD0Z0dkpnkn?=
 =?us-ascii?Q?mLzq8XGizb8YsH6GbnkEanO4cTvS6ru9Co+ni9XxcKM47LcRqxGVe+zecqw0?=
 =?us-ascii?Q?J800fvQiLYqYK9K+TvaKPMAAlL4/35pRf4gWYwkqF+v39ebkeyQDhL/B2Swc?=
 =?us-ascii?Q?um/xbsrkEOhDRyhl3uZVyyEk3h7JHtDRwsP0ELf/+zWKHYznt1habLyjDdOI?=
 =?us-ascii?Q?FNV8WC5X+rGkC8ZFz6u4+iZQUOfIgg2yupwGz5yVljkI8Hkj8cAFh8OJsJB1?=
 =?us-ascii?Q?BbpizH+XQJq/wLiQ8VVlKmSME6r4qxNv3vjTBOnJ+R6dJFbpEJ6HTW3DPQaJ?=
 =?us-ascii?Q?pCmf58ty12lie71wUBmZ73sVNKkVgfq21xzM8yDZnEAnkFmQLXvXdVzKnDRC?=
 =?us-ascii?Q?TlSjylsdBL7u/fXrGMDhBhD7fkHSwUTRWPrkpVebtritebQpr44mfEhmzjTg?=
 =?us-ascii?Q?86+5IaAg44nCy6kgJR78NsEH3KO5fcxwPUuMjoBKN1kMwihihh5lsQQezQyq?=
 =?us-ascii?Q?aYmMGGnLuMGzLxLnLNOSGmql8z2u81enSCZks1Ta9EYUoGYqaKLx6OmluJHw?=
 =?us-ascii?Q?5WEPhDQw6e+MT+6g3UpEErdqichii+kQuDihdM0y4+7iUdsCIRvaJsaV3bHx?=
 =?us-ascii?Q?z3bm8HcvK3VfPeL7ED82qBl8I0zuXLzly31zn8PdfuG19ybRnhKUSgf9aa3G?=
 =?us-ascii?Q?k5eg61EO8Nychi9LF958ucCnbgKhz7A5utyB0kN3uGSscNUn/opwAwIxxXU3?=
 =?us-ascii?Q?vmnZ0qxHLzS2sgHj0GCbMBINNOQVBN3xWZJzOltFgKK+3MzRog2n2B75EHhM?=
 =?us-ascii?Q?WC+k1kd0lWWvu9Yrta23SJEo40DeNEyDIAsVDmHpOmhn3TEalpJ4zrLSdPEP?=
 =?us-ascii?Q?8APEMUAeeHfg94ejyZEqXzSub7QMqThnnNUlWz6L40RMaDJ/CMzsEdajAm6G?=
 =?us-ascii?Q?KFqp//WIs2VZDHstMDEG9BljsHB4uypZlKEfYU+ILQsrJD9LQWL7d6rq4HLI?=
 =?us-ascii?Q?ROt6fUiP7USaEDPhZU29Jd7meUER3s/e7MtgZb+70bpbDeZxHfyOU1gqG0kT?=
 =?us-ascii?Q?cRct39fIIdj1SMmQNXIeTVDCISf8XX2qvC5ej1tT3kysJvPCWuBzpKUiybUF?=
 =?us-ascii?Q?X56oB9GC8efshu8m5LlGB/xyhEI+25ZiUF9sEuKMbTMy4tN7y3+Nvs+j7nS1?=
 =?us-ascii?Q?ODBxz9ix6FgcHb3rtb4b8W4S+k1RlwSl4QHpFuyS9mhXQKZHXxFoGTf1HQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u3nnLSsZtsqvzmkQwZm+iBnGWg0w2jLyldwGPbFTeG1Rh/HIXYYWE2+VLE+i?=
 =?us-ascii?Q?VGzuRD+nlNtssyE0epOE8x314e78pmSZyeDpzWMyFOr9Ni3F86X35KdRslVd?=
 =?us-ascii?Q?a6gBJ30n6pKeG9psMQuMv/i7IyzlhvuxVnbFPxBIIX6mpW4g5LHOI2o8THA5?=
 =?us-ascii?Q?Vaidm/jztDhQ6wfGSg34phFc5bf7x41rsCg/5FuTuRS+fzaFVS0NQE+4jy6W?=
 =?us-ascii?Q?3yUDoKh34IiaRwc9T9rdfMjjVVgAB7KI2MwESeeyKPqFhAGvJaJDWp80oFqI?=
 =?us-ascii?Q?eLFrBwZhYIMXBvXWE8fQie/XgvBONDIf3cgdXY2UQpbLD8kJxIhi5aYzlCEd?=
 =?us-ascii?Q?mTID9G9WnwQJUX0WQupAZgnePeuCgUXf+ta2cNW2P3JpTo70vHq9sEmJEUV+?=
 =?us-ascii?Q?6vAURvE7ep39/XKbQqi2rj39sP8zA3RWVmDzKTC4lDoJiIzApvIMPI3Y85Bu?=
 =?us-ascii?Q?mYSwVPLzsoH95uBp1Vzf6SLi41QEuCyil7Uqb0AE3rOJ0eNNH+4QoVukHIn7?=
 =?us-ascii?Q?mQGeW2NnpsQ4PoYoNYL/oswCFnDMAlXTk0JVMrx6vo/z1Xo8xJOi9KFG9nk2?=
 =?us-ascii?Q?YQff2v2k9H13HEYMivtvLpfYyGnYkmmdpY+r/QYSKpPYu/vaXfLYS+BAn3Xa?=
 =?us-ascii?Q?u0KKf6Ra3uWowBBKXEv4iCinlrsj2IU0HVelqezaVw8Av0c57n3p5Y2R11N7?=
 =?us-ascii?Q?06EsrbcioMjdkXzTKF/y4ZJHfn3U+FU8Wlhb8zPjP7FUmrs8fXYoEZBIbve7?=
 =?us-ascii?Q?QPtkuLYHHLZ+IQirYjfOYoom10EqIwtDSPyTk7SiMfwk9nu6YP2N/JT42o5Z?=
 =?us-ascii?Q?OK9N2FZH2rPlF8GoFqeQ9zuTfN1UXTWi2WcNz0FFJA1raV/kuKW4fvRn23Dy?=
 =?us-ascii?Q?LvHFshTSJx5Jw5pO//NTxdRCxJrhZUNTS5fuwlHttStvTPyS6sd9Lv8l6Qq+?=
 =?us-ascii?Q?c0oeYeBMO4eXHqrZ8IjwJSXHeM10Rd7i1T0gRFIQmsQM98p8dCn0SsjY2mZF?=
 =?us-ascii?Q?FjsgaV10JZt8ZUtnzuXV58c5p/oXSJJEdWnnqSV0keekdA1HXjQDJMBptnhB?=
 =?us-ascii?Q?NLFq8mDDer57YaMWFr5kyHUpggwm//AcW7leLtjzCTmG82XJo4CDnFpJt03f?=
 =?us-ascii?Q?6xG69wRbbWHtuL6lew7cb/I0a5DWJfL3egX6Jz+uOHuII39/CyCYsKKwty3d?=
 =?us-ascii?Q?wceB9fVkYBymxyFjxTHvIz7PnJ/iCxjp5TJHV9sJbUz/Yx2NLaRHcxLmf5bY?=
 =?us-ascii?Q?YLXTzZW786Tpn+6beTi44w9dnLAQPspKXyRM6PuLk0egIF8nsrTlZEHSt7Zd?=
 =?us-ascii?Q?yCg9LvDM7BED6j4zm1bpxFX9/igtoKM6YLnYYpDoW9OU+jPRnuTsNdghdgQ+?=
 =?us-ascii?Q?ecqjE3shpfAiNyxuM+Yiy5VlRP2phZuFW6w7hDOz3xhGadqB7NIdgkZTqLwF?=
 =?us-ascii?Q?SuAxWpDHCJnoJCctFii+Ge+RRv8QyUZqulCAtBsCFgm/DVGxo7NkPszth2rM?=
 =?us-ascii?Q?cBn+eIzN1lka8fQHXRp9mL1+CM055TwMTNq0/w3UI+S0yhZ6J1BaVXSGCqGf?=
 =?us-ascii?Q?5flWzdQ9TmryqAU1wSnjyq2JCfvtO8OZ0rmHj3i0iUBmLuJwibjCX91c1WQg?=
 =?us-ascii?Q?Msd4n+T+Dbs8qnab/Zp0UfA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5eeb53d-b65e-4c30-56dd-08dda7d64cdf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:21:41.2604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ll0rFtbhzmOlPFb6slewcWrstEtIWG19Ms0l2jXabcXyW+/ZzCrFqBBVtoCujx8f8dIxOo8mxEefdbZdiKsCQDOz1xQs1lvOotZON+5ZSEw2UVMyuYqUsPb6f1HW1i3k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15231

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
index 793f7782e0d72..1785c0f741ae5 100644
--- a/sound/soc/apple/Kconfig
+++ b/sound/soc/apple/Kconfig
@@ -1,3 +1,5 @@
+menu "ASoC support for Apple"
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

