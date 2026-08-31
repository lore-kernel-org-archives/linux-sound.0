Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB12A3C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152903; cv=fail; b=AS9PCskje7W25/PrJhwtW0ZNkwTbXCh6+7I536NTI8gKmfLEK2fGWB7pHqPmfaF++zfM/qb+Zbl6slTGeow8rXY+DPFIJ6yuL2j3TIuFjfA7jbl+sTnlc/Kq30attnmi5W1VPt+0VqI03PN5fzkJ5vF536Uhc/HPdtuj+h5nEWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152903; c=relaxed/simple;
	bh=/LcJooqtYVEdLTLxhsRdBdO+ILrdbfDEEgFURAus/Jw=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iq9kXYHhCjzp1qscyRkJBd6KWBf0t0ny7AEbt6er6iGr5kFyMqepO4Pb/lWqJicH5g4EirfC0FQnVl4igldLlRM+o6gGxq3JxAJ4I1ANOZjCiHAzeo/7KDLmMi/ycoy6JQ2R4dP1IdSz489JhVSbdf3Tl3Tdp23guYNdVJOZYCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ESiOQd1e; arc=fail smtp.client-ip=52.101.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ESiOQd1e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIzHDt43foewqhW2oeO92YihonUOx2ri902s75x7YUgLnm/bNUEA3mD1yQaR/OuVqQ3AosKVTc9a0xEW0KESzUK9yholSIAGDaUQLsMLnKunkrA8O/QLKr1nXZxeEeYignLU8Bkx/Zp+Qka5jBpjnFeJpYEPKH2v+l+BfN07thsy3gbBEalPol0ivtafqCziZZJF2ZZXlfEWlnZBmH5ZpApFv8gXbTCDBITcsOseuL/cgXCbr9ZOi5FfjqqyQ1Bp6Mu/ux/cUuxKYIFBWTtC8jNnNhVnCQKCssJOAFqiVk4GHuSrz1mS30uEngSOcT8cEtHMnzYS//Grjf6k/6aLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+mw1eg6bmaRUcHKIa3hjyJ+P/Ygp3bUxsSDOb9xNbo=;
 b=fV6iTYiBdr73hDvPC5sdvBcm2fPDgSQFnFNx9PPPfpw5JFNUNM35Q9LZm45otF00y/gAt7D/BHaxckuLuZgvcS0MLGSpDc4liOVozzOGFuu3AkyakHGo9HmEh30P3sXvZYiQxpKWfbPMHioJZeKw0we27bJvrImjGEYXwYr3NiSYPkLg1SX78Dj1mxRl3WbMDI0mem/HqlNHB4Ud7TOSe2NiIr2ZN3JAce/W3sIePfTuPUin3gpXU6M0LM34zowPhMrHHouvAL7oUATrw1hu3rLdzPDQeDpSxqwIjiICi1CZKVSJAR1mHwnmw1q5nqY6asYjrlkWf8g+WZONB9Yaqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+mw1eg6bmaRUcHKIa3hjyJ+P/Ygp3bUxsSDOb9xNbo=;
 b=ESiOQd1eFl9VUwPfn5AeE1vACjzk16OjvI6oRuSFiBe6jnoPagAOZ4yOQgFD/jGtO3akF56MiBpVeIJxThGyH23GlI3jXJ1xNzFgNfPv+uDQOrZlZ4/IHZlYdSdaFNeiNCKEiIpR/k4ksrPy+hojcJ/YoAcLkQaQE92n6KEwHyc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:08:20 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:08:20 +0000
