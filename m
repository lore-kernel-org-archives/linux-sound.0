Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.46.76
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795879310;
	b=0esvUVQsBXcJvKW3lWzfm5agDAy8F7Lp0ViFZol+8rkxPXCP2bz0m4w0tiblXzbh9Yec
	 /O7howHERLxL9s4jW1Y0fz7Dm2oMzN6K1hx6MK5oVUjvv2iFSQDKZFewkJR1cFp5hrc0R
	 D1KkWXr6hYD5Lv4LrOKJwe4M+Ria38vQQ6x+JztGE5TVcwhjMkWZyjF3xqiNg5ArJV/t7
	 wq6MCGQk51CWKcJixZLNBngsYWYTg49G1LIN3gYZFHOqf1UH//57pV+Z+sE9yWiAsGQ9S
	 Udlnrww28s8GJB+KH4xCpmUhEekv+CfX/LdwZy1GyjH3HLc2pt+qC8sWpnYa45pKsJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795879310;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:From:Subject:To:Cc:Content-Language:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=6eduKcv0K29Z4gRRE5/m4h6Mj2g3uXORKV3JVJsy6Bg=;
	b=S0pHmaKvqxG7KjRHXdldRbwiD/CHuIZft27unrGvNWftj6+zZ9uEQIvA79GTCBHqffGy
	 t4RLNbBBiCQR3YViFdvOhgIgdduAQAtFJvvGaWKyafMJFZCUvdurtXSTfiIn1H8M6vPUM
	 4dmHWh3Kd1HKx1iW7MjPSLNwiNvtUnPKIefA0iJrvnhKUH2D7O3qBul9MU9kDF3Giw6iH
	 UkFiZaIQRY774MxnloKYoG+cT1y9o/GgUbOCYm4TvCGBnAzEWV+P8N7/+QrxtkluqJduh
	 cgedI0RkFdwbgN2rLGsRBprsEXQoP1zFxSirlqvMjOgTkWpr33behdGKlyie3uXSPVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b="DuX/d30F";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.46.76
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013076.outbound.protection.outlook.com [52.103.46.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2775F606A31C
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 15:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2775F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=DuX/d30F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFxD32pDcVwQozyXarkk3DEbXaazcTtmYNe0fQsncaZgc+1UqeVwqOFZKU1Tl7jPshavFGCYl/2ErDUxTMKFJKbsejrllYu9caBUhejHoo0hPdx9dzkkrgK/rLTttOoikv+ofcCJwaiSazcCBR4qP4pC/aNLsMfUIxOHXljZozCL2AD4acVwfcHq0XhBnmIVzKobGuhMpEviGJM5KlAkJmRJ2kroFPFc8iHkr7aJ11gNoHNrgwEBzGS7sbApzLEbcNajUC8xRqeJZm7q4Lep90B/cvxH3Pf1nOyfCfnGEoW/bqSHg3hjB5AXU/V46TBG45/wdbHhJPFdL1Q/jiiGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eduKcv0K29Z4gRRE5/m4h6Mj2g3uXORKV3JVJsy6Bg=;
 b=d9+wOiGC96eFKLLXnLGRZzHXRl5PaFKxlDPeDTvaav3Dqq3Mi5EafveplI/doV2ks9v+XDjcU+rWZsZeDOG4CyBxJljYjOdBQFjGP5E032pvHHlBTOlhy44J7+F0zuGdeZJAAJ4Id6BAeR80aMfFIDZ8J1uOV3UNGP3TaDv40iegqxsQtSIB5eUBRdwnDWqSaXzb/Duwt0oSYxalBsciBv/7h9BJat+HYP8r8vJN+ezGEhmq9T4zyhx50nNC0md32900DzbsI3AvBNI2c50sT2Z9tgGQAHOVT8grq3+KIroPAQbnpa0mHD5A3quFgkNFgJQYj+U0PpyQa5oUGKw/Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eduKcv0K29Z4gRRE5/m4h6Mj2g3uXORKV3JVJsy6Bg=;
 b=DuX/d30FCs7ALek+CEcAAVGnWXkl1YWmgTE+bWIdn3sjQTY4yirVOwtXu6ZY/MbzeSbClvI/7i/6Ih4NYiM5Cw5215xuERH0ianM6l7+K9GTF6tdhoierTPOH0h7APosxaGqSY4N2heL2WV0+pYVJTapzdvm319IPSaRcdbtuN2d6TqE/3sAFxxx0f2oSWsndhDFdYIUIwAkEPsduXxNhVbGX61UBdqV3+t3+XvMdA+0NSXkClzGf1gOSikseWAgCcSu+yVrXKLK23F6i3bEV9W8Pv+tu5wGHkz/E3mZTzukXdEuOKrCWYgDuPQYKWmAEkda6LNp/FxgvTvA2Zy1TA==
Received: from MATPR09MB8625.eurprd09.prod.outlook.com (2603:10a6:250:4d::18)
 by DB8PR09MB3674.eurprd09.prod.outlook.com (2603:10a6:10:117::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.11; Sat, 28 Nov
 2026 15:21:47 +0000
Received: from MATPR09MB8625.eurprd09.prod.outlook.com
 ([fe80::f140:6501:c11:b540]) by MATPR09MB8625.eurprd09.prod.outlook.com
 ([fe80::f140:6501:c11:b540%4]) with mapi id 15.21.0662.007; Sat, 28 Nov 2026
 15:21:47 +0000
Message-ID:
 <MATPR09MB8625D87EE5D0727EB02F117EC3402@MATPR09MB8625.eurprd09.prod.outlook.com>
Date: Sat, 28 Nov 2026 18:51:43 +0330
User-Agent: Mozilla Thunderbird
From: Reza Talebi <reza.talebi.73@outlook.com>
Subject: [PATCH] ALSA: hda/realtek: Fix headphone buzzing on Acer Predator
 PHN16-72
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::16) To MATPR09MB8625.eurprd09.prod.outlook.com
 (2603:10a6:250:4d::18)
X-Microsoft-Original-Message-ID:
 <0a3ec3f4-a2d3-4e95-99af-994571780d1f@outlook.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MATPR09MB8625:EE_|DB8PR09MB3674:EE_
X-MS-Office365-Filtering-Correlation-Id: 259285f9-6f46-4d61-4933-08df4d63514c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|4140399003|39105399006|24021099003|19110799012|20031999006|8060799015|5072599009|5062599005|15080799012|24071999003|6090799003|23021999003|25031999004|1602099012|10035399007|40105399003|23121099006|3412199025|4302099013|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1pLOG9MZUZzZ1FUOGpxUGdSTzZ1UHRLUHY4V0JzS3lUOTJKZVRkZUcyVVRC?=
 =?utf-8?B?ZFltUkdGU0t4TE5OakdwWXZlazIzU3BEZXR2aHk4ZkhVeDNITkdyQlJURzBi?=
 =?utf-8?B?dmMvM0IvS2JDUlUyeGl6eEVhcnZoY3p1K2dpejJOYnBBMkNPMU50dUdsek1s?=
 =?utf-8?B?UE5MNnI4anhIRTRlQWlsL1czRThMZTkxdFY3clZHT2JGY29KS2JqbWVjL1hZ?=
 =?utf-8?B?aWprbzNEcHBFTWVlKzJUenBTWTZrSTJSTFFubEE1UVREcHkrZGV4bzF3bHRO?=
 =?utf-8?B?OHFOSkNUT2xLOHVPVHNDT04zdklYckdnbjU5SDhockZadzMzZlQvMzZuSWRZ?=
 =?utf-8?B?OTN1aE8ySDNQcGozZDJ6Q2I4VENrZ3ZiczZadkZHTUZEUmtvUEFNaytud2hv?=
 =?utf-8?B?NUozQ2R1cTRTMWxxTkxPTGlrN3k2TGVDL0t5Y3dCOHROb09Ob3FQeGZXRVFC?=
 =?utf-8?B?dlR4MER2aThlNk1oOGFwaXdiT2JKQ1NpUmpaVWlUWTdRQ2dzVkhIMU5BOGdh?=
 =?utf-8?B?YnpSbzlXc2l2S3lzbkw3Ykc3VkJIc0pXdWlLR3JYNkQxMlkvTWFWOEtiUDhZ?=
 =?utf-8?B?cnAxek4rZHY0dXFmNE9Cb1dZVHZ6Q1VEQ2ZUOVpTd2YrbW5FMjNrZldXOXE1?=
 =?utf-8?B?c0JWVTIxNWhPd1J2ZjdlbThZZ2VvTUV0Ums4dDRnVDQraDZmMkNxUFBrU2NI?=
 =?utf-8?B?Kysyc09ZcGoyVFRPRTI1d3QzbE0wQjRyK09xWXdGZzZTVmZIV2o5VlhnUUQy?=
 =?utf-8?B?cnFBRmtUR2pwQUcwa21QamtrL1FwMFluR3NVOG9wRGNEcE1tek9Rd3oxWENR?=
 =?utf-8?B?OWZkVDJNVlphVVJnYU1qd2tYdXJPUWRFTUp1YXVBVnRDcmQwVGl5ZDVYNGFD?=
 =?utf-8?B?OTUyN2psdTJKc2hNVCtveXNsVHR4L0RCT3VpbXZyVnk0ZGNjL3ZLdEM0RGlZ?=
 =?utf-8?B?ZHdDanFrT2lOWU9wd3d4S1pta3VSZTlEamRrSHJsWEhYVmhjTFRSeUtWa1k0?=
 =?utf-8?B?UWJwTXpqdi8vSk0yM0IzOWxMaGwyTzZVTUdzUXRDVUIrTExXZUI5TUx0cFRV?=
 =?utf-8?B?R0VIRFFmcWdzQVh5SXlYY2RFb1IyTkgzV2k4QnROc1ZYd2JFKzkvMDZQc3hs?=
 =?utf-8?B?d2pORllaRG5jVDBkYUxqY0RpNGk5N0tIN3o1cVg5cWR6RWNYZngwMitMUGsz?=
 =?utf-8?B?UUdKTDQyN2VPdTVBVGU0UFdsNGYyWW1HVytETGttTUdXZEh2NlFoSW1ibk50?=
 =?utf-8?B?bDc0L0h2UTY2Q2VGUFRlZFhVUWtEaUJROWxKOEJtdHN4OVJPQUUzMDd3dEVJ?=
 =?utf-8?B?U3p4cGtWMkw3amJ0WDlZV3lGeFJ3L1FNYWVaaDhWV0YxTTJZVW1OR0ozUFVj?=
 =?utf-8?B?Z1dRUlBsTU9qVk0zWjhPSDJEZ1UyVEZaZmg3RFhuUDJvWm43Z05nNFBoWktM?=
 =?utf-8?B?emZjSU9YUHVBWEJmK1Y1UkZlTVJvYkZhYzBhL1dpMkI5cC9FeS94NXJKeUZj?=
 =?utf-8?B?UkhTaEJTSWJRZ0IvRVJhWE1WVXRWVVBIaFoySHBxZi9oL0EydUVrRlh2LzJw?=
 =?utf-8?Q?ewbrtgTx/fcZrNAbgeXsq76mA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmsyQ2s1VE5UN3Erd1dHTXdCNC9CVng3a2lCbkZJb0owbGZXWEJQcWxic0JP?=
 =?utf-8?B?QUNjM2piU1dOc0hQWFp1aVUwZHNLZ291TnNtZzBxNXMvUzhJdjZSdnpRekVK?=
 =?utf-8?B?dmg5R2lNMElzWkNmbjk3ZlB3V3VOVVhCNXJnREFGa1NuNDhJZkNnVVBtSEta?=
 =?utf-8?B?SXJMQjB4ajZtaE9OVENIVkYxSFJSU2VHSXRaZkQwdXZnMzJlL21iK2FNUWNs?=
 =?utf-8?B?NXgwejJZdW1kMWsycXhSN3E1VHNsZ2RGcS82RFRaK1pMenVsb3BUZ0ZuZ1FY?=
 =?utf-8?B?cjVYdFFaTHZORzd0V3FMMVFudEJub1pKTEhNTzdOeHl5Rmh3Vys4RFo3VnlP?=
 =?utf-8?B?SmtpQVBzVFdCSjZYMmJ3Z0U5ZFc2cU13MUw5MGV0TmpXTWwxaEhmbVB0UGFT?=
 =?utf-8?B?cGxkMzdyYkt2M3BPaE5vWUt2Y2xmb3lXNllWMTZ0ZFlZSlZyRjJJY3Y4VFN1?=
 =?utf-8?B?dDBKOTZyMlEwbzdoR1QwQkdWUW9iRGVWTGk4em94QjkzSzZsV3JqMG5xc1hr?=
 =?utf-8?B?cFBnaFNHZjNZNHdGTE41SDVQQWxodFp4SDdrSFk3Tjl3eldNQTNieFZIWHRo?=
 =?utf-8?B?M1hPdlNOaGVjNXZDQlJZYXZEM0h4Q3dPaTN1bjNOUTIvMXg4VFVkZHJvdFVx?=
 =?utf-8?B?TVJlQ0llS1F3aGhjRnp0ei8xRGdaY28xSVhCaTZPZ25RcEErS0pNSDF3ems4?=
 =?utf-8?B?dmVLYmN3dWcxTXphbXZ2b2NnRUViMlRYeW1CK25UN1RraGhVcG8ydi9NZ1RE?=
 =?utf-8?B?dy9Fa0Z0eVJ2WEZDTnB4dEdMSFh3dHlFVEZwYS9zek93eUFldWt2MEZMK3dC?=
 =?utf-8?B?bHJ4SjBoamJCb09aQi9pa1FwZ0RZdjNYcG4zRC9UMzFtRS85NVVjRXBaYkNO?=
 =?utf-8?B?eWg3T2VYWGd3MmtnT252VWV3M1N3KzB1akw1aFA2blJBaXBOY2RCeCttUjg3?=
 =?utf-8?B?SnY0cXMreFJoR0pnT2JlQ3VRQVIvNDdPaTVMVFF5MlVaSG9uZXhpSjFDR3JV?=
 =?utf-8?B?TmtxK05WN3Y2aEZZS003bEprMXMyMXl2U1pDR2daQzREWVcrc0gvRW1SS1R2?=
 =?utf-8?B?dXU4V0txMlhTUGo1Zm5YOUR4VXEwcGtGT2pEdkNvT0gzcGFucUlGTnNCcXF4?=
 =?utf-8?B?T21EbWJ4dkFid1JZT2h1OHc3dEVTR01iSTEwOTJSUk9Ec3MzZ29WR1VRanVC?=
 =?utf-8?B?MDBINEVDOEFEWTRQVW1id3gzODNCNXNkbGcyN21WSTZQSUJmQU1kZGw4M0Z6?=
 =?utf-8?B?MWczRzI2WVFZWXVSR1p6UitFcjlseUZ4MzRTT3phTTZ5bml5SFVwL1hnNHVv?=
 =?utf-8?B?eC9yb2N1SExObDF6d0ptOG9QTVVmbDIyL1IwM3FPOTd0Wnc3a3g1SGhjNU1P?=
 =?utf-8?B?Y0JpTzFDMU9ZSUt6NlhnMVBCbVRCekM2UmdjZU1qb01lUDhSTE16YUwzS1RT?=
 =?utf-8?B?bE9tK0ppZFF0RTNaYW02bmdheXJaZStUOWgvSW1LWnY5LytpbEVScUVOdHlC?=
 =?utf-8?B?NEdUR3ZVV0Rub0lzc2xvRWlVUm9ZU0dkTzc1c1VHRFoxd0wxNEcxTHozNXg1?=
 =?utf-8?B?K2NuV0UvTkMvcnlQN2pLdExjWWloeW42QjlocGlhYzlLYmNoVGxvN3NYcDhQ?=
 =?utf-8?B?L21MQlIvRXc0M2RQdG1zWkRSbnhjSE0zREV4YmFnaGxoOW5zY3lsVkNlK29S?=
 =?utf-8?B?eXYwU3RpdG9LUHlEeDFNemFMaWpyVFQ2c0pqbHRQR0kwVENoYkc5aCtEVkI5?=
 =?utf-8?B?Vi83OHRIUFEvc0Zxa0xYUmdXT29XbDRKK1RqdGZwN2FZb1NNVmNQRDY5bWM4?=
 =?utf-8?B?NlNGUm5XRlVxUlpSdHdVc0Zib2Y3M2t4ZFEvTFRRcmxVSVg5SkpBY3BKbEVv?=
 =?utf-8?B?SDBHbFI1Vm1JZjErOURvZGsycGxLZk1xYm5vM00zSCtyaXc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259285f9-6f46-4d61-4933-08df4d63514c
X-MS-Exchange-CrossTenant-AuthSource: MATPR09MB8625.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2026 15:21:47.2820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB3674

On the Acer Predator PHN16-72 (1025:1731), external speakers
connected before boot produce continuous buzzing until the
headphone jack is unplugged and replugged.

Pulsing bit 15 of Realtek coefficient 0x4a clears the buzzing
without physically disconnecting the cable.

Reuse the existing ALC245_FIXUP_ACER_HP_JD_RESET fixup from
the PHN16-71 for the PHN16-72. The existing fixup chain
preserves headset microphone and microphone-mute LED support.

A backport of the reset and quirk was tested on Fedora kernel
7.3.6-300.fc45.x86_64. Booting with the external speakers
connected no longer produces buzzing.

ChatGPT assisted with diagnostic steps, identifying the
applicable fixup, preparing the change and its backport, and
drafting the commit message. Hardware testing was performed
by the submitter.

Link: https://patch.msgid.link/20261125081636.4619-1-onenowy@gmail.com
Signed-off-by: Reza Talebi <reza.talebi.73@outlook.com>
---
Single-patch submission. Hardware testing was performed using
a locally built codec module for Fedora kernel 7.3.6.
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5c3b383bb..27b38936f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7597,7 +7597,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC245_FIXUP_ACER_HP_JD_RESET),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEADSET_MIC),
-	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC245_FIXUP_ACER_MICMUTE_LED),
+	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC245_FIXUP_ACER_HP_JD_RESET),
 	SND_PCI_QUIRK(0x1025, 0x173a, "Acer Swift SFG14-73", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x173b, "Acer Swift SFG16-72", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1758, "Acer Nitro ANV15-41", ALC245_FIXUP_ACER_MICMUTE_LED),

---
base-commit: 7cd8495c0f16275c4f9abe1cef09a7b5fcd6d046
change-id: 20261128-fix-alc245-acer-phn16-72-hp-jd-reset-1a63aa27a25d

Best regards,
-- 
Reza Talebi <reza.talebi.73@outlook.com>
