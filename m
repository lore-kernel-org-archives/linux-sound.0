Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A45307AF2
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415782; cv=fail; b=ns7OdG3FltoYRP0/ZWgw/onJjN/ErKGPJYDkkQ8AiZV3RGmFNFv+2jJJK4h3wBiAwPbJ8TpY1VodSHxrknGyHxY+F9gJggoEuH1LMqa3p8SC/Hztf8d7dT8+iaFjlGRfgvSqCLzM/wcJ2xW+4QXa21PoC8Ysmx3BW8G1uHcK5xQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415782; c=relaxed/simple;
	bh=8q6mXmsVfqRbbkyWyoBIpFOi0gZlzGSfVKdgM2vBi58=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=D8Qwwxo0rjrHPpt4pRHibXZu34iTTSUhqtvIRhsPKmZIQHXwwUxr13wtZvZQV/Ej0RGc90198lQ6waO4RrBma7Vnmy61JszHFhY0TG0a4WhSy15K/hr0+ySPWAGvU4WPxIWepjED8RfeIjeWE6/+9Cs/KD2XeW+dCzc4Z8Hr3r8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UK5lQDVj; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UK5lQDVj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDkOmBQ9bWd+6Ms2Lwxo6g/yTfkw1hFeokwye6iVPkxOqU5oV1iQT7FN1P0HkgVtzxjE4N+gdXPID/0i9Y5MbXSdyOEndTryosvIltEZqfvlXiVnuMeKUd/BZznSUJbmZy4z/RYTl6nmpAKLFkC+8DYOnYuBCoAPO9mmjhXThwNSJOq8QB5tt+QkkuI1AZU5tdQSbJqqENr11tA3ktVm6XxV70PnXtp5g3i5tFWU+PnaSlRL/pMKI2ewFzuqFH+4peS0gZD+BbRAnxrUWc6N2HPg5qtwP5RwWsHvuPozlqxCHNBWnT3JmVC/d2No9jwwwCoMW9Sdc2U+t+hG2yhJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAMqHqCp4ZoXyDIrAL2CDf7wMZUk60sKqK/sNyaHgNI=;
 b=GHlPCv+0c+/KdLK3+HEbragAYigXEy6KaRQYkdrMFY3Q64ioeML60aqqc6iNuRsWTVJaBvb4j00uJbnqVDaopRkj3bpnWS7hgP0TSQ4GMaktl/gyazrEuF2JzbN8b8CvcLOcB/bCGJs1yGXqCTm3CNiC87xyMPlPdRB/x2DLsjoHAgjpzWKsXvaWMciWADGGep910RCKwLQZBQA0BsQAWFYVMRV1acIh/AwX3hTR2+z+mtw9mDkbkr153U3lrbgnb/Rjc55X2Nxf5mPoiM9pxKk+F/CZZ0CgfLuDxwcThDCGnu9A5u6t85RrQpsvnyqiIYoyXKNi9uT4t2E4AqOhSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAMqHqCp4ZoXyDIrAL2CDf7wMZUk60sKqK/sNyaHgNI=;
 b=UK5lQDVjE2HdD4xXNkicSyYiuCmKEWFhil+qrVjtqe9QerW8ts0TMAJj5S9n50h9duXsL4uwcXqIn3uiKPzwFHG/dWmQaTlSSQDGpKFm6i1GuZBykW3uJZuC1dnzt9MxxyiJhg5tJp+OQi6xxXRKDBZ2NzJoIEfK7xf84M3oA+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:58 +0000
