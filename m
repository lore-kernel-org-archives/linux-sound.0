Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794488294;
	b=pFx9zeerLL4zzvfFg17mrg0JgFpVMRWbvLHkx9hkmPgJ2qOiiI2Ir8Ne6K2N4rZ/717U
	 zp/aA1ovZ0RWmh+UgUJzydCf02k9NFyg6YwtU1qXT/L3uiIgohOH9Ev5B61isJZsGbtg6
	 bBKP74teSIbtfPZQRTR81B8XlsjqXbvJMlkhx1vw4KpgBlIB/GTeGdmOxwcUYkE6ONxV4
	 8ypWJVRhQRAxkfwTBWUNNSRiXnzdLlZxVAvTenAlVzjoE0EzldFfKhP3rdfcrj8DJZ29A
	 hDp9GqlPKZUweDfun9mjUApeTxlmSxYJZydBbnz5xDVQ3cmnq0AkRRUdxWp5sfc+fdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488294;
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
	bh=xapddnix7Tx2e9UbJgERst293+YzEn3dMji+UoHLKZY=;
	b=CHZwBGDRnfpfcrmNHKFn5YnmpT9Z5G0zW1484H2ljtYYTaCiOgpRO1nicG/RgOUmYGVq
	 gsIq0gLhQlVXf8UEAf6EL4oQjlh5Wh23FNzBorSfCTefOFpZOtQj41sxzn59woVRijixB
	 8fuDC24DAW+YQqSW8vogTo9jR8t8CVRajFRIYawyceFiEbukyL6x0fgMH/XKL2f9mO3qs
	 mOo/W4gw750y2HHfmwKXgoVXXb0wZcGinIAnBVYIzhq9cXeceSKxKmmm+UQkn6QOxc4X/
	 k/nmHpX1J/Mf0PjU/RjFF8aQsHrV5o2AuwgWgkTDx39gurH3oezuGTDylFENTWum9Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=H21R4zFU;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=sgUi7DMd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD46F606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 12:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD46F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=H21R4zFU;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=sgUi7DMd
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACA5voe2028090;
	Thu, 12 Nov 2026 07:58:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=xapddnix7Tx2e9UbJgERst293+YzEn3dMji+UoHLKZY=; b=H21R4zF
	U7rKZEt1j+0WUQBZKC8UQa2hrjbJioJYGjK0azMXDC1ZyrwHgypqvZZqIwVx2KaI
	DoH3nZSp+b35fjrk4BvhUD3In+quJOqh0y2ZOhn7dB8CfY/PhZgIgvEoPhWtXSF2
	+WSVdNGJtO/4j8tvUbGKlSkkqy7kc0bvwhKDdFBdMtd/ko/xvdDIFU4VDlC5pigK
	yZ6sjjQlPUI3MbP07A8rvnzDy7OgRYtCatcFZJR8ocy4L1zPrNR8Z5FOc91Jkq+3
	HE5i7/TwO0jkex05a/5iT/gv2surHA/VsFkx6e+O2mSg/+vB69WpznBr4YkwWvks
	HBUvtyUmTaBTHhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=xapdd
	nix7Tx2e9UbJgERst293+YzEn3dMji+UoHLKZY=; b=sgUi7DMdLw9Mdq87zWbc4
	ipQzBWvZFnpQstp2qxNoGfAQLligKpvaMTw9mzJIHcjcMcof7Zu12R1H2BBgt4kY
	3ud9OB6mjc2nVTAxvxIGEnH2eavXqU82ndn67ptqvkLNlcfwLYTNrtoM7ersS9d8
	+ZhKXx1uoRQxHtlNIhKmzX8hm26wSegZ59Q6UL8b8hoxl7BAOA2zohmHeZZcTETw
	wgPoudSfhYcZRn7wOR6lA9W72DNjU+UblOP5ft/5q2ITqiZGdYocNlXupYeePEWt
	RGRrYi/P8PTnARwpR9xzsSUf0WzHtyj8tAhd9s20Vmm19cGK9/cQJba64LmM0Oo5
	g==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvg5814w3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 07:58:07 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpDTB7CnrhpcCoSLUhqdb//wLXuCupD8JT9HSmlLYWWbypcqsnS+l+nM2pGTycmQNsIvYqhNlqGCUkamEigbSzSdUxyj5p9kU+3VCEhx6uwG76/l4JR7cVVkMtzA7ODrLVdJG48ZY1QnQVi1yzsgLJ3Rjj269C8AnNFzFT37kuTpRnTTFbd/zNCJ+o29xIqBNYYLE32dZoDsNCanoyYshI+HRkqQJ+DehkaGfO2yxymh05RC+LUyzz7ebZmAPUWgJ3W9SFSHesQBqkt1NB+XqPdNnldWTy+SyK15ZOrPMGvbY6bdUKCSAgS20ZjlmeeEDprX1BNZQIiFH/3zywys0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xapddnix7Tx2e9UbJgERst293+YzEn3dMji+UoHLKZY=;
 b=RVwTRpU1xSZeKyuyvd/zMahHb4YTFFkHt1uMdB9CGyXmIhCDhICYSdWHtu955KToANOCeQBmGTnEM7Se/5YyhVJfYP7Q0K6URdXFMvyUnMEuU4iQ/tiALPQuQNh331y1Y6BbRpYr7vlX0biR14On8F2nw3jFiM89Zi3R7gakyYTqxpnO6zIXSZ8aFf43nzmp0A16dfVUOeHUU7l53/bS5XHW5eyBYRpzJIcn13uGUtlr+ypO7jBPtlxuRDQu25BYd/aHU7tAuSGFo50uXn8iknu6AT8gVvLWoiOX9iWQNthq1iEUPGVrXXA/pJAN9kobjIgiZt1AuTm7q3RgFK9JZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by IA3PR03MB8476.namprd03.prod.outlook.com (2603:10b6:208:546::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 12:58:06 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 12:58:05 +0000
Date: Thu, 12 Nov 2026 13:57:59 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 03/27] ASoC: soc-component: rename
 snd_soc_component_regmap_val_bytes()
