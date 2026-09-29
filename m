Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0CB3AAF54
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 08:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670294; cv=fail; b=fm1u2xLmueh5KJkwQ79JAwqtYpOkjPFOX/Ir9W6T/mJV+4jc0obBI1BNSDKIgaMUc86Wyi3raoIzGpQIhpxez+xdPRczVMz7UZdALdI2OCYmOS97dmmHXBcPq8cTmEMcbl1FT5kBw3tlDIYWtLmQHwQyk35bMtex5T2fkcRys5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670294; c=relaxed/simple;
	bh=0Imc5OWGpaYZ8vs5XTuwtOMV0pJfYtq/XOx6+gQqlJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vs1xpDe4ZPaQM3dS3c03K6aZict5ule73iQXf2JSDVueia0z3+9FHkyUcoq7RlKMmRKKLJHON4OPXprkQK/6bR6XjIK0GkRAOaGJoukgAg2KtSVm3snZKsIC2RClg3vlWdrWknWBBu2XvFYiE8UPV9dX/Qw3UL64Rfu19vHj5pM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=gmmi0ISW; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="gmmi0ISW"
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Sw2c2631129;
	Tue, 29 Sep 2026 04:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=mrMdA9/TTDtjRb+59ML6CGX1lhxzs
	KapCPBRVMJ6qpg=; b=gmmi0ISWCfUbjmrZE0+xBRG7Dnu1nm3XDeC1TT97D6lSC
	pJXdsUA5eGzT/LiO9b+26ETcAaA6kYyMSGFv0VnTcY95AUdB8DOWoIcTIPyImcy4
	0QTUvaocINQltqZIp7QkdsBXVR6cVxKtgLAqT4+yA2zA+OVaOwDJQRzgNvdZtA54
	b8eSujH87njmn30a9vzHmJOj9vJSVuO7R/QYC0uJnEH2TJO2S/IzrQdJA/h0YDNw
	Gm4jjUTk4/muAukT/Ft8rwhUZ/RIKymA1BPz59momcHL82nW7U6a6Fn1cnMHORGF
	BnqFb2sn4CWTJA6XcjxvxtgROLmEw1HmTfj2ljBOA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gyp29nvtj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 04:24:46 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJINAqtDRkjpi9LC8IUHpfIdtBRxRwrKBO7VihE4Oidab0rkj0CQ3YqCTzMcB7NPrU8F8NuD0mo53A+UOJXBYEgJSiZoEksOReN55b3Vayzuq636p7OZllZilYy91Gl0HZ47tfSBRHKRC6tXle1Jd6xra4Xp2XGZ6oBkdIJgsDhrhZsIBPcFifVn2bMRcmbOb7LPCep/TT/ETVqFcwbEeE/xAagBMGF2XclGWKnNvpzChcwJT+TSS7tELgAPWBa2AJrUuBlQcQIB0OFO6VaasHR5MCVTZYFaQEW9E4d5z050YSEWelrDnb7vCKQhDKbgugBjsIHHEIYjsgz+PeF74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrMdA9/TTDtjRb+59ML6CGX1lhxzsKapCPBRVMJ6qpg=;
 b=aXQ87N7dJnHSfmEiZ+fHt/p2L3LLjryl4lCjoza5E7lDchxBRX7jvP/xyQ1uc0euiutu1nYDSodD1hYLWDfYkQg6+zxEDphdzD+0E//g5EwhH3JRlQF+IXx2oxdrCZoOeEwBJwX5l7O8p0bAJRqJmqKNpkxmbNGRXQpoQMqKKfnxTg/4bIzd8ifrUcllQdjUvYI+8/z6LWSMx4/hjNAunj+f+UvTdk54jC+Lk+gwHQPQ4D8AhNoIoPWch/3nKKCWqgTDi4fbW0gXKOGyWnx5j/ob+RFqukrjXvG0p/5dvoPDaiiNOHMORv1FzJDfrPu87cjAzzM0MVEpKYgDgd+ISw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by DS2PR03MB8133.namprd03.prod.outlook.com (2603:10b6:8:27d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:24:44 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:24:43 +0000
