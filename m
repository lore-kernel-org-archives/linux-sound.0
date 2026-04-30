Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03E74014BF;
	Thu, 30 Apr 2026 12:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550643; cv=fail; b=kKdKbfpdRlu99kd9tIgyiCRNMvWH8OVpr6S16oMBftPOsiM+dbxudn04YDBvBkfxpp4Gsi7XIW4BVejM9hsUxt9gDhWiKMqfnj3rdk58kg87M+JlshQZJLqPxP8c2IKjx4RdccVgZ3PCaYdscOu31aM1aFHTFQHPe/cez9UfJuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550643; c=relaxed/simple;
	bh=PbSYhrU4U/6gCneChWnEe0vIywSo36p2JyfoWxFbJLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h102X5qALgC0krpwDKYZIhg5YiYeo+nQYS2NZJ4DY3KmciX4udNE9y9K0o5hhS18fiyPqWJndxowzcQx0SDcb98EtZjJEupyfhYw6t74qEpkkINoybV5JFwAP4wP4iz8yXGcJtIl4JrLbMjpiByKNs4f2gXJ+Zx6pJf42QDC1X4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JKQ2wCLy; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=JatZoZSl; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JKQ2wCLy";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="JatZoZSl"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U6ds7h895499;
	Thu, 30 Apr 2026 07:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=vnBUQmxoLD66cX26hu
	A6yQUn4xiaT39EdsIspttVZkA=; b=JKQ2wCLysZgObWFsNmNcQ4i5APzleRFJ7x
	/p7txBbQfu4+6wD4LnOpCQIsPu3K0ou+PwkevWOZvMPpw2nvPViy4fx2blPHLdzv
	uDf+s6EBUoaFvdyaTMM4E6Mx0TdJK/lX+nNwpf5Nfe73BmHK/OUbGI08Hp7M6hQA
	yhLGl1ATUvVLkPkQtlgJHAQeeL1Fb9u+oTh5PYOz/UMkXsAWtdjdlcLxP0mqEAXc
	xFBzLzR9ixzuLEXTCOrgIIROlMlIr9Ki0d5h3bLZelxTTKwMcJ0vmRrsSe8l/DR6
	ohrlcw0nna/yco8CmsMUBC7nx0hKO/pqP5CSgWSQASOTLIIwOruw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020143.outbound.protection.outlook.com [52.101.193.143])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4drt1jq3p5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 07:03:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtMAVxOcTfrOssG57mMWBrzgizBoAc3PeSwmIY3YFuswcsDxYsg/FSQQdw8le7HevDTRvXYONtxr3+JU/JoPC9X2o8N+AKNEBZ6mjWXRaF7n7UZYTlEoL1J6U5AiaOhMv3CKR3g76zCCdTp9+XpaWNlmelY+6ntYlMFEKkP0BQAXFOgg1mu2ScD0DRvYORAJRyi7Bd1Tn6c2xToXfb/1+ghTGYjXTGtj2lJND3Ic4d6yfMwMAhvx/Zy1a+qXhkeVqo0yYWiqeYGQ2+yGVbaXKhoTKomC4CcbJIRzyuSA8DUXkePk1+O3gTwD7417samLLDRcf2WDQXQw7fRfvm6TxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnBUQmxoLD66cX26huA6yQUn4xiaT39EdsIspttVZkA=;
 b=d/Z0Ppuk5hvSnCNOj9fq3KcyAXlgs0xmjlv1S0Kn00E0sMdBLRBFpqE4ObLUa4QNDyXPYnj/TJSztT9vVIdB6E0D346qzJaas50wx/gopdXH+B6whMXONzWYyxWiAD6qOD+cAna7+mu/6hHmMnHAA9vBo84oS/Fdjd9L8vG86UMQDYWSOp/MoYWxBd6gZ1WDYxTYOVRqEn4QPh1SUwId7AEAya8hSFgfReP0K5iDqb6/pONnqdh+DwUAgvmzM5HucvG1i64ubZ6IB3RFX1JWym6ogDq6mvXDrMmNYGCVjkS2b/i7RQLBVXVZv0tDqxAgLYVNla1BFkOFWLO4L2lGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnBUQmxoLD66cX26huA6yQUn4xiaT39EdsIspttVZkA=;
 b=JatZoZSlEvoQuvlEOhJ3ZSL79eA4oOBbloZwuTph952fn8ty6zADlH6J3GOTL8wHkC2F+wdL2AanjrKpvZzgwaedZpkov/QOXmdXh54gZU5UnIYSHREyIOuynIyYldHNkunDwxk0rHGSHptm9cqBrNE2nYt7hHHiNAtc+IJuXnc=
