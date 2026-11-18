Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794960580;
	b=gU8sj9ds4hKCVSM+LxkoNQCFh6ZuIZpamGhYbpE1vBlt9F21GoGs46CcODHhlQLwXJ3K
	 W4ZhE+zNXbVRH0lK4nzc8AwZhcTDEPlDOPA3Cd0TsaCDmkMx6azEeuKlZLSMwDTP5Bnrh
	 9EuOiWnVyH72A66SPo/uAh4jI9uBy+51WjnqkA+NlnX3Z2vc4jkw3YkeSBdx9CZPHEYVd
	 JV/eAgdR+rbz0hW8sTFBhvleJ0fLYmkkYp3fBTROxVYZRhFk5kYJ7m4zl85Yb/08V2z8F
	 AqaHqGyXo6MeiD6bw8251rdambHXWlAyIy2f19Vro+TA050R79DOneYgz77s8zbOZog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960580;
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
	bh=b7Ear+sXdje/8ssaJWbBQw1AYUbwJXM6FnN26teaC3o=;
	b=5U1f5Ct+/CrG4jQlTLgGMWBl+U/IBBom8l2H4Zneci30zIQ5E4/w9b6kaX1ljIpcG+cm
	 rOQkmLFlt+tldLRhaJAznwrDkHHZMJG41hQLG6le9lh1IGyStOZ6Mlln0G3quaFlYaH79
	 qiFhuEhDDKGRzRXgbd28h2JW9qlvQ2nDuUIi8K/tJlp9nKWr+2SVSXwh/jKn5JG1GozVd
	 N4lSaYpRCaFh/CiLFmRf4Xy1uMkLeSvX+cEM/hMcnOZPipCMBD/lYnYhMuGkUkpfjq1eI
	 WNdsGXqFietYVpga9GCNbLnIXbJ6vV4mIG89yiyvXE+5gKu/RLpPojPYVkbV418yHcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=HnOCgvq8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.13
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011013.outbound.protection.outlook.com [52.103.66.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45E4606A32F;
	Wed, 18 Nov 2026 00:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A45E4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=HnOCgvq8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yy9Josi/Kbken7banxCzUmpCfmDXIozKfCgDwq1Jxul5ki5BLIHrBlv3nHJ4l6pq9XaSEYkW2aEtfPrLq4xqui7t40fFMNHuEuhOkF9IgoQ9Ax0rKoHoT+mBUO1iAJ7Wo0B/UdqayIi+gkKfJmcj+kQd1TxMMZY6xpEnQvZx+oLZqC1gdZfXqHZWHhhy9cCGxJpBlOUaEswj6+Z9gID4YDpaCIFI5iykxc13HnvlOrQ9uedoUqRXvRB3xcwnnQvAJiqW7FhGm0h2heQ7YpgbgiznGgNktOqrzfDra1jDciTBRgQk4BIfCcZu2npwnzMqEL4FPpxRgaXXKmK1jd74rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7Ear+sXdje/8ssaJWbBQw1AYUbwJXM6FnN26teaC3o=;
 b=XjAAFKGAC5RE+Su8ZUmQC6FCU8+gBhKw7d2hZrE7+2FF74Ll9L2GtncSf/gMlWK0cKyEI6Bbx2EPbbLRFBk/fNeIqEK7etXOQpVLVBxD58JiGRKyG7BU9+rNJZZXfNV4Ovdj60FDtrWYvBHchvVlDnAvx2RR7RPkZ8FMnQBsSN2rjoqGpanvd1odTnqGcYh7ImkLCq8nTUf+p9gP+gWp9aXavGKyexxD7RFVD/WzPYhXbA7ubaSgp4M2idWWw5/Efg9yF0gMthK8aEWStBE960o23IPInkpWjhRg65cwO8Ml331kOWnhfDC8ro53Vy37ENGxlXGRgJ44oAt28TM8vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7Ear+sXdje/8ssaJWbBQw1AYUbwJXM6FnN26teaC3o=;
 b=HnOCgvq8DExGKzVwcTjOrH/NUYoGp/9DXRCbv1YAamyDJKAHu1jOLWsYncYGBC03SnIIuYrk00ojk/4xTA8oGxENrgHnenVUZ2fQX/tJDnn8eNAZ0s36wtnmsih1dNuxM7O93kBpDh9/SgFCviJXe8dxDzRN5EPkTsP5HyoxjXzpflmwM6K+KUAvElS1dwlC3FLvvrG3Kff0kkqqr+iRVoVrkYRYCPH3EjFE8EXrqKqziNwoAC+YE2JEvLMGejAJ3aYhFBxpz1e/1xXr+hVSCVVRgeG/HEILNUrdFG913tFcZyD8ceOq0sA6I/gKLdoxOCKTPx831uYhj2kkAZuvwg==
Received: from TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:2d6::6)
 by TY1P301MB0075.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:2e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 00:09:36 +0000
