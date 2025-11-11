Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999551E9B3D
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821003; cv=fail; b=gaDG0ewqzV76KH8Mr4DFk91p7BMQv6WfUg9MuV5h0URUTKlHrUaK7MZZhMAJ81/V0TOi5Vnaa65f4ra1Gj/dP8zFzacCDoSpAV1zGuSaV9F1+2YJSXntoLxjWF8rpvWLKp0xjp78A6RHiNEdWBIdgd1lpHxePUmLRwBe4/5WFhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821003; c=relaxed/simple;
	bh=MYEwjmF1EUOrP/2GUG5O9ZndFN60aKrwQsn7dZHFUyA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tkMJZFB5+V3kLi/dGizYF3h5HnvXz9/QBK/DDMhqJr8QssHiHztspqNYn3O5iQwJrs4BpcfgCrNECVpIn78MRpH8+lcWp6No7IPArv9K9J6z8Jf+wEaxF8BsCER2lxjvw3Asy798mXRm3iyjTDFySM1IkbYwGsGD+GWby1AUoPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EvfapM+C; arc=fail smtp.client-ip=52.101.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EvfapM+C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJfhznRiRPe+n0p3cF2q0ER83gAm8N6sCQpIhrYzq0cLSrv6qkeZGLdUGc0Uz5DNd1A3u4/3MIxsoWdUbNqbQQkml5yYiGm+7kp/tfIczBY5lB+sTqbZdN4QhfEIX5OEX29lUfX1znwBOAYgYPDJkYjQ4CmwJg8vvcKpY6zJ8bjGsKCVfzREyOJtxT/JcPO2zHHUwdRsP9ibPacROzKSRWkOzK/LWll0jwEJ1JTsPMExKgHyB2bnXUgW083Bg6p2yhqc9lmiUJ1nXj/WhqrNOCGDWqcHrfSaHwd4pMwM0K3gaUp24ewzXK2AJ0qZTpAsknn89k+SqPrg/ZcYK4QPGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1k0ygG7JSn5MopFdMFOYRQ6Ksf2TM5ngaSlcRrZriLU=;
 b=r/23YQS7oe8lMEv4VwlFGxx3KA9H6Qna2zWbu+7gE8TqoFowsni2YwbxrWFyjowIb1WelqyIne9N1JKow/rHoOCpdmz40F8D1THGmT1n6T2ypXe+//w7gVGi/g37RY9JZRA+0diobsxL5FHlEgQUgENW+lT/q+WaYP2BNxE5akX8j98hD6Dj06vVpDTVplugxSZn06R67eOgL0BI7idgAXJNwIfWy5r/dBuTPsumNBAKqAIAihG2ElqpIg59W4nL84+TykPfzjWMRxfXEqtXInXQvcJthgfQ0GLyTkyimdHQnt5KuhtTyLoIH0gT0l/qu/IBzGdya+sKsXBIQ3HHEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1k0ygG7JSn5MopFdMFOYRQ6Ksf2TM5ngaSlcRrZriLU=;
 b=EvfapM+CN+mRYGAo5pmq8gmNGmzrZYOG1+ngb0Z6NhYnFXfDWD/TFaViQWVb4YE3yM5W+Y1+3BjSIblmmhLgFs3iMrafGimsh1/O2OAUH96XltfN5ko9h+aHUelx6A2ShXQH6MxFhoeRSqUdWC2DcHK3U4ovfovsdWWIgskZLZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:29:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:59 +0000
