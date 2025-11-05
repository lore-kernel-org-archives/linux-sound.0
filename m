Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7FC221578
	for <linux-sound@vger.kernel.org>; Wed,  5 Nov 2025 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762355280; cv=fail; b=iyPsYE+Gv1O+GFQQ4J0a2Tbnw4Xm1rleG3azQZwrv8ckdN/vNTUIdhLiks6mfqH1Nr+vvgOe6H91vOUd7fjMMlF1CyG1dV79plM+Yym3N8W8bDpB+34K18hecJXWA58NDRjRPj6eLHaQYU9WxbnYa1TDm0G1ctN9ArQ2C8upQ8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762355280; c=relaxed/simple;
	bh=f3wtLc+ovYKGP2/ASbUkleTfpQLZKibZB7IlilGkNjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKnclNAjviHK7+mjGEs9NX/Z2pEjI5Dlyw8W/varFKH4O0/iAsaYGaxqpAdebxGXaXrCcqdJZaUgiUEVRzpmySyz0EgmBvqQRLjBcKfklBKoBK6AAAJmf6vcFHvMS3+FgT+f8ST/Hel5WMN/DcUfYS0gZl3RYhYbZaZ5N5H9XUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Xzt8ES41; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lfE1x4OG; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Xzt8ES41";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lfE1x4OG"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4NA9um3342095;
	Wed, 5 Nov 2025 09:07:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=18K8I0H36pV9MBebDE
	X4maS5JwgDLiI5iQZSHT25T/A=; b=Xzt8ES41Q38ZnFcR5yon6XT6YhmbF2XqyE
	+zAVl6VYELGaK7U6d947kRP0l0ntpE4VFoLgglcf2DIabWdsGaJ7h3AwDDEcUbxU
	MuEJL8a5QX+vPKZ7YZnNUVN9olvq7v33VmGvGeqQeJVRWnAPtsKaVkZZKBihMbrL
	BLDFju/dxGINZcZWtRD0rLtlNc8nNaRpl79F0LCTOwceo3/LUK56yyUEbk9UFmF6
	W0a+ek9AKCDlWCcqq8Jno0jEJ/wQTC1NjzJDemdh/IE5DnxFllOtXQ1w+lbeOBBx
	DWXFGqV12kTZHHAVwWLw3ZXchTs0H5uul88r+kVE5+642HyjeZmw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021079.outbound.protection.outlook.com [40.93.194.79])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a7bwx223g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 09:07:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfG4O4wvktgoX5f4m4KI2UGnaG5TLfmDLSQOU8q+7GP6w5sbeb+6Y1DHAFEedgUF1y7iAtWWukWm9Gkjj7qETnZ8J5iQCtQk49QzTKFPw7pIQkMOTQf7Kv53TydS0bII5clP7XFNHwAD0CKU55WptCH2eH27FnZll0jqy5nVpDTjb+3ktBsG69IU5tE+kGoaZyXrb03Cw32ZGzQ+sHzECvMbjsmXjLfYoI22QEQTP2HiepHpI3ByebKN9EhQEtSNwIQJBIR9sByWRm2+D8eRLiJrqvvBfR401uSBaakYFQlg29QSa4vHP5D61up58qHJ0uvCdIon0JZNG0QcTpUwuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18K8I0H36pV9MBebDEX4maS5JwgDLiI5iQZSHT25T/A=;
 b=wl3QgERZ76DDgjlBfB5yjhQdNuIewZ+UhBuJPZzPIfp7ynWu6ok7/oYJD/9GrcYzknA0uFWRMcKCQ1gCldLky3Vq6TiCJOzYWVMt0QDngjwVXh6PgK6rDBOdU5qsuvHryobgF9LrKXQ76RmxlxDE9XfFzU0FDUcaBsySHVq1i+Dc8tC/1qUjQTNKXn9aSPxNP/5K8xd/PbenmmqsqtMF8fJT+X8YoW/4wGn31RmPdRZOXTHuZAfQvK8+WVtKARDyBe4qj+FJGY4y0KyRISqmKmKhm0imHqcq3El6JWzrtpb8xaU4GGsjBdS4tDD1fveQxSDbkrGwTi9C+bgSDlaAyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18K8I0H36pV9MBebDEX4maS5JwgDLiI5iQZSHT25T/A=;
 b=lfE1x4OGTXo1S5wshifsSRO1eouHIDaptnIpjJK6UIsEozru4PlcqOOZZpAjuRmbdX8OrD0xT48Jd0YlGjkUEqZem6TMOO1YNCZ335hohUvN16WqBQLh8iz3/N9psAEpsO0nIE1PAXQfvA2svpmemXvLH2pHHhroCe+8ALYSt7g=
