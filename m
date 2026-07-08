Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C2F435A83;
	Wed,  8 Jul 2026 12:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512874; cv=fail; b=De2aexfBezLqdSLc2dDs1pn+UGyFt3f/doU2P8mxQG53KmBeOic/uq0Xm5wpDdE95I6e6B2fNTveGMNodmjnbmw30T0OkHNsyxFq2PE18/5n536X39az1zFP8cuHVxvfNVzH01ww8/1kuIgCJSRUMfGzeeLP2ed2TQtK0L8S39c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512874; c=relaxed/simple;
	bh=CsTAgptBmoIrBSFAj88JRXIZZDuKc4bmvfsDhE8icCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivM7zvaCdpvCMR7dQAMsVgAJzeI0IfCOXFKHbCFvfislfZ9bWGs9GOVNZ2WHKVNTzm/N4oxtzsFJxC9BO94oR/DnWb4iX+ZphtJFWvmHUNEQ271HkQ+ySFDGl8w79hPkKNYn69Z0Pv7Qibbt3vwzd27zTPGPue+GicU1wMZ0C5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GdN8G+dv; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=A8tGPN1B reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GdN8G+dv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="A8tGPN1B"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6684tBtR1640144;
	Wed, 8 Jul 2026 07:14:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=te7EbLb9BA3oC+3hNLrpd3dOn6P0tddh1HsciJPcNfk=; b=
	GdN8G+dvArDp4YfwHeBgD6mNaq0FxOwYZZe1UDZXBr+CyH7Q6MsngbTKZr9QoflN
	DFsyj7HOSw7aGRU/piA5zBVWfIy2j0tPBEjRdmLIjmIW322XJbq9IUgrfkBwP6WK
	2SSxqKxO5xzgfnSNzcxl7vRc8pzELZf9zAcHbnQuqOZ/IF1O8mItAwbxy90zNSQb
	XNYE8mW3UIObJksfK/Kz5tW6g/m97UhxEs3jtaC+p5qhJds/EmgTrbfwXeqA8S0p
	hBeBtK6pmg8btMBeJJg5fsettcmOVkVrQ0EcP0kR7MdQwLcReAgo2b3kMBL9L/iP
	WwQ/7KLhA+junOV3Kh8rSA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022142.outbound.protection.outlook.com [52.101.43.142])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjp6ae-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 07:14:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRaqKhcfCxjqVVP7sN2HZniOfYuvhqtiPX3fpBnzVGYVjeoZjzBVC5E1BBARNcEU72nBUzI863u5znbtw4QXOz7Elp/qrHYdUlzvm+87e+m4vKLOG6oLxiFH6O4dGExbtzqcQQIN9iZy9YaoxfLDEp9q1eSii3l1NQ0PzCeX1fEPze/AmaewSsfKwvlQhHaUYmsaEfsFjaJ6mYqv5ZejEIZ/rBtMVW++sWQ+l8B8E2+HEPqRCv3rU9MjBnR/7W1tm7A83qF1dywK7fNR5VtsIyCHI8iqUxRwOS9jNyFXc3grXFMtKrhHbAkxkuhYcEMvVw4J+Y++Hh4NA99/6RVFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYYjrxddVRmKVT72cxR0Ro2YY6QJ9n2D7UwJQ/zRqa4=;
 b=H2nHNE4CGp87ifd591xZwVAGnoY31PZ3RYujdJOjrUUvD2xBRmr/U2qze71LRi2ZHONnEGiYn65B22oVDqygscK0isse6vc6TeymDErv8bWLdi3hEUGceAVWvlvBgxynP0y1XL5Kx0rCguBc/BY126Kg9KbOTWN3San7doaZNuaSQMKElbOMu0d6VOYT+BItI+jarNwL2RIi/30KEOCuk8DOVtjZxoG+sKjtQbjmD6HS95Rq8juJQhECi9IAPEPPB1M3za8IMsUFwGuS3nLRx/cZFQWyP/a5x9Rwx19S81+tk+x/3FELORktY2PLLtMBFLc3G4p5dDJhkHB6Mf0KIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYYjrxddVRmKVT72cxR0Ro2YY6QJ9n2D7UwJQ/zRqa4=;
 b=A8tGPN1BNvMRBD3HU5/W9G9Pib+g5Z/9cT/UJCsPVDXFvcHD+BHd8mabZa+624bAXrh/TNImJ6xczq1ur8eSIRU4dtRf166erCn50XgWQpH6IrtE/xqg1Gwj6dz6XQzHTCnqxej3FB6/QdX3XqXdzvTTLz3N2LCNOHezqrZpoCY=
