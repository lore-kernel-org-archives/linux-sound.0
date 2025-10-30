Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A42363B85
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761839091; cv=fail; b=hdWtcv8GNPoByEr4bgm4smFBdJQp3U5ROCT2FYWWbmP5kmjjtk4Mgk3qkZ148/zaNBDkl123ld79oryoL6INTQKlIE+8Z4F5lNKGWbsRtdR6ouKI0PlXgZHGagVAf/nEXa6wMPgaHbm0H6Lgrw0DzRByPqQgHhBil6jRBFLvBqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761839091; c=relaxed/simple;
	bh=0TxAsNU8YP+S3IBF8nBmWJLGVK0MCe06O877Fu+a3/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5+xQUNRHRdYK9bSMLfRsACxl3XiZ+BJz8hL7hYDq7DSJQkCBDX0hUzWt5uL45TL30qcg3URL2NCRHiwZpVGWcKZKSFirgrU9W8d89x9trsqaZtXIzhdpU6H9hjAMUaIkvLy96tdH1FeS5fbUh13bMsr4Ge1DpKsLfNE041szlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Mhalf3jR; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=iVmWN22X; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Mhalf3jR";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="iVmWN22X"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UDmcvK661612;
	Thu, 30 Oct 2025 10:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=bjZ/v/S7FRq5U8IyZf
	EGqfPSapMMk+kLWu6K7xVuEos=; b=Mhalf3jRm8S4Ym9z9YVAprIV/+QoM3RX2T
	EWNR/qR7ZXswK4FV5y8phTfRMZIQSdwU9Si191pexsc2VoZFFzONjvXOO7nJNzuG
	f/bbxtZYXXY87VBuNTW9DuzRjl49VHh3e7bbXDZsLuWwCf+F3PT71SxPPY0CwJ3N
	LOVK4CsTIwL6yPDhF4VHbLctIc1bs2EXKXkUQfqwD+fr9aTm3NrLbm7GhDKvQ3pU
	iWcKOYp0uRzQe90zPmzX/qTQrOmjIucS6COyB7pUpdGmIQctdAEdC5OWHGYvQIPg
	RT29iNGjqtC8ZVZjV+caSEst0FEVSA9sOGJJszL2fk9TTv4CU11w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021096.outbound.protection.outlook.com [40.93.194.96])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a497vg661-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 10:44:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/bu5ketBR2bWci7Fjr9xQoDJ28av0of44KYnUR65991X62On+dVD6sgMLQWeC2x3q693F/wVrN8k46s3WWq0cfS/TZhhmpaagKK2YNpJ/9AJgtxEn3+D/SzDcXeat12CfvChEjORdCqsVc8n4rcXscwPAFUKlVVSBLLuR6Dh4pq1guc5QiFoZOFHW3FJDwCL12c5zkmLKfeIkxOfO7g2igeXfhBgy+qQpyxuIQRKF6ISisH8kl6VWiwfTRTFsi8qM2cNF+OCSsm9X8TxUTi2IZjMx3oE/jS4Z0i2QqszdAnP6cqt4Co6yWp+7Oe5Nmmcng6hXAzgdtZkUq7wmafrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjZ/v/S7FRq5U8IyZfEGqfPSapMMk+kLWu6K7xVuEos=;
 b=tV7FhQXkq3d+pDifohA9W59eb52/6NUzUdjoHcFfgo3ieFU3QDcoAlqIz4amIgj9P+5E2aWiRXLqffbRauzNlm4YZgVyhYCI+A+mpChoIwNR8sbMnuhv4+Pfd7tN1rqxpbq9IDdcUWn/yOlgMvthvnZAE3aeYtoPdWoMUHPZ59ANCGoGWyRMowkl7DA2MV6togoIo9aXpdceBgeQCd0y7olfQ0SrtDDdgLxXo+YTH+sRfE3lXFRIcm8QT4JKm/Zlu7Xk8jbt6sjPNtxQRUINohTYCfGjy2aitqEhwQT78IdD6GDzihUUeUBdnW8uki136VbUE7hkaBWQBhGjD2AS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjZ/v/S7FRq5U8IyZfEGqfPSapMMk+kLWu6K7xVuEos=;
 b=iVmWN22X4Lqo9xkdRTFR5yo0Xq85vx09TzCKqoAnFGjRmHOHKAS9RLkZa6UO2gqzazqTmT6RqnY+ODaEJdN5PXh+h67c8yRoY8ra9UtEPG/JphIpiyFAv9U7myjf71yJDVQbBq03sb7X6fMCwW9gECQPeTwZm8mMyc1agPo0wws=
