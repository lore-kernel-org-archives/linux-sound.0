Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156610;
	b=aCNjCGnmDgtKsgGyyO72/Ibc/Kchfm5qLBfOXjTvSsckcu/McJ4khcYs+4HqgN0BkS8b
	 q7Bq4Fe+g4+JD4ezRKvSsvzdhiImskJCCE5JivCE8HJMQg4apXNRy3v8mCEPZcROlljg8
	 6CECyWZqCyFuE8/8IHgEwzvuGeBhRnvCrdvFGJS6VtvwoBpynTwQ3GdHMbb2EI23koFUp
	 S+w4QZbYjY+CQUAGejBH4m7eELKt3GTfZe5g72SlralNSkipsVt3QObwDUn1mpihEa5Ww
	 WB/1bLk2mBl3GWx9lRVW8jRqtAMXx2dx57OVplpjJ2F3ArIDKJ/NadSro6x+fzUanTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156610;
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
	bh=VJ/mSUcHFyEI/xIW8O+I8xASwekiihFzv/xLzV/YFLA=;
	b=Wu2gz/GDk+s7A5RjqKifi2TZQ96wpPSqrIZjo8HwcH+4umgIWHhb2mMj9S+1ekX973mm
	 A18PFKmddHh0dvoWAGwfyFtB3hxeWxhSunGUfCmtI6vjQUrrh6esp4dKLSyZhzdMDU9uI
	 kT+5kqP4mcRH9S8YRfrjiLWtoJiZF+866e3ughyh6BZxh0158D2lC1JSEcRkYHijl0DrI
	 1AiCzQYcbdIz6XENn9K4lIdX7KGFlMLXQByN18VMj/vcEh13sR1WBJJGFVIXDoyvdlUFF
	 LZ8DSwSwiUPvhA0+639vrcHcYzWhDJeWcTLyPu5EJtA+8YrzBHxP12B/+zFOyszYS+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Ykg2dD2N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.69
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4701606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4701606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Ykg2dD2N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lthuSBifqJ4vcdiGl8gTbEWdy+AJaD/1EOBa3MpRop3nhFQvbdsuObtVDiiiNha9TyAFQRv5Luf5l0XVGJSdrAq6uvnDdc07xtEc85uT79Hn5+pXlSMZkHOI/b4LvaYbq/1XDtl/AAGyaSNZOUlXjbblU6yYPETP4fs8X3uFBbDyjlyT91HJ3j1Mlix+CnsZHJ98s14KU3NTh7ir8mK3ge6YtVDI1S0YXCOCCmjCvWeN8M+RicaShuEBPS8Y2TiqDhxLIKvcEK51PxxZLkJP2CY4xEZg4v23/+00R+HBJrOqC7w559okRY3vLW13xwgOCLFKCNdj3aotYw9H+gQOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJ/mSUcHFyEI/xIW8O+I8xASwekiihFzv/xLzV/YFLA=;
 b=f1zuA4Ytd8ds4tkblxU5UmEBQKqLrinbbZjH3cYwYM04fRqzl/cUG2T/XAUkA4LOc5j0CNRwRLELNKZZqpOCqVq0HV1nF5H1Mo8alD0HzyX6Hn6vBfhPWP528mqEwpC0N+nkdrFwMPwPJG7qjZ6Wto1fKW8WXxLDd4Ac3v0dd69XXVZGTMnDJKu8qbc1w3VhCDk/NdVI0g24HePU3amj2mppt1o4D19qA2hT8MsoGUrxZsi0eEPrsRp2CMCTFI2QM4Q1kEgYrv5nL/WXmfskTQz4nNbNlcytBDJCNxTSy2ZKmhDn8SQ6HHR9QKQsViZcfmp2GUUwmuEUpDYdrs+Kgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJ/mSUcHFyEI/xIW8O+I8xASwekiihFzv/xLzV/YFLA=;
 b=Ykg2dD2NTFjNd0HnpbjzRQigfGqFrbl+A590zHa4YEKi3iJ8vjnOopZlh8+kAXD1u11jIfECaFdQ+ycsozrylrVTgMKSICrvLdgoFIuRO2sVIZ+coPx2F796PeG5EHaDT0SH7z4JDXP7tc95PnEp/dUFNckQ+kVtDerSA7/KQko=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB6650.jpnprd01.prod.outlook.com (2603:1096:400:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:03:27 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:03:27 +0000
Message-ID: <874ie6ttkw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/15] ASoC: soc-card: move snd_soc_card_fill_dummy_dai()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 03:03:27 +0000
X-ClientProxiedBy: TY4P286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::18) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8e19a4-b818-4563-47a1-08df34a009db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|56012099006|10067099003|261026140227099003|18002099003|22082099003|38350700014|261026121527099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	iciAmRyo7trQ8pDkILgiBD6dN3mTg85T4055XrCSEPO692X+Pz8V+r6b1y65nhMF1PCFo/BFBj1FeGSdvA5unc1PNZBcrmF+NifwqiAVk79b8fkwQ0k8UJmbXXuB3tpQkXEsejpXZB9WLiRwDUxadaSuLEySEi1TGycpOuJFc29cD2Go+6djmM6MkVpdSVMzOj+sD/ZxZqYqordIdiwEIPSyVDsicg5usbpqEf/Zn29j9i7D2gAUagsizT6OnHq/C1/I/3g7KKoIRRJrjSVRN9tOjeUFP7FMjwRM33nBojivDUf9x7Tjjin95cL4jxCewsY2Wd70ILPWc/cxsWFfssPlM6SkvJkOKwEI6l5nI1ZbBshJ0/OXKG/LYckp55I29wvtm3SkSBU51HmYe0b3zv7LtAERQHumyVefnOgEGYKMxNUYNZzxbJhpG3l2lYPr40g6zFDayhutZ65ikkfeZChQjG+8F+LOP/ELlrJqFQaWE9R8Nw9UiGxVnf2jeHlMRd/j6eFTIU+IPwAvADu4oohp9n+NOaGlQR8qDxdSAwC2Qu7jFlhAnjLRpLiG4WJhi5p+qJ3W9FC/owgu7bUFWeqBR/uLMmXyscbiOevKFJ1G176/8KeGgaLsIQcCxjo4q9bhd2i5JACZ3579vgjUWfMTYh/6dznNqTsfAp4/9sMupaIv5knh2KjBHpY//QzyWDGUt/WCCNHJx/JLQIZjZulyfei5JS+bSuMVmxqzp3U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(56012099006)(10067099003)(261026140227099003)(18002099003)(22082099003)(38350700014)(261026121527099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U6lTED5EI254woHKDv1epxkhqKCmJGG+BCw4IKS1hwVeEa4+0Lz8BdKSE7yP?=
 =?us-ascii?Q?4CtEhLJIT9YH29vkKubeo4Qx/M4QsZmPTPMmGM05PiKgS7eqlLeWZAKNXnpc?=
 =?us-ascii?Q?XYpQ4jIX1MHiI6diHFG8zLlOjURugABNgRDLrsOVPs8lTIrgvnZP1551iC5c?=
 =?us-ascii?Q?sf78eWIyPnf8i5V8VZimOXOeD1lmxCBH3b3gvXYKwOjlmxfiZZguX4a9YNs2?=
 =?us-ascii?Q?WBKkReM3Px9Dq55URAjz+ufP/9O0A+esWjqhmYKeBUCRBiSxPmMSOtfnw5l+?=
 =?us-ascii?Q?ZcggGuKcZ9D6umGIbfI12Z+kVvIIxUvBYtxwpfIbfQsJmZIkSfy7vL0cyYEK?=
 =?us-ascii?Q?O0ARmJHH6Csipz5dQNoUOIKoLlT9Rl5HlwPhgeZBgnmipmIrVkIQ1bWQ20tv?=
 =?us-ascii?Q?makFQYCaKo1m/ecmiOBKSUDHSQGDwcqFCBg57oOiiwixuCTwJJEzqq7+4CkX?=
 =?us-ascii?Q?uaNG7oaQU9ksf8vfPo5x6mOd1mrPtmlcx5RgOEW/Rzr/7X/etYFMm57FSZWJ?=
 =?us-ascii?Q?p7Te0O0tlRKyoxkX1MLZXAWTspDOvfdnkFtU6rTrGpAe7ClTGVJn8pRfwwKq?=
 =?us-ascii?Q?NQjYfniPNP+vyQbEgfgdlHdzB6WWaqCyAjgOa+PJYGCw4MVkOy4qge14uHMh?=
 =?us-ascii?Q?zwO9xKmMLCo6Fb1JHcEa/NF+TwKB96wUpfaabxXaIhgMYtoN7qzkKec0xa6x?=
 =?us-ascii?Q?8n9IQQi7H+Efq0HM77L/ZikXbJ5c0rlRom9JalrAChJG1ofCGx62ZLta3LmQ?=
 =?us-ascii?Q?iz6EV594egESOvAp/hai5ddFld7VT08551w7OMhUhaP6CJSTfGjFN0x/PRnM?=
 =?us-ascii?Q?o9kizowPfbfWFXvaKMCc8SkmMCRqJvECsHnejVcxKliXjRxeDrJHPOrC2PhO?=
 =?us-ascii?Q?nox1MCo2f/O8TVxVtl9M1RgP2ianxB0IQVK28rNRw5Nc06NbYHXV4cj1R1QV?=
 =?us-ascii?Q?VYObR5YIzVsQcJAkW1wOBnw5YMzwaHefpVEXEY/wH8TmyzH/UVvD+z59cQnM?=
 =?us-ascii?Q?BPv1pwihZT4eCeabUJPXUvKUaNXdj65cuaJP6KPLvR0e9ismq6lTv5SSme7k?=
 =?us-ascii?Q?Wt1VEHPGd02Be9/WmkGMeqvlvMwTAQ8LomkMTKIpdmutBwFqfJGezX1J5rqQ?=
 =?us-ascii?Q?2ByUo2qCcwcNLavSDy6fiyEPpxxpcmEaAki6m2AqE+dXiYE2ZOZblQMqNVjZ?=
 =?us-ascii?Q?7ty3whCTR9uUpFQFCCw4oi7fFg8fnbkP8vjTmo1z1OLfU5eSG8lzgBVYxW9W?=
 =?us-ascii?Q?WL2jfQz0mmGsQY4+PZN61qfCTQXnMpglS9z5v6ZjfGLDUSUQb0/yrQ+EFklx?=
 =?us-ascii?Q?ufCLMehyikMtYCEGjzMvJpgA4uYEKMPvDnLVqruMXAYXnrZGjI1XAngTyZMO?=
 =?us-ascii?Q?L41vDQTKMlrfOnt6T1/URnAJf9u+8QUagyAYuTnqQQyeSUoyOF170nR1nZsP?=
 =?us-ascii?Q?4DWYoCr2LrnBg4OlRudHOEuxy2LXQ9b1nhyT41Drrzb02jpSJjj0EhZAkjwD?=
 =?us-ascii?Q?ZVZ0nQsZl11db6RnjolPuqe7OD/x4K8aLksnIkYcNXMls+qcLlmQj0GlMwkX?=
 =?us-ascii?Q?jHb9F6/aswn7xKedm9t/p/kl+o7bKFAVG2UoAdxnzHoYtne3V0Twt3qJoGAU?=
 =?us-ascii?Q?iKAlwU1JMxNrl6qGU6VOc6v6nb2l0ZoQ0XrfPIq4VY6GTnE2+R1JwSfUNMzO?=
 =?us-ascii?Q?HhbfqkTaMY5fX1r5D1CIffgfYieYGzkmcpouEtShuaNuyNdx4K/SoRasyoQy?=
 =?us-ascii?Q?AYFKTsHZ55eTO4tOVzIf6Y/gDb2kW/g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8e19a4-b818-4563-47a1-08df34a009db
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:03:27.6096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2608ycYigYUwb4H8k6813XIh6IYW8+u9HvIpFm2EQbaHxag+86JDd2q3G6uxSj7WwlT9C54Rtx6qi7GqGeEOiAMPLqkA81t2P8Z3KlRotN4yz6GsuGRc63QcbWPBkA9t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6650

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

