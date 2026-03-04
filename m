Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F129337FF63
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605460; cv=fail; b=NdVdHwJNE1MOu7sOMsnnjrO/2Xlt8dC0nrf61BN7SDiOMk98160hOndqyD/aP8olp4PKyt0VVebTv0nSESls2Exabd+aW7P/iAqCg+osKG7aLBwAdkbKMAbDNdbzdOaE5G97tsvFsgb3Pkkn4Ec+8PKrxEL/lBhre3SozZbcMLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605460; c=relaxed/simple;
	bh=fjNxjMC6woDGnlyDQulz7PQzIaPdVbiYG4d4ABf9OTk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JJDh0MueMZYq2Dsr94xomRbhwx87uzjDFnExVgN02tV3YWauO9AIUoc/hQXzaKt6lzYfCu4XTvcd55Q7PnoZ6WIFh1nBYFtRfnp5m2mMj0GC6GMGKpeYanzzX26KDvx34/nVtT6BbXYbekk+uzejJpy2Cn6HR3J+av2epx/OzG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NwxfN1PH; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NwxfN1PH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqiMJ1TDFC50RuEBI3j0zoalUI1W4rG2JZlqyDO+0zMJ7B+2kMYJ24zJ9ZSI4Ztj5LfwQoD+PqRw9K8kFlbTNzGzEZkBxbnShFxJPZa20wFogLzDI9mHDnI89BTyGAm2dQ4pP97GJqNe3eR6uqi12AH0W7cfOJ45jzI7A1kFBYlZ9+TapM9FYPrHWM1jqeJ+GYNRWKwg0su2bb248bYwCCM1BQwROHbRuaIWSokHVd6YjJVLOV8ae/ItICP5EbBzMhKNZHf0cztMJSRaVxidcCnMgFUNUIhueDcJHFvofYcAyjiDQZIdnxPleWVXjaIFjmyCtEYTisXweflOan19WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33ws1IGmmf/yYf8jGuqnDAh8SLhQaxYKR3givEaxMsA=;
 b=lQcsUmgf4MnQi/GoRWRY5ipyfCGL2qBuuw3/1gZMqR8RIyHHNnrctj6+cD7OaotwbMhqENFEJiINTE5UE079Wxrcaxlj2ku3W6s1kiHFQcQGSqU/o0/ESHuaYdtGm7nlYnstIN7EqTkOzOzPhRpagQkzbQhzn+DUtuxLVCMljTd2C6HtIgkHr4E5SPD+EM0h7OhyUoML3R9qBAkl3cbg7HAbD1JGh1Zit9jKduVKNiKgswwH37ol7iSg6yD3mQL+hyVjLMiNlaxqNGHxTu566ZO7wgqvZUHUhRPKFvyC3YW4cAvPbhWPRknDUaV1Mxoqrh/JFDDF/jNmrsSXPHbTKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33ws1IGmmf/yYf8jGuqnDAh8SLhQaxYKR3givEaxMsA=;
 b=NwxfN1PHAe+GIuWmrvliH4fbqTXOeotc5S8Dt9zFP6JB8dEleUJltE3h8OC+6TJOLhyDc/nMG8TJoPrDC3Slwxb703g43Ngu2ogj6KCJcaTbyqsVFgmXDXOSBN/DDJSd3DACALLm9YuH1BeTNc9ctaXNqVxQHa+CGGVAjVlCc68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB17519.jpnprd01.prod.outlook.com (2603:1096:604:44b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 06:24:17 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:24:17 +0000
Message-ID: <87pl5knmcv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 29/29] ASoC: soc-component: remove pcm_construct()/pcm_destruct()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:24:17 +0000
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB17519:EE_
X-MS-Office365-Filtering-Correlation-Id: d96af901-1c7a-43a0-1200-08de79b6a9ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	0ldcu3I3Tje53mkUHsc3/hQBowrsYPSqZfFULKRb1zuEi/IdfHwYlxshDG3UZ3pC8Sx0ZofJ0LkduL5zp6tforM7lR+AwH6jVgB06kp8AF1VPbk49ZTeCcBzuDhYRfKUrI0hrCrYZB2EDKJfr+G0t+PM1ETag13R8l0GvMSQnfjLdqjXi4MxK+ssAeonvVCbLt7gaaQ8yOWWrQ4HS8fvPd2bYTzWBZ1pCSgCC7wx3VrwL1/41D3a8rz/w0iyAFC5Tifb6n7B7Fo+sWOj2Si2JwQ0Ow1rbfYljH8jW1TWodRPeOxZN4MlxmzhZdQPoIz56Q7vOhUY4HfbMwR9un5N4ANG2NP0/fMTMqJcXDF+sDf2VgmcmO38AnXj+U97yv9Aod5PA7mzHIwCMvIIMB4VKUHH4spJXvD3LZGtui8/C5j6jp4INJNeo1lm+1qEZpWRdN0FWqmfzlQ9ZNC44Y5zfCdNm99BDdGTGW8q4ZdTrV8byvBbohN6UXkEumsa0sIwByFchMHW7nMuvg12sE0fATgtPJd6mCbu48l4YyKIXx/vkT5616D4ebGv42SKy1u9tcOD6aqf9Ri6sJ7q77cxovi+atZRXxbNnjLKbfjtpjRw4TLCHRRP+E3A3b2vkDXZKMU5jottMGda22mx4aYNmdgHl09OkAM+w5hpyB4NhR9lrMfoJ5Xa/OS7WXlr5ahgN3y43tNhVHHLKb8eSJq0oDttGT6KPOSnTQTBqpDiBDlpT0ufVSVI+osbNLomzZ3AjwHGjjZZaeLW88Y419f/0ALQfaaqLX1KdE8WYuYiVv4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l1mMhfH6qgqtIAoaN7+Z+5TgCW/w3GpAm4Cfe3TtTxDCUp+dw+Lj6mmV+uB0?=
 =?us-ascii?Q?q8BTlFTwZBlIdzucYL/yejBetObx1JbPdy7nuDQACDU+z0cBLOjNnf6YgY4R?=
 =?us-ascii?Q?VcXc90/1B6UpokUGJbRG3wffMTsi6FxPfa8rKCNemiAbb1vd9ThsA44gG/MV?=
 =?us-ascii?Q?Q0GgkScyha75lzemPnRLxqgBeQ2/oUrzHDuocIQsCCJ8qNP1JW/xVjZhY+zX?=
 =?us-ascii?Q?jmXpaQVdRGgUIptl08oGJaYvDKJ5lMrMDRPFdYKd31KifUqQWy9NhVyItYW4?=
 =?us-ascii?Q?IjN1PuM29ikuNsDOCPXj7Ifzi3sZ5qGoytBLA3wfTRzl5r6mfBxBHPjr9mIl?=
 =?us-ascii?Q?XE8dtFw6He4q82jxG/dj+z3C/nqmSesErhDd2L4yHM+Zq7Usb+gjeB6nbS9V?=
 =?us-ascii?Q?jTVbPWzXhVtIV6atnuc1MidtXUMnSS1eGBdoCCuVJKvfFYo6FbI5D+vOQPqm?=
 =?us-ascii?Q?2ZrTn1JMSu2YMPWDnk6Z7wfKgEePjedgh1nLfSHx/lvIRBRPAroWPCKysK+l?=
 =?us-ascii?Q?kHtEeS2otHYI3pUXuHjrCooOsBOt4yHjQtjfQbibdGBuh/pwcm+YAfb+elxy?=
 =?us-ascii?Q?312SwzWUjt8eQvbsSgKZaoUpBX56/DclqpXcx9Jc0oPxiHw++847UBL6YW3Y?=
 =?us-ascii?Q?WBDS2OW92YXzyiS8hZ0Nn+I2XixmYUyldOm8i/GWlurR2kZ4tkyafbXeysRH?=
 =?us-ascii?Q?KC9synohLH/Duf3Guudotrqp3/BR++Tegj8Y1+9VeJawBWQdV5RCiN/7tw99?=
 =?us-ascii?Q?N4DOhCcrBiPWAPV5qAdW34SplXStiDW+h3Ly1tCIFsezow0k+0/cNklyQHel?=
 =?us-ascii?Q?HvKwuT7604qadSPb0y8ouoKe6zJvJk4p0UT5SRDTiEo3wtkTvqdclzRqqQBv?=
 =?us-ascii?Q?PxoysbQ1fqvzMGKk8oxt/wg76vzANncY3wSfhAyHYbPJ1PG5iBLoSDTOes+8?=
 =?us-ascii?Q?bHAXpzGRCZTTLbOgnmDExSvKstPP8P+/OvWlQdak1OEgzFnBoTdGCmZZvtSb?=
 =?us-ascii?Q?ADaUPP+MHkDR/BhMGpjxcjRitRvZ9keOmwQt1/pW8eQHulSsfSJg+7cbjiI+?=
 =?us-ascii?Q?m/FTkK7jTJtoWyFGnuwfBzjGxEK7I8cjtcNFJ5z8FeK3FAp62/9HS45aESbp?=
 =?us-ascii?Q?g+DcbloCTD3PhL0lcr3UsketCjWn/vRKGuykue9QZ6QcsJ7cjIrZMd/0XG/8?=
 =?us-ascii?Q?IXfPX7t3hL7DSBvN+EcqpK+JkoyrNKqsDS7/7puDm0otA06PP17gBY81LtS5?=
 =?us-ascii?Q?rAzNhUnIL71fPYfL/hcF1akOFmIX+gN6cN7W5VgZpPDJG6ygrIvN9p4YbbFP?=
 =?us-ascii?Q?bdzDofkWOCIvUXyck8W80x1E1sUi3wnS8DjRShs/FHKowNllLbSjmIzbjbY6?=
 =?us-ascii?Q?tkOkluk/mgXrLUJ1Y6n9LAA2MXoCpDd9BkX2bmcrwtbkG/L8eTWFgpYYNWSA?=
 =?us-ascii?Q?woA2hdvxLxu36Iq87n2UxRQ40KFFst9caYQ3yHIwyvzJHBUGBbY3gxJ6SJPJ?=
 =?us-ascii?Q?brPC//y+9NeuVgQ+fgBscOgMqSF5MAOW4ubmJ9Ks+g5CgD1jaliDBPVP8wM/?=
 =?us-ascii?Q?rTMKpxjI6+UxzA+MoF8cSfDemJ/oyhVS2kIsAxohz+8tR1upRzCkOI0HxGlA?=
 =?us-ascii?Q?UIsr4vFNYfN2FFHR96Ojm9k5XjWiNYEAcuyWphEe6TBOZFGfY0VJXy+wQuNY?=
 =?us-ascii?Q?xFFutrB//1ze8jwubK4f41abtVgy0hQ7CP7oS7shEdzD+hImsNkTWQgeSJwn?=
 =?us-ascii?Q?7ryqJwT6mtG1Uv4V2El55mkit/rDWuw0HEH66VoIxtRIF7Wqau+J?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d96af901-1c7a-43a0-1200-08de79b6a9ba
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:24:17.2627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7dpgOKlN+2H5mqiXSHJl7bKAU2FRwmxLdgR7M8PxY0xNTlnkOM0hyijzduyOFu6m34bUQpxDsc9ukvCJsaIeWjM3+53J6gFvi6TCoOVjyBOqqPAJYX9wKQQJo3nbkbVB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17519

