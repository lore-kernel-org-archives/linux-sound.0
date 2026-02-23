Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7970830F55B;
	Mon, 23 Feb 2026 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771865007; cv=fail; b=AFqenlZ5DxqUu4iaUrXJZ4IA74gPpXGj0K7TnB/wb6zHVlJRBFfnmMKZ7s1Dt2U18FJOC0K0attHnYE+zDxVQikIrq1yD7nk8t13I3oQopI0UQ2lxSY8emIo8EXz/Nzz/jicMzccv7DmKzF/r1cFzieihFdU3/+Gs0H/BUIMD6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771865007; c=relaxed/simple;
	bh=1GRyQ6EtYYUOjH/X1AMY1XzbxcT0ZgVkwm/ZWDP67L4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJSOaj+vwt34OmAVevn9AA9DylxCuCxWJm3v0fPa5HycXS3w4mWmNOkrEzdFtSTyArJTIvrtbujHh2T7Y7AQmq5jRkUXdD9YZp2Wc5i+bNMOFxNCOQwZ1wCnEfOLWM8e9oQZJvDzk+beSVbu4ajRBaTF66ZanmYzlGqXEYX00ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FWy2Rtbl; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lyrXJmjv; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FWy2Rtbl";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lyrXJmjv"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NFCXCC2143434;
	Mon, 23 Feb 2026 10:43:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=0zYvEclpqaoRRfgJv4d0xBeNu/U0nY5iAv3G6uULI38=; b=
	FWy2Rtbl5Iw79sQ0fFqMfWqJpnWX+71WOOqqHlOgzej52sc4I8kQZHIXIacrrLBZ
	rWgS3fN8bASpvYp16OVV851TrFCGnkcF7oJhY85qPwXQ2AxYPOd60F0tRSRvBcV8
	OD/QnSWBIbstDi+85n/8GwaE4L0YFNnPq//hF34hBc3BkpUDV6ETi/1HScLCSDw6
	3fLAVVIspLdDSgeTJlZL/pu6JbC91CyxZhplO3XFl9cmq5lI8SGfEuBkqLYjLPsq
	CXdxDFNZpfeQkC+sv1Wao2DfBOX7ooGwiTo00VWVLzI1okvKg0a7Wj/hQVv94M/z
	Qu+IiAWrzIM2/a6XLwioWw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021094.outbound.protection.outlook.com [52.101.62.94])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j1tpv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 10:43:21 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sz+z2stmkCSk7SWqL4xQDpel7wu08qDo6f8/Kmr36r2ciUQ1Ozqpq7Iw5iDDYP1r2/hot7kCliLvLqBVYYYlcuIGMkhSgpF86ltUQsncDVfp+6ddkkKvTEu8UAxQ8k3+SLipDCGJmeIsNg8WzIKiZaPVD1fGPzxXmpDwQSZw5ce0fz5EQTROfdHCdWHLLJwjVEKzffWTXxFoN9yNO1AAXSN7yKkZsWgFvJrR1bvslGFEqNMT1YfwHA9Cf0yOTI/sCBIk2jzNVOkznzHR1gxDUyl2C6jyDJXd/SeVacnVHM0BA+uhfjrv8DSyGKUtIy2CzzFNCUe1jDuXx3zjzh+CIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zYvEclpqaoRRfgJv4d0xBeNu/U0nY5iAv3G6uULI38=;
 b=T+lgQmjx6CTmdW0X8H7sthne1gMiRllGTKrlNtjEYsppO2A/19cuO7uoiUcN+mX8ep8h/Zmehxoxn2p1glcLBuOfoxOmHvoEFwbnnzVMXc3Ntz+DDSYscMdvwX4YDxhUZZt9uSt3BMKTbY83skIT02cmmcxf2IOWtlx86TCMpi+MQGHcS6e9DF0n9o9SEZFfp3gdz3gCu+AICWBZuXFaifjhp/XyNgchShzeuWCL6ielyBnPunTxPRpmtcfIMHW6oz3EfXQ0+0QgcL07Q6cg1h5j7ifPUkEI4BzSYs/LYngUtjrLzM/cqT2U4tkvzxC1Wz3R1Jm79lc0+z0Ff3oVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zYvEclpqaoRRfgJv4d0xBeNu/U0nY5iAv3G6uULI38=;
 b=lyrXJmjvBJFBU7Fye6kjA80s8CjkRiz4ezK6HfrPsdsRDaClSWorYMzLSpSMQmyu6Rwlu4Qoe/KhvsOLsX9a7o1u0AN1eu4qPd+7zm55oCh1GnE04LqQK+WOwPNJ034lbzdEusVaVAanZRr8HGh1lO14qx5iVxtgWJB3gdLldLU=
