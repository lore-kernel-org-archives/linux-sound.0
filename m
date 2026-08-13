Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F61397689;
	Thu, 13 Aug 2026 08:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610162; cv=fail; b=LQczEG4rSsIZk5uZTvCUrjYbjkY4c5m/ROLXKvK9nvnTbMQ1dneHd/PNkLQR9qY+KhcMk9TwSipZ7g09hgQL8E7v8SXOAcoMGwjvwI8Wr1cuVz9p+Wt3I3PDaFJWuZ7st+k1nCR0vzTMeiqNXQKWtOzMtskxJerl5ez+E9HqU7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610162; c=relaxed/simple;
	bh=IdPjnoJ8343N0765TRsJwmLZ/HMID2tyIpwi0u05+oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcOREGgyYCdRltAY0JYjxjWHPzDWtKyFUE+CFkPKLfNzHRcWMhgP04GFlaKPV5gB/7RNoAlTXcUGRUo8j5xG6bwv4F7dwoqV6Nxf8aDpk7QV0wcVqpCyHxxtEmOhW4eF7+RLfY6cYX3lFuArSqfDQKdu1Brigq31AxX2UoqSIEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=m85T5+9o; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ew6MLzt7; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="m85T5+9o";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ew6MLzt7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5LCux2203058;
	Thu, 13 Aug 2026 03:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=pSixfwyUWk+XVVYrDN
	BMTjSm0+PtmBbF0V9hG2Qu9Yc=; b=m85T5+9oUJMGjXDnXT8OgEF0VxDmWqKQqK
	X2r585PurIfCepbQE8GDatLnuLaf9WoEyXuLoRnafYNblgif2nSEJqBROF20MWJQ
	yih1MGWOZB9D1MaUR9jlJKR2RjGI7zP1cOeXDwYYyfScIigCUODJCHs5/couszjX
	jy578WwtuA65P5gIwAswy26nKS8SVRrWcKdUpTN/w7LZ5SvijzKFIEHsx070OUZU
	Fo5tvxtPKauv1HvvJ1oy7mAXQy/1HHBsidtBCabBNf1ch2nTm+hOCPh6djEvICNq
	tryiRPD2SSXYtGz+Os02NiJiRYOK6cHeAmtMDZh3GHeYgDC8RO/Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020072.outbound.protection.outlook.com [40.93.198.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g0msjt3fd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 03:35:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hINPLank7EUIkis8PnXZqk+L9AIPjWJPFy/hYcBYLVG/PZm8aiuaa5YlYOB+hk0NmZt+gHV/BU6+YeYMxWZVwbm7GGRi1OUT/jlgqyTCI3Xn9R0ewb7e/PFwTtRI5uYiB2JfF3xj9owl0ikKJJziRKBR1AWoEng+WlUmeJPoFI9//pdzFlROYtckW3cjLxl/US2PJ5e+12sbinjNYSWJ/PBEnAiHfELZ95lSUa7ZXciGqb8JjOUs+VcUNlyUcmGIEhLDfxy8hM2GPrO5gNA7arNdDBOepvFOb/y2w5Yl22ep4DeQc6VuQnU91YnV9SgUN+2PGo6qf2soycgM9DEikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSixfwyUWk+XVVYrDNBMTjSm0+PtmBbF0V9hG2Qu9Yc=;
 b=ZIG0u2wqo6BAYCdjSncrJHL8evBA2wyPNatrnCoY8pL2t5E8T1luKkROncicoxie1RmfWGb5V5NQm3shEwOJ+Do/i+FBKeNXMUg6o6x45mowtQ9iqmgUPP7MeHuZVibLyQS6UO+ws4vGi/z4q3N9KB36vSEQ/MfRZ4TZA76bzj0ZBgGgtDKjpTj9ZYz5fVw6TP88cdMfuMtVUxKF9bWrZrirYD/aD9jBAb8aVT0yJmHy8Idgpq2JSXa5PEHVNrckTkb/A6qLU1FQ7XGCdmd6V3ZqBe8CGBjTzzBO6J7L0nq5aGjpUjbJ/AeDsCV1C83pk8smMGBN/Hk5RLT0x8dnvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSixfwyUWk+XVVYrDNBMTjSm0+PtmBbF0V9hG2Qu9Yc=;
 b=ew6MLzt7hsP5H57SBqzDrUmgJOrFF4SAU60YBEeIVLVwG5+O82RDu3UATOcEMP7H+3P2xAp8v+Mip6Lv+ga2ltQittNKDJmdMY4hh5fMJucGIJgewnGZ6/htNBn1xCOOPNn8+Q4O2XQ2qCZKpdWE+PIUj0TiG4Uom282wAq7P4s=
Received: from SJ0PR05CA0205.namprd05.prod.outlook.com (2603:10b6:a03:330::30)
 by PH7PR19MB6064.namprd19.prod.outlook.com (2603:10b6:510:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 08:35:21 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::4c) by SJ0PR05CA0205.outlook.office365.com
 (2603:10b6:a03:330::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Thu,
 13 Aug 2026 08:35:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 13 Aug 2026 08:35:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E2672406540;
	Thu, 13 Aug 2026 08:35:18 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C5F7A820247;
	Thu, 13 Aug 2026 08:35:18 +0000 (UTC)
Date: Thu, 13 Aug 2026 09:35:17 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: yaolu@kylinos.cn
Cc: mstrozek@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
        broonie@kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] ASoC: SDCA: Add stub for sdca_fdl_free_state()
Message-ID: <an2BxXwxgAZtj0jb@opensource.cirrus.com>
References: <20260813012636.29735-1-yaolu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813012636.29735-1-yaolu@kylinos.cn>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|PH7PR19MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: ac682b73-437b-43a0-aa08-08def915cf9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|61400799027|376014|36860700016|13003099007|56012099006|11063799006|10067099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	OZsHwV4XA2pwblbMqEXSvBPxhWSTCrYy8juZFabDBx77N0rw9MnXTXAFuGHH/HLdPfMSpRtMDsGro9X2pigWXMTtwx5IdM1YntpDXMD7obcQ1HaRFaxeRyzclJqJHV3Ay6Ohkqor6VEpyRlRYyFTgTXOMnYPg2601pjYJtTfuvXM5Wl9Ja3hyuzLlzuvnt7dpcPFYmKAvyoc3wQzo4blcblCFsijI/zjziSit+60JdEJdsJ/h4u0G+yT6P+x05rCz4N6KTDzNVudrO6Lb5aUm/kaPyzL0wkdRaj+F5EuUOq1deL60PxDVI7MHEje8idXkgU+7GT/N2wTXU/u7wisiBQ57VJ79wVUcngOagcoQCxwYTuwuiQZt04DSZyulYDKPgwV/l+HwcdPaDKNOtkqU4Q+99+85WTEehlgBOdLTpnCBAfUWhhVEARxTRiMx0KjkVeM1kJHTNJNvEzhrbRiCcI+b9jEDOo3sz6KEAw8iKhXQhsZ/SzMaoF+bLRgFC7leP2SjG8K3/AeYp3kvPmDwjfm3fyaXh14soH1sFYVR+MX+dcohXW1wVOvWXR8jzoMyOtJXIeU+G6VCxI5TROwR1KvoZYqN2uFBPpdEWiLMD3d+fn99acM8BijXRyoNQnmljaE7dHU+yB7y7MddFmwJuDLoBVfTJ7bEw+VDDxQzYo=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(61400799027)(376014)(36860700016)(13003099007)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QGmr0VmbMQmp+9GhEzOavdX0pOaMeI3+DbBoMhMjEbYWtuFgeUsbu0+OKJSVOPiZPNdJXnozP14bNGKN5j9+bnjAclXU9ruz+NDWlbZ6F5R/LzVdC8RVjFeppoIdUNrcAxF8ruZWBGn7UFTjzHHaVq8Z7h/8n+h57pfzpT6uX+vaxXtzI/kjzzJk9Uksbj6Np2C6Ok8VWnb0rSXolr6+iS+iMbCqX+UsQ2SzppUNbTj1IawkHWEruNGbrB6sn1cS9DghctcqTJf8rY10+ihEBFva7lkjD+lM+WqYfjHgNKehVlsdZV2jCRz23+sOByuaCXEvaG7GAz5ukPEGUwWn/b1g8+iJlvOQP1nyKy3YT+IYILtX/xuhtrbpvZGoGV4IyilvEg6E/QgK4a9HIFIHe5t5OMpy8ebvwCKTHBjuk0eCe8N2udMP5L17j/i7Sud+
X-Exchange-RoutingPolicyChecked:
	LKiUKchidny/xFOQbzQjetVjrxTll3NUh+DlfjMJTv19eKzFoI/OmOZdfZV92fs0Wr5W4hTS2+ixczroh3rQiDijSi+/7/sLd5jaL2sBk7RyaDgFnYTcPVHnLzmjWlywPweOREvb3qyoi1u2rFu1AZ8tqkEWJrqTNGltzD2Txhm7ETvmcoTEiQxMQxNeygo7ECu7rRKIFKF283Eo3eatw8ajyIDknIiITpq6DlzxYcdS91c13SEkHJYlo75nuKaecvFAu3Wv5wX9ypV60P85cb3n6r7KNaAdyZPodSuDw04h1iCNU2KRCRM1/3WNuMyctH5l9BZFrG8jfuVtEvHgfA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 08:35:20.2742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac682b73-437b-43a0-aa08-08def915cf9c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6064
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1OSBTYWx0ZWRfX1ID3lVWwhbHP
 oXVsrt7DjwGOAlRqAh1axblgRdHp1APTF2q4UMJgyxt3R18lesJpRSiRpKf8X1x+I7Rq9ZNId+c
 hry99h0Pcr1t8wFYkvOtPB3hMeCPtAW9JQA7P7cC1Vaj9ZTz3z+5T9T5MFvkkwG2og+krnJTeyA
 sGN77jKFpKnVzYVTwvWVpYTK6HzVL1bukYy0i2+K23pisckMKgshQP9YeNf/i0x9U/XClySAyZA
 kLHBXpkbx7a/mNqm/4HrRWiOv0JS9N7PV3Ku2yI++UD5YWIdXgJMJ3a5PRrURFGnRM8GtsC61uC
 iaLKtC2sfnFKmaEIUIOGSLv+FzIIgOIg6mfoE5oZv1vKrKagMqydoMqVKW8YGiHQf0UBY4TzJ/v
 sV19dW0ulGiebUOWPh4CiVTg2fH11cyT3mVKhmeSg5vNn06IcSvlA5EA39Q5PUlfTYNI+mJjKIs
 81PkhjfZH+YAlWfgvkA==
X-Proofpoint-GUID: jRtCswH3JV3q3u_A3nhg6WhN5lV2kcsG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1OSBTYWx0ZWRfX/wz8hGaVamkD
 29vja0fWTBuvoBcZLKWL+vf+XVvm6w/tLZW8vxP1yHZg1lcCPk+M7zb90472WXCwsDeSNJkQqUb
 Nq8XaC1atlicusB3vQOtsPhaCa7w8FI=
X-Authority-Analysis: v=2.4 cv=VdTH+lp9 c=1 sm=1 tr=0 ts=6a7d81cf cx=c_pps
 a=0/0ATQE1JRcUx1QjezCFVg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=uySg89yYIDrsokKCxQ8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: jRtCswH3JV3q3u_A3nhg6WhN5lV2kcsG
X-Proofpoint-Spam-Reason: safe

On Thu, Aug 13, 2026 at 09:26:36AM +0800, yaolu@kylinos.cn wrote:
> From: Lu Yao <yaolu@kylinos.cn>
> 
> Commit 0880082c27b6 ("ASoC: SDCA: Remove devm from primary IRQ
> cleanup") added a call to sdca_fdl_free_state() in sdca_interrupts.c,
> but only declared it in the CONFIG_SND_SOC_SDCA_FDL enabled section of
> sdca_fdl.h. Building SDCA IRQ support without FDL support therefore
> fails with:
> 
>   sound/soc/sdca/sdca_interrupts.c:471:56: error: 'sdca_fdl_free_state' undeclared (first use in this function); did you mean 'sdca_jack_free_state'?
> 
> Fixes: 0880082c27b6 ("ASoC: SDCA: Remove devm from primary IRQ cleanup")
> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> ---

This was already fixed here:
https://lore.kernel.org/linux-sound/20260730130602.3747053-1-ckeepax@opensource.cirrus.com/T/#u

Thanks,
Charles
