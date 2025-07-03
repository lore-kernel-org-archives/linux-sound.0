Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C605C2E92AA
	for <linux-sound@vger.kernel.org>; Thu,  3 Jul 2025 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551736; cv=fail; b=vDiB3DY474DyQblwxWciQaj1dY+l53kAQkITcC7B+swKjDuS+/8iU44qBenwXTA2r++JedkNT+L7xvrAHtxRfAcU+6iD7mgakxsPtLulxyenUIS2IH6D9HqFjYgFRoWT0FxqNlfYw/lKMEvR9grbqOUl5XHO9fgKOS5WhHhvPq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551736; c=relaxed/simple;
	bh=6JlB7x56YMKmNeNq1kEYhTI8oQmWje0fsKpkfjDqUkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hOasiuAR3TWmqTpQ3vfqDSaooECWVBkHd1XK3POHDowyqb15pf15Aqp1UR9/WNmOJgaUQhPOuba1AnMfh+DtHoAee0/cZhDjiKDOZ1OCA2fevHQBPuz/dXu7Gm8Gr30ENrjhGzSxXf8s7vDQmwTx8GSj8zgTBaalOGIAoO0FAIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PZ3O7uUl; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=q+Ua2OnU; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PZ3O7uUl";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="q+Ua2OnU"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563518a6004676;
	Thu, 3 Jul 2025 09:04:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=p59VetN+dUf8yDlZ+G1hXqeLFVShW/H3eBurMXz6Cik=; b=
	PZ3O7uUlEM8nR32E2fxp2fk3Qic+tuIfWGWaWNyic2vLUIO0FZ9RTn12nd3bQCa2
	OOPO8bTXwxUNWYhqxsX0TrC4F6LfiMCDakDmjmPwSJb40Lu9Q2wIl5VNzoexmW8C
	0SoLVDOjYoGwq7Eb4nNKlKNeTjZ2D0hW0cHVJeyD0SskckpGQAmI+jucKh2w0Q16
	ylUArKmKiki3fTRQURYIdu8x/NSPAD05lEal26SDGB112eBWG4y/jupsUHk3OJUa
	xj7X9A1iGTbZce8RP9grQ4r7y7XmX5xrm12PaSuh3DoxM9P2TDPI07Re2Fv05WnN
	didnT+J/zkdfGMXmoZeNYw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2095.outbound.protection.outlook.com [40.107.236.95])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47jcth76p5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 09:04:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpjJiYxkY7EXHrmhOytSD7P5htKNscRp8o9ByP8XrsSXtQ2t0RA+WMkKuB1OTpCN/0TpeMaJWRmZQsrktT1oQ4OAvdRIQCe7u03VY910HPHGD/ZLIGGIIPuZaqqzW7pTfCKnqCXocMGlwQtNeopJLgK5RMCGRtC0encDinYT91xt8KzEvN1uAYcScdm/DmBtqot8ssOPQxZLtK/qDHSyZzuVE0/BcbdsdWpzxMJ6jOBWCxzddOUwl//su9MOo5bakXeuWEXOO35mxExkxbt5ERgJF2NnWq4NMWAxPrASRSelXS40UPPlMS3acLRXD4lDPXGaf4uH64Jvj0edFWAk7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p59VetN+dUf8yDlZ+G1hXqeLFVShW/H3eBurMXz6Cik=;
 b=OWLbwuluY9X8GVrX8HvEqcNxXqSC8bASAQvOGQ6SoicUyEZPDdhAJlYH7mDvAYQlfsEHEZ9PDh941M8PAWw2Xv6NNhnbvfdCO6GyMAgfLJnXlRvj5135BM8xjy0Qlp11MmpcGBVR4DSwZtGfjpKhAtBIJgtHz+XkcmT9DUidAd8i+c7tcpiv5HqNKzFaWBAOLttAT2UcFU64eXgqdVFUTyn6cI+cOHub4bMBQv6DLAUxey7zYj2EK4etlQqFditVCjdb9trcj0uXInYTpKh1u6MRNrJXEV2B3HjyC0bpWo3Q98mxW5dUEsaa/J8MxJ55/qrJ0oHAX9G8zE7rgYH8+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=suse.de smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p59VetN+dUf8yDlZ+G1hXqeLFVShW/H3eBurMXz6Cik=;
 b=q+Ua2OnUBsxSGvr2AlRM1GFExCBmm3IFz+VepS5aYMu7Qo77bTGj8T5vIsg7mFJxp7UmEyd/ltCVRbN5Ta4UG1tyaD+1CgO5CxG/OaHbyYU9pSNL6F4AAEF7IpXFNU5YycqnrH2q1ifelz6D6uw9E+CVIZdigY/v4NIVbW5W0Vs=
