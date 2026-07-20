Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6EA3264DC;
	Mon, 20 Jul 2026 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557885; cv=fail; b=YdMj5p5nrKYMYuTB8YKIS+VVJwrxa4rUJ8ggeU/qigiGGiQl0Ik3oYjLGLxvHTq1jqlD/tCQXiUBx5kWwPrV3g7Y/9v/P+8giU4cWYUHGEfNJ9bhUFh2lyqSfkjA+vhUUie8ev0xVU+H43e8DZKJ92xTchQcyOGN3x+ENqolbSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557885; c=relaxed/simple;
	bh=Ea3IJvlZsVz6qDjyC6XgOZqBXstfrS7e4YcUm7ysh5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkNYzC9WqTAjhcz5jt4n4IdhlOg93P9bF55ZqBgEmMvzr4beCYWzPWk2RCqN+PVdpdIRTvFqmLPixSFKcnESuP1XvouThplpIlHO+CBcPIu42qc2KHJpzFRUPUTFRb4mDKR34fpV+l6Q32pdYQjtvjQM+nmfia8cz60p0eQj3Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WWwS0zGt; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ycF4uL2u; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WWwS0zGt";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ycF4uL2u"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KBic222126526;
	Mon, 20 Jul 2026 09:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=vSznAx7Ym2aVhQa9dP
	tv3H9veGbVikd+/DR/gAWV36k=; b=WWwS0zGt+KHzHmMwUscJd1/BH1K/IY9wAR
	XCtf3pgg/Dw073iUMDo/k3LZki0Z3xYYu86b87FcGx5CmvUr/ENizgcaKnOTf2JE
	W/weep1ajeImWqkaB6Kr6POFZrqJa7/NLrjq0wieb6qWm5LD79EG9i4FrXbo+yLD
	zI2jn1Up8GPMwa4H71RGDkxqma2VgGgQPGU8HnxBixzyICkLifrCTPwH2SxMAli1
	L4aDBubGLME60vNElRAbXR1rzswNfuG2MVz+gViJ5WBFukpSgA1H1ZeOArt/tnNk
	UkGqZ6N05hcNhAliHdnsZfMneHADQYo/cCXUL41ZgHXbDBEztESA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022092.outbound.protection.outlook.com [40.107.200.92])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfah7h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 09:31:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmqZd6SzQsMjTY+X39Mvy5j79ZX0ele5u9iPMvmtShb8U0mYVj/w8gnNvuDg1Nmdjn2KEoxBGXYL7DZ9q0v39zIJ667aVVP2rg2amxSsKRFMDGkb9g2tj36kWYBQ994/yEUWBVDY1HnQfle4I++surbTgglz37xjYR5nkuBT/RdWbTSju1GMRX3y7azNOge9Mqip2GYy7+G6Xq/2u3r+nOazw2TiLDksWbuyNBiFOK1AScjRPpsej+xFKqXJcjBz6imT+yyRnYUtp9+E/FXhLMTLEMi0Irxp82K80UhdwsCA4I4jXCtt5zufDyb99j4xqb2IqlirH6zqU2lI5p6k1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSznAx7Ym2aVhQa9dPtv3H9veGbVikd+/DR/gAWV36k=;
 b=unWayilxZ0QKFanVKSDoDgrwPUBfDTA6FN2LU8KHLQcLSrVm/p0/xv5iiuH2s1dKqtLZyOqABFEefov5NA9SqnKmOdUunic+EioQr26kkMhP2dG7nd9BXUZd95IkqF9n5+JgCgAmPzYNlEUQxRSgGxomjx/1aKzjBC66Rtf1K0+Cl4fcmDdoz7PhkBm83TPtRw42oiMe+3vJQJKpkRQVO55GnsUq+8R3V4B2qMerzX0FjdtZulJXi9GBD7Ql0IWuBHHzjyz87rWbshwv6Ja7+RafA5PCP8BqVgmfym8cKss0XKm5T5n52YAgzeaJ6F7Fj5kNFQvVj7p5HUdk59ygUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSznAx7Ym2aVhQa9dPtv3H9veGbVikd+/DR/gAWV36k=;
 b=ycF4uL2uDaxvWkWxHxmCjglsFN9e4mIkJomtrN5WDYlCr2DNGUYbDl56xqxzQz1E5DDWSg+ZtwqCR/Bzz4lVXhQESNIEuXbo1D+RayNAdGZ50oQRRXSDUncZQYwGInDAjgSFcnWpiTbMcqazb+kuejciE/xDNqjH7aYKxV3GV68=
