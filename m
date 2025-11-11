Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010023.outbound.protection.outlook.com [52.101.229.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075FB17A2EA
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820537; cv=fail; b=IB8USmD4UWNfkEinxbs2Q/L21+C3VdF0+4LFY5bHEZH40U1JMKugplmxZ6lf4Nz0YCZyY0nfxNVfwB3tMktWIyYQqIhUsZXHdMMGQaJc+ZPg+s5G70qshxrazaLnGz2Lcm4lBMDoKV1iGvUrJsq+9ohjyQUeEJn6/bhvRhjHBWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820537; c=relaxed/simple;
	bh=BbmgQ/nosQKW67Xd7T2VxHa1jWwFq4T/gCjC8Hh431Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eleYAWY9658SYkiGu369Q2csk/wzKFDKoYpjcKdNBgST6iPzxvN4Nr/R4OdGxJ+XDFVE1L6zGq7hEwIl64wA2qJ6SwAEX4CaTXiCR08jegHSVS2rlvUOF+9q/K7JNoO9jdR3L+qR+qlc3mpRjcJu6DhTueyYHgSdOz0nBOleEec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AjntCA1i; arc=fail smtp.client-ip=52.101.229.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AjntCA1i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2M5dEHb4hkw5NYxkCN0ChEzBVefimYkKrtQUHo2M8+3nDQYdt60+lZPMmubu0rtSZFt1j44tKY8zZQ5h1Q+6RTucuPbEug3rpS91ZYp7CKGWCiczcYSrZ4/utQizpLamv70CGoPkemX7UgNaeYgj8E4fN+JdmlOWuNdz/s3aiEm1AGxpfUaD4WqvaOQdqEDAw94tb2ThBoV/G/6qoWwBw4RoD4HJ4WzPFundYGCSKVaw0QmT+1RGyHEXLWNxYL4m7j3fMG3le2PRwLopq1XFN1X+d3S1jMNNrQ5dxwjh7bgbrQJ2WKhj8KLv3HDe/bQVYym7SRu6pkXtfLOagtUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsK/Nz7J0RuGf4gYkPtuw1utHbv7tOz4f8a1aT0xwng=;
 b=XbKLcQxJI6JbGfAtkTE9squuvNI3YdqVvEJIOFYOD3GSGy3GQ0qi5LJf20TsecgooSWxd95S4hzR/b8qtv9/m5kZyogsjwdIIDu8aqIFWgFepKcxObbDMW9V0yJ6HUzIk7XYX0DkcLfUIBD03gPXOJIcDwBE0cMrzhVRYj/rvAiXxsQTYYtQClVP96egKPJjNM53em3dacfPdWxj/krEdbmc9/mIAV3gwyWpGneBrX5q/Syc4sb12FEcFGBRiMTq3B2iQ+lZck+exdpfNWKbSqU4CONJMTlHWs4gKZiCxk5ekHGxC2bkNgK5vEI3i494HD2gZ4ZeBncNEitS3GrqmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsK/Nz7J0RuGf4gYkPtuw1utHbv7tOz4f8a1aT0xwng=;
 b=AjntCA1iqU1a2gXtvn45G5lVIemRufo5zOShVntS6suUa6e6BuoI/HGIGYdgY4lN0fBaTazBtHPaYpEyTWLhtlSRcAq1I1AAhrifwfrpeZLIw8i0qZX7ldMvo0HLs3nUoYJYqJWSiAabCzBOkc1upCGMi1jLKYQN6vACEDJiNHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10376.jpnprd01.prod.outlook.com
 (2603:1096:400:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:12 +0000
Message-ID: <87v7jh5sgc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 061/292] ASoC: codecs: es8311: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:12 +0000
X-ClientProxiedBy: TYCPR01CA0197.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: d724ba8d-53cb-497c-048f-08de20b85bdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gpT8c37O0KP2dJR6RlP69ojOpOXckqzdKfPZawGSbg2b359pCxxj2ZkLf90Q?=
 =?us-ascii?Q?HBCyfi8loOethAEuSTIq5efxOl/PT47MJnsIA7nxB+dnOp8p5HbP8neIaRBG?=
 =?us-ascii?Q?ehRH++qSjpmujsclDUCLJ0omvuhgf1l79wUAXNtATSyl7YZzoL0XLIAqrcv9?=
 =?us-ascii?Q?H0WZr5Zezoq/jbF23eKig4Z6kdoRrm2C8bOsCMc6gIY6kOn8cN/GvwcHcohS?=
 =?us-ascii?Q?l0yhjaGl/H4yyQ/mTQ4MhYLio8tDwfvF1GZtHiexWpD42LXxYFe1/NTxhy/p?=
 =?us-ascii?Q?9iVVnkwZROK06xXwNYZIyLOUTIH6ZMpn5tzLTp9FxEv3s8sVBh/6thXN3hYI?=
 =?us-ascii?Q?jzza28a59Hjtl4kLK5S5Uhmce2N0s04S3jFZC8Gw+XEpvy2NAB5fo3x6iAqU?=
 =?us-ascii?Q?uR1QYdmSp8tWFMPYRecujMKPstixzCBkJXiJsH2KHR1bscKK8XR43t8nRLVJ?=
 =?us-ascii?Q?56y2ziwGhvXNiV4cagWbPQegIkkBh/gnRl21EkZXOklz+LtzNrxsoF4VrBPD?=
 =?us-ascii?Q?CT7TU1iFKW6IpVp/daiHp4G6xk3050cA+R3tp27ALdiCF4jbnUXX3Ayo7JG/?=
 =?us-ascii?Q?wlnpwTRxJYWrqqVdH/P5WH0MwSttBvgXHcnefVr/ri85g/AANgARaW/otIZw?=
 =?us-ascii?Q?f1Nl6xN746H4RV+Kx9ghUNHC3sAhufaeMAjrGtvg278Woxutf9Z+m+t0rLtu?=
 =?us-ascii?Q?2fxRGMnH87LI4gV04aCDd4lRZSB9Sm9zUuFVa0UGyMGucUYCut9ZdxAaKdf5?=
 =?us-ascii?Q?eh7BcdL6fk/1DKndgYh84GU25m8CmaZrDIDEF9c9HZvPwRl/7vFtVJEQ95TN?=
 =?us-ascii?Q?97QmGWRiGucvNYHB7tMU9Y0t6wsz8EonVcCfMNA/yTHt+JBHGD/GldXB78Lz?=
 =?us-ascii?Q?/LLGf8dbTYQKwOID+qtuU9jwEhxDIb1ucA3EPFSm/XMgMouejufBgBb8MUtZ?=
 =?us-ascii?Q?GEA+Z+Uwdw1s18xby6s0Tcg4SoS+7eNCeXwsI7XHzgD5BFspQWE9ln1RDt3W?=
 =?us-ascii?Q?fvMaDvS3PjwQErMhvbCwtpQRmpk4csPeaMcGkBE2XrmgqdL+At62GYr8PD0O?=
 =?us-ascii?Q?TRqAmxGVTrIGMT6VRWkPswA6nUZvjxPanH+RmVysIkQFDC2nyCn+2+9t/29s?=
 =?us-ascii?Q?y3wOj3jkx5+yAWCGrlhUU+L+8WVJsfTj1tF2IF9yun8e6oh200a726nHZU7O?=
 =?us-ascii?Q?9XgrH3DvboweReCrs40zGaA2ogri4ikKRCsXqaFk+laZO9YdmQYGyDkBKppc?=
 =?us-ascii?Q?xaewTIMefmhlJqjTook8glZkPOIhks8uZZipOuztr1DEXyuEiWpDnjXwdYmq?=
 =?us-ascii?Q?FhUgGKoxHXwe3fJ/LCMy5R+mcvUPSe3fO+v7/kDxsWQjhPmhVKoK4TIypErS?=
 =?us-ascii?Q?b2/+ZYce6Q4pMFcGiSlqwPKENCBZigWdYGtNZDxmFqe40Mb8cRJARI4nrxua?=
 =?us-ascii?Q?CAEMdh0ABqI/wd8K7oDf+6k/i3JaSHv43R0GhF34BgXEwRa+Jvx0aCuPLobM?=
 =?us-ascii?Q?M8+8vBUuswBw6KbhBQohjhyGH2WgC3o1ZXIS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SlJBq+Dfd4R/OXxwamN6vGy7MjCdKte1Bwb5m5F8tiadErPRwaMf0rQEyONl?=
 =?us-ascii?Q?UbXPoz0Dkhfn3FMbRayrciVPBJlB5u/h4ZPMmhnyPG7Jz10gUCyDdGXy3JW9?=
 =?us-ascii?Q?OwCc+G6qOvUe5OIcengG18ANHIwqJgF0dno2t5kdyIrdim5ZY+MHwyytAi0K?=
 =?us-ascii?Q?DoFRHAip3UkgPyOPDOiahL0RJUbzHJUEhId2ki3aalhLBNBHQsdLm1uS1vTv?=
 =?us-ascii?Q?Nth3K4EuzSGRUbcYGG3B6iLH1k8P5+F6wcp4ix+Je70c60o9CbubEn2/P3EA?=
 =?us-ascii?Q?YrcRi8oDLIVP8jzAMzN8gr+G0AJBg8eT0lcFP2L4Z+/M5gvHRHyJMjsL1f4U?=
 =?us-ascii?Q?loqX+23Iovi0zhqPGmdp/hV8QFuTKUAnxgvn9d7s/zXUZCShmOwjdGnx2YWh?=
 =?us-ascii?Q?nzqb4VD4M1YP11+wA1o/uGhvqr69LYQyhyyBmpCO6MGIlD60xHOyRAmAzC3Q?=
 =?us-ascii?Q?gtt/etmVcBoSbkI5sC9jL1zm/jAGW1NswQvhsRXoQGADH+fByeF4++er1P5O?=
 =?us-ascii?Q?1CaaiQwvs2bkxFDxv7LAolLcy1tzoQAwKsumek0uak5YH4MwBy6QVo5Qz6CK?=
 =?us-ascii?Q?N8EF9T2yProi9xbU3p76KOjrrZH0Y91CGTEgiTziaiMKpu+dfI67ZBo13wtn?=
 =?us-ascii?Q?obi5O9Qvc7cXzTQ1tnhbHTdEM6OnToLyfydcll2HbZmP6Hj7gv0bVGBWYjtD?=
 =?us-ascii?Q?sIY4AYPUBxNLkRaOEH80xEM9nDy234fHL4PcGeVRVshwwqZ8b24oh5+RJ+Si?=
 =?us-ascii?Q?VuLvfhW5Z8Ri6d4H66L+JfqNLkg8BETTia2qvB5sjunl0QaDrvVSeTiaVVPT?=
 =?us-ascii?Q?jWfywyfMak6FhU3Sa0fnOxflkpdV3pPGw08IqCmrXlgm+vOgnzJilQ/TT/eb?=
 =?us-ascii?Q?jRcdOjVzKUDsJ24mKtFljkT+yRMDoxg3c8mkQRsqufgd82LW8IgYPcCy5tae?=
 =?us-ascii?Q?59pJxt690KFgQiksr/aIxzIcfyaeGr++yWQ3ZmJW67/fWAbOxIuTzcpqXhX/?=
 =?us-ascii?Q?0/K0wKUWYzELNwGQKZDAr6gyf6KLUZjIRcI4VSYSNPvEcYn8OL4Fbcvi0dNZ?=
 =?us-ascii?Q?zs1/yCsVc8jRswKxeSWgjHBwb0uGcl6C7vkPXbspwBN/uNuNRn+mInHX2dro?=
 =?us-ascii?Q?Ar0iIR69Ovda18S7Z95WbWjEnjbPATSE9BXcf8ZGtHOWnGaAah1eK+2L/Vj6?=
 =?us-ascii?Q?WfvR833YQ7FtIz54cBVgHmcdWxeNwh6ksk+0MuviMmO5wk6lLTBtjLMg/ZCE?=
 =?us-ascii?Q?FFDK1FjTMEBoTYc1VxaINoUvPyN05bB5xH5jANGhnztUi3eUSpR1aVIzKAsQ?=
 =?us-ascii?Q?grR+M0vl07HAuVwty7xVKqHhTBcZSRoczCulWFw05CoPb69rZ7V+ZhHqx6y7?=
 =?us-ascii?Q?fs5eLTTUOzwe2cjRVaNuzKI5sBIS8iudygb6PsLB3OL5fpTP8H1gc5+A1TVI?=
 =?us-ascii?Q?lHcRdvT0cYesX3dlNf+K40bM6isGbQh3LjQVdvF/vmnR+ltsS3HCMdUGM1hz?=
 =?us-ascii?Q?VSOKkhh9xNEdsuy0mtcmXoD2/zqRQRA2Eg5uBCTZv2TN7FClM5IGIYZH0eG/?=
 =?us-ascii?Q?B1Z0+zeFogErWcQByVfWqqU0oCWWL7uShQTrtrNoMZUqiIKahWKchkK4GCY2?=
 =?us-ascii?Q?nFU0YHkJPZ5hZuI0hdzTeMM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d724ba8d-53cb-497c-048f-08de20b85bdd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:12.1661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /D0ZM+7wK2+0A5H1aZEPA7hCeHhS8Rr/vzmTBNQVBkXCL69IrIvIQGwgHYBuVQ8v6lsJldACVNzyVjxaMbaup3u4Ou/B82tpVGHBOoAAcKgvq8UMHIKhXh/TNXqwanqg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10376

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
 sound/soc/codecs/es8311.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8311.c b/sound/soc/codecs/es8311.c
index f557e33c26ad9..0b07a53cc792e 100644
--- a/sound/soc/codecs/es8311.c
+++ b/sound/soc/codecs/es8311.c
@@ -760,6 +760,7 @@ static int es8311_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct es8311_priv *es8311 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -767,7 +768,7 @@ static int es8311_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			int ret = clk_prepare_enable(es8311->mclk);
 			if (ret) {
 				dev_err(component->dev,
-- 
2.43.0

