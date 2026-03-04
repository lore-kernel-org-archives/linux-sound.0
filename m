Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7514F37FF42
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605406; cv=fail; b=QuZzyvr22fuUShnoSctsyIlIXlIx61ErYIeO2ZbgG9NCicprncb3/AWkQDdIRy5tvUukxS/lYU6OMNUBxr1nWynUp8gS+Rtw7GEcou1kCyojt4cFUMnMW9eX7PCwGT9Uf+qjbsIatGnz2mIjftEzTaYxoSpH9p72ubzB5wnA3Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605406; c=relaxed/simple;
	bh=uklYYAqtKLDNz1xZZIgBUdUtuTqvj2Yyfvt0j0EUad4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OCjNbtvgXox5qePGowkd5KxelYdONTiHt1sAfbFKqwbLHf6w7gUwhOxjLKH+u282fSQoHnb+SfQH2yD3ntQRpYZ5VCKVD/g0Rn4YE8mx3Ug560ygkd7ovWpRSvn99li1+LprrW+tPsHZc1CCtfJ1ZYNqXXISs0GZ4GiHpxS3jcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=m7Bay1mm; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="m7Bay1mm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oc7d6YltINEtWLrYgwq0k6hm5GiuJSgv4M8bo1ay6we7eF9A/tkf+Uaz2xAHAIAsyOweD9C4+I0GhfeVOcrdTrML6MusKEjfL5qcvoYohDjJ16yDdnbjKEWP+j7TD4E5Q7MOCerdlA2vZzFoQ/CzN8JWpt05v6Qgr7yeAixEZVxAeUh25VVNyabIqFuWUyN1UxWtPhC5OBQ9qXezHp1+bPKzrA2sD0ZLvWzmbsOcdqKXtCXPFAUOHfHyhy0rdsB37UHzJw8SiGF9VEJ82EAAUnFapoaQVvRsLtx88n71hH9iV0FigTxXzngXo7OywlmTp466TZfySFsHmDtZNWPKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcA28IcV/5hzaujMpQ4rpBMjwJJ6CjxyrYMzjR9QPuA=;
 b=EI/J236fKLHkm7KlUcWQ5H6hXW684DZHXrarxQqJHgJ1lkdWasdCTPgKlnZ0EnzYSOVAkz2sFwYvg/lX/vFcXy3Ffdl71JNC/dwIUAoRY60CBfNdtyzRAFgYKXIZkbpkqQGxCxrahQtVCH2nFGUJQZntVe1RVnRbq6AHwv6wPug4zoiM8ZRbPn/B5GeAwGT1tAAXBYgDyEg1Kw//KboeJp0Ykve11lRLcA+gbl/dKjatJhelQjeUm7kxOU4H2CKge2ITZ+4vVNYkv1jh+Z+7oeyE6xR1/UR5bSS9q+JqtSgbQT7lZZMgfEw4slqJiSfioe3HSEMVZbsXtGA1ExswYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcA28IcV/5hzaujMpQ4rpBMjwJJ6CjxyrYMzjR9QPuA=;
 b=m7Bay1mmfzAA+Qq9IFUyc09bl8H8HnyFvf3A5xyrxy4OjbNzK/Q7jSBWbQJW7Ccf0eU8Hfo5wewcr/gFxjLJ5AVYtkIX3ANEjWUJoRE9yA8gqngBNj+eIJEe3T37CqB+bfpctK6xIb/uy1Icp1HtMMf5rAWJUpjezStDuoqLDp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:23 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:23 +0000
