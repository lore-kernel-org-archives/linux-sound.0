Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC1730B520
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416019; cv=fail; b=CO5htRrtzPTaEhosT4GrkdIpEMWFybxBorQyxN5HYRWYuZ1gxD1gFDwGOWbaYbZTsodaulq0LYU5z61M87SvDXIbSqYW5xC5oM3QbE+tN2jCDAq4m5EJ7Gg+bTHCvVDdqiQfr4Ix0W095Wx5xGhihcgsaaSrEwNhfOA3RJbKnH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416019; c=relaxed/simple;
	bh=aELm8PFn8T50J6VnSSZn55R0tmLAdL8UQciYFlhiJ8s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZjB5dg++vqv7ihFJhuIqeVl318pUty26DpWXsIR7zJ1408nr9/wndziok03IMYg4okLZFGrGy3clNPxV3PZ9FRvMYZrvjwObklQnFRSLTExDYshKvhtjW97nbBv+71VvFAUvVgcIGRjzE24oL0KWOz7NG6WYhfDhObWp3ivmdfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ixsamwlP; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ixsamwlP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YT0CQLLz035ggpsOpCLu1PEU/Ce2gypK6vwGCG9xlRyiwOvIJ06UxCKd58y51KqdDOKiA5055/BICtjRXQQQy0Sb55oJ37cmCFVpZQlR0IVIho9y6DzGjmCTNCCgKgoYK2GTS6n4IWzc/mho0cTDUjtmgrhCc7ZsOO+hM1e1huMT0wHDvm7BqqHcqH5gVgxLc+EiM1cufDwjtltWc7Dunu5YelM1xGucHchM3sUUJeq3xUid9ZTYLVpmvMIUtt0xARMyIyD0ONL0LTj8wQ0ahR/1EVaiC/gTepQPxrCbAc7Po03JCsGFnPRzXByToW0cLDTSIw1SZmZIAIUnuDR2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYlgNbvhhVlEszB4sdZZr+7JSEb5f+JGTsWMLwM7SDc=;
 b=n9nY1WVeqcflr4t9b2m+y1BM27w0bfcdgK2/zY8JjQcBeelbA0J5kHzvYRfAeTFVtjc8y/+X7yVGUjPx77OyoRSdJYilRgFhphYVGTXC90265pDNXPIBdycRFVQCHWd8A9ngsIeaP+Uq0M6DWIu99QAk5VwwZjAKe0aJ4XijqCXycO0i+jQrbLm9aVNa6BPBtnqGahfaMjJkJeyyOPXPk5P+DajJCHNRMKq4+yzl52I66jNyMp7GNGsWqFTJ79zYYNk0gtyQr7FGis3M0KJrrfPcnb9RVvH3wISUzLXlxjoXzv5tXlD6EnTKHAhy314FhOoRZP2d0VN4ya39vUldBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYlgNbvhhVlEszB4sdZZr+7JSEb5f+JGTsWMLwM7SDc=;
 b=ixsamwlPhMdkrgfKgZvn5O27XsSLAlcxJUtpdf/surtm7UtJ0fjclUh9dYEJh3G/PNWxwF8JpEMdvil5HiJ0b3spNyC0Oex+HcoE1WshnXJKbhlQRTGqzv010DGJFgVCYz5ZlFec8SIp/IQKkGF2tNOvKuEYvyan6BvFDDfOihw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:55 +0000
