Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D820C3F9F47
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785858966; cv=fail; b=hlkZjatTsq0IrXFdQCh/xYF2oa1gd/Z55UhOpiJ3dhKX2zQHnDwQpQEd7/j4g3LO11f3posLZ94rR9q0kPEueONSY5CyjBeIW3/pEpXgut7b5eZhXdp/LnHn7KngLlUSfKXtCoSw32mjF+ediu6SmTUkQVrk7/sIF2qac6MnGwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785858966; c=relaxed/simple;
	bh=JxVBV/QMbY80SqcQisJ6P+Pd6kGkT7bVIF91jSaLe6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtoCpVrbvS6Ba+WgVmeDG6MCcDMLNIX0+gSs/+TO8Mw3VWzw+XFnmA9CoG5QVGHASDTRCRUUhYULIeiu/kc3RHMXGF7cUxoh2sPJ4eEdeNO2g9xUsh/BLD5V1B3uLt8Ya88kLswMRFHVb+1d1khvNMUY4aICSfJ5/BbJjjbWtIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hOsX6pos; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ay22S+p0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hOsX6pos";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ay22S+p0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674Ekvfb1135499;
	Tue, 4 Aug 2026 10:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=0JGuNzjnuW6XmNBvHR7N59qsFaIBNFurhEdPIu7PbRc=; b=
	hOsX6posEs8xvV6c7GeR6snApVreQyQAhO3+qRg74E6I7DOAYwSwYNon0ChTjyhu
	lT46Fw4HE+yGNUd4RnWqD/btSCKum7KiGfLHMDxwAFPyecY9s+b6RN3L3ftcJp7P
	27Tcc8tw8U/6p2zJXFgU3HzjEm2u1xIC4YfKJ2cgfpSO5Hdt72tAHsDI+PJZxl6Z
	+Pm3bHg1dE7opGceGxZvJhYyewt49VS3YtWKiEK4Oun6QfMhe83O+U6/OFgf3mQu
	PyYyDjQUboajls6ljG/DiYr2zJXPl3hi9GYVVi5HKQYP/tppnKauTX1kJHGggm5v
	QsNMznIDNohuganv2sc+5A==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021083.outbound.protection.outlook.com [52.101.57.83])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fsd7h44hx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 10:55:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEeVnhGYz69oASTHOMN8t96/LExwTLjaZe6alef4BvaPyBHui3Oii/rtj2/8Xgp196dbmICRFkd0SDruN+QWw02uMO+gVDb33xu38ok+sT8FU4LifQnSAoh2ZKY5/7neObLyfmmDYGsevKRs/AJDP0r141XP2xPiu/cgZxawUJ4ckRUHfSzedeHZBqAtS3qU55B2BX6naejTLCSp12xNnTkVG4/yJgu4s6YheiGEripKnujsipq8deGkEuSrrq2GbhZR3taCwLBL9aardj+wIKMJvZwPif3Y3inpVBU2kSN/vtOuZkEN3l577FlTCu+FnXYuQbhVqVKoihkgsGaKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JGuNzjnuW6XmNBvHR7N59qsFaIBNFurhEdPIu7PbRc=;
 b=Zi3PRd7WVC1HfxoMAkgen5rHrMICr6mHiSv6iq+yRIce/OrmvsMqZhLgFcWTi9dd6TJhnV4pHrMOpv5FhMm7YwELaXbaH6IQmNWOiOF3xX02AKz7RgDVA+DuUbxAe7aOZ9/6Lt6yEwX/KOf/cqXxqwrRvNqTdWoNbAwa6hM7nHHNaQ8oDDCo5t2ZvWlgc13uw1qyBVxWGjNj7rLVCOPDneP5RdKBS7MGBK6r6rURiS/s3MecCaPVxpaYcXxBaWM91wuDouJb/LcIbnW6n4zqszAvEJD+DkF+T/7XtE+sgQgGemky8Cp+XK1z4r/5weVILu5HUYJi7qBXQbC+SzLlew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JGuNzjnuW6XmNBvHR7N59qsFaIBNFurhEdPIu7PbRc=;
 b=ay22S+p0uxxAhAxU8jkpJ7cxD9x9lHm2Rs2cvnBiqFy1dUy55hbdnqy7ku9JqNokBd+MC92srGhAZcp9Ma1UeYnT6NPlDrUzQl8eSZglB1C5hTcAUrJYoX9E2cCEx2xEy5Kk8c2knD/HFbJIi0BXiTMChri4F4/Rs5xB2BRoAHM=
