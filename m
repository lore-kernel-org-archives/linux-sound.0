Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A19198E6F
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533762; cv=fail; b=WywD3bk4YEk/AXIEciRLo0GPd2wXydMyfwLpwAZFrm+XSUHgm5bmhzBgkZEgmID2mOzq7o+XSvmH973VkWNm6XsarZ7Zr5GBjPRlmnOlfszTvxohs5ZROBE2X6kjckOStJC6eErCt8dFcb1iVnPE/dJq5GwTKbUFu3wmdQeU99U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533762; c=relaxed/simple;
	bh=3kWHv4Fwarj3RkV5Ek+maiHrNxlMmGSWf9TKDxOySyY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Jt1xryBrQH//1gEwG+85rrpbsAKuChoYYNzoJGtrRxmBXhAyr35SBZ6b2ys1DAjGV9Sh50FnZsyUWbliMLbnmy3uH8NLRWcIXXWD/u+5pbNhRXac+Lt/0YkmkFl5EfJL5fTbF1+eV07ZjSl1Lnxy+svZOMxwY6nZwt+HzbYN6GE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nkWIwcmK; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nkWIwcmK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oY5sj5cubghc4BX+TQ41Q75pD4invVrp8v6mjsJuouRazw1mD/jFeLEY8qougm+nm5DWIvdsudf919iosW0aoRFN2+r0mzMItpSJ4ChlNsnDazQMcvfpP/h40y33UY4myT696jdqIIUaaF04TjwcNW+uGkCmj1eHSrKZH/mx1qmd06ndG4/rAvjpynE+WhKnjo9CBSwAksM1ABgfgeEz0zIkNNpVfXwO4zFB2VAstVHU5dGS5JbcRWoAvWfal+dtCYM9SrS32WMfx1uFxlZ7qIeaFveeoNQuZ5JnK9xmwnFY0Pxll9ApSNeDsyXSTDPHMUAcQBAkslOrRCpxWZnAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=648IDxn2CRi0KJX4XWlHYT0OI3Ydeo68TamgYR9l6NM=;
 b=eH7wz/JL+jYH15Qt0KFrR739Ph/HqvRO+QUq/dvga1UVDb+NozrYxaE+uaYiL941aqG1x1twDDdCUSDmw6h0hjNXCPGAyi8FbORkl4alROTcZa1ZKrmKSGcEV0v7b9UtHnCXTRNP+msGPuNJQxP3X5LuNeu6AGF2jgN1HV+O6YWezV8wA2n6f5xZZ+rjN9PbLwxrh6jm4k9QwFino//uqw21/FQiewBuMJdSVNoYaF2qqXOabRodPWhVQmc2KuKf22a1uLQOnS5SzXlCM7PVFuJcsKLu+f9Ut8mdW5mZb4NaOiK40XLGA0DakMVChNcs0UKfsvCc7Qy1UxpuYVnc2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=648IDxn2CRi0KJX4XWlHYT0OI3Ydeo68TamgYR9l6NM=;
 b=nkWIwcmK7jV337yIID+FaqTq84YoYA3AEtdJMONyAqXqGcn85dcmyYck0FgYhyUfQHR+uujng0M//cyY62PGvhehrcmW3cG/Mmwi2M9iiLyMVuQ2OuIzrp8Nf5I4p4cJ6BzcVDNGAbq2qkJBPLa2bnefVw1JIkizJFXSu+MEEUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:35:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:58 +0000
