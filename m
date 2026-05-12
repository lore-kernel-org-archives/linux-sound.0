Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C674963C0;
	Tue, 12 May 2026 08:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575187; cv=fail; b=TnTh3pzlsQOejAbZFa1tjAfrWZ5AEJ+iiFjGeNYotTpCPrCo8RJ+GYOzXWO49aFtJ4fGPuZyHUCMEmLytJsK24NoLR48rr/F19P45WFHW6X3R73Hv3xN73wT7hBpSNNECy/foDi+FWuIiTQ7ezjNEMd5AWXFm84NjLpa1ULFIlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575187; c=relaxed/simple;
	bh=NKJ1IUaFn4zdZzIfeCzkmwS9dTh8aMOGSOmqyfOQh3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADraqc3IOPhMrz8KwfimkZGVOhLqGfw2tVXE7SWY+7FrQuhw5EcrZ9P0lK87KLobQjmm9/z96sEg2HIdw3TQIx2c+i8JXvVa95FIUH1oB13eaE+hAAljWSyDEEmR6Ef8c0JB5KQCV1RQsN0/ACeYHcvaBjsxwijGGcMtz9foiMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=R6W4Ef47; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Km87+xpS; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="R6W4Ef47";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Km87+xpS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4v947797268;
	Tue, 12 May 2026 03:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=SUCkbh4fqXVeI7SG4j
	FOs401V5L0DwP2nPQGERJ8bzg=; b=R6W4Ef47ULvsrWyP42yfhjEl7jMzL7LEzW
	4GgxjrV9e/AqbD+wsAbwaKPs162RZHNDF7dYTiX12HQL8dY9iIGmRfmzlaKJ1549
	zumI3Qag6BpmjMTP3xICuMhft/JJWCnfszC2cdsGFXzZrWjc3SwAyX+/j/REBTMO
	6UERib0LVmOMqCwfNMfV0OaNZwBEq8vc9vPuSJ027fbMl4/K4SCd5yexX753iKUi
	GIGPH6rN0zWQF5Bnmmz/l9u6aUErkoiPsJTTseks8btjKmnBsj3Cs+ylHyrm9QNc
	EoSRhirRylWSpLnNU9OerJ3/ZCXYzNPpN/iTVkZ2lYnPKzMjBhnQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022114.outbound.protection.outlook.com [52.101.48.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgkkd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 03:39:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDUnclguFTcTUTP5LUJPFff0fqzlgEZWFr6mFqmk2U2lqLcWIgxML+2WphrASQKdWs7aLFinxT3KAsRtzcgtUjp3wMMEakgj7s2nM7uf+4YTpRdABXDJZGSDqijQrEb4RIeX7r0d/x5T5jvfrPJUMIl6h7AV+ci5kJzJmVb9C/5tTyI8pXtqkTKHKKHweR4rJKbDCUYvRwk5e2bJPuZmG1AYZjPXzQmO8XPb8vsh2f99WX25BieMFo6IvDbBLt6tuGHnJqqZBgQqhpxuVf/1KjqRJ8j32/c50P8f4vCUJxHAlGE5KRUpvhfvJRH3fXVW2MySqMfFVSfEp/ZcwIqNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUCkbh4fqXVeI7SG4jFOs401V5L0DwP2nPQGERJ8bzg=;
 b=qlAiAu+kwGQ3gkp3cDKBOBTIXHri643Y7taqYbu6BJF8AmioJcnEs3cwBN/0aOFRoYmMPbqUISE3gRHt8876geISKvQyxa0Ff4OSMvZtrWya+CGxH20b7Vqw2VtBfzEGw4XYFLFDAPpvlEq2EH4IawzoOi5eqNQn0wiaC1aGRE02Oz812W7PR4DAyS1189kG2UMYiMAhxQ11QXKcTw1R3pKkF4p8ESPyKYDowEie/2x4oDGPu8X12OtZsNn5YbCp+JHWMqUr2JgHU491/14MtLSK7PdSPyvnuEvRkoaulV9YRal/HaSFtwnbBFXkm1sXLbTWwnr5OzkcWN2Ru0cmtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUCkbh4fqXVeI7SG4jFOs401V5L0DwP2nPQGERJ8bzg=;
 b=Km87+xpSVpZX/oYMqFC+puHVKTsLQlAGVmQ9gvRkYU8stxt/XHfUHnh+8sJ8uZxcSpRrGrlYazFdTsfw9Wn4jWtvCfjJEJ6isHkqWn572Ay6ULqTL0zBS+fHIi/cDZMqKpPudsUYpfRr/in2I990nPHvWrtuJc29ziX/RbeYkLs=
Received: from DM6PR07CA0087.namprd07.prod.outlook.com (2603:10b6:5:337::20)
 by BY5PR19MB4099.namprd19.prod.outlook.com (2603:10b6:a03:227::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:39:11 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:5:337:cafe::82) by DM6PR07CA0087.outlook.office365.com
 (2603:10b6:5:337::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Tue, 12
 May 2026 08:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 08:39:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D31E340654F;
	Tue, 12 May 2026 08:39:09 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BB7AB820244;
	Tue, 12 May 2026 08:39:09 +0000 (UTC)
Date: Tue, 12 May 2026 09:39:08 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 01/18] soundwire: Add a helper function to wait for
 device initialisation
Message-ID: <agLnLKW8FV94L+Rh@opensource.cirrus.com>
References: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
 <20260511141029.851125-2-ckeepax@opensource.cirrus.com>
 <agJ5k-Nf1NAr01sN@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agJ5k-Nf1NAr01sN@sirena.co.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|BY5PR19MB4099:EE_
X-MS-Office365-Filtering-Correlation-Id: 121f6b6f-f8a6-4519-30af-08deb001f0a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|7416014|82310400026|11063799003|16102099003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ClbzZU4w4vsVJVYA7SvE7xCi1nC+99n8hEycTPs9jsAr8swxQjBQWgAw6LKPb5hqqxw9nTCgi0uFTN//GrbefrAaidKjTvwJIo8NiJeUz/ATxO6iwbCS3ZS9s1yuGzoEW8DsHk+4mw7U5E9wac+I9P3pP4M9emx/DQcE40TAe2k5xhY6h2I37Okd+/n6IlKRKeE9UqAtLMJj2FbujXYbDoI34Sav0oLM3i12/k/DQ6JhiF+A7DU+PqAwYnyiTApI9I+Jp7OSt1jYzov8mJ/+9dcgmgjytEFIrxNlG1YPI6ALmpMaaOSemeZ0AOSQNyZVA0QCxyAWfObk3jdzCUNIaf69Hg/Ux/Tfh3g4PW0m9BxABM3lXX0Pgia5t/q7oqYd7LVZdtAzpKjkIsHtd/7icy7Ek+E1RfJo0UgdPP1PF/DAYLjxM0a6mwBCogL4A4VH9HDgh+rogChljbSdV/IQZa+4FvvLmjO7OA+tz4+BhuZ4jYBlEOau+ZjNtyGg1Kqz+YAlEEbDkjZUPw01yORA0alNVoskIfWYLfIK8zM8bw9LrmlKMkx9ddDIs2c97rqgDPaUKllyVAP/cuF4UPI2PP9qQw0pwkvAOtlYuOKIApv2FJRDFbtsU81DiJ15sdyQ82sEebKgUPzTioCz2n/wVENUS04BiKV+nczl5RRVKfzjClj5/KUux4SeSmc58ZT4H/Tdyd0CFZ10L6rLjV6UH9IU77yuFfqWz3EX3i2eM6g=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(7416014)(82310400026)(11063799003)(16102099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ub++3dJc2f+cF/l8UGvgXjTvXO4FjPbuPw4a4wq2RJX2jj1li4U8pwkgb8XuRgW3yU4LdMQ+eGfFh9e6Q1ecNGmZzQfBr9iRVLG8SO+GF38IYNCcIAr0waJGgkDCBtCBwhSHmU9tH55ILNbD3vVjBVl/o8/ndGacK3yOY0Ji3LlrzYC3T6CQR2J3lAtksvIwNFF45Pj9xEJqKHUwz82BPIZ3jM0RS1nD3ViPxdkxMBwlCAnESgkZdu4n12czuqtB0/AcnBZEpQUThGMGicEDYrdgQDFr9eT5ZIBx4KdDqLSYgv6BDyiGFhOtA6p3O/VRTsnkfPwUPhkL3++Wk2SBcPZqN95wwer0BgfpAFjghBQ+uNjGVN6IWO94KghI67UA9l3BogV3oDCR1LuhanugyICJEJdfTVzL4vXRpotyA+7TwkVOQJbiEN09vZxWtOG
X-Exchange-RoutingPolicyChecked:
	LCUg/B9YqAv9rGJuAPiAzc/iy9eznQ1nSdDnoa+1+OeKruefUhnUdhWxNGrZEUGm/QUT1OovYKQBhQKLLdZhiJm8GCLXWEKMRL9yaKPgiJQYvPRLv78LKlDFZO+JARav0IEoj8Jxu9Pt/G0t0lvxligaiOX4nWzmHLLbRANZ+ZPf2uf80yJ3+AaDakBjAmbGAEfL/YDzqTDxHRgxoSTWkCltrZRvRv23sygfIsmwrW0RKDa9w+GVLtKuLdtGkspxeucKLDrFcjVGjx7XCf8d0J+biqBeIwQpCJKGxcCkaw+hAXheZYQPTXCmNVKMgU88wkuwg3KtbjWEv6WOMoMqGg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:39:10.9130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 121f6b6f-f8a6-4519-30af-08deb001f0a2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4099
X-Proofpoint-ORIG-GUID: aU8KyodwoAdCh-t3A6DAC3Lo1TGrGGCh
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a02e734 cx=c_pps
 a=5LyF95Caz1MJpeKVvSEBBw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=onwNwoKyvlfYhtXd1XEA:9 a=CjuIK1q_8ugA:10 a=QYH75iMubAgA:10
X-Proofpoint-GUID: aU8KyodwoAdCh-t3A6DAC3Lo1TGrGGCh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4NiBTYWx0ZWRfX2MSriqKwUPQQ
 uXcTvHomdLMgp32O87lTgDwdC5WhU3+H8Zya4HeafdaYfyJVazCurTY5syCq2UiT+bZC+kgpn0h
 XpvIJWU27mSCYcHaswSf78qdGlLtPl5vWNhbOIOgLTbvqDIlvWxO1e1XFYcuKTLUwmZ9ds32u9Q
 dQfq9pmdLry2VcQixwaZqahqqJkKCXEdSABjEmGxrejUodWYafIlRviZ9U1MHGE7BvE5KujDht4
 fnlIYfbL9+vEMhPczvmuYabyL0E4fS7k8twgC2XyjhAQXXCfQcVgtR+1mhAkxK5BKzNji8waLgx
 /qlGdA5oqmYNRo6WDx66QDcxACMjPi4AHni5WQrgpelhgER29sVZK/WwK5np7sOMusFh8V6u6fW
 a06xsmlazMgcSsJtSB/rAdcvxMo/C72RjFbt6J4cQrzGp4xWIAyEXaAVOgpVPR4/tpycMKBdXno
 rLDC5X4rR+twLe/V4MQ==
X-Proofpoint-Spam-Reason: safe

On Tue, May 12, 2026 at 09:51:31AM +0900, Mark Brown wrote:
> On Mon, May 11, 2026 at 03:10:12PM +0100, Charles Keepax wrote:
> 
> > +int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_us)
> 
> > +	time = wait_for_completion_timeout(&slave->initialization_complete,
> > +					   msecs_to_jiffies(timeout_us));
> 
> The parameter is timeout_us but we use msecs_to_jiffies() here.

Sorry I will do another spin.

Thanks,
Charles
