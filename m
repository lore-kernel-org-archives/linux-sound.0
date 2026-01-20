Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A2115E97
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 00:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768868062; cv=fail; b=RXT2xj/9jg99msAjUyTkyRpyiVnXXU6Ssr2FvJmgdQpxBXR3DDMhIqjMpdx8KdBoPPS3UhdwgZKWG6a523doNui3WGopPUa9oUYObaMYg2ds/5kn3X+A5WAOr63AW/rujhnNjSpfTV4TysYwgG11rv12Gjgw2xpKnXZrc4lviAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768868062; c=relaxed/simple;
	bh=Zw551o/wiG0jTVzZEr86kfev8RgGLia44cr+AIa47hk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=guugj/cU0/6oGHCdfuifaLpUyllY/KKs+PaSzie5kO2Wh/t7oji2IdiEdTnvG1gBFPfrSzOlqU/SQUX0a2/ORlYSTDQ5TtUT4QQguJ0FH6LRycetxyZksDa+k8acKzj2ukFWlXVqQn30IFCowoPMOkjobZ7gmwNqaKjBb6QlGD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bNRPXmHM; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bNRPXmHM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdoYxh9wjEHk62FizpNdauVjjh7+IaimJdg6StipmOMxQoBoLckU+ty0xK1yn9GmekgFe9DsHo8Vl3xfpiLqGHCu4unXCbxHVO02vq18InNA4W4GpmyftuPvBby+h1BWAJYT+BvET+NwyALYWbluTL7ZpxnZof80yX5iSTWHLQWNLsw4yClk4sZ9k5j0C8HrMby81BXpO/+UlqRaFZ7uD+SLyAOhRra9muqBi+/AmbrTaDcqfbh2t4M1YSfUU+Hp2vUd45QlakEN3NyeZDKx8s8ONsdyatL6ayf3fOWNcZ9Jr9ULsCpdC9awICIGG3fetujlPjTHVxNckZz3mUu9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWC4m9yxazlQQt89dOeMwymXMzNVbc/RgYySLdk6Q8A=;
 b=WlSLzHFFUY0/rBhbvqJXjmuwWYSk2PKcBITh4PLfiV5qW4yQzoyiMmVu+SLa7XoIn75nPYXT8wFcmKm5JLLHMeHKPHiKf+ruCRPAwYYse7qMh24mKWFoIIL4UJKctKtEfFoTbEvytp6pYX4P31cVK3Ny8pduNDa4NSWgum/GcgXRh3StojiFeA+eslgYga6MqUIsQxU26IGcscr22WmmsKhIlkEedAAyBaxLC2hN9AjfgnIWqmYcJcyxewIVXDWpgz9KWaFqPYylgamr25JrpkNgmQ/QnB6nCv9uSjWOq8s6mfPcxda/zAIArF9UZfW20IdRfC+rBD9kTwKSwYUxog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWC4m9yxazlQQt89dOeMwymXMzNVbc/RgYySLdk6Q8A=;
 b=bNRPXmHMvohrpOqLVJGMLpJNTpn8zEeTsksJYudiILtudVqzzYkqC+uNYEbtnFPEsXJgCHtxF3dWADrvjxzD2Becrx1ORlsm+GPto6y7xBeWSgKfmX79oyOnEthlnR3vvbtLB4mNfDi7vJbZX8IHLNFTwlcU8PyzzPTnvtRHAUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OS9PR01MB16099.jpnprd01.prod.outlook.com (2603:1096:604:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 00:14:18 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 00:14:18 +0000
Message-ID: <87ms29qgx2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/8] ASoC: soc-component: remove snd_soc_component_xxx() wrapper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jan 2026 00:14:18 +0000
X-ClientProxiedBy: TYCP286CA0039.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::13) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OS9PR01MB16099:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a40f8d0-5fd3-4d82-d86e-08de57b8da56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p/PmQbJzfyFr93WWiXch5pSy9mhnbsqdcOOswWtTDmdxX2/rcOWIS/VdpA6d?=
 =?us-ascii?Q?66E6AiJ8qOhSSsgPbwZmQQCHhqpTEq6vqb0MyZRP86UtEeTImLHXMj4Qj27G?=
 =?us-ascii?Q?Q6wblcT39TkQlGX+vRL43asWcniQny6KBR8VodYxWQpkwrqc3GjhJCXQsg6v?=
 =?us-ascii?Q?ewabQDS4D2vUpIz6G+WJhfUlQXiwmZYWuvokMsEhzAsp1JtYH+IbSZsn1/Vg?=
 =?us-ascii?Q?Puehz/eHQSDKWumew9jzzptCTFzQ3iveCJRp9fAKngUv+ZGOXs8BGwUTJrid?=
 =?us-ascii?Q?nl/aksoiaszZv4tLQNmfphmOGtYJE6y6gJKVs1oHn3Q5fjOiV/loS56AW7s9?=
 =?us-ascii?Q?C5Wx1cGpajfxC0dKU2PrxzBhJ+/7FNy8aXRLDyOZscBZ7Q3/51RGdP7unQ3b?=
 =?us-ascii?Q?UZdsqbf2w73RJLhih50kr5IEXpPe+DESiHFmY1oVivxgIVmJLtkLNfLGoUWE?=
 =?us-ascii?Q?VQKpOce4rusJ5CFlTTfDuBgpaMUyxb+YoLMQDg8obJ16I15XckcF5GU0845P?=
 =?us-ascii?Q?bo7TIHQrio4vNgE04zMJ/dXwmnB5NNjO5RrGT3vXBZHA4zDwbsVZ8n3WKDnV?=
 =?us-ascii?Q?3+p3Wf8q3rvyA2iGy+lOmew0isyIHn8TSZQkmHm6ynQShvBjX13+/tf0RiTj?=
 =?us-ascii?Q?fVoM4JKhnmqzH67q7P5mEH/jeVzd/RoQADr2N/5Fvrnzc95EUrUMQV1nw5f9?=
 =?us-ascii?Q?s04lS+QBeT9CgpO1ICcmTPkHFYyzYNZCLEanRhqGzFCWgGM8EFwDzCQf75gA?=
 =?us-ascii?Q?TI2e9jmx/2O1RqAySRWa/QkDcDAyP3vSMpi7gqsZcneCeAN3aT861ss2wLXP?=
 =?us-ascii?Q?3E4xsPYJxxJ6CEZJHeKcIIlKA3Ksfh9cXq09zG9d44cLBW0vCqgzcXXrCRnR?=
 =?us-ascii?Q?6NjMXWmU1vCCFDgYpRk+B9glSBY8Vaw+vUAkT4FdE4kNy5ZHOzfeIAVe0NrW?=
 =?us-ascii?Q?cprD8f9SO/NBxjaOfayw01gDYVKJURFJWMb0MLxY63+WoZ3AhgirCWs360Bg?=
 =?us-ascii?Q?XgnqHmYHh8PY0Op3/amjLUzX7tjC4rNGnhpn8q1ZrNi2QdD129AnMqe5Bjhu?=
 =?us-ascii?Q?9AwMe0sceCWtG7MyF/SUUH0V9XYx/6JnaA3LCJviINulBJDU4l9uQnUB+6/o?=
 =?us-ascii?Q?+DhHfwXx5JkqfSvu4i2nyGDg/Qjwgby36LndtUhpCiPQkLISRuVukSiN1nE5?=
 =?us-ascii?Q?gpJ316JFnnrvzL/spvFfhmpuQ6D7j9FYYxOjwaUDogGss0hnZMMUfNs/ISPp?=
 =?us-ascii?Q?BL57l2GDTAteeg4gHpFr6HfPhfvHyIu8xIcl7cWSR0gYerAlovWZq0K9hEpx?=
 =?us-ascii?Q?0XEaheukt9BWNWSePKokV7S5Nb1s3h+nQshHG9c6opd2kAwLMdQXFJo7ATyT?=
 =?us-ascii?Q?aOLHOiHC/uwDBrjc3vwav8MP6f683lY6v2rx6HMg2OIuz+rhn3ZmADJ8x9il?=
 =?us-ascii?Q?e2hJlslVfLS0UTGJ1sih4ey64lPz1z2v54oBxSOjdSITPV1pSlckMBPPTf0B?=
 =?us-ascii?Q?I0cJ5rGtSqIAfW0wmLWZ45tgskCDzhEqkV6HXHNGraeJ/7ZXF/CfJ08SbOCz?=
 =?us-ascii?Q?EeTlAZrXc+2+LNjY6lBWvrgIOWMlcw1bcYNgslMRUGS4KAe+9VaeK8cT7Not?=
 =?us-ascii?Q?xQjmBb/XR87kyroa5WUHBP4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pi/7ntE8YRdaCm4CberpaSBDtVKtI97MMh4gxwwI9Fqau4LgLcI5Plw5o/Mj?=
 =?us-ascii?Q?1KZqZloYMlhBd/x+tJ2859Ovz3pSjZixYqyuA13VWr7J0QAMqedClzP+DHJ6?=
 =?us-ascii?Q?/rfYM0L+pvsuNb/iHCGuTaHyLTclykWMMwBaiGnmm1banc8rqOcqElDukYXD?=
 =?us-ascii?Q?oJd2GKvgN/bIljOel0Q0XBRwP1PBBe67of/8pXPf/eaGZUOpaTkSTQVNPIjy?=
 =?us-ascii?Q?gfZ7orCzEmhCZ9khpWFbwiJTb5zTZ3gVmHchV5oQ5vptJUi6ET7RR46rDTc1?=
 =?us-ascii?Q?ahMy/JfVbs17H844nctdUUCmt3ri4Goi1d6yak3E5diEnYHglpchy7TdPR8a?=
 =?us-ascii?Q?l2DyWVT33dJitUhP2s3K90oYcSk9KaSrBxdPJQ5D0MBmbYlsdDM8bBfkPUfy?=
 =?us-ascii?Q?ldoctipxrjwe+gvNrYMwhUkVWTqe5dxD7/JWcWNGwDDRxf9DFyPJUWOmtViW?=
 =?us-ascii?Q?TItF0CpJqu1KhSVQihPvU2pps/xgr1gG5FPA4NIx6S11LeG5rME69IUIopUJ?=
 =?us-ascii?Q?AMewvAtmPWzfwUJvKAOA4MvDGaKdCZDmJbyMJ8ViyFj9hx9TplfxdXPKKoJd?=
 =?us-ascii?Q?3Qox4Jjflb2zdJWZ+7YTf/+sJPQXPpXDgQ5hHubEwor/c1bAg38y0b68SdWd?=
 =?us-ascii?Q?Fufjkgd6X9CUHNWD74JUg/+3iKqc8729u7Y9Ubu85ZNY4TFHv8835bxkoWUL?=
 =?us-ascii?Q?C6OZenwWwAVGdDNBJ+hciub5ZrSRSNkDVfwxsTfqXEpXaLmh67xedcTPrzW/?=
 =?us-ascii?Q?kL7HsHyKeAoSKxfIxSimj4ofjZ608F3JCdU9ddRhr5H+RYjvMcSg/G4NJhdA?=
 =?us-ascii?Q?RjqG4hX0JHslQoWyAElTvQJPYu4zwijcWfZFJwXmXsv/SxPNsUFKcq+7tmo0?=
 =?us-ascii?Q?nTuTm4XaO2fMptLzKDoq3YBl4KMWUbGBieenMxYFo/1BvXbLg9vu6T9AmWxe?=
 =?us-ascii?Q?Am2IL2YQyzjDZQ+yOdUYlWXScnI69AmoSFMW/+AY+8+Y35FI8KgyvYz5kxn+?=
 =?us-ascii?Q?DM5q+nbZNNBQTFF37K6Bf8k4naDgnGJiS3uBzD0wuopJCE5NlK48V9umIYxl?=
 =?us-ascii?Q?ClhzKax3S/2vEPksAqOJX648/Uj46OuTpzS7cTrV4pqQ+i2YKraWsZYaLBQc?=
 =?us-ascii?Q?RACLAaEg+eDD5058q7RCNU3ndpmKpeAq6EuiEkRBOrA6qONrMZs/6wSxTexY?=
 =?us-ascii?Q?Ei6oF4KlPA1fass25QvEyclalqPWHuRnmwQghHk14WtcRFZAhK8DjQQU7reH?=
 =?us-ascii?Q?TD992d9BJJndr1gOkJ+AG48V9G+SBUch/uvnXDsb0RATH2TC66poOA6FoUUz?=
 =?us-ascii?Q?7oapa1t8hn3j7/sNOP7/cA7GJ7kBAjhDg5kzYgIlmQ4un4VY/sobroQfp2JI?=
 =?us-ascii?Q?U9pNnJZNN4FRGWa+u4rxDJcSEhEWS8aBCx6+DtNWbf+Gebxgg+c1j0sRjEQk?=
 =?us-ascii?Q?RWgU4gi/posoGiBJYdFIbkc2ePKBsAZGrsw+o5XObmKD6xt7/f7yDrCyNyba?=
 =?us-ascii?Q?6E3fqZaV22x5x0/vlXrwHM4qOudJnzmmOzcK0g+mHHNba+pNu8XTGz2RPiQi?=
 =?us-ascii?Q?bpR9NK6aQA/V0TuwoQRxfe639d/y831ytkwJFhRvhkkIgE52FRpAbHOeLwx9?=
 =?us-ascii?Q?ys/2NJLz9uBvbwUV0bjkbpt+Xd6xRg1gYIPUPy4xCL2/RXboeqsDwpY44W+3?=
 =?us-ascii?Q?WsbhTFljEVe74rnkal8qbmh3QldBa7tt1tWiuyLFPjaBGDIfOTUAU+X5xO9B?=
 =?us-ascii?Q?RmGs8A1cvh+oQY+uXr494GOPlzrWtnfI4dY4oObHOpyhsAKmPH66?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a40f8d0-5fd3-4d82-d86e-08de57b8da56
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 00:14:18.3510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZ61y2SQU1pgCEwQ3LuTbszIe6XcWBSmRF3WWUt+fBUehwnevH5fCgApTYYeK00Fl2nog005ZOVid0lkb78l5MS+qp70xoGl4PW911o237aCTkziZJhqGRHgoZ3VFb8S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16099

