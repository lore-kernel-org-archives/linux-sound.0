Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8129345751;
	Wed, 28 Jan 2026 09:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769592320; cv=fail; b=n0Texw350/rMamwhJIkV/hUCpOVzKlMuPAEqMmmrNK7eY/DzPJMZFyqGw3gYMTL9tawveA2HExaKFSxRAs798QbajJGADShtW4XuOe9A6X1dJcwsuBSOVxvybeIITf8/dYgKttaPyzHTQIhyO0fDqEpOiVJgjolxLESbuTTVzWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769592320; c=relaxed/simple;
	bh=0rJueTyXNhdYYI8rt6ih76OHPE7ABfozkMptnhvgeK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIif6dgv6Uu9Xtfg6U0kLk/JKZQaaN06FaTtk2QwuGYSFO6Wp5jUVlqwP4QzcMtQabRS5xB5umTM2JTOJoo1FBm4cr8ria9GKu6EZ3t0G6EOiauoDYDWLo4xvBKTNA3RT1ulEzoOBF/Q8oAHRoXeInGe+R5ELd2257IJM3Jqh+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dxiu91Xf; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=sapxmfll; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dxiu91Xf";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="sapxmfll"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S94NBI2973354;
	Wed, 28 Jan 2026 03:24:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ZSO/yL3CI/ezNvphgX
	OW656YSPR3KPw63UBzquNeKPE=; b=dxiu91XfjSp9fygQ4YHGvqyYPpCFXrUvyj
	CaKL7s1YlQKem6jjuqwtAjiBNogeLxZ4uyzyt93WDTdXvfRaho4VVH6FKrA2bmJs
	yLkRyh6R9sC81jaW5uZ4nohFhFZu5IXWWeecFjULCK+RTZ6rwEu6R/QPT7dPZGTf
	QZ8tNMGj342Zo9KY9TofKAR95454flgEeAeJ8RtCc1e+xDhnXxeQ2Gm4ODrFBKpt
	DM59t6q3mW9Bh9OF8t7Fn044dGx3WJqUlRLsp7OVgivecQSUdyuIYuQAZunmESeQ
	Jg2lEICMsDRQyNC70RaYq8iXbtflTc9Ln9qdkAG5tuajJNat2siQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022110.outbound.protection.outlook.com [40.107.209.110])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bvvc03ygf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 03:24:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogNTm1mcnZX6KNhiYZhDjSvW5WJBik24TusXLdYJir+aIPLcgDcKPnbOvmM35Dld6oVrcB5+Z0R7OETL+sXrsqXzlrJAIteZQzy50VItbrW6j5u8Gig4eX//Lz56Mj1fQj0NR24U25m7D04UHy36MUlNSt3mdT3cnhICBuapsGVQyT6Km8ak27dqRwVWr9ME8fqzTW7Yh1F2kZwS6GuSUAxyGoNjK2uBQfJrT5KDtxBkRjMdcjdd8OIsSpbeY8W+tq1YAD7W364ZAiWvYhpcYM5OLGPcnEUXh2buZKGkbScTJm3YZl+N9VUs6k69KfSONSA0pG1+s4iMEtmWFhiwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSO/yL3CI/ezNvphgXOW656YSPR3KPw63UBzquNeKPE=;
 b=Y8PPfbQY1hKXYfawvZySiIFuaZbsr8TVLgO6nD5e3+anBtgLoPkKoN4KKa5zouy+nuDLAA21Wo31tfa5N41cVswRRLUUAf0bJK6ViK2z4ynBJ1mFogRUlZzH5amxa4sjfVka0nkpi3/5tMn1vR7IQ2BJIg5nY1+jEU3xYfWLp1k9uHhBL8anqXA2CsD9vhXFYi2BWOGvpMlnJg/7M1nloZOlw9MQHohofGt4EkDiOUHA+gFwsT1P94dco8lZUF0Isa1mmOuyi+bHOJ2qBrNiGLKMRp0gD/0OskcIvp9V/mew57lsKSqss9OQZjV58TiByHK4oaZQUKFQsWXoeZElFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSO/yL3CI/ezNvphgXOW656YSPR3KPw63UBzquNeKPE=;
 b=sapxmfllwd+7cwcB1AlepTlIfPcMPRcUFrwgkg7zLGhebCzfvUQuI6jVOSJu7MSo4px6GluPcG7gjzb9GmaFchYKrhtulZHiogakHFsEEwa86ZbuJvPuvYDKIFPd+16jn4xwThdfFBZRi9EzS/7HFBNEREYudRVolbBv4BFGVUA=