Date: Tue, 29 Sep 2026 10:24:40 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 07/14] ASoC: soc-component: move
 soc_{probe/remove}_component() to soc-component.c
Message-ID: <art0TqnGvw7Ci21C@analog.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
 <87fqyseiat.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fqyseiat.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: AS4P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::7) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|DS2PR03MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e57aea-73f7-409d-1b43-08df1e031d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|4143699003|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VPYCXKJjAjFWz0rgYY4KjCuQ1JZJXm80aaHTuET/Bdr+QHVhm61/6wj64i7/nfrS0PiPiob7CGgTztEk1YXDZKXwJKHROxRYY+wpWeLebuaudKiclmbC0mZ3kjCg3S4JzWNpKaEQ2klIHbtX6fTrwUUmDqXHF7bF8axZKe6z0+zv0fsHF0EY7mFVNzl7B1jd8mAS/5QH4ZEstGY001wXknJnfqv3oYlSty2p0rhxHQsLQFxyRrHO4c5OuSo5fD4uypu1XlTlLappxgF/vT6P1Hwl9+0OXi+KADJIN8uPcnho34IEAlV0o8O7kHPx8GLNTXrcSFR4cGA+7w52+5MMScpb7geksCOgDAcAZ/7sZg1XjI5fnbR15Sp1zekyukHTGaaj5E/lZFIdW2+4UME3MHmD4sA5IgqPMA1Sd4E6F0JoRXFnTlJ8XsMJF1Dlj1Xic5naPfRY3jfNYe4m5gY4BWgZ+CfzchbBjRgy46e0kL8fmI8tMJB73aaqABDfJkP7TK/ud12cc/itAv4cG21s88NH6YfzJzW6XiAEy9ZrnYNMDPGKWk3lSeWkp1iVDkqriUb88mNrG+kwZCPPQ34l2m3Bvou5NBkgMqBo1d0Pu8CU8ZWUGqwtGgvO1fJitilmp1Scx/q8xRoJISAELLGFfsPuUJynw7Ibk81hQdT4I40=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bithbWNJVUc1TUZrWEtwa0UybFNsTEJUcE5tZGM1VFpIMHl0Z243WExmWTIr?=
 =?utf-8?B?UWdXSzdpbFNpck5MaU1WUFFIU1d2cVRVaGtiL1ZaVXBjbC9YazVQS0hvb0VC?=
 =?utf-8?B?RzJsRWQ3WUREaDYyM0NNQUV5bXhNaktyREh6VncyNHhOMUVsTU1BUzl0Ulcx?=
 =?utf-8?B?RVkrbXNSZTZuUEJUNWw1OVUxVHhGTml6d2pMcXpiZ05tUXU2c2cveFdFNjV1?=
 =?utf-8?B?QkJVczFKa20rclA4UDlyNzJMQ1NKd0JtNDFxa2JoYnVKTTVOWmRiR21qTmRt?=
 =?utf-8?B?dzB5Sy9MRjk4RGRXTjFIaXdlNDRPR0NlL1NkQ1dqYTFPYVFHZTJsZDcyZklm?=
 =?utf-8?B?alFsMGh2RE5VWmVKUndMUDZtQ2JKVDdyeFdyUlg0U1pSVTFhalF3VEJjTmNz?=
 =?utf-8?B?TjQ4QktNUTVrRGdwWUZzbHJDVEFlVXM1SWU1VkUwcXdZQWV0VmxlZS9TZ0FI?=
 =?utf-8?B?VlN4d25ONXRjMXUvS0VYNzVpaHFmTkE4MEpjNUZqeVJLWTFSSUxackxsMHh1?=
 =?utf-8?B?NzQvbGZxRCtucGF2bzd3TnRPUFhiZUJHMmc0bjB5Q3RuOWpEV1BmVTV2enU1?=
 =?utf-8?B?Zm4yM0d0cXJqYnZtUnNsOUFEdG8rMkIrN0M5STlWeE15R0dnckp6c2hVUDdI?=
 =?utf-8?B?OXFGbUt2TzJLVVJyNHo4SW9JWGxnVmJ1U2h4VFFVSUVoSFkzVE9GckhWNktV?=
 =?utf-8?B?enlvajMyeE03MzFVMU1ESTVWQ25MV2FwYjZKeUxvcVdDd2FSNk56U0hvT3VR?=
 =?utf-8?B?clZCSDVQMVB5OFZveC9jckhzUjV4Ty8vcUdxMFJHMDQzeDRURnNESFg5U3Rr?=
 =?utf-8?B?elllMjRENDRnU3NYbFdGUnpjZkJSbis2cUx3TUlYMlFQU1BwRGZPNTlQcStD?=
 =?utf-8?B?MUpBMERrWkFuSmFrakY3cU1kaTBlelpwT2FnekZMa2xEaUtDN2RPTU1EbXlQ?=
 =?utf-8?B?cjVVOHFzNldKcmYxWVZZRkE1T0pJNTV0Q00rV2IrT1F1d0NjVm1YWGNzYWwy?=
 =?utf-8?B?OTdqM3RIVjg2OW9sazJTVGdpMDZLUklHbEkzSi93enovTnp3RC9LaHZmcVpZ?=
 =?utf-8?B?cTBMVWE0OVBBUGkwS2JnZDdFQXUxeWM4Yno2THpjZjlDU2ZURzE1OGdiV2Ns?=
 =?utf-8?B?T2FGNXZrUHBpMEVmRXpzcXhLS2gySnlZQWVjL21xSkRVa05FenJHYVkwQzJo?=
 =?utf-8?B?UVMwMGNwYnV3cGVEeUFGdEFXU0o5SVlvV0lPRFBtTG1jNTRLTmZBZDlpMGVP?=
 =?utf-8?B?RHppQUV0SDVmUTltYzJhdUxkMmpxeHhDbXA2OG1OdklnV0dpOTVoTzFvWkRu?=
 =?utf-8?B?d2JwQjN4b0tPZVpSS3dpd3MxaDJqYklpQUF2OGk5VHlmTjB3U0c5WHNJQUF2?=
 =?utf-8?B?RVhWOHY5Q2ROSDM5dFVwWWJCY1k3NnFyd2JHWEpZZHM2dWVyWWErYXYxNVEy?=
 =?utf-8?B?YmJ5NGlibWhUdTlURzIvUlZKblJtTGdDNlZ5OS9iZEJhRXFFcERwZVNWQWVY?=
 =?utf-8?B?Mm5sd1U5aklPYzN2Qmh6S2xCQWRoUTZQeXJhc1RiOUFJcXd2dzE0OE1oYzZ6?=
 =?utf-8?B?bjJGekwvTkV1cUZaejF3emEycWU1QXNOeGhXVTB4bS83ZGloVUNubUFLT3Jl?=
 =?utf-8?B?L1Jjc05sanFhdHM4aUV4aFlqU3o3YlM2Z25OblVlMFNka2hKZSsrVGUxZEdT?=
 =?utf-8?B?T3hud3VwUVZaaTNJZDNjSFhzM1NNdWxOeVBReUxRN0NCMjI1aDc3amxvZnpX?=
 =?utf-8?B?dXBXNW9lMXJnL282NDF2bVV4R0wzOFhtbXNFZ3R0ZEdacndtaEp4bDk1Y1Nm?=
 =?utf-8?B?NFZlOTRuQnNEaldhWjBsdGVQZkJGVGZIa1JQdEkwM09VSkxNMXdOOU9jWGRS?=
 =?utf-8?B?VHlSMTlXSzQ0NjhJbGFKZHZCNHZHRk1DMHY3THJINW8zSEdWMjMwMGZGeHVp?=
 =?utf-8?B?Z3JiVk5DV2h3bk1jTEROOHp2a0VWUlFEUW9WY3NrcHQ3dDNueGxWU1BjVExh?=
 =?utf-8?B?Q1JDOWRUakpVZGFPcXQ5Q1kxcjVSUFBRaDdyY3dyYkF6eG5tbER1WDNmZHYr?=
 =?utf-8?B?dUNBb20rUDV5a21LUDIyT2hPZTFDTXZuckhWQ3FLYlJqZzZrV0NUcmVTL2tm?=
 =?utf-8?B?MER6RDNzK3UzQXdPVWxKUitjSVJNSThhMThFSjVweUZaNjFIUDNueGNTS29q?=
 =?utf-8?B?N2FzU2dSYjY3MXJHa3g0ZlFpWGlJaElCZ1FJdnZwK2dueVJSazEwKzZLUXJU?=
 =?utf-8?B?U2kyVDd1N2VFQXdkL2IyUHlEdWVsMHQ0ZDFkWGVaTVhHVmZyMjJvelpPUlF2?=
 =?utf-8?B?Tm9VUlFQbEYrS2UwNWRhQTl4K000TTc2d3ZrcHh0OXRGQmtWU3psUT09?=
