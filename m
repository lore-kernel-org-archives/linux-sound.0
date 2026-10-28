Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793231379;
	b=ZX8z1oJ/o14YkJaQ4SCFKiD9eb/rfmB6lQL0EHH5ZmgVl7yd2JY0cTWiCT04kMxBZrBH
	 JQebVnC/vLnontDMh05lq7JWkW9OF2Nfb0g4oGyNe517AjyWfza17xHaCVtC9g5IqH7m8
	 7k0NqW+MIGaMnHsyW8B/N7cXQgYEhJGmXjsVZVYECY383m0XnJ5C2/BOs+E9jqV553P2N
	 ymSFxn+0k8n066ch8Vz5kQ6aVEBXleBArFKaviXABXZBYbwaHzMLz0GRnYGL4yrxeMjBQ
	 bGcrQf82yU6txP9AEng06IjKrrzJ1aMarAI/eV5GBsua30mQm5ddm0cmvrozYAedXZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793231379;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Lb3nmIqVOAWgKv4xx8PxwcGopmtAmNs2duHxmbsfpMU=;
	b=KGzQlvZ63EvZooeI5viapMu6P2b8+apS+0Hw9OnbOzwM5MtFdbKKgXTPRC1zWQOeM4r5
	 zTth3jFNWvoMAmpk0xOu/6wqzvpV5slIirz3MoPVrrOqgrokyauVINvb4QZj3Lw6OJEoR
	 1yQGBAizIehnDg/DC6e/uBWmUq6IcQcYT9wOQT297cKGdWyR07A49dVuzSJV3BSo4DY0D
	 5ityBfmNBMhMEXO1Z+5XspwwPr4JDYuycVhmsGRnIk9bPbwTR7AQ1WGb7dDmjxpBRjGNj
	 WolRpFMIevqufLMWrNEFobzkJl4hnEgQlMiMRC7VKat88I/KEwAId4/rX49mEMNMSLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=cXL0QTFY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.25
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E03606A31C
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 23:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=cXL0QTFY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqrZOGLeybw3Qt6yiH7XG66EmRUTE8jmeRzN5mCCX30XDCmPNVxG8crAbP8Nml3AoVTYpPiwVtn1T5tM/nhbliKBIUPXqHB/gKF9eBnLnZbCcvbE7dzzYHoH90Ac1/JGO8xa9ez7zPLVPUNwowt1abT1nOmMgi/H5NW2lIDNr3X0coT9SuLf9FyLCU3zCh1C/rmhjQP+F6kr0VxK4dNINCpVp0DBQCSdwMURoiqVendKWgdZAjPNa/zN4GXQssEWewcsz1ZHmYs4gWFsuEdS1I1JRysAamTgSGulxOg+cQQC6AJQon6VdmZK8VCXczUL+7kw5JpsMj0GgbWgphzDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb3nmIqVOAWgKv4xx8PxwcGopmtAmNs2duHxmbsfpMU=;
 b=biKwEjBBaTj2c53/zZRz4sIlk8Gmj9WDJNSz1jHcme8AZi7s1cpS4dMYc6o6Lixq5TLouXnBeUPFzT7cyQ/ZZScVxG74XHd6M4mPaS+oJJ06lrMraAaMCH5N/xoaKf5nV/wRmcPKBjOjaLqSFgWH/N+CTRV8/7MKCT945unuxWKRblUI9EUJzaElD9YrcxImTOU6vl4tpboTBNhv88QrT+XEf0LgaYEYyfq3r5IIUfBWeYCi/sIgxzjVxZV/eWzZguUIDU4Knxo22t68aQmky/wX3BQ5SxyoqeWSTkGwiSu+AbmZREh3bJTUMlKDBAfAeE5EoBu3yaZJUJaHyxdXGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lb3nmIqVOAWgKv4xx8PxwcGopmtAmNs2duHxmbsfpMU=;
 b=cXL0QTFYOaOk3D2LZUW5rvvznENr/Qpn2O7VMJ7oJ36eEsvg8qPaGuGT2cYGzfIerNSeEYcRM6zZ1ezmF/nXr9rL3DLfEDx2JJ9o/SdsKKApx525gpwJrmecPGVBb9UVPPFs0SM6SNIe5lvVeNTzEDHoDGSSkHJNGE48DN746FA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 23:49:36 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 23:49:36 +0000
