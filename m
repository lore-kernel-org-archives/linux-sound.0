Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC1A3002C8
	for <linux-sound@vger.kernel.org>; Wed,  7 Jan 2026 10:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767780268; cv=fail; b=kEuh/y1VPg+V4Me+DPO51QCcUlWtWqfoa0o3KMpZhFxRmgx7XQ7J2SuMUVymQ7C3TjjAkr65hhziEVTyQz0LTb+eLqy3d3QuSTS0Un01kXh+dhY8cVVNNhnmzqoq1syHubcl2y3zVlyd3lEdBHmERvyVdwP2m4OnDpOD1oT0H/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767780268; c=relaxed/simple;
	bh=BSyVYUOp+C0fiLF004foamPdY+MoGGmsut5jSGE6IEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4Kxt1OB5BC+qPTyArup9vbE8LucPFruSvK9uQS8cuW2J/ZFwWUvORUErM7d+tPTUyD0EW1l3b8Jsm5JAve0c8Z5OPvKJ9nIxFnLEI705Jb0Q46xhvrhjJ27Q7hOnAP459mzeDQ9Te19xNqRvL0jHLDAg0qR2xp88gVrATa1F7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=l8/sDcfd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gWA9E5F+; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="l8/sDcfd";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="gWA9E5F+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6075q15v3478537;
	Wed, 7 Jan 2026 04:04:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=3gPf1zIbBE3r0V4djb
	2gJx1TyXzTUMJxvbw1a8k2noE=; b=l8/sDcfd/iALFkjQ355jDuNRz9blQv1ZvI
	B3mv0Yf9x/lmB9tvzOSpOoW6zTUFRzW2lYRPH9kTpOw4S8y8vWdlHC8vUNEdTLmD
	ne8sc+wXoLqiAP5sZGIsXmzXV4CNNFL6lDwfmXTZ3p8voI3LxZXGw+lX3rqkHFig
	Wab6l7+THjzmkswQE/3sp+tBHNOnUOeIBnyWSk3wT4JoFIIDtr976g9KP0JymyXh
	R2JzYJiwfWQqrI8DiWuCbFOwqHuGxMlUlql9Zg8fplK4lnjL9GRerYcECKpCmm3H
	GjsZ7owih50XVa+aUW0GgpY8qPs/I7adgC+rfN0sb4r5nPa8zGMA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020082.outbound.protection.outlook.com [52.101.56.82])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bf1d343ju-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 04:04:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcuMyGYFkdKvd/Cf1W4CF3jDg6j66QTTce/geP1750rqy6KA+Zz61R2PmSQOFuSqcQVjaBbZ+iIV5KZz2qKvEBgTJcJZ/kGpP5Z7CKi0IJTU/nPAH6mpL3ItOszL7C78B5J9gp/RZyCa7WXrxF4Eu08ucpMhAySPk3+Yrcd80vjEBLtNrUtlxp8biDpdIcbk4yCTyHVaMP8WT9ImB76to4HR9W2kuC8TdQl2TeeOLhL55qNZAj4Pop7X2c52a3aomX8OBg0a9QfO5pPouprj+LLiHsj6D1JNb5YMjfEL1+K1KMT9MnH1BYnqCE1wmVG7JdHqkPM+vYJg6sPjrXLcVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gPf1zIbBE3r0V4djb2gJx1TyXzTUMJxvbw1a8k2noE=;
 b=X1akvJk7MKyWv3K83zybhK8eHAmH8JUM3CydXHUhe1VXhvFH6EpouODB5hugTCsBTuNGIToz4v4an6F1QysjTCeMyeyCA04UmLEEbb6nQvfr2M+TU/RUgHZzQJD9b+uOG2HbcO2m2JbSKwMYQoHN6He40C/V0eEYTny1PFMlmXzvAWz7K8Io3+Wk2ZGhC/mPDYsq9f6PArS1J7HyAqu7u+M/35LA3JqnwNoMY4HxsCCyHHdxqGeukb1LbJBI5tWR2V5uoMeRrm6jysZ0exCfwribNEPojji9Hygag05qGNOM/eOTX3SfuhegCQK85LNvliu2GS+1avnXu5jL9aF1cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gPf1zIbBE3r0V4djb2gJx1TyXzTUMJxvbw1a8k2noE=;
 b=gWA9E5F+vEE67z8Jo9bdc9sEaA25PVeSTyFvNEXp1uQVOiVmhXVF2EkpTm25qqV8LLu0ai+FjON2dmXLxXNZiGN0S8Vv0n2S0uRGeaaFIIQoswUwmethV7hqn8kPtQ4WHTruwYSqgKtGIdd12WJbpWFTYYslUX30XmpzY2TftvE=
