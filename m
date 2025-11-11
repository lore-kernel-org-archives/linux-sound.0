Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF022F77E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821290; cv=fail; b=f82+xf+eG9wKIIc20oK3y1YIW2ztW6P8zESRsBasni14yZS2dsKBrsFSUNeKd3gQFMWERUVGvpPsAdtdRgvIMAka8P8Yo9ocRn+c6jpU1sNIZTWBKuW0XtxEwGtEkJtntcrHGEyVcErP8hytacYpXoaVdtXhJiFXjj+l2SEvLlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821290; c=relaxed/simple;
	bh=BfRKsdhCldhrFeYWHYCEeVVVwmSw/s7LH9cpLax71mw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dPfClw4PP1zkZRUrMZbeF0hE+9QA1YBic2K8j1AWkfCchu5pZU6hyfStrBQhMmBPmDqmQMxtZqyEes5uIgmrTSQ66PfdRakrSta7EcIVw5Am861Qn/unVDbZ9OatPp6/Y/DGol7MBCQ2aa49Ur9kuSjIQM9XbZa0EdWD03mxS8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nPHjNrdO; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nPHjNrdO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynHF6TC58bDRenykd/aALuNS/+5irmHp6+GUyvjpngX9kd6m44q5fdsg7PjNGCjp2IdFo804h+3rrcyAMgAMnm8MK4AQmGCxWoIQmZdYrLB49KfAo950VZnE6hEfrNGxl2L8pssLxiLTtFl2XQW3bFElM1Hr12FwEQ/vO8m99cST6cpuxfLYkAh38gC7Yqwwr+K4vVD3gpmJUPb6laO04AXawts1SoopJxvvz2063pQT/kq4UjJopvWg5ZAwRHycn14WaxuWCxWYF08fDCMgOyjA0aSg1NQy0l2XR0GCeeAdJsvNmLdbq73jw5yUCMH7pj88UBVk/YXTqUCGhqygtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q36z0O2J0BpTvSCZyzkzwo/UdWWGGVCpcdK2xVP3p3Q=;
 b=OdpvtKxpDuWrqJRLFTv+Tr5fm5L/NhxwoGrulaFYEtMr8GJwLtnQSHPIVmgTu56pZTa+MoVVHWshYN9y2GEfW/lZVtPpBMtwoc4otSTIfPCiIS0XqHd6ZB2EuBQaKyDPvESoDIexe8F2VJ+POW62pMOAPm/N1MODIDCbjuncjsq2b6Hh+66AH6T+oh01wajBPGq5HN6kz6DTwZKOIxHTf00PF5yjt0BnmLbS9A8bmKAtTUWKZPKzn5kE92qaZkmWwEsUwKRgbY4vdRufQdRJ+j9pSVltlmwvQhxMwPpk2HiyWEb/Kz0nSFWwaVQOfjSQLlpDlUKZgIdc/ZyfhO8hBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q36z0O2J0BpTvSCZyzkzwo/UdWWGGVCpcdK2xVP3p3Q=;
 b=nPHjNrdOw13ZM5LPB9hjyW/00WrQgqWj4zI+r6Ue8NBN18mz6BDbnl3EjRDGmJxVFywFVH1xaKi6NTHWaulbXP4xz0ZBNaotleNY3sitYgU+I5ZsEXNBQLYsxgJZ1g0sRJlg2NbsjoJMyXqWPxB1hq3jNQmHviIID+BQErLBMZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:34:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:45 +0000
