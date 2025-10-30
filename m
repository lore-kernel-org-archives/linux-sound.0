Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7BE1E3DCD
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 15:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761838611; cv=fail; b=p5E/MELMBd1t8fh0tE/0t4JatkNZwtAf5PbKkQWZiGx0Uhl0tw6yFQWeyHV44JgYzJEMjK6zrq5OZv6f5zZSQVKUgp2OmjxzIt68/xKqZ4xCWgjaooRPU20d02UHVe/jpVAAoA9S8Ue2GdxgQiWdxFLA7cYSNMEZHhNTNd+pcnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761838611; c=relaxed/simple;
	bh=BmCLHftoIrCnWCW+nliKbBGnvJ/gMUT4N3oCvC+4Ons=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XvZkdpxB0qmY1s/4K/xRvV+FsE2Rp9GOUk5yKEcYTvh98SRpLf6l56+jqzlCg9q/yUy7QLozDyoiv6cs+T5Y3BG/K8amETntUwUm+Q5z2Axc18jLYvWxYUEBgD93D0V7t/DbnSPn4G1hAQC+jYONRVxXzGv3K8tO0/XKkFEhvt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GzGpdKf0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pqyL4LUj; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GzGpdKf0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pqyL4LUj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UDmcdG661606;
	Thu, 30 Oct 2025 10:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ElV4uwe8Snr4gGh7bZdwHyq+HlnousUTsp4l6MOC+9w=; b=
	GzGpdKf05HxOlB8utDeIFw9QN/7vpI0yOCj7Nk+Bp2ObIHteRLdWM8BC1oq/Mfb5
	B7MmXbPiZBQbd5LiCVp/Eu1/G3xGQDeLCilNZ/N7iPKEkdMTYeF9F5dVSHa2rtYN
	XTCipczK6BHemvMXQGbL+lrGEDF5WXvJBU2V592TuOpjbrGebOQqfIXIcNSrZhAK
	QoCMeNUhaorD5JrfwOvpf6yM6HRFSI6edtdO3A+S5WtqEG8kIAOXi0tKw9SsC+XC
	NeyEOY20f36p9Ma4LG8aCvC+G1J9POmxbTUDVAzz3aZoMhdkZXv5TNqGHPdokVk3
	NpJ4DMt0KJZTtSlq0SFFWQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021104.outbound.protection.outlook.com [52.101.52.104])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a497vg5uw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 10:36:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/htO+kMFCddbgI1npDCrXJinZ847mqGLcCwXWR2zN0BfNZR8Y1oGbcWlDWw6xkjaG4Y3K9g0Qlugu/1bA1pcT9ftPduLnQZUrwXm3oq1cjrNKqtOp7zdqgkJ2g1Qs64Bkgf25Es74nSek35JkkG4wNRJRKJAjZ018mzTiZa4hRkoXWuk91beHujWXT8FUBv6rrvdtQS1SgSkFhdnMGU0PKW2U2cOpNxos9GwWad9u94TZvHdjWMKR4GBhdVJ5Fh1z+28YDX3UkoAtyhmi2Sdxuo5pTegL9+bBf0hrQZ6F/Dm8zP8ESYBogrFIoEUbGpmn1bBDuwas3yBxDEixiRig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElV4uwe8Snr4gGh7bZdwHyq+HlnousUTsp4l6MOC+9w=;
 b=Z3+GH65apjrFS31L2GD515MX+nM4tZDvDHn3jW4r7efp7a4uy/QT23ZryFkyqIAviscXLRle5xW5zBgB9lptbos5iVOZ3KM5mml/j4bHgqOrco6iNaVWmK5kvFVwFpN43IiyTVhpHspjPChIaPJe93Fp/QHC2NEDCM39khvX2Yfz4lw9WI9K9A8gCjeamfgPBl+vfZKpHNBjKWX+pjXTtp2KZNtS/HAU5gXrfrW6BzTCEfR16w2ZpZqs5ifZF/IbvMFbWPD4E4idrt+vG/zI8nNI0qMKEsO+uDHwXCLfa6mXVW748hdgToptryGPwud6zBcdgcMB05UfjgENZKMJcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElV4uwe8Snr4gGh7bZdwHyq+HlnousUTsp4l6MOC+9w=;
 b=pqyL4LUjSPq/NXnzKAubLWgRvPr8UB20rwMyfkfcrItNfLe5ji6IH8HiH8Ar0tdTDbyopWj3oA91XQ9/LIZKmFBDEA5F9/0yT3QQ2MQkSUbQ4qKMVSI/z2h4DXRRwO+IYh+OPIGn9Y8YSIShyqQvuzB7CmmlIj44c7bp8sq5sPU=