X-Exchange-RoutingPolicyChecked:
	bQgF6tnHZXCLvu1lmGXTKBjz7I+oHgcFFpUHuezguJcsWjTiwELJvU1o86/52Hz/xnD8IQEuEWtTy3HHWMfV+cq4p0XGNp6nktHwcZGJb7wxfiXWvO95S7Hu1f8qb1YJI7dUlIFOVilcIEkQmNpSXS+1PWGxuky9HqbHQ0UpujphBuXWJRGEbLHfmwdpBBntO9TDZf6Qp+QqMFdRZ6o02pv3X1PYXnF4/Sp8c3qilchOdIBLDLCaSGfiTbovX+d4EA9x+VKqLMzsjyjz0BzEecLuUF9sQBml6kT7TgAQIBJjd9F5GbY01dVRkUP5yqrj1fpRK+TjSO70Oznw+FKwGQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e57aea-73f7-409d-1b43-08df1e031d40
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:24:43.6807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5Pp32Ad0pA6ptylDDeLVEdZRZ5qZXUdG+YCIAvknOUxTBBplgym/chx7IvLbJLMJrGIOdpf0neFKNZWZqro4tkfJlLNVKPpr6SvSlnXpUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8133
X-Authority-Analysis: v=2.4 cv=I+Pw19gg c=1 sm=1 tr=0 ts=6abb75ce cx=c_pps
 a=9MZ2ugitVzia3XLGoiWL/g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=yC-0_ovQAAAA:8 a=hHLtbfNtdWbe2qcbRXMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfXwPENKSgG7FjW
 gVLNFtxpW+p33BAScCSzL6NgUDDPnsSV8Yh1p6oiHFNga6gUbrTyrIOitgtOGpZoKWDUxQE+D9l
 wMPiQXjLX1n52SFoghnutPOqKKsd3iWWwXtEvV4SIrk3HufeeyW6
