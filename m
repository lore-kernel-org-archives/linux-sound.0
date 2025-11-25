Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48119226CF9;
	Tue, 25 Nov 2025 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764077885; cv=fail; b=hRYIupIlReP+xUyhUV/ttuhYy2hW1NP/6FN6zV/Ms21MjlH41UkymiPL4Ae2SK/6z6Yq+MtHGjJ5Wm3LDIp5LWW9qj5bKyyBg7dK5Onm4Keln5tgrhNUP6BPXRZNoRdWgTkmTIZ5r3rFWVYkSOMDvaAB+pLUnRRPeS/CrRJ+ma0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764077885; c=relaxed/simple;
	bh=+A/1j6DcmnGy+5Vg4VLhp9kbbcyEcsGn403/WM6G+cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M+b7oW29v7uO435ZAeWTkyiLP4LdVnYG0BJ9gIEHtE7T9sSC/h9kpb7yO/EGsHevoO8UgsrhuRvpBAOIerBjPyhdj+qUBKCjBs1rFtlFkWUzoJ3Dwcs5fSoJPmwREHgBW35l6rq2Ah2Uus300lde3U9UDM9b2kptK1dpo2CcQ3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=jpodot1l; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="jpodot1l"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APDTGPe873970;
	Tue, 25 Nov 2025 14:37:52 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4amuk4bned-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 14:37:52 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgCAwyDvUbq9f2zvcVDoZTUt6BjLlWAxbUbP2V4WHeZtLfNsaB80DdVDYD9PrxO7ovF2LDSwnYslAtcFU6zGURvvc1ptfnmj3orVh+XVc1sVhFrxhyGn2r768jFzZ7hlU+kyU5dEayUDQcZz2etTEiN2ZLVvFowFJgqM7FzZszIE6uhDX5+QdQPVvsqgqfD//Te/uVsB9/FRk0M+payRIbjX52PQEYOmf3yrZT1gz43PZfStwpqGSsq9IpAAD/9akSkN9se2ZD/begNZyocSuHNTmHsDtVwy82P7z7FFJFkA+Woqy1/MCBWKKNuXT3qTx916itkeXPmKhZMbVwNnUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrAe+/K1QzFshF/D11nH50LcSnOCw/6U+JEIoAjBH9Q=;
 b=MFjNyMtaa5t0o+pfNKyuh2KuXZbNaALXKDc96KqZKZhWFUG0MrlB+oC/YAObaDHr0FPQAeeWWAPE3ahkjeIKmE4iRqh8Ba7lfSYY4Zj1DHHayI3zGwrtLmAkuETi75vBmntt2xa+jN6cs5q7MsVY4F7Rv3nKI3x1XmlII67IhVBTA0CGjgspgzeuE7/lPmDAC8OeMjH+bs1BCsQHlqgFIWfIPf6kJrqKKLBpm4m5jXeA22khW88mPWmbldeqTPl3iygeFGlZ/ffMoVrcnNmYzd8tzmjStn94SMSJ5TMA7fMfHumbWkkE8Zb0kfe6d1tDMb6T8QicUAOu0P7yAUWYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrAe+/K1QzFshF/D11nH50LcSnOCw/6U+JEIoAjBH9Q=;
 b=jpodot1lxlC48dHlJrMbl0/Y7lLRTgyEwg8xXUM8oWH8qKHPt9rWYuQCtkkI9p03s+pnFLHCDxlYnPof1TphTSwZAu5aY1YMJ9zuTYKvzLBerWc0LX6JRyoz+SAZg/vbMFZsQODosgRSFbv7a0IO6mhEhHdqyQ6X7lyY9mi2G8S8drs8WpIdlOng2zoEW4U5eAH4NCExbKvriHAOrwrf4OUicBwP2CJ4At7gX5ADO4dsuQ3QjW2YTURD1ioRZuwVRI49mfldG6Fdyju/SiXm1TmmcOINEXhHt5Kr30phFaeMIPw+r9Ka7osFlKRz9XISqXo9OMV23g1wUhJ+ol9oHQ==
