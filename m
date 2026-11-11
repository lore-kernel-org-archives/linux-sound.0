Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412049;
	b=5sg9Jd14T/xo/4aUgjY9n7+OepScIcw21MJKFoPMRcabqeKbY/Wx73GCufb+KOjxOCYJ
	 C2JOKXdVOo+bvTMrjBTBd7w8kLJjaazd2ZMuUcJJ2zJ7kEXvdmdq0LzeFRIDjhhqUrqmi
	 VOjOSXvLOTYZzcw11c4KkgqXmfOdJI7peDbinmnfjItf7hukjU1wBQk49anLgGqXSpTWJ
	 /OQtDENGSLehFr0Etv0pJE4nyC4Dv5+0AtQkSQ01uGDR3l+Pw2qWgsaUhXgUvxvd+HSXH
	 YUhxirPGbCjcS1XE3Hl3NzRHPxkxbspxY490pchmiMNfkheHpByWKvcNOPQW2NCVa4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412049;
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
	bh=xlCDqwjCNMqej7QSSvzIkFUB5C129GUki3Gs7+5X6jY=;
	b=Bb0raMbw1ksNZonRZ3gNv1ZbyNPvtoPgbYwU2gi7+z+R0j6FHhOFqxu1hM2JAcZx5ZqT
	 uVnMpG72ZRMk5Q5RJ70Ijaa3fgGpFCRRpneJL/Ou9U0S8bgejaNTqiJ23xkgqftbEflnU
	 PqBf5Bb8NsxmWwKh1ac4Q5RXaCT82CuPmZ3SlZooEffKciCKe6FkS9PO3n5IsR7kLF3uL
	 lr7nafIdI5nFyIQrjEqNRUDYLwL4hhko7u1NdgE99CZR9RXkgeu6FKSNmp/8Vix76cKR2
	 tL279wCptIt1YLBe1Zm+rr5Agw+LJjd7sL+SCQxJ645FYI5++YDZwV/9asNZLazYcUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=i2Orzv3H;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=oeJ226TN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6959B606A32D
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6959B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=i2Orzv3H;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=oeJ226TN
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1jfW409524;
	Wed, 11 Nov 2026 10:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=xlCDqwjCNMqej7QSSvzIkFUB5C129GUki3Gs7+5X6jY=; b=i2Orzv3
	HL4TjMqPTEB/f6htrdH2xu5S/KlrILRV4AI0xF2V3o2iPU6vsiLTQwpLfU3fqKCd
	LJKqaj4ha63iPF5v8N+K7xLZKSYXLIzemf0DiHszpYWMmobMbVa5V6u0UgPnCKVV
	KaoylFK6oluYr35XmHjXW3HyjgSm+sWCjR1pCJwN/h+Cb6Z3S7yoSUABMyKvIrOl
	CT6nObiipWjxVVCVzrUcABSS8JljLlV9VspZqmLK84piCflhSpqg0/POtXMYcX8z
	sMk7g5C98LrtWK99uw5mUdxL0DIrS0yByshS0gpEtZINFTOtxN+Nc1ASSEgYrmr8
	RCGqhCjTP+SxEpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=xlCDq
	wjCNMqej7QSSvzIkFUB5C129GUki3Gs7+5X6jY=; b=oeJ226TNEfZ5nF9BeYgb2
	tR5tXCVSfvB0msDs/ZlHDrTpsCybmITFoFjBw6xleaCBudNKl+S9bQWKJXDjJVJD
	UAtrwwCjuuuO2Akzp+1LqcbgZSIYyjyk3igGqGt9btiNedF6dyIh/EgTQFYfEvKr
	4wca58H7VcP90RRKevUtJG8AWn/jiPdxJK+rToh4Sw7zh9SYNWNTIpJlyhU1r6RS
	cmNHyjy6/KxRdY/5lxn+VTKK4p5XfK64pr5Zh02yIC/O1K7gs2vA7dqmMcm1dxsi
	OOpuK+oFzkdYUHjRtv5lANhjWbu3PqYJPZbXiEGNLkY2UDye4wcpYPZeFme+3uO0
	Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvqu917e4-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:47:24 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dr1b/OVQBRO8yYteZ21n5x7Fxf2qbO435r0now6SsMhmjEaR8snlZzGYhUi/YRXyrQcQf+9G0/+iCJwTDM0v0zZ0mW9oxXnprx+lYgpCOf2eDbvnvRf8Rpuvq258OH6ld/3Sy0fdQEMsw4ymMp85zk0b1oqkwHH8yJxc25fvtVac7yXiN7DG4ztY2tF9XWniSxBPuG8MI1F1DBSxguKp57jI/6KjyELZ/ECYB5Zp43etsVW6bXmtCPylOttjdZk1xLgBAbh5k0Wu08T4fY5nfxyHOg/2PjTAdlfykOmlgwa2/CGiz0QD0ISKqJCkHShnQzKn9bWVLnKBSJVH1OLOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlCDqwjCNMqej7QSSvzIkFUB5C129GUki3Gs7+5X6jY=;
 b=thFcmLZJYVJqsCbk6NjiRmYpEHADt8YQc6Yrbm9CpmwCzo5YDfMsao+IdgWkNAC56qZIjO4L5+KpXtitRtgu4ytrQ8gvUq/WJbUhpcBbCdIIA559YPfBfmmg37txnNcdMHudU2ZYE0Nc2jTJ19EIaM5OjQMZud5dC+rrhweTV6Xgr5rGygPDjF8GOzJo7s4tZ5wVKj0vdPtzNsbiF1JQfJTkZi8N/CzZIR9gSDOWfzgwDsHd3KgIhxV60e4POX+yNVyeuqQawhRSAE26Ru4KOOVHFAHR+fxN5Pnb617M4qT+6YV9k1eA4vqDKTfWYvOzCsOsPkaAe+Mp1BdiHU8ADA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by MWHPR03MB998632.namprd03.prod.outlook.com (2603:10b6:303:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:46:26 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:46:26 +0000
Date: Wed, 11 Nov 2026 16:46:23 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 11/20] ASoC: soc-component: add
 snd_soc_component_to_debugfs_root()
