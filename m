Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215B117BA6;
	Fri, 19 Jun 2026 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781876037; cv=fail; b=lloOFQWiUMC5Lzgy+CsB5Xse8MGkNJghsLUiYMyaGgsG3ujP+Xz6iXCGXgL8G3NJ3iW7bdytBy9JcawbhbEwgOtEG8GO95/7ta6ynkHM7qgjdiDULSVCrBu7VKs18QGBLqDcw3/yuoR/MimLsDprrCmj2IrrOHNsAQEyvx9m3Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781876037; c=relaxed/simple;
	bh=IAfwzz5aF6AgOUtvFeVkh6m2Sko/LQ3q81iQsd0+dE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dipHrRnmqW03z3pR33paCYTu7ZyXYUKPwzXSEpYOmcDH3NFyx50fBZ4/1W8wk5mnLMsVXnmNl6oBoNQz6Sqwr9oH2j0MAiDDLHbPx4w4gJNGFF9P7KEw6CRBJ5lQvN/pLkkPib8WrxbL3SUG6sy85M1gkVDD25DMl6Din+jxpyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=m9Ryj+qE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=r1wAmvKO; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="m9Ryj+qE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="r1wAmvKO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J5iuYf2664720;
	Fri, 19 Jun 2026 08:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=VeQc6402iIa0FN7fqu6N1OSBD/TenBHAmszswCRh7JQ=; b=
	m9Ryj+qEQSL3dW1Bc1p2OdwdYP+OJ/y8aXGI+9s5RL/2y1LrkSFfSoBDcavPWyt0
	wQ8+0LaOLE2O6ZdgyWqI6/s49inb+eIWowiVWWEspUotAzdDHTXwq66ZUpW7Jvh0
	rZ6tNoFTE0OLZ68sTeaIFjn8a4sFz+yh6CiwAOLzHGY8y21T+t/jfpg0KXuv1mZr
	MmWQpqoon3M91AO1QnlVxLOui1KLWE0n4w6IeNsTRr01sbchaR/olw15rnMIs9a0
	nF8rUBINw2vxrLpFhUU0o2y9m3w+Obhj8npwsQrIB8Q8x5xsgJ9zhj2mTfT39RNx
	sPwVl9GjgiSGX/Ods7JQig==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023119.outbound.protection.outlook.com [40.107.201.119])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4eueefvf7t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 08:33:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LevXYrkbEUP/CBJbyc7cMN1EcxxGZ4UfPP0+l4duoPzsXAosWzkiMii88RpmRXlAgROSQVvuvbqkWzGTJMsDzpKLv6Tqziybw7x148OFHb8oZOh0gk5uEexsyDYZqPqlJhIM4MUPAXQt5nkV9QO1u65/X9QSC4fV0+gPTqkJGiYEy+5Ri1XIrS8jDQ5+zUg5W0nbX5e4hds1D/L/izSRDxprMCAuxCoQ++85KIrDIXQaHPXhQa1Pr2Da4pzDHMcGb+iaE5IjIsRINjgIfU8fUpii+28pWibJ91VUdprpY60cn2rOa6klLHoOb5O7yN0roBym7C8H9GdFPP+1l9u7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeQc6402iIa0FN7fqu6N1OSBD/TenBHAmszswCRh7JQ=;
 b=skKg/8oAThAyQSGXsxyW/H8a3IdtyBiBLZYmH171Plfdn5VncNJ8W2z/+zYH/E/Q++KXrQPw4bb1kFhQRDRPwk8jBMICMYr7a0H9sC8+stcfHBr+CYaXA55r6alyx80u/GBxGJJ7D+bMHgctQEOnveJ0qftijgsnXwJmOYTo56DC744aKgtHwbdUp8ihQusb1DfG9QSGrxamHmPHUiAh+nuSfE+ACN/HLlwXGETp65Or7pdtK0D1s9Kr9SURTiMNALFrxPu7Hvy3tRq8kP8DqWgsFJ9f1CTezgB+gDqRzhSJziINcE1SKkh7iPJ/8tdehjnfeoMui0IMO7TUfFyOGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=broadcom.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeQc6402iIa0FN7fqu6N1OSBD/TenBHAmszswCRh7JQ=;
 b=r1wAmvKO9wUr/PCbimbEWOYQsrg67NIyRh1PhpD0H1+tYTfZ3IK7Glq6jiCG+WBYiY0UVYCaEYUqItLR7YHIMyVHjvOuNs1RemqxhnT+xSfMH5QHyGzs/ftEErRPRusthBEHS6SJ9rMItzndlGwOXhSa6TaYIT0hEZhGde8jXFo=
