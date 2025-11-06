Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7932DC784
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762423765; cv=fail; b=WKOeTYxhHZvPyeVq0ceT63c9+YSApp1JIYw7xSVG7WhfIqWkeYzP8eyUIl88vqBpYThb8bvD0ptlstG5zCZJ90qpD7hxws1fQy40ANTDMnLq10MT2F7cEGtdvNSMJmFRjKRo+d8f3mXaq78jAOkxMu0yg+WXUN8j46aBjFsp7xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762423765; c=relaxed/simple;
	bh=r/PbhnDQgSA8vHun4j0yZg/2Llyb1VU5wEzLKvXzxAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYYFzfx5gweHgU9akEsDrWu7Vx0j7OlLytq+1mA8QHRhnvdKNL1u7cOxGFiLdHxgWBUVHUrac5MRH0bWX28MzxH721lge2zTz4aXsweGRCLgrlYMiGcvJGQHHLpNLg2gtUP2L8g5Z0cTySg6PI1mIkd+8RDNXzBmQS4XK4t9aHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VUnqZltY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dlyR7H4O; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VUnqZltY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dlyR7H4O"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A61vDBC1122962;
	Thu, 6 Nov 2025 04:08:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=EwW5CVX8VZdeHmHsr8
	JCJN7XZYcXjSwFQB6oEPR4x7o=; b=VUnqZltY2kFsFdIrLDpNLHqfd4tMhXZ3Ii
	09U9ZdStBXs/hFsN3Iio2+4cyfSFlwM65M4o2tHHfsa6y3FowMwM0bOd4YQ+lckT
	DHfNMwWHqnX1gjKHLvMy3jPMNaK4yHqwH80eu/+I5yvdbTytVr5iDUwyq4XbsK6f
	I7cgy3LpGPWDonMnaiykprgOlvgVpZ1eNy/Aolyw3w4AJeHGNztQi33X9pQEwycT
	VxwhDbFDpQ/xkpZfdfsNwury630mGZj/zquiWdUBxYqXu8yBmpANYqD6FQU1Nx6u
	rJFF8mBv6U6anRjeUq6/44ksBwu/kjraWD0M5hsXcxls24YOZtWw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022095.outbound.protection.outlook.com [52.101.48.95])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a783wuhw6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 04:08:52 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDc0zdebjs0uAXR5RMTJvJb0Zj0GpZUlOtB1S41Llbdxc6yT5LbHmVIzJdoiC2CKDR7gCuvA5j9TdyQUan3+NsZoFrfXzpncgyK9b91jTAflXo42cYSEDVIOw6Wq2xpPYcHJXwNDgCkuwP882NbhAu5ROH+N/vyDtlC3pXPcyVSJ/ZWnJEsc6QvGdOaTZrEqD3IEOwupeS1aF1Apr4tv1LWLF1qw25gyxyvx/fZkpy6+duVAW/zc4Tyq1LhCs7qq+NEiCCOaoZYfm6RNFG1hW4sl5w4pEcKptVcQrb/fDw08jf/t10B2oWcXxSOkS2tgHr85/4PBuizB/Tt8u9esbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwW5CVX8VZdeHmHsr8JCJN7XZYcXjSwFQB6oEPR4x7o=;
 b=BIgkPIym8dqNAZrtUDVuIKFQufG67ENNvL1h+UaTjVVHbSgacx/0lZyL6Kqd1wxCvLfoCOGyM+ZL7LpeFEiGQCcbJhDntMMSvOyLbSRBOEPxsSt2zj2rCKtAONH73xf8FwyaDXbEg8i+9RU6kkNZgvChNQ5EcqOxxVyfkDPTXWshdaC86Oew4O193gOWEm4CHK9uC/no9TO9IywyroQFTXS9NLFWJlQ0rh+LEsk6Rcviz9WGRaMFlERV1JjQnUl96Tz6Rq7F+QJ5QcIUmb1k3SCx317LdJCrKVesCJvKW5LOM7RZOMe5L5lyoztbENXRNxA4Mn18JAc3zyI1qhXusA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwW5CVX8VZdeHmHsr8JCJN7XZYcXjSwFQB6oEPR4x7o=;
 b=dlyR7H4OHJgbrU/RsptUorOyijapLUiofw5b/6p9ICp3cRB57kUWdvxbGBQ5V2KfGc03fnpC3jWoeMcpyXteBInpkNxw/anfhH2oigmertAC9JTGo82siCnAri28b47Rtw7yDj006tIA3lVxYUxfgovTUGu2iLh/OUIx6L2let0=
