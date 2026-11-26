Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795737490;
	b=R8wMHdhFsMwTMtwcp5Hq+D6+fk/gWTRppBCTCpvGF6nNViJRiD6Zi6xUeGty8EVUfxf4
	 EZUg6cN2GmwAFGR2m5FAFIsmA5jyS2Uk4L/nxBAKTOSMc9uUQQIk7hPo/8rK9Td95N+/z
	 4nplpVLzGKOa6R7twpV8AYj9zUPoURikYPoJg2kbHImVF+E7oXsEeqk0qHZ6i4xC6hA13
	 efguHHt+TnCBXFpxFL0sfEzAMQC58wfEhkdf4dUiVsieYR22gCDkXIVG8F9ZmzTqUdg3V
	 AAdELc8vfD/pe2vLnQxE5NS/RvioWGJ1qBa6b91HrdTOxFVa27RyGeQHukTjnGTRENw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737490;
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
	bh=7W10e2OUo91e14ME8OPM7qUYnUGwTPgB3o12m2Hdu6Y=;
	b=dp5wMXty6I/8JAmf2F0aF34qhz5LfXnq7R/+g/dztFToPTXwBmrU3Cw7E7XbzZB5/8fU
	 iazg4qs+Ctui2KG4ux9qGk1/iXf1pfL5E3TcOXWNF3EsaoRK4GvYuJ5Wo2MNB7DyWzZjD
	 tyxgW25T0X+zB/pYqeIA0gjjk/EJZwk4PPMoVk/YZkPjuJwi9WjtdLm78Zxo1u/w3OOj5
	 5I4gxn7Yaxjw7lNn6NJtOqYp/DjkHriT5e/e2dDxnr1uDh7Sm/GWOR5Hj3vU4a4fLlXBT
	 1m4lgEqFuFzmOaoRoYctRqjYncp6VNN5Cy+ALmn2wldnfyx5MhwqGIwLaZPoicXZiRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=DCzQWCpV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.41
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010041.outbound.protection.outlook.com [52.101.228.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A16C606A321
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 23:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A16C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=DCzQWCpV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5IIokLJ4dGfuYNXHG1XlV8Jk0duXmsgOSZyKNiLfQPKE6VRSa9zCyF9GO4qryFF7ZhcOlTGAA2wzWFeA5Uz9UpFgQ29EnuS/VOWba8HH6J9Vi+KdOiPfhS8QkzbmQkLs5bzJ8Mwt2wSbF7Hf5KdLcyD1h6GYpKmK6OQYn4B35CXwP/wegJ4OUJuBPEoxtrgyckQdEqRYH8zI8X0uLnbLkCA5YyuRGh4NgCbBgHNYLKbqhcaRabk1dGEhmhOg3kZ3aALSgqK52ZruTew+fhsbll6Uk2KuzmaDi9nK8Z1N55+PDUdQcD5VcxLCwg348UddtfCIr8ZzvQrbAXnp1IOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7W10e2OUo91e14ME8OPM7qUYnUGwTPgB3o12m2Hdu6Y=;
 b=o4EBgXquEPiSC0gxWzUWeLjU4+scTA4uTNRgwzi/n9BB5E/mPMrd8Y9qXxQ6+RIyVDcLnToYC1oxDzhjF3IWPOpPoQQxsBkclctc08Nzn5PFNeljQgxGByXy/waYRb1WK2zS/HPNsfv3o2CKrNJl9/FeVuMjuCsdU10jl8CTrn8PkNnhq6pXrYSWqvy37OqTCGaEw4pmq4sutbdrkmwctniFyDqn/JCDR0X0SmALkXYdASacDpSHyFjVSF4yLCj4wZZyNM4F28V4d7FgkmwoAXQLNBD8tOGhB+1IjCNadYIRuVc9PnmR74Bjr+mz5yTHfSZi8Ag2oNAlMuZRs52VDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W10e2OUo91e14ME8OPM7qUYnUGwTPgB3o12m2Hdu6Y=;
 b=DCzQWCpVadC8Mkm1B9H9GpNzFwxaFwzuPPmMLTkxQamv9dx27HMezC2bL1cCmkU3B4bRHn5j1YddA5HuRBA/YneflKBhKyRXfXTNLTDSHevyXnLUXIR3e4KptiGoXNO8LrGuyl8G5g+6fsZx439TX8BC7QeQUfssqbbN2y1snKo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY7PR01MB17984.jpnprd01.prod.outlook.com
 (2603:1096:405:3a0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Thu, 26 Nov
 2026 23:58:07 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 23:58:07 +0000
Message-ID: <87pkvrqh68.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/11] ASoC: soc-component: rename card_list to component_list
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
References: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Nov 2026 23:58:07 +0000
X-ClientProxiedBy: TYCPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::12) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TY7PR01MB17984:EE_
X-MS-Office365-Filtering-Correlation-Id: d679b255-2b23-4804-c375-08df4c191e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|38350700014|10067099003|56012099006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UHs8x2t//2SBDxi0GZZZMloP514Q7DtsehLni0xRwJJdoWZfKd+aXhCRWz7CfRCBf76byIQk8nYrg8x2mVefmulai0bjRPqMn0Vkhl0ZJ6+sayNmh5JaDirtJXIdB7tIiSl8aJCFK9uU/ClGbkRIAaK8znQgeqpm0uNW8ZNr14d6nid1omCY8KCaJjvKsn92StQFfEQMaXfCcIRx/pON5Gm3Z7xN2rWSZVYEVIonyzpJg1V5ly8jW441mEYluKai/9ju/l9ck9wstC9FBrud3tCxyqdwVZH9l9BVSINAFjMR0A03MgoKLrFpiyzqKtIeAjJRYg3NEuLMYrAo/hP9AKNsZ+mMvonW6eIPvMafAl+vYAk+DR+8xNqX3eZ7ihsbMhp2QNoyhQarba1JerQUAlYmM5mRknDYxFdt/fdtl4itNDsOsQPyIN/R+p7JRENKDkuu6riLDyqnLkljRB5bcOR6o0ZgB2aN2+2kdykWEUStGQ5wV8jgG/gcjErMvpXWEgU2j+6Q3eOwRpGEVoq8RDiKbQysWnhHdUSOfqWLbh4NqTgIYC66/hizNFQZe7o1VMSiSBPUgzOegdjXdGAhIhHmvkHWWSH3la3v6PGQWUAoilLg8FJK+GgSugr13z1jWVy/ptKZOB9DAPeGaWNxcM23zp1cyKqm9/jhZjuPhW3/LnQFrlfgmkXqQcVmi2E29Kpf8uG2dQgzDZFdcNi2Q4zhOMvFNvHj9Tf4P5/jcw4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(38350700014)(10067099003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Msm91sUkCdb5ze/cLJx04GjFLDVxsvE9187NafPJ5BQxdurxCutdT0GWXRpW?=
 =?us-ascii?Q?PxHHzg6fpkalRJTH36KWiyBWXJs6gGhPuoZ9KDjGHszHW4T79JPV9mTNL5T2?=
 =?us-ascii?Q?hQTeBLQ39f0prZtAUX3d4wsTeV82JnMKB1x1SCKOZ8Sxkx6Sq+y6kbMjehbM?=
 =?us-ascii?Q?J1JHvHMC4r7NfXUnJUGUR4BkfwASdqxKa++02vhecdcsVxAitMRg5P8AZcYU?=
 =?us-ascii?Q?VLk4rZmSdbD+iif3MELeaAs1CEzWYCfS7H6Znng8shBFPVjGFccPspN9eJ8Y?=
 =?us-ascii?Q?l48o5Laa10HvS7m6RO18U8MYlNODS/+mFH/euBqVNAH3S6NXukzdblqBXqaq?=
 =?us-ascii?Q?+z6aByLhyQg6L/rOIZ34ycILuAMZXyyKukEp8McitEazzLZwZmV57cXXhNVx?=
 =?us-ascii?Q?ki7W0/olnMS1wogNdJgNZg4zZDItHQStimyO4r0rCQDIIvR+P5sXL+u4wmSq?=
 =?us-ascii?Q?rx0bJIR++eeHlpwsQx99/T5BMvaGayrtNBEbsCYuS8G7fPzwD/0hrXETpPOT?=
 =?us-ascii?Q?tjUs+aq4RMm4n2xM9H2xFVa4eEmdbemz6qS5G1QiDwNPNs46w8vRuSVWz3u4?=
 =?us-ascii?Q?tprSM2LE/TOJaUv/69ht8pHeg4gDzp3LobGAh28jLZNBxddH5oA9k4RqTI9J?=
 =?us-ascii?Q?KvfycpskTbQiK/s+YAs2aDQ5xPVkJxyBsTRzLxcLkR+GTyINmO0J+Bibcs1s?=
 =?us-ascii?Q?vcVJ4E+kvsQkSrR916HU4oHLv4gbRzAnYaK7yzp60g6DXBLMXY2b1niOgLCH?=
 =?us-ascii?Q?rW+/Q9xm9hspUmDZXwTkx35gG5o7TwVD919wS4a3gmlB9Ya0uSWzY6v2aG47?=
 =?us-ascii?Q?eMkKggswwOn6ceaqMLklNmDl1p0v84R7oIt+uSYaPv17WaJ8tc/980sYVdaq?=
 =?us-ascii?Q?MpXB4Lfdaqf6Pvu2RGRet0TyrQbIgdcP3EjnGsjp+57joSLl1z6J1Z06mawT?=
 =?us-ascii?Q?FWgJjOsMY39FJc3mYo3QlIGynHinjYApPzUrUFYfaec5OuX5lNXVpShGRcNx?=
 =?us-ascii?Q?B994MWx7bbcU21ksgMzcfCy/tnxuUP1N8cp1WLbybWygBUsNAF6k/kyOM2+e?=
 =?us-ascii?Q?4TJlcKj/YCYWYQvfsrEiWEdRgGoEo9VSxkQf23mfIdOqsb8I9jODE8KnvX26?=
 =?us-ascii?Q?kjMOVsyKyKKmi4nZqan4LLNvQUKNhqHffEuYmcLyZat0yJG8sQ4WXobSBa68?=
 =?us-ascii?Q?W30tvBLvFfS19yAGWENDD0LPwIVwNxeamJ1jbQDIR52NaobFkC1HPF1GHjH0?=
 =?us-ascii?Q?hskd+hXPW8mHsdzn2doVPM8Ys/fdJvfnFWmY5Rk+k/BXgkdGyA7SRmkqlIny?=
 =?us-ascii?Q?l9FFZAd4pUzWlGmetkX+2jsMj++tEYxHEMjbqZSQzRFfOIINEKj7PQDCaKdO?=
 =?us-ascii?Q?F/+Xzw2DWG65g41Klp3pFduLtcGzUTwoMUktCbRHfs7ekkW4CyTjbj9Rw1h5?=
 =?us-ascii?Q?D2kda7TmO8XAO7hDqmQTs+X22Jcw03g73Tc+JGNjujM8h88Yrq2dmjZuaMo/?=
 =?us-ascii?Q?sROWmyY2dmAlqTwdTjkFepXKKY7yCoV2AfzQ9C1FiVDQHYpZNAj1QXASY1il?=
 =?us-ascii?Q?Gkiv76KXbfHSY4GEULS7EM3Nhnt/N6iclvcpk1Gg/4Urq+cai5q9V3CUGEdi?=
 =?us-ascii?Q?s0vNDaBU2QvRBoc+ofMyf9JyWB1u2Af+NAbQjfw9eIwO2P6nyTdqCSNOg3MW?=
 =?us-ascii?Q?iS9ZSDRaeqW6st/MOgseZziZBivnqHQ61WLISmxO/R5r2b8vJwVQ9lbZ2Ygi?=
 =?us-ascii?Q?Iko48hKmhAiCU/auKlMgCbtzb2aSk+Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d679b255-2b23-4804-c375-08df4c191e52
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 23:58:07.7555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lw85VSNQpmlmqGGQ6PZHYFSN5mqQ+o9Wq7HjcHXjCV7dJQS0jA6QKcE0BCkeGX6488+Ijn+ChAWlicifyDBAbwncc3bY8QfAgcFJl8Fj+mq7usgwkwIwrQNVkLziHIi4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17984

