Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE602957D2
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 17:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747069761; cv=fail; b=QsOv41I25LIojOyVQ+IqqS0oOAicJhhmRP1Nmo6nAxhj6VB9zYFXqr1i6JYgRcYaGUHvaeFfx2M8zaMYWs+IpXNlFE1RnN/EHmmcjTqDpwFZsuytaR0AsytZx3jowVYGN6PvlX1y0k/0Uhap6y5nKqGoegXZ2y5AAlWPvxgP1hM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747069761; c=relaxed/simple;
	bh=IC1gzLx+0aANFSgRL+TSACn/mniqqPSyLXD87lJYUYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVj+o/u+0JKki7JMIyEmPQxyPDW/KxJwqn9VNcxk07DIVmBslT8ZGj9bgEngWqsS/ec5fMVXFwcm1gBGcOhbhBXNqrlxD/8FEDw5BIBP/Edj2ry3IAqAh6+JL21Q2LnIpyEI2QoNEkfyyTmUZxkRz4q9cjpHmkfJubrtHvw9nmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oh1qpJ8N; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WjULUgc5; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oh1qpJ8N";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WjULUgc5"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C6H5lL014403;
	Mon, 12 May 2025 12:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=8loNv4YKHemxHIM/vv
	ba1zU+3cfK14qCAXkJmgtsmlY=; b=oh1qpJ8NTDHo+CqMDapkYYffK4ODcSzq9e
	UgnJidy07nI/MzWupBxMxAtIdiK/dRhiQmcM+7Cc/1D2jfL3WWYAJsp8prCl2r+N
	cpXtI3eiX1OBkbVEzDbG8HtTXEquM7kWI+lFdgbboZevvBDwzgsHHbJ/F8jKfxq/
	yYe/aAyp4NAAO3j+5DIf0zgkF+Kq4vofEG9n+sWDA2VSz5yKDOfna5sWrff2Ig0l
	Lv8lkZ1U4cBRQ8RwXCt0jD9W4+Qh4JeNBdFx4uxbBEn4hbMTE5sXignDD3fnw1oL
	UahD4qs07Vf6lDmDnkcYtdlT3zEvfiZTVUJQt+4VJRDDsrsGnefA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46j37ganxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 12:09:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdr4d9cZC7NMihUYsDN7Me2Og+Cycuzd2dlxqITss37nr4Wart+yG+vcx7cogiTHTusaQiEUo2qqo+vLihInpPphB/ybAeEuy3rLaW7JI4pLgajmHK2BjwsZXF+W4gtKu/u8gYEvV8vxrPoWqFikEzaeWApJpteEVLUNpacgNSk7vfwkTftkI9W3F86YL2GG16gdRL6eIl6zeJMfilT4GXug4Kjz2TgYHclhvhhe/tYzkt2MqgPyg2N+VsAvlt4RkiPKSspfyxsm+ebGGm4jXtuqPMx5l70+e6LNhUVhAUQ1B3FzWzcLXQt1RQS+COkt1fHDlp0cZD3PSJEgqlhUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8loNv4YKHemxHIM/vvba1zU+3cfK14qCAXkJmgtsmlY=;
 b=tvHufjJFlRcBy7oAFA0uSNCEx9s8zgQiZNt6KMNz1PmNqgBl9lRF2NIQyFBWdJ+eq8r23F9ZOsq2EOZi/7h4ioUFDzruRCmaeCl84gxkJyPum4qxjuqRO6eBmOJDx1NYbt4ql+l+C2V63bT9faLMF53+LO/qpXcQn33oStbq38SbBBHh04pL/mbJK+61dHd6caFzhfa654W1/XTkjXQkzvzAkksPLzXJdxziHEwPKIf03pD6zxFKms88xkhnX397CJgbgFC48wJnfCOo3ZME82uVWmMSBeDJrPEMpwfbpcQ83caod0IFdOF8cauf9VEibSugEBDihiFgFRlnQWVKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8loNv4YKHemxHIM/vvba1zU+3cfK14qCAXkJmgtsmlY=;
 b=WjULUgc5H039UCyw/0FZbbRBCnDkWr+1Yc2TgVAmi/ab7xipEtBCJnG52uNWWw8K5Cjqbp9oX4DkwcIqp+NEiebji2vUSk31Wy0hIxgpqpxBrHrvO9Vn3yCoHeCCn9ifm3M4JFPVDNIks8Zq9ufSbIjeEsee/gJtvkdjyDc4PpQ=
