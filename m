Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEBE48C8CD
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868944; cv=fail; b=sSZN/4NOvwuXqFbm/SDSCZGr8TPwfpJPg7XNN9U01BbAEih8W5nY4+8mZZHv/mGLboak7/iM08JFwbO4TdrnVER9lgSNJue6TtKYScwn/iUCkLv3e+rAO9u89oU5VcUQp9tGd5pIHpgXxAPEKXykQ6HjRlMMTn++zGwtEFxkga4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868944; c=relaxed/simple;
	bh=L5YVivqXrKU+iywhHjbvDYPzYY9TfUvqWQcFssNYK3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrQjzQDobV3oezsqvX7pDUTuepdzs1dBMOoBhH4wMkzzbKryQFTlpYleL68dMPIevByF1WIQT2HWcDeWFcS51je4ftGUkaIfdw4Vdn6pNupdcj/0fFYVgHwHNTKBHXXYQCMqqMimwi93K8rq9IcbCiD/Ql39NJ+yrkJ1J0jD0Qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aSGGCoPW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fNQjDCV5; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aSGGCoPW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fNQjDCV5"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6086Vt0u1618587;
	Thu, 8 Jan 2026 04:40:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=DxFd4AkW+t0rVORPfy
	4N401tDi1og92acKQQgIbNnfU=; b=aSGGCoPW9DuJFntW1tfRLU2K6kg6rQlqc5
	cCof/StIgP2LvwLHu0MTtTZmD6yAHCfkCCLTxPS6a6TVxkQJ6h7qL1WpOM7fULQ2
	vRh6cfbgoQ1tJVYzWdn0TEhTsmxVy/W7bUnhZ/NXzG6KaXgz5R7Mlk/VVyH5OIi9
	NCBzciP5zxY+FU5nfmLobCV4gDsX0MNgc7KVqz5B2/pIIFCjW5csgvjB2d5ZJuM6
	XcCOCU+i0ovWmcEMc2l7nQoyuuNpLaNqcX78iyPX6aj9BuZwDb+yCXgj+Al7pIcR
	+h732k3x2OKxowkgdWbY3ha4Oeek6YPKoZRlX3JJmO1vp66nYFnw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022090.outbound.protection.outlook.com [52.101.43.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bf1d35dg1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 04:40:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+MO4EoMsoaeKn8fBDqjIIxQJoDdr4sxfiB0i+1MCbSScomChthay1Oh54qWi0AdWjVjI3QuNmWYLnG2LOQO7NK7JoGIATOJgduu8Ph/HlvR/0SGgmCmME5qX9gOUYQipXUc8I94vI74qHZKtucMz8nsgmfKP6snQqostVTEzdZn5srXjHD6cDLAccZxKxPTpN61ng5y0qmpEHTI9GXPJCKqx22cZKcTRW4MbEdU4nLuQeR94pB3WKXAgF3eFvqIcGo92yx+oHqpyQWMZwNig/E3oYGUOtWV/VKfI1jRhH5txRzeS5JuP5Fes7hT5bwXXur44o+wMQtREvfQGpF8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxFd4AkW+t0rVORPfy4N401tDi1og92acKQQgIbNnfU=;
 b=fGkeXezFKagZJIdQfS8Xdf9+P+dpqGJHg7HcwZE+jULv20E5T5Nx8wKDQOnCbSEZ4HX9VIZVkDTK8UbJ9jQRYtRrtHr1KEmpR7v9LGvaCPN+2C/W3PaxyE7M/T0VUN2WdSKukBCng3aJLsv+0LGOYOtVoFdeb+XlMYIZ7mzm0Pu+kcnRJkJANMdvGYZSQexxDHsFNE7UNi087v7RNvob2HpfSaOGjjur2Ltalgm2jTrv9VUrPtuzArwuTR3JLH3/xdBRz0EAhmAUiOKgAi9AnI7g3R7GQmHCvqEVgc609gnPkdnjIl9tAB7Etn2/BxYLGm5/hFJmVyQI0ZyUiW2UiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxFd4AkW+t0rVORPfy4N401tDi1og92acKQQgIbNnfU=;
 b=fNQjDCV51j+D5qc7hlRug0yyqs1rvt12OnNMc0RGnbn83TsRN28RoWhfGg9b57KI9TM3SRZ+4EgAxkrUauOpmSoGPJGKO6+M+sDq10SMBEmc7ZwwJCX9stDBVZBKlVlrbKuqqli00/gyz1blknbzqgXG64u+fESVnYMpM7ZSn6s=
Received: from SJ0PR03CA0071.namprd03.prod.outlook.com (2603:10b6:a03:331::16)
 by SA3PR19MB9474.namprd19.prod.outlook.com (2603:10b6:806:49b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 10:40:42 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::ee) by SJ0PR03CA0071.outlook.office365.com
 (2603:10b6:a03:331::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 10:40:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Thu, 8 Jan 2026 10:40:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F050040654A;
	Thu,  8 Jan 2026 10:40:39 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D9D18820247;
	Thu,  8 Jan 2026 10:40:39 +0000 (UTC)
Date: Thu, 8 Jan 2026 10:40:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 2/4] ASoC: SDCA: Add basic system suspend support
Message-ID: <aV+Jpig/liLPn2Lx@opensource.cirrus.com>
References: <20251218113520.1287693-1-ckeepax@opensource.cirrus.com>
 <20251218113520.1287693-3-ckeepax@opensource.cirrus.com>
 <720ffab9-1c09-433a-b3a0-40ed496119fb@linux.dev>
 <aV4vlfWtVUMEcCpD@opensource.cirrus.com>
 <b257ebfe-06b9-4a18-b713-33d20aa9fb12@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b257ebfe-06b9-4a18-b713-33d20aa9fb12@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|SA3PR19MB9474:EE_
X-MS-Office365-Filtering-Correlation-Id: 203b6617-1b57-4598-e958-08de4ea25ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GQoNh5AyxKs3mY5T1In4Oq8FUXlJEQlEmQVr/QJJNeoX8AhTaLreg4/dXQ2W?=
 =?us-ascii?Q?SyVuySHv85frzye9DXboxVRez3XSDz/90jPYHUJ4tOG4nYbq5+bLbzrBNyrR?=
 =?us-ascii?Q?ZXjR32Yw7A5pu2FJ7VobcvYdE2bovaMD+FKSdIZACQFEwmSLc9lCvzdi7vBd?=
 =?us-ascii?Q?f3bX/+f7sztseAgphPcq30LFL2i321ciyRkBpVhBAcX3cROrFFsvR0tPMoWn?=
 =?us-ascii?Q?yWtzI+g+IIrIXUzzeH1YKhCbKCqfCariz3wvFh6ZlR6DhzWgEsCytty8MZME?=
 =?us-ascii?Q?InoIUTqOwCRVlqLo7dM/gzqzBxYgt/pRCQLJvRK5NeiHZm4A0tMg8VushrAG?=
 =?us-ascii?Q?H44QJ4OwiKNJwAgSZDMh0b76sbyCw4PFIYba9ZSqS+EzVNbz5shvtonf1rKM?=
 =?us-ascii?Q?6mIfnB3nZ5pOGAP6oba3MlkFgGhBMlH8v6VL8stgDGX3j+9XlpG78dx8WNAs?=
 =?us-ascii?Q?uC4/wlWi+FMYIWqIo1hxRagl785VrWf29E8d0QR1ToAjz9fbiiCzTGLFa6iU?=
 =?us-ascii?Q?nGBLaeZ/4+cOpEZ04ilHxVkzTaQPp5tHAsNMM+aBAitkrz99v9P5pP8fro4D?=
 =?us-ascii?Q?3MYwzeJ/C8EfNEC7bisfN73scuthefhgfsmkzGXSxWAlZoeUUGcUbS0ILir7?=
 =?us-ascii?Q?LEft7BkmwtL4qZe90ZXlYG8++6TPrbaoYdCU9WNVZ37AN5QG3wg+/fBeDOlX?=
 =?us-ascii?Q?xp2/JghTWj4LHJy/xCL5AY16oMIOU9aPf/bqRxNBhc30tBPSPocAmKPJYidB?=
 =?us-ascii?Q?x2ZuPMPU5h8Jy67fj5TxBjCoEvaCR4EtSbj83L2sIP2KPHNM7KVzg9nUrrPO?=
 =?us-ascii?Q?9nlH8nuAlqFoAvfh0EDhUH4zk+rMxmhDW7A38PoLY2Z5jI8ERkXR36DHZHnJ?=
 =?us-ascii?Q?60S104EAXvhSSNVr40S71+w8c7tWwt5pHyCsh3ukbhGMuU6t3JaPYQvkvr5+?=
 =?us-ascii?Q?gIKEneDUzh7aE5CFZgJuXVVJnMHdvcRklUoKN0VzA9Pmq3NK0yOWlo7Pwenc?=
 =?us-ascii?Q?fXLZdPEzf7/90Y72+cYGlui29WcVmSG5gacSNxFXlkczkO2tuVlfBtMwNKPR?=
 =?us-ascii?Q?nRAvfZFbGyKSDWCe1GrzCq1EvyJxdmZrP6uc4vZWkZ2TcJKA57azJm66XNdX?=
 =?us-ascii?Q?QRsXkClbW8Vn5fPsnDeYydCXS+YmjYfzWcR6G9JoRk2bcQR9ZGz7aekk7Rgj?=
 =?us-ascii?Q?MYczI3aCEeCqlBL8sAKkpa1Mi4HJk4hc7kuFSYxpZce3UcP4NxQl/tN3NA37?=
 =?us-ascii?Q?HIQLrklCAB3eHQurfFPhkJ0VAYp/lN4vsrhMqF/r84dVZPzVXPTKcy8MUKtl?=
 =?us-ascii?Q?s9Cg9VLwwtZnhZcMNwl/2+WeQn7Yzba0J7Djg4k9BDUa2KTRq5ctIVcKZGZp?=
 =?us-ascii?Q?4qFdYUDmFWTndGYZWDq4RFq7dShbKBwpz+6bdyQsA5nrxIXCgK4RO2CR/McJ?=
 =?us-ascii?Q?nJlrmP6JYhlS69AOkbvRqo063E6z6EXio6wXcM9E7SLrRY7VFtCYhczRS9Qr?=
 =?us-ascii?Q?6svg0BqA/eHXRyADU2D6bnESHGLCywvp4ds2jfyTRvogilcN8j4zPvZe+hOd?=
 =?us-ascii?Q?1d/K36812A5Scv0NmGg=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 10:40:41.3638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 203b6617-1b57-4598-e958-08de4ea25ee5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9474
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=695f89ad cx=c_pps
 a=ybF/z1spmW4Yh6p7z4QQKQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XyNAuieMOTwCF1y3A-AA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: gXd2xeDabzTnCfFtt74f2AjCU8MTOy1k
X-Proofpoint-ORIG-GUID: gXd2xeDabzTnCfFtt74f2AjCU8MTOy1k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA3MiBTYWx0ZWRfX2MrXlRb8BgNU
 OTw0VYlL71ukuayXSEScKokNLTVMoJmmUIoScEMtczc4gmDSJqNwn2RYbfszFyOYkb+TVKFq1Re
 4+fTLkzUPZC7Y2S8EiXBP1RD9x1bnO34nh33RAW8KOdUIXQDGkE/IzjJ2pdi6PndicrpXJBCbTF
 6HaBoZFAO1GiuGfnQu7VHAq5cOMskEIH4lGQf+X4dVkcgmgSGs4jOsDrW5uDUUQxaO8djVdo1vc
 6K5+R0oMnfRTKbXjWZXp7JcuFG5pRK8I4eQayIyskViAJn/IRYwXoGEI5HViTNO47ylYsTrxN1E
 SqEbY0bozNHFzDXC8o+b7329w+mg8uifKJoZQg4/YRH3D9NroHhLn+woGiyFwiWYbgvniXhKKDZ
 uh0G4So8QWaXsoPaQY0hCGtybURxjXZpnVx9aQU6VLTFCmEm+8n2uscfaSTeUY1Zvnb5ArTknvw
 AcZAk+bz74pMZZM8r6g==
X-Proofpoint-Spam-Reason: safe

On Thu, Jan 08, 2026 at 11:18:56AM +0100, Pierre-Louis Bossart wrote:
> On 1/7/26 11:04, Charles Keepax wrote:
> > On Tue, Jan 06, 2026 at 06:23:17PM +0100, Pierre-Louis Bossart wrote:
> >>
> >>> +static int class_suspend(struct device *dev)
> >>> +{
> >>> +	struct sdca_class_drv *drv = dev_get_drvdata(dev);
> >>> +	int ret;
> >>> +
> >>> +	disable_irq(drv->sdw->irq);
> >>> +
> >>> +	ret = pm_runtime_force_suspend(dev);
> >>> +	if (ret) {
> >>> +		dev_err(dev, "Failed to force suspend: %d\n", ret);
> >>
> >> suggestion: since this is going to be fairly generic code
> >> used by multiple devices, it'd be useful to add a device
> >> identifier or string to the error log, no?
> > 
> > Doesn't the dev_err already do that, it prints the device name in
> > the log?
> 
> Yes but the device name could be confusing, not everyone
> can figure out what "sdw:0:0:025d:0711:01:" means

Personally I think if you are interfacing with these things you
need to be able to interpret that anyway, since it will affect
things like finding things in debugfs or sysfs as well.

However, if we do want to update the error messages to include
some additional identifiers that should really be done for the
whole class driver. So it would make more sense to do as a
separate patch chain, rather than as part of this suspend chain.

Thanks,
Charles
