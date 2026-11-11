Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412050;
	b=iNXTixHYgZXtVDE8ol1eOgHMwePPuXepSpepeZKBSz/efwBgKSKwZEwLkw00klm9bf0O
	 TgouTDuoGRY5yEPDDCIjRwM/yjfJN9jL+ZVltATszPYjkrbR1izdXK2KjmI89/XnicdAc
	 gqfAS06QCbKugJtTpDZfxH0+JamKlK1tlr4b6AOZGbGWyublDZQ7VUEY+xRQTTv1Rifqu
	 MKLB3OjyzPH0Xo7Am0O6VI+5Ye+cTc3UwLmKM0CaJ7oNp0e94jFYCLcKdWVtdhMC8mkVZ
	 3hdatRJFvr5xWv4TpD5ZhQBJk0KM9bzXknKCE2p50Hb7BIr0lZ8rg88DRaIOCukSZ7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412050;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Npki3z35N8G6ASp83arpeeABU6Hl46YDe9xJzalsb6Q=;
	b=tMj4cdOsR9cERkFRSfkImFb7thMXJWQkgJLbgdfOVJoCyviOp15SOwTefUyl4zxg3Kw8
	 zKAsF89npKZHnM7+Jnf0IQ0SV26FkJv/liPWuxO3JAULDjOU70C9rSM2KPrB/Yq4H6JVP
	 WMiJwUtu2m4Gy0Kv6Dw8VbCYZ8vPDNmPjAPQjXPI3Zx4I5+p+2ijcu1OAIkXrf9lRQlPm
	 UBGFPiLZmFfXTygd57gDjsh+ZOMi6hO2xWmqf1AgINBJhXwGBdNutBNxYPzG3fWMKNQmg
	 j6G5JHsuLNamQb695fLnlon+vukz6lYKn4RvfmaGibHkh4oTUxT7edp4m1zljMlLvVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=h5pXIrco;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=mKt7j8Wg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A007606A324
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A007606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=h5pXIrco;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=mKt7j8Wg
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1jfU409524;
	Wed, 11 Nov 2026 10:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=Npki3z35N8G6ASp83arpeeABU6Hl46YDe9xJzalsb6Q=; b=h5pXIrc
	oi1TwpF0i1Rq9oFMI/q+HcSt8lxaKi0PL4D3FiQ+zIDZ4kM1kzaDx9IiciB+r8t0
	8HWWXmEsSOkwvu/v5xq2qy8rqjYa20hl29Z0U6ZruOWyXiEZbswtLTEnPjJe1ZKe
	k4oa1doZCd/581sUeOPXxcJ+PiVqmSwUq78OY5PUiUFpnBufoPJuOJ33aMdjt/wP
	NyjJitPqp2i0UmtkTlTJG6dlrXeWqE9LqisASJqZwozIZW3zUX+5BL3MxeJV0kza
	jYUbjuR0Y+8NVDqJpjvu1a+QoRMToBU8ijQU1llt9hx2TCQMRb5NrAd9KBbSejdt
	iRAKm+uheXFq8CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Npki3
	z35N8G6ASp83arpeeABU6Hl46YDe9xJzalsb6Q=; b=mKt7j8WgMjEL/1ptISnh4
	plWvUVOUF7mYANH2GCT9Rt3sULgSCeY06ylMaUw1JVuI5ZISw74YskIOzX+FT8Fs
	+3nO8LB9BL1oJhoUkbQ3K+2sdPWomf8TetebaMvpd1wOVOMk4orw3/011b4RsvQ2
	Ik71IMruz7LfKeDdc/boFY2vjszqpBjzLWQNI2/8lCjSubAhH9R0Kcq5ZJapTNBK
	lJKML8yzfSVTLa9KzomLW84zdbmvZaBlXOIGKXbMqjMBDTru/SzdGxgPOVhRDO5m
	X3jU9LJJUR/ycfqTzXx9y1blX/e8yppCSnuI1PNzm/zbv57bh17DWFeRMf0fS3Dm
	Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvqu917e4-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:47:23 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQc23JRhSGCsSmr+Wyp/POTZLT+xl5PRYo7GpnFf6Pq9JnhIryabqn7czSfSf9pZn7yxnU9ZuHHzkGD2a81Afsf4OIjYharNosVzZmYZHntjpKQLpUItqs9ddlfzWNf1vyMe/YjtaH2B5+WduAjNOxScWzADMgcSkzQ8SvX0gv2x/qYZ1nQ0ZMNGjLJuEqwra/+7U5u0BqEz9SmGHqq6MWo/YZn3i81Ihn1Li9LIUa2FuJlWPwcxW8mWJMAKfJcjLer9kAxVu47+xBPt693kngPYZIjo5FbZ0cE41OS0Av+SJF8qxU6XSQDGZL5DIIza/kxAkq3S+xqloWhMB5AOvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Npki3z35N8G6ASp83arpeeABU6Hl46YDe9xJzalsb6Q=;
 b=QHvO0MjW1+f/BFje9WWQDFs7TZZM/SVRhniUJF3SAl3KaUH0FWRQNsYTIvPxOaRkfYm44c0/enY5UHCR/fqZFW88cc+RhTXEBz7O2wynLZ8GOGjaFB2pjvBXlfnn3sGQSoRsmqm6VRjiQBHO17y9epVB/eBZEx+qXkSuyN4XZ07ARWhvR+v8eHZ5QsS8qzmTDWyB7Vn/yCzpKwDMNJxB5HZ5awEQTKLxOWMsf5Fr94xmG0Pnju9jM380caLTLCzoPkxs/x2FKCQvlXFjuEUAcWiKy7iETXsy6K1ZqV0sLEo1vhLXx2H1qfZBMvlt9MAVoL+oxxIWNuGcnMPpoUKvlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by MWHPR03MB998632.namprd03.prod.outlook.com (2603:10b6:303:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:46:13 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:46:12 +0000
Date: Wed, 11 Nov 2026 16:46:10 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 10/20] ASoC: soc-component: add
 snd_soc_component_to_card()
