Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5F12264CD;
	Tue, 25 Nov 2025 17:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764090041; cv=fail; b=JCVKfuEXo0OrvrJnMH+IUvuS9V0MKPiN9wl8uUHqjQ3hPJMSWbCYXrqHhHkEVZFXbP/EE4bVmHBNWZRx2ZE2MV47ZgGP91NrnfFaF0CCrHH9+tbBHEaok1zIhSYNG20yxMwzImeg9iIby/11Puxw4zobb5d7kxyaupVbPND0imY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764090041; c=relaxed/simple;
	bh=T6UuKNHi6H0U2BK9UFMnNSeUQsL1wYDopPI/gxr+1x0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TCoAOoCCqM5w4j1TVRg6Z5jAFvZ40HSnFrEh87LCKrZ3cy+EKSj39IdaV8YeZY8hl96+kZMuZvF+9NgTIPhZzkNlZ6cMvpicRaO5Cc+3fMi1NAtGCeyr9ONAVP6JwHfDw2cb2dURGmPBuV7yHVP6lkutJvnhS7jZushlAvOPKyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fk9tbq0f; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Gy0lIZpu; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fk9tbq0f";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Gy0lIZpu"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP4jkYB3667332;
	Tue, 25 Nov 2025 11:00:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=MbYJmV9pWl+DUWvyMiVNh57xJ+sDnCHHymYihFB51Uw=; b=
	fk9tbq0fvQQxAZq53SzK8BebTuWYyFdmwS0PeSbcTiPGZEqFhVrj2BH0/0r1fd4Q
	CKbEm4iZjFrkXLuXtJsio534COD/RMSse4bBz8xP5qVw2EofiPkbDc+QivtWRN9S
	mTksW4EINBX3VT/A+HvS8FjLBZmW6iT+j1FCZdHDfldibi+Sg5y6hqNyJ6jiYWC+
	Nqf/1UDF2Gn/Ir3b1zmTFzOLkXOjwqBhbzr4LUhWrtM9v+ZlooyH2K6DDkhXeHxq
	8KquDtdzm7UbpBqqCPl/PvCud3lL0ZzDKuL8d1hXEQJxGgqoSKOcY78Efd0RFQqY
	pJP5dl5gdyL1RGAjNRxIrw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022118.outbound.protection.outlook.com [40.93.195.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4akafkbbtn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 11:00:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mP+82XpqVa2Z/LcZvKoz6ClJKdOZnaREM3PzWNbMfl7tJh0INvSiPJ12nreQ+0IvTiVpvP2vuaYLZJCyNHrXVCEJWA9Bz4drIGCkeLbXGDv48g8Uyefy60NujgaqGUMR0kneeQ46PCkbCBLyUCH7P9WqLNlm/v0dPMIvnHTSy+BBY5FqXd4E6pmzM0cMRv4KL4yDAXELZGxjQZeu3jymGNryh2yVb5NZaPtNMemV1grV5PPYpG2LVm7rtgjPX3TcshPuwTFBQ1D5/gjtrXSpqMh5IPfsHQy2Mtr2rcZMwgyVGzNx3qU0zwlFYF3c+/cTQrFwgbthWeqHIUSEx3XtfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbYJmV9pWl+DUWvyMiVNh57xJ+sDnCHHymYihFB51Uw=;
 b=W/dLDl4mTpkwDIVneWlRCT8BG2XWZve79IwIp9xNYRdPKatWwjoQrnugpAgWDfN/HgRGvXCtWwBMbLaKSzb7RLFmeHLjcf6J7zQ4E9ex3q5upLFhdKbeIgfeupYFXZMqq57FLlwDxPw2FQiFUwEAcVyY0z7I+xzN8fXEVcJAGccIOhMC6MLWBDbPy2s/9YvAVqj5HAYBR/nTjRqZ+zOGqjT0+oVY7buhnm2XQLXAs2sZWvlohut6PbD3/+pP2fZCnBgJVNrs7mSAGdmY4MOqyAaIjsDqxz0XrbJi4qwGv0WAcyHRLaL6jIA+XgLtOTGBeOp+dG2UTEveMg6n836FKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbYJmV9pWl+DUWvyMiVNh57xJ+sDnCHHymYihFB51Uw=;
 b=Gy0lIZpujz2b6RIVxznCMqOf4TLzWFmW4IqyyKKFsgSfyDWgQ2rJIStC43RkIBoAW8RLxjmdat7R0agvSHGrxBn+z+GpnseL63v1s/tFBl8kU0Xbx9YHqkU/wt9S7WXE5UIXOFWw/Slh/8inw3ZgZip+0oy5Xh+w8s9OY4POG0E=
Received: from SJ0PR03CA0178.namprd03.prod.outlook.com (2603:10b6:a03:338::33)
 by EA3PR19MB9567.namprd19.prod.outlook.com (2603:10b6:303:2b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Tue, 25 Nov
 2025 17:00:14 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::46) by SJ0PR03CA0178.outlook.office365.com
 (2603:10b6:a03:338::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Tue,
 25 Nov 2025 17:00:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 17:00:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D15DC406541;
	Tue, 25 Nov 2025 17:00:11 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B65A782024D;
	Tue, 25 Nov 2025 17:00:11 +0000 (UTC)
Message-ID: <e40b0c6d-4e1a-46ee-ac86-006ce496f8dd@opensource.cirrus.com>
Date: Tue, 25 Nov 2025 17:00:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soundwire: stream: Prepare ports in parallel to reduce
 stream start latency
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20251125101306.248932-1-rf@opensource.cirrus.com>
Content-Language: en-GB
In-Reply-To: <20251125101306.248932-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|EA3PR19MB9567:EE_
X-MS-Office365-Filtering-Correlation-Id: caf666fa-174d-4989-4664-08de2c4419f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjEzRDdGWXJlMlVITWU4MVhCZUJ2SnVIN05raTZkejMxL3BJblpDRzRyeExr?=
 =?utf-8?B?NkN6RXJhZ0ovQzRDcHdKNHZVWjlkMmsrRzM2UHdWc3Vxc0NTM2hONjljOFlR?=
 =?utf-8?B?TnFYamtEbUpucTNWNVFLaTVZU1owU0Rza09keE5haWYvMmVsa1lIYllRaTJE?=
 =?utf-8?B?K1U2SE9VdkdwN2piMmpyWG9iekRoZUxKMUF1ZVhtZi9sZ1JBZkFScVdlK2wv?=
 =?utf-8?B?TUtNMU5wVWk1c2VrVVFzVXBnejgwOU50MmZWdmNmZ3JjWHMyQTNMWklzVkkr?=
 =?utf-8?B?V3RUUHZuZzdIMFlVNDU1Wjl6anVWa1YrM3dVMTNaRjNJZldqNEpCMFBBejhp?=
 =?utf-8?B?MnpqbmRGbmJXNGpaTFNtUk53NGtlc0Y3Z1hhV1ZQSStqMG8rS2lBMEppSEls?=
 =?utf-8?B?eEdYS01PbjZKNWRCVUJ6MXBMM1NWS0tlVUVUUGZLTVZlb2FvVGN0NUdsZUo1?=
 =?utf-8?B?dXBYWHRoaFdMWHFicDg0YlA3NG9weTBqWlA2ek9KVzJmN3ZUb2IraWtRNXFi?=
 =?utf-8?B?UkY2dU9LY3BTeGVUVk9EL2dlYnRKZXBkSUhDeEp2TVZBeXpQZ2grV3V1eVpG?=
 =?utf-8?B?MEF3ZGxTdTZmNlI3N2djTjBLWkF4VWdRVjcxeTNsMWNRQlVESWJ6dUlVRFJ1?=
 =?utf-8?B?V0ZyaFZhTkZSV3hEYllDMytDbWhpVkJselM4R2NGT1Bnd0ljUU11SThHc3dQ?=
 =?utf-8?B?YjQ3T1ZPTG8wYXdlSXZkQnI2R0UrMzI5UkNhNUl5eHRHSjBCYkVheXhZcFZ5?=
 =?utf-8?B?OFROeTYrNnpnVG56Y25ZRnJFc3JveHNIRmo4T0dXVjd2K1FWV0JoV2hFV1ZW?=
 =?utf-8?B?QnFWeFREOVF5VG91d3RVWUZ0OE5ESHdkc3VKUXNlVk9XZDFNQ1ZrMUNQc0h6?=
 =?utf-8?B?QlVSTElKTW9XK09vV0Vva0JHWkVGalNMWXFXQlc2QmpBVGVYNllBWXdraVMw?=
 =?utf-8?B?aUlpTFN6bFl3SldjSFgvUThzcUJnaUJQYWhLT1NKNjdEd0hMTjBrM2ZGcWla?=
 =?utf-8?B?aFNNamJZaXdWL3l0YnQ2dG1uZlMrWHhTQjJqTWFBVDQzSUl2RC9lRThLU3lW?=
 =?utf-8?B?YjNZbkhPYk1FT0VudmFkUy9kVVUyY21pU1p3azd3d2NPZVFCYnoveWNndXYv?=
 =?utf-8?B?c1NyUFNxSWRhd0FNMW0vLzAvTisrc0tlWHN6cDYwZmZWMWgrNU1CV1huNEl4?=
 =?utf-8?B?ODJmVHNYU1dPQVhoNjZyc1pReWxjV1kwdzgwWG1DRlNTRmFRbmt5SHBFTHBN?=
 =?utf-8?B?cU9XZGFCVUV0eDhXYnRjaTZVZ2h1T3JBSkZkOTNoWXY5THFxdk9FU3BuMW10?=
 =?utf-8?B?eVhJdnR6TGZHM0hnbGlnWTAwS0RuUUh1VWRXN285S2tweXJhcGtyRnpabml1?=
 =?utf-8?B?S2orYXFFL01ONjZaUVFnck03TXBBbjBDT2gxTy9JRDl1anlhSERjYjl5YmhT?=
 =?utf-8?B?ZUZFWWVHc1hZS3psdys3UStiY1U4QzE0bGl2TGQwWGM3RDd2eUdiWnEwbUt5?=
 =?utf-8?B?VzFpSnhEN2dWTCtXV2R0bTcxTVFiU3JTOUNOS280SE5iTXpUUkpHU1N4Zklz?=
 =?utf-8?B?QlZwbjBha0Rvd2RmWXZKZDlCTUZRQmpzbEMrbjRVVnkxT1pTdmFvWEdHeTE1?=
 =?utf-8?B?S2xrN25rUzJTZFcxZ3pCL2hFSTFwQ1lEQUpwVVRTaHp6NGxvTVROdFN4bzEw?=
 =?utf-8?B?a1hYZGlMZStDaWEwaUtBTVFSM0dFVUlTVTVVMXB6Rng4QlozTEpqbER0dUky?=
 =?utf-8?B?MVh0L29WSHQrMmNES2JiQ3QvNTIybU4zbE1IK0hTTEd0ckRqV0EvenNSWm1h?=
 =?utf-8?B?YkdmUnBhdXBBRGVCb1Q2TE8rWHgwSTNMV1lDaHN0SHhkZHJnTDRHUi9lTkdh?=
 =?utf-8?B?UlZXWk5NQ3NROCtod2tQVkwyNUQ3OW9vblhzT2JPblhRMWJZWjVYYVVrSU1N?=
 =?utf-8?B?N09JbnAzTFY2enhJU2J1OFZZeE9rSnZFWlNidW9JOWFENEMrcmh0NzhDdk9U?=
 =?utf-8?B?SExwVUorZ0hrcUhOL21IMGU0YXZXQ092YkFJb09QUW82UEM1clNqL3FSemY2?=
 =?utf-8?B?Y25kUGdtSUc3ZEtPcGgyUGJZSW1XVkRsSGNIQT09?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 17:00:13.4496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caf666fa-174d-4989-4664-08de2c4419f2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9567
X-Proofpoint-ORIG-GUID: OMCkzn0yV0ees-wc_eIHHIIpWT-txuHq
X-Proofpoint-GUID: OMCkzn0yV0ees-wc_eIHHIIpWT-txuHq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0MiBTYWx0ZWRfXxq5PaMbMMFxI
 c6a258Tn/rnaHHw1Jh9Gi1EMVeAzAH9Qk1RKHZ3IeYq8wRP4QnuczMz4AlcIT/49gKQD0f1uA5a
 hAbOCwZObZkjzCdSBqkwvEk/8fFvcZxAkTcTo5S2cFaNJFc6RKCCoL+nJrUXLoutEz4IwzMFc2p
 beFMrxRHglRDF0ZgXIE4CZjT6C/uifGVeI0YhDh2Ietqmdw+luORarWY3S+q9o9OgzGX0QoyLar
 xUX2LoF7Gj9w5nTCMSBtj3EesPkJxS9P8sRo2gKs0SXvFJCq7ea6drPNCKx+sALqJBiQJ7qFaEu
 m4u2Edbmok8kcOcEjZEL3er4AZXjEu2IJbbXnD47MRNJRo6LNeshTRBrlilGW+GYyMl5kQR4U73
 KxiTBHOi0jXbgklxu3hEZXu3OpVUsQ==
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=6925e0a2 cx=c_pps
 a=guKoQT9KXu5tcfMvWZCEWg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=B08vcxgdZG5n_5lhuBUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 25/11/2025 10:13 am, Richard Fitzgerald wrote:
> Issue DP prepare to all ports that use full CP_SM. Then wait for the
> prepare to complete. This allow all the DP to prepare in parallel to
> reduce the latency of starting an audio stream.
> 
> On a system with six CS35L56 amps, this reduces the startup latency,
> from runtime_resume to all amps ready to play, from ~160 ms to ~60 ms.
> 
> (Test hardware: UpXtreme i14, BIOS v1.2, Core Ultra 7 155H, 3x CS35L56
> on link 0, 3x CS35L56 on link 1).
> 
> An initial read of DPn_PREPARESTATUS is done before dropping into the wait,
> so that a quick exit can be made if the port is already prepared. Currently
> this is essential because the wait deadlocks - the stream setup takes
> bus_lock, which blocks the interrupt handler - so the wait for completion
> will always timeout.
> 
> However, an experiment of removing the bus_lock from stream setup, so that
> the interrupt will work, shows that wait for completion takes ~700..800 us
> but the quick-exit read takes 50..200 us. So the quick exit is still
> valuable even if the stream.c code was rewritten to allow the completion
> interrupt to work. Rewriting the code so it doesn't take bus_lock is risky.
> The deadlock only lasts until the wait times out so it's not a serious
> problem now that the DP prepare happens in parallel.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
> Changes in V2:
> - Fixed missing initialization of dp0_prop.
Sorry, ignore this version. I misunderstood what the kernel robot build
was complaining about. The actual problem was that I'd intended to
remove the local dp0_prop as unnecessary but it was still in V1.

I've sent a V3.
