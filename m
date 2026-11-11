Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412072;
	b=aWDF7aBeYadDl9hnFg+2Zae28lb7FukHMAkQHitnPphGVW0Mc6msIwdMDS/r28ZyAGNg
	 HecSmtlGrfVfjvf3eyByYfB2RBxUFQ71bIvhgOHwDesKNDGI4ofIvwvNZGMaq7++UgoYK
	 BhmPTDmGfndTeYYjXLb0MeNxNBs9JPsgLhjW0M2yzr6+VT4qcq8OjSN/a+5MpRLzLHYGi
	 DhtsA5jkmVxkdm+7Jnp8VsBai/nidSJJuSZ70IiMGSeq5u7fOq+9T5JUqvEoL/resQE8h
	 x431Ew0JMA+iklN2XJZYoegpiZnlJQltH45xbl92o68APupr2wHAZnRo+plUaiM/t3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412072;
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
	bh=qS/ctE//m8jrJR9nq1EHZTNeOEAgd2jQglu34tApvXY=;
	b=B0UcZ5PQrssjyyP6Ulx62fI6OuO+obesDPcIPg0fWgngQhuhaZ3e5e4lhGeR1Z8ji9Y0
	 GDyfR35OhGEqdKdZ2klVUMijMbPbc1FqLXDNiqgT1kypK85OdurXsQjEipE0QMLkl85XR
	 5l2MzMk/7BcBTUgTJ1woI7vmE7qds93LmVKv0OFWfTC2fyxyy+VBTwpGsIwpNyvBoBUMD
	 XsDC8YdNuVcus6Nz//6qPp5z4aufY/1Jbp1doN0kKEsVEpjqS75SBtiGeX+nvm9FgevI/
	 rr85W8FZu1K/Q+pmJryeecR48yxHrB8MGL0haSO7BYx1XO7FyFOL9RFXf6+zzJNML7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=SfR1kJq6;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Us6rSE8g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281E3606A324
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 281E3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=SfR1kJq6;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Us6rSE8g
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1k93409531;
	Wed, 11 Nov 2026 10:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=qS/ctE//m8jrJR9nq1EHZTNeOEAgd2jQglu34tApvXY=; b=SfR1kJq
	6MG12Q/EdFU8jokKM5CD8N+pHktfjxT9KKnMsHxi00UE9S3DiYO+IA0xtO7mDHhU
	whD+KoH6ZjFvjdJ7L2Kpr8eHWuB0B2fRHwDnDtsadGbac3S8fABsFK8m4EdJNTX5
	xgF4M+av1iDDTZvj94FruBx9ee5XgXsWTFBjrcAzp2EeEvRp7HwgWKhQPKUU/hsO
	BGDrmjsyEB2Vbhys9LXjkgdEC3kx4sfW8kZPQ1orxw0LgjIYGqM7OOPdngOugYFV
	ntaooVkNhDUrSgEytoA59V0R9oZWRQSL389YB9TU8jUw5XCul+mM5VgcOkQnIE0U
	+WXdMUGpL7dJbAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=qS/ct
	E//m8jrJR9nq1EHZTNeOEAgd2jQglu34tApvXY=; b=Us6rSE8g8AYdY9UCIbNer
	njb1OA6HiVqT4BkNXFV9IEAtL6t66R4IovM+g6MfVfZD414xgkpoMfAOYZH8UUZx
	FNAfNaCgw+VAGF+lNJVJ/ilrbnq/X95fMUdEMn+BULzdYtZ9sQ4Nva5yaZNuB9Lv
	xZFP6d2OqF18CQ88IGHPA74WxxUqld8aH4nrCnypM1qg69AnwYUtmc4d7cx9W/WB
	QyTOzScOM0ja4g6oOork4pfmTEB0vZtW6v3LAlPh+rbsqVUagoFul26WJwuRlprs
	QFuoNHGLyPYXxJrdr6HA0S7khi6MioYq6FgSY4ZO4anJnfn1eGG1AHokK4kkCYb+
	g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvqu917gu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:47:43 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPA474jaRSv1UPiqFsc7bGSXSOU2SaLWSjUr9ksEQk0IMaaNKtWiUtL4MX2oC4gHulSthHHQ0TPUvdTlgMIwU/OcGCItQtvGHWkg0UNvQOQWN/YSB7GkEsCU5BEKXWJoxJFEMRZi0hFZdqrQRoZ4RRLa3lACtxgfTvBlkzdL+TqfHHN4qoEIC1ySBWst7w9gdKZymVYlAhvSe0AfPZtC63HX9lCgVeEW5kdDXpMdPoPBD0M4dAoer9ukRZRbeOYn/rWrjrcU1rIk8TqvwnDOXc0RI0F+OMzk7JXv1XcPueN8dFn2g821Bfnnnm3JSEb+GvrJYzbGDAYm9sUyNMD2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qS/ctE//m8jrJR9nq1EHZTNeOEAgd2jQglu34tApvXY=;
 b=A1n66wW3t7/BUWdUPKqKXZbX2NxW/hLjzH1WIL8+SN+P4294bHw8GbxNfGyoo3x8zvjD21i2vkrj9dVuKpeB35VC+iZ4XHaK4kJo5n6QHd1/c9AeaapAlxQ8DeJb8eG/M03ThSIEp/bcPPVM5qYVyyv1mC8B48bjXN9imIhPNMuFMtcN4DLQf2ge7rAOKzlrYyYexlpLcKy1LJIwIrCFx0DOolhw2DYut979rquSPmpurneKvpHo8LmhypQ/paAWfJLY5ucRe6iSjV526qbTRXcNiip8siQfffd22XYurobckmZh8piFPA82AI+q12YuDVFFcNmRkGek1HK8C+2nRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by LV3PR03MB7480.namprd03.prod.outlook.com (2603:10b6:408:19b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 15:47:35 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:47:35 +0000
Date: Wed, 11 Nov 2026 16:47:32 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 15/20] ASoC: soc-component: add
 snd_soc_component_regcache_cache_bypass()
