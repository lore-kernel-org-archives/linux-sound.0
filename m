Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794478622;
	b=RfMzGk75FgJIdvAiLxc4KzCgHWyW9GKLKjHTl7zv3KZHpwGgLL+BxVIamlpAiLT2oVZp
	 LAd+XmAwSq1nE8KDpBXtT2U0oQHao55d3dSeCZCuXKlIdJOopvmThGX7d9Aq5ZO+unAIN
	 +c2LgbVNtvM2+E+zsYzLExqW5wkJ1nKWmbsNHCvqdzUzdrl3/ULTrP0ZmVO/K5OBQ9ifz
	 xhXl79bjZgQmnNyPsJe0Y8lz8GKdI5jxVpOu1BsTa0mtJkMxqmwSkoh8ELWZyuCg/L7wU
	 +WUlX/Xm3rvYdnzQKl8h0nYXVZdrRLzJbk9HLLk8Adf5Crugh5qr3wh1hA1ChkClDtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478622;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Lb5AVM0liK1i+oz1I4+brqzaMvDWT2Taer5AKFiEiPw=;
	b=ckpiDGwqtDDr/n5cgzXdlqQtQoqRzyOwOUMqhToZca1h+1CWhhftwM58+3f/4kdKpw+a
	 q/HMD70e+mEPBTmWkE5Q0vEiWBeOUlnrcnVRL+Ql7DSoeqh9ySIcYKNXg88ZFguZWQbnh
	 dzUp+jAMFfNcFsnESr3WD/mRsKoT5fD51rRjDH+y/dTq2sv4BQuZ0Ek/+HJdjTT++AzOi
	 ygTyQoQU9UXmilONWQsyryRfoH2CJotiGZ6MjitwirDI0KtESbr9pdApAPk2tpwqYcKih
	 hcVu/YxV17xI3bXVw/MqDehEdJJDtnBweguC7hahsuqJVaa2HyU3LFcOlZ7yfemIz2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3PgI734A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.19
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012019.outbound.protection.outlook.com [52.101.53.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2CF606A33D
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D2CF606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3PgI734A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5HWi5H+ZpEnnRsIe8TwKZzfcKP9MAD8GSzvzLE0o6aCr3FDtDVrAmvmxGqWFhw4URwQxxdpKtL5IMaTm4oFGamavV9F7PiE6aDDAy3VX8h5ErHdRtH7bRs8epr/Js7GspqLSKOf3fXlQrRhdxvFlsymoAEahZH6MefoRvoIFBUE8RsuP1a0MzLdQFgrB2/1dL8Iyv6Fcjo8E+Mzdu7u0cRptgar6EmWhJCmtTgjHJIfBxJ4/CmDwesxqCAhcbaNY1nfLTZrJpibWGn1GYzTLTOi0WwQx0w5gvq7ZJ7domjuaR/7dw60fNBGZHBKZvHytw1LRwHnuHPIzIy4q1cUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb5AVM0liK1i+oz1I4+brqzaMvDWT2Taer5AKFiEiPw=;
 b=GEUpe9+TjTyrJQS4NwWvInbAt/K5ulmmEBxgSih4mo+LVM6NYE+hEgwxyEp7niE2Ck9NpMKqXeOJKB2ltbVJAIKHuoGQRAtBmM2c0sz/QCppiF76uLC/qr8HcWS3bSTfW6ZFPv9lzpczQBcEqXdP7ImZJ7FU0bzL4j7S1EhLyXiRt7r27FIMFrZeO8HjBk2+DCMo9Ik11LrQTzXCkNISEaj7ydDKGJZ5mZ8C+2Rq5t2+bXFTUHfcAfa99XPI0Fh/JKc4x2hr2BFKMk80RfZdz/9VQY+wJaT1EIq8lGWm31FQ/NqtN68HPT0EK1d9SUlZtPRIF6q4or7zxru9w5O1Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lb5AVM0liK1i+oz1I4+brqzaMvDWT2Taer5AKFiEiPw=;
 b=3PgI734AlhJBZGUnKNSavPBu9UwB1QMVp6xS/qaqPRACwsgUQpI84xGj0Fzy2OP9Sx9Zqf5VHK7qLwGSU6e68+ieIlLaaOIzIvZcJyvAdDTzX8986Zsr4kO929qgQLdap3FJ6hEq7p9v34giGep2ijWiAeD0I4e746nVHi9A/Xs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by SN7PR12MB7106.namprd12.prod.outlook.com (2603:10b6:806:2a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 10:16:59 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 10:16:58 +0000
Message-ID: <f40e600a-c948-4921-a1b2-267ce131b120@amd.com>
Date: Thu, 12 Nov 2026 15:45:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Lenovo IdeaPad Slim 3 15AMN8 (82XQ) - Internal microphone
 noisy, ACP6x DMIC not registered
To: MrWhoSees <Incognitosucks@protonmail.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Cc: "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Syed Saba Kareem <syed.sabakareem@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <w5JG-PNyghnjA5uvHAeqByp_JpWzyonQXSm2_DyHMN8ywE_5c9uZcXJuj04UJoEdDdRoH429_pn5IWI8yFTwDRk6mDYr3m8YA0yCmfqkjNc=@protonmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <w5JG-PNyghnjA5uvHAeqByp_JpWzyonQXSm2_DyHMN8ywE_5c9uZcXJuj04UJoEdDdRoH429_pn5IWI8yFTwDRk6mDYr3m8YA0yCmfqkjNc=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::12) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|SN7PR12MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: 488b4a30-f74a-4d8e-4745-08df40a615d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|18002099003|22082099003|6133799003|3023799007|261009223027099003|261026140227099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|10067099003|261028144727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	5VtWo0EcweCepA/qsQrlz/Jm431lHGuKDlBKExwnnWIw4o+vfHEUJmW2bcouPz8Oxr0Z+hsBVSItrnF/NV7jwyLw4Ad9+HCRursilLMq7eqqlY6sJuCKhtAUBK6neDEDqen/cgSaTW6cn6cLitzyUSfRUiM4QwJMtmTz77dN/msyRRn73GBfPpTQmpZckzD4xgcUBMCky0qkIYnRT9Wzqks0eTNQ9M67fz2FD61V8+pPILmWjkyqy86ld0JXT5bXZr9Fr5kP3IudrQInHG4pnHyHZtc3FbJr2L+tQMfAbzMCwLuWn6CnKkPV5QCV7R3SyfNDXvZhWgKSjFw14spqkGR0UO4ei6fMY0r8j8bSmgOsLXKZbCH023Mi+KcEEzCUTCqF8GAyz9jaE1JrTZSE+3ursfQzatPs0fAOqYpWKzB5UD4iN/WKikZiJ4evW7dwghzByw77vTuTSwflFuCpIEvvh6vbY+sf94YY23vFSoD81Zuw5/CM70qf4Xuqyeg2PF2hk3DTZP37N6kJuwQJVJNzQTXcAH3AS7HGYe+Dv4MOjW0o8vZ09Q3t3rzWWJ21KUCJB/EfrRUFLVIzx0s6seF0pqON/U6uX1YvsdJWoJ+OJOX4slhQD3aX6+0wcK7W8Y3uGaZIYCLxAW16x5IbkmrSNB/V7wi3dLEjsufYg+s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003)(3023799007)(261009223027099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(10067099003)(261028144727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUQ3ZGhPck55a3JBRWdPcG1aZU81T2VDZEtPU0gwQjFIUFdZZGFJTGR6bUFq?=
 =?utf-8?B?dDdDWXBYb0NYMjZ1OGpOc0tyUUFyVEExR0lQMEpTUUdINFlHT2ZBcG8vMXBm?=
 =?utf-8?B?Ymx5YlplV2lBMmhsRFZIelVhOCtBczVjZ1JicmVJNVk2anpEbTdjbUNEUktj?=
 =?utf-8?B?MVlFVkhOMXdSVTBQZmJnQzdKZW9Kejl1aXl6M2crTUlGYkxIVWxYK012aDU5?=
 =?utf-8?B?UGlhdXM0Wkl6cnhidzJBcEdod2E1U0wwTDU5RDZzODROeGx2NjRvOTJkbURU?=
 =?utf-8?B?RFJsRU9QVkd6eDN0T0dMN1lhMGp0UHNWOUFCNXpTVFRXZGVoTEpwNWI4WnNF?=
 =?utf-8?B?U3ByRFR1MUtoSWk2KzN6RWh4bGt2NkJrWGRteHNFSXFZRlRtN3dlRXZSODB1?=
 =?utf-8?B?UW03ajRwQmtUNXlnbCtXd2VDN3MySUIvdXNwOEo5RGlPOXk3bkJkSnFpSFMx?=
 =?utf-8?B?MFo0UW1TWitQYko5S0t5ckRwbkdiemJUamwvdDdYTmFzUmRCUjVCUGtsODli?=
 =?utf-8?B?SmNydkhtNll1V1V3N20rL1hXVEF0MFNWMzVjU1ZGUnVhWXE4ajJDQnFIVnRH?=
 =?utf-8?B?YXVyZmVKcGZ2YTdWT1BseHZLS3RLTDc4RFp3cmtkT0V4TllvYXEzc09pd3pM?=
 =?utf-8?B?S0Mwb29KRFhORWJjNkdubEx4NnlNVzA4ZURha0syeFF5MklZM1E4cmR5cStK?=
 =?utf-8?B?WXR5UUQ3S0s5azJnVlhGOUtXeGphWXpubVZrNmNVeXd0cExpdHc0YzdFU2FD?=
 =?utf-8?B?akJ5Wmhja202VFJjL3lMQTdtWVJuVG9wNUF2TkFXYzZ0WlcyY0h3VDBseTcz?=
 =?utf-8?B?Z3N4Z0NyL2lQTnVKK09yNndsRXl2azVoazBjQXV4clhHRlJJSE0zN1RqelJR?=
 =?utf-8?B?WmExVXVJZm0xNHdRTjNUcGFvcHNTQTlCa2xrS0lGb0NCbGRVYTdYN1QwQ3Bz?=
 =?utf-8?B?VkN6MHRkNjFTQ2E2S3BZdFMzZjdKd2J3MG9xZ0FORnJSdGUxVm1xYnRneEVo?=
 =?utf-8?B?aGs3SXdwbFN1L2Fway9VWWdzYy9UUnExUE1PeFhNL3JkMWR3Qit2ekRIUFY2?=
 =?utf-8?B?TG9XYWJpQ2Zoc2ZKSHJ0c1owMlVuZkEveWIwRHhhbVZnTW43SlJBMFA4NnZu?=
 =?utf-8?B?TFhKc3lSc3Y4REZFTENtSE52bDdOQ09xQVhBNS96STJZSmliQjVCWW1UWjdH?=
 =?utf-8?B?MXdzSjJrQnZRWjlZemJHQmE1ejFDRUQrZ0NhZGFVcEJXWURrckRSSDd4UUti?=
 =?utf-8?B?SDRZTE51bVBvRS8rVkhlMW0rL1R0c1ZncFp6Z3FYSEJUN2ZBcVBMMi9ubWlH?=
 =?utf-8?B?L0tTbFBVY3ozejQ4d0NWY1J3RGR3RkNHd0djSWpQLzVPQ0FpNlJONFdOemJY?=
 =?utf-8?B?TkxaWmpwNmwvVEZrQTE5ejhvblZIbTdUTnRHUGJYdk8rQmxGUGxwZXhqLzlG?=
 =?utf-8?B?M3RoSlp1QnFXZnNvak94cDkvOU5hSXljeFVjWDFKbW9LZWdEWXZXUmVzZURn?=
 =?utf-8?B?RnVYZ1poNndCVDBsVE1BemVjRE8va01RejdKNHd5UkNTeHNtUFhVeTZqbHp4?=
 =?utf-8?B?V3ovSHpDNjJaUlN2VDliUS9KRWF5b1J3Q2E0SkNFR0h2dElpb29Pa00yYUFX?=
 =?utf-8?B?M1pONWVha1lzS1RycTV2OU9CY0ZtMnk0SzJZaTFEVlZsWi9XQjh0RVdtMFRW?=
 =?utf-8?B?RWovS3VVNzFxRGxyNWZaQmZsSEF4T2NsZktzak9nR1ltMTVoMDNjV1cwS2ox?=
 =?utf-8?B?bFEydkpEbzRQbE5KeEd4UjdQSmxRWHdSM3VORUh3THFhV240WVV3SERZUUo3?=
 =?utf-8?B?OW5ub2lqYUloa2lVelNqbnJLOHhhZmlrQTRaVk5BMUE1OHdzY2M1MmF2MEs2?=
 =?utf-8?B?K210WlVlaDhCekVJR0xTUmlhbG1sTERlaXFmeFdLU3Vhc2xNb1JVUG10V0xh?=
 =?utf-8?B?ZUM1WlVhR3F6ZHBURmNKQkVjUjFGUVU4TnVkTGU5bEMwWjJWMGNtNWVaMVU2?=
 =?utf-8?B?L0J5VndhSlRkR0VWMC9lcjVOR3ltZ3RobFV5SWppLy9GcGxwTy9IZjMzTzBk?=
 =?utf-8?B?NjFKL2hWQTdGMU9nUzhybjhGcGVzUXF0MEZobmxQOVZhZHlQYitzbVlIMGQ1?=
 =?utf-8?B?QkNxSE9aSGxWWm03eTlzU28yVnF6THY4bmVjZ2wxVUFzd1lYRVpPSkNxNWta?=
 =?utf-8?B?NVBoMlRVYzg4SjRIdXJHOGhwSWNPZmRYcm9IYWpsSkpwOVhkS2c2MDVzVDFm?=
 =?utf-8?B?aTBvWUwvZjI5amV0VGNZMktTYWpBU2IvU2pyT3VLSTE0YXV4d1FuOFh5dmtG?=
 =?utf-8?B?cHBhS0RYanhKY2JiY2t5cHdITW9UKzNtclRlSHRVMUhKaXRFZHFyZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488b4a30-f74a-4d8e-4745-08df40a615d3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:16:58.8496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hd5c7Xc1b4K5fVN3wxSyMSQG0CQmo6fpH5W1Zc8RZq6hU4QtK1RBdUh8nEd3RQuJoVDedLaqU0/lHZ3SsqezaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7106



On 11/12/26 15:33, MrWhoSees wrote:
>
> 	
> You don't often get email from incognitosucks@protonmail.com. Learn 
> why this is important <https://aka.ms/LearnAboutSenderIdentification>
> 	
>
>
> Hi,
>
> The built-in dual-microphone array on the Lenovo IdeaPad Slim 3 15AMN8
> (machine type 82XQ, board LNVNB161216) produces strong radio-like hiss
> and muffled/distant voice under Linux.
>
> Hardware:
> - Model: IdeaPad Slim 3 15AMN8 / 82XQ
> - CPU: AMD Ryzen 3 7320U (Mendocino)
> - Codec: Realtek ALC257 (subsystem 17aa:3a15)
> - ACP: AMD ACP6x [1022:15e2] subsystem 17aa:3865, driver snd_pci_acp6x
> - HD Audio: [1022:15e3] subsystem 17aa:3863
>
> Observed:
> - arecord -l shows only "ALC257 Analog"
> - No ACP6x DMIC capture card appears
> - dmesg only shows "snd_pci_acp6x ... enabling device"
> - Direct ALSA recording (arecord -D hw:1,0) has the same hiss/muffled 
> voice
> - Same problem on Linux Mint and MX Linux live
> - Microphone was better \~1–2 months ago
> - Lenovo PSREF lists a dual-microphone array
>
> Upstream sound/soc/amd/yc/acp6x-mach.c has no DMI entry for product name
> "82XQ". Many similar Lenovo models required exactly this kind of quirk
> to enable the ACP6x DMIC path.
>
> Could you confirm whether the internal mics on 82XQ are expected to be
> on the ACP6x PDM path, and if a DMI quirk should be added?
>
> I can provide alsa-info.sh, full dmesg, codec pin dump, or test a patch
> if needed.
Please log a Bugzilla ticket and attach acpi dump, full dmesg along with
alsa-info.sh output.

>
> Thanks
>
> Sent with Proton Mail <https://proton.me/mail/home> secure email.

