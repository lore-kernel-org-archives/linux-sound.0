Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4897B1DF755;
	Tue, 10 Feb 2026 17:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744621; cv=fail; b=FTU0+TbszcWqYo/6Az9ILG2Wij/NnLv7g+/wuE6Q+JcZVLYWYMw1PscLSq9YhAyWnSOB1MPFFw6cUYh/g/sP+LUo0vwDXp27wYA7ufM+yccpDrQq3m8IVLPIAZJw7m9hXZOtgGtYDdpQc7EMgPNrr+L28ZkkBjn9GeJoTn0Nw5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744621; c=relaxed/simple;
	bh=OTkN292SFgD41jAFKvGN3yT0XDQ+pnydY6og/pRDSag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=auTjnA7oWNLHIAPfb0zSWmXZSr+lBgs3coJaL94SHaRyRkxOQ3XPXBa1vOysXJzt3Eh+Ofbri+nbaUeks+Z8fnQnlpu/jeIet7tnlo3EmNDZJrmvUk+K7uaD043qn24kM+OJ7lqyE4Kw29tulCCqltAPVIAHC1IUCm8DMVSfoV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=acf5no9r; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=m7TSf4BG; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="acf5no9r";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="m7TSf4BG"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AFjO7T3636629;
	Tue, 10 Feb 2026 11:29:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=3ybglskz7MS7+ja4dcZ9AHpcogJ+UZg1tZaGnv8enIU=; b=
	acf5no9rT1C6iS+XQPVpYS7H3VsZAGjTaiSqK2f+4iT/szMGntYNMAMN95EfYyOV
	fYOExzhx6TgD+qXNB5VoG3eqFuqU7AEQqp40IVZajPxrAY0w0q+S+SeVypTN86LG
	AF9EjDyeznGSVCRMbjsB8w2sP7X6ecpMKan410LUCo4OSRoAV+wThTpIhZQvafJj
	Lt+xNgVeNxtSFMJr4HVcA+5Vi4YElMdpP8zSHG/vKFFc4Y5bFW4laor5skmPit2/
	t3g6rUnEQ9FL4leK+rnh6kJLnB/4zqqfiJC3J/rQkuMTnVTXVS9+RSJu9ZEE4qoL
	2hOZalWfJLj9/QBa2DfqbQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023138.outbound.protection.outlook.com [40.107.201.138])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4c62pk3j6s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 11:29:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCHqTGJksrKn5VrPYSpQqPUdKgfMnAqS1BX8+LXv9CWZp4cdr3YLoJTrLAVjkh1OcmVrEBqjozS/nOGKbuDA0gvqvWtZzoCaD32wQQAcPLEH9Ervz/wL7H+14Sq0GEC7SLMXrGJzy4hoiXsdG7FxBOWMfJ1cYuK0SZy1tq77TisAzJAwvRH1SnAC2IF+Ll5vg5uObqbnfLsizR7NMw1VqSd7X1L3nG/9hAOdp8jrkKH/9K4tggf3R9vzkhlNvfvBwbSSBRa/de4/YKdvyDF1+1QBGmuzx7tSQqKC1pLZHW9Qb2bgtqxSocg7VM1q7lWZFT8ZmY1sf5b3RczwR1Giog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ybglskz7MS7+ja4dcZ9AHpcogJ+UZg1tZaGnv8enIU=;
 b=bbGUwOFLMw47hNMr7S2P8l32j8XDU0CZh2BzoTHssJH+xcbDZNCwxfH5gadcFGiCL88XbkRS4XNyO3DGAi5OUAP21uxIeWD2KYE16mWenpH/v1xOhMTO0zrO7px8OHTRXlQsWncARBD0dALJmDUPCHsB/xy3+2A/AxD6NvGmKLAELJ53nSoOridchrgTQj4xUjd/ZIdSnp99rgx0RL/t51Z7+SvK6YUfJzKHxjENso0zALIrKIFZsHoyHB7nDr6nX3Js+7NjxElgdlMGpw9jDQJ1PyOWL1Jo7wHRm1TWAEjr/k8mMzhOq9nrzts9wVC/JBqfT/3+DtiLrTdSmLUfgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ybglskz7MS7+ja4dcZ9AHpcogJ+UZg1tZaGnv8enIU=;
 b=m7TSf4BGnFdHwXmTfCoEl1pMMDN++pmH9hZlYFhvxzLE0xEDpN3fqwxXv/rr7zGPam+6AfHRFoHA28ddGK67Th0IK3KIep9yIfduPktVvaXDuLstFq+nYABaHcI/mtunPCnUzsHE6gUSgu1LfynVY2e2hZqfyc9Ui8lZ4D+OPbY=