Message-ID: <87o6qaqfh9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 055/139] ASoC: codecs: mt6359: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:58 +0000
X-ClientProxiedBy: TYCP286CA0095.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ada40d-7b6e-4953-5d34-08de0ad95b34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LdgVqYTmk96ab62kS1t6L9Px4y/ZPzhp/Ls4e3m7aZ2JOoIapKob1UDCJ4P8?=
 =?us-ascii?Q?ZcBmsfE/GiEKpr9DkWxMKn+/NBi0DoSkRTPqPTP5mIizS0a9i1ceaZ7O9tkD?=
 =?us-ascii?Q?Us53/s1FwtAESVbh2A0XybtCqC22JSwoDltfQJuJfv+a22253L8UDB0pnQ7e?=
 =?us-ascii?Q?fMDNoe4YCJrm09ytJuerjDdh7ShjQWANaVz9DevatuRE1xEvVerKJ5IF2zid?=
 =?us-ascii?Q?zluggD6ownFX+dEn4D7WhYhIL6F10LjUdoR2UWFUhzEHghIJiBSdOMJYm2rn?=
 =?us-ascii?Q?0BhjmzrpwNPNPY5G2Ut64E8yPH6XFT5Zo2xuToeqjJbbOipQxMtJGfn3f6Is?=
 =?us-ascii?Q?4JseJF4EMOQ08KqCIQuN16ZPDir2eHe/rt5bdDGYhDz9Stw+OlwXvZF1RiH9?=
 =?us-ascii?Q?19ZzDsQyT04JT8ot+R7dlhcnZaRhCIrtMUgBA5EzE8BOs/L4gq52Md3eEvhy?=
 =?us-ascii?Q?9qhkmpShko0IBHG1IhWYYvwzOTw7Ejt5f6lPCTIk0BuHsaTh6S9XqrWT/SPj?=
 =?us-ascii?Q?0GU8kI4AVaFHxYIenEh2yyVA7i+xhoAXqUw7A9n5XzpxKJ/ydGbRYDWqHf9R?=
 =?us-ascii?Q?oW38cyQHKqn+rp8wA4D3jQfwTW2XGFgZ7knZhJ7+bCrEdxc1Z5f+t0A+xHLL?=
 =?us-ascii?Q?5rTk/4wA9qYBs4VpPurVbLcsZAEHsLI4I5k/lIipzuPpyFXVb69hTUox6o2l?=
 =?us-ascii?Q?xJz6Xos8MyLstiFC7HYbh3lOHZKp0GTN19eOKhKbdbyZawmVYV/IO4tbd5In?=
 =?us-ascii?Q?YTaoM9mV2RTRfMf1Sr+qjKbBEmblPm3PhZQy/fWp6Ohx1ZHTjiOswUJu0mrb?=
 =?us-ascii?Q?6tGOEOqgC+JIUpIjJM2tPbOhVVjXBjMZ5S+tfqS6UBBYCqUMQHIHf80B9XBY?=
 =?us-ascii?Q?EXfxWu2rpVnZEYezuC9HzNjhe+JJ/3potWGxgzEgHFvVUQu3EoWW/qs6cPAJ?=
 =?us-ascii?Q?rdbmVV/Q3tdxFFhhY5bReQEZaRlfxytRnH0cqPlXlVjb3ZiXXGtiBC2KMRbs?=
 =?us-ascii?Q?lUFho7tV8gWTfHM1Kb3rAwDHs06sc4Xbp1fS5gKZumOl1rYTm75yjvMRnTZY?=
 =?us-ascii?Q?uTGaTXOSUgWDy5GIpUNOc/ud58/xKHX2qBoUCh0YLa5NO7USHSzBWv1CesNF?=
 =?us-ascii?Q?nwi3aONC2sTkrUSW1hALnhl83uQlXlSQR7MhkSSGlMZLODBZ9wQx5U5gfw9o?=
 =?us-ascii?Q?FTKuacP9AXlJJOWsTyKqCGMYj3HqrcQHYz5B3vQIEYRED7NgmaRD2N9jXRmt?=
 =?us-ascii?Q?0GLo5KvzrL4WX21LQQP83YvZwssxkptT4aSiQGjTMhWQwH7jHqbdMJ4C7ZgW?=
 =?us-ascii?Q?roOwP0zcG3A7j603cQq7e+sG8R7+va42WFQe1qEu0liA6EqqLZ7SDj96+FRZ?=
 =?us-ascii?Q?Zc4WSsD22JIWEEb4wWaU6h3fK1zC1PIarS4CAuWaIMulyrjY9t7dLQUy3n13?=
 =?us-ascii?Q?OZUWWS36XrjWuySxhM/IrpLtMfaqmeffuG/S8EDeyW9vbuWQqB5LhAwW5drV?=
 =?us-ascii?Q?6MHMd4PqxKshaGYFiGLLAFCEWjo+lbTazsik?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ubarX+ndb7A/oOoGtpGqucp4/U0+Y8QXGCzQeew0BQxvBd8dKLNOrv2UBBFO?=
 =?us-ascii?Q?1b8zoel35hMLCMx17b+xl8h7ITb/ezIdW/83xtkZMvNcavgv4KjpGVqWpcCC?=
 =?us-ascii?Q?1tISLgJM1iAZ6TVcetk7gd15CzVzpjy9sjon1rCjwMzmlJyLw9Ei0r5xfKLZ?=
 =?us-ascii?Q?KWCGYvoAW095JXBG4a++jM2O2UQogT3Nt1u6+mGG8Ylao9eRBfRJ8MeAs+aE?=
 =?us-ascii?Q?qIUN98oOAIeSTcK1xTVZun5vj/dqTbgvgOrJQyqUAcpQOosdbW5f+utD0jDm?=
 =?us-ascii?Q?pNIwDt52gL09wuns6IhO01gw8uHPIulAQ2bHXgYUklF1doNp2C3Rl7phCJJq?=
 =?us-ascii?Q?Dj98L92M8YSS41KsYNOXZ5PRbM4rdeCExjiM5rfTCQ7B5XAeVJ5xgmoXwhrK?=
 =?us-ascii?Q?fRJA9qoEh06SNUBTVNkwe37d4DChQwTNQ83rioLcbRn3lY8oBu4r7CXMVwEM?=
 =?us-ascii?Q?B/jjUqb+u/8rd8SD/rsom5atjeBMF/jVgsMA/3MaDEnmZei/FJGrK4xjge7j?=
 =?us-ascii?Q?QFiss/P16plbQlBJW/ATslw4ljowmUutjO1BiZxB+Vi37uQjWXHTvaZFI5CJ?=
 =?us-ascii?Q?HirXTCLKqxLKqUiPSNYvo7fmZNvWeMKD9WX+B/ow5VM5n3h10SgzcmR+hUl3?=
 =?us-ascii?Q?laS4OeUEcQlJ2Ujiom63enhwhh28qKloPSA+R38RG7eJ4UIMc/F2buWRLZfg?=
 =?us-ascii?Q?HoTX+j2Sl1+X/6wUU//Z7yImX/xZL5hokLasoaoSw7CVMMgGweBqyApIp+0M?=
 =?us-ascii?Q?jLPa0Y9nlTfMWvTno6u0BOTNiBfCeLTc555ktScqVPqNtMhgifHKFhtTT4yj?=
 =?us-ascii?Q?UlS9eHBvvALeT86l/HVStOTMvxmq59rfOeB0e3JvWq9FHdeyy5155coS1yHQ?=
 =?us-ascii?Q?igVKmnocDzlvN0e2tEtX+/CaezAku7qiWQOQLeISqS9faO6E5CYpexxRah+E?=
 =?us-ascii?Q?LtKCIu1NXtpHZluMypHBofh9VbGGzXFEYnbLTx2wXmlCE71KFoN4Ft/YUTUo?=
 =?us-ascii?Q?IDsvkKSFjOeENTTNc5KaI+5FktGO86St7XAlBgvAevuMXI9/ydCUydeJjsWW?=
 =?us-ascii?Q?J5tVlrFlGF8S7D3Jwhgj2/M6AW0XBD/1zWUbhFp5Nh9Lnw95l4OgywIBOJhQ?=
 =?us-ascii?Q?+VAanOWJrfPCb+t+VQ37tzbzZFdeWUOL/DhikRvUTQwQZnRjicH8Ap5Bhgoz?=
 =?us-ascii?Q?ifI8knIzY7wFbEIOJ4dXqgvd2eQsE1Yyn+sKBSlw1VTI9Y4poNtfUSZIIFgS?=
 =?us-ascii?Q?QdKOpqaKTqJWaYMNCH8K18oGRR6XiIXDV5l4TITZVepkkUGbaG7QBYpyBFx/?=
 =?us-ascii?Q?fYiOXqlgnYGQNqYGastT6pFBK+UkTIgUTlXmL3Xxxs4AvIsvdXteLu8aeSdC?=
 =?us-ascii?Q?RVSFGxviKFxjGT9T/ZqwtwTUEBDCVg1O6OodtUX2hyCifGsWR0FlEJtudmTT?=
 =?us-ascii?Q?LCGe2NP2xsgfhYCcwp7Uk/sMAaPdfs2IbNtY/eu6N08TnNCg+31rLuNTMRTq?=
 =?us-ascii?Q?SldowXqZJ7UtSIj/BCjrVKsfRGoP8Cz6pmkiRYM+gAaK4KbQbecy7DYIerx7?=
 =?us-ascii?Q?xlQtoD/k1WR5px0D7wgPDEhXGDxGhaOFyzWxxfR3YaaND2BHHrQzW5LMa0YR?=
 =?us-ascii?Q?xkH4fLgSyu7K8LMHTYIG/n8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ada40d-7b6e-4953-5d34-08de0ad95b34
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:58.8750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIlFAN/IASQUsOsHqQg5vpsPYM8C45gEXwW2Msb17vzC+KRrnC2uBoLGhdUykdXupub8YiZQsJXnamuiujMU8mdw2ac7raeU7UFw6f2kvQFqnM/ea+pD7LWmKWnKgeJG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

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
 sound/soc/codecs/mt6359.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index f73120c6a6ce6..be5c973903986 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -367,8 +367,7 @@ static void headset_volume_ramp(struct mt6359_priv *priv,
 static int mt6359_put_volsw(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct mt6359_priv *priv = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 			(struct soc_mixer_control *)kcontrol->private_value;
@@ -468,8 +467,7 @@ static int mt6359_put_volsw(struct snd_kcontrol *kcontrol,
 static int mt6359_get_playback_volsw(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct mt6359_priv *priv = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 			(struct soc_mixer_control *)kcontrol->private_value;
-- 
2.43.0

