Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B997C1EA73
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533431; cv=fail; b=sZ0v4Vm+O/Mcu87p+knWZ/8rj3S5HA6nwAmUdWbNqeV/dby+MhjkcBe4DyP4uOONb03qYaLfX3Q304Bx4rimg6jDhq2j7Q5dMRDaE+gkW+eqn80ujCEM3Z9placU3NsUDTJt4TYKELiJb6xvyDbxLAjS4P+WA5QUVDn6Z632NB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533431; c=relaxed/simple;
	bh=pQf1eM/PYX5UdNBfHOQjN/ZjGVqNkxeifW2chbI2lZY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qQSnynP6T7fOW7Y5OXIDxUC1xztO7yY4PyZwSI7EzDRcM447OCLDBweKR9wmC1KTVl9NUalxcAbkkX8+juwOXigj916XjkziU1o/N2oxDRaN15dvy3z+Ia9DaS55zUp1bAKBxvg2nV+IDkNGeCSsD88cDlnnUfqbq1cHzPp60EQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZGWaa5Ii; arc=fail smtp.client-ip=52.101.229.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZGWaa5Ii"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDzjhn3dnOxvdADj+sDq6fc4hb8x/VTivOSSh+WOk/KeoKdXLRnSX/LiHo77+U8YDsOuZXTIFIyVdbgpB1vePWcyUOy0Mkd42W+L8Inx/Sx1mKuX/t3Po8SRGDAv+OG+h4lMsmlFPOM8LATGFwLsqoPwDPHHa6EWsgAsRMyenYxIGLjt4cqrAWL0VbVfMLj0in5s6AdSiDqSTdYauFZnDoC33G0o4M40D6JY4wqR13e+iiKA2+ZpOlNjTe8IUblp/3DOKBoot+lo0yfXDZ5egeFiQq2faGY84a5l+khNMHkL92icUB1+vKs+j76VWhqOpeUD4NtpcVi33PxCBLsphA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ku2tKJQ3msLpm0P2SYnVnlyEZlLNtpU4rYHPmRoQD7U=;
 b=O3M4+JM4j2CmpQCq9MQFB6F4EGQBfBPaX5rPTWQOx8i7bIr1Jwll2rJG7jPAsTW3dhIdYp5bFwM/lTaoV9qzeSLqJu7B8SN9BVjv7CdOkb/cCIWrwsbxUemaNLnRi9JZZgzZq++VNEx+jQrFQ60CtZaCa+Ie+ovrJ2DOGYlitScqnU5vFxOgUflpfF30Zq8JDw4iMfRgn6cMeJuwBvHyCne7trS/y2jImHjfshDcmocMF4+BPf0eW5pDvVMTMomdCRcNgaVfH92LYQVNPIFkFYFfqC9rZFzDiyJ9IMbJdA4ihYdjdZn5HAc+wTz8WgridWS/+3FTzEYS+cnS/3cIGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ku2tKJQ3msLpm0P2SYnVnlyEZlLNtpU4rYHPmRoQD7U=;
 b=ZGWaa5IiyeoijoxrmT/FbO2PSgVHH1GR1Ges8NZV/lfllRtlFCMuK+DL1dd9R2Bw5S2Q5nIDFDGMrN3aalas+kvLPfLyJdghnEZHvttr//a8YjnQhdi+ztDeHAm0PUNlHhDrRN+VXACQR3u2BCQ7J/K8VVzruPMGIlZQdZIRL50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:30:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:30:27 +0000
