Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2447387368;
	Tue, 13 Jan 2026 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302786; cv=fail; b=p3AWtFYw4/tLO69emVcD6uA3Rj6qRrLMA1nq3ZTQUi6PgasZ3bfa63cO69Gz3CkkAgNe5lVd13IKw6Vkqz+XOuzA8N0WvUfsPfRNXKqiFgUbQgE96vHOiSKpGiRUDZMx/S1Pgq+Ok9akG5Sbj2GuWf++iQHRGyWveVpHdA5Z3oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302786; c=relaxed/simple;
	bh=tYAjoz/MMhPX8+q2ENx9j6q5y71jGRtuId0ktO7EN9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCTAgYQ+3DWynVKBWEf0askGNiaKDXpldn5eUq26EXKsk8RRzDPfbQV93dHbpt+kk2+CFm0KGw9JWDLvxiescDNHLz9k4+0DSn0dyEn/B3+geLZJx97RJIITUNaccWPnQ8oTwX2o860yRg8qYsubzgO6OC+9Ll8c/qbWH8GQIV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Xvh5YYVI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=qbzFft+S; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Xvh5YYVI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="qbzFft+S"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D570QI151079;
	Tue, 13 Jan 2026 05:12:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=SAhZmLUwiNuf8pka7q
	PIWSIjrdCbPvwbcpw1BoLw9y0=; b=Xvh5YYVITnElSuY/IZBpBwXP7TgRjwwL5u
	IxZ0jxgT+fpgSZ/aAsGVWbDeF4DFeS5n2A+TtTDjKlHhnDI5UGyEsljRoX0p/Xri
	shCCbEE+HHGKOS+yKpr3/l3bzg/I1wCQCWo3RFWmwtYAPhZVtbcVIw08h7u9Jkh1
	g9pEd5DgJ38XcF7hJ33asfmDqXRPnb+q8pRFXlFPwo9yi4hXbsm9HQ5fLajXI79J
	ml289RQPwwe4Qh+0eefZUye6dk1bphRsjAE/1V1ti/XNA6YArSVu+PBgtMd3X4+b
	EWENRKyborAUgUotCZHuaPMut+PiOWXGRFTxWBNMtlQbBbuqalVw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020122.outbound.protection.outlook.com [52.101.56.122])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bkn202u7c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Jan 2026 05:12:49 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWDT/3RofIwDofjBpWxJgutxHFU0MF1qy1Pn3HaEKG2FiXo9Jtv3KqaLRtBNS0Rw/YBJoyA2GRdd8yV2KMcU1rffrmkL2krW9frqxdpl6tiY6gSUHjaLcGPQ/5E/EV4nwtUqOm/+/Y4vTGibeA/y2vLG+xTyk0epR6CEHsQKBEMZRj7uSoZboDj0xfAnHEjw+KDmu+yG65Vj0HykAOXMqOyf/1KU2wcA//zJ6GPliaoI5G8oTHiDXCLDIp87Rbw/8GbzbfxgDBfmI+qV7DQC+WrW3LP4r28Squ6iWCHOuGyI3IKnu54OfH4ml4Y6zTea4TEixdu79hToETkFVBDXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAhZmLUwiNuf8pka7qPIWSIjrdCbPvwbcpw1BoLw9y0=;
 b=rOueyh13qDxvfZcK4/o7Ph8DKxbPfVAia04CglOuLZNNCI4ur9zQ7MuLYsIW7DbFyTfDWo3UuVrEjOLMV27JNKfkRx8wvyzT5OdMb7mI0xbnYitF6CRu9UM7IsPVEdTFfbj1UssVtMZbQ0q5IxTk8SYBjn0o8yOiTfmce07byK7MrEXDZqNombHZyxf4B41BQ9V+vZAtJhcbDsoJvyG7QFvgWPngG/IGoOMP8FxM65gHImxUrfW4IySwHDuCQ9z0LzELgtRlzy2RG4uVRX09yyFMISRqPZS2yPj3gsMo1Se3lQD0E6iVY5YPrLu+2fxL45xuvONJjJ63gJrCpKSm+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAhZmLUwiNuf8pka7qPIWSIjrdCbPvwbcpw1BoLw9y0=;
 b=qbzFft+SuRRIGm2Fz2/ppuSTytH+lXbpQwLXOcRwbUubOa+8GCideWVGW5qCarz4pbPip0swQbFMsr6nnlS6DF8TlMjNEYAu53shwkq80nyWjxiTJWOE4NN00UFPrnAINJMZvNvlVZUP7DOZ9ZPzOQV2tfY1L/RxzTmAoiPK508=