Message-ID: <87o6ypbi82.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 094/157] ASoC: codec: wm8985: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:58 +0000
X-ClientProxiedBy: TYWP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e774f7c-bac4-41e5-7d14-08dd5605eb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bl2mAEy+/gQwZfnToLTIi1GS8vYFO85b/bUhYIqwRWmcVp8Zh89OeeBOZrEa?=
 =?us-ascii?Q?spzXfcO6fGWWL4YVeLbwfOUBUOS8zXRV0bg/HQmC0pk1uzS9x/SPeIq3H1U9?=
 =?us-ascii?Q?WkFYpVPtPuDXN6pfmpgwkn3Kr7RTHNSSZci5oeXFurC5oVzJBcn5wqnUp7ZN?=
 =?us-ascii?Q?oy9kNaIM+HpM8pY2S3USBlzMPtq8/GyJhvDs7d3bIScGvYu85wZoZ1vP3fY3?=
 =?us-ascii?Q?s3U1lk4QdeyZNxBWB4Huo7eKbCQs2MBoXqrmwr98WjQampktFIpm409/6wfG?=
 =?us-ascii?Q?HVJ1tgWy0yGeBORLc8Ef9+XzAgNWZGomA43K4O3fUjDLg9fWJbQ5rfRuAUqe?=
 =?us-ascii?Q?YbOGkF4c926+6ylPKNCXIgRL7uRJ85Ku5TBGC4UnTsyl2ooo8SUIlVlsJoZf?=
 =?us-ascii?Q?EKdq5sj2ESCHINQ6HMgPjXeq3aemBXwU+CxlIQD1+McJ8VcxqsFqG7nUzHH4?=
 =?us-ascii?Q?LrG8PAsJ0knj39+tMWE64UFZemRYkDCNiSlstiz8FKyFwNItTKAXXJOloIiP?=
 =?us-ascii?Q?aKmh/q8wSZPRjzNmcPKOr1d2CEU+eC9Ake8bE8GcLJsNzuh0jCbizBA7OFu7?=
 =?us-ascii?Q?0bnN+O3b7qucowTSXrvZLhtHBv7KxmAh+JH9DWFLVwqSh4+nmv8MMNOP4JKb?=
 =?us-ascii?Q?ItrPenUW9EdAHDZUQhcnuMsyLi51n3h1YE1/j8LmyzwbF48YVJqbQ3lGhVsW?=
 =?us-ascii?Q?3ja6HRbJksx5zzhhvbcKtEzBPrKzFXliwM/T8sErpreoopHUueHZ1XAGqroD?=
 =?us-ascii?Q?kiV47CpOHAwhyObNVb95/W1I7lIbhX98nTliuMUyacJ/dGKQoS9equMDaDKP?=
 =?us-ascii?Q?V4EXX+UrtIixzhwFUSpnUakWZGqZv08URypdighqueBSp7je5x+J/FM3gN44?=
 =?us-ascii?Q?4acAjaLsZlUwqOKm90dA3esnHJWDFLNDleT9bPYUcJy+WY3+2ffkHwODkB6f?=
 =?us-ascii?Q?TpmYUOxZAtSO12xmBNp4ob3JG+t3HYbO4OfHyjwrTjkYt+J84PcaVMlVW6Yx?=
 =?us-ascii?Q?CdYNbDx7meodjJTk2BHuihy2Ju2u1midxrsAbd/pgM9/AQm7BUSormeZ8/Md?=
 =?us-ascii?Q?mOnn6Xppg6/RcXUaPlqoK/QBTONFAK6DNYql9EUcs8e4BkawOATw/uoTe1ox?=
 =?us-ascii?Q?OCxdydR19SNcYPiWUbD7AAKBVz9PnQrXCF7YX3ns8pY1xlCnf44q1/kzB6VP?=
 =?us-ascii?Q?CwYmwmCUCeYYTYY5CweMW0b2At/xtkyMLtsoGOzadyviW9LbC+YW/yl+ivQf?=
 =?us-ascii?Q?lmWOG9+8xneizxWB78YY9/iAdQvuPfD+ywrQ3inEezZL14jb+ocRWtevYd8y?=
 =?us-ascii?Q?OznRITfgQ/bHNZGixV/Vy0/GVA8zwfaJ0saFOu9vxPwKaReZuyXyxgfL8pKG?=
 =?us-ascii?Q?D5XujP8KhvaKA6sQGXrcSm8eXb9+W1GhHb82xK+ByunrJ8xtnc6yhH1T+bdq?=
 =?us-ascii?Q?5kcfdqGRioB7jSph9LQISutJCNHIzniW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L5k28GFDcNjncayXqFLe/LWwmfNQjIUwF1E5tb9gvAyMdvtLzV35WgPk0g8+?=
 =?us-ascii?Q?Om7IEgoidRrDRjwGpEEzA3crp5/OKk+qaKX2bZ7nNZmxVqUYvYuo0C1ZzlZC?=
 =?us-ascii?Q?L60rPCrV6/9Z1oDI0PMS0n93IFMxcddsgXsbrZomUaPCulkhL86iNuGRoDwK?=
 =?us-ascii?Q?7L7bdaowczz7SQMqvXWZPKOdXfIYkcvBhkQNGPF0ivpV4w43kouHykaOasPk?=
 =?us-ascii?Q?PERwiVlnnxV9Q8lEIyhAdYqAn3zjLGZvPxy4X7zsowYXi4V0qba8XZt5sNG8?=
 =?us-ascii?Q?dSW6oVCGAWUa1CYfR2CrCk86EOXmO5ftuUG6tQNnSpLMKA8l/Zut2KhRnLcV?=
 =?us-ascii?Q?rNYY6cHQy+41EMeHo1MbolvcIIwvaevBRRe3JwOqJLYZ/dkhUEim0MuKiT4W?=
 =?us-ascii?Q?/tvUk8Bvbcl0hz7ffguZhwHGvlX8TF8zkPDLjZvg53m0eQ31jP4v1uQ0QKec?=
 =?us-ascii?Q?GpRjyGp5v+PGt6JvAa0XToIeSJjXpVgs5yEIPfFDRlORbfwyfH3IJG+ZC1hy?=
 =?us-ascii?Q?BT4Q0Tc2EIgj7tB/Ta/pbRb3WeLuH/p4qvj07UrxfsRf1B8zwtGq0CouMDyT?=
 =?us-ascii?Q?2gil/hsP3ic3Be4cEyCiuS/5vTGd818uX6+789P+SYXGo3zlFTKdNfLpc5W+?=
 =?us-ascii?Q?tKkG77iZUCaMJFsGN+MEn6QgaAlvkO9XtA5oGrBpQxcrVB2K81MOXwcTDecT?=
 =?us-ascii?Q?D6gSMpcfd+4zQat++uhoh4zPp+mqWwEEGGYmmhfoFJY6nUfnCu9wXDFRJslz?=
 =?us-ascii?Q?pbftICujfqFaYtFeXTrbwJpag7gG0FPxOJp+NRvd3B2umn4q2bh0sA9RILPL?=
 =?us-ascii?Q?baw3lP/Ks+LwPWEtIxBCiC77AYOoTenEiW73aTVXKUM8rfUnEdSnVBUeXXs0?=
 =?us-ascii?Q?LHlX+267crA2bhStP+bgnr3TTz0Ju0/RmpOKFo4vmKeYK3TBnam5ahxoRNYM?=
 =?us-ascii?Q?BerNyMm07I6URb+6OGY+kJGkDNnXQSW6dSduMo8LakE0i6lSFZx0Y17K3kL7?=
 =?us-ascii?Q?bTG2igEWpBXvIgkkXYS+4x0nqTXsZ5yxdeWwB97cWvGkMeTATq7jxYI2LDhK?=
 =?us-ascii?Q?QE/QjOR0TkSYT5Zhb106R4ui4rruiLD5ZUD7LY7XS5YfKGaEhJlsMmw66Ls0?=
 =?us-ascii?Q?L1UuznWHwJuHZOABgM+lO7+8D9R0XKlRG9dLz6ljsbHaJkwPoESL3YwsVElh?=
 =?us-ascii?Q?Mo22s/aFQiaiLJT5zTs7Lm1UDwsX41MhuMCz9dxj46kOlyupNP1FZfo8ydOW?=
 =?us-ascii?Q?LfcuxcXEHHldHFCVEGDYVp3qks0UpCps8sziwIzyKkB15s17AXUTwfGuSxcP?=
 =?us-ascii?Q?kp391s2Bd2+XsjpU66dtNzdoRZgvYQMYFHrTt+tJB3CtksnSTC/pkXzDl1NT?=
 =?us-ascii?Q?X3AhiQ7XVxG2p+rwuPnZQKgeyS0snpkVMCpyljf3iIZ4t2RW/wZoAq4RFEyY?=
 =?us-ascii?Q?dVSp4T6hGmA48Kw25Aue83Iv+9qDYNAtDC8L9F4LvhSE/9HyoxJau1XaK55l?=
 =?us-ascii?Q?9pgjrCS48q2Uhm53YdwaUIFe/CnvZ9UA1jooK3jNs1AhInGQ7u8+OP7DaV6m?=
 =?us-ascii?Q?ByJYYofpjB+0RObyud8kbZMx8TxU/dmMvZQcnBB3IZ+hOu20Y7Dk2uFUeSo5?=
 =?us-ascii?Q?rDLtwpcS8Im7fywLJkiDz5k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e774f7c-bac4-41e5-7d14-08dd5605eb88
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:58.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVhBqGjyZ2UZX6j5SxdW95y6yZcQOCLSiX02A9XwRDm5rV2gsvmnlTx8TcZtsjQiu96oLCz4uhxe9qosHerzh1tgpsBoZUtEP+1utob+jsPoNZrHSEsASHSOmpUfeOHO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8985.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index da00db5b0172..2e2d07193c41 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -688,10 +688,10 @@ static int wm8985_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 			    WM8985_FMT_MASK, format << WM8985_FMT_SHIFT);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		master = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		master = 0;
 		break;
 	default:
-- 
2.43.0

