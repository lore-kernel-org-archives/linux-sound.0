Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC543361667
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 11:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771847005; cv=fail; b=PTx7yxM8Me5DyKQmzE7yVK5qy2tviO0TRnGm7f4Tl0o7OpNy0C5JXjSyJ1dww1wrendf7t8ScMwi4qZZ4fN42dSWAbCGRk4eaUZeClCUOFvpqnTC7jn6w4XHG5aU2AUmCAbQEKKeDAbj+HcXX34pY4VRV8GD9Gs5bjlSCM+Q1Lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771847005; c=relaxed/simple;
	bh=UWRHGSUDVRRNq3pYGMrlFLD2z+UikKF2f5sXnH/mG5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jxi6L1fHEEPekqmyjqyyhu11xRymvV7DBG6WjPSQ7I4+cdYv1Ps+ETf22qvw9z4Ax1hILAks5GoaeY6x9OjrPAPwtTK51Gh91Krcdkf2NgHRDzXPiWLpmBxtBby5S2xMKzdlKOspiVNra4bw3bULvAQZGznhUqxa+QW1k2SrdVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FVRkpQjP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=O4I5+INC; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FVRkpQjP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="O4I5+INC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N4f4ap980569;
	Mon, 23 Feb 2026 05:43:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=0XqbEyd5J2CsLWzQD0xO6M/IRHIm43AEJ7YapMEURBQ=; b=
	FVRkpQjPLIMwXfBC1PUm3iZroBdZGz3XOe4euCor4Z6DHyMhsKWr3yXITMyqqDMU
	2EVWqBOEalGj6JnogiArJmCut+KKq9swQSfTej+UzmUCK5+OmcCjHb8IcVJYceZ7
	Rv16QRzHMcvtDJG93VmoEa6sX8g5kdlvk7jZi6bWEKaty6x4H5xLz69vPFyg1b7q
	TuUAWE0JeOzT+6V5NzeKx/Q/0j50OcHDlOu94fTP5tq5cpUVqTbH0JIA8X6rC/Wl
	uWRZr0vGHSxntCOFOZqk6F2JwToqS+eVHZ9NfNnTvFECg1aMABwDwNVdKDb0FrZW
	6lI6N3JxiCqzzadbHHE3pQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020090.outbound.protection.outlook.com [52.101.193.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cfb019e8t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 05:43:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJrRj9G0M6tQz3JTgM88XaEuU27mYar/JOnRbOo2H//VnzMFYeAaj59bqhj0zgIxPYP9X2+TrkXAvKzPpnxT+drLf4dvD1xQ4Gv6LWqEtq5cn9dal8KybWInG/Z9v7aOOcrMWYQ5X6J0enuz6u/1v+8dbvwk+sbHuFi7D9Qd0dGDlnHmCdB3H85BAVelvoqlKevxscHu8AqHAFqJ+o2d6wQTNGAxalFFbFUCuIXwx0KqfMhu9m1hVATOSJtjVVUbCMD/4Ii+6iBcDEpi5Nx1WLTTEusmZ5G3q7ZpfkgoeQ9wVnWoL08HOve8O6ZDqENfqn+G4B6MCaQQdel8DIh6YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XqbEyd5J2CsLWzQD0xO6M/IRHIm43AEJ7YapMEURBQ=;
 b=pRDfqLBi+0DU+gu1TVwSe4wdVQjhDXLGZ2KG3CjhDNNjsWvZC4fpZJ7vJ3CKTjvcopzYsxKGZdQ6gG08hha8VNs2+m1zg0iuVw+VQOVe2o75yLMyZ/qm4FmgK2gtoKW6oysT12d+lwfADBxKniuMYekjNr4i/2dJkuhG2+5DXeA37dzrNK4DlR5kDGAFwims7O6J18NHreGuKjh0dJDsSiG27jSuIp8We+tLyCRLrsuD+v4Jl3WJy5LG9Ryz7Sa7by/bGZ0339JuHJ7KRrwtdmSBF+LXni4qSZ3dlslG8YfZ6Pw8I9fyL3KV0iYDyN+z6mDOQqLKmBmNejJS99bn1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XqbEyd5J2CsLWzQD0xO6M/IRHIm43AEJ7YapMEURBQ=;
 b=O4I5+INCoDa6haG2Q1n8N3svpnxFYhyZBXKxVLyVEHUDQqOLNNp3bnMz2dE4tMe7NFvBAosZn0EUHsYpuBzJya7t0b/MrsexV+PHJXZfGvKhCOIR2hObeTvFAUhr/cVl/OlCWWO+bK9y2uNqUdm45Ms17d9TktuNc5UGwVdNqvY=
Received: from BL1P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::11)
 by PH7PR19MB6013.namprd19.prod.outlook.com (2603:10b6:510:1dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 11:43:12 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:208:2c5:cafe::5d) by BL1P221CA0013.outlook.office365.com
 (2603:10b6:208:2c5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 11:43:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.0
 via Frontend Transport; Mon, 23 Feb 2026 11:43:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A1F55406541;
	Mon, 23 Feb 2026 11:43:10 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 885E682024B;
	Mon, 23 Feb 2026 11:43:10 +0000 (UTC)
Message-ID: <78ccf769-f89d-4935-b1c3-b7995dfa6446@opensource.cirrus.com>
Date: Mon, 23 Feb 2026 11:43:10 +0000
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|PH7PR19MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: df56dc90-32f2-4c00-bca5-08de72d0b956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NitsWDVlQ3Z1ZjFnM0FkUjFWNTNPaXVuaStiOG0vbS9iUEg2dEt0QVNBa3o3?=
 =?utf-8?B?WnJsM3NybGE4L2xOYWkwcmYrZlQzNDBMdEtxUWZoY05laFduZTlGZTg2TDAx?=
 =?utf-8?B?TnNuUElvcDExSkVhWERtUjJkRWtIOEpNR05YZHg5RTlxcTBuYnRGMnNqK1Nw?=
 =?utf-8?B?aXphRzFSZlRkN01DeGxSa3hCb095ZCtQbzhxRDJlYUtNbWEvdkg1b2prZDF5?=
 =?utf-8?B?QnFUMWpHM1NYMlBtV0pKYkkva0VvMUozMHE3VXRmZU93Qk1xV1NneXBSbStL?=
 =?utf-8?B?WWJkM1llNGRkajZjaWhmcTNBZXRHaWp2NkdwUzhaSm1YS0k3Y1k0SitMNzNm?=
 =?utf-8?B?V0hKc0tkV0pKOWlCVXR5RjVNTU91TWZ6Mlhya0ZUcXRPenpqY093UXFlSzAr?=
 =?utf-8?B?MnVZRy95bkRqZVhHRGRZdHlTZXlobEVvK3JOZUNMRzhmOXF3R3JHd0hpWDBU?=
 =?utf-8?B?dldKUWZLdEdRdEJHelFtdndsd2dDZThNRmlpZkVDelJUZzZlZFNKc2dXQVJm?=
 =?utf-8?B?TDBJTmRmNG9pU0RhanhIYjcrazZBN0dySGl3Vkk1TkNOZmxlQm9RS3VmTzZK?=
 =?utf-8?B?REloeURzMHVBcU15SXc0QVBmQ3IvYXF3WTZmRTlqcW8xWnVtckh6YThWMjdM?=
 =?utf-8?B?dGtjY3lSamQyTkNyYVlsV3Uzams1MmJ3bjZnbWkwRmIrdjhtZndGOUI5OVZu?=
 =?utf-8?B?cGpvbWRiV2tES1UyL1FMK3JtTkxlak0waUJPOU5mc0sydFpKRUhRTUhBRnlO?=
 =?utf-8?B?RDc4dVhjaUN1c1JJS3JtUVBlOWhEdk1CVzBYK0FuK1VPUVZsMUs4NXdlQTlW?=
 =?utf-8?B?eEg3dVN4amRaMTl4QytKTmhwUXJSN2FZVlIxaVpKMzlVaG1DL0xWTTNEQy9y?=
 =?utf-8?B?YVdjbVlkOVFMckw4blFEWUhrRXpPRFpwVmQ0UTlJUDVwQWlhOGFhbzBZUldR?=
 =?utf-8?B?ZlhuYmxRQXMyUSt2NndGWlU3dElra3NQSzJRTEFXNVdSTkQ3K0lEdVpMMTRK?=
 =?utf-8?B?NldqM2xyT3pTN285dGFTdzJDamd6WEhsMjhpY1VvcXZKWmIya1F6TW5RL1Nh?=
 =?utf-8?B?eEw3cDFBSkt5RUZMVXRHekVyUk9oM05zZVBhc1hjcnJ4K29XdnlKUTA1YVNj?=
 =?utf-8?B?bnp5VzRZcGt0dHN2clhvT2Q5TjhCMVcyZVFSbzg0ZzF4NVFKRGI3K3paaHVm?=
 =?utf-8?B?bkxBNVJvUjU4TjhHemZiYXF6Vm9KYWxkK25jbTFrckUraW93MU43ZmFYVzI1?=
 =?utf-8?B?dURCVFVwMFZHWGNnUWlXZ0RkdFpWcWJVMEhwTlJ0TTdxdTlxN3JrcUZJSmt5?=
 =?utf-8?B?dmJzN1pWcjFyelpyb29oR0hGeDZaMDRHbHNyRVhvNFMyaFhrRzZNS09mOGh2?=
 =?utf-8?B?dlpETlFBSFJ4OSs4VEdaY1JjS2l6ZjR1M1pFcFRaT2FVUDRvYXloZjlDUDZy?=
 =?utf-8?B?dHZ0MFYvYUxXbnhMOGtEU3phQUFLWHkwMjNJbzY5VmdNaVlYbnZVdGVaeUlw?=
 =?utf-8?B?VFZGSXgvQnpldEM2RWdSZDcrSjJGMUZXbGUyeFc1eXdNMWlpNW02YWJROE9R?=
 =?utf-8?B?OXVDVC9uaThXbWl3UU1aNkFoNnJsRXh1VjN1L3NZbUhQNXVFajVFT3N1MUlI?=
 =?utf-8?B?ZmRKZVdreDh5U3BnY0FtNkQ1QXk4ZW5SSmRYV21RWXU5eDhDMXFEc1kzUkQv?=
 =?utf-8?B?QWhVTS9yMmNlYWkxSUdxd25uWXR5OXd0NHhZaFFHSFdFMWlmMHB3Q2wxeHBU?=
 =?utf-8?B?dXRqVkZIUnlJU2tYNVViQTRRcGExNmNCSDViWFZYd3I3UEhWYXprcStwUEw0?=
 =?utf-8?B?Ymo4SVJXNkFYdzVsWDcxcFljbGtrUjRoc1BzdGJhaFI5ZDdVYzZnUk9UcXFG?=
 =?utf-8?B?M1AzVnNjUVU4U0VaSml2b0U5cWp1eEl3STFDVG9ZaWdzWGdqL2NOdWFFeSth?=
 =?utf-8?B?amR4bUhtTko1U3k2Ujc2b3VmcDZkZnpQUVZla3pDWk5Eb1V0SUhnM0VTREF3?=
 =?utf-8?B?Znoweklkc0FKZld4ejhTc0Y3dmpWejA3bE84UHArc0dFbEhyVlYxZG5sdWY2?=
 =?utf-8?B?WDUyeUZIY2ZzR0RicS9PQVBvMjZDSnExdktPWWdtRnZORVUwaW1yK2puOWxu?=
 =?utf-8?B?Ujl0YTVGcm5iMEFKQ3dJdXhBdXlvejJGQmxibkNEQThWUEdpYUlKTnYrejZx?=
 =?utf-8?B?YkovSmY2eGRweUwvNlRtdDhsY2JVT0dlUUpHT3hBRE42S0lWT1V2Ym5uOFI2?=
 =?utf-8?B?YmtITDVqL1VoZlBzTFZVam84dlhBPT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QvKRXFeKY2MzSJRMZedWWqxtjjy7EBiovkLaMLl2U00C24qugQ/AjKMKlZHoTQCX3GucZnMWFcHXLs81CQEV2nJfazfWO/z8lMF3+Fz+yUPGM34ifJxPzDEdYaNB/COm/FH87IUtOMzlT+4UHhlqYZLQBhPA3HAUeR6uqQYWXe3Q6KXhdCsbCXFcT6xCHjQMq29XBjvpMDBRI6BYXf3penIcFX3JkeD+NVL3ylTgACIb6Td6l2k5zdKEXZsHZPL90B1IHeJwuqFIqvKuS+hJIfRisKdlV3eN1Hpa3776Wp2xvDhwDr6DBXcn2VDaFQ11xBand2mxemw2vVqLYX/lGsjtoJqLW6VDgyyxkxNgDTdokHXa20JBKzm7Lykb28LFiGtwDqctjlE6vdbRf426S4/aArHGNpwtU/DRa+IEFW/9S6/hG6xnxEDhl2MZ+flm
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 11:43:11.9296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df56dc90-32f2-4c00-bca5-08de72d0b956
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6013
X-Proofpoint-ORIG-GUID: MjHwF7eFebjkzNpjUMowUDYKbl49TS3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5OSBTYWx0ZWRfXwhEpZ/YTMZuN
 i900hlpGFcrcbNMErsjZeX251BOWX1hS09C5e6eQqnBWum1JA1HRcBr/iDBM+fDOIPBQZydr1i9
 Y5ZnbUBi6z0qoespuXNo5c/Uu4HiYnDesYPC4ZDbZ/iRvFqi/zltPhAf5bf4W6Wp50uo2RbNwl7
 buWqNGfteLTHgzj3enFL1um+HvbnR4n3CaiAGIyvJsWbFwfL8RqLgNxGSYZuplvJWmt0jK4dZ+k
 H0Coa1y89ImjqIFuSPgddf5KMLvW1u2OVSa8weKqyqEKE6VZw177pcSRWanIouiSvgcp/DHV+ns
 jPPHjJeEVRrlutK2vfMwBPdjMoTsO5dIFTxB1fSgjo3w+2lv5iK3N2VyVoR4A4/D/XEqHjRYJ3u
 1qfRkEUpoCOCd2v5wCCG4SiHYM/TrTq83KWTdutXTj6eek2cJ/s1XS9Z+LIJ7aBQ0evepBEn0hK
 KCejyqWkfyA6wa1POyA==
X-Authority-Analysis: v=2.4 cv=V99wEOni c=1 sm=1 tr=0 ts=699c3d54 cx=c_pps
 a=hTY5Tzxx0J6bc07E+BihHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=lJjnMBIM2iGafpjFALsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: MjHwF7eFebjkzNpjUMowUDYKbl49TS3q
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
This needs a corresponding update to soc-ops-test.
With this patch I get 104 errors from soc-ops-test.
