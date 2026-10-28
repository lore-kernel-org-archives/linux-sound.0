Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156598;
	b=pNY4rmRkglTh03WicNZ1CSzJ/ovHxLoPVV5d8mB5PsJuq5LpGUDwdNlp1KPw7qJAUvWJ
	 G6pwy96Ozb+lst3cMfMtDdiYWfxkzn3pBW1NGrJU6tp6iHvlCuQ5nbBQXE9VdlpOozeib
	 AVPJFBVoJKjUzvHW+Y9o1lEHs5Z9YhjBuf81Mj1lyPuJixfkYw8D36+IjFVaJU4D57Jqp
	 +j8zRsQjzLLTPgfZHzrgPDjcRBzkMyQdHpI3f0l7tB1KFs2b717ezayIeStsGBLj+6vgS
	 4bjckUC9NqdmGQIINmdpMf4GDRFfGFfCtVYzz6g5cmVCYiW1Uh5EUx047yD9jJ1ETMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156598;
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
	bh=UNU+V+xViGNxDzzBHxqnjpAse0oTSwJTVJI+iSR3jY8=;
	b=fHiiJVqRweKphTAxBHgPGJCBZcDrGMCd/hj+qVyLTC4BqaALorjc9GOlClhWbfCZ06gF
	 eYDIwQWv8IMP7eAdWS0/pyuKDWzeL2rMR1e6lYpxCwm5DT0tL+ftXxMWMeJHA4Emmjm2g
	 oXkwVzp9vkBlHYpS20VQThfx532+CJBZz/Y2atgFsKrc1B9SA4Jmuhjx57AzQTvgfxySa
	 G4tt7dunHEBuYGxYUoVA20K+3bKVNPp1JlqPeM30Krkdzn56b06gCSB3uUDsH8lAlXolb
	 p3JiTlF+bRf6Yi89AZ6abJ6+qVvZqtvGc3gEP4VA0zdJS8C+jqMcpZfX/VjxdTr3oPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=jDms6kpw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.42
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE92606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE92606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=jDms6kpw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmetFxCU4BqnqbAOJMW80RI5I4+R/LnfAWalz+WsLksSEBeP8k4dWcsENMt4OFBVJttEBgKccmMFE5smnZET1jiL+7F0iThFn/dmR1lhaxCYHhyS5bPnF5C7i2f6QuyAbsYgIXPIFADFJdrfwSB2JW965gMNnpy/VZpd7ptt5yCSL0Gs903sahcTv0tqzCuPjD754rZjmkEfwZis0TBWtYZttKb2njqMWV5M9diKIC0OTNxn7JkApaYkg4sxZWdWYoG4yPuWnaog2ahBhp9uQxL5ITub1/+RLgssXesv1PryO1frlOfjInOi/9x6Dxk3lRhhcOnQG2C4OyyoD8Be3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNU+V+xViGNxDzzBHxqnjpAse0oTSwJTVJI+iSR3jY8=;
 b=NT+GZlk9XOu85kZaxVIGiSGEwbtT/7wQtapuFOtia85KpZEKC6o7bFjzSy+V9hmN6UBoxdltQVrOOSpC+IIAcmQ3162OVM/TGdU5PNFOTKVzCsQyaMbLNa87h+7Wmb8B1b1+hD6n3+Q8fSetLXjpXasZIyWTEwmILouPZDeG+mEqWlfvNJp5VzZEcap3pJpW6ug9U7pFKgy9o7pOPN+7DyrgCHkPfxwPjgWjW+DcLaP8QEpjhUzoNZaLATKGFgC5E0QD+ZyjmCZxGJErY/naQK+I5WAWXB/wBZaUkaDQszm/gHjSeTusr0rAjdX98qt865FMCD3MbnYf1YtbTb6WNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNU+V+xViGNxDzzBHxqnjpAse0oTSwJTVJI+iSR3jY8=;
 b=jDms6kpwKDCRDp1BXd10Rnvj2ithQMu/eNCNutV2/8ATE8dlX9gR0L8K8CZvDyH8yiobSNvysAi6CKi+G1yetvlzPBPGp+5qKN8qOPAu89JxwNh6jtx79je1yt1n2gpOI48R/lavj+OnTsfCJ5GQunWMbgXEcq3hGqa5wuPVtUg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB6650.jpnprd01.prod.outlook.com (2603:1096:400:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:03:16 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:03:16 +0000
Message-ID: <878q3ittl8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/15] ASoC: soc-card: move snd_soc_add_card_controls()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 03:03:15 +0000
X-ClientProxiedBy: TYCP286CA0219.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::15) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: f3f22472-8344-4be3-90c3-08df34a002e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|56012099006|10067099003|261026140227099003|18002099003|22082099003|38350700014|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ptd9jWJQ/E2ybvxYu5Qcn+5TYibbbc8LNHq0vRUq8VG1A0Xvxrh3KwzcUmL+jq6YbqVRDZb3xQvrk6VOp57M0A++rGOYn3p5ehoP0BA4MQ7s6DGQ/ZXkWGBmqrn22r5UoreP6W3UGP9BZRtK++mSkmCNiSzlwUXuVzDesD+KumsAMRgW+qbKWzRdGW6sKkQw96wiQfG9Ymspen/Drd5dy42JxFuCOBFeI+zvMAl22ufx38SQcFqhiwNh3NaU2w9OAFNPlOuwzu3xL1hHhleULBvu1Kkkz36Y8UAf1Q0opLzW7BtsprfuAAQ5VOR5+7B8oOCh3r//8y+eilXG87KKO2PlgBe9HDazwJLjo93MHXIJ5+2foRMga+Dfh0lCwOK+2y65YSltybyBKgoF9HSdak3uKei2Qec+KKAVLoXeXVanauXbFvprChxFjk2the5Dy0g+oG3SZ5pxJQb05PR7fMQFxHaY7ufw1XX+UR1SahDVO5LPqSRepHmPagxqEfjYd65r995mRtXo9efnnt57kGm5IhYIW4J3Cb3R5f6B9l/0n9lAjQ32i2fl3EHmCyGzMnYwqBXv1UmmqN/W9kjQzqPAa/sK9oOwR5rGvCt+xWAZ6KwpEydIgLBEtEfWJdTnvT/HMiwY1+YEbPRqqmMUj4bA2Vqm9nexycJGZD7KbazFzgWOnjOt4Nr6RHmKJ7M3MxiNMJ3xtxmhHwcNQvTi6xZJrz4u3It0zbv09FbQdj4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(56012099006)(10067099003)(261026140227099003)(18002099003)(22082099003)(38350700014)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X3usjljJ6i0nVlD5iGrtwBo17fy3fZIyzcNQrNysrNRSULQRUMfSdVuUhjmt?=
 =?us-ascii?Q?0DqKYDorWsL/FB/l2lXfyFzlV7oaI37vKHtiK36SpTrgjolEQLB0tEGFMszX?=
 =?us-ascii?Q?HxyVhFvmLypddGbZkb3eh1lznM8nnkZOTfbRpTy1z4EL98jsLTeVWgOhKXX7?=
 =?us-ascii?Q?uzIKoTDjG40joxgMlu25yuScYIsoJvtRwXfBCija+uJ1egfq5uzyYD+EiLF4?=
 =?us-ascii?Q?tt8nxMQzmkXe+puTzskT6NFaOr0Ia2JasJvuIpO/hpwFBAX+LRbBnyWy8W6A?=
 =?us-ascii?Q?eE8DuLxnzT0lc2H0hr5Vb8JpcSk8AaqYTbhtF8YA0+Zm2F2nAFV46HZY3L38?=
 =?us-ascii?Q?k2/6z0QXow4co5EQ1O5s1YudpeYj2x5IcYG/H0V7Pg3USEh7vXf9xcADTjyP?=
 =?us-ascii?Q?MX7Gl+VTJSfdOFzkO0MTHkMOKUC3ANpHw5xFwRjbboCe67X3ZHIXKG5ZmE+N?=
 =?us-ascii?Q?WNfy1QlwvS+9sd+HobKaVeOG79rDU5YiUiULs1eEckv3N6lvgLrNH8EDoVnK?=
 =?us-ascii?Q?K1u+HeKlAPpyZd0EuHK/qFTDO6d9ZgkbGozM58uzcUZRzit+oCj2ZOb7w9Jk?=
 =?us-ascii?Q?5Tgylsv9N2P4sFFrHTMXXyQb5X1FV4ivVJvBz856/ajAeAIWdooLzcVxKpsG?=
 =?us-ascii?Q?Bu3Q4hLuMmNZLBjQ8y9TLw9dYXmpd8mZdokZ8KIKtm7oR3tYZqViRLxvvIlR?=
 =?us-ascii?Q?RjN4xC6EveXIyAmrtq0LC4aU7Nq7FHsGjcapVt1goj5xaK+AaEevyKIHG8Pn?=
 =?us-ascii?Q?KuLI4lrDOnToBO8kWXktG+aidJhPRonGSidWHa7QcjPMC3I8L6NrZypEkaAq?=
 =?us-ascii?Q?oPtNCWR70+1C4NaiCkRtU7o1cvZC9Mz5qDsfvkDoWsx/cjX9bHUxN3sCXlBB?=
 =?us-ascii?Q?gYNPM2n/S0y9ioyLeHbLXobJrlJZVln/idpFiYgYJeNMAOKOyc9SITc0Db4Y?=
 =?us-ascii?Q?HwLsa+AUJaqXvYUvP3MNNEUJF2VCnQpgS6+4LM2BBj+I+UmKIXeu6ps7te+N?=
 =?us-ascii?Q?b6ugq2ZAV+lJwEPC2ZPEyi8Zw5O9eaK+YezCrf7qvo6R/mwCvLFObF6Li6am?=
 =?us-ascii?Q?SbR8WevEuMe3G96pFYjTKUilDPkNt0Nqg8NpJudc5Wd0azxk6KVYrraXPbdY?=
 =?us-ascii?Q?yPDtEp8N/3At4Ozn4yaLsBvjUEfTO6nb6XskAsmcmAbrshflERcGSPMCiOR2?=
 =?us-ascii?Q?JE9NIVzyCNUo4UZuOu6XUlVOZ9tkhw9n6SCZeAGWhIulF/sBuTfu5YQZk84g?=
 =?us-ascii?Q?m0j95S0h3Ap67OEcgMStine8zHtIxClmxX8H7c5nX+qWz7Tq7OBPjwHax6Zo?=
 =?us-ascii?Q?blUesFGQtj2lSVxZtbu1fZyfX1/ndM+CUlU2gQBKZz+nryg0T43zdnklHEfS?=
 =?us-ascii?Q?K85Ef27UxiRKRzIfTDWjwOuPmCY/5KKhWcX6PwW6ZtKI4pvDfWD6hg2rKoNq?=
 =?us-ascii?Q?8hlDSr8UARBlRlE7FM8wgrkh95HLDr2sTpmHgq15KeKSPPcCzJmYeY+xOmLq?=
 =?us-ascii?Q?UAZlvkt1z+dJ/ozbxHHC9juFfRboTC9itJbZ1eunTp2tbrw6iP+eNAVgaMEp?=
 =?us-ascii?Q?il2t67EXeW7dveZyna0YoXXldrVLF2Kaf+KhHzoCFlgjO1hS7JBK+ARCIc5I?=
 =?us-ascii?Q?rJA0f57qnSmy1kbhrfaD+cpOK7No1oG8StNoarfmLLkKvOcZKcK7vC3LyWbn?=
 =?us-ascii?Q?mX3A9ety5NSd7atgwk8NUGKixpVCNV/KRqwrc7IPGK2M7XOjEkLA3qNJcXNC?=
 =?us-ascii?Q?KnanhixV7wkLbMOfuIElUR/Gj6OcfvM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f22472-8344-4be3-90c3-08df34a002e1
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:03:15.9513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcFvRX9RTGlQinj3ArjxViIuJtK1LYw2peESOPJk3OmON8ORaXLer2L420/GnOJHElcGj6zkkJ/xle+a3LlLdRY1FEuuIDPOI8PCORwB/mrM3nhpIyMvv7W8Zsepziv4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6650

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