Received: from SJ0PR03CA0093.namprd03.prod.outlook.com (2603:10b6:a03:333::8)
 by PH7PR19MB7608.namprd19.prod.outlook.com (2603:10b6:510:26b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 17:09:00 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::74) by SJ0PR03CA0093.outlook.office365.com
 (2603:10b6:a03:333::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Mon,
 12 May 2025 17:09:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Mon, 12 May 2025 17:09:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C6041406547;
	Mon, 12 May 2025 17:08:58 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id A9528820248;
	Mon, 12 May 2025 17:08:58 +0000 (UTC)
Date: Mon, 12 May 2025 18:08:57 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 4/6] ASoC: SDCA: Create DAPM widgets and routes from
 DisCo
Message-ID: <aCIrKasDhXrI9SLq@opensource.cirrus.com>
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-5-ckeepax@opensource.cirrus.com>
 <470de11c-82b1-4d1f-aa52-e0849ea261e1@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <470de11c-82b1-4d1f-aa52-e0849ea261e1@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|PH7PR19MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: ab6c027a-3f9b-468d-cda7-08dd9177b070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d+ScshTcrtDSHsADNb+wBBQoSGSRYSpXyeuMhAlQe4u5peb88aMAgH3S8sl4?=
 =?us-ascii?Q?RT8TvHvxQlCrSkvfVW8VKhVbzh7uSFT+G1RoLDuEBz+n7fPlZLMNMzyHFnnb?=
 =?us-ascii?Q?AkNSfbUrBTOj4CivrcQeVMCbMRx8CgjhzSt9F8qsvEi1gVRQdG828vVXStiG?=
 =?us-ascii?Q?nDGu90a33BkGzHgWasYRVKVEkLVcJ6pFYnP0DEAT8a3yoAbq9rpemy1qZK9m?=
 =?us-ascii?Q?YljaG7IScUTsmwyKHlU1Tlglch6c2R0tBIqaoKm7xDYVx2Ku8exSu2BX5chL?=
 =?us-ascii?Q?AKcnzQ4LpiwuCjaPMkrW+yejUhf4dElfcsZr+3jVj/CPXWcbsHSkuBFKiSpj?=
 =?us-ascii?Q?catJFHMXZwZUlvvzxtgiTKFH0yLgaTqxw93GnUu1MMXROF/3lVeLAbruaK2a?=
 =?us-ascii?Q?YKfQXy1IaiOm0lRNyt5Zpiu5mPeM+pcnoFnbFo5Gtj2pveboqladTMBd2v8T?=
 =?us-ascii?Q?4SOErHX30QwZKvMAhrJeftOD3IqcXk1r7rbPrUpLoRRduHZQxMsKhFBmUHQL?=
 =?us-ascii?Q?OqsBdyFNgXqR57ao4pFcfNB2paxptEHseZfnfVW5vUjfCz6qisaQlDo81rEe?=
 =?us-ascii?Q?EO+zmGVtWjs+R5R7KS+cPJSwl8u6mAGmzBlz9uLvX2HkA5VFeyd7KjSa7rEN?=
 =?us-ascii?Q?kx9pLstubVJr6e2XcT57QmeDoA3FHjApdGy3f88AnqOfIcBh3uZ5DTFhTyl5?=
 =?us-ascii?Q?16AJfANX4SQ4FhJdkRBChLmtsGrc7rJD/I8QDl7d5+vCPf2/9wYx7MbeEjOv?=
 =?us-ascii?Q?z8O9j66wy2v7xUTBdgy7IAJL4M/DouHGjdsMJB9r1P+Tg1YvImV8k46GLEc1?=
 =?us-ascii?Q?TjqsKd7QuAcRYRkrjbN2i2QEhoM7ztPqMV7tvqVS+IyChq4AgNRywV5r3hMN?=
 =?us-ascii?Q?DHJsIQbW3/G7frr5B36GFGSVyPH+7P0x3YqdeGR/GKi2Pj34zm3qNkfo4abr?=
 =?us-ascii?Q?2X1Q43+e3xReMnzUpWtVvRUcyqp9L05aKHwB1bZp/BAdN4vsPtGUNLqxDNdL?=
 =?us-ascii?Q?MhWuBvRxpdile+z6Y6JhnWgd1ImP3fRM8oIVpm3++9B6pdkAwyz0YBPzZiJQ?=
 =?us-ascii?Q?GDTIt++Bt/aV3nrRB/VdfThIYt+51N5f9D9DnM/e4f62OHinqMwWClyBiLm5?=
 =?us-ascii?Q?2JJYsBd3QDCksbeCO9oqyA/1v7TfZ06XCVYLaNum9w6wBmC/3pJmwCYuMKhz?=
 =?us-ascii?Q?ecFDeKsaHbkqHStvMkzn+FRxLOxT11CtsnroXALCZa1kVvsoBgSokF2QmRh4?=
 =?us-ascii?Q?fTjlovQzBFWETSemFL8yf/3JHESAm84rA3tXeWXjz17TFZCerm7Szs1hOYH+?=
 =?us-ascii?Q?CX+veKQfAJNi9zQ4Hf9+Q6JJlTUF+Hn/y2G8kB0BWIdA0EedbtsLmbK2RibF?=
 =?us-ascii?Q?zCsWVS6y9AqJTjWCkgn2o63dKp6gZ236PFLm1E0yiK2LcI0efoUy00LDwbab?=
 =?us-ascii?Q?Smv9wJZqXj34zcue4px0mRcLgoUcoHyHkdqvIYmDQYHON9MyLaU7E+Ma9YqE?=
 =?us-ascii?Q?cpHFF3j61xRRckiegz7vjX70YDzpNsa6PvJW?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 17:09:00.0841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6c027a-3f9b-468d-cda7-08dd9177b070
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7608
X-Proofpoint-GUID: YtKF9UaAT8yl4n7kYtWLUx8uFp3R8fzv
X-Authority-Analysis: v=2.4 cv=BOazrEQG c=1 sm=1 tr=0 ts=68222b31 cx=c_pps a=6L7f6dt9FWfToKUQdDsCmg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=Vrb6yhRvdlQmqZWN1ecA:9 a=CjuIK1q_8ugA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: YtKF9UaAT8yl4n7kYtWLUx8uFp3R8fzv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE3NiBTYWx0ZWRfX2ba53ADlpaNB dSWLd6eIliuWef5bCC5ub3wttqCqew1inCFS4hxg+KaZctY1G3ec4pBaze6oTT1t7S7MIc0ogaK rQCVjCZJ6zbvmrwMeNh7O3zs5Ig/VU1AbtcImLrLj1zB+QT9ntQtH+yRYowOVKrB87bzhVASBfn
 urEuW4sKefR3r+S8TM91cIyJtbEoP1yDyL0NIe33PVNH82y5DzCIlzKM8kCX+S2sAl56AnN6iVF VlJsPHhxktw30X3TeAECP5iQgudGhGo2d/8w1y0t6Z+eHjMWDUfiXPe6NRQp3gblOSHsH1fSlBi mck7Vz7dai7uGk0hdb1j3nUV46mhBKOSUB6Um4pZYRP1xr4dhcdC6furxLch9gaA5w7PUA2vsC7
 fXF9LJFIVacbVEByfvC9st+GqcXWtQbgZq79gdI17Jc1Pl3QqT+0OqXU8ZnttJOaFJ0WDw+2
