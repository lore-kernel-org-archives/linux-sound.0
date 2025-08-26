Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0310E2D3A74
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 06:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756189810; cv=fail; b=JZsfVGALmNCj0Tc/8OjrJNJPEk5SJQO2FwTfLxX8ljYasbJ+YPk+HmbXU9LGdiN5jmLiPLwEJgIWqTMe6HAy3eo4oicvyu8HCxLDUjJigTZoR2A4gauLyrGkbQjHPXkBxfVpTK0K3twz3c8HjnNeKKBeLt66Wx9Shk4S7YsKA9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756189810; c=relaxed/simple;
	bh=K/3NtagHly6z0q0QWLuoARdSJcdaFW0ae0hm1hQvjPE=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=lKXTLcJ35a+izGczp0JmPDtbPzW4XVthda5dp5dEJHNkDxnH8V+koUyOEcc6cHNDUb2Xd/T6dA79q+Xrm6f4CGuRZb8JOmrLKPUYph5MPWCU244Gjwq+XaR0rw2k5LyHOo/TpwwEzmT6d7FHsDuR5uIpd6G7dNAn2y78AthkkBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JBLkaTsj; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JBLkaTsj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RU2gJtEbnmw2BZE2cV5sxu9hz1VKZWxwebAp8prfXC2PDrg/PGdl/UQPmH2VkvKcXMyr9Si+9fQXBHQ3LMKALyBMRYgtllbfDZgAa4H2FYv05ZyE97oXFFxnL3atAyfXaAV5ySCZ/ftrXz9rKGr6kxn3KOjvNVsxOcs6dvH8ZI3IqNDkeQ5tC5c0HUeouv7yRaKY4H8M59Byyj3EDxSdmgbySfLbKW3McRKjqZHhdvHO1dlGgrXFrO69bJtR5SKgA8vIr6SaRNzCJD4g31OSme48vh2P2GJkh0U2nU8mPMQuI/h55bHSQaPRnKS3mshPmjD0sPreHXaoDJdwBV3XWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaULjk1uIkXgH/X+4jdvxncXJCU9vm+tPSPtJZjP4As=;
 b=uzA/kkkrOTNbjrP3Uf+yPzhugPwkGcgFlnuoYE9YcQOApm27MyLF+7SWRtuTEwJ8jf1+whDv7I0afIOA6nXft1McHOfxNdOhhJCY0Q3OxZIEaFIhhdB9vB7cwNhpXdXiQ355FU3LQT08mBX2Kz7sJLNYfVLy18NiLN0kNzKF1ZUFxcKdMRfq1Z+sMgZ9LFJXqQ0gInspOujKwPRUjChsWhGanJlxbwJ/eOxLYZx3t1V+RNUq4RUrn2motLfbsysBDvsA5kfVOr9quDYGZctadwLVqlm1icKJjHRkxb5jTCIZ359LdT7nhzd72NRYuJ17AT/YqSitaZ/fEp4JUbSOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaULjk1uIkXgH/X+4jdvxncXJCU9vm+tPSPtJZjP4As=;
 b=JBLkaTsj32SlkFzEYFrwpy7nnj1X6Mz+PFMCWkOyAUPTwlcb/PbtLpVH9kUjhVIGQZgrK51yvP5z0Vee3T8rDUhJn5KQVUPGZOPczXoBfyfj4gwW12q7INdxWwXPryGwa5BCl2d/484bWoIIbjZb/aEksSk6vJn/Q0RN+RP81t0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12240.jpnprd01.prod.outlook.com
 (2603:1096:405:f3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 06:30:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 06:30:02 +0000
Message-ID: <87zfbmwq6v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: rsnd: tidyup direction name on rsnd_dai_connect()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Aug 2025 06:30:01 +0000
X-ClientProxiedBy: TYCP286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12240:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b9958a-3799-475a-a841-08dde469fce3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?o/3w8FzxL29PIphKS5LMjLiLaAx6Mgz/QS7ar8T3RiDxSBVO77fhBQDikYrU?=
 =?us-ascii?Q?4/sblwtLThsvp0gWnaMvZqwrOgwraWU+sYHOGCcy1GjqT1FfrH1EDWY3hvUC?=
 =?us-ascii?Q?I70GMhaYZCozC0tp4e2pSOqYl1zOoPwoExBlKMwzkdeeIUAfUoi77iztubWB?=
 =?us-ascii?Q?pGR2Qi2mMPq+UH6enHaD6a8VjFJ+Iz8TqKhOGAS0ViCoD20bP4cqMwSnmrHs?=
 =?us-ascii?Q?/yBCH4GA3sfjydi14cfawtsEHF3Ndr5V7yTRj91saKP77/SeJPxxyhxukOM5?=
 =?us-ascii?Q?JdniEqYwLDmpiUYe4Yc20CDF5b9cQoKDPxCAwUcTDPGCYJAGx3eW/ZRLTQLQ?=
 =?us-ascii?Q?lrrVrAyjdvUzx4mUP0zDjfkVc/FsKKVR8lJ6cfgEE+EKDQCvHvL3MWkBbbO3?=
 =?us-ascii?Q?V+ADkJBsHKT26EvJoY2mveKAp5qxznJTbmVhu5pktfG5BU6IWF8o89C5mbZa?=
 =?us-ascii?Q?gHrAN8DGdqrrV010aoTcZEoxUX9WefHuRIzTd5OSvpjvOPeSw5vDcWJaNMQh?=
 =?us-ascii?Q?71QJoqfNSXgOJ/byIayvM3EEuL91JgfI1xpoEJZaQEIb+ibYz41HPLSlYBsc?=
 =?us-ascii?Q?ytYDtTteqi9LzGsXCN4HWIW6H1iLivvSQM187HOPdP4gIf16GIUif+ofWZTP?=
 =?us-ascii?Q?mpHroDsMUrgWyIShjqoIKt8DwjY4o12rliFkvgDHt3Y36dJX1Jq5HvMrp2h4?=
 =?us-ascii?Q?zbLyCz794zCzTi5xllPzaLw9aPq/9q8wbYrmJxWr3wDcMKcEc40/jiS2USOF?=
 =?us-ascii?Q?NiU+1rn/8m4/DIjP+C5PoVUuhp+pA581Z78ViEn/j9TRm0deqgqsQXJF22QF?=
 =?us-ascii?Q?ycEdc+lmrRVoQWxlIlwxIJLVctP5dLLmv6huoD4PGPgu+wc/TZcxiUStIHi2?=
 =?us-ascii?Q?IkJBOWoOQn3+s0hZnXV38cUBTPhypiRCTIDWwX9eWv/tMJ17rkmX0m6YQZS2?=
 =?us-ascii?Q?7qsd3YFvdgBW5SQzAfedYfpsaV1/l/jqFdcDd51Nt9+gTF1PRWpFWgjMUJ8Q?=
 =?us-ascii?Q?iWp4QG1pOGpoq+gDHuBEaFzGbs91mD2aEFYcTikdmGWrMkYoxiGtW+4fYa0m?=
 =?us-ascii?Q?69pQps+85Svj3oCANSboAAzQW+vSMhDbR1vd80Rkb5lKxla3EpgicObUiA95?=
 =?us-ascii?Q?0iwrSb0DrCCs1cVfA5WSd0xj61E+HsZEtKMGVMdnrRreNpVADU3A6aMoRBkm?=
 =?us-ascii?Q?Pfw+N7Z+BAjeitG+csNwr1/Xktp1c+tFWc/JBw6fT9YX98TG3xEMwLEiXaJD?=
 =?us-ascii?Q?+w7HtCNrDcNxI0LEf+j54Ds9bpV9SqL0VwgaMRdWyGvNdMQuBArHl6EnSMEP?=
 =?us-ascii?Q?zrthugX2dMT2QV5nyrm4NcCcJblEZ5TrULGZkMsxYWRHIl+Ztlgqneg+1RCD?=
 =?us-ascii?Q?Lw1hFQ4AJpIreu1K3P2+1TYg9EwHeWbnT8OJcF8C78/xfp+4eJXe5nIN9aAg?=
 =?us-ascii?Q?u9/jPu3Wjuv/n73eZtnJr/dvmSM4MsSqCSXJDDLm590WIIe4hkRklg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?qcNQVa+H7vxU7fxbs7JxICKdHGCY9f1B9yo82opYLok2BJkb8Ev9N211ITQ6?=
 =?us-ascii?Q?EOJJCW44ydwK7PHojo6ISBjKultrK6dW2y30NA1UPiiUZldbM8NWLScj5rmg?=
 =?us-ascii?Q?h8UNXY8p+VkrHhfQpjh3eddostxQ5PdsW49DSYRHMB4d5MeZnW+AVQDVd6OW?=
 =?us-ascii?Q?NVmSExxWAwrCGjdorgu/ECo7Vsa3hJwNGbEfUKMIkgRqcdiqnBPqqZwFIBwu?=
 =?us-ascii?Q?RQbRyGd59qRkgpAPIZkTbMJd2w4m8mIVIsXZM3PVmQ26kiwPvZezQWbawy+d?=
 =?us-ascii?Q?f7cbkTBxSLnNxInH0saYpXptTi6jFtCZ191HnBGt4fHTNBTRw5XnyVsBIxUd?=
 =?us-ascii?Q?q60A3o7G+cTeB0H4kb68f8O9uQghvpwaF1h0MW9f+VzdjK5WaxOEUngWal4S?=
 =?us-ascii?Q?5T5l3X+GAhPYRVtCR4VKcOYD34W2xFN6s61jNCUuiaYf8BCB+V9mrlun+0ml?=
 =?us-ascii?Q?QfS1B40ZecfF6hXYmatCQ7Nzfm1ps6ld6xPgGtbjSurSqH0948Go6lMJT0C3?=
 =?us-ascii?Q?AyKSQ1bfBLfK5WCIkwORzblUFLvUMIu2p3YgjLrDqNyzGvI7oJB3SI3u9YPE?=
 =?us-ascii?Q?1afbfrztWem/Nk3HgieKalMgi5uzdLxrM1Cj4WM+Aop7UGp99Qh2XTvw/GMC?=
 =?us-ascii?Q?cIWKRoCWDdBM5PxqTwVcXPq07oxn4jSP0AqCjvmr3Y1jv6BJ1d3lLJgym3CG?=
 =?us-ascii?Q?JLPV/P7ZnU0hJqqR9O0ipe4zd8psyYeEW86ERG2dwsfGv5pCvJoect6FBVZb?=
 =?us-ascii?Q?t8YR/F0/D/rOv5zDZ0cdxg3Vg1ibcKMSa7LA16c4dbcmAfMQyv6NgkhguY/K?=
 =?us-ascii?Q?ZlD8pdJmQ+3VPuUEWwNrpr4SoxbnpF8lNLXbizLb6dS0THFjYGdrjzWsY1Kn?=
 =?us-ascii?Q?+H2dEt3kjGiNNYv40q0wvMfolfajmisCaRgJ8VDGjZf3JqxgMwRf0ujt5rbG?=
 =?us-ascii?Q?2nGw6CNOZstM/P8WjRbmbhFFZoQUh1BYp89InJVPpck8fCMhDOLQRSaGoklw?=
 =?us-ascii?Q?6gNzHAfYxyqqdhpWBclPnyZPNXFVm5s+jroGa6upCFijJT2MhjdWqGuS3At2?=
 =?us-ascii?Q?l6oLor7544SzQlbYCVWbhTKe0Om8JVz/hSblWikxoQL3c+hXLLDeQ+Cif6+s?=
 =?us-ascii?Q?Nxj9KCvXFWDWWf8VWLHFdL6WZg8CAsAAEpE2crNoRy4XEslnRUQU3XaPajMh?=
 =?us-ascii?Q?okhA14emF72pUQwIoW3tFfZTYu5AL/MVVpykKkaWM+4XWIBP20JJPuINf3xT?=
 =?us-ascii?Q?cdjmFQfYjX/7EE7C1rxHugpjdeziKM7//8c9El2OCQcWqmk3ZcD2N10uwTkP?=
 =?us-ascii?Q?GGToe+3USzCszVzMXmv33Au6K6017eNaGEZCDwNmLvYJwj83MpS5GST2dRua?=
 =?us-ascii?Q?IURCDSqpHSKJvtIVQRO+cBBcMc2IUAYvqjxAqjK/28gf7uDtGBgA8lXcF2uJ?=
 =?us-ascii?Q?rF5xCVowccg1vvf1ndiHPQ2908qWpuOsQcbmKKBt4w2gTs0dVHHEvIjXxNGM?=
 =?us-ascii?Q?P/5f2N3DRod5dXlDqmjiVtZpRknT2DMHoKwHviy+AoY5UVAi4fyjiC9B9939?=
 =?us-ascii?Q?uXDC1hPAusFpl0JU2ldvBfRKzUegDzhzHLRe3laQOy+fxMpjy3ip5AhmgvYN?=
 =?us-ascii?Q?Bjmo4nt4xJXZHRzMBvGgAQg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b9958a-3799-475a-a841-08dde469fce3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:30:02.3370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0MHJDYct+B8y0VvIjtpOrEqK4lXGdpbxFu0kVvm+Xtk44AaO9oKexcdj/fQ+BBbdFxbu3rLgVo0tM2vOmy/JPuen0AozxnyCahE7pieqaWK8nxx8sNDRjfq1k0S+F4y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12240

commit 2c6b6a3e8b93 ("ASoC: rsnd: use snd_pcm_direction_name()") uses
snd_pcm_direction_name() instead of original method to get string
"Playback" or "Capture". But io->substream might be NULL in this timing.
Let's re-use original method.

Fixes: 2c6b6a3e8b93 ("ASoC: rsnd: use snd_pcm_direction_name()")
Reported-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Tested-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 37d954495ea5a..9f086906a2e5c 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -597,7 +597,7 @@ int rsnd_dai_connect(struct rsnd_mod *mod,
 
 	dev_dbg(dev, "%s is connected to io (%s)\n",
 		rsnd_mod_name(mod),
-		snd_pcm_direction_name(io->substream->stream));
+		rsnd_io_is_play(io) ? "Playback" : "Capture");
 
 	return 0;
 }
-- 
2.43.0

