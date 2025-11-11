Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FA376025
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821056; cv=fail; b=H09C8H6gbh2MGPCi24Nmfg1GYGH/isBLIqJ3XtCjMP4l/iTvRFUj4IbOWzh8l2SAAbp0JUJzcA00ZdZenEpg7LlgArLAj4eNZXA+gtkdfglBhkwIhLa1dXE1WEIihQtyUygD9TbaeNtvqCOe49GULlInJth/fzKUFOUs2rjYJXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821056; c=relaxed/simple;
	bh=zroiWgJgs5BeQ4mnWKfyF9zZW2zVKmmGAL2aW5BFlFQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Mz/AweLsw9L2NM0WBx/OoWvht4UhS8qS974NwuzL0a+Np2SEIfwPlNPQDhelFDttEhhf1nVodigqDwBy5YfIhOk1dsZUqK62fGjQydxptjy1QrgbXVZb5PySkYbzBm/J7fQtDNbaFGr3/eTXyNlLr6apuegTDrvD8xiwtl0w/ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cAeB5hgS; arc=fail smtp.client-ip=52.101.125.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cAeB5hgS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2H1CwaX5+6VfO7UirHNs6bS2rl12XpGOTQBXXHTo+LSzujvd9QpLCCTQvnZ2+zsOhapJNkFiqabh1ZNq5aGQSm3PuBbtnpf/JhYk4jV0Zlg4WohP7oRdTEwupdIfDCV+SbkpBPVd5VAy8bLGjiOeKmc5fzp8W7DzhJ3ESgx6/e27Ga7qiJCFAyv6BAdC7PxuMmLkMp5/WptQxJ9H3zGYw51R+vfDiqcrQ0PnXiUiOfqU/bNIc59w4rc9DTMavps5kpsJDMw8TwfVGfM5D6do1WsF+uDNsD9ueG+AL/y9GXxGJyVVqONyFhQ0+G57Q1J4lZr9vLz7hZ4arMl4WH6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QD3rOv6gGONayw49PxmVbbmoYLGUGNsWRBMwMwwAQCQ=;
 b=uEp+GnCm6l7o+Fv/k9toQy9Bek7wJ+CDyy9YQvUEbDr+6hovgTq8FcTT9H45QufnJCzQ/Zq2Ox9++ReFGvuBrDym/soWYL7NW+/sl6+BkgNVgssNKA6O9rwiFQAKUgyNHBdSURclL0MsLGkJgB4WDGXYCtXumIfYHdQsJvPWtqveeyGZPUHfz6K2QaM2f9gtX6Qu1ng8hGRIh+jCUO5uaML07Edr1H/a5+KYfxR+loJNcPHHKhkOyZCKu7YRqp+rbOj/gK9jZOqlKUlxqVNceUDb5G8AJbgTBtXYgR0iEkVQiTdjy0AIlLZMD2CsnTky6FZUT+v7JYOm/tGAOmNcNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD3rOv6gGONayw49PxmVbbmoYLGUGNsWRBMwMwwAQCQ=;
 b=cAeB5hgS4hA0NTsgz6VD9wI3MXePpmVg3VSJ/LoUh5yCSC4USjkbO4SXpqztNSBZvCg+eDdi6ba8KBO7O7c0T35C62EK/3euKswiFEh2Ic87uZP4SvwXvVWEb4tX9sbFUnAAKM26IZg61eNEnoG1L84Ee+wNFPe24BcMz4dxOck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:30:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:30:53 +0000
