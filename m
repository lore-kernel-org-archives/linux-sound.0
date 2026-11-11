Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412050;
	b=DswDbZ8xMLCVqhsKalhiJVTbQDsRy5bxdE1d6O22VEXfE8YlLX9+UcrA63Ilj3BpGKJu
	 iE6+SXwFm7EIJkUtJNHHX3D6AC/j8orjSfnbU47in2E3qoRUOSm8WehHO6vCQr6DCCR9e
	 5+e4D5BC+Z57+uinI2HdkYAaKCL/58qCvRz//mEgVSqyAmGllvIVVkY92lXAVLTE18W96
	 j1FNd8LduoSwBMuJDEfZFR3Kok6ZGkSNndPII/N1xZZqfqFrGaA3ZXPLMyqDray3Vy8pG
	 hy1bVE+PnPXm+Hc04hywJN2Bx4eC069oKHnzPf8aX8hBPv5xOFWS+RlLywGvU6efTLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412050;
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
	bh=OZaa0/4wPaoCAS8H4LH2EWmjVmMKVVIuNSgMPyxM3hk=;
	b=kgTkM1PjViNtnJxf/xvKAI8+VrXM0o81Wy/jsxlMG7GoRsWJMIYLzcHn1kGXYWI2zkf3
	 vm05rI4z1BOQ0VNTX16XV2c7YvOLQtiUqa3WP0QJvq2uRgSSRiodrPKRIMoH+3RJa5G5p
	 tkuess9ldlXkS7qgpvzwUx5/bkDueHJoMkWFZ3Wk3TU3W5OCZeQUUm0C6pQ3OIeCO+3Ku
	 BsDk+e3IG0rpLeo1bYG6p1plD3d0QEAVbWuT4fYbv9PWDMZqSMZUpKs8wKNjxROJ6D3AO
	 gXjA/IaPOoar+709WvBNtPHLzxPaHxOcrURnl8TM+25+X0JmknRgXGfdKAusyXjtKMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=EZ5ocpJa;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=oOW7L7Or;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DE7606A334
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68DE7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=EZ5ocpJa;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=oOW7L7Or
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1jfX409524;
	Wed, 11 Nov 2026 10:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=OZaa0/4wPaoCAS8H4LH2EWmjVmMKVVIuNSgMPyxM3hk=; b=EZ5ocpJ
	auWLgk6jb730bheR+k/ksxk+G0oDYdgSympvzaLo7UQ2D5FTE/Qnc6bGGq8cF57P
	7VKXep029jLQJM6oSsSVO1LRdEEop7gRKKYUIJauREGfuLrsFCvGWwVXAxW3kTYh
	tI7iYm3hELVyWZ7uFiRtbRPokXZanIwS9I0zJmWrrl+o1yY6U5dBzEOghl7SgDuf
	xFsS++LzywrL1L/nDLeTIVpDlwuOhskP8mE1Yre1/56pL6TenDEEu5V5cvbDNOpP
	7BO8Qo/EyK4i/ccs8M6fSZw9cL+zd3VQCQc6HeNonw9hiTry2lHxk0W4GbScDTvQ
	IT2zDyCFzRViVjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=OZaa0
	/4wPaoCAS8H4LH2EWmjVmMKVVIuNSgMPyxM3hk=; b=oOW7L7Or+js2sUpHd//Rc
	whipUGQ5K+wzLLGF5BuOs+ADiQ0JLiktgT+ypU706VEekTroTvyjrMVNBTy5LIyS
	s3hdSTAIu/iDGIO+12kiEEo6Qu1GRhE4zJWLPagKvVRpwQK3t6nOzzMVDt7M2XZO
	/OKMi36Jjq2iwL6+dHTVAklusImMsls0XHxmWleaAY5HAQayRT49u2uRluyOAD/6
	ZSP3oaCvfVjudCPE5WP0CLgrz0IJREnGftGXahN9nntqUTediHHKtvJct5vrPPWW
	RpHuuP8cSqyoELaQKJRrSnyVYei0GDzNN8R17pRj7/nf+z9mB5IEjB70U8lV+6GZ
	A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvqu917e4-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:47:24 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I62zV0+uiBGINoNekrT9Y6AMV+r/XKF0VN5KWFsubna4apj9CR3kAprypCFsnj8y1s/pYisCA2eOunOUwKRwSJhUCN/d0jIV+uJFySA5Rg6GZqu6V2+naCxGGUzxWaT+Vj4GgkgxP5MYV3TGejZ+uEfETIPWXd2kTgdpsc+iwWEV/9CgMF8ZuKKn3sNnzXgfVDFMDdJDAlhTvZjWuP8ZKIQTA1dFoIks4gzDfyof/1mthyQeBjR+m0euSI8jID/nkEnJq2ksofTotwK/tElor1+0THdCw87DYw9gkI02FVCTGz2S2OVKNYeiGNpBbEMg/aSmZqdYgNf1ORqbwPc+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZaa0/4wPaoCAS8H4LH2EWmjVmMKVVIuNSgMPyxM3hk=;
 b=THrVuWpoHgkSZAi5a+HNYuympjM2BTH8obBQuw3F790N4TFv7qZ/jEYBE2SdK3zSeC6XkOxi9sBx5QAOB+I7TmPiaHqtB0LgXEgI+DOzYHXMX02o6qH6aR+8CKxgtOVkyA14SlYKNrS7rC8144tLa1tRq3Kp6N8pshQwLyEuklcWldtgdHevfCNZQSyfLtkxNT7+1k9sA124HWWv4J+KbrWX1liqMSypVaru6iy9kOzPABTUM1kQIHITxU18HviXhtTb46pf9StY9tGR+La7gTXFNPO5oAOy5COBX8wJCvXsgn0kI/rPHCADkqWkNPGxaD82Huvi8V1gkRKPWK/YuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by MWHPR03MB998632.namprd03.prod.outlook.com (2603:10b6:303:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:46:43 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:46:42 +0000
Date: Wed, 11 Nov 2026 16:46:40 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 12/20] ASoC: soc-component: add
 snd_soc_component_to_regmap()
