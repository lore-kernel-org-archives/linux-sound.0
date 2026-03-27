Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2747D346E43
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604636; cv=fail; b=C06F3SMU7S6cnBtmEZb458O+zT+CJRybFqfDKnAnls0Caq9IPiZDcbPHjqYpuDym40XfvGoAN3WBfaJNOwRtp/NT4/FRRJhuBBsmEslfO6wEOBMlMe/pxWdQ/PFKmjXcYwLTjif1+89Mfcnl7du0KHva8heFYJdZGsVfoNcJ0yM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604636; c=relaxed/simple;
	bh=8c32KZ9blE0nax5L3OJpJ4xThkekoo01ZppUQW0AL8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YClTrUVz5FW32flCtepSUtxXR7HMWXubv5tVh0uV457Ib89r4d0aFd7DkrzQuAlIAO4nrZVwmmAKjj0ZRvdcLGPYdRbLoEpJvfQNZ3sgI98xnPMdHJreSU8CLZH85O3C4Dw0uikebKxiQ0QQWvzBkq7fZh3V+v+c/XsCC096Av8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=inXKrnvj; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DBmxJPfL; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="inXKrnvj";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DBmxJPfL"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R4mqrf518966;
	Fri, 27 Mar 2026 04:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=3nM7Ddc0LRA7rRU+UF
	7mKh+02YDx9FKq6gvlUdeU5AI=; b=inXKrnvj7Adw56aqIWS8pvDJ1tePaHf59R
	n9jqxyKMfGF+yH/qXaswF2p4IQnO06YtMF9JP6yenK7lZnKg8rl54CCCb8mdEmLa
	XrEdMkLGIBkVuDi0whD3ed/0cqXI0bOu177tMzvMi7PA1fzTRv9ltI1DNM36cVsr
	qOQ+JaGjkpzuyFswLqCfLxwy2sLJSEEw3CKRxyv3gNS8vuNOSjA/upsjvgp2VGvM
	ocG/kW8uQkwydqGz7WJdtt0/OUV9e8mhhx2UH9gQJwscZnp/Ug87rUCCjVxC07Z4
	ovfUNXMBObOEoh8N5eiWeX0aEupmbm7riP1udBvlzGaREIxYs35g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021125.outbound.protection.outlook.com [52.101.52.125])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d561d9f1b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 04:43:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kM2oAGdADyZzEfOAhSuuhX7RX5UlgZy4xaj7fIhrfr1dJwcM53mLMd6PJJje01E4z7H8gFezCzzj/QIvm2kPV82Gc43DVQGcOGWyRPxzG//fX8SvDGFR7PYWfAh/1P2jv8OyV+j/Ic/hRVMH+WHsktWLOPHQ+Xd/EUT5iPhvrGhm+rfKb25ULuGJMQvlzGPakz0ry63aDTxlHUGtsU8qv/BkHB5Z2szqB37wPacQVfItrErAnOu+q5kffDXCTs6b6B+tU9bmFvT+HwBZo7GTzkOgRaUVjOrAYk1pCr0WCr01/t/su0+aPPdInsqz5TRaxXh4JMK32awWjWdo2C7XZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nM7Ddc0LRA7rRU+UF7mKh+02YDx9FKq6gvlUdeU5AI=;
 b=JJTHpKzHzcvPaXh1Z5I9J5TPfJIECpR/lLV1KQCRxRMFDLidyNbPqwiXXnMAP3zHO2jLDFtWYo0sG7xZojXEK03YTviU+MAMsBf03ptHYMIpH+irFN9l4yhqS5DO/0gT+3eslJ0OwocpHj5XwVDkqdR8BU0a2+36/HShnZ2p0nxGveMqlqToDDO/co9p44BMootg/Ew/2KNlqit+qWJTIbbacO5OOFxonCoAiSVMHjdw864BDr5AYUdL/MtWBADIt26qlozBAdyOLtzPSEYrtJszED5euGUWRmBGlkk/1/6R8arH+hS8wmsRyZNLh0Uou++qWyVkUcVWAUdmktLN7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nM7Ddc0LRA7rRU+UF7mKh+02YDx9FKq6gvlUdeU5AI=;
 b=DBmxJPfLHeWqCFPzeEbE3vnsL587ZA1EPmnKGEcLTdF/CAViJLCeSOtF7ntGD3/8TeXw7PqAdUZx8vZpDegZv+tUyKTmCjD2pFPaBsgoZtNMvyiAHgld6JYua06VRRB3XmGrsJ1OvhOc5Y40Nftpz9ii9VosbURisomToO0d4Yg=
