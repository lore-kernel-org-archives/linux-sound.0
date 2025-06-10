Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E904D25DAEA
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529349; cv=fail; b=OExgiOt7BudqQv6cHzduSD7qzv2nKNto0vyXO656f4TDF0VZbgNjt+kWN4Z+WhGQLK30/708d0BOXb9nrCsg+NS+2rQdYT6Xq4L0zB+ZkckuDOKNjt375IgLoo/X3v1l7hMh89pWpdKtBuxNQgU4O2V6VGjcC0O/axbfS2zA21A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529349; c=relaxed/simple;
	bh=2mJah7XDIqLbV/iunZqdq0tSxbCWcWO+UQ/b4SwVUlY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=vFHVjZMMgT3Wk+Obpes8dI5RJGkIdtIqNBKCzmNwtgPZACuiy2NmCHKC4/eu81rqIVUc2an5jPGLjJhlGj591Xo0j5YD0CRMWs438ccKUCHK+/A0wwTk+sKshAlaOf41zoe/eVT5lgksaUPh3swAQnUNjifs6n8V/uCu6HuKGjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=igDu/rhf; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="igDu/rhf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCNRRqMAqaYwkFHB4nuSMV3aAlVm+tkwcFIV8uQKi7qSNzUhpHZ8Srwk/aLI5NRZmt0/9Oca1UgBoao/h185/aoCk/ltll4a7f3UA7Kh6QFMDNuKfYi1t1J9Ygd1PORDZ5+z13WpxOeMT8zoEtb3RMu5L1FVnfz6IVAeTMI/23HwH3ji+lKui+iNQy0fxqKf4LjfMjMgaA84rEnZF12dQI3MXJ6b3+pBD9W+/2r/JNXyXsDUCD/uMuP5akYI9kZzb6KeefZoR8bF0PyAMfdvpRzCOGQmnA5k9UyI0h7sJ9JgjoRZDImy2fg7KD3Ad3fHtBYW3nhU/TpLvS4qljsffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IGa8WEmqijcL6CjssRs1kEkH7J8/qmTjCtl2e0DAJA=;
 b=TAudk6+ITeK/YmFb5ezFGmOAddBEZfq6Wr0NogF8e2ASZfhl3QcEiAV0rR649kWvSLXbc6xKEhCMo5SdRa4bZj3zf1gmI7jmrxtTsiUMIY89yRmwcN3XWCTdUNbUq7XniAs/OyMbkO/M2Eg32j1+Ki48vhAvbKAQn4xuYypur/UUL0Lxwta84Sj5LrWPsXUrAxWAOWnXrFIgYLolQQoYID6CANKU+4eRVN0z+3LmHaEiXZOUjRmMdwsxfEVAncUdCE+XjQkP8TJC+3o8GZFPRKyr2IY6aCmJzJlbbdr38spMU02D3xJjm325iXDPbOeBUdIbgNtb8W62r0OPvOimwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IGa8WEmqijcL6CjssRs1kEkH7J8/qmTjCtl2e0DAJA=;
 b=igDu/rhfji12CEgql/AlDhnx6vlvlwbikPufQM1GlNMdbSi7Z+B0h4Cb/liPrzqsTlTeMg04AC9Tu3TYpTYoENX5/q2FxiZ8fpnkCOT9JOmxw54vK1oLtzyId4S5IC+ONjgvr7dpbi4PJzRTG+647jjMVafKiVqRWZTne7ooxP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15231.jpnprd01.prod.outlook.com
 (2603:1096:604:3b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 04:22:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:22:25 +0000
Message-ID: <87ecvs6xa7.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 23/37] ASoC: cirrus: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:22:25 +0000
X-ClientProxiedBy: TYAPR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15231:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3ec01a-dbea-4228-1992-08dda7d66775
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s+tBJnyBIKbyT+s0HUdkqsQSjpcNKSytqDbFLgpI3my6HhSHf4PErFFH1r30?=
 =?us-ascii?Q?NYQuYYe15JKnDdP4rxCQa6nd8OUXBfyQgBVAHE7FE0oc/KvgC+BYtVDBnVWO?=
 =?us-ascii?Q?s6QnRQt+gCWO9T44dPQCU6PAF2MneqrJIfTVVyu6+9fNWfN4G8F1zmzNPUKq?=
 =?us-ascii?Q?ikOfcEzJzDwEioN+eiU+Q2hQCy14Hw5TkTbaDJi6r6DLcn74zgVUYguL9NW2?=
 =?us-ascii?Q?ulrfLB8sGEYWNTFqFD8bJvht//oj5qQeT4tKCvcgCV9mqjmKOTnTyjcazknI?=
 =?us-ascii?Q?RcQItG8jzJLUcxbmzKxZJZgcIxy19rTxI5g6R3TABag6cxf1xRgWZEtZUydS?=
 =?us-ascii?Q?6QeWk2hLdrxhSVhDVWTx+Yp8oIo36pnv61XqONis4D6TRVtjjKSvYbXsiyTi?=
 =?us-ascii?Q?Bk0g0YGnVvTaVO9y/JfKFM60hHC9GFoua7R59eIbvpbtt1MTzswZ6UXdjaN2?=
 =?us-ascii?Q?xyxTg7coc3QIrGMXzpglHyYMIg3frRvWLeI0kotjPZErJuGUXcNMweigxOnV?=
 =?us-ascii?Q?xHzAmSamCjRSN66kFUJX09XMDFEjaB8qZ979zGRTcrOEY0361LL3zrrz5IZL?=
 =?us-ascii?Q?sHjneEKx5lSRFKq3pid08I9nemdmc13kVIAN1liEwpOMubH1snpEvyLlujJM?=
 =?us-ascii?Q?WTzrjVr9+8Rm6yApe181KxY2RKPifBKshYv5EVJr6YolArhHryIz+qpA+koq?=
 =?us-ascii?Q?hU9Zu/ssoKXK7MSDMvOaB0B2xPHTxANCgGuNn/9Uet6JUbjw72P2scbQUoQd?=
 =?us-ascii?Q?AzrPZkMcGLxv1wxSH/Si3SWxH2hcIK7nGa02hGqek5pZ9NKQee0ssv12AVYX?=
 =?us-ascii?Q?vknyQDfGfNy4718UDvzbj9ec4fpOQdzUwao//VJz249UmBUaj+3Xh8IaiYqd?=
 =?us-ascii?Q?R420WtuuSvO+p89ILdLoOP+yMYB7ClNRBGhzRCA5j5h8SCAHGj2Wdh7/8d7p?=
 =?us-ascii?Q?c2mxawzEwHkWta5t5qlQWfsVKoTa9hzBsaQPHLxxO2fsNM67fP5sB6T5YaEd?=
 =?us-ascii?Q?MpGGxNYjNVdYR2epELNvOEul2MPuxvVDoKJDWoohme/JpVFdI0gnrbhK/X0a?=
 =?us-ascii?Q?jAk/dvGzeuKxSLIcYeESUvtdJl/pOXrEf/oPugsSsADj9u2Z8QHBjCgWF2wK?=
 =?us-ascii?Q?mUEjpUNJSxJQ26GGM/YdhMp9sCqFdUCaxQA9e8icBxZ3N2c9IDq+fviDbQ8p?=
 =?us-ascii?Q?QUjATBeK8RW098VhrWOjBjeYkqlGuqgXystVoDBNh65utq1YS7DtpYSQWt8n?=
 =?us-ascii?Q?tiEVyK5hMXtIuteIWjEpLbgl23iXTI7hgBqdexY6CbY8ZHxcmobAqecOh3Nb?=
 =?us-ascii?Q?ulWzxCD1HbCvHgTlsxw2cO/8+2Z6CuBvl1e0g8jXtmi5qqz7a61KTCOxslL5?=
 =?us-ascii?Q?x8qg14tcLOthVQxW6LFGry+DzZ8M5Kqa8+9zN/lrcBOQS/h/HIdj8/TKivOJ?=
 =?us-ascii?Q?gnsazFvlM4dwcnhYahSVpSklALRGMo5qIhHQQuEUT/WaRlT9/3JMplYCGjiA?=
 =?us-ascii?Q?cISXNmc4p5fh80OMRixK+5NOu3ZRWOBOaVUToTjSjBieZ4fZis60SvsxGQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k4InxKRxoGjp/vD5OGWI0qDsItee+kOGiik7jErOqCiR084HK/KTysENvVS/?=
 =?us-ascii?Q?7ker75zizK3mb2SNMBMZT/2S7OConbgmfV+9lMVSBzK7XM2NptilQZP8w9B5?=
 =?us-ascii?Q?7EgODpBaR7f3ti61ZMLBgbUAXvEYMdZ6mXpibW/PXWTGwYPcA7q7oxKX5yoo?=
 =?us-ascii?Q?xgT7zoiqH54/plU7Qr/fZVZ+1pOV42yceamf3jWAUHDNdxaml5gZJMAowlhL?=
 =?us-ascii?Q?9XE3pv1nKh4VSyhQVWU3j12o59ARItlASDRpvM+bNvcwzki7DOzsEDx8kgXG?=
 =?us-ascii?Q?fU/ziTB1mFvfDJHPf3sZOBRM41aYPifKX/Vm2Q32ixIfe8wFlSlJdskAN61K?=
 =?us-ascii?Q?HUGp+t4vBbZu19784mVclIYD0d7bVlAy39OLM93uvocKdxbIRnLZGAzCb3nx?=
 =?us-ascii?Q?iJg7TkwGpkMojYv60LMpL28KcdOg7lIrgua6orr1C2n1QfS/BMMzLzRz0HGi?=
 =?us-ascii?Q?DwojsxM5jQ5WSX3iTLeg6Q1uxR1fUFZ6M+ZEK0Mh4As0vaSVHKhmFUiW08Mr?=
 =?us-ascii?Q?hG/xA57auoamXAewHBV5Dmf8s4f4dfSNBjiZdesiw3nnd8H6sxiBKJZ5vEMU?=
 =?us-ascii?Q?f2QQAlImRysoLJXAuDLyXqVUy8IY5IkW+ZYbt0fnj7TkCu60sVHz/TCkVVl5?=
 =?us-ascii?Q?rqhQHmbmqYWD3WKQ7V2HUn2HJ8DeHENUHEgqGxWjM1XklDOby+uCK5pD3x9G?=
 =?us-ascii?Q?aIwSp38irzXEdYu8lXPDp0jb/blGmFt/tHde8dY6p/G2EexXrp+gn7IEyuiT?=
 =?us-ascii?Q?tmYBWeq+4jxmytkfaKi8RqzAKE5OJGyGYHSEcsxfAuErYotkE8WS73ltKtMD?=
 =?us-ascii?Q?nhUKBzpXByo0C/78qIaZhvL18NejSOYNHxiiDwwh+o4hT7cD5i28vb1oxVMD?=
 =?us-ascii?Q?mzmcHjDsmQDMn0760FtTUnukz8NfG1cXQwIdqo9JTM2t+x4jqkUKU0++gyAM?=
 =?us-ascii?Q?yFKIYASvsGeUNB51OKVeC7On8pxSihQCVnO/mtI4VtTXMo+zf1cYTQS36pd0?=
 =?us-ascii?Q?FAqOP+njTNh4sXORqG0d3sn/1xxG1jTZGUpY2NQYw7cCPYkfn2/cjIzxJo2b?=
 =?us-ascii?Q?eMXO9t18TvvtsLKXt6w72399MEUJgnkC0bZW6U8QL/i95wP9u4dCGGvBsS1L?=
 =?us-ascii?Q?Gio39vegRpS26+KmExvhHSUFEyzfVsj/WQy4tlrDiXyJ8nuYhYVm2BD9UwnB?=
 =?us-ascii?Q?t54hDoB/fMrpDMB5NcS5SoJckV9t3ZCfyk1bjWD287UXNWo9jez+cReBtrwO?=
 =?us-ascii?Q?mvjGiDwFcggzlitUV0tG5NK2b1ELWbeYpIb0YPmNS5PmTMC1AABzgXm8tbKD?=
 =?us-ascii?Q?TkWNKsTMJ++WTw2CJ9K/9WCfVbY70IXcHv6bLjdiGqKX0QDNuNYaVXhsJmWi?=
 =?us-ascii?Q?3u5KiLoJENjnnkWuIjqti1C7wExeXjZ/Zf/XSq6BTRoua9KfQOwcJY5E0pt8?=
 =?us-ascii?Q?3o0+cBFyhjrVN6aPKxL8ua8eHNN1nv/cHC1ZV9G6T+cWbIGa73hl9KUH+9bo?=
 =?us-ascii?Q?S8F8vg+RAgtddskECz0feAoPd/L8q1MggpgWpYTtJ1XRMiVj6sX1HLEYmNbF?=
 =?us-ascii?Q?RsCmC41N/Lm8F7SZmxlDTfH/RqpiLuMkKV5ywJfpMczbzV7JZEDGh0mJdudp?=
 =?us-ascii?Q?3RMt5uqQ3x0e7n03EAicXzI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3ec01a-dbea-4228-1992-08dda7d66775
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:22:25.8491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +uDYMH8swQ3a79Vy+lFdg4BrU4aD7CuWBlkKEynEYXjOI60tM+2Hnjzu8YQ/lf2e3NfI4XCp6MI4Sx93gbNbbgEkyZXs633dyxZ8ciZDqJHfGKtECgU5SfIc2AmHYxSP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15231

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/cirrus/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/cirrus/Kconfig b/sound/soc/cirrus/Kconfig
index 97def4e53fbc7..6c68c54baaf9a 100644
--- a/sound/soc/cirrus/Kconfig
+++ b/sound/soc/cirrus/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for Cirrus"
+
 config SND_EP93XX_SOC
 	tristate "SoC Audio support for the Cirrus Logic EP93xx series"
 	depends on ARCH_EP93XX || COMPILE_TEST
@@ -31,3 +33,4 @@ config SND_EP93XX_SOC_I2S_WATCHDOG
 
 endif # if SND_EP93XX_SOC_I2S
 
+endmenu
-- 
2.43.0

