Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD7140DFC5;
	Wed, 22 Apr 2026 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776846397; cv=fail; b=O6GbkEmWc0qVPGNlO1sK/BSxPYCo35i8jU4cpMgdhg7JvVuPzfO7mbi/MS6MbXe4Zn10K/Qhx2b0rZmygfDq1pZPJd/48vWmkFhUtzNjuZrXorjT3sF8EpdU7NpmcOwY95AlJxDzrkVnhLUMUcEc8cuUrAmUEI9Aa3rClQDNJ+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776846397; c=relaxed/simple;
	bh=rtUZ/ug/MtQFhw94bURQg2zCt8tFmyazfcs8o3fTB7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ay6x5ZYf3FF2EeIvD/LAHLGBE7ZSEPJ9Lq0H15A78c+140z2YNgWKcIn7UV5jzjTLay4AX0RNSDUIYFpRYrrPhsDdyOaQz3HUhkiAohXQdUyZ7qalg7opDhY9y/svgBybXw/NKAPYPXTwT2gcujpcVprWVWYyGp2C4usGcX5rDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cRFYap5H; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=r+OA57ud; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cRFYap5H";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="r+OA57ud"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5pq9J2246699;
	Wed, 22 Apr 2026 03:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=4PGf0X9r1B9zG7eglV
	chOlgJngSy/APmqU3IE8MTMmU=; b=cRFYap5H/29QACiLBJb4jtLLWBh24M5nfT
	RT8d/t/cg5rbVMQiEJWb14tm2z4aej75E+riy0b1n1PU+JTipqhWy4o0FgR6jsym
	fTxXzY0fSaV1bMcZSHROkINjIVwIHAByM607Q5c3goNMAMasLfUen0ZH+yOgMfgN
	oSg3Lo9e/eu3u0qgWyQx/1IZMepNjyHIvaq6ImsbK9xS05QM8N+IpU1G6YCr7yIq
	iGMDAB19APeapdvvDrHVeDkYRSezwqnSfraBhyI++xlwVtKzLTxJUK5YEKfjajFs
	iBZHsU+hTqXXsj9aJU9v5wMZut8Y+QYNO0XXqz3mEUoGiVEN0cKA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021118.outbound.protection.outlook.com [40.93.194.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dpenhrnr8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Apr 2026 03:26:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVMO/thb2enCFK2iou9guuVcLbDrl0ORczKkwSlJvULW/p5VblDB3vGxqZAy5VbE2jXie/If7+8JEtd/k0LdSfqTv/+Ke87ERXlyIthJuoJ/1PSPJRics3+aNrYov2A+wNOtb3GK+E8m2Sfbn9uVrPqS+dlBgsVAuNrlfayWYPBPj7hYK1czpzafXSK0glXZe8+BLlM+zS3x7+6Z3LCtMGbUtwXF0HORApdD1zYcA656hRs/phpVyyNOR5ycl+GpmWqfUX6yxvKkrvV++OEg/ND3Cvp+JiVWRtwR8JkeS25L2KnKGMwFEZbICBE9/RDtAh2gv2VY/dNCMAgiBcM7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PGf0X9r1B9zG7eglVchOlgJngSy/APmqU3IE8MTMmU=;
 b=RfeDYsPI8GrRcpAt6RprHsyfxAEbih+g0OdBALS3hLgDPfTHDs0wSO5ymX6fx9id7r5R485kafCeWWqdTwj6QLHtnCZfI4wfvfymVAv1yrM/XmyzM8FrUC9EElrnI9iwHiDXOt0nYsDH4PU2XztJ5433Paw8p5cH9s1HIuUxv9gbvsWpCgXEKN2iD4E6Jl5SKR/IgGzTgl6M7XD/upt0YeWgUYhf/I7tD/t0hTilMoHsnS1mxGHxZjB7IylCRngakD1/1xK7dQ9qu2xY3VX1Ra+8dTMfxlo8e722yYByF029iQ+NQcw72/BounDyfqiubqVS3U5XJSGACvRndKuHmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PGf0X9r1B9zG7eglVchOlgJngSy/APmqU3IE8MTMmU=;
 b=r+OA57udlasmybe/Cvau6rI2WWfpzhevw7D5EZIQF6W+wbmwQ6BHiiuix/oJplMgFLii2A2w72lCX340HnKHHudRN+ef1c3iGbE9w6Rn4Yy0uNOakJhMzXHTjVnsJeSZg9xc6m4ZWWxCqY4yQdo6zDR1Gra2Y47Y9TVE/AQ8CPA=
Received: from DSSP220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3d3::7) by
 SJ1PR19MB6428.namprd19.prod.outlook.com (2603:10b6:a03:453::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Wed, 22 Apr
 2026 08:26:15 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:8:3d3:cafe::35) by DSSP220CA0014.outlook.office365.com
 (2603:10b6:8:3d3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 08:26:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Wed, 22 Apr 2026 08:26:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5FBE0406542;
	Wed, 22 Apr 2026 08:26:11 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4AB3F820247;
	Wed, 22 Apr 2026 08:26:11 +0000 (UTC)
Date: Wed, 22 Apr 2026 09:26:10 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
        perex@perex.cz, tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com,
        v-hampiholi@ti.com
Subject: Re: [PATCH v10 1/4] ASoC: SDCA: Add PDE state transition helper
Message-ID: <aeiGIpYwZz/dBuqQ@opensource.cirrus.com>
References: <20260421154804.2670-1-niranjan.hy@ti.com>
 <aeeehYTuNON2cGKJ@opensource.cirrus.com>
 <e13e6934-fb5b-4ea3-8517-85d482ad25da@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e13e6934-fb5b-4ea3-8517-85d482ad25da@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|SJ1PR19MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: caee2487-fe54-40a1-f17c-08dea048d0b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|7416014|82310400026|18002099003|56012099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MTeizQp63GxCTc4gT67Wm236J6x7+XIQ3DNRAsmP2f+2RGSQzpU4PjyyfB5MhD1vmMgcra7ilFTMxuLW4d+mZLh/rXNRMs+H/KYN1R8zUr7hm0T0DxNh43I+rXwtm22+jGw5gWwpVkTYROH7yoL7i72ePLloTJaUASWnSy9vEoRKHVXYG4D4zkT65FSq6O2PuPD7VTDrV8FLCUQTuSFTIPDwKvEVOCxRcRFv3x6L3cK9px2RB//Qh5tv1spPZsJkFve9xUqdbjwZeDMtMpTk9aGX/EEwtaBqgzpINod7B/jiquvayZE6t/ZI+e2Nv/hbYB3qnRBMNv0ZA4sXSLrk91DysU8MZmneWPHD7DbMXQDNSqRuh6aBn5cooJeqpDuVEG3q8JcyzZeTknfmwZWHpqbHrsBdRuc90InMcaAg/T/uD51EkkaZkzodO0ES0i/lbZl2TN3DO1FXKoqZxsFquYWlA6iHe3pPUcPOsU/6KEFULIjMEmumJ6aPdUgw5W/VtuZ075gfTGfSYlOXWf3Hf4xXsx6SZMKenE4hBHXOmiAsw7EnzoqPj4ZvPLfMw/09rhxKwcCYvWRPYTEztfnrSra+z0TFMkORU1gejsae2BJReBWPnFxXPyD3jVq0GZ1KPltBxjzWw11CFLa13aH9wcqUuzKjOXuknHWqMagsK43RZWeiORPstBNhQ4dsoykSfd+fpOFNhnb4DL7dLWoqXPJpjFsjsrtZm7WeW+LJk9nZeH+tEabfM99Ui/hmCMne9PNoe/3xEJqihInP794iFw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(7416014)(82310400026)(18002099003)(56012099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Viy6IDvKe2kAdWCkBrnaO23OrZIIPGyhz1LqvQPG0K82eaLMhp33BN/zuYPlnj5mAVKl7WpFd97GsWxcHSF22OmBkwRTfFSul5BMOHqyLll8J38ncKzAYQNpNYcwJZJNjQvwAPi+iLXGvo4Mwy84a+ba/Ke0D8N5K/YL7yHNCchlbIJ5oBEO1wDuKnL2SmpQr6i53t9PPNP8X0keus1m3TTFYD6G7gozRrKMBa/RE9WpQaixBrHughPXAhtNTLS0uiDyOK6blePkGGIuYKN7w6nAFU7B/54T+iHpFNFM4lPXQQLuiJ4dEQ4u1Og95Vmi6DOl5xFII58Grl418gVsMwaX6Qpz9ane+9OgjPoN88yAeiLQQh4xdFJOegIFvh0JQHDjUdVtGGtoCKkRQNGIijq87itqkvZqdv8Imw+dn7I7dgwV4yJ7XB2aJPm9LfQH
X-Exchange-RoutingPolicyChecked:
	tXzMtE3GBuCtMiQ2AW+715WL0Nqf5I9sAxT2Tn1IUT/dTEXNZK6MrDM4cbte1MMs3CFNBIA/r7CDXRaId8h//pmoHP8AUVztmkr4ZM6Vaf7XUP/6oAzeNNypvtwyaAgIo9TAaM8R9tbsXqa36Y4lAbgPDbrsvWHTZ18VqN9KQaMlU5Kzjs+x/2u/2GCExT5TRJ0JpaQ6ckqiGilmj4eiMF4P3qwPY+0g27o5E6y9oJAnqfTYiMqHjxVN96mE07/3NRzLn680+f/qZ1+FGk+DwPYwB818r6gZgl+RtYeYS2JazkyPk4ye+Shfh7eHeep1+Iz43hXDybCSa499o9yrLw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 08:26:12.9991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caee2487-fe54-40a1-f17c-08dea048d0b7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6428
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA3OSBTYWx0ZWRfX49gwXfb8idlC
 oG6nqJCtjtynXw/HKLiaejzh0gW47GWuqEGfxe28yd+2YY1CfL7UoLjamqwF7WsZCMcmIqquw46
 S2qDn2taxJTRZwODwLs2X7hF3T2fV/1fxRYLoHzh8xZuWl80f1ak8DtYpTxz84vzJxq1MEIyAKn
 J4Xzs0mRCRpPiFCDVLkNgOtYzmWSnUcsVooh97nIkegsjkXRg61CT95Qc+BEKJYP7Euv85LFMhJ
 /GCEPulgJO5zeV2rQbAM64friRekm7fp3QkbzJz+oDr0+rjmk3xhSaPEGKtpzbfDT/01A/gPtrK
 hAAIW38DPxms2TGw2eWnwVMaLRw/ctDoV3/jfzabeOTogno8jPXpXEFlJPY6FMaz6gRdn0KGWc0
 QIPrWMe59VYrLNEnxgPnhmWiev59JK4DG4/O+So9YmMWxPx/HAWk2gcndY4+O6x0Fqpqx5Y+kKI
 1Yba8i+4xA+VEEyEpVA==
X-Proofpoint-GUID: -szCs12GQh7xxn285ubb-CxGjN89I_yU
X-Proofpoint-ORIG-GUID: -szCs12GQh7xxn285ubb-CxGjN89I_yU
X-Authority-Analysis: v=2.4 cv=DZInbPtW c=1 sm=1 tr=0 ts=69e8862a cx=c_pps
 a=SIO/v8SSfaR8RXaXrLdUYg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=sozttTNsAAAA:8 a=eI1yAMKECdnxJpQlKtwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Tue, Apr 21, 2026 at 06:21:09PM +0200, Pierre-Louis Bossart wrote:
> On 4/21/26 17:57, Charles Keepax wrote:
> > On Tue, Apr 21, 2026 at 09:18:01PM +0530, Niranjan H Y wrote:
> >> Per SDCA specification, after writing REQUESTED_PS, drivers must
> >> poll ACTUAL_PS until the target power state is reached.
> >> Implement sdca_asoc_set_pde_state_sync() helper function for
> >> changing the power state of the PDE widget and wait for the power
> >> transition to happen or timeout.
> >>
> >> Changes include:
> >> - Add sdca_asoc_set_pde_poll_sync() to handle write
> >>   REQUESTED_PS register and poll ACTUAL_PS register until
> >>   the target state is reached or timed out.
> >> - Export function via sdca_asoc.h for use by SDCA-compliant drivers
> >> - Refactor entity_pde_event() in sdca_asoc.c to use the helper
> >>
> >> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> >> ---
> >>  static int entity_parse_pde(struct device *dev,
> >> @@ -449,8 +492,8 @@ static int entity_parse_pde(struct device *dev,
> >>  	}
> >>  
> >>  	(*widget)->id = snd_soc_dapm_supply;
> >> -	(*widget)->reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
> >> -	(*widget)->mask = GENMASK(control->nbits - 1, 0);
> >> +	(*widget)->reg = SND_SOC_NOPM;
> >> +	(*widget)->mask = 0;
> > 
> > Hmm... yeah I am really sorry I totally overlooked this. Yeah we
> > should leave the write outside the helper it is much nicer to
> > have DAPM do it.
> 
> Not following that comment, there are quite a few codecs that
> trap a DAPM event, do a regmap_write then wait with a loop,
> see e.g. rt722_sdca_pde47_event

If you have a good reason to do the write manually you can
(typically because it needs sequencing with other writes), but
generally if the DAPM widget can do the write its better to do it
that way. Just cleaner.

Apologies totally my bad on this I should have realised the
implications of this change the first time.

> I haven't seen DAPM deal directly with the write?
> what am I missing?

That is what is happening in the above code setting the
reg/mask/on_val/off_val, DAPM uses that information to do the
register write.

Thanks,
Charles
