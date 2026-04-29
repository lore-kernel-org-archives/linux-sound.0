Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08953C8731
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 13:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468275; cv=fail; b=lcHSmFXAf4X76XG7d4wLi5fsic9ATBvhZxwZJaqLk2x7g1gZ6mP+tyLeVV5YgGjI8v3USJ6bVd9AcJ4M9p4BWSBQbObl0Xub54dHbSW2y1IK4T0TcRzxWBLMYDvLnF2YrSQt/woIUYKLcR2Oe+3ZjT9A2du8zC/9V/XHBlqSPq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468275; c=relaxed/simple;
	bh=EZU82RDI2qpuviXYeWajWNd7MnWVUe4AxEqfHJhqF0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/gtHhsIC1sEPVvyKeGz5eB1OfkNMOs/sl2Z7xGZ1d/WeTr2+XWZMiIOYHxvk4jxWCpM7EibhMldqKCpVT/liRig3ChnS0bpErpVpf4TWArkLnZJsyNO6J9gh2F1FAG74xXz5Kt1xBYcpGmLvUjJeAxvC472aTm23yq8pz8mvRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KA+8j4Fh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jwqb7RBQ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KA+8j4Fh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jwqb7RBQ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T5QQ3Z2565698;
	Wed, 29 Apr 2026 08:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=oH2Ak3H1hTawHEyd4b
	13blBVMMmckffkpF3DyWKnzTY=; b=KA+8j4FhUDBirCRBoRaXZroJElI/6v7gqm
	Th+xxGLDMyBloOl3HDsMSycnTgjRmfAQZSbiea6wIxFBuAZLxV1FBSDMq0/bYeH2
	C02ZirQfPu1A7GVSm/HB0ynjn4ZJiEPmtLhNw4pG/si02OsPI1c6i2iYJC+jAPnz
	BgcoH8mGkIk0DF40D6EBpdjc8fAIlNII9iltybW3ECFWamWloHMntiaB/enVPK0Q
	G5ifPzzdhIOrGIuit2dzXCU4vRapTCxnDih3wFgttXcLDwKuyFf7PHIMg/naAYyw
	gq6/PYfP57xV36R58+3+J2/VOUf1NW5IlHYl3qFgdjA9AwaBW7LA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023128.outbound.protection.outlook.com [40.93.196.128])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4drt1jnkah-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 08:10:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujgTxWSj+RxgFMAQ8YS2leneawKmBJLjunH2CHpadk7wtOeXKxEpMvVFRdqdzmUB+LRkD7vVfB+ebUheKcHO34IhtFXk/lRcMwr8Ish7v3ELhXYReoY84ufATx1Z9gCS2Jjx17V6Xj1Y/W9ZuxvER2Z/nxwe0hUEKCgSvz5aDsqF1wcpLQF6ndpp8LWIHJ6i0mkq8xJiWhHQcva+kNOJTe37SMDdNrpW5S4KzPc9Ny4BhnUFi1wMmhQKheMob6zytJJd1x6mY0diC8enHCBkug7ZNbI0iPCtScxlTNWP8XKjUIKWXbBCEluhhAlMPsEWw0ZKziOfaby7G6Vvak1evA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oH2Ak3H1hTawHEyd4b13blBVMMmckffkpF3DyWKnzTY=;
 b=TfD2zDXAT/t1bKeYxpgTB5Su864WnDp+UkOgq+dmfxyyd5T1Ku6cD1dQJ0Bpah/1jWXCS/SXX3+CnSVtBXnjphzUC0aT5thFvSKmSPdFQI7ci1cnQ5BqkXEREpEb/gEGw9r3manb2GkFEGiT0UNNtN8ek1H9640ymhl1f2eMfdAa6gH/prybVYdigYgncK64+LlEcfOvCA5VcaituVCvylHw0nmfE7gd9GY00Ri9ee1Xa7Oww3jQpdf0UJRXhkzf0ULkVRZ1VtJEoYeAKrlae0DQcLQ5RSg124JtapeBmzaGj+1UoqQDnRumDrfmTkX/fqLvKlcg7Sr7aJ3l5QXp+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oH2Ak3H1hTawHEyd4b13blBVMMmckffkpF3DyWKnzTY=;
 b=jwqb7RBQOGffQVxfHrr0Y0QWnNmLdeKY+zgz2Rc1Qnwf0MhWROQ4W1QBU5KJVCvgdSOB/QgwBTjtYuRwr9FH5RgsaParV+cd1JX1UQYrRWjxiXOsgVpMFyVEUBN4uYu3f07NiWwK6covDJyYFW8YLd0VqVQmhLnKyuEBXmS8DNI=
