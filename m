Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A93339E18E
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771941337; cv=fail; b=tJJlc6XCd1ED+b7AKM8It8DDwiawcQmdTbKTgEF8/1LnhUayjCf8/DXHhrMXCZ1XRQyC8eOvpuK/JUaLROL30vAu6qtiHKaHJeqMab1s8eKQtrjm5I5C+L2A/qiwYTcBhQwgUzjbDrVrDbplSR+mLRpKtWySzeuEl0cnr2fFN4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771941337; c=relaxed/simple;
	bh=IKBTTDK+BdQKIpPWFRGAZKF1K+/JR0AFNNQeJU7ii+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axy31PmnTwnpArS/u1XQNhGunFuw/iitWw3VDvVQkll9U6u73C43hflrMFpRNBrab2ogP1nc01NNWbu5ZePqEWxRvFCcmJ+LCpwlR6lq7A/7LoNpSkTJ+6QbFbtjkoa0nxQnJ3IxvQT042Trf5YaZGN5nKYckuMUAehw8GT+QN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jpR3wIXa; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=o2knPu/H; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jpR3wIXa";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="o2knPu/H"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4mbfx3507755;
	Tue, 24 Feb 2026 07:55:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=R4AtwpUDdPmAaP/ebc8tKVFTMC14y4/tZJtOnMHCKu0=; b=
	jpR3wIXalNPqsiCuWrE9gVQrqaQPtFtpObSQl8FkMRXDcCZWAoyU7gMSw442KrTV
	r852fEVB1eZiBKSG1dxAYp+3p8sYYmMET3aK1U3WuMPP5AUEF0gpeWd3pjjjZOCi
	TXogTn9w3mP/EX6GaK3BYYvoYjUMkPv3OL9qX6r+S0kzjuDZLHuZ//p32kxr5Lhl
	QPZONDUdaTLsaEBayXDHLIl1v7Vu2tHn28a7rEb7dJYbCJnI4wQ7BGU+PqacRL9f
	kEi+l0ldw5dgyBrCcNRVLpG1tJOSLAXJLbaBGVNpre+1jvHTsMTRs3GdooC9AO9/
	Oih4p35dPpzqEpwWTz/PwQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022117.outbound.protection.outlook.com [40.93.195.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j2w48-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 07:55:23 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpEokzoXwuqMNlZvb0VGnHnEXCdJw+S2/oIJwMG4VzWeQVhEKqfQOZA2ng5PJLCIhViNPCbT7Omleyx+mOFCu689fxRACTFc0OMQ85Caidk43U9CZIjq+9PTwtdqoLIBkOphxwegxNIZL5kLbU22HkMjNRyAdnqPXGzCrRaXs9TWWZB4w7l61tZ12OWbUyYHJk9ZRrqGmp8278roDc6hrLgf4oJ7rjEfzBjlO0TYoPfCNtg66QMSpDWW6/u16X+MJlCW0zN3iqzmVml203MBZ9o/UpofIOtfBB50R5CKE2QjYwweATevBk9fl5xQvDejPF5SZ4QMCIrEnGRrMJZ1mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4AtwpUDdPmAaP/ebc8tKVFTMC14y4/tZJtOnMHCKu0=;
 b=UDM32SicIkJcJug7fx3RK5gWjKEuTRC8iENJxJ+R0wWNTJwU+i2MBVZzh/SvW6vbzCqdHrYO3Ngavp1vmBcqKJoPuVRnNkJnJpcyuhOk5UF7MZEsXzzOVxuhHSL0cptGAzJDl96C7ANXQfWIXFWgBw/msTytFzlpbI2XAix3iAPELxRII7nf3IkphhdmtjnUA6hrbbFVTYCpC6hFsuKQYHKei5mFZ6ZnfJ80J21W4WAiUbYNgbOlewJD51Ffq+5EcS37vJ5qusC4XycwGjjSRkbEqSBTGn8PSLQTl5XrtVexpf0opyUB8e5EkuKzQ8DUzhGwrYoWiyupmhNT36FmCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4AtwpUDdPmAaP/ebc8tKVFTMC14y4/tZJtOnMHCKu0=;
 b=o2knPu/HlUbOLji4mUAvZt1zGxQ8ThEWTkr0Us5HtrQpqEYSqEmqOtX4iBdM6jJArh/3jKu/R4AFki2SavWKBQBuCLBjp7sJP5M1mXmgKGDRj091teJrSNejwv3suCfGsoVEK8EhJmz2JdRGE8LmzUyvxrvxO+ocu9Yt+2J3iNI=
Received: from SJ0PR13CA0081.namprd13.prod.outlook.com (2603:10b6:a03:2c4::26)
 by DS0PR19MB7696.namprd19.prod.outlook.com (2603:10b6:8:f8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Tue, 24 Feb 2026 13:55:19 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::b3) by SJ0PR13CA0081.outlook.office365.com
 (2603:10b6:a03:2c4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Tue, 24 Feb 2026 13:55:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AB337406540;
	Tue, 24 Feb 2026 13:55:16 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A4C2682024B;
	Tue, 24 Feb 2026 13:55:16 +0000 (UTC)
Message-ID: <e47acf64-15f2-4cc1-8c45-6c0a101a288f@opensource.cirrus.com>
Date: Tue, 24 Feb 2026 13:55:16 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: SDCA: Pull the Q7.8 volume helpers out of
 soc-ops
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
 <20260223095425.3905703-5-ckeepax@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260223095425.3905703-5-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|DS0PR19MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b0475db-2e85-45b9-d87f-08de73ac5839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDczMmw5bmltZ0NnZUxiTXhXUHAxTC8wVUdvRVBseDV3aklLa0J5VnpNY0lT?=
 =?utf-8?B?MUt1SDZocXBOSVFqSmYrbDVRWnRmVEpGNFIycHpMLzFiam1Zek5tektWeEVU?=
 =?utf-8?B?d2VDMURoKzkxZUt2SUhxU3RsWllNNDE2SmxRUURaNzd0bkF5Qjd4ZGMwU0k2?=
 =?utf-8?B?U3YwZnd0S3JicnJ0MUx1R0dxYUl5aUMxNERHOExNZ1RIVm9PMlZvUW00WW5K?=
 =?utf-8?B?NmU3ZUR5MzhiU2lJMUN6blUvMFJkaUttSG5nM3QzQ1pVeUdzTURpMmZwc1ox?=
 =?utf-8?B?dVF6WVcxVTBiZEVobWlTNWFJd0gxWHVKSDdJQTltQ1RvN2dQY0RpQUl6aEFL?=
 =?utf-8?B?VmhPVElmRjJuQ3dyZU00RGk4Y0dmbkliUnRMR1RlYVhhcWwxYlduWnJZbWIz?=
 =?utf-8?B?WFc0MVlQc1pBZElkUVdhUkpibTA5M3ljNE5MSnk5V0I2ZWZlbG1hNTdSWk1q?=
 =?utf-8?B?a09SdFdHMmNlaEdKbzF5RW4wdGkxNkJ3R3ZrY1pUdnJDVFpZUGRTM2xEM0lY?=
 =?utf-8?B?Q0p3WnMzNVhkTXV4Vlg0UjhzSHNHanpxTEN6cmZLQVUxRnc5YzB6VnFBNG9s?=
 =?utf-8?B?NFJVVkFVT29BV0c0TVNwaHFZNDBpZ2JYbHNrdGhwS2FmMUhJL1I4TUdCUDFm?=
 =?utf-8?B?S3FjbmVXQXhGNEs3UWszdHZMUGhSWi85aTVjTVVlcng4a25wdEpKa1NmeFV0?=
 =?utf-8?B?T2pVVzdoY3FWTmE4MlZLMW9IMHZjTXp1ZmgreHpFQkFlTXlPK0dmOFFKUVV3?=
 =?utf-8?B?dzh1Mnl4WnRqNnljdEc2N2F0S29leHdGcVAzaytnRzMzZlJ2YnZncWo3OU5E?=
 =?utf-8?B?OTg2QVRvc3IrOFRsRlBRaTR2cU03cTRMVm0wMC9pRjVLTnZVUitiOUZvTHpS?=
 =?utf-8?B?bTh4U3lOdXhaSGVsam5XOTVDWGdyRDZPNVJEalB1cHhMV2ZJcHlPTWJueXF6?=
 =?utf-8?B?enY4bUVJRm5ZcUI0Q2IybWY3Rk5nS0ZUNk1XeTlqMlNINVRtbHF4MlEzeHZN?=
 =?utf-8?B?U3FRcm80YnA2SE5Idm1rVjd5akFNRDFBZXlnK2gwUHBTemp5S2RNM0VmWkdG?=
 =?utf-8?B?SnFUQnpuNGgwaXlRZHlwOUJkU2V3M1ZHSFlPWWIySlUzS293WldvcStkbzdv?=
 =?utf-8?B?eHc3YlNUUmQva3d0dmtScDRlWmNDSExUcEIxVytxUkN5VzQ0cjlTNk5QVWFM?=
 =?utf-8?B?UjZNQnBUR0NlaHBvY2M5TFc0U2NhTkpxOXB1WDBnK25kMGgwclBtTHNrc3Mr?=
 =?utf-8?B?MXdqdmI3NXRNcUNKOE90Q0xmMW5CUi9yRDZFQmd3K1h1MDBxU2ppb1hPVStH?=
 =?utf-8?B?eEEvZEZicndvNTMvbGxmcXFHWE1rR1Y4blpuNFA1RUlzVmtYOXM4THhhejJD?=
 =?utf-8?B?V3J2ZkdxeGg1ZFIzdzh1RDFmRnRNcWVwNVlwc0xsbnN3TnYrbEZVb2lNWFI3?=
 =?utf-8?B?TnY1VDdXN1c4UVBHZkpGK3I3VzcreFJDY3JnU1hrMVd1Ymh1M3c5OUE4WDdC?=
 =?utf-8?B?eHBrZ2h4QUQ1K0pLVGNKdEpoaFVDYjJZU29LTU52R2NueVN4ZGw0Z3h1eXRl?=
 =?utf-8?B?QmNZMGw1UTdEbFZOamxvOGYvT21XeSsrMEtkb3phaEJ1MWFoY1lNVkdBNmEx?=
 =?utf-8?B?MW53bjNxaUQ2dXZNQ0xLRGVRbzFhNWFOZ1BOY1NFKzhmMWNqZTg4VEJDeTZp?=
 =?utf-8?B?ZTdJYVo3KzBwVC8rQnBlKzdJeDVVSlEwaGFFQjRVc2hPbWVlQ2lQcnFiQUw3?=
 =?utf-8?B?NUN4SzRPdmsxYzh1UG9FMkY2WUQwOWNlczBWbEt0UzhJL1IzdVFlTWJuWUVY?=
 =?utf-8?B?dS8zZmlUWklwL3VKNDNHTDNDV0JJd0hPTThmbDRFbUpCdDN2cjZYSFVlaE1F?=
 =?utf-8?B?YXRNcnpGWnNwS1duQnFNWERKSXI2cWZ5c1VBS3Q3Ny9SZm56UCsvbUpOVjlj?=
 =?utf-8?B?NjdTOWoxUHVQZTludzFlRkNvL1BFZHdDNGZPUWF5eE13Qnl0dGw1TzhKMVlF?=
 =?utf-8?B?NldOTXk0YzdkRTVld3BKSzlZcytxK2ZSYU1TQ1VpTUZsb2tzcTU3amdLR3cr?=
 =?utf-8?B?WndkMFYwS2czVEl4S01tdnZCeURFWUpsNVViVFF2NkF6TkhZTk5iSzgrQ3d3?=
 =?utf-8?B?NmR4c2xPTFlkZmVHcEQwTHM5S0dkVjk4aTVDK2RoeEYrRFdQcmdhU3J4T0ts?=
 =?utf-8?Q?WFJb+94ZULLVqbuIwS3/DCD1bQdq++ydkVmK0ibiy7PG?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fyWDwQKJORFJJyU9SLoWwKk/wGzkznavwpu9pRtoaFp8FiiDSuhtRfLugiLWofi6fOl+0M/qQNF5G1JRXJCfcPzwaQF/uyNKI8qxAwNNumbUe6cwf5gNR+FsRwq1Buy5xSenUE+BboBYNJRA2u7KvXQfnFpPPfC9s2I8GLMtlgFlfT87u65SuBj106oyUd3pI2q4Y40dnH71FdtTlkH9E+Hvmt5qDLYvCdrzEC6dZ41hReMkpjGjOpHemoc04RaT8yaRpQ+lqysuqxCgG+bRYU2z2A2Vcen6MceLnEsNZtHdj8dXo8xtznbIUDORVJZEb90WJogOtuZo5gHZ/oV+SuRIZFh/E569kD1I0Qaefl3ox3n6kGexLkCZKtIDpmjMcT3U4bI0NZ1SfFkMWoBy585ivjiwTDAbA945e0zjsfRoxP2/vvoGU/9Ex6NKF1TE
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:55:18.1568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0475db-2e85-45b9-d87f-08de73ac5839
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7696
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDExMyBTYWx0ZWRfX1kdKu04QZPkH
 CjuAYcsIhk7Bk/r4x+xVbVvO7jFcnf7MQWfFPKiwGKK/nDOKjTadYxrMtO9MMUrwqr+kwjuhPcI
 liEURAVagQZiVGAgDeTaEHVcFy75kbb/OGyZsf3SNoaf2e0SV7iMMbzeFTFKCv7A4FhxPUyj1f+
 +u/SczFLPWY/IeZK/zs06VF7IwRjJqK60CxatXzV12T8287BSXYS+408FA7v4XNhiO4jwHPxWDY
 4oJ2o409udTSmmG3tuqgd03SMFwb9Bwz23yQnwM6g3muKYa9fYfswnI0sqTeFP2lavFPhgvP/OE
 kO7eAK51aiVEXZ1U48B5c2ocJxHz6V/wXif7/UIqZ1iar6c7XDGggV7FaFF4hqbvBDaO2C0jlB7
 v0Z2vinuL3OOp2v7FAu4FDvc25n6Xa+lTF1vcYY0tD80kxczx/E3vGV8l4n9nClT5MD16pFMjiH
 QEdwqEBr79drktq70cg==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699dadcb cx=c_pps
 a=TbPda3zwUGH7CZ0Pe4pYPg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=WF13bq4jsUp2zSs6xJ0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Z1URRqSEf_em7gorAtn4xBncc_ZWlm7n
X-Proofpoint-ORIG-GUID: Z1URRqSEf_em7gorAtn4xBncc_ZWlm7n
X-Proofpoint-Spam-Reason: safe

On 23/02/2026 9:54 am, Charles Keepax wrote:
> It is cleaner to keep the SDCA code contained and not update the core
> code for things that are unlikely to see reuse outside of SDCA. Move the
> Q7.8 volume helpers back into the SDCA core code.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>   include/sound/soc.h        |  1 -
>   sound/soc/sdca/sdca_asoc.c | 67 +++++++++++++++++++++++++++++++++++++-
>   sound/soc/soc-ops.c        | 55 ++++++-------------------------
>   3 files changed, 76 insertions(+), 47 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 7d8376c8e1bed..172bd68e1315f 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -1239,7 +1239,6 @@ struct soc_mixer_control {
>   	unsigned int sign_bit;
>   	unsigned int invert:1;
>   	unsigned int autodisable:1;
> -	unsigned int sdca_q78:1;
>   #ifdef CONFIG_SND_SOC_TOPOLOGY
>   	struct snd_soc_dobj dobj;
>   #endif
> diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
> index e6f7c2778bec5..a342a4e56717a 100644
> --- a/sound/soc/sdca/sdca_asoc.c
> +++ b/sound/soc/sdca/sdca_asoc.c
> @@ -805,6 +805,70 @@ int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *funct
>   }
>   EXPORT_SYMBOL_NS(sdca_asoc_populate_dapm, "SND_SOC_SDCA");
>   
> +static int q78_write(struct snd_soc_component *component,
> +		     struct soc_mixer_control *mc,
> +		     unsigned int reg, const int val)
> +{
> +	unsigned int mask = GENMASK(mc->sign_bit, 0);
> +	unsigned int reg_val;
> +
> +	if (val < 0 || val > mc->max - mc->min)
> +		return -EINVAL;
> +
> +	reg_val = (val + mc->min) * mc->shift;
> +
> +	return snd_soc_component_update_bits(component, reg, mask, reg_val);
> +}
> +
> +static int q78_put_volsw(struct snd_kcontrol *kcontrol,
> +			 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	int ret;
> +
> +	ret = q78_write(component, mc, mc->reg, ucontrol->value.integer.value[0]);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (snd_soc_volsw_is_stereo(mc)) {
> +		int err; /* Don't drop change flag */
> +
> +		err = q78_write(component, mc, mc->rreg, ucontrol->value.integer.value[1]);
> +		if (err)
> +			return err;
> +	}
> +
> +	return ret;
> +}
> +
> +static int q78_read(struct snd_soc_component *component,
> +		    struct soc_mixer_control *mc, unsigned int reg)
> +{
> +	unsigned int reg_val;
> +	int val;
> +
> +	reg_val = snd_soc_component_read(component, reg);
> +
> +	val = (sign_extend32(reg_val, mc->sign_bit) / mc->shift) - mc->min;
> +
> +	return val & GENMASK(mc->sign_bit, 0);
> +}
> +
> +static int q78_get_volsw(struct snd_kcontrol *kcontrol,
> +			 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +
> +	ucontrol->value.integer.value[0] = q78_read(component, mc, mc->reg);
> +
> +	if (snd_soc_volsw_is_stereo(mc))
> +		ucontrol->value.integer.value[1] = q78_read(component, mc, mc->rreg);
> +
> +	return 0;
> +}
> +
>   static int control_limit_kctl(struct device *dev,
>   			      struct sdca_entity *entity,
>   			      struct sdca_control *control,
> @@ -845,10 +909,11 @@ static int control_limit_kctl(struct device *dev,
>   	mc->max = max / step;
>   	mc->shift = step;
>   	mc->sign_bit = 15;
> -	mc->sdca_q78 = 1;
>   
>   	kctl->tlv.p = tlv;
>   	kctl->access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
> +	kctl->get = q78_get_volsw;
> +	kctl->put = q78_put_volsw;
>   
>   	return 0;
>   }
> diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
> index 8ae6609ca9618..ed76ea81e6ec4 100644
> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c
> @@ -110,29 +110,6 @@ int snd_soc_put_enum_double(struct snd_kcontrol *kcontrol,
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_put_enum_double);
>   
> -static int sdca_soc_q78_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
> -				   unsigned int mask, unsigned int shift, int max,
> -				   bool sx)
> -{
> -	int val = reg_val;
> -
> -	if (WARN_ON(!mc->shift))
> -		return -EINVAL;
> -
> -	val = sign_extend32(val, mc->sign_bit);
> -
> -	return ((val / mc->shift) - mc->min) & mask;
> -}
> -
> -static unsigned int sdca_soc_q78_ctl_to_reg(struct soc_mixer_control *mc, int val,
> -					 unsigned int mask, unsigned int shift, int max)
> -{
> -	if (WARN_ON(!mc->shift))
> -		return -EINVAL;
> -
> -	return ((val + mc->min) * mc->shift) & mask;
> -}
> -
>   static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
>   				unsigned int mask, unsigned int shift, int max,
>   				bool sx)
> @@ -226,26 +203,17 @@ static int soc_put_volsw(struct snd_kcontrol *kcontrol,
>   			 struct snd_ctl_elem_value *ucontrol,
>   			 struct soc_mixer_control *mc, int mask, int max)
>   {
> -	unsigned int (*ctl_to_reg)(struct soc_mixer_control *, int, unsigned int, unsigned int, int);
>   	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>   	unsigned int val1, val_mask;
>   	unsigned int val2 = 0;
>   	bool double_r = false;
>   	int ret;
>   
> -	if (mc->sdca_q78) {
> -		ctl_to_reg = sdca_soc_q78_ctl_to_reg;
> -		val_mask = mask;
> -	} else {
> -		ctl_to_reg = soc_mixer_ctl_to_reg;
> -		val_mask = mask << mc->shift;
Still need this line to initialize val_mask.

