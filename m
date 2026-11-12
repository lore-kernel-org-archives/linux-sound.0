Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794488324;
	b=M16M6IY2KvS5D0BPYj5UWiBE7aQ/KArvWKsjzKVl9/gbGD9DreWL3Hg9PHJ9dtb9yiIp
	 Ibuh7DV6Li44cMKaLQq8rS5r8fU7PGfDJiAr1LeItskZZbL1VudIdJQ+48eaoXiDEF/D+
	 0YkcwHwJRUjp3poPIDdIWISZdGGn7vPr6Vwna5FUxAbiu7b/2DnbHOfR0hPsGktZTZSOI
	 Ov0H67gpFMvzxXNLlWiB84hnaMg8WPtRXMBsncKqmtAH06gf5JOlRqAymFsbXsc3vXDuk
	 szr6cbDdwZ3AlcUKTOAuWvGLFFbwCwlauxNDKsBwOtFLYwsN4+1eJcwXGpfq556hBnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488324;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fJe+CPkFP+Luonvb8Xcm7xkEM0UBuoyVrBVMGgrAC5A=;
	b=SDkAeRZWFDGKYImAHEUiAPR8lHKgaRw+gyBU8Ef0rduKFK91mmB6fV1OgAR/6r/ds8Tl
	 6Ce8vBQiQXb/EiiRhRR0QRl7Nc0tSYnpLEile8KVlASc+mo1qqjIPaoyIc2VmcGrsvHB2
	 Nm5+JQcTo0bQLW9C9iVZlCrtbO68JY2AmRFnOMAlc9pAuMx84XV309QGLUw2EP7ciQctw
	 8PXfV54WQghsvdc0imC39TYyuTYPSb2KKnDElJ2ZXvAspLdMK0ShKd3KJ0aXFZbTQve9t
	 JoJNJ4YvdcgFLQ3+VyUv8bfyQIi1SoDR+GGHLOYYPPukNeZZZdvUKc8Ql4NktU/1gYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=T89P6pu4;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=nCXZA7sO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20365606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 12:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20365606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=T89P6pu4;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=nCXZA7sO
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBI0nu1825451;
	Thu, 12 Nov 2026 07:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=fJe+CPkFP+Luonvb8Xcm7xkEM0UBuoyVrBVMGgrAC5A=; b=T89P6pu
	4KPWd0dGGajzngl6TVMJ/vIGEUXPnICWg91S30Yghtl1+rp+GKBcYnY9B3QeHhds
	HasgfcUqSCGksE4BpiRYxk1a+IDL+pzbZE0aUhfbVPeJIsCZptZIEBGmJ3rCbsrq
	aCKRT5aw+LcsXlwK4hfrWS3smeS53e7iFaGDH499L/K7pZo0siR2Hm6NQ6S/JniI
	NaD9+AjLhncIrsYpCGRYqD7HXI/HoQ6UiFIL+8rGGdwEyT9s8gQ1d2mn6uDc8LEe
	DGzD1+eHZa8xLnMElNz/gv8ErVcaOe+vaym40rXtsG0CeTWJxcWDLfRG2BpLZh4n
	Ij6Aalpa05CZm7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=fJe+C
	PkFP+Luonvb8Xcm7xkEM0UBuoyVrBVMGgrAC5A=; b=nCXZA7sOz5droT/tna/jr
	ruEXM9eFeu1ibQon5Ekg9ZqhHmrYEZDMuOgBmxztbUdyqUrpH3yzuYFJ+CBl/l02
	hC+BUP7Rsl8IzgI2IetrwtyBZDLEXkj6cPDbXuvI3YY711YhHbWKiXEKRVEA306/
	sxPAMbbvqElVoDMr5mfstdhviiFSI6NBTZc1CQmlykYJkunJrrznd0oOGKyoU0M3
	k2rTM6eZ6mRaeKdsNoYQiTE4rJrK1UuCSKLiEFRsmKPkN2UIKsXY+Ya8Oa62gEq5
	qW0Ge0T1bjUPOuT8EHH6TlhD1Z96Vv0Cw66SyP/OcYcm3FKUTjRHvMybCoh6gWIW
	w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010027.outbound.protection.outlook.com [52.101.201.27])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hwcf8ge29-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 07:58:39 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2Akg2YziwUnyHlaSIfRmr9ZKtgQ4z2ilYbvlChj/OfqxdlBoI//sKzckw8zuqt7RKPvsWFi88HaA8pv+uKZag0GIP0WdKJFMxgR6ERbVOtGWiFwv+7kiptagsXW3CkcZZXflB5zam7jnVD+OMfxvZHUhuHBh8X9KHCB150sLtY4ZzV654tuRHYwODVS4LtlSCwHPNWsGOS38JSQrjRk+3gH/GcwU6Fmb8214pWdUAzz+00ZrlOe/VLBXXHtfj0I6tlv1Ny3hCfFqSVQinfrbM3McsBkyYCB+gYLNo70oVe2bKb9k8L2bYHOcQL0GT5oYmMrRFbr3z/WqFOX6wHBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJe+CPkFP+Luonvb8Xcm7xkEM0UBuoyVrBVMGgrAC5A=;
 b=KQwKKwP4aGecqMJY1f4VljmXBPVgjOsuLpsm5cQ8h7tva9iwpO20eNbFEKSuCCcbY1UfipY6CBHGvgj/EwWSJtr/eb5n4i8lYtDQ74JbUy1HgWvfQIQiv4l/Ri4q0tVBzp5tKIc3bel0rdLEHzrkgLw3gIryWkjW553suyCpI82z56cpHB6gDnH4j0UaS7VqmX247SMNps/F3JJBboTxJE+tximIgCNLTBusyG3zW2dAPS8zCsN1uFvK10udjlCbAopNwexXCSzmyBMdVhd8elRSVLPdyA0KVN2vScgAb7qTBM4Yh7vQH49chukJfoQ0C0zbfDH64fCP8o6TFY/VNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by IA3PR03MB8476.namprd03.prod.outlook.com (2603:10b6:208:546::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 12:58:38 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 12:58:38 +0000
Date: Thu, 12 Nov 2026 13:58:34 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 05/27] ASoC: soc-component: align
 snd_soc_component_{regmap/regcache}_xxx() functions
