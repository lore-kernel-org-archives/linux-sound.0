Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5121323D2B1;
	Wed, 11 Feb 2026 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770808762; cv=fail; b=PXK9Ko+vXPzg6A0DXu2eE8y7fYEMRJ2WqSlDg7CyBVs7HNaFbDnbhwqIFgyqjuNbnE2wIjFxjqV6GJaM6njiPaRvglIqYXBXdlJPRZroCT+QsMNmQmRlcNt7nXhn+D28kyasClQyz+xmNWMJ2vAGSN54PuFk59TuSNHRK5rIW3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770808762; c=relaxed/simple;
	bh=PdmfLofllJOHZXgkEgvUT/wJEItfsVgSMfNZ7vrmgGM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T1sQdsCoqPRcnSqYB1vqfTiyAX9/Cjy83YNkB0VZjLv9/JTqDiIPBvy3xOSFPAZBk5bpw0sI5fyjVhgMLaCjTOfLDuFXRtkfO3XuIFcJA/2Ud/zDj13c2s7UPSTvXFeTAjAQ5+L8YaakpW4s3O8X5mt7zsvAX+xnvLkIBEh7XNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FOsI0pIB; arc=fail smtp.client-ip=52.101.62.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FOsI0pIB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ni9fRrjURRlrAEyn69dbCrc3cASbv+PiGqxgDTG0UFbrcK2LU2zIrna8cgp+w63tmVkR39emJkRK2KmleJ8YpLUycrMwo53JicEULcKWeyh3KU4xdNpMEhsbJpP84eNVz5rNtNhEWNNjr0rGE0qkcayp2O/ZRTvUBttdnyl2FTyozSaVjovFT9d29M8S0rPqWEKOKTCBNZjryfNXGYMrh6B4NgnAmItjclGdRVKg4ggwUctL1p2XJrpp4vKN4Jp6i2oSJqWfSWj9mVRY3chmabOc/Z8L5lYPNPI9vPCtXeRd76larXhsN1YgUNQHOYmpjzqGGD8zL8s+985wKzbbvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdmfLofllJOHZXgkEgvUT/wJEItfsVgSMfNZ7vrmgGM=;
 b=oDB9yMnLP3nmHVb+lk37rF1vzIINEifKofd1YcbArKiRbIJGVK95tRg2Dw+A1uCTHSd66HAP8fsoOmlCccEOHxvOTc9++iGc27aQzF4ezES4WqcC02EHev8tuQvyIR7ow0jm4ISD+Io7WoBtJkGMFPHyk2GxBslLP6cvi5KVDnP+IwlHbrpyCi3H0l4xH9pkYztPAAMDU2aRL3rps6C3l+0IJ8eWyLvKA3PV+UNxD+O41rJPqe8lFDSb1ez42Jlwp7A/KPtHCSYtUHA8aFNoe+XelhN1yhArGaPHpAd8yid5vYPmTl1eg2vAFOz3RiDPeOahEq+PJufGT3n+mkqW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdmfLofllJOHZXgkEgvUT/wJEItfsVgSMfNZ7vrmgGM=;
 b=FOsI0pIBv28mdOZrmi9BPgtpNbIZA4RBQvx/65XJurF3ZEUn0po5g3pV1Zq3dbPTB7f/gncC+lU6IUhiwYnXO7olfJedByMuvmMK7NkFvhTq00vEXAIJWsoqQ8HqslUnrIAFG9N5dJN/sKujWYg/8cW+QHo1MkgJ0a9rtA+Dw+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SJ5PPFFA661D690.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9ab) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 11:19:18 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 11:19:17 +0000