X-Proofpoint-Spam-Reason: safe

On Mon, May 12, 2025 at 03:46:40PM +0200, Pierre-Louis Bossart wrote:
> On 5/12/25 14:42, Charles Keepax wrote:
> > SDCA also has a slight habit of having fully connected paths, relying
> > more on activating the PDEs to enable functionality. This doesn't
> > map quite so perfectly to DAPM which considers the path a reason to
> > power the PDE. Whilst in the current specification Mixer Units are
> > defined as fixed-function, in DAPM we create a virtual control for
> > each input (which defaults to connected). This allows paths to be
> > connected/disconnected, providing a more ASoC style approach to
> > managing the power. PIN_SWITCHs will also be added for non-dataport
> > terminal entities in a later patch along with the other ALSA controls,
> > providing greater flexibility in power management.
> 
> It's been a while since I reviewed an earlier versions so now
> I am confused.
> - Is the proposal to have a control to change the PDE state
> directly, as well as a virtual control to describe a path
> activation? That would lead to more flexibility but also to
> confusion, e.g. with 'no sound' when the paths are active but
> the PDE still in PS3.

No the PDEs are their own DAPM widgets and are controlled by
DAPM, they power up when they are on an active path. User-space
has no direct control over the power state.

The two methods user-space has for affecting the power state of
the system. Firstly, the virtual switches on the mixer units,
I initially added. These let you connect/disconnect a route into
the MU. Secondly, the pin switched on the endpoints that you
requested, these let you enable/disable a non-dataport endpoint.

