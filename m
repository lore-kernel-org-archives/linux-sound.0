Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258DA1C6FF5
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820785; cv=fail; b=aenSZc4Akptfcjklw5+6GSOfZ4QLOeOO0TDR/yaivinr6Abi3PdKKFqrE8nfo7GOBSCNPVD31fnZFwQVQKLkigml7d/E9wBE6ZR3Sku8bvMdaBQaeDQR2tdZRl7qVuN6jzSrEKdyKZs8JWfvv6TwSsIf1B93tX8+89fNDuxbDi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820785; c=relaxed/simple;
	bh=e3TdUpctx5y4bpo4fKlQphY7yepHIHKRPb54f3IxllQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JFYEaE/VLoSEpV8rsiGueR58uB2r7MSTpxbsN5a5Bq6lHWt99mma8Tcj8jrn0DGSL+zE+vIl39h/vnDUpQprH3iC4MxAW4T0UI9edSLsb2ZlKWDJf8WC/k9ajqN9CSh2lH/rwmSmarcpM4poKu7E0n89NLWa4JuAMMlcZUxOKZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KiimsV+1; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KiimsV+1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEsuVcmivdqyJUaSwZLbPXG3bU87KQp9jJXyNF4rLSabepGirIDJnXhbE6lvmoJYQPIpnqNm7IQm8GBYJnVvAuluryc9KB5h/Ce0Gis9ZqMcadXM+Bq82wI8CVEcVl2z1ly2fGgJ2z7E8tX22fjlLYdj8byI+35GzWhKW61tQ5inZY4IUsbF/S6Ll5s/ko4TJRVMZooaf09am4lauSJ5bOJgz26O0qMXMF+EsR90mo62MC2ih9J5+1aTHT+EegAT3im0r58DqX53x7pz13qZWNWkGB66r9Mr8TtN4ZxjM0/VVVRyjewcziiBAFp92BEcWI3vVX9A936rE4IEcbqBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mq/FzMRK/ZatoI0x0FpTCNU3CX2mRLybLoufeIjP2U8=;
 b=tAr1UziHEG4BCPtpEau58gEiGsmb0+J2l+L4qXx34xhxaLuzBhaQ0ttoG4GnQO0J/ait8GbtfNT8R2Q8WK4WxD/1kSFDbnOTt+MYPEgOVchG8Vi21rpxexi5LTVjgaWD/FWhZaJAlnydKKPwVOw3TIu4su1oxsZnqw11sj4eVBpPLGi4BMfR3lCv1Ws6iad/GkjFG3OJTgf9fy9mXXd5hYpi2c9odUk8BlHu/mv7c1LyHgGtDK/ypSyPvebhHlvGs5CqEycGVAae64AnNztlbjo7l3z06mJnD1xQM+8161hlaDZ98Iso+E37tR2Sj/UUhXXiSIvuskGVDz/ayyPQLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mq/FzMRK/ZatoI0x0FpTCNU3CX2mRLybLoufeIjP2U8=;
 b=KiimsV+16xvWhCSYu188R6tWJIxIM5mrG46i7q0TQMCPvWZHz/q+VzJlXSPIrdFFVXihc3Ok4xnaopVEtaxZnX/YG9OQ8+wfP3lmm66oEYjSnBgp3s5rkv1sToAIXOlWRba+ADH5g7DM4qZIGf4D5ugh82uqd2J6UQu7MVH1Zyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:26:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:20 +0000
