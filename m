Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA0935C698;
	Fri, 31 Jul 2026 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486746; cv=fail; b=TADSDNpYRnWCB5vm5LkDDV/5n+KLg4RXgrDHvKaj0cYZR38Oyi9VOhP08/wdOPRb8ZSGvv7HILwnCw1fyJdFoNU2e2Gs6P0sGQvyAkQy8std+xLpkB338bHrLhiMTQzvJ95b4LLkO3ZHXnJGxBJey83eMEsmKSvfBNrSyRFw8/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486746; c=relaxed/simple;
	bh=+bAVUPbq8I+hjohB/iR21njOeA+aomWyXo84pd63pxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOIcrxiBzAj8QHPxydDzQUlzI26GG4OscpznyWCNBiEHSbfqfYyOJ0933If0RD8naLhYfJe0tyfVETtvbrfAmL/GkqSK5H1dpbtkg5R2yTjDWev66eKeVsi4YE4k1R7p7+/AdkHzeKOk+DowdEGF4yg33OVR39RbWnRBTcwms4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PpXNOVAe; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WYK5CWp2; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PpXNOVAe";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WYK5CWp2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V85u3m421333;
	Fri, 31 Jul 2026 03:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ZVwK2N7yNhVOXzsBTgKGTM/VyUUbnO3ePQdE/1RVw4U=; b=
	PpXNOVAefqQWO2K6DZ+6/DfVKdc7F3HimG+pHgRxZV9wFP6M8g4v4dB0jcSCzBKL
	0Pp1+CRMV5QabopV9EAGPcfCcjN3Y2pwOBblEoTf1x7dzmZqn7OrpBpY2y2Le1V+
	BBxGk/aN5fYE0WGktQeqw3/PYv+7WFPD00aZZdE4dVtJYmsrp4M3McmAn/MPxDjy
	AepmbZSSXzm0vu0Emxn90ZXnPnu2qvRr8IXYOa7McWbHI6xGcCdkW1utk4rHIQwK
	QaBEnBar9rdO9ks3CeLK5zLKpOXoiEfX9i6SuOIQQr8dUwyj15YkUIiXGNApeLSv
	QbxvVbX83M4SaZ93aH9coA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020075.outbound.protection.outlook.com [52.101.193.75])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4frqvur0sg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 03:32:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7M2JFuGUJTSHFGdZx8iVwSv350xT34ozqEr2xOncbSWhMenq4RBk7h5Pqi6OYhtP5dnpXutZZBpduYp9FHmNzANL/Xi26HYUE3S1a/iMxqbdD8igPEmYWIY6XyHgBr7mc6jo7i8NfRMo1hXQUBQWAhOMLhuXhNTaqrl10VV++7FXBybLLApoKxwYChodPxJj/JNbl+FS6bsG/qqsEz7MBQ7T1FPMVKr9vL/xVK9LcFCVdHK2w20Djw79IC6yO39DLvsudJ8B/LI4Pvf3cuVbXzrVLw3i4gNqPOeaSXVwdzjvwlEyvZzgTgjAM+foPQ197DszUHD+s2m/N2V5HHBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVwK2N7yNhVOXzsBTgKGTM/VyUUbnO3ePQdE/1RVw4U=;
 b=COM2xOBjfJjQt7BuQwGVIxZVYGLd+jRYeOYpRbMArmmpyyaGiSVicLzRyrIXhO2JyRj/e7ynnGZRzO/JTNcj0l1+VY2Wez2eDfeHVtVIYM7Uqeb46oadJDFQpduJm1jNqwJ4Gtw0ZPOhdwyjMxUzmKT7vB8hvClY1riN8D9TlHzczsNDrkxYEl9pVZWcYB8Zfli14YSunqWYa/arhyv6LZ7LFecsDWy4AH65x78yajrOPgc9OZR1aeemcVDqy78wAIlh019IMHWkYNP7/Ogv2KJLpe+/adlzn/rrIlpPWulbCNqLwwNyF/WKRLN9ksmE6RKXkDGrl6iAR2OFaknkmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVwK2N7yNhVOXzsBTgKGTM/VyUUbnO3ePQdE/1RVw4U=;
 b=WYK5CWp2j4+Y9uibYXPrxPU/VRlf9U1xv9ocqwn7Gjo4eQFwhCG84QSiNPxJ90lkP5VAiwhLaGqWUnF/K6nOInYlzXapUd8UHRFvV0Pye1eN+Lf1ij78TuSd2dK3gLgPnm2t99p9UUduWCjFGS2T1IlrTGTeOp7+p9OMpzv4rGs=
