Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016AF30AD0D
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416014; cv=fail; b=RjY7TBquYTYYnFyugtmyWfVhFP1+yNkFJCyhaeh0vw5xzN5+Z1DEU8/dya8ra8LuFLwK27k+UhliNBLbDn54XiIESfgAxUKZYS7JFqP7p4FViPvfMlUZEIpcRzSMGZHDuNL19KVESxuQOJ26fss9qibcuvdic+aGrqBmmrwy7Lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416014; c=relaxed/simple;
	bh=19Rio/phLW0V7fkQwjHs6bqjFJRVpocYVtFlWgNevt4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TLhXvSIktaXbYPuyoTGLJSR9LdAAhWrkuR0yPqPNC+J7mEfRZfRHBNYUE+IuzDRmQtvUyEV8Q8kLDR1sY7g7xDpg3JVUbpUYVmdaL3blxwYujmup0PDGIL7M/SsNfd+jHTiDQxMnRX670D2/wCVewN2aJGhPNvcBSQHaGYlaO6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bzUa4VYy; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bzUa4VYy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOU6Q0wCvsHSGYkoTNB46WSzYkzb90lKj+6B4b1Wjj/NBrlz9jskwhu9MZdGuMke1SepOF8xWcDv0kEAFLnhXUQyuiSnelP8WmmiPsTo4t4eY7eRBWHql1iEQ+8kI6ydV9QSBD1SLy7PJaEIjqV/QRACo+2rDbQ9AkfWyt73eH4ZnJ0z8yH/e3nZ+ECwj1sPcXJ5va14e1Tj+n1/kc8ChMXU2dXaf7/6r4/Xn96WhQJ54qO9iNwV/FL3T0IdLxfwy5GfxsufETSg0zFhOAw2mwbamoeKwRfOYF+b05853LHFdhGaAfkLRryl5S7+3SuD8ohdVNsSJCYVQJ2DojGYvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puM/oQXiZCCacuiCoD9zEMhar1wAQeKj2uq+K/H5TbI=;
 b=DWrtwZPWSo1tDaJhHTn2bhd983MkVewro7irqK2tne1f0poyz5enB4ynybzF7UpYqbBrl+10xcds/SVyd2QRdBDi4DTiIJY7n4D9gDRahndMI/DLJjPT6mnDlG+rgJ7rknIpkL++7cBlXabGcI9AwUVZpnd3U0MVrN3iHjweC7pltZ464EzeOMTeDeyo8mKde9D97X1917aYGFXEg6j8ibN1cDneKawP0PJD4va6gn9vYQ+oLLFN6TGsS0ykywVr7nmuODPlRaXi3UHoyypTCao2baIhc9bYDbV0SAmWvULNsonA3I++Xq5+1kcVjy85GiSL7kz4wyNETkUk0IRM2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puM/oQXiZCCacuiCoD9zEMhar1wAQeKj2uq+K/H5TbI=;
 b=bzUa4VYyFn+fnC1/rDCP3WP4aOeeq0R3r6RBhS31KOZygFF0Gwy1AY2SjNc/O3HFVTCA+NO2qF1YnOXHTR6suc5tKdf02KUnBasf2zj68JV5foCTgsBXONPXL0lzHxFmm/HnPKrCSMG4Vl10wHX5g21aaMJwr8T3U4dyUwtjY3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:51 +0000
