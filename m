Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AD1299A8F;
	Thu, 23 Apr 2026 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934407; cv=fail; b=fvlR9zoB6Wj5Xicl+4LkQd6aj1ZSw19CrZ7RvglSlK2bMbwROQ45MKrXDzv4fXBrOhNcC4FSx2hnAw06AgHwanmobbksRVhrdvprWDwuL3Z4NUhvw+BcbF0U0/PMXNxLEVvXAZQ+Z1XtmT2i3nc7yYRz6TLOfGjxEvtYwI3F+FI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934407; c=relaxed/simple;
	bh=qI1MNjZKIvU+UXEDnJ0ApMYTc3H5jv9LaIbD6k8sjcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNILdvMgeBiWTSW5+G/Jxxd0PqHJF6QNCJpMiqR4H5vuR+uqgASZcEbrmTvZw4UAqfYWB4SAxK9HpZlROG+HvEYs5qTNXwnQiiXYdbgCat/+ID8EzIuF/JfJAz5/3kzi0OUMnFEdCgUbPIyvnpS3YR3NjD2MII3Zz+Yz/oWDPX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O4XXmUwq; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=v3t8vaMm; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O4XXmUwq";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="v3t8vaMm"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3BEUj198543;
	Thu, 23 Apr 2026 03:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=l+NQx5rVEBbCFpDX3d
	HH4vnwdolPLOv4k2j8UV8xJpY=; b=O4XXmUwqcOkLDZWwD+D9zutjydpH4EE0O7
	3HFYbu43Exjk+1fTHlkK35x5cmF7q4kWlppVrzy0Eo1p2LrD/aU3O2N+r8m9yMLs
	odbBLFECI/2BjhFFEZGlc1mGjhFD0wo/WfaZcrqtr+3rTOgDVxVpx8Us9XslgWRl
	kO96SswXpKpgoS2KU6KMQoQJ2YOOb6Kl4/1fdvpvW2EqurFKimI9FIyb39OgUSJy
	91uZUgpNDbEynK/Bev52zualEob21rEIdNcq1Qgm5tBPcewhkaK5aHIml52rKm6D
	7mu3m4AX2FO6fKO6oRWqxl5tYQRSuSWWYP6NpeAVdYak2K/z4eiA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020141.outbound.protection.outlook.com [52.101.201.141])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dpenht7xu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 03:52:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mbmh4JlUJhUa1BgpiHPN2BSx7C5HSyCiu9+mvjo8PdTWzpedrWK15XxVyes5VKcE+FLu2k+2mkF0rPRckFwtuWjYzdmtLUFT/ypAbTaQjIr/bSsVrvn75LgkqnZlQ5xmSZ3FIM3cHo/p1EM/kbXLZWpd0dMK/ZcmaIHl2vLA7rUeUTqSjzfgBrlzQo7cNhPMGB6p/aKmbnBey2uJqKYPMKszV0qTovHkEv62ZaBCjRIRe3nD9yLzmuo53ulBnguLnMeGoT/X6wxRhNllbabTUmsAWr5QOzIsrMH0irluAk+NRtNeS/W+WoM0WplrJ8rz+fXw+UZEaMy0pzmlWJKeTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+NQx5rVEBbCFpDX3dHH4vnwdolPLOv4k2j8UV8xJpY=;
 b=cJQjn1EnwBjNGQa/LJiCcv6FSeA2whogk3cZs8MdM8zJclt+ZLZtyf+skPYw7KbVTYQkaC39dGWTsoOPbaohaget5un+0vVaOIIsRbuuIztgKJEbBWr3/pzLmLCBiyPICEF7aMfPNiF+SUakbsUKcsGWMX/W00AoJtGHEODtsdKcSWs6grvIGKdsw+1wYCKHGuntQU8s8znpWQIK3ex7xdZytCUTqfXmJcQ39CqVLTBSaCrdzmlRBelTLu/81HiI5T7jcbPZhf4lqxs7VIpZ9xefvZplZMKzJ5spZOEBcbUZBM/y4Hz0cKg/pQI1lGCCfxRr/yqHa7BIFPWwt4jU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+NQx5rVEBbCFpDX3dHH4vnwdolPLOv4k2j8UV8xJpY=;
 b=v3t8vaMmTThr7PbprxnXqHGv/AYJIdIbouqZVruERWvsJ9Oa76nYcFOSeisp8r4qpYpiXbr5P4EPQk7R980VDOXVCKBpaIr1yVU2++5h6Nk19Qm4sYvngkucxWwsJd5smvw8/o7GoDhysLWTfLfh8MqaAnFEcnaOmD/EJ7D10rs=