Received: from BN1PR13CA0014.namprd13.prod.outlook.com (2603:10b6:408:e2::19)
 by CH3PR19MB8326.namprd19.prod.outlook.com (2603:10b6:610:1cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 08:32:06 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:e2:cafe::7f) by BN1PR13CA0014.outlook.office365.com
 (2603:10b6:408:e2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.10 via Frontend Transport; Fri,
 31 Jul 2026 08:32:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Fri, 31 Jul 2026 08:32:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E7662406541;
	Fri, 31 Jul 2026 08:32:03 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DA8BE82025A;
	Fri, 31 Jul 2026 08:32:03 +0000 (UTC)
Date: Fri, 31 Jul 2026 09:32:02 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: Re: linux-next: Tree for Jul 30 (sound/soc/sdca/)
Message-ID: <amxdgg7mKgy8/uwg@opensource.cirrus.com>
References: <amtnlbQl2KLongvo@sirena.org.uk>
 <ae2d6aa5-1093-4ec1-ab29-ac9af791fb5d@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae2d6aa5-1093-4ec1-ab29-ac9af791fb5d@infradead.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|CH3PR19MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6789f7-fe0e-4a5a-9f49-08deeede33e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|61400799027|23010399003|13003099007|56012099006|11063799006|4143699003|10067099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	atW+hcohkPyaO+FvkK3XKTPhIiqIZk9VAMoPFZYkVii+PEpqVVKHJsMYth+Pjq10JsIb1Eo53okQbcar0poRiL8ZhWfEnTCg8QRn/SbyK1VWF1se2DjpU38IETUVvN8abQUVnoasGfu44MUkF1hIX+ANgwYR7sbBQk23EyvOzWcS4STG17+3xdthSXsrawe93HF+hbX+6W8iMqEf9Yhks+04F25ypHYN2whwfzXn6b+U9ynSvzwSb7EQcQ9KztoJkG93UiECGaKfX2ezmGXv3vrH06OWyauu5oUnInwJwmjB71CVBQ43bAIx/1jjJRooDga8SbVxXT/BFBD3xKeIahZc8USZV2SAYWfVHlarBFI8SDsOZhNPNKeOGzgFABh1b1gphAzXr9MVT92NTDF9hzCBkZBgg0SzqZdz0xwvGk3ouDmU+3XdelotHQt7Kg5q/AmB9HUAqvVH3XiLQzs5R75+cGZuKgWB/I0fTX0l98a3M+NRk0pQUYijibURuhfNnfoH2x9uWHYFm1mSaeBTbWs3fy6NPKHfEyWpauCzdq4RIgYlEibthL09rhdHXtRldH+edLpdIe4w6EvZ7mzGtv07tgH6mnHa2ez7LSSObNYErgS5V0bhO9XOn7H37onXVN1GwmkN64qoCvFWhMC5ZYyaaxV60rgEYI6QWM1QWMANxMgZI8Q9Mj+hWU5h5reJNtqCuif+Pu4/29aZraCIAQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(61400799027)(23010399003)(13003099007)(56012099006)(11063799006)(4143699003)(10067099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L6AJOVd8731hQwYPqZVsLUMdORRUbohCWY/xECprCcoFTXnLnBmgOIK1D9muH6oZ/rBMBwTpY65IeK8mmKLxJLEYBnFxni00pf4yXZdfZBj+AcCjFsVgY4fG3kAvzSb6MhV/VsVqV8/zTIU276HTxh845I5hIZzDOSKUj19hJ5iQ0RxwyjdRfl5kj0qf2c788WL7FvtiB3GLIKxNm1xQ9/U9tJlfgMm3PJcOou6ASKzMwIVqbIqhklGjEewFQK/S56Dld5u/iwOR1InHju3uTc65rs1ftkschqMHF52VAyBedgMTu2l0cV7sHRiCYvszpSWBOzXbIVjgPlBqfhRawQ6GVBLP/i9xIjOPRuNnmAaVczGahB6oOUl1RhnA0lRvRp1ajLM5ITGAOmADMf1sT5M/WUs1DNd+dBp1VTPVU7FERsHH6Mrd7pGWng1UhfIi
X-Exchange-RoutingPolicyChecked:
	WfOaXr1SprKRGEbOUenxnUTpgu/20sj/3YgPU83bOjNKwZDINmjVtMHOQz7e7bMKM7Yo/caNqLt7Y95LcoisVbIjWf53+BhWjnfPtgp5Hp4JRbGMsP/8rvYwldts94oCx4ixqTKH937aY8XSPycTHoftYp2TjtXfnzvkr8Usz33JqK54j1fzu34HTKOsrM1mxlJMmaj1WfEg+n2o8K9TQdDUS37DVuaQJQH2nnbSOM5WIWRNtdYBRfqLkS5cbKk/ff0bJeUYMVEwUVmAMV+yEowtYxiW23zPtpJqqJr+ZGlWL4P/6RyuNvIOPilddoQ/kk/cNtj+30ip+10LBgq88g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:32:05.1894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6789f7-fe0e-4a5a-9f49-08deeede33e5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8326
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MSBTYWx0ZWRfXw7Vw648dbK4k
 38pUbgyY1vJdkW6Gsc9aXReO8TSE3aVUAM4UNK38Qy5kDBxVWPdnrsHt/+GCXg0o7GuaQBmC4uP
 p0VRqmUQUdC4wqU6Clcp/u40J37wA76DCEZLTGOavaz7tPDmZjFVOCFfVlSricohFUjYCjZtEGD
 DhEZoQRkHQcgRjRJwc3w3c243Oq0bWNwQFhfwbertKMHavNbD5LqXuhooy/NcdRLyqjyo1RQvbH
 2qCtX8ZHGa+YPo/EUaMSX7TowJJMc7YFEMn0O0W10u1ENAw55PJbBaFar85YpTDCuos2zFUaGH4
 ysgr53mPEwnxC1Vix93W2/VTw44S/DCSM9GlkTVWAoxoOHXyvIetvu+sG/WvKZybClB41ceFCJU
 BDsVTemacvD4CBQMFJfy+awX/P4BthlMO4lkzKhSHPzGY/YCLfCmAgaULskbFUlVjfV1IAQnQEQ
 V39YEhLD+OgiCtJakgw==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a6c5d8c cx=c_pps
 a=dTGz0tuhMYfsSU3NwIzouA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=PuMvXuilpeCuq_aAP20A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: mlPL6BpGiJwR7YoiD2LYevrQiuCDpJHy
X-Proofpoint-GUID: mlPL6BpGiJwR7YoiD2LYevrQiuCDpJHy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MSBTYWx0ZWRfX9RxmesUADmGZ
 Un/qo944PzxXKOlT44P5wtAcT23AMeiy+h9Dnepo5e3f9WYVYGrjvz5M3ckR1j1hMVNVdUKaM2D
 ykKFA1WTFPWnGkOusYrT60XoGlWx3WQ=
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 30, 2026 at 02:40:14PM -0700, Randy Dunlap wrote:
> On 7/30/26 8:02 AM, Mark Brown wrote:
> > Hi all,
> > 
> > Changes since 20260729:
> > 
> 
> When # CONFIG_SND_SOC_SDCA_FDL is not set:
> 
> ../sound/soc/sdca/sdca_interrupts.c: In function ‘sdca_irq_populate_early’:
> ../sound/soc/sdca/sdca_interrupts.c:471:56: error: ‘sdca_fdl_free_state’ undeclared (first use in this function); did you mean ‘sdca_jack_free_state’?
>   471 |                                 interrupt->free_priv = sdca_fdl_free_state;
>       |                                                        ^~~~~~~~~~~~~~~~~~~
>       |                                                        sdca_jack_free_state

Yeah apologies about that, all my bad. A fix is available here:

https://lore.kernel.org/linux-sound/20260730130602.3747053-1-ckeepax@opensource.cirrus.com/T/#u

Thanks,
Charles
