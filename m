Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440DC481A8F
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 10:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629798; cv=fail; b=m/F8FczT5YWOcdlV+gLsrDec7PsqyBZyXMe7OT5XMEPxlZrzBdVt03JHbzXF8NVEZ4PsI9yJB8SnR5S0J1rrBcNSeQJqFB7L/QY2V846eXxsmHZUCdQCHUEF3a40av1mgJn/eSKuu+vnfvXeDRXt4FBkDHdUlSWujlI7f9gUV7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629798; c=relaxed/simple;
	bh=/y36AF5iRBxhUcX9wT5iHD/FGOErzlbnVenhLdAWu68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihx8L/u8349KThqjdYyXThuqyreKz0MHRlpm5Grn6DLASnRNZERB+x3yZ3ZCdo+Z6X5KpBUoDgGFSUobbCyRVi5dTeYbFp0TS+k+Q4RBQzxprKtLASLauoclzs5WLzwDildO5yklS0tIfZ94j4Qsuhz33xbIv4sieUFIxoVwCbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PmMIovHO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=s8kElufe; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PmMIovHO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="s8kElufe"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4uqOX3876025;
	Tue, 21 Jul 2026 05:29:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=joVkV4CZfYRQeEC+ViR8k2cZkz1aF3mg02WMPp+8nRU=; b=
	PmMIovHO4onwHs3iSabON4WMsuASE0UYiESyTzB3QW84EkjblqZFxEgI0X2p8IaF
	HMaHy6s7K13oCPMDIetM2zwDkPGSV7jZxmTQk72eLwK7a65iqBkdFc5j2LkDq3pG
	YvJigUyz+RU5eF/dpGbx+/3QZC2lfbA5YU6mWHsZK8ppD4r+QJXZL8brVwEBNjCb
	3D0kqRDQt+c0W6BGDuQsLG+YxUCb0nEbscsMNV1th1sYbiDmxBR9g6xWK6JV7LQg
	In2xDoZmt/R+psQx5/WGwbUe/BSGkHB0kWSjtEMvZi2lpjhCoyqFsck/WpwUNFjM
	7N6X6yq8YnaL6Pbmv53wXQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020086.outbound.protection.outlook.com [40.93.198.86])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfbver-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 05:29:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHKxssMuaj1Zeucref0QuYogopYgH6uy3B9Y8S5zChlMjE4pgfWm0vpITkZpFXqb31i5NXCj8W5oGx5wGW0DrfiCU0J4Mq90WcRzQwHUync0lH2zQCtq8vvBMkb3jfMGjlp5yEjQJ9D3pat1ArDCUJDLX0M51lcl53IGpbt23lYAdxjf2m+1NlcbL1dSOkGgnUHKgAUV2CDFH34w65cgGhonDxHQo+j12fad1aWe5CW/GN9Xwgj8MCx8jXHT3lK89SAUAn4IhVSbA2vfqUa5iY92y582IVEYgIH8xKXNEf/VF87TeOyrJGkNShHJulaUgSTZWf3oBPXSTmlPNk6O/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joVkV4CZfYRQeEC+ViR8k2cZkz1aF3mg02WMPp+8nRU=;
 b=rP/yDGXGgsyTyQJYcU2zrl4SOLrLG1jeU8S6I6onmfUl3bha/yM3mgRUB+WmWgoS7L9/+8ITF4Fj5SBR/ogOgtf25ISL8KY0j9DS9YcbhK6HJ3MvkaoT+sLhTXy3i8692lWozkeGtpRzHoerYfOCrx9xTCC0ckbg//NU1+eXv7sVYfyEc1MwKR0NX8ue4qGA8BFss4e/WJHmW+NRQTkP9in/r7DGwOMBkNyUGg9ZbkcRqu17kXd50j42e5YoDLCl6TCE9mfkYMIcH00wUmvsQ/rTrBSlWZWlZmih6ryc0rhVvWGaCb+9bSYIQkIfHKc/CBXty2R/E/4W4/UdigjHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joVkV4CZfYRQeEC+ViR8k2cZkz1aF3mg02WMPp+8nRU=;
 b=s8kElufel4e5k2jDFhu1QEXCfGxWAOrrQjDsRPFWH5OXkJgjii2y4r0CND++M1mZpQIlVBg9dlwGODqpF+qZTJ0AEwmU9G+ysfdpu7XqzoUTqHGAhs7wh/o+HxOIWztVN43zWm8ooGo2pWj3mj3WTEUHd//ZhxZzw6tKNqEYvEU=
