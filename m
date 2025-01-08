Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010029.outbound.protection.outlook.com [52.101.229.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA74259490
	for <linux-sound@vger.kernel.org>; Wed,  8 Jan 2025 03:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305573; cv=fail; b=cV9SSYDnfp/YdfjsgQprsXESUh9rUBJ8XJqcQa6eAvN+X8OMN+NkKBY+Y4g6X2Y7M+2H2dYqJitDjMy5/Rny7kKoTo60rnu9j1offn3I6edph1UmOlZGY5zi/ad3hUJ4TnFIFW75cF8Ly4Pfwqw/0Kct32ofHlDtNg/+sxlZYWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305573; c=relaxed/simple;
	bh=iO+pui39klRKYlHt/DC/1nos8IXHZJ8HNf2LEjdxxMs=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=ol3sE8a8OPunaU9JsgqUrltHabvTXfrnL5Haxw0/5Leofa/BrSHZYtNrrnkSUlhqHhyZmiFx86ruH3zS4ZHOXCWZNnQyKwhA94sh/LZ3Pw7BuojJUKg+byz78+J+VonTyi7kJn8X8atI4n2j3Y4qT9G3fd07tsiBGTHQo6zdFFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QbmqQA+/; arc=fail smtp.client-ip=52.101.229.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QbmqQA+/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrCk+QdalCNF4wCry0UZBznhZJgT7SUSCN57lysv4/agzNoFw/mzjBVnrGEfaF2BlN6ExS+luyBiz2l0gK+DewIlQnZofSzndpNPpXBkEH35Yg1XL6NR3/ArHOVoaDDwsBeBprVUo8t8EKTJKZ1rIQ8S+LxyupVUcGdQ8ApRAJH4pOUBsA49jhd9KHZBW75o9xhLXHK4iIs6Qa9ulDkFOrSTIZpeMtfGXdxMUZtercS50b6xSh3e8AndtV0HdYT3YhmdYNEvp+HBJ2anAOrD8yFl5UibKemhLPXAG07bDed4WtEyyRV3OztBXlD09/23akEhnNuWb2YNZrM9FK7N0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FbnlDlt1JwLsJhJfNDqj+AScwTrFSYV3D+oOk6CaE4=;
 b=QWNT08IG5NWxxxJbpSTjZNtIwbcfOtQqC8mGduPPeRKEqYiRnzXbUSgQGP8KQRCXUQMyXo128HU0gAx3ur7G5/MZTmgs4nHqDjjMmT+KwiGw3NqNlSs9U3XezGtWtlFXkLivS5g8bszTlPbb+nsk8AVlH8IxE2jQPOPUeNM1BLP7ISNT+fCM5GA1e/DFRPejWvWUZ4jMkH+K4lopPBD51k917tiIGTV3e7U+xBwkHu/7pb/Mig04Xra41/Mt0eQFAMgtG0RY+5tnkFcsReLdYPo/fb/DktQaJVnB3AfOzIiP1sH+SFt9Mzzly49y2jGG3vs44vaHPEBLnjW/Sf/Trw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FbnlDlt1JwLsJhJfNDqj+AScwTrFSYV3D+oOk6CaE4=;
 b=QbmqQA+/1AxKaLWupBVNJL7qiS+JkOWfquz79FfW+cEFAy2wZ43LvsNY8Dzk2mw35qXty44d4CymngKnNCkKv2IYkWpSrW+o1o+30/Kkfudjyxf8n7zAJ9eM1jD+FXXsNuFqB5U1RpdR7F+edsZHZi43U/C4IZ+UNtlM2CeW79s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS7PR01MB11882.jpnprd01.prod.outlook.com
 (2603:1096:604:23a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 03:06:08 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%5]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 03:06:08 +0000
Message-ID: <87ldvmknrz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: soc-core: add snd_soc_dapm_add_routes_with_card()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 8 Jan 2025 03:06:08 +0000
X-ClientProxiedBy: TYCP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::16) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS7PR01MB11882:EE_
X-MS-Office365-Filtering-Correlation-Id: a23cb576-7d43-468f-6e80-08dd2f916618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mjoTI1o4e2h8mNihAJ9ZAqKR/ctf+IdCgp/7SWhrw+uO+hL7cCzc/rAFIWe8?=
 =?us-ascii?Q?l+xWAfdEgVH6JAVyrIO2UlhhPlNMBfQvXykYWX14l/FVobr4jSpNXuCljKzG?=
 =?us-ascii?Q?Fdub1ZVsfWwIkxycsAqkjEL8DjDDy80KluGPh8SBn96dWF7li6GA5ne9HGHX?=
 =?us-ascii?Q?21mJ6/Q0AjvJVxnPMCRdWqVL2sPx95qI555UK11SQAXLhIonYKgxXhXexlC+?=
 =?us-ascii?Q?PUq17IPGv9JX+OvbON7OZWZWNbsY9BYkaHWBNOKYfat62X5fBN7uf2KkGld1?=
 =?us-ascii?Q?6QmbGFbAOrbq9rOr8pOFswTK/9BjR5BqEJuW+Sm+e6ITEQtimsUzSLVmN+rX?=
 =?us-ascii?Q?6cWm2YQSfx/Gk95dLP2VkwDDQmO1+QxxBThjPesxBTjVeLrP0sfiDa7YTL4g?=
 =?us-ascii?Q?52DsFpFkkJiEdCAiw2CTPucIvVf6aAuch8WYnt2obnxvUtkFgBGj4xnBhTcl?=
 =?us-ascii?Q?hn01w64IwnFmLRyzW8WAzN+AJJ6rXGTKrKwGQli1SGuBS6wED6TI00EuXNCY?=
 =?us-ascii?Q?8RUFwRSA6rmFyXTlgUGev8W/HOYrKYuCIPZfQ2eUF4QGYypLQU0c/4xaHylW?=
 =?us-ascii?Q?VPPeEcNM6ES4L+RwnJw8v+xnekoP5swzy2zzVlhSyla7hYZMW2EqLCQsjUrl?=
 =?us-ascii?Q?4wxKGaflTAeevR3jU7a4OipD2MRnNDklLIQUGLiWMqkMZKtJPPaTcQxTdnC0?=
 =?us-ascii?Q?QXFe97Clbs+K9YhQaoSOJwg22inLMC77WAdytjxzb2l4CuziWzCmZghaK2EH?=
 =?us-ascii?Q?nvrj2Fk2f+1Y1LqVvf1MFzjddwrEjGwM4LnLab3fLRtxOt7lWZjsgSpLjMXc?=
 =?us-ascii?Q?u/8FbR1xS7Sd/UgbpFAsRVZC2X6e5FEXxisBGdoqHQRk5U/oem1J1fmGxwmw?=
 =?us-ascii?Q?9XTVq57uKCQ8wn6l2VMPZnHnxqj31OpIuFG/bzMbBOcBgBrGqBElc/cXURuQ?=
 =?us-ascii?Q?12tWGvv40eXnC4BcZD1K19qzTuGKY/ahCIQH564x8Vs9X8vCqzCU6x6gXUhB?=
 =?us-ascii?Q?Gqo30lf2PbUVN3cnubrdZETwoc4TOl+0ssJEruhlQ0vSck94Y9ts7pkNOr1f?=
 =?us-ascii?Q?ntsa293uGbaNsaTNuejJR5zF5Ul4bmdXSfB0spBNafh6J7pyds46LCB5/u6g?=
 =?us-ascii?Q?VnwcwPdc3cqjT79qKb90m4uiaFVZ1GELrWT8OWcACIHiT+9RcwsgP4ZjFl6t?=
 =?us-ascii?Q?Ma+TZNx2U3HfOB7HQC0EhoapKBCvXr+MWcBdzd3Sv7KfrAnnyo8TwEFyHPN2?=
 =?us-ascii?Q?DC1RVcfmlsAwS8Iv3US2JVVfzklrRRV7Wd8sh5SGng+TIGKHUgvYjUXTyTNE?=
 =?us-ascii?Q?ka+a8fNb1ofrDFjLi3ih1X8ChCk4Zj0zvUbBpgENbeIZYt12FzoOGDPDjbVc?=
 =?us-ascii?Q?zu8sC5/Mm6ScUSi9tUD0nj3aqfZRwXZ78RlW8qNKoWteoXV0V5E6n+83bGaF?=
 =?us-ascii?Q?v7mZfO3ATX5HW3FgBYlyMygX7GxOdypX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BplJ5QaUBfpIwRQJwD/vGIqI4zJWzOjNW2wbY/V8JgMEyWbE+xDzMyb6dAg0?=
 =?us-ascii?Q?aFSvwEomkzzjBAX1yPizKSCbcjU6zHl3+TB3WC6uEyoX1lCk7fQgBuLuT/3y?=
 =?us-ascii?Q?ZeeoRSDtNG7oHV8ExN/w/XOmO+Yq52UYWHriWAOzJXiwQfHIp/wQTVd4G/am?=
 =?us-ascii?Q?V8ZagIsFA1WLOhUR3sahHs4TA0RfDcETwUDoQNCGBHKFaD6sgVKaHzRvs2Kh?=
 =?us-ascii?Q?TXelkhVZgo35kgulaK6qv7BdbV2uiHMjejdxK+fsLg493kRnZ1V9tU76S+bq?=
 =?us-ascii?Q?W5OvGFxnEwuCyYBrjGuDuZssmM9cDeICvOMXsKU08CPmRz0gNruWGJqTCBYj?=
 =?us-ascii?Q?PuGY7mQ8KRl68szRzZjqEzmAGhl3i8ceb0Pr7IaZSOvk15K6saLa2IdENgq+?=
 =?us-ascii?Q?To3QV+oKdXpUhYNAFxEiQk6rMr5JYNpznf1zXsj8vDYwrpS6mLF1Ax6wtgvQ?=
 =?us-ascii?Q?5DcPb7+lp/zJVSw1xsmOvgc/fAjtOH8HPpbFuLDjfSJ4oGXGD8PR2eXex2uL?=
 =?us-ascii?Q?QcKXWnaGB8bR0+8NpqpDAZnsW8QgoTBqEyLj08Cz1/5hKOHUmWLvA6hRVudb?=
 =?us-ascii?Q?jpIsR3X4t0RqeqdKYb3otLZcg41JVs1/WEBNaJCIVdaHMpxbHGCkO79x+uMd?=
 =?us-ascii?Q?g8QTRE/1YjEjQcS8/K46tVgZTLUH7dyidm25qSPnSr4g5125BYd/QidsJl52?=
 =?us-ascii?Q?fss6aSp3fx7n0kHzvsvPiGw+agDQ3RLvA/gn5fX8cNzEomhNWkQVx8u5cQqF?=
 =?us-ascii?Q?x9UNvMZGjzRCb+ncIQ2oQIosGh5M74MuJq0vLFsPZAqAldhGx1EOM6TQT3uD?=
 =?us-ascii?Q?u4z2c7rjRm0+NILHB0KT7Sx2M61e1/meS/KY4CPYsSholnc6yNwlTCH5ItrT?=
 =?us-ascii?Q?lw3w3krIoWSb4lRAFkwAc1g7FBqO2BzRrSx2ReaHvoqli30Z2sy2HXFEzsXT?=
 =?us-ascii?Q?Tgf48zXXw2JztDg9GxhAstfiOclGmvrQxblPDCZJul/bxcV4aMnlvK5Yf5Xu?=
 =?us-ascii?Q?KVzj3zeMmjzP7wWfvU7Dy+WZfA2qTJJ4nQp1mvUrKYwlTcDu392JCnpTDaAn?=
 =?us-ascii?Q?e43z4G8wP88izzBPD1AbEoQNt0dfrEn0jCWCqOKzBBsfxC0toBuZHgw/gHuy?=
 =?us-ascii?Q?Nec92ODCyE3vgZra6Kn5VDF2nrjZBFzTZ+VrAUGDcpC3NgEXsZpFVeHQf56D?=
 =?us-ascii?Q?yeBPkmOypjpkvCBrj/VFuWRD1aPFUrRDLCMtw9MmMmVO6ooYm4ixRjVmaOeT?=
 =?us-ascii?Q?6Q/Li4m+YsLSUbk7XXT+vleHrvMrXwIKOaS8lwgsUXRkvTWgNCBjxLC5dQuy?=
 =?us-ascii?Q?FGXuGkI2VMhNHG2r3R69JahL/3Xjg2zB0LRrhDgCA3SZPWOXOMbfX+FEu0mE?=
 =?us-ascii?Q?1mwJXpybuCYaVyJZ3/mq2QXniMlW95NaAlSMgS3FWk/ERF3bmIw2xeb7XkjS?=
 =?us-ascii?Q?BB6Pbu0icoAgaDhv3FskoJRwNE31OZs91yBYJ32aqoP4VYhGqikh6wYrm6SY?=
 =?us-ascii?Q?lEopjG4HNcFkTpL8MZMUVTjmdzkAFckoHyub+MByAfcOfaT56Hjody9MIUiy?=
 =?us-ascii?Q?BrarFAdjW7qDxB3gpRl7xrLktQf9lg7U4DH/NRFlMI0cbIm09iPN7XcrQmIO?=
 =?us-ascii?Q?6AeBj6aV3kvoHmyT+DuMk9M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a23cb576-7d43-468f-6e80-08dd2f916618
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 03:06:08.6793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcsZZhLVsG/uqw3Id3EwRbEbMPI3E7EnuRV6v+1blJthc1Hxh3dBA5cAGbqmAsGkmkhJfCp1nVI6887t092GiDd6E5/jrBXFNsITc/kJOdYYLThD4MA5zpS67ZPlFkhr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11882

