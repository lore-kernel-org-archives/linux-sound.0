Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F01EA7EC
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820988; cv=fail; b=m5pyQAFrcg5wWco+/uhAkCYLveMgtOCPqrFZSWDV2tPHum16npl3g2KKPvPipYxzGhIOyxdwgqML7VXngJoAGntoDEnLvt9etmCaNcJTE6npO8tKhu76q5uZIby3h8r9VFRuEiXythlDfvrpm3TgbIxZThmMzskmJ8n60DdV3Os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820988; c=relaxed/simple;
	bh=wt4dAzlCXERVNOH1BKG567qjXAxaaZWzLvPk7eeHV34=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IXO5yvdKcYv5fpmp6LbuswDX17r0PvEUpcFMLqbKPAwRpm+rMm6pW0ovsdG0LUNPcZfJBg+yTWDIGlg0kzfwog7HM9tJcDpwC5rXCEPJ+lV1Nwa3RFlqPcuLwj0RksmjvCIsscvlmmA7NqmbwZiq3Fvp6+yDa01hKmLBxV6p8bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WKWBzqWC; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WKWBzqWC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLTG5idI9HDc6im/Gcn2rYzaa0JjsVVGBkAQj/ft6gfwvxkdVUnqpxZ6sgqf5FhefqQ7dIiTfJGryrKa4aT/tgwMLFpRv/QNQgB2HIJRkPL6BsdG888NbBkM9tLAhNfbuF2HXPoKK3age98ev1t3eQfbOKFgQ6HxdmNghDoj9ZSFVo8j9kPlg4TLblDfR70pOlkjZjyiiLRMEJnPVXaKDzh9Z6idDd5C2KKU/JXbO5VME5fqo9cLMt9KcDdVXynm7glCM2Y8XVoi329XGPd/+t+M+Gipza5oJ/SShJimM6cUYeRc3OKEFOKurdGB33OTtpkR1U4j6YygsYkj72ZzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGJAUebeVQkBlZNbCGmmOkQPsyTguzq8KYBVqm4y73Y=;
 b=hvEeOqkREsgIH+zwAjV/MVGSo/qPaLn38ZHGQW5fLR/3MXWcctlIAAWMYHkC5IUx0MayVDiptT6+ksMXn9rayfQISk5xCFEhY2RsUOLd028WrA1ewpaCwGuTx70SKLCYA0Cy1DLJtgRtehENuxqRwWxi61PCFZ0HHCocjytzf3wUruk6igtb7U0NYw1x86lEvgNkm0S+IIHWfcOz2C7NKNCD42//5DACr1GuQrGV69yH2G9u7UoZCkm5EE2c5DzydqtHJyx5/m90r/z16iiiEXFRVSOXKxAHGazTrN2IinyeQvMX2g/W5DXJ9+EupDSN+sxZDe1q7l6NdxR3Xol7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGJAUebeVQkBlZNbCGmmOkQPsyTguzq8KYBVqm4y73Y=;
 b=WKWBzqWCCEBZE3als+44+9zfbkbBnURjgzTVhh+RHLWAE9ImSvtH1OFIQascWYVIzPw8mq2sA6YTw4BldS+iWaT0PIVU+amQJbsAFbrUUccMz5TW8lciHQFjTFMNUynD83Up1PkH1Ah56uYzpPrBuednmSPD35u7cRlqAHcb4Fs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:29:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:45 +0000