Message-ID: <87cy5pv23f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 249/292] ASoC: samsung: littlemill: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:44 +0000
X-ClientProxiedBy: TY1PR01CA0190.jpnprd01.prod.outlook.com (2603:1096:403::20)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c681cb-0420-4ac6-2146-08de20ba1ca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2GGmyRp5tojmhWzGABpHfdXDuXA8SqE+HWyLRaT5CjnuCohAyKsQ7KlgZyy6?=
 =?us-ascii?Q?qCiHy8XlS22rlImHZVax9CN+pktDDGoOjXLKahTNejuUjpN3p/TuGuxbm6LZ?=
 =?us-ascii?Q?6rt7hw38fKwogc0MqbS63xW1lZKthZxvNg6I8vNPRgMgcC2495JB4hF1schx?=
 =?us-ascii?Q?0cBklkxv57hp1bhtolM3iNIoJ7UJCiIbctp1wF/1ZN8GTlLnYchigswZtkJ8?=
 =?us-ascii?Q?+fXDZBXcvuZKD3De6A7kQXRCS4D0o+tkhMDOY604XU8P30+P6ZQOeyJ3v6Zm?=
 =?us-ascii?Q?JY2LIfLPJMzLxBmVhrLQBOT/MCaipt3xzTAWiZoBYGcQCxte6whfmpJ4xSt4?=
 =?us-ascii?Q?RklHtUsoKfG8x6ms9r1baLj7xi1BmYcF97aILuJ3xbGYvc91JIDeeRt663/5?=
 =?us-ascii?Q?96sG4TKM1HI6vV6yD78SyAtOqaN6Ga/kCke5repyKmyvRfgx360XDD2nXeA4?=
 =?us-ascii?Q?XJiTYIXjDiT8hHNmZ53RejF4ZztKhE1KQYWtR106tqPWF4SU+M5/QwBadL/P?=
 =?us-ascii?Q?6XlSkeT38fv2ks6OokOPZL4rrVVz0XoJtuBECj22eoZ0WP3vAbDD4H5GyOmf?=
 =?us-ascii?Q?6aRgkAlVqu0MXtpxhkFAIwVJkjglYwyI4NdrEA/2YoIMQAb/HO1ME5iifOO2?=
 =?us-ascii?Q?QZbT9+qE7kYmngRzbZadqHCiWy0jyGC3HhMhk6bnojLKZEIhp9s/6vLSRhSJ?=
 =?us-ascii?Q?FbPt1V3Fio9+252c4iKc2J+zOTnBa8rg9RvJ1c/vlJ9wfWdCs7RiYIu+WjWO?=
 =?us-ascii?Q?a2pjeHazB+TlIARGoCgYiKOTFaR83TVuTkXFrD0L8MkEgMsH+/8XwcQ4UZeg?=
 =?us-ascii?Q?u5qpaDfUdNDnH10G/h3d0576Pnb4G2nwxuFxWJYjIIlpKxXmI/TPd8vNd6wU?=
 =?us-ascii?Q?cGsXVJwfzXNb/wL08L/1tSRewnCeOwVqOWuzCPGAdrCDK4t9h/52Ly9NMgYF?=
 =?us-ascii?Q?kJpuhUDFk1337vTuXyiNhs/tksntBZE6pOxHasdUz75ZC99QC68hvLrG1Bee?=
 =?us-ascii?Q?f5To9e39h2T/7QjwKI+VbmFpa428DX6UvfiFdgw03a6rzw4HRkvvsXHA5MXE?=
 =?us-ascii?Q?AJMkFMVvj3mCfLHTFfsDuGycocW6yaajQPgiuE2ug6Y1lYcfeWrCwZ2UkAvu?=
 =?us-ascii?Q?WfKV0GHYop5b6xd0q+hm3PtwJu8Vg9YBgIQt/lzzCsf2AcjQVswBeR+NdhNm?=
 =?us-ascii?Q?OjGNvVKjuT1dLHvmZndcdBVbdDM18N8jURb3UUc4d8oEO0Ok5dFMD5w9JHKk?=
 =?us-ascii?Q?BbU4odoPN2k1O9yFLeTuuhHJXxPpZCLqr99Ji6jKAO0Ve0+Kbp7eh3506X0Q?=
 =?us-ascii?Q?Kyrj1zwCOSNi6NoZfqOy1egAs/ZCH+BXe5+DV5451s9HcafVXD+Ty/FIDIW9?=
 =?us-ascii?Q?3S9T6ZOq9OfbxLLEDaYIsvXuWkQgCsPdyhJ/Rppdd7hr0eFrMC11BHidIjgH?=
 =?us-ascii?Q?TDxvPJHiP6VYTNlwrjTnWJMoboXKTJ+Oi5YDT2KlEtKHdVtO4cPGl/BwrURA?=
 =?us-ascii?Q?KukpaYTuRhtxLb0vyNfm+uCjRee7LaM63MJG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lp6f1RSeWPoantJn60uVsn3H/mn/Zx8ioirbEg1szzQfUOIAGBRfl1LQp/59?=
 =?us-ascii?Q?PfWb5EjuwKHB8cL48+tZjpXVwJmGqdHMOLr0d3DO7ZgxyKjugshEUQ6kmEMJ?=
 =?us-ascii?Q?VMy5Ky6yDoKawLEXaPfFapuXt+PShL9d4CWRjsv6JQHX7jJhxZATzInSdHc1?=
 =?us-ascii?Q?C7efAaijy+6CqE8JkgslPVrjel+YaPBjBF4LY4Gbp1zgYafKCMfWvHi2aPKA?=
 =?us-ascii?Q?+OT16KgaampdpMheR4Pqa+t28wrI3wf1dqC/UMkYskKDfpmHG95lW76J3vit?=
 =?us-ascii?Q?uaUDNF0SdmfTvImuoKyZJsLci6lehTp/qYsGZphw9YHdVV/kZf0J9E2VPXiq?=
 =?us-ascii?Q?1awCqrrqdPhwqAecFhw6vqKl/YndpeLFHCq6cWTGmzIYv0wzvU6+KoXJL9sC?=
 =?us-ascii?Q?hhuBl8mEa/TIVNzfGb9AGn1OsoNKIeCucDoqMBu2aQa9T5EsW1fdjS5zR6KU?=
 =?us-ascii?Q?uMGABRRxveg/OOus1+cv81LAjDHFSaNSyJY1/p2GQqeO62R9qiWMite7k2jl?=
 =?us-ascii?Q?qRwdHUnQtBT5zyvmnD4+OzJa8P1Cti3KWCGf8gJeKrtdDe+mNwVeD9/nQizy?=
 =?us-ascii?Q?pp6FviX+6pIDZTQs+N34y+c41Q4aZXgC2eHP3b3RFv6qB6+Op+h7VwdtZsot?=
 =?us-ascii?Q?RMTlSdgy1OW+M4o9kxJrFq9AVmwEdTYIAvpoxbV5YRMsdrVulJSmEuH9RzQ8?=
 =?us-ascii?Q?5Dz+bZirvEY/j7UHSU2dh7/HORogy+JMb2KFXJ5+8CalRipn74WoRuv5xPk5?=
 =?us-ascii?Q?TNN+b8jjg39tUhbK2UT+eOvWcWPSubwkCHLnZrVeVsB30l0P0skkvObIq+sI?=
 =?us-ascii?Q?8kqqXpbla2FPWm2ZdBF8gigu6n2+2+0WlLShcnyG5Rqn7TzWzgo7lfGVdbtD?=
 =?us-ascii?Q?CxU8a9Gk77cI7C2QrBayCQdB8leb45aO4XKg/ZXonbMK9nM4Dn1ouoTO8eKH?=
 =?us-ascii?Q?kVsq61voFuOD94SJihAT4ViLt1ZBSuxwu5IgZT29P28ogtCCEtC1xyAnrduJ?=
 =?us-ascii?Q?EQdsctIl3fDoTvZFjCA9l2ZKYCOXVFhFpPBFdArIFdjVaa85A3kv1A77V0/W?=
 =?us-ascii?Q?+/YkRMZiOXHJ+fooV5IuOALA+tbJpN6brT5RlQZeAhzgT4DR/K6cG5EVwBwO?=
 =?us-ascii?Q?0mn38N+OnjYqyS4uKtJh+WgwSuwlS/cae6lblJJDLwD0JIh1xPjR+5OlVClA?=
 =?us-ascii?Q?oIaDda4seu2MEJFPVq5JkP8cCRRu/0EMUsyfDBA5Ikka6FRhtAki5KWfPHTC?=
 =?us-ascii?Q?b/YFQwN51ga6ETfaMka/Igth6NlITJ2nbq5z1eqjsgAjIQkNKyr/8Tght/LS?=
 =?us-ascii?Q?15O/g4HEzT097R1WAA1Ico8FN2QFwk3GZ7HdpcMgqTXGh2SE4eCr9yQVuGoc?=
 =?us-ascii?Q?q834G6bZ3UH31fiilkYJTS+xWVaowaHG74N2O3SYBvFHln/DjFbTSSi7PtrJ?=
 =?us-ascii?Q?lAQM/NyDDaR/guBM9/jyx0hwCd5SBlmJNj21yxjSuBxIJ9foCcvUKMzDf4T8?=
 =?us-ascii?Q?7Pa62qZvc4IpRBr++szTXxo+9EwEZhNCqvoX60Jx8pfGCdL4ZzUW2FePhfbT?=
 =?us-ascii?Q?ZRQf5xf4SH+CRMhjk7N9EBJh6zn9xltMRJyRoif1iO7AVUKSDCiTQGGX4RyW?=
 =?us-ascii?Q?8fpccBspC1Bp4+1hn4buVoo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c681cb-0420-4ac6-2146-08de20ba1ca9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:45.1369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IKCjkctzVV3V+jfX5Pn7nMmdrcWvac0WQi+K8yytm2InY9fH4LunQEvPYT5ZW0+/tJpb6syq73Lffa94AdGGQ/wWpRfngWwPyduqPGusDO4mALcWSgJQYsprKHVuEyM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14482

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/littlemill.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index c8b06894ac88c..d0d1b1ee326ea 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -24,7 +24,7 @@ static int littlemill_set_bias_level(struct snd_soc_card *card,
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 	aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 
-	if (dapm->dev != aif1_dai->dev)
+	if (snd_soc_dapm_to_dev(dapm) != aif1_dai->dev)
 		return 0;
 
 	switch (level) {
@@ -33,7 +33,7 @@ static int littlemill_set_bias_level(struct snd_soc_card *card,
 		 * If we've not already clocked things via hw_params()
 		 * then do so now, otherwise these are noops.
 		 */
-		if (dapm->bias_level == SND_SOC_BIAS_STANDBY) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY) {
 			ret = snd_soc_dai_set_pll(aif1_dai, WM8994_FLL1,
 						  WM8994_FLL_SRC_MCLK2, 32768,
 						  sample_rate * 512);
@@ -71,7 +71,7 @@ static int littlemill_set_bias_level_post(struct snd_soc_card *card,
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 	aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 
-	if (dapm->dev != aif1_dai->dev)
+	if (snd_soc_dapm_to_dev(dapm) != aif1_dai->dev)
 		return 0;
 
 	switch (level) {
@@ -173,7 +173,7 @@ static struct snd_soc_dai_link littlemill_dai[] = {
 static int bbclk_ev(struct snd_soc_dapm_widget *w,
 		    struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_card *card = w->dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai *aif2_dai;
 	int ret;
-- 
2.43.0

