Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074351885A5
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820606; cv=fail; b=A/w2TFuY4ewJfwID0618iqGX2Wi9/BeCoU0TSwIUkCtSIYc+1mXxVpI/rKPUXRZ6dKHu0ejH2LTJ+wt8Nlq8o2z6DGSfMWbaqFUCockIjdhG3n+mRHwfCTA9qCk3Eq0z9HHszQqMYa9M6wePPF/cFsiQ7DigH+bYYh1L0JP/WBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820606; c=relaxed/simple;
	bh=e8iP6KIyDDki1gUMbK7i8PvYM2Vy9CA5/M4sFA9k2+c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=S7knBe9XM0G8Gm1e+Dfbz/eiu5/sP3Xjfyo9uxZt5N158iZ6n5n0RE8YJoP5ayJOIGnf3oJ0AYfQQ622y93dhtx+aUARWC/LoM1nUeXF3GcwWFEu5/UE52nfa5oeizOeYAUwMix+oiWjmMrAPECATfz8zdLHACvdBW+RSB6O4n4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SquhcsJw; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SquhcsJw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOwg+CW2xb4/e4X/vYHE2sUN96mIkcLszaqhRbWVfKOc98XZIuyVATnP5Xw4BYS/KNKVhEMlHzcLSOoS2f1Z8t1DXR4NuPAVvk6rmL5D8+yN7Q23mfOC5936bS+lnsLJNtVKLW5TDZrKQsXRkqXUFGC04RNK1rPzyTruwGfS4abbIRwxTJaYReSB0YvWFxzluQDE+4LIXNwKP1uWAdtBVPwsHAEBXSREz9F/BhmTwfnS6O1StOqE1C9LYXe8ETMOEVRboWLJjHHIXS16HDQRa8RIxqfciZASkz6fIYOGzBQKfXmRE4OMgvwVY/5ZvKqVAldLUrfYGTI9qXk8b3fsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zY8E9ifVk7Dr1fOzMkvYHumtqT60QRR3B1b3xFm1KUA=;
 b=HMrSlyTtVSwktDFMX66B4uyw1YOiWH0XKzMnaEavTDoOLbJhvOTPZvsL3drPEhQWd4ZEr24CWsB8WfrpUOYCQjr3k54JXYgHhAjzJBbKBY1of9pi3c7XkTgW3KoDh9XuTnbnSrgoM3hJQ7e7C0+137XQViheg0i/XutQ2TfWq0vOodBgv7xQrDuu9iwJiFRhEMnq/EYEYJIpwSXwQ03ONLGDyTPtKaY6ZvLZLhrrZwFcTcyCGQ8b+64x1+fP96H8bWfDPOd+w04U/+NhXvZD4/LQOAaw4heVwfE838om7sncQlbF4Xe5Z5k4Z5qwxb9LQWzkXgB6my1MoQjYaoLXzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zY8E9ifVk7Dr1fOzMkvYHumtqT60QRR3B1b3xFm1KUA=;
 b=SquhcsJwnx0vPlSsCXuAwg0Xa1e/+v43uEWfMMKrpp4E5n24wtZV4xNC9mjXZVlTYGtmYyXSbC4RSeGyWfExjfnclUEZ4dNTUYNsXVRKUnibw4ngSrn/0HwG7Vvpnv+SqHFgXEPRhUr/kZPGnbM2F8dvmttwFz4swNThLMFBr3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:18 +0000
