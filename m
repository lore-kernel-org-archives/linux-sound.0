Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011056.outbound.protection.outlook.com [40.107.74.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C440B30AD10
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416043; cv=fail; b=J0xCnJL1lehxc3Jl/uSTBHThuzzAofh8YdiQnbrTrTuZfR5iRrAfc3LHhhqV3ElcgVTnW0Gi/OQcuEnnr2Xl/mJaHsqz+objxWOe3h/YHbsrL4Tirc7bR6CpiG5qLxbadrMMwas2Xi/xy1fqjdL1Bi506dZ8Lrlco9vurYUpWIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416043; c=relaxed/simple;
	bh=rOGyST7qB+VHaq48rkUwHqsX/dWEffTiAj/Zv453aBE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sM8CGqD3anNkfnAqPCFafOk5JDfitA5ifEjgzu5zlGY9o7IlI8ew24rnqCrNq3DwCwe7t1AdIS8/wOEjhBVvVbD5Yb60fzdTz4xM5DT6VkmKrxzslPT42dOis2EaLO2K7hIm2Vknz4Z13Q6Du7NrWlqZu0nwIb8CvCVfLJ7VGKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iiLy6CvI; arc=fail smtp.client-ip=40.107.74.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iiLy6CvI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APGXkM6XMXIiqo93JDUn7dS4RXnZwSmsd/gpuGHESYaDzD6scFZi05soDB85InYgdw0RX93VoZpM+ZypZHaQHbiJqou11YQbH+vPHxwKLBqtAqNJcgcsqczcUJ5/JyW3dIT7JBHKw5Yi59GWxlpxK+A2owgTTVjU70rid1RYtMAtpYXgUGDYeRBjRf/LLXb5hk1zgcIs06jS2+6K4RyovL4oiiN7oI0URZHDPgzy4NPuapQqRT8i9RYMkEdwUfcP4zzAzU+QosNCCtcDaHigX8MTw8082VP+gf8AzXAeThsqkzG6+B5RDqiq5xRdFFKr5Yi3CjfkpmEkCs/4c6uWpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpjSNBEYWpJRMIvv89CjEV55lEFYPNkpJ9KjAgmejG0=;
 b=b0VIIPqCJd5a6gTl5flDw1pjDVFC5ZzqiQYqDBOVL1AFPr4LD6LIyBlfPl0nGmzCwxesnDPAFGshChef/KACGpKEns6UGHqKeNua+4LSVHdn0PZwBIZj8I+Rl7Rwth1D8i5xry6M4u15ghjveMXfofFFe8TY/Klm6nRoCwvnwvFrQyW91Qt2QbYqU8DMmgew1g7FlHHR9tvRZ1YIFowIFueeoZTNWrt7QPf5YvI7qqhQ421IB0Ng7xY9YT0G9ZKTrw1AaHre87bEjPhkBCKWSM0E3Q7pJmFr6Jo2XRuCQME+nyA7HlqvzzenYB76QXSoojjvX3Adn/rLYMAmpfha5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpjSNBEYWpJRMIvv89CjEV55lEFYPNkpJ9KjAgmejG0=;
 b=iiLy6CvInDEi8HccvH5Il8ftKR4NwlUZEUO8JEbIeQx4mFDtwQsev6Uf0R0AdUStqHmO47bEqEzGGH+WDgDlLuKyP3PHDrt7siPswGfYY7bVfTpa6HWKEZvraDi67nwZkVjYr7c5PDaRaYlwmOmTSWsJ6ayt3+P1BG717a7rSMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:19 +0000
Message-ID: <87tt02m7kq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 126/139] ASoC: fsl: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:19 +0000
X-ClientProxiedBy: TYCP286CA0281.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e50007-76f3-46fb-9699-08de0ad9f6c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SwkxwyOfPR2CfO2SN/BcyAzDC+mrVoEhNTRFDVrs99M+3IEdzzOruGIXW72O?=
 =?us-ascii?Q?WF0OEsPWKeyCscz4oO6YmsO9PEoGZHhksdFAueGZwlZBHTBqYn0ei3AC11kS?=
 =?us-ascii?Q?CX0hQU/I4Ed2E+dh8hLEBMvDXPAvpe00WcC+wD1ozxjajq57hu5V5v/MZNMe?=
 =?us-ascii?Q?u9o+5U8pNz0+pCIiQDlmDi6Ppoh0htVZCe7LATFPbc6vAT3r5fxPPmJIeYbf?=
 =?us-ascii?Q?nqv1SxshXLQ+dA9L6nfpUgOEcxGR36HBbWF1GP8XBZ/f+3OhyG0JCZwO/jXa?=
 =?us-ascii?Q?PW69r7BrQ7brkR0n+z/Q83J6hC2mUjsVkahawwxyKKj8BKEP9B6pWXcRMvmi?=
 =?us-ascii?Q?lkRtFHm27a0Pa8IJuq3NgMBBZLNzZsjuFF6++xzMiEnR9hqvHB4RLCcvb4hI?=
 =?us-ascii?Q?ofYIl2sPdMm8QwFOWNUtnRuV+XGFIb3AIgvc0TduxZQoPySzOeOakwlBZK9Y?=
 =?us-ascii?Q?lnVdrJG04AeM1Buyb5uoT/oP5kvlWsFkccKxFZO/d7XBpphkcUYMeupsRbug?=
 =?us-ascii?Q?6PlP6KlBA0lwdURKzEAh4nWcK/0T80iawd9PO7yr9xG6ha5tdhBzlqtErUnV?=
 =?us-ascii?Q?d4+88UwFUTWh+tbXOowiwaHu+fAsZjxkoi/8uhbZQ3SGSkGpbFkDkZ8BK7Ro?=
 =?us-ascii?Q?OvSxhKYdi5M7CajfGPGHuNWTH+m9DrSQSy8sZQL0yMwjEUMNRRI5ryLDUDn7?=
 =?us-ascii?Q?GhCxsDn2b53D7bxWiV8KDagkbsK3LLY4DPYo2IF/vLqhMRXyjAWBuvBgloZH?=
 =?us-ascii?Q?IyliSGc6BVE5/MfNaXMsUuPlfDokPZ2INutY8UgL/+IiSl4a4N8pwT9Cesv6?=
 =?us-ascii?Q?oEmg4ZubwwRQSvXomKtEJOz9jhA51s+9PfEwQdpNVp3BaWNq3JfXdyNdT7Pd?=
 =?us-ascii?Q?F2PRJGSCHG7GJ4WQ12v9zA8SVohzAEwvURmMySpvjPzRv2EiXntjhcE0Y/pe?=
 =?us-ascii?Q?cxSnUkqmIcQRc5u6mclEvGwXPPku5GFFKJFEogmGuUnXh7WjvEAgbW05a8VA?=
 =?us-ascii?Q?QK4VXRdic2ibF/M+M2gGuTDiy31FMnUYFO8dJuETi/u7ET+3f+byLYLJMA4t?=
 =?us-ascii?Q?pBpmy35QPV6lRZFgV1C1NPpj3yIicIypA1l2c/8vRZEE67g53misQ0ayP94b?=
 =?us-ascii?Q?ZDjlTj2JrGm2u8/E78zkedJRsQRbG8MGLKZxYzwus8PGxrAsIqXlDUlLn5Is?=
 =?us-ascii?Q?98wDXYsVFzw23XTHlTVEg17zaq4i/pSEcCQjEe7klm/UzqqQ5/mKxsAgHvcH?=
 =?us-ascii?Q?Inogk8FNGyQ5L843KmLducrlver0O06Nws6bLiSRe1IfGljYvGg6Kx/Oh6bz?=
 =?us-ascii?Q?5QSQZY7i0ZmOiFObzgQYtX1Cv2kuWrKoRAOs9WLMgDUkTpUxC86G9S7GHfrk?=
 =?us-ascii?Q?aY9OqJINuZM1wqxfFoXk+s5APq9rKyBZlDcdZ4PAWMEHiZa3GuwL0d3/PMGY?=
 =?us-ascii?Q?6Es2+O7/D2XhFSunpFRgiMk8hEZ+dUJpJ/p7LjApCuw7QI/qErDCGF1VnnAp?=
 =?us-ascii?Q?LFHRjGeQey7Wf9A9plgiAl+PzJ2gmofFsGia?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?48fFuP+818jmc8G6YfNyC6cxI1p31WBtqu372E8Zefe4s7bkQ78Zn/+MTI38?=
 =?us-ascii?Q?ijsRpQ8JZQY0a81DtxH0yOaaerYYw5G5Bv8qE1EGCZdH/+7Wibq9tfwz35xq?=
 =?us-ascii?Q?5Nu7y9V88t55q6s+erq26AqdLCAqa71ianJfVZOTJWvctOBMAuCPvBg/6r9t?=
 =?us-ascii?Q?3fOfouZj3IGTNINBnehJhjQOCKhZeQwykTP6afaQGvGyqcIYIVYdDF7CBSFz?=
 =?us-ascii?Q?Gmq9fkGkC15eM7idcrTtFQWWQqi8Z7TffzZ002tSrIuIAEaOeLKlGrsTsdzB?=
 =?us-ascii?Q?o2BK22ealnO6gltDbnCWx6GZvtqSjAAdTsKTpmNK0S4rLE89vCWCXqPEoT4O?=
 =?us-ascii?Q?b3kkojdERXoUGPnhwUAHa23iHaY6c6l448ttWLxaudgsML30KLhSIQB0sYgu?=
 =?us-ascii?Q?pbUkT76TTNi3xyp1iHJjHjvsLqsyzD6xpqBWxDMtw3dbQik2SS8odh6YkzwC?=
 =?us-ascii?Q?hbczxJ40w98aoYCHI2Q4qD/d7rtzzk108zy8tcWegRNYvhOCMFaYRlMIFNZZ?=
 =?us-ascii?Q?7GpNgs9WD53glXTpvrAi8puycJnVS/3hITM1p8n12M7Sk55IjoPPOkKK6G72?=
 =?us-ascii?Q?2QUdCzIDWv74ul8/bPa4noDWB/WV6mZ6dS+Cx0FXo/sR05k2yuaCwAHx1/WW?=
 =?us-ascii?Q?TUZo3sIt4KfQQEy5J8sG1vE/cSItNtHnx2wtpsdz71me9AZACoJv35D1BIH2?=
 =?us-ascii?Q?JI6lnp5QNV48/0FhvJ7ipdSAaGqufJ7XDKbjYpGyUaynG6bLWdYVchOBQlyK?=
 =?us-ascii?Q?zXknayxAf1eZuQ8j7Tpn7GloAibnHx7WyiTBRCvPFzCX5dxBb3OOyC64PpQb?=
 =?us-ascii?Q?HCTYWnx+tkH8VexPChh9t2fik8Xye0CERh9w1YgAuQttqtGAhGHQGgAjgJpt?=
 =?us-ascii?Q?MLaZvP6AOB7pUPacRPosE2jzlmw8aM1oL8p6G94V8Ew/8ZWwyu/litj0TrYB?=
 =?us-ascii?Q?SKBpSQmxpbfa8hlApUt7V63ObCNXGZdBUVDSv6FjCg3XSVAzJwSd4R0t/NI+?=
 =?us-ascii?Q?p++9LQ9GvmgqhdtTAXOhSTt5/WD3eZI9FKq2248q3ZVmNMeFXIUz2UhuLH4k?=
 =?us-ascii?Q?uNkgtnOBtsRQbU01ELmA0FGTFK7NIVSCYqYFyTSeE4Vl3L7xB7vglVqnS0fn?=
 =?us-ascii?Q?p/lplPzP1mzVJVAIAPBrdC6pjCEGwpc0tgD9ZBm3ykbzTABf+c0dkB48c9Nt?=
 =?us-ascii?Q?kKpYdzw7DVlb5/ah2Ff0aFXbg+sb21gK5uSk7gpdFziCJGgrtb/6rnAwxN6b?=
 =?us-ascii?Q?CHUqlOc0XrRolu0m4ediTf5iuHHTupdxSrCt+PDtVTDBnBWnGBFqyxQPgARq?=
 =?us-ascii?Q?l4olCnoZXxKCZuHiO4AXg7dqLkV8EjM4LtkhxIYRjEal7NWR4YlfV0Uwp1/l?=
 =?us-ascii?Q?UOOs68nobT7f+f2Z7X6/pg1Zf+DDmXfOrHZPnr5WFVbI/qBU3wR2cizEfsie?=
 =?us-ascii?Q?69mv6xHk082BjS48UErq37cicipMFvQr49x5lJ9s5/vIczmqFEP4A3mamKjy?=
 =?us-ascii?Q?UVKqo/t1T70C7HSv0/xZtFYz7C7dDjidrpqENHHm9A0qt0H9qoRiLcm5Rcj8?=
 =?us-ascii?Q?6OCh0Aiau4+N9Zp+RqoyGNYJ6KIVSJHpoFdvYQ3teUfMAAmOycsmdQw8PiJq?=
 =?us-ascii?Q?B49w19U+N5JpizPo6jf4yUk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e50007-76f3-46fb-9699-08de0ad9f6c3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:19.8375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwVIMM2nwRMRYKoKwXP3HqDaodqLFe0A+Qx1mAd6b5VsJCvovU3CmJMbLxxzqDJJSHwqvepvoqvmq5Va933WB5sbtAQCKvbsxBZZZ8i/CEiSxnYdLSrK/2h0m3ZTP+Bo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10584

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
 sound/soc/fsl/fsl_micfil.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index aabd90a8b3eca..6843be7380460 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -197,7 +197,7 @@ static int micfil_set_quality(struct fsl_micfil *micfil)
 static int micfil_quality_get(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(cmpnt);
 
 	ucontrol->value.integer.value[0] = micfil->quality;
@@ -208,7 +208,7 @@ static int micfil_quality_get(struct snd_kcontrol *kcontrol,
 static int micfil_quality_set(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(cmpnt);
 
 	micfil->quality = ucontrol->value.integer.value[0];
-- 
2.43.0

