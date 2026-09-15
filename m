Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA6D3890F8
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 13:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479898; cv=fail; b=LBMKQRGRVECs/PUQLcWwKcfRlsvL1FiCF/GQKCyc/UtsKXiM0AiQKR8VvFZFIZs/5ARrkCshO7eZmCP/RGy3pKFRfhflF95QU470GlJ68isUf+A1kgnF/vqPu7XLE+mL4E9NcX1pORlJCa0Ji4M+7ZzqnmuqEZW0aiktgI6DqsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479898; c=relaxed/simple;
	bh=hkaHUaQFH0Ml11GZj6VjryFQg03eyTe9bk6qtoYkAZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IGWLIjmO8GGNtBkudy4wlbw8cUmu5vwtfECgYpWgi9IFfP6VfNLACYvZa2oplCc/QyTmh8V1ytH+/ASnJsnzop5MPYv9eYz2hrZp/ImQ51+9fDI/EjdJX8hOgpHgLCuw99pdN6c7cDKfTAqdAWWnLi6c07Vej86uc1ABuYXM448=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=R1/I31cB; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="R1/I31cB"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD24kx572453;
	Tue, 15 Sep 2026 09:44:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=hqqQG
	+e0KtXJcoong6qkTtmUlIDkXKnNf7iZttbsTdM=; b=R1/I31cBa0zWCzM9haTqP
	6ICzpDc/fbE0Rw0t5Hc+t2GXX3YrAuTurwkC9aw4zqQg3Vpo0SIAN+gMOvih1DVX
	18qTeZxGyamosc09QwCB5eqvGtlDCSi/ETmU/ctSziU9F5bq6Urz47TEv+aIMPvB
	YTSirWjPSNK21F2R75rzviAOoy5hyljJ0Su/GdubryL00WMwmhuiHA1kLLg/8C8l
	UOAvZZFq5+5w8QV9vj/d14hh/i1vLff0DPQL9zlxKxQMgbdLHh96Sv5zYDlrCsjh
	sLVNxvIQgZJIB6cfdun3zOkILV8c94s+wh7B5dnrO7X064lSkWdIMFqpAu+08qv9
	Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011010.outbound.protection.outlook.com [52.101.62.10])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gq452s5s3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 09:44:52 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLbG0CDA/F3LBO90XZy4XqhQXOHd8Z+/DLFlWgbSiLVOxACOedZBtky8rcXTsK/NBfModKSE5QUO6iwX/CE19KVpPrkYjn92QW2TtyhPVB7T8fNuPe/xTuIAribcypktfy2wNYuft+A/PQ3z0nTgBTvFfpdp+xXBTy7Lxv6zbkBxchnDoKdTo5Nw1O1smgVNLMYld+s5HsXLWy4HLJ+UtAPQAFtw1cx4JCicBfPi210GxADObV4mSvPmIDZpnHH77Hpt+hAlhq9RMW+q3G+4rb2ww4CihJv7of35arRltCci4E4pqo5FaejYT/+pMrTGGhzXSxfXn8yKvy/LYP8+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqqQG+e0KtXJcoong6qkTtmUlIDkXKnNf7iZttbsTdM=;
 b=WVksEKR/9mBDQi91tWof92myXy3E+zceQSnLenGTq4tw2KrZw7H9ln8zd33pmILsw6zxE1yIkd5CK1YbqKYY/Qd948oSw88rz/neDwQ4C7f6+MdwPfw2nLMxsqxk16bh2a3N9laXggFCWvjpRB2azFj9u+kp0tuFRwWhPotK2FV+rlIewGCsZOyDw/Xhs1Ai07Kw9RbcCUjQ1yOVT2Rnx8cbxy1GJBWJ3nBjwwwnvFt3N8ZqBMnZ0n6wVaUxWR9ElLJz6p+pK9P+ea4+yEaDumKjikVJMiH/fb7sx2Y3sjEFO0SAeAYIKhY6cvof5UZb72KmyDvCyncPwNSKOikSoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by SJ2PR03MB7166.namprd03.prod.outlook.com (2603:10b6:a03:4f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Tue, 15 Sep
 2026 13:44:48 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 13:44:47 +0000
Date: Tue, 15 Sep 2026 15:44:44 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 03/10] ASoC: soc-dai: add snd_soc_dai_to_driver()
Message-ID: <aqlLvqfMTWOmjs5R@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
 <87mrtkli9h.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mrtkli9h.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: AM9P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::26) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|SJ2PR03MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1249be-2072-4998-1b9e-08df132f81cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|4143699003|56012099006|11063799006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	YfJPcPomskbj1x8LZsrswf8GtpGDu/X8YgK+IkStApexERbrOeWoBJowa8vEq4G+oV01lx18W08RYfQ/ENdHnQ2jWCNDqfycBcot9VK0hzvY18WlYVgaEedqPBWWsTEQ5uwomjP7QyvvmBEGOFpeCxcxiw+cPefrhMTqVmgN3G+BP5R45YQUTtOWSDUnd9OGZf/wcCYwI+sj+scLHvWy17IkqpAmZN7c8qD80bu28eRhNkhfcZ0k+P246LRc+AxEZJHYDTW/P6jswwtfVlVV/7z6n0n6btIq1mrk2UqSdx/3Pbs1I5lqhOTgB4ZKWfqSYAWkoOg6WGs9v9jO77JKCuqKExvUZiLcuMwqn5c715oKfn73KgciNo8GckX4dD29ahf8zghQCPIC1iObZL/83EVRONbMpTSBvIGZsdvcboxE9JYHEX1pP3x+M95GC3mUro2Vkz2tWhZa+6KleIw0PRBx94ktyNDaIX88jxi1Ul+t9EDLCDokqJiVqgIW4oUsyIOu7dqY8ulTW7Pz7J68aJC3Z4MqSKODOglL7vOEyWfwJ52ZFTMKaXW2HjMiSIA6/H/m+Ofy+3RKWEmNo7HniV+TbSM1unsbtMSqm4dQ8V/uNaxYUHMz+LvKdjsTfwRQ+r0vO0zp2Zz1EbTICmAqk44sBJ6KgYI5cWqFXowZcuM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(4143699003)(56012099006)(11063799006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3gzZmV1VkpTTVV5NFhtaEFEVW1BTWhvcGZnUXNIZkxFMU5JWkVVckw3MmJ2?=
 =?utf-8?B?NGNWU0cvYnZjLzJlZm9GdEdpckRoUmVqNVBRTVFQNDJtTTFXYzFNMkFNeWJV?=
 =?utf-8?B?dkJJOEJmNGlvVzl0cnZHYzZsV1lLVW85Ylp4Z0RBbDFIalNLZndQNGxLNlpa?=
 =?utf-8?B?OU1zWVJWSGIwTjBKaEJxUXZHVS94YjNYYWJObUhraVhTTjR0SUtHTkNVMGUy?=
 =?utf-8?B?OUs2Z2Fzc212dHk2U1RSZkNNRitOQWlVR2o2elBZTUowV3lyWmhuQVdrcmNI?=
 =?utf-8?B?NzRHMEIyei9QV1duRXJ0dlZBZ1ZsZU1FRS9MSHV3dkdkcHRhOHZHSytKL1Z2?=
 =?utf-8?B?Z1AwRmc0NERsbk90SGozM0tpdEIwaEJBTjc4RnlNaGRWc0tnM3pKZFd0Y1I4?=
 =?utf-8?B?UkkrREJ3aVNLQkNpZ0dpYXZYczZCUXdJTFFlNDlmNnkzZXZubWZCZDczVW9q?=
 =?utf-8?B?Z3gzNGd2T1lvMGFSbnRKVmdOUDVmZlJqOXUyWjVQWUNITFNDMXF6ZUFTUVBq?=
 =?utf-8?B?elJxcVJiV1AwUERQV01sVmtBOWxjdVF6ckJTN0Y4Q3g4Qm1uMTlWOVI4WHpm?=
 =?utf-8?B?UlRTcEhIWXZwZU16QUpyemJFWU8rbVMvQkRCbmZEQ3V4cXlidnpGN1lOSkxn?=
 =?utf-8?B?YnVjNnlUeGZKaDlRS29oallSdGdrMUZKeGZ2ZHJpeEYwMi9yam5lOUdHV1dB?=
 =?utf-8?B?S05iMHZrUnkyVE5ZMzBqMDBmaTdEd0Rqc1Q1VzZhUTVIOWtkdFpoejQxTDFG?=
 =?utf-8?B?a25aTkpuY2ZxL0VqSnRLakcyZmhDTFFTQ2lOVDlkRE5qME1VbkE0S2lKNUFF?=
 =?utf-8?B?ejZFK1h0dDlxbzFDa0l6WCs0bGZzbmlvQ2lEdFhVRkVLeE95OEk2Ums5L3dL?=
 =?utf-8?B?LzgwR3RUbUVjSHVDOXJDQkF3bUZER0l4U1hIOXdnMEpWRUQ2RDZaVEFYdFRr?=
 =?utf-8?B?RlByRUQ5OU1rRkVPUEYrOUt2MEU5VGNob25RUHdTcG5wUmJSS29KRDFTZFdK?=
 =?utf-8?B?eDhpenlkQmt0eGtCdXJRMUV6RWRPbjhIRmRhRmtpNjhWR1Y4V2RFTmJKSjh4?=
 =?utf-8?B?SFN0TEdzeTVmVXlkUkJpc3Q1cUJiVzI1OWZSR04xOWg1cEttcmdTZDJCWFVZ?=
 =?utf-8?B?K3IyWTRtZHlzNzQ5cHBCNjZSVG5kMlVNeU1LZzBZK2NTTFZyZzlrajl3SnFs?=
 =?utf-8?B?VFBDR0NYV200dmE1QnVJUUlFTEFLeU9mVWwvaks5OWkrN0RJVEVlQVVmMzFH?=
 =?utf-8?B?UlRTZmJxemI4QWQzN2hKNVhoUHRzVENvYzNsYlFVaC81aXI1c1NESjcxM0Ni?=
 =?utf-8?B?UGh1TFJyVDFrc0I3YUUrTC9qczB1SDdUT3VhVFlPTDh0MURibEkwcThVN3Jr?=
 =?utf-8?B?dUdSYUNnYnhPRmtXTXVwYlM0VHhHT0o5SmVkWmw3WUpoZlRYelNDMDdTTjhq?=
 =?utf-8?B?eVpHUGtpNm15ZlBnbUhpUGJnTStpTlZObVFrY3BGdTZab0M4YmJ2WjlWWlBG?=
 =?utf-8?B?TEozYXBocGhiQmVOa01jZXlhRW1DSTBjaFhXUDNTRjFrdzlKdzgvM3BVUzZU?=
 =?utf-8?B?cUZ1cVlPR2YyUTBwcWQ2bHpmcjN5R3lCakNzNFZtbVhYM3pld2ZGZW4vcytZ?=
 =?utf-8?B?SGRiTUh6aDc0OUhwTGg4c3FCOEFaNG5ic29ON3JuT25MMVVhcjRuV0orSk5N?=
 =?utf-8?B?akRvTVdGZk1RMUQwRHIyWDQzdzNjOGZxTHRTMS9ySSszMkhOMnc0UXVRUkM2?=
 =?utf-8?B?c2xFL0FCMVpNSnFCUjZhc2I2REVIeklYL285ZXlOOFBEdzlHRVFYNUZMUTdm?=
 =?utf-8?B?RHN6OEVFU0ViWW4rZHp2NGZram1XbkxEaWhYU0NnTS9IS2ozYUdGN2RyN1c5?=
 =?utf-8?B?c0drNll4QzRPV0lMb0NFRU9zdGt1d3dNTnU1eEJRcWNVOXZUcEEzVWxlVC9n?=
 =?utf-8?B?RGdGaXZnS3hNUHBIOCt2eVIrV0FLY1dNMnRMNnQwQzEwQy9sdjVRRzdEbVZo?=
 =?utf-8?B?UGphTkhlaDhrbUdpT3RPNUNGVTJ5L2VWbjJZa2tXSTNYK3AvTFdSeDJ2NFNq?=
 =?utf-8?B?aXVHcStCamZuSjFhOC9UdVhjb2lxZU04d2txaXF0ZWlZZGdsb1huZTFQS0ZS?=
 =?utf-8?B?alJ0cit2Z1p0TGVjNGRjTngzWmVWV1FHa2Vxd1V5K2JVY0taRXFpOEZ1enpt?=
 =?utf-8?B?YU93RzNlNDc2N2NDa256QWNXUWtBZTJFVVR5TVdYSTlRWUVGdk9LL2NMQVFD?=
 =?utf-8?B?eStlY1dBNC9QdW9wNm9jZzIybWF2SmJGQmJQaFMxb3gxTTBuck5UZWdaOEJx?=
 =?utf-8?B?OWE3N2lsOHJGZnExaTZ4a2g3VWRDOFBjaHJYRVc1Vmh0MTdKUVA0dz09?=
X-Exchange-RoutingPolicyChecked:
	kwfJ86UcDu9VWbTgFQ7FaZK6i1aZBkbT3YGZdIBsRqjnXNpHQyjfxe0L409pDmtYNhkYpYFoiIO5fASl6fQkMDlZjxsuVyAwZ4amB3/fmEsNetX58rzByWbT56LSLPOx187T6S9dXvIAdBYDMW1FDMmkgdcxFpOL/I2pzVZHE82zx1hMjrLVUBobG77AdUrXst1rrCxNYDH0X4IQlQLGiR1Rg++3UJAOJsGZLmG59KTwcQCtm4Ue3doMddHFAg1lE5/3Ohrhp8/jeqfulKMBkTillRZx+3tpNZe9T2n9cgICL+3oiiO1pwJ6ErFzpXjpZDILAWLAPpGz4ToHepsdvw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1249be-2072-4998-1b9e-08df132f81cf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 13:44:47.4454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqDkliIDFrMQWADkslbN5/G0cNwaCdfUYlM9zEiT9wZZLRn1sGnUu8U4nusYoXmQUqb/uJuP1fCvT/wx+kgmIz/xNLcApFmn7Ux2pFBrS80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7166
X-Proofpoint-GUID: ywvwvDfOYePsbKSuouOWuwqAXhsGV8_e
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5OSBTYWx0ZWRfXxFcXlWsagbRf
 yrQ/Fb/qU/tauAId0PL89UgHE7gcAxW682ir2bkwbrdK6j/3LGr1H2YfpeAfhOyI5UIYxCjyKmJ
 5y/MMKIXkBX0F3bQGJ/nX5IDtYKHGv49pNJ+P79Lwcl9DW/RCvX7
X-Proofpoint-ORIG-GUID: ywvwvDfOYePsbKSuouOWuwqAXhsGV8_e
X-Authority-Analysis: v=2.4 cv=ZrB4uN7G c=1 sm=1 tr=0 ts=6aa94bd4 cx=c_pps
 a=1oswHZhTlIntAJ9aeONiTQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=WqTBSSSdvf6OmJ_7tFEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5OSBTYWx0ZWRfX2zkmzu6POZUZ
 YibxlS4nrGRaK0dHNXGMaKxHSgSaK7Qn0J+tU5iEvAxc4bgKbFUmDaPPqpSIU1unLd30l47mrLI
 B0pO5O0OiHmpwU5xvs06X1PCAGRHxXpR1+aYZEVGz+IDjCivJBWKS92qnEh3YeBHKJ49Y2jNxa1
 gbjRRjpLGm0yYjuCvj+Ivxp40evdXN3+0iU+EkxV/+mbvHabc3meLSWUEd9pv6R9yJYyWMTaRZO
 HaZ4kLaw40pP6syyxjgYUPeJuGMVg8rSg2Z5o6Wd/GkSynSjEf+S2S7xu87rzlSeG0FK3HUb8up
 Ux1r5KT4Ixe6J07xUePQbU8lue8J/latDbStqHOLtRo22spd94KQYjfDolrCQLl0kTc9+FpOl3n
 iV765ZnLibirCRziO0J0rFbQ5nNr9mEPJbG4Etu1gWQ9syevvj2XCso+vy/ky6zj+OG2upatxuJ
 t0O/TBM3kvfPveE09Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150199

On Mon, Sep 14, 2026 at 01:43:38AM +0000, Kuninori Morimoto wrote:
> DAI parameter will be capsuled soon, will be not enable to access from
> each drivers. add snd_soc_dai_to_driver() to get driver from DAI.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

