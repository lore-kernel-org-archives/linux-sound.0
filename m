Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00A61917F9
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533712; cv=fail; b=Gf4/fPQA39+sH07TDBXZTQlOEuY4BKoutbmej5Gls+y3bEYE8pMf2gy2MjHYWtjzRPQR7P3FYIvDZuXBAQKQZTui4Aebibc7FbKW660FkZ8gnB1SWSDGjZisOHBrZs8NUDISaPBAqQEUZmck86Cm+JU9weH33BqN2hcsTSLlAUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533712; c=relaxed/simple;
	bh=GJEB6kmv2jKeeLZ6IuCcKwge7V54EUGtgw74afuNwXE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rynQ+47rP1+FM/UMF4h09fuzA6TGaQyeCn4m2v3mTgLO/ekmH6qOPhWTdjo5RaiKuIsiOuyOFf5ohDin1aVKqGL5Ss9xVmN5YwmH5Dt+LtF/34uXSiM335dH+4bVoq2JsgDcuV48B3zXgLEpktt+yZToPrcd1b+gnKuiaFrBqpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=A6+PUy9Z; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="A6+PUy9Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iz5TtDogzQZoju/K49iMKff5b40A0h0K7eHHvsiYdjDVe/IWw0sEYj15O+UHL2wFA13VJl026dJFrTXSnwThHJ3aVvPmVrcmoz3iDb7HNEV5QpLPdTX8g3OxCPxYp4edvRofgDUffiGIVMKCZFGERzZoL55Itjvw+NZGFUoJKU9RX+onRTUSJ/fWhQ6RexaUpber1pjwmYuCjHEU2sbt34S0WNEui6f9nHNJLXd/T2Jhpks4SJLSHQN8irXaDSsfltqU2f7r/PEzCKYedOjbEFCqFNQWzJ89HwFZ5mGddL/cVkvFd2ILt7ghzORQt+DJTkntgGaREjJBbdv3x7OZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bubnl7MjOGymDrrnmcduMsXGWbi6/XjL0pQQwT2j9kk=;
 b=SrJiawAYi0Y9M0F5KPYebNDPVX8012EGrFSHLXH0U42kfcOP8qiyubo5eSH8PhhqOWya5IZowdIZ4a4x4ePQF6p+Z+1hKhuySHVQeTGEja+GCkcfPJkmhq6ltdymMtYplk40ovxPEuBQopU8Enn3RdTaHM+XjYddLLWZLrHyYkJ9vFpiwomuXZFd0nqJI2xj6nHCrS1ZcSRwij+lA/HFGvacJW158QyftuDswZtIbbRKB9NbdN6GAAhiV2hJ+cxbWY5kIVHHufvTCLBBWYSTjKHYsdmmM+Jt8N4Hv5QDM8HUwAL1x07JHz0XF/7VGDMSXZSXNDrKv88ImXwN4NfoMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bubnl7MjOGymDrrnmcduMsXGWbi6/XjL0pQQwT2j9kk=;
 b=A6+PUy9Z8rwrVBgsKV1E1+W7+GAQEVu+eLCiW3Kyvx/+Cg5hPJde5za74ZzLvaMPaBKQ7kxOvBAYMIo+iXBE2wwA8+NZ/j6QLh2LNMInF01xlWFuH7OswncC2vnhow3kNHjIViGxQo9ud+KPzYNni3G29W+MmMsJbNpiphK9g6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:35:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:06 +0000
