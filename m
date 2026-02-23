Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012064.outbound.protection.outlook.com [40.93.195.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C62344031;
	Mon, 23 Feb 2026 05:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771823385; cv=fail; b=LwQ8GQ7qe6EmnglvKrLJlMA8dUMiFt6u3rPOb0U4/YGIE1Rlatgy/ExVeGML8YI3dtX5geFJsMSmtWy9KptlwJn3q9B+4xbqP5gRC2QMwikUmk80ZYwWZdYWfF9d2V+f2NMwnqRinJO9bIfLm2eyC1qGQvhwINy24oRfke97+RA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771823385; c=relaxed/simple;
	bh=KuiXxyZHDyPYq9DUp9cq1eyJ2qkbas7qmvGCz5b6640=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pPDMsUsgGAUi23FxvAjNJYLcJkOdCgdEgw0vqfTUnUIjsy5OkO5a+4zMQf1fFBIFbHKuSC5G2mH1baRTKcD9eDgC+LBIPWPOGWh4tKWrkn0cKLJEtQkggEMRhaQ/YJZasZURTBEULATPZ/d204oMiKEViuHFQKKycSOAYID8L7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JWubXNqp; arc=fail smtp.client-ip=40.93.195.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JWubXNqp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/Iu5xst1fKXNHi8FXbU2guRE7l+KWjJzuVyLX94/zzoXFNQukakDPZppRGOy3pc2qvH4HWjOaV2LPO0kqfRS/cg/vdzv2D27TtlH9qEGGMF1yydyFmYyS256uu+AoTVTXLPHj3xCA/lillUTvzl1ULHq5fwJ+DUAjcE8wwxtNKBcl48lpMNfYH4JzX4vZKVr8SA1kvmggqfx+RFt2jlcJA4DpsPy2u93wYknTl37g6cy9O7TmbE0KX+J3S3or7KJlKGzeFOXSXL8KQ3ZcYXBAl6UDnkO2fyLy74RLd8lZPMZEZ3HU87aVTMl50/EyVweqtPlMT+y1KqMx7IArxzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dADmSa+VI06b7QRFMeoxm0gcF6y+AauG9M5HNHXdRo0=;
 b=R+3ABuOfU8OEtaz0atoIPakjbBakGctQBye2VH8xRFTj/7zLpBWbF1Sc1lfSwO5VaFhut92r6+PRjCXgjcDhBLSUE/PnrAhaWFMP0VcO6Iw9568P1/o32FXglbpSNQJ2Kdi5MJn04Wxqjyt0Awmj5VffweEjJQKrLqJ+qWpuiov6zVHfok69gfTbHOpED2v/uOnk9QssyLAPBHyH4PdzIMlcNinPUKDkgJVLKqcE7E9uiRqO++BmARt1kUSWJVQEzNj0nQ9pPi/BVy7N2ausr/Kq3Y/z4LIU2u/NAjoO+eSW23aoQ8d9zUWKmHlkSFf+t7CU5q3Yzob7xFi8p/x7Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dADmSa+VI06b7QRFMeoxm0gcF6y+AauG9M5HNHXdRo0=;
 b=JWubXNqpUUa+dEM6uVCassDLCJXPm7besWPQ2rPahzpVi6Ulqp1WgmGVVW4yvEGF88rNY9uGuABRDKyF/86m/eYUzBJd1amOI9nRoj+XlgUrWQiV0PoHNNtX9PpiZKHkXw0t/7mHY8jaiTPMT2Q6E1YyoccQxPPUSmHhFAozzHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 PH8PR12MB6890.namprd12.prod.outlook.com (2603:10b6:510:1ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 05:09:41 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 05:09:41 +0000
Message-ID: <4f0b039f-f4b1-49e7-8554-3cdbc6bd866b@amd.com>
Date: Mon, 23 Feb 2026 10:39:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 0/2] soundwire: amd: clock related changes
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260205164539.892403-1-Vijendar.Mukunda@amd.com>
 <34aa5902-8bb7-4f44-a80b-2f2a7a21c1a4@linux.dev>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <34aa5902-8bb7-4f44-a80b-2f2a7a21c1a4@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2af::7) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|PH8PR12MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: aa11035c-135b-40fd-dd99-08de7299bfc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDR5aDJOanJJZWZLL0kwRTd5SHprVllUTk00dDJhYzh6VGdKaXdzcS9tbkF1?=
 =?utf-8?B?NFJIb2dWMVRteU1yV1QzWlZ2L0M0bEZhZW1kUzNsV3QzUWtkcjdZRGp4M3Jl?=
 =?utf-8?B?Sm9tK3BxYjdEZlUwTFRsaUpkRzBZNkVQQzdXSHFHMzdma3VnWHM4RDFxQklN?=
 =?utf-8?B?SU1WeFRZVGRwK2Y2NDZkK3RzaUVoVEpoU0xTU3pxT2JldDlGNkQ5eG1vRC9n?=
 =?utf-8?B?UDExNUJNK0VIb29xQTNCaDE3alJrbWtyUUdEbHdaaHZkYlJnQ0dwUEl1Vmls?=
 =?utf-8?B?aXVLbE14QUVFY05DcHZHUHJhTlRyMVhRanZVeHpGYzZQRFJMWjUvYi9Tc2lu?=
 =?utf-8?B?c3VKM0RmUS91dHFVN0tGZ2JLM2JxVEhrNGFZS2FPZzJtMVNzYVkzdmxEUjly?=
 =?utf-8?B?WFV1WlAzVXAzU3NvbFdUR2xTRlRQN21NelpSdGVJV3hZdWIwd0RNczcyS2lJ?=
 =?utf-8?B?TzRYQ0hXbzZ3dkpjK2JPOEFiUE9RNXBRcWJZUUgwd1djcmlrWUJkN0ZUTVRD?=
 =?utf-8?B?Y0tPaVpGem51T0RRMGt2R2dWTXRwYlNGZktDK2U1RVpWY3RoY3lWNHd0Rkor?=
 =?utf-8?B?NGE3eUMvd1JjZ3cvN2tLbDU3RXg3YTB2ZGxkMFU4azAvM3p6OTE1Q1ZEb0xj?=
 =?utf-8?B?cGxocVhFRGUrOWUrcWdEWXBTbWxwdlduZW1XWkxMaWk3MUFnTXRrR2xVbVBU?=
 =?utf-8?B?d00zMVpETXNkaU1QMHdCN0RQd2VqcFZtT2xvOHM1SEsyYXdSQjhraFNkc2JU?=
 =?utf-8?B?TjBmZDJ4b3VSb1BVT05NVVFUQzVRcGowdG03ZlVaVlRxMEdrZ0xNdjd1RFZq?=
 =?utf-8?B?NXJVMlpZVlhXV3NKbFFPK1F4b2lXQTJpTDVKbjhXSUcwczYxQVBveXdFUjgr?=
 =?utf-8?B?cjRQeVlWMlI5ZXg0UnBVeWlPMkpBMk9ud1E1N2FvVW9NdndmSTVqaXBzUW85?=
 =?utf-8?B?dEtIVWVxZUNUTHVwOWlaSjlTL2xoU29VSlQ1OWtJK3RzakZMajBYRUJQK0ZJ?=
 =?utf-8?B?RXdETHNsMUZ2Rm9FRGdONnZSMXJWQ1kzZkxjWU95QlJBNU1iZzhIN3BsUm0x?=
 =?utf-8?B?T0pWYnltR0tJVE9qVDR3QTl5elJiYzJIREVDbi9nMlFpa0MwOGlmWHVuVHY3?=
 =?utf-8?B?QWlyT2kxSTgvTTZyU2tNSlZmMUNDa2hwZXVQQ1M4UE1lbnllSGdERXBQa2M0?=
 =?utf-8?B?c09SeUpHc01KdW9CSnppVkowcjdXOG1mMHUvSitxNVQxZXEyNHBMZEI4dEFm?=
 =?utf-8?B?R1AvaGxXNkdBS2JiU0FpUkpaZG5OSkMxZWZwQy9qWVN5TXNqYW9pTjdoZlBV?=
 =?utf-8?B?b1p1NWIwckpEMTNXMEVodnpjZTFkb3UvTVlYTHBVMCtpSGJFbUtXMHRONTJm?=
 =?utf-8?B?UW52S1hlSTgyWVZjVUsyZkVXbGI2d0VVa3J0WURkdy92dzhvUmswRHFlVnFH?=
 =?utf-8?B?cTZNdHlydktDTEsyRVN6b0pZNXhnc1NPaXM2bU1GekxsM2FnVWxGVUJ6OERt?=
 =?utf-8?B?UmR5anpLbEQzVTFUZTN5Rjh2L1dwcnJWbFh0c1E4SHRhRWY5U0ZaZVl4WXc3?=
 =?utf-8?B?eDl2bkgrcldZUVNDV2JiZzlqYURjQ3pEU3lqd0xaMFBTZkgrT0JHYVpybStL?=
 =?utf-8?B?YWhrYUxtWTB2NHRoSjNrb2xOcmFkblRic2N2U1lvRXljS2toMkF2bUJNZjNx?=
 =?utf-8?B?c0wyWExlM0tYcjRJa25xZm9haWwybW5EVnZ2MlFacHA3NEFXSHhvRkVreHhS?=
 =?utf-8?B?cnN4c1JaY2xjTGJLWHl5YTVsVjZBUm5Gb2RnZ3NnM3pUMlNsQ0hiZC9hV2tr?=
 =?utf-8?B?eCt5UXlaNEg0RHQxZjNJQzhBY0xKY21IL0dyNVpZcDlzcUhlMlBmbFpCTlAw?=
 =?utf-8?B?TEtSWWNIbHMrdmYrM0hvRm5MTHRDb3JwQWw4aC84RktnK1NUdEJxdUR0VXA3?=
 =?utf-8?B?RU9CTmIzaEttTnlMOGlodmxhc0ZheEpIZ1djeGgxQlZKMllUTVBFWEJiaEdO?=
 =?utf-8?B?RTBRMHVESnVSaExCV215Y2dIYmk0MGlyK3Y2RmJMYmR5N2lvUCtFMXhSMzdh?=
 =?utf-8?B?cHgxVHhkTllMeGt3WHZDUCtuaGRLcExMc2VwVmN2MlBwdHJEYXhJYm1pQi9s?=
 =?utf-8?Q?S2/U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWRNdkVkV05pU3o2dXhWK0NpNWcxNEtTdmdNd21EZVNDUURLR0N1VnpkVDlZ?=
 =?utf-8?B?NlNQazZjZU5zN2gwaVJUTjhOZ2g4NlZnd0s3TmJyZGE5RE1PNDdyQnIxNzBH?=
 =?utf-8?B?QkhlRzk3UUlpR29taHhkelhZWExGRFNPb1ZZMkM5QWJQVUYzOGwxTGgzYUdO?=
 =?utf-8?B?MnFvUXRwdXJxaFhyejVOYm8yeThZZWxNdHFCQTF2ZkNDTFdDS1NJbStUWXZr?=
 =?utf-8?B?c0tXZkZUdVFuZi9CL1JQb3JGMHp0SEJidVZnRmsvV0ZHc2pWOHhBSzNldVpo?=
 =?utf-8?B?WWpTanBpV3BhY0ZKcFc4c2dHZWloc01zWXNvVEFXWWVrc1RiaXIwelhLZXNa?=
 =?utf-8?B?MzZmcldad3RIQjBHZUUyVWRzMlZzamkrSXpoSU43eVl0c3RxeFMxWnRUTlNy?=
 =?utf-8?B?bUwyZ3ZHQ0toajBScU16QWg5c1R4RHVxOHQvcmdiMGY5bDBHM1MzUDVHYlBv?=
 =?utf-8?B?aUhIckpyRWJtMTJjbnV4ZThFM2ZiWjVxVlkvNGtCd2oxQUNmNkpYNE9uanZL?=
 =?utf-8?B?N2wveDJMQzkwdEgxOVdIM0tsM05vR0FzVStJZkRWQjZhQUpLNG9RSmhWQnVk?=
 =?utf-8?B?cmdKTnhHOEFob1Q0alVJQXhsU1RFTHdlaEd0SDExVmYxS3NoMTd1K3BSSm5Z?=
 =?utf-8?B?KytTbVJrTEM4TWRZRjY3Smp5dkZ3NDZuUkFwYUkzUTJVb1lGZ0tSemYxZnph?=
 =?utf-8?B?N3RFK0RnU0hHRXBFcFhXVWQvR3RLa3ptemtQUXJiUkhHVjJrZVZYdlR2UFpn?=
 =?utf-8?B?aWVWM01KRlJ5WFdNbWNHcnMxbmJmbFJKMmk5OUlsRHZBQ2pDWk9zUitiZ29G?=
 =?utf-8?B?M3J4TU0yL2pudURlRWYybzM4ZmhrZmxsa1dMSXNkamdaSTlld0ozMm9obXcr?=
 =?utf-8?B?ZXVQdXhsc2Z2ZmRSNWltMWxrNFFhVzc3REtuL0k5b0ZVVEhWU0FZYXFkemZk?=
 =?utf-8?B?VCt0L01LZVVwRWlyOGNOM0VEbndqc0VuTlFKYUNGTlZ1SDBLcVg1OVlvd2RP?=
 =?utf-8?B?bGIyWnlaMXR3MnhocWo4WFFlR1JIaWIvOXI0VXZvaFRDNlVndTF4NXlRZUxs?=
 =?utf-8?B?SHI2dU55dWJJeTBUZUxZZjdiOUpYdVEwYnFsalZsZ3BVQ3NDUEhQK3VzQUtr?=
 =?utf-8?B?aGd6eit6dEpMU3BXSWVxbXBaMis0ZnRLc2diQzFyT2Npek1paEhNd3NMeU8y?=
 =?utf-8?B?RGJCWFNBNW16MS8vT3lXSTM0eVdJa0xDWnFZbDdCU1VYV01Held4ZDJ5OHNQ?=
 =?utf-8?B?WHVHM096RW5oME5MT05xYlNNeFJjK0lxdVRaMk0xeS9xWXlaZlVFMTllZS9y?=
 =?utf-8?B?UFovbTBxUklkdGxRV2tkMlJHQ0FVWVRGWnlaWmdsSGRjRUxCRlhGNWYwTDh5?=
 =?utf-8?B?NVBEUXg1MG1GMHNwbzY1aEdyZUhzNnJNQUtzTlZPV1QvNDNVd0VOY015R0Iz?=
 =?utf-8?B?MFczSHgxTjN6QTlabjBHMkNHdGUzaFQzRm43YTRoZHQwSVQyODhMSllhOGx3?=
 =?utf-8?B?WGVrMDBtZGZLWUkrcU1ORXNNeUhWTitBWUxmaTV5aCtJMTkzZ1BIYWRNcjlu?=
 =?utf-8?B?YVVxQ3hDaVE5eVFtUkQ1VWhTWW80dHoxaWZUN05jeFlRODdkR2hsOC9kbUQ5?=
 =?utf-8?B?ZWt2bHV5MTZqdnp6OXAzSlFBUldRTk4yY1c5L0g5VGx3NmlBeHd0NFd3Tkx5?=
 =?utf-8?B?akJMdmNJSTVXQlhocmhnY1ZHUzczR0lLR3hTNE1GblZEUDBFOTlXempiNEg3?=
 =?utf-8?B?NDRSUllZbW5Ca3hmUkRJZ1dZQnhtUEpzTW0xa1VzMHQwZDFvMkFseHRlUnpZ?=
 =?utf-8?B?REkrV3J0amxSdHFVMFF1VjZYVHhsUnFhN0tIak5VWk5mZjU1Y3JnOHZQZ1ZD?=
 =?utf-8?B?ZjJNckpJN1ltemNDb0xldE5wZmQ3K2t1ckJLWll6cVJ5MGFLdXNjRTcraXZD?=
 =?utf-8?B?b3FFWWcrVHlwZG8xZDNpdnhhcjdLZGViMENsVDhYdG9WVWpZQVI3MnpQOXgz?=
 =?utf-8?B?Y3NhWnByMUY2eFBkS1pVN1VpcFhEMVI1Ky9UTkh1cGhKVzhHelZZOW1ZVy9H?=
 =?utf-8?B?bmg1QlpHTVBuZjRCTDhvZzgyVUJiQWp6VDY2a1hTUXNGd1dUVEVObnhYL2J5?=
 =?utf-8?B?TkF3Y21PdVZJMFFVa2Zpd1plSW1XQzdWTkJaUmFZNUQxTEJoY09WL1g5VEpW?=
 =?utf-8?B?SHRpdVZHcmo0eXFPZVc4OEUxanZadTc2dHNZbnk2OWh0U2VQQ1JzVXdWK3NU?=
 =?utf-8?B?RXVycDJVWUJ6NGpLd3RVOGMrdDRoTFhQVVByMFdJVzQ4dG92M293bWVFeW1F?=
 =?utf-8?B?OStJRkJ5NXRpTlRteDh2anpVNTNsblNOcTYrcVg2R0dxZlBFRjdvQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa11035c-135b-40fd-dd99-08de7299bfc6
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 05:09:40.9651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOjBJtXeTRhb3o6sYU86lyEjgIpNqXSHpjYnk7lebb4CObrMdwBuqGR1lPmOmZxJx853rri69N06kd36gbpLlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6890

On 07/02/26 19:22, Pierre-Louis Bossart wrote:
> On 2/5/26 17:44, Vijendar Mukunda wrote:
>> Refactor clock init sequence to support different bus clock frequencies
>> other than 12Mhz. Modify the bandwidth calculation logic to support 12Mhz,
>> 6Mhz with different frame sizes.
>>
>> Vijendar Mukunda (2):
>>   soundwire: amd: add clock init control function
>>   soundwire: amd: refactor bandwidth calculation logic
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
@Vinod: Could you please review the patch series?
>> Changes since v4:
>> 	- update commit message
>>
>> Changes since v3:
>> 	- drop unnecessary debug logs.
>>
>> Changes since v2:
>> 	- Update commit message
>> 	- add comments in the code.
>>
>> Changes since v1:
>> 	- Update Cover letter title.
>> 	- Fix typo error in commit message.
>> 	- drop unnecessary condition check in compute params callback.
>>
>>  drivers/soundwire/amd_manager.c   | 109 +++++++++++++++++++++++++++---
>>  drivers/soundwire/amd_manager.h   |   4 --
>>  include/linux/soundwire/sdw_amd.h |   4 ++
>>  3 files changed, 102 insertions(+), 15 deletions(-)
>>

