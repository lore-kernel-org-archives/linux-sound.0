Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011036.outbound.protection.outlook.com [40.107.74.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A2E86323
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 00:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749516248; cv=fail; b=Zke/zDYzirfJnEnoSnesDgj/6RP5hQO/7nauesN2kGqlDq+KLsz66O2xcsKSwtRDPj9F3VaLZhhupSzkqWD6srDTgHINPcRxLA/fczjATj04rRUb8UCT4PGaG2Q1ZTddMUOupWP9PIEHEkZm/m3JO5Bhk7M0Pm10Lkh68rdnBY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749516248; c=relaxed/simple;
	bh=yZtRqRgsVTkLBXcnryZ06bubGwtn6X5q3nQfplj+5Yg=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=s10iixMyAxA6d8IcCyWAl7hWDTQib11hSB0A9we9c3qfMvT/W4+2c0UIDLaJVym81Rm9HROk+qEkgo5BgBj/RzRR+YcsT2oRUgyA4mUIUqSDinqTswjt21ctGA2QteBKq5MqOdAE+aDw+tfXBmnFsC/0j83BawWcUfc0LxZ85mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X23hE7D3; arc=fail smtp.client-ip=40.107.74.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X23hE7D3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OphpXzRVpZJLkagzBWFza62P72vPngxL1/tMVFiFHXguzi8h7Hyahk8UAr10die7+j193986VUeORw1pmPGElD5RaAx2rBryfLIKV+w8rpdK/Xcp6lF1U5RVsCtxBBtKpeELJQhLFNOOfGfbg9MU/ASI1QmElLRTijFF+zqs6d9drbfZ/3Njmrwg4HD9EI2UKTPlLwyX1p0OlICX6/BO6REiWw34iKocsX2MXpFXHxjKvIVg5xrslYh2udpoErQO5YVkCnXZ1doKAlFF//4g4BDacSivL26Oqj6u5x/RJbcqTBBCQzDFBvthoe1cJOeUDIMQZ1DCXQQuefViU2vLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgIKIxu+iyjY9o71J2IiL16BickZykqNViQjBPo1WI8=;
 b=DRcdkZe9J2NcOfXdWbngOZVXNjoM03qDJDirpSokXUUwGTj+tb0xLiTJ4R0mVTzRMPO5vVgmJIIjM4wbko2npbLihnbwdrNXE9j51I1VHndn/+NIYCC19NPaD0THNK10n9lFDWDkOGi2BjbIjUmIjkVUkAecpXzIlxqYBZuKhnVtox6ck/OXW0O/StL8fGk377bBQFunxwCUwSeLIwOckazaItYKC82OEqAYZ62Sujq8uJ7agHk0zLVTTHMqqV8SSSCP/6NFkIYzKtPda/LOjrZFioSv5sv6rVr697LotHQSp1UL6/+cukxCCgPE9WQdns5NVYyoHo8W1JDOZpYbeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgIKIxu+iyjY9o71J2IiL16BickZykqNViQjBPo1WI8=;
 b=X23hE7D36fq/jpe5Urdg5Rf+HdMyVDMSnvA/MKqJJQgSQ/S/hk2Gah+/dmJ6Ixythia8W1/H1Q8+Jrn9/m6n2Vl/3HnB4F6ksC4aoZQEhyKYEivbjW31P8LxwaK6M8CByWRh5lQJ2SYWgvRF9PPj4iU2rcIqHsjmEMCQmoCqUQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11813.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.28; Tue, 10 Jun
 2025 00:44:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 00:43:59 +0000
Message-ID: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/37] ASoC: Standardize ASoC menu
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 =?ISO-8859-2?Q?=22Martin_Povi=B9er=22?= <povik+lin@cutebit.org>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion
 <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Paul Cercueil <paul@crapouillou.net>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko
 Stuebner <heiko@sntech.de>, Daniel Baluta <daniel.baluta@nxp.com>, Orson
 Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Michal Simek
 <michal.simek@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Yu-Chun Lin
 <eleanor15x@gmail.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Nikita
 Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, Vinod Koul
 <vkoul@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Elinor Montmasson
 <elinor.montmasson@savoirfairelinux.com>, Binbin Zhou
 <zhoubinbin@loongson.cn>, Keguang Zhang <keguang.zhang@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, =?ISO-8859-1?Q?=22N=EDcolas_F?=
 =?ISO-8859-1?Q?=2E_R=2E_A=2E_Prado=22?= <nfraprado@collabora.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Sameer Pujar <spujar@nvidia.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 00:43:58 +0000
