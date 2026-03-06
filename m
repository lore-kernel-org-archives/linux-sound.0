Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9938A365A0A;
	Fri,  6 Mar 2026 17:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817458; cv=fail; b=fnf7F9bvwDYnVn3TqD4dfLxHryC3jQMssvbPg8D6/xV+kQZ43T4tNV7U2xI9kmB8P7cql5XdKCpVIld3bZ3HJBbn8/cP1AgczSHml72o7Uu244+R3eG8di8xzyl7uZhLmjdbxxqBvGp2x1JEOySgk/8viWmcwMa7uUsM4S9O8VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817458; c=relaxed/simple;
	bh=RMY8+RrmuA1zkE16cWxKmWO0W0yUXziiVgVqspsGBwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cko8CsDs2MT3CZgGlFWg4levnxZ8YYL4eFDXfvwA3j804K2zhnfYINZ39R81Do9vcrxv3goMOLZc9IL4Y3bGU/awtmsTAKnHl3bG5kb2GL0lLPlkak74sE0BNfliIGIMOEmFHO5+4P/3RJEmJsZhj7YJP/1y9Oc3gQNgJ/+KcuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CYLCQE8j; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Q4vlZ76X; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CYLCQE8j";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Q4vlZ76X"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6267WUKc2505709;
	Fri, 6 Mar 2026 11:17:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=BmSqTnvmO1vGsGuloF
	I6ZL63WhplHVTA9byCYbtZ2nw=; b=CYLCQE8jWtbLy2TkcV8KmXpU4krf0H/49F
	galI09Q3nRG5GbGVjZEwrh5+KWZ3mN8bt2+9aPu90alREZWi+Q1hKfo80RblSv69
	63D6HtxbshVSqsHXJbcSVn/2ptq6LrmwKJqCAhXEQaAFJBIQWinl+KPWFTfRI0Bt
	/RRKEILE/5JJeQ1toSmkBFvZPd/re6Tjwe6xwQvyM8t7GKl/Tc9XQvBBsZSA8uQA
	V43+MKSyUzNTGANXTAE1/b0BeEuQcVnCXxhzUuJzYWBey0yri8qn5WpTb4I3iqw8
	SdUwjvljyrnUFPQqkYeM3zIKkaiDrYhT61ViajcyJqa9ei7pGwXQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021101.outbound.protection.outlook.com [40.107.208.101])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ckxn087vf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 11:17:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNS3jm7ODN2kMe9kpLy/wNOUMbWk6K0dxvXPnxLG7u4xnSo0b9g0tUvgkmQt1FbyQdpr7TsyImM5IxRaGWOuazratEm/tUjQdb3tWMePnKVN/bVPJDLZBBpRIFvEfvZTkKQBgg/3GjTzu9rinbZWnW+v/5NjZNz8SPt8mV0MsvhjdGjJS0RsyBYReRLNTbeVg4OaYMYFmplOoS2eFogH/7Y0Xj9ZtjiD85/6On4x3+M+2oeZFicgCFedp54ovNtddZn+5ptsi+q3jEqWa9k3A4y+OqpQHIWnOp1jcw1bCiwvRa40UyiVOdufUfKSeLfVous1gxgL+C0oCr0Grjfn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmSqTnvmO1vGsGuloFI6ZL63WhplHVTA9byCYbtZ2nw=;
 b=ouRl9sQdJnJCDlZcG1REuFCDFwVHd6xWanhMguasNL1b7cmG52G9QdNkMPgt+whCKBfn7yb5JsYSH6pNNLa1dYJjJ3Mt3DgF5OrpQH5G0IdCAwn4feAKLkCYpmX9/6QsWKR3ijeRBvq1tD7O5hUBQDrVDPGsuxaoDp/cbnGoNNILe2aKHU9P9kwebZx7BQOLVcyeFURHquFUwrlEQ2ACFgrtGUE9AoWuni7jLSTBH+cPbg7POQ3e2EyIflMDSCGyJyqnOR//SgtmifAmrk7fWB6g2F+07XXtE/iJL8im6O/nk89Mu9J/oAXiFKW6LcvNl74dsaUNrMXvSX2QUaH/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmSqTnvmO1vGsGuloFI6ZL63WhplHVTA9byCYbtZ2nw=;
 b=Q4vlZ76XGPT6b+0WOQLJ9GpqqYIqjiOzRFb2u3j8X+gRUe59iU0eoDAuq2s/onf7UUuzatRoe+xBZQasmp4D7XJMpW1rJEPdpQT+wnPXSSy6ZG07S3YpUjmLljtdofSWkNP9nN+HENumb//EWHjHuEH0m2RSDzR0ztHeXE0uhFY=