Some device want to ignore snd_soc_dapm_add_routes() error, thus
card->disable_route_checks flags had been added for such purpose. Because
of this, ASoC has duplicate code for it. Let's adds new
snd_soc_dapm_add_routes_with_card(), and share the error message handling.

We don't need to indicate error message on this function, because it will
be indicated from snd_soc_dapm_add_route().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- rebase to latest asoc/for-6.14

 include/sound/soc-dapm.h |  3 +++
 sound/soc/soc-core.c     | 33 ++++++---------------------------
 sound/soc/soc-dapm.c     | 15 +++++++++++++++
 sound/soc/soc-topology.c | 14 +++-----------
 4 files changed, 27 insertions(+), 38 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 12cd7b5a2202e..16f4a536cdf52 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -478,6 +478,9 @@ void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
 		       struct snd_soc_card *card, struct snd_soc_component *component);
 int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
 			    const struct snd_soc_dapm_route *route, int num);
+int snd_soc_dapm_add_routes_with_card(struct snd_soc_card *card,
+				      struct snd_soc_dapm_context *dapm,
+				      const struct snd_soc_dapm_route *routes, int num);
 int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
 			    const struct snd_soc_dapm_route *route, int num);
 int snd_soc_dapm_weak_routes(struct snd_soc_dapm_context *dapm,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 710c278e4f36b..01ce1c9366223 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1641,22 +1641,11 @@ static int soc_probe_component(struct snd_soc_card *card,
 	if (ret < 0)
 		goto err_probe;
 
-	ret = snd_soc_dapm_add_routes(dapm,
+	ret = snd_soc_dapm_add_routes_with_card(card, dapm,
 				      component->driver->dapm_routes,
 				      component->driver->num_dapm_routes);
-	if (ret < 0) {
-		if (card->disable_route_checks) {
-			ret = 0;
-			dev_info(card->dev,
-				 "%s: disable_route_checks set, ignoring errors on add_routes\n",
-				 __func__);
-		} else {
-			dev_err(card->dev,
-				"%s: snd_soc_dapm_add_routes failed: %d\n",
-				__func__, ret);
-			goto err_probe;
-		}
-	}
+	if (ret < 0)
+		goto err_probe;
 
 	/* see for_each_card_components */
 	list_add(&component->card_list, &card->component_dev_list);
@@ -2233,20 +2222,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	if (ret < 0)
 		goto probe_end;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
+	ret = snd_soc_dapm_add_routes_with_card(card, &card->dapm, card->dapm_routes,
 				      card->num_dapm_routes);
-	if (ret < 0) {
-		if (card->disable_route_checks) {
-			dev_info(card->dev,
-				 "%s: disable_route_checks set, ignoring errors on add_routes\n",
-				 __func__);
-		} else {
-			dev_err(card->dev,
-				 "%s: snd_soc_dapm_add_routes failed: %d\n",
-				 __func__, ret);
-			goto probe_end;
-		}
-	}
+	if (ret < 0)
+		goto probe_end;
 
 	ret = snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
 				      card->num_of_dapm_routes);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 99521c784a9b1..ea0c74f0df102 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3189,6 +3189,21 @@ int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_add_routes);
 
+int snd_soc_dapm_add_routes_with_card(struct snd_soc_card *card,
+				      struct snd_soc_dapm_context *dapm,
+				      const struct snd_soc_dapm_route *routes, int num)
+{
+	int ret = snd_soc_dapm_add_routes(dapm, routes, num);
+
+	if (ret < 0 && card->disable_route_checks) {
+		dev_info(card->dev, "disable_route_checks set, ignoring errors on add_routes\n");
+		ret = 0;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_add_routes_with_card);
+
 /**
  * snd_soc_dapm_del_routes - Remove routes between DAPM widgets
  * @dapm: DAPM context
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index ae2d6802cce05..37e7e1147c241 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1100,17 +1100,9 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 			break;
 		}
 
-		ret = snd_soc_dapm_add_routes(dapm, route, 1);
-		if (ret) {
-			if (dapm->card->disable_route_checks) {
-				ret = 0;
-				dev_info(tplg->dev,
-					 "ASoC: disable_route_checks set, ignoring dapm_add_routes errors\n");
-			} else {
-				dev_err(tplg->dev, "ASoC: dapm_add_routes failed: %d\n", ret);
-				break;
-			}
-		}
+		ret = snd_soc_dapm_add_routes_with_card(dapm->card, dapm, route, 1);
+		if (ret)
+			break;
 	}
 
 	return ret;
-- 
2.43.0