Received: from AM0PR02CA0146.eurprd02.prod.outlook.com (2603:10a6:20b:28d::13)
 by PA4PR10MB5514.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:26f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 13:37:47 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::14) by AM0PR02CA0146.outlook.office365.com
 (2603:10a6:20b:28d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Tue,
 25 Nov 2025 13:37:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 13:37:47 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 25 Nov
 2025 14:38:15 +0100
Received: from [10.252.13.178] (10.252.13.178) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 25 Nov
 2025 14:37:45 +0100
Message-ID: <3e0ef715-f34e-40b3-b1d8-21160c87fba4@foss.st.com>
Date: Tue, 25 Nov 2025 14:37:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: stm32: sai: clean up probe error path
To: Johan Hovold <johan@kernel.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251124104908.15754-1-johan@kernel.org>
 <20251124104908.15754-5-johan@kernel.org>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20251124104908.15754-5-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AC:EE_|PA4PR10MB5514:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae0f1e9-8265-4385-773e-08de2c27d209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qnlrb1o3MjFGdjR5TjExWXQwVEhMS3NzcEgrZnc0ZjF4RHIyeWc1OEhBT1pT?=
 =?utf-8?B?bjZZRllXdHRHZy9YSDZLOG1PSWczMVFUSWJzdWQrTUZONkNGYmJjOVJDZ0Rt?=
 =?utf-8?B?NFlyZFZwU3c3STJHWkZzREl6Y3BPUFdZUExscUlCMXNCZHJiYjlsNkYrUXdy?=
 =?utf-8?B?Z25Xb053Q1VXVm92UEhMeGdNNXpxL3RGQmo4eTFyL1lLc2lZMGp4ZzB5OFNv?=
 =?utf-8?B?OGpRbit2K3orOVBNNC9hdXM3eEh0SzFoblZ5M3dNVHUrRisrTHJvRkM0Vkxm?=
 =?utf-8?B?VDV5UTZpRE0yalRoSktQeXJodDFLY2U3WExzcTdnbU9DSlc4elpSRzRNaEg4?=
 =?utf-8?B?Q2FYUk9yTXhwbzJxTzVLbHpvVWJ6ZkdVa3JrVlhRNUtjTSthbkRkeEFjTzhW?=
 =?utf-8?B?ZkorTVVPUitmbk1rZllqc0p5R1BsTU1TbjNjR0dlc01oam4vYkhNYjllMXpu?=
 =?utf-8?B?aWpBRmZkYzBjN2trVms5SCtMNnlmMTU2SDZ4Uk0zSFIxbmdoWnc2ZE9HZkFC?=
 =?utf-8?B?K3JYTTJMY0RZRG9tT2RiUVBuSjBJMVhvWFVOTUNCOU5IT2pIREowTDJTb3Jl?=
 =?utf-8?B?ZlN5SXhlM3ZnYmhCSEV1ekRHTFRuODN6ODFGdGxqOUxxTWp6TjYyQ0psckRk?=
 =?utf-8?B?blhCRUd1bTZnUm1IZUIrdVdoNnQxNEtKRjlrdzlqdTNEckpXMnhyY1NmUk5E?=
 =?utf-8?B?SXNPUWFIb28yOEYwV3p2T2NWSG1DNFVCMlZKL3hmK2x5SS93NGFHUXRWRGdi?=
 =?utf-8?B?SS94ZmhMcTJMNmpIQzlWbFNNZkhXbEd1NU4wK2xPb1RDR0psa29IamhNK3A2?=
 =?utf-8?B?eUVlbmR5NXhNQkdyWEJWaVVXSFVHY1l1amd4QjFVR0tRRW9SejRmK3E3S21D?=
 =?utf-8?B?UFhFN3pEUUdYeHB4aXhhR0tXQ2lnQk5yVGRGN0ZYSHNFMFJrRXAwMEhuU20y?=
 =?utf-8?B?d1lZV2hkQzA0VWZWaHNEc1J6TGFsTHhNcmpoTjFtOENZbkJtNytKbjVhbW5m?=
 =?utf-8?B?K1JVVzd5bVRWWUF6bExOVEZ5WXRNRnpjSXVPN3d0blBTVWtPdDNqQzJqOTI3?=
 =?utf-8?B?V2FCNEprM3d5ZXhHM2pVSWVTKzZaUVExb1EwR0I5MzF3bXBQS2tZOXZONTU5?=
 =?utf-8?B?eHkvUG8zaVdlb0lXQTd1OWduRzNzbEtxNi9KaUFleTlXWUd1TTl3dTV1S0VO?=
 =?utf-8?B?a3pwdHJwNE95RVVid2lqK05UV1o0TzFDVXN0cmhnc0lYNWl0MnFjalNBUjJW?=
 =?utf-8?B?QmJDY1E3SzR4b3E0UTRIZzdHZzJ1N01vQzZmZHRrUjJOcE9uUnRHWG9UVHQ1?=
 =?utf-8?B?NGlhdUNvbWQyUWMwM1BYNytqa2oyMDNyakVscHRZYkhBOFh5TEUxdFZjWWk1?=
 =?utf-8?B?M1AyRWFJMzNraFdhakR4UUMyWTBSUEFBaVA3VGpSM3oxcFNwbkRXV2ZVcy9V?=
 =?utf-8?B?WFhFdEJETEE4UGNiUXN2d0pMQ2lMR2FTaUEyU3BuWjAvQjFrUFcwbmkwMkxm?=
 =?utf-8?B?dit4Z0Fka01TdEFKUFpua1pZK2VyMEQxTjI4WTd4REdxejllRHVzMDVXRG1S?=
 =?utf-8?B?VnNJZkFvNHJCRE1aeGNxNk5KdTBGUzF2bkFjNVF0UVJFSTREdGJVUVVleHdC?=
 =?utf-8?B?Nis3anU0U3dtNUt2T1k5M0FBZFhPQXZiQkQvYkUwcy94Z2dIWmhkNEtFM1J6?=
 =?utf-8?B?MkR6SUg0N1Yya2g4NnBGby9uN2xwVzNPVmhkREtzTFlKOEI2WkhNNDZ2Mjdy?=
 =?utf-8?B?MEF6UXhGYm9yMUNtcVFXTC9kSkJScVpwUkFUMCs1Z1ZEVEN0RzdYbWQ2Q2VW?=
 =?utf-8?B?WVJSRG9KVFBSb1dIcEEzZW1JNWFvZklBQVJLblVqQkUzVk1rclVmOEphd0dG?=
 =?utf-8?B?QUJXVkwrcDE2NmVqOVVhRDJDamxpVWVJZG5rWDJJdDdRalNCVlVWRU01RzJ1?=
 =?utf-8?B?cVFXUFpNN0ticitFNnBJOTVGQmJLT1dSMUJjSXlYVVZKamRoeERCQiszamh6?=
 =?utf-8?B?Q0ZLcjFqUnAzVTdWWUo1NktnczJoY2p1S1Z3TnhJYTl4RndkZ0lrNnl3a1o3?=
 =?utf-8?B?ODlZNGNwWFV0bjJwL3V4R2R2VEVGNUt4NDIySmpQQkY2dEd3UjlCdkNsZXcx?=
 =?utf-8?Q?zvZc=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 13:37:47.1563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae0f1e9-8265-4385-773e-08de2c27d209
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5514
X-Authority-Analysis: v=2.4 cv=bZtmkePB c=1 sm=1 tr=0 ts=6925b130 cx=c_pps
 a=Zew14hMkDILfZ4t8ZSHigg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=YK2f4aGzhgIA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=xGZY96ZXyt-gTWyj-9AA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: WC5a3YSR8hUAQ46gfh7mVkt0MZZrcGva
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDExMyBTYWx0ZWRfX9zJj5TurZAoO
 DWgMI77yhj8VgJc5I7V2/CSOPSM1/f/eq1LOZRm+M5BV6GtvhVPepgtSIV9HOr1VDZ5BE6YWpwF
 ZxTZTKUBPQ0995qV+xdLX+gSoT4Qxtyi2olVnuhl5sQz35D3B5KAQW5dngsdRpKlM/sZOQOYcRE
 Ojh0U2JxTu2AwDcFdijwH7TND1PrGV9oaAcz2cBMkM7DtuusI7SNiZ9gz0U8Q+iIwdS1ZrPLxu5
 WGoUSTvR+grh4puIPe9MjoWFM2HwvSoUkj3dwpRRlCYwJAMLQJsFfxybxv62A1le/asSP75zmq8
 C+/LiXnTaQBRBkhxTfhmw2rW8KoYvuv1vZi1c+a1QN84DpLwZAtgTswFUAlgRqv/JnusUCTiiJI
 w9WMJsEadNo5L7ZX1lDvna5pYpjKPg==
X-Proofpoint-ORIG-GUID: WC5a3YSR8hUAQ46gfh7mVkt0MZZrcGva
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250113



On 11/24/25 11:49, Johan Hovold wrote:
> Use an error label for deregistering also the PCM DMA for consistency.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: olivier moysan <olivier.moysan@foss.st.com>

Olivier

> ---
>   sound/soc/stm/stm32_sai_sub.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
> index 5ae4d2577f28..450e1585edee 100644
> --- a/sound/soc/stm/stm32_sai_sub.c
> +++ b/sound/soc/stm/stm32_sai_sub.c
> @@ -1716,15 +1716,15 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
>   
>   	ret = snd_soc_register_component(&pdev->dev, &stm32_component,
>   					 &sai->cpu_dai_drv, 1);
> -	if (ret) {
> -		snd_dmaengine_pcm_unregister(&pdev->dev);
> -		goto err_unprepare_pclk;
> -	}
> +	if (ret)
> +		goto err_deregister_pcm_dma;
>   
>   	pm_runtime_enable(&pdev->dev);
>   
>   	return 0;
>   
> +err_deregister_pcm_dma:
> +	snd_dmaengine_pcm_unregister(&pdev->dev);
>   err_unprepare_pclk:
>   	clk_unprepare(sai->pdata->pclk);
>   	of_node_put(sai->np_sync_provider);
