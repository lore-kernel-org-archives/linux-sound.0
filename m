Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156633;
	b=EkOApa91ERYg3EJAdPVNpcsSxBORam09gBftrSpTjBLGcy7EF/09RrHElrJmiG1vaUgt
	 APVGhSXJHasqQF6B79rk4jOFdzXW3gCVqR3qOib7Usn1NkPVVxp+T6Oqkkky0SBKyVEf6
	 niOTLfuAFaFIQPOYvkrZkBF+4a8LdCQUKy3owYjQLXZOFJDtSV2YPmFdk94dddj8CI+tx
	 trza0ImG1o70WJGEGKh1ClWFqldlwB2CRtyUglldipmikvAxV+lBOr9FHnKH6F0CXtwtO
	 C9brBS7VQ45dTCRjN9UJASVG6xxPTVT8Y+Jn2lbpkSCjEbkJqA6YyoLI9MgSlz5OVnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156633;
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
	bh=jLSp9zQtGcYRMMTyTTgpkcvfITofg9S0w51G9uN49TE=;
	b=T0VGGjcHi9DItfIFmM18fWbhl+6hplIwbioU9jktTsh+w+9IMCOsRwGj9CZ7rezcndh9
	 2bnjKH+zSAf/nkNve9KUg3dhc76aWUxUETE7UIKgymEE3mWAsP+PElpu9Qhqk3OR0mzCp
	 RVvQ0C8lRCVd4mCNM7lr4zJawGqoocQbwCwuyhWOOXVTA1LhZHxlRvjtVTWzEjNYyJ+vT
	 sJT3h68aXeIM9J5uwA9nwZdbDZVEKBmcjCEqzUeQ3zuQE1UIsa3oO4XV4GR82KS3APSc+
	 zEJHcf0F2gW2I/yigRVXJWdf5bFbC/ZXOF+huxcSF1ApidWucCiIynRMwdmi+Ed30hQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=iUZK3CUC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.13
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F19606A31D
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5F19606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=iUZK3CUC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPsaQKFGU+l8ZSPAi0AapX8GYjZjiL/2rhUKtBHlI152al17JFtI/6jZFtAbQy3aqK6534YjXsHPYgWSmBkZQB41Wcvbxtph+4Lyv45lX09CmUIRATgK60sRDTzNqLVD/KKKUsWzR+7aPWnnJolGgfY9+2ZQcatRX2lDs07lNasMokVYz1W/IwjfEVMvY24DxaeseknpJ6i9r4+wupm//Dh5aTkWgEPjfmksoeoHIgDDMERx73IdL8MfZoiXIb0siHrIEQ4w1iNiLuYXMqKqDP+H3BR50V3icH/SPYtUrHG+p/+4XT5IguamNIwt98Dm00unaBT4kGS0yMQayXlfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLSp9zQtGcYRMMTyTTgpkcvfITofg9S0w51G9uN49TE=;
 b=s8i74IUiFQdnZ0H0KD9k2/LTofIsm98/I+IqAcRaIGwt61yc5irm9FXTRUR0cdnA6l+b53RVgnPjb4q68B5ptN3lTbwa5QH4XlFsXPlEpfThBKOolGxk9SirXLnINgPhWklaAU6Po8XYl/4j9GfrvabUY1Col4xdvPYzj+Yn8O+Vl5mAZD+in3xV5aNqbfGyM1UvdsBXNcJHgh40mxuShPHk+j/ZwM9U5jqPMwaNp64IsGZiXLTBA5RldkYmTSFawlG5VgX9wQRL6lr6/p5khgJ5z6wqPdz2TUVL1GudLCgmoMQ7hhd024tEVz125ZC25jzBFT/r20h2S2Do+T79qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLSp9zQtGcYRMMTyTTgpkcvfITofg9S0w51G9uN49TE=;
 b=iUZK3CUCBx/cNhXAl92Jf9/adjLxgEv+SO+UtXZLOfdH4lEUhIl4WA7ZF7iERJYB4T6b1aT7+NHGGuLek1OGNjLkrNQpcgArfSCNTnBN9QdYuXxrJRuSWEBhVs0IByBbzTydq3n92UafKLG0RVZwB6dsjcfl8cW9xORWcP2D9wI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB6650.jpnprd01.prod.outlook.com (2603:1096:400:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:03:50 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:03:50 +0000
Message-ID: <87tsm6sezt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/15] ASoC: soc-card: move snd_soc_card_bind_call()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 03:03:50 +0000
X-ClientProxiedBy: TYCP301CA0088.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::16) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 359d9f98-2dce-4f16-7d58-08df34a0178e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|56012099006|10067099003|261026140227099003|6133799003|3023799007|18002099003|22082099003|38350700014|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	q6ajoKqNbVoW95S9mFBxxRxD84M18F4BUDcvv7NtjwsAvAp0oYDJUuzDEdCrBbqxo0KZVVQzImPGvh3y7jj+oQIb4fynwnb81PH7e5n33QaxdKmkl0hK69AxF1PWO5b73jLtuZcf9ejNo2YKHXzI0RvJYFxGKVY0cd93ytD9iQrCfFN3DCN4luxsKvcndywM9QvrCzwRguaPMpDUzrPUTs6mQ8yzPy7aDq7N9YzC/ntdgAdBOEJxVdzVLp0mvv/StTmBRduHW3JLhr3scr3ytt/ZUvKbgG9l5WcKkYC9HnFdiUujjNjQlRjbxR8h1AwbS8qXHmd2QOxHXN9j+vAaZWZuYGZhL1l5YAOSF2Iu6GDYS+kkBBZ89MKy0jjixtutS0opPffbEkjkP5jAaay1BZVe0rKouie8GeOfej2E5RR7KJJmIRA+2bAd15mo29m8QeAioEER2mWGlotsOuU8pxpGpensGavUSbNuWN7OZnCIoRo4mx+v1EJ1XWA/dLXl+z5dFQRpVcFVaxzydyG/9L8l5UdEhUZ+WyPzKBYKMCiJP0zI/X3bqOGK+kDHP83SyRYiRH+rSXKj6NJIgoukYKZxfP1xJ7hDNATQjYyoO8YxTQTVokXmJq5f7P8ri0OfID6r0abHUjmKZ5AeUPO42PEU/SC5BuRCT+b0XbC1kimeHkUsQxKVGWTB2PMMlBgRZfcP6D9ZLJZV77+OLxyVPeGHhZ+RkPECPSfgroH8o/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(56012099006)(10067099003)(261026140227099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kKzZPq6VA+AzIj6Ux2E/1ZwlFlxCD7QigEt++cM2fVZRjFjyQE+Z0kausvKV?=
 =?us-ascii?Q?7Riri/ZkmE3ZKKXpx80/0aeQc1EC9ES5twItWDJOtJELfgfWIu7woga3MfT3?=
 =?us-ascii?Q?6Uu241CFRCfDrEX01lMO60EMBKUdkcyyuU3YpQ3qVKNQK+rDmqxEsln3PLdJ?=
 =?us-ascii?Q?1edh23fBFM6Jkx9ZvKU5jSe4I8O0vH43jsnGcTWh4m/7Ufzi/O+9gM2yTx26?=
 =?us-ascii?Q?OLeLOAIC4tSIipr2fNG+T0f3UhW2/8I/3Yw2wzdvSSKj/SzxARYkDEb62TM9?=
 =?us-ascii?Q?5qRP4uBMKWYiiVZPi4QrqfZ1igVuJeaJcxnWn1pzdxioiXoVrXvfGu66yqt/?=
 =?us-ascii?Q?gwRoLyCGK+mYp2FjXOR/kt2XnQ5V3NRmKLn440Ozr5/9PcafLA2FB+4Yp/il?=
 =?us-ascii?Q?ioQlU6f92c25rL+TE92VP1RWKBoekh3IHUckfHVOsFlxYN23C5vTuV48Fk5x?=
 =?us-ascii?Q?IEKykP5H9ZVPrJjsKgA3P6QIsj5rYiqXQFLsO7Kr1WCIrz4VnsoWEelcODs1?=
 =?us-ascii?Q?DOFA6bBFrL4mgie3ff2wvEfZSWl26CUckfy/Q8b25SUDum5uXsy63ObZ5FYw?=
 =?us-ascii?Q?jRlo89khEjaFfwWSJEUGKRRQqwzQ57C59t28k41xevLDqh1+17s4xEckaDib?=
 =?us-ascii?Q?3W0afbXzxDJ9L1X7+ndk/GWiP4EqrTmQnayrQm8LKxF4WTKYkFEsZTYbp+IG?=
 =?us-ascii?Q?s/VHR9AI8GxOV8LTwbFy/TeDbJta8ULWh47aC59PYKgmtWo/EqZdEYsE7xjK?=
 =?us-ascii?Q?zvnxx++w0IjJAWyPD/158sMrXs6fRJ+q4N/P3rbGpl3p1OIvws/jUqdte9gk?=
 =?us-ascii?Q?nDN8CtW9pO/KDoBPsrf5Pzsh5dZlHyK3/ucy6oKwo4qunvGEpYFSZPSh8DWG?=
 =?us-ascii?Q?Tvap7/wgmIQ8nNLBJQ2bGclCk/IEoA7HbkZNKTMOMeC60ljWigVa205L96xi?=
 =?us-ascii?Q?TR1YPj5nDkf9dHjpn8i3WMd6S286PdpjT4b7BOuT1w6ZPMyYrsYRy23OOLzU?=
 =?us-ascii?Q?YFO7q9SWytVKFbau3bK2H6jhpIPuLg259+CPNI0mDaW/yJrx2W5WUrHRUwoK?=
 =?us-ascii?Q?d2K8GyS+f4CwKOIXWfIKI3Z9vjpTDppmKbj6qNpWflfCQY+0OmFTtLaIAZ9H?=
 =?us-ascii?Q?jcCVdKJzJjFHZQpBzj6ToPHo/+MznyUt4NFnaGv79jLcC9QEJYCS7poqwTEc?=
 =?us-ascii?Q?mIvXE67f/VqQ2wHv25PCfjLPg1yy9enc+ZGG+xe3hFvoIKyTVNhRCLggHa+5?=
 =?us-ascii?Q?F39Ha580/TCXBqyRVgoDdBYGZr8sPMuCAc2yKksdNxe3g1SiRJwlao+sfZtq?=
 =?us-ascii?Q?HeYLa6gCJB9edXHWnyIW0ll3ssXayCZjlkxPNPuo7QRD9SPgPAeYKj7h8x3o?=
 =?us-ascii?Q?5Wy56hlmuxrYKfIZRfQiPKxyE5AYE79J6RKOVeoTlCC+MKiwllnODZ8zo/98?=
 =?us-ascii?Q?+Q7CDZ2bXSvb+HAwjecICFuGeJ6drKP2+inFW/zJ5SPtr1lDJChvcLrNj9Sf?=
 =?us-ascii?Q?h75GcXReBoH4OjBa7e5Gq8zOqTq/ClyQhTld0oVFDx6IY75l8rngwwvzu/L/?=
 =?us-ascii?Q?gr7OLyjrufNluihT+Mg2ReHfWuK3UgFBA9h1ZJiA97SG0inUoPY/nZz+FPsr?=
 =?us-ascii?Q?x8XBbDQ7nysPZ99rG7cu5V5fkQfK+syrP96jhEXJUY9Fi34ITeO0gZeE7uOQ?=
 =?us-ascii?Q?bpA7CIffK2lMCMmnWrWjbhnpVEP6UMzecpvkNlQqElx/hlJ4lHWP75IYNlL/?=
 =?us-ascii?Q?9uC3aIwQZi1oyqgz8UcWQG/88bXMqE6KG4WF/Od3OhIc9yQ1/hbi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 359d9f98-2dce-4f16-7d58-08df34a0178e
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:03:50.6815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bw9qr0sUQLNqWycCJaO3jy3HEqTwrUVo8NXwsCflEEGdefTTHzrP6w6ZLc0FtLHe0x9llNM0rZ6NL0kUsJ+SgHHlLCq45jImDU9ae6TyJAOvu1dcwg5fl71CRcE1IjMp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6650

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

It has too many local function dependencies.
This patch uses temporary funciton define at soc-internal.h. It will be
removed all funciton were moved.

It renames function name
-	call_soc_bind_card()
-	snd_soc_bind_card()
-	snd_soc_unbind_card()
+	snd_soc_card_bind_call()
+	snd_soc_card_bind()
+	snd_soc_card_unbind()

Below function is used on above functions. Add them at soc-internal.h
+	snd_soc_flush_all_delayed_work()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c     | 411 +++++++++++++++++++++++++++++++++++++-
 sound/soc/soc-core.c     | 419 +--------------------------------------
 sound/soc/soc-internal.h |   8 +
 3 files changed, 422 insertions(+), 416 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index c64c9d425bcf9..72b40f842bd43 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -9,12 +9,16 @@
 #include <linux/debugfs.h>
 #include <linux/dmi.h>
 #include <linux/lockdep.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/rwsem.h>
+#include <sound/initval.h>
 #include <sound/soc.h>
 #include <sound/soc-link.h>
 #include <sound/jack.h>
 #include "soc-internal.h"
 
+LIST_HEAD(unbind_card_list);
+
 #define soc_card_ret(dai, ret) _soc_card_ret(dai, __func__, ret)
 static inline int _soc_card_ret(struct snd_soc_card *card,
 				const char *func, int ret)
@@ -465,6 +469,157 @@ int snd_soc_card_set_dmi_name(struct snd_soc_card *card)
 }
 #endif /* CONFIG_DMI */
 
