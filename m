Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15BE30ACE5
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757338281; cv=fail; b=P7D0IlX2uzddt1xVSAwjzY4rcpwL3CifSZBVxYNiriBjEn6erPwkSDjZCasmxI0TqjyYvNPHFI7GQhEE+48VD1l9Ldu5RyKjyRR2rx8OEBm3eV+o3qaBG1b1NHIU+oJ7EWBDV9h9jGPvE1lLNwRsMNvTJA5TlMv2A0Miny1acg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757338281; c=relaxed/simple;
	bh=zZhwVnamnh1eQg+Lg4qbIiZTySofhC+qmuM2g0zTOiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6k4YUA2GvRb4a3gnzy5A+3TuOdRUElAk9mmvDFPpmd54MfF1ZW1Y0Wv8E/4bOLKFjzGjPn344UPHDWLITJap2mSvf47BQusUStxqYsB4dOX531iatwwGtPts43DJ8KaxikrRVCqLqiwBJFJOG94HvBuitZ1cfk4siBUNcN+N+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EIWLtjcQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dfJE+Qhm; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EIWLtjcQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dfJE+Qhm"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5888V5xi2152784;
	Mon, 8 Sep 2025 08:31:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=nhT8boqU3fbu+iJj9u
	pdotB57n95hKrhQtvN3Mt/6gA=; b=EIWLtjcQqKHgoq1plYeT/SuTvI3w1vFYVJ
	5lMhEox7PYyxHf3kxNBLiA06KkbVgBUiKZqbecqbeZ7VQ8wyut0Qb7t8Q6eLPEPd
	MNOBnQm6Kpj1GgD2RY4nXHBHQLZZg4MltfKcbXYUo6H/Fm/cgb5IufDLX4tR1s+8
	mJjUy1EwfqB5sj/lEwprmyF98WXJCCd1dVEUguyDsX6fDWvYU4xi/OCdogUE/RXC
	QLtM6vKECOesC5RSZpGWxqHvVbPmbowW9QmtylUbDM9hJNqgTSwOF5uqbFSs1Pke
	uIX398EYMNfCn0/ziULCG55xjSP42KUTwHT4CJgRydl/i7PyBdEg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2137.outbound.protection.outlook.com [40.107.244.137])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 491upq89x4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 08:31:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9HGazEyVF6c97Uycd8zu1uASHDEJjXbfSL0wrsmPM8WPSlvCGtJV5t1Gea+GRqRGpj9boXUoH8de3Wo0k7hxoOhF+ztCyLtxk+zx11hMYGfDJm/qBUwNWl+8Xvl5a0IjRxvbG2s95z/j9+/MYaKgMP3x+B8cn5v9SWbFjKr2jjKS+oaqpXjtC83LApQVgcbjrvIvCQsyD05Yd/4kjJ8g5yc4Oeq7hdI3e2QCZmZ8B0CaJ205MACl5RfcfjZ5LdEfqMK1g5nroNrrkQORC45Vrff+DYFmAjI5vTvdXsmUpg4kBczNQ21BjqunhSE8iICEMlIKHvfzoK+CPJm+xR85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhT8boqU3fbu+iJj9updotB57n95hKrhQtvN3Mt/6gA=;
 b=Bf8VFRs7vgVY0BH5At9bmuNlenSXnCu8sqyhn5TxbpX7Jf7xOY9XDVnQB0dgPVm3NXGdcpt+lX9ePh2Bsr6w0FxCqpn3Id/w64fuSRc6zZGUSmfNFUAqwYSpElzq8isy/6ihUpTPyehB7x5XFnD17mWJnXNp+rhQm6rXmJWspjfLmwf81mxiu/7BC1IB75Hkh46wy180O0kV9AGiabocp7kmPahcwxyVFrELkYfTetf9gzBTuIDVamZev/HQpdwLtfaBXCj/Indv1u56aWqyeKRItEZNyCZxZ6bpoAs2fHByAA/4EXqYfLkpFPXGLB5Su+pJpYXPicweZxsirCvVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhT8boqU3fbu+iJj9updotB57n95hKrhQtvN3Mt/6gA=;
 b=dfJE+QhmQhM+KY+I95VIrWsHllu/LCmwpXC7/fhOxFiSEAUI2grGR0U/wGBcyKnTa92gl5UOel7GTBCfUoQh08fl7VEULvlAbejDDsDTpm7gQY6oZ/KIVtOom+0RulSn514Ayd7dICbErhppDJy//bFt8WaShAjeFQIALeitK+Y=