Received: from BY3PR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:39b::12)
 by SA1PR19MB5037.namprd19.prod.outlook.com (2603:10b6:806:1a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.17; Thu, 3 Jul
 2025 14:04:32 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:39b:cafe::d2) by BY3PR05CA0037.outlook.office365.com
 (2603:10b6:a03:39b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.15 via Frontend Transport; Thu,
 3 Jul 2025 14:04:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20
 via Frontend Transport; Thu, 3 Jul 2025 14:04:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7BC2D406541;
	Thu,  3 Jul 2025 14:04:29 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7664582024B;
	Thu,  3 Jul 2025 14:04:29 +0000 (UTC)
Message-ID: <60be4a8c-6147-4e08-9c20-24c54c51851f@opensource.cirrus.com>
Date: Thu, 3 Jul 2025 15:04:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Reorganizing HD-audio driver code?
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
References: <87ldpdgzle.wl-tiwai@suse.de>
 <e6451c29-2ade-4b73-bfd7-f48bafccfa98@opensource.cirrus.com>
 <87h5zygawe.wl-tiwai@suse.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <87h5zygawe.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SA1PR19MB5037:EE_
X-MS-Office365-Filtering-Correlation-Id: 36105e2a-5014-4cec-99e3-08ddba3a882b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YktrU2N2dkx6MGxpV28zUVhqZWozNjJvR2t5Q3NXcmUxZU9DTnVVMnZDNTNx?=
 =?utf-8?B?dlBMZHZiMUpScVcwelhHdVhDYVBqM0J5b1A1R1Q1UFZUakdmK3UrUDdRV3pa?=
 =?utf-8?B?YXRBYS8yeXlrd2xSS0lhUlE0NGlGT2VzS1c0MU16d1RtYTFLSVdyL25kdHh4?=
 =?utf-8?B?azBEY2grbm5zVEZMdTZETDByZUZ3TkdnY3djZTJEOXdXNzhsNE1SYTFQbk5B?=
 =?utf-8?B?VEY4YTZvZU1BY0xRbnhCa2ZKQWt4K09sNi9TZGwxaDRLY1JmWUdMRkJMR253?=
 =?utf-8?B?dmpReXRFUVgvRTFqLzlHWm81NjEzeXdsN0xVWENoM3g0Zm51YzdLMmdVeDYw?=
 =?utf-8?B?OXJoUEVjT1hsZ0VFY25Ydm1DdXphbjU2a2NycDNBZzRocVhhV214bmlhMUwx?=
 =?utf-8?B?Nytyd2FBK3FHWWpvcmJ6RldPNnFNQzVyL2REMkVkVklBNG1qZ3pIUkNNdkpp?=
 =?utf-8?B?OTZ6UTB2UUQxelAwdjRBSHRPZ2lnTjQyeVA3VWtOU2p1WTZLWHc3c3h1TDBR?=
 =?utf-8?B?Rk5yRHJ3TnhVTG1zc0tsMVlFQVU1OGk2cjR5Zklhb3dGVDNPM2xTbHhKMkJx?=
 =?utf-8?B?T3p3amVEZ2xCbTc5Sm9BNzFOUWpHWXZGRE51ck9mU1NKRm5LMWNhY2krbkVo?=
 =?utf-8?B?RWJWQUc0THMrMitkSHROYnVjT2xNdmhhOHkrMWJZbFJQbFluYit0SkMyRU9Z?=
 =?utf-8?B?L2wrSTJKa0N4Ti91VlJaakZjVHVqQ1NpdnduYk55bUkwV1pHa3RUN3hXcXdP?=
 =?utf-8?B?ZkpxUkluU2UrYm4rQTR4bnVYSllURDMzU2FhSVZWcS9XY1poYU9ISDg3a0Vx?=
 =?utf-8?B?VFVubG1LRW9mZWgvZDRaVWRrUnIyWFY1UzdIMFRRQkgvVG5BL2Zub3dGemcy?=
 =?utf-8?B?WlJyd25VdVJqV3lXekFheXpCQm9JdFg2OGN6MVNXMzlQaHhrenovZ2gxMzIx?=
 =?utf-8?B?dE1vTVJHWDU5TGhrakc1MGxTbTN3L1Erd3dCMWYwQU9Nc3ROR1Q1aTJ5aHor?=
 =?utf-8?B?bndER0wwU2VGb2NoOEdmbEloZm5GK09LUDJZVUpScUVtWjRrSDNFeDYxZTFz?=
 =?utf-8?B?aG9iVjJ4enBkdzRMYWRFRy9ucVpUa2JHdU1kYkJqeDh6VVF4d2hkYWVST1pE?=
 =?utf-8?B?WjM0clZZeVgrUklLVXJLSGJaT1QwZDA4TC9jdmo4QmhVZHdJamJWRHVQbWFY?=
 =?utf-8?B?Qy9BTDNwU014c1AxdFBlUEkrS3k4YSs4eUJKY0hNS0t0ODlMcnFTZE5ZYm1F?=
 =?utf-8?B?aFdTZ3FnOU0yUGdvNXlMUzRVbFlUNlRPMFh1R29GdE9nZ0RWRTd0cmtCR3FF?=
 =?utf-8?B?K2VFVVlkNzh2K2lveklTall2a2pMcHRJWmhrdWJaZ0VER2t6WUdDTEt3cS9J?=
 =?utf-8?B?SEtMcWxEelJQK2w4UUFjNVpmUGI1Wi84ZmRCbm14YUs1N3RkNFh5RW9ZZE9v?=
 =?utf-8?B?ZGhwaCtiQjMzbjBOcEc3aklrdlZvQkdKaEVSOG1Jb0RxWEJaVHp6TVh6NTgz?=
 =?utf-8?B?OHRLYnY0elY3a2ZWWjB1S2dkcFQrankvWmt2WlRIU2srVlVyQWFPeUJZTWRU?=
 =?utf-8?B?YTJPRFFQR1d1Vnp0NzFIeWhZS1h6d2VVSHFnS2V4NVdObGI1N3luakQ3d0lB?=
 =?utf-8?B?Y0w1OVpMRDNxbjBrU0hsUVQ0c3JKaUZydWRnRzNTNFdtOEJFT2NxWEt4SlRY?=
 =?utf-8?B?WlJuY1lKQ0F5RlBtNTg1WEpkSTQyL3g1N01HQlc2MExMZEQ0SHRPTVBxUk9K?=
 =?utf-8?B?MGoycmh6bE1LVjNqN0lseSs1d2xxTC9wVWhHZXhKa2grczA0SnV0UExmaFYw?=
 =?utf-8?B?eGJ1cFZTTGFPN1ZBUXNQeVgyK0JuOG1PeHFUM3lDWC9IN3pRRmtIM1R2S3d1?=
 =?utf-8?B?bWIvSzdlbmQ4ZEQzMEh4THZYSTJTN1hkMlQ5bjd2bGxVQ2w1Q1h5S0V0L3Y2?=
 =?utf-8?B?NlRTOGI5bFQ0VWx3ZllWUjZXUVdpeUFTcEdhcUpaQ3ovdkJaVkR4QWoxWDZO?=
 =?utf-8?B?bkNmb3Bnem5CV0l4OU9PV1Npdlpzb3V6MjduM1diaDlPTkVMZG1zM1l6bnZO?=
 =?utf-8?B?dU1DQjVPNUxMS0hCNjAzTUZ3cU5hUmxzcDB6Zz09?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 14:04:30.8542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36105e2a-5014-4cec-99e3-08ddba3a882b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5037
X-Proofpoint-GUID: fVuSz7HEVGj2m-K2SClV1k4FCLJQxlUL
X-Authority-Analysis: v=2.4 cv=Qste3Uyd c=1 sm=1 tr=0 ts=68668df3 cx=c_pps a=tuM2TBo6X2LIU9hvJTieQw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8 a=uXu9eFypoQSNIvrhbmcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: fVuSz7HEVGj2m-K2SClV1k4FCLJQxlUL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDExOSBTYWx0ZWRfXye4Spqf2dp8n obxSLWBCi31CMpFqjL/Bc4m9zhaPm3c4iqrM3Gv4NeGZ8Tspt7V/KxvH50QGKklAFp2FTWrB104 /8pFkVEREx0l5QFZD0WIR4ZShOc6I7mIdSXUzRFW8cBOMAEnig8oB6cZbJP5m69Dzp27cHmF4SA
 f3Ppv84aPV96FdvmVesZkWK+Etk+Cs81QISCZXCtQmTWSnw55ampB4f8loolhNK8H9CZKbcs5++ q91y2XA2qXUFPEF9N1WU5DKz49bmdvre2MDIpB2uitgVfSEAqc+G8ZJdrW2J7QRZzTqHaZ4wh1p NW67Egiw94V5dHSmTq1hJmRYI+0wq/BZv+zYhjbP636Weqjol2f7VOFbDDMAy0OioWGS4PmryC+
 wenyVMZj7joqaUxFLvpsNp2u3tPXZAuNWttI86E/pjHHUB8K8m/cELDyH8GxiHGxU9l+y78J
X-Proofpoint-Spam-Reason: safe

On 29/06/2025 10:22 am, Takashi Iwai wrote:
> On Fri, 27 Jun 2025 15:22:20 +0200,
> Richard Fitzgerald wrote:
>>
>> On 27/06/2025 1:04 pm, Takashi Iwai wrote:
>>> Hi,
>>>
>>> HD-audio driver is known to be quite messy in both file structures and
>>> its design, but until now I haven't touched its files paths so much
>>> because I set a higher priority for the easiness of backport to stable
>>> kernels.  But, you can't leave garbages forever, it's been already
>>> high time for a large clean up.
>>>
>>> So I tried a quick code reorganization, and put the result in
>>> test/hda-reorg branch of sound.git tree.
>>>     https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=test/hda-reorg
>>>
>>> The basic idea is to move the code from sound/pci/hda/* into different
>>> subdirectories in sound/hda/ per functionality, as most of the stuff
>>> are independent from PCI, but rather HD-audio bus specific.
>>>

I tried your branch on a Cirrus development platform. This has an
out-of-tree patch so was a test of how easily we can apply our backlog
of patches to the new tree. Good news, it was easy to apply the patch
(with only very minor conflicts) and audio works.

Test hardware is Aaeon UpXtreme (WhiskeyLake) + CS8409 + CS35L56 
side-codec amps.

[    5.155395] snd_hda_codec_cs8409 hdaudioC0D0: CS8409: picked fixup 
for codec SSID 1013:8409
[    5.155622] snd_hda_codec_cs8409 hdaudioC0D0: Found 4 CSC3556 on i2c 
(-%s:00-cs35l56-hda.%d)
[    5.159626] snd_hda_codec_cs8409 hdaudioC0D0: bound 
i2c-CSC3556:00-cs35l56-hda.0 (ops cs35l56_hda_comp_ops 
[snd_hda_scodec_cs35l56])
[    5.159955] snd_hda_codec_cs8409 hdaudioC0D0: bound 
i2c-CSC3556:00-cs35l56-hda.1 (ops cs35l56_hda_comp_ops 
[snd_hda_scodec_cs35l56])
[    5.160722] snd_hda_codec_cs8409 hdaudioC0D0: bound 
i2c-CSC3556:00-cs35l56-hda.2 (ops cs35l56_hda_comp_ops 
[snd_hda_scodec_cs35l56])
[    5.160857] snd_hda_codec_cs8409 hdaudioC0D0: bound 
i2c-CSC3556:00-cs35l56-hda.3 (ops cs35l56_hda_comp_ops 
[snd_hda_scodec_cs35l56])
[    5.161763] snd_hda_codec_cs8409 hdaudioC0D0: autoconfig for CS8409: 
line_outs=1 (0x2c/0x0/0x0/0x0/0x0) type:speaker
[    5.161769] snd_hda_codec_cs8409 hdaudioC0D0:    speaker_outs=0 
(0x0/0x0/0x0/0x0/0x0)
[    5.161773] snd_hda_codec_cs8409 hdaudioC0D0:    hp_outs=0 
(0x0/0x0/0x0/0x0/0x0)
[    5.161777] snd_hda_codec_cs8409 hdaudioC0D0:    mono: mono_out=0x0
[    5.161779] snd_hda_codec_cs8409 hdaudioC0D0:    inputs:
[    5.161782] snd_hda_codec_cs8409 hdaudioC0D0:      Mic=0x3c

