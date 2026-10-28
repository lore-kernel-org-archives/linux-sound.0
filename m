Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156626;
	b=uddCeLAPmYj3yeAdy6H7fcx9qRqb/PoVmdSkcyoiA6Lzs3Yo4tEO1Vb76Fp26vpDqSMT
	 dmtK9RknYjgmuZ4SJHBa/6hspFNo0hBx7egeKHwMrIMABakj2RMSd8gzYczXX2WrgiE14
	 l2EJuEfgrd62i1yUDl1Go6fOmFdza0kyGGl2gTC5gf/CpcWQawSOeQ1n+wkq1X1IRUqJc
	 C3Nt6FgAYJDx2ghBOabXdKQKbfbADjHJes4+vodm4l76fnit8Ppjunhx6wXUMB3ppWcit
	 BHd2M39IU9QIPx3GU6l4bMO2xe3ZRKxRL0LdWrzj8szTIPSKPsfow+EQu2AU3He3mgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156626;
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
	bh=JjdU0Diz5SDZjmlEKzX2Mf2y5TsiqkguA8PWOOqSao4=;
	b=xyj0DPRY3d49o1WA6tKBNUzctsMftZHVrd7w9hG9e2TgeWV4SW9ZkJwMkxh3bks5piAY
	 aJztr4BOEE7emQD0ibvVMUI1qc02CqjAN1zDS03TawRfBdjQuNtv+735bnAg782J6YREi
	 d1Gvzx5+uB8N5o6Qul9fXIbsEODmznfh2kZrlSd4Q1+CA/P7d5HmlCdJhdvJK+3yd+ihA
	 G2IwP4HEaKs7JqgjZcqkOBENUImMrQfxXhT65F53YG70u8+1kuBnHnzkodTV25Wj43KpW
	 +N0wLHHSaDMo4VcoyLp+EwIeJH7TkWsD5o3U6LAoZsW1GZa+ls3q3uBjzaVsp+Z47gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=D+4YQ7lo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.22
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010022.outbound.protection.outlook.com [52.101.229.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE57606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEE57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=D+4YQ7lo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vo0kns7WYmDp/4qUmfn6H9iYCDcQuC5ScpGkDTkSjFNomU42xhXONW1vzsOh8/0Xc2u6HtykIU4SsZrzEflN8IHmZIgrwwEt0ft1hVpZII4MBYpstJvihUgYLWcPHQyH96kHFfNHn+gnqK8WzGoWU/Imlw2smjZSeLHX6aEt1XwL84K/fy7kgfYlb8gDrqSCrihp+HzpBTk5ReDZ3jC3p/9FpjFDyEu2bZpM7E8+kE3fmSdiDjS/gcaFH7mouiSWjE9s7nGfkRCoGtE85G6r/gsBY+IsXj3nfDpXGNg4QBn8p5+h9guhV0Ecpnr0E7GEVCtToTv0Kq0afHGJ56nMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjdU0Diz5SDZjmlEKzX2Mf2y5TsiqkguA8PWOOqSao4=;
 b=H0jbjo842xHmEGBdFdH449X5ua4K27x6vCZjMy8APFSkcu//hoRZ8WkNM7NvuqLAonOfb339WWs6Na3mYmvph9yVIodPK56L0ONuwDiZzFhINVAdtQ70B1mNaELBZS+v+IOLlpW3kLKyeIOPfltMBCoQ0Qjsa8scB6NwCDEcHtCm1+tOeBty0nsVQvGh7jvKeLXR8f5JLp8ifHcOqrmvGArMgsJ++BK9zV8YCt77ITgn2sj/kZ7vySaKdpLm6abJYYYgew4wSUsFAmEk/q6euaRAd0c7i391dLFNLZQQ1YmUqSZvywJlo/gWfHc/Su8mF4tDkEJ1PS8KxPKAA2dF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjdU0Diz5SDZjmlEKzX2Mf2y5TsiqkguA8PWOOqSao4=;
 b=D+4YQ7locGUjvW8f1ldTuZlW87Ga4o7cXyMiZ/zGy2WtFjit+LzwsEIv5d1hRjHfW9vSo36fc+S+dBcTn4jcRtjKy2SV5D3aVmvV2XNqHa4QF5266dOohRhsk/be8Az4WEg+Yx+DRQ6u1ZPcrJm7LRc2SM1XUvbbaJQQ7qt1zGI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB6650.jpnprd01.prod.outlook.com (2603:1096:400:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:03:44 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:03:44 +0000
Message-ID: <87wlr2sf00.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/15] ASoC: soc-card: move snd_soc_card_aux_{remove/probe}()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 03:03:43 +0000
X-ClientProxiedBy: TY4P286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::8) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 62209c41-877b-43c9-4dfc-08df34a0139b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|56012099006|10067099003|261026140227099003|18002099003|22082099003|38350700014|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Tr1AuIf5x00wkVWkeClByKrOJyyYFpggSYRshMZi9jTQKxoXmQ/ZLByg1Ln6ATl2zjPLxtzpVMUF1vKn9l4prKZ/O1S9TAT8RRAWvVeFxGd9F9+16ytBAgWoAnBiKUoMSeg+XZKJ2Bjf4BpnRh3pVUfkkKCJjb7UOHsGWY4INILfLkVfAUkOmDJ4WeixtgoUZ1zLcCa5od/5a8Sbq6NbFj+VJIFUNO0TyO04vCtwjxEl2bH0JTYLu+V3wuCragWqrJUG53/WXFBLLtSenFjZRSnAEXohJXKy7wTso8XBbzohg6lafg4FksJD+ULeOI8q+bOplseG1NWvn7ZwN4jnkpWZI8lKG5DcOlkl1+Ou8D0dc++3RVU/0iKM73mTJf7mv6YdTz4aCXBXgrGtGD3OQHnFZliiOUNSWEVctaRGL/6ESMiqcuV6msjh6Ew6KLOLuDwm83cwxMRTOvfFjB5e0IJ3MzWnlUbolSVQVUCo0yPbwIFbFMMZqky7dTt/7hiDp7WYIDt1bV+d/qCDeOeTqRWftHW2heBSaGJGWgihpFcCYVDqxOSQJvCHGwvDarcPk2wc2qLoHJwkxOVjnPoHEa66XSKWiOHTKYZAbDSOcE181CYQg5UBcqZDGXv1WH4YCpqoNbdRcmO2o3py7pMmZJXXDyAT/SDYRqZJd3m4lrwN7pWfe9GQBlj1CDV9X8hgzVdWNQLNue+p2vJMVZcRfOx8hAdEGuuiqNCSGTt/YZM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(56012099006)(10067099003)(261026140227099003)(18002099003)(22082099003)(38350700014)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HsMkkWlEW7MWEoOKD4HEf/IvbWqPIvhFm8q7Sh7wCUmFbonSyJo1L1n+iHzW?=
 =?us-ascii?Q?ARgvgOkYVPMRjil734LXG1UHKrUXBwATkk9Sqqit8fjWia/4U07ryaSNrOe8?=
 =?us-ascii?Q?LFE00nWBMrUg28g8eCuCSpmcGcmZFm5a3qZslJT362vUKlAKi8TPjfrePd+K?=
 =?us-ascii?Q?PxgDz7ySRIXvHTecCJBwIqLlzszStSXqd6XCnGZ+t7ApLZmITEZtbM8tzxpG?=
 =?us-ascii?Q?tJgJzHEhgE8WAGCSQEmfgIlQ3mVEdYvp9teNdaL9JYFK2niWG3bFtgHnseJ3?=
 =?us-ascii?Q?oHI73quQAGb6Di18lBZIjhp/HR/eTsnyZX/+zisA5oyA/QfinfppZLcH8xZd?=
 =?us-ascii?Q?fbznqSARTuthtXiPhuVzgq1yE61cZN9AlX3lxT7RKwRfYcShsGer8prW/3PL?=
 =?us-ascii?Q?cBSmPr0kONkSPgXivX9ezCYs7Wv7Hvudf3A251yAZV3XleWG+mTovW+SlmC1?=
 =?us-ascii?Q?jbSZdT36ZljMQlPCaF/YiwwmLKP+zsBu7RYSRTpI9aIdv/+kjiktxxaYf1HD?=
 =?us-ascii?Q?yV5dCp0jNWGSnB2JDLoM9aIHlHqt4/+gDs0EtLK7D+Y29VSHh6lKUlyPcgIw?=
 =?us-ascii?Q?w1uup1L030dfGU5yRUlZXeuCF81KKC9m5tEV9luWeCT04fl98TtJ2ECk9X3o?=
 =?us-ascii?Q?VAAaUiDJtg/qvDVi7agQIUTDwDzVkHB+8g1Om/IRd5CFYtG3CVJka9C6sczU?=
 =?us-ascii?Q?fsaRXCamiXYuijxso24xvK8qrveVWlzuxrCQ3H6sbyku1/rFgivJiThVgKJS?=
 =?us-ascii?Q?qANc20RdkQ/zFC6fqmjw0rLIY80lgLWMZyW7JWPtAdz9zFQiQ4uCTDw+OGkP?=
 =?us-ascii?Q?gfvANqLYF9McNM8mDg3RRsTfgJPQVoof7ExwJLhk4ZH9i/lHJMKSbysr2TuV?=
 =?us-ascii?Q?11+ajrAOISwT0JBfnbszYYw7u4iZzw0Sj7dNLyoUHJ0JBMtcQ5L4sKAVXslz?=
 =?us-ascii?Q?JtmkTHATwN2w8vHg72YgY937hmwU6Ef7CCeTlsWqwvbqiz1nJNh9mGY3f2bc?=
 =?us-ascii?Q?6jNMblMsRYXgBaTlEzdlu5xLccGw2drh2f76ga61SXtu9GvkaqfRZF7KN+6L?=
 =?us-ascii?Q?4g+ieVrFz1NFaNsESIkxq0VKBKb3T+qzcrckibv5BQlHVFqKx128xFUfR8dn?=
 =?us-ascii?Q?nat/mja2JZXEoDWRNLZsx6wxvsEh8GqG+NdhFX9YpPrWYc7V4AbYY5TL3STj?=
 =?us-ascii?Q?92hO1WNEWtpEJMtAKq4VHTkLRslpu6wXlmrS7qtNTHEZz2gByTODksw+LYa9?=
 =?us-ascii?Q?9ULFgLZHDZ87NhoS4TPpXdF8TIMovAsXIdXmUf6/uVM5kLfIKbudE/AxQvAi?=
 =?us-ascii?Q?RN4XOmB74Ny9rrZQihXHyvP1kMqCv6TR/i28V4GvPVwSIFZS8MSJc/jEmdtg?=
 =?us-ascii?Q?HZcyj5b2Ajd2LnrbTRFimtlKQlDd5la/RXhug9q4ERSm/BFEV393JMz02XDM?=
 =?us-ascii?Q?+xo11LjCrSlwmUwdH1eAJcH44f7hFTINwT/81VALPiDs4RbPPxw5QLkrWMVo?=
 =?us-ascii?Q?dinI/HPAYR2rDAnJ+P0jKFKxj66nfF84zesH4ySU2LELre4qhHVFq/JG0Iii?=
 =?us-ascii?Q?Ixycrxn37qyt5werVil13UGEXqVXR/t1Ct2ZY2NBftp8QiUstriro33d/GV0?=
 =?us-ascii?Q?u56iMkMa97vcQYnXh4uFWYsKrLp0zXo2RvfdfNxgmMm4DDBy1Uf0+B2S8G5L?=
 =?us-ascii?Q?vr42CmMNG7fkAsgHCj5Z+k4438reX6nXloLLPlnW6N6nnftS+yFjL0UWJHOQ?=
 =?us-ascii?Q?KPTJZRpHdADctCfBiRvFOpP+qlVE03OHH5fRn4ikGhfnkJjbsOcc?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62209c41-877b-43c9-4dfc-08df34a0139b
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:03:43.9848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KOHvdG1dxqBw1HBh/BR39w68l+TBZT7lKZiqSCeM6MM9LAGHIcnU/fijJTxX1vwyR8quMvCUUZyXZM+HAxxNQX6iE2jURJL2BLeoSeLrV5sMk/ZLmqMVrmBAeE3hSJ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6650

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

