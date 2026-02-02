Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010041.outbound.protection.outlook.com [52.101.85.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D446E3148CD;
	Mon,  2 Feb 2026 21:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770068856; cv=fail; b=VclEZNfRPbs0CkMaNzPfmrOPMmAYYEPHoh8vJf82ycBdmiSut2yalIZQA6jGLkG4SbveDV9tR1F9d9Wo0zDAX84jYZO4X5k9J7KFe7l1Je6+o0ESpDYAzwivf8MFcDpqL0p5vA2Bt0WYSPUIvTZynp0WzIM7IYU9pToZO/rRRHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770068856; c=relaxed/simple;
	bh=IJuj6x4tOw5HmEdD+0w+kTEA8EAb+41WtcbZux5WS00=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fRnW0fTKCUhUHGOvOSvY4MrrHJDmGhs1jY+hcFQBOzsJr6nb1pvCuBQYFCVXc+92geyor/HnyyWktbIwagbej5ppszDoy4jmzGLWezIYPLESIxkDf+hiawv5vt33cY8kGjN0PSNF/4Igl4fGVvv6JHY/bF1ovzB0B3EnTax8Jb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dhMe5vx+; arc=fail smtp.client-ip=52.101.85.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dhMe5vx+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rw+52CPuvdARxwflCV2x7RzenszAdqEFVWlMVzfvvg+J+Cr8WvWNf6Bka93H/5ILYkALMWXXRGsX3bGQnHJ5W10QLb+0eqzR9GXpXwfHbZzXwR+DpWezOidUA/lv4R5RwqA3igyWpdNiIjEypkhfOY0gJBhnCAYs6SGpDBcUPVb/4RfI8NmtZdZzvIEvoXXR1oYbuXMgEU2E3M/KdBtWAtgOfPI4Qpe7MPktvW93og28+Gr2WjSj8OoFlCX5jX23m/wZ124NmYYLsdS59gkaPKHJtTJ2qtfG7+nVnMf//HaP0tPMAUL8oKAWoZLFPJdOQpMOsLphOQhm8b1/JBMjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiQSMvH44EYdHdpYHjGfcnECr8jVh6ANp3CWpfZmIGU=;
 b=BggXJ32Qc3Hgxn6pFT2TAfDkjmczQZ8mcM6zAQ7LDfjw2TmiouJ75pchw1Z8DRqSw+pbJ5tTjfnHwyf1R2Xsju6Y1tXa0BkNSF4BXkgGZGrcK+qx1zE2OO2zBfnOTrHCt0+TpfStPAq+KCsz72Qdd02FsGYPZJzopWFT3ogDJyR92xMMRmjHK9ZUQ2T5IOFA6xIyCj6xKhoZif0r6p2zHif04+FqoNY9biQqq2rsW4A/QaoFjcYNk50ZDpei1fUP4capH3IMkFMNAlR5cPGevo53g+Rz1+N6apNF9bHbfl5QR+ae41ppSwzeQ5mwxa9iM9RRwWLX7YnD2/lHnNw70g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiQSMvH44EYdHdpYHjGfcnECr8jVh6ANp3CWpfZmIGU=;
 b=dhMe5vx+tTYs1t92lje0gRmJfD8UCVoh9QlfmjYjD2w2byU7BePzaEp9HX7fWqQEbIn3SE8t5sF1OEDFAZ0DcWwDl2Ebo887lki0nScz4YzD60Eb0519t/Bx9SOWsqJTZd4yG6qScdVOFi8126lwGffpK7dzSJz7V04Ns/Pl/sI=
Received: from DS7P220CA0072.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::16) by
 CYYPR10MB7649.namprd10.prod.outlook.com (2603:10b6:930:c7::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 21:47:32 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:8:224:cafe::af) by DS7P220CA0072.outlook.office365.com
 (2603:10b6:8:224::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 21:47:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 21:47:30 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 15:47:30 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 15:47:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 15:47:29 -0600
Received: from [128.247.81.0] (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 612LlTTK2842411;
	Mon, 2 Feb 2026 15:47:29 -0600
Message-ID: <392a3042-7916-4bf4-a819-69ba955a0b32@ti.com>
Date: Mon, 2 Feb 2026 15:47:29 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: ti: davinci-mcasp: Add asynchronous mode
 support
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
	<broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260130051045.1898892-1-sen@ti.com>
 <20260130051045.1898892-5-sen@ti.com>
 <d7ed59c4-2262-4cd5-978f-e9e5c0e8a9a9@gmail.com>
Content-Language: en-US
From: Sen Wang <sen@ti.com>
In-Reply-To: <d7ed59c4-2262-4cd5-978f-e9e5c0e8a9a9@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|CYYPR10MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: d11d2623-152b-43da-6f66-08de62a4aa6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmJvTmtFdTFYZnVhazBvKy9BbExhM3JjUzBzS0xFTHd1bFZpcnMvSUhrdEY5?=
 =?utf-8?B?WHVCKzVoVE55RDN5SXRNUk5IVGVFVnpZZTZFUHQ3VWR5aG81eTR5VG1sVUdS?=
 =?utf-8?B?TW15VEFHYjd2TnhqbkFRU0s3aWdVdXJYUi92cHl0TS93MjR4UHRFejh0MkxZ?=
 =?utf-8?B?T2lBa3Y3ZzI4VXFnQmRjdk9EdG10SzI5S1I2a2xYTzAwWHlCWTJCdjhlWlhB?=
 =?utf-8?B?TXZ1R3pLSkhiNUphQ093dzZNY3BXLzE2L2s3dGRtaHppcVVDK1I1NmdZY2c2?=
 =?utf-8?B?UzRHM0JCY0prSDVKeXNPWDlORExwaG5qeXpKdS9XeklXd2lxSm5lUDYzM0ox?=
 =?utf-8?B?QTk0Z1lpOGpCVDBBQmpER1VaZG1iTUZqdkhrcjJzWklmRU5xbWxvVjJsTU5E?=
 =?utf-8?B?b25XQm05YXVOWWV5VldnK3NqL1FJMXdUSFJUZTh5VVFERU1qOU4zUVBNYUNT?=
 =?utf-8?B?VStlYVIyYzBPQVR3VUQyRER2VUs3RUNldVkvZDRBOEZISEtYZGJ0WjdNZHZR?=
 =?utf-8?B?eHhYM2VhcmRGWis0VnBxOFNoT3pQSVRiNG5UaWVXd2s1QmhhT2lZUnF0a3g3?=
 =?utf-8?B?YnhtVHd1YUY2Y3JtUktjeWlxaHYyblB1WUtSbGlHZnNwRVkxSjJ6S2FGNUov?=
 =?utf-8?B?Z3JGb2ZuOUhTd3VrOEVUNWVuTitNd2NEMG1TYUowUEtodXgzS0dSTk0rTFBl?=
 =?utf-8?B?bkR5N3BlZXVUdnNwZGJSTGVtNDhPdUNuY1U2R1ZsZEJPWHM3RWlLdFE4ZXlk?=
 =?utf-8?B?OWtjdlhHZVdsWjBFaTk3OVlsK2ZVZmJzb2pwbm56aFVlWVlpN2RoNXpQWEVO?=
 =?utf-8?B?dkwxU0hsNENpYUJtN2E5WXlVTGl6Z1M1NDBkM2hPTEpDY2FxK04xcURrc2tC?=
 =?utf-8?B?c24ybjVnSzljdzA5ZVhVY3RvTmo2OW9wMVQwc1pFeG41ZkczSmpXdVZNajMx?=
 =?utf-8?B?WFpaeWp0aUZ1bkRZMDhuNmk5WGJjdklZbXdWcEVEdXhacnRZTWR0Wk1wSTJO?=
 =?utf-8?B?MVFYbSsxR2NObGVDOWVza1VSdzUyMVZpY2VKeXU1OGg5K3NZM3lIMVF0VGV3?=
 =?utf-8?B?QzVzMk9DZjJVRG01dm43WjhUQ2EzVDA5cTZ4NnEwWXVyL01zclBXU3gweWhq?=
 =?utf-8?B?R1lYUnN1VjYwanAvOWxsUDJuZkVNejVSTHRtcGY5ME1UczVFNE5LUWtnSTVL?=
 =?utf-8?B?WmlJdk9rWTUySFI1YlRidlNLbmJqYXBkYlg2VW1ub0hFT3kzN29OejI1ekJh?=
 =?utf-8?B?Q0N5QUU1VWc0ZWh2TXB3UzAvY0hoMnlQeGhXa01EWG05NjR2Y0pONnVoaytj?=
 =?utf-8?B?aHRmWWIxSlJMNFI1eU0xS3ArcGNvTTZuTVI5cFE5cEtoOWcybGQ0YXlSb0t4?=
 =?utf-8?B?TUJjN0pQUDJBUlM0ejh0cFBrQ2g5ZFozbndPN2VPc3dORnVDY0UyZkt5bkhH?=
 =?utf-8?B?MmRERE9zcEduMFdDWURKY21WOWxIdXJ1bitmeUZsRk92MGtwZ0hPTFNzUk91?=
 =?utf-8?B?Y3Y2QjlLUG1Jelk5Q2toWFZBVDBBUHJjK0V3V2FRVlh1OE02UkNSUDBOOE5u?=
 =?utf-8?B?endwdXZDUEpPR213MGRUeFFnUDEyVXRnMTZyQzMrcVRrMVBpY2N5R2JFMytZ?=
 =?utf-8?B?KzdycVFBVnhTTklXUkFtUHczbVhNczA0TklkeWovTjZ3UzNFMXMrTHdCeXVQ?=
 =?utf-8?B?Wm1zTnRFYW9xV0I2aE4wYXNXblhvVVpXYXdXWTVHdThuYUh1aVIwYUlWN3R5?=
 =?utf-8?B?bU5jTHphWU8vbVZKYkExWWpxSHB5Mk4zcDloQktQd3V5NE53OFY0VlNrYUt5?=
 =?utf-8?B?WlBPSWpTaVd5UUJOcXNCZ2ZobDRCaGdsWTB5a2c2Uys3aE1CMU5kckVtdVlp?=
 =?utf-8?B?TzFWU0tXWXphY2RHdUlXT1VmRnRsc3czTXNQTVVmLzNEVzk2akVrQXVqdlA2?=
 =?utf-8?B?Y2VXMGlVQTJsT3BGa2ZjcTI5VTA0N2s4S0IvYzlXc1FoNm1GTHl1OTdZVG5M?=
 =?utf-8?B?QndGNHFLWStMQzc4N0RQOGV3dHI2aXFoM2F5QXl0U3lwWDI0OEgweDl5R1Zm?=
 =?utf-8?B?MUdNZ21NSHJKWVNKait5M01mNktHTW85bWxvU043TGs0RzJGRHMvcXRHMEJx?=
 =?utf-8?B?TU5tYm8yVXFYeG81RzhoQ2dCMHAvdkFmcWtlcFVxU0VWekR2eGdyUmZoSmZD?=
 =?utf-8?Q?xXtDh6YIRBrMsSP2jKb8PAxNrbHV3JA7H9OUmEQNW/V/?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7ra4Zxn+tIUCIf4AbKmNIsYfBBvxPu7h0pCf8rZ4yPJpPk2QXCB2WjHLasdnKUHgl1sKoUAz0YbPOzknEElclTcQMAbJgzRbPSvxoD4EivKPQ1aneDtkH/qjQ7gSROCPNvg32ej9gdCRSLrbNmORJwTkGYoxgNICyJL4eIBkls3r3/QuSJG4JaNB8vU9yk3VZ0Vn5iT2CsnOQ6uvTVfAetNDdgCwp+lytqsZsXJNuqVX+kLlQB4O+bn+/3MzbDVP4MBoW3b/2+tpCm50usU+CL4GTYAKH9Jo/Lp/DwkoXBuYsawhEDLlXg5fckKduG2MCAb16qKqGjHbsJzVMykE5cbp8hrU5vjvE5/m0dhsBnLxhtjKMyZl4azrOEpF26kWLV9J9X6a+eu47iXBU0NtEYugMHvpMT17FwvcNbDVmb6VqMj/wWhVbcbAzMfkfrJO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 21:47:30.5630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d11d2623-152b-43da-6f66-08de62a4aa6c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7649

On 2/2/26 11:02, Péter Ujfalusi wrote:
> 
> 
> On 30/01/2026 07:10, Sen Wang wrote:
>> McASP has dedicated clock & frame sync registers for both transmit
>> and receive. Currently McASP driver only supports synchronous behavior and
>> couples both TX & RX settings.
>>
>> Add logic that enables asynchronous mode via ti,async-mode property. In
>> async mode, playback & record can be done simultaneously with different
>> audio configurations (tdm slots, tdm width, audio bit depth).
>>
>> Note the ability to have different tx/rx DSP formats (i2s, dsp_a, etc.),
>> while possible in hardware, remains to be a gap as it require changes
>> to the corresponding machine driver interface.
>>
>> Existing IIS (sync mode) and DIT mode logic remains mostly unchanged.
>> Exceptions are IIS mode logic that previously assumed sync mode, which has
>> now been made aware of the distinction. And shared logic across all modes
>> also now checks for McASP tx/rx-specific driver attributes. Those
>> attributes have been populated according to the original extent, ensuring
>> no divergence in functionality.
>>
>> Constraints no longer applicable for async mode are skipped.
>> Clock selection options have also been added to include rx/tx-only clk_ids,
>> exposing independent configuration via the machine driver as well.
>>
>> Note that asynchronous mode is not applicable for McASP in DIT mode,
>> which is a transmitter-only mode to interface w/ self-clocking formats.
>>
>> Signed-off-by: Sen Wang <sen@ti.com>
>> ---
>>   include/linux/platform_data/davinci_asp.h |   3 +-
>>   sound/soc/ti/davinci-mcasp.c              | 487 +++++++++++++++++-----
>>   sound/soc/ti/davinci-mcasp.h              |  10 +
>>   3 files changed, 398 insertions(+), 102 deletions(-)
>>
>> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
>>
> 
>    static void mcasp_start_rx(struct davinci_mcasp *mcasp)
>>   {
>>   	if (mcasp->rxnumevt) {	/* enable FIFO */
>> @@ -230,13 +288,17 @@ static void mcasp_start_rx(struct davinci_mcasp *mcasp)
>>   	/*
>>   	 * When ASYNC == 0 the transmit and receive sections operate
>>   	 * synchronously from the transmit clock and frame sync. We need to make
>> -	 * sure that the TX signlas are enabled when starting reception.
>> +	 * sure that the TX signals are enabled when starting reception.
>> +	 * Else set pin to be output when McASP is the master
> 
> In new code - while it might not match with old code - use producer
> instead of master.
> 
> Otherwise it looks nice, I trust you have tested the sync and DIT mode.
> 
> With this nitpick addressed:
> Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> 

Hi Péter, thanks for your review

I'll use inclusive terminology (producer) instead.

I've functionally tested IIS sync mode. For DIT mode, since I don't have 
hardware available, I've only done a register dump in comparison, during
idle, playback & shutdown - all registers in effect stay unchanged.

Will post a V2 shortly with all the corrections.

Best,
Sen Wang
