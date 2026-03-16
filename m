Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011027.outbound.protection.outlook.com [40.107.74.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C843346A04
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 05:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773639158; cv=fail; b=MR2Lf2oOA50YmEW7fqDsrzz59ojfxaxnM1QLM3TLbo/DOf1KOrxyVFSrlY3JIL6VInWOH5t/zFaaWCyusGkhbqIDg2Y1/MOwDoS6cYQPFXqovHX6lX6PDZ83Mnhvi/OnwPgd/1nK+g8uSP/FwScO1jdCeLE08nS/O+k3qijEZy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773639158; c=relaxed/simple;
	bh=Xv6Nfr5DvHck3+bYZXzTJXtXjmzDKMIni+L5txGezCc=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=oigtSIapzoAWxrb+xfLW2xcUymCEQzu9nF3xXkiP8ujx60Ph8H59vZ/3z4IWaQu7RBpDAAXYtOM/X5aPb0EhMojkBMRTm4YOkeQlatbqOiWkXKJq++u9rYsinV0/6ESnUGqDeZphcdgW5FkNt0MHgixKNV8PJm8SEggwKduwCaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X5nBlsh4; arc=fail smtp.client-ip=40.107.74.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X5nBlsh4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5KEZOYhKb+9LgTR529x584yzIVTCW3Fvqu3hRWgNHsFsIvoM6iW3jp140j0soRxKsceGGqms3SVGuCsdiCXDBW/bi/JOc+zLNFhqrw6SS4mh0D28VMGKuEAFdgNWI/stfWPcCNbNCRhzLlEn5J/7iDmMo88aL1D4VTg0nh35dQ7Vj5JYOZtLd0B62zIcnqzHuDYIr0yWeK2G1nsJCyTnztoKXj1AlccsXzW9/XzH3K04DzSG2fBjPkONi6IwEsWg+veSelMOsl1f00nFCo/6aMfol/OTcZaVMpzCSEhzSZ9rDzGivqijkK7AGNkD6S7F489Ikoa+/c5IPg9mNagWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivclT4SK1J+N16JLsI0KdLvIWgGTryGpPBDra0dNsiU=;
 b=zAIR8eWfIc9qWdLCay20YHeMuVw0FmzWXNZtuYWt8y/Tz64/JXZ4gbNrzz1LIUuxbfnVtgPb0czWaz7Yv6ijYwSdpdcGz2m9FlV74roAS5FFLEN3ZjwNqvMcS4fzJdoO4qFtPYtqgQ4d05JNOojRzsjzl/5o3P8W4bOk6aBnCAHIC4uxHqc1fu9zH2JMEDl59ldKIsOrrLgEoIHxHOaYP5/u1RiLtWcz4/FOGuaHNYtf3M6vyQCzufwwyWV3UYneCHpELqJwiIeqD6wb0Ms9u4Kh+OGpsfn9M/XZl5gCJcyNbZVzqZiKm2ab+M6Ntha9V7qpGMrAFU3UVw43c0aV6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivclT4SK1J+N16JLsI0KdLvIWgGTryGpPBDra0dNsiU=;
 b=X5nBlsh4UYgrYm3QBqy5so44er2BzxcAKzT3MfE5O3W9oXCkqmcwAHB75Q/LEyLae2nOG05jWGgfuuKO1+ha69ba562HuQXQMRik0Mxaln3bQ5pfPE/qUGLbiaxmuMA/Npv1rn2m/mEy7LhPAkQef2wcSmtU0q8flL69xYxBSrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TYXPR01MB15704.jpnprd01.prod.outlook.com (2603:1096:405:29d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 05:32:30 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 05:32:22 +0000
Message-ID: <87y0jsibki.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3] ASoC: core: use Complete rebind cards by default for all users
To: Mark Brown <broonie@kernel.org>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: linux-sound@vger.kernel.org
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Mar 2026 05:32:21 +0000
X-ClientProxiedBy: TY4P301CA0056.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::16) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TYXPR01MB15704:EE_
X-MS-Office365-Filtering-Correlation-Id: f76e5f6c-83d4-41c0-1c3f-08de831d65d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Y49Db342wohfIBi+wnOJ0NghaU20zSBEDeKAneRvanT4a0FdHpxBPeMU2uUHfio37VYZ+fKSV7PPmSuDkK1WdmPcmW7PxnyCKZo8+Jo67K0SwwUuyxy28jJJPPg0t0hfLdHeGsOA+5eI++0Vyc38ZW7kDR40YiIpVktRQBO3u9XsnUm0qdbZJMYFsqhhBYWsysbLXWjp2CvrKY0Y7SlTCBzvzgHh+fclfIaHXoxAM/A0CV8nPtkp3Y+aTBWroi6Yt+DhKhR/h1FH29c3CqcBrH5E1vfkq1FPMCbqigtTefOC2vJAJ0hqQo/fR18/os3ufjH9xbJUBDZIz2wlil0bd9/M8LqEV3Pa6SQOE3ZJJF61oci4eaRqk+RpG3F9MGh7DUwa8bd/88oqjyhsQISeK9zZRyn7QqieFvHGTHbx54gEeDtXY1ApnqOBzyVnq90f+jNMuZI1q81VmnXJHYbmwLLbIshlOEOw0AYiucPlUe2XeeBsqf+aPUuI4CKGFW3076Go/CNNwp7GCtgV2plrv4sOiVK51mtsrYlzIK5/ZActUHwnNntMMiGHBJ5X0aOYZJygbzqS0lj8Y0U1iEXyWWn7l/qhEO9sKUKuITG/0ov1NrLLOTrw7EIFUscuUkJWEZVShD+KbvGY6a0RvXg21KRk1bEsXCjPVJhITTHotCppPAihz86gqTcE25ztc41EYx8T8Q1MNF7sn6LyrbTDN03eeWtE8XDphUbc+TXpRbSSbXuitBX27OVA5jhBJLQ6RGf9GgpKtSPWknEdmCRlGUFBdsqS78dMAsXRCC3jlJY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?1f9s/Gyt4/eBY0zmEJISuKV6d4MZmoc9mp3Wtrov3f302BjgFAKNIp9UTi?=
 =?iso-8859-2?Q?EVxB/fxBJLUhUXIf8/wO27Np5TL0oBfWuvdGEfCQetwYshDHRE+AODnmW3?=
 =?iso-8859-2?Q?7GOHqbe22Wyqqbmk11n7rIGVzt460TTT3G1ZtPyuryMRN7EzrvzP6lwLt+?=
 =?iso-8859-2?Q?JNLG8i2hqKIdCyJiSO5HLqwVMJsxDE/IAkxYHp1KKCV8Dtp9TS2ycoquwJ?=
 =?iso-8859-2?Q?o8Fq5VcjiREJx4HDXewYq5Hi/bFYYRZ1bQGKg3+Cs7iKunbytpy66NhdoT?=
 =?iso-8859-2?Q?GgNZdH/nBWN2icAyLLvYGtwsnv95Jj+ziynm3T5yoS/p9TauJnWDEtjCAB?=
 =?iso-8859-2?Q?LFXIWm+lg8+02tPBdHn5TqjaaISk9NK45ecGqD0YdsexpD40nR4tDXGCFS?=
 =?iso-8859-2?Q?wuqz1ySvoDyS05LPDUK/zO8echBgSJ6tH38Zj1ZIax8ayYn8sEkSC+2A1+?=
 =?iso-8859-2?Q?LNSfpoHpKjdV7NYN+K49jPWs3bnZbq9HNntUnxCv6tN40MO5Gs1EiFQPwD?=
 =?iso-8859-2?Q?9zkSIZE0ths38lh+4WOOyTk+bRl6lewp5AIHC8Em6EjJnN/xPa/4xpTeSy?=
 =?iso-8859-2?Q?8DYXy4+9Sc/POPXlLeZZcy8MQSUzZ5guK31IsjBrXJ4z45wpW7a66kOsJ5?=
 =?iso-8859-2?Q?phxjzaV3rNDkOWJ1o+0VHtaxq1rDF0zAQRPVqWKMscgGT+y7UnvYH1Ty1L?=
 =?iso-8859-2?Q?9k33ebb0y8Sm42FculiuuCUlPFxEM9UYDmeH/W1Kr5AcNICZP+ivXiWvh0?=
 =?iso-8859-2?Q?ilxzZmsW6uVlhPUFfJHM2HxyjCkg7V5lJcuUnFLNF6mWrHj8mfECIDZREK?=
 =?iso-8859-2?Q?Pmm0Tg+pTjnUX0mEvNooVU3JPfjcBlHyMUSrMR1ly11EYHxs+PVxE0LzN9?=
 =?iso-8859-2?Q?GWQS70m6ozrsTKxsqygPuXULUaAlJruLgwewaSV18zFW9Y1z30CeBwjp6Q?=
 =?iso-8859-2?Q?Mw6bApSpwX9JOJhOizTwekQTcmISC9ANu2yKmxMwV6FuOZTr5E3zxbTO5R?=
 =?iso-8859-2?Q?zm3rxpALFhB69rYbNSbu+JQwN6gi13lTKXZ4joxOEISG1RXfGQ1lxK4b3Z?=
 =?iso-8859-2?Q?WeP1ksWkj0ZwmdoUok/B5OmEF3a4VeNrD9lDnTS1C+YGfqdzuT4sYVYySW?=
 =?iso-8859-2?Q?iF2cPe49WEFME9L+wv0obm6XWsUG1pF9UAO0+6y2e679v3v74+IjaHgvDw?=
 =?iso-8859-2?Q?znpWq1iTKzrEKTeLotyG3B8XFbrYPJkSWIsJqHQeUBSIkoVfW7u4EXjmf9?=
 =?iso-8859-2?Q?Dtg3rw7N68vRWuBccAdJmT2DxXgfI0ekkG5GGOZtHa1vksyrGt5HTbwpec?=
 =?iso-8859-2?Q?wjZG1PSldgjG3cx7kGkQPLirXV41h2TOM8+QUR9gznv4Fl26HjjxLkrxc5?=
 =?iso-8859-2?Q?x5agVfMk3QqbUQ8yaHqbrY72j0LjimDROlyBnpz5Lx/QtYMGEC4oztgFSi?=
 =?iso-8859-2?Q?9wVOiHfu2lzDp/KL5qG6NE8E452A2Y+3lnAm/yH5flAqZY+7TDH43QpIqK?=
 =?iso-8859-2?Q?e8JZ8vWlY6rSBj0XbaBxUI/aAR4VZEGZQJsKlZs96AuhnhTzGIVRfDOw9R?=
 =?iso-8859-2?Q?FPDEUifyIsorH3+AusTKq562V+u4rXbjzWBUQdBE9cIZKZkbLr9/q1zt8A?=
 =?iso-8859-2?Q?vsDSA3Oep18xXC2QmckzsZEsRWI/F0T5LHevgWu/9gD18XHXHjHmwdNyox?=
 =?iso-8859-2?Q?pHt9qB/sodZ3Y7LfscU1QPzzFLGS/RmpPjKy7O7Zi9pt8wR12GiiVgECZ7?=
 =?iso-8859-2?Q?0n/JK2Eo/cGJrjo/0yVxDE760XmagI9bEmJJU4gplsAtDJ9diKE49dtyFv?=
 =?iso-8859-2?Q?xo55ASykw4vP8rb2lJ23brd75GHcCNiPfZWQDJDPn3Z5tKKLGKQV?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76e5f6c-83d4-41c0-1c3f-08de831d65d1
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:32:22.0314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJnz8i5bu2C+Rwt4p7UDSr3Q0d43fiWUKux3FKAR6ZCxxabVvXy0s0JlQyZQaIiSPwhPiGJhIb5QyRli9/WIM6qalpMbRAHWbOTOXfGdjioUnfJn1jqC0hI6nF33xFRa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB15704

