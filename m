Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27EC2288F7
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 12:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336263; cv=fail; b=SDe0Y03/v1rbLbw8z2rgLeeySHmYmF7N3p83rbAOzVftvIcYK6fYqlsw5iOYQBmQqC0hn/VARhtbxpPJFA3Nv/NR27lO+TIA7VPHgdRMWANsziFT12NbvEd3bFBm4tkA1YT273tWUJ2GVw8C4ZxQfBMWHu9Sen4inrQosN5W1WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336263; c=relaxed/simple;
	bh=LpMUQnJyw9LlN7MfjrcaXH+KuVxqVDrBf3/rnStkRww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gm+z32kbu8fw66XFK7+4noqf8LDc7VrMi6vXG75K0Dhdr6VL+j8XjmChyOUI3VWbwcOIan0v9mG6tzUi4uifnOmGkmeVwoYDxelvozzUTutK012La3P+G8IjIuK4hPGstbshBFqRgalqxQO6T21amBEYRKymVMFTv5PWtJJGFlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=clPhcFuH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bNm9uB2U; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="clPhcFuH";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bNm9uB2U"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58849x2J3868119;
	Mon, 8 Sep 2025 07:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=kk3cHOhp7eyV21FCta
	FghwqWaKpztwO5X5TI7AISBCM=; b=clPhcFuH6Zf5Uz9imerNjrbSTDaYRmnlrP
	E3aKqK8UXRBFPiqwRpWF+r5OzGb/H7oSHzd538oUajXfOBF9LgBGYN4TNPTFtT85
	0b86goMM+RqFiUxx0bGGUhODdgGQTdhl+hRx7JecGPZ5Ob/vFjhHhu1gWHFViVfK
	yI9RYGHZACDzZAOil4Kl4UrzHmQc2Y+yW+6qCZuWzcKuWjPWmWCiqwC2pTEOndNU
	L7aWC9UmIB8fYqezhw/qCzFKLYugdKIrvnuK0B2o3YoWcf6pmfmDikS8LZ61pdkt
	K5DbvwZZj/0p7bsqxMdpOVPD+v518roY8pKS3X1guHC1FZho0UTg==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2128.outbound.protection.outlook.com [40.107.100.128])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 490jbxhw9g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 07:57:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2CWmNG73rwOtqyLODz0uWilsEAECONzoyvBa/7nBMyPxDbKdPo0RvdzWqws5JHzUnO9ZMn660bzeHL6OJTldiyRXvpnaKWU86xROsbBd8rlb+wFdXOj/TplEtNcdfF6l1+qoOY+HUBGlqGtJ+3VIi/Hk4kIVOARwB+zuq8KUDAcmzcdGmPbm9pLF+rdM2EWXaJEbPlSDgfcQV3YEBpbHMCktQUjBnhmTx/rxLC4sCJiUE4ArMvuy+JRtG0u2uwZLAvSf7tNIhdD0ByhFmZC8BKOUru9e3m3sRpuPjRK+++czuJJzXt3ZFAnW4/0tDjOmWUU7lXP54pKF/n6SsH/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kk3cHOhp7eyV21FCtaFghwqWaKpztwO5X5TI7AISBCM=;
 b=Ifkdd3+RvgkQb+KoscH9mA8oj6m1wT4LliJanIibgW1A+6e06O/hl5vaIrz8UpfVYtfGiIp4V5GHvRJzpEtffYCtJXAPtoWXA0mFZfr3oW0a0IW6XZCFY+nKQjEm4grW/9gTIpQUIe3Gquck9dictvdwmk1bQwjirkqIvmJnSXWn9LWESX30cNHO2GX8+mkzYQYL+uh6guUeni85tIjqhqfIS8MboUD65LD6dxWRD506px9nxyRyOQ/aSqATiPkCckqmLaJQlAfRT7qasR3Sl2qHbaBB4/G++OIlKwnAOKmmh941CIsKZmuYgHXgcltkn5Dv6XH5xnIWf0VT1r23qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kk3cHOhp7eyV21FCtaFghwqWaKpztwO5X5TI7AISBCM=;
 b=bNm9uB2UXwYlGRalDp6wFUQBPpDPLTD5jPYqxEQZyrT23ZFlTLPlt+ocI178mUlA4fheoIVheydPbGBc7KXgVV3XXXtFCQrxVZOR5UL8oueM2M9EZh3XqyT/W8PlmYo/IPumoVw6GKrUPfbJ99SZKP4zrSmqJD7P+DgwKW6v8EY=
