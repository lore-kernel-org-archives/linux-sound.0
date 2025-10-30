Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB112C235E
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761838191; cv=fail; b=PC9vzeEJXLE8WBryfY6SkNd+XyW70s3LB+C9XJV/tkOa+CNj0+ZkbsjXZEuq/xb3bEdhf3eosR8Q3JlSkVcmbYn7EfuK3RN7jfnNKGEqYptzTD3g3Ffy8eDFXlics/DOfI6MVsxXZeQ4fhEMIdmh+2HwxLpYFKVDY6VihLM0dMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761838191; c=relaxed/simple;
	bh=yzpaqXXlZVoPAf970mKa3fOUFScpZFUXUvtuEIjIQUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsdlVzM44FgRNGbjMfHJeM80ji6KDkRGJgf77OI4rBRSTQs0dAXFMpnY0uhNPDDKdZ/wUnaB13/JIGvOye5O9K5X3JesgpEkXlXLDTG5A9N3BXJ01R392jT2HTEXi/XYYEfKnCTzPyulFCfLpyln4JdFWTeTW370+FfxeqsMxNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OQfH/nqp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MftY138Q; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OQfH/nqp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MftY138Q"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UDmcmL661614;
	Thu, 30 Oct 2025 10:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=4PBK04X1/wGxfDSgeL
	+6GmXEU1+fVzKKZuYOXxn9hx4=; b=OQfH/nqpmB9j6BnA7WX3YBZN2lWYHr1Gm8
	8rJ3dhTsTdFiK4sGyoQA/rCer5RAexS4f5hIA8hECbXoljMEEQs3i+Mq1AvZtnhW
	yIQYE3AnM0nyLoOWPcNjGcJXAb8DVm6SFHb7WeietcEyQGFgkK7wYto9G0lRO7Ot
	1dCDpMgqjmELtVQP5dSIf7ABm1o+w+XH2jfay3OKNH5nPa8n/SXjNoa0v91XmaJu
	hep3XUKY5hDyQSlsi/QtHfJaTuoHbzHQgKnaBOaOJFtlJAjRTr6a5SpFBE/kYWwL
	rR6HxjMK/dflEis0clmMWVIJ/2V7j6hOf6sjH5+Iodsvwyu5PKIQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022140.outbound.protection.outlook.com [52.101.53.140])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a497vg5fh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 10:29:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soE9NbCz8pWDvyGOz02w5MQu9yqYP5A4xaXK6bgu7cKLY2+a87Q5hReSlVSOdNyey/Gcx9mptcWz4o/WuodnzIRjWdEQBDnWxaV8aDIXzAfOO+p3rn/cnQ2VJVjrgL7Kb7opzt5w+PAyBGK/TxOte5AcjLMqmZdYQJUvqrWfxY8XejfvSlZQbnwO8TofKLOlCD3379HAjfoodcY6S5vUjzxxZFjeBP6kcj6CAY+SDLWZmEYDOF+A7TNdE8Knr9ar+7og19TN1uhryciB60aBD8VYi4kNYKXsIyHjc0f6gQy28cDuPPMgotwblMmVoKumONlrseEmVfIKaF0I4VLWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PBK04X1/wGxfDSgeL+6GmXEU1+fVzKKZuYOXxn9hx4=;
 b=bIf5P6SEw/DwZvP2aVzl/Q6Jvx8Fxm79L/5pYSrNhRDd9XakgoxXJ7/pMAQz/zMpQb3D+bILtv744mKZ62Wcmfeo94GEYepftfNG92sPpYf6mXrcNhPwoT8YmW2Pgng6xRamYd5oqxuCYLoqeg7waRt/I4SeBZVv7un4FUcMnUvzGzgOZVHv+tiSpDu56wJun/RBBi4gCN5Qi+uv8+oGcK4oZ5LmxhRonk/+E8Jmp+qUulyDFA3H9amoicDBMtZyVUhrnyJ8JPpkhglVvfx/GTMvLZBWkM8jEAwkwmGdA6HLadLKcgqi+OT36j+scJqWhxklZt/elD80xTmuG8AwNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PBK04X1/wGxfDSgeL+6GmXEU1+fVzKKZuYOXxn9hx4=;
 b=MftY138QX6t76odOPYsBh91IwJqSjxNZMr18lASEyCqvfATAMo+F8I1ERk1bpWI09oVBlLUPlg7wsuvp3WEiGBt8CFw2eR1X7xdMnqLzm60JAeIQcF4Q4u+YU1FrKXLGfJ0TKTsPrBtS4RWZs/0wqtvUcdgerxg41AGvlie2QJo=