Received: from SJ0PR13CA0115.namprd13.prod.outlook.com (2603:10b6:a03:2c5::30)
 by CH9PR19MB9298.namprd19.prod.outlook.com (2603:10b6:610:2de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 17:17:25 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::84) by SJ0PR13CA0115.outlook.office365.com
 (2603:10b6:a03:2c5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.20 via Frontend Transport; Fri,
 6 Mar 2026 17:17:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Fri, 6 Mar 2026 17:17:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6897B406540;
	Fri,  6 Mar 2026 17:17:22 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5239982024B;
	Fri,  6 Mar 2026 17:17:22 +0000 (UTC)
Date: Fri, 6 Mar 2026 17:17:21 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 0/4] Add support for CS42L43B codec to CS42L43 driver
Message-ID: <aasMId08pHzCtS3U@opensource.cirrus.com>
References: <20260306152829.3130530-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306152829.3130530-1-mstrozek@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|CH9PR19MB9298:EE_
X-MS-Office365-Filtering-Correlation-Id: db848081-bd15-4edf-8b43-08de7ba43bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	+71RZLK7hjnCQ+1lg5g51XNZhhkb6dxbGaKyR5Drakneo3II3nnMtto721A8/Lp7ObJiJQWdPKn47eq7H9/XIr1PA2oH+zBrbNnV1WzPIO8Sss+5lSota6h4+vTzf71r3lCumtWxDlWrTv4rRzZIIAAydePVo3pu4vh5fBRzi58wQrRFmYS3GKSMNIdDgVx4GqOxDlJ7sTyEHO+tGw9q+diijJOy6YJv/+3zUjMLU7rpbLRKG+Db6aZ70nXZA6HMTYtekNuBOwn5zm9Kdnpb+xIBdVswP/aP1JBrvZiXN2hAgu8Jl6oMujK1V95Aq9i18HWm+XZxuldYuZXiISuKl9jhUXrXBQKvmZsudIivQ0QZ819Sce/2lLvs9CDbqVL9JLq2MbDJs2WzuF3IMV9zWytLfk6aQ3mD9SpDNmI6+mMnpsgQig04G4tu+LoF1N9yGTS2UlU7UqhMLkt31gxGUxgFxwdM3pI6M067RTlvQGYMHQMAWjYxsWKVDiWBLZZfBg1bdcJeSilVkJNY6Y8Ht7odQknDjzMOlv64yHcksLkxWcb+Kayie/RIZA/XR4rDLCosrQe6oYyx8IkilMxdyrbhgpDYJS3W8XQGJ+/QyW5EWvX4clw9xHONUhmb/GYwHOEQ9ScIbkPqM78Qte/wWwgQVCfcehcLNQDFww4uujM/SAba70gtsdvJYg2iUmGTZdgyhL/Ce7ViZcUTzTOwgkcDUe5QEQUF4ijX8tCAOrSt2trmh2q1f5QqsstBGtb8LvBTseoMNCQXwpWYaUTfJg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xe6fNaw28jnFha78/YWIAMEdvORV1s+qFJ51T3N6kj86S3TNBxC1TgTlSKODrIagfXsjCK3uYjHYKn36aByJFsU1lZdJyqyomerFWJvaSFIE71B9aR3H5bTX1z4C/gQhnHwx6W2wWxg9+gXF8011JZ7RyUrjiwsqPpwCr3e0lTLoTjpPN9dqxllKcWu/KHQ98f8UexOHVNtVHx4ZW+niJT1+QkJ6X/8WeQO+ZfE5rD3Vqt/cjNiFQ7GK6x/W+KhMNToIoejp7etlFRZOfU/yMuRaXI8VgSadG1Teq6TOZPitakCWAidlhmnjJzsHJpiZakEsDu7kIVtQ4HFHXdATzJad1PVmzy545mkvr7qdmyJAsOD+wZ57sNgVpIOLiMYzqZoYBekWkJYY8I69E6NJRVqWXN/3mO2/BvblqN+5DVDmSHUQRlwzpOAooszf+Goq
X-Exchange-RoutingPolicyChecked:
	i8PBVCsxFHSntcOH8oWDJCkJy7QZyRIlwAaqmrpF7JAFxv+3/YYljnUAtF9Nn1x60uUBmNGubG2MlpLKVCHH00pp4V45g8VH1qiYU7QaO8/sZDfNHvofST9GhPNSAc+zU+RGcHTvM9SUCD4p3nof+l5YQDkRtgjuPUDzjh5YRjoHVOo739F/EonrDdyIu9vAecX3kbHspxpXTnaMY0jq4+OTMcvGKgHXVbltsJOKn++mwtNtPcUy/OYE13OfcXPqdW0RO+42WzPbc3ycCpqJkJ7vGOO2ffgNzoY8DzjNBmCHg3RohcteyQdTECFbVHBU/bGFeaJX9qMF6XeqaO8xSA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:17:23.7106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db848081-bd15-4edf-8b43-08de7ba43bbe
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9298
X-Proofpoint-GUID: P2m6Oh-Ty6UF0ZHz6yWbn-c-t04B4P4L
X-Authority-Analysis: v=2.4 cv=VtQuwu2n c=1 sm=1 tr=0 ts=69ab0c27 cx=c_pps
 a=y0MURNDS5CvtOemsVNO2Rg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=O88-UEvnqW5qY6NVAaYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2MyBTYWx0ZWRfX1s8JPcgvSN8S
 BU9rh3Lj2KIyV9VNylHjJRCrzt+h6lZ0y6JijsXbvikEHvbQ6ZNGHvUXW/kOu+wf8uy6bbImxmu
 xaDDhjorPi+QrbITXhNXQq0t7//lIGm+NYJYMMPfeHTb7NnHgpZFIgEjH5JI3PROmGnMuzIofSf
 8V2eyzjmBz9PH6jz42QCvEV1Pjh56H1W9jHBX5EpjHM2zegeZbEB7j4qQlxDoGAdf8iDKm6EW+s
 Fuh8pecFqSXZRihGlzx0WfdnRPS8PSYSRYpHVBFP3gaCnDJzn8Zm9yqISUB0O1VjTl5IROObASu
 JYNlX02sq/tLo0m59dq5+GGuM4TzvMQOMacyVc7VeXr4MHInoriTdyfxsfTMuNzPBHyHtSRqE+n
 z3Ah/dnTxAxtJPgjBJZhsIIss1/de708nXy3bIMD8pi53KsYp2roh5Tgguelv9Luya+ALmgmAhp
 rzBTXjE0AMd0WrTi8wQ==
X-Proofpoint-ORIG-GUID: P2m6Oh-Ty6UF0ZHz6yWbn-c-t04B4P4L
X-Proofpoint-Spam-Reason: safe

On Fri, Mar 06, 2026 at 03:28:07PM +0000, Maciej Strozek wrote:
> Hello,
> 
> Introducing CS42L43B, a variant of the CS42L43 codec with changes to
> PDM (DMIC) inputs, RAM/ROM memory and extra channels to two SoundWire
> ports and ISRCs, and can be supported by the existing CS42L43 driver
> with some modifications.
> Support is split into four commits:
>  1. Add CS42L43B codec info to SoundWire utils
>  2. Add dt binding for the new variant
>  3. MFD driver part 1/2
>  4. ASoC codec driver part 2/2
> 
> Regards,
> Maciej
> 
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
