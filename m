Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A651B19CC39
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 02:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757297327; cv=fail; b=j6zDzyah2AWMfaumNpNGw+SHSCTOIosMFZuv02H5GuWPr5zQCIxFiqABvFB2yCXH67pt5AVZp3CezVOMBcvmTjtnHZQDeX85uurk8tkEIzJHAyqBxGImQoBv2PmERrPCv1Ugx3yWundHEIn+ZpIUoJGiwJsP4ldeaA+5EoHp+TE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757297327; c=relaxed/simple;
	bh=ZtVYiF99XsC7TjNF7AO1763velda7hgRdmvDxyph+qc=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=AYQU2N6rRO5nwN7CzMP8+LQ3dVp1lXTMbLhrYSbKpzCOX32oc5z0YhbeJtVyOlxd8GkcgpNR8YSu6NURbsSqQQuOLRj+mgFtGv0lsHCYvzU/FVIWawtRHAaTzkFAabbKw52/BM8K3BGo19W31YaW+y3G4pvmP1QXRufOMvVcAw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YJW3KFII; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YJW3KFII"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i64RdsIIXAXTa/Qmnw7PE1QhFyYaJzAIgvV8ZpCz92QSwIGFoXgJDElTDA28nx9JJ8Dm5nN34gVOko9lWFKSe11wS52GbCkAYysfNggXwMUD8dnvJf6iICQT9t57ZF+pz+6+IClRH4CcvZ/lDC9KoCxlxbMkYoUlYaMzsoqclTnuBgBFkK8T3hAr6a+K6Y7/oF/fI0BkeP+YiF8SnWOMoXboUL5NLDl3vFDikTc8+ysNn6OwE+120fuqQRiCgepSBhNpeOML+AJRupWHNpsIL+QE64BzamcqxtypgloC8K4YKYRiHIiNRADGbLyon/8R/9JAOlEkuBCfs+uFHPFV0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pEYQ86Y+cG4chgMfg5Ckh1fMhQRI5wa+tus/bof3hw=;
 b=flpxQaAjVFRk5wuTLYcGpYPWufIwGtUKQ2qeS0On2SzySmNgAoQtVHAckAD1PsNZrpGyGcw8kVtqOjGNcHdEi97boq4OVi1nmXvkSTM56eSxbndzELTQ2iftnROJUsR3xG6bkKkk9pSixUHw9zji0tNOrQRbHcSfwHlbL7JCWXzVOv0mhTGL03Fo8tz+PEMKkQUS+YY+fhwt0xOp19g5gEnJTTQfAM8Z7DGvKggcJTNnpLEUhqLgkYlZu7Cf/jyc7slSgMUebjYHUxRL5OnjqmpSzNCy5z/0jBDS8eqv5kIOk3suuBBZ0I7VB5u77IJjhasJUxEX6/XSy5xlEz4p/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pEYQ86Y+cG4chgMfg5Ckh1fMhQRI5wa+tus/bof3hw=;
 b=YJW3KFIIxenS759aVwxQn2c5tWfKeCh7KBSMEKB3CBbhGbCK8COMkL9CARq7yoGnFFy2ufNIEKUcdJko92O9aTkceEZ0KnfyhYxV0mADrW/SpRbkujDNPLfYYM1simhD+UFbHLCz3dPN9ZZ9+F0vJe1dkH881t/8MaEvRggpgEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9666.jpnprd01.prod.outlook.com
 (2603:1096:400:228::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 02:08:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 02:08:42 +0000
Message-ID: <87ldmp1ys6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/4] ASoC: renesas: Use guard() for spin locks
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Sep 2025 02:08:41 +0000
X-ClientProxiedBy: TYCP286CA0270.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9666:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ed6f8a-95c9-4e76-c909-08ddee7ca200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rkwdXu6kdjOphK0yW4lruyGV62khs9E2KWieSrZHADD3FYxym6DHy2lGQjMP?=
 =?us-ascii?Q?nJhDJGvT5jd0KBy/HuEuplPuxTSXDPnVGzNBZgVteNihiLuy2eaKWXPC0LnV?=
 =?us-ascii?Q?uU7w/CWAdt7A+rQdAOyGXScR/ygYLATMapFjfsIw1vCAfBlpE1IVmNt+hlEp?=
 =?us-ascii?Q?4InDKr5JfQ9COOQ/C6t76SPeWFkGw0KyBJIp8LMaP/b55+AS6aNoX/SWfhBa?=
 =?us-ascii?Q?ijzbmgtc9xGKG+ik96if98A3X/4Yas/uwg14tgiX5pZo2GhDvI8/4iy8tpLE?=
 =?us-ascii?Q?cb+H4D33La/hHZxvTOzgWQzsw3QvZrEbCcHu9XhRGEiX9peqD5tfmoKbOtY1?=
 =?us-ascii?Q?8wt3GnWLGfpAFqZFPR6yEwO5+76vepUqY2nM1rdyFzUJskwJKFBdvbTzchdg?=
 =?us-ascii?Q?9rW5+O7ie9Nv4U6xc+8dBxwgIhk00ocCG7bMniLLEd/RQdYbvUAH1QMeDdop?=
 =?us-ascii?Q?juMIa7ZroPtuwzZ0x8RqFijeiDKvNG2qA1hV6XLVshRe5Wbk1j29KhuzKsNE?=
 =?us-ascii?Q?DcH6cha2g/a7Y9vuHM+Ilyj4DBF+9DPVtw5X6jqGquL1f6YcojlR6QUeDv9v?=
 =?us-ascii?Q?IepqleqeS1EevdvlELsYF6LRF1U3m9HcNX2WemDukIqi2LD+LqhCw7uycfC6?=
 =?us-ascii?Q?V5eGJ2U84/00fZvd7UA1aAr6u/kra0qv0XIpe3vV3K0n7o81Y8t2h0QChCKA?=
 =?us-ascii?Q?1d/HOmOXH0AH1abBuBNr6C2wN2GwQ4nXzg1WKHKSe9oB7CU+XUYfXVKFgb3x?=
 =?us-ascii?Q?NCODqNkUfTsO/MpQOlvKOKJgJNMwHddcedzRvBg+bsF35Y+XLKLUPFjRQK8h?=
 =?us-ascii?Q?0khHggPeUMtBXzf7UpjnDB/STt/eUNZf1zyFYC/L5IR6PdxbdL2f2l2S/hq9?=
 =?us-ascii?Q?iHKiYGBA2Nsv3anD9/YeQC0J8qCDi3aPbIhxYtfNhgDBJXrF4zZeIRsNZ96x?=
 =?us-ascii?Q?3XYwA5XNLtmBFfWep6DnkU4gc0YQ/k1Bei/RQjXBWmFS8N4dI/A96ByIVyCA?=
 =?us-ascii?Q?Af6FR/vsqTZsQri9erKLcAOzFXv7obaIXR1uTh9j+LNDIZeYPxbVovI0lf9n?=
 =?us-ascii?Q?bGXqQC6wSzHzkT5ZmirkLNUGzFhres9V13BnjIxK9lZ1twwO+iQGtU0Og3Ns?=
 =?us-ascii?Q?fLHbmBL3KLUqC6y6SzYqx1z10/HjS5+WPCEUJk4FVfoBBFv4RZW6KBaPvQQ7?=
 =?us-ascii?Q?WcmGASnX+IYtBDoGveMQiSqRdvtnSWYGJA9JtJFuj4LsRBScNpIuFAOwx9Sp?=
 =?us-ascii?Q?+NXAJMdeL2zClC0TxBu67pArlMI9JEe2RRYo9ycwU28dWqze04+0G75E4ik4?=
 =?us-ascii?Q?tqhpokfhwaq4YkaiLiO2pgaExgE3KYbc8jFEbwkLTzCXKE5PDQYqsEn15qTo?=
 =?us-ascii?Q?+rNtPbzkCz5w/GC2012Vq5l2GVK36T0/KuM91g+QwkT+nf4hBrZz/h047zYZ?=
 =?us-ascii?Q?2yNOiKsu+wK6dhHBr45K3c/FWhi8MpOazb7u/1kaOi3LUgflGn8VcA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6JAuq+KpP0q8hLouvygdkqn342QRUX5nY7T57FIlRm5tgOrqjXZ53lFoeVyZ?=
 =?us-ascii?Q?hZ7QZ3sh4P2q4ALFvbdy0UkkbvPhOTjISK79S8ZbwywNCsFwBW2LJKMshTZf?=
 =?us-ascii?Q?GoIA0Rib+7TwY1fnigjDnbb0RWWr6F/fVjwjvxikPsEvQTy4IJTBshE4jreS?=
 =?us-ascii?Q?JmyRa4Mi53W+2cHhNaVzItMzvn0WnU7Ch7gQIXYHKLxXJdsSzq3vhEqPCDax?=
 =?us-ascii?Q?ETaIhIbtHjA3ZBrqmrv77u2gP+y1lhSDGQvVY6i0wCz7I5Nnvc84ee2Bgxll?=
 =?us-ascii?Q?Evi3x2nQMTi7yyWH14qzAHPUlwBexL59Ni41pWqNj0NpZB+qgtypYJyOwWAD?=
 =?us-ascii?Q?MYYZDpyasRgqQYxN+2d9E9Kf7ljHytyPNwTZURXALbAcOCl07TJpNcgieGPY?=
 =?us-ascii?Q?3UBURv5Xl/Uc/btPnqHdtNhQGyM/20dTQ2hgFIyagCG75SEpZK2/S1en6sDf?=
 =?us-ascii?Q?ZyXorzixB2gA84BDDVqf/u9H/b6TNJ8PcGy5cutnhEEls1TiZWOs6SKLMeLJ?=
 =?us-ascii?Q?PDvqwBpRIZwoCdesZyB7K4Xhv9laGxQf0KHCn5eYbC9DPaWg8USbMp+/Ma1+?=
 =?us-ascii?Q?izDjbziruCFmgIHmOUi1u0INvTzT+I4FUsZX74CpGJ1pe7Qwdrl71ED0h4PU?=
 =?us-ascii?Q?7/r9VDuroMUFLPS8U9M+jq4xAonpJBwko2di9PYfxfNqfdyajQNq7V36g0ee?=
 =?us-ascii?Q?DTwTR0lj8m1JSBoeOWWnDB//hvYNMydmOF5LaVK8YiQPyjhKilVgk+Z49JT+?=
 =?us-ascii?Q?9VE+1C0Qr8jyfGtPLXJeV99B0G5+ALgOcFXZ4Oed3/Q06t1I0TnbIQzAWIUB?=
 =?us-ascii?Q?FspfL+kRaDdNM8yvYVXVmDx1rVReSodtQOuUYeOMAbjW9vmxlrRdhtrWpsoE?=
 =?us-ascii?Q?xXO1go8XTFAl8tenEzz5a/txceofPKdzq5/CIHNdax4J2ZoNSOnZBjPexc1B?=
 =?us-ascii?Q?5dhNkMA6jFUzDd9Oj9dNX7wtGIZFF+czJG44EOrWVGOm64Do/8u1qA/vqtDp?=
 =?us-ascii?Q?+N6yszGMDrZRwlF0JJHELoMVy4hUIMXwpxvUOE4rGfQ1MKvNQPZxBf5x+1EZ?=
 =?us-ascii?Q?bt/skLdIm5wVbSeq4las32ATb9a20O9OqbS/4GIp4gI9LFHkylZercXodeTI?=
 =?us-ascii?Q?NG0x2jkYNzoiUIUNyRpDJNfpqLnXydE6ww7IGnVKfW/KM8CrgNYa9IDJYBIM?=
 =?us-ascii?Q?QCqmGOzWbXTvZ725Ael5yZxF4wPSLUjDb1aZygTiwZ4hLoZL321+OUnvWalS?=
 =?us-ascii?Q?mgXruVcSmfxkx14PBT8mPaYXaxFi4PH77ASZZOSkby2uUTNh1pyACLuSZAWp?=
 =?us-ascii?Q?MXM8ZZij7C16P5UMRZOdiR2mo5F+c4o56HE4nuYFW8PLKih60ZSAq6cbig17?=
 =?us-ascii?Q?iqS1VvfA/UDBMBFSD+kdeOl9g8WeRflt5PbAYfPcpSzcKxqxUtAoaEqq8h70?=
 =?us-ascii?Q?8Ul8W6Soi0Yoyb5xOqwsDV9c4kS0YX6z7Yfc/+wvaYUk+VeTQGkwxs8PVVxC?=
 =?us-ascii?Q?9k6VMYp41BmTiZOIqqUGdf0qf6w9AIbOxopUrsyvOzB7A/dsyFWUMmG/wkJL?=
 =?us-ascii?Q?EwqD4exfYxqq/+oHtQljV4Z3G5IfNCYmBJxtFs6/zmgAjTx4OnTkXvE66uwg?=
 =?us-ascii?Q?k5TV/8KGtelwR/fUhOterjQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ed6f8a-95c9-4e76-c909-08ddee7ca200
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 02:08:41.9449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjSS5itspyBuoOME38pSaAhEMtBHqtSDQowhDSwTBWw+qxu7hOq5iqMCvsQ2d3SMRn3zdGOJV0y/WCLuXt4z1bL4ws3qAYD9Y24UCpyhzTAsIYb47YSuWDaak7mDf7fE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9666

Hi Mark, Iwai-san

This patch-set follows Iwai-san's guard() update on Renesas drivers.

Kuninori Morimoto (4):
  ASoC: renesas: msiof: Use guard() for spin locks
  ASoC: renesas: rsnd: Use guard() for spin locks
  ASoC: renesas: fsi: Use guard() for spin locks
  ASoC: renesas: rz-ssi: Use guard() for spin locks

 sound/soc/renesas/fsi.c        | 30 ++++++++---------------------
 sound/soc/renesas/rcar/core.c  | 18 +++++------------
 sound/soc/renesas/rcar/msiof.c | 26 ++++++++-----------------
 sound/soc/renesas/rcar/src.c   | 19 ++++++++----------
 sound/soc/renesas/rcar/ssi.c   | 35 +++++++++++++++++-----------------
 sound/soc/renesas/rz-ssi.c     | 14 ++++----------
 6 files changed, 50 insertions(+), 92 deletions(-)

-- 
2.43.0

