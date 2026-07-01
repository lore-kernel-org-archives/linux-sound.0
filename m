Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0663023E320;
	Wed,  1 Jul 2026 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782918001; cv=fail; b=OdFOfULHIglXxahCYBRG10cxgiziHfT9G6bAUe45+yLZQrpbjgd+IkcRkTfftZM3PeJvvMlBjetD8wQVM1SFmVuUZcVroXwdOpznzuqd0Vv5pdNoj/yNfiGLTWpegJLybdKpsT0awnzQIfsn4I4Q5ZhkGYxX1r1jplrQ3rSyVR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782918001; c=relaxed/simple;
	bh=zuC6JeRq5uVoT4+TMzeglW0CwvP8ijQshaRl/kAcSjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=koHuBYNignYD1iHtyD5ZPt8G8EZlTaccitINixRb21DFyftE0stAgcyOhlhj74WJwWdvTqI2TR6XNV331eUUhSHOYK+r7xTq1zPpzjFFPUo2HojO/n0wtGhs9VAa/W8liJ5tHsj8kcS7unBQtSHD8p8S9Ug8NQ426S9rjwBKUFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pW2GO8/b; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Ccc0j4j8; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pW2GO8/b";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Ccc0j4j8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661EHI0D2366768;
	Wed, 1 Jul 2026 09:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=3ZyVzkkK4g+YmH/0x3QuNoc24xQXx3PxoYu33g8jtko=; b=
	pW2GO8/b6puaCifL9dM52+MFRVtcxSsc0fkgD82uzXNG6tcTGAFdIBmRU/+g7FCc
	J+9Tw6RBdGPv4R5U3NhANSYd9iCcGi2ItQQAckqdwhK+4LVhbHOgSmPagMcEN1Ug
	kSDZ/7xHWOneHsKjXV4j0NmF2d//GVG+Jg2HlOIQTe6xx7JRXP2UOrQlm3/uh3n9
	6yZ6SJIszN9r2eTdqo3HRYmLIHT5ZsyL5C49/YXJ1W55SzicrafLRxp0j6IAW01N
	2ikpxlm1PSpAOcDuCWGJk8Zn1SNQmSmoBFsLXyNRAinf+E193Q0EKdL+HnxoephE
	Pj/Ql3ngdW0QEE0ezz8EnQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022095.outbound.protection.outlook.com [40.107.200.95])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f4e5r232b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 09:59:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBzLP5OycEnh1F32rqnqIN0Tcc7Q02SFURz3zDKdMkKDCilugjGDLRKielDjpkfXkeVNXBy1uZ8/4Pd+OZiKkCpu9tpKBLhnNbPYFf8LTh0AOwsmP8o8pn7TliDcU805ND+a9H+Qrol1AuQL2GD9CoDHgv7PAQvpDqHiEzHed9lW4EXkz74dYzUtzR7UruoRO3hpRePPl7jCjYrKRiy7ocNgxZ7Fgbgsf3DvUxf7VYjES+mKdL8oyz4CGPIN4JQHM8oos34Q5wOWBN4tMR9sy4rDkgOUNsmmohSuKWo0tn+c04GJWR/2dYZbju/USvzyHL3StUI294UBpd91JNTqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZyVzkkK4g+YmH/0x3QuNoc24xQXx3PxoYu33g8jtko=;
 b=Pcht+Yv0MnEZn22eRngyKQNywPlNcVP6reFbV2X/I4/XPE5w7WIkywwCGb15/xrkh3QGoobtdGsyf10rhN+9kAdI+UhpZO4+/Q/GFwCl+FRck/2XnQYWU2WRnFZi1vv7Xuo+pEKucFvSwk5HRP8tfcW/jubkC4QeK567ZBSrYetAlOSdyU1YeOmolbPhIaHrAFh0tCmXrymI5VRzSxz++TAJQ7kYohpdBXUeDJZpqOlp1Uc0McqgocgvHHqu6vKCxJg2AsVKetrcaUJCdZwdAw5mqcRm4CXtg0sbqmhCGFPkerUyauUBgzD2R7v+el/uIdgmf2OgVt88ip8dEfQT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZyVzkkK4g+YmH/0x3QuNoc24xQXx3PxoYu33g8jtko=;
 b=Ccc0j4j8QbezgOscYJ1X7seOeeVFIB80ILXtWUus6JBerz256RkTfSG30xwx9+ZYG4o+QchLA97LXi9t2X51FlPCeFMgRmt2IQ4lcKm2Vvdz86JHeyL70NzPLWIMQCyiFVO+M2zVX/7eqAI9Y6u25ptwkfAT+58fF+aOkzrAlOY=
