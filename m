Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010034.outbound.protection.outlook.com [52.101.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239493A1CD
	for <linux-sound@vger.kernel.org>; Wed,  4 Jun 2025 02:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749004741; cv=fail; b=FnUr5pwRJfldTf2SGU5HnysXDnw3FtzMJp+HtijzhYxlK4F1XasIiXg91tcBK0XOAtEWnnemVFuCrSoFJ4jA1usVYtss6QbG1iP+iS4h2STdjwavVGkiIhdOL/Sy9jjqjxvLWgaKiM8XQwPxhzoc7bi96qVFJd0P0F89u5niY8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749004741; c=relaxed/simple;
	bh=im6DiFnu+OchOYTPL/tZU2QpgLX473L09fNHjnEo6J8=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=OxHATpXrNC/TqDrFOywrsVRDEQ3RLzAaAbhC8eoXcMAYvOdZIgYroSNf75BgmlRcPXV2ndwcz/SbY+FctLXihAtIrB0MznGVer+4lzhRzJOD2YWoLh2lpyfCUtD12wVPPvcL829uQk3op95lQoiXkeVDJAXk9+r0KSA/ZgdBGUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VA67QN6q; arc=fail smtp.client-ip=52.101.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VA67QN6q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/AdPKw1JElk6sjCs7lgP3jz2IrhMP9hHHb3LePd2bjU8RjSvZoIEAklcwADpf1WPeJyHJDO51zkNLCAVMnYkHJCscXb3wx1LyottaNcT6FZEvjzwjYexvv1nf86JYo9mH7zwSUx1K1u22/Z/KL0AwgS4ldho5d+C4c45tEhPz7Nn1wZWi2BGlHPSWr0uLqNMOjvMfsirzQDGo7XhIUHiR3BIZV8zbUzxat4x5jd3r858JLqBcun9hrtdc8fqmDknVzSCmz9Xq2t64KsjwpnE38Nb4hLMzGcK6P+3QEaUYu/aGzMZ2ZkUh88o21MTvGjlfPAswpsUW9ag7pRlJVrAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7srA++Bur0sFJHl14kiXqRMQrIWH6hz/23+dmRuFu34=;
 b=pKe31DCX91GqZO1wQmmYuqTcK3i91tpg5ZO+prcgeKQ4IeUmTj0zSRT21EqNCWQ2PtFhKRbhLjipo+t0ploiJcU5dvEGOF6nfJVWIskSZOA2wQNGnIJSUokYrZAYYtJuJgDEutoDMMbAXzGyoFpqlXu07QpMt+o/xtph3QkIzRFSy1cDWWwYeVHF4Fio1ibRumDF1BNgz46RkC9CETMcHmq66DtMyX6l/fX0Gid/G8BIPNXSESptyq3e1fSBZqsXMRZDQ2OOOc81eYybJ3Iq+Fk6Z5tWOg/nxG5i24dzkIT/V+mmOYTK0m5nWKjxE9xRt9iDPOl0hx97oaCz07+y7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7srA++Bur0sFJHl14kiXqRMQrIWH6hz/23+dmRuFu34=;
 b=VA67QN6qGWavkwe0o4xb1MgGq50x9rbcL5nSq2jFpwOCiBsUDSpFdXblygBZtGP7KhphE3Ghlx6rH688kBWj34BLI6uresUqJWgMaFXyIF6gjDe9mULx+w+ovdYo1p3r+yEMLfzdxdbNs1UX5Q35ZVJrrQ593vCIAKQA24gTpAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11219.jpnprd01.prod.outlook.com
 (2603:1096:400:3f2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 02:38:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 02:38:56 +0000
Message-ID: <875xhcut6o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: hdac_hdmi: remove hdac_hdmi_jack[_port]_init()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Jun 2025 02:38:56 +0000
X-ClientProxiedBy: TYCPR01CA0151.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11219:EE_
X-MS-Office365-Filtering-Correlation-Id: 231d7581-b4ee-4c47-eb0e-08dda310f3d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iTBWRECCbaxZEagIH9bvL++UA3cKhObfiIc6ZoWKpTuq6LkCZD7kEYhdUowZ?=
 =?us-ascii?Q?+4ubUyz/79ZMedudN/35CbBHU563bzt/Oj0abwUmYD11vz+TiKczDG8MG/FP?=
 =?us-ascii?Q?sHJCK3dRCRMPQFvAITt9jez26CU2I/ySttUQNALq2F6EvmxaSkREGbHihSoD?=
 =?us-ascii?Q?PUnbYPKSBg7jtNFd+uelp8TSzjQlHdSZ642QzdlSIIuaR+NpTL49DoKf78j8?=
 =?us-ascii?Q?GZvADBIPPA51SLdkZGaQ5G7yoRitT6i9OGeRwBqgtJDcewyZ9bOCwvtRSsFt?=
 =?us-ascii?Q?93Z3VKQkAZtK55K50wOrglO5OON/Z21rBgEGQme/3A7wsSNKJvICT5DaocO6?=
 =?us-ascii?Q?7HfeZYxNrjXevalJh4q42QOi0GfmkCvdbAXCfQvKAZW7Jct/HWUMKDsp+8yh?=
 =?us-ascii?Q?mdERR5pLGtWRthj3Hsg8RXh/6V9HimXMtYCM7K0VWtRYcrY++UVxySU1zVFs?=
 =?us-ascii?Q?8uN6W9plXDZDqHvTVNheChwfz5w9o3cQBeubJ5bf9K913v/vBj/EhLd0YXOv?=
 =?us-ascii?Q?FNMDqp9bAh4JaJyT967jqiQ20Kch7aDLG6oi4R3ci9gz8EJU+F5gVXNoKznq?=
 =?us-ascii?Q?OD3sKh4H7nE/do7owZkjn/wfD09c8bts1Ii0ClK+w4qy4BaDYmBFsJq7LkeX?=
 =?us-ascii?Q?+wILq7mSZRi8rKhGZmyl9CWXfn2x5qwEna0bu6Monsfehu49f0yNO5LLmUVO?=
 =?us-ascii?Q?jVCyEfgvHRvz3550QwIRpLbVVGFExzpwKWyYvb3VO9vOd1FQI2gpYnjnxiVb?=
 =?us-ascii?Q?/U2nyn/1t86VIu8mKnu152QTmIyHw71d+ptb2Uhhk3vYRT7oom/fG4hJkOaT?=
 =?us-ascii?Q?HFR6pwMUmXX2FTYqzcfBUEut5wQ2P5Ty2/7zlwwd6pZUoqOqbKifYp+JQi0U?=
 =?us-ascii?Q?iWsch6s/HGqCDeoNryx4zE44bNldHomX0F2JL1g48kBd64WFJ07QNxT6gWbH?=
 =?us-ascii?Q?RL8c0hSfMV8h3wsa+RN25nP9nv9FtYq0xyxyyHHi0TzspivQn1q5UEvjWtDh?=
 =?us-ascii?Q?6almDinav4rr33NpgKfZWVFFiLqH1qIDHhWMPZARBkjDyPC1cEoSqeluq7OX?=
 =?us-ascii?Q?4wZtuXxE/vSEeY8wTommALtPWI2+wg20zSKzlfBs2lZ0D7ZZphDw+KAH1WCe?=
 =?us-ascii?Q?Bk8sWO8clVmX9C4kl42+pCA5zfp+bb6gcGhTayDsDbsYpyFs1gIEileJ9WGF?=
 =?us-ascii?Q?pAeJ/RVq45QcY6v6BGgr3oHqW3c9zA0KWdgCqXIExln3Sp9no57RNKuzCzJI?=
 =?us-ascii?Q?kBEHXKcYZi0IB3O+4SBVfZGRhsT6nOgY+oXyiiJyTQi4u9hRmpNG+YRYmda1?=
 =?us-ascii?Q?BBe018bwT5cXLS3R5j5TV4o322SXDs911IJaHxPGxlHj0/V//TBNZXFeO8xP?=
 =?us-ascii?Q?2KsLc2x4uNBHJumyu6cOOBwx26FmvJxqm8chaG2osSsRSKS8N3o1z26l4DV4?=
 =?us-ascii?Q?6OQ3SeAz1wttsUUEH3iBrrCTbho44OmndEBkruvRILpbA8N+im+aMA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mDDbEmEB/9pFqw9rxvxafwRHrqM81UsZwsL32RSkv+n5Vvc3EtxOsRq2eZo8?=
 =?us-ascii?Q?IGSzrspFNl+Q35Nk1AdAkyyRW8q10d8eFe7Me4TxBIpQHs2af3yIT2d6K95H?=
 =?us-ascii?Q?7RzyztkGAmuHXTGEbI5rABBbnQY4LiQO9Fhm+KJN7/YNRE9KRmRuEIV3myKL?=
 =?us-ascii?Q?LRIaCTQa3gCLARN5hHRjSAx5j0YG2aCcEiSsRXsJxrN8zQs4DykoRxOynjae?=
 =?us-ascii?Q?beDRYKdmhrMH4aINRqhib/cS2BaMxAgW2MwtBoc+JrmY+poLNBnjkyc2q+Uy?=
 =?us-ascii?Q?SB4QOxp1RqAcu27tKRfIeBXdx2gvuQL+KyfavPuXo0uFDDhFpGeOrsvfKvLS?=
 =?us-ascii?Q?ZyP/TUqCCmXGPPfP8oPHflGgU5OINeUNJjGtrxzwNy03j95XygHxDZTJW4ym?=
 =?us-ascii?Q?tpfyLwvBlOhItaufKjREFBnbf2XR6WOFQczaNik2aQ/Q1k5Jih/LEWaDDC/B?=
 =?us-ascii?Q?6WlKh0akcNwKRS2vAiZKdN1TziSC2/bP50CAY01MPisNRrPv4KpVKgzGKDZj?=
 =?us-ascii?Q?li7dVWWybqZG4DPvQpov4eEvAusY3a5UeTgicflzL1KJP4Eo+3KQD3DGYZy+?=
 =?us-ascii?Q?oLg/XtTKgiayMVo4oCAr8yTk2jPY2xD3Hejr/PVMRXtuasQz+sxMpc6gPnhX?=
 =?us-ascii?Q?19npuWn1Lr34T3zAjxj+7lZ8oPxetMzbNeyGboZwKLBviP6fxLVVzexJjTw1?=
 =?us-ascii?Q?6JOCZ6QcMbRxBzDgm0ckBzCz5ICVdJCZB1xShoD0hSdTDfcx5AQEq1k0GnBw?=
 =?us-ascii?Q?mfMrk7aUWCbDARXSB6XmwZsLfxCvFQYZpkQTeK9SYLHKRwrZ34X8bJKPfEEM?=
 =?us-ascii?Q?uChrAJpcVCzLFWI9k3llw7yNvozpMZ8OCQ5jSrRVLzoYxHPQezgJSaw76ZgQ?=
 =?us-ascii?Q?yZdTK9ug2WzFWdGZNBMfAPTUDReThN5VEiprs3TIHFaISoCr50Bz5NuAZA9p?=
 =?us-ascii?Q?1iLbEkJh6U9PKvXvQEaWcDoRy1JLJ6Tbqwj2LGVAZVzOPGnOU8q39oQ3khvx?=
 =?us-ascii?Q?mMUUCXbfxrX7/sitvAxPV1fLdtmcE77Lw1Wh/X89mL24PPk2f4Qx31uFJCXM?=
 =?us-ascii?Q?XpNzoWkZvfMbc7hnAUVJB4JINanyJ8+Ykikkw7+8Dr2JKi2Ye6cp9Y9qFyo/?=
 =?us-ascii?Q?wY+KgF00c3K6cHVDSgIQQNzXKdOFToOu9+N9wkgsO1JWp7NbSiUFpcBi4XwH?=
 =?us-ascii?Q?q/+1bRcMm3mD0KsQY+UIVtPET9YUKMhmOQjGN8r7rflRYf+lix5wKnJVvodw?=
 =?us-ascii?Q?K9vlxIElYpBc1skVfSHhB0WU9dlSKve8DBiwkK7C5xh0/QHMne5uIyqqTyyg?=
 =?us-ascii?Q?z0ITq4AVFBg/MEjyBVWK9xeNaamKUMlBniRZEvSjWq89za5QSxzyPdXz8I5G?=
 =?us-ascii?Q?IjeNH0PXNETYQEpYhU/GWFXewxt53bXYhMXr2cYK/7Nnlb2zXR4nHHN4HfKi?=
 =?us-ascii?Q?F9mMMtaHvqGY23yFBid4PV3n3VKCpJsBhd+Shq+fJ5BIgOQWW7JZvND//nzV?=
 =?us-ascii?Q?bessI+BlLtFpYRNTMAX/S6W4OBpDuf6i0WjwCdHo6lsu0nl/3BQEG+tkRYA0?=
 =?us-ascii?Q?csMavVbEhXhEwiImYOgDoAvcx1s8eOuTDpPWGejOiS78Wdo3MFytX4TSZlb5?=
 =?us-ascii?Q?tw=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231d7581-b4ee-4c47-eb0e-08dda310f3d5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:38:56.4355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVd5+4DNdC6jpN01Uu5xNPBcEMMduq2J7z9Kv6klK/F5DLVWTdc0WpQH+YeN1qMvTHXOR0PIFvfkpb0GwVEAfZE9WqFo9lHNZ8ShsMZQSKXtD5JkQbZAn502+Jb4EP2h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11219

No one is using hdac_hdmi_jack[_port]_init(). Remove it.
We might need it in the future, keep it and its related functions
under #if 0, so far.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
This patch try to keep code, but please let me know if is should
remove all.

 sound/soc/codecs/hdac_hdmi.c |  5 ++++-
 sound/soc/codecs/hdac_hdmi.h | 10 ----------
 2 files changed, 4 insertions(+), 11 deletions(-)
 delete mode 100644 sound/soc/codecs/hdac_hdmi.h

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 1139a2754ca3..a91d5e5f7272 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -25,7 +25,6 @@
 #include <sound/pcm_drm_eld.h>
 #include <sound/hda_chmap.h>
 #include "../../hda/local.h"
-#include "hdac_hdmi.h"
 
 #define NAME_SIZE	32
 
@@ -1431,6 +1430,7 @@ static void hdac_hdmi_skl_enable_dp12(struct hdac_device *hdev)
 
 }
 
+#if 0
 static int hdac_hdmi_eld_ctl_info(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_info *uinfo)
 {
@@ -1546,6 +1546,7 @@ static int hdac_hdmi_create_eld_ctl(struct snd_soc_component *component, struct
 
 	return snd_ctl_add(component->card->snd_card, kctl);
 }
+#endif /* 0 */
 
 static const struct snd_soc_dai_ops hdmi_dai_ops = {
 	.startup = hdac_hdmi_pcm_open,
@@ -1754,6 +1755,7 @@ static struct drm_audio_component_audio_ops aops = {
 	.pin_eld_notify	= hdac_hdmi_eld_notify_cb,
 };
 
+#if 0
 static struct snd_pcm *hdac_hdmi_get_pcm_from_id(struct snd_soc_card *card,
 						int device)
 {
@@ -1933,6 +1935,7 @@ int hdac_hdmi_jack_init(struct snd_soc_dai *dai, int device,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(hdac_hdmi_jack_init);
+#endif /* 0 */
 
 static void hdac_hdmi_present_sense_all_pins(struct hdac_device *hdev,
 			struct hdac_hdmi_priv *hdmi, bool detect_pin_caps)
diff --git a/sound/soc/codecs/hdac_hdmi.h b/sound/soc/codecs/hdac_hdmi.h
deleted file mode 100644
index 493fa3b4ef75..000000000000
--- a/sound/soc/codecs/hdac_hdmi.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __HDAC_HDMI_H__
-#define __HDAC_HDMI_H__
-
-int hdac_hdmi_jack_init(struct snd_soc_dai *dai, int device,
-				struct snd_soc_jack *jack);
-
-int hdac_hdmi_jack_port_init(struct snd_soc_component *component,
-			struct snd_soc_dapm_context *dapm);
-#endif /* __HDAC_HDMI_H__ */
-- 
2.43.0