Received: from SJ0P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::16)
 by IA1PR19MB7915.namprd19.prod.outlook.com (2603:10b6:208:448::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 12:57:01 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::ea) by SJ0P220CA0025.outlook.office365.com
 (2603:10b6:a03:41b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 12:56:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Mon, 8 Sep 2025 12:57:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CE658406540;
	Mon,  8 Sep 2025 12:56:58 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BD8C0820247;
	Mon,  8 Sep 2025 12:56:58 +0000 (UTC)
Date: Mon, 8 Sep 2025 13:56:57 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
Cc: broonie@kernel.org, rafael@kernel.org, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, bard.liao@intel.com
Subject: Re: [PATCH 07/15] ASoC: SDCA: Rely less on the ASoC component in IRQ
 handling
Message-ID: <aL7SmSjHTZ0lDm8l@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-8-ckeepax@opensource.cirrus.com>
 <01bc3a67-6ed7-4bb5-8106-531af7f29d63@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01bc3a67-6ed7-4bb5-8106-531af7f29d63@linux.intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|IA1PR19MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df46b79-8143-461c-9de3-08ddeed733b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DHLQbXLHZAOlV3X/gDrrr1T/adr+49xGdA5M2JZwZghJ9Qeqflkn0mwGTlNg?=
 =?us-ascii?Q?1obwUh9VTRGvgF5PoKqD0lfoOXvYMO84RpdRsck9t3JYdDxDZsnXD1mIIy08?=
 =?us-ascii?Q?Qh7grQFzWdgXgDHhqlq1vC6L2yT2gjUNvzhUzgRBeFBPgna/mDf/1BJdhvZL?=
 =?us-ascii?Q?z/UDxTktghywL/qTkeQGNOb6Z6bq7qa+hRfCoDmIDBCTqAQcOyG3UTd/vHKm?=
 =?us-ascii?Q?vbMpJRQHs4rzBEDtDi3ikxSkxpu0fEcrz5XpjFayXOluRZrV26ZFsl9PmORt?=
 =?us-ascii?Q?1gy477NzIS8Ndj2zckftv4Rynk+CndoYMAr6jrwQe2rdPzj/zIo4UMorrkwr?=
 =?us-ascii?Q?SKgX8WDo+lrBJ5Cb87G31uEf1XkjFLGecgCj1o4fVjgrd4fqjQOs4YvTPXKp?=
 =?us-ascii?Q?ZNMwrrANPPzAMCRrrDUplXOZucsRKHQQfeF+cBfSZ6ok+cfw2EOGPDt9FgEB?=
 =?us-ascii?Q?Mcjch2UNQmWGiBCX0EPXFA7/m2wyFza3bnjGTodwag4/VU+ginQyE0r/57g5?=
 =?us-ascii?Q?9skEublhBCFYgVPg79ae3PQ+mXV0mjLX0RpPVkgBU8Q+0DtSkKqBfFFY6q9u?=
 =?us-ascii?Q?I2Y2x52EWBhaIjY2jnj8jEqplx99MNZPDLyZAXaZUrcbivYtsvNakZalXRxE?=
 =?us-ascii?Q?/hebdbeXcj5qfuBeSMINOWdsbwK4E7hYSi2QIcDfu4CT66GGId6btqGcj6CQ?=
 =?us-ascii?Q?re7gEe/bXL+kpht4IM0/0wOPxuIQbTwZOWnHGMT/RzYnQOasVPD/fk82aas7?=
 =?us-ascii?Q?RtuqnPAmYiGzZXpJs+1X/WmO95rKPbMf60zpCf5joJcXciCjmLb9H7qLSFvo?=
 =?us-ascii?Q?//D5Vnf0CpSrHbLxUT1FfK8kOp/HhcfS4a8Yp+UalzVGgJ3hKTac8RW6J36O?=
 =?us-ascii?Q?NfwCunEz2nOiYA7xzpTonWOz4w3kfAmNPUdIYleAXrXS1tbXYVD+bUCSi/Ej?=
 =?us-ascii?Q?sp5zulomdNtyURDKNOmOSVsfS5/RmyDpZvKHh7TsHV9iQsrJzGdkWENMdL/Z?=
 =?us-ascii?Q?W38kLozA7Rtjueu+nMez+jfQTPaYKAVPysu7VqXnta653/FC4zyOAyOPM376?=
 =?us-ascii?Q?nwis4mvM3Q4wv+VE9nMjxuJ7n45MhxX6vn53ODpt1hFf1sA2FcsCU0LHfuSH?=
 =?us-ascii?Q?q55hvgjK5tucC9t666t82n21JCxLmLohiGRo87pnZaP32VLelhjgCeWfHiB9?=
 =?us-ascii?Q?VmGmaywlPzup4X7/MmoTVrnSIGnRDy/QzYSboyt8fkt5+84QvzPHvYXkWh9x?=
 =?us-ascii?Q?5oh9Ap2NKepBvK2FCOMwyjGgUHBiuabKGfDD99MBrMBx8VD16K3Wm4V53Cpw?=
 =?us-ascii?Q?UeBYtCZVxLdNH4xL2Kus5cZ6k3NiNpupCQxOHQDl7D2yvZRZUWtLmItvLA+P?=
 =?us-ascii?Q?XbdK6M5/3bf63JWDqWv17fqP7bkehdDFhAEh0x+xhXyzV6ovZVojeJbiqqD+?=
 =?us-ascii?Q?mhTBktMTUGGzn1hx4Sq/JqS/QGHOqGoef53EgQ/zmoRg4/Q8hxPozzjx4GoT?=
 =?us-ascii?Q?IUd1iATk47EcGS8W0p7tmxp+y07Op2n0KWhz?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 12:57:00.6293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df46b79-8143-461c-9de3-08ddeed733b6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7915
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDEzMCBTYWx0ZWRfXyXN0y8G2NfME
 x69c6iB44Xl7N6LRY8tzFMdopVZ3yy0Ou/4dw1MjzzArvtQUSZ56UVzfPgxbYOHgtSKjKP+52T4
 l9ong2JVQjefQIC6abRD0JGM+OOZs2/O42vX7D0uZVtir0SU1MBLGGGyedJI0UpnbL9v4MZJonA
 nOR/xIVQ1pnBxvJwzfOnsYhCsLDYFaDGlvod8gmHSonTJE8LnA0p4vUslFeQDH7ByiTG7GIepTU
 0PbOyxsRGJgfZU976t71yTzjl2GL2D+MDZD+ERR/tpFLcFHDHIc9Vu1SzIl+wBJMdmVuHV7h8Db
 TFphH1O52k8KLSNbCOjx7TQcnFvlEfOW7CS/Bcu5CtX5l92LhQKESZgWsPKscg=
X-Authority-Analysis: v=2.4 cv=L6sdQ/T8 c=1 sm=1 tr=0 ts=68bed2a9 cx=c_pps
 a=CrBk5/quPSbPF/jJNvPPdg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=w1d2syhTAAAA:8 a=ECfsWs7D119IaF2eojIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: iAwliN_Vd5TKrtKBMARUXLiFIpJJYFh4
X-Proofpoint-GUID: iAwliN_Vd5TKrtKBMARUXLiFIpJJYFh4
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 08, 2025 at 06:27:40PM +0800, Liao, Bard wrote:
> 
> 
> On 9/5/2025 10:31 PM, Charles Keepax wrote:
> > In the future some IRQs (mostly File DownLoad) will need to run before
> > the soundcard is constructed, as such refactor more of the IRQ handling
> > to use raw device and regmap pointers rather than accessing things
> > through the component.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> 
> > -int sdca_irq_data_populate(struct snd_soc_component *component,
> > +int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
> > +			   struct snd_soc_component *component,
> >  			   struct sdca_function_data *function,
> >  			   struct sdca_entity *entity,
> >  			   struct sdca_control *control,
> >  			   struct sdca_interrupt *interrupt)
> >  {
> > -	struct device *dev = component->dev;
> 
> Previously, we assume 'component' will never be null.
> 
> >  	const char *name;
> >  
> > +	if (!dev && component)
> 
> But now we test 'component'. If we don't assume 'component' is not null
> any more, we could test 'component' at the very beginning of this function.
> 

Good spot, that was missed when moving from an older version of
the code. I will get that fixed up.

Thanks,
Charles
