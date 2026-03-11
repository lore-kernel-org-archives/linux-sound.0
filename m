Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5C537B028;
	Wed, 11 Mar 2026 15:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244736; cv=fail; b=B3vMZb2UemXBZrvxrITWEmKMmodlbxi9iDymWOfgZbEA5HPI0QI7nXVfhTIUTqZIVep3s26BP4AtXQkPAuDNrRNgCpRWbLSv6nDAtzwaaAAXAa22wWPV5xl0zlc4f+Y/IOsVOJNLc82JsmTbnTHMtgWvPCEgWRBJmsNae6UmeGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244736; c=relaxed/simple;
	bh=EH9SOCsb6oT6k1SacHGWn/lmLuh0s4mSymnsoC6tSo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qd95i1Jn3ZR1cmDHN4pU/Q+aFVUHxsX+4bBioQhvmUemZyE0A0WZpMThwtB6NZEjfyHEAaHThNGSoBdQ1Fg0mftXLfr+3MaFde4TCUN4vagw6ieuupIqGlMrB4Qn85CvLSaeSL9sL+0seTafHTTVOlfdF8ZKVYAv0+j7H/fukXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=G7fWGwD6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PutZLt/q; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="G7fWGwD6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PutZLt/q"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ANfPO51124422;
	Wed, 11 Mar 2026 10:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9KUgySjJ1PWPPQ3E9/V52M/NORR10J3NNPF4uxx9G2c=; b=
	G7fWGwD6XsGGZsUp9Xj++SWpvZupOECmVMK/pGmZhTh7q6R3RIDQE/44l/wrVQKc
	KsU07e33RPbmPngqqqL/EvT0Yi/1aWhuV1ed48SrvlevxaGY7KqfOJcZAipVO3CY
	b7LBELMDQBIIMgM1X788WyZcHKrnRMDjWdHg4JvYJRaeUwIpvVGRoTiOlbeqTKsj
	f1MnIiOarsA1VyKbDYbFYfbJqzLofSzjvW/SLL6k/4EknvnylNp0fy4KrVRxtofT
	9kfdZ4V58WcQ96YFgoLDuvZ2tIcOIlG2Ni5RF9XIIuWrwyTstAw8hkpZhrvLlsid
	NarGzZ63DkhzPUTjbB3A+w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021102.outbound.protection.outlook.com [52.101.52.102])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja4dfsj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 10:58:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpeA5HMNoLkXRu4LH66BbEdr98jN/3bG+eH53xTYy5dOOC9bexNG3VqijyinqGnrFz4fU3YzIQI7O2lB+4KXa8DiHjczBZzjOXdzGJFvuna6oqrNoFmuLZ9iYZV4a0cn/yl2WZQIfTL5GxNGOqvVJSXsOEo0WIfzhZfr6T+kdl1MGjiH8fjS+HMiQlG/OiLxpUn0OF2W+I5yk+ZcY7hNNuZci66Hp7KB6tu71YBlC4M18EtZKUWwga+tjOcl+KCTqJ4SWFmzxnh6fBMdUJPw/483Qpr7JBY85Crrj9ncrS7Ys8ES0Ug3YtdaOW6O5lT+wfvj05XxPZMCx+e69LEc2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KUgySjJ1PWPPQ3E9/V52M/NORR10J3NNPF4uxx9G2c=;
 b=g9Ar1PwyOwTNiOEGY8hFeWB4SHBt1bL5kZ0jC6NbcBhlFgITGdAhZxDrugFWoPg9UWmHJ8+NR5XLYL9HFAYjr8S08X6/8pke8/m/WoOo4iju699gR4Yg/F9ZWsIzN3DY5hBd5TEO65EXdQ7UjIOz7IDtcIXVHVsOePfUbU0bKH6+nvY/JMFQhSa8vdcwovy129uIJMLcv+KNSnYguUEERwn583FIll5tXYFYaqoEyr7Pf7tC8lYS8QdVEhY2OEImNthj4Bbo4p31z99rxbe+AQ9OgpdKfo8PEzop9yYEmAeceeqnaZ2ejuQqoYR2RM1DQF9zlIK3Mx6CMQzfqo73yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KUgySjJ1PWPPQ3E9/V52M/NORR10J3NNPF4uxx9G2c=;
 b=PutZLt/q9Zh5E07jShUs5apL0vhFAiMKoecC/ebS9JhsEfVfix2lYZ9qZG/chccGVncTQZVqoamjEbJdkdSQxJSyg0cblG6Ms29DNAmca6oxHJ6APVH2E2iYg+F8yodJADw3Or0/PcaYYRUMAlG3WsR7zYmdmauZYEh5qSBRRFw=