X-Proofpoint-ORIG-GUID: 5yDLvd_Om8ohAkdcxCTDXMpEJuovAGM7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfXx1pjBsDKARXU
 0lEt3UPti381NzSTAlHft1nlF3CF3dNRFc7zg3k29XccggYKQSL8WYsu/Jxi0HzRpD7m/sFLqau
 ZAyaM0BH1H4vWrJ3joTBEEGTDuyOdeUps4Zf1fk5WrAa0mauKs7I2xvmXjQonaYOoclTM3CgZTc
 kdZl6IzqPhrbICSfFT+plALRRj4vwmkNKgOcaZnsuVK4JNsVmdb01TDs0qrb8znjul7UzvbcHRc
 rIq2I9YayaOLQtSYlFXPbYWNd7sXPXvS/ePdZM387JwUtsnYeKSiwVS0wjJCZCsEV24Hpplzx7+
 EcHDixtgqHn8fTdcxin9nUOoW8AU2W5kGxtVOyVqMAV8l4nGy9WtEwWJEXYPsOIIBCt2lcl8Z5X
 kxgaHeixdQ6CGFTDzdSTu1UOmc3G9firB/ZAb5RFNmIXxZ8yPut5TJkiWC8OzfKtMQz1AX/cdc1
 rkgwVjQOIVDCUWxHWGA==
