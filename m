Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B0040DFDE;
	Tue, 30 Jun 2026 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823889; cv=fail; b=rJ/+9Sho5GH2ZufI5Rznc1zcwNnk5PVzu3a62xaunfB9NdKMi8i0qFt1UizvjS5lJQ3xVSOUZsW6MAWl/AOVXC+dNkU4o5P9/hrnuCFIg48u5EM53waEnkamn/irusBEOeRN9dnffeu7XVju5NQSq6I+PcMBh49OeJlHMB8xPL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823889; c=relaxed/simple;
	bh=oIFKLT1MXn7nzUthMqMOPxDb8RI6XPa3AWfbjYMdfLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p4e/DTZBv2b7mx17DPqv8wHUBRRL1pb8xaWgZjfuI6fWTThsp4WxwlhaA+cKdsjyvuAyFgc1Bmm5ylhZCMlJh71RziiilrZkAwmOfKHURhzb2PCPmZhEX0DlQIzyLzdkBKDhQGO4Kld018s6us9K3YL8czIScun6imc9yCtXoZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HgIJ9nk3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Vy8GU+EK; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HgIJ9nk3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Vy8GU+EK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UColSm3957562;
	Tue, 30 Jun 2026 07:51:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=srB/0XGUIyAFYBvlXXVwc9vhmaCAtyHHYWWUm4wkVlM=; b=
	HgIJ9nk34gICgw/TrXT1HSy2wV8AulSJM6+l6prstHLuujo5pCxXxKTFESv8c56c
	ARzNfuMBCYXdWgJAurHPbpBcLG/dlUMaBc1SYM6law7kx7pY81M9+14wzH8iUnzp
	LOxSUOWIawtxsgodyICm7EBjY86S6zDWX7DRLEkGy/xrHUrun7z8NAo6Y4tpxOzT
	jua0Qwr6w4S0gJGmsn5qUE+8e2CAwFNwBmvj3rhtw5682z04+HaLciAHGFxeWm3x
	Fi5qOpqwL/vqh6JE8BBlDK0YJw+rIAWWvF15rCLNROTvoFrt4r8ZbTKhGRiQLly8
	LU5UYSZECxLL0VroRnjZ4g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020114.outbound.protection.outlook.com [40.93.198.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f4e5r0012-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 07:51:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGX0gBXEkyBTGmLB3QtN/9+hjbd73UTD0GE23xL6qrf9c/lCPEMFO8gDKXq0xjMALbuxQo/VxFhFFhUlkh/qsJM/b8G1NmpAYFiZlt5vQPUZ+vbK7SugwOG/hKdAYf9xYbDTOIZvWWVHzeKul6JtGAIGXFbQ0wF8lS+l7i5I4h2BT9ELD3V0nRFV/HBLv7ZvZmIfGOHeADsdRsCMUZ8WKuBbJiuAfCdNWuxjk2ZfyToUMHdXAQhuAciD6w5ocxgysGltYdKky6zLiV/CvaUAXSJbzXV7hx+USmXvtmR/Ebddjx2MLgGE9pwYVNVTLalFpZRNZ8zoTKUySh6wPKk8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srB/0XGUIyAFYBvlXXVwc9vhmaCAtyHHYWWUm4wkVlM=;
 b=JwbwbQ3uTrzJUG+UNcpsHt629pi49Ep0qZLEzH7RVa2LwFVaSv+2sHKVeXaJYErW0H4BBHWZ8nxLEHWj9J9qfaAS0Ys63I4OMr018k6d1Vzr4gsSlCA+eZgZ0GwImiPo6Hh1sVyctWAW92v14+uF8ifi4zQcoq76XBiDlAK6oYL+DBWvkKOLMRQ24WUM6sI3UNUJPgxcucilGctNDSyiog4Mp67zAQlNq41TwesE1Q5N5MXXx6uitB/1bwa2Wu6CVggpxa1sWNWpsJnmixdknMN/5nr+c/lUNRI433cDFB52NopiUYUOaIiGimHkFrWuqMwYo7BagUuZgwwBlUVnfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srB/0XGUIyAFYBvlXXVwc9vhmaCAtyHHYWWUm4wkVlM=;
 b=Vy8GU+EKQOlgiyDe1OngPyvTxc8yYWK+sgy68u8HCGvenJeQ2COcVDrbH/OLs4W0Ol+KLYzAVycboAXcChT57B3W8ZvrnI20kO2vm9my+hzylWCLB1hyUK7r5m4jZqRDYMof4XHsuDY+CDRYuE0Ogi97BMht+FFviB/ZghezhFg=
Received: from PH8PR07CA0014.namprd07.prod.outlook.com (2603:10b6:510:2cd::25)
 by IA3PR19MB8764.namprd19.prod.outlook.com (2603:10b6:208:50d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:50:12 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::71) by PH8PR07CA0014.outlook.office365.com
 (2603:10b6:510:2cd::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 12:50:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Tue, 30 Jun 2026 12:50:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1DC5B406541;
	Tue, 30 Jun 2026 12:50:10 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0C76A82025A;
	Tue, 30 Jun 2026 12:50:10 +0000 (UTC)
Message-ID: <e326c51a-4690-44c4-bf3d-0870591b1eed@opensource.cirrus.com>
Date: Tue, 30 Jun 2026 13:50:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        "Liao, Bard" <bard.liao@intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>
Cc: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
        Richard Fitzgerald <Richard.Fitzgerald@cirrus.com>
References: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
 <20260629144450.2096823-3-yung-chuan.liao@linux.intel.com>
 <11f8d158-9ddc-46fc-9cd5-11a696d3413f@linux.dev>
 <SJ2PR11MB842410EE22537B0673173EECFFF72@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <520f67ca-941b-4e08-8985-03f0e09b0313@opensource.cirrus.com>
 <46af3cdf-d704-4cd2-bb24-cbe9fb1303db@linux.dev>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <46af3cdf-d704-4cd2-bb24-cbe9fb1303db@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|IA3PR19MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 19194be4-b98a-4879-800c-08ded6a61f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|61400799027|18002099003|16102099003|22082099003|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	b9byqx9/Q/TWI0P2xRArtkDV/dn4iEBuiOPpJ1fwJRD3yQYiZUQ8G2FeB0pytalLZbdAWQZ1wgdMFzjE+PqLAse3nCiaGOquCZvdw6Tw/ftnCkeUauLskRiLRkZkD4JbvED0rSVq5hJmaHtpSRDP7bDRT1DcuetPpf8IE8uSGMyupfhffF+R+/VOq68+YCFWYTJSfGSM7vOGPBnMmGYG2N89ZqfIdiiiE0Zodte10r3FhR2JUuAkOVYldO2lDts+hN/EHxQagzp3h5RrNxeWmAHVD7eaTJaJDXntjwniRIsit43E+BH/v3tCnDqif3NtKKftjgX3SNbn0d3yCKzLlXlpkvnCOrwZRucQzgrK975gxjMTA6bfHBPvgYuyoQOKDjLhAONCDx2R2zHOEU/INtQnL1DfgNJ3H31xH+8sVR+IT3POAG7O8azQiObvCm9afcTmiMTFu2aq6zwfE0ehQnvJTQ/OvaVKvEzFa42Sh9qT88Fh1aGyTz9r1zTF46lro4i33SHc/dfOFHsZQyMbt3PjUQoe4bEmNg8VIy27sGvyZWkOOU4KPPGZFp7rjFml/FHAm7CmFZz+GL7Jzsr553h4CtPG0gA1o6+GC1wAeVusV5eJ+M94/dzV/wFGfgH3wtm+sQ7t1wYvyxpSMzJfcE5FBF7CJ7rTENNpoUZFJcY0uA86F31CfiYT4Hvza/s/Vyo1Y610SlC5Zp/2Ev0Afw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(61400799027)(18002099003)(16102099003)(22082099003)(4143699003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WBP1IgOaZE3GC0TSKrghRhVktXekeEMrq6CXj+H84mDMjfDTUnx+LrLgt0zlxxCQ4sGIWxjcI4OKJMj/I7oMsi4hrVGeE36sEpnr2F265iLjlGyIlrzq0dFxk0zlEDgqdBz0FbdC6p80cEaw3ZyyCyz1j5/RpVPMHurEF4h5HYfHgkslwscF0Mc7BUU9tAqNQJXkKJPyMksZuTIY0TFy1vXMWM9nIBndOCpGS5P35UEnVXoqAqY459d0+IAXEr5L05s0xym18jckP5fZFpwTTQvQuv/pxh0KZc+cMwd0B+FcTkXyfLf+fJefvmZ/TlDGa0kvd5jNurQ/R6yPCEuWDr0gvBuyff667U5vRsFIYX+6vC1XS1MXAv2oXkPqOlk1x/XXgLC3sQCAED4YOKwR9BGSOjuGfjf32R4uBUqMoEymxmonbAsxlvjlHQ/Y0jha
X-Exchange-RoutingPolicyChecked:
	dbJdIUeCpoTcstYA+39Yvn36Jv4qDT5GrS3HYEjFrXXFreiAoWPKfHlAqDMGxkrT8SZaXWzpoERe0JTq51lAYwfqI5IJJ+/aOWoSUbSK2MN54XybaF8a1gFIqLZDYbaEG4YUi2vUimSHZxVJkVhbK04lo76mWfLr/DcqClSDTqlwwAQD5gC+stVFUEi29IsnlQzTEsBN2ZnO1K7vZtIGpJYo393KGwFflSkx42xuKQm2i56SesRJhk1v7o5E+LTJur5K5DOjyU2kM8xp51kg/LxO8dUDQYOSSLDUFY3/U/cJor3Ycru7AkzcNeIBP4vWSNa2OW7Qrig+tuPk5SyAuA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:50:11.1986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19194be4-b98a-4879-800c-08ded6a61f83
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB8764
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExOSBTYWx0ZWRfX2gy/r5APVkZZ
 jUzHxAgh/d+eELV6FvLSCd0KWjpOlTb4c7ZUHNb+vbHITmmfbzPEIWaSjLOUQy+BI4ZYoTtMMHP
 cBNbXw3az7nfdtHSwc45BAzBzvTU5gk=
X-Proofpoint-ORIG-GUID: anbpJqoIYOn-BCG2L280DFNP_v7IWbHJ
X-Proofpoint-GUID: anbpJqoIYOn-BCG2L280DFNP_v7IWbHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExOSBTYWx0ZWRfX3c42ZBIF8MLD
 fbEf5kEBmBt3TyCofL0xDhkVMOZvf2qDGCAR8AHNrkZwK3gl3K/M3DFrBYYiBUMVd2cS5M3kMoV
 rmmXCqwJDou/Ba9U2r18cNW7+NrvTtwiZT2BTmkItWwzZX10OcBaVk5pGo4g6Q8+Wteas6AB8L2
 Hgnn0yWrZZspNSHYEdctjSyOXnmbrrCTvClPrUBvNGMnXn1PUVwi8UtaCAmnVu+yfMfzi+mX+8P
 9omlurjffGfTTPVoLD1sO8u/ib0zDg+AXLw3CnXbKPFy4DHwOpUkYjmJsExibzWetdWKbRewnmK
 CKVum6Xy0NBB9iNbO64XnhCxNUVZkJEZeoaFrBiYEKTPizQEupfTWxi9Afztll2W4DcWD063uK6
 w/rGRZf+BSOybiCVdskAXVMcK60AHWLQK3VhOAKkcGnLglVkbOZhQbfo0LwblEFIWDMAYDCMEVs
 S+1x7jD29M/SUO8Xm2A==
X-Authority-Analysis: v=2.4 cv=eLojSnp1 c=1 sm=1 tr=0 ts=6a43bbc7 cx=c_pps
 a=NdgNNtr5bv2bN6V0pY7wQQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=cAy1HaMQvR4_cKKbNpwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 30/06/2026 1:36 pm, Pierre-Louis Bossart wrote:
> 
>>>>> --- a/drivers/soundwire/intel_auxdevice.c
>>>>> +++ b/drivers/soundwire/intel_auxdevice.c
>>>>> @@ -669,7 +669,8 @@ static int __maybe_unused intel_suspend(struct
>>>> device *dev)
>>>>>            return 0;
>>>>>        }
>>>>>
>>>>> -    ret = sdw_intel_stop_bus(sdw, false);
>>>>> +    /* No need to keep the SoundWire clock active in system suspend */
>>>>> +    ret = sdw_intel_stop_bus(sdw, true);
>>>>
>>>> erm, are you sure about this change?
>>>>
>>>> What this does is stop the SoundWire clock before entering system suspend.
>>>> Is this needed? The whole point of system suspend is that the host will stop
>>>> operating completely.
>>
>> Not necessarily. There are multiple types of system suspend, like
>> suspend-to-RAM. The system doesn't always shut down.
> 
> Let's be clear: all types of system suspend do not use the clock stop mode, at least on Intel platforms.
> 
> The clock stop mode is ONLY used in the pm_runtime suspend.
> 
> The main reason for this is that the host cannot keep a detector alive to restart the bus at the request of a peripheral.
> As a result, the jack detection only works in pm_runtime suspend and NOT in system suspend. It's been the default since we introduced support of clock stop...
> 
> Note that in case where the peripheral is not capable of generating a wake, the clock stop is not used either. No need to keep that detector alive on the host if it's never going to see a wake.
> 
>> Also depends on the OS: Android seems to use system suspend as a deep
>> sleep state.
>>
>>>
>>> Yes, that's what we need. The purpose is to inform the Peripheral to go
>>> into the deserved clock stop mode before system suspend.
> 
> Sorry but this isn't what this patch does.
> 
> I think you are confusing power savings in clock stop mode with the ability for the codec to enter a lower power in system suspend.
> 
> If you do need the ability to put the peripheral in a lower power mode, it's perfectly acceptable, but that can be done in the system suspend routine of the peripheral driver. You do not need or want to piggy-back on the clock stop mechanism which isn't used in system suspend.
> 
>>>> There is in theory no need to stop the clock because the clock restart capability
>>>> will not be used.
>>
>> As Bard says, the peripherals should be informed that the clock will be
>> stopped. They at least should have the opportunity to act on that. And
>> they could still be powered across one of the lighter forms of system
>> suspend.
> 
> Again it'd be fine to reach a lower power for the peripheral or keep some power rails active, but that's orthogonal to the clock stop.
> 
>>>> Think for example of jack detection, it's supported in pm_runtime suspend
>>>> with the SoundWire interrupt capability, but not in system suspend.
>>>
>>> An example that we need clock stop1 in system suspend is to keep the amp's
>>> firmware in system suspend. In other words, we don't want to reload the
>>> firmware after system resume
> 
> If you want to use lower power modes in system suspend, that's fine. The suspend/resume routines can be modified to introduce lower power modes on the peripheral side.
> I am not disagreeing with the concept of lowering power consumption in system suspend, just on the mechanisms that you trying to use.
> 
> But keeping the context on the peripheral is one bridge too far I am afraid. Intel platforms perform a bus reset in all cases, including in clock-stop modes, that was the hardware guidance. That means that no matter what you do prior to pm_runtime and system suspend the peripheral WILL lose context.
> 
> To rehash the different points:
> - The only significant difference between pm_runtime and system suspend is the wake detection capability which is only supported in the former case.
> - On Intel platforms, context is lost on the peripheral in all resume routines because of the bus reset, the latency on resume is pretty much the same in both cases
> - The peripheral driver can introduce a lower-power mode in system suspend by changing the system suspend routine.
> 

If the Manager doesn't send a clock-stop, the peripherals don't get a
notification that they can enter a lower-power mode. The clock suddenly
disappears without warning and without the peripherals being notified
why, so they don't have any information to know what is happening.

The Manager should send a clock-stop notification before stopping the
clock.
