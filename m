Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F56D219A81
	for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744784818; cv=fail; b=CZmh1GeKJ/ee4FDLoN65wXrFE1mUMKh5RQ8jK6dIdcRCHaICKQhLKDiFqhQ7xNTINl79ghKHFMC9QbKNettcP7WZ1I+HX+l2GBrFuLP4Dd7DRyCgnjWMDCDkH54sZF75Q1dJBtdT14hqYiXYWpxgOGtco7hIN2Y1Q55hR0DdazY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744784818; c=relaxed/simple;
	bh=B3D3I+YBturVLVKdPZ6IKepVlvh6jwlLDHUGfkJNd98=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=gCwjVKkXFRNFfW/L56Fg1kpae/znEXZNRiNsdgr4qQVQHs1n2xyhJouYsVWXcuBZMXm6VJ/+vsZIpqZBpvI2aM7O3usOWHv0TwD+nhO+iqbIHdnx5J4dLFMBsQTGuDlrbnD8QmQmdvFKoukuXz7MroCp839V2Ne1R7csyi2tKlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I8gyu13E; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I8gyu13E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Isu0R4PrBe5eE3RX16FkRF7jgR3pEkWVP6xw1SapwG/OiAhmCL0ZCTCz2v9lQ7VqODOd3WTaZV3Sd/IV8e7/tmBkLNqI9Gr7a3tQJC7D5gj4mDOpEqbxo6EoLdacZN5RN3fDZLxOFvtKgCMkX69FUDITBdCzkxa8DFb7JeIPjyo+ndZwkZ14TO7Ix2dwOQ+/Dt8NV4a2ml4C1GdVuhGcGVIAumBBgVW1u80yyUzfEOVy+rT7H48tRmgfxAJUdHwS8U6hM0pVXRZ1/SNcN7mr65xi1CoRMFwVNr+UzPgSRWZ8+1b0cfBlfs6ZRz9HN168YU4I3fXw1AnGwHRex06L/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gP+ZKQuwcy6tsS35cfUf1oKOj8/a/UN7VRbTFeEj+4=;
 b=vSQ9j6JjcSmlRdKMWPMBJU65tWenbnLZaK5wAXTBCjmfIelsTpYeLlNJM0hcCmI3HGbyE1Xeo6AuIxLHOVh3rjIPBDF2CctvDrMlj0rouXhpuxNWvOFsM2a9cilNK9fxc/7ehRq5DBkH8VisxJpNpEEu/rZRoP2Upms6SP2jkNXKM7hR7SOYMm13AjgaaRVc0+wfBpv5ape7Y1AJyrEG/KKmBNahCclhHzm9+Q/UM7JfImt0XAC4V/J2luYEsmstTUsuAYsDEVVs7z1lr6EaYiWnTnKSyarJTMRox/OzJe2Brw7Vk8W/U8+2RXuVhwSrywp+SLZu2jJ5DF+0W29Ecw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gP+ZKQuwcy6tsS35cfUf1oKOj8/a/UN7VRbTFeEj+4=;
 b=I8gyu13E7RM1XCGXjooXEMtfEKmPnqJYQpqV06miYlsMaYDMtAsfsVQILOqidpQteP07rkDpOt9Hp14AHERkH6L9R2li+YMHXV/uynttPck8tL4cXawAZczsF50rOPaGpg3r1roUBC6PH3g8jvj+WdHN/O9ztfxyy3LpJ4hLFO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15588.jpnprd01.prod.outlook.com
 (2603:1096:405:28b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Wed, 16 Apr
 2025 06:26:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 06:26:48 +0000
Message-ID: <87ecxs8vvc.wl-kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: soc-utils: add snd_soc_dlc_is_dummy()
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 16 Apr 2025 06:26:48 +0000
X-ClientProxiedBy: TY2PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:404:a::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15588:EE_
X-MS-Office365-Filtering-Correlation-Id: ace3718d-ad23-4db4-43a9-08dd7cafaab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9SlrQsslRZBxP7YisBMweGfVMDoA3+5qvpsWadi+uPjU797kRim+BTXs2mw7?=
 =?us-ascii?Q?x9/Dzr9Vfq4ayyhSjyORUjEhmsemDs/5cZvi0V5EjaQ9bqJi7P/i1yQI11py?=
 =?us-ascii?Q?PcnBZCrlVQw9f3A8XZBzdP2eRX1etSXR302cvt9O5/52xjU6deWvV72dgJsy?=
 =?us-ascii?Q?oMYnrNHFmThow7yrrJ89MW8LoaUaVqACkJnPM1k1uB+tGrzozUOto6Il2qDc?=
 =?us-ascii?Q?9jLJnnAuAaM+x8UnCZl0YLYF9mAK5vDyrBvprP5tV0TU4+fWfAO9d39fi/Nx?=
 =?us-ascii?Q?P0fbpxZPeZumWPMDYdRTMCZaYmDEWR1YptO+JSGxwJdaThcHHaiKmjjHoSHe?=
 =?us-ascii?Q?buQPBamT9tRoV5yoWtUEZ9i7pY90VKRJhQAbodKJCE+1gq0A6EsayYnc/E/u?=
 =?us-ascii?Q?NxlvEKmRrMxW0dextfxO5uozZM864+HOsTeS/iPccxuEp07GC8Mbh44YXiAc?=
 =?us-ascii?Q?0dzIAdmpx0A4OUtMbtKZS4RXOxPDuwYQsNhV0nCh1dHPjP7jS3M4IoOGyWQR?=
 =?us-ascii?Q?fVEW3aQrycIF0o2B/iU1P5P4za+l45JUWXyf9bDoDF7fd5+xSIPVFB5wBps9?=
 =?us-ascii?Q?pH8HRXqxwNdjZ18b7WUvYszyaTqqcgv8w4UY/cUySMz/AqQ0Rz7bMYTOn9CP?=
 =?us-ascii?Q?hRyJ9cilpcb2lGnMvmOj1vwrH2J8Vx2GWNGl/QS+uWCtetmY9HSTnv3orB/4?=
 =?us-ascii?Q?IkBzOeBBK90Ekox4YEcGfrVGRzJIQJXth3AV//xICIB0kXa7lNhtHI3+1cZd?=
 =?us-ascii?Q?zaIBOoSuEWCu1+OZItsdMfnGvTKtqfbvyba9LO8uDCflxUggFZx6BMzyuyyR?=
 =?us-ascii?Q?N2JgZlNQBV6SnyyIa7OUNe50oUnNYVR9UN7FgdNo98cmLfpe4elGrFdr1e9R?=
 =?us-ascii?Q?cux7ylxExLn7kJp8UF34qhd4w/JtFWaid3WZ4TL5ntnuYOCRJrmqCyPnFAxD?=
 =?us-ascii?Q?MHT2IGp+xRWskcbsYx+uaRZFxTN+XcJi7E+MXpl1UtWUR5XTXZ4KW/0qSRPc?=
 =?us-ascii?Q?Wc4hFSFhRW1uLPZfaoFe3KsNWCzDevXI+Z0DA7hPWti3Nwa219WY8+AXxi77?=
 =?us-ascii?Q?cxJO2VvDiCMMwz0+Sox27Y6L9/GLHZ7p+D7uZZaJUrFT+iBNKlXrc0SMe3vI?=
 =?us-ascii?Q?NMGr5W+zQbr4yj3JI7o2/xxwtHZbLrqbqlI135yjUz7JCk3qPqSULRB7y/cf?=
 =?us-ascii?Q?VB8vc7F1gTLLQdhDevwjnXIrs/zh4+onvDyQTDPLmqGYrLStbol5IqnIIybd?=
 =?us-ascii?Q?aeHwTWfJDt3G3mKPcKk88+NB2tClLDzvdbo6OieaXn1wshsGcpi1wpzTp6yh?=
 =?us-ascii?Q?lxjUjpTuq2OfZOljCz3pS4KeBA1tDo6zO337IblKfCIkPTNE+e7eNLDlNpcq?=
 =?us-ascii?Q?4otBns0ATVuHH3ZAk8OY87S2Hg/Uafv+TUpvPw4CmjPVyLKrHmMxiyTdHbEA?=
 =?us-ascii?Q?iNd588oXCFCsky5lGWpbzExnGnAl9y7Ghlx2rkjm+Hq527INQl6MjA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q46/9tY1+Rw76Z8MZLwQvRQKnozK/YTb0WUMybnxNxBdIprwe9Q9KaumFvNN?=
 =?us-ascii?Q?dCZGqJknKKFK0tuq4lbfyO7uzLrYdf9gtZO5j4yEnukQn+0hZvMhfj421Ymj?=
 =?us-ascii?Q?Hyqf7UvUheQls0gH3gjIjYG0+kJw7ezSlzw3Hqy3iCuionhZkZPCkzM8r/3Y?=
 =?us-ascii?Q?w9iTKHiRqRY2TYD1QeEj1hJU2e9M+zUq0MaMY/wjoIxS0chd7IVLhQM8Q0nh?=
 =?us-ascii?Q?kih+9TjVb5TWxlO50gcvF1wbykkwdvqhSzFtskodMdNF6G9k2gMdpQU1GStc?=
 =?us-ascii?Q?ZTBl7N8CEHTUHcXoX0l9QgxABS9eJ5TWttQ6PZdv+QLeOAK50Peqp6gYOKGC?=
 =?us-ascii?Q?QCPpIrh1mC8EbhrmefAIUPzdUu+kKq6a1gOjlI5ZAp/RPEofKy+iNVvu4Ads?=
 =?us-ascii?Q?gHF5ozD5UOsllf6GmA9k+2jsgkg95CCOM3U8SsiivkFqw1j4OrSxgG1H9Swm?=
 =?us-ascii?Q?g8ZutSHaT5XQHlIn7Ti8S+wssh6pWDQFm/Wd1GBxrlDdSOfDMcv1nQfCydyp?=
 =?us-ascii?Q?uNJWNcZxhLF6ReVorr5gu605AIPzXPQZ0rQXFrjwx9mbD8UMdORPk4Zrz3J2?=
 =?us-ascii?Q?QeKWC7/8QwMHw0HC91uxLi+HY9xlVcOtx4u00G4cY++UZWZ81YrsEYZB5UCd?=
 =?us-ascii?Q?th8rtfBD75tIzdipPbh3v1lCO8x+/xH0TzaLyDosHs4iOcXPaE05WPQZKZgK?=
 =?us-ascii?Q?ppi8lo6Pg7yEbC2faJkAYP/WCqJlSa+X2+tCwdWaPSpdLUfW04zZOUHpg3Ao?=
 =?us-ascii?Q?RAp04SQZ7TkUpbfkJyOCorJdlwog3EHB7wV2j+ibXTCZHJN4idsSDGg1YExJ?=
 =?us-ascii?Q?EEm7pXoaPQgBpbnWFqdspZ7xxvGjSGPV2LTmrRMlTL1JM137F2GfHewuK2B4?=
 =?us-ascii?Q?csxWPgAtAIKpWi8y3sB2odjumNBB9Qiv+rNKu66Xtuj/+bz0QJ1x8m1ywHKd?=
 =?us-ascii?Q?mp9qY/FvRVCMIMYUyOuVpaD9+ZfpXrVnpyaEIhObnurATp3I66icWSBse0yR?=
 =?us-ascii?Q?pSVUzaIIljRUobjsqYHuNL95ark+4f/mT8hXBVNd3bipPUhIQBAueeAa+Mm3?=
 =?us-ascii?Q?d6D0zA/vmE3dOgfPN6xtK1++Z2tI8CvVVwisYPg3KRIUIFkECT9l2VH7kRRR?=
 =?us-ascii?Q?MG2prAFCRdzVs6L4Jnu6tsS01qd0+dBhWDPifkbQiLvMzC05Ov6MTi2DdJMn?=
 =?us-ascii?Q?lJjsbp0eH/X4JAHk/zlQLm1pbUnX4nqTCfd01MFJOmuZggJAJRWPNAtDB6Gu?=
 =?us-ascii?Q?2obMMihsF365rwDWj0xBfBu8e272Xnny4zoOVYlPSuNKonrQxyp4l8H2cU6w?=
 =?us-ascii?Q?1yOIFcVt9lkGlF0e11dcMzKjXuzTkDcgGkuHwqNcpN+LaMSVbkefUtkxFZNx?=
 =?us-ascii?Q?97YihrX4zgBe73jBxpX1epZ+xfx6XcSfdpKLVl4kszXuyFZmaZQGZ2V83Pwk?=
 =?us-ascii?Q?VTTR/2hDaJSMblsx16D/npuHLJL/aK+m0cdWhoZueOhuvc/nr71bLFkBLLNk?=
 =?us-ascii?Q?0no8m7OZNjtdpGmw5Fbs6ySBb3MP1mSgfIPD79anD7FdsVNMFw8xFXRR1mIt?=
 =?us-ascii?Q?0wQK0vw6dIOZh7d3gz5wCRPoEXOE5pG/pBWz5rCQV6DwO7rsFUpw3GlGJW3g?=
 =?us-ascii?Q?mzzKC5eZBTAm56iKyAkfNiM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace3718d-ad23-4db4-43a9-08dd7cafaab3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 06:26:48.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YrWf2dSZxs+/rMN2ATpBoRnGPekoY2cQmMoecyf6sVMwxALHKTOh8WHKeTTdfC3vo8nXme/9oI508DaFatckVVbcLyGa7jMGRoycr/3pVH+fWckA4oRJ1zwdklF9irR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15588


Hi Mark

We are using dummy component/dlc, but didn't have its check funciton.
This patch adds it.

Kuninori Morimoto (3):
  ASoC: soc-utils: add snd_soc_dlc_is_dummy()
  ASoC: mediatek: mt8188: use snd_soc_dlc_is_dummy()
  ASoC: mediatek: mt8195: use snd_soc_dlc_is_dummy()

 include/sound/soc.h                       |  2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c |  6 +++---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c |  6 +++---
 sound/soc/soc-utils.c                     | 13 +++++++++++++
 4 files changed, 20 insertions(+), 7 deletions(-)

-- 
2.43.0