Received: from DSZP220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::7) by
 LV0PR19MB9264.namprd19.prod.outlook.com (2603:10b6:408:327::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 13:10:18 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:5:280:cafe::45) by DSZP220CA0004.outlook.office365.com
 (2603:10b6:5:280::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 13:10:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Wed, 29 Apr 2026 13:10:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1B7AE40654A;
	Wed, 29 Apr 2026 13:10:15 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F14B3820247;
	Wed, 29 Apr 2026 13:10:14 +0000 (UTC)
Date: Wed, 29 Apr 2026 14:10:13 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 1/3] ASoC: SDCA: Add correct masks whilst reporting SDCA
 jack status
Message-ID: <afIDNXrQ23Cja0vm@opensource.cirrus.com>
References: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
 <20260427115925.3801099-2-ckeepax@opensource.cirrus.com>
 <cb90c6dd-5976-4aef-92c4-e7f6b91fda90@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb90c6dd-5976-4aef-92c4-e7f6b91fda90@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|LV0PR19MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d9f4753-8748-4ee9-7404-08dea5f0a872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|82310400026|22082099003|56012099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	60ZwD9ie4JYlB81vcus/AMiBdG92mAc3kuBw0Brv/ZHkEbTvnmkt7STzQ2C2mS8tDy3mDna399Y7JfbH0tJujIZCcij0DiuBo15PO2xtqjh1JBrnO7kAs0JgAGwM+5zRIPVgDmIXJdMg9OYEfz4zCznwYFSXLPrhtgw9u/lOuiKRygIXIJWiIzaxLmG8hup1/z6PpWoZ1dPvsPH5QU90XleT+KY1jXsOIgTTNEO5DCWhHidz827ldGcoFA6q3su6s3FtbSquPnAC4M4ZhCB0tF8qTJsfImnUGciOoDpWAEF2E5w1XY5od7vcUgWN/DkxebpzEdy2VkycnCF9lCB2JDZ9DlfC/SwWBD4Sn78oWKINhIYtChJnrxtIHdSH5/NIfSM7bCcCE1Of7FZ7O8sAju3LZHtRPf3S0666mSlwlLF0vU6Uvak0kDQdD6i59mPTowu8NTc+kLnc0CQJBb6ia73u0hFHh24k5d1hhNO+jHbz6mdZvFrTkHsnczbnWsVGYsJqVXqiYe1A89vpQNgye0B1rBD+8x5XEnqXs3InrIyBdsg9DylsgjYmr/xz/Kxv2tG51erx7rgpT69cwelJlLkAnbpI5bejhilSmwqJo5jfVTqRGKrJi30O0/O7d7HvHZEbiskYXsT/SJ+N1UXkXUGpHFnGswHRgsTsMpS/cVMC/kKy0RPaGBVVjhRdbmNkN7+3GPpIOZGT3uGmQA26ZSf22QYRZ7nqIdVoy55B62YkCNxto/ZN3OwBgk+xJRYBoNBZ4Y+l68mIL9C/3YoSng==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(82310400026)(22082099003)(56012099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eo+bgNBNvBK6eH23BNA342tnQydyYRdPVf4WIHoFr5QgKrqM42ZoTv1C028glivWjueyYduklOi1rBoIMywx/uqRSz84QbWWDifOWG9+Qv4Pqgbb9ujO48pr5umYdlhkcKQLKQ1tAYR6Y1tift7S/NA/lcivTaL1CI6F5OFXzcebK4qWjPKwZO64W6NUISex6TLzSNPo6ITv20/HLNZdUEDxBOIaEqlOTV35+i7TPZgX1l71CkiCpq3dkqN2HJ3/HLFXncJHIPomCwkRHc7srHT0QvIBav/+CaedRMQTNWR12ScKeg7i8TZSxAE8mR9oXOraQMxUOk2GS49DkFML95CrO/PkcYHAYvXrTT5u5xTWPlAcPgtcSMknHWbwIJUzUD3g1K+3FjxrbOSW+hAGdNMzXHLggDNYPcon7m/47mAe+9UxS/sZN6eMbbSnM0Cl
X-Exchange-RoutingPolicyChecked:
	SQvkNnVZTCuesvVg4s9o/R3Ob1umBrcj2wd+KbEtfJdVUzF9IRSK/IC+oqFVYwjIMuUud5MMR6MTGXqJWfMUFq4/4TdzH2tU4xoWy64MXjYZCB6CScbXz/eb5bhBKe/USMiKVeY0Hl2hLVi/x11/tcx3S7vFQx/iB8JxG6IN2kuj8ENRN+SUmlm3r7B7AthjRwaiVIg4i35YZqhdj2oA1HkXF9sFZuuiffzyJWZpVj7x2gIwWK62+v3N7Z0bLWT/RjdqEPGLQJtaAiGH9+Boq6M9Hai2YRiffaWgBnhcNWcB2VJNr1HtZYQxxwV1ZOz87G8TCwSBRVYcOSPRdmFiPA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 13:10:16.7041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9f4753-8748-4ee9-7404-08dea5f0a872
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9264
X-Authority-Analysis: v=2.4 cv=fbudDUQF c=1 sm=1 tr=0 ts=69f2033c cx=c_pps
 a=7mMRTYqth7La13Zyv/ERAg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=RRJvbsusou0oBApgF1gA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: rFw_NK55tSl4LI3WqdEpgLoBBgggBA_N
X-Proofpoint-ORIG-GUID: rFw_NK55tSl4LI3WqdEpgLoBBgggBA_N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzMyBTYWx0ZWRfX+ym7skjIhq2L
 fAjUT0tkVCSmmoOyKLVfm60fDsridPxFGOvNBQs/Rz44Y40fdWfYoqsSCZhvxLu9JpXHKjSzPX6
 iy0oeLU3vYvvKXcQasnnjNX6S+r8SO+SsKC1AOvT4HxCU6aHRQj3/5R3XQEuVng9NmiBY3GWy31
 zaApzaNl2faNfu7VKJcJzgSc/7F+eUXCcmflFP7jahyYPt5ZXJOESoz9MaGPcOXg5NNn9xBiHLf
 a0hb1gwZwiBmInTJoUpvoyxO4Vw6TF5oIXpLSQK+jgGXmK/YXD7Uppvbl+sU5425+S+B9Qxkzvp
 NFECa9drr2jM60Ko50YTztBYhhoHJSBrg7cidTw1FTyZUauT1w0MkJxzuivTMnY2x1KmAYdNdPV
 9M2I4QEJeVylpPElVabuKpOUqAt78x8U83C2y4j2fxQwScXh9/A2ZJHo7JGFcwbqg2RERlhkQAz
 m+9L6h9Df3orxr9sfiw==
X-Proofpoint-Spam-Reason: safe

On Tue, Apr 28, 2026 at 10:18:17PM +0200, Pierre-Louis Bossart wrote:
> On 4/27/26 13:59, Charles Keepax wrote:
> > Currently, all SDCA jacks simply report against a mask of 0xFFFF. This
> > works fine for system with a single SDCA jack control as the status
> > reflects that single control at all times. However, if two SDCA
> > jack controls exist in the system, such as a separate representation for
> > input and output, then the second control can cancel reports from the
> > other since it will only report its relevant bits and zero in all other
> > slots. This is exactly what the mask is for.
> > 
> > Build up a mask using all the possible states for an SCDA jack control
> > at registration time and use that mask when reporting a particular jack.
> > It is worth noting this still doesn't handle cases such as two headphone
> > jacks as that would require separate ALSA jacks to report to.
> 
> I couldn't quite get the last sentence. If you have two
> functions for separate headphones, where would you have a
> conflict?

For the SDCA side this is fine, as in we create our controls
there is enough to distinguish everything.

> Don't you have separate ALSA jacks created independently by
> each function?

For the ALSA jack side we still have a jack object being created at
the machine driver level. Primarily because the existing jack
APIs require a card pointer. There is certainly an argument to
pull this into the class driver itself, such as we did for the
mic and speaker widgets. Doing so would let us support even more
topologies however that is definitely a bigger piece of work.

But either way this change is helpful we should really mask for
the bits we are reporting.

Thanks,
Charles