Message-ID: <avSODpRwzSbAjiFk@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87mrrhmf6m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mrrhmf6m.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPAP307CA0012.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::11) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|LV3PR03MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ec6e97-92e0-47b0-e262-08df400b1af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|261102123227099003|56012099006|11063799006|261021121427099003|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	XGroE0Unc+4PXtrIyn/JGqhLMWX7AXtlnUggHQ/6Bo0ayO9DHg1UIvEwAaInyz1BAA8Ii+ILZ0H1ktTpKwlkZipj3zUJw5gjkAjXRwGel5W0cHRLcO3BlYTyNu4CKqt5GohSclCEfzc49GelUI+uDf2YDX4IH+CTsrNs6Fj2iufjkH+cFLLdjAF6oXUABhQ5zXkzRWp1F0Vhfw0T8fQpUI/Y1gnH7TTdLmidzOgxHPk1uyFKaTQJ5lXLkXtwaSVD2B6ZXq1ve6fPs4gt8lXdPJdtH+/ljTFAJz0z/XfsjMsm3xx9M6ZkSCWai0qSL+QpcJIXLtzX4BGCW+XkXNgnShMb3etH42dLG+oo6HjiA85utdFyngY30eupfeCgeaYB/2ALbUiEpRwI1HeHu6DphrICnzNhtZh6N/hBHZGf8nV2gIfLYrlAvFCBndmfhVc7GCFW/n/nE/Rq14KYA+/ZIw+wpjXImHdFD5BFi9gdureRIb29kgWRIeLbN24FKzHiksuu8Tn2dqILalWp3x4621MNaptS7uN0ypf8QY19OPvhnEPzNyWen3tQ4LpFssFhT+P6++TAwUVBBOylEos0c6gaW6rttIcw2ER9RBnxnXMa800ZqYAp1bHKhWHt8KeOBQq3XNnPsx26vLULyQCf7iSqBf18o50obLBNejSN9PY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(261102123227099003)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck5Zdkp5M2VVWW9xTTF0K3BZcjdTcXVjQnovQnMxRzU5bXNWeU5uNzZJbWFN?=
 =?utf-8?B?TnJldDlwNUxSQ0tRV3RFenBpY1ErZ3ViRDVkQ2V1eC9kL25tUnpwTVZobU9E?=
 =?utf-8?B?dGZ4QnRnNm5OdlkwNUtNa2pKdXVaZDh2ZjlseThlbnNjSk9oZ2sxZDMvSkYy?=
 =?utf-8?B?MW5OVTZIbzlOK0JHUVoxcDk5aXdvNGtPTWRDOXR2YS9xNTh1KzlZVmEySW8y?=
 =?utf-8?B?L1Mrc1k3c3RJL3h1UWFvV3owUGJzNFRLTVgxTTFkZ21oWXBMWjFwZGtYdlBB?=
 =?utf-8?B?bmRrUXJTM0hyYmdqd01UR3JXR3ZMN2tXVHJsRjFoOWpPZmRvWHM5TlpxeCtL?=
 =?utf-8?B?Ky9RTmRGUy9sdU1JNlBvZ2d6Yk8zTStDWDZHS3dwSWNLdHhJUFVCWlJCVkI4?=
 =?utf-8?B?TUN2cGJNd1Z1NzZjRDNHTENqOWdzN2Nqa1ZqSDRtcFBKTWM4SUlCNWI5ZVdr?=
 =?utf-8?B?bWxIWXhzWWFWSFVvV3JvdjBKUnNNdW5JNCtOTzNaZFBXMC9CT1BKQ0ptUyt6?=
 =?utf-8?B?T3gvaUFqSEU5am1iWFk5d2tMU0tUNjUzUENTcHhRTUVkWmNrcmNWcTNTZG42?=
 =?utf-8?B?WFpPeW9KaFJQK2pSZ1BIRTFOVWxvZXliSjZCQy9kL2JZdktpUjdUOHI3MkJT?=
 =?utf-8?B?Mm5OTU0xNjA5aWd1K3UvMFlwRXJRZVhtcXJtTkM2R0p4NjhPYmliV2laVVZ3?=
 =?utf-8?B?dVNNN2g3WUNGVTdNdkFoM3J5TWdBNGdySG82S2NRbStmVTFyRVZXSUNwOVow?=
 =?utf-8?B?dmRaVzhFQ3NWeVl6eEJBaE1JeHNMSGcwRExGb3F6c0N2cW5ZQlRPbklrTzY5?=
 =?utf-8?B?KzQySURRRWErRkdPSFJFSWd4NDRzeWpHRW95SVk2UVJIbW5OTzdxUE1oaWZN?=
 =?utf-8?B?bVhFcEh5dVU2bFJRSzl4dHdEcmErcHF5aFZoaFBiNy9HRTU0U3p4Uzg4Nnll?=
 =?utf-8?B?K2FSSTF5NUJINmlOamtHeE9hZ1dheVhobmN3OHpvOEtnT1N3VG9mVXpaYVhu?=
 =?utf-8?B?SFVZc1hPb0NaQStNbzAySnVYMjBtNzFmaGFQNmJXMzJmTTBjUUNnYTF0SWZJ?=
 =?utf-8?B?c3ZnUWNjbnpwNVg0a1hPZ3NjQWVVaEQ1OFp3SHBLM0tUaURsbWdvVkFRMEd4?=
 =?utf-8?B?U1JZMVVTbFF2L0FzQW1abWJGSWFrT0JuRDhwQ1RMdWJPeGJjMitHWmxnQ2NW?=
 =?utf-8?B?bFpKMVU3OWRDdjM1QW5BSlBsZjhVd01EWS94NUI4UU5WRXkvTFZvZHJlRG90?=
 =?utf-8?B?QjloZ2d2RUxvZ2c3N2lLbDdaNGpESXRaRnRaOUpPREZkZVZnUUtFek5DM1JY?=
 =?utf-8?B?RU1Ua3c0L3kvb2VzSm1zN0c4UUhCelVZaENnZVN4Z094aElwU3NycGdmMzZl?=
 =?utf-8?B?MVRWRFhmWmRkaVliT3FjSjgrY3NpK1huWEJ0VUFmcFB4ODU4a1VCTHZ4ZGtC?=
 =?utf-8?B?aEN5Y1BvSXhmUXBzNU03OUg1ekNyQ3ZPK052cDdxWmpBZy9HRW9lU0lPdTdG?=
 =?utf-8?B?cXlPUEUxR0dRMWhldkhQcWVKdm5kd25TaG1VNVpHU2dZN25JVlBDMW1yVUlM?=
 =?utf-8?B?a1FmNTAxZ2MrNTRNTG0wYzVLNk51Rm45K2VOektyMk9XZW5BRC9OWHVrZDFq?=
 =?utf-8?B?MXdtUkg0NXpzNVY1MDJOU2ZBY1U1SlYxUENqS3RRam94UUhyMUlLdFM0dlBE?=
 =?utf-8?B?eUduV25hbXJXSnh5TVZ5K0gzOFc3OHVqYllHbDA2K2dzWVpzK1kydjd3U0Jp?=
 =?utf-8?B?Y2dSczJ2WFZWTm5HM3dtcXgrZkV0WFpGUldRd2hpTDBzVFovVkUwU0M0VGpU?=
 =?utf-8?B?VjdjbzZreWxxakFRRTY2dFRBekttQStjUXhma1J1YmQ4d1YyeU52djdVTXd4?=
 =?utf-8?B?UEZ1NFFwbEZ5akJBY2RQZWFuaktEVGlsV0dLTUZvKyt1UEF0QXl1c1c4Y1Aw?=
 =?utf-8?B?Z0plWlBGVzl0Z0ttYmtoNFZQNEdBMHRjNFErVlh5UGx4ZXErWW9jeW9zUi9h?=
 =?utf-8?B?anRLUzFIOGhubGhqVG9oV3Z3azh2TGlCZ1lpK2NjbUFEbnlXYWFyOUFIZHh3?=
 =?utf-8?B?ZityUHdtcmo2SmhUUkQzYjdvcnYwT2U5TXlycTBJMUFmbjhITnVSMTBzdzNV?=
 =?utf-8?B?R2M5cVpaUFcvWHNlQ01nek43MVRFRGpjUk50SmRvS0xnYks3cnY3aWxkM2w5?=
 =?utf-8?B?TjVZSXpoNUxxSUVnQXYxb3hMSkpzV2ZnSXNkODBnYkN6ZWl6ZFZBMXNra28y?=
 =?utf-8?B?ZzQxM2o1V0p6N2lYbHhVTVdkMlN5cVp2Qm0yMFRjbmh2aG1SVldGVkxKNzhw?=
 =?utf-8?B?bWFLc1JSa3IxZDhENWE1QzhPU0xraG5hL1hvZDJUaHJRZmxZQzhhQT09?=
