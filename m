Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202FB2309AC
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 01:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731460652; cv=fail; b=Vzb9PcLk4c8AogSecZjp/QEFoIetQ3p9yb+pDlB6E88sfYnBXLl5DlntarKP/8h7KvwxNmLTpfVTuPB4AWFRNVxcHmEYf0YqsRa3ncrcuh8Gw95wt18RB1yq5tOApE2z6fXQEonabl5PttguKH74xzqTwOvsX6WShZYuiqjDliA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731460652; c=relaxed/simple;
	bh=UtKj/LDUvZi71siaGHXjy6X7hf6BY63J4txhWf1xfzE=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=EY+Cl/D0rWH2u0h+RQV8W/PBoKmNPhPnul4YpsLdpf8hLHFpkO09x9UYQBtUqXNcB0OExzjtGp9XNlnfF2olLcdnlquoSsXr7JwBthiSNMrqDi3z5tDzVFHCfiIEtDHFW2SJL+Y9fdg5UHjW/5R7Z7LZkwVJAzKCO/eyydEDbzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=L30yj/9W; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="L30yj/9W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsO9FoQCtKvbf85eo40acHy8eXdjBp1Klb7yvi21WyyNarIcXsYHd50FWWebW9CxMmGPCWY7+R3a7nvpesBR+rzA3om/NmhAto7qNaSb+rekXLLeh48TNOR39+1GknMU4M9JZXjGZwwSKdxvmhgj0VfNBEvv2lKIBWtWOHINNsYen7KSF0uDPsYq1u6N6lbvDU6WsyW5yWJ/wyuW6S13kEP14OPKb8u8EvIx+YisZ+Z7iQMBCozIos8nfml3mBcCFHEIPVYJDesdKde7lvrO9Hc9Rhmq/JrOZjhYXRhUUzTv/paqPOj2kG6NlgwJy2PlzWBt7wQhEiWtM4phoPVcEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nohuv8GKYTFnlhRI5gURpEO31QSkbSSqY/uF12w0XXw=;
 b=GTV0s+rBU1ryOKDWZRjrLjNqc5Hn21XtGXd6V9G8FzTUx5vfEavOLFwR+GrE8ynR79Rci/knnZOh4qXURB3Z0kjx760of2woE28+dY2u1u8yHM1xUQhKosD7UNgRBFWfgszXrWuPJhP3MKIUYKtpB2K/vaDY4w4x1E1UPMhWacERE4iAjStfZIhk8Sy1xWtCtMM5bzgI9NWnidtsFNJBPnDu7Zj1szDw4IgU8ZZKA+5/NdGmDVnjl/5qxDLpKCgtLHR3FMs9QN6wPVLFIuvX5JszurZjSliUgIvOU5rce2jpj2J7HYnEFrQXxECVTSyZ8qfC3iZAPaNJYQFKjtBVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nohuv8GKYTFnlhRI5gURpEO31QSkbSSqY/uF12w0XXw=;
 b=L30yj/9WDrC8PyxM4sEVt8nidCX7XBhA57ta2xnQuVOFZ5ESUpZpKQyj1iu1jRsRPb3IT99QqeGclJiKrGitvLACETWdXz8gVC4WTLkpaELS0GhAS6pZbK2h+RoTNVrp0trycESy+mK6YOAvtnV+Nmz+z0k3dWedDWpgJbOCBK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB7927.jpnprd01.prod.outlook.com
 (2603:1096:400:fd::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 01:17:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%7]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 01:17:25 +0000
