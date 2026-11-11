Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794411967;
	b=KhuymCCFbbyg0rxKy+2jiWNx1WOgOEmqNO0qgi1wjMLagpb36tSvdB5DuhdlNsn+lm7e
	 G/CQzgNcanA5/WzNlqLooB3ZzUn1K6SO7Z7Zci4mlf+da7KcDifWIzl9IAm+4r/kVoGso
	 38dX0mR7iHkQz61kduc5NBifUcSJ0kFD7OkCpmrC0afX4Nz8173/JGLPOzHienA7ku+62
	 e+kWmjGC4T3BuJqu6Df8zEtqhF+6ExoJFh4FCobWF5+z/l677g5tJJ5gfcYxSBh0oTyhr
	 4THWaqXYb5BjqXaWWpQDDFfkE90ZTSuGFRhbqfvfBYW/7GcKoqzLpK7r7fTnl7Z6oHQ==
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
	bh=Y+IMHkeAMQoho3A23vtXcXjoUlQmmNiDkjJX10sctJc=;
	b=doedIeiPFHezeGMzeDj6LmoHBKYzv85+OoJhcyU0Twn8YuTnTf2Wq6noFw6rtumWncjq
	 ejvVsHUPZV9HMCTdUdFHNo5v3NjIuiT5TAihiyjuH4CEJS8gaTNr53iF80yByRlZ9b7aA
	 2y2NbihlwKsfzrZYTJ9sOWoE0fJSaONBiKklgaWy3Fd8JQ5r1bBqAvjzBs9BCCLRcfzg6
	 E99zPESSAA78X1Zqn1zuBoA1790BqkBiG7vCddcdXeG4gts4T9uQPl6W/u71JQ7oEeMk0
	 zwb8LOTdmiTDh8OJxx+hlpPtTIGmDaDo4TUaCNTgOHutAB80jwaKn33FTchIjEiZbQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=N5wbLpVI;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=mGWMjRb2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE56606A32D
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE56606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=N5wbLpVI;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=mGWMjRb2
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1UXV652321;
	Wed, 11 Nov 2026 10:46:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=Y+IMHkeAMQoho3A23vtXcXjoUlQmmNiDkjJX10sctJc=; b=N5wbLpV
	IO3TJL1+RCEca4/cn7JgzTKrR0xFD74qc0TwxU2IyPBDudLXB6zPFYPNbnLcR/j+
	oJ97PmFzDJNIhJAIkcrM9cvPK7ul3njQvDA/1cj9ol0YB8dXqjW/5G96rYsCcpVF
	uWNPZJQUX87qoXSCojwXn8Zqqn0Lard4DitAtflC4StOiOoP9u7kgIb/tNPowdqY
	H7JGczosIctPG4h3Dm1/LkDeeWKmFGG36ZfhF9F+DVMq4ySeUCtabv2dqMgfFcqg
	LBk432N7RkcVbxlXpEuJcmbRBjT/m+/zuJWi8EdDpqyssG807sopn7EyizWOZnMY
	vNZn+q7cIZAmPFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Y+IMH
	keAMQoho3A23vtXcXjoUlQmmNiDkjJX10sctJc=; b=mGWMjRb2s9flOyEoWPOWb
	4lwa/SRMI402C3ie2I4g2Aek9+JsdtmTTJ9mtA9tD4uEZQziUnMiMV7XHExkl6Db
	Tr/lQ/Tr0Y77riqkx8JqD5TnQF055spLhgpWa0R5MG3yL++1be2s2Uv0g2CToB2M
	AK2uaq1Hy5u8fsZrm81G6TIHxnXuLarAPiqnBjWlh3/le+OjEqPcwWc+I5hTXc4p
	Ff0ZweGbkarkNO0XfMcZmu3CJWoOMV2hLwKnumYIlVIS/mxz2G5hqzuxCuu0NoXC
	8p5hFNMVBij/PXcrmcBUgO8+FZTG9F++hDPTvfowP0+PnvvpeiBffJe48ej720qe
	Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvg57ur20-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:46:00 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kungqYrZe6ZBrsb/wr/TzcxPR/dGOvDA5qa/Km4acbIwqb4IXtEaaVRptvORH3zDRsqbMjAjrdW7EivnSXUlJNeAI+9NgWa8vCmNSy3qps7iQrbN0g4LkdD+RUUQb/n35Xaf3RGyTevQQWNsL5XrdDd57FIHsDkUWl+ZbFDsnfDN9Q7ky0IpICJ1GIrvvysrQGT00o9bnFblcMFa0NlTEF5M0zXrEPmYzn5s06nofvCYLOOtlNkhkJwqKalccO2BqxNr08QEPqeDZMEBcJXvnAeVGgVB3UrJZf1qpvneJDFiF3S+I1t27Cft9L5oiBBrpcMNiB9jy+DjOWTeydqInw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+IMHkeAMQoho3A23vtXcXjoUlQmmNiDkjJX10sctJc=;
 b=qXFmg7m6foDY0GixqEwv2ob+rTehuNNmWtBHdnRQbaoZ1clSDfOl+kyxpUSRLXokxwiE3obdiaJ0ZvXF/7jbG9kGRAMrJj/KCvDEcOcfGIF3Wufw45mLMvD12xyza7D92h+WlR/qoO/R46Cjs7NCh0om1fWxdoCaUVYBeKHhyDwbH9YyPvVBfMWiqdd0TG3z38CloxlXrSxyY8BpRtte/ynCjsMBOvpGos/d899aSmBQhaluVkTY0wzYEFmOkIDO1iG4Z8EI40VQnccraxrv96NBrdOjlie9jUtqsy0oDAK6rLiIIV6x5Y1vKT4CPVj08gm7oFBS1AKweRPQqhuSQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by MWHPR03MB998632.namprd03.prod.outlook.com (2603:10b6:303:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:45:36 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:45:36 +0000
Date: Wed, 11 Nov 2026 16:45:33 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 07/20] ASoC: soc-component: add
 snd_soc_component_name_prefix()