X-ClientProxiedBy: TY4P301CA0004.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11813:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d3bd5a-0a20-4c74-0ed5-08dda7b7e37e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P9/gcHHL6kYmkgN5JU6SwAAk0W1udjZT0cW/e2twlm1Q7+HKATMGklCvrKxk?=
 =?us-ascii?Q?EM4Hwx0uIMc1dyuDX5g05ajAbZQkT2KhgVWiUpkypcZELSva68Pyijqr7xJu?=
 =?us-ascii?Q?ciWKyIqHSFjuudfFnJaIK3kw5KmdZI9JC4Dq8S0uEDg8QpTPwldO86q9J5hb?=
 =?us-ascii?Q?whMnorDPLJ59ObU1AOTIK2F0sWs67rS9L/HqTsN+UNxmsEFhFjZNXhwGugfS?=
 =?us-ascii?Q?op53L9F6uZg5KEzELxT1wbXnV4WAm0FMlaZt/Fl7a4YlY27sIEisy5wDJGs+?=
 =?us-ascii?Q?jggFTJvtrV0B95xwpxnMOyio+TFYpZoh/ATHVm5JnR4ld+R4Oioo1gQLTL9n?=
 =?us-ascii?Q?+2TZlu05KNNPNBxkWlMBzplxlO3whP7gm0Dd05fOt+hTFkZ7neGjMU/S5Ymg?=
 =?us-ascii?Q?tAV7AI3im9NgJD5goLBq11oQfp931109JZH51WyHzWg0NbSHrB+JmuyMJgzv?=
 =?us-ascii?Q?ndaqkikMlPm55sZSgrlhmUPVAg3itbB/E2ckrX5M7GLbJAmVyYzsN5cBUE5p?=
 =?us-ascii?Q?5msNfyA8hVeKC2i4L/BoFmt01j+iUeFhlj4bCY1yP6vLuCLm/Kog3Nu7jDRT?=
 =?us-ascii?Q?rJ7r8t1esDoUPyaSo9v6VpbhnUq2dfjUw7M2TsBQw1tjTdPELxACexKuh/cf?=
 =?us-ascii?Q?iOwJMdzcJhZoyjwx2HvUCj2QDYt7blbeTDhu/u7i0QIXP3xjGloBhjxavel6?=
 =?us-ascii?Q?YpfPHdnmcWFe3GKlPTWo8+xcAXT3wQkdIuUi25TXGUpIh2Txwcyo0bheySOt?=
 =?us-ascii?Q?YJaTryMQGyTenDHAWavYtVuSDfDonlIiCfRwfT2BsKWXXXe58fW1z9UHhQ0t?=
 =?us-ascii?Q?YSIQGJU1dqu7g8pa98tKbTthTN9QaSDLdGNiDRQlSgt9glstgyo8QM1AdQaf?=
 =?us-ascii?Q?rzwSSwvNJmm8jrwC+pwGqPvsvVnSHh6exbj85ZGu1XzIS/0E3PHUb2MXO2FY?=
 =?us-ascii?Q?o7KgRzHTv09JFP9Lf+DmX1SLcUDT49BfneHAvts+/dL0AnZBG8JK9navQn5x?=
 =?us-ascii?Q?SpIx0RTeEqz+PqtqCmkHaWmd3WQPNimkoLcozDCFaw81/zQwku0F7LUbcMu8?=
 =?us-ascii?Q?rfHcYW6PDe1DGKzx9zy59O0KnDYpx9RwiNrOuZq7f/OtlH/MUnN2/mVLH8XM?=
 =?us-ascii?Q?M2vC2kfEpBidp3UjoDmHZPqKQAWPapPuzVw+ddYgWB/ygRcv6ZeL1JcHm3f7?=
 =?us-ascii?Q?GY54/BLhsd6Z+IprAOR8/1Y01zD6NsqWLg7NqIv/ZtAK3m6/05/ZmavLXTD1?=
 =?us-ascii?Q?zfHBeZopTsf1AfgmDj9FYKzI6zUxMt2NNlDL/1e0iY+/tgmTmx6bEumwzmip?=
 =?us-ascii?Q?9c6v3d4z0PRTDKUIBuqAYRbsiO50ZLj5ilcAS58zTLUcr9o8/NfiPd4FZ/gw?=
 =?us-ascii?Q?q5fWtWgAbeXllig4o7J+J4DAVOtz02vhnUULMXQnnXeYpVJKAg6TwZOUMbDS?=
 =?us-ascii?Q?T/7CgcAtSFATCcm8Xbnsk2bNjKflwujwYeanLI46P3dQojTOqjFYWnA5ZIa9?=
 =?us-ascii?Q?cHomDxCvaIx5/CPpIf6P6sQfZHm04DAJ4ehwj+V+kZkoja7hV48WoiGkhA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zj8yiMoqt0/gatJy0poJ09XNDGagJa5NdLmPXPyM36d04Vwnbxvov0lpheWq?=
 =?us-ascii?Q?pZg4UT1f7vXXJbjsW4ETlRf0rb/Ay7nlXFbB1S3lRgo13mNLdxs31XOYE4Cy?=
 =?us-ascii?Q?fS0xaooEdsZSuKbjZ7MP4yungFvXIkd8oYXI3kfy8ZUXNtTpyWcIlKoWuXyy?=
 =?us-ascii?Q?A69dbtdssoSvmTbYKPwxhdAYwy3yLIu1VJpzVomu54+AF41xxOGM/Jg3SrvY?=
 =?us-ascii?Q?0i9JxDk76mU4VjlXz4j8dZVSv1gQ9KdWc4rYG2wkvFUHAZzSOA+riT3qBlf9?=
 =?us-ascii?Q?ML0b5b69o33HaxH4PAqvIKIoDjRMmwRibV4am1+JWQPQgzKTkO49v3SokxSK?=
 =?us-ascii?Q?LK9y9CW/PAyppMB8pdUnD1/fiNjDgeM16z5FNXZPn/XkXxDAxx4FPH4d+H9M?=
 =?us-ascii?Q?pU9JAgTE4Ljk2fEnslperhoOyOsZ2ASMlvHlskvDizeTZZYj/iFDB58obLWf?=
 =?us-ascii?Q?RXNf8QVr19FAXGjQxDbD3dcDsUdgn1EmSLcZw1DcTavWekjhdt5qNUCnYxX+?=
 =?us-ascii?Q?2tAARA4CXVQqhNQPJG8WQWKBgwW0TyXm08jFX9EtEcFfH63j58+0SjmSLY11?=
 =?us-ascii?Q?9BPB0R97ngIE7zTC32h/0Iheaok2H7tYDn4hWfubcY9mBcN8Oj8h1RDXQroj?=
 =?us-ascii?Q?i9AJhufzTlb8NPDMCDna6cXUjjTUOjwrXZNbrSXPfu8uMNENfEF+fpkDjFTf?=
 =?us-ascii?Q?4ijNO/bFxW+ep0sNIhvYpy0z5yE/Gi+35MM2vKZBO918TZJKQ660zgw7toKK?=
 =?us-ascii?Q?8e/80ry/Mqs4LosE9r5OOhi4JVA8NOqyhDPHVrcmmftUe8JW8jX2s7mb9t3H?=
 =?us-ascii?Q?PxcPSzKLT/EvjMTQGtnQD1QmOBM0DAV5lpxIymdQO65XmkqvjN9c9f7G0y9n?=
 =?us-ascii?Q?Qd9JQ4rRLqjJy7oIkr9OPgU3eLZZq0ys+ZjHgwlF4mNYOidJWVowSLN0ByQ0?=
 =?us-ascii?Q?QphGwBr9vSc7Fs9EHHrVcLiDkDbEmFgQeOa/x6BoE/IB/xw2e7s/vgapsoSp?=
 =?us-ascii?Q?QHqCtpUCkPydo6z3tgTU3WIJOeNBwOTmoRtutTtydxJT4chSwEJPwneihqnh?=
 =?us-ascii?Q?Ag83/H2658VBHcQ5/vBVakwz1MNeWkdwRld1NvyxM7eCMP35cMXyRgP2yQkT?=
 =?us-ascii?Q?CejVL901YOOyS8SZi7j8o1kTgTjTLwa76vHg963BAEXr13YXpa4v9WaIcMoo?=
 =?us-ascii?Q?20rEbR8K53Gm0RwSpq3otodL0vffPMJI0D4sugJ9JA2JTxfyGofEcbHn5DIP?=
 =?us-ascii?Q?+IXe3mKIF3WwQNNvFCByxDAMVEu88qHPCHUnv+lnmCpEZbDZyWapkNBLixhW?=
 =?us-ascii?Q?ZL/ygUDW7kYeDQ508T/58ymqcZ0VwIsh/itAmT7+Z1ZskzpsXXmMr88Vtzn7?=
 =?us-ascii?Q?X9/nU+35RMr1l5l9JfkxpBBhm5KcEop8DTrifGpYmUIGyaI1AIlo+oYHwipb?=
 =?us-ascii?Q?PRR5eAI5Vd+oOZifTZS7mLMFw6TwvwhNWhSU+EZGieuw2IhIfMPZ+11zrYwR?=
 =?us-ascii?Q?r/+dcKcYIQGI4UkzEJa7rDjNzCISzKQndZ88nCHF05pC7b8kc3GkX81L9imi?=
 =?us-ascii?Q?B7IqObulE5LoO5Lrt6N7Sq/gFTDuGCthI79pTjV+EC6CzqXWI2Ly1DkPhybM?=
 =?us-ascii?Q?xg=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d3bd5a-0a20-4c74-0ed5-08dda7b7e37e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 00:43:59.6842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //jWb+aJ27RyOt0zVLreb+ft3Ll1X20vRUOCKB4QkQBCpUZ1YbBZVSZ8kDz2cYceEdrLwjDbBOCIYljJxnc9xrGmQ7TerSO6XG0YLMo8H3bHuwqootqgY0vdLOS91FcH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11813


