Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CB02DEA8C;
	Thu, 30 Jul 2026 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402545; cv=fail; b=VqQ5CMCUBTG6CDTCLCeLDnmB4CVor5qyJPud0p/zZ2cK5DdLPpSqHthOaDZWuau+eFvx88I3aJx1IUWxz7iHdFY5mbfJX2xhXfVNmU8HxQCR0Ht7alpBjEPNMaRpV03rnp+nKPg+Z4X0U7F7zmY991B8VrEaC/PitoEF9LgV2l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402545; c=relaxed/simple;
	bh=qbaqlGEG3OifClB4ffy9DpLYCC0lMTkTMmcY9C22uk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBD3REMONYoBk7TUKGX45Ivbm22D4JBqty00MUEnq3wmLN7FEmsSkxvc/fpLxbeBDMyAR0ing6tG4JFBJafDmNTSx0asKoSXrPn6bZybb9wwz7BZ6NItE688ZWGngNxsezw2CJ5zbokDgIKzqzf1bJ3HaMZVAKvz9lh0lk4iqVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ip9nkclj; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=N8BIpGey; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ip9nkclj";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="N8BIpGey"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8owhH985106;
	Thu, 30 Jul 2026 04:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=vJQmbTfbueJnyxr7GL
	SE20cVe9jZwcvmp03T6Y2y0pM=; b=ip9nkcljbhFAJrPa1cw6zvw0PbLBoiTe1J
	oFiS/Tff6wYIpRaRuPoxul1jXad6mShwVVQFwA+lLq3XJI8iV2C51SeqrJXkYpis
	ALIgNlQAc5AyMzp8EIikGAg2x4ND77b0+NjxbLh1c0fPX1d7/V8c/Sl5yUX3D57N
	HDk+49lB0rK5DF3/4vHxgaUi1ma49LiDyYk6J2TSWyPPy/MGZL4w/ePxmyHgEvKp
	ybe0cfoJ8QTJDTy5BQNA5Uk3m9Y1BY6tXXhQpYkEXaH5ohK3A+ssgWMEwDLDEvoy
	eek+bf+1VGoGeq91BorGr584MgZjuhUuQFQK9+fDS+npdaOdGOZQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020139.outbound.protection.outlook.com [52.101.46.139])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fr3f9r0sp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 04:08:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M18xErQ6Kd19mdULXS+f3oArgZbkyfkBb5gudIaA86PcNhDVa1e4m+0ZZLbpLMYNsQlo17h1YV0uNUTXuRIjpywQIKqrOACNwf3zwtTSY0ge2NXwbOG15m3DSBOz5lIL+tXdZE/G8un7zjPLr2q2KBVtorDIe1Mj2UEJr2B5YWnbGrAo+eOl+x4/GZUSTZYBOkxj3iTMV8ym96luw12M9P1029Bx0ARlOmVYmTnCJBK3zXASd1UESphTgLRQ0JBKUOYK6YqCe14TXpDJVraPjxgipRBYX9Gwk64UYmpX4+ae0kczG4U8EW/ENyDGG6nvFGrhBk6P1+rFWwZxLs/qWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJQmbTfbueJnyxr7GLSE20cVe9jZwcvmp03T6Y2y0pM=;
 b=Demy3lNTqJyaNy3sO/mYsuJY5flvt83QbBC+OonOIgarV5Pp9n7nGcY6ma3G+OT4N1vKoKCFop8/XmlggBkn9tu8dgzaNwFeHt+XPhZ4oA+LG4ozxdIsz+KRxpBbWWf+JCHRb5eoVEaolCkhXLdHNW4txJ+MvC5KFlPeO+xpi2R0KB6mA2azTUjEUb1TC7B8WyMPGezZYYBA3l/CsZAwSqPC/UPaVv65ZuelBTeLcUhXAZ3ZSgL4k3PiYA/q+57M6u2OsD3ilunZRXTga/uvRd5QPdLhqoBE0AWbiWacRFkI7xg2bGZyAG3qLTpRytuK6CwftW5AFn+nlq0WbuHB5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJQmbTfbueJnyxr7GLSE20cVe9jZwcvmp03T6Y2y0pM=;
 b=N8BIpGeypxOkua0jMoBOcXfjyjrlJschyd2kM5YhHJw9FxmZ+qYlviVKm5BzB27MrbjoEq+wcPOQTFzFPDVen6XiutY8y2J7X7zCLk/UgB0zpG2W6N7ss8zTnp/mTYWh4J89+MednUBSnbaSH1qfA8rVbxGjTSDvGRtMUJeX8Ic=
