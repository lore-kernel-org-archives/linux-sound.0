Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FFB2874FA
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 13:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771941262; cv=fail; b=U+xiopo556uysGX0rHlzfAQ6dTHjLbH1bzaD2YzrzrCr04VRy3/w3b9gZX5F+RmPE9vnO6edA/KAoeugnkbOjNazEVPNSE8yIrylXl/S1jpwecGoDmMh3OKO4yNPAphTckT2xj3d1t46YOYKy6rJanfXX+t9WgyJKtARKVeabe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771941262; c=relaxed/simple;
	bh=o4JD2KNIDAi4yATCDrNLoSo/ZmfXLv0QkHVhCdbAswE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=j4/0N0QjWv740HMZUf6nX3Adux/7RrfD6eq8dkRnqqmZOoUh4U1mnaNaKThzm8eSmfKMajv4QM2F1NOWWRzC/hwTgsctlt5NO+nM8zjhqi8UTqYVvm6jn9gqm05oDlUdmJJ6e8ZNEQHw70ru8DzhczFXTPQVAWyyN6NZD9n6pCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QJzUxLOU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=aztJlkUr; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QJzUxLOU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="aztJlkUr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O6W9Jb3481241;
	Tue, 24 Feb 2026 07:54:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=o4JD2KNIDAi4yATCDrNLoSo/ZmfXLv0QkHVhCdbAswE=; b=
	QJzUxLOUAJ485rI+OuZ7tLhWTMyqmXa7+Twc8ZMdqMM7tTLfCkKjsFmekQ52QXem
	yqSTUOjRRM5DflL9fTYFwdcSeDipawB1vjfpcIS+QInH2wAbS0wtoxkveWxqPXaz
	3BlHzggbpZH4H2rKDrIHjFh6d+zlyL/hX+351c4UssoGCpcUFgo4rSEPdNq56ydI
	Wfal5uGA7s7RihwV6AIiEOc5qypx0CRptLJLoxqsJ9lR6tD4KHnQ3g0PEf31w0Hq
	5XYA7Ee3E3fJT6WyRoPqEcc1eARCEHSowuoCI9jXQR/WbTg3b9VRUK9dc6JhQyVU
	ie0Vv5lNPpSgzQHKms8HFg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022121.outbound.protection.outlook.com [40.107.209.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cfb01av9g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 07:54:07 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlCXzton6zyIHjEe5IMTHc2AwncBaBJe1/3upUQD44EGyfwfbbhZWPTaPCgZc/YSIwsbgrasihjBeEmuh+evaY0fOn3efqeLYXyRoDZNCmHHGJ2lkEnAud84i/8TrCmvw8i5gfLKKwCNQNgfFYh3gSAqC7B0q77r7V1k2HufNOxSCnkcR09XaVkvElY7sTAnu6cdMUHx2jlBgnwnAWETjFCtIXCeRptiNKOcKX+lX4ZkgPaj3+ln0fsaVoc1GilSowPxGlCXEq8jXKgiWuaWZ3stipQJiILpsiGqnKkcNGfuCxv54mmjherpOotRB0mx8y0lP8vt/rIWMSLvRrwsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4JD2KNIDAi4yATCDrNLoSo/ZmfXLv0QkHVhCdbAswE=;
 b=YYo9BKRLmc9ilEPPhnnjjgnpqGocO10qimMlmRlCcV3GujHBFbQSDarC8JvYpEbBBEGqN4q9lTtXnO9yJOeUQTNStb7Jx1Xp5KUR7PM6Oe5dukm03evjkYbjQbVqBf69y1fwUxTY3hVlgSlkmuHEm98TcJAH0GD98RMOrJk/fDZ5V4vplbRUDQ5/Z5b7gnUPpIztjP/aUhyWB6o1kBIa7vMP7o5a0FT2NbIAVBoNLWywTpppSj+9NTI3n4wxXeJKhTnINl7X4AoQ4XqRQlKP65wGKBJ7dj8vd3ZxfQ/R5ouUdrYPV/Aptt7R76fg4FvgJbu/JWt5GveUpmiRbjeYDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4JD2KNIDAi4yATCDrNLoSo/ZmfXLv0QkHVhCdbAswE=;
 b=aztJlkUrdriIBLbk/5L+lu9ERePrNUP/HkCF8JPvs3eUCRSAjsFUvM1jV7YmTyYQg11XHCZX+jN6BvrwGSskD8IPoKyM8IXjE2e/o9awqpGwXWVZ12ky+YB0KzuXI30gu4ekJvn3egxYJQ5wXuzmNi+c300EK6nuIf3inC4xNdw=
Received: from DM6PR17CA0030.namprd17.prod.outlook.com (2603:10b6:5:1b3::43)
 by SJ0PR19MB5447.namprd19.prod.outlook.com (2603:10b6:a03:3dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:54:04 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:5:1b3:cafe::5a) by DM6PR17CA0030.outlook.office365.com
 (2603:10b6:5:1b3::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Tue,
 24 Feb 2026 13:54:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.0
 via Frontend Transport; Tue, 24 Feb 2026 13:54:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2A44C406540;
	Tue, 24 Feb 2026 13:54:02 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 19A7882024B;
	Tue, 24 Feb 2026 13:54:02 +0000 (UTC)
Message-ID: <83676f2d-ce5d-4159-880f-ff267546740a@opensource.cirrus.com>
Date: Tue, 24 Feb 2026 13:54:01 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: SDCA: Pull the Q7.8 volume helpers out of
 soc-ops
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
 <20260223095425.3905703-5-ckeepax@opensource.cirrus.com>
 <78ccf769-f89d-4935-b1c3-b7995dfa6446@opensource.cirrus.com>
Content-Language: en-GB
In-Reply-To: <78ccf769-f89d-4935-b1c3-b7995dfa6446@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|SJ0PR19MB5447:EE_
X-MS-Office365-Filtering-Correlation-Id: 332c06ec-64f2-4de1-7f33-08de73ac2b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHFCem81N1BKdUdLdUROZytLOUxvQXR6dVRSbVhMazFOMEE4UmV0WUQ0SStS?=
 =?utf-8?B?akFQeVl2bytmdGdqRjNLNnlCbW5CWjIwMWtZRlhMWDE1NzJ1dWxpQkorL0tn?=
 =?utf-8?B?R2Y4Z1d1OWFHdm5udEd0UkxjZGNWWklrcitxZ2JOWlNTOW9nK2MvL3NIZFdu?=
 =?utf-8?B?MEZzQzA5SjYxTEx1dlA3aGhiYitWRnBnVWpCUVd3OTM2VFRNeVJmbkt2YWhE?=
 =?utf-8?B?Vm1SbE90VDJwVmg4amhVbzFiY0IweWdpUEpMaE5laHBtMDBQR28wUC9TeDFR?=
 =?utf-8?B?bU9YbWQ3ZlVhak4rdUVsdlUxdVhTdE9vejVYN3g5dkkza0JUbGN2eFRQZ1pp?=
 =?utf-8?B?MWxBVzVSc1RRc25odnNVbTQzWXBQMStTN1IxUUEwUGpGYzJYZlg5cmxRNXRp?=
 =?utf-8?B?MHZZTldXQ2xkVkdyWHZWOVhkYjh4OU14L0FkM25vbDVxTDRFZUFreW1qMXdr?=
 =?utf-8?B?QVVmZk4rRVRnWnY5KzJvWUw5d2lKZkFKbm5tUzMvRU1zSmJtUVYzcWhqcWhG?=
 =?utf-8?B?WW1MdFBLazdRRWdNc0pnMStoVzJ1SDZhNFQ4cmNoQ3JwVXZGYTJidXl1RzBJ?=
 =?utf-8?B?ODcxMU1uSDFPSXpkcDFrcWk3Wjd5Y1JXaGhpdHBXUWJ3NmNQMW5SZ3k5UURy?=
 =?utf-8?B?WXNidkVSRE5KZytVVEx4OFFHd3NLNTNKbmp2aml0cTVMYm9HRm9OTFIwbHlm?=
 =?utf-8?B?Y21PQ2pIY1ZmcGs2Ujh4SGQwRnpVWVRod1QxaGIwei8vQ0RqaEw5TmN1QkEx?=
 =?utf-8?B?QVBQMWJ5aVoveWNuOGJzUWJpakpXM0NWaGZNd2hmSi9WTmxWcVpzbmdjK3pW?=
 =?utf-8?B?dXJ3ZXZDVytGa1RMK0UvL012QWZONzlhYllRNVNuNGZXRVZ0WUV1Q092S2s4?=
 =?utf-8?B?RXhnU1ZoVEp3YVJLRzRnK2lZN3UzQnp6bUY1eUhkT0NIWllkbmVLamJjSkw2?=
 =?utf-8?B?UzFDYkJzYVZYdklDL1JHS3NCOTI1N2F0MVJaMlNiRno5MEVHK0hxbUdpdXM1?=
 =?utf-8?B?QllRanNmckIyOUprbGhJYUZFeEZELzM1TkovZkJJMXJ6WENrUXpoS3ZPdUQ4?=
 =?utf-8?B?a2hoODhDTWh4empxQ2hLWUxsaGltVWpxQmwxTjNvckJ1WU45NnZEaXBTTFFy?=
 =?utf-8?B?ZEU3Vjhnam4yS3pRTjBicWJhSHpzelB0eGxuS3NKeSt0OE5NY2N6OS8rWTNu?=
 =?utf-8?B?VUhhcXYzblZkNmR5WXp5dFhJVWVweVk5eVEwMkhxVXluM3BsaEFxaHN2cnlI?=
 =?utf-8?B?NnZaSUJLVHFiNTlxbVhoZEFHZmNEL3ZXc01XN29vTmE4VEtWZkU1ZysrZ0p3?=
 =?utf-8?B?K0JPUzBlTGtrdkVxZytLa3JuMTVRRm5BaUUySVMxNGJGZlNSVXBES0tadUJP?=
 =?utf-8?B?ZlNYWUZYSlFtYmhEbEtKNXA3YW4ySG95Z3NQWm9ONk5sQjllZkZXOEMwNDVW?=
 =?utf-8?B?RDE1cXh3STQrL2l2NXZUWGxLVExLdnF0RVl2emYvdXFBTjlDdHRMVVRLV1FQ?=
 =?utf-8?B?aThKbi9CNVhSTDZ6SEZ4Y2dRVHBOenlGZ09qSkp5cmlrWnEwbG5NME9zdU43?=
 =?utf-8?B?MFlWRVlSYVcxaHdkMEIvbjYxYWRSTTFrYzhDZmpES0VZWHQxUU5jbXZpWUhm?=
 =?utf-8?B?S2tPNTRCT21ES0orVzN2OTNoU3g2NllzaVdHSWIvQ1NiR0pLN0xLdVdZZXZy?=
 =?utf-8?B?QStpcXg5STM0Q1d0ckFrejZNR2c5WkYxQm5vRHFBdVpxZXFtVkU2Q0ZyYjBF?=
 =?utf-8?B?bjFWTW1USkQ3aS9zTzhEcFEybEFoVTJUbFNLeUFPVnJKRTAwVklKVExDVTgy?=
 =?utf-8?B?bWt4eTRoeWptRVlMOXJDeGdaVDBGUXFBL2lQdW50elFiSHBMMWhLaVdBMG5z?=
 =?utf-8?B?SlZBVUt3YjNqaFpOQnhIdHQ4SUZadXQ2R2FwdnE4dzJtbDZuZ3JPQVljOTlZ?=
 =?utf-8?B?K2NGMXlQUFVibnZqZjlDNG1YcitReEdkZUpqU3BLdWJ1dDU1Ynh3OVMrUWp6?=
 =?utf-8?B?WG5aUFg2NFNDMFFwWS92dDRtNGUrb2kreHRJZWVMYjM0MGc4czZFWTY3ME9D?=
 =?utf-8?B?algvd29ieFBaRFc1Q1FIUjMrOGlRdmtmU3JuWnRHQ3dhTWFSMlpjUEV2NEs0?=
 =?utf-8?B?V1FRUU1hd2lFekFNcVUwWFlEaWhnd1hZSmNNbmZ1d21LaFFaUit6SFlVeU1r?=
 =?utf-8?B?SDFZbXpjeEZidlRIR1IxbkV6VXkwbWY3dkl0ZEZEMjh4L3QwbVpTUDUvQW91?=
 =?utf-8?B?MnB1azljOG1YM09KZGlReGxwQmZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4EsEVbGvQf1S6p3JO4DGNxbSNN32CJFoQH+H7RgF5u9btGhoYK1PgAy8Fn2nWuu4jO+F077Qaowdh2CKHnk0rpR7HViZ4qpVCzDnMFtyJkLq6xscqFUD8GNDVskXF8auDRQ81KAKQohGR17PGgjx7KX6LB1pKCFiJlW4F+bmKwiGxutYWf3OeBfG96os1vWBkZvHOlnJDJ8+tKeLIaL1Di9ZUZy0daVPE/VLVb3ePyP77Yb7g7kK213ydPyRcTIehf8mBDeTCj2/7SmHy+v9VgJVdc/O7ZcCvJWvuvPZdIKN1J21HjJSsTmRKok8Q4KCSawR/Nrw48h5oU0DBlVTV/DmcLwGUK0wDymAAIhjsqh5+bRSDoaCcIVes1z4R//8ppaY7iDClK7pOc41x9vkhw8mgXSoOOgpWvBiFNrQ2d1E87sQ935ghi9fLRf+JjQY
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:54:03.1635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 332c06ec-64f2-4de1-7f33-08de73ac2b76
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5447
X-Proofpoint-ORIG-GUID: PyuS04MG7c8ZwQ4nGN1rjfv3pKzrv5r8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDExMyBTYWx0ZWRfX1zo1Qe3j2pSE
 +sKRqqBVDdObgHOGfrOYkeLyAXLViBqdsbX0uDmcJntJ3oIuPS6B9XrPUbiSYMtRQqJipPAaMrD
 u93qZzvMWPMcMkvalbC5GdpG33erm9te+KtpAPLoapFzTprvxsQzAuQIr+YaV/MjfYmJ8QLDzUB
 5n6UBm6Ov+4llbAFa1qIOMIWzsMeOuAJGIBywlLrT7UNHbnSqmNxDBKm45Kw+skSecTV+Kxk7V+
 e6K4sJ9Y+KocioAfrowEX4ST3hdAyZAe+XTjnmAdQ++HR/K80WnSFcIn2K/AYQGDggxYR/R3SLE
 Da3dsJA+aZElFIsBvj4V/ec9+fqNaZxHn3KG83pvITVcAmTgpL1zOao3q2xmirWK3CbVgjDBDtG
 8quQJi9vLUYsdx95mEfKIeAk1IGm/wTWQe0hECycrlc2wAO5carqbwvzYaFThzzEhKfkyvtW47Z
 0pu2E2kxI1nClfX9scw==
X-Authority-Analysis: v=2.4 cv=V99wEOni c=1 sm=1 tr=0 ts=699dad7f cx=c_pps
 a=lgq80kZn4F/3L5fHRNAplQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=aXRq-B2cIdqoP2rrsgUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: PyuS04MG7c8ZwQ4nGN1rjfv3pKzrv5r8
X-Proofpoint-Spam-Reason: safe

On 23/02/2026 11:43 am, Richard Fitzgerald wrote:
> On 23/02/2026 9:54 am, Charles Keepax wrote:
>> It is cleaner to keep the SDCA code contained and not update the core
>> code for things that are unlikely to see reuse outside of SDCA. Move the
>> Q7.8 volume helpers back into the SDCA core code.
>>
>> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>> ---
>>   include/sound/soc.h        |  1 -
>>   sound/soc/sdca/sdca_asoc.c | 67 +++++++++++++++++++++++++++++++++++++-
>>   sound/soc/soc-ops.c        | 55 ++++++-------------------------
>>   3 files changed, 76 insertions(+), 47 deletions(-)
>>
> This needs a corresponding update to soc-ops-test.
> With this patch I get 104 errors from soc-ops-test.
Actually it doesn't need a test update. The test is correctly failing
because of an uninitialized variable left by removing the Q7.8 code.