Received: from SN1PR12CA0112.namprd12.prod.outlook.com (2603:10b6:802:21::47)
 by BL1PR19MB6084.namprd19.prod.outlook.com (2603:10b6:208:39f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 11:12:44 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:802:21:cafe::18) by SN1PR12CA0112.outlook.office365.com
 (2603:10b6:802:21::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 11:12:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Tue, 13 Jan 2026 11:12:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 88F1F40654A;
	Tue, 13 Jan 2026 11:12:42 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 70B3F82024A;
	Tue, 13 Jan 2026 11:12:42 +0000 (UTC)
Date: Tue, 13 Jan 2026 11:12:41 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 0/2] ASoC: Fix sdw_utils calling wrong codec init
 callbacks
Message-ID: <aWYoqQAYydHkrtQX@opensource.cirrus.com>
References: <20260112140758.215799-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112140758.215799-1-rf@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|BL1PR19MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: d89c93c3-4b90-4f37-172f-08de5294acf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M/xSFStRbhLWgzfNpUSuEDKUAb6nfhHIw0NVOlNj5JTDh4zPuDHjQ6tDdpd3?=
 =?us-ascii?Q?apUy0I+2p26Tt2L7tqjJcTpSYLCTWFrw1PtZM1JKQ/g5X7lsNyQYWVh5hG6R?=
 =?us-ascii?Q?pym1IJpYpcBDk6S6eBWzZR501HV0+AhmNkOW1UlLvtIerCTxf4fjf4Lu1BGt?=
 =?us-ascii?Q?ATKjf9uZ2V3jF8K2m7TlDs5ugpUh8DFhWSmDRFlzTOnprR0snn5Km3mOY7s/?=
 =?us-ascii?Q?wRNW9Wg8LQO6ihyQMeR6KFuRZ/8K/qXtuxbdXMBlAgxVMuqyAFk9s+u1F+Se?=
 =?us-ascii?Q?8OazhGkCTf9rbTfegloaSMTh+UATBihHJdb7So0OUNvPt1VUOYzckl4JV8j0?=
 =?us-ascii?Q?DELZ3hHEWa9VJNyk3S0Bviow5eDksyEJzn16VtEPNubr6JrmZM4hEAurFiuT?=
 =?us-ascii?Q?2nQNbz9tSSf3gEkg3XkNui/fRvh+t9F4ga4asmq3PCU30DnXC1hEcrNYJjHV?=
 =?us-ascii?Q?yLfvQw8mCpymlxZf1hai7oB2dP7C+Xkb/Twnkz8dOSIjIU/I69rDAUTAFQfy?=
 =?us-ascii?Q?YumKC0weikiD6vZ/Sb1ekqgPNmJF+1TRNLmTwSSfL3+YYg9eWX8XFfm7R9Kk?=
 =?us-ascii?Q?x89xva4bMukexTwR34Rv4xGdsPeAlRwKjAK0YaoCiWNqagSs29ZaAxbGuCFK?=
 =?us-ascii?Q?2zATd+rNuYRUV3GV/A+lAGMAsXfcRKdrtj16g5/MoKt1XtChV3hm/XWLeNWD?=
 =?us-ascii?Q?WDgKlwqW72/pV6CxFb+C7Ago9sFZh2nFbSBE+VDOoG6yJ3Kta0iFm76zIDZz?=
 =?us-ascii?Q?313M3J3Ek7Hd3MW6uOPsfM4ra+w6Yk5ZrL8vqUHyXdhR82W1RljYzI/5Rywy?=
 =?us-ascii?Q?Z1Iz1g7MgDwnko4FLaw5dQpS6LApVk0Dk3RcVlO8c79ok3ytCypVvxHkg6r6?=
 =?us-ascii?Q?580+xQF4wFyDqJDCnnWk2BS3eWHG90r6aLmxqjkVgP2VdS7A4ftgXrG+k7gy?=
 =?us-ascii?Q?tV0CQlJofnf7ySgaKEZw1ox9dDfshKGFiGYa3OuM8s11HulaePXP36CH0F6h?=
 =?us-ascii?Q?xEpenM86tOAmaLCedjIdht3dqXW77ojRBTFFFoVcWsiprwP7EvBEvqaJStOA?=
 =?us-ascii?Q?3HOcavld4LvovPMcxw5oswNxJGHBHyvXCjLzEEw3bgf4lh2jSIIkNPf/MvkI?=
 =?us-ascii?Q?Rxy30NxxEYJWpMSIf4MJjEpESHoodrMnOfs3PLLjJP1nbQ8gxiFCdCpLYjPy?=
 =?us-ascii?Q?mXUzoYGUsp03fwMpBIayWPhM+0TFj2PxYSX2tjjIXmhiWxna1/ifXyaHaglG?=
 =?us-ascii?Q?tr4frPoyk3i081M1rTEp14EBXt4GEcksRHz1DEBmij8vaBHYR67R2+pNsbOd?=
 =?us-ascii?Q?4MlKGNOoIZuVABXs9bGqKIQHcSyj7pdz9u5oKQltkOzMRA7WaqNSPj+yKXB9?=
 =?us-ascii?Q?639qC3PbHS95nmyp6yCyyikhwR/OwVetmgajFHPojIQSZ4Xz2LHQTiMTjh7b?=
 =?us-ascii?Q?HqzLvpScNdh8Y8HQEjnCgyjWyYsqzknaTDb+7ULquZaR8ZmMV3ipzIIRiRIS?=
 =?us-ascii?Q?fMnD+aG+DqU6B1E0G//yf1wplAwBiJYJUxg2tXuNXzXETVopvLE/CJ3nq//T?=
 =?us-ascii?Q?lPQF7X0BhoQJXeHBALM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:12:44.0811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d89c93c3-4b90-4f37-172f-08de5294acf7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB6084
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5NSBTYWx0ZWRfX/Nl+AB3wOCgd
 qzqecdWKdTsf6l18kzOi2yC4wz8yZzrEvTCYPuU2S148owvyZs6WZ0kHpkSf2pmDRg5iDeeSas6
 Jkk2GfuJO4P/RyWtUrrLXWoz4PdpTueZQMHSZzHhDf9IhV8iPW4QJm3oDLUITZozX+yVL06PLLt
 37v+wxQMueBQBj/MPOh2/5kWQ2DWWS3/jruX9wgNfY67SaJxBBRHf+/uhp43X0I5ZEYb/35JT0R
 h+15CdtOkGvR3bRFN5jKUzFd3Pyz1NDWOdKlqG6BiTXmDPQkIyj+sLuxsMoWQ5DsVJhecYQEPdf
 dWQUnxCWBjh/WrqkjUrW0AK5pI20LI16yIJYrCu5kyaNN8so05wo0G4nR0dpgxPR+8al5QtYUGM
 wuzUIo49cibXNLyjooOktaPVAmqtS0g7K3ee4DdZ0ZudX5pLa1kJR6g27UxmXm5EyL9QhAHyTJ1
 CpnltXzfF4j0MXcMYsQ==
