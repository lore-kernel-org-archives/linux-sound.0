Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8B04431
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 04:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754455329; cv=fail; b=GD1s5jmciax3+wyPS9J25oWqgDiOGQ939LIN/U+pPDTzQhWDE5WsumJ2wk9LZ+vZEBvErkK/BQqr7cXq84HIPWBPYyZ92kzxZPe/JdGoX9KXrU++QuMQWFfPK29FmUZeUOepzcsgYMKXtF8h0fc4oGEvdiiZD04eLIi31zd9LTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754455329; c=relaxed/simple;
	bh=y5D4pcQQr08BbLDtwuiK5+27WevIgqBBsl1LncOSvSY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WrigKX8JOUCBT9SwmDjDmZFS7aHPHVPpD177nL/7Q4bKwy6j49ajbqsUU07DVb03tMI29yw2Ka/rSRPHUjnb50aokSzLkVt41zmH31AvWf/BXDR9nrz/motBClLASbTEal3sj/AEAPfKIoMJuejfHM5tqPRCDYhmCUza6DuCuMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DNpHG+LO; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DNpHG+LO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vE5p6/7i7NI/6eLpZTsaD/1L5tMhWZ4xJpaboisBm711I1vdNCcj3El/6ov7914Im5pJiyR3B6CrDvxRrOc6Ei9BA5FB+XGiO+UfuBgE5JpybZG9nAPQYd0bq3z8+ahd7kPAQvTwJRTZi3ZCBYpudi3874vEU4c5qHVbASGGeDt0SZ17wwM1DOZxIU729yD7BwHqR2FSJdB3+fgcXHKt0imijwKC8AGkYEQ1NllYwj7nCY+jVodRf/BzBCnGJdz8xVSExCO6NZ4Fprf9hmtSteyyCZT5fm1EVuYtm8JLJ8hnTAWJWcnBDOxempu1PwCwW0TPoDVRNJ90YWl+PtHUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3RuwLVgtQ9fEGqe3aIA63aAbw4FNkXQD8ulhm6L4Os=;
 b=wfkaYR1DFEZ+w/6hNIAGUhSml2drrZC7s0to6PM51AV6Pc10bfjX3F+rugSGWvd5LSm3gllQ/61uT1+2gVc0DCgvKKOX2pauXbT+C/e3PciLUGItnjxlLcC8Nd4MCx9zrruJc1NZOw03qfXu7RrO9evofAFJDAmEAgZZde7G2WUkhObrrFOiIByqAjxMGitWYq5nr3xky+TLUAqiEyHhPwn5gHLGeWF3G7Chg2RjiLpG7MqC6KkBE4WXMw9wi6Ysk+BGSQ79gI6rm7gdgMOgqNhZeUpFSeS8ZPZOmboodCJG7c9AyFS2tiIsvf3qWcF5zYvcxqg35WladQDg0Ekl0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3RuwLVgtQ9fEGqe3aIA63aAbw4FNkXQD8ulhm6L4Os=;
 b=DNpHG+LOROZoaCg0PL3OSh+kQjH+7SX/82xBSyMBy3vf9BMJ97WnJ0xePNd56GM0n8X+y9G4Xdo1SOP3Qdtroz/zmphy4re5JhmSuHUn8lMwU0WRG3FXaEeRJURO7VWNBYGgzLVt5WTg3qQiV1I6tJpNkDfBldcmvG7aHiPWBs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15138.jpnprd01.prod.outlook.com
 (2603:1096:405:227::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 04:42:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 04:42:05 +0000
Message-ID: <87y0rx6oyx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/5] ASoC: soc-component: unpack snd_soc_component_init_bias_level()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <875xf183ka.wl-kuninori.morimoto.gx@renesas.com>
References: <875xf183ka.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Aug 2025 04:42:05 +0000
X-ClientProxiedBy: TY4P286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15138:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8f7c6e-93ee-4fc6-851c-08ddd4a3981e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9WgqOmA7IWPUBpmDqI+CCw4Ldl6zvHYkMdEErnLGQJty/rQFEhuChy/hQzoI?=
 =?us-ascii?Q?CUMwAW8vL9NvUZtwWdg2mTRxmvLthF+At+L1/t/2UbH9GcGCNbVyC36bxUL3?=
 =?us-ascii?Q?2wvNVwBxarBATOz388fLzblau9zb/ey0OqrrCFYXAAeUSKtdu1V1WVLjSLoO?=
 =?us-ascii?Q?tV584BoqDxU0COPKQ5ckStDHHkx6h8hUnACbuWcExBJg4cQlDPJ8UUhUKsni?=
 =?us-ascii?Q?6AoJqCbngXmz0TDzRy6fJoEKslMWROj9NFpQ/vUe+icBLSclhcbHS17/oCn1?=
 =?us-ascii?Q?Qsyl2+pUEFxHvoccKSyUfZCOFau1Z2xbejmnVdGmNWREOHWeOW+ZUnWc+uXU?=
 =?us-ascii?Q?hvRcFY/InYGXvMlg9MrA8n7oXvYtoUurGiY720OccTZyLJ09hm/oJt3tFDVy?=
 =?us-ascii?Q?L2C8uIE7pm1npZy2O0K7KMQOQMAI6rPTyY/CXZZtqP99DhGzwM2u2O1ZWGpG?=
 =?us-ascii?Q?fwYO3vzaXQ504BGhZ1dcwWQoYHzgo6+67oEmjcQpzep+oOxMEb6gF9k1gcdo?=
 =?us-ascii?Q?e9GHPbTUuLv9cRrkJkeZVLyfRtfF/O6blHoC4MZVn9+ewhl2q+nzemjBZFVm?=
 =?us-ascii?Q?NSBDMJrQozpq63cf/tuWGPeKPAiFOSIbsQmfDXhDLsMxJtUnk97NOarTKdQ4?=
 =?us-ascii?Q?ukKnWB2y6xA6F+S2/NFyu6L2JNhAHWXmwN7bS4dINhL+IVvixkvpLk5YB/js?=
 =?us-ascii?Q?7951+Wof6PuDHvLmyQXllAANcvfTfjtRh6n+rZqeAdGleyK29Do0kbJUJ2Ee?=
 =?us-ascii?Q?ExucGzDLLgyW+0py/uiSuZy54Z0/c0RS9/1U7bir4e3dh5Ty25GvT4ucUUsq?=
 =?us-ascii?Q?o4oR89gI7MyF3evsIC7WqtbaS+hZ/vEWyh/DzFIjjzBh73SprDNS9gWO6y9h?=
 =?us-ascii?Q?x5cBns88j08V0oVPsIR4zVwTmjmjviRJnN4PCxMHAE2YSQh+IVxkX9iUl9FR?=
 =?us-ascii?Q?SBpnKb+vOvvASAA5yzPRCokEr7aoj9biVNw0iAk3VqyrAfzTzsYQgPAKk2qe?=
 =?us-ascii?Q?ZKfzcZ+oTYvPoIyepQgjtFIJxN9qYMSpHTtF2JeSGUEPdNz6Ocpp1jgXpEEz?=
 =?us-ascii?Q?mLrShS5vny7ZVzVyL/vSw7ccqcKGp77m1nGTN35ejXK5pnKGoSOEXCavS5Ei?=
 =?us-ascii?Q?VB2gyeVJhBKoBxL+4yJeDRVcLfJZ/K4IQ81Bw59J/73AUlM+3QWmxeutWsZf?=
 =?us-ascii?Q?qia59Pv1HFy/MPez7WrI9i+dsHfYYrm2WdDutPPCSl082+j51Io1aRNaHZWH?=
 =?us-ascii?Q?4xZe29VK20EwyF53hG/4aj8MkzvuYra/wAx8muNGl7s1WWRqMoMs6jhEMjvf?=
 =?us-ascii?Q?VqMl0RdI5uuq4l/KhTsukzzrlckrTgB8UUcW2fTGO/6fuHi24KtW9aPlXdys?=
 =?us-ascii?Q?uOEg5By4iBjpcXK2KMBMnVppTDAgn7FIXy/kysu+sZID/coUZ7A5sgb+8g3u?=
 =?us-ascii?Q?JMOodjXROiLGjtfUlnRcpFccnIihNazcYsinH1yL2eeI+6aRTENoJQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?edPVsW9Gv3LfmdNQTsZ+Cj5Ov9JLATXvp3Sz4Q0bq2Zw88j/kS22LK27C+ya?=
 =?us-ascii?Q?CBlGF5uSCMKpWKq8sUDsEFNvRlL2BtOYYkUQnoKTxW+Cs2liArXy9YR9lIMF?=
 =?us-ascii?Q?jM245ClekZ5J7/yIdunYrug15l1YWOB+TOq9amSAcu6qtuGieA7u4dUeRDXy?=
 =?us-ascii?Q?XvNhgB0WekL/I34IKfaqfCpdD3POcWaqIeE00qxkgZ5eH8L0zMReNVK91sX+?=
 =?us-ascii?Q?28aNXxhwI8FxO2Up5DcDFSe+Ay8cogZaS6DARR4yHHwLDj2c+gAHPSevystW?=
 =?us-ascii?Q?k+ctLQvyBmp7MmoX4zTzwNEokav0WJNt4tx+tFgzw1glmlNUdytiv4maZ7X6?=
 =?us-ascii?Q?GPrhyE1sWbqJWoFo1eq+wuD5slRWrVzIs4BLw4iqX+Oekf4znIf0MeSNlxPm?=
 =?us-ascii?Q?0p333NxA45ttXCi0X0x9lHrpLciw73dGSPkpBd0gHl3NxgQ+O7VRLOlrFkI5?=
 =?us-ascii?Q?qpGSbIUCCncUWlkW/urEkM2EbiZ0OvTVr7IyBmJQcnXCLJrwitLw2Xjzqw6B?=
 =?us-ascii?Q?nD5yjb2ftBYYgvmbtdA2o128z2luyQzESYgfupQvZCwSSxPmByvnJM0w1AJE?=
 =?us-ascii?Q?sn8xnUveliH2JTy8kHnYtvGTqoTIYH0HOcfJGmrxjO63+pyNzJXb9G+WbnnQ?=
 =?us-ascii?Q?UizdXLmnVGGfLrQ3Th2155+yFsLRJrH3oQ01H4FDxcv/V9NotPPiYHvfqmqx?=
 =?us-ascii?Q?J6D84EbdmiR2h1Zh9WjgMYkykecdno3W3W5eUX3gqZ8qTDXm1ZKJR8bmwOqv?=
 =?us-ascii?Q?xBw6FuXzP54IqrXFc6yYxeCZBvUt2d7i9YlnjwBfOeWnzTbIFr9VP4uk1jCd?=
 =?us-ascii?Q?wElwtfQy5TpVdOCGik2M69v+ZI9Xl3ZJTbQ7GQtikvdArIjMRkmHuJbB0Kzg?=
 =?us-ascii?Q?pgQ7qow4WSisxkOAl3+azHnH+TXDDW+m3npnxHDz2SPZ4gi3Cuht6b8ImE4N?=
 =?us-ascii?Q?FSWANMrsiZ9oxyoGBZ9NYoWsVGJjQ7FGusBBpQASCuk0yK9Q6MectZNe+Fjq?=
 =?us-ascii?Q?4Hb1n+IfGCakWQwG2/d2yXnMZr3dt+FvwoPOL8a/cafsxKhwmswrQYkK6giM?=
 =?us-ascii?Q?Ntu72nK3qKxa1Sh0zPkfw4Zzdq3USDxsvkmtQgg+hjcM2KCbjdJI2H+LXZBl?=
 =?us-ascii?Q?nUFhZnDyZxLXbkwghIUnqIZtrJWboOHCCRgAuF75w4W0ggVPDAvDcgX+BNOw?=
 =?us-ascii?Q?mzjMXdH/j3yIFfh1DPZM5xAsTSEl++Z5QlnvpgCmkOvEjpZw3fnG50uqq0Kz?=
 =?us-ascii?Q?OPjztsxpLzBBKfIoamQPXBK5JDnqPad/TCsFzMgssciGdWus1t4ZTiU0HJ9H?=
 =?us-ascii?Q?BRGDzCL5X3h79I3ZF3rkL69mGufs3KQVy8zuZWfB81IxV45HGtJ2A2bTRjQO?=
 =?us-ascii?Q?BqvheE6JSZRhr04JO0aMcHD1ziozZwF0QrJ+yfoR+RK8aBmfu11rnW5wj8B6?=
 =?us-ascii?Q?GfDTvLX3GCNNDB2XSdnCbZePRA8TQKKp/keUFD2Iki4fniFQWTwVLdG/SQpx?=
 =?us-ascii?Q?8I8EIiZ+uxjMRN+pvsh7P8UiaPk2N/Kg6Z70a/i3SfYtrqUoqQx1iBDNLag9?=
 =?us-ascii?Q?KlTgih9dTJCDM885unY0IMARqfgueTNpfbOoYZaVWCyx2HlW6J5OE+PRwiEx?=
 =?us-ascii?Q?hMYSPYfMLR0i1sAt1uMa8/g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8f7c6e-93ee-4fc6-851c-08ddd4a3981e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 04:42:05.4677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCb1tQ2Lkap7B3h7ks4A0V7mItnVHAmtqYTom3l9K5a2EeS4t/kqpqD2L+XWYiby8tMfiucRxTOk7ifwO7OydEhDcrU7Ll2+agiN/8i5TXDrvXOH1DciXCbHbNVoW9xl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15138

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

