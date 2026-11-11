Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412116;
	b=GLOAGPEkE4XoqaKXATG6N8+dXKMXPfcmbJpfzqpPbSkBtfzEVvBFV62avRDLYL6csncu
	 631Ltfko5MEFqpfMPMxLLxGnTsensyP0DSf8TQGgfLrW3gN4l3Gk2K5NIKrkxkihB1RGJ
	 PMiZwfMD8jlc71fw3kz991IYV/ovWwd5zhB6XkEJB/hPKM9znmzMyXF8fmBsbkPRmmxLd
	 qOiLQB/Da8A25BnPNR1duW5dZLqtHcva6gXW3FdMmrDnU1ymyLZDjf7Ng+N0y9wFJHlyO
	 1cdpOR/U7rHipKMoFO64fEJup1CMbogtvtqA6T5NST523YoT/LReTePQJPCUUQy5hlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412116;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DaszLpYFJYIYgFHEzf7TR7k7mqrnWUVMwjiEn49m4V4=;
	b=exyduSegwMwOmUaOBO2O52rvEkNjI7AuUCLhP1utHP3t6jDW402TaoZ8IbpMeNafgk1z
	 pN8MBB5z9xak8SOXlv3gOhZl4JAT/g/C1Yre8xUfAwxghNpNfMm6N6IOei3vHT1PuTwGC
	 qjiV0M55S3dljArrfLAejaLkuzLNWt1u2AL+J+kpG5Lfvt4gm0RnBPMuKPeayemlWTRci
	 rG7ejrDJ6sd/Zxa6v5o9TXSf96mZK539TTNslQg6cwTdqguHXBLYo80zD8K/Kn79/9sOc
	 zFo7w363dv0J6evYhMB5bEE67dSLWKrzYPad0Oa1ZnS0hrVYUUYfnrfDXv5C+97wt2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=PnjW3vej;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=PINtzQzZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F236B606A32E
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F236B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=PnjW3vej;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=PINtzQzZ
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF3C8U2002406;
	Wed, 11 Nov 2026 10:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=DaszLpYFJYIYgFHEzf7TR7k7mqrnWUVMwjiEn49m4V4=; b=PnjW3ve
	jgCQgG/jOXwtOIcgG/Q10/JnCY4+oAmnmZcEzf/FnxzWDBiWKqkWFukjMV2tGIJK
	Gih7hijOtu+17Hd/FAEDVxWfixwUVWuk5oYxhK6KDgWZ0H7BnYxpp9OTOfTyTvkA
	TWskM0whWd70+zeZsqZ7UxVIqihQgl1PnHmURkjR600R5OB8oVgc6SSPXMt3rTGt
	YYIo0pZKrC014OaAIWNetdzEcjRB99A/6yrVyzIVapRi6IHkw686cHYUD7G10Twf
	suwvb3milMgWlusNqmEaqRcGiQ4p6t4CrH4nMgxG2p3+6bQ7MQ6idbCEsOLq9t2X
	aeb32kWyLaix0gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=DaszL
	pYFJYIYgFHEzf7TR7k7mqrnWUVMwjiEn49m4V4=; b=PINtzQzZ6xKO+GVK+giA5
	fU4SojIynh2D3PV281Z1F4TtVHkErkwjc13Hoaak+xv9U4Tc+5/EHhzB59FIBEwM
	1MCSlWoNq/ntX1EClGEx9Eh8Euwbfz+XxbpEQXXgtWd1QWSgY/vio9/85mNCcAVV
	Oykc+WU78Zk3TKQtq+NOe+9LzxZbeuGTd57eeTIQf0BF8qq/VCsEbZW9ollLcTnB
	RcI6trXHDEWyPCG8IC7Wu6/M7GV6Y/CgzmdO4bki/9bRAFxaYKJPloOUbHEqsMVE
	P6pap11QaQRBLl0XMREUntOf9HByszttdvZV9WnKek79XiyDEhFEpqjODUGrFtWL
	A==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010017.outbound.protection.outlook.com [52.101.56.17])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hv1nr1pew-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:48:32 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fY4wHEFmj39LYl9po5qJpze/Fld03LbPMGS1kVA8GXiGDySvvZDD3hPWtJvTL22rQzJSBctjQg2G2dts7onFvb0OX0nJo6571m6I59bBM6Chrx1Hg2WW7Biw05y3Swh9qzyLOHz4ogI+TD88cETz8WdxEMJa5hAcbuHcjzh8/LhVDqhreIJhludkgeIrZ8JZxTvqzE2i/INgQ6ABDRILkJfMfUrTDlzrF5ZC5V2PnMVsfl86G570CbBDRSoXSqDkddakb3uzuI+TzHEJOt4pj4B2JJ/zWrX1lz9J0l1oBzsTuT18Cl7Xv2OuMsryuToC+x2kcj1eOWFdTHm+bziRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaszLpYFJYIYgFHEzf7TR7k7mqrnWUVMwjiEn49m4V4=;
 b=OHRi7ThIQXInzdaRu9PASqarGBbqcU15pe4lTvOBllOrgfUBdX5m1ZB0JJodufZNniRcVrVYuYjwaFZhGUtrCz6KVRBnSsGltTsrVCYKE5gmLmD506eLVSbSgQsYfdVV9C190wFXkYuQVgYb0UbV7qsAkYeTF4h8IwWY6ATBK1cCCE+HA0LjmAanTYn88l3QwEG3UystbC3pP5g66KTGZwSZsXDD27yXI8w3I2nPjxBlIRkJFu5J/kU6+C6l7MWqy9ikSYHDCY/g+kGGXLtApc9ZO9O5aTisAeeYD5c/gPU1wvYzwEr+Ox5TYd7DVpRfYH0ISk3m1/XUlvSCneV0nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by LV3PR03MB7480.namprd03.prod.outlook.com (2603:10b6:408:19b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 15:48:24 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:48:24 +0000
Date: Wed, 11 Nov 2026 16:48:21 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 19/20] ASoC: soc-component: add
 snd_soc_component_active_update()