Received: from BN1PR13CA0004.namprd13.prod.outlook.com (2603:10b6:408:e2::9)
 by MW6PR19MB8083.namprd19.prod.outlook.com (2603:10b6:303:24a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 15:36:21 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::91) by BN1PR13CA0004.outlook.office365.com
 (2603:10b6:408:e2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.5 via Frontend Transport; Thu,
 30 Oct 2025 15:36:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Thu, 30 Oct 2025 15:36:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DA1C1406540;
	Thu, 30 Oct 2025 15:36:18 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CC67B820257;
	Thu, 30 Oct 2025 15:36:17 +0000 (UTC)
Message-ID: <a855b919-d21a-4564-a901-fc09e68a9087@opensource.cirrus.com>
Date: Thu, 30 Oct 2025 15:36:17 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ASoC: SDCA: Add basic SDCA class driver
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
 <20250925133306.502514-4-ckeepax@opensource.cirrus.com>
 <13c14d26-29ba-4d39-b96a-b12b97935d33@linux.dev>
 <aQOEREIJ8TiwZHef@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <aQOEREIJ8TiwZHef@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|MW6PR19MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f793b43-9d75-4f1b-8a9f-08de17ca12f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0g4Ylk5YlZ5WVlVSkZRYjNYU0ZyQ3ZUdVZOem8wVUhOMldCK2dPeWpCVWdD?=
 =?utf-8?B?ZnZnZktnMklPeHplQkRjWkJFMUJ6STZBUGRYMGZqZFRwclVxSmZyeTY1a1BF?=
 =?utf-8?B?OTBFL0ZlSjVNM2owT3hOWEJ1ZmcyR0J4dFJZbkw5dlpDRmcyY1FRUWpSdnlH?=
 =?utf-8?B?d0VzNmd0ZGQ5dWVFdnVrWlZscUNDYjRhdnFLK2dCZThtNzBDSzhzTlB4RE83?=
 =?utf-8?B?WFAvN3RPTlA2ZDUwaEJ6QXBWZXRod1JWaEJub3hVNXdQMk5MT3M2QVJzYTJa?=
 =?utf-8?B?MitpaWU3RlF1NmpveTBodEFWdUVCSlJ0VTkyZW51RUhFWmRtQS91bTNpT2FT?=
 =?utf-8?B?VTE1cklVQlp4YjRtS1k3d0JVQlRNenJCRjBhYmVvSDVPVElvbzFwRDB6cmVI?=
 =?utf-8?B?NUVhMm9Na1U3cnN4bmExV2g5ZmdUMytTOFloUVAvSmRNV0hCdmsrRmZCdFpu?=
 =?utf-8?B?R2pTdmQ5SEpuaEVoM3dkalBHZEo5eWVoWVBNTmFWRW1hSWR5QXdFd252bUVG?=
 =?utf-8?B?akdKR2Y0WXd0RjhIMFRPbFRnN1ZOZm5VNWNERmJHMEtaRGg5YmVZSXhXWEtF?=
 =?utf-8?B?M2ZrK3hMTHJuS0JKNkFOSFVxMWloaFhqZnBzTlRwRkc4VFoza0g1T1YwNFg3?=
 =?utf-8?B?WlB2dnJhRDRScTVlV3FtTkU2U3ZqUVJ4QjJ4YTVzU1paWThLYUtqVDFGeXpU?=
 =?utf-8?B?N1R1Sms3Tk1LT2JDTVhZdFIxdzl1NkE1OUJCbTljR0NraGdWWmVWWm1uUnJE?=
 =?utf-8?B?OUYvdFMzcGhRdUJGbWMxUlF5dlJaZ3ZiZmYrRFEzZFpWeFVIRTg4SWRDeWVO?=
 =?utf-8?B?bGJGN01kOW1BOVNwNXRVaWlyUkRjQkxCeDJMcDR3eS9QUlR3T3pmZ1VVOWNt?=
 =?utf-8?B?T0RqeVFvNHI3QzZIYVBhc1liZlo1ODRrRVZxM0k0R1p0UFhSeGtIVEN2UWpP?=
 =?utf-8?B?K1dLdGRNMFplNm56ZDliODFhVXZHbU5jU2Ivd2ZMQU1rT0t2SkhEQm5nbEFW?=
 =?utf-8?B?cGsybk5CTXRCK1FtUGJUK3U1OFRzTmpuK0RyM2lsRWpuK3ZqY01OR0dsc1o3?=
 =?utf-8?B?RTB1bmUyVFdXOGUzV0xrejVPbWw1RnJhUHFNbnlwWmNGOFYxVnQrZHFLakRD?=
 =?utf-8?B?OFY2KzBWQWRSV0FDQ1krMGlnOHY0V0pvTE0xZGtxRWJoSFBjNHBuallQKy94?=
 =?utf-8?B?Zm0zVlMrMnBob3hxY3VicnF3N3EvRmJZSWx4ZU5WT2dQbE0zYXU1UXlkdXA5?=
 =?utf-8?B?NWJMLzNhZEpkRElnTmJuUjA2RWRpbldROUp2SENpb1Y3ZXlmVnljL2crUjVD?=
 =?utf-8?B?OTJ5dGo1UVVHcjZlbXMvb1Npb3dpZ2ZkUitjS25Wd2UwZkdFajV3djlyOEg3?=
 =?utf-8?B?WUlYSnFoOVVwcUE4KzJKYXBFMmhVa1NWOXlWbUhWT21jYk9kYkFwejVadm5s?=
 =?utf-8?B?a1c1TENYcWVmdE03NkpBRXRSazB2WFVNRGZmQ2JoaXRySTBZY0NESFJSa0dh?=
 =?utf-8?B?VDFPL3pKTSswN1I4OEZLWmdIQ0NRSVUzWWxHVFU4SGFraHJadmJEZHJLOXhr?=
 =?utf-8?B?YXhGc0ZkTjFjZ2IzNm9ENUdzUVRyc2xGdGVUZ3d5VEdLczgxc2xWaWhpUTZx?=
 =?utf-8?B?WTUwU011R1ZNa3NQOC93bVpaMGlmcGNjdXdLemhMY0orMDVwdEZQcVVRWitY?=
 =?utf-8?B?aURYOFM1TE92Q1hFWFVkMjVoTmo5R1ZtYzYrQTQzR0Naek5lZ0ZwakpBRHdF?=
 =?utf-8?B?NHk3TXZVcWErUXlUOUtqWnFpVm04ekNMb3FMb0VBaVFBWm1OaTllUzM3VkZH?=
 =?utf-8?B?c1JmaSszM2x2UnppNlczRk5vN3B5dXhENG9TYkxJNktXNDBESEJLYVVmU2VQ?=
 =?utf-8?B?OXVVcDdQdnkvMFM3ajZiQjl6S0VnTFozdU1MYTZPdjZLL2NQeTR1dkNNSUpO?=
 =?utf-8?B?ZUdxanhha0RaQ1BRak5OTjZmQjh4U3lJVnZEMTJuaE8zUWVyazVXSk8zRzgz?=
 =?utf-8?B?MUdqdTBNYlEvNzVQVytWaXJQcnRGaWpsWDE0d2hpdmZEelBNWmd2dlk2VVZt?=
 =?utf-8?B?SmI3N2dVb0tHTVR2RnpEZmRkeERnaU4vM05uYmlKMndoTFBDYkJsdnhFc2Ri?=
 =?utf-8?Q?G9/4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 15:36:20.0214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f793b43-9d75-4f1b-8a9f-08de17ca12f9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR19MB8083
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEyNyBTYWx0ZWRfX2iu52pGQTwHY
 2W1RJgW8tCvVbIR2PwprqLOvMOtprA+K3Qp74lNhmEAiurkeR+zTMqeKq9SD8kPy5NeGnI3h4zx
 sAXFsFmUb1ApB4/5t8Lo3mn7zBWPw6VhCi+Op7IPq0R5THrMa+LU0dIiNm+/lfzjyfd8nkmTd9G
 edhi+tYXQ7HXgG2xTs/TzR19Z4yhjFQoMEqgJ09bM6xbtalC8Ew/Fe+duH21nI8peuRGbkMY7D2
 2N/HukCnv4WTWOGiL1iZ5dmsUvakMRgsy1oZZ/UmSbO5/EXoE7vib+meDw1uxNvojB+QaUUZYsU
 PjF3LUAJuc73Wla3FnLbqGn3mWEQdDREHPUp9PivXfG9nj2/dEgu+E2oDdI2VRM+CQZyubj6XK9
 f6DPxl2myx6qQdJaNhi0AV+2F1y3JA==
X-Authority-Analysis: v=2.4 cv=Jtr8bc4C c=1 sm=1 tr=0 ts=690385fa cx=c_pps
 a=l/exgBlJIAx+5Sipbyuv7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=kFKhFaSvI_mDzeCmyS8A:9
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: daMpYpGz9tU7_NMHjQ9xSUZR5NmVVuDE
X-Proofpoint-ORIG-GUID: daMpYpGz9tU7_NMHjQ9xSUZR5NmVVuDE
X-Proofpoint-Spam-Reason: safe

On 30/10/2025 3:29 pm, Charles Keepax wrote:
> On Mon, Oct 27, 2025 at 04:02:54PM +0100, Pierre-Louis Bossart wrote:

SNIP

>>> +	pm_runtime_set_autosuspend_delay(dev, 250);
>>> +	pm_runtime_use_autosuspend(dev);
>>> +	pm_runtime_set_active(dev);
>>> +	pm_runtime_get_noresume(dev);
>>
>> This seems odd, I don't recall that we do something similar in existing codec drivers.
>> It'd be worth explaining the whole pm_runtime flow.
> 
> I suspect that means those codec drivers are broken :-) at least
> if they actively use pm_runtime. The first two enable
> autosuspend, that is suspending the device after a short period
> of inactivity. set_active tells the PM runtime the device is
> already powered up, as it is. Finally, get_noresume takes a
> reference, this will stop it powering down immediately once the
> pm_runtime is enabled, it will waiting until we put the reference
> we are holding.
> 
Other drivers definitely do that.
For example:
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/codecs/rt722-sdca.c#n1544

(the other rt drivers are similar)
