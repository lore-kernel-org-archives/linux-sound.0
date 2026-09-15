Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D412FC893
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437128; cv=fail; b=s8bTvFtxDKV9vOGGkP6CEkndQG42AfnnTrp0ovI1wg0DMJNfwY3+JApiF6/o9pGBBrcpTaRNEyp3dcItbVNxUnK8lfx3Gyuu6ptUVeEtx8RiHDijdD45Y6NdlZT35Dy2S87qzweqGMnS7IBgKPVJqOkgtgpyr0SmqVO3i/Rg3Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437128; c=relaxed/simple;
	bh=jQCG/6qr8UPh5Qz0lEzejSYmVuqstvvABQfhSrTrIMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dH37tQQVKM0xnvTA5oQkxwYwSQtpwOWvGPmMO0sRY28+ZuoXIeT3W7SFYFhB6iX/vf0PdXNfm4I3yWm73zmJKMRun2S4CXMpLio0yh1j2a6WtHdWWGiPp8nJH5mgnMU4NUA0366sdY6Ie6hsm3hjG/0be3zoGAzH6Zm9l1hFCtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=JeAzHEEd; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="JeAzHEEd"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMx8w63083947;
	Mon, 14 Sep 2026 21:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=ZPxv3LVKKqRNHnsTwox9HuptObOLw
	4NP8CZn+50l3vw=; b=JeAzHEEdXrPw1sc57k3l+qeML788u149TRI2KwjLdVn3D
	ljzu611gUFlhQtEiLjpGLXUY2Lzw+cktyUXzL9k47OI7/CFD5nlyDXc9ZvvLgA6c
	fk+0saQz0hNRtfjxjpED+a6bOKjAj7MZCP0JiNF8/Ks9O55kpLyz1rnzz3go3v35
	yB3NelgyR7d9KLKHa/UFx+sGYPa8jUw4JJUVMP0XZJDMor3Cu/tb1q6kyA5sGRSB
	O3L/ynrEnNQJn9isXH8Wm8cjRLRLHqrFryUOhPCcGuNMDi9Rya1MYFlVjjiTUD/w
	Wnl253YK0viqLKpWxPKr+KC5xk0okEAjxzv3ipBhQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gpkda2jhr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 21:52:01 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rddKOfi5h+3XPQdP+NUVgAuF9ASoFTpatxgZ8lhrpXZ5tCh3JiQJvfOojlU9mp+NwLUFLQlLi4jFzKH+by6doemwSKgY20we1UajFzZ5kZmM08ZRO0IcKPMC+ok3jHrTrH20KD+CRtrEuY33NaL91OkDaW3UeltQsUX/MAAMg5UfM8Wt7TW4tHHMJYlY/R9emUxE3oERXSJSW/SapertDOnzcpnpxoPh4iylyG6jez5H5rXw78/uLGHu7wRgyOPh/barj8ewEUY9kd0xi3dkQEJRUGLPFa9PDX3+nY3Eesr2AIqpNc7hcz0/8/qyUx+OfOvfrwMaLN20aMBV9trnLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPxv3LVKKqRNHnsTwox9HuptObOLw4NP8CZn+50l3vw=;
 b=BsSs+7OMLKOFNRjG5PCU7OAoUh2V0ijl9bNBrDhm2H0ozNWwiRSaTnq9I6LRIWgta0AP/nUrWeksldFLu78O6jelMRcF2Ej9gDKYIhqJKH15v3++08k3+izPh4j3Hv59ytSO3rzmkAahUBBEhUMjTUk/v/qpZKBmjlY2VzaMhcEmhaBS4Ik9ifzQnOrDSdhQOWFV8pNEGm2xVrxQke1rH8CaC8wGABFFXL9K+IjBZGCk2+UFoMXPI/94OOIRzJ7fn/g/+FlvpddOx5fsYGQ89QXy9mQJIBmVucXYVaRdhMi/ffIxeV0fJEznHUOb+QuQ8liSAFUCykCyJcS6PoSdQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by DS0PR03MB7180.namprd03.prod.outlook.com (2603:10b6:8:123::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Tue, 15 Sep
 2026 01:51:59 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 01:51:59 +0000
Date: Tue, 15 Sep 2026 03:51:54 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH 05/10] ASoC: soc-dai: add
 snd_soc_dai_symmetric_get_params()