Message-ID: <87ikfhxver.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 195/292] ASoC: fsl: fsl-asoc-card: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:30:53 +0000
X-ClientProxiedBy: TYCPR01CA0109.jpnprd01.prod.outlook.com
 (2603:1096:405:4::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: e5db7fe8-0ae9-4352-b0fc-08de20b99276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+0VaPA30Fgp0BTSG0AsQaG5BBFjwBMB87SzsBB/4mkXB1v8YLfAjEhDQQi00?=
 =?us-ascii?Q?9jlpGjUoEpL7fd95SUDslFWwXAfVbV7C48Wrt6ftFHV+BPJdTvp19B6H/jWD?=
 =?us-ascii?Q?DhH/pslNag4an3yFF6LEC90HJqFDfpDh3AhAVr0mRKujbnsHDi1uVXpxuPa5?=
 =?us-ascii?Q?tBLGumGELlF4W5byvNOlvHP/c+5Xn+EMqyOsD7UKK4qWk/P+u9GCE9vC6lIO?=
 =?us-ascii?Q?0ydzbQ3st3HXyrdvBLVPuGlCRKl9LIR5SeYDl1CcRGlT1+qilqMwxScuVFI8?=
 =?us-ascii?Q?miAwHx7h8e3qplN3jb2EBIctkut2lO/FdiXCpXvf+MGD98j9F6Ai3i/5hF+x?=
 =?us-ascii?Q?gtZqbkiD79vsiHWm1n4Nx9SHOQ1aFD4J+G6UWDbJR8JI5l8VNsDHduy/8brn?=
 =?us-ascii?Q?LZpg/36WDH6foW4CeKmqSYRqemxk2/a1EE6gObEVXcmZGZJWUyyaiyU6kOAT?=
 =?us-ascii?Q?qkVe7qwhNkvA/DBkKvRkpd2LPvmhfp58phu4Uxshcj2CUZnAh2LJ9Jq73DoJ?=
 =?us-ascii?Q?1Fo7TD14JazseGtfDCMohYzTBhWsnJdY6SjDKZJPP5fcyq8H3ED+y5y1KNGR?=
 =?us-ascii?Q?Ap02vBAefRG9ehrWbJPExx9qeWaPYeXk2h6enYHEvAv8/7LyBYZ/0kc6NAl0?=
 =?us-ascii?Q?osXhpLvnANEJ+r7fsVymhUmUFyBFmtu3nuVnA/jNvvx1rIQUlx3HLHTWrlGz?=
 =?us-ascii?Q?s0ezc9jiAO7AYT/w60zzuodxR2WhzG/Js8JJANLu8/4C9DQ1/bI9KaWrfHD6?=
 =?us-ascii?Q?b4kJezIoR8mZFdFhklumerOWEd1neRvW3PnGcTPs2hxO+QeiZy9zIQ43tfV0?=
 =?us-ascii?Q?af/MTHZYniLe76RQrcmgVEc9mqlyc8iRHG6VwISrB3UgBB9ENdnlpCYRp/rn?=
 =?us-ascii?Q?JrcrzcqL5hscvy593MdXlO/rJIxLprIuufNXwbdWqBUF+D2gd5Fe2VVfoKUe?=
 =?us-ascii?Q?Wb41kFlkCIJWBgO3BTJKeO/R8H9xb/n2D7LeAIpRi/gS1nS1LK4m58QjuEoB?=
 =?us-ascii?Q?V9AYXUIgonsJQRzxSFQlPC1/R3cBk7+RTEMGntmVsWTS7LqPhHJiaenxpQNn?=
 =?us-ascii?Q?/sKoO6Dw//O73n2hXWLY6EPdiKxRYrbwHmMFgzwD1+g+hL+cih/18SPNO0Cw?=
 =?us-ascii?Q?gZqY7qQp23WLiONsLNiD9Yx8y/rW9G89sOvcM3FLvVKO5Koo/GOsrLjn3AZ2?=
 =?us-ascii?Q?MfEA+Q9gaIELfUMwVG3uDRorQJDwCtd2PkqzlAvvh4IzB0LYRy9knvPFDhvz?=
 =?us-ascii?Q?DeOGVeKm3NJ1vpVCFjnJeo3EAFQurZ+ugNfZr3o2WO/C2e/H25IDzCeWQ/Df?=
 =?us-ascii?Q?HrgfFiqoTMwEQxRfPrvoYruZh/G2SqGToHGQATU3PjqdASalmmDFw7n4JMXv?=
 =?us-ascii?Q?p4ag5aELe3hZhRUIScJbB2yPjqymZsS38DTiKZ2RG98wtxno8IFgqeT925mn?=
 =?us-ascii?Q?byiMfBgKuVD9c+NcsoGTMq2WeEih9B+fTch77AU2rwmaoDwY7VDSV5rsU/0N?=
 =?us-ascii?Q?wj+ZTkwi7eZUkWqd8/yPJGpQEfYTUpJCW6qo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bvkEKE+cAX0ItJbTBGMcOxyXM0Yan79rYo/ip36F1xSp6EbWIwzDFkHKlQPZ?=
 =?us-ascii?Q?ElOM/l+SiiQyeZspqGlnHbn4iksHwdyGloQcl2Y6K2HYxs8mpcvYvlh88yHz?=
 =?us-ascii?Q?M7utjDmXeNasuDK3D5LQzgPrf9mGk2fFFb9oeLmH8Da0zjrbPRLB87wX6Bwc?=
 =?us-ascii?Q?ww6nS/uIu9sG1CvZ6G1U4UI4prDbLb8mUiMyp0nuKzg4agsuHe9W4G11s/CG?=
 =?us-ascii?Q?KJ2hoXnm18VrLdWBvqwFSzVxdC1ndLvwo5CHwH9lrxfjESELm5gZCshErCf6?=
 =?us-ascii?Q?thKxK2tP3QB5H1XE4V/eWfyivQqoVzFxTdoyUOGronb5MCAjV88tf6mR6div?=
 =?us-ascii?Q?W8QPYESeYPqyPhraFKNJy2cKUNVWtIsjKOesbWyS+jf9NhxZbtwqr71H5+jw?=
 =?us-ascii?Q?L8YvyGPoHaWBBNYudBaTV6wf3o5v2fBGhhKeFkgRJvMDKydwa/t2n5qoLj+H?=
 =?us-ascii?Q?rA4Ukx2sYZgzkoQXXgZx8HCq8pwdZ2nmeum3f8MtFw8kL+F5LChZ+R1nzlSZ?=
 =?us-ascii?Q?HTSo7BJQatrPeNxlUT0TsckTwNBO4vi9Pf3v5sXbLkfJy+2yKPD9qNSex3lz?=
 =?us-ascii?Q?93LA5s0tCeFq0kYFk1vx2HGYrD6Pm7ntEcOJCxasfJFpAutSt40qcqsvsPFV?=
 =?us-ascii?Q?bobVoBtLrMsOG7MQsdqBe1DV/W7FvWgvqfVHmlsvAvJGz4YcnjZDNN9U9dNP?=
 =?us-ascii?Q?54v6uDBcaUS3hVpP6O7thiDkTVTvNfNXRaJK/iAaQqlGDwj4IIv0WTB+D7c9?=
 =?us-ascii?Q?jpWJRPVuwwATKKU7VjOa1197j2/3UXur+/Q55CSwDIXE6LVKeRhtgeN16oUf?=
 =?us-ascii?Q?hefAJbCfjR+RPim9EucK8lWadGB3NQrAGd9XDgp5ZBmHZHcOeqaNrp6God+C?=
 =?us-ascii?Q?z8IuLzo+wBjKh/aCPdOGGnJBsS04KMFtNDk3bvX5m/SLZXLvOo0aSG2LFPWj?=
 =?us-ascii?Q?gIAVnviGYDrOVnrwB77qZLhOsOKR7VDR2WuaYoEn0Tn92i5dJ056ecLcGbQL?=
 =?us-ascii?Q?/Y6NqxosMnXfueBE/Heu2P5i7kun75ddLPtxOwdTBfn8pKqgQuDhq/yPWKiD?=
 =?us-ascii?Q?x3usXGRIJC+80B2YOms9vW4tjUA8D7gGS3cY0WCzmQpevcVfyiWmZoIW5+6B?=
 =?us-ascii?Q?Rvt2QVRQSeufWOdyX+dWqveTwz1zUBom+KaLb4Rll0uCBCtvSqjXoE5gJLIH?=
 =?us-ascii?Q?utOv+Pp6mU+xNmrysyaUag4pqPyVhfu2Ulp0uVdp2osolrsamK2Y68QJbQxk?=
 =?us-ascii?Q?1draLpZR2zHCONBzsHbh80WnJbLJ5UbMKu9pi01SlcjzGs0tp68sAiHRpy9R?=
 =?us-ascii?Q?vIsltJcQmMEXMchET2bcP590RFHsanOL5LqoKbIsUP4VTUNkfH36NqsV35w5?=
 =?us-ascii?Q?/+To1KjwngK7Be6iTW+HICUEQIhtIbYYc04jpL+d70WS3cK58yd3M7xVh+Cx?=
 =?us-ascii?Q?HJx+wLen9lySVtptqh/B+ZJrXRxxfK7bauR0gKqpTZ3BH/zuYi7jmCE2xyzK?=
 =?us-ascii?Q?+lJOOybIq0PHbmmYVghxfbHGp2e/6gZOgxOp1z6wollbVM0btFcTnufHFfNU?=
 =?us-ascii?Q?d479dOFDMEjb0pFdekyHKLhvisK00nT51sbZZUSDWc7MVpOMPKRYwibmLk1k?=
 =?us-ascii?Q?edgHfSoPHSL6v2AF2E2rcDc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5db7fe8-0ae9-4352-b0fc-08de20b99276
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:30:53.2566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/d6tbvThdQ+SPgg4gy18EwoWRPP3V7rpEvBmzk0jarjYYNACz3D/K/P6BtV8i3bzOO/ync5GRjgRuSfYWsIaM3AfjMDwYAlMcPxFyJAbo24RbifS3bCBStjQTkIttDV
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
 sound/soc/fsl/fsl-asoc-card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 71113886e494b..2c7eb0baa0f36 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -536,7 +536,7 @@ static int hp_jack_event(struct notifier_block *nb, unsigned long event,
 			 void *data)
 {
 	struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
-	struct snd_soc_dapm_context *dapm = &jack->card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(jack->card);
 
 	if (event & SND_JACK_HEADPHONE)
 		/* Disable speaker if headphone is plugged in */
@@ -553,7 +553,7 @@ static int mic_jack_event(struct notifier_block *nb, unsigned long event,
 			  void *data)
 {
 	struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
-	struct snd_soc_dapm_context *dapm = &jack->card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(jack->card);
 
 	if (event & SND_JACK_MICROPHONE)
 		/* Disable dmic if microphone is plugged in */
-- 
2.43.0

