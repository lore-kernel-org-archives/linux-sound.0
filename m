Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176D0304BBA
	for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765452548; cv=fail; b=XOFxTGRxLsMOO++9K3Q8mc0OVrI33ET846ZrvGl/5R+xVc7vn3bWx6vbggmyNxpP6rl/9X2wnHi12P3WH7gDWk3I57fnLdk5QCOQKD7xOjADtQtuoljmIFHvrhjWKj6Y9B+w8KVy4Aq2Eu7ZBUw5whBxEAJz1WUphIeLh9AsrMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765452548; c=relaxed/simple;
	bh=tBtJbs7SEyN3ffzafOgpQnkTI8Zd5cVPnlTF/2h1UFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+IQfCYCEFqj2PswEQ0P6o9qzHG1nh0RFl99y9iccCWQt/kAl7QnQB9y+BZaKvG3Z36/uKkO0USP8rZ3EsV7A7XrL2A/wbN49AsabsQDP8FhGZUeuMPcYh+WWp3eQGe8lzB42ncGok3C6tZuMsJE0vNF6P++gT7nl3zx07QcN0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HeVtSci/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=p85sQg9d; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HeVtSci/";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="p85sQg9d"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB5qfGR1155572;
	Thu, 11 Dec 2025 05:28:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=DBa4X98lJ03j0cRDFQ
	SVTajE764mlf9WxSA5CUYpXL4=; b=HeVtSci/YBqoMr5h7ddhhgLwTSLZb4DRLm
	8rVd4XSRbimWakMlRc4TWAGwoqVViyQsjE6GmYM49ZxgOVtGry2TpTskFuN+yBo+
	4mrjwbJPzYvza9bP3CqsPH8TW8rWxjcHU9lQsakV897GcxP5WrKM9rTIuOHltPBQ
	IiSMWbIvYJWW0Ua+ulB2tqhTxTwWHph+IaWilZ2i3j383pVd+sRF7LfyLX/rOIm2
	WzOH9U71ezpfy8bBB90CNUrvD2vcm4fXpwIoccgCrRanfRhSoAp/pgOU3FTmdFx+
	c78m+Kccz9pUI+lklm14eI2GtbSFd7yVPAbyLXiY5oAO8fTGQhig==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023107.outbound.protection.outlook.com [40.93.201.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4avhskuekc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 05:28:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZ6NR6QTlYZX40fD1KA8ko5X8RVewTL24axrDmKw3zgbJAuOH6ZS8W9S0oY0SsD+h+mVsbXy3skZ4kcEUAe1L5HYjuDF0H4qhevQVwo3Yk9xQSkdr9HEQF633Hi+0H9EZ3VJJTMo7auOZKtXDoz0hHSIxdebUai1tqDNSsklko1z91JcJHQbzgMbNYdvkPuqXxitOZsq69AKfUxEx8OomLDpu4CNAfPPtwV3IHl9Yf9TVKwEaRFxnR9ijdXSaUwNcV+ow5ghkHQPCgBur5ZKCFXz3zI0RPl55ueUWXGVPijVzFOBzw9ydpK/dLNQpZConaMuBHQRmZnguHS96ExhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBa4X98lJ03j0cRDFQSVTajE764mlf9WxSA5CUYpXL4=;
 b=TXvpIHIz7cXwGby6mpGoBA/alv1kKJzPjEpXjHOL1BkJ7P4UzU8Ujnri1mo3LHF4qX8AY8fcPYlB0Obsmei+T92e7B805mX3fxojJ8ylZzWc9kQhWIQ+B42V/8Tomo4mh4XKOG4e7a9OBrMnGmkJal/3Y6KOp12fkSHgHA5GxTYmCyiqoBF7V3sGJl1t2eQcZsQzBP1cxa55eMLIuQ2/w+cHML9pD/YVuF+rOE4sed9fGZCr7iW2wcRRd0tL9rLO16SXsYjCIKEkYf5oqGrfGdW/UfAKloIFrN4H/ij2jHWQtZKmtfETlIw3wMSVGYZEkBlR/OwVfN43uKd2bU0BQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBa4X98lJ03j0cRDFQSVTajE764mlf9WxSA5CUYpXL4=;
 b=p85sQg9diMH2SHL07+TkGpAaclJuWLxgZKgUOEhNgX5KPLVIIGlA0hU+enxYzKgHwk1HofW/WoJ/KBowXZfB6/of3XRmDYZcK056mKPH5ONXOWlR3DDJZ0YkkkYhtBJItLoT34buZm0m2dLqs/cMvboyeZMr0GVCAAla/ucWrK0=
Received: from SJ0PR05CA0049.namprd05.prod.outlook.com (2603:10b6:a03:33f::24)
 by DS1PR19MB8525.namprd19.prod.outlook.com (2603:10b6:8:1e4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 11:28:50 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:33f:cafe::ae) by SJ0PR05CA0049.outlook.office365.com
 (2603:10b6:a03:33f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Thu,
 11 Dec 2025 11:28:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.0
 via Frontend Transport; Thu, 11 Dec 2025 11:28:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 208FA406540;
	Thu, 11 Dec 2025 11:28:45 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 093E2820247;
	Thu, 11 Dec 2025 11:28:45 +0000 (UTC)
Date: Thu, 11 Dec 2025 11:28:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, broonie@kernel.org,
        yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 5/7] ASoC: SDCA: Add basic system suspend support
Message-ID: <aTqq68epKmoJs3ip@opensource.cirrus.com>
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-6-ckeepax@opensource.cirrus.com>
 <02bc8d1b-ae25-4398-acc5-e5779c245a3c@linux.dev>
 <aTmHBbS22GyoH+RB@opensource.cirrus.com>
 <aTqd3omCzmFuTJ7l@vaman>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTqd3omCzmFuTJ7l@vaman>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|DS1PR19MB8525:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc65a7d-a3b8-469b-27b6-08de38a87311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700013|30052699003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gM0b3m2RnDbhjsEBTEXMEgO1sia5AtUTWmEMfomSu8PDAEPzqyxigoUl1RyD?=
 =?us-ascii?Q?0RKJB0qNVmUvF8qt8Nwz1FNV2bcWaCOxWA9aUH7dZ906xPze2LHB26rMAGP3?=
 =?us-ascii?Q?/LhjmsPnQYk8kr9tuewV5LS/ZrQ4fEytnRB8HDjp/1RT3lFEhVevsxNyfQje?=
 =?us-ascii?Q?j0IOp6jYDOCsThCVRk8NMBtM4B4bqY6UJdHPJuQKGozyrpJXQLUpEI4xCWxD?=
 =?us-ascii?Q?uFmwGGqw/LibBBIuhynty4WMgo1SDRIqRKUlFfbQXba3gjhVXaffCLSlfXUh?=
 =?us-ascii?Q?+ZMsUI0ixm6QD34nosS1vhekVTkmCECCxkobFQTZ38/u/JFTT/UKAmx+IAiH?=
 =?us-ascii?Q?ifZVaFD5JV2jNCKLxWGqeiZOdFlBPFY+0w7V3C3HBAd7qquJ2vJVRTstDtwu?=
 =?us-ascii?Q?b+mOCbHDpUv0Z0oueEdgbJlTEiGXTbcAkRKwgruNOLo7bi2NSbpQio8/9OGL?=
 =?us-ascii?Q?dITh1QaWMu05yxWiiUppAIFzz/rr8MlhvpRcD7IFzlenLtSpZoLsgoeTn5oq?=
 =?us-ascii?Q?NJopUC9JLB4QQBcJGeyQ5hCS5wj9czbtH1T9GDmfIs7oCtWCr+aSLzspa7xO?=
 =?us-ascii?Q?0GyrToVmmkQfX/RT6nWB/A6AIauLsSE3W0Ui1c6OHEbV+6gYC94cqnKWHe+6?=
 =?us-ascii?Q?SOQtCbFLYXXG6PAhjtkhw/jDNSTgLfjFhidD/xX8aDzcveABfDIl57WCicEQ?=
 =?us-ascii?Q?mwCJ8zTGC7ocRlp2flUvSY0XCmqV/vh0N0/5wSJY8aLG3siHDrYHMgsHGKmi?=
 =?us-ascii?Q?vIXdWTntDQ5KvU8EHRMO/Bc3zJzbKRgM0cojWsZM6n3EuO8v/md8k3xz8Mbv?=
 =?us-ascii?Q?uXf1X1l+uFgnXHg51UK0pKbcRX3iNzR8TtGhii7beAMGfvZvG3b/M32n+TFk?=
 =?us-ascii?Q?vcH+qYjvMJ8kLqiLGpLjYDSE/6USRCPcUEdkwiPIfieu9Qw3wpi61I6jyHJZ?=
 =?us-ascii?Q?t689mQxl3pfjhmv+JoSa8OkZo887HDutyflkjmv+4vTi3OuCyIZgHCgfifsn?=
 =?us-ascii?Q?jldIRulSHvnoxgyj5fJA2IS0B3I06VooIG7ueMUQT2A7OuV2x56YyOdHwDFJ?=
 =?us-ascii?Q?b8AHjadeF0s43SZ1BvrHctj8wQjljxHpaE0NyJJ8dsmr9+5UNxCAkTjiX80M?=
 =?us-ascii?Q?FmZ5d6tz+DO/rTQswwiMtDc9ghsGwbmmp0yMRnyEmGqQ8Cz3tpq38F8+rrEF?=
 =?us-ascii?Q?TtKFUE1djCau9MQv0FiC/foE+t231gRU6WjY+Zk7Ke4/5cF2xq+gCIFO6beo?=
 =?us-ascii?Q?T/YwCwrK48xVKnWlpbtDMSDOTAzw0Fc8Zdu+KpkmeNSY4snc3mNAWst9WdU4?=
 =?us-ascii?Q?m92qsmq05UBCmsjrSYGBREJIm1Az7C5WTWlKQUs/Ia77uuPJyy8ywz6X/Phu?=
 =?us-ascii?Q?fRPJLktCCd4VsVJumw+2HJslIonCruxr12Dw1FhCLFtZ0OcFbSbqpob8k+5p?=
 =?us-ascii?Q?VnuXjhEEzSkUZF2ijndTXZsRzDC3ktZ4y/NoTpYi6tUMTqJxqesC3J2uJ4C0?=
 =?us-ascii?Q?hRC1dHD1fKkyrl4DRsxPz72F9fZPHWCSB4A6OMvvqR7rQ7RICv++1lbi9NVt?=
 =?us-ascii?Q?wmR3Awu1Z6FTs2pVyXs=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(30052699003)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:28:46.5948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc65a7d-a3b8-469b-27b6-08de38a87311
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR19MB8525
X-Proofpoint-ORIG-GUID: u0NBOWXjyo-TeCLK32ZwEmcIsIlCiL6q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA4OCBTYWx0ZWRfX8Guf97wzM4ZJ
 8YStFcMYRMkvj6TBO6DI7els57JJ/kbOCubOyShVoigSEXPLfPHm90al4m6dr4IjCznUY1PKFER
 3N13hODmevMk9lUc3FGQxGiCGRjKbCNYAxPaaf4ZZ6+WPaxxKOsvfhpgI97JW7Znt5wQL4OD3Sc
 pw/3JeECLDb3Fuc9lHD3uZSTw467LSOMWBa7pWlVre7qNG/DwrOzah1fAKDBBCE5Mm9r+Gc6OQO
 GtI9g3NpiM+Tcp6DdieW1YD9h/UG9NPHgnFJd9bP33yWOo+7bBmhtrAT/pLOJ4oYZDFaRq91El2
 zHZGGv16Ijc2geQUag+Nu/sbETpcTsNLMn8HTewibSQHflVF1XgqWo40OH2nZdQsqYvab/1LvD2
 cfBiu5Q7utFnuM//OUXaMyw3P7xWqw==
X-Authority-Analysis: v=2.4 cv=DJ6CIiNb c=1 sm=1 tr=0 ts=693aaaf7 cx=c_pps
 a=hPX4sJ9ttNblXMIvR1KFjw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KBXiMPTM13BkscG_QVMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: u0NBOWXjyo-TeCLK32ZwEmcIsIlCiL6q
X-Proofpoint-Spam-Reason: safe

On Thu, Dec 11, 2025 at 04:03:02PM +0530, Vinod Koul wrote:
> On 10-12-25, 14:43, Charles Keepax wrote:
> > On Tue, Dec 09, 2025 at 12:11:27PM +0000, Pierre-Louis Bossart wrote:
> > > On 11/25/25 15:21, Charles Keepax wrote:
> > This is definitely up for debate, my primary issue with allowing
> > firmware download at the runtime level is that SDCA gives you no
> > way to tell that the device is ready to rock. The only way I have
> > been able to divine to do this is to wait for an FDL irq and if
> > one doesn't come within a reasonable time out move on. However,
> > that waiting would add a considerable delay to runtime resume
> > even if no firmware was downloaded, which feels problematic.
> 
> What is the typical time to have firmware downloaded and get the irq?

There isn't really an answer to that, it will vary alot based on
the host, the firmware size, the device itself. The timeout we
use to wait for the FDL IRQ in the kernel is currently 100mS, but
that isn't determined by the specification so may need extended
when new hardware arrives. For our device on a MTL UPX, with the
current firmware, and that 100mS timeout, it takes just over 300mS
to complete FDL.

> > 1) Do we really want to support downloading firmware on runtime
> >    suspend? I am doubtful it is really usable due to latency.
> 
> I feel there is no way around. We cant do this async

Obviously agree, if we need to download firmware we have to,
but I think you misunderstand my point. Currently, we don't
have anything that requires this, so why not add support when
we do? I think there is a reasonable chance no one will use the
feature and even if I did add support now, it won't be tested.
Furthermore, there is nothing in the current code that prevents
adding support for this in the future.

> Best is to speed up loading by having firmware cached in the kernel so
> userspace delays can be avoided (unless ofcourse it is humongous size)
> If device needs firmware, we have to download, dont see a choice here

Caching the firmware makes very minimal difference (on my system
pull firmware from user-space takes less than 1% of the time),
the majority of the time is a) spend pumping data through the bus,
b) waiting to ensure are no new FDL IRQs.

> > 2) If we do, do you have any ideas about how to determine if the
> >    device needs firmware?
> 
> Driver should know and first thing in resume, download the firmware,
> maybe a flag in device properties?

Yeah I think that would be about my best guess at how we would
could reduce the impact of this change. We could add a quirk to
say skip runtime download for this device/system. That would mean
new hardware would work albeit a bit sluggishly and established
systems/devices could quirk for a reasonable user-experience. But
I can't say I love that as a solution.

Thanks,
Charles
