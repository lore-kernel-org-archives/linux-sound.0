Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE00C1DFF7
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 00:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772584249; cv=fail; b=BRka+8aSQ+5LxmpGWiAqenD97TAZmp++EJ75VITLccXb3Xwj74gq48bvhJPPslyFHhlkj6FmQnQLkv+3GEmzLQCRjzh/SlJ314ZM+b8VTIRCXhQG6CyX70jboUpaoZ59h6LTLgJV9R/aGn7qzZt+yQWDDNOl5FoeRHB45uQ0KJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772584249; c=relaxed/simple;
	bh=iPTbd2/Lc2EkBSMTeqt9G/pX5tzHajbrBx6KMAqWFrk=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=oyW3wMA8zgaGbIGrgH1ga1W+0jQLid+1Y/VpG2IuyQSqd4R5DaOlT/8e8b/kVaryEyISaWP2BCr6m29+NO6y5KNpe/3zyWnlAz2WjclubEEtTMImIhOu5K+rX0/2ev7R8C5VEasyY9XgxcRg99RduXlUbyK2xBzUqkVQESGNyc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=M0ULdoOG; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="M0ULdoOG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUg8i3s/P2Lt1O0ZB6YTLUGSVGSROqdL2W19X1S+FaHeGgDIDZbTtdjZS6TY2Y5/g1jvD0c3jbZqhyz5TdsXp6GsPFzrD+jDzElOpYMy9gf1EVRpgAviPzuhqjXZz1oLudgaBMrIu+LUNq59Lf83pg5ah9XGw6dfGcCEtu8fU8N7naoel4GeN88jI05zGhwdQTjzckLrDiTxyimZqqx9qFeamqXSDL0t8qZn7yH5JL5WIEnzQJwWyS8jxw0C0c4C/VfL9dw6XGC6kbPYWJbvusyY60F8LV80olPH7ax6i4yLV9bUoD6mXKcyXQZm2rkHjoxdmtbIAGN1LlNeymVQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4LFLOAdw+W7d8CByZhAFYgtxHHNIbeX8p64ivPlTJ0=;
 b=wLIxuR1o0lDwGMq0HMa486ql+/zkAPfSW8KeJaahK5HAC1GLtNet8jSeMyRELDyRI9r+yW1sveCvHXgpOmQpLL/37AOki45cV3nT5gohQe2qUMMAnzCQ9uuOcTLZj/35FAZlDmzsNBUNnk4qlqMziVndbXi0Gxem2Z9D/bIeQ7gCyFXIJJiFmZbdsiKBZ+WipsK48zXthN002G+RJaMUvX/ZDT7WSqS77pSyk0YPgELqEpbKdxDnliyuLY0hzQRbWp7U0CAAwWV4BkhFNFlyKHcDjxJVxpu5suOq89M0OTOHFRKr8dS1CSyiAN000Ah8omaSz0wGvA1V+U9uClyO5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4LFLOAdw+W7d8CByZhAFYgtxHHNIbeX8p64ivPlTJ0=;
 b=M0ULdoOG265qRwLoyLa6k49PoPTYDq1mkJA436Fw6XVIMtSAaytpyuSTZju52cZA4Kkqzrhlq+A5PXYD8srUnBpn4jKe68jLoW8hMtiZZXO6Grw5oN4eNnEJgiXePwehOSGWCc0Bz1IWjm7UzFBHuOsi7OVtQkSzGVwSH62rypA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS7PR01MB14862.jpnprd01.prod.outlook.com (2603:1096:604:398::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 00:30:42 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 00:30:42 +0000
Message-ID: <871pi0qvv1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH][need test] ASoC: core: cleanup card rebinding
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 4 Mar 2026 00:30:42 +0000
X-ClientProxiedBy: TY4P286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::9) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS7PR01MB14862:EE_
X-MS-Office365-Filtering-Correlation-Id: 490b9db8-827e-459c-8f45-08de798544c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	2thA4svZJJdEq8CYtc7htM7LQMbLrbbMQNzQZmwRwQOGt+5AfNIQZ2vOG/Cfco/YFDuhirngg2E8CDh+twxtPyuavVkdju8DX5zrbEIahMHR8NIohtcIEMhSMGg0BG36nNp+2ZnSCTjcUX8SM/ME3t9CbGy31vVYxwtqOp8VfsWGaUeYeRU9uehKsG//ARbfGQaDnA3skpMmqazpEhG7cFK2qha7FBFl/7JStzAQ7TYdafEFTUMBvohovnW+NyL1vfQa65SbFoTiCl2w361l4eBz6CI16GZYCyfBfa5FvIbNW9SqEREpij4kZPjWJEAOBZFhZCtXxy56QvG6Ii00wS3l+3/Oekch5SuFfJ+5VV/v7BukWPhY5fyCxInvHSIZBIT2i/EXBvSzd/9BvZgVnNEl+0CoDyAXG9uojh91xuSHNeYn+S9+1t2uDaANPk0t25GmNBHxVmctDC6Q0s7cg4wpKOSUCkGbqxTHvgsWhKShUmAOQkVmrsEzd2Cp6mIz6ceO/5L9QbQjWyopHmrKiWluhXpcgPiTXf1NVZSxGlJmfw5aH+mviEyvZgqA8W3TjYgicSH/LxbALY1RsJ6BeFeIrV8RYVU8xAecRP/oSI6U1IGVVfTbGoDs7IFaotNfymoAk1Q3MWDmbR1IdVxdIhn8b2zx/RxGFa4rgsp0+ZNgoozScxD4TE8OACjQS/RzxF75TGZokmFiKDpu63y+F9etGG3vjb22KACBd6dGYQXZYKPJTrv89UPlpWn5iIHX1PfOr2S2W+BIIGzgvj9uOsp01SZ5Rs+Eqrn1j5XvICM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?QggZd+EEXDDkyjV5DClDVpNqnMVfWHBudmIpLIFKTPs5yWP5Ezt20dw7V0?=
 =?iso-8859-2?Q?1/OKQ45qKsXSCHYBefCFeDWA+eh9DCpbbCuY8+lJ0/cN7SZ1bSpFPEb3Ci?=
 =?iso-8859-2?Q?pAPAn2u5/IyxQopZL5upuWHj5Clyv9e8rwpwDsvrtz8y8kdaNqKxE0BY9C?=
 =?iso-8859-2?Q?iE01Lc71d4kVYuuvBE6Hvo6kmECf3PZl3QT+9GNCqI9uGVS4ssRp/lq38Q?=
 =?iso-8859-2?Q?vRyBrRJULDCwns8KANzCDqcCwyGotnO5WAkes0WMMHLDf0q1JuUQlqHaGQ?=
 =?iso-8859-2?Q?ySMXZ6G5ffcYqLnqUHv5dpqjLhTNx//qIrDX7ei27VyNjGmExfEomo8k6z?=
 =?iso-8859-2?Q?W3DhzNRkqeNHvbVRfC0p8y3zmMxAGThimYfP3i7yogU/4T/0kPIcKoF8To?=
 =?iso-8859-2?Q?XZrWA7Z+6sPdL1VuZezT0R7i6+pCnRwHAkZUHF04ADxsHo2IVB0GCIGcyF?=
 =?iso-8859-2?Q?kaaWM9SdwF9kM1RZGUlHA8oB54l9fSICnsbAOwQo4SV1KYTJGEYz+HzYDc?=
 =?iso-8859-2?Q?b33t+IJGcV9okAdQeAlXKMTegNeeJS8HNGS3I4WEy6Vg/JszohUiegRqMB?=
 =?iso-8859-2?Q?LbER5JD+bF2Jp/j8emIXKlItGJVvbO/r6BA+qd0KV1htrMAX4EVkMZ6qwN?=
 =?iso-8859-2?Q?wk7B0YV4xNxpQ9/Rve6WpQ/Ut+m35hXAMM4SyrR+0VHejRQaEkD191FhIc?=
 =?iso-8859-2?Q?6HP/FLhK8f7HC7PqpMUCE33xUXM3oqH5CpOMk9zyol7703yuyrAVOaDySO?=
 =?iso-8859-2?Q?XXXi7KfvwMYVRCpxAQHACcsYRhJ9YverPP/IRrd49/QgY8Kfyw/kCulfrR?=
 =?iso-8859-2?Q?fVuSERaKDC3/fGhKUhG8Fm/nnr/gbTpv+q0ieFNjUbGZGypv2BwhYJJfbM?=
 =?iso-8859-2?Q?MsGRLmFtNGV5etB8H8rGWmgk9A9iEoObJZm9TXc6tGSnFqP5LqY0akGyz+?=
 =?iso-8859-2?Q?DnEGvYbBTPLxu5PNIS7mbnQWlA2yzQ4UYqq/QUtfSnv5jqWZD4lZ6TAKzv?=
 =?iso-8859-2?Q?IMf7Kimgx1Wqe8mQsZS5NEc5QdDr2lqcWprDIqU3XGK3H7Nvikw4OoDsgv?=
 =?iso-8859-2?Q?fY6etfDJR9ebp34N9slLNdcC5DeZVZvLiYG0iRztsapMIhpaemkB+6czEw?=
 =?iso-8859-2?Q?y9TQDAuoEqObnM1tqk+PIBYNEqps7x8YTix+r1hCuNSawc6L0hnQqKVqeY?=
 =?iso-8859-2?Q?jtP0HGg1dqpcpxKD5WuNaHLA+Jtis68J43pmHsuLU3QofCM4cyz2/Tiv/x?=
 =?iso-8859-2?Q?/B1EzFVeYtWlCJfDbksWq4UfVKEscJYxD39qmPOKXYpzaDoBZKyE4TBzoC?=
 =?iso-8859-2?Q?kTn0hAj+xDHmu67FzBb4x5C4HCKYd/06k6/Jv2+krezL6U5OWgXBCbvDgp?=
 =?iso-8859-2?Q?LiSL7igjMVPNX6QJpuNnciFlO4dRs8n184F9CzvWElrK/0uCohmUEXEakO?=
 =?iso-8859-2?Q?8kQvq8RFOKe2SzdQGspExnH52bL/Wqe5cme0zW8VKle/0mlMcIOA+f57hS?=
 =?iso-8859-2?Q?uWFVOYy922QQ00uBgSJ779OEdBaK9W9NIyzGyUF2ycKQJMVHiAT49gD885?=
 =?iso-8859-2?Q?JpVr1bRNDVwfBMmF72Bqrtc04Nb+yd3z9b9Fz9m+uujpt+bG+N36HHCscd?=
 =?iso-8859-2?Q?VZlT6yUAlBTTS5SDcAUA+YH82gSlmIUhTpSyiaNbhhReayUJ1+BmdGfD1L?=
 =?iso-8859-2?Q?uX00pkDGcH8/FFbFUvCqjlQEeUOO0PIRxjGilpvJxQWvIERujPNWXPaK2b?=
 =?iso-8859-2?Q?O5u9HAwqXC15ml+lrb/+0qylGxNuoZ4mzCbPBJ0DSw+h+qHDNbpdxmNop9?=
 =?iso-8859-2?Q?LPDtIzrl0caSPdGP/OvXSO69vuVUD4ntnojcFvKvbOSQ9M6uqumY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 490b9db8-827e-459c-8f45-08de798544c4
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 00:30:42.6367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQAXdCBe3k26S7SRlvYZd1M/4IBoeft6IYuR9g9ngyIuQ1mEAyO0EmJRWW3G0GIznhVC4TM9aMurQ/nDybZU+iLujH3dASd6qgWZXON9K3weR+aGGow/rC2hIcGKBfac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14862