Received: from SA0PR11CA0045.namprd11.prod.outlook.com (2603:10b6:806:d0::20)
 by BN0PR19MB5279.namprd19.prod.outlook.com (2603:10b6:408:152::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 14:59:20 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:d0:cafe::69) by SA0PR11CA0045.outlook.office365.com
 (2603:10b6:806:d0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 14:59:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 1 Jul 2026 14:59:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0D333406541;
	Wed,  1 Jul 2026 14:59:18 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 00B5D82025A;
	Wed,  1 Jul 2026 14:59:18 +0000 (UTC)
Message-ID: <da17c492-2767-443d-b186-70e004b4ecd7@opensource.cirrus.com>
Date: Wed, 1 Jul 2026 15:59:17 +0100
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
 <e326c51a-4690-44c4-bf3d-0870591b1eed@opensource.cirrus.com>
 <74bb6575-7d92-43af-98fd-dd46a83b2fac@linux.dev>
 <f895956a-a5fb-4b52-813c-110dfce8549d@opensource.cirrus.com>
 <ddc5fd9b-84ae-4180-a470-679d5cc3d629@linux.dev>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <ddc5fd9b-84ae-4180-a470-679d5cc3d629@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|BN0PR19MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: bac7183b-ae62-430a-12a8-08ded7815415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|82310400026|376014|36860700016|16102099003|22082099003|11063799006|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	MaEwBLktgGRUINc/Yazw3lkU4pOQTN6ZCtjH5vTku+eGEE2yNUyCet66Npzm7ReDM+PPoyhP/GCwboYv164PbXeh/UsVAkCqKNtvq4PwDGt3rpaEaa/94ZoZxkSSMv6BJuG/FHVFZ6gVXbPvsz2h4R4oDM9EBG4gHksW+FS2D5OSfPmR32UE1kPD3NHcFPUCpI9Jl/6KsZe2yVmPQM3HPKcsI05Apepo4QAXX5QIQ/bsyqFKyWHHDyHg76IZZzi58zbMsMJ2We/Q7RmKAdDiKej3pQvlkU/kCp8QURYA9qp61L9gpylN0vBQQSEqOQtH98aL8LhXW8BPqXXgGWEGUv5pBzE/TJejjqgMiujQC3Pj2NeLG8LL1VWZrS/OyDAe1LgKzvFVPrwXBUDdCgUzxx3BUrsaUbGuDMhqIcbC5visXsnemZJDW6mm3mA9mEwNX0pPzbxU8s5ozSEnFq12/SQf6EQf2AseZ2xefDh4VsX787ae3xNT+pGLM6eCfylhw524WD60nBpUgiDgIEVdQ/uvfrO3qcyUuccgoecXJ7QEkC+ykOUomF9lHuw7gVuFKBs3ZB1gWlNm2nzQUTo0SzTKGTRhuKEkPHYmU9/Lr0sh4aYN1qe0w/+ROpkfRKUSohvzswuUndZCxtuthm1RX59/qZakgA0nITFxEqZEGW2aoAJuZku/radX7WifvsB3ODZa47GBYhaRN/m7Mbh6jQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(82310400026)(376014)(36860700016)(16102099003)(22082099003)(11063799006)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3s/7WapOSJIGqlVbD7Y1JKXc5qFcKruv5wwPR8o3ntM+ckmTVkO13oel3nDj6bBPHMPjw850HqSjNW8W4e/BRYZ3l30G0gbLFqncjCxr+agQFUt6dK0FwcqlWSkIn1IOQgsXAKBf25Y3+muciyz8t7yaOi3mHSh4z+UceBEjkcOkBdln8Pc2fqzctUmJaXGZlkG0h6245mYsJtWz3ULAUaFB01dCUBJMbf3PcSmb3ViO8reFiapCgDHHJ+tdSYiR9yRvUba9PfempCd2kxxKEMNn6T6E/fOFu9x3h5FtT9QPzk7n0iswkRsCmQnasotm1TMDdRL6BB59pEnuTC+cWTteyqSGdupM+qPZFFIiQPmHM7WFWUBPZRlGIg5VgXlyCWv2c/4r04EcKWLeDzoNnjITdpAF31af1U/sykKla4H9LcgvJMKhBTkMLPhoE1aS
X-Exchange-RoutingPolicyChecked:
	ZUv0qmfO5aVucuLZtBJMZCA9UWylL7sMkUC7IyAiOwdCrSKggWPlUH7Auty31IF9Ecf4JoIwg5xPSL1xFt+0axjM7ZsQ4UL9+C2y5R04kKeaypS3vNg6Tvb+9JHoSsCnu9t1TowNvOKt9F3MVg8waJSxQT4JUqUX5wvfmfNAAxRXU4fzghPNMcY7N1J5+XWbT+o+BZwEv5lIYAFQ31f2E9bGmudNmWOlnbM9qba2JaJIEqfRsKvEKa9WCDxv7E71etL5SZlIAWBH/DCUJ/LytuEWpwpvYb40nqkz4QQYRYBfcZ5EEqUAX3JPF82nyEOOo8eIIrYpahST/IS6k4M8kw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 14:59:19.1797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bac7183b-ae62-430a-12a8-08ded7815415
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR19MB5279
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1OCBTYWx0ZWRfX10gkrTrhfD3p
 czvuNaTdRFwW6xdhihXEnHbvLI6YEmYr/d91dnWFLhHBFL45DRRGjFQWJjdpt5lhjeWqEcu92YQ
 VFHKf5/v6dtXW9muFuVvSdoWuezAqJY=
X-Proofpoint-ORIG-GUID: EoYo-CAKudHkJEQjv5iMoRCabICnRhbT
X-Proofpoint-GUID: EoYo-CAKudHkJEQjv5iMoRCabICnRhbT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1OCBTYWx0ZWRfXy0sb9c+8D0MQ
 ksx5kjyWWkvs2xWoMvViQdFW7bM3Clt2LimGlnczlRmVDHl7EKWt/DDRcR0UQSk3LIni/nRWd73
 Woqz2VWj1lwl8Yq4ZSWx2kGQbuW5ttEFnhw1BnQWTeGkZyTYivjZ/avWPDL5PDjTuQOLSH8cupr
 57Fs9eAM31qMiSlufZ7Bk9yC9mbpNrw02nfa2ONB/piz8bWwwCCoX9u6y47N2kCNDjRz2nJ4M8U
 B7T9lRYqpgKRmVdG+j8newr5PwfTnkWPwxU5LR86HMdxX+hfDldIjDAqbcidTVO2VAHg9Jeed7i
 imhpBu6ntXOwKJB8zU2ovui5v8wMU9gt+OiuEk15KFhI+wwqZlZgohLbpBMQnPBA/gdlXLZkyCN
 tDIm42SXBeqrnxcLxu0x8+TN0Z7tz971kymeJqIjDvhSaN/SGfGrhLXYdL+YVkhP5TCEod7WjsO
 RgE+Dkl59OrN85PMAMw==
X-Authority-Analysis: v=2.4 cv=eLojSnp1 c=1 sm=1 tr=0 ts=6a452b4b cx=c_pps
 a=jEVDRQfOmVlFoCNyrWPCQg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=vnjw43IDo-HT5bwvykUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 01/07/2026 3:09 pm, Pierre-Louis Bossart wrote:
> On 7/1/26 14:15, Richard Fitzgerald wrote:
>> On 01/07/2026 12:55 pm, Pierre-Louis Bossart wrote:
>>>
>>>> If the Manager doesn't send a clock-stop, the peripherals don't get a
>>>> notification that they can enter a lower-power mode. The clock suddenly
>>>> disappears without warning and without the peripherals being notified
>>>> why, so they don't have any information to know what is happening.
>>>
>>> that's not quite right, see below.
>>>
>>>> The Manager should send a clock-stop notification before stopping the
>>>> clock.
>>>
>>> That's exactly the existing logic in drivers/soundwire/bus.c, the core does notify all peripheral drivers of a clock stop transition.
>>>
>>
>> It's been observed with logic analyzer captures on real hardware
>> that the clock stop is only being sent in runtime suspends, not
>> system suspends.
> 
> That's the expected behavior.
> 
>> Because of this, if the bus was in a runtime-resumed state when
>> system suspend started the clock would stop without warning.
>>
>> Bard - that's the observed behavior this patch is fixing, right?
> 
> I think you are confusing 'clock stop' and 'clock pause', this is a well-known confusion in SoundWire. See Section 8.1.2.2 Clock Pause in the 1.2.1 spec.
> 
> The clock stop mechanism refers to the ability to remove all transitions on the clock line, but restart the transitions when the data line is driven high for some time.
> In other words, the "clock stop" used in pm_runtime suspend will also arm a detector on the data line. That's the problematic part on the host, this detector cannot be kept alive in system suspend since it has standby power implications.
> 
> In addition, on Intel platforms, there's a well-known issue where you cannot remove power to the SoundWire IP while this wake detector is active. That's the reason why we introduced a pm_runtime resume before the system suspend, the transition from pm_runtime suspended to system suspended is not supported. see intel_pm_prepare().
> 
> the 'clock pause' is what you see with a logic analyzer, it's not the same as the full blown 'clock stop' mechanism because there is no handshake to prepare the wake, and no support for the detector. There is indeed no signaling or known timing on when this pause occurs in the system suspend phase.
> 
> But again such signaling is not required: if you want to enter a lower power mode prior to system suspend, you can do so in your peripheral driver. You do not need to know if/when the clock will be paused. Just add the relevant programming sequence before the device transitions to system suspend.
> 

So you're saying that if we're running on an Intel platform the codec
driver will have to write the clock-stop-1 notification to the device?

