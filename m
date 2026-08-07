Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C187B3D47BF
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 09:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786095893; cv=fail; b=s2wc7PvdyJGZ1y+2iM6cAkbWW8tiYP9HmCEMhjpsBdbfLxcZvQqjK5awyB7u7b7QNhjOUDXqTlVNVjQoO6BmEYlb6WlsGEbg/gbkP18UGiueGQB4csA2jq2agC/DwEYXuCqZvslijYJItMOnt5XhSBUW/2QIp5SNNISIA9A0SVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786095893; c=relaxed/simple;
	bh=oLTrtzB2dzZed4A7HVmbQFza6qiLP4OuRlLiSH1FS+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRo9PeUwNZWsMR6wu4dY8H5OcZuOqLgRqjKg7o9WDD2BX+ALaJTs34F73iZ3qZFEXcUTkVphVArcPpx14upGIlK0BVmtzBpJ0oiwW5VOWg4hxmFob/pA2Bu3z3JBrkxgW0Eq6NRlaP9X4mhOblk/oZ/ZPYORU8/AgGOOgUMf0UQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Mvl1Ki9c; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mItwIC+n; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Mvl1Ki9c";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mItwIC+n"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6773mklK3839969;
	Fri, 7 Aug 2026 04:44:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=2K2NCprqveSLBae08X
	EC+E0Iccu2EyBgZfD6XbWzx/w=; b=Mvl1Ki9ctLZ9sey9i/CIZekQSwfIKbbDT0
	Su+sF+1BJCHqgMVKI8t+XpnoOscAyNIwxLPshqJZbF3+MBKbohroCubLuvAiWwWH
	wfM4IsLNUyU3jvi4T2MDHjL/dXg91mnhNE3eE3yu6sSpWTrg4GswXZFc86BcdzhX
	Yu5SDGsER0toR0+Wd9ffPJwp0C9dhNKfh/R6A+8pjgkJbhXlmwWsFxvDAIrO5pgV
	4ukEqeNpRDQd8Rae270GMDMfu6LOStJxUarAeldEGQbkiLK4Y+xhm36JN84/IW1w
	wD4H8QJnpwJW9VSW+9vUg9WhUZ6rR6aRXpAVqoSiWgXT8zBe7nUQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020130.outbound.protection.outlook.com [52.101.61.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fvxu69bp5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 04:44:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOZib7IdkET9TUdXk9CI6OHYmnrpeAVOCZQUoH9LCv2ltmUgxQx1TkvWNOa14LJ78lIKygDgNynIRrZgS0ifHfCZFYc6XsvtaW6VUw7ITcBfK9lTMf24I6DapRft2dNIbG3Hnb1/G0qQweRcW0Yd/P6Ew1BO7QdDa2pWoRO+YVFve0FT0fFoHlvW+y3Ct11JKN7NUYhzjnr3E5d2cos6L6HlsIB8b2muoGfB6DcSeHjHhAOA0ME3ak99g4IfsU4DgjiYsH0unc/gYFWil+BafZZTKEGcKWIyUch8yA2xgCrVdET6E+bwrYDpbaDTYaI83pzKouhzslxHKrn2nzS79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K2NCprqveSLBae08XEC+E0Iccu2EyBgZfD6XbWzx/w=;
 b=nN9/WDWxJkvRtr5ExINWq9CwC+ZcA1rYS27wM5iUNadyD8fHE5Zh1znWUoBYBgMsJx1VvxL1M1v6jq9Bd6C/XXYsT74e25kR8fjkkKBOXc+Us1wjN5E0qfW5QldqjXJrR2BA+dy4H9eLq2vN+aCJQj4Ne50+sc4MVuc1oFjUFcZ+EqDc4LRlnAMk2RlfvoNLJmUhncmEh4wkhdL/0WL6kvXWnjNwUKKylJVXGcgEnmPf3txUobDLxV57HmUTpVDMEg+6d8XS4QHKbQ3hr45o0aRJhcRK8N00fC6MqKMNjuWr1C1utyidErZ+AbLB/K57CeJpKCuAs/DaoCCSuCdX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2K2NCprqveSLBae08XEC+E0Iccu2EyBgZfD6XbWzx/w=;
 b=mItwIC+n3UafeJ0jADf4Y48njJIZm1dsAF1yqZbnjl/o0Y7uo7jpvQocZEzyvbmcImbR12FC18FdNu2jYvcmN/B1f/6K4iN78/F0Ddm8fbcONvfCXC5mhorttmNuFCxaXjCykx3QAgT27c+y9Cc8NL+3UBdyWqr/rnjbibWYkTk=
Received: from CH0PR13CA0054.namprd13.prod.outlook.com (2603:10b6:610:b2::29)
 by SN7PR19MB6781.namprd19.prod.outlook.com (2603:10b6:806:263::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 09:44:32 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::15) by CH0PR13CA0054.outlook.office365.com
 (2603:10b6:610:b2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6 via Frontend Transport; Fri, 7
 Aug 2026 09:44:32 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Fri, 7 Aug 2026 09:44:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 957E3406544;
	Fri,  7 Aug 2026 09:44:30 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 81AB582025A;
	Fri,  7 Aug 2026 09:44:30 +0000 (UTC)
Date: Fri, 7 Aug 2026 10:44:29 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        =?iso-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 43/44] ASoC: codecs: wm*: use .auto_selectable_formats
Message-ID: <anWo/cCK2u5UuAhg@opensource.cirrus.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
 <87h5l6sq6n.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5l6sq6n.wl-kuninori.morimoto.gx@renesas.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|SN7PR19MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 63eee0c9-a0fd-4a77-5348-08def4687b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|61400799027|82310400026|56012099006|11063799006|10067099003|4143699003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LuGNbOMiotNJm9E1z+OsZiwaQZEDvQyJvuzmvyAhlqLStKtKFoYc1NNxHi2Qt6PFsjdS8dhLw7PgPi7oZb/1qfE8bMFN1aDLa0yiL/w8/4+2Kw2XCwudkk7hjPcGiTjnLrthXqCZ8aE3kDwCgbY6G/HJdGwhi8NcQQpv290rIbzYIcnQBb5aZd0wSJQtmSPPV55Yag8tz56Wh28NQqkVvfGYFwYnQmcHA0G8Ma2XISezzTf+oCHrjkVZctxRIYGtE2v09ehdPPG2l51HM/05UEbKXYc0UR3qdEZGs7nNUSPbm60kqcfdCqMup3VLKTYe8DsAkNyZdgKIzIguEnUm9TGcWDQifNnJRdCFQay6paRx8O61fmm1q7YX60X56PlPCuQOEWjmlh5ws7E62EMwPsIVr8pvQ2eDDF76QNGArqllnDnMC70dvdP4xktz+b/HZ8hGHhJZ7kOQ9zSToNHx/f1AWH3l7xmDM/KpKlc6ZnP6L00PgQSzErPe30LiZ9Etd8Pf1R9jvWLh95ShMIqYUpscnfF7wwB12UavxV9I5cFZWoHMbLXgJnH4daDkQu5cd72vGt8FvrH0Z7fgPvmVrWgj1ungEq1qdcfPa15JhAKQErOEpTMvXZCoa8Z1Il2uIk5lL2KmGvK4w9eev7ibq2i2psUbkl/RHRYYam4OJRQJw/JVnjeeTa7y+gxNLW2q
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(61400799027)(82310400026)(56012099006)(11063799006)(10067099003)(4143699003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+eSJdzBj+vOfJ1XD+AD2Yyjm5TkBi5GBONk+oPrUORRZ4sH4zTvvR+1dFyJrdctXm8N3653ZqN4NccInNhhnuX90Imhc91PRARq1z9a95zCZT4fUjL9CqqM5K/74VIr4Fj4TDECU+np650HMIrwBEadaAsQSg2t46oY63PUedVG7E+7T5BRBqtUg2UolXnGwWMnNORYvJUAjsZgkfwSRw9FP74V0vAktd7gzIA7UT9J8XvbIafOa4JsEdVGWyDCaR+OMQpUnSs3K5Vwpg5h0n4ON86/QOJA++08EhPhfh49di2/N2/GAHTyvfDXuI5CH0/gVs0pqq2mhf3g57h7H6YNA+YSfElo8nyspYhlPqBjy2NDJ62g+gtPSYshAcQFl1nkmHnvY3Ry7TMdnjeRYr/rMFXsMWcvSbKOrgzFPeEJBdwMxD1XnDpJarXE+AZHw
X-Exchange-RoutingPolicyChecked:
	iE/L6U1gC896Rv6Beq3v4sGP6T35DwXOPN73zvgT76VbXeuqzjxO49oEPy8CRfQVDh3qmNwp3sMeOnOqfBTgvPVVD6QXNph8FEgY/aJG1h8yqp/aHRwbNldmGVvqPfvAClRlNancJlWHKoB+Z/xbfXtHEI7b7rmuQ83FIpI8IpIwaTD+PZSYwdBNlpIF+Fk33W8t2wB8301dfdPq95DE57fgiyVTWw+ZLrJTEYXl3OnY4L5xwaE5Q+2Iaa21QSrJ04FyNNaUzJw7M01PCEgrIG2cGZ6V4IylaoXWRoqgJFWfpdePOFfZHEFC223skhjj7Z0dJMfjRPhMVymLGCtasg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 09:44:31.6218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63eee0c9-a0fd-4a77-5348-08def4687b7a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6781
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3MyBTYWx0ZWRfX/fn5UC3uX3su
 hKFGZ8xJXN4gBUTWmNJIT+YIrhIofrhSbKRop+MV0b7YcaKWsduv9usv+i+CGvxIwaEridD3Ske
 VyHsxVO1ECzso2GT19vjTM6ryUkvlO4=
X-Authority-Analysis: v=2.4 cv=JurBas4C c=1 sm=1 tr=0 ts=6a75a906 cx=c_pps
 a=OSa6GUNGlxS2FeKBMPu/EQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=yC-0_ovQAAAA:8 a=5L_BogEYUk_keze9IyYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: DLlwXCW3gHNnN0m-qfESR-BHrWndvxfe
X-Proofpoint-ORIG-GUID: DLlwXCW3gHNnN0m-qfESR-BHrWndvxfe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3MyBTYWx0ZWRfX+NM6cuk4Wizc
 mnrpSNbsDddgcMWOmdADe4UkIgBbsKNzO2o3AzE6lumXoQuXLvTWOgkU2GsgDDuIQSTfobNg/dG
 Rx+bmkx2nJfrd03l2jT00px5UqrjwK/4xqhKfiA7kPb7EU22tuXftfw34DeTytBepXPOcCDrjj/
 S3q4KxNTj8ioVsSKVzktKSX6pO8nq3TwxqPMdQ4BBiUZo+cyLhJh5Ml2yTX83bdLR3oQe6+vAOc
 au7kzOpIbnh4opDuoMyX4XFWxDlEUB0VCygaRj0SZH5d94lI4SX3Y7k1lAVkHVU1y6QG0iLIBBs
 mlZLNF+kBGfonj8a2tbFb04/JagKpnSrzLGFFC44Eb+IaJDwGY2B9S5lbE8PJD/ac6gPmT/61V+
 rYylrgbBgt3SN678kP4YytAjBL1A/m9BBysURw2lMhZ+FZcWmmjz6ovyWrxts0nG1V24CIeQL7a
 m9eWHQcrBXQbbu2B+eg==
X-Proofpoint-Spam-Reason: safe

On Fri, Aug 07, 2026 at 12:57:21AM +0000, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> --- a/sound/soc/codecs/wm8350.c
> +++ b/sound/soc/codecs/wm8350.c
> @@ -1426,6 +1426,17 @@ EXPORT_SYMBOL_GPL(wm8350_mic_jack_detect);
>  			SNDRV_PCM_FMTBIT_S20_3LE |\
>  			SNDRV_PCM_FMTBIT_S24_LE)
>  
> +static const u64 wm8350_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;

I think we should only allow NF for the DSP modes here. Looking
carefully at the driver code it sets the same value for DSP_A
and DSP_B so LRCLK_INV is actually selecting between those two
modes here. Admittedly, it should probably block then setting the
clock stuff in the following switch, but no point compounding that
problem here.

> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -3056,6 +3056,22 @@ static int wm8962_mute(struct snd_soc_dai *dai, int mute, int direction)
>  #define WM8962_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
>  			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
>  
> +static const u64 wm8962_selectable_formats[] = {
> +	/* 1st priority */
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|

DSP_B also only supports NF, there is a fallthrough in the
switch.

> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
> +	/* 2nd priority */
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
> +};

Thanks,
Charles
