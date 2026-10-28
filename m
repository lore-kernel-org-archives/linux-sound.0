Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156636;
	b=yjRWqoyPfSG4jI9xke70czLUICgQbtlPZ+KmbswCzXKyFCQ2kQcFOloz6VHq4stLIlGK
	 eL6vG687Xa6qeiTw+ofDwSx+/8H7hKyXt1CkP+PnRSNfsiCNQ90ptmt6NTLisqTjYp9+s
	 YKIvAQIkKuwXRSQM6GY1UtAZS0KLnFn/DBc4hJ0kfT0ALYln4+R23c//s0qtnaRuG99yg
	 CfOE2MC+C4JbNXDZaS0VvIOlyUjpHmTJjAcC+ETZePFrMmel2yiSkIjawVvdiPV4lrfDL
	 38TCNHUent3RSdFM0WmErWNHHGC2T5A6I/1cNrSNEfKahZADKu5rjvv8jelkEcRSWHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156636;
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
	bh=t0bl+MQ1o6g8gI88tv+GsHIGRzztDdxj9Ti0AOoo7Pk=;
	b=lOa+dX1uBF8pSVKTNnjoFlOphelwTwZdq232xD/CS3sColTL5V3NZlrUBgiDmxPvfHOj
	 9ftuD3+x3hVKQ778BdY93bCpnSzYvTNyV6b64d6DEqfYgYq6Ba2ZoMMzopObgHCb/CaSU
	 aSfvNxGphxmEa+Q5EXSDpC7qfNx7yDQwQMY757oaIzpAksYDqY0BC0OGlnxFcpnf0Frcp
	 xFcjvcO3O9yEnrW3plyWycr58rkXRWZofqPrtlgVhQSJmNTnCAI6YiSBdv6WMsX5SB1TH
	 04ZznIG4J+eZk7GdW4EIXRkrAabnweyYq6F1Hey9K67y2RylggG5A9DKIVeJes9k72A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=bcsqWlAw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.66
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF05606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CF05606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=bcsqWlAw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcYBRAsmNhFCFyS7VR28xoLC2Y0vpChZGRPWXVY0YBxTng3m3dQzrTV8PO9ktdrefNtQTdgYAtKY56OI8Swt2uJrZ6pORXDGswXAm6OIlPdeyP08+xBp1XcxEi0ERptlvEOkhQB/Dz7VarJHIufG1FSuWYwkHWCos9W+KRKyiubrvFGybEZOVbErElqbLzR1IgMCqNrlhh2psE8au/nrNRRoc08nG8uT0/4JJ78DcrnkvNSG/60F0IXOiL2O+JblJPxb6xOP2MAo1urtjSJ0RUrfC4kuri7TvD1Jg9e1k9FimTbrjT51ZRIIoTVllMw57H1Qnmq+4mPrmroH81y2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0bl+MQ1o6g8gI88tv+GsHIGRzztDdxj9Ti0AOoo7Pk=;
 b=w44KVNUsM8xgaJGxHAUOzqRB6OdS3mmDt4gvbTjPqy5lHGZPADzFqua0zzL828a2Q1EK1PYJVh8gYvy4KPabHpWozeSVW47MjaxLvrXMR+y6ssGdugh8WrmlwQ0Ho3FgnlBjT2w4lGq0S0dNgt7AVMEqNWxjeNPihXGzV6eBnRnxMFEbWLeli23bdvxDaCLoFky286ZFRS/P+CCeyAaSqT8Oqk8bQy96lpSRsGVbYqySohHfXS5Htn7V6wc7mvbcnqPcCAv65hOhR5lo1u+coaijYvmDqjsaOq/EMg8b7fyPe3De+Sb0jW9ZDp+DqD/0LgbRESTvWxDuBMZoVCdOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0bl+MQ1o6g8gI88tv+GsHIGRzztDdxj9Ti0AOoo7Pk=;
 b=bcsqWlAwep/OgE/lbyagoHuZSYAkFLAo4ygU7C7J4ToGPfc9xXlDh+n+iiiOi19gjGekynkkudY98KYm9fZ3hvV/b32HuaWf6UGPpM0TDHC0XCN3d3aqsSBdo2DNKY6y+PjzCgm4aeG6ztNCLWe/mo6Mu8iWmQuMqhV1lojwEdA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB6650.jpnprd01.prod.outlook.com (2603:1096:400:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:03:54 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:03:54 +0000
Message-ID: <87se1qsezq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 13/15] ASoC: soc-card: add snd_soc_card_rebind()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 03:03:53 +0000
X-ClientProxiedBy: TYCP301CA0077.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::19) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 1eddcc3b-700b-4626-f1fd-08df34a01997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|56012099006|10067099003|261026140227099003|18002099003|22082099003|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info:
	JeZCgmMHBkiZe6rvrNy7xQ9ZUovcbdjZsNEzncQ9dnEyZcadWDvh92KYo4YUoSwKnwejsY/3RlkknimMZIpIfD8cWZlzeVck7FXWbjR/yj87uS2mtir5A3hQeAoXhJQZUrQZaKBPoNlfymN0TPmjwk7m9c/AO7jo+bIlPib2ovgKb42/LHktNyHYGweZxc9dgQb3MWBbCxcD2eFH/8pA0oLw8sPZiXDzTQGBIbOV4Fz2vesm1iewvTw/F2ndgAVSEOd+19EKQOT10uJRszeHya4EQho26Upn25CmS2/jdhxyEdTS0KKHjAHm1jKRye0ezAi1DpaVywhhpXyYMppJ7psLK2SGQ8RS78Lvei5NhZcXyD3UNuM4GJnvt3+sznOAa/KBXGmrYtt1nNVszAykytA9V5wGq4kEwuu9vKiQGlQVojslxDL4n1/6MQL/WJLLmughl4KnhMoTVUldLmBXsXjnArY7w6ObdyZRoY0l0zu44YX+a5Gvz8goJ7rG8hqBQ1q1/IDcldVJvkL1p5SmTjg3HWFuoz05+gPb2JMpra6CUC007JHMyixsev5KPRf5SyZzIWMYKXY7bMaVjphVpEoiytoh3/GQkR7HxOARuDY1XeFsakiJ1/GkSfRZzmvDXEWWnrzOQUdrja1ZzQ/BwkV2fKxAZCFkP1p0AKH/KaLSp3UsoTGT9lj+G8ogQTEjJAadRO3s4/9FHK+6+AtFrV0TbblHqsJqT4p2Aryzp/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(56012099006)(10067099003)(261026140227099003)(18002099003)(22082099003)(38350700014)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zdjiqCsk8yvQv7MsYiTbsB420AzzAug6UWc8GfAkwawJYjN+0oYiMK4POnf4?=
 =?us-ascii?Q?+bDZRHshZ2fZsMK7OtZjFLy4mwKL3AraapLepow+MlEDY24KCfro7DBPqQU/?=
 =?us-ascii?Q?ciu9sa6wJKAbaIClayC9nplo4EYF51o91QQ1NiHxKQeN2m6q5AwYQLjlIYIC?=
 =?us-ascii?Q?cDdql2Phpps61nqBgv/Q0XZWj4hvjSiwuTfGzL7RBp4Jc/ZyOLr5qFQMGnf2?=
 =?us-ascii?Q?6OW6W+zgJ1fMupJSD8JT1kPPkOoesoGYXMdXOYM5seYKFiVHfa3AJIVoGQG+?=
 =?us-ascii?Q?kusjqNBOEh4m7tTMz9bWiiJLHX4N4x4VDKB5YcPR2fhc3PojBBdQT2i01tly?=
 =?us-ascii?Q?137mirV8lWf7nZP5FRaSBft9g/T1zyfPTWjB3rgao+Oqb1REsn3fZruzN75y?=
 =?us-ascii?Q?ItmypiMDJ7vcWOffG/N4SpCu1tNSltQR9RH9+uZqDz8tLDoPEh0XkC+fCAlH?=
 =?us-ascii?Q?ChdYyNg54X8Ads01Lijr5WHS0KOEn5Fhxv8eYxJ68798EH/Ju9vO/qsE+6H1?=
 =?us-ascii?Q?WKLuVlis+501yMIPaeq/0pTQkBmidG2SjwGZBCGEYpyQZiDAVTkxqwKkoKYx?=
 =?us-ascii?Q?aqBS4PWJgbERGER8XsLEHJGemzcxCYCeJ7vh72qhKNYQnapyh3S3xL54SS4R?=
 =?us-ascii?Q?AaTZu0v1gMXZh/LhKsf65EQwZaLzYB8LRg2j7o2HrR4Y53z8sZYSwSkuCWuH?=
 =?us-ascii?Q?nBmqt/7e9nhi/7U1CHoACfO851tbb1nGnWICMMnR+IGtzVL+GgM7Jlzd01V3?=
 =?us-ascii?Q?9PafKnsVbRxkDDLGMH0XCAkMjQkVIfsO6obDmf7AFu8xw86CM8GsVtvqWXSE?=
 =?us-ascii?Q?aoRN2YJITK0/mIrVRR6Ia9dRk35WAUFfZKqq0kAcr4llFSLgwj9dBnE8/nKW?=
 =?us-ascii?Q?8YYWgwNCZybj3L+GpdLValTb55y7dzINmuby9mip9IYZaJSSTi9S5w2NSNw8?=
 =?us-ascii?Q?ZTL1R26KnO83p5/tJuNYhtwPESAAPkmdfpa6IzuAdXDg0/c6cz8g8MAAFgjJ?=
 =?us-ascii?Q?7umGvyLIgSKTvJHiDyrl8Mc5/zjTT61bUgF/GYDGaAmlCFAXu7/X1+hnFufj?=
 =?us-ascii?Q?Nc4Up+LWrFQaZ5DyTrHsnvMFi1t/acl1by3FpAwxxSFT2L/ax8y8nMi0rI3r?=
 =?us-ascii?Q?UWxDrSrjJwNEn8J2ef42taxAA8ngRz7+H08Z3FWh0eHK7UgIUKLqBgEA7NfY?=
 =?us-ascii?Q?VOaPvZcmAPuulqI74NNPUo2bxQA3EpZEsuwF1JdwuqECCyq8Y6hF1PSf8r1G?=
 =?us-ascii?Q?frbcQ+723+/cJfbvEMygDma4DNMDvDAifmloTLAOMbhCbkMgtSrH8DimVLom?=
 =?us-ascii?Q?e8QzGeclScGNXTtA6PEnXN1xjj37az3MphNrIxbBZPqMCRuPw6IkewHgck15?=
 =?us-ascii?Q?MF0FBho/PYjnd1LMTnx7J73YknhpkY9eAvcViQtbyv6pmUwkcQwXomxK/SEH?=
 =?us-ascii?Q?X9q5s2dYBzW7kS8jv7JXe6BYg283WgsUpDbJjVXBFY6/yma7bR+TN/yBCg8Y?=
 =?us-ascii?Q?cmUO0ngSyvsZTAJE+xwBFAY2XaMM2qXhmewtoVhVDrNj+edNhSj+iEbw83jq?=
 =?us-ascii?Q?N41C7G3JXgQbI2EAqr9hB2/0mhj7NI3AdXa5ibjpLX/c70TBAjYdvzYYxFzX?=
 =?us-ascii?Q?4IxoVIcFxjd0lQMNCnVU+obBZng+ccBjdDDnUUv5ocseUo1zpsLK5467aEbU?=
 =?us-ascii?Q?gQXujVdSInRyjw2Nv2VlOqI2eAM+gy66GRtT+z+c89gdcVvpvOh8Laa/L3KQ?=
 =?us-ascii?Q?s/FWx0MKYxlf1V24rphkXzpOd3KbZajANUM2TeAbYfv1nZmMNdux?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eddcc3b-700b-4626-f1fd-08df34a01997
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:03:54.1090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygT13W9r5qKz8nGeIyCbhduMuecNNbWNMpK6tADsaSdD4JbA8RrL82MFu1pcNSDAgP/fYYivyMxsm5sXcNfJ9vfVHN6YG3ZnAS6sz5KVc0xmp7wcD5clbesLQ1Hr24/a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6650

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

