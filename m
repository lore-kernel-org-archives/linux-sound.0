Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E1547CC78
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 11:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843340; cv=fail; b=da/3c51sLFofuSl3ZUMNsmaOirrJoH8DfCudN/Kf97h1RlcuE0q68jR38cc+3lIZjQ6t8QLB/AOtLy+IDahBzU8wqS4iUmfsqYWp+knO7Rt4OyoNSLyjaFuNBd+ZmemGZvQuYb68Sgu+yfYtK8ejD6PKnbnagZsPzpqRNxi25LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843340; c=relaxed/simple;
	bh=YzNTMSmKZT5kzqOYgeX2DoDjkA8u0mzAFTEqKOL5EDQ=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=CgHGY6+p+rqOj6CwXG3oJ+cNEcoxKfbGwf7+35K4gbPFCwb00mcB9qogfdLo6mm39wnEdqxo8dstL+7MxnZf4NtJPoDnzyEKuYg0n3doo1V9AJz1xi07g1Z6O+Uj/ww3a85r/20CkcxamcJLnDUsi8b7lesCHiaGhFPMGrw8IXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ba7FZ2KU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xTpia2ym; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ba7FZ2KU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xTpia2ym"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F3mksi371296;
	Fri, 15 May 2026 06:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=msOXeG8e7z2CCTcDPyn5lzuYn/OuAsQhoaYFP7uLTNA=; b=
	Ba7FZ2KUBJNfufKJR9JXGiauktuDZ8AlV47MNnftiCFwSbsp7xKy4MSMhq9RlAFp
	kbEJTCv6Wgcg86Tdw62ujeWU0J/+A9rOokJxwlX0NULzsD89a3v3E9L8gDdjSnzI
	xjLuOoHB0DrCIcl7GFraobzNbJhhgN7lNjT3tzzhZR7UCPTv51rsDcaPRWmU+93f
	GLHe729VXVIr090dSotxUm1KohB5ji4N+SJayAO1dzPst5Ah9W2veCweyY+vz+NJ
	ZznhCsNDTsoOKd43FvuliufTcPMFohf3STUGtA4cGy7ZeZgMmK0BroZGP7v55/6C
	kQMIgN1AYWRhcWMwEOnIZA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021075.outbound.protection.outlook.com [40.93.194.75])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e5m2prsyy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 15 May 2026 06:08:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0vWtmPPruu6XQYMIwqlW8F8p2+9c8AP9shRTccs2yQ1l1lcTnF4GtN4dX2zV4/aDs1Epbp34OzsaA75Mrjkjt3BAAy00R0eOitUKSb6oBhArOv6NyC++dX+AKG29/pJKEI6ecfxyqXkIrbGA2MbbBDnYbblGaqmmklOfA74gKI3txcZ8kWyueLZnj8DEDGjk5CUDUzWm2S2RQ3T3L5uXvyXS7KIeJc2k/DniCYW0JfllMzAr75LPJnp/zrz7GAZGni5npUOEKEBwcL+1mgiLyofUTBtoyBYes48eysl4u5+mfrXY+5uCyLoETiAmVwSfGXx8GpvDFz4P2j2i+80wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msOXeG8e7z2CCTcDPyn5lzuYn/OuAsQhoaYFP7uLTNA=;
 b=SLRtWWVgDOfi0Do0hCSBXY6of3F4WsHLqwdhTgTThqe9fqvpH9A/utmlgE7F6rYx3MaRpJQ1tr4n5Vd6ucnYknSKgUsIrXZsc1WQJtRbDGYk70HNFTH4TzwNmWwGnhFKeJ5HVcG/MTyWqRSVqjqYVBqfmcLpYB8SfujVDxrcdsQtnsFNnW53QUIfCDac+lDQzMXdheUTx+N+PVo74mAdeNPBJ+M7t59LrAjB44eV+S7x/XgVY5fl1Apr3nVeLr639EdrdRYrM+QEva2galSeKIQnV3QxyA9bopIn6zv8f0gQ89e+vYFId4cIamof+0m7MSWu00z4zPIuYF0tNyDZdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=future-machines.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msOXeG8e7z2CCTcDPyn5lzuYn/OuAsQhoaYFP7uLTNA=;
 b=xTpia2ymZNMllbSoHrLVauNmMjA4qGV0quu6LuCKnrBSY201FfGg+Yb+1BF9ShRKLqpRXZDbeQS7Fu3lR3H9dulrFun9J3UA3cyTm/bIiCHMPbKKBpuOdH7YlxVWzH34CCocKH6IUmwZXgQSHZ2JacSBh+J55R11OAmP2GJMW48=
