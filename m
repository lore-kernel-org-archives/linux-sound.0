Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BF51917F9
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533704; cv=fail; b=g9eeDEo+ARnuJg44tjZU2DkMRct58XhrZK+xJ6ux22WCNAo/rBKtlkxA94QKVDqsdUTcbJoRjck6dmE17N/2MjSi75TplXjjCxWxYRHKmO0qRa58INr8+XY/y/6z+N9i6aSC2ldtQqd7IXgCEzF6lY7GsaSeuh8EzlBzL90/LR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533704; c=relaxed/simple;
	bh=ib95EQ+ODLuldnMv01+KT7BJu/YvtfvqScxmhlw9Vac=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NEO22TZCcbZ0fyN+tjxwsfKiwWhGQHT3QOil7i1YculvLkPAqzlgNsJ8ITExFKIMfNd/5/9jDYqfeKmUsChOcOM6O1iLLYfqi+A6mkTCcMY6nVk4s5lcqyNGuok7gKClnANiQSQ4fIGTDVL2M+dIELM2Fv4a8qCXyat8sWSEc2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TjiSTXnu; arc=fail smtp.client-ip=52.101.125.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TjiSTXnu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwDkAFbBO5pF7iac5qn4TFB7EkJfcwrv6FtRKaA0Pmzp8n8qbof2ts+gLVAjNRBCNszSezPIyBT8qP+kvrxi+YX7Sn0CoHjOnqBae++PlqCjvRapTDFetel6mb1/U796JW2pw1lrcDqWaCP0DTyxpokgtrGI+jIWj+e1WVuMsymBdI79Wm59n3fhBV7PnXMsvNb7fKWcbdClnWMzWcskxJNAUxVQgk40KJivNVczXGl4e+8cVRZwByyrcvI8xFlXaoy3RdmrkqFw9wfXcTLUSs9OixFBQvJncV6ed7HGhSszRLk/VTb/wTK6mthXofuBhWQszVIRpNS1FF6gW2UtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQqqFl1cdQzTRhTNaBqmLJQNOeRQR8J5kL8EYbdjqls=;
 b=CwAzPBG9hlP2zPKRieryVJLoVS6K3ggvHDokr7t8j1f7pTTRP3rSX+NDteUQPGkVMHv3gP0sK3Tbr1luzd5tzYb25JyEhBq9bKCxVIfXm6BGZ8oyvP0VXjj0z0uWbsy2pFSjr+f3jearLp488m5Jj2A+ptuFaUpLocREiuA8g6ztJT+RwK+8bDT0VtZFH/PbbSXvH8SmaWfTp+woJ0/v3+k0eSmUG9H8mK/ASfwgAq4fXSmkUYMb0euRyuRTET1JPyaALsJ9nURonpCG9hl+uAkTDLmKs2uk1pjID6qY4CYJS41JB3ZSr8g2HJ3FzeiNTNajiKXCXHUfzxH/1xDg6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQqqFl1cdQzTRhTNaBqmLJQNOeRQR8J5kL8EYbdjqls=;
 b=TjiSTXnugF0CvPjWNH5yNV/9+Xr9Rwios4BsANbWz2xGKSmPdy3ooCDFZbsKCYWWfoLh7GQghxo1VDa3ihFJKypiaC23+hEdz5DTlP9GsAg4jv4WF6gFSTwuqJXTo3z/dX1iqQO7Mf5RW951RhZVFJM4BORmxKXS2fEU3B1bbHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:35:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:00 +0000