Received: from BL0PR05CA0002.namprd05.prod.outlook.com (2603:10b6:208:91::12)
 by LV3PR19MB8625.namprd19.prod.outlook.com (2603:10b6:408:279::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 17:29:37 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::52) by BL0PR05CA0002.outlook.office365.com
 (2603:10b6:208:91::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 17:29:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Tue, 10 Feb 2026 17:29:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E369040654A;
	Tue, 10 Feb 2026 17:29:34 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D1893820249;
	Tue, 10 Feb 2026 17:29:34 +0000 (UTC)
Message-ID: <5066fa12-3ac1-4619-8fbe-62d61f9d446c@opensource.cirrus.com>
Date: Tue, 10 Feb 2026 17:29:34 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND] SoundWire: Allow Prepare command for
 Simplified_CP_SM
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
        "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
        "shumingf@realtek.com" <shumingf@realtek.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
        "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
        "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
        "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "Ding, Shenghao"
 <shenghao-ding@ti.com>,
        "Xu, Baojun" <baojun.xu@ti.com>, "Kasargod, Sandeep" <sandeepk@ti.com>
References: <20260209070905.10749-1-niranjan.hy@ti.com>
 <97872c17-73c9-4484-9f8e-373ed9a59a25@linux.dev>
 <87773927e37c4d70862c5f047431c7b0@ti.com>
 <e9e27355-a3d1-4ae2-aa6a-da47c6bced1f@linux.dev>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <e9e27355-a3d1-4ae2-aa6a-da47c6bced1f@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|LV3PR19MB8625:EE_
