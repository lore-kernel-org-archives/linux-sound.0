Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794488350;
	b=hpEpdrriFxEAo17qFgUVVDxqg5hqZTYK7Toyer26Jfy1+EItvs9VB99hzRK8LYFkGiKf
	 NWZVsg5/5Ve48EHJwPW7cXuyRf6B4Wm5gU05/p63/rBmxTSW1O1wBauNCsT5wGBcEZnya
	 QvPu2yuM4lTItNJpcI7ev4w1bc82PWIBQHcqlcgRURnXhNX4h3Bk6ZTi4P0FlqzpyKqAM
	 MmEqFzQtuTPDQpO7gL2ILIqNcEnKiiCYFjnEZ/zl1hMlCTbFjeV74+PIc5bOcqnlNIPHw
	 I7xMJ1clfNjskID8GQtCxa6MfQzRZmwf9ETf15qaKPOwycxHGz742Q8C12GoDBbwERA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488350;
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
	bh=JaNwAHMaCO0JZCkxRS99g7jVS05jFHwuQK7nfWGJTVs=;
	b=Nn9TjRD6FQzjxVcOfQz2EOqh4XcQ75MfSBW4Unff1BAW/xcvMscXAei/dooFqbwCgqcD
	 1fjIuSvDqIl7X71SIrvkVDQ1KcWw2Tm0dV6/r3xy1Ea3ozTL7QpeiG2Zalx87TNtf8GkY
	 DP+mYuw3P+5AICTuGykYAXP5DkRPfYW1tyeAMsd7GxjCLdXkHmi9aUhI4qO6bBtkQyhXl
	 6izMWUVk2PVfFRCeJdPu1udvE5H72t71Fem9rGZSowxnBbB6tARkCeXZOceozcFrzIU8U
	 KEQVDBugrCZPp2Aqz3XZfu5XKhi64BtVcUPp2UeYNdNAZUqi/Hg2FvbhQijDLDRTPlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=dlfRysQH;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=VdOm8Yb4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C199606A333
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 12:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C199606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=dlfRysQH;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=VdOm8Yb4
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACCZR8c1090870;
	Thu, 12 Nov 2026 07:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=JaNwAHMaCO0JZCkxRS99g7jVS05jFHwuQK7nfWGJTVs=; b=dlfRysQ
	HV64Zd1KNrUpvsz6Wf53wN45qAaDbZ4KCLh1IGAvU264zUckVWwzsUMjAv+utYAJ
	WpAHjF8Q+Z2RLsAwKiBUHehNkSvQMFeyDGEsGIMIcCMj8c+Blze7hwiajUVHnLCU
	OJFD5cqLmUwsjHlQ/NsDLUIjO9dn+cFdNQdCQWjn5GmlQFvlLMLNahqLNG5TOqoF
	txnPwteHYuCTdjaOlVqbXeNNJ/Np9NBDoitxlKpkXpihbCQzxKikKY7jb5JLNp4Z
	ovvL+UGn7X0tMd1AcufHBaafc+VXCmcGeuBSEpbMdubnEEIU2T/OQ5uxiQ8xX0cQ
	XnGbl+GPhxt5dEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=JaNwA
	HMaCO0JZCkxRS99g7jVS05jFHwuQK7nfWGJTVs=; b=VdOm8Yb49shyNE3WUhbjv
	/HsNRgqfQv6cAyiMAc9nMsgX9yeIxw44JFe4uxDLQ6OzFjFNblGwJYbiMlFRMwyR
	M4J5lIKREfeHAZG4SNvml+I0iwD1FTJNxcemxMgsfX24SW3V7Eqy1JKW5LKtGCBG
	AF2Ncuc3cC/wOocHYNQLnjkAkw3euzcaTOC2JvK+cLhnCjI7BNwR7IHS5D33hMxp
	rkiXMLALnqXfdHPv0lh8Hufk3lJjsoK/hHUHsxu1YD1zyRaPhswx8yS612ZLFv0o
	4xradBfGDnW1Mh1s5gvrQwyvr5vECTchDRMvCi+oUH+/7Nx941yLizNis+OJl0Zl
	A==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hvw1pde20-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 07:59:05 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+sUwlvHTiVe5LMwwpoHMRw6nR/ibuH2vRTj8Me27XsbsG/8IK0Z/J/KpAHe/ZB7skhkJCrRvwu3Dy79whRLOEC/vmDahfID2/v/mYaHMHTX2SypGd4co2aJs6q6Aqe1YERhcg224ATJE1NMMfP+LugMjdH/H7NN3wcodfekPPT/0IBoudZN6qkiik6vq9qZhCTFh+NelFZv1Cpkm44XGOdlXFIJ1TAjy6BGbm+sbZnl3V5knfU3FB2bqtHKPbuAqLecNfqAUWVjBeqLT5S3cdDjQTQ5qh+pow+vq20+ZkT/D/5ni+xE4i2bL9ZaiSNCmmBDxFUVOR8VX3XS0NIhVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaNwAHMaCO0JZCkxRS99g7jVS05jFHwuQK7nfWGJTVs=;
 b=U1KlBFv2JXWVbum+UHDhgqv0VQsURtzPwLv3PYd70bb8yWDKJpcowYYU03jIp+pFjCEykJhn+Ou2u4llQbvQzAf7t6qM8/v0/7rLP5H/hTu80CefJCUVizV43FcpCnykMHPFNJLykzHcPGhmMe48+hfT6JF/awofsKb6RjW/3QtouBN52udH0QHVYdF/fNCozJnR8/jvDiZWFBTc9Y9mwYvWycvYAa+JNnlpN7BdQcbbg39mivwSnCXqk3Vv/O08fy28DH/3VwZnd8g0yZyZbjRxqvTFm6lL+7pRewWkSDujUns2vJLp4vfO6RFX6fXfyuBlJeYYBLfXX5G0bjqDsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by IA3PR03MB8476.namprd03.prod.outlook.com (2603:10b6:208:546::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 12:59:04 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 12:59:04 +0000
Date: Thu, 12 Nov 2026 13:59:00 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 07/27] ASoC: soc-core: add missing
 snd_soc_component_unregister()
