Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288308;
	b=OJ36ml9WzoyI7bt3xwgGDg3p0C7ZvcTGTRBXa9/1uEvy6ihOIIawRgG0c53HAiUeXMkc
	 VMe5xP1BJ8GzuO0SNC+aZGMxSwOMrfFEpPPDtYpo58Wak2wrXxAh4zd0dR/Rn/lAWgaD1
	 1zFhbYb+yW7ZJ19kiiaBaGhFKC51ucfNCSJ3I5DX17Ytui8xov2lBbAgMUpJPL+tMzDyW
	 6Uq7i48mGPBZYwlHsEs9bvNYp/pQueKs54DqUheE8RjTLQmssXxkN9P+MhWww34rxznFH
	 Q/PprT0BV+L3auBPJWcvyWhy9fzXOIApyG8uKvCBznqS3t76I67JtM/s4yaF3gdOJRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288308;
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
	bh=xWoRICkXtPp2eH9WXNeUXduI/RMdCAF2dEKgccpuobs=;
	b=RwZzjGecpVw10JsbltNV3t7HJQIxETYZvSkUpYda4usRzVvkaDyVoijU2GyL1z4aBxsr
	 ubxAHvDRUyza3ssBqS2Tsj863nX53bRqtxg1cGwdGtjzjnbLIPQDuTB1GNpne+Mrn9LI+
	 5hi0xlyB/CS9P1e2J9T0DkBm/apl3bF34QiciVQZSoAT+BFKYWmTCUJF74oAVhb9ihK7D
	 6Onrg4TntsNIk+bIGggxirZ4+hZUPZZkvaA3gJfhZBrQggsuXegekzV5IMcRCiZSkjukd
	 6fPGorFpwPfzCj8aQ8yWtIewaqD2G1xDQwkcDRlOiIxLCY8X6ZNLKFJehqK8dx5vebQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=hy0Yz6bb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.68
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011068.outbound.protection.outlook.com [40.107.74.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5374D606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5374D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=hy0Yz6bb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVfP8/XO22Ypsad19zz9RuWamI2NcfTNLHAg4j016TmZXmfYMnDMlq6J/FyXeZr5vBt6X/FuNsHcJo9JLV+pQEL6wQvyD6MJ3BwIRlZddAODFwPhulto7sq0uMq9KxNZ+jZ9G7JB7NrtrPR2qJopuVMeigf7P2c/l3+2pK76RnHn6cCgIfCUPS75OARfP6qJ0kjGp8yyArftQqdl5qgHgn700OeOCnZMSOpWo/vf4PYcw1ocg5dl0ubapV0gyVT9CFBeLZahO8pSN+8AfMokkGfzrD0M7T+2k4PyNu+KofYbGB/4DdpO6b021vNnqb9Bqv9kTznXS4wN8mY1BzAYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWoRICkXtPp2eH9WXNeUXduI/RMdCAF2dEKgccpuobs=;
 b=dyfEDbWBR0YU/V3D1ms/2ZJ0+CyFvn/MoCuvc3qV+C4nxOJmaKo0D8fC6oaX/Msr8lML94scx8X0jj6M0xCY/dxH+jYpzvDxlqU96LIEimU4aHztQusKfnmWohwgNdSPhHR/20KQByOiHj5igBrry0Ml7PCM3D8nlJJDWaCjaEjCHZOs8IDvdATfVftYcDwGD4Tyay3zIUNjh7ATm7N2P1mXeOOLej3EXYbN6ofmDKaibj7cMf9oBT83G+2vDR1i7qVqKVIyH/IW2LJ79VBp55+DvHI3/6fL4MkvAOUnZ4MqAxRY9jFIlAMxFqKsI2TZh4uSXZ/6Mrc5hzxn4A7fZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWoRICkXtPp2eH9WXNeUXduI/RMdCAF2dEKgccpuobs=;
 b=hy0Yz6bbUP7kDCgStYXG5ffqsKZgGd/58IxgPB1rSDhnGYCDpcZBbmtJOXRjRlJnS/oek3hpIq6Zh19VfrrJMILfH6/U0uuiCinnR4BtA2e6PRcwowQ7FLDCMGlSJ/dNU4pygp7AK+ozCEiQwLSvu1t6PeQrNoLWXyrvAAPsGQQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSZPR01MB9500.jpnprd01.prod.outlook.com (2603:1096:604:1d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:25:04 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:25:04 +0000
Message-ID: <87h5hpmf68.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 19/20] ASoC: soc-component: add snd_soc_component_active_update()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:25:04 +0000
X-ClientProxiedBy: TYCP286CA0275.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::17) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OSZPR01MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: d88c1a25-bdb5-403b-9203-08df3eeaf99c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|261102130727099003|261102123227099003|261028144727099003|261009223027099003|261026121527099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|11063799006|56012099006|10067099003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6PuWeb/gJUBmAn4SRZvkD/HbboclFpbtu5vROcs4N4cx5unXZn9/yNC1UKc6gI0dgRVRWw2IChzCeyrOMB4dTD70d7kSTj+o0lW5j6vdXLFOMxn0rw12pB8MddLJVuqjGMIYUjb2Qz6kZmn49wRvWn+sWL35Ek7Wc6pRFbRATIH2K6ph8ZQ8g68Gm05sOgZM7ujy9JFd6TcW1MLzGUQe0A3Nxv/iOiNkDtJ9vdaAwQvlzqFU2S3TJN0ti2ZsjSkt4cHDm91LIrtCVTaHgsiMHj0pdublv/LDzkp/zTjZGqzFMd0cQOfMx1SO13v7yUTbedmyGpPpX8M+4GnscKRZGMQRqOzv2P7ux2PmeUzjPE/kG6UoDDA1kAW+ZgBE4Qqy08Kh74aNpiW/o0Gdk6FvCN5xVm0D5BYo6VlXZTWBsN9DPESlwo4MkNUQHtPRjkX2LmsgwVtZejMaYUkWAPz1zXAKFuaE3o1FY6iDnjoL20U85fdlN2kkbYDWRKKiJxXt3z2lorh7WWnXRrcrUJ6zrOngGqU65IzkBGDXGG7ue49+nCAci2l2n7cZSqiAFeWjqnnWNXIgfEgqJOVEiL8NCGo6xLXKdxBcYsaursr67S1mdonHn8M/K6V0fIfSYTIz+ZG7Snm7ja9CFBiaYcG3FNCvfJCjoGOL0kjAyBFpd5shvKmjLMvmHUnC0EW9pbeDW4KHcOwKXbSLfK8KC98DrkwoFK1JdtMO5vZnx11Thbc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(261102130727099003)(261102123227099003)(261028144727099003)(261009223027099003)(261026121527099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(11063799006)(56012099006)(10067099003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1sP1BD5LixM03N4rXUd3ZmCMUvTdqVGx2JuV+JoB0usMb551Xo2Y7fatUIy8?=
 =?us-ascii?Q?Dp+TczTbFVuw2k0RyFUC7R8KRcx9arl7IMwpRGvBXX9If6EQmShb8rUvdXre?=
 =?us-ascii?Q?2fPbz1eGPYfoa1pNHhyVHxogkojTYjuvGvzz0jOxAQmtTM0vR0re3Qj4jWiZ?=
 =?us-ascii?Q?pO7++CMXT2BBlY5FVxt1gzXaWprHTwGL5cPnettjlkjLsGT0FRlPids4JYTh?=
 =?us-ascii?Q?5okqg05v57khnbH9lufOOD6xTQTrq8y1mVsAst/U5YWzujVqc7/fq3gurw90?=
 =?us-ascii?Q?nRzbYtf1hrNTf3o33nwLjQMXoFythwkg5n1hVMrgvv53zCOsqiA3zNvU7T4e?=
 =?us-ascii?Q?tfUks+4yk7s/4vuoHIVA5eK5m4y0ZydHq/+vELm2UEZXXDHcZLhCy3F3TbZ6?=
 =?us-ascii?Q?tYHXQNGCPNMGGEpq7WzziMEMbsecFRQYdnfNELhnp8UYt6qwqwmU6+s/WqXH?=
 =?us-ascii?Q?SG6njegrwqP8XRSowyMRyW5nRn07L0GA4Pi2OA4j3yWTp+bBnYfUL33t2FBJ?=
 =?us-ascii?Q?RzEePyGQWr6HqPZqQ9AWthJMYv9FoFm94FQb21fNFzJemDyE+llT7ZIze1Um?=
 =?us-ascii?Q?1hZaywoSGpGObywK+6UY4eBt22/Oui4XQ5F0izwvh6k3ZFiGj+68lK/u5U8a?=
 =?us-ascii?Q?WUO1jZSGHlbaRmj5QnUcZBBr7yhBwvC5jrSHY3g0GmqKy3Sv2cEheXi6RMgo?=
 =?us-ascii?Q?vswURXX0tCO0DhI26rCFFc5RpcJs+Ngy63emE51bkJIINDSUoEOvZ0v+jjYo?=
 =?us-ascii?Q?8rivzt03qzkYbxa/gIqLXF+8YN7uSfGcDbKM/CfNiwTbeB+Hr627clpzFqkC?=
 =?us-ascii?Q?iU7RmGpOw3fEMGHn80d0pkzIwlRBChXt3QtfKNepkSqK0X21A+0ec85cT4Cw?=
 =?us-ascii?Q?Zo4pKyey40xx0uKEaxbcAJ5pwtoPdqRTY1URw944JQqrQqnX9p6kgwDCJUcf?=
 =?us-ascii?Q?8FMRaeNAbUWd0r+ilCh2PlNpQdHP2kfsGgP/o1yhU0oDUnxQoVPstpAoIlsm?=
 =?us-ascii?Q?FWiC4sKZAgaxaGbny25/+Wc/ulnw+qSeGsaZBTmcc5oJNc2JoQ1NBmGfZKqN?=
 =?us-ascii?Q?fO0uqfz40lMMrnjQBzbFk0Veqs5o/8o1GROCzeeW9DPGABkk+Y2VXsMwiJPz?=
 =?us-ascii?Q?kMBirQU6N73Z4wPO7708qa/qdvPHeyGaUsiJJvfpYeZIAa3lMfE5PYHqnw16?=
 =?us-ascii?Q?Sr/G589SvYJxW8lLMwRVy9dVW0+smiakIoh5H1GZuSrbuLBpqPpef9lJVF1y?=
 =?us-ascii?Q?h2Dvdde9eO8/ChQVOp9Pdm6GKq1iZGMIstOQDg9fqym+YY7jeesNRwa+qDv/?=
 =?us-ascii?Q?owbN0cVHOLoPjT7X5Nn7bm7tTbQ28Rn2FpXMrCQzo0Tj/cQUocPAh0Unv5l3?=
 =?us-ascii?Q?kLBsV8r9wfgKIJz9BAzKqjKtZQ3zFskoEab7J5x5P1ySt8rEzbeSuI8bcELO?=
 =?us-ascii?Q?Q0Ir7OEtl2BBM/Dkv5UC1uNpVVQkTesfee0FnFIJUfyXLitmOLXCdzwoU2OY?=
 =?us-ascii?Q?Kc/+MzYsDxp9Cu0HMYZCk8gRLpQ+zRJMbSx2GbbCj+xSTTC+48PlAT9iDb02?=
 =?us-ascii?Q?u58qpDkLlvLedzONJ2nmJ8/kDWyt8tFU3y1ec0gkvz5qdrU2t73qlnPBocTK?=
 =?us-ascii?Q?pfdvl+Q89g/RX4vTAEihy5zM74AtGBv5+mwnF8JnOY777AIi2hL7yNboNyWB?=
 =?us-ascii?Q?B3uEZzT3OQtn4XKi7rgceRfz/N9TQNdfMGBp+SqOEpP+/+yd0Jv834NBYV0T?=
 =?us-ascii?Q?B+Sive2mZt0lYOC80dr9VB4mI2R+pz7MbXRpu0jBRcyestABruH2?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d88c1a25-bdb5-403b-9203-08df3eeaf99c
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:25:04.2211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGUBP/X0z7huMZ6YIC0txJc3cREEQsEwGLaJIMKOESZCcsHs0xY8vLV8j674tDfw06QAsMPwBEcfo4Mo/JntHwC6KvktuXu5kzQor+hx7tpt2Tvdy9jE/vdjZmjwOPIR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9500

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

This patch adds snd_soc_component_active_update() to handle Component
acitive count.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-component.c | 5 +++++
 sound/soc/soc-dai.c       | 2 +-
 sound/soc/soc-internal.h  | 1 +
 sound/soc/soc-pcm.c       | 2 +-
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 50101d16f8539..fa5dd07bf498e 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -104,6 +104,11 @@ unsigned int snd_soc_component_active(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_active);
 
+void snd_soc_component_active_update(struct snd_soc_component *component, int action)
+{
+	component->active += action;
+}
+
 int snd_soc_component_num_dai(struct snd_soc_component *component)
 {
 	return component->num_dai;
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index e222268d8466a..dffb265fd38bb 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -713,7 +713,7 @@ void snd_soc_dai_active_update(struct snd_soc_dai *dai, int stream, int action)
 	dai->stream[stream].active	+= action;
 
 	/* see snd_soc_component_active() */
-	dai->component->active		+= action;
+	snd_soc_component_active_update(dai->component, action);
 }
 
 int snd_soc_dai_active(const struct snd_soc_dai *dai)
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 98ff0e2fc2e1d..1190be669eae3 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -70,6 +70,7 @@ void snd_soc_component_remove(struct snd_soc_component *component, int probed);
 int snd_soc_component_probe(struct snd_soc_component *component, struct snd_soc_card *card);
 struct list_head *snd_soc_component_get_list_head(void);
 void snd_soc_component_connect_dai(struct snd_soc_component *component, struct snd_soc_dai *dai);
+void snd_soc_component_active_update(struct snd_soc_component *component, int action);
 
 #define for_each_component(component)					\
 	list_for_each_entry(component, snd_soc_component_get_list_head(), list)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ef8ccf52798eb..dac353fec4bcf 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -374,7 +374,7 @@ void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
 	for_each_rtd_components(rtd, i, component) {
 		if (component->num_dai)
 			continue;
-		component->active += action;
+		snd_soc_component_active_update(component, action);
 	}
 }
 EXPORT_SYMBOL_GPL(snd_soc_runtime_action);
-- 
2.53.0