It renames function name
-	snd_soc_add_card_controls()
+	snd_soc_card_add_controls()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-card.h |  2 ++
 include/sound/soc.h      |  3 +--
 sound/soc/soc-card.c     | 20 ++++++++++++++++++++
 sound/soc/soc-core.c     | 20 --------------------
 4 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 1f1e7d45f5533..ce2b8653f67d3 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -28,6 +28,8 @@ static inline void snd_soc_card_mutex_unlock(struct snd_soc_card *card)
 	mutex_unlock(&card->mutex);
 }
 
+int snd_soc_card_add_controls(struct snd_soc_card *soc_card,
+			      const struct snd_kcontrol_new *controls, int num_controls);
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name);
 int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id, int type,
diff --git a/include/sound/soc.h b/include/sound/soc.h
index f6b98324f3464..338662645b42f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -540,8 +540,6 @@ static inline int snd_soc_set_ac97_ops(struct snd_ac97_bus_ops *ops)
 struct snd_kcontrol *snd_soc_cnew(const struct snd_kcontrol_new *_template,
 				  void *data, const char *long_name,
 				  const char *prefix);
-int snd_soc_add_card_controls(struct snd_soc_card *soc_card,
-	const struct snd_kcontrol_new *controls, int num_controls);
 int snd_soc_info_enum_double(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_info *uinfo);
 int snd_soc_get_enum_double(struct snd_kcontrol *kcontrol,
@@ -1539,5 +1537,6 @@ static inline void _snd_soc_dpcm_mutex_assert_held_r(struct snd_soc_pcm_runtime
 #define snd_soc_register_dai				snd_soc_dai_register
 #define snd_soc_unregister_dai				snd_soc_dai_unregister
 #define snd_soc_add_component_controls			snd_soc_component_add_controls
+#define snd_soc_add_card_controls			snd_soc_card_add_controls
 
 #endif
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 282d666dae9ec..7dafe22d8a789 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -10,6 +10,7 @@
 #include <linux/rwsem.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
+#include "soc-internal.h"
 
 #define soc_card_ret(dai, ret) _soc_card_ret(dai, __func__, ret)
 static inline int _soc_card_ret(struct snd_soc_card *card,
@@ -259,3 +260,22 @@ void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *prefi
 	card->name = card->topology_shortname;
 }
 EXPORT_SYMBOL_GPL(snd_soc_card_set_topology_name);
+
+/**
+ * snd_soc_card_add_controls - add an array of controls to a SoC card.
+ * Convenience function to add a list of controls.
+ *
+ * @soc_card: SoC card to add controls to
+ * @controls: array of controls to add
+ * @num_controls: number of elements in the array
+ *
+ * Return 0 for success, else error.
+ */
+int snd_soc_card_add_controls(struct snd_soc_card *soc_card,
+			      const struct snd_kcontrol_new *controls, int num_controls)
+{
+	struct snd_card *card = soc_card->snd_card;
+
+	return snd_soc_add_controls(card, soc_card->dev, controls, num_controls, NULL, soc_card);
+}
+EXPORT_SYMBOL_GPL(snd_soc_card_add_controls);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 1c3ed2975cac7..de6d9746aac6e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2045,26 +2045,6 @@ int snd_soc_add_controls(struct snd_card *card, struct device *dev,
 	return 0;
 }
 
-/**
- * snd_soc_add_card_controls - add an array of controls to a SoC card.
- * Convenience function to add a list of controls.
- *
- * @soc_card: SoC card to add controls to
- * @controls: array of controls to add
- * @num_controls: number of elements in the array
- *
- * Return 0 for success, else error.
- */
-int snd_soc_add_card_controls(struct snd_soc_card *soc_card,
-	const struct snd_kcontrol_new *controls, int num_controls)
-{
-	struct snd_card *card = soc_card->snd_card;
-
-	return snd_soc_add_controls(card, soc_card->dev, controls, num_controls,
-			NULL, soc_card);
-}
-EXPORT_SYMBOL_GPL(snd_soc_add_card_controls);
-
 /**
  * snd_soc_register_card - Register a card with the ASoC core
  *
-- 
2.53.0