Received: from BN9PR03CA0508.namprd03.prod.outlook.com (2603:10b6:408:130::33)
 by BY3PR19MB5107.namprd19.prod.outlook.com (2603:10b6:a03:36b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 13:31:05 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:130:cafe::d1) by BN9PR03CA0508.outlook.office365.com
 (2603:10b6:408:130::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 13:31:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.0
 via Frontend Transport; Mon, 8 Sep 2025 13:31:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2CF8D406540;
	Mon,  8 Sep 2025 13:31:02 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 157D1820247;
	Mon,  8 Sep 2025 13:31:02 +0000 (UTC)
Date: Mon, 8 Sep 2025 14:31:01 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 02/15] ASoC: SDCA: Add manual PM runtime gets to IRQ
 handlers
Message-ID: <aL7aldXtzWLYDTt/@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-3-ckeepax@opensource.cirrus.com>
 <f5716cc7-8971-43fc-a646-56a9353fbab5@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5716cc7-8971-43fc-a646-56a9353fbab5@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|BY3PR19MB5107:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6bbc32-efc0-491c-6018-08ddeedbf5b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AuHTGk3skzZcZxGLniBSkr8bjz/VfmUp3gbliHYqEW3oEcUxlECdJ8S5qeYF?=
 =?us-ascii?Q?zCjr+5XhciNacX6xSqKefgpv5dnUe54FeTwHArPQOKfZRU0mm4q47ADF1Bd1?=
 =?us-ascii?Q?PmxrrkeWduMwV5qQ5vo4QzdyhuDqUs3njm63QRGTu/AqjNuLWkCQ44o474kY?=
 =?us-ascii?Q?hVYaILVfE6i04t/HLRnv/85fsnlP4LsNBHHzcnqjCcJGAH+VVF2HCgxkty75?=
 =?us-ascii?Q?QB6+ks60aiWsaFB8FrNRBGbcU/dOsaKuUyR2dJUSWluN3yeKRU11dvU97Uu/?=
 =?us-ascii?Q?kHJtqJNS1SaXrgZwT5017c3b7Spns3XjMZHdRpNqkFkVXZSiP8LF7Z99im1c?=
 =?us-ascii?Q?eF2/ix5cBVshlIIagSdxCSeUrpeQZf2acCcysXXFn7ahmt4d565qzMKUbFYB?=
 =?us-ascii?Q?UnWpaesUeiAg696o69pznvK0mQZCyy12MzVoMx3pu0zSu0d6B69tWLFA9jpP?=
 =?us-ascii?Q?77QLvqu/gDRHsdXtRfAvVDQKC94lIClDQ6xn08Y2f2elwc/Zohy5T3ocXPzN?=
 =?us-ascii?Q?mmTo2lqvyzQMKFH9PGoShR9DKJTrFYvX6Yyt4abqWew59GPWH87Of5chHuah?=
 =?us-ascii?Q?EJ/7nPiRQ0ETeH/7VuF1eG0LQ1FS3sFGBjvRA5aevXv1/TG0kn6TZdCxrCiT?=
 =?us-ascii?Q?OD6X+Btn9F1peFUHPF2C7vLgWQWEQ37YPaiPwJyot2hGbzB1WsvggopVIQ14?=
 =?us-ascii?Q?zyfbzTOJwXAkKwANUlP31/y+efDMeEWT3dtz7J9AYoxDJvm6LRqwaN8BeYo/?=
 =?us-ascii?Q?HRIzu/RINxN/5XWNn3TKNfOxUnUukkDm9NFlNb3VHrnlbmmVBgkcuHd5cIxD?=
 =?us-ascii?Q?Gj7M0QavCg7RMaEUO7DJ+GcroersiXAMsmi9lUQ+b9SMUNLi9goRMOGMp2pu?=
 =?us-ascii?Q?dTvYdO/3IIWAEESSaWQzWEJBgVRljWAmbUEoh18Rvtmr61CTqbSjqpPbW0es?=
 =?us-ascii?Q?31ja3r14EZbkf/g4hrJhmz7t/aXu9+lv3/TTl9iVhDvAPVSz1uRNq5UR7jPi?=
 =?us-ascii?Q?KGwPCoJ86d7RFEA+0zk8n3gJb/g7vbEOq6eqs+j6SEfbQUZ0faeZhUu132sq?=
 =?us-ascii?Q?6a4e3yc4ZmmKkRot8+a2Muibzpm5cnjx/toPXoQUizair41gqOALcAliimrU?=
 =?us-ascii?Q?cMqSAbXJEtcm1h4DCGCxcB8ZbrnchYjvxtFrEkeq0fRbi44iE8c9PmfjpoY8?=
 =?us-ascii?Q?D44cNuoKvzobhV70Lpz36dd2nOYeLyOfKgMcNwKQpOsGfiSx+jIvlGtiPMRf?=
 =?us-ascii?Q?gWZ1ThwJbsDerapXxrA4QhlCW21xIBVXhxvOtJAGvv1+bGkkszbLbyj6bSbD?=
 =?us-ascii?Q?/MjuJguQ7pKUPMKG5UKlF3rnLcsn2SIWV8SKUd6LcUR/BXQ/N9+nKCJmzVb6?=
 =?us-ascii?Q?hBehugCLeq1Yk/nd3/Qj4Gect3j7vG0hvV7VE3qpf3UdMaAb13cNViBbI14s?=
 =?us-ascii?Q?/yU8SvpdAFT/29Hb+vtni8zdqpYVNpfRib18jHF/YaFxnxE3Fyfu7ly7e8LX?=
 =?us-ascii?Q?a4VYdWmATV8zJ8g8er5WHa3YQSg4fHQh/Wgw?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:31:04.1622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6bbc32-efc0-491c-6018-08ddeedbf5b1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5107
