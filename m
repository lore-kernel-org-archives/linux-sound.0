Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11D23C870E
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479852; cv=fail; b=AVwA34cMSULtXJSlzLDZz57n0AseAm8T9OQDpKVQd1EsWGkjrhLkFfje6zjt9om+KBtMSJkNFuwt1FkhPOxn6VxTICvBtjFnbXnK/eGScQ60BP4gB/TGMm42ScjVrykslGn19/2Gd9wrSqBPaR1dQg4XZq8o5UiFHN1ENOyq24w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479852; c=relaxed/simple;
	bh=iwq2i0TR+OiST3VSj6G0Y9WcuONc3WWeShFMQTUiL1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qvsVvBsC4jfMpAFvJGisYhN9zzviouGlN5Lo6V8jCxLbLPkrvsR4b7Q3XXkWYmyVL32+nVvTXgbzg+fvnNF4E8POx6hM/GsAw8EsCKR6DPFp4A4KmevKxiFA6sZinBXQdj37OZU3kNCrd6VNUsWjOWo+5g6yZYE1aFdYads720E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Wfv9+8fi; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Wfv9+8fi"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FCxPSp1690562;
	Tue, 15 Sep 2026 09:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=7xVHK
	q9TrCa5YI5GMWxdWZndV3lqdvjdxVx7RiHQ82E=; b=Wfv9+8fiB68ontdLW3sZ8
	1G6l0tdYRNeRzivdV/T0MgbYycnQET0PAqZIQmtoTRMGqWKEAvWaLQQoTqY7rLPH
	KAkPuEXxJYjxQ5Nio1yXF8Y5Uj1y9y86+PWvC/nydKj3Nane9EQ9q0XWd+lQC8iR
	nvJyF2c2D8gJUHqGJ4drZyvf0H8YTwJAcF9XJWTmBpF0t+1vVE69T+PEmNzROfFJ
	OO2lng/0plLHKqlLWq0ByOOKrCECdMMJ7cp3PvaAqu+N1xU2y10Rj8d6u9uCI4Y0
	VFgpMzVFynLqrKGzOdebVGdtNt/LKLP7ZGirnC6OtFSJw+Q1kFJdJnZ7AWgAOmng
	A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gq5rjged2-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 09:44:04 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpevMQNQ1VtBEBpYjtkHOrLX25uOls1D0umjnD6TYpq+l36vOEcaMaAf+bTWmu53bDG2fuVJqLWCA91X8KX3UotyUCoyA0WU6bBD4ao0lo8wUYCm3hPSh0GyAAjbckip7slFpawusUOwm+n87uF6HRQHmGD5znpI8VrezMx2AoZwXgIrjFploT/CP1KBQaITsM5FQB/a9EHDr+aeUeDwF8seg6R0PirvhcTM3LlYNtmlc+aF+jTqgWp6LOcwxFY9sEQ5mWumoW1xcmRMxN3IR6fHg+SoOLFRGIZuyuuV32CRclCzdlq+RUesBYBDeYmB64XCrn/jJHaVHuq+MgrK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xVHKq9TrCa5YI5GMWxdWZndV3lqdvjdxVx7RiHQ82E=;
 b=qxmTwO3ngtYfc0I/DskyQHnUzFgeyBcMO+AVBrXQrIM1w0lPsLypko+8ZjbtivxpjgBStFxLzkEgqDktMj4dtHp+s+kQvqc5Ih07XtOA07sBD8YK6bdhoBME1A6FTCu4PKOzerh19PwEfQywiqqpr0+Fh1P45G+A766DxvPmRVjskAiSKdSTDmJDqf6Leu69rznsBXtoM43phGGjP/Oe1zu75rjBycHEXh1BUWebOBsXfy3vyMGowY8zp584yDOHWH14w24aYfwtsao6X+YXudcGb1fLow57w+ouicEB3oV0twMxzYzWJaVqHa1bc2JXkCvxOUrXmKZ9eT9mf4gA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by SN7PR03MB7230.namprd03.prod.outlook.com (2603:10b6:806:2e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 13:44:00 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 13:44:00 +0000
Date: Tue, 15 Sep 2026 15:43:35 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/10] ASoC: soc-dai: add snd_soc_dai_id()
Message-ID: <aqlLeP4Q0MX2hLgb@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
 <87pkyglia1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pkyglia1.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: GVX0EPF0005F6D2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::653) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|SN7PR03MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca01009-f7a4-48e1-4c2f-08df132f5b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lJ7PSagL7cvOog4A1R7HSsjDwukt06xlds3KDV3th2CPrHzl8nUQ+WFM/QDdOVRMjjt1j9VOQwy1gOIkzy0bHgJXzDdog8tjJoLch5n6E1eLhv37+VErzUkzQJnRBuJXpAcb+xcai4gyyI53NLJ+swrsNj3OyL0Q3f1plqD6AcbTRvtkr4AGAqvE8B0GPm1OXim6J8UryavdtwMKGPYKzQ/WsFzjQA2VI49AvnAQlU0jV/FHGUT34CWwKoD1wKLc88jvRo74qFgTBLtEGqqkLLBmoVTkgp2z6M336aBW4t+9c3x1HZEMEn2iGjzpsGROtqLsnuOqse7h0o9FNa7BiSjXFSF4z7rGTxhlKIk50UiMBD+gMuUz+0VKfm6cFDQ+k++veyoUSsOCfbA3MM2cfM8yRdqXS3wPvaFiRu7x7gY1xkwCop3J23dtby0GZGWABE3nbZ6qtyIxF3yAuDJESV/WfbxJXeh7H//uVm6YEYuX60N3reD8RvCU0P33gtZHh5fTb8RFHH3A74MsI1BYKaxRtUyULfVxx12pMFL81VbL//QHf6Zvi5Gzjy9GHLg8Q5rx7VhaT9WS5Guv1NmlI1briqh0SGyZ1AenIj1cxwZtvdV7IVPxUiwCzYBfgygU5zwbtV9pODWFJc7KT75f7aKyVW6/SGGc+2yQtR9PrEM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmpJdGpIa0UzSldxQm90SVR0aDNpZko3VkE2TzRmTnZxbm5RbDdnMklDM2xW?=
 =?utf-8?B?VG1tak8rUm5KNE0vbUpwdHdwYVhnQW13ZmF1TXdRNHE4SSt3YnFYT3NIdklC?=
 =?utf-8?B?Z0hiZVZUMXNZODdMeVN4K0RWOFdJdHN0aGlLbDkvTnQ3MTZkb2FuTEhNemRy?=
 =?utf-8?B?cjZpOTdLQ2VRZUNLUEVFVmVHUmVEUXBHcHhBSnlDd2hLcW9kdEM4bWkySHVu?=
 =?utf-8?B?ZlhkRUptSGtSb0Y3YlMvYXZjRkxTQWk2cFJYVHZXbXN6N0NjL2xoMWFLSXJ0?=
 =?utf-8?B?ME5zenJhaXVQeDNHcHIyK3hnamlzeEJZV3VmRTdUUzlxMnYxcHY0bjlPNEJX?=
 =?utf-8?B?N3ZnbTBlQXI3T2owZFlpYmFoZHJEUW9oc3dYbEo3TlRxQ0JrM1JOdUpJNFli?=
 =?utf-8?B?c2svUFpDQjRya2FidnFSdS9sbXpUcGIrN21sUWF5dVQ3TFpUZHgwdktST3Mx?=
 =?utf-8?B?ZFAwUEdHUSsyZWh1OVdCMUduN0xZTWhzSFNCdXpIeWxEWTdLemNMR1hkUUhL?=
 =?utf-8?B?b3c0enprQ0ZKTWNWMzNseHNmcWptVjNyNDZtNFN6QlFhS0FxazFHYWtuSm1u?=
 =?utf-8?B?V3FFdXFKY2x1cmx2VGxVY2dlQzVRYUVqY1IvSlBIWkltYUhMdnNRVkVNU1F6?=
 =?utf-8?B?SzI0L2h1SWpydXcxRlc4azlHWnJ1RTZDMHpPOEJ3Z1ZmRFdiQnhnNWtlZ09I?=
 =?utf-8?B?aFIxK3NhMTJmSDB1NmQrZjljLzkxUVZtdVRYczdrSFpGOHBaVk82SE5VaXpW?=
 =?utf-8?B?dGVXQVUvWDQrSnRHTXFOQlQ4b1l4VE1COXh4WW85QUNWVHpnaVdYWno2L1or?=
 =?utf-8?B?eDhSV0YvSXkxemppcHpWQkZtM0ZEQW1sSUNhN01GSUxkU1UxaUhHb3dtbTR3?=
 =?utf-8?B?elROWlI4bm8yS0hKOExNbjFnVlBIZnZpRzhFR2dhU2wzVlpRdGI4NmdTSjk5?=
 =?utf-8?B?WTZhRUlGU3Z4ay9KSlNHdVZFR3REZUlBaTBFMVpqNm5tTmdsTzdIRGZMd0E1?=
 =?utf-8?B?cGFGamRRWlBTem53QlZuVlp0WGZidEIwVmhMcUZXUXlBb1pqL2k0dVBPZ3c4?=
 =?utf-8?B?NkdIeWE3QkZMNXlBMDV6QmJqczUzYXh6NzlJeVJyTXczM0ttTzdFUEVjOUx3?=
 =?utf-8?B?ZmVWd2FzTnRScUdLYXVxT0J1Z0xZMk9oK0l1NXlYRUxFWjV4NUZGbURZUFJD?=
 =?utf-8?B?bFRKMGpUWXlaaUpQZllsQ3pRRTIwVU1qM29rZHdPdDlUVml5azcvUEg3Si91?=
 =?utf-8?B?UlM4aklOWWNDVVRzUGZseFhkaWdiWkRkTmNOcEU5VmluYnR5OGp6ZEs2Z1ZG?=
 =?utf-8?B?QkZGbmJzNDluaVNpNnk1MG9JZkEvWTZVWTl6VXo1ZGlrL29YSGE2SFAwL2lQ?=
 =?utf-8?B?OW9LdUJyWThqWEVyald2Z3hCRFVRZFk4UVBiRkJCL1Mwc0ZmYTFMQWFiaWdo?=
 =?utf-8?B?NlNzYldiWk5leGJ1YkZ4d1BqQVdPQStpYXI5RFEycDNyTnd4MURjTHFyRDFP?=
 =?utf-8?B?UjhQdTR5Nm9yVXRnajFvSXRuSnhPTXY2VW1IRTZlMHZYWXUxdHo3K0FGaTNJ?=
 =?utf-8?B?T1ZmNDYvSUdjOWNqNCszWWRKWllqWmpSanV4OWxkWlJxUGZ5MTFoMk1UUDV1?=
 =?utf-8?B?SVhqd0JqTkNiYkFYdFhncTRMRUNwMHowblMydnJqZ2xCWnN0RWxKdDRSc0hS?=
 =?utf-8?B?ZHE5NExiTW50UW1FdTBaT09ZZzJmTnMzRU1TTVJUQ3QrS3F1Z0tESC9MUlhI?=
 =?utf-8?B?WFVvTDV4N1ljR0k1NVJBVWxlWXE1VG1mSmtXUGhINTZPMVRTYzhJQitkVEpx?=
 =?utf-8?B?SERTUkwxeHozYmZMVUZiYjRMZTVtdEhJenM3QmN4dGZlT0l3aTVzWmVLUW5U?=
 =?utf-8?B?MVlBY2FydTRTR1g3bkpuVWNSWFYyblhGZk1hUXQxdzNXdm9mMU1Qam9ldUJH?=
 =?utf-8?B?R1BiYXJsZGZYMmF4a0owTlZpZDBIazE4aUxyRkRDMTZZejJGZk5nVUdkRHkx?=
 =?utf-8?B?K1h3bnlqb3c4MXRpa25RQ2JhbnlvUGl3WCt4aVNibTlBcGVFdm44NnBNV0dN?=
 =?utf-8?B?RlowUmxlU2FBc01MRjVaTCtrM0UzSDNyYVpSYzdMSmxiMFJnZ3BsSEJzMjhG?=
 =?utf-8?B?TVcxOENnd3RhRS9NQkwzNmwvcU5lMVVrcEtjbDZDK0k5S3dCdlJDYjJac2Z5?=
 =?utf-8?B?OXh1ZmdWZmpCTzZvSnFuSG9BeVlwRE5TY0NneGNxODR2dTJtWCtWdTYrUzVr?=
 =?utf-8?B?c1hDc2ZQNVhBeXBNeG9tcmRtaFZ5d2FOdjRwQU90MzVkQzQwMEtQRW9IOE9U?=
 =?utf-8?B?YzB6VG5Pc1pFcUZUd0VxeCtsMHZGeHhHdmFvMG1PRnFkb3dQU3FDQT09?=
