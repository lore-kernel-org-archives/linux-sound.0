Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793181674;
	b=vZOTDtiEmZ0C3A3CVw7eDp/ElgHOY9GQl/TVmJyw1hF8pDAviTtFl0nZjVqyHxovRNvw
	 PysQ6o1s4m+iYrXqJ2QEFvBAztNcgGmMDAqHGsJbbIO51TYPPXTinv3g6nVVb0egXGeuc
	 Sb7v63TNlu3KpFS/eAoT/Yo/NmxBQBLxqTqr1V/ap5uYPlYCkUDARJDVIvRqQnZYfGUMd
	 aHv5VzBGw99dG7D+UjbOtRolMYiKGBeeKw1LZ4WuvlQLRHO8FcE9QGuyQCGPNIPPjIOCs
	 oSOX99sDX5mZBibnnh6Qt/vScT2OQN/T+5nbQ72PKD59UoTvMrIv90kH8nJnvbGfnEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181674;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fNt3b3+QjZy5GLVmCPF2ZpJnd1fDJiMYaHQtOPKap0U=;
	b=pp1ux7KlMLt0/MNA04HaR3vmxbtHiIwsHmcGhsFyiii196p2+vLEwoamjw7WN0dyGCkl
	 2Zo7yKrwh1koJoYaS04nJ5uEJhogEpN37WGjOHdRusJkGdeqeDM0cwNzGV9snFxNR4QQd
	 xhblnFuNSXJJZWbZmV6xTGCRQZ52Ru0CJYIM6vM9OQsW59dK+WpaBpnP8hejUUu5QsXf/
	 aU0kC63oLzp4sRBW199oJjvRkVbXmUF83hyChxkgxyGSHBK8o/pmLnanw4JMyuEq/iq6A
	 IowAqL+D2wMipPmo1oHSrGaJ4TTeGlRUhr6A/VnC0AK6/1uy7VE5shkA/YK7eLfaliA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=imOZZKZK;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Sx38fnJV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D2B606A321
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D2B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=imOZZKZK;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Sx38fnJV
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8GuLG2204059;
	Wed, 28 Oct 2026 06:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=fNt3b3+QjZy5GLVmCPF2ZpJnd1fDJiMYaHQtOPKap0U=; b=imOZZKZ
	K5gNsvuYsk0LbM7XpObob2CZ1XMjvINcnapITcQmUPyYoQNeUMKa9cRoqs/HbOkU
	mNG1xrgfoEYfEqdc+ci98TRs9fzHfzZz7LckGRe9zytmPu15viVOJbagJk0GJQvp
	DmiwIoiI2etJ0uMRol3CGOO6IWDFFCKDO0RKo5tMu4t5K1SWrR5mzAzh7PHoMekU
	i/hoLJAExUvXLJ27Xja9fI6odEJoyLnVc+fGvXUCi11RN+ogfBVQphcnGOgLSeD4
	OMFpA1e2AX49ccMNc5Wo1ykYtWSqvQ/f9mKOuDZ0DburU/QTTHD3PzgqSGtxyRox
	WTAD0Mo9PvPDoTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=fNt3b
	3+QjZy5GLVmCPF2ZpJnd1fDJiMYaHQtOPKap0U=; b=Sx38fnJVXyEIdLuF3PZDO
	2bAdJW/fMF392rKdUf0utPgOkPAoBW6qUt4sZ3d1yJBwinWuK0auRALRdcSv4fF3
	1VyaKYfJqNRdm1QMSA/NBJ7H74Y/VkI9Vm5YXr82VLmcKe6ytqWJGYMmQnp9O2Gf
	6uLabZdVkXGsxEFk7W0joS4zhD4cjSPLQCAkvd88GPkysbVIPVdrX8ZAyP1M0fPu
	s0GMeiGS9Yf/1PbckZ4xdI2zM+d81SDm6kxGCUBEssXV5i1oRrtNEvwa5MADVuQ1
	KSpvQxu/WZByjIQ648cPG1KDpPLQcf9jdPhAX1GY3ePd2QweDmjEQhAv3F2iWN9e
	w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010062.outbound.protection.outlook.com [52.101.61.62])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hjwwyddmx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 06:01:06 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8grupmuU3vb7ZBAt6l1AIrMaX44wa5mF3jfRIlfbdkK27sN6AB4L3lXY7aAL9dchYv8tU1AiQCG/JFihIAb0lLJ9/sbI2eXeVDx8oC/A7eWsIJhpBvIujp2RwOTKbylNTYzuUXD9gbI5lHVXE/J3RjtOJa4GOY16axIyuEEKuB/mjKBml4T05HsTjuFuclKJYOGqGymSsmWw5qW2GyB6hKhS+/QHt2s0Mwb9KuZ8qeKEvzkj7d2IZ50PYknlPT9eeSBUA/J8Sxavb2EUtg630quCULXiyq/WziaV+4Wf4iYpe95w9Lr/OeMjTSLwRJTAy9pc9ipp1/vBP1TDnSnnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNt3b3+QjZy5GLVmCPF2ZpJnd1fDJiMYaHQtOPKap0U=;
 b=f/WGgnsUGTtyH8gqZVrIjduLx9nwegFHNLPaX+UD59YSaBVCvFBlKU0hb83SADHNHTKrYpqQatKmlPsXpuGptjxaepNDLd4Qkw7xbGn6GoBuyG89W+8oPOZlKb8hvFgsRFtzJHQjpFsfzIR8ItasaDxK2UOt1c2BrA/kkbdArDI0pEHk+yha1+PQwhFC/G0rFUN65pFcWL0j4MHdHLMY3oGMPu0xKxYUvUAS+SumkQ5N7jMDHSZltDTQtdoiolC65m+s3Lod/In1TK847NKPR2z+fEe3C6xUEkSoepFQkDpFJWT2hjKKSBXrG1JgY0kgs6p9vjrsLaDDK4EptWNlEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by MW4PR03MB6968.namprd03.prod.outlook.com (2603:10b6:303:1a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 10:00:57 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 10:00:56 +0000
Date: Wed, 28 Oct 2026 11:00:53 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/15] ASoC: soc-card: move snd_soc_card_xxx() to
 soc-card.c