Received: from BL1PR13CA0193.namprd13.prod.outlook.com (2603:10b6:208:2be::18)
 by BLAPR19MB4274.namprd19.prod.outlook.com (2603:10b6:208:27a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 12:14:06 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::7d) by BL1PR13CA0193.outlook.office365.com
 (2603:10b6:208:2be::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Wed, 8
 Jul 2026 12:14:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 12:14:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B0B53406541;
	Wed,  8 Jul 2026 12:14:04 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9E49482025A;
	Wed,  8 Jul 2026 12:14:04 +0000 (UTC)
Date: Wed, 8 Jul 2026 13:14:03 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Fred Treven <fred.treven@cirrus.com>,
        Ben Bright <ben.bright@cirrus.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Colin Foster <colin.foster@in-advantage.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        patches@opensource.cirrus.com, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 17/23] mfd: Use named initializers for arrays of
 spi_device_id
Message-ID: <ak4/C9MGcGa/FC0F@opensource.cirrus.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <005f42dc5bbbd8879edd7fb3cbd62d6ebe38f39f.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <005f42dc5bbbd8879edd7fb3cbd62d6ebe38f39f.1783507945.git.u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|BLAPR19MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c66d69-cff4-4099-e5a8-08dedcea6855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|7416014|36860700016|61400799027|5023799004|56012099006|4143699003|11063799006|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2ji0UCxmV4VTnNXDLv2qsmBS4V66WSfYjDGQ+Tg9l1wRfSpBz+qnCnbMUtgOAh4uFmimLi5WC+LrUlVklCqFn+FXkCrTUIb2k/nQFal7DQxAy2bMahpQ2kDAz4kWRlDb4KTuiDhISO44RIYw9KYhqe3Ua6gDppjNtkHz/u2NLEB5/hB7zB+ET1la0ax16h1tCSErT9taCbdfRM6OAcql3TtWn4O9YQDqUJJL7eX6DCtHzpUHXxW5xhPPLDWwgM0uQJrGp70rMufdGN0YK4J4DwYARtjQ3ifoUOm3PNkwnUPqhagb9pYHAFzWeNTaHeYdo1jp1l42bY/AluHSOfehJtWbZpTIkXjbua0yrQOfKdBh9WGRVrPg/FNdOT9frWvAS/on4SaZ78Ju2MPusw6EoDVapTXKBYQKxnqJc9kXpzqhBJdgUy9A0xI+DznpokDXc+hu4k53qZERM6Hw3SJipMm/NZEHTw3Viv02Y1/geM2vRghLx9lr1+f4tB/Jw7fazcwTUx2iea1Q+F6toyOxAwe46jM+T9VbOoP1IV2ovR5njpSMyfKibiISd0W6mKDjjVMl7BsHj/luEGegOAPgc/vxBdSSGf0Gd9uBPbHmD60SSS/RjU2qylvrz7puxV/9CGxuz+o8/ZoIVloc2RrFefIzaOZX6yjC7qp8aEqhWXRRTs7VQjOhw1qLBSH6VUl/ZwqYcap455l7uLZHg0rHZA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(7416014)(36860700016)(61400799027)(5023799004)(56012099006)(4143699003)(11063799006)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MTzb3D/jFuhI7IKH2oNXLyzdkYQVTh5rsRIlossPJy+IPujUp4QcxOm901Ca8+YtUBFi8fg5LzP4PR/8OWmb2/rCQDH2E1kgFpatP1wv/GDpPL6EroLIAsb+VE9+Hyi0keZ2W9f25OARw/gMpIC2YjlSC2kNtR8pNsvcOMu5rnb4TkgbLz3BnbYGWdH6uy/gbU6VVRcjUoT7HjS73UL27r16tHjMY4MMSNCeScErmn6waxlAh+uxkzsVnGCuQdB0/fqQMv+hrH/IN0fak0UDkkq861SLytqxO4/z//6Msox2VFx1x52CQjMaVjSp9WSh8SaLdefOj9No7Bvco2c2e+ZylOavXSmPV94c2VM8fEKvY7bhYdkjtmkXdJ/X166n6FGVFs/V3gbVbWjberQ3hCcldi6Hsw/IpKSoJLGcOjB7lZOaxRyUUqPxgum0wc+2
X-Exchange-RoutingPolicyChecked:
	a/8lq3kjBZkjkGu65fsTYHdEZD2JvCfRhm+7ckrYHnT1r70Ejvi+rUGcGS/VMuJO3QqnNq68gY29LLZP/TChLUc01CGVwEVKQWCsctWydwwIANbZG2q+HCibydCwpoFjTpvw99ALr3CrsyULBQIJ76jZ/OWr9aPOncu/QzqneVGtugEck8w4Da7EqqQZNIr6+VzBga/Gq1ZNCEWel0MQ8JDhwyOoU4GmBvKbyUGgdgdbSp1NsYpcR/AeaGwFdeIIemQBS3Ucw3ekLLo250OhMBbFIDD/TMtiRPL/GUJnk3irNYAKfrQxL8zDBQjTQHvIM+IZnJbzMwNdkpcWrWQKkQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 12:14:06.2054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c66d69-cff4-4099-e5a8-08dedcea6855
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4274
X-Proofpoint-ORIG-GUID: D0Xg9GUYER2VClQVrpnnULGVSarjfMqs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExOSBTYWx0ZWRfX+RJQdCOuGbio
 +9Xx+rZZcq+TM1Z5UoHy31g9wGOX5ZOq+mANd+PyaMZTTh8PbtaeMm3SEPWliXXdSUPtPuPsUxU
 4c29EAnXdKr16vw9P+OxxmP6fMbM9XA=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4e3f12 cx=c_pps
 a=BvJXZHzsSGOlYntt73USfg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=IpJZQVW2AAAA:8 a=w1d2syhTAAAA:8 a=DbYNsBR8Dkk3uGWwsP0A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExOSBTYWx0ZWRfX/9Em2V2VxGgY
 zyIrh9H/5RHaPKUy4hI8QBxGpw8DJHyZYy8OZ77Sp8UuS0iRolZj0sR4ekCSUjnhR/2R9/k8jQy
 VcZJhsN6DBhQE89ljxYScTTDGBRLKjF/XWVX4GG48bAE+wnhz2aHWn2WoUvSqIg+hA+DqSgQ88K
 R5Q04kPfWVOqlft1hsJF7N/4KN1CQXfPsaK3pFOT/MLGg27/j5A5sa6J09JpoZ4IC7oW3acpJM9
 iL002PTrh8lAVCjLmgV36Okhnntcapc7Eq91mRdiPTyPROATKXW4gaae9zg2Tb2j2Xvd0UsS87o
 OEjbWf/R20uhz2Q40WXDQ7MOGuNc1SlZXACRp/Fiefqcn4Cf6PFZ9tYfgl4fR9GGXq7GXGtSdrv
 RFqXPvDsj8r3efNWrlNs3eUQhEcBjuS/PA8L7aehg0aPxyLjSGmFyFrix/5Ys8WCeipQoQxOD3c
 CaOIOZ8iV6sX3bJWSVg==
X-Proofpoint-GUID: D0Xg9GUYER2VClQVrpnnULGVSarjfMqs
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 08, 2026 at 01:15:24PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> spi_device_id that replaces .driver_data by an anonymous union.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>  drivers/mfd/arizona-spi.c       | 10 +++++-----
>  drivers/mfd/cs40l50-spi.c       |  2 +-
>  drivers/mfd/madera-spi.c        | 18 +++++++++---------
>  drivers/mfd/wm831x-spi.c        | 14 +++++++-------

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