Message-ID: <avSOPzATQ_BzyG3H@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87h5hpmf68.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h5hpmf68.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPBP307CA0004.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:1::13) To BN9PR03MB5977.namprd03.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: b3207cf3-0653-4b39-bfa0-08df400b3874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|261102123227099003|261028144727099003|56012099006|11063799006|261021121427099003|261022105027099003|261026140227099003|261009223027099003|261021123027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	3lf8dpw9fTsKMsMvYdM8x2hZxukW+aQccP0/B2C7Y1ha7T5HXkTTcOK/mT1cCJUw3gRdPQ1ph1BYTiyDkqj31INNYhw9/IizYX+aJvBwbc0bLf+69T6IXOg3qbMSghrCFDmEDQUvFjjL16ubvQ3nnFm4LwuPapOA8Wvm05Sw0JxpwYbSjHbQCPX0bvwJb3vwnT40mYT54JvKn+bmIN8a8pcJCY68XJM12bW9Lf69GYuOOONO9Tz+dT68ENBRhmDys9NRDrthq6c5SaO0IXwaQ4diKe2lDHZjoCT4joU+6ZUH7mb7xY2fdllWK75UIGs+DB9A2lqhZgJri2Tu43adF4aBfiMc+WAOQsWjHNJtR6ROoluwRw8W3imwa8Ze6vzx8u25CJmk4PqfW/2XHMaNQp6l2vJQEsgdABsTOuQRoBCWbIdm7HV16P2fLghkxkn3bbP4+MePbyfUJSkvrWFAztef69tlj+sBzQXoEObAbNsq+jV/u/bFepytCXNBI3YBpvPpatwIsotYN6SUlEMLPHrA6kuGLcARbJbuupeuthGoZLnEpiFLbJCZ2IVkxVuBRIKYEL3fSC9MAiroHC1Svc80Kgj7KJRUbohZejafmkUKq4NY80mbwIUUzYb5LQV2ZesGyaifyTt2uo8RWjhgYGXlBDmDuhvOvAty6pSVKV8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(261102123227099003)(261028144727099003)(56012099006)(11063799006)(261021121427099003)(261022105027099003)(261026140227099003)(261009223027099003)(261021123027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck9ESUhyT0FCYWMzaXBGNUhkbC9ZV1J1eGNsSWN2SG9ENmdlRERqczU2YkF4?=
 =?utf-8?B?NVB5ZlBvUjZwN3pnTXhHQS9VY3RCcTJ4UVVVTHdxM29UU0l1bEVpWGtyZUdD?=
 =?utf-8?B?ZW1pRGZRQ0RxRE83MUhFNVVhdzdXRmd0M3dDN2tXMnUrd2N6Znh2L2RQMUdm?=
 =?utf-8?B?ckpBbGZkNUFOVWdONmxSUHI4SFNwTDBIbEZTSWxvdUhDZnJBWHBFbnlrUnFJ?=
 =?utf-8?B?WnY3b2ppRHNzTit5NVZBb3FiMXk0MmkrVWlBVFlHNWo3WC9qRXhzNkxFUDN1?=
 =?utf-8?B?MmlWSUIvZ1FxRWgzalYwVHBjMTg1TjlNdy9BTHBvVkhGSGd2S0E3Tk9MUTNl?=
 =?utf-8?B?N29CK3RvZ2ZOZERWQitqSGE4QkhXWG9RbnRkMTRHYmxoQURvOUdRRmpRaHFX?=
 =?utf-8?B?SFVqV0ZWdTNYanJQVkNIY1RXbGx0dXlYSVQzc2V3eU9UVmNQbEkxeFRadUVr?=
 =?utf-8?B?b2p0T1lqalhuU0crK3I3ek1pZzZVdDJ3VEw4VSsvd1pVaFVmWXlvZ0FNMlp4?=
 =?utf-8?B?Vk5tUk9OWEZaTDIxSkppeEhBcW5vd2paRWxSZlErNTVQbHBZRFJxVy9JaDV5?=
 =?utf-8?B?Z0oxc0NiSUdBeCtCUTNsaE11WFZpb3lyaUxpVEY1bkRUYTZEM0gwaFV4YnZm?=
 =?utf-8?B?NkRzRUd4Q0RWWmcxbFBCbkJwM05Vcm9Gd0NtVXRWeDZ6QWlzQzBHbUNpSU0z?=
 =?utf-8?B?ZmcvbTV6c3o0bzJxQUhhNWxEM0NKd1FmTHoybEd2ZmhtNzY1WTFEbXFwdUlk?=
 =?utf-8?B?Z2hjRU5DYXBmSDBoQVZZekJ3RkZRT2V3alNkbFJwUzBYcU9hc0t2SEl2R0l5?=
 =?utf-8?B?RDhvQlovM3NMNEhuYUp0SGszaSt3bTZMME5WRnRMYy9JTkEzRHljUW8zaVVP?=
 =?utf-8?B?b2ZUK0ROcFM4cWFycE5JSDRKYU9VeTRyc29XLzBCMmpuT1RrR1pOVXozVlNk?=
 =?utf-8?B?MlhEOW1GR0k4RFQrYXFDekNuRFRBVnBxZ25SbUlWZDZPaVZNRDllZFAvc0FG?=
 =?utf-8?B?L09ydFZoUHZhdjQxRlE1RUlqbnpKU0x6Y1JBVlZEbHRHcjN6WFlUSFZSSXJJ?=
 =?utf-8?B?aGJzMUIwQzZqcE5aSk5hcTZVR0JaaEdidVhxVVRNOHNRa2NSNFZiOW9JazVJ?=
 =?utf-8?B?alRoYkFuVW5JSXFaNlh4eWxhTktzNUFiQVpmU004cUxlVFU2YzM1aDU0NUwx?=
 =?utf-8?B?OWN4dUdVQk9DS1RzMkI4RHlKc0pMZm9JVXZlVTBJN2R4QVA0aGFscnl6bWdT?=
 =?utf-8?B?bUVzaCtEYWZpVkoyeVhZZ0VOUS9BaUc0akxZdE43Qi84cEtJa1lvdDkydXZl?=
 =?utf-8?B?T2h2QXVRd1ZpY3EwUDVlUHhKdGs1REFMOUJSOVU3Z1J1TUk5UFBrU0xEWWJq?=
 =?utf-8?B?UU4zK2lPQTBYV2hYaTFEWWMvdlZtSkdoWitZTEdCazhUSXdGbzN1TlJjeWZX?=
 =?utf-8?B?SUZwSmRKZ3F3bFlBb1EzeElNeU5RVmhUbFVkK0E3VDBxcWd5aysyUHZ4YU52?=
 =?utf-8?B?NXJxZysyYzBCSStSWDJtcVhXdVQxUVMrcVo4Wmp0OTZKTXZNSkhVZktxLzNN?=
 =?utf-8?B?U3k2dVFCVDFiNUJXMjI0RWUwUFdPUTJPb0NJYjNZMVZYckUxYUtXczBSOTBs?=
 =?utf-8?B?dlNKbWZRQjZjWXdzLzZVMlBkdjBjWktSVDVVTE1uSVg1dzJXTVc1QmZUb1J2?=
 =?utf-8?B?eXVLU1hLSE1PWUlaODBjZGhiMEFVaTM3UXY2WExpMFpGeWdSMXhxL2tLWlRv?=
 =?utf-8?B?T0FZK2xkMWlNL0d0N1JiMmJxT3dCNFpncndSVWhneHhWODIxM0d6VjhKQU9X?=
 =?utf-8?B?THArbWlUUzBrbER2dEN5L2creFBqRjUzOFFpQ2lrRWpiVzRuNjZ2NHFDUUN3?=
 =?utf-8?B?cS8vdHQyOFJqRmN0U0Z5aE1GWVQzUHBBV1pyS0o3MDRFN1ZzeFdoYVBabGRD?=
 =?utf-8?B?aVJuMnpZV2VSVlIzc0REQisybDk0WHlKZURwVU96VFZNSUhrMndLU1RGRzQx?=
 =?utf-8?B?RG41TFAzdW8vVzdNQ0RZT3R5Q01VUWVydXZONFZPV0wrUlBJNlBrSktRS3ZE?=
 =?utf-8?B?dThpalFpNlA2dkRFQWdCVEJTMUtPSlBaZXU4TXpueThFWTV5ZjVEY0lQeUh4?=
 =?utf-8?B?SVNnV2E4TW9nbGh1ZjQwOEg2WlhobEVnS3dxamQ3SjdOT2l1amV4TlNDcHBj?=
 =?utf-8?B?bmdoeVFDMUJXeVdoMmdMditnS0N2TE9wbmFIV1FPUXlXUEdyaHRaYkxZZzJ4?=
 =?utf-8?B?VWdOS3lZZGc1RTNBeU1YdzRObVkwbHBWcmNZQnhkTUVQMUVSKzB6eWZXQ0do?=
 =?utf-8?B?S3VYZUVYV3A4YWxtRFNtQ0pCWWxVZXVKOHZhblp5cGFBb3NzeExxdz09?=
X-Exchange-RoutingPolicyChecked:
	nHRahX5/e1iiMFnV2LW48eMfF4XEV4dSLExMD7JKh3dvEy8pZW/wasksVmD0YaO+Mv3L3qJIub2SiyA49a71U2as+Wmtv/PUzsGfRLpavfXC+a1hKutOMCv7TM/zQYs9wYIvrhlDUrw71owmtzfooN088qRycwDGLwHD75d412VGTk2TOksW6McpjPea5EyKrg1XQ8bFF7oOJvsKfnVEkTE8yyEiWpjOggKHBLg3BuqHGubQhe0E6Tjnt4pPazLniwGihH0gucnYs9EykU/OA0tGSlq6c7Yonb6sJ8p4nNhRfXtf12ihMiyTJJFkjN5K7zS+c18Q0B//D27UfbN6Rg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3207cf3-0653-4b39-bfa0-08df400b3874
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:48:24.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaseJ3IP8mSbi6LQge2LQe0WlCRoAenanBF2ZtXzBnlfMPblDf/QyYcAZy9OVUIEuQH03VbQOWN78V23/GH3ylG54N/v9YK27V7z+g/Y5Kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7480
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX9daECMqUBss3
 pkXJWcM0jop7fqkaLtuHpIOXwWUMXhj957fv5j+AWivHPsSsQV+q+vxol+VSxYqEjSdzTXUst0r
 nFW+Naa6WARbfii4wYYU/YRf1fJ9wbEGytyXpVh2DPc5tdXMyuCXnliaW3/Mw39s+BPBZ1Rpstv
 dIBpbimdiuU/OyGJm4wpfBEtRfmSZkJXXSi9pzalV+w52i10/D+zKKqbEeBkJ2dZsIau7JXY2yi
 Bvgo7KgPGuVxuf5En3OSuExhC59NklLm1hE8J6Ar0w0Qeb1d+AqIGjhVPB++TvxwQRifI5t5s1x
 EPyNMapu5gBi9LV5+pBmlLFeeBBcXtYIycFwizu4Unc8DghVXelbdnFDJb+Y8MlhaOj8Rk9L1xC
 hayi+Bl0sJGNsU+G173iP9o4Mz/wZQ1qiBLgaBMsh57NvN/eOLE9n+bw7n6/OZUUHKwVMUZOEFe
 TTT5WTNALegfhFBbDOg==
X-Authority-Analysis: v=2.4 cv=es5KXYpX c=1 sm=1 tr=0 ts=6af48e50 cx=c_pps
 a=JAvUoUKTMhMV/AtIpjtZgQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=_xF0M8GitKh1NRSYBSgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: fErvF6zfzfujexc_Rj93DEKhgg_BaLVJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXwcaQocw3my5H
 vxP035/Flufl/jqPUnPpDlOiMW3xxTdGIqxSKHbKUT10Q4EOGeZLVrNecIa07rVfnVnsw/rgs+f
 2CZmi8UsQblA5mdXkpWhJDOyETONuzLyBnB8KP61v5O+FU0ksM2N
X-Proofpoint-GUID: fErvF6zfzfujexc_Rj93DEKhgg_BaLVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:25:04AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> This patch adds snd_soc_component_active_update() to handle Component
> acitive count.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  sound/soc/soc-component.c | 5 +++++
>  sound/soc/soc-dai.c       | 2 +-
>  sound/soc/soc-internal.h  | 1 +
>  sound/soc/soc-pcm.c       | 2 +-
>  4 files changed, 8 insertions(+), 2 deletions(-)