Message-ID: <874ir15seh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 080/292] ASoC: codecs: max98090: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:18 +0000
X-ClientProxiedBy: TY4P301CA0081.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: d31a5085-2e01-47bb-cedc-08de20b8839e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ylEkGYuiYS1c42YvVB/l8OQBWiW62XXLJoa5K5Q/0jfyIPhQT4dFpDrjEuc2?=
 =?us-ascii?Q?8DoH+8Frbulq3+bOPsYZoRAXFyMqcA1w3bd1yB0flXe/p158lax+jzzl1HtX?=
 =?us-ascii?Q?tCmnA/gLKzZJ9aK5bUGOxSeTe4nGR0pPauTBP83PvmVycbbYStKZtRqg6Go1?=
 =?us-ascii?Q?LKuxPCV4gDfRRUiVYcGEcOkzy4cfjfqYtVQ234ozTQFn6TTVTejNmoH4837q?=
 =?us-ascii?Q?T97GKBPjGoooUB2BwjhxjXEdaeXNdXnWxuhEcTG5mNNJHdtExOX2vl+2zv07?=
 =?us-ascii?Q?mEGYJ60c/ek5jr4dbkb7WTSL2HkP/UH9R7tQeY/keT/UTKRt3OnBuJIXSe2O?=
 =?us-ascii?Q?uFXwvpLq6iPeNX2RB/Ls2mWuQ7aCSSba81z3CReA2Ft4Pkn0ye3erojT9alV?=
 =?us-ascii?Q?pRQRFNrzhBAmxii2p64ADX/7EWH9JJnjEcN0RGdIVUauReAJ4n5o3XBXCVCD?=
 =?us-ascii?Q?njUUGohII+9t4jLLVawVWRCxemk0HhEv12kU6iN9itGmDMV/m3nuXNsXsOuI?=
 =?us-ascii?Q?PJPC2Ntm3bjdfCCi7rqzzOccNuAs4fgs8QPFIek6uvj1iFBUPuqLhoMxW7Mv?=
 =?us-ascii?Q?wHPRD5UcqG6gjETSar8/glbpVA9VD4bSy8kqdy9TLUyzC7TfGZO7SUKkgxZz?=
 =?us-ascii?Q?+jlraPai3MUighiWrsTzEBCJ4Xsdrv5tbKdWfQPHOjquzjympzrbx6t9pa8G?=
 =?us-ascii?Q?DdhQ6zODD729es5+zjkiWiwnJGTDvBMpvkcGvkJ+0tfF087LBXMH8Ld/ODdd?=
 =?us-ascii?Q?Xih/6QdbO8hFhYf0jJD+8Z+GFNqmH6MKs0iC40qoKPsjTR5o4E0zlXW1SgyE?=
 =?us-ascii?Q?Jz5adhRgL/YdBjLON36tggDLdbRqW+Jdxmx2DOD7it4KvuQB6N5zI8sGeUWb?=
 =?us-ascii?Q?p6ylyYJxKPNXvFtkgScYTB7MItg/IKhO8q2VUTQitpKsKpA1Lcq9AxTHghAq?=
 =?us-ascii?Q?2IFMbwYoyF8BIH55A0UFoKVHufiqnuwi45jIu4JVYL62pAqTYoLymQa7eZNV?=
 =?us-ascii?Q?wuNLK6tc7WFu7LYeIHJi8Jv83pzC6BbHuYjbKWz2iQd7+FGomh7YGBW1TSho?=
 =?us-ascii?Q?x+++bArEZCP+lJdRIHGTseF8Plzxfbpxf7qN66y4d6qFcR3NfMi+EWwVhCcN?=
 =?us-ascii?Q?x4XSPtMMlv8hSJNkMWabRV8KUYaKRtvDlVGluARL9INz97Y37Af5bvIIVMSi?=
 =?us-ascii?Q?5HcmxyxKHGXFJ7eqBs1jep6KIvba2v+M3MAVWuED09+sWhHun/uWa81L/x2K?=
 =?us-ascii?Q?uPPuPoxBA6uHrl/X1x4fdJCvfX/wcDk3Bra4tPB9EOtylLQTx1exhw+w0JRn?=
 =?us-ascii?Q?tv4TQuroo7w/DEMQGMHrnEddIXxnSNdGMxWQvUC1bZPBWERaBg9YqT8/F34U?=
 =?us-ascii?Q?RT9C4omfhVHtMPbsCyTmHLUEjtB5gqrnWcSpPNDrTBIXUQBvWQByk7eVay4V?=
 =?us-ascii?Q?3AkAthu0BOa177Dj1KQK2CtrQ6ycFYwOI/YuzRdFvroGrD2QSb9K8SLuD59+?=
 =?us-ascii?Q?j1+MIYbDhDuUS7IkLg/F7x5OJvwrXo+kXgrL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1WtGiN8h8aXBj8rbFy5QEjMYMTK+E64kuuvN1/rHz1cPaBjCoesxXkC/PMCA?=
 =?us-ascii?Q?uPdiYl9kfUu5PoJEWXbRMaWZ8trl4YlCYgQUIf3UEhvSq5tx1lYCVUs2D87U?=
 =?us-ascii?Q?wLdYBCdob+lSb6UaVF/HmvCKWD93m4DM0rjDQ0gOGYzmBrPfULP6W4lEFBkR?=
 =?us-ascii?Q?MR2NVZSfm7KpqIPWKqtwtnUpft5FCDLhrMssPhXlqCVHeIdnBZb7XfKkke1W?=
 =?us-ascii?Q?rGfhl5EUjc8rPjWtewV9O/fRcGjZGbnt9ERUW0NCrkNGfEcp6DMhcW49ITP0?=
 =?us-ascii?Q?R7NjQGZ3CsOfBKQTe3P/Eo2al168BLAMoMt0lASRG0SHdqsPIbCcjUpM3+1k?=
 =?us-ascii?Q?+xL+lyDKnLH42w77CVA6+flBCCab3Pgj9bFiw8//VMMrwSTxpJDwA5ZDTrsy?=
 =?us-ascii?Q?+cMa2vUTtXxhwkgBxJ981H+35tNRqyeqfVPQduhKY8iAGLunt2LVz4BTU4RX?=
 =?us-ascii?Q?pGTIpC/Q5niruRvzFqibJujhhl7Z+jvGCbO3Vsph2n3sbRf46ZDIRkurW1bN?=
 =?us-ascii?Q?kUg9DKa1z61YBoUCzZt7cJLiSKrNzCiGPod10XTSu+WgEfKvnP128KyrHd5K?=
 =?us-ascii?Q?swjrjMsx5IEIBuUXIcV7HghIHCypRkEEqr+vqgBi6IrjKkIT3uV35X06ZHYJ?=
 =?us-ascii?Q?nagW2Blzu8xaXAHQJADMAqWNx3U1U2kcukwZcXEXKBpuhjDR1IRgcum5cBF6?=
 =?us-ascii?Q?+qLFS1JTATW3PEcYSJek/sLjUN80gsW2hjRzmxbDbExiEegkL2ReTQ5IYqOx?=
 =?us-ascii?Q?/ZrlmGchnLizcylwFuyHfrmUrMi0QPNU8wgHmBHkNWMOst6izEEN1z9nPF5/?=
 =?us-ascii?Q?DoH/n+qlTOPgHFERxIno6wMrrgvrFstZcNYMk4dgVLFhwhGApNH5vS2VNkc4?=
 =?us-ascii?Q?eKuZ9XR1BWiq4j8cH2Av6yWIEpyee4P4p6P6zaOAEgxPdG+WVNrHAXwCiMgR?=
 =?us-ascii?Q?RTJFpaUKoRuNqKlBuqvxK7g+kAMtZNLqZzeRVFjaSnBUU1tA4XF6YSTQ8PhM?=
 =?us-ascii?Q?UODeLU0DNFG2H3JA7kvT2kUdvKc7dey3/J9IasKKWy7+e2KipnGcDgDDMaet?=
 =?us-ascii?Q?oZsYKuQe2Ps6YS+aG1o2Pz3w6RekyfSmz4rR469BYKu+9oyxiEGom5RS+7nj?=
 =?us-ascii?Q?hhNqG8WNsdd1A79UK03VRArgViwkl5YpzmWqUMdprv27OtK7hOE6d8stNjDW?=
 =?us-ascii?Q?UNcXuB8ljyiKpq+SwP6CUwLyzfjU3B+KtZeLMDbSmNFKy+d+fTlxNOSUHmew?=
 =?us-ascii?Q?MgCGPbd8EZNKoR5G1pyvVfGLyn0lTfJLSjKSQCZ/KK4s9TYj6MlQmblAMNvT?=
 =?us-ascii?Q?OjKaqUBd6Q0MUa3ozF6oB2Hph6afr/FtD/e/B6pcZpgkkXy46d3uxrHk0sZi?=
 =?us-ascii?Q?7a3HDaD9VXAm9FFs2TX+Z353rPgVE7Ox99k40zfzp1CQc1jmgtHZpjnJ7B6p?=
 =?us-ascii?Q?l57cEFmKxA8B4u2/M462wY8vFgf8Sp8lRPqF32ryQG/Szpn9ef47UoVIM4Uf?=
 =?us-ascii?Q?qtTCUufAyGg+e8e04r6iZHfLXR12VeXh/xSYTmrosy7RIWH/iKeBagpSgh7M?=
 =?us-ascii?Q?epCjYyboaw+7W9Tci3cRQ4GUn9UC30+/K3tRgAjoOhPPHeESuLzn/6x3S1ii?=
 =?us-ascii?Q?RccDwJp1CAxlbRI3lfANIP8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d31a5085-2e01-47bb-cedc-08de20b8839e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:18.9022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7j+kgd1yOTIWh0lJEZzqkJKcTLE+fGGiEI5JvxS+jEWjbhasgp1bihuZdOcNQTq5S9au3sodpGc0wc+NbLX3AgSp+kSawy4rABsh2+YgE91jIwd+TfBVblhnEaRpiUb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16404

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
 sound/soc/codecs/max98090.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index b63186feca05e..13a15459040fc 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1469,7 +1469,7 @@ static const struct snd_soc_dapm_route max98091_dapm_routes[] = {
 static int max98090_add_widgets(struct snd_soc_component *component)
 {
 	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_add_component_controls(component, max98090_snd_controls,
 		ARRAY_SIZE(max98090_snd_controls));
@@ -1751,6 +1751,7 @@ static int max98090_set_bias_level(struct snd_soc_component *component,
 				   enum snd_soc_bias_level level)
 {
 	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -1768,7 +1769,7 @@ static int max98090_set_bias_level(struct snd_soc_component *component,
 		if (IS_ERR(max98090->mclk))
 			break;
 
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_ON) {
 			clk_disable_unprepare(max98090->mclk);
 		} else {
 			ret = clk_prepare_enable(max98090->mclk);
@@ -1778,7 +1779,7 @@ static int max98090_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regcache_sync(max98090->regmap);
 			if (ret != 0) {
 				dev_err(component->dev,
-- 
2.43.0

