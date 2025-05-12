Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AE725179E
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 17:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747070056; cv=fail; b=UUf4cvVTvACk0oa1E9PboP4LFhc8HK9KZhni/w+Lao/9uy9FryCrIeut8jmvIDJmAnMZCXUpPMnKvpAQ1rpCHd4RgC8d+amlXwyExzxtL2m5vXVMEjlypWNC8VGr/2PHRjN8D+2K+d9SGrUKt+Cf09l7EDPFVH7tGXTMdTmm/Es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747070056; c=relaxed/simple;
	bh=gvcDcjHBIvftiEgKHzsxzA4ODK1BFSVk/i/L+yIus3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXIBMOI5C2203qf9vs4G21Q6CN4DfRIoS1EdYS0GaXGs4xa7PVA8jnxhvvk1+x6XsSUlbAIkltHzXV9XP+1aifQT4Is3rM2F2Jep4VPe7thhYrtpdZyYWv0IdPBFImTb45qAqbZD2kRblqs2PddJJB/g+mde0Wdu8R3O3ksb/mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WKcNs+ue; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FLk1Wob5; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WKcNs+ue";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FLk1Wob5"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CEeatH030665;
	Mon, 12 May 2025 12:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=LW4aANAtxNv7aOYn9U
	nLg255VgjF0AItQBpO6cdzX0g=; b=WKcNs+ue29HU//DTtO752jHGbUotprkA7R
	uubAdWK6lNFEtAMyYFvMdEjWYEzoYVjp0XGa81Z3p3/D2N871fJwMKkuT5s9ztxM
	msSa/se7lbpgE6CVeXZS3g9mj/hJn1v6nKOjkWVZcjMh1Zd5NlPRBMz7MoPJRlf/
	yxxHf5a/jwND9d71iBM3ljQxg0QZTPPHJ5K13H+dd97iqwdInQD6a5vPBaZpubYk
	h7H82aw90GPo7TR6Ah5MzqqXdg+v1FzzO/NvcNFzPc50aijsZxqzhTB8Ln8VlSSa
	jTRlPYydy2giK7nIlrSZsEBS+a+epyp2Z0UHzfvAZukpUNgOv4lg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46kjy0r6t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 12:14:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeFo3Xv2hAbtyJLEnv2i7MJR5uWdAKvGT9WSyaIDKuZKACMazQX76HAfZuCvVMia5t9p8ODzOfvZRUbeWO+IxBKtuNCh6YgRcBIffE0wWG+aKEoeqmQha7hIxNjGcRqT+QppqEgi6ufTgCMTc96bKUsVcExi9mWkUgm/O6ZG6WpbiEtD4MUpIj4Hz0pvLqj3KMuGLsxQPUGwmgfYQjSCCjFIPjeLvfgO3aEO88q8sEmNG9rhQjwFHmATkiEAynOG9pIj/7ra5sKwHxn7UeXEH+mHRHdI8eLsQjYAtawBY6bjm6t5gBcQk5Mcv5rI1oKI2YZr2U6X6HOZKxlxMS7jSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LW4aANAtxNv7aOYn9UnLg255VgjF0AItQBpO6cdzX0g=;
 b=BQX5CqeYsJu41zQLo40+7LE+sg5xa7XRA0D/IMm4wVqwYpU4prCK6lZnjC+lmVq6fqxaMyE4C5xCxRsDtf6VdOIrEQlbpON4YqtJ5CnPT2E7b5D7ooqaw3sLE0cLKd4OME9u1SNQRzB+d9CTP/ZbUewktMo4Q4+MhVKrFplo2edlw1EqEUkkQetVDF/bV+U+KgCxpPqjEwLSCWOUpURQKoTfBTZ1f8tBuAPYL/vWVFJWKIOIH0fhbY26MQPjTx36KZrJ3oyPCJHPsb8gKYcCE2I8x/UxMqt9BJBjhONSpLu+iip6TLQh5OEGT2wS+/MwIqwu/91/gip3tTF2J7p9Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LW4aANAtxNv7aOYn9UnLg255VgjF0AItQBpO6cdzX0g=;
 b=FLk1Wob50phaGlVu9iCpDWPvdqGupwUOrlWplBcgsWdM9idJYX8mCkUrJxV3BR5wGAGMTlHdNHC76YgdEltNkOXcUgBhFw1Ccf7PqiL9LSAS0VZHjWxSoDVsPTqgDmCfZjSd3HsqzWbbaQCmahC9bIqqdi3y9iBqa2Psjjo7dd8=
