Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F28A1E0DFE
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820933; cv=fail; b=QC/MrpL/E6jJAA+njmOCosmayno2fV2FMIX6zJHoMon60lfEnT4nmC1WluQIxnslTekEfSEgTJiZy9RqsAHaUhXUnDZge4//xk099WV647ZWNiDjHrLqtH12NPvu5zCBUYJ8QalhqH9nN1FV1kQdxxMH2z5WYsEzvc2xTJKe2oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820933; c=relaxed/simple;
	bh=h2S+gIh0WZksszcJ8+WM9QYp317ApmrjAnPV62gYc7E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t9o7/jJ+qNK6bRQCgldmYqvexuxdbqAhM6qxoBqOUXRez/WRT9o4isKIiGzEmVuiqFE6xE5AtQ7BtTry7DzYdfSzu7/394PqF5vNhdb8UZrgi87bIoc7X42GU2C3JSjo1+i2sSelv1O5UPbw3a6dNRcq2GlprRW5UWPDoV5km3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WTBdBhAC; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WTBdBhAC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kb+Dyki87TVITxZtH0KHHmEkom15oD8tm4U2xHqqmlwUKBhS18nLNkvoGhMWjrNtD7OFi7dWlZWFIx5Ed9y3cVRklBF8EB9oPrNHFNg9AR65+biT9+1A8C4cM0Svis+SL0CAWwwGVUmFzAfT1mrgl/ALY+wXCKZiHlGIfsOO8xg5NQoFOy5H74ab585DfAGAzcvkXIG5zimhJ2Z5ErQ7copwtuNpLj7suXaVuDYx+MJmwj77nNkwffvUpHvonJv4fW8geZzKAbdmOx3415mJkA+QIo4hnxB1r8U2RJCOKUAr8nqNTP4KmiNLcAyy6SCCjgDUGFtm9wUWa8550UsVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hP5F750wXl/+t2u0IMAC6u4zMuLpVjujHv1UXHaC7I=;
 b=XTTyK4uKb1jRSqZ67hgAxRQrxPdDuq/w3kxBMpPnnQ4wMNRp0n4r4WqeJJ1Bf59MisMqUdK+L3RjLD7reu5FpyiSP1VyO3QR24zbDtjYAcZwiJ7B0rZ+TGot3n3zfo3lKd0AAAqie8ffzzR5yZDabxeqrKFkCP1WSp6P5g6N1yUsqqVHBDjrNqQPPT/aUSDfUnD6H05n/Ksk385UUG6cutqZpnrgp5Y6u0ODit7cdcTj4jxEVW2/7uA69e01U1tFwYsXO1RPvi3z1P/6uNi6GEXzMw9FFNe3Znwn34mJt8wJcvY429WBEb2beSAF488nRVJdXNCACf/ON7s64v1CPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hP5F750wXl/+t2u0IMAC6u4zMuLpVjujHv1UXHaC7I=;
 b=WTBdBhACZri521IQpfB2jKML+wzKbUPfh4+zTtPOY6UAuqJOmPWU++p7VbY7VkkvhruPLkjCmykt6QlTUAYIQ6u8tIw1zMcm2ruSAeDOjEYwaMVKKVo/tLqAzfc8Ez6GI/LYyhyZSOMze7y2ocQ/DE/LNwBG9VU0FOPAxaCFYVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:49 +0000
