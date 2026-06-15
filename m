Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D17D4071D6;
	Mon, 15 Jun 2026 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538604; cv=fail; b=eYnxyLN2NfLC6OWw8gyU3YF97cJk3VSkFAn2rNvzzJt6ihDBhQ3cHD0PmfxjjfKfI+mXTqld76EbnUd2zQvJcCXaNlr8xOHXY+lW78bRmNVRTrXoKBRyE15eyPotswsHrZ8oBer+dqC6Kip99GWkiTgp7ZaZmvoPvdZTGItAb+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538604; c=relaxed/simple;
	bh=UHZpO/0uaWmoSoGaEQJqXEjxP4Vo5CLmyqkK4x3eFao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuKmMc9OhGbMDfiTXwIFsLB8wjH54skdO+9AX8R6CfFnVfhcKKslMwEaiLrgWi/E3XL3WyShHlBesbRA4jcBSjqV+KSDvr9e546P1zikyBeLhoZIyn23Q4gKa2sQzOxI6tm4BbKR4xqKcf/PGQWWKFnBMthAhDkXmfA9UyyhXeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dUOQ8XWn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wGlQkS8/; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dUOQ8XWn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wGlQkS8/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCNY7r234109;
	Mon, 15 Jun 2026 10:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=UHZpO/0uaWmoSoGaEQ
	JqXEjxP4Vo5CLmyqkK4x3eFao=; b=dUOQ8XWngkNHyWuvSjllFVEyGbun/hw3X9
	3eWKHaWMaz9g48ltyRhpTOztug9bZYEjLIC2ZlbVttvpHyZqC2HR1N0YIqvVP2rO
	crGb4U+z1fzNAmT3T24KKuFq80vuj/oc+JXmZSWTY/SBRMcywrytHh0PJTNbLT9J
	B8bGBAhcPs/PLiiTxlhAPkNpCXc6p3RBsNr9sX0mWa6ZmmXohUGCmKbCXvLSCDrC
	cWNEjIpjD7seHbhCKJiY2j4A+yxwF7Aop2Fi7iWdiWiKVufNzQX+Ibt/COAnjn8c
	ihDpFFKZFj6na//EViA22d2I6UNR4BRAxQ7OBMHXZjz9ydNN6kFg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020133.outbound.protection.outlook.com [40.93.198.133])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4es4kvtdbe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 10:49:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsXO9Zs+UOpHrMBl2B8kCJ/MXNmfhSPU51h/2WSHQ83qf2y+bAlXoCDSnoYG5ZxWjyHpjjgTew5iZp0d3ueu05FxU7/WWuQCFQjbVrIDEa4YZUzLxI6jS+mUIEd5H8vjFYnAw6ffcRsh0DxYkvLNULADdkO0F9W7s6wQ+hbAPgAPdIUU+VrlGfRkqJdULoiBkuFo/MtnFlJktP0j/F4F0+dL1Nz/aYD6DEZaHcF4qbJWivKGZwOV8oBpv4Ecc2t4UuYFEDVsm5ZXe7yKKP+OL0zrv9a8fdKUqeVH6QlMe1sIyKRGhaSVtmkzwx7KkYhqRqaLSBqC12pivAD7xjpkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHZpO/0uaWmoSoGaEQJqXEjxP4Vo5CLmyqkK4x3eFao=;
 b=EWMgl/wli4conjIIGs8XZ2EWp7U6rfIHzIs468QSXrc2Wd0X95SC56BjESgJQi1oNKoBa6zhc8ydoq6jzurCfQai7CY4wdj6RG3GQPrN7zf6C+vh5rVQ3DWCfKqwjLSw5aYbJzMShB+EgXjKsAgG/SIFp/b4KRMER9EOZb0JXKDmUm5hNr32aomdaqGNlk4hOK812wi4bHTIahSq3laCLF9MHzKRwUgU7wUNj0GjyPOnUv50bHoAn70Ayc7CPGqa2EGCK1ZI09tN6VOYDItFY6lZpq3gDPSbHoDx/PL/f4DJo5RUJ1xzC96zaPDRIEQ/sVoy4GRpAlaC1cs3xD5rnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHZpO/0uaWmoSoGaEQJqXEjxP4Vo5CLmyqkK4x3eFao=;
 b=wGlQkS8/eSW18s+7XHtBwCnxm7RcH6tWifVDXwC8V2y18NPVRs9zkJjQoAaISWQ6yP/fo6q3ZDfd7/OWJvbmNklSft0JIUzKdFn5wKNsZMAEuzlENOLw5tHcf4nqDs+Rs7Y5pSJo4jCGDzX+7j/H2CqXbSweecNKlERPpFCt7vs=
