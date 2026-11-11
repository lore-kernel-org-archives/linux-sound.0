Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794411967;
	b=WCoj1rcWmcCqHd79M9NthFSmFyRyPdIHUOkkTkkMUbYk8+k1XBEvs2KA4hJX8kVd7jCq
	 cOunK9Yp87XoIAKhgepfhCrdfD8WkZvdrTXs2wQPbcpBTnYk6l55jNkkX6jJ+b3YRnFSu
	 KtFt6+nnt41GO2Xz9/rhj9a9RUeAEbU1rVzGsXyypRuw8Dh0U4+J7/2dUCO8ySZFDhX0H
	 vK36n5bApvLovwiYDYsM1tY3f0SYFvGtTAAGXQd32fOMJrD7nH5iNR49LqCEl5+7rP0Z2
	 +wkqa1eFv7WpTjUXiPovID0cJNUZ9NBZDGG7NWi6t/ZBHvYIL9TdrihRM4Deb0Ksudw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411967;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oxqzuXmA214CEEEwBU82tkaYecavRWr+OAJq9JZk2NI=;
	b=3uw22q7eW5L0gjsM5dvFtbFcOYsuIVuyp5t7kESfMR6uGovUbjLE5dprHDd5GmiOhzyP
	 QTSoT+1Di+u/D//vQF64pm3SBGPzfnzI50Y0H9aPVE/AxtovjWfs3RFlgVtS/+g4Jyqj8
	 c0wcvbIb0WxwkjbAlC5tWsATGaDe7O+ou90jZyJuO5belVhJyHqIdcXduGg9ZP867GTcE
	 Ct795xX2jJeIu+E4UhyY5hogWAQ9Y8KB1HhEnambAWlNQClxUPLcque/HoX/rmPT6QJDx
	 SasbgFong0E0iS0kajPYpcNPCgyjA+KVoVPSo+8/3qsUUfw1RMiEKyOxJIjgaYk6Btg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=j2wNkNgt;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=hw8wG5bB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF2B606A32E
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF2B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=j2wNkNgt;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=hw8wG5bB
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1UXU652321;
	Wed, 11 Nov 2026 10:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=oxqzuXmA214CEEEwBU82tkaYecavRWr+OAJq9JZk2NI=; b=j2wNkNg
	tzXZLiN+hZiXoRvrHhFsy37z7Oydp18UEogd4imMZqJwD3pIkKCtEuYF4LscGQGx
	luLLIiQXv214T8mUGxcmzrQ+UziUjhyQlXgvgvgFTEjqKLbytLBStPuyLTkOyZum
	a6bF6MngL4ss9PsG60XVVh8gACk8kXFjEOlbM0t6G/b+HA593feZO8laYfbqqv62
	zpfcHMqaTdzqkLwgOI9Gel8pafJA8hGqp/TsKN39g7eLjN43WMe6WpGLf/95epCI
	d116L/Zh3+J2JXZ5tmoE4b//zbeqEz70zraAJgyOTqYbwuMuIN2GKlqydDubmMli
	dcbn2BXdCk7eb6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=oxqzu
	XmA214CEEEwBU82tkaYecavRWr+OAJq9JZk2NI=; b=hw8wG5bBOZ+jG8be3pTCo
	Cnep0mvdIt+Oho2pVrDCx9KQqeWB152hSoyC5TvgC5tb3g/Rljo0BlOFERjhYAf+
	CcqSQLWMVO52RijHgwSaRvFZcyKjChAMXynAeTgfaB1rdd8DQq3zxvSUU4yR1WhN
	i5bH4h9Awxj14KnyM9Ctv5Zgn/uqkV3KHzRko5+ee70Qz1+OWRKn+wNYaOWz3Bct
	b3To2z/VwzTvbR4u9z6At4Z74GBdRLoCz9uHvk/ON4/0oNzsNC5l1fldwwrpuI2Q
	Wndxr8NRh0QvMIukFlsEH5sst4MuodumXh9w04VI6YsvH71vgoqJMOQupAVA1uWD
	w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvg57ur20-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:46:00 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYwrhNxcbacSOA2fE2r5DCcoay/fsh6gL/Zhj1XPezOydvKszZ0ZjgpD5QMEzSLonztoYiPhap9s1uET5+JBiTigu5bPM102nA9yKLcUoCewWTtxKRrNi414XlPM8o5ewAPygOI1A2O9EMj3KDpF1xjYu9VYIzCohyjWoTuFsGbp31QPezZnlPdWWX1HnyQqM9c6ln7jn36yL5CYZUtRH8EliRgjwj8zvW57jMzAvrIOklIl2CME2rBUu5DbASym8KN71EduJdr7HrZ8GnF1EmWukcQnQN5VU9HrMxyj73TqwAeIOZK1oM59U+T5fSppAeY+PnU7Tw8b5kcG/55c/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxqzuXmA214CEEEwBU82tkaYecavRWr+OAJq9JZk2NI=;
 b=hEitUlm5KvjknlY70E7XtNIDt+DwCYzDdsGmIp+k10n8S5SkKUMs5T9Kg0VfA4LWM+dqv6KgHmsp2fKGfuxix8tIZ4alLD5A+auDzJNZOBbeuLZe1TSGxj/iT/oDAPK6eV4xNGjrWbtuWvnWzOJGk+idAkKP/3ZsfwqZMftueP9rZGu7ulOeR1/FonfHyahmMqGOaVSfuUmZnYPAj54zoME5sJa20XgVeQmmrfxAyc0Os9LHOsm7BJnvy+P9eUyn1s1lAnB70c2Z+Ujgs/6spUF9+kdXbWSd3S/iW8JJVaiJ0yPsDt155dSVojLOm2Hm66wCqTvsDZwWQ+vc1E32Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by MWHPR03MB998632.namprd03.prod.outlook.com (2603:10b6:303:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:45:23 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:45:23 +0000
Date: Wed, 11 Nov 2026 16:45:20 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 06/20] ASoC: soc-component: makes regmap function to
 inline macro
