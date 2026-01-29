Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C74029C351;
	Thu, 29 Jan 2026 15:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769700970; cv=fail; b=RBNQl3HTw6VGePO1RVRF/uBuGm0SmO6Gnn0icVqezCyGOAjz1PAH/Sv8Xi2JtzOz0ZnexSOeRUBMJ/zAq6d0pYP/TwCqZjEue1ndVi37H3G26doj74NwaST8A1O+QqsKv/9B/G+nAMPpBpCs0jhT/em/hJArVuAsFUUbEUHtjXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769700970; c=relaxed/simple;
	bh=WQaZgiQVC0kQEjh/c7V4KvukYeNSlZ5UYSEDlYad9Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owcZze5jgedL6UIsu+cSASSpwtdci2pUrcfod3dansWWC6SaMv9Vyjt/aHcZymcfebV8HbOykzXuCdhJfKgaBC6oQCeQAm2xJVqW0GjspO+ooXt1n8QseKkN3KP8V7RU6N4zB/YNMJ9WeGbbQ5AmGIgsWskQNVvyjJN8jpyqqLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=awTkpd31; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QS3dQhgd; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="awTkpd31";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QS3dQhgd"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TF3C0k3708278;
	Thu, 29 Jan 2026 09:35:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=9c8ETzbgtbzHIMhE9E
	IPMTCkXhLW0sxfEJmqItrDS7Q=; b=awTkpd31bbwv+AavMMFDEnfUtueTb1myUb
	U6LOM1psscULczWpTSdt+gfaDcA07+FQY8w5T5u8VKOIE7lecdKv0WIU2OLfVbCd
	jn/bsXc+2fqAJaxYLXG4fyFe5AQ0O9tFad8NfbzlYMTZr5y5glLhHjtX/qNxpiPX
	nj7XTTVL88q/VhnTMB6QsI1NOeOn1fR+kRBNBGcNMzpE2uMJUjlOHzwwNyXi6DhM
	sEk2mhsUMYEhQKSwxOz/FQM9Dv84OUeqmmiqIoLb5jjtYZteMH3knDBYifo5gGm8
	w5RNDAEzqaUbcIhMY/Bna0inkebBStfMcaVrjg9jZA7snnpowxpQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022126.outbound.protection.outlook.com [40.107.209.126])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4c09us81de-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 09:35:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaVEgkWgVRjJectSqjjc614hS7w0mirRjcE3lBoxEHG/4EsfRLeCjC9wz+DO+4MjH0WKD/UHHBveMbqfIvx+s9bPJ8tZviottVOo17RBepRYky8HPeEv55DziaB3IXbXuqp6Dad/iRpoUTBp5pMAN5HHsnn1GphAk9qd/JIGwlIBiivifDjNOi4yDGi7kJ6C9Q4T29PQzCCaj8/GY9v+Tj7Y50XcvFx+kzreQpsFRhbpuRGCPWmYDhGTA2Fp3bEY2h00ow/Rlxiq9D6TmsCi1djq9h4XtHDKmSyINa2frMDnyKHlJOl1WR6qL9pRkQSd6Jp/0g7BvdaGiCtuwKRPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9c8ETzbgtbzHIMhE9EIPMTCkXhLW0sxfEJmqItrDS7Q=;
 b=ytMmH9YnTJJT57INDXWKFKXJ8KPlBlK/mKkRTrJo1mjKWTM0CFqF2YaVtfs/+8vTODBrBelMfK8eei9jxw0AtDFthbNKCPR9/kka+qvR+M9bXbLjBgLtm5CNjLQOe/bMrmJ98wf9CgWjpIRKO275aJZM3p9xl+5GKkQtf8/+5fgzHhVEbaQk6D7yn8qaI3C75cxUaRCzEDO13q79cui3RODXzp3cWpUQvPosuZgzYDJmnQJbqwe5Wc9cbimXdlkoD4ikNiWInjhCvyTOlvJe2h6otDCjptN66hmG6OS/Z5x+sISBk1pXZVsrkjQzEd97gYZ5zMmqiImpgT686fGe6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9c8ETzbgtbzHIMhE9EIPMTCkXhLW0sxfEJmqItrDS7Q=;
 b=QS3dQhgdRKTnWu2P5GFKw6sa80dO2JY78K1MDwqKUc6FpyqarcwxVf/0UYWuZC+tL42y5S6NSlmoXTpwHxJCkzDg20r7FpWJZOrwO4wpUd/YlmyGcJMGUUSDgZGBxFXUOZnFN45tQb1De7+GigqloZPvHjg5rGrqS9t+DIDL+Nk=
