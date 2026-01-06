Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076D2313274;
	Tue,  6 Jan 2026 14:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767709866; cv=fail; b=YJGhPscB+4qQjZap/HN8FyIMY4OkJZdqr0EvyZV9te4L6cfRj6OoYidS9fxW3uC62D9EeNmKoEW779WdKEFAvjoXEnSp31wcnieYj/IbnK/8kSK7MJEeAUAriZl48jPB4G32szW8mWZRGdcB6jBjK3YZSXF7w4eSQQ26NZEpiBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767709866; c=relaxed/simple;
	bh=R3nlDewMSqAlGuvxfSb/9ETEe/r249hcyltmIhuNGrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcCmHSKkotinXLGCHAEseda936jQJQDiuAnESltIyM+/LtgwVzmxMbGzDGbBs74D3lwtijk8FozO0KqQGnDwZcxkTPXpULzB92jzk55rgSkmJxFIalf1HdsCVItXszjiMMXPlMChvqrvpwuYXUuHL/gUg5rDCXnYUmLW9zXq/ic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cmEEt56u; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kl3YxBxg; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cmEEt56u";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kl3YxBxg"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6066UTM4782196;
	Tue, 6 Jan 2026 08:30:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=TarJDF15RjiXGlIRfw
	1VX4bhidJ751U/Z+HwoWFxeqQ=; b=cmEEt56ucQA1p5jhg6cRiuuaAKbNBl+chc
	2fdRI3KGBdliSWKl7xeWhE5jfH08iirj/9jciFvJG/uRTA9p/V1S+uNVm53FClxb
	p/fA1bDsSzcVnURUSfXuB+jwcRiyD9IZvGKcLQc+M3DofxmGCCZ8SarAkOojoPp8
	o4BmmABgxMEsX+A/6E2+AvuGRM2R8GnkMeFwhPIPad15h7hcbYp3vSdIOtpE9ZFm
	2SDNpqCeVG056knWH3NlGKRySVVhgeNPc3g2ui4YwdXqZbcRCFTqtcZgagCn4R43
	sG8Q1bAm4G670+sIEnYCx+bOPffcYYrIrfbWcM+Se1TmaQhwhyDw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023118.outbound.protection.outlook.com [40.93.201.118])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bf1d331f4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 08:30:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIYvWYgecybuEEtWMB92uLFzh/HXerjRG03uJsrJ6xfzqwNDs4mcqkSx1J3LbDu3QRZF2h3djJbxKcJ2CR7zt9f4nYQe2cDAhdzJd0unqNgdsZdWj1KNG6yAkUcj61nwyFT+7vQ7vJfA8GKvqpT+whcvYEVNkuvqtc9UGUyBvXQtwVCHGICas5xLaBawT5qUYBtplGfdgA3PlQjLpO5Y2ex40bJsfqWbuePKQ+GTXpTnlRFvbO8+PXPpFCb83lFie2qfMQvPLMxd+0Yn5r7goeOkl+If95cfOFwWDDX1XY108z1HLfZXM7LkJ5Zf8cwCOkBqtU0vUywMOQrLE4fIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TarJDF15RjiXGlIRfw1VX4bhidJ751U/Z+HwoWFxeqQ=;
 b=CkO5POE1OyJ0NwLQpfBvLOWmXzwbXSrHgtW4+tOqINwoVFP4kOFDAJCDyf7OgUTfMPk9cFWXjryXx/sMMajhtS5haTaIV1RZWMYGT+BT33DDS9o9a9/0tE5AOQzFlAhyR87Gtec/E8dsXVsakLxpseHyGKi9rR8SrmfznWY5yrbKXZvtIQBKe68nW4lf3W00qWgpafbFDwI/BrcxRWfDqcv2iV+lOb4zBsxb7kdMvyB8l2Bq3IcNqO5byvEbuH5yHfHBl1xT6t2RdJHZnCG8ZJuoqOuclXlm3g3jrTDZyGtkDlv1WOkaKY1a2Mz9OwEpvU2MWpUXhrZuiKUOupAbzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TarJDF15RjiXGlIRfw1VX4bhidJ751U/Z+HwoWFxeqQ=;
 b=kl3YxBxgYCRYxLi0b1lrzoqUtUy1f33f45QHiVOcnwfp5fGjseAkWPrz6nhpcDasw/6+83P7fhdAfCywbAOns5Ej0lzjfLBxGOHGIC9iS997HknbFEMBuZdQLrrYJpSF1zXbSHlZKef2ftq/yv+MM53tN7iHAHF6fdslJfDoOVw=