It has too many local function dependencies.
This patch uses temporary funciton define at soc-internal.h. It will be
removed all funciton were moved.

It renames function name
-	soc_remove_aux_devices()
-	soc_probe_aux_devices()
+	snd_soc_card_aux_remove()
+	snd_soc_card_aux_probe()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c     | 33 +++++++++++++++++++++++++++++++++
 sound/soc/soc-core.c     | 37 ++-----------------------------------
 sound/soc/soc-internal.h |  2 ++
 3 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index dcfecec486570..432882471537c 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -267,6 +267,39 @@ int snd_soc_card_aux_bind(struct snd_soc_card *card)
 	return 0;
 }
 
+int snd_soc_card_aux_probe(struct snd_soc_card *card)
+{
+	struct snd_soc_component *component;
+	int order;
+	int ret;
+
+	for_each_comp_order(order) {
+		for_each_card_auxs(card, component) {
+			if (component->driver->probe_order != order)
+				continue;
+
+			ret = snd_soc_component_probe(component, card);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+void snd_soc_card_aux_remove(struct snd_soc_card *card)
+{
+	struct snd_soc_component *comp, *_comp;
+	int order;
+
+	for_each_comp_order(order) {
+		for_each_card_auxs_safe(card, comp, _comp) {
+			if (comp->driver->remove_order == order)
+				snd_soc_component_remove(comp, 1);
+		}
+	}
+}
+
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name)
 {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 0e25700688696..2b47186640a1b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1075,39 +1075,6 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(snd_soc_runtime_set_dai_fmt);
 
-static int soc_probe_aux_devices(struct snd_soc_card *card)
-{
-	struct snd_soc_component *component;
-	int order;
-	int ret;
-
-	for_each_comp_order(order) {
-		for_each_card_auxs(card, component) {
-			if (component->driver->probe_order != order)
-				continue;
-
-			ret = snd_soc_component_probe(component, card);
-			if (ret < 0)
-				return ret;
-		}
-	}
-
-	return 0;
-}
-
-static void soc_remove_aux_devices(struct snd_soc_card *card)
-{
-	struct snd_soc_component *comp, *_comp;
-	int order;
-
-	for_each_comp_order(order) {
-		for_each_card_auxs_safe(card, comp, _comp) {
-			if (comp->driver->remove_order == order)
-				snd_soc_component_remove(comp, 1);
-		}
-	}
-}
-
 #ifdef CONFIG_DMI
 /*
  * If a DMI filed contain strings in this blacklist (e.g.
@@ -1408,7 +1375,7 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 		snd_soc_remove_pcm_runtime(card, rtd);
 
 	/* remove auxiliary devices */
-	soc_remove_aux_devices(card);
+	snd_soc_card_aux_remove(card);
 	snd_soc_card_aux_unbind(card);
 
 	snd_soc_dapm_free(snd_soc_card_to_dapm(card));
@@ -1513,7 +1480,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	}
 
 	/* probe auxiliary components */
-	ret = soc_probe_aux_devices(card);
+	ret = snd_soc_card_aux_probe(card);
 	if (ret < 0) {
 		dev_err(card->dev,
 			"ASoC: failed to probe aux component %d\n", ret);
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index df3c3cb783fde..ffe055e1b2de2 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -29,6 +29,8 @@ void snd_soc_card_link_components_remove(struct snd_soc_card *card);
 int snd_soc_card_link_components_probe(struct snd_soc_card *card);
 void snd_soc_card_aux_unbind(struct snd_soc_card *card);
 int snd_soc_card_aux_bind(struct snd_soc_card *card);
+int snd_soc_card_aux_probe(struct snd_soc_card *card);
+void snd_soc_card_aux_remove(struct snd_soc_card *card);
 
 /*
  * In soc-core
-- 
2.53.0