Received: from DS3P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:45e::6) by
 SA6PR19MB8803.namprd19.prod.outlook.com (2603:10b6:806:41c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 10:29:17 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:8:45e:cafe::2d) by DS3P221CA0001.outlook.office365.com
 (2603:10b6:8:45e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 10:29:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Tue, 21 Jul 2026 10:29:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BCF38406541;
	Tue, 21 Jul 2026 10:29:15 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A35E3820244;
	Tue, 21 Jul 2026 10:29:15 +0000 (UTC)
Date: Tue, 21 Jul 2026 11:29:14 +0100
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
Message-ID: <al9J+uxU5sJ/i7Dz@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|SA6PR19MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: b2241446-0a48-4f87-8989-08dee712eb0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|61400799027|82310400026|7416014|376014|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	8zJ0Ua/+6rKVZGvPHGLaHADNoQ7x22naUQjiA9+9JLZi/UgbZSpwWLjQh220XiPFNDZHkWo6WQL0KqdMiQ5G0SAt6XbdI7X242FNwzWrUVZ/d3mxPG+AH1qy5m6h0oPsDuiSu1B2C15dbBWgb1eDKOY6kNjW8qzjiL+UfzoR66ijq9zx6c7JlueN+pA8kfFCfcBY/qb+0uPLEqLcyj7DQ2F5PGN61G0UWpC0AX/+/rAUjQU9eIDJF424WSHFsn6rqpLbRjq2MMf8QkGNFx6dBoCzh7qLEIbfv9cEcPHHYNmE/jG7O+q3auAfjdRXNkXhCF49/zJ5nCWEeKIaB+yiQ3+TXOpdPc1ZmGAb2JuYoU/tsHYrE38KUI7ppfch9BMMb4jJQo7Kv2psqbRaHWt2WpxTuIjsNhfcu72xime9U+WHGg5YSTkPAncZmW9TQorH7U2BVwgkxfiAtVHkYpBfg9OMd7J1YnUU2K7yZ4k/UL2hCjDhxLHtLLlemOzyGdMGYHCBcmVE3r1wZ9MMVdYieqzG5FmTmkQmmU2XN+gkENpYOvN4CbrClmOJ/SlkBV87ASZHeZ8tAlAjI36Y5Tc/Pj2bwKX8c5+SDWI55JPMBR1YxqQuQmRbhce/k2Ecv8tORGhEulZhbamlmNnMfZRMd8FLEVV6qX9D/yZiSKguXWxdGC7mLHo51BpuN/g1OreIp9FR5gIbEsZVYsXIUxTfnQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(61400799027)(82310400026)(7416014)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fNm3pAeDX8XX1J3XACZTNybNtZj34vy59RptUQcW4NeNBWkTxxGS/HL+KpOrpXs23Y99ZCwQu/0B2TnFFATPkj+1IsSJITxE5KokQTb4QqnZeDvTH5LK0M43zAmOjj1Ohqvg5iRFU3zoYCcuQc3nQ2GllVB/Qe0L2eoKHHEMiOisY506e0zlcA8WIQthVGShtbUOnVVpnQcu8jBuoNutptdCT0CDnT7HB9RNBnda/PVRtB1GcaBKw6rV98X6kjvoHjALmoUSaTOlweuy78u+Tnd/UQR/UCbn15PLVpDR31iCsmSr5M808gIal26MiSjYrHukvHsBwVPG0/RoKMjc2gBDY6ejaGab0LZyWeCyLzAYMOWKiQcNioO6qvioZprU7pvicpftyU196MIvIN1O/KKoMeSAmMu5iUR/SOaM4RCtW0CkHDZydTVPdpXM8CT3
X-Exchange-RoutingPolicyChecked:
	SnFE0k30ayNTadOYkP+Sc+vpeYOziCU6Sc+KOn8P6Wrc9YbdsCU5JCftKQZzSpUZ+ebi26o6CaWN77QvHSjk6VyOCbvWST7+ZMCwTuLugJF+KD3SqOg4y8ipS/jRx+pYv2b4B2lxrC8gxojeb7lJB0ZGCvXutEuI/a93AA7/8rAlnoGeMYOA5qjwcCkAU1rCLpoGS+PZqB8UfMBCgJTFeTSNE3/ZPxJMKmfCi2cpM+7D5ssqneQU+OA8IBXIAk+ap6CvOe1HDxiS+Xncp+kXVbqs4OjKGCkwOXipiHeK7Ky/FuRD5VINFqFsK4u2r/4+FIo67IgeXUzi9HPmwQvztA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:29:16.9259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2241446-0a48-4f87-8989-08dee712eb0b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8803
X-Proofpoint-ORIG-GUID: kNlj7zaaNvXcRcyWz3sDQbF6roazWezT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfX+3PgtXMJ+in9
 em4dtmRp9A6ztYHV54qNGm5QOyRvtp5PFt6Dz9D744oXpXNv9CvMpnr6lmmKd5YNHYTQUlss4zO
 Hfc1UG+2kwxEuj9rjIkvX6RoPySUK3g=
X-Proofpoint-GUID: kNlj7zaaNvXcRcyWz3sDQbF6roazWezT
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a5f4a00 cx=c_pps
 a=lEAsXE5stpqivpVhnk0CUA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=2kj9mhMZ4QmHzkKD78cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfX8dHMDVG753sI
 loMlYhy2WtRRPlj2Vy7dzhVdgRUDFhB5BjdNF2qpx0GOOrThDSpSL6K8vf9gKhU/zSTxNflWnq6
 zv+Mkn//XfYtoagujCLPry3lvaqTM7Yf20LumiwH8bFvFGxVOqmDFCZ92a2psNyX18CJg912wF7
 vYcsNchKMnT2jvbMi6aP90fc1kfDCAvEGseBvU3uQa+fHxlOLYNtvizBVtQmcv6nXiBWaPczqvr
 J8qLb8UfKR7tCm6RRxf6iZfXQTZlFB671yvuueE4jt11XCcXShi2Ih+sPgiWQUo4T7gY+MU/frs
 tk0N4vR9Ru2J9FrsEX6JclrJrTwT4UPGUs/YLmo0mqU/G9aMxypy3y8afX6IJJTNpZkq2wO2kUr
 CLSY9BQCeAk+0HZkNwKNC5QOPGZoERj9bVMBwRPCPnViwF57epGSaI6demQ75cbVFZJw3MS1yZo
 2lRQKqqW/5kdjZu9FVA==
X-Proofpoint-Spam-Reason: safe

On Tue, Jul 21, 2026 at 07:10:00AM +0000, Shuming [范書銘] wrote:
> > > +                             if (ret)
> > > +                                     return ret;
> > > +
> > > +                             interrupt->priv = rt766;
> > > +                             ret = sdca_irq_request(dev, info, irq,
> > interrupt->name,
> > > +
> > handler, interrupt);
> > > +                             if (ret) {
> > > +                                     dev_err(dev, "failed to
> > request irq %s: %d\n",
> > > +                                             interrupt->name,
> > ret);
> > > +                                     return ret;
> > > +                             }
> > > +                             dev_dbg(dev, "Requesting IRQ %d
> > InterruptName=%s\n", irq, interrupt->name);
> > > +                     } else {
> > > +                             sdca_irq_free(dev, info, irq,
> > interrupt->name, interrupt);
> > > +                             dev_dbg(dev, "Freeing IRQ %d\n", irq);
> > > +                     }
> > > +             }
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > 
> > Hmm... yeah this is moving in a slightly different direction from where I was
> > going with the core code. Let me think about that and update tomorrow.
> 
> Sorry, I don't quite follow the point.
> Do you mean that it will not work with this patch (ASoC: SDCA: Populate IRQ data earlier)?

Mostly, the issue here is you are calling things at different
times to the class driver, so the devm allocations will probably
leak but I think I will update my patch chain to drop the devm
allocations to keep things flexible. There are some minor updates
required to this patch for my core changes but that is the only
one that doesn't work I think.

I will send out a new spin later today and CC you on it.

Thanks,
Charles