Message-ID: <87y0odxvg8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 184/292] ASoC: codecs: wm8994: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:59 +0000
X-ClientProxiedBy: TYCP286CA0119.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0f19f2-5a67-4c62-4db5-08de20b97297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V9Tx6d5wtIN/paR+N72OPs6pVJhOXWZIe+NNB0T0aHKwyOAKipJ+2DRcFvwP?=
 =?us-ascii?Q?3npVoJYMVEO2Q34gBz/Qp5QO6xyDWmz6XUg09PW14dmYAQgwlmLGv54l9Y4L?=
 =?us-ascii?Q?BflFdc0bTskopCcjNP593JlOdmMySP0Bi6kq0Xnjec0cPFvhi5Yx0G64uaXV?=
 =?us-ascii?Q?Bet9EzaxldJxJS15WKb5XY0eIvrNjrgku8yDCj2mZLgHOv+p/Do9sZrRBZKz?=
 =?us-ascii?Q?jw2gR3F9pEuc3w82aOyfADToq6Ie4vfGBqS+VQhleW6w22kEcyy575AhdCug?=
 =?us-ascii?Q?dezmrOxu4tVEBBNwI3OOb3xNvJR8EfyaUpXPJPwvPciYwbZVRrk1DDr/g2VI?=
 =?us-ascii?Q?dYj2+Im6KsVVQ2d3dJbAGm2czH6mbvwxvHGTUa/HYr4TsnUVKRoM2Z1T2RIf?=
 =?us-ascii?Q?4U8usCfYlb2bc9gzsaEdLw3qR0bwppzkZP/jfuFsTreOiZw/ihO262xb2rFQ?=
 =?us-ascii?Q?3j9Vcd87YZ7ikm6SdXHoxpZy+08riKJHWErVmz1SvfvEDrtCjK9zt6NfgMxT?=
 =?us-ascii?Q?xfDR8QFRPv8kEILsjx9lZkWhBOVmOgs8Z3vhA0LKNGJJ+2jxBEvIBoDNdlS5?=
 =?us-ascii?Q?1/GF4ejv3JvEZU0cITGvwoNESyEbWmDavyvzlJh2F3Xqt14ovMUmlcbYrU8g?=
 =?us-ascii?Q?WHh8yIXU5zaIE8ZGgu7V/9dc8rFghYnj/r7rMppin34Q2jhieuu/6r1Ly3qi?=
 =?us-ascii?Q?M0G57e2QgUjIiyOGZsfWkN8/B5EBqA5DJPfUGFs1ihQf8neoBJAlg8xfRzsX?=
 =?us-ascii?Q?UIzXX08bdml6kpVKPEY0xwtvTRWISB5YddUSnEkoec35F++lAErCtsxk6/wm?=
 =?us-ascii?Q?sIBZlCeBNsjqaieg/E9nV1VJBMjljhSaJWbHwfTydF9yjD6fhVUhMuwT8MyB?=
 =?us-ascii?Q?5nnA9s2pRBCS9ueEpBbIb+7cJdxaoqcyNGr7k3BbOjGETamuB3WXK/X83AAZ?=
 =?us-ascii?Q?ctowEJDdMty6ew9h1AyAmHlfAnhhMXqu56SpyDVsPZr+SY/rFflG9sU8TQeD?=
 =?us-ascii?Q?EOud+00eB9dl/RTeTTWz9Q4r4pPtNumg4vz+UFn5bXTOKlQj2KFbfc7Dyh6L?=
 =?us-ascii?Q?Fy/qo92Fp3CTaPEInJIdLVfnhVJuftQVw02XxWb7W3EDvFgctWCvqazqy032?=
 =?us-ascii?Q?S3qasHkyi+wRC6Ah1LC94WDGqw7Gr7IkMs+0fuP1U+DCCuVG3jPg9RJ0K8gS?=
 =?us-ascii?Q?loavlL4UvRzr1UVqXPOmb7KpiqovC+Nc+coiAFLf/zFKUFxK84I+w1qYeCQO?=
 =?us-ascii?Q?JZsZfdr4pkRWDMMKGUAOyRCuwCXQvVlbra7nqLQ5IVvA7DZFcIdNcD1Z/Qlg?=
 =?us-ascii?Q?HQdE64GWAqLYttnoI4HW3Adi0/Y4oLuWHhlgVZG5CaHIw3XpWqYAbT7qOrm4?=
 =?us-ascii?Q?llrQHBxMq26i0K5jGnNP0QvZOfqQU4p198APa2xG3+gszFYXRnJLe2y2WAy9?=
 =?us-ascii?Q?Q1+mq82ZyzYLYIIeKP1vU5q5xT2NrbdlOSTJLuncNtsA7OgJnTFwgvkqkzkJ?=
 =?us-ascii?Q?6pUxqS8B2CZG3ZZ8KQES8nM/KB3QdTS1JcQd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JVV9XPFLj5YMradvjIQHiWuUNZj9rHvOVcjHdzwKDnsBciwsLcOEv+h1j3ia?=
 =?us-ascii?Q?VwG4fHw1oyEEnvXrFW3oug24efQPJbXb3S8zY2TLYIvYxyLhQ1dlfpgXFSaz?=
 =?us-ascii?Q?4uVKQdU9lJzLzLThFb7oDV9VbF63mo9/klw5dSQd9a3f5l8HQ1s5WTQNgnVh?=
 =?us-ascii?Q?qqj2oTGlQ5YY+NGP7a5olYi/staHPic1doGflNzRg6IzbQz2bGtlK5yUtSZW?=
 =?us-ascii?Q?4Vd5laS8ysiaGxdVNQex8uAcmShVu3VhdetVXceqOZ6zhGv1AP3sW4y7xEfM?=
 =?us-ascii?Q?boFnlNGXeZrquaLTXqxkRMqJJv+iEaiEmmT28fTDcY/3OxcjoD/04FnOPeXq?=
 =?us-ascii?Q?tWzM2TGoMKc+mGrspK1C2r3vDvy3hzS7z/Ou63eiWwTr6/F4JZmWYxcK6Rom?=
 =?us-ascii?Q?wNWCXsy0KJCjoIawhR2/qOuguuRU8+DS15/KPtEFTi68KHghajCifEAtSOzj?=
 =?us-ascii?Q?WVoarGRpVUljj4S2qsyVjJRXY+xuErNf4DcvW7UWt/KmW+ETs+uLlO3BHp4q?=
 =?us-ascii?Q?e12WnJV810XFeSlQsRl1WX5dIGXvPYxKJ0+FqE3yxC7wjarKe5agmbEydXzx?=
 =?us-ascii?Q?rOn4nQgnXC55J9JUrqBcUS8GATVr2C0hy9kqpspoMzRko/FKttumXZ7KZJjF?=
 =?us-ascii?Q?XB09ZAGz6SJdKaOMjnFQDlYTCzi71eMIt2ml3RTE01/eKllq/VO1wHk15zc7?=
 =?us-ascii?Q?rck6CGQSHiTXwkX82+b6o2xyBCfFXhNDcJu8CYQvyBp1cCQRh3/ORV3laFVq?=
 =?us-ascii?Q?TmPj7lECQaRVaHfrRNgLdMnpvLUgH08yDG9P+y8QUYfunxSbFuv+2ppM6vTb?=
 =?us-ascii?Q?WIiHNrd5DqqjpzF078kdTgcVB1s0Us865ii6aCUVa7KX3j9baIRgFRH3wbwI?=
 =?us-ascii?Q?8odJ8Ke78cwA7O90bThKiH+bf9n2SXvFufP9Oiy925AHg9k5MWzUkBhx5z+o?=
 =?us-ascii?Q?EyVduIYnqPdoAT8OKX2Zyfp3fG66W0ZRCo+AOxVfTejpKNWhnbHX4xjxmnc4?=
 =?us-ascii?Q?rxNAWW3aIM1YwqozG8tLte+k7HXIslgKGClqFkZ6f7ZBC6AL5Kg6bJug/yF3?=
 =?us-ascii?Q?klbpzlfOyq/79CTA7UGIlz5yA9AncscRunxWUATtvEIBTqLmWMOMHkNKM38p?=
 =?us-ascii?Q?gbzEHXhEj6AHLvD+F9FrJmh05lNac247Pv4pRDR0nXehEUAWGNJWwYeD2YWa?=
 =?us-ascii?Q?uT6s6QObr6aWguA6ryD+r3APWVf55RFGTpvpcMjlbXGNE6EhlLsKzxq8bpQi?=
 =?us-ascii?Q?g6wpfi/Wv5WxRZ8ZRjzgHbhXpkiXPQ42qIuluJTZ/xnOUm5eC86oXlV2nEb1?=
 =?us-ascii?Q?lFc2AsB5+BoPbI+gkafTDKr6hpvK/uPgfjxRqEKicv9103tOeil1C3de22RT?=
 =?us-ascii?Q?vDIXeQzvMYh3yO6xE6OGzBMz7cKEyNkt9Iq66DDmUXtqxtoL4+t8zZw7m9B5?=
 =?us-ascii?Q?mc8k8DskmbzXXR0Rxo5DMOMsipFEF98/y+VnreluC7ExCkv0Pp8/nyUxhA9y?=
 =?us-ascii?Q?z31FeZVyJSTa7HgPrOnCt5uXnTcIfP51B1KQtow+MM2LHtpPsX2i5jlp5TEx?=
 =?us-ascii?Q?OzYriSpn905gz5EmCrQUD7tUNoL7IeBP8Scd0Jjbjixj1+pYqualCxMNJlaE?=
 =?us-ascii?Q?cPBgXFnTMLGTMq99WGMP9PE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0f19f2-5a67-4c62-4db5-08de20b97297
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:59.7701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpIAFVjjyZe+GQODboAJKLdFkXbrprnYkYRl8EH746x15apiCe4YEd4txX/XVSyCgcPSEX1P4Fv/bVaApBaIOKdpQWZiXY6o0VRUStz7yXOvjlUafQ923ppFVQCQtPKM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8994.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 616d7d7e50aa7..1d64c7c42ed12 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -214,7 +214,7 @@ static int configure_aif_clock(struct snd_soc_component *component, int aif)
 
 static int configure_clock(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	int change, new;
 
@@ -1515,7 +1515,7 @@ SOC_DAPM_SINGLE("AIF1.1 Switch", WM8994_DAC2_RIGHT_MIXER_ROUTING,
 static int wm8994_put_class_w(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	int ret;
 
 	ret = snd_soc_dapm_put_volsw(kcontrol, ucontrol);
@@ -2615,6 +2615,7 @@ static int wm8994_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8994 *control = wm8994->wm8994;
 
 	wm_hubs_set_bias_level(component, level);
@@ -2637,12 +2638,12 @@ static int wm8994_set_bias_level(struct snd_soc_component *component,
 			break;
 		}
 
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_STANDBY)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY)
 			active_reference(component);
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			switch (control->type) {
 			case WM8958:
 				if (control->revision == 0) {
@@ -2666,7 +2667,7 @@ static int wm8994_set_bias_level(struct snd_soc_component *component,
 					    WM8994_LINEOUT2_DISCH);
 		}
 
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_PREPARE)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_PREPARE)
 			active_dereference(component);
 
 		/* MICBIAS into bypass mode on newer devices */
