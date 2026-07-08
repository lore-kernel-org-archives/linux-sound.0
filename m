Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CB043B6F8;
	Wed,  8 Jul 2026 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512902; cv=fail; b=V2CHqQtI1cE1OJhKjr2e29ZxzPq133OvTQm1dG8U6cprs3699KltFcKgzmbWRRIf7hH0J5QkmN576+aVRclT4+jvBc4iihhWRzja/qa3sLW78VXO0Y5NqzOA9fBbX1CYVsaINPNvtISzyE6HeT91xXNE30hCo2rLf+w1a1udv0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512902; c=relaxed/simple;
	bh=WSTSuAv4nCkMH8B9NFmPlXIt/DKRdTJ0tLLtwV8vJOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igBuiRenh8CwYNEc+oz2mZhZVsqv89ZQLGwbI76uZr8xNDd0xSS9FQxp0GodW31/zPGZE/6R1asJNRBn6Xu88rCVQQ8vpbFyVTRciIXHf8TkX4aP0u9LUctzAzE9Pi2FNUKtB0zx4ODj+uqKfYbYNjumVQJgpoHpxXlPa3DmDGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Yx0olRvw; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YUudFbMx reason="signature verification failed"; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Yx0olRvw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YUudFbMx"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668934IK3306096;
	Wed, 8 Jul 2026 07:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=OYKZ2a1ZIndgi0Za792MZYLlNeXeHLpaCEZ/GffGrtY=; b=
	Yx0olRvww8fERThOkoVk9dwULm7zvCuzDUeJ2Ifgvb/oxDSc4PXdDarO/5X9zceF
	iHJbPLGINRQqG4MrLXkCFVnKMJGAv6TRRBRdZFp4j+h4m1y5Fi/sBKoaQh80TFbt
	scvcb0kp0Djv3ScSEApDPpCcRjHvaggnuG5+wqOjCQoMwdsqJhcSbhAJY8VZlt/w
	MirXZebpnUHhthD8f2I6+plMB0hTHGJbgXVma6m5D3KxO/H6eY8hVamnKy6mhG28
	wicm5/rLATM2FMhKeEcG/DQD7HvtC3v/90p4za8tDh9fZizP87pXDDCLWtFOD282
	wk1uDWksBlVMDrlkTL5Y6w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021101.outbound.protection.outlook.com [52.101.52.101])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxp37y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 07:14:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDsFwppze+Isoq0cqIQOukPLO5ynreA3kcJeXrAg1sScSM7j7/vSxPlq5TKdh5A5g+qzYYZR5olh1xey7eA+mlU07x3HrzhyhcydCW8L49RnYhmM9TvsYGH6yvsfUooMW4C+6l7AxkdFYSEXWTkE+vcexDYyuySZFihPKT3UGL0OdnSbWC8LqZ+Gkqmlfq7Iu9OQqlXdgtW/CpZIAJP+Ka/XBEmwcnHnzKzq5+rLkC5OmvJIJ2gmQ536wgAyyjVXxUFyPheaJ/6HSYb3cwhas3gaPRDvBmlNtaUD/UrQoqUaqtFHlPvwAdAxxdvxwFy4NQNbP2rYe2i7K/Ds2HAeDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6leHjcibezVAcl2dXgBsEw17+G0fevXfnEWFT9A414=;
 b=cEY+Uo8ukAIttiEp9ZUB4hK4UwBW4gm6DE4DM5qxjXcvWdrDHie8v2y+O9R/Mx/V2ZnZCFvZoTvK7dGrt/aEE447S8MUvgeOXwwPxoQaYS4DC0Q9PdO5sHfszRMnyxgPQ0WeEn4BrvJGLwqL7d8ml9hPJ2Bw3Gbl+EsHcSUZ159wKDDGIO/FjJBFQy5w5AZ1cB//pGdyYpwk5wnoxhUbj8EihiJxzK/Ns4FxdUtFKRvfYwwJlbnPo5zFnXBEBmwe1NmRTiN2XVlLM+hMy1Uu5T6pO5p6dyVVNGC/9bIMTQzByY9XNiHEw9x8TZCITZZ7+EE99wlbcru9DSYWK7fpMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6leHjcibezVAcl2dXgBsEw17+G0fevXfnEWFT9A414=;
 b=YUudFbMxKy2fmx1YF461FHKZkZOcWDjUhOYNmmN5K9XQ8ZrkIRrQG4tnDN8qfVParNLoyuN+rW/bt/lS+3hIa2MKrJ2uslKJzFoaIP0HrRs4k8MPFZ4atm74yLmjlF99o7Gdz4kbQVumSCfYLoa8r38Fd0O2jdflVpfLD4jXM8c=