Received: from TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM
 ([fe80::f01c:6a06:b832:63f]) by TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM
 ([fe80::f01c:6a06:b832:63f%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 00:09:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: doloers@hotmail.com
To: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: codecs: wcd934x: capture needs the codec sysclk
Date: Wed, 18 Nov 2026 08:09:32 +0800
Message-ID:
 <TYWP301MB008701733619289BE5A87111A37A2@TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:2d6::6)
X-Microsoft-Original-Message-ID:
 <179496057213.895952.15177718294893340831@hotmail.com>
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
X-MS-Office365-Filtering-Correlation-Id: b5f9269b-c78a-42b9-d251-08df45083aa9
X-MS-Exchange-SLBlob-MailProps:
	30ekHghIwFoGqEgxaY/OAvK55SjXyV7lCOlu46DNQqeoTUbuntP1hOvtzP9M8cRJs8Kslspl04vVU3j9Ey9eiBngZqMc8juet2Cu4xGY0C2Y/OiHdLPo2/ZRzg2pYb5M3FfVwjjE5Trp4aX7hJxya8kyp2I18Z3Y7yF1Mk7k0UodLcZOw/NYQBsoPIO4LXBFN6ZG7/n+DRwYdVeWdH7I012Wjq0UeSvkjY+wRxNvBvJNtgdBdSmIMW/Eao/Q230XTJSifbHRVaLBhtjWQSd88pchRDV2oEWoD4iQKxT06CP4p27LeOjfiGRA/D909it6Uefe5BstNWhKEK4UPoCfrX2nlyrYgPn0wRNNtVqIR3yf1kKTJWi0ztN6jhoMAZkHtofM3J9n6P1qUxi0uiWarfoSdZ5pW6/EmUVvlb3Ir2VcViBpU9BiRuuEC+Hw6Mjexh/8eFmMD5Uqzs1EsRv0n3bL0Oc/cI/v7hWvNbWG7BNDBHsM2G+ACEjOSQ/+G67CsUtvAsX3CSvOD5UBrDeKESfiSIdC9bzaMJ0kTu1znMk1HW5SJI5Z5kYBjH3RuRPhyKAlHs93+Nd4B9WOau3Y8ANalObhKl2F/i7X/IcaP8XhFxc9OOD0Lm1u5+RlCGVapYMB3OIw/vS/nsmQl0B2r7JwTmixw+pk2GGo2bTypBBYcs4YiVWx0fHYbxqdiYTJQO2Tzp3fplV50IDxe2nwmvYKAb+oRTfgiRLZGkUVRw0aZzdNtAVtT0foDsO83gSP
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799015|19110799012|51005399006|25010399006|5062599005|15080799012|37011999003|24021099003|23021999003|6090799003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2h0b2ZrNmlRY1RJUTZBZFNkNnNwTkNnM0FVU0V1b1dIWXBTSUgwckFKem16?=
 =?utf-8?B?TU1BTW5qQUpLd2lYdTQ2UEpWaDFvZEgrRnRMV09yMWpwMXJ5a0xpS3lHZTBm?=
 =?utf-8?B?WkxzVUM0ZlFTUGJuK0FOKzJtdEpESGMveSs3cmhGNmliSzh0VWZzZFgyS0t0?=
 =?utf-8?B?OUFQc1hBYnZZdG1kUitKbDluREQvaWQzd0czMEFWTWFzcitiUlR3SG1DNGJp?=
 =?utf-8?B?NXN1Q0ZIMVA5ZkxidW1SR0cxdjJFWTBxd3lFMmxkOXZvWXRZZWRWdjFTdldX?=
 =?utf-8?B?SnBzdzhrdjRXeElBaERwby9DcE1MeVp5elRHT1BGN2pwY0pwVjl0bm1RTnJW?=
 =?utf-8?B?ZDlGakNpMFRlZnhCdGFId0dxQmxCWk5CbjFUWTVXNzhxMWU1NGJPVTY0VnQr?=
 =?utf-8?B?cWNPNU4zSWh4RkdQU21jYTAzdUExZDBoUUxNM2ZrZnhxZnZGbWxsSXhqVTBy?=
 =?utf-8?B?czVpU1BZN01SNTE0SHdFNnBLZ0lNMFNmVFJqcEhHeU5qQUlFSm9oOWthVysv?=
 =?utf-8?B?b1QxdmFwMlFoQVFYVnpoVW1jQURGUFI4eFhFY1RLTkp1Tm00aEJCNWRXdnY0?=
 =?utf-8?B?WnBjYWxwVDJ6TVNaMGRvSEZOSE0wZ25BS2pnTm9qVlBHYVRWb28vblpqOXB4?=
 =?utf-8?B?dmQ1cFJnMktZaUk1a05wVkY1TEhRQ1hndzV3RHAvZGVTUnBPNUtjZzZVeGo2?=
 =?utf-8?B?UDFISTlVNGpmTk9IRnpYRzl4cloxdGhJUEdrdG9uMDBQcXNZOGlIV3lBUjlp?=
 =?utf-8?B?QlRLSjcvSjF3cDBDdXAwTENJLytXSWRZR2czZmw0dzJKdzRodnZhclA0a05J?=
 =?utf-8?B?SEtYUDhNYmxoZy85UnZYL1pEbGtFRDdpN1Bob0gxM1FqdUNxWFlOVjVuUmRX?=
 =?utf-8?B?bFQrWGE5eDRwdHM5d29lS0NwcUlCSlBmayt2WGVQelVyQkRrQzQ3NHpYaXhU?=
 =?utf-8?B?TjltOG9kRnUvWXZMcm50VXFtT0psUWMwczJJV1M1TG1OaktuMTNFS2lmaVB3?=
 =?utf-8?B?eUJyR2FJSG9LUlJVVkM1R1FNWkVGWjJzRXV0ajVVeURGYjdMemx6bFFxQmlT?=
 =?utf-8?B?QWw3RUYyOGhQVkFKTmhvTWp1NVJRS0lMSTVOYmJzbnc0Nkpkb054emhlYmxQ?=
 =?utf-8?B?V0NyS2lJck1ydk5aY0dWcTBONmYwOEtCanNTbXpXaE9CNE9nUmNmUjhNU095?=
 =?utf-8?B?VDJQTFV5Y0pyQ253emJ4WXRlVWkzNUszbG01dzcxUDhlNi9INHVva3YrbTE3?=
 =?utf-8?B?dFBNN2xYNE0zWnFjOVBRSkFCb2UzTmJreDhkcmg0MHo0RUFhSmFCRURuOU4y?=
 =?utf-8?B?bFlMQ2J3S0lsRFRoTzkwOHNEaTg4QldnYTBoNElsRjI3c2QxU1B2dzl6aHVn?=
 =?utf-8?Q?st54HAysXVgLq2JlqiBHAjUWwigOP4gE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzBsN2xjak8rL3JLUmxFaFA0cGl5bEoyOWhpclVsQXhYaFhyWkV0Sk9PUWMv?=
 =?utf-8?B?QllFWVdzNWZXbXRHN2dkS0pIS0lPOW1VbU5SYk1WeXBrNDQranRDaHVGV29Q?=
 =?utf-8?B?VGxSSTZ6aWR2cXFjclkxREJiZjNoTk9ERWdoV05GN3ltMjR1SEx6bXJ6c0pB?=
 =?utf-8?B?Q3A4VmZVdDFiT3U1aElaVjRkLzcyc200UGdvK3E1eURqc09DTjVqRHZvVGMw?=
 =?utf-8?B?Y3IwNTBaOGx4SkhqVTdiSjYycHBvQkVwNm56Zi9taFcxM3hyd29aNnZxQ0pp?=
 =?utf-8?B?ampnSGUxUzFhME45OW8rWFIzUjV4UTArZWNBY1FiYTh0V3Q4ck55LzU4Y1A3?=
 =?utf-8?B?cTM1bU1tVDRRV0pWcmd5eHpmaFNhVWwxbEVuSnBNVmZiUEErMzFKMXNvVTNR?=
 =?utf-8?B?akpsYm5pdnBYTmJLRFlEdmd2UUVRT0FCT3AwQWZkdnd4TDc3NEhKM3pXdDJX?=
 =?utf-8?B?SEdrdHFCbVlkcEdGV2hvYjhDbG83d2ZUUTdFWENuWEV0T25Oemt6SlRoNEsx?=
 =?utf-8?B?anZHSFU3OTl3MkIvU01vMEpxWlpzZTRUd0xGSkJKWnVJbXd2YVQzTkVtMms4?=
 =?utf-8?B?QTQrV0dRTFpZQjQwYWM0UzlNMy9kNlFUSlA5UlFGbUZvdk1mWDNlbnlhT09C?=
 =?utf-8?B?SkZuREZyODVxRmxSMGpGRXVEcWJTOEZtaG1WS1BVOWNvSWpEL3RBRFNURHJi?=
 =?utf-8?B?dUFUUkpybDJ0ZFVHWjB4MUJDaFJWY0ZPMTU1QmV4bnM2UFZrTXh0TXZYbTlE?=
 =?utf-8?B?MmhaVHgxWDUvWU5EUzNLWWZxY1lQZjkwUmhwZkR3WEFxeGxpOFEwWGZNOCtL?=
 =?utf-8?B?cU5ZN3BlWUNON1FjUXhOUi81VWRPQ0dCcWdjaXdFenRkMnlyaFdXaW8welNQ?=
 =?utf-8?B?YzY4aERxQjl5QlhVS3dnVjFhb3o0c2lya0cwRmxPd1p2Y2E1ay9Bdk1LNmJr?=
 =?utf-8?B?dDVmVHNKSTVEbm0wR1dzd2RSUEN0Tkt1UWpFMHJVYVEvLzh2RnpvNDV4Smxh?=
 =?utf-8?B?cE9abFlLb2tsSXRMSmU1NDdQdGtiVitNQUNVdlMyb2txak11NFBpQW5BU25u?=
 =?utf-8?B?S0hXa3BUcnlQVDVybkVZd09Pcis1bXkxZEpjc1NsZTBDTmtCQks0Yi9BcUh0?=
 =?utf-8?B?T2pzeTIreVBvdkc4SGJoZlFZOGdDQVJLUkRibCtzbStDZWhKZjlFd0J0cUJE?=
 =?utf-8?B?YUNNN1RiQUpzQ0NEeTQ1S3U0ODZTNWdrVGVDWTJHZkhQclZRSDBhRWR1d1Nl?=
 =?utf-8?B?cElTdVBjcXBRVDZ1TzYwelgydTEvTFVJQTU4eWkyQjdDTWl4aHVIcjluL2xs?=
 =?utf-8?B?cEVmWERmZjRIRzE1ZnkxVmlFd0R1TGk1VEUrNjRVZUZRUHBVS3REWTF0UlJW?=
 =?utf-8?B?WjVleUhNUUcwQjJSWG9WVCtsVzZXeTBoRk94QzYveGVPZXg2RkpJNWRVR3Bu?=
 =?utf-8?B?WjQvbWRETEZyQ1Jqb0Q4ZytJKzUzS01nYWZCY0pCUEdaMnhJV3pVb2ZNMGpp?=
 =?utf-8?B?OHl6MnhqWlhCc2JUVG9pTlk5TzR3OHcxYW8xdlo1cmZLL3JCeUg0cEQwRktr?=
 =?utf-8?B?SjJORHNHcWNkRkZsZVJLMUgxNmR5MUFwc1Z5YjFOWWNkSFF3bzVJdFlqZ0pt?=
 =?utf-8?B?NGdUT002a042VHBWemtLa3dRYmR6aFFDTkNHUW04dmhBUTBtcmJmL0M4R2JH?=
 =?utf-8?B?SjJ3UXkxZjdONXhlRHZjY0NhbENvUTczMGZaN3JLS2hlV2FxM0JLNnNFNG9K?=
 =?utf-8?B?c1JncGlrcjRtMEJZSXdWVjNhYjdybzFRWHplekhFV3oyOERjVTNURGlOTVpB?=
 =?utf-8?B?RkM2NEExMmdsVjFGbW15MXFPbFBlMmpDYnBxdEorMEZYZFQ0RXkrV0ZybVZ5?=
 =?utf-8?Q?ao61SE04erhzb?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-a91ca.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f9269b-c78a-42b9-d251-08df45083aa9
X-MS-Exchange-CrossTenant-AuthSource: TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 00:09:36.1929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P301MB0075

MCLK is not just a bit clock: __wcd934x_cdc_mclk_enable() enables the
external clock, the analog bias generator (ANA_BIAS) and MCLK_EN in one
go, and the ADC/DMIC decimators only run once it is up.  In the DAPM
graph, however, nothing on the capture side depends on it: the only
route into MCLK comes from the board file as "RX_BIAS" -> "MCLK", which
is the playback path.

Boards whose playback does not go through the codec therefore record
digital silence with every mixer in place - polaris (Xiaomi Mi MIX 2S,
playback via QUAT_MI2S/TAS2559) is one: peak 0, ANA_BIAS 0x00, MCLK_EN
0, and no error anywhere in the kernel.

Make the capture front ends depend on MCLK so the codec is powered when
a capture stream starts.  Boards keep their existing "RX_BIAS" -> "MCLK"
route for playback; this only adds the other half of the graph.

Signed-off-by: Shen Xiaopeng <doloers@hotmail.com>
---
 sound/soc/codecs/wcd934x.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -5619,6 +5619,28 @@
 };
 
 static const struct snd_soc_dapm_route wcd934x_audio_map[] = {
+	/*
+	 * The ADC/DMIC front ends cannot produce a single sample without the
+	 * codec sysclk: MCLK also gates the analog bias generator and the
+	 * decimator clocks (see __wcd934x_cdc_mclk_enable()).  Upstream only
+	 * ever wired MCLK into the graph from the board file, as
+	 * "RX_BIAS" -> "MCLK", i.e. from the playback side.  A board that can
+	 * only record (or that plays through another amp, like polaris) then
+	 * runs a capture stream with an unclocked codec and reads digital
+	 * silence.  Express the dependency where it belongs, on the capture
+	 * front ends, so no board has to remember it.
+	 */
+	{"ADC1", NULL, "MCLK"},
+	{"ADC2", NULL, "MCLK"},
+	{"ADC3", NULL, "MCLK"},
+	{"ADC4", NULL, "MCLK"},
+	{"DMIC0", NULL, "MCLK"},
+	{"DMIC1", NULL, "MCLK"},
+	{"DMIC2", NULL, "MCLK"},
+	{"DMIC3", NULL, "MCLK"},
+	{"DMIC4", NULL, "MCLK"},
+	{"DMIC5", NULL, "MCLK"},
+
 	/* RX0-RX7 */
 	WCD934X_SLIM_RX_AIF_PATH(0),
 	WCD934X_SLIM_RX_AIF_PATH(1),
