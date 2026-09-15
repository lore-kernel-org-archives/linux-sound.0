Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2650F2236EE
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434042; cv=fail; b=Lj4fpbiOdqQpF8sfwGJuxqebOTpkNyOdM3RCmpL9LYx1xF/0XGwNH5QrofpIjVIqfl1XCz1AVCCG1W3D9EPPAyb1PrgjXbyWQDlS/iBrXBJaQ3veevBoD8c0kz9XCmogH1jdpqgxjBdUriwoszxTDdFseT0tDGCwIhxxairKhx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434042; c=relaxed/simple;
	bh=8EmY72Hr3B7kZa7ESpLj9aMhHc2aeP+vTLjA4iCIMPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rULIu9EOdp4fdDccnQwBEEQduMy8W4HfxWyMU2fC1xIgDGToU8yQ5hiNkQODtV+yvenHqPMvH2QWny5kvPRWBz2sOB71Os0OYEEk1h+qU2JGK8ThNhgJcZuhqJqA8//+kQHOXXRfPPbBrfUxNbEG+VndaJp3f8Nwl7lcTgclo38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=YgS5JV9C; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="YgS5JV9C"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMwZHH2488562;
	Mon, 14 Sep 2026 21:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=4AyCIrWizgpKgyrnKEoou/98a0rBW
	fIZh5ULGjtkocE=; b=YgS5JV9Cns1JRy+Q17Ciw6vs1surscRj7hpydpAZWzXFK
	UEw+jL6nDdJPlkVO5/tyQHZ7eqlCJflbXcrqrHwkaITxMbWPRe4fDvpMfQN4AWbX
	v07krNuQDtbLVj3Oz//qLLc4PbwDL0KhC2x8LdmKaRKEfA/undC+uqefznrQ9XGV
	f3Yctg4ZYC9qaY5n6pvN7HpYA51/2hoF7w+2JxrJeXfXORUxtfmMrMzZ9a1jIF0e
	fT2/LLOO8Ht6NSsh+VQ3vdDkXkiPGtjO+UygVeetK5l4URG4tUHxt65ZKCxUC+5Y
	YRcvQWyrF+DFwNgihcxK0phyovVTRjPiSOj/hpjjA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010038.outbound.protection.outlook.com [40.93.198.38])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gnn2cgk6x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 21:00:36 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNtc6vir693opklqNR/a9UM5FtxTxO4OVPP7INH3OEK4rJfD8hJSPgDvjhYUuKGa6CMh9JAqyuV/24uAcuwjxqtnHpmX5J3FaviHFvaLm5ejvBoPDuGxVAa7s2sR8u+A+BvWCBriln6s2sScghyhf3NbhKHm1ZlAdJA02Z5h37AvoMI9dbNEKRHkubBskB8drUEmqWZC2XJU4Rw4Ky7/VwqorHKXfcVVGuV+fTOz0St6zQvMfaF7p22h8JHar1vhIgCGzkpWp8crOrOKBhP+uPBzMrMMfVlCLur05nhWhRSDnQF5XvA0BONPsg/a5ZzoFLq12V2OUH3UmaNRZGN74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AyCIrWizgpKgyrnKEoou/98a0rBWfIZh5ULGjtkocE=;
 b=NKYTN5YTBxazRGGMOqjB5aO+OsYEJBVLaJxOn0BTo1zc2iWlbiQi/J91eI9dkbOnomeDcWUBjLfKz/GrIFvyZuD6TMNqlMr1bNdXGXMUE7nmiAISP2TF/ZLdm7adgnXUHUOUV02NOUXij9bzQgglApqkl7Ccq2juDi1EFMHHgCnhHwWzW5MnEVmAgABlqg4jDGLstxaENKob4iZjGeoROXkCr2/hISwGF0xt5QaxbW8wprkQPyn5v3fD9i09ZtH8KAEu+ZSOf7uGVtTMZhA1NGe44rdyumxVp0vUeosA4q0WtQjxy+98fIDTdmen+S9rWgYIekkyPnrV1s9EUj9PvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by MW5PR03MB6957.namprd03.prod.outlook.com (2603:10b6:303:1a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 01:00:25 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 01:00:25 +0000
Date: Tue, 15 Sep 2026 03:00:20 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 07/10] ASoC: soc-dai: rename snd_soc_dai_stream_active()
Message-ID: <aqiS7yz4IIYzU6ml@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
 <87h5jsli4y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h5jsli4y.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: AM9P250CA0025.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::30) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|MW5PR03MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f37a244-7313-48f3-3526-08df12c4b936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|18002099003|22082099003|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+DxBEJ1EFAYEHG4kdgqjmW9pc+vRxTaVkyPvQJ9nY85XZ2sEXW3aU5+yLT9SoA8yQfffgUgTlvMYHKblLK5ExCB8LSXYsURYEG/eflvGT+ERsJ5iROzBJ3a5PlQ/ap+3DhVhgqqlKiq9tAasJbRXScI0YD56NgI8HKhx3tFUC7mX2j31cgABlOPCDsSE9BK1ZRtLWjHP+PETgpmGWIXdgVl4R+gcpqQA6naCZvWKUyzIIPWr64iat3YaHEyoRkkhZ/FfkS4tigdQTcziDhR6NYlRBMnMfZMmBl3CV4glGSmPUirEO2uCLMjpx9W7HWyooV5jZPj1z7BUraVA4b1U6fAlxnGzjjY/iheVcG1EyOZJJcHX6+GZL0fP1sl9tZig0X9S6gQ9/nEaehmPpjoPF3TPR8m/LeaLhpeLUUozJFY2NQGZvsWv9AV5tenZxPRa7iRgp8n8NyRW55PKWhghrc7kaBjrMF4vmtnAOombxpy5Vj1T8eR7jlif3NJm7gaC8LIanDESRHMYs/Iwcjgip1VaBVEIGPatP5p/px8jqyCNfNOeS+S7yoDVey07jXGUi4JC/g/ovAoiWUnmUPJypM+6urEKEIpzWJuVazrOu+GDD1BleOEpifBpAArd9jF9BpkV+TmrCyZqJqenhBAYUqmz8BThJi/PxwmD6ZGfrvQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTJ3SUJ4bVlEdmgvYkpVTURlU2hqYVVGMWJYWTVSamYrU0t1NUQ2Zk9NTTFG?=
 =?utf-8?B?NmZDT3RhWDRzOUNNSmZsMkI0OWh0RUlKVlQwdWw5QmJudmZJd09iYjk5Zmh2?=
 =?utf-8?B?dlBzSXN0VHNXMmFLRDIwRUsxdjMzMHVtSEN4MTVRZzhleUcwdXFUNDl0cmV6?=
 =?utf-8?B?OVJwSGxPUXBzQW1FRWt3UnY2ZC80NjMrcCtvbStwMTlCTUlKeDZwbVVhRUNk?=
 =?utf-8?B?TUtwZmZNREtVWU1XTmloNTBlb09ZWFNUZCtrTklJYU5qL0pKaTNMQ1RsTGRU?=
 =?utf-8?B?TXZCVHdWRWpuZ3RhVFJwNWQvdTA0QkdlM3R6K0VXZXZISndTR1ArQmtUazdn?=
 =?utf-8?B?RUtEWmFUY1dDeEJuRDg2cVNhb2dZMGQ0d0ppWlo5ekMvd2tlSjM5UWlveUZx?=
 =?utf-8?B?ZnREVFRGdys1NHBkM0JJZmJlQ1BsMjhoTS9NdnZuV0NlaTIxN01JVi96OW9t?=
 =?utf-8?B?OU5UNS9vN0VDQmxRZ2VjOEl4MWs4a21CdWZXem9WN20wYk9mYTAraklmUE5s?=
 =?utf-8?B?ZVFhbUFVNVorMkxGaWZjNzVnSDhUMENuVEx5bHN1WTBYK2ZFYmN2dU9NNjNq?=
 =?utf-8?B?RzZ5dWZYeVlKWkdMb1ExU1dicVM0SFJ0dy8wNHpKSXl1emZLdTNUNWpRRkVQ?=
 =?utf-8?B?ZlIxdWVtV3NYK2haY2dpR1g5amFqUFZPUnRZYlFRZGsvbWFjLzRjdC9JUSs0?=
 =?utf-8?B?bFhqeFMxaVVwQnpCbTdLZHJwd2d1T3hsOVhjMVh1YlJlemVCdDNqRko2S0tp?=
 =?utf-8?B?dGJrZlV2bUQwY0RTaTBNU25QQVVtZFhzY0dDNWJ4a2hNTWZwbll5NG42RG92?=
 =?utf-8?B?RFlXNnljSXVoZ3lhWENSS0ZnbEl6TG54a1g2UXZGNFNxSU1JOWNmT1Z6ekNw?=
 =?utf-8?B?Q05jL3ZHYmJhMzQ0UUJZUEsxK0hSNnlJOTdtVEFlZUQrRDdyMXI0S0MrMSth?=
 =?utf-8?B?UEZLV1ZsWHJnRGhuWjRIbTBTWWJGRm9jMkc3cVNYanRHYmIydlIxbUlRUEtj?=
 =?utf-8?B?eS9iM01oMFVoSDFuanZkWEFINlN5WENpSFJZUlBlUVlOd2Q5cGcxd2F0bWR5?=
 =?utf-8?B?R2tnZmpZYWJjd0N0Y0FpOFlpQVVWcTB5eVdBMFlScEJTVTNHZHgzSU1wdUtl?=
 =?utf-8?B?UXhOODY1NEF3eXVhdFRPdDJnbExFTFBDemdOYnF5VjZzZWYxWW5pY2pDQ0lJ?=
 =?utf-8?B?cFRLTjJieXMzRTVRVGJWQ1h2NTA5QTdENnNDaEUvVWhkMVJUK2RJSVRpMURi?=
 =?utf-8?B?Mjgvdi81STFHNnd6SSs4aWFEc080TkxmMUplQ1BkZkFaTmszNnJFdHJJUEt3?=
 =?utf-8?B?TFlGNUlFbTZGTEpwSWhyRzF4ZTg2SkNDTnFsbURmVVlTM1RTLzhQQXJsUU1E?=
 =?utf-8?B?Y1JZbit2ZlVMNjZmN0o2QUg0ZHVscUY4SnVPLzlNS0lHTWdBR0Q4dmdzcUpE?=
 =?utf-8?B?bXZlUWRlWGdEWTRSL1IrTUN3ZU5hY0x5Sm01cG5xdWV5b2hpZWlyUFlZMVpN?=
 =?utf-8?B?b21lRWxTNkVyeEdRYStLNS9WZnZHNU0rcHArVE1Ob3k1V0ZyV3o0S0hQR0dS?=
 =?utf-8?B?YkU1Szd4L1Mvc0txc2FCYmdVVUVSQkxWWHY3Zm8razBTREgreUcvRmU2T1pQ?=
 =?utf-8?B?NGVKT1pYNDh3akR2eWpYYTU3OHpGK3dad1E2TUJIV25oVHZVZFkvSWNVcUho?=
 =?utf-8?B?elRqUGRMNW0wTjNEZHZ6bFRNT2dPNnZNb3RNVHZ0QzNlS0Y0WnFOTFVGYm5D?=
 =?utf-8?B?WXR4M3A3a2F5SlI1MjI2Y1pGaTFWSWdSazdzbFJxcld1UDFabndUL2JSdnQ3?=
 =?utf-8?B?YWhHOFhHenBxejVWTkRtaS9ST1RwZWpEeURYNHMwNjBMamF2SktSckNZQkhG?=
 =?utf-8?B?Y1c2ek5NQTRNYi9Ia05FdzFjc0lQVksxMXFuYkNYTlQ2MTN2VmhyTFNHbjY3?=
 =?utf-8?B?UGRub3NZZjgvVk9ua0xibzlSaXRFb2F5d0l2U3VoUFU1SithcHNLdWhkQlRp?=
 =?utf-8?B?dFpReGk4L21BZERWeVA0K0pnTTZiZDVDU3lIUnJ3NDA1bm1sVDRCNkFYUktk?=
 =?utf-8?B?M3JpOUQ4QUxWbzlKNXlmTGJVcGN2N1UxREU1aGxKREloMHdmMndnMTgrMGxS?=
 =?utf-8?B?YitPWVR1ZE05LzVzRjAwY0pTam13aUlEbDlralV2RndTbFlTWGtaK1k1Rkdu?=
 =?utf-8?B?NXRlK00zNFdSeVJiODhyNjVpNkNrY0ZiVG81ZndVeVR3QlJmRlNjTzg4V3lC?=
 =?utf-8?B?bFZNeXdGMWJMYUgxb3JxSjBXZ3dvVlhmTUZya1dUM0hRS0xlY0N4ZjIxcVdt?=
 =?utf-8?B?ZExqdUY1TnUvOSs4d3Z0aHRpVG9oVkFpTVNJRG11OE4yd3RKWmMxUT09?=