Received: from CH5PR03CA0002.namprd03.prod.outlook.com (2603:10b6:610:1f1::14)
 by DS0PR19MB280611.namprd19.prod.outlook.com (2603:10b6:8:3dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 8 Jul 2026
 12:14:46 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::84) by CH5PR03CA0002.outlook.office365.com
 (2603:10b6:610:1f1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 12:14:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 12:14:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 816F2406541;
	Wed,  8 Jul 2026 12:14:44 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7002982025A;
	Wed,  8 Jul 2026 12:14:44 +0000 (UTC)
Date: Wed, 8 Jul 2026 13:14:43 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Andy Shevchenko <andy@kernel.org>,
        Thomas Richard <thomas.richard@bootlin.com>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 18/23] mfd: Unify style of acpi_device_id arrays
Message-ID: <ak4/M575dsBpnKat@opensource.cirrus.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <ac8389353ee128d3841cf91c27ef84a8cfa3b5ca.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac8389353ee128d3841cf91c27ef84a8cfa3b5ca.1783507945.git.u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|DS0PR19MB280611:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de0fd4a-3cf9-438b-9188-08dedcea7fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|61400799027|4143699003|16102099003|11063799006|18002099003|56012099006|22082099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	Unb6d219tmj32KrX8l/G4FuJL538J1zMctQOg7Hr1gPoR8Pa2VvPT0quQzyKui2UpUtr11EPfnUmiUcWk/TXrkdFggdO+gUd8b5QMqoEftRf2wAlcHsRwNiiqcs5k9HPnGRRhzxN5rlNF7+exh650tHXeGKK0mECRizE/4KuhBG2sa8HLcI4o3fwEgcEinAMhb+wVe/ujx0/TuWhsBE6YR/njVFVVB6E0q1NQvdu5YYk+fQ50YBiXB4V4xvycA3el/JG8lbhI9MJNpEmP35USlH+NKaEWx/eA83Zwpc0YD4k/QVqxouvKHOM3SvPT59ErSzB0n1+pshjc+ii+a3HxJ/90Dgx1KMde7nbEe/+wgwG6UuO2wJjVyW3/+TPwWqOS5s57YsWcrjMCOBZIa2cT+RpuYrTEsn3+BFSErF+pSLWM92My+eO33TUNjl0LxPa5ev0c5D5DrW8t7nTMUpTtL/8J9wnoSl4f6wtv190EXPfjl1oI/7fbHUE8M1r0K5A38wPos78G56V4AvZyizAWJR3nAfgbAMPOTGp4h1wd3UDqam5mLDEHgMTA8nONBl5yiPtSDHzuzFw83zfla/13FwMaTosJMdnlcacrw3+uxR7ad/O4EeQ9pz70jmnmQoC5MUZFR7ZKr8kj1kfRDgb0v1M8aHBZ2m0HLS0evacW/Ozf0eaoGmhnVCDpXTIx9OXKSKJLv1tF2gqMMY12raQAg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(61400799027)(4143699003)(16102099003)(11063799006)(18002099003)(56012099006)(22082099003)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FC/8fWipjmXeDuRgltPyR1po2Eq8WfZic5SYKJx108L4pHzAjoNwGH0CemQMxsXwqB8CIsDovhbVD/5iHfJHlYeTLUPX6NYDS3IvfGAqK5puiI48lNgQzGm2wMZUrY6ibJPTEdrmS2/QFgyswBnNNbl6yb3Qb1pMkPKhnzFxZmDf86EZEgwsFqKl4gEYQrrXTrjr4X8Hy4e9MF01tA2oHWjsAA2y4lskHpWfEMeJPGZVvomvCiJ7e3jHpDm7NwJ+u/CJD6gH+LGY31qzvoXXrX80Z2q+tXpgmfLRFBZwPUbULlibW4u4A+kVu2JpL5ecnyVum6q6dMR/lmr3xZQxdf4JCWLoPnSMZgVZIWy2tZRfKph/wkW63vYhVYmih7KFl6aROF9CY056k6wiakPvs8rRW/gh0mAaThWg73qm1Pg48TWSrksIuq4g2DZVHfnd
X-Exchange-RoutingPolicyChecked:
	FSoYDS4UW/WFRn5vXHFyfXVe0RVR2sy0GmKN1pnjgsaVjslqC17ASOShfZRX7S3KLQdVmukPDANq3dMulcTapx4KfxXXU4/N8cYUxN2dHbRdDLKOJ0OT3tPKrufFWqgaWW5w2Crsoze36ChSJ0MkfDXmP+E8ze3K9zslTZM7UJ/wjRxxM3piPkxjyLZJHHUzSN8w7cLTG7jgTIlCfZcinK2cW6l8UaG2SqINcTlquYot7GlUyz1uAjv5iXKZHyvCPjB2zRP7VrzMnnd9S8aM32ojU5cuhzWvmlAG1gXeZ5gAO48w8Hf2tiF79TlGu7Gaymz/svN07m6N6RP630M7yw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 12:14:45.6430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de0fd4a-3cf9-438b-9188-08dedcea7fe2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB280611
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4e3f3a cx=c_pps
 a=3cYuoP5kWG2k1oDcrssWdQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=IpJZQVW2AAAA:8 a=w1d2syhTAAAA:8 a=F4wxPZVc1jiR1BN_hbcA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExOSBTYWx0ZWRfX2gyLTa62OMlT
 Cg9rk6Ily6tsvATK+h+XBI89r7Xg9EjEAV9nyBhk/gpuNRAOxtTk8lq78kPlXVi9coXlTd7N7ZM
 44KCI5OYZ4+6IjvcbWQf59DUnp/MCk4=
