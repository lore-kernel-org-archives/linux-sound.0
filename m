Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412057;
	b=LXEr5cJ4ZOBJupwWmLMldX6qI4414VzKf1g2W6iiRn0Zf5dMdTVKzJZbi3Kfv6Xd1p+v
	 tC5DN6j77hyTk3cGV91s5qsrFEReQkixXD5wRkEOA+g1eU96I4mYxiI5OFcP39aUGgN3z
	 f9PAGGbfpi17MbPD1DXbVSuw1x8uY4efthimVBgY++aOyePF70CMYAeNO0/no7E9nG8aG
	 rFqRCsSMgkQ3vqwxtoB+6uodVjVocMP/BXIrhkmZ+MfflKtCXsH41yzGD+vqp20i+bSjq
	 XZV7DOV76Ke92dfl9oOme1r7F/MkU/CmD+BRDWOCy8nQSpUea2XutguqHgRas2HvSKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412057;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AauSe54rN8FtXoIXCyYXJDg/tWcjfUVbNut1m+BBPQs=;
	b=qJGjRshT5gxiuqi9Dzn39Mj5ZnCBZVOPIycRxYEtS/b8tguGjLGw57jcFJpzDtrS3vNa
	 YmGzBJPBDTsrux6Xs4WDRQbUX6ImEUe9u74yQ6oM2Ek7nkvbyDNohRlGnc01KuzZViarN
	 xNSe9UyM5UtvNDKafn5cAg5IHdlFSQeVDyQ1t9INdhInEVMU+pLy0QQ5rQCkoiYLeVj6D
	 NE4U6zuJTUydNVmYdayi8Ls5bskQwN8T8tl7qMmKP+yebCz3uwyTxFCoRBeV26uaZFURR
	 nxa/ATV0NfvpH26WBipzGH1GneBYpIOcSaIyu1i9UotoFHsn8ycoRZ60pSJ9H2dv8fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=Ml8Z+6rR;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=fZtaNiDI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B67606A885
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0B67606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=Ml8Z+6rR;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=fZtaNiDI
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF3lc12997899;
	Wed, 11 Nov 2026 10:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=AauSe54rN8FtXoIXCyYXJDg/tWcjfUVbNut1m+BBPQs=; b=Ml8Z+6r
	RSGQ/zbEh5JcJM9so13v/XlKxqeQ03+2pCAURn++Hwy65viSoZq82uqyTOvBbJC6
	g7RgD6+aJDOjd0mAm8VJqacH0YP7KwQs0lEpFhdPF2ziD2YehVEma4+aFPSRR0WR
	IGTVX71JBGt7LQ8lXgmv88d7/N3TfEPj0N+Ut9v6rJAGr7GA0K15kEw10B6Gd5W5
	XfQNc3UIt52h0vnGopPw+ChiOILhHUE4SjfWY2uB9txARJvyMmbXrUpmCsqZN41a
	5C9QD0S1qz97GYJqsfad6lxlfFPYtqThNlwKJ1L3p2vkiW+B+73zHBQ64YBurZIf
	9c5kpRjfpD7gnIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=AauSe
	54rN8FtXoIXCyYXJDg/tWcjfUVbNut1m+BBPQs=; b=fZtaNiDIcQSEHzmYWyd2h
	4dBisouDTz5QASWj76subNxUohZfh1Z9MJtEpJr/Yd3TK5icqTCn79+i2V7JzQBt
	V6qTcNE/xl9FS7rILgOteQ0UwThgLBUa7Ni1hJGGa9oWtvHFNu/GOgevLUDcLpD3
	fnAIs4OZJfb6ai+iyufuoGHP6AHvh6xRDMIx4f1zhwySdN17AI5pMkC3EWnEqcNc
	iKnIxAZ4M+HRBNDAuYwt8vlxOvJq736vcvYgb0CJKapN6y5kcRrOSdkrrIRfqNN4
	cAoKOndhHrJnSP0s5nBuT1ZvAmx7WXmbdx1v3tdWFU91fY8irDIzWfifdkRn6vec
	g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010017.outbound.protection.outlook.com [40.93.198.17])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hva22p9q9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:47:32 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZoxXc5Gt0WtGx/VChb4h8cdxAMdJzUnxauiSRoKup/jVm+yg9Ncyb5a3dWmooQR+dFxRgCLye5Tqm7WpDDnXUCQ8ls5oB4MX/3JTtOgMEyoFqLMfF7x+7IQfhY739nLMl80wsyPT8BQdMuGjpIm+GkvsHUJ1JE/UzCZjgNWVCW7WXtxMPPyClKlgFjEeGBYDCa0J/Y4q3hdl7b00g9vTtqFP7Qm5Bm7dUhZRVWnZ4MuZMONjiM+jZHXf1Hr14U/Q3X8oLhBQNS77NJoji8QPfRL97m48Vm1ITXQfv/swgTgEux6ykFCZR+Totp+OwKxGLo/HrWF8d92Un3yrYtC+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AauSe54rN8FtXoIXCyYXJDg/tWcjfUVbNut1m+BBPQs=;
 b=QXKR/ehF9jbmmDmU7X462KI/9w3NnDJtH7ORx0j9r8cDFns3acB+kHWB+Hkdner91dL/eEx7u8W3kQkWz3e2n1H0ZHInq1RVJiuuCXgluUI7VEKrNC0dnIdjc/7GDSAecuANvXOq/wyhC/e4pG2Q/Pgen+E7F/dcNv+lWWp31ENwhawo0GYO6Mzx/iG4wrooWlcLxzPqaZX8CXNZrzFP0DB101cpBTvUbylyiTPVMQAIcqhHMfFfh67HJpL/VmMnJBzpEVqKgYo27Q/ngsx1ehGbF0S1UqITx0iWo0wk4FtoPDEJ1W28GAqliNKhPgrnAJH+Jl8YgMU0IRUC7a65Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by LV3PR03MB7480.namprd03.prod.outlook.com (2603:10b6:408:19b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 15:47:22 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:47:22 +0000
Date: Wed, 11 Nov 2026 16:47:19 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 14/20] ASoC: soc-component: add
 snd_soc_component_regcache_cache_only()
