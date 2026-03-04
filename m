Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FD437E317
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 04:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772598389; cv=fail; b=Xx08YkkDvVcMfvAYf0vMShns9NMeH8lGI9WGytYbxKDPaKBrrvWLGwQSvqW9WHij7r/8b5MIkumcFIH5mHuz2HsbThnJ9V34CMaTL+KJvxdGvuzOhR8MuOMTwzI3iis3LPVQnQEdmAJuuygOad9pLok/AMIFvuZYGxMUpB7UiUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772598389; c=relaxed/simple;
	bh=JF0ad7Dk36bNwTIrncks1veRsfcG9L0U95xWNfW0bbc=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=D47YItI95ryc9utocb9TmK2PTJfRqgoZqiKan4Gpq9HbXzhvb60VqLieVhrTW8MNsMEzzUjxG3VsC8NEk05OfNFVAWlSMWb1bCGMFSUBf9jo/eOwmC+jG0OoGmZ48TwtgXdWegzikA6U/R6eY7CFCYPL7utOBT+HWmue/Xg8Bmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jYMDDG49; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jYMDDG49"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miBXc5nyzU0U5fp2DiDA6/18B1i3q5ywblPhVRGcW0KArsQE+K2R85RD5anK2i3S588xttpt4zpyPD8iHubIF85/13CTnB06USMMPEZi/Bi4OxMQdEgylhuvnXZwZ7EvUtfPaamOrEGKv57O7kYlCu1JOCZsGAG8glwFgGIPHrLktY+0oJQ/x41HYSZviN60PEvWLqU/UkvssxLUb9ltLwKE7+7mkq0nOw2CYfF3ivUwySNUJMixj3JzsHwbqlmqL+SNKQhD2oqjpR9i/APFxJMvkrwJfsvu/3+yAE6eNTaJEcN3/uVXN1XDItvnueXLuBihonkAFebP/RHyIolbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHT2PsAZ3BsYzVIeRrfMe90vXh2nOLTtGe+pu79+RaI=;
 b=LhQb0qhIQ+qTfQHxpWPR6sxRqfmv3IwdMlLlKDYvq/+sfQEGKC9TZXQrX368FJ2o2cgc5+QL1ysctnA888duJB/In0drBjNLuoXCeyxJKtYDs5AjgeKB4qpUZGr8ktZYyOzjjJMVIg3OmJ6ih6oQBWhkqR/U2uRZNm/lHwYRzG13I1ybfjZ7ts5xIa/IKJu0at+X2iq5oFc9IdQ4aQQoXa2PGAoU1d/7Je/DtUoxgs8ES3jUg3hEynbp8h7vnDudrYkZhsUrzOFfSUA+xl2HyfURhpxg10PU2+F0RRCUyWcTU19ZCd+hpmX6kOxmm+z2g8piAbOcDpVFfEP07A0WVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHT2PsAZ3BsYzVIeRrfMe90vXh2nOLTtGe+pu79+RaI=;
 b=jYMDDG49HdeapzcpJm9DJobEnVBM/gQxIuv8xnsfSqBalaNBuUzCS9M9R3TRGeTG36AkIp+c+CNQyKN3f73G4AdjkMVQg1TKN4uzqKIInud5+DeWbmn3i822GAjfPXUhUJpo0r1mLTWVueuT9Kh+I1Ns80LbVKbQ/xM1evNGdM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TYWPR01MB10805.jpnprd01.prod.outlook.com (2603:1096:400:2a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 04:26:23 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 04:26:23 +0000
Message-ID: <87y0k8p6ds.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2][need test] ASoC: core: cleanup card rebinding
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 4 Mar 2026 04:26:23 +0000
X-ClientProxiedBy: TYCPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:405:4::35) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TYWPR01MB10805:EE_
X-MS-Office365-Filtering-Correlation-Id: 480e008c-e230-49a5-013d-08de79a631aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	vu6xnQaEQt+QzMKhRhVJNyI806jlN19VD+Pv7QVJiQ/t7A7bAwq95t4UQNicpfxU7bqmZJPgDO4ZdIdNYA1g6ois2T2AWIjZN6s7FrATI54Mqqvcv/6RUgm5QzMRceNFLCjauVmDfcSdevB1Ou1yYc+plSq9pGgDEdWc0wKH9Y/hutu1Ox3/ncA3hZ5p3L1UIgKTKBXtjxcymc1VImIyZcEuBkP+1ddAWVA5voOm1AQe74yk0XPtjm+iKRp7Bcfaurmc0s1lsqQaYu2OLHoL/zkBGvNnV7o2VHJ5Oe7rSsZFgf50+UAuOcGOTEE1Wl845Z8D5l+xmcRJOWgNmlFy4PjU+WR3uGB2ueBGh11WbGsQfzNj0tUtAazPWd3JzXtnCDjY7mf07ts5GaLUokfxKkLGg9C2jx1cUfc8Gn3J3Y6ILvvej92OrS5crcJ/gWoCXYEMgFcrQTa5HzvW7rlyQDSwJNTbZZ1QI/DaBpXpFjvleveylgTnYM+r7g9jmAZ4qj3fMBadQ2+KLQQwmTws/ptmvIQdw87PQPh+sK3czwd3vSe0+x6qXOmkWeGsf6gSrqQXFDBbj1dy1JSKjRbdez1AuNGjl92v8VnaMzXoIXLo8TSwqmbZSLcD+G4kK/A7LRIZBJDsUtFzcMmt/6frKe5q4FAt2426aq5yE8vHDn6xXoBP23Ruk160fsRHo2cTfywK0tNUZFqOQ4NcXM911aH3+VgCjX7LVL5tG2aNgD9vUYGsBs9icjpwx0C09ToRCdHRt70ViEM/KOLJYr0F8jPbHte3+vOCRVHBuM567es=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?QZe+nsaSxCMa7DUNVy0ALOa9FU3yUYMH1kAr8+4HoEwlbGByp+Y9RcGL4A?=
 =?iso-8859-2?Q?Lc0SEDfmknqs+ZUsn2MdPCzTgucjcCwb0F5HPHVpF7plwEHPRZI3WJbCXJ?=
 =?iso-8859-2?Q?S4QIvLhTGY/xHHRSSGYge5Q5ZLOuKrZgwUiYsnWeJUOEYsSPfckdiE/XkN?=
 =?iso-8859-2?Q?sMnfv2U+XMHrckOBx2jPJp4kSGsyJ8Zxzx0FsdSHhEcPSLRdJEaMlLugj8?=
 =?iso-8859-2?Q?7e5MSe6OJ+Nqgt4Xjqio6kh8mLSm7eYhIGS070d8Qa7zLvixBrobyGHkBj?=
 =?iso-8859-2?Q?j1lfn5gJljjUe0lotggbwHo5g3DqR1JnPeqitaGvktjWkx86Ld2jlWGTzF?=
 =?iso-8859-2?Q?RqTXAAqPCS7vJxVfRPicoGeKoBPaoL4P5JsLqzfrBOf3mpTIZKtDyRfMW/?=
 =?iso-8859-2?Q?C3rYsoEOu0eYzRvJMiSYoLwx1YJ2IqX4+9rUCYroDNYBJmkHvxSg6dmxDO?=
 =?iso-8859-2?Q?4gOhbdk1hiKYnA96N8tg4LndWnfnVk15nQT4F6RwRQswQpOicv+Rt4lDvQ?=
 =?iso-8859-2?Q?BVN9tuPGDL9lFhMZSr8PgfKlk4KTJJjW45I6yXEz+8rXckVj6obxaf8J9v?=
 =?iso-8859-2?Q?qyrvWtUwYkQMnjdI+OX/jkjFCrOPlxDYCAlD77+o1i4S8DMIkXrgvFODYm?=
 =?iso-8859-2?Q?I7H4mDuv65Ec6FJptfbjOxwoWFaQ7JxC8lzm2tY4h4ufxvKMa3Y4EVg4EJ?=
 =?iso-8859-2?Q?O1nK+0wpduWiDk8FYh8uB6wPMu7JHE3B1sO8LSE9fsiPMwMklEGO/5GrbE?=
 =?iso-8859-2?Q?bIt0rt6qSZCcyCDDVSNrUqYKqAILCj+VuwUCivXhBrybwJ5FCA+QuO87Hl?=
 =?iso-8859-2?Q?Mh6qMJv26WY2F34lJbqa3L1Kn0zRa8LNJOUeapTe8rD6uo3ziG3GTYgOow?=
 =?iso-8859-2?Q?tJoS7LCNA1HIo/wj87KQ2nsMklg1oPteNPiVDQGKjkJ+mj1881F4nfWNxW?=
 =?iso-8859-2?Q?GKiUkSrtBGq7O3407gPrpMN2M5Jpjh24fR81fDfvt4QRXPLqf24fvJaf1N?=
 =?iso-8859-2?Q?H1Vgmv/tCJhL05zs0JxK/Xa5zapJ9ynEx0mM+Z+maZZy655osS4rZPyLxm?=
 =?iso-8859-2?Q?YY1vUTuBbsbrWSVd9cAzDKC+iDuGVrRvivcxwqBslEG9TcS5l5zhKEHUbn?=
 =?iso-8859-2?Q?v0f+vlDwLAx1+3FiRaFrd6I15zW1ZBBVR1pdW2ZECiwk2R087DOZTTAqVe?=
 =?iso-8859-2?Q?N+5lGiyVHniBtVK4QuX0Bq4+HQ99AUii6KdNqqNs+IOxlOa985WDk4cw4w?=
 =?iso-8859-2?Q?vFz4D4XfVAmZG5FotgzsaH0prJ+aTA29UCthaIVA/c6hE01UTMRzMNTogH?=
 =?iso-8859-2?Q?zvwnJcqRdUXxWdBa+rn+YVUuB33FB5z+ulZrPlvrowoSPBxvBT5DRAzmD9?=
 =?iso-8859-2?Q?XlcljpuM5+k5PZYr6+R1a45VkqumoR1oHsluDilWmYz7vFsy+6rP9ip6eC?=
 =?iso-8859-2?Q?LoPc0CEVMi6OSU9dFt4eVn3op49YXvSwseJ1X4q+PggK2yMxA+Y5sNudkW?=
 =?iso-8859-2?Q?RBBG77nFugAETg/ZLMZtTMTg4gM3HJ890Ktibnz3DLW5KVGHDjmShPLQUy?=
 =?iso-8859-2?Q?JwXk272u7yZEdx1vD+zA12jdzhzi9bUjLgOpPkh9ZZLVqlkt6GdlRJYuqy?=
 =?iso-8859-2?Q?qINozUBblPABUc6l/Xt3DUppEv2LCMaiBq52ZvIF09B4+1463acAgfGy6/?=
 =?iso-8859-2?Q?VaWUynjxd05W+6lhYGjC4vzmCI7n2T7AUYara+xaMY1DB/Z/cOfsXaMSEh?=
 =?iso-8859-2?Q?e1lO0JgMzv0FOm3goLJ/uOJ8g0yCUOK0t7MuvZ0G0Kv50Jn1vmoYJ/EfSH?=
 =?iso-8859-2?Q?CyWjPoSOmQ6atMZ7q6tMVdJWbbd00RmAoNt+Ak4KdWOR0vrV8DUB?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 480e008c-e230-49a5-013d-08de79a631aa
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 04:26:23.8846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIR9xGH5KXBKB3p1eIiZAOIuAT/v4eOXWyHQKdCWWPmK8qhZ9482aLDnCeq1ZO7E0pPKaNrcuesDsDARySWR1HdHW2MzEMLL9wqCj41RJY862M5jVaf2Kq5YCpabn6jU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10805

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

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
This patch needs Tested-by from
	Cezary Rojewski <cezary.rojewski@intel.com>
	Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>,

