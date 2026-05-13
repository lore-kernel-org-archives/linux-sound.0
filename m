Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011062.outbound.protection.outlook.com [40.107.74.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA9836165F
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 01:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636934; cv=fail; b=tavDYyMu6Ta56wZ22QcV68b3kgllTs0xLD4tINMQ7HGoknjnDVQxdt3Bf9acAmN5lWDOzdDyhG8gq2iZgQ3TdHVMwekALiKUpsYySycEFqx4RvLxAE5Qfjg0D/ZItg0UW/Fe7nfVqQomyJ8pHKO4+coIJ3ClA8LpJCgx9WW5di0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636934; c=relaxed/simple;
	bh=5WxSsk7ciWKL8pa96J5IoLdYMiKbLClGV0yiF2TA50c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YX4RD2WpnhWdbEeh0zfozfO6o77pvp7z9zu8ZS+N2TM+AYC7BQOXoXk+qfSnM3ZdQWzDXYAdTQm+BVZNcxOGLHJ96TrhxUBMTvEZ3Z3DV/vj7/TQv0lnxXwY9oAOImZJlwGLAexOjBuIi6UJqBln0YmicnKmyNPOc09uSHaIkU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=V3+IX0gq; arc=fail smtp.client-ip=40.107.74.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="V3+IX0gq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0zawC6h1UJxYJ1XIKpSZzBx4mOajmrSKAgAAbhQapFMLJ9H+gGoUfCCSRpeoQGJsOKDhQZkf30vkvAbjezOTPKmDK2i7vvUL18SRr7a9ASkkQPJZ2UYoOYJfO0JjdTptvxvq48BQ6nbrd9aP0vAKym29cJpu/g1Ros3eNuRJkAL19gcKAjvMhxdYXzIcXD0BKYje+JMhSX4JMA0D868fmd+9I2E3ZTgOk0eyyIqG2JInig+4SPcpcMYLwClIKCvjcMjvAdFG/CEVixDksggzcmwJP1vBiY2iMcg9iGwtDkwS1WceVPTqN59pdVFdU51XkZ3mJfxaqIjWXhg6H1F4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/il6e2l3fZsFYoBejDyzuPUqRu8nbG48sNjPdByKwNg=;
 b=X4sq05Ggt5uiFtLdbfePoOgaiQ69YE/FK8F7CBtCXFmiX2my/h9BoCzRKZB3lnbtwdpk2z6woXiKkcLicjpZOML6gj6WP0vATTUIUhrfXqckUb57Un38K2UBw7GLtGNHHKnZnDkQXIDlV9wDhPZ4hQPTQZPlRj1awiLf3uNs8tKcsucuO00KINju/M71TVnja8A9JHQQCerHZyrlk1c9cdAONB6DKsrN8hd8KJF0ZR+FCjEVU/ZYNH2KBVzTddJfUhY2aEQghe2OqsRJKPKGR+Ol1Upb6DIhfF0+d/pMCxVqGrxs2poYiwrOMTHjtM8ZJwWUZEZmdfDl9CNlPeKqrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/il6e2l3fZsFYoBejDyzuPUqRu8nbG48sNjPdByKwNg=;
 b=V3+IX0gqZXlte3Meejp2kae8s60xG9eDeId6hOMjmgbM8cYfYfGAqME1FZ4NEr+cwEISeTVm2XEfpaqdN9F+xSzDhCi5FdF2yi+0bNjLltSTwhDobbV4w1ydvj1aCDLYcqeql1ec9YTzWMR1y2Zm+vRFHdTrH9P1/9daS/7ttWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16179.jpnprd01.prod.outlook.com (2603:1096:405:2aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 01:48:49 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 01:48:48 +0000
Message-ID: <87wlx85bb3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: soc-core: handle card->list in snd_soc_unbind_card()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
	"Rojewski, Cezary" <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf245bc3.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf245bc3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 13 May 2026 01:48:48 +0000
X-ClientProxiedBy: OSAPR01CA0305.jpnprd01.prod.outlook.com
 (2603:1096:604:2c::29) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16179:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf6cac3-3656-4930-9a6f-08deb091c700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|56012099003|18002099003|11063799003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	TP49co0fLbtztcGv3hj5L6gxwZZGLpRgoE4Gz/C5e+AEZz2vsGQcSjTKn2OG/gO+IGYzqni3tEDRgItoBZkksgfFq1mGyy3DM+yETK9KmgYDF25wrvhH9xe85aXK2Y+hWdop2oTaDBshYMW8bluVwoUVb/0Jo02OjDbDdbLRzk+UIqiC5bpYnO70LCzoZvSngJogy7iYv3EKp9ynxBE6ydNPUg2jTmBMh0oPnb6qFjP4Kw6Q8a42HeiMGaNxsnjbwzfTdr4/ZXyKYZsQEJ4IDMT4gLQ6pMpTmfsk8LptS/j42a89pMhbvstXERHvipRxmlO92IdGxY0O7y5liEm9wOONE8OVEYJtrPX5agg6ju5XBo6c3Z2N+COmGeOyejs3hQGX4rQ9SWNaZrH9OagDezsF52RGgpu845B2Fy43BSCIkfucCpK2vAxeT9MkiPf7Avo3MqTBothcgtLsXA0rcQukrcVoDoLna43ChoKR4iC6GdUw77YEgUC4E63ZOqRaN8eS1QCX9xRy5cX3uE3L7g9P93IaUUVPkulj6btahq+t+M6gwQZTM6ONGWx1d7q77e+YMUE10vGP4gVw6tuAgP91NYlNWB1YTxmNer9VsIzGcr5z37Idzva2F1CULiJh8HCuILQuNVboedzbLDzYa33+pU/bn9TKLGn4zdkUMAPcWtq7PhpNIorRpc2Tzy+kh8rtbA8+0Hbs2V9gIRnI1n8PiTisP2LjGh2FsqSlBDh53GnxUXXYH4IViuB5x8se
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(56012099003)(18002099003)(11063799003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JC+ZCAeIzn3MqrmiZEtsvtYEDR9aM+y0M9zi14G2A0VIiDIrHV4clbGgMW1y?=
 =?us-ascii?Q?943eS7Iwxa1vdAFJVWTW2+f/6wAihaqjwfdlYOvoUqJhbjB1ZF7RYedevOHX?=
 =?us-ascii?Q?qfti29In5Q4tP2MG1GThvIged4iJRsJ827vj+Ye3hgkm5yggLz4xSJa3lPPC?=
 =?us-ascii?Q?7kUkcbR4JtA8ZLxfIsbcErXu13kpC08TeT8FZWKTU8PMkZGSaXkYooDADC9q?=
 =?us-ascii?Q?z0uZkTxNvrCCGEE2ormhtvltNV/uYZATPTorD3gsChW/a4sAj5gX6aQ8PFxJ?=
 =?us-ascii?Q?BLpY+yMg9Q5LeQgTUMopVrgFurV6uYqYtVzmraHcUpTiosZLKi6yTplhHn1H?=
 =?us-ascii?Q?AhgR80KrWdljkO3FIYLfZOCrQWwuU4BHrA5F+LQuoc1ApzHZtzSg14/c5DQP?=
 =?us-ascii?Q?m5XmFbLp47ErHGLVjjqbD4kbWNkWEZh56DjPCTmbRvRD6uNHZwSz6dgEgFCg?=
 =?us-ascii?Q?uFlSYFHDZnU9Z5WRPX0VM2Bbmcd31dm6+tgjSHEztRRW/y4iWB7uzcVKfpVk?=
 =?us-ascii?Q?IHeXinmDiZQV7w7Fkk7fHYOqfBFC9l21XcG9plLTKSEyMv49/+QcEFnQE1DS?=
 =?us-ascii?Q?4n1BRgBpXgAb0I3je0ypwmVBjypurE0OTpxT6Ko+9bb0sv5jG6Ve/S1aMeTa?=
 =?us-ascii?Q?r7ZKYEzrkDjSQmP8aOWKTY6uwpgCcdTYNU/dzEw4shneASgsD6AQAWpIEUN/?=
 =?us-ascii?Q?lQ+7ZVTVsTMbxamUCrHLNqqOIH3t4CgkKazPihYVEamZqQ8EmxjLpYp/mAHs?=
 =?us-ascii?Q?SrntyvnKqMltdJoMRjF4A1+svVUcN1SzDPqZUCowPcBfevdHKM3sEIRybUv5?=
 =?us-ascii?Q?TgQZ5hV4RojsjJ4claN2ITC8LnYPXHL18TNh08Ad7WCkZPwVSTehDo7HqvPB?=
 =?us-ascii?Q?42OkkC9S5/vspk3vajcBfPVG85xF2zYq9qrcLJeC1DdO8OhOEHvKMAAC60LW?=
 =?us-ascii?Q?taDI9K2AV6fagJizwMzWcgT3Ft2jveKXMljHIJYIWzn9BVu8lH8KmktaJ6Ek?=
 =?us-ascii?Q?amhMkks2XaayUOSaZ5o8vV5wAcNxt/s+KoBOOHI7kR0iHR6Oa97KbFzjYIcS?=
 =?us-ascii?Q?/jhyw+raaMaHZUGYHnleHEb+oik+y4Z+GOPI+j5Dqju9RPIAVYI9ALN4ydDL?=
 =?us-ascii?Q?TqspM1lgoCiSap0Xa6wq9y4fOS18od44JsruKEaKiHGioYw5Z7L9yWLOA6TM?=
 =?us-ascii?Q?p/qyEBA0mSim/EbewKWU8lHaMp8V9ooiift139MNoX2lQuRkwxi0USS+s/q4?=
 =?us-ascii?Q?cV39w07GkWRqPxGF6r4KJuCui2cnwkJHthOy5W1K8FkBejqX2qZxKmm3J1ZK?=
 =?us-ascii?Q?DTTPgGqswlW0PZgUAcX4SowdNziKjq0BY67iQ07cPxoQq7siryvC1LwkWvUf?=
 =?us-ascii?Q?blOLT1gf5dvYZu6xkVj6c/trsAcrbK+o5WqiihkUmKseHP/gyaRGAx0dohHs?=
 =?us-ascii?Q?8+ofrXPhr1BW5xQfr14bWIimp9XR8z2QOeB/mxVkrUkUBSVkgflIqsO+RA44?=
 =?us-ascii?Q?IMVqT2teZrFgIUQySVpIlBhvl0IAkz6m6JHldunijoKntHgvHa+bK4TagY9B?=
 =?us-ascii?Q?9eOZ2pj5/LvmAsF8tvT96idqLzesT3h27JwgWQ3vl6TyieC8Rl4if4pXrPXX?=
 =?us-ascii?Q?4fLEO7wCFQgkT+OV1bXTS4K7MwUuoF1S/e7JGjiK41WpCI/H17UMiVmTdwrW?=
 =?us-ascii?Q?ewg2fsvOSyVgIdTt5q5gHVziN1KJyUXbe9VZVBuT+8G9n+E60rIKnfBI62u9?=
 =?us-ascii?Q?MVFjsOJB5IVGUR8CNYLaAWpOPPX3blO0ps9Xf+qCJCyytqzd2C+m?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf6cac3-3656-4930-9a6f-08deb091c700
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 01:48:48.9568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9lK9mVI/yKrRAF0lKXGCpiiK42nownY29Rvd+xYuDoUQIN7tOt8qDlBGS+dxMfkgCgk9yhS2NvWJilTGFz24sRa4zOWQosJWwSVOYKJORvYaHFquoHN+2x4BXKmEbCv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16179

snd_soc_bind_card()   is handling card->list inside, but
snd_soc_unbind_card() is handling it in outside.
Let's handle it inside.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ae8467d88978e..8b2269ba67c3a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1990,12 +1990,18 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 	}
 }
 
-static void snd_soc_unbind_card(struct snd_soc_card *card)
+static void snd_soc_unbind_card(struct snd_soc_card *card, bool add_to_list)
 {
 	if (snd_soc_card_is_instantiated(card)) {
 		card->instantiated = false;
 		soc_cleanup_card_resources(card);
+
+		if (add_to_list)
+			list_add(&card->list, &unbind_card_list);
 	}
+
+	if (!add_to_list)
+		list_del(&card->list);
 }
 
 static int snd_soc_bind_card(struct snd_soc_card *card)
@@ -2439,8 +2445,7 @@ void snd_soc_unregister_card(struct snd_soc_card *card)
 {
 	guard(mutex)(&client_mutex);
 
-	snd_soc_unbind_card(card);
-	list_del(&card->list);
+	snd_soc_unbind_card(card, false);
 
 	dev_dbg(card->dev, "ASoC: Unregistered card '%s'\n", card->name);
 }
@@ -2667,12 +2672,8 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 
 	snd_soc_unregister_dais(component);
 
-	if (card) {
-		instantiated = card->instantiated;
-		snd_soc_unbind_card(card);
-		if (instantiated)
-			list_add(&card->list, &unbind_card_list);
-	}
+	if (card)
+		snd_soc_unbind_card(card, true);
 
 	list_del(&component->list);
 }
-- 
2.43.0

