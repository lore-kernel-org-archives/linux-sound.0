Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE12E35C18C
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605355; cv=fail; b=eeF9VknUSgTz7wSrVYR+UKu1LOyUiB5dZ+yIY+Y9ksP5+u/1Zv9PmF5jXc7Iw69XMIn9RpFpr291OcDgQxCMxOBx27TmVuuPSUaemJjnoGS7ZgcrRfigKsliacTRuzBuRVQGlFJUHek7hpGoyI7bSVPCqZKuFcSTyYyextgpRAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605355; c=relaxed/simple;
	bh=UN0aaakXfru8ed2O6iBAxq6l4L/ylSovYUQ4Qp76Yd8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Elv+ue20BbYtUlQinW0n628XNaG9WDMNr3fGkKUVRcLqMTILGNUmiUD9s9H3v33h3vJYfTJ36a2OkJgK47OGLkXsyjYbdN4jlT6eExdJ80YNYTst9l+mSnc1ftw6NLfnQ529M+gPJTle3fytSmrXghSBLC89iqm9vgaHm33y4/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NONFYG3X; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NONFYG3X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iR2unRo9x/qyrBUUxQqzIKd1DnBuC8cvH0MuN9oE2GrbOf+Lrdp6Uas8oKHBmLsczyWnPlu/gFMjnEIQpavj1KzSH7EJvkcpo0dR4783WjmmfhsiyAfiIC6uyJRxqPp8L6V6TN9SqvydsmsurNrB6GjPKEX5vXffz3lWZG3enm66P7jnbkkG30uimFP2O3Dk55gTWJRhRfg3oI+k+2xyfe3fqwYm9LydjlE9gItagZkwQ/YUxgacUpo0E31rcJr/2fL7ynhqkKZ7lMxKDerMirP0w6olgeaJtYF99GMtQu9ZZhc5h4ZQyaGP3NjumN525rE5dObrq/hmdou5A/qD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+WbAm5g9aLBextGM6HKG9x897xw/KgL7Lf2hR4B3jY=;
 b=efVbWGYd3IM/q9VyBFQjk1j90fIxNFRCMa73+SV6d2OuOyQuW2AqR5/LiDZ3dPBf1yE2eZR5MSX2OcgnGvxF1jFAa7Bjav4emNPdtMOJCfKwxQoaEeud4aBhEqk7E6SOOtDQpG9kr/MD7+4XAv5Q/xuqNJySbszAcNRsPqJTBoBNHrTkf4/y1EA81lyk5xQhg9VcdEjUtWl1mUQaHMtw5VZqVR8RPbgEa1b6KwdPqLPRSYDYj9m4aThPKTAZ8OsumVF6BgeTbAjka90NJPRj4eomuTj4qNpbuZJlJUN60e98ySMrasnbKUp6bx8eOe4VmNmvp1U9YvQOmIr7T2U9+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+WbAm5g9aLBextGM6HKG9x897xw/KgL7Lf2hR4B3jY=;
 b=NONFYG3XLsEUjRCUtxqeRMmS71gsx3gAR2hZsIEpKixgVoLqu52ZAP1yTUf7TYNXFdbEgtSZsqIJpYONRmD+7XE3iobPVEVi0JntSMcjwsb59ArLSPBtvh2/wNPjNDrj3skKC0zrRs01ja8bm4kEQD5V1+5YjFu8gUesEI8oaYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB8193.jpnprd01.prod.outlook.com (2603:1096:604:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:22:31 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:22:31 +0000
Message-ID: <87tsuwp109.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/29] ASoC: soc-component: re-add pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:22:31 +0000
X-ClientProxiedBy: TYCP286CA0340.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::20) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: d765f2fa-3719-4409-3205-08de79b66a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	3oRgTCFa8639MDojlL0a2/9A6IwI5LEo3L4JeZLL0pGdFKN/ToAeWHB9zTqIaEeZ7NAsshbEf/v9CCQSImzUnMhrnJ98YctiBTwDIu1Q9SvYmMYtuzc0daGsTqKO+6OnKvljTgJDvAJtehEZHsWGl9MGJXmeL6EnRmaCNNU0d+Kj/+Qdv+gkmoRhBcNtYysiJMvkeWXyfwqpS5qYGHmy5prqO0m+o86xH2I0MDiKRUlkebabAMBcQ8hupamjxz6qaCvjYfkn+jfbAc3HiYDEXrO5DcyqIg+WACguwav94gCjKzKx1QqiCrQHFcKOb1aiul2fqM5xWfqlzKZ8B7NkXbBFGfF/veSb0PHTcn2IqS3juGgVkB4PaJq4Hoggb1//a7Y9MF3vAsfL6rTypMJF0Z1K1X5cC4C8EU0wQ2fajndFtZF5wtoXzU8wdRf+gF0lYWszzbTjZtrCJJJUBWLGSj71yLudKnqTA1Ra255AsiGLEdRgex6l6HqB9unt5E2G4d7hYdnLltwkKeS77PxPJKKUE7U1OUqpuNT9zC10XHor2BKyQTkiLjiSLcLExxHvxNn9p5I4Z4l5RjHA7CBNc8wYEcyeZRHwoBP6ZcaCpt8etdIkuzpXrSElP464PhjRjUnXfpZ69Y8hufeY1IWNGI96xDS3l5UfS8cYRe5Stjxlj0lnWgNOkiuctLeGcoFVU40vJ8O3r5tu6bhUXFzJGoDhXRk/snlVLtp6q3nafMhvh92cWfMwl5G+urIqomV/9lvqz95zNNsJzsSEjW4KG/CQsh7Z31+L++3puzODN8I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qwoO3tRYYoOoj2XHfQ/CW4sXWDPupVnixpfC5FtS52xBFgHa+BgrY26zfg/n?=
 =?us-ascii?Q?x26iWCISZRV27agN5sEMjREu1fQtp1bSs5iAIZhAlu7VmF5eILxM9E70RkLT?=
 =?us-ascii?Q?4RFvWtup16nByoFBv9urYQEPwQ87979VpOvz+Oy4N+jHex3aR9DRc6SG4Ipr?=
 =?us-ascii?Q?g/bWMS3a5syatIR/MdqNXyS8ubojsitRVXRXg9KN9mceTR+h4+cSf1I55pgJ?=
 =?us-ascii?Q?sXZZeA+r0/lV5AbZleZYTRunK8jaA1wi0VSAToZGcLfgsAcbLSTe/eFYMvA5?=
 =?us-ascii?Q?KHh+DVrUuCK9fjCZRabFss+ZafLTlE4J56SZEoKLwUcPs7FD+4dmHjAnCM0T?=
 =?us-ascii?Q?B5OdPXIeYXJQ5wNyFSmsJ6Jm6UMYW5cDeUZfRBMn4SNV6mT2vx2F0bBcIbd9?=
 =?us-ascii?Q?F6lYntI3a0qye0o/VSucRdq6csFG5w3baXFzc8NyV/vmGKSzDjgFcaNuU7AC?=
 =?us-ascii?Q?NwGGAxm/ivqZ9drabsYT6dMQque49tsmIg3yzZO7i4bG3kn1zbdTwI71coAw?=
 =?us-ascii?Q?6a/ZDteugyrMn6CTWcOh0shG7PMXR1cVV18zb3jaRZMJHz20QiqmahQV9Mp0?=
 =?us-ascii?Q?ZtLg6MaOBlE7TX3b0jpAxGgFQ/799Bnvroi1il3nr8+rH9Kjs0sCZdg0zngi?=
 =?us-ascii?Q?iv1iVE3cmR4JSRTKurAG/0ByyR6WGBT05t2gS86f6MjVMonwg1tw2cp++C4C?=
 =?us-ascii?Q?Ccj879CxP2hDG8Ww5K0aOwUkqfZ3GpBFVEOkA2udDouPMueXAaKWjg4WkgIt?=
 =?us-ascii?Q?0i+KWZxSgKd8Un2Ej1xUeB9AYXm2z6OFdbmFZf27x6aJjCWN+I2TRNtXzam7?=
 =?us-ascii?Q?RQu/gQ/Li8spETNTFxWtVRjtMq1p+QKkrA2RHfz2icODyPCAgRc+yEuPyjg4?=
 =?us-ascii?Q?qOe48PHPh2nQWz8Br6U25YlOVf795jvTVSJ9fooOTONxWFfwiGkotN6KycKG?=
 =?us-ascii?Q?UmMat4n9u7wqgl3pJKynMew4rH7GdqkBr+FByoBGAzdU5HHCnAON0AxnPRQd?=
 =?us-ascii?Q?5u8mrEocgt0ISl3lcqi81hGUPl/f3yWWnmicZMxAkrNBbBIp/Wh45NKpdt/v?=
 =?us-ascii?Q?JCK5vHHfyKizKlRuEDv8vCe3+aaD58DmncdcNJaQ6dUjJZsIn1+euGt6n7do?=
 =?us-ascii?Q?lXrNLHPbcnCXJDtGZsSNoUDZN52GALsG8x3oV9Re/F1syJ6xrDVn9fZsFJd6?=
 =?us-ascii?Q?MmzUxBOCWZChiFbZTG4k2EXmPVYN44RVDJoDgxkKeBiSHeC1GiTYOnHYGWyP?=
 =?us-ascii?Q?jYKk2sZQMaHAlGlwyTE+RIDGKH0lvDh3GqfIA2UPfkYFLk1X5jKzizn6XwW5?=
 =?us-ascii?Q?Waf59A5l7rapWbpyNt9F/1tmoBnx0TBqsLuLCi4pVrsCG+ERbrPicerc+lfd?=
 =?us-ascii?Q?yec11tCbh0tCK2ps7Z02X7dBZVCZD2A7OcgonChHLBFQltkByrYioZcqHKOG?=
 =?us-ascii?Q?DpSHd7YdK4cHl5GybPKHG5BX3n7Ass4o7vQ4+3YdFBCSJhCYVV5rIpC8M8pm?=
 =?us-ascii?Q?ZQbPuIx3rhEJu+7dgvs30P4coBm1ExSBvPLa8oYWyyN65Gp3wapSHc8HLwMk?=
 =?us-ascii?Q?fmA01bAjN2c8hqR9qT4Q3ld65kdEUCecR5SG0IOQ/yfp90mYT7zqn31I0KdI?=
 =?us-ascii?Q?LuXu/nl0Mhos8iP8iMYqi1cCJ1rJK0wX/mXlFS125JllJTr2rWXit+YF4zPn?=
 =?us-ascii?Q?zG7CrGbwfynOvnLMTb65TPahsL1sI0H7DuA5QudFI8x/ImCzKw5pbUVQsRp+?=
 =?us-ascii?Q?3WwFJMzFjWrxaSE/cg+VcKNRHNMaHktFT9u50EMH58Y+ymEJ0Gia?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d765f2fa-3719-4409-3205-08de79b66a92
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:22:31.3228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxHEEQZnbTbBJ98faROpZ/xvwL5DIHboPQApcdczIonP+9gk7xA+pu8lBqqErEup9+oFvTmbVSt8cKx1V0VVX7KFsU/jK+NKRu3BqNxnwt96yL/SLEVsZWyiuVC5Rwog
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8193