commit a3375522bb5e2 ("ASoC: core: Complete support for card rebinding")
supports complete card rebinding, but it uses unbalanced pair functions
It added devm_snd_soc_bind_card() (=3D bind), but its inverse function is
snd_soc_unregister_card() (=3D unregister), and it adds new
devm_snd_soc_register_deferrable_card() (=3D register), but it doesn't have
inverse function (=3D merged with above inverse of bind function).

This feature is mainly used on Intel driver, but all driver can use it.
Let's use it on all drivers.

bin/unbind functions are soc-core.c local, so let's rename it.
It added new rebind function.
	snd_soc_bind_card()	-> soc_card_bind()
	snd_soc_unbind_card()	-> soc_card_unbind()
	snd_soc_rebind_card()	-> soc_card_rebind()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
This patch needs Tested-by from
	Cezary Rojewski <cezary.rojewski@intel.com>
	Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>,

v2 -> v3
	- separate bind/unbind/rebind and unbind list handling
	- tidyup git-log and Subject

v1 -> v2
	- tidyup handling of client_mutex

 include/sound/soc.h    |  6 +++--
 sound/soc/soc-card.c   |  4 +--
 sound/soc/soc-core.c   | 61 ++++++++----------------------------------
 sound/soc/soc-devres.c |  7 -----
 4 files changed, 17 insertions(+), 61 deletions(-)

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
index 1a744ad237c9d..a3862506b9ead 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2144,7 +2144,7 @@ static void soc_cleanup_card_resources(struct snd_soc=
_card *card)
 	}
 }
