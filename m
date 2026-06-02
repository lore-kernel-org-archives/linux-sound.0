Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD9C33D4E9;
	Tue,  2 Jun 2026 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780390010; cv=fail; b=BmWbjjc+wvAS7wjCybial8aUaDLL7YTDmWrGQZcvdYfbqiJ+gu6EiWwbIUno7y08UWnPxPTDCWWmf9HFzoy0YqqFNy2HHzQIj/4Q4BKcjSDckr1ycv/dRTpNdRd3RrMiYRbJoefTr7MlISK0drMouAMPwzDEQCMBlYpskUpLoYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780390010; c=relaxed/simple;
	bh=rTC2Qemd0WVjVueh1Dgaqlt0/6rlMSPQTgBBNq4D91I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGoJ3G0a6rgB1zhF84e6mqUhaeGBZnDdIA6Ix2FEuaPVB0kmNtgKLqwMHDEjwQ3vVlwzP3eakITOT4zojXqgbmoJg/+XTs8+t1CrSwvk2zW4GYzlRYZ+5LLRWHlu4tpeR86M5C8OgrolM3ADw7b30U62s/yWbJz/u9MienltzFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JmyExkuL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QL38WsZe; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JmyExkuL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QL38WsZe"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6524LRTb3559645;
	Tue, 2 Jun 2026 03:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ZRN1xJuHcFe8MGpFVF
	a+c3bG7ohI4I7SkPr7JpvT10s=; b=JmyExkuLB1uAed5FSFzyjnJAQozsJiTXMN
	JA6IURQbaC4J01CG7Nvzrose1+65krmCqVFVjEup0pIyao27yKZZ7r9oDV5LmynS
	/fBu/x4TQ3ioAt9PdjJML4uXH1pI9b4EJFv7fmUX5xh4zQTlgI5WinrNBmq6Eujv
	d8dG5JHNRivSpkf8i8D6J45IOrCFa2BSBpQjGLjpF83ERXUCez+5UZT70uLmhUs1
	chdiKLp+pJKzDSMzUH3XsEq8VGFYxlllTw3VHvMyf2xY8ncoar8tR2by7Fj4FveS
	waioIbZIMUfxwl+k2ANzWs5TN5aDnZoBrDs2yyB1SpvFUFB/M00w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022077.outbound.protection.outlook.com [40.107.209.77])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4efvagbyqm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 03:46:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XuMBDWvkXuO31q308FqNBZ9/hjXeLcW/G73cinpIhbmRSfWQaUVR115SrejzKKjG+t62JwK2/whmqLr2CZX0GgrFJOZ4IUWq3M3qIoSS/7RWzQk8Pk9JluMmgVxqe2f89lKgA+FLa+7k0DI1RlzTLlNKU3XIUYDCCci4zUMnO8vTDgytFaJlnWKWqKO1r1ve8ACifAR7oWdinia67yorxv3DR9jmHdOr5+LU03quPA3PcS0+qazagHC0ACK3CeHrguqb4T2tqBsyswr3ExFKiCZY8U5blX//gO0j8Zs0nFAEA1DLxoosW1bNN5xICMfxEM+i97usoLzIFi9ZjlaISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRN1xJuHcFe8MGpFVFa+c3bG7ohI4I7SkPr7JpvT10s=;
 b=jyGYGyreFbpb2Iud7v593X1c/+zHufIyrpyKLlsGlXxfhhH2aI7MtRt0Vz7kJa5Mc1DUNuJFT7jfvF8w5UQ2gWYOzLkY4miuBgzqQ9FldQouEpvqaWNcVv3HZYYlAxYOtdJ67rBNzAZi2tsAaGUIdVvGBcOqr3gF+nCu7ZrVz24wUxX1ZS12RhENjR27NnFSSkHNq76TmmEktC8QVnd+geSv3XKW6tOI0YIGdD9COdLH5jOlw6OMDAWolQejz8gUssqnRwuSDxaDcM4jFhAlv4xFwftLx85ji/OikpiLJEWMIvOCzM9P2ePKmyNrvy0h6crfnpt3ajheiCASqhsOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRN1xJuHcFe8MGpFVFa+c3bG7ohI4I7SkPr7JpvT10s=;
 b=QL38WsZe9iExe3MHdFjDmmEUAQn12cShXiCskPC6KRq0p+4mKkgjaqUQm5/Rcu6qpLchDVfzWVLeJn3Tzz78jzn29BGR4/pEyzp1pyozqbOJdA8R2DhnmBbXeqgzBpR96OuZ49G8bZa34OZOzRL0sZcISiRDjgzitHx72hqArMA=
