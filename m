Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DAA2EB10
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785940476; cv=fail; b=Dkwxs9N+fusP0TuSDzOd1ABkXPN7But07+XABuADAqF/ox1UzJoARGpvzC4tzD3Lzr+JLkOCPVomkJdgucDfcCW55QUUouauu9DWRGHhnxbkE/y6XNfkNM9L1OG/Ot6C5TxzfosCTey8Dq3pWFaWKAITsoZNfrtl+K9vYzN8ufA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785940476; c=relaxed/simple;
	bh=rYQbQ8HLhY7Lnw78TJxo8D9nDWcMEid5evzv+1pW5QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqrbp8STXkaFkwmyMKEC3xmBQ/ax2mxU7IRz9p1rb6wCObPW7dlSkDh6bhV20n7OSIsxMoDO7gbm48yENbXwHnGu1Ulx1U7muUT8XrC8N73kEwfDnwsbwuoyjPbaYAsXz6w2ExwVCYCD0PqwFCJ0saExaBUPKiB9pGg8Jz0MJ7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KFOJC1RS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ixAcKykk; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KFOJC1RS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ixAcKykk"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675EM5YZ3529798;
	Wed, 5 Aug 2026 09:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=V1mNci+JI+u3PKT84S
	avsetCBDD40XFfA47P8XbeRtg=; b=KFOJC1RSzqMYXmncuO6FpBDZRa4wSNyIs6
	ATmzBadBXT3z3/ejUwbN7ND9//WmcGdbs8SIIxG7/ev9JySGzak/Yx7/F+5YhdM4
	CIirZ/X/grhtP4ixnmkvg4ndXnPpsg8ehI1RGMCFrvUbd1I/CTd1FcuqRjmJBi35
	0TG/4OoABd3957yxjgH46j2Aj16a277Sx36235W4iqdrb6axAfALUcgx23HOTYgy
	51QiqTclW+qJNdkYsputNY574KY+SLY4Gas+PHDL28xUTvw18DLEDF3wqapr7q4k
	R+DN1J6bBq5R27mlIymXyrBv1DBW8Key8/w5Yeq7kNUydXQf+6Ug==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020133.outbound.protection.outlook.com [52.101.193.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fsd7h5wrx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 09:34:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYJYSXY1x82SaRNmB7HM5iSYyr0WW8PYqrV5Met+ER3BftEcLYFS5Kmla484A5tqnE/J/V0xopJQHjyvrHTgyrxiH/iQwgQ4oTlYTgM1inKwUmOMTHFlJ3o6hSeELOJJKbFu0TgMtsHp9yNmE5/CfaGMugCL8EBSBUP77XAnFCe4IKHZ1ebw09p3jZ8rzQkBY2fIPoyFOqfdwmbkwXsBYQfQy2HcUzW4wbw9HC3STrkv415OTEW2oQGdzrfzaDt63lLBjdylwlVTlUuu6q9kKLTQf2iMDeZUVxjmxGyIiKYzE8PHl8RmtFusmKjmby4UoOz7nI6kGKcmjDmHEKxG4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1mNci+JI+u3PKT84SavsetCBDD40XFfA47P8XbeRtg=;
 b=GazJSUHbA0dZls1H9jOafILmvWQOh7pZyKw0kppe1o7FgV1j5x7YvBpBRjuYq2Hbz33ezIr3kIltDimqg+yHXVEPqRIpE/soIBRYl3EIoQBpBTdT76y9/pjpCtpQAWWWvRZ977NmVKvo1egVOuZ/dn220FnJzSNfs3KrZFim0VIxa1/Q0Ym8kv9dzQrEJSNCesN/iprPB2ZHY/9ha+1puPl5qR5ubCgGU3WxEMTbH1toVGHVbgstD0lWi0jdhYjTIMIGCexcmHkfW/8SAShybptmJLK11R9QFCNoDQQyDKWoYt91nsEX6iEwok2voYrlMSvrwelD/ZFEDgsVBDtYlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1mNci+JI+u3PKT84SavsetCBDD40XFfA47P8XbeRtg=;
 b=ixAcKykk6Sc1bEBNDvj1bSOLiqNYc9QfRewmAlLY97NkRv/CeQNv3laso2kJct7/wEtisH5iBly5xn+OcD3+qgCXbqcsMBnhGvQF62x63V5jj5xWBRncrl4SRDs7O0GigawdAl20WYW27Xs0N4oft+9YZ1s1yv8uta7Pxs6EFWQ=
Received: from SJ0PR03CA0342.namprd03.prod.outlook.com (2603:10b6:a03:39c::17)
 by PH9PR19MB278024.namprd19.prod.outlook.com (2603:10b6:510:3ed::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 14:34:08 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::25) by SJ0PR03CA0342.outlook.office365.com
 (2603:10b6:a03:39c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 14:34:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Wed, 5 Aug 2026 14:34:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CEB2740654B;
	Wed,  5 Aug 2026 14:34:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AF26482025A;
	Wed,  5 Aug 2026 14:34:06 +0000 (UTC)
Date: Wed, 5 Aug 2026 15:34:05 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH 30/31] ASoC: SDCA: Use auto-cleanup for firmware loading
Message-ID: <anNJ3bwyIrA5NVP0@opensource.cirrus.com>
References: <20260805135247.670693-1-tiwai@suse.de>
 <20260805135247.670693-31-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805135247.670693-31-tiwai@suse.de>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|PH9PR19MB278024:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ab77a2-2271-486a-bfd1-08def2fe9be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|61400799027|22082099003|18002099003|16102099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	AwIiMF9e5v1WF7yvPzpRxWYkNTtGOrCOtF9sB2M1c+NKuMc1bBRSEtoySuAqN0Z9GDPmfaZt/qOcMnh1+fHKUZoN1uhmmQicEaaBPXfCFKEBdmUytnAJzu1MjBoXz0Koze1PQxbB9W9JzKnJ/eNdBGpAPn+P4QFiwVOp3vfWrTtoHAopch+mD/MAi6o5oqI1luocIYfCUuXO31lEAGvPIoOXYMxPEvBJ+vcLOE5Tx4VWvfWMPyB+TB2m12fqEDhV2neVcKSCfJgIdrrYfA0tp75q864qVL4TwBuaDkhp+L11K7Adagb3Eg1tKqEnxKK1AbHKAZj3Gica2XU9KryXOfLcU6jzAuG+3OpOhJzAvrGekFovm4EEFLH/g0b9VvggPNl1IrpNUBVRUcqM7btEp7x/FlhQx8ambjPzSeMMKIjWECeN+StfT/JOwE1M68lX9g6ZdNEllAtaFTBGVvNqGHXMOYqsAFN1bG0UpyBaNvA8im4BbD6VsrgiXQE+D7m0Q1jYNgaeHKFRdQt87frpQqi2TwTSLCafrDnPpWnMYXv2FzMz9yaHIlYm1P6a2PfM6b8vo7FTUeKHRYmpQEGDNH+d6IfF/gG6gaMuckR55gmQSERFzYmUj1Mf2bIURG+WFlj1LXDd2fK4adSBpZEF7TyAC4LS5eLd7U8zaxIf3GXGKb1vk1eROopdFsGaDU9F295dVWaIYTvLOZdnH354Mg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(61400799027)(22082099003)(18002099003)(16102099003)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D14W+wMGN9AZ71PYuix6Mr/DbT1I8/ECf9H6dR9zoeoh41LycQ5pzOdpHu3DHEqctrgROtDbU33L0bJvxibZ3v1DdEXrekxCAhaXA0slMZXoVbJw6Me8W4Caf8dZBBcjZg8tgPo7OnzM9M3cYBKbU/343L/NU9MfyHxEn8A7YO9xVYBZTG9XM8dBndotA/xCEDMCCkIPaWu4jeFoYyAOFvNIJZBcFuXh6fDRtY1ch40cw5yvoWeVdA2XufeSNEhLUK3xPshOBvKpUc5d1G2lJA251mMbpxy5ZXJJa+mZ9l+KIzQcus6aPkIJeFgrDlCXUMpJJTaLfq+NP5pIdSiTsej1d+o6Xh/xdnnzLeAf97A+Ur70Pn5BY/yo8iyzqJuarheDc8sZm32hxCcFXUahpNHH2SmzmAciZg7kc/cWI+gIYl0aXLPE5mZaJEfoMndd
X-Exchange-RoutingPolicyChecked:
	YHd+T8V9GDzkl0rQDgMFfqJFRUGhNfeD/3r8a27f+U1Kw597BxHZ1Q7e+RFq0KATw3OJxMFCBhNUb4D5718C+G60Sn4ZHZEWeTHaIkYlUDHUL0aFnoIvoXbMF0Fcazdn3J0oGmrlb4ONFiXyFYcC1156Es1cO76zlrHHdtoXizF/kfzTAXQiRTFR3uaseN19EWEHEVfOtTDzkiOwpENi0LgWyf2/yR3om9NDL2PyhuYYT/6I0j8oMBYQgd3JXtU3f1GFugUUKdD9ga8UjpoTXUOFMrOCWQ6lmyDvY28PONL6SAmzEjr/wety7A5o2ZYcAk55LYZG5jTWa/o5P5mVqA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 14:34:08.0891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ab77a2-2271-486a-bfd1-08def2fe9be2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR19MB278024
X-Authority-Analysis: v=2.4 cv=ZK/nX37b c=1 sm=1 tr=0 ts=6a7349e3 cx=c_pps
 a=OkMMD3sknCYbbSSSOfdz/w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=QyXUC8HyAAAA:8 a=TbqMa0sRfL8p6kDNybQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 4ZEpcsDDj2uw9MViJFVf43MiU-0pqhh-
X-Proofpoint-ORIG-GUID: 4ZEpcsDDj2uw9MViJFVf43MiU-0pqhh-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExOCBTYWx0ZWRfXxSu9Ivdof51u
 CEXODYBk0+x2xPPBhAGHsMx9IHEXCDAcDXWNFZyqCskHStJur5zmizESQFi1OH/EGRyGWryuN0D
 VdN3FJ7XNakhnoAV5wkKunDKgKhOIdeT1fIwhKCsvxxmmaCoSiD1w4X2adbTgEprHT/oQd9Bf8D
 NW0nRK1k2jrtH+SD+5BG7bFmQEcZBWn6ZwWodCu0H+MarCfDOQJhmY9Xfoex82U7BmTdZEMuDxk
 UUO/0Q7LWPjroaNadeMIpVO2v0/LUso0COfQkp+qpF9lUtXrh43ycrybuIFssLGNNrYf7aP7sus
 NEEM1aNtbKljXvp6aBaWM7dGsJPEgDZIrcd+XdtxCMU1O+TjRhOmHSTXXNEv9rwXnSFB9LbUkJh
 qB1gY1xCcPijRn7m9nqEO96oi5yNhBmSmlCQFT7hHnb+es8l6ekdKXc5IP1q/PGuhmB8GrzMwRQ
 fSjpeFbPvT+/WEWUGkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExOCBTYWx0ZWRfX9iWOlmF9OHye
 fICdIIKHVAlveschkThlSGig2iukMu1u6Dko5U9rwCzIvA82+3FLhH1w6kIrLi4+eMowyuXF85o
 4CQHa2xwRz/xwToRiKyniniu/d/gxP4=
X-Proofpoint-Spam-Reason: safe

On Wed, Aug 05, 2026 at 03:52:31PM +0200, Takashi Iwai wrote:
> Simplify the code to manage the firmware loading with __free(firmware)
> auto-cleanup.
> 
> Only the code refactoring, no functional changes.
> 
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