Message-ID: <87cy1kp0yt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 13/29] ASoC: intel: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:23 +0000
X-ClientProxiedBy: OSTPR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:604:220::7) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: a818d71e-a0a1-4cc3-3dfc-08de79b689b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	xtnb3oRbDAX1gTQ2KuUpboHrtqG4hQyDURXOzVLzysTv7N4BcBY29nfP3Gx4Csem/ueyvrNUVAuT2XD0zm/VgGHUQyVjTrUQfq6IfeS1MWgGo5egbDnobT7OiXBce1jP7Bl/iIiSzMmpav6NR1eELZbvF13fTt3OGTuCTyCjAu2jaBUrokXfy+6boZ5KFAuvxHVgj+/DhBDfD0RlWl7f54po/ADCDon8oQNzMKBEpV0lwA3dA4QF8bMXVe7qIo/vseRmQQLRGes4PsQrzcRvIIS/JgHLZYRpcpdIMn7pXZp+8n8QAsRtrH682EhnWVrDDiPtBJoJ9UAViQ1tRpfo63JHtiCj4Fp6ZHTUINqn1trBJVE5t2aC0//UvCDasm5Fb0vOmOiKMMlj3uEYrD+yhioStflBP4SkksufrSZfTPFkc/0wBrRkr29AW2xKgcrmpRMM6ghDMF1zk6KucDP4Q7ez2yL6JWB3vPxbAijGbxKQlSg4Ygsba7Y78xeK/DmU+BQWh4oZtqRqe02yUx3DiW1M4FZua03dHh7zoO+s4hVh/5O4DkDo5kbb90edvfVJqUTGhpneEzSJFO5uocM8xvquVRO7bWuGuDMDeFd1nrn5FsCTOh7p6mZzCFISCdmGfAiwYdIrZqUe0au8oLDPhQsoI7KvmdWp+E/7EimqPh796dFgLBZNsx64JhnJAn1DwQLsdDLKV+JkoIfiYj2REnotHGvMQrlpXIraYS6QEJWVPj3wPrpn9ElJQWJXEyZ5EZsF5XELBtHVTq1hJX7E8WSZevdoBSikMSzxCiDq9ro=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sMpdjT6JrI5gyEpYl6IZuSnvg8XuSvl5B6uRR+wXcIJGfbBJaUobMQYWH1Jn?=
 =?us-ascii?Q?bRxg0YayTQfk8lAgTv+veoHrMSh1YF4k0nE8ndZ700FALEkLxq5WnEglgMlg?=
 =?us-ascii?Q?rK4ROZTxlp2Rl7S8YMCAin+3prY2ml5vvagbK6F6/N3pVcWqrHjdCPop7Q1I?=
 =?us-ascii?Q?rxp7+BZ5dhUXjGab6rb0O9q4squGUde7G4/77Awvvj2mZBsdOKL0/KgeTyXG?=
 =?us-ascii?Q?H2wOLbPgF+noYWQgIisp64oLqax9/7BroD8YfwwjhX+1V/wbNJIRF2Ob+LMx?=
 =?us-ascii?Q?gGl18YBL7gu8AWLRNGD07BEzPHAkWr52nIbGx/9AOVpn/k6p8tolwNwoyq5p?=
 =?us-ascii?Q?2roA/ccAKJJJC5sMJPKGfyDvQVbzmeO4ul8R1JbICnd9pwpC/sgohVtW7MmX?=
 =?us-ascii?Q?qr3BT4IAOzgWnUojbvQ5jiuhIoqVJE4RFR59gtWj/HfTy+0QgUBJvBwJlqYf?=
 =?us-ascii?Q?r4UUJcsOAHTc/iBJOmjiasIRvCa8ufk8fHh6GS3T4Q5ORYWDBNgLBxmyne2s?=
 =?us-ascii?Q?O8KR6c/2YmE5spsvUM0Q+aTeZJVeF354N4oZ0XXdKfWmUNedjDFBmNvoKcN4?=
 =?us-ascii?Q?M6LyKLl6aUoUP8Nt5FOaeY9SFgwbIgfLqKVVCjJUIPyHdGnHjdKuR/+geXmS?=
 =?us-ascii?Q?pIs2j1XI0igs4HBmhLSwKZBnB4QP/SE3uXILTPezqVIMeOl3HW2dtsTJxR3V?=
 =?us-ascii?Q?U6Sh1BOifUXNDm1BODZ50Bnm+vOn+MP3155iooNIczOPSJaPn1ReqBq86X0M?=
 =?us-ascii?Q?U5Q2ZPtEHPlGHSLSTIPe6eRUk4ZHaZrdv8WTI6ssayuk7ISUAnegYpNSduYG?=
 =?us-ascii?Q?VBYpIufP1grNGAjSaXulAEcqmmM0cY9K2rLAn15cHv80bW2h0nMTS4+osv1A?=
 =?us-ascii?Q?h62fxdZyPnsBX6CQJ+p0zRDHyxmDHFCf24yOzVfriptspLw1ls/v2siizbwp?=
 =?us-ascii?Q?bhtG/m1I73lCVcwKN65uG2tqSypzL4fBzvAhAuqjgqNzSLnUixnxA05nqoHC?=
 =?us-ascii?Q?Cu6PB5UQIjhDmnIUQB8BlB34g7JEHGHiCglOdYtD+zqs5BLIfK4siAlaDJZL?=
 =?us-ascii?Q?+9V+Q2lfwktr1mzdwNI0K+OBZdvAdOtLvBTKEfFUOoGjjW16Bibrx5HqhhI4?=
 =?us-ascii?Q?ST6xbgQJoGYc0z3hdT+D2WnCqIItz8UBNK1z8Dc2IYojhGGUblEUBAClAgj2?=
 =?us-ascii?Q?YHna5vNE9M8VrBUfQCiS3nxsitfmqfSPHixcGbQVQBxefZgsM0d3UZ1igftH?=
 =?us-ascii?Q?fwX/XEPExhenUqz8nqbHr1af+XGyLbQTAzBL8qtURfoyn978PzP4XA772LhZ?=
 =?us-ascii?Q?kHWOj9pia6RIsFMwnifqmMvqtKl0GrvZ1luchUFAk8+AQVYImInQpMEyv2CL?=
 =?us-ascii?Q?HmsIo1hFG9XHC51bkZDSpoX8NzI3Pm/jEe0u/9mf0A2IMFyaCH4J7WjXnkpQ?=
 =?us-ascii?Q?CGq0dHkchhNNRGlGsKSHIfUthkR8icA2LZdmxfQT0lE3TL0/CcW7Zj5nNw4V?=
 =?us-ascii?Q?2Xm/yZDK1RTlovqjUpBEN8koF01ChFlvinpZe/WjBMF+efJMLaJPplkWwmGr?=
 =?us-ascii?Q?Cys+0l5t6YM1s+d2pUjeOu/LE7pNdszEVe2ttkrK6IKj6PUIkxXcoM4AVriM?=
 =?us-ascii?Q?DJbCW30a45m/BtUKX71q/YVRpXp0x2Z10eZCArRxYTzeFLhTvCLXJoBM3j9A?=
 =?us-ascii?Q?udb8tS1jQLMcq2YBBg3p/xEQ7mvKhlRiZzMQNs/P84dQShyoSqJ1MqOpa7kH?=
 =?us-ascii?Q?DLrpMHrLSkjaGkZlsS4UDmc2aOo5rMYQLiFQ//H5iOYakCLArGmt?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a818d71e-a0a1-4cc3-3dfc-08de79b689b3
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:23.5375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pE2Hb7lGf34hwr+HX4+UA+GDxbe4yUYREx6GgBpCaz62rPBnkZBMYHdndD6zlGQErjOHrJhqV05RFIDeta9e4uvmuUZ+0CWkxdGxAcMq2/htDWs3NDfuHHMhHebzzrLg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 2 +-
 sound/soc/intel/avs/pcm.c                    | 8 ++++----
 sound/soc/intel/catpt/pcm.c                  | 6 +++---
 sound/soc/intel/keembay/kmb_platform.c       | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 67caea39b5570..f074af2499c83 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -707,7 +707,7 @@ static const struct snd_soc_component_driver sst_soc_platform_drv  = {
 	.pointer	= sst_soc_pointer,
 	.delay		= sst_soc_delay,
 	.compress_ops	= &sst_platform_compress_ops,
-	.pcm_construct	= sst_soc_pcm_new,
+	.pcm_new	= sst_soc_pcm_new,
 };
 
 static int sst_platform_probe(struct platform_device *pdev)
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index d53c2f76fcd40..797b9c9163b49 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1349,8 +1349,8 @@ static int avs_component_mmap(struct snd_soc_component *component,
 
 #define MAX_PREALLOC_SIZE	(32 * 1024 * 1024)
 
-static int avs_component_construct(struct snd_soc_component *component,
-				   struct snd_soc_pcm_runtime *rtd)
+static int avs_component_new(struct snd_soc_component *component,
+			     struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_pcm *pcm = rtd->pcm;
@@ -1377,7 +1377,7 @@ static struct snd_soc_component_driver avs_component_driver = {
 	.open			= avs_component_open,
 	.pointer		= avs_component_pointer,
 	.mmap			= avs_component_mmap,
-	.pcm_construct		= avs_component_construct,
+	.pcm_new		= avs_component_new,
 	.module_get_upon_open	= 1, /* increment refcount when a pcm is opened */
 	.topology_name_prefix	= "intel/avs",
 };
@@ -1755,7 +1755,7 @@ static struct snd_soc_component_driver avs_hda_component_driver = {
 	.open			= avs_component_hda_open,
 	.pointer		= avs_component_pointer,
 	.mmap			= avs_component_mmap,
-	.pcm_construct		= avs_component_construct,
+	.pcm_new		= avs_component_new,
 	/*
 	 * hda platform component's probe() is dependent on
 	 * codec->pcm_list_head, it needs to be initialized after codec
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 2c5ea4e0ff3d7..ff273094046ff 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -574,8 +574,8 @@ static const struct snd_pcm_hardware catpt_pcm_hardware = {
 	.buffer_bytes_max	= CATPT_BUFFER_MAX_SIZE,
 };
 
-static int catpt_component_pcm_construct(struct snd_soc_component *component,
-					 struct snd_soc_pcm_runtime *rtm)
+static int catpt_component_pcm_new(struct snd_soc_component *component,
+				   struct snd_soc_pcm_runtime *rtm)
 {
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 
@@ -1122,7 +1122,7 @@ static const struct snd_soc_dapm_route component_routes[] = {
 static const struct snd_soc_component_driver catpt_comp_driver = {
 	.name = "catpt-platform",
 
-	.pcm_construct = catpt_component_pcm_construct,
+	.pcm_new = catpt_component_pcm_new,
 	.open = catpt_component_open,
 	.pointer = catpt_component_pointer,
 
diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index 4ed71d11ad778..6659e8060ef3a 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -388,7 +388,7 @@ static snd_pcm_uframes_t kmb_pcm_pointer(struct snd_soc_component *component,
 
 static const struct snd_soc_component_driver kmb_component = {
 	.name			= "kmb",
-	.pcm_construct		= kmb_platform_pcm_new,
+	.pcm_new		= kmb_platform_pcm_new,
 	.open			= kmb_pcm_open,
 	.trigger		= kmb_pcm_trigger,
 	.pointer		= kmb_pcm_pointer,
-- 
2.43.0

