Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE263B961E;
	Tue,  2 Jun 2026 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389878; cv=fail; b=B1/6fmNzCvdZjXVwEsye4MZmZAxkNFHeuD09OVi2fCvm6XjNK27Ysx8acZBjM1/jKWgbi/AgPBIjjDkiDSW+DYIsuZtiY7dNzZrbtvWSE2A+ODklIESrXRazBfxgEqMkfTIs5uhIbMRHKR5tHmgNV7OpcLdaJlwMEXVPXOm7hKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389878; c=relaxed/simple;
	bh=D9rBq3ik1cfZ9p8NMUyHlm309zKfMTf+Q8u9Nwj9p1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2KZNptRhHJiOGDmxofHMDTyOMA5nNEA3m2ybFGtgVlCXxrEIClbsyiJdjMvgF9BhhiTeNW/8++FNRQI5UZdt2rtPbCX/HC21x2UXWQRfyc6wOySfmU87drqum+Vs3IeBgH0p/pKhhHNn1BXG0B60hQAFNsNL+KNKNn6vh/GzFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=E3Wtx6aN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NzeDGlf7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="E3Wtx6aN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NzeDGlf7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6524IasG1757295;
	Tue, 2 Jun 2026 03:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=nFFMEP90GBooql2Pfz
	N7xHCKFpdeTWr57/Rl5dB1MDg=; b=E3Wtx6aNgAGpdXM3f2UFMZ6THk4KtpXfVH
	CYUeIiPzQ8PAxxWNR/g2frcgruUXjvwpzp3dP+SPVxt43gEELuyMrjMqyubKMJW0
	2NvnxqYB8YiSpPoyrkznRBGhmbZ1sA+oSnXUiAaI001p/jXBRHWFq0eTqHS1+OJw
	jpxSM50Tcuz+HB4m6Qc7LqzvH3Bvj9BbR6pwvzFzJCPlhqz4OmmnUi2K4QykLNDP
	LFmQdE9NC9XZsDc80FtPS7QzHrMuSK40e2c3GrgtTIES0ZDpwJJ1RRUB8nrCePPx
	KdFvWvRDchxSpJbG6pgyyfqMvv6maCY+hOEtr/iNQcyauKZN5Byw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022077.outbound.protection.outlook.com [40.107.209.77])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa13uyr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 03:44:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlmgRbEsjE9b0KymWAp1dZkcmgbTxv71XJPJRna0rBbVZTM3GvGcswNrRXHC+5dGMXrPVpAwdxIRcVZ3lQM+0tLEaCxmHSeCXY4ZWfcmatQMFvEWGO3yCiEgHj8uOt+PgzWYyp7cQQyMfLPm4AzrOWPS+/QwPCY2M6NSdBkN4gj2zk2VbfalY5NU1v47kVa5cor/9gFr86qKmWNLtw00kqhgXVQ24rj/PNtO4XAmOscAxDK6CpzPuNRFEfnm6uimoqAF8VExJPd8haxNmhInQQKVbqESWtR3d8kUQIslc3B8yCJVK91f7FvkjpGCT8ttBmioEVsHcGj1IAUunLkdwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFFMEP90GBooql2PfzN7xHCKFpdeTWr57/Rl5dB1MDg=;
 b=h69iDvDPtj+OSSErPl6MOAi0ox0A8baKceP9U78l+ATQ9+vUpN8w3cW4ditqG4d9Owmz5QvHso32beysW+LJaE8p0WxODwDEeZ2bT4nXKSDI5SZjshGkbiT76grmfKN+pqCEDTTe0Iy1zAXDtYPaIEzJcLANPeusMx2JnE+GuT4LvAYkQX5fhpojIzmYYzFcTG6K6LlOYfdJgt5NuFFVlYFV/X1Tpo742amWBd+ZpxetRZGEf197AAj9pULyYosEjcVGop6LMq1b6h0+M4K2pZOd5/mUwX8X3330vhTwcq69grDncDAub8A9ScEx2vRFhYWMvUXyBT3OUCF1qfA2FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFFMEP90GBooql2PfzN7xHCKFpdeTWr57/Rl5dB1MDg=;
 b=NzeDGlf7tEQ5em5hKicjZ5Xbgb9QW2TYn1IBWQyhBhToOov7FWr1R6zn3KSVK2gijiQZng9PoAvU/kpk3s36f+s1ex+r3BtE8wyfhkkLtt9m6hzUglk69mcqpE79vlN20xN0oXXdn8Kd4v0qnGgvKaDA038MgcDidz9cJqhDAow=