Received: from CH0PR03CA0018.namprd03.prod.outlook.com (2603:10b6:610:b0::23)
 by BL1PPF75D1B5ED6.namprd19.prod.outlook.com (2603:10b6:20f:fc04::eb8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 17:14:03 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:b0:cafe::b6) by CH0PR03CA0018.outlook.office365.com
 (2603:10b6:610:b0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.29 via Frontend Transport; Mon,
 12 May 2025 17:14:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.1
 via Frontend Transport; Mon, 12 May 2025 17:14:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2F3D6406545;
	Mon, 12 May 2025 17:14:01 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 167EF820248;
	Mon, 12 May 2025 17:14:01 +0000 (UTC)
Date: Mon, 12 May 2025 18:14:00 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 5/6] ASoC: SDCA: Create ALSA controls from DisCo
Message-ID: <aCIsWP1Ac8WvX11n@opensource.cirrus.com>
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-6-ckeepax@opensource.cirrus.com>
 <cd574985-e434-46d9-91ff-a2782c6e8eef@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd574985-e434-46d9-91ff-a2782c6e8eef@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|BL1PPF75D1B5ED6:EE_
X-MS-Office365-Filtering-Correlation-Id: d5afa448-8161-4c5a-4f32-08dd917864a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vPJYj57o8j5rtGN1DqLfRofgn3r76XEK938kwlkN9+DgxmFBBUvtr9yiEFJ3?=
 =?us-ascii?Q?aa7f/ONAbcQcivwBJfrBgwkDHkfTjF6qY6+2Ymg3FUA/WJ7xLhriDkyaoL0x?=
 =?us-ascii?Q?MIZmaUtd/GjxdRBRio6DoFeVpaQ3Z0Hbcq9rkiyxAOR8CVLqZHMEXqEMWNqx?=
 =?us-ascii?Q?o84yZ7bUcQZ9HZnhM9cVGB7+0G/vM3SZZsg0MWXaDOGkWldSMYrxpEMdVov4?=
 =?us-ascii?Q?IDs9kKiUEUFv2m8yOD8gKcCxwskEFhcv1w5gRPtkmFwWrtD7+wmd/EVpz0So?=
 =?us-ascii?Q?4fE17oOjYNE3W1zkv7YNMWj8lvWPtVnV3+3AfbVn6WIE0zuweHbW6utjQad2?=
 =?us-ascii?Q?5I0S53p5SEH1YwD5AgAXIYy6RIPXP5quLS3eDAtdAh41MwNqF+b8ficbyI1H?=
 =?us-ascii?Q?5Umj+FKPg7EhNHqpG0CxdANMprNDkfrl+m80a1Q/43J0eClwD3bIKJb7YSXK?=
 =?us-ascii?Q?V3Gv/qYpS+LUmf3meJITeZAkvBVxD0yRKCgvwyfMkXzPunhgLL5nn0lZ9ZPo?=
 =?us-ascii?Q?dHBlEfD9pw3pI9Vv5RHp7zaBzEvmt11Z0MrmGEViPGozmyE06iQzodCSCQqu?=
 =?us-ascii?Q?vUqh86qG7B9eJniXExqkrJsT8H6xr/+fx70EuOUZ8mnIn+jH0TaX53LzMXfA?=
 =?us-ascii?Q?TZUqEEB0CpCUZQGJPVfEokCyna1swqgZbm8VJkbdm6bUBSjTcfJZWtB7ulbY?=
 =?us-ascii?Q?qtzl26dUnqy2RhgVCujnupeHvcUnO2PmJZzuxiX8jtTKSnm86hiKkUxUXBa7?=
 =?us-ascii?Q?N+Oxd23LX4n0o2yeyrcqBWVVy3lgLQ89qFJffg5nUdKBrZM8W/9mO4t5Uzzw?=
 =?us-ascii?Q?jjy2+AhwPerS4HrrKJdMTboSBjybSjlVpNA0NtUuWMJyq1kkHINNdtEXI/qd?=
 =?us-ascii?Q?WFUcwpjuq4JyJEqryrY1DkUfQPLm8zxJqLjJS7KGPcX7gsynELjS9bB7ZtcN?=
 =?us-ascii?Q?aAJc2C0Rymw2hXDyhu2zJPQ4Rg9+cpcSigddfdIZJievT3TOdo6beifAGS2m?=
 =?us-ascii?Q?RinCme/gIpKI7KfVCzC8wRLpUqgAuYtaAtVn+7TNB/NnxZZx9iDLkXy4Tcih?=
 =?us-ascii?Q?tHkwkMhWDk5TCcI9C5y5yw7KYgt8gQWT3ntzJ+gK+Iwdd080Sz8BpgackEn0?=
 =?us-ascii?Q?/dzqWKagfgEV6v1HkSj+Zds1tlFZHtW+4uaemy0WxZQpu3Ltm6OCdeZ9k1TF?=
 =?us-ascii?Q?8CxZZA9+tWN8PuNzll+cMTYuMwoNRk9CeVlXBJ/Li7L1qih72mQewt0VebUp?=
 =?us-ascii?Q?HDX2SnyLG0OyMe1nlcDraciEI+/TtLemWE+6/U6xXZRngvuVwQq+VAasNwsQ?=
 =?us-ascii?Q?Wv+UIAF7a2IyZjk6dNMSH8pV038qAYYUtwQUXV8Ko+UFGIcyydpgByQsOnX/?=
 =?us-ascii?Q?FkXxeVQUjF1X1WVdqcwy8L+Mz4zZbiq0uS6Ahzc22naD7BT7LPloX0u0gg5L?=
 =?us-ascii?Q?QC7LMHD9TGHaTQqRkAbM/dYwNihGjC9rCPULwItAWO1FARvh0WziwfdWJnly?=
 =?us-ascii?Q?QS5He5DRdlgemXk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 17:14:02.4704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5afa448-8161-4c5a-4f32-08dd917864a5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF75D1B5ED6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE3NyBTYWx0ZWRfX50g1TXJ+9h// xuTDIugd95gDBAvo9GStFUKedf7ZwpRLW9d6gaLIf0gH/fHLdx7JB8bCDNbwRped8tE0a7hPqxI ZYasKq2ecGYyA6zKqv+MCN1JjDVKd4ELziLLTqN7l/C0OzKM7axhroeEfru7MIO3GbEi4oYESK2
 /DW5dRacwlN2aBDFnLziSC9Kdrj/1RO+Ki/g7ptLMWNh4eTZxYNfL0jRfyz7YATrO3LswQ0BxnR 4dPf1Q4e2Vdzg6JfjgRGv4IKSko0X/ppmKM9bYOo6mg6zUz+e38M+6EkV2YSgRRDmynWZdFw5zf iBr9QLISz2AzU8bYRD7ZmJCqdv/a/9UFjSUxmWUuL1GUhaqnTGBj4pusfQ4dZ1zZ2eDOGUlp+dN
 Xpv53RmC51hOIInCIZakavzo8JW955IaJV0FqjupdqAdTOw90HHy0il/QriNlWrZZrX3z/tb
