Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F1B380FCF
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 08:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670337; cv=fail; b=jEGEn+8YYMc4uqCR2DzoqkVuQJAVq+1ABKMLUHEicEFCq2SAJBkoPdm4ZNLbMwIXFF0oTPem+EPCBv6uP3hnrOOUgba0gxYosA+kvJwVFNkaWwYNfrNkRMszqr9S4RrnsbI97lQi7SHl0ySCorJj8VOJu8YAqDLtknCRu+GJm44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670337; c=relaxed/simple;
	bh=X65wTxS153ONun9vzE8BG9ZemOa2T9F78caNuoN5Xzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FzSXN5g4pV8tX8YlyDFk76ySwEfF2IH6pWVgdS1iSRzyextFOSD+7oJAurAj1keh4c1EhknRlycSyLW2zUVhVTgrsDbUsn3ubax0g1NAFO09J2dBjpxJqmawBsn6M4EZ2L+RtvCE8n3TnzG2oCLhmAcpGcA+zL0rmrslLpAPeXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=c+yndmyC; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="c+yndmyC"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Th24885923;
	Tue, 29 Sep 2026 04:25:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=WjlJr
	7SHF4pMfZWf1kjSfk8xU1oSAKWZBVOjN1PVW1U=; b=c+yndmyCLDtq6KSsCbQd8
	7kpJCX9gHUVD/AZDuoaCVBmR3pJc9n68LPyRXmtjHuIfYSX/lzSWUYwpvBvGRR/l
	8OTn94lALmg2Aextyu/Fd3823fvYIiUwpTYvXOMRGDEtfQGdXeUstFbIpuTKrSP9
	7uMJgPCJLz693GTbGpA3q7fkMYLDHHdWF8L6DVdXAnHpTcCB55cwBM3So6qniQ2g
	i+/MEck205Ln9SgV17dKycctBYUbDPdCc3XMhVdBKHbJgl6jKrOhdFXlEriX6cbj
	tqoI1eE+YgmtttW4GKS7bqYLc+p0dZ6M3hjWgX47FWtfOTdl8kcWoPZ/fYEOIb6s
	Q==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013028.outbound.protection.outlook.com [40.93.201.28])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gyugbmmx4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 04:25:32 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZTudublrOOD4oVdUESkO4omLjnzZW+i8ZzUhORMp/YA82bui29/SsHTWzrnfeGprZpvaTMV2x8o9NFkXWs08tHDp97WbUQL8gjyW8w4jnJe9VcDNwiB3O+Lub2Ze8b+V5o7EfFo/xzp/oqswNKES6Gw4I+qX2LvTOJk8T/FFmXTtf2SjXnrJf7qwMTuDKb9MlsLqqXIvjT0kjuVmWNwzpdKA0l2byLapBjd0DBlhvI8HvW+TYwxWIhwLdDBgVn6aGSNwRmrNVvsrADA+Ip6FK9eWYojg7HFuCigJw7MPiEZN/eh+kuWUh/HewJvD6bTqIhsuc1aFNcF5qeau0pbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjlJr7SHF4pMfZWf1kjSfk8xU1oSAKWZBVOjN1PVW1U=;
 b=Wzlv6zKzhxTnOm0SksrvAx6BXsIt4rTIFRTmawsHkA/EfpX4PfkluwYxawrMkVK/dj+TPTnPmiIpC0MrDEJbTld023Wk7byjQITjKOVlOj6+xgnI8x8nBPsIHHomJkpTzgGqb4rw6ZIJP8zphnJEgYdfjdl+SaxfHXIfiS0L+PqsroGWiiCZREE/KdLXGmD/37JxbBB6fEaSNB3wy02267QmxXRp+SEa/ih0zqtGS/E7PBIW7l2A4Y5FiF4ZYhje3ErMw46A5N1nQh3N7Dsgqpb4yKEwEbzJTOR9sIToZi4hlI68cxhIHWcyIGKgl+BI2ENkmF8iLkXJVgBeu0myQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by DS2PR03MB8133.namprd03.prod.outlook.com (2603:10b6:8:27d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:25:30 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:25:30 +0000
Date: Tue, 29 Sep 2026 10:25:27 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/14] ASoC: soc-component: move snd_soc_component_xxx()
 to soc-component.c
