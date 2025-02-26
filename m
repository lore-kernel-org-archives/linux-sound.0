Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C529B18DB36
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533417; cv=fail; b=QKsOMo6hDX+21FRQz7lHc3La3+lnvqs4bbFw7FiYgy9u6SL4a4IO8V//yRJUrSk3de9Z2RwFRh/J9H8lwN5yW4U8PRhuyPOYUgJoHSqDHiuy1bXHjTwmG1gwGfNHJA2H65ND62webVLlTjuZ7FGlxjrg4xUGQQg2n2iiv8MaG/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533417; c=relaxed/simple;
	bh=DNHa1GBfgV6N3zDur0L4K0ZVvx4pquzevu4Yqqxmmcg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oy7rOrCB2g/9TB1kMrxQTG59Ojn0iW7bHozGZgq1q7VPv8FPn4F2Gk/57TAukWL/u1bu1zJseeQoXuCUAokuMRzgDccpSKDIE9gRqSdVojhzOnuKGdy1/KOjNQrRxYb0XZR7MfkrBLDxOA3nNaPTCLVyw2Mw1FMW73hLaFrjZT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=McYgoojc; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="McYgoojc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0vxNfyiD7RmNZVthZO0hLxITPXK9d1fop+/My8EwJzu5PwNCWX2+MDrILGpaxAp7gkM3o4NfHTeQVYWZFYHcZ8YxYvzr1wi3KG7ltUv1TuCkKGPpwogvMX8NEn8sy6IVLDi84AVm3w5bSNU4FOSE0UWH6a1tCuTNsUpfv50tQTj/wEwnPk+tZKtDQBxnm2Z3jXHwllApTDNcDgItBO7S8N8FhzsINlqWBdK2pAgqCZl50jTSkr/hyX6VCxcxHxtY9DPd0/8iB1l/IlU8Jywp2POHFVWr3lsN5tbmUWcIK5S5gsjpnMXO9OQ6A8jwSaWxIjdjVFa4BBVCY9AXK8CTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvtDK2+GBdm1GTJKtvspMSbV0XolBzjWlABNT4LWwR8=;
 b=IDpHdiDFtKGf1S8sD945fSgPBlPNH0l3/mZdxs9ngoT0RI/YAYqhZtqVfKJ5lPkh0vScbInWdZMsKtqKykCien17iWlHJvru6ffJgXfHIpK8SAy9fm0tYLF57bSG/RBPkC+O7Rj2JQPqXY9+hMRRXnoZVjhL12h5wbCmyT6NtGfOhmpFip3aomOWqIpHjO4lOFqzE+OhaaQlwadYBZ8INSfPa290IBXKsKMnzUT2++R4pBxcPLbhjMhdfqpvB1adOzPTpq48BVCLs5x/K6LmuTrCLXXYhyl1yUd0pT7wUC1FKCJp2CY1WAQCvEwk7fzPtIT8gCmin0wovq6KFTxsZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvtDK2+GBdm1GTJKtvspMSbV0XolBzjWlABNT4LWwR8=;
 b=McYgoojct+IO3ddxCbT9RcMxwcSsGaU/i2ZpAvYqk1f8dMFBY4TWkYieQGx2//u8lmDeoB6DSox09bMgSIUKocRvXPLabAwejjKXhigM2rrUT1EW9JXy4fHK3Csy6U/2eks0Thc8X9viYbBXUUMifaSGBzRr0kiUyzh6qSCI6Kc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB10735.jpnprd01.prod.outlook.com
 (2603:1096:400:298::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:30:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:30:13 +0000
Message-ID: <877c5dh4re.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 006/157] ASoC: ti: davinci-evm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:30:13 +0000
X-ClientProxiedBy: TY1PR01CA0203.jpnprd01.prod.outlook.com (2603:1096:403::33)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB10735:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c00ec71-fa28-473c-a71e-08dd56051dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rAYKLb2r8L26AKMs3dmhMfEMU9dyDWrzJgI1Ybni933Nh6ZbOg1qg7W83/SY?=
 =?us-ascii?Q?p4fvj52Uc9nW+t8DPd0V4ySFQfiW3Js7W1Bhz0icvhWE7nFPJF/cZ6sGuGGl?=
 =?us-ascii?Q?x5hR7yxuAaoKxEhmIz1u9WJgsPIjYdJae7CqJpPYV9S8w4rFyw276zxj2LgY?=
 =?us-ascii?Q?rfLFfoubm8SIDUOsj5+JYF8YBcEZIe82cNYDX9KMVD9w+Ys3sTr2Grtlfk5V?=
 =?us-ascii?Q?Bso7Pv2MWQqfL3/bZ1ngu0PID+3vul1fk3DwiOQKCu06T4Ap9mgTR0QYfQ/R?=
 =?us-ascii?Q?7MpgqWCPi09DZHK24zCj4KhYCA6AGxiAPtOmVPyeEkPhLEmRN35Sld60TdMS?=
 =?us-ascii?Q?waUaB9F9BXiOEZwbKX244rQv6eOe85YhRM4AAG2P1qoyoHou4iXe+aVoN9Jw?=
 =?us-ascii?Q?V68mkYJgHJ8VzrygAwcaRfC0R3SuufdprJJE41ZQkZ1s0n/rZY+aCP+bjIYL?=
 =?us-ascii?Q?vASDqSYOXqxvtwdOMYVh6k9iFQQT9c1Lb8352rbao8CVgH8nYVgJ6vhT7Gxj?=
 =?us-ascii?Q?p4OI0LysKw31nzCNdqiDeF3j+zfP6iLzJaO1dvF3UCjXc932PNWZtX9yDerO?=
 =?us-ascii?Q?NfDm1LoNYOmhfamDRhMad/qWtaU3/OWKn5YrmDbCTzXBqJ2lmgEByqgcN/ID?=
 =?us-ascii?Q?mbEe0CPj/oANKMNmKvw1eLqpzCWBoqov9t26PHPdzb4koZNTShLSa4UretfD?=
 =?us-ascii?Q?3Y3alpiDRFG/vN3VKtrmBz/uOIivDumt2dh/z0JCZDaiVdCV8N0i7zzX+YSi?=
 =?us-ascii?Q?68jT6140ugGq+vFMb5dHjjq+6IE1jAzR6O2mP1JyjzzArAdlOz1gj2DXBsVP?=
 =?us-ascii?Q?wcJjQ2jbZ0ETzQ4gr8rfsL47dDbU8qj/2MCnX9R7oU1DXCH6GCacacA/Svmy?=
 =?us-ascii?Q?r/BtJDPsFci/grymEmLFsDMdfRxYrBdTuRMFrdkHq5ABhYRmNyBYzfv2uG5V?=
 =?us-ascii?Q?5FqaaPulDa6uXkAmMJLK3bWEhqBaAlemhZ0ZCDJiJB5KEFP55vTDniBR+Ztg?=
 =?us-ascii?Q?f5gH5+XX9V2AdskVNwcAnb0lsTRvW0hF1s8QYpOxubDGvlg2C7SxPKGQy3d/?=
 =?us-ascii?Q?i8iyNpwzqMruvpkjNMT2lapIJioYYGE/l2ueTMh9axOKJ6u53hR+GpzA5Xd9?=
 =?us-ascii?Q?S6RVzGuoxMvJJgfaOQIY1snnmBGEdLSskU2cY1lbqmZx7mAr3CZDQvThMuaP?=
 =?us-ascii?Q?/X3RbcD+kd9Y1pxVSzoB3S8taTSuDHFt8SjbKBUBHJtFL5UgTpKNhHgtrbMs?=
 =?us-ascii?Q?xaOTt7bRg8wPil58wW83A5L+T2STd6dBpOCuq3ABBRKOVTcSU3ECQTo2BrPq?=
 =?us-ascii?Q?0Hpw+9vA0kzBe5aAtxqRAbHXaKHzYyTIF0n6zHesEEj7o5HaUfSwscqagxbF?=
 =?us-ascii?Q?e7t2CKFY496gfSMioz3RdcvoBdX/VkHbzI6KXS0EyTnm++9WrmoWmSrtUxzg?=
 =?us-ascii?Q?jC12kKsVIt9N7T1SxcSdYaOynHfP3asB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OC9esxzQpmTKp+kQ8PMWOftvQYyXtnqmtexHFWEBmTpTWnA6D4xFOxyLT2ar?=
 =?us-ascii?Q?4QuChvBztW0aUogJXwbgFAjkbsxrUQEmCtv4yGdRjLpOOUWW7LLIZnjh6bRZ?=
 =?us-ascii?Q?g0v/AXqmkKVkFky8uzetyfbkxStF70vzEuJfOvFTlFFNA3yvOeFgU4VjzfEn?=
 =?us-ascii?Q?mXXjjtbRU+7eoOBSsn/iggEfJmhnmQNPGEJHeZkQjHEoLGUKRtzt2+AkRnw6?=
 =?us-ascii?Q?0iIRSNGIwiqNlZQDLSluq2SQHKQP1yyZ+nPSRfX+RSWGT1ZRYkLortNGrm99?=
 =?us-ascii?Q?diNi6GuVci3jprZ6dbJWhiCVw3mNKP36n+IIr7lfuxOmJhNFSyulr/3QuF4d?=
 =?us-ascii?Q?3KNkBvZ9wUoGXLaacrlqST7GcPLm9/rUWTx+r+2MVqZbaQy7AALd53lmVnaX?=
 =?us-ascii?Q?voK32o7mMAZ8A5kW7yJ3oti6vLol0+De6Bi4IRFjmc53l/eEx9zJH019T/at?=
 =?us-ascii?Q?Z2T2hvZm6uNx4Jn5QdfmEQyCrkx5PFO8j4WeUbP8++vDeennZqR/YY5OxQRC?=
 =?us-ascii?Q?fp9x/2YmfAO7L8U/zveZwxxEwTN3R03QIQjFAoB+vu64hlQ0ijHvKXGxuOFM?=
 =?us-ascii?Q?36CmqimqH0nzZRdBmWefuMkpQ/8NIWPzUKh44kPcy9xUHwhCTZEhffauUFxW?=
 =?us-ascii?Q?de6CKOESR/6PoIPGVzbnm4iYTDOEpg588uDobyZtyJSWDtMQq7qIx11cqYoJ?=
 =?us-ascii?Q?+9bUuKpEDvAB3lm1IM94XuONQrX6R7T+6AyA5oLq4plMZcIeOe3oKaFkina1?=
 =?us-ascii?Q?jppcnTTXhCIlnEzO6764uPNUT388mHZ8nMc4xZHsntReRuZoisdKXRqLqwSY?=
 =?us-ascii?Q?U47D3glJ2ezGx5nZfjEuxTqWSjU6WpYM8H0+bqGhHwf/L0n5lX1F3NzNUIi5?=
 =?us-ascii?Q?084C1BZSR81pHVWDgFX6baZQUWyBCMRaJWX8Hh41G8jfXgyjZyXvlGBIjsN4?=
 =?us-ascii?Q?lx+Xfwen0IuPqbOMoRQu7ssga19QhjAdIWtpUL5HPqYwXqdRduaPD2V7bA3j?=
 =?us-ascii?Q?BacvSz3ay9D2AnZ5C3pCs53ubxbIO0qiNT7mu3yE8HoHbGC6UWyMEaWVFVgd?=
 =?us-ascii?Q?batk4cY5wM90rJhB8B0JphWn3Oht2agxWJPJhv9cvh01jrVBhlHnYlQenKw/?=
 =?us-ascii?Q?fCjxpVM4q+glmcK2K85zs90er6ILbYWV0BRhJ5wQz90DP1yo62L29lO7BbMV?=
 =?us-ascii?Q?xQ7c+rLR6XmGgojvCpl7T4PDaoyIDD4gAZpkyS/8CTQgfOgraFFyCFZ+wB0N?=
 =?us-ascii?Q?FsiE+pwTCMsXlMiPPOjkQyd/YJvIUxB7PqPwTaZDEvt+d0Rp0X36NXJe0q7C?=
 =?us-ascii?Q?zMs5F0TRoOP8Nm7NYCiMxWuEJPyRMpb6a/JozhGQ365fdCuIQPXvgekVfJBy?=
 =?us-ascii?Q?WM08QFrzYQAUpC2LDFueUo1R/fIyH1UsAxxmkznuFAvrtWflNHIss2Uw5aQT?=
 =?us-ascii?Q?g+fB+vE9oFX31MHU+IL1d4V7f4MJuQPIlUrOYPc9g5HeH505v8uN1InmuUoH?=
 =?us-ascii?Q?R9gdZUNqQcqLuBQqnxZPRMme3buIXrIFWIWvnr5dDu86YXQGOA2BNmfiAbcg?=
 =?us-ascii?Q?1fbAAiJ+oJz2Xik+0WXICBlw1v2wgUQOSnvonLGVuNN4SEwzXH492pUFDOWH?=
 =?us-ascii?Q?Mh5BtsYxlr5O8BjWPDLRG+I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c00ec71-fa28-473c-a71e-08dd56051dff
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:30:13.6577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BL/Gz0ml+jJ4iSYRdkQzQFfCMnm4DVZWeIVbze4y2/G0H6VeJ8SqrvsjujAgBipITkz2TmzbzwantpBjOkpCMry8B+IFp/buGG71z2E6C+tfemqyCGwx5/AXaYgg8P6R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10735

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/davinci-evm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index 1bf333d2740d..2a2f5bc95576 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -152,7 +152,7 @@ static struct snd_soc_dai_link evm_dai_tlv320aic3x = {
 	.stream_name	= "AIC3X",
 	.ops            = &evm_ops,
 	.init           = evm_aic3x_init,
-	.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBM_CFM |
+	.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBP_CFP |
 		   SND_SOC_DAIFMT_IB_NF,
 	SND_SOC_DAILINK_REG(evm),
 };
-- 
2.43.0

