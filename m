Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412083;
	b=YfjLE8TD5zZDUnEcYT9h7d9NTZEwaaemTJYRvXHjygk7dUdLaV885gJSIP4UsrBh1Gph
	 0m3yGyrDyfmZniFZ+5rRdINj92d5Oyqz7+cpc+l2DdhFCtNh0jkEHbTvIcVOb1tyvJzNF
	 PxsRKSxhCCfqRwSNoRnMXsW6MaoEd+YX8i02+MaeGS/Znn5i5AhVMxeFDai72P1nVkRVL
	 ljXgtahVO+fZeyNghhVke1rqid5IZixTZhQRKIspiCLArLw8pXVUUoF02yQU5vDCdyt0C
	 GMxI9mYRVSvMsmdNVWkGCLkmzrWnKeywBU8imJbW0LjSfrNAe1UVooVQ/2zSKQf6VNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412083;
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
	bh=cE+19CTaVjY4lh1ESAerK/+xNjSwj1qxwdNJsYzAsDc=;
	b=PO4tA2vRIgJzOJXkinhxlWdPtdsrTYtd602JT3h2ECBduO7AQ25fNbgWIH9A6goPS3AB
	 iP+wpHgcym/QftBAqhCbH+uB5fU8YJCULwSNgF/z3nXDXu7JYkVgubkQS+W0NjUauYG4H
	 tZN4NOftIZaTbB/MfIIUnobFZrZ6Syz+GzsME/DF+5CBEv45fiph4j93sn59RDi8qApv1
	 FhdbHI3U2dntD4k1p8rHknr5yVRpomiTpLRheHLGcHdxL45OY2Ne5MPFadPpxCMay+AFW
	 tf30k+WSQNj+YJo5loGXmXFMPeAsll2UdD8Jat2EJesMHXyJZ0+GYgDAk2w04eL6dAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=HcdJRbM9;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=LFr0+3sa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477C2606A326
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 477C2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=HcdJRbM9;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=LFr0+3sa
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF3DiS2002419;
	Wed, 11 Nov 2026 10:47:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=cE+19CTaVjY4lh1ESAerK/+xNjSwj1qxwdNJsYzAsDc=; b=HcdJRbM
	9P+HusqSg/NmGOuOWD+xkkKf9T1f9sg1JlcChfaug6h4X8lIfHJ3DreaCrhpDo//
	pzgyZykv/YqTFIuDeI6Huw+FJ/4aPBi8u85+lSR6Y36NnW6zvqbAS3Mwv9BTEzDF
	dMJzdb6Eqn/FVjKByv/zvHyLCuhOBsyBiAQ0+rynt5IDQUx9UJ98cyXzn6UAPheA
	16wZ7oDiEER7QW6k9seZOWh0tpWS39ZTFl5XEA3Mgeo6yNUliVwcwYn4l2vV1Pk9
	CWTvl12hNadCWh5HWJZyUFYPbzQSqplE4uTMH1zLDzpDf7cWxYKP+F4AOsjdV/qn
	nk6Y8TsVFIg8OCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=cE+19
	CTaVjY4lh1ESAerK/+xNjSwj1qxwdNJsYzAsDc=; b=LFr0+3safT22rFOGqofjl
	N0nu9hpKk9ce6HvDvmO29SepQS/9nF3LdzlbhwCAY/JOVc9vHEEwh8d7zSB/LiPh
	3VZcoCaKjBKnufeCdmN4Z0cV5R3suOQtC6bTVSPS3NbzFsrsyClTNAfnwYWexrzC
	vBVGeW5ZSUCW01PtwMLedJT0kgn0SQc6ILp/e5gQJE37bBAeOlV82kmqdTtG3/PR
	oevK4YTriwEhs5cLKUFXHajDMxfOnktCcuhEDHULpe3TCeWMYhaGyM5tE7hmxjJz
	4HOdUqO5F04MrvnHn6fS6rBDfdavYZeJUgIa2q9irJyeyxKwsZ3Ui3cTR22rS/qF
	Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011006.outbound.protection.outlook.com [52.101.52.6])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hv1nr1pcg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:47:59 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdQsZBzy2OrmmiHjqh80Gj40o6R7QObXiH8LcV/dh7DV/O+BX3pNrycumhG3y1TOJ52nWHUVd2HtJMlDmvGzOsgKP+JrXIInErw2T5UOrq31yovjqF0OTD2UVT+PX1aytJDTl5f9+IfCDcZVKtQ7DEdNqruthSpre+jaxGuPYcjVHfHUoTjAyABfx3qnIze5oAX/V7GUdAP/fAXCJRkrEkK5+2b3m9fK8nhS9tWi1xaZY5cCGomm+gNE4/R5sW6eDJ01o2g7XJt9yQz5jHLxDjgJ7ZQjo/v3KxsDOtuCwZ3yz7Uijq7mTDwM+S/U/xcL28Ysqgj+YuJU+sdYjOYUDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cE+19CTaVjY4lh1ESAerK/+xNjSwj1qxwdNJsYzAsDc=;
 b=GTg9fc0vQ4qt54BagzEj5IHW6wxFwseq50xtpwqqs+jhPCClnfT9S45iFUPsHUfQ+JcZElIUZKCyCZKr3VKwrlNUILvSqFkewt6rlDRn4uXKILxtV6VII4FBk3uDa8fS8ernS/g31QzEmv4AXFUeeATg8fwRuM+k6snhZ6qZlA6VByCA5W1dxZdTWFpRC1ozuI760Mu5D5uxjceWPQ5hj+9QwXwrCmukNgsev51I8bp5BcA1mSejcTZ4A7AF9wgUiD4gl1OOetXe4gtzymhdj64H2IScV6e+yJW63K4M1ZjeOhBCSfzRWC0W4lBB/ATcQPT+Uig8fOGkSoQ36OanrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by LV3PR03MB7480.namprd03.prod.outlook.com (2603:10b6:408:19b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 15:47:57 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:47:57 +0000
Date: Wed, 11 Nov 2026 16:47:54 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 17/20] ASoC: soc-component: add
 snd_soc_component_num_dai()
