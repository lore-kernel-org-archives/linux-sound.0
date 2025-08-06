Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4034431
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 04:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754455315; cv=fail; b=YXYmiBblN6N+dLG75Jq1g2shSdBV0ZNASNsIy3fKmHQnZs9SHg37mvFkYxIXS8K/QKIiT+uuMM3kyHzJXp1qQujqXYFR4vGYbaI1YVEJYUZM8a/dc3LULMTgyBsOfvvYiK15SZdgY7WHWjO2VP0ZNPOuBlfuPEpFAMZ2syhSLRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754455315; c=relaxed/simple;
	bh=2vapUHWixZbckm8OBdtNrjzmhAjk5p63JoO3BBsI84o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XtIrQTcrJohdcKEfPjz4iCPUdDnzwfNxvwNCYSkIvrb0zs/bNQsKHE2FeJRPPeapMMK0Zq55IbzWCMP6sJEIxSRG8JjBF/5UTH+VON1hGau8Q11xtoYJ/dxyvV0PML+ozQoxYWZPOJ57Y8B+1aOr53lJZqM+9UwnsgS/sDt8REc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jctdqjzR; arc=fail smtp.client-ip=52.101.125.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jctdqjzR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=heZjFEMlN+tMEdE4kiIATkndRO61jb14pLjthlP9kFYoMsYteNC8+m+pWu2uUlpFcu8PF4P+/tostexyBuDPMvTwRG7fiNfNNiQLQG4vbhSgsCM7MsZkG2DWcji6zlOYDZsdcnI9+f1T4uLEVxHoiKcxR3MfLLvRf4T18aN2x7gnkLZaOhYMonhvLmlOkmTnT0Mevrqt2esmDFniknYLYeNed2YbKkeTMoz827lHCO+mjTJFtPs95h4Vz/39sTY5QdnWQwFvXQ2chZExs3R3glf+/01xBA6zf57TIqvjxy6dIKpM0CfVP2U5BtZ0F9hMJzo3rn/dFAvJhCTnU0hqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgfs/IwyPOmsD4w4m6TgfUBiyJ+dYfE+1xoZyW8jC6o=;
 b=WpHojsA08umhh2sVHEqRHIcky/bBM3Q6FsfmPYkZWfzyWahEbclKpBi1p2BIA/rSNLd49UR1s8NZrMGmq/Pr9zTYvkbMqWOvmUV5y9I/zy4xYTyEBOURGmHoF4augRmy2sKXKHWagCcdmAtodjoxWwjKeyUiswdsvdTCMzoxJ0loLbvt74bFzTBPlYch+Oduua/2Ca9D+RDMQukz/Pohkv9OJUHoRYzmolzhjTmVNuWvfnRCem8rqKrMnr+OovM3GBBBVLHek+dFkWhtrlpm/zmg1fof6NBYFiGVooiGV0Hy3b5oxIRpl06aJC4VkImu15ROB752ejxyel/9QwmzXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgfs/IwyPOmsD4w4m6TgfUBiyJ+dYfE+1xoZyW8jC6o=;
 b=jctdqjzR13C2fvxF3beGLF9/vI61YfxLvbT8pQC94IMk7lEH+C6QCQy4TCRFILE97fVVnoBm/nUi8DUH1cd25TFpThzMq/fEFtehUtp4XbQRCBEi1ONsZWDZEGDGox1uzv00S09hpzbThFA0mneeGw5VIFAYBqyjxbZnoHBcU4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15138.jpnprd01.prod.outlook.com
 (2603:1096:405:227::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 04:41:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 04:41:51 +0000
Message-ID: <871ppp83jk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/5] ASoC: soc-component: unpack snd_soc_component_force_bias_level()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <875xf183ka.wl-kuninori.morimoto.gx@renesas.com>
References: <875xf183ka.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Aug 2025 04:41:51 +0000
X-ClientProxiedBy: TYCP286CA0125.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15138:EE_
X-MS-Office365-Filtering-Correlation-Id: 8330d1a7-dd2e-4c33-bbdc-08ddd4a38fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y4fT8SL28mmSvz0tSWP1HTwHcdNBUthriMaLdp64a+PT6rfNoZdCnZuQbH5F?=
 =?us-ascii?Q?m/i77qdao9ZZIJybtFGcWQdZrpmjOg+IZ8TkODWdboMLHP7qhVXWb9BmcYwA?=
 =?us-ascii?Q?yvTzFaFEjXtefVdOGXTAcTh6vUrNnbWYqc0qBxAA194UBHG5MBfmt4cbjU3d?=
 =?us-ascii?Q?89SrjclrC4bUIliiAPCRub/n2Kcvn9/mYohJ7nZHy14Ym6mTmAGUUIyUHAJq?=
 =?us-ascii?Q?ujnKmlTcjq4h3ofc8sQKaemmujFd5AE0KXLcXBLvove6JWztPdW3byNzXOVu?=
 =?us-ascii?Q?qeZn+8tUEEIO2zbehj5mc5HZXigkosIr1IS8xiSOP5lYUKXN5vHG9E7zR1P2?=
 =?us-ascii?Q?Szg+WPXADjGDT/p0aJSlh3rtR5ydTke7N+3cU1opfNG/6mlGdYaDASjo0Jii?=
 =?us-ascii?Q?s55HfsU4+2bUcOHz9q7lNNmhDEVNB7m7+hF87rf50o7lweE/I6CdPsJsk3NP?=
 =?us-ascii?Q?Qs0qHVy49uotkQmx7ixJ/F7tjLgrcdAViVPXmo8mXDmfwCk9fMQH0WLPA3sO?=
 =?us-ascii?Q?RVtxfHLYncGUL2/oxdzfbT9EoHmuq2sbITezinUlxiV0zboer4TuzPHdHReu?=
 =?us-ascii?Q?XXLdFp/lYZucTu3583BqgCy/7I0TkcS6S51CUpNWYsYiMdCOyzDVXaXPvYTT?=
 =?us-ascii?Q?hvI2Iy0RCkyqETMO2eKag3NqxM2m9/hTwo8Qo7O0s0nvytpewoGXLijZAPNR?=
 =?us-ascii?Q?wUIrzIEjZXOb6g1J6uEW+Zvyv4VFnQ1S7fv4WKXZkBhuj2OF8YRj4OoA0N16?=
 =?us-ascii?Q?SCeIMGcbtJdg0AwmVDRD+KFs4n/AdCbXww637EjEqT1vsli4gC+fNMrt42VP?=
 =?us-ascii?Q?99Ptx3rD66VPVEZBHuG4owc5XbsWPRxfagRMOQcJUeKVXglcJPsLP5VHuIB6?=
 =?us-ascii?Q?DopsdVi8VjlAawmvjMgDAgzcTiHSGIcppfT2rih9OhoAozXXLPkr5UN+9oNI?=
 =?us-ascii?Q?JjkmNdA0WOE475Qy97OwQweE1C7R5MrKHGct7WcnZk/E/ZUSLqVXFhej5Kyj?=
 =?us-ascii?Q?PA3rj8HrYBDi/pJXsXlFfC3tecgI+7heT+11I3HY18f3wi5VoU0Bkgezm2tM?=
 =?us-ascii?Q?9ap+nxLYWAHHX/+ZbgT6qfkFxN7osQ6gTEeE8UeeF/8VWPbpvsdwovfF8yzT?=
 =?us-ascii?Q?02SsPhLwMJXfM6w1+AnYyf8hy03E5PFtXPq2b+bTz5hnIvAYE/0BKfxsOFFV?=
 =?us-ascii?Q?fBdMoHlgJK9ya+UGGhbMB7qQG57vA+jDfJFO0c/EMPoRMR5fFCayUNteNw8O?=
 =?us-ascii?Q?V2WTco6Al4IGOOlqWH5nuEsWs1K89vHajZo9hYmfr+SRfMsaTGLY2C7ooTHB?=
 =?us-ascii?Q?QT3TqQ4QLkIqcVt/K0WP4kdHF82Z0uZEqFenolzGvEhS2CP+CY4Zh02Acp2T?=
 =?us-ascii?Q?3VBMVH4RAWOifTr4878iaPXe14OddO/QrdLVhVnxsZW2+Xex8lua2jpyh+4a?=
 =?us-ascii?Q?ZN/SMo8n+psCg/LlolFWNEgMZZ6uJ3eHnSCFD/kkeAuWwrky0Of0zw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LLpYA+hwJzAERJUazFObpKqRKJFNiELd2UhjI8mfazcAVy/IYl4ZGXieIiTE?=
 =?us-ascii?Q?5gl9yEmCxiYgRQurxBxNjET3WtvdzfjYvV/vAbyoiSRfz0fxZylhURiqp207?=
 =?us-ascii?Q?2PO8HKrsrBPvYrqSU6YH5+odjalLGUTfGM/Z+o/iZ4H7dyvGSY/dSndS87HA?=
 =?us-ascii?Q?klUVbIBRpL/oZ0LbQ1HURa5s/asgqWAWqrk5TaTYqvTCvltygsi4eSAT7ti/?=
 =?us-ascii?Q?EjRhxpi493lkJ9nY01wFwfd2Jo90b9RQqbwxYb4AAGYclqfkxFaBK3r8ITWw?=
 =?us-ascii?Q?afVB8mxFp1nQip3ZoiqsofSMoDFaBk37R8IL8lrlC0f0kfyF5PzuamM5ctqU?=
 =?us-ascii?Q?g0eGrvbuSEvvanxet9ZwZKaAUhU6weOsDUdLQZKqsjL072UImdvkBrGR3owz?=
 =?us-ascii?Q?zQDXt0xGtZ2Q5On5lHVfYQlzfEi9hVPkth8GfQYyrqH4drehLyynuEO9/NQ/?=
 =?us-ascii?Q?Sa7NlC4M4ewdUExhk5qoRlXAQL/0978S+mQ2nJ1WTOl4SG0eaInSls5NHU6i?=
 =?us-ascii?Q?6IHc188K0RH8gz8iGSeLW3y9FH8BGs7EGAJQE6Dp7mw02aRSls/stLP3vJZb?=
 =?us-ascii?Q?xXpx3zOwsoqmCaVzt/ulpoDrxawBX2+yXtah6VaFB+CTOPH4olxAhkxFu0mD?=
 =?us-ascii?Q?wAFN1Pmh+lYmmuiV8sRRU3+gKrYolR3kQ1883y2bWiVlctMCn1sbMEltyF9Z?=
 =?us-ascii?Q?Z8v8nKMQKV0aeG2hJvA9W+yRBEsuwOueOYsZeelmCeFj4uxxUTurIpDgMZek?=
 =?us-ascii?Q?2tlB+jLZ4AhEl8pS4W5AKo4jAl+mxhFOMF9qKTwclCn5QyaxjUiNm4bq0vxo?=
 =?us-ascii?Q?34gbdCBdSQYsQ9qL/pZpvJMpp3/yjax/DfkuQjtu4wWNfBcwFuZNvO82G3kC?=
 =?us-ascii?Q?vb8fD0KOiKN0SPPH2MMFvaww6H6V44cNeCh3CerqTnsNsosa8LMid/KNhQhd?=
 =?us-ascii?Q?TYtgAL1+VHl7OYzBs/+yKVqXQetGtWKaNyKjGeWwcwbP/f7Vm6ykQObO4Xcy?=
 =?us-ascii?Q?8KHaNR7LrHDe/DbgdkLlckreM3lqFXpzZo16YpV4538SMbL4jO/t13RQ/nBc?=
 =?us-ascii?Q?rbqHaWtkytOATsnt9xTkM/iZfPKdnwL429llQZTyWf/blZK+xBh921VNGJnD?=
 =?us-ascii?Q?zi2fk/0W8RUE2b+Mc0gP2Is5Zt8lHI63L1G+bRSDL9/ocnBPNlLoY6TUpUq5?=
 =?us-ascii?Q?d4QrLDUe8IVP8x1rSUZSOvIrleAXNQnWCMNOMT7jbX98W3dZ/WjcEY/QcVge?=
 =?us-ascii?Q?MhpIHlIlU1c1/oXFXt/IkRGci9LGvIVx8gr5coG0FdtBCyrKsMgiD5NGBB2O?=
 =?us-ascii?Q?7McQZhj/MxJN2n2f9CNRYB6l1pgyuIuQe/du04C6Y7NKTRUC60hhDz6OmdVp?=
 =?us-ascii?Q?KzeKUTX7tok0J17vkD7DeFRj9PHbnu5EPnrAeWWxxsdOHyoHO3Dg0LcOIBCe?=
 =?us-ascii?Q?VZeWaLV7le/YpSodBvZWDG9S00H38oY4lOaXXzui7hzEnGyt3QKLLCWO1jX2?=
 =?us-ascii?Q?RLBc66yEIbmg2WoEnPQIhkxCmim2X81kvoJfHtqKrw83XJNm5Tm61wFMGneU?=
 =?us-ascii?Q?maTaQATQ4L2UyVArAcPkr/tF4C9u9op0eDsyXsSyvWwqPIFhem1t8cCj+dZw?=
 =?us-ascii?Q?O5w4WG3HDJZx4OVt6m1HiUU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8330d1a7-dd2e-4c33-bbdc-08ddd4a38fe2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 04:41:51.6612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svQ/iM9D+Xke3Z/BDaJvkjS/Ij3kmyyYxHBSHc59YWHF61PZSwdAfYtxiE+fLAu2uDQidD/oAFDKBuqs/UXleipWvpUcUUDEC+ad1UKXJaodc0aSMwYQ0WxuUaVKTCb0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15138

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