Message-ID: <avW4DoTjYtW1gKgq@analog.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
 <87pkwa28ku.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pkwa28ku.wl-kuninori.morimoto.gx@renesas.com>
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|IA3PR03MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: d533c95e-694f-4f99-6197-08df40bcbaae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oCWxccS79SC5ZvUsPjpWsoxguX+Y9CSjsQV4E7KUoYXie+XW0eD+78Gl3OOMYAZeo0EhZUKk93xhC8Z+ySaIhkxZYUbksZys4fj5T8OsHf2OLcWGT6AeB4QidDIBFg44J8lM92y+8c7Q3Z7sBVocFO3x1i1wM4uDcqosAb9ZGRyoVMFjkgSQ16FjRqwr8Bwo+8iaj+3iR3M6SLZp7rIalQSjsK0bMInfT7IOhcYOKZ677zEb8IXZMZdlTfoyvpqgzUa27Nhs2D2Z9VrUPhjgvK47JihJ6c9tpbyGJ1oTm5oRi+ojgTlWhfp3VkPQM39PyvGXCIRQXTYcDYwqDi7PvN7vPpf/DN/4vh97mGddZYWEMQf1VNQ5e+u0DxcAmesQKGrggc/9MQek4ocN7w/G9f+SZ2qf5UJMHEp8o+ERIXaAefK7Ngc8zTRp3zoiteNqtJE91WlNhVKG53CR3QkkTdX5W7yIDOhxju7pp+17EyjBqHFvx1eBCBYw0G0HHFdypPSpp6on4+QSRK0QKCtmXg9Ltgkca9n2ia+BftFWFpAIg2PtWKUaAaxD93Zrxsuhz/oLWS5TKRu0Z022BnDIYsGVWmVlnGMtFm7cgCcFysG5HeLl+UZi71Z4qduHak0BDb9HGaNmFPG1fAPb9X1TEX/nKPcOK5dhAZNuxCiFjFg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDRXckRqeVZjaUlaWk5NeU1jRk9uWDNXVWJCMHljb281enNiSUlWYkVUcUhP?=
 =?utf-8?B?S0dzMCtjKzQ1MnFHR1FRa2RudExpa3l5dUllTUhpU3VhcmFKNTBJRW5QdSsv?=
 =?utf-8?B?NHVMVk50c2lmaE5XMEFBdS9Wa0w1Wk93cW9iZjBoVStBb0pYdU5ZMjhPS2J1?=
 =?utf-8?B?M3Jqak9CbTltU1dtM1RyeTZVVUhheTBnb1ZlcGRDbDBoQ2xRMXpycEVGTFdZ?=
 =?utf-8?B?MmZ1dzAyekczb3hPS2dDT0tJRjlzUlpZT0M4TjlWREhPbDIxV3hkNTJlU1ZF?=
 =?utf-8?B?Vm1RVHJ4Y2t0NUVDbTBlT1pDZ1NhaUNrL0lWK0ZTYVVRSEwwNno0NUswd2Fm?=
 =?utf-8?B?aTFYbFQvdkhYd3dhUE1UeS9kaS9TdnQwVERMY29UMjZWZ0orajBmSzlPcmps?=
 =?utf-8?B?MDFZbDVXai9JUGN6alI1MndidXlwamp0QUxQK1dUT2JWSDE1L0g1NTNxaWdi?=
 =?utf-8?B?NFlrK3FCa2taQnBQaG1tcEZSeFV1S2lRVjQ0b2VrVlNqNEZiaXpCeU1ISk5K?=
 =?utf-8?B?UHd5ZUlnZk5EWUU4SWxqK0REN3orbTJiandYN3drSTdBUTNWcU1DZW9SbTB2?=
 =?utf-8?B?LzFrbkhTaGN6SkdJV3NtcnNIcmJwOVlzRHZCSElLbGNTNU9lV3pMZG9MeHZ5?=
 =?utf-8?B?NE1HZE5KdGI3SkswcEtrRGJ4UDlFTGNVWkp2UUtJVjMvZVRydUV5cFhmWm1h?=
 =?utf-8?B?cDU3ODhoWWwzVWdUUDByM3R5R29tYktmYmttK3hnWlI5MVRGWkphZWJBSEtR?=
 =?utf-8?B?Skk5M3MwbDFPKzM0MHhsZnpoSCtCYWNNbW5ZZUkyVWszYTRDV0VjczJyQnRI?=
 =?utf-8?B?V25vOTQ1VDZxMG5pZ3A0MDIrT0RJOTM1ckFXWDVsSjVLVm9rVU9GWmtsNXNl?=
 =?utf-8?B?QzB1R29hcmdLYnhPU0FvaWxaN05KbEpXYjYzTlVHaEs2eTJhTVFIRURaa0xt?=
 =?utf-8?B?MVJ2NEpwOVJYZXBhdWdlRytBMHNJVHlpNFEybDZyWTFzME1VeWZTK21UeWp3?=
 =?utf-8?B?aDBIcDV0Zkw5U0NLbkVIdk4zU1BEREJUUENkQ00ya3FoMnNEdnB4U05KcUto?=
 =?utf-8?B?QVdNemI4dEFQUklPL0pMUDI3U3poL2xvd0o2WkQ4b1RJanlOeWcwS1I3MURI?=
 =?utf-8?B?N3Eyd0ZWRDFUR2pNY2pxN1FQMmpUbGh0eEFXdDlneStxSjFIc3cvUS9zWjgy?=
 =?utf-8?B?c0drTlhLL2l0TUxtTEEyRjNMV0RGa0NaWXk3Tit1ZGc3TTViNUl6RGovVW9h?=
 =?utf-8?B?S28yeGdtdjdvbHpuSVlTdDVHWE1SeWlLOXYybWk0NWVKUFJTZ2poUWQrVFo3?=
 =?utf-8?B?RGY0RmUydmVvZVNhS3lkc3I0L3FNU1VrKzMyanNjdGs2cXpWaXl5Z1FnTEpE?=
 =?utf-8?B?MFQ2UzNQaE5yUFhac1VFZGlpZ3I4Wk1HSU1TZCtpZmpuZHdLNGtrRUcrZmNV?=
 =?utf-8?B?a0ZLcDMyOVFwaVo2RlJoTGZCRUNOWEF0ZHN6Rm5odnJuM0hMa1crR1JhOHVQ?=
 =?utf-8?B?Lzkrd3JsalcyNFZLSmtlOHhpRVVSYTZaUDlOYzFvNnZqcXc0ZFpVdTBMY2hU?=
 =?utf-8?B?Tnc3TWM5SUNoSTFFTzdqN3VqSTc4bTI2OHFhNDYrLzVwZ2pUUm9ESm9TS2lV?=
 =?utf-8?B?NmNxUDVWWlhocVlTcTRheDN4Z2o2ZUt1alpMRVdYb0wycThBMlI3TlU5dEw1?=
 =?utf-8?B?bW83bVh3dHMvSkVSY25XeDBjQ0JPVWMzS282SDdUUkVCVFA0bHRZb2FJTkNO?=
 =?utf-8?B?TGJralQ0VUNNeXBmV2xFVjJsQU1taWs5NHFQTWNkUzJkeW00ZHFrK3JjYUJj?=
 =?utf-8?B?Yy8vZStMNkgwU2puSXhyblNUU2hySU9IOGhQbk9jeGJueDBYM0tWSGVFU0Rp?=
 =?utf-8?B?UkdmUmY0RDJDbmdRUDBHdUNhNGpYcTRGOE5SOFpnZFZueFlYWndUbVkxK1FE?=
 =?utf-8?B?SkpNUXBkQzB1M0RvekluTEUrVk1Jang3dTFMai9HTi9VeXpGcThBamQxWFI0?=
 =?utf-8?B?dmRPNnFHQjlHR29HNUFjbWZBRjRBcll2KzU3SE1pdlFmU3M5QUd3TEJDT1Qz?=
 =?utf-8?B?NU4zM1ozV1RYdGVEMDJIcmxsb2dOZGtaMTRadlNkdlE3VXFmUnI3WHpzNXM4?=
 =?utf-8?B?ckl5SStWaFJRRVJBcnpnSS9tR1JCd0ZMTGVDampCcmhZc3NuZk1FL0loT0xM?=
 =?utf-8?B?S3BwUFd0dnVrZjkyTmc0Q1hDQjMzY3NaUXdkOTU1S0pGTFYzZkIrcWN2MEk3?=
 =?utf-8?B?U1dhMG1RdFd1NXpRQTRXM1lDd3YybFpqRGx6amJRaFFlQ0NuZTZQN0pMaGJG?=
 =?utf-8?B?NTZxN015YWdQZ0ExZTZvLzhIYjdPUkY0b2JDTWc1MHBlbTZQeVFHQT09?=
