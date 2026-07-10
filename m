Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010005.outbound.protection.outlook.com [40.93.198.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546633E3D90;
	Fri, 10 Jul 2026 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679921; cv=fail; b=qU/iLilEMXMmqvlMb1OvZXGVZmdZhb13DOA9YWArk8OxU9k0jWLYnsHYOYqkt+OzAZyPcn4yeQAoaF2hyYEtzJ3AuMd8+cRLcDlsIf1Qpy7pPsmyIPlAbQwM8nvFbvu4mrDEsA/P4ry4qlD4B8Bpywc63aUWISqbYtvHvMbAURA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679921; c=relaxed/simple;
	bh=DoGRaEwr2kEX8kEQ5NColJQqjIU11H7XROOalVZzIQM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KFN16ljeCsMhqO1A3tHlB7Eugu4kAJGRd+GtE2qNnne3nY300i7/nou4xyQTGgcr1JwzqO8pQ4fQlSA+lSLMBAxsp+KNa0ErJ1eiCkC2SFMJD+SVf+Jms48Wqci94YWYNpWg7jNPC8u/qZXE/7HKqd+u36b1tHiKGkwNpe/jfEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aKnXPoI8; arc=fail smtp.client-ip=40.93.198.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aKnXPoI8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhxmlA7DYJgGmd7AVuT/Zizc+1FMNME0ifTwO4ObDGKGBpurfZblRRwHk09HUDDkEIlO+ckgt2HQNHOPIFIf6Vi3tNYanrHG+zYijjextFGGkhb6U/nqPBeQ30xa0qQzIhCsXDFgE1MFBgu+xSwyInfxyZqJXAhxRhTgJGMng8Zl9h9iCGCv89yxkhvF2kvQE3i14RfBYJXB6mWrD+CzApj3nojiTVnDQB05qGozDRnME0dZfg6Wj0VqMpeMEEB1avrjV7h0GmWvAwaUWaA+Y1OmcpJtdrW4bIe3pSOJVZHF1L+pgoK74adkOgTqpCq1SEUOgELmeYUIDQv6Us96KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtVup83iiRAS4w2inQhehDRrbssVAbxEZxqGaQmgvrQ=;
 b=Ec9ROw0kLPr2Hauln92vjEIfe1aHmSCzbtpai66NU6h2d/tLa9bMGuYYPp3ri6/0gVedWKlEvl7NEJ98/xfG09/FFXTJOgRr+g1JhoVM1xmhkZBTKPRWtYDQ99GTsmrwMMyHn2zVwAempaAoLaT/eXVg7hUhohQyrinxmd9idG7dG9KS5J6nmUrcaYxHeXAjxVQy5H7OdGY5sT9REAGZCvzhjYS1x31Z7phVIszk49/Y1508gYksMcNh5z1QlFSISz9L5sYC4M6LYUtZMPDoTEwA3+I3byj1Gb3Zlz+ihxGyr/igepelqxl/1BvSm8aiQdY88pgkJXt1m8nkln6iqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtVup83iiRAS4w2inQhehDRrbssVAbxEZxqGaQmgvrQ=;
 b=aKnXPoI8dzM0YlJeyqSZOp51GJiVXYnM6AEnPo3ZaAT0WIka1rQ93xWxdAqjBX0JLO8zSDodP+ok0xS0ALgApb3Z9H+zTmU3rASlICKXiz2MOKqMZJF6siZtjUlI4QtKF83LzDpCPXYgOQYtu4ThL5uMrPorb+bpwZ529MxGuDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA4PR12MB9788.namprd12.prod.outlook.com (2603:10b6:208:5d5::11)
 by IA0PR12MB7649.namprd12.prod.outlook.com (2603:10b6:208:437::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 10:38:36 +0000
Received: from IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db]) by IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 10:38:36 +0000
Message-ID: <ee7ed7d7-4ac6-4e17-b493-7b5f1c3d31cc@amd.com>
Date: Fri, 10 Jul 2026 12:38:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and
 drop redundant error handling