X-Exchange-RoutingPolicyChecked:
	RYxOkdbq/DZwsNW9+2pJEN8WT9Cw5LU1It7+B86XVRxwHngYjFukIEQLSgJ48L/cg0xSUXi1C5Owxh8FZc1UmMcsgeOk7XcDbYaDcuzrALu/evCSDY2GHYUpoLlzFeMQZXVQRTuPUqI/LIPTpGO8LXO6BeXOJo3DpL5iKXVRtqy9r36HtheAzjRUL23CqMeGFFp2efffhXITFiXImTRhNNsEhQhh2CprIh889VvB0L0lFlj1ewTYZMFztA7Ivs+0QkkmcmNkdhGl0y2+6vNFNX1m9deY+iRUoKRQ5n1M6jq/lJaZY0Lz4BpZURSDOedmVOKF048swWtGAmzTjDQQ1Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ec6e97-92e0-47b0-e262-08df400b1af9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:47:35.2141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jtxi+aTLntWIMEjOBc+Q/Wnc1qwAitWNS3vQGdXYIB2L+oN6Ty2YCUxW1sgoX6eMj9VbjffElVtsx822UCc+GxVXiGDUPN7B5GKsMPMmy2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7480
X-Proofpoint-GUID: AJgNg1UDAsY2czYORb15DFRySyq0a3jo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXz68SSy77ChB4
 +4FGWDfiujFG3PJ8hmPKdnTb6wCKENpjCPn/rTXC9YJn/ssLqqG0bIORob8heF9B02FIvdY4Wic
 1XgCeGwTfOZ5vavXlsstFYoiztmbLEeUsSyGRvsfKYp+3z6u9DAG
