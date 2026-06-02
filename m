Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF561E8826;
	Tue,  2 Jun 2026 13:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407306; cv=fail; b=qigqLn0Oq9frdECegQejp3/+QdTNNTXyypgETqLEcEPMqyji++WRSQ0xGn/wH6C0ZJE2cyxMQA+a7XY3LKvT2g3IKDDXo9Rd7sahzXT76eg9NDqi9pmGjhvem8GTwqsdvrMvfuDPHQW1e+BfrTbE2ufQavUQEcOQMnHESo5/V3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407306; c=relaxed/simple;
	bh=iuEeh6fz6jU7kjLPaOYdgtLQ/yzfpToV4S8ytDonYcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKKY2nSfhyybLwV6tzD5uSfYUKALimcTu2rmNUOFNovRBmU0eWQx2TkX2TKr0F1nmemy1TteBHuIKtRULkwedqkWqAWe42AuXyoDFLIR81FOIYGoceOfX9xGm3FUoGt4h4WrAA1Lsgw4e01538L9WuvlMpGNRWj0bMYtJQYrKFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CAx6emgi; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KTOZYh30; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CAx6emgi";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KTOZYh30"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652DHs71273872;
	Tue, 2 Jun 2026 08:35:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Fl5mYP/372tos55P3upXj8aM6NGoN4Wv5JFr66ha/k4=; b=
	CAx6emgi8z1hiwi1LqcAwQ2d0oROEpGOAqYrF4x3WuI1/XIXRv9CWahfYJ0EQf1N
	JLZU96wq7EVKpthE1vxPmKvgorUh+XVu0fiRbQdBOiJbd/DtPrprUd3rQhf1AUuZ
	/nZoO7hljXjATIcBxO54ZxsBTMYnWIBog5Uh5l3AdiIzz4N+bivyaa8v+BpSisnc
	MhVeUEQ93vW6bXtqWQ23NCGpNNnS71ivvclJMHQVsoj47krQj1goWH41rBekRJtU
	Da9bXJqIze/Ew4iWyEyIVjagILY64i0I9HHNGebVxccmEjK6vdd/HmjWFUXadGa5
	Qm9O3jg1114lUScBhgHxDA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021072.outbound.protection.outlook.com [52.101.52.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4efvagcc1p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 08:35:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orNtIZvnsFZ3WBlH35HDvoVNkD2PFwwAX7YpXt6aie27CDu6nBAp7ifTb5o0yrUlKTIrJYLghOMyMNt91zssx3hnug9dAKcNYGdPx8TbqNMmTLUpLXVtYmaoVhHvkVzlOBrO94H4fSwlRlu10bMIBWfBfyUrP7I3CTYkT7hshlamqR1o4alS5Feci5ZPBbVBM2MrpxxLxA1DNUiqt1TCgfxhj7ynIWX7PT30E9mB0ATN0qmLi6jpU7FwJyExCkNgzQJQf1fo0pBLmnX6lmvlT0/s7mJFzU59PGzPl2ZsZOXNuQBIc5WCPpOSIflu2I2/9aGf0dIzenpJFHS68KM18Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fl5mYP/372tos55P3upXj8aM6NGoN4Wv5JFr66ha/k4=;
 b=uS8ByiDYDDXk0w03AAAt9wppNVF9PdJ1n6Az4cVYJY147t6Yaf9oxlN1l0qMWeikLeGh2mk9CqcACJ0RNQ41zKyeYoB4/Syps8WKiDI1Vne8lJ3DUkTvXIetX90fKiFF8g9FetTmz+1rjsn5qorFwNaZbnAJcs9GUhgWR5r/v0KqyD4L+tPfBbGWv6wfa+PBr1XjNv4N+KKy5w1iUQcHF4yysOJFsqTbuiNaDsiPcXvvOU5bPfEqacKbDydez8oHnygu3JEFWxYGnbCa0dqiDvmSdCgweuvWz/a7zPv1PEfHUlcsvbDfGScc6zRgeNKSWW/1LgPPPyF+Yq4rKqO30A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fl5mYP/372tos55P3upXj8aM6NGoN4Wv5JFr66ha/k4=;
 b=KTOZYh30lDWan/YmxTaJOcgwTSTRuTQCdQ59zC+OLyl8SfsEARlMzhksAqcihZGQZYUh+6P+bbzn++tRbQ5bGuwBkYSPkbuyuYZMfl5zcWqajDajjt4I2+lFdFDhayxsrb+6XRMdvaZVH/kDmVsTGIpZMNODB8SzQ6ggtmoltYA=
Received: from BN9PR03CA0922.namprd03.prod.outlook.com (2603:10b6:408:107::27)
 by CO1PR19MB4887.namprd19.prod.outlook.com (2603:10b6:303:fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 13:34:56 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:107:cafe::29) by BN9PR03CA0922.outlook.office365.com
 (2603:10b6:408:107::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 13:34:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Tue, 2 Jun 2026 13:34:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CDCD840654F;
	Tue,  2 Jun 2026 13:34:53 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B4F05820244;
	Tue,  2 Jun 2026 13:34:53 +0000 (UTC)
Message-ID: <f47bf7df-f1fc-4d77-9293-938e20600826@opensource.cirrus.com>
Date: Tue, 2 Jun 2026 14:34:53 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: soc-core: Create device_link to ensure correct
 suspend order
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260601142835.282301-1-rf@opensource.cirrus.com>
 <0aef9b01-65fa-473e-b999-0c5b285009c5@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <0aef9b01-65fa-473e-b999-0c5b285009c5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|CO1PR19MB4887:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ab1c4d-f60d-4be2-ae87-08dec0abbb66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|376014|16102099003|18002099003|4143699003|11063799006|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	97tk8KTfJr+AJkmOsXVKZAuCYKUjf//9QprpOjX2BJ89EryuBEIZLRyDnJ2Mu9XrqqeUrVZo945obe5XIDEeI2S2E4Gy0XVN+TfpfCNybMKJi7ygFNKtuijYaUGY2igJPq4vKyvuv3P4G71Xj7SBQe0jNzkD0KOW8gCS6dnwDeGG8rt1KMyrpEhFM1zyEgGD65U8Hy29/qx6NVEKuXB5hekJJ6YWQU8QSYCofTvNp9NvA8c9GcEcDDqOZr/cJ5cZdzaW2H/6Jp4cs3sr+3HnpbCGKG81l1VLj31/mhOME2x3Yuae1CRUqAz8eTyGwl9cMjcIaZF+KQCA/yEK5xLgop3Dj8rPKB7AcfHqDvssHtvaSfvvv0GSdbAVolTF4ol/r7eyMi0lb3iUN/38hSTib7uGgUr7V68bd34lVhEzBCF9DORHUimPARh9BgKGi1mAS+zmnK+hv015sEJuoxqW55Izvq4yZF81GgtB9ImtREmfaTPB029NdMiv/worJ/MPWIm5I47KZdTJumRaNmwcEXwSDBjtrZI4UyBDAZtAQCWzCwXmqvZL+47qvQiCvK+9iVMLK9mvykWptQ/Rb2TN1SUdZdYzv8oXlgZQ/gS1hyhin+4XB2vPUyVtA/ZdVUDNcliWWKwcndbwjKk1gbokVphvGF8VmlEE9Y9ql1rZiRk8F0n9wfYvCGGERfTSIuidWj8TzeltF/fzzUz+dXxELdypJO0A9gE0N755afaVO88=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(376014)(16102099003)(18002099003)(4143699003)(11063799006)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nOPXr5yXvMcQH46Aol7alF5LqSfDhrG0g3/DV/blYh1V/ut3Z0XLTM2MgjnWb0+fs3MMxKRPOuog/bFAKvaiCAKFkUXHxYYhDj7rJmdAZEA1+zULayNg2YWssB1+rZfKbpuN43WzgVBp7zT0LC2QOCuQUCGCunAJ5q4R55BxVQLfquAFaxmfTtFNXpOcrfiVzXSY4uc6NxajC6XrAT+sqwvvq90PnSXdYGy9e+9CvkRriI6/+cDZAIm8OiAlUP6zsgdt2m83V/ZiC99PeG+dE+mXFgQLIhJXP75rIsE4TuK4UO+V0JLCjNSUoHEVze/FKFCRhDhIBxX/Gn5YM4UHzDJ3n+KLAlOB8H6d13ki2vUBoO4JgvsIt3jCsUppUtX2aSky0XHRiV+GOA9kMYXSNC3IGaH+PbOBEbIuYxv5kvgapjos8DOeUkCIULk86NM+
X-Exchange-RoutingPolicyChecked:
	Ni86u2JY/PtcYwjdAE4qPKRmoewn7BXWebkEWHfiXKsrw1QXkCjWu7OFYubEg1HADejFkXqbp5rin3efPnGTMVY3b4UjevYip/fYVWLd08tEPKafIndFbhxFttSHYkcEo/EB/r6lOz/0uP0fxzMcMXjgLWYuYKKzgRTidcWczoGNhY6624gGShqBssSvlHd3pl546fkzmDSFKdO2a3WCjbu5ucUreIgKJNSOGla+gbTzYuHhnwXw0KVqqQCnt6APljA/jM9DRaXGXoaT1CdiAaB0ft6zARs/wqpLKzaNT1jt8a5KeABIXfZpoIms4ob4jNC9v8AZGuCXKNRvyGtrlA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:34:54.7069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ab1c4d-f60d-4be2-ae87-08dec0abbb66
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4887
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDEzMCBTYWx0ZWRfX3mcFFMgYpOlR
 lgl3bWe/KbbcozMHvlsDGz3izsD4OydxsM/PSVos53Ax2yQ3Y9LRfs2YKJ63WK0CR5lb10lNk7Z
 fVRoDMnAGmS9U96Ek/X0QhlSe5QfSB17CISLdBcF1aS16qo/BKJAhLDuF598hV6WD9J9klKQnTS
 8k9yw022SDF1muaMtTBtPIwLwkgxGvrBPza3HGT1J7FSGPbDBcUD+lYQzfKc+CCprlWOght9eID
 5b7/MaGIqf7Uyo21Mhcs2yHWjFgj1g6egz8Pl2SzbcIewMy9W1g3cslaeH5RX8IgooYgK7xsjNe
 eP2dFCs+sYPdgjiwLkUf00aMFT8wuzFqY5lYARYTTxwUi/vd4zGR1jVNH5sBZZkB1SYWjKSudLV
 KStOg7CY+5rSw4ujLgCJPtlX2pI2ISrxmE9ntGYtITCrMPD1NrDqb09rzkiDREOZHN6AzQBsZd9
 p65uSc9Y0pWx+J6598g==
X-Proofpoint-GUID: 4SLf_zVc5q9ksKNd00F5hUU6OsnClvOr
X-Proofpoint-ORIG-GUID: 4SLf_zVc5q9ksKNd00F5hUU6OsnClvOr
X-Authority-Analysis: v=2.4 cv=ddywG3Xe c=1 sm=1 tr=0 ts=6a1edc06 cx=c_pps
 a=m2/28Svseh3Q/SQ6sWV1ig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=c40EwqGGSDMnxju_lJIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-Spam-Reason: safe

On 02/06/2026 2:31 pm, Mark Brown wrote:
> On Mon, Jun 01, 2026 at 03:28:35PM +0100, Richard Fitzgerald wrote:
> 
>> +	for_each_card_components(card, component) {
>> +		if (!device_link_add(card->dev, component->dev,
>> +				     DL_FLAG_AUTOREMOVE_CONSUMER)) {
>> +			dev_warn(card->dev, "Failed to create device link to %s\n",
>> +				 dev_name(component->dev));
>> +			ret = -EINVAL;
>> +			goto probe_end;
> 
> Do we still have devices registering separate components with the same
> device for DMA and DAI operations?  They'd end up duplicating the links
> here.

Ok, weird, but I agree it's possible for one driver to register multiple
components. I'll make a V2 that skips the device link if the component
dev is the same as the card dev.
