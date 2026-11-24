Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530389;
	b=CwFN9vZ8XMm9DpBRrS7p2+pU0t9LZQqitUsDZPnAhzwOM5/BUMDfRmHTA5NbNdGpJjIn
	 f9K1Vjlb2uf7CsJSUsfHQH5i3poFGuSdjc59/2a8c7/Jisdl1eDmb0pdBFszlMeEHywj4
	 Ebbd1seTSNquzD4DCK9LsMqr8BZWpdIi+eINQimV36JLHpCQHWfx+vFtkR3L9M3qJi/h4
	 xCBlsBRHo4u7EOiAfPX94JS0wiRt+CBLZBt0QVe8sLyErWkN97sTLXwNXWYdxUYJt0Ll/
	 rOf+DVSi3Sb59EyhRum7Cw39K922O6EBj4uRhXkkuoKZfRVjdajVfPwp3AzHcYLQVmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530389;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=mdWOn8T0AvkQVzThuN4BFjuKAlt5b1Tt7pHrmObJaWA=;
	b=RyQnYG2FHZLrK9aaeA7fQbVwS3v2k2JR/yS243PfNEZr9/54JvCakPSr8EPkJkbuOXLm
	 ZGPREPCmmt4qcD7miRPnBuKcY/vyNKvv6kOrEEdUCIHhMCQSUuoe9O3XcaWSA4aHkD1GU
	 yGl3Ecz1vPyHGRKvQUva3gGH0dLMdBn2l3on5GU2lcMij4JRhrwfgS6YLgG0Tbx+faPxF
	 vRVlAFaHEwgkmM8kzgwC+CkCtKa6TydTW8HOWzKKGry1R9wOqwyBcrhethH0HKDcFhhhp
	 Y67+1liYERf3KT0giD4mwZpCP9f1RZRF4yaiyMXbzHbX8wiP2NxRvuBlDFsWjnqdXUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=qXuliinq;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ojcgq92V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62594606A321;
	Tue, 24 Nov 2026 14:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62594606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=qXuliinq;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ojcgq92V
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AODkOf62054879;
	Tue, 24 Nov 2026 08:25:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=mdWOn8T0AvkQVzThuN
	4BFjuKAlt5b1Tt7pHrmObJaWA=; b=qXuliinqQRoHaFD6JII/QHrv5q7ohu5OB9
	uhNGmZ6B0tKQnxNl0/QpfxGFTRzeS5uVpT9Lz4zBPmj23thud81a7Slsm4XmMhXm
	5GGamA4D3thf2H5fL4I5k2qRDn1hoIc9g3UMntxTqDOIntCiNOMD7D1Hq2A/sVXn
	3k79YFUVomQHhH2q35lp96sejI7PD0qrl6HpzGtJa8tnFSzZfe+dKydf/Ee57vra
	ddVFTvvNv4D1432Mn26lz1RfzYQzdlg5DiEwn8Yab8PaNqzeSaPOqdBcomcGyWru
	VJbXrDIA7S7+bpE7U/ouAhqb87zNoE9i+LHwUPtdIve/OJOBD6Sw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022134.outbound.protection.outlook.com [40.93.195.134])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519j8sx0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 08:25:56 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIfilE4Q/ubY0KQA56UYNmJ9HT23JLHGx04dbjRdFrs33RLBD4y/NCsXuNpJ8Ddgjqw8XFksY1G3h0lOqPZLtLzrNMs1/ScQbzB8ifbrzjm83fNp2+jPONit7vcWoUWSlCCHRHAZi+dZQhcsHO9/mnDzLvGTj0SMedum0nkzhTtg0L9zJBmObZO+VJgMic+0j4IeEhlrHAfC3PZViWVWUnnPA60kZma8x6uSiah1U6LVN5bToIyvh3l4bz2tnvvV8odMs4hHybybjg9/V4dBAMU4oHp3VVJoi0f9b2d8mRZ3VztLeVABBYHZdRgbfozumH5sMzXQa3wVx3RJvNsuJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdWOn8T0AvkQVzThuN4BFjuKAlt5b1Tt7pHrmObJaWA=;
 b=cSTvWP37AI3EEEJ55Xat1GR7Wz0kUu5CWM3DMe4V+an3lcGPYBiH9My+PkuREHY5nHf8K+99+5kHyQMUHvYLxB8WpqLQDNp3yGj/q+pz/DXHV8wJHHIYuxDph8J3SdZ6WF/L1CcYqlHvkLBTX7VeQE2w9jvrHlNyi1B4hQXUhKPI0RkHrUdgtlrJG+0osHslWkuROJ+QySZuU42E73dh50ZalDxB6k7K3cc7v+jWY9xyyJdECLK9YeU64s1OwWPWpbSCOD/F9EGsqamWb/4RFp60rkU7eZJ+qq88Vsl7cisGpOEzoTGU0mr618f/FW6qOglyqe5i9az2doADhIrXIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdWOn8T0AvkQVzThuN4BFjuKAlt5b1Tt7pHrmObJaWA=;
 b=ojcgq92VM52okJhGjBQrDmWpeR9lTDitHLc3YbX072mnHKqya08WbhAqG1og2f4dX9Wy+coqKCdJjMFf+Yp9yR/5RU+m+o91fmQQQ366e/4GSFyBNBVsuerdDGFr9Co41Mw0di2jOgEtxgVr1PFe0zt1p2KFMmEiiTAMXvMYfNU=