Message-ID: <avSN2Zn0d76omWXH@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87qzgtmf70.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87qzgtmf70.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPCP307CA0011.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::6)
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
X-MS-Office365-Filtering-Correlation-Id: 62e422c7-6ec2-4602-f474-08df400afbce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261009223027099003|10067099003|261021121427099003|261102123227099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QnD2TtHWDCyMQv+IcVxWnpzGU78fw+CfFdeN7GCvNlVTL6ioDvmn1gT4GKoYljglEYI4YskB08tg/3wZ5i8kb12J00Z+5VhCSVmkMleJI6ItVL13B4/I5Nu58aHmrfmOd3g+U+UNJNf6uQYZ+zYucuRCW42rjZzfUjmbil+w4P+SYasv5hGiOPQ3HMTxULax9ZPLSclqnG/dfGSYjk+wmstBDMEWfgdllkWjInNpp4+7Y3YUFq1NVEU1r40EHeM9XDh3SKArEqTViWmLC3eLA0LVubauoObbD75R+xjHvNtlvJTYfhhBzQlP1QM8Bq+ALgb1ppmu9YgiJVD8S7bI/or81nPLTi3VgMbuc6yOr8H6iSMI9w3QmunSrlga2Quwdu7Bexm0p9WTZT3hniuCm86ApsPD4tvO2fm31CqXdHFU91RGy35gNF4r2/bDW2XacPIkKUrF/ryALzVHaDzjIdYY8fDTtqvk7ypnBJFu5xjVXgXpqo7wdLWeAeJ3DiD0/LtEkkPnby5Um/FHqufn7+8BWA9a4OJZ5gkhbdr1iBOJxg0JMqZAVoHZ+MhVxwU/um6gCOlBhATc0c4UFIPJ+O/KnXbX7jdp7hTcJ/733Dq6dCmk+qBf8eu2pZdvmKkgecBp21+WwCZhX+g1kdfFy8P8j12HROs/y3ylwdpTXYk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261009223027099003)(10067099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlpXcUxTVS9NV3YrNklrQXl6WEgzc21PWWE5VnlabFhSTnlUWlp0TVcxelE3?=
 =?utf-8?B?bXA4VDlBVzNQQ0JVR2pLRldDbmJzWG53dkdMUXh6RWVnUkZGQkUvbnhtOGxC?=
 =?utf-8?B?ODR5QkhRTm9XY0c4b3ZsZE9KRWxOZVV5alhiZVhhcXBGM3NwVXpZNHNaWHFZ?=
 =?utf-8?B?RnRNTEx2cjVwTjRIWnQyb1BLaG9SUGw5bGxOQm1DK3ZZQ1FHQWhXZW9EaDJj?=
 =?utf-8?B?UUV5UENFM0JPSkgwaHl6Z25XdzRrSUtncTFad1VUS1h2VTVBRlpGTFMvY25t?=
 =?utf-8?B?OUl5K0ZXNFpuWjIxc1NUcUVESXRCUzhnWFRITEpvUXBwb3NXR1N1T3VCby8w?=
 =?utf-8?B?K2dueGkzcm14SzFjdHJON3RaYWpHLzhadlhwdWZqZW15VytIOEE4bWk5Wmd2?=
 =?utf-8?B?d01wYjhlWlJHOWlWV0xzN0FmQ09MM2M0eW1TVjVvVDBxL0FHUWo3d0tIRERG?=
 =?utf-8?B?VnpqVUY3aHlMZUt0T2ZCK3VmMGZQZGI3cUwxeWdBZStwUWh5UWppemk2VklL?=
 =?utf-8?B?endXMEVDejRvZjJvOVU2Mi92bVRUMmxvTGpCK3RXNUg4akptSThtN2Q3d1Uw?=
 =?utf-8?B?amhTbUVjWHlyU1l0TzlXVzRscm5pR0dpZUdZUjFBRlhIekJJWEFVN2ppL1BI?=
 =?utf-8?B?eVhhSzFYaWtwTHNuejJWQzJFMS9Yd0VEbFYwZmdEM2x4M1I4NzJ3U0NKUUZn?=
 =?utf-8?B?Q1pMaVBHNWtreGwwWGRLaXF0dlk5WWxyTWt4TjJoVVp6YjF4NzJWWTVvOStS?=
 =?utf-8?B?aHNhQ1FDM3gvNGpIMlVzU0VCeWJNak9MdlhSQWFTOTVDRHlleUEyZGRzaWMz?=
 =?utf-8?B?djVwcjBTVDBZUWJtY2gva3JwcXVjQ25FQkdQU1VSSTFMR2Zwb2JqZlRJTi9F?=
 =?utf-8?B?cUltdDlOQlR6b3hkcW1WOElNbGo5eWJ1TmJDVkg3Z2RTRStqb2s3d2J1MW10?=
 =?utf-8?B?MkNMam9ZdExkd0htallwS2tmSnFzSno4eFAyZEZNUk0zQ0dxSk83Y3B0RnpE?=
 =?utf-8?B?eExWWitjekNoYlR6bTJXNEI5Uys4Z0lKcCtCZFJuQXdINitQWjJLN0ppK0Ex?=
 =?utf-8?B?WWtkalMxZVdyZFNtSjFYZEszMGZxcG44a0dZT1pEalExUktDa2NHZUtzZ3U5?=
 =?utf-8?B?OTk0MXF2Szhia0gxTThiSzl0K2Y3eDJhY09IWWZHVTFodFBwV09lcThIWTlD?=
 =?utf-8?B?RnhFSWFWY2M5YUh0SWZVRG90bXdpZzQ2YTlHZmY4Q201YlhXT1FvUVAyaDhp?=
 =?utf-8?B?VEtYViswU3dlNm1LNEJXWm5PSENOSnlSbDR1cHRrS2ZJekxKWHRtL284UEVL?=
 =?utf-8?B?UDZZelFXa1BqeW8vWHFQU0dxc3g0WDZuWUN0Zm44TklrRGhCWjFpU0YzUDlC?=
 =?utf-8?B?VTNEWmgrazc2cndaU0o4YmtPZ1FXMHlhRVZqaTdwZVd5dm5HRGxKL0JmTDV0?=
 =?utf-8?B?OHFQUWJTWVczVmFtZ0U1N1lKVkRlUWlNbllvdEE4eWRuUm1scXV2Mk11ampR?=
 =?utf-8?B?NHNlditPVTdhNG5hc2pvNTlrSDRDY2tzam14eGd2UitGVEdNNUJmWWMzNFFN?=
 =?utf-8?B?U2hVUTM2aEl5SU5hNWF4TWFnVGM3RFlJNTVsQ2VUcG9aNkdFZHk2RTBaZkda?=
 =?utf-8?B?MFFPTEE4VmMraWp0bnQ1UzAxaFZzR2VicU83aTFxTVprVXBVNmxCRktHWHVV?=
 =?utf-8?B?T2I5MFVjTUxZeFdCNjhyaFhCN09xTElLZ2g0YlkwTkZNSXZLNDBvbGluQWtP?=
 =?utf-8?B?YzNWZWhTb3hLQjU1RzRBNHBMcnlLWmNCcTZNODVORjFhWktwY1Z2LzFqQVo2?=
 =?utf-8?B?UE16YXQ2RDZPU2JYdENheWdFMDRGeGkvNlFBd3l6aHh6Rm43enI2ZUIzNGZv?=
 =?utf-8?B?TFp2ZkpCU3d0NDd6MjZ4ZWxWSEw1NXNycmMxWit6YXA0Znc5eVVuNWxQemg1?=
 =?utf-8?B?SUNxc2hqMlEzTnRMLy9yQi9MWXVVQnNDUVkrMzQyNUhYNjA1ZTFxS1NkeXZQ?=
 =?utf-8?B?L2pIeWl2aTlNWCtTdEsvUXNnU2J4RUFQdGppaHFoUWt0NktMczJQMENtb0t6?=
 =?utf-8?B?dWVmNGNYMElNUHNxdTJVV01Zc09vRVdyU1Z2WmlHdTRvMkltQVFxYnkyOXFV?=
 =?utf-8?B?UXRCOWNVdURKTmZaQVNsckNWUjBXd2krczRENzlENHFoa3pCbjQxN1lKamUx?=
 =?utf-8?B?SXBxdkVPVzlIamRxYVFOMnFXeGFHNWJVUi92MU9DNkF5Z002ZGpKaWVETmpU?=
 =?utf-8?B?U0pLWnI4ajNCbHBHUXVXLytOOXNSZm5EdUE2VjFlMHBsUk42UDVIVllXVXhM?=
 =?utf-8?B?STFZb1BFUElqTnBBZFpXWXM5U3J2T0syWU5PalZDTUp1cGRtTHZvZz09?=
X-Exchange-RoutingPolicyChecked:
	yVmAs+izY97h1FKp2HSaLLBv0YLlEPb+EyWZp4Fr5Ejz8VF11sziVj+lOw4RJw0QDsg5JRc3G/RG9qW/wp08UyR4M8phVzf9l+2aLHjSpSD+c3wwpSDDMdKeuGzqg6SYY+BpM3yLK/BHqObivx6w4ILOt2RKZfEQK8mUwG8zWHfxDvdV7TfVeU47SE0eT6s/oUyamaC9wBew68wL2BR1v24WLKdI1W6ZpfLZNhpZmv+aadkZ1O53c/EepbCtaiIyks/3O2fl4EBIT704jGqWrYkI0fFjArFr527NQDeWQ6QbD7aWk5cIyBIzA7pbRa+0MpyzMUwlw0SqDrz1Ox+Urw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e422c7-6ec2-4602-f474-08df400afbce
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:46:42.9309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+gN1xKDx9dpwvNWwFMggwvC+p2NAcPYUHDmzOZ1co1Ml/xisJmtsA2NBkl+Ofv7bKsYgFVPmndBAlgzikUZPeW/VB/+W5IjIZfhSjAOqhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB998632
X-Proofpoint-GUID: ouDSezMgml6ZnaH1kLyo4qrsP4dF_PXZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXxaLXMRrPYWIR
 ZPt0RNl+OepWtiMNDAOV8RQsTcfCAcC4Pt/6mMO0y7WFJ0qok4/Wb8HCVnw/YFo7Ve6Mq8mh1dB
 cIjt8aEA/CueYJdTTREt7KR1gA3eTLZOFFC06kFg4AVTOzgEsVjO
X-Proofpoint-ORIG-GUID: ouDSezMgml6ZnaH1kLyo4qrsP4dF_PXZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX2tiyy7Y9V7I8
 fZcgLJdXPxR4MovQhjGAEWw2m2cBfbBv0J3mn6yxtFBZfQNiSLQeY0OiCk8sRAGN2l+uwc3Ac9r
 BmTMiBcmzG3KAFd2JI0n3f8dPWnLZcC9XnmF4qFPsTX/CxxlhpqSLODRiJwGrsYy2+oJT9EjOOp
 ocMkFrx7cH2wDNY+SXV2oB6aeweXjruG1nA/kwG08xhs4RjqEuSBETpqSm5URJZ9c3GdJaLKiXZ
 f6kBbEByAU68hDzW85bFZFW4RCOk13YIxk81+v+aiXwhiKLPtfNl7eJ9/UzuC0LkInM0T5X9iN3
 dRykV+Z5qk9ePfTkz0yO2XVgaPoGuh7tGCdkrO6rO9fQFfae6G/qC5B2c2n0rb9ooq0eDkywtVM
 bTAY7NL+mg0LyHripeiX6Shix3I67SymxVSZGCSMRYgXaHL6XRqSkbgscVoTcy0zhIw+YRTC+qF
 bKUdzTqIhaYl4pFDfOA==
X-Authority-Analysis: v=2.4 cv=fcc4WEQF c=1 sm=1 tr=0 ts=6af48e0c cx=c_pps
 a=PWz2vMGk566g1z9MD32Dlw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=tjWEKVCT-AxKcshQlcIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:24:36AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> Add snd_soc_component_to_regmap() to soc-component.c
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h | 1 +
>  sound/soc/soc-component.c     | 6 ++++++
>  2 files changed, 7 insertions(+)
