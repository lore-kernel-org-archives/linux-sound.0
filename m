Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794488338;
	b=yaXIig9t+F9tSbPsQ+ONuYu4T5nRW1tWrBsYjBI/FfjOP9Nyg1WWJ1PPtFxnM3EWFaFq
	 tFKLHeWLdbcreQgJpww7W3CHO9JiJaAy4wZc3fTXnS9b9HkabvBlpUvcRG0UxteVl+xC0
	 u2ASQbeAiWspTv4+vbAKHGlsVLUnze7z5/pt/zqxrWONahdJmVhCib/OqT4C24tmWWyv1
	 Y9S+YSXdNac7MYITofJS2D/7qwJ+crmcJX6ws8mW9SW04j00Pi/hYOMX9ip/NC5VjeuCa
	 QszSLzdOUCap4PY6mhJ8epsm9cpTUNmUMWPvWg04Xj5yFCMyMAFyVXU5K3YVJIQS93A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488338;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=443t2wMAB+PKAXBtzkRBvNM2FF+N/zq9Vx31wpLi9f8=;
	b=L37BX0Vn/wUEmxnT0ah9mLWqT5oC0lNqRHApmXqaBbU90wTh0igReLWcjXmz9NAvjBhh
	 LYlEF4W3m757dCW+CcJLJBqxw6+cNtV4Wj3FwuD0WRQ9fDp7jThLxYlj4omxR6N75GR0l
	 jdC5Hl5ZxPO4wQjYlLw3h5gj0KqAKmihKyn2HY4MQPYrRnTLMziHOmJmZTXzcjcJjEYtR
	 Cc2Dlid9PpG/wajyyGVXi72k3a4Z4HCDo/g4Vl3uXOcFJB/99/Ax0iF8bK3jt+51buJde
	 3XbxGivsEiLghOAMCMw2VrRT/+sLkJi3K4za1GqlB/8fkDN3qMVP5o1vctb4U/3xBZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=Tjd79JaL;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=oGalD4Jf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2FF606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 12:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC2FF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=Tjd79JaL;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=oGalD4Jf
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9iblK1090885;
	Thu, 12 Nov 2026 07:58:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=443t2wMAB+PKAXBtzkRBvNM2FF+N/zq9Vx31wpLi9f8=; b=Tjd79Ja
	Lzc9mHEIG0kLK0wSGgVFXjT1npF5Ko86AxyjSRaE6NjP3v7Ld2mjKypegZnvHzsm
	dDqFBBncHxO7+kJGrz4+0N3QLRuYZ/qz8b86F+slhMO1cagVGLhSeTGie29qu3cG
	Fxqj76WJTETsRt+af3kw7VB0CBJvzcGYGPUrGCf1QPHqL2s3dm07hJYZnlGrXmAM
	3FKKblCskAl7sV8DhKjEbRRKhWtd7w5x64oXmXGUZMaHlhdf3WYefMSJgdjj5z95
	p4sz6n0yGO9y+nTCZpLV8PgfC26x2TSUW5/MMmE0yoLgDkzc3kcnEjf2DHkXhPbH
	xD8iPQVyl6hLiYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=443t2
	wMAB+PKAXBtzkRBvNM2FF+N/zq9Vx31wpLi9f8=; b=oGalD4JfTtJL50n5A7jV4
	3Ih3uW4VM/kkHpzbx/ADtxn2rbJXOdOx58RT/5vLoz8ZG/vA8URUt2K3xBMpw9FU
	I+Awsdj5lk/PmR9F45ck/F5GzOffxoJcB4Z7nkymqr3dzt/MuL1erKzAB5J6k6PP
	BrKFNb0bhZKIsPWPqD6EtIVPWEIJK+Ry6iWCZmoeEIvU0g5i93e5SvyoWDRj1JHx
	pB02bFbYMyzz8+hSdMP5K/7OW1E57ULG9HB6HVtmLqI1q3N9cXMSdU97ZBMXNEB5
	aEUqB2DwArruTKh9MFLgUdCXyCvxJ/KjF0pKI6kZg8o0mSdTUSliYtdbLXzD8JA4
	A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013035.outbound.protection.outlook.com [40.93.201.35])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hvw1pde18-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 07:58:53 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIUGmw8BVmTojONzdlLkEVv8PCWUASYymGwhneaB0zRHpyxTO7jO4AbpeK6i9wk6e5EtZjELzeR506O6llBbWJuGiiYZmmriwEBi5Z407YXfCKGFaJbHRpJa39M78TntezXPk9mD5KW9QXYj+ammCU+qj6Mt+buLwlaMX8Zyz9O7scv+18mIAmOJiBfL1hWjgGO4FonpYuzwRzRvgiVCzxxKh6PhGA0jQeriXXYQLKkCiBiUxbn/Nlg7N2O5tBr/Ae+njEVVHGCTtSRCPnbJYx2JPw2oyYHX0Fw4FXENku5do3IgQPZtS2API9RdwckJNZcRhcLpoHOotPtYyVs3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=443t2wMAB+PKAXBtzkRBvNM2FF+N/zq9Vx31wpLi9f8=;
 b=qvnpvANO30WSodKT1YmEjFEAhleQCYtv3aiRKnjPZhpw+G+PX6oKuXyWD8RFU1gf+Tzr9ZSwMLSY1jeAhymbdkX4iIh+J90UG0P4dy5Fe6eGb/RGYWx4y1l8jgEymJqZFoWZ2qRARxDiE7iQCEUShm87ecsgHyzv7i4LWrGFmtprQaoeCB2UaalWidiWpgTqqh5LWhjLBe1LxzVZ9KTedB4CbiRkTmy3ZKSE1jrjJuE87IrGSbbZWFieyhNGyy/ygZWcRup57tmSc3qYK9pkq4NNf2cZyVlimZCTMAQE8rf3hjYlFNi5V+Dlqg73r0j1UxXQW1GVgaqTsyRN8bJJTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by IA3PR03MB8476.namprd03.prod.outlook.com (2603:10b6:208:546::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 12:58:51 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 12:58:51 +0000
Date: Thu, 12 Nov 2026 13:58:49 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 06/27] ASoC: soc-core: move
 snd_soc_del_component_unlocked()