Message-ID: <art102opT8OFUc6P@analog.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: AS8PR05CA0024.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::29) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|DS2PR03MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 2351ffa6-2fb6-4957-4626-08df1e03394d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	K/3glZPcrsc402TH18AcwJQH+b9DIh4/GleF8H7UhV9RFZPl3epDiYejlM9NUggiauLx28OxOaTLHSV4KbN4kAOlPU1OArHrEHmktB2KF1NMffAa91kOpZAtvw8HWUBcKZHVbPcO3CF27y3jqi1l/k7Doexbi2Vx8euX3bsZ/HDXRu3ENcG0HuyatuunwZ/Rmh/AgSf6K7Byrc/KNhLJ2TgB221HdFkEe327L9RUJPr+d0HLJBhWN0tzRuyMaoDBAmQVdsx7zfe+7d2512wibbTYg8+J2z8b0g9p9I7TsA1zJQ6IDpXPmPzTEwvgj/dQlHYPEiZYqDU/huVbfep7t/IVgNpHPOTMDWIXYAC4/fPqy3tQDoLpyFrRaFvrzeFazhau3+bJWvmiVgsys/U740gIIrKOvyfQHKNYLAF8d/1pVCoqfrAX8Z3dGGE9oo0Qev9rLxPR3FMbuuJGmixJ3vOgztdIGCYMVxvxm6xDmgnIEKsDYWzTevP66qiN+0KIXXM4Y7sRwQu6u61tNv6KFIoE0yLqrYNxzmiOv2nOCjpd10s7mfMXdC25AndIY07MxBY+keXpcWfqALCU4fa11OMkwoIfcg+sXQSRzhM3jloK7/ZyfjCkeaCNThPWEXjOnpyVPIJ2nI1wLNmSTX8m+XO64jrgq251Hfy49wXgb5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWNPZ2pqbTFIekgyVU8wZTdhUGpSQjJXWHZYbUZ4OHRDMFIvUnd6OUZhNDVF?=
 =?utf-8?B?eGJWTDF5V1hkK2gvZG9QWmVDLzA1dldCeVMxSUlzSXBTYUoyeTRyb00wR3ZX?=
 =?utf-8?B?NC9vRmFTVG1abGdyUDloemsyVExVeU8wWVdKaFl3RjIvN3JCLzBGMTI3RzEr?=
 =?utf-8?B?eVFlVTMxdTJicUcyWUVsdXNFQWRTMDJWemRSbzhEK25iV2k5dUI0aUg2Nndv?=
 =?utf-8?B?MS9NdDRnODRtaHJiWVMxTXFoZUI3ZnJ2ZUZPaTdMWE90UGFRaUNvNFRlVG4r?=
 =?utf-8?B?NWRCRTRpN05tdld3NDJzN1RDSDRJNXdHQjZpK2JhcTRWYkcyNy9Rb0hzWkdU?=
 =?utf-8?B?UnNibm5GdG45enQ2aDl0YWxJbytKYURBRkFWb0p4NmVWTE9LY0lNOWN2R1c4?=
 =?utf-8?B?MWpjQVpPTHBOTGFhQzFLblBaT1NsQ2owRmROWEZ6VkxZUnVkNEw2cTdLSHB6?=
 =?utf-8?B?QjVZYjFmYnhYTW02Z212MEpuM21wS3hwR2tvVkFlTGtMWk1zRW01N1JBMWZH?=
 =?utf-8?B?WkxaL2dXRGdIajJoTjVyOEtWYmJ1Sk9mOHNUc3ZRU3RWMXBac2c2OEhIc1VT?=
 =?utf-8?B?UTlPYXF1aUpYTTJKSm9uTTROL0p1YlBhZ3NBOUlQSlZoeHRWczJiMFpoam5K?=
 =?utf-8?B?VUxMTFIwVjNXZmdwcFpkdm52VWVPK1VxMmpPREZENFo1a0ovS0pacnNiMzA5?=
 =?utf-8?B?RWw2MEFxYU5ieHBlZzB2QlJyWnluNVJPZEp2MVBUOGNnRER1YVlXZys4YVR2?=
 =?utf-8?B?ZHRQcEE5S2FuWkt1SVFSTVdUck5Zank4alNScko1YU9iNDFibm5JQXU3N2Nr?=
 =?utf-8?B?aHljbExFSXRWK3dHM1BVMzVFSE5uQXJ6cHR5MTNkYVBUYVNTTFE0S2VkWUhE?=
 =?utf-8?B?ZW9YSittczdwallQSm0zUVhHaTI2dHJ6b3NMeHRZb0I4WVFqclA4N1FKNlJq?=
 =?utf-8?B?NGtjazRPY3pLYTJhUlNmVmZ4NklTOHRLR2laQXpGOXJaMWVHOUwzZE1ua2tN?=
 =?utf-8?B?aWs4R3VpM3lsSHBJT0RRcVd3b3BnWE5mTUUwM3dLRGNseHloMEZMMXZXSFIv?=
 =?utf-8?B?N2d6eHM3QS9jVnh4TEFTN0hrZXAvYm5pWVQya29vV1NpUGRQTVBxZlNSQzU2?=
 =?utf-8?B?ZXlHK0FUVnJNT0l0M1Vya3ROV3AyMmRKUHJFQ0tYNUZhYm9vL1BiNWI0ODVs?=
 =?utf-8?B?L3ZMLys4elV6aWpkaW5KVUhyWE1xYUk3Y1VkcFhHa0lhT1pBOW9vVXEzWmhD?=
 =?utf-8?B?RFF6THJJT0xxb0o2c0ZzRExqa2VzK2wxbWlaQ2MrcmRYRjFtcEJoYTFiM0Rz?=
 =?utf-8?B?dTdIVjM4RzZqUlZLYndmaVZJR1pEWEordUkrdUdqQk5QRGtudkU2ZWdxOFB5?=
 =?utf-8?B?NlVINWF6VDM5d2RnY0Q2NVp5Q2t0cHJQRVByU2dQWHhUUEltVVpGdWU5S0Fj?=
 =?utf-8?B?S2I4TlJBYk00aE9PcEhUdUl3eExGbG9Td3l0VzJmWHpOVEN0VDcwL2J0Uk0z?=
 =?utf-8?B?MWJSazZjS2J0UVUzWFdhSFBUTUxoMzY0QnRUYkI1Sk1LRTdZaFdkREVHRU9k?=
 =?utf-8?B?UnJ4MjMzODFzaWo2SWpjaWQrbWt5R2plSFNTcE81aEJmcENDUzgydXFWaUpu?=
 =?utf-8?B?bWNzbTl6a3BSRExvY0dGdGVWQTJ6Z1NVN3IyeFNKSnFNQ00vRkdCRVBtM2ow?=
 =?utf-8?B?bHRHYU9oOHZBdHEyWElBeStPVmRsdHA4N0pGKytDdnJQVklBZjZDZVlRdmdw?=
 =?utf-8?B?aHBBbXB4ZkFKclBxK1NvMDdOYmVYWmFaTSt0UVpXUytoSzFoMUd5ZEFQdy84?=
 =?utf-8?B?VzJieVhkbk9RNUg1LzNoZTJid1U1eVBYMEU1azhRQ3FHWXNDenovTGErc2tI?=
 =?utf-8?B?eEdvNG12WlNwWk9yV24rOUlEU0pPcjM0OGl1MHJUeU5pd3BhMEo2cEhjbEVP?=
 =?utf-8?B?R0hnc2syOTlDTWZMM1JScTBIdVBZNGtGeDlrTEFxb3F4Z25JcCsvaCtXRE0w?=
 =?utf-8?B?anNNWGtoZzF0R3dUZWgvUVhjNHIyMnhjTHI5MElJaEN5L3JXSm1BYllpMWhI?=
 =?utf-8?B?U2pkdjhzWG1lZnltOU9HdC90U2RMaHEwRC8rS1pMZ3FpSjlIbjV1VkVQTS9P?=
 =?utf-8?B?OFJBNitPQnRhYnY3eXR3citBVThnWHh5dDRBVzBUM3RNVlNFWnZCelgxZUZV?=
 =?utf-8?B?c3pBYVBiUjdCTWpkSU5uMHloWVhKdXFKV2JQenRFc3gzQkpadk5wWFBYUEUv?=
 =?utf-8?B?dmZIRy9BMnA0ZVRnbTZ5dVhIMnFwL3FRUDB0WVBuQ2VBVDgvVWxjYzVMamdG?=
 =?utf-8?B?Rk1EdDA2ZEJOclA4amJ3MmM0SVVqaWVqYzhjTExTNGpiaTJnbU5BUT09?=
