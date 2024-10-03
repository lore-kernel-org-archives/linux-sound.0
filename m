Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1141E7A724
	for <linux-sound@vger.kernel.org>; Thu,  3 Oct 2024 06:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727937509; cv=fail; b=itMJu1WSj0ipwQbTHDTvj1ll1Cq1NPlY0iFYQXQVk9kcDXhyGOZOuBYhXahvzisL8vjquc2zihlVpKFQCTLpMPiXpCGZEA1Yhjr7q7huL6JnRVV5rZGOe+Di6pIEgsr56TLcviKTO80aK84LTbIygDZbeoD9tTYACFqHH465nGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727937509; c=relaxed/simple;
	bh=1EP6tozyr32Ju9mgeKo5SG6af67SwNR6fZ9LxJAqhRM=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uLLx1hi8Lgsz0qwEr4nTBnwov/JZsM6JtIgNyIFpDUveBtLfw+fFulslAIjCz5+EGS/GCuLrrx2y6PJ+9adjZ6mibz0FLCuO+W9mth6tnDN03v3/tJzqnnPstC+wbKDsBzyRLfdTBrYuxkRxMltWA1Nk/01a7fOMBYwujPZjjO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hQmsPFp+; arc=fail smtp.client-ip=40.107.93.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hQmsPFp+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKRdy+8ZBfVJQnVOPcQr0ledC4SIi+iKrIWfJa2y92A81cIDzJGB8e7KJJJHj44YA+GjJuee0+pfa3oz970qzygZyB9shrVYa0kIHkLIN5kQsLVqwGOKW+R/ceWncirMHNLAUEusIDfRP0AuaRn0drRgDDMcqPHHEq90DFpQa47eR/18FEAjAKSnoLkvJ1o9MmPIyz6LUPar9GPTfpN7FtioGH1woYpkOaaTKXD1WwSL0oRDjoZckOwooJBhZOB04GW6WH4r/72AbgVdS0zPUVcKOfOOvXRkwjByc5fJPVBjgGdVsIJLfON6dtH2nPTDv0bbMJ5EPcSomOSRJ1AdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgN2pf76QQPohXFpwP9+X26OrZ2WSQxY7b0ngQVZT1A=;
 b=vRrVGJd6z1XOOlwf43E1OQy1QAoSaaKZzi19y1c9B1rrCj1xTPbJrBH463vtZUJjdKLeymrjYsLLbOR+Jf8Yg54pU/BzOOS/77mGuHEBKiIMV0LIPgX/iX0SO5xb5d8Bez+jAZJpSXYFAqUPCk2y71Hy7CY1/bHz0oEklOZDH61AmffXOJrQDdvRJ7pOituXJqAkwzkhDDZJamKs1azwcSaueC8VcwPk60SBAXstR+Eo2Cvf29q931L2pXw1TGjzrGVHI332Uh4+Xdvfw0TpJMt8Rb0NBwLhfXUkB3Er+t0WDnxVLQdGB+lTuJ9dTPQfwvw1NTpP7g2AGGDiS2QD8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgN2pf76QQPohXFpwP9+X26OrZ2WSQxY7b0ngQVZT1A=;
 b=hQmsPFp+hBBlReT0wm8A9tLMkGvkT+fE+nm3/RWEMhHPDxpBm+53/F+xR2/IBCwvfKd2EcsVGZW9jPfzJ0iN6xrTLIzgEjaHlIO8APGus55UQOoScyTlXaxWK9XQ2pudm7e222WuBZOxE0eW15jUw17xcZu2Bclu5v82SHjGZog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SA0PR12MB4464.namprd12.prod.outlook.com (2603:10b6:806:9f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 3 Oct
 2024 06:38:25 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%6]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 06:38:25 +0000
Message-ID: <04d7c058-e9bd-4a09-8683-f0512a9479bf@amd.com>
Date: Thu, 3 Oct 2024 12:08:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] ASoC: amd: acp: refactor SoundWire machine driver
 code
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-sound@vger.kernel.org
References: <d245bb1f-27ee-4a7f-a5be-6b2573bc2c8a@stanley.mountain>
 <4c1d9af5-6bab-45a3-b588-c0e41f5ed84a@amd.com>
