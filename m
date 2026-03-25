Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F6D39BFE4
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436341; cv=fail; b=OSasd2VA9TGCQZZqYFfspSU3Sik5BvShxOJjqLrH9s3J3V7IoabJD+YCN5thyT4KTkvDYb9wt1GwmvvHES5IKcUOBLflQjxuHKPynBezIGUc42L8/VVkalM78e7fm6h+h3e/q63z/otD8ne6BY63lJJAS9nhHUrvUv/fA6+kw8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436341; c=relaxed/simple;
	bh=HJlJJH3NHtJUQ0Jx/77X9wKhabjsuRLQ+nxnX9cR2qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0zLVxAOdmFfJLcl7qY+DbeESc+Gu8sZQ4LQM5vIMo8rswtVhpgSI52YskypntG+KzLUVXYkazddQ0rsXzxew7/cCMWNIVCT+zmElm5RmZhk123dQgz8izmW6YiT6CfS80b8QtF31k7VloHk049aQ53nTk6whopK+U/tQCbfywE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=akz0TUK2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NWNfgFbQ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="akz0TUK2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NWNfgFbQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4hX4u1131043;
	Wed, 25 Mar 2026 05:58:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+P5hkK4UkLJDNKU4YS9V0V5hmm9J9InyXAtTHn2HcOY=; b=
	akz0TUK2paz7RO8h+K/XdhNKwWe3+mT7XqgnUz7inDk9Vr7S6atN1XuUCQfrjcVy
	0cSqFiZn/VF8hKFHZHdf9PL7b3SSgGijSYtR9NkakYYK7eqtDLOdKmZe+CjalS6H
	Rqfs3Zm4sCzEVC+PBMRUGZodt3sJKRu8044J+Gt8ZLjXPv1Vh/26Rwq795euJfJ1
	BdmXanMfiTEJeZIQoq2MBVFvqWX+nAM/NGFtWVpAhakfMk8dtjoZumJyU/X7OB05
	BHGdZYVxaHijPe2XFDwwgslq4WuYJlIAZn1RRREOoyQNPL7xmVroB07+WM/8h4Y4
	Oa61Wz3WqZAs4GVi42ixoA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021123.outbound.protection.outlook.com [52.101.52.123])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d1rqxvjak-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 05:58:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBOrkrSsJcAdiogaEME4ArrWtzdOa9e89I03/WHPletwj9cjqgpIfwJSOJZpIIpOz4PSR2sNwcOyopv6EZedqevV4mLtS8R+3U/3/OQg/RDJZsMJddQB5az4nEB8H1F9vUZbOigMrBWu6H49xgbvVjdEUNYH4hQQVXvR2qsUVcvqOC4WNWvN6QELb6+K3f4LqAQ6OrUMyzYU0Sbf03HGL6uymgSd0UUNYTd6mARiGArdUX+j/4dgtoUb5BEvv6hnsD4vjKauDwU85ldWcY1kViXBnUBE7OQ3Rx3OqJXIvafI/UOPMoGBHnbtFXROYGCceYsVJBkUi0y7zYAZNOwayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+P5hkK4UkLJDNKU4YS9V0V5hmm9J9InyXAtTHn2HcOY=;
 b=lWTOwOM6rGfvoZtj+jqlocbKKQataxtdnCycwi5YIdi1Gd8l+dAmxqPxhZ1/21FOwQpApxdEUYlUOurwNnhyymmPMF7k7E+JCklFodcKrAQ3dfldUUZrf0X0+SWjt/rte+BEzrNfAtql76nu+njCqKEokSN6EzBeMAvNPBAs19OiLtMhY6bNcd0YvvFjubCLFWLypL8+7oYs8RS2MSthsAL/cD93J+DcDZjEfdit8/45IsYFxsAi7G6ljEs/0Nv3LhRekpQm4IiB/kL+yNDcxK1dgBfBZYrwWpUFWSxLQmc1oJP3x0jqPMgsPpxW15u1tMXD38ZuIHjZmtfVf14tJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+P5hkK4UkLJDNKU4YS9V0V5hmm9J9InyXAtTHn2HcOY=;
 b=NWNfgFbQj5Vr71KydyqEI7ktYt4BBzvh69g0gPPJiTLmxhhGT7eMqro0MJyg9X2obtKeapO0XFxpyyAVnQMQLTqlEqMNTjqamZf9f1C8MbyjhUV1psiSG38BXAOWgkzZDxxY5fN9a/okMssqy1uW4CQ28Dvb56btigePkSmepi0=
