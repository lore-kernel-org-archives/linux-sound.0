Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B3128CF77
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550933; cv=fail; b=MZUzQN10Ym4yRrW3c0NXe2oQM7ImoOc9OoeVo1MbNgfnq0YFJ8aAmnmmRZtgzqW9rycPiELRahejp0V7DpsmR3Kpz1Q7ZO42hqAYnXxt/K3pz6b6HPQ61txlYaec9yQlenJxaNHAsWtACaOXC3ldEeg6dKhP0m1E+fEUonTQU34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550933; c=relaxed/simple;
	bh=AS3YEAqtj+q2/Vz8lNdCjeYLZ8KP9I8aGbsGStSn4kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZBqy5X54VGD+1ZgK2+7fSazxcD/ivMAmXLF/hP/nlzptMfFeD8+zXG/kmWoF5zZFw1VLV7w2CshlE6dsTVTMFAs1Il0uNbE2qa/q0sXz6tfJJy1Rze36yXoByC0YSQ7WybrZWXLobNIcEAcH6FoPcloDzRx4hCEFX+Pbq73d0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GySTZDPF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=O3RwuRBl; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GySTZDPF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="O3RwuRBl"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A5BOQ5024806;
	Tue, 10 Jun 2025 05:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=FZJC8nNa65n+bfM66E
	Au6HGK5xm5Zb+VNy2LOyo6Oh4=; b=GySTZDPF3PdClZolmop1t9cARs5buhoioa
	p0Er9G31w2bUJRFnqKyUuM66v331BUpp5zGPjIDc8XrxmN9RaqjaIppKvJ/IBfyS
	J1iUouQirONRLtU3PxR6bQnyt6xVFbXOh2aUM5wqmxKCaCdueTS9cnRbTmMjx1f/
	w4CVdMVn7+vPR/NAHtTUglCb1wcIBy6mJg3R76x0EyIe6cZICtEX+p7r/pCQZekP
	i0umhQD6VhoGXAy/svLujocxD78SvbHCR7knVZwfgNwoYxan58u6DmSPcTDqPhRn
	ox5oGw895EXgzyuBvXD4uEM+VzAUtMLe/jEeFsI1tHcLnJuRe1JQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11hn2205.outbound.protection.outlook.com [52.100.173.205])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47529v2tt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 05:22:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nc0R3mDYQpvGlQC8WB3sMJiWTOJucLcM/lbUmRBAY6Nod9KbIJVFwXQGj/SMiABkSmj8GVKF5nZfUrVtPWZNZ+movzY2l3U83rlgMRElrq0g6Ws0v3uxEh2wzFDFyUdr5V4m1EkiknKdxuRHwd9OiAe733efwUh+1bi39Xc40skTRoN3TW6c+tzNw7sdBam2UvjjjFYurFxxSo/9ufqhYPxqeNvOXWN2dSVivDJofna43jcxBkqA0HiaDY5vi6N+Ab9RIoZqvYC6yef77UaGpPeS16ouFf7j2EuepFA3S8/2pSUoP+O14ajAAybmHniUJ16bVAyItNaDc2ZIjbcjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZJC8nNa65n+bfM66EAu6HGK5xm5Zb+VNy2LOyo6Oh4=;
 b=RsIv3lIc4nq/RrLWcJAMWCrcbrlgP1yySce7xeULjS8kvHLqPbhWNhTYiFHpqW3kV1a6t4cHyJIJAJBqal6XjVavm0Kjd2AA4i5wnDKNTnC+EGmyJA6H97e2QSb3rdgpj5cKN0sJZdWhaPinIiuYDZDAPH5ntv/4h/0fpmV9vAcS9vUMEMXpoHc+gUqBeYzXeQdQ0S5QNvZHQUQCxykDUsA5NvagiH2zrfgRiX+MfsJ6dk3v2fBlz6Bk5XSti0P7MgbIL7mqzaKAqHr5FftbNGvvt6kK40QF5vNFy4jyw9eeyABWQavE66Utkt0FU8oQjVmq4rwakzJXPjFyO6NfVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZJC8nNa65n+bfM66EAu6HGK5xm5Zb+VNy2LOyo6Oh4=;
 b=O3RwuRBldztjLrhQtMFZ5czJ+79Pwvnr8XwPE4iZRvNe0hAPcTbNH36Ga1QgqqHelwqiGToQd029A2OXpT+rB8RTWyG0ziVmMy6KnuQeSS0jPsKvP2mDGobqnJ/x6+GnPWZ0TSjyL1fnmAQ52E/T8MuVzkG3oPOzAAIEHsr6NCo=