Message-ID: <avSOAeUeY_Oc3bsz@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87o6bxmf6s.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o6bxmf6s.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPCP307CA0004.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::17)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|LV3PR03MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c9474b-e283-4e5e-5b1c-08df400b131d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|261102123227099003|56012099006|11063799006|261021121427099003|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	+RGuPFJFtnrCRcQJcn3MCI5Itm+Anfa8epX/Gdw2eqAT13mdGQpPKW4hYJMQSNSikcD9tPZ+bYQdJdFjyRjWbRFyDorBhukzVq1QfYQ7nf5e8wlIN+u+a9tzj4PmZtC+4551egnUjxQVt6kZBpI6ShmxsuIoSltcZ3bf4Pwi5Na2PTlsNYYl9oKcGMTeBqdzn9ssWOkCpfz/gZhgzumZvYNhvOLYHEMtsigTMw1mxUqbWcuJnu/YCWrqD7jPF517mEomd+WWZM+AH9iOhtJyGQwIoqAvbgdl4en6dfJ72/G/dRLIiZrLZk23hwC4DmJ9GLHLxvy6fWDD2SKLXfjO/9MBIR7cbFfvXwMPeAEIJYI6keiCZIx3cHKQNUkseGR68Zl2zfIb+rb/AfG6e6pWPcqDa8qwdtqgA28PiaYv+do0aoNjtdRW9LugRvEx7sMqij/EpERGiOm9W1/EZKwRMLhhMeyxyNQl1Ww4sg/D5iEsaMoFoPvzHgDoGmqhhgmksyxARfVp2gWURMy5ABhNBI+DDtCwOiYZXh9EkRhKfCXeedDbpt0MfipyFZNqd2SBZzIYKfbJTC46Y4HxDN3z+t/xNPAGu05NECLXVE1U1dSY5pWrRn6iBdhIPz7pkZ0TmXysIZvu2SHHgBi72L8WJjTlWV1xh/IWU4q/emekkZk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(261102123227099003)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWlJQk1lcmYzOE80aHpGTnppeWFxMXl4LzdGZ200TXgrWmZhNzlxMGYxeTZF?=
 =?utf-8?B?a1BHa0RXVWIvNktsaitiNGIwREtXRnhRdWxDd1g5WDFPYjYxNGdZeFRUUTBo?=
 =?utf-8?B?Vk14MzNJcENFeGcwNS9meHF0VjVURzdVbnlOMTJseVZGaHdOSGdTelVyWUtI?=
 =?utf-8?B?MGQvNG5RU1FsVVNQODlpc0ZIRy9oQnVMQTd3ZVZCYnZ2VnlzOUt1c1huM1pY?=
 =?utf-8?B?R0JMNTk0NWt4OU1yOXpaOWtKSEFhdmR2NjZNS0NDQVp3QXlnTnIxRldVekdy?=
 =?utf-8?B?WUFsU25EVWhKQllJZTFoYWhqdDc0dDljOGJyQXdFTEVVdTAyeXJNYnNOeGRn?=
 =?utf-8?B?VnVLNE5uM01HdGUvRklmU3B6WlZxOW9uT2kxNjhhQUhJRjJvMVNudHFpSHRN?=
 =?utf-8?B?RmZlTFFleGdMV1d5amQyWDRwSWc2eVlTZjBkRTdWUWhHZEszenZsb0Q0QU5E?=
 =?utf-8?B?UEFrRm8xZ0EzSTZ0K2NQUUU3Uk5oNEh0Z1d0TDl1cEJiSXZEQnlVOVJxU3NO?=
 =?utf-8?B?dzF3cUNVY0M5WkU3ZDBWY2RuSjlKdlp5Tk5kdWgwL3o1QWNxS0twenpDQzB3?=
 =?utf-8?B?MWtaQ3VMVjhNVFZmdFVzM3JlbDM1aS9ObHRKTldySXAvbkp5K2dOL1l3ejlj?=
 =?utf-8?B?djJLczRFd1Q0cnc5WDRkK3lJUGQ3UTI4ZVlYR2VWYlFKbGo4Nm5HTWJ0QjhK?=
 =?utf-8?B?YUtxcEtBQXFCWnNHbDZ3SkMrYmpSLyt5aC9JUy9FNE1vMXhiTjFEQ3kxbldq?=
 =?utf-8?B?UVp4N1NKRGVaV0ZYb1AxMmdPMzBOV2xwT05zUWpzTlNRdVRMOWtqN1JFZGFh?=
 =?utf-8?B?SkFmTzA3WUhVaytpY2RMT1BVYmhqSGlvYkx1MmQ4dnZicmdiYVM4dkJwWFZM?=
 =?utf-8?B?ZWpJUkJlVUwvcFh5endvZkxROEFyR214amdKcVBkaDg3OTY5UElOOG5nMnJF?=
 =?utf-8?B?YXBBeHBacy9neCtTUS81bVExTXJYdGpyK0ZFRFkvZTVEekEyQzAyb2NvT2dH?=
 =?utf-8?B?eGpsUjRwV0N0Z1JuUjJJbHJsZ3hMcG5sM2l4bWxoWUxhckxOL2ZyRFJkbk5I?=
 =?utf-8?B?M05DTGx1blp6bUJHcGlFVnpOZzRLV0YwTzVzaS9HempoRkVkYXl5UGoxckU1?=
 =?utf-8?B?VmVHZTNqdGxPekZXUzRiK3ZQT3RoWnJvd1lqcDJVc3FXTFIzQ0RXanUyWWNz?=
 =?utf-8?B?YzMza2twenpDOUVSa1JtbmVEdVhvUDk5emdINnFrRTRrckFwSDZhZG0wV3Vt?=
 =?utf-8?B?RXRCU0xmMFlnQk5HUDVhRjM1RVJwTmx2NDRFY1B0end6eElacFhqcXJlQzZG?=
 =?utf-8?B?S0svUWR2SEIvRnZ5M3pWcGxzWFRzbHNMYmxQK2MxeVBpNmpKVFlCRDZ0RWpi?=
 =?utf-8?B?SUU0NkJmVVh5YitKQm5iTjZqUW14UEpzcWZtYktLSHZNY1B6TVhGNUIwUzZ3?=
 =?utf-8?B?dDZYQ1JIWjZRQXJCVXRjLzlWVGtTQTVpS2tpcWpQOUMyVjFsT1paa2dZWmdG?=
 =?utf-8?B?YWswYW9HWGEwbVQrbUM5TTlYQzVoa2xGUVFzOHcvQ1VEVXZKbzVUZTF3eGRZ?=
 =?utf-8?B?bVUxdzJEeUJWZHdWeXNkKy9RMyszcmo4dUVqVkR6WlFDWXNaTFA2TWcyUy9l?=
 =?utf-8?B?dWtoUnozSit0NjlocTYxVzdDMVNrZWtLdUJ6WFpWdU5BbVJSS1NLTGx4dGRx?=
 =?utf-8?B?Sk4wY1BNTk8vaEg4czZ0VlJLeTlVNmNvQThXKzg1SkVwODBIRStzUHlGelhY?=
 =?utf-8?B?NVI4QnYrQkU2Uzl5MXFibU5iem1sZHhQb0FnT1hLY2JzOUMxczdibU9XMU5q?=
 =?utf-8?B?YXo0QllBSFphZmN2NllOclZIR0NYZmtCVUpSZVNqeHk1M3ZaNmE1S0ptU3BQ?=
 =?utf-8?B?RlBleHhTNXMrSms3S1RMRzM1Y1BSZnNzR1BkdVhma2VFR3NqWmJTVGdkRnV2?=
 =?utf-8?B?WkJXekVTTisyYWRNSTB6emVrNFEweGo4bmIxZndRQWU2Uk5TdjdzbmErWDRh?=
 =?utf-8?B?cEd3NXg4YzZpUXVwUW5FaFdwbnhRRFNlSzcxcTRLRFliZ01Xekd0Qm1lc2Mw?=
 =?utf-8?B?dXJ0a2NFWU5UT3N3QmxUZkRtVWJmMkRsZC9QaEt1VFpnRU85TlhTN2FCQjhB?=
 =?utf-8?B?QjZjNXNwR3AyeWtDelVGdHhBOThNVlU2OXJEQ0hEL3UvSlZjOEpqNzlPcmZJ?=
 =?utf-8?B?bmNROUZZYXpQaEorSjBpdGlMOUxVUzk0R2MxdUlCOXdOTmhIbTNOZDVrMisr?=
 =?utf-8?B?RU5haEhSU3Y2Y2cxVjh3NHROdndzOUtKNHJiRVZuR0I4dUM1QUhrQnlWcWJn?=
 =?utf-8?B?YVhPYXFEdEgvS05uc2NBRGhpWEpRR09kQzFxY1hQUERpeWx1ZGgvdz09?=