@@ -2686,7 +2687,7 @@ static int wm8994_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_OFF:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_STANDBY)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY)
 			wm8994->cur_fw = NULL;
 		break;
 	}
@@ -2697,7 +2698,7 @@ static int wm8994_set_bias_level(struct snd_soc_component *component,
 int wm8994_vmid_mode(struct snd_soc_component *component, enum wm8994_vmid_mode mode)
 {
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (mode) {
 	case WM8994_VMID_NORMAL:
@@ -3299,6 +3300,7 @@ static struct snd_soc_dai_driver wm8994_dai[] = {
 static int wm8994_component_suspend(struct snd_soc_component *component)
 {
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int i, ret;
 
 	for (i = 0; i < ARRAY_SIZE(wm8994->fll); i++) {
@@ -3310,7 +3312,7 @@ static int wm8994_component_suspend(struct snd_soc_component *component)
 				 i + 1, ret);
 	}
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
 
 	return 0;
 }
@@ -3503,7 +3505,7 @@ static void wm8994_handle_pdata(struct wm8994_priv *wm8994)
 int wm8994_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack,
 		      int micbias)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	struct wm8994_micdet *micdet;
 	struct wm8994 *control = wm8994->wm8994;
@@ -3653,7 +3655,7 @@ static irqreturn_t wm8994_mic_irq(int irq, void *data)
 /* Should be called with accdet_lock held */
 static void wm1811_micd_stop(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (!wm8994->jackdet)
@@ -3773,7 +3775,7 @@ static void wm1811_mic_work(struct work_struct *work)
 						  mic_work.work);
 	struct wm8994 *control = wm8994->wm8994;
 	struct snd_soc_component *component = wm8994->hubs.component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	pm_runtime_get_sync(component->dev);
 
@@ -3812,7 +3814,7 @@ static irqreturn_t wm1811_jackdet_irq(int irq, void *data)
 	struct wm8994_priv *wm8994 = data;
 	struct wm8994 *control = wm8994->wm8994;
 	struct snd_soc_component *component = wm8994->hubs.component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int reg, delay;
 	bool present;
 
@@ -3928,7 +3930,7 @@ int wm8958_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 		      wm1811_micdet_cb det_cb, void *det_cb_data,
 		      wm1811_mic_id_cb id_cb, void *id_cb_data)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	struct wm8994 *control = wm8994->wm8994;
 	u16 micd_lvl_sel;
@@ -3980,7 +3982,7 @@ int wm8958_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *
 		snd_soc_component_update_bits(component, WM8958_MIC_DETECT_2,
 				    WM8958_MICD_LVL_SEL_MASK, micd_lvl_sel);
 
-		WARN_ON(snd_soc_component_get_bias_level(component) > SND_SOC_BIAS_STANDBY);
+		WARN_ON(snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY);
 
 		/*
 		 * If we can use jack detection start off with that,
@@ -4148,7 +4150,7 @@ static irqreturn_t wm8994_temp_shut(int irq, void *data)
 
 static int wm8994_component_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8994 *control = dev_get_drvdata(component->dev->parent);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	unsigned int reg;
@@ -4183,7 +4185,7 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 	wm8994->micdet_irq = control->pdata.micdet_irq;
 
 	/* By default use idle_bias false, will override for WM8994 */
-	dapm->idle_bias = false;
+	snd_soc_dapm_set_idle_bias(dapm, false);
 
 	/* Set revision-specific configuration */
 	switch (control->type) {
@@ -4191,7 +4193,7 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 		/* Single ended line outputs should have VMID on. */
 		if (!control->pdata.lineout1_diff ||
 		    !control->pdata.lineout2_diff)
-			dapm->idle_bias = true;
+			snd_soc_dapm_set_idle_bias(dapm, true);
 
 		switch (control->revision) {
 		case 2:
-- 
2.43.0

