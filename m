Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F682550AF
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 11:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762861975; cv=fail; b=pzkFC/SYSVZVdbfVYEWkG9RybELrGKkBX8W78Lr1WebWLso2eX46rAGu+69jewxVp4GK6/jn7D3UvH/P2E5Uv94Pp83O0wchjP6m9x5cFlqWxCS80dqWwOgi423aZAF9o4M+J4Ym0ukGgnp1b4Bw0L8Kpzgfe6BHDGOvFpaFTT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762861975; c=relaxed/simple;
	bh=L5OZyStrAz0I0iRz7DkxcsQ+SZSiefo/3hHr+tV4Px8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=km7j3GTFONiWot143YuRMD0BNpVG6WtgOx2BMAWEH4tSuWTpmhrPAKCJYYFeI3kKzNbgu0dRi5fQ/KAiQ5vOqhfhS07/harRg9++dXpimLZjZJcvc9yF1oDCjb28An5+lDw6DSZKjCYmKgYSjJtmniG/tudZjORT3/eHD+VuCgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=q0hZUgYI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TsVIMKmK; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="q0hZUgYI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TsVIMKmK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB0tooE3154511;
	Tue, 11 Nov 2025 05:52:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=3/abWPVEVqOKzyThCf
	eoVx68iY8eJozb6DlEHzOACfw=; b=q0hZUgYIhZ5G19vyCRz6jZG3EaEPkSPOGE
	O7jrMnoCM6GBb2wzmuuasWAezxCs62Gr0eO5LIf0iLFjdEJPhE06CTiXkrQYD8MD
	VuJlTMvbrD2rWd9j6GNuJx8AUhWe1C9CwkXejgdZZjVNQHtm874hbHnMaEIhoy9K
	M638YsDRFW6B2/8OeAp2+0T1l2E9HbTuhzhEd+3vZ6TdE8LY6hJxxx3sD1jWokCH
	qfJV/N89Xe0WBc7ThSkKLx+qAB5FfyKsExmcX9i0H9bxd9TxD3xPGqSdwzdgKhlO
	W37rSHaJgA/qb2RdnoCFgO8tblCki3NWMWX+RSlRo7/vw+xyXh5A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020142.outbound.protection.outlook.com [52.101.61.142])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ab5fpj192-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 05:52:46 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVipFXU2Xx0ikePL84nvgppCBKXfi833PvexrwTHHL+dT8gMlkLv7H0mafXcMWPMF8gMQaHhjuYG7cPp3zbTjd4WIyTWwLp7JQWl1ZLp8PuNoC3unwTd5gZ+DPxjF/lfsK+L4WLhG6jwLCuuqTpyw5cxen8RYSYs+4DO0kq4jlRcqUBboh22XLcF7Zm4arqIgcRsEWvRJ+7n/rAh8Wh/S9vz6ZwLSJeK47V2qCj6pz6woO6qGRJBEwx+Ozo2fKT1qVEK92q78iIckM8CNSXUVY7M265zfWfzxVzPH9cnNjCxyQ/5DWGV+0h8mnUhGDguolCMxyM7yrYDss7iSl+bsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/abWPVEVqOKzyThCfeoVx68iY8eJozb6DlEHzOACfw=;
 b=r+XmI5q4G1ibz2ayTAGT93oYEuqEP/jM2bI/pFvfTVTGB4Wki2Of2IRGt7QDqe+n4Y/4ejRU7Jm4fRuxEDZzCyHq6FmlX4JCFnSTaswKEJpTL9mtwtrK/rb6peCSTOPwFxbi19AlQ2dUzwDdmyf1r2t/pDsA6pjKWib5DR6rNs0AnxOzZCly0srgR1kOo5mj3fU9Kf4CzXVVqgS4AeS+ojkSaLAOuX3GX5XCJX11/YKO8aFpImvPvFguNqCqRfcZ4ojrF8Vhwmj4+TfRILfAu1Gbq1sCPFvjX04qZ7FP+C+NB8TYHC+p10N4jtysb1MALfaLsKaUwFzQAvgFFCZ4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/abWPVEVqOKzyThCfeoVx68iY8eJozb6DlEHzOACfw=;
 b=TsVIMKmKBJXLEX6dPrPPr4MSMrgG5BZO+gN9j6n/tYZsYR31Kp6bb87x/HFGSoXD56SmGTuzf6rt/+vHdlEOOk91fzziycL/Q48qP0PVoj/NIHQh6jnWuZdoQSrunWjiPWNsXQ3WJhSY/eVff7i5n+4fRL2hUkNhN9Ix6Q4ZMKk=