Received: from SA9PR10CA0009.namprd10.prod.outlook.com (2603:10b6:806:a7::14)
 by SJ0PR19MB6583.namprd19.prod.outlook.com (2603:10b6:a03:47e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 15:07:07 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:a7:cafe::46) by SA9PR10CA0009.outlook.office365.com
 (2603:10b6:806:a7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Wed, 5
 Nov 2025 15:07:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Wed, 5 Nov 2025 15:07:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CCB11406540;
	Wed,  5 Nov 2025 15:07:04 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B5A18820257;
	Wed,  5 Nov 2025 15:07:04 +0000 (UTC)
Date: Wed, 5 Nov 2025 15:07:03 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 04/13] ASoC: SDCA: Correct FDL locking with
 scoped_guard
Message-ID: <aQtoF5Jq/F962kvw@opensource.cirrus.com>
References: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
 <20251103150808.4015208-5-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103150808.4015208-5-ckeepax@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|SJ0PR19MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a03716b-dd34-4516-4c73-08de1c7cfc35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B+uCrDtN7T2UdAy1X+fMbfuinvNcRLVIOfghiaYuWI42bVtKFlYnn19S7SCI?=
 =?us-ascii?Q?eE7LIAm/oyoVpHn5JCRMocYMIlWl5baAIql1Meh+gRMR9ztRawupJAkLZRSM?=
 =?us-ascii?Q?sMajog9FJ1DZrxKEPjshk1qN/XKXg7j2Rh0J0acSMgYOBc0kLPVxkIEcQ7h/?=
 =?us-ascii?Q?w5McBm8kemQv3ViwBpJovF1zlTQ62hVnI5s+mkgi4IWlUlSTKSQIHby4tVg5?=
 =?us-ascii?Q?gB/U69wdDAGK9TPHqhvWENUSHK3n2M3UZ7SFZG00UF3c+y8DGBPIk4msssF+?=
 =?us-ascii?Q?WdXlNSHjBd0Wf5HPbjJgxnaK0cdYsJIe+Pulr4QeqGbOD4QcJ3xJmNIwtFXK?=
 =?us-ascii?Q?uY1tysF4GHIzjr3J3oWGVVH6/DIo9H90Qa+3IeEGDUoy60XLSHw3/zsgtWvU?=
 =?us-ascii?Q?5dH46vgWV/69EremcjI1xCytYhFzyDI6aDwY5SB2jHe9vIDeuJmzAGfEVkvm?=
 =?us-ascii?Q?EN3Z7XdcXMr27kkX8KwuTYyZ8IeocuZsrx3E5+c4N/8QFWyTyP3PQ3hxRbIl?=
 =?us-ascii?Q?qtQ2I+F9I4m3LQ9ImsW55SDSNpCdOxxgyvC2x3LWkWw4sHOzh6guuttMMVEp?=
 =?us-ascii?Q?NA4Z66xKuuICugsFEmNi3tSUGnGNsmkpI6COl/b7NkgoAbe488bASsS6wCu1?=
 =?us-ascii?Q?HAGapgbFfb9BR4Bpf46+WO5IfeZynDZRvfj0QgQR5W6qhflQ/8+Nxj22cALL?=
 =?us-ascii?Q?eObLD7+T1I2EuDe+QuS0QYe5W+uM5xDoQyUCfkA8WvRgjPJk8JfAW6RdXw9f?=
 =?us-ascii?Q?HcMpywxyURbW9AiJKRgUqrNzYZkzoMoniV7dVlr3I4/OnIcrggYiQcERY/5L?=
 =?us-ascii?Q?JGKYP2wfjL9I6CXx7VdcMyoOertN5u6ZLGZBJO3XaOstusJfQpoUcuoqUr6o?=
 =?us-ascii?Q?hlpSGYNWazo/khIJiHFVwpSjkIkqO2GxAyZ54hqzRwr60M4ZEUoN96542psS?=
 =?us-ascii?Q?hyVAcewwxs8IZuR3Gz95/FABOcvas0nJTdAG3t6KlHnZSjR8fpqHXrhA8FYK?=
 =?us-ascii?Q?gTBd1lYUWpjiHL77T0MlYzx4tqly440M4LbDYfKwp93fGvshOxz1kUghGxSR?=
 =?us-ascii?Q?A5uUSamS2MznHEI+6B2ip5q5cztPdyp652OC/cfZGXlntqYog1n2vo/XnAfB?=
 =?us-ascii?Q?hrcNpnMdvz7iqeVnGo3UOaSjEf4MIDYmwjaKBTegLsdQ2EPTJenPexcS5w01?=
 =?us-ascii?Q?hMypSG4A7rjujy///CH9YVFRO7J9Uuzg3xzBiCpeCFFft9G0nD0BzrkZmiiJ?=
 =?us-ascii?Q?IT9q7r8qIvW/8LIdE1DuUN+p0QxPwJ0rV4FnSPhTSTHugcNmSbj+SJZrK3X+?=
 =?us-ascii?Q?jvHxy072GqxhSw06WmVDi72JN73/VxxP07d1uIdSWz/3gwektuYu+KCVfpu6?=
 =?us-ascii?Q?SLIVfeJly151tYN+Utzgf0rkWx/GY75a7NAU4b8W4wFfPhT+qscoslY+0iSe?=
 =?us-ascii?Q?5USD1m5rsBQ7gUGre/Lm3atbeNU/o9uU6h+Y8K2RL5x+xSCzhCmsD0+wcQaF?=
 =?us-ascii?Q?kJLofFnW+4t3sGhS/5Yusqqjt/5ihi038QvYtoq1nPJkqnzBiI/nxQxi2QIG?=
 =?us-ascii?Q?0fTSeX5Wc5qD+h/NB/k=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:07:06.3180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a03716b-dd34-4516-4c73-08de1c7cfc35
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6583
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDExNCBTYWx0ZWRfX42K+Sr71WYSs
 SxjpGDiEhD1lUEm3H/SjbzSZnJfFxE/3T3vGzj55HfWMlG3/qcBInhlQvUeimTUrrqPoDIxhwI8
 bwL+TEkee91fbpoFAAWpxJuakBeR7c6ANSZXKN/PfJJkPCqOXdTF94G/hpVuOiKHoqevhEicnxp
 9S5D+3ue0vF9Z6yee3vIwU/DZ9IH4Wx3vvyFYfyDZQDYPylCbOLheh7L9gnXs96zGNY2Z4wg7TV
 T+RSJXPymItTDWHIlkgDuprC1vOmS5sTHDeHBcuzcN8gnonXBHTbtyg31xCr1oonq/agsWX/dnK
 JCe5fwj2+d7rfaT9rgTzdQIFupAewJiy1uZda3QQteppzUwc44trBgwXTmP9JBZzOKk8tvMoYMl
 7sDcB6+/SLcwia7Frh9GUif10BRjwA==