Message-ID: <avSOIyXefki--3Bt@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87jymlmf6f.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jymlmf6f.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPAP307CA0008.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::16) To BN9PR03MB5977.namprd03.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: ddb4ca75-913a-45ff-0781-08df400b2827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|261102123227099003|261028144727099003|56012099006|11063799006|261021121427099003|261022105027099003|261026140227099003|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	EoeSGUzsdjDYZ33FPCB9f1pnvhnZUGkYuf0nFy+3LuoSCwX7YQBj5d9KFlPnw15S/4hZ7J5KJKKc5tuPUJtZqOOGXa/IdU/jzEL0M8+7ROE8ai70sLgnm7NB7+7o7o2QiidqRwVRTRISwgfg6/jAIhHzrxqHgxRw2IoA+XZXer+XxUSA8n+kAzZoZe/o132ftEDXK6asvevxMC4cvUu47VyUXeDO/hkRCXBsba0y8E7tx8LPqEpLFumMyJ/qFMnNpoOKmU8S1nX7vqa6IB6HXCpbx6ekP1ZDzg6ls8iB37JRAjnyecXbtm3J8wE5n49pEYQuIKtJUQy2OrfxqqDDIYIwXTjHjhyqnC0yBv+sNBjpBEywaehE9KNrtuW6Qurypg1UyaDVfosXWnG8dUngIXrkyfdJkxXKOFa3d4FObh+kbFiade6RMTpbCumDN9iq8DqqBJwMjiCaksGCGMiCnItNtS16rTY+qQL2qzhumY+9oT0I4doJ7UKLCQF4KTg4Ijuws7MuFGRES+h+gAm7IM5HhdwjKeB/kC1oKi2ulz84YoyIIyYhJWOe2mb13nqztMrHNNdYzmfIvZOtLTTWztQ41aPIr8SOx95iyPUuw4x5MmB2RR/lbj4/qmVNpXVv5dS+kgvVbEtnpsTk3sXd5ZTdbGH1wtirzBWxxyWqF90=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(261102123227099003)(261028144727099003)(56012099006)(11063799006)(261021121427099003)(261022105027099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTE0c0tHbGtNZFd1OHE0ZkhYZk8zdS9wSUkwSEJjSmhrS2NUQXdndjNGb3RX?=
 =?utf-8?B?SnlWWXY0STBxblA5WE5YUE1mcDYzWlNlRlRSa2VWUHVZK25vYUIwRU9uaElv?=
 =?utf-8?B?MGpSZC9sUG9pS2VILzdnb21US1hGUHloaDZIbVdUdEJPZXU1MTFYMG01d1pM?=
 =?utf-8?B?Q1dQOHdxYUt0OFUwY1o4cmFVTXFDRnNVWUZaSVFpcWwwcHBJNDlmMEZmZ2E4?=
 =?utf-8?B?VDhHY2FOeVNOdmJPU0ZZeEp5K3ZlQVo5Sm9IYmlOT3RTR20xbXRXOHlQc0pC?=
 =?utf-8?B?TTE4ejcvdncrK1FuOGlZakRLMnpVNW55WFM5eEMvSlFZd1krRG5nQ3NpYmo1?=
 =?utf-8?B?SnFwem1CYjNGMG1uSTlxdElURFYzY2QyV0xacm1qYjZmQXVnWjQrelZoSmxQ?=
 =?utf-8?B?dUl0d3l4QTMvZmpmdlFyT21abTgzVytvRFR3VGk0R3FEWUVGcy8vaEdveml3?=
 =?utf-8?B?b1QvVkNCTEJRUzhTZzBOdjlxMUlHNDFhdnF6MlQyQkkxY1FSQVJ2SFcvSlE4?=
 =?utf-8?B?M2RobDdQOXpOaFF4TEJzamtwWEF5MGprMnJoY3pyKzJmUXM5VFBvME5wTVVS?=
 =?utf-8?B?dGwvb2h1cmM1SlIxdm5EbDF6eVgyUHN4OFZwTWdXMnNNK0x6S252WFlpaHYv?=
 =?utf-8?B?OWprTGUyUjc5Y2V4K2NPZlAvTDZmcVlsUElTeXVQRTgwc2xLOFVPVVlQa2ZW?=
 =?utf-8?B?ZlE4citXQ3pYUm1ES010cHgvSEdBYnU2VHI4bGtuVWVIbDFhMnVLNEpGQXl4?=
 =?utf-8?B?eEZOZm5HY09ZWER5V0FMSUxWYk1JNDQwNEovcVFueVFzQ0NFMjFTWUNMdHpK?=
 =?utf-8?B?d0NaZmlnN0xjc1AvVlQrejZJYzlXd1NpYXpYeTNXQ1dQVTRJeEEvbURGOEY3?=
 =?utf-8?B?Tkp6azZicitKc1RZdVg0NFdVR3JRd0UyZ3hTc25rYXZSM3AyR1dzMDJpR3l0?=
 =?utf-8?B?OVBRWGdnSHFlQ2x4VStUZWhhb0hxeW9Lb3lMbUhsSmNGdFhBTW9WL0k4alVD?=
 =?utf-8?B?RVdTRGdkVHhnYURnWm84VURoMENaUWswdzFkajZnSXM2WElEdTZ1RFlsWnNu?=
 =?utf-8?B?bnZ4M09FUlVQMWtjb1lPQUt3WjF1S3Vtb05aSFBBN1RRakd0UElSa2J4YjUv?=
 =?utf-8?B?UHdVaUVuMDhjaUQ2aXo3aGp0dW5IbWh3SVVEWE5JbC9WR2FnUnpuM3pmZ1M4?=
 =?utf-8?B?d3VDYXE4NUJRU2VwaVFDbEUxbUpweXJEY2E4aFhNMVlnS29jY2t6YllUQ1du?=
 =?utf-8?B?dExnSktwbWdNRVJaelh2NkZDa1FlTUR5MUFDUDBXK0t1bXFEbXhJbUxrQ3Bk?=
 =?utf-8?B?dmF6c056RG5CVDNhQ1orVy9sM0xpV2xFOVdZOTErakxVRkV0RXNxcUZqaG4x?=
 =?utf-8?B?eURvYU4zY0FtLzJZR2trT3p4VHhoQ3R4QWNZYkk3MStDRER2TWpaNVVaM3Nl?=
 =?utf-8?B?V3MvUXZVb1NYc0V2bU5Gd3drVTNMSUNKSTNvR3R3bzdTNGdoTnQ5ejNCSXpO?=
 =?utf-8?B?V3Zyb2RGWCtmYXJGOTNMeFR1M0xrSmZFUFVFNy9vanlWdExYdlJPZzR4bkpX?=
 =?utf-8?B?Qjc2UlYwU3ZscXp1QjNJVnozMnJVcTBSc1kzYjN5TFUvUUxaY09QajlNTkVW?=
 =?utf-8?B?a1lBdUQ1NWJHbDlHY01qRDFCa25mdnR3TmlmZi9NNHNiUGhoSkVxMHFvVzVm?=
 =?utf-8?B?WU9YQnpST2xwUStTT0hWWHhibm0rYTF2Q2FmZjFPRUVpSVZvQlpHWGhUNkFl?=
 =?utf-8?B?RVdPZmhBdjdxbWV2ancwZ0tUUm1sTCtETEZUa0dldm9leGJ2SjYyd0M0VG5U?=
 =?utf-8?B?TzYxVk8ra1dzM2UvaDhQcy9WRnliV1lqTENZWUo5V3JHOTNWKzZqY0xhNG1M?=
 =?utf-8?B?Y1JtZUxyYzVDWkFVc2l3cWdlRm8xS2luTXBrVVpiWGNrckN1dGp3YkVzcW5z?=
 =?utf-8?B?NGduR3lXdzBoTW9SS043a3F0VVRBMjAvUWxmL0hZU3lQL0dEYU03MEJERk1G?=
 =?utf-8?B?cENRUTNGU09Qa3VLNFJJSFFuV2hETmNadGt4bHhTZmRhNk0xUEY1d0tZanBT?=
 =?utf-8?B?MmFZd05Ic3JGZVczWkczblZSWjRiV3RHb3VwdkQzR3JXVUVVV3BUL21EK1hT?=
 =?utf-8?B?VlJESmVFdlpIWmxqc09BUnJQM0hMQUE2eU5pK09JcENuN0loRmJZK2x6V3hz?=
 =?utf-8?B?SE0vK3RqRzNROFpWclV4S1BJVjBCWTNQYnJ2QXlKT21ZZkp5eElzdVo4dVlE?=
 =?utf-8?B?UkVTYzFMbnpSUzd4ckw5ZHY4dHY2ZGpXZldQd1BZSk9DeGIrZ1VqYVZabGNG?=
 =?utf-8?B?bzRvTUt0WDUxeUNibXBBd3BZOEVZRXNYVkF3ME45c1FiQ2pxZ2VVUT09?=
X-Exchange-RoutingPolicyChecked:
	i7gciin1RTBBzoF/Mh7UFAT8ot0bdjV9QkY53fZjyowaJN9JL64lrYnS54YmJCiqlYMQ5CMyudtNJrc0GqliPbeBOQEEaJh9B5b/hVJRZRv/21y1DL490v0L7Gn4I6D8sMkNhDrOlezgOfjIsWYR2vWkLr19HROLoDJs9DVDyuNtq3vvWJJCQLZZQzG5OKL7kPWiUpB/AsbANd+WNTlZ4mV2RnmuFd1W85fmdreVS259UVxRlKcAwq07XwnWllyn3gwFkaX7R2C4zyPjNtpdRyMp5B4hdDtBGD4mK3O5F5Jefi4MlQOlKUtpPFWIBO3r4J+720do1nxP047xhM9F5g==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb4ca75-913a-45ff-0781-08df400b2827
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:47:57.3098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3j4bDlngMao3JZTvECECp5MDyMmjgpmpXGFgCSZaJ2m3AYgfaUJE7BLQ/8/T1ekoFF9HgoSeQCxplJnV6jnlm8yTsNlGTxH4hDXJGGghSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7480
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX48dAMsAVsuEg
 yO3kWu3aLoFCHTPp1Gd13E3r5mAAW9YEmha6T9pbAnjSTBqwcnEu7t9sfbCUnlB9cvMRGfJarGB
 P90BWPrN/jLqzddah8Uyeh6Di7dKiIi1GZjOActaRcdqtqEbicNGPK5H0QyZJObuZ/SpVPHtsda
 piVa2ncoC65QxkUQtmjZ+il4/LH/MLbecIxeKXQ9Peg89VS6jy0dRuimcMy+GDHQ1uQJuxu7/tk
 6RtrL2VjQBQBIjJoiXLr8qtvx77uedEPtjEwbdYdBbDIT7gNyZ1hCdDobQKMarILFI8RSAqACTY
 46TVJ/DAs/N5x0dzacCoCb1KLTWfcckEe0cyCSzgoN3isXOOCcrn4fHydq/VuHSMqRt5FaH0BlL
 CMq6pUnlsKpgMkX3ZQHZDayuLzJlXNR5I3ImwDq5CQuUT3cQFZcRJiXgUvW7plPJqnyI17SiotW
 Bc30ORqyN2ib/F/8JYw==
X-Authority-Analysis: v=2.4 cv=es5KXYpX c=1 sm=1 tr=0 ts=6af48e2f cx=c_pps
 a=Al0BzvsZ99ielPXA9PThCA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=_xF0M8GitKh1NRSYBSgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: CGT8z1NkG_3WDNcRZHA1BRJuowh-3STp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXyJj+LH85PgUx
 K7rwQOjFTgNKJfGsMzUEpeM3LMt3GQ8iiGpIIIH2fZRV7y4DfSuyDeary6hMTOPyx4pi8HxgbwG
 HkoAM5Q5jHs3sM8QCKUjeF+EqCKQ3uZluSCDPwEDMbgKyVgMWNXG
X-Proofpoint-GUID: CGT8z1NkG_3WDNcRZHA1BRJuowh-3STp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:24:56AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> This patch adds snd_soc_component_num_dai() to get component->num_dai.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h | 1 +
>  sound/soc/soc-component.c     | 6 ++++++
>  2 files changed, 7 insertions(+)
