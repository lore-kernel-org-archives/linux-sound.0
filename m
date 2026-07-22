Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0926620297C
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 13:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726434; cv=fail; b=mD7GQZDvmO5mzhzMw2JNu8iZ1K0zkNEbuBtvNrzZCvdZckm7YPAiuMvxgVVU+TRRbfeW2c85YXlBf7DiJppp4JWtoqs6tIiIqpv8ZvmTgSUQkmJ3Nw417MZkbQLp6dURo/6PndqTGAY6KsgSCVacGXnIavPRZEOZxovB1szzU6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726434; c=relaxed/simple;
	bh=JkhpbQHBCFUWF1mgdi1bIC3c8vJivCf0xpojvC9FQU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0mcjTcEm+Wv+XPI1ODH3YB/oj0rdqjlWZ/7ZdsrLZOjnv5W7+TU4SVz9XlknuueujcEVmgPsK/agTtzUv0sVILJL499nvnHa564KicWoKmMB4UQkSyHttcKHKTZVeCj1C4rfriLpKhlucEVOAF6UUvoFIp3dQmxFvC5zZGBXgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oxkCXSrm; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wjQSLs6x; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oxkCXSrm";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wjQSLs6x"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDC3UJ2966636;
	Wed, 22 Jul 2026 08:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=EQY//zeTXjK0d3BSXsKHs9i8VozqgAHq+9u9PUyL+Q4=; b=
	oxkCXSrmF3GGTvcKcdvGj6ivewPUu26xcroWObQL078AD1CKpWCRGIekrxk/PxhF
	JvyUZSxfuuG0cmKfITBgAPN2U0cnaX+NP7NmblQ9ehR568FsgzNgQnMofxMGAghH
	e+LfUOlIUbTHcTkfaeFUtAvbSTmTVo6NDIWey0FGqRWCG9i7Tu5PUJAD5Sywkijh
	uMS5WgP/HamNZBfU4C31nhZUh/qSfQU8GaF64kCX7aCiK7s7HppaKd0Se4ElZik0
	ScG14kkMNdQKDRJoKQwj0nuurTnmx6I2WsUc/dlitYvHbB3sg2EsD73iMo83KdPk
	lgiRvGoNu3YGcuj5JqcXOg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020082.outbound.protection.outlook.com [52.101.201.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfdry8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 08:20:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y10uGL6/xEK2VB30vntn93qcphGTHW9xpu1fAiI6yRtFOR0axLv1BC+LBN4tGjslALSb5wNrien85ganOc+inXiUbmqLgcQA40REAV4Btj94D3PLkym4FISvY84Qf7oz1cK8/YUhB4Vo83cr4FNJWGHIb+/WARLd0fGlzmryQ5I2yNbYV1evY8Vb66UCzBgdFjplVxEiq9heCPnymUdhT/ll7QEVlvwA3aFgSoS9RDxUVPHLOt9hOnjqApr4KC8Fz0VbeplhtsYHLaKKQpdA5y1YBRosGvsuCORc2Fqfv3rhgvkxSRz5cESXotS9ecr0oYbUL4fdRJNL5tkPry51/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQY//zeTXjK0d3BSXsKHs9i8VozqgAHq+9u9PUyL+Q4=;
 b=JG4kgKVw8Qb3mGWAGf+8LNIyXI+8Ln5FQNBD99TBIZewFCjkhtpVb35U5K9TzVrJxg22wb9XDXaFgtJj5vQ5ePyaSf5bYaDFuN2tHdTYdTyyzmIati4N5aXUsUC0tdanW+90xIKAxO7K7Kf1PntozERAVS/2eCDqrgfHYHxPdwcGmqt5qLlBydX5smskj0AkzMLKBO4VqTzsSX9IO6InzboGG+DlqhkLZqV2Nhvaxp2KAqPL6+9hspYkoeQE1VY/O3AEYB4QgMfYTdf7nxLnnjzi06Va0ANON3wKR8g8gLX9vOB3j1orxOLx7u7QKkdtCQvcWX6pZ6hO7zR0CEaANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQY//zeTXjK0d3BSXsKHs9i8VozqgAHq+9u9PUyL+Q4=;
 b=wjQSLs6xEGEKtFh0PCzcEMPoahpBWdpwm5aKLooGRw6SZiUcDOfB9ceVGq1gapgxDs+Vb03LkKbUU5QLxEhKGiQezbeBfO+arPedF4BeZ/Y+ChACBAXIIDhoMnIWeemhYqzj5uWIhJWotN43VE4AGFhMDcKB0ZZ0Gng9RKw03UU=
Received: from CH0PR04CA0070.namprd04.prod.outlook.com (2603:10b6:610:74::15)
 by PH7PR19MB7777.namprd19.prod.outlook.com (2603:10b6:510:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 13:20:02 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::4d) by CH0PR04CA0070.outlook.office365.com
 (2603:10b6:610:74::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend
 Transport; Wed, 22 Jul 2026 13:20:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 13:20:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E078F406541;
	Wed, 22 Jul 2026 13:19:59 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CAED4820244;
	Wed, 22 Jul 2026 13:19:59 +0000 (UTC)
Date: Wed, 22 Jul 2026 14:19:58 +0100
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
Message-ID: <amDDfsCnhdq/I0X1@opensource.cirrus.com>
References: <20260720090613.2239891-1-shumingf@realtek.com>
 <al5K9RHWIeHjL0BM@opensource.cirrus.com>
 <3f470a3c2e2f4123b93c5671dd92fae9@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f470a3c2e2f4123b93c5671dd92fae9@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|PH7PR19MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: bda1ffd2-7886-4a6b-5979-08dee7f3ef90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|23010399003|61400799027|36860700016|22082099003|18002099003|16102099003|11063799006|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Yo5g4gTCcLT59VmYDB16F/qu/+ZjcX/3Y/ksNSkzh463JadcChb1yZE+okEcPIIh6WjtKz+zTES7Zm8wm3v7u2hGxElmI9aHHXrZoYDZpeZpkwwuaXpfTp1xvZE40YFIOs8UzcSiu4b062mMpmwQEE0sefckxzDyUdA9qOgAJtm7cSlgt817T13TnsPH9OCNUuAqj/KGhH+tY1oRONyBN1HX5GZIJbGCrjtjNMHxsvXTVCNMfz39w4KXaMZTtU0x9KiDjJEFwX9JeHVqI697jU0+CdT9RcI0qTFWXcetuw3uok/NkDuE2bxPCVioRJUs91bHTOLog6+MLm3szk0vWdYn4diWTNt1iPd4GAF38UXwCSYEGZnMNTIHqEGMz76+bBUkHg+W4bAL8f5Y0wqSZ/3um0qdkjUpSHZqln1k//A79OQe8wxZVO+/s9hj0ox30m8fKFK/zQ9B13IASTPn1sIV5ilEHLPslzREa/SCQkLAgNBj756EJ00AoAIRpAGLdYrq3Ro8UGUMXpxDlzZuiUmHANPlAwzxnbrt+asU+YFTwnqe7ZGU5roxBJ1Sp7cK5dMEqIITRVNz0+th9X+W7ZqTSrgvuGQ+Np0NAha5LESRrjEg4bF5JIii5QwEPZH6y266w3yxcjhbOryweZcHGGKG3fZivEeckH/R2pLi9U+LVdmcYntESVig9L0GGgHJFcewH2VbRRjdTUO5bI8lXg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(23010399003)(61400799027)(36860700016)(22082099003)(18002099003)(16102099003)(11063799006)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0en16lMWkRpjwL4p71Mj3vXBC1v4j8vJf3g/McibEV1w0WO7SyvFNIiriJFJy992kaZ/Qp58RT3W2MCbiAxaT0VGflL1YztLYv7OpISo6dxVoe9gx2GSD+817u01LZq//fQavnmdQMHxU5Q2ekrUvM1is1hpeeFuYWaX/DiArQKAXLPtI9rhXOOZOU3Zv3KU8vhGuZqDD+eltuc7Alha6DxKIE+QR1+rkBK7yzIkBzCQ/+SaAj/K7QpGOpnH14tPWw/ZrleT5aKbP9/+2iEYRVz7Y0f3+sS0eTCgzVHGFmSshKwGNVH/ZCSd3uRhC5asSlQjD8tfEyLxCfpDgguWdXu9izn8//qwoaIBHYikYjcJmT9WwY/KS+4HFIHlJG0fP8ijx3Oj7WTmPlpcAmqCOnaotn+98KqrDsywArXEvWD8RpLhAvLQXtnteFJ4CcoD
X-Exchange-RoutingPolicyChecked:
	mvxykz/OqkI00aIRWWnZKIPivRIsG4k1nFKGN3Ve0RyG4S9Etu1tiN4FtPi5J9eA0fWZTgSmxIJTq6AHnqpqBz+XfHzk4s9NCwRZzPxiibCp/CKn0EAXywvivaUiHCkyzmr6xS0yojfUIZbaetiYnA6NPJkmfA/uuiONFAci3U0qVv946TdoeqP17GVbhfbvVID8gEQVMW8+QTmGMUSQ7q7dlnR4o+iuaDIWGHlLHZogSndBwcNXiL48z6u3hsHK8zzUe+Y+drIZYvIElx6vBzrCpa/ILEugfYzIFBibKgSZsZJEApvm9za9ts2wV7fLkTdnsAvSlK1Q1S5GelUw1w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 13:20:01.3119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bda1ffd2-7886-4a6b-5979-08dee7f3ef90
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7777
X-Proofpoint-ORIG-GUID: lKnmxgVM9v27JVX1yo6TPzkYybZ0R8O0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX0pf55j6o+2al
 qas54xqg9wNNa4z52m72Ui9JMsOXpzszWbqquvWvfYQpJYb5FJ1ig27JGCTqpfDS8ZlObUlySyL
 83aYC8P7i0lcOnaX2T8iRXp/yTciRXE=
X-Proofpoint-GUID: lKnmxgVM9v27JVX1yo6TPzkYybZ0R8O0
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a60c389 cx=c_pps
 a=UUrofF6GnltCzEOzQKub5w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=5OsrihZ4xcEhX2XeUEcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX8B4QSOLoTkci
 XPUjGFm6p9t+0/h1nq1t3MxULYyFXe+9pcIfVwDXBimHMKhVNiiHISNZo/3ulI9HXFMhFMM7Eqb
 oM51DuZa3ZfR22zzkU46qKJJsctAp8rG68B4KDkeZBetj/Qd8JQk4D9a4HpYTTNEJ8JO5P3YOGQ
 Vu7AjsB7MU+2DnmMWRs3Jr7PDjw05n8VUguZFbLGgT7cPckvg7UtmueScy81f2kCUNHGahGexFl
 O1tKTU5i11wkZQ64x8dpXpMSbA6V7jqxv3qWI057p8nA10LTkDf0bzj9/udfc4Wz04MmBw2eGWX
 a+AYYF0p9ktDFyet1oycQtsGZmm2dGY+iXJwRW+jNTlIQoXHCrWMhSKwvYX/L2UUM+9+2yP7t4/
 vsXFpsUjheukkOK/HhuTm8OCfTMxN0FzN8B4GTRNGIzCxa20D2vaXNNCAY58wZJZFr8uB+tF7rw
 BkBNVgl1L07vt+82k3A==
X-Proofpoint-Spam-Reason: safe

On Tue, Jul 21, 2026 at 07:10:00AM +0000, Shuming [范書銘] wrote:
> > > +
> > > +     *out_rates = rates;
> > > +
> > > +     dev_dbg(dev, "%s: entity %s supports rates 0x%08x,
> > clock_rates=0x%08x\n",
> > > +             __func__, entity->label, rates, clock_rates);
> > > +
> > > +     return 0;
> > > +}
> > 
> > This is mostly just populate_rate_format(), the values end up in the
> > snd_soc_pcm_stream, can we export that and use it here?
> 
> Sure, will try to export populate_rate_format() and use it here.

Looking a bit more is there really anything that would stop you
just using sdca_asoc_populate_dais(), which is already exported?
You would probably want to fixup the channels_max at the end and
the naming of the DAIs would end up being slightly more SDCA,
but those don't seem like huge problems.

Thanks,
Charles