Received: from BL1PR13CA0023.namprd13.prod.outlook.com (2603:10b6:208:256::28)
 by IA1PR19MB7232.namprd19.prod.outlook.com (2603:10b6:208:42b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 14:31:08 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::7d) by BL1PR13CA0023.outlook.office365.com
 (2603:10b6:208:256::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.9 via Frontend Transport; Mon, 20
 Jul 2026 14:31:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Mon, 20 Jul 2026 14:31:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 94CC4406541;
	Mon, 20 Jul 2026 14:31:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7DA2E820244;
	Mon, 20 Jul 2026 14:31:06 +0000 (UTC)
Date: Mon, 20 Jul 2026 15:31:05 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v3 2/4] ASoC: SDCA: Populate IRQ data earlier
Message-ID: <al4xKTNo9+Zm96IM@opensource.cirrus.com>
References: <20260716142639.2306757-1-ckeepax@opensource.cirrus.com>
 <20260716142639.2306757-3-ckeepax@opensource.cirrus.com>
 <5eb4f715-4bbc-4dd7-94b2-6968b1dcd273@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5eb4f715-4bbc-4dd7-94b2-6968b1dcd273@sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|IA1PR19MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: b19cca51-f075-4030-66e4-08dee66b8981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|61400799027|11063799006|4143699003|10067099003|5023799004|56012099006|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	GC0PLBG92/C1j7vaLkLIK62+aBD/NEsXq0twlkcNZPG0oFmsaGy7burTPCAz4eYcZajy4/fjovEcPrgbRRasC7hzVGgSDplITmxhq7xgRz3T1Pi7kTDEzeWEIiPqI4YePjiZ0wrwelvMW8XT1DRkzWydBWlMCVzytLjNsUOqAULw9Fk7XfxY6I/B0bhY7YljF0Jx43Tm+5iSKN8MHnjopglrCwyWtbeyZ+2K73sPaiZSbByiDvLIe3WL+eoHcS2IZm8u5HVhkksOLxds8fhajbBVS4EQxbjIA4GgcLrEF5Hd766BqlyM44lu+ja7a8GZM3mKHijWjadmTzAHO41AezWfdG4byPtNbahRCDi1hWoYdzotjTqO8ZfZtfDQrAJRJ/+EyV20wwit8bgt8xbZqC2hlgGBThjTNASEGKKJEXaWX9AiN1dBBoX0pV8bQPq67hVv6d8mKRfpIP7L7LG3ZcYt8xgKVlt+zZnY0LLpGw5yPro/bJ2v6yBSZBgfUhcgWmoLhB6NwLP9uN/XI9O1H18iJ1S0xqrwmIXiEghSoqAS0bDbo+lgtx6QVMti14zZLOh/8Pgads9R+5KvF2lWA6xqwBTlm2Ud74EVqnWWyXC5rvjPFD6gwJ2qvb+MAitRvTg2FFha3jzL8nFeEI+CVipMXS3lRwU1/QPXtZDmjR+PM+OHtCQoaf79/K2ptHolYXoc+B9d94oc8jc3YW+/tg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(61400799027)(11063799006)(4143699003)(10067099003)(5023799004)(56012099006)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1b3IdJyePZZCM9IBOwzySGvgm30def4waZEoWozcbs/INaHa7hg+7cZpMB+rtMcngCu58yIYuAlwtxHlI2vHDjCIVzDbsAE7Rv4LxlQ/KVei+cs9sjh2MhsNlkDsZNKPKdQ505V0WmUisfBKmlvgtIZ9eJV68HHT/uuLMvQtqKb2SiICQmRkzp54kJeBiIW6nrXdJAMIGkXJtrbLcLaFh/2Kg9rK69RF4wPvrITsfq1B/bg8XcSsbn+f3R5Upk+ePQfikcB1dnAEtlJZhaYOZ5YMQQ6drziUqLDCPDUQhUKNn4vSZzzW0ZLmNEzjRAJjd7rp1RC0gv8/MfzhlvHRsC1V07Ywt2amtNwRE7XappNIG3GK2Xt+Yakz5IbRptsTRFOMLiCPAnuTxflwNsqS+ntLDrRDV9EHcs+vSGuNxQ+oYewQUHBpamHf9XyIkRp3