=20
-static void snd_soc_unbind_card(struct snd_soc_card *card)
+static void soc_card_unbind(struct snd_soc_card *card)
 {
 	if (snd_soc_card_is_instantiated(card)) {
 		card->instantiated =3D false;
@@ -2154,7 +2154,7 @@ static void snd_soc_unbind_card(struct snd_soc_card *=
card)
 	}
 }
=20
-static int snd_soc_bind_card(struct snd_soc_card *card)
+static int soc_card_bind(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_component *component;
@@ -2313,46 +2313,12 @@ static int snd_soc_bind_card(struct snd_soc_card *c=
ard)
 	return ret;
 }
=20
-static void devm_card_bind_release(struct device *dev, void *res)
+static void soc_card_rebind(struct snd_soc_card *card)
 {
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
-
-	if (card->devres_dev) {
-		devres_destroy(card->devres_dev, devm_card_bind_release, NULL, NULL);
-		ret =3D devm_snd_soc_bind_card(card->devres_dev, card);
-	} else {
-		ret =3D snd_soc_bind_card(card);
-	}
+	int ret =3D soc_card_bind(card);
=20
 	if (ret !=3D -EPROBE_DEFER)
 		list_del_init(&card->list);
-
-	return ret;
 }
=20
 /* probes a new socdev */
