Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DDE3FD943;
	Tue, 21 Jul 2026 01:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598014; cv=fail; b=tpm9BmSmB1NhLG3B4SwHrl4o9WvPMXnmfqdMgR+A7LgLSIbY+XQb0RI6XGB/Hl+FgTPL7RMlRN3ZUsjIpwa+mtV/mo0FCnjYRUGvYnCuGodblToGXI5KCO6jNLL23HY0qgbkFnPRtkPgow+2ZRs6iW7ThoeFK2QEPNQve2o28xI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598014; c=relaxed/simple;
	bh=YBByylLj7C3J1nbTRskPYDKLicggqgo5UVyHBmHNxbM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=o+6JM1wjXG22uOrhAe6CqllG0bdRltwzz7jvKMlgLY55eW8OdCUDRf2ftgh2Ddwfw5YZEV4783jnFMN+FcnehrrJ7PnxirLGdg969luSXYTCJQmhladmiIeOGayH71aOUPV2lYZ3hCjTdS+0QOIzk4qf1IMzfUfwoK95TtT3O/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FbYduqGF; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FbYduqGF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nR8e0Yuq3WrVNqGa7kCXjoEfCMeiYMZZHh1L6AtuduQObdqOPun48QbK1qUc7eJuH7K1qUOYpbHw/QX0gMxw1kdQElI6ff9mRBbWJuLBj+KASlpRrWeZn1TSkzPV5oFeHwt8xswCZi4JI7yYYCa7qPrbarBkLYukwdw5UPaR3OvMa6UYZ0Y60Ql+h6fxQfEV8VvfD8eV+xyZYA7lCW5/0SVA6paFH/sg3T6t7ZMZoGrjLXZHwVDuba6Tz8nd6Drk/Qii4d253mKm0/vv+jscODRIdZ3s/mhkGrE2+bT/1uQ+hWWrJC2AqLCpsWWjzJXqh9eTzCiVrv97bBL/aYpaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8cbXxlJOfgICsqMCrjExuKA8ekOfsjzjy6Nb0A4Z+g=;
 b=ptbWXFGWPwkeycc/xxXF3/iTELdS/Nu6KMzHN7jV5KUydtofp3boImSe7bZGt+cwaNQ7ZV/stHNBZw8us7F5uobgKKvYlDG3rnMP5Bz2LT6ePVl+mMTx3am3W453feEBhTY878nkBxoQdunAqhVI9WTuIDP+avaAm/PE2Wztij6V6gRRbKVKyNY7D8TuxdTP8O2N2OC+JzqllihMiBeCNgXvwCCf4o4VYDS4xuMI2HzcyHFyR70APniv75ZGyvzuG/oGUmqLU6BM4BgyUv76K9w8/qh5iTs1sb5yPSh+sDq2EttuCkIiQP1OfAxJW2Ceu29m3ukD+sTYWXkLq8J9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8cbXxlJOfgICsqMCrjExuKA8ekOfsjzjy6Nb0A4Z+g=;
 b=FbYduqGFgVCjCsOBDLuAEwLkmVY+dO3pnc9yK5u9e/u0RH6TP/+ab/ALyjnwQRfZlN9LP+nkp/srOHnEBvt4yejnhF5u+6fjlQHVkMWaR6Nv02Fczo1ptCASdmglM114WjMG01sLmhdwI7PfUBOwVvX2gEp4rKqrAKUrqBk65VI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB13531.jpnprd01.prod.outlook.com (2603:1096:405:1c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Tue, 21 Jul
 2026 01:40:11 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:40:11 +0000
Message-ID: <87mrvli0hx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: qcom: storm: use dev instead of card on storm_parse_of()
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
References: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:40:10 +0000
X-ClientProxiedBy: TYCP301CA0047.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB13531:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb4b8c0-085c-403f-8912-08dee6c900ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+Jjwr/v48TOFoZkBFMkCT5/Ivky/VHn6az3aviYGcgwLz2af00yDKa0dieTG6ydtbEao+0qloRIvv3u5eiq6DyqtE5PrQxZGOU4JTzLb6nrH7lD+dWLLazCjXcgrtAJSG108V6AU+S3Bq4+1+VSA9tOExQizYZhnnU/KtodSXd7nS59kNlUpnSTb9kMI+Z7l+cjzoBEmXobmZA7X/s7Fbxdd4P+jXWlTWtqRuA8PTL9gltlUWRV6Bx4S8pXMtBMi6DqErziqU4W8XXAb81WIebAJsBZF5UP6l8IpQnYfk4ENiFZmv8wp4l0RKNmchz8HsokjQ3Iw4ZlaUWGdpPS11bPFRfZwLciK7Lb0BpZyImSN6y0Jz/5FiBcs/Y9hYUY3PZSvYkJiscBvGrsWby+JB3wmRddjssOM9RL2CCH9OrhUYE4hjXmyloZzxu/BurfuijoDdMJa9IQwKG4MVhVF58FuGXlGJenjplXCZD7vb7rui4BWugI7xfHdEdgDVlctcp8V9SxXM+694BNLDkeRkMnXLWghK6Px6Odf1Qq76xnu1G+vgfhDl/b3cR+7JTXBTz6NnWHOHv/1vz+4fX+ZavZsxae7tTpzc+2yLUdbKf4+XSJpcvuC+7sVsuT6FZoRYh+pMxZgMaJTW3ASblkkGr9o0AR53T8FTJPfupsW+SkdSChtkI04QhvY47qP5JKpaqbgOm2Obc2mhg/BMldRHcRSVMqXQ/EZZAi/3GBFLS0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j3mDG15/SqFwcSlLQnDH0oVDofEnpFTRV04wN8cAgX/iCQQ9ReNbYGwtxirt?=
 =?us-ascii?Q?h/aw1SuyJdEqDNHgTfsJtC0fCoi1lp2WlEHeg57jfIGCzVPtUyG+P7P3Onzh?=
 =?us-ascii?Q?aQy8eart7frZZKCzPqkYCeK2UO3jFyXPXYzpc97kQNDe7KPX8k/PQF3DFHSk?=
 =?us-ascii?Q?NgeJsWFWgISq0Ymvyh9hRmSvy23MJ+qyQmdl44yMnmbTe1J0yEiu9GBGhCho?=
 =?us-ascii?Q?M0K/cwamxoThj7nEb8HVirVYSw1B13Xw/LBElw/DJ82uUn/5poAs0hxvJ17C?=
 =?us-ascii?Q?QopNI9E5xOgwcB+4DLX29FL3pF59quss3FZhAjxmw1uSW6Ju2QAX6g2ms9Vr?=
 =?us-ascii?Q?W26pe3FKemAjcuX06BzWyj1CyowE5Jh5lMTJeoKUkpM1lS80SDLyo/H2ZXLs?=
 =?us-ascii?Q?uS/OoeRXh5F7VnPwiuDXqeaymep8olfNBkV9ipWKTZXyQ9LDIo5yXXRQmni/?=
 =?us-ascii?Q?ZA+R407NIzMqBuDDXIaAqUSfB+SCZkKRPFqAuVWRc6Sp7BO9qCK/kSg66oGf?=
 =?us-ascii?Q?I1AfLjdxjvsUDH6gEuF7/hIS1Li0kxRCTKip1DcxVuBTTwU1u81h0JEqGNlK?=
 =?us-ascii?Q?XQZRD0w4ao3QNuq02Po104RjOiAPK4l+BegNMejJopOyIW8BiF0oTf3dPUDa?=
 =?us-ascii?Q?Ts1CVdWyfdfIM33cWunfPGDvFq8yV5GBPoqxPq+qEbfm/qq59lYuOppC5TrY?=
 =?us-ascii?Q?PKpeb5wcjALysYT8W5WEqkX+0Zvy9D31Ku8IJK9C8No4ZHSAvW2UGEuqY4Lq?=
 =?us-ascii?Q?Ccw1lI0DWYKg5PJbNLzxtFfCKg1VkfpIBn0uo2qKFATLEjaUS/NnaVZNCwn3?=
 =?us-ascii?Q?wmbEDHrptqk6qH3Z0jKa9MM36iL/MOmU45IJ6YcF3qF3Aent/3nRLnI/XcZl?=
 =?us-ascii?Q?a9GQZq6aL2IdpI8ryXN9hH3Kh+cObR+sdaPKUeSsrk6I/lJzW0XphjUCXnWq?=
 =?us-ascii?Q?yCT79Bie8muCGsnnXb+Gku1YZD/aBkW4fdBs8De8G3KHXddd/HSV+8HnVt2u?=
 =?us-ascii?Q?hCyL/r01B/PDkT+yuUTLugq5UJhp3VyyBx/+DP43V09ODNGak8VIG8CrcA7c?=
 =?us-ascii?Q?6iC6pzhStNk7IfsgsnLWTMAmTyr7gnGY7yPt4juoO04vZ4vdYkT7xT//qEJj?=
 =?us-ascii?Q?fjygsz143tEaT9aj4UG6/rAn37lHbdWb8qofZ6v048sY+KfI9ZKXjH4KYPeq?=
 =?us-ascii?Q?ZtpeIOA5ZS4YWiLXnB9jiWtHAuUdKZI9wOAQmOtwI7krUZUHgvhkt4qHzigG?=
 =?us-ascii?Q?jH3v7URZ4JQcUEFpZ4XjxHNTDuowFAJlvm7L5uLKsl2w0607YYWkJfaVkKsq?=
 =?us-ascii?Q?IyS295UmTMv1U164Jl9lWU2cQduSb8/i1xuBYVNf54VN9KzK2m8wKe/QDeN2?=
 =?us-ascii?Q?cH7OMLdePsB+TJR2kIWfi518Uylin8oxKyDTmZdU781q6B7h3anhQpDsSWF4?=
 =?us-ascii?Q?l6Tg/QBFEQaVkXWUjLqDinw+oxKwl/YdKZLTsJTb68UwBZoKX0skmpnYC0YB?=
 =?us-ascii?Q?lI3X1vkTPAlX15IORrRR0Snet0TB96abbh1Ssy8zyfh7zdhvI2LOPk4OIw2P?=
 =?us-ascii?Q?TRijwO1Vykc589Vi4rGq/JtYvg7pNr0stsROkCCrbRoadgj1wIASZefpSqHa?=
 =?us-ascii?Q?tSS1A0h4SUBptFNV6o8syOOzDaAAj+xY4otMH9N0MWo1Vvo9V4fppXO93zP6?=
 =?us-ascii?Q?VhGnNZuvft9RuLP+eIfpBDqJiWU9igk8ElkQ6wMvWkUI91m8d1R5NWZebdRW?=
 =?us-ascii?Q?8MSx5MjpIhCQwIjaNuJ18g05YBgkj8HCUkJMaN+Dd9hmZssxJd9L?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb4b8c0-085c-403f-8912-08dee6c900ce
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:40:11.0910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JuEXrdZ8UjdWWQWsnaK3tXP07vWP29Y36YdftVAXT6mmde2J6hruIuXv5r5yrhzxOsW5BePkxxMXgt6giluf+PoE2EfthF62PF7J+L8YKVV4ZnMncWnOeFyc0k86KvfL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13531

storm_parse_of() can be processed without using *card.
No functional change, but is preparation for Card capsuling.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/storm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/storm.c b/sound/soc/qcom/storm.c
index 1e0eda8c24c4e..6b42fbfd27ca5 100644
--- a/sound/soc/qcom/storm.c
+++ b/sound/soc/qcom/storm.c
@@ -64,21 +64,21 @@ static struct snd_soc_dai_link storm_dai_link = {
 	SND_SOC_DAILINK_REG(hifi),
 };
 
-static int storm_parse_of(struct snd_soc_card *card)
+static int storm_parse_of(struct device *dev)
 {
-	struct snd_soc_dai_link *dai_link = card->dai_link;
-	struct device_node *np = card->dev->of_node;
+	struct snd_soc_dai_link *dai_link = &storm_dai_link;
+	struct device_node *np = dev->of_node;
 
 	dai_link->cpus->of_node = of_parse_phandle(np, "cpu", 0);
 	if (!dai_link->cpus->of_node) {
-		dev_err(card->dev, "error getting cpu phandle\n");
+		dev_err(dev, "error getting cpu phandle\n");
 		return -EINVAL;
 	}
 	dai_link->platforms->of_node = dai_link->cpus->of_node;
 
 	dai_link->codecs->of_node = of_parse_phandle(np, "codec", 0);
 	if (!dai_link->codecs->of_node) {
-		dev_err(card->dev, "error getting codec phandle\n");
+		dev_err(dev, "error getting codec phandle\n");
 		return -EINVAL;
 	}
 
@@ -106,7 +106,7 @@ static int storm_platform_probe(struct platform_device *pdev)
 	card->dai_link	= &storm_dai_link;
 	card->num_links	= 1;
 
-	ret = storm_parse_of(card);
+	ret = storm_parse_of(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "error resolving dai links: %d\n", ret);
 		return ret;
-- 
2.53.0

