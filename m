Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F6947278D;
	Tue, 18 Aug 2026 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060000; cv=fail; b=qMWjqpFDO2ZWQVtKYgaGyeUHBE1ic0NtIEkBJKoayh8UmUMQ7BEo9PhtzJrY2lGQJT5Mj4Lxh5P2/lslBUQdFvjeR9XXXzqGxlJ/BGFlXDG3zmTsTBX9uX4uG16PD5PGxdp2QX08kj+LrIEl1Rk1PoMYElYEJOtZcZsKAfdIrOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060000; c=relaxed/simple;
	bh=LfzWlNZTGo9scXcM/fy6Y2K69db+2LMHUdmTiIyjsE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T2y3YF+tDHbSxaOR/d5lxpV8By5oRVYNjqFtL9r6u/wnfmGxdDJ/XuLLBfE+O1TdB2Bt7vWboUocwGNzT7D8j5nOvlvfObvkGHfI4e49P6NcAE/CH06v7xB8a8jVmNwfQ0iJzT2Dg1CeLSXChtvL3SqaFepiat9vOg1FvPgqawk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jYr39E6B; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=h542f1j0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jYr39E6B";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="h542f1j0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I610uj1808628;
	Tue, 18 Aug 2026 08:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TwPzftnznpphE2b7vN3aQ/wOma6xk+YmbBPekZqrGus=; b=
	jYr39E6B5hxkF75UpXh1ohEWOatvrBbZrfD8WrmRm5TWpsck9X2bc1Wofh4BdqmL
	SbEjIo/Btq8nF6gxwRj41oT1XWCA/yTtFN9CEtXCS9uPxXu5HW2euuXFvn9nGTHR
	kVPYqevfjNGQd7zMvHVan84yZ+/KYIzgBv3aawBW+iU6IiHehMlUMdfXCup2eJGh
	IpKIDq8PMtH3iXVFY9sXrRX73kd6ErpJ0lRq7EauWEFoAyN1BQM0GL8hBNN/1rs5
	AhG7K6iI9lr9IY1w/LLfSWkbEGz4+Wq19a9iwTlvM7zYK2fCa+qBJdvQYrlvKh0O
	O2FrW1Ty4BfgeTuicUDWcw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021082.outbound.protection.outlook.com [40.107.208.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g2mhev2t7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:33:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHckvJcgUPkKXioScFu+1+JzUyDEdkc8ahsW6dEaovU04pJujqpG9CqIgBe8/XxBMDUN8hvN/LVKGCeNxPVx1ieINxDBak0piAl41naz5mY4OtCH7OUrymi4ZkuLJRWrVzpScvWT8M/8kLuls1Nz1+XWBmV+kO6Dbj88RVN+RiMVIDQh7L9j8Nb70uIk6z1HH1Tp/lPSKHx2ZHwjP/oi2SnHco3lsgZYoMdjC1AyvTKL9GkShmJ5OzIlILh8xJJT82j4D025xO6zYE14R16btYVz2ZJZU2EgZ+tVTceqJRw9R3z5HMezQ5QIUTG/Ajhi3wzCEBlYpTsWrumLlvUvjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwPzftnznpphE2b7vN3aQ/wOma6xk+YmbBPekZqrGus=;
 b=V7K0DrgzNuMkuRoLoLzMI8X6WNiEVjm0nd33q+x4zlCgiyz/8BZFR+S4jj2SpaE9KnontoHQLJuO+oV3mnf7wjEX50iHuAVBVgWEZ+5VvVpBe7GjyAQKzd/JEbBZ+YIwxNIhk3SOLM61bdK9lpmqfvCn0hfO6GhTFkK8ijQDRhffYlQGlYB+PZZsH0teZfOhDj3eo+6DkGSGFZSWO4zUu7wdDttmHLWFlP/T46ubPv02sFsZk9u4KmQJT6gxWV65/AFoNh2wGcueoTtM49L9NS1Mk31D0pLqh2NlnidBOWuiJsmLAmg7XclJky/+/CHJFAxVgArO7nqVx68YhMOoYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwPzftnznpphE2b7vN3aQ/wOma6xk+YmbBPekZqrGus=;
 b=h542f1j0B4WMOXljprKs4QYNBh31u6ke+4CcKBn+iSZCXcgeWkacxNdxE9BvhcmunF6AqqARToVFpfIeuibCzAHf3rMcx1/zm/1tSIsVzA9XhUDi66VQNbRsDJG1yx7dnngBuAVqeiyZY2o4Ilf/7NIkWbDSUhSMybw535q497Y=
Received: from MW4PR03CA0294.namprd03.prod.outlook.com (2603:10b6:303:b5::29)
 by CH8PR19MB137164.namprd19.prod.outlook.com (2603:10b6:610:31c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 13:33:10 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:303:b5:cafe::e) by MW4PR03CA0294.outlook.office365.com
 (2603:10b6:303:b5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 13:33:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Tue, 18 Aug 2026 13:33:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1CAC0406542;
	Tue, 18 Aug 2026 13:33:08 +0000 (UTC)
Received: from [141.131.136.144] (unknown [141.131.136.144])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3009882024B;
	Tue, 18 Aug 2026 13:33:06 +0000 (UTC)
Message-ID: <e3d9a8fb-cd16-421b-8749-250bf4229b65@opensource.cirrus.com>
Date: Tue, 18 Aug 2026 08:33:04 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: cs35l45: Adds SYNC properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260814223456.611160-1-rriveram@opensource.cirrus.com>
 <20260817-brawny-smart-dove-85e4a5@quoll>
Content-Language: en-US
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
In-Reply-To: <20260817-brawny-smart-dove-85e4a5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|CH8PR19MB137164:EE_
X-MS-Office365-Filtering-Correlation-Id: d10d2af2-ba9c-40d8-1cac-08defd2d3e89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|61400799027|18002099003|16102099003|22082099003|56012099006|3023799007|6133799003|11063799006|4143699003|10067099003|4076005;
X-Microsoft-Antispam-Message-Info:
	dnJC5mPs0/zAQGuUGIjmTYibwl4WN8J5KNUg4wu63Rky5dB66YWCst4gk92+UL70hP/joJqee6KYPE5gjUSUdVxNx8l2Sn03UBaGvPswXe5RaZXE3+FiXQp6kvhtaWdxbaDS7GdAu+nXGQRR1Lk/b4gG15iXFEsWanjv5OgtxAa0H3C9uNPBbb1UgxCVCEGPCGrz3SXLWEBj2QURXtKcmjwwjeXpa3QfEJYmlds1Z9DOfYqcRp4fs/DltHNXO80DmyfPCP1TMXByCDYypiiWRk5ejewAtyYZlIQ9T/DC2bVe4D4oVIWNxIc/jgmSI+udRXkeKxbLcpxKIdPu+pGozO1Fbblu6KY1XXgGpEqmuu8Cps36yjwBQi4hbwa9l40zsB5W/S0UUkbKp5FUFsiECPqh5SnXx8H/0/d9WlXTUxzzF+fueIWyE2aREcAcSW9Aq6Bn+c1WCsCFgFvHkQq3qlvhUd/rzjmSd6O0FfTedAteO68n5On2vyEtB+0hzN1UdnsHXK5SDy8LYCzGTGZLZRm2spoTnDye5muIbSxkQmCFODoF4rKmIxm7tLO82X8nXd43h6sxt1EyFqcCP/NESUbN/yU7aFH67YKXSISzMo6zbAHFetQ6dO8YIBKqsFWOfbwfnea2j9eUA1PCY1nZsWM3J5Ue9moTupc+I0RuTmdegLDBPP+0LZ8gm1qpjwMzXn4ci4gvTcsuV5XxGAsGurE1nFWwgY3M9N+QGfwmVJfbggT78cqTRk421Z8HBG2C
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(61400799027)(18002099003)(16102099003)(22082099003)(56012099006)(3023799007)(6133799003)(11063799006)(4143699003)(10067099003)(4076005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OdxmTwJ9Cx2EVL9fi3EcxUBn9hUrQyOCSwAvGVbvZAql+itc/qSJTr7ALdlspvv8uJ5KsXj2MWPhBT2mmOaSqvhuEZ4mVBehheWfBXsMDA6ZGsX4cLBAZ6/B+FC6bph3UjfYjkkQnub25iRBs2g52rFiPlQ5bM7SUW+FUBz0sJ4j5ci/dc/Swj9BhopZmNMw+D9vcLuj1gc+5jFQ3G9zgXoJQTiDtj1iVSKBtEehGMdszca4u8O6dW8TTxAR6c9R6sJojD0uHMEfcwI2puLVVnIkeetLXolDuA/ZBKNTsXAy29tmq7kH03BEono+wzHqHMIlVHR8VD2DBdKfkHA1nBcjPlqU/9fJO/u6uruBU5wTNDxPHDGpWlC35A/x/QVmiJLMDUhzMRwaL715ZOggwGnBIIsMP0K0TFUi+O5dwC4rpnKImm3zjkD8Yj3J0gTW
X-Exchange-RoutingPolicyChecked:
	VBUvqnkX1QC60byA5Etrw2Pk0esR7bbteWTd/inpMZNZbtlsMqfOuZ/W4dL3SJmrvd/YYNFU7JLNBpKK39zvtc4LVQMUN6d6TrS8dItUSbZ9QfVypqpoRU+d//z6KAlDU0zG19EjU+xlM9us8R6Tlupt+YxfET1JxDrpom3QwaNIuyfjLLuj56Q1YkHmqrX1BNcQM7f4iz8WivokM1AAE+nsQugozeBq5Byv0ctrwWOki2PwCvazHMSUxEQ8N883KfLX9vKBrovh3VLUDmrxYrxm3C59KKb1a3crRBCQxqA8vjBjcTgqnt1I9/qetWqhsnd8xn2Gh53tXpKS/DY0sQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 13:33:09.4540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d10d2af2-ba9c-40d8-1cac-08defd2d3e89
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR19MB137164
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEwMCBTYWx0ZWRfX8pmk+W5ibCA7
 RKqtxsM4vUbfb3QmDEZ33HWXqEvxmxAK0dMAFpIHxWobJ0S3ZpS0yvDxS+DBh5Rg/LZGLyZBNee
 dDWUdz5VsrIB1/UOb3w6niHhX0NJ/OpQDcv488x5z38BsgfGEy8e3dwX98u7BAP11V6j1L5dQQg
 bOmvMlEEkmddrcoCn0MMwuweZWf1Mni908Zq6DlqSCDla1KoUE8yoGkGc7mpPdMp5K2tU1LEUz5
 7lLTDoE64p4jNXqKgeArxwyHAsqM9o/YqLSzl0uq0Y440APfq7XiKeewiBCtIoVmdq5giEzOU7q
 HaSyNp735L050m0Iyi67OapYBNWHhSY2d54c8PfA5oHI/q70svwQ/gsSC5E0JGZzktagsESX00y
 jgp2dHSr5f7xwPnVXnbe6XbA6MsOHJlyn1Mlnc/sVTv/2jcrVcNrp2i1RD6TFjy43Dp69xPPrlo
 5WOL7PMjgyPjZVsl11Q==
X-Proofpoint-GUID: B1InaiiaTcdxs1qaUlY3_fL0ekLzCULh
X-Proofpoint-ORIG-GUID: B1InaiiaTcdxs1qaUlY3_fL0ekLzCULh
X-Authority-Analysis: v=2.4 cv=FLMrAeos c=1 sm=1 tr=0 ts=6a845f1b cx=c_pps
 a=Wfyg2MIdxp6jvjeZNnPfXA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=gYQhRmEh8N1aiKkJ3fEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEwMCBTYWx0ZWRfX5zflRp7EdQf5
 YJLXPbSQfvTN0XBCYV6/ab357UL2he+Tm+oVqmb+4XdxmYKhQNVpn2rXuqgPalyCYE5Iw9pdGu4
 Jvi9Ib69zgq7lXPcfgk2HFHb+3ClzNk=
X-Proofpoint-Spam-Reason: safe



On 8/17/26 2:39 AM, Krzysztof Kozlowski wrote:
> On Fri, Aug 14, 2026 at 10:34:52PM +0000, Ricardo Rivera-Matos wrote:
>> Introduces support for the multidevice synchronization (SYNC)
>> bus. The properties introduced allow for the configuration
>> of the device's transmitter IDs.
>>
>> Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
>> ---
>>   .../bindings/sound/cirrus,cs35l45.yaml        | 27 +++++++++++++++++++
>>   1 file changed, 27 insertions(+)
> 
> Sashiko comments are valid.

Sashiko contradicts itself in its own comment.

> In Device Tree design, child nodes usually represent distinct
> hardware components, sub-devices, buses, or standardized structural elements
> rather than serving as logical folders to group related configuration
> properties. 

Emphasis on the buses part of the list of things that merit a child 
node. MDSYNC is a bus.

Willing to go either way on this, but I do feel it looks a bit tidier 
and follows the pattern set by the GPIO nodes already in this DT binding.

> 
>>
>> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>> index 70f6c62aedca..f64ba8c872b9 100644
>> --- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>> @@ -53,6 +53,29 @@ properties:
>>       maximum: 3
>>       default: 2
>>   
>> +  sync:
>> +    description:
>> +      Multidevice synchronization (SYNC) bus configuration
>> +    type: object
>> +    additionalProperties: false
>> +    properties:
>> +      cirrus,sync-lsw-txid:
>> +        description: |
> 
> Do not need '|' unless you need to preserve formatting.

ACK, will fix this in v3.

> 
>> +          Transmitter ID to use for long software (LSW) data packets
>> +          on the SYNC bus.
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        minimum: 0
>> +        maximum: 7
>> +        default: 0
>> +      cirrus,sync-sw-txid:
>> +        description: |
>> +          Transmitter ID to use for short software (SW) data packets
>> +          on the SYNC bus.
> 
> What is transmitter ID? Why does it differ per board designs?

Transmitter ID sets the arbitration priority in the event two devices 
clash when transmitting. Higher priority device gets to transmit and the 
loser(s) try again later. The winner of the original conflict does not 
transmit again until the bus idles (all losers have transmitted).

Equal priority by setting identical TX IDs breaks the bus and no one 
wins in the event of a bus clash (never desirable).

If the transducers are dissimilar, then a system integrator would 
intentionally want a set of these devices to have a higher priority than 
the other sets.

> 
> Best regards,
> Krzysztof
> 