In-Reply-To: <4c1d9af5-6bab-45a3-b588-c0e41f5ed84a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::17) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SA0PR12MB4464:EE_
X-MS-Office365-Filtering-Correlation-Id: 2288cec9-2740-4f69-6411-08dce375fbca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0lwZ3doZ1hYWmN2QUREOEV0Nld6NjZlK2hYKzk5djlNcGlNMUx6ZEZzT0Rv?=
 =?utf-8?B?cVBDWWttYkIxN1BOTWo0ekszMTVaYWtSTGd6VUVHN0VpaGtmbnVJNHZOSExr?=
 =?utf-8?B?VEhHT0pQOXlEa1RwcnBTUS9lSGhkTU81eE5xM2F2OVZwVjVwTTE4UElrQlAx?=
 =?utf-8?B?ajIzZEk5eDJzQ3hRWjZUMFI1dmZSUFVWT0ViNndXYzRESEtYeW54WVl0OU9V?=
 =?utf-8?B?d1NtTHFzbENYK2YyaEVXYmkzMXVDaDJDNjVOWTRiMEw0V3RBcWZuZnRHUzQ2?=
 =?utf-8?B?ZU9rZEQyZW9XMXlJa3p6cUUvb2d2NnNVYmJ4MTgrcjd4SzFoWTAxWWtUNHcy?=
 =?utf-8?B?VmdwZTdkdG5IbEJnM3ZkZTFMY0pvNzJRNlJNYWJ6OEphaHJFRjlOdDRQUFRO?=
 =?utf-8?B?N1llbllJVm4xZ29zZDdWcFdYT0tKaWx6VDMxallRS0FtOWZpUUcwMktBV3VO?=
 =?utf-8?B?dnhJWHg5UXFSZTRNaFhPUC9lVmlrWklIcTR0SHhCWW9RN3BvMDlsZ1kvUDRT?=
 =?utf-8?B?Z0JYd25BM0VvRG5oSXd6WWdSWU81ZmxTaCtzR2ZmSmFPSHBYWnIrZWk4M0x2?=
 =?utf-8?B?ODQ2c2RlNlFUYkFleVJZajVYems5NDVRcUM1Wm5xOFFMRmE4V1hpOVlXQVBU?=
 =?utf-8?B?Ris0T0M2d29qVlhHcmtHcG51eUw1bGlxU24yZjRCbWI4VHVJakMxc3NhVFN1?=
 =?utf-8?B?ZVp0c3N5OUhIaDZUSW53ZnFWWW9uQkZFdURHbG9mbHpQN295cXlxR21rbGU2?=
 =?utf-8?B?WTNPOG9QMHQ3WDVoMTA4VmttNGJMczgwY1JHcWlpdy9nSWh2OGlQTlBaMXpT?=
 =?utf-8?B?bENSOUlDZzM1YjEwWjNHOVdycndicDhnOWlwV2VCNE90MXpxdlNSVTMyVUpi?=
 =?utf-8?B?STdyaG9UMjVFd2NOWG1WYi9zbzhHWnVYUnh6NXRHQVZnTmVCQkp0dDM4cmdm?=
 =?utf-8?B?ZzFzdXBYbHlBVFpueC9uakp1TW9Md2FSQXZ6RUY3cnAvdnZSTG5aOEFWU0hi?=
 =?utf-8?B?eWdvY3NFc08zN2IzRjc4QlZBb3B4djdTZVVDWWt1Y2pTako2SXErbHpBUURj?=
 =?utf-8?B?YitpWmVTSDVyVU9DL2ZNS09iSFNObGR6bE9ab1QxYnl4U0pveDVma2xxYkZt?=
 =?utf-8?B?d21UT0s5WmVpY01xMk1qc2NqY3E5b0wydEtZQkhmNHd5MldqbVlGdmJMQ0Fm?=
 =?utf-8?B?a21Ed045b2prTEVxREdPdUlSejNzd3U1U3hDc2VlQzRjcG1Lb3FtSDZrZFdF?=
 =?utf-8?B?Q1JSSnlNeStuMGd4dTgvbHJybmU2UzFteG9DQkRsUVErUi85U0Z4a3FMV0lS?=
 =?utf-8?B?TmJ3U1lrcDVkWjJIQ1pJSTAvMnZEcmNPdmRxOGpLN2t5ejhBQXhjYXpMMVRq?=
 =?utf-8?B?aGo1b2haNno3dkhLK2FzWTYxUHlKSkVvb3pBNlZ4dFdjd01qdENHVEpGMjdT?=
 =?utf-8?B?NmxySjgvNEpUcTg3Wks3Q2thblBENDJMRFJMQW1mNm9tSDQ1Y05BTDlyQWkv?=
 =?utf-8?B?eUpwRWl3WWdnbm1QZXdVcHk5QWMzZFZOV1g0S2hQUWRsUHRmRE5uZVU2Vlls?=
 =?utf-8?B?eUFzRDl3OUc4cmp0T0twRndkNEhvNTBCbTFEejV1VjNRLzFKc2Z6TjZiYXd3?=
 =?utf-8?B?anozOUVQR3I3bFRIbUdkR04wUzd0eXFvbEJUWWg0THBoQ09OcU5rRVNvT0RJ?=
 =?utf-8?B?R1NSdWszQkx4RDRRM2dwWmVuTU9JeFlCQ3RaRDNxWC9pcERDdHZuZkFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjkxaGh5WCtYMi9ER1JwUEV4cXZub3F1SklJdk94dmdDWGdyNGlHS3BSdXMz?=
 =?utf-8?B?MWFoZE9pVXY5dzNWYlRmelVjZ3l6NjAzSjdwMUdQMElUdG9EWjhyMUdoeXJL?=
 =?utf-8?B?bGJoZXJKalBoQTM4cUpKUTdyN2pKZTJyTWhmK1RpQVNKem5mZkJZYm9YWHdr?=
 =?utf-8?B?V2YydFZSc2N4RXl3ZUMrTlo4TVVQR1BHTWhJc1FuSnRRTFZxMkJIQWRnZTB4?=
 =?utf-8?B?bzZvSjZwTUVFdWJFYXVyZmpFNzVTRVRuT2ZnakRvWlpGYjArRi9tOFhEZ0N5?=
 =?utf-8?B?T2V5cVU4L1VoRG80QXd4QmxRdlpBYmpFMFM1cXVmbkl5aEl0RjdlNTd6UXVt?=
 =?utf-8?B?V1o4RXRaV1puRUsxL1Y0M1k5cGt0dTlLdm5rK3FzVUtvblRSWG54bi9QYXd0?=
 =?utf-8?B?SG9UNlZFSGZqVkd1NUYveG4zQy9FSjNFdGN5R3ZJa0Q0Q0o1NHllNVlFemdt?=
 =?utf-8?B?blB5V3A5NngxaVpMb2VIM2l6RjJ0d0o4cGF4ODRQdGNZd1RNT1ZyaUkrZVFk?=
 =?utf-8?B?c1MvZUVHdlNsMUU0NDBVMXR5aTZrc0Q5OEMzNEVReFJhcFhYVWR3S3dZTGwy?=
 =?utf-8?B?SXpURytjY0N2QXZVSUN0ZlRqcGtyK0JjdDVqcnY0c1pNVXJCbWIrRjVoTFZt?=
 =?utf-8?B?VGJyZXNJditZUit0R0dHdHFSSVo4cmRYVi9CUkRiZ1lwSzE1bWhaaCtJMnFM?=
 =?utf-8?B?ZWc5M3ZSVVFra3A2RXNlUTlOZ0FtNVI1VnF5dmdMbTdpdUJQcnk5VnFQdVdx?=
 =?utf-8?B?RXFhTzhIK0RkeVBpdXNrcE5iRHBPWDVlL1lTNkRFUHJNVlR0SG5yRnU2MWN1?=
 =?utf-8?B?b28yR0JDQ1gwMEp3WkYrVXl4ekVLVm8yTWtoYjFld2hPZk81WmcyQ2tFLzcv?=
 =?utf-8?B?VGVkbzI1UHR0WXJ6d3ZOZ3JLbTA0NGR3aDNhdXhEc1Z2NjVsTFZwQkRXUEdk?=
 =?utf-8?B?VkZyT0Y2enpLMjJjU1dxaWVQdUVKWTVqckdTUGdoUUhGV3pNTXhINWMrK0pu?=
 =?utf-8?B?eVpjNnhReXNLRTYvenFFRXYwOEJMOWIwZWNweUhobGRvVkM1SHhNLzJudXFl?=
 =?utf-8?B?M1NVL2JSaEhJbUNvQnpDWWVIQjdrZ3U5Qm5MSWpCVlMwSWNxcXdTbWREK3lw?=
 =?utf-8?B?aTY1N0cxeUE3dnI2enJIeTFlemovTU1FamFkU1J6NjV5OU5HWmtNaWtVNElH?=
 =?utf-8?B?SThyQ0FRMlF5TDl1VmI0YlNtaE80SjdIeUl5eWdrb1lSdmMzaW8yZEo4YlZt?=
 =?utf-8?B?T3MvZkRsV3J6M2Vka1FHRjkrZ2gwR3ZIQ0xQUWNmRi91S3VES1ZCMWFLaDJL?=
 =?utf-8?B?ZkMxY00vUnRrekxUSWtsZU5Nd3QrWGwwUFVMYllQSmZ6SDQveXVxVloxbDdh?=
 =?utf-8?B?OTFKS2lzYUVmQ0RYbmRFNlAvaGdHdkgzenY5QU01VGRDYlNGNHFNdnJ0MkVj?=
 =?utf-8?B?TTZiS3lOdEsyeGZFczdxRTk2NVZZUSsyL2xiOGRHZi9lSlljWDhpS1hQdUpo?=
 =?utf-8?B?R1NBcVZLTkhaU2o3bjMxZDNWU0JnVVZ1T1o3V04xYnFmT1VTOUlnbnBQL1Vw?=
 =?utf-8?B?NG9seHlldmNGZWJlN05RMituQ1EybnI0TlEvMzdGM281cHFMOC9od2t6K2Fa?=
 =?utf-8?B?RlpsWEs1WnRzMmZ0SG90T2RCU1JYN3hEOXRYcUV3emI3S3ovL05XWlcrOXVq?=
 =?utf-8?B?RU9JMmxQeFpjcnVjSm8wZjBRemhLKzNkZ3ZrMXRxVlY5NXRkRlZzRVdtSGtt?=
 =?utf-8?B?NDlzU3pPek54STBKaTA4aTFwdkxsVWd6TWwxS3VsZ2E4RGdOR1JXK2ZlMlR5?=
 =?utf-8?B?R2lNZTM5M2k3V3NmMnBrTkJSek94eSsvYXBYTjVmSUJFR0JCTDI0ckplQ3I2?=
 =?utf-8?B?ejU4VTlFcXZiS1R0am9RVGxObW55OW0vYjlQVW5iVzNWandzWXBtSEtEaUla?=
 =?utf-8?B?Y1dZeG8yTGVyRm5aYjlLMVFtZmpqc1RNK3FPaGJQdUo3S09YeVNtU3JKZk5J?=
 =?utf-8?B?eVhyY29WUDlpYURSaThLMVdMRGNxZlZKdm16OG4rSk00aFpsY0Rid1BmRkpE?=
 =?utf-8?B?SmJtcVVJa0xKamsrZ21VWE1pejE1WkFJWm5oc2FweTJqNThRT0ZLaXp5aUxy?=
 =?utf-8?Q?erjliPAmyt9aDg07KDRnfp5rz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2288cec9-2740-4f69-6411-08dce375fbca
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 06:38:25.7879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqe4DUVDCwJQE4k6ZVC2snqkKbUqXZ8Q5FZy9kx6kpzeID5TW3EBngAdxQ5zQuFrdS3G4pU3IcixexLVSfdSxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4464

