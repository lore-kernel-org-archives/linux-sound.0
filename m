Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443617;
	b=E8eU46QXysqTRgsvZY6h/ufO4azna5ist4SZnirmP/R1btwxgWQiLMkOQNigMiQ1FVTl
	 VtCAG1d+QaZqYiSsDkj6r2d5tVyh4IQC7o7uDpuGqvZcUiVzZk+9L53fo3CprfnygHlNM
	 TvielZ8FpoNOoB9h9bDE87DzPsY/AuViDCnIjJvrUFNJEEs197/SM4+edyu++MmTuBBG/
	 Q09P0BorIhDQjgy/O84X/+Bh6/F8vaZUa1b8XtEWHpmHc/cKC1DvUdENbP1jFpMT7Br8F
	 rE9v/CpFKT5JMrDinZgDiefXvlk8WJvAJL9tGN0lQHpdh3Epau9VfUabga7sC+Q4f5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443617;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1IJPd4cKhkNAN5yGfINR9wlPERqZ9/aRqlllN5bvahA=;
	b=i6oGSJRk3EPdVPuPPvDa3rsBOEvx3DBphyffbGBADlTwOWuBi6DQSbXNIBeQoI2tlqjh
	 RrzPPYcTulPGhEg40b/zBGzICQqoPo/oaVaznlZruCGN69c22gQOt4CHq4EqTh+ix2H6K
	 QFdKnzV4+pKoQ9z4TFFiWl4a89Ry+3fFM7iJAi5Bx1lhrRpPK9F6Zcb/cZyQiQzNUhIva
	 Z3NbBQp5LNbpLvnpVWqRV4r6bn9okpiN1GfiZhE5IN+az8Ls6eTVn02rsJdoeyKb1N072
	 DjZnboygay5d/1EPNOlfrfr9bzU0MDFzuntQp15F33r5VA+b1+obyALCfZh1ysftJYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b="XaoeS/Yx";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.15
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60868606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60868606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=XaoeS/Yx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwPmQpLKb5kEU+KUaGW90lclTtx5g6xrCaAI1ILiseLQwBrYxdLX9ge+RMCeny+hiyDTgs1xA7XDmGSqa/D0ByZa/FCeqFu7p/Ho0MeRr4OXRwUzS0n4T9yDRgnw4xbQMImXG8WW1gcCMJnsjeCk+QPnRoAb6fLRxM0A5cMGo1z18or0Nbn+B2qej2vl4kcg1EilW3ipV0DKXKLKMI8WFB2FR2VMJqbA2hCWzoX+RKLdz9rs5KKMkDbvy8kQTNDTTaIG/ZXVI4N5zLRZx4xU5TIMbU0CM9wVoiJ358+xZGLlEN80cLgL/XvVBI1jneBChsJsMBvZRv5cSIcstRFEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IJPd4cKhkNAN5yGfINR9wlPERqZ9/aRqlllN5bvahA=;
 b=A7nrn9mqdLpquSZENuwQg/yXx4pJt5Rbl+KJx3lwau/6Cc4jqirVlB0dU8RBe5Bz6Nq0p50uUYkbdMEKx3LvfjDhLDtvdyyRjyiuzTiag8P5iTUAlrUEmEx5XT9JLouzf1G9MD39GZfHkTicYGBD9nDFncmU0+iCXCX1RoqtBXm2FzDMO+Flk5whOplq9Vzlox1dnzvqE+J2NHuUujmNMIZjkk0gX/zxMA/rElXvr8aOidAqcehvRNmhuRwz2RqaM9UTnLmR4L5POvu+JRFTPbqa/tSn51WwN9xhOmnH6qhas8akZIdfUq/yyAfiVI45czoTlqHeCpsMIJSafXOkzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IJPd4cKhkNAN5yGfINR9wlPERqZ9/aRqlllN5bvahA=;
 b=XaoeS/YxvFGAWHSqQUqv4pzqQTdt2ZOVvyX2SkWIuJX4sWXCDvEBOtJK4AdeqZ85rv3srb8NBQFBUvVL9PW0Vnj7w/koIQICm41GL0J4F6GZxsK5JQY3s52BFWJVVU/CDvcVEz5NPySpmcbIclSQSKrqeeSvBoI1ibeOqnInLuM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB13263.jpnprd01.prod.outlook.com (2603:1096:405:16a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Thu, 12 Nov
 2026 00:33:35 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:33:35 +0000
Message-ID: <87zevezy5d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 25/27] ASoC: soc-component: add snd_soc_component_connect_dai()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:33:35 +0000
X-ClientProxiedBy: OS3P286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f7::7) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB13263:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb2f543-d28f-4d0f-c7a0-08df40549630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|23010399003|376014|261009223027099003|38350700014|11063799006|261021123027099003|56012099006|261022105027099003|261021121427099003|261026121527099003|261102130727099003|261026140227099003|261102123227099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kBIzTDlZPIa5E5/Pl1+sM0UEXyuJT3emkYv+mPSmXQHxhscYJ/z/BJSsujwU2otD3+7pJ9DEcR2f0mACwH9e2XYDoaIuCxhBuy6N7eLubovToI3ioBsLghE3cVhAi6F0phpuec4vZVQHSkZsuPsDjADobAJcy38p0fOEYBU/PHA/spQPdzQLtf8V1y1w/X4IYTHvfCmJS/92Su+w9v/DfEJC6LqPrIEDVqHPRWoLaQ2oPWO4+lqwEg4j1BOWImQ0FmbcbN7ASR2qzQ1r8Ll3MavZX5GvcIFtcUiUzn769m8aRVk0QMU7/UNJ+ZFuuUjIZGYiHBezHekHnt8B4J2EgOWQ8lpRWRMndEmkLWpt0AJnqkY1eX+61YQpsq46bGOt9cYthIWOWHusTU0NWrRdc/NOtop9+TAcxV+jRxBzA3Yas7Htrinxx2o51k9uqnhped6efk1KsGZrmcJ5N2053fPxlsXqiIBfRtX8G2LBZ8xFBq2/1pl9eLJLFLRZfOproCVlmY4H+etniCubaHJRsonaD1nZEYRdkeeBt3/aZHzic+z1e81yNCK6gw2sNiYnDte7Q4cFUlEYmZFnb7XATfxMychi9uT5b/RiTvGT5wXMqGcoQzjT3YUtyBgjcbvFcTWJcrx81MaiFQmvFXjbaoJOfhshbS1d8dPJvXCtdiZ4r6z7gP2DymHPr4Ed9mIuDorGweQJ8uzhXk1LmbCjmZdIoMXx7x1cGgFmPo4UUpA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(23010399003)(376014)(261009223027099003)(38350700014)(11063799006)(261021123027099003)(56012099006)(261022105027099003)(261021121427099003)(261026121527099003)(261102130727099003)(261026140227099003)(261102123227099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?PXegw4bw78b25QTwApFzsu37+Vcc+kg70oRvha+YBwC+wT8ADu6z61iKhh?=
 =?iso-8859-2?Q?JHMjaDYR6zdp9qeD5ukEhiTQNidcwy6up8OxdwYP+riuHPIQ/Y5pOP2kdG?=
 =?iso-8859-2?Q?MbCpcA0N35CRG8cKw1bBQDIc/DH+0xWWgYz3ZbTuJP+gJ6FLndweUf9mG3?=
 =?iso-8859-2?Q?8Hx4mHIxevbe/TIMq3kauDzFBpQmZrpHJ0KlbSd0B4fR01zt1Py+qRX2eZ?=
 =?iso-8859-2?Q?lIiFC3x4p/FJhdF5CVrU8SEHxXq9RxsXulSilT3KC2I+6XVLsJ+mWPwc4X?=
 =?iso-8859-2?Q?XW09iV3L53I5F266lhSf6wV51N7urhJiFI+JDuB8spYJqkt17/94GLZhXC?=
 =?iso-8859-2?Q?6hvcJbYyWk4SNiQQeoWCa4DQNZCOISJD95ckXL5G1qOWCssGTAN6axF+lu?=
 =?iso-8859-2?Q?TePnQtFWVamg9u/eK8AaJpLbN5TAKEZtvmuXEciA4jLBDlKAxtI6jRXVtJ?=
 =?iso-8859-2?Q?g8DVQawistSUJn4I4cLs7NVBlcnC8oPcP95+e+RrhHyVgDAB6qx3MMjZRt?=
 =?iso-8859-2?Q?TK7D3/gd9wqoZaMwj1cJzQnDJLH9SnkriUQN4s4wlUtbKOAArGVlY1VMgK?=
 =?iso-8859-2?Q?9oeaQS/BBHklv7a+omxKk0hqC25G4OTTCx390BTZ0wbuojcpDhCqWZME4H?=
 =?iso-8859-2?Q?4U097tX2HY/8BoPUiTpwodyR+G+dpiyffSTJTJ9rQOqvLDO9xD0Qn3Hklg?=
 =?iso-8859-2?Q?N2m3YN+AyPhFG2Mik4c1inGBb40X6jrU6VTqm1+Any2Bhq+EYzaOD+fU2Q?=
 =?iso-8859-2?Q?+BILOOqsb4KmagCjECTeoQ77mImBoA0HeXu84O0aGBolrjPHaIgrMVqOeC?=
 =?iso-8859-2?Q?36oMhMcWo2J3D6iS5JMdTsHcKLrQ5Oo68BMZrlL8raJbpsBAOiVu7/OmDq?=
 =?iso-8859-2?Q?IIr4fF22/F4ew15af0E/h+nNBY8KYt3V88tFMwZYQj6ZTXwcAs2GQ29UDr?=
 =?iso-8859-2?Q?b0ovGGcFT2L/pHQ8nbND1NUQO/7awGHHCGFFMDkE0m3bfXGRsRbxUs97dG?=
 =?iso-8859-2?Q?FXVtxub1ESACdq5spPmlVPpanTGynW6zs5fdaP+vo8TVjCWS6uz4zKHO0O?=
 =?iso-8859-2?Q?chqE1QZSGjzLPk/BW0i86ytFoPQ8xGJfLcAPbJK4hv+FzW0Tezw9LsT214?=
 =?iso-8859-2?Q?0vdqrWeJANshZWaT3cG9R+R7PY2530pynRAcV/ncTf+ZoqQNdTd8YQ0Zkh?=
 =?iso-8859-2?Q?QGsLn+4bwBpMQNtUtk8FndIC4a3rzubZ9MSCikAUv/rM7K7kVseaS4uhpX?=
 =?iso-8859-2?Q?6rL2bGBhIFzoL/T6JcCySf3cJlJewESZcUG5bC7ED5mGxSvMdeq7G5zLDU?=
 =?iso-8859-2?Q?YiEAlZST1Ai74JJPOuOMrFK9gMuPmsAi+aHS0MVi8J90n4UayEqu7UYE2z?=
 =?iso-8859-2?Q?XKAyfTS2RkHwUMc1zjoEjwx4ElmoEZXUq/WK/701tyo3+LA8EFBry+DcVk?=
 =?iso-8859-2?Q?i/Zu3Cr2RtfDZP2pASRwyobCMGKRcaRcmkPHeWJv7U/QlHMqpoph0XKwJR?=
 =?iso-8859-2?Q?IZ6KW1kTbw0bc3jUnNetafBM7et0b35UzpgGUbCA83NcfEUSDZgqRcmdEo?=
 =?iso-8859-2?Q?GepfAB4aSZBA3xopkhxR6TAwIV+8EI53SL0Lo6lQ9fyRjqlN197srd4Em0?=
 =?iso-8859-2?Q?HD8toY4PlPrIBwuGlSSmg1M/oIGusyuf/+DAxL3BMUhZOSjMoxynhaW4Sv?=
 =?iso-8859-2?Q?kIxu3vxh+xlmjPR//m/JcI08Z13xZgBPPMS5a4YT2TCaALfoiWDRSzFc8c?=
 =?iso-8859-2?Q?wZ6v+NzNKhY13vYmPB95NA35oAuXO7DPsSo0CSPjbRDJkIYWuJk26mvdz/?=
 =?iso-8859-2?Q?J29DLCJJxv+O8hEjKODUGcVlYjIEa7nMnnQZBriFDkofayhdaRY/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb2f543-d28f-4d0f-c7a0-08df40549630
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:33:35.2692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3WC24vOJ7/KwH3DNOwzI2P1q4+kC7imXy4oUtQzIl5z1nKPFUcewdxTOOIqWrGPXEbyE1cbABNkycHZqiQ6E04OtEJU8taMFaOQJ4AmYWkIsWg1oWcny4VSQtUZEQn7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13263

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

This patch adds snd_soc_component_connect_dai() to connect DAI to
Component.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-component.c | 7 +++++++
 sound/soc/soc-dai.c       | 3 +--
 sound/soc/soc-internal.h  | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 9e2768838a045..1ccc28ec28e13 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -110,6 +110,13 @@ int snd_soc_component_num_dai(struct snd_soc_component=
 *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_num_dai);
=20
+void snd_soc_component_connect_dai(struct snd_soc_component *component, st=
ruct snd_soc_dai *dai)
+{
+	/* dai->list <-> component->dai_list */
+	list_add_tail(snd_soc_dai_to_list(dai), &component->dai_list);
+	component->num_dai++;
+}
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index d124b6afb1b8d..e222268d8466a 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1265,8 +1265,7 @@ struct snd_soc_dai *snd_soc_dai_register(struct snd_s=
oc_component *component,
 	dai->driver =3D dai_drv;
=20
 	/* see for_each_component_dais */
-	list_add_tail(&dai->list, &component->dai_list);
-	component->num_dai++;
+	snd_soc_component_connect_dai(component, dai);
=20
 	dev_dbg(dev, "ASoC: Registered DAI '%s'\n", dai->name);
 	return dai;
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index e09d283d443a8..98ff0e2fc2e1d 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -69,6 +69,7 @@ bool snd_soc_component_matches_dlc(struct snd_soc_compone=
nt *component,
 void snd_soc_component_remove(struct snd_soc_component *component, int pro=
bed);
 int snd_soc_component_probe(struct snd_soc_component *component, struct sn=
d_soc_card *card);
 struct list_head *snd_soc_component_get_list_head(void);
+void snd_soc_component_connect_dai(struct snd_soc_component *component, st=
ruct snd_soc_dai *dai);
=20
 #define for_each_component(component)					\
 	list_for_each_entry(component, snd_soc_component_get_list_head(), list)
--=20
2.53.0