Received: from SJ0PR05CA0187.namprd05.prod.outlook.com (2603:10b6:a03:330::12)
 by BLAPR19MB4498.namprd19.prod.outlook.com (2603:10b6:208:29a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 15:49:08 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::a8) by SJ0PR05CA0187.outlook.office365.com
 (2603:10b6:a03:330::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.7 via Frontend Transport; Mon, 15
 Jun 2026 15:49:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Mon, 15 Jun 2026 15:49:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 55A7A40654B;
	Mon, 15 Jun 2026 15:49:05 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 32EF582024A;
	Mon, 15 Jun 2026 15:49:05 +0000 (UTC)
Date: Mon, 15 Jun 2026 16:49:04 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        broonie@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH] soundwire: Correct ifdef for stub functions
Message-ID: <ajAe8DX6XnopzEb6@opensource.cirrus.com>
References: <20260615150523.4006982-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615150523.4006982-1-ckeepax@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|BLAPR19MB4498:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc32b77-454f-4ed8-f55d-08decaf5a22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|36860700016|82310400026|376014|23010399003|22082099003|18002099003|16102099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	c0czgxHuXW50W1z7Ug4XknCct6fxDVxCU7x9m0+Bpth/Xtz1Jj8gUUOwurvrHsXk6G8qyFKhCDoeuPeEyfwbeSIvFKqRJSXlzkeAehhHPxBg3c9q2GEVzZeSCR93pWsQRTCx6vtX/QwOgx6Cuq+gV071YXUFL2N24uWZxtaqys10le7CpXEYZlN9zLg2VmQGmxcrdRd08AmqFDwe03dhccjxez0b/NL1kjYpbMrpHQZWuaCX6OqJnhJDfvCDl/+yyJOjF0nBjGhY9UCEMn0GeWxDia3YA0JMutINBIQyfLaKAA8h4AgGDvU3oV1EpIf91aFiM8toyxC2B7ICB+i94BWhHLal4aWSJr0S1eKGPkEq4NRZ7MNQAXAmSVvUqvaDDwvof9JHlpQKU3Smk0FKFWO85imwixH7rZ+w8OfhPZzQ/NzNmtkD6uycl7/PNkXBcLpgO3u21g48sktBTy7sy4fjiipKy4rjx8NSvcrvJgyUqVXs5JbPWJgpHHQfLhdmpIjN5mXCNVTBy0c55HuHuiqNzW9dzU/0izi6GlI11KKydykLeE5BHmAW+KzMrpd7Q3KgyImCA61pKrZ/RotgcM/Vl159Qjx12vL51v+W50U+khNYinnF2XAmxEWWnWUwSfjmDu6vX7orS7UlNPDCeZsYMh7lbqOWYKOp0C7C55TDyvdukgipUTXscw4WVq24D3yM1VLPdiKj2cv+z3hVof2iCJAoAyh1cjI7e21aW7Y=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(36860700016)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(16102099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pHyBSPdDlizCELV9h7VFceK7Z1y1/TeJGMTURktoUQitcFkPhqfw0mTGJFINNZ2MwAYXV9vMkJ0GrcQ77kL/pZIREhElB2yAQq07PKDEH6myuP0qgJnEubThQqm1BKclMUYpS0+TSIweEjti8KfIxkVqm236e0e0yZHe7egLgWga/NPEN5gS0mt8ZjDJjOsnQtcy3ZZfdtmWAUH3NyExFNNVU9z92x/wjFNWHHCqz4GRFj0s/b5vmSQzbuSc81zYcwPb9AvjHNEyBnpIl45hJf6KuFLnWPJ/qk4dfUcB9kKzoFhIyrSYwvlsfY69prMkkB7/R7ddWpZNNnSn2WbHKheHsu1pptWl1z3OD8Ue2ORipRVdiB1zeVUzukaRdaTQ+llg8NUMnGa1L7tqMKxnrzDFhLrVTq31zKnvZCjvkll8wS1/4Ch/wwDUtNv91eBR
X-Exchange-RoutingPolicyChecked:
	bp8dP09YvithS7gmoa+CP+WFBIwNBo9qbSLwvS0nr4Renrh1UBUfUpqw6UWgoWxQ/Np6TkNYjr+GzBnvh510nXQEEGdl72Fspxl6P53a4VEZgQl6iHbugpaSu4HaSgJF8gt8GVWC2g1f5HlcexRigSQPasI319DWrtVn/OG2zjm7OnrfDJkFFJEx08WAmu9WUoR+fH2fBHGn0Lh/4w2Rg+zzjMlPGd+NFphxSZ/RJYSMbhKMlJRLXJGGvzhZW0hp2vw5elYNNOdTBada64dc/Mt88VZYXIknkaGTBqthjTmOwK9sOno0Pl0IWie7L2nGGFQS1jWOVbKmmACj1t4vEA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 15:49:06.6616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc32b77-454f-4ed8-f55d-08decaf5a22d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4498
X-Proofpoint-ORIG-GUID: rsxvkmzKh2zv3OAl_Fe8uFiPMz21p7v5
X-Proofpoint-GUID: rsxvkmzKh2zv3OAl_Fe8uFiPMz21p7v5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE2NiBTYWx0ZWRfX+T2etYr/EmCR
 NNRZWUzLFg1YrgQulrHmuulkd+BwTkRExG+JumUbcMKaUnJRjRk5frQc2ZIpoOdBs8rrNf+YUqS
 y1du7h1xbe6L/WKGNyV9szJR2MMx1I0D4zfnlYsk91fWqvbz65QPx0I57TsaMTwFlijcas5LYm4
 Ihzo2Y5NFT5Y/2HGqaz/6wZWcPDjTLpy+Mg2J7p75cEa21c0spg5O2aiaomA2EDz1reTdLSFVZ3
 4h9XYXTq37voTnXDo2nL9VpyxgqmAWfB1k1e0CnbWumGW8xhgTI/KpO3oBBPPPOhXAg2p9Fz9O5
 xORw8SYpRCyystxLK5SsqSRnJh4HtbmzuxXcvafL9wj01hfa5mOdVuQNUP7lHKSKM9p8X1VhgsW
 QFlGNjGxQlanN71xK5IUPRkgLPS7EurhmvBmlzCnYp9RzzepqNvDyIjUgzhAE+tIQf0p7hRq/rp
 PrPdYRh1jxhDRMoQqoQ==
X-Authority-Analysis: v=2.4 cv=JcSMa0KV c=1 sm=1 tr=0 ts=6a301ef8 cx=c_pps
 a=QtilNflqjlihrLF22repcA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=CcRBGMP-EeET9FvDZ1QA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE2NiBTYWx0ZWRfXzqinXgTqFztY
 1vGU98rx8YHIyJGYVR/BUe1Ur/8BeDJTckp4TYP0ZGxOrLG/3dp+KycUjtMHt51EEJDUAV7S2E9
 T4Mxk4ywPEzB6JvDs+f38PRhY+gXtgk=
X-Proofpoint-Spam-Reason: safe

On Mon, Jun 15, 2026 at 04:05:22PM +0100, Charles Keepax wrote:
> Currently the stubs for SoundWire functions are enabled using
> IS_ENABLED(). The trouble is if a driver intends to use the stubs
> it by definition also does not depend on SOUNDWIRE. This means a
> state can arise where SOUNDWIRE=m and DRIVER_CALLING_STUBS=y,
> leading to a link time failure. Update the stubs to use
> IS_REACHABLE such that the stubs will still be used in the
> above situation.

Feels like maybe I should have noted this can happen say for a
driver that has two control interfaces. For example the rt5682
(in the test robot report) has both an I2C and a SDW. If only the
I2C is selected but the driver calls stubbed functions from
common code. Typically these are gated in some way so they arn't
actually called in the non-soundwire case.

An alternative would be to add a dependency onto the driver to
ensure the two modules are compatible, but this felt like it
would cover more cases.

Thanks,
Charles
