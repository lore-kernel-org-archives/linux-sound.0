Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85523B47DD
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242515; cv=fail; b=F0xahQSzx1RHDH0hbE/NO4AWblXxA/RDN98khNhuTrK7j7zZB2M+LyfY4E1WGVP9VE/OAyRBWiIfHWVqlxhjkwjZXKEmY9aRDzt/Jx5j6awGXpxDeMPdhZG2siB3fDxTATaBsYCux1j0AUVvW/4yxuqd7V77vkmD6BOWHcH7pO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242515; c=relaxed/simple;
	bh=xUrYXI61T1HcNjkR5XxZnjdErXfZKnJzQh1LIdfMW7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X//H2ts7w6b8odqqrCHE6km9te/knyd0amhfkLVwEdyEYLjeF8NbNEyt9xDF4fEXJBq6hBl0AIG180HYPzt+iEmKESHvUx6yBxovWpiXoTZumURvo0Lx7kQjhlvHrxfk6VNwylO2B4tRtk8m/WTKbI87nBpJUzef7n8hpyrR16s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=OZ1JWDZx; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="OZ1JWDZx"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5c56Z996146;
	Thu, 24 Sep 2026 05:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=wS7hm
	8A+bQn+6xjqIxKKYtNt9p/5k3knthF0fOM7PF4=; b=OZ1JWDZxa4IDEsmNP2s0G
	9wyjUGAcKycAcN2XQnO7+SwjU1sCUYfrP9sThPqSHG1sJ8hf8WaGyOsngq+4Q68W
	Rup5h5iUOHSRtpTGGrrdmvUEVyXIOLUxGLLfk/XhB2ByQDpz13fRW0ShPPbtL3ti
	QLeys64HG3tG+vBTcbbIC7wsseIkyrpDQujnLxMta0IQ+XdSK4kzr65z5qeBQris
	4aKiKYWj39ujzCuJi6Lh+n3OiQoyzO2icq+cI/RZGHRNN7OdJb1sLn1jPVpDQoh+
	FQbdLHbob3CNTph4LN/MCL1L25zOKGUaILC6UHn5k+r2xO6OY5YFwTbZG1gem4F4
	g==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gv6erfhq0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 05:35:04 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4qPxMfo2lqhzRn1XmvvvKkikjrlZqQ7JLNrt+ellLmGvsoXuMv7HxfjBp+Gl3jUvxNRO/c1XqIJxEMo62E/erWVAP/ZNcUYbq7DSlhMuiNR7/rjF4qhlUfKkeDzwXHOIyoK6mcGohQ+/0irMYSMqTDLRBy8Jbhw7qdKyMzmm4h2dV11oedAzIdWAc2rukBYFQ8yt/5H187Rx3L4TTO0NKKpjX4LvM+fNbAmLGU4RhdnhvqHnj6++Misy7LSKG8/5xOXyay/PU9mnzXgnKzP9Rm14N4z+jRZVM6ev30W0CJfWpKK6vhTFRbA6pPZCP+ldHIM7OhtivJoQ4IN0uI7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wS7hm8A+bQn+6xjqIxKKYtNt9p/5k3knthF0fOM7PF4=;
 b=FYRlwOyCpkgAsEhyl1qC8LN2+0Jtqj8R4PLqsdGhRsJJERzfJaSbf+TJZdAQSTMfTURucZDv55iyiznw17lU2JugvpxvECwlPokpl8cfW1SxkDmh1VHgrw99cT8ujfZoxrQt6F6ABZnHA5bZUlJRUtxsnfIXINrQtG8Qqp/3P/gaO+ncXHd2V0cDC7YlFwZuwabpGpuKbuVliqwIsi6PTIzNBn5/xVEqh0uejPPC0u/omr+R6sxFJiTEFlRYNIzVEZQcyrO1x42aByoLulWlg9glRu01k860Du8fiUJD9rP0auFjxeNnmDE82sjxj5m3MCsWpYYB9lUAPcvT1yMA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by DS6PR03MB089049.namprd03.prod.outlook.com (2603:10b6:8:419::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 09:35:03 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 09:35:03 +0000
Date: Thu, 24 Sep 2026 11:35:00 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 6/9] ASoC: soc-dai: add snd_soc_dai_get_symmetric_xxx()
Message-ID: <arTuvBJAiKfUnrpE@analog.com>
References: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
 <87h5jnjpug.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h5jnjpug.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: AS4P191CA0003.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::18) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|DS6PR03MB089049:EE_