Message-ID: <874is2nm5w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 119/139] ASoC: codecs: wm8996: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:51 +0000
X-ClientProxiedBy: TYCP301CA0045.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b1c25b-f612-43e4-2f50-08de0ad9e60c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ixximjiJf161rgioLqXvXoiPJl4eJyrFiAnlTiz0uRWugmlyQRRkb9ROD0q7?=
 =?us-ascii?Q?5r2yDWHTAHL13ZhNKB9iMDSm5LuiA9p1hwnEyOx4JpCMNmiS8HpRe10mSa3/?=
 =?us-ascii?Q?QM/wQr6NAqD4WqgVs2DhDV4YMrlTcvBBW04ig5qSWoDT01tEa+7lnOQxRw+m?=
 =?us-ascii?Q?T7M9kqDqJ/ra4GutqpZzIIn26pBFsohbrRXe8pCPmo7S/7gy6fUVp0ze2NDI?=
 =?us-ascii?Q?YxHsTbOPj2HaWg7YalHjAsBsHKpcIFDiLWa7mWHw6hTI6i2njC70uT1KNGIm?=
 =?us-ascii?Q?/nIppBnBdRrmd5Y8lTvojzRtTirtuNfnDpvw2tnU0EwlO7RPBtVpxQYl89R+?=
 =?us-ascii?Q?rxF4pNJMZlDq4ecfJG3ANQ2vGY4b9GEzaTsRezK9X9iS3PC7iaUPxM8/0kVa?=
 =?us-ascii?Q?tRqVNZaPd8zsa6QJK+TKHtPd1p5LmaZzzI4tLEozhS9+5tzNNY7cmyDefYin?=
 =?us-ascii?Q?bX8OnOCHiwZoFHXXZZkcNmuYZ10Z5uLa3NuPwP9N2dOqMoHMS7wB3FZdvLsn?=
 =?us-ascii?Q?KmcpJoiC5PMZBHf33ja0D+JlmiV/MqzdSGYn8TwPk9QvvpJPo3iDA3BN1hxf?=
 =?us-ascii?Q?qf3+j/KLQdDh18nsNO5TwuZWwhtWrVDmyB/bNEk87zr+CSzTh1IPBqivIctQ?=
 =?us-ascii?Q?rtvzwNX1GXVCOPOdmKje9wh614Jw+D48xDuco5Nf4cVZoz3FnrHxVp8rpUcn?=
 =?us-ascii?Q?Td/TjaKvtrTqWAdniH/1MMCtN+xAIb5DSKiD2+l2qYqZyVb/dtM3gB/TBQwK?=
 =?us-ascii?Q?slTWC0KlrZMII4NrfI8i5wlbEGu4p4LFvZQkTOys1IBrlX7RDlEXjDV8dZI1?=
 =?us-ascii?Q?UMGpHKWAuPuRrFstqPkcP4QbgMHye0ESxoIaT7eZtTQnV+SX4vj044Pe0efn?=
 =?us-ascii?Q?l/+KFIJQbqYt95kLk9UzO4lsQm9PRwKt1H7PPMBVt6VdkRfZ3Xs5xp3f1Sc1?=
 =?us-ascii?Q?r9KdU67n1aqvmyR4IiPcjSluv7CeIwjzkZH0wVcAwVVINqrQHocVOQ2A+VTT?=
 =?us-ascii?Q?8ergbV1LFL20D5FPKALxZcy9SMxzwfnKhDlcg2WiMhkOd2sXCrOJjuHXR8uF?=
 =?us-ascii?Q?SxucFznQpkDNoi7Kbim1PDFr6VH4/C94UrBDz6LqBrvex2r0XreU4br4aU2F?=
 =?us-ascii?Q?FISdHw1qZ1xWAQlPm0SoRbrZ5XBtcEc9f7s/mUPqxM2CRGOrsW9dr8Avxnkl?=
 =?us-ascii?Q?8MmXhv1jWDDUKkkA9NXr1MexBC/+EgTupkztOgI/5v0lcFHLgS+3kHr1deHW?=
 =?us-ascii?Q?tKn1azwl5y92jDfBJDETEADX4n8iEvYsW/j9oLAs15FvXvmX5PuTqtV014mW?=
 =?us-ascii?Q?7MZ8y2kUUyD7kSrpV+ZVt6/nLPNU/7jj0xQKylA67Bi9tZBFLnfvF5+ZvBAL?=
 =?us-ascii?Q?/zeB4g2vSZb8G5Nf5FxTNIh+bM3bSz5TYMKtf7PO3D+hXGz/NHnud/Dfp15t?=
 =?us-ascii?Q?Wjp8p7PIPS4Fxl4ZoA4JjCaIHDZxuig8425JKFr/6OKXJ5qc8r38T+dpV48J?=
 =?us-ascii?Q?GUEp7CCi/K8XEzjivgGySLLXekqS46AD4uX0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T1LfDedjEs8fnI4h6Dq/QpyneOTybF1u3T8+4trnzp1gh2U/Inf+u1neChDe?=
 =?us-ascii?Q?Xhv3YON/uMLbTE/ta6ALXUnsDddVbmKm02M/P34ocLBhYIYgW5OxF5GcOJge?=
 =?us-ascii?Q?adPSXHhutHV8E3M20YymZBtTsYKSr3ZHszoRX1MgcVphf0VCa4Xfev+NoeVU?=
 =?us-ascii?Q?DITJCiWNckqp6PJF5ogOLQYfVYKLhFQSc8RVL2RViSLUhBKs/axKrPWEgqOP?=
 =?us-ascii?Q?x9qEn7w6bo6NvTBJYbRQtQcwvMlgCVuxlS9W0L3H9akLnE4OLfZk40ecMpy8?=
 =?us-ascii?Q?w6AO5LRDU3S2a5tolEpGGCcE6KeDtGuBLM8UmddPAqzCUhD/Qls5gk+8qdYz?=
 =?us-ascii?Q?M/GtHRvOeiNx2AN+tLQBWG7eDANlgwOoTgqzRLh+h3zoUWSAZ6FDZYnJRJnQ?=
 =?us-ascii?Q?Ph9pQl+kby4AJtiCe1jLuTt9yuYuCoyD0p0kJ1p83g94XnIrnwoC7NpU3xA/?=
 =?us-ascii?Q?Su6kyo0KQP8+Jp2o6jWzWCQMpONVKephtqYNFJ2odCyTKwQSQGRWdQaF1fKK?=
 =?us-ascii?Q?/n2VgsX0GUO396wpxUaKR13J8aU6H6fCo3NlXlfJMn4+te8zl5rviF6A8Kcy?=
 =?us-ascii?Q?7QKut7HTeUdfsV53i8a/ZnFC3pM9VEvhlApjPK2Id1W3iyHZ1vvTVH9P5bPi?=
 =?us-ascii?Q?CnasQKcovOMdrXKoumEDM7aBpnBy6WDTrqO4KNOV6+ygLqGYZHhNelcVr2ov?=
 =?us-ascii?Q?vUYkRDLJq1PLSoVT+mIHS7ruOse9YOgf9tC7NNzC7FtHaHa5e1eb56Mj2ls3?=
 =?us-ascii?Q?GJoV07/+59P0Nv0HSgas0aKxn84XOj8fQMW/qqcHT0C299jJ4yFnSeAxerRI?=
 =?us-ascii?Q?gG32CXmDXl1AWc21iCGaiJCxHGeyVDvCEyBXff9HgWiTrqPqCSs1qnakFEcT?=
 =?us-ascii?Q?mFJ7TkAhT2CMTdQ6tWj684Me8vHNbQ09pOiYm8Ou9o3DbCoRFQ9B+rwcyS5I?=
 =?us-ascii?Q?WEXEXhTNwGvn4KwLtOK1lVwT9OnWalI5VLWJ7r2r5WnQOyOZ4lnpxvQxnTCz?=
 =?us-ascii?Q?FboDfhTFqglAGo4dIF6gCu978qZJ6Y5ziLtz4CtELTR2RcwlKTi8Tnh6fvyN?=
 =?us-ascii?Q?PqBNJsl+56fqzLos8iW1uBi2hPangTIHED8/Tr1lWG7icKJm/WJr9gYVdOZO?=
 =?us-ascii?Q?1kQNFwpDXaYQSNNnT11cki0K6iwLbTfDYtqEmzv+YNlrJFXYdKgLmx73awFS?=
 =?us-ascii?Q?HqtjeNWstZPZqg8oe0m1xtS36EAa07lqgilw3UoxbyqkXrfrZSPNn0HnzDXT?=
 =?us-ascii?Q?sGv2zoKhyrYjqTnGaTo1Tq48qLLzPuqyHrJ9YxYs4YJonB9vLy/S5iBEfwZy?=
 =?us-ascii?Q?BNlfsi+cW6gVYbLI/A6Li3Pz/3mZSVkSXMBUnn9qlWuMXkPnPo45noOg+5Fs?=
 =?us-ascii?Q?8py53Wnh2u/e95aDD7s8yESzpKUShrdSKNJIZthVFRKActI7x93UgwEte7CH?=
 =?us-ascii?Q?/q4p4P+uX2sER2IwEXuQoCKySG3o+LW8wc1jzid5SyqQZlQ6h6sCvmsr5mf6?=
 =?us-ascii?Q?ChDyWhh1If3rbDn50iBbeQye9+YnbsTAP6P6kyKLonfUxPwa6X8Kdtw1qKMJ?=
 =?us-ascii?Q?GyWWPuRLVCf0vniwqYPAYwldFBBD5fjXqzWJfkcoukwMkAS0mUBYtSURq6Cf?=
 =?us-ascii?Q?F5ZUeJMMXE5/SRDPEjHNJoU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b1c25b-f612-43e4-2f50-08de0ad9e60c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:51.8175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J908ibVPPRmBhAHdZUKsEkCndnkzpdY+4SVRfJgsbc2CFuYL0Az3V6terbS0SI831UUswI2UjIYeZJ685KzDkwq15dpxIugMRCYjzXfQYgP9elp7NcvpAkk49VKoQYV5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10584

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8996.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index ee20407825320..7cc2fb5b811e2 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -409,7 +409,7 @@ static int wm8996_get_retune_mobile_block(const char *name)
 static int wm8996_put_retune_mobile_enum(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8996_priv *wm8996 = snd_soc_component_get_drvdata(component);
 	struct wm8996_pdata *pdata = &wm8996->pdata;
 	int block = wm8996_get_retune_mobile_block(kcontrol->id.name);
@@ -431,7 +431,7 @@ static int wm8996_put_retune_mobile_enum(struct snd_kcontrol *kcontrol,
 static int wm8996_get_retune_mobile_enum(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8996_priv *wm8996 = snd_soc_component_get_drvdata(component);
 	int block = wm8996_get_retune_mobile_block(kcontrol->id.name);
 
-- 
2.43.0