X-Proofpoint-ORIG-GUID: AJgNg1UDAsY2czYORb15DFRySyq0a3jo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX1EV6LpmsKQ4g
 oSaZVkVRJrui9bpiA7ROKRd7ObD1mHKKqAQoApW/1bF5HskKSyPwhtR133wzIfGNQ7zHgk+cs1w
 Y+A/o+hx4c/COL3WZSZb3kRmC7Evjoy5Isexci6dut5iNqw17kt1lmPL/EOarJgobRkVeStGkHL
 ogENpMaysBY6V5R3h4utPy7BpqIYHV2RJ9vakfgHWTynnu+BObmuQcSfqXJg8Lu1VK4l5wAkT+e
 0xZneqMoOz+R2FGB5Y5GFs3nIe2dOfaL59o95DueP2sKNVG2AqMeVDLEQGhAFZkV3f8/DzWcW+I
 ZII/+bRAZkcu4rpUWsiVbSjSZi1SV+y+fWnTiqWzVtXAM06THXLjhoVazdRddPZ7lVBpvhbvJnT
 +xVIbSPnRNs/UTp984ablct5UyQSxhFglq5WRZRCaAXtLDh/fHbNBdSBYjbxutDCys48CFQz3VG
 DHi3eni6ehHCsmM/10A==
X-Authority-Analysis: v=2.4 cv=fcc4WEQF c=1 sm=1 tr=0 ts=6af48e1f cx=c_pps
 a=CTIJcRslT32CQvadRVAfuw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=3QJhiPys52u4Yr7VaKIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:24:49AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> Adds snd_soc_component_regcache_cache_bypass().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