Message-ID: <avW385QCHY1T8JFB@analog.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
 <87se1628m8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87se1628m8.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: MM0P280CA0101.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::27) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|IA3PR03MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d44949-2146-4ee0-a4de-08df40bcab45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|4143699003|56012099006|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	g2le4b7X2zxYN/tw0LyJWbbObQuyCJ5gm/b0Fct/xk1yG+4JV/+OL5tJe89Vvssu1AQwEmp0wbh9oFNv1CG1vp7RsB9Ush0cAkXggI40a88jVPursHDlaTU6XlBS2hcvQHpSZ9QJP/0Menb1wD3qRFvxdFCBH2R7pTNzt8uSEbsmbzVlCG2l88FJDPfXh5a8W8iYWRjceSEWsBHlnovQe8+V/OjOUAdeIIgoxD8086ixT0F3dG4GeuZnm8///PyjNEMVsmyei84FiVwImaIoD8k2Uq+G+UvUtJMU6bD460KRZUEfYeU5n7gx55EV+hr/8PfIn5xgUafb1NZ3DuthVI5I+Uacj4oPXhx5fMG3/EMolOZhZopGLqujg9/yUXm2ngKNbkEbxXNE0Q7cntfTUKRr7H/BFx51t7XP17ouVJy+plGMp8ZaXl5GKlKSZNChJGCuNSHj9MuRedeuYeiQnUIjmmtEy8bPhsrMs3MLiI50i0Ae09yjZrkq+tAABdqSVRexdFQuyyz5a4F+KrIb3KkC+5FiqQ2otSgzNKjnuQk4uL70QN9Q2I1pIxGKSkvQKHIidJDz212lFatN1cc/lgYCgqT/AafsH7q4zlqGw0E6+UwKTDhljVFT0WzTTMFt5km/K8ySkXbr6OSySo/821oOPJtigtl+zVj79kNLoFY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TytzNFlqRmpzTlFucHJBd1UzQ01DTmhsTnlnM1p0S1NrOW90Qmc0a3dXN2dz?=
 =?utf-8?B?Q0tpZEdjN2lrMUpxZ3g4ZHdNd01mQTdQWnJiQmY1VmRCM0pFT2xWQ25sU3Mx?=
 =?utf-8?B?MnZSSTBYcmZHR0tHNkUwQ1VNOG5uSkhNbExrRkdLbzY4Q3V4QWpRSEsrR0FH?=
 =?utf-8?B?WDZhT21RY3lkK25EU3labnZEOTB1bnFGeEpKanBpRTJHZHdaRnpaQlN5bGhO?=
 =?utf-8?B?RTBRcG9lcnNEVWRNN1lMV0E3L2N6c3FlL3NOR29zbVplNXpuSGlLbHVJRzEv?=
 =?utf-8?B?YkJqaStOMlU0VlNGMjJxUG13Qmh1MGowSEZRZnFCcm95RE9DM1E1NWRoSFBr?=
 =?utf-8?B?ZmFlRmhqZ2hvbGl5dHZNTW02clpxdlZFbmc3SkhRaVArcHNyNzZHSDlndjBz?=
 =?utf-8?B?SWhwS09uaGFhb0R0a3pVM0dKNW9zck1LRGFZVnVCcFpvME55OFBLRjJDQXJh?=
 =?utf-8?B?eUZBQkRYd3ZiTWNhYllDTDdMLzA5SnFpUWw1ZzFSd2lnY21MK0Rkc2ZXMWhI?=
 =?utf-8?B?ZFpVbXRjdmtSRDRmbUdVUmV5MzQvcmVIZFM1MnFzQ2c3Z0VVYjNtUWNBditN?=
 =?utf-8?B?SGp3RnBUT1Fad1NiWGp6dUpBY0hZelNQb0hmZlJSZlVEWC9COWcxaHFZZDBZ?=
 =?utf-8?B?S1ZMMlZ6cVpBSy9NVXZMWFdodklmMHZXRzVCL24ySHJDeWxZU1hJZWhzU29w?=
 =?utf-8?B?TkUvbFdqaStCMnRERHBLT3ZHZ2o1bXpQQ0pSSUxYc2gyTzZWeUpWL0JJc2My?=
 =?utf-8?B?MUhDajBtb1QzWWx4ZVBMUGtjUVR1SDFOSWQvMm1EcFBkbnF6aFhnOEZjSzlN?=
 =?utf-8?B?aUJ2R3dmNTFMYjVCM1c1VUcwaTZPMk5WWWFrTzBmQk90enRlN0JuVHpjVVpE?=
 =?utf-8?B?TU9EWmV1Nm4zS3hwb0RnZk9GdlgyTi9DL0pjUkg1SHFoMTV2N25EZERzNjFG?=
 =?utf-8?B?VVB4WGpWbit0QTdvVmxkaHcwbFNad1MzdkU4WG1VVlBxaTN4S21qNXk1Vk5Z?=
 =?utf-8?B?bHc3ekd2dExxMUNSTWdmOHYvV3VFeWphOGh0bWw0K0NqRG9NWjFueEVZMXRP?=
 =?utf-8?B?ei9Uak1iWVRhbzhxWDlZaWc4eW9ZN3hKb1dMZFRQUjlpR3RYNCszQUNSRjEx?=
 =?utf-8?B?VVdObUlNYXBySHBVSGNqQzZ4YnNQcnB2L3ROUitCNklGbGhvMmVxcnNPR2s1?=
 =?utf-8?B?U1l1ZjZsTDBjSkcxTU1KSjVNZHFvTGtwcmV3WFFyQzZBMXE3ZjZFYVVvOUZ4?=
 =?utf-8?B?dEJzSUwvb1hJNmRQVHdpMmFqazRzQlJFMllPUFRKUUY1NFF1TUREWFdPbmZu?=
 =?utf-8?B?ZUtUZmNXWHhzdS9pMGxHUHdnVnpLRkNmUEZDZk8zaWtZL05xNW5uUTlQcmI3?=
 =?utf-8?B?bGI2c0hrRXlSR0pxMzJvUlJFZWxraEVrZVNDaWh4RjVBUG5WNWVNdkFTK0pK?=
 =?utf-8?B?YUlhdHdISjJtVGF6VTNXT2pwS3JXaXJRdXhWREF0bHdXNGdFSW5Hd21UUVo4?=
 =?utf-8?B?ai9wUWNVemlRemhCckEzM0oxUEJJeEpSc1ExaWFVUHlmK0FLa2JuVS9LQzFm?=
 =?utf-8?B?VTJTUWRNTUdOdFVmTzVpdWtTWHU2OGJJZENJQStPdEgxQXcvQ0tEQ1JNMzhP?=
 =?utf-8?B?dWk2L3o4ZnR3eW5RTWZoY0xFV3dNblZFaTE3UlZ2ZXFpQ0Yzcmdsck9xMVU3?=
 =?utf-8?B?blRyZ3Nmb1BrT21VeUFJaVFWaDh6aFNMNm1pdFlGQVVEL1FzYWhYMU1rTGZr?=
 =?utf-8?B?QlNYOW9yd1RCZ3JwSlVZaU9IMEtsWlJJTHZ3TWVoNUkvcFBIekxSMkFyT1dr?=
 =?utf-8?B?R1FaRmNaMjJnOHdmRkNEZXhOYWhoZWw0Z0lJQTllOU54cmpHZVM4UzNxdTJh?=
 =?utf-8?B?K2RpbWNrU0dmMjZ3dDNINlJTNlhwTTZLMTlIK3dpRmxFSHcwaFZKMlhnQ2Fa?=
 =?utf-8?B?b0xvcVdDbnVHVUFHYUhqMHBnbTg0bE1yR2RGNThIWHAvMzlDZDdhSFEyT2xn?=
 =?utf-8?B?VU1UQ21DbCt5YndwWHdzb2daTTBnam9IR2twNUhORC9LTWFTdVYxMlAzTXlZ?=
 =?utf-8?B?MkpnOFlaSEU4R3puS3ZNeCt2RHJyejEvYjFwc1ZXT05RT2tzek1GMkptdVpW?=
 =?utf-8?B?K3cvRmtiSm8zR3pGRzkzQkczbGhXbzFuWlpCV3VxcWw3QnAzTGtzR1pzRlNV?=
 =?utf-8?B?YzFwL3dTTjRvV2hXTHRUSElLS01HV3cvZ01zbEJrWTFlRVZBK3JsbTBZdzBU?=
 =?utf-8?B?OVBZOE1lOFBDUGROMVd2amowcW9lQWdwZFl1aXJzU0twck5TUG8wblAwWndD?=
 =?utf-8?B?VEpGaHZjUHNCeVd0eGVZWW8yNVVlWXY2aDlwY3VFWEJDY2ZKVHNXUT09?=