X-MS-Office365-Filtering-Correlation-Id: de0c2be3-0bc7-4839-954d-08de68c9f61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|7416014|376014|13003099007|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDk4UjlMR0RKRXdDSE4vYkpjRkJGKzlhOXc2a0NOZXNJMU9pOVBrYWVCVk4z?=
 =?utf-8?B?b1lQVU9PSVg2dDNkT2MwcTAvWU1IeUN6Tk9qZ243aVUyN1o5MXRxMGV0Qyt2?=
 =?utf-8?B?bFhmdkNLakZSWVVDTXVDVGYxY1BaY3A0dDNCUUFwTjI5UGNNTllHRkRwRjNs?=
 =?utf-8?B?ZW56d3hLUGt4OXVJb0JRdnRUOW4xN3ZmdUZtZ0dnNWFBZkR6RjRYM1ZqaFpB?=
 =?utf-8?B?ajBTSkpXKytWSU1ZUWtDYXQ3T1pqTnkvb29MUzZmSEl5azl0UUhDZGJqK0JI?=
 =?utf-8?B?OVB1amlWZFpvUlJXYzVsMnZUdkRyekVKQXRQQkZpWVQ1VWZabDFTTWVXZ3hx?=
 =?utf-8?B?UTBieitVSkZjMnlwdkFkeWFzT2lsYjRKM2RnZERVVGlLTUlIWk1BQ3BRTHBU?=
 =?utf-8?B?cE91ZDdreGtpbEhZMURjTENubnRURHE0Z2RmeFdnaWlEa1FjRFZSTTJnQ3V4?=
 =?utf-8?B?Zi9IeG1mQmVWNWN3RXhkV0FacFQwalQ4SmJuWjNxUk1qeWYyNGMxUzN4VGU4?=
 =?utf-8?B?QzdNQVN2Ykhwc1VCVUVWMlFhNStPTEMxS1U1U0NQMzMxMkxkQVY1NUFCUlg4?=
 =?utf-8?B?cGJrQW9VUDVwdWk4NHcwV3FoQW5kMms0bjNoYVB1ZVFLNmZBSHhLTnlyazkr?=
 =?utf-8?B?NXFLYjJXM1phUnJKV3lWL25NUklRTlExdkZQTzJNRWVRQytXVUxTMTcvZnpB?=
 =?utf-8?B?UmxtK2EvTC9UaktCWHpEc3Vjb1IwNC8yb0ZZMitKOG4wa0Y0U0wvNUxudnJw?=
 =?utf-8?B?VWlyS2drZ3MybXBXdW1RNTJMUjJ4aGxzVkVrblZMeXRMeHFRR0k5ZzlyeFVw?=
 =?utf-8?B?OVRqWCtRNFAvL2hmTmF3Q2xRN1FKSnpjUDY2YlNTZmhxaW1STEhsWDdpaVpZ?=
 =?utf-8?B?ek9VYWNSRTBPSGxWbTF0SkVFSG9BVmlRN0RoQzgvVkhZTjJCRzNHQWZmMWxm?=
 =?utf-8?B?RStRMUR4UGNkRHRwVDU3YmJOZ0hzSmtFeXU1WXVmN3NTVVBHQVFKSHpNcURy?=
 =?utf-8?B?T0F6ZXk5WWpTaUR3VHdQa3BtUTZ1c2Q3cmtDRExMNHFLNC9HaFJaMDlRZTMy?=
 =?utf-8?B?Tm1wY0xzSzJrNEdRU0lxcVA3ZS8rTk8vVmZSMXo5QS80VjRaMUtvZExkSGJu?=
 =?utf-8?B?cUNiTzExcVN5Ly9tck9RZTN3QVZyTy9lMkZhNEFTeVVXd3ZSSDgyMWJjSmVr?=
 =?utf-8?B?SmFmTkc5LzZwM1o4b0NOUUZWY3ZaQkIyWkVSQTQxem9PSm9aQnVRUlJIcDdv?=
 =?utf-8?B?V2w4cVVGbzQ0ZDdtc3d5cjg4dVJ0dzdKeVh2SC9UMzdHdFRDWkI0SzZXankr?=
 =?utf-8?B?T1hna3J3STV0eitJayt6MDFraVRMZ1g4SGU2QzlCTkZJWmwwN1cvQU5PME1F?=
 =?utf-8?B?YnNpT3drVDNlT0hhS0hiYXpDZDV4Y0ZNb0w3R25GSHZDUHdTdE8xV1o5VlZX?=
 =?utf-8?B?dFp4ZUhoS21IWXhXUU5QV1VOOVE2Y1BvRkhyNnhPdmJyWUQzSWx4Y2Q3TWh1?=
 =?utf-8?B?MmFVV0YzS1JkRFFJMzRxZnFhUDF2dXJRb1dYM1BhZEtzaHdncHlId1ArR1pn?=
 =?utf-8?B?aUYrcnN3L3F2WThRTGV3QUxaM29kbTJVUWZiNjdDQ1R4aHVJMWJJQkkrNzBy?=
 =?utf-8?B?RGtsUUZwZm1Sd2k2dzNtNVhXWGh6VVdyeHFGVzFiYXFTT2J4NGk4YlVTbWRD?=
 =?utf-8?B?T2tiTG05VkpPRHV0UVhLUFBNbVIvL2xrMk1BMzVLN0dqTmx1OEd3dUpQbFY1?=
 =?utf-8?B?aytGSXhNc3h2OW9DRzdjT0hvVnhod04vMmNyQ2Fab3ZQdkExUDhpY1Z2dDJ3?=
 =?utf-8?B?ZDVPTVBaU0Z5bFh5TTNoQWMvdEhxMlprbHlpNDMwOFBuUWM1bXJ0Y2MvbHVX?=
 =?utf-8?B?MGFyZzVjQVZUdThsb1JlZmx1b0lQbmYzc1VQTURKWmhxay92dTRjRVNucmRo?=
 =?utf-8?B?K0MyTk9DOWkzQytZNDQ4ejlVVWYrNHQzSW5jcURDN3hvSjZIN1E5RllKTVBU?=
 =?utf-8?B?RHcxRFBFdWViRHIwR0FnWXdUSVRPZnV2NHhFVER3dUo2NytVeWdYakl1aU0r?=
 =?utf-8?B?SWRuS0xyczVWM0JlcmF2NHZ2SGVZR1djbitSSVZ3T1M3VVJHZnhnWElwOW9D?=
 =?utf-8?B?OWFBV1Y0dzVmSGsxSHpCTWVjYVRKdVQ4WGNsRFkwM2hTUkxzU2k1ajJMbDFl?=
 =?utf-8?B?M2JnaWZDZjJtcWljZzZCZ2VTcmd0V2t4bHNyeXh5YzF4VTJMem1zSGRYWU9W?=
 =?utf-8?B?Zndha0E3TldFdHhhbWxLWkMrOUR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(7416014)(376014)(13003099007)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HhW0fWbWw65mB5GVcNBViH9U/axMFDmN7gqi0u//CzBKnkDKaZ7VDtYlv4V8fcFc+E8ybBhSirxxQQ07BNYTiv7P+Vxj0p6vSmy6D4bYxFMF+Dq0MElJnsnpIeb75XIUeGfuECvGy87BZKNQFLooaxjo8wXPELa5EREG9mhzVHem+E0qyyP3Rsb3MtBWxpLz0IiHBErK6PxeCBUhdReJpftGBbGzeaWgReicVs0v2jO2RbQa1emGmUfrohisupXDLeHb15YtUsQzATxj6698tXQrOryI6ZWf0YOBtKJCweKPqKWPy6K5uuFDOqx2LiOOUZpBWHae8lHCqqxod34OxG2hehJYjNfa09lSqW0TNy/PRLny53BluJ9y5HzRE1kLfFtZdZK46MtYq28Frda+czfzbbU6oCUniJZQPiTagoAEKSIKmaLCmZkXONFszpqd
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:29:35.7911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de0c2be3-0bc7-4839-954d-08de68c9f61c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8625
X-Authority-Analysis: v=2.4 cv=YeOwJgRf c=1 sm=1 tr=0 ts=698b6b05 cx=c_pps
 a=PjMtKLFqB+SPhzMRFbua8w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=8CCkZs_g0PXAQdjTXbUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Tzt6ZZWAv26v7JqUQCUMYFSFOilTu8Hr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE0NSBTYWx0ZWRfX9RPPRgVSw4dn
 pNaqwfp20PFWwB1loGgmHq2/kWVJ4e9ARF7KtP9nsFtt5JR8y7De5bSURr0p8PsGsLt2JKQRc8Y
 1yfSwVFOsTVyu/3HjOtCORVRiC9bHhVgHTS8/qfxbKPlVSbwPfMgRBkIZYo4w5z8GMq5KG6BarG
 +NXMlPmK3nj9CGRtfMGG9SDQHr4eIUyv1G8fvYSSpW5JK7n2STwgdYvtg73yj9Nw/9eUYvdip1D
 FHQyCoHaQf4zhrq1Oq1zIYoOCSVwqom9AXLxc5vCf/x+1lTiTxWCaHHE5wgMmi7PgObE0LiFzH7
 Egmflz7M9wAznq+A41ITvX4icjL2atygW17lGd+P3bV3CX4Tb1/lgAcq0Ih4FIcT+P21KGcxp1d
 P8jPzCLjktKjdIAgd907oUKYLdeRJuVKUXFsJ+GVvOyCs9fDdRFdLrlpi1G88hj7YMtgvQGUMdI
 nUkK0DMgpP+kg4mYBFg==
