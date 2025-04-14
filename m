Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E17AD21
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 00:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744592225; cv=fail; b=nUadW47sfFIlYq8aHciuj4NV8z4MpFjkCkw0X9ny+N0MkbMnGbwQDxo/gxrLYeGTT/HyqyNwLEY/QrT0XgotTmFL2vOSSJa7081J0NjwbheN9AwyNf2Zmy4haJzR/4fKyI1LiurAv4m+CRhYX31l7ui3EkwiQmuf9uA9+puH20A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744592225; c=relaxed/simple;
	bh=klN1buAafsgRhGA4aveaA7d+LS0gBsRWBM4yxGpSfmc=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=i+a/4lIJdtrYUB9u+r2aUivHdM5SSScvvRJfJ8LxRyVyOXnuuG27gJyoVSFdH5V8kTDobRpJZlryKklQ7PzHJBsI6XJfmuHZO9/2/z6ujIjdTSMoOZ+dWt2KVC5vPAmKoXHerv+FWjRy+2WWDxyPq/6hEhnoVfqrO3YjMnEVivM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JdYFVJax; arc=fail smtp.client-ip=52.101.125.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JdYFVJax"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c381JcgqoDXm/KrYKeyGf02MLbsRfxtToeEqy57aooKeDQtRkZQG0gBk9t0m0/LTP1qEhYI8rKYhDwPwdjtksxpTs72AHmIWrjsVHcM4Z921FoIACawzf9SkPUKk/xp32moa5472vLyTe0hi0SwsDUec2cShdtKPB/lsjyQA7UnJunQ87fDwGCa2jnJBR6PyDg+0DxaJ96WPG9E/cYu5V/l46I5bzTwURL5NHvlL5W29t3R35FZFHZQw2JFpXt1+KZ2sR3Lv1atqV7Oc/MbsUPqQb87dsxA4rAw7LqsQL1NEbJ517mIFWr9/Qew5BQFW+vllmWxd/UGuA+x9809Qaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Og9BMJHthEpNyeTPueDIrEltbUBsV/WSsCtBbQMKmU=;
 b=m2PP5TwtATdAxyHlRBWEifTsZXq0tiXI4Ai5OtFtf1n34iKRv+4atZPq9+KY7+vvhkSvdDKUVvrt9okqEDhu0xqXRVQ1LRBn76V+nowgxh1hOJFXDrUOyEf+01Z3PKY8SOIC0CzCxbqzdEbVj3tgryeG3i142CO/MsMr/87mFqYeQ/aROkQbD2aRUVbKCfNnYU4BHBkawb5k2Bi38UrGpPBZqAdAMGk24bwfblo3KPisq9KVLZpi+uozgxxr4FFSZcd0r0Ej9wNsBtepAv5KOKSc0IckPJzR6dzJPcGwsluazEexMwCD+UXo8lNH6J19U3EtElIavkuNQoijwiHIAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Og9BMJHthEpNyeTPueDIrEltbUBsV/WSsCtBbQMKmU=;
 b=JdYFVJax5xmwloc+7vveu05ycdCZzlnaVakbj3zMEEmwwPxF/Ds2s1szndiuxXBfuqzZYvQb/bAnlX3f90itVwMpj5veq6WAMTNgiMDxbBUt6sNhwnLPiuBXcufUlMisPcjq7V2eheI7zsHsXGLulJuCOX6aVoZtt+cajGTp7yI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5646.jpnprd01.prod.outlook.com
 (2603:1096:400:a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Mon, 14 Apr
 2025 00:56:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 00:56:52 +0000
Message-ID: <87ecxvr25o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: David Airlie <airlied@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: [PATCH] drm: xlnx: zynqmp_dpsub: use snd_soc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Apr 2025 00:56:52 +0000
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1d491e-659d-474b-f2e3-08dd7aef3e99
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?27wDASeCvuag7+LO0OhArzGeQRMB6NZmUiysD/Kik4cQFT1ku4HrVHPv+jWG?=
 =?us-ascii?Q?x9+Qtqh82qw416uAR8X/I7nVxh9HW7EKn3Vk6Bt/SVHqImYyHIDi3JZYSIMo?=
 =?us-ascii?Q?wUJASHWVbZzZUleziHG62JDvNEVvp/gRuSEFGUjaTgDhQh74h+DWbutoPX7N?=
 =?us-ascii?Q?B0D03LW0l5o1vLnqF1Gt5QtfIANhhVDVvwGBSiNGHDEAZxexB/Xb3wwGtwln?=
 =?us-ascii?Q?ttg7R8u84JxWx70YyWQhihqIl0fCTxLJvJNtD8Rjg5o//Q7+WzXzd85NFxeM?=
 =?us-ascii?Q?EAosyz26dWyFJry87wOjKS1g3Ufh0OQiSGMPfhEeOAdYBrzwzcsa09leLn1K?=
 =?us-ascii?Q?AVbG+DE5/7IiAVmyCfhnVnt9G2KnFXJJXGfxoLPOTeN6QizAFscp8e9NrRKm?=
 =?us-ascii?Q?5DJjC991eXOZYomyLFTDS/LJq5+IAn8xJItDrKazrDfWj/utDuQNbaOIhlHa?=
 =?us-ascii?Q?HgPhyEewL4YHykJRc+GCToapRVmlyrBXYQU0TIX2ISrrifz3ZgmPgfR+ai6s?=
 =?us-ascii?Q?xwLUyUC62c5uvyUAPSvejtZVUPwnZDTfDfPmyCxTwMEwPDWLAvAVPPr70myx?=
 =?us-ascii?Q?rykiDtPgt2teOqiAwoSA++bBeDQYHeNGcuiBX/Smgew8aUcPCKiNCh0o1OWP?=
 =?us-ascii?Q?HWI5YZba7Ri7l5jHBgP2cs5m/mvV3iUOM2BEjk6M5uFXJJ66i1C7kKPLoHuf?=
 =?us-ascii?Q?iBWh4yMfMT8mvSNOfT9gVZCDrGp6AomUfP+Txhh0JVT2ENFvCW3qDjexYYpr?=
 =?us-ascii?Q?1ccNt7t0truLnObcDJwkTO63nuFK6HXb1Rb8ge/jX8vmXmiCLuD30Djx8JCU?=
 =?us-ascii?Q?HKnbGzUCUkU4VCaVhMiCQXOraRwnB8ZILXnx2VDI5RGeUR1L9H/iSbCHNx8o?=
 =?us-ascii?Q?Lv0H9WBhslDaxUX8iy5soLXAX+VXAqhdjX9vurS8BojkDcOWIR3g6ofrXfMf?=
 =?us-ascii?Q?TQSlElrXTqV53uZomwZwkYxispORvwwgBxDMHpSmR8dfgpAlwvYauQXX71CC?=
 =?us-ascii?Q?Nk/GpqNMA9nmwoRrzXrRwaMhv3qsJNIN6by9LfEW6J9Ok13Qp9s9zSjH5k0y?=
 =?us-ascii?Q?LLoaHMQX3xae+NnHHMmoEl+B2Xpkxm2f+9nL9IZdljLn66go1b2rkYHQvw7Z?=
 =?us-ascii?Q?9B7pl/vwmofscihF9FnCLJ7xOSog5X1wnP5SjLVcL0sIyNGN9DxNEBznMOpu?=
 =?us-ascii?Q?s8Pcmfnf5kMfK4TPEfDJxdjM/q3FS8YKrlKBKkYUwvYeJsp4vTZS+MgvibVl?=
 =?us-ascii?Q?tEVzE3P6K0XDVYIs3MgfR3LatShgaC+xlmmCjwmaIjQysAF6eo4FH1k3XKO8?=
 =?us-ascii?Q?bcfbAjEVnKDgybkJYO4Qkk4acvFZbjU3WDO6+QU2vHLcYaf4q/Y7xxNA3Sx3?=
 =?us-ascii?Q?Y6YjoLK6kBNzv9kfItcYDEdGU6ZOk/fiCXn9oAduu1VSoFBkdWLPe6pTUlWB?=
 =?us-ascii?Q?uaipmkAZ9p3yrxg5z/uU6x9u2F5UjrI/Wwgwsm1TQja9/7F+HkWBoQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?3F0Ud4nAxudAo+gT3sQISA9/sajtJ2sk0lGBuE8YQq9+6bTnLt6RIQGFaMu9?=
 =?us-ascii?Q?f/vl58roenXfhQxkMi4cmMSvhRbcdE6HwqT7KAinnZtfY8wsh1oe3mJBUR8g?=
 =?us-ascii?Q?SFAzUNlDDjQMLaiXKVpuEKGeLB8VhEqUQeMtfGqXHMFnOq8q03Ki/7cjXuJP?=
 =?us-ascii?Q?bL/kY6Ddd1iaSWj3bCQDd0WlFyW/U+FXE7vt3Mttc4k/qtdHuXSFKXg18sus?=
 =?us-ascii?Q?1eRk0Hoib+f461OA9uZiLKO5r0VfxjCgbI9xn4XjOCIHSITK3d+LIzxn5xo+?=
 =?us-ascii?Q?5BXYEtTz96UP6jrIBLGqvPt7jHK9A9egHR3UZOODtOqqk1yu9+W0RTqJ8gf6?=
 =?us-ascii?Q?EkQe4SEoGcGSmrCTMy14a9D4i92P0098sLFRfY1jYVrql5uKTiAQ181cy9As?=
 =?us-ascii?Q?PHzdK8/oo0Rh0Sh9FsyFTqUxoBVCe4rllbqutst+3OGq3q3LenlpL/uGiZ8a?=
 =?us-ascii?Q?ii1xesGeNSw9Mo5v2eq7FpUE/So+S31vqk9Zl4A3RxRgnHo7yz5sNBOewvba?=
 =?us-ascii?Q?9YD/+6P/utthiJj1rm8qukn0oO+WZBr2Egk1osH/pteR1mEUFz51LFcwBjFm?=
 =?us-ascii?Q?nxbBDFQlPuLmIvo2u/Eq61KcXSxzZjpVjUJaWQRgxZ03gSE966Z+MTIJaIMn?=
 =?us-ascii?Q?+aZhjEDgyd6Rq3YK71t/Zp1IydRXOpF4VnSU3HIsCzBTyexOfLxx82DZ2DKB?=
 =?us-ascii?Q?aMgPcPhvnlccQTv0BLV8sgX/mcSL5SBfn4lRxmZYohdj/UQ/rA3mjNM+1SM7?=
 =?us-ascii?Q?6uUpj0YcknudVF7KXTx/bloGpTQoesngdCloiBeaIjkbL6f8rluRqs4m/5SZ?=
 =?us-ascii?Q?V3u2s8j4X5zdxOqpYXuwJptos0QWpm9ZiEnSEiA4beWjZJbOtBveR54mthj2?=
 =?us-ascii?Q?gMvkRatiZUf7l3Ngu8G/2iIEZMMK6U44Zq318eYP1Okk9b59ex83jTWbFqJL?=
 =?us-ascii?Q?7QXizhu2Nse58dbRc0W7K0ZRxZhdTpHfhdlU5ujPgCR5156KBeH3aVicA+jA?=
 =?us-ascii?Q?w5aidDjkBjERMYppC5ZlOUS3P8njtdEf/4I3yaP0JGfXwXo4G/ynwwxo8hLI?=
 =?us-ascii?Q?bOiveTXtzqdMZA25JgKT2zs1mAh6f79JzC8LQV8z7FTh/2wo0qso3q5BDgyL?=
 =?us-ascii?Q?iFkUPoKoCF3+8iYIYh4txvUT9MAUWpDXz2eQ6qCBso+aHHJU+CVSpl6LHxH6?=
 =?us-ascii?Q?KxzRGqwK9Twb+2MekbcyUo87lO+ZfsLKAEkRYktuzTKnpATFAPcnXvDyWsPR?=
 =?us-ascii?Q?HkqV6PtdPDiViRmLrwYEUbnxTx/OxPD3NdZ23NIfk+cc2EzaYQGk/b/qxUan?=
 =?us-ascii?Q?qvQUnPW2Wn6ZAsjujMoK7HLZCmOPQDGkRHjOG5WISqk/rbUTHNTHDCB2k41C?=
 =?us-ascii?Q?Aq73iw5aAnPYpGCmT1alorhW1mw4HC1eUuNniLLGqpwymQCN1m2izz3cn+/C?=
 =?us-ascii?Q?NP+XyZPldFK8g5u+NZorp/f1hl73hzqVOMeEZ9e4s4MjVOZVTe7tExO6frVw?=
 =?us-ascii?Q?AJKIFoUakudrm50kF21+qSqdhKLI4LGgkUtG72gwmBNA0nz6tBTTgLJr5mPY?=
 =?us-ascii?Q?ajwHT+tShoR/B4FkAak8M80zkeBe0HNsUmu651KVC9od8jI7PPCj2QIAC7c/?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1d491e-659d-474b-f2e3-08dd7aef3e99
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 00:56:52.4775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3mAILAPjPKQr8BF7o5HaAYPKzqBmttjMSX3YVWz1FOrZ0VenToTB0cOTxRUEhx8yRoA1zrm35yr/XbQn7CYQDm5HRBMoC1D/dx8SV6UZgdQ6GzyKTjC9IIp9Ea36wqw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5646

struct zynqmp_dp_audio :: components has codec component, but it is
used as dummy DAI. OTOH, We can use common snd_soc_dummy_dlc.
Let's use common dummy_dlc instead of own component.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
I have not tested, needs Tested-by from someone.

 drivers/gpu/drm/xlnx/zynqmp_dp_audio.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
index f07ff4eb3a6d..1a46a046103f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
@@ -45,7 +45,6 @@ struct zynqmp_dpsub_audio {
 
 	struct {
 		struct snd_soc_dai_link_component cpu;
-		struct snd_soc_dai_link_component codec;
 		struct snd_soc_dai_link_component platform;
 	} components[ZYNQMP_NUM_PCMS];
 
@@ -403,10 +402,8 @@ int zynqmp_audio_init(struct zynqmp_dpsub *dpsub)
 		link->num_cpus = 1;
 		link->cpus[0].dai_name = audio->dai_name;
 
-		link->codecs = &audio->components[i].codec;
+		link->codecs = &snd_soc_dummy_dlc;
 		link->num_codecs = 1;
-		link->codecs[0].name = "snd-soc-dummy";
-		link->codecs[0].dai_name = "snd-soc-dummy-dai";
 
 		link->platforms = &audio->components[i].platform;
 		link->num_platforms = 1;
-- 
2.43.0