+static void soc_card_check_tplg_fes(struct snd_soc_card *card)
+{
+	struct snd_soc_component *component;
+	struct snd_soc_dai_link *dai_link;
+	int i;
+
+	for_each_component(component) {
+
+		/* does this component override BEs ? */
+		if (!component->driver->ignore_machine)
+			continue;
+
+		/* for this machine ? */
+		if (!strcmp(component->driver->ignore_machine,
+			    card->dev->driver->name))
+			goto match;
+		if (strcmp(component->driver->ignore_machine,
+			   dev_name(card->dev)))
+			continue;
+match:
+		/* machine matches, so override the rtd data */
+		for_each_card_prelinks(card, i, dai_link) {
+
+			/* ignore this FE */
+			if (dai_link->dynamic) {
+				dai_link->ignore = true;
+				continue;
+			}
+
+			dev_dbg(card->dev, "info: override BE DAI link %s\n",
+				dai_link->name);
+
+			/* override platform component */
+			if (!dai_link->platforms) {
+				dev_err(card->dev, "init platform error");
+				continue;
+			}
+
+			if (component->dev->of_node)
+				dai_link->platforms->of_node = component->dev->of_node;
+			else
+				dai_link->platforms->name = component->name;
+
+			/* convert non BE into BE */
+			dai_link->no_pcm = 1;
+
+			/*
+			 * override any BE fixups
+			 * see
+			 *	snd_soc_link_be_hw_params_fixup()
+			 */
+			dai_link->be_hw_params_fixup =
+				component->driver->be_hw_params_fixup;
+
+			/*
+			 * most BE links don't set stream name, so set it to
+			 * dai link name if it's NULL to help bind widgets.
+			 */
+			if (!dai_link->stream_name)
+				dai_link->stream_name = dai_link->name;
+		}
+
+		/* Inform userspace we are using alternate topology */
+		snd_soc_card_set_topology_name(card, component->driver->topology_name_prefix);
+	}
+}
+
+#define soc_card_setup_name(card, name, name1, name2)			\
+	__soc_card_setup_name(card, name, sizeof(name), name1, name2)
+static void __soc_card_setup_name(struct snd_soc_card *card,
+				  char *name, int len,
+				  const char *name1, const char *name2)
+{
+	const char *src = name1 ? name1 : name2;
+	int i;
+
+	snprintf(name, len, "%s", src);
+
+	if (name != card->snd_card->driver)
+		return;
+
+	/*
+	 * Name normalization (driver field)
+	 *
+	 * The driver name is somewhat special, as it's used as a key for
+	 * searches in the user-space.
+	 *
+	 * ex)
+	 *	"abcd??efg" -> "abcd__efg"
+	 */
+	for (i = 0; i < len; i++) {
+		switch (name[i]) {
+		case '_':
+		case '-':
+		case '\0':
+			break;
+		default:
+			if (!isalnum(name[i]))
+				name[i] = '_';
+			break;
+		}
+	}
+
+	/*
+	 * The driver field should contain a valid string from the user view.
+	 * The wrapping usually does not work so well here. Set a smaller string
+	 * in the specific ASoC driver.
+	 */
+	if (strlen(src) > len - 1)
+		dev_err(card->dev, "ASoC: driver name too long '%s' -> '%s'\n", src, name);
+}
+
+static void snd_soc_card_cleanup_resources(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *rtd, *n;
+
+	if (card->snd_card)
+		snd_card_disconnect_sync(card->snd_card);
+
+	snd_soc_dapm_shutdown(card);
+
+	/* release machine specific resources */
+	for_each_card_rtds(card, rtd)
+		if (rtd->initialized)
+			snd_soc_link_exit(rtd);
+	/* flush delayed work before removing DAIs and DAPM widgets */
+	snd_soc_flush_all_delayed_work(card);
+
+	/* remove and free each DAI */
+	snd_soc_card_link_dais_remove(card);
+	snd_soc_card_link_components_remove(card);
+
+	for_each_card_rtds_safe(card, rtd, n)
+		snd_soc_remove_pcm_runtime(card, rtd);
+
+	/* remove auxiliary devices */
+	snd_soc_card_aux_remove(card);
+	snd_soc_card_aux_unbind(card);
+
+	snd_soc_dapm_free(snd_soc_card_to_dapm(card));
+	snd_soc_card_debugfs_cleanup(card);
+
+	/* remove the card */
+	snd_soc_card_remove(card);
+
+	if (card->snd_card) {
+		snd_card_free(card->snd_card);
+		card->snd_card = NULL;
+	}
+}
+
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name)
 {
@@ -597,7 +752,7 @@ int snd_soc_card_probe(struct snd_soc_card *card)
 		 * about "late_probe".
 		 *
 		 * see
-		 *	snd_soc_bind_card()
+		 *	snd_soc_card_bind()
 		 *	snd_soc_card_late_probe()
 		 */
 		card->probed = 1;
@@ -622,7 +777,7 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	 * for all cases.
 	 *
 	 * see
-	 *	snd_soc_bind_card()
+	 *	snd_soc_card_bind()
 	 *	snd_soc_card_probe()
 	 */
 	card->probed = 1;
@@ -724,3 +879,255 @@ int snd_soc_card_add_controls(struct snd_soc_card *soc_card,
 	return snd_soc_add_controls(card, soc_card->dev, controls, num_controls, NULL, soc_card);
 }
 EXPORT_SYMBOL_GPL(snd_soc_card_add_controls);
+
+static void snd_soc_remove_device_links(struct snd_soc_card *card)
+{
+	struct snd_soc_component *component;
+
+	for_each_card_components(card, component) {
+		if (component->card_device_link) {
+			device_link_del(component->card_device_link);
+			component->card_device_link = NULL;
+		}
+	}
+}
+
+void snd_soc_card_unbind(struct snd_soc_card *card)
+{
+	if (snd_soc_card_is_instantiated(card)) {
+		card->instantiated = false;
+
+		snd_soc_remove_device_links(card);
+
+		snd_soc_card_cleanup_resources(card);
+	}
+}
+
+static int snd_soc_card_bind(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_component *component;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+	int ret;
+
+	snd_soc_card_mutex_lock_root(card);
+	snd_soc_card_fill_dummy_dai(card);
+
+	snd_soc_dapm_init(dapm, card, NULL);
+	list_del_init(&card->list);
+
+	/* check whether any platform is ignore machine FE and using topology */
+	soc_card_check_tplg_fes(card);
+
+	/* bind aux_devs too */
+	ret = snd_soc_card_aux_bind(card);
+	if (ret < 0)
+		goto probe_end;
+
+	/* add predefined DAI links to the list */
+	card->num_rtd = 0;
+	ret = snd_soc_add_pcm_runtimes(card, card->dai_link, card->num_links);
+	if (ret < 0)
+		goto probe_end;
+
+	/* card bind complete so register a sound card */
+	ret = snd_card_new(card->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
+			   card->owner, 0, &card->snd_card);
+	if (ret < 0) {
+		dev_err(card->dev,
+			"ASoC: can't create sound card for card %s: %d\n",
+			card->name, ret);
+		goto probe_end;
+	}
+
+	snd_soc_card_debugfs_init(card);
+
+	snd_soc_card_resume_init(card);
+
+	ret = snd_soc_dapm_new_controls(dapm, card->dapm_widgets,
+					card->num_dapm_widgets);
+	if (ret < 0)
+		goto probe_end;
+
+	ret = snd_soc_dapm_new_controls(dapm, card->of_dapm_widgets,
+					card->num_of_dapm_widgets);
+	if (ret < 0)
+		goto probe_end;
+
+	/* initialise the sound card only once */
+	ret = snd_soc_card_probe(card);
+	if (ret < 0)
+		goto probe_end;
+
+	/* probe all components used by DAI links on this card */
+	ret = snd_soc_card_link_components_probe(card);
+	if (ret < 0) {
+		if (ret != -EPROBE_DEFER) {
+			dev_err(card->dev,
+				"ASoC: failed to instantiate card %d\n", ret);
+		}
+		goto probe_end;
+	}
+
+	/* probe auxiliary components */
+	ret = snd_soc_card_aux_probe(card);
+	if (ret < 0) {
+		dev_err(card->dev,
+			"ASoC: failed to probe aux component %d\n", ret);
+		goto probe_end;
+	}
+
+	/* probe all DAI links on this card */
+	ret = snd_soc_card_link_dais_probe(card);
+	if (ret < 0) {
+		dev_err(card->dev,
+			"ASoC: failed to instantiate card %d\n", ret);
+		goto probe_end;
+	}
+
+	for_each_card_rtds(card, rtd) {
+		ret = snd_soc_card_init_pcm_runtime(card, rtd);
+		if (ret < 0)
+			goto probe_end;
+	}
+
+	snd_soc_dapm_link_dai_widgets(card);
+	snd_soc_dapm_connect_dai_link_widgets(card);
+
+	ret = snd_soc_add_card_controls(card, card->controls,
+					card->num_controls);
+	if (ret < 0)
+		goto probe_end;
+
+	ret = snd_soc_dapm_add_routes(dapm, card->dapm_routes,
+				      card->num_dapm_routes);
+	if (ret < 0)
+		goto probe_end;
+
+	ret = snd_soc_dapm_add_routes(dapm, card->of_dapm_routes,
+				      card->num_of_dapm_routes);
+	if (ret < 0)
+		goto probe_end;
+
+	/* try to set some sane longname if DMI is available */
+	snd_soc_card_set_dmi_name(card);
+
+	soc_card_setup_name(card, card->snd_card->shortname,	card->name,		NULL);
+	soc_card_setup_name(card, card->snd_card->longname,	card->long_name,	card->name);
+	soc_card_setup_name(card, card->snd_card->driver,	card->driver_name,	card->name);
+
+	if (card->components) {
+		/* the current implementation of snd_component_add() accepts */
+		/* multiple components in the string separated by space, */
+		/* but the string collision (identical string) check might */
+		/* not work correctly */
+		ret = snd_component_add(card->snd_card, card->components);
+		if (ret < 0) {
+			dev_err(card->dev, "ASoC: %s snd_component_add() failed: %d\n",
+				card->name, ret);
+			goto probe_end;
+		}
+	}
+
+	/*
+	 * Add device_link from card to component so that system_suspend
+	 * will be done in the correct order. The card must suspend first
+	 * to stop audio activity before the components suspend.
+	 *
+	 * If a driver pair already have a link in the opposite direction
+	 * they must manage their own suspend order.
+	 */
+	for_each_card_components(card, component) {
+		if (card->dev == component->dev)
+			continue;
+
+		component->card_device_link = device_link_add(card->dev,
+							      component->dev,
+							      DL_FLAG_STATELESS);
+		if (!component->card_device_link) {
+			dev_warn(card->dev, "Could not create device link to %s\n",
+				 dev_name(component->dev));
+		}
+	}
+
+	ret = snd_soc_card_late_probe(card);
+	if (ret < 0)
+		goto probe_end;
+
+	ret = snd_soc_dapm_ignore_suspend_widgets(card);
+	if (ret < 0)
+		goto probe_end;
+
+	snd_soc_dapm_new_widgets(card);
+	for_each_card_components(card, component) {
+		ret = snd_soc_component_fixup_controls(component);
+		if (ret < 0)
+			goto probe_end;
+	}
+	snd_soc_card_fixup_controls(card);
+
+	ret = snd_card_register(card->snd_card);
+	if (ret < 0) {
+		dev_err(card->dev, "ASoC: failed to register soundcard %d\n",
+			ret);
+		goto probe_end;
+	}
+
+	card->instantiated = 1;
+	snd_soc_dapm_mark_endpoints_dirty(card);
+	snd_soc_dapm_sync(dapm);
+
+	/* deactivate pins to sleep state */
+	for_each_card_components(card, component)
+		if (!snd_soc_component_active(component))
+			pinctrl_pm_select_sleep_state(component->dev);
+
+probe_end:
+	if (ret < 0) {
+		snd_soc_remove_device_links(card);
+		snd_soc_card_cleanup_resources(card);
+	}
+
+	if (ret == -EPROBE_DEFER) {
+		list_add(&card->list, &unbind_card_list);
+		ret = 0;
+	}
+	snd_soc_card_mutex_unlock(card);
+
+	return ret;
+}
+
+static void devm_snd_soc_card_bind_release(struct device *dev, void *res)
+{
+	snd_soc_unregister_card(*(struct snd_soc_card **)res);
+}
+
+static int devm_snd_soc_card_bind(struct device *dev, struct snd_soc_card *card)
+{
+	struct snd_soc_card **ptr;
+	int ret;
+
+	/* The procedure may be called many times during the lifetime of the card. */
+	devres_destroy(dev, devm_snd_soc_card_bind_release, NULL, NULL);
+
+	ptr = devres_alloc(devm_snd_soc_card_bind_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = snd_soc_card_bind(card);
+	if (ret == 0) {
+		*ptr = card;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+
+int snd_soc_card_bind_call(struct snd_soc_card *card)
+{
+	if (card->devres_dev)
+		return devm_snd_soc_card_bind(card->devres_dev, card);
+	return snd_soc_card_bind(card);
+}
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 12b8bcb93ceeb..301089259a8d4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -38,15 +38,12 @@
 #include <sound/soc.h>
 #include <sound/soc-dpcm.h>
 #include <sound/soc-topology.h>
-#include <sound/soc-link.h>
-#include <sound/initval.h>
 #include "soc-internal.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/asoc.h>
 
 DEFINE_MUTEX(client_mutex);
-static LIST_HEAD(unbind_card_list);
 
 /*
  * This is used if driver don't need to have CPU/Codec/Platform
@@ -425,7 +422,7 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	return NULL;
 }
 
-static void snd_soc_flush_all_delayed_work(struct snd_soc_card *card)
+void snd_soc_flush_all_delayed_work(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
 
@@ -1074,412 +1071,6 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(snd_soc_runtime_set_dai_fmt);
 
-static void soc_check_tplg_fes(struct snd_soc_card *card)
-{
-	struct snd_soc_component *component;
-	struct snd_soc_dai_link *dai_link;
-	int i;
-
-	for_each_component(component) {
-
-		/* does this component override BEs ? */
-		if (!component->driver->ignore_machine)
-			continue;
-
-		/* for this machine ? */
-		if (!strcmp(component->driver->ignore_machine,
-			    card->dev->driver->name))
-			goto match;
-		if (strcmp(component->driver->ignore_machine,
-			   dev_name(card->dev)))
-			continue;
-match:
-		/* machine matches, so override the rtd data */
-		for_each_card_prelinks(card, i, dai_link) {
-
-			/* ignore this FE */
-			if (dai_link->dynamic) {
-				dai_link->ignore = true;
-				continue;
-			}
-
-			dev_dbg(card->dev, "info: override BE DAI link %s\n",
-				dai_link->name);
-
-			/* override platform component */
-			if (!dai_link->platforms) {
-				dev_err(card->dev, "init platform error");
-				continue;
-			}
-
-			if (component->dev->of_node)
-				dai_link->platforms->of_node = component->dev->of_node;
-			else
-				dai_link->platforms->name = component->name;
-
-			/* convert non BE into BE */
-			dai_link->no_pcm = 1;
-
-			/*
-			 * override any BE fixups
-			 * see
-			 *	snd_soc_link_be_hw_params_fixup()
-			 */
-			dai_link->be_hw_params_fixup =
-				component->driver->be_hw_params_fixup;
-
-			/*
-			 * most BE links don't set stream name, so set it to
-			 * dai link name if it's NULL to help bind widgets.
-			 */
-			if (!dai_link->stream_name)
-				dai_link->stream_name = dai_link->name;
-		}
-
-		/* Inform userspace we are using alternate topology */
-		snd_soc_card_set_topology_name(card, component->driver->topology_name_prefix);
-	}
-}
-
-#define soc_setup_card_name(card, name, name1, name2) \
-	__soc_setup_card_name(card, name, sizeof(name), name1, name2)
-static void __soc_setup_card_name(struct snd_soc_card *card,
-				  char *name, int len,
-				  const char *name1, const char *name2)
-{
-	const char *src = name1 ? name1 : name2;
-	int i;
-
-	snprintf(name, len, "%s", src);
-
-	if (name != card->snd_card->driver)
-		return;
-
-	/*
-	 * Name normalization (driver field)
-	 *
-	 * The driver name is somewhat special, as it's used as a key for
-	 * searches in the user-space.
-	 *
-	 * ex)
-	 *	"abcd??efg" -> "abcd__efg"
-	 */
-	for (i = 0; i < len; i++) {
-		switch (name[i]) {
-		case '_':
-		case '-':
-		case '\0':
-			break;
-		default:
-			if (!isalnum(name[i]))
-				name[i] = '_';
-			break;
-		}
-	}
-
-	/*
-	 * The driver field should contain a valid string from the user view.
-	 * The wrapping usually does not work so well here. Set a smaller string
-	 * in the specific ASoC driver.
-	 */
-	if (strlen(src) > len - 1)
-		dev_err(card->dev, "ASoC: driver name too long '%s' -> '%s'\n", src, name);
-}
-
-static void soc_cleanup_card_resources(struct snd_soc_card *card)
-{
-	struct snd_soc_pcm_runtime *rtd, *n;
-
-	if (card->snd_card)
-		snd_card_disconnect_sync(card->snd_card);
-
-	snd_soc_dapm_shutdown(card);
-
-	/* release machine specific resources */
-	for_each_card_rtds(card, rtd)
-		if (rtd->initialized)
-			snd_soc_link_exit(rtd);
-	/* flush delayed work before removing DAIs and DAPM widgets */
-	snd_soc_flush_all_delayed_work(card);
-
-	/* remove and free each DAI */
-	snd_soc_card_link_dais_remove(card);
-	snd_soc_card_link_components_remove(card);
-
-	for_each_card_rtds_safe(card, rtd, n)
-		snd_soc_remove_pcm_runtime(card, rtd);
-
-	/* remove auxiliary devices */
-	snd_soc_card_aux_remove(card);
-	snd_soc_card_aux_unbind(card);
-
-	snd_soc_dapm_free(snd_soc_card_to_dapm(card));
-	snd_soc_card_debugfs_cleanup(card);
-
-	/* remove the card */
-	snd_soc_card_remove(card);
-
-	if (card->snd_card) {
-		snd_card_free(card->snd_card);
-		card->snd_card = NULL;
-	}
-}
-
-static void snd_soc_remove_device_links(struct snd_soc_card *card)
-{
-	struct snd_soc_component *component;
-
-	for_each_card_components(card, component) {
-		if (component->card_device_link) {
-			device_link_del(component->card_device_link);
-			component->card_device_link = NULL;
-		}
-	}
-}
-
-static void snd_soc_unbind_card(struct snd_soc_card *card)
-{
-	if (snd_soc_card_is_instantiated(card)) {
-		card->instantiated = false;
-
-		snd_soc_remove_device_links(card);
-
-		soc_cleanup_card_resources(card);
-	}
-}
-
-static int snd_soc_bind_card(struct snd_soc_card *card)
-{
-	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_component *component;
-	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	int ret;
-
-	snd_soc_card_mutex_lock_root(card);
-	snd_soc_card_fill_dummy_dai(card);
-
-	snd_soc_dapm_init(dapm, card, NULL);
-	list_del_init(&card->list);
-
-	/* check whether any platform is ignore machine FE and using topology */
-	soc_check_tplg_fes(card);
-
-	/* bind aux_devs too */
-	ret = snd_soc_card_aux_bind(card);
-	if (ret < 0)
-		goto probe_end;
-
-	/* add predefined DAI links to the list */
-	card->num_rtd = 0;
-	ret = snd_soc_add_pcm_runtimes(card, card->dai_link, card->num_links);
-	if (ret < 0)
-		goto probe_end;
-
-	/* card bind complete so register a sound card */
-	ret = snd_card_new(card->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
-			card->owner, 0, &card->snd_card);
-	if (ret < 0) {
-		dev_err(card->dev,
-			"ASoC: can't create sound card for card %s: %d\n",
-			card->name, ret);
-		goto probe_end;
-	}
-
-	snd_soc_card_debugfs_init(card);
-
-	snd_soc_card_resume_init(card);
-
-	ret = snd_soc_dapm_new_controls(dapm, card->dapm_widgets,
-					card->num_dapm_widgets);
-	if (ret < 0)
-		goto probe_end;
-
-	ret = snd_soc_dapm_new_controls(dapm, card->of_dapm_widgets,
-					card->num_of_dapm_widgets);
-	if (ret < 0)
-		goto probe_end;
-
-	/* initialise the sound card only once */
-	ret = snd_soc_card_probe(card);
-	if (ret < 0)
-		goto probe_end;
-
-	/* probe all components used by DAI links on this card */
-	ret = snd_soc_card_link_components_probe(card);
-	if (ret < 0) {
-		if (ret != -EPROBE_DEFER) {
-			dev_err(card->dev,
-				"ASoC: failed to instantiate card %d\n", ret);
-		}
-		goto probe_end;
-	}
-
-	/* probe auxiliary components */
-	ret = snd_soc_card_aux_probe(card);
-	if (ret < 0) {
-		dev_err(card->dev,
-			"ASoC: failed to probe aux component %d\n", ret);
-		goto probe_end;
-	}
-
-	/* probe all DAI links on this card */
-	ret = snd_soc_card_link_dais_probe(card);
-	if (ret < 0) {
-		dev_err(card->dev,
-			"ASoC: failed to instantiate card %d\n", ret);
-		goto probe_end;
-	}
-
-	for_each_card_rtds(card, rtd) {
-		ret = snd_soc_card_init_pcm_runtime(card, rtd);
-		if (ret < 0)
-			goto probe_end;
-	}
-
-	snd_soc_dapm_link_dai_widgets(card);
-	snd_soc_dapm_connect_dai_link_widgets(card);
-
-	ret = snd_soc_add_card_controls(card, card->controls,
-					card->num_controls);
-	if (ret < 0)
-		goto probe_end;
-
-	ret = snd_soc_dapm_add_routes(dapm, card->dapm_routes,
-				      card->num_dapm_routes);
-	if (ret < 0)
-		goto probe_end;
-
-	ret = snd_soc_dapm_add_routes(dapm, card->of_dapm_routes,
-				      card->num_of_dapm_routes);
-	if (ret < 0)
-		goto probe_end;
-
-	/* try to set some sane longname if DMI is available */
-	snd_soc_card_set_dmi_name(card);
-
-	soc_setup_card_name(card, card->snd_card->shortname,
-			    card->name, NULL);
-	soc_setup_card_name(card, card->snd_card->longname,
-			    card->long_name, card->name);
-	soc_setup_card_name(card, card->snd_card->driver,
-			    card->driver_name, card->name);
-
-	if (card->components) {
-		/* the current implementation of snd_component_add() accepts */
-		/* multiple components in the string separated by space, */
-		/* but the string collision (identical string) check might */
-		/* not work correctly */
-		ret = snd_component_add(card->snd_card, card->components);
-		if (ret < 0) {
-			dev_err(card->dev, "ASoC: %s snd_component_add() failed: %d\n",
-				card->name, ret);
-			goto probe_end;
-		}
-	}
-
-	/*
-	 * Add device_link from card to component so that system_suspend
-	 * will be done in the correct order. The card must suspend first
-	 * to stop audio activity before the components suspend.
-	 *
-	 * If a driver pair already have a link in the opposite direction
-	 * they must manage their own suspend order.
-	 */
-	for_each_card_components(card, component) {
-		if (card->dev == component->dev)
-			continue;
-
-		component->card_device_link = device_link_add(card->dev,
-							      component->dev,
-							      DL_FLAG_STATELESS);
-		if (!component->card_device_link) {
-			dev_warn(card->dev, "Could not create device link to %s\n",
-				 dev_name(component->dev));
-		}
-	}
-
-	ret = snd_soc_card_late_probe(card);
-	if (ret < 0)
-		goto probe_end;
-
-	ret = snd_soc_dapm_ignore_suspend_widgets(card);
-	if (ret < 0)
-		goto probe_end;
-
-	snd_soc_dapm_new_widgets(card);
-	for_each_card_components(card, component) {
-		ret = snd_soc_component_fixup_controls(component);
-		if (ret < 0)
-			goto probe_end;
-	}
-	snd_soc_card_fixup_controls(card);
-
-	ret = snd_card_register(card->snd_card);
-	if (ret < 0) {
-		dev_err(card->dev, "ASoC: failed to register soundcard %d\n",
-				ret);
-		goto probe_end;
-	}
-
-	card->instantiated = 1;
-	snd_soc_dapm_mark_endpoints_dirty(card);
-	snd_soc_dapm_sync(dapm);
-
-	/* deactivate pins to sleep state */
-	for_each_card_components(card, component)
-		if (!snd_soc_component_active(component))
-			pinctrl_pm_select_sleep_state(component->dev);
-
-probe_end:
-	if (ret < 0) {
-		snd_soc_remove_device_links(card);
-		soc_cleanup_card_resources(card);
-	}
-
-	if (ret == -EPROBE_DEFER) {
-		list_add(&card->list, &unbind_card_list);
-		ret = 0;
-	}
-	snd_soc_card_mutex_unlock(card);
-
-	return ret;
-}
-
-static void devm_card_bind_release(struct device *dev, void *res)
-{
-	snd_soc_unregister_card(*(struct snd_soc_card **)res);
-}
-
-static int devm_snd_soc_bind_card(struct device *dev, struct snd_soc_card *card)
-{
-	struct snd_soc_card **ptr;
-	int ret;
-
-	/* The procedure may be called many times during the lifetime of the card. */
-	devres_destroy(dev, devm_card_bind_release, NULL, NULL);
-
-	ptr = devres_alloc(devm_card_bind_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return -ENOMEM;
-
-	ret = snd_soc_bind_card(card);
-	if (ret == 0) {
-		*ptr = card;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
-
-	return ret;
-}
-
-static int call_soc_bind_card(struct snd_soc_card *card)
-{
-	if (card->devres_dev)
-		return devm_snd_soc_bind_card(card->devres_dev, card);
-	return snd_soc_bind_card(card);
-}
-
 /* probes a new socdev */
 static int soc_probe(struct platform_device *pdev)
 {
@@ -1641,7 +1232,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 
 	guard(mutex)(&client_mutex);
 
-	return call_soc_bind_card(card);
+	return snd_soc_card_bind_call(card);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_card);
 
@@ -1655,7 +1246,7 @@ void snd_soc_unregister_card(struct snd_soc_card *card)
 {
 	guard(mutex)(&client_mutex);
 
-	snd_soc_unbind_card(card);
+	snd_soc_card_unbind(card);
 	list_del(&card->list);
 
 	dev_dbg(card->dev, "ASoC: Unregistered card '%s'\n", card->name);
@@ -1816,7 +1407,7 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 
 	if (card) {
 		instantiated = card->instantiated;
-		snd_soc_unbind_card(card);
+		snd_soc_card_unbind(card);
 		if (instantiated)
 			list_add(&card->list, &unbind_card_list);
 	}
@@ -1893,7 +1484,7 @@ int snd_soc_component_register(struct snd_soc_component *component,
 	list_add(&component->list, snd_soc_component_get_list_head());
 
 	list_for_each_entry_safe(card, c, &unbind_card_list, list)
-		call_soc_bind_card(card);
+		snd_soc_card_bind_call(card);
 
 err_cleanup:
 	if (ret < 0)
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index e1f456e222b63..97891bf68b882 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -17,6 +17,7 @@
  * REMOVE ME
  * Temporary definition
  */
+extern struct list_head unbind_card_list;
 void snd_soc_card_debugfs_init(struct snd_soc_card *card);
 void snd_soc_card_debugfs_cleanup(struct snd_soc_card *card);
 void snd_soc_card_resume_init(struct snd_soc_card *card);
@@ -43,12 +44,19 @@ char *snd_soc_fmt_multiple_name(struct device *dev, struct snd_soc_dai_driver *d
 int snd_soc_add_controls(struct snd_card *card, struct device *dev,
 			 const struct snd_kcontrol_new *controls, int num_controls,
 			 const char *prefix, void *data);
+void snd_soc_flush_all_delayed_work(struct snd_soc_card *card);
 struct snd_soc_component *snd_soc_find_component(const struct snd_soc_dai_link_component *dlc);
 #ifdef CONFIG_PM_SLEEP
 void snd_soc_playback_digital_mute(struct snd_soc_card *card, int mute);
 void snd_soc_dapm_suspend_resume(struct snd_soc_card *card, int event);
 #endif
 
+/*
+ * In soc-card
+ */
+void snd_soc_card_unbind(struct snd_soc_card *card);
+int snd_soc_card_bind_call(struct snd_soc_card *card);
+
 /*
  * In soc-dai
  */
-- 
2.53.0

