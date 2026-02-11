Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013035.outbound.protection.outlook.com [40.93.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC252D94A0;
	Wed, 11 Feb 2026 15:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770823305; cv=fail; b=aOxW0APSC1uxtj9uj4WbOAI/J+jlkRsyTrg3lELBlbhDJwTh2NLImoi3zVZHQ0Cqvn1FQ7nbvD+xtzQd5ghQZV+GMR7i2qlPLGpAK3WbapjI5aqzOzoKLRmbl8xLPpb+Zc3rAzKuQDzSf29W+z6KyJF8idLfRcH/f/E2rFMtoEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770823305; c=relaxed/simple;
	bh=gJmYFjAmO7/G2HmBfIATTmXa7LUiqUz9Dm4pneo107M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JrW2ib7M1XykxKnFcXSo+X7DXXe8LsamCCS5MvAOV2zYihWwlzfgrNz9Npd4vqlBbKd790oC2piCxoN2qlVGoieKYjSg8nCc0Gr83JdeCWj+FjlYNz6sGRPV0PuFkJyktzR5lHHBigwHIwCyDZ+guw2LKzdjaCeuDoP+QmQc1KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rJA9jZFW; arc=fail smtp.client-ip=40.93.201.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rJA9jZFW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlgcKl9zwvuVzdCZqDFMmFCpZHkP8zq05IM8vbKDR2nJudfeVjqpeMw4YYuTen2fAYEP69Bo+RQFcONDGt81w4dYAQW5uy57YooddVG3E4eOYxySDbZjl7yW84uADYaRhKL6BZK2qxZ4Ry6gGRcy8Zpw9ihw6EmdBrm4HNmavfl8ZI0tp5kYPIVi9pWe/ZWRczLRTmzYbmLeT8JDS83dx5GUwO/+Ys34FGDb+PJMsZy/rEk24vSiuYzQeShhe2VZ2wP15WDVYnjEWbhvExV5MtCBpXyQK3rwREwiGxzerwPzSg5Q9Rwil9kMafkPhMbxgFsovJnOimdqv5xdcbg4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afA4bLI1y9Q7mlPq/EBMbvkvIntvHjjRZWDqkYlE3VY=;
 b=avNo7dKxaLfC2GspOdgcfN/oRiDLlTJqzw/aoXjL5XqKHECQiLzw6glRF2gXWRh5hp5VZi/KTgb3LAp5DiXqZesIxHNTHDaO7I1jgdNRRbSH8G967CI4DO2C5aDLmJ2j9dLlBQwOVw4Kmb3tZhQ34c2Ws5MpPGZ6ihgZBfyj0FSwLe1Lr8/5Daksw3zfhI/AHBSFp7gHN8JwgUImEuAcViwhXYQli9wXheqZFQRqPNrnepRRd1fbabUhaez7Gt59IAQgE/wlITLBw04FmS6yca57EwGSiELE7+ZIAZ5iH877zTknvI1U7/Diuf8OXekiIpeEjh3AqM0S0MmfRIs/1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afA4bLI1y9Q7mlPq/EBMbvkvIntvHjjRZWDqkYlE3VY=;
 b=rJA9jZFWnIHo5kemg5ow8YK/ucs4R2ykOVjQPB+JG9ZrD24nR0u7FJgAdloTla600NFkfq+uQQ+V7sGgv78D7mkxvIUWONj+AcDX5CTpRejRxkxCbPn7iOaRNYHgj9eHUVYIrZcbYd2uaXMnuJ07jtG2OatnXhdSPDEdHtMlc7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7588.namprd12.prod.outlook.com (2603:10b6:930:9b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 15:21:39 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 15:21:39 +0000
Message-ID: <a33d3400-81e0-4090-873b-7687acab4893@amd.com>
Date: Wed, 11 Feb 2026 09:21:35 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: amd: add DMIC support for RPL platform
To: Mingyou Chen <qby140326@gmail.com>, vijendar.mukunda@amd.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 venkataprasad.potturu@amd.com, Sunil-kumar.Dommati@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <3487b803-9c65-4371-b83e-c7a24ad45e2b@amd.com>
 <20260211115008.100239-1-qby140326@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260211115008.100239-1-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea9953b-6436-4612-7612-08de69814085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUdnVHM4MlV2T2N3c2ozdGxNM2YzYXJCUURFTkZSY1Q4eWQ1Rzk5eGwxbnRT?=
 =?utf-8?B?clVIc3BTQXlrUU5SaU16WVc4QU9MQys5Y2NLZ3BiRjZPRWcxVDY5NURwS0FU?=
 =?utf-8?B?YnBHdUJRWElOTDVYbUtWMGdsbUFzT3VMZXY1d3ovempkZHArVEZQMEUzaEw1?=
 =?utf-8?B?TVpxVUJWV3dodENRUFZ1R240N1dZWDM4dHAwSVlHWmJnSFFwdDFueTBCcndO?=
 =?utf-8?B?SElYMkppNTVMUTVFNklhcjJuR1liOHBHWnV5NSs3WklQdms4aDN3dEE1Q01u?=
 =?utf-8?B?dDFDaVNNemxJb1NieWFscFZGbHpXaWt3cldWTVBqcEZXQnFVNmVpeGpJdVJl?=
 =?utf-8?B?RWNrWkthV2s3Q1UrQk52VTY4cFBoZDB4ZG9tVnhWcE5iUEpRR2pENElmSlJB?=
 =?utf-8?B?UXAvb08zdngrR3N3K0V1Tm1wWE1HYUNCaUY5cmJuM1ZuSmJmamNDNnE2QVNY?=
 =?utf-8?B?SmVROEc0M0tjY1RaSDR3clp3NkY4UDd2MktzcmdyUHNrNFBaWTE2K3ZxNGg2?=
 =?utf-8?B?QUFOSkloMWt5dXgzeTN6N0Yrd05KaExMNUJxSkYwQzRnV2JrWkcyaEpSZGFY?=
 =?utf-8?B?dExiYVdJdyt5UUtOZTkvd3psSmlZRTY0VTJTSERIOGNpRWxKN2lBK0g0Z1hG?=
 =?utf-8?B?NVRQRnI0aUVrZ0JLM2IrSXlXWTkxanljK1pZaXVwMUI5dHEyaUJpYm56V2FU?=
 =?utf-8?B?b2J1bTgvWlBIdW9obHpud1BWK3NKU3A5N0dlR0FPeDRremdUL2lSTVh5TkdB?=
 =?utf-8?B?VFBGUG15UC9DT0Nma2Jab1hBOWtTRXRLQ2F3elF4SDM0bWl3TG9mQUpRbDAy?=
 =?utf-8?B?NVpDYzBiVXlHWmxZNngzUld1MFJjZWZKLzBlQWdhNzFCdU5MKzU5THRLa0Nt?=
 =?utf-8?B?NHRUc2pPdTV3M2FoRjhXMVhEY1U5UzJWc0dpdUxzQUVDVGxOaDRINXJMWmh5?=
 =?utf-8?B?bUZzNCtQNHBBQTRaTmtRWHcyYVdhY0tOUGRzVmNjdGE2YnR2R1dZWXdtYk5w?=
 =?utf-8?B?YUYrdzR2TmQ0ZWVrNy9SRXp4NWdkNEJsYVhwd1VmdnFqa1FZS0JVYTVJL0Rw?=
 =?utf-8?B?K1VQdStJcWxydFFPSlNDSWFVMmFTend6amRMRkpHVjM0QXUxVlA1a3pMUWwy?=
 =?utf-8?B?QitWUFQzUkp0OFZodU1seUNEZkhTbUxPWlc2MEJMcml6WHRaOEI5NW0rSWhs?=
 =?utf-8?B?L1NweklEeUxIenhVVTNkNVlGQUU2a1JCV2REU3NRbWsvZDJSY09BRXluNU45?=
 =?utf-8?B?TURPVzFCQ0JTaEtrc3RITkYxU1NoYzRjLzdqWnhJMXVxeE53ZlZyOWtoSFcz?=
 =?utf-8?B?SEFVS05PbkttcGNyOFVvVzZhYThreURXRDVVeHgyOXJzcWVqdW5rckpnSTc3?=
 =?utf-8?B?clJxSlkvK045YmdqQmhFWGNZeHE2U21MUnpuaDh5TkYrc0NDUkpGVU1wWVZi?=
 =?utf-8?B?VDNkbFo5L0duQWIwNXE1QnZpL0RDN2Rra2syM1B0WXVlNWJLRjZLcUVPckdQ?=
 =?utf-8?B?N2dqbHltZHlRNStPUEVxSC9aSElVY2oyV1ByQ2VvVjRDc3JpaldKYWlmUlFY?=
 =?utf-8?B?Q3YvYVhNdTRzenNBUjF6WDFzczVlYlBwRGo4eGgvWlFIVFdUb012T000ckdj?=
 =?utf-8?B?Yi9md21lLzB0a2wzcCtRb2Jrd2lzQk1wSnlPVkNzQWRvZlVMSy9kcXJuOVVa?=
 =?utf-8?B?M2xqMjU3TEJLWFpoTGxGSHRVU2lJK0lzeWpsdDE0ZXJTV1lIN3ZmempPTi9P?=
 =?utf-8?B?NGRmVUtpSENRQ3pIUU5LM0NWeDhiRXI0MGFKTDhrS0dGbkN2aDRpRFIvVk5F?=
 =?utf-8?B?c04rbG5mQ0FSc3V3QitMNmR0ZDd2Si9tUXZUbnZYRHgyUjFPeVZrenBqZTNF?=
 =?utf-8?B?ZU42eDc1WDI5MnhQVE1UU1BSdGtFZ1pWNHJKa0VZaUVWRlVZOWFVRUlpVm5V?=
 =?utf-8?B?bkoxMjl4WkJCaE1SQUhsNSsyRnR1YVFtZWFyU3dpVkU0NGFFN0IvVVFZUWJG?=
 =?utf-8?B?UlA0dmxGS3dRZ0MzUUpYMSszcy9PeGc3dWlyR2RhSWtHVk14VTFnR3AvdmZI?=
 =?utf-8?B?bytCdWVSY1ZKSnhpU0FPTkRNZFVtczZScm16L2xlMGRFSnNsVVJsd25kdWs0?=
 =?utf-8?Q?ezvo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk5uNDUvOTFxcVg2OVgxK0U1MmJmSy9lMFcxTWtNQmdtTlB5VlN2MmJpVHpM?=
 =?utf-8?B?Y091V2p4Rjd5QkVUSk1yQVh5YlZtN3VPNGZub2V1WUF1ZHlSUXhEN3hXUGJv?=
 =?utf-8?B?bDJ4ajVqaERMUWpyN2E0bjhhSnQxcGthRlFmTkRSeEJmdEg2WGE5T3FIVmRX?=
 =?utf-8?B?NW1SNzhCOStKdk1qZ0xPVHBHdzJyWlZUNlAwRFR0bWdYL2phaFFJT05SdkZX?=
 =?utf-8?B?MkJ5TldsU0dqd0FZZjJlUkw2RDlOMFJucjRsU3JCWGI1NXpZemhqRmJzNUFi?=
 =?utf-8?B?REkybmxoRENVOHFHeW1vYURPTW5FdEpDZk5ENmw1cjhPUzF6eWs0ckswVUE2?=
 =?utf-8?B?VEhNN1NHWXBQZjZtcTR0OXk2cmdSNHQ0V0dRbnBZbEM0T0daOFd0SnVMb0lS?=
 =?utf-8?B?MTRkdEZIb3lTYTFacHdaa1Iyd0V0Q2NHWjBjMDVRMGl5V2JmM09pWS9uWU1n?=
 =?utf-8?B?YmlLSFpQU054djJDV0hJTCtMUXh6RFNlblZjamxpSlRaY2xjZmRWUVQzcnB2?=
 =?utf-8?B?SE51S1JyMWRJaW9qZ2xCYlJSOSt4Vk5sM0JVbHM5MGtFcUFuaEpoVk1sR1V4?=
 =?utf-8?B?cDA5MDEwd3M1U2VBZ2RxSnplNEZhblM2emludFBjejgxSkJxVGhoWHVqL3FP?=
 =?utf-8?B?R3lXNXB3aFdmaTNEVkRsZVBRT1NoQTVaU0ozcVdvRUJpNEZOOHpGNG8wbjF2?=
 =?utf-8?B?dzZoc2lrRHRLTU40L0dFNHRiNm9tWkkrQ2p0cHlpWGZZYUNWWUZFQnA3OUtq?=
 =?utf-8?B?dTliVUkwcG81cFFVRjdoN29FZlhxcEFOTGFBNFFjb3V0WWoydnVEY3NhdjRt?=
 =?utf-8?B?LzQ0T0J5cTQ1OWxRQUVOMUVDUDFBbXc2MUJZWWk5ZWdRYWpPdDRET2NXQlpj?=
 =?utf-8?B?WHdhRHJnK1A1d2QxVFFrajZtOWhLeE9obEkwbFZ0WUtYVSs0SnFZM28zdHdt?=
 =?utf-8?B?SmprZ29vb2lvVnZMNm1GdW1PZzQ1elhUMDMrMzV2VlFKSE1CYlpQaVVaQ2w5?=
 =?utf-8?B?US83Qkd6R1NqY29oK3FBKytpLytLNTRxWHZLSlF3ZTFWSm8xOEoxbHlkbXpK?=
 =?utf-8?B?VDh0QU9HZDN1MTg4VnJZVnRtdVBCdzVLTWtuWVVDL3VUUXF0ZkVmdXVRbGtW?=
 =?utf-8?B?UjUxZ09hc01uaEtCRzUrcGRYWUhEVXhPWGtWQU5rWXpHZU05ZnljT3luT1kx?=
 =?utf-8?B?dkZOUUpJb292ODZUQ1V1cjdvRkVGU0gwbG82aVhBOHdjanRPSm1oOEk3Mk4r?=
 =?utf-8?B?NXV6ZXBMRWhxSnhsOFh5dER4RkxaWjZGZ0pZeUh6R2JIRkZESmRGTDlBUlR5?=
 =?utf-8?B?NC9DZmpuYTJ4SzlmczJ2TlBBbVdZZkVwMFBYaFhiM3YxWVQ0enl5ZjVIdkVI?=
 =?utf-8?B?eXRKNmFNc3RoNm5XTFRGOFhoZzNKWnQzRFlrcmlSaU9qOTN5MDcrK2V3Nm50?=
 =?utf-8?B?K3ZWTC8zR00zMHdzTnFnMDQ2cDdjWStDblNxYVFXbkRNQVNGRmZlcTVpcjkv?=
 =?utf-8?B?TUtReFI4ajdqSmx5SUhwM3UwSGQrKy9NUHkrdElKSENiRHd3cDVnWCtldFpU?=
 =?utf-8?B?TWJ4WkpQWC9aZ1pOdWxWclZva3h0QVNhYlZxTTNWTlJOOUJGbWNnSDRJdk5n?=
 =?utf-8?B?byt6diswNVE0ZkN2Ri9zSzRYZTFrd0hybjVlNSsvT3YxTGFUbVdFMklWVy91?=
 =?utf-8?B?SVNBYkhJWDFmUG9ZWmR3dWJ3MG4zYy9jMGRISGtjRHdWMkkyRld2NitxYW9i?=
 =?utf-8?B?c0xiZGN4eVRLcW5aRjVHNXMyV25KRGFRWkhPYjNoL2RsUU04UWNTQ0FEWGt5?=
 =?utf-8?B?WEgzMmJURUsxQ0pQdmUwNnVBQXMyeEIrUmN3RmZVQlZWc1FxWjVUOWdZTE1N?=
 =?utf-8?B?SVFiSVF1Y1dnaVAwc2VMUEtlK2JuT0dqTXlpK3FJUkw1Z1VCVlJWREdiMFBH?=
 =?utf-8?B?MmVUdGVKTDdGYzJ5NHpXZzZuRXFwSnE2K3Q3ZHJIdzk0T0grZTBqeHhDNU9L?=
 =?utf-8?B?QUZMa2N3Tktrd0lyd2FBWjFmbVRTTFFpVHdlRTA5ekpFR3RHNFUxTmMra0ZT?=
 =?utf-8?B?eHUwS3BIQ3VvbWkyejV6V0g3Q2tXVTR5aUNyOTVoaklaZEx4NGcwTVhMVjdw?=
 =?utf-8?B?MGpsYjM1WnVCQmpLQVNlb3pJZmIxaFlsemdadm9mUkVoMmxvK1c3VFJ4bGNv?=
 =?utf-8?B?VndLdU1sVXlkZU5QOVhQQTNqb3d5cFFtWEFva1B4NTNyTHNxVWduV1kxbkpx?=
 =?utf-8?B?KzJVbG05bnRpc2hlK1FhOUprYmprMTFFSE1MeWExa3JxMjhCaUVUZDVUenMr?=
 =?utf-8?Q?PNxvOURoExLgaHvjPL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea9953b-6436-4612-7612-08de69814085
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 15:21:38.9546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNZPQlHBmvgY0MG6dMX0U9UCq3uTWUrPnZFw1rxjqUAQaqI0stVRZRWfcmjQEHtt40rqQ6kYL954k+kVi/gewg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7588

On 2/11/26 5:50 AM, Mingyou Chen wrote:
> Add DMIC support for the AMD RPL platform. The drivers are derived on
> the YC platform driver.
> 
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
> v2:
>    - Reverse ACP CONFIG PIN from 10 to 14 for rpl
>    - Remove the rpl folder
> 
>   sound/soc/amd/rpl/Makefile                    |   5 -
>   sound/soc/amd/rpl/rpl-pci-acp6x.c             | 227 ------------------
>   sound/soc/amd/rpl/rpl_acp6x.h                 |  36 ---
>   .../soc/amd/rpl/rpl_acp6x_chip_offset_byte.h  |  30 ---
>   sound/soc/amd/yc/acp6x-mach.c                 |   7 +
>   sound/soc/amd/yc/pci-acp6x.c                  |   6 +
>   6 files changed, 13 insertions(+), 298 deletions(-)
>   delete mode 100644 sound/soc/amd/rpl/Makefile
>   delete mode 100644 sound/soc/amd/rpl/rpl-pci-acp6x.c
>   delete mode 100644 sound/soc/amd/rpl/rpl_acp6x.h
>   delete mode 100644 sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h

Your diff should be relative to sound.git, not relative to your last patch.

That means you shouldn't be "deleting the rpl directory" because it 
isn't there in upstream.

On your local tree you can probably just rebase to drop it or revert it.

> 
> diff --git a/sound/soc/amd/rpl/Makefile b/sound/soc/amd/rpl/Makefile
> deleted file mode 100644
> index a3825c5be4e7..000000000000
> --- a/sound/soc/amd/rpl/Makefile
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0+
> -# RPL platform Support
> -snd-rpl-pci-acp6x-y	:= rpl-pci-acp6x.o
> -
> -obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) += snd-rpl-pci-acp6x.o
> diff --git a/sound/soc/amd/rpl/rpl-pci-acp6x.c b/sound/soc/amd/rpl/rpl-pci-acp6x.c
> deleted file mode 100644
> index e3afe9172bdf..000000000000
> --- a/sound/soc/amd/rpl/rpl-pci-acp6x.c
> +++ /dev/null
> @@ -1,227 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * AMD RPL ACP PCI Driver
> - *
> - * Copyright 2022 Advanced Micro Devices, Inc.
> - */
> -
> -#include <linux/pci.h>
> -#include <linux/module.h>
> -#include <linux/io.h>
> -#include <linux/delay.h>
> -#include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
> -
> -#include "rpl_acp6x.h"
> -
> -struct rpl_dev_data {
> -	void __iomem *acp6x_base;
> -};
> -
> -static int rpl_power_on(void __iomem *acp_base)
> -{
> -	u32 val;
> -	int timeout;
> -
> -	val = rpl_acp_readl(acp_base + ACP_PGFSM_STATUS);
> -
> -	if (!val)
> -		return val;
> -
> -	if ((val & ACP_PGFSM_STATUS_MASK) != ACP_POWER_ON_IN_PROGRESS)
> -		rpl_acp_writel(ACP_PGFSM_CNTL_POWER_ON_MASK, acp_base + ACP_PGFSM_CONTROL);
> -	timeout = 0;
> -	while (++timeout < 500) {
> -		val = rpl_acp_readl(acp_base + ACP_PGFSM_STATUS);
> -		if (!val)
> -			return 0;
> -		udelay(1);
> -	}
> -	return -ETIMEDOUT;
> -}
> -
> -static int rpl_reset(void __iomem *acp_base)
> -{
> -	u32 val;
> -	int timeout;
> -
> -	rpl_acp_writel(1, acp_base + ACP_SOFT_RESET);
> -	timeout = 0;
> -	while (++timeout < 500) {
> -		val = rpl_acp_readl(acp_base + ACP_SOFT_RESET);
> -		if (val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK)
> -			break;
> -		cpu_relax();
> -	}
> -	rpl_acp_writel(0, acp_base + ACP_SOFT_RESET);
> -	timeout = 0;
> -	while (++timeout < 500) {
> -		val = rpl_acp_readl(acp_base + ACP_SOFT_RESET);
> -		if (!val)
> -			return 0;
> -		cpu_relax();
> -	}
> -	return -ETIMEDOUT;
> -}
> -
> -static int rpl_init(void __iomem *acp_base)
> -{
> -	int ret;
> -
> -	/* power on */
> -	ret = rpl_power_on(acp_base);
> -	if (ret) {
> -		pr_err("ACP power on failed\n");
> -		return ret;
> -	}
> -	rpl_acp_writel(0x01, acp_base + ACP_CONTROL);
> -	/* Reset */
> -	ret = rpl_reset(acp_base);
> -	if (ret) {
> -		pr_err("ACP reset failed\n");
> -		return ret;
> -	}
> -	rpl_acp_writel(0x03, acp_base + ACP_CLKMUX_SEL);
> -	return 0;
> -}
> -
> -static int rpl_deinit(void __iomem *acp_base)
> -{
> -	int ret;
> -
> -	/* Reset */
> -	ret = rpl_reset(acp_base);
> -	if (ret) {
> -		pr_err("ACP reset failed\n");
> -		return ret;
> -	}
> -	rpl_acp_writel(0x00, acp_base + ACP_CLKMUX_SEL);
> -	rpl_acp_writel(0x00, acp_base + ACP_CONTROL);
> -	return 0;
> -}
> -
> -static int snd_rpl_probe(struct pci_dev *pci,
> -			 const struct pci_device_id *pci_id)
> -{
> -	struct rpl_dev_data *adata;
> -	u32 addr;
> -	int ret;
> -
> -	/* RPL device check */
> -	switch (pci->revision) {
> -	case 0x62:
> -		break;
> -	default:
> -		dev_dbg(&pci->dev, "acp6x pci device not found\n");
> -		return -ENODEV;
> -	}
> -	if (pci_enable_device(pci)) {
> -		dev_err(&pci->dev, "pci_enable_device failed\n");
> -		return -ENODEV;
> -	}
> -
> -	ret = pci_request_regions(pci, "AMD ACP6x audio");
> -	if (ret < 0) {
> -		dev_err(&pci->dev, "pci_request_regions failed\n");
> -		goto disable_pci;
> -	}
> -
> -	adata = devm_kzalloc(&pci->dev, sizeof(struct rpl_dev_data),
> -			     GFP_KERNEL);
> -	if (!adata) {
> -		ret = -ENOMEM;
> -		goto release_regions;
> -	}
> -
> -	addr = pci_resource_start(pci, 0);
> -	adata->acp6x_base = devm_ioremap(&pci->dev, addr,
> -					 pci_resource_len(pci, 0));
> -	if (!adata->acp6x_base) {
> -		ret = -ENOMEM;
> -		goto release_regions;
> -	}
> -	pci_set_master(pci);
> -	pci_set_drvdata(pci, adata);
> -	ret = rpl_init(adata->acp6x_base);
> -	if (ret)
> -		goto release_regions;
> -	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
> -	pm_runtime_use_autosuspend(&pci->dev);
> -	pm_runtime_put_noidle(&pci->dev);
> -	pm_runtime_allow(&pci->dev);
> -
> -	return 0;
> -release_regions:
> -	pci_release_regions(pci);
> -disable_pci:
> -	pci_disable_device(pci);
> -
> -	return ret;
> -}
> -
> -static int snd_rpl_suspend(struct device *dev)
> -{
> -	struct rpl_dev_data *adata;
> -	int ret;
> -
> -	adata = dev_get_drvdata(dev);
> -	ret = rpl_deinit(adata->acp6x_base);
> -	if (ret)
> -		dev_err(dev, "ACP de-init failed\n");
> -	return ret;
> -}
> -
> -static int snd_rpl_resume(struct device *dev)
> -{
> -	struct rpl_dev_data *adata;
> -	int ret;
> -
> -	adata = dev_get_drvdata(dev);
> -	ret = rpl_init(adata->acp6x_base);
> -	if (ret)
> -		dev_err(dev, "ACP init failed\n");
> -	return ret;
> -}
> -
> -static const struct dev_pm_ops rpl_pm = {
> -	RUNTIME_PM_OPS(snd_rpl_suspend, snd_rpl_resume, NULL)
> -	SYSTEM_SLEEP_PM_OPS(snd_rpl_suspend, snd_rpl_resume)
> -};
> -
> -static void snd_rpl_remove(struct pci_dev *pci)
> -{
> -	struct rpl_dev_data *adata;
> -	int ret;
> -
> -	adata = pci_get_drvdata(pci);
> -	ret = rpl_deinit(adata->acp6x_base);
> -	if (ret)
> -		dev_err(&pci->dev, "ACP de-init failed\n");
> -	pm_runtime_forbid(&pci->dev);
> -	pm_runtime_get_noresume(&pci->dev);
> -	pci_release_regions(pci);
> -	pci_disable_device(pci);
> -}
> -
> -static const struct pci_device_id snd_rpl_ids[] = {
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),
> -	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
> -	.class_mask = 0xffffff },
> -	{ 0, },
> -};
> -MODULE_DEVICE_TABLE(pci, snd_rpl_ids);
> -
> -static struct pci_driver rpl_acp6x_driver  = {
> -	.name = KBUILD_MODNAME,
> -	.id_table = snd_rpl_ids,
> -	.probe = snd_rpl_probe,
> -	.remove = snd_rpl_remove,
> -	.driver = {
> -		.pm = pm_ptr(&rpl_pm),
> -	}
> -};
> -
> -module_pci_driver(rpl_acp6x_driver);
> -
> -MODULE_DESCRIPTION("AMD ACP RPL PCI driver");
> -MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/amd/rpl/rpl_acp6x.h b/sound/soc/amd/rpl/rpl_acp6x.h
> deleted file mode 100644
> index f5816a33632e..000000000000
> --- a/sound/soc/amd/rpl/rpl_acp6x.h
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0+ */
> -/*
> - * AMD ACP Driver
> - *
> - * Copyright (C) 2021 Advanced Micro Devices, Inc. All rights reserved.
> - */
> -
> -#include "rpl_acp6x_chip_offset_byte.h"
> -
> -#define ACP_DEVICE_ID 0x15E2
> -#define ACP6x_PHY_BASE_ADDRESS 0x1240000
> -
> -#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK   0x00010001
> -#define ACP_PGFSM_CNTL_POWER_ON_MASK    1
> -#define ACP_PGFSM_CNTL_POWER_OFF_MASK   0
> -#define ACP_PGFSM_STATUS_MASK           3
> -#define ACP_POWERED_ON                  0
> -#define ACP_POWER_ON_IN_PROGRESS        1
> -#define ACP_POWERED_OFF                 2
> -#define ACP_POWER_OFF_IN_PROGRESS       3
> -
> -#define DELAY_US        5
> -#define ACP_COUNTER     20000
> -
> -/* time in ms for runtime suspend delay */
> -#define ACP_SUSPEND_DELAY_MS    2000
> -
> -static inline u32 rpl_acp_readl(void __iomem *base_addr)
> -{
> -	return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
> -}
> -
> -static inline void rpl_acp_writel(u32 val, void __iomem *base_addr)
> -{
> -	writel(val, base_addr - ACP6x_PHY_BASE_ADDRESS);
> -}
> diff --git a/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h b/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
> deleted file mode 100644
> index 456498f5396d..000000000000
> --- a/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0+ */
> -/*
> - * AMD ACP 6.2 Register Documentation
> - *
> - * Copyright 2022 Advanced Micro Devices, Inc.
> - */
> -
> -#ifndef _rpl_acp6x_OFFSET_HEADER
> -#define _rpl_acp6x_OFFSET_HEADER
> -
> -/* Registers from ACP_CLKRST block */
> -#define ACP_SOFT_RESET                                0x1241000
> -#define ACP_CONTROL                                   0x1241004
> -#define ACP_STATUS                                    0x1241008
> -#define ACP_DYNAMIC_CG_MASTER_CONTROL                 0x1241010
> -#define ACP_PGFSM_CONTROL                             0x124101C
> -#define ACP_PGFSM_STATUS                              0x1241020
> -#define ACP_CLKMUX_SEL                                0x1241024
> -
> -/* Registers from ACP_AON block */
> -#define ACP_PME_EN                                    0x1241400
> -#define ACP_DEVICE_STATE                              0x1241404
> -#define AZ_DEVICE_STATE                               0x1241408
> -#define ACP_PIN_CONFIG                                0x1241440
> -#define ACP_PAD_PULLUP_CTRL                           0x1241444
> -#define ACP_PAD_PULLDOWN_CTRL                         0x1241448
> -#define ACP_PAD_DRIVE_STRENGTH_CTRL                   0x124144C
> -#define ACP_PAD_SCHMEN_CTRL                           0x1241450
> -
> -#endif
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 0294177acc66..de49c812124a 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card = {
>   };
>   
>   static const struct dmi_system_id yc_acp_quirk_table[] = {
> +	{
> +		.driver_data = &acp6x_card,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Lecoo"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Bellator N176"),
> +		}
> +	},
>   	{
>   		.driver_data = &acp6x_card,
>   		.matches = {
> diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
> index 1140ed1cbb3d..296b74252a8a 100644
> --- a/sound/soc/amd/yc/pci-acp6x.c
> +++ b/sound/soc/amd/yc/pci-acp6x.c
> @@ -163,6 +163,7 @@ static int snd_acp6x_probe(struct pci_dev *pci,
>   	switch (pci->revision) {
>   	case 0x60:
>   	case 0x6f:
> +	case 0x62: /* RPL */
>   		break;
>   	default:
>   		dev_dbg(&pci->dev, "acp6x pci device not found\n");
> @@ -205,6 +206,11 @@ static int snd_acp6x_probe(struct pci_dev *pci,
>   	case ACP_CONFIG_2:
>   	case ACP_CONFIG_3:
>   	case ACP_CONFIG_9:
> +	case ACP_CONFIG_10: /* Reserved for RPL */
> +	case ACP_CONFIG_11: /* Reserved for RPL */
> +	case ACP_CONFIG_12: /* Reserved for RPL */
> +	case ACP_CONFIG_13: /* Reserved for RPL */
> +	case ACP_CONFIG_14: /* Reserved for RPL */
>   	case ACP_CONFIG_15:
>   		dev_info(&pci->dev, "Audio Mode %d\n", val);
>   		break;
> 
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377