Received: from CH2PR15CA0015.namprd15.prod.outlook.com (2603:10b6:610:51::25)
 by IA0PR19MB7679.namprd19.prod.outlook.com (2603:10b6:208:3df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 14:24:36 +0000
Received: from CH1PEPF0005BD5C.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::3a) by CH2PR15CA0015.outlook.office365.com
 (2603:10b6:610:51::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 14:24:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0005BD5C.mail.protection.outlook.com (10.167.244.245) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 14:24:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 261FF406540;
	Tue, 24 Nov 2026 14:24:34 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 10912822554;
	Tue, 24 Nov 2026 14:24:34 +0000 (UTC)
Date: Tue, 24 Nov 2026 14:24:33 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v2 3/4] ASoC: arizona: drop unused HPDET accessory ID
 support
Message-ID: <awWeIZ2S3Y99joTh@opensource.cirrus.com>
References: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
 <20261123-arizona-asoc-v2-3-6323d3c0961a@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-arizona-asoc-v2-3-6323d3c0961a@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD5C:EE_|IA0PR19MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a8ffc3-3404-4e57-a683-08df4a36aa6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700016|23010399003|18002099003|16102099003|22082099003|261021121427099003|261026140227099003|261022105027099003|261028144727099003|56012099006|10067099003|4143699003|261102123227099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	Oi+PzbZm4RBBD2P/eDEIfz59mO6LF3vgrp7skPQY7GOg++49rhwNA2cd/KbwXAhhy2ALlwYalJqCrIZb1Rcgn8cTc6gw16LQfAKpTlnW3KoDB63sH+L4yaDm8vpMd++Lozgy61phdOhnQSbeyKuUyIve8jX48+v0ybu2r0XoVe0NOpCtzrO14f6EXssFKPgRxqP/8nynsGemASCd2R2ANCjpeNVFtS6CaAOkWwzX/FL4StDTVYOJdCbaMeKOUlO6iFBHuiYqPdIER6P1YXSonCYE7yRVxVd4uwOOh74Y1Wz+5mF0caGJ1mSCN3xDdEYw0vvNl9w6FdNqMwqIloBCi+LhCF9YF4bSgSZguyN7pFlO1N2fnovZ8Cu6nty/zQ2YE389o5dMFtSJ9ZeMXQupNUwMjZCmT/IEhNhIEOx4WyRJcpnlHLieS+fbEVkT8+821i9Oa+rYzz1Edvv7wKW1BOQEx3wrQAT+4g6zhFvBuK3tvzYEXci1kODbXD5+hfR8mMLsqko7GUFeLC9webAz6jAEEXCwWTD3N5hqaQWmwco8/GqRef2Dj7ZPQAEWK4DugRdpK1ad9VFDTm6xuZoKuxgg3q6hkVL1zHpze7zl0FoA0hL+f5XLJCOqEToMjZu0jf4BRmccVg1G2IvXHzVo/hQR7xcZd85duxp8qljxPV2dM37/ii19C6l4KTHCo8lwxMJSUz/yBcT/S6SwJzyUUw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700016)(23010399003)(18002099003)(16102099003)(22082099003)(261021121427099003)(261026140227099003)(261022105027099003)(261028144727099003)(56012099006)(10067099003)(4143699003)(261102123227099003)(11063799006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oCyL8uS7hzm1vqRnlF9rme4HsXqyac9Gh1HcPzn/5nDom36XvLZbiMsMtbTDSIobNrWFr0plePJ46nRlrQ+/eHr96vD9yFy4n2SJLwxPqGEJWDqS45apNmWArSHXEdIw2n7iWBPGCQy+uClOhVfp/msuTXRJGNN10fluvrIbx7H/3cYoLmegN5lsoM8g2FNeXcfNILGyJRQpCOucwRaN2I40NwOZIUQSJLhCW8aXojZzXnxhjGOntaLg78IcYaVtp5pfMefuTpLQ2pXfQ+cKiq9ugdZwCXgzjRsp5eONR63dt7Tu2GFpySVCtTcQpTjT8oow8fohtZQCICpldBEuyvvoMt7A/Sod6WMyty9rrFcFLjNbKwEkrxKNH/UIhAga9bynDBC694wT/818HF9gLb+pLSw0PNSPmMgrD6/WC/ITleJPEHUL81OSg4mOJ8sG
X-Exchange-RoutingPolicyChecked:
	drwb24tPNbgiMivxcfXOF/czD0RpoRNIuzdhe6MMoce6RJYN19mWJYcpUIWobt0brGz/fEYOX+tFJw2LpzKnNZ9UApgJjEYCX+cLJWrUAWfNhVCtpt5yPuWp22qRJCpHBhm/pLoGiYQcsGSpRbcDsFUBIC2xgo8eAVdHKeoWc1Xm5m3TLtXkhH13k3zM4KPIrFhj5pB29CgXW44NvtkFMKfI12CN/usf9Vy6M1BUeOsn6A1wMW8x1YTj9nJIrnadu2A1mrtine9GOGsuSiqN7cbc1iMiBB7gr5DvElz3oza27WDJawZDOoYMh1RTsUSG8XgbK5Gt8xvCowZ5ZVbycw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:24:35.5381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a8ffc3-3404-4e57-a683-08df4a36aa6d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0005BD5C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB7679
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXyaI2ULG1h+bF
 pggEbqCz8BkXwkB6PA1wBKaNa4CyLkfX2VRT/K7xPbHWobKUJFO3B7Q1fVWJDf5oadPPdYWWhEr
 BNPd3I/chVAmK+WYVsU/ovxEtr0rDrwECnfEa5adFGQGsXdSslyk9Dk01UgN2BOXyxXa+1N7CLj
 mVHFD6ZZJdyVKEI06siPnhQ55z+XCR0G+3ArZqmKZDrhjv/vuzfSGfgBt21vAkFxfzsjuf5TwEA
 nkVBVhAwr2YC3ibWMSlbXa4pG9qJ44wEyQY/YA995fDEv4btqFODjNXdXRMzg4d89+EXzqsWTTZ
 Dx2Kitv7wrJLkc+33Pd7P7e3+bxMR5DXQjYbUciAWMCSXLObRomgRiBGQDeFO1VR+KiQ5m3TdAj
 Qd4S2hD65Sy4gT3cU7zawi/ooIg6I2VxVwDS7SyoCthj+yUrualTl8nOMQ2Itv6Csn2Uo6n3b2C
 H5dzciqpR8O9qVbr8vw==
X-Proofpoint-GUID: ZnBXPKpTpUc1u73QSbfLzne4lJTS8nYi
X-Proofpoint-ORIG-GUID: ZnBXPKpTpUc1u73QSbfLzne4lJTS8nYi
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b059e74 cx=c_pps
 a=rUfGOIOvJ/MBLZtbMVSs1A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=hDXC-7HyPgnzyJNeKeIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX6gyuqObsRvaF
 F543Z7CLHUw5GKp23wLsMATKBPeKBDjOY2X6pskespnQLDs7J6Znx3q0RKvt7y7WgGcYFv2prwN
 bCutD+LssC6DjipNTOgM3r4yCxOCcaE=
X-Proofpoint-Spam-Reason: safe

On Mon, Nov 23, 2026 at 03:00:56PM -0800, Dmitry Torokhov wrote:
> Nothing in the kernel sets hpdet_acc_id or hpdet_acc_id_line in
> struct arizona_pdata, and neither has any Device Tree or ACPI bindings.
> 
> Remove both platform data fields and all exclusively connected HPDET
> accessory identification logic, work items, GPIO lookup, and state from
> the Arizona jack detection driver.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Ok chatted to a few people here, I think we are good to let this
go if Mark is:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
