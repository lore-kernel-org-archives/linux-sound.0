Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794960576;
	b=yEp5cdj7olbuhsP0gGnMqq6C+i0oJqTmwOTno9MTs0YPcAQWEYXr4XRWYef8Xgf9wekD
	 vabEDqC2qTeP3tmGC3Do7TqNLeqaFWhBKNsUTShJH03g1h5YO1W08boxmzrPFWAGCIdvB
	 V748eBUKOYovQMUmR0pKKa6DmKf0bmEauoA6b6ddYS/OlDI+ClPUYt+yfGlwGAWI/QUgi
	 3NzkbG/AeU2U8wXC/97SQ6KrzQzpp5QfU/VRDDUlEyquU5VgqP6AuUhQ6ArWuvg1528dg
	 yhGizzttwGTQkwZZXhnTn2tXLa7psqCsXlHoJW01f8sujPX6WcdJlseuC/CUnRp6uiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960576;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Content-Type:
	 Content-Transfer-Encoding:From:To:Cc:Subject:Date:Message-ID:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5sqnlJrsKbZIsoZKSsRDbYvDopFWsozmviEn9PR/qO8=;
	b=UPb/yPnfaJuqJVUtm5A4lPmavCXf+nOM/+EzDcte017qer8wikVpOsku9Zs1w1YtbjWe
	 YCS8EluDuCkkkoHOWJSvJqPurn6j9jUsR5OH8Slh0O/EB7yAEXnboezzoI9IznpuVC3FS
	 jKVBDzKnKUVgD0REKBJXKfiobGv4SBQnOmGXNB1HrGD0QzD+0kJOr8NGX9j6siNvs+2QG
	 bAF7CnYKct24k0c+53GvOcw7wdK7RjSTyYhe53Eew7QQT6NLJkvePeJQPFcbUCUMrOQgL
	 Rm6wK2pt2P9BT3wuE0i4+cddH8rvOqBO6mS06nzaaUPf7gpMkYRjMFJC74EC5ZXPSAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=Ybs3sC8P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.15
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011015.outbound.protection.outlook.com [52.103.66.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEC0606A31C;
	Wed, 18 Nov 2026 00:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AEC0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=Ybs3sC8P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1r976CFzMwgVr2pxId9+EjtgHHjkW6IkmYIF66uztY5XydIX4efIVMkXmY+zDtXt72o+0+eWhnxLKfXysXxHCE8A2sB9HgR7dxJbJXPzBE4XnrcZ9SX7CYD5ggyY81BzWSV3AyLUPu4EWeWKWvLjI8xn1pIUpmONBvyHk9AsRhVlEXep8Q5PXramvjIYu5eg3e/n91EIGTC9WK94i64c5tZozY+XVK/DJrBAQTAsV0rW3RV8gdU78UeV+T1FSkc54KPtax1v44NliaW2BaLT2a7M8pygNncfA3dRrHHZaZdmBjvRgDLN9iAfABwXo/Twrl9SIbts8yD1HbDnl1OrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sqnlJrsKbZIsoZKSsRDbYvDopFWsozmviEn9PR/qO8=;
 b=Pd7cuiTIdLygKJKKiAdu3eBFL0fFui1Or2w92avGvmyMO3W3GGDvKmvxDAEQrPD+szFyJSEHSinc3PxnE5zGHKzBK9z5UHqdzzLHL+iHf4auGX+w1cJhJlE4JCS7X5Tt/ukrBEV/Q/f/VHLXDSrB46O65EP3NnvNdRrZnIaYHXuWDiaH/pLSQcCOWxhHbgOgfp09QwUSi5Ecqq3y1VOECK8bQweQUQWgfD/dgLHwIg+cYBltNyol8hWNhj4y+z88eqFqOrfxNTk1CJabQmUAi6g6DEOqp4eOnZQzwgZSu1ACqLfGABj2dQmCrYhu7frYRtmDlVoFEPoA2Pd9CXiM9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sqnlJrsKbZIsoZKSsRDbYvDopFWsozmviEn9PR/qO8=;
 b=Ybs3sC8POnzsMf2BhzQWzFO2VmhUbaczjoO5Gn+FNi+YbyBRV95xNg5e+p/Wj2UCg6YDx7YF/REuyjEGWQe75vrgZGOhBeA+W85BrI6jOshU1tDOSLInk0UF8eB5w7RWM+kLKFSi8J5lFRth1PQfuoUxMyemWax8PycPtHi4K1gO4wX9+dvLrMqEOHyxBjGBIxWhUezDosdXeXz8MckGq/JupyO16PMQhar6+bGtsKv5FEJ/MEbWKOqhMPEQdluJkclu92gQsHUdMCxVXiH9ITdIT4lrW9v76GVEs2Tfg2tN1JATGbZb1NW0gUonQLl13/RDwq3iIfXhn9vwJ7DXsw==
Received: from TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:2d6::6)
 by TY1P301MB0075.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:2e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 00:09:31 +0000