Message-ID: <874ir1za13.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 180/292] ASoC: codecs: wm8988: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:45 +0000
X-ClientProxiedBy: TY4P301CA0049.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3b4bf0-f301-44ec-4c06-08de20b969ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XAeRgacIuykt973zGRKSM9f2ZMJm44bfC2cWc89hReT9mImNcbcnQqsGilv8?=
 =?us-ascii?Q?Q4UtSvuNsPPuPVRYPilXaE/zZky6ROUnZmvRz8pa/ALQEUk2+XBcIcmpxlu7?=
 =?us-ascii?Q?Desrum4RX//MsYDg0gdXLze+vHnDKjmPo6gdhivgf5t3xA+lheIyR/5z3vEG?=
 =?us-ascii?Q?wseE6kljqRlsilMOHZPTuHi15ioCPWZCZTEaqVcZl2/dV64g1RSAoykwyWQ3?=
 =?us-ascii?Q?PSsQwPJnza5vVX5rayk3jJxSOYly+3eAJHvltscAqAh82y7gsbjVmBJOwHyQ?=
 =?us-ascii?Q?KzyIsyyxExynK/GzEO4naoL8hCr//XZ/jQnLFalKtl3dF5iUpSCkSjpl0cIB?=
 =?us-ascii?Q?L2Wy7H+0w2RyPGcqU95DZMZ3h0vJMyb8/F1xZbOpocVJdruav8qoivOpfNf3?=
 =?us-ascii?Q?1vwGaX+65mPw20TJhi7s0IdDKp0XzOEZFJO9mXmLHpKZTkm+Ey/Vg5dmfj7f?=
 =?us-ascii?Q?BusE+z+S8yKckeIyOe9pJ8OcVTaP8VnVtFhWOw1GuX0iKWgMCo5SPNP5Vtxk?=
 =?us-ascii?Q?5oYY3QMKEPs6TSgB/Qc6zbX5Hf5RJqQsS3PChE2e95RVyRJc9Y/8BOrq7SmT?=
 =?us-ascii?Q?iEkuPUJLvSK5M8qu0bzTE5x0fb4UJGfkkdH33P+fqX1909gBAnEi9VK2ky8Y?=
 =?us-ascii?Q?az/0R5HN6NrlhoPWDz6+eivb/ww9meiRT+9v3LP1LS561u5zEMvlsJQjnU75?=
 =?us-ascii?Q?Tp8u4wPT0UBZrX3gqtgCTeB8318L+iX21IPWOhw6tHAC/R5WMHA4O2GGBkR7?=
 =?us-ascii?Q?lc0btLrgt8McZZVOF2oVdr79zPewb7/H80XkyDPjYtMwfkAipaHzn2C1fgeS?=
 =?us-ascii?Q?/WBDKQkDeDcRg4KKprKB3tMpMfzaFCUXdL5muZfGafK+ueMTvD38bElw9JUH?=
 =?us-ascii?Q?TE2OZyuR4WS+tKrz+kC/XsiilBPnVmaQ9FxIVksVq7Y+1PDqkft4ywSkM3Nr?=
 =?us-ascii?Q?UIcab2/iGnasRTT5AzDTh28DlghoycIXdGzpFLiBmrE/pjiqDmFXRTBsLNRl?=
 =?us-ascii?Q?QrVDWEc2UkeTMz4EPdrIy9NJuAmaoMU/EvAp6aq5s5w4LM/4P33NJH19Ohxb?=
 =?us-ascii?Q?Fki2l6MImGjMTWK4KIDfvqTkMZtTcB4n2wJ198bQdNucTC5bUi7sftkrGo6m?=
 =?us-ascii?Q?FNC+DQmf5QoYlqRsGvSCtii+dyMzxpTKxpEuQwAvO1KeGapp3S/n/CKojZz9?=
 =?us-ascii?Q?LMLX5qyBCLp1zDBoft9INo8qPN2YgaOQhYIo8aTx/wPQfBwWUEJdtijz/6PZ?=
 =?us-ascii?Q?Q4GUD2SumOFHfuwmx4KrWYzsBpSmjUrm5eoPq6nuw0Tz2EaTwdOCcj/YCJnp?=
 =?us-ascii?Q?teJ53JG2BacFfKgAHqzAo/7IVAD7fQEcHklv2DA+H1+ozBSpn0QFu8PZJ3KC?=
 =?us-ascii?Q?YH60937lfhx3vNIgIMzrFWKFbmgEN0S6iC3Rd3B4VUPefA8rx89iS7q441zr?=
 =?us-ascii?Q?GXJEEFPX+BFwi47mk+CCo7Uohrtbvvn6Z9P4vVKNAiv6HviVWF0axW7UhPva?=
 =?us-ascii?Q?yWpOAX6jj+fhwWOIfbVjIEsiRCzcKehOtbmN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ExFRpqgHRviNKhTEle1o2EUiv+wb8KDmMuzDh1T/6ZIG9v30AyoQMFue951y?=
 =?us-ascii?Q?JwSIZ6gQVOujgM2tEAEfz7GAtuFx1yTA65cPsiNxlDuiucVBiET575pjAFwh?=
 =?us-ascii?Q?oWcMN0dnJoYvTEArSVyg30IOI047m4bfMPCao4ZDfhMbQIqRBT/dJjThkdJ5?=
 =?us-ascii?Q?bVWQnui1hzwZQ2FbdAIYSgxVrvnslXfV0l41IgkKp2owLHynQJ6VAyTTJSOU?=
 =?us-ascii?Q?DmQ9SkDIq56maICnuXybJzo+dyBBWz0/mTZVXRpVLQaG314ZfbEE2rpQVUJN?=
 =?us-ascii?Q?XHU7X7YCRLxNbGkg3ME3nq+rIJETDV+i7Rk5vspuI1gvo6dS/yP/9PD7BYzS?=
 =?us-ascii?Q?BU570uTJVpg3isWjMTC4Z5eLxUAPh7Tp+sGe839Su2ck0NwCS+agbW6P6mX3?=
 =?us-ascii?Q?vcmeySQ9YD8YN/739gTsH5FVkoNetFqH7De/ddeNrOWIH7N/2FNUQ/QpnG7V?=
 =?us-ascii?Q?0lECB5y9ujS0yZf8RxcSPnG4IlGTNMAqNT0tmg8HaSnbV1Qoly5YHvz0ThZf?=
 =?us-ascii?Q?SuqDCXRySjvri7AW62ngAfQzQrwywuyHGg1QU42e9JnxMnmhIffUIIrEHCr8?=
 =?us-ascii?Q?3KqwgRElaakkFyQJcaU0y0IcT5dfiEbYzy5zNGd7mPtk4twm0AID1aracsuO?=
 =?us-ascii?Q?pXow3AuyLQQZLd8XB+Cf7dOh1PhgTeG4aHC86iSVeUP+LUhugRw9NwtKACXe?=
 =?us-ascii?Q?LgIXt5JGHcHhF84VRDt3vziMMUTlwc0mNNFLEwzjstup62a6vlvWzVxjwF8I?=
 =?us-ascii?Q?RRepCIjNTRU83fmtb2f7So/QOk5THBP2LYMEicwQ0cLhb9yKO0oEFI44rVJz?=
 =?us-ascii?Q?V85L6MbwfjnPlQvF7vgSaPcFfTpTt6E4CdEqpFK7FKtrg2AHTSfCYohalNSa?=
 =?us-ascii?Q?ZaSYvM9De7M5+SzkbA6aa1GPCpEMLO95z51nue4CwunG780HH4OLtEsyOxR1?=
 =?us-ascii?Q?gZFmId8zT87oE06RrxkTOB+XA543Bue6O0GK3KU8Nz9zuizyDyeu8CpTzVc2?=
 =?us-ascii?Q?tBQk0+WsfrKfyqDaEJqFxThSN3WjfoZGp8TpAasdBF+lp/HVZZNIBkblA6zu?=
 =?us-ascii?Q?85QSKABm3K/9V45T2bhgjNrlVPQtRzBWvCd3mvkH2YjHU81GSTwpugZ+WAfb?=
 =?us-ascii?Q?X7UOLqT3yWIW1lozW9c23j6+ZVjIIGigyooiZAJ1IyIL0wk9bSFo/KEfHMHe?=
 =?us-ascii?Q?8u9kXePY2ZnnjNYo6ACFqfPCbJE17m9c3+HvGTfYcEtCHwZwY3S6PyplS7AQ?=
 =?us-ascii?Q?CNU1mwZt6YDVxoGE6LcFkzd1Oc/YxwqnpJmYKTmkqtemmCalzzjHHZjHKsVk?=
 =?us-ascii?Q?3uGqNAOW6lQItDK0dRa4tZ5wHvhUcZZZk3pbGFQz7ZLGLxq8/6sTPcwz/l+b?=
 =?us-ascii?Q?rB8ZCh4MzOL98bIyNzWsx22/2pT6vf0/oK1APjCKbOyLhldmfKeNx7muFQ07?=
 =?us-ascii?Q?SPkhCTQKTGZj7/NpFeZSBmmHhZD9QhRn0IK8LfbKL3QaIHTFtMv9J3okS1ic?=
 =?us-ascii?Q?2jybpLX2w+nbp3iO8BaZ0abbTslOZc+rUAcSiG5M/cAHQvx8dsebtY0b5QAH?=
 =?us-ascii?Q?LPYTsa4pmACqZebSA3r5khoPBcxQigSnn4DjiZscMJT7A54/7nGUF1uDIFDT?=
 =?us-ascii?Q?QoiT9Ir6sFmP00Ph45jVuKc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3b4bf0-f301-44ec-4c06-08de20b969ec
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:45.2380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UcJxsqmu2/fqtuhNPjA8Rs01pCmbnhOnR0PhiJMuvufrnusrSLpST9GaSY/7JvFZnBmC8W3VFCUnc5RMZiFuOIwkR8Gns/Xb1u3b3yMXYji01cIPzpH3P1EfrF3FVKWP
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
 sound/soc/codecs/wm8988.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8988.c b/sound/soc/codecs/wm8988.c
index cf6d642b7bfea..9bffe7a6ccecf 100644
--- a/sound/soc/codecs/wm8988.c
+++ b/sound/soc/codecs/wm8988.c
@@ -723,6 +723,7 @@ static int wm8988_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8988_priv *wm8988 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 pwr_reg = snd_soc_component_read(component, WM8988_PWR1) & ~0x1c1;
 
 	switch (level) {
@@ -735,7 +736,7 @@ static int wm8988_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			regcache_sync(wm8988->regmap);
 
 			/* VREF, VMID=2x5k */
-- 
2.43.0