X-Exchange-RoutingPolicyChecked:
	tcZyWJ8q5IQKah/yiJVin5cDSNhBMyYfHu9OFFg+TkwQI2vqcWOUuV43x2UA0XvRIcq+9crzqxmmDEZhoPDeDM8P1UXo/nRjJFKucRz++Kv1YYMuo/J87kAIVAd6u4LOH8awfmlz5DOxnpxP71CS8We3g2JgsDQYFzIsvfwuyKh+GqUrDbMXC+uwlljzZwE3W9c8D/x8ahcrE8TzHIht8Vh9YsHYzJsoiHcItcHQqZwP+PwXrbwK7962PeCT3Lz/NJw2sJwVVEE15pAfbUqtXXVrE8r9S1OUc7lCJMXUaT6/0mCbhaj/DiK3p24VDmibX02sNQvm+9g4/69SU1TZow==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f37a244-7313-48f3-3526-08df12c4b936
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 01:00:25.3176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cALLItb4pKL+2ub8VX2iNKtehKW0NO9kaxfuJjcmsF3nUx6Mhh9NvsJtae54yCRjxVwR/oMQGo/7S6Fq1KKHNdCBav0LM5ospTuzyWfHqoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6957
X-Proofpoint-GUID: CY9TcwlMkkhKEuPvbX_81G-g65NGUpCj
X-Proofpoint-ORIG-GUID: CY9TcwlMkkhKEuPvbX_81G-g65NGUpCj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAxMCBTYWx0ZWRfX+kL/i3KUzj91
 msY6pNYXp1n1+Wp0p5dzTWpEx6uXfTC0eB+fe/folOX4FFu4HascPYGMT1WGhQopqn0UEwtlMUp
 vXsjlrLSvQso0vnSVvju3o9MM90gAjGmOjedtxZ0Vl7/U40jStJAMhFGMmy90BnPWMQeFZNPzGb
 2eYGlHj8shBvqXSvHJtfIZrQEUTfyA2wyzbixlGjXJBUW7WJWcRzIzs39CgpZoM939iwtGtBS7z
 tAdB85FgQFSmBky1zmx6uepNuwxkNb60DdymJoGVtxBbIW8/8ZkVHVX1vLhyiai/RhImD8oE903
 pEtuvTuQlPeFcjoUHlSt/BMdEW/sy39liRb1D/U9qBKWXe7sM5brCExtbnvquER2uydVTW4PcTL
 XVYFFoLNYhznndvLkjds/ReuIGl8gCE6yTPaNT8vLcBIJcc+B43B1UPxZE3vdA6o+GxLtSORSt4
 dgnykMPyKUJP/klLjMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAxMCBTYWx0ZWRfX9a0mZmwzsn/E
 UJl7nmCzI3wrWJpsRKrKWfk5bZTTkRoji6YLAG/AdP2SBnaqoPoGqCV18bAVhhLKie7eBr0KoRd
 kAHUKDq1iMdT1cnHeMjt39or3vi+kwqXovP0iFBrdwpUFZqA4khm
