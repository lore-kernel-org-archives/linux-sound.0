Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608E139FCE
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798762; cv=fail; b=BQdE0NbXgdgR7t9dba1fnTzF1nNAHPzGtPwkqcOh8OCmt7D2cCxWPq1ShFSpgFH8dejNGzjtf0yMgZxJe8x/xhg3sLoJ4/NraeerBUF9VHf/h/d+A0jOFxwgNMv6ueQitm531Yk9xE+AzO0aKDrphLyrhHq3fIx4fM527Oclc0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798762; c=relaxed/simple;
	bh=LNmg1k+xZeJ/+avwwPwxUdZ+QTGUIc+QSu/+l2MhlEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhGGQaPxy1wWnGx2ociFSeEaI4nAfp3Wgxl+w9kaemcXASrG4ILnIJLOXZoY1S6ShJX+F4QUL9ZVb+Oy6xQhtGo2kvDd2uQzWFAsr49Qryeu145v9TjYRcd0+MyIbLE4QInSOcYk6dy4rmgJrgaF/mCxnSt53fHEkcAHgepdEBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ac6RVWIz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Pr0/MqPO; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ac6RVWIz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Pr0/MqPO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N4Unqc2279487;
	Thu, 23 Jul 2026 04:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=J6fMNrMowNmdzYciaQw0pm0JcjXQVYQhgeY8sT2ox1M=; b=
	ac6RVWIzQhfdN7mQxK16VYEot/FcPLp/Ruo6ZQAMY1bwvV3QDNPoLUuj1UtelK5F
	a/G/hsHgMa32dtGQaLawuL+qetxoQYPxiL47zsMVNlSrFS50jzC5YRYE9Pkn67eM
	nM5cEVlXGYzBdDnvR1FFgLDJpS8/+ixl06BhnUpqDLL67qR17QOHfGl11Hi5ODqL
	MkN+2JaSlc6Lb9DpCEt/qPW9h6M4y52t1MCOs9gY0G76DiknM+Kf2iLwVB+umypI
	geXvGM62hy1waO3FhRzY4oO9CLVLzmKKVA6d+SUI5r96sDdJqSdMUQucdJpg1BQG
	wywo3NiQIgijH0rTiBNn0Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022081.outbound.protection.outlook.com [40.93.195.81])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vyq302-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 04:25:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmIr25JaeasyvyfS5PHFMMBKEmnLAUAvtnZ4HMZeEKxPvgiLArGz4RReFtMo8aUSXZpHZf+OkaIDyzVNJHOYr4sfpGPnEImi7eNUvr0UcZs0OZXFmyMgJ90bpRrKVekSCcS6XkD09ZQYwkIsLnkjeclPOke1Ilj8FMxBpZ217EsmTaunY9onII+3Eu05sTNhHjCi8BJnKLUYkWw4P4vmvleOmM95kKSJIIOzbq7P9pG/OMj5bkteKKuQuSeCa0Bdq2LsnVMFjx9mkasy97K6QlVWer0OY3FJU+lANIYTGvzQviUhQxdjvI/2QtxcXAc72ey4XWlgiMhPlnE6FJNa1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6fMNrMowNmdzYciaQw0pm0JcjXQVYQhgeY8sT2ox1M=;
 b=GA//QOOu8TBHvpsmHykx7ZyVZfvPfAoXfSt/XaTUVSjeRCXnjkDNoXOsZCpixCpKIvyf8rMYFY2j7R5cuO8Sfx5JoRPWjnMwE8PZCg1cIJhanhCJgmcOfvPTMO6LfKJh/wm1d6qqiX231CexR/fd6Us0SrA4vxDGTCFfZWdkE4psD19KVLdzJ9/hk2EY/kcAtxR6mOPmapWAmSjqNS3oaIiscXxaZhYh1WltZ4o8h75Zc0Ev2UdeOw+R5crBj+ejuawAHFu1wdoDcLSZZHNhGnZt1Gmwb93uZhXxm9IfdYj/kuPrCMPBSojKgnkGL6o772PwBpOgk5MGVQewv7nQQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6fMNrMowNmdzYciaQw0pm0JcjXQVYQhgeY8sT2ox1M=;
 b=Pr0/MqPOBDcpqPJVUU6Bkuau1ITs/Yxg/Eqe/KdtnwBvJpFU8dddcuy9xFs5W1UUcrAJQbYmaw3N5BuLZesgay1Va/Dv+3JjptEUgo8pfVaZLn5RaKr2pvpTNVgY5F/tPJlOkO/LNcsd/de1Kk2RHkxTBTGi1r+14/UVPPqjD6M=
