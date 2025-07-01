Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011056.outbound.protection.outlook.com [40.107.74.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE2B748F
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 00:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328645; cv=fail; b=B7o31YZhmob8MXerj7Umapd7g+5c0nGrheludFD3saG/0+BbkTAYCi/gBlErSlS9QQeztkohGTkotPxIRALdxTfpNfq6Q47tK6zadtB29hf7tNsTg4N+p4ynOoi0qbv3PHdUFJDDQxRqbfETKY4nQQE4axarhhfyVbEKgOMNGrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328645; c=relaxed/simple;
	bh=nmUgxHUsDoyPld9jKCrlXioE+at3X5fnoIFPfiZfziA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cu2zXtQYMy0J/Wxa/wCWOfWhdY6uViYPozODJ0vjf2TkrNpfCoFgwuQzTwgupWw9i98KLuM5GsPZKT2jxe/ToXgb3sts/LZ3kpn4ajjljsZkS7XaImkgkILCd+q446DmAjtGCE7qDvpjcFfMuIUOrzNI5G6tz7C0WiZqVdhXbGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U5hC0QnO; arc=fail smtp.client-ip=40.107.74.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U5hC0QnO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUzkvKPsbw3qtNorPBpQf7uho5JPN0KK7wnCUgCfiwlf23SD5oVb2H+FKz78CQQoqTxhRBlMhNZGVN90ro7G9pReDEtyAhO/y6+WOQBUXbKcyvlX3E5Br61OPVN+cT0Foj9B3XCJ1LfNtPLj5Sh7Vx3Y9bqXC7JTkNoVHV/IiEckPgq1bKYVfbn2udKLb50dOK2sM53Yv4+reyKztfRcJ4sgm12oLNjUN4CGoyTx4XU5bZZps73w7EUtka4JGCQNydmpIxqS1xaXuBb6U9JyWq1obu0yJRh6pf4vXk9f2pjbIOSuAnMeASfwL3q0AqiPCuoMubtuA/OOI62M7nhppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+i7eMD7+3XeQ9lzrvZrJi8Ss6GLgKt9jL8p+dw1VK0=;
 b=h1+dUOqAMkccovYTkSnWIZooM6BKsoifXBC4E0JR5biL96Kr7j0SrzCf++89tXsGdCiFq+olph59Bjz5M9k/LNQfehiAmqtj9YQKAZX579sKAMIXuL4NrxEfaOklEFAhxkciwc+/PuYhXf8Nby9bBZkQD9SaQh6JQqtoTNPjHKy7V/jDf/ZmpJEIYJT1yzTrvuPJWOaPF+LsbXQ/3hViFgymNvydl62Zvlv+jcI4+imn9yiNF5RCM1C08oGjad8THuoxfcDdvr2qvs3sDIqJRRTq+BvtRBD3DbxKz0Pg8TnOseJiUmyOi8uupve5UZVlyx0zMQBiulhrluaQ18AOHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+i7eMD7+3XeQ9lzrvZrJi8Ss6GLgKt9jL8p+dw1VK0=;
 b=U5hC0QnOt1s2FItRAr5nUFMW/jwHALuiiM/AkkjUVhJMC+Pdwi8Aw68568BJxUipP1N8W/ySiCkj1hX4DzxztxyWQLenxtdMWtQ2aBnTt5+YDp+dY2qSwmJBRu6RmEsrnfHfJ0KmGMCuRzlsRw1SQd2M3Vo+lTPTmNWBukj6c2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12421.jpnprd01.prod.outlook.com
 (2603:1096:604:2e2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 00:10:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 00:10:39 +0000
Message-ID: <87sejghitd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 04/11] ASoC: soc-dapm: remove snd_soc_dapm_weak_routes()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Jul 2025 00:10:39 +0000
X-ClientProxiedBy: TYWPR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12421:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d8a8f6-b087-47e2-337c-08ddb833b613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x46vSCjx7TDnvUQJqr1nZ+lTW0sy66kAnSVPaFeSIMIbZbZJrF9dZzkMt6tk?=
 =?us-ascii?Q?nyjf6gKcj8CsJSTXriZx4sNUxvdsWgtu3wuiH0bardcZvnqVfREQFzxBGN7e?=
 =?us-ascii?Q?xJqHqjBGcnJ6UT/+ASXDvgC+UKqwcktKeAp/MN8CYYi9Ag0qyxbTgheQS/pP?=
 =?us-ascii?Q?h2VrzIAOJmGbkbBmvEfIvvv29dDHeof2UEy2NcPvTPtCaqyOLytWpRKoResm?=
 =?us-ascii?Q?/jMXjs5Alys4eBzdBeNVkou4P2YpgY0FzdphGCCm5mpodh2EI9K201eB85qR?=
 =?us-ascii?Q?CjxUbu5LJNHzBeIdIz8qY8KOyIs9QzIl65ywNkjPzCGuVik7qXwh7nmf8/1V?=
 =?us-ascii?Q?yfVWrtjIsen+OJ6ECTYwGUiQJ0gU8gtlIQTU8J18899JsUB4Z9V6qy9/w7ah?=
 =?us-ascii?Q?KaYuGXoGOTLubUHHV5ik6NBGs0ePhay0VzvSBguEbM9tebQRvzhWGzCy5lHZ?=
 =?us-ascii?Q?+u1FSpYdNdKCYmerF3+9zL2iXunYRce+K3djMGcP3KnB3n65ESzIVK8mQWhk?=
 =?us-ascii?Q?2UQRRnIhbhBFPPjQHICArVtX2pdJ+FyWsfBYtOFHVtaO1pSAkpBMErAZRj7g?=
 =?us-ascii?Q?9AzRS1KIq9CDRbqIVaMZTyNNuBiDM3b8PhRLe/LjQZTjDkSoRMv7i1O27Q8X?=
 =?us-ascii?Q?xnOvCOXrg5sUFHFau39hCCHbn9TpBFNtwYZT+uBCjT7/HKj/XhmOg2dOcYwA?=
 =?us-ascii?Q?D8JYlRvtlKPPuuN3fk1DCH/owAckWja72VCQegkNnnEuHqdbX9hJBhmcYXoh?=
 =?us-ascii?Q?ZYPHu158kwp2egqaTxZQ2Kaf75h4tYlGUGGVXeiuPSKJUFgMy7SEykYfmhZS?=
 =?us-ascii?Q?dG0EgkjM7P3XC3t33DleazD0sNYhnrobdLa8ERdWPLX2uD9LWdkZMg1vgCjE?=
 =?us-ascii?Q?9DN8QOUH0Ef5XpuK/+L93WZl7WFTsTAX7peIYjvwbbqjOUFOPW9uHLe0RUD+?=
 =?us-ascii?Q?Ufwg/7ZXkg+0RNw6HvQc6lnxpgZX1RYZtR4aX5dWtN+ExOKG1MYxTbXODvEW?=
 =?us-ascii?Q?LlgCJDQqhsf0MGvCtEyZj3s7lZ/TFm26WTIZgsJ+dsQVraaibAXm6AwlNGZL?=
 =?us-ascii?Q?u/cRdhlyOFzjqZ7MXbQM35lI71Fiu7wF4UXq6pmfj8ue2A4rniNRT8eROAJE?=
 =?us-ascii?Q?++/uyuJl8Nl+YA5fR5eGscfirW7ot6txfQFTus1niFT1Q3vip2Kg7AFjN2g7?=
 =?us-ascii?Q?Idn/iS6j/pYiPU9rp9BOZJag52k7zl10li/YAS6eBbX3vTMAhv85OoiEUnoS?=
 =?us-ascii?Q?PD+Oi+nD0qO2dLydFyH4rEzOZShnitTllxr4EUlRbRq3gAaVJhvLzzvO0iSS?=
 =?us-ascii?Q?AJ+i1bIZ1kLJ9/OXP4PSAX41nhb6MNd2Ij5yqcBUcEr3aauEwhVY1O9AGGtr?=
 =?us-ascii?Q?AtqUhw2876uf+EQ4ShedVshlxFtfunFXQ5yleNk/w0JN2uV25gnQk4nw5Wkg?=
 =?us-ascii?Q?4a+mwDZZ5oIDvuTm5/5AyRxwKw89IJfq+bSBYttAi8LbWPW/GZqpig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7bYA4RZYm+cBuoxrnE3uZQq+/4YpjttGbTjw++R3i0tXLPpzAtPb6iBx5wrQ?=
 =?us-ascii?Q?StYCPFJLhvsE6JYL85VvfEBNTaexlWiK19OdOBMBqbx1td5vFVP5LkHQ/Gbe?=
 =?us-ascii?Q?upFQ5vaHIePlgAE5h05DHXHmsie0VWkfI2BQgiUKvRtBITcR7EoIUwXSkcDC?=
 =?us-ascii?Q?jLDQ5GbFUS6iYgFr5tmxals26jXYcQkLnoPAgzAfCas45ciCVn4znFa+ePOl?=
 =?us-ascii?Q?SAfF/yIlKFyvRg+f3HfDdhqOZOd1eRKd6V4w+gV1HWiybo2fczJ9TLArmtQ3?=
 =?us-ascii?Q?vF0q+Uzy9+ULnqEgalwjYHe9qdtJgJdoPkqYf6rf303ze8NoPoQE4bJnyMiw?=
 =?us-ascii?Q?FdGqoX2GnASQruBiafEn5K9oGbmsH+8GYFvsnC1LiZ68p1fSu3wI6KUzv4I5?=
 =?us-ascii?Q?jzUNq502MPfScdcL34Nzki/VVHSvoKjdcOTkgXUFrYUyryjHzVWqKLyPeMGu?=
 =?us-ascii?Q?VDTnH93XI7ZZNkm/OJW40g7VKPZgv1Vd21+/TyQGMLSNXF4lskiDrntE0WuH?=
 =?us-ascii?Q?eBvNWhXcJvsdn5uNU7gfg2y/st6Avmx85ELc9zmsRvF2h41ODRj2+Hn9h4SH?=
 =?us-ascii?Q?4t7tw6wDHsd3yHCl2s7LFk/Zr5xZBkiKVO1d/z0opqP+iSJOEZnSdX2Y6nSC?=
 =?us-ascii?Q?HxIOiWnnXfKJezFjMwPfCHWxnBrdM9xiH2s2v/zhr1Vg5FQ4Mc+mg2jU21pp?=
 =?us-ascii?Q?bD9k4dYoz70SesfvGHm/HsRytbHMIxtvMsa8Glj94d/KNrl62tgXLQfl4Oj4?=
 =?us-ascii?Q?2edvYwkso2jQ9KGUcQievACF67n4ntxUnZ9docTbKn45VDtgW0oZA0d/hXGQ?=
 =?us-ascii?Q?XzWRBvXdKfCTpAh5YUfIA2Jfau/fU0+Ask8z86cXFkifA0fiV7aMygrwRyun?=
 =?us-ascii?Q?09W3cBP6/ucylddR9uw1SFXKa3D5V+AbnRo4BsL/+OnbiKIs4LzfDSF/OfMf?=
 =?us-ascii?Q?s3E7cUuAShQqEEBStUCEvGF+J3HTIQaVOaEQEdY8VCpg5Ddm2J3ymCZ5JjAr?=
 =?us-ascii?Q?5xhZnT4Z3R7Ej2zfHq+17zDTi66xjRpOP04ctYUzRYEdWbytqjVbLiGpoEec?=
 =?us-ascii?Q?x/vwm5wXge9YNklL/8+7IzaVblNo3qKAo3n9sj4agP4cehnxwRY+gzpgKqwi?=
 =?us-ascii?Q?MmehPjno23oQ3Re7RXBoxml+Ipxgw49gMXOJUJYUT8ATDFYRVK/8t+qIQzN2?=
 =?us-ascii?Q?DLQv3g9YADQFStboby6o5d6UksTLsaQ8u8B1hWE5uaJ7UdmOl7RIQlPulzka?=
 =?us-ascii?Q?vBkhhlELqDyVj7J8SCbpMzBx7D2glbbbdmJRwDB5yg587+0mE60cSWPItxcq?=
 =?us-ascii?Q?+a1dPBuVynxsb79rlc9tMdrwF04ftR/4gvWcUzxl94h3M5ReML/vNKjY/3Kc?=
 =?us-ascii?Q?Kyu8M/9utDIU0mbKMjN7xiBeAsh5TPVb1/jfP8Ww7l6qWa1lYa+EbMmH4OkR?=
 =?us-ascii?Q?SL4JZyfNccghih7kT6RsIylBVeqGS9Sju9EPwEnn0SCDpgXod9bqfMukhZTG?=
 =?us-ascii?Q?tdX4Fqsx0ZuluCR4B52Bn8HlZ1Jf8zrOSFLlZJAPNhMRh+DHUNV2sLT2Ojno?=
 =?us-ascii?Q?Dlgl+RJujJWxQ+wWwWc5JxtZezypmI6U9JgC5HZYunJYfU7fNQTEE8oVaUGj?=
 =?us-ascii?Q?DfDYKUwOwepz7DaxCrzsaOA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d8a8f6-b087-47e2-337c-08ddb833b613
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 00:10:39.6088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZiiqyZN4B4Ydw1zP1ngtw3aE/V3md4oegTlkJZJA0yu95lsMuMS028Z+b7TcgqJ+yGIcMkyYdjxjB3n8pwP40ipV19GA6Q1eC1F59x2xx2lgKDgEWCqFmjFihoHAmTW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12421

No one is using snd_soc_dapm_weak_routes(), let's remove it.
Because snd_soc_dapm_weak_routes() was removed, path->weak is not
needed either. Remove it, too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h |  3 --
 sound/soc/soc-dapm.c     | 91 ++--------------------------------------
 2 files changed, 4 insertions(+), 90 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 2a0250fff9ba..6d854c727bca 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -473,8 +473,6 @@ int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
 			    const struct snd_soc_dapm_route *route, int num);
 int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
 			    const struct snd_soc_dapm_route *route, int num);