X-Exchange-RoutingPolicyChecked:
	HFbNSKzkBTcpiBZ7Tpm+fXMqch+NxpL/htQ8kgD8k0lz7TVVNdK9P2pUa3nO1LQaTK3jo/r0vS1arDFZ1RhDE0jTtCfJYHodZpBUXMN5tWFtNyXG9aOso54DGzWgIoo10+alYlMwJ6SKrxHCp3AsZbqfrFKO4C8aLmM553K7OvROgT5/JURzzKKiyPOYzVCdvliNQqAYJ0Xd9F5vnbkCFekpkiGzW91+auzsGfi7EpDkvGj9Tno0zfjTkd/xnRRAW2nueD58s1PQmwyjb4OzoFgd750+xKBTCY//pR1tzwfOejwyRENZ1a/V4y0g9VvDyFMv65R0PDx2wlE55kbMTg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2351ffa6-2fb6-4957-4626-08df1e03394d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:25:30.7768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEXkay81xIq+7lBqKP70x5bIFmNUEHwhB+f/yIUNxgPA50VROsVGFLOmuB7Sql8Z9uKVpIeOBVtj3Buht9q8OSL/8kaGky+4Z9FyRLW4uHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8133
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfX6qFlstZHNms7
 prj0HHr7zZKd/e34BX9S0+GzJoeusfe83Tau97cnBn4BVkjsFh24D5ZTrvO7jpg9oclOHp9S7dl
 /6hJ5YsgYLB+63HRQ0Bhssi/HGEL8UJVb1l+HnXK9/JW4ph64ybSPsUZ9X3p6DSimlozlSYnUKe
 AjX7B8ZdukGfTanmF7Tv7iZ1liskFYrBzpFY4XizqPtAuxtWnul8DR9buonBlBVCmcbTNThCD86
 MtumA4F17vC1+qcpDvkVXyVc7pf5R+XwqeYndjaQSZ5dXLJRqdnlKIRfWtDbTFFskFAYwVnbgBU
 yBjKXkWmlkJEzOB6W1xJM0vKJJbP/ZQkHHPhBUe9mPUKAuwAal0o2EBxJtBGN4mvHfK8MoEywRS
 ma9TgA8a+DogpW/XMLAwtf79d8x4PZjd3OlNpyQj9hc+i+xHt8T4fExVcr0Zh31NKdbb0cEaNPI
 MfsF86NrrHoU0Q9YS+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfX6aETu0z9EEo/
 BKVuIvOcYOwOC1J7PFSO7drL6KTPiJnuhfnu+FjZtNAZwrtLio0zsgrGZqZIa0zdV2RsZqJ10Mw
 Xyc/WZPpj8nrjJ5oKHcbjyeukexC5DgV0dxNEMS/pneBAgMWXoF4
