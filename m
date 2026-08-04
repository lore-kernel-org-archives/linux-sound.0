Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E911D387369
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804211; cv=fail; b=hP+5is8BXd6oO8Qz42CR/ZHxR7PI6sAM81wdJ1/svpn94Y4nyr3u5C+dZ4dDRmKINflihD59KvNxMzSMq3DjPGGvvWVi/FYRax922k8Zlu3Ro7NgvyexAM2w+tLPRhoEzK6ULb+5yuyw8JZvFq9ri+/9tAHGh3VWAQkVZlRPuDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804211; c=relaxed/simple;
	bh=k2eLtvpB4o2gkBXoANF6wq9q3VBKWhYCqvDHCbQrl+U=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XTShDG327MhIEGe6sybCr0OSaDe7Br/mj3c1S5FOUCcGW4K/lOAuseSduEw3yls7BigPXnP87lfcGmm/xBuwSzqqsd+syCPeKcE0/p1a+Wq6uHccXsi6VTGJu3i++7KGyoIGwmkbSR90Hj3GXDnI/DEVpGk1gCK8cEP4VomcuK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RkHibQZG; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RkHibQZG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScKDdu/pqBMVnn/d37YUKwVlt/xYFvWVeUcsn7y4xu3LV5xau8u2JVfzFHOdmg6pXzjsUBeg1mZC3VAzwxqbvNFwhP4nts7umJhCGBEA3lMx3IgRkttQz7660sOGRSTJDKBqd07xLM0rRMUhsA6VZl/nzLn/EeFsNxORIqBkZDpCxwUhazhaellaK6WbeYKioPsQqIEGwtZGi0AoXhVabCakmsPcdsJIM1TkODlJwkm733PzORhcsi5MpnwTDkOTwSJXcoWHWHw2VnoH8A1Prn9+A+E6Qhbm1mo8T1DMOTKEXyw89/XXwgRFlt7W4M8ppgORPAhOByTyfKa1RuEkBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1sZC8dGwyWCjxljvmMd4Fd84wsBFEyjPZuCYUa4W7M=;
 b=gKFqGbOHQZwGzfXTwxZ7YN6qXr8Z7EnH3/EBlgba8uLHbQ8KCnY0LV1W7LVk7RK782IewdPshThUK0WTAdHzA+xXOLAE2DPB0TMD9U+Oyr2MtZ8WdCE40ZxmUuulF1pJjTOCgrHNME9wA0fKCzuzbfarrjLoWlqH7OoEn5hDlXK/3Co241gpLrbD3W9gykopRToKmfalFaD1JvMtg9QevQZKr9KrFFODEJWYtaKVDnpZL8YjQtMd7F0aLHCGMz3iqXADoqMf5yPxAkAnryx8kV/slXExIxmRmkBOG/Hbr0ItpPiStMWkpZjcrZfSROk/5H6q+RvO3VeWvulLCmBgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1sZC8dGwyWCjxljvmMd4Fd84wsBFEyjPZuCYUa4W7M=;
 b=RkHibQZGd4gg5z7cYRKdqPnfVSmMXIynWXSXxjmsagvMTCTN4C5jGfvYvjS0Rm8YRRpRLKFSucUN1BbCYgt6eQtk5yEJj6bxKDt6kdDibGT7FY/Q/Fr3Dqhv8ppUGFqNCignT5XKnOhvGx/QBCtwQ+45eB3qi96Y6aC3WoKAbFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18293.jpnprd01.prod.outlook.com (2603:1096:405:3ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:43:27 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:43:27 +0000
Message-ID: <87zez2vhox.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 34/44] ASoC: codecs: src4xxx: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:43:26 +0000
X-ClientProxiedBy: TY4P301CA0015.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18293:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c7898f-ae1a-407c-9276-08def1c165a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0rHUOIGfQSC0KWOKWN73Bc4xnW3lJrTcj1JOGDa0z80numHWoHWRyJoSqRDMT58d6eEo1Y4C+l8jwhGK2GFxVgX/9lG9rG+Ezv4RvNbbq4BDhP12ckmrqIp+FkTng7zjapWlukKP3DSVlUAWWNWxTVj86OclTsGj7xjfQs02hjwNoDa0Xdcvh1u1H5ePM8I24FixjwE77GMoIzmhod9aigz2fsgEPV+hj/N/TL+1JQIcXhTeoyoWDG6B+Fr6A0vVFUMSCbqBfWBkMe+KGO1f/GG+ZPgj7RGS5Wc6W+GMS4tUeFA+c+1eBXTmXgpMAwtwKh3lN7mcXhgr8oGA3lmmzcQZ48j2eX7oQwGZWuFqlitEt9zgnTp5BQ3zU/AC+J5NUn4H+P9C2vP9yFWuY1AgOmoTc0Yi192gtFkXObjL/H/GKwBvtegE3vTIIsG/1YQtgGZhLjT7TFiXhoCqa7ozZ5GP4p5fcXcHKLh8ss41SF/XKz/bJtuG2VpBDj08UeKuktlCsswq8J1DDclG1sqasrSiZBb1zM2I+W9UyisdjeHCW1q1dtwvZ9HXs9igYBZGouM1ZzVpONNbZ4SwRMJLRw1CFoPLYujyyHjopakIjtWhsisEXZCgwgaesUuR9pA2lMDaRCJWeBrUxDU0n4+mD7CROXq1ENgN5pR3aXS3zn7XaQHdYh2tIVS+eAxZftq/fhVt1lVeOxOmRhXce3OumM89Lr539EDKeKd+QY5dia4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4E0WoGfmvIjFu6wT6idacn6aTmmJ75nk3Hkdunj6QhHZjS47VD1P+h7HnQ+O?=
 =?us-ascii?Q?eNBIMkbRNT7O5aIV73HS2Ff01x69yfiIrq7E644dHP6QZDD+QLMEZ0WGs8Ni?=
 =?us-ascii?Q?Q6rkjCzZ6XDtcsN0w6w7Qx+VilEcQKCtSy29/Vd3qmGe2uKM2ocwXTtmff/D?=
 =?us-ascii?Q?b8vBtjuUZUIPwcZ6JfSB22EueMvz8glntWvMY9RoMdDy7+CnBZmr9xN3UmCQ?=
 =?us-ascii?Q?18cIC/X45ivuOwXlbqOVJNky+ufnEo6TqOYay0wixcBvc0LVDyb1IhHOuRlj?=
 =?us-ascii?Q?meeLvXVdm9kpkLAASABcC7JBoqMGetQC7EkE1VBcE7U2c3leOSWH8rakqTb0?=
 =?us-ascii?Q?5wWzd/FiYGIS50qgVZrIrHmLMXDAf7MXrc8b1g3GgNbUBc1GTxesZ69onlt4?=
 =?us-ascii?Q?0wUHxzxSHc1KEQO7ybvIABWoxlvOVKkPCRqjCHKNvQrSsJ7oEJwMe17/QpHR?=
 =?us-ascii?Q?KX15GgSz9zMapxULLla38NkIxs6X4SHMHu9y7dNTTeTaoRDEEN0mZK47tkRP?=
 =?us-ascii?Q?jB7T6drDC9mc1IuoG2OKvqpC88Kb0bOFkYs5rhh5R2i2VqH20oqCtf+BjaDO?=
 =?us-ascii?Q?P5Q9q1C9JZvEBfPmcqyGb+n1bBY9s0XnK6ZnI57ncfTYDzurr/k2WjRsRbn+?=
 =?us-ascii?Q?lHmWBOmnt/2oo8SxOSMj1kNOVXalhXmLXpg1XddckKOc+4oN+PxEwyPjw59r?=
 =?us-ascii?Q?LOnXslZj713KemZbr5/Go/0a2bMRNa4uA5lObgNnUxU9/oiwOP+yg/3gTkIA?=
 =?us-ascii?Q?TIu9NW6rAyHnV+iU52kFQkSyEFr+woDNPzcDpoZjJHPa9Mf6Pf8R7ZAlxpQQ?=
 =?us-ascii?Q?8Y3rjPhYDaYYLS4Mcwvgr/aMQDepo08pucuAoZtvso4YvVPqW6PJgGfuehsK?=
 =?us-ascii?Q?Tt08sMzI9KX7vUKlOUMgW3sG17MAQ9MIVxo4Hk0+QKEvO1H/BtdCw2wQ8jgK?=
 =?us-ascii?Q?OsXC8XtxcVzxeZUaKsItPgkpskRGxJzX+j01baMsx2hxh4Z2ymn0r6EnVN86?=
 =?us-ascii?Q?yB076zmhPjnIbIGNoXlPjwm0UyLoo+42Z1lAc/d8g6wOpWAXvw5ZhCu7qcZ7?=
 =?us-ascii?Q?CidBMIC8uPq/fUDYxXFu+qpH9oOXxSAFRgwP5GsFprsXeXTnkfODwji+W4/t?=
 =?us-ascii?Q?S0YoDnSrVk/CS/ricproJCtRkrbNtKmEx2hNbAKvfdSK5EZF23o9UxSsltaY?=
 =?us-ascii?Q?rQLLz4dqaqOD+I8CjLJUPiOpdKfMIj2oLGcVb0V8OUl/ZzBR6ZL/SLSo2bKO?=
 =?us-ascii?Q?QddaH92LwC++zmhmRiQahvMLYYqaJPopUtK24XRZ2WmyM8iRpgY76bc1C5iG?=
 =?us-ascii?Q?6sCbfEDXQeT3kzg81uAjxEmOcuW0CIVfhFBkkfekMtfnwC+ctxvB5K1NDFjH?=
 =?us-ascii?Q?H+ZL2XxlYFd9O3VorMHgOJKmc2KT/lYs52pTz7F/oiABeB3UInu/z7mFDl2E?=
 =?us-ascii?Q?HTXCKqFY0fwB4NrgKOKSX5AgZsDYBMeGbSsqKYC6l+3qKOCbt/t9AiSo4dFR?=
 =?us-ascii?Q?pWzxRgUbVbWBm50V2/ICLsLmyg7eidIZcqIT8j/dGL/M3AqOuCoJFAYvoWZc?=
 =?us-ascii?Q?Rfw+kpCvVHJz6O87VKNfqDmr3tPmt4RC9H44uAe3tcjLvdh/9iSda3hNQr3X?=
 =?us-ascii?Q?68znzwS7dxsp7JV30+q4wHbSeCeZlQOLo0zgXW1hOkiIgQ38hB5kr3jrecFo?=
 =?us-ascii?Q?w44XgwcaPk2TS9MhTtVeA8RJaKYp1r2WlnLh+IjYP5VGqf167Rt7dbJVeSbq?=
 =?us-ascii?Q?+KIxBPUX1Wqf9UKbkJsAMnZMgsHsCmE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c7898f-ae1a-407c-9276-08def1c165a5
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:43:27.0576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXnH2QATDlJdwWVGlIZtfphjFpnYAhZQX/e1oOpJnd0lAjLdSzsDS/Aozjqfu57MzWr+IKb+hJ9dgmYpP+Z+GzVr4ArnkHz9VwUpIl1LHYpjQNYdY72YMww0koP9/vbe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18293

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/src4xxx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/src4xxx.c b/sound/soc/codecs/src4xxx.c
index 5a34894752251..6e187c930372f 100644
--- a/sound/soc/codecs/src4xxx.c
+++ b/sound/soc/codecs/src4xxx.c
@@ -326,10 +326,18 @@ static int src4xxx_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 };
 
+static const u64 src4xxx_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops src4xxx_dai_ops = {
 	.hw_params	= src4xxx_hw_params,
 	.set_sysclk	= src4xxx_set_mclk_hz,
 	.set_fmt	= src4xxx_set_dai_fmt,
+	.auto_selectable_formats	= &src4xxx_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define SRC4XXX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |	SNDRV_PCM_FMTBIT_S32_LE)
-- 
2.53.0