Message-ID: <avSNx7h6EWE5UhMf@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87se19mf76.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87se19mf76.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPCP307CA0010.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::9)
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
X-MS-Office365-Filtering-Correlation-Id: 31d9755a-cae3-4459-6825-08df400af195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261009223027099003|10067099003|261021121427099003|261102123227099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KyZhCP475bvq9vBCsuWJWT69MqgiQvPUcy93NQmXohYCuMa6B8fuo8cqqXFBdtrZ0xDMTWBc59P/wCwKDm9uSKj28r8FiICjP3/OXMLBxHtsJ7e5413OP1FMAbU9Pmsg/OrRAtDvoBcpFbtCnvuarte9Fva6KG86E96QW3VlqclkVyZr1zhAV2q68zsORS0EBLe/vhy/zXEAJh+SIz2O68HIIDb2DyOtbvixMe2QO7DQgB0ubHGQcllyQcVn66ix1RbHd7pQLOXfUYqIhNfIfVA7axCQC60tlyob54Pl56ygQgg6LdFUQqCs73x7NHVC37oVCTD54OUHTBDirvT/B1DCUNbfBwSaEviO3qE73bkOFKV2psTII4d7OXDPLH17mCju2lnSsH0vfj68PoJf08pgHF9662vlVOISE7ZOFlhNAttYv6PWTgzP35+8kjpqizG2tohhgrNrJBL19R9wv5htPwRr+zjQ65s+kzwvDedyLK66EZ/ibymEHcLTxmfXLGSfDhuS+oXH0t/iEIyENJtM48aCssLWlm5UwiLrkSYLPJ61J0MKEsMeEYhX8zCLg0whVM9cyT+RZFuaq5D7/clS/EHmdGzOaGi4tlRCajuMR83Enu0aN1bAlmD7kn65laL3DiHBlOu1ZjcGI+ARUCAqcqkzYx5Xbq6+lUW3ExY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261009223027099003)(10067099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nlo0TjF5MjZZdGFzR3hsTFVoZDZLY0RLeGdUS3hRVWRpQlRXUzY5eTd6NDlD?=
 =?utf-8?B?SlB2NXBxalBiR2cwOXhxZVpUZlVsdHErdHBIZENHMElGQXNBOC9XbnFmaUcz?=
 =?utf-8?B?Ump0N3RRdHZ6aGthYlk1VW5wS09sRlFrejFRa2lXY2pKQUJxR1Y3aVpYWkFw?=
 =?utf-8?B?V1ZhMVRQQSttQWszdElkejZ3emJLdUc1bHpDRm1vNkhQOUZTV0x0ZFBIR2lY?=
 =?utf-8?B?bmRoOUYwSXJNaktsYTNxczhML2hsbzhjTlY3dGhrY2FER0dCYnk2WDl2TCtP?=
 =?utf-8?B?cEgyWGVXR3R3SXBTOG5xYU1VVEp6bDdsam9BdFc3d1JnaUVjaENtOFBJa2xN?=
 =?utf-8?B?LzhmVXlvODlYWHUwYUg0WHhYWDd0OE1JTXdLT2hYQjNiYjNQeXVlNVNqcEo3?=
 =?utf-8?B?cEp5Vk1RSE9tYy9tQTh0Z28wMmVzRWJwdzJvb3VKc2QyQ20zblNVaEgyb1BC?=
 =?utf-8?B?SVBHVzY2akVQak9hOUNOVHo5UVdBcktoaHRwdlp4NEIvZ0s1QlNWbEM4Q0ty?=
 =?utf-8?B?VkJkYzRzZUZKL3d3MTlBTHBmWlJRSnlDU09haTR3MTBWa2hURzFkQ0pKaUh6?=
 =?utf-8?B?TnBmNmF0WnpRMUk5d1ZRWkV6a2o4WGhENlQ3Y3NZRy9IMW95eWJ3R3d2SE1y?=
 =?utf-8?B?N2d2QWFJY29CUVlReEFBdDY1eGR0RFVnTTlRV3dJUkdkYWNwOTU0d1dzUVNB?=
 =?utf-8?B?ZEV0cDQ1MkZQRUliaGFZQ2lhMUNKQzR6ZWJCNXZRcUY1NlFZTy9wdmdsMlF4?=
 =?utf-8?B?N0VGYm96TXpQUHcvUUlIMThBcEZUYlRmTmhSTFN2bHVJVGV3NUdZbU9MaW8r?=
 =?utf-8?B?T1FselNtSmI1bWI4UFZTbGxMajlPNWhHYllWTElwaGpiSnpkMkRzaldxSHhl?=
 =?utf-8?B?S1hWV1U4Qnh5dHlnVUVYTWk2TWI0N3JoMXJpNmlFWlJXa2xLNm1ZNU1OYW9h?=
 =?utf-8?B?R3V6SUhlZEQrZHJxWHkzUk4zVlBuMmgxbVBxc3IyRVh2bE4wWTNpanhKbmhi?=
 =?utf-8?B?bS9ieTBxajF2QStNazZzZzhpTUY5TEtTaEhWV3BHZDFvQmZmYXZvdVRHdG5R?=
 =?utf-8?B?MFMvODNRRnptWkpPRjQ0N2RWN291UzZUQ0FoaEcvUUltemlocXpBaGZtaElJ?=
 =?utf-8?B?UlMra2d5WHRHbklwTkREL3hOcDBsSjE0djhOS2hOTnlGR3hCVTdXK3NBb2N6?=
 =?utf-8?B?V0NsRjQrMG1hQ2d0d3RaQ3NJMk5Ib0dKQS93VXBjeXYwRkN0VUZvQ3AyTXFO?=
 =?utf-8?B?R29CMGUyUmpVVEtpVWp6bFFnbWxNaVM4T1YyOG43OURad1JCNENvYklEWnRL?=
 =?utf-8?B?NklnRGRJMVVmeWIya1pxSWVkdndvS2hWWXRHN25HTnpWcHYyKzNWSCtDWkM1?=
 =?utf-8?B?QUpLQmo3VEV0aDR6bkxNelhnZFNmRmEvVUFzOU9tM2xJbkx2S043YkVtelJX?=
 =?utf-8?B?aVowaWY4YjY5M1NhaHZNdU5pVjlyTGhBVUVEYnRMNGptODNnTTBNZWhrUjVu?=
 =?utf-8?B?SFo3cklTY1NaUk1KVmFnSFV3cUVEdjBTVlRvNWR4TGdWZytpZ2Z6bFc5ZS96?=
 =?utf-8?B?dVlUeFpIZ0UzMWp4ZUk4dDdUdE9la0pFL3hlQldJUHY0TGsvRXM4V1RCR01W?=
 =?utf-8?B?ajN5akdIYWRwTlZtUTlDalJCaUZtb3FNdW1JU01TR1NhRndqbUZOdWJMK2Zw?=
 =?utf-8?B?cUtMUUlRMHI5RjJRU3BYMUhmTm5lOW5SZlVoVVdSVWk4a1JyVGdVam84Rjdo?=
 =?utf-8?B?WTR4aSttdmdWdkFFK3Nvc09wRWRqUFd4WC9UUmQvaGxvNlJVY3ltdmhRcU9m?=
 =?utf-8?B?SjZ3QTBlR25QaXNXWnFlMU9jNGk1Vm9BWks0djYreUpkWVdYUFUwcGhFZm54?=
 =?utf-8?B?OGhpdWhhR0NqU2lncU5veHV4d29tTGUrcElSeGNpdWptVzB6VWd3cEVpWEZi?=
 =?utf-8?B?VFJhRmlMeGdHT0ZoMHBta3hXOFpvN1dpZGV3U2x2dk03anYrbDNwTWhKNFRu?=
 =?utf-8?B?Z0VIMWJLWUZLelAyY2NvbzF2RlJkd2N4cWR6bzlCODhMa1p6YjFWc21oeDJL?=
 =?utf-8?B?b21lNVlLWUR1RFRQU2ZwQzZYWFUwamFEYWxmYmRYYzNVT3pjVFNJMUpxdkRh?=
 =?utf-8?B?TXNyWDRaUTUwbUROKzZ1NDhBblBxeEtoTlBHbjdkOTA3Y2ZoV01JRS9QTFEw?=
 =?utf-8?B?VENGUG9PU05adEdPZCs5UG5tY1lMMTdhM1ljZTJzb0RlQVFvWXpVTzFiemR4?=
 =?utf-8?B?ZnRFalRueXRlaTcwM1hvS052RWVJc3hBRmptNlJOQmRKUUJPR0c0V091WlRi?=
 =?utf-8?B?U2RKOFdKL1VySit0UU8waGowcnFXbkJuTnJDMEZwVkJlcDFKaEpDZz09?=
X-Exchange-RoutingPolicyChecked:
	GymfWVlIeOnylbIqJRpOWdFHB2Rzr87pW7sKN3/C1qkZP3akG5i2WpnbugX+Ji6K/0KRiC0mNzfDOT2pPsqfrACIguO/QVFG6zjYGH44VEGK7YzLv5HaMr57bHj0UiukK+OVBu/jvH0zvkiVqYMOCzJszbW+FoyZkpRxFAXYHjdDcNe4cqZMt/HQZtCWasjMWgSyLyxLXeTC6it2adBWo4VTELUSUpS4Zun/4NA1F8vBUeXUeQ0uCW97KVXI2IQXHBL08tQ59JKIjPW0ocT5vOUl5oV6YUenIakD9nBYANBQY6JruzoufC3mrZij7hc+34FKJHpzBd8HPKif0ng4Ng==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d9755a-cae3-4459-6825-08df400af195
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:46:26.0274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbuhnlqqlBYBpVty3kixl9SkaT1jJBpjRfq2HMXcmfRwEFRxL8sjT7qZa/0ba50KAtNrKP9L5lEtlb7X0gMwoHlTKWtuXAn+ZYofMbXoans=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB998632
X-Proofpoint-GUID: bcGkYbONjuQ0bxsSztl06WbynCHI1vPG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX0Cxn6OSRWMci
 Wo/Uquj9NlVuh4fmDmMKoJ+WMuNs9moNiiR75RI/qh5u9xnxSQArddkYGIDsSjlcTA3v+8eRCML
 IBJCJea1Zmx/yKRSBz+6EapfJu7i2wO/lCFVAvC5vYMLqYxNtI24
X-Proofpoint-ORIG-GUID: bcGkYbONjuQ0bxsSztl06WbynCHI1vPG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX1U3PsKUdmGdD
 aj6LroIiC14Cy/tTuRT3ffLv/qTyTRQR4Fq005EBfiyiOaOOqbQUEm+oMg9SKunCyv3mhxAykSz
 iz/9QbfPdMhVjdRmqCydoch/XfteAcG7BsBHrSAQFP3aPlaj0nZkGeAVQW5zX0gtxzpENzTLp1x
 miDAdq8W35doQcNgvxID/bVP5z7YuGBANCE0BWhzZ3f9ZT1yPOW0mVy0AlSW4iUHwr6ZqDUUXb/
 Y506QgWQ+/++MHlZmHU1EZ5YJwmWMYeUDI5ASBs01PdI61YpkTUk7kfoRB6OsKQYAUPOAx8RZHC
 /nHy0kbAX4M3ajnp67lZE3cEW4FPd1NLTwnu1duTpA/d+hVas2qsbWluptv1RPCMRfFIxwVhIsp
 3qGaGT1ZepRKGAg0fMC/aqrboTWNC5uhOvQbtYno8q3CMGgw9+zm0zoHttv/ivHaSszy2Xy1I7n
 vV4t/snles2N/rp7C3g==
X-Authority-Analysis: v=2.4 cv=fcc4WEQF c=1 sm=1 tr=0 ts=6af48e0c cx=c_pps
 a=PWz2vMGk566g1z9MD32Dlw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=_xF0M8GitKh1NRSYBSgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:24:29AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> This patch adds snd_soc_component_debugfs_root() to get
> component->debugfs_root.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h | 1 +
>  sound/soc/soc-component.c     | 6 ++++++
>  2 files changed, 7 insertions(+)