Received: from MW4PR03CA0235.namprd03.prod.outlook.com (2603:10b6:303:b9::30)
 by SJ1PR19MB6356.namprd19.prod.outlook.com (2603:10b6:a03:455::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 15:58:37 +0000
Received: from CO1PEPF00012E5F.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::cb) by MW4PR03CA0235.outlook.office365.com
 (2603:10b6:303:b9::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 15:58:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E5F.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Wed, 11 Mar 2026 15:58:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 609E4406542;
	Wed, 11 Mar 2026 15:58:35 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5237582024B;
	Wed, 11 Mar 2026 15:58:35 +0000 (UTC)
Message-ID: <c6b8c5e8-fdb6-45a9-aaab-d028e87a90ea@opensource.cirrus.com>
Date: Wed, 11 Mar 2026 15:58:35 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Support clock stop mode 1 if enabled in
 ACPI
To: Mark Brown <broonie@kernel.org>
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20260311142153.2201761-1-rf@opensource.cirrus.com>
 <80ba7c33-7949-4940-a72c-582ba749b2e7@sirena.org.uk>
 <efbbabe3-b42e-4f54-bef4-d27744f4309f@opensource.cirrus.com>
 <4976ec0c-f4d9-456e-81a9-55fcafa30b9d@sirena.org.uk>
 <7afba327-89b6-49c0-ba56-83da00e0d51e@opensource.cirrus.com>
 <5e12ba28-de41-466c-ae58-aaa32c72955b@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <5e12ba28-de41-466c-ae58-aaa32c72955b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E5F:EE_|SJ1PR19MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d03758-54ae-44a9-84a6-08de7f870e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|54012099003|16102099003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Jaee2E7rbPR8flUb2+aacIBgRHI4xEGGFf3CZOZjujekVy8j8fCZJPkxJMjuCgsjPmJM+tK2Q2q4Z1OWQLLZuiaJYOxazMqZh0RGeVB8nsOvfwk5w3mo4OZB1gQEljlQfhlzqZj2nEIviUNyruVLY8z6d7/AX7NC598wZluc6CARUVumezClC77CGfz9mBuarOnU6MpLWRo+iG/fw/Smponl6CnZU4IGROAx2ETQ95E9pXSqkYDv57U1LsU2eamLvOQcjN8Bt63/ylsDg7NCUQAncIZz19GyOCBscJmY9nbNAj3XuSpet0GM2G7FZGDKU7mDOSZH2jZzEznH5tA7avXjDeeChyr9K18qW8HWLLlwpxOxYb/M1OHFAEJiGrI6lfHlw6SyyIqd5ghIh/hnG8BV0kdsgAgt63xNeO/No7JqZgsCEZbc8dXgNQ9kVOaQEjJrV5V7DDbHQcmw4CDd5vCa+i9ZCk+XhkEES1bCVowBLbPSk7eCpRgQGEf9pCSkvV4D0170s8IAO9c8reqOU+4Mn/cSPQ/9DHbPy0oA7Ot8rz+O0yS9qeP4+O5iRxy9DbQkNNlgD/cQ+HnTsWhXXuWreUBS7VHXLV1CbFQYcBK6UHZHgehxOtHszZazUZFOTkaWQFn4ONY8gZZYRc78YVGuWwrb/Kwooom9zdeLumLvuJvULVMZ0s61zJTNfC5/Ze58H4LAN00B5OqomecM/i0nGIQmAXnP3aCx+EGCQhyoBP5g3iCRqKTc7K8NhTBCPJmiipeZJ5wgTKeHSBXyZA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(54012099003)(16102099003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZDmg64R02+FAtaT1xqPG33EmzR8d099VnZtHI8tcnLiGSnjZ52sZOiXw9VKoJbpGdYnFIv7mejtYOQ13VwxMXl02f3XRJtEzP5Qek4yidiUMKl1QUrXrBfyDGCkzwVQA/FQ9oiWJMrA3DwUypEMrOTHvCvfctm529NkOq0qQwAAJN8FqzbenY4kNrh0RhWKIKBbhWmOGyqRHuk/H0UbGDNI3OZYmv5hpvNHBR4wu9naebk1Qtw+SvEMYhNgHOCRNq/2dYTvf4D0vid+Q1a0jaLXWIbwp97EZIPiyFUvGSF091aUcjRELUyXpWW59Ql27C0gkWUrlfsgcel0Kz9WXXjovDhg/QEapMYJY2LdY5P4OfCno2O+zOakXqVbhN3inpnSmg7MolZLYZzv4CGvIN4F22opATlpCdUmIU2QHWhekadYE8sTNmqfc8nmzfkst
X-Exchange-RoutingPolicyChecked:
	DzsxL6Tgc22z39T+x1BbfTYNZI/MrKkkfersNixI3SNl1+CsyVI0XfrsNrpNVB3z3R7u+bDrwc73e5XXksGiRrEGUmaRQC3vDxO2DCJVfANx5V1Q5S2hT4BReIryv6+cPVCm/Eqdga/SJ0CcEfTaSSjM1/b1eO+XzaUbqxgOcW2MnQqGZEff6F01v1a+JKn/OYVzlfzF5iv+qdo5lrFKiqapkx9sWXpDNqowEAMzxN47yW9ktlxqIlghJj0ZRFszHEVoFMm2XV7xMrnpot1OrvYVTJnwdL2NNliuYz6oHXy645aqVDAovfGOJcH+zOKwA36ZwVZvxzeqWX/fEl5ysg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:58:36.7430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d03758-54ae-44a9-84a6-08de7f870e4f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E5F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6356
X-Proofpoint-ORIG-GUID: xiNz87aXkVHBJJmXDaqqlIoomNj7WCtP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNSBTYWx0ZWRfXxQ3yEOhuy84n
 Tr2C73QVkXMyEaJ9t8wdQnjRNp1wyZjZaNHq0JEO/wWmYNncL+BXOLDJhEc1VVW2p8BZopWqFEL
 2aYSBStvH9EVf4VEzcD8npwQg1XXHhrFSAeQwfu7rPGIt18tIH469kmCa/fHeHyX/+Fhy4DJG6R
 1MiEO1fCPkLpAR+mXrkmwYu4HoF3MAinl4cjhTVzmMSd6Qf/xf4CrhCTghprqomZYX6B1dXxJo+
 CjiR/AB2Yl2q0iaw9UAW6Zu1FXENJhK0m+wVNJaoTG2UWL2OfhIQZevlhprcOIecOO+1H2TgRsW
 GrwRT6DUqh5Z3iWwzT+CQZVMGLuT+SO2VTm2WA4k6rCSWlKcRAyjtbcGr8hJNYJAC1X6mOk2owT
 QBrLrxRmKIKVYVh0K3E3kXP2tyM8+9bYjviQP8HQCK2ClgGQVwTZmP3G7kIxdQVXobOdx7YytSr
 Hih6zO368km3lMRY4YA==
X-Proofpoint-GUID: xiNz87aXkVHBJJmXDaqqlIoomNj7WCtP
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69b19137 cx=c_pps
 a=DtwdgGxVrw5JanCww5rNYw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=c0_EQki3K0fw72Fa53UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 11/03/2026 3:50 pm, Mark Brown wrote:
> On Wed, Mar 11, 2026 at 03:34:54PM +0000, Richard Fitzgerald wrote:
>> On 11/03/2026 3:30 pm, Mark Brown wrote:
> 
>>> Hrm, OK - the property seems to be confusingly named and defined :(  Can
>>> it have any values other than 0 and 1?
> 
>> It's part of the SoundWire spec. We have to follow it.
> 
>> The current spec says:
> 
>> mipi-sdw-clock-stop-mode1-supported
>> This optional Boolean Property shall indicate whether or not Clock-stop
>> is supported on this Device.
>> Integer (Boolean)
>> Values:
>> False (zero): Clock-stop mode1 is not supported on this Device.
>> True (nonzero): Clock-stop mode1 is supported on this Device.
> 
> Oh dear, cute enterprise nonsense hacks :(

The ACPI spec says that each property must be a {key,value} pair.

If you always need a value there's the possibility that someone will
create it with value 0 and expect that to mean false. So relying on its
presence to indicate true is dodgy, safer to define that the value
has meaning.
