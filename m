Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5B7A2D
	for <linux-sound@vger.kernel.org>; Fri,  9 May 2025 00:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746750982; cv=fail; b=gw0Mrol6AEpTwVK7lLTyfzmIFpOtl7Wp9ENMRg7rDJSvSF03dVda+hCRyQW73dlmRIsRSWjqYGjON1hvWinOD5skfgXc2d8jIiD4TBwE8dNyoaCySgUkPMIf8CjcX+xnuo3oErsjLFwzDZ/MhdVfwnNulTIqfEOi+Vxs0fETV8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746750982; c=relaxed/simple;
	bh=51bsdxhJWtgLOneR/GOGGhlbg1oIgkHdwkuOUV6AulI=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=ALCLZS8DRREN2/4bOm6dcGXqogFR7ANwb6oqvNUDf6R0EFfp/fjHi6V+9amjHqhdpHkcAftyxC6TrJZlJIHZ+xoXebJW4/dA8hYY7ZrWJh/JjBxt6UsuU4v8vS8/Gm5/4p6axb9GY1LT73nkHTq6D9LbhUaLka4sJG9/gbOD3lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Sk33bEAA; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Sk33bEAA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Amxl4CaMgn9Jb8JPl7JdCUisHdWqqyuyOoLqhEIRZI++gSz6m7el0AF8lR/zhKsTpuvXdENwSzJg0EjjIAQ63YZV3zNnJN6DQRUATopZAP5DtrX6V/hJzRifHBCABNkKXvALy9uhGTk+nURV4qtZwPmqcqoBJkb3nfd5sFCuvNW4p7BBFNiZZTMmY80WZqMoV8P+f67yQl2m2HxrOqjZUji8KQigy2QL8FDRpc/jXtm2oElkyPh911gyoTmEwt3Y7KAZm5okyVnyXZDrjs8TObjaofrOdgLmw8rI5p2l1qcl+JTWIvKdsFsKXQK+Xx0+8C3I97uuYcQsdcBGxX3elw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4ewWBrCvmU3vnzs99HIQY0Qs80JbfY8mpqMu/wyLkY=;
 b=Tup7DSng0rMmbudIvu1RN1hO0yyN5oxUDeUkdAEQTd0MZg5CBBIY4EkMm3gI21fUCdQY7gjvp9jtGS7TSF36PZIU+zZLORANBjG1xSxSrR4dVZ1xVKV9lxHIVgGIvSUUElKD0KkQzZRjQDZ34CJbqTnW7wp2O0/yu3AyBfuNykCrzlUS8CVutPDLSQpRve9ttkmdvbSaRRs7mCfz/g3pgmc3IzYSm277mJ3iUjxW0koXmOHC7+Pl9pa8JTnHu7rTAJY5nOalwlxEN2VBkjSXYcXWVA/W2fEflmtNugmXQO/K+z1WOpCifLGDRJeSeWJmOc7Rnp9sXOHliWFdaDtQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4ewWBrCvmU3vnzs99HIQY0Qs80JbfY8mpqMu/wyLkY=;
 b=Sk33bEAAs5Afl9Pp6EJilJQtM10gS3ehIEyMW8d0hGZ/2/sxRs+ki2P65g1WwQ7LypuWV8pNfGmlgeu1y3ndiy4lKaLStPk9shMYSSf+w4WsgU1ZSHy7H5sbhuKdOtVl9FgKJyoZ1IgDttXYH7ITvc+wvrPz6h689iWBwHMT5xg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11320.jpnprd01.prod.outlook.com
 (2603:1096:400:36f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 9 May
 2025 00:36:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 00:36:15 +0000
Message-ID: <87o6w2pqm8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ALSA: isa/gus: remove snd_gf1_lfo_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 May 2025 00:36:15 +0000
X-ClientProxiedBy: TYCP286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11320:EE_
X-MS-Office365-Filtering-Correlation-Id: 68fde655-ec92-4231-6963-08dd8e9181de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HLp4cP4pHBykVhYNjt+Rnav3v5/auwfK17JGEkdNXydEclRVrSxCNqPz2m19?=
 =?us-ascii?Q?XLL77by8wxem8Fg65unWU7Ufk6raN31PPzhuV7srnzMlaOvMSj75Okl6XJfL?=
 =?us-ascii?Q?c3x2nGGu1/kJ+6L4ocyt6iK7biqsJ677EuDTlTMRjWXsSMmvenlVAitRaHrW?=
 =?us-ascii?Q?mjIjIVlYOAj1cwtQ6oF85GIvm6PL1QjjG3JhOg9SiP8EM18xxQRJPqFLgwcz?=
 =?us-ascii?Q?vbZOiguksLDZ58mSi6VbhMd2GnDxj6UiZSkO8VdWpMpE9zTA4q1MUhy9PVA2?=
 =?us-ascii?Q?qjW4RoJOUJPOGRB27pXPXOQaI69tDOntFkSbytByekR7ID73e+NgydZvtGHR?=
 =?us-ascii?Q?baZA1wBcQ9lu+jk6KVBC1ThLUvrlyCWZl//BvgjrAa+wSTH2jA439mMPeBhb?=
 =?us-ascii?Q?P+Lrpsu1Ez1X7dy+cWv/E5AG81pi2fbkgxu+MM5tbXAkOZVQCMo1I22Z71Vq?=
 =?us-ascii?Q?nlNibs+ECLlIfEUFmn5AJjE4RGgzR6wnfir1aTg1yX/zlUERg2g6SHiyqkfG?=
 =?us-ascii?Q?vgZHJfBt/iN3foxxikylEDeJkRbnLiA0OPLwOa1CJHPjmev7rEPkDXTiDvon?=
 =?us-ascii?Q?Cw/vkoDJhd7TnurG+ofnpUHcMZGfLCAVt2sTKMAukLXdvwsBY0zjV+OhxOVR?=
 =?us-ascii?Q?z3fmUrUvvD80H9iFS74tOXtIudovudrFvEJwwmx5Fp1WdQu8eyIbcq/bz4rv?=
 =?us-ascii?Q?kvZOTL3QHPlc/J1K2qRdVynxVPilHWvHtoEeiLAJOHfMkdBf+PsA860URzOj?=
 =?us-ascii?Q?7tkDb3Bet3cgHR6tyFWWC0rwYJw4k1yUyYCN4UXYn8to8tDMLFIUevEfb57h?=
 =?us-ascii?Q?td15c0SDNsDYOMvTZy+kV+qQOHWeg6nNgktrOt7h1qZywSVPCrAvnjpqCd/K?=
 =?us-ascii?Q?NtH6iz3wtott/rfCZDml8wedDExTqkTlj7JsECluKct9OL11KIp0SkFcmCa9?=
 =?us-ascii?Q?vAsDyXS+3RRL7BtPrt2lqsOl0LdJkgXdMWLEaQ47XGTCwAuVENg+nGzGrXJO?=
 =?us-ascii?Q?rfPv4qtZnYEKhbbeImEPi2n66cW7Z1iDFjcV+odhO1dLi5Wpjh42Arj50qsp?=
 =?us-ascii?Q?b99qF+0r7/iK3eH2v+1ZilMsZHeNYJldKZd2R0mES2EAaHkhB3tUJHO8v3d7?=
 =?us-ascii?Q?YAw0gI7hGHX4vPkZpAB+AhA9bPwtg1DxEoMC/NrCC93ly+iWnb/gyiy27Yie?=
 =?us-ascii?Q?iDZ3+Ma1fPcne2yEAqaKYsmAklc4rS+PNgKem6Dude0SC9xJTzqgtFX4iJQU?=
 =?us-ascii?Q?oIbU28S2NfCuVYPXE2JNCAb9SdnKQJbbIon5JCyBEQhLn3Q41mKypXiTo0kO?=
 =?us-ascii?Q?p3KOmu89mG9Nq+gQ/fYMV0x65/2YIdBZ248AZbDW62jvZw6IDlcW6S/t3e0e?=
 =?us-ascii?Q?ZKVjc3bes5+l/uo7uDZH4QoONqo7PCA+vW937DGsmyqwbCyUr8b0FibZ53Od?=
 =?us-ascii?Q?td1umVAgDQk9M4U7Qa+WK2GKlKDAfEILhY4hKvuGa2RUB1N7S4fuZg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q+xgCp+rMqw1o5tu9s3l8RuGGXGrWrIfI2c6TYNb6HZUbm2S/zBjOQyD8KCf?=
 =?us-ascii?Q?8S4aB2PdU/GyidrsbRf5J1DXlYmBK4V8TfyAcbG18fhc+BjbWmNppH1z95Cz?=
 =?us-ascii?Q?HRydGH9zD2jk06FaTzFjl3Nqv9Sr5H1NwN+mBhNAenQztntvyACRaSPGy00Y?=
 =?us-ascii?Q?0miUxd2FkIAy2jG8Qa7N1HYaK2RPbl5G+98NW+CBTSWfgQCT+HPJA3o3v8/b?=
 =?us-ascii?Q?CKE7tvBp/uE6ptdq1eLBMeQjWocjGLF/Va4vCGZlmprACp6Q5AzbZ8dKGCnx?=
 =?us-ascii?Q?7p3uyJ6qN365ESfUEzAYB7ZBQT87rqideUdFCeNOLt6SVrj8Z0anYpDiKRJa?=
 =?us-ascii?Q?Mitkf5XhjuW4+m/reARvenqBe8/7M+r8eN/ytXnWf38Ah+iCrw+dgRHQzdAY?=
 =?us-ascii?Q?+TzdD2JNl0uZeFyQWOw588kqrzkXU+6gMDhcv8W/TtoEId9suHloLg8SGwfU?=
 =?us-ascii?Q?9HqidYiYm7+jg1yGKm7lmLI5vakQHdEVvkCRRjCewt5d1JQxT5FlyNHtrOaw?=
 =?us-ascii?Q?JnTGbCdocCXqXN5eyGBTMTHTHfHc1oG+6siriM7omGy3H4FFaNk0MSA6YNrO?=
 =?us-ascii?Q?/BdqqUVhq6jVKbAtuem5K3bKj/8WujgAQu3HCiiTNiyw8Adiw7rCxyHQFrwA?=
 =?us-ascii?Q?pR9lzXpW2VOvpybqIixPJ1w4ooUoqsz66kq4lDdH6GJrRJf0qT0DPvwa1yUc?=
 =?us-ascii?Q?Ex/2cmYSxASp1SrU1GpRU8MdwOeB1NnUgtiC0eigwUtNso7msY+WYwvdMDqE?=
 =?us-ascii?Q?F90pqGhw/2W6CPnH+nSfYc2uERdrXFE3krJX01AE29C4dhJ3N+3gBuDoI/jV?=
 =?us-ascii?Q?f90xxKx342F6Wq/jFWYK+tNqVJYbVeo6b+SkhRbDkEFOYzdWlk5R8ilbKFy7?=
 =?us-ascii?Q?c0CG0sBqTX2VneXgrfEGdtZhXO5tFmOdSZYdR5GYlwSnCJ+Bii+1a8GMINqz?=
 =?us-ascii?Q?IMZb6X44AXW5z8w5NbDo2lZ8GXCpot5yEuOgyWk5dwRCMejT6AYFWE42pl7o?=
 =?us-ascii?Q?6yvpg1lh3N7gMMwq0LV12+tN2qyqcp6NNX6IKDjWoMTWlRPjHrSpp7T3XJGX?=
 =?us-ascii?Q?X/FrnhBGQ99ouZb9j12ohtnlepnMg+qza53o2/bCkgW8oncjwLvZ7EFtn+++?=
 =?us-ascii?Q?+QLO7vD4udcbGRaB70PabcxzSXSb0zwvrgrMknt8p4R99Uw9TJUSbxE+0IS7?=
 =?us-ascii?Q?bzPRb6MLOn4ooXA0Jp4jb5ls6VDeIxVSYU4RH3ATFo1Q7Uwjo0rN+PXv3o8f?=
 =?us-ascii?Q?dcZbRUwFdCHFvzizfqzvyzZ7mwW5cI7Ywra0Caid+x62Nh098ZYa/VjExhxY?=
 =?us-ascii?Q?4SpK5wflArL5PzXdNMmbD+x7VbC1LKqhdRDlNGoa1utvtz5Yjhq0Vkldt/WN?=
 =?us-ascii?Q?uqhl1tfh51F7/i5vpNXZdVcKa8VXCkiYiQtrc0MuViBvQGLVMnHzo1tfdVxD?=
 =?us-ascii?Q?QXT5GWKGBtc1G4dc1kGXHOA33LZwhYXDb+QSsLq+AlRCa0UFMsGVhIJwocZL?=
 =?us-ascii?Q?FHD3/1IyPdxEoLL8IvaeFJN9K5SO1ItsS/WCSu8PWTkAVdgxo9WvSPBc3dnr?=
 =?us-ascii?Q?nZm61w8Gp4hNr5kzucyMl7h+TlaFCA0Zzhlf1ZMfDBJ367RDhtiKRtuMdRIR?=
 =?us-ascii?Q?FCskP4JLdAH6h2Qji+5nA1Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fde655-ec92-4231-6963-08dd8e9181de
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 00:36:15.7576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgqFv/c9MnZnzJ05AMRhCToA+BZQs2yABoMbHKlssD5V/pMqjSXpQCV8F+VdvbXS2YVk8tdhYLI+rx6msU7wa+KjcIGilXAJCX6l1eFoCyt7+q8CPWyz7/H5n/TFBSBu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11320

There is no snd_gf1_lfo_xxx() implementation, and no one is using it.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/gus.h       | 16 ----------------
 sound/isa/gus/gus_reset.c | 16 ++--------------
 2 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/include/sound/gus.h b/include/sound/gus.h
index bdd60ffe15c2a..1c8fb6c93e501 100644
--- a/include/sound/gus.h
+++ b/include/sound/gus.h
@@ -513,22 +513,6 @@ struct _SND_IW_LFO_PROGRAM {
 	unsigned short depth;
 };
 
-#if 0
-extern irqreturn_t snd_gf1_lfo_effect_interrupt(struct snd_gus_card * gus, snd_gf1_voice_t * voice);
-#endif
-extern void snd_gf1_lfo_init(struct snd_gus_card * gus);
-extern void snd_gf1_lfo_done(struct snd_gus_card * gus);
-extern void snd_gf1_lfo_program(struct snd_gus_card * gus, int voice, int lfo_type, struct _SND_IW_LFO_PROGRAM *program);
-extern void snd_gf1_lfo_enable(struct snd_gus_card * gus, int voice, int lfo_type);
-extern void snd_gf1_lfo_disable(struct snd_gus_card * gus, int voice, int lfo_type);
-extern void snd_gf1_lfo_change_freq(struct snd_gus_card * gus, int voice, int lfo_type, int freq);
-extern void snd_gf1_lfo_change_depth(struct snd_gus_card * gus, int voice, int lfo_type, int depth);
-extern void snd_gf1_lfo_setup(struct snd_gus_card * gus, int voice, int lfo_type, int freq, int current_depth, int depth, int sweep, int shape);
-extern void snd_gf1_lfo_shutdown(struct snd_gus_card * gus, int voice, int lfo_type);
-#if 0
-extern void snd_gf1_lfo_command(struct snd_gus_card * gus, int voice, unsigned char *command);
-#endif
-
 /* gus_mem.c */
 
 void snd_gf1_mem_lock(struct snd_gf1_mem * alloc, int xup);
diff --git a/sound/isa/gus/gus_reset.c b/sound/isa/gus/gus_reset.c
index ac5da12810420..326bc6028885d 100644
--- a/sound/isa/gus/gus_reset.c
+++ b/sound/isa/gus/gus_reset.c
@@ -141,10 +141,6 @@ void snd_gf1_stop_voice(struct snd_gus_card * gus, unsigned short voice)
 	if (gus->gf1.enh_mode)
 		snd_gf1_write8(gus, SNDRV_GF1_VB_ACCUMULATOR, 0);
 	spin_unlock_irqrestore(&gus->reg_lock, flags);
-#if 0
-	snd_gf1_lfo_shutdown(gus, voice, ULTRA_LFO_VIBRATO);
-	snd_gf1_lfo_shutdown(gus, voice, ULTRA_LFO_TREMOLO);
-#endif
 }
 
 static void snd_gf1_clear_voices(struct snd_gus_card * gus, unsigned short v_min,
@@ -182,10 +178,6 @@ static void snd_gf1_clear_voices(struct snd_gus_card * gus, unsigned short v_min
 			snd_gf1_write16(gus, SNDRV_GF1_VW_EFFECT_VOLUME_FINAL, 0);
 		}
 		spin_unlock_irqrestore(&gus->reg_lock, flags);
-#if 0
-		snd_gf1_lfo_shutdown(gus, i, ULTRA_LFO_VIBRATO);
-		snd_gf1_lfo_shutdown(gus, i, ULTRA_LFO_TREMOLO);
-#endif
 	}
 }
 
@@ -335,9 +327,7 @@ int snd_gf1_start(struct snd_gus_card * gus)
 	} else {
 		gus->gf1.sw_lfo = 1;
 	}
-#if 0
-	snd_gf1_lfo_init(gus);
-#endif
+
 	if (gus->gf1.memory > 0)
 		for (i = 0; i < 4; i++)
 			snd_gf1_poke(gus, gus->gf1.default_voice_address + i, 0);
@@ -391,8 +381,6 @@ int snd_gf1_stop(struct snd_gus_card * gus)
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 1);	/* disable IRQ & DAC */
 	snd_gf1_timers_done(gus);
 	snd_gf1_mem_done(gus);
-#if 0
-	snd_gf1_lfo_done(gus);
-#endif
+
 	return 0;
 }
-- 
2.43.0