add snd_soc_card_rebind() and capsuled card relarted operation

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c     | 8 ++++++++
 sound/soc/soc-core.c     | 4 +---
 sound/soc/soc-internal.h | 1 +
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 72b40f842bd43..f6ff99bf8a601 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -1097,6 +1097,14 @@ static int snd_soc_card_bind(struct snd_soc_card *card)
 	return ret;
 }
 
+void snd_soc_card_rebind(void)
+{
+	struct snd_soc_card *card, *c;
+
+	list_for_each_entry_safe(card, c, &unbind_card_list, list)
+		snd_soc_card_bind_call(card);
+}
+
 static void devm_snd_soc_card_bind_release(struct device *dev, void *res)
 {
 	snd_soc_unregister_card(*(struct snd_soc_card **)res);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 301089259a8d4..fd46906cbca96 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1455,7 +1455,6 @@ int snd_soc_component_register(struct snd_soc_component *component,
 			       struct snd_soc_dai_driver *dai_drv,
 			       int num_dai)
 {
-	struct snd_soc_card *card, *c;
 	int ret;
 	int i;
 	guard(mutex)(&client_mutex);
@@ -1483,8 +1482,7 @@ int snd_soc_component_register(struct snd_soc_component *component,
 	/* see for_each_component */
 	list_add(&component->list, snd_soc_component_get_list_head());
 
-	list_for_each_entry_safe(card, c, &unbind_card_list, list)
-		snd_soc_card_bind_call(card);
+	snd_soc_card_rebind();
 
 err_cleanup:
 	if (ret < 0)
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 97891bf68b882..ccd6a7baa4f3f 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -55,6 +55,7 @@ void snd_soc_dapm_suspend_resume(struct snd_soc_card *card, int event);
  * In soc-card
  */
 void snd_soc_card_unbind(struct snd_soc_card *card);
+void snd_soc_card_rebind(void);
 int snd_soc_card_bind_call(struct snd_soc_card *card);
 
 /*
-- 
2.53.0