X-Proofpoint-ORIG-GUID: OxNb4o3u8Sr7azlMDriNr_BIfbTzdzmw
X-Proofpoint-GUID: OxNb4o3u8Sr7azlMDriNr_BIfbTzdzmw
X-Authority-Analysis: v=2.4 cv=FpcIPmrq c=1 sm=1 tr=0 ts=690b681f cx=c_pps
 a=ic/V0UXtXsqqvJ1es2EIKg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=B_PX9PRX2mcJYVxBFywA:9
 a=CjuIK1q_8ugA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

On Mon, Nov 03, 2025 at 03:07:59PM +0000, Charles Keepax wrote:
> The current locking in sdca_fdl_process() locks over
> sdca_ump_cancel_timeout() and the timeout work function takes the same
> lock, this can lead to a deadlock if the work runs as part of the
> cancel. To fix this use scoped_guard and move the cancel timeout to be
> outside the lock.
> 
> Fixes: e92e25f77748 ("ASoC: SDCA: Add UMP timeout handling for FDL")
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> New since v1.
> 
>  sound/soc/sdca/sdca_fdl.c | 90 ++++++++++++++++++++-------------------
>  1 file changed, 46 insertions(+), 44 deletions(-)
> 
> diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
> index cb79dc3131b82..fe0ef2df4d9eb 100644
> --- a/sound/soc/sdca/sdca_fdl.c
> +++ b/sound/soc/sdca/sdca_fdl.c
> @@ -402,8 +402,6 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
>  	unsigned int reg, status;
>  	int response, ret;
>  
> -	guard(mutex)(&fdl_state->lock);
> -
>  	ret = sdca_ump_get_owner_host(dev, interrupt->function_regmap,
>  				      interrupt->function, interrupt->entity,
>  				      interrupt->control);
> @@ -412,56 +410,60 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
>  
>  	sdca_ump_cancel_timeout(&fdl_state->timeout);
>  
> -	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
> -			   SDCA_CTL_XU_FDL_STATUS, 0);
> -	ret = regmap_read(interrupt->function_regmap, reg, &status);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to read FDL status: %d\n", ret);
> -		return ret;
> -	}
> +	scoped_guard(mutex, &fdl_state->lock) {

My esteemed colleague Maciej has pointed out (off list) we can
just move the guard down rather than switching to scoped_guard
since the whole reset of the function is covered. This makes the
patch much nicer so I will respin for that soon.

Thanks,
Charles