All driver have switched to use pcm_new()/pcm_free(), let's remove
pcm_construct()/pcm_destruct().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h        |  4 ----
 sound/soc/generic/audio-graph-card.c |  3 +--
 sound/soc/soc-component.c            | 10 +---------
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 0435ba376369a..60f73c4b0bbbb 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -86,10 +86,6 @@ struct snd_soc_component_driver {
 		     unsigned int reg, unsigned int val);
 
 	/* pcm creation and destruction */
-	int (*pcm_construct)(struct snd_soc_component *component,
-			     struct snd_soc_pcm_runtime *rtd);
-	void (*pcm_destruct)(struct snd_soc_component *component,
-			     struct snd_pcm *pcm);
 	int (*pcm_new)(struct snd_soc_component *component,
 		       struct snd_soc_pcm_runtime *rtd);
 	void (*pcm_free)(struct snd_soc_component *component,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 74e8f2ab7ffc9..18ce4ee063509 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -76,8 +76,7 @@ static bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
 {
 	struct snd_soc_dai *dai = snd_soc_find_dai_with_mutex(dlc);
 
-	if (dai && (dai->component->driver->pcm_construct ||
-		    dai->component->driver->pcm_new ||
+	if (dai && (dai->component->driver->pcm_new ||
 		    (dai->driver->ops && dai->driver->ops->pcm_new)))
 		return true;
 
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 77ad333839744..0f5e120d32b71 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1037,11 +1037,6 @@ int snd_soc_pcm_component_new(struct snd_soc_pcm_runtime *rtd)
 	int i;
 
 	for_each_rtd_components(rtd, i, component) {
-		if (component->driver->pcm_construct) {
-			ret = component->driver->pcm_construct(component, rtd);
-			if (ret < 0)
-				return soc_component_ret(component, ret);
-		}
 		if (component->driver->pcm_new) {
 			ret = component->driver->pcm_new(component, rtd);
 			if (ret < 0)
@@ -1060,12 +1055,9 @@ void snd_soc_pcm_component_free(struct snd_soc_pcm_runtime *rtd)
 	if (!rtd->pcm)
 		return;
 
-	for_each_rtd_components(rtd, i, component) {
-		if (component->driver->pcm_destruct)
-			component->driver->pcm_destruct(component, rtd->pcm);
+	for_each_rtd_components(rtd, i, component)
 		if (component->driver->pcm_free)
 			component->driver->pcm_free(component, rtd->pcm);
-	}
 }
 
 int snd_soc_pcm_component_prepare(struct snd_pcm_substream *substream)
-- 
2.43.0