X-Exchange-RoutingPolicyChecked:
	iVYlIxQPY4twEsfFM7JUzkwblmheHedQmTpC9CMXyANmURyVhk6PXZks8fTpwjByd0h4NlGDkWpBxlpDFv7go2+T1XFmp+03aIbHVH3zze7VvxyVVPnIpct1JAZGL5Y6o1Uy2DEw8xYyK/optFa8dnauMm7cEGS53uaMdoVk5xp+ESPCVXmjHSv93eMtsL1Mek/wHdmhAjcC6ilQvEhHwcMcNrZSXaoApMNhCNlXcnr3sVQMUzGNiLybumBfSPDwAOYTZlFUc1diJGfcntxhlq8pdH89K3ES6ZYJBPfgfmpegG+2QWYbEc/B7yZLkC6J9/U6Obd7iWmTNyrx6VA7pg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d533c95e-694f-4f99-6197-08df40bcbaae
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 12:59:04.1284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AxvPvyJiQC5z7n5ZJWoF1q99jsLHKpz9cjebvGUXO3vwYgzG16NJInwR120Ij0K98WePj0JwCGkDfNltRZY5uHCI7sc8wKR39wYjBEv1qw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8476
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX/MO7+a3ovOGH
 TotfXBLuiJWHBhOZmbZx4SUqdINwIGwgeHO7KBmBgwj7pONB1YYBe11VpwvbUxQW0uJSLYqA0um
 9xjiFNhzjtjOyLkYfNNwaXMPCrtoJSEAT+zi5LQ6S6vz1Y07Xgi0
