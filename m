Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A1B356A24
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841572; cv=fail; b=CDBwTQzIj95SrazfhjPu+ujku7r0+BNdIysJmPJtHvwbbh2eSPS69pSD+FKRU0ihH493WJX3vU+Vo8ykfKLyzfVeQQq5slcHYDl6mtveopAe8dctyh1W7Ka8UidkzyDc2knrpnnbZjNE4d+z93jMcfGkGUZTMsSRRZs23Ygz3uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841572; c=relaxed/simple;
	bh=zo+rMxGlLZcwXQQ3fv3QUqPw8fvQMS6fCwolTCvxJxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyyL1YdsrTWtUSh5qg5s5DDh4HEbKgkQoIwmdjG1qCtMoJ3uJNKUwf3mKK42PCP6r35SDaJ3gYHcWMTFuaPYhgypfw2EUPcm8QC6GZnkZkztOs/Qd4eOrpvyuap4e+gqt+N+dpM0JmUXGkU0ua53lNKUqg11LjWnxJKT/qHDVOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=F3mXjxiq; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XBo/JmC+; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="F3mXjxiq";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XBo/JmC+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N6I1se1248859;
	Mon, 23 Feb 2026 04:12:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=LxU4ZxfgK6Y4V7APGMH3M2wlp0fDH9hstiKkPpXBxWE=; b=
	F3mXjxiqRhb9FAwj7bbRc6Crk/1Q6yoSSKoxcIlvOxPccogT56rH9yPsalwRYrAV
	biPMk4cki0sd0PfnuJnF5ed9RkskjqrlsYZfpyZDUV96SwLw7zhPk1pw69YBzbw2
	4mFofMBVInWtoWABIUAKQqlqjAUzzqhTIO+bpWPcwGHBFooJggC9+QfyaCPNMBTd
	c3ZXCAS3CZ5OcJx3hIAi9ewe4Y3WMXuMsEDs+26L3mKcBKfzx7KWk6FxKR2Publi
	Mf3OVP+RNb+sgT+Bn4lFn+VX9NLqyhpkeJ5kX4rkUzoSWQQ2Uq7SE+hqcNWnlaKs
	ldWEnK6nI3P/h8DzKt6yiQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020140.outbound.protection.outlook.com [52.101.56.140])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j1d2m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 04:12:31 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qba8t2z5NqCsgN2pAASvFZmIv9Evk6RHljhGKhMaFxn2NAsuzwayMAbz3RtNAx6oXdkAoqnwXLjd0oqWQ6l2J8gaKAXIy6xre0jJmA8u6jNUtjxt3e4rnAeQXDpJxAoICliAB/R7qMfu1dhR84ZUVLt9facHP4o0wt85Ntt9dpF3ZEiYFRs8gmroYt1d9rXBjHoUJzRQPnRVGxuRlRCh5WA9YCyaWZ/MW3sIR7KwZNxWGEkf6wWoUZuLEc/x/v8448sPaxfw2zljwhV2aJVM5l5J8hnMsT+5sQ4MCz/unrRvqy1mHxjZBqfQ7j1T/PaaXLNHQbo7cOrLyDhkxLYd4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxU4ZxfgK6Y4V7APGMH3M2wlp0fDH9hstiKkPpXBxWE=;
 b=tr75Vv6ITVL8bOtuxXBUHnyQhSiqzsC5g4CsGOdZ5xjqdVnLJm3SYmiD6H0acla1wFu7YaTdWxuoABWf5rbHqEg15VkUs2FjDyoqirVlWs+Sr+cddu0qk1MsENeBZHuJdO+wvrwjnVTxGEzE+k384kaCaXU6TQ3Ntu9Lj+ngobWZpITKYeAgEhUGkiS2bBGaXDh19JYB0c1Y1j3NaQsbK+s9JK9hFacKJnab1Z92Q9r9MYSfisQaJd4y3n3aIGCIHN75EHOYvzgVoHemYNouy1Q4IxZ58L6d/rpHsStFyis2iTu11/w8axWW5FfRRKHBQ05AmVSBa+kZ0QS7iBoRSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxU4ZxfgK6Y4V7APGMH3M2wlp0fDH9hstiKkPpXBxWE=;
 b=XBo/JmC+2eguDBeJGT2orpHP13ZOUyI9DV5jYdsQFwi4cnhlZs5cqgXvsTXfhfWAYF6XkTv2gELbF2O7+ShKeTWcdOrhHea8roce2O0DZhPFZjeRGrczJ0kWGfRroqcIeeMJkGvHHiAbc11Vcf/8QB7b7C/qB+LgNAXS/Cii3m0=