v1 -> v2
	- tidyup handling of client_mutex

 include/sound/soc.h    |  6 ++-
 sound/soc/soc-card.c   |  4 +-
 sound/soc/soc-core.c   | 86 +++++++++++-------------------------------
 sound/soc/soc-devres.c |  7 ----
 4 files changed, 29 insertions(+), 74 deletions(-)

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
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 235427d690617..04d1c2ec11484 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -151,7 +151,7 @@ int snd_soc_card_probe(struct snd_soc_card *card)
 		 * about "late_probe".
 		 *
 		 * see
-		 *	snd_soc_bind_card()
+		 *	soc_card_bind()
 		 *	snd_soc_card_late_probe()
 		 */
 		card->probed =3D 1;
@@ -176,7 +176,7 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	 * for all cases.
 	 *
 	 * see
-	 *	snd_soc_bind_card()
+	 *	soc_card_bind()
 	 *	snd_soc_card_probe()
 	 */
 	card->probed =3D 1;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e70bf22db5c91..65b2eaed57a93 100644
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
@@ -2306,51 +2313,18 @@ static int snd_soc_bind_card(struct snd_soc_card *c=
ard)
 			pinctrl_pm_select_sleep_state(component->dev);
=20
 probe_end:
-	if (ret < 0)
-		soc_cleanup_card_resources(card);
-	snd_soc_card_mutex_unlock(card);
+	list_del_init(&card->list);
=20
-	return ret;
-}
-
-static void devm_card_bind_release(struct device *dev, void *res)
-{
-	snd_soc_unregister_card(*(struct snd_soc_card **)res);
-}
-
-static int devm_snd_soc_bind_card(struct device *dev, struct snd_soc_card =
*card)
-{
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
-
-	return ret;
-}
-
-static int snd_soc_rebind_card(struct snd_soc_card *card)
-{
-	int ret;
+	if (ret < 0) {
+		soc_cleanup_card_resources(card);
=20
-	if (card->devres_dev) {
-		devres_destroy(card->devres_dev, devm_card_bind_release, NULL, NULL);
-		ret =3D devm_snd_soc_bind_card(card->devres_dev, card);
-	} else {
-		ret =3D snd_soc_bind_card(card);
+		if (ret =3D=3D -EPROBE_DEFER) {
+			list_add(&card->list, &unbind_card_list);
+			ret =3D 0;
+		}
 	}
=20
-	if (ret !=3D -EPROBE_DEFER)
-		list_del_init(&card->list);
+	snd_soc_card_mutex_unlock(card);
=20
 	return ret;
 }
@@ -2578,15 +2552,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
=20
 	guard(mutex)(&client_mutex);
=20
-	if (card->devres_dev) {
-		ret =3D devm_snd_soc_bind_card(card->devres_dev, card);
-		if (ret =3D=3D -EPROBE_DEFER) {
-			list_add(&card->list, &unbind_card_list);
-			ret =3D 0;
-		}
-	} else {
-		ret =3D snd_soc_bind_card(card);
-	}
+	ret =3D soc_card_bind(card);
=20
 	return ret;
 }
@@ -2602,8 +2568,7 @@ void snd_soc_unregister_card(struct snd_soc_card *car=
d)
 {
 	guard(mutex)(&client_mutex);
=20
-	snd_soc_unbind_card(card);
-	list_del(&card->list);
+	soc_card_unbind(card, false);
=20
 	dev_dbg(card->dev, "ASoC: Unregistered card '%s'\n", card->name);
 }
@@ -2826,16 +2791,11 @@ static void convert_endianness_formats(struct snd_s=
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
+		soc_card_unbind(card, true);
=20
 	list_del(&component->list);
 }
@@ -2909,7 +2869,7 @@ int snd_soc_add_component(struct snd_soc_component *c=
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