Received: from CH2PR15CA0009.namprd15.prod.outlook.com (2603:10b6:610:51::19)
 by BY3PR19MB4947.namprd19.prod.outlook.com (2603:10b6:a03:36a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 08:46:34 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::49) by CH2PR15CA0009.outlook.office365.com
 (2603:10b6:610:51::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 08:46:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Tue, 2 Jun 2026 08:46:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E93A8406540;
	Tue,  2 Jun 2026 08:46:32 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D1D3E82024A;
	Tue,  2 Jun 2026 08:46:32 +0000 (UTC)
Date: Tue, 2 Jun 2026 09:46:31 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: soc-core: Create device_link to ensure correct
 suspend order
Message-ID: <ah6YZwfCE8/2s2+F@opensource.cirrus.com>
References: <20260601142835.282301-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601142835.282301-1-rf@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|BY3PR19MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb2b0a8-bf9c-44c1-6c42-08dec0837356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700016|18002099003|16102099003|22082099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	Y9bfJzh0cLZBXXsnnHPnyNf5It8D7qr0w5MP9L/KDtw5Ca98BzTeb2Xm8b9AaFPjompnihkwc7L/sVJgClaoNQ1khGHb1J75leD/Sn1c4CSo8dxQYCYejcaCLU9WYqRVqcXyJnWCbAmCIBDMtWkns7xkOLvn8+eUWav0yGdQe201CDnhbMPfPN6vCReLlzjjUZ2gwpvKO/2/W9oCKNcFUayUWPrmGNi0A6K7DHdlwVAr6j+WJMDWnxxO1u110IS2tiLkO4DWjS2I29GSj9erT5z8HRkaR4XhaUgnTiKwuVKl6kRC2ybUjtc9MJcbdAmbb2jx5sv2IyzQNR5WJAcmoGbs3icQNPef4wic1cpr6Xl8etEVZDrf72rPxsCNWY3kxNQHA+Uz9O8riYNnuHOQ9ZLynmRpmsFAsTICA/hfSKErAIHfH10N1FUAt89U7LVBLECacdXJkFMhN7IxT7luMmkBGqZIMqvt9Nzc9VsB0x2kxMTAL4jmLDniiJFBjc9gngm1wep27ttk/WqJow2WHiK3wa5bBqNnw1iTZTYN7AXHcFLGPoa/VnKPrRphVdAYGM9gsJevzxrP1GVc0St9y3Dn0z0mAi19uoBGNVw7jiloSFi9cMcNyZL2O3Xqhj1ePcrgLMEkXCZHA2KaRCn9ImKxHStu7K/w4NS+reHDmZBvRG+O3nNMckxrytWOUjEx6vNMukECh6BsouVgR7dO6SLtzijqNzliKgXHzkytkpc=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700016)(18002099003)(16102099003)(22082099003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MoEHlYmq4jRedTQYGlBMyrhTtobNlc5EFora1g07CSXPNj7ikln3YybmSgLgIR871woEYYbcJ6lltIo39aYescPD8K+skR949bFmyGJPY2mdW2LFv5rvDWNc/K8qKTfQWYp0VuaAOkfub8UW5QtgzLo2hQA8BbBJRzd8d42IF7R8pgKHMScTYNfENeX6I65S9bxkGt1YBHFE0HIPuvceMRI+cUFWfO3qxNfUr2Hz9yD0aiPCx1DkLE5uyujAKxFcmNTbjq+nLxTZZKG7KQ4B/8xI3cJSt9q/nkvNEKMlNI6rvs7U4lNgQRgKmxXltio+bDVoJUiLtrOfLQFrWGILAOCk1XBTzeldfpANxtD68sYWXUBsHMW4zIFKRaSyrYK/riCswhgbiA4ROsoXNLyNdCYQZFzHM5MLDS1bT0WzmNngl2MvvXTy6gPqnxFmtFC2
X-Exchange-RoutingPolicyChecked:
	LtBIfuSOsD54cY/pJPS05aOSK2Owe4m0xRiOdBu20Xq1q6JjsKrSuafi6739BjH5wfqvHOVyKq0dVnQF+EqkvEwMN5lXgd5dmKDRI8WQZ7nU3qXg+sMKOPJH8+ZgHdkLg/ilj7mxTKr4T0I7/dYsplzEtLPjeH/w3FbXPXgE1TU2Ydn1FpDCy/3DcOSfzilCogEciZb56E7+w0zL1IMzMfIaSEZYbG3W8gIO8S/e+hkbnfXAS4alNU+1mAy9rnU1SyCa5wIXRod7LwpV73NllSqpSWeGMfiFBjxhxDkRheKsntf+gryWoC9Lp55rRIK6zNWW1mCqaub6ejV7EGdoLA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:46:33.9122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb2b0a8-bf9c-44c1-6c42-08dec0837356
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4947
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4MSBTYWx0ZWRfX5+vyu2hHN49D
 8Iez4+mOT17gQhJjCcMXH7RmfkYTZsLR1BrWT1epumrwFvscgD7AgWJO4Q93S6S72gsJDvdAKIs
 +r5PIoLJYLtVhrDfI620KSOhUN7eE55wer3PFG0fQd7e8WWX9OcGXrLbM3pZSKMpf2DOvijuaPy
 tRreUWktPm4zA+5thI/gdgmwEXO2GiZeLmGAofGpd4wm7T5cNAQlYWpazR9vhuwTwCqEOeH2uNL
 TR1pc6d2fpb/6RXSdC4K7vajdVsV1D+a5XsC3I8uPMNaKsf9utWMNZBI8H0WJIqusaNIUCp3CQO
 Y/yn4myZvLbB9HuRwgweJmYCjhmPEbMQMlpYi3AqQsn5BR3mejvj59nmNOIuhHJc3w5wnLW7XBf
 itjYCNrKBruRAKSU/snngvxQfMtIQecd3n0bojqT1id1ljj2XqtFmEPEY5XTz7JYrKujn5fsYXZ
 /V5PkpLvz9iMNgj1v5g==
X-Proofpoint-GUID: HqgBtENnnLa8_-CbEjjm0i0yhekGULOd
X-Proofpoint-ORIG-GUID: HqgBtENnnLa8_-CbEjjm0i0yhekGULOd
X-Authority-Analysis: v=2.4 cv=ddywG3Xe c=1 sm=1 tr=0 ts=6a1e9870 cx=c_pps
 a=X4ZH2kTj14Xf3yjbCCnrEw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=b18r9IszagU5ErLimtYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Mon, Jun 01, 2026 at 03:28:35PM +0100, Richard Fitzgerald wrote:
> In snd_soc_bind_card() create a device_link from card to all components
> to ensure correct order of system_suspend. The card is the consumer and
> the components are the supplier, so that the card will system_suspend
> before any of the components.
> 
> The PM core will normally system_suspend drivers in the opposite order
> that they registered. This ensures children are suspended before their
> parents, for example users of a bus driver should suspend before the bus
> driver suspends.
> 
> For ASoC, snd_soc_suspend() shuts down any active audio, which requires
> that the components are still able to communicate with their hardware.
> Previously there was nothing to ensure this ordering, because there is
> (usually) no relationship between a machine driver and component drivers.
> If the machine driver registered before the codec drivers, the codec
> drivers would be suspended before the machine driver snd_soc_suspend()
> runs, so that ASoC is attempting to stop audio on a driver that has
> already suspended.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