X-Exchange-RoutingPolicyChecked:
	UrDa2sO8S1GZEZzrrIwGF2n7XmOiRAxgDAn6KCGzaOkhQIT2Xv7yj5++PfXt9TirMLFTvEBWpfMZV3nyiKOkWssvfEqGTK7zZXjtT7RDJb91jp79u/Hisnt5qg38mILMybn85LLuEleZD4+iG39kg/mwUFc3IOkYaVZAlpBpOoqdQPwDbeLCogGTL70SDZZVk/pVpQCmHY8jLPz4AX4lnCpkSeJtM4aFyKudPppTb33mevnOUSXKC0bHLtuPhoEp6PuNOR3jJ+RjBUCrnOg8A99Imp3t5/jYiOe5bPK/Q/VdeyR/OsqW1qT3JC9YiUYnbQZK9qLPvikaH/MJn1/hNw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c9474b-e283-4e5e-5b1c-08df400b131d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:47:22.0482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/DGameGITn1eNH7EbdovlqDQYNGkcAtd52k3nzS7qhV5ss9cpEMUxPC4m3tHaLH77glZXcCjyJpJ6jl0bZNHfsKhPNZDhVWtsUwHI1YkJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7480
X-Proofpoint-ORIG-GUID: mxN9Ho6NazFANgxqzuNetSOk7_vom9PL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX1hDIhPE4o3wA
 Zbdj4U00WypdS6eXR0oGSz1k+S5pyMEqQ2GA89LBmgGy2D1Kc210VIMjGkHpG6bWWENydrc9Ufa
 qcY55d6P6hd0AjHEqX8ILX0I+FjNMXQ4kmjhn0Oot+LrqXiW8gCoHx0TAu0UPYinmxxwjsync0J
 NvrYHPqYZui9NQDrs+GDZri0pMINbqhcsZljI+yZLl2BFgNOU71Cj0Hnm3ujIJH9DDzj5Cvq8tE
 N/9AVg4qUCMBKJxBgIea1Xp9z3X3gNcxNeFPO892riCUQTAlkTsz93iR1qhpQkPqPtz7ezjY+5D
 jWKHRSV4QJqku3IMsfWLBcbouPeOaIML+hkAlusxPKs+d/cxrq5jb2b9YXF3rz7tFJ9Ihtn/lAe
 KqwKY2ncK694r7tYjzf1w/9fPjLiZXnOZjcrkfX7qpx9pVGPmKZSSE5vRl9b5zsNEBhh8kV7Hj2
 UadYA3hXLPlkM0hJAag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX6dr8TuuP8dZa
 K1pKi3BAK7CC7xhlbb/LX2GfrYp4XsomJiIWdjKzGUQ7FvSSmHHtbKDu5RhS54Lac0RW1uZYcV5
 eBZqa5Aspr9aOBN1Bdq0f9HLriCesGGkxuDwO5ob9vqKZB893a9r
X-Proofpoint-GUID: mxN9Ho6NazFANgxqzuNetSOk7_vom9PL
X-Authority-Analysis: v=2.4 cv=ZYmIpcVA c=1 sm=1 tr=0 ts=6af48e14 cx=c_pps
 a=gXOkrB+iIAMM2YfcT1gRiQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=avBLM2cj_8mYceH1lFwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:24:44AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> Adds snd_soc_component_regcache_cache_only().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