Hi Mark

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.
    
Let's standardize ASoC menu, like below
    
	ASoC support for Analog Devices  --->
	ASoC support for AMD  --->
	ASoC support for Apple  --->
	ASoC support for Atmel  --->
	ASoC support for Au1x  ----
	ASoC support for Broadcom  --->
	ASoC support for Cirrus  --->
	ASoC support for DesignWare  --->
	ASoC support for Freescale  --->
	ASoC support for Google  --->
	ASoC support for Hisilicon  --->
	...

Kuninori Morimoto (37):
  ASoC: ti: Standardize ASoC menu
  ASoC: adi: Standardize ASoC menu
  ASoC: amd: Standardize ASoC menu
  ASoC: bcm: Standardize ASoC menu
  ASoC: dwc: Standardize ASoC menu
  ASoC: fsl: Standardize ASoC menu
  ASoC: img: Standardize ASoC menu
  ASoC: mxs: Standardize ASoC menu
  ASoC: pxa: Standardize ASoC menu
  ASoC: sof: Standardize ASoC menu
  ASoC: sti: Standardize ASoC menu
  ASoC: stm: Standardize ASoC menu
  ASoC: au1x: Standardize ASoC menu
  ASoC: sdca: Standardize ASoC menu
  ASoC: sprd: Standardize ASoC menu
  ASoC: apple: Standardize ASoC menu
  ASoC: atmel: Standardize ASoC menu
  ASoC: intel: Standardize ASoC menu
  ASoC: spear: Standardize ASoC menu
  ASoC: sunxi: Standardize ASoC menu
  ASoC: tegra: Standardize ASoC menu
  ASoC: ux500: Standardize ASoC menu
  ASoC: cirrus: Standardize ASoC menu
  ASoC: google: Standardize ASoC menu
  ASoC: jz4740: Standardize ASoC menu
  ASoC: xilinx: Standardize ASoC menu
  ASoC: xtensa: Standardize ASoC menu
  ASoC: renesas: Standardize ASoC menu
  ASoC: generic: Standardize ASoC menu
  ASoC: kirkwood: Standardize ASoC menu
  ASoC: loongson: Standardize ASoC menu
  ASoC: mediatek: Standardize ASoC menu
  ASoC: rockchip: Standardize ASoC menu
  ASoC: starfive: Standardize ASoC menu
  ASoC: uniphier: Standardize ASoC menu
  ASoC: hisilicon: Standardize ASoC menu
  ASoC: sdw_utils: Standardize ASoC menu

 sound/soc/Kconfig           |  7 ++-----
 sound/soc/adi/Kconfig       |  9 +++------
 sound/soc/amd/Kconfig       |  3 +++
 sound/soc/apple/Kconfig     |  4 ++++
 sound/soc/atmel/Kconfig     | 11 ++---------
 sound/soc/au1x/Kconfig      |  4 ++++
 sound/soc/bcm/Kconfig       |  4 ++++
 sound/soc/cirrus/Kconfig    |  3 +++
 sound/soc/dwc/Kconfig       |  3 +++
 sound/soc/fsl/Kconfig       |  2 +-
 sound/soc/generic/Kconfig   |  4 ++++
 sound/soc/google/Kconfig    |  3 +++
 sound/soc/hisilicon/Kconfig |  4 ++++
 sound/soc/img/Kconfig       | 13 +++----------
 sound/soc/intel/Kconfig     |  4 ++++
 sound/soc/jz4740/Kconfig    |  4 ++++
 sound/soc/kirkwood/Kconfig  |  3 +++
 sound/soc/loongson/Kconfig  |  2 +-
 sound/soc/mediatek/Kconfig  |  4 ++++
 sound/soc/mxs/Kconfig       |  2 +-
 sound/soc/pxa/Kconfig       |  4 ++++
 sound/soc/renesas/Kconfig   |  2 +-
 sound/soc/rockchip/Kconfig  | 23 ++++++++---------------
 sound/soc/sdca/Kconfig      |  3 +++
 sound/soc/sdw_utils/Kconfig |  4 ++++
 sound/soc/sof/Kconfig       |  2 +-
 sound/soc/spear/Kconfig     |  4 ++++
 sound/soc/sprd/Kconfig      |  4 ++++
 sound/soc/starfive/Kconfig  | 12 ++++--------
 sound/soc/sti/Kconfig       |  2 +-
 sound/soc/stm/Kconfig       |  2 +-
 sound/soc/sunxi/Kconfig     |  2 +-
 sound/soc/tegra/Kconfig     |  4 ++++
 sound/soc/ti/Kconfig        |  2 +-
 sound/soc/uniphier/Kconfig  | 14 +++-----------
 sound/soc/ux500/Kconfig     |  2 +-
 sound/soc/xilinx/Kconfig    |  4 ++++
 sound/soc/xtensa/Kconfig    |  4 ++++
 38 files changed, 113 insertions(+), 74 deletions(-)

-- 
2.43.0