Message-ID: <avW3zxccKIkJh_xV@analog.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
 <87v76228mp.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v76228mp.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPBP307CA0021.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:2::14) To BN9PR03MB5977.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|IA3PR03MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 207cf3ca-13ad-4468-cef6-08df40bc9750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0MNRtdhrWnlxHPr5Fog4MSeT0RzoizyWhc/7U6mIz5Rgi4njr/aaGIRsFB3gJX2OSMptgTCd7uN2uZL2GSxI7T6IruBjKw6cYUJf1ywPr3rhrGbwUuQ46r7oBtZON77PNF2huYuHNuZuptLzXhwxA6guVcmM2sIntR6wq7DyUpn4jhxhpV3OxTkR+h8acpVfZ7cdpykAfefB1Ujvm9OCzLDWJ2NkZItXZynznhTq/t/vo5jOAJdmszktAlIAXaDtuoko8d/umgQI2awS++k+wl2vpzYtriyLHVPOoyKC5iKGcy+XNSxW1lW6NiSj0Oss3rdhOfr70QOHu9b+dkyz02R+qaluU7OeSb52b3VvetS3I686fVp0ozkZQxH7LHDgukasBqs/a0/p17ns+7HzOtc4CKSeFtVP5BEtMTYmZbjdd0ttGRa1uXBPWMckowjKbRa+KC5TMTbQFuQRnQE2M7EW5kIAwuH5LdHQsXNP7pvWuqomi8Khy3Av3PXlg1iyjOFvo2TYCmK5lNg9c2ybCQ4GdFdDnR3Ksj4jWHDVyTF/Y+ZNQxZteYS4uci8qQADvVXfyrubFdQfd+Yw9sbH2Pdvo7UwiTkzXu2OPID5j3Emrqpuq/LN3Hmghdar85joc1u61hh1t1jxfaA8MXgL1wT5hWEyEDA6lgM36cniD9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0JWY0hqSUhMRVI4MWZTYTBWcGhmR2xGWnFBdGUzdkxGam1ValdqSGd4U1JS?=
 =?utf-8?B?MVFuVjlxVXFiMGxYcU5mb1JKY1liQUhvdXRtbEpjbE95WUZ0alZHV0hCZWNt?=
 =?utf-8?B?bml4QnJLOGc0R1VXY2lJcVlZWjVOY1BjUnM2dDR3QUI2Y2NGOXJPWlZsU3Ja?=
 =?utf-8?B?WUF4VCtKM250TlZXOTAvcjRhSXIzZHA4bDl2cTNZT25Na1g4SDFhcFJDNXlI?=
 =?utf-8?B?ZVJrbVYxZTVwRS9kdmlBZFVtYThJMlJkT0tMcVVqRDNLeVREWm85ZnFyc1RV?=
 =?utf-8?B?OWJGaFRrakdFUlEvS2tCMVhZMDJjWmNJSXlYRTMzanFjV3M3ekozaldWRzFP?=
 =?utf-8?B?SURmT0NZOWtSZEhuSUU2ZjZtRU9hMlBJSG41WElrUjIyZWhYN1dLTGdwZS9R?=
 =?utf-8?B?VTdmK0ZCNTkzMzB3bVNKRUM1ak03TU55UUN0dFpBRnZyZGQva1VZWXJidVBJ?=
 =?utf-8?B?MHBLSm5ZNGEvODVqWmd6VytDc2hCVnlDanhBUmFrdVcyZWFUaWdNZnlzZDFK?=
 =?utf-8?B?SnVxWFE5bDhLZ0U1TjYvMzlFTWFUSm5wU21LdVpSQWdOV050ODFNcWJkRDNL?=
 =?utf-8?B?SStUVFc1Y0s3NGhsSnlhaFNPdVJpamhHMWtNQ21KdzFpbG5HYWs4cEs2L3l2?=
 =?utf-8?B?K0VFOGN1TENQUnJyc2RPVnhpdSt1c3RQTGZVK3lKaGJNbWNlZDlra0ZvOW9H?=
 =?utf-8?B?WHFvcUVNTGxwUTdFTExqbmNvdnVLYXU5RXFNZXQ0VFVsK09lNSt2TFh5VjFP?=
 =?utf-8?B?TmNGOVZ2TjFVakpqbCtSYVdsNWk1aFlkRjdyK3NzQ3l6Vm15NkFKRkZ1SS9P?=
 =?utf-8?B?SWM5V0ZpLzdRL0ZIb1VQZElKdHhiWXBYZUZia29nNHVES2lmdmlBdGdMWG16?=
 =?utf-8?B?WWRYVk9IK1NONlB4aHphQXd6ZHJFVzh1dHYzSE5aQVBSSjhNZlZuZ1VCVGVv?=
 =?utf-8?B?cDhLS09ERW1VTSt5VFcvWks3UjlVRE80V1huVTJPRzVWUlZZbDJUZ3Mwb3ha?=
 =?utf-8?B?bnBhR2c4M2pqcXpxdU9aekQ2ek1BNEZhV2pOaGpiYU9EZStJK3JnU3UwTDhI?=
 =?utf-8?B?N0F2Q0J5N0h2Vzc2Mm1UVEVWbnV3QmwyN3Z4V3VtK2U1YTZranlHMm1ZVitC?=
 =?utf-8?B?WnhnWkYxWkFpTHdSOEFTQ1ZOUUlrMytHSmZ4MzVLMThYYStWWGFLaGtSV21G?=
 =?utf-8?B?VkJwblpheDBhZHg4Z2haVVZqeU13bExRYUkvQ3hWbEpmRWlzMm9XY2psL2w3?=
 =?utf-8?B?RzhXK3ppTnZTd1U5T0o0MlJ4N3VBNmxrczY3UWJEN0VQTk5kOG5BTlpFdS8w?=
 =?utf-8?B?OUV0RUlibW5aNlg3NFNFbk9iRitTT05lYWRrZEZEU1hLcHlUQ2RqbDdTV3ho?=
 =?utf-8?B?QlVuMTZqRmdsYWZROEVrby94WnJLT0tFUzdsOEsranJoOEpLS0pEVER4L01q?=
 =?utf-8?B?b283eFg3SW5CWDRGcDFwU1VCZ29aSHFIN3E0YytVaFppb0Exc0dONU5vMnBm?=
 =?utf-8?B?WjBuZ1dqVlNEai9zSHhjdUlFQ2NrenlIS0E5RGZ6WlhtZzlmWnowSE5ySm1F?=
 =?utf-8?B?QzFqYlJZRWRONEFVYlZmQkVGdWF4Ti9mTlBkMXVJKzR3RkhHNHhUcFBYZ0lZ?=
 =?utf-8?B?Z0ZINzVEU09sVUdhNmw2RmJFQXNXNkVzVzZJOE82R05mMU93aGw5YnJSODRC?=
 =?utf-8?B?eUtvQXUrUVkvOWNRakFrRjQvQS94M2VENXRFbitwRUJzUlhvL0pUWFlySDBk?=
 =?utf-8?B?V2JzdDF0QnFZQWlNNHhFMFRIRkRaS2R1aEF2K0dGdTQwOTBvTFlRQXNyZWxr?=
 =?utf-8?B?UWtsUDU1ZFN0TDNiT05GRlh4cG1iS29xdU0wZGhwcWJZMzdzckJQT0NyL2NU?=
 =?utf-8?B?N282WEtDRVc5MkZ4WlA1V1FQbjB6MzRVaEJ3VlBud3hUMElZWVhUMkdnYzFT?=
 =?utf-8?B?NStvUk1Rc2o5aVRYSXhLcER0Y1JacnducjdhZkNDSExGUDBFdDV6SjFsVXJi?=
 =?utf-8?B?aVN4YXRybnB4OFoyVXZpL3VHemJkRlU2R1B1WTdpUlphQWJxTldobVJZcFZJ?=
 =?utf-8?B?SmUxT2pEYnlWcVFBcGpHbjRqS1M4b2NQQnU3cXZ2a3Q2aTRBUXFXZTFLN3Zk?=
 =?utf-8?B?L0IxRGFiQ0hWK0JnZXZnSWl2WGlMbm9ob0VFQ0FyNUloeGtYZUViczVMTVJy?=
 =?utf-8?B?eUs4bTVLcHFZYTJLTjNRWUtIMkNwbThGcktmQVloVW1UMVdzbDNoL3dQQXZy?=
 =?utf-8?B?dy80WkZCdGdlQ1oxbXhhbmE4M2E0cXlJeDIvNkp4ZFZ4OTl5cXZsV3d3VnNZ?=
 =?utf-8?B?M01vMHRjSTZUNXJRYVFXSFFoQTEzQ0YxWWtQUnVUbzZJVGVFU3hFZz09?=