Received: from BLAPR03CA0055.namprd03.prod.outlook.com (2603:10b6:208:32d::30)
 by SA1PR19MB4877.namprd19.prod.outlook.com (2603:10b6:806:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 15:29:13 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::65) by BLAPR03CA0055.outlook.office365.com
 (2603:10b6:208:32d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Thu,
 30 Oct 2025 15:29:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Thu, 30 Oct 2025 15:29:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 29CA1406540;
	Thu, 30 Oct 2025 15:29:11 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 192BE820257;
	Thu, 30 Oct 2025 15:29:10 +0000 (UTC)
Date: Thu, 30 Oct 2025 15:29:08 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 3/4] ASoC: SDCA: Add basic SDCA class driver
Message-ID: <aQOEREIJ8TiwZHef@opensource.cirrus.com>
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
 <20250925133306.502514-4-ckeepax@opensource.cirrus.com>
 <13c14d26-29ba-4d39-b96a-b12b97935d33@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13c14d26-29ba-4d39-b96a-b12b97935d33@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|SA1PR19MB4877:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4a5fdb-1153-4007-f043-08de17c913fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JskPqH42HG66CJUq+0dxnuPES6MZcn0HLhOsGCDA6+RL9Bmt+0+5nAW6rgWP?=
 =?us-ascii?Q?lW37udOJM9b/SN330Uu7X0VJTgjqvc2CLbhOnxpoyIQA++xXOSOEk6QdL3uw?=
 =?us-ascii?Q?PTBCMkLq4kX49PkB08xLJ1+oayOQXdfxso0xjFTAWrR64C5il7Wcdti1Gfue?=
 =?us-ascii?Q?WBu3kZ06YBS2SG11fsEnIAYjyPs4dcsyboIOypMCw72oHTyx56OeZZ81AmG7?=
 =?us-ascii?Q?KC1CFTaZjlN9/sr+cl81ceTB3vumRc7KaPXRqi310nkckxq0hqWsu52WLhyF?=
 =?us-ascii?Q?aOiA9e2AjZ3ofwJiFl5xDB2lVJF5N7k9IMUG5jiKczXWky8svy6kcR2dUpAB?=
 =?us-ascii?Q?glxYF9naGn4sjFKA2TdLbzXMgJ5Z8M/sMGshj5nBp16sZsOJl6o2L8gIL8zN?=
 =?us-ascii?Q?/nDHmh4RHddisWPIXJxVorcG2vT4S/ClFEP8DQBKPIi9DgWJS2DpMCa6TUjj?=
 =?us-ascii?Q?0j5FOAZTjMFdUJ4Q/1DUR32+ZsviXYKuaPVc23dvSOydja3UYX8JV2QibSZj?=
 =?us-ascii?Q?uI/WcyJ6eK8kZVduvJPvhGlT4iUP22VI7R18iHzXfpL0XZxVShEEfuSIfWe2?=
 =?us-ascii?Q?xSvOx/voO4Gd8WkoknB8Y4eUbimc86KgpG5885wbTMQLyhXvgmKqhhgUpBzs?=
 =?us-ascii?Q?3ZQ18ahNFG9bN3/Z2zfLm9kDiDmpkf2m5H7FqCtiMEJmJdkffIY87pcmWWZk?=
 =?us-ascii?Q?n+TayqZwWgP0fQbyclw2ijz8MMbTe09ZvqPeCAKnIUovTuOFroF2VncDgtC8?=
 =?us-ascii?Q?fC0im7h9IizV+vFI0D0twtHUD25cQv+d6h5cAdwRmyV3cwxfINtZIdWQRcJ9?=
 =?us-ascii?Q?0EMozLl6GUDe1o9PXqmrfStt6CuaGk4a7Sasab8FN/kaW59fXSP2q0b/vjvS?=
 =?us-ascii?Q?L31lRNFTZ+dmTt44n5jxaRqDi+PGqCijX3JAEpbElsy+WNzxeyk2Zas3Sjio?=
 =?us-ascii?Q?ETezIg5EWLkstUbPlC7XbKnS0JLbnUGKxJ9yKPJSysI2Yv4EU/baTjC3cRJK?=
 =?us-ascii?Q?PbHty4WJ7p17iCFYZ8n1NTudiDoQfasY8PFMzN75zoci7rwa7Sv6xz93fLL2?=
 =?us-ascii?Q?6/FCpyuMRYTStHXswWkWJj/wmP3rf4M2++QzOMsj2qNOO4C8RD6aD/nfTRDP?=
 =?us-ascii?Q?xSen3tRp8b4rotdqKZy2BuoPNnEtK+xwKbAruBPpSvVrNa13TRVi9vy6CExR?=
 =?us-ascii?Q?UfjCGpAhkELczCqIXrzWygdFZWAKUeB+uzbKGUd2ue4BaM4BiKY7TDuVRRcD?=
 =?us-ascii?Q?Oa7DB0Nkb4cplbpoQ5DzKdkZPlybyoIViuXPdCjxOdYd07fh0slMwHKxR+Tp?=
 =?us-ascii?Q?l4jmGS/QGPKRJPjQ15jAsplwQjqnPBMC8fkXDi9HUq5XQ1kj5JK2i0vLGzM2?=
 =?us-ascii?Q?LmaCWh8lWTiI3b4J1/e1WJB1bSuujRW2+EDIk1kt5NaMPhWBDY1CH5o/IVm0?=
 =?us-ascii?Q?BxZ9uxj2j2WH/NGGKr7kP3mJ4gx1iFJg//kQOe0v03TKg3mRb4YED0N+AjCU?=
 =?us-ascii?Q?o+r1ix7jmJVK/hU7YjYzuhBn2OO4IMb7DWJgDsb/ueqRhSw4KH+Jxrbseg5E?=
 =?us-ascii?Q?tCGVaA9Ftegwg/w3liQ=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 15:29:12.2205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4a5fdb-1153-4007-f043-08de17c913fa
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB4877
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEyNiBTYWx0ZWRfXxDose+f6Rohy
 A7SgC4m10ZExXVNNev9vIPl/gqoiDYJNNGeJyksfyujnbP16/Rx3337Lp16s2zG07sr9jtIjR/3
 emeZ/uttMnPLPphZPQGincMQVR86365RCuIyYecfe3yGmORWVpHPgGOa0PfzzHULffseFrgPmr0
 CVB+8B0qjK8eaHwZ6F1VbFO4ZfncQQAICDizUNTPHQ5JBdywDlKUE26p0PKW0c66sfX6vOkvzDt
 3fQZmkL8XuETYX+AT3s3Jv9UzohfAZ4dQ7exh3xoI9QOpTDQHZg+P9XcEUHO9sxMvfCGZJl56mV
 g9impkn1jEawf+2/GFG/+ijCL8xzkP26m73CD1QIfg7JcFQ3gUgxpzhe/6oJO8BeeYNxtmsNHXb
 9pXqBycDA0al90biIQC2o/92mU6VBA==