Because old pcm_new()/pcm_free() didn't care about parameter component,
to avoid name collisions, we have added pcm_construct()/pcm_destruct() by
commit c64bfc9066007 ("ASoC: soc-core: add new pcm_construct/pcm_destruct")

Because all driver switch to new pcm_construct()/pcm_destruct(), old
pcm_new()/pcm_free() were remoted by commit e9067bb502787 ("ASoC:
soc-component: remove snd_pcm_ops from component driver")

But naming of pcm_construct()/pcm_destruct() are not goot. re-add
pcm_new()/pcm_free(), and switch to use it, again.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h        |  4 ++++
 sound/soc/generic/audio-graph-card.c |  1 +
 sound/soc/soc-component.c            | 10 +++++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 2a2b74b24a609..0435ba376369a 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -90,6 +90,10 @@ struct snd_soc_component_driver {
 			     struct snd_soc_pcm_runtime *rtd);
 	void (*pcm_destruct)(struct snd_soc_component *component,
 			     struct snd_pcm *pcm);
+	int (*pcm_new)(struct snd_soc_component *component,
+		       struct snd_soc_pcm_runtime *rtd);
+	void (*pcm_free)(struct snd_soc_component *component,
+			 struct snd_pcm *pcm);
 
 	/* component wide operations */
 	int (*set_sysclk)(struct snd_soc_component *component,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 8a5f417047397..74e8f2ab7ffc9 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -77,6 +77,7 @@ static bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
 	struct snd_soc_dai *dai = snd_soc_find_dai_with_mutex(dlc);
 
 	if (dai && (dai->component->driver->pcm_construct ||
+		    dai->component->driver->pcm_new ||
 		    (dai->driver->ops && dai->driver->ops->pcm_new)))
 		return true;
 
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 89f236ab30341..77ad333839744 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1042,6 +1042,11 @@ int snd_soc_pcm_component_new(struct snd_soc_pcm_runtime *rtd)
 			if (ret < 0)
 				return soc_component_ret(component, ret);
 		}
+		if (component->driver->pcm_new) {
+			ret = component->driver->pcm_new(component, rtd);
+			if (ret < 0)
+				return soc_component_ret(component, ret);
+		}
 	}
 
 	return 0;
@@ -1055,9 +1060,12 @@ void snd_soc_pcm_component_free(struct snd_soc_pcm_runtime *rtd)
 	if (!rtd->pcm)
 		return;
 
-	for_each_rtd_components(rtd, i, component)
+	for_each_rtd_components(rtd, i, component) {
 		if (component->driver->pcm_destruct)
 			component->driver->pcm_destruct(component, rtd->pcm);
+		if (component->driver->pcm_free)
+			component->driver->pcm_free(component, rtd->pcm);
+	}
 }
 
 int snd_soc_pcm_component_prepare(struct snd_pcm_substream *substream)
-- 
2.43.0