Received: from CH2PR03CA0025.namprd03.prod.outlook.com (2603:10b6:610:59::35)
 by SA0PR19MB4368.namprd19.prod.outlook.com (2603:10b6:806:81::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 09:43:17 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::45) by CH2PR03CA0025.outlook.office365.com
 (2603:10b6:610:59::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Fri,
 27 Mar 2026 09:43:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Fri, 27 Mar 2026 09:43:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B28C640654A;
	Fri, 27 Mar 2026 09:43:14 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9E25682024A;
	Fri, 27 Mar 2026 09:43:14 +0000 (UTC)
Date: Fri, 27 Mar 2026 09:43:13 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH] ASoC: SDCA: fix the register to ctl value conversion for
 Q7.8 format
Message-ID: <acZRMR/TBkAyKjWx@opensource.cirrus.com>
References: <20260327082331.2277498-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327082331.2277498-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|SA0PR19MB4368:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f919dc0-bd2f-4cb5-7dc3-08de8be5457d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|61400799027|22082099003|56012099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	bY+k192zbVTXkV8jSeVoVBZH2xVza2ZseN660Cq3mAErDQi7b6Tu+wEDYD99yZIXiXBGQ55eBDIk6G1WZqqVstUJrn2+fwYiC/gCQ05i47VWNC9uj2B9uRci0d93+f9P+5rpf0T8EAn1x5iZThsluqwfKaqGVe+k37+MXcrlgaThuOnGpzOrMvNPXv9TCIeSXrjxWmeq68mt2WKVRW9s7vVYk7ihK5zpiWIkSJRyQNNEmCwHzEilKsRq52ci/DIVXzfrW3PrW3VyJWe5N01ehQKLAitaZEHuACvKhGLiLyZlshUAozNxF6wC8QBWOmbGanuGXybuMrYJzO2M/rYC7D6NdSoMf2690rUJ631DvrSRhrELDJlOM3rLXYqLRm78f8vCImQFZTsT/hcxHKOeVjgY9Mjod5s5Y4+v70+9B/3E0Xo3e4641duazmpE+tzULIItGsr14Rw0GRlppxObhAx/R1rapMeV5cmAIfL0C1PB3BKbUxoSNCtu3JsA11/26+JxSqW1Zwpc9/xFu+XMfbwvlc0iBRLZGehkBMxKDwlkN+GogE/0IpG9SIyLVuFtaoTuDRAdlqCvlintJFOpOHcR6SQC5/Cqxcbl8uqUDn1CVjxuwW5jBLrnDTyzPFdZ4Ya2ZR5MkcHeHh090x1itZO2gl//0AscMbK5wiblQjMMYRSkktDtTo8xwf/ntyJXARPYBB0M6VMVn8JhKxPf78E7ySEH+3WsmrdhGo5NRzIaNbLNO1Rq0BFxMvrNZPK3+hTuZGUUNnXbffp1gvA1zg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(61400799027)(22082099003)(56012099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hORkW2/rGYzUbirNMyfADFwUj+QXmBtyZKmHG30589ZZUOLFTL+7rSUblnvi1JjOc/5ULP+vAtSZY/pE23zh4el9bmJSnAWf1RWyezZptwPOwbPstGObVLlfeJfOZj3s9Q2TEfNgqhoWmAclG8g8iRiiseXc7uQQrty7HddMmNHRcNJv7+FWcxbMkAWmqUR6D3aAUZge/qyXuUZX7RogpQncuLSRPOJI9sFXQ++kOMK8se3zaTFtLEZotc6bReJCkKooh8Ihlq5F6opUCsTVJ/dnELPDpOed+XftS5lbYcZA21kDl7fzaUoHAqHy275xWbEF/TJv42jPy28VRmZcPLXhHPKmwl19oOlaJVesaDtb/SAJzyJl5wWvSmo3leuuDgg5vEq/2T0u+fwJNqPvUpMN2gpQ77UBKChhcA8atyNZv7i5uIlb0vrDXdckUc7F
X-Exchange-RoutingPolicyChecked:
	H/0ixcGsN+day80WypCtXddSgyQEcGEdnBXc4n8UyVnov3iqqOclZUbxm56RM0l+VGC7A2eo1OYC8rhV3wqs7PSNSOD43j5ep0D4CVYYTsSVi02AR4PDyr6ybDDQ+gpFbea80sII4seZQgxJDE0u4KX7/P1ogft7uRBtnFcVVgZJCTiGoYHj+QJMhGvgnTc37iLY5ARMEnyH0iWlUgXwjO85dA5kwjoxxVQYtfbVhVuwy2mtOF2KlMwgEc1qVVWXSf1c2yclC/yEdZlpeot4YpUUp+WZRVJwiGZvHPk5dBUaxoGu48dokEBquqmSFfW+HxsRQ37ZxWh1OTC37AuJTA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 09:43:16.0446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f919dc0-bd2f-4cb5-7dc3-08de8be5457d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4368
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MSBTYWx0ZWRfXyssDiOwuBSfm
 W83966QvDKLY+MmV94GgTWGBv54vEIew26XsD3ZEzTvPKROfe08/mo8e6o0yqDk6v20hyvEgbRL
 Ai0AWB40gKzdhASgim4I4swIIPcTMMla2p03u//Ao1nPIZIBZBHhNP1siB2P7iHr3Q7h3DkYTcP
 zFYcSAQCxqjc18j662Y5vf+5o6iTmuT9l62/VDqGMlN3xExTsTL9Hq6MVHfwMmMiCoxRFVO4F6o
 QDcFX6F1ehhF38340tNBGlACjcI9PnpGAO8JDVXdkENSZ79TUXjj+mz8o9+PBlDNixPgE3u6Oi9
 p7km1cDjjGAk66BKnLJd7a/pLvMa/ppQBVnqMUN2vRxEeYMykvhp09vF45BvjYc/lb5qZgzj+TY
 om8yHTwtA+syxDsWrFrirTFJjlW5f0kSIXVXUBzAm+aJ/t6X8vcsxA+eU7Px0oNyQZ8sw5KR2AS
 AiWaIyxQd1408Ic2Xrw==