It has too many local function dependencies.
This patch uses temporary funciton define at soc-internal.h. It will be
removed all funciton were moved.

It renames function name
-	snd_soc_fill_dummy_dai()
+	snd_soc_card_fill_dummy_dai()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c     | 22 ++++++++++++++++++++++
 sound/soc/soc-core.c     | 24 +-----------------------
 sound/soc/soc-internal.h |  1 +
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index bccd47cc136e6..6e2b8a86f4587 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -95,6 +95,28 @@ void snd_soc_card_resume_init(struct snd_soc_card *card)
 void snd_soc_card_resume_init(struct snd_soc_card *card) { }
 #endif /* CONFIG_PM_SLEEP */
 
+void snd_soc_card_fill_dummy_dai(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *dai_link;
+	int i;
+
+	/*
+	 * COMP_DUMMY() creates size 0 array on dai_link.
+	 * Fill it as dummy DAI in case of CPU/Codec here.
+	 * Do nothing for Platform.
+	 */
+	for_each_card_prelinks(card, i, dai_link) {
+		if (dai_link->num_cpus == 0 && dai_link->cpus) {
+			dai_link->num_cpus	= 1;
+			dai_link->cpus		= &snd_soc_dummy_dlc;
+		}
+		if (dai_link->num_codecs == 0 && dai_link->codecs) {
+			dai_link->num_codecs	= 1;
+			dai_link->codecs	= &snd_soc_dummy_dlc;
+		}
+	}
+}
+
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name)
 {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 901fddbbe25e8..9a0e058f34271 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -426,28 +426,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	return NULL;
 }
 