X-MS-Office365-Filtering-Correlation-Id: a1079b84-bb4a-4bdc-10c8-08df1a1f1c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bREQOD5QvRpqbJGOadnHwambJhPAviQzw9vrcZtJDbv3sQ4Tt9QeMpi488AOb/k60OmJhit8rhf6A/Cgg/YjWzs1g/3tFXnzOC9pBbaNTkbw690Pwcr/d9/iGT4bBrzCK4Cev7ZBmVyThah4u7qmL5tW5ZpHUa5sBHPIG+6p9jdN0x5bUC0jZof8RId3cXRUCsBMOwGQrq4iV2UBniY4pI9rAc80yesbKXFsw6Y6U4Jp1ZFLLWqZ5j3YgacWJQ4/KQxcJ3wBsK/dfNZPGfFtRb6ucGgftXq4isqyiseQzveMUub0auhiYb6LP+syD6+XYeF9wFUvSB2rrcaWxO1L1v/fQrT0ADMOiKjMbjxRZ1FOFnebtBsM3q0LZDdiNDF+Qn82slttx/lZwPGD+YLfKtjLrNR9NtdVQpQ7u/dTiLg+/HYksyrInynIxmTIKJGyI1fAyVhcE2c/5I8vMGZug02dL29Q4Ujm33joJJlCUawQCNkxn9NB0drpFuFfxGDAEFZGDd2qHXOOb0/fInXel8U+bHyRjF7nn9YmoN+D21Jb87tngLo8oTEm01iK5xPjLxrd/IAipxiZ79gAkUAnC2phSGRY/8h4WY3ZmwmMrx9CCYT2+6HTIg+fDC5YOKljyAPvIwE+79R7gjXElF/KWNTaV8OKMFnM/82ZNOmjDCE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3Zhd2pUclhHbzdhQXNvaEJaL1dQUVJMSFVzbEx5b0lZbDVRbU5FYjNIM2tQ?=
 =?utf-8?B?cTdSQThZaFZXcUVoMThOQzZoYmt0czQxYnFHTU5JamIySHBvZFZna2V3bWgw?=
 =?utf-8?B?VWduSW15d0VyZWJLRDFCSWltUHJwaWJ0d2tocGlxUUh6WjFRQzFBcy9WczlV?=
 =?utf-8?B?TDcvYTBsNzRDaFkybUEwZXRnSXV5LzQ5dS93ZmFjbFpRUUtLWjJhY0p3WFE1?=
 =?utf-8?B?eXVxemt4VGM5UnNrdk0rK3lXb3I3M3QxaHNIR0N3QWx1NkZ5aHNNamttdGxR?=
 =?utf-8?B?UjUvTDJmRlNGalB1ZE94K2FxMnhDWC96aWRoVzl3ZU1kdmdhNk1xYWhvZTNz?=
 =?utf-8?B?bGw4cjNKc1gyODd4RWZYb3p5MFMxSkNQNlJZVG8ra0ZBbURQV3VPaGJBSkNa?=
 =?utf-8?B?a0JDb3d4NWFockhCaEhLRDhyNHJUS3JMZ2hsK25hYXNvbjlndElPRDlOK1NJ?=
 =?utf-8?B?S2YxL09kWGF2V2E0TjJjTkNySkZLUTR4WG1IYjZKa21hb3gzRlRZK3hNZHpO?=
 =?utf-8?B?TWxNVXUxTW52bGN4UnYwQTJabzVhNGVQdnZyQzBuOWozVEhWT1k3cm81UllJ?=
 =?utf-8?B?L1ZsNDU3d3pFRk5HOFkvRHAvZ2FZTlBRQklCNmpLbmdYUTBEUVZEQStad1ZR?=
 =?utf-8?B?cDB4cWlyWUVORHlmK0Y1V3h4N3FtOGJXQnJ4UmdPQzZRQ0Q4enppWjlYbmpp?=
 =?utf-8?B?TGVjR0lDT0Q4bWdtYk5qQmMrZXB0SzVxb0VNOFJhUVZwMms0TXZyWG1tTUhR?=
 =?utf-8?B?dFNxTGJrcmpLRlBmUmg1MTgvYjU5MVB1QktiN3E3b2dNdXE5WVhxT0NpNzdh?=
 =?utf-8?B?RUhlRDhPNFhtQXRYaGlTMjJzVnByWkcxS3RQV0pnZXhIQUx3cFV4RWxYbmtW?=
 =?utf-8?B?YXVUcXBmVGFvZlZDbytjdGdCTURWdi9QM091azdVcWNrMFlWUXZsZnZVZklM?=
 =?utf-8?B?cENmZFc5N2xqZG9HOFY0MjNkWk93NTluTlo3di9kbUM1N040QWdTb0pQTTNi?=
 =?utf-8?B?RXF5dWY4K2dLc2xkbFVGd1F0VnBrekxDcjI3RXJTM1N3NmlTV0NHK1NuaG91?=
 =?utf-8?B?T3QvWEZmTHkwUGxiR00zN3J5aHljWHZ6dlJvM09JNkRZZFNUMW11alQ2elJr?=
 =?utf-8?B?RFIyTSsxb1JURWJMTzNnQ0NaZWdjUkpxSmpOTllQTDBRRHlUVVVkeXFkYUZS?=
 =?utf-8?B?NFVVb0ZEWk9lRlVyVCs4NFVmVkpmZ1JFOUFweUIzQkI3UnNnQVRXQStRdkND?=
 =?utf-8?B?b0IrTU1lK0lCWXBWamp2SDBmbGhaU3p4dmVhZWhhNGFRRmJkZWljYlcrMXNw?=
 =?utf-8?B?RjdOSnFWTDF1eE01QXBUOWw0N3l0aU9vTDQxWFRvYXRueEVXa0k2b3U5dWdo?=
 =?utf-8?B?YzRLSVoydVN4R2FJb0NXV3Y4eCttS1BFYnVQay93N2dQbTdJWXFFUGhSMkJm?=
 =?utf-8?B?MXhIS0xzZy9tREtmVDJNbWlMZStZQWpVdHIzZlN0Mll2MmNjeGo5d1c3UjNJ?=
 =?utf-8?B?NEY5UlFBKzVvNEV6SG1kRmdLRkswd0xJVTYzMUhNRU54WEJHZVdvMGU4Y2dM?=
 =?utf-8?B?SFFxZDI3SmtVRmVGdnkwWDdRNEVrRTFhUmtoYUQzTTZFSVdja0c3cXRZWGY5?=
 =?utf-8?B?OUE5eDcwOXJpbDNTRzl2RCtkbnlMK1BHVWhZWWNUR3l2YkZlSmRlajE0ZzR2?=
 =?utf-8?B?dEg0ZEdnZ3pOdUdybmxUK3BnZU50THhXOW1Jei9sb25MNG0weFBMZ2JDWkc0?=
 =?utf-8?B?YlZVK0poS0xHMVFXYXhES2VRdkFWS290bTJ0ekltdEkvdTRGSkVOUVZiSFJi?=
 =?utf-8?B?OG1UMmtuYUxtUVUvcFFoRXk3WnNYcTRDdlFGSC9JSDhyNndBWXVkS0pFVjZO?=
 =?utf-8?B?UnRiZkk0SmpLNWFzb2M2N1Fsa3k3dnlRVVczUE9EeVJ3c1ZRNi9NVGVuQUhC?=
 =?utf-8?B?WlEySVVMRXdJMEJwL1Z3YmdQOUl2RmEvNmNBTmw4eE1ZRno4ZlhNRFBkbzRJ?=
 =?utf-8?B?R2ErT2c2RDJvOURTS2x3Y052QUZhWWt4Zkx2ZG9LcGlPSUE4TlB2dEhXRVlk?=
 =?utf-8?B?Qk5sNTk4Zjc1VDR2S3VnWWFzVk1acUU2Vkc1MGh3QzVIVHo4a3Y1eXY3anZY?=
 =?utf-8?B?czJ0NW04Y0lwUzNCNzhweXpUM016dENQaEJSVGZrL0xEV1IyVXdETW9Qa25B?=
 =?utf-8?B?QmhOd25vYWRkaWMzajVDTnB3NURBUktEeEJCSzZXNUdYMnRNTTlGZUhyZm8x?=
 =?utf-8?B?cmVBZFM4aTFvVzJWQmZqZXA2Y09wZEw0RE1BWTN3aExWL2tWTS8wY1habXFm?=
 =?utf-8?B?emUwNUdHTkdidU00ZjN1NG1GN3dQeXVSbXVCSm9LNkcyMlRMZHNmdz09?=