Received: from CH0P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::28)
 by SA0PR19MB4539.namprd19.prod.outlook.com (2603:10b6:806:bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 13:33:39 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::77) by CH0P223CA0018.outlook.office365.com
 (2603:10b6:610:116::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Fri,
 19 Jun 2026 13:33:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Fri, 19 Jun 2026 13:33:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 15459406544;
	Fri, 19 Jun 2026 13:33:37 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C5DEA82025A;
	Fri, 19 Jun 2026 13:33:36 +0000 (UTC)
Message-ID: <7d97a6b2-9ff8-44bb-977f-c87deb5a3e88@opensource.cirrus.com>
Date: Fri, 19 Jun 2026 14:33:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: soc-core: Create device_link to ensure correct
 suspend order
To: Marek Szyprowski <m.szyprowski@samsung.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Maxime Ripard <mripard@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
References: <20260611110856.1088110-1-rf@opensource.cirrus.com>
 <CGME20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57@eucas1p2.samsung.com>
 <4c9156cb-6508-4fda-8e36-7edc4eb7d6f9@samsung.com>
 <b9e3f7cd-2329-43b0-89ca-0243e4916c16@opensource.cirrus.com>
 <c29c5ef0-cb10-428f-8ccd-8a84195dd504@samsung.com>
 <6af1deff-8d1b-472a-8ef3-04f47321689e@opensource.cirrus.com>
 <4d8b5ea3-299c-4a03-86be-696ce51afd9c@samsung.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <4d8b5ea3-299c-4a03-86be-696ce51afd9c@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|SA0PR19MB4539:EE_
X-MS-Office365-Filtering-Correlation-Id: e89b2ec2-4932-4303-ccb5-08dece075ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|61400799027|82310400026|5023799004|11063799006|4143699003|56012099006|6133799003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	wNi+arbXGogJAOKsjuRx7O+LYcy0B18N5C8cQpDwWwOnNv8Ipz4oCP5O9uihVmE6R5wApizdyGCBjYNbKQSv9lwu51rfQuFjl6LAFPzfrdUFtJJIi24mPcCbMMp+BCNdi+xDMmNZBCdhyrj+nFrGlmQLbxI4zu/TeuBe3riQOiSmdFpjcZHSA5ztjHmai69REPXvB6RQdtqiADmZqIrfLE2pU+Kn4ENVDWKzlH8cQ/wpPqVr3y+7aX/UypFrcC3AbqUtoKOLzuEARPXUrucUcUw7UpOJbas0uQdEyeakD4ahpTPXM9y8NM5mMmQyLPt9hw4/jKtSFLU08umLiU71Xe5yyfcpixXK3CJb5GdqpwYjmyYY7kwj7yANst65dkbsH7KlPrM6CIlMRJ9vkupniOqBzkJPgRkg/dwYXxpTjvKnaJABbV35y8y5StwtFfi7rjkp/AfwATaC18EO9ISz6MEzDGPqUWWnODpL51xJk6CN0ZTlOTUOWc9uRTQDFQ8Zg5q2lai3kf8KjsmCg5PHsVrIt88DmxfER1ay7UlUdTiE5d87U8w+VYFzHCayVX5VRyhJYZ/v4VKpjGWj4hMt/glBwPqK9kD1YSyG8lxkcfp84BwqUKb2Yj2y+Biq/JeUibKiKLq5R6EeAJ49bA0MvQfRL2KlSaCX5BZozBcKBxgCih0G4L0AFvOUp0iMHUV0+H/rZeobI7kE2D2sJiLbpA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(61400799027)(82310400026)(5023799004)(11063799006)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3WFzBEJT/fgsSjY4jZdZ7C2KL35LhgN5PJLTPNWlTIXS37lazyD1mMfc7UrM7QJOAoQAQPKfXwSw3DZAqR6tueJkbNSwZzPvXEgBPeXJ70uIW/OfaBUOOTdZZTsQ63UboZaXuISJ5OZAPwx8Au7zEiqke1FpQOHXJ4WgzVcfoAcPXEXgQaLsvd5oCHpeo8fDVOy34iO3OJT+WsMEjgpdpqJueD0jpoZ4CUkb82RAbSSJng186MEVYoJjdEMzMWlyDEf85W8bjOVcq3TBxD16FSEonld6k44l8JBq/6WpeQRJ+O4r1nNCyc/ALd8lBvDPuWDKQ14lHArCm0fArCyoEOnFC9aMBlnB2QdpBaLXV08WdZP5q+vK334qGePTui9zhawzBfwAzlGXSWe7dLO1UggJIDyEx8cQ5LBnxkO1J5MJAOd4Irkuvmt0NidXNVym
X-Exchange-RoutingPolicyChecked:
	LTLv1O0W8OVd7YxmkGgLUySbMLUgnAjViyBbePphbovw1t2Th7T5RkZh6STToSyvlZKEc5lOtgcj1tPSexq/fEl1w8MR3H385wy9Q0j2QT5LlEeSKeZ1X+2kxHLW/1+PyxQGhFsDtkcjWbNiEidLueeGvWAE7IYY8RPVtMi5LEMZfKBNT0rivLhiJbYWX021zH6Jq9ZK0FdBpSMz1fCuXYwPEX5TLJxlXmaFlYkw2YiiaBjxg6Yw+kI/m1ZaraC0sX58S+TrGkKh5krB0tcBhVcudrbmzLdXY9kIPCMRp+0blE6oSdtw+u8UaFAlpx0mT97TqXJhgAS2D305YRNmLQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 13:33:38.4291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e89b2ec2-4932-4303-ccb5-08dece075ef8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4539
X-Proofpoint-GUID: MTVNlGhVIOkqt2FpGONS0UPhJzROpd6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEyOCBTYWx0ZWRfX80iFHK/HBgLV
 JPfzjZQFKhdSZrd46xj335nOJfUhWdyk4bv/MjLLAlJZmFzgXF33BR40yK5tsD9e7p+iYa+rhmj
 I0Qp8lLQxdMeqzAYJxWh9zQIzOFzGFsjoYGwnr59jMfeVNzCd1HHygel/gKtmRljIoUemU3Xjkv
 gy3d3eU4zXJrU8Vo7fG3YIQD7XQBJIrYEnosVjY89gVlw1FHWDaJvxkCJ2+N7pgb8XZaSTzW7f+
 MT7hqVmQ5PlpsB5sFHSY6VZZhjkcte6bc+eSQ6KHKqHJ8uk9o9cwRzVOk+nhLkHt2dquOmoPXJm
 RxprzAuqKtew4NTchZV8BrootaNnkasnQrzYzlJWOyfAM18CriI51i7fkg+y7KkVj6EnnHkMOON
 Js1+JjPklX+wjNrhExdb0ZaskmyWXnk5ieDDlqPFZS3t2Hriy6oCWkQIAZNyGoF+tN1hV5bnc3j
 8VYKjSLjig0z3GsTGPg==
X-Proofpoint-ORIG-GUID: MTVNlGhVIOkqt2FpGONS0UPhJzROpd6c
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a35453a cx=c_pps
 a=tazeFacR/Pj0MPaa4yAiNQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=IHYHXxDbC2h3vn60pN8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEyOCBTYWx0ZWRfX37SySFAFMGKI
 c5j7IW8FT6q1fuom2v+ZOcjjzy1V75EC+43Rr7J5qIVURibZk1Uv1bv/Sv9htv+3jzuvLqZwqrF
 Us5a4uRGk2DCoVsgBTnGdAbx3WCG5zE=
X-Proofpoint-Spam-Reason: safe

On 18/6/26 14:22, Marek Szyprowski wrote:
> On 18.06.2026 15:12, Richard Fitzgerald wrote:
>> On 18/6/26 13:58, Marek Szyprowski wrote:
>>> On 18.06.2026 13:22, Richard Fitzgerald wrote:
>>>> On 17/6/26 15:10, Marek Szyprowski wrote:
>>>>> On 11.06.2026 13:08, Richard Fitzgerald wrote:
>>>>>> In snd_soc_bind_card() create a device_link from card to all components
>>>>>> to ensure correct order of system_suspend. The card is the consumer and
>>>>>> the components are the supplier, so that the card will system_suspend
>>>>>> before any of the components.
>>>>>>
>>>>>> The PM core will normally system_suspend drivers in the opposite order
>>>>>> that they registered. This ensures children are suspended before their
>>>>>> parents, for example users of a bus driver should suspend before the bus
>>>>>> driver suspends.
>>>>>>
>>>>>> For ASoC, snd_soc_suspend() shuts down any active audio, which requires
>>>>>> that the components are still able to communicate with their hardware.
>>>>>> Previously there was nothing to ensure this ordering, because there is
>>>>>> (usually) no relationship between a machine driver and component drivers.
>>>>>> If the machine driver registered before the codec drivers, the codec
>>>>>> drivers would be suspended before the machine driver snd_soc_suspend()
>>>>>> runs, so that ASoC is attempting to stop audio on a driver that has
>>>>>> already suspended.
>>>>>>
>>>>>> Creating a device_link is safe if there is already a device_link between
>>>>>> those devices because of multiple components sharing the same dev.
>>>>>> device_link_add() kernel doc says:
>>>>>>
>>>>>>     "if a device link between the given @consumer and @supplier pair
>>>>>>      exists already when this function is called for them, the existing link
>>>>>>      will be returned regardless of its current type and status ...
>>>>>>      The caller of this function is then expected to treat
>>>>>>      the link as though it has just been created, so (in particular) if
>>>>>>      DL_FLAG_STATELESS was passed in @flags, the link needs to be released
>>>>>>      explicitly when not needed any more"
>>>>>>
>>>>>> For the same reason it is safe if the codec driver or machine driver
>>>>>> later call device_link_add() to create a link between the same two
>>>>>> devices.
>>>>>>
>>>>>> (I have tested creating multiple links between the card->dev and a
>>>>>> component->dev and did not encounter any problems with suspend/resume or
>>>>>> module unloading.)
>>>>>>
>>>>>> The DL_FLAG_AUTOREMOVE_* flags assume that they are being called from
>>>>>> the probe() function of that device. This isn't guaranteed in ASoC card
>>>>>> binding because of deferred binding. The exact behavior and consequences
>>>>>> of the DL_FLAG_AUTOREMOVE_* are also unclear from the documentation.
>>>>>> So DL_FLAG_STATELESS is used for safety, and the links are removed
>>>>>> explicitly when the card unbinds or if the bind fails.
>>>>>>
>>>>>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>>>>>> ---
>>>>>
>>>>>
>>>>> This patch landed recently in linux-next as commit 0f54ce994b23 ("ASoC:
>>>>> soc-core: Create device_link to ensure correct suspend order"). In my
>>>>> tests I found that it breaks probing of VC4 DRM subsystem on Raspberry Pi
>>>>> 3 and 4 boards due to an issue with hdmi-audio-codec:
>>>>>
>>>>> # dmesg | grep vc4
>>>>> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>>>>> vc4_hdmi fef00700.hdmi: Failed to create device link to hdmi-audio-codec.1.auto
>>>>> vc4_hdmi fef00700.hdmi: error -EINVAL: Could not register sound card
>>>>> vc4-drm gpu: failed to bind fef00700.hdmi (ops vc4_hdmi_ops [vc4]): -22
>>>>> vc4-drm gpu: adev bind failed: -22
>>>>> vc4-drm gpu: probe with driver vc4-drm failed with error -22
>>>>>
>>>>
>>>> Where in device_link_add() does it fail?
>>>>
>>>
>>> It fails the following check at drivers/base/core.c line 766:
>>>
>>>          if (!device_pm_initialized(supplier)
>>>               || (!(flags & DL_FLAG_SYNC_STATE_ONLY) &&
>>>                     device_is_dependent(consumer, supplier))) {
>>>                   link = NULL;
>>>                   goto out;
>>>           }
>>>
>>> because device_is_dependent(consumer, supplier) is true for fef00700.hdmi and
>>> hdmi-audio-codec.1.auto.
>>>
>>>
>>> Best regards
>>
>> Is the machine driver the parent of the codec driver?
> 
> 
> Yes, so this change fixes the issue:

Right. I thought I'd tested that. But I haven't got any hardware that
uses that "for real", so obviously I messed up my testing there.

It makes this whole device_link stuff less useful if you can't use it to
reorder a parent-child suspend order for when the parent-child
relationship isn't relevant to the order they should suspend.

If we skip entries that we can't re-order, is that simply adding
confusing complications and _mostly_ ASoC forces the correct order, but
in some cases it cannot and then it is up to those affected drivers to
figure it out themselves? Can we always guarantee that those drivers
will know which they are, or can it all break subtly because a driver
doesn't know that in some systems it becomes related to some other
driver?

Mark - should we revert this because of too many corner cases in the
device_link code and go back to every codec driver with a system_suspend
installing its own device_link to ensure correct suspend order compared
to the machine driver?