Message-ID: <aqiahbyrYADuK4_Z@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
 <87jyooli6u.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87jyooli6u.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: AS4P189CA0062.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::9) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|DS0PR03MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf22bfa-0a15-4a91-ec26-08df12cbed6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|6133799003|18002099003|4143699003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XVe83DOjSnfhCbw9hF3yoFaGzqIUv2ueoNkXBiY6WakvDeXUAfYFMjrTVdEDFHuPLcKZQpruxbqJSF+gMYxw7qmugSxfsBNBBHi4JaKZPdirLXYeNqSYfZzZbrQphqCP0Z+kqd6F3k2SpkotgOvWZi+aMwLp+ym2ln3hOVEpYFDrxWvAVqSzPdszx29sXl+9OpuR6fQRI2QZ40X45xlG0CypB/e2XjeRuLW7Rt6eQYyWJ0b0PaUdZiNGH7VsIuaXQBDP4wn4v/hgDT463Nlq+hQdHmHKN39t0wCFkd2iDEiWCUWWWq+FChd7iCogrBR3LrcKqbWs8KvZdEhfSAebrRxPZLfq/2aFNHihQPFa3pAVT0Ki1h5VS6r4IxInBvQG07KEn4Fwua4EfjGjtgeBZv4O9vhsIUcu8MesoUAoNf1xLPW8+anofcp5R2LTv2jZNRzlZ9HFw84PtLq3Pzx8zRPnrMPtwtlTO63y1B9yWNu8P42F04dytsalM4J5yZYOU9ZrAJqhyvCviDIHYghpHl9USCMEQXreR0tfQF7zSbR0/rbt50tS9Oen31/6LEs+XsxkLJqjWl1MumUEGlCgsmhOub66InkQJ87zB6552Tf2l5++qkpJYcyJjgCJIfpmFHzZbDPnIHOm8BIuv+rwzfLLstBGI28ufP26qWWYJDU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(6133799003)(18002099003)(4143699003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUtlY1dkL0NiMStzSnVld01McVEyN24rOUhCRUppdDYyUThuTDlZVjZVOXhx?=
 =?utf-8?B?N2I1LzQrbFU4bnNHLzN0aGhBY3VGc0w0bm55Z3p5S2dZckNnTmhrVEJqeWZF?=
 =?utf-8?B?NFlPZW9ka0diUFpYNkdyM0NESVRKSkZSeElUcUI1Q0pSblBjenh0WGFLZm5h?=
 =?utf-8?B?NTQxaTVrUTBQVVJYeEs2UURsZDVwREZXeDRLT0hIL3lwK2Q0TjdyY3FMWHhz?=
 =?utf-8?B?T1p1R3YrMytEWWVBeVU3Ni9pNDAwU1NlNXBwZytEQ2xBV2FoeXRhYzlzdVBi?=
 =?utf-8?B?MFZQcVRyM0JMWW5maEk2Y0p3TEN5U1Y5b2JLREY4d3ExS1VoSmZ3K0dtOGNi?=
 =?utf-8?B?end3K25wdGg4NzQ1YldkMGV6NzJjV0hBeTF1T0d2TzhNTWFJbS9saDhtMGxq?=
 =?utf-8?B?NDNGeU9jUjZwYkNhZ2RIZldURHR3dTRuYnRwUVh6eUFOejlod1ArRkhWYlpo?=
 =?utf-8?B?RnVKeHgrbkRTZ3AvOGlNV0FKdkgwbmw4ZXJrQXdhMHMwbUNYcWk4a0VQbkhX?=
 =?utf-8?B?VC9rS0JiK2xBTzZkM0dyTUZzSjFUaXNCRG9weWpTcjRhSVIyYWlmK0ZsNEhL?=
 =?utf-8?B?NURQMFAvNGZXamRESnJySk16aHNxcFpIckdMckh0cVc0NUljNDFsNmlrckU0?=
 =?utf-8?B?bXgvZDFHQWF4cGtnSTRPZDJEM3pidWtlYkJ5cmE0Q1pnTmRjOTB3ajJPbFg0?=
 =?utf-8?B?bG8yc1pkNHYyYWxPcG5KNk42UWlnZHVueDNlQUNiRmJ2NUhvd0ZBMnd6UlYr?=
 =?utf-8?B?RG9YQ0JkVEF4ZXppWXp6bmUzd2hDcGFHam9DMzd2bGlPcmdYSkJSZkptZUZh?=
 =?utf-8?B?cFl6WXFHOVgzUk16N0xEOE04UkxPUE9JWXlCSGhJNlNPRHI2ZlJDazlMVzgz?=
 =?utf-8?B?QnNlOHBlSXRQckx5Y3ZCYjNML2M5VTNlK2RFSmwzOVFEanBDenVhMzZlLzVy?=
 =?utf-8?B?bjRaeTVOWnkzN21kditVN1FDMkI1VjRJNW52czNudFlpOFdIKzY4bzJmRzBy?=
 =?utf-8?B?eHdoV0Q1OWRhV3pLZjVwdDBlZDJJR2NRcDc3UlVpR1RjclpFYWQ4NlVuRUZC?=
 =?utf-8?B?QmdzZ1NlZGp3UmZLb2kyZTZVMk82aGRFUks4T2syaFk5UDFJYzVvMGlPaWN0?=
 =?utf-8?B?L2luOTdHeDZNMTZzYXUvQmdMMDF0SFVWRlB3OFJRMjZkMU5oTmhXSk4vMndJ?=
 =?utf-8?B?NUJKQ3JJTk9sbUZlQnFBWWI2UVFIb29rNjZ6N2ZMaWo0azcraG94L3lBeDRy?=
 =?utf-8?B?MU4zSzh4dnJyTWM2TEtFbFg3L09yeGpGRFk5d0U4RXYrYzJmN1NxOGVDbEhZ?=
 =?utf-8?B?d2dXeUpBRFpranVBeFIvb0FRYTRsdlgzMlZhTnFPUkFieitrcld1djlTaTlL?=
 =?utf-8?B?OXk0b3pLMjZTZzEvdzEzY0J6dHFEUmV0eE0wRE1rQjk2Ujg1WEJITGhicjY2?=
 =?utf-8?B?L1dKMFl0RzNIckpIek5lSXVlYmNmZUVBZUpJby94Uld3N2xpd2FzYXdqM1Jz?=
 =?utf-8?B?UjQydkRKdkFVWEhxTWMrUG0rZWpUa1pScThsQklQcS9sVkRXWnRuRGNZeVBD?=
 =?utf-8?B?OXVSQnViRzdCaFloY1JzN1ZmSk5EaU5Jb2dXTHJPVTNMT3dvVTFVM1Y0Y1RF?=
 =?utf-8?B?ODlOSXprY0JiK2NsOUltZER6SHZGM0RCOXU1OGR5b2YyNjBkazNYK3JoMEs4?=
 =?utf-8?B?NGtNSnVpc042MGFBMHE3UGhnaEcrWXZscDFZdVNHMlBaM2duaWpXMjMrYkly?=
 =?utf-8?B?SDEyZUxhbGV2cVkvc2YxR2NLSDlHNWl4dFdmM1NGQW1XcU5odDg0RVFWWUNU?=
 =?utf-8?B?Z2M4U0lET29OT05DV05HZ1JQdG1md251Z1BIKzhNWG1PSzVQUkFVaTZ4ZTdG?=
 =?utf-8?B?V1BrcWR4UHFrd2ludDlmQ0wwSkIwRGh3aEV4cm8zVUNqT0JKM29xVGVCL1FY?=
 =?utf-8?B?cFgzeFQ5VEpSMndqbFlSeFdZK0I3OUhrZllsdGNicW1vWDBZMjFaTFNpMnV1?=
 =?utf-8?B?andDOEZ2S3o4NXgyUDNLUlJnZG9HNXNaakFUWitOQmtxNVlPUGhzd3Uybndp?=
 =?utf-8?B?VUVhcFlqZXoxbkZCZXVwdXNiMkdiazBjR1JuMjVYY0U3QXRNOElpQ0FTTUVv?=
 =?utf-8?B?cDVPeTJtYk0xS1d6eUt5SnlqWVdIT0VVOXlHMWg4WWNOcVJOcmIxSmMzbklp?=
 =?utf-8?B?VVgwZGE3K09BRmtZekl0Q3ZVNEZFQVRBcUFrTzJxaGhESnhhQ1VGUHJneURq?=
 =?utf-8?B?dTdXMXNXSStMOTJaRnRxT2lMWWNiaTByNWdiZGRLdEk0S1crajMrQ09qbzBO?=
 =?utf-8?B?Z1ZHcjhHQWtWRVV3T0hrVEh6Nk9vcStGdHRsai9mNk5WSEdYeHNoQT09?=
X-Exchange-RoutingPolicyChecked:
	hiwWEDPxUPAlGdhcMORk6ZnSCv551tMhKI5Iwa0Jx4Dmcqn70eLuYj0jR6axOO433j/l1FZw2FKC3T9DJdtkeuGEyOwowwvQCdQNXBoM8L7egJF41rQbvv8U9kSOT+ccCwA9Hgk28vE/1j4BECC0D/sjsP9GCKDSTNIyD0soNDh4wFC4q+NN3fPUwKJqOTe55/5F0QwQkYEZY4Y+H6CTYy5LNj3df2oc8xkNqAAr6eBK/8cYd/bGcVl8fqv7HfYVoRUZHRgU9EGh5dY4MegXMGhOaWmHXcaC0mN9oZr3MNvV3l8dcm4xtrVwZ7ICO6EbpF7AdrY+FcVg0fwlV9QnmA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf22bfa-0a15-4a91-ec26-08df12cbed6a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 01:51:59.0695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QpBai6LkbOMKrkzIXrw68jslziDYqaQMrUbE6Ziy7AZXbjYCgL5S8q/fMkd03beSziDSj2/RiQTYrfTR5Y2+mDSEz5BATygT6jFnT2PObQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7180
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyMyBTYWx0ZWRfXxmetL3EGQIFG
 0dyYGMOul0ihKoav1b2Mz9IeAO1voHhzhrxVn6Y5IYAzp5S0E1Y+d+0pDLhkZKenyfzZdafWR8d
 L8iVMiRjJEzyIlmgYpXY+meWebyj2zv3+qvBoUV4HDMbYIapai+Ti+OlV0AkKZvrrolWUMuvFo7
 z+1X8Bl2Wpxla7alyRjd63DNimLg7KfEFdnI0VXrxbip6v2SIDdrLEv7bk/lHYpi2fzLC96HZLD
 31yywIj3ARSYM81fhj6rg7K8tsndNTGkFSfZvNjWi52zd+NLP8Lpwz3jMT0ztL5hdpBKIimHrsX
 onkk1IfiPHqYYRz0t3tpvtQYNprsNjhgnPWPe0kL+OvqtrbmO+RbEvwDnpyvdcK6bE7NDyZnD2k
 x9RJq3okKgpfa3rZGYdcm++3Uvky62CvG8froBh5iT63k0jt9kV3+wlck6dYl8SUsOfOygSVCVB
 AEehxS1LIgc8irE/zJg==
X-Proofpoint-GUID: HIHiq1ecWJuYEOQP37PA-oeKdFOGUIwK
X-Authority-Analysis: v=2.4 cv=Vr22kO2n c=1 sm=1 tr=0 ts=6aa8a4c1 cx=c_pps
 a=fQjKmEXVym7+EbnoMZdWAQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=yC-0_ovQAAAA:8 a=E1VmXNiTSs7oMDVBIQgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyMyBTYWx0ZWRfX3hmt4so01SaH
 ANBoEuBASXQfzv2oDiX116Twxr48ds8kaXmaJy+/ahtjIQpSG+pRHDPGFpjnjkXikfsMqCDR46o
 ZuXOQFAW4ms5LJComtiSy/RV0T/hN73CX4mNh+pZxdeaDoH/aJS5
X-Proofpoint-ORIG-GUID: HIHiq1ecWJuYEOQP37PA-oeKdFOGUIwK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150023

Hi Kuninori,

A few more naming ideas below.

On Mon, Sep 14, 2026 at 01:45:14AM +0000, Kuninori Morimoto wrote:
> DAI parameter will be capsuled soon, will be not enable to access from
> each drivers. DAI symmetric_xxx has been mainly referred from Mediatek
> drivers. Let's add snd_soc_dai_symmetric_get_params() for it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-dai.h                     |  4 ++++
>  sound/soc/mediatek/mt8188/mt8188-dai-pcm.c  |  5 ++++-
>  sound/soc/mediatek/mt8195/mt8195-dai-pcm.c  |  5 ++++-
>  sound/soc/mediatek/mt8365/mt8365-dai-dmic.c | 10 +++++++---
>  sound/soc/mediatek/mt8365/mt8365-dai-pcm.c  |  4 +++-
>  sound/soc/soc-dai.c                         | 14 ++++++++++++++
>  sound/soc/soc-pcm.c                         |  5 ++++-
>  7 files changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
> index bd714c3bbf3df..c5544f1789425 100644
> --- a/include/sound/soc-dai.h
> +++ b/include/sound/soc-dai.h
> @@ -563,6 +563,10 @@ struct snd_soc_dai *snd_soc_dai_register(struct snd_soc_component *component,
>  void snd_soc_dai_unregister(struct snd_soc_dai *dai);
>  struct snd_soc_dai *snd_soc_dai_from_list(struct list_head *list);
>  struct list_head *snd_soc_dai_to_list(struct snd_soc_dai *dai);
> +void snd_soc_dai_symmetric_get_params(struct snd_soc_dai *dai,
> +				      unsigned int *symmetric_rate,
> +				      unsigned int *symmetric_channels,
> +				      unsigned int *symmetric_sample_bits);

Why not split into 3 functions:

snd_soc_dai_get_symmetric_rate()
snd_soc_dai_get_symmetric_channels()
snd_soc_dai_get_symmetric_sample_bits()

Or if not, similar to my comment in your other patch, consider
snd_soc_dai_get_symmetric_params() instead. I think it'd be more
consistent with the rest of the API.

>  
>  /* REMOVE ME */
>  #define snd_soc_dai_get_pcm_stream			snd_soc_dai_pcm_stream_get
> diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c b/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
> index 8ca7cc75e21dc..766893ca56d45 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
> @@ -128,7 +128,7 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
>  	unsigned int lrck_inv;
>  	unsigned int bck_inv;
>  	unsigned int fmt;
> -	unsigned int bit_width = dai->symmetric_sample_bits;
> +	unsigned int bit_width;

Alternative:

	unsigned int bit_width = snd_soc_dai_get_symmetric_sample_bits(dai);

>  	unsigned int val = 0;
>  	unsigned int mask = 0;
>  	int fs = 0;
> @@ -137,7 +137,10 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
>  	if (dai->id < 0)
>  		return -EINVAL;
>  
> +	snd_soc_dai_symmetric_get_params(dai, NULL, NULL, &bit_width);
> +
>  	pcmif_priv = afe_priv->dai_priv[dai->id];
> +
>  	slave_mode = pcmif_priv->slave_mode;
>  	lrck_inv = pcmif_priv->lrck_inv;
>  	bck_inv = pcmif_priv->bck_inv;
> diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
> index cdc16057d50e2..a090995ac9a7f 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
> @@ -127,7 +127,7 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
>  	unsigned int lrck_inv;
>  	unsigned int bck_inv;
>  	unsigned int fmt;
> -	unsigned int bit_width = dai->symmetric_sample_bits;
> +	unsigned int bit_width;

Ditto:

	unsigned int bit_width = snd_soc_dai_get_symmetric_sample_bits(dai);

>  	unsigned int val = 0;
>  	unsigned int mask = 0;
>  	int fs = 0;
> @@ -136,7 +136,10 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
>  	if (dai->id != MT8195_AFE_IO_PCM)
>  		return -EINVAL;
>  
> +	snd_soc_dai_symmetric_get_params(dai, NULL, NULL, &bit_width);
> +
>  	pcmif_priv = afe_priv->dai_priv[dai->id];
> +
>  	slave_mode = pcmif_priv->slave_mode;
>  	lrck_inv = pcmif_priv->lrck_inv;
>  	bck_inv = pcmif_priv->bck_inv;
> diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
> index 0bac143b48bfb..6e1d48f757d22 100644
> --- a/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
> +++ b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
> @@ -118,13 +118,17 @@ static int mt8365_dai_configure_dmic(struct mtk_base_afe *afe,
>  	unsigned int clk_phase_sel_ch1 = dmic_data->clk_phase_sel_ch1;
>  	unsigned int clk_phase_sel_ch2 = dmic_data->clk_phase_sel_ch2;
>  	unsigned int val = 0;
> -	unsigned int rate = dai->symmetric_rate;
> -	int reg = get_chan_reg(dai->symmetric_channels);
> +	unsigned int rate;
> +	unsigned int channel;

Alternative:

	unsigned int rate = snd_soc_dai_get_symmetric_rate(dai);
	unsigned int channels = snd_soc_dai_get_symmetric_channels(dai);
	int reg = get_chan_reg(channels);

you get the idea.

[...]

> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index a446e9c1c9887..aaba9ca724e61 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -453,6 +453,8 @@ static int soc_pcm_shared_bclk_rule_rate(struct snd_pcm_hw_params *params,
>  	/* Scan all DAIs on the card for an active peer sharing the same BCLK */
>  	for_each_card_rtds(card, rtd) {
>  		for_each_rtd_cpu_dais(rtd, i, other_dai) {
> +			unsigned int symmetric_rate;
> +
>  			if (other_dai == dai)
>  				continue;
>  			if (!other_dai->bclk)
> @@ -465,7 +467,8 @@ static int soc_pcm_shared_bclk_rule_rate(struct snd_pcm_hw_params *params,
>  			 * after snd_soc_dai_hw_params(), so non-zero means
>  			 * the DAI's clk_set_rate() has already executed.
>  			 */
> -			if (!other_dai->symmetric_rate)
> +			snd_soc_dai_symmetric_get_params(other_dai, &symmetric_rate, NULL, NULL);
> +			if (!symmetric_rate)
>  				continue;

 for_each_rtd_cpu_dais(rtd, i, other_dai) {
   ...

   if (!snd_soc_dai_get_symmetric_rate(other_dai))
     continue;
 }

It's a bit more explicit, and avoids the NULL, NULL stuff.

Kind regards,
Alvin