Received: from CH0PR07CA0029.namprd07.prod.outlook.com (2603:10b6:610:32::34)
 by DS7PR19MB7721.namprd19.prod.outlook.com (2603:10b6:8:d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 10:12:28 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::85) by CH0PR07CA0029.outlook.office365.com
 (2603:10b6:610:32::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend
 Transport; Mon, 23 Feb 2026 10:12:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 10:12:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D8912406541;
	Mon, 23 Feb 2026 10:12:26 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C7C7382024B;
	Mon, 23 Feb 2026 10:12:26 +0000 (UTC)
Message-ID: <019c47a2-7b3e-4947-b90e-d6adc660a1da@opensource.cirrus.com>
Date: Mon, 23 Feb 2026 10:12:26 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ASoC: SDCA: Improve mapping of Q7.8 SDCA volumes
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
 <20260223095425.3905703-4-ckeepax@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260223095425.3905703-4-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|DS7PR19MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: a9cbaf3c-55f6-4807-a36f-08de72c40c85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0NFUGxpUW9kOTJTZDdZd2l2OU5GS05JaVduY09PRGlPemM3VXQvTzl3L0lL?=
 =?utf-8?B?YitlMlpHTFJrMEJCSm5COWJiZ0V2VmZGYW9UVlhubWJmS01NSmRoNisvb3g3?=
 =?utf-8?B?M2E3RnlXUVBrNEdwdW1WU050NFY2Z2xySnRYcEc0REVrSEkvWm93T0F6Si9q?=
 =?utf-8?B?NjZsUUFJa0FGazJDVjhDa2NvS0Y2QklzUS9BS2JIY0NvRjFkaXdqRUZlcVRM?=
 =?utf-8?B?OElLd3BMSG1scXlTMkZ1TDVic2Q0SkUrdGE4WTBqL2R1ejNHT3FWcXlETHR2?=
 =?utf-8?B?dmwwaHdBbnZKQlQ1SHlBVkhLOFpNaUhkclh1S1dySU9tZDBsOVhNM0VvNGtD?=
 =?utf-8?B?R283WW9nUkxWbnp3eGxreEFBaHZZbXRZZ2F4S3d2NDVubVBuSFJYN0dIZ204?=
 =?utf-8?B?MGtkUE4xbmdaSVh6amNJbTBzaGNtUlNxNENaWlFhaGZXN0k3aFdKbnMrK0xO?=
 =?utf-8?B?ODF2V2JjRmdxVm52UUs2NVNKL3ErODFEMUMyTjBoc3k2ZlNPenVzUzJHWGFj?=
 =?utf-8?B?MFJta0NwcUZCYXA3dkpoeXB2V1BRaXh4K1VoK0U5NHdQRDRFVnQ5eHhIelkw?=
 =?utf-8?B?L2x6bjFjVXRTUC9DcHNPSWdoSlEyZXoxeXVzU2g5OW1xOGZpaVErUmE4dFJv?=
 =?utf-8?B?bW0xVzhiR2lLazgrUk8wQlNSQ28waGZKOHRxR3RVeUZmbXdRTjl0dGRWKzNC?=
 =?utf-8?B?TFNtZU1uRG9Xd1ljN3NPZGc5TkM2M0h3cXk0Y0k0UDBjR1ViUmZwVGl6TWZh?=
 =?utf-8?B?R0txR0ZjcVNMVUQ5ajEzendRcHZTakpOOHg2aUZ3b1k2Y3UyNWNuTzg0aXJu?=
 =?utf-8?B?elZ1dlIzVjJVSmFvcU5Senh1dGpKV0tac2NCV1doU2VjSFE3Q1ZEdGg2cDNn?=
 =?utf-8?B?VDlLQWVoYnFQTGpMQURpSiswT2tISFhMV2hwYmpFZEUxMFJZN0dvbGJTRmZF?=
 =?utf-8?B?KzlzMmhQWmp3YkUrQXVjVDVMTW91RU96bkI3NFFWN0lOZWt0K0p5aThRTTVJ?=
 =?utf-8?B?bEJUMGxSakg5cjlxVGoxTEhQR3FZQ2dXdE5RczJSTVZJSWRCd3E4QWd5bTBZ?=
 =?utf-8?B?Uit2VG1ZaXhLb21TeTZ1dEJBWUt3cXBreUxBRFZUb01sd080UUdiNG9tTTNu?=
 =?utf-8?B?VkJRMkFLemlONkowem55VlU1UkZoSFJBS05mZ3k1VU5vYWV0TXAyZTc3YXZi?=
 =?utf-8?B?b2g1TkZDYUdIRUYzT1RUQ2JRM1J2RGUvaFVOcDVmRS9XR3N3NXhJUmNWRjhZ?=
 =?utf-8?B?Wjc0cFJuRzY4TWRQNWV4UkozeWQ2VVExM2dVTlpLUS9TUWdWbjd4T01jamNZ?=
 =?utf-8?B?YmNFeEc5T2d2K0tmbXFBRGdUbTRVUXNvMEJZVlprMHVPMHQvSkcvUGZxa2Fk?=
 =?utf-8?B?ZXhDWGhMdk5MallLaGJmV3dUeVZveEVZM09FV1FDNFV2V1U3SHJseG5LMmdz?=
 =?utf-8?B?RDZBQXo5dEpyWDNpNkZnYmFBNkp5cnoralRVN1d5RmRYNWFnR0t5WVpGNDBs?=
 =?utf-8?B?dFpHOUZaM0Rkc0hZVlI2M1dpMFZTdVpDK2U4dGRqcFJZSTJrQnVMNU9FT2hs?=
 =?utf-8?B?a1N1d2JuWElhcldGK3NnQWJybkZ1Y0NjNkx3WEsyR1NuS3JCMVMrNS8zeUpw?=
 =?utf-8?B?SzZDSCtPY1ZLd1JKSHlQTG53Q01yazd6NmtjM2tIQ1g2T1JNc3MyMTVlckxY?=
 =?utf-8?B?eUxhRnlEdGlrcHBiNVA4VUlraWJsRWRBeU5WeHBWbkFTZHZ2Tm53cTc3ZGc0?=
 =?utf-8?B?KzdzeWIvV0huNFQrN1MzcWRDYU90cWtnR1NEQ3VjZkVIL0loc1gzak8zWVRW?=
 =?utf-8?B?VWJidEExa08wcE9DS3ptcVl2d0prL05vUUx6VWhlNXoxUFZhaEVIQ2RFSkd0?=
 =?utf-8?B?akdpcDF6UVBBblFEQWZSZlpWUUZtTmF5VU54cW91cmZjbHhuZUFBekxqMTlo?=
 =?utf-8?B?dHhKYVlIN3d3anppU0xFdE5GTGNCTk1aVkhRWVFZdC9UZDIwd2JYdnRXWVRO?=
 =?utf-8?B?U25xb0QwSktCYzZOVnloWUxDUjhwY0puUk9DRnU3QVUxN2dKMGxMbkkvVXBs?=
 =?utf-8?B?b202ZStBcXJINXZwUmFWb204YWUyNWtibVpXQ1FBNVppcFBlekp0YVlOZS90?=
 =?utf-8?B?VC9PWnkyWmI4VUxOMDNqMTE5MXVFWHg4RGxkZkNvUkVneEFiMnRGYWVHT1gz?=
 =?utf-8?B?RjRkRmpxOGlQZ2FlcHdQcnhNbkx3WDN2NFE0RCttTjJJa05FMDM0VDU1Sldq?=
 =?utf-8?B?emJpUHkvUkxsaWZqVS9ab2czUWRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZLbuBtg72Pl9U2dHdgacJKmaW5+3tSWEiwXirMe1lWQuUMWMN8orSp57GmoEq7mTiddsbWPpQWr9rkSoSsZMJnKF+yi1MyOqcs8M16/KwGM66z1GAS1+S7oRLbIejj59hOU7mDGY9gfEwXOrHwMiuqIbT9O2pRz3p9rQcvpOtdPUZLNjaeQMp2iVRfnxwLeT3nzWxj3M97zMl85V0ftiL7MvShUyPQB55nONpBXUVE2XXmCeTde8gVuWTxbTf1bRmcvnU9WApqoLQ6MJpK/1PmOln5To+1D/HyGUUiI390sHcWEswWjU2pcGeDD2dvBGbPr7dUTMh/3FAm0Uy29g4mPVqScLNLYKZpYF9Aj57E4zwsdoKO26SJVnunn4PRuSpU87I41ks/3NRvsOXwlvBP39s9g3bLXL2aXpM+KZkBzR94Q9v2h7rLyKIbrvp+m4
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:12:28.0110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9cbaf3c-55f6-4807-a36f-08de72c40c85
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB7721
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NyBTYWx0ZWRfX3Uv40dESa12S
 zvefEJrdTWP+QKu80ed0yRVQUnhEsxmcwm0kTKRStxQeVIsJPrC4xq9rGmtKkxdBv8CDlmSr7s8
 rORKdryP4aFSoVLSW3SHs7erT0GputSxfXYcXsE3zN7SXfUPR15ZoP1vr9VwMVdskrHSD1Xz2cj
 CHO6GoJAtG21WQe1qvMDVxgH3ZWrtvUIrkIylL6qB2czZZddaP9jLaEtIpzjnv00fn9DV3lPgnQ
 wy+24cv+nQMi+dlBsUcJB8wmMKwwIhVEkhMsJMZ0Q5Hj2c94FNp230G1880hZaNV8OKcI9A/9c3
 0B6CyDKpzOCjNY1rLgfZEpe+Sd7lQxOVObf8atumfac8fZvaW0/rfkiQmqgFMFW8PgAwAYZUSst
 rkud44TCytRTJz08loFfuDy0VMU+zjr4yI4ExrrH0f77FNzGSwRfvuin0Y29yEgfUeLPm9qk/2m
 znRCG7xxJafCLastbhg==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699c280f cx=c_pps
 a=4/UW8ytoqjybu2K48dBchg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=PCgGbZMr3tw4ohcFWWUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: wePnKi8sMTTfLGZlwfr-DOBTiVJnVl5P
X-Proofpoint-ORIG-GUID: wePnKi8sMTTfLGZlwfr-DOBTiVJnVl5P
X-Proofpoint-Spam-Reason: safe

On 23/02/2026 9:54 am, Charles Keepax wrote:
> SDCA measures volumes in 256ths of a dB, whereas ALSA measures
> volumes in 100ths of a dB. Currently the SDCA volume controls are
> mapped to ALSA controls by mapping the step size and working out
> the number of steps for this mapped step size. Due to quantization
> of the step size this means the number of steps in the ALSA
> control will rarely match the number of steps in the SDCA control,
> leading to skipped values and multiple values that map to the
> same volume. This is not a huge problem, the volume is still
> increasing and the differences will be small but it is not really
> desirable.
> 
> It is simpler and more accurate to count the number of steps based on
> the SDCA volume levels. This gives a 1-to-1 mapping between control
> values and register volumes. The TLV is based on a minimum and maximum
> volume so still accurately specifies the volume range.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>   sound/soc/sdca/sdca_asoc.c |  6 ++----
>   sound/soc/soc-ops.c        | 12 ++----------
>   2 files changed, 4 insertions(+), 14 deletions(-)
>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>

