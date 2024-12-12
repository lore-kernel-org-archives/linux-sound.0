Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA64C13AA3E
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 02:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733970197; cv=fail; b=MIfNaZxjLWc8inxgVmWkmGyEV63X2Y5KemCNX0m6+npaZqb20nwKjgfr4vn+kN7xl+SwLhrNVs11EwX2tJ4N6Oa8FtF4TRrX5IMfpq+GuS8dH5BQdDAS5AByEgVFiELBdskNoqXyxAd//m8lR2f2oOMwMrf8GN/AHdz4ty4OaDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733970197; c=relaxed/simple;
	bh=pX5IrXd658gQB9LQ/9iLyicZZadhJsjfLed36peK7CM=;
	h=Date:Message-ID:From:Subject:To:Cc:Content-Type:MIME-Version; b=WtWNA3v8sT+G342xNUjYmhPWu2SdKngWO8HQ4IZxziiNbXCFqfVv7bUGor5vvJ4w7Tn+7IqADT6rtlfNOvYYwXmKaF5qttb0ncuCC89nhGLTKn+gC7Fruv1FrhI/AYCCclf1tOX85z6o8WsQKP73eaix7RJ+7P15POuMBXQ97fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a+4wa1GD; arc=fail smtp.client-ip=52.101.125.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a+4wa1GD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0urVx3/pAjZh7rukuQ9lev7PAUZr5wnpo0sSrQpkmK/1E9MVvf2o5f3NGzq/sr3z4srdNpfyvFLlr8JS/1Syf/95+AdZQMMKEZYvMdFHKPguJ/kyyRyjHZJWflk+4pFO4MXl7mQ+mIqWvb968Gb1jON24h4+LlesTIGHykERS9JWEHyLeMmHoAuVV6GNzipTNEM/kQmpzOwbpSXoxBsgb5Ze/zhN72K4Zn77snFwW7j5592hZ+24d7DZvLGhgN87pJqcNYWQ7TpRpYAyzjiJH8h1ok2tV4M2/uH2x4WklFrVyR2onvnSz3qwnDP8tt9gQJR/Z5bydJEWwHHUpR+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTLOnZBQd3NZjP1LqoWr+Evvp6vo8WtdpPV0s34YUj8=;
 b=h8zZA8ySqtWW69KTAA7nuzF3qt2XHVjU4FDoqf1q85ARjPdhvYjFZlx7YFiNiDaqqF/Qnvq3dlTC0HeH1He9a0D2zr87Z/pJ26fmy6mNR5MwsqHYVbZzGvDum4ot0GF8NvwNf+AZCQSesIOv0q6T7UbaV7wS137rSp7/0eQAHDVM+obbwSCSjgEeEvmhFXOsV1bYXk29kww7+34Sc9Z5d6qkZXYTNODDVlqufsR92piugqT6RKz4OLHWdt3MC+0WNvVTh5//PH9/RgHPNLIGCLqORMjYRNWfbVP+myZ/8LyqTXYfzVBqcojbbGZrFYpEaxnxwsxHqr/r+q5Q5GqOIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTLOnZBQd3NZjP1LqoWr+Evvp6vo8WtdpPV0s34YUj8=;
 b=a+4wa1GDIqgCkQ3j0c/6lqoqfowzOhIIlEJ/j4emZuNhG/sNsB7ESqS43VIfGmVCGNfpJQyfTAB7+ScArbiNnsDpMmBRkIwn9gCAquAeDryp4N/vbQbXkNcSQnjDSqRShB7uUOiEmdOYBA09Fdqkrfuqd4tc0N0kPs1eepjzTvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5509.jpnprd01.prod.outlook.com
 (2603:1096:604:92::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 02:23:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 02:23:10 +0000
Date: Thu, 12 Dec 2024 11:23:10 +0900
Message-ID: <87v7vptzap.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-pcm: don't ignore -EINVAL on soc_pcm_ret()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYWPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5509:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ece1369-182c-4f65-c877-08dd1a53ec55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mT+darau1ixF8fhkreLOKmav5VSlGCJgmgQt2tb7RyKNjabBD/zb0s3m5bLF?=
 =?us-ascii?Q?y+Vl4vMdSNp6fNB3Cs6cQmbF0RjsaTnkbHo/eUb9bHG8DWKeSOi59ty75Sg+?=
 =?us-ascii?Q?56ddH1mpFc0d/S46tbCnF70sfSK0vk5MfxjhBa/+6Fg27S5SHiqZTJ6IWtmI?=
 =?us-ascii?Q?iOJF4pgPaMoYIKY6P3j4xhfg6PkADGMbbhAqGhGoiem1t348K/GZ2+LPB+ke?=
 =?us-ascii?Q?GRsmqpIiLm5vFMgkjAAd90RhVQ+WjYbYJ/KeLDnn7eut5A6V1Czex/xYeOEr?=
 =?us-ascii?Q?1x2y5rEUr4jVl02MFmupgsckavvqPJSKjOqoDrjqvqT3qXUAWBZ5KTQlPSTU?=
 =?us-ascii?Q?6VBxsf7XSPmmXKhmAuQZnoO4qjRzzLpaYTJNZ/Ig5VyEWjftjVTI3xNBPlZC?=
 =?us-ascii?Q?kpiGMwrcucqGcyxwmLkBd5v3KZGR7ijtM1sVSK7gTWKAuN1437k5iegeRiAT?=
 =?us-ascii?Q?Yql4hwD+p9B681wmRoQnE9VbDPzcO3XbIAtiADqRJ/M15RK0KSlc5u1i3oO9?=
 =?us-ascii?Q?67U75MDn28jbCEa0DXKrq2u604Hk014SAROQ921UZ8nrNoyirwYphwqc5l8K?=
 =?us-ascii?Q?YsfkAhBpQtRgIHZqnaH3fp7mF0S+L+rZc7SuzIvzj1pHDW1PmEmL95uNl3j9?=
 =?us-ascii?Q?ZzuFlH9r5L+UFS4S61fPZFBUnN/52jLaHqqs0qkLSFCpha10cKh8IjAYt49W?=
 =?us-ascii?Q?04HaquqcKWqCtRJ3/PPEkANC5Vrt1iq70ZvsrKurF/HmUjiq7KE0RP5VqXw9?=
 =?us-ascii?Q?QwAuH2pakB/FYDTSVy7ZBFX6b5PbxuXhMy1sbsMV/RczhHNkQ+PuXt4+P3Ad?=
 =?us-ascii?Q?+Ouv4RHhmaEdy1X4oBS0TIxhOqP00i/UeBy7c/uPClDMePVKtO/gHwXJf+jy?=
 =?us-ascii?Q?lrKcfKJuwD5/Rc4MFkBvXv6znfjcytufxvbmM0VYr1RHzl15urfveQ/JRtLH?=
 =?us-ascii?Q?0z0/s5jeEB+/sNzBZAqJHrJ6mYD1T52c4TPelRBHgeh9b0nY/myZSROMLgkp?=
 =?us-ascii?Q?YVxt1eOKuGgDyffurz6iWydPY9rq/R2Rw25pxYppHfHIScv52rBCsnr3WAAx?=
 =?us-ascii?Q?pzS3B2/FBjE3OXUgAx+Foc99B4lcW5emkHJX8UcJOxV8NbKUNasBGxmHJuoJ?=
 =?us-ascii?Q?lrYFWL/Y7vhgAeAgHvksha79BHqFofgCL/swgzefgfFA+gGkeU6mDlu9G83B?=
 =?us-ascii?Q?UOhsJiZGYjfbDNRWRP76BoaId4Z6b3+96dxD9JcltqR5fNjOWAf64Gp5LBM5?=
 =?us-ascii?Q?K6naVrmOuHqLhfY+gTWO89nJJa3bnQeH+mHgvjcm1nxei3gEWL83x9+YAamf?=
 =?us-ascii?Q?EUGWxXhP++vZtlea8VsBr12oMTvbAE+IH8IJhlE1UXlkjVXBobxNeOF++5gu?=
 =?us-ascii?Q?5xgMPObXYVBtDfPa4+dlelsoUXzJ62upLGixuiyb3eLosOGmVg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QFrk4MQqYqo3mdBhHvVL0GElM4Tpcm2lvubZ8qiFeDdU/H2CrZec9JM+MEmB?=
 =?us-ascii?Q?e+cR2tokj1lmfdDvhiru58GymPk831BBtkgs4ARJm+ZJzNgF1MGCH30Qeqbc?=
 =?us-ascii?Q?9aWvmriw/vcHf3tyIYeSYSQfbQDRcJaC+qECnlJ3bM/i6PZoVDxkFS3XJj1f?=
 =?us-ascii?Q?QlFk7BuY3Y51RdtBmKMtw3R3N/u0jpcNsNCUHq+hkuZ4tZioTb+puWRo58Bf?=
 =?us-ascii?Q?2P5DLCJI2JgcqT4rDUE7JIopeqIPP/WDBD+8qhemkjOc/1ajwMOxMA32GOOf?=
 =?us-ascii?Q?IZZBy2P/kZ9aZHqtpJs1czwNDP3ude4GrRdgTKMHXhUIO0THHqxl6+ZZ3i4f?=
 =?us-ascii?Q?ynW3i/WMASsexxB3V6PXiy9egTBYiy9ZTrAQltkH2zMQV0SnOubvXsZOGizr?=
 =?us-ascii?Q?bibJYwusi+os4mMb1pi2UuZM24n2SDNzUUP6Cyozm9oUeSXhPp/KLelLAgun?=
 =?us-ascii?Q?aBsG+pms0RoBQkood7QFinLuoLDxDl0gt32vpGYTPxbnufxNfy5US5SeDozr?=
 =?us-ascii?Q?z0GIwXVGQWX+WwRLPvrC4VnxV9OE8frw1ELWuJPLtbFARJojGyGz4kMx/VtT?=
 =?us-ascii?Q?9+BRJAbPt2rzErWOr/EnENNMlMabfU2arNVTaM9Ys2J9axqkEO3FgVMhWJ6K?=
 =?us-ascii?Q?mF6buzH1CpBDo43nltl+UsZJXrFVFreP2O6PuXox5MXPnSisl0ey/Ka/n1dL?=
 =?us-ascii?Q?2ic7Fp02g5o0jihT/pDoemUWCX46/PwvPwinAQCUe3sX7PqlOyc7F7v+tLkN?=
 =?us-ascii?Q?vTySVboRF4/Floeop+8DL48XSPUsQ8AxJnlmenbGg/694+YLk4NCFj0obMzu?=
 =?us-ascii?Q?w31K22JnUl36cOyWi4EoH8/T2dKg22MAFYVi3ThZlJAR1Sx9hltM0+/yFeO6?=
 =?us-ascii?Q?xwgRsnxmpfiAfxnI5/qBP+MAvH4p1gvapoAh9h8N6yl8ym1kjUKdRvtC+obm?=
 =?us-ascii?Q?/Wlrs2keVxE64xAn2OED60JoEb5FVvd90+LqhiHgJ4B5LXuP8RPWSeVKFAS+?=
 =?us-ascii?Q?fa70tC7Km8dAfJC8J/It+v3JZxkxEELkyvamOPdE6GiyPUSUceVNHKzHsxs5?=
 =?us-ascii?Q?VwJCmSdE9XvVzAeWCUNnqlQHXI5HTcdCmaNv/tubNc6j9FmROlhrzVSl+i+U?=
 =?us-ascii?Q?TtZ3OT2MdE18U8mpQPC9MKugCM+49NVN/3HT/xvIcf2i5bpFSl4PeK1cA3OA?=
 =?us-ascii?Q?yQ/Ky2ftRSu9I2tA1OMN5F8PEXQIokIvEU6psoclKsOwNKOG8ukF4KE4PnVs?=
 =?us-ascii?Q?sS37h6q+LYHn0LjuGZ2c/GtT1IX8H+oyPWLTJN2VKQv8tQMis3KwILEG6d8h?=
 =?us-ascii?Q?JARzTvg1boa+Y82ipCGzuZs2KelQphNZEgNki5H2O3qIT+q4A7otB9GTS6JW?=
 =?us-ascii?Q?FzS0tBTWZAWnw/NlqVXrJbqtAkVmRDJyRS7iWg0WjiUl5c8JiW39/eV6ZPjN?=
 =?us-ascii?Q?Ou+T15//oZNvmlft3hMoVKD3WKO8dKcQ+h8nfP5ew0PExonxdJxWZ4qiR881?=
 =?us-ascii?Q?7l1UDoE4uy/vvbHBLNrOPsUkVRBEHyv99FUWXBVR7eCEQgOyFyzr9eo7IT+L?=
 =?us-ascii?Q?EUjZOf/LtMh5RKpKdrfouOk6pL2xICRqWWFNgWAuiZeT6TkvxPI+AFtXwXWe?=
 =?us-ascii?Q?YY6JI1xF98P5TvIbyrDnxkI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ece1369-182c-4f65-c877-08dd1a53ec55
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 02:23:10.7617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LyX2Ac9Z15QOWIFP1Xj2Flioewt5o2yesqTQ/vrLsWVR8jn6bNKAufSP17URj8YcR8CRGarGUy5+uemD/K/w7h0G12di7UTeqDNH/yEn5Gh9NfdVrEpBintTZmtREg0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5509

commit 1f5664351410 ("ASoC: lower "no backend DAIs enabled for ... Port"
log severity") ignores -EINVAL error message on common soc_pcm_ret().
It is used from many functions, ignoring -EINVAL is not good idea.

The reason why -EINVAL was ignored is only for ignoring
dpcm_fe_dai_prepare() error flood.
It should be handled at dpcm_fe_dai_prepare() side, not soc_pcm_ret()
side.

Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 1150455619aa4..7ea580f0a6f7f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -38,7 +38,6 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 	switch (ret) {
 	case -EPROBE_DEFER:
 	case -ENOTSUPP:
-	case -EINVAL:
 		break;
 	default:
 		dev_err(rtd->dev,
@@ -2560,8 +2559,8 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
 			     fe->dai_link->name);
 		dev_dbg(fe->dev, "ASoC: no backend DAIs enabled for %s\n",
 			fe->dai_link->name);
-		ret = -EINVAL;
-		goto out;
+		/* don't use soc_pcm_ret() to lower error log severity */
+		return -EINVAL;
 	}
 
 	ret = dpcm_be_dai_prepare(fe, stream);
-- 
2.43.0