Received: from BN9PR03CA0768.namprd03.prod.outlook.com (2603:10b6:408:13a::23)
 by CH0PR19MB7910.namprd19.prod.outlook.com (2603:10b6:610:190::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 11:08:39 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:13a:cafe::89) by BN9PR03CA0768.outlook.office365.com
 (2603:10b6:408:13a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.14 via Frontend Transport; Fri,
 15 May 2026 11:08:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Fri, 15 May 2026 11:08:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A1476406540;
	Fri, 15 May 2026 11:08:37 +0000 (UTC)
Received: from LONNCK4V044 (unknown [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 755E982025A;
	Fri, 15 May 2026 11:08:37 +0000 (UTC)
From: "Stefan Binding \(Opensource\)" <sbinding@opensource.cirrus.com>
To: "'Takashi Iwai'" <tiwai@suse.de>,
        "'Heiko Schmid'" <heiko@future-machines.org>
Cc: <linux-sound@vger.kernel.org>, <tiwai@suse.com>, <perex@perex.cz>
References: <20260514133110.12302-1-heiko@future-machines.org> <87pl2xt57c.wl-tiwai@suse.de>
In-Reply-To: <87pl2xt57c.wl-tiwai@suse.de>
Subject: RE: [PATCH] ALSA: hda: Fix SSID detection for HP Dragonfly Folio G3
Date: Fri, 15 May 2026 12:08:37 +0100
Message-ID: <000b01dce45b$2dcdef60$8969ce20$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLj+u5n78P8aVuVhSHRRKJvmFFz/wJ0FsD/s+0eImA=
Content-Language: en-gb
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|CH0PR19MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 479c0298-1f81-409f-8c22-08deb272514d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|376014|11063799003|56012099003|4143699003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lTnZ4KF5M7NiS5LheY9734jG2QeP9AL3NBp/wo4xr6L1k85hDvUDO1KG4CQP2w7I/qBUIPg5CaFCnWdQefG1gzFI67FSwcgPIe5E68hX5howZng/cJb5ERp3MfzNJtlM4InXFEicxQXEJ3bCFYuQOE3OXmaI9C4YveV42YTex1y6Acrivt0w03u31OXovaR4p/fnuOG9qKYFXEUbViSxwiuhwZQXpEECT3z22ew4F6hTV8oAPjxpUnT22MXnDd0kwmymvHiVq155hx4rTL6K5peyO0ecKbAadMrcQir4lt9W3Ni8cCyNigjQ6b+J5Vs4GFVEws0K8FCIose2c9ZtNdWt7l5kCEn00UsI9B674dWnkuNZJhPgTXsVj1y2UffPXrRmmjoD93zetgcqI9Tn0FzKIVxGSjNkA1c+OlZon32SwiAZiqv98UyX5abPR7avKDXK8O4NpY6WwN5MstGO2b4eiqNI2in70LKvwDrRDGEPlsykFF3EV7t2LMDR9l+b8Sjlt8ZZyMifGzGdMlFepzMOHUblNKxVgED3Iec6gZxhGlUZqMUcqfViZqXztYkHkNlQ5vxlrrcYr0hCtB2/XcUo+f5yCTwmBCgsarR1QGlPUhu0esbElADHB3dvlSJ4wQqVdgFh0JtQ4ibZsMbY8KIvN4mbl9nwjzV7VD1aR5dRgC2KYVT6rj91DstCTsb9mdL8YDqWEELQZGWUlv2pXL+i9u4sOUv73UTZG69+ctw=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(376014)(11063799003)(56012099003)(4143699003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	apXdYalJjwV+aFLliiiAAnpGZWx622KyzUP2BJN+CvEPgava4SPf/tICfTDyB/KS1E/GJvm3TaQsg5hbq1O/jfY0McFOJdnxt/xGhzh6YtUae2syk4d3BUQrNGrfwf1RyXDzxV7Prc2LuaHosriz6zqQhQUzv6ZOKLGxIUd64HoSbYIafO1jZKzkAJrXmvxgRii4khBiUQZcOtLjVhvDHxNJW0+ymcnmh8fngh72nkLS1AY/gZfFczG0chJrHFqbKgvd77sXpCELfK7S4dbf9fnQsiXAACYQChIBUGyneIJVu086/m8bo39zLay+NMNCtBCIQOmkMNy/FCo2biE5w5xgV0gT6MxM770uP+pnwAZ2v5yGmeoBUMhMvH0F/rIRCE8uq7IrgwIHgq3McvmsT0wSpPD4xfZiSBZGwqZaK2M3sva+phLCW8l88hQo/0f/
X-Exchange-RoutingPolicyChecked:
	kV/WWeM40mP765XEUJL7GgS9tvCmcwAYnkRZ3y6j7Wq+llS29pakZY6/1B5YrE1U4CjXtn6SvLYTg7nz72FS6fnRa5ZmN43+O3tisJCSubN6X82qJS/4c6dUnTAeysoAvJg1awyRPpY+NB67pJAe+dgU6L4YLlgj/v7QOwN39oTeQ2fpCyVpiWAGTF9dXbSdZjsXFwDVA8rjPXY5ixyiSzkLRRvZdxvmghJInFUwAMhc9rypZAO/OnkVzwk8g/BdCpdgIoRkp/hUYNjkjz8wYOFdRvE64e5hELhQhDLgdDkWovZiH3c1c34qm8lCvvzgd03FaQ9i1U15RVIDEk1OKQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 11:08:39.1111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 479c0298-1f81-409f-8c22-08deb272514d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR19MB7910
X-Proofpoint-GUID: VXU5bJkvhMvvGb6PFpzO_-hDTRrOYa6h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMiBTYWx0ZWRfX9hoM7/XXY4ph
 V/2F/Twb+zAMNEXqGJRTNoW8W/o6I1EtRagGJUAjE+WWD0xl8zKWgdYvW/yrfdNufLZ7sI3kpxB
 06DiKwyezCw/8t9x0k/l/JXvRrgJYwLRtsxXPEdJ6NuevFKLhE4jdwKmeLRb+42ILvzSYvoIru7
 bPTB1/bhKB49UoIaoz4WQR0jeo5raWiwguU4UMS0crcqJi0xaTfN6mbJjQmqp0nI2v99zo3eZH4
 iTxIq9ZaN16R+u2S6LJUXSNHVCuYNIR5MoDLYiMJlsSXnUdtq2x4DjMzxuiRzb5WIbc5paKrN8O
 kTqzGJJPxUsWFCBHg4Jfqf0rsMymYVtC17N/hC6zP1X65o1L2VxPd3bH7o5lwe0T4K46YA2uSCV
 hHW7ZHsLrW++2vGGQNQxvqyCvOhtnV+aGl6dZHYKsxUIKoag5r2sy964VeQ7BP9C6zizoVA7hXE
 JSHWIy/9CjQ0+Z5TwnQ==
X-Proofpoint-ORIG-GUID: VXU5bJkvhMvvGb6PFpzO_-hDTRrOYa6h
X-Authority-Analysis: v=2.4 cv=aMHAb79m c=1 sm=1 tr=0 ts=6a06febc cx=c_pps
 a=93H4cXmoI5KDoTQtorJXRw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=i-tpwLrSAAAA:8 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=eM0BYCzKIkLu1JKuVUUA:9
 a=CjuIK1q_8ugA:10 a=oTmR-3ud6PQ8nQ3p6OOE:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Reason: safe

Hi,

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Friday, May 15, 2026 10:04 AM
> To: Heiko Schmid <heiko@future-machines.org>
> Cc: linux-sound@vger.kernel.org; tiwai@suse.com; perex@perex.cz
> Subject: Re: [PATCH] ALSA: hda: Fix SSID detection for HP Dragonfly Folio
G3
> 
> On Thu, 14 May 2026 15:31:10 +0200,
> Heiko Schmid wrote:
> >
> > The HP Dragonfly Folio 13.5 inch G3 (PCI SSID 103c:8a05/8a06) BIOS
> > does not program the PCI subsystem ID correctly when the SOF audio
> > driver is used. This causes the codec fixup lookup to fail as the PCI
> > SSID reads as 0x0000:0x0000 instead of the correct 103c:8a06.
> >
> > Fix this by falling back to the codec SSID when the PCI SSID is zero,
> > and add the device-specific quirk entry for the HP Dragonfly Folio G3.
> >
> > Signed-off-by: Heiko Schmid <heiko@future-machines.org>
> 
> I think the idea is good, but we don't have to restrict to both PCI vendor
and
> device being 0; PCI device 0 is used for wildcard, and can't work in
anyway.
> 
> About the patch:
> 
> > ---
> >  sound/hda/codecs/realtek/alc269.c |  2 ++
> >  sound/hda/common/auto_parser.c    | 10 ++++++++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/sound/hda/codecs/realtek/alc269.c
> > b/sound/hda/codecs/realtek/alc269.c
> > index 22b2f67..494dd0a 100644
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -6990,6 +6990,8 @@ static const struct hda_quirk alc269_fixup_tbl[] =
> {
> >  	SND_PCI_QUIRK(0x103c, 0x89ae, "HP EliteBook 650 G9",
> ALC236_FIXUP_HP_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x89c0, "HP ZBook Power 15.6 G9",
> ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio 13.5 G3",
> > ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
> > +	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio 13.5 G3",
> ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
> > +	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio 13.5 G3",
> > +ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
> 
> Those additions are simply superfluous, no?  Also...

We've investigated laptop 103c:8a06 before. Unfortunately, it requires a
BIOS update for Linux support, since it's a 4 amp laptop, but only has 2 SPI
resources in ACPI.
Even if you add the entries, it shouldn't work. I also don't see the
"original" entry in the repository anywhere - there should be no entry for
this laptop. 

Thanks,
Stefan

> 
> > diff --git a/sound/hda/common/auto_parser.c
> > b/sound/hda/common/auto_parser.c index 8923813..e876378 100644
> > --- a/sound/hda/common/auto_parser.c
> > +++ b/sound/hda/common/auto_parser.c
> > @@ -1048,6 +1048,16 @@ void snd_hda_pick_fixup(struct hda_codec
> *codec,
> >  	if (codec->bus->pci) {
> >  		pci_vendor = codec->bus->pci->subsystem_vendor;
> >  		pci_device = codec->bus->pci->subsystem_device;
> > +		/* Fallback: use codec SSID if PCI SSID is zero (e.g. HP
> Dragonfly Folio G3 with SOF) */
> > +		if (!pci_vendor && !pci_device) {
> > +			pci_vendor = codec->core.subsystem_id >> 16;
> > +			pci_device = codec->core.subsystem_id & 0xffff;
> > +		}
> > +		/* Fallback: use codec SSID if PCI SSID is zero (e.g. HP
> Dragonfly Folio G3 with SOF) */
> > +		if (!pci_vendor && !pci_device) {
> > +			pci_vendor = codec->core.subsystem_id >> 16;
> > +			pci_device = codec->core.subsystem_id & 0xffff;
> > +		}
> 
> ... here checking twice?  The patch looks somehow odd-merged.
> 
> And, I think we can just skip the PCI matching when either vendor or
device is
> 0.  So, something like below instead.
> 
> Could you verify whether it works?
> 
> 
> Takashi
> 
> diff --git a/sound/hda/common/auto_parser.c
> b/sound/hda/common/auto_parser.c index 8923813ce424..5bc95d3116ff
> 100644
> --- a/sound/hda/common/auto_parser.c
> +++ b/sound/hda/common/auto_parser.c
> @@ -1013,7 +1013,7 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
>  	const char *name = NULL;
>  	const char *type = NULL;
>  	unsigned int vendor, device;
> -	u16 pci_vendor, pci_device;
> +	u16 pci_vendor = 0, pci_device = 0;
>  	u16 codec_vendor, codec_device;
> 
>  	if (codec->fixup_id != HDA_FIXUP_ID_NOT_SET) @@ -1066,7 +1066,7
> @@ void snd_hda_pick_fixup(struct hda_codec *codec,
>  	/* match primarily with the PCI SSID */
>  	for (q = quirk; q->subvendor || q->subdevice; q++) {
>  		/* if the entry is specific to codec SSID, check with it */
> -		if (!codec->bus->pci || q->match_codec_ssid) {
> +		if (!pci_vendor || !pci_device || q->match_codec_ssid) {
>  			if (hda_quirk_match(codec_vendor, codec_device, q))
> {
>  				type = "codec SSID";
>  				goto found_device;