Message-ID: <avSNl6KHl3x7sRie@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87y0b1mf7u.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y0b1mf7u.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPCP307CA0003.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::12)
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
X-MS-Office365-Filtering-Correlation-Id: c50f56b7-336f-44ee-23d7-08df400ad401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261009223027099003|10067099003|261021121427099003|261102123227099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/S6P1eXGp7chzhSqpAwkfLrrp7aduBjdEJIa2kS2zpxwGZyeSOm/+FMBPtF3kE5aV+0vNQ8vS6fwKSvQEXz2WoqXAsZDUOET4mRti/DbNs2KHNqcIyS81yrD+Kz38J9GLUWYtyccS4+lbrCyKn5qQDEuh/w6Ii/75yKnikMP7U2i5f1exNm7yIahwW4R3F1+6PKdzZlFTzAkd86do1dhmMBaVHy5RY1CUbWOJvIAIvVyYnHi87xTKAJhnnZyGmnywf4kJFKsqd1wlcTT3v3x8j56TP1lNTidpEjUpHjtUrJQyLhgrrJqhMY02OCBy+GmRqOTlyDuB2/LgZkWciAioy6hsCYb8d0/32wxxO/rSMDvjM6+lHDJbNH1uo1svh/bL1JMvmofdQYsthpJz74lH8IvCpgi/rDu/BG1f/BMUKwPTek/BDxfFrsOtwvnalDnRt4T5une8DRQdyrqby6sZXQOUyEw0z7Uty4W0ps48yn8LP6Vj3Rgn5dMl5gDgVEdMUQaaDgZz+rz6q40tuTSo+QPl31g1j2xh/0NRjCPTW1UAawTjV/c3jIFYMjHR46aI8zu3JSw3QVNBNyZxo63mvUh7iS5V+mUoUHJrDgld0g7plrfx42oFpW9yf6TQD5VmY9P7ey+8OKJ3KbeG7Fkctv6XTcqKMRu6cKy7tifj3A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261009223027099003)(10067099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clVENWxMT2lMUjhTckkzZFpZcXdwWXFUd0JwcFdoa2xNaUp3K0I0ZDBmUWxN?=
 =?utf-8?B?bGNJR1VCV2dkbG13bTlFbHZaTnF6ZzMxNmZJNHhpOStrVForVXZYNFlQRkdk?=
 =?utf-8?B?UVJUVndyV0o1K21DTEdnQjRiRFFMZ1NUcFlRMDRZeVpSa28rdzFhRlpVOEln?=
 =?utf-8?B?cGhiamZUVmFrY2FiTmM2bGhtOVhoRGRuVUVoMndySlRQV1FwUmtxYUpyZ3BJ?=
 =?utf-8?B?TDJKUjRxdXgzSmVIbDJ4YWkxeXQyMlNqUDZKb29HN01TMzlWUEJxdGtPbXRk?=
 =?utf-8?B?aW8vRHRMdTkwYVE0YWl4YjNEbERZWFJtY0owTi9oU0NNbENMSU1TamJuNTIz?=
 =?utf-8?B?K3VXWGpzSzNjYzlmdkZxdHNMTHk3cGNvUUlvMGVqL3Y3bmoyVU1qVHVvamNN?=
 =?utf-8?B?NTIzNXk4SjVEenp3ODcxQmc1QWIrMmdsZ2MrdU05bUQ0blcxYjJaZlRyUEds?=
 =?utf-8?B?MjNiTWtpYm92a2RiZmV1cHNzTUJoaWt6QXBXYjBvT2tsNXg1Qk9jVnZsaUhU?=
 =?utf-8?B?Mjd0aFBsblpBUTFDSkVvR1FPb2xzZFIxOXhENzk0R1B1VDVVcld6eXJTcEVB?=
 =?utf-8?B?M2FILzNIaGJzQzZERjV4VEpFRVhTeklnbW1JSjFEYU1WWkJSWjZHUHF0WkNX?=
 =?utf-8?B?azhaNUNpRWVwZStNKzhZbmtvbVlvWVVWYk95M3l5TS9UUU01aHYzQTF6NUw3?=
 =?utf-8?B?UjRzRmloclY1blNuck4xQ3BLNThNRmFDcU1rWURhamlTd20vbjY5TTBGUndm?=
 =?utf-8?B?ZUlEb3JCenN2MURGSUM0WkJtczZhdkhMRm1aOExUd1BWK1R4TXJwbzYwVVVG?=
 =?utf-8?B?aFlsbjVYWnBMVTRzR3RYMy9XenJoLy93UlFmOTlQaDd3cjZuRmYzYUFWWktR?=
 =?utf-8?B?cEhGK01xVjZMenk3NXNJOE9RY1lESFlIRkJTbW1KazJNd0trYWV4RE9SVEFk?=
 =?utf-8?B?SngxMGR2RS81SjlWd0VQKytFUm5NWDh2R00vK01JUWVYZzU1dVNBaUZVaktR?=
 =?utf-8?B?b2wwZUFTUDA0S1IrMjlGR0prUEhoaTcwSmVSWml0VW1acVoxUTh0cHArOVI1?=
 =?utf-8?B?ZlVWcFFqemtUUTM2bmdiMGVrSTZHRXkvTlBPVlJQdFVIb01PTHBOYUQxemwx?=
 =?utf-8?B?U3g2eVFRNXRZdTBMM2t2MjhsYlhvWmpPR1RlcDZvbVp4NDFVMkt5WXlKcTFN?=
 =?utf-8?B?YWYxSFpjbWZPZVpoNHliN0N5elZEY3U5RjU4NUNvZGY5aW9qczlIVkFnYVUz?=
 =?utf-8?B?enRkZ0dnU1pRQmgxcm9oS0Myb2I4OUovbHZvM1ZMT3hkSTdRTDdjVGhXeWJX?=
 =?utf-8?B?WkVUaSs1VTFMajd1YlZxWC84QWlWbFB3QVdlK1JIOGtibTNma2FQdzRJdGto?=
 =?utf-8?B?L2lES2lMcndpNTFVZUtXcHhYeVdOYlliMGduOXQ1dGJSVyt2RDdybXh1U2M1?=
 =?utf-8?B?MmtobDJnaUNXRGh0MEowWGRYT0Fra1poNE5FcjRPYWRxWGhCdDlZU2hTa2tM?=
 =?utf-8?B?NFpSNCtlOFVGa204b2NqWHFrK2JpZ0pFdGIyRnVxRER5K1Q0UENnNm83TStX?=
 =?utf-8?B?ZHBkNStXVzdIcjA5VDdtU09OTjJmajM3NWNIRStkRDBzVHIrME1jY0ZNRng0?=
 =?utf-8?B?a3FlY21FRGhaNHlTOVNINHNpaWxJMTZvNzNrcnY1OEZXUzV4VFFycnFNUldH?=
 =?utf-8?B?aGpZbHlESEp0NGV2YVMxeWhCZGRGNUhyeXh1OEU2ZDFUNVB0L3h5dEtaQm9y?=
 =?utf-8?B?R21MZjgrQytCOC9Gb1BPbHBMMldmeldaR2FKMmlQck9QbVc4Rm1sckdnS3E4?=
 =?utf-8?B?a2RlSmNON3JZZ1dDcitkbEVRV1h2MWVmdkRLU1RZMXZjNWI1RWFNVDNsNkdo?=
 =?utf-8?B?T0ZxRDdUMThYZ0JtSzd5dWZ1WWhIQk9KRTBtd01mWW1GQkxoeGpucmU5TUUr?=
 =?utf-8?B?WjRkWmdYcFNSNEtjaVp1S0xyNFpvUlpuNmU1Nk95S2M1aSs5UW5ER3ZHNVZ1?=
 =?utf-8?B?cm1oR1g4OHhNNGJxNmQwUTNmakR3aHB5bTJNZVBCYUU1cTBSaWliS0FVWFNy?=
 =?utf-8?B?VmlvUHUvd3lhOG9iYk5ZNmM1RmJrRFlBZndWMUJMUlRocTdaY1o0RFBHc0FO?=
 =?utf-8?B?WDQwcWV0NlJJNUNlTU5HcGJSRWVhT29EMzQ2eG1Odll6ZHNlMUdiaU9lOEZy?=
 =?utf-8?B?aExtZExSTlZMaFUwL09XQ0pRT1hXR1ZiOFRNTytSblNNeTRLc2Y3aElmaGJm?=
 =?utf-8?B?bzBtNWJudDIyYVdUSzFSa0hqY2FORnhaeGxVREp0Z201MmFCMmtzNExQYkRM?=
 =?utf-8?B?d1pnK0NOZUJjemVobVdrTjB2Y3VNSnpReW5aRDB4dEZiQjlMSGFFdz09?=
X-Exchange-RoutingPolicyChecked:
	f9Qo5vvYNEK7brRJrMFNSVuBKvwLaEOmL3uF4eQvYb+v5m0ig3WeGXzInD+qdTUMWw6mAtylZKbsvoj9WeNV9dIyC8tTS/XQKnPO5+6L6a07cplNDCNJCOpQxymrNJ3OpzhFzlUtcHGunmqzQLEBiTS/HFeEisDdxX1TKjv2rAcxih47wc8Sac4/5LefAPXQqBezobs8Kg+I9+J48QRsPxFbw/syzw8K46/mS0qXlM9u8q+n6HsQxStA6Q7XoZJMdYn1ecg/JkhFpmZWaIBYt7THHh/RTJpDHURaQoIKAdbLxSRgrc8/k02gLa/PGHUKTGGGzIJ+fiDS3m62qIW4IA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c50f56b7-336f-44ee-23d7-08df400ad401
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:45:36.1654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tInZUBQQtUzmDPpGkw4LPX2oHKbkwYMKTa0cKyfeXz1YtI7jsDvQyGezDkfnhNgp1Q2rEo6rkXsgKtTksw9qgm/nrQGUAco+1qpMsjya8Mw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB998632
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX0HYPrLshddmn
 Q7hv05BGeOvuVd8WAxtvRzhyy9q+R+Jz2GwR+23HZTHqlFwWLwVrDV2qDFG4m0U+fKFiDgk3z7C
 oH3kioK621gCc9oKg+6qp/Iv1iWVxhNRGG2q2nVZZ8f/8ebOPWLsazOJMrUIoI9F39amCMc+viU
 vj0YLRG2goJpdZ6zfEzw/kQ4STAXtK//A/lZJbdccyijjeeg8AMiira+JXPRgNyFPputMSvt755
 Xu+3CvpRG4Swk8FxOjCTisVTRO9R70swbTI/Q8Rpx0Z3+30hzP6es0ntPiH9ElQH8/bregvwbml
 mXlo1pacQ6EMAjdQk7hYlCHvSJGy3HoHcJrcnT4f9Nr43Tq81lbLpLc+zd21PzFt4krHiz5AeDt
 AgfJLN9VzaDHR+s4zdqjuyeQAOLafG9S7rZs9DQ4V/xyNm4FczBcMyTscY6CrnqRJRunXPlfvEY
 w512U6Uy1J1r27omL4A==
X-Proofpoint-ORIG-GUID: ot6oMe2N3eP7C3dYkO2quLE90hskOdTa
X-Authority-Analysis: v=2.4 cv=ZNVCCn7b c=1 sm=1 tr=0 ts=6af48db8 cx=c_pps
 a=p4VQxza1WQsAsw6m3tlBZg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=_jAD5XSDOtq9-5Nde2OG:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=47Mcr-R40Et1bXFZyL0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: ot6oMe2N3eP7C3dYkO2quLE90hskOdTa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX8SI5wuTqjJxd
 cHL8H2Pnea0s7hzqhpxurl4nSnlcPKRjC8boHuKw5sd8B/TGaRzfZy3k7jdpNjoRL+zdpML/30f
 lzuCsAj4haz4AsAIEHQ2XDOtV9pE+P1ep4dKSUpDCKcrNlbehox/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:24:05AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> Add snd_soc_component_name_prefix() to soc-component.c
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h | 1 +
>  sound/soc/soc-component.c     | 6 ++++++
>  2 files changed, 7 insertions(+)