Message-ID: <avSNbuRlFHqP_Rsm@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87zevhmf80.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zevhmf80.wl-kuninori.morimoto.gx@renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 274e4489-f0b5-4f84-6695-08df400acc2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261009223027099003|10067099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wjT/ABGBTcLi/Q4P/sKabzZ+UcSRreyfJfFB7LKG90trfZK0fWUsVxsxpbkiYG1kfDNOKVfCBchW3NSvd89HQX7k0iqzadVXCpus5KPn5vwD1Q+zmpeiobZ/iVxPUL9ZKwNS9ien+yrIP/oZ8C2iGBD0FHHrNyv6Wa3l45uCNXxglqDJvgIJRDxr+gvYIF170S7a7Ga4iOCHul0HCpFNx/OTRv05mCCnmFHve4JlC07MDAqeZfdDdIEhts7lTSJxBymAN2ybinkwVtaS2O8D3VFDwDzpxUr+95g7nYljLtgGSEGqi/69hkavrvBSQEkox1Y2r4FJb7US7VNFvHOCRPlyr2/gHYOevJBb0HqGVLfMSXHBhRHGmmusXTBKG87FPBcHy6Ncq+PadC29gyzrxWQEYfWNU402IrayDilDLnvOQZmdhMs5BTZ/F0myoCZh5vYcc7ssqgtmPNWWdUO8UjRiyaigSwlsI1iGLMa5VIL5JfNcvDuVsNZM7G47illkI0mXi9pf1tzJIH6krXiyAmbOCpHW4YhLtg829mNUlPEdfmDHX1YtJEpEUBafWDEAFo+uM29rovzSwGpec5+6WwiSUNXYtpgiA5pE1hZPsV8DX0uoSf8I5xg2GBtmM/P8tWEImHxJkiGtm8JU1W8P7y8bqVSZ/L1TSW9toQdxYIA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261009223027099003)(10067099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0pSOVBXclEwOXY2NDlET0xCaEhPc3NkYm9VV3NrMlBEbnJhemlDQlQwMDh2?=
 =?utf-8?B?eUVDaTlkRllvTzgxMy9tckN3NXBEMGdWZUxjYWRwcXVUSGVPckpqZ3pvT0Nm?=
 =?utf-8?B?QUF0RlA5TVlsei9CVTNObkJ0Q2FVb2xWRUpXTm1WQ2dQRk5vR2JaQU5YU255?=
 =?utf-8?B?a2dHOGFJektBVmtYOUZhUHZtcWorR1YxOGdST2tvR0RpWHZwTExIdjIxeDg5?=
 =?utf-8?B?RUYxdXpjWTBaZWxDRjBWRnVIQmMzbFdhVU5Gdnp0QWRSVzdDRU42TFloaU91?=
 =?utf-8?B?b0ZhNzdDVXJXR09ac1U5eEFBZHJEYmRpQk0rM1RIcGVUdGZoYlZOT0wwOFpS?=
 =?utf-8?B?ckpjZ2hWSFZNL0xMM1REU0ZHNTZCeHRaR1pOSkQ2SGUwcnYxZ1dEU21wUmVU?=
 =?utf-8?B?OGdWUkZrOXRKajhJekxLT0N3SEMwVTF4VmJwNVBFSWE5bk1ZRWhsWUU2bSt4?=
 =?utf-8?B?b2JvMjVsZnBSdEtvWmtJT3ptVk04bS9tSnZ3bGpKblZvSjRRanY2UG91QVgz?=
 =?utf-8?B?VHZoSlUwYjJ4YUkzOGY4QlVyU2E2Z3lDdXN6aDg1d0ZCdkMzL25CK2ZWQ1hE?=
 =?utf-8?B?bFVWU2Y4ejJ6M2lTZ3JGK2FXWEJGV2V2Q2kxWDFBVWlpcUYwSEkzSHEwZHE3?=
 =?utf-8?B?Y1gwQmVpWlR6b3F0OHBUNGdWVEl4d1lqU3dXTDRGK01WZGlzc1h6cS93NTMx?=
 =?utf-8?B?RkY1MUVUZ0RZOEVpb1ZPcjNGZEQraTJPSWdGc2MwTU5LalVnc2dJY2NoZEVm?=
 =?utf-8?B?NWg5OEl3dlNRUmdCSDArNk5aTkdWNnR0OGFrTU9ETWRNUFBnZHlCS215SDBM?=
 =?utf-8?B?cGNtN0Jqb21PeXphWlE1R0t5cSswK20wd1FGS0V4aFZ1bDVKZXVVaVlqTXlV?=
 =?utf-8?B?S09GME5SVThJdkw5M3lsYzVBUm5aMkV6eEFJK0p4UUtNd0J5bXJVMXRQbTZn?=
 =?utf-8?B?RXQrb1F3ZndqZGpOOWNaemFWUG5WRU5vdEN4U1VRdWdFNHNSdDZRY28wRFRa?=
 =?utf-8?B?cldTUHVKS3JjZ21mNFhiVC8zbDJ1dXNNME8wTVJMWDdZUUoxWkZKTW5SOG9B?=
 =?utf-8?B?d0tKS3JUaitIZFFjZXFQYXZMVmdaMzMxQ3lGOXhzbkxyQThwdWVaQk9oQUJV?=
 =?utf-8?B?bUU1WEljOTZySDd6Nkp2RHV0OE4xK3V1bmhTQlZrQWVkOFBVUFVSYmFNOHVi?=
 =?utf-8?B?NklXUG5KOFVncHdHajJuVG1KZW5GRkZ5ak5Gb0hpMlpoQXdQdGpBNHhNbFN5?=
 =?utf-8?B?NDBmdFlhUitLTUxMKzlzVEpBcVJmUjNIS0lJQkhrU0l0MCt5Nk4zUmUvdzRQ?=
 =?utf-8?B?OENnRnQ4Qmc3MEM4T01SWk8wS1Q1R0czOW9ZYWM2T0xpd25QTzk4c3h1dVpy?=
 =?utf-8?B?WWFPSWxMQ01nS3dsQkxHSFdWOG5PQzlWQUZOODQxM0I0TzNBWU54Z3EyN1kx?=
 =?utf-8?B?VjFqT05rb3pPdXhWWXNUbERFemhld2lmYk5uZUFGT1grT2RwdGtDWGRNcVRh?=
 =?utf-8?B?cElsaFcwbWIwYjlXS3ZzcEdNV3VOTitGT0R4S0RyK2N3ZTBQMWN2ZFo2NG9j?=
 =?utf-8?B?ZUV0bFBVYlpudHc5ZHh0cnRrUGRRdG9sWXVhbThVeXN5M1d0Y0ZrRmZPUGpw?=
 =?utf-8?B?N3RqNHU1T0VNNWZPM25uUTNPQkN4bFp6ZmFmWUd4ODY3YjdzVmRoejVzeTRT?=
 =?utf-8?B?TEErZjdldVc4akE2UzBnOUZldDNQc2w1dndNNkh1cVFDQjJDSEtRcktuQ0xx?=
 =?utf-8?B?SWVXQy9kRGFBZFkxY0lTaEpGRjl1SGhYczZGYjZ5akF0bFdUT3RZMzYyaWVs?=
 =?utf-8?B?cnJEMThWdmtJMTV3cElSL29KSHpxL0VyS21SVGsweEdSSVZqdThqa1dMbG4x?=
 =?utf-8?B?dzlnbHhZYW45WUl1V3d4UWQxelVWS1dSS3hUSHkxcFZQVG1WbEVHMFkxcjd6?=
 =?utf-8?B?ZllQbTkyMGZqZWtaNnNweVFJV3NGZmo4UmNGTjY5STFCVFFGKys0Nk9hMkY2?=
 =?utf-8?B?aE12WXgzVEFycHFhTXJhRVN5dzN5a2owcE43SFAzcVBSR0diNXkyUzNOcVgx?=
 =?utf-8?B?TCt1VlI4M0NCYzZ3UGNUdFNtNHVXWDVybExZNlNtdzBDeDhSMUNDVGx6Z3Nk?=
 =?utf-8?B?RXIrV0hUV1p4YnBDYjhxbjNFMDExREcrdXZodnRheEU2ZDlTSlZBdGE3dmRL?=
 =?utf-8?B?eW5LT0Yydmx3Z3hzMFVYOFNndFF6eVM3SlFqeXFQMWkzOXc2blB3VjVKRVlJ?=
 =?utf-8?B?QW1zbEYvZVNBOGNJbmhQbVpMRU5Ob0J1R0NXbEhrTUpZSFRJajI4MmFrZnBn?=
 =?utf-8?B?UkFpM1o3b3U4STJSYmozY0VaUGFna0w1Z2cxbTFWNVFpNDlVYVlpUT09?=
X-Exchange-RoutingPolicyChecked:
	B5KGBPNi2gbgFhOXEAnMvRtNafElZc3jY5Bh2vn17umd+SiC/vgU66dg8b7PtVNLeL+jjF2jTlI1LPQHvZRDx4CNo/ZZLyeKtz9I54XLNAu7eRP1rFHFZOw8AZ745fbjFkZWZ9mYAbesXGYk9g/SYAk2la2ZpyFZeKhNrVNxiE2Ur92xIyQw6JQHoU5ng8c5pjhTXvaBysOK1TZ8eMiIt2cCgJWCFcUc+pRqWclNAEmmemQKn363Bn+h+rE1bX6R/byNPZYMqejLz9dLlWz/ajMnM8Ovg3Lw6DGFWe9pwAnrZ/LpBfVjZN6YCFJ+VIs9956wMBgAcAf1/ZdQ4lqR9w==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 274e4489-f0b5-4f84-6695-08df400acc2c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:45:23.0159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3VxaOZunDZrHh1+cajdiduEHicoaOwsO6wjZFNPORBmogRLdAV/+bK2q1HPKnnH9YDCx7X/GX5W/JfgPfD6egmRotZfxsMonphQzC4F3so=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB998632
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXxM0EBaUydQvW
 dnw6tjsgbCytj5u1Rc0LVO17DWRDzll5SpRZ4DloNjBdUik7OLEJV8Q2v0cg5CiXikQeZgr8T52
 I3mJ61YUTE86gZ/gxQx44BZee+TjTRdmD/Akutr3eb83ya2LjL0A+d/k6MsY4NWIM4EyuJD3rNe
 XbqUk+VfdDHanxW6+Ectsq1UXP9ssd+w2+GmFmDoO+fos/oU2iyxx/8iYaql8KBomkTc4qNyAfi
 6Avt6ikBDyHfYQhd8Ux6qCPbvuP19RB4Xq15vqOjIt5UTxpGvMaoEzQHrP6GFikdMaPHLkLFkbA
 dGHejf/xmqeN+OiqL6ZrPXkBR0OG/OOSuigVppK6cyRbWKkB77a2lc55XbsxTMfVEghSWPkJmlK
 X/dDvc2sBG0kstusKeQR81kNigVoSk+7jsdvFS3kPsxlLjI/harSnjAV/D3hHunLDq388ctLp7F
 0zagnLoTuMQhLmXh5uw==
X-Proofpoint-ORIG-GUID: ATiz7xR_4WVpS2jh10J0J2tDt1t5urvj
X-Authority-Analysis: v=2.4 cv=ZNVCCn7b c=1 sm=1 tr=0 ts=6af48db8 cx=c_pps
 a=p4VQxza1WQsAsw6m3tlBZg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=_jAD5XSDOtq9-5Nde2OG:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=Tk6d-M3IkoOs7jyfdHEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: ATiz7xR_4WVpS2jh10J0J2tDt1t5urvj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXy+M2hJ2ZwZMq
 eFUydD8pAEUdfNGMaGj1jBkXDn69N4DVx0vxDLcnQChS9xm3I6fOpkS5IPnKNnMH7as6Fwcd8hy
 zyQ+GLdc64rnaXqf9JEmEmqtGHXHEXtjLZ4F2k3SGe6OkW8SSLEg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:23:59AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> Component regmap related function is almost rapper, thus very redundant.
> No need to makes it as function, but inline macro is very enough.
> 
> Let's standardize inline function naming conventions.
> 
> 	snd_soc_component_${regmap_func}(...);
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

sashiko is right about the order, but the patch itself is fine

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h | 52 +++++++++++++++++++++++++++++------
>  sound/soc/soc-component.c     | 46 -------------------------------
>  2 files changed, 44 insertions(+), 54 deletions(-)
