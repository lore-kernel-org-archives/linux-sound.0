Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288257;
	b=O8FiqGEtAWZloyKWAQ73MI+sSBboraGe4GBhnyWrZ8jHTmDD8gA47bpeTDZIDCg2pSOq
	 7zgFyujGduLjv603vR0YCu0E3YA/WqCo7ePBbNkCIHIZEdbU6nSv47dMX77qbCLEqHBZV
	 7Nz/C6rfmS9aulv5Np1/LRgCNAms1/8UdrYWeCZPQxVlOxY+d0KC6qedzB8GRK3UK05dI
	 yVJunFSbEg/PdkHCIvw9TIcu3dDzo7qX1HPlWLQkcu8A6eX2L7PIssgYeBr1nAW3xQjg+
	 crnMte40mRcNXKJhmn/doE6cVAFATH9KO+7wWD3xMkoqRw1G7EeyJo5tdpbMoIdcVIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288257;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JKbk+9AoK86BVeLhckHzuB48YjxHKN3JqREkN8h+Pug=;
	b=J3lMGl1CEPA04dPsTC24sZX/3zzfv20re/wGNipW9YRd+haWaVl62LbH+5lm43Ak/tHG
	 pigeHuC9NJhK1fN/OWCRjj/njrKh341uKF/WWRpFilBDw0mEq17CNCoY0iIWeCEisgFbq
	 FkIFXELt3pvPzQb3fPoj42CmWwGGjMAiHVwTPoUj24XsFxxbnH8soePCi0MNjGOlhEMkS
	 egJkFxN+eM7cI5ZOjuGGwblzI6m7A2EpGTXQsivmH+nRAygCpel2aePTBA3OP/++rQFJW
	 L2Izi98oOIiOc9G2aKEUC+pdDAfGwFLNpbQcZZgD2+B8PRqtQWDByDQBbgTzCR6HJ2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b="c/aFxJin";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.17
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010017.outbound.protection.outlook.com [52.101.229.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CE2606A332
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6CE2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=c/aFxJin
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUgEVfc/Z/abqDrbVO0STSwF4KGQG9Ljd7IynQ/bwMpwerdD3iWxjGd00kJ2y2YVi2QGTkCfMGDGz5CiA9lrXdXDVSQYnVRf2CJiZC0u4EdNrIuhYOoIpryMy2rqoJxbe4BqsROKIHHtmXCEwMvWyOgKfJ+Dr47qtLqLDjnib9cbEcA+wdcwKZ6JRqahGct9lDwACdGn19BWG3MhUZPxckkg7cU5yVNqb7x4AEnYRsgdnAtOLTAIJeka9Bk+BgU1GVbrBQexKmPqZocRqxhPHo8oiGIzVYeA5ilFU4O2wAF/auuWo36Jv74sA+ysXTTyMTzLaPI0tZ9vBEQh34jJ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKbk+9AoK86BVeLhckHzuB48YjxHKN3JqREkN8h+Pug=;
 b=uO8Ls9Zh1JNw+Gro5VIMewmGGpzTUCPWEEIJD5wwmD1ZOt9aBQYqE549kycaFp7mDPOeb0w5mUIVR6Ph1jDRcXjs/td/vkkAXpTPQ1eQOXVx7FG/uXCE34hKoaYkajpp6YBBTaec60E55BG1ntthx54ZAyPhJ2t/ZqLEMIGoWihW9dxAPwUU/z65Yp3p52fyNQzIo2eAcEUU9hzkCPhYxGdTYNkXk2eIZVYhpSWk3ZuTsIff96bKLsk8WUtL/HdUqr5HgQRdLKHVSuO/m3UdlIrJVZJUxQ2LFM2T+OywJxgSE+P9kPmfO6DvGZQ1jkaq9Wa8wT17Y+SqINVLXQNdzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKbk+9AoK86BVeLhckHzuB48YjxHKN3JqREkN8h+Pug=;
 b=c/aFxJin1hOQKGPDf1WpKue/Qm0nuDTH3N/mmnerpOQSB3Akp9mOdMByUcS/lIQFyDdVglzaRHhtnZOT1F2eNn+rJndsJAkK0n15PmrrknlomibtTTBK64nKOkxGCXrfdNxp4EoPEZb5Ws6qaMsTKyW1hjjStqdYAEFxFLw190I=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSCPR01MB12483.jpnprd01.prod.outlook.com (2603:1096:604:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:24:14 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:24:13 +0000
Message-ID: <87wlqlmf7m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/20] ASoC: soc-component: add snd_soc_component_to_dev()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:24:13 +0000
X-ClientProxiedBy: OS0PR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:604:24::9) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OSCPR01MB12483:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d695ab-3ef9-4b3d-10af-08df3eeadb78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|18002099003|22082099003|10067099003|11063799006|261022105027099003|261102130727099003|261102123227099003|261028144727099003|261026121527099003|261009223027099003|261026140227099003|56012099006|261021121427099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	PIZIKPqIF7kqPA/wVimIDZ/6VBCFCioex/lJ0N7k+2uSyNeEYLu425lror+60u52cLwkEPHLkG1TqNqqnui09dG4FM0+fprbM22MFwmd5HGFdtylvmp48B3V+SDnHWRhxaG1lHEhGdL/3ngq1F+1+YHDJ0eRiZhtoP/C+1MfWVn2FvIsv2LUDl4jez0eAQFkqAm4ezaXXlf/HYQDg2OIjGMvHVQ8gk161slXwxv4dyJcYDkNrZlgTeVD89tCVynvkpG+QadXUOr8X2L/ZK9/st7GePhRB3Nhe/xd5JMiEkbGsRLCn+8nrbkrnWrlFODhE4oi+kULUjTiz536yOjg6rQJuU3E2Pw8Vxze9v1hSDH8DlPBlYqEunf0zAWa+ZeproUzj5pe5YfAOhUdy4ofw4A1qtZT6PWlKcVUbtGw8xnVR6tfmQL8JKzy5LLSzjkKdjYsLmeMfLXJrz7BEZIo7jK1PnX/QJr/Lam/MKlHUArUi2zf/FRsX+7zSGusIzjTBBhnLsMedsqSeD67ZB441/R5XaGsg9YQAlIoXTJd1nF1aoS30FdHVHDvgp8DfMFCCvB0O5XLmV0y440Orc26bSHk5pBLLDtDCtSmZkOjpMKCxcCFjChhOfsfOe7iC+dJtioerDVzWpW5+gB9F18+AotKsQkl+9Q9/WGv5Oh4SPb6kAeA6N1sCT+QVViJD//VEk9aEdGsvC4DFQM0CaLdPeWK8N92Aypw9cXUtJ+ixnQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(261022105027099003)(261102130727099003)(261102123227099003)(261028144727099003)(261026121527099003)(261009223027099003)(261026140227099003)(56012099006)(261021121427099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cI2hkEFGqN5Vb45fua05/wbOasiWWu+yyujHWV4i1eeI6JS5AFGm/C5H+Ujh?=
 =?us-ascii?Q?GRwueMnUSGEugDSaOtGgpaUoyGG1svWq9VTShwdphl0ynIBpFQ2OqxruZDVl?=
 =?us-ascii?Q?YtehxUE1xcGiXClmlpjSOP5ILGpNBNMQTZH8PK5s081M8dozPS+Xlni/OBf/?=
 =?us-ascii?Q?qbpAtZcAVRZLfbPbOzNt40ucXzGyO+0HJ5V0qycXND3PpQyvW64QDW/KqRua?=
 =?us-ascii?Q?Ijby34XHttaF0C/bL+E1Zh7vV5SfSEFSM1EDBt6PWiX4uj8qd3Vqc8L7Hgqj?=
 =?us-ascii?Q?LcweawelL0Zn/tXRBdR5aJocTaFJ/nRppujr6smA/1zGd6jvwosQR7dtVkLP?=
 =?us-ascii?Q?j++S/IEGqbyQ+V+tDM2aM6Q2KbN6OFkq1juRGrDFw1jz8UuG/7ZgsyTRczrI?=
 =?us-ascii?Q?xD00v4KoJhS1M5SvuC8IWESgf1NgAay21Du7BeyNJNJwNHfypkur+oEFg+h0?=
 =?us-ascii?Q?c12pPTDlD3bdp73f6aCzxF6hQg0BROgSOVFrOcA1tCvEdDZfNImJUj5qdvRn?=
 =?us-ascii?Q?voTQrIDPQCEf0jELD11hies2jxLAYIuDqu5Q0QOLHwuUZxiNTTZUD5Lj8mhO?=
 =?us-ascii?Q?AhYN8kVLfPf1w7y6Cz7yzHZmBtwLRIIzWqwjcljHJZA912+uMnzS99wXXgz9?=
 =?us-ascii?Q?lUAH47oe0y9T6BC74XCtXiQddstdgeUGxr7NcxqgQowXU1LMhEirKyfUhSWA?=
 =?us-ascii?Q?gqpZ/PdNUzyb2AqJDfujNwwi/8LybzIKXFbfNTs715WL4qGndti+NX15RqC8?=
 =?us-ascii?Q?FBC+rbHK1XgU0QuIZEOSfmUMIeqqErkYnLyExaSPE3j8U5+7AMUzE3C15n2+?=
 =?us-ascii?Q?xsXYCEJq5jdM9gm3WuQQxAXCQGd9OqKorQt79/K+Y0wzJSzxr6chUX+lDVQS?=
 =?us-ascii?Q?N670qFUAKGSVEPi3EN5kwGzNMmSP1YTZwRoh0NXwzJ6ZOamVjKvi6sUSbJ63?=
 =?us-ascii?Q?8qQQtm/09YIBOM3Yza0L7yFi3B9UaCaX3F8Oty9jcCnKS+L7bOpYXOSBWF/J?=
 =?us-ascii?Q?somNiPuNRmLx6IJXv0G4QGvphUofu4CvM1iBs6toW0EURbazC1r0GmBf9PP7?=
 =?us-ascii?Q?Y8qa9CvB1/HrXJ4oTB41L9fot3nFWgsRIXVmy5yCND4CCj6N6e0UlUzf5IwV?=
 =?us-ascii?Q?GSpDK55GALz8Z8d+sV/2aCiQuQPrZb6OhSqDOG7eVPFOgVeRvsfJMUFqrhGy?=
 =?us-ascii?Q?JGbk/BitlQHWSZre5gtkAdHRiIO3bVaTNZnCZzjYP6006h24+QPzKoikYVU6?=
 =?us-ascii?Q?9GbkHV7yVBfsZ7iF6ncvWQe33M12gTKmRSUde2Wqbvbbr5ypSk0W10mtPQY8?=
 =?us-ascii?Q?k0zrFGHtpZQdziIhz7iEyL7iTA32S8JGmq6nP30TKvPNYDk59yy6jP3roSzr?=
 =?us-ascii?Q?hBTa170AEqt66U1ynsZEMQs4gqpeqOQzQrRD5gbp/bCGSa52B9eM6eWuFoYP?=
 =?us-ascii?Q?RSjPMMQ8yuUH4XI5jyAva94rqyN0lDYHq5vfPCMA7vQ5oxpZ+i+DEf2KxQpw?=
 =?us-ascii?Q?AaTbA4JvfsspVl1RPOefz5zhBzzdWE7uc1rHGe0bbPPEIi4X7NdprnVzaXjZ?=
 =?us-ascii?Q?Y7JYi2TLrbkS10i1ybRqYumG1GoHnKF0qAg5TN3nA040OAneyTXvdq7CRQA/?=
 =?us-ascii?Q?mVt9J+WoHG/IqB+GsPPKq5l14gLNKrNjqq3zyUuNwAwQ3/J8fXV7/747LIpO?=
 =?us-ascii?Q?STxAvnkkm9DnLWMkBnQ/JhG3045W+W9OxB5nGWNCz1aQxpTUkVW9YzN07XFT?=
 =?us-ascii?Q?xCkeLap3ppT18cMJKSQxfrXPJ+d8WxA9rM8+9J1f7VGM801PA7ea?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d695ab-3ef9-4b3d-10af-08df3eeadb78
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:24:13.6523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPfTHsEnRwk5R9e99ZnJ/twKCi3X/LHlLu2fSElQPTkkqMldsya2RBoaw1RC3pMi6dWGQGNHAlaBf7Qvv4cxmAxdF2PcpjcOppKfOVOue6zM6pgvJ/64ChJS6RN04A77
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12483

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_to_dev() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index ad148e341fdf0..960645fde8e31 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -272,6 +272,7 @@ struct snd_soc_component {
 	     snd_soc_dai_to_list(dai) != &(component)->dai_list;		\
 	     dai = _dai, _dai = snd_soc_dai_from_list(snd_soc_dai_to_list(_dai)->next))
 
+struct device *snd_soc_component_to_dev(struct snd_soc_component *component);
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_component *component);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *name,
 						const struct snd_soc_component_driver *driver);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 0dd0008ac59b9..abb8cc843662d 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -61,6 +61,12 @@ void *snd_soc_component_to_priv(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_priv);
 
+struct device *snd_soc_component_to_dev(struct snd_soc_component *component)
+{
+	return component->dev;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_dev);
+
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_component *component)
 {
 	return component->dapm;
-- 
2.53.0

