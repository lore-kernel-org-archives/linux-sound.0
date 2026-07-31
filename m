Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011000.outbound.protection.outlook.com [52.101.125.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA66F3403E4
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 02:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785466007; cv=fail; b=dZ+6QgZVHBujGkgLg9rKHu/OOn6X13fZxfSHN3zPSZocsVOGu29UgzrvF3MheBAlSuqc7+AMGQMA8yvC9U03Mgd5m4BcKQKiICffAkR3R/QphLHF7T40y6QZeRQk8ZurOkGMsqe4mnXQoDAfdrLwL0oOru1MjAEhlxwn/L89OHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785466007; c=relaxed/simple;
	bh=wE45bghsNsYdLJ41BEuF7Mh+EPk5ToUb4U9EVOl6E5Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=p996bORjGdBgaRuqTYpHbZdEioNg7qWY7zIjrZEFDLIv2P4C1A7b1WbIYJdzCLMzAkSJonOUgG2zcIzXtYEZPC2A4AacxzlUZm74jvtxLdZnp/vgc90MXzcLOc1R0V7G5S6vllvllBn+xpKVTjIVPspLCk+rfqOCDygpxo4nNwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CDZTPjxc; arc=fail smtp.client-ip=52.101.125.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CDZTPjxc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgCZh9ttUjmC8RqMMWv0ZrQSmskRC6PNSiCdhL68z/PHa1tIVNYUt7sI5D6UiCoW14A0sJ0UbONZEx8hBx2Sk5DMRNwCWIBtS1zadLShCcjHDRSaUNguSf7hpJBtkPdHR4cU2NjHAo4yXxgu8+ctv3eA7d2fhaDWZ+8HhbqLF4x7aIN5WJba8JMfg4BvxEQBVpf7JHRLLzoznjlHVmnmIbnwQieBnrxI/b4nagQs/dtn54w9FqrHiDX0BkQ+faeSuWtWK2E64MKZTnoJQ1Rh+yr+zzoUIOpL3g30AmXd9UiyZt8cyutEfz7Y2Jfce2uAuGcL4uCwF2zJ7squB1BtZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQwN+20ubwoYlaFzKcibC3FpC7r5IiGGHDKVE9Mk3sU=;
 b=CpqSHE4G/L0CgXJvydEoPea1PaLllq3MgXAkFVpVIXDNbn1cCDQV7LPt0A+RdEdX4eqPU6po2a5qWNLw+cFcnomgz0hVUFSfVlK039jJi+QBDwWpKAP1jSpPKitcgI3uNH7c5B9jXETH2VGL/bRmXIEF7AFuUcTbpChl6UkM1W/0rtwGCbeYdyeTukP8x2yzLoE4g94lnwoFFvkAFpCVK8dV//FD8JitXVHcEmiBOQBS1ROtLuSN2YRfDYtiZobJXgaTOZtcq5mTu94kyVtT1GlJu5BuODaNmfH39ERY2wJ1LpUhB9JnB8EN2ZKo1p92QrbhzT8Oc3+xj4UfG0QtIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQwN+20ubwoYlaFzKcibC3FpC7r5IiGGHDKVE9Mk3sU=;
 b=CDZTPjxcYBwZjICMQSndH5z1rA7ocSjWcD0XGtdLpyJSc2z9JOGgOoGleSzXYEv13N5uYI9Yb6r0dEIJF4Yrfvj41TjmCE0bovf7o9CmilZLd3SSjjHdUpS47hpMYcvV+inE4AqA+2ktjYwXOExe3aIvJpnsBioLczA1+t5Szl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB6816.jpnprd01.prod.outlook.com (2603:1096:604:13b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 02:46:40 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 02:46:40 +0000
Message-ID: <87h5lfswog.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/4] ASoC: renesas: enable COMPILE_TEST for PCM SH7760
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com>
References: <87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 31 Jul 2026 02:46:39 +0000
X-ClientProxiedBy: TYCPR01CA0141.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e38fedd-8415-4ace-53d4-08deeeadf296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|10067099003|11063799006|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	tzZ9CTe23k6JpNB/i5tdilrrgNdyxq4tOyEVOitJiDEh1RCFOVO+LgJ5K9ge4T2MCUhryOzIY1+myUtsskvwMY4Q6t/rdoY/EE8O5o86KfceJoz6XBMNM048dYBNsu7vGGZP99QbsCDpxqVMV+AaHsVu/lvAgXBAN8XeU44/V+BI7iDqdE2AbeH0kzEeSdAs0nEa4pmI2ibKlzkpuOW4MchkPrP962Bqpm1tk7WuI2fzurJGW3EbdLfrdNZ4GPgbqAbrYe2IBhqlKd7KnUCFiTD2o8O8X5Y2sa+tjsyJIxWV9w085WhwWXn2o7XHo6b0Nl8w25snzJK507NcKHbftvPSBkOWExNu3GJTsuEL9DfUV0lTjsNvys3dLdK5bZO23tTJiFstTfQPleuVxXoM9EomhmvH1kzXjVd0TYz4/zDBptyX//Hvg1TZVKRViklPg6RZG+PDQQP74aPAj5e/sMESpPG29RH5OzFZ9w12ARVoJLQZIFftpw+Y3eyELH0rVFsUC1WCdFV9rZSRy2hZ2DGXncvroSF86KFj7jo9RhKoXi1DdCz1zW0qxKWgGKgY8MQXwkYbxmub5Tpq9GpwREuc3SP8MJ+KxIdxkubQoloaf4g7wLIfD2Ds8wQQGvdxyh17CSRq80AqsUsoydlGdNmHFqqStMkQvslHnVn7gC79ERSlqhUPxP30TR+dGAzze3ykBFOEUJAVt1pyAd44d4ISNno0oNap9Hj8L6BZ9o4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rbeTjWHoZXeACfzbd+S493IchQBTy1z0AndpEHW9t5YjiLXQkHTDabfq6rRj?=
 =?us-ascii?Q?jKbJp0d5AQpriGlSJGiphP5GA0i3VpKV7pXKP48ZzCJ7Q9iOUd9uBm0Qi48y?=
 =?us-ascii?Q?CfnkHZ/Lw2PIcqgOkE8q5ZZgAf/1RswFI31UeavIfpf4ngVMtOCHQSiZQ7HF?=
 =?us-ascii?Q?5oX88fT9Gho0isuQL1cyYi7NKilXz/KZz9nf7V1wBvQbuxGEDQ0YgM9kfR5J?=
 =?us-ascii?Q?B+4Vk9P1sP/8P5/8Hus+Wj1HEtuOubrXrgDjMQfMca5JKFbgKl9uqHmj4QMS?=
 =?us-ascii?Q?wzIKIIIB6D0ShrJkBDTPSw/0CxVCRi/XDdGJNRloFdSv+QBPtUTFY3QuNnlR?=
 =?us-ascii?Q?JRAznlWAN9cDCOA8y+DZMhCM02u7M5cWq29f6v0s/x3H9+zGAz7HSAOR3LfE?=
 =?us-ascii?Q?5+LYuI2e8msIhH3lXNGeYjdJATzr2EL+uVcEi0eiTkLXpUQ4tA5EMUZreu2s?=
 =?us-ascii?Q?NHY1szX1jfgoj1+xEirdAUOB8IMxIHaGPdrP6fNMYUjaI8vDy3gaCODPt0jY?=
 =?us-ascii?Q?qbGhkZNZGFhFVxWcxEuyA1vFJr1pdIsN3gteS4aev7AeAkJNmk9xXgzQtG5y?=
 =?us-ascii?Q?5HxsdZSVHpW666Mb+c/ke7IjKhTwcwiOAmIcRhAQES5PrrRRQ9ACWOPojfcP?=
 =?us-ascii?Q?tlfPqWlpnz3BfgApUA+LEWbDmiME8uytpu4euTFDcUBVkwXe2fozgwR7yrta?=
 =?us-ascii?Q?iV5iDfHDHffepjtiZXbGhxvnCQ/0hrHRA1aqcoD16BB7bNbyx4yFC1dLWfPl?=
 =?us-ascii?Q?xsg11tVvoEZW6xmeZuPZ7ybEjDxOtXLPepdiWGj2N/n8UqtxzcrEryXbxtyy?=
 =?us-ascii?Q?C3Jgt1FhMxxa7D+iWek3+BPcioxUDm1wc0LyumLNZSHSIqg/SwLyabFqlBUA?=
 =?us-ascii?Q?5mfcXM2hGldti1m/ppildDwnTd9HeGdSdRjuFZrmv/V1FUHjN5OdLtsQjmG1?=
 =?us-ascii?Q?mZeIkwIuHxCGgH7YJP1vbZYtLi8GRuy0tOGs087pwpNsu2swc4dv7gBpQT8Y?=
 =?us-ascii?Q?GsrAfyDJYV93KPGuDuF85zupuhJ5bceZuOcmwuj0/H5h2bm49gSDXzgl6KyO?=
 =?us-ascii?Q?yhNgZg/I9gMVuPuiLF7UJK4PJRijghPItPCKCo4Z8FrE3uNqfLTrILZOlm2x?=
 =?us-ascii?Q?yxW/YExHwPgJ2vvu35titYK6ovxLh8nBCMyXvVD6IS5EZxdvxPFFLrPuZjQl?=
 =?us-ascii?Q?3l/WCuiyeJY8VNH1EDwTwo3JMSWeLWgmtXabzkh3N1Z9dfXEgwsWf3FXjZ3Y?=
 =?us-ascii?Q?ZUCuIaQ0+HHCT9msLe1RxBFYZ8X55lVQ8IXcukWerb4HdpJSSfltxUm4x19h?=
 =?us-ascii?Q?n2vgnchnfurRi63vK6iFf2HZRHt5AzITr4rkJj/4ZW62FzLGB3JKecd/127M?=
 =?us-ascii?Q?4+va728AtfQvuHPYYjTU8Pa1Uq0l3DgaIvJMbOdVspZslX63SV0n/WNjL1bd?=
 =?us-ascii?Q?XOkohsQlHOPOsCyo9UKZuqwXNxjU2x2+i+r5c1DJJOnsVXv+jiTB59saNDOq?=
 =?us-ascii?Q?UznfbD1Wqk8v8Ls+iAXJv5kacLSlRDaLlTjFOHI30WnrkiiMMsC32HPoBi41?=
 =?us-ascii?Q?7LacDmyDPTiSNlnuTzoRTDrD0i/MQpn+yp0bK4+rU2yLjadxypiF9H18NZhK?=
 =?us-ascii?Q?K4MeAG2rniuTmc6zdRz9P/SAeZpj/A98UPuegt5XTtNGRcApHaRQgzGqCSQC?=
 =?us-ascii?Q?/YX7QXdQRJKhAdSUqzuwbz0w8mAzB/zmIn3sva28wQf1rpdX/0msnOqbv7Tb?=
 =?us-ascii?Q?/0P5QwxBBDow4JsRQcHcFB/RgJjv6gI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e38fedd-8415-4ace-53d4-08deeeadf296
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 02:46:40.0953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Odd13sVAzt9NooawtT/xn5ivd12CBQFDq+s/Xr2fdXEovqzyO/PNJIJv6Jh279FR5DYF58c3y2ryL3uaByu5yhFZWDK7TVs3WlxvIRBoXpicPC/z3guBuHhfpSiqmqro
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6816

PCM SH7760 is not compiled with COMPILE_TEST, and there is no defconfig
which selects it. So it is easy to be overlooked for compile test and/or
ASoC updating.

Let's enable COMPILE_TEST when it was for SuperH / SH-Mobile

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/Kconfig b/sound/soc/renesas/Kconfig
index 34f12a34d514c..b30de242e5dd8 100644
--- a/sound/soc/renesas/Kconfig
+++ b/sound/soc/renesas/Kconfig
@@ -4,7 +4,8 @@ menu "Renesas"
 
 config SND_SOC_PCM_SH7760
 	tristate "SoC Audio support for Renesas SH7760"
-	depends on CPU_SUBTYPE_SH7760 && SH_DMABRG
+	depends on SUPERH || ARCH_RENESAS
+	depends on (CPU_SUBTYPE_SH7760 && SH_DMABRG) || COMPILE_TEST
 	help
 	  Enable this option for SH7760 AC97/I2S audio support.
 
-- 
2.53.0