Message-ID: <3487b803-9c65-4371-b83e-c7a24ad45e2b@amd.com>
Date: Wed, 11 Feb 2026 16:49:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: add DMIC support for RPL platform
Content-Language: en-US
To: qby140326 <qby140326@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20260205020706.29058-1-qby140326@gmail.com>
 <aYYqIjmPesB_bo7j@sirena.co.uk>
 <6967305c-baed-4f0c-8201-b1610bdefd4e@gmail.com>
 <3cf99569-36a7-4ea1-be73-0605043a95ae@amd.com>
 <b30d7bfc-f92c-48cf-988c-b7dda4f56d36@gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <b30d7bfc-f92c-48cf-988c-b7dda4f56d36@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::14) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SJ5PPFFA661D690:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5142bd-a155-46c4-5e36-08de695f6520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0N2ZjdEY0Vvc0V3Q3JtMDI0Q2o3WndKSmpob1VnZGs5ckszTmdjbmdWQ1FU?=
 =?utf-8?B?Y0FXay8yY2w2LzFSNGhCWmxlQlovUXVnNkM0OWljZVJRV2xmV2wxMEk1Misy?=
 =?utf-8?B?a3lhZzg4Q1duQzVPWEdHRUQxVEhoa0U2cUZmZ3lzMDIvR3lNZGUwcTE5M3lx?=
 =?utf-8?B?WDNiWmFtMk5FcFJjVXV6S05odGhWaGg3ZUdNZk91ZzFQZDlVNWo5SFIwTnAw?=
 =?utf-8?B?TmVhWVpYMEpWcXVqRmM0dG1wRlRUZXFhU0RIbzJBbnNlTi91RHRMOEFOcll0?=
 =?utf-8?B?aDBrbE1mN1p4bjQyc2YxNGJhWVlwaTgzSFJUTXB0Sld3ZTNMbkd4TUl5clBK?=
 =?utf-8?B?VDkvTzFVYjdpRHY3Q3RuOHFhV1NtYXRrUDFuRHZqSGdjS01RYmU0TXgzeldx?=
 =?utf-8?B?N0o2KytIS2UwNmdoV25NZWo0WFF3N3l4cFZqVXhCOUloRmR0TjFOM3pldUtV?=
 =?utf-8?B?djZyU2ZkU0k4akxMWk00TXo3NVNIbzUrRG1Ic2w3eVROVnNxVkdqUlgzQzM5?=
 =?utf-8?B?WjFyaW40SmxnR1kxV3Rsb0c5UnNRc2ZFTlM0NDgzV2gwWGhyODRMYjErOFhn?=
 =?utf-8?B?ZUsvdTI0QWJtaHFKaUkyS3g3ME9nejk5b1pmMFF6UW9PdHhPTHpxeXpTeEJS?=
 =?utf-8?B?UFFoZ05yVDlESGZnVC9HbGdEOW5ERHE5U3M3WnVOcnJLQVhSU1dFRDJCMFpJ?=
 =?utf-8?B?Yjh4TEdwRkxyNW0wV0thRTJ3dXdIRXd4cFR2dEFtMlVUQUM2Y2YvNVdCYTlG?=
 =?utf-8?B?V0VwajFWVnNoQis0MzVqL3Zrd3hFNFdySzk4Rk1VOThhL2ZYYXpJaENlQVNj?=
 =?utf-8?B?TEwzT0xHYnJoaHN6aUtiako3NHdnMFdOZ05nT0l1NXo0Zk5BMmhHVHRLbE94?=
 =?utf-8?B?dUY2WHN3bVRXUnVNaWN2SmhlOFpBTUdOQTdiWndhVytkVTJ2bWVBb3U4QzFO?=
 =?utf-8?B?SmFpZUVEY3Q3VVdjdkhZTC9kQ0tndjE3VXhVRS9uTDlzeStra2FzN2pnSEdx?=
 =?utf-8?B?WjFReHVCWGRmcEJLZ3ROSVhxWERaMXVnSU1YalJqOHlyaWh0NTZOd0xzMEVl?=
 =?utf-8?B?R2xvQlNCbWc5TDVPRUx6R2xDRlNHMDZNMWV0RTY3NnkvRi9BTXUzSnR2cHRH?=
 =?utf-8?B?RGZNanhrcFZVem9WTFZtWS81Qyt0TUN6UmZVNUtsRDRCLy9ObXp1QjYvcVVH?=
 =?utf-8?B?emg4YkIxQTBRWEJOUmRoc09zOFVaLzE1cDJvb1N0eUZ1L2pKMC82YU1FWTlk?=
 =?utf-8?B?TjAxSmgzSzRiRXV1SGVNVy9kWE41TWpyS2NrZ3ZoQ0lBelJVWkF5VGg1T0lz?=
 =?utf-8?B?bzBCMlRXWW1GSmpySDhVamhhbDNsbmNxZC81RTZreDVvRFlHNHJlcTFPaVNK?=
 =?utf-8?B?N2ZJSWNBcTBCK1Y0RTk5Mk9GcklkVkFISjJ1QkI4aGoxWDZuYUYzMzdvdVpT?=
 =?utf-8?B?ZGFlYXdHbGVlK2tOcHNRUG9xaXJTN0JUMGs4cHo0ZHpzT2F4SzdZYkFjYlo1?=
 =?utf-8?B?TnVCa3pLQWJhVVJiRFB1UlFwUjJDbVhKR2FLa3JqNTc0ZHgzZEt6SnhYMUVk?=
 =?utf-8?B?d01UNXJHaEx2WHdna2hyN1JjRVJCQzBkaGpVYmZrbi8xNTdyVnpDdEk3eEYr?=
 =?utf-8?B?T3hOMWN5K3o1ODVWTFZOU01hUDgyYVYvZ0VBd0w5SXc3WmRaTzJMaHJ5OVlI?=
 =?utf-8?B?Y1Y0NnFGYUoyUS82Ym0za0lVVlMvWUxHSEc4VVM3N2VXRXlTUkt3N1BSM3l3?=
 =?utf-8?B?cHN6cEhRd0xNbmw1NU92Y1RmMFBJYm4rV1NPVUVLMHlQN2QxS1RyR1lBMTFV?=
 =?utf-8?B?ejI3cE5WcGxnOEFmRG02MG9kWEpBZ3hzcHA5bjlyYnVxbnJBMHY1UXNkZVZV?=
 =?utf-8?B?TXg4RmR5YVhpS3M4V3BmUExkMnhaRmd3MmdhaXBocWg3RlI4NDlNNjI4OTJZ?=
 =?utf-8?B?M0NnSDZ6Qkg3clU2UHkzb3gvMVEwMGZ3c0x2MXVHZjk3Y1k2bCtvYzVLUmpC?=
 =?utf-8?B?M1JwY0RzTHZwNExuR2Q5K0hyd25VUW5GNVlTeXhLbTVJNVdKQTJpenpGbFZM?=
 =?utf-8?B?RVFwbG1Iay9xeTJzVTY1M2ZNbHhVYlhsWExsSXR3VzZTRG83d3NXVWhIeTMx?=
 =?utf-8?Q?bP3g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTZYOXFqK0w2YU1lSHFVN29NYlNKbEdoMzNuM0ZRMDBqMkk0QjNiUmxhQTda?=
 =?utf-8?B?eTVMUndCaGR4ZnVGcjZ5YlhOSjhWSXIyQVZmZ3NQamxFcHBDUy9PLzFZS3Bq?=
 =?utf-8?B?WDUvYm1EeUc5N2UrTXJQWHl2cWo3RCtRMFZBVU5NdUtzbFZhYmloRWZVUXVE?=
 =?utf-8?B?MWtCTHRaUkVtMlZwSTR1TU1jZGt1YW1iZ3VuVUdxWGtCZ0N0cWxicXlXRUN5?=
 =?utf-8?B?RjYvMW9DYXlneTRJakNhYlloYzRZM3hBcjdESE4yQVRhZU83MDBKcHZYanZj?=
 =?utf-8?B?ODA5Y3hTQTUyUyt0aE5uTEh2SXd4NFVzTVFtc2RuWldCSWptTTZEU28vdmNw?=
 =?utf-8?B?bmx2NUdzWDQ2Y1MvZk5RbEgzcWIveTFuWjRFUm9iVmVNYWdPYWZVNXVLMHRr?=
 =?utf-8?B?bmhRZlA1MmhsdWlpWWt1UkQrM1NhNlZ5Uko5dExZWFV1aFVNSVdkbWk2a1lD?=
 =?utf-8?B?NzNjNENwNWc1TllUTXJJQnBsWEcxeDFrNXN4aWJERFROY3FaazlqUEQ0OXR5?=
 =?utf-8?B?RlRlbWtlKytpb2R0em82cVFXRWlhTm1QQlVwelFrZjZ2ZlFNRm1yU2dQeW5a?=
 =?utf-8?B?dW1XMFBId1Q1c08yY0I0NExZM3p6OW03WVlqOXpRSDFUL0s4WG1tVFNubXd5?=
 =?utf-8?B?eFltRXMvU0svWXdBTGVWb05YMjhLbm9nb3EzcnVMUkhjOVEzQ3Mzd3JRVHcx?=
 =?utf-8?B?akZ4RUNlbjNsQVdMbm11cVV5UXNMR1kxSHZOYzQvWDQwdTV4UENwUjhMTnpv?=
 =?utf-8?B?QlZhVFlPMFFucE1KN3VFY0hVUDNobTVPTkQ4d3pQc2NhMnIyTkNmTUo1VHEw?=
 =?utf-8?B?aUd6b283QVpQckw4WHFzTmU3ODN0NHQvYTd0d285R0ZVWmgrUU9nU0dON1dr?=
 =?utf-8?B?MUVkQmhLc0lObGFCNmtWS0paUGZyMDJndE5TSENlU2lNQUlGU3BiNFYrelYv?=
 =?utf-8?B?anlFODdkQk9nMXdZQ3h1RnBsMW1RQ3BTNUVYdnhNb1dIc1ZmMDYvSXdPLzE2?=
 =?utf-8?B?OEtlcUJxaHZVQjhveDFiVWVSc3dRL2M0R0hNeElEeVZtNGNiZm9pWUZjWHVq?=
 =?utf-8?B?TmVVUHB5RW13WHRsMUV4Y2VyekhkYTl5WWx0TGdCbjhzdjI2WU5XTW5kTmta?=
 =?utf-8?B?OUJZQVUzYlZTVTJhZ1J2R1pTaGg3dHVWdHJhTlpaSXo1Z1ovbFlsTk5DSjJD?=
 =?utf-8?B?bytmcHYvS0l0eC9wQVMrSE5lSVhHR08xWHVSZXUrQmRXRDhuZ2NWVUNlejdG?=
 =?utf-8?B?OFFSSUtlSjNkdXNIcnFpNThaalo3TWQyQUJ6UGdUc3lPM2JTZElocHhtZWJK?=
 =?utf-8?B?SjArcS8zYUhudWU0ak9GeGNWRTdRU0IvekJkUWdPR3NXYWdnTVFPY01VWXpL?=
 =?utf-8?B?ODFIR2tJWHRmb0txc1FrcitIb29heXN2WlVuVTZlcnFTUGtWa2JiZHVEQnJj?=
 =?utf-8?B?NlF1MWh3UTFWc0ZaMmRQdXBMUXlPRHpNaEkvZ3JzVFZ3ZnVOemtJSkxsZDlQ?=
 =?utf-8?B?bWVTTTN1YkxOMElNVERZYW1MOTQzYk9VRWp0RHBUS1hSZEZabXVQUlFBWGRl?=
 =?utf-8?B?aTFBZkdobjJKVG5iUHcxOXI4eHpHTFA0QzZ4blNYWTNkTEpmQkdQRnRqM1ZH?=
 =?utf-8?B?azIzcGQwemIvY0piWTFBRTZZNi9MYUFRRFh0aGVQZHU0SFVtUE9hYlNGSXZS?=
 =?utf-8?B?SGRqU3E3dTFQaUlyWjBIbEwxNnp1a1JETHpoSWhmRTBiL0E2U09zRFBmZkRO?=
 =?utf-8?B?L3dzVHhXeXVlOE9DQk1oN2ptYzgxc0tGSUVsbThjTWV1dnMwV25GVlJVbnRM?=
 =?utf-8?B?MnBqeUdBWTZJbS9aUHJGb3NXQzJTRitGaXNMM1NJQjBGT3F0VHM0dzVRZTFZ?=
 =?utf-8?B?aVlDaithMDh3ZTQ3eUNwYnlOYnp3SlA5dHJMa05jZFpKUTZ6RDdjL0hTclRL?=
 =?utf-8?B?YTc0cTYrMjM1dkRZSkRyQ0VZVHNINUNSOTRWRGNvZW5SWHRqeXd1VEhDdzlN?=
 =?utf-8?B?WWdaN2xkZnhqeEZMS0xFSWt2NGhJRFM4VUZVNUZtM3ZJRUpzMmErT1VFeEd0?=
 =?utf-8?B?bXFORURnS2dsSWtDdDI0Z0dQZXRSQjBNcG01cGJHTjF6MWU3VDk5bkFEc1h1?=
 =?utf-8?B?YXQ1S1dDSGQ0bVY0dW5RMDJvMHYrZ3VkSS9PY1ZwRTFKdkp3UlVQRWxEdExm?=
 =?utf-8?B?TGdQenVWV2swZk5qUkwwQ0lQN016QlZOYnpFMlNBbDVwMjJ5cnVxV3d4V2lW?=
 =?utf-8?B?NlFiVk9BWGpmTFBVTEdQR21CZEdGRE9xUFVrczRZWVNEVVl4Nnh3ejB3d1cw?=
 =?utf-8?B?TStBT3RQM3ZBUXlqRCtBaDdmQXk2cThZczc4YlFaOTMzWFo3UWFvZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5142bd-a155-46c4-5e36-08de695f6520
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 11:19:17.3811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBKQRic1nDsaFHWtLknNTIiUclVVfTgqtkvSdXab5ZFm+1NTBZPx1rO+v4ZRHRSiEaX5LiqOqj4EmYOhsZhK2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFFA661D690

On 11/02/26 16:16, qby140326 wrote:
> On 2/11/26 17:22, Mukunda,Vijendar wrote:
>> There is minor delta between RPL and YC platforms for ACP PDM IO enablement.
>> No need to duplicate the code.  You can include support for RPL platform in
>> yc folder itself. Most of the YC code can be reused.
>> We can completely remove the RPL folder itself.
>> Add extra checks for ACP PCI revision ID.
>
> Hi Mukunda,
>
> Thanks for the feedback. Could you please elaborate on what the 'minor delta'
> specifically entails for the RPL platform compared to YC?
>
Except ACP PIN CONFIG values, for PDM IO validation, same YC stack should work.
All you need to do is add ACP PCI revision id for RPL in YC folder and check my
review comment for ACP PIN CONFIG values for RPL platform.