X-Proofpoint-GUID: Tzt6ZZWAv26v7JqUQCUMYFSFOilTu8Hr
X-Proofpoint-Spam-Reason: safe

On 10/02/2026 5:04 pm, Pierre-Louis Bossart wrote:
> On 2/10/26 12:08, Holalu Yogendra, Niranjan wrote:
>>> On 2/9/26 20:13, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev> wrote:
>>> Subject: Re: [PATCH v1 RESEND] SoundWire: Allow Prepare
>>> command for Simplified_CP_SM
>>>
>>> On 2/9/26 08: 09, Niranjan H Y wrote:
>>>> In TI device implementations, we've found that some devices with
>>>> Simplified_CP_SM still benefit from receiving the Prepare command.
>>> It would also be good to clarify when the device is actually prepared after the
>>> bits are set, if the implementation cannot guarantee that the prepared status is
>>> reached by the end of the frame where the write occurs, then it's definitively
>>> NOT a Simplified_CP_SM.
>>>
>>> What happens is the simple_ch_prep_sm bit is not set for those devices, and
>>> the regular state machine is used instead? Is anything broken?
>>
>> We need to use the same BIOS between Windows and Linux. The BIOS configures
>> the device as Simplified_CP_SM. The device also expects the Prepare bits to be
>> set. If the device is configured as generic CP_SM, the status "Port Ready"
>> bits will not be updated and we end up with port prepare fail errors.
> 
> Are you referring to the DPN_IntStat::PortReady bit? IOW do the errors during prepare happen because the interrupt is not generated?
> 
> If that is the case, then you should be aware of the thread "soundwire: stream: Prepare ports in parallel to reduce stream start latency", where it was agreed that the use of the PortReady interrupt is broken. We do need to move to a different code where we have a polling loop on the DPN_PrepareStatus::NotFinished bits.

I made a patch to poll for DP prepare finished, instead of using the
interrupt. I haven't sent that patch because this TI patch changes the
same function. I was waiting for this one to be merged and then I would
rebase onto that.

Draft review of polled DP prepare:
https://github.com/thesofproject/linux/pull/5649