Received: from MW4PR04CA0172.namprd04.prod.outlook.com (2603:10b6:303:85::27)
 by MW4PR19MB6864.namprd19.prod.outlook.com (2603:10b6:303:1ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.13; Tue, 10 Jun
 2025 10:21:57 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::86) by MW4PR04CA0172.outlook.office365.com
 (2603:10b6:303:85::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Tue,
 10 Jun 2025 10:21:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 10 Jun 2025 10:21:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4C9B0406541;
	Tue, 10 Jun 2025 10:21:55 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2ACBE822542;
	Tue, 10 Jun 2025 10:21:55 +0000 (UTC)
Date: Tue, 10 Jun 2025 11:21:54 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com
Subject: Re: [PATCH 6/7] ASoC: SDCA: Generic interrupt support
Message-ID: <aEgHQnT1hNU3kJKP@opensource.cirrus.com>
References: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
 <20250609123936.292827-7-ckeepax@opensource.cirrus.com>
 <4233bfad-973b-4803-82f1-13a0b1dae8cb@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4233bfad-973b-4803-82f1-13a0b1dae8cb@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|MW4PR19MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 4269a37d-9af2-4a54-4b3b-08dda808a100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|34020700016|36860700013|376014|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U8twk5vrm97RDecAr3Kzcni9ErqIFEwfDOz0H6B7QsyG5s5r3Kx4gN3S8i76?=
 =?us-ascii?Q?iwbrAIObWw833xIwqqraYr2zpsft5z6HO5Z0ChCsRja3mUoVOGYAX5/qJ34p?=
 =?us-ascii?Q?orq0g/W8y95GywHPu3BPW90GBuC965y3MPD8O6NEsMPc2PhQucrpXMrvg8oT?=
 =?us-ascii?Q?GBVrtH+FQWvxOuju4uiTREaX6ZeEWoq9y6tRCtf36G307SF7tiG5CvTpyyjx?=
 =?us-ascii?Q?64im/+XV1y8myTG/pc0wMVoCqOsoSAobPKtnSYIHipnMLINKc28GS44OYkAl?=
 =?us-ascii?Q?Xn68llON+3c1qHPMA3JuftYF82pYCzPIcsOKwj83IrvqMK0zGoVfA1HTcRJF?=
 =?us-ascii?Q?j07LZsWgHKYLj24634WmH6ewwMzFxfEjA5Ln/FX1ap1T8kWYeVBoKIYycWiH?=
 =?us-ascii?Q?w5CgSYgcMTYrnEvpZ6E1Xn1+Cnx1Riiwg5w51fkry3iDQsUMINY0M0hCO2ck?=
 =?us-ascii?Q?6ozIx7JzA/2dO73jYOd2KGjdZtog9zdX1LldPUTzPszh1ry0me7Gkw09EOfg?=
 =?us-ascii?Q?D83iBy6j+pm1byuBsdniyD/DoZXgIA/QJnf/+Zp10//CUvFUJtyRtP0HBmkR?=
 =?us-ascii?Q?kRlXp4WaS4s87x/a0lAwRHL48eJATiatfAH27YrgGUAC/gGM+QxYKXNjr+Zp?=
 =?us-ascii?Q?vMXowKVlVpKWdIFlHiqqJP4ippUfDQfAl7mHXC25RIqcpIud4NNfKvqwHazb?=
 =?us-ascii?Q?TGcqzNUjfuYpj6Nvy9EWZyZPfXEiYkbSZ5hkkp5+eqhTWAV182x4mp2siiz1?=
 =?us-ascii?Q?RtFksACzQWSKNE7UDG3cy3i1auDOJh/79J2dgeBbwzITFaqAjHyp+IWT5sdV?=
 =?us-ascii?Q?XbQJNzmi4p98vKd8+oBNEl5eDK6ShY4lgHKdrrA2f7ZFn8fcs88gQVLfvZkC?=
 =?us-ascii?Q?JNTJUqiiiaSfUvmJofl2yXlDlhvWcTGEWiy8cXm4bbP3aNGaGcxcDB8B/E14?=
 =?us-ascii?Q?91hdhe0YHQJ7PHYovHytz2BQepRL+rOOhRcTiW2WTvX+sJte86PlALTykzUs?=
 =?us-ascii?Q?svbrYIDJwjA+1Y5BNQjWsDvCO9lZ957erPKqyFy+Kgi7U46QoZxmafsah+2O?=
 =?us-ascii?Q?iACUXYPdT+eoij7bkK2/5jQdwZ29v6HxAaKLxe6yLP2fNQnw00sPtUmysr6G?=
 =?us-ascii?Q?heJRVgT8uoXb4VVFE3EwzkyHSwpYK7LLmsm8F6I+/LTmf16DfFPah0hXyF41?=
 =?us-ascii?Q?ecflLXyNErSAmzCIiY/mIcm5q9Cw8OOdBizdFR8V1WNzxTrWvLG7G1XnDoy8?=
 =?us-ascii?Q?dcIo0QrKUMpieE+4lQLiXx75p8EUTFNC3gwfkU9iHaH5ZXO4gF0inp7OQO7n?=
 =?us-ascii?Q?G01CdHJLjJ4r+p9y3yk1nx3wKZv8TkNZ8iFZ9zhzd8j0+MCA0LXTNQ7Xopli?=
 =?us-ascii?Q?Y5h5Q+MBaJh3kKR7Xy52hcb+uCQdPhu3YhUi9Kkfj9gU+gKoWruEdSNqClH8?=
 =?us-ascii?Q?JMsz2w/AcTdLIWddRqOSWmbrljKJ4juneQBQK2G2VbMWgPWUTRd5go03UMko?=
 =?us-ascii?Q?aVIo329GnenLQkOcLvYXgNwKuffObTs5rBQ/?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(34020700016)(36860700013)(376014)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 10:21:56.7483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4269a37d-9af2-4a54-4b3b-08dda808a100
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6864
X-Authority-Analysis: v=2.4 cv=Jfq8rVKV c=1 sm=1 tr=0 ts=6848074b cx=c_pps a=20EQJ0uoxqo30Y+ZFMW2Cg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=ez_IWxBUI4P1YJRIZIsA:9 a=CjuIK1q_8ugA:10 a=jZz-an6Pvt0H8_Yc_ROU:22 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4MCBTYWx0ZWRfX8VDqbaexYvRJ 0l4SxKc4dH3v0QD8rhNnR1mGAyjNnbJzWQcv3LlwNHGTwfTKy/oHyafX1Pv3ZpO8uKOvWQ6+bM2 Tf4KI6YIJaXnM/lU3LWmDj2A3qfDWU7Z6mOxGWlBdi+IEI0lMhHFt3gsq6rVDBvj5I6OfhLAItj
 HVQbOl2+4828dMR/Ozr3GbzHGNNNb5sXAsHsG+k/qpLmqYeQVxvzC20PDfOqKmkmBeDYGu83p3F +/CqA3lrlzAeTfREISAOX2JZMFE/xHEZccMwDQgRYWZr4zEZgqWjskJMLGLgVGZgoMEheEQtOkM IlV+Rh6XQeSDXbP7h/VdPQz4Ef5RWofeZD+82pXJWF0lJfL76mVc/uGpUk3OK7bpHe7vxjqfA0C
 Zgr1flbXw0OkqeyJtQfYMX1nGAiDH5jzMOkJcG5XY5cQb0q66gQEGM6Mh0/BUtUp+0hXjYwZ
X-Proofpoint-ORIG-GUID: b1HLDSG3uM5VdErl2_jXfQanC29YjYcH
X-Proofpoint-GUID: b1HLDSG3uM5VdErl2_jXfQanC29YjYcH
X-Proofpoint-Spam-Reason: safe

On Tue, Jun 10, 2025 at 10:52:30AM +0200, Pierre-Louis Bossart wrote:
> > + * @externally_requested: Internal flag used to check if something has already
> > + * requested the interrupt.
> 
> I am not following what 'externally' and 'something'
> refer to. Each interrupt is allocated to a specific
> function/entity/control, this hints at another agent getting in
> the way but that's not really how this is supposed to work.
> 
> This deserves additional clarifications IMHO.

I can update the commit message/comment a bit, but the idea
is mostly we are creating an SDCA library here, so there are
two possible IRQ flows, the SDCA framework can handle the IRQ
internally, ie. using the handlers present in sdca_interrupts.c or
the client driver can register a handler for the IRQ directly to
do additional magic. This flag lets the core know that was done.

> > + * @irq_lock: Protects access to the list of sdca_interrupt structures.
> > + */
> > +struct sdca_interrupt_info {
> > +	struct regmap_irq_chip irq_chip;
> > +	struct regmap_irq_chip_data *irq_data;
> > +
> > +	struct sdca_interrupt irqs[SDCA_MAX_INTERRUPTS];
> > +
> > +	struct mutex irq_lock; /* Protect accesses to irqs list */
> 
> Can you elaborate on what might conflict?
> 
> The only thing I can think of in terms of required locking
> is access to the common SDCA interrupt registers, but that's
> different to the irq list.

By the nature of SDCA there is one set of IRQs for the device, so
the irqs list may be accessed from different functions, these
will by asynchronous so best to gate access to make sure
everything is happy.

> > +static const struct regmap_irq_chip sdca_irq_chip = {
> > +	.name = "sdca_irq",
> > +
> > +	.status_base = SDW_SCP_SDCA_INT1,
> > +	.unmask_base = SDW_SCP_SDCA_INTMASK1,
> > +	.ack_base = SDW_SCP_SDCA_INT1,
> > +	.num_regs = 4,
> > +
> > +	.irqs = regmap_irqs,
> > +	.num_irqs = SDCA_MAX_INTERRUPTS,
> > +
> > +	.runtime_pm = true,
> 
> can you clarify what this last initialization does? runtime_pm
> is far from obvious for SDCA with the different levels between
> the SoundWire bus (enumeration, clock stop, register access,
> etc) and Function management.

Means the regmap IRQ handler will do a PM runtime get whilst
handling the IRQ, which will ensure the both the device and the
controller are powered up, which will be necessary for
communicating with the device.

> > +static irqreturn_t base_handler(int irq, void *data)
> > +{
> > +	struct sdca_interrupt *interrupt = data;
> > +	struct device *dev = interrupt->component->dev;
> > +
> > +	dev_warn(dev, "%s irq without full handling\n", interrupt->name);
> 
> is this saying this function is really a placeholder for
> something else?

Yeah basically, this will be assigned to any IRQ that doesn't
have an implemented handler. For now that is most things, but
even in the end once the core is more flushed out this will likely
persist as IRQs are control specific in SDCA. This will always be
necessary for controls that don't have any spec mandated handling
but could get an IRQ for implementation specific purposes and
would have a custom handler registered by the client driver. It
is really a default handler to warn the user/system implementor
that some code is likely missing for a part.

> > +static int sdca_irq_request_locked(struct device *dev,
> > +				   struct sdca_interrupt_info *info,
> > +				   int sdca_irq, const char *name,
> > +				   irq_handler_t handler, void *data)
> > +{
> > +	int irq;
> > +	int ret;
> > +
> > +	irq = regmap_irq_get_virq(info->irq_data, sdca_irq);
> > +	if (irq < 0)
> > +		return irq;
> > +
> > +	ret = devm_request_threaded_irq(dev, irq, NULL, handler,
> > +					IRQF_ONESHOT, name, data);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dev_dbg(dev, "requested irq %d for %s\n", irq, name);
> 
> might be worth adding the function and entity name?

That information isn't really available here, for handlers
registered by the SDCA core name will be name up of the function,
entity and control names so the information will be present. For
custom IRQ handlers it is up to the requesting driver to specify
a good name.

> > +int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *info,
> > +		     int sdca_irq, const char *name, irq_handler_t handler,
> > +		     void *data)
> > +{
> > +	int ret;
> > +
> > +	if (sdca_irq < 0 || sdca_irq > SDCA_MAX_INTERRUPTS) {
> > +		dev_err(dev, "bad irq request: %d\n", sdca_irq);
> > +		return -EINVAL;
> > +	}
> > +
> > +	guard(mutex)(&info->irq_lock);
> > +
> > +	ret = sdca_irq_request_locked(dev, info, sdca_irq, name, handler, data);
> > +	if (ret) {
> > +		dev_err(dev, "failed to request irq %s: %d\n", name, ret);
> > +		return ret;
> > +	}
> > +
> > +	info->irqs[sdca_irq].externally_requested = true;
> 
> this looks like generic/core code, not sure what's 'external'
> about this...

The key point here is that handler is passed into the function,
that is the destinction between an internal and external here,
internal uses a built in handler, external gets handed a handler
by the client driver.

> > +/**
> > + * sdca_irq_allocate - allocate an SDCA interrupt structure for a device
> > + * @dev: Device pointer against which things should be allocated.
> > + * @regmap: regmap to be used for accessing the SDCA IRQ registers.
> > + * @irq: The interrupt number.
> > + *
> > + * Typically this would be called from the top level driver for the whole
> > + * SDCA device, as only a single instance is required across all Functions
> > + * on the device.
> > + *
> > + * Return: A pointer to the allocated sdca_interrupt_info struct, or an
> > + * error code.
> > + */
> > +struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
> > +					      struct regmap *regmap, int irq)
> > +{
> > +	struct sdca_interrupt_info *info;
> > +	int ret;
> > +
> > +	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> > +	if (!info)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	info->irq_chip = sdca_irq_chip;
> > +
> > +	devm_mutex_init(dev, &info->irq_lock);
> > +
> > +	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT, 0,
> > +				       &info->irq_chip, &info->irq_data);
> > +	if (ret) {
> > +		dev_err(dev, "failed to register irq chip: %d\n", ret);
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	dev_dbg(dev, "registered on irq %d\n", irq);
> 
> not sure how helpful this message might be, it'll be rather
> cryptic without additional context on which interrupt this
> code handles.

This is registering the primary IRQ it is the entry point, so
it isn't a specific IRQ in the SDCA sense. I could change it to
something like "SDCA root irq registered on %d\n"?

Thanks,
Charles