Received: from BN9PR03CA0501.namprd03.prod.outlook.com (2603:10b6:408:130::26)
 by DS7PR19MB7626.namprd19.prod.outlook.com (2603:10b6:8:e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 08:52:46 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:130:cafe::66) by BN9PR03CA0501.outlook.office365.com
 (2603:10b6:408:130::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 08:52:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.4
 via Frontend Transport; Thu, 23 Apr 2026 08:52:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 75187406540;
	Thu, 23 Apr 2026 08:52:44 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5F5C1820247;
	Thu, 23 Apr 2026 08:52:44 +0000 (UTC)
Date: Thu, 23 Apr 2026 09:52:43 +0100
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
Message-ID: <aend22OeU/96DrBN@opensource.cirrus.com>
References: <20260421154804.2670-1-niranjan.hy@ti.com>
 <aeeehYTuNON2cGKJ@opensource.cirrus.com>
 <e13e6934-fb5b-4ea3-8517-85d482ad25da@linux.dev>
 <aeiGIpYwZz/dBuqQ@opensource.cirrus.com>
 <5daa3c5c-efeb-48d7-91b3-99e47f54894b@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5daa3c5c-efeb-48d7-91b3-99e47f54894b@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|DS7PR19MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: e05d5baf-71ea-4a1d-fec2-08dea115b032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|61400799027|22082099003|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dCJIQdStbadGhgJhBUdToFWPGiM6xm5eB80TnDDYfQr3Rx/GHGpjYLvGkwSCLa/cuK54OBa+KqLID5XP2TgNaZqVsHhzFLDbS5o7aAU4qlrethcDuuOSFDikSF+B2kgIva85M1sHbX96QRDlK2R1bBw/EdcM03OJWQl+gb9Amy+suEStfDNLJaWROLON6wMtYdh+Xt/U1h9xK0hE6Kfg2eOBc3g1wI/B1jIqn9STX+SgTZxd577x1ctaGnauaFB+Rts9T8yCtHY0h/r9KTCzLwGNheiaGrbOJZVGjOVwGwMXh7zLq47Tev+vnM/aMFXD7AwN8J4G2LcdakCpi0BxiQXvAfTmt1Vga886VVg2MKxrbS3qrl5vV92FESsG6pJQHHYv+I8gBS77y82mXU81VOf9lCu3tJQo+hjzARLrLZdYPHFnr8kuNHs9rpbsuIEZa4cZAtlLZaEyJsPgX9HUCKQ3ZG1Xv0pzbAtviKMvIUWGFfFzGsoA6R5n0n3r6nWD2t76uYBP9cjmoTsuAwp7fBeC5t/dMGTPy50loLX8Ls9syHwHCGXAV1rSqVUDzYOgbYR2wOH0GUUPW7Ddydd+Psf4j72jh/Wjq6DuJnZfAZMFMFamvKVUMo8Brj2bMz+W+rWtmiAwNvVjG4GVwiKYMnN88xCeJXX7xrUYj8iR4O7+V4KtgQb/fI6Siq65c+rbdyMUGPxWm+TOwCuAbMk1LNx8yVyQNN2eUsnM4EEFP91HE/kVv5bB4Ri+2qXJu6cfUhtW67G9omjbeRLpdYPS9Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(61400799027)(22082099003)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q6ucZmWPNagnR3rZRO2GptH+vjDn1IdZ5tbiDacasP0D6tHBjLKscSbFzcq0c88U3AW9OLk/v4Jq+bHckNiOfXa+wJXY8L++aZMf8GVWFho+aYfqhcBIvW5HHlk3vH/0qq2xRtU6Ki2loDe2wr4qnxMlMLXtOiIqWUY9eJMC6MWPPR+Mh4U3p8VNax4yDrQ9zP8T/YJsaPiKd+lYX/nYgAPqiD/pnmUChiHevG6hS9q2s5EBg/pW+va/Rf0lUrhmTlgLJTq6+Ug/Vri7m1OlYc83NCsiUFJozjM8FV0ONYnwlrs9SN29RyGFIRfsTge6mCDa1URHzU+zmZbccUeU5eny2F6ZI/mgWIKnQaamKH/pmykC3IaGQwb/XfUxzS8031euCjQWPqmrZigCoAuYn7CyHrBQjObPvefbLBCy5tHZyx7BB1PG/LaRdA1eKwaK
X-Exchange-RoutingPolicyChecked:
	eyV2GjfIyn6qIQBykfaA/dmiu7pwa2jvcDmP1q20OfJkJZ/6vn493BIFMQsdS7wVpycRva6ZquyI3xx6lsYiRp3IoOeuEl189lEahf7Jdrn6ft0JTnv+0Ddp32SaSBtB4NpY2PCllbkcwpFwmNwUFBqYMMMNTfKtIv/cauhzdEFR31fKvro59o3rfAU5aNiTHlZrgASrDJ8NAxnhnoAPCajIIyDKvZnqah3RgxmLtRBQDHpcD8iotRask9Pa+UA0zIUM2koSa7AxU/XhMunRgngr0K9qCr5m8lvctEglfw0AHx+lTKREYciTyNzv2TURKNqo4kkqxAgjD+dH3FXNZQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:52:45.3581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e05d5baf-71ea-4a1d-fec2-08dea115b032
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB7626
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA4NSBTYWx0ZWRfX3CuGxFynomPn
 L40eqLHYU8ND4uiyXi/aeFv0TAo70uaGun8cHQVEjdRf4pU9EytH5Bpg8vZvkwZSft9wzIQIkGt
 uAoqpWJiP/ONNZbO33ggL5n19APuvs9QpHT5o3KNwFcSXE8QODCU0TGQbem89tyqwLMaLpk2OhL
 nldNrYHRlEcxJH+cT5slYl09Dd9kUg+vpqKOkkAb40nFuv1mN4gn7L6G9GjaierHXwQePEyHhur
 dKDgD2w+5nFD09LHPWCVbW7y3HDDH16ztNMRq8nt4vkstvbOH/K0D4z8H0IKieVNPqoqlsMqHjd
 LDl40uclY6bzYsY9WI5Ik8Yg6pgfAfUK12zNH2GH3gagk0S6S5QqhJKTcPMz3mztb8lYd/xlvLs
 IuKhEP6hCuGuTeUDbtCu49liEqvv8KX/d3OBkD7LnAPIlar4GZuqwRGkouhCVm6Es9X4zfeTJgk
 4KPeS2pMRB3bcCz4qEg==
X-Proofpoint-GUID: oNv_EUYD2kStiHYQ1eBBxQthpa8L2OEO
X-Proofpoint-ORIG-GUID: oNv_EUYD2kStiHYQ1eBBxQthpa8L2OEO
X-Authority-Analysis: v=2.4 cv=DZInbPtW c=1 sm=1 tr=0 ts=69e9dde2 cx=c_pps
 a=QyNrOpZ8ttbodQqJgga0rw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=_8hmZfeddYygRFAbKigA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Wed, Apr 22, 2026 at 07:56:09PM +0200, Pierre-Louis Bossart wrote:
> On 4/22/26 10:26, Charles Keepax wrote:
> > On Tue, Apr 21, 2026 at 06:21:09PM +0200, Pierre-Louis Bossart wrote:
> >> On 4/21/26 17:57, Charles Keepax wrote:
> >>> On Tue, Apr 21, 2026 at 09:18:01PM +0530, Niranjan H Y wrote:
> > That is what is happening in the above code setting the
> > reg/mask/on_val/off_val, DAPM uses that information to do the
> > register write.
> 
> Since we have two different ways of doing this PDE management,
>do we need two helpers, one with the write and one without?

I would really vote for just the polling helper, most of the time
the register should be written by DAPM and for drivers that don't
those drivers will likely be writing a bunch of other registers in
the event handler anyway so what is one more.

Thanks,
Charles