Current Component is using "card_list" to connecting to "component_dev_list".
But it is for Card connected Component list.

It is unclear and confusable naming. Let's rename it as
"component_list" and "component_list_head".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 2 +-
 include/sound/soc.h           | 4 ++--
 sound/soc/soc-component.c     | 6 +++---
 sound/soc/soc-core.c          | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index cb7f5d6c6017e..875c532034652 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -219,8 +219,8 @@ struct snd_soc_component {
 	unsigned int suspended:1; /* is in suspend PM state */
 
 	struct list_head component_total_list;
+	struct list_head component_list;
 	struct list_head aux_list;		/* for auxiliary bound components */
-	struct list_head card_list;
 	struct list_head dai_list_head;
 	int num_dai;
 
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 0a184462763d5..a08c0e01cfd9a 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1038,7 +1038,7 @@ struct snd_soc_card {
 	int num_of_ignore_suspend_widgets;
 
 	/* lists of probed devices belonging to this card */
-	struct list_head component_dev_list;
+	struct list_head component_list_head;
 	struct list_head list;
 
 	struct list_head widgets;
@@ -1086,7 +1086,7 @@ struct snd_soc_card {
 				 &card->aux_list_head, aux_list)
 
 #define for_each_card_components(card, component)			\
-	list_for_each_entry(component, &(card)->component_dev_list, card_list)
+	list_for_each_entry(component, &(card)->component_list_head, component_list)
 
 #define for_each_card_dapms(card, dapm)					\
 	list_for_each_entry(dapm, &card->dapm_list, list)
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 06e14f368ceb3..10f9b61fef656 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1529,7 +1529,7 @@ void snd_soc_component_remove(struct snd_soc_component *component, int probed)
 	if (probed && component->driver->remove)
 		component->driver->remove(component);
 
-	list_del_init(&component->card_list);
+	list_del_init(&component->component_list);
 	snd_soc_dapm_free(snd_soc_component_to_dapm(component));
 	snd_soc_component_debugfs_cleanup(component);
 	component->card = NULL;
@@ -1620,7 +1620,7 @@ int snd_soc_component_probe(struct snd_soc_component *component, struct snd_soc_
 		goto err_probe;
 
 	/* see for_each_card_components */
-	list_add(&component->card_list, &card->component_dev_list);
+	list_add(&component->component_list, &card->component_list_head);
 
 err_probe:
 	if (ret < 0)
@@ -1784,7 +1784,7 @@ struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *
 
 	INIT_LIST_HEAD(&component->dai_list_head);
 	INIT_LIST_HEAD(&component->dobj_list);
-	INIT_LIST_HEAD(&component->card_list);
+	INIT_LIST_HEAD(&component->component_list);
 	INIT_LIST_HEAD(&component->aux_list);
 	INIT_LIST_HEAD(&component->component_total_list);
 	mutex_init(&component->io_mutex);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 47a5d71da0fcc..2b95a905c711c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1280,7 +1280,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	INIT_LIST_HEAD(&card->paths);
 	INIT_LIST_HEAD(&card->dapm_list);
 	INIT_LIST_HEAD(&card->aux_list_head);
-	INIT_LIST_HEAD(&card->component_dev_list);
+	INIT_LIST_HEAD(&card->component_list_head);
 	INIT_LIST_HEAD(&card->list);
 	INIT_LIST_HEAD(&card->rtd_list);
 	INIT_LIST_HEAD(&card->dapm_dirty);
-- 
2.53.0