Message-ID: <87347mnm5s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 120/139] ASoC: codecs: wm9081: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:55 +0000
X-ClientProxiedBy: TYCPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:405:1::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f4f129-5868-44d9-cf77-08de0ad9e844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JIR4/jezJslJ0CpqWbVMnMjN9KzkrnsEm0ZXmItRNgjBOO5FeIjHXPLqvd25?=
 =?us-ascii?Q?T/VQ9Uf1guARHeNe8ZVELZz6vqCzCrfIRgj4sa8lsLIdYsQ2fLYQT70t8/vh?=
 =?us-ascii?Q?Lu1RLCvO3cCtL5AT8ICStCnw1mIe2axXCtD1gBney/8Vyew4ghfqukFvsd+7?=
 =?us-ascii?Q?0RpkQhJdlWBnSiwWDgkd68Ym7brGG5C1sXXcWxbpgJIZ3BnOra7bYa49mEKb?=
 =?us-ascii?Q?Az18LTJyq3j/NcLAlpM4o1F2VvwLLPlhdJJkC1LaHx0BI3pemQM0Y6AOz3tb?=
 =?us-ascii?Q?ueT02VfDhkj0iYTMjiPom6jUtVf8IySEZWbjUc4qAfQK39aKM6oimA5pUTTd?=
 =?us-ascii?Q?7zL37mDGIiBtiWdIJpBdU1tCBa50RObOLCr4/H0iyDVymzR9aXef6S/xyMsG?=
 =?us-ascii?Q?IwO6Ue36rxSO5jMwbBaG84SXP3rw9MFRfxJ55Z9pneW0z+kULV+ruBp9wqhu?=
 =?us-ascii?Q?1PT87QNOd0gXXcMohXFOALFPHmL1jc6Z2yAQeUyxuraA4Uz/NOoFklwW2hLr?=
 =?us-ascii?Q?3Wy4opYUX4TSu18r3DJGCDYQ1MEdh7/RDGLahgHNNiVYvqpjG72EMLczphy/?=
 =?us-ascii?Q?mTzOS5WOmxgolTS4xExJy+8W39lWvYb+8EC+4IwbnE3eb1EckeZC+HpLgYsw?=
 =?us-ascii?Q?Bk1lLI++Am9KKN/cuXZfJHd+B8vwuIesa7RkgZNk34LgAKo0vKIxOPXptJ1u?=
 =?us-ascii?Q?0ppo/TpBL/Yrj/n2GknLfjB3NENR6hRuEAHkonqGx644ukht3ZTMk19KatTV?=
 =?us-ascii?Q?SKxT+2Niy7qtquvzq6gx+ASme+XfiBlya4sCkGnDV3EiX5/t231cfxqcEN4v?=
 =?us-ascii?Q?TDfD3r8UVGNPwbdWW35LkPoTEAl1C8QUsYWPMLT3NUf0TG3a8UzrzJAHQI6X?=
 =?us-ascii?Q?ErvThjO966oqUnu6HxtL/Y8stC6aOiwYSjDUaRGBR47uXkSlx3Eu3lCeB5ji?=
 =?us-ascii?Q?0R8C1h82qXyVgWZHIH4NOVDnuaQRfPfbgNKtX0LsK4So9aaoMB1OlUIpkE86?=
 =?us-ascii?Q?rZCPWd0xKh3O4NMYa9TA83+GZT7se+oFaDJFxTeEMF8MJxuIlivHNg3K+LSy?=
 =?us-ascii?Q?+2YWaloygAab81ywplO+172r0tmXd/UjUNISdUnUEi3cqcJ2dP77dTOY9OTU?=
 =?us-ascii?Q?NZuCnVJ1WbUHNyHWJ86wCjZHAOeEftNhM7Tie7puLp6hL9W022wRO09/V7T5?=
 =?us-ascii?Q?RvltlyKELWivSjxx8+sDmyaztvwT6sVUxEW86p3HsD5Akg6wK2C58LCdwl3B?=
 =?us-ascii?Q?Gou7WAl9ln1kA3jsZVJf6kUR+QkB6uqU+DwZIlE2pxNcEYW6a+J5wNNXE/HE?=
 =?us-ascii?Q?bu5hiWvrXwWeDQ7I7skMvteZvzNFRdbrO9edeQ7vAjPUkmwz/OBSnhppXsql?=
 =?us-ascii?Q?zpq8S8hkIqz0vW7jLWYVu+5JdHTUjxUYnSQavm3JmDOpwUVchsXXp1ptagLu?=
 =?us-ascii?Q?RoFQXlogb6QQH58kfRSboFVrOk0d7g06DWUqJ4siNzL2fHbWEx3Eb2xtgRp8?=
 =?us-ascii?Q?wL8STKnVzSMtE/a2bUgcFzBkhNTmYSMrEaSa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KkB1gULRV0A3orHNoqhOID79ZXOTA8IgEfwekNQpRmCy6Q3EJHAsV1UmdPPi?=
 =?us-ascii?Q?s1FAD3VsDoB/kePmYnGkWMHlaKtJrDszBEh3Vj6lV05W4X72u3UpG9/bWrF5?=
 =?us-ascii?Q?rpIUDlpUmxZ6KRQ2dZ1CrpP/f9nwdQopCXxwda069+nzq0oJD1SbL8Icww1C?=
 =?us-ascii?Q?MQOKecWyI4qMbm9rxo0m/kHAOZPwDJWXe/gmjhuq2aR+pEyX0f9kLKjifM9M?=
 =?us-ascii?Q?wbS5CYvxiYF3jL5vS8xQbHa0+LLcI3J27ttYDhm/nW1KbA7vozx5jR3jXyKV?=
 =?us-ascii?Q?dyqdXkS2sw0RHv9YqCUPCGDLSupoNAr4BlOlLSbalWHaNgqhVmEnKNTLmhFx?=
 =?us-ascii?Q?lwsQxGxjO2pS8w2D+lmfytSBXFtn8Xz+zJb1gwOCuAQj/qzZF+IMV2bH4N1D?=
 =?us-ascii?Q?q9BBfVS50nLmFQPUOjNPk98y6oNp/WwURuOrYOiYfkv6YYRCUgZUUmqASDTB?=
 =?us-ascii?Q?78847FdhpCNM59QWlpqHWBAD0sKQ0axWSZEGeP7YMbwZmEx9YNgVojYsbZkv?=
 =?us-ascii?Q?wD4ANg8c+YH/Q6dHDBy+/P28zV8vfbrEipthjQVHg219YVO0j5m2HzBNcUnr?=
 =?us-ascii?Q?e/kScv086D2ecQzetASqui/aZu4kXNZwqu4IPERjzInspWE4XLe5kbNHvOC6?=
 =?us-ascii?Q?O0OvEpq3CnEF2JXMustuugTW8wM27vphaam8wh7E9BwNg6CCbG6S0H3UrE56?=
 =?us-ascii?Q?p91N3Em347GIwGHCxbGvALlmT0v8eOZj+L1CEDYpCW6OUWyOOz7VNFvrVlZW?=
 =?us-ascii?Q?u872NS9XNl8m9VIEMUsTClsahT6YSh5dgwlCsmpMfEG0m5vGEP3+DQnLfI+n?=
 =?us-ascii?Q?3tZsbaDC7XWSaLFhn6+FxcR1uZN1DDqi6hojaLh1WWFF8BbsF6XtuwHWpOOD?=
 =?us-ascii?Q?+Y/eMCrK0IVlZlDTJ78sklzsGwaZ8kPlCAnU8tzK+GD6O18T3Q3YZAhlNlVD?=
 =?us-ascii?Q?ynCWrd3Jm9jC4xcokfbkKYHRAGRhHQdCf3wnvdc+fNsKDT6NPYe0wkUiDqxp?=
 =?us-ascii?Q?SkFPKbNRPg0Kdz0g9zeO/ndXL/N1BCrAZSHN9TGc5hrGSQzablzi8zVkThMz?=
 =?us-ascii?Q?4bRrio+u8+Yv/+gbAL7Q8CNyyJuwledtoc2D/e8LswRmWM5oGmkBht4R6Wah?=
 =?us-ascii?Q?SoxKu7IfbEtPJftglRXTAvjgXGVDouESjXGWPxmmnPnpXaa+X+qCHvWaqDVN?=
 =?us-ascii?Q?6ZWKmTv3OUsflOab27/7kEnraFc5vdpEII+CJ4VPcA0sJ/0pi3LQCiHkrH/V?=
 =?us-ascii?Q?GY0A1bQ587GuPqmS8lliRYlv/XBP9liSCL/xAd5Bg2EWmMJ0i3yW4apwcTFH?=
 =?us-ascii?Q?XtB/eyu0CYiMrplOm1BXWT0eKlrUUJ6QG439s8FifEi/djC7farP7e5wzrOp?=
 =?us-ascii?Q?aW4T37jdWCCBAoHdBH5f3QwGjIfRARd9Lly/w0PQ/zlWI+mAMJfrdVBtHMtw?=
 =?us-ascii?Q?YoVG3tvAWjO3+arZzL06TcdIdryjAdW4ILOrIAyEsbHrEV5LD/9FOFOgRx9Z?=
 =?us-ascii?Q?XxBusrnZbW/aKWLassEmKksbSBL9YHCM9ZiWaU0l2hp+aZDQAklQM6C4Jq0g?=
 =?us-ascii?Q?6itBt5+LuHPEFArqnOvwSLUn8yNQlPyn6aoyeqwp+UvMqOZsoosLFvpqtUdf?=
 =?us-ascii?Q?1+pqjJqXXKuHVsnwk5JAfl8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f4f129-5868-44d9-cf77-08de0ad9e844
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:55.5420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYDJn4e5P1aSNIA+IRegcnjdKD36RZfjcBlf/kNYzZlIleltkW7EvzXHOOvLXQgQWZs+MGEyzvsaTBTlTGbfuD+UzVhCAnF7Nwo6/dIf+134fWVOXRtsfUrjpep2WCBU
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
 sound/soc/codecs/wm9081.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm9081.c b/sound/soc/codecs/wm9081.c
index 94d8571360c45..9b5497a128e86 100644
--- a/sound/soc/codecs/wm9081.c
+++ b/sound/soc/codecs/wm9081.c
@@ -335,7 +335,7 @@ static SOC_ENUM_SINGLE_DECL(speaker_mode, WM9081_ANALOGUE_SPEAKER_2, 6,
 static int speaker_mode_get(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg;
 
 	reg = snd_soc_component_read(component, WM9081_ANALOGUE_SPEAKER_2);
@@ -356,7 +356,7 @@ static int speaker_mode_get(struct snd_kcontrol *kcontrol,
 static int speaker_mode_put(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg_pwr = snd_soc_component_read(component, WM9081_POWER_MANAGEMENT);
 	unsigned int reg2 = snd_soc_component_read(component, WM9081_ANALOGUE_SPEAKER_2);
 
-- 
2.43.0

