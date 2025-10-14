Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011028.outbound.protection.outlook.com [52.101.125.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CB530ACFC
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416005; cv=fail; b=I5o8+s8WAUdQxqQAXBJS4Am2xI40Xerr/Th+iAW4ZEolX2xfRkbvvcVXoZFdZb/eL9EmEu/fO5M2tMlnfasqTr97iudjEAoHvi2KrWFhc9xGor42F5abbp0V8E0fYki8+3V+BfBld+1nWE25YPVRUqS5g8UJHLV4UINFRu6/kwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416005; c=relaxed/simple;
	bh=0LUS0gguC3uqq+k0JSAEpQGf1VXnQnA1A+62Pg8jGKE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DAzugZidQTYmcAI5dvdwPnLy9LINmQGP8f00LvBNiv/gw7IEVn+UqlKTHsMHHuNFeEZQmZ2DUj/R/xSinflloHYWo+j3NVdOzZY0MYRmmb2/y0k9NUf9GEy0dv/xhowjyjEG6z/zElwHf2IxKe3fE4oAGbXhwmgfysCgnUoWdO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=biQKaBBP; arc=fail smtp.client-ip=52.101.125.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="biQKaBBP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ta/gBww/6nan7ijaP+NSJxBUPtfr/yhHjw1I8ApejBOnU1Z7M32i6vV1i7gfBTm2oKIIyr1Sr8BUYXIe7Vju2KgFy9xIZlZZEi/rW3oJSN2QR0QyE5r6Yv7m6H93FGPdP0cNRFC9l1KJPE/Jk7Xe0hVRsejjqQvwCrPB37oAUieyV3FkjScz2oYbw5ziA9QybTFOBIuFg36oyhrPMIMHwwk2YYAOa6oFXnIQ3WbddazN4UT8NdUOrPwYC6J8rvHLuIbKwDODEyNalihLP+kVGq+6aGsEVog09vxdOgVFUD7HxbYjqRFs8R0VMxqAd9Ig6v0mnJ5FZ6Tvlj/YTpzx7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvHZX2X5/ZwwkiyoHXcjGL0pxztaROpgLa3/Pf5904A=;
 b=ajXsexAgbJcO15jHZs4uIGYQYOF5tbL3jP3qzC/C/hnvC/oGwLYig2PA0JKunoVEKMLUfqqIWw/7TiLO448uar8soJYY8ywRiUDFEYgEvl2vlBEf1X3polZ6lAf/yiZ2aGJAcg2wZBjyQa5FJk6b0JmP15Dx+LhYjClLf597FYLrq1JvLfuai1cB0zXFMV91jszebQqzm/5ZKn/C+mkUY5wmMesf2bjj3Y5vdAtwJ+VvsUQ/PMDTlXzZTmmmu7yL6LwunYZd32CGUA6KLFlUbb37GKhZreIfb0XP6nFWW0NqvUfCE54ppqJUlBQCXoJSRpcGpOk9FAO4koAUO/KiSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvHZX2X5/ZwwkiyoHXcjGL0pxztaROpgLa3/Pf5904A=;
 b=biQKaBBPw/KrQD3YqBmVctl/U+Af4LmhQiiK75EymbOnmbTnnhIB49zjRoJeo9243rnvTMtm8hMOpGC34bS0H0D2TMRKU+Mx/iu8fnh3XQ0ATpE4fy/CoKzHkPOEdzd/DP+qZFwPAGh9oVo5kM1vba8tEQ2/4JtV8aFBcvscsa4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:41 +0000
Message-ID: <878qhenm66.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 116/139] ASoC: codecs: wm8990: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:41 +0000
X-ClientProxiedBy: TYCP286CA0230.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d2ad87-07f9-4fe6-082e-08de0ad9e023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gDW5kk2CD/+V/pZCq4oRVrf4JgmqfQMNwYyS6Txnpt0nDkbfV+CHhgNSl9LR?=
 =?us-ascii?Q?ZZPtYLVCUTP1uL8oPzZsG9gV1lfhgBlRgALbhSUZPRwWanIP44A8wGwYwJaJ?=
 =?us-ascii?Q?bQ2fi0Do9ISqwIAlgAS3Yhp5Y1qw6WjZ7Ca5ha6s64nSRDirx/eRuTkgjWjG?=
 =?us-ascii?Q?x8YHw3qpAtqSR90nd0XO29dN7C2P7XGGRs+UsfQ/gcx1GwJqCHGIJWzUX99/?=
 =?us-ascii?Q?bo5MRVowA9bOzKphSH24SHpAicpx3HvaFOGeRhG1hbrwzbYgaatZF/skjafN?=
 =?us-ascii?Q?fIFFnVq+uLqQ6J9n+okGWMnavWtkUC0XzV4kK2UQMV56GCaLxxcYigNLTXsb?=
 =?us-ascii?Q?OVP1vh5jb86X00nTsvBxZh3CDHPnjaUfz7M5rlqz8kaNUGdxlkcNugbnvGHz?=
 =?us-ascii?Q?TJlOARP0mwDsVVkpyIgV3p5uYDlYEdC5AABWv5V6I5VrED2XDljoTdzWineO?=
 =?us-ascii?Q?vUKi8ipxigBaO2tmBhm4K99OmIKMzLoCFJR63GFMKwiaAF4KU+bjVSJTAzRZ?=
 =?us-ascii?Q?Twc6K903kLntgtL4KMd4EUhcwR8KSa27L722ohhyRoRTKTBBUFg+YTaJWAil?=
 =?us-ascii?Q?HhcTgV8AKkluS36cdzSE7UIlI0RpMdpvAUxCvBzGCSNRKXA3lxUt4H15NJCY?=
 =?us-ascii?Q?AWESxDgzfnjCobRSTvlBy908JVDqSjbilqj8HGolvKDInOjsdugM1w6BPh6W?=
 =?us-ascii?Q?I1Wl69ss3y0U4We56n+Tw2+r0xhqRHnIpqSF8sQ71ng5Kj21G84POBD0RpMv?=
 =?us-ascii?Q?YoMedHdH57kwMaiajB89vkp8bitonH1Y5Vh0ECx1XmEcL0/X4GFTpT1r768C?=
 =?us-ascii?Q?XOviN4HKO7nfgzlvLjG81+ix2XhIRBCNVZwfWbglTdHeguNJ/1dyvF+wCSp0?=
 =?us-ascii?Q?HYCVCP0fiCTWz2dMjDDHbnBrgsEONiz/lWTCc4HY0MKLwNgory0XibRnO1rC?=
 =?us-ascii?Q?ZRk8jttaSoX3bzTYNd2yggSC9ncjjr7iDxP6/Chdw+6rVKIOcEtepQqPfUDS?=
 =?us-ascii?Q?/YEa9wFuLsCRMzDaU1dFjJLDOKAW4PwUZdxDpVbapUKrzzfRDjm83FG7AaxX?=
 =?us-ascii?Q?Wfeiv9rsCQNDXsTEUjj0YO/qlYCcz00K08oAugLwmA2tQ8qBhf4Oq+PBjDks?=
 =?us-ascii?Q?MpqeW2fCI4dvwAfyZLXAeAhqJ+BvoA9gB+9uk4p/RAulLVWMD+Bbt2JMGRqB?=
 =?us-ascii?Q?tLLUG+Qk/dwf4EKLFKBSBWDKYOnJh30XwxMPwjytpTr5LNuXKA4et0P7Rlt6?=
 =?us-ascii?Q?HUY+0qZfFze6DGxm1yt9+WM1qdoRpgIBV/HsfMvagW2M7yKKYbKv5/Wn43KB?=
 =?us-ascii?Q?b9UOjH7H8mevA+4fDlXJVBkeWc4WKNryVV06NYoG9fqHa5YoJgCIJMelVasT?=
 =?us-ascii?Q?XCndYhl/0/lEiytZev29TcmN+R2thpkSp9/P21Xo2QDvIJRFkREWET5eLkex?=
 =?us-ascii?Q?s4UHIwmegEjhf+pNjwhGNYSGAv0efsWRgexpeVfo0U00RVOJLAkQzVaulIf0?=
 =?us-ascii?Q?v1MucZTRkQh3YAFpEmxh4TNpSf/W2/1nd2b5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G5CltKbA54BwWUi1m0CkW+Z26k0JTh/8rWAMSFERZBAFYnghc4/HIr95xmmX?=
 =?us-ascii?Q?+rAWbOTP46tOTS3qr0SOIPMLtkQ5gsMGVj983cyhMnsG0db19wsuFZ7e/Iq8?=
 =?us-ascii?Q?wSNOfGuu+cnrYGJgp6GCXN3/IaJxgwS+QMcnhe9MnL/dXqXixGIPAsy35r3J?=
 =?us-ascii?Q?KPvUeP1fOE4NrYyAhmymelSPP/Ku1AY4MtXXwysdq0ThioeU/XpM87Fk1dzN?=
 =?us-ascii?Q?PzKqPXKs3rIF11xaKVus4Y3qmKecFEuwgPb9TccbWPvBZCcx+93odjx9+xye?=
 =?us-ascii?Q?TOGU1SzTLqzArbnefSfZ1qISj0QiSznpJMW1rmMozln/iljcml1kj2oDmOvf?=
 =?us-ascii?Q?gv1CT9uX9XxosiyxzB6XXyyoi06reIAwMfX4Qei3zgl448eHTkmpsu6TM1WF?=
 =?us-ascii?Q?WeOrnmWPm5AappFv95GbFEbvtuZN/6LC7vlWZ4JfcDVIeBWg4ZkXB/kT0Dwm?=
 =?us-ascii?Q?0hul88y+5PYaDkV54o/o1PcmYDICSziy4v3HfCuUhG0bM/oY4tVDtGVi0JO+?=
 =?us-ascii?Q?lgDAyMxqfKczXomyGhCuUH0PriD+wki6mNrtIUGwUZJ+M/+L1WoFQA/nJZD3?=
 =?us-ascii?Q?qlqVuQrfdqeymZascX/Rq31gdrxHIIv+2HBqu4dLWU1JOFJ2TCHZlBrjqjyb?=
 =?us-ascii?Q?On95vwEppZl9jTonOVmhrxLrBlTpC4zZMUQ/V8TSE8OHcYDFYIr+g2q9dts0?=
 =?us-ascii?Q?uL2XAqTp0iQWQmufr2TSzLAJQ+Tbs7zbLTer1MxDtfP7xGTnzYtv9Ka5/5N8?=
 =?us-ascii?Q?lgBoI5BDDROn1DFtDd3Mwu7Cs9+VdxqLCIZpHWib89sJQPPoeaKf3wFVErrN?=
 =?us-ascii?Q?jkswYa8wWYl2R09hit6OWGnuxK+dpSdfZwTubdKbGeSkoAeiMlMQT6osT4A/?=
 =?us-ascii?Q?H583ksZ1zoy+e/NHh2TAe1cIauYbiNBTRdTt/zn8AWRK/jahul9gs6T8u5Tg?=
 =?us-ascii?Q?2RO61bfCFxWNKiQ8GXPkCHM/j2pqn3RmGv5oe5RUCeqONZKfOqg7/KPU1m9R?=
 =?us-ascii?Q?f55IesXa21nMdz4b0RjtXKgXJLdyoJliJw/VzOCarT7B2KqNrKgZhHle/44G?=
 =?us-ascii?Q?t1jzRjdFA6A8L1VkN6GAN0lqfCQS1PZ+5xbpUajZrRd7VIofkiNHdOzfSro4?=
 =?us-ascii?Q?m2sr1KzwZApdKSVUjkIeEBFsqkxfuNreziOrB4uhq2BJGHOocMkFgEENJn+I?=
 =?us-ascii?Q?XnVqtgKlbnyDRuO0gLVFMjx9H10eUhHHfqJoQ4AhKh3O+GBKdgtoTsjsFAgt?=
 =?us-ascii?Q?6bh4wGsqyFqf9k4YwdEcl+jTl6key1Bs1qLOhCrzWh9yfXqqzwNcydGtwwKj?=
 =?us-ascii?Q?kFvAJEUbIUycidkWJVdmH2lWymH0Rj0VK1j4739PePM0l6+x23NVCUJV/ApF?=
 =?us-ascii?Q?SUfZiQP9so5R+3/9gH+Skk3M5mj9bzR0kMM4hYxc987uZLWke/+Z/2KVR8ms?=
 =?us-ascii?Q?zKCmVSc2nkC9HQ9MH7WeBjNEF9tolazwYg/9BvyQhplOaBjvO93SXsLBB6js?=
 =?us-ascii?Q?J5I8y7BTNfVjv1abcEDs4BWG1bYHzZhJ/p+wfei38GswGj4oaQZRU9PR1wUd?=
 =?us-ascii?Q?yG6FLdGMSNkUz5tnHq6zBgb+nP22LLM9AyHGFvDasVJywXvyZlretCwIMwXV?=
 =?us-ascii?Q?/30lPCV+rXTw4SgCD4/20aU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d2ad87-07f9-4fe6-082e-08de0ad9e023
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:41.8798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcZJIiuu3PYTmDgM0tPT7gic5mnooHU0rT7eyXtFjd+QRxebMXyWRYrbeVk+QDDWhLPhnWLkS2pYTX9oD7zIx+JK4c19uV4xu9th/XFEgaudu+uhTwideOFFN085Y5dY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9955

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8990.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8990.c b/sound/soc/codecs/wm8990.c
index 89df406bf5525..081876f7c73ee 100644
--- a/sound/soc/codecs/wm8990.c
+++ b/sound/soc/codecs/wm8990.c
@@ -49,7 +49,7 @@ static const DECLARE_TLV_DB_SCALE(out_sidetone_tlv, -3600, 0, 0);
 static int wm899x_outpga_put_volsw_vu(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	int reg = mc->reg;
-- 
2.43.0