Message-ID: <avSNu6cchqt22e_v@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87tslpmf7c.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tslpmf7c.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPBP307CA0011.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:1::6)
 To BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|MWHPR03MB998632:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc9bdc0-575b-4f7c-43d8-08df400ae9ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261009223027099003|10067099003|261021121427099003|261102123227099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	onekgkrPQcnwjMyd+URqtrtBV6kieuUhDrFnHhwOC415qlvlrlncfB80Dwznn9ao16I4B4VRhBXbkmfEO9eSAdWWYxMy5MHjy0ffYuFQsCSxuWYlWK+tv8YNinTLQyzSGKqI0CuCaRWIusBmjRU1+u3ci3eWb9KIAE5/LymzvD5/AP9XehcFOnQpfDTN/L8esmdMcv+VRuDp3QT8OXe17I7QJdnSaEQjbmLUivnj3xP01tp1n0f7CNGbDNGs1/ihkEEki1Lg1yhy9D7kdjWdsXFnFv8lLjDdx2VK39nzv9X3A71zK+RFoabyW6AFcB8rKOCveSdT0dJ8nQC82IovvQMIJfYq1rykyOjLsmdfB1QSuR6CMK/cv9ChqjvpcRYZX8DKCjFe4pAE9Bw+uduD1xnJEAhFrO8BP+HCdROknBp0mYECsO1X/hVnFpVkeDIVg1l/CutB5K0OTwFsrc0Ook8ntRyFmi7wct0/9dZEFZLSU+ZmRujzeMCd3YBxcBoaXSZXHR2fLeMpoT99ImLeaMiKQNFQUWPkvTWpq4/XbGeQZ+JdDZNyLEWmx5ecVErEWQst1VOtLUqScP5sy2ITDDZ/KxZYpC9lGHJHGZSqJhQG6Anw6+WLA2VAM7rYSMKt4E3ebbcLpulknQBnpyzRCGDv6hUphc9484ov2RjEka8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261009223027099003)(10067099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3ZjaE10bGJIU0NUaS80blRPWndLdWZDMGo0aTVuUjZ4NzhheFNCa3g5UEVW?=
 =?utf-8?B?R1RpSU82Slk1ZlhBYnExZHk5K0ExZWxTUWMwcmpsRC8yYXBaYmJ3dnJoOWg2?=
 =?utf-8?B?c2tvYW82dk9oWituK1FaSlQrSXlCK1NPNnRWTmZKL0dNbUJxWEhnaU9oZHAy?=
 =?utf-8?B?dnBqMjF1eUo5Wk9tQU9ZTzJhOXkzZW03UXM5eElDUjVCS2NHelpHMFVJVlJ6?=
 =?utf-8?B?L0dtNk12cXZQWVpwNklKTDc0akczUThYaTVIVlN3OUF5YWdaYjNDakp5N09H?=
 =?utf-8?B?MG5Db1lzV0tUK3FMcXJSbW9PSjJIVUFaMEwzNzcxTFhjaFlGVGY0Mndib3BC?=
 =?utf-8?B?cHZLbG56bDNJQVFweS9aUnpHTFFkVFdndmd3REZGZm9BSEZ3V1gwL1A1aDV5?=
 =?utf-8?B?bW9WdTRXM2xaK3Y2L2RRLzNBMTAzQzE4VlVkR0pMYU9NQkwyRWtZR1RFREE2?=
 =?utf-8?B?RW12aUNUNm9wQnR6aUF3bGgwZWtKSGNPZjlSUkJOc1V2NDMyNC8wMHMyY0pN?=
 =?utf-8?B?QjY2REFQQlJaZEgvQjFwc0FVdktSbm1aR0RvMHFEK3JrUWxlNy85cU1ibHha?=
 =?utf-8?B?M2k0YStTYmhJV25sR0F4bEJ6VGdIQnJtcDBuSThFaGphSlAvTEt3M2JNcUY2?=
 =?utf-8?B?SWQwMDF5aUhmMGlubms2YWFGRCtwOEhIL3paSnZhTm5oN1o3Q1QwOFhiQVha?=
 =?utf-8?B?eTZ0TFVkeDhjM3c4Y1hhUGcrNVY3OFZxeWlkUWgxYjNSVFhNRmwxa1ByRkJq?=
 =?utf-8?B?clhpaTVNZ1k1SEFVc1dvN0U1bmkxZG00UE1ScElieFYxemw3WG1zSkhIcjFJ?=
 =?utf-8?B?d1pYU2lZWDRCWjNnbk9aS2tyVWlPQTFHNnZpYXd3ZzQwQ2o4cUdpRzlkaGpO?=
 =?utf-8?B?ZFRIcm9yMTV5aVdOOXhNSWVOMDZ3TjBMcDNtMS8rZVMxdWRmS1V0R3RSY2s3?=
 =?utf-8?B?RjBnTHh1aEJVaUxpMzRQdTBTdjkrOFN1alo5OVZtcDFZZWJBQUx5TkwzOXBP?=
 =?utf-8?B?RVgxdkRURWIwb2pHSUNjaHU3T1loTm1VSHRoVEk3bXVuM1BqWkY1ZjZ3T2sz?=
 =?utf-8?B?RkZ0c0VTTEVDUEMvUmFwd2VXWGxrdUI4YjBHYUc2UVNPMGIweFp2UTJOc0Zu?=
 =?utf-8?B?eFJVV3FXUWJ0L0hXVkVEWUUycys3KzRGNmJxSHVrczkrMklCTEVoN3RUVnFi?=
 =?utf-8?B?dU9xOHlKRy9Obm9Fd3cySnk5blozUFZydTc1V2FZMnFJMjhKbjFJVG5CQ3dh?=
 =?utf-8?B?YzFnTWc4SnBaVkpYbXdlQkE3TWlnVmo5ZUtPWXFtMlcwbUQyWHRDZHMwMUhD?=
 =?utf-8?B?L1VqeVl5dUw1RGR5dXNWNlF3bkdBUkpwVDRDUzQrNFlPWTdNaVJVR21RN0c2?=
 =?utf-8?B?M0tXaFFFWUZuUHVQTnBMMHlnZklHWFVXTk9lTjJPa3o2cDJ3eDRGV1hFT2pD?=
 =?utf-8?B?Szg5K0I0Q2RXdWlJeHBNejQyK2JnV2lvdzVVZnkrZ2Z6dThpNTgzc3NLZU9p?=
 =?utf-8?B?UjRTbGhsWXVmL0ZUVWpYdXU4cGdLcDVtQkZwZkc5K1E5bnB3TVZSMzlYT2tQ?=
 =?utf-8?B?bzF3ODY0S05VL3RyMVYzM09seEVJdTJsUE5pOW1KRlMvMzEzQjFERXI0eUVF?=
 =?utf-8?B?cXgwbXFNK1FHODk3NktrNHpkNlN4NFZjUkRKZ1UrWjBVZ1dESmRoRWhjdzNS?=
 =?utf-8?B?V1N1THBiOUZmaVNJZkNkTExycitJLzZzb2dyNnhsVGRKdmdnOG9vUUFrYy9U?=
 =?utf-8?B?Y2M2Uis0NmV5Y21IRnY2bGMwNzNoVlR1NE1HaEM0ekVmMmlUbGV4YU9yaXp3?=
 =?utf-8?B?dFQ1QWM3N3cvK1hvd0lQeGpjd3VTcXM5S3V2WHN0YjQzRUw0MUY2cm1hM3pn?=
 =?utf-8?B?NXo0bzUySERDUDRQMHRiVHVmanNONjIxQVBZZDAydHVOUFNpOE1PSEdwRTVL?=
 =?utf-8?B?RmltVmZWQXFLbEtpK254MlJiYkxpcHFxVHAzNVE1MncxemREa1hoOEVRank2?=
 =?utf-8?B?RGc2ZzRHVXN0S1ZLWVhaTEJKdkRvcDlDV2ErN1dick5VNVhlV0g2QkhvQXBh?=
 =?utf-8?B?TlhhVlZYNExzN05OcGNYUFlSUzltaGQzd3RDZnk2aXFRT3dPRW1pNTBPTHlG?=
 =?utf-8?B?OVBTSEFKcjgzUFlJdmVaMDBTc1NJRURyYWwzakwvQjI4SnovWXl4VDhJMG8y?=
 =?utf-8?B?SzdPclorVUphVGg1d2VIdk9CU3pmL3Q3UVozeVBiMjJDQXEvTExmV0xkZDVQ?=
 =?utf-8?B?SEsrYjA5NUNiT3hjRFhYOEtTQ3l2Y0daWHVpbWxBdWJNUEE2WkRtbVhpWTFL?=
 =?utf-8?B?NXpMejR3K2xUdzBTQ1NzeWpob1dOMTlEU091eUtXV1pJekZxR0wyZz09?=
X-Exchange-RoutingPolicyChecked:
	FWzSKc3FW8AbnUDuO8rexE9YBV1KpdRf6IMnqZdA8wk7Kw55c4BTng6UBb9MTW8izx7RF2qVeemQ+XrgDfV6F7nY3oskP8GTJzFke67XLqSbgjxADqu3rdFkj5TVgda0BXrpRqXFEZysjUwxYwng5wTbxOOFEpPw0qMjz3sGce+P9K2BDhca+ru0oYEg1hxUkM7wnYbcSm3FclBaeB9f/jLSpOAdp4MiaezEJjBx/p7Z7WbGnJSUgw+sTrrIm+xVVpY9BAEdr/fnnKVxq2jJXRSr11atmmgabaPQBpbmGU0evk+dyiX/QCvsxwf/GvZwJyWVoymPQuEsrdkWPorwWg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc9bdc0-575b-4f7c-43d8-08df400ae9ec
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:46:12.9004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fa6ahDH9mZm3IMiHWkgMKbDTzv3q0NNx+rQZB1r2pKrY8UbMEUdUUNSYGfkppIdSxUjei+O/vFUGW3YLtN0xHFRjjeVwXqpAFELuU9nSnFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB998632
X-Proofpoint-GUID: zbg2tqb84OK2BneXyj50DjTZgtiFMLNQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX3QUpVlOiAK+6
 FsG+Qs9+5e3CR95n7LyHtWKxHz7XcGXSTRydHl70ADYtXg4HSwBTXTIdCD5gvKed7XUVmw0So/+
 p43cgFs++570qipBiXeKf12nKE7NqaIOqVHdLDNcwKISckZDn++r
X-Proofpoint-ORIG-GUID: zbg2tqb84OK2BneXyj50DjTZgtiFMLNQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX18M4r6GUOdBB
 j2A3upVPq22aDRBcU35RWLzGACQbPLSA0Cs8mODnL7vqdvoet9qdqrJlJx9lKZuAzjOhZqOlzPR
 9TBE4U3PUXqT6UAHpYyWYq1Lwr0y4RpdON1j0gYV9XOjZM5/RMOAMpbcPEGPHK9+5mTA2TmgfZC
 /+Hs/IWxCD8zosNWPADM6LwZE2VNyV5J8Hin7YWiw3wjphF6I03YUyw4eQd75qu9f5XRpdd0fjB
 J8tw0viczENEnTai1IYGZjLsnQgAtByutWqel9aJl6Tr4Y3cVIro5Anl837fgQ+ZEK7Pc1iXNrZ
 5ovLHMEfuCh3kJ+wkx6Vk3AID/tKqwFLGUowbpgYxla9VrP8w8KSoRAGtIipe1a2zpipYRDPwNW
 OasKYOa96tVij8qdKdSWXczK3yxPAU6yUzxRGQ7JN/D8oVcuiuKASZBJAnT3QXuzfhqxQcW0f+n
 WEE5dq5unaBjhPV8t3g==
X-Authority-Analysis: v=2.4 cv=fcc4WEQF c=1 sm=1 tr=0 ts=6af48e0b cx=c_pps
 a=PWz2vMGk566g1z9MD32Dlw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=tjWEKVCT-AxKcshQlcIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:24:24AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> Add snd_soc_component_to_card() to soc-component.c
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h | 1 +
>  sound/soc/soc-component.c     | 6 ++++++
>  2 files changed, 7 insertions(+)
