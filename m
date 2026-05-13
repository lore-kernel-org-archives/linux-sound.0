Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830E029408
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 00:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778631105; cv=fail; b=rDdRM1ZGgwbSiOT6zpOUz1s7BmXTQdLoRGfkeiGDmbRL/CWQ4Que7TSLS1PaTYUs6hmXVKKvtcC1bmz70tDk+GBPyhRwLSukKGW3IgGIWFiytP827SvMs9QISm2zQgz1Kj7esOnOCmO99UfGCmvJGhJAVyOemI68zcxquujZz4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778631105; c=relaxed/simple;
	bh=Qm1U71+tmQepfVp75aHaOENJP+kSaLyDpuMZbGRDEGI=;
	h=Message-ID:From:To:Subject:Cc:Content-Type:Date:MIME-Version; b=YbaLGGXYnLZWI73uVshk3PAhJcrmDR1HMGWTgdqVpBSZZQT6zACTjL78MqKuHlLi0UYeO7/VbK+Rj+bxM81FaMXzmOL+K+Rowuao1IHX2e44Pz81/x7xx9o25pu6GAjSOMadrfhqCAvhPl1fJ8WWBA4xBIBaFeteZD65SuwDR2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=F3b9ETbt; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="F3b9ETbt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1Auk1erEwcBUMs5ahZ7jGoOStcANfQSQtM6bcNqSLtqzBC18gVstBRFNcEJPFXeagrBp8eQo99Hx8oZSbe91bo6byc0qhUopY64kyPiiNX8uIKH3UeVv4gkZ+cx+OW4D+kfpyR88qnjVlq++I2KZh+LYpYcD4irN2QNPu0JsnPz1JReKvbqPZ1om7eaNXEQ+Y7pVdkrRTy4GTt6gJwXEOLwCFRFqvy3D0gWXDEs9tEV3RFzEqNZVR/URRE2oT8GssondUVBQcSPwwJumO6+w/NSZbBI4oyugZPhfxw8WLpRxjysMjoVVbHll01jhkwtKvuXqjexoxTyVuFspaXiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVarw3+Jf65MHPVctEnvchKxxmnPsmn6mJfXDmxzlVs=;
 b=HglMNm+xxXPIE6EbtZPOxSu/CLxAwtMFOJAAV9Kk83+xmoIpL+wyaz4UJqMfgwo6lOqCDHKX2GU1hyW4d18oAw+Hnj5PmqK7wd+6eIkuIKBt1uP4l2B6D7QRJ55wSeQ0l3TAcMUZewq2gvKPj++1nQ4lYW6cPSvyXCWIOdvhtBCGeB42og0EAJRnMa110dYfWSX58smEK7Rvg7ZthrWCwgDUGteg5U58JkdyaqmYbv04jya4+/z45kWzxW/doZaloO67oyC4ByHs0fwkbF5+Zf9159lqNE+vWNk9dz7KrHxYkG7InBaQN9edJNTGoRzUDlzDtjUnchz28COe40VDQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVarw3+Jf65MHPVctEnvchKxxmnPsmn6mJfXDmxzlVs=;
 b=F3b9ETbt7x77UZhdfUC/pb+VRdKVSCmjEjpJYEwpH7i2r6UJi7wepNBXD0C2f1aVkF+oLLApvuZRPWp/My0Ek5RaVklBPeTRKvqPsxmXs8STTOHVX20VMq103nF7gzC5Z2nj1ZhmztoHKQ6ajLnl0kOxFLjs7X1Iw1OWNEi9SqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB10153.jpnprd01.prod.outlook.com (2603:1096:604:1e4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 00:11:36 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 00:11:35 +0000
Message-ID: <87a4u46udl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [RFC] Expand auto format select
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 13 May 2026 00:11:35 +0000
X-ClientProxiedBy: OSAPR01CA0305.jpnprd01.prod.outlook.com
 (2603:1096:604:2c::29) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB10153:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c69f92f-4195-4b7a-0641-08deb084321f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|18002099003|38350700014|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	KBxjakcKtrw4YpKE8/Y+04/+1yZ0UroywReRPHv1y93HO9Twpw8TIat/1V4I7XycWbql33Z8jzJeyIkeHB51KUgc5VcDegaO5hD2PZxgrnDQtn3VK+zvkm+reWOkrIEUAs8GbhGGxIGNBJo+UiCEmuguXfGznKwcgAbeagCz7xy109E3EXGkKAGZKnqtsT2mY79ejMwxSF8h/l3jyCpzZgQcJkscyfugw81AbOALt7T//9eaqBNSdZCEpH9A7t36o2WMLfn+6MQnV7PbcQ08t1xKOjggNtJ/MATtP9TNXNRpx8LgaRpGzQGUwpN80a43D/zfHvIo7yDP76v8ePwdldiYSTXidl3Soab5Ma121G8r8M5n1M0ovM7eVZWgfjWaKc7GsyoaETU+FVrlqzBtt9JjprZJG74x+c0g72+QpDi4fBs+n2M2L+nCOLd3P/bngVZ9fmoFy3TasJ1F1iS2NC3vzrqT70qL6TXXfS5cg7kTOWPh1KbtQkVG9ruA5DHO9E3ioVJvL6vYz9kfE23r7vctRDtcLzIuM/cpA6RNj5T0RsFGPaLJmXoMr12HOyeUDSozr7V5BkjJ68EfdAs0IzaloxmmvSE/SaqTSI8tmpKIHZO+qq66XTFMHKvhVahkKURNiePC0ki6oUabjYwI0kxzuWPpGAR3oNIE7Mhc9cMNGS+QZMqtJmUOaNnlEvoGC1dAvLEqRA5cRVR1EI2QQQTnAdEriZIEY6ENsisJez58ssaKsnmgGzKafiDqi02+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(18002099003)(38350700014)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?leQYoi3NJ1eOXPmDSVhjglQblwbqPCRwiCpJQ+AyNa/kyscjZyMsO7q6nz3p?=
 =?us-ascii?Q?F5cdo+wytfQRIoXxVYJHKIBjNI+fhMSnXM4jafVEgfGb9rAght5FpVM0x4tE?=
 =?us-ascii?Q?A7XYGe931/CityHRiop2IoTHIxF3Ok961LSjLPFFY35Qnq+hWdth1HtqHCUo?=
 =?us-ascii?Q?vjZ2cX2TGGdK97aIuy+4N4DYGfQb+d47vGJM3W36W2E2iGyecN69bwwuSQKN?=
 =?us-ascii?Q?o+TJrvBf0TFaBojvkK6Nstk1D9+cHXsHQYni3SXKQwgMC7cCLIcdz0S8jRjd?=
 =?us-ascii?Q?LEDtSFfNBYgkarBDGCmhbCHptS5gIX9v0s/16Y7+ph6swxd1H+FuZVI8SAj+?=
 =?us-ascii?Q?MlgAJKn72nhI3yNsSN+O+VolrBZa6J9XZHP/UejlM0ExS/Wc6goP7MdVnfLq?=
 =?us-ascii?Q?E6PPBbLFDehRVh1JhTvNRnfjTjC4rsMgU9ABWG075CkFj1r0VcXP37aKLMZ+?=
 =?us-ascii?Q?zqEczTsip5B1Xq2Zjg/M6OxCgE+GEZYUh4TH+DMK9W2cbOSBYA6hOIG9sKcQ?=
 =?us-ascii?Q?qy3HqJ2UVcDPmlOC4Lnooe5hZR6ICJ38M0EDDY2+I/bkPGJzAg8bru2SC//e?=
 =?us-ascii?Q?nMx4ehLVEIPc10v3rmFVylCYjIWpGzjaA7N2LvJtL4kRkY0ha7UTV1JzhJvH?=
 =?us-ascii?Q?+JDvGmaWTqb8UjE7EpAv3YY+KBoUIcvvfOXnPTU9ebV4OFWyHrTdt8S1z/mi?=
 =?us-ascii?Q?CKnbI7h+SFsD4m/tkyywNtk8Ze3IC6ZumSYUhgoz/QE8WI+TroTGCsU+K+7n?=
 =?us-ascii?Q?dx4j0kUtcHpZx2x5kA1pQvFasAsX9PcsauOR52/3C8F9ylXTvWMztCbbtQrS?=
 =?us-ascii?Q?Oqk1xYvUIHYDo4ZOIDagpTJBDPrHi086VOOTLfXjwTv+2V2n0QbYcX2x+Uoj?=
 =?us-ascii?Q?zohbAB9sTRGSRZIOgvHCdRV8V2+zBYlKg85+/JbaOgxFKUnJsOLy0XcgmV0F?=
 =?us-ascii?Q?2w5bCnMiUUEX03DGey6Q1DykTgYTZKw97SPUasL+2Zb6Zmakc3JKX08OBulU?=
 =?us-ascii?Q?MSL92Jn1ycs/Fh4Luy4t1YppFnjYB+BmfqwvMY+VUuJalonVRnju4cCb4L2K?=
 =?us-ascii?Q?xTzi2tlUF7gGlJZaIWQw8QcQDNIboTOhdwya3U7B3XUeOwXIHuLIcwCS7UzO?=
 =?us-ascii?Q?XPi1qDmSIcp3Lu842r/ZsS8Nb4WUSE0tOVu2WG5CFe01qF2ExDsY87wG5zxn?=
 =?us-ascii?Q?bDNf3ESAUEI4Ob0XgA4stKKdw09XvRqLFrdSFMDqKCFZxvZlCzJ624IUZq/k?=
 =?us-ascii?Q?jtAYlkvzy5iLUlDpKnG8HVCTxT/Hq48xKOJUiGRdPPNGlco7tWD80nK/Dpyf?=
 =?us-ascii?Q?jsMWDSu4YMxonbJJEND1ZonhLhjkvWYp5MHT2VU7+QKCYa66IrS+D7zrRhKp?=
 =?us-ascii?Q?9OJZbtBPUQD1nDGXQYL6pS8rGC67oVsrxaNqYvFmU4wSaun8cwXWfMnXlqVv?=
 =?us-ascii?Q?+21KeNqdhjcE7tqbyQ/hKHWZHWGDGs0K+ZvvkrclqRA327a9/VyRpXKNWVMN?=
 =?us-ascii?Q?iuC1NA2y1qbxgBW2pkuh9y8EHMdrDNy1DGj9i8oi30aJ5c3XcHbW7QcFVycq?=
 =?us-ascii?Q?+DbGfIIh+GQ2XuNekFZe1UwdY/thO/0YxnkfU4MMClT6YCweHtnzLQ48swbO?=
 =?us-ascii?Q?UvD+vJgxWoiZvUYO8Gyheynktsh8JS+/FxPbeg1m7AFjlrb4qKTOOUdrFCB2?=
 =?us-ascii?Q?tfkdMDfc6ChpZ5pNqHKx9e9BGjDJSTnzbMCyUMFM/mY+emhTR9Tu8cgzobvn?=
 =?us-ascii?Q?vTjm8NXCQZsybChvYX2gv/SJcF2SuzySd3zgLop3Xbmi5P0q3DXg?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c69f92f-4195-4b7a-0641-08deb084321f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 00:11:35.8404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uCbezhCZ5wwXIyRajMt0xXI14pY6LqG2Pe1Lu8Eslref6U2pkdAQ5Zh/skpEKmxvtsrN1IDlqxpnpZ3GKo9/BL6QJNHi1E8fEzZz0DI9xDghZKZ/feB59SH1Ofu5qon
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10153


Hi Mark

Current ASoC supports snd_soc_daifmt_parse_format() which can specify DAI
format by "dai-format" property from DT.
But strictly speaking, it is SW settings, so doesn't match to DT's style.

Current ASoC is supporting auto format select via
snd_soc_dai_ops :: .auto_selectable_formats.
But the user is very few today.

DT doesn't need to specify the DAI format (via "dai-format", if both CPU
and Codec drivers were supporting .auto_selectable_formats. It will be
automatically selected from .auto_selectable_formats.

But, I noticed that current auto format select method can't handle all cases.
For example, current .auto_selectable_formats is like below

	static u64 xxx_auto_formats[] = {
(A)		/* First Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|	(x)
		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_IF,		(x)

		/* Second Priority */
(B)		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|	(y)
		SND_SOC_POSSIBLE_DAIFMT_DSP_B,		(y)
	};

It try to find DAI format from (A) first, and next it will use (A | B).
But it can't handle the format if some format were independent.
For example, DSP_x (y) can't use with xB_IF (x), etc.

So, I would like to update the method. New method doesn't use OR.
It try to find DAI format from (a), next it will use (b).

	static u64 xxx_auto_formats[] = {
(a)		/* First Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_IF,

		/* Second Priority */
(b)		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
		SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_NF,
	};

Switch old method to new method, Current auto select user need to update
.auto_selectable_formats. Fortunately, current few users doesn't have
above limitation. update (A)(B) to (a)(b) style is possible.

	a = A
	b = A | B

I would like to update method, and add first .auto_selectable_formats
support on all drivers.

One note is that auto select might not find best format on some CPU/Codec
combination. So "dai-format" is necessary anyway.

And, one concern is that until now, there haven't been any big problems
on it, because there were few users.
But if all drivers try to use this, it cannot be denied that they may
encounter unknown problems... In such case, "dai-format" can help, though.

Because this is very challenging patches, and need to post a lot of patches,
I added [RFC] on Subject, and select main patches only for now for review.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