X-Exchange-RoutingPolicyChecked:
	b8iZ4sCeUXD61sZA2zEENV42MHE5fier0Wd90dXv8fj810YpYikLWKz53JDvdhIO3R0jfQcNVHmnbpxZhdEIu0iqaZhL4fyPiYEmb6j2PiJeZr2QoHpCBkgaAwdzDLkQIaoPMtiPpSY64GR4OLGZKRQ9RJk4IK9WqaCaYelRFU3GgMmS9mprwFrf6+VDeLip+XFLXr6F+5uuYkp4GyMTqaP5bj35DdhbjFR2hH34hjO/XbTw0QSE3qaEoZlIAcWdRt4/vt5dGaZKB1aQFQ4cXnuhqn76eE0hWspi9QqMkiD84mJ0l8j9er1ptAFGDvLmJQ0AuNqOHx6StnUafT3cTw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d44949-2146-4ee0-a4de-08df40bcab45
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 12:58:38.5156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: et3n4Urm+J/v+8n1HASMMyJkrTmIxfu+3K25o8E2mJ6N1YG0CPxo15MSvuR2R4NUhTm3no/F2UILPxwatWbKDKUBKDZT07mAtgCGPADWSVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8476
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfXywTRmnGdBFlR
 Vl8/pFA3wfjU4oRXgwEEROvAoZhFUL+rTNrn9cUPbdZuMJTJowLH872EInqifduJi1+MQTrGYo2
 m20rb9S0NovqyDfnmxf7lPTMBX7H5UGmdtBu/0d7z97us5bpb8GE