X-Proofpoint-ORIG-GUID: Buz6Tyn-H2yWhIarhcfscRlrQpWn81Zu
X-Authority-Analysis: v=2.4 cv=Gr5PO01C c=1 sm=1 tr=0 ts=69c6513b cx=c_pps
 a=/Qmun3bZW4YbXd3UFKUczw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=6ILAOXsFMTPafPiVlU8A:9 a=CjuIK1q_8ugA:10
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: Buz6Tyn-H2yWhIarhcfscRlrQpWn81Zu
X-Proofpoint-Spam-Reason: safe

On Fri, Mar 27, 2026 at 04:23:31PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> The division calculation should be implemented using signed integer format.
> This patch changes mc->shift from an unsigned type to a signed integer during the calculation.
> 
> Fixes: 501efdcb3b3a ("ASoC: SDCA: Pull the Q7.8 volume helpers out of soc-ops")
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>  sound/soc/sdca/sdca_asoc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
> index 733c9808891a..7709a4ce26e0 100644
> --- a/sound/soc/sdca/sdca_asoc.c
> +++ b/sound/soc/sdca/sdca_asoc.c
> @@ -850,7 +850,7 @@ static int q78_read(struct snd_soc_component *component,
>  
>  	reg_val = snd_soc_component_read(component, reg);
>  
> -	val = (sign_extend32(reg_val, mc->sign_bit) / mc->shift) - mc->min;
> +	val = (sign_extend32(reg_val, mc->sign_bit) / (int)mc->shift) - mc->min;

oops... yeah thanks for catching that.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