Received: from BLAPR03CA0103.namprd03.prod.outlook.com (2603:10b6:208:32a::18)
 by LV8PR19MB8531.namprd19.prod.outlook.com (2603:10b6:408:261::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 15:35:12 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:32a:cafe::f4) by BLAPR03CA0103.outlook.office365.com
 (2603:10b6:208:32a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Thu,
 29 Jan 2026 15:34:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Thu, 29 Jan 2026 15:35:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 514B1406542;
	Thu, 29 Jan 2026 15:35:11 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 38030820259;
	Thu, 29 Jan 2026 15:35:11 +0000 (UTC)
Date: Thu, 29 Jan 2026 15:35:10 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Boris Faure <boris@fau.re>
Cc: mstrozek@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, lgirdwood@gmail.com,
        broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: sdca: Fix missing regmap dependencies in Kconfig
Message-ID: <aXt+LsclG7/4QRU/@opensource.cirrus.com>
References: <20260129141419.13843-1-boris@fau.re>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129141419.13843-1-boris@fau.re>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|LV8PR19MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: a936539f-1151-4a5e-7d8e-08de5f4bfe38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027|7053199007|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jjowq/kF+JTPzp75GYMP15DFaOfNa9o4VWTPpXF9BqTt3BHKk2OhBXcF1ioI?=
 =?us-ascii?Q?WUzLmWrxR+8Y1CI9aPcr3hAVZ8wypguhhgUKbhRNJrjupA0LmYpFvfY0SP0O?=
 =?us-ascii?Q?H7NosaEwIQT3igy7JjK0OlUgUderNfWjbhwxG6zuiQ/Q4Q+1kGyMLddcxiXt?=
 =?us-ascii?Q?t8X/IWtzLpgo66v3IHHIma98Xly+NkseEp6oWCmVrH9tzvkrHyVBC/1/eYHV?=
 =?us-ascii?Q?/WweZbLFoNBBNG7QvsvE64Gqn9EfgdfS9Orioy9vKLwaFDqG3T1q2V44/s+N?=
 =?us-ascii?Q?bcVGeCEoccXGI0kiGhX2PoKgL6NpEHP39lJJvEUOPc/xh5MfE8B2RPHI2755?=
 =?us-ascii?Q?kylTe8SNN+fM7PTP94WQSuJB67gkjAbW4sKjt3KrzhWA0t5c29RpT26i46fM?=
 =?us-ascii?Q?myI4lzY3etbWYSWwDaIs4d99R1rASTnQ7TNbSsxh1HDrgtRWUtr/+/4LkSpf?=
 =?us-ascii?Q?WoBflroqUo7CRc8s7j1tK5cfixYtvzJ7REL0rBvSkabi/CehodVMXKj6HnVV?=
 =?us-ascii?Q?GK1lQEQqSEpYItMwBWvQyx9/wz0kwR1rOEpPwfFq0ZOvim2SzVEu+qocmc3Q?=
 =?us-ascii?Q?VQngWvqsx5/0SJjHa0MwfifGFDdjM1XRjf1L3LQA8FI5QT+gVdLB2tD2kK60?=
 =?us-ascii?Q?wGNiJGEcVlSHh/DdbvRMWidybvxaKvT1t9wbOz68hJGS0vpUxlF175n6CeMH?=
 =?us-ascii?Q?cEqkeur3jhnOmNlgTV6VoaNpm0YgC3zejaQCVy1BYllcW7s3RTsfZ6sWEqae?=
 =?us-ascii?Q?LKZDc8BLgPD4LNOJGmqfjSkEA9ozZ/KnTQXr37NKxQKRFWFDkPLRRox8vbft?=
 =?us-ascii?Q?chfQEU3TfSWuYs1iSZOScIT6vyG42ex9/lwTZNKo3rIsV6xEmgD6HMXUggnA?=
 =?us-ascii?Q?nGNfWjm0yRZel1u/idHVhB7p1rczVUdgWVHLKOgR59XFYOfjvtiDugAVJnfS?=
 =?us-ascii?Q?1au8AdIXdRLHRe1mxvcJZAxZMcxWGQROJkoe16inJ8WWoajSHH5zgRIk4BIn?=
 =?us-ascii?Q?sj803syvUQsk3WBNalVLLykNBfbjAqB8Rvptcb9IfZnhGAxGGcAq4IBNHA2e?=
 =?us-ascii?Q?+0bAh8a4a0WEmJ+7Os7Do8bUwRRRxZDEliXpWh5OxIGKnKiwIrUoJE5KJv6b?=
 =?us-ascii?Q?A3EkQUVWs3M2lFpjQz40S8RFARscVbiG8viy49mgQPRonVeGtwkZeMMdgQIT?=
 =?us-ascii?Q?Y9CKqParlDepw2is8l9sgQdkzHkhwaOW274XoYZaUpYCaGbBRnPCOSvjHP1v?=
 =?us-ascii?Q?9MZgLG5RPUeggicCwVkwG4cbk3sWt6ILHvLf4hZkuXz8OVIx7pRSKQ7RRkTv?=
 =?us-ascii?Q?UFMt4n9y4/ADOzSX6QknUr7Pe5ekJlu+SkYI+jHhkhd+f2MOA2WoNJS1F1vn?=
 =?us-ascii?Q?GRc9LXh+SUFTz//W0g6cIjEnxpA3AeeJSv+uk29b1iqlBH03GfRpUkRF2z4N?=
 =?us-ascii?Q?U45eqzqkea3i+l8fZH7ph3rH7VIOGEpOvYLuFiL+/6Fc65PW5Fh9Z2QJfvtF?=
 =?us-ascii?Q?O99HFFx3QgUGI3j4U0ZbggeCC55heWIdKqUna0VKMkgVCJQYPWp20LJAog29?=
 =?us-ascii?Q?vKdRx2fOWhpgTbgBh0EqzTl6Um3JXE48HYaHXVb0v3d+r6tf+iI3bYhK167b?=
 =?us-ascii?Q?EjTVFrh7V7Zqqi0mF6ClcziOpTBuCTpyRzBxIF5EpJ7As5e2w5kOfVP8M0/B?=
 =?us-ascii?Q?JNJTjQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027)(7053199007)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+3UTCT1LkQMpoGWLyhw+FWZJU9qujPQJub36J78QQsKFVJfrYW7Fb2X+jUSOZMxV26eN6/daWztQq83XbfLBMilwnNAcz4VXSW8bHYjF010XRvW1HAuyWjE0EToekDdixHX95ujY9/+4II9+l0Ejb+G2n0F8+TYjNx+ndmFjT90tOtKcxE/X03PD1RvHZd5m3SAI4IXIseWVFDTuUeNE2BR5lNxVByKoVWg6+bEvoQ0BJhZB8zy6GMgxVhwdpUIN/gOMnAtTQbyEmTbfqG1RLabBdcQPov10LX3QKnbzuQMgxoEZP0mjOVAvMocgmVawwot4En60BOeC+pfgamHZs76kT+1A+kNv47txL+f3X0Z3k03e4XWDZXc7TJHEanwwPDVBnJRNn6v+SaTRkS3fSZtuCvflT0kNRgdP6Q899RjgNWiVDL4SwSqBzFqdzgIK
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:35:12.3428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a936539f-1151-4a5e-7d8e-08de5f4bfe38
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8531
X-Authority-Analysis: v=2.4 cv=cbbfb3DM c=1 sm=1 tr=0 ts=697b7e36 cx=c_pps
 a=nyJpy2Acw2Mtl+UscDzCsg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=GLHZN1l9_-B3t1m6LuQA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEwOCBTYWx0ZWRfX3wS+UNoQbaXU
 g6GHVE8DwoKpUJNkzmpefVrqgfBWBxs+cFK6caTSd9GIKnC9qnnfQyt/33RwH6VMVt16wgvhuJR
 T3larl01CATe7W29Al/d44WojCfKI8hvoaK6EQRoNq+QE4QbVEiAfpO1LCdJSukZTVO7WzMTHvX
 /y0P5IpZz2q1ngdZ5n6yHZkSIvaKjkviwLj7PcMdwA/9/ubr7z7F45uG7y5iG0NOm/xjquYPU++
 1+OnfFZDVeKBpnMBxn0sPg7ZOnw55Kh9210o0W/O1IgFprDd9fPOB+0epaoZVBdTpVWsyOv3x4U
 bRBZaiHgVmT0M0LVO5IuJe6KFJDpSCdxiUh134wExnnXK6gbAoAJnO69lYFjqyOjMOKYdwNC04V
 Z0txD7c30V28Xr1oLrBTf0qk65nnmFptuccFHdML+HRsiHzT8h++NonJj7F4KWO0+gfhy6oT7jj
 jS3IfF+P4TdoKq8yBYQ==
