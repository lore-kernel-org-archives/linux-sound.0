Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF023F8893;
	Tue, 30 Jun 2026 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816745; cv=fail; b=CxDL6PkFKdFCYPs3Q9BlL9sPdD8BNHU3IBjLuFE3wi4rANHi6MBbvSQ52pzT9mS6R5ItUOZqRfDq3FiRdhqu2j/64/Wbaw6WBBzeFOXJOtBg1I7e4sjlENCsLYg7FmRPjrXPLnG0V0CltIkGN+D6KZOEA0Csq2cPGKVieQlca+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816745; c=relaxed/simple;
	bh=W4z/kw5QndtrlnrUDBOTpBYB6LcJP6gdzT/ioFOeBY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMBijd40Onekpn1n3lU/IvIQCsDFHA9GQBgffO2SEXLfqK+dhX2RX7OP3h+N7TCkPuHZYs8CBLTuIy6ETkFLhEC3Gy9hVmXI7RIo0b04mnQynoBiK2AALoFeZRzu7EXsiZWxSCiV0EHK1iWKA1HQz++8hCKGnJA+BaGtET45C/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jdB6WKwp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mL9L14EX; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jdB6WKwp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mL9L14EX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5h35p3223078;
	Tue, 30 Jun 2026 05:51:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=3gbBthv+jLLWmunaIRC6lcSLJuKka7jWD+t0vyqHjTg=; b=
	jdB6WKwpVerEupwOKFp/B4jCH1bF5yS5DM25JSEHbp/pleIM4rx8IjSeCaWOxOqm
	HUxbvcaG5mxbrfhhse0+UpbNQGFWnsNHM5cY2EhCEsuqKP6DdKE73nfe52RJSJOJ
	yjpTnr+CyZFv42eD+ZiSVBgWXuXlqp3SeKwxdKzyzNXjqH95IJo94izIAHgI8y30
	sVxwJ146IeaFHNe+b/NnEvM59AfBpnnfCiERshq0pMPwh4MnPgOuMj1ruhskpLOr
	z4bViu/4SDtIxQhK/fEYpeJTh7CJ3omzyveygpjvcyxoNsAkEdwYiJK4V0NHF+g5
	SPf2HipRXGdc1AaxvvEbvA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021077.outbound.protection.outlook.com [52.101.52.77])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f2axfky4n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 05:51:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJmTKise40IwLb+3gVYAfFJW4NJZ8debo3SbihxXZNRK7Es3CzZ892G1o8H2RIVNtUOGdjT7Be7NfxeMoAPUB1ysEVQQW9k0hF/hXbd5YWcO+Khp6irdZjf8FHyT9/Ye1n9r7ZSo6xPrszSVkTLAqwyefz7olT56DozjDpWfP6v5vG7aLpPbUzEbC22sJQfocYaP8hYmgmNduYCeZ8YgzNBcjtdBhpraJCQ/R5Z4MmUhtyLTTZhYB85mY14F5xOiF6YIWPEfDBLXdxNgCnY9palJmqUmk6ZZv3lElW8jhFNiyoapoC/oqAea8cssbstsN4naG6QUlexLeTzS0rPE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gbBthv+jLLWmunaIRC6lcSLJuKka7jWD+t0vyqHjTg=;
 b=UCLYvQuwviaU0iwhH7gEg7Jw+Jx0hZEDR4alg8dFCCx9Xw4tn+kDCJx9E9VhoGBIToEcU4cS3mn8HNAmqxfc62KN7k5lQmn/zAv4W01mwYH/Gqyv2sF/p0XZdKCtz4BK5rnOMIxjJdIdbTH1ZjomXgn7Os+5YIB9MGEPSek3be6/6sDxyElJHVUci709vo+GKU/jxgFnA9cfwyL0zWfV+ER9tSzjoLGIXH3jgL4cc6xP+8TsCMt9x6hwghu27nolIffGVGauxyjHKYvQrRgunntecPZ8qjXjKqMDKPqybwkwyaXUwIx+xZ53YEJxLWJrMfjDMzvjfh0EUPOZ76RLzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gbBthv+jLLWmunaIRC6lcSLJuKka7jWD+t0vyqHjTg=;
 b=mL9L14EXGQYFCfsqKk70/MS1GIQHPj113uDY5bjoEDxXzhI6tCJpUcZ4LEs24DNQcnSzxZ9pkB09TMnirBkFoqwQ/2EodJQauF78SPFYnSbnsUiMCe7VOskaD16YDA/zUbgZh+3MeSs0o2rBgQQHn90aqcGBamTZfu99YsrPDvY=