X-Authority-Analysis: v=2.4 cv=DMuP4zNb c=1 sm=1 tr=0 ts=68beda9c cx=c_pps
 a=JTdV+Vj9CMQU7FqQfOif8g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=7i1RBKJeEO41hu8EPVsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 27UcM4QGwZalWmWigAQvO1vYvzReIlfu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDEzNSBTYWx0ZWRfX20AviVujAsPR
 oyCwaGTa1uPnqcdEUHygpVc2zoEUv9gIL5eZB04hsrvnkcBifvxQx8FMKuIpKiTpL7Hzvn2uSdo
 gLrLJqUfIAlBbdWPJufpFL3Ir7ihDX1Rje8YnUB8grwSYCkC2joIXwjVefrW7CBDPHZrlTXLTlh
 OE8P3DnuB1AGPRauLwebMmQuQQeLGGZ8e2cWevIcoYCwG33FNjP/J2gqlHqAzogL+SSwnc15QXm
 1gfe3T308hlcyr1ddfy8tOp+daCycXln5PQ+ydnKU01lpB29Om8t0SE9YuvEL4oNHT/P6Oceol+
 Bf27J3KvIDXsEql8BRAnbXpC0FJKqg6KGEX6l33vsHdnQxiFwaTjSAh4cAvicM=
X-Proofpoint-ORIG-GUID: 27UcM4QGwZalWmWigAQvO1vYvzReIlfu
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 08, 2025 at 01:42:40PM +0200, Pierre-Louis Bossart wrote:
> On 9/5/25 16:31, Charles Keepax wrote:
> > @@ -86,18 +88,25 @@ static irqreturn_t function_status_handler(int irq, void *data)
> >  {
> >  	struct sdca_interrupt *interrupt = data;
> >  	struct device *dev = interrupt->component->dev;
> > +	irqreturn_t irqret = IRQ_NONE;
> >  	unsigned int reg, val;
> >  	unsigned long status;
> >  	unsigned int mask;
> >  	int ret;
> >  
> > +	ret = pm_runtime_get_sync(dev);
> 
> what does 'dev' represent? The SDCA function device or the
> parent SoundWire peripheral device?

SDCA function device here.

> I would think it's the former, with the parent-child
> relationship used by the runtime_pm framework to resume the
> parent peripheral device if needed.

Yes this would cause the parent to power up, but there is
nuance here. The parent has actually already been powered up
by regmap IRQ. The thing here is SDCA is weird, the interrupts
are defined at the device level, but all the handling is at the
function level.

To some extent this is also a consequence of having a regmap per
function. Regmap IRQ is registered against the SoundWire device,
as it needs to access the device level IRQ registers. But the
handlers are per function and need to make sure an individual
functions register map is out of cache_only so need to do a
runtime get on the function specifically. In the past with
multi-function codecs we have been able to cheat a little here
as resuming the parent actually did everything necessary to
communicate with a part of the device.

> maybe use sdev and pdev as an arbitrary convention to help the reader?
> 

I quite like the idea of this as a naming convention, will have
a look at updating stuff.

Thanks,
Charles
