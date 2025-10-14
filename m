Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4736330ACFC
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415982; cv=fail; b=NWTNFoTB55iVtmSjkDou46U28LSat1ltxXhXE6dECvNYnbY9UzkWz0JMXMrbh6JgtVbYpv/4dcV/Jq+XekRPxNJAN8DtwzM1WislFF+/Veo8rlajQddLkg1519nCMdPu1MlHB0vrUDuGHh5I3Pu8ZdtLMqYZTd3wb8ZLD1mX7vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415982; c=relaxed/simple;
	bh=GHPmWcCBe295B1/IWw9jJ5FV6LOQe0ZIw4dyOjFM8c8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Sb+4xKGUFYki75NH7gCe48AI1WTqhSYxjQt4OaGQaBsQTrfnyhJu8wwWrL4nyLY92fDsvOQognAR/d/Beed8CUMRsKEKhB3NRBYPaZ+z2X1Kx5Ff6KX3gfHLQpkcVvIcobkCcWzMEzKGBzJQwp8VMjA3hRFvDQ3sxAivCAmZ5u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=M6dZdih8; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="M6dZdih8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfJfsrCTo/qyiuQ3PjeRIFptEdi1UHD+zTXgkNFrZKJx8caI7KOg1ITjsIGmrvZL+3ZfVNQFNToKnb+9IqZouvdlCwX32GUruT+2Zmjm3ypU6Ozr9HuAa3iabCMNUGF5abH/Dp0rw58E+csM8z7BikbxfBBdGq5ucVAWfklFrVv2JwahM47firhgFwkDFLZgVBKC9fRQBT96vfCXA/qs7s6S0J1FUYRrVfFqxqKqQgyY8IWNgdwctv8XZWAJzsionRzoeV2ePl6/M1VkcT+xJ2M72hl/o/4hRL+OEAl17DtMP9MM1W/x5mTcwG9DuVKMmDEjSltS5ETko6HJjerAoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERrqC/fSuqbzqijJBtvA08d16Sg6xs7EfcUtylxXEWA=;
 b=Te4qsf6BfdXckkJzutbkpDZCMQKR4feApEUVsdO67+sSxmJHg4ihqLtJPd0OikxH5c+5waFURl8HfnfPRS87oFt/v1K4sd1SP/3xWc3ZNgZW/doRzgSTaZuQPXiOfp24JL9goXyYbUG66nE0ptF5SKdcDv4OB5YcX50akXu1s3Md8unAht39k2x1wm1ZjiKte8wCbz7LsR5n8rvzUZ1zlGlFcCMZemGGvnJjb2tmhbV5jNAtpCsSnRbzk1D1eUPM31W2DL/LkdO995YfG0zBncxl/NhSFjmOymdI4j+SyIrwv0M0xCkglGF0CbCTzJwfdigRbU+nH2tMlAxTyCgpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERrqC/fSuqbzqijJBtvA08d16Sg6xs7EfcUtylxXEWA=;
 b=M6dZdih8aq+s/cIFIIdQkx4IX0DnLj2Y8KzOhEtFpXRIwmrnLaEnV6Vu4pvs5IfLpWMOotUDxOZjBNWFzGEdDnHE4GUQIk8NN/D/RMrDy/8yC3QhSCmEmrg2NxzkrZycBDd/gmqMIPCvxjrSOkL9f2ovm9sEkwyqbHIg7mYsjV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:18 +0000