To: phucduc.bui@gmail.com, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260710102138.29347-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260710102138.29347-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::20) To IA4PR12MB9788.namprd12.prod.outlook.com
 (2603:10b6:208:5d5::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR12MB9788:EE_|IA0PR12MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: e70f5e75-99cb-49d6-cb43-08dede6f65d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jzXCw0NmLFkw1L9twKTXFFcqBm/ObdW8GGk+MWV1caAIaso00S5DsE/m7HyTHAFs/YT11OZhwC/tcApSRIfILEGQyQVNCp2Wp2xcMPZMAzWBLIwWyloHRevY/WiIZsn+zp30uG5nkZ7LdmnWPQXRmOUnyLsDHbxB60OgkvxxLH9Iv8UR9dfFINJS3WBXVoXSQqSCrG+HhUyh0k0U+pwDzGLbHtC5I2dC5jMrXGDDQDnyuXnUqPHkm6INFE4p2l18jnCHeKw6hx/ALuuDkMJW5NSgFQFZ1W3+bLTjCHPQr+E0Jrp1FALk4PEch8fC61RC7dkrd8v5dazYF2Z6x6LakJITcrw+KQeL69CGjhvDZGUsvX5haa9okC0GlkRIjJFKkPjgYaHw8lMj9mosPcqaERbEQXiM2yhC1Hrs+nNfyIQ6DVsUTos/+sfVaTIjhJYsVc0zMH+GvS0j6BQHxFRbVcmVecDhBvKVFZvdZz2Lgm4ojU+u4wxxp6PtVmo+kM+Sl7MACCQO4GumHDXM5g40rxkYyssaFKfMM2S4dJt4M7ZH0wV9A4mLqVbKkiMuqIthZhY3yUVSHEFcsu8d1Fr2YHApbXbclGsMHTgK0R9ERQ2BLJDCYHJc+SrwZHZuvnJSeu4s7rfJvjO5f7ZgaTVelDjfpT/fN9Q31KK/FRMA7ck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR12MB9788.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDBmaHdUalpnRk96TzFWRzhZQkFaNG5EVjcvdlh6d09OYWsrMks2T2pPLzNK?=
 =?utf-8?B?UXJQQnVvK0JnR1JjY2t0RVduMk5hNmY5dUpWSVFkdmFLaHVCOGpsUnErZFFl?=
 =?utf-8?B?cy83OWYrNW9oeUFQd3JJRXpISnhEcmwwWXFDZjZsYW1zemF3TlpZSlMvTmVQ?=
 =?utf-8?B?RU9GcDEzRThzdXpXZFFpY0RzNVg1amt4UXZsWFFCTHpIdm5BVmtiblQ3OVBI?=
 =?utf-8?B?NEhXWmxFekdJWE53RFpLS1JlNVB4TnVQejhOOHFpbmxzMWNUOEp1cUcrTEkr?=
 =?utf-8?B?dENUQ2Y5ZjVHaGxrSXhmRDdQdGpheWZWdXd5NG05emJnUldsZnpQYTlNdXd3?=
 =?utf-8?B?TXY5a1ZkQmc2aGJDQXB6L1h5V3hRVkJlRkl3OGFSSE9jT1kzMEYvUThPQzgr?=
 =?utf-8?B?UVU2YzhEOXR0alpsRVVuY3V2TkI4VjBuVEtENHFHVHNBcEVwWjg3dXRIRllv?=
 =?utf-8?B?bENvL2pKWm94YmdrMlZJVTQxNlM0TEhzdDBpdjl4UzNPWXpkV3N2OW9sRGdi?=
 =?utf-8?B?cjgyRXBnSTRNbTJPNk04a2R3VG9EUElTcXVUV0tvdHBFTC84bEtFUG55WGla?=
 =?utf-8?B?dkhFR0psUnVraHdOL3VCTWRJU0J6UUNxTHByUHN6OTVqUmwwL254dWh6dDBw?=
 =?utf-8?B?YmVQejJZWXFvVUVhNDg3Uk9lVkJvTFJ4TEhvNmpFWGQ1QjNkMEtWNTRwK3Mw?=
 =?utf-8?B?VWp4bHBCWDBxUzAzdW1DVjhKc0dPMFUvaXVzQXhkTFo2SS80dGxwRG56V1J4?=
 =?utf-8?B?ek5ySmxkdjA2a0I2czhTQkIxZGRSMWVISW11aTFJQVk3YlJFalN5T3ViUi9x?=
 =?utf-8?B?QmxsTDhBU0RmRmJiNjgvL1lCOWJLcGxkRFNobzZhL3lidHFSZWllTnEvVThV?=
 =?utf-8?B?WWttaGk1THFoODJCdFFxTkdSNGh5dVVZUkc1RElTZnk1NjJoZndhNEtPRWRK?=
 =?utf-8?B?dEJ0ODlBOVpNUHpxK2VGUjQwenpFNjhtT1FEQm9ZZEZ2WUU5d1dYOVBPVDRI?=
 =?utf-8?B?RWQ0bE96blJxeGhKZEFOUFVIc2Nvd2IrdzcxN0VlNjY0VFNJZFZPd1NmWmpa?=
 =?utf-8?B?aFo4UWpkOVhDczdna01kR0lLbm9HUlpGTUhrK1pzalBjckM4QlB0WHNTOVFh?=
 =?utf-8?B?bmFrZWRDaW91amJNN3pnaGdLcTArZXFIeHNUYlZjd1RBNGtLNm91V3BOR0Fz?=
 =?utf-8?B?ZU1UWlJJU1AvdjJpclZHWkN2aUNyQmxGUEExQ3BQNy8rYlNxc0NVcUpNTnph?=
 =?utf-8?B?dWdQdmpSaWcvdThSNVAzR0Q2bnFGQUNOWTNOc3c3S2R2UnV1SFF1V3FFeThV?=
 =?utf-8?B?elFBdVJiSEJoQ3NsRitydTI1ZmZMOVZ0L3NCbm5heVViNU5FNC9vc0tFWkNQ?=
 =?utf-8?B?QVczUmR5aVA2Ulc2WldmV1NhVDd0Zksvcm5RWXhlQWt3VVRLVEFESm9QS2tp?=
 =?utf-8?B?REVNQWpBdFFCQ2xuc3RlWFlqcGhMS2YwVHN2ZWdOZ0hKbVBxQVZLTTF5eWxT?=
 =?utf-8?B?NUxkOGlKQ1BRYnJJUCsxMW13L2FndmpMR3hMa014TUpaZnRkb2MwcXB4NlNi?=
 =?utf-8?B?b0k5SVc4YVJtT0oyVURvbWtNd3FqdS9MODlSOEhFbVRIY0RFQmhzbHdrM1JI?=
 =?utf-8?B?N0FrM0xOZU5UL3o0dmJrbFIrRExoV1pvQjA3V01hUkFvYlhXNFlSL1J3c042?=
 =?utf-8?B?WFRPNlJPemczUnRVMlV6VURJK2ZRblprUVZ1YitrbUhiY25kZm5ZYkI5bzh5?=
 =?utf-8?B?V1RobEZwVTA0ekZjUTZvaG5RVGRnakRWSHpwUUdnaGF2MlBHdUxUOGhrMmM3?=
 =?utf-8?B?TXE2YTFqQ3VibG9SNDZGaHFqUTJaTFhTQmVHWEpTSmZHSS9ieU41eVM0NUtw?=
 =?utf-8?B?cENNRDVIME9pVjJhRnhZeG5MaUcyWmxKcGtRMUduM3ROb0pJYkRqdEZEWTJH?=
 =?utf-8?B?WVBKaUVQdktUQ0JlVDRSa3pJRS9XRFdFTVlnZHBSMjJRcW5kbU5xdEZ3cFds?=
 =?utf-8?B?cmZocWtZRTJCblVPNm5KMWZTVlY5Mk9Va2NSeW1QWmY5b3hCdmJzdS9DRWpW?=
 =?utf-8?B?REp1R3Y2VjdKaGZSaERsY3A4M0l6eHczQXRCR3ZiOVhNWVpUek5PQlZQSHo0?=
 =?utf-8?B?Nk1uL2tNTzRTWWFjTmR0bUdUblhLSXpUbzRNRXN2NzFzQUp3OGY4ZXQ0Mmdw?=
 =?utf-8?B?c1orOVdHRFY2NHovMVM2dzNRdnlDRXJHTkdhbUVxeTFlNFZaMHcycnpONjVl?=
 =?utf-8?B?dnNuZ2FORnJxT29mTTJaOEsvZ3dGb1ExTXhBS092amVXT2dEOGpHT2lmYjJW?=
 =?utf-8?B?ZEhmMGdNVkl0S09pWUxYNHFoQ0NOVHpJaFpRdUV6eEhyS3k1b1NoUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70f5e75-99cb-49d6-cb43-08dede6f65d0
X-MS-Exchange-CrossTenant-AuthSource: IA4PR12MB9788.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 10:38:36.5783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCST31GZx5yvRbStxmD2GLw9Af/AxAS6WLaFt1wxDf9DqSYgIh1QAFip2NAq7FcY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7649



On 7/10/26 12:21, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series cleans up error handling in the Xilinx ASoC drivers.
> It replaces dev_err() followed by return with dev_err_probe() where
> appropriate in probe paths, allowing deferred probe to be handled
> correctly while simplifying the code.
> It also removes redundant dev_err() calls after helper functions that
> already report failures, avoiding duplicate error messages.
> 
> Changes in v2:
>   - Split out a separate patch to preserve devm_request_irq() error codes.
>   - Adjust line wrapping.
>   - Add the Reviewed-by tag.
> 
> Best regards,
> Phuc
> 
> bui duc phuc (3):
>    ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error
>      handling
>    ASoC: xilinx: xlnx_spdif: Preserve devm_request_irq() error codes
>    ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and drop redundant error
>      handling
> 
>   sound/soc/xilinx/xlnx_i2s.c   | 18 +++++++-----------
>   sound/soc/xilinx/xlnx_spdif.c | 31 +++++++++++--------------------
>   2 files changed, 18 insertions(+), 31 deletions(-)
> 

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

