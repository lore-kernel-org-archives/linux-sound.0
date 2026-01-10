Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012012.outbound.protection.outlook.com [52.101.43.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D991E8329;
	Sat, 10 Jan 2026 06:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768024831; cv=fail; b=fwez8saz6skAG4HGoa85oKH3yqKR08RywhUrjrcGeV9Wa1UozteM26iEyNO4Bo/Wkd47UG0kkOkWAfYgvuhuTA32dh6ophV0770rRSm8+QJ6hwl7IRS+1Sxws9HS9luU4oYSh/KfQ1bsi9IKKyge6o6jqoWXggv0ChxBkQHYrCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768024831; c=relaxed/simple;
	bh=qiIVyd8kP7+IfKGwLjwOfG1uU3VoqHGme/WJummOmDk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WHrxTEH6QF/Y8eCprs0gWRLWUPXngTaI4VgXtAb8Hcp5aODVHydvo8AVeujtc3cclAMk1xLJOj6W8gQE1o1zQkCxV2S3oGp1EXdNEq0Ge7kArQqEeWjg3FZIh5DmGcwtKFyrN7c28eYnxkBfumAgBp9XckN+Njg7gmq++3jOst0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xm4LQZpn; arc=fail smtp.client-ip=52.101.43.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xm4LQZpn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lL56IeiDnS72PPK//AFDvA0jXNQtsYUPRWI7Hm0zrsp2T0D3IRzYLUme9kXn4glAxI8g0gdSXoKGUxw1OQ5jLe/+H//RP+sdAtufyhncpV4pd6aoHctujTS3+zydbcHtctQofS0x7UJdxO2liH2iZK7nnZO9PGuO7kNAe0TpOsbKWwaTJ0KpMdRw4oxd57nmp5WfRrVbsenIEoZHRdgxaCyDIhyzewVrGvRl+LS5Br0/pTyx3zgUos9QtbEgkMpvc7L0F/6aWyIfS422rLVeHQQXlMvfdBo4k0uk8L122PkAdwL3jvl2vjRaF2W+a10LRZoQIgm2L0WkerrOmAFYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiIVyd8kP7+IfKGwLjwOfG1uU3VoqHGme/WJummOmDk=;
 b=HF6yRm9c43F2KOaDy1TgKaeiOU2WNX8TQOo9Iwa9DvFRCWoBkt0y/RqHhAKGRIO28CkSMdocHrL1Ypy43dKGuTElMTNt/1ES/uEVYgTbI01WmfPjj1tvz9+ESjTkISGwoRI10P/3SFX//GKLK0ZRlDK06sjuOi8yY2tu1sCGvJV1zs+E/vtGmAZ/SKNGyaZAtn/lVqPBOz0+Q3Ff3NmeUuaf+Zh2f+APk2zLDP1kdmk06dT/RD8aknbk5LWZmxhC4kif57tCuq0cNQQ1erugTTL8GYxxSu6eUDx9VHg8dpZkoLxHGrvSK21DSINMPK8/SgBpDV7xr4kD4LBVdNdvQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiIVyd8kP7+IfKGwLjwOfG1uU3VoqHGme/WJummOmDk=;
 b=xm4LQZpnJTvW4TgasZugaaMB3O3tKsuWTa902DamRt6UySN/AOadrYzKZZkKYbJie3mqbOmrhpGVBwlwEFAkP/cK6Z69IUvK4U+aBZ66hkQ3+urJq3rETbHsf0q+E1Rt1K9FZdGOUGoHs54itK6FmA9igjcTKKQrfqSBWC84ePo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 IA0PR12MB8931.namprd12.prod.outlook.com (2603:10b6:208:48a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Sat, 10 Jan
 2026 06:00:24 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9499.004; Sat, 10 Jan 2026
 06:00:24 +0000
Message-ID: <4a00f294-7f2b-4e29-abd5-2f08d7e12f59@amd.com>
Date: Sat, 10 Jan 2026 11:30:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soundwire: amd: refactor bandwidth calculaiton logic
To: Mario Limonciello <superm1@kernel.org>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251222074847.7270-1-Vijendar.Mukunda@amd.com>
 <20251222074847.7270-3-Vijendar.Mukunda@amd.com>
 <17e27498-5da7-4abe-8ce7-a2f828dd6468@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <17e27498-5da7-4abe-8ce7-a2f828dd6468@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0123.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::6) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|IA0PR12MB8931:EE_
X-MS-Office365-Filtering-Correlation-Id: c174967e-8e3e-43f3-d885-08de500d8bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHlZekxHenVwbkk2ZXhNcnlKNEt0RThhTDR1M05vQmFrMS9mWXdZR21aRE1Z?=
 =?utf-8?B?OGllQXo0dXVYdURGaFVvVlhQNTdJVDRZWGtGeEV2SVpyWFd2WGQ2L1R5bmVW?=
 =?utf-8?B?S3VvVU5wTFlYVlAzR0cwZnV1USs1dTRLVUZoekFVbVovVnQyZlFqbG90cmFz?=
 =?utf-8?B?am9sbGVRUjNROFM5Nno2Z29CNmV3UUErYUZ0R3JqTTl2UWt3Zmk5WGdsOG5F?=
 =?utf-8?B?UWlvT3NFdXk1VXJkdVFvSzJvNGNha1B6QVdCRHRsYnNLWVovbHVzME0wZVl5?=
 =?utf-8?B?MW5WZHc3dnhMNDlZNWxYdWNaaEk2S0xtWXpvd1l5RWRWWGorSThVUVNrb2Vo?=
 =?utf-8?B?cERpUGp6a2xCeG5hWXpDbXhHRjAxY0hrMWdtemEzRk9IekJhWHpnZVg1UFV5?=
 =?utf-8?B?dGVyVHo4SGpJa3lMSlF0Q0VCekVDZTRiTkVGejIxNGpMNDVzbEYvd1hleUF2?=
 =?utf-8?B?MnJqV2VPb1ZkT25jZTk2K1c1dnVDTzFjZmNYYnBkYzhHT280VjlTYzFzSUNH?=
 =?utf-8?B?ZE9SS3ExSkFvTGJBZTAzRnB3RStkMzNkVUJwV1dWQ2RkVHNhYXdnMTJlV2dX?=
 =?utf-8?B?cllxRmw5MUo3VGhpODJWMTBRK29xRUJvZEdyU2cvditGOENzZlpvaDdqT0l5?=
 =?utf-8?B?cjY2RUFwbW8zRVJWWEVEZE9PZzFEYTI1R1FneGUyY0hpMmMycDJHWGNFamlR?=
 =?utf-8?B?MW51cUtRdnRxWUFsbFVSdWxrN2ZhbFlvYTZaaHFYR0NaMW5aTkpIYkVmVVhs?=
 =?utf-8?B?bHcxN2FpeEpRamg1aHpBUU51TGdBQ3RmMWlIVk94ZjVyTFRhVXFURU9yRzlq?=
 =?utf-8?B?aEt6aEd4T2pScFVPcFRrYnpLNmQrZGJrd2c3TDJRdE53R3hQdTBDMGliU0pi?=
 =?utf-8?B?MmlVc3BubXRFTWN0L045RWRUTUxYbmdzT0R0bitVUlVDbWpOL2Z6OXZwY00v?=
 =?utf-8?B?SjlBTThURHkxakhNVllwMVlxZkhmM2hHQ3laTW03Zmhob2lBeU84T09ESGhD?=
 =?utf-8?B?c0lLakxWdGtBMUJidzRiNmY5bGYyeER3UDlzQUYwOUpoRnowQVJZeWI0WnAy?=
 =?utf-8?B?d0g3ajB2b2RoL1k4VmlwempMYWZHVXR5Y0tsdG51VkZkSTZaU2s5bVp2cE52?=
 =?utf-8?B?ZVdYMlpwM2JlZkcwUVFZbnM5S0lNUi8wS0p2MVhrU256S01od0xEN0k1ZWFk?=
 =?utf-8?B?a1hCWUVIV3gzeWFaU3p3a0ZDZDVRc3k4U0IvYXpxQXBJcHBaUzJ0ZUhPL3VI?=
 =?utf-8?B?aG1NMXdpczNWRkQ0NkFGQy9NRWRWeGpRc1FTOUczRmIvaVdSMjM4cEdoY0po?=
 =?utf-8?B?a1JrTHp1OXBaUXBkc01kYU81bmNOVklKZUdvM21zRDlxSjVsKzFuNTcyaysr?=
 =?utf-8?B?MlovM1MwMjYvbDFqa0xtZHk0aWY3UGhiVkU3T3pVd1NBNXBnMkU2RGFNa2Q1?=
 =?utf-8?B?QlBnVzN1azR6S1dUVzRKZWdCNkJPUDJta2tmUE0vazVYZExWSXhlaXRqa2hB?=
 =?utf-8?B?NkMvL2FWY1VMS1Btd0VOYkd2R002Q1dBbEtGOWtHMUFOVy9zYnlJTFQxeUZJ?=
 =?utf-8?B?MHEyS3FyR2YvUmd6dk5udlNsNUpKdVdJVzBHVUQ2UlNaTFcwVk0rSEJIUGxQ?=
 =?utf-8?B?NG5yb3B3Z3NBTXVjTVBNYnNSNFdhV0VqWi9XdS9CZWhZZjJQSEtNRXZyYm5r?=
 =?utf-8?B?bk1GSGdsYllzWWtxVllqTFdtRVIwTWt5N2crYkVtbTQvc0tTL2M1SzVJL3g2?=
 =?utf-8?B?aDFrK3hIc1ZlU0Y1M0VsQVF1RUdualFpY3VtdUFZeU00YThyZ1ZxdERNNEg5?=
 =?utf-8?B?a3pxbVdxaEQwZjJwblZmNFJtVjlkNzdTd08zdlF4QXdZRUREY3MwMEFIZjQv?=
 =?utf-8?B?b2Z1Ky9YWUUrTUtQekFPZ1p3SnJmZnVhRUsvUER1Ym0vY0JnY200blY2NEVL?=
 =?utf-8?Q?9w7sbvT9iqr08pShQEyXt2dNVQp7Lao6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFY2d3k1U0lxL01zVjdxV000RzdiUWJXcXNmakh2eE85UjIxY25zYjkxbEZn?=
 =?utf-8?B?MnJqdTNEMWNIeHdKY2E0OW80ZEQvNTRwcGRvcDFkVmZsVVFsRWptbEUyRDFZ?=
 =?utf-8?B?dXg1cHdMZFlMOEZGUTAvcGN2WEZIYm5zMzE3ZExqUFcwOW04dGFCYU9KT2VP?=
 =?utf-8?B?WGFkZ1hkcEE3YmRqNzFEVEhFdTRhUHNIYm1IZE9ESUlhcU5qWS9PbEc0Z2Nu?=
 =?utf-8?B?NGJ4YXFIMGZ3cmJqVW5OQUJDS21YcTFMV0daQ1pOTFBVdG5heXZTNGV1WmRL?=
 =?utf-8?B?d1Z2RlZqc2FhM3E1Q0RYQzlVckhMa1dWNW5IMC93UDdhRG9nNmlBQk9ZUHZv?=
 =?utf-8?B?NTE0b1lqQjgvYWk0c3g0NmxVeTY5Y29RQjhUWmFJT3FXWjBBTkZaNEY3ZldR?=
 =?utf-8?B?bjVydWEyMDVKUkhTN1MwSGVXbWFPbGpaYzRveWJwb2QzaFdGZWhqWm85VjVa?=
 =?utf-8?B?akJUdjdzTHV3UGtnQlZ6Q0s0WGsxdGJaMjFLR0d1cUk2T0E1SDgrLzlFWkU0?=
 =?utf-8?B?SjRoQ1BuQzB6TW9GOTNqWFpPYVUyandUVW9ZUUd2dDI5WWJvQTdEV04wVEpU?=
 =?utf-8?B?YmJtZEQ3N0J0OWo5U2JZQWttcS9nTmh0YlVzN0NmNFNIZHo1Q05oN0hXOUdl?=
 =?utf-8?B?WXVFcEt6bzZyR0NQOTRGS21RM2s4ZHYrNExZcEtFdm1zQUIzWWc3UVVaT3dR?=
 =?utf-8?B?Qk9GbDJiQy9tU0k2bXZZa0lXSlg5Qk1KMzdrSTVtdGVTOGZ5YUpBL0ZxU1dD?=
 =?utf-8?B?ODcvcFE5ZnBaNTl0YlYzWVF6UytsTnYxeTlJaSttQ0g0cVZrNmJkc2RzNmFR?=
 =?utf-8?B?RmdMazhlRVYzRDA4eURkMDVidmxKUDlJazA3Sk5iMk9od0t5dDBJay9zK20z?=
 =?utf-8?B?K0k1aVZOd0cxeTZ5SFRSbVdTM3VidkhkZEgwUDVmVTJNTHBuL3FBN1F0anlK?=
 =?utf-8?B?VGZlUXZWSGszdFpadE5XdVpVZ2F1SlN1Y1dYbUkyNEs2ZnRTSkdLcjVLYXoz?=
 =?utf-8?B?L2U5bGt0RW5iNk0xTThGYTQwN1QrVHhwMG9aTkFPRFZjcGFid3crbGtGdUdK?=
 =?utf-8?B?aGlSL1JEc1BRbVVXNUgwTko2eHB3Y3Y0N3d3c2Z0OU40VFROc2dKWDY4VHVt?=
 =?utf-8?B?R2ZGQ2NnaUV3eHQyb3RmZUxlVWowOWpOYkR6YkVUV1ltWkJ3elp4dGdCRHNj?=
 =?utf-8?B?aW9yYmh0d295cGRYa29HcjZ4SEJxT3BkZGpEek5wWklLZFVZYUpIK1BNYkM1?=
 =?utf-8?B?VGJ5OC9ZWHlnS3JtN1BOcmMyTUVPVG03bzJqWnhpTVh2Zjlsc2tjbnFROC9L?=
 =?utf-8?B?a3VnYWJNamtUMnZsVmlUK0pTMzY5N2NuMGxPTlM4cWFNQnVMT09sOEl3RjYz?=
 =?utf-8?B?MldDOThSNStrNWZ0eXdmQ1VQeHJjOEJNdTY0aFd1Z04wS3dXS1lYM0ZDczFK?=
 =?utf-8?B?V0V1YmwyNkdISmlUeFJ2TFM5LzgrNDk3aTVlQ09hS2tqcWY4a2w1cnR1VlhO?=
 =?utf-8?B?b1JNNXVpcHRyNnUrbkJ2ZnZxTUxVdlJOWm5SQUY4NHlrMndRMGJqSTNqRHhp?=
 =?utf-8?B?ODR6blU4VTBQQk9NWEtVQ3BiMFVjRUlqS2R6UEN1cWI2SFpiTUlacEpkRFdk?=
 =?utf-8?B?a1Z5MllPbnJaUmd3ZkV2b0ZQNUlyMm9EU0d2eEZUakduY1NjVDRKNStWK284?=
 =?utf-8?B?aEtNekEzOUVTYVNOTjE0cDFEQmhuQVdpWjRUZ283S09JTnBKVWhCLzVZT2Ez?=
 =?utf-8?B?TTBSYWtJZlZwVDRGYTdTaHFwZjZBeld4ZUlyMDcrVUFmaFRoQ0FNMDdPeC8x?=
 =?utf-8?B?WGhpVHdlS043ZkZuQW9KTnVQQis2eWpXaGtUeFhRL1VweDM0NW5BVE9QdzdQ?=
 =?utf-8?B?ZTVjWGNhblhVRXc4UmFDclVXWXlBWXVYZzIzQVlRVVFjdE9Nd0Nhd25DMTBp?=
 =?utf-8?B?SkZIQ01DWGYrL2ZQKzNNZTk1SXVBN1VKR3ZvZ0w3VlhjTUg4NlhDb3AwWFBE?=
 =?utf-8?B?UFlMSEk2cDc0eHU1cmxZN25ETThCaFlzaDZxT2RJck9jN1ZBOGNhZmVFbmM3?=
 =?utf-8?B?MVd3bWV2OVhMbUpvQUQ0Y3dnUk9YOWZGNm4vZXJQUzEwc1R0ZWg2c2pTK2lZ?=
 =?utf-8?B?Y3pXc2l3bjAvU1pyYlExSmVzeVRJWlVoUk9PekM1Z0dlbEdab0g3UlkrcDZx?=
 =?utf-8?B?cGlQN2Q3Qy9vNi9RMFJmT1diWVBTL3UwVFhrSmJhYWFSYkVib1J5OGtrWWg1?=
 =?utf-8?B?VkdxNkIwK0UrM0VrRGYwQ1J3Qi9DZ25BK3VKMno0eHVBeVMrM1RtbFN1eFF1?=
 =?utf-8?B?UkU3VFFtQ081S0pUN3RTc1U0N0NtUnNqbHNESHFUaUQxZVU3QkdoQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c174967e-8e3e-43f3-d885-08de500d8bb6
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 06:00:24.3375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YQY1hEWHQ9EHRgJf+yxFVZ67k5oOAXUW3/I//5Cp/A/+sJVvmmKfvLH8TgTIJ6pk9f9+qojZHpmEg+4jwVwRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8931

On 09/01/26 23:10, Mario Limonciello wrote:
> On 12/22/25 1:48 AM, Vijendar Mukunda wrote:
>> For ACP6.3/7.0/7.1/7.2 platforms, amd SoundWire manager doesn't have
>> banked registers concept. For bandwidth calculation, need to use static
>> mapping for block offset calculation based on master port request.
>> Refactor bandwidth calculation logic to support 6Mhz bus clock frequency
>> with frame size as 50 x 10, 125 x 2 and 12Mhz bus clock frequency with
>> frame size as 50 x 10 based on static port block offset logic.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>
> You have a typo in the subject "calculaiton" 

Will fix it
>
> One more minor comment below. With those fixed you can add to next version:
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>
>>   drivers/soundwire/amd_manager.c   | 52 ++++++++++++++++++++++++++++---
>>   include/linux/soundwire/sdw_amd.h |  4 +++
>>   2 files changed, 52 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index ee3c37a5a48b..4e4fd4c31019 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -480,27 +480,66 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
>>     static int amd_sdw_compute_params(struct sdw_bus *bus, struct
>> sdw_stream_runtime *stream)
>>   {
>> +    struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
>>       struct sdw_transport_data t_data = {0};
>>       struct sdw_master_runtime *m_rt;
>>       struct sdw_port_runtime *p_rt;
>>       struct sdw_bus_params *b_params = &bus->params;
>>       int port_bo, hstart, hstop, sample_int;
>> -    unsigned int rate, bps;
>> +    unsigned int rate, bps, channels;
>> +    int stream_slot_size, max_slots;
>> +    static int next_offset[AMD_SDW_MAX_MANAGER_COUNT] = {0};
>> +    unsigned int inst_id = amd_manager->instance;
>>         port_bo = 0;
>>       hstart = 1;
>>       hstop = bus->params.col - 1;
>>       t_data.hstop = hstop;
>>       t_data.hstart = hstart;
>> +    if (next_offset[inst_id] == 0)
>> +        next_offset[inst_id] = 1;
>
> This seems like pointless check no?
> You initialized 
>
Will fix it and post V2 version patch set.
> > +    static int next_offset[AMD_SDW_MAX_MANAGER_COUNT] = {0};
>
> So all offsets will be 0.  Instead this can just be:
>
>     next_offset[inst_id] = 1;
>
>>         list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
>>           rate = m_rt->stream->params.rate;
>>           bps = m_rt->stream->params.bps;
>> +        channels = m_rt->stream->params.ch_count;
>>           sample_int = (bus->params.curr_dr_freq / rate);
>> +
>> +        /* Compute slots required for this stream dynamically */
>> +        stream_slot_size = bps * channels;
>> +
>>           list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
>> -            port_bo = (p_rt->num * 64) + 1;
>> -            dev_dbg(bus->dev, "p_rt->num=%d hstart=%d hstop=%d port_bo=%d\n",
>> -                p_rt->num, hstart, hstop, port_bo);
>> +            if (p_rt->num >= amd_manager->max_ports) {
>> +                dev_err(bus->dev, "Port %d exceeds max ports %d\n",
>> +                    p_rt->num, amd_manager->max_ports);
>> +                return -EINVAL;
>> +            }
>> +
>> +            /* Static mapping logic */
>> +            if (!amd_manager->port_offset_map[p_rt->num]) {
>> +                if (bus->params.curr_dr_freq == 12000000) {
>> +                    max_slots = bus->params.row * (bus->params.col - 1);
>> +                    if (next_offset[inst_id] + stream_slot_size <=
>> +                        (max_slots - 1)) {
>> +                        amd_manager->port_offset_map[p_rt->num] =
>> +                                    next_offset[inst_id];
>> +                        next_offset[inst_id] += stream_slot_size;
>> +                    } else {
>> +                        dev_err(bus->dev,
>> +                            "No space for port %d\n", p_rt->num);
>> +                        return -ENOMEM;
>> +                    }
>> +                } else {
>> +                    amd_manager->port_offset_map[p_rt->num] =
>> +                                    (p_rt->num * 64) + 1;
>> +                }
>> +            }
>> +            port_bo = amd_manager->port_offset_map[p_rt->num];
>> +            dev_dbg(bus->dev,
>> +                "Port=%d hstart=%d hstop=%d port_bo=%d slots=%d
>> max_ports=%d\n",
>> +                p_rt->num, hstart, hstop, port_bo, stream_slot_size,
>> +                amd_manager->max_ports);
>> +
>>               sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
>>                             false, SDW_BLK_GRP_CNT_1, sample_int,
>>                             port_bo, port_bo >> 8, hstart, hstop,
>> @@ -1093,6 +1132,11 @@ static int amd_sdw_manager_probe(struct
>> platform_device *pdev)
>>       default:
>>           return -EINVAL;
>>       }
>> +    amd_manager->max_ports = amd_manager->num_dout_ports +
>> amd_manager->num_din_ports;
>> +    amd_manager->port_offset_map = devm_kcalloc(dev, amd_manager->max_ports,
>> +                            sizeof(int), GFP_KERNEL);
>> +    if (!amd_manager->port_offset_map)
>> +        return -ENOMEM;
>>         prop = &amd_manager->bus.prop;
>>       prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
>> diff --git a/include/linux/soundwire/sdw_amd.h
>> b/include/linux/soundwire/sdw_amd.h
>> index fe31773d5210..470360a2723c 100644
>> --- a/include/linux/soundwire/sdw_amd.h
>> +++ b/include/linux/soundwire/sdw_amd.h
>> @@ -66,8 +66,10 @@ struct sdw_amd_dai_runtime {
>>    * @status: peripheral devices status array
>>    * @num_din_ports: number of input ports
>>    * @num_dout_ports: number of output ports
>> + * @max_ports: total number of input ports and output ports
>>    * @cols_index: Column index in frame shape
>>    * @rows_index: Rows index in frame shape
>> + * @port_offset_map: dynamic array to map port block offset
>>    * @instance: SoundWire manager instance
>>    * @quirks: SoundWire manager quirks
>>    * @wake_en_mask: wake enable mask per SoundWire manager
>> @@ -92,10 +94,12 @@ struct amd_sdw_manager {
>>         int num_din_ports;
>>       int num_dout_ports;
>> +    int max_ports;
>>         int cols_index;
>>       int rows_index;
>>   +    int *port_offset_map;
>>       u32 instance;
>>       u32 quirks;
>>       u32 wake_en_mask;
>

