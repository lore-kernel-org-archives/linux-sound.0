Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B790514B06C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533460; cv=fail; b=BVGSmejoc1MdEgynEJg976vZC/Fvnp0xY4EHv4x9plsr5qL6jgfijFTELOHrJUyo/AzcB4cVsHPlxifH+gOzlPdOSIVukFHH6RXSkl4BzUBBPZ7llumiInTk+f/LfB3EI7CNtMQYEbJYrA3TwwnmQTBhNdqCL3NPJ5bonnTcJvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533460; c=relaxed/simple;
	bh=x3RrObowGubfGXwZKVuQ+m/OJzbudTm5ScnYY/JRmSI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t+7DQWDYpmg6oQyS8PwxyZfMSj0Z+SnJr8Y/d5GaY4CzVAypwHNlBxXWSVQ4WiSfVcMTZrAtPFH6aDeRPAvtsZjp4+ZGpt38ehyKKsjlL2Az54Hs4LDCBmaJoPQQr9kfaTPIjqgNHZbvYvwf1NWhp7jj17wPDHMxSe8j6IKBhSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dM5Gm1dD; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dM5Gm1dD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xker7K0+mtzxhn31RbANL8c6GT2s/uAcJGUH5nz8aQMlrn7wR7Q7XZbNaHivRtIJxSublHTc3j3mzec90J3GcNUiVRfAwpDx9Fbq1TWtqljJ3Swbp3/ArmtflyndUG3jiEW6ACaDKyV6ZKeVKTRDR2mpi834QL+lzRnVErJXTHxDsUY8bAQlA72UOxNiuyFZECfrdqTvv5d8WTgygT4X75bF753QNBjGcZnIaswryD1PG0Bx/zjjd5xNvRuPV7S5BG+m0Rho4V22VEjbpq5MEig6dUBrmavrnTFI7fJCtRnRPFfuZKfdJqlecWHhdMVSnXkZNxRyg42x8Op/uC+MsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sa1MBZiO3KgRmpUfJHY3n+MJcAUX22uTMw1nPn8fojw=;
 b=PFcQuXBmZi6k2dBtN5XOM6o+51jb2+zXrbUN62C7QfH5/L+Eo7ycGElFCB6p8DYSobDNIsgCXYEDlNp6o+ywasxp1sBmdwZbnEOkfR6whXDauygQ2yDc51mqHnHZeZBoEU8XBYDvc7hX+4gQGykZmp6sJBi4GwwjWQ3p4cy9wb9Qt9HvYQtEGlJGL/byLo5xafrCQkuZ8STdzYebt8jw8ZcdTLhBx9sZu2pTyqS3RGaoDMM1GCkoZjdLF7iYnv+ewTD9vNBNTHoZshEQ/7ukyYPhPra5Dj7Tk1qQjbcy/3yVVN+8W/uA8qa0e8oH3JaTVhdewOCAS7kyJxgGm/U3gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sa1MBZiO3KgRmpUfJHY3n+MJcAUX22uTMw1nPn8fojw=;
 b=dM5Gm1dDPlHdWFEbOqFL/FIOoInjMvDryZtJRUp/isz4k94D7fDh2KwjqtdVCSEhaYdMIah9r4SnhBvnw107+qIG2jng6Dy5ikNERbGf+0taH4BaLcQgt19EY+cOT9pfzVOwYtBPHEDTssqexWzoPN+KTeTk1fxAI6JuWAIt1So=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:30:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:30:56 +0000
