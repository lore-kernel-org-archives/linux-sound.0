Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E9F14EC73;
	Sat, 27 Dec 2025 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766848681; cv=fail; b=HXmJUEKD1ByqMAL+LVqdVF80NstGUgPhgf57/YKCDtjmml/gdKf8mMV4RNGR/q/Ja/+KXb/ffRXWCUoQZFMAtdj8kNw8z0Fst4iGibXZbcf0XynANScz6zNU2hnEv0UjePCLKLVyf9+MjpbtpBaLWelxYblwjadTQJKaqTm98+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766848681; c=relaxed/simple;
	bh=bgBCFgCg6Geti/Cxq+SnpJA1M4dTmiNunhgFK44QPhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mbfhh4ctGSgQimHJUvRbVVEhZt9YvVVS8CMc0Ks8I9U3HH7me7CiMVcEjkOK+Zkd3tn8p7YN/dzWBOUjNt+10CR5LOVPfm/dVVuRWABvquVrA+Ia03PfauOAIJqZcelue1LJe3rzN3BMgIfSsj+QGBMebON39db/hrJ7PRgbSZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GLOtu9dC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=u7r4YB6o; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GLOtu9dC";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="u7r4YB6o"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BREvPg23880735;
	Sat, 27 Dec 2025 09:14:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=UuNVjFBclMbF6DJFI3oyrByOfQcHsh81ILc+DZAnlDk=; b=
	GLOtu9dCLLIdt3UURfmuoHy56rw5ADOixcr9YoOZPdhZHGwC2hP3H7KpmLXMEloR
	p3c8Ies7P4BVKf1t2cVnnYJcX5qD6g7jx65H3xdcbz39cd+MYDK+DfN2sp1PVqUX
	b+esP0RCHxmaGYYMVkc06/eHK8f1B02809gOoHlzcAL9yJuceBSy6ZZYkx/gc/0q
	T2URs4jrupE7Gd+I+2dI1Xr8XXDw3d/YwEz3XCSzHwjpR1gMaY/aEweV6RI/++0G
	ZUm72BCQXWeDhYa5JpPi2pSNLwO+l1KwezUyb8lVPXYdLdkaMDokbGNoFC0eUpCs
	M5uclS4QrxhwiFRjY37vNg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021143.outbound.protection.outlook.com [52.101.52.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4badr385cf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 09:14:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xt0iQPVU+x4+GwTlnlKEA4ruY9gPOyrfS+SproBS7lATQWB/PJ8chCn6J4i8xkA0rTKtQt8dtVYAHLM2NmoPKJVNpiPHBrRrDBOdbcN/T8X/UIb+ttr8R3ERMmFw0PrG1XB0ndATEXbH3WVqdmeBEaLVoj/dkzVUCmDaJJDqNGtJsL+MjxcUjeodB2Lt3U81gb5xtqtWZUpQdAc1Wf7On2f6V5b9YW8mPWFYNPvZoOCSoPxzv7Itoe0Wotwkd1qaCle7O4YgvxlG470A1FUtS5IWyNfpCrltyAefAiDPwysl23zqoe6NNNi0H2QnRbLjWB5wGDSn+QlOOV4YbP76KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuNVjFBclMbF6DJFI3oyrByOfQcHsh81ILc+DZAnlDk=;
 b=UmB/TEP6SijpBHHFquPsUknMewUuMhX3YFDzhC++MEsFqQDFtWLyR7YXH70axBDPOk4y5L7lYasb/F9Qowg+UG3TgkQhbZSkuDEYD2xUuBjsLxgxQXDGlH5R21JcG8UvJ7n3ETGnYCtuJ8df7SQVZNdwZfj1eUiSJW7PwuauQuE4sdfAKbfGUBAMmMQqWRjT+y6ZvdNXigGZVl95WQT6MuIJsY7JMGqeQTMzekgDcJSTxjr0HI+a5aMHqZyKgsTfmLnDgBOorDqZ7LZaeBnp2z7yUz5mqiT2MFbJjOK+PlqFdqqPiNSkvoGC291SIztNWiQuLCaQmH4puojShHjXpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuNVjFBclMbF6DJFI3oyrByOfQcHsh81ILc+DZAnlDk=;
 b=u7r4YB6owHiiwxB1Oj80bgcqHcAGzMtl1wJY/rOZXSnnHlig0ydSVJceWwzySclSn89GB2CMI8bErBQzklJHczCYH8/B/Cd21xD550rwMelbTGJh9Uqxba9hd4jsdD7j5D3ZlTywdJbBvX40jk7V5fnBbvstDxmyu2MWQgqwylE=
Received: from BY5PR04CA0007.namprd04.prod.outlook.com (2603:10b6:a03:1d0::17)
 by PH0PR19MB7406.namprd19.prod.outlook.com (2603:10b6:510:26e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 15:14:50 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::d5) by BY5PR04CA0007.outlook.office365.com
 (2603:10b6:a03:1d0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.13 via Frontend Transport; Sat,
 27 Dec 2025 15:14:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Sat, 27 Dec 2025 15:14:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CA268406541;
	Sat, 27 Dec 2025 15:14:47 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4D48A820249;
	Sat, 27 Dec 2025 15:14:46 +0000 (UTC)
Message-ID: <bd6c51c4-5371-4fd3-823a-eb1ecef24dc3@opensource.cirrus.com>
Date: Sat, 27 Dec 2025 15:14:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SDCA: Replace use of system_wq with
 system_percpu_wq
To: Marco Crivellari <marco.crivellari@suse.com>, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Michal Hocko <mhocko@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20251224162635.147710-1-marco.crivellari@suse.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20251224162635.147710-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|PH0PR19MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: 81eaf6f3-310a-4550-457e-08de455aae02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V20ya3p3T2tXckZSaGRueFZsb1hOMkZvTDJPWiswNXBISXE0Z01Xd3I0YTJT?=
 =?utf-8?B?OW9XcVQzdkxvUDlTdGFldWd0ZUlROU12ZmJIbFVnQjFXRnZuVDU4Y2h2UHRX?=
 =?utf-8?B?c3ZJclk4RTlqTytMWjBSQXE3Q0ZJeHpPSTZZd0hzZmlRSUkwdlFENm5GMk1O?=
 =?utf-8?B?TXJ3N1UxaElhcm9jbTNWcXVybEZ2OUs1a2haYlJUQVZBbTdwVStZbWlOZktT?=
 =?utf-8?B?UThVMlBvTXVMelR1STNQZUxFYi9GUVVQR1hJR0E1S25Tamh4VVRRUXlLOXFS?=
 =?utf-8?B?ZzhNeVRzbVlyYVRVby83bzFVUnByRUZ2Mm9JL2hNaVMxZ2hXb2ZPYVdvbTBN?=
 =?utf-8?B?d1IrT1RQd3FTR29wMFdZV085MXJjOHdRdEhDUEtkellxQ3YrZUdTbnlvc2R2?=
 =?utf-8?B?VnBQMVMvaUMyRlo0WGpMZzZDbTZOejFodjdqSFhoVkVnTDNoMktxRENuWDhk?=
 =?utf-8?B?dnAzcVNHTXdHWG1hZ1c3dUhwaHhlZis5UDl5VzBtV3BxcStWUmd2cHFxT0ZZ?=
 =?utf-8?B?MXhDNFE2T3J4emxMaC9hV2toN3BtcDJMQmh1TEdsSTdaOE1tdHp4Y2x5dVc4?=
 =?utf-8?B?bFlZWGVOaWU5TlVQdmJlSVViV0tYZFVHYjdGNCtvNEc5N1Y3T3JDcTY5c3Rz?=
 =?utf-8?B?OUh5ZTBHeEM4dGJzdnpTRnd6TmZuWDRCRWwrcnU0SElyM3M4UTI2SlpXOC9p?=
 =?utf-8?B?VURpdHU0Ky84NDBIM0pQVVRuekwyR0NBL2l1ZUk0dFdoWFh3cXBxUDcyOHZl?=
 =?utf-8?B?NTB0ZzVwTU9yMXY1QjRwRHppTkhKT05IMDlNZVpDWUhmTDFHYWRGVGVYcWNu?=
 =?utf-8?B?M1kyTDdkSGFwOFVLQWhYblo3cjRMN1hpUHVkS0ZrT0V4M0ZKaGEyRks5ZXJo?=
 =?utf-8?B?RXRKY2U3alVkd241bjhEbnZ2Q3EyK1B1cjdIazRZVXhMZmp1RCtoclJ6TFBr?=
 =?utf-8?B?N2ovNlFzc0paRGxldC9VR3UxZ3BLWnNzdUQybFUrRzRzTEV2RFVzZVkrNHBN?=
 =?utf-8?B?aGFvbXV4RVI2K3Fkb1ZiYy93VE5hWFprWGplRkVoUmhTQW5FV1hkRDRkWkZQ?=
 =?utf-8?B?c3NLT0ZNZkt3b2U2WEh2aWxZcnZnT1BwZjRUWlMyYXFRM2owaSt2UU13UDJk?=
 =?utf-8?B?RUZCS2dHSGJMc1RCMlNocEJzSEN0MjZDby9RMWNmRFZxNStNaWE5MW4rQk5M?=
 =?utf-8?B?U2U5akhIRzkySHZQN25yeER5bzJEZnZxZ3ppMitDY0RacTRIckVIYWxjT3Y1?=
 =?utf-8?B?U0VvRnoxKzF6Yzg1ekI5L3o3SzlCWldnYWxHK1BYRUlwRmF0QXMvREFWYk80?=
 =?utf-8?B?S1BnZDRsbGFZNVF2aEEzWThNd1hZd0NXbkZVdUxrRzhRdXZQMzNkaDVFZys0?=
 =?utf-8?B?bEJMSGh4akNNb3djalZ6K09BZ3MzV0FLMEhXUCtjV1ZDNWJSMlBDVExnM2F6?=
 =?utf-8?B?TWR0c003bVRFNUllcCtaT08xcFJ5d2ZiYUM3cHhZZDU1WmFoZEFTNm5Udk5p?=
 =?utf-8?B?YUt2N3JEd1A4MmtGeThXYWxEamVlY2RkNk1wKy9HbGd3OUJTdDFabXNPNHha?=
 =?utf-8?B?M1ZFOVdtYkZNMU9wa1cxUzdtTjMxYldweEJnSmkyU0cvelZVYU1TOW9ZYm92?=
 =?utf-8?B?SlFPdTZVNmJrdUQ1YlhsUGo0WTlpOFU3ZHZqRXdoVk9LTG1zTnVheDhFQVVQ?=
 =?utf-8?B?dzJ2Ymp3S1BnYlo3YkEveVd4SjZ3TzBqZExwaXlxL2t3MkJvWVNrSm1hS3pF?=
 =?utf-8?B?czlwWjlSU1RWdWVVN0daZ1BvKzdtZDdZWjZXb2RiSXRIdVdLRWxPUHRFR045?=
 =?utf-8?B?R3JRWVFXVmNCVUtqZXdmU0xtb1VFWit3SitrSHI5TktQMW1ib0l3L2xoMUZH?=
 =?utf-8?B?bzZReGhTTzJGVklEYy9BYi9BdFJZU2U1ZlRLL3JsWnpPcCtpbFRFVEFZaWdl?=
 =?utf-8?B?bnpETlY2UTZLMnhoZElubEMycjlmQWhGb1RSd3M0RDI1cXE1YTBEUDVhN1Nt?=
 =?utf-8?B?VkVJTTRMYVF5djdNVUhneGFRL203d1V6TEpSMVl3T01kQzArU2hHVVBiSXZt?=
 =?utf-8?B?eFNYVzlsV2xKRHFDQU5EOUUzQTZnOHFwWSs5bzZJTjFyNlhvdENCWDVyenU2?=
 =?utf-8?Q?Auu4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 15:14:49.8594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81eaf6f3-310a-4550-457e-08de455aae02
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB7406
X-Proofpoint-GUID: ZHe6m_wViDY4FCnaMchZ2NygUbt6snp7
X-Authority-Analysis: v=2.4 cv=Z8Hh3XRA c=1 sm=1 tr=0 ts=694ff7ee cx=c_pps
 a=/cdxYPoEIjFnUsMTEY5PDA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EFlhQnycTdAuC0AJn-UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ZHe6m_wViDY4FCnaMchZ2NygUbt6snp7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDE0NCBTYWx0ZWRfX4eKXWUnt7hm7
 DbiXx5z+V7pt/qpe5XStWOowXC0q/3axRJa1WYcQdthxdIbM6cB648lg1xK1G3R9+m3q/7v22ZN
 jlV2zbSPdly62+sTv7DI8JEbzYxbijfKoOxHBNAEFRuqTy3fN6u2E+DZB+IvlO7DaBphPiLj2qa
 UjTwKyXwVhdlGxTAt6OGwgkWXTVbPkQE4BcHU2fR4XuwySz+0yfxlK/Zht85cLo+0pW4vFxTBjS
 j1psgN/KW3vNG6Z9AUjvwGy6EsW6y/C04ZYxHmoI6T+Kj+yw06yVcfm3QdZTFO76k3hTFgswfy6
 A8sR9GgtRu268ojM7j20OyS6f0WJNGPfuXx7u1QaTMzemb35abMnnDVJdzq8VAxuB6rOqYy8fLe
 Co8EaOcHMJYdp+r51nF2QFgZLxaLwZLTIbX7JMIZzjlKm1N7dz4skhmyl1KWNrM6KueEoHIvcDk
 NUmtXfWsqDVSpxR+sDQ==
X-Proofpoint-Spam-Reason: safe

On 24/12/25 16:26, Marco Crivellari wrote:
> This patch continues the effort to refactor workqueue APIs, which has begun
> with the changes introducing new workqueues and a new alloc_workqueue flag:
> 
>     commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
>     commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> The point of the refactoring is to eventually alter the default behavior of
> workqueues to become unbound by default so that their workload placement is
> optimized by the scheduler.
> 
> Before that to happen after a careful review and conversion of each individual
> case

... so the commit message should say why this review decided that for
this individual case the best alternative queue was system_percpu_wq.

, workqueue users must be converted to the better named new workqueues with
> no intended behaviour changes:
> 
>     system_wq -> system_percpu_wq
>     system_unbound_wq -> system_dfl_wq
>

This seems to contradict the statement above that "after a careful
review .. of each individual case". This looks more like every system_wq
is converted to system_percpu_wq.