X-Authority-Analysis: v=2.4 cv=bcH+w+PB c=1 sm=1 tr=0 ts=6aa898b4 cx=c_pps
 a=04So32024hOmtaefayDOVw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=mO2lu85qqfghqHc7yLkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150010

Hi Kuninori,

On Mon, Sep 14, 2026 at 01:46:21AM +0000, Kuninori Morimoto wrote:
> snd_soc_dai_stream_active() (A) and snd_soc_dai_active() (B) are almost
> same function, but implemented different place with different naming.
> 
> Let's move snd_soc_dai_stream_active() (A) prev to snd_soc_dai_active()
> (B), and rename it (C).
> 
> (C)+	snd_soc_dai_active_stream()
> (B)	snd_soc_dai_active()
> 	...
> (A)-	snd_soc_dai_stream_active()

I found this rename quite confusing.

Normally I read a function like snd_soc_dai_steam_active(x, y) to mean
"is stream y of dai x active"? We also have snd_soc_dai_stream_valid()
which has similar semantics.

OTOH snd_soc_dai_active_stream() sounds like "what's the active stream
of the DAI?" (which of course doesn't make sense; could be that both or
neither are active).

I sense you're trying to "namespace" all the dai->stream[dir].active
logic under functions named snd_soc_dai_active_xxx(), which is
understandable, but don't you think the following is cleaner?

snd_soc_dai_action()          <=>   similar to snd_soc_runtime_action()
snd_soc_dai_active()          <=>   is (any) DAI stream active?
snd_soc_dai_stream_active()   <=>   is (given) DAI stream active?

BTW, maybe patches 7-9 should be one patch? It might make the review a
bit easier.

Kind regards,
Alvin