Received: from CH0PR03CA0025.namprd03.prod.outlook.com (2603:10b6:610:b0::30)
 by PH7PR19MB5616.namprd19.prod.outlook.com (2603:10b6:510:13b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 10:04:08 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::ba) by CH0PR03CA0025.outlook.office365.com
 (2603:10b6:610:b0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 10:04:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Wed, 7 Jan 2026 10:04:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8F8D340654A;
	Wed,  7 Jan 2026 10:04:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 80329820247;
	Wed,  7 Jan 2026 10:04:06 +0000 (UTC)
Date: Wed, 7 Jan 2026 10:04:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 2/4] ASoC: SDCA: Add basic system suspend support
Message-ID: <aV4vlfWtVUMEcCpD@opensource.cirrus.com>
References: <20251218113520.1287693-1-ckeepax@opensource.cirrus.com>
 <20251218113520.1287693-3-ckeepax@opensource.cirrus.com>
 <720ffab9-1c09-433a-b3a0-40ed496119fb@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <720ffab9-1c09-433a-b3a0-40ed496119fb@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|PH7PR19MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: 41675f00-2ab9-4bc1-f1a3-08de4dd418e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rmIUJ0XwhAnrgZdbpI8O4SryAexHiNKNL/UlynWdkPUpNNHRSdMAKyPeoTh2?=
 =?us-ascii?Q?gU6pto0m4ksSH+H2XplLtFC7CBP3gkdZwz1G6MnYvvLE4ZYoJPLIbsFzXQO8?=
 =?us-ascii?Q?pKT/nVkw/lbKmG8l0Z5A2I14zr8VgkwM3szxTN9fVeKHwR1Xk2cZI31qhXYb?=
 =?us-ascii?Q?Dd3JiXDbH9423yqSnGvzhA9OZ29qu8CLGsk2/a0kfCFwqhvu9+zZrMMQJgML?=
 =?us-ascii?Q?IGhkPHQI/PnU/t08vTAgwoukewdYXrPqpMxjtZ9CKWaqtOUgianj1WMDuXb4?=
 =?us-ascii?Q?NBfNFPs/nvbNjGiv5O6Z/fRzYrRstyLKMfgJIYMUlMqnlHDDqxf11zTL5uoG?=
 =?us-ascii?Q?n0fBCEujmzewZWRtnDuTOSRiK/9+JwEQ3Zd97zagbkDfEqhsXmrQ3GMtjEst?=
 =?us-ascii?Q?PUGpfAjwzd+QB4gv8JDBw75BBrvyH6qz92mRzy/XM6R/hYrEuTEX/93rq6rd?=
 =?us-ascii?Q?j48atOsPsEhZSxyi1aX0rfqb3DQeFqA2FeUAQ+KL+sHt568T9624OUVBk12I?=
 =?us-ascii?Q?rowjA1gRPW8m2wDiAZNx8hERqvnXcUm+YUEI+RfWQUhPcjnPdrjSXUIz/B2Z?=
 =?us-ascii?Q?/jNNDN1Xh+bel/s447AXsBj1yvJPGWnHJEBp1yTXbv8XexYG14p/7pAPgWIY?=
 =?us-ascii?Q?bh3eDSKtFPUZCh88zQQl1gO3yJ4dY4K//QCz6ib80zfjVmD/aYswwUaCEYKG?=
 =?us-ascii?Q?VmCbEY4BINb927hFYn5AaZ16qzi6s+axy3mfFFE8x+iRBhgqsmyqnomAj0iL?=
 =?us-ascii?Q?1CL+SLRbFOCrLUdAsLbWwcfy+ll1TrM4EPow7US3vWBVqd7u9CkfnT2voIDK?=
 =?us-ascii?Q?R64uJjWO+lk77Dqwcbndn5juj58116fEhs8upTnvOOEfKEC6SAW9IFEP1fHr?=
 =?us-ascii?Q?fFNYg8tLh4KOXOt44OOdHDUJ4L8jZReD9zoKkPuV5xeKztsrHauV6B8+Zyrl?=
 =?us-ascii?Q?ehcPguogHD6muOmoDbF4jL6epBHjsh5hinq6whYUaTrhAB+1rAnJRIQ4AY6g?=
 =?us-ascii?Q?hEQMUX9ttLXpYud/ClCk3kA72Pc3nXk/fGTHkCd5K1Qy86bl47PQpselBlpA?=
 =?us-ascii?Q?Zemxb7vV2v59ubvF1FGHr0oV63+xReiHoGwfOh9nR4SwFsCemd01CX3Mk3hE?=
 =?us-ascii?Q?PsMnpEoMVIyGzrR8m3+JcVm8wdz7gLCjjcWYnnWrIjBl4UN1yV3kedMTwaKs?=
 =?us-ascii?Q?GHlDWmRNGcevai9Ihz+a2wnVdINBLob7n4M89rUDEydpftMKbymwXlsiEr+t?=
 =?us-ascii?Q?1SsoMBgNLXcaGDZBrZnj/xRkZbVKi07quhzQNoqKI7zaSV1f4dAbDTsGp1eF?=
 =?us-ascii?Q?AWcoVCGxtsKa556B4BUu69UnE27smliDwn+Ssi4xmq55W19uE/fJ9HpNBS15?=
 =?us-ascii?Q?SspGIJKmYQ5pZB6qCNMkeLR/XrXUDQBqbj3L/EvEDiN9bx+cXA71JMrlf+Aa?=
 =?us-ascii?Q?5/GJTpmdptW8s1Kaxwb/XYjiV88vmCpPK2yKeDV/L9dEB9aOnQYLz8NoZEYm?=
 =?us-ascii?Q?sfXUqqT8UufC93SPmP8nc53113YBkSPvdOlcWS9wmvuDiaPZ3uugqyMr2JVS?=
 =?us-ascii?Q?N3f+jwGB7cp+OZgAMc4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:04:07.6675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41675f00-2ab9-4bc1-f1a3-08de4dd418e0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5616
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=695e2f9d cx=c_pps
 a=o2lqJXFw7WzsGQLwBBQY9A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7nsA3teohAuMCIjXqQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: sVKIU-bkmxOW3dflkfoxo4E1G8OLvQ-3