Message-ID: <8734g1h4r0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 009/157] ASoC: amd: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:30:27 +0000
X-ClientProxiedBy: TYAPR01CA0075.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b17d83-9fca-4e23-3bf8-08dd5605266f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8k+xGBp9XWAyPu5x2vf/vgbtFd/c8DCaJ+APV0xtd95jdl/b9BqcTs93o0so?=
 =?us-ascii?Q?xO2PG+Cuqxs9VasX2RLWn8MCbeqgKDit0v2/B9VhY/ZMATma7A2f/1Q4+yjJ?=
 =?us-ascii?Q?LfERsTs9zwdI9XWUbJejxVs15vgdVUeLJcTDK2ZQ01HVsNx3HvLz6DrgDYeM?=
 =?us-ascii?Q?BogVEdnzfuwnlmOQ7UuG/BLzTuJMRdVV/Q6+cKcNO7ReGoZ0tzOieaOVSZiL?=
 =?us-ascii?Q?+5UoI8cnN0bM17r3FmaNrY8XLaE/UvN1AYmLdnuRg7kMf/fI/Jx2pIW8q9zD?=
 =?us-ascii?Q?7HHqwsysDEHRWv+BcmPTxsWpsUmn8mwTJdx/vWMUoUu1Ph4Gw5G/e20ghzjt?=
 =?us-ascii?Q?O+j6ZChH+ohNmFV+6vtbMFZ/GeApo6BAiKwLZcHl+bKl14Me/SoY+m01lE2K?=
 =?us-ascii?Q?2LbVGD04wsOduJfTL1wFGr4b2BHyKqBhIj8freTZwA4drJeS2zV6nHP3isxL?=
 =?us-ascii?Q?eQBSW8wwqcrOYwzpGaz8yJVPdjw7ghVrpcoufja+hlHwQzqWVNa8iTeb/8DG?=
 =?us-ascii?Q?M3eeql85fCr882trEtrx3/WHwnxSebLOXvzHly0y9EbSpbk5gNmiB01GXECW?=
 =?us-ascii?Q?Ntw4iMnBaN44wRpmChNJj/ZWoTuPschb9Q0OsMMsSe7553sc5jdYnGOR3LhJ?=
 =?us-ascii?Q?HKsWW56xCvQ4eeu6PhxtVlbSO4ZYQEaB57rzR1ktOsKURW6mLzAlQkm7rsSE?=
 =?us-ascii?Q?yszwAxw6qIpA5hH4ys1uy2cTKIpU7CWTfQTX17VfPXOyFNSfwNvYPqftPGLW?=
 =?us-ascii?Q?lqTG42Db7VbhHUBrlxiQazJ/0veKAupR8z+D3w5Ia89XL7Gy3jCW8maDvSAQ?=
 =?us-ascii?Q?ACJUroY0dwTiV6KP1b1iKHwB8DYKWDGdORTtwU5RyeHGnjf7lCHOGUXDNGos?=
 =?us-ascii?Q?1jA7QCQ7ktp+Rlr54Nzj741iOgrICl29WVlGjaJlJA13ydEcB8LyTJD5RZzI?=
 =?us-ascii?Q?2gqyScEemBSb+ok0Jn4oh2yAoXOjZVyjZYWM+v77hOLbyWKsQahcdy+yvsiv?=
 =?us-ascii?Q?x8K7IlncAz5dt6TSJ+xkvOxC2JKMl+2tB35sYTqwKSw5xOENIwt+iSc2O61O?=
 =?us-ascii?Q?mwN2NFxvSfujMz2BNfzjFYnZAy8+FYHj9mjYCxabBcjN2jJiEqVZ3y20zzTA?=
 =?us-ascii?Q?ylNeOf+nrjtoikDnHcC/DI+g86pgl8um6RXw/LgbspoUEBXwYvHhQ3kN70Hi?=
 =?us-ascii?Q?GjuBHjjZpSqSt04zcQ6zNHaQ8ajMos7BEcjqVsfIHBxtfybFecf29X/PA/v+?=
 =?us-ascii?Q?SoDonLpDfYZSCa7VDjlrdK+yqmt1AypN96E/YffvtkaCjScQK9W3W6CNNx+i?=
 =?us-ascii?Q?rV+cdpLWJW7H5HQEpxctVHMmhD1oHBnOz6YAd4Os8Is6JpJrqz6rywJJQQW/?=
 =?us-ascii?Q?BWuGopcWM9vKXBHrhQuQAV4o5HGFsyFeamwfAuquJrC74xB8FYIkKKnJ6shu?=
 =?us-ascii?Q?L8X7/ANHp/eGKvQyp+J7CUiZdbBSXH+h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lPK39o20ASZ0Bi3Ke+qeBMsBKnWwyT7evmcpNdbBeKOpfKCj4mnkdspPtTIM?=
 =?us-ascii?Q?1lGL6xbph6tR/WurgKGuRxZnMKPfOsY420u+OMX269LOX0qEs1M+LJsQNOHl?=
 =?us-ascii?Q?4sFwoCEwzikujzEqyUKfnb16JRr8bPu8SEUCdUh+I6FhAk8gn432TRVa9pin?=
 =?us-ascii?Q?1X0nUoWC4liCw9cNriRHTgihhMzddPsritSWftsdQEUr9Vi8SH8V8Xn4EcdB?=
 =?us-ascii?Q?38yCIGMrm8wPes32fvggI3f9mHZ/7536c2B8PLnNiIftcECCkcl8pAr5oX4J?=
 =?us-ascii?Q?EezaB1E4yS8q4lQt5kY0BlXFyeS8HxDR4NkYlhwha5MZOF/1dkkP49Vdg2RS?=
 =?us-ascii?Q?Royd/b2Hm8MUOHHOuQZnIEErJjv7zZ3HYiaglV0zMUomC+pu67mA0SkzvLtD?=
 =?us-ascii?Q?u1AsUJbBjh8K8/1Bpd1QtwV7hp3rHegWRMYMPG3ILxHnrknST6fOArkGQDKa?=
 =?us-ascii?Q?hEExjY0XglyBQQZ1uj56xUm1+GKCgZpItKAYhAtC31ipOrfjSmAWZyPWxIKt?=
 =?us-ascii?Q?GOrZI63iCscnLgyKJfp5cQTE+XnKz74I5uib9Qe0/IDJzX/DlQ/IalSvZQbG?=
 =?us-ascii?Q?z6OEjNbC+HVjfkXqGIUbWir2ddLgTBs60zWt5zqJ3wrTa111+YnCHn9fTLq1?=
 =?us-ascii?Q?76taKCcJEXcqkrwLP4K7r9W2qPGmbCdOtk4XE55WYS028TCKRSnwntPSvbK9?=
 =?us-ascii?Q?Fl/B7VTh5rEKGyJQM2lo1NhHpjxw87Po4rQR6XVtQeTBWHU4y+sgXWfynvx1?=
 =?us-ascii?Q?jeNN3je7TznGYPfUPZg/DkNE3XrgjVxwZx9yzktEgDWm3h5KFEqqjR4e1k3G?=
 =?us-ascii?Q?htpiiObV88P2t7mbFa2yF57V4axa9vJCbrilguRlEWqjqGiUEXVTSsK0bPsc?=
 =?us-ascii?Q?Qwy6kvFqc/S/+vJZhTFoNOUXF0ZiNfiuPkYcAQMR5PIL6miUvsKPU1nMaomi?=
 =?us-ascii?Q?rBYsSl541Dj5zjoIJlPlT3TAHquWc1JgjSrbSvDEeSqrvK91Qaqb8+XJGBff?=
 =?us-ascii?Q?AxV+cJlKNM77jvwCeEG7RTcI2qYmuyrNelfuoW4dYHJgXeP6wOAqrOkfjyEX?=
 =?us-ascii?Q?aO8N/BhPK+d/Qylrw4V64RWB5wruTQC9ZlWNc2du1g7+KDcxLltIiafCiOro?=
 =?us-ascii?Q?c8/rlrIo1bUhQdR09sv53JsLWbUCwQU4nJFgdAuVnVfuEmgOuR9wPEsG18sI?=
 =?us-ascii?Q?pX9s1cneF/ob8DZOZfnbVXA2GjQhXL3q0GGsRLuqXfcXCuMjdvtLYOp3Ac14?=
 =?us-ascii?Q?IvWX7VloANhQ90dZe2C8mv/n8MJaEt17Dz0GYZdh+ORejkjEBTgStTDaA+bQ?=
 =?us-ascii?Q?lSBOxweJQlFjQ88vqv5Or9Rp4lKIuowtbm8WE+hrGCNJ4E5/F9kW1BTr0lPO?=
 =?us-ascii?Q?AW27yRxL92hYiQAbQxY3767/bfGFWLjJsgdm1JjumfTmClS49j362q4PJrqa?=
 =?us-ascii?Q?dlcruoP8mxtVOStYe9cTVkxvANx75f5POq45QzN5edX09fEm7ka6y64kjkKh?=
 =?us-ascii?Q?xFWfnv1gm9aVpiH0Ehk2VhTwZOeyas3rIBAwMdItrSZp0QBHaD2tVQca5L9W?=
 =?us-ascii?Q?3pLj9gQY41y++PZTwa75QPhnrjnjVlmrMSWPknY8GKRLLkfiWcVR48aLN542?=
 =?us-ascii?Q?jb3kzbnC62F31R3N9+PXfSE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b17d83-9fca-4e23-3bf8-08dd5605266f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:30:27.7520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJLdE/H65J1PbaV4e8F/4GPyAdiieiLKqnHc8gxcnvf3V4QWY2Ek8BbraCP6Dnnf+kjyfvV6tVaz2yxZrdTvEWMqE6Uh1d1IAYG+xJDa//nVAcELPiSlrelcJzVgPCSc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index f7602c1769bf..a0dab85088ec 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -919,7 +919,7 @@ static int acp_max98388_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 
 	ret = snd_soc_dai_set_fmt(codec_dai,
-				  SND_SOC_DAIFMT_CBS_CFS | SND_SOC_DAIFMT_I2S |
+				  SND_SOC_DAIFMT_CBC_CFC | SND_SOC_DAIFMT_I2S |
 				  SND_SOC_DAIFMT_NB_NF);
 	if (ret < 0)
 		return ret;
-- 
2.43.0

