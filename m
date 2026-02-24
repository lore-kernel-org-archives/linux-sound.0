Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010009.outbound.protection.outlook.com [52.101.61.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4248B77F39;
	Tue, 24 Feb 2026 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926151; cv=fail; b=Pkfi78B5IxBzIIsTj3WqK9zdHAyHX8OeqMK0rOZApS4v2f317kp4PaMGWutWKdjYIEqiKPb20moYha9aFE0g4JT9ZM9Ilyj67lLvYFqQiFTL0VTepGlWyk2jfI5Y9fXgWKE6+K7+8Iw1ETjOBnJOHPCTx2J1p2wy0Wqd6ZHohyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926151; c=relaxed/simple;
	bh=FPQh4Pm8M7h3TRnhTYfaHRLMDIY2GtYmVOQuAKLv2nk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FOVJVAJVw+tGzrHoYRQ9bmn4Yg3Y//lZtfp/tjNfFdYWc7VDK+O/f7D1OFmoPeUYkQWDEb9rwrrKTpZMhUp60wIprVcUBA5o69cN17vZp4HGe5edXElM6QfNO4zj0vodb30UQru9eXI+Q++L4+ilf3XetPZs6ulmUIN6rfHeDAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iLFpcFfG; arc=fail smtp.client-ip=52.101.61.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iLFpcFfG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5p2KN2PSUaBmzs/F9Yxhy58V/NX4SkeR8+RvBIbLaIVYzEN9UMWP4ZhsdjEcbMkDprmd/QSxZuSzu+AtP6tTlaGVjbM5bkBcpoZdinkEsnWM6uGj9t7ZBtwVTgiKP8MuW/Zr+4jYYQk3U3nu5e7+4szU7y1V+iGBu2uBbRdhEBlnO8sMy0Qxq7LirM5FDlWqsGTWCWUbdqESHWdXnVgDzwnGX4IjGm6iE/1kiQ9/KCq13g0/ScDYJu0arOwZiGmgkjqGK0ujhJXxOBl0OCzT2plhWGhg9nhY2xSX0hnsW8fgHfVBSjR9STakbWzgzWgODA6CGUNMYGmjYMWFoewcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPQh4Pm8M7h3TRnhTYfaHRLMDIY2GtYmVOQuAKLv2nk=;
 b=g5hQigSOZPR3Gs9/h8DUHV742FK7bJkrqRxEsm9RHRyVXaRJ5Zvh4g/zUqPFDmrVYYQlgB7M7uqg86VUQlrVFbUcD0ELCKYHa7uEEfrXfV35ecyzVWW9uD8ZckDVnzaQC8ZpkBnB5fOWY+HFnT3j6brQDRqOt4kdeC+ldv+9syRwDs8OHFIIBVSnJUNiWEMNA7WZQX25AkmTuITCtmmzak/7L409paoZNMTI3+gAF//F11U/yJVxnroyTwb7I2nVzAQYmcCtSbLoc2SMEoZr726BNhRvqamkDyNweTNMEihWSBc1XB6eG6KHQ9py5gVKjssBpU80C/bNYuuJ/aCebg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPQh4Pm8M7h3TRnhTYfaHRLMDIY2GtYmVOQuAKLv2nk=;
 b=iLFpcFfGEgYHutAl3h8uhRxvJNteOAyTcwSJwt0d83pRWbp/AdFqaL62jOC6oZDHDL9mIxUWoZ1HrGq5+xTk+6dtZV5MVfxeibK48UyiaPrJv1EpQMXekWA2TxMWpFmNlpmmuGpL9kQ1QRoP2aFUPHDOaXQvxZfn31GEHJMOiFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CY8PR12MB7683.namprd12.prod.outlook.com (2603:10b6:930:86::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Tue, 24 Feb 2026 09:42:27 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 09:42:27 +0000
Message-ID: <009d1f30-4e8b-43bc-8b4d-45d1b062366d@amd.com>
Date: Tue, 24 Feb 2026 15:12:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: DMIC support on AMD RPL platform produces I/O error after quirk
 addition
To: Jason Mo <NukaColaM@outlook.com>,
 "qby140326@gmail.com" <qby140326@gmail.com>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "venkataprasad.potturu@amd.com" <venkataprasad.potturu@amd.com>,
 "Sunil-kumar.Dommati@amd.com" <Sunil-kumar.Dommati@amd.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <MN2PR07MB6511E6D445F37FAE817F5ADEA16BA@MN2PR07MB6511.namprd07.prod.outlook.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <MN2PR07MB6511E6D445F37FAE817F5ADEA16BA@MN2PR07MB6511.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::22) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CY8PR12MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 01129783-9abb-406e-5dfb-08de7389058c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUdXbDNZQldGOCswNno0bkhxK1BtVlFvekI3TUlIdWpWeDJPWFkwci91QkhJ?=
 =?utf-8?B?OWpBNWZUdkQ0QW5KV3BSOE93T1JXSU51SlJYbGxlZ2pQdFZSREE3T1hFSnFD?=
 =?utf-8?B?VGt6N09kb3NTay9vOFByY09jdU4xTGpVWTg1ZXp4Skk4eWNZcEU0bWhvdWx4?=
 =?utf-8?B?VFdLSW5CcDhmN3dFSk0xU3dBaFl6OFgzM1o0Q3Z4UDk3ZjFiaTM4eERVdFhh?=
 =?utf-8?B?aTkweS9qTkhQTlpKWGRzR3VRNDJVMHREWXg2anR5L0RoeHNjRE9GSkFPbEJt?=
 =?utf-8?B?d2wvbFNnNHp4ZnAycHF6cVVxaStGSVk4N2xhMTdPYjlTS29oYnU4Mjd5S20v?=
 =?utf-8?B?WlVuNlpLWjRDRUQ3THJEZW00VzVZVDZpSGhlWHlZNzkxMzJ1MVdzUVNuSkZp?=
 =?utf-8?B?YSsyNEhMTUtGbzV4TkMvNjl0UlczdG1iQzVURVNla3hhdmRVcElSZW9Lb1Zw?=
 =?utf-8?B?dmxkQXRvcUJzNzhmb2twMzFSZFVrOVFsRXV4SDFEZEVDMGJiWkVwK0h3S3Vj?=
 =?utf-8?B?TkhzbFh0RWk3alZrUlk5WDZOc2pmclpuc09UWjFhME5WaWpzTm11NGpJcXlw?=
 =?utf-8?B?dEtrOEdxc0NpWllTNWpzbnRneVk4NEZ6WWRRQkd6SEJ2Y2ZqajRGakh2blNl?=
 =?utf-8?B?VGUzU2ZHSjVhUUt2U0VZWXpjVmRKOUk5SThMdWtuMXdBaEZBc1EvcnM5elFs?=
 =?utf-8?B?REQ0azEyTk41WjBXRlFMSmw5alU5VGJFZktQZ1VCU3BJc2N0ZXlnMCtMVG9U?=
 =?utf-8?B?TGx0bFduczhnM2x2ZTQzSmVzT2duRjB1Y1p1ellQSUJzdlFpdkIvNVp6bktU?=
 =?utf-8?B?aTc2MVZOSFczdW5YS3NWN21vb2VLc2FxUTh5anZ0T2VzM05UWTZPQm1xMGZj?=
 =?utf-8?B?NlpFOW5iV2FVLzRjYSt1MUsvZlg3UWxxa2hXMkc1eWp6VlltNXJrUmJQOStP?=
 =?utf-8?B?L1pSQmlEYy90Ry9mVFFFL3VBeEhhaUdESkxiTVhNcmhuWlY0ZzJrMDVBSTln?=
 =?utf-8?B?WlFiYkdIbHdPeVZLdnBPQ20ycW1ZQ2ZqLzBCMGxNRy9jaktoT09DVGJEZGdH?=
 =?utf-8?B?Q0dIYTU3QllBTGdRQzRwRWh5SUJ2anJyYWczNGYzMTNReS9IaEtlVmdvQXh5?=
 =?utf-8?B?TUEzSHNVR0E2UnlUdXZzVDIrOGt2Z1E3dmFFVDkyQ0d0YXNxL29vYnY3TW4r?=
 =?utf-8?B?Q21EcFJNTDAxS3FyMlErWHVMSEdtaHVuVE5DVkdDak1Pb0FRL0FJZ1p6Yzg2?=
 =?utf-8?B?c2R5djMyMXpjNVorczVFbWMyN0FrSStYRStDTnMzckxVa1I0c3FmbTI3UWdr?=
 =?utf-8?B?NFVxWUh6bnR5UzU1N1lhRGxJRjFIZGNVSVVRY3o3S3lDYWhrRmdOU3dVam9E?=
 =?utf-8?B?THRlTk50UUoxQWlqM1NqZmVwcjEzSVorcTZOeVpGUjNhNWZUdFpqN1o3eHht?=
 =?utf-8?B?TXpsLzF2Qk85SU96WHJlem4vY1hzZ1hzakdNbHBTcDR4NWpncUVrSWxGK1lR?=
 =?utf-8?B?TkZZU2dvVmxCU1BPbFlsNW1UMmZmVjdOaUQyeVhVcXRkSld5eUFzUXdVdjhD?=
 =?utf-8?B?K2N5ODlzWlhkU2ZJMVBhQkF6eUQ2ZVpWbnI0cm83a2cySlJCbHZWSm90L2NO?=
 =?utf-8?B?QnpZQlR0K2tzZ09TOTNERmx3M3lWa09BWm5VcFhRRmdTcUprV1NMWldFVDlo?=
 =?utf-8?B?TFhsdU1iS2E3dWhBZ0VuUTMwbTVFKzhoVzhkUU93YzlSaGJ4clptUkdkdkFw?=
 =?utf-8?B?NC81dVhDS1FYVmE2YTZBbGlhTDhFT3lOZE5mb3NLZ1UrN00wTG51QlFyT0dn?=
 =?utf-8?B?cG1vdnhVSEFPajBCcmJ5M2hhUnQwQ2t1OHRuOXVMYzdIam1iWlBsbnYrS0lY?=
 =?utf-8?B?K2ZHRmlrK2RoVkJxaHd4dG04UHhpN2VzTEtrNzNmQW5kbkpJazViK0xENE1P?=
 =?utf-8?B?VnFvWjhzSnBoL3hrZkttNmNkSHZYRW03QWFScmVvUXNYcm50SGR0K1JUR2w3?=
 =?utf-8?B?NElvYjEwc0V0QUEvV1Vjbks4bGl2aTVxUHh6ZmhKb0lLcXVZbTQzaEpPK0gr?=
 =?utf-8?Q?ZEzQ8F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym5FNmUvRytpV0REcXROQkhNUVlHSW0wVmlqa05mNTNnZS9PSmQ2N0dDUUsw?=
 =?utf-8?B?WnBKdFlTeGdXbEtMZFFwdzRjSlFKN3dCVjFJdWVWUi9lMmFqMk9zSy9KQmFG?=
 =?utf-8?B?ZFlxZktOdXQzQUZDTllhR0V6M2FVbU1wTDRYN0k2eTJmcS9aN050UFJ0R2ta?=
 =?utf-8?B?YzlwTmtLNWdUS3ZkN1R0LzVFSmZaemsvR0RlTEJYODBLTXNZaHdLNlNFbERD?=
 =?utf-8?B?Tno0di9tTjJRRXdOZEl4NDRVN01NSnBzMVl5aWRqODlET1hsMXlkVWFuQzVX?=
 =?utf-8?B?cU5xeEJ6N25HRTZqdG5SancydDRrc0ZSeDRzN3dSbG9NS2Y5SlNKUHJGd0dF?=
 =?utf-8?B?Z0NRN1dQSjdJQzNHRmtVK2E3clVhUXhnaTl2bUJ1Smh6eWNQRlIzcTRUNm5Z?=
 =?utf-8?B?c29ZR0Z6UTIvSkRIdGRKakRLQVEwNnJMZ2swT2R6Nk5jN01BM2Y2eWNxOG9v?=
 =?utf-8?B?dDU4Sy9mRjgramMwY0RBOXAxT0Z4V3kvZWJVbFFUZ1FJdjRxZ0JzY0orRlRE?=
 =?utf-8?B?STNRbG9taDhIYlFJTVB6OFpOUDQ1MEdTd0QxOWFSeWp0RnN2QXdwYzNJRXRr?=
 =?utf-8?B?dkNHZFhVVFk0cmxLeGtyVkM2Vzc4dSsxSDFjTVh6QlFUd0RJN3ZGNURRQmkv?=
 =?utf-8?B?UDUxc0J1Q01kVnE3MEt6UjI4WHBQZkJVdGh1Z3AxME1tS3VheGtwRGVVSGcv?=
 =?utf-8?B?d1VMbmhLQkFxVnkzOENpbUpSR2hjelVOTHBRWklCUEFQNmVxajRVN1ZqTnFF?=
 =?utf-8?B?ZEFEczI5a2RCdDYrN0FndHhjaTFiTTRiYmdPa2k3QnZXblZwNFhtQ1FMY0xx?=
 =?utf-8?B?TjB1TGNBY1E3d0Mvb1ZMUjZ6QlNiN2UzdXdONkFBTnpXd0V2ZjNpNTNocWs3?=
 =?utf-8?B?S3pkeDdScGZEQU5QcHhuKzBqZC95Sjd0OXBvOW9lQndRaW4xRWlLekg4dTR3?=
 =?utf-8?B?eDhEeUUrclFQVGpwSUhjOXZvMW54TmlWTFdUQnFjbnhoVlgxSy9PdVE2eWxz?=
 =?utf-8?B?UFVKV0E0b3BmVm5RamswZXBEVncrL1M1OTJYKzBHYkpPTjFxL2JGWnVFTGpr?=
 =?utf-8?B?WTVHdTdYMzh2ekMxMFM3UmZXWDR3K25zRlVVZkx5VzBqcy9PeThQWWE3TXJH?=
 =?utf-8?B?bEpFRkg3M0RDVGtYWlpYMVU3VGtkdC8rUXFmMmFTZlU1RlRNYWoyaWFrek41?=
 =?utf-8?B?ZGtwTk54S0k5NkEzNXVqWGNGZFhSeVZnOXduWEx4VjBWTTlEZkNZRzViZ2tr?=
 =?utf-8?B?cTkzSDBJRXFvb1J3d21vT1ZUQ3BNRDRVMGlQVzdlaDRIWjF2ajArRytXTTds?=
 =?utf-8?B?RlJ6STN2cXBPa1VGWHNlUHl4NWlUT2ZuS2FGZkRFMm1sdy9sRWE5bzFaZ0oy?=
 =?utf-8?B?bmg0MTBxQlBqWGRCQzdab08xSlF2Uy9URDk3ZmlmdU5qU082UFk1eXBUbFdv?=
 =?utf-8?B?TklWRFBlelFBYWJNRExPdnphaGhWWDNCR0xzQXE4YkhjcHVKR283Y0svcXV3?=
 =?utf-8?B?WW9oZXVIcXdRWGVGR21rV29VK2hPWVRNU0h6TERKVS90TTM4TUtDWFNJbHM3?=
 =?utf-8?B?RVpWTnU0Y3oyaGRER05FWTVJVW1HRGFLZmJvNjI4TjJjWERjMkIzU3AvT2lH?=
 =?utf-8?B?Q1N2MVhVNE9IaXUxWWE1clQ4Ukl0OWJWS25oOFVXMGQ4bzNzVVNMQWRYcHU3?=
 =?utf-8?B?VjFSY1l0WklJZ3JoL1R1c1F3WE1iUGFjMFlDeHVGT3pON3pBZ2tnYXUxRDhY?=
 =?utf-8?B?czYzek5zbGI1Tm9TMUdVZGpmSzZ3dWovSkliK2dYd2lSWkY0c2FhNGI3dm1W?=
 =?utf-8?B?MzFuVXVRRVVNVWJvYitBQ3lNd25ERlJVZjkvUUlvWm1HbW1HYlhZYWVsZzNK?=
 =?utf-8?B?RVdsMGVJa0R2RmlLbFlzRjRIWFFmd01saUpTcEV2WDJKOWIvRTQxM1ZvZG5R?=
 =?utf-8?B?Q1p2Zkp1MHZFeENxeE9GSDczYmNPQmxtbDZWNVZnQi9tNis0R3p6eFEvZzNr?=
 =?utf-8?B?ajhtYzRZKzR4MTNXVWVVQm9tRmlQL05JZk10Z0k4VmhxM2dSZFNCV0hOUXRE?=
 =?utf-8?B?b3lRRm43T3owaGpXaHJVY2hRRGdMQ3pZK3NFeXhNaVZ3OXRFak43ejh4ZjB0?=
 =?utf-8?B?ZllLZ0dDajN1Qko5ZHVhRjh3U2pPUngvRVhDYzJVUU4xcjJpZWpxRmYyZzU3?=
 =?utf-8?B?VG1xUGxKYmdpYTRzWGh3TERzejB2WDJhZ1Rublc1TXp1NjBPSnZuZTU4ZURl?=
 =?utf-8?B?TDZPcGlUM0Q5c0I5Zm9DT0k3b3RRK1JHTHVhSGhWbkFER1F3VnMvTGwwSURj?=
 =?utf-8?B?NCs3ZkJ6WHBRRU1DMzJ6cnE2UytMRzBIK2tVaVdSNmt2VWxsalJpUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01129783-9abb-406e-5dfb-08de7389058c
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:42:27.5307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AF52mip5/5VBLW5t+ix8/kss6YdpM+VcEA3QqI6F4NmzNW4HIE/eIuYbQByS4gSI8KnTVHDPPpQcx4cP3otBIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7683

On 19/02/26 19:50, Jason Mo wrote:
> Approximately one year ago, I raised a concern regarding the lack of DMIC support for AMD Raphael (RPL) platforms in the following thread:
> https://lore.kernel.org/linux-sound/BY5PR07MB66126978095912E5D4A26E50A1802@BY5PR07MB6612.namprd07.prod.outlook.com/T/#u
>
> Recently, I noticed the patch series submitted at:
> https://lore.kernel.org/linux-sound/20260213055904.110256-1-qby140326@gmail.com/T/#u
> which adds initial DMIC support for these platforms. After applying the relevant changes and adding my device to the quirk list, the DMIC capture device is now correctly enumerated by the kernel.
>
> However, when attempting to record audio, the operation fails with an I/O error. Below are the reproduction steps and corresponding logs from a Gentoo live environment:
>
> gentoo@livecd ~ $ arecord -l
> **** List of CAPTURE Hardware Devices ****
> card 2: Generic_1 [HD-Audio Generic], device 0: SN6140 Analog [SN6140 Analog]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 3: acp6x [acp6x], device 0: DMIC capture dmic-hifi-0 []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> gentoo@livecd ~ $ arecord -D hw:3,0 -f S32_LE -r 48000 -c 2 -d 10 /tmp/test.wav
> Recording WAVE '/tmp/test.wav' : Signed 32 bit Little Endian, Rate 48000 Hz, Stereo
> arecord: pcm_read:2272: read error: Input/output error
Typically, I/O errors will be reported when DMA is not progressing.
RPL based platforms are intended for desktop variants, and DMIC is not
expected to be present on these platforms.  Before proceeding with further
debugging, we would like to double-check whether DMIC actually exists on this
platform.
Additionally, please log a kernel Bugzilla ticket and include detailed
information such as
Alsa info dump, lspci -vvv output, ACPI dump and dmidecode output. 

-
Vijendar

> gentoo@livecd ~ $
>
> The device node appears functional at the ALSA layer, but data transfer fails during capture. No obvious dmesg errors appear during device initialization beyond the I/O failure.
>
> Could you kindly advise whether further logs (e.g., ftrace, ACP debug registers) would be helpful for diagnosis?
> I am happy to provide additional system information, test patches, or perform targeted debugging as needed.
>
> thanks,
> Jason Mo