This patch unpack component wrapper to cleanup it.

The function will be kept by using macro for a while, but will be
replaced/cleanuped in the future.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 17 -----------------
 include/sound/soc-dapm.h      |  3 +++
 2 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 2caa807c6249..c616f489c237 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -314,23 +314,6 @@ snd_soc_component_get_bias_level(struct snd_soc_component *component)
 		snd_soc_component_get_dapm(component));
 }
 
-/**
- * snd_soc_component_force_bias_level() - Set the COMPONENT DAPM bias level
- * @component: The COMPONENT for which to set the level
- * @level: The level to set to
- *
- * Forces the COMPONENT bias level to a specific state. See
- * snd_soc_dapm_force_bias_level().
- */
-static inline int
-snd_soc_component_force_bias_level(struct snd_soc_component *component,
-				   enum snd_soc_bias_level level)
-{
-	return snd_soc_dapm_force_bias_level(
-		snd_soc_component_get_dapm(component),
-		level);
-}
-
 /**
  * snd_soc_dapm_kcontrol_component() - Returns the component associated to a
  * kcontrol
diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 53bf6590bd4b..5bd9a27b12ba 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -725,6 +725,9 @@ int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_so
 enum snd_soc_bias_level snd_soc_dapm_get_bias_level(struct snd_soc_dapm_context *dapm);
 void snd_soc_dapm_init_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
 
+// REMOVE ME !!
+#define snd_soc_component_force_bias_level(c, l)	snd_soc_dapm_force_bias_level(&(c)->dapm, l)
+
 #define for_each_dapm_widgets(list, i, widget)				\
 	for ((i) = 0;							\
 	     (i) < list->num_widgets && (widget = list->widgets[i]);	\
-- 
2.43.0