X-Authority-Analysis: v=2.4 cv=Lcc86ifi c=1 sm=1 tr=0 ts=68222c5f cx=c_pps a=tyvwN2z/Y66O58r8mq/nTQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=T5fTAtyk6rgQDigBa7EA:9 a=CjuIK1q_8ugA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: IrVRnt_TVZ98Hhv-Bpx6UFyf-j5c3AXc
X-Proofpoint-ORIG-GUID: IrVRnt_TVZ98Hhv-Bpx6UFyf-j5c3AXc
X-Proofpoint-Spam-Reason: safe

On Mon, May 12, 2025 at 03:53:36PM +0200, Pierre-Louis Bossart wrote:
> 
> > +static bool exported_control(struct sdca_control *control)
> > +{
> > +	/* No need to export control for something that only has one value */
> > +	if (control->has_fixed)
> > +		return false;
> 
> why is that? It'd simplify userspace if there was always a way to
> get a value, even if it's fixed?

Well mostly it is because various things in the stack get
sad with a single value control you can't set. If we wanted
to change that I would suggest we add a FIXME. It isn't really
critical and I would really like to get more of this class
driver stuff moving, it has been out for review for a really long
time now.

> > @@ -99,6 +113,7 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
> >  		case SDCA_ENTITY_TYPE_OT:
> >  			*num_routes += !!entity->iot.clock;
> >  			*num_routes += !!entity->iot.is_dataport;
> > +			*num_controls += !entity->iot.is_dataport;
> 
> shouldn't the same line be added for TYPE_IT?

This is just the cutting on the patch generation, case
SDCA_ENTITY_TYPE_IT: is the line right above so this runs for
both.

Thanks,
Charles