This patch unpack component wrapper to cleanup it.

This patch keeps compatible by using define, but old name will be replaced
on each drivers and removed from ASoC in the future.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 15 ---------------
 include/sound/soc-dapm.h      |  1 +
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 86ad2802879f..54bfa0cb1085 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -286,21 +286,6 @@ static inline struct snd_soc_dapm_context *snd_soc_component_get_dapm(
 	return &component->dapm;
 }
 
-/**
- * snd_soc_component_init_bias_level() - Initialize COMPONENT DAPM bias level
- * @component: The COMPONENT for which to initialize the DAPM bias level
- * @level: The DAPM level to initialize to
- *
- * Initializes the COMPONENT DAPM bias level. See snd_soc_dapm_init_bias_level()
- */
-static inline void
-snd_soc_component_init_bias_level(struct snd_soc_component *component,
-				  enum snd_soc_bias_level level)
-{
-	snd_soc_dapm_init_bias_level(
-		snd_soc_component_get_dapm(component), level);
-}
-
 /**
  * snd_soc_dapm_kcontrol_component() - Returns the component associated to a
  * kcontrol
diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 6e2db79d6a97..2e9196b6ffba 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -728,6 +728,7 @@ void snd_soc_dapm_init_bias_level(struct snd_soc_dapm_context *dapm, enum snd_so
 // REMOVE ME !!
 #define snd_soc_component_force_bias_level(c, l)	snd_soc_dapm_force_bias_level(&(c)->dapm, l)
 #define snd_soc_component_get_bias_level(c)		snd_soc_dapm_get_bias_level(&(c)->dapm)
+#define snd_soc_component_init_bias_level(c, l)		snd_soc_dapm_init_bias_level(&(c)->dapm, l)
 
 #define for_each_dapm_widgets(list, i, widget)				\
 	for ((i) = 0;							\
-- 
2.43.0