X-Authority-Analysis: v=2.4 cv=LPVrgZW9 c=1 sm=1 tr=0 ts=696628b1 cx=c_pps
 a=tlQSIbIJF6LFNc9o/Tmckw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=_9V_MuQnr6Q-yjFEdUQA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: R37k-WgKJ11mrI6DpkXDJSC11bv4X1mQ
X-Proofpoint-ORIG-GUID: R37k-WgKJ11mrI6DpkXDJSC11bv4X1mQ
X-Proofpoint-Spam-Reason: safe

On Mon, Jan 12, 2026 at 02:07:55PM +0000, Richard Fitzgerald wrote:
> This series fixes a problem with soc_sdw_utils.c calling the wrong
> codec init callbacks, because it assumed that the DAI name could be
> used to uniquely identify the codec. This isn't the case, especially
> on SDCA which is a generic driver for many parts.
> 
> The second patch is the actual fix.
> The first patch is needed to add a missing export to SoundWire core.
> 
> Richard Fitzgerald (2):
>   soundwire: Add missing EXPORT for sdw_slave_type
>   ASoC: sdw_utils: Call init callbacks on the correct codec DAI
> 
>  drivers/soundwire/slave.c           |  1 +
>  sound/soc/sdw_utils/soc_sdw_utils.c | 43 ++++++++++++++++++++++++++++-
>  2 files changed, 43 insertions(+), 1 deletion(-)

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