Received: from BY3PR05CA0032.namprd05.prod.outlook.com (2603:10b6:a03:39b::7)
 by BY3PR19MB5124.namprd19.prod.outlook.com (2603:10b6:a03:356::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 14:30:46 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::28) by BY3PR05CA0032.outlook.office365.com
 (2603:10b6:a03:39b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Tue, 6
 Jan 2026 14:30:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Tue, 6 Jan 2026 14:30:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 400EE40654A;
	Tue,  6 Jan 2026 14:30:44 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 27975820249;
	Tue,  6 Jan 2026 14:30:44 +0000 (UTC)
Date: Tue, 6 Jan 2026 14:30:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: sebastian.krzyszkowiak@puri.sm
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH RESEND 2/4] ASoC: wm8962: Don't disable SYSCLK if it's
 enabled via DAPM
Message-ID: <aV0ck+O4ysmA25s6@opensource.cirrus.com>
References: <20260105-wm8962-l5-fixes-v1-0-f4f4eeacf089@puri.sm>
 <20260105-wm8962-l5-fixes-v1-2-f4f4eeacf089@puri.sm>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-wm8962-l5-fixes-v1-2-f4f4eeacf089@puri.sm>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|BY3PR19MB5124:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a7d73b-48c0-45e4-507b-08de4d302e1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TvoA5XOMsslwBAZ5f+Nkw6gqYHTGoA3GKomJDjAp2C62jRwSc571Yl3KmhJM?=
 =?us-ascii?Q?dqtp9GVwztd0TnbP21kNKlBrdi5M6rqgRjUGsZXSH12qfQB3+HMLMdXbu4RW?=
 =?us-ascii?Q?kHTA9XhgqHQxuqOWJpfod2MT9XB8GPwMquGZo3f1e2o1clrM7uOn+tkV14bv?=
 =?us-ascii?Q?ou6uCQNXhHBpq+zFBEvNnB9UmRlsOP5S4vLgcdD2nqP/0N/YAYrgMoYv2mdA?=
 =?us-ascii?Q?2GXfWCl6aj363muJfoLVJDX37A2isyRPC/bLX2Sim+PVY7U9AuBa1lXn9UkU?=
 =?us-ascii?Q?b086AY0mvjpx3/NPA3/oO5rmBx/H1RoRwYHtLpbup5y8uvsZ0QGh0mHfzLUW?=
 =?us-ascii?Q?zDYYwjLlLP76XpmZf/iy0leVkM2CcYdv3P2GgMKTPVUyjS3p75e56os/AqU9?=
 =?us-ascii?Q?FmyOVYLsVNARThQOFLI1eLcGiDkSYzUXbUpoMInVBYD/RiKEFO3la4WVylZ6?=
 =?us-ascii?Q?OOhdxCzKdVdCLsz5DQX56A9PhzJhvQKb2+P8g/TtKn3sygcPx6l/Nmh9hgob?=
 =?us-ascii?Q?5eankqe41M2Kx8TbBXd59nMiepDdePnMXNmrkhuNjPoj12hQqqGkYlWYWfuY?=
 =?us-ascii?Q?ROXBfhKPdL3DcCO6/aSdni2+FXh1JVNhAry8Wbj+C6/SnG7m0c3czzRR+XLx?=
 =?us-ascii?Q?ugHjiHtSSiL4kwUW6cJZY1EIiZ7XI4HsZQzteovQD2nkXcYDTOEicedi1WLi?=
 =?us-ascii?Q?NkNNlImvlecmYULxFO+V9T4YFvt/CRjcA1M08upDrEFLupdM6Xf9dzdXMkdr?=
 =?us-ascii?Q?qtOqhtdNluJ/2+T+b+bqLDaWVQcrLh5E2PF3rCwknaZMR8rfVN64Y7oK6rmt?=
 =?us-ascii?Q?BwMBhTVUeoxyCQU+gsXpfwaT4dw9ArI13Lt35NBI68tuid3EiIvpqOChgNCh?=
 =?us-ascii?Q?M4NM+pXD9dpgG6eQunhM8adSg36Wuj/MmRsGnfb2kkhJ507jqlGEGh0R6CHD?=
 =?us-ascii?Q?i/dUn7DozMrdm9Zt1FdfSCY+jfG4wt9rHQb5wynYihivGCpzWilZcWNqkSWz?=
 =?us-ascii?Q?g4V4PLFGhzHT9BsQXnfx5EJiSa/OME/L8gGiLf+bu/aYEcDPzvrsDPdfKIOf?=
 =?us-ascii?Q?atk/hA2yM5cnUkZ/Ma6n7DXkwxPo3vog5ySJmsgrWX8+99oVaSSoKhRtRtbW?=
 =?us-ascii?Q?YipHb2zXBuCs/3gbFqPwrONvFqBXXNFGKNdohH48OQi/aUvMbs3BYRnRCktB?=
 =?us-ascii?Q?PqoC4+nQkZHZDgMnGnRmA/UDbE27mYuHsELRwLua6Zc4KxwqnYYPQsEPCYri?=
 =?us-ascii?Q?nr9j24QLk8b7R+VONh8Fgvbo2jWs5eKXZA+57pFDBoGU2NHPX2JLsS9s7HLQ?=
 =?us-ascii?Q?nvz0kmUyenvZPAesXv9k03BTl5lxy25DPkpiTVwtbaExw6gAZ+Kew15ALHLh?=
 =?us-ascii?Q?QlVM9MTSBTlHr2e+az3RQIUNG0mDB+gIYGAFCtaccNLGk8oWCF9aNCDS/Ah1?=
 =?us-ascii?Q?smfIRhqtmdduhnXSqqDlnKpSA9kOZYgkmELRGXBASMT3IWHGdDqrqcuOlWBN?=
 =?us-ascii?Q?KG1S+uzggFhYAwT2ZgZmdPRxt7x8gcMD5eYeDm32acQaRukjxflOb8J370Ch?=
 =?us-ascii?Q?Lc0jA79bPRoliM5QDKw=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 14:30:45.7326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a7d73b-48c0-45e4-507b-08de4d302e1e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5124
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=695d1c9b cx=c_pps
 a=enaMJMrmEdl6qgF6GvhhHQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=swJF2c2UiyPmPR4hRdsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: bTN2bfRm72vv_7Krxycp61zyRgYR6Ctd
