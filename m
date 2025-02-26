Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2E818DB39
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533569; cv=fail; b=Tad6fNBC2fM5BjaYtuV04qhrGjdULMnfcXH64Vej1+X8ri8SnnwnjJ4Kd/lUSNqQRXHo4NqFOJxn3tGUcAcRSv1JXsn46iEA4pEyrw/ewQkTduNQXpZQPRiv4MNHwY4bOYvNpbuiTCJtcCCMfuqHzchli0I3WsD6g4PxcwO/8AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533569; c=relaxed/simple;
	bh=lusAy2tTjSFQX9qltUb8n32miKJAhE0xHoobMXd4j9I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Vaz07uwMzs06BlVxSz4IWt8lHw3bBhSystThX6sMEpkXg3yLIi4QChSX+niREMebdtzHCBy9Z7j4xn+6Elm1DLIfcl9OAh/eIK2+We8wj4nD9IASy6fkmLF4kE5UZpjr16soD9QszS107fRNMORTe5asE25vQFdZgUB+Tj/nWqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LWHpkge0; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LWHpkge0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nC93+USXxLCna8YuuYPH/5g4ZNZdi1znCiLtaPvT5Jajy5ogwAndly08jv2HxhhxsYhiNNsX29l+k7GWzMOAcZObtDN30EU6IaO2Y+r7zZZfE/O3cOBoD9aFIJfQ3k9nBoGFWBNF5krzhJnjPA3iyhRFYhZZC2lxSk3wm2iyRjGISVBkbo4mpStF+2FLM/pqa5mqRQgT/s4MahiWXw6Fa/3py6BzmMoeJIrkKplAJDHt5vUoKc/0TL75XWBfQJDsZb0NyvuVQnKjOvOgh/i0UMjhswOoxB6F1bzfrb9fEo2z9oIDZ221BDlebm3Zmn023h835+LMLr9ZuZHxoxpfuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MORdRkqhhT3YqqhDkH+PIn/s78GjMMAHMX9RF8DhCRw=;
 b=cQQgLbJwElto6648yoJZZJotyqGRE0dLC58jh4kyCudJ//ncXjynKU1MzLYd4DqW0Y9mM5k+GaM2OsWn4MEM4nFHWyWe0fcwbT0g9uIGSk/gauIQOje6NHIUWPyxsuwqE8ZgXzYjQJYwlWadPSpXtACYlUknBuBeN7Jx3M8VqTHXmDjCG7XifXyAIc5lCfHNBl4C/fZVeDIbh1sfSWkVLQwee0acXG1EsBeLSe/ifXGBohGpJYh+iI4wa++dgi4yrRBc4s0wcRpArQSuBlFcHF8U5ef3jBmGnZOeSfjuzeUIF4E0hTqj0ZNxKg/he7wMy3z1g3QnsZ8nIRcQTG0itA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MORdRkqhhT3YqqhDkH+PIn/s78GjMMAHMX9RF8DhCRw=;
 b=LWHpkge0dLkqgh0Ub36Meueu1WQS4PIWbk4v8EldmLlK1qprNPEnmZP1+ll8lkpHnOpi8XPTkszOpE1ub8ruFi/13csVwQugVHxTYI06Xg494BMw2uqjycoMG9Tbj9o1xmp+wc4Ih0GFAuyaP+xDYIaqX8Q2fdvAlJ9d4/oDDz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:47 +0000
