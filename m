Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A01521C160
	for <linux-sound@vger.kernel.org>; Fri,  9 Jan 2026 01:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767921319; cv=fail; b=bbbYnXAGRufZW16wvQW8fcLxXL8JYfGJXu5gtO0oLcFTIUJqk+fIevMvLP8RSyBITpWJSkSsRg4GJNoKjuafaQjVi63U0sw01kIIDH/KtAIPXppJqyoNCS3z9Bb4QO4OX7pYbGqT0wLVIUi4k2o5Zrwcnc8KZhh90Uzpzk+++2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767921319; c=relaxed/simple;
	bh=XOvRKEQVE2By/pZOPskyRY3FSvQNrkV6Yz5wS7zzIEw=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=I+rW7XcLkYdhCxDIvCeBGyiEN5n3UWzQAOHX/szq/MUtpl9V85gSozk6uXhQW45/F6c9dxpZNNvAjbqPu4ntVNn716fAPQSz7gJazLAnOfJxID7qHLs9HOU3CA1zsUbJyAMylD3QCJHL3JiQ8esIVSiY2iDEHjUNPDdQ2bIjlTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZwM1hm6h; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZwM1hm6h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0gxhCt2pUwSfjYMMt+jixGZmQa1mOpMtiVNAD3Gl/2GfTrMyOsucIVwF1jVSnsHzZXVOBM/rrBPLNL5vWse+xnbKCRnr43GdHu+94l0M/un1qHBG45siPLMcxmMQXc/V0ZTtNDKChDVWJbgmpmhNieMhdmfbzNmwJ7wGYdKA3mFdJ3ZnHiCMNGkfSxgWQdlnq22Y/G6O/eEKg3NTSR211N1E/R29haPUhrOm87yaz2EN5/XHOTvHY0e6Lp/g/YobRIaJvcsTyl+py0Ngr6y5l82c4Sg4Y5xI2AU3/3T81v2w6cub2RaXn7hsCQnJJIgvZLA/c4QqIokq7IVN6Dqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTQpABQsWb8EWIK6U0pnSy0DXBpk466LpguWzin5orU=;
 b=jnSAfIGYIkfLzGj8OI4ylpHtVogAWPekuxMP25QkF7eluf6/TTalH6W3IAaaUWJ6SN4SFiM9Uaa+teWZCNTs2wYkSrcb/hH0C6KffS/HU1aC4r+DFFpkHi/RQkSmQqDvuDahFR4A7GzwnkV4QkXLuYDbmpDwmMZ2M7nTmhdbxZfqe4UumyhS9Pjd8wEvOGaWY0vqx/tTV9MgH0ZLhZIRTIxcU5zZg7RgKjWWelGS7dWK8Q53ed8znzSVkSrDr8nKEJtxxAi1bSLboNk48ZwbtxZlu4WZXR47Sr/b1gyM8cG4Bzeqc0T1u61nPdkNOPkRcUdl0rcYcsPHGbnL14vGCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTQpABQsWb8EWIK6U0pnSy0DXBpk466LpguWzin5orU=;
 b=ZwM1hm6h+fu0LPf5dXSjIcMbc5FLl99tdME8pA+WsUAcVPSbN96svvFm3bGNvCH2VI3Eou2eQmJB3F3FrjE9krlamBzg9r6oMxTrvJlqJYyCeUpbuiRqjS+bbGSC+2Sfjbm3k7JyLyAP5Kj91+3bkLHDZ4/P0XFBaeT23UuFJIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OS9PR01MB16851.jpnprd01.prod.outlook.com (2603:1096:604:408::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.1; Fri, 9 Jan
 2026 01:15:12 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.001; Fri, 9 Jan 2026
 01:15:11 +0000
Message-ID: <87tswv1t9c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: intel: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, David Lin <david.lin@intel.com>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 Jan 2026 01:15:11 +0000
X-ClientProxiedBy: TYCP301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::6) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OS9PR01MB16851:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1880eb-26d8-475d-5e89-08de4f1c8977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+kdPDScc9xB1sPVQgRvE3UvdMlI96hVK4H86u3qivxyr3oIhsj8HO/NHAXVx?=
 =?us-ascii?Q?DRpg9u78LE6ucSdSwB836S+TM2nhrHnQZqrpQ6xOgYIP6vuUASLXq+wvw9Nm?=
 =?us-ascii?Q?zym1HwOgBVE+bHzZkt3Fkwpu6Cg/Vw7lwHbGTGMSlv8hQ4M4TE9sSlQ74kwo?=
 =?us-ascii?Q?hXCLXprWLFB/CocAMfxVfTPSiZtTD625MXilE6toQtypVgg7IPcjeHCXf037?=
 =?us-ascii?Q?W/0hyLCQoHGrgMQPL1Q0eGx9yhpqDYByrUW75ilSXbGdDoEvkvWK3JTeXQvO?=
 =?us-ascii?Q?c052+ON34VS6hr6z5p2SRkgu00V2fqcT0HYqh2r8K2J6j0xtZJGx7w+ZZ5nF?=
 =?us-ascii?Q?wdbL/6Z6/LWuSWgxjPxmyZWpbgekt6mjCAqLmKqRbB08fi7QGzw66xFUVtA+?=
 =?us-ascii?Q?6QzYU11kuWvlIG8v7Urndhn6xUlrnLXfLfLR1ARrtWrO6jm5XED/vBDK1oQp?=
 =?us-ascii?Q?xuu8mWHL/0PpOufNUaWvjQc1C4veJtoNu/0yDw2Og8ycVl4u1JeeVO9zxqPO?=
 =?us-ascii?Q?1kT6fAo73dcsj2ap7f/2qDU7TlZt+8yDMhf8LWRr41JwpBvfxvnqTvAYaedr?=
 =?us-ascii?Q?HGVvAgUhAvykPRIOnIzhvFyYLOy4RPZBztjq+repMVJ+bmP2Y0Zss9qquI0E?=
 =?us-ascii?Q?IRXY63VykPmlQ4HBGVFCWpvDxMV7KGuuTIN6o9DceSJIYsbsQg6PzyqEPB1p?=
 =?us-ascii?Q?SHEP97e1q69bHPLr7k+emk4eVfjFNGY93FCr7j7+FFmc/cP9exHHE1BG1kaD?=
 =?us-ascii?Q?x0ViCUs16muzkPfk82j8gzBoRwm5vkNjlqkkdvOcrRR1eOOzVi0dE7CT0QrD?=
 =?us-ascii?Q?X8+nXZz/nrvMCFjqLCxcIxk4c0NgZK/2LkCFuJPdnh3uULNqiiZIR/IZZ7iS?=
 =?us-ascii?Q?DCIfCyhlbS6R7mq0RZMdRCRSof9ItcmC0S59O5I+n9qAJtcaMy9OdvcttLTG?=
 =?us-ascii?Q?b7cAf94wedH9yQuvlV6PRuhKlLEJ2Ajz3AQJJ1Irdv//h7Dd7F+2SFddtd5O?=
 =?us-ascii?Q?9bM66sz8uuwM+Q8KQ9GlH7c/HXGf2xwxk/PvRWPZY5op8iFExn9HVsjc9xH0?=
 =?us-ascii?Q?xS7FueWQZTU6bXKF7gfssbqVI+1G0gd03dIgXe7yX2fCrNkAcdv37MbdES2m?=
 =?us-ascii?Q?asR9HrJv8KZaUcrLuHZGs+O9SEk0Xa63AIp4in4tz3qBYK0AiVXJm00/7NAe?=
 =?us-ascii?Q?YLvan52OBGcV7irKKB8yHCN5tfmsK3R9ckHGF/1EzwEshASCBMSJJs+jaWxD?=
 =?us-ascii?Q?2OoE6lpYiw590Kh7hIR1hzDhPE08vKfoRDA6buIZW+KvEq+IAag2e6pkNKr5?=
 =?us-ascii?Q?Fn3hNsztIt0NuCN79HxwiteqEGDBU96i9S3QbWomCYR8XKuojxTDNLS8w9jm?=
 =?us-ascii?Q?CXxdufKJDldto1rgWAIF1HnV4uI1P4rHEW2dzZXGPH65OuMwzwiyncNMU2hg?=
 =?us-ascii?Q?fX9v8nI5yUcEMmGsJV3o71ew3FKX5JGptgEP59o/hYNrKNeqEKebOdjyKT2x?=
 =?us-ascii?Q?U/23vRJjDLbJESp20AnPhEtNHe88X0qd1ZQr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V2iVDAgNr7ZKmuydr7QxHs2AsIo4BLKIljBMrKNzRZYWbuF1v+kukK8gNGEg?=
 =?us-ascii?Q?6yXDx/mHgf51utvtXHp5B3TrwXRdRfW7KeTDJ08xP8XeHTa7tuyiOgZKmFve?=
 =?us-ascii?Q?MCZFP9+s657Jcp931Js5dqR1ztMFhq/zAOOVRaUE3Xk3bcSzR87K8aE8Sikt?=
 =?us-ascii?Q?GHm28o+RIBPWwp5vgYwzox580cezxYJm7dPIGjY/EnH8eSV1ZCDNtweHS3uq?=
 =?us-ascii?Q?x5oEUr05RWDQkUM659O+M565VI5TXYEZZyf450o+zzpp7GOPdHXzz14wzqvE?=
 =?us-ascii?Q?NX6MCc0f0KkU/VcSWifEnM67o7Z9gZNVyZH5k1+0Du+SrYbvc6CRBLOw7e9X?=
 =?us-ascii?Q?Vac+19FZTY96IpxvZNwUw3Y1k+vzAoZcVO7YvV8SDsTGZfS5lMN9Og3OgrTU?=
 =?us-ascii?Q?SSdaYBW0xnaOTrKzi6ZHQHiMRtmc6qAfGtJYO5xgy6CVxyQxmmJLOgufgoEa?=
 =?us-ascii?Q?e1cki0Wx0eY/vcVVkxSFuF4zTwAsFWe6RTwQfCTdwLIEs1mZtF8usxFuMjkv?=
 =?us-ascii?Q?9am/AIib0qebZuALgE62RnD90hCpzwj0GC+XdEJJKdyLWsbHVVWrGVBo7z5w?=
 =?us-ascii?Q?hzWn7t/MaCwvnjeQBl18El3d8KPcortkCy5wLsDuNfa5ETJjtFy5yV5q3IxY?=
 =?us-ascii?Q?gRNF7DX3vK/PEsPwGkAVIwWd6H3zMgh1vFGIlXwdM6j07WfXlF8tK4Dsb0Yp?=
 =?us-ascii?Q?vuUY/0dFDGczxdDn4BHw1AugwU1p0YrkMhXFRlEDAmvQXbgko7vmFWCLGhc7?=
 =?us-ascii?Q?82cHMlkVnKK5LGWZU1a1AhlwQ/jUQZbYEJ6251KI3soG4nHo9NPoVugYpcFo?=
 =?us-ascii?Q?uX7GOyCXFCNfXv7F8t1bzLFLB787CZ6WEDucAqKsWIdccRN5AmaqC9hyXZMY?=
 =?us-ascii?Q?9fhhmPRbtpasf5tIzJVgO33Suh+aTpfXOQmVYEF5n+TznsXCCLCVMpbqhEb2?=
 =?us-ascii?Q?tQcuJ7VqsfGj2bzq3iy8lCN9MTJKQGuVqWOS98AHEmR7RNvmUc5+Eq1+cLCM?=
 =?us-ascii?Q?lTGrH1agrPUlwFwOe4TVwts+uQ9YxbItsllR/moOinkutG7bQVKRi56p/3+D?=
 =?us-ascii?Q?jI6je+qLioIExtoTiKLoCY8BN8mBIr3fenPP720Z3FhFtzMKvrg7QBuai0ix?=
 =?us-ascii?Q?eIy9ZxlaHUeq3Ptjv5rSIdGWVIZpaT+Bj8e9TqagNG7q4+7Z3I0Q/2snszYC?=
 =?us-ascii?Q?c8Cb/LqLEjJtNj2PJ9O4bVjxyGitihytTuVRKvi8sItB02+ywHsewnYbEkcE?=
 =?us-ascii?Q?YcvbP8KUEzxa/k4l+Z44+Ndwa9PlmTdlqHZR5YB9tjYF+rrMm/dqdzMFcl1s?=
 =?us-ascii?Q?yLDOO5HvFTvrEH7ImbRKhnqdDhZ0E0x5PlRTYjxOSQ1bg+789fNBsz8lwDba?=
 =?us-ascii?Q?Wllx++pnPlSMQoU1GKCfCcC5aseGmLWTpNZieO7GZ0OVciNg9v6ffp/C1oqu?=
 =?us-ascii?Q?B7b4NnfS4wweJAn35JaUqcM6n6IsSylylBa4Ruxe4F3ZKSy/jDPZH99d3Z8v?=
 =?us-ascii?Q?+IjLvJ6gdCmJrKV9kqrrnZve5qStSXE8adWohziePX93N7ReZlUXBAgGhAmx?=
 =?us-ascii?Q?2v+62ZhMCgYSjnjw7IGMr8PyIHQC8pOQwM1BpMbOMXtjk56v6EFvYBZZ356Q?=
 =?us-ascii?Q?JdB2khVW8nWxfXOXPVrKm9O2FNqBwdPAGbsqpCS1VQYSzhZDU4ieOKVyyT/R?=
 =?us-ascii?Q?vdAhayc+SVlm96xHWZMd2MEPACRTy+L4lbKT2hk0J5wanxN9dVKWBXsbu+mM?=
 =?us-ascii?Q?EJfD+tjFjlW8UKwFBfN03s+iRGk/KibDBE132bI6FYaScbRT1IwY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1880eb-26d8-475d-5e89-08de4f1c8977
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 01:15:11.8327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7bW90NRok+L/wo0d0UmOYBuOyBsdFAz50s9X6v9BBj0a6kPzVdVvjPJY99KF+lPb36+32q9KBqLeWaTLZWwYlPUjrD0NpTnBFfpupaKPDPdElurYWra2aBitEzbZai3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16851

This patch uses snd_soc_card_to_dapm() to get dapm from card

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
Mark

I'm now posting "ASoC: capsuling struct snd_soc_dapm_context" patch-set
which removes old functions. But this patch is needed before that.

 sound/soc/intel/boards/sof_ti_common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ti_common.c b/sound/soc/intel/boards/sof_ti_common.c
index 218c3536723cf..e527bdeb787e6 100644
--- a/sound/soc/intel/boards/sof_ti_common.c
+++ b/sound/soc/intel/boards/sof_ti_common.c
@@ -40,9 +40,10 @@ static struct snd_soc_dai_link_component tas2563_dai_link_components[] = {
 static int tas2563_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, tas2563_spk_dapm_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, tas2563_spk_dapm_widgets,
 					ARRAY_SIZE(tas2563_spk_dapm_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add dapm widgets, ret %d\n", ret);
@@ -56,7 +57,7 @@ static int tas2563_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, tas2563_spk_dapm_routes,
+	ret = snd_soc_dapm_add_routes(dapm, tas2563_spk_dapm_routes,
 				      ARRAY_SIZE(tas2563_spk_dapm_routes));
 	if (ret)
 		dev_err(rtd->dev, "unable to add dapm routes, ret %d\n", ret);
-- 
2.43.0