Message-ID: <87tt8hfq5r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 015/157] ASoC: codec: cs4234: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:30:56 +0000
X-ClientProxiedBy: TYCP286CA0326.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 57091063-2872-49e6-7960-08dd560537d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HqqTnGBHIfI0PEc3rsGJjX7pqaf/sf3vpRuM3avpaI4wPStzGLUBG/wA3Hab?=
 =?us-ascii?Q?qia7ShZF1AaFmb8Now1ZL1rcdZHbF1ayr38U+Lf3N/kAH/OqLj8RZPOblsc3?=
 =?us-ascii?Q?IV/EPJIYnRwA9DX6ohDwQB04LmPdc2GxCRaKadLWHTu0bPMHWuK8sKUqHRJz?=
 =?us-ascii?Q?KDU5B8hUCVR5qvO7Daw7uQ1BXDfV0v6gZtUnUwzWKDCyFUicuNGj1m+jQqK1?=
 =?us-ascii?Q?eQvNgQ7vjuMETcLHuoIPPP/RSmwLrUdbPTshZe8h1XgQ+/p83t0AI3BoUKHK?=
 =?us-ascii?Q?FCc0dVjWQxd8PjebnjcVT0Y+WF/G0vDiEZt/fiOQWsGsKffvm2UFysiYp0V/?=
 =?us-ascii?Q?l7WH+6zk9vwtcb0/18SOgX8CyJ9xXQusmtAOwNqPh99u/YDGU1ePBspDEA2m?=
 =?us-ascii?Q?yP2pSfllP6ovJsKwvD/DnPxxVWixyXyAcPsUY7sqwX7SM+ct0gCDP6EiRXpB?=
 =?us-ascii?Q?eUf/f7Bb29E3xPchtpqYA6HRW42g6CB+YsZbLoN/Scxk3DKWggzhHNgokBxU?=
 =?us-ascii?Q?pcZuuetbvnrKAcv63wbIyDgoHSPwuTbd6YuUrrSol8wLyRsdBmSNDTZIFMtb?=
 =?us-ascii?Q?0JB9AZ6/XOK6axsnuG+UBI7SMH4erqNsOV4hxGUcWbuAxnzcy+1h5OzSMkCB?=
 =?us-ascii?Q?iRHEqK+WM0v1foprVU7wnTbFDoEi4m/9Xk2n+JglpPdr0m+1Bb5E0eYrnmDw?=
 =?us-ascii?Q?rB2T6hKZcvmgavuXwlmol6KBwNmnTlv6Wd8R2s3670aiy9EyG3YtAqcp500K?=
 =?us-ascii?Q?Jvs0XJ7k6jmrGvoLRDHUzg9MoGwKFklGPWcv1Sb/35CMmStFsOYRt0RmC/6K?=
 =?us-ascii?Q?EI2tMSUvvuMIvzpTgYeqvw4wYUXA1z42z0CjtjR7zX4qXhUNgAvoiUmAxVCV?=
 =?us-ascii?Q?NQijhAAC9q8zFnilg59NkRzZWVpHa3ZnEBLCIeIuLU8EbPlFeUQb57JMuV4K?=
 =?us-ascii?Q?0tei9ZfbgpGKQ4kRFj5sSZNfpNYyf86sP/tzrM5hwSO75FhfDh6NizKjgPms?=
 =?us-ascii?Q?MCih010/qcZpKditLjgz97c64PbrD9Mp/fJIkod8CbmqJz/n5i+KoahS+d2x?=
 =?us-ascii?Q?si6Sb4CS3oO6oe4QDkSUtnZ61NoP4X1Rfu3+t9T5EZL3BNG3clNPexHLM5PC?=
 =?us-ascii?Q?OwNeoNywi59rZlOlQy4nCMKdZ7EiuNtoY3lAPhmId9esyMAYbaDzb0hNKiLx?=
 =?us-ascii?Q?PsjRkYmpU8mKXsaMkdE9y0Df8p/Hd9ZuPufydKd8EbZnzHi1PHKRanq9oWH4?=
 =?us-ascii?Q?EdXnysrl+TTYX6ilXJB0GSy1ZLOeqCrsJkwvik5O1Mg3yI8bvoSgYFmgogLb?=
 =?us-ascii?Q?pwhwqY2k7hT7UDVd8nMEsEMc/4wmuxespOW0Fn+I4O9joApzCBSocOTHS3XC?=
 =?us-ascii?Q?0OgjeZyyYqImOLCHclb3L3M6NeZK+o/hERS+x8zm46MHKtpP4ezXaM1VsyL4?=
 =?us-ascii?Q?9bPcC66tg1pjz2T64MzGpVwym/iBnafW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ht4BfbLo4D2S17IMaFhfubOM5g24tSobhmYKXpX+MegBv/9D710bEqQkRles?=
 =?us-ascii?Q?o8e/HDEIW1dcQEUD5feDWnAc7dMp2tNAaw3bF3x9dJm56gyMz65qXTRQpBnF?=
 =?us-ascii?Q?FPn9NkFNtroVSh5bv/w5fR/SR37hKmZ12gDAsuENO8QwJdN2e9WgJRZOFAOz?=
 =?us-ascii?Q?dhjUxcnC2SVTWqJ+DIGlDujka6fgI1bZGzNrIS7G1J+vtmPuw6ElYUzhuCzO?=
 =?us-ascii?Q?XTBuszyAXhWmSwg7S8pEWGjVCqQO92QG4vT8x7SKu3MVtp3fxCU/vKUYUzO9?=
 =?us-ascii?Q?kHWN7d7Uq56KCAFyIScPEyiDIYSpitTVbGHA9oAMnrMRxzQL529ntkLc1sZU?=
 =?us-ascii?Q?KWIyIxG1HtuWAPblXoyfq/f1KuKi5zMF92I4rfi2pivGzd/cXyobKsiAMt3g?=
 =?us-ascii?Q?p5CeFre1dkeTUTKtQadipcoqFH59pPgdNvrbUVrRVqsugVWupmY4vintp8AN?=
 =?us-ascii?Q?2Z6m8mg9Nqo7s0WE7gSlzGxtH53LeEXcuHYbQdk5uUVWXqMl1D/KaY//cgOJ?=
 =?us-ascii?Q?2jCF3QyfAll7Q0SrCRLbJS7IcPv6850kMpXgFHLty1rPru9TRHmbHV1lo6LJ?=
 =?us-ascii?Q?OeaujZix6B+hKRQ8ILPwTNTtCbdWMQr7SPVDDOioiQxk1sEFHQA5oHO4zxOe?=
 =?us-ascii?Q?tNm0oJy75mii4M93d47mL79k+jL69XMyJ251A26vHLClIEh02pibOJpPNxXS?=
 =?us-ascii?Q?fPa3BAaqK2hW4KllrZ0BprncVBuCYeNF2vBvYsbiwWfq+iHUvl+F+iH4D1Dm?=
 =?us-ascii?Q?T9c2NJu7+OwBEJIdTFB7hzajpKxcrUbcycWNW7Xkxi1RmGe7rZFdTvWGGoDY?=
 =?us-ascii?Q?W+0xg84+0oQT1Uf2PdOxwaYw7dZRIGtw7dBOjBbFWLvyGvWvpWvNTCSnHIOv?=
 =?us-ascii?Q?UGXZ/NNksoYKbqCLbltvzEhF1xO5fwlhRwcNX/61nBkiq0sGZVw6Hp8AAMgV?=
 =?us-ascii?Q?/hwp7/9v/DeQGE7PlDnHXVTCuhA9Xn5kLhcZWB4Cj+JkLYirRHDb8PxsZIn8?=
 =?us-ascii?Q?oj52SjB+nY7i3YLy06i8Jb4ulpa+tet3q+KhYoJwyrcymNVRLEmNRphhuZrh?=
 =?us-ascii?Q?ONXenZvsAo5Zgc1fwgF6HGMEXaibah3oALQ8buD6J1osk1gxCytn/r5zDB6a?=
 =?us-ascii?Q?08npWJcO4PS19SEKXJ4rNnHa8PLkE5SayG5lG361LyuY3NV62OkGqKK9pXKg?=
 =?us-ascii?Q?/I5TyTJmHmF6w48Ar8zRZD5sTbRo+LDHBnuBgNdrZ5lhlOv5lt2cFzEXz3bh?=
 =?us-ascii?Q?dVg0qlT6IsFs3wBEyFOivRIXxYQ4CmC3wKCHDmxh0jhdUSbrPn/FsSjaEtLh?=
 =?us-ascii?Q?RpAY5z/NNVhJY3stZ7ziQTSnF93KBiqA01YyElyb5ZPARAmypfrrpJqqEPhb?=
 =?us-ascii?Q?ae2Hw+kfzlUS7zloLzmujI4e8kk6znCa0egsNyTlvn9XeYqljNcjOwnNTq9Y?=
 =?us-ascii?Q?rEpiPHKoaqTepi5xP8PmITexfbEBi6gU2OGVt/hIfkSOwdzSsB7ooOPPIkPB?=
 =?us-ascii?Q?wytShQzvC2ilLD+UKLuMqLaindL5wB1Cc9NrFexA/zh2qQNXD03QPw1b2Kt1?=
 =?us-ascii?Q?r5BVLm+CiBbn/leKR93ZmX1RwAQhV+Fh7OjLGgybabUsKYvnkfdZcKoZkVPo?=
 =?us-ascii?Q?VlWyuGkQ7d6SBJeq+SzXqQc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57091063-2872-49e6-7960-08dd560537d2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:30:56.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGgDLr8IZ+VvY3+8K1k9Pi8ypmUVsl0bt8jP8RtdjLwfgVgXMan0/TWYuXuSI3wIYOgg34VfQVIT3/srtGaCYiGvWtimGr86f7fYDppuRZGyusRSf1GCaJ/TUkUWdu/o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs4234.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4234.c b/sound/soc/codecs/cs4234.c
index 69287ba7e955..df160db5bbb5 100644
--- a/sound/soc/codecs/cs4234.c
+++ b/sound/soc/codecs/cs4234.c
@@ -307,9 +307,9 @@ static int cs4234_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int format
 	}
 
 	switch (format & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		if (cs4234->format == SND_SOC_DAIFMT_DSP_A) {
 			dev_err(component->dev, "Unsupported DSP A format in master mode\n");
 			return -EINVAL;
-- 
2.43.0