X-Exchange-RoutingPolicyChecked:
	2YIEnmu7Ukd4Dd8QeBHaAqKGIodajXHH9fosnyCfDlqJfiisfItVk7iQone1JxqcZZfOUGji0c+qTnhHtmTRdCxCDGetX1z1bbHh12d3PdnjcjVch1UlzU39407yL7yKatjSeG4XEV7Y0P4BmfoOYRbiy3otFHj6+wFcnWRoUDFqprVlwQqGNNAH3N3DWO5t+NcPjiAlexk9VYnDf6FjsL1iwql+cY4DLNncknBccpd6MMjKlETQXEV/VP+3FsnjHPcLsnI+9cDb655SdZYpHp8c2utZdr/Sf2It9um8WdlV9IY3mwbf79vCWv2rFAJjbgphl01K18uvDFTqKjp+Qg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca01009-f7a4-48e1-4c2f-08df132f5b80
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 13:43:57.6307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dF4WgqkftzEahXYaFZjfQy2BkSSvrhek8T9KJ8pHJoYqlU6KfIjMby180Unx/igRlotzTX3/Q1bnFbJGR/s4EWgqox/iMxYdj2LpXdJjofw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7230
X-Proofpoint-GUID: GWP23JqprYR9KdF364o-NLgbXShWEEKj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5OSBTYWx0ZWRfX95MKBS9yWb85
 abF58SCE1CCYa6Himdt5lO7utSStH2q3NOmX4/okGJCP6dGKPXgQz09l729XU/iMh4CYhYedXkQ
 t51I6y7TltKNKjm8QKAlNuTBeZ+2MMPgsvTa2Fn7oL0YQtcDvoMp