X-Proofpoint-ORIG-GUID: sVKIU-bkmxOW3dflkfoxo4E1G8OLvQ-3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4MSBTYWx0ZWRfX+4FKqXR9xLUE
 2wgvmLFhywLM5qLdzeqpkkQTNoKg/tM4R8boz9K/H4FerMkZL0ZKG5T7/hhR6gUm1PA72FcgwgU
 lmGHoYKkXDlVByRUDwqL6AU69dUsgxvSBGWzzx2eOgJlVeN7pF4MG9tikdafbEoq5SfoFSWLxeu
 dVZ1KPwGg92IqMeYmQE3vVX7Uwwg2WrOYezwDdDJAPf5aJoMA6aQVmIYK0vdjAb77dmJm6azouj
 4q/qC+abn5u64pIBkJckd6HSL0psiQcy6CmFg58dWTJxs0EBQCuPlZLUvqVZZ9w3QNTUpNIgC00
 nnDvWE+BfOfJLaTJjl5vJ+Joij+4C8otObHNe6e40drwNCICRuOczDKMiBtl/GFE5zR2jxzakIG
 MX8jJ/WvzSAatNUXgTqVDG0sITgWjMV/5Ky5VLJVzPRXVpEeEghmSROhrKOF+vzb6zSYSGV9ZwO
 J0AucZ8hEzLXXBBOibw==
X-Proofpoint-Spam-Reason: safe

On Tue, Jan 06, 2026 at 06:23:17PM +0100, Pierre-Louis Bossart wrote:
> 
> > +static int class_suspend(struct device *dev)
> > +{
> > +	struct sdca_class_drv *drv = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	disable_irq(drv->sdw->irq);
> > +
> > +	ret = pm_runtime_force_suspend(dev);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to force suspend: %d\n", ret);
> 
> suggestion: since this is going to be fairly generic code
> used by multiple devices, it'd be useful to add a device
> identifier or string to the error log, no?

Doesn't the dev_err already do that, it prints the device name in
the log?

> > +	if (drv->suspended) {
> > +		sdca_irq_enable_early(drv->function, drv->core->irq_info);
> > +		sdca_irq_enable(drv->function, drv->core->irq_info);
> 
> maybe add a comment on why the two calls are done
> sequentially. You did mention it somewhere, it'd be good to
> capture the design.

Yeah can do, its a little bit of one of these intermediate step
things. Becomes come clear in the next patch.

Thanks,
Charles