Message-ID: <8733tp75dc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alvin =?ISO-8859-2?Q?=A9ipraga?= <alvin.sipraga@analog.com>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 12/15] ASoC: soc-card: move snd_soc_card_bind_call()
In-Reply-To: <auHClTwz7trKo2ps@analog.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
	<87tsm6sezt.wl-kuninori.morimoto.gx@renesas.com>
	<auHClTwz7trKo2ps@analog.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 23:49:35 +0000
X-ClientProxiedBy: OS0P286CA0118.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:169::7) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OS9PR01MB14304:EE_
X-MS-Office365-Filtering-Correlation-Id: e632cc45-0af7-49e5-205d-08df354e1f41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|261028144727099003|38350700014|4143699003|56012099006|11063799006|261026121527099003|261022105027099003|261026140227099003|261021121427099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	stNjKzv1huIzFWVOIpit/hjd0prYAV4KrRXVYt8zDvSrfcs94HlEs8H2n/+bLHCaR5xLzBjNxNiEhl6QBUtAPRAUbpOKZbyIF2pWhfu8lmnHxS8YyToZMnNu62qqBfguRsBL0qIXk/ACJnUL2a4AegM1hRgwsPZdmRqSXKDMU2utf8p3Om8ntQw+1sqJ5cY1zvgcEyIrXf5U/Swv4TC+S3l+4f66hx5qhU3SBJu7NvQt5lTj1THtLTk63wVhJbDxJ0BSWg6R4ui5gAjty5YtvQOHEmy3jfi30pAgEcXm/zbviwr6SHltSPAUCjLCtYx9PZ4sl3oWrVo/4b1z07FsM6eSaX6aS5Yq1bRj/PG3qY4IpVs1YoPuf3x9HjS09MFS7g50umf52cw7x4Ywbag+VfwiHRPqIPM/wt96+Zb8WffXRpSwOIfXzqcpiM7mC8b1psissCmHpxH/pepAlppgoghooklvGkdmBhozOf20aaOd1wLH/MSEwLqZfSBcN79cRR/YIeZlM3LtkClg5kBkyX3EeHNwq+6IJVGfp+8INokF+5Ir86lmCRHg5ezZCdjdKl2MOAlB5GX8SZKtgbacuqMT3jHsOp0DXz0234oKczC9NGoSLJMFMn/VmfxERK5IbkK2UcaHV2ErtOwLnIV7C/ei8qyUhkh9617w83xM/kVWozExteoEs0tnmkc89rP5r7dvnMAfym+4y/5uH+lNEGJcSc7cuwMnkZlZgP5Xfko=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(261028144727099003)(38350700014)(4143699003)(56012099006)(11063799006)(261026121527099003)(261022105027099003)(261026140227099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S3SRZf3Pd9BCF7UOdIhAH6z4U2Cw+e/AIV1FR8HhAR2hYphlEyCc8GolYflt?=
 =?us-ascii?Q?f8wqE3tLVmQEovMMhCT/sy4uOQmSo+FwqYU8JBruEqgqAFZAeqG/afAi1wMO?=
 =?us-ascii?Q?tdaIyh0ezPT46doizEiDTg0AzL6SeJtU8Cs1Ksr/fQRzQojALxQooY/pY75H?=
 =?us-ascii?Q?xHh1aDEbbyz3sV0UiqAhgqQgo9U/AN0zhVTsgIX7Jz89f5QUuTMYuYqFGwxE?=
 =?us-ascii?Q?oLbY33F1L14xpTCYLuAa3YQe8CuxWTc8TtKzJYwDfylePPU8HQgCzvftrtIv?=
 =?us-ascii?Q?+ngt0gQrSR8NxiWwuXJCAWA/mtpa90WRRVNiqXBM6StbD8a4PwHM7E4DsumL?=
 =?us-ascii?Q?yYyB+4wcdxFySekZgh/nuHyUBdf3JLPryfdGNigPdjTUjjeNr6o5HkVoe8Yp?=
 =?us-ascii?Q?O0nORQTuoqHF364IL2Kh1JmWMdXe73qLSjYG5SWPHquPNsUUmAJeEtlGgrkJ?=
 =?us-ascii?Q?OHPx3O6ak76XAdtormO0Bg39VZi3OtQsqxHE5zZi3/Dcj20gCwGBtEy2TM18?=
 =?us-ascii?Q?YMfp9DI8WpQ6RT9SVOR5ltmGzHSnODFZkF/Zr7iwxg8M2LJtq/0ns1sHqt/6?=
 =?us-ascii?Q?LECWtBWWvUfDUKRkgcWlz+r5ZlTAVMpHXi45NGI27OBsyBMIfx5TZeI6hea9?=
 =?us-ascii?Q?meEx/6CYPWTDAFFRDtl17N8QFxYq42gci0RrtgQ8mpjhWSNREWVrCxnnQESI?=
 =?us-ascii?Q?ITkBXVPQWCvcxOi7Gn0TkjWSfCMFF9qBTr/v44OvHSUcW75RCIzgS5t5Uw7d?=
 =?us-ascii?Q?PMRkyGOEh7Ahmz1mHs5H+pJKrNyYzNAQU8Dczts+PQpFBNQXhIs9xF9h0non?=
 =?us-ascii?Q?rvuSCN9lYy0zfNAbFH6emIiMXQuESLovOck9rUJ8G86ur3eAOdAlRNuhzijV?=
 =?us-ascii?Q?g4zg2Rf5+SjHkuAKLUZvdw474nPAqzqLrVANfj5x8mCyEoo3zMdcVEmXEnl5?=
 =?us-ascii?Q?nfIiSJWVR8vEOBjCW9t+/I6wXSSBmSnHK/EYwX6KEAO9p8FawQYnbc7G1o3u?=
 =?us-ascii?Q?mNMh6ZF9/glh0EdMok+UHM++ywtnPN0Ug71KSi9tnFmwLNlwdOZoTQa8bZwf?=
 =?us-ascii?Q?9YupbpoS4LojC+Vful0Mn/UlihxQWb02sGguhzqkpaPBHBzY8kT0bsDftile?=
 =?us-ascii?Q?bTQ9C8Nkd+Rre4DfIBCTWvpr1XVvYH7Kzura274Aksa5uTGXHr18OBejffxa?=
 =?us-ascii?Q?/KAa9Ssq+z3uPSJ/eP9XskojyePQnyh7R7S78bom9BSeKcFfLYwrbppUIeDL?=
 =?us-ascii?Q?xJWN4J+TjuBDZME1/3nATYwGev3tKh5hiaw7zNsaX7IPJKjiLa+nKoJ4nx6l?=
 =?us-ascii?Q?RFWOD7GTY3XGIni040F2zGo+L1fSVWBPRuAZ/070Q17KWF2GX5YNbf5/u45W?=
 =?us-ascii?Q?cVRhGMQPpGNQ/vCOsWUq8PUlN9VEtLfdkx9+zllbxrDUqATnR1Rj/OI3pA69?=
 =?us-ascii?Q?BF6OuUsz6bjCpiquznMB3nShERch22v8PDXYZS4a2I6HDjGmxtyuGfiLMjZz?=
 =?us-ascii?Q?P5tf061E+8v/r4Skxqp4J66NZi3GP68sYcuh60OlInV+9auw0+Eegw2S4OIK?=
 =?us-ascii?Q?aiUwNasGUjlCZZHPpTWtTB+F8iexpMz0jIHM0vY7Ke/QmGGBnP8rFoyLI4xl?=
 =?us-ascii?Q?zcumsT45TGp+BszLTmcXbZmLISVUOiDRlhBapW3JkBEFfmR+uViAJTWy9hzh?=
 =?us-ascii?Q?0ElQ+VDmbSlViWI+Y/AtJdFjeBozQRyVJh+7ipIYSRTX3as4CQPc9IExW8LB?=
 =?us-ascii?Q?MPEy+fox1SHl+vL600NMUjfSBifQhMZynDZx/HU3YXSGiVv6S7la?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e632cc45-0af7-49e5-205d-08df354e1f41
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 23:49:35.9619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51fcvcADKsddHRe58AhleHzOphU17H4dthY+LQK8Z8lzefAY4qVGTkH8B9xHPVxI8jTA3f8UCiWOF8vdWYaOt6K8OXqm2u7NCMzNEsRSuLrWihV0uoTDk7AXNiWXu+Pu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304


Hi Alvin

Thank you for your review

> > +static void soc_card_check_tplg_fes(...)
(snip)
> > +static void __soc_card_setup_name(...)
(snip)
> Don't you want the snd_ prefix here too, since you're renaming anyway?

I'm doing it mainly for global functions.
Not so much for local/static functions, for now.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