Message-ID: <87ed3gsziy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ALSA: tidyup SNDRV_PCM_TRIGGER_xxx numbering
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 13 Nov 2024 01:17:25 +0000
X-ClientProxiedBy: TYCPR01CA0203.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 72afcb40-f224-4b02-815a-08dd0380eefd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cJPBg6d1XewVYCxUPQtSVADECtO/otiwzZpKZM5BKGCHgt1ouS/Qd+vLhxmU?=
 =?us-ascii?Q?XwK3G6xLo19lkOkkX9J6Bwj9bj6EFUcCVMPYvf9GewOFixI1lSXH5PSXO/Y2?=
 =?us-ascii?Q?66R/M1Hw9sRA0ffxV3P96+H5+aUOl+xNEjzD58AxkjINp+L3+uQCzf0fzMLz?=
 =?us-ascii?Q?SZ/wEhcGBrjZ/NpG5ZEsg7LsgPeqOZRsAHjoF4onGP18TAxvGDX1W+gR9mMl?=
 =?us-ascii?Q?hypkdHEEc5H2i2PJixBd25LAYUXHNY873B1eOx+x3NkL/ExBHlv7wTBTznN4?=
 =?us-ascii?Q?/8gTCyQLsEtZtJxzZ16FjwtD4KMRp5/YlME+IDjVBrjUKHhzLhkpoxPo26gY?=
 =?us-ascii?Q?WdxZy8whIITk3CXXpQMPJkZgHkF/ZGs8AmvG3gJ/uesBmZQzTC139gilYllX?=
 =?us-ascii?Q?KvPFKU/ksSkFENnxDgJG/Dg6vwVxokjlgxNgW3O6j81j62nJdk+ygHeNSzXR?=
 =?us-ascii?Q?ab8FeDBLs3Fg6D1mHBbGfoMX4avd/HGvE8oQE72PzQEquAfyDS1E6HWF0jc9?=
 =?us-ascii?Q?Yw+g2+RBeXeyPI/+CrwAUwU6sgnN8MVN477diaQhsd6lklGDrrSfVj3hVt6G?=
 =?us-ascii?Q?ZdtcV6JAYhrbD3oXpwqDMqCukE6nwTaV18ZLJvVVV/hCGhX7x6DGH1pkIgdv?=
 =?us-ascii?Q?41LNFlyctGhD5RMeAyZdBCjjHzTFRYRcwBf7/ipLDziTaDRnPOcCF+yniMAm?=
 =?us-ascii?Q?LOlkIrGncXRuoKFsTVwp5RjVwTWGXRZ7CgT3TbgowzQy8IE3MsHaJK93kbtw?=
 =?us-ascii?Q?4TzNI0XEGCBJ99fclrB/ANvjBPA3rvJ2Nw2Uhf71vFO7YFozrJTcnqiZSnk8?=
 =?us-ascii?Q?Dr+QL+yXILdhJhdhMqaLcX1sjzJcZK7CPzoKmjGlvldEObE0q6pnL+17ExhC?=
 =?us-ascii?Q?eUFZo2zVPLdPF4LbMHlOVtVOgXM2K8RKWUKzuweIq4lC1zDcWHyZey9bjHks?=
 =?us-ascii?Q?FFL2OjTslY68tuW9nAT9bCj11sqz6f+o9bD7NRY17fz/Usdvbom8UL24KIgw?=
 =?us-ascii?Q?VLgPi0Ga8nubMiFLe+56Rv3LiEf6KY5yDL8HB2axXw8HcIsqnMQ9GkIFNPgC?=
 =?us-ascii?Q?OlHU0yjklbtw2D6t4qzDn0bVml/SGt49X7hBHTquK5Z4kzeI/ReobL4cb2+P?=
 =?us-ascii?Q?YKEImAbB32XT9Uncfp5vXNkEzkEnxcc+Txow8x3YsOwcQPKH6R7Df1X9BPJv?=
 =?us-ascii?Q?r67bplIwIhtnW21LeTnrnqZIJ/9mgM7J1IVfVPHFLlXn1JaDKDjRfM2Z5V3Q?=
 =?us-ascii?Q?H9L0mYTcHi+QyAySKWNCyzpGzTbfSsKtQP7+9I03ImL4mc2Rz2ZfhOfygLYl?=
 =?us-ascii?Q?vNlkW9Jagz7Uu9/N2vIbAhGwF7WQE8GgZB8hv8xxcRKdl6w6ocYs8NDx0DXA?=
 =?us-ascii?Q?+e76EmI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XbS9mV9JmrbSv8Lr9lpP6vIIVo8Q1hGrC3X/+M7+tKdPb2zyCSYl/aCnN+1j?=
 =?us-ascii?Q?4l+HUpfwOwrZJUGvimvXeYRz9zN0xl1n+3EVoMaOpbePmjySv2kWZdadfVgz?=
 =?us-ascii?Q?HZlQL0ZFEyCK2AY43ck6Wkbh0nfkTWMOYNkU5F64E4DTuLBzlmV9im6D53pe?=
 =?us-ascii?Q?4gnIIO7cz9ym9Jwa2fyQGF8LrkrOyc1mXCbEDLhxN3QHvPojUP2fFxaMIh0K?=
 =?us-ascii?Q?GEqXObw7cAa4geFRrCcRoplCTkFW1ZyRAfxDAMKL3TDQDE7BEjPNg9ePKsHt?=
 =?us-ascii?Q?sEWyRq3v9g6YAZQjtdYBXyObuCkDwJAFvCYmCZarxSt1rKc8ZDcshewTMP9P?=
 =?us-ascii?Q?Ti6eNfuUwHKKVt3rtojj6Zfl+iJPbgY5bF6abc2VbrkWjeG+NCKN/zYyqFp6?=
 =?us-ascii?Q?LgceEs43wNr+V3c4WyflzdzbF/VV7U40KlgCStwpcyxMHtg8ynF8Yzh3Jeh4?=
 =?us-ascii?Q?FBGbQhw4XsJjQBAte7Upy6ewbHV23AX+PcaE+jdHFBPrhBLLMJ7CWMkKhk4A?=
 =?us-ascii?Q?ZHPkjHuJQO756qz6IEdSF2Pxt7TgDWm4+UH9e5O5fC2rG2xpXisZCEKNqH9N?=
 =?us-ascii?Q?Ss4aZJIls3rBqD5SzeGRtfFNFYWhwVDXYg0zvHmk7MsYzdYG8DDjOYRnrjTp?=
 =?us-ascii?Q?FKIdvlOZI7HUVFxp6HR0Bwab/gyPnpPWZICOdfCFngOFdi3lmD9P1KXT9Vam?=
 =?us-ascii?Q?KlbRVcwUrJcDQillVDdFmNpHkuas0Su+X6gZjIYMt0goUAY+AouQIKRIjE9s?=
 =?us-ascii?Q?w11ncQt5+NcUy5zjYmW/9ndMCM+nK325Fic56b5bEhlconuFlNfpB0clztTx?=
 =?us-ascii?Q?ZoGU05+/G+ARJOLUyl7snGnFGB9jZ1bY3zJvNGaOgf8UXwG6gBfKXUSkqNxm?=
 =?us-ascii?Q?obSgiwdU8kmktQWGeBCnaG4za0F6QGZv4VRaB1pCt4mzvQCnL4ne+SAVoyoq?=
 =?us-ascii?Q?wYQzqOxc/eNxiL01mpftwjQC8Yj9PrZ0YoCKR2FgzB13ZQECZk73bZF5K7n8?=
 =?us-ascii?Q?BLXrseQMUs0sBPHhIDzs7X5+ELjYaMPZf4l15elPRzyF+oIsqYIeWI9K5kj7?=
 =?us-ascii?Q?CvHzl1LcXEG4pF0G2MaTN7QQAzvu+YAi8OqFtsqJzvcm43b+Nx06pORaOqqW?=
 =?us-ascii?Q?RPJoMk+FnxTV7FzhKjnBxjTXQeq5b0TZ+8AuK1Tg1KKUyCn/AnLY4DoCfSNF?=
 =?us-ascii?Q?knwdYiHZHcrTiqT1IJ6s40n0o9vkSWMG7NzcBl8fjkzhkuq0hUulDoFgA07O?=
 =?us-ascii?Q?ScbxIdnyvxzhBlIJKKtGlFQ1197DeQOAT0F+uSUKc/j0H+oplGDlQxMSPqgP?=
 =?us-ascii?Q?pT50bX+i3s+/gTbRV9YtLoEb2GEcwCo5hN0hdhjvfAc1mnThF5orn+AzvbjH?=
 =?us-ascii?Q?YDmu1ohQX931/OvKIE3uttqO3mK0gshjpCixPvQaNmJxjIW0PnX2EP4Aj5Af?=
 =?us-ascii?Q?vgbjRz0qZlIqfK+exzok44GTqewi6gIFQZV6F+zqkOT0bLxIQgLyan79/Mrq?=
 =?us-ascii?Q?67dgrwvslAQBGImqUXfeta8zdPchsvXZ/LziKiY5Ci2+ngrqlKBnLziTdyUL?=
 =?us-ascii?Q?SofdEE5VjMKtCqgMKUoFkPyR+1TGkW9SuJnx6cPixLKwnPRxuizcz4dKIKhB?=
 =?us-ascii?Q?CNIUVVGc5govlBDdPDySpGQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72afcb40-f224-4b02-815a-08dd0380eefd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 01:17:25.8055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tssx1RXY3CjkH5lhJy0c71stKiq5F3U8peoFM7ivrxGJNgj2+BOp9o6oJ9E6Rmz5aHj1l3XU8UO5l/GSyrF4sVsOstBkJHCUdfgDqb6FGpKaDOglGlrtUUFHSZHGwKBk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7927

pcm.h has SNDRV_PCM_TRIGGER_xxx, but it is missing "2".
Fixup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/pcm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 0bf7d25434d7f..ef9cbeaf37849 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -97,11 +97,11 @@ struct snd_pcm_ops {
 
 #define SNDRV_PCM_TRIGGER_STOP		0
 #define SNDRV_PCM_TRIGGER_START		1
-#define SNDRV_PCM_TRIGGER_PAUSE_PUSH	3
-#define SNDRV_PCM_TRIGGER_PAUSE_RELEASE	4
-#define SNDRV_PCM_TRIGGER_SUSPEND	5
-#define SNDRV_PCM_TRIGGER_RESUME	6
-#define SNDRV_PCM_TRIGGER_DRAIN		7
+#define SNDRV_PCM_TRIGGER_PAUSE_PUSH	2
+#define SNDRV_PCM_TRIGGER_PAUSE_RELEASE	3
+#define SNDRV_PCM_TRIGGER_SUSPEND	4
+#define SNDRV_PCM_TRIGGER_RESUME	5
+#define SNDRV_PCM_TRIGGER_DRAIN		6
 
 #define SNDRV_PCM_POS_XRUN		((snd_pcm_uframes_t)-1)
 
-- 
2.43.0