Received: from DM6PR13CA0032.namprd13.prod.outlook.com (2603:10b6:5:bc::45) by
 CH2PR19MB3991.namprd19.prod.outlook.com (2603:10b6:610:a1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 11:52:42 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:bc:cafe::f3) by DM6PR13CA0032.outlook.office365.com
 (2603:10b6:5:bc::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 11:52:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Tue, 11 Nov 2025 11:52:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7A8BA406541;
	Tue, 11 Nov 2025 11:52:40 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5C84D820257;
	Tue, 11 Nov 2025 11:52:40 +0000 (UTC)
Date: Tue, 11 Nov 2025 11:52:39 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 000/292] ASoC: convert to snd_soc_dapm_xxx()
Message-ID: <aRMjhzlyZ6l9n4Hd@opensource.cirrus.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|CH2PR19MB3991:EE_
X-MS-Office365-Filtering-Correlation-Id: adc25706-0954-4f7e-495e-08de2118d226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cM5MIEgnrZ3PWvqVwZ31Vl6v+UeaFvDXFWa9YTzl/xWqzXPMdUcfILGxMuML?=
 =?us-ascii?Q?kqKV86xhXlLqNmJwLe7mdwGGGoRHq7Xq5qlvpCGwjGpxkJpu24W9U7H47Eg+?=
 =?us-ascii?Q?I3eQardVeo8avRnWIQXrSGj1Eg8imX4YYaelveCMgb0lC+h6rYQm+YiFQziY?=
 =?us-ascii?Q?6ex2/6jd96KVEzQYAb5L7juaXXEMQlybjYRsCfebctLHRJoy8jTjJDRtqBna?=
 =?us-ascii?Q?nmeYEaCshuDoQNRUJcvo4DjQ0AImDbQ7GJsBvaNVBurmWLs5m/SlUr9RfOEO?=
 =?us-ascii?Q?ANVOxSrAFYRHP5Y4/mIAldS7ubMnUAzlLaAVR4Oyj4kjeaq1POTxHZaxA1iA?=
 =?us-ascii?Q?zWkpIfXEUfSYYLGpQ+ANi0JmT0qQrBQCmHcO9bmgPl3ZVBaoVEPkP0t4a34g?=
 =?us-ascii?Q?7lSjT1mYlg66EyOFvHDq/cZ9gFBVSvGhHFBsRTZUjKkjKAti39aYba59Cobh?=
 =?us-ascii?Q?He1hQLG82uzXxle+sa/ylXNKXTUHEcpTamm4/Ub6peq459yV6wcnDaiGOzdT?=
 =?us-ascii?Q?vLzEgNzAHD4USojpkdUEpWl1HjG8mcNawMK5tpDj35wTSw6rKTc1ZJqjDwmc?=
 =?us-ascii?Q?+I9xz7DM4ia5+tGLe6KAdG0AZ3b++J01OjQ+6qoBJ0lkc6i85VrhOiZy/qhV?=
 =?us-ascii?Q?n2yhO1DhF0tfXa0dv5ZTu4zu6g6p7DUN68Uq+k9ai8/md3ySYb8gNsUjzHh9?=
 =?us-ascii?Q?FkzieobZ/KXhx7Dor6wRarXuK9/xvb/R/it91H7vvm4lm5RL296gb79vzhPE?=
 =?us-ascii?Q?uH8Hl62m0lDfZZfTAQ815ohSKgbUOVdrBUNAOSg8OGsbOJokFIc5smawqQ6P?=
 =?us-ascii?Q?cR4Atb6Wtw5uImsNAp92THc98YWsYIo4zFeEQ6hW/e0SOWFY1CwOZTpXO5CF?=
 =?us-ascii?Q?Fly4+hWDKJqrJs6qq1tpT8YW8AgkVHpC+EFakTkQYLEvibDxrUjlGIMpVxpR?=
 =?us-ascii?Q?VND2mAIozvRAEGgRuKR0CfCs3AG3S8suSIgoLNifpWGvWIpdcCkSO22sxlvD?=
 =?us-ascii?Q?K9qLaE03NDfC6rjOL12S1t6xCSeru5k6p7CGovBt4es++1Pn5nn91g4BssT4?=
 =?us-ascii?Q?u9Kqn6Wovm1Uy0rs+TX0JKjZGOoU7lxVsRzJUWY7NfcEOXA7s09p1VspnBmD?=
 =?us-ascii?Q?zUwcdAS+Bkmh7U0yQFlVOz6UvPVVT26VcS32dV9eQZp+Gq8+y4Hvx8bDCwGu?=
 =?us-ascii?Q?Fyx+5dkvZqGgShtd4A+HWkmPXNvueDbQMg+XHZCvEZ0Zl+SaL0IgKHPlCtWD?=
 =?us-ascii?Q?DbPruP4KqX9WDg6jvG8rettJbi9JxN+h+ejQ0QXhct6jCjuVOXMuGw3OM2GR?=
 =?us-ascii?Q?66rxKkXxrV0r0keVFYNZebXQpe5JYS7fFO+UT7O3Vl7sJ1pJL32/vFOjzgIO?=
 =?us-ascii?Q?u0MGwsycpZnaxIhMDTF0s1E/kPMKKFkQMdo6Y9eZaEx9WyLbcPFwp5lila05?=
 =?us-ascii?Q?5cB3q+znnQigrpEP5eaJH3EoL4GibSmksFgEhh/pt1E+l3nSQhE5HvkFzsia?=
 =?us-ascii?Q?om+PQIw3mNei7d2bPGnYljWk3xCHkVKmylSONs4xMcCYMfvMpqRPtyUheksz?=
 =?us-ascii?Q?d08Wq5YZcGrBLyXLHVg=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 11:52:41.9105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adc25706-0954-4f7e-495e-08de2118d226
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3991
X-Proofpoint-GUID: snGCilkqwsRigeMOxO9cCR2ulFx0oCoK
X-Proofpoint-ORIG-GUID: snGCilkqwsRigeMOxO9cCR2ulFx0oCoK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA5MyBTYWx0ZWRfXyG8h9+4UiaTM
 GMx93tUVdyUmumR6MNW2z3BoHywJJt2VZalrVFunyut2IlvuCVjFo0p39blaEPbv68evx1hV17o
 /CDNynmh9g5RpLLisJocD4w+fMdpXnatF4bo3n4K5Pm9y/+ETVHXqonaXAEvNeeBu4rBoH2EtWB
 XGB9qpIdnsG+KNPy3/j5dkNQkvw5wtZKqme4TgeL1oPhOF8tWqT6vpIJDKMrHjL1cAx/QGWiqZs
 XmocUF+G7VUn6PI4TN3KJOZKRZnh4zS9w74fRYXrdE1r4YgoM3w+a1gJvTFK7zaU/RG+2hX6/q6
 ExtbQm2DHnugd8tfzaM+KcIpHpwBYRT6EOnLTx95GtI1N7kNDqOZ5LKeAE9g7VCWpGwV/Gbd7pB
 X3kOoNcdTSHpG137FVtSy/04kmyGnw==
X-Authority-Analysis: v=2.4 cv=HLvO14tv c=1 sm=1 tr=0 ts=6913238e cx=c_pps
 a=aEC+72U9RCav9gZ+GiM7dw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=LHUm1GR9iWQ_J4k_EL0A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 11, 2025 at 12:17:02AM +0000, Kuninori Morimoto wrote:
> Hi Mark
> 
> This patch-set convert many functions to snd_soc_dapm_xxx().
> This is preparation to move struct snd_soc_dapm_context into soc-dapm.c.
> 
> For backport easy, this patch-set is added for each drivers.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