> - Or do those virtual controls manage the PDE state, without
> userspace interaction? In that case the 'connected' default
> would higher power consumption until userspace decides which
> paths it really wants active.

All the pin switches default to on, but that is normal and
probably makes the most sense since that way paths will generally
work without any interaction.

> > +		switch (entity->type) {
> > +		case SDCA_ENTITY_TYPE_IT:
> > +		case SDCA_ENTITY_TYPE_OT:
> > +			*num_routes += !!entity->iot.clock;
> > +			*num_routes += !!entity->iot.is_dataport;
> 
> I couldn't follow those two lines.
> Why does the clock play a role, for now it's not really managed?

Clocks are managed, it is simply the clock muxes that are not
fully supported at the moment. Which is because clocks are supply
widgets and DAPM doesn't really have a concept of selectively
connecting supply widgets at the moment. Which is a little fiddly
to implement and given our parts don't use any clock muxes not
high on my priority list.

> And the difference between streaming and transducer terminals
> shouldn't change the accounting of routes?

Yes it does, remember everything is being mapped to DAPM widgets
here, so streaming terminals need a DAPM route in from the DAI
widget.

> > +			break;
> > +		case SDCA_ENTITY_TYPE_PDE:
> > +			*num_routes += entity->pde.num_managed;
> 
> same here, isn't there a risk of the same route being counted
> multiple times?

The PDE is implemented as a supply widget and it will be
connected to every widget it controls with a DAPM route to
signify that connection, this adds space for each of those
routes.

> > +			break;
> > +		default:
> > +			break;
> > +		}
> > +
> > +		*num_routes += entity->num_sources;
> > +
> > +		if (entity->group)
> > +			(*num_routes)++;
> 
> And here as well, in case an entity is controlled by a GE does
> the number of routes really change? 

Yes because the GE is also implemented as a supply widget and
linked to all the widgets it controls.

> I guess the meaning of 'routes' isn't really clear in my head,
> it's not just data paths but control as well that's taken into
> account?

I mean the hard definition here is DAPM routes. But roughly
speaking each line on the SDCA function diagram will correspond
to a route here, with a few tweaks like the GEs only show a
single line going to a red box around a bunch of other entities
that will be multiple routes one for each entity in the box.