X-Authority-Analysis: v=2.4 cv=Jtr8bc4C c=1 sm=1 tr=0 ts=6903844c cx=c_pps
 a=+JdfgjdjdkA1bIRLmkjrZA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=BXx0LxjatULdQZoKTwUA:9 a=CjuIK1q_8ugA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: aMClLOHGc5qHdLHksVlNATD9mAR_bJqN
X-Proofpoint-ORIG-GUID: aMClLOHGc5qHdLHksVlNATD9mAR_bJqN
X-Proofpoint-Spam-Reason: safe

On Mon, Oct 27, 2025 at 04:02:54PM +0100, Pierre-Louis Bossart wrote:
> > diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
> > index e7f36d668f159..56e3ff8448762 100644
> > --- a/sound/soc/sdca/Kconfig
> > +++ b/sound/soc/sdca/Kconfig
> > @@ -37,4 +37,14 @@ config SND_SOC_SDCA_FDL
> >  config SND_SOC_SDCA_OPTIONAL
> >  	def_tristate SND_SOC_SDCA || !SND_SOC_SDCA
> >  
> > +config SND_SOC_SDCA_CLASS
> > +	tristate "SDCA Class Driver"
> > +	select SND_SOC_SDCA
> > +	select SND_SOC_SDCA_FDL
> 
> which builds on my other comment that the default y is probably not required.
> config SND_SOC_SDCA_FDL
> 	bool "SDCA FDL (File DownLoad) support"
> 	depends on SND_SOC_SDCA
> 	default y

Yeah ok I see what you are saying here, I would be reticent to
remove these selects because the driver depends on those
features, but then if all drivers think like that the default
does become redundant.