X-Proofpoint-ORIG-GUID: 68e88P_Z5waf4nuaXcjpsNS5TYjEVV6k
X-Proofpoint-GUID: 68e88P_Z5waf4nuaXcjpsNS5TYjEVV6k
X-Proofpoint-Spam-Reason: safe

On Thu, Jan 29, 2026 at 02:14:54PM +0000, Boris Faure wrote:
> The SDCA modules failed to build with modpost errors:
> 
>   ERROR: modpost: "__devm_regmap_init_sdw" [sound/soc/sdca/snd-soc-sdca-class.ko] undefined!
>   ERROR: modpost: "__devm_regmap_init_sdw_mbq" [sound/soc/sdca/snd-soc-sdca-class-function.ko] undefined!
> 
> The issue occurs because:
> - sdca_class.c calls devm_regmap_init_sdw() which requires REGMAP_SOUNDWIRE
> - sdca_class_function.c calls devm_regmap_init_sdw_mbq_cfg() which requires REGMAP_SOUNDWIRE_MBQ
> 
> However, the Kconfig didn't select these dependencies, causing the symbols
> to be unavailable when the SDCA modules are built.
> 
> Fix this by adding:
> - select REGMAP_SOUNDWIRE to SND_SOC_SDCA_CLASS
> - select REGMAP_SOUNDWIRE_MBQ to SND_SOC_SDCA_CLASS_FUNCTION
> 
> This ensures the required regmap drivers are enabled when building SDCA support.
> 
> Configuration after fix:
>   CONFIG_SND_SOC_SDCA_CLASS=m
>   CONFIG_SND_SOC_SDCA_CLASS_FUNCTION=m
>   CONFIG_REGMAP_SOUNDWIRE=m
>   CONFIG_REGMAP_SOUNDWIRE_MBQ=m
> 
> Signed-off-by: Boris Faure <boris@fau.re>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