Message-ID: <avW4AZi2k2KhA_z7@analog.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
 <87qzgq28m0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87qzgq28m0.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPAP307CA0010.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:3::9)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|IA3PR03MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: dc147838-3787-430b-046b-08df40bcb359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ip9RFe+2ZobFzacn6lKe97QVDbShXUGpnA7fl2yhgE0lssZ8H5imcPcr/LPRAEiCG05e/L857+lEzQeLMW/+pd9akc9yc/UKMB362+3PeCaqVnW5lnbN8LsfjJFOMcUV4Mka9JtS5NDKJrF2TdPqdFMENgRICeVQ55YYXUrCb8HtU9ajz7//MGatymUGqKtYN10R+P+BGSljBZOwWZelk4FH428PyoFiNWBq0sbrg0nK8rqzkCOZ5AEEEp+iQOP7zNOw1EsipcuMQIQqK5h7/Ul/abhETSkxu6DvNyX5q8g4wggAy0PW5V/OMg2pRwGC3r//UH28gyXnsffWjak6YN8tqGX7CuNl74kzjrP0fJJo7kaqCoazZVVxtgW3VxnLxv+KaPkQ7jQ1VSQv350GLjoyuq4/p53Gr6n1Jbcg0ZWYMnOfBpOU45elloYEsc+ZxkIEFlx87AwwiiVaWmanIH8lwOCp8gmHvGKVXwvqYbFoLymZU5oYMjLrtIXl275+zSskvpgfCskOUiCe6a6Ovv1QmTqe1A7V1EGeHR1tsUMA36gpkx54UPE59C84YABIZigqlNjyaQNd8EB5mQkiDOG4RTfoyXlWzKM7dTaWgifzmKkvnUe8RJeOILsgEazxPtKVln8XZPjyDJrD97ViITjZzZ/44JqvPawxa6r7YJA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzdDUHJJMUREVHROcWpsb1hra0VEWHNnYlVOL25qdXArdnQzU3daYlhpMytW?=
 =?utf-8?B?amlFZHh1TU1GempsdWtOV05hN3ZSOXhBN3l3SGhTQTQ2NVRhbGJicVltQTdq?=
 =?utf-8?B?Nmc5cTRQTnFQUTdkZ3hBVWhDcC9MeTk1cXRGNGhucmU4QzdRMU1WN1F1V2N2?=
 =?utf-8?B?YndMZnduWm5Gc1JPNlZaQjVRSEMzYmQrWmdTYnd1QXNuSDY5Kzgwd00zYmhG?=
 =?utf-8?B?bmppb1RpdUNkRGV3dDgwN1ZSTm9qUFlaSnltbmlrWWlraDhQWWU3MldSVzZS?=
 =?utf-8?B?OUNSeEl4WTF6WlZxbHRJNlhWTWIraktIMzJieDdvY0tyUFdZWGp5by9QSXRI?=
 =?utf-8?B?QUMvbk1tUHFDNXh6R0pyeFpnSEhkUzBTaGd6ODJlU1dGTEZ6T21QbHZqVyt6?=
 =?utf-8?B?dE1QYUIvNURxUFJubDB0a25sMHNUSEo5b28rdU5LVVFLUi9abHA1OFlKeGpv?=
 =?utf-8?B?Z0JrZXowVXJzRUQwRmRxZUprUzFDQzVyTEtxSXlWcWdGaCtTWXF5STRDQ1Jl?=
 =?utf-8?B?bldBSnVOTTl5QmJFd3ZXazQzdzZjdk5QNllmeUkyWHFObnN1RnZRZWg0MVIv?=
 =?utf-8?B?M1c4OUhuTDQ5ZWh0Ump6NXloZFNBR1MwZmNoWUM2VmpBYkgyOWJjK3NVcGpq?=
 =?utf-8?B?VFliaDZXQk5CdWdWQ0RUbko3L0NHZDdvS3luZXlTQnkzOStYUGJHTEwrSW1O?=
 =?utf-8?B?U1pqTXEzYmQ1bC92Wm01NVJQWk1uOWg2Vk9XMXlNcTZOVHB1NDVEdWJnbGRj?=
 =?utf-8?B?NVVqQjJxUXFWTzZLRHkxVmQzdmwvbk1IWHpPVjdhYXhON2NLbWo0dUphbkF5?=
 =?utf-8?B?SEZ0ZWZuZ3MwdEx6MHdpdkp5NWl4ZVd4ellrcDA4YWpoeGMrUVI3SGNJeVN0?=
 =?utf-8?B?UmlkRW1CVjBHWldBdXJqSm4xMnYxcTYzNXRpTVNlZ0I2dFhjMytoS3ZwMEp4?=
 =?utf-8?B?cVRvN2tPTEFTNUk0akFYZTd0RXpLUDdrYnlNSnV6eFVmZk5adTdyZVVrbDRz?=
 =?utf-8?B?WHpZSGJ3V3VEeDhoc3N4aEtnRnJMZWlkc1JOMUgzUWlaRWU3cHU0bTVCV2hM?=
 =?utf-8?B?emVadk16WmFoczFNTkp0eDZVYkhBOG9Ub0NDcS9abkZnUEpZMWgvQldRYWUx?=
 =?utf-8?B?WGRGUGVMTzVoR29XdWRMVWlBWThWMVNwQkZiSGRxaENuRnFGOU9Oemo1d01s?=
 =?utf-8?B?V1lJanYrU2huVTlVK0ZwaCtjNkR5N0M5dEdJSng2R1RObjgvTjVhUm9vTFh4?=
 =?utf-8?B?TkVWZEh4MENFNEJLZUVGNWtqRlFEWTBiYXRKeWdmdFZxTHFCQnFqL1kxWnVj?=
 =?utf-8?B?R1RHWSs4UFpuVUkzalB3S3Y1aEh2RXY3aEpZdkFXVkllV3RWK2xGVG1tcTlR?=
 =?utf-8?B?aGpxM0JYd2xDZEhqTDdxRUE4WDNIUk5NQnJuRjBnTFA4ZHU3T1dmU1lJY0hi?=
 =?utf-8?B?NzlTV0dTdTU3aGVkckdmU3p2Nlp1c2xiOWJjR25JQTBzVHRFUUpjUDAyRlVS?=
 =?utf-8?B?MUJuSVFIRGExWUZHeEVzMmNzRlhZeHJzMG5LU2VETmg5NHlKdDFwK282TlQv?=
 =?utf-8?B?c1dwa3JQOWxsUEpUdzNHa2RNMm8vN0QxUHBsc1hXMXNoTkJudjk0Uyt3aFRW?=
 =?utf-8?B?bnNGVEpWSVFTUG42Nmkyd1JEV29kNENjTXBoTXRtc3cxMXJSODM2SDl2a09K?=
 =?utf-8?B?M2hWeDEraldESW9ZRUd5YnpqVU1aZ1BlVFl5QmJheDFzbGJpNGdob3BsTmF6?=
 =?utf-8?B?SFdmaTBKaWNOTTRIS0pyQWtNZGVnU0pWbmlrNXFzQmJrSmFLYTgraVRyTzBG?=
 =?utf-8?B?TEoxL1JsbGo5UHFzZWVhQ0hRcTh0eC9Tc3g0aGJPdjQzeW5PMjB5UTV1a0Jl?=
 =?utf-8?B?dmdvWjZ1aHF0ZE95UUpadDF4S0VFdjhPTFlOTGhpd0hEaldFb3VGOXd5cWps?=
 =?utf-8?B?ZytQdnRyR2Rvc3YxUnIveWpYU293Y2JqSmpQUmdMZVMzSExnU2EwWDRRWHE0?=
 =?utf-8?B?ckFQU3k4T1BmTm5RYTdoejd6RXc3UlcxbmRuUnkyK3pCYWpTR2czRjdHTHpn?=
 =?utf-8?B?b2x2dGQyOW1pT1JhRVdFN0dNTDFzcHVQN2JHM1QyckR3dVRBZE14QWloRTBL?=
 =?utf-8?B?TlRURHB2c1NOQzB1WVNJaGdSWVZZTFZMK3pQK2l4UlYreGNkL3RMd3dZRitD?=
 =?utf-8?B?Z0tmS2ptSW9KdGhkTE4rZVlMOGh3TDFid0V2NjJGdWxVZ3dDUTB1bXhtU0M5?=
 =?utf-8?B?Z2RMczdrbmpSTVp0WlJNZzBsT2FOdk1aM015YUpXOGt0UG9SaDkrQTByRWx4?=
 =?utf-8?B?Mkk4aEczUWJMb2hTZjRaRjVrd1M0L2J2YUxaYlhXYkNSWStTRGdGUT09?=