Message-ID: <875xbh2z4k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 129/292] ASoC: codecs: sma1307: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:20 +0000
X-ClientProxiedBy: TYCPR01CA0185.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 269f236c-347a-4910-9d4b-08de20b8efcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NHBdzRxqz7wDcezk9syZCN0XiQjpM26EAMlyRpThK29AbxwkdU5xMUy3lFZ0?=
 =?us-ascii?Q?KwNZzelvth2dvOYiRmSIRypRgM8REgGYwtKoFjucQuwp3qjqUTzP1C130hCm?=
 =?us-ascii?Q?kQn8SWzmRsswqlWesEv5PV1MoG7muMeCdIuHRQiP3bW9J4dv+6IR8J4A2SNF?=
 =?us-ascii?Q?CYZ1db5PzlL5GUn0LYw3OXHKvdKJvC+ohSZST23bFphccVqOJclYov6ctrTW?=
 =?us-ascii?Q?VO8+7j0ePsU4UGmQ4xKYpVS0Gs5Lre66qVSDMEwiyHZrsWza6YS2R3e/sUVA?=
 =?us-ascii?Q?y6T7vqcJHybm7G0f5C/+9y9vrNQivHkeO8x5DzCuu5DlOBQAW8vqJhRsSVf4?=
 =?us-ascii?Q?WqBz9amTuDDMKWPKj0ne2Ai29us2do5CFRGPu9kt1ClXW+LHKlrDBJIIyLK8?=
 =?us-ascii?Q?Bl8+XN9kHxy2sWxJinKeMDVDy7zsjaBF3L7Dw9lOXMWcZ6rnyXuQe0NkMaaK?=
 =?us-ascii?Q?/jnZFbIGQS3zbwhfP4Rv4BgsNBTiOxRtjX3rsNQ8BVSBnYqP1K6IGQNkzEir?=
 =?us-ascii?Q?kbPw66IHDjM60e8GHUGEunLYvxpMswUmTcelOr/dBL2VQmqIuYSdkxGIdRD9?=
 =?us-ascii?Q?97XSLcjnT8ReNzd77UP+BRSHjTWWmtO7bns0CcLeSeg8FhCcMuP2SCoX25hv?=
 =?us-ascii?Q?k/3L1pNrk0zf+CdT1+M1T4911Wk66YM164w0F0zVtRDfb6lnc+l7epdtWrv2?=
 =?us-ascii?Q?y36aUzYv3+nNojD+CHvZ8TmIicOiG3DWFPnhFstgWTBP+p6S5MFo1CMQkxoS?=
 =?us-ascii?Q?K5HkXMVyU01nNtR4OabYnVzDr1kNPMe4JWF7jy6eRGCMu67qPsB1uROCC5go?=
 =?us-ascii?Q?TVEEkErdE9K21PGMlg+QLbgeOefuYV3Yqm75GIGoylmEoEyUOug2oZhj1xH1?=
 =?us-ascii?Q?yExVw38J3DjJiOp7ZhZFTv9gpgCCxXg2a2bEz/CXpOgCiU/5Dzsc6Dp6QNlL?=
 =?us-ascii?Q?+4xV6AZg38x2LZLO/gI3P5CcEbiqWOiSSEUHhhyLrwRDgf+S4mK64U0Vk4To?=
 =?us-ascii?Q?jGuQ/kN7JUYpFXQj/4K+r8Qg9/1ErEJ3woMvfsdVTGvBMeYviEaPW5J2mdTz?=
 =?us-ascii?Q?y/wbPpRfp7oSvztHdiOgVx919imvC5j98pe5LbdnhXHFs+NgqM5euAaoGGO6?=
 =?us-ascii?Q?qhfKMTSqLwQA0P0riDaqKmNqcUNJir9N62V2hCd8En5Qt5XhcZiZFn+5GRMp?=
 =?us-ascii?Q?TR93//2ckBJ9La7jFJpLTxos65r2UljJlIt//4+PSf60XudNa/D4SLt769oy?=
 =?us-ascii?Q?Y4aOVK0esLC6NDrxOUb1ex/7awDJw7z4YaaDtlYFVNbruMgf71Pbr/xW4KGJ?=
 =?us-ascii?Q?KWBmxiW3ZN7Duh5HM0hcIcm7uGEyAdW0G0+peQE2gC284UM5aZz8Ie7VXlUt?=
 =?us-ascii?Q?+TVxssS/YzYfXHzHh7i/mDkqvlWR9awCA7r7gmeedWfspTIA3DDEI61TLscT?=
 =?us-ascii?Q?wXIJmHkvOcpiBTDiuqu61SQ40fk7Po58C/1eViCJzJS6NNMxUnYTrLGTwZd7?=
 =?us-ascii?Q?Mmd6qzdT7GxG/rB9GEixvVc9o5lSUxUDFy90?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?njR9neYltmDWNbeo7U6oEs5nVV9tSmBaAOH0xRFaY9tqET5Ln07kz1LBdfUZ?=
 =?us-ascii?Q?JO+5OWG3B5novxVr3G0GBOzZgxaDY78XjwZ5FVIX59GkyIc5NbrjIcpG46Ko?=
 =?us-ascii?Q?HvNhYABBpIdv42Uy6HzNITj0NNaM5K6t5lAzV+CXXcNw0H3+QHAvhzmYpUH/?=
 =?us-ascii?Q?xsbxwU85IVDGxoB7cd0XMi3AVyS1RH4fOH/prIIHBB3ppDQRP+QU2UibeMQo?=
 =?us-ascii?Q?4+x5PJIbW6vhIwFOTCgkuK1W0q+bypqqxNFQqkLsNDKeSpy2me0V1k2nRqc/?=
 =?us-ascii?Q?/0K+Dl5N15EGeyY53X0kmj02aenZ4wI1vKvMEwwMKBl9q7jyGIUzklPXbfqN?=
 =?us-ascii?Q?TVMqhgyUgt9rTQvzPoyo7edRy5RGLH8fP9hEv52coVNL4pxDFUas/IFRzodI?=
 =?us-ascii?Q?zS0+mvvEfpJoi+fYRTgAeUANOHg0mS2kNAW4uLT9lKkHBLX7kHI+WaUVoQPc?=
 =?us-ascii?Q?09FmSVjlA/QCyQ5d9rUXesZeYnc3jL4cB4zdOsL4N86ENpy1T5G96lNFDBrk?=
 =?us-ascii?Q?vTZXkWH6kuGb71OjDIfpQqF+xFNNEmqG+W2XPUdIz6UQtUh1QxMmi0BntV6L?=
 =?us-ascii?Q?wfZap5x8ScWS4/Mie09gvtQ050aLQBtYWFKyANQ5Mpox5T2Ph4n32kOWoORK?=
 =?us-ascii?Q?BAQTjwv/jXDCra/Hwdo9NVMAzMRj9X/SmSaH7yIZgXX680bZKQH2LDFrVQ3N?=
 =?us-ascii?Q?pkx/bKVMeg9shhF47wlsiJPCMZ7WjIXDyhnBTBJaYfJygrnVCg3HOzsZ05Gi?=
 =?us-ascii?Q?wKOmZbxAwcSu+EM22k8ngFdGu7WWB8M3i1ZffH7ASSPMk4iwlr+sVNfGG347?=
 =?us-ascii?Q?tW75msF2sNxtTDJlOqkRke+BBbD9Y8Q7MmfXQ1W4ImPqKrgKKgM4MfbHtNlh?=
 =?us-ascii?Q?aY+orSz8zfx8QzWxcu3tKufTp88QmPpqVS+GXvBtt8g5OY4ePy7FkfZKg18f?=
 =?us-ascii?Q?wCU2kZjB1QsObHnYsJ2KdqZhct5zU0pW2LD7BC9iE1azM7rrsIe01a0ytG6E?=
 =?us-ascii?Q?VjG6HUuY67gVPsj/Zdj1qpSmCgUVHeZwc+L0NVCN5wo+zcQLcnPSOSq/SHMJ?=
 =?us-ascii?Q?ejhEnfhrQjctl+mSsGHlGjXc5efwhMn7KBRQWFaXJpkyUQ/1XJ3EFLyF7q1n?=
 =?us-ascii?Q?gI7sjF6MQLNFrNHeU8zo85k0/9o1bx3gELzjqIkO8DQTaJfHGGUnAOrVgSsI?=
 =?us-ascii?Q?j1tbLOwz3x/U1ZT7BaNrzZbqdy+g3RdQgBL7AYGtVBo3P6kv4Nwdm/Gwbbmb?=
 =?us-ascii?Q?H4BXtY51SHrM/bpO2WK4PjkJlaT2yx0fECXC6BSFtEgMOLBQrsW2UXyFhyUu?=
 =?us-ascii?Q?jmmCCy6ZT3jeVqNMCs/f9AkmYQbtz9rMxJ5rcoNOsfj04XvLarHTWdKvtf9g?=
 =?us-ascii?Q?yjwY1VkIXi7MX7CRD8ZS0NJttqQrXlJoOgg+7lmnMP0qXF6kdM/Gi4PFj7Uo?=
 =?us-ascii?Q?Zl10hPKZiKI7RDvgV16GEMmUVqYFbe9zKt5J42QysuN7TnaiQoUtEE7zTMyh?=
 =?us-ascii?Q?Ln3fza5rKnLusi3z4CbuKHnpIWHctL6MxhKTGNbcb6t/ro5QTw7UNXmEapPg?=
 =?us-ascii?Q?rCFEy1WgmKghX4sdnrmlRQk5xBfnAJr2t4LqV8oG26rTYU2ptBYl/ZND7WGF?=
 =?us-ascii?Q?Cag9Ng0bzE3S0bJB0UQrVY8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 269f236c-347a-4910-9d4b-08de20b8efcb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:20.4743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yy7qnougo7DJsMVZCTjZfsvnhwD1ppKEwwquiPKbGxOayRZBLX8ejqSomneRrzfE50/94PMxgXP3hxh0K/02CmMkGDArmxH8rLmXW04G3L9prOuat6T+h7v35RbizWSh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

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
 sound/soc/codecs/sma1307.c | 59 ++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index 5ac033e0ba808..4bb59e5c08915 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -790,10 +790,9 @@ static int sma1307_power_event(struct snd_soc_dapm_widget *w,
 static int sma1307_dapm_aif_in_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm =
-	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = (unsigned int)sma1307->dapm_aif_in;
 	snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
@@ -804,10 +803,9 @@ static int sma1307_dapm_aif_in_get(struct snd_kcontrol *kcontrol,
 static int sma1307_dapm_aif_in_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm =
-	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	int val = (int)ucontrol->value.enumerated.item[0];
 	bool change;
 
@@ -830,10 +828,9 @@ static int sma1307_dapm_aif_in_put(struct snd_kcontrol *kcontrol,
 static int sma1307_dapm_sdo_setting_get(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm =
-	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] =
 	    (unsigned int)sma1307->dapm_sdo_setting;
@@ -845,10 +842,9 @@ static int sma1307_dapm_sdo_setting_get(struct snd_kcontrol *kcontrol,
 static int sma1307_dapm_sdo_setting_put(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm =
-	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	int val = (int)ucontrol->value.enumerated.item[0];
 	bool change;
 
@@ -871,10 +867,9 @@ static int sma1307_dapm_sdo_setting_put(struct snd_kcontrol *kcontrol,
 static int sma1307_dapm_aif_out_get(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm =
-	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	unsigned int val = 0;
 
 	if (!strcmp(kcontrol->id.name, SMA1307_AIF_OUT0_NAME)) {
@@ -895,10 +890,9 @@ static int sma1307_dapm_aif_out_get(struct snd_kcontrol *kcontrol,
 static int sma1307_dapm_aif_out_put(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm =
-	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	int val = (int)ucontrol->value.enumerated.item[0];
 	bool change;
 
@@ -933,10 +927,9 @@ static int sma1307_dapm_aif_out_put(struct snd_kcontrol *kcontrol,
 static int sma1307_dapm_sdo_enable_get(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm =
-	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = (long)sma1307->dapm_sdo_en;
 	snd_soc_dapm_put_volsw(kcontrol, ucontrol);
@@ -947,10 +940,9 @@ static int sma1307_dapm_sdo_enable_get(struct snd_kcontrol *kcontrol,
 static int sma1307_dapm_sdo_enable_put(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm =
-	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	int val = (int)ucontrol->value.integer.value[0];
 	bool change;
 
@@ -1857,8 +1849,7 @@ static void sma1307_set_default(struct snd_soc_component *component)
 
 static int sma1307_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm =
-	    snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_dapm_sync(dapm);
 
-- 
2.43.0

