Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011002.outbound.protection.outlook.com [40.107.74.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD51433BE
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 02:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731379190; cv=fail; b=nBYW6mRyCWLP4jrZx75E54u36NwYZZruTJ9hMUbK6WbtjjZkZq1Yhqlc7WsvhqY9ujiI2UoyTrWNzcfzO+CTvdgQxENls03g/8AXVmqKICGkM62+B6SJ3v+QnRqcRUasVX02Kv7F9RmVi5WxDyDiHleITKGRwbG+r9oN+BTDX9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731379190; c=relaxed/simple;
	bh=dS+Y/3fLlsln6rMVjBQEevc37pqGd0xL25Ii9oFQQZY=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=ixD9s1bFYzY30K+vxx0oOCOUCBhXyDE/IE08CNO/Sq6sQ6MCjk1bfi7xk1dVbzrdwhQJjQ8FXTcjjk8x6o0R1hMqc06fcVnAf7EtiAFp99wzp9aRub9eZ1R7uJp65Ig2KdtpjXDhOCW/3wTk954llPtL3n6rMKK8EAWuX+zBK0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Z04LTxbB; arc=fail smtp.client-ip=40.107.74.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Z04LTxbB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGoCxTsyjwjDr4dOqLD7M355JgGLLDULf+d+ZfOdKn8GW8qzoz/rKsBH9jFLnX0XPCptq2lnpl7HphqA3oq44HupiZ4d7OPrS0m2238YGFQosG3WlB/RGfPDcT5S01wxcCMWhe/v7gF4Db88wm3Pw0DeXz+3hIV4cpI5WFJ34+OUffJOcxIg6tIKvDpBAC1lwgUAHNHAa55nTPON0Kx6XgkN4MhQa/ryudwiNqN3ZS6MTmn55fKSXafckmLcE48yJO+/PvZeVcAA8I2AGz8/iAWc8vfeXsF6Ym9rSYskovAn2y5awNYOAEnA1u7LxsnMzx7PJrKSvaKd4HOKXMM1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNTCHmYWkjuF5Bp7JlwsyJXgDsAWGoPANsLBPIQcDGA=;
 b=sfSkImtSvnvmQvnIJWzQ8sAcjHN4gAaehPu2zfSpEnmpwaN7AVZh1VCHhW3SrkJF+UItfL2wgApqqcXMhU7PLwFSg4cvaKcH+6rCdKqBed6YGJ7cN/8K/nhdqTSn84rLACQjQQxvYr6NjlKKSRktmxqK0Sm/r7dbA7FNj6q9i0zOu85yQLp40mBHoE8Esyb/jVVhNXuDOkvGqqbSCUj/dT5SYwgrGB2yaEQOsxzxjgghHGLlCAltaWG0Y7nb7DdeHWOVnRbNg2n3/0iYqXDP4zTsNSGDoN28r220ICtwfB29E+qD6GnYHgppy4FDt9GVHHhkFa0EQoMh6PI4MIuhsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNTCHmYWkjuF5Bp7JlwsyJXgDsAWGoPANsLBPIQcDGA=;
 b=Z04LTxbBj0JnbgP6Lq0L00KxtRCRR5P+2CYpc7IGieYONx9oStZ57nEviZHY2uJBOdHAG7gin6qFh/aHjHPACrsToBqQawIw62sKZRsJ7RyqlbpeTdrZ8iGQm2v9/gcZaQ7GnBYoN9JIpvgD1XVzSUw3iucDuiO6TVQJ/lYUY68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6012.jpnprd01.prod.outlook.com
 (2603:1096:402:38::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 02:39:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%7]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 02:39:44 +0000
Message-ID: <87msi5maz3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: simple-card-utils: care simple_util_dai for dummy DAI
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 12 Nov 2024 02:39:44 +0000
X-ClientProxiedBy: TYCP286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c51831-805a-4919-f848-08dd02c34448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ccdPX3zqdcXHi5/dxJDtWTu3d7i78x0GFguwKTI0I/tOHP6rzlxfaS6G4sxO?=
 =?us-ascii?Q?Awvm1TpT6Nsz8+60uo9AluSRllbYNSI8cDo+LF9GPoq3xMbvnak2gOOnWqq+?=
 =?us-ascii?Q?emNzJUeOd7i1QAotCoTlVR6I9/UL2wBHuGrqAMXrqKO991e5TDjCrsKdveE/?=
 =?us-ascii?Q?v3aDb9nYALlGuBx0FaCtlxObaT6OGW/MTn6Ifju9v6LtdASK3IJru12U246P?=
 =?us-ascii?Q?9K9DKWZ8AiBoVxIWZ+cvXhfQi+KAECsksHEEbwF+4h8FAZ/cIfdt3gGHQDGm?=
 =?us-ascii?Q?8y7+pPOwu5d89R9vSytkzfLZMbE0GwuDpISGy5azpTsR5OP13yQZ+Da4tsSk?=
 =?us-ascii?Q?edR8pUsICvelh0PIpY0q3ajF1yUjbJtZDHM1HHenmX62py/nJ7mwRPh3xeWq?=
 =?us-ascii?Q?MeT8Z/ufMzltINNVjWeC4WN8fdp2IJD0LxyVkuINjQ7smY8bVFpUF0SznDvl?=
 =?us-ascii?Q?VDXfF7jpX9x+LPsoY0g9cX0gEAfdMIt/7l0tSTnHgOLFfZw1Jl0wXBF/+ytQ?=
 =?us-ascii?Q?y3Wa1Go6yTt/t4Ga0mJh0uyoReLm0GXHcL83Dc12n0PP63Kw0NmlIIXNLEHO?=
 =?us-ascii?Q?Y+7oULsyShjnLo3q52a1nMNfUYGDpFKgn9uYW2toqPlyG1FMwjRYJ/P4+1BR?=
 =?us-ascii?Q?sd44bEzvYGGlYaI/nS3BxMllGb6d12Pc6js1wVcW9R/rrIS+kJs4Ub8WDCsT?=
 =?us-ascii?Q?c1N5uK/TYRIBGuz8vWMf2eXDkh84/ZAbxLDVXzMsNjKzgWaEOegZ6ET9QWC6?=
 =?us-ascii?Q?knspld1DVZOmzA72lKTeLTv2w8iqVF3qUv8+j5MXygSxO34yA4Lh+6XlLL/t?=
 =?us-ascii?Q?4XJNJG/b1x5dMJJ05KITKupvG4PAKAdx0VidkKnu3930DQIDVhiFqvC9TmRI?=
 =?us-ascii?Q?de76pJ9JzDSOxTaSKdyk3BmqwPXltmNEBfOwiVWfjIl/yz2rQKYedm6fcxeK?=
 =?us-ascii?Q?skQBBLsiVNswlPmh2yO0yS7QeSmjtSi0A341pA0kxAB6Rp8IJjcUsASGIM0j?=
 =?us-ascii?Q?2O5nMlXS7EufiXZsSVbKNnXvEwOb+fMX73JdH4uTLb4eYQ202hzFxVgIS1i6?=
 =?us-ascii?Q?bf8MHOlZeFScKgespGnxblDC21EFW3WU4JzzEc/jrTuL0QNh+DCQDZkfcXGN?=
 =?us-ascii?Q?zxDsn1T2imSEEBsfrWgNvqqpLpJ27/pszI88azUCUO4mKd4rnBltt+oV2Xdn?=
 =?us-ascii?Q?xJZhi/OK43RZrovBDuZKJPa72aqhNNVH/xjb4eKDi/jf3oPix6MbYIWuIbzM?=
 =?us-ascii?Q?VjVfciUDL35LrSq0/Q5tlYrpg9zbvPEcFj0GZTzgikCcIP/KuR9e37hxPaLb?=
 =?us-ascii?Q?VDrBC3qJEx2HUsJImOvLS5o666bl0Rn1Tx/CwBO791/9PC9/TqTTHcW3PrF8?=
 =?us-ascii?Q?5Adlbtg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9egw9U6qDWKYOpt8yMsjHzfJ8tZVvRbMCHu4n+GqYtNrvR9xpMkurux75n5R?=
 =?us-ascii?Q?MpJqkIGKpkHp4jhIOpdjBotAIwXMpzUihT6OekMFyPvJLCHzQ02nmGA0Lmw9?=
 =?us-ascii?Q?l9T6z6LcAR7Aoe/ucJysn9o0gMgpJBL7IYdjE1lTVP9HlF10BpJVUXsKfjQj?=
 =?us-ascii?Q?WdxXNc/zk2Q7Vsu5fk4CrhRcnChk8LBmaNwKrzq0tJJRNZp7AbfFOOl0VSyK?=
 =?us-ascii?Q?mpG4wG2sWwRvtDeR5Iw7PRDNGyW2V0v9dW0cIIMLQHGky+CwppF8m++qYSfC?=
 =?us-ascii?Q?Zt/29bdNYBDRh8hgmb9WT46YhSbdVbxL4KUoBlSh58Q92kWy+8RfcM0Tuwek?=
 =?us-ascii?Q?25GY45YYA3d+8Nh/LNDytZcgzxdYRcI7MTdAE2Eim9KWVY+uHk1g2qLvNhmo?=
 =?us-ascii?Q?bV0QBnzUtFOP3qaTTvxYrKQkPsTIci1HnfrAJzFWsxErKRddjfjIVhEYW1PY?=
 =?us-ascii?Q?uyEkyyL+v9FIbSYYMU/AQ5WKyYIrGuIPS3mrQTmWdGpXrO1qrvvwPzSJNHrE?=
 =?us-ascii?Q?uXYwUNzsr9PLiroZ7V4oK7lzJHXKgWabXLtpqoh2cf3sOQldcyV4450kgY7m?=
 =?us-ascii?Q?vkG0e72YLgQhNmFN12f6iymfa+b40zuGwmIwHy83JRPH+SeqncvYRgOWaVK9?=
 =?us-ascii?Q?P/8loWIKi2jBVlquwExw7RzW7seQe6CJOgMbIlnsb9RdKYrM2f9XtkNsuxTR?=
 =?us-ascii?Q?6WooPb8z/NUfxqQE2P2oVeEeAhWa+LGsLdCge8lDtnVpdY70lHT2Qy0+MPUo?=
 =?us-ascii?Q?aXwD+qBMr+TBkDkfcqISJ236MRh4hzQEyjGdHTffPvrf6ZQZNaQe2EaR3DZu?=
 =?us-ascii?Q?Gw/32cvogXCRZ9UpQ1i1u9hL2M33cOrdEO6/FQJD99DK7qLF7YxGCjz71rPv?=
 =?us-ascii?Q?iBpGbhUZOOql7IW6KdaGivK/Dgi7gDM5C7UkgnUxnz/CHOExqQlmfpSQ+EL/?=
 =?us-ascii?Q?T1YwWmlvuN8cOnP2NjDC1fCri+M3FOFMFi+MY4NZCWQVsT2Pt+EVHi5bNBIe?=
 =?us-ascii?Q?nDHuqMFoOlodFWMY1hF+mPdzl66j0fxeVJxiCqk735H4BtYAQhicK1mxs44J?=
 =?us-ascii?Q?KyXlKmu4fZFZjtTLlF+RgcwJvP69kH5Xz4QQnF/vIHBs8OxV6VdKqPL+Q8Tm?=
 =?us-ascii?Q?KCXmXc9ynRiLYvle+FUz5TkoKVvPW2i2J9NqXSWDl88sFFMpOckRW8uaXXg6?=
 =?us-ascii?Q?aNskpm0VSttrpBTzLXcyIQgczHa0Kwe2f8az6EeEBqsMfiF8Tx68OA1F+UWq?=
 =?us-ascii?Q?b2sIEBBLdfzYSgFr6OSTg2xDNi0Oi+YJJQ9oYq+K03nFYgnB54S4DTWyuHY1?=
 =?us-ascii?Q?dSPg8tj00tUgm9QInxfCYLwB7ujV9j4As2PGRFMyp7ZKa5Ywx+xbWzq3OqFA?=
 =?us-ascii?Q?b29RSoIJkajWsEBO0Bc2Q8ysGgbqScTg90l9q8TJooo19DRkNwlK2hLmQt44?=
 =?us-ascii?Q?ulyekwWdc0C6ay17UC1bBo7fr+oAM6JCdAokivlDp/sr/EDGLH+98FsBmPuo?=
 =?us-ascii?Q?sGjZVqXzJGCZga9vYAdn/NaGKGgcPDM7KOTuTHHVl4HnbqE4JXWLyKsreyIl?=
 =?us-ascii?Q?6vwFnLXxcbJZi6oNp/Fz82KbNLPcPXGSKD1dVHBhuVRcrw7dTR4UXsUSXKRK?=
 =?us-ascii?Q?SuUyDwnRZP2+HVbm+zihlMU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c51831-805a-4919-f848-08dd02c34448
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 02:39:44.5250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0GNNvZQvSHXRtCGhwgU2SeJKpmIFC7gCoHB+1Tdjlv8IDFQOT5xJcsZbVc00/Iyfi94uvPy/AW8v+EywYjBUciIX3dUARxL85zm7xBJolWur+Xu4esdmaUDQrpYRlr3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6012

Simple Card Utils has simple_util_dai which is paired to snd_soc_dai,
and assmus that CPU/Codec DAI and its paired simple_util_dai are same
order for CPU/Codec

	simple_util_dai[0] <--> snd_soc_dai[0]
	simple_util_dai[1] <--> snd_soc_dai[1]
	...

So, it is using same index in for_each loop.

(X) gets simple_util_dai
(Y) gets snd_soc_dai

(Y)	for_each_rtd_cpu_dais(.., i, ..) {
(X)(A)		udai = simple_props_to_dai_cpu(.., i);
	}

(X)	for_each_prop_dai_cpu(.., i, ...) {
(Y)		dai = snd_soc_rtd_to_cpu(.., i);
		...
	}

But current Simple Card Utils didn't have simple_util_dai for
dummy DAI. So above (A) will get NULL pointer in such case.
This patch cares simple_util_dai for dummy DAI.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index d47c372228b34..24b371f320663 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -858,6 +858,10 @@ int simple_util_init_aux_jacks(struct simple_util_priv *priv, char *prefix)
 }
 EXPORT_SYMBOL_GPL(simple_util_init_aux_jacks);
 
+static struct simple_util_dai dummy_util_dais = {
+	.name = "dummy_util_dais",
+};
+
 int simple_util_init_priv(struct simple_util_priv *priv,
 			  struct link_info *li)
 {
@@ -929,6 +933,7 @@ int simple_util_init_priv(struct simple_util_priv *priv,
 			dai_link[i].cpus	= &snd_soc_dummy_dlc;
 			dai_props[i].num.cpus	=
 			dai_link[i].num_cpus	= 1;
+			dai_props[i].cpu_dai	= &dummy_util_dais;
 		}
 
 		if (li->num[i].codecs) {
@@ -951,6 +956,7 @@ int simple_util_init_priv(struct simple_util_priv *priv,
 			dai_link[i].codecs	= &snd_soc_dummy_dlc;
 			dai_props[i].num.codecs	=
 			dai_link[i].num_codecs	= 1;
+			dai_props[i].codec_dai	= &dummy_util_dais;
 		}
 
 		if (li->num[i].platforms) {
-- 
2.43.0