X-Exchange-RoutingPolicyChecked:
	Xp8GVSZBh6nL9BZu+8zFaFfB/kJIp8YDzSiKzPA44NTZ2agR7tjtup14vPzrisxHDu3EKgglGtqdXKxUr3Stk6hJBv1J4DVbBCRi3aMlY1Zr1l4hxR7NbnE/KWs5J6103+DNfR8gwuylHw+HQePTx4KSs7ssjZCfC/0YhMpfY9L7d881SW8lIHwzQTr5lilLyu1u36hJwLejK2tu8oFvCGq9YjtEa6hHKRvNgjARpxhX6nrhIS/wYs2eHjkVtQuQhkm7vWk8YLLcqBdaAP33bd1JBI/VYeUQfPq0SRhAnh8qpl6/BBG/XsIJHcouCjMcyr+4TkhNeoH4awZydZEOIg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc147838-3787-430b-046b-08df40bcb359
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 12:58:51.8370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2nS6D/+wtJB2NqJ9NWCrtbMlrY+xZ24lPXgewpSK0Vn1qO6zjrr9n9Zyp6n6uThyAewRjUIwQgHPgbZ/QBht38kjbY61kOkPRxyi4or++E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8476
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX5ani+2BoBbOt
 L220yr0IqaL96Rz9tIPmUKfa4GhdH6sZPTsKVLyyRSNX+m8RqcNMVGBCSLWEhYRTn8x2X4PseIt
 r/YaTrwul3RC63bbsnU4I/fhlhwAxhEAALqyfAKlyiDRr8Ky2gLY