X-Proofpoint-GUID: OpmPhsCOiCyfyfj-daPlN3XfUR8rFnwj
X-Proofpoint-ORIG-GUID: OpmPhsCOiCyfyfj-daPlN3XfUR8rFnwj
X-Authority-Analysis: v=2.4 cv=Eexd0/mC c=1 sm=1 tr=0 ts=6abb75fc cx=c_pps
 a=6NHOJSrb2DrgGhcKreW8mw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=gAnH3GRIAAAA:8 a=WJgORdzQa6MNkQrfTXsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290033

Hi Kuninori,

On Tue, Sep 29, 2026 at 05:29:25AM +0000, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
> I'm now posting ASoC Capsuling patches.
> Current status, and this patch-set postion is below.
> This patch-set moves Component related functions to soc-component.c
> 
> x: done
> o: This patch-set
> 
> [x] move DAI functions
> [x] add new DAI functions
> [o] move Component functions
> [ ] move Card functions
> [ ] add new Component functions
> [ ] rename DAI/Component list
> [ ] move Card functions
> [ ] add new Card functions
> [ ] adjust Test
> [ ] use new Card register
> [ ] use new functions on all drivers
> [ ] Capsule DAI/Component/Card
> 
> Kuninori Morimoto (14):
>   ASoC: soc-component: tidyup be_hw_params_fixup() define position
>   ASoC: soc-component: replace bool member to bit field
>   ASoC: soc-component: move snd_soc_add_component_controls()
>   ASoC: soc-component: move snd_soc_component_fixup_controls()
>   ASoC: soc-component: move soc_component_to_node() to soc-component.c
>   ASoC: soc-component: move snd_soc_is_matching_component() to soc-component.c
>   ASoC: soc-component: move soc_{probe/remove}_component() to soc-component.c
>   ASoC: soc-component: move snd_soc_component_to_dapm() to soc-component.c
>   ASoC: soc-component: move snd_soc_component_cache_sync() to soc-component.c
>   ASoC: soc-component: move snd_soc_component_active() to soc-component.c
>   ASoC: soc-component: move component_list to soc-component.c
>   ASoC: soc-component: move snd_soc_lookup_component() to soc-component.c
>   ASoC: soc-component: move __snd_soc_of_put_component() to soc-component.c
>   ASoC: soc-component: rename snd_soc_component_async_complete()
> 
>  include/sound/soc-component.h |  60 +++---
>  include/sound/soc.h           |   8 +-
>  sound/soc/soc-component.c     | 359 +++++++++++++++++++++++++++++++---
>  sound/soc/soc-core.c          | 313 ++---------------------------
>  sound/soc/soc-internal.h      |  14 ++
>  5 files changed, 385 insertions(+), 369 deletions(-)

For the whole series:

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