Message-ID: <87ikginm6u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 109/139] ASoC: codecs: wm8904: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:17 +0000
X-ClientProxiedBy: TYCP286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: 07736b90-c3df-47fa-16ec-08de0ad9d1fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nBvota04ZzLxs6R6P6F3Idy05oHDCElO5EwSZNNVbGZlXyCGnTxRcmbuNDUm?=
 =?us-ascii?Q?yryD00QkGPTzw3cGqZB4pGlFPbanu7F5HmI4+ZXItV3eCEUZd5eDJwuF77/p?=
 =?us-ascii?Q?2ZUXMNNyNy2/pJoaHrIKp0QtVyfwBDb/BxnoJvILoRtquJFHLN3FOzBFFada?=
 =?us-ascii?Q?6YGTEbKnOq+fXNOSVXA++Y+MAG3gd3cGIVNNxbQxTaDL7/wK+WIG6+nF0gTv?=
 =?us-ascii?Q?ZXqv57uuoYPhSPPdqu4b9FnlREH5nUwzYIsoCPNqW/RK1kbWE800Of2SjlNS?=
 =?us-ascii?Q?3gwwXqb29Tr8MRl0f5F8rPlacZ6VykWYjgMaZY7wDtFvAgUyfyGbWY+Gf61T?=
 =?us-ascii?Q?p1QRJxPXahc4aKL/bYrS+SER9FmvnojE+afCcknqSj+Ab2F+HMdqNMRUBaIm?=
 =?us-ascii?Q?mxSE8sNs44QX+y14Mhck6dqY8CfpOcR/SNsXs0674Pm56YeItnhPXwBgj3Lt?=
 =?us-ascii?Q?ZEk96G8DL69qAAlO9VOxQrqpSOZRZ1v0DfaqIGslJ8PzghCApA646kLC0KF+?=
 =?us-ascii?Q?WwjxUzDNPilp0MKi8qzWdo+Id7xSxaz67jR6I5tYv/qUyDPi/c5kK35iMxTI?=
 =?us-ascii?Q?3e99AcSE/I7MiOFFVLyYb9pHDWYVrZxsnyCI+Zp5WeBaw4gnhs5ihW0OCxUK?=
 =?us-ascii?Q?xeQW2uixdBK9DIgdm7A7iipkOOWEw2RrqiFPEkqHmyNBPWX3O7wVySQ/vflW?=
 =?us-ascii?Q?SnXnLvWL83EhU6++pyOO8sIWLkf9D4ESKT/DjNSl0f5Durg//vc3uV/LvOwR?=
 =?us-ascii?Q?gSQ8EPMOPr17haQmMONwvB1KkIBN1duiMhPkhbKnyYiGhYEmo0LPmn/9lCE2?=
 =?us-ascii?Q?dsVtJinPaG9f61ys+iHppKR8w0DvcyKDn+FkSp4mWLRgqE2Z/DgNPjchHFoV?=
 =?us-ascii?Q?6yM+3Lj97Dl2/YgRLc1Sxy/KiWucaxbSR3VFURkliIOdUlU46JbXntjvRGKf?=
 =?us-ascii?Q?XTaE+gc7tGTsItoGj1Xx0oT2MGKSjBxrENrq2myNsaDcbiB9NLBUdJrOcpQ+?=
 =?us-ascii?Q?IroPheFZiikqQXjvfSsrN9usOf6/Cw7yR/CK3L4sIt/YkFI5bFzVLtHf9Nr/?=
 =?us-ascii?Q?wd1+YjQAcIfV/mlZ5kC9ny/vAaE/qWu5/w4JlAOFehBsP5inqeA2+gqEwhr5?=
 =?us-ascii?Q?FCmtyTC6MlvVnH3PyR2AjxZPqXJtu6Evxw/No7Dv/rFvmt4lT68p15udPqRR?=
 =?us-ascii?Q?FJgPJ2gKIfs7xGJaDVMdNu6+7/hGldVwgvgIfxRrguZ4VpzmjUZ5SfWvCeG7?=
 =?us-ascii?Q?qzhb7X/o3Gpy9Me75FnjAMgQpY/+pX1NXVga2//tFEf4+w7BJ1essJsWf8bh?=
 =?us-ascii?Q?8RkV89qBSPcQUJi+Pzm5B9Xqcy73OuZvNVOECwkG3uR7BYzDOkpi/4AZ0pcL?=
 =?us-ascii?Q?FrfgPa6uQjnP8rsDvuj32gq+1A71troPU/cLJvJW/9d3cuhCQ3xBj053ogz0?=
 =?us-ascii?Q?aS1+Cwaj7szZWusNEkmKZLgtgo7kJ4TCucy1TpCqyb61HDxe9047D73XRXPi?=
 =?us-ascii?Q?VsKTJnwVZiu/5SFOROyw+LPlLwzsXp+cteYE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sW+QlYm8nVce54/C8NpFzrKp/pVyaXLPLvvJNDvIN5L/ILQcMt41ITTUUqZz?=
 =?us-ascii?Q?kV+6zLkhvfBAMjqFoq47zWxZJ5aBQx3ejQhHszcwi0Q6i2pJKSAODVHbEhzu?=
 =?us-ascii?Q?Hnl6k8oaL9XA8APHlIE8N+H5Ic/UybpzyzUXoAREGH2mB6avPRl/ucHJM9wm?=
 =?us-ascii?Q?gY7r4S76FQ41iBLrvKptlAcYMg4hktZ8VKXzrXNqte0HJlrtxhLn+mOQCwcD?=
 =?us-ascii?Q?2hdGDOO0Lto2De9MpjDcfn9qZweb3U5SEnkRGjmKrWU0mJJSM5A27PKSbNj9?=
 =?us-ascii?Q?Oajuh3tw8PbqTEXEn9eDxgQnK1v8zDHKkO8pGex/wgo/AtfmWX3sNcEliVhu?=
 =?us-ascii?Q?9CgyasQb+e/u+YmZzxAQZTKlVfr4aVHLjYrtReAQkpf5LYz7d9Md25IkRXFz?=
 =?us-ascii?Q?5ROzNfcuR4Y0SgGAO4g4UIljzrZ5QpAYQFcvUaImWr6PapNCZOLq82TkO8Cx?=
 =?us-ascii?Q?gmOXwDH3i/aC9Clu9zDFBCC1xm+ibsCZc1OaJJNHbiVo879w4A+HVenIQssm?=
 =?us-ascii?Q?A8C2hEIsmVInsfO3RXRA6Dk8B1Lwdxxqz4ZcVNm6DZ+IoMfdlfLN3MbeDmxB?=
 =?us-ascii?Q?39Xyu8VCAieI10I8f+sTey9W1W3JLQasubI6b/h1kWc24DNvQcK2EiJbb5CJ?=
 =?us-ascii?Q?uEs0mEEtJB76VrQ/kgaVN0oD0oI/Aiuogg+6GHfM2tpmRrivbSHPmmUYPURY?=
 =?us-ascii?Q?TZmbW7aYZK5DeEdEsZ0tfLDoeOfn7YVpHmvpkAEmNzV5gVVcGAGM12xxvAp8?=
 =?us-ascii?Q?0lmt1W1qjvvAiQU8kTgpGtOChLXkutPBsImJK75WQV4jZeIxzMwEGK548zQn?=
 =?us-ascii?Q?4R39feuCqcmo3tD6Fm4L7DeZ+rebuWVkFZhxO7ma/xITvnr8crAzBB8GVNVh?=
 =?us-ascii?Q?3uUgPqB9pRoW+xmPBGYghhohIxTOyzXmXfMMdRvOz0oe/KmF+zQ6xaWQZZr4?=
 =?us-ascii?Q?JyrfhMV0KMokQalJdSoMeXsYfLWRrH6BWHGGksMioXwLPsvkU/ukGXHaE4Km?=
 =?us-ascii?Q?KR0TKlGR8IV/mcQaYg+SNOsctelPiKc7DihUWiHKp9lDRtCusgFJYaw4yxgR?=
 =?us-ascii?Q?FdtJcMyTSl9WgZ1gzUiU/EDMDzWhD4e0Ww8QJPbOG03s3hzglkZvaB+eODPR?=
 =?us-ascii?Q?2Rlbf90p9pK0Sr1y/OxDYWqP2bIILoiepoyHXXL99pH6Ph44t0h/qyn9wW8p?=
 =?us-ascii?Q?9s7KXaPXILr/sHbCSjm2ry1aHpMSzBKBRi4VnpCeixhgD7mDqQqqIPk8Gel6?=
 =?us-ascii?Q?qzt8Z3+zL00TswsUkqXG0WcyQcLhKnxd6voBjbJ31C8SCtGgRNJdICUY/fxm?=
 =?us-ascii?Q?2F3Y3/z62YXhtU/eMckfoE8OPLXC5Rgkoix03csLkVdKpZSU2P1t0Y0B9BVx?=
 =?us-ascii?Q?yTjHZdmL2bj2eXEKe2B37F+Mf8liVkGolEhtEZXMxnIAirZeuUzRE5ZdLHR+?=
 =?us-ascii?Q?NmBAjHtsgYI/f8TR/1zmuH/0a5xpJ+/kLy3j7eDlQf2z2JvJR7kKQYo5y805?=
 =?us-ascii?Q?H/wk58FcWQLX2hD2xcuCV3tsPE1V0zapHXa0z27Om0DWjtQ/b84LlpWKoj6G?=
 =?us-ascii?Q?hcY2hHRp3khxfKDWMc2VhvA5LRmu5zZvCZROwXTHOQRY/8xEWoGvIkcdbU1B?=
 =?us-ascii?Q?pZ4i2/rv0XgMKEexP7KaPTg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07736b90-c3df-47fa-16ec-08de0ad9d1fb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:18.1624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NAvkahi/tnfwzzuayz5VYgHEJBeN5cBDp12mRIM8SdGrn5DewzecQRXxNjZSg0W+fYtahxfQGZTgM8njWYNZGo3bizO9VdYW22wsiu1Vr+wKskhjudaPYqQ+PjEwq0f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9955

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
 sound/soc/codecs/wm8904.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 1de09ea646cf2..e16b28b722437 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -388,7 +388,7 @@ static void wm8904_set_drc(struct snd_soc_component *component)
 static int wm8904_put_drc_enum(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8904_priv *wm8904 = snd_soc_component_get_drvdata(component);
 	struct wm8904_pdata *pdata = wm8904->pdata;
 	int value = ucontrol->value.enumerated.item[0];
@@ -406,7 +406,7 @@ static int wm8904_put_drc_enum(struct snd_kcontrol *kcontrol,
 static int wm8904_get_drc_enum(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8904_priv *wm8904 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = wm8904->drc_cfg;
@@ -459,7 +459,7 @@ static void wm8904_set_retune_mobile(struct snd_soc_component *component)
 static int wm8904_put_retune_mobile_enum(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8904_priv *wm8904 = snd_soc_component_get_drvdata(component);
 	struct wm8904_pdata *pdata = wm8904->pdata;
 	int value = ucontrol->value.enumerated.item[0];
@@ -477,7 +477,7 @@ static int wm8904_put_retune_mobile_enum(struct snd_kcontrol *kcontrol,
 static int wm8904_get_retune_mobile_enum(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8904_priv *wm8904 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = wm8904->retune_mobile_cfg;
@@ -517,7 +517,7 @@ static int wm8904_set_deemph(struct snd_soc_component *component)
 static int wm8904_get_deemph(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8904_priv *wm8904 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wm8904->deemph;
@@ -527,7 +527,7 @@ static int wm8904_get_deemph(struct snd_kcontrol *kcontrol,
 static int wm8904_put_deemph(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8904_priv *wm8904 = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
 
@@ -555,7 +555,7 @@ static SOC_ENUM_SINGLE_DECL(hpf_mode, WM8904_ADC_DIGITAL_0, 5,
 static int wm8904_adc_osr_put(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int val;
 	int ret;
 
-- 
2.43.0

