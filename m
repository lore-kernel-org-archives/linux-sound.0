Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843B337FF5E
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642344; cv=fail; b=JT6Clx/86H5KdgftYn/juI3YvaauFZXx1k+Vgr58lNRqpmIL9vvgyLv5MIp6Yw7zADoYdbO1ncA4wCUVdYtKLKda5ltELe6rpzCPPMDC0XYVbl/neZgvSGG4nonkk69kjINR8VYJkqetn4/gvhqgPURSPd/vZ8IJ9gJNphcK728=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642344; c=relaxed/simple;
	bh=2NxRda2sdqMPJINeQWWpeM375+ilwiugnAC8Wt9Dd3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlU2Q/fRpzF7kyJMSt2/CYNvy586KAuewUqniEuJpQkn/uMv3ZPdeG23om/BbOGRny/gQ/jsBvVM/AuBDMaKb/QeDxjEGJvipYDireg2NEDbLMLPOKuCGEQOZxnjXzisglRM4QN0sFqIVZb8AbdOBOSnxuY5W2YwyEh9gY1AqD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZGAg7nQs; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QZC2QG+z; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZGAg7nQs";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QZC2QG+z"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6384eUMX683500;
	Wed, 8 Apr 2026 04:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=slZvtSM0G4m6OrPo9LS7tGJIACx/BR/krbRTg9g5W94=; b=
	ZGAg7nQsNmK3Lcos7lb9nQMVrhRFA+zZNA2yV3P5GTvEFpd2dvomwrvTMBfoxYI4
	R2vbUdJHzlYpN9AyZKOG1R/dJ0Osd9TGnUZqlHG9JhK5gZkFcW67QfMTueKoMmeD
	Ct/3pmhI/CezykaA5+oDTCqtjYoSvQFNO+GKXm2I7HmnQNH0DkY/gHBRrmE7vPDb
	lSu/odRjUzjPrbt/3VySNcoi6oFQxnfUhkN6auUXDZp3KpEy3iu3wCJiI3/hRfjw
	mXKK38JJkg1tg/K7sBdWT8q43Ux8pTnfxupYaM16qCnqqQLq3ry4Nn7cxDFAWXAT
	A4JjGithkcSqz9dPvMHDBA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021091.outbound.protection.outlook.com [52.101.57.91])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr7j2k5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 04:58:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkjoJy5lKuHiZZpadO64mVAEgJReeYQd3gHGIyDbEdIPyAq9oFIS+sxCrDhAsT6cI1lTb9xcPY2Xt1dpZ+XfPwK3IPghFcYNramFXYHNbIrzjFynLoWi1Lmsezk9qKM0QNjM49QbYbUNxVPkmRe3AjriZpLCZx2KDrtwRHSXe172+/CkTS0ly612N/ooFABI9XWxj9rAkg1aCg4dFOy/kct18SGOdsrPhMQQfZWNQWzVqNmMM445pGg6fH33K7KoMjYWlqZ6d25/OPY9iQd7Dojc6UnpAkEGHyKgXZRHgQFEXEDIlJa0ZGHpCD4+8bxyUEOhjOy07OyDP/tjuT+KAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slZvtSM0G4m6OrPo9LS7tGJIACx/BR/krbRTg9g5W94=;
 b=dXAYEm1LmVaYyVfQB8TMT/o04V54G3uXxclhmy5gGQn35PYcY+F7dSBOfhloR1cpZyW9fg2efOunlsgiT7ZlCyjKIzuHR4gmcYSV0avRKKKT0/TZUpI67IoAELIH2hx1pgePTx882qQF7ghRE7MbmN5/TuWp7ClUZ3c5aSbQksWve42qaXuRzjQ4KZLBq3xFnZnGzXLdMQnr+GdzcDhY9EfgdNinwnvsHM/frQsJft1GjcPJnzuzFMIVH6tXZPWiXEDXz3zlYlx/aNlL1IT4VMsTps/alS1eks1vxfseBcDjAfMBVnwfM3GUCDdjarRwJzbO2JZoeeef1Oj285j+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slZvtSM0G4m6OrPo9LS7tGJIACx/BR/krbRTg9g5W94=;
 b=QZC2QG+zb27A6oWlsuX4L0k7z2V1i+s/LRaRhM1HUtB4oYIdCLmnUIegWlkngawL1mkPx8/19IQggV8Mxvn9nk7EAh5yjguDIAD0eJgsezlWSw41d1U5HDFSnINtEXFhfF9lz3y5cZoOlnS3/WE3TQjIqhsGboi/s3UbvHZjKIU=