Message-ID: <87qzu5za2n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 164/292] ASoC: codecs: wm8770: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:48 +0000
X-ClientProxiedBy: TY4PR01CA0104.jpnprd01.prod.outlook.com
 (2603:1096:405:378::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf44d09-03ad-43b4-0fce-08de20b9486f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/kgctWEzdDJCCCu0aqN26LOfKqNleryjkJCwyJ0c+f7rHZSGPU0hMErReVTS?=
 =?us-ascii?Q?kaGUe3bgS6uSUjbIJ7g/OovA+0IdlqAi+Z79jbuaMMftncJib/2kRQ6I+wjp?=
 =?us-ascii?Q?KEfU9JuEgkqaQMctM/052N6H50xyAWSdb+UuII0zWmjUzjU7tn/zHzhCEGZB?=
 =?us-ascii?Q?5rFCihN0cqfFNIYT9HEhO7XI1iQSKQvnn7Q7EZbCyJEUXb2oYD4jW2U2+63Q?=
 =?us-ascii?Q?v913fwZjX2aflUnU6t2f88Faap3uHbD6xF3AqLy18eDSNwxdHVKvsNqihnkN?=
 =?us-ascii?Q?gIQk9ZXLexKjiTx+/3K3spwDDJF1u7rxPIygYysa09WbQENpFlGmnm9THDmf?=
 =?us-ascii?Q?gzDSFb1RtGPE+Su4hxi6SNnxq7wRnbweKcm7XT5/woQuXHWFhsm5rsCQpPfj?=
 =?us-ascii?Q?N5W6csLplE5DuBwj1NpghMPdjyi+2e9iGFyZOoz1eNoPoZng4C2/hAc6Zbgz?=
 =?us-ascii?Q?MLbYRwnluW+agKg3MfqIB88W3jJJOieZu+npikYusnZfu04rFptjFCcJnvnf?=
 =?us-ascii?Q?0uyCotl4kMvtaqNCqmYux9UNrjRe3L4s4FdMJfydfnQd12Q64BKnExs4O/g3?=
 =?us-ascii?Q?EDpwCEjeN13dED+PWMAdo/52hNRzn4EVT0qTC71a2Iyc48plNNCGVIq1fWOD?=
 =?us-ascii?Q?qKfrVzY+MXgldXVNJokHI48ZFC5oGsSHO55MPxBO4zM5ix8SfNs7X9427ypc?=
 =?us-ascii?Q?NGRM+NPKnK+9ecqq3pBSZ7NAb6StKIB2kD9KhBdKQ9OAZ2wQ0sHV2fUlcRX/?=
 =?us-ascii?Q?K/kMV2GKorZLNljjD2wvGXlHvAFf3WLxSCL87eHJUgXjvGBAg85f3fSuK/u2?=
 =?us-ascii?Q?tMK1Xx3vpBFNPZG3McwuSPfBKCMe9BHbNRzj2gXnM3vUMk8kdZ3IBYSVtFVp?=
 =?us-ascii?Q?6va4ORBSCdZ251NT00URrjTlaO/PYZzuhudzH/8V+RNq7LbUicrCxlAYu1JH?=
 =?us-ascii?Q?QT2U+PwciySg1L2Jl+WevbnZbLtlyJespMaPpAMyZEKHkt3vePanmAP7xWYJ?=
 =?us-ascii?Q?FP3IDqKC6qzSnPJJ0LqEBITy979puWqjVp4rvQmo/PZIXuSUixyF0xhuwAQK?=
 =?us-ascii?Q?eQUhsj1KsfYYHNdI4d51NiFx5RjedzeUmBKHZ7X1zqFh5Zvku3a7MmVItB1r?=
 =?us-ascii?Q?kP9NpPWlRw4+/KXzXpz9RoWhUc/o6oTvpKpjNXSYg8sThJnPf7T5njs4N8a2?=
 =?us-ascii?Q?ynfzr0DxzIkmHF8WitzuxinvV/k9m/122QmstHMNcPDGhGYY0C0pkH1IJ1fj?=
 =?us-ascii?Q?XoMAgJH6LGZDCyZBakW0tb1xhdfdtVit89xKBxaIJ7vEJvDYR3Vn/X67iD6l?=
 =?us-ascii?Q?9nj7LLEcLcGdwyw0sP/StjkYyg60SCqUL+ZRyKN266MyUR5pGq00PF2Cveg9?=
 =?us-ascii?Q?jAW8slZbXJhU9B/vwysIIyJKIX3YgNB4TeEUVnLu4MkwGiYKvZIje6rtJiwd?=
 =?us-ascii?Q?00jhyqYN52gO540+OrDBG9JrZr7wvizxMMalsfCm6yicw9nCVJ/4ZMPhB9XB?=
 =?us-ascii?Q?+/2+GrLmuiILtU3TGIPGCjVhCf1AAP/4pUTI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nEmfV6Np89bxNZcv28itleNzOsCDL1o+A37HhZee+xZjWWfQ22mZ4HtwthfA?=
 =?us-ascii?Q?GCzBgVr3HEHRycHYI4o045kQxyWF4dRkdjXS+u4T84VlradBKfNYgQ+1Yeub?=
 =?us-ascii?Q?5AlINiqsq3Gjz7ZvUlI59jNopG7lqykmcG//NPrmHfuqQDt+AYFSLLe25g42?=
 =?us-ascii?Q?5L/f61DT9RAsLG1nDJMii1r0lw7H/+XBnxRk/MarNnL8lqBJbufkgNO0/yk4?=
 =?us-ascii?Q?c6s4exwJUNZrmwGOck3KFBrin4/oNU2wLWzCtBVTXex/e67PcFzKP9GVI0kJ?=
 =?us-ascii?Q?08wqimIE/Yb/VYYWLJARqK+anwxbiuh5IYeaEzb2m05Ehjutx2OZNF1JNJpU?=
 =?us-ascii?Q?lkCBUrk7b+WJblZzvFR8fYmm5vvwvu3JZapL81WBuBcV8F9g/YuvgHEPN1W9?=
 =?us-ascii?Q?8HjdV6hMGwlhCEL1qEkXjXgxeVUFqj1YhVz2EnTNH1GKe/Y4cpP0a56mkwuw?=
 =?us-ascii?Q?bCmU6ZmkvtS/fUp1uMGUw7SYh0GoJgjq3r8CYX0wyWOHQd+L6KfuKyEbRr98?=
 =?us-ascii?Q?gIPhKqo+bXWVJ3rWw8lZ/h3qCtvE5+C3qBKZ5pZKqd7bUTMzxEiZRIIKOG70?=
 =?us-ascii?Q?w+hadacwnm7A0YL0n3YqeIkey96Bnf4e3bkAc4RUc0agxThSiYePssZuCxFQ?=
 =?us-ascii?Q?8vVD7v+Jr9fMcysn9E8IzRCJtJscKQkXxQy5S9CkjWDXZPoIygowOKaB3flx?=
 =?us-ascii?Q?J3j9vSnWr5CS932Je9fOh4ETvHppqWRVPJD8EGoviyhwQnPVaGwv6maELtyG?=
 =?us-ascii?Q?xp3eJG/y5yA1JU/hupEZ0pYiG/DSo/GBlszfxPl2mgncCEH4o2iYMXNDhUr8?=
 =?us-ascii?Q?RZtbRpKtS2wyStHSLezDrSQyBiO0O3TQNLR/cVrILKa79qabF8vzxjKXdVmR?=
 =?us-ascii?Q?aAkIQ8u4Ai6ZQahydHM7Q9BG+S8BiwQeTmU/WReudfyD29fNHLnee5CXv0ZN?=
 =?us-ascii?Q?q+oUhyOuRV43ziAYSSW1qFvt6d4uw6kFe3dFckvs9tRF2W2cfrig3i6T6Ltc?=
 =?us-ascii?Q?ewtUrEj/9CFH1jJRUlbYe3zIqs2D5KyleYpjovpnzl9a/RzICXfJSKFu0PTz?=
 =?us-ascii?Q?tUNCH89HvTJzjTwh9sLLz8xAPZTzfHe98PLeWxmzqq6GNzSit19ElTUBkqmP?=
 =?us-ascii?Q?BhM+cmkL/Y7xKo8mVaTxzTNXqkmbyGSKE93MlCnbyl4FihjkLtwyWMzBn8sL?=
 =?us-ascii?Q?RI0xLlWutaP6mdQ3c5LC4J3ojW3QGCNmAakNkLnxfAKbwpVt9bAh5pdHV+1p?=
 =?us-ascii?Q?I4PF4LWDI8eJ9RTnjkAaqVuGYcbdrlXoVWAPYMFTj03PlKRk1nZZPo4wqbhu?=
 =?us-ascii?Q?S1Aka55IRu4ZBw+u120EDsFqv5SD1sRU9pp749ZD3NQh/7Ud7U62Y/0HlPZv?=
 =?us-ascii?Q?Ru50+5XIF/Kmttdn/BgRCwSSd5nCcHgdettVaQ/7SswQVG3s/Xp30Se1SDKf?=
 =?us-ascii?Q?6tRyPm7owOlJsW+Rj4vEIVi51j/RGxwFhIlRPG3X9ob96Shdo9L9yv3X4LpT?=
 =?us-ascii?Q?GGJ0nYpHdC6OelXJUNAInccu3lCWj8k+ryWmpJFhMwkwoRK6UiZC02a4R11Y?=
 =?us-ascii?Q?9UFY8B6hxpVRRLnO+82rRWuPeGQyUa5ljMGQOoW988Yahs6QZPxyfIy+UQ6R?=
 =?us-ascii?Q?C8+fP1YqUvM+N9Se/1aHTH8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf44d09-03ad-43b4-0fce-08de20b9486f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:49.0924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkCqoiTlpUaxTkFOxo0kG/YyjhcOpsKm+2GE6KP8A+5T/KICFl9qF75grifs6K7M3Pu7HX5oexQR4NpLrnli9kqcVVOACJxj94bFxHUgFD0DDTIc+vAeSPmSBfa/QFmP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11220

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
 sound/soc/codecs/wm8770.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8770.c b/sound/soc/codecs/wm8770.c
index 5685c3bb55559..d382b476c89c4 100644
--- a/sound/soc/codecs/wm8770.c
+++ b/sound/soc/codecs/wm8770.c
@@ -497,6 +497,7 @@ static int wm8770_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	int ret;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8770_priv *wm8770;
 
 	wm8770 = snd_soc_component_get_drvdata(component);
@@ -507,7 +508,7 @@ static int wm8770_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regulator_bulk_enable(ARRAY_SIZE(wm8770->supplies),
 						    wm8770->supplies);
 			if (ret) {
-- 
2.43.0