commit a3375522bb5e2 ("ASoC: core: Complete support for card rebinding")
supports complete card rebinding, but it uses unbalanced pair functions
It added devm_snd_soc_bind_card() (=3D bind), but its inverse function is
snd_soc_unregister_card() (=3D unregister), and it adds new
devm_snd_soc_register_deferrable_card() (=3D register), but it doesn't have
inverse function (=3D merged with above inverse of bind function).

Thus, it is difficult to understand, and difficult to cleanup soc-core.c.
This patch cleanup the rebinding code.

The rebind method to connecting to "unbind_card_list" is merged into
snd_soc_{bind/unbind}_card() which are used from all drivers.
This means no need to use special bind function
(=3D devm_snd_soc_register_deferrable_card()) to use complete card rebindin=
g.

When it bind the card, and if it failed with -EPROBE_DEFER, the card was
added into unbind_card_list (=3D snd_soc_bind_card()).

When it unbind the card, and if it it needs to be reused, the card was
added into unbind_card_list. If not reused, the card will be just removed.
(=3D snd_soc_unbind_card())

Because snd_soc_card will be capsuled soon, separated from mutex_lock()
(=3D client_mutex is soc-core local).

It renames function name. Will be moved to soc-card.c soon.
	snd_soc_bind_card()	-> soc_card_bind()
	snd_soc_unbind_card()	-> soc_card_unbind()