Received: from BY5PR17CA0061.namprd17.prod.outlook.com (2603:10b6:a03:167::38)
 by CH9PR19MB9706.namprd19.prod.outlook.com (2603:10b6:610:2e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 09:24:55 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:167:cafe::68) by BY5PR17CA0061.outlook.office365.com
 (2603:10b6:a03:167::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.15 via Frontend Transport; Wed,
 28 Jan 2026 09:24:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Wed, 28 Jan 2026 09:24:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 491AF406541;
	Wed, 28 Jan 2026 09:24:52 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 35D2C820259;
	Wed, 28 Jan 2026 09:24:52 +0000 (UTC)
Date: Wed, 28 Jan 2026 09:24:46 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        kuninori.morimoto.gx@renesas.com, sebastian.krzyszkowiak@puri.sm,
        brgl@kernel.org, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Subject: Re: [PATCH v2] ASoC: wm8962: add .set_tdm_slot callback function
Message-ID: <aXnV3hnKg6vTktbM@opensource.cirrus.com>
References: <20260128025955.2562331-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128025955.2562331-1-shengjiu.wang@nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|CH9PR19MB9706:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f5934c-0c60-4e52-0308-08de5e4f18b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1Xjq+/utU7xhKi7ilNcjboyZaOMdfdba/NpIXlGpvhveZJ7A5IknG+9x8B7C?=
 =?us-ascii?Q?YARBc29Q/dH175wdnWGoynfE5FdU0K1VippI46e4h/Nyartw2hy5GXrpvwdP?=
 =?us-ascii?Q?wAxRyySZi1tBpe7iWVtXCpdQqj8rKpsFjuxLMneKRgSuzWBhhg7rKOztgW7R?=
 =?us-ascii?Q?OYgW64QFZgWAHIHlkvw0+J+xTC7W/1nVgduS+GTB/96g7b5+XjlR8mGIutX/?=
 =?us-ascii?Q?poutZZV2RnM7SJlSudwiP9irV4rzeO6bi1aOjl0WdnIezmYPIsYRCiY9L6hg?=
 =?us-ascii?Q?wMUN1qFnnXlAcZN4c/LzUfOxcUmDal4QRlXabayjpWNc+PVBEic/Bb7G2+nt?=
 =?us-ascii?Q?O/lWrVGpVO/MsR73Fkc0o6stJR5YEMHtWh2loHVMH+8SRyukQC5GyJoWjSm6?=
 =?us-ascii?Q?44WS72mzsLleW7knduqB3b/2SFNUGhpa/KXb2hnPhQBsqrxeLquV2XMUNZuQ?=
 =?us-ascii?Q?Wq8Gv74mlGTzYYn2vq7nbAAvMMWBLZw33UB23yodBIoAHZbJEe6kmcuuL/e/?=
 =?us-ascii?Q?Zsuje045Vk71p0Hojgmdy2xWW4F5aRc0fhyHkzRQzU9vGrLPoBG7aBLDNzZr?=
 =?us-ascii?Q?s1agVRxQ3d67Oqf9kYD5cbMZ2AIV+2UKstHlazDctbG0cfS6OwiNnj03WQ1i?=
 =?us-ascii?Q?vLxA0FmzhUBN+BoCNl4tERxU+TEhwDOYEIuAxwut9+M+FQrd8mXy4Rkh/iFk?=
 =?us-ascii?Q?NsakwKPjB2vul3En66NqKyi+iLafZp6kmzFE7x+WNU6+mjQfeRntRGN8iyn/?=
 =?us-ascii?Q?k4AuBMAwLhAKudvQT0gG3aN2Q8lUqqRsPbO4C9v8QkhLDZOme/Lr9PUWsUE4?=
 =?us-ascii?Q?7RS0PZb51FDA8c7BjEDC+mN/mg+Pcs6pyBN/UZChwwvIhxw4l8wOL+ILwyHq?=
 =?us-ascii?Q?IL3ODDW0W+M47gAms11UkxOizfM+NayZmKCS/1wKKlWNLgC4zrpRXxXieXRr?=
 =?us-ascii?Q?YeHK3Z9aXZZdEflqh7wSOjDPtdNaG0MdeReJkLoKx0HmJCqY/lQfSJURFJFy?=
 =?us-ascii?Q?M4TZ+Ya3sm5ni2Auu1zcONK3NK4MbaZnXr8CQqAvF9ZqFCNwZnaZn1CQZQ2g?=
 =?us-ascii?Q?cMbGUeADpVfy9ABwbEEy7+GJPC55MhMtwKtQ90cGC7XUyiClcTYwNqlajI/k?=
 =?us-ascii?Q?y6gInqawbgVO1AWDPQShfqDlK2krdNaS76WAQnR5pO2iMVzMyvT0++Ctkqk7?=
 =?us-ascii?Q?kVZ/rjFGWiOt4YGO0FgX8UDT2bkQQCAM+SdNL87ww1GDOjX5hYYMjRX7ysz3?=
 =?us-ascii?Q?jq5bLSXyREYsssYYdiLCBnBVbjmlybQuuPVvzoJy5zWw1pEiGB42OIeEvpzi?=
 =?us-ascii?Q?2VcHksdzrP2VPbV2+kwRe5/3azvI2J4RF//egSuGUIjf+cxo757rh6Y8nS5B?=
 =?us-ascii?Q?bXWZOoPxFxPmv+T+cBfQ1tpVCYhdbFbNewbK4EbtCq2c3j34f5IT2bfS96yj?=
 =?us-ascii?Q?WFL08yoGb69brrklhKuELRnvgin0pIE28HJzvYlHruOY0BX4m0m/4+p8azqg?=
 =?us-ascii?Q?CioqStidSUoZu7VJUXAhAIMlmJwtLRjmEv8GNUc2iU5GWhdLRDwKWPB6seLA?=
 =?us-ascii?Q?t68fC+mSuwEEfqJONWQnmTdUEoVu2yJzQ/aAMxZiljLpMZkg6qlUgH25dPpI?=
 =?us-ascii?Q?Okt942YY/pvRjkqnhUKJdtLbrGY2LalXqyRztAUafz1FCHQwnKwHDW5OKZPs?=
 =?us-ascii?Q?9CpKrQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 09:24:53.9547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f5934c-0c60-4e52-0308-08de5e4f18b0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9706
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA3NiBTYWx0ZWRfXwAhQWEjHsLmH
 gzXp5DbartthNKbcN7HMmcpICx0btJ3OmctgUKfQQHD5aTIqXt97vnuEr2QRDjqIZV0rg2Ts16F
 DcPHqdgo2/380Y8JgPFpsBY9M/tHn6p7keUxdi6MS5zIOEsIN/sHg7LFQRwrtps0LKdMzo+r8Bl
 7J+8b8UhcI4QqBLXk2D1At+y1yc4SSzSMppTwC8Zw2J75l9bjqGWDPp2chUmCLGuwwUN7VMpU/Q
 C0mVXYkEdp083Oj8jc45fyvyhI0ntv/N6bqYyIqzCsFTC65ZKFSe9FtbXSsrcmC+4Jjb6T5+m5Q
 gHBMQUX6W2JNo8nJbBT47YozvNlU5FqmTerXUnNCj1JQHSuRzZk/wJrTcY9aX/SIkahcqJBI9A4
 n9pa/sH6X+s74IEdlzSbFjjSTGWNVxMpOfq/dCIDrOBV7sZ3ixOtVxyUTnIVKxDGQejDOYdVpWZ
 hLAubY9iUrzC48r2F6Q==
X-Proofpoint-GUID: xcEXPah1l66kUaIs5KgHGKyqXAVUg6Nw
X-Authority-Analysis: v=2.4 cv=KvBAGGWN c=1 sm=1 tr=0 ts=6979d5ea cx=c_pps
 a=YPF9ppAOZgAO0rRR16n0Ng==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=w1d2syhTAAAA:8
 a=Y22INAjB99xBzcTUZ2EA:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: xcEXPah1l66kUaIs5KgHGKyqXAVUg6Nw
X-Proofpoint-Spam-Reason: safe

On Wed, Jan 28, 2026 at 10:59:55AM +0800, Shengjiu Wang wrote:
> The slot_width can be different with the params_width(), for example,
> DSP_A mode, slot_width = 32, but data format is S16_LE, if the word
> length is configured to be 16, there is no sound on the right speaker.
> 
> So add .set_tdm_slot() callback function to configure the slot_width and
> update the word length according to slot_width in hw_params().
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
