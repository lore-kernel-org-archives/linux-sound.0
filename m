Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4C834F255;
	Mon,  9 Mar 2026 06:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773036777; cv=fail; b=DYUe/87LeQMRHTjopah+T4dC9j5vNzRy92fkAPKMuxFvEWXVMmUVZ00sMHVJYvxM5k/6H6RktVwQ5wQz9xR5E+aBZ16gdtvidbpeU3cnzyrpkTSE85ToVvewPJlkgYkIaVjPXkMFsGgTvp35UnBdYf/eYBpiYHEmxJu/1J4VMy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773036777; c=relaxed/simple;
	bh=AWNV9Wr5QK2SQLWtkzbu5m0NM7rrXKaCHV6QD+BbzDI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HrQYphAlI+lZvTd28j2VBEnmbGlawZptgkRjiIiQKVpROC8M5eab2VF/3XGwRQk4g/uQowHlqvT5Gyg3honBH/NxstyLE/VTe81oDMNXjocHbbtC1d8yu1B3d2ZX4MA4HeQv5NQQPMyaRWmGjO5Vf/Bisfm6sETcE/xSTOCNoEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=szYbenLz; arc=fail smtp.client-ip=52.101.53.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="szYbenLz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXFHSGlWP3GfJXJxzvnly1CaAH23kw+AmHIRFhLKCcNroePhi0nRHNChrtY/NfMq6k32bGO/F3AHTzOaqgVu7WpDQROmjqVFOCL4+9mPqp5obOHfLfZsX1JXEQ2OTVnwvSDT6WHvNKdn7QxU9p0O07+YTTj0TC10CJ35ilzDC1GLgXaoAR4ZwjrohrSgbNIaUWM2WHnt1oOxVRd3DAfaWullc+6A3JWDcz2p2P6sQLcB9f/nbSwxWsAiiIe2Atibef7/k9z4iT2g+q+pr7ec1qopCsfWVKR+h8ZdfXQN7fdr0stzc7vVQ23CeK0it+sKwNhOqdji7Rg+LzcQJ9SK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SFgaWNwLo9x0nZ1iVsSu4gaTP4bdByH3XmMjgh0h24=;
 b=ZjeVVWeswaBBC9i9g80T8U7V5S1xN3VYdN5oeCDB7VdjYrDGi8nZNUonEqcO6IyPHVpZWfbFUUEnc5m2HU/KH48I+HvNhDPZ209rxEnR2lthpJmXgLeO9o5mNrPW9a/Q/59f3i01q3rgQIb/rIet7uAAnqhAopnb8k3f6+uAGDLBvrnigkTlmmKRblp3blJr/rnbiWx6ht9/SIGGqVDcdH4HfiTWVAbTtGAdeqF6rbxHWRKuAYXg/1lwGGpmc4HkyVoY9RaU3AlZWzvUAlA3Ws70bAxZ//wu2aNDmH5Z6IH7YamIIf8L5hlXO1ccVsX6Ye9+rsKLHiofRE5StwZRgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SFgaWNwLo9x0nZ1iVsSu4gaTP4bdByH3XmMjgh0h24=;
 b=szYbenLzFhVxioxfKbH+xkf0rEy+xXCSmEH27cXC6nSgx6viogGcJ+jIRF0iOB+Mh46kQw5Z6zy04hQOmYE14xKS/uHV9HwDKsvVayy6CqyS6UyahcoAuHMEOBb/Q3vg93SM22wnt5dxOJOO617Pr89vYd3YwH56vwS1peioGCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SA1PR12MB7174.namprd12.prod.outlook.com (2603:10b6:806:2b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 06:12:50 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 06:12:50 +0000
Message-ID: <02ee420e-c693-4e98-8eca-98a5a47855c2@amd.com>
Date: Mon, 9 Mar 2026 11:42:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 0/2] soundwire: amd: clock related changes
Content-Language: en-US
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Deep.Harsora@dell.com
References: <20260226065638.1251771-1-Vijendar.Mukunda@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260226065638.1251771-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::9) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SA1PR12MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: a31596d9-ba63-4cff-69e2-08de7da2e494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	51pCh+Vi/2bHbbS+oVqXgMWBo93aqrTN6ftOJlzOmZ3Q75Au1LQRgiZoP5jsKRjCeiSFMnO8gtW6QFq/6JXf6C5tF1RLKQ4Z5XhSeRf7ArkzWwIQGCUT/h+Oi5Vm06K2wda+qPvK5Ug4lSqdPGhAkWdPQ/F72l98JHv4E+jXOngfld7N7W6JKrB6DMJnCCkfAaJtN6lLMBCf+JzgpTGaPvd47t0UTZkfcQ41Dm6cRdKMisdI1y1dOVUJNQ6WmeP8jvnnTASLiGzhMiIUx1fDM0Tp4hc1LWpQszn31sccO3/hQo34G3EvS400+JmRd12Dr5wHwT7u6frpNo/THcjMKSwwES5Um8AyIS0761kIUMJ6b/UPNOP1+/nio+BYNKgntioEB1Py1sR9yF+ShgquOItXw/NuNG7yNPDIuF1TVIUu/f5BCDDgfDFEl0ktVOiBCWKT+uLW5XAsDYagpBXfAvMQFwl940V7I40rY+EwSEuWiXNlQiFoVxbv06KWd0ILD7alPoYnmp6CH3xT6H+1+JBraieG7hKnQWPlQXQMkHLRTzeDoLZHql3zsLLvJtTA7MUMgV81EO5usIAAMsBbxd3I5TN6E/qXCeLllx+1XfrVpOTWhWO53wut+d7sckJJjvpZrwIXVFIVbYQi9o4fn+PWT4hkX2hA1QPKLF0NWsyPrN9KsZVdx6HWbdsN65XDc1+0qtFLDEXvADcGATxM2ROBFdvmLrdrAUNnsfdtsRk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekZYTUxwYUJxbnFPbktaeEIzaDlyMnZSUWcxZW53bFNjWUpJd3ZhTkkxOHR5?=
 =?utf-8?B?eHc4dTZGOUcrQWhwUytudjRTamRWMGpCUU9EMUI0Zk1DVWFzem5SVFdIdGdl?=
 =?utf-8?B?eW00eDFXSDYzSTFiM2pKT3BMamNRdlpMSVlOSFU3a0hKcDQwdEF1bTE0VHJ5?=
 =?utf-8?B?cTczcHRLWllqQTBMZjBtbmpUWXZTUUF0YnB6RDUwa0gyQWJTeERpVW5CMU1T?=
 =?utf-8?B?aGFtYy9ZZHRudjMrMWdyd0g4NUN2bEFMblJ3SnB6NHlVUS8xSmlOOHJqMm1H?=
 =?utf-8?B?dmIwaHl5d012L3Arc3VDSmxGc2l0L2lIOXVvNGRicjAvanJMMWtnaGNWT2NZ?=
 =?utf-8?B?SXFRcDc2ZmlWdC9UQ21Lb3JFeHc0NWgxUHVwMWtzY2tySlM0YzI5ZGc2ZVdo?=
 =?utf-8?B?cldVWXpUaC9URGFhUHRjYTN5Nm9ZcUtpWFFvV0RmS2MxbTNtbm80MXVXK2pI?=
 =?utf-8?B?Z3JkMFJjMXFmK05sWW1MdGRDbEorUDJ1TWp0cFdyKy9wVDAzNURieTJkN0Nv?=
 =?utf-8?B?dGJWckZhRG5yUlJhTnI1bm83ZW5GSEoyMzJlNGJYbzNHTGxFbkE0YkdoVkV1?=
 =?utf-8?B?d2o1eC9keHZRMzNtVjBkWUg2R21uSEFXUUdmZDdyQldIZ3VaM3ZpcVpDRldj?=
 =?utf-8?B?dHpCZGNRMWR3L2taK3IyYlRnS3luZlJiL0NGWHF3V0ptT1JDWkFKWXRvc0di?=
 =?utf-8?B?ZmtsbEIxbjVoQ1Z5dk5OS2JiK3I0R1U3Qm1aaGhVMkVzVVJjTURsSldPb3Iz?=
 =?utf-8?B?Z3FOU1BjM29zTWo1QkxsbVRKQ2h1Z1BMTFVyWEhNV0xjYzVuYUZKVkNFcVVa?=
 =?utf-8?B?aWgzSkpLbHNvR2dzL25EMzFDZERaejJnc1lZTlNGb1F3dExlNmVuN1pnN28w?=
 =?utf-8?B?WnV3Mjdrb3NCYVZoQ2t1aWZlcXJ6ZFdxYmU2SklVTXVvaHVyc2g1RW1rdWZ5?=
 =?utf-8?B?RFAzUHF0QXJqNEVSbVNMM0NFZm5xd0M0amZLRHlCRXFwRnV1K2lmMzB3WUhP?=
 =?utf-8?B?YzVYdWJQMGE3eC9NYkVyVlhXU2w5L3hEbm56bnNDT1FVRWJ0Q25HU3RBZFFF?=
 =?utf-8?B?azA1K0NKN3BJVGdLVHBEaUQyTkNGaVpYd3lrd0w3M1ZVZUVtbTB0d2NMZjBa?=
 =?utf-8?B?ZjdpZzhHSHFlVVh2ZHFnWENXOHM5SVV4U3doWTJmbjhFUms5ZlJpdXdoQ2Yy?=
 =?utf-8?B?Yzl5ZnVqSkxQOGZLaEtVZ0tOSG9oYzVnOFdybEdTUis3dDJxbzZZTGYwOFVI?=
 =?utf-8?B?UlZmOE1kbmhEU3VwWnRxWVFnaWEyQmh1M0pqWnIyUTZ4R2JFSWNJVTVnOXhK?=
 =?utf-8?B?R1pMalJCRFYxOWZsL25WWFJEZnA4ZnlNWDlrK1dOR2FxSTdkN1VLMzZNbk11?=
 =?utf-8?B?eXMyYmxLNlp5Z0NyMjFncS9TNzBPbE9nZmpKRk1wY1paUWlIM2owRTlrbGYr?=
 =?utf-8?B?eFE5UGVxUzhDZ3kvRFcwT25GYmFtdG9ZbkY1UXBPRStCaWVDT21DZk14d0Zo?=
 =?utf-8?B?eHBucnNtbHR0a0xlci9tUjAzcGtsb042OTRMZzZGVDVUdUJDT212aTR2N2JJ?=
 =?utf-8?B?VFFSOURyWmJ5SVpneWViRnZ4UWZjVFR4ODBkTGt6SDFkNWFNZk1IZmpZejNr?=
 =?utf-8?B?cE1jSVJqY2ZSbXNGd3hFaUZUdFJMdExydTI4bk9qL2NJclVJTnpmQ2x2b3l1?=
 =?utf-8?B?aEtHMnNCVkdYVDA1b2xON3F3VnBXd2JXK1dpZGhWeEtTb2FlWllPODlicWxZ?=
 =?utf-8?B?VG9Ic1lFbW8vcDNvTFVWVHk2amw3OCtiOUtMZ0hvdDJ1dWE1TGp3cEpYUldj?=
 =?utf-8?B?dDNZanFlUmdjNXZkdVlFUnVIeVZkdjVPK3doZU1TZVlLSTl6eWFFT2ZzMkxy?=
 =?utf-8?B?MWtjVU1OTUVwWGczNVY3ZnYwc2VyUSt3V01PdGNUUnpoOU5oR3p6SGFOMG1O?=
 =?utf-8?B?YzFuV01CWUl3WUx1U2RrTldiY05la1dRTitYNG5DSTExWHNQWElPTmVPa25X?=
 =?utf-8?B?REMzWlFuZE5MbTY2QmZlVE5JeHRRUmVVaC9LUFRDM2xnblZicWMxTUxoMEN6?=
 =?utf-8?B?N3o1UjNRZjNHZEo0bkR2cDR6MmxJVWZ1MnROQm5SdmpHNFdkaVBPd1QyWThu?=
 =?utf-8?B?d3ZLR1dJazFibVdrTHd6SCtjQytNMUZaUFRsOG4wMHBZVDR4NDgwSUhnT1JK?=
 =?utf-8?B?Y3JxanpkT1pmb1NDT0Q0Nzk0RUVHWkRXd2txVkhJcUdPVVN4ZHo4SmRQM1RH?=
 =?utf-8?B?V2dpVHpvaFJuUXhoWDZRTDhLcmlqZXpDVjhWUTVSM2RpZ3pJRzV4ZjczRmo5?=
 =?utf-8?B?b1hzcFZ3djhEMCtKME1VZzBCaVVidk9VUkU4UjNyaUVZREZ2NzAzdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a31596d9-ba63-4cff-69e2-08de7da2e494
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 06:12:50.7932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSeDexCSFMlULZ+r44HWzPDhRU9DFSiEKvLYpjmSsHG24gBNH3yHzVL2dKSrWZ6d+EH1Iy960cPSc/0SiFnTvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7174