Received: from MN2PR04CA0017.namprd04.prod.outlook.com (2603:10b6:208:d4::30)
 by PH8PR19MB7000.namprd19.prod.outlook.com (2603:10b6:510:227::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 10:58:21 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:d4:cafe::a4) by MN2PR04CA0017.outlook.office365.com
 (2603:10b6:208:d4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 10:58:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Wed, 25 Mar 2026 10:58:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1B43B40654A;
	Wed, 25 Mar 2026 10:58:19 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F1487820247;
	Wed, 25 Mar 2026 10:58:18 +0000 (UTC)
Date: Wed, 25 Mar 2026 10:58:17 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: SDCA: remove the max count of initialization
 table
Message-ID: <acO/yaoSOJDijWB+@opensource.cirrus.com>
References: <20260325092017.3221640-1-shumingf@realtek.com>
 <acOyOZ4fxUoQ0p5L@opensource.cirrus.com>
 <1bdba8facd57429ca8a191dcd0496c5e@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bdba8facd57429ca8a191dcd0496c5e@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|PH8PR19MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: 423b8082-847a-4894-0ecc-08de8a5d6d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|376014|18002099003|16102099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hJu5PzJDAUppJe6XA5QoB1jXvaP5p7/jo12DimRrwJr6OZsBmjSw0iTlx7LcpIeFjhPCHB2hEKJXI26HIQ8xX0xJHbE70wDDcw19uZz9ZtZICqOORQkw6ESW51Jfl6ja0w9xe1mcAvmZIfj3yc6Ve4oDVfs34S44TxtUnXyCrKn3A9ZVW8W9WW5VPPRXyThUww/B8I0mRTHFUiKFFS+ptlFi7L9njY5mUn9eiZCAcERXbp9rSGbVvcbZtQ+DBYxHf35Qiz6ivv+5iaPUeidSlipUQ+9U0mF21etYQE62unce2nTd48QLEN7TMXsW+JtFLL2USSw/nwrJr0qWMjqUXhbcA8PyTQX2QCvPSQIm2nmbyz84QMJTzlDAwCevaYh0UxIMcbmRFCoXVaMlJQRdJ8MIa9g9z/l2Y8AXB/emPHb/SX805rLdtJhoqWMhjRp/w5v95XmIBU0nNg6k9ihLsYU4e876vw7TJnY2Nybr3TmqterxxXMfmVgRdA/oM5r7ZhFE0Jo9QG32q9GBsuk1Wc1WzbzZ1L1vtTXN/uGfZaHrvry6B23T2YojhqIcC5+aeFdb5AmSpacBrBcclZFdiBxMxxl6M8dyEZN3vKcFlHhR47rRiH8mAu6h++AdRQq2vm8Ko9SHQgTyB9HSHymSsIQs2q4V764w2lt3nRt+m/k9DDi9XKWC98dLqXt12ARSCsfk7aXC6K8iQu2pDFFAGJC57RmoWtndPsaWEiO9kJFUoaxRsuAZQ6OkjHet5RAhiIjvcGyZDr63kQXuu9s1Og==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(376014)(18002099003)(16102099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e1ZqX1vyU+425MgfyJDHUgfmiHkwSvRGQJygel5xjZolVEN0Ye4UqktRfBg6IUl754MknWaATxIyQ/DMV29DdF9oR48H18aQIlf8SzLRPefBkrydmf1BxJmp1IuMnF7wLP1roLCWS7T7N7LGXUmbo7keDOYeqb355gLvSBh/NWm3R7AbMEeWdU0wMnJQQ5p6bJIvX3m2t49wFZ9Bua3zBE2cCKZPlM9DW/n0WB1EkEZpfMTHAYuR7CcIT95EVAI05Lmeq1GkR5CPnJJ3yI5JR27ANMzNq0hJg7OPMo7Di7jBgWsHjK5Dkd3AWM2tIXGA5hJQbOXVJnT/QuWFbwtIY5QsQO5WdTMDlCCnjsBLcIjkkqNSxSn/JBwb9Qbkcm58TdTSofrV0iC1OTS8jA1eOn+oUotqtIo/7JD3LgTyumkhxMKND7Zl09syaaLz2PEx
X-Exchange-RoutingPolicyChecked:
	ipH4HC30Rmb6QxgGIHzcUVQhHgfjqt1VTZHYNXfmOIS8Mma39jz1YGdf5S8i6TnEmrJnFjSCSsYOQsfnFPc1hMfJBWfGT3jQvzm6vbrLo8yxgYbFKbAxdaR9j7TeuP52qhTFB0Z98mwVT2WobdquihVi8fFL1UDnEygCrXt+4RfLuqF71nM6wJVNYn9MstYhVD4MIidYiZQ820R2XcPBs+GsOv8/rc+wyCi6iXnACSTnWCZE8OzrYyZSkQ13UIQick037fFw6ZyM6EXmttGZJnDSHqu2UeV1mqxIfEHs+dmmdeTl//4XnNJ60V3I0pK2T0iheqG5So3bssIIQ5ehCg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:58:20.3915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 423b8082-847a-4894-0ecc-08de8a5d6d72
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7000
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3NyBTYWx0ZWRfX2Mkp0wMdAZdJ
 QFfDTps7uHtSDUB/wHmpa03lzrrgZgUZGs53BV/6J5qG5rWKfCr2CgRsXvj1ITq51GpFbYuMhdL
 KiwMSp4JhEas8g2TLaEJfeJRJcYNOd49X/pIP9XwJe5p9oyqQH1Sj1vQrn6M8TBDBgXI/qYZtDk
 OaPXc3Yy5m391y1jkNtkxMS6rRFqlFpBIJtmBKbdVK70GVmj4JSb1maCgmgkBWooLN6tADhoKIF
 1te/JqQB69FCi+VtdZt4VSxeD/7Hprnvq75X1VCqaHp2jKNg9vWUFNfEBRzl01WYK1LYPTi/FrC
 kfA1BLOmh4BDUrHHumjONbKujALXymcdFpeWyoYTDEm055LVyhzEsirlvIqrqyBHYkUKso/nINO
 +9pqy5KmFXpW0K4JR0C8tDvtBBJ0k9yCyp9o6dUYPUsBWMjhvHvJ7ZDZJW/Z0PfoyYtZpKqnN1o
 jfqgSg/Ok/Eu9geefCw==
X-Authority-Analysis: v=2.4 cv=DKiCIiNb c=1 sm=1 tr=0 ts=69c3bfd1 cx=c_pps
 a=bglwlcmNSKUHFS6lfo7hMQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=OIlLfe7X91VnkKfxfAQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: BzcFTkXsKjxKoW7b45E435ALTYqPbJ8m
X-Proofpoint-GUID: BzcFTkXsKjxKoW7b45E435ALTYqPbJ8m
X-Proofpoint-Spam-Reason: safe

On Wed, Mar 25, 2026 at 10:51:24AM +0000, Shuming [范書銘] wrote:
> > On Wed, Mar 25, 2026 at 05:20:17PM +0800, shumingf@realtek.com wrote:
> > > From: Shuming Fan <shumingf@realtek.com>
> > > The number of the initialization table may exceed 2048.
> > > Therefore, this patch removes the limitation and allows the driver to
> > > allocate memory dynamically based on the size of the initialization table.
> > 
> > We were concerned this might be a little too low. Are we sure we want to
> > remove the limit rather than just increasing the allowed size? I feel like I can
> > see arguments for both ways, on one hand this is input to the driver rather
> > than part of it so it feels sensible to sanity check it, on the other hand its the
> > BIOS so really we should be able to trust that.
> 
> I think we should trust the BIOS.
> If the BIOS is updated, the number may increase.
> It's difficult to define a fixed value for this argument.

Alright, lets go with that then.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