X-Proofpoint-GUID: 5yDLvd_Om8ohAkdcxCTDXMpEJuovAGM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290033

On Tue, Sep 29, 2026 at 05:30:02AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> Move soc_{probe/remove}_component() to soc-component.c
> 
> It renames function name
> -	soc_{probe/remove}_component()
> +	snd_soc_component_{probe/remove}()
> 
> Then soc-component.c had original snd_soc_component_{probe/remove}() which
> is wrapper function. These wil be deployed internally.
> 
> Releted fucntions also be moved. It renames function name.
> 	soc_set_name_prefix()		-> snd_soc_component_set_name_prefix()
> 	soc_init_component_debugfs()	-> snd_soc_component_debugfs_init()
> 	soc_cleanup_component_debugfs()	-> snd_soc_component_debugfs_cleanup()
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Looks good, one minor improvement you might care to make if you send a v2.

>  include/sound/soc-component.h |   2 -
>  sound/soc/soc-component.c     | 191 +++++++++++++++++++++++++++++++---
>  sound/soc/soc-core.c          | 179 +------------------------------
>  sound/soc/soc-internal.h      |   2 +
>  4 files changed, 181 insertions(+), 193 deletions(-)
> 
> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index 7708d84af8853..f2dccd3c9ca8e 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -404,8 +404,6 @@ int snd_soc_component_close(struct snd_soc_component *component,
>  void snd_soc_component_suspend(struct snd_soc_component *component);
>  void snd_soc_component_resume(struct snd_soc_component *component);
>  int snd_soc_component_is_suspended(struct snd_soc_component *component);
> -int snd_soc_component_probe(struct snd_soc_component *component);
> -void snd_soc_component_remove(struct snd_soc_component *component);
>  int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
>  				      struct device_node *ep);
>  int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *component,
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index 9622ad96d4691..78b348269707d 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c

[...]

> +static void snd_soc_component_set_name_prefix(struct snd_soc_card *card,
> +					      struct snd_soc_component *component)

The card argument isn't actually needed here, since it's already
populated in the component struct below in
snd_soc_component_probe(). (See below). Maybe it can be dropped in
another patch.

> +{
> +	struct device_node *of_node = snd_soc_component_to_node(component);
> +	const char *str;
> +	int ret, i;
> +
> +	for (i = 0; i < card->num_configs; i++) {
> +		struct snd_soc_codec_conf *map = &card->codec_conf[i];
> +
> +		if (snd_soc_component_matches_dlc(component, &map->dlc) &&
> +		    map->name_prefix) {
> +			component->name_prefix = map->name_prefix;
> +			return;
> +		}
> +	}
> +
> +	/*
> +	 * If there is no configuration table or no match in the table,
> +	 * check if a prefix is provided in the node
> +	 */
> +	ret = of_property_read_string(of_node, "sound-name-prefix", &str);
> +	if (ret < 0)
> +		return;
> +
> +	component->name_prefix = str;
> +}

[...]

> +int snd_soc_component_probe(struct snd_soc_card *card, struct snd_soc_component *component)
> +{
> +	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
> +	struct snd_soc_dai *dai;
> +	int probed = 0;
> +	int ret;
> +
> +	if (snd_soc_component_is_dummy(component))
> +		return 0;
> +
> +	if (component->card) {
> +		if (component->card != card) {
> +			dev_err(component->dev,
> +				"Trying to bind component \"%s\" to card \"%s\" "
> +				"but is already bound to card \"%s\"\n",
> +				component->name, card->name, component->card->name);
> +			return -ENODEV;
> +		}
> +		return 0;
> +	}
> +
> +	ret = snd_soc_component_module_get_when_probe(component);
> +	if (ret < 0)
> +		return ret;
> +
> +	component->card = card;
> +	snd_soc_component_set_name_prefix(card, component);

(Set here).