> > +	select SND_SOC_SDCA_HID
> > +	select SND_SOC_SDCA_IRQ
> > +	help
> > +	  This option enables support for the SDCA Class driver which should
> > +	  support any class compliant SDCA part.
> > +
> 
> > +#define CLASS_SDW_ATTACH_TIMEOUT_MS	5000
> 
> maybe add a comment on what the 'ATTACH' refers to.

Is this really ambiguous attach has a pretty defined meaning in a
soundwire context and it is SDW_ATTACH?

> > +
> > +static int class_read_prop(struct sdw_slave *sdw)
> > +{
> > +	struct sdw_slave_prop *prop = &sdw->prop;
> > +
> > +	sdw_slave_read_prop(sdw);
> > +
> > +	prop->use_domain_irq = true;
> > +	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY |
> > +			      SDW_SCP_INT1_IMPL_DEF;
> 
> Oh now I understand this 'class' driver is really a SoundWire
> device driver. You should clarify that this isn't meant to deal
> with function devices but it's one level up.

Yeah the commit message in general needs some beefing up.
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int class_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_status status)
> > +{
> > +	struct sdca_class_drv *drv = dev_get_drvdata(&sdw->dev);
> > +
> > +	switch (status) {
> > +	case SDW_SLAVE_ATTACHED:
> > +		dev_info(drv->dev, "device attach\n");
> 
> probably too verbose, dev_dbg() would make more sense IMHO.

Agree yeah makes sense.

> > +	pm_runtime_set_autosuspend_delay(dev, 250);
> > +	pm_runtime_use_autosuspend(dev);
> > +	pm_runtime_set_active(dev);
> > +	pm_runtime_get_noresume(dev);
> 
> This seems odd, I don't recall that we do something similar in existing codec drivers.
> It'd be worth explaining the whole pm_runtime flow.

I suspect that means those codec drivers are broken :-) at least
if they actively use pm_runtime. The first two enable
autosuspend, that is suspending the device after a short period
of inactivity. set_active tells the PM runtime the device is
already powered up, as it is. Finally, get_noresume takes a
reference, this will stop it powering down immediately once the
pm_runtime is enabled, it will waiting until we put the reference
we are holding.

> > +static int class_runtime_resume(struct device *dev)
> > +{
> > +	struct sdca_class_drv *drv = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = class_wait_for_attach(drv);
> 
> You probably need to explain the model here. In the general
> case a bus could just enable clock_stop and the attach should be
> immediate on restarting the clock. The wait only makes sense for
> cases where the bus is powered-down. Not all solutions will choose
> the last option.
> 

If the device never dettached wait_for_attach will just return
immediately. I am not sure exactly what the problem is here, the
soundwire framework in Linux does not guarantee the device is
attached before the runtime_resume callback is called so we need
to ensure that is the case. Now personally I would probably argue
it would be nice if the framework did guarantee that but this
isn't an SDCA thing, that is an existing property of the
soundwire stuff so I don't think blocking the SDCA on changing it
makes sense. But it is definitely something that people finding
time to work on would be awesome.

> > +static const struct sdw_device_id class_sdw_id[] = {
> > +	SDW_SLAVE_ENTRY(0x01FA, 0x4245, 0),
> 
> It seems odd to put specific ACPI identifiers here.

This is likely not the full complete solution but probably is a
reasonable place to start for now.

> It also begs the question on how extensions could be managed.
> For a first-start it's probably ok but we've got to have alignment on
> how we identify 
> - devices for which the default class is 'good-enough'

Here we identify those by which identifiers are added to the
class driver.

> - devices where an extension on top of the default class is required
> - devices where a custom driver is needed

Currently the philosophy we are working on is that there are no
extensions which I thought we had discussed in the past.  All the
SDCA stuff has been implemented as a library of helpers, that
means that if your part needs custom handling you should
implement a custom driver but for the parts where you are spec
compliant you can just call the library helpers so you don't have
to reimplement those bits. The class driver here is just some
code that calls the superset of helpers.

> IIRC when I looked at class drivers a long time ago, we don't
> have the plumbing in the SoundWire bus to automagically load a class
> driver if no custom driver is found - and adding such plumbing was
> way above my skills/knowledge.

Yeah long term something like check for driver match then if not
check the SDCA bit and try the class driver if it is set. But I
don't think those are problems we should be trying to solve here.
Nothing here really forces any choices on these decisions later.

Thanks,
Charles