On 03/10/24 11:58, Mukunda,Vijendar wrote:
> On 27/09/24 16:05, Dan Carpenter wrote:
>> Hello Vijendar Mukunda,
>>
>> Commit 6d8348ddc56e ("ASoC: amd: acp: refactor SoundWire machine
>> driver code") from Sep 13, 2024 (linux-next), leads to the following
>> Smatch static checker warning:
>>
>> 	sound/soc/amd/acp/acp-sdw-sof-mach.c:157 create_sdw_dailink()
>> 	warn: iterator 'i' not incremented
>>
>> sound/soc/amd/acp/acp-sdw-sof-mach.c
>>     144         for_each_pcm_streams(stream) {
>>     145                 static const char * const sdw_stream_name[] = {
>>     146                         "SDW%d-PIN%d-PLAYBACK",
>>     147                         "SDW%d-PIN%d-CAPTURE",
>>     148                         "SDW%d-PIN%d-PLAYBACK-%s",
>>     149                         "SDW%d-PIN%d-CAPTURE-%s",
>>     150                 };
>>     151                 struct snd_soc_dai_link_ch_map *codec_maps;
>>     152                 struct snd_soc_dai_link_component *codecs;
>>     153                 struct snd_soc_dai_link_component *cpus;
>>     154                 int num_cpus = hweight32(sof_dai->link_mask[stream]);
>>     155                 int num_codecs = sof_dai->num_devs[stream];
>>     156                 int playback, capture;
>> --> 157                 int i = 0, j = 0;
>>     158                 char *name;
>>     159 
>>     160                 if (!sof_dai->num_devs[stream])
>>     161                         continue;
>>     162 
>>     163                 sof_end = list_first_entry(&sof_dai->endpoints,
>>     164                                            struct asoc_sdw_endpoint, list);
>>     165 
>>     166                 *be_id = sof_end->dai_info->dailink[stream];
>>     167                 if (*be_id < 0) {
>>     168                         dev_err(dev, "Invalid dailink id %d\n", *be_id);
>>     169                         return -EINVAL;
>>     170                 }
>>     171 
>>     172                 switch (amd_ctx->acp_rev) {
>>     173                 case ACP63_PCI_REV:
>>     174                         ret = get_acp63_cpu_pin_id(ffs(sof_end->link_mask - 1),
>>     175                                                    *be_id, &cpu_pin_id, dev);
>>     176                         if (ret)
>>     177                                 return ret;
>>     178                         break;
>>     179                 default:
>>     180                         return -EINVAL;
>>     181                 }
>>     182                 /* create stream name according to first link id */
>>     183                 if (ctx->append_dai_type) {
>>     184                         name = devm_kasprintf(dev, GFP_KERNEL,
>>     185                                               sdw_stream_name[stream + 2],
>>     186                                               ffs(sof_end->link_mask) - 1,
>>     187                                               cpu_pin_id,
>>     188                                               type_strings[sof_end->dai_info->dai_type]);
>>     189                 } else {
>>     190                         name = devm_kasprintf(dev, GFP_KERNEL,
>>     191                                               sdw_stream_name[stream],
>>     192                                               ffs(sof_end->link_mask) - 1,
>>     193                                               cpu_pin_id);
>>     194                 }
>>     195                 if (!name)
>>     196                         return -ENOMEM;
>>     197 
>>     198                 cpus = devm_kcalloc(dev, num_cpus, sizeof(*cpus), GFP_KERNEL);
>>     199                 if (!cpus)
>>     200                         return -ENOMEM;
>>     201 
>>     202                 codecs = devm_kcalloc(dev, num_codecs, sizeof(*codecs), GFP_KERNEL);
>>     203                 if (!codecs)
>>     204                         return -ENOMEM;
>>     205 
>>     206                 codec_maps = devm_kcalloc(dev, num_codecs, sizeof(*codec_maps), GFP_KERNEL);
>>     207                 if (!codec_maps)
>>     208                         return -ENOMEM;
>>     209 
>>     210                 list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
>>     211                         if (!sof_end->dai_info->direction[stream])
>>     212                                 continue;
>>     213 
>>     214                         int link_num = ffs(sof_end->link_mask) - 1;
>>     215 
>>     216                         cpus[i].dai_name = devm_kasprintf(dev, GFP_KERNEL,
>>
>> i is always zero so this just sets the first element over and over.
> Currently, multi-link aggregation is not supported. i.e 'i' variable
> will always be zero. 'i' variable can be dropped and index can be
> hardcoded something like cpus[0].dai_name.

Small correction.  Array indexing is also not required here as single cpu dai
being created.
>
>
>>     217                                                           "SDW%d Pin%d",
>>     218                                                           link_num, cpu_pin_id);
>>     219                         dev_dbg(dev, "cpu[%d].dai_name:%s\n", i, cpus[i].dai_name);
>>     220                         if (!cpus[i].dai_name)
>>     221                                 return -ENOMEM;
>>     222 
>>     223                         codec_maps[j].cpu = i;
>>     224                         codec_maps[j].codec = j;
>>     225 
>>     226                         codecs[j].name = sof_end->codec_name;
>>     227                         codecs[j].dai_name = sof_end->dai_info->dai_name;
>>     228                         j++;
>>     229                 }
>>     230 
>>     231                 WARN_ON(j != num_codecs);
>>     232 
>>     233                 playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
>>     234                 capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
>>     235 
>>     236                 asoc_sdw_init_dai_link(dev, *dai_links, be_id, name, playback, capture,
>>     237                                        cpus, num_cpus, platform_component,
>>     238                                        ARRAY_SIZE(platform_component), codecs, num_codecs,
>>     239                                        asoc_sdw_rtd_init, &sdw_ops);
>>     240 
>>     241                 /*
>>     242                  * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
>>     243                  * based on wait_for_completion(), tag them as 'nonatomic'.
>>     244                  */
>>     245                 (*dai_links)->nonatomic = true;
>>     246                 (*dai_links)->ch_maps = codec_maps;
>>     247 
>>     248                 list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
>>     249                         if (sof_end->dai_info->init)
>>     250                                 sof_end->dai_info->init(card, *dai_links,
>>     251                                                         sof_end->codec_info,
>>     252                                                         playback);
>>     253                 }
>>     254 
>>     255                 (*dai_links)++;
>>     256         }
>>     257 
>>     258         return 0;
>>     259 }
>>
>> regards,
>> dan carpenter