Received: from BLAPR03CA0071.namprd03.prod.outlook.com (2603:10b6:208:329::16)
 by CO1PR19MB5142.namprd19.prod.outlook.com (2603:10b6:303:f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 15:55:30 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::9a) by BLAPR03CA0071.outlook.office365.com
 (2603:10b6:208:329::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 15:55:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Tue, 4 Aug 2026 15:55:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B37BA406544;
	Tue,  4 Aug 2026 15:55:27 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9EDCF82255A;
	Tue,  4 Aug 2026 15:55:27 +0000 (UTC)
Date: Tue, 4 Aug 2026 16:55:26 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com,
        pierre-louis.bossart@linux.dev
Subject: Re: [PATCH v5] ASoC: rt766: add RT766/RT767 SDCA driver
Message-ID: <anILbp5sytyR7rGz@opensource.cirrus.com>
References: <20260804104828.557228-1-shumingf@realtek.com>
 <2fd91870-51d8-4604-a281-36b6c234d737@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fd91870-51d8-4604-a281-36b6c234d737@sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|CO1PR19MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: eda0928f-c948-4a3e-8967-08def240ce6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|61400799027|36860700016|23010399003|82310400026|18002099003|22082099003|16102099003|6133799003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	lQDA7w+3uiT+XU8KY45b5olMxBx+kHgnApCc/Z+NQf/7YxNwhyw7YsCcRfz/gaAYNGWWrWSRUSncVLtZlEedwP75nt4UWHKN+yuV5uSQ+0iDiNcd+S630bzsovVN6am9YOU6ZvKe+bZzwr2ti20tCNUV9kwPSCHf7lwMbNnUgSNpCG+lK+FN7aCoHBsqce8NCG9hVvhKI35tX0AHgKBVShvX9TlCkjBNARkR7IcCvNMsVeocpEYRAcQXjHfV0pNRtFRPzN1Cc2Gqhvn4sirXmsxk4Humfy0mCmtlDLL7dBF1SuhWitXd1td2oSeMuMt3C/plg4bEstzu3p6ggu5/RAicrm8wdsG7uYufCyLlY+GQrhZ+YyT1EDR/HpBRBy0LeVW01WQK9vnrlGne5nMrUIC9wr8jr+lTAoygrNsvDMUVh8x5W7XIAQ9e36FH7zzPsc0LLVKjpEAflZUiQ9uXuBy177/8YxdbXzsW/tIgr9FVaNYBM43Fp+MbA2WMdffLM3XJGZSMJZXIQ5XoKi3hqNzLCLe37G8SMFZ8eB81uwxMYsxNGBsiiXfxJA8kwMU0itqlbz4O9BpQiO+bjWPg6yo7mMBjsyNxeDs197DDb5ocxR8oZh6/MwMuyH0JALgU+4wXBIoBBuTpz6U9WO563R4LIozulV1HgeGVvmmvuhmP1j/r5uvo1+3c0p5hzm0JQEB01/4LOszXt/Gh1v3qmQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(61400799027)(36860700016)(23010399003)(82310400026)(18002099003)(22082099003)(16102099003)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5+CKXgKHzVlEwM2o51RbXQdjMdgnqPhl9CQFJuaP/R8pQWiWjbpEJTuv1bu6TEMD0PBnPoO4+BJ7rhs59cKQ7qm+CN7TASk5DoNEz2YYg/PtlK9Vboqt56qJLL2S5XWyiKflkTyjiPuEDBjiuRG1WAjp8IVHbyS775zvG5fiCdgrqtQRUMdJ2hkb04gzIMCEe6hXRfWvYO9B5EtD0I+54144quUvJkxYkLgl8ZHR6hbuhGmbm9dHnscWe1NK/P/EDsjRvAekHLp9yDeWaSNGOuIUhmMlE9mRBcmI3DktTI9gmaOP0cB5C/AlRYtM/cREwlVUQGqKpW8NTY+dKDBk7DvnKqXWBDG0wvBST+OXYqm6YI5axWiUTi/qiC31nk1yuYqVLxYBTy+ZdqpH4eTi8cmAS5QQLMdsdzyOmqM/lf6toziunXhheFg/R5YmNj7p
X-Exchange-RoutingPolicyChecked:
	JQk8IAdyZhoxoRMr5bILKs1SlWPpoYksPyK7RR0anKsK/TkzARS3F2vQ4n2+GLYsFhTA/GAvvo8/BDDRg47WFUczWfeTHLfCXq7S8HajvKbcB+BMegDjm/0pNA4hsB5olBDf6GrR7tqd2ORFYFsUIenU9/2JgXlqAslLqxgPhsx6MPTkwWE6LoykUsuMK8D2p6obJl/7jjh5/UWlTeDb5cfj6Uug6NiecBZjlFd2hYzWa2uhUBmbjG0cfnmyvrh7XJ0hnosMuQlZWknLrXHj4Zf0+yTAviLb5QOpdtZQkJL7q4tDrCtCIj9PqbuXl1SkJg3+49KlJveQNlpbxjUEAg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 15:55:28.6168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eda0928f-c948-4a3e-8967-08def240ce6c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5142
X-Authority-Analysis: v=2.4 cv=ZK/nX37b c=1 sm=1 tr=0 ts=6a720b77 cx=c_pps
 a=r42+2qWFvohKmCmFF6SFYg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=n9Sqmae0AAAA:8 a=BLtp-71l-YUFd2vlTJEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: dhTaZvbbUZEq0kPNxMzCfgDOjdRv3WR6
X-Proofpoint-ORIG-GUID: dhTaZvbbUZEq0kPNxMzCfgDOjdRv3WR6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEyNyBTYWx0ZWRfX5S3+xCMCP53c
 z5OuA5lZxe/31mhXFCGYwYRXflLePamhrlD1d/uI6SEG8EKQJ+4EQqR2+q71/fflthv5VSC7aRB
 Z42uICAfm4ipIefEJWNw1KfrR98YbjzSW0LdaDWyJpJXDkNdux7BeiOEweiA/3IUPXCd78IwIPO
 PqkGaPZ4OeNedbFIBN23unrT/Ebso6OaXNBWa94sLHBPxeGbFAtIEfhZ+gfyPrJhGj9+7VJPBV1
 X3VEV34xF4hhZojeQeOUCwmWKMBqiZO0QmpC7Pk1eJedjul0aEcgDlQ333A4xEb6fZ09+o47rYt
 zrYBe7RZdRgyq4sb07wgtV7QVdHVUwkcpH+2nrm69dQjrPKbF+q7XYduA6W2nmPS9OJvONvZsgz
 TpKcta9Z23mkNupLsYTciCRBfmbImMeBONP6SuTA6qbn0zcZq6sfs1m0DRaAB6uDTfBZrqoJm6m
 /CP/xa53/ssm8D+uE4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEyNyBTYWx0ZWRfXyf/pPsk1AWFO
 Vx7GR1kPkDYspPvXGUYX+fUQSFqCcUwNocqtCXsi5dxR1wf7lOfKfEYbpDrW7mU2lPmJ8cmajy9
 XXwFixoSMjjHqWnrcgUX0INGk2gr8Mw=
X-Proofpoint-Spam-Reason: safe

On Tue, Aug 04, 2026 at 04:01:44PM +0100, Mark Brown wrote:
> On Tue, Aug 04, 2026 at 06:48:28PM +0800, shumingf@realtek.com wrote:
> > From: Shuming Fan <shumingf@realtek.com>
> > 
> > This patch adds the initial SDCA multi-function codec driver for the RT766 and RT767.
> 
> This breaks the build:
> 
> /build/stage/linux/sound/soc/codecs/rt766-sdca.c: In function ‘rt766_sdca_irq_ct
> l’:
> /build/stage/linux/sound/soc/codecs/rt766-sdca.c:240:41: error: implicit declaration of function ‘sdca_irq_cleanup_late’; did you mean ‘sdca_irq_cleanup’? [-Wimplicit-function-declaration]
>   240 |                                         sdca_irq_cleanup_late(dev, function, info);
>       |                                         ^~~~~~~~~~~~~~~~~~~~~
>       |                                         sdca_irq_cleanup
> /build/stage/linux/sound/soc/codecs/rt766-sdca.c: In function ‘rt766_sdca_probe’:
> /build/stage/linux/sound/soc/codecs/rt766-sdca.c:858:35: error: implicit declaration of function ‘devm_sdca_irq_allocate’; did you mean ‘sdca_irq_allocate’? [-Wimplicit-function-declaration]
>   858 |                 rt766->irq_info = devm_sdca_irq_allocate(dev, rt766->regmap, rt766->slave->irq);
>       |                                   ^~~~~~~~~~~~~~~~~~~~~~
>       |                                   sdca_irq_allocate
> /build/stage/linux/sound/soc/codecs/rt766-sdca.c:858:33: error: assignment to ‘struct sdca_interrupt_info *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>   858 |                 rt766->irq_info = devm_sdca_irq_allocate(dev, rt766->regmap, rt766->slave->irq);
>       |                                 ^
> 

I think this might just be a topic branches thing, those functions
were introduced by my recent series which should be in your tree:

https://lore.kernel.org/linux-sound/178517447302.50339.1499803314056469107.b4-ty@b4/

Thanks,
Charles
