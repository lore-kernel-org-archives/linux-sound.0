Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3056E2BE7B6;
	Tue, 24 Mar 2026 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774362273; cv=fail; b=ozp2lHh6Ca2ms9Ke8tAemJy4iiT2mUtAlNx/ROMb0iSLGciSKkO+hoB5cqdquPMsmgwYfZ1kegxvlwJCiWQ09P1sfIhMnzcjEx0usNyszTy7eIR93qnQO0TKvyXYRD+6tFRlXlBbTMLQ3zjEdnHQs7KCWDlPqD9txqOeKy+asak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774362273; c=relaxed/simple;
	bh=HLUv7OaN6PMzZRCoPPj2875ZdbOxA9TcnR6IF0kdYAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JzgfElOH70lXhdvE98WuIUM49q9Rhgprt9gmaSJpQFooJCK+boZkLalbRnpBfOrZnGIZOqkkGdCQYit1WAkj4rjWyjLXsvJ4/BbFWWeSCf9dmThEAdnPDvVcJKS21rc6akFtBLaJAtDhoZSfl03gWAsuBnsGy9rKYFKXM8OsjQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=A6cJnbKP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=i5/ojUzf; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="A6cJnbKP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="i5/ojUzf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O5IdFS1249061;
	Tue, 24 Mar 2026 09:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ezmVDleuFiVARzwRHEthUYq8L/XlxMFmKngF/ESO/wo=; b=
	A6cJnbKPfRqczRETvfcLBAfvdvvBpake5P9bB6wlhn5P3X2Y2qr7kzmynC5BhXrP
	xwz2tBLvZ4bNXzU9KX5XJXMVb9xqV+Ja/JxbMFiY7v97Y1wekux6h++5X+fHSXLV
	P6nQd+y6zGTtuFwtpFbrs6GSEx2BWnr/vl5072VcajOVCMB+vKcFXRWIM0b35EET
	AQ6Uebe79fNaOI9GkUVfuv0/73yQzAEtYjDeQS3+IPVe7t/jmCSl74EmixywK/1J
	RmGv/gZPInQZ4Yd7CT5qqLGhkwI7LbVJk5D7eaB8KSs3IrhT1b7wTjv5qvHjbkcU
	MeGvG/qGJlc+nwgGqPc2Ww==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023093.outbound.protection.outlook.com [40.93.196.93])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d1qrfbavt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 09:24:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n46DaAry0aSmVn4SbQbYT1aflfDuU4c3PPuHZ1Gj3vWbsB0ntXGprrhy0UFOA4RrfoNob6kN2PA1kdRkfMYs46y+0DsssgRc/T4Q33nzwzv7rEE2RHhFvaSxUFa0EXIS2qcYPFKRg7ckakvvySVbmTg9hRJoN381Cs1VadqWatyvG7vU2PqBofLq0g8YBOjzmkg2lhPFLxPBOP1HnOyEtGpHLAZoFzIca/hho2e2LiUwV5Leep6FNYB5nsjiODA207ZJ+1I/lPLg5S1CO2Fry4jSxQvFr4cmsk7V8rH0BmCnm2PiiRCPdJ8EyD0KpNeyb/1rYsy4P9pkjAwwgvZcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezmVDleuFiVARzwRHEthUYq8L/XlxMFmKngF/ESO/wo=;
 b=ijxj57Q6/j/wSTQzAm445abHoywiI84HHDZvNf/gh+k8rgP5N4LpalqSwu/HtgB7TLvup4gDm885ZLa0SVEF3ISTsvAs9Rjbrt3qTtbLlYFQGziggMXGyp/m/2HUuEtf40o0OfI+6eGhPt53VCBvFo0Vk9/4yoqhyzzY0+9lVvBAHw/BZphBzlwXwpS4h9oIgJZkRbtv83D4Dij4gSJurCiYrLTOM218T6uOLkmkq/Tur1zPUdisJTKY4rvL+vdjDQpWb7zEarAiSoC2s5istcLFeNQ21QubxperINOafcMGmesqv4IJUXv/qkQVzECbIpBF2/l5qYTKAzSaJd1LUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezmVDleuFiVARzwRHEthUYq8L/XlxMFmKngF/ESO/wo=;
 b=i5/ojUzfJhtkpni6AhyJD5cEvxZ3zpIXbg2clyZkMHjPqU2w4DwBVMsB9LL/F//KBPjZXTu8jRuTFh+r6Q4HrnOUry+w41s0s5JOwJarn/uiJqlyOXtzecQbKsqJoE5uvnvr4PSTMk0C6Nzd0I/jFn0Y3a7iEZ8U7+Bq5dl2bY8=