X-Proofpoint-ORIG-GUID: bTN2bfRm72vv_7Krxycp61zyRgYR6Ctd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEyNiBTYWx0ZWRfX5Ps4G+H80ti2
 b3MltOlyeR+jo0eT2PaDA4GnAuDOyJ7+PcXuWd4TL0gwmdyIqU+ZfmGUsbC3zoWl9JQXNUa2VQw
 H4TRnyB7gfC7yvsHlEp0ZdHyL7xH/+28g5C1Dk7QLyJ0Bt73ZhUzxniWbJJ5Y89sAjTPS8TRALL
 S9ZxTG4+GMV8bhX20rabzETc/gIGTPNb7lIUaIc/MRdN+5Nw8FFZjxhet0ALOANcVU7bWcjyguU
 1sRnKfBGjLHFe6jMPA31I977tjIJ39yJNaxZdbJ1wL/ZRadbUa/NaR61r40uOnPibsaFtKzEkFD
 LfpAztiLW/r05gwBrdQYNFTNmu9ikI/x3m8VcAwlDx93ptgAL7LHEP6Iy6kkUJjh0sQEIwEsAxV
 kE3aUBRhJyJ/bp8k8IBjCANusCm/Dmo7ZkjQ5/1uklV+AKIbvABxtRfU9tO7ISleuNiDJ4F2o0u
 LyOC+03fOJpS2H/zaHA==
X-Proofpoint-Spam-Reason: safe

On Mon, Jan 05, 2026 at 04:02:09AM +0100, Sebastian Krzyszkowiak via B4 Relay wrote:
> From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> 
> If SYSCLK pin is enabled via DAPM, wm8962_configure_bclk may turn it off
> behind DAPM's back, making it assume that the clock is still enabled even
> if it actually isn't, which can end up with it not being enabled for
> playback or capture when it's needed.
> 
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
>  sound/soc/codecs/wm8962.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index 1040740fc80f..843b8c6b40a4 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -2520,7 +2520,8 @@ static void wm8962_configure_bclk(struct snd_soc_component *component)
>  	usleep_range(500, 1000);
>  	dspclk = snd_soc_component_read(component, WM8962_CLOCKING1);
>  
> -	if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_ON)
> +	if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_ON
> +	    && !snd_soc_dapm_get_pin_status(dapm, "SYSCLK"))

Something seems a little weird here. I guess SYSCLK is a supply
widget, so it can technically be on before the card bias level is
fully on. But SYSCLK usually supplies other widgets that would
require the bias to be fully on, so what causes it to be on? Or
is this a transitional state as things are powering up?

Thanks,
Charles