Received: from CH0PR13CA0059.namprd13.prod.outlook.com (2603:10b6:610:b2::34)
 by DM3PR19MB8358.namprd19.prod.outlook.com (2603:10b6:8:1af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 15:44:29 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::65) by CH0PR13CA0059.outlook.office365.com
 (2603:10b6:610:b2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.4 via Frontend Transport; Thu,
 30 Oct 2025 15:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Thu, 30 Oct 2025 15:44:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E7172406540;
	Thu, 30 Oct 2025 15:44:25 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D5403820257;
	Thu, 30 Oct 2025 15:44:24 +0000 (UTC)
Date: Thu, 30 Oct 2025 15:44:23 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 4/4] ASoC: SDCA: Add basic SDCA function driver
Message-ID: <aQOH10Sb802aeRsF@opensource.cirrus.com>
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
 <20250925133306.502514-5-ckeepax@opensource.cirrus.com>
 <8e547635-1ea4-48b8-8e44-7c0e5d2f6092@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e547635-1ea4-48b8-8e44-7c0e5d2f6092@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|DM3PR19MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6f15a4-6cb9-4c04-ca48-08de17cb3551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wmm9gqh8laH3qrZXnw7HzWRIPkm4Wi3+YWHyCq8OwB1WBXz/xJpR2A0ZlolS?=
 =?us-ascii?Q?p3Vjp2+2iVzYJLiEJMznwkmQwWpi+WxrFOesaBjFseYrLHe24kvqcy3K9zqf?=
 =?us-ascii?Q?1S1lnthY2/XRHDp2i0GD6MR/Nvm/N/xNZGPWVhW5zcnMsKOL/TDyKDtwB/6u?=
 =?us-ascii?Q?n081rsqBZAspeImkenoMZGhsyDYxcy+RAszfLgAJA5iALtFq1bSqaYevSsJc?=
 =?us-ascii?Q?rYQ5bR+g0FhsV92SaKzLQpLxzeL1cZOgZW4Biov53WHNqepvucn41sYtNRoQ?=
 =?us-ascii?Q?YTP5n7ASmd8Cgxk0icDmYQEoWwtec4E6S+y9uFNeu1hVJqCR4qpTUYH2B4l6?=
 =?us-ascii?Q?gsnl7J1yG7eDc0bekmlmEBHFCcQRm0XE5q1Oo4LtfnzqqUWBBSqwosrUjU/P?=
 =?us-ascii?Q?g3R1A/cLqZDcPTt3cQbRar+m6I/jLSaDhwUxtUi+xCwyxO2Zk+U7Wyy+f5/S?=
 =?us-ascii?Q?R7xd4KVy76NlRnlNbJXXltCo8iXh99l+JqPAylbAszr+N2ZaxPsrg423UIef?=
 =?us-ascii?Q?kV0X9KYSuY7H4TmpdZ1hravgyKPTlV5turnOVV+/5G6epL4e7G2o5Vx8AINx?=
 =?us-ascii?Q?Q3rV1TuMUCVlS+cV21OGqxZLd/OA0IfyylrPSyBTRQ4FSeB/tVQAeL8O8Re4?=
 =?us-ascii?Q?Ql9EbMttBt9CyPLZRR+p/EL9ItI2LlNNfpfjCJ3dbTcYgUrBv5Nm1zGWmk21?=
 =?us-ascii?Q?zjvsie9rrV3tq0PC1uVTifAlthK8R6kWA7Cy5KEMcTOs0nhe01OCC7MuJSLl?=
 =?us-ascii?Q?AO71mJDyPM63kbceL513WwgoVbeW8EiFbAsgUXMEB73te0cv6jIGth/zn3Cl?=
 =?us-ascii?Q?DastIwvi7zHVEJfbh0uY0r+qh24/nyDUhx1VSyiKI3dbXYP6RXRHef53lhhR?=
 =?us-ascii?Q?7A0di/lVAaLHextvnD+34c/iR1VezPJV4bkqckvpWTSco1dx6qNxMcVgNP4q?=
 =?us-ascii?Q?nPaJtTmEKKbAJW55SYqqt9hPauqD2ZXzwyarii0XANpi/RVIlqQgl5fOACo1?=
 =?us-ascii?Q?OD13NvFbm6p/JNSKmvnMftICmeIzM/H0EI4zUnqgTbQglzObeotRO9/gjCRA?=
 =?us-ascii?Q?hJ0jNib6LiugEnbU8GU46PjE9IeeE+KPeYyOMmFEwYnncqG86iniUFQ2i/EN?=
 =?us-ascii?Q?bl98Y7MqdjIaV34RRyGD3EH4mRlbRgSmKwrHlMNOaohDKrGegzfw8GJ74Tm6?=
 =?us-ascii?Q?cxV7TEPle9QP4b0H/9YFuS7cCAgZYs/eHF7C+UI37nHgs5VaSOIdmBPXq//5?=
 =?us-ascii?Q?EtoE7oLB4W5kaw4OQ6A0iLXCRZQr4aM7ycFEv+FKix9qU2QW89vsI4CkYdzK?=
 =?us-ascii?Q?g4cpcK4x9e+Ds/KB3K+gyPnaaWJzp9+Sep8gGK9nXE+YiIbQ6aSmg5U7asSt?=
 =?us-ascii?Q?hlCK3ngpsoqmnKinM/MuIVenAWLr/3KP7S7Ku8G/PPcvTYOBaC/uq3XrqNxD?=
 =?us-ascii?Q?iZ92VWXtQjGJMMthoI/E//KGqpyfxL1nQX/uvO72x50ncLUAQ7pUY/0qDe8a?=
 =?us-ascii?Q?8xPn7xA9aM1fux++7RGnZIfOV1yS91toFan2VmaVyC51oB+gJywIi1grAONC?=
 =?us-ascii?Q?R3mjVYywv3LdJBBIHdI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 15:44:27.1160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6f15a4-6cb9-4c04-ca48-08de17cb3551
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR19MB8358
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEyOCBTYWx0ZWRfXzY0TKxAK3lkl
 3BJgX/nTpRmJHAsTFYg8+lD0ySPt0HyMzROLQunDzJTVvDzfBxmE6kEdIJQ+VGn62Fngxy5zASF
 DBZ8xXUQEKrb8iUXqobG79JMu5GYRbvceLeD97lJ35ohkXEv4kPBCXIjbGpFK3tyjXXEXp6CDc1
 JxS3ok7WyATTLDYsRCh7ABw9wGhGB2IO1lpLZOzLfsFEa3dnmbGIMan4ITdqYMtFknZrPcoK4Bx
 hZwclYEeVMVubzQq0xx8AdPXVJarbGmqnwUJgEdvVWtsYvIFdDmnOza2vXbJxQfb/FuBmWGomYE
 r+Zyt/CMFwIi5TIuyd0elkzfycYUI2SA0xghIKCavVYXPlwSRfAfxyavFbGagRtPUpVSpJDkW1N
 I54/YYhXiD7azUguAXzosI1E5d2QLw==
