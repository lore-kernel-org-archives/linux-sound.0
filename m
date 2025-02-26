Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9018C33B
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533547; cv=fail; b=OTnLAbjXT+mpjG0rB4x51NsQFoTPADLM2w9IevLkcNHWAXI5R1XjD1U7TVpcE+kVXI6kGMbGCD9rn+O9vOc2Ss7YhtRAtBRxq0T/f2cJ9Jee/sKNCZHTppid1JELMVAoKKMLhWwtzisE+CLOjn6qdnJON+08VhTxz7VNmU5Acf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533547; c=relaxed/simple;
	bh=aAVyjkdFm64Ic8MqrKfps7haqW9+YkogJ+Wmth8wp2Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IcMzCGTQnJQkYW/ipaaaZPcgCTOtQMApjDFP7ujeI4SocS/zieTtcqqqrOzW/z0k5PNpLenQMrBxg+6hWH4cnJTjzJjSjeoWLDGHoMSvWSKYKdEnRTfSpUVSf3MuFf3mnWHBTL50wI/3vJDuo4ftQA88TyMltQYqoU1EDvrLWoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cEDZ48wl; arc=fail smtp.client-ip=52.101.125.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cEDZ48wl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4PnFVHSYZOUBgB8Mrog85qklekBbzIQN/fqDSMAChg/u1iecsk2fR5wO6MboSLIfERcC1vQdkSF9bFmQMApEN66V09qlEqlkDNRk40pblLyI7JJNbaNgX6IOMaU13Eupd+ayZvAXrHlaqAhPIqwz1lwUX2d9knwVj/+YVL5pgwzNQ71jNqiS7WDQfkbWnMI/b63cQA3owul+HY+e+Ev+hGBY/fMnGGCNF5Muk2xgiboMI9g9xkXbwHX84oyCqQXe1pddIM601bVWoO2srkZupXII/O1LWC6tVqwWHlGyR9pjLwT8qqd0jgOIM4fXh49PaTz6tk1RCLRa7KaT2xoYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbKEsOcUt5NQw4dILlNTFGhNp8IZxs2KrOCNaKRxgsk=;
 b=SIiR9xycBrURYZlbIvlrm15vTzAHaFvIiWvC/Xs68nVuvrZZAuvOjZL23XTpokd17f/RLUwiA7sr/4Cp9Rh3ut1VTGjQU7qX7OIqL0ENUKtq2F4/VxhZbbDjPoMYSfnb0RKV71gDeOOurf0LMYaUCCAmPK2V1fsaq5GoS/bPhG3LewJG398wLm+l2RpDDq2dl8UmBxvET2FC/wrCKEouN376dSyLYKWrXcYO5285wX9yxOXRaxN7w3SvYaLonT350qUUZlp/4D1XRkDQk7hC8l/+Zo5LDDTgebxKX+tZbJbFlEA+liv+4yChzeHIrhOSmlnEVuqcAl1cNsWrJABUxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbKEsOcUt5NQw4dILlNTFGhNp8IZxs2KrOCNaKRxgsk=;
 b=cEDZ48wl6iI242y43vgVOqyS6P+UkgqPoidHkY2HyMu8mWuALT44qpWgaDSeOq7J/3jasHsWM2SYz+PGZ30Uo7cE19rofu9xsu+dK4GBbE7RkuI2WOsVW08PhQOEz7BLmjb1Oba4EThb9aLkZkDQZ6atu9k4+swpdM+fosJ6Qfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:24 +0000