On 26/02/26 12:25, Vijendar Mukunda wrote:
> Refactor clock init sequence to support different bus clock frequencies
> other than 12Mhz. Modify the bandwidth calculation logic to support 12Mhz,
> 6Mhz with different frame sizes.
>
> Vijendar Mukunda (2):
>   soundwire: amd: add clock init control function
>   soundwire: amd: refactor bandwidth calculation logic
>
> Changes since v5:
> 	- change the 'divider' variable from signed to unsigned
> 	- drop dev_dbg() logs in clock init control function
> 	- change few variables(stream_slot_size, max_slots, next_offset)
> 	  from signed to unsigned in compute port parameters callback.
>
> Changes since v4:
> 	- update commit message
>
> Changes since v3:
> 	- drop unnecessary debug logs.
>
> Changes since v2:
> 	- Update commit message
> 	- add comments in the code.
>
> Changes since v1:
> 	- Update Cover letter title.
> 	- Fix typo error in commit message.
> 	- drop unnecessary condition check in compute params callback.
Adding cc Dell team member
>
>  drivers/soundwire/amd_manager.c   | 100 ++++++++++++++++++++++++++----
>  drivers/soundwire/amd_manager.h   |   4 --
>  include/linux/soundwire/sdw_amd.h |   4 ++
>  3 files changed, 93 insertions(+), 15 deletions(-)
>

