Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31C33382F7;
	Thu, 12 Feb 2026 16:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913725; cv=fail; b=j8Ib/GMkVtHchOJlsfwJ1OcgDhku2hmhKU0Zg7rjYvVC36Xz2ABA7VNKIBFLsDHZf7NoFTkxQCpAylH0VFbMApe+d/UpvPfuRwTbWE8l3hF2jbnjp759WrHTDygJ34y5uRq5Xb1H3/mTVQKd/pxq6SHA13+g3SxEJodYU9sCOZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913725; c=relaxed/simple;
	bh=TFyLr/C56LcS5PKvrWSvp8sytCNjif1QXe9AE7fdzXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nrs6viu3L7G+CGy6n4us6oCotWyRDi/75B4KqmsrWQl/2wx6ustM7Qm9Se18922qHo4dEDJz0WWi/H/ECCFeaxRw0/9XCnG0ccVdy2Oy3u0AbT6VIU6KWGGM4e6dh3eAgSE2ZJBpoUa1V23eW1hP78jKFp7kl67YY7ZVj2GBJHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EmGl52xx; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xhuKqGOj; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EmGl52xx";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xhuKqGOj"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C5PVNb455108;
	Thu, 12 Feb 2026 10:28:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=t9ZleBzyMwHDUKxzIijBg15Y5TZPmJr76kqOqFpSfEQ=; b=
	EmGl52xxVoOfrBK3Rg11A7wRCjBnUWQwUsiHQjDhhkbl1aJpuEJQcKXG0ql6ypwc
	BJzcm4ueBPu7RRaZzXkZEaNL6LDKpXEP522uQl1p16rPO0yBJ4m0GIx3emRf0cI7
	8EatIS3c1YMOIorsGf6ZzTO0aEFyA4kDl+scYwr7CAhRs1q1q+b3mJ3CChYp5tzf
	kLUX/mWNtYIw0nz72ta56bZ8m6pqAS+zerl9xaz+87az6pdE6RovXmv13B9R2iqk
	48p/ir2p2Z9vc2MaewiNLsH1niLUAZGt+ig0UkaSaJAveS6Nqks532xPN+TJNuJ3
	6nj3xGPZB/OMTCY8IL04BQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021111.outbound.protection.outlook.com [40.93.194.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4c63p06e9s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 10:28:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psumAGp1B2RERRYDNxtjplUcrK8DviZw1Ved6iymoh9bTQACYJBe482gfdFTCBWVJple/8HGIGU08TZZbCB33vFa1eLySQ92vA0uacIRrv0BlhBlbilibZXXGI/XTjEXtxwaqOgmoiRR2MyLSJk4FumkaT6e1f+0b9U0HDLPfMu/M8OCShsTCl9NIdHh4DbU28UbTB91MzklBkKMwfGlqjvyGEs6R8fOMwXDAtqKf9CMLr3EY6SjCDfAXJVz+PCfd8xYVEWDoI3n7ukfLKnBSV9kfg3EcbMJ46Kk/vPap7aXDfvwGc2KYTFqi0heINdyM05fWSr7vFqK2itbT3aK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9ZleBzyMwHDUKxzIijBg15Y5TZPmJr76kqOqFpSfEQ=;
 b=R0MXQpEszj9+NHb6C/d4yinKlUA/6bGV11lOPQ0IYYNuh498LfTmeEuaHpm0+YZTngzEBmlfFnzWi6UpyDi+8/FoSCBOAF/aR8THxa76FNypEJJkOVSyDN+9rrC5YkkuxiF57dMBVl1p2ReebQR3glVw/arOM7Q7Lcv5OO1XYyWMQWPiEq4quWPKLw90sArByUsoazcWBlrbY1vDiuec64v/EnSo+aOOIduQNqlSOodEYC8XHABXzqhj4E7cei0bWiJw9tecPnnJNXFSbSg1iclUn9LuIgWZviG+oDmYwqGfoEnZ/FTWdbZ+/lK7U8d660f81UMlgERNdE6xmMwePQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9ZleBzyMwHDUKxzIijBg15Y5TZPmJr76kqOqFpSfEQ=;
 b=xhuKqGOjlGIBe7lu3pFYkL8mXXXUtyWFZC9kLR23FQUba0JDcrLi6QLqiQtVHZsGb9xmZZxnIOC77IffNyhc9wV1vcZjLEs4F5i0e4pCEMtGZNK2ss39zdZgrzhm5yG7dJ/WPcQ3iwfkHT+xy9hbooSbhgReDS7jV8pR4hGmlX4=
Received: from CYXPR02CA0013.namprd02.prod.outlook.com (2603:10b6:930:cf::24)
 by SA0PR19MB4239.namprd19.prod.outlook.com (2603:10b6:806:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 16:28:07 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com (2603:10b6:930:cf::4)
 by CYXPR02CA0013.outlook.office365.com (2603:10b6:930:cf::24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12
 via Frontend Transport; Thu, 12 Feb 2026 16:28:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Thu, 12 Feb 2026 16:28:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A947040654A;
	Thu, 12 Feb 2026 16:28:04 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 90AE9820249;
	Thu, 12 Feb 2026 16:28:04 +0000 (UTC)
Message-ID: <b1238db5-25ce-4046-9719-bd6fa8fbc82c@opensource.cirrus.com>
Date: Thu, 12 Feb 2026 16:28:04 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v1 RESEND] SoundWire: Allow Prepare command
 for Simplified_CP_SM
To: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
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
        "Xu, Baojun" <baojun.xu@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Kasargod, Sandeep" <sandeepk@ti.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
References: <20260209070905.10749-1-niranjan.hy@ti.com>
 <97872c17-73c9-4484-9f8e-373ed9a59a25@linux.dev>
 <87773927e37c4d70862c5f047431c7b0@ti.com>
 <e9e27355-a3d1-4ae2-aa6a-da47c6bced1f@linux.dev>
 <5066fa12-3ac1-4619-8fbe-62d61f9d446c@opensource.cirrus.com>
 <5c8a4d68-0f43-40d1-971f-7d1f4f55eb5c@linux.dev>
 <286c2158-5f53-42a2-a04d-e9bed3e7acf0@opensource.cirrus.com>
 <54a891e5ee36487d9b6665cd73a19af7@ti.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <54a891e5ee36487d9b6665cd73a19af7@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SA0PR19MB4239:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f880d0-1184-4de4-b3f8-08de6a53b3b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|82310400026|36860700013|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3BpVXpleXE5QmVkc3dtNTdrOGlWM1YzZ1NSWGRXN3JkNzFTMnlWa25LN2th?=
 =?utf-8?B?aytLN2oxRmtwNG9ybXc3bjZDQXA3N2g5MVZuSXhhaXBldmlaekVJVnFZdUdF?=
 =?utf-8?B?ZkRRRTJremVaeEUvcHJ0b01DYkFnRllpb3RSYTdDU2JaWGhuS013RnVQNklu?=
 =?utf-8?B?eXI0VE4vbGJxZ3F6REF5SW91YklxVlBMbG5PMXpLdFQrVDFpNVpoc1dZZEVt?=
 =?utf-8?B?ZmV2eURrWndIN0RYYmJHZTlHMU9NaWtESlFkNDVZTFVaaUZhaHg4WXNEOC9x?=
 =?utf-8?B?cG1iclJwWWVLeXlyckFUaFJ6c05NVUNKM3NJb2R2eU51dGtKYW5KWjFWbDJM?=
 =?utf-8?B?TEc5U0dsczZKUWVKOTdpZktibjN0aTB4VFltQXpqTE1pek1YMGZrYnI5TU8r?=
 =?utf-8?B?SUxFdUVHaXByVk5PdnpoWVBoVWtQclVISUpJV00rdVFTdllqRy9EN2VLcGE5?=
 =?utf-8?B?OXRRNTlpRE5uM3ZqeUwveEFqTW9mS3NkNGJSejZGc0dpMVNVK2xvemRiV1Ay?=
 =?utf-8?B?V29GY29xVTFkS1F6WGNnWmZLaDY4WGE2VURHbHRTZGlrbHVMRXM3dFc0L3kv?=
 =?utf-8?B?WnFIMndTU200dVZzSDJMdG00VndlTElyVm5OeGhHVWU4R1J4Rmp0OXZ2TjFK?=
 =?utf-8?B?QytlYjlHRHBsbVJGYjh5MUVVYUZUVWxaUFBIMG10RHhTWVRDSVlvbDMzT1pO?=
 =?utf-8?B?T0NoOXd5bTAvaVNySHhrWlVKakR1WklNZGVLM0tKUmpDWHVyUzQ1WEl5WUpl?=
 =?utf-8?B?Q0tiOXpFS2I2bEpTQTh3Tkx0ejRnS3plaFQvRTZ5Z29oWDMxclk2VFo4ZXo5?=
 =?utf-8?B?dHRpNjlaSk1JZlVlUktPbUU0WDB1T2QzZm01UGdlTFJxQ1NkNTh6L2hQMU1z?=
 =?utf-8?B?WWc1TkVzYWw5SnZlQlN5SHRSanR5aTJOM2lKZFRFOWh4NW8ybUQ1WFV4ZDlM?=
 =?utf-8?B?TWgvQzQ5ZHNxdDBaZ2NzT3F2SHRKTk1jVUY2Vm1zdFFSdEEveWxDOUkyQVJq?=
 =?utf-8?B?NnpnSUc0S09tekw0azBDT0crMG1nVHBLZFBGK3lhTXZvY1ZSK1BmOFVIcHVH?=
 =?utf-8?B?Wmk1b2xkcEdnTnJaalVZSHhjWDRYbkRuaGJoZGFQbDRvUXpWclR4UXlUY1FC?=
 =?utf-8?B?OUhWdk5NZW80c1lVUWpwci8xTEEwbVM1MlFieGhkRlpHalZkQjJ5UDIzREVw?=
 =?utf-8?B?RGN5TWY0RWRHOENUN3M4TjJacDIrZkZ0enIvNjNCNTA2Vzk0akRKK0F6R2V4?=
 =?utf-8?B?SXk3YjFuYVNuQjBxV0Jxbkh3bHorMlJ2SldoUUExV2tHSUVDcHp2dDJGUmFh?=
 =?utf-8?B?dkxkOE5CZHdQS1k4QnQ2WVZxaXlmS3pYQ3I1dER0U1dRQytlZGE4V2JodWxQ?=
 =?utf-8?B?MSsxWjc0QnVPMitYb0NWMHVXNWpDOGZWUEJlVlpVZHRuQmlQb3ZBRVVuNE9o?=
 =?utf-8?B?WGw1d21BcDJiNUs4WURzWDIyUmYzdFRIRFhoQzNkckVPNGlOSThDZUVUUEg4?=
 =?utf-8?B?M0pHdjlxVjN0cFdsTkM2RklCMGVPWkdBSjB0ZDZtRkJxZ2QzSENtZEdNZk5J?=
 =?utf-8?B?dFFTNnhld1B4TXdrMDVkemk0L3ByT1R1cTJRN3JxL2pteEh6RmtGM1AvUjdz?=
 =?utf-8?B?RWRWaXI2WXFrOUxvZnNHYU0zbHNhdGpQMmY3YVRDVXFaUVErK1Z0YytzbEtB?=
 =?utf-8?B?M1NRTHBhODZncUlIT1A0anoxMmg5bExDbVo2alpNQ3R3U1diZXNzN0dBTDdh?=
 =?utf-8?B?UFNyUU9mcFRwNE9nTGgxVzNTclh5ZWVFY2ZmeHdrUHNtdTlzWFczWkJDWkYy?=
 =?utf-8?B?Y0FNMFNNR1l3bFc2Skt1Tm9zYzI5enpuVEgyNE90KzZpbVl2VzhnUnA0a0xt?=
 =?utf-8?B?TmtFOERFVWdLdEV6K0xEVUNBWUdiNFRzaThhZzhIVHZHUmhybFE2cjR5SzY0?=
 =?utf-8?B?QW1nODFaRHBVaFdVYmYvckNEeUE1czk0R1AwMFQyVWhiRXZOMnJETnVwNm96?=
 =?utf-8?B?KzZrRWZsYWlDNHhnNFF5bkRvQ2lJbWtiSTdnaHJIZTBiK1hobGo4d05ncHM1?=
 =?utf-8?B?elBiT1d1alFSNzZ1ZTFObWdGRktzODI3Uk8vYlA3MkRyMjR4Ynl1Z3VBVElO?=
 =?utf-8?B?MnNSMzVSbXVwS29MRElLbmJiNVRkUTVLNWUyS2EwSEg0b0piS3RlUXh5YS91?=
 =?utf-8?B?eHZBY2FrOUkxMzI1eElyRnR3UFpYR1JYcWoyNThNd2hLUHNMTG52bTJ3eEtS?=
 =?utf-8?B?NklmbTZpc0l3SC9oaExnckY3bFhnPT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(82310400026)(36860700013)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lA6gbMhChswfe8tlYThrMLFjlzNwCREqMcfl20E7Fq8qreT5aYmNwpNjESFCXhbxDX70yn8sofNtr5s8JKEmN06I+cbwSg79ZrTOBhfmogxmeiEsFOjIV9ZAGJo3Ulvm+y0JNNe183mqAFYw7+lPhUtW5j7sOkgov0vJuCUkmmGOMzM+ZNCr7HmreqMVUKCEbIoJshjXEqPQP1cvl3WKko9YIxYRAHlK0JmF09I+5wOfl9sglspHj6l/Nt/u0qevqqOy+OERm5AHtuO2AZHmZEANBeCFfuC2fQAUpFIOgBQdBTVo4CLZJETDyWggut4tUGiw6829ynYDV4cn8MGyK0eMMprCgca4grJnijN/Ql6lOVk07H2e98F1EWuoheiiEP85vDQeVLV5NKLTrqyeZ/rOGJJCrxz0cCwWxYsOcDhx34hcdYGBlou8UaStrjkJ
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:28:05.9851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f880d0-1184-4de4-b3f8-08de6a53b3b3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4239
X-Proofpoint-GUID: fcevYaXlJY4CRiNpGhyr0xbbWEsqy1AS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEyNiBTYWx0ZWRfXxMTZKmmVpzse
 EEbg7DFyvI7Tr8kjFB2lmo/AD4e7aXiv8v62je52Kf+dhBqQgL2CgQ+T87Y/TsVH5Ja4Y6xec0T
 LjSjhvAXkYK4d7phS7nmlkJrZlVrPwOCGVRaZawAo+G2oPCk72NLmTPTJXlEtk/724iVbmX/hNC
 OQaiLhCBqDxtAMTUE4yGzxm0nMtE3G+71IWEd/X22bh2aMsH756QLJQpae58Y16VJngDvfZlxqX
 FO4OFfe6JzJswYJHk4+0hn/OQRzQJWakdq6sw7UqndyzzfgGppNByulEfvjAmWqp5L+3j4qlDCQ
 02iL6yv5Ym1qyoxZ7de7rzRua98py2X0Kd3DZRo//jQAR+lnl8bX+UtgQKyq6y5Hkho3mBiHCmY
 0wBQ57UPGX1QjzH0Vu8AfCqfvPhoQDc6UguRlWPBb5g6aTNZpTBmpSQYadoGmJ6QF/0urrCojwy
 LAK0RSadP0fgzbG1AZA==
X-Authority-Analysis: v=2.4 cv=edMwvrEH c=1 sm=1 tr=0 ts=698dff9b cx=c_pps
 a=Xow/CfGS+sd61STD3JSCXQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=kzLIRRxPldbf2neElzkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: fcevYaXlJY4CRiNpGhyr0xbbWEsqy1AS
X-Proofpoint-Spam-Reason: safe

On 12/02/2026 4:17 pm, Holalu Yogendra, Niranjan wrote:
> Apologies for the late response.
>> On 2/10/26 22:34 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev> wrote:
>> Subject: Re: [PATCH v1 RESEND] SoundWire: Allow Prepare command for Simplified_CP_SM
>>
>> On 2/10/26 12: 08, Holalu Yogendra, Niranjan wrote: >> On 2/9/26 20: 13,
>> Pierre-Louis Bossart <pierre-louis. bossart@ linux. dev> wrote:
>> On 2/10/26 12:08, Holalu Yogendra, Niranjan wrote:
>>>> On 2/9/26 20:13, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev> wrote:
>>>> On 2/9/26 08: 09, Niranjan H Y wrote:
> 
>> Are you referring to the DPN_IntStat::PortReady bit? IOW do the errors during
>> prepare happen because the interrupt is not generated?
>> If that is the case, then you should be aware of the thread "soundwire:
>> stream: Prepare ports in parallel to reduce stream start latency", where it was
>> agreed that the use of the PortReady interrupt is broken. We do need to move
>> to a different code where we have a polling loop on the
>> DPN_PrepareStatus::NotFinished bits.
> 
> Thanks for the info.
> 
>> So is the problem in the interrupt generation, or is the problem with the 'Not
>> Finished' bits?
> Both, while using Full CP_SM on a simplified CP_SM device:
> * First problem: the interrupt will not get generated on a simple CP_SM device.
> * Second problem: even after timeout waiting for interrupt with huge delays,
>    we can't rely on 'Not Finished' bits, causing timeout errors.
>    In the current code for full CP_SM, 'Not Finished' = 0 is a good response even
>    with timeout.
> 
That's because it _IS_ a good response. If the part is reporting
NotFinished=0, then it's good to go and we don't need to treat it as a
timeout. The timeout is caused by the deadlock that Pierre mentioned.
Full CP_SM will always timeout because that code is holding the bus
lock, which blocks the interrupt handler.

Ignoring the timeout if NotFinished=0 was a workaround until I found
time to fix the interrupt handling. Otherwise full CP_SM would never
work.

We've now decided to replace that code with a polling loop instead of
using interrupts.

>> If that works then an alternate solution to this patch would be to quirk all TI
>> devices to use the regular state machine, and use the polling loop as
>> suggested by Richard Fitzgerald.
>> I think it's worth exploring what happens if the PortReady interrupt is not
>> used. If that's broken as well, then your solution would work but needs
>> more/better comments indeed.
> Currently, we have one device which needs this workaround.
> Initially, it looked like a generic solution to me. However, if it makes sense,
> I can implement sdw_slave_ops->port_prep to make custom changes
> for the required devices only, handle any errors and drop this patch.
> Please suggest.
> 
> Regards
> Niranjan
> 