Received: from PH7PR17CA0028.namprd17.prod.outlook.com (2603:10b6:510:323::8)
 by BY1PR19MB7749.namprd19.prod.outlook.com (2603:10b6:a03:533::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 09:25:20 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::78) by PH7PR17CA0028.outlook.office365.com
 (2603:10b6:510:323::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 09:25:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Thu, 23 Jul 2026 09:25:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4D57A406541;
	Thu, 23 Jul 2026 09:25:18 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3949A82025A;
	Thu, 23 Jul 2026 09:25:18 +0000 (UTC)
Date: Thu, 23 Jul 2026 10:25:16 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH] ASoC: rt766: add RT766/RT767 SDCA driver
Message-ID: <amHd/ESTS4QCvcCY@opensource.cirrus.com>
References: <20260720090613.2239891-1-shumingf@realtek.com>
 <al5K9RHWIeHjL0BM@opensource.cirrus.com>
 <3f470a3c2e2f4123b93c5671dd92fae9@realtek.com>
 <amDDfsCnhdq/I0X1@opensource.cirrus.com>
 <c4d709f9c73f41a28aa4cd040326f0b7@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4d709f9c73f41a28aa4cd040326f0b7@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|BY1PR19MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 03e508b9-9620-40f6-a3cd-08dee89c508e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|61400799027|82310400026|10067099003|11063799006|4143699003|16102099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	BB8OyDayUfpO0FT1Aaq6jEpoxDcEgxHmPCtH2JdqlJ42UprtnC/5wlGVKvTLy1yJ00LDqPQvMKPTXsTuX5VLe6PiOMvPUAQLCiYPqR6vaARRP+D9Z9mYdK3tHHXsLX3fcZ8wvrDOG50e51wapaU4cCt+F4u7P/MrECPdMW47UB4DMbmCj7gJcWdUgzFKZ2vLn1dX4dT8Q/xdY7G99ODp4yJD0fbngzuHlGmGOEKVjgoBJl08+SrkIVF9YVl3xM7lAdagd8FG9DFchSOq33tQz/BSvKqapnD6yyadpHnumnwbOeTDW9ADvqiQsYU3IpOzC2kRNnc7dPmBZOqLTJce35y49NNgd6Dj3shAZztYt1UkR7WRkk+7GGwy19IDHPM05XJMwV/P5P1DXCQLfnaEGPdjOnLQpn7VjJK1n4UcNvg3hGy3XV9fgIsNyNuSJ+z4qFD5YXcVNzPgA1jY24uiTi19+Ald91SsgaJ9+F4rDtZrAvUP0pf3vOSN81bBDa8SApAfieAVQbsUleTwkxSLPJJFdInSKg3ZxdpxNxO2jPvJxcz82Dj/L41L1MhQfy3/kX6ZbQhsgh3b8lCjfdkACQTtKszq7D9g5GKVl2SjVod8Xr34A0kS0GpVpsYxohHUB2OC3amT6POL6/V7g/w6iEGkS4NFylkKVFFoeRHjiEfRl51m4h7ierFLQcrCJO8biqDnu+0vBGVUkI/nWmDW0Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(61400799027)(82310400026)(10067099003)(11063799006)(4143699003)(16102099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	enDhHNFvBmrfhKgfk38IhrQVr9yDtK2BsLjEOOSLSaUxPkprsw+A5vg29kehqe3wZzlQFGjirRW6ooFUhIt5rJQTUH6j+7G7ejcYVONGrXDlaAEsdf8H3D59p9+d49NV1n55oy8twycBZHTbGakSs6LGPiTR096i6moUS4SPAqJ+DGIOqwyR5NOOSWdaSKle1a9eC6JyYmGRnFerb/xFWRcr6s4cZ8Yf5O0p7sus9IPB88BeQ8kUMbGMp73sIcdPBV6iXBW+vMqtIjIztU5DZoURWcCRYTv8BTEcrOkG7VFdgaZoooa4QDxUQcTZVnUeZb0uC/tPs5Zs3vdlkBho1k/Fn4PEpGih5/dJL+Slap2UWSCyTeb5B7ReKtf23BBXKsA9xPYYANOlEkP9A2Sf0r230HmmoKJmyNaKMMc5EhcwwOUYlcYqKJV610H76oq5
X-Exchange-RoutingPolicyChecked:
	NqeC3xGCcZwe1UK3kZFkzECmknaAW+waehoX5X5T43oJV6D6k6DBhOFR8/zLxnQhh/b56Y3MvM2E8wF/XYQStxnDl4gGGyQvcKGsONUFH1hmbIuE+K5cHZVIkctlqC1f0oosmPs/dXEf7UhRhVoz8yAiicNUr0ev/7vRh41TwWeMEiBIfpkl8lyPq57r0FRAFHFgyvlQ3nSWeh90V7XiAA2++TA00cy2cswjKLBFu2NdlGp+dLYaIRoWPGjrHWegAeYwjQO2zNDjs4nW9hPqjy8n6a7eJgGuGXt6jULTWiQljybnIA1T3ZKhZFKfiB3RAMeIgq+R2JhKzVyam7G8jA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:25:19.4506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e508b9-9620-40f6-a3cd-08dee89c508e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR19MB7749
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5MyBTYWx0ZWRfXxYmOCwMujIGZ
 K6CMaZHhq5Oa018ZHm1DjYQdJQEgKt/i0km7oBSwzWYpEF+PADbcP1JQN0ATWbZ7+UID6kP9UgU
 KjFrGXsuHgw7ew4DzYRi+LNGPC4va/s=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a61de05 cx=c_pps
 a=kzlga8Pj6Xs+ezKxcisf3A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=uFkqGtWVJwzfZ1tvQ2cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5MyBTYWx0ZWRfX1Hmaap9DSD2R
 xoGIc63ILHN9ZDyYe5UnB+JQNGkACbPDdM0SbQnIsQ8quoBb1mdmX4lJZCaONZe6FDkCtXX8tbm
 MfJcHKbBotY6ei56LgbiZ83kGjiEbaPzABXagiCTTJxAYrgcCIPaUQ1/LiOKezDSWS7IXIQ2ohZ
 N1LvRXhXOiTDGbg6vAjm+WOLDqVnNwhyvRIYlVniuEV/Ax6Yd2GPxswwaQiDsoicU+Y+HVr8tb+
 sOkOPWz1pVL9xCYwhbTkvZy55x30tGzeWAWh3iq4NlJvtq/p4D8Y9PYXtj0pisf2rfjPm3Fi/RM
 i02lAD2VulnEXyeoix3qKtZjUqOJd+2PlYphw2cGHDdaVi5gEibdeBY4WYpFkk0FY1KxgPLLBko
 Nj11A0ohvuYdBExWjMRfPMlJDjQKySPw9041g+hF0OGgdHs8UQkZv1vlqoawNo2RVnVBVWrqFI7
 zP8Dj7bQFhqeiTzTvxw==
X-Proofpoint-ORIG-GUID: szOZOQbUX1tbr2KmoyCKlM78UgMWOUTu
X-Proofpoint-GUID: szOZOQbUX1tbr2KmoyCKlM78UgMWOUTu
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 23, 2026 at 02:52:19AM +0000, Shuming [范書銘] wrote:
> > On Tue, Jul 21, 2026 at 07:10:00AM +0000, Shuming [范書銘] wrote:
> > Looking a bit more is there really anything that would stop you just using
> > sdca_asoc_populate_dais(), which is already exported?
> > You would probably want to fixup the channels_max at the end and the
> > naming of the DAIs would end up being slightly more SDCA, but those don't
> > seem like huge problems.
> 
> Thanks for the suggestion. 
> That's fine, but I'd still like to export populate_rate_format() for this use case.

Cool cool, up to you guys.

> By the way, I'll wait until your "ASoC: SDCA: Rename
> sdca_irq_allocate() to include devm" patch is merged before
> sending v2 of the RT766 codec driver.

Thanks that will simplify things.

Thanks,
Charles