Received: from BN9PR03CA0333.namprd03.prod.outlook.com (2603:10b6:408:f6::8)
 by MN0PR19MB5899.namprd19.prod.outlook.com (2603:10b6:208:37e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 08:44:05 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::1d) by BN9PR03CA0333.outlook.office365.com
 (2603:10b6:408:f6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Tue, 2
 Jun 2026 08:44:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.0 via
 Frontend Transport; Tue, 2 Jun 2026 08:44:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D3C27406540;
	Tue,  2 Jun 2026 08:44:03 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BC43582024A;
	Tue,  2 Jun 2026 08:44:03 +0000 (UTC)
Date: Tue, 2 Jun 2026 09:44:02 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
        "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888
 codec
Message-ID: <ah6X0vwXpayzcWXI@opensource.cirrus.com>
References: <20260601080224.1410292-1-chancel.liu@oss.nxp.com>
 <ea0e8942-75d6-4a02-8be8-cf0f7680f825@sirena.org.uk>
 <AM9PR04MB8353ED13E31C180953F8C9A8E3122@AM9PR04MB8353.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR04MB8353ED13E31C180953F8C9A8E3122@AM9PR04MB8353.eurprd04.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|MN0PR19MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 88693101-842f-43e2-1f6c-08dec0831a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|30052699003|36860700016|16102099003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ppBMmE7wgXLtgz31Q3F8B6HuqbxoucIFHBvr1PKP6EKVm0MBP73D0ZQBI0J1b2VCZt2HVHq6fViWYqS+DI+0E36x72jvkLrrC2YI2br95lszZK9+Ppj+QR9C8i4vhDsIRDnnSvNM/rmW7FC9MDTDTOM3pr3SxwMPOUxSrpLmrcBcWdmLbpsmNg8DXEwU/Ha1p3bPCXIBQz2bbb/DJf2iIStmCS/f4GcPiIOMB/SwyRXT4K803a4C+E2MPmxcLqfiVisbAaKBs3tgzH1lTPRGHlJkvcvRQLZNiMdCKnBIGIfU+oi/PvZsXZ4VjmRhonDB7ja9IYxQPdgRlcpttgJVzFEfqJfd5CZL6+0MyKXgDX3icGk9cJIUk4FPYDhcX7dZ9Mfby1h2dvt0CXcHkfPSpf/OG0tH07WJCPGyFbQNMYJYmEZgx9EJXzPHVS7P47RuVPxFTiUw8uUtQ5b4kaqwiHNj0A3h5Pk6PDyozPuxbPwQRs5Xx+PhEk0vUpy96Cviqkl8raDsPDHWV2j+MgwlCR5aHiuO70vF+91rgxJq4SSHGpKBLJiheDrLDUZ7TsvnimIkoO0SBxV14okbrXZI3cBBP6LvkCT1eiUh7uOfz83T/4CtHBUxHIbfO2Qf1HU231w5C4E4BIRVY4OedWK4O6CNjee3B+Cw85FmJsohMfwT7GRpmZ1WIYzU+tDcZpE27qmtZSXZb2MyoXYP/KHyqbj+o7DSzaljid+tggHgMPM=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(30052699003)(36860700016)(16102099003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z/KCyyxizRyzchnM8JIbNAEE3eskkaNrg60jA61SHzGR+2Lm8636nnR+2XR8yUmnxw+2mwNS5nuNzCb97gJpBnsZl8Nr72auQYXtF7SscW5WffeffUDhJCy4xCw92RKgKt1kMsJTdmw7TJxeeJhw0UfIixAoPMh0EpqdUgTC9X9d6iJKnByLyExMR+mWlgxGESRuz6a5vp8po0IkYwR0Bc1kSsUD8gswK2bx95tg0CDSPrIhklg25awW0bA0tk7/nr2glerCE5zzfJjpKPoR2/BHu2HH5+p7Yo03WYxDSnq8UFx/qqfhV11f+QpdLCr0Ddc1LylpzShwY5+WOAzhLDqFwg46bsiTyCN6vly0zYS3qz19ILI5cyW1Pg67Hs2xI7Xgf+UJsQI/TnlNI8B6fb7xur0sbQPHuye2wHEYP8n4VaHkoTsYmS4JkXXwX9q0
X-Exchange-RoutingPolicyChecked:
	T6tnes9kIpZG9jSa08SvJHHkPdcn5dpUcJ/b8lGCrEaBZHykpeVPbirhch6TgV5c9kyOJQXC6B47goMOcZtMrOzNIqUiQaQe7hdqf0kk8efWBRtuf75dq35VCof59ZAkkr5BfMzKh+IdrdvKZTilUFhKhWfRnZVWyXDEe8igYXw8HW4K4xOGHGSodKEuc+IFUnSsA0r+x7aJ6Q+HLaxtDSET63CCxUKIHpk9uQl5evcKmJspt8aYfnIOUNqC5MHOZKldJIgBgpeHcQzgYlE0MeREKm1zQDTDst+m9uiEbbztrW94JAB3SybeTz6o4rhlhEcwhVFYuDPCdgyHZ1Oh1g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:44:04.7667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88693101-842f-43e2-1f6c-08dec0831a6d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB5899
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a1e97d8 cx=c_pps
 a=X4ZH2kTj14Xf3yjbCCnrEw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=ZJcHJAnuNGUECG2Bs-8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: vjss_yxTCj9JO-DRq2EMXCoJ9FLTN9RJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4MSBTYWx0ZWRfX7VRVj/OsrFHj
 B/JoSge+gk8ymbIRDJEDJE15NuNXowP3pTX8l0G364PjHIh7/24fMuFBIVYsJ2eoZz26xs+VThk
 pO90J47fjp7aAtQoiNdzwMpOU4SybhLP/CvrHxrmoVSXvLSC8bxVYn6ZB5ByzzAAFUNxgu1xORG
 kEJpygT3fMMZHZ6IlmBRcQLf7uqsrMq3Lb6Q5h/1Z/v7VvDwCkOeGBiFepY5xjW9XcrzDRjuxVv
 WpIS2use54JX4IHIY8s/JR0GG5ip/F0eoKsFFoS2b4SMeC1ytj+IDjOkkoqJppquMhXUI97AO5V
 4QHvN3HyR0/TCkLIkILEhEFe90lwZgGhdQnI4tQWIBfYIyF71LpDxvb8Vw/bfrd5WNXG2ai4DvE
 XaMq2aAD4pnAf9M8T4TRkvCrh/Tt2EJWBZ+9CojT8ohaga9syvOt/vneeAFNZ2NJ5592imuNXv1
 Q2csJIDv0/qURCrdncQ==
X-Proofpoint-ORIG-GUID: vjss_yxTCj9JO-DRq2EMXCoJ9FLTN9RJ
X-Proofpoint-Spam-Reason: safe

On Tue, Jun 02, 2026 at 06:25:33AM +0000, Chancel Liu (OSS) wrote:
> > > The existing cs42xx8 driver only supported I2C control interface.
> > > Add SPI bus support for the Cirrus Logic CS42448/CS42888 Audio CODEC.
> > 
> > > + * The SPI frame is 3 bytes:
> > > + *   Byte 0: chip address [7:1] = 1001111, bit[0] = R/W (0=write,
> > 1=read)
> > > + *           Write: 0x9E,  Read: 0x9F
> > > + *   Byte 1: MAP - Memory Address Pointer
> > > + *           bit[7] = INCR (auto-increment for burst), bits[6:0] =
> > address
> > 
> > > + * We configure reg_bits=16 so that regmap treats the address field as
> > 2 bytes
> > > + * (big-endian). The chip address byte (0x9E/0x9F) is placed in the
> > high byte
> > > + * via write_flag_mask / read_flag_mask, and the MAP register address
> > occupies
> > > + * the low byte. This produces the correct 3-byte on-wire frame without
> > any
> > > + * custom bus implementation:
> > > + *
> > > + *   write: [0x9E, MAP_addr, data]
> > > + *   read:  [0x9F, MAP_addr] -> [data]
> > 
> > What about INCR?
> > 
> 
> Indeed. This patch doesn't handle INCR. I'll enable INCR after reworking
> on write_flag_mask/read_flag_mask.
> 

I don't think the driver does anything that reads/writes more
than a single register, so one could probably just set
use_single_read/write and punt on handling INCR for now.

> > > +static const struct of_device_id cs42xx8_of_match[] = {
> > > +	{ .compatible = "cirrus,cs42448", .data = &cs42448_data, },
> > > +	{ .compatible = "cirrus,cs42888", .data = &cs42888_data, },
> > > +	{ /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, cs42xx8_of_match);
> > 
> > This should have an update to the bindings as well.

Thanks sorry missed that.

Thanks,
Charles
