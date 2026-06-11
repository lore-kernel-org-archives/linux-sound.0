Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E9F33ADA0;
	Thu, 11 Jun 2026 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168926; cv=fail; b=hVRyfdO1wAUZJGdjgmh/7q+6YDTkq1mDyN5PV7H5ThrvUd9cimyeNptQw7ySY2u6RY/gpn1Nn/QxVI7BOdeA73TPjYeYHX2faJenZneuElQt/5hMAGXNMM2bDcU+atHGpfcn5WyhEClBvzBH9XIYuFgecwGOa6JMGAJYILPJhs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168926; c=relaxed/simple;
	bh=XS4voIqegV23GcM2L/jRFCgnNZY6TB7SwfwHDeJrHts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTMTCdV3ip0ycQWMeaBiLhlsYzMvjR3r1l4XAy52NB0OLbltFHXQzqDqkC67h+d9zAsBWqBjiHYyZObGVAsXVzz29FVttctpyClc6146SPL3822/1po8pARIxeKrotffqeILh5apJXu78YdAHKLTrpUZFvMn7e9rTjQeH0wwPGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PnQkpsHn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ko3BXXMR; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PnQkpsHn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ko3BXXMR"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B1eJad477604;
	Thu, 11 Jun 2026 04:07:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Emvd2ntGQwfjswojRV
	voOsmna/LrACkDgekhlkUz4UI=; b=PnQkpsHn1nHlIEZXZGeQnk3x5RKVRItWEi
	l+vaSlen2DApKvTVbnw2/0eOe2qwUEyeX1hrAM8FHDoBenVKSu5AUU4F8glIJOjI
	U3iJy9uztG65YmI4fOmgQ84F2dDQiP5jbhrzlpVtgxpthYCcGdLZZkpGcOrUhuu3
	qVujmZa/4tzVCt1sMUMV+FLywH24omHwO4FujuI3OWb26Uodhzkc0TQkN272GUVp
	lx/kPW9yq01gSbhiQ4OYPixw0aU4ukKnb3crMmtpe6TSwA8yfPt2Vvi8kDLc+Uvo
	XevHTVv60qaV2eeMBquI2WuqNebBPvwJ78Awkcs+YCZcLeC+vvUg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022121.outbound.protection.outlook.com [40.107.200.121])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4eqe6e0tu9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 04:07:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUEy5DK8AGDT0kmtouVkLonLy1QXlP4IVeypDbelLa5nlezDT5KIDDpqJ2Sr8JgSolyw40/ddpvjY7BZOwyJ3/Zp/l0V7/B7OaFBckZo5+1PH+7iKL0EIbYmWRMxe3ZQl2WZm9enWaftnywJzBA8eQkGB2K/vYn7sR0+3WO6anhyg5IC1m/mpRB4qmub1CE8AJnwqgBQ3rUe0NgAfaaeYxnyH7wS8ViaTBZ13nrzgZkNQlPFo5Gc+jIiWHacOThSeKHJOEO0Fi3KBs7ueBRMTpdVoC2WycOZd9xB+wGDxd9onQNn8lrfTFv1wM+A1lph2vX6YjZd/imhWVcOXrIL7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Emvd2ntGQwfjswojRVvoOsmna/LrACkDgekhlkUz4UI=;
 b=Gx7kAIrEZOzdtpLsaEhDfUNHaha6CUwEMiV05ZPvFq4xLIxIV//0B+gHA4vtXDsim3NX++q3JCNpf5jF5scF/HPj18/9uqLee6NRT6TJMKfARFhCT1sziV+Pa+XF68W8xAjydszxR1tG7zNu2KcMXB0h9P611q/oEcG38vm2cb/qAcSvJzBA6ONQmNSvWHD80CgdqKxkDZxcu6z/tsXT0+B1B4LVdENuQZKSHUbdcFDsmwptugbEF0tJN7nsgXUeCHUEuTLq9ORUV2BvXJampsPaRgey9CcHevW4eTVOXlOQ++5IaUrKWUPXmKPXmfMLbmj60lldfmXxR//WIH6BDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=163.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Emvd2ntGQwfjswojRVvoOsmna/LrACkDgekhlkUz4UI=;
 b=ko3BXXMRSFIQHiH4kuGksT8U6H3gOVV2//9YqiN6ijGO8p86EgG+bBIZXEtBoDNFVr9IooJqEXFM+73dMpy80OBZXgxn8TUiVJgaJtR3RgG+6EBSX6PICR/4xe19VcA828WoIgOQ/WwDerKc+vduHNv1hivpGwtNM0XYu2LwT5Y=