Received: from BN9PR03CA0587.namprd03.prod.outlook.com (2603:10b6:408:10d::22)
 by SJ0PR19MB5429.namprd19.prod.outlook.com (2603:10b6:a03:3d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.21; Thu, 30 Apr
 2026 12:03:14 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:10d:cafe::dc) by BN9PR03CA0587.outlook.office365.com
 (2603:10b6:408:10d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 12:03:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 30 Apr 2026 12:03:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6DAF240654A;
	Thu, 30 Apr 2026 12:03:11 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5367E820244;
	Thu, 30 Apr 2026 12:03:11 +0000 (UTC)
Date: Thu, 30 Apr 2026 13:03:06 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        niranjan.hy@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 2/3] ASoC: SDCA: Remove sdca_function_data duplication
Message-ID: <afNE+oHIuS4vhufG@opensource.cirrus.com>
References: <20260430102120.1283320-1-ckeepax@opensource.cirrus.com>
 <20260430102120.1283320-3-ckeepax@opensource.cirrus.com>
 <afM1ImzBB5lsueUa@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afM1ImzBB5lsueUa@sirena.co.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|SJ0PR19MB5429:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d61a5fa-7e0d-47c4-e74a-08dea6b0746c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|7416014|82310400026|18002099003|16102099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LnwwOiyjpx4qK2WE5NZnd3hGLE8AXXpOm3n35lmukNK73nbGBkqr4j0600vjsTMVymE6hC2vOP9ff0Q77g0U+pZU2RmpoFh58ofg92WnOiHviDFqDFxoQN1gCHhfhk+Hb/igDDDxSso6TGtpkQ8v35MLgyZY4+QS1vDFg+vB8t0pIqA6XjZj5DVBt79fpIf7nP7nGFg/uOAHEvWi/8sV32GhwScQf/aPX57CICnUS4J4wxrLxVMSoJ8ws9Od+F4HDdZgTYLRgOfS2Bb3u6MyNVD3l8s4oLzA/njln5oQSz+NQQQjRzIr0FasTrMeI/f+Ty2VlLLSq1B2qgd3ZLQlHw9f09IV2rTVlsGvqBmxG2pHD4UBBb2yUce/1lx8ut1f2CsqJtrzDB9XvU3lkqmimJU6diGTJw8QDUwsYm28sIO/gra/f48xCL5iXB29Yzq/fy/uLVDmXoSzRq/TaKUvYX1oUzmvgaTWDydgKSbbZi7Ftfrlv4EKRq49TTajCyMlw5Ddk7JDIPqnKl2ekc3gatW/jU/e+mg5NJPAupkWAPHg3EaljSET3jWQ1gBAWSPXA3AyNTWYvh1Bw+yJjT+SdU9CRScn1akpVMRkVh75Uincv/p3pTPZaUv+NUnNOjYcBcbyRHPhFjjWoltaH5GjbLSe/LeESTmX9uj/lLbq9kZCvIpb/hwjSEM7viOU6cxUZCvulTqtfSuDYzhcaI9xxyBngVzNgevcDYsRoLulCOJKo+BvVODCup621RAOFTcdg603iEYci9M3tV7dvDn5TQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(7416014)(82310400026)(18002099003)(16102099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	88WMRQ11eeHtYHK+/hJ4s064tYqTqYd4p976YaD6nzUosxQd9Kufy77Qts9+dFu6j5CPR/9IZDUQ7NlkguKVaOhTJDeVDlQL22tNZUPqGtnfUc4xfZ2PlKeioA4y8A6TsWPhOJYV0vEBINKOcoriVO/H/59XyB4xIP5j4kpVYf9bWfDVB23jUp2wCsaK6n4c7jmAG800d0RF+ZSwrOPC8vi5S9REHDp3dExGQOCbztdrOhBSgk5TWeonVF5EzlIArnuKmqJbknOo9oAoFuWgGrMj0i1W150SeoHzI5Suk18FiWANhjivFNvqNEk00ymErVD23vlEc/wss/RGQaXR7IuW9vJ+OHKuIgEpfVBMzpdtXb/dtDAxm/4A9aj64Z93SA1AcrHQSshlCANhQ49zfjt6oOCdHsES8uQMiMd8E1GNe6OOe9qQqZNlEaxPaiup
X-Exchange-RoutingPolicyChecked:
	ZQYC8NbpoJgBm840gDGXuXLYTPhP/3aRsSPUdBHiHtR8IMEb1+OJ3uIseU+y5NBMceX5y4uhxggN1kxZHreFEjbbgMFhy/onyWeA8dbupR/DpvXeoJmL9Wa9tgpXfA164ZAaTb1m9r8ztAkGcgS/idObFZ2+huIG7PZP9VEA6yHlozDrApwHAVVnK9mGJCo+fdkMuSCSjm9w8G22uyMQ0/b2WoTMtBb/AiCbIxo+HqZmeuKZvl/Qmuyx7qbtDaQg7TeEb1/kPMddBb0yvlqRQI2lIvJZOO/ivnsC1jooiH80Ba41JLHWQ4u2MoCFrS2N4jegKJk+2NPA7CocbbsAZw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 12:03:12.8815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d61a5fa-7e0d-47c4-e74a-08dea6b0746c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5429
X-Authority-Analysis: v=2.4 cv=fbudDUQF c=1 sm=1 tr=0 ts=69f34506 cx=c_pps
 a=jjRKKv6f6yUq9knPWvjFwA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=6mo3d5KXa8iRTanxck4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: cNWaw1fg6VK2KJiY7M9KGccbObrpOZe1
X-Proofpoint-ORIG-GUID: cNWaw1fg6VK2KJiY7M9KGccbObrpOZe1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMyBTYWx0ZWRfX/FPBYgOufj2T
 VcaEYbyVPMVFCYiXQRrquu7vVl7GrxS5zGHamv2PXhOZubdTpnVjKY2Q34o6wlE2nfZdLz1wjo4
 L9ISOC0D3e13uNqihjintbRjr0tuTOGJKB0NU2xh3IQkr1xY7t3FxwAt8pZ2/2L0fy8oMEkWnPF
 9DVmilXdrfN5IFn5gYT62N1CdRCMN8Ip3e6sQIpRSVC1auQK9cGKlIdyUFkumBYCgGQRoUXVMnE
 cpozDNF5gkz9np/S8UzcvIZ9L6GGONccOAhnECngV/8jP1tIRjgUyzPwmeHYMfmfW9jgs4rTK0Z
 3dilKA0f/cUDYAzY9/I4etAeWvb0k6a/uBizWUwOCSP0/cO3CTx7WjNF7Qyo38gqEZfOggQMND2
 DugjKMHje1VAtgo6bDyRkDY4tQIYPTcWFVCCgWUwre7+FQd8nrW6I/wIO6In8CtJ04QVoMsDO46
 26Iao1MKmai/PFNzqSw==
X-Proofpoint-Spam-Reason: safe

On Thu, Apr 30, 2026 at 07:55:30PM +0900, Mark Brown wrote:
> On Thu, Apr 30, 2026 at 11:21:19AM +0100, Charles Keepax wrote:
> 
> >  		/* Parse the function */
> > -		ret = sdca_parse_function(dev, peripheral,
> > -					  &peripheral->sdca_data.function[i],
> > -					  function_data);
> > +		ret = sdca_parse_function(dev, peripheral, function_data);
> 
> What sets up function_data->desc here?

Ah shoot, thanks again Mark. Sorry about that I will do a new
spin and try to be a little more careful. Overlooked that this
driver doesn't call sdca_dev_register_functions().

Thanks,
Charles
