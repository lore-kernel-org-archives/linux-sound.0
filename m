Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011039.outbound.protection.outlook.com [40.107.74.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6C636074A
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605433; cv=fail; b=ZwAvOccd0zFGC2rA/WkhresYP0g+MHapAFEWwDHx2sAIhPIYBFSmh2ETYodN4cQp23mkLC0Z3Iu3xS0nX6JKoIYzwPRodNsgmLbMunYTtneGCNr2Wh9XQ0b4mp88T+IVPAz9QRl68m94AeGwX5YbICi2f+k1FE909zYBMRF0rnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605433; c=relaxed/simple;
	bh=yBGlRrYziKkfpsKck50WKMtpa1rWumYZI30AxOZzfmg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VVrmqqmULzGqDci/Oe/UPvLZ0E3sTd8+uznBXstzHKkSAv1t2XFHDLivVT/wSwyoxs7V/yOi+5dn3e1hBoIqVp9S+M6UxwkXBLk1kCSSKL+6TJQ5GYssyuRxS7mqBe0VxEKLYo3DPiaIgWZ84ytQyl5gU8/NhEP2JDR8f367ntw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=E6XK1ept; arc=fail smtp.client-ip=40.107.74.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="E6XK1ept"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9gR84pycIvJq8PKJTjDIdbErHQWEnOgXZNC2i4ilSmk3mifAonLEPYOtp4n4WQ5eDh/71LJstA34LOEZpHlDwZ7uBGu8RLVExuZ5HMqKC9WDBYF9uMg6mY24vBLX0rCg2mIgMkTpeyuF1DjQ4I7wT9uyvmuC7VVDPVAjRDffc1ySrLN+eM7cKsFYlu0LfJuMRDcZjN4ti2lAfxk9q9pY0ohwwK/ERNZTxQQF5hmxYEozEaCZQBNF5PZChTyUyzamA7FW0zCFPDxt4uxnjGG0BCg7uMwZiAyFtwgwyYIiyw1SBvTydj2/p+SdN0h+ifgGQiIAXV6s7gXMZhFIY6omw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PU5bBJvPgi+kWUGsAn605HuODx3u/Je0t/CL440L+Sc=;
 b=Nz2pJBcmlfACfge/1waEySRORP7imMjkY9hPBi+w8RujiwVdOXjGktNlXUb4/QLCDqRLoHUzZy7Lu31kD2nNTOLQzlU0dwNaRBO/6ldbI2Qfy4krjDi6WiY9SZOfZpH0Tie8nElG1Kzb1afj7oIlC/wt5nMV3gxTRL/sH339xkvaxWwGX5uEMT00jhm9HS01n9DETYbETIgyWn/xvYVBO2Z8Ut2Gmvp+AON7Q0Do1i5sSot0dFXcnrLylufx7hDwgk24+2RnjYiWKILk8QsPz+ZJUZEXxnqpFL+8qq1XAFHb47X28032pRUisEolWsjNLLR8ZV5MRZTaJhnA63JGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PU5bBJvPgi+kWUGsAn605HuODx3u/Je0t/CL440L+Sc=;
 b=E6XK1epto3uBsJvxsbJ5sjY35pqJ0+3rBQngzQzM95tSHH3Pyf6nVaIjRnULHAoHaYzz9kuNdtirNTnWmBV58asrF6kTFMQMakeUgSed6rGVxeUJyPYr94lnFwRXPUkvT/Ob0TGnaN3+qJajX4HxNA2R9mTD68D3yaInIH1CfK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:50 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:50 +0000
Message-ID: <871pi0p0y1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 21/29] ASoC: soc-generic-dmaengine-pcm: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:50 +0000
X-ClientProxiedBy: TYCP301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::15) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 78380804-aa09-43d9-5626-08de79b699c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	mlBp16KQcggsRa1kQsHffoJJ01f52AUdQZiQCfRzduS6FcBk1YyU9gNMwCCuWlOCaSzkBYhhl0GRqkHHXopulwU8lgs2294ZBgYxAJRNiNleX3v+iYDwHu7tXA9zMZhISHqt7NfipfTbHUT2XBk1pEdskJBKiGSWxsD+y0l3oaQjK/jAP5PJmttQc/Kiq5IevybtbdTF+graT1EizsjjPm1yEdoIKhIYRorvkHuc1RsxIBU2ndmDavSQw/eaWen+1T3q26nn4sCfAL2k6KK/6K8w/jZ7yhaGU5Cj7zE4+9smMJVdl2gTkUIKmKwg2DJBuBbeEY9eXFtVlUZKRtc5DkvmqW639W/w/1kQ+pbabTrzdlnK+1VtMzf+XaTnDbUvxavnjh1wBPg/O0+e/M+mMf79cGnSlfRMNkB65IqXsNvnkS/V3ZAOCGW5YijoqY1/fvuvuirtG3lk56cvzdmNhZWsUJfxplg2zPjUA+qU/FbKyNllhPM816b54hROFTxsFnshPgYZiHdB6KQdWeLrO8PdOs+1CCZyycfl0Pqd5q6rbiRpivns4+rp+A98WiZT1CMCQiaiTRBV+UAAKgI4vYdtPiXWVgItR0sE/gsh/glRkwlEOsm4Qdj6+CFoDHK/cW9xLpyiUf82hEzJWkb0hfLPMOYbDKPOMo1g19hZCq2QSuLkEcJ4R0ZzS75OmjD5hGNaP6k9XqczrAUsZEizYZIOJIybW09Am0eJDfHP5Dw5lp28XcDA5hF87up8xDP4guIjld9pkOOYfF3nNyXwKSHFM/m4JBjbNSO3ZP74dJI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VjCunGfJy7PwQil+kQhVPvk3xiAyrdiIZbyXvJQR2UzmnbheLM8RCnCQw19O?=
 =?us-ascii?Q?eCoziFpWY0INoP843WHztyUCyX5wNlqSZKSz3NIII/zaQPES5A/QVv/vkIUD?=
 =?us-ascii?Q?flIDFk4CIECKFl2aHcVl3gA9EpkqaYSRHdinhGDeA/b3ICVUpkJkBttCRPog?=
 =?us-ascii?Q?uaPM4xTGRjScAo2YdxNwS5wj24OZYafb9oilfubpJmqm64lQNKMtjZanwlbf?=
 =?us-ascii?Q?ESQt5o/EJ5ti36XlV1jfKsGbiE5DtY1AqDPKGpB14p4DYZONvmKbAEFMLAwA?=
 =?us-ascii?Q?dQlVOWJS0UIyWVnUbafLa/B0ue9u7GyhykBn2dwbAz36ohbKmentxnOBAifB?=
 =?us-ascii?Q?ODe395vkjwSievhwCOZrA93my6jTek94YljV0fKk4/qn9EiRVLDwyhsX0/GW?=
 =?us-ascii?Q?dqxaWOGvotYXrSQXdUXw4eDVyTuIbtmSuPbTocY18K1u1cM7jGFwO/+B7uGt?=
 =?us-ascii?Q?qumu5pxKBxjeR1vkWHlWNVrb0+x8a5ilViD9SW246yZ/fwgO2f+I2kps0tnV?=
 =?us-ascii?Q?MsKM60M02bOjKhemUHd+/WNDEteLOmLRXhwJsbaw4MMrG4Me4kBdZLOjz3aF?=
 =?us-ascii?Q?2w0wxTGw4m0jOGbhuYvUpaYIHIDFdDu3sb09a4JfB1eRO1bkSUcNQDoYHebl?=
 =?us-ascii?Q?c7sJuOTBbBvOmCpsZPsgK7F2wehJz3/w6Om9luy1Ig8ErOprYBiN7Fn+Z1Bg?=
 =?us-ascii?Q?mWICAY0CmO9sBX04WJrHl9uBWw/Y3R7yHvnOKeEhrNNQk7ge6ioPq4wskmfl?=
 =?us-ascii?Q?l2stQhVTdJgGlqTAi1E+iGx1vWSevNLFdFbrfEmwOaCxKi8ym/d6LBTbiZ+W?=
 =?us-ascii?Q?PXVf2pbIX2TrYbJM+W/00IvvMlvwk2k0kswKhohOa0Z0LXv9P4+6rnqkOYaz?=
 =?us-ascii?Q?kS339RiaMSyE2UqNsxK8Xe74N6wKnfPzI3wAQjSmrP0ZUOuNYzF20IXNWiPZ?=
 =?us-ascii?Q?RoHjZ0sPFUoer3ZWcL+Uy9UuLvJllEOUnWjEKPgqvV9/qcV4T5bzvp/1d0Eo?=
 =?us-ascii?Q?fQqMS8h9bn7/vG2pzOGrMpkAORuzvdZ703RoA6tf15m3DGiTbRXrKfiX1ZDI?=
 =?us-ascii?Q?FRzZwQLSylo5lzVPI0wAYUR0/ZInSJWw1bX9LoJrl8qw0X475TBFMAWL2CHz?=
 =?us-ascii?Q?CQVv6u6cMswk1XjqqhduDIyXdxW25d70zd0KOQpLm/dzUYVDggF+L0UT3MnR?=
 =?us-ascii?Q?OrFlYHown2yl/gXL2/jaEqmmfHG81jsqN/3PeaOBMZtmksbfS3fZtNq9UON/?=
 =?us-ascii?Q?OmXS1rz7QbHVzf/MF+ca7yOPIQ34EUQrNCKC6QVk6o2liK++C5Tla44pNMsX?=
 =?us-ascii?Q?JUimUL0ySXrYP51Ulfd4Ig3IwZTTn3j9svgodQpw1fA0FUCiSOS0Pohhn5Yx?=
 =?us-ascii?Q?Jy/cGk+XuZOeJVsYVoHtbQSvxQ0I5XXQDUyYlFSYTziR/pY5w4GueWqeuOts?=
 =?us-ascii?Q?C+lsNgnr1CugXgs7sTbU8kQzyvAs80QJp3A0fqxLVHlxr7CifxojZlYlhH82?=
 =?us-ascii?Q?0UD1daPrqPVZd6BxxRVqY4eJPjUuicV4V9NCXQYKCeTIOqshBRE0GXhywC8/?=
 =?us-ascii?Q?33pIvKpJqCI4ZHPJu/yNr0b+DEiCVYG0MadKI01vkcobowQY7angqQHfEXlL?=
 =?us-ascii?Q?Fr5us54b8zCkamU1PyWk8Dv54oF+JjZl4zryB9VdbjeomyJB6V0+Z6iJVcg9?=
 =?us-ascii?Q?cww1VpiMD3ukFL6fZbdD1zj3kSi6wPY7UjJKaKzGa4IRG7taoGUlrNV3sPik?=
 =?us-ascii?Q?ymj/td9YIlgfRLfuYw4pVDsnJjo+BqcozCbY4XC+7GFV4dxvUfZ8?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78380804-aa09-43d9-5626-08de79b699c7
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:50.5016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcALmS64joJUTAbLVbaa/C9kr8lEmfW1amX3LMTu75bi6uKEsRSSG8VrT4wrOSypsSTUdqIhlCUZAGwce9jR/kPR42qZ5/51/ffFfJFtEHUSTFgAnaBskEe8p2Di0x37
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index dbec46703b35a..6b8c65763c828 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -332,7 +332,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component = {
 	.hw_params	= dmaengine_pcm_hw_params,
 	.trigger	= dmaengine_pcm_trigger,
 	.pointer	= dmaengine_pcm_pointer,
-	.pcm_construct	= dmaengine_pcm_new,
+	.pcm_new	= dmaengine_pcm_new,
 	.sync_stop	= dmaengine_pcm_sync_stop,
 };
 
@@ -345,7 +345,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
 	.trigger	= dmaengine_pcm_trigger,
 	.pointer	= dmaengine_pcm_pointer,
 	.copy		= dmaengine_copy,
-	.pcm_construct	= dmaengine_pcm_new,
+	.pcm_new	= dmaengine_pcm_new,
 	.sync_stop	= dmaengine_pcm_sync_stop,
 };
 
-- 
2.43.0