Received: from MN0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:208:52f::34)
 by CO6PR19MB5466.namprd19.prod.outlook.com (2603:10b6:303:14d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Thu, 11 Jun
 2026 09:07:54 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::8) by MN0PR03CA0029.outlook.office365.com
 (2603:10b6:208:52f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 09:07:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Thu, 11 Jun 2026 09:07:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C066B406544;
	Thu, 11 Jun 2026 09:07:51 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A892E82024A;
	Thu, 11 Jun 2026 09:07:51 +0000 (UTC)
Date: Thu, 11 Jun 2026 10:07:50 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kean Ren <rh_king@163.com>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Vinod Koul <vkoul@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SDCA: fix NULL pointer dereference in
 sdca_dev_unregister_functions
Message-ID: <aip65u81qQieT19U@opensource.cirrus.com>
References: <20260611023757.1553960-1-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611023757.1553960-1-rh_king@163.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|CO6PR19MB5466:EE_
X-MS-Office365-Filtering-Correlation-Id: dece29ae-1810-426c-1c43-08dec798eba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|376014|7416014|23010399003|56012099006|11063799006|16102099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+420juXj3b2M5bq3WljGJkoyQqXyGHM63lhFNRB7krUmpqFt6ltSeUWLTx/MMUQKsLRhNoBw1Hn04c/9sak30i55L6tase/axPy88ilxJt6XDUXW2LlHTL0/6Q8hMryc/GUEW1/BnzQv7HyOrUVKurnLvZjOY+i0kOwrxtDQWku/VqdqCHHOGzRXTPQFN7tkaH4bvAt2FnjhJSqPjSPmQZlYOMzOk1mLwjFxW/OhndyeyXIZugSivscS7kwn4JjjcRvBmkqHKVr9W7MpVoj21zPlj2LwUHE8qpmx+h6ua/VGirPqKgTLGFsXAvuq+05OvaaY437m0axAuexxhciBkoZvxP5qQFubABLoO+IA/D9JCvccaAiHQYrU/tSI3/ld7Kq8qFSCiPhBaC3g0xbnWg781nPBwjAvaoRu0tOCszEwIlvFO+yXLHNNA1luVyrGgfQ9HMF4DVpTwB3XvhVV3DCugAtYC6EAO2vPw4d2p6BExdDD2NSKMfHfGAWDJxUI6G5jPnOu4CBxRXfo6v9BKb1ZCZE1WC8RL8Ok66UqwmvgdpA6OnCTmK26jk7JADAE98anN5jFM3b7yukFoNs/9OgYe85uR2TmVqvNypho/lbI4Ah9fvAQ9kICe1UpVbWUh21cj9ViAXXcU8lW8VarqbA7Q6iyHX0zohPjUJzIedIK0j2yp3AcpPMHmsAQdHJHYPWGxVBkyGKbOld1ZiNs1TmlDjzgPVhshcI3aKXo0+E=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(376014)(7416014)(23010399003)(56012099006)(11063799006)(16102099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xOjga00cWCzQuP2zMSfA8I33acoC4FeH4PDRg8FaUqbU8eDjbXuKY1LyE2YEpWZk5GFMPb44OtP7+Ju0pbR/8Zpw51RD79FA4uNhWV5C+X9b9soDVmWRMWPYkDfrfiPmA93ohy/pXj3+L3eUoSRo9BqohOb+Sseu1hv+iVRP2ws44o/LSfq2VybwnGp+c1WbmuTH62WLsmXl8tnah1tk/Ug1JW2zlVE1n+eHBQx8HbC+nMf+KD/7HtHL/6p3xz24ov3kmO7xezZ4Fj9/BaGHF44VbRrbSKxHHY2c5NLk3W8snUetD9rIiTR9AxI8+vySWeKcOVUUWMpDu+zPddgoCyIIfc803d6/sv8NITxHVVGEpsGCdeWT5DNa+DiBWbo4Eg8+45UuHk0kcZDl9LvsWWMhdmOlegoXZuSsKMSGVYEIyZ6jXMah6gWp4A5TjmWy
X-Exchange-RoutingPolicyChecked:
	ez0lQ8PnsSiUUnRI3ESfp4x0xU7MIYJdw+dLLfVJVtTM/zMftv/uojEDHMd5Y6ax3XKeR1BOKqRF/Tx66POjENS/6554cg6ROPldONoTZnpwq5y6iDjSSZEwk4bynqGlnPrwZOBNy5pkG7riNNt0QScpc47AppjNRAc24xR8xKWGYzCiXWEm2lpqTUFwE5wZ1gyIDfM9YbkoyTEeXs5NZWQFOVaDwWGkxP/Md6iIwtSJJv1k2O5z/nHhWvxPeWUTvwPlZb/N8YxtqD0sP2/MgLbGp4ZaBsYm41ABQE55hyuSWYfwsZBai996udCEoq6eHAqpVf27BJ+teETAFJJbTg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 09:07:53.2882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dece29ae-1810-426c-1c43-08dec798eba7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB5466
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5MCBTYWx0ZWRfX1YOlz0gYvaWA
 pqJK/Rz+6M2CPwYxnfViafv/w6vULhzKJyieM3zAMATCjRHvi8uOP6yPZDLZ73/RCsr7WQUP07T
 XhHCyUmcxr545FH95zz35wQKw4/aSmw=
X-Authority-Analysis: v=2.4 cv=UL7t2ify c=1 sm=1 tr=0 ts=6a2a7aee cx=c_pps
 a=PlzX2GN61/O3EU/AUs1JWA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=Byx-y9mGAAAA:8 a=w1d2syhTAAAA:8 a=lZYJU8pvC9hwlIyoTJkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5MCBTYWx0ZWRfXzibIRgP+xTQA
 9qQ1wi/+y0QESpoxCImjEPRPqG3JL7kGWwFR6+X/i8MA3ks6SQhu9s7sXpa3HABNeoQdIsITivh
 jPLGPp+3Mfb6CcxFlLafGfdxNtYlxUqn3b0XNEJNtxheMKlPUhk1tB6fs6xFiMicLGaRx2pLt4X
 NZ0vqgbIEnAahjG4tl8GHCC4jVDvY9w/Mb9ZVrtQrIQRXsIh9XnhbvsxR9UcXYsCNZxHorlBcTo
 Wc+dviYANWp+RGFU0cz/Jcvowv0Sts+I+MOhd9qHP9ZKgzBu1olbJ8RJItFtjE4lmSikpofivXV
 2YjFbrJU0RaPEWvnmXBKwgqySyPBBRFRVUoTs3AujlUhKQQZ4ulalApHA/eFnV09Bb5ca5TZDJP
 k8tGrYGRJkwtl0PbMg/uydk8IrH29PcxsQ1lNcU2v8wTw+qOmc1Vfv4vWt196OrVHfrMT5AIdvk
 KWn28gW7UFoWz2kwPEw==
X-Proofpoint-GUID: hcPDz-WaNnpcDPv3DbE5OVhGO6-IiplQ
X-Proofpoint-ORIG-GUID: hcPDz-WaNnpcDPv3DbE5OVhGO6-IiplQ
X-Proofpoint-Spam-Reason: safe

On Thu, Jun 11, 2026 at 10:37:57AM +0800, Kean Ren wrote:
> sdca_dev_unregister_functions() iterates over all SDCA function
> descriptors and calls sdca_dev_unregister() on each func_dev without
> checking for NULL. When a function registration has failed partway
> through, or the device cleanup races with probe deferral, func_dev
> entries may be NULL, leading to a kernel oops:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000040
>   RIP: 0010:device_del+0x1e/0x3e0
>   Call Trace:
>    sdca_dev_unregister_functions+0x37/0x60 [snd_soc_sdca]
>    release_nodes+0x35/0xb0
>    devres_release_all+0x90/0x100
>    device_unbind_cleanup+0xe/0x80
>    device_release_driver_internal+0x1c1/0x200
>    bus_remove_device+0xc6/0x130
>    device_del+0x161/0x3e0
>    device_unregister+0x17/0x60
>    sdw_delete_slave+0xb6/0xd0 [soundwire_bus]
>    sdw_bus_master_delete+0x1e/0x50 [soundwire_bus]
>    ...
>    sof_probe_work+0x19/0x30 [snd_sof]
> 
> This was observed on a Lenovo ThinkPad X1 Carbon G14 (Panther Lake)
> with the SOF audio driver probe failing due to missing Panther Lake
> firmware, causing the subsequent cleanup of SoundWire devices to
> trigger the crash.
> 
> Fix this with three changes:
> 
> 1) Add a NULL guard in sdca_dev_unregister() so that callers do not
>    need to pre-validate the pointer (defense in depth).
> 
> 2) In sdca_dev_unregister_functions(), skip NULL func_dev entries
>    and clear func_dev to NULL after unregistration, making the
>    function idempotent and safe against double-invocation.
> 
> 3) In sdca_dev_register_functions(), roll back all previously
>    registered functions when a later one fails, so the function
>    array is never left in a partially-populated state.
> 
> Fixes: 4496d1c65bad ("ASoC: SDCA: add function devices")
> Signed-off-by: Kean Ren <rh_king@163.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
