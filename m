Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569852DC33F
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752143139; cv=fail; b=FV0j0Sxus6nJBh8EWc3oqv6qyFrlJHM51/VZvnEJzhFFLmcV0hSBjx9I2EnK/+0p9GNgv7ZgPUwbx1BelkCp7Ftw9FGCf30FQRJgPpRqW2Em86yWRuqhW/L+GkP/gXKjbzKKf/6RNA/KCS7AWSwl/xmaZIKro5pGl0DeWn+zV5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752143139; c=relaxed/simple;
	bh=uK7iEEPnUpwRbXeCRx43DawU+icpYqezBhqeXo/zXbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z+tX2RQw7HxAgTAYNi5EHZy2BU5N87OC1zUuavgh+2KlQuoslBj2XwDitw0xWcpMXFka1UWHcqs8RUBdycd2uog/BQVBAkqi3453WPdS2LLLkAR0REyp0NQRR1fbchVtEpfPFMvVl4h5u1r1HIGzvXkSrXyyuhp8LMvkF4MIl5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DjRxQVeZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zdCPm5Cl; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DjRxQVeZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zdCPm5Cl"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A5IKOL024588;
	Thu, 10 Jul 2025 05:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=n81GW/SIBviLGCI6lPwkzScAE+UpN0jgbZRQkssnJ4I=; b=
	DjRxQVeZLYsVPdjMw3oEqHynz/MQoqgXValB5pDa/2Xgpmqd5Xn22wLsl7CfJ2eu
	WH5BMonS6BZdUCHNhkCnjzUCeotXcsygJl6cUZc4dma0jS0y//M1sIc97kZSYMLh
	apKgZp3h1Qx/lAoMVqGAP+kFFI1OWsNWdG7RVnAy9u7evIVtevBQ2qV6alqm7cuy
	Fb2EjP3NTcchvomdKcWKMRm8eA688/LHws86DtmNu+oR56hVDObXdRG0d1Z9709E
	7QX35qKTcJ0VdfnNf1ztw4s+Mu4rETz1R2mcODPrRXbmegJOy0jTSSK/mSEiNBw8
	BLlRVZAWUhPYYcnvzCqOcA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2106.outbound.protection.outlook.com [40.107.93.106])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47sev6b851-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 05:25:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfyVkroY1I+geMEth8f+K5oKJI8yrvdE03NFAxDbSDazC8xmRL0Koistfc0T/9vWTXz/FRUV8va9QToBtTCkOwxtKGZrm4QPvs05yAsVUTXr9Ti7N2qiy7qqZmxwuZdfKEjupAbX1fyCiWTtWxgsT2HK56HoRv0OLZ5q958GFTehslOVIANNpf6O5ZQ/CzDo7DrN8T9vF64WjeygqsGwqxt+Xg/El5PL+YSsZdkNgIiWp9a9JjJnDIlycghTJKaZFl+UCB7+3G5nuJbd8vsaiZMdvchyqROyvIgCduTSzTrsvGVavXx5GaUxoxOjCpHkLyVCocjMvR+MEIgsFkFZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n81GW/SIBviLGCI6lPwkzScAE+UpN0jgbZRQkssnJ4I=;
 b=jPg67wnwRkITM3laPOjb1taaJl6mpKZVzS3/uyaJ1zNIPvm/M3J/lUY2jIh3zYc48yqB9yxAjd7l+R6EvsPf70UmKl4tJTB2elayG6pkOdmBnhcEivKwtzIy8w19KCwQPEkM3rhQHFugHsh7sPDJXQ5EmP1jn94rMG16xerQQPrWn28hLFc42386MRiMRjDUltXnVnRonOAp6NOEcR7EjhKZdQ+FLDvMrntJ1YZZ7bxSJddECHsKiiVzQiWtk3PpKjtGkV8DoH0Pe03EieKNcDCX+A6+EQXUueeL1Bg9kvMGAX89q7rqI2oKENTRIoZIRwWpnghzfuYWEWS75q4OgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n81GW/SIBviLGCI6lPwkzScAE+UpN0jgbZRQkssnJ4I=;
 b=zdCPm5ClXgVBJhEDZnrZaMTzdM/FgXCRytqyg0y5nkpU0mp90NCy1P4fsbWZc94KCCeKprvzSRosl4nL4fcApKq2oxilrdj33gkLQNVShXVen9+fttGZjctjb1KwBKsC5dk7iLiAwXyg78sabbdrXUm5QSCP28e3/7c1Y75XrIw=