Received: from TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM
 ([fe80::f01c:6a06:b832:63f]) by TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM
 ([fe80::f01c:6a06:b832:63f%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 00:09:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: doloers@hotmail.com
To: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: codecs: wcd934x: capture clock and SLIM port fixes
Date: Wed, 18 Nov 2026 08:09:27 +0800
Message-ID:
 <TYWP301MB0087A59A3E6B025A3F03E2F4A37A2@TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:2d6::6)
X-Microsoft-Original-Message-ID:
 <179496056739.895818.13427791517724189367@hotmail.com>
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
X-MS-TrafficTypeDiagnostic: TYWP301MB0087:EE_|TY1P301MB0075:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a456da-5845-4db3-30ce-08df450837f4
X-MS-Exchange-SLBlob-MailProps:
	Vs63Iqe4sQkGaLwEdeYxLY7yqos8lGqVubcvuyP2YvQSSbB7V/tSwUigFTKrWuNMAl7oUUUTS8sj4ZV0tF2BaCX4m1A70zPINBpZTihjCOQ6rBCBXX4LJajib6AY0dszWOrD6axsG55KRmYp5QHTKh2P68P+Ksr+Jmpn+JzBX25AE7xNg9kF9tuS1OgS7+DjzHwiqJGMfOQMdK7RhqOh43VaC+DmvlmSypB5o419m9ovP0zHeewBLM/sAT6txx2hMHhDojKRIK+d3sPc2OAYI2Uo31Pbvweg+7CwBg4YLzPGtmSEgIvn5DBoSiiJ0NClFZ4vCH4jf6VZ7oAH9+zhcTQEPm/RTRwtVAn4EeBzHDl50GR0NRB1VMmVlIB6H7Slcg//2NdG94GTPZgqhry2otdZyBP9mNTOamRwwtjRcCB6hQGj13Q399POrF6OECA9K6xeYA3+d3PHIpWX5gCSxwkTwYzkD+UKq95eLWXC06ZH1MKMW7PNqeBDlaT61enYqK0+IOfgnu91vxhy/BeQ3CgJ9spTbBDUN68zmCeuYM+Wtk3gzp2jzAndjx/QgJU/VOleInC52GWkxpK4TYQeDsI9va4w3sfP+TECV8TYhKuVIKBV9hJ8QRVGQT6VdXEDCzCqaqEt5vk8MYxMrMfU1oEc5N27jVG1OFVsofs/vhAkNORc0cjbxhk6xPPfrbQY7PPK/9ggvs7eY+d4kNTY6IWucDoj+EfE7IVYIv/v92k=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799015|19110799012|25010399006|4140399003|20031999006|39105399006|15080799012|37011999003|24021099003|23021999003|6090799003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFFJSFVUY3RlUWNVTWtoYjBHQmFiNHREQ0gzdnRZeXBJQXN6RlBVWUV0TlJ1?=
 =?utf-8?B?VHdHSXNNc3c3UkgzNnpuYmk2Z3JXbHd1b3dFK3ppMFk0Sm11amhkaUJGZUtk?=
 =?utf-8?B?TlppVGc1NU9KcDJRV2NRaEFEVmtFOG8rZjNGcFVVVkNGWXVjdEQ2U1hwdnRz?=
 =?utf-8?B?eGMxNUpBN2FGVm5jbE9zTVZ6UkI3ZFVTZ09TWW5HMTFxLzdTQzdzNVo4UEpx?=
 =?utf-8?B?Z1hPTCtCSGZUY0tON1IxK2NiZGhpaVR5dzVlbnZJQ082SDJ6SHFBSUwvMUpk?=
 =?utf-8?B?b0YzdkRuUk4zdnJzVTBOTEoweFk3ZDZyS2Rtb29CaHMzUitCZmhSbTM1S3Q5?=
 =?utf-8?B?czFGdytyWCtZVFk5Vi8ybHlvR05Rek5LS1d3eTFBeVM4cmdVM0czVEdsYXFR?=
 =?utf-8?B?UlZ2M1grd0ZZODJtYk0vM29NYjZlTkRrODczY3RLejJYY3V1NThKbzBEWUdt?=
 =?utf-8?B?dGk0UHBKTlpuQjNPK3h5MVJncENyY2lyQXBBZHpweXdNY1JxbWhyMjFYWnRi?=
 =?utf-8?B?S2NpMjZsTXEvSFBOb3YzdVM3UlBMc1FXaWpVMmwzRER5cjhWV0RsTFhnd2VO?=
 =?utf-8?B?UnBkZFdZdm9CV3lTK0NtbVFwTzV3YmhxYWdIM2hEQS9NLzlwS2dPekFDcHFX?=
 =?utf-8?B?VjhZcGN1RTM5TG1VKzFTejFSVm5HUi9sS3N4SDB1MkUwTGxPL1dZNmsvSk5Q?=
 =?utf-8?B?OHIxRndxNmkyaEdoZG1XbHlMdWNJcmExV2tQeW5aWVNyV3JuOFFKdFVBNGlj?=
 =?utf-8?B?MU5JUVAxRUZsaVE5UFRabzdJMEVoZzdRTGNYTkhtQVVxK3dRbmdHbWRkTmFt?=
 =?utf-8?B?Yi96WWlNT0hsYjQxT2JPRURTWWZheVJYdk5LRnlYM0xmWTRvbElSVDN4R3hu?=
 =?utf-8?B?ekU2OWV0S3MvRVZ1Q1dBVE16RWtvSDkvN1Z6UUZ3a1ZiMlJnczcyb3dkNVV5?=
 =?utf-8?B?Y2JFYklrVU9QM04xY2dEendHVkw4WXFZTHN6N2NOU0QwRG0yQ2thdU5SREpP?=
 =?utf-8?B?STZnSkowN2dqZXNNS1BmY3hUamhZVWcwNGg3b095d3UzNXkrMzNOYkozVVhz?=
 =?utf-8?B?bkhPaXdUcVBIWG1PZVFwN1ZvNlFxMndQM1RQVFBxcGo2eDdCd1lZNTFQNEs4?=
 =?utf-8?B?dzNrcUdyS2lhTjlTV3FJUTFCVEd6SXdQNkwzSnU4b1hUS0JjYlJzajBlWkY2?=
 =?utf-8?B?R3dRT08wOUhVY01nSURmdi9jNm4yc3llay9kVFpxdUtyeUFkQ2ZwTk5XMDNX?=
 =?utf-8?B?d3Z1TWhHZGZXa2FodGpRQXJOTlJlOWVEUDJGMGRUcE1QM3IzbWJ3K0xYSldu?=
 =?utf-8?B?d2hHaFo1cGpwYktQT3JUL2g0YU4yNDhkeURwYVNKekYzdlNtYU54MUV1M091?=
 =?utf-8?Q?cTgeUlc8zAajvhEDgXrvTMXnp0I2cRfA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmNVUTBlRGFyUkNjMXpadFZlQitjTHNCWFV5bEFNL0NNbzB5eDdEdzRQdkVR?=
 =?utf-8?B?WTA3a1h2R0t2VWtFQ3ZXVnBLTmhJM3RIVUpKNExDSzE3Y1J1K29pd1h4dkdB?=
 =?utf-8?B?WEVyeGFNaW5vT1ZhRUorT0h1Q2NZUUY4aW4vTnpnU1dRTjZlcHR6WTZoZk9Q?=
 =?utf-8?B?SVlMZ2pkRUp3L0pmb2tYd0ZyUnFYVTBNb1FSaTA1UnkzM05GblVYcDhnTi8y?=
 =?utf-8?B?cXllWm5GMUwxam1pRUVFcTBTQTNmVlFKNWpqNUZCaUtWSjJQbVdiTGtRUUxB?=
 =?utf-8?B?ZFdoUThZeWxuZ1ZYMTFVSUJMMGVhUEVqN01TckYxcE9BYWtQd0RqMFlWTTg4?=
 =?utf-8?B?T1p6WjhRZlJKZjE5Y3RNNVhJYkFZOFI5eTYrSldRU3JHL2tzVDFNc3hoWVRR?=
 =?utf-8?B?TU9oOHhIRWdVYlF5ZFJ2ZERRb1RYdUZZS3o5WmNBcnBiSEVXT3prUEFyQ3ZQ?=
 =?utf-8?B?Z2VTYkhSQXVVSngySVh6dVJZTmZxdHRtNWtHbW9WNVpWOFljelAvVTl5U2l4?=
 =?utf-8?B?VW0yZ1U3UC9kZWt0bHRyQlB0RUNYWC90eVJ6WkwwQ3g1NlZicmJjVmszeHI2?=
 =?utf-8?B?dm9EMEd2YmZRSkl0VXNlTllGQTlWQTA1amRRdDFtcGgxZzZ4U3pwTjE5THFO?=
 =?utf-8?B?YjFpRU5iSlRFVzNMcWhJYVlVN1FQTC9obEhxbjM3MG5wVDNEcTYwT2xkL1J0?=
 =?utf-8?B?cjRROGVvTUdTZWJaY3RoVC9FeENQTS9FSXFmaCtVZnpXcnFUWkpvSnc5V2Q1?=
 =?utf-8?B?SHpnMFZaYm1VcVU2UVMxazh6OXpKT3JQbk9MREZxWHV4djhaM2JkU1c3NEJH?=
 =?utf-8?B?dWdBelZ5RHM1cU8vaGdRc2RiNjNGVjBEWTUrTHYzRHAxWXJMcng3NDNqZU1N?=
 =?utf-8?B?blJVRm5hWFd3SUIrQ3h3ZEh3QmJMb0JiL2N6MFFveG54MzhJTkRMVkhDOHZp?=
 =?utf-8?B?T1F4Z1kwUnpsaDRkVDRLN1hiYlhLWllnbTJ2Z215amZwbEFIOE9tWVBQcUI1?=
 =?utf-8?B?ZVJodnNlQ1hSeTdGRVYzRWZxQXNZNWxvSXM5QjNFQllOQkgyUkNGZC80aHRR?=
 =?utf-8?B?LzZOdXgxdXFEZ1VHTUJOZHNoZUQzanU5SDhkQkROSG43cStnK1NCRyttOGhx?=
 =?utf-8?B?a3h0RzkreU5CY3BicTZEQTNXcUZSVU84cmZuM1NWQjlwbzBSbzlRcGZ1OHg4?=
 =?utf-8?B?c2x0OTQ1ZE5mOVF6L3BLUEhIRzFzaGJ4MXVtSlExOXp3RGhEdDZEVUxhOTds?=
 =?utf-8?B?TkFuNGViWWpDeFdrUzhkR3JqSjExd1g4NzFlbEJUbVJwRkJ4YzBZVmNjbGhQ?=
 =?utf-8?B?bDV4ZWlVR0NvSkdwR2ZyVC9sUDVrbFo3RzRPVENYNUI5ek9zcFZIeWNoUWlr?=
 =?utf-8?B?c0xlSGxEWTA0WEZYOGxiamF3aWxaRGpEYmh0ZFNUa3l1dG91L1E5M2dRblhX?=
 =?utf-8?B?Q0VBNXBvTDc0M1cySEVpejR5YUhJK2JMR0NwNUFoNUdZbGNwWDdDdTJWeUVu?=
 =?utf-8?B?aFdRWUhvOU1yWWwrbHVRbmRVeG9aWSthVGJjRmtCOU8zSGhIcDZBdEg4Rkhj?=
 =?utf-8?B?Z09zSFp6ZWVDTUtMVmttdG9mZHFodmRvMVhIVHhKaCtRc0IwWnNYcGE1Z0FU?=
 =?utf-8?B?OVZmb290dVpITWQ5Yk13Vys2ZkV3c3hFTFJ2VExOWDFtbGRpaVo1djBRcnV2?=
 =?utf-8?B?Q0l6VUNjYUdzczRHd3lUMkJBRk9HOWVUc0lxK295elFESVJrd09WSmZZRXR0?=
 =?utf-8?B?bUZVVVhTTFNzdUh3dHNNeG15NlRZUWRTcTJ0eVJ0eWFydzF5M0ROckxBRlRv?=
 =?utf-8?B?Y1lPUktQWU9RZU9IZVJMY2RNcGNkS2I2SDlNTjhSdzVDd1ZZdVpaMUxvaFFs?=
 =?utf-8?Q?5nSpq0rFLMmqp?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-a91ca.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a456da-5845-4db3-30ce-08df450837f4
X-MS-Exchange-CrossTenant-AuthSource: TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 00:09:31.6125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P301MB0075

Two WCD934x fixes found while bringing capture up on a Xiaomi Mi MIX 2S
(polaris, SDM845 + WCD9340 over SLIMbus, playback through QUAT_MI2S and a
TAS2559 so the codec is never used for playback).

The first one is the interesting one.  In this codec MCLK is not just a bit
clock: __wcd934x_cdc_mclk_enable() enables the external clock, the analog
bias generator (ANA_BIAS_EN) and MCLK_EN in one go, and the ADC/DMIC
decimators do not run without it.  In the DAPM graph nothing on the capture
side depends on it though - the only route into "MCLK" comes from the board
file, as "RX_BIAS" -> "MCLK", i.e. from the playback path.  A board that
records without ever playing through the codec therefore gets digital
silence while everything looks healthy: all capture widgets On, the AFE port
up with the right channel map/channels, PCM RUNNING, and not a single line
in dmesg.  Measured on polaris: peak 0 for every format/channel count,
ANA_BIAS = 0x00, MCLK_EN = 0, __wcd934x_cdc_mclk_enable() never called.
Fixed by giving the ADC/DMIC widgets the MCLK dependency, which also lets
boards stop repeating it in their audio-routing.

The second one is a smaller bug in the same file: the SLIM channel mask is
accumulated over the whole channel list and then written into *every* port,
so a port that only got one channel allocated also enables the other
channels' slots and overruns its FIFO.  Once capture worked on polaris this
showed up as "overflow error on TX port 3, value 5" on every stream, with
IFD registers 0x0100 = 0x09 / 0x010c = 0x09 instead of 0x01 / 0x08, and one
channel noticeably weaker than the other.  The playback direction has the
same leak (every RX port gets the mask of all channels).

Shen Xiaopeng (2):
  ASoC: codecs: wcd934x: capture needs the codec sysclk
  ASoC: codecs: wcd934x: do not leak SLIM channel bits across ports

 sound/soc/codecs/wcd934x.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

base-commit: 7.3.1