X-Exchange-RoutingPolicyChecked:
	OqqnH+dfXeIYpZTDucADHvJTOKAeHVbfDvkNqYKYYqt/YF3WpExT/ulJQaNgVO5TycZJIi27hBRe5L6Cj64lSSucJ1xMloyWuY7m6iYoLizZmn+M8Oe3jQocMVOrNzOHZuIeawLU7a3jV/80TDa/1jpEnRlnhFdnFF2pvvOwN7uodxzV6r6w9nFsrRXDHOIwbrW8/BL2JOOISaXXXNmkJjgytpCax/N0ojzCUpwr4oqkxmQvy3dcf5s1phFvYF9il9cuwrOqdhvLuUA9RGg6FRLZ2SPPYVjSEzt8ZXVuF+51oDmvYIdkAldX6OFIJ6BRbNvy1eFzZwEJy0cgtnbt5Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:31:07.3590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b19cca51-f075-4030-66e4-08dee66b8981
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7232
X-Proofpoint-ORIG-GUID: s6GrqP0tK82Yb-605wIOirbmj_rQbfXt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MSBTYWx0ZWRfXzBIiEe2jc0Pg
 BJPdrkMwkzFrE4oqmMj8stgd4BE3w/1o6NH67HcKsBSv/IS5LYD5/vUwKA2QM3wI1NnZoVrpbgN
 wM0igH64+HbtA1nW+Nb/PC7o7QFDs5c=
X-Proofpoint-GUID: s6GrqP0tK82Yb-605wIOirbmj_rQbfXt
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a5e3131 cx=c_pps
 a=GQpUduAn5o7mR2pN+hR1ig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=Z-Euk2mSP-vIHyKPnV0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MSBTYWx0ZWRfX2kE+7MJceQDw
 S8Ac5utnHjJic/6OdZl7U/mcZru4ExUqBhPCHUD5VrJ9Rrei4KucG1FwZNDLqBMvpPjbyd6+Uvd
 swE9JXlpuGFCvvxVnmK3S/Uynv+Y0NQaBYz10IgsnqCK0ReDp1lwn8PkZrrW9bITPnN8cM9J1Xa
 iSl0Sx1NpNDyLTkIDkCv5jRR9MfMU2oUddvOUAPSP2Edkxrj+UYFcq3NgKul495H6PtlDzQzJsN
 f5h0KwvMfYf/1GL1N73OoLiew+yEMmArw7VHC4yJPG9vrcyMHhMYTnf8D7SbQcMLC3kAAZXey+v
 IfvpuNfsY3ZwibXpKJO/ScD/zDcRhom1txdtLRnrUXcGKLN/rzgGYsQo974V7LkOptKBzz6ClAz
 Uv7cNOuMiOrGJbRe2MtPeT/lpk/oCR30MpnWaTtbIbrxdw8+FI9G8kQIIhs3ONxt9WBedYcguag
 v7VvxDZiBKDpUNf9dvg==
X-Proofpoint-Spam-Reason: safe

On Sun, Jul 19, 2026 at 02:24:26PM +0100, Mark Brown wrote:
> On Thu, Jul 16, 2026 at 03:26:37PM +0100, Charles Keepax wrote:
> > Currently, the IRQ data (attached Entity/Control/etc) is populated
> > as the IRQ is requested. However, this can cause issues as
> > occasionally the setup process wants to access specifics of
> > an IRQ before the IRQ is actually enabled. To facilitate this
> > cache all the IRQ data during sdca_irq_populate_early() and make
> > sdca_irq_populate() simply request the outstanding IRQs. This
> > also has the advantage that sdca_irq_populate() can now just
> > iterate through the IRQ array which is much smaller/faster than
> > going through every Entity in the Function for Controls.
> 
> > --- a/sound/soc/sdca/sdca_interrupts.c
> > +++ b/sound/soc/sdca/sdca_interrupts.c
> > @@ -375,7 +375,7 @@ int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
> >  	if (!dev)
> >  		return -ENODEV;
> >  
> > -	name = kasprintf(GFP_KERNEL, "%s %s", entity->label, control->label);
> > +	name = devm_kasprintf(dev, GFP_KERNEL, "%s %s", entity->label, control->label);
> >  	if (!name)
> >  		return -ENOMEM;
> >  
> 
> Moving to devm_ makes me a bit nervous.

Moving to devm should be good here. The expectation is that
sdca_irq_populate_early() is called from device probe and this
moves all the allocations into there. Even before this series
we had devm_ allocations being done by sdca_fdl_alloc_state(),
so the requirement to call sdca_irq_populate_early() from device
probe already existed.

With the split of the cleanup into two steps though, we could
move everything onto manually allocations and clean them up there
if we felt this was a little too hidden behind the API? Or
document it more in the kernel doc I guess?

> > @@ -448,21 +448,34 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
> 
> > +			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
> > +				ret = sdca_jack_alloc_state(interrupt);
> >  				if (ret)
> >  					return ret;
> >  
> > +				interrupt->handler = detected_mode_handler;
> > +				break;
> 
> >  		      struct sdca_interrupt_info *info)
> > 
> 
> I'm a bit surprised there's no corresponding change in the cleanup path,
> we're moving the allocation to the device driver not the card but the
> card may be bound and unbound from the device.  Perhaps I'm missing
> something?

There is a sneaky:

-               kfree(interrupt->name);

At the bottom of the patch.

Thanks,
Charles