Now no one is using snd_soc_component_xxx() wrapper for dapm.
Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 21 ---------
 sound/soc/soc-component.c     | 82 -----------------------------------
 2 files changed, 103 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index d78cda8668888..8b34958395ca6 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -368,27 +368,6 @@ snd_soc_component_active(struct snd_soc_component *component)
 	return component->active;
 }
 
-/* component pin */
-int snd_soc_component_enable_pin(struct snd_soc_component *component,
-				 const char *pin);
-int snd_soc_component_enable_pin_unlocked(struct snd_soc_component *component,
-					  const char *pin);
-int snd_soc_component_disable_pin(struct snd_soc_component *component,
-				  const char *pin);
-int snd_soc_component_disable_pin_unlocked(struct snd_soc_component *component,
-					   const char *pin);
-int snd_soc_component_nc_pin(struct snd_soc_component *component,
-			     const char *pin);
-int snd_soc_component_nc_pin_unlocked(struct snd_soc_component *component,
-				      const char *pin);
-int snd_soc_component_get_pin_status(struct snd_soc_component *component,
-				     const char *pin);
-int snd_soc_component_force_enable_pin(struct snd_soc_component *component,
-				       const char *pin);
-int snd_soc_component_force_enable_pin_unlocked(
-	struct snd_soc_component *component,
-	const char *pin);
-
 /* component controls */
 struct snd_kcontrol *snd_soc_component_get_kcontrol(struct snd_soc_component *component,
 						    const char * const ctl);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index c815fd1b3fd19..89f236ab30341 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -142,88 +142,6 @@ int snd_soc_component_set_bias_level(struct snd_soc_component *component,
 	return soc_component_ret(component, ret);
 }
 