Message-ID: <87v78qubb0.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 20/39] ASoC: codecs: ml26124: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:08:19 +0000
X-ClientProxiedBy: TY4P301CA0099.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::15) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e25f11e-7a27-4db5-d872-08df071ddfba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	GQt7/eyV+46t6UrHr7XJx3H1DoDfppzBZWz5gUjZZM1vufUv156hKCPItRt1Bxdo5rX4Zwwrrt9/hG9UEGkVlI+TS3B7Uhnm5uxxHn9jMQLXRPvAu3ln1H7bPfUWIrY01KmQC1iBGGE0kWcmt2C+DrHbdNTWs4oFYRlfRyP0EFS5UjDQbGSI5rBeRF6lq5A7Pb3J1+Tara7B6t4O/CSk1Xjoio14uvL8umnNFPjSf97Llm2e/vFZE5++HsH/899xzD9rcXqkXStdhh4ivhHvxRgiaFKfsH4o/GrPjcYNGoUyIr8CKQr0+8GmO2R0eaOuiReTeuSBBHuWmZEHPSQMb3+a334081bjVF3YBDLKDkqWDuj6xkfUpUJX625JYK8l/RApEwVy+LB1p5C1fvOOBbuZejDYIZR7D/B4qK1nAUemcqEhFEofWO1L8Qfvi4Qz9s3AbogFX9ZIUCVz7ZBNBP0K7Arn4/iR5Hj1EJrILY96APbDwTpEtZN6LLPbKlM6bsLjp4a+ub5R9wqhe+NpgL0Rzbui6I2HP4P8hj4SREfrKY3kKtqZaZORYgredhOvNCKFf1xwWj8wox5OAideH0r525hJ3Papc+Tl+gZ6M4Jz2+KnrQ+eiv/F5KpCjd9ogjJKssR2ult6cd4r5l0NFRQErl5lUNgnkJur0oh1BhxG5PSFHLXQ6H/qmMY6s40I7L5xQXFQBkw/mnQSgLD3yjxkXjxc0eheSRSsI37ZPqY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QdV3BeAoxHp8dMF92jCIW8rEh6kWALzrxagptq+D6kP7MvqeoJsjy9nXdlHu?=
 =?us-ascii?Q?J8n9YIsERZWiU9RgYEmBeR6R81ftPZlxShH7MCfp8R2CwLS/3heRycOMSaJK?=
 =?us-ascii?Q?M1yCjGi7rArBfKmDiVErN/gkf2BraSQStAq9NptDHQ1AO8bf40To+xLlwrQY?=
 =?us-ascii?Q?MJOx21avhxvBvlSrvSsUFKrdYzP+qCmqSKHZ8VC0vZcClCQtdRilscUtIlnI?=
 =?us-ascii?Q?y+RLlqfh2GXynfnldCC9Z9uHjrZE7pWJBbx9WFSdgDdq1pwwWu56oDn9j6kD?=
 =?us-ascii?Q?cvC9EpCPK7dA6DHqnNbMxCwkgcFmq+0fSPC7CIpoTQ7tLsRWkNvJndoYrBOQ?=
 =?us-ascii?Q?cCdeKevnoVrsC3GFznlBe/FLYL8rOuY48Pq3suydlrJjbR9/iPxhXRiDOCqD?=
 =?us-ascii?Q?TIMVAq2BhLcOYT7DHDPvqE/fHdLSsT2l+Q5OY/gbcoSdcg+IJ6I6+2HevUBp?=
 =?us-ascii?Q?mk8zmAQ3UhuZEP/GT0v3mcfzhPHxQcVwW9Cw38ATkc2R8ZKVZk6nErZ2IJRM?=
 =?us-ascii?Q?6h5mISC+xdTtuILrpv0Jib7g/Mo8D/nD1+KF37oNYoO8uSQgDYmpEt7GU3f5?=
 =?us-ascii?Q?7KA9F41cdrIq2e8ZpzBrULT5DI0y+/EgjyEETyeJSuGaWX0MVTvk5nZ9q/ul?=
 =?us-ascii?Q?jWoe/EVjO+QyN0E3qZ4nlfEmC4J66rYelz7cAcb7qofNuCI6qVpdlrC1fOmH?=
 =?us-ascii?Q?mXGuopdr3m4sgamKJUpz4H4P6HRtVEAvoOoMUj8i39hdLTPg5uil1Z6ICsaZ?=
 =?us-ascii?Q?Ku+u/gDJpde7xYre2fHZqSQ4Hfk/4IGca13i6qjz62bEDrttReBqreFfhwXU?=
 =?us-ascii?Q?MEsOZ6eKYTeeD6UY7TWuA067TGDOXDkN72tiiqZ1XmDx9qThlQbBfbvW/RuJ?=
 =?us-ascii?Q?bPOnVYAqFz7LPLlVfFVcwNWA2Y7d8mCySPRV5kIaTQxl3FXV9E/jMbkI0bUW?=
 =?us-ascii?Q?XGBwsrjrF683x3Ro2j3buT6fXlMamZkpHHDgEAQetKB6i7J31/LsZEJ74E7D?=
 =?us-ascii?Q?D0Craj9zK9HtkknPNabiNp+IUbmZu+bsLUOPpNatqAf5CNrFxEmycqHIcDcH?=
 =?us-ascii?Q?ugFcYnZX21DNOAoeeyI5RTdlBCgUY9k9wLsucAkrE++mM1fW64aYdjQ22c2X?=
 =?us-ascii?Q?TI3NK/5x0gsMVfSBdVtPpltj/DWHM+4JTr66J6AFnLNQ6v5rhVVqtQEXYqMU?=
 =?us-ascii?Q?vUOh48zoNzkjdCxi5JBSF+61r+T0YwRsuiXS5mCJww6jsRCiBstn3p9wTdIR?=
 =?us-ascii?Q?IEOWSrD3n1sEBb2f8r7HHaoGWUJ0OVhvnKUKGNjdbf3vf2yzF35YXMqpQ19C?=
 =?us-ascii?Q?lZ6gv6dkQRvu+HIHs1HJXgJF+y4BTX3qH+FWfPXTfVdAO0B5kVbs7wLfGiAt?=
 =?us-ascii?Q?AQweDuvDub7PG168WosOpNd76lsa0GYvbt4wS93+Py+YCvj5s4a0wFGWA+tJ?=
 =?us-ascii?Q?yfPJ0eZXZRDRWgn0ibBoscdIyc5OqeC7ep8jO15SVLvy3IXx/Wl8MFKCy3wZ?=
 =?us-ascii?Q?4xxYlCewkFRMJKl2T8r0GbaYCL5Y9JIdwgMh3G7v/2NEuM904kTRg33xhg6M?=
 =?us-ascii?Q?ra9XO2yhOCx866BPG75psKVmz//YpkeZ4Dydq0pxdyxux+PIbJIsOH8UfTyu?=
 =?us-ascii?Q?vlytvPsv8rR6ot4iiNKqYoc5Yel4DbKuakxlzdrD3vEgrwZya3h995NHIc0b?=
 =?us-ascii?Q?04h3fIsEJgSAQxiunWVcuMttImrqENVhsOqqD7pide3j8HMWIq3BdIy1k8Bb?=
 =?us-ascii?Q?TACflQdx+S3G7BNpaOSLBsHfJ7swJez3b+2JCMRAp89hUfvlvCdV?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e25f11e-7a27-4db5-d872-08df071ddfba
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:08:19.9956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCA6gWfcS7HCDlJf5IAXwBbrU6JRrpfdPXsFyBSRU8Z9LZhjX8/NpYt9Z2Sq1kKwckOckH0OwZUwCel0K62r/GhNCTUtNdofHtw5UUDW4i8bzSWEsg7qYpuIQmW9DSMk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ml26124.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/ml26124.c b/sound/soc/codecs/ml26124.c
index 7209b47c20291..a94a3f9b8f904 100644
--- a/sound/soc/codecs/ml26124.c
+++ b/sound/soc/codecs/ml26124.c
@@ -492,11 +492,17 @@ static int ml26124_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 ml26124_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops ml26124_dai_ops = {
 	.hw_params	= ml26124_hw_params,
 	.mute_stream	= ml26124_mute,
 	.set_fmt	= ml26124_set_dai_fmt,
 	.set_sysclk	= ml26124_set_dai_sysclk,
+	.auto_selectable_formats	= &ml26124_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