Message-ID: <87bjupcwu4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 078/157] ASoC: codec: wm8753: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:59 +0000
X-ClientProxiedBy: TYCP286CA0295.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 080cf379-b654-4a14-92c2-08dd5605c8c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uQBzhblr19gXqLuf/ivP8lYmtt8uC2riYIpNbIIyam9v2tc/5djQPCgACqL4?=
 =?us-ascii?Q?UR34aQ5eYXSNqwRswxytzefAjI/y66SVo5AHC6c1udXdIx9eC5nbIA1ZC0jp?=
 =?us-ascii?Q?nZNxvB9gW4NfLisXDy1eo/cVGQ6EBka0PqQTm5N5fP5H+b8ccYODBrqSQWsc?=
 =?us-ascii?Q?8Jtr/sNhuFjJKYtg0mxWVfmZ1oTBbuHCC4KGCwFEgOwd3Tiy0yyzz/vnI+1h?=
 =?us-ascii?Q?LmJ6r9UGe5LOD6DJT0Po2xMRwhM2DBEYmGap9tfRUaD37Pg0zh/OuTH3Tb2c?=
 =?us-ascii?Q?3aK8y6LoTx7D0AeuxcgCSdp9eTcNXm9zGF/mU4ULN82K6Il2dCJXv9XP7D9q?=
 =?us-ascii?Q?Ox+uwAPnL3rzD2xrnRfyE6807hDu4kw4Nha4aLtBpb62fejwdHVIO494ppdt?=
 =?us-ascii?Q?TaFWt3O+IFPINjCrDl+QQjJwlYYpKj8aTT1EBGOtby73es9zNou4OcsPFUA9?=
 =?us-ascii?Q?83DkMkDKS2A36yt+aD0Ckf4fffFGtB86l+eS4uWNZTeptjhmnTegi3ogQaGG?=
 =?us-ascii?Q?RE+7RQGs/LE5FlaCWlDDtJ+YTi854CxvLGi94Yvb7Mvf1zzc6MY16WWaUgyj?=
 =?us-ascii?Q?re/XPIC1BpTM0TDgUEwnfLFJiSnNQ0IlOBl3M/V2eAL1QARXrtiyn2au0lxe?=
 =?us-ascii?Q?il7K7cg7VN/9rHdtm8HzyfFUWjzySG590dt37fnWiEs9U98C2j3gN/hzMLd3?=
 =?us-ascii?Q?6zVxM4Ni0miGi4Gl2wdSzdvJ5xWwLOKyF+ZG0ZAJAKsGViBX0rmH1JoibT9L?=
 =?us-ascii?Q?D82pHjAkIwSrQkMaCy7BVTwH+raP0JAmSStSGMqfKfcwiNzzdRk5v7DfqIB7?=
 =?us-ascii?Q?zS8B5h/5USAd2f6B9Q6KtkvR3RUV8N56BHO18o7FwEmbUq4tpooecAkrwQq4?=
 =?us-ascii?Q?QqSGzoIcOQmTyEXgienZ4JkA+HmW0uxsfkr6D0LlxS86fTYVIbtzCC8UKl1V?=
 =?us-ascii?Q?x6dH0HYYPsJO/TegMT5jrezCT5wpidVWOvRVP5cTtOJHTYUV5wkUZa7lKUY4?=
 =?us-ascii?Q?4D0e9Hy8FXVyWPDbkU21OwB+l6HiA3lbPxea3Kp4S2S35Jg4DYHGFhcmX5e8?=
 =?us-ascii?Q?U+ENdKdc0GeFd6mzWyvtXEMJUH2e9LxZgi55KVZ4Q+NnVLM0a1dPWv1DJwBQ?=
 =?us-ascii?Q?lwRs5WDW1s1iws0h8rmrv8aSJt6Vduyuqab6MJ+B4R9LhhIeI+my3vfa4718?=
 =?us-ascii?Q?rO/jmWNgfSpQF517gdtH/fPv+T2Z+UwoRp1MJlpOMgSdDkPOTNpvqhGBI66W?=
 =?us-ascii?Q?bVJrEn6+NH7LdOqPQhEl9EtILEe6h4wZwqTFiEUdU1cM3VbCA16R6t03wqHY?=
 =?us-ascii?Q?TohHeOyyu90V4smTu2IBL7E5+ZGGl2NnmuaZD8k6bZLC++r+/dj+ZQ0kSyZZ?=
 =?us-ascii?Q?s8vClZodL674VOCOCrMNh5aGS7TCSlWHk2JfsjPs1eXTWO7apXww5rYYHxEv?=
 =?us-ascii?Q?O3oiA9/a+MYziFZhU25Z32Ck+7oJvj3m?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SiOJ2gB4AJ9ZB4H4KoPFQ9HlkE4aYJZA5oM58koWnBqggdEZJy2ylvWfc5e3?=
 =?us-ascii?Q?U9fxh2Ey3NK7DvZY61kGaxP97SfXnzFXOcv6F33ljjqymHcxRzokyN/JXhDH?=
 =?us-ascii?Q?Echt1v0/BD2yG4E6h/ldNIynJ0NKgTMprYZ8NqgBVJB3IElEL+rgWmkgHYTp?=
 =?us-ascii?Q?29qBcdEm8kIqoiVC6A+IxJ3NWm2bzFlDiUAMcU3qKethgIOZwhzvpiTawtpP?=
 =?us-ascii?Q?YKeJHr0A0FoOs8d0nKuWxCYNkrPUsFIPFprnupRTwVvfZCRaOM1OU8eyJObd?=
 =?us-ascii?Q?/HMiRT8tCKK4oJXDI6fRE/VM17RM+pJidOzGVky8No0H1y3MgnXEkkkbcjKo?=
 =?us-ascii?Q?e7ziQNg/egx68QTDrSR+W4LpNEMYTyvkty6yZAb9jMb/yOrk6qIqT55g1Gqx?=
 =?us-ascii?Q?6FdU8b1EMqGLGfdedTUjpSnh5vfEClZyJw5IR06eum2NLpPAC00AygmBM6nV?=
 =?us-ascii?Q?2mzbYLnRWuc0VJq6ZdBJEL3803YfQOtMjqozxnxJ9XqQwLuOFLGxvZuw92GI?=
 =?us-ascii?Q?YC3y8DmeC8XJyYeHAJhaqvrlaIzO9mjg6n8M3rXP/MXSlAHI2oDzq2X0dZU3?=
 =?us-ascii?Q?odyIULe7abqkNyfgofClw8QwwiMpuZOPgDE7upEnVxLS1AyhuJXlxvgCpaDI?=
 =?us-ascii?Q?dOChhIKfxHA8lehxLxXhWfJvmWUshYMi06jja/41bx7M/m6MOe+X6jBkM4KP?=
 =?us-ascii?Q?oPyJtZtnOK0LPKY8qLIfycFF4/+4KbkfAJ6nW95vg6/JH7Tta3VbWBKwpzQe?=
 =?us-ascii?Q?6dXLW+klb7v3nWh8q6j/SsCtxxJ8n3lvkljZbhvEAcp1RvDMTtAjPjZpA7pp?=
 =?us-ascii?Q?XU0B8mEoq/nnubMuFTz+VPB9qDKt168ek0DjKUJ5aQ75WSxtWqnkgIczzaZi?=
 =?us-ascii?Q?u8q6efvv47CAStrzrTKMaL9ueEXr4QUwwZUqelmu5vIJdUnhMreA1ao9/KSG?=
 =?us-ascii?Q?qdbsgfxRtN4FWxyMF8zrFJkKoAT768UP7boSWLmerETLn5NobwhUGvpIwDtl?=
 =?us-ascii?Q?+zrUOZwZ3WxwFZL3ip6QdJ46kYLuEQ4RlFNDHx2wHvWnoZ4desdl6MluNJO7?=
 =?us-ascii?Q?RDOOm+MKpwBrRNMOK9u5NQF6KO/GvHYl7lcsTAOVtNx5j2wgqOQnqiZDIMBs?=
 =?us-ascii?Q?q2TOqDWSNhf9wQpsuEGCbtZVX6NN0V7Iu20UCiVr6NZ6CoO8q+u/gSsOCqjL?=
 =?us-ascii?Q?8R0S2c0sQ1HpOguOTNvbLTDHSTiu8960hkhCp8qyOFYojIeaZbYHDxaeAnsu?=
 =?us-ascii?Q?WCLpeMkCZuZtULyZ603zithCH/2MSSqhmDgyTfNk3FikHgsP8Xnx/bmapb0R?=
 =?us-ascii?Q?SnxltbEctaacmmV5Z/SEFb58SzaNy1178K8XnZ4/h/tNwRMzvwPOg7TDI+Xk?=
 =?us-ascii?Q?+NYcRDFb7DSfCVZVXSdx7Hzq8OmLs8hm2FgnA7mZqnZFop5be+i3X17veQPl?=
 =?us-ascii?Q?DSTzD6LDfzeXr5Ioe5SfBPtXZBElW781WXsv8CWxBL7O+j68X0vNXGudp52Z?=
 =?us-ascii?Q?tCpl2dwaIxcCo3+g/7vEPwYeXqsujWLhbdQjQzBYUdy1gwA20WSEaad9+l+k?=
 =?us-ascii?Q?TTTcdXQmB6zldOBeWhdIvEbDebQckO+pPJVyEEwsFJ98Xwq4C5MbvhE1bQt6?=
 =?us-ascii?Q?ZPE9na4U+nFa4lXcs5vr6mc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 080cf379-b654-4a14-92c2-08dd5605c8c2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:00.0965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPFihcHYZxwWcL0lOa5NgHHsQoN/iClR/88bEm1FNGVoRiCWFpt38By5mZqi7+p+Qqm2d/vLuE3gfzQ9XflKgqxH/FTrZak6XpVrKGaKZhnQsWkh6h7BkozH9jLPwWom
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8753.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8753.c b/sound/soc/codecs/wm8753.c
index 38b76b7275e5..43cc368cf3f3 100644
--- a/sound/soc/codecs/wm8753.c
+++ b/sound/soc/codecs/wm8753.c
@@ -963,12 +963,12 @@ static int wm8753_pcm_set_dai_fmt(struct snd_soc_component *component,
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		ioctl |= 0x2;
 		fallthrough;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		voice |= 0x0040;
 		break;
 	default:
@@ -1089,12 +1089,12 @@ static int wm8753_i2s_set_dai_fmt(struct snd_soc_component *component,
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		ioctl |= 0x1;
 		fallthrough;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		hifi |= 0x0040;
 		break;
 	default:
-- 
2.43.0