Received: from CH0P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::17)
 by PH7PR19MB7338.namprd19.prod.outlook.com (2603:10b6:510:27c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 14:24:24 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:11c:cafe::84) by CH0P221CA0021.outlook.office365.com
 (2603:10b6:610:11c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend
 Transport; Tue, 24 Mar 2026 14:24:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 14:24:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2AD4340654A;
	Tue, 24 Mar 2026 14:24:22 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0ECB8820247;
	Tue, 24 Mar 2026 14:24:22 +0000 (UTC)
Message-ID: <37b15eab-7dd1-4ec9-9439-bab9389f93f2@opensource.cirrus.com>
Date: Tue, 24 Mar 2026 14:24:21 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Allow factory calibration through ALSA
 controls
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260324110302.273983-1-rf@opensource.cirrus.com>
 <626b66fa-3f7a-4777-b510-18d0c0df3bf5@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <626b66fa-3f7a-4777-b510-18d0c0df3bf5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|PH7PR19MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 29eb2a7d-a3ef-4658-2f4b-08de89b10c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|376014|18002099003|16102099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Wa41v3mmmcoxJWaZI9YscNIE6mJhqV3302Olzv1KKFZXTVOyT3aNputFmwrlPyIetF1LCbvxR395hHYZ2hPaPI5Ro4J2Lq+9bSBnzMUZpmqAyXmZ7D9Tf3HfmPmtfqZyGEJ66YdLpUrHEWI7eaDiwK0BNBe/x+SQdKSO7+xburuDzgN3ao//pctT9w7ZTPpEUCJ/Yrxgw1L02Pwsqg6CTqNN8+SABF0NzKhubsiDBn9RPRDl10YRDQc0PWvx2wLvilSyivzGth9W+SmY2bbwFYE3/Iyh74kZUwl4IPVX/S9FHKvkEfkecRN/mW17o/YQOCsp38COnjQcksw0KTYY80T1KjR1GzZXYCLwYeFNuDErdOqQuVAi8G+8Ko3qiqZcpDS0VPAVxMBQHXlAp3dK5lf3MhfkzIyfmSrEJ8PoRR+2aBiLAMqYpY8YTN7M+3uklBTFe2DpNdqyuxUGCdTWxzhUFYM0w1vWco80FQVGPKYf1wNpoJ+08FRUgxfjongcqTX/eEJTDccxF4noDqnf2zQcAr/nX5/aH1uFyZQD60RPA+dPKhpddfWPtmQyBhWYs2l0h3cTINMyUxE0SGzfBEtVYsUgtb8xrrA1IJiY0a1HvxweX0+QKU4SWoAVlLmelAycrpLa92aV68Za+OGAdJ54b18QA2MnTyOFurQxhoLnZpb/4yXJ6T8Sj4Aw9yxFBF1D7zrGS3ECVss/cDXTqs0YrUe6O+7EvZwEQ8ev+uw7s2bbWl9jEYOFdC+c4FVku3+NU3kd7GYTxU8WrzDbLw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(376014)(18002099003)(16102099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dF5ObCPwUFVxjI/iPGGn4LHLt8c9jJ9g8/0lJ0B5t0BmrhlRGNBGwyDw2o5SSkm+McGeos8mJLFcA5PPim+2afZ26GtBOdPCjqwp7A0AwA4w0tzEJoUanzK1boRcNFgIISrTvquKgr8xT59DtidHjcq2e+Pv89sprpvwHqdfJkU4iNQfZlCBbE5tATrJnf6/jd76c2xp7rDDdd4mlZjZLncYkZ1KvP+ZgUfgKOJBUUmUVGYh8/Ptaq55gIfz0uEp4nW0sM0x3Zw7gqMJbBUnpl96WfQoFyVm42UyGUCrSNcXBAN2qwLI2boEoGPjUg5r0S5Oc33YrktpFbEKKcH9L7zpcKT4q4YUxn3lm8wmB+rvVj8IKrgCzwM18bP00WiBd6ce8QZRsR179YKi2U0UxSxKjfVuvBRi0GBXejRwHcS7ykhspK9vIxYWhz/m5IKl
X-Exchange-RoutingPolicyChecked:
	Hj4Y8CtUmCa//wr9usU0l3vSKfc7iJuo5rO3E0FlBGq5J/RX3819MYqpaEXwqysdi+LWHtwpj0mpJsnxeTvK//MTpONTsnJiDg8c4/VkmHpG2dkrGkp4bpXbF2ZHsydeSm/71SwJxp17h0Spia5zPkTK50Q5tsgabRFFwcHQHRzleHHMA8CxeXRPKsBKmR0atU26xALOmKMRjrTVGHGnlxMt7Z7SkLycJ6iz4eReNeGjWE0yIdgP2M8qz9Hxy5UbmtkuKcPYWk+ZAKXJOCpWjloHAicgLjItgf5zj/PmE9lK0dLI3pNBgKcN+dLr2iPKZQ35ZcUxtTInn2nxQBskSA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:24:23.6676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29eb2a7d-a3ef-4658-2f4b-08de89b10c23
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7338
X-Proofpoint-GUID: lbfIlshz5a3NHBwe1-YtphWKI3fUOkTF
X-Proofpoint-ORIG-GUID: lbfIlshz5a3NHBwe1-YtphWKI3fUOkTF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExMyBTYWx0ZWRfX85mJhsNCrwO/
 Y0EcVePmOeuy1GV61OdhmPs6t3Tb5iDTtb42TMoQg4N9La7PbWxyQJmrzMaFYhDzcvzcL2U2mQJ
 b7qkPkSDpEgwulaJ+neMhpyTzhV5IrIBmSCvvUvOk6Smn+PmdsxyieNwhGrO1Mh5MsiBnLfyaK6
 FBwx65XmhnZh2Y2m143YgWSdG2hAHzPmnPHxCYIlaGWTbItGs72/DJu/Gtsyazfd4FvY9pyn9c+
 745a8yXq7/YZOKfVEtqiOig/U1uZFTvMX4uGHgnTAbFQlE/kjjISXNqye6Y2Nr7cKBKRXCXNV+y
 V+guRQ7olnu0K+emgjnH2lkOaGYSsHQ3zFcfWEy2BTO1rgs4aHUD7IjUs2dOQ7QX8d1bz/A0JKu
 QdeURl3MVOV12Q27WMiWti00WMfgDISk9xNMxFAUKxh0pyZrNyRFjz9/3xUCqAowYWrabshrX5G
 em6I1rjbjyUytzylaUg==
X-Authority-Analysis: v=2.4 cv=FM0WBuos c=1 sm=1 tr=0 ts=69c29e9c cx=c_pps
 a=0mOrEJ06uaCo+Tyi64Ng2Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=fxVEDk3X0mPdAvRcBysA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 24/03/2026 2:02 pm, Mark Brown wrote:
> On Tue, Mar 24, 2026 at 11:03:02AM +0000, Richard Fitzgerald wrote:
> 
>> +static int cs35l56_cal_ambient_ctl_set(struct snd_kcontrol *kcontrol,
>> +				       struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>> +	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
>> +	struct snd_soc_dapm_context *dapm;
>> +	int ret;
>> +
>> +	if (!in_range(ucontrol->value.integer.value[0], 5, 35))
>> +		return -EINVAL;
> 
> The values range from 5..35...
> 

The second argument to in_range() isn't a max.
But if I'm sending a new version to make them volatile I can also change
it to not use the in_range() macro.

>> +static const struct snd_kcontrol_new cs35l56_cal_perform_controls[] = {
>> +	SOC_SINGLE_EXT("CAL_AMBIENT", SND_SOC_NOPM, 0, 40, 0,
>> +		       cs35l56_cal_ambient_ctl_get, cs35l56_cal_ambient_ctl_set),
> 
> ...but the range is from 0..40?  I'd expect mixer-test to complain about
> both these controls too, they're not flagged as volatile.

