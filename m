Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793181576;
	b=QkycxXv5I/zN0vlnt0V7NsXL37ebYoVX9na2u0DN//xj97RUtPhQY2xCbEpRO4gYxIgY
	 a6Hs9jdIVSyp257tee5gtPzzihpHm4HhZmQP9o5saxpt8ovhomxYgILuFMu/cVQx17erF
	 zfFSBXxbrwKlVXDch+c831dfSfezbldLwU8kN0eYoiTYGOySIGWr46F/AmWn7f/ca39O5
	 apOyw5FZCAlxDFRlAbgDJsc6ZSNpZwEmOuzwqynPSoj34AdQBtCi9w2QCdA6XKJ03tN8V
	 dPAid8gqj/vhIknxLec/JGGmUvp6UbC8ymY89IxmsM55JXUO0/DU/dX3aYxUVs/MnUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181576;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
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
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ldyC/ZScjNLW2B0a5ESv1WvHu5HxLSie1hES0vzy09g=;
	b=v8rx8xvzplpPNxNwNVVfPjdmEYfVmg4wPtFQcd7Gm1I+CQkr4X8eMdEq4QIo+zmCH5Bj
	 V7yxUlD6X8uth1v4HEm9stiqylFIggAnYxLC93wuikksal5WwGaDCO/PaNxusSqOZd83D
	 CTZ+YkW7s0V5W+QF8UPTYZ/255fMVKeXxM1Xa6hES0ylU2gNDpojO/moykvDNObSqedE1
	 8XEpqxx5t8MgQyByK3L6PYuzZzHaaiiFTnHp/pl2Q4AuaF5OXko+vDx+p3BvPR9rfhtpc
	 0LCsdHQ5MoO9iDThxS60FcYZipEMOcTwt56J1lwS1lZzUuC2p+W632Lc5S3V4DSRGOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=YY7ss6AE;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=uROaPE3r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EA5606A31C
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 09:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9EA5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=YY7ss6AE;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=uROaPE3r
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8Gnno1540019;
	Wed, 28 Oct 2026 05:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=ldyC/ZScjNLW2B0a5ESv1WvHu5HxL
	Sie1hES0vzy09g=; b=YY7ss6AEhM+Wy+X6/jzGGOuEg4He0Gyw//sBU54RmMDFM
	GthMLrwYp+VYSnMd6Y/4kkGm5cYEbeLzVXyrSfxpntPeWt058uGq4ajBbSu1Skz9
	J3S2vThp9h8xIVALLOOvCjKLlcvrghVFG67q9n+3iYga6GNKxOGjFeyWMOo3mnBv
	GB3jz6RVCNiNiO1AFWkdM3mFTOy8jWx1MNGEbZMCU2EPZ7e5zoG+ZgQkwx++Q2BN
	Yq8Mi2gYtraU/0ELEvPROduQ1q94Y5fzMDif0KAkb65qIKFVgjHQbuuZMCBvcU2m
	pVb9A+6VFKKeg4hWMhm/QEmhF4kF5JZ9LiYLZ9siA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=ldyC/ZScjNLW2B0a5ESv1WvHu5HxL
	Sie1hES0vzy09g=; b=uROaPE3r50mOgXp8liTdBHz/a0UcMaV/Rt6IMVaL0Z+P1
	bI0Izpx3uUJ9JtNoYbZU0nnoupUKfz18Z7yoH009PPrLkCFrADBEuUP32q0JB8CH
	9NnAihtY0lG6ftNddhE5iotiBJx5ZpWYgDGoi572QPVFUrqXjbUfPac4/ePZVC9S
	BPLoAmC0jIEAOaTK0iTDbYl0bWC7sU0+NUkZDaLyfpKB+ZjKDiSRM69y+C6o/tEk
	33lhC2IyneXzlefUxhxZFsV+UQ9hZL9wh1U4IpLCfe/Ut/28xC/QrTJ6NDosOOpT
	3vN+khRf0Uf7oAR1XDo3dyj3prPNJbuWCT3ndPUuw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010042.outbound.protection.outlook.com [40.93.198.42])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hk9r91k4r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 05:59:28 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FohMr1v9YEfnVzR8MwU6tgIMoq9Q9DRrGGKlzEXSA4QQc/gEdHQynoJAw+by4U9YWIYqlAuwo5JUlhsbFPV5LATNRh4X3DSNkrUG48N7vl4xkUbB/lJsIW6xWm26QyKF35aAOTl7cHAzxGiZLVbWRbvIELszihusakN85F5q24IX+vSyYtfkS4avck0pMQLtRUjYF8O8iVCThOI/0KbXAvpz2FEWfyn/v+bk4tHJvW5zzYJ2pT/ZgYsusLU+kAh+31LmcQ9uVZDEosnOuVzxdsy9k3moU+67idkGl7RJPJ2UdKROt3TiMMOVutZ9AxZ366xBZqnfjb/xjxQt1DCGuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldyC/ZScjNLW2B0a5ESv1WvHu5HxLSie1hES0vzy09g=;
 b=Yq72IZTZeVDvFsLbEI8YdXsJBJe45/7u1EQKcVXHcEMQBWLh8W7AxWyoroPxzTCXYXlcmZUSlTVXJf/FXtTxzVdEn9tl+nRE/lcCcltiDYNdanpTrGXFAl3mLJcvAU12/o5b/MuHAOqfonJCJCOEFfl2pIojD1pt48PZxyMxVJ07eAeKJYXLov42+KGpobGt105Rm/1cIpvvTY+F8l2rdqvFJNFGebPUJvl0Qvs0BTaty0x0rA00wnHOG5xf3hdsgVt/h3Njh6US/jDfswXM/5SJ7xVIBqYXppTxiTctFJALr2fmoVfsmp3UAKrcSwBmDeEh8uR0MTHTaMy51SXPTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by SA2PR03MB5929.namprd03.prod.outlook.com (2603:10b6:806:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 09:59:26 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 09:59:26 +0000
Date: Wed, 28 Oct 2026 10:59:23 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 14/15] ASoC: soc-card: make unbind_card_list static
Message-ID: <auHFjRP6DFG46RTQ@analog.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
 <87qzhasezm.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87qzhasezm.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: MM0P280CA0035.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::23) To BN9PR03MB5977.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|SA2PR03MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: 507fe044-b62e-46b9-f79e-08df34da2670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|11063799006|4143699003|10067099003|261021121427099003|261009223027099003|261022105027099003|56012099006|261021123027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	EbOTNa/slNUnBEcjm8dXx5iwLON6g64myo3wpakBfALwkAYFTOvfiHvQdk1UosTAFd+XtWs/bDT4rhrGeDqLXiqPHWQ8fistQgI++220TVmi1942B18wdZC6ZBmvHme7yQJ+oD/h1hDE/6prdnGGiG5VYLk7N72U8wJRAqdYC1JTdMAQWjeJ7bYtXUodw0pG39zgZGfHZfVt6NXar9PVUJH+7Rqx8D9zO8j8hfesd8S2fS0hhVRMF0YB7wYf7PwF4KLZ+ts3nffWgvMHbBJLazH2JfvAR5gaetYeqmWAZt2LVThaxadSnvVk8tJs63l8oLWfQz5PjCur2o49JRCvX6afJZz/A1FCZZUKMRr2AveTlD8owycWfyZKVchz/4nRC0axcQw1PAaaKeEeVH8IV+5Xhce3Nj/bWZsLffRq4SuH/HqNIWxd79+fS252xUUK9jAdw2466FL/sgR1WSJm1uGUhuS6AIe9qCrQS8FqPZwyuJ/wVwYze2ZDsmGGMhNmCR6f0TOgzOhgq7/2KlbVkqUznHLqyYlZIQby5TNoJfGgwcasEd+fSxGLerqT42J8dc5HlRNV5y9JHZkrMoAY+ppf1tXpHlM/4pu1ICv6lBJkoT95oMN9+hadc3Pen9w0sEncNcRcRZ6/sgPxFBTKwy77R5UjwvM1JpukfQAFi48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(261021121427099003)(261009223027099003)(261022105027099003)(56012099006)(261021123027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFlTV1orM3VDSjBTUFpSMit6SUtZb2k2cFZGaHZVdlRhUkY2UVY1SGY5K3RW?=
 =?utf-8?B?akRsamRLY1RLV3BJL20wUVVmTEU3RnFkT05DemltR0hhcTkwb1hYaU1yOXdu?=
 =?utf-8?B?cHVEditWTU80V0lwOFNBeWZDeWttSE5EdDhoNEtrRnhrajBXS0FONmE5am0y?=
 =?utf-8?B?ei8zR3F1WWpCMzdhVFN3VElUK0NtMGtMZXlrWFVQZlhiSlBleTNtM3VLQm9h?=
 =?utf-8?B?aVJOcDNoUThhWGVwd3BTYytLUkJCaVliQ2wydVR2Q3huSHBNdDFOWk1vSkhH?=
 =?utf-8?B?eGd0R1ZXZkhnV2J6a2JSSytxalpXNXh0NmlmaGc0T2ljaDZzR3I1UWdLNldP?=
 =?utf-8?B?WDZlMWgwSThaYWVFMzRZV3lMQnpSSVBDdVNXS0tJQk1jdGxRQWdnZ0RUQjYy?=
 =?utf-8?B?VVBNcEViTElHTGU5cFl2dG04Z3k0dVBRbS9kWktMVHorTGlOQm5vSXkwaDRm?=
 =?utf-8?B?U0pZcGpRUVNnRFAzTExsUHI5d3lOZ3pUbml0TC9BVEN2L0hEMzRTcklKOHJz?=
 =?utf-8?B?bnl1TE1ZUDFkb2FZNFllWUV4UlBVTGpkazU3R2hYR04xNFdnQlpUNW1NSllV?=
 =?utf-8?B?TmFpMWM1V0tpVENJR0ZUbjVqeWpFNEhsZEY1dUhWTzFqb3NqOFVIVSsrem56?=
 =?utf-8?B?M2hOdGlFYjdrTyszUCtqSnhHZmluaytqYmt1cStPMVlzUHdmYVB5UGd2a3Va?=
 =?utf-8?B?LzNhVWRpeEJNenMyVlFNcjc0UTVzSUF5VDAwaFdmb2d1T2NoWTBRUUZSYTZC?=
 =?utf-8?B?aDZrdURLU256RTQyZnlsWFUzVjNKZUtFWnlMT3hqeXhmaU9aOEdQSzRUanJl?=
 =?utf-8?B?WWl2SDhGdEF4QUFBNTFiTUJ1bGx3cGlIaFZCN2J6eVRDSU9TNmMxdUVhZmpq?=
 =?utf-8?B?ajV1Q3NtOUhyQjJPZU5OM0YxdW8xKzUxTjBYdmZiSi8xaVdkWE1XOFJYeHE3?=
 =?utf-8?B?NDNzNi9UNVVsbXgvWldGc2VQRUwrVHV2WTBlQlg2WXRNVzJ3OUVjNi9jUDJr?=
 =?utf-8?B?RDlvMmljQWNhcENlU0JrcHpEbDV6T1orTEd4YjhEL3kxQTNRREdPWkc4dHMr?=
 =?utf-8?B?R2pMNlVkOTF1UFBWNVJZSC9IN3orcFRJcVozWldPbnpON2tTWmhjTHNIbkdo?=
 =?utf-8?B?SldkaGsyTXB3bVI3c3llNlN6Yi80d29mMDBhMnJPQnArOXZ5RldZQ2VJNXpL?=
 =?utf-8?B?aEI4cmZFOVUwTHlqeFRiemlFUFJmQUEwQ3VBdFpqMWFiKy9VZkVMZjEyeHJM?=
 =?utf-8?B?NzN4MW52RWhUdnBxYjdkalZDNDA4aUltMFFrYmh4dXRRSGVSRXFMVzlBRkdK?=
 =?utf-8?B?d3dUVmpDOEcraFBVY01CN09EZmlYbVFsTjhYUy9KdENtdngvVGpnbHlZZVBk?=
 =?utf-8?B?QVNzZUZYenRJYTRKQytlODg5UWJncEdvQlg1TUh2b2lieW1lU2hpRjNNYW5k?=
 =?utf-8?B?TjFjM2pmbDI2NFpBSUcvdmpOamdJUjJyVkZKaERJVU9CZ1BiSjBrUDkzZHdG?=
 =?utf-8?B?N0FsWmJxTnNQeHArWGptSDVabmRuMjBhNXRUc2pCNndWRTRjVDdwSm4rckQ4?=
 =?utf-8?B?d0QxdWFidjhpalE4Y0pyUERVbTVRWWt3OVgwR2wyeURqYU1IYlB1RzhHT1pw?=
 =?utf-8?B?Wms4Sjk5UlNxZUFkVjIzTWlDVnl5d2lRRHl6eW1UTjBHaHZzcWIvbHVqUmJs?=
 =?utf-8?B?SlRITW9HQWpqaHY5WmlMbzdxZStwMEVTVy9JZTd6b2h2SnJpLzJTN1JSd2Nq?=
 =?utf-8?B?WVB4eEZ3b1FYcjdJaENiUlIxeS9sZzdSRXRaQ0ZKcWM1R0tUVUI4c3FMYUgv?=
 =?utf-8?B?bkZONmhRMGpxQnUxQS9ydE1sVE83U3UrTWQ5R0ltTUU0Q1VHOFVLaGVVcmFM?=
 =?utf-8?B?UUIxS0tqWHJQVjZmYVBtcThYUFg4cUJ0NlhmM2wwNWNYaW40SDAwNFNjM1N4?=
 =?utf-8?B?anR5WUo0bUN4RmE5Sm9idWFmRlpzdllGSjBwdkNxZ0V6eTc1aUNtOG9pU1RP?=
 =?utf-8?B?bDRaQzQzVDRFS29Gb1VPeVpqNERoM2gyWnBnRGhvWlpQbllDRC9SQXhwekZK?=
 =?utf-8?B?S09HLytLamlZM1JiOGdTVzNYenVSanBwU2lrR3ZUUSt3L3VySzZvekg3TEV6?=
 =?utf-8?B?eld2dk8rRkNlKzJPR1pWWHRGRllvclA2QzNzVUJCczlKRHZtWXpUSzdyRU9t?=
 =?utf-8?B?TjdZL01LdXdORVZINkhrVFd1eGRKRnF6MTJuZ1JHTkxXN0psSS9FN2YrZEFy?=
 =?utf-8?B?NVYwcXBYdmJ6YkRxTlA5K2lLVmQ3U1dveEdZTGs0WEg2T1NIaSs2Q0tKeDJF?=
 =?utf-8?B?UFU5T052bXZ4bnloSUxnTUlCM2hqNzNwNjVEekVnUXo2T0dPbnpMZz09?=
X-Exchange-RoutingPolicyChecked:
	hJRupT/onyFJRJojh6ZZxRH56Krl6PH9vL/DVY+Ijk81kTR/jAyQtUtIO1TfVdaUOoRfaUFxIgtOndh6oT4XNezgbwDgjOrZ/ynQHWJTsm9wkOpgO736dBIXvK7NNUSYczOlvTvVxbDSfuODSbQj8RoDi28p2NB9zZr7DTRRHz0SJkHhwuauNIiWXWRS3sO/p7l1avUuCxeQAibMuSYopEVIO05MrbLzsthEAdjawLO1nf3HOb/698/CdTo5Yhwp9Jaori8tfe/LMD8/oxOQ/hn49zFq8WwN0dNjH1EdsplgRbFAjn697S0WjH1gE2H0aVrliGU/9ynHe2yz9mYWUQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507fe044-b62e-46b9-f79e-08df34da2670
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 09:59:26.4956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8a1QVDxLSP2N/73/H25Kxcnbo/Ke+to0r9kYPVYyb8FwFWJurXjJD5OBNcUFwyfx2rZfhVGbn6RQmyME2ofq3+ThBHCekDKJ+u4269Dl9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5929
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX5aL4RWEKxy1T
 CoWzrW9u7/jJln3LypgZ8ekhtvuEfBR1AJWrlejl7mT0kFVXbnRGw79btP2cKPZW+/9ToyN7aHJ
 Vyu+xQOrKBptumT34MRQ+cHn9UMuAUEXqiFAxBEJDRKXcy/P05NY6cbQl+oFE7UyMR4m0JLzzyk
 kBlN98ZBPFTEgKAEQmk48hokIkFR9p6/qVrjrKLsZ1mYUPp+naKXqV3xAdgL3g8uRaksddwehAK
 qitQ4iEEDRw3eyS6Q9sZct+e/cNIOOYzwD+NRhcDYPqQpfiQHWZn+X1vg5npau0q6M51ajrrfMH
 Zq3Pv83IemkOdBe3Pi0xzjm+Mp595NyvE74w/RVQ0jzSJOx1d/ba+vyPWgSYCKRMTGHSuvoTfSk
 YGmdMV2YOUKbc1sZNuBbLE/juppy1DEDnblb9VD0y61dAKsihSSU0z6sdMULMohoscQ+y+lOzhZ
 KpP+RrCDCOxwya3NY2w==
X-Proofpoint-ORIG-GUID: XLAGGUbcUNQJtqzLJGmf0Aw5xpBHOYga
X-Proofpoint-GUID: XLAGGUbcUNQJtqzLJGmf0Aw5xpBHOYga
X-Authority-Analysis: v=2.4 cv=NYtzRGD4 c=1 sm=1 tr=0 ts=6ae1c780 cx=c_pps
 a=EKn0uP0Y4sICCJyfUD6Zbg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=yC-0_ovQAAAA:8 a=5OY0qaR-UOcLfHTNWCUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfXwCRItgPPg57K
 N+dydlIpNLY1uGhm/rvWuvbwAY9cIWCOUtAECAn0z7Mugj+/h50PsIrxrQAPqHWXyCIkU7dEiav
 FD/DB3qTG1aACpv0hTXIHSmYPQ8XqJeDaUnsiS+POLTXD4gJfvxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280039

On Wed, Oct 28, 2026 at 03:03:57AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_card will be capsuled soon, its member will not be
> able to access from non soc-card.c.
> 
> Update snd_soc_card_unbind() and makes unbind_card_list static in
> soc-card.c
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-card.c     | 10 ++++++++--
>  sound/soc/soc-core.c     | 12 +++---------
>  sound/soc/soc-internal.h |  3 +--
>  3 files changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
> index f6ff99bf8a601..959b56be0eedf 100644
> --- a/sound/soc/soc-card.c
> +++ b/sound/soc/soc-card.c
> @@ -17,7 +17,7 @@
>  #include <sound/jack.h>
>  #include "soc-internal.h"
>  
> -LIST_HEAD(unbind_card_list);
> +static LIST_HEAD(unbind_card_list);

A bit irrelevant to capsuling, but I think it would make more sense for
the list to be called unbound_card_list. It would make this part more
understandable:

int snd_soc_component_register(struct snd_soc_component *component,
			       struct snd_soc_dai_driver *dai_drv,
			       int num_dai)
{
	struct snd_soc_card *card, *c;

	...

	/* Alvin's comment: retry binding any unbound cards in case this
	 * component completes them
	 */
	list_for_each_entry_safe(card, c, &unbind_card_list, list)
		snd_soc_card_bind_call(card);

	...
}

But feel free to ignore :)

Kind regards,
Alvin