X-Exchange-RoutingPolicyChecked:
	NYHUTvxttznS9Zmz4hlUMTQ7T1QGrmh3RTpYubXCLDaAZBatC2ARSmhLprhy9Tu3+KQc+XIcJfqcD/jCVx9tb8qhHP5iS46a5Z03Zg5cKUTEXcevZ8Li1y/tfvhMoR2JRU1ZoJOViqbXwIdkx9BxBH5TtNJLczAqj+hYOJtTsEhfnQh4XXTi4RxiK+uaGKVKfvRbEtknh4UFHBh4zxBCkVlBrQQI2iiN85PX69CQnAUla6r9t2sbdDMfiNOhNk/ieYnImLlhsl4dJgfZucgnkMuFk+OeUqA5e7D8USgCuoIF3yKVGOHoGgVDWWhyFoHpeHJRarwr89ioQuCzF4QCQw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1079b84-bb4a-4bdc-10c8-08df1a1f1c6d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 09:35:03.3919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dV1bzlmqIRAkyyfoIvf2MCh9xyBvvYrCgRcVSU/L3rWHVzXvgIxClZPBYlocle7IwFMnYh9dDofFYmFsAoOcaZbosggWmjaDemdLfR0BIyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB089049
X-Authority-Analysis: v=2.4 cv=dcoVTnXe c=1 sm=1 tr=0 ts=6ab4eec8 cx=c_pps
 a=Av3Y+FYNlx8hu8JbWhmVwg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=_jAD5XSDOtq9-5Nde2OG:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=j-XdB-5aet4ZIrn0tSIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: UDzzub9u161m9MUzbSdi2WzuA3nCtPDN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzOSBTYWx0ZWRfX4QuhrwuVLKE1
 mu4Xss7MDMRLAeLQGtJjDLwKCukpEhqfNQwhlh93ATB/10h7QWblmQPIFsvpeESA9nxDtGYXHi/
 i1mlKC7WM588pYsS4ENqCmQwQg3P+ponLB41qOscPwa5JMjXeJmz3nJ1h4s+Z4rrwU7ErOZxXs8
 k89JscIt5rrX6xtsy0tyzC/iVEPUHzkQ/P8Qm3OhpVwT7i7scuKqEahBVQlzz6Gtz3ENxcH3/ZF
 Vhy+f4YiMjjTaihJPhs+JdZ5nSep5FU599+KvdtxTXv4aoMqoSWPtba1BQ4e9xspLyuP/MsWWBQ
 YRovLTAqDnmX1v1QlMMnq9aezdIiELRP356Wwe/2wFzth4003MW1ukTO8VrsIasU/fzmNcuRkhT
 wj2t1Mzk1LXr7qkVxQ7Qpp08MLD30Ke5brJkw59E1dXUgLqPxpgVCkqtVZA1/iXgeqxUa572yvp
 pThRq9tVWYTe7H19SFQ==
X-Proofpoint-ORIG-GUID: UDzzub9u161m9MUzbSdi2WzuA3nCtPDN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzOSBTYWx0ZWRfXzuvXMlkTwQ3A
 a3Bu4ftruqJCene70orFmkc1fipk17tR0MEmoOt8vKeEgUVQXgZvEgGm+XK9YdMsRj25Hy5m1Pa
 jCrl6wY2gPsErct09LVUzCb6BGh+cGlcxBWZEKInSBj/58X20kVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240039

On Fri, Sep 18, 2026 at 01:44:07AM +0000, Kuninori Morimoto wrote:
> DAI parameter will be capsuled soon, will be not enable to access from
> each drivers. Add snd_soc_dai_get_symmetric_xxx() to get symmetric
> param from DAI.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