X-Authority-Analysis: v=2.4 cv=N468hG9B c=1 sm=1 tr=0 ts=6af5b80d cx=c_pps
 a=5s0qIa4y+KO52koKvlB/mg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=KYvlCke2GxwS8U4c1IMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfXxMbOfxhq30OT
 QPKMwyGZtlsjEGs5ayOrCzvW1zI3IT5xoClXY3mGApRERRu+wPaqj4mATpNVKYoxSsxxemTDQXd
 hQhHjoj3qv9+Q1AnbkzNOQOss0Ng1m5PL0H8jFmZjXmM28jmQ+f5x7KuZhHdw7zL3USHEf0uXms
 SLCW24mbkrJgx3fkPJuCGJiaS6eNOr99UwCBP8fBJ4ZVjpP2c8PFACxfMZHTW6JIAaYVPa+Do19
 oSHfctun0ruLuu6/Uh3cMn90U6JduqKUk8Zq0ouptuP/9XQd4o14AwEWh2NMRZM2pfNWyFQSVma
 ysgABHH7vmRhPKairVyU5HEXcHiT5bNQwR0gzpycxLtD1vjvVf+B7GUkHCMbxmEO71/DITCGB1J
 sGmP7Lr/EPcFoPtfAKZ9QK3+E8TM51F4Lp9kcz6P6IDdN79rJc2mfNL783u1UusSFhfUaWRjtQ5
 Ntbq7VBZDaGjvua4G7Q==
X-Proofpoint-GUID: 8Rp64OE7dj7PmH6qXjFCNiSAAbQUkNO-
X-Proofpoint-ORIG-GUID: 8Rp64OE7dj7PmH6qXjFCNiSAAbQUkNO-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120051

On Thu, Nov 12, 2026 at 12:31:35AM +0000, Kuninori Morimoto wrote:
> No functional change, just for preparation for cleanup.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  sound/soc/soc-core.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