All Card user will use complete card rebinding by this patch.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>,
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
This patch needs Tested-by from
	Cezary Rojewski <cezary.rojewski@intel.com>
	Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>,

 include/sound/soc.h    |  6 ++-
 sound/soc/soc-core.c   | 90 +++++++++++++++---------------------------
 sound/soc/soc-devres.c |  7 ----
 3 files changed, 36 insertions(+), 67 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index a30f95ff7d86d..a14bfebcb55dc 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -425,7 +425,10 @@ struct snd_soc_jack_pin;
 int snd_soc_register_card(struct snd_soc_card *card);
 void snd_soc_unregister_card(struct snd_soc_card *card);
 int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *ca=
rd);
-int devm_snd_soc_register_deferrable_card(struct device *dev, struct snd_s=
oc_card *card);
+
+/* REMOVE ME */
+#define devm_snd_soc_register_deferrable_card	devm_snd_soc_register_card
+
 #ifdef CONFIG_PM_SLEEP
 int snd_soc_suspend(struct device *dev);
 int snd_soc_resume(struct device *dev);
@@ -1088,7 +1091,6 @@ struct snd_soc_card {
 	unsigned int fully_routed:1;
 	unsigned int probed:1;
 	unsigned int component_chaining:1;
-	struct device *devres_dev;
=20
 	void *drvdata;
 };
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e70bf22db5c91..ed18845ab6966 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2144,17 +2144,24 @@ static void soc_cleanup_card_resources(struct snd_s=
oc_card *card)
 	}
 }
