Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794960584;
	b=xPkyhyAdsOPGgq//PTXaHH7sBzdEHN4wqrBMGhS/+gGdlLEDJQ7Uea7hz+nUrjHqH1Qi
	 0TuFGtB9BilFbMpM7eCygfajgKFCv6gdIpas6LW7cIdY8n2utlA3joNl/yop8lVv3lCO+
	 JoXdWXJ0thU7u2P0BRmfu3zTgpN6mM2NsDQL4eWhvT7pHja4PZcOmR9jX9yC8Vy17aKBJ
	 tFzOzGtpL0xkRgqIZMDdmqbH88sWvF1fAgzvUY4URyCDDlednWwJYMHjCbBWuqYrt6Waw
	 r3JFdX4L26VQ3lC73zxOB0tAvJbYaqyeDNFctjXctMxrs+EzcG897X7drboGXyhPMBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960584;
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
	bh=uq/yktzXhvxFebCyr386k5y5dgn0zWyaxdwXwKmxDzc=;
	b=foraR/E4ywUsHYk6jWpsRfXC2StNgD456poRvS8qZ90rRVHA8ek7RcbxxCMOSG5lpSEm
	 dC5RT+P7cFyidqey+J9yf5SnC1Bv2XBtRgL+3iZxSGMv+me7lJIdWIDv8DYpPgWpuiLqb
	 A7lgv43bxVROK4egmu376EUPP5nfOBUtM6IBrVqyqZ5jAzWIc2Ue8PhGrb2qroBWIqeeB
	 mzsE64fKohYhyATepTiWraZ+byoei/jJKtCiO/JZZeOfVfjyGwNVCOWRDcrJWDXOxFI1e
	 4OOi921VTU7q5X0kjXdbRa0tAZ7C0ouNAdsWfSeg0a090oxl9pBf4ZN6vY+okplrldA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=q2IrANfu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.1
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010001.outbound.protection.outlook.com [52.103.66.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309D5606A31C;
	Wed, 18 Nov 2026 00:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 309D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=q2IrANfu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPsGtuo4Ris8RQFcwRDK2ETgdavOdGZuXV866u8ow8IoLgviLb5UKIepx0AbsBIAcVPrtREFgiKY33GraHDji68vcVsyF7id7OMWB5G424Exb2C2CzkX7h51sxbuRBQXAslSZswq9A88A7M2yhnzIqMjnJ+Z/4956XEIOy2Pgt+uKyPgsHru09vIOrnbrxRdAI/Me4Kp9dp+eWOD5DBeUZhY7zda31kNqoKMi5WXg+f57NObi3ruUNjLwPY1Jc3Scfwlf/lo6zY75fkXM7QbFdSm8TwX2ZI9GZGriWOUVzl6W3zYKgSvm3txa5O8695OfU84hVr3Qy18y2337NZH1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uq/yktzXhvxFebCyr386k5y5dgn0zWyaxdwXwKmxDzc=;
 b=er4kaxhxP5GyfLuCq2Ld5svqo5QfIz+zgIuc/eWM4V0q7VVwkAvIE9J/V/9zKbTJdap9kySZC0PXRcmet/ksq/9c82ZVRiF7nYQ5AjytFY+Y/2vC42pK6oDz6EiVuUAAu77fNdkN4GgIvgYgysrzLYhj/k1u1wutlT1oleD8tdbuSqGbVSAXccaATi0eKHoJksu2Z/l+xKkwEvAHEdus7YefccBwoyjClRPFh36VhHZfzcazQilCPNPaUd/5tVZmfOk+QPg0S+RcOTT71CLmHdpGidZBIayaRn7gOa/S3Mor/DoWnJk31ULxYuEjIhLDCTeFeJ6nbl9FGS+hKwKhww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uq/yktzXhvxFebCyr386k5y5dgn0zWyaxdwXwKmxDzc=;
 b=q2IrANfuUiIfY2KoplB2v2OgV5BHZEED+K50RA9BAnKMKyBzvvjchdRLeAjhOBSj2DaGD1ukjL1kbEpjIp4SjUO92D5uLxWWGShabhIbzNnTmcO87ar8/A/Ve4ScZFu93qQjx+ZnS0elU4EiszF02V03RXHBSEAMdRDHP68LjqyCZD+8DkcPH56DH2FFuBTwpQ61Tjk1ENdfpo37lo4UvlhgBXCLxy6hhuhIviBY1G51C0A6AI/SW6HoCCUcG7+WQ6XX/kDcgxw8aDv/AUBVV4o0E6z8exwev4lt0j65CRCsj8HU0DJihGup8njGuy8wV5nAZJJtzO/6LG55aCRBbw==
Received: from TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:2d6::6)
 by TY1P301MB0075.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:2e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 00:09:40 +0000