> > +	texts[0] = "No Jack";
> > +	texts[1] = "Jack Unknown";
> > +	texts[2] = "Detection in Progress";
> > +	values[0] = 0;
> > +	values[1] = 1;
> > +	values[2] = 2;
> > +	for (i = 0; i < range->rows; i++) {
> > +		enum sdca_terminal_type type;
> > +
> > +		type = sdca_range(range, SDCA_SELECTED_MODE_TERM_TYPE, i);
> > +
> > +		values[i + 3] = sdca_range(range, SDCA_SELECTED_MODE_INDEX, i);
> 
> Humm, my memory of GEs is that the hardware reports a 'DETECTED_MODE' and
> then software (kernel and/or userspace) can choose a "SELECTED_MODE". here
> we only deal with SELECTED_MODE, is this intentional?
> 

This code is creating the ALSA control for the SELECTED_MODE
control, the DETECTED_MODE is all handled internally and there is
no need to export it.

> > +	if (entity->iot.is_dataport) {
> > +		const char *aif_name = devm_kasprintf(dev, GFP_KERNEL, "%s %s",
> > +						      entity->label, "Playback");
> > +		if (!aif_name)
> > +			return -ENOMEM;
> > +
> > +		(*widget)->id = snd_soc_dapm_aif_in;
> > +
> > +		add_route(route, entity->label, NULL, aif_name);
> > +	} else {
> > +		(*widget)->id = snd_soc_dapm_mic;
> 
> so for non-dataport terminals there's no route added, but didn't the intro
> say that there was a virtual control for such terminals? that seems like a
> route definition if a control can alter the data path, no?
> 

This add route is for connecting the DAI widget, the actual
routes specified by the SDCA topology are added in the for loop
below.

And the PIN_SWITCH's are added in the next patch which adds the
non-DAPM ALSA controls, as noted in the commit message.

> > +	}
> > +
> > +	if (entity->iot.clock)
> > +		add_route(route, entity->label, NULL, entity->iot.clock->label);
> > +
> > +	for (i = 0; i < entity->num_sources; i++)
> > +		add_route(route, entity->label, NULL, entity->sources[i]->label);
> > +
> > +	(*widget)++;
> > +
> > +	return 0;
> > +}
> 
> > +static int entity_pde_event(struct snd_soc_dapm_widget *widget,
> > +			    struct snd_kcontrol *kctl, int event)
> > +{
> > +	struct snd_soc_component *component = widget->dapm->component;
> > +	struct sdca_entity *entity = widget->priv;
> > +	static const int poll_us = 10000;
> 
> This should be a #define, no?
> 

I could make it a define if you feel strong but I generally quite
like if it just a local delay being using in one place to define
it locally, means you don't have to look things up when reading
the code.

> > +	for (i = 0; i < polls; i++) {
> > +		if (i)
> > +			fsleep(poll_us);
> 
> The logic seems inverted? I would first sleep by the amount of time
> required for a transition before reading the status register. Here
> we read it first and then sleep for following iterations. The first
> read is almost guaranteed to fail.
> 

I mean it would be fine to sleep first but often there is enough
slack in the system that things are ready as soon as you get
here. Often these transitions are way way way faster than the max
time we are parsing from DisCo implies.

> > +static int entity_parse_pde(struct device *dev,
> > +			    struct sdca_function_data *function,
> > +			    struct sdca_entity *entity,
> > +			    struct snd_soc_dapm_widget **widget,
> > +			    struct snd_soc_dapm_route **route)
> > +{
> > +	unsigned int target = (1 << SDCA_PDE_PS0) | (1 << SDCA_PDE_PS3);
> > +	struct sdca_control_range *range;
> > +	struct sdca_control *control;
> > +	unsigned int mask = 0;
> > +	int i;
> > +
> > +	control = selector_find_control(dev, entity, SDCA_CTL_PDE_REQUESTED_PS);
> > +	if (!control)
> > +		return -EINVAL;
> > +
> > +	/* Power should only be controlled by the driver */
> 
> is it though? With the virtual controls you were referring to earlier, it's
> possible that the path is not used and the PDE in PS3. I guess I am still in
> the dark on what controls the PDE.

The PDE is controlled by the DAPM widget created at the bottom of
this function and yes power should only be directly controlled by
drivers.

> > +	kctl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
> > +	kctl->name = "Route";
> > +	kctl->info = snd_soc_info_enum_double;
> > +	kctl->get = snd_soc_dapm_get_enum_double;
> > +	kctl->put = snd_soc_dapm_put_enum_double;
> > +	kctl->private_value = (unsigned long)soc_enum;
> 
> Can you remind me in which cases we have a Selector Unit not
> controlled by a GE, and what userspace would do with such kcontrols?
> 

A selector unit not tidied to a GE is just a DAPM mux, it
provides an ALSA control which allows user-space to select which
input it wants routed through the selector.

> > +	/* MU control should be through DAPM */
> > +	if (control->layers != SDCA_ACCESS_LAYER_CLASS)
> > +		dev_warn(dev, "%s: unexpected access layer: %x\n",
> > +			 entity->label, control->layers);
> 
> isn't this an error? How would DAPM deal with this case?

In general the control will work the same no matter what access
specifier it is given, it still sets the control. So I didn't
really see the need to hard error out here. Mostly likely if one
gets these its a sign of slightly dodgy DisCo but we should be
fine to carry one.

> > +int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *function,
> > +			    struct snd_soc_dapm_widget *widget,
> > +			    struct snd_soc_dapm_route *route)
> > +{
> > +	int ret;
> > +	int i;
> > +
> > +	/* Some entities need to add controls referenced by other entities */
> > +	for (i = 0; i < function->num_entities - 1; i++) {
> > +		struct sdca_entity *entity = &function->entities[i];
> > +
> > +		switch (entity->type) {
> > +		case SDCA_ENTITY_TYPE_GE:
> > +			ret = entity_early_parse_ge(dev, function, entity);
> 
> what does 'early' mean here? is there a 'late_parse_ge', or is this
> to say that GEs are parsed first?

Yeah we need to parse them first such that the GE controls
are ready when the SUs are parsed since they will link to the
control generated by the GE.

Thanks,
Charles