Message-ID: <87r03lebi9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 042/157] ASoC: codec: rk817: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:46 +0000
X-ClientProxiedBy: TYCP301CA0060.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 501a81d7-7a2d-4a32-141d-08dd56057987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VL/T5tTtQT+hsKAcqZLVbci8iGaST3hfA3Syat9if5NdnrQV+vPNKkEUb75p?=
 =?us-ascii?Q?4Z9JSAe776MnK7xcyJ4ka7p4bV9y0BJqWsbSZdXYf06gJqYMxazSC1nFfAPT?=
 =?us-ascii?Q?BYNRvPb8L4HjePcy50LEZlXlcFDqNPwmA1qIz3Ybri3ZPl+5CvTsqlNoafJ8?=
 =?us-ascii?Q?T8K8xjk0C9dxC7hh0BqnyihkhbafPtq6rjuje565ydhWzlGMB2ucA1ipOKOg?=
 =?us-ascii?Q?icQ7LxiJmolS95qdWHIxAjtW8Y2Qyp5hmHFHEX//zKC+T3r2vi4KuW9KQ2My?=
 =?us-ascii?Q?cnPtHj9zv+wdgio5LU+lK7kYVbPzFwUGocsHppzX66XspHT8+wSUtl1CDhAM?=
 =?us-ascii?Q?poElxTXrnO76CN5dPXsdwhyubD9tQg7qmv6tGnvbJ+lpHtyayrGahsxfJbkc?=
 =?us-ascii?Q?UzT1I+fkHPTm8E/XrIYtfUATESt+BOiO3UvpZ683LnKwRiCvg+bKjGYZbla+?=
 =?us-ascii?Q?YsrNVtV2SghNvrXgQgMNZqvU92VDT4QlSyNMLalv2z1nrcwelqkjsyUuzwmH?=
 =?us-ascii?Q?88J/hWAiIokhnEvGFog3e6dhbkRSdESnMSMQwDaVNS3tjPLcpSdxjhy5+LWI?=
 =?us-ascii?Q?+gF5/9FtRVoaBxiNjNA4OtKpqATwLmkH0Y/JKQAcRupqaR+Y5LFJ+0YKsSCT?=
 =?us-ascii?Q?bJfDWo1+3Vb2ZxBrXB9X7/gPyCiFQFyuOt+Y+okvRHE4CQPKIG6U8E/jwnYC?=
 =?us-ascii?Q?pbDaJq8BOMogssknl9yxjbHUnhgp54pECwI5Be5vOrGdMSwxYnPHCEoCtEiL?=
 =?us-ascii?Q?L4FBG3Y7CelfPAa99VJxk1t8COqsdlPzhEmGrPLU2dJ7iJ7LKLpAWzXnEC5F?=
 =?us-ascii?Q?dWj5SKtj4X99Pu5fLCq3H3MHrgzVZXSL8m35HLcarQ6FUPDBIfix7JNCwH0k?=
 =?us-ascii?Q?uIBsexhkGr0px1anjy3/u8JcmvbcHtezkEu3jXZ4zLjdiDW/u12uedn23l2r?=
 =?us-ascii?Q?F1gA0XzoSIk5RzCdZao8l2IZJmCbldTmHiCZ89Rdikuml7YGWn9+5lyMWYvu?=
 =?us-ascii?Q?YJWlSIhMFjcahdC4WmrEXcPk4P4ktU3f2BeWAs8/i/HmfHPCH39nxzTu6PjS?=
 =?us-ascii?Q?l/CxbPpMo0T0GqnWYUvZBkd3jXnzI5s2WCGTC2x4sMmzCU/6sd6lxHcxbWIr?=
 =?us-ascii?Q?43SWEDfAWQd/89kGi8QQ8DyB0q8mxiJgTcEowjaYzlFd0at817MOAFFMbXrY?=
 =?us-ascii?Q?fSyrOYeKwAaKX4Z9t+PoR9qpdIqry/8bboT7Rhb2g51gBUvzqx0iozt6hldy?=
 =?us-ascii?Q?X4dozIt2kOJ9weNhwq5Zbtu3TsppYkR3CA30hkV9b0dJhf0HRjb3rJyBos+M?=
 =?us-ascii?Q?CEKJ66j9IVle8BMRJ8gLnvRi3c3VzCiaY+oVHhqqIAG6z0kxgWHYNaVGxx44?=
 =?us-ascii?Q?YZtaLlxTd8J5STxD2b9pT/E7Ri2a97NBpZEtbBaodsNEd8J/v041kdtfJddd?=
 =?us-ascii?Q?kOMeZSHoD2uDydWwCNHM8gU0BSP4wpmD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qEv+VekN3ZTP37pdJbDtnu4E1h3D4Etl9DnmGIeqRy1vobcPl35s/VTlwt05?=
 =?us-ascii?Q?xUwU5IzAYai5cWoZ/vGpf5pc92bwf4yBoSFVPqSlfgrZ6y2YLd1dz0OAmzqh?=
 =?us-ascii?Q?KGcAVjEbyltdM8wHXhLPmzvK3/eLYV/OULOQK6tZ0Q5oKknrcnB2ObHbtkwS?=
 =?us-ascii?Q?GUzjuHTmRE1VtD1GSGlpuB8RxUdeOWmolUpMUvz1WB93iNayKLcYAHpO1UZO?=
 =?us-ascii?Q?BShH43UGEzhg7MQswT0q22vILopqTHStkVor64dzxCCRehVKqq/PV/1rdkrs?=
 =?us-ascii?Q?YkCP83dcun1D/K7Jxj3BVJPo9AGbdoOKL0SzvLFINSPwX8yQ2i+9eBc7t4Jk?=
 =?us-ascii?Q?j+x2JQjtxWa1thbLa9xJZ3f/Yp2bmZvxZsj5s8gonUFTYXh3bzZ7A/NUe9oX?=
 =?us-ascii?Q?XxprFpLZM7XgUYFNvndFH+wClJrWThzg/zIioSFPWRVHJCx0cPw+hzQiJ3sJ?=
 =?us-ascii?Q?RHFPGxysTp9E21icgyEwOfi/uv39CzHpn5CvSBd+YISIw0A3gzYBlsyiH7Qh?=
 =?us-ascii?Q?bgvpyYIPNboENslAU+aP8oRvRpwtdp8+xBXndbcYNqq/FtTcBvMYKcjaSuEo?=
 =?us-ascii?Q?EohFwVVqqFkMeMUO30m9hR96gIBuDlq6ytFgnYT09qRYKXEht8J8lHb5WMld?=
 =?us-ascii?Q?W95xLy5f2ROrFOsO3EdSprukMrwFc0MTuTjVrbNVwBktKUv9YkTBsCJ5Mb20?=
 =?us-ascii?Q?aFcH2Q+v0/bi2CuZ3D+KagizGjH7XJajXPvxEgt0rLEQFRZUb36ViXWZCT00?=
 =?us-ascii?Q?PbnM84AukqAmxYJ3RCYfP1CuuvMr7EbS/Akv8V3pl4LVWNnE6ijfDIUVhy6b?=
 =?us-ascii?Q?WA2Ed6xezNnvjNf4SKmoxQ4Akp99lA5IPlsZ0IyaWegOy5XR33xuVKhJyRbh?=
 =?us-ascii?Q?0SX7Q8ygCWUt3+EC3FXXcLVNKd5KX3V8ehwCVF6wetp6ulhYbau1oLvU6HxW?=
 =?us-ascii?Q?khox7kSD5T3/RX8CQG27msFQRvOq9GlkRjFDPI7l2acTN016pVrUq0r+E9sc?=
 =?us-ascii?Q?+5H93ybuwQSChU1g3wDyNN81Vnv7NsuVmuUsBEgyWjMarrmKr+QC3EtzZHSQ?=
 =?us-ascii?Q?9Hrp8tKKsUTJIdOBwtfljiptmmQqF4QCUQNk7qQCaAwPhw9m8ZjtS/gYnNEC?=
 =?us-ascii?Q?PbG9CsNFwqhWWT2euEMZl7/QIkPb32wM/WRLD2EdsthVVw60l818GPSZ1yZi?=
 =?us-ascii?Q?qiPE9GMvrtYtoMSIKzy77pSU7tis/FecsfVLmgg7BXZuaOHpASVoEguCD++0?=
 =?us-ascii?Q?MVy+lBDhj77sPTXJRKPwOfB6hrssdAN+tLcXW7gjJVe3IMww/MBGnGMFeeGg?=
 =?us-ascii?Q?3mDhlWAo6l2KvYnJlpL+JAEq2NoVlNLEU0hjEyA9oAKztxn8txLuO3rvRfL0?=
 =?us-ascii?Q?MfD4MCcXi6dmnqZWsptMEvI22QuQhrzjV7BMH3S5Qat11XYRB+ETpq4czVpF?=
 =?us-ascii?Q?y8pKJggWP+xgtjJ6oBPAHwf02uuA4ai9hKkUQNr8Rd0y0aovDhWeGlCinzlp?=
 =?us-ascii?Q?Jj6UM7J5oiPge8T2FXxpZ7lPe4JOMP+LhGQfkZwl56e6FLECI8SZNwJm1rwu?=
 =?us-ascii?Q?M47p3h67chwGbh0MSS4aMzB5xXadGF9cm48Kg67f18I3k0bV4SfxfaUvECY5?=
 =?us-ascii?Q?elwz96lb8Ydm7iheiS2P2s8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 501a81d7-7a2d-4a32-141d-08dd56057987
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:47.1479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbEv6vJyNzoNCTu233UphokRax1yN+kZrOdUgyPdBNaySnEIXyH21/NIAmI5c2239KzIIFv/7xa2jZwhUxYI7Wqp80CvYbSdmTxOyzZL4+FeGTr1cPXkJwLVs/yxV5ds
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rk817_codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
index 3c5b66357661..3c9957b00881 100644
--- a/sound/soc/codecs/rk817_codec.c
+++ b/sound/soc/codecs/rk817_codec.c
@@ -303,10 +303,10 @@ static int rk817_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	unsigned int i2s_mst = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		i2s_mst |= RK817_I2S_MODE_SLV;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		i2s_mst |= RK817_I2S_MODE_MST;
 		break;
 	default:
-- 
2.43.0