Received: from BN0PR04CA0016.namprd04.prod.outlook.com (2603:10b6:408:ee::21)
 by CO1PR19MB4968.namprd19.prod.outlook.com (2603:10b6:303:d6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Thu, 6 Nov
 2025 10:08:49 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::45) by BN0PR04CA0016.outlook.office365.com
 (2603:10b6:408:ee::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 10:08:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 10:08:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E95C0406544;
	Thu,  6 Nov 2025 10:08:46 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D5B3A820257;
	Thu,  6 Nov 2025 10:08:46 +0000 (UTC)
Date: Thu, 6 Nov 2025 10:08:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH v2] ASoC: SDCA: support Q7.8 volume format
Message-ID: <aQxzrYKCZMdp1QPE@opensource.cirrus.com>
References: <20251106093335.1363237-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106093335.1363237-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|CO1PR19MB4968:EE_
X-MS-Office365-Filtering-Correlation-Id: 487ee4f2-c6c9-4143-1fd1-08de1d1c7a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HDd8J4PyzfILo6+cd2XbRVYgnCBdFGCZSO4JaVunU6lrzNlLGDqSYxuBy51H?=
 =?us-ascii?Q?mnLv9x4wbntmzxg4SdNPlC0SsnGtruAo768CaC1HSOTE9ZgqWI83r7GLRHcM?=
 =?us-ascii?Q?UEmHPd6tbDocJPifCyRgym+kt+wMElJU8h63HgQPOuRjcP0vxdbpeGvDCNRA?=
 =?us-ascii?Q?+rbWh7YblTMz9Q/3MRbijk8nby+F2NcUz16PXZ+BwurGm7MpQzP//l19CVG+?=
 =?us-ascii?Q?4rogks9dDABoYNx3/7g7I0Rs7wQJwJ14X/K4WvhV0wsTIQrxzdJhFipvTPcn?=
 =?us-ascii?Q?NSSSgqaU5GOGPaRAjQpQ6NHRp0xykwj5ahQP00IatREgoSr3CKX6Mhb9nOd5?=
 =?us-ascii?Q?YQ5CuRYquqDHBVPyUdruTE1z0SScV2cG1d0zDSzAG9e8HtrCWMj0kyeioGap?=
 =?us-ascii?Q?dMr8ya550lLSdfY9bMP1taD6zG95bxo6kf4WMv80EXA6SZCgfcb+8mUNSfH9?=
 =?us-ascii?Q?+/PEzy5T8BHitjRKqzaJgoOuXDfWatVulzZ8Rsltd4QsC+1apPZ9PqrfjmeT?=
 =?us-ascii?Q?FGPa4Y+ZHyqiha7ANJ8wjQZNvGQQH+AhSzaUVMDkddshwnrqeg7LslN53Rox?=
 =?us-ascii?Q?Vq9ri7y0Zz1yxIfon6WidGzKXeg4AiXXmKUpVpmmveiWprj8/v1U9/LfNuwA?=
 =?us-ascii?Q?9VjziBvzQanFIhUktGPPTmfjZOqo8XwGX3QC4o3P8eTES/Y6PF8qNZq8oscP?=
 =?us-ascii?Q?OLL9Iw8jycT2G8v4oyURAXdwjtXzNvoLOpJ7Kxw/vF7yW3oawb0xpYE/r7cs?=
 =?us-ascii?Q?ubYEl7d9DNP5uTSUAuZuBGkvdPNFjLwMaOhxF9QnbY4KV0zb3EYJFvYBF8Of?=
 =?us-ascii?Q?fxxuxtbSoMNFw6CFy28bpL4Nuo9J91g9C6D1P7nJB8Y0ytY1huS5QBPxjY1p?=
 =?us-ascii?Q?gGMnDfJczAxvWG90Zmg3duP0eBlFD4aiZGy1+jzYPdIIzjt6Jh7AsvnpSRDd?=
 =?us-ascii?Q?WumCOynd4NTvnERxgN9JdLg3t58Vixzw2mfWxkfQFTtMtsqECD/OCcYXdJdA?=
 =?us-ascii?Q?mZO9L4Uf74UZSIst0UL1qHSS/Yx/ILPAQBPyJjyqjPgN1ROFf5J+qtJx4Nvi?=
 =?us-ascii?Q?YQzeEd7NzATc8ITjLUBO74P1GZB6P8kOFq02+1ghR5Ql0OUjSpZGoGZIl4CY?=
 =?us-ascii?Q?kECGfKFUK5g8y6goKMZSCpE0zdi5uak3XELg9/x/Dsz1iK6XkApBqYUFo/KB?=
 =?us-ascii?Q?Of1R6kCKLCX46fEuxyi0wnuDYJe/m6pXcAiICRelUsuGcFhmnxvCxMXN8OGA?=
 =?us-ascii?Q?TM36beVEVnKInGTRpWeTPcIZUrYLvAcIU2kbROVEHs/YLGodnFnOXmH+0p0E?=
 =?us-ascii?Q?Z6hlYQahfG7qJ7gJH+PYAo1FaIx3dpw+5tPvvKD6RXu7v/B/bQp7IZ7+di3h?=
 =?us-ascii?Q?5x1Q6xMC6kWr/HU0iN0mx8pMMWb8sBn+qhOhWWiXI1YXRy4l4QDa+5wgEnEX?=
 =?us-ascii?Q?MztZeB2eurmf3wLSkCCs7VYbWOjdQUDFIo8aoSCVI81kq2iPqsxs+NnZK/hu?=
 =?us-ascii?Q?ELxdJxxcwUjNIbXNf8ZdT8Dy+N6Cm7ZMvA5haWxeFjQDBRu9+lHnrntmpXez?=
 =?us-ascii?Q?kJ4CBEQdNBHGFyGuuRA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 10:08:48.3360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 487ee4f2-c6c9-4143-1fd1-08de1d1c7a8d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4968