Message-ID: <878qptcwtx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 080/157] ASoC: codec: wm8776: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:06 +0000
X-ClientProxiedBy: TYCPR01CA0112.jpnprd01.prod.outlook.com
 (2603:1096:405:4::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a9505b2-cedc-4457-74a9-08dd5605ccbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tjfNBOBNuy+4opcx4VYqgJtD+bbmMsqKJTC0MGgwYf69mmt4DuwlmHuoAYng?=
 =?us-ascii?Q?AgjPZvhroH0n+FECpOnXALD8hsCPHttba/nVKEPOPitjdYISpadiYFABIvup?=
 =?us-ascii?Q?Oa1zf0xaJlVAztWJvxxITlK4bXNcwXFpRxnk96E0exAufwetW3Zz1IPz3aJ5?=
 =?us-ascii?Q?0Fqen94YKneV2LlQ0ufryWnXiDxxv8kxxfKUUhrKLqK8TGcEJYLmCP2tPaiC?=
 =?us-ascii?Q?F2a1p8Q7lyJ+SqhgLro5RkK5pLhvWzcZo109FatkReepjFAF4WWVw61EDGjN?=
 =?us-ascii?Q?jxeCnXwiTx+0fBRe/cT8YQ9KrtOnrXghzYFkQ52++Iy9fvu4LJKIfFt5FkCj?=
 =?us-ascii?Q?x+URLWgguqV6WZJ003r4wXvJ61Dk9x9k8zH+NmUoLP8SEAHFPSfregMi7hSC?=
 =?us-ascii?Q?1tDLdvPeO1gRlWQ4YVV+wvMuecZWnAYozctI9qHQI9XgqXauvK+JkvfHZfk9?=
 =?us-ascii?Q?5wTDmeg8VwGa0gRn/JQ2q9QnlFMrfSYUzDXZ3TJTT912BYeMAiQ5Q7ofpSGS?=
 =?us-ascii?Q?jDYhLzyPFeQ27i1KYSuQO38rpeD0o2UXfeAdr+9B6PuqusUwBePgQm8uMP9t?=
 =?us-ascii?Q?MbXOkRGaprYbJgTi2kktZLKRGXCSCYinhIuCWVign70x4fYjos5XX4UpJCQ5?=
 =?us-ascii?Q?To1r9V+x19i2tQePfSi5ALSS5vcuJ/mATq4JTjG+e41pbN0ao+rD0s1SMH0M?=
 =?us-ascii?Q?UtsRKMpbyYPCxr05I1ROGPNcWLMDaEt+ulx/DSEf1ahlAs9h5F+v6oXsFqhb?=
 =?us-ascii?Q?iaMrWo5/x3LqMzv8LJw4M2ngWv3oKspOxF7312hM+Z5pKcNjAS1iVmpF1WZe?=
 =?us-ascii?Q?dzlIGxpgkmibBCx2IrcmI6bkqdH1dG51COeZfqZt0wJawRIAheL4TpNgV/0H?=
 =?us-ascii?Q?tjHucE2dNEzcWZVsVVMUaovBa75FYyMV0IcdgSq+ntE3gH/rISV2LoVyYfRO?=
 =?us-ascii?Q?xL2Zfx9v99iV5oIJHMKc63WNWjLkbolCf/yslnPR4j+D6oUKY4+Bta01cX2Y?=
 =?us-ascii?Q?ZUUy4tPZR7/Byb5d7q5R8TV7ctXyiCQ3KLg+0+WU+RT75ZbBPa5ZkNuK5LJ9?=
 =?us-ascii?Q?1eaH3/MsTi+SWKwDqjqv0DaRBiedi2xSsYxvJ7F4UXQqylDg4FPLfUzpuf5+?=
 =?us-ascii?Q?E9liwoWyQ1UnGuQkuA4u38XkONnQXnPgHU8mQJtFqGB5Gve1DL8qCjtBU9Wm?=
 =?us-ascii?Q?TL74DxMBgjt2e3SJMih9FamKiok8mk8p/9s7vbVFOZZrbhxL7oflGZSMrWLZ?=
 =?us-ascii?Q?O6IRwzOPryXk4IvETarGuV9iXxhRda3IVr52ORXMIK7aK+wGTRiH57OWDiLp?=
 =?us-ascii?Q?FyGX18P4tlw4+evH38bRUQgDlTQrbnHBPga1HaXHkXJWYFCa4J2tz9pnKN1T?=
 =?us-ascii?Q?HRLSv/pa3ch2v7XyslUSEjrzZZJShh/XjGx0bCtPrDd33ixvOTEqMuOj+c7e?=
 =?us-ascii?Q?fIkJLw3z/MQ/ElsnLLNn0+uqX5wiBAHa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oUYMajAkkIw3/xAQoDKdw5FPQbfCj8rE7Cnm/NlikptfbCBz8O11/GyUCvgp?=
 =?us-ascii?Q?vo3l8tPjH2fj1lBqjFfPeH1hQwHMYkI6VimMAiq+EZH09CsTfXlVVHh6uLBs?=
 =?us-ascii?Q?JssMFqgO/l7t7SwcyUMcamZtJhNFtvQ2TZz5Ipn7NMx+bT2Ulnt+IKE0wEiW?=
 =?us-ascii?Q?xnK6mZWm4A9HNlUF+wILV95rsLQpMZHX3WiXaPVoTGlTN9mnuqAhuod3C2NB?=
 =?us-ascii?Q?QYGg1D0cVDXKel8J57FMaHV+qgmLZEDh7JZdXrsD+E96L6Zz1mcrpr/RyGWu?=
 =?us-ascii?Q?YnGHe3Y+Lre4xHgI66cyWr7xcelaNXvb7RcTdnQCJc28v6agobmSvKzESzdY?=
 =?us-ascii?Q?ZsvKSrc4lpUQ5NJt1ko+qKCKiuuiTu3A6+/pUPAoGgmlEQ3ymnXLCLUT+z0h?=
 =?us-ascii?Q?haPEvvu8EyxIGFEVIw9d+He5FswewC7f5DYZ23uGoAaHJQ0HEvNtMnGKYJ6O?=
 =?us-ascii?Q?4s0WtjmvT26nY/1gN0tYKlorBFCsePmpDQCKqy/mXkv3BbMvZp2BpGczh0Cf?=
 =?us-ascii?Q?v1Kgd+V33/rGRNveMcPBAGMf8oQEE0rxfWgqit2mnSu6SBVY4zw7NypMPpRL?=
 =?us-ascii?Q?MEgo8yhzNYjO4e0TcO4uqmLJfryQtu5T4CO5IKLZ8eajs6aEI/ig9mxRhTMs?=
 =?us-ascii?Q?4b/gFmi/AAwwRYeWXEfH2bWo8lmg0kxsK2QcNUKuhmOxmjOy0jwK4hGfdnK1?=
 =?us-ascii?Q?4G+fp85i97ro5156PZhdP33i5f5dQ2UNlBPOqobemiR8YihkABPphLppVPEI?=
 =?us-ascii?Q?f18KdTrB4ifYbxLW+C6GEls59mGt9sJQ0CgOcT6pdxlllhga+4R+tbrYTrl8?=
 =?us-ascii?Q?f9ztOvtz9vxOV5jGTuKz+duBmh9ccZ4C5IBlVVQrQxCvKWXJzwPkTKcAEsJ1?=
 =?us-ascii?Q?i4cYEnyXw4v3GFUCNeI4p5NW7Qy3sDXNyfJjX3mFud1F6797/mAaa734oOqk?=
 =?us-ascii?Q?Hh8zBENE4p2q/kKMuzZhEn3k+huynV9u8vcZxsyDQGyr6BbjWRCm7ZkYTIeq?=
 =?us-ascii?Q?nPI0kX/OjeDn+JoavcRZA/ki6/svm65gwabW/l2cPJbcrejVQXO39qT6qRvs?=
 =?us-ascii?Q?v0soQqhSrSODT9tGcC2Y/hMHjmsxF0XRwUnKAnq0i2FxVgieLrgvyMXC/959?=
 =?us-ascii?Q?iEV8dfNqhcovLUVPSzXJep6aeJzNFVSBjokhysB1kTbBmi9WfQfylOWfYgyI?=
 =?us-ascii?Q?FJuFW1+KJXNCw35AbAg2Q7aAKiqRt/nTkoI0hfUKSb/kfnZ73Ih3M730xIPS?=
 =?us-ascii?Q?bCxSz+UxO9VF3fBqcP0bD6Wawy+I21xRkOTEVwwU0bAiPPdyFi4A0vZLAffO?=
 =?us-ascii?Q?GQAISDxg7x4EYOl/GQ6sqlPXFOC7CvS9gbF7uiQf38mrjEA0EINeFRwmweDU?=
 =?us-ascii?Q?hC2zJ47dB9/I6jpnMyXRd9TPstJ4j2zHDviN7/vMkT8RwzuxE7V9SzNazxsG?=
 =?us-ascii?Q?orfyZ+oof+CUXl7NjvSMk75RSuq5qWUvwpnS9OBW1EaSn1xW9Fb1DeJoKg44?=
 =?us-ascii?Q?hGM+KVTfNrripPi08TLnvV2WlVZvHMkz/jxU3l+zPvNp7hZIvcAId+MXCEjO?=
 =?us-ascii?Q?QiyHoJfv0wFMAEh/Y8IVfP99/BUQlPVtWEweYIYXTwESJE3cCkNhL1icouq6?=
 =?us-ascii?Q?XeWp3+5G6nqKog34L6ZreZY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9505b2-cedc-4457-74a9-08dd5605ccbd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:06.7474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7oRIH2xtJmUqMmALwD0DaxORA6tEluiolzuI42U11JF1/ZorcK0VnjIPyji2C/GN8UMzX669EtLPrj7jXJAR1aUKONYz/AQz43VXHhPYcEALL86uATepEvPiK9FqELY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8776.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8776.c b/sound/soc/codecs/wm8776.c
index 166e00fcd11d..7b73c825aed4 100644
--- a/sound/soc/codecs/wm8776.c
+++ b/sound/soc/codecs/wm8776.c
@@ -182,9 +182,9 @@ static int wm8776_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	iface = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		master = 0;
 		break;
 	default:
-- 
2.43.0