X-Authority-Analysis: v=2.4 cv=Jtr8bc4C c=1 sm=1 tr=0 ts=690387df cx=c_pps
 a=Y5OhYnybWnDos8loL9/x+g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=hsJcYBv8YsTmb_7BmXIA:9 a=CjuIK1q_8ugA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 8JU3H1oTe2CAqP-ci5WGYwgk0aqTPnFW
X-Proofpoint-ORIG-GUID: 8JU3H1oTe2CAqP-ci5WGYwgk0aqTPnFW
X-Proofpoint-Spam-Reason: safe

On Mon, Oct 27, 2025 at 04:24:05PM +0100, Pierre-Louis Bossart wrote:
> > +	snd_sdw_params_to_config(substream, params, &sconfig, &pconfig);
> > +
> > +	ret = sdca_asoc_get_port(drv->dev, drv->regmap, drv->function, dai);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	pconfig.num = ret;
> 
> You should probably document the assumption that each function
> has access to separate ports.
> 
> IIRC there could be cases where ports are *shared* between
> functions due to hardware restrictions. I remember telling the
> SDCA committee that either functions were independent or they were
> not, and the answer is that they are independent except when they
> aren't. It's probably ok to assume a simple case first to make
> progress, but with a clear documentation of the known limits.
> 
> Oh and for some functions multiple ports are required to make use
> of different lanes, e.g. for the digital links in the NDAI functions.

Yeah I will add a comment to clarify we are currently only
supporting a single port, although it does somewhat duplicate the
FIXME already in sdca_asoc_get_port for that.

But overal I think these are definitely bridges we should cross
when we get there. It is more important to get something that
functions rather than it supporting every single feature in the
first iteration (especially given how close we now our to laptops
shipping with parts we were hoping to support through this class
driver).

> > +	pm_runtime_set_autosuspend_delay(dev, 200);
> 
> why 200?

That is a totally made up figure specially selected to be
slightly shorted that the totally made up figure I picked for the
primary driver. Happy to take feedback on these lengths or add a
comment to say they are arbitary although these tend to be
arbitary on all drivers so I didn't feel the need to add the
comment.

> > +	ret = devm_snd_soc_register_component(dev, cmp_drv, dais, num_dais);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to register component\n");
> > +
> > +	dev_err(dev, "%s: %pfwP: probe completed\n", __func__, auxdev->dev.fwnode);
> 
> why is this an error? the error case is handled earlier.

Yeah that is just debug that hasn't been nuked yet the whole
print should be deleted.

> > +static int class_function_codec_runtime_suspend(struct device *dev)
> > +{
> > +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> > +	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
> > +
> > +	/*
> > +	 * Whilst the driver doesn't power the chip down here, going into
> > +	 * runtime suspend lets the SoundWire bus power down, which means
> > +	 * the driver can't communicate with the device any more.
> > +	 */
> 
> actually this is not completely correct. The function driver can
> communicate IF the parent is active. This is copy-paste from the
> device level but it's not how the hardware works.

I mean it does say "lets the SoundWire bus power down" not forces
the bus to power down. But I will try to reword to make it more
clear this is covering the fact the bus might power down rather
than will power down.

> > +	regcache_cache_only(drv->regmap, true);
> 
> I would also add a comment that all the power management for
> PE/GEs is handled by DAPM when streams become active/suspended. So
> there isn't a need to deal with PE/GEs at this level.

Can do.

> > +static int class_function_codec_runtime_resume(struct device *dev)
> > +{
> > +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> > +	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
> > +	int ret;
> > +
> > +	regcache_cache_only(drv->regmap, false);
> > +
> > +	regcache_mark_dirty(drv->regmap);
> 
> does the order matter?

I don't believe it does, happy to reverse them.

Thanks,
Charles