X-Exchange-RoutingPolicyChecked:
	QTN96Pwl0dzOUGbnVkwNiLWl73Ugm8KGWKija3vPXysopfHWz72ccYoheSpm3NAdw3lgTSkEcYHRq3CvP8wYqe6aNj57tY0T7Hr5E0Swjc/bNzu5Ra3vJu4KECy1pyfLdJJedHwKEUsWB5Esg/7cAvwoh/gGjbjnB0z93+5OD7O2kir+D+VG3AFt0Gv3raN8zBW+ueNNaR+PZanL+BQcjYkrKtHJU5BuGB+iMcqZLIJgKf1rxwvMpeocrtavY9hCNdJTHJ7vE1gZjEm5QRnqg7eYzEEI0y46iHqZgjSejdYA6WOdQD+haimOowEgsAIp7BM+8JuO4LDBBfy7vGRhbA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207cf3ca-13ad-4468-cef6-08df40bc9750
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 12:58:05.7604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJbP8mvt5WudpNZE9SH/IbJ7yelaUg3PpzETzHjvEX9jIqXf9Hmq3ROeyrOulA4/n/EmK6fdhaAh7kgZ8FVsTA5VNpy2O7J6NvmnNKHMXvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8476
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX4++7i22kaNGc
 DlotD11JqO8N9EQA6NSBptbX4aHuOW0qmocChApX5Vzwivpfqo/NYXdMNwwgFTWUeypiijjACsT
 XNEqhG8vjTPfsp0Z4pB7r9NzDaQ9YmsW9uJkliA71lS18AmOGyzwIvTIO/oVdCR1cxvijD0ozRr
 Mcn55bmQnpA0SGV6wfyZHG1PIlGw26IccB+U6RpAgPaa5KHuMCaC9vU8N0/VzPPi8z/tVfd8o6o
 encq29jEq+LouLRTmHI7DaqhUaqo0hN6jClvLejU/V8dVrwQDXY5Vbse37OKts/8tb+EeTQK621
 YsHGGW6mFBMIuPZCZo7SvpXQLF8mT0zhQg0VPzAKFgwQXNwY8aWFM1/hxMOgT8L4OpmlWfWoS/Z
 fT3vXzu5iithjALrMBmcJ+ojXJhfi55/d6SN6AfbjrsyPJ11rk5Z8uyS6OJxZ85qIMRXwSlRNrL
 eyvhOPU6pXq+cUJhi4w==