X-Proofpoint-ORIG-GUID: GWP23JqprYR9KdF364o-NLgbXShWEEKj
X-Authority-Analysis: v=2.4 cv=Q4ZHcI2a c=1 sm=1 tr=0 ts=6aa94ba4 cx=c_pps
 a=WaebrhBVOVZn7IYqRlctMQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=WqTBSSSdvf6OmJ_7tFEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5OSBTYWx0ZWRfX2dFt4Ykn3tV2
 1AKvqAE2kU5uRJ0cYXyAJTFDdphKnKSX8XF5ur1Z7/zOvjb0/axlKQaUgYdFIOzcqA7Ts87tagM
 3Esq/aSewzwgqddobsIa9LKpaZV06t+Mx09hRIEZShTtOqAHVfn/1pSCdFz712nF6JZxouV979P
 mYe5TV5Z9xF8+39f7WI7MgjBJSBl87rl8cOVg0NjvWIDOc5TxdqDKUwR4/ovGKmAONL5aQmk2cs
 QpiDEcUWa3dLzvUH58fv6zWsf+mhCEbTBS7ERlLtqgquCXLdrk3SdY3O9W0c4hvD5l2XDSq+SpC
 02fWYI4ua0Bx2wOKSMffbxFvVdFmc2Hphi/KoH5NQYKsc48HeMXuu0eeaKWWNXtemoS5GKfWmOk
 MWG+s0kmJpu5sK2Hus/Ci4IbfEUa3cSkyaAVwY71wkN3CW01/wtyLs3i0yiTUl8Xt5eReEioqSW
 K7dRQYJI7NTo+qWEBqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150199
Message-ID: <20260915134335.r0GhuoPG833hSsBr8RKf_L3BTzOdPhcJyJaS8E__hDg@z>

On Mon, Sep 14, 2026 at 01:43:18AM +0000, Kuninori Morimoto wrote:
> DAI parameter will be capsuled soon, will be not enable to access from
> each drivers. add snd_soc_dai_id() to get ID from DAI.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