Received: from CY5PR04CA0027.namprd04.prod.outlook.com (2603:10b6:930:1e::17)
 by SA1PR19MB8891.namprd19.prod.outlook.com (2603:10b6:806:467::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 10:51:47 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:930:1e:cafe::53) by CY5PR04CA0027.outlook.office365.com
 (2603:10b6:930:1e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 10:51:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Tue, 30 Jun 2026 10:51:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6AA48406541;
	Tue, 30 Jun 2026 10:51:44 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5F37E82026C;
	Tue, 30 Jun 2026 10:51:44 +0000 (UTC)
Message-ID: <520f67ca-941b-4e08-8985-03f0e09b0313@opensource.cirrus.com>
Date: Tue, 30 Jun 2026 11:51:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
To: "Liao, Bard" <bard.liao@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
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
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <SJ2PR11MB842410EE22537B0673173EECFFF72@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|SA1PR19MB8891:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2ef8f8-f5d1-4a9f-9d95-08ded695947b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|61400799027|23010399003|56012099006|11063799006|4143699003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NKYcnxu6Vh1iyWFT0d1SaAp9rYrgFtaCbHcodwhqMBCc42tqV7400jcPyTse5LeGh9KCwO1ajYWF+BNfSFl199HvWqH8eJsqJOQH0dEyQlXQomCSYPcj1dt+3xG6luEuY1uiNCKxpBiiBWXHqpI8jCQQLknJqGtHV+npmwPClyisnWbpKYwllLMnrLuUgVgfdsEHww3xnLBDk+a7Tc1cltZCa48y1Xxb5wMsfJGdHaMTuXJPeSkqq5L8qYsQ+QPISCzXukQnbP432/x+ZJQm8Hi30kjKuQ1IyRLg/Zs2jnYL1DwPe/YHFzxkbQ86OQfjpTuTS+L3HwNztxWluz0FNrkCABqwC6YJ1pxOMIt2Sv2gNxC4reclubZAbYXo+u4onQTOAAINkIqkLASIQ6NzenWCvr6MxP6e500Erobs9s7f6j/4MQNHJrsOK6KyfQW8s6PW0OjpmLv3O4bs9AOUXibcVLZTjvQ4+W8b/dLVG8VMtfzc4BWA53FDYc8mcyKzcoBBRQa4eK4m6rl8CBrAz3TVgHYo0YF82afevOHRkjVgjdoI38qhviMpXld7BQ655Cz9kzNS9j1XTSsDJqBqROCZO11gJ//Ft9YR3QPOmn6PCz2XYolnaojG34lSCb0s1yf8AYmlqEMn6QjYhYvRqrZYxUrIBhH2n3OUsvuuTYjZ3riNTBXhbxXhA/C0nkTbUMLp839h1uZPT8P2qoAANg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(61400799027)(23010399003)(56012099006)(11063799006)(4143699003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PhzIlzgXUrd8l+G2S2/u8wEceuiix1uR8hvutYYm2td7J6ixZOUhP0k3SEtwnh//t8MAvbtby8es/n5Uq8b3ByIf9emr83fVxWC7x5rz4zWI40anJTWbcTBiuunmkkuIeWaN62UpCU2fe+0vm9UCMwREEXCABeEbMPL45yBlNmxKIYJEzPer/pDMgWVf/FKWW9xmd2O7rljyFcX5XNJ3DhzdKYLJ2tWLn2KG7THvZuAElklGMJ3e/rbGmnt9LGkNG9OK/ve4eX4m3EI+vQjNPVOZ+hXsR6rGPWtIZd3xtDTKNZdjngH3a7S/MHn2SV60xHVvAUwckM286Up+DbMQJmlOBI4seXb20ro0c1wg6GvgF/FfxG2w56YWWyQV66jjgwKLmBHjMpbtFgqG11BdyEYBMx8fkU+VyQ4eTTKFUYtIKZodTqa15EhICsYkkgZ/
X-Exchange-RoutingPolicyChecked:
	au8bpgpRLjQRVhEarJ4hCpnxJraz2NPMFDl5kdb/OyII4pmdMC57Yc5lPvIWd9J54mfjO53u59mJiV1Vulc4L7l3VMHgZ6n0HJ95w1Z0gf5DnbPVBIvY+VTvrHNLDMLzMHPL6YTSfKvXl+A67X0CEZ3hH2mK2tMyf6KPBBSTvyCdp6EC7iN76sMSGncLNTDgMowDLHnU1xZm/dr2RLlY4bzciCLkkrJ4avDLuXXzFzWvlWTcbRxRKltewe+AudiY3kFBmyKhNXQcPPKQla/u9H9ubyVszGTedVtPOaTJJOHxHvR+5GwLL/BFpYhl55PiBEjFr/aJYKUw3epJRcc25w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:51:45.9853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2ef8f8-f5d1-4a9f-9d95-08ded695947b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8891
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5OSBTYWx0ZWRfXwWCiphPfe+zs
 UNx63VQMm+n72c2MeNFO+Z180hEd1EU1BTeoMSFFhTLnB7IEtXY8NCODs27FUsXID5G92Gzafy1
 yKWDI7sDQDsUL5GcnYn3+NbNFmGwVInZni7wJd6iPgE3jEv4Wpn/xyTxtbX+mjwZxgKvrvg4mcm
 S5jp/WTXxuj+qlo0K93QdXaCm+h0hWeR65zAvUl3De2xpoGQMpkq1WASNDAobUNNdVvWRQ9LWCc
 yW8kWLoXY4u7odOJ4vQP0OUWT1uZz6q024aYbt8/zhWveGh0+uj7FP1r/c7ffttaI8gVo09e2nU
 l9n330AZFDLLfY44SSZrzvlgfYiPtzE9uNga+H4bVhT3g7ZlSine2yrc02PTert1Ma7PxwgGbk0
 tcZGKEER+tF01koyTBt3NYZNjzP5+CgREMOSDNeo1hfW1u6EvnjO6DJVOSDTHcXSFJF/CH7kGIe
 dWwmuw70mAbWj6g1jUw==
X-Proofpoint-GUID: IvpFmODAshC_2OnfuuiZ2_Qn_rnwa5aJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5OSBTYWx0ZWRfX/YfPSlOZJN3s
 rwRmNH5MrtHAeRBiUcBZ4DAyaBbAn/z+BP2/QY2YXx2eYwIf1mdE4cFnkXqOdGxKSqkcrXHhDQi
 hJ32UfBQj9vnIEMIZ0ZDrr3rULcuk/Q=
X-Authority-Analysis: v=2.4 cv=fc6dDUQF c=1 sm=1 tr=0 ts=6a439fc6 cx=c_pps
 a=gZV5Ef4gw7eWa1hDQMD07w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=s62moTvATFyV3aZRDMgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IvpFmODAshC_2OnfuuiZ2_Qn_rnwa5aJ
X-Proofpoint-Spam-Reason: safe

On 30/06/2026 11:35 am, Liao, Bard wrote:
> 
> 
>> -----Original Message-----
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
>> Sent: Tuesday, June 30, 2026 5:33 PM
>> To: Bard Liao <yung-chuan.liao@linux.intel.com>; linux-
>> sound@vger.kernel.org; vkoul@kernel.org
>> Cc: vinod.koul@linaro.org; linux-kernel@vger.kernel.org;
>> peter.ujfalusi@linux.intel.com; Liao, Bard <bard.liao@intel.com>
>> Subject: Re: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
>>
>> On 6/29/26 16:44, Bard Liao wrote:
>>> There is no need to keep the SoundWire clock active in system suspend.
>>>
>>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>>> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
>>> ---
>>>   drivers/soundwire/intel_auxdevice.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soundwire/intel_auxdevice.c
>> b/drivers/soundwire/intel_auxdevice.c
>>> index 0b8107bec9ab..10fd27f4fe39 100644
>>> --- a/drivers/soundwire/intel_auxdevice.c
>>> +++ b/drivers/soundwire/intel_auxdevice.c
>>> @@ -669,7 +669,8 @@ static int __maybe_unused intel_suspend(struct
>> device *dev)
>>>   		return 0;
>>>   	}
>>>
>>> -	ret = sdw_intel_stop_bus(sdw, false);
>>> +	/* No need to keep the SoundWire clock active in system suspend */
>>> +	ret = sdw_intel_stop_bus(sdw, true);
>>
>> erm, are you sure about this change?
>>
>> What this does is stop the SoundWire clock before entering system suspend.
>> Is this needed? The whole point of system suspend is that the host will stop
>> operating completely.

Not necessarily. There are multiple types of system suspend, like
suspend-to-RAM. The system doesn't always shut down.
Also depends on the OS: Android seems to use system suspend as a deep
sleep state.

> 
> Yes, that's what we need. The purpose is to inform the Peripheral to go
> into the deserved clock stop mode before system suspend.
> 
>> There is in theory no need to stop the clock because the clock restart capability
>> will not be used.

As Bard says, the peripherals should be informed that the clock will be
stopped. They at least should have the opportunity to act on that. And
they could still be powered across one of the lighter forms of system
suspend.

>> Think for example of jack detection, it's supported in pm_runtime suspend
>> with the SoundWire interrupt capability, but not in system suspend.
> 
> An example that we need clock stop1 in system suspend is to keep the amp's
> firmware in system suspend. In other words, we don't want to reload the
> firmware after system resume
> 
>> By changing the clock-stop argument to true, you are requesting the clock
>> stop mechanism to be enabled even though you don't need it.
>>
>> I do recall that in some generations it was actually not supported to turn off
>> power to the IP while the wake detector was enabled.
>>
>>>   	if (ret < 0) {
>>>   		dev_err(dev, "%s: cannot stop bus: %d\n", __func__, ret);
>>>   		return ret;
> 
> 