Received: from TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM
 ([fe80::f01c:6a06:b832:63f]) by TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM
 ([fe80::f01c:6a06:b832:63f%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 00:09:40 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: doloers@hotmail.com
To: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Subject:
 [PATCH 2/2] ASoC: codecs: wcd934x: do not leak SLIM channel bits across ports
Date: Wed, 18 Nov 2026 08:09:36 +0800
Message-ID:
 <TYWP301MB0087DFB6BDFBE4A427508BB2A37A2@TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:2d6::6)
X-Microsoft-Original-Message-ID:
 <179496057674.896167.10909704355702786785@hotmail.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3977ee40-f665-4ab5-e0ae-08df45083d4a
X-MS-Exchange-SLBlob-MailProps:
	30ekHghIwFoGqEgxaY/OAvK55SjXyV7lTma+5odEthsBynZOaNSQNwdVUBRjiuQ9kciIn2OwwMomOojwaObRquFGFWXTsre6wo2UBKQcLH8EU0JJG4Xxy+ghN4tWh2wwUVNPhRUAuIxol2xuJVg30xsQw86KvSvoAKxIS42lhfZU6aT/EGJ6FJEZhzxwcQihSgSaxpAlyK5tVsMack1VhuZJDNo3wBd1drCY3kyLP2Lu/VPt0e9lcgFQpVTvTkmoxXVCH1wZelTd9s7Ercg2ipYRNmGqAG8iKUvwJxbD/qYtOIH2k7SzzFUR5HZXRdkRdyYIT1WifjMue4QvO0ktT2yhyyMUUiNdS0dfg1s+RCGtDpqvaHcNnnRnwUzFf13IRDsXkDjpiutx1e6fpEUOW3P2Y4ebn803iHy5qYqjMoz02iLTQMz/JCVW4EhgbISCfjNRRkoxb5EAUWyIO2j/PIe4Ygwzw0JSLWlWeOmZ1fo3xEjxCG33K0P1uwJxzxa9vUTjYHZNfTozp2e5qj6om/HF4hjA6X9/c9/6rA0DIxKnleGbE1A0Wrkb+UasANKm4KnEpfegvWpIWcsVc0PADnt9ZOSAE4A39M11pvMroquB1+5JlxHHWqJ1KN2CWNEu83E8J1yw50LvRE4szChnk22nqdlGsSnHTKUMId3LvIZ4hd/srThwGpZcjNtO2feIG46LBAZQx4hMbdAZ4F+G/a9BJXlDK7EU4P4bR/fvb/oINmL8/Y05ZvNBJJGH7ZM0
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799015|19110799012|51005399006|25010399006|5062599005|15080799012|37011999003|24021099003|23021999003|6090799003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmJvSkttdnc4bTlONzFwS01wTjQ1dlZ1ampnWi9BWkRVQmQrQjl6LzZLQnQ2?=
 =?utf-8?B?N0RLaEtzMEJrVlhoOHErekVaZ2lOZWUraVU5T2gyTkN6d2k4eWd1ZVk0N0ov?=
 =?utf-8?B?RTZ1NkNzR2NDR0tGSWUvK2FDRnNDc3RhT3lnbFBvOURTUWNzZGtwSzY1LzEz?=
 =?utf-8?B?TFhxUGdqYkt5TUhHMUhmWTlJcERLU1JDdk1vWFpXTUgwaUo4MkJhZmdTbGFj?=
 =?utf-8?B?aXhuL3lmYUVnaFZiZDhYTFZsUmg3bDJDa0p3ODhGaWlPamU4NTZZenltZ0k2?=
 =?utf-8?B?b0o0WjBRa2lTOS9ZMHZIaTY2NURjK1N6RjFJTTVhdjhhelJxWkV2NkhITVUw?=
 =?utf-8?B?dGMxamZTMWZYVGxJYkpQY200bS92dzlad1NURTZRYjc4d0tLMHJJS1RpMmVQ?=
 =?utf-8?B?YXhQdFRURHNPYkhoMm91eVQ5U0h5TEMwbWs2aUdqMTdNczI2MWo0bzZzSEN2?=
 =?utf-8?B?QjdPaU9SdnlJMjg2czdsT2l3bzg1R1pGY3IxeHJ3SitKSmlnRUY0c0F1RlBY?=
 =?utf-8?B?NzVIcnl5Slo1UVNFeDljQTJnUjBwV1RlalJpSDRWVHBob3FzdXRxa1Z4dGtI?=
 =?utf-8?B?alBra0lKK1pGUVZmblEzMVVHQ05DOFlPK3AwQWhGd1p1NUV4QzRDQXR2Zita?=
 =?utf-8?B?c2RPYnM1Y1ZWUGVFY1RvTW1ublRBbGdQOEVzQVlScVlDa0R3RmpJMU0rUWdM?=
 =?utf-8?B?Y2p3NTFENWtXSE5YOVBuR1NRQ3lRVVJyb09rVnJVVGI1Z3ZiVFZFeS9JaWlS?=
 =?utf-8?B?S09sVVJYZ3htNkdBOUhDSmwrSk44WEFybGcxT29GN2EzMWRyT2FFT21uZHcv?=
 =?utf-8?B?dUFUM053aElkZTNVQ1Z5dWNUSzE0TkxjQjdUR1pPR01iWmlXNHVwSFB6VjRQ?=
 =?utf-8?B?eVlWNjk1ZmM4a3hGNzFCRDRMRjVSTTM5WDEzdUllYTcvYXpUNlBiaXRJTEV5?=
 =?utf-8?B?NXFCci9nVnJLTHIvbXBJSDVaVW1RT0NtU2JhRmQ3ak55N2F1RitwZkp6c0wz?=
 =?utf-8?B?Q01yYVlpbDRlTkFkN1dPZjZqU2FBZUwxL2JKcW9HbHp2NTA1Z2l3UXc4eU9H?=
 =?utf-8?B?ZXZGYjFsQzBVNXllR05vMUR4YXlJWUNKRDU0ZjhrRk9vOGdEN1dvQnJjRHpP?=
 =?utf-8?B?YmlubFdrZlExY1AzdWxNcWhsN3d5T0gxbUdqSG9qNGVzZjBOaHhBa04wc2lP?=
 =?utf-8?B?TnpLVDlkS1kxMWtsNUF0b2sydWZ3R2Q0b3kyT2NSZWRINitsa2hvSXpSVWZs?=
 =?utf-8?B?ZWIzUHN1M3MrQmhmMFFvb2RtOTN0Ump0V0ZCclBKMzd6L1VWdktNM2VEVFM0?=
 =?utf-8?B?eUpjUVFVRDhFWndzMisvalN2emRDUzB0Mm5GN1dlclpOUnh6ZXJEd3dlaVVv?=
 =?utf-8?Q?qMjOmvnyHam1Q/CcTB34z+ALXrfBaP/c=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTA1VERMeGJXRWNTN3RVcEg2T25xbE1CMm4zS2hmajRYbWpMaXpScWFTZlZj?=
 =?utf-8?B?N3ZEMy9PSVNNc0tOUWVyQkRzekhZRjFzL2NIZWtWcmFrQ2xlVUVwdlJGWG84?=
 =?utf-8?B?WXlnN3AreWVaTURCVFcvZms0V3doU0dkdDVRTytLM0FmTEZxMGVIWUZhUDZr?=
 =?utf-8?B?ckdKbFZ6Zm0yU3J6VlN0cUx1TjFsVVBoSHJTNDVDR29MbTFyK3luS1BtZzFG?=
 =?utf-8?B?UHNEb2l2VzlmbWtIQnl2YXN5anljU2p2Vm9sRXZZV0VBbms3bGI0cEM4Tkd4?=
 =?utf-8?B?b1duSnJsajdoaldEZWI5MnhXK0FHL2hBVERIeDZLNFdPZ0Zmalpaa094dDZo?=
 =?utf-8?B?dDExWmhWYlRlNVAzbDlSWjFrM0NyaWRxVkY3cXpGRDM0RUJCdEdzYjNNTEsw?=
 =?utf-8?B?MEJrVGkwUU5WTEJwZzJ1RnlyMWlwVEFWeU5pVlpQN1ZvS0tTZEkvMUFVMHRW?=
 =?utf-8?B?MDdBR1VqU3NjMW1jLzFwallRZkoxck1jdzY0N0hXb0d0UHZqci8rZXNIY0dm?=
 =?utf-8?B?bUM5ZnI3eEkrZGVDWXQ0WWE4c2ZWM29iZ0p5Tjlrb2FZSWRDb21Fa0VCL2xI?=
 =?utf-8?B?ZHJMY2UzSXp4VGxMbXB6ZzlJU3N3alRQT2dzc2dmQlhlWWJLTXFoS1hxZjRX?=
 =?utf-8?B?ejFSL2IvdHdieHkzR0huMkJMYTNsTUF6Z2tRczNPMDNvVHJVc0duK3Z2bU1O?=
 =?utf-8?B?Vm9ielJ0OXNRbElxeU1xVzVxYWhCL3FMVHhoUzBIOWpJMVgweU5uQjJ2T3Rr?=
 =?utf-8?B?UWpwVHptdTRwR0xjaVUrMUV3WXpEaU0vbUhlaVZzRnVYdGNBZ1Zad1FiM3Zw?=
 =?utf-8?B?dE84N0FpSlo4bnl6bDBUTHlEU2QvSVp5cUF6OVo1Vk1saTZ3QU96R1RHVzhZ?=
 =?utf-8?B?L2RHMVRxVG9Bcnk4ZHEycERZRFpXUU51cHNxMVlaSlMxdHBBRnltdC9GV25z?=
 =?utf-8?B?dUFYdlNyd3diZ3NHOTB0cUVFSW9idjJ3THNCYXJxVysrNThNcWswY2EyV1Nl?=
 =?utf-8?B?dVhsODlqU01MZXMxZFQ2dTFNZnBKYm02MDd4WGM5amI2TzZ1OFhVU3pwZnBm?=
 =?utf-8?B?ekY3L1dzS2FKekdZUE92MDZCQWZqSU11TjVYQ3FKc0p4Q05DUzBtNXFRT0ho?=
 =?utf-8?B?N2FHNlN3TTQzWFZKY1JKejhaWE4rZnFxbk9kaWd1Y2RGaTFTSnBxL0h6Zk5K?=
 =?utf-8?B?NjFINUJJc25NblNWZVlTZldrcVZUREdPVG4yNE9jbGNURmhDTGtqb0g3aTZB?=
 =?utf-8?B?eWlxN2JxZDRhUThPanJwZjRBeVZOV0dHdkMvKy9ZWWdPakV3SDF6cHFZR0ky?=
 =?utf-8?B?WGVnUDVtWVBRWi8rcm9UZzJPeVVOam5zaVRUdmtOa1dXOWkwb2dJQUFsZUEx?=
 =?utf-8?B?T3QvQzFBeEdBd1RuQWU3WnhQVnd0aEozc0N3UHdaOFNlL08yWGlYRjNWSFpv?=
 =?utf-8?B?clBMNFJuOTArSURYc2lqUHpiS0pFYzM2ZGdlNXR6S2M1aHY2K1hpa203WXQ4?=
 =?utf-8?B?bFZmK29YRTAwUlZSYks1OWE2OVdhMUJHN0JtS2t5d3dCaWNVN1JMQmZLbEJY?=
 =?utf-8?B?RDVoeUc1b3pKSmt2YzZLV05DSnFzdkY3K1B2K3RUbm1yQXJTTlZTNCtFU2FT?=
 =?utf-8?B?SUd5NnNTYnpzYjNGbC9TbGFqb3pJaE0wYnZLeXpYQ2VOeTJMczR4Zm0xQmZQ?=
 =?utf-8?B?ZG0ySjFBT2JUYUtOTFNmbG1WZGxWRkdOeDhMKy92WlUzZWVxZXlqNFo4ZkFr?=
 =?utf-8?B?dFJMdEYzME1sRzVnaXVGR2kvWjNua3FRcnF2UG1FTWdJcU5CQ0lFeElRQ3ZC?=
 =?utf-8?B?bHd3eVlSVDNTTVRjdjlpZmlwTXZlM0tOeVA2YzFUNk1ZenI4ZkpHZnl2MDcz?=
 =?utf-8?Q?lPSdrB2UT0FEl?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-a91ca.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3977ee40-f665-4ab5-e0ae-08df45083d4a
X-MS-Exchange-CrossTenant-AuthSource: TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 00:09:40.7805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P301MB0075

wcd934x_slim_set_hw_params() builds one payload from the whole channel
list:

	slim_ch_list: port 0 ch 128, port 3 ch 131
	payload  = BIT(0) | BIT(3) = 0x09

and then writes that same payload into *every* port's MULTI_CHNL
register.  So port 3 is programmed with 0x09 instead of 0x08 and enables
slot 0 as well, while the SLIMbus channel allocation only gave it one
channel - the codec then overruns that port's FIFO and logs

	wcd934x-codec ...: overflow error on TX port 3, value 5

on every capture stream (measured on polaris after the capture path was
made to work).  The playback direction has the same leak: every RX port
gets the mask of all channels instead of its own.

Compute the payload per port instead.

Signed-off-by: Shen Xiaopeng <doloers@hotmail.com>
---
 sound/soc/codecs/wcd934x.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1702,7 +1702,6 @@
 	/* Configure slave interface device */
 	list_for_each_entry(ch, slim_ch_list, list) {
 		cfg->ch_count++;
-		payload |= 1 << ch->shift;
 		cfg->port_mask |= BIT(ch->port);
 	}
 
@@ -1712,6 +1711,14 @@
 
 	i = 0;
 	list_for_each_entry(ch, slim_ch_list, list) {
+		/*
+		 * Each port carries its own channel mask.  Accumulating the bits
+		 * across the whole list and writing the sum into every port would
+		 * enable the other channels on a port that only gets one of them
+		 * allocated on the bus; the codec then overruns the port's TX FIFO
+		 * ("overflow error on TX port N").
+		 */
+		payload = BIT(ch->shift);
 		cfg->chs[i++] = ch->ch_num;
 		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
 			/* write to interface device */