X-Authority-Analysis: v=2.4 cv=E/ZYNqdl c=1 sm=1 tr=0 ts=6af5b7ff cx=c_pps
 a=jolozQ03zpjfpn/maDJ7eQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=Rem-IzhZZijaTF8li7wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX/4htsAjYaAk5
 8LXS6Ij76m+8TOV017T3bw3ZdIcP1LgnwUPJCXzRaL06vpM14HucmvIgSDK6yFyGukKGrJkC+85
 7euTKBGS8SUwsBUdwUH0hBoJpHOUM1O6lDfBzcd255fE8vKk4QfehTJ0s4HMWmgWhR9Lm4m94od
 Csg7ibqqQ67PJYX7lWaS5pujUyn0QjONCMDYZ2Sqg/ixHp9bcJUHWXWqzMxH0Xtp14xpkpFSUIT
 ucl5/r+3sZUqd0aznJyYIRdDvbJvP1QX+lp/a/sxnnL4/e6mcEGcsMDh9mB69RqpagyvWj96ohB
 bgO4TVdYW51M3mj6DYM/BngwMBfA41STzZH/8D9Yp3RE579FjytSf30mbPbABWATUr6+U1AagyO
 q0+G4nZLtF26TiGU9ATRxs1KYGRSQLpQCibt66f64ZYwKWdiwrwicUfnMQgJYiqL9E5I4y1w3B+
 4C0MXYNQVQrnFsImFcQ==
X-Proofpoint-ORIG-GUID: CSOkDHuMLSemSVyGe16noAekxdPSB8M4
X-Proofpoint-GUID: CSOkDHuMLSemSVyGe16noAekxdPSB8M4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120051

On Thu, Nov 12, 2026 at 12:31:28AM +0000, Kuninori Morimoto wrote:
> Current soc-component.c has snd_soc_component_{regmap/regcache}_xxx(),
> but are located randumly. Let's align them.
> No functional changes.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h |  6 +--
>  sound/soc/soc-component.c     | 92 +++++++++++++++++------------------
>  2 files changed, 49 insertions(+), 49 deletions(-)
