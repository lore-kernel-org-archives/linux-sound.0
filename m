Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EAA20F07C
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222910; cv=fail; b=QepAANKYLwBLXvRqOgHUuu7T7OLjb8gYQNTaAALzQVW7GHogPJiWfNRqNR/jYKlPK6cJWS27tsCk2nc1C3YUY1mp3mGHJptiSo/49Bp7xAgJscveOjaiigNFMHBWFCbQ8+iD+jJEIL63DeKxJxkYeBQ9wZ01Tjs7rZmHRZ6DeZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222910; c=relaxed/simple;
	bh=tBKGJjkO44WJ7u1+25sudbKYYWxkoPMoixCLIr66lMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVxKuPZlU1BfTaQRabpO+Q1PxXeHv9RAhO2Iz9YX/VprFitb28SzIW9HrbkxdHQE1nqLJ1v4dus1an1xlK0S35RCmWzvu/hUdAmuJVc4r1sslx/o79+yTVPQhXrzSwPj5mzzQ8VHD+lGGZHKz/UWHI90K/WhtEMGV+0iX4Vicy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pc8EQgR+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GAOs73z6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pc8EQgR+";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GAOs73z6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B52BIX006953;
	Fri, 11 Jul 2025 03:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=IaEIM2ir53XAfvR/Su
	oydNhN/ZsuSXoly5jR0SpuSJw=; b=pc8EQgR+B1iYXApcgzLf5HQLHIyiCrNi+n
	ngcYAYUgoxqzMgWgWAywFrrCG8v8t9kEn+pQmDTW8FPr4Ylnym3ImTmEJRDFwMWr
	g2yOSE8C8gO/eKZUfmnlO2fM5s88YaIC0eZlXW5rlAbvogavz1KWym5+cj6ozcOZ
	Bt0zFJaGFbHkLQEB+J/9FFBHp+ejtu6KCmVb51yTQ4NKMBxmEo0wlD4LRPmJAW6f
	+9ujMtN0Zi5U8WIljvHIehP/6Ao/Dq7q9hKoMZpNhswkNlvsdx57bRfeKwoh3w0V
	tsAWvCXT7I38vp+EYegTIkPFexVyZdsuzbt6ybE0MjFt1Jk5hP8g==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2133.outbound.protection.outlook.com [40.107.223.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47skytvss1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 03:34:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgyH+oBkr5uHNAUxTdX4C8hpdmSuuLKfTh957bBCybJZVaUn0kz9/WG1qVF2DmN6SoTwwPPPt34kymzeRVE92r4gUAf/mvinHd23obgFcOvPppazNZRN6leMwp0Gh77zyEO36ymyze3mnNMm+f1/vGxtkReTvJIJGRol523dOaqpYVqKNWfI5p00GfTPI21eSmj4wmv1/2uge+B5xAfAmFqz2/vK0+UDawZRosm387/dga//QSKvPKvzR7OZbmkSv9aqPNQNueejxwRHxz4UKaOwbSoQqiZbBVtA4AdTfruhaFKQCvxkJow2FSwc1OXUdGmZTeyJOkjeHr1zVrN3jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IaEIM2ir53XAfvR/SuoydNhN/ZsuSXoly5jR0SpuSJw=;
 b=w6TiiW0QysoV8EcoBGpulf3rIJDZZVQu1M9N2WAjIYHYyd7SWu6T/XNfC5JzVhAahsNCyKxSL27mCdsBEKaO/QIGUMbO1ERHmqxdhj362s5+yfVOiXNlW/8syKYSy08PY8FbJrBOuUqo3Ouql8zft22x9VxIrqg5MZ0ytGb9ubptdcVSxrDozyVKsw9qjkRY3K1ZfVUol9hAjByWOkFPidbjiCDpJIkHLx5ouU5bkSSxFGglQM862//CWWNE3uzkkKRf9D5/Ryk4GeXkEnCm6JtWq+vu+hBZ1ezEybgYU3D6sHTSE5AwE/Igo3+t7ACiKnZ4CG3DCV7wsscMrujfnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaEIM2ir53XAfvR/SuoydNhN/ZsuSXoly5jR0SpuSJw=;
 b=GAOs73z6MHTV1Ni6GoZdGHRr61YRpw3K+M+GGvSTMQo2DhKKupzQWO3qU5YhNoEOk71WdcFontYPsJscDCjvZT3G4rb1OLx79gqCiqLShVz7U7lPhNfr0rsweEGLGKCkWQaJfG0Bqc77I+fTJr58WIZo95XV1TJ4+YR7YdMc8bY=
Received: from CH0PR03CA0263.namprd03.prod.outlook.com (2603:10b6:610:e5::28)
 by SN7PR19MB6711.namprd19.prod.outlook.com (2603:10b6:806:265::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.24; Fri, 11 Jul
 2025 08:34:31 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::36) by CH0PR03CA0263.outlook.office365.com
 (2603:10b6:610:e5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Fri,
 11 Jul 2025 08:34:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Fri, 11 Jul 2025 08:34:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7EDCB406545;
	Fri, 11 Jul 2025 08:34:29 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6DC9F820249;
	Fri, 11 Jul 2025 08:34:29 +0000 (UTC)
Date: Fri, 11 Jul 2025 09:34:28 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: SDCA: Pull HID and IRQ into the primary SDCA
 module
Message-ID: <aHDMlDvcZJzq101C@opensource.cirrus.com>
References: <20250710163424.1158958-1-ckeepax@opensource.cirrus.com>
 <20250710163424.1158958-3-ckeepax@opensource.cirrus.com>
 <ca33a116-fb1d-45bb-b73a-cab4a994c61d@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca33a116-fb1d-45bb-b73a-cab4a994c61d@app.fastmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|SN7PR19MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: a108cad5-0fec-48b1-f7d0-08ddc055c1c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nNylDAkKVECrqDAsxAGvXQwdeULQpxpVmld0sVaNmOAVMUoq99Y7cjBNaeUB?=
 =?us-ascii?Q?aaP5SV9ycuxwlWUgH2DP7oV91A5i+OHqGH4Og6ys5HFeMI4H7p13DDfL6UHd?=
 =?us-ascii?Q?GjrIhEqJtZCULcCeYS3zilvVVdxC2clEMyjcLhVKFk9L47B/PNilag8O10TG?=
 =?us-ascii?Q?abdGg48e/9OrYCH5mjpH7QSPFVIlp4JzVKnhD46kWv1Y2vaOSQRYMjBHx0UT?=
 =?us-ascii?Q?U3RQAvI8EclBsK1G9wl9yvpQFDW2DIbmLqUk8MwaQaB3TWRrv1CV55tqrWxF?=
 =?us-ascii?Q?VPK1G7eD5m4CDosLutJ30W7YRapJPFwuQ4g/uky/NdhIVxsnr4Jhm2xvKO0K?=
 =?us-ascii?Q?4viDeiljnkX05a/dhMflqBk6Ydw4pLXRGGbKCQKvwjdXzFxkrqPowGZuAEmq?=
 =?us-ascii?Q?PuxfUKYJD11tt+Xx9e0AKHkhnNhdEz7sbl//zAcUpRSi8x2sU9/+15U0OpAQ?=
 =?us-ascii?Q?PVb3dHSGBKfdHCEIOJ+Rmi3bapIFizAOp8g/DbBeenNdUiTGFzArsZAkCUsL?=
 =?us-ascii?Q?KVbKd9Zt+3AGfBNBtS+3lmlerKpvnFsMSEoENK4ac5MAWgCPBt465BqbAzg+?=
 =?us-ascii?Q?aZQQ7eLL0bvIytBaqu/4Q4/iyLhN/mCsBsYmCu5FG7cGL5fXFG9aq5WIyhWr?=
 =?us-ascii?Q?MKxTDgByJfZRuYICD4HATQ+ZhZ1T2mqK20IxtJKkCTemjwYAf++kYTM16fkr?=
 =?us-ascii?Q?22G6TzndFB6Xetc8rzr2p0lvMSx33/dACTBUGZii86NHiT62doXmp18X268A?=
 =?us-ascii?Q?nOIyzFMHxAbndExWLgr/WFYh37SBAsnescmyX5Y9JdleKaHVefGUUJMiBcC9?=
 =?us-ascii?Q?tL7halfyOv4ZO8AFI08td2EwxiRWrBWAbS1JHucDbrz8ealczQUWk0G/5da2?=
 =?us-ascii?Q?wePex+hE9YQgv7dDhllO2aGXfsm6F40XilTK7kit2+tify/8q0eZkWvDVDf9?=
 =?us-ascii?Q?uYhnaJRheiSXvctCtLGSGwsuUwFGtYtWxHxTaoXANMvVgeDR+0STq6bqNTaq?=
 =?us-ascii?Q?mVHzFbJ2XuXj5e3nH/bDMf1xM3KRQvykyITHBNHpmkAME+VQkuiN7COMsoLC?=
 =?us-ascii?Q?MPGRxqRlFCatXqyVKUvciZKh/Q6E/ODVmpqMbcHP/iocmeAyHbMA7/X81Lo3?=
 =?us-ascii?Q?mb7NNRbr5igjA7nQYhLCB9gL4ZXqmFOC5fQP6CHddeD1M2sijavV2KBYMC6N?=
 =?us-ascii?Q?ShA1WOAX4RyNUHFP2MtRnqK1j+lE94xYlTkZ+uwUMzcNSR1bcHMp9XdGXOFf?=
 =?us-ascii?Q?bF5iUCaO2uQCjeL5rCTt6Rfj7uF+989ltxZAzMMRQ2Euc4OFg73YcvAgz/9O?=
 =?us-ascii?Q?tKpq6aQvxDUVrnqJ4s6rUpGcNTmBvz5it2igy8LrrYR6CCHT5QWLnz9mKG06?=
 =?us-ascii?Q?Zs30Pkz0tdwFLGuG20VRVukrrfPyJQj/Cc/B44PUXnnB5753QpcWuMk+pBE+?=
 =?us-ascii?Q?KKNPTRAqisP2RrjaQNkvAhVsdiBbBIuCdNJZfeqmcMsdACcSoeiLzYBKdmmT?=
 =?us-ascii?Q?gqQ8if/g6wsm06tjBr5mUcxXcYlPBp1PZEmb?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 08:34:30.9744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a108cad5-0fec-48b1-f7d0-08ddc055c1c4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6711
X-Authority-Analysis: v=2.4 cv=BerY0qt2 c=1 sm=1 tr=0 ts=6870cca3 cx=c_pps a=80ol81Y8LmzNtep4GdLCmg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=CC-Yph3x8wLEgtcXr58A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: G_pJ1m-zdduwJ0zUwE8Fpevq2QHNQJhP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA2MCBTYWx0ZWRfX4HruBDHT7fXM Ka6Li6/8n+15H2sz8gx9F0AhJoujD2isd6jqlYeEzq96+O7PdtQPRFk9Cllnm3LYwBlIRa4Se4A pRwrzhH5bkW4vUpBy5Xp6d3/EGKyrLdLyA4S3SW0tr+uyJMB6+zFrNjZbISL/kfb8QMRzpAHJ26
 rjYfOR7sS/DZS4woNlM/b2sirqRRASa4IMTYn+DoRYNQalMcBos3CaY+7RRyKEZMG3fKE/vKcrF TDwTTmMKUxrFFUCU7DFJbEn6kJ32UUEczztTLCt5gkN9KJY0TEszaFq+BOyrPVGgZwZ4CL6GCeT gZe5MXZt8hD806tT7FkXHnmIp89O0wu2Im+33vE6mq3nFyHM8QHfdgiX8DprcBNvG6+vqMy0d9X
 Dx4lU3MK1T7Dx5qDCOThZxiwfMsQeRe7hGdZWq5e1CDZpOUnvEasOZ0Fg+Rnx8XwREYZ/bVP
X-Proofpoint-GUID: G_pJ1m-zdduwJ0zUwE8Fpevq2QHNQJhP
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 11, 2025 at 07:44:56AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 10, 2025, at 18:34, Charles Keepax wrote:
> > -obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca.o
> >  ifdef CONFIG_SND_SOC_SDCA_HID
> > -obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca-hid.o
> > +snd-soc-sdca-y += sdca_hid.o
> >  endif
> >  ifdef CONFIG_SND_SOC_SDCA_IRQ
> > -obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca-irq.o
> > +snd-soc-sdca-y += sdca_interrupts.o
> >  endif
> 
> Since these are now both 'bool' options, you could write
> this more concisely as
> 
> snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
> snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o

Thanks, yeah I will update for v2.

Thanks,
Charles