X-Proofpoint-GUID: nWQpiZLUHaCU43xkLTstvLYDUQ1c-xkO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA3OSBTYWx0ZWRfXz9eixuDRr+ca
 QgzlV9geKATpI/7qjSuQcIl/jb8Pup1NgMcsUNCLx94hBXVbc7hi8cs92iJBm/nxZKq+KRVTBVv
 mJQqbEwdEW9Z65iTz2dlXBKSoaRVVTiUOVTz4Gub6bKh5diweqHXPcTQk5lBgfX0mefbXZOsYeX
 EW0vhoO8HrUD7jPKIWn7+lFiUOea0TA4lS3Tb6sthGmFrUpNCCvxvVen5FX5n43KAMUiC7IvDYG
 ajgzRTlHObTjJYILzGMk5U4LfaHVohPhhGcJ+7nMG0B7p1DMbH3b4M1aRHmMUqWIab6PiUwWkNK
 Qub2WPWFzaxaO1/ONm/qNkrpIVX6H9BgzhgTst5vuonsXx8IdoPPSGt55IrewEss3e6nKFfMEVi
 JfmaeIJBuPyxQ5YmxPiKa7Zf5bn2PA==
X-Proofpoint-ORIG-GUID: nWQpiZLUHaCU43xkLTstvLYDUQ1c-xkO
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=690c73b4 cx=c_pps
 a=kd6AeByrnEODuFk93iyKgA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8
 a=fatZ5GXrwvJGjT50ElQA:9 a=CjuIK1q_8ugA:10 a=UmAUUZEt6-oIqEbegvw9:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 06, 2025 at 05:33:35PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> The SDCA specification uses Q7.8 volume format.
> This patch adds a field to indicate whether it is SDCA volume control
> and supports the volume settings.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---

Thanks for working on this it really makes the volume controls a
lot better.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