Message-ID: <87zfi9ebiw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 036/157] ASoC: codec: da9055: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:24 +0000
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2ca34b-8e49-4b55-4c78-08dd56056beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wP2a7vAA+TJRyp6JRc2VrrYEPr51EcHh1efMwKQ6NEstzpOPnhtSl+lJ/ucP?=
 =?us-ascii?Q?e+iIvvrUmnRHzQRqhTNvAu/vQU7aX+66AQdP+XSPnjuHPUHq6yvNTyG5uGEz?=
 =?us-ascii?Q?aKawByJmT8w/ixVmxZ1iuhYBZEKarcsBQ88aAOgkE1g7r8OYzXhroiy6TM4j?=
 =?us-ascii?Q?Rgo2uYNHIHlQ55IExad5QoLjUfnb5K3cLsq+LhgcSinCF8KU7qP4WPLROTTx?=
 =?us-ascii?Q?HNRFe8hUmWGUhxnL71mpf0b0P5bhz2Bgi7N3gEqUK3ahp18AEPUvC77GzMMb?=
 =?us-ascii?Q?ioiRr5jJv0c8i4AwaO5orufmCQlQnLCpuGD/Om8EPzDweCo3+WeJ+cPDeHqS?=
 =?us-ascii?Q?x1rFtp3ZrZyJAlViXeeT7JdmVtoh1txTW2RzdZkKBYabsQ5uds0jpHIK4Wel?=
 =?us-ascii?Q?jr4bLwHXlgmgtZ24RN4nGjlOHul0bjjcJKT11clc73u/3Zx3tsO8hENKSjui?=
 =?us-ascii?Q?WspDQansDpr2rHkw7/L7fqHQt7atsfMErawZ/hm5qBk//yAv3k2z25TrfSKf?=
 =?us-ascii?Q?nRbCdXeSpGwYp2X8YdfTMAVUTpEqusn0yWlYgYvO/VkSvhyGyl2KiEAXfpRO?=
 =?us-ascii?Q?P4Q02avfX1dAyYTKzV2bGcTZ6ffdYhUmxwNcaWr6TG3GI8QAp3heHIbY3ELo?=
 =?us-ascii?Q?B9ndJxDHdaZ7rI8Xx1IZOnLIQacSQMOogoJnqVO2PwvcW2w0SpYVwe303NYe?=
 =?us-ascii?Q?N4QbzLi+E3ZweZ/pThehTGl1Z9LwvaazrxsNxYPix5k12KhsTA3/vVRSo12j?=
 =?us-ascii?Q?AQN5UKTDtsjytYD/vWu4SEf1Bwl1MsTEhCsH6ZFSYZtIJqkE7Ti6zD77eEfo?=
 =?us-ascii?Q?IQHSTFNB+1ljgjkH16Vnlyb7mlv+ViEx9vmJk6Z0vIR6SVZ4jjMKL4j5pltG?=
 =?us-ascii?Q?4QdpkG4ytei4bI/gU0K6HcjCZPLMD0rgQEQYG18/LVJBkHF7GFmDL1tKLELQ?=
 =?us-ascii?Q?Pw7s3sZB3Fi/Zj1NYF3wFATXaTbBM/04ynXCxS8F5sOMQfddX777hH6oGMG1?=
 =?us-ascii?Q?qpk9GWbSHmHrKB5Kf7TZz+/RFoXRX97YOf92Rtr1n4gFyswI79r4/EnWrJKs?=
 =?us-ascii?Q?/Uk6DorgDqwyyuhvJAkdDxbjvp3hITVOE3lAwkSU3z7Cu2koAumYpUg5xsK5?=
 =?us-ascii?Q?CuvPq4/NAFAGCsKz6rc/sV37zpcOtqrCZJCRKgT0a2wpF2Pwye2cGs/1VdnB?=
 =?us-ascii?Q?GiPqedQDl3cKd6AlQ+VA/hZ9Ll2V0PHI70CnIRon27TSaIp6V+RAp6jOgGKH?=
 =?us-ascii?Q?lSsnfkpUgyPIhngvnTxEKkGngwzLDii7umqHb7fW9ZR8U00uQWo0BRBt89R1?=
 =?us-ascii?Q?8pPOKQ81F1Z8yfWwxxHV9cPG6NzlPt73tTA6FAw58Mv8DtEa+U0bvEvGvW9m?=
 =?us-ascii?Q?6SPneG9AnEHwx06YJuUjwLfiEhE9oG/emXIAjyq7/e0aOL8IQVSBEjJLYUls?=
 =?us-ascii?Q?7LwtyDmn6BjHw59NiRXz5xiKYASZnt7J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d8/fF3gbwtJHa2G7hQXwIYAvMzQ4RnHIu0zuBX1skg396B1Hf8R5bdFFPkyg?=
 =?us-ascii?Q?uxanVqFpLZfXEE5rCG1mu6ZZ/mD16+J1Axy6g3KCvMF5V6N48V4HUVSMJlNe?=
 =?us-ascii?Q?q8F29wR4tAm+GhNe1+Wi+CEo7aD8HuRC3ojbCNNYL/RVPqwpwd+GnfFSEh/k?=
 =?us-ascii?Q?oarKzdKvRKsjD5LtxtoT1AqAER2ROS/QYTx+ghygPjzG9JlRukOTzdL373Ln?=
 =?us-ascii?Q?VfcEgvPaHULh9SP6ClqWb4BWhysXfjlZndT4gOqrctSx23+wNzMPOnKec/5Z?=
 =?us-ascii?Q?T8IFj5Z3y0plMtUONfnrLZl9Xlh1qcYokIFR+CtSNDgKP53h7pbb5n9DjWB9?=
 =?us-ascii?Q?nJphqeTJCvWw2zUY8oWILEwMq+eiGvV/CP42AQ9GKQpO0aJ2x0Ry6vZLQQA9?=
 =?us-ascii?Q?SXoq8Vrk0wMHkIrfdp7JMM+QgHaVwlkjZvOGqU5ZKdexo+986hkngZaEHg4k?=
 =?us-ascii?Q?NU7MkXNTFF4M7Yc3GXXn2umFielVxDZ1z9ctKptaUTquVXuJVPLXnNgNegfI?=
 =?us-ascii?Q?O4M0OR8af3JkcBgxEJvpYw1+GBhLrpdxMIR2Exe9f8VpZc4GK2QSgUSRl5nk?=
 =?us-ascii?Q?2kpujblgGvJ5ud84GKTQ0FXVmcixm9pGayYYEdiAy/3zBvddCfJhQg74+rSW?=
 =?us-ascii?Q?TbwGBmN5mNrbZvXUl7uk0akhL7OvendGB8A1uBR/X0ScK8yh8DrdZzrUqIRn?=
 =?us-ascii?Q?D7mutqW5gdGXGzVL3XoxrD+H2SxaHRIlCXF34BMVH6zFRg67N4l4p24J7IVN?=
 =?us-ascii?Q?W+z2QstnJyqUQKZdUjL83C2odTVWTVK1yo/yfBexTWK4gmoUflTdbYJPqrtW?=
 =?us-ascii?Q?5NnUCTxsqsUkJeKK67mSgK454V9w6GPE4w89Z0zGdTdYZg3cFWY7YA++rHuK?=
 =?us-ascii?Q?U9T3Io/Ygn6fgRLYqj0OoK9XPpxbVPHjHLKaF6fF4FJV02eU8SeEiBa3QKB/?=
 =?us-ascii?Q?00ZnlvguyA8tPAE50A9+wYbmMlFaYocWmd2goIRHNCH0oMSjRIe+JWV/9LwI?=
 =?us-ascii?Q?wyKNfftb4jCComWLx8iMzqPrtlJ6pRfB1noWviIR+6ne6ERqAiaItjW/rLzP?=
 =?us-ascii?Q?WAK5xtQ0YH5pzXrOR/0obwRwwfaL4Z+Rs5UpYv6bGhIATgGQRzrHWtrt70lx?=
 =?us-ascii?Q?QKaFbBEcwrJ+TjzKhY6yxOTWZ83jEaltFH3A+a/uqFWm4U6+th5AwsEMI4Z7?=
 =?us-ascii?Q?KuZ0QJXjQCAXzpR9EXnKUcvnXc7E9orIU/638+YxwhlZcefS/NLeJFJ8HGA/?=
 =?us-ascii?Q?jDojqOW6RDWrOHmB/GXwQYSN/QIuvOdgm+WeXMoXUoiGcsVhk/i5hydRXADi?=
 =?us-ascii?Q?fR81FsUGMtdAUNrE9NBwjwsOQl3cXAAcBXJADjZli6mcbT/bfa5LCmhVVlBR?=
 =?us-ascii?Q?+krvxzaYHGKZ9e+HOlrHPmkFQ/BYY7qhqisqxBKqEvLyXGV5/FwkeMjkctDN?=
 =?us-ascii?Q?EczP4AXgs8VtZD6G2aSAfGnj1Busqilf9eITR9cEEN2EwX011PytXhueZItK?=
 =?us-ascii?Q?uWadEIm6Yvnj/hea7jnFYSm6k8G0Zmcao8/BCN37yhQW8eGCZ5yINF2pJraF?=
 =?us-ascii?Q?byoBptwuF4BTAvIGB/aqwMQYkth0FoPClJPz6DLLc9lE8wj3TmAWqG2LzLCP?=
 =?us-ascii?Q?vgkTHhWOZh5aXCS03mkIpOU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2ca34b-8e49-4b55-4c78-08dd56056beb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:24.2893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQE/1AeZNHM3gRkj1w3TqM38Cyy42xketZDkOuNVwt6dm3rfF1BnVxtpC2xcEyQOHa+Ih1cObtYbAdij1Mpf1bFcaRs94ug7wrKurhuiHhf7KrZ85+my7e0e4MX0ksD4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/da9055.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da9055.c b/sound/soc/codecs/da9055.c
index 8bb8fef2a1d1..eb795abe9acd 100644
--- a/sound/soc/codecs/da9055.c
+++ b/sound/soc/codecs/da9055.c
@@ -1160,12 +1160,12 @@ static int da9055_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	u8 aif_clk_mode, aif_ctrl, mode;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		/* DA9055 in I2S Master Mode */
 		mode = 1;
 		aif_clk_mode = DA9055_AIF_CLK_EN_MASTER_MODE;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		/* DA9055 in I2S Slave Mode */
 		mode = 0;
 		aif_clk_mode = DA9055_AIF_CLK_EN_SLAVE_MODE;
-- 
2.43.0