-int snd_soc_dapm_weak_routes(struct snd_soc_dapm_context *dapm,
-			     const struct snd_soc_dapm_route *route, int num);
 void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
 
 /* dapm events */
@@ -611,7 +609,6 @@ struct snd_soc_dapm_path {
 	/* status */
 	u32 connect:1;		/* source and sink widgets are connected */
 	u32 walking:1;		/* path is in the process of being walked */
-	u32 weak:1;		/* path ignored for power management */
 	u32 is_supply:1;	/* At least one of the connected widgets is a supply */
 
 	int (*connected)(struct snd_soc_dapm_widget *source,
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index e4c2feec6e39..79cd3c93a4fd 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -214,7 +214,7 @@ static __always_inline void dapm_widget_invalidate_paths(
 
 	list_for_each_entry(w, &list, work_list) {
 		snd_soc_dapm_widget_for_each_path(w, dir, p) {
-			if (p->is_supply || p->weak || !p->connect)
+			if (p->is_supply || !p->connect)
 				continue;
 			node = p->node[rdir];
 			if (node->endpoints[dir] != -1) {
@@ -276,7 +276,7 @@ static void dapm_path_invalidate(struct snd_soc_dapm_path *p)
 	 * Weak paths or supply paths do not influence the number of input or
 	 * output paths of their neighbors.
 	 */
-	if (p->weak || p->is_supply)
+	if (p->is_supply)
 		return;
 
 	/*
@@ -1162,7 +1162,7 @@ static void invalidate_paths_ep(struct snd_soc_dapm_widget *widget,
 	widget->endpoints[dir] = -1;
 
 	snd_soc_dapm_widget_for_each_path(widget, rdir, path) {
-		if (path->weak || path->is_supply)
+		if (path->is_supply)
 			continue;
 
 		if (path->walking)
@@ -1217,7 +1217,7 @@ static __always_inline int is_connected_ep(struct snd_soc_dapm_widget *widget,
 	snd_soc_dapm_widget_for_each_path(widget, rdir, path) {
 		DAPM_UPDATE_STAT(widget, neighbour_checks);
 
-		if (path->weak || path->is_supply)
+		if (path->is_supply)
 			continue;
 
 		if (path->walking)
@@ -1454,9 +1454,6 @@ static int dapm_supply_check_power(struct snd_soc_dapm_widget *w)
 	snd_soc_dapm_widget_for_each_sink_path(w, path) {
 		DAPM_UPDATE_STAT(w, neighbour_checks);
 
-		if (path->weak)
-			continue;
-
 		if (path->connected &&
 		    !path->connected(path->source, path->sink))
 			continue;
@@ -3202,86 +3199,6 @@ int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_del_routes);
 
-static int snd_soc_dapm_weak_route(struct snd_soc_dapm_context *dapm,
-				   const struct snd_soc_dapm_route *route)
-{
-	struct snd_soc_dapm_widget *source = dapm_find_widget(dapm,
-							      route->source,
-							      true);
-	struct snd_soc_dapm_widget *sink = dapm_find_widget(dapm,
-							    route->sink,
-							    true);
-	struct snd_soc_dapm_path *path;
-	int count = 0;
-
-	if (!source) {
-		dev_err(dapm->dev, "ASoC: Unable to find source %s for weak route\n",
-			route->source);
-		return -ENODEV;
-	}
-
-	if (!sink) {
-		dev_err(dapm->dev, "ASoC: Unable to find sink %s for weak route\n",
-			route->sink);
-		return -ENODEV;
-	}
-
-	if (route->control || route->connected)
-		dev_warn(dapm->dev, "ASoC: Ignoring control for weak route %s->%s\n",
-			 route->source, route->sink);
-
-	snd_soc_dapm_widget_for_each_sink_path(source, path) {
-		if (path->sink == sink) {
-			path->weak = 1;
-			count++;
-		}
-	}
-
-	if (count == 0)
-		dev_err(dapm->dev, "ASoC: No path found for weak route %s->%s\n",
-			route->source, route->sink);
-	if (count > 1)
-		dev_warn(dapm->dev, "ASoC: %d paths found for weak route %s->%s\n",
-			 count, route->source, route->sink);
-
-	return 0;
-}
-
-/**
- * snd_soc_dapm_weak_routes - Mark routes between DAPM widgets as weak
- * @dapm: DAPM context
- * @route: audio routes
- * @num: number of routes
- *
- * Mark existing routes matching those specified in the passed array
- * as being weak, meaning that they are ignored for the purpose of
- * power decisions.  The main intended use case is for sidetone paths
- * which couple audio between other independent paths if they are both
- * active in order to make the combination work better at the user
- * level but which aren't intended to be "used".
- *
- * Note that CODEC drivers should not use this as sidetone type paths
- * can frequently also be used as bypass paths.
- */
-int snd_soc_dapm_weak_routes(struct snd_soc_dapm_context *dapm,
-			     const struct snd_soc_dapm_route *route, int num)
-{
-	int i;
-	int ret = 0;
-
-	snd_soc_dapm_mutex_lock_root(dapm);
-	for (i = 0; i < num; i++) {
-		int err = snd_soc_dapm_weak_route(dapm, route);
-		if (err)
-			ret = err;
-		route++;
-	}
-	snd_soc_dapm_mutex_unlock(dapm);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dapm_weak_routes);
-
 /**
  * snd_soc_dapm_new_widgets - add new dapm widgets
  * @card: card to be checked for new dapm widgets
-- 
2.43.0