Received: from MN2PR22CA0020.namprd22.prod.outlook.com (2603:10b6:208:238::25)
 by DS4PPFA168D4958.namprd19.prod.outlook.com (2603:10b6:f:fc00::a3c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 09:58:35 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:238:cafe::91) by MN2PR22CA0020.outlook.office365.com
 (2603:10b6:208:238::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Wed,
 8 Apr 2026 09:58:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 8 Apr 2026 09:58:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A2B95406540;
	Wed,  8 Apr 2026 09:58:33 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8CFA282024A;
	Wed,  8 Apr 2026 09:58:33 +0000 (UTC)
Message-ID: <2e288750-2148-4c6a-b95a-9a843894d9f2@opensource.cirrus.com>
Date: Wed, 8 Apr 2026 10:58:33 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SDCA: restore the settings if power is lost during
 suspend
To: =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
References: <20260408085607.3813488-1-shumingf@realtek.com>
 <adYeL2xsalE5dcY6@opensource.cirrus.com>
 <0f4584c21f1943a18c2e25295daab931@realtek.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <0f4584c21f1943a18c2e25295daab931@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|DS4PPFA168D4958:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a9e2d2-60e1-47b1-d00a-08de955565dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|16102099003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cuiO4NoUexG4gkI2fNkflpulN+oJzv+nhbdLE/2UssFWGUolhIVDOodBS/+3KEOEVDjq+a9FnssZ1nnhVck9bsbKpZJtDV9Bro7RX9PmBtwfnBPIqfajvt2+5hnNT2B+yF4cEo66Slz8q+sj5LvAh7Nukexa7FgvtTliiWXjedtwioTNVRkm2m6FMEUsjoxwIm8HTNUcFM4c1RAlPoAQN/Ee1y84DXakInybNi4b+kjT7TE2gQhBX8lx03RLUbDhzQ0AQtHnA4qGXEzsl25DDl8kkSqYXo5Foua7Zp7jjTt283KQnr9fkRFDYNCyFC8BDzfwcGOI09u+sMN6ox8ej1Z+yjwWFlgiXkc/4vVgzcwaSQXdu8lh5ZpWRU8JdmLpo0LbzY8lahavNY78jNnnO6KiWyyI/Okiu6zR4r/mKeYvtOVKbkAkyUiezHPEtykxscfwzT+8XveSzt5Qg+kA2dz6vEt5lpVw/KJHFupfIfdMUH0Hir0Pn5t6b3se3hwJPjDXOJKufRLdzkS9PGO2Yw51pvpVudtJbKupr6D/CluAbnDnKs+mmckAgC7OhNBucY2TmawRSffpBTzsMxQKvaKU3U3755uSf/NhwGB6zFPlyIY/8TGmsqFef4On2pS6/i8EDGgK9XLwR426OKK0HzE3KzXW0KpSqWe/dWlLwWlbQ+fA+mM+3jCr/yN7+OQzEzEChBxJBzRWE45+m9pzrocxY1SuLGoXIS/ESvIfcdOf42eUp8NuwpGZW5Yj4/PGJZfOTqbEtghL0YGxCAWo3A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(16102099003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9mDEX6457qrFXeZUMvMNZIQWBX2H6QAva6KoYmZtyAQqerpvdsJWciAT8bLp/o2MHhJbqtlc21rvgUY/DueKkwivL565Z8b05XIu9DSHHWH06xzaUSLisVp5G+cVJ+m0GXENfoinnuymRujZujYtGussVggpG0jEjmj4qbit4yQKGareLMlvRmE5Lzi1x46aH2Y5XePnIPHmLYYVLD4MGZEvz+yai3LMF6lbSGyzz0aoeT7Sq4Zf/fPZHK49w+0vRoW9CKCPUXKvvjY6gWI4z3XJtmdqebTAlB0KEwW0uMH1t7DPgQCzFXNw0DyhZk04IeP+HjiT7Y3/8h1wWpkkvUoHbXGgD6Biw9ZXv88KSbZogtp9Y0dReKsrZ1j0OPwCKPXJz/xx4x4rNz1ZbKJwyB3hkL7x6ln6AKVeXiU8086/6kGHsUlmLGxawWgKf1Aw
X-Exchange-RoutingPolicyChecked:
	eXIqPfEI8AZ2ck7TMamSuoqbXI1AODTovGooKcA01ieUB6NonhGASHpbKi0GLeSrc9WyK0HiChB8nZ/ZfcoTZpKXMB9iBGXR0IYQnwNUnT/yJZex29uMUV/em7fHDB/IE7dhJTsDviYagLrSr4U0+LYsDhNWK+CHfKEFHC8kK6CQIY8H6fv9HJtSzUFIyJgeR/e8ew6oviSKBR8BbLfaVN3o359EuhQpqS+oi7RyZCDLQD/n+WJ0yfpgLlviQom1QgA0QR2RS+K7Ok2D8rz5HOfUgGHaCx5fSBHSkQ1T5Mi/K3RjnjCKuF58GjGkSZHbsKrWJajxc/KnD9B/Ws4iDQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:58:34.4913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a9e2d2-60e1-47b1-d00a-08de955565dd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA168D4958
X-Authority-Analysis: v=2.4 cv=LMhWhpW9 c=1 sm=1 tr=0 ts=69d626ce cx=c_pps
 a=swhzy8d5zJl5pBN+sEYk8A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=n9Sqmae0AAAA:8 a=V1RBn2A6RwMjvJ1dKLIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: QZVr-upDE2P83xIwwp5BTzjwg0eOgNSX
X-Proofpoint-ORIG-GUID: QZVr-upDE2P83xIwwp5BTzjwg0eOgNSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MSBTYWx0ZWRfX2sWmLHyf70zQ
 op/LcH+FVmAtnkAn5qdv80Go4GS+ci4g/jMX8CZCEweKt3zUy7GeC/KlvbIMyjWUcDWDwhETEcE
 EOLtkXj1SU3Dx4BswpNkq3WtVDGcT9AF0VukYcmhOaBnAnyYk68RKhr6HTFBElvTNyT1/MzESo6
 d4mwxf30Yen129ude91yPuTnfj5ZF4CE6uGTp3uJXg/yxnE0hfuF6n93eEZjsEpdMXYCY4oKbB0
 Z/lqOzFGzLkW7NjzvT8IvZoi4HK5Ln0DxYJ3mc21ieAtIpTKwUMYC1gWtmt/tZajTvdJT97Oc8Q
 1fUVc6TGHiW2qok1Lx+SUlI6QEzzGLM6qlMXTFNlkg+e3KrA04JvtfRnpx84y6ZTIAUQbKvEWl9
 OUUwegTXz9Q1ViL/cSTGty3ITUEWDADdQyUUROBNNM0TZ/Ki4TZySbOHXQh0dzxiLbK7WQr2jDa
 neJh5AIo1S3KTiwfUzg==
X-Proofpoint-Spam-Reason: safe

On 08/04/2026 10:40 am, Shuming [范書銘] wrote:
>> On Wed, Apr 08, 2026 at 04:56:07PM +0800, shumingf@realtek.com wrote:
>>> From: Shuming Fan <shumingf@realtek.com>
>>>
>>> We should restore the MIPI-defined registers when the device is attached.
>>> If a function status interrupt occurs, the device will trigger an interrupt to
>> reload the settings.
>>>
>>
>> Are you actually hitting this in practice? What is the situation where the device
>> loses power but it isn't covered by the normal suspend/resume flow?
> 
> This is a scenario where the machine enters hibernation and cuts power to the codec.
> I simulated this case and verified that it works as expected.
> 

class_runtime_resume() already does:

	regcache_mark_dirty(drv->dev_regmap);

	ret = regcache_sync(drv->dev_regmap);