Message-ID: <auHHl14_T_jludWG@analog.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: MM0P280CA0102.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::23) To BN9PR03MB5977.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|MW4PR03MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: d3c181a1-0b07-439d-109b-08df34da5c4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|6133799003|18002099003|261026121527099003|56012099006|11063799006|261022075727099003|10067099003|261009223027099003|261021121427099003|261022105027099003|261021123027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	oIGLvvPLkhMxTCczhKxEZuSB32f9B++DJ8lsUlm+MsdZLClcGN4FyNiUB5aPE9xeN9/y9Kbr/nGNlpaqbB9BRYMM142DGuE549OuG753Cvdsd8FM8WP3cqbvPH71wlDonIiHt+P9VVw2njCAACewDRULx0crEt2sEhUeKZDXnVCSdkTfB+8cSMtoXTq3JTpSJ89E8fZAiEr0onASl1Rv1freA4+NofXqF64Tey7J+O71MqWe5gncWNlbQrL2edMorMTDGIqrGFgO7MllR11kPs2yIs/oR+OTuG0xtdSREYp8B4Qd+hQH6hbx97UZ+h39n72eJj/9i9qfj5Nn/taud4nLLElmr+Oj5bgbzr0gyoAt/YIgtTb87TcG0OqlM/Te3KXJRoj6ll7Ht1WZb66c6JVcmKyYHT0NzN1qfsFARl5v4osX5aCDw++a2842TQPda2etuyivxLC/M3nPDs4bMKlWI1JCnsI0hoZ8DLtirHeerfqM0Sf23e8EpyNB1bzoSSBjNJ4cyY6wdTh8H07B9ir3stZSY1m3TB9BQqI7NoZGRcBp+bN4OQxMbk4SJHWn34tzfXSIXxdQ8ATexbrAXGY89H9STVfi6V5JVX2HB76AoxGgGWBDuIlTMCqbf/gUB36X3b9ASKKfI1C+r+0YOETb0x7TYuRCL7Q1kqw4PY4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(6133799003)(18002099003)(261026121527099003)(56012099006)(11063799006)(261022075727099003)(10067099003)(261009223027099003)(261021121427099003)(261022105027099003)(261021123027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHVkb0hEU095cFFCQnNNM2RlNFdyZUdaMWYvQTV2SUk1NExQdGVydWUyMUVB?=
 =?utf-8?B?V281YldvZFRyNm5XOXB2MVFkUng2VytLcmdwcjFjQWZZa3dMSm1vcjgxQi9I?=
 =?utf-8?B?M09rYm8rMElXQkEyT1F0ZzZkekJJK2ttSEttV3JnNVNXTElrc0NiM3phQ1JY?=
 =?utf-8?B?RU9PZlJxOW5ZZS82Y21zRVJjUjdIRW1uZkllbnNXVzZONW84MzkvOHh1VjZQ?=
 =?utf-8?B?M1lPSzVLcXQ1QnJBSG5EZG5ySjJGVnJ6T1llamt5MXFaMlpsZVFJRlRiYVI4?=
 =?utf-8?B?ZHpWcFNNdU9nNzJuY0h4Uk9WVEc1QkJjNWI0d2JHY3dJcUx6UjhPL0s3WDVk?=
 =?utf-8?B?YmQzNmZOY0JVVm9vVUhjeUVaMVdMdWxIVElrQVFLQnY2bzJBekhXeUhIeHFF?=
 =?utf-8?B?VTBpVTh4bjhYS1hNeVZsRTBGZmRKRE9KeUVwblZxOThMcm1lT3lhNGxkdzJi?=
 =?utf-8?B?S0lwZmxCMy9NZ3piUWF1WGduandLY3gxVjBaVE9CVWtTVmxjUExHdE1pYzVm?=
 =?utf-8?B?QytBUXRIK2NxVFdhQ3ZCc0lOWS9mVGp6UGFqNnZOWitDMHRWbVNwYU8wQzEy?=
 =?utf-8?B?aEEyYlU4UkY5dmZBTzA5MHFzVk9CaDVHaDZmTjhMWDhUNzJKemt5RjQyUXdu?=
 =?utf-8?B?aGpEZUV0ZDJUbjE5RmJCaFUwQmN5aTBKK1ZpWVFmQkc0YUhxMTA0bWViTkRK?=
 =?utf-8?B?M3kxUlpQb2tsVUUvR3hrK25zMWd3Wk00bmxId3FGYWdERUFkMW95aEhhV09k?=
 =?utf-8?B?MldiVWdvbEVmODZqOUMyd3krK0IrL29vTHg5d1dhMTlEdnBWSVFJUGRKOE40?=
 =?utf-8?B?REp5SmRYcHMrUzN4a2dMS3FycWdmMUJuVFdYRXRKVUxIUGNGVm1rQnYralBy?=
 =?utf-8?B?KzBBWUUvNzQwdG5hR3hWZ1JjSFhLek11L3V1S3B1ZjNnOVFnZmd5N2Q5b2Jw?=
 =?utf-8?B?Sm1YOWJ3VUlFQXlpaGFHdE9uWlJ1cXpsVTd4S3pPRVlKVkl1enFBZVQrb0dC?=
 =?utf-8?B?TmNyQTVWcXhpL1l2OXBkWlh6ZHVVYWl3MkoxUDU4aXFYRFVVcEt6eko5Um9Y?=
 =?utf-8?B?UWJjV2ttc0VlOGd3bFRJRkxkaTQzeUlvY2o1Uk82UTRMenNYenJ5QnVQWGdZ?=
 =?utf-8?B?QWJyei9ncFhXSktidjkyTHBqc3lKcTF5cERNN2IxcG8veEd0NDZSQXZqTFpt?=
 =?utf-8?B?Unp3MUxxUzRLL0NNZmRMY1ExMXYvL3NVQzN5NDVnQmV5c0thdFJqR3RiMzlh?=
 =?utf-8?B?aHg1aEljOFFaYXVIbHdwdGpoTHZhWGMwNUpCamxxamNlekt5Y2o0WmlFSWx0?=
 =?utf-8?B?UysycURGZjJONE1rY1hzTUJnY1dLeUpIOEdQemlOK01pVVhURXFJbnhCcWE4?=
 =?utf-8?B?N090eGVRbTdZcTd5WFhPdk1MYUV0R3pJbVhWR2JEZ09icnpWc1pZcXF3MEp0?=
 =?utf-8?B?N09IWno0ZWt5eHlJQncxSmhqRU9BbjVFcTRORmhhVk5NNHVJWFZjTnpyTk5I?=
 =?utf-8?B?ZVprK2hIWldSTm9KVW1qd0VZSU9FL3RLOXUvMHJ2aGlrL2JNTGxmTXh4aHI3?=
 =?utf-8?B?MU5KTVliK3BkZDZkdlcrTW81MkdWYWk5ZkIxaHAvRm9iNzVDQ3hRM1ZVWjM4?=
 =?utf-8?B?YVJzU1VIdXRueUJVR0NMNFlBMFZCWlQxbDZNQ2txVEJTZzl2dmVpa01EdUI3?=
 =?utf-8?B?U2t3c0tiVmo3d1J6WVdzS0FJV3A4MjBkVmdkdC9NR1dpTTlPTHRvWVVCSkkr?=
 =?utf-8?B?ZmtPRVV1bXZFMXFIK0s3Mm1lSTBOM3lYTXpJQ2xiaEhyTldZbE44ODhpanBy?=
 =?utf-8?B?ZENqVFJCK3pJRjVOS2RkUjYySjVqQ2orUXRsUHpuRktzNU11SlAzOGNxS0wy?=
 =?utf-8?B?N2M2andtNm8zMkNQMGpUWldUZDVZQ2VyQ1NlcFZrWDRoUTZpYS96ano1UW1F?=
 =?utf-8?B?cEg2RWw1VnZhd1VNQ2N5TFNFV3E3ODZhc1ZzNUJXbGtIeHdvTHQ1UVRRYUU2?=
 =?utf-8?B?NDlMM25NMndxbklEc1o1TEFzV25yUVg5SzJKQjFoV3BqY2NJait3R0hFRU41?=
 =?utf-8?B?bFAwY0FRc2YyY1pZN3VlaENlZ3FOaWFFa3lvMllDK21XTkVGVHBNR2FPVTVJ?=
 =?utf-8?B?bEs5dW5uWUszMFdzSWRobnpKVnZDd3Z4VGo2bUdKT1RLUWxjaVV3alRwTGhy?=
 =?utf-8?B?cEovemE0MnVBUjdLbEtCL2ZwNXhMVW5Pamx3ZDRTZ0w0V1dMMnZuMXNGcFZ2?=
 =?utf-8?B?UFlWWG9RR1lzcmJETjhjNlNDc3p5Wk52bUVYWHR0dGhwOC84SWV4Nis4Z3lu?=
 =?utf-8?B?QUhPNk1IeE9oTHBpbWoycFhIR3JVd01vU0FMZVUraFJoYlRGMW85UT09?=
X-Exchange-RoutingPolicyChecked:
	LYDQN7uVPx8dXujb2dsFY1sP58DTdB8k3xVlairQPZnQU7x02aOBc6bLutRqvCvYmJ7Ar5wgiASIMZMJmmYWzDbD96JqoCy6oUFJPijZ6KWJOmyTdjXv8qchX52g4+6/2Z4iHlvUxSIZ/r7lsXlYJ/4C9BdY+1vRkyR8o7lCEJNw41joWxM/V1QaxR+hWNKH0SKRH30e7805wLQDfotZEeeqa5Lc5lsSlq8f7jFkftThZTU1vKrQDbAxAVAXmeAiMX9eHG0hyyxLRLnaMcghmI/fWGydpG1OftsTZGUk0bj0qLcQAS6F1cokNVs7sKRlPx0yiBmUyPVoT+Wkzb8bzA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c181a1-0b07-439d-109b-08df34da5c4a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 10:00:56.6859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gl0bo/UsoGxP2NZlx2+vPuJ9Qq118WYk6Xg1YhideEbNiydssfkrz98vvuWHiSdHR1h9wXjQTfwVWu2gFLO0hHZMcDlahNlcJmYUyGhNBXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6968
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfXxjH4xS+EbHKY
 ISf+HtZ3CST4AFud7APw/VEPVcRZNpBwBj7bDPoSgRJ+flGYGU3/xHJbHtpKVbXiXbhXgZr5F7c
 zsOS/26CsAeZKOA5fjyRIXdCSjWeOKnOhoYqtrOsxZp3GYAEvYQ0LdefaybM8gB9/GPuJAAfDUT
 aN5zJXu2HtWYom3zL2tRx3DHI+ILUwdTuZqeu5KyCokce6hWh7YY0ocrJ64gF3iUk6cVuEnNvx3
 VGon6id7l/UzHRbn+eZf9v8955Xh0+dL3pvawvOHUIUamcq5kjzgnnW+T7dKWRzp++vJu+wefD4
 n/tiRzchUcvAoeXgET5+eHb0/rXUcSqyatS5l65ZSBk3RukBxdraNOHsRV7Pl6UVWkn58cH9P6J
 bgbeYZQDXc1URQA6Ml2rIrhNWsF7AJgOOwczO27pywnf0SOhyK9mEC8rAvFYPzTBZtC1jFfY5+c
 SjKiGcsmnk7mhXv23+g==
X-Authority-Analysis: v=2.4 cv=TfEDJhQh c=1 sm=1 tr=0 ts=6ae1c7e2 cx=c_pps
 a=rA8xTxhMCG4Q6PG1LLvkJA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=gAnH3GRIAAAA:8 a=JyaiTft7m69bWAU3ZqEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX+69MGcdNRlbR
 qp7kiGVoMFNqX791qiPnTl59TsFRqPKUyCQGV5TFI3VYJy/RMiUn6PU300UN/69Q9k2cROjZtYh
 NTVQAvmcrWkmB2EKJ7I65PcKHGTA35a8tpK59Wr6mVKKV7WiDDo4
X-Proofpoint-ORIG-GUID: VxCr69M_1tVN7HjWD7l4ebjFLG03a8ki
X-Proofpoint-GUID: VxCr69M_1tVN7HjWD7l4ebjFLG03a8ki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280039

On Wed, Oct 28, 2026 at 02:42:55AM +0000, Kuninori Morimoto wrote:
> Hi Mark
> 
> I'm now posting ASoC Capsuling patches.
> Current status, and this patch-set postion is below.
> This patch-set moves Card related functions to soc-card.c
> 
> x: done
> o: This patch-set
> 
> [x] move DAI functions
> [x] add new DAI functions
> [x] move Component functions
> [o] move Card functions

I left some minor comments you may want to address, but either way, for
the series:

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> [ ] add new Component functions
> [ ] rename DAI/Component list
> [ ] move Card functions v2
> [ ] add new Card functions
> [ ] adjust Test
> [ ] use new Card register
> [ ] use new functions on all drivers
> [ ] Capsule DAI/Component/Card
> 
> Kuninori Morimoto (15):
>   ASoC: soc-core: fixup snd_soc_dai_compress_new() return
>   ASoC: soc-card: move snd_soc_add_card_controls()
>   ASoC: soc-card: move snd_soc_card_debugfs_xxx()
>   ASoC: soc-card: move snd_soc_card_resume_init()
>   ASoC: soc-card: move snd_soc_card_fill_dummy_dai()
>   ASoC: soc-card: move snd_soc_card_init_pcm_runtime()
>   ASoC: soc-card: move snd_soc_card_link_dais_xxx()
>   ASoC: soc-card: move snd_soc_card_link_components_xxx()
>   ASoC: soc-card: move snd_soc_card_aux_[un]bind()
>   ASoC: soc-card: move snd_soc_card_aux_{remove/probe}()
>   ASoC: soc-card: move snd_soc_card_set_dmi_name()
>   ASoC: soc-card: move snd_soc_card_bind_call()
>   ASoC: soc-card: add snd_soc_card_rebind()
>   ASoC: soc-card: make unbind_card_list static
>   ASoC: soc-internal: remove temporary funciton defines
> 
>  include/sound/soc-card.h |   2 +
>  include/sound/soc.h      |   3 +-
>  sound/soc/soc-card.c     | 890 +++++++++++++++++++++++++++++++++++++-
>  sound/soc/soc-core.c     | 900 +--------------------------------------
>  sound/soc/soc-internal.h |  13 +
>  5 files changed, 919 insertions(+), 889 deletions(-)
> 
> -- 
> 2.53.0
> 
