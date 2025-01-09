Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6B0186E27;
	Thu,  9 Jan 2025 18:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736446500; cv=fail; b=oCKolbtiaXDMzZqgyXHXO1d3UZnHj8r42Jzow6GjtJtB2Dlwy33DabJ/KJWrJV/MRHbfOkCC2TD3GZv31gde0vUegjC2elAL3Yj/FtTRl+/NCSXWQtksXNZQWApVrJqZVjUSKpTbJDrp0HK3ZQlw5Qu8aVwgLOOX3zQBPtGgI7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736446500; c=relaxed/simple;
	bh=JU84S29eEoDvhtnvO0G+GEYfCCgVXMsFqS02/+5XWoQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h+T8+doLehERLnT/eZ5Yoi6qFnvzsgWBLeDeRoiASR7Ulsi++V1Vw76wbneol1VVRBzs90RavyLPuExe9fY05n7xQg3o7yrY4fgFCb7ktEJtVW/sxAjDdFfWwGzGpeGAnCMjVqtkco4jNDGWP/Ntr6pvHRgKiTw1SzEM3NDbuKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kSM6EX3M; arc=fail smtp.client-ip=40.107.92.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kSM6EX3M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCuqKMP/UOD3EaE4e5GJfnGE0xlYzY/548S5MRrXQBEJ+j7bZ/hfKYdlIb5VO/tKTMTqAorM6QCpbujs18mx5nfM7TeuOLOr0ugeDPHf8eSwEiX8VNUjkwjupG5z6QvareSN2EzE/1pSFBUdb87no3hssrC253y5E1DK62JbIAd3FS1Dt4N2fvVeqhJLamH1FmmCRSA3/gBEGd7DTtfCw7f4aecfzNTarXjA2L3zqb4xBkBaL7PtouwMAKHcIuJkSRHaG4moWHCG1bY/yAKhgRz3Vj29S74NMxkjrWGqYnOjbDWPdjVd5M5P6dbwMl9IgFF6y8v3KM1SHXUAUR+YAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0tji3uSUlZjBHFkqTRMTdrUq8vor01CXK8zH8YbfHM=;
 b=ctTF6ZQyRgw7TDUOO026TYsN5B7V2Z0vHCHqNcMmPw/H8Bbs8ZjG5GC2a5h20Waunf2/HovlS6Ehx+/O6mwESz+GJjtphuYv7xVnA7WsOQ2WFMprmnQ70I5uGJSYHPkFn6FS1sUPMTQ1ELlBEax2dioEGxL4AcPIztsfT3fMiY/Zwr70uj4So4EsowAnz5igO0TEZIGZdFV646TBEhRBFYUV5Fc8CXND/GcEt8CeYe9p3/JkC4mUg55J/VGAxuz4yy9CfvTCmUUElgtzRdMz3zXDkrQQxmK1aofeOJ4zLS7sCMQYqYB/CYf8wxYynMkgwF/xhM3TpjoqZlz4jMp9kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0tji3uSUlZjBHFkqTRMTdrUq8vor01CXK8zH8YbfHM=;
 b=kSM6EX3Me8v4ekZRiD0bXI4vQIi3/7gPd1T7A44+OAyrQKAqLYB7nkJgwuAFUqms69OlIfDLTP5sREqouISu15QJda5rQ8EjyiEVA2dX5taFOiMbr0Ts5/nvQT23llG50m4Jc69DqbCf9PV+zjcKvJj94jLEJSDRMS5zsA4gzMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB4173.namprd12.prod.outlook.com (2603:10b6:208:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 18:14:55 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8335.012; Thu, 9 Jan 2025
 18:14:55 +0000
Message-ID: <d77b1111-b113-4e47-bcf5-5584ded1d28f@amd.com>
Date: Thu, 9 Jan 2025 12:15:02 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: Add ACPI dependency to fix build error
To: Yu-Chun Lin <eleanor15x@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 visitorckw@gmail.com, jserv@ccns.ncku.edu.tw,
 kernel test robot <lkp@intel.com>
References: <20250109171547.362412-1-eleanor15x@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250109171547.362412-1-eleanor15x@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:806:21::10) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN2PR12MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: e04ee778-9232-4719-422e-08dd30d984fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2o3cXVzRlNnZi85V2t1U3I5THNobGUxOGgwQm5VTHJlQms2MEJqZTdEeXJX?=
 =?utf-8?B?TFo0SFpTY3FDYzVyNEdyYkZuS0dCTFErTG1vN3F5cWVZWVlOTFBzaE9taGl2?=
 =?utf-8?B?OG10QXRKYXB4M2I5NDd6bzhVOHlwcitGMmJVV2lkVHM3eCtUWWVvZENka0JR?=
 =?utf-8?B?b3ZFR2dYdHpwZ2huQURsb0NsN1lPU05VQVJOTTgwS0VhQkFDN3VFSFB1eGNS?=
 =?utf-8?B?QTk5cU9Jei9XWEtEOU1xWU1WMXZzT3FIZStLR1VYRExxbk5GWkh1NC9PZ0Q2?=
 =?utf-8?B?d01jR0VncVJRMnJmcW1KbUVUbnJMUXljMmEvQkRWMFMzOEJxTE10ZUhFa3Ey?=
 =?utf-8?B?akxOZ2p2MGh2bk81OXFZY3dDV0FzM2NsSEUweXhjdUlJckp2eEdIbW81VFJT?=
 =?utf-8?B?dFhsYmlRZWk3M2VzcGdJTVMvOVRzekhPSzBoN0NhRzgyLzM4dkZiR3pxcmxh?=
 =?utf-8?B?K1dIVDk2b3FvSHdUMFBpOTBZS3JaazdEZW85Vk15MDR5bE4yalFaZFlxSXlV?=
 =?utf-8?B?bjRHNTM0MEdER1RteWUzVktqQnd6cElCeTQ5L1FGWjNKbXo5L210UDBOdXdQ?=
 =?utf-8?B?bDRoNGpGY3FMOE5rRWQySGVaV0FQNWFjTGdrN0NCbEtyRzVjSTVnSVc3Misr?=
 =?utf-8?B?YVNqTlN6enVpbnJ5eVEvcGZUSVpLa3FqTHNENjdZamJ1UWNSeVY4Mkw4M3ht?=
 =?utf-8?B?bEgzb045cXNSSlQ5V3ptbmRrK2M0dlVEMkxvWEpyT2cyaEhGOWtmQjVhYWVr?=
 =?utf-8?B?blR2VExLbzZmTHdKUXAxZ3RaRjFIcWhhWnZTOWpkZGYyT0J0eUJjWXJqQXE0?=
 =?utf-8?B?d2JqZjl6elEwT2I1cXloNVZxTzR6Wk41RDNxQmpjQ0RwME1rY1hDeHJYbzBV?=
 =?utf-8?B?VVpOc2JlREFERk8xMHFDbS90RzFZYkh3RGRDOVZpNXZsbmY1cUlTbWw2TElt?=
 =?utf-8?B?cHdTMk1lVGVjSkZ4Um41RGlNSlVHd1pQVmt5cWVKZGcwVFoxT2RMV3QwOFFG?=
 =?utf-8?B?alB5WFpzMkMwLzlWQ2gyNFVZK2RLT2xwNnFTdnJHcnZCeXNEMEtXOUc0dkIr?=
 =?utf-8?B?MUtVb0FKTFUrZ29nVHRCdmp6MkJIczZaVkN4RnBpNzMvUHVZU1ZHbXY0OUlu?=
 =?utf-8?B?bXVqTmJHeDM0NUtJMzZFc3hUaWZPSDdiV3RZWkxZMytyWUxwVFp6a1kwcDhQ?=
 =?utf-8?B?Q1V1enRmYUl4WlNBN0t5N3F6eTAzOW8xdU94UHhUTXhoN1RlUGQvUkd1aVJO?=
 =?utf-8?B?VXBBdGhTd1lGakd1MHBxQnVmSW5LbnBqTjFvS1daVXNiTzcrK3hoRjFER21s?=
 =?utf-8?B?QytvNEhxVWJnbzk5QmFrS1N3alFKOUppWk5CbnQxVG1sRWM4elJ6ZGRVODVG?=
 =?utf-8?B?dEZBcEN2S2VBUlJPZXBIUmNkZ1puV0Q0TWNob29PWTJZQUpER0g1bDJJR01P?=
 =?utf-8?B?YzlUUDhoaGxyYWxlci9sYVNxc1N5Vm8vejd0RzltQzh6ZSs0cnkzMG9hZ0s3?=
 =?utf-8?B?Y2N6aGhiRkQ0cStTRDNNcnNnTzZiRCtZYk43K24xbjRQaU9SU1ExVzNibWxi?=
 =?utf-8?B?MjR5Wk0xZzJqSzRVMFkvL3FvamxjNlVOYkFhTjVQeFp6Wm9IdnJvOE1CVHh5?=
 =?utf-8?B?SDU2SEhHZUpySXFxNEdEeFl2WHdzcjNna2RPOXRpL1ZFRTBrWWNZMEQ1K2VW?=
 =?utf-8?B?T1Y1TVhGWUpaVGV3RThOUSsxM3puWVFtVVpiMjkycFFNY3BLWUQ1QW9HZ2dW?=
 =?utf-8?B?cDB0U3NqN2pBSjArR0h6QWhVZjIzRElFTHQ4eHRSaitkNmhlbC9HUGpNOVJq?=
 =?utf-8?B?SzBDZnRvNG9JTkRjcDgwMWluNmN2T3BIVnc3eXFjOHF2anBGeGhqSHhOS085?=
 =?utf-8?Q?+sANjQGGXd/Tx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU5zcGhkYUg3TzMvTGUwUVF6TnNQY0xYQUVpcWVjS3Z1SWVaZTNhNWlpWU5I?=
 =?utf-8?B?Z1dRV2pveHRXVzlHMWJvR2dOaytvbmx3T3BiRjE3K1BVUlk4Znp3OGtBemZV?=
 =?utf-8?B?YlRVaEZwRVFCSU9EdmM0WFN2L3NrRHBRYStrUEFKa3hudFVibnhjdHd0MnY0?=
 =?utf-8?B?TTlTQ1lkQ3JKM2ViNzIxZm9JOXNmRnBHT0dXSDJxY1ZjRXh0YmV4RU52TzFS?=
 =?utf-8?B?RFV0V2JwNktyRE1GQzRlOG9TdnZ3N2lkWWtkYmgxa0JyUm1kK3BrdHhLMFdl?=
 =?utf-8?B?NmlmRUNjUlpjaGkzcWY0MEZjVXU1WklDVy8rWGFQUG5ybDNiOFFBa2lvTGg3?=
 =?utf-8?B?VzhBZkNLaWoybEVWSnIrUXJ1cWpBOXVXck1GK1MzbHdwUk9UblBhaXNyaERv?=
 =?utf-8?B?SGZ1TXhRbEFicUZPRFJkclViWTRiMjV6bTBMZjVkRDNiYUZFK1RJRktjSVcw?=
 =?utf-8?B?dXljZ0p2RUVHckROcWtrQmdBMm40cm9VNVVSN2FJcDUxYS91VnNQVGIwUWRE?=
 =?utf-8?B?aXJ3TkxYMXY0clU5Znh2aWVCb2JPR1o5UTJIbjJSczczZTg0ZXdxK0Roekl1?=
 =?utf-8?B?QmdTblk1d0JIVDNONFB0ck9WOFc3cFpFbGkzTmZ3YXRFRDVLVm04eUNrTFNJ?=
 =?utf-8?B?c3NZdEpUTm9RK2VUVlJ0Zm9SeUx5TEs0bGFDK3dselpXMUY0QStVbjJYZHdC?=
 =?utf-8?B?Z0k2aDVHR0s2RUNjekJ6eUJ4Sk5vOXYvMkVEWnVMeHhnT0twQTBaNGdNQ2lS?=
 =?utf-8?B?TkU2T3pFMVprbmFVZWY1WnV5c0ZlYjgzaXNHSHZseWo1dWRYK2hoQUdhMi9E?=
 =?utf-8?B?Nk5zTUtCT2QzbjdwYVJoRWpXcUFoeHNvZ2VMWkxPNHN2cng0b3Nuby9HbWRH?=
 =?utf-8?B?bUMzaXVORDM1SjVFb3luRXJTWHJZRzRJNnArZmJqaFAzYkQxbmJDNWhpdzNL?=
 =?utf-8?B?cmNHS3B1ZCtyei9QYUtqZm5LT2ZJVW9aRlc3OVUzN21NNzRlamRHaERva3J6?=
 =?utf-8?B?QjQzQTVTYkhueXh3VHBaTU9QREhQbnZ2R0U1RVZqK24yaFlFYVJzck85bFN2?=
 =?utf-8?B?Y0VHa2d0R2d2aSt6aWJBL3pVWTRTVUtlZ3V5aytMRlhrdFc5bk1PaUxVMkUr?=
 =?utf-8?B?L1NNN29JWlVvYzVlbmVhQ2o4K0tFTTBBL0JkVlAvY0dpMU5kZXVqQ21SVXVN?=
 =?utf-8?B?V205Mlh5N2RSRnJJby9PbEdyVmVKSFZDRERYVG1FQlpEMjcxNWFkMjR3eFRj?=
 =?utf-8?B?UFI0MndPKzZ1Z1dsdUZpN3U4cVd6R0o2TUd4dGV4Vk1NRzMxR1RWcDJyelJ3?=
 =?utf-8?B?UnVjbE5HYk0xMi9hRGZNQTlqUFo1ZVdjQTBJMVkvZnZKNjNVamtXaEVaMXoz?=
 =?utf-8?B?OHRMVGFCTmtZYkJXaUlOUnRkck5LR2E4ZVNGdis3a3lyY0lVcWdnaWthUlhK?=
 =?utf-8?B?eTl2dGp2WUpuQ1o1c2x2WnJwb2VnQzFEVk1XVXE2cTRKQkZZa1FmVXVWYjNs?=
 =?utf-8?B?ZDdzR21Qd3lCM1pZazVld2gzU1YzQXp3MVdKaXlHUDJyclhsc1ZIZGwrNEEy?=
 =?utf-8?B?OGtiUmFrdWMzL1dRTHRkMW9Kdkt5emJLNnNaNHgzMGlvdXBjMlQ2Sk9hSjl0?=
 =?utf-8?B?d09KMytSYWN5MmJOT2JRU2YyYWtwN2FIRDkrSWIrRDN2Q1U5dnVrakpON3lJ?=
 =?utf-8?B?c1EzYnhhU3VoV1NzaHJkRnlRS0ZxOUtUMXBNekFaL0dhYWFSa08vczJMWjND?=
 =?utf-8?B?TUdVYjR2OU1QUHIxUCtqcHRKcTJWS3dqenVnbDZLSC9LMW1vazcveXI3dzF0?=
 =?utf-8?B?UXQwbkxNbTBmQVA1V3lIY0NTK3VHRE52ZVJjMDlhVGg4Y0ZscW9QVURxbkNQ?=
 =?utf-8?B?cFArUFVzUExtellPdUxiZDg5cldJM0tJOG9Ra1F4ZlBlS0tiL2NEK0QvcmhY?=
 =?utf-8?B?WHRuazdEc2pGWk5ESVZ2TWFwTFJ6dGdRYlBNZ2xjc2wzbEtOcm5TUDF0VUtM?=
 =?utf-8?B?OU04UFY5WkhTWCtHSlFBRDYwZnZScFhTalVHRkUyUkhTSEhrSU93RjNDZjZB?=
 =?utf-8?B?dHdUU0I0MEZxMitTUFduRGV2MTBISy9RajhxVGNMeWpDRTJLdnAyZ1NBU3Bi?=
 =?utf-8?Q?WNUz2lfeYnOWq13To8ITSsAEX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e04ee778-9232-4719-422e-08dd30d984fb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 18:14:55.4899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPOQBrFelv+RxqKbMQWbKWSKwl928PpGuzmGQuePKeP9CPqhmeyCLEFrfKI+O39+KwIfRjUqQDLJo5B0oWtWnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173