Received: from CH2PR18CA0012.namprd18.prod.outlook.com (2603:10b6:610:4f::22)
 by DS7PR19MB4408.namprd19.prod.outlook.com (2603:10b6:5:2cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 16:43:14 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::6b) by CH2PR18CA0012.outlook.office365.com
 (2603:10b6:610:4f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 16:43:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 16:43:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AF398406541;
	Mon, 23 Feb 2026 16:43:12 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9C61C82024B;
	Mon, 23 Feb 2026 16:43:12 +0000 (UTC)
Message-ID: <658ccc3c-720e-453a-805e-60e9bc99f916@opensource.cirrus.com>
Date: Mon, 23 Feb 2026 16:43:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] firmware: cs_dsp: Add API to hibernate the DSP
To: Stefan Binding <sbinding@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260223160614.754934-1-sbinding@opensource.cirrus.com>
 <20260223160614.754934-2-sbinding@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260223160614.754934-2-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|DS7PR19MB4408:EE_
X-MS-Office365-Filtering-Correlation-Id: 489da1ce-69cc-4484-a884-08de72faa365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXJERWcybzlTb3hTeE5JQ241QUNxU2hFYlVJV2s1VXFNTVVoblRZV2lDYkZi?=
 =?utf-8?B?V2x1SzVWdnlRWmpES1VXOEJqTnFhZWZvRXFRRkU3dVZLVTdUV0tMVmtNTUZj?=
 =?utf-8?B?MkR3VllpdXFJcnhjY1RMUExwamNlV0hITFVGTkl1aHdLZ3FlZlhHU2M5Um5y?=
 =?utf-8?B?ckVVeUZxbFRDbW1DcER2bnh4cGtncjkwYU9sTXN2TjA1VlBYejAwTVR2RTFP?=
 =?utf-8?B?ZDJDcnoxbDZsL3pnL2dPY2NqQTdjZkdkaHl5MnlrVzVOUmNYcWYvTC9xSDVI?=
 =?utf-8?B?OXk1cys4NFNtYVBub0tqN3gyQzRHcFQ3aXRLZGg4ZEw0Mndnd0dOajZQMzJD?=
 =?utf-8?B?S2NCcGdGdmdXeTNYUHFOcVd1djdkVS9pbmR6Vm5rTnBjamtMQnBVL09PYllM?=
 =?utf-8?B?UDNFUTFVZk1uMGpyNys3aHJUQnFuYkZWMlhOekZyY0ZVdzFTRWdLV0VYWDZT?=
 =?utf-8?B?aHkzSlVxMkVwK3NJTU5RWVlDTU1LZTNQY2IvMjdMdVVXdXE3VkVvdTJ1aWJX?=
 =?utf-8?B?SDJzOEsxZWFNT0RORkRYbWRIQlRMUVhKZjhCYUNJWVhySWl0THZ3K1oxazJn?=
 =?utf-8?B?ZzA2SVpOQTBIeThvUjdtN09VeGFSL0ZYZzJRcWhNUTBSQjJRNnBPQnNzM2tM?=
 =?utf-8?B?NHJ0VEwrVVlzNlhrbFRPMjhUUlBwa0hkVHh0bS9LcFZzOEpaOEtXOCt6WUhk?=
 =?utf-8?B?L01FZjJqTWcxbW1jQkFqZ1p3MzlCbDlSbmFVVWFKS1hmT1h6RnJ3TkhjdFZN?=
 =?utf-8?B?OGdvNjliQW1HelRZUHpKZzVyWWpzeUhha2pqN2dkckYwZ3BQMytVbFllK1lB?=
 =?utf-8?B?ZTM0QWlCVVM5cmVPYm5yNDhOd2hMR1JQTUdBOEV2NXVHbEtGSTdHTUtEa0Vh?=
 =?utf-8?B?SmhQZFhxVjJmMWQvNjJ1MnpTR1REY0hOZjdFcGRhMDBjL21wTU9QcDdKVlcr?=
 =?utf-8?B?ZW9ZL0U4RVVZdDdjY1pCZEFxYTdZVE1uWkF3MVdFNEtxV1dnL2NvR2FrZitQ?=
 =?utf-8?B?NXZqSXBlMERzbTROdUZUMzBNK3NmZ0V3Unh4ZDNyTGRIbTVNNTFFQVpML0RE?=
 =?utf-8?B?SlBkZEN2TUFzcFNiaFhnU21oVWx3dGRzOE1zU1VxbXNCVEkvN0N4UVVwZGQw?=
 =?utf-8?B?Z3RmcFRWbndoQk1zTDJQS2J2M1RuUDRyNXlBUmpWU0RRQzF0c0owNnhPNmhH?=
 =?utf-8?B?OFRZRk1DcU1lamlMMkMzajVEQ2UwMWRNRERqQUx5UHpoK0VxUlh0Uk8wTlRp?=
 =?utf-8?B?ak9hWmVLalpLRk91YzdnaUZNTEg1d0NZVWFJTE84azVoOVY4bndKUEVUVm13?=
 =?utf-8?B?bVJPbHRIT0Z1cmoyeDh3clUrNkhPVVJTRHM1WXRNTWYxcysvRWltbDk1aGN6?=
 =?utf-8?B?L2xHR1VBZGFZVDhMbzU1OC82dGFUNVEwRnhYRU84OEF2a0Y5dUdOdEVvSGtQ?=
 =?utf-8?B?MmtJbkFMTkxvbDYzeW82Nlc0NWtRNmRwZGwyOHdlTkhBdjA3Q2NjdFZob1Fx?=
 =?utf-8?B?TUplZFMxSWlCUS90c0xwZmxKOUJZRGl0WmMxT21sNnRJaTF1N0EvemtOMyto?=
 =?utf-8?B?a01CWFc2Sjk5aUZnWjYxYjRSamxyS3lxaHZYc0g0R1hoQ0tlS0swZHpvbFN5?=
 =?utf-8?B?WUtGUk5NaTBIekloYzRvVjRTZXZpYllydFp3VnJDNUUyQjFNWUMwWk9PT1FY?=
 =?utf-8?B?TWxFZUE0UnpudzhNUDl5K3c2K1hDeXZTS1hCM0hVYUpNazNNdTR4SURNZXlW?=
 =?utf-8?B?aURHN1ljY2JyOEZtWjBvQ1p6MVJrc2FKa3dMWHd0YWZIQ0MrbjFpYlplZno4?=
 =?utf-8?B?REZ6TkhDZG5NOS9adHlNME9vMllWNm03Z2tDNExCVnJoczh6Y0F3dkEyTito?=
 =?utf-8?B?eTZBN0pCWE1lK1ZqVlVDWXVoOFpIZjI3Q0VOSU1yNFlxWHlQc3Zhd0ZnUDRo?=
 =?utf-8?B?bFZLd0FWcDhOaUdvTmdkS3ZWWjJ1Q2wyZHd2cmJHM1N0OGIwOEgra3NRZWp3?=
 =?utf-8?B?S3lZblJ2YVdLbUhOdEpuSTkzVE9tNTVFWm9MVzE0cXltYXExMTFZMzQ2OG9z?=
 =?utf-8?B?RnRVUXpCTDBZZyt5NGF2eThCYW8zdEwxcm1hSW5GbmlnQzB1bHdPcW5vWjMz?=
 =?utf-8?B?VGtTMmtLTnUzTmNUMDljeGhadjkxTXFDSFZFSy9Gc3V2T1lwVUtDWlNpL1Jq?=
 =?utf-8?B?R3k2VVZYNkxhdmUwaDBBNnNDSGVuQnIrUUNNVEtzQTBwT2VldWVkMFR2QjY0?=
 =?utf-8?B?YU9KTWlCRDJRV1lla29LSmk5WE5RPT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PLWFGv4EGTojeixXe8IYEQ4NxCyOmdYyMjA7E3SyNglZB70v+hY1cEaNj1VmNDlPBY9SbZ8CbOlxhoArkUWE/EPXlBlfoNlStZIFj4743XF1ti++PvzkJtPB2itwoQNteG4WY9KB0nFKwnkZIR4/Yj+N5rm4Ldoi1tkOCl5M4sPYXVaSjz2grnBX0ZJsPBPP2SODq1bUEav1uxDYy3kJJ5/wgJ7YUK2FhGg4s8K5hlj501HhpqY8v6YDgFncErPpsx5XePcmK+T5e+xja52h8tpzHwle/JH2RClcjGEHOyWmg2tzZ+UQpiMFmbraChYCyLww5NpYGnyW6UEYMyVNJ/ydmBTiDK/oeA+VuXHfNcXliqM+3u2egNdcqgUERASiDFoGYZQfoTjaUO4pqJXyPR4eD4Uc9KFdBnYpx+q3ZbKk6ZoBZ6WVXW6vY/WMIIV+
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 16:43:13.9189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 489da1ce-69cc-4484-a884-08de72faa365
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4408
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE0MyBTYWx0ZWRfXzGkquHiacZl+
 veJuQBnCujP91mNcwfbOCG9QPawiX3yEcmoLJoeOlcs2s1kiQTfGbkfbLJ7mIdSWTGiWRVQsqor
 dnO4aDGKnzk/r9e0NJgSo7677QLfKZm4gX58HSgy2Tgs9Dv+5+sUJs1jQDlCHkFqywCYgPeH6ty
 ENtuTKUy7YczE+zonlRqA5QQ3b5PITyo/BVl5RwlvsSeJeMp+EoSpw2kmtWdv109g9PQf8+y8u8
 bd0DwfzAaouvveNg3ywhoLZo1D2wjN1kPPmTjo5D2jjyWb/LCCalAJpbyM3TdQZezRr1v0lTgp+
 x39bPr2Xfxktu93fnWLk3DHRNsUWuWQIc6RXYNJdYKgViw3CEoGp4zBekomORenas6ZSBXszEA6
 uq8OGO4pe5Y5scQwToh7Os0zEG7pY5W8AXFck4az5CiflVRKGrlnCUinF1ic4Ya/k5Nsmj5xnio
 zgYyjwUxuDlz1p9Ibjw==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699c83a9 cx=c_pps
 a=QffN0g5EZ+Wxgj/Qwxz7mA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=lkpMduq5xU4BuurvtsEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: fIbFwPvRNKyGIR9jXRZsSr8PnNmDYzq5
X-Proofpoint-ORIG-GUID: fIbFwPvRNKyGIR9jXRZsSr8PnNmDYzq5
X-Proofpoint-Spam-Reason: safe

On 23/02/2026 4:05 pm, Stefan Binding wrote:
> For some parts, the DSP is kept running when in low power mode
> (hibernation), leaving the firmware ALSA controls enabled, but the
> registers are inaccessible. Attempts to access volatile firmware
> controls whilst in this state would produce errors in the kernel log
> due to a regmap_raw_read() into DSP registers whilst the regmap is in
> cache_only.
> 
> To remove this error log, add a hibernating flag to indicate that the
> controls are inaccessible, so we no longer try to read or write to the
> registers whilst the regmap is in cache_only.
> 
> This would still produce an error when trying to read or write to these
> controls, but this would be a different error (-EPERM instead of
> -EBUSY), and would not produce a spurious error log in the kernel.
> 
> Upon wake from hibernation, the control caches are re-synced to the
> hardware, if the DSP is running.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