X-Authority-Analysis: v=2.4 cv=N468hG9B c=1 sm=1 tr=0 ts=6af5b819 cx=c_pps
 a=eaWElexNrpfURq8UtOOyIA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=W78o6iK9xthV0ZxQQwcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX9b6WB4/zca9I
 VHOc1sk7Tzk91TA9huKh9pxregoo74nQLrktuE+goK5OyG3YR2opgARyviejAXgXXBdMjD2unkY
 dauScg25KbU6A4blH2p+aER3SgJ252n8Nv1QJLx2UGkBkNjnK+j1SDWWxdcREoI5ENwgf6iPb5t
 sOOFV+Wy32CNh/9Mhed5sMpc2X3biXxcuBhqJeY6tZGIprafH8VCXy49V6UWZM/rqNLUK/rpcRU
 vtj67EHfuz2FzXujCDs1tpjxRz2xGj42qqapFg2fBVarkGKvYd1OTFzLsxjDQsmERyXcWP683B5
 FFAhNc7OcCOm/Uux++S1B603A+NAet5lbFpUB3d3RsGGBVNFBKOaftXmZYpIK6GYyOlaGSNx0cD
 YaAi0y+3L6Wrb7uKvrzOC8MhDVAAogRiNLsSHrH0RCTEjTxMCyqiJhEgzREZf3O0sjBac4sN5iA
 j15ydeeAjrg6ZRZW+Pw==
X-Proofpoint-GUID: 2ShNSCnG3H6K3DswX-T_gCzJUpDilKi_
X-Proofpoint-ORIG-GUID: 2ShNSCnG3H6K3DswX-T_gCzJUpDilKi_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120051

On Thu, Nov 12, 2026 at 12:32:17AM +0000, Kuninori Morimoto wrote:
> Current soc-component has snd_soc_component_register() (A), but not have
> snd_soc_component_unregister() (B)
> 
> (A)	snd_soc_component_register()
> (B)	snd_soc_component_unregister()
> 
> We can use snd_soc_del_component_unlocked() for (B).
> Let's add snd_soc_component_unregister().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h |  1 +
>  sound/soc/soc-core.c          | 14 +++++++++++---
>  2 files changed, 12 insertions(+), 3 deletions(-)