-int snd_soc_component_enable_pin(struct snd_soc_component *component,
-				 const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_enable_pin(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_enable_pin);
-
-int snd_soc_component_enable_pin_unlocked(struct snd_soc_component *component,
-					  const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_enable_pin_unlocked(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_enable_pin_unlocked);
-
-int snd_soc_component_disable_pin(struct snd_soc_component *component,
-				  const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_disable_pin(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_disable_pin);
-
-int snd_soc_component_disable_pin_unlocked(struct snd_soc_component *component,
-					   const char *pin)
-{
-	struct snd_soc_dapm_context *dapm = 
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_disable_pin_unlocked(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_disable_pin_unlocked);
-
-int snd_soc_component_nc_pin(struct snd_soc_component *component,
-			     const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_nc_pin(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_nc_pin);
-
-int snd_soc_component_nc_pin_unlocked(struct snd_soc_component *component,
-				      const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_nc_pin_unlocked(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_nc_pin_unlocked);
-
-int snd_soc_component_get_pin_status(struct snd_soc_component *component,
-				     const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_get_pin_status(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_get_pin_status);
-
-int snd_soc_component_force_enable_pin(struct snd_soc_component *component,
-				       const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_force_enable_pin(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin);
-
-int snd_soc_component_force_enable_pin_unlocked(
-	struct snd_soc_component *component,
-	const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_force_enable_pin_unlocked(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin_unlocked);
-
 static void soc_get_kcontrol_name(struct snd_soc_component *component,
 				  char *buf, int size, const char * const ctl)
 {
-- 
2.43.0