Received: from SA0PR11CA0195.namprd11.prod.outlook.com (2603:10b6:806:1bc::20)
 by IA0PPF55B6224BF.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ca4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Thu, 30 Jul
 2026 09:08:40 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:806:1bc:cafe::52) by SA0PR11CA0195.outlook.office365.com
 (2603:10b6:806:1bc::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Thu,
 30 Jul 2026 09:08:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 09:08:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6C892406542;
	Thu, 30 Jul 2026 09:08:38 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4732682025A;
	Thu, 30 Jul 2026 09:08:38 +0000 (UTC)
Date: Thu, 30 Jul 2026 10:08:37 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add
 Qualcomm WCD9378 (Tambora) codec
Message-ID: <amsUlWAueA51eSDC@opensource.cirrus.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <amHqO5pMFmKRNYTT@opensource.cirrus.com>
 <cedd89d4-28ec-4a86-99ab-249637d81736@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cedd89d4-28ec-4a86-99ab-249637d81736@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|IA0PPF55B6224BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc89ebd-825d-4a3b-b1da-08deee1a25af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|61400799027|6133799003|4143699003|22082099003|10067099003|18002099003|3023799007|16102099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	Q5E92rtIS12VebLFSTY1my9rFR9JnOrDg0cAVmdaVJNPPc0yn22KddqiYyOyv9rzjJkY4OYxldKDmJse+jQ3fCD2XL/zWNO0vdAGKpyIjYSg0GMbZENh6OW9onETNoUbdBUdiVmanGP/LBgam0BXMD5byhzFXAulSWfie9YVLZTcdJZf4HTlMzrDtCRWAd6AxC9ZODiNlo/ZSnHXNdci+5gj5B8EDA9bbuCyR8PKQ2NTO/kGLCpp2KHDdkZw2ybxO+IgY+BSX6T34nlITc02TGNYxUGSvUcY0Sz4Vg4Qi/2737XUsyz10BJx5FyQlMWrdxhnVly1VpFSlRxnIcsDEFkPJRB6xSI33k2toTEi78Mg8Af4tcfaqxuH1oB+wOEIuW+f5Z4fgRw29FqSlk8xAXQmcpCdqwxhC4NzLBWv2bcbVT3pa4mY69E8j0NVOpT84gFVJAvtzuqerLT5Pkr2c7VHTC21gPpQlPRVjxiSA3izRsgOV2suSxtCAeurvPQRNBStuvuibwIhQDP1+46KfmHwFqot/c36N1myXGZkQMOXVsQ7hM1FzdhNCyrMoTmTZmmu2G2A7FyHXZU5q/z9enMdBakIT/b0py6s2AkJSbnGeVGsua5DyIIc4AgJqIXxi8yZRHit0XPPSZSbk+/3OuoSw6vMdtZHO0Tkp8cLiljB7oEeza4GRsOZl1nRzoDh81Ya7BW+fTW4ag2Ge3HhQA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(61400799027)(6133799003)(4143699003)(22082099003)(10067099003)(18002099003)(3023799007)(16102099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xQ0RdCDxKnsIDS7ys307NaweFpw6tRbTyoAdhwrNUCUNSjrTbWpyW10YuMxI7yCBbz428oyD1+wukSL+kMBzDWU+XuMHyrgLI7NsO9jmd/Y6aifBDm10u1O1e0/mymZpiGany+dPlOWMPPUxOcdG6V+DPcIrK0C3IW0zhkW3hieWcIvlrPid3s0QP0hgLUxWRDXbDVXSyiTTnMyxz8o2kLrRfhyK87mHztuinfmhl8CyHI9qI3Shc0a0WS/DHDSrLNmOsEYopx7NG0TbtVhhezSvpHHdnw+yhdklNMAG03L91CUPaDgYihZbltbpDZ/YQNd1rVDyHjwBgckFdjpOewkkv+n+R6bYhr21QwEkl13Oh2jHu9gE92I2X2lJlSBk3fj94iZktFnTuFFZ3RAXCQZmBLa10mJvNxmETpAJacBXi6FsDkvMYwUy3+Jls7+z
X-Exchange-RoutingPolicyChecked:
	Lmwt8QcOtg5ctIyjmTJBYCqBg8gr5wqhAkphzAJ+XRue8Oh8VDqOw0MgY8QYewZHVV5Qk+TipSupNE8vC25/rrJ8BNGZiIheXttaTSyQPVNAg8wHu98pReq2SMZ501VKc0T3kk4etLAsz0TFgSAmCXJdCl8urchWAi66LLif5ZZqLq20uN77Ev/Q1u2LJ4ylfPk2n6kLp/t/drXAboLlRdOIooGh/kcs+wRnY1uSBorFQEwFmToeeZlGUg/UIR8w3t2GE6N6ieu2lw7mhzlFGNEY7RUgd5mi72J3zV06K+f4R/Sfx7zopA2k7qDG3orqOSeh81VBKCWs30Qhqgt/qg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:08:39.9267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc89ebd-825d-4a3b-b1da-08deee1a25af
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF55B6224BF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2NiBTYWx0ZWRfX/mxGxg+qyuBK
 NRz+a/JHIudVB6e+zp6rWnl0Dj0Lkj1VWXtVG1tdTc/UAuXVWQzsI8L1F3Cx9uNtCzgxH03SwFD
 Kxn+e1ihFdm4etuXgt9lxBoAkmR4ju/hdwXEIiy2+UysLu60pz+gxhPhVY2qye5xd3Drz12IkRa
 zXr+ob8g4zUKTGMx6amV1XpIev6C05R+2+qU6AmNj5UpvXjixV2nAfxUo6dBAwlbgr+hk6SWUbm
 hOjMNRzqc4yxVr/5aoJxe0zXcj1dmbw24joTg7krf9Thlz5KesmMtMbzjScxy+UiSoMhEmvqina
 PzFc6ikUHfYaX6Mr8mL1XkUC8U6wxRr5aEoHCUVfbGdqPlmsnRmyukHqH1qOB/QofOMHu17o2xv
 xpZ+8CxpkfVszgEAID6B4I/WO6bfaZG73pV6LTy4I4yHj2Kn034iHo3n6eVPqrzfIH9CFAPMdl0
 vqyty+R9jWzydau2Tlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2NiBTYWx0ZWRfX003hwjyDir1B
 gOy6w3Lyw7tarTrom3R272alzy5j203uwuI5/rLirqAkJMJOXfi2BRivV8EpRgLbaiWvHnB1kGj
 eVlDGhEFzKcrskS6yJ/yQryudrV/kng=
X-Proofpoint-ORIG-GUID: ThU0ujADAWNga04NoMLJ-l51u7WhTsUP
X-Authority-Analysis: v=2.4 cv=OOIXGyaB c=1 sm=1 tr=0 ts=6a6b149d cx=c_pps
 a=mX607ur0qtllMGi8m/+XyQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VXDUSjE69Q1f4suE-rkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: ThU0ujADAWNga04NoMLJ-l51u7WhTsUP
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 29, 2026 at 01:41:57PM +0200, Krzysztof Kozlowski wrote:
> On 23/07/2026 12:17, Charles Keepax wrote:
> > On Thu, Jul 23, 2026 at 12:42:10AM +0100, Srinivas Kandagatla wrote:
> >> At Linux Plumbers 2025 in the Devicetree MC I raised the "SDCA and the
> >> classic ACPI-DT problem" [1]: MIPI SDCA is built around ACPI/DisCo
> >> firmware descriptors, and the in-tree ASoC SDCA framework
> >> (sound/soc/sdca/) enumerates functions, entities, controls and PDEs by
> >> walking those tables. On ARM64 DT platforms there is no DisCo, so the
> >> framework is unreachable and sdca codecs will not be able to use the
> >> generic sdca drivers and duplicating.
> >>
> >> The direction from that discussion was to let DT platforms reuse the
> >> same class/function auxiliary driver plumbing and have codec drivers
> >> supply the small amount of static function/entity metadata that DisCo
> >> would otherwise carry, plus hooks for device-specific bring-up.  This
> >> series is a first cut at that, with the Qualcomm WCD9378 ("Tambora")
> >> SDCA codec on the Glymur CRD as the first consumer. Static table that in
> >> part of this codec is generated from acpi tables.
> > 
> > Fascinating, a shame I missed the discussion. Main question
> > I have is what was the reasoning behind using static tables
> > rather than just putting the data in device tree? All the core
> > code uses the generic firmware parsing function so should be
> > perfectly capable of parsing the data out of device tree. The
> > only bit that is missing is really the sdca_lookup_functions
> > bit you ifdef out, but updating that to also support DT should
> > be pretty simple.
> > 
> > Looking through your presentation (thanks for linking that),
> > am I to guess this was mostly a device tree people didn't like
> > the stuff SDCA contains problem? I do see that some of the SDCA
> > stuff isn't an exact match for how Linux has traditionally liked
> > to handle DT but also really not sure I see any benefit to DT
> > and ACPI support being different.
> 
> We do not describe in DT properties which are implied/deducible from the
> compatible, because it is redundant and we do not like redundancy.
> 
> The device is WCD9378 as defined by compatible, thus all or most of SDCA
> properties do not belong to DT.

Do we really want to take this line? It basically forces us to
do "board files" again, which is the problem DT was solving in
the first place. I can't speak for Qualcomm, but at least for
our devices the SDCA properties can change a fair amount
between different laptops.

Also there is the fact SDCA is already a thing and is gaining a
fair amount of traction pushing against it does really feel like
it is just making life much harder for ourselves.

Thanks,
Charles
