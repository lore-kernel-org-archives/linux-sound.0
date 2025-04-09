Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011033.outbound.protection.outlook.com [52.101.125.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96718C1E
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 02:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744167404; cv=fail; b=TCrguYvZonMqGBKUewEDAp8m07b1pu459BlFJMv/bSC6JzJboFU9louT0StDJ/fo6+CbjX3N4tt/D/rHLwc4Dyt1qzuGLU5U47SzapyiamnrJqIyD25iP5EuXONjOoa9OeZiEZ9ZdNWTh/yPPVUn4BEwedWA7gWtBgR8eHuHxkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744167404; c=relaxed/simple;
	bh=RWs+a+NPgQnQJMMjVkTo1S2zwTE1j+mxn+BR4zBNobY=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=d/a187rZM4x+zBy9eIXeAOvORkhvI+7qxJ7RMMUXiDxBkeXc2ki2+g+XmY2bsqJqZ42DdJEA41BMm1prbHsqouC3mI/iJ6wAYO6ofxDprsN+1zIw+aZNQkD8cO3HCGCFGolUIcpksL889tHFDEaGSPyYhuAWYxxt+aFhtoHzZWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eRvQ34eU; arc=fail smtp.client-ip=52.101.125.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eRvQ34eU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGa9Pnt/J4QqnrteXZuzPE/AKDRsG9l6NLcO5+ziG3fkBoD0GhMlNGxkM1By8qk//SqtAqLZmqLXSf6dXMXCE++q7OQx6T02IZSUAl6oLIh0F75cnVKOmhBwu0S9LzcHWed4wq+mPAQcCWXOau2+sz/Sh91qFw/OOLXJAQoePpOlNPjB11fWprFHjj8SfWgTNlr5tMBH0BLwhFHLmnVfzujsFWUhHhG7p/UkoG+g8MU4x08olUdeNBsNFU2PviPA5FuTTZXgFs52n9Q+TyG2Hy5SU2fvkoNZRSaLgXmmAHhP2fJuRI5yRUK/vktUR+cGtW2NT0J2XkS2bUuwFphJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7q/QnuldLiVdwGl6oBdEMZ6nLst5qhFfRDoD54rKNs=;
 b=Fxlo31F0P5HFNseUX6K/XJzlJk/LqGzlBYtrVtxgLNMZz27fgCQm9anPcgfmpLPOqBIkdQo4FtPLBJLM+CXPME+cjohe+PQkC41TYb/s9eIAWZ4JU5NN5uL7f5i8whY/D5joftCsCbGJYlIHnVucY/pKgLA890/Wu6Y5arEfGbnAKgV6Iw7abIqKVwsO8hdXHWG3Dxq4s1T0dWoe1lSTLAdXRzCpJjCB/8/n+SSTNCiuaAgFoAgbER3sMCBFuAdpmtQ1QEln+wIRkfPuzbw+cU9JKEbLLqCDjjTiftyX980rzG/KXDHxUSpqltvoo2DkK0oq/hvYDh8deIV5dyUuNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7q/QnuldLiVdwGl6oBdEMZ6nLst5qhFfRDoD54rKNs=;
 b=eRvQ34eUelSyX7Dcqj/ksbMRsoCBtT1SAvyz50biA6f8AFM+rYnCUy8Bc2kFUZcX5QNJpDBMyTej1IyeVfbJimRdlB0yE8kba6w8BblX+fdInHc5Z9nNyVUY0jMGWl8Tc9d3SZJxwB5AIBS83RUzwdc20jyqt4oO/z2cVR9l5DE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY1PR01MB10785.jpnprd01.prod.outlook.com
 (2603:1096:400:324::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 02:56:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 02:56:34 +0000
Message-ID: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Kiseok Jo <kiseok.jo@irondevice.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Benjamin Bara <benjamin.bara@skidata.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/7] ASoC: use snd_soc_dapm_to_component()
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Apr 2025 02:56:34 +0000
X-ClientProxiedBy: TYAPR01CA0193.jpnprd01.prod.outlook.com
 (2603:1096:404:29::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY1PR01MB10785:EE_
X-MS-Office365-Filtering-Correlation-Id: d74174cd-fec8-44d9-d8b3-08dd77122354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eN2IA2doVzTYQyug//Rm1zCiiEsOi2ZPo2k7JDeE9HGqFimZ1cXvYGYh+PTI?=
 =?us-ascii?Q?O5sIG00h4iX1qymaZEDXYActD5PwkXswMdUDiAs/gsPnGt+c0o7/wTAsu1mF?=
 =?us-ascii?Q?0l8GOX18P/Wub7IxKsZqdGCnlfKrmAhYa52yRP1AUU6Yd6lfrws/aD4ozv6H?=
 =?us-ascii?Q?+uGvdT9zMBy6+Kl6CleTCSYzKq+VdLY+ORbLbwX+H+Ngu9pPZwhFFjFy1qgc?=
 =?us-ascii?Q?XwA54tdgc8gPL5sxKv2hJUa0bDFX94wI0fXMCMG5i5w7HBLaJ7IkfTE6lDwe?=
 =?us-ascii?Q?oZBL0/SR6wruG5b8ehnVGGod1mEXtSpulz7dUg8i27z9+JJtk32isk/eUun4?=
 =?us-ascii?Q?j1lSSdRKDj+nKae/AxpSCWF8HCx6PzCt/Ojt2NPke68W9dS4UKSdZC8EaGlF?=
 =?us-ascii?Q?6zbtjbgzbsIeGJfFSAFEDOS+uMzQqCvM1Hujips1vCyRxA+XFXFWpMj6JT+8?=
 =?us-ascii?Q?J/jH0H6a33Qhj/vV2VJO+hBLk7VQQrod1/RTvctpjIZS+5ro4YLByrTPCQMO?=
 =?us-ascii?Q?F0aSnqCRaDvVPmpeoYrGuSbJkU7tieSvGQNxoKabqLSHwID6k7nCdXpaqX2k?=
 =?us-ascii?Q?feoyXhwpr4C6s9TDCLfDoVrWlB5tGPR0faMc8zoL9KriJSm4vwwiyOy8U1l2?=
 =?us-ascii?Q?/HDKIwKliCnS5ZcD9r/v/J+sVbGd8exTxtHUu175ZmzsvzDdc8i0JqVvFFp5?=
 =?us-ascii?Q?n9nA1evjQmnu2qXTBoB+dioQNeSJprKMzbP7P0hFP4699ZytAR9fzYtBd/KL?=
 =?us-ascii?Q?9tFJoSpQ596efFbLT1vzXMVCZTo/oVAJirUZpyZ/4YJS3SbRpe06wQmSkmrQ?=
 =?us-ascii?Q?6NtY9On5U0DBZ5rCj/G20ZveWiHjY0LLJhvd8kXJSMuXrIPMQKOW3dPdHwTW?=
 =?us-ascii?Q?XNHJ/l3VBQ2LrxPznGV8pGqanQ18LL+Xn++lE/6QF4Q+/SmPIyEUCOjGFh0Q?=
 =?us-ascii?Q?KZ3CMTszNDXxStVG8k5t0Jl8LpRqHNvw0f6biqH5jG6YAR4yNgPLp7qeSzpj?=
 =?us-ascii?Q?fvRWHT4H9D/D7co14tXbWgoq4pNxWZwoHER+0aZvR+k557Y+a9d4G8FRrtmB?=
 =?us-ascii?Q?zvM5XHFkgy0vG7UOPOkHH3wVbHIN01h0h9rBM7hXUD+/xoOdD+9El7fap/1L?=
 =?us-ascii?Q?6Bu1bENWR99XaEp8dIFg3p1uM8v633KZoGAsQFowGCi09eCvYbRBgJN+WznB?=
 =?us-ascii?Q?KC1BfKEmBlfSh6ZIYynZTLA6b6WwrSE534DijDomgy1O+wu5X4MmsLfrTP2y?=
 =?us-ascii?Q?jz1MPh3IVaUk0ieUoZPjuoP4YulS/UHSG/OvdBO55NViinTCNsG+IzxiI/Gi?=
 =?us-ascii?Q?rrFoPB99Xn79rOFvl2uy7eWEnzh15ompEa0oEX7DbBq+vgBXFJdPRusJ3xge?=
 =?us-ascii?Q?x6kThF4AjUd4131DA1GT5lNJvDsaN2fmD0vpH05HyzMigg3AvrO/5MeD43P5?=
 =?us-ascii?Q?srfpIIZmCIrv4/e99iYX1egVtq4V3Zf+I0s/863RBnaj9JULg2ERvw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NOX/izuXtPDRaNynBN9w/97DLV+Wu/9ekJV4gBQFPh98sz16ymEncje3LSM8?=
 =?us-ascii?Q?C+VAI+tBWO6lYz+A97mbgdyM6vJFVwWkC9s2vpr9NU5jKvRc4hMKjwDp/6dw?=
 =?us-ascii?Q?4owj6SCFzWzyAKfYuHxMaVRoRPFSVcjiCxkFISQtTvXymnQVNMgws9a3c7GK?=
 =?us-ascii?Q?KrTTOHvH7+KcrhvNPq+0O48eSF/arRXPDquvhA4QNjZdhWeCs/ZzVW7xqpnz?=
 =?us-ascii?Q?k2e+/RhY/Gu0HOtYs7Ynazkgs1ulakCmHstA2q2+xvV4eossAdZONypCY6hX?=
 =?us-ascii?Q?slK2Q2iSULc75Ok0x+q1trE919adXQZAaJ4FnarObOZAIMhCp4o3mBgVqO1N?=
 =?us-ascii?Q?oq6cLXVNGnPJQPI8DWOrXxU3kqlKM6LtROaAega7ml3nvjaiCapj5iS7jVyP?=
 =?us-ascii?Q?cj6MDa78MO/sx/K72ISTRsyfiLUHr60GnI8wPIu6tjkGtlsoewBfyfi42CNw?=
 =?us-ascii?Q?ZCG69SKXTVddqbNze08yefUY9/nV8nTeV4voJ+OGKNUACDvrUv76w2G9OEkp?=
 =?us-ascii?Q?iutT7yQgUuh4bMMMBbCDNCSykD9/0mA6gE1z1Wx4ZWVd0A8mZRZP+QMjiB20?=
 =?us-ascii?Q?YuoizDAGNJy7j9H+8yB9Bhnxv7YDE1lbRUkgImWE/9TutFnPIEnUwWglsMTP?=
 =?us-ascii?Q?dEenvoIrjpdSqR6KIpnOfCpw3tPrzglxj5nmglIlLtn5cUVdAQRaWdxrVsYa?=
 =?us-ascii?Q?g3sDjYYdxKsf4iVAQOO9usdusibxCnjgV/MwY3t7hl5SINU6U35ebNz2tuOr?=
 =?us-ascii?Q?kBHEiQp5V6/YBgSZti5FX+0eT5XYTKKsNfJvtLLATGq3QU2pb6K6Dseul017?=
 =?us-ascii?Q?8y2xbPGgTyzDVuAE+kjHU/URmg7sGRhdSu3GmSkOutfTtFyFdQ2vO/1CSjwj?=
 =?us-ascii?Q?u2xdfGMKBhFRPbkdfDNlY2/AD3BBQpbnO3VzYQ/4BTaD98KUQVqorjqjyblC?=
 =?us-ascii?Q?iTO/TY0eNtViFxvVGU408ZKznJMQcn+RXBGrojyucIgCP8O/7fBg+XHN5QPA?=
 =?us-ascii?Q?O5RsPKm3SSDQptZa1Ft6KBGjo8XYlfGT4zbzA8iPp7utaU9DTDftcm0I36zM?=
 =?us-ascii?Q?rKdOSZ9ZJvrCxUdsZrCk79kB6yPtVYDoiKie//0CWOF9PXktmMBoB5vngD2M?=
 =?us-ascii?Q?1nNsWkUkNf67bgf/+I7phfRMaPFTF2rTfCtMACOllpDpvTKp7KDR2mzSmGeT?=
 =?us-ascii?Q?uGHEQmDgE9fEXGLDJbpG9ZbGpAtVCbQHiVRe1kRsX5a7AmNu80DkcTbxxFH1?=
 =?us-ascii?Q?0IRfFWkOwFMQaUKkQXl8NY7nMAkHwUf6FK4d4blzrEM8x1hpX0WaAwqRx2WJ?=
 =?us-ascii?Q?5OTemWHPKNZML3bhdkO/RIMx6HxQMEfa2yNzKR6UIJKShwNxYtrYEqjQbhjg?=
 =?us-ascii?Q?uR9eVQi2qKyOpN+2Vf9uxygERNFimg8ej2UDJVG9SDrNMntZA72BZe2mXVOb?=
 =?us-ascii?Q?aSQrDE/Pmhmerf4qSBQ7Uqag2jqm0lGtskxW8uAGJnlRMFA8K/Vt9S1dYxlU?=
 =?us-ascii?Q?ZwHVK80ZHON+zn4c/O+ll0kZ0/IGMV0v7YIS+V5xTMcNapFG5cmBCrDmEPWT?=
 =?us-ascii?Q?em7Pspq/zUXTCITizG5RD7DNnRY6F0yxhMPNhOhzXYbneul1MXQLybFh/7e/?=
 =?us-ascii?Q?EbuKjQPSwfyokGPSqMEHDyA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d74174cd-fec8-44d9-d8b3-08dd77122354
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 02:56:34.4255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6Cw+OWJoNkFjn81GwOrL/suhGszcvrUMqgl+jpvX2qPxoaNl6fOu5kXNMHPfmo1ptqdNd+LNeBrf5EQRtPSN9uGGomXPaTDYWMEd+2DWboq0VNI6mY+qDvDOaaKDRzE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10785


Hi Mark

Current snd_soc_dapm_to_component() is using container_of(),
thus, caution is required to use it not to get strange pointer.

But, dapm has component pointer (= dapm->component), and we can simply use
it. If we use dapm->component instead of container_of(), above caution
is no longer needed.

Let's use dapm->component in snd_soc_dapm_to_component(), and use it.

Kuninori Morimoto (7):
  ASoC: soc-component: use dapm->component instead of container_of()
  ASoC: amd: use snd_soc_dapm_to_component()
  ASoC: sma1307: use snd_soc_dapm_to_component()
  ASoC: intel: use snd_soc_dapm_to_component()
  ASoC: mediatek: use snd_soc_dapm_to_component()
  ASoC: soc-dapm: use snd_soc_dapm_to_component()
  ASoC: soc-topology: use snd_soc_dapm_to_component()

 include/sound/soc-component.h             |  6 +--
 sound/soc/amd/acp/acp-mach-common.c       |  2 +-
 sound/soc/codecs/sma1307.c                | 32 ++++++-------
 sound/soc/intel/avs/control.c             |  2 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c |  2 +-
 sound/soc/soc-dapm.c                      | 58 +++++++++++++++--------
 sound/soc/soc-topology.c                  |  3 +-
 7 files changed, 60 insertions(+), 45 deletions(-)

-- 
2.43.0