=20
-static void snd_soc_unbind_card(struct snd_soc_card *card)
+static void soc_card_unbind(struct snd_soc_card *card, bool reuse)
 {
-	if (snd_soc_card_is_instantiated(card)) {
+	bool instantiated =3D snd_soc_card_is_instantiated(card);
+
+	if (instantiated) {
 		card->instantiated =3D false;
 		snd_soc_flush_all_delayed_work(card);
=20
 		soc_cleanup_card_resources(card);
 	}
+
+	list_del_init(&card->list);
+
+	if (instantiated && reuse)
+		list_add(&card->list, &unbind_card_list);
 }
=20
-static int snd_soc_bind_card(struct snd_soc_card *card)
+static int soc_card_bind(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_component *component;
@@ -2306,53 +2313,38 @@ static int snd_soc_bind_card(struct snd_soc_card *c=
ard)
 			pinctrl_pm_select_sleep_state(component->dev);
=20
 probe_end:
-	if (ret < 0)
+	list_del_init(&card->list);
+
+	if (ret < 0) {
 		soc_cleanup_card_resources(card);
+
+		if (ret =3D=3D -EPROBE_DEFER) {
+			list_add(&card->list, &unbind_card_list);
+			ret =3D 0;
+		}
+	}
+
 	snd_soc_card_mutex_unlock(card);
=20
 	return ret;
 }
=20
-static void devm_card_bind_release(struct device *dev, void *res)
-{
-	snd_soc_unregister_card(*(struct snd_soc_card **)res);
-}
-
-static int devm_snd_soc_bind_card(struct device *dev, struct snd_soc_card =
*card)
+static void snd_soc_unbind_card(struct snd_soc_card *card, bool reuse)
 {
-	struct snd_soc_card **ptr;
-	int ret;
-
-	ptr =3D devres_alloc(devm_card_bind_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return -ENOMEM;
-
-	ret =3D snd_soc_bind_card(card);
-	if (ret =3D=3D 0 || ret =3D=3D -EPROBE_DEFER) {
-		*ptr =3D card;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
+	guard(mutex)(&client_mutex);
=20
-	return ret;
+	soc_card_unbind(card, reuse);
 }
=20
-static int snd_soc_rebind_card(struct snd_soc_card *card)
+static int snd_soc_bind_card(struct snd_soc_card *card)
 {
 	int ret;
+	guard(mutex)(&client_mutex);
=20
-	if (card->devres_dev) {
-		devres_destroy(card->devres_dev, devm_card_bind_release, NULL, NULL);
-		ret =3D devm_snd_soc_bind_card(card->devres_dev, card);
-	} else {
-		ret =3D snd_soc_bind_card(card);
-	}
-
-	if (ret !=3D -EPROBE_DEFER)
-		list_del_init(&card->list);
+	ret =3D soc_card_bind(card);
=20
 	return ret;
+
 }
=20
 /* probes a new socdev */
@@ -2576,17 +2568,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	mutex_init(&card->dapm_mutex);
 	mutex_init(&card->pcm_mutex);
=20
-	guard(mutex)(&client_mutex);
-
-	if (card->devres_dev) {
-		ret =3D devm_snd_soc_bind_card(card->devres_dev, card);
-		if (ret =3D=3D -EPROBE_DEFER) {
-			list_add(&card->list, &unbind_card_list);
-			ret =3D 0;
-		}
-	} else {
-		ret =3D snd_soc_bind_card(card);
-	}
+	snd_soc_bind_card(card);
=20
 	return ret;
 }
@@ -2600,10 +2582,7 @@ EXPORT_SYMBOL_GPL(snd_soc_register_card);
  */
 void snd_soc_unregister_card(struct snd_soc_card *card)
 {
-	guard(mutex)(&client_mutex);
-
-	snd_soc_unbind_card(card);
-	list_del(&card->list);
+	snd_soc_unbind_card(card, false);
=20
 	dev_dbg(card->dev, "ASoC: Unregistered card '%s'\n", card->name);
 }
@@ -2826,16 +2805,11 @@ static void convert_endianness_formats(struct snd_s=
oc_pcm_stream *stream)
 static void snd_soc_del_component_unlocked(struct snd_soc_component *compo=
nent)
 {
 	struct snd_soc_card *card =3D component->card;
-	bool instantiated;
=20
 	snd_soc_unregister_dais(component);
=20
-	if (card) {
-		instantiated =3D card->instantiated;
-		snd_soc_unbind_card(card);
-		if (instantiated)
-			list_add(&card->list, &unbind_card_list);
-	}
+	if (card)
+		snd_soc_unbind_card(card, true);
=20
 	list_del(&component->list);
 }
@@ -2909,7 +2883,7 @@ int snd_soc_add_component(struct snd_soc_component *c=
omponent,
 	list_add(&component->list, &component_list);
=20
 	list_for_each_entry_safe(card, c, &unbind_card_list, list)
-		snd_soc_rebind_card(card);
+		soc_card_bind(card);
=20
 err_cleanup:
 	if (ret < 0)
diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index d33f83ec24f27..c6364caabc0ec 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -83,13 +83,6 @@ int devm_snd_soc_register_card(struct device *dev, struc=
t snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(devm_snd_soc_register_card);
=20
-int devm_snd_soc_register_deferrable_card(struct device *dev, struct snd_s=
oc_card *card)
-{
-	card->devres_dev =3D dev;
-	return snd_soc_register_card(card);
-}
-EXPORT_SYMBOL_GPL(devm_snd_soc_register_deferrable_card);
-
 #ifdef CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM
=20
 static void devm_dmaengine_pcm_release(struct device *dev, void *res)
--=20
2.43.0