X-Proofpoint-GUID: Lt-HzeANoig9Qipx0BUqteiwhbgdg1jT
X-Proofpoint-ORIG-GUID: Lt-HzeANoig9Qipx0BUqteiwhbgdg1jT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExOSBTYWx0ZWRfX6rBsa9DJnyIF
 znoQJcQyB+ebtgnuU07SQhze4CFHVXZvtvhVcflSGLdl8B1E+bKqFDhzjymJN0Oc0KhR+e8j7op
 it/l5vpE81Uj7qaKXWM/DY8NORrNNUiKkTLL+jCH79JK2ufezSrH69qH4HOeC/ZNFWysh9Tuq8M
 HeaaR6NRjGcZwoE6+hIPXNdrwU0YHTQ2W0a8R3A2iZxH34MBI6ksBxVhGU1YfLplKlXP82eJXzE
 koTtEm2S7+jFjIwV3FVk5/PtLVchvfJEj+URGKDktVVQg+0WrXEK0Oc0QxYTGPQkJtLyXu4aUsI
 D+cTpz7OKM9cYEzg5a6KRyPtP0yvNpuitwR/lceWEC8VKFI+noc6DN444pTVaLNcbl4bDeJkRG1
 xc/O78NFBkNntKZtP5hV7Aczv3NandQzGpKFA7vLprxsZNQCsav4OqBJzwgpYfS0vWUJ1UfRqww
 eyiRDC3QwvjHd0TMvkg==
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 08, 2026 at 01:15:25PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Update the various acpi_device_id arrays to conform to the most used and
> generally recommended coding style. That is:
> 
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
> 
> Adapt the few offenders accordingly.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>  drivers/mfd/cs42l43-i2c.c             | 2 +-

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