@@ -2578,15 +2544,9 @@ int snd_soc_register_card(struct snd_soc_card *card)
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
+	if (ret =3D=3D -EPROBE_DEFER)
+		list_add(&card->list, &unbind_card_list);
=20
 	return ret;
 }
@@ -2602,7 +2562,7 @@ void snd_soc_unregister_card(struct snd_soc_card *car=
d)
 {
 	guard(mutex)(&client_mutex);
=20
-	snd_soc_unbind_card(card);
+	soc_card_unbind(card);
 	list_del(&card->list);
=20
 	dev_dbg(card->dev, "ASoC: Unregistered card '%s'\n", card->name);
@@ -2832,7 +2792,8 @@ static void snd_soc_del_component_unlocked(struct snd=
_soc_component *component)
=20
 	if (card) {
 		instantiated =3D card->instantiated;
-		snd_soc_unbind_card(card);
+
+		soc_card_unbind(card);
 		if (instantiated)
 			list_add(&card->list, &unbind_card_list);
 	}
@@ -2907,7 +2868,7 @@ int snd_soc_add_component(struct snd_soc_component *c=
omponent,
 	list_add(&component->list, &component_list);
=20
 	list_for_each_entry_safe(card, c, &unbind_card_list, list)
-		snd_soc_rebind_card(card);
+		soc_card_rebind(card);
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