-static void snd_soc_fill_dummy_dai(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *dai_link;
-	int i;
-
-	/*
-	 * COMP_DUMMY() creates size 0 array on dai_link.
-	 * Fill it as dummy DAI in case of CPU/Codec here.
-	 * Do nothing for Platform.
-	 */
-	for_each_card_prelinks(card, i, dai_link) {
-		if (dai_link->num_cpus == 0 && dai_link->cpus) {
-			dai_link->num_cpus	= 1;
-			dai_link->cpus		= &snd_soc_dummy_dlc;
-		}
-		if (dai_link->num_codecs == 0 && dai_link->codecs) {
-			dai_link->num_codecs	= 1;
-			dai_link->codecs	= &snd_soc_dummy_dlc;
-		}
-	}
-}
-
 static void snd_soc_flush_all_delayed_work(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
@@ -1626,7 +1604,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	int ret;
 
 	snd_soc_card_mutex_lock_root(card);
-	snd_soc_fill_dummy_dai(card);
+	snd_soc_card_fill_dummy_dai(card);
 
 	snd_soc_dapm_init(dapm, card, NULL);
 	list_del_init(&card->list);
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 3d3703e58711d..1ec7aec68cb9c 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -20,6 +20,7 @@
 void snd_soc_card_debugfs_init(struct snd_soc_card *card);
 void snd_soc_card_debugfs_cleanup(struct snd_soc_card *card);
 void snd_soc_card_resume_init(struct snd_soc_card *card);
+void snd_soc_card_fill_dummy_dai(struct snd_soc_card *card);
 
 /*
  * In soc-core
-- 
2.53.0