Received: from MW4PR03CA0126.namprd03.prod.outlook.com (2603:10b6:303:8c::11)
 by DM6PR19MB4166.namprd19.prod.outlook.com (2603:10b6:5:2b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 10 Jul
 2025 10:25:19 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:303:8c:cafe::36) by MW4PR03CA0126.outlook.office365.com
 (2603:10b6:303:8c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Thu,
 10 Jul 2025 10:25:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Thu, 10 Jul 2025 10:25:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2FDE5406545;
	Thu, 10 Jul 2025 10:25:17 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1835082024B;
	Thu, 10 Jul 2025 10:25:17 +0000 (UTC)
Message-ID: <ca5dd66e-be22-439f-a8f7-fee2e674271a@opensource.cirrus.com>
Date: Thu, 10 Jul 2025 11:25:16 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/27] ALSA: hda/cs8409: Rewrite to new probe method
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: Kailang <kailang@realtek.com>,
        Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
        patches@opensource.cirrus.com, Baojun Xu <baojun.xu@ti.com>,
        bo liu <bo.liu@senarytech.com>
References: <20250709160434.1859-1-tiwai@suse.de>
 <20250709160434.1859-17-tiwai@suse.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250709160434.1859-17-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|DM6PR19MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: 42404f0b-93bd-4a95-b079-08ddbf9c11ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEFWRFhRcmxYU0xUMHA5d2NIUC9Ta3oxUjViTHBDbklpaDlEWnprWGlFaHd0?=
 =?utf-8?B?Sk9Gc3V3QjdKYnlyYXZKZDdFd3dPVXRRdDcyNzdCdHNuNmozZGhGUXBaMWts?=
 =?utf-8?B?NzR3dEFRQmdTd3dOVzhabmE5WWNaUE9vakY0R3FpaDAzVjY0bS9xNGN5aENC?=
 =?utf-8?B?R2VEQkIrMERGU2F3VkpObVFaTEhveGE1ZWl4RzFPelRWUFZTcXFESnhHVFRS?=
 =?utf-8?B?S0l6QWJCNXVUOUVEMGRxZlVFM0tUbndkTk1QTVYvTWVFdUhNM1VEeWVmQlha?=
 =?utf-8?B?cTE5MjNBbnVUdlRCM3NLK0xmaG1CSFpjYkhXUER3YWlRMVNhcDVsYWlZTU9I?=
 =?utf-8?B?L1Raa2U4a0hDVlJRQzF4elJvRDBjbEIySzhGaytqK1FKdC9DWFRrTE8xem1o?=
 =?utf-8?B?WjUrMFh1cVlDOURobmIxYmoyZmNQdWJaUk1uK0JTWVd6Ky9Oc0dTamJsOTA5?=
 =?utf-8?B?YTJadEhZL01MSnJoR3NFNDBHN2o2T095ejBrZGxudEhWOWphVS9VbTNYbXQw?=
 =?utf-8?B?L2lLaXNuRGxGVWlBZk5YSVF0WjZqVjdVbHVSb3FDZ3dYbnBEWTJUbDBiNCtM?=
 =?utf-8?B?SEd0OXQ1MmQ3NTFRZjFsSHlQYjFtc3RoWjM1U1JaeS9CM1hmSnVmRVZ3cjdV?=
 =?utf-8?B?bEN1SEZ1VDJEN3prdEhxZGJtK2dmQWU3NTM3N3prQ2tUUVcvTTRrMVpoOUNY?=
 =?utf-8?B?VUVHbWk1VndQTmd1ZFU0NEtTMG5WZ0R4dXZCbncvdjJrVkI3Um9JWFUydGRV?=
 =?utf-8?B?Zm1UV1JuK0tqUHNTYVllM0RZUkNMYTA0NkVJdkJTZWtJZGRKemJ1OGdWdVMr?=
 =?utf-8?B?eVF2aHV1aTJMa3JLdlZEMmxqbDFkeHRUcGRkeXQxQ25LODRKY3dHSGdYcHVV?=
 =?utf-8?B?ejY0OTQ0NG1ZS3NHNTZmZno4cW9yYUUzOXVHN2NNcHJwc3FWRGlvY3NrTU12?=
 =?utf-8?B?ZWpOOEwzRDdRaWNEUDZvbElQby96djhiY21jL2ZRU1ZUVGoxN2psVjlFWGI1?=
 =?utf-8?B?ME9zVzQ4a1hSYlg5Z2w0TElSc2UwM09ybjVUa0VmWVg2bXZuV2E3Q01qdG43?=
 =?utf-8?B?cm45dzNMS1hCYzJ5VGJsMldWN2dab2JEN0dDREJIL01OcGM1QjVFQXl4U1FI?=
 =?utf-8?B?M0V5UFdTVmJWcVRJL29hTnRCN3dxa0pad1RvMm03T2ZNQWlFK3dzZmcyZmZL?=
 =?utf-8?B?NU9NNjB3Tkl0R1gra0NtcXFDUm9ITEJvMzcyejFBaWV5ejNnWlNna1N4clR3?=
 =?utf-8?B?NWJFamRDWmdiTUxic3haSjVOSEhoTTMvWElxUlQzUnM4R1UreTA5YnFEUXZa?=
 =?utf-8?B?eHR5NHR1cUtHZnpnQkd6cDNMVTJQQ2o4a01tQU12dGxqeklTWFNCajFwbCty?=
 =?utf-8?B?eE1nVGZBRlZCOE1ybHlFdHhrYW9BcEZPSFpLT3NydzNJZzVVQy8yYUtQTTVM?=
 =?utf-8?B?UEpRVnN6MXMyQkdzK0dMaHVmSERrY2EvY0IrdnpaN3BCemFKcVduNmN2K2x2?=
 =?utf-8?B?cWdyVVFycWNaNEJwNTZYOHVMU21SNzVNQlRYMGo2KzZoS2wwQnpUUS9IbGt5?=
 =?utf-8?B?R21wZjVtOHRHOE13bDhUUExkMmpNNWFwaWxIdnUxMEI1ZmxobmJwd0tuSC9L?=
 =?utf-8?B?Q2JKdmNZS1h2YmExcldOYVR1dUlTK0RsWFhmcURMbFY4Ym1tZkNTaEFrelgr?=
 =?utf-8?B?dzhwR2ltQ2grSEwwUW8zRVB1bVNkUG1tNGJXckVOem5FZHkvdGVWWWVPd0FB?=
 =?utf-8?B?YUhLeHdIbmpSZG9LQzVDK2JJNmd5cE1ibTJqcFVDTm44NGErTnd2K3Z3aHFq?=
 =?utf-8?B?Y2c1c0tBSnNBTEgwY0h5ejNqSUp6aUhxRDhYamozbG9XQXdHSzVCdEpjblk0?=
 =?utf-8?B?VmN5Rjd0MnFIMDdQc1dtMHBpYWtsajJINE83L0t0SGtxSGdMRzFNUFFZNkFp?=
 =?utf-8?B?Q2RZcTEyVWdZYW9YVk0vRXR5d1dXb24wR0RpRll2UFNWVFhQbXJUcFFFQi9M?=
 =?utf-8?B?TVIrdWR4UUUxRUNqL2lMS09ZcXVXcE5sQ2tHUzdLOC95ZWRMYkRtSG04RFlB?=
 =?utf-8?Q?YkAnxM?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 10:25:18.5538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42404f0b-93bd-4a95-b079-08ddbf9c11ac
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4166
X-Authority-Analysis: v=2.4 cv=Zb8dNtVA c=1 sm=1 tr=0 ts=686f9512 cx=c_pps a=rl1//fhvTxweIEOz/Le0OQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=XHqIEK0FMQc4XhSKiMUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA4OSBTYWx0ZWRfX+yHtX31iX/Ie fg4ecnflqzwG08LpnxlfL1bnx9hGgO+BRFpbV8mCubxJcsyU3uH7e2fYB7Gdn0iHbMuGl5PjcTo Oiqp82KUvhvN7isuClnFoBl7dT4CyJNmKN81y4wkt65vQzW893qH6n9NROvFXX0Mz10VycsRhkB
 uF4mdXc4cbHvfwnbyIyjfh4qEcFvuj+veUr8aASrlWnLVctRzDrZ9inXyEWEL5RtQxjlCvet8mB ANMnn1DVaVaIzzaP3IgUEETUH/4BECx/Xce8WF2Ll/T1V8pxZ8lng8FrHaCNQ1IjnloWeqycR8O 1Fe9r/vN1CAmDQr0MM1Av/86m4M9OQo/+4UWEqgWkzVBysvx6x5z8iT6Akt5X80lhuj8uaO/w+u
 60LD773deXSh2mQndJKHVXl5hXBnykVnxYviinAUfTRe1hSR7feDQtRq/fJoCna/Xl0WTzlO
X-Proofpoint-ORIG-GUID: TUTEKQkK13wROYApM0OGlKha8-TiA9rs
X-Proofpoint-GUID: TUTEKQkK13wROYApM0OGlKha8-TiA9rs
X-Proofpoint-Spam-Reason: safe

On 09/07/2025 5:04 pm, Takashi Iwai wrote:
> Convert the CS8409 codec driver to use the new hda_codec_ops probe.
> The Dolphin support needs an override of unsol_event callback, and
> redirect via spec->unsol_event function pointer for now.
> 
> Other than that, no functional changes.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