On 1/9/2025 11:15, Yu-Chun Lin wrote:
> As reported by the kernel test robot, the following error occurs:
> 
>     sound/soc/amd/yc/acp6x-mach.c: In function 'acp6x_probe':
>>> sound/soc/amd/yc/acp6x-mach.c:573:15: error: implicit declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=implicit-function-declaration]
>       573 |         ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
>           |               ^~~~~~~~~~~~~~~~~~~~~
>           |               acpi_evaluate_object
>     cc1: some warnings being treated as errors
> 
> The function 'acpi_evaluate_integer' and its prototype in 'acpi_bus.h'
> are only available when 'CONFIG_ACPI' is enabled. Add a 'depends on ACPI'
> directive in Kconfig to ensure proper compilation.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501090345.pBIDRTym-lkp@intel.com/
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Thanks for the fix!

Fixes: 4095cf872084 (ASoC: amd: yc: Fix for enabling DMIC on acp6x via 
_DSD entry)
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

I was also worried about commit 88438444fdddd ("ASoC: amd: ps: Fix for 
enabling DMIC on acp63 platform via _DSD entry"), but this was set 
correctly originally in commit 1e4366489e2c0 ("ASoC: amd: enable Pink 
Sardine acp6.2 drivers build").

> ---
>   sound/soc/amd/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
> index c7590d4989bb..803521178279 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -105,7 +105,7 @@ config SND_SOC_AMD_ACP6x
>   config SND_SOC_AMD_YC_MACH
>   	tristate "AMD YC support for DMIC"
>   	select SND_SOC_DMIC
> -	depends on SND_SOC_AMD_ACP6x
> +	depends on SND_SOC_AMD_ACP6x && ACPI
>   	help
>   	  This option enables machine driver for Yellow Carp platform
>   	  using dmic. ACP IP has PDM Decoder block with DMA controller.