X-Proofpoint-ORIG-GUID: LSP1VxV8PxSs0kdsfVLAo0E3omB0GJlJ
X-Authority-Analysis: v=2.4 cv=ZNVCCn7b c=1 sm=1 tr=0 ts=6af5b7df cx=c_pps
 a=e6472ZuTPXVkOcUbIheXHA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=_jAD5XSDOtq9-5Nde2OG:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=VFwrKrlYQbUc893ElOAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LSP1VxV8PxSs0kdsfVLAo0E3omB0GJlJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX17TwZi0tX1db
 LkEM5PB1vHunvqKpVJ0NKSQaeW/gnzUjS/0Qciy/zklK3Bz0y6xudWoDUKvCri000Yi5pXLGU6f
 zpYXj8XJ+bVBq7NAwBvGEwAElI5iGRf2yy4VQ+869Jfu8Y4LsNjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120051

On Thu, Nov 12, 2026 at 12:31:11AM +0000, Kuninori Morimoto wrote:
> snd_soc_component_regmap_val_bytes() (A) calls regmap_get_val_bytes() (B)
> 
> (A)	snd_soc_component_regmap_    val_bytes()
> (B)			  regmap_get_val_bytes()
> 				 ^^^^
> 
> Let's align the function name to original function.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h | 3 ++-
>  sound/soc/soc-component.c     | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
