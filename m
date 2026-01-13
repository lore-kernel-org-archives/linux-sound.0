Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0893619EED3
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 11:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304054; cv=fail; b=oqdNrsuToiV4qu3D7iakV//GQbKCBrZwjy617dsyO2/ESfCzy4FrDHqgbNTfX7OCobrCqadsjfDi0hpWzdKHTu5ehggjF9Y+LbSgoI6VHDRy5w4/Se2ain+aqd3fxGx19ktAj20z4nFo7u6us/rMzVK79ghd58JwK8fJszp9WPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304054; c=relaxed/simple;
	bh=0TvEn9P+g52ukyGQwR1y1v/dedWUjzxwI1c6PuXpNTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0J4H2hDf0DRGvVkJISAKs/WwpUbLGro68ef87moUABx3/ghCQ+UemFdCkPidsHv8aIluYJni1aqyLpxqV3ugV+vC9NbUBtLanQeE8MPYL/P1v3u2O2ZGrPO6V3YnafU5xZP9wTmUbXpy0YAHwDZQEPZ5f3mipwkFFB+ZmZOSf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VZ1oIUZp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kc2MtY4J; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VZ1oIUZp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kc2MtY4J"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7GbJ22267328;
	Tue, 13 Jan 2026 05:33:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=l3QfWTz96UAhlKQB67
	2oT/YcXgCn1E6RlRB1RK2vYPY=; b=VZ1oIUZpGNKAiBmPoanCSsRcrbuPQFJmRj
	qThlH1DJDZ4V6JrsFpqAUbL7cLTdBHL2ljrvIkNklu4eSlhCG+5K2vYPxJlNArSx
	WeIzQ/r0po9Ymtw2/FP301ulhVUSA3ugtVTWycn9N4IjXNE5rvrZ2uLHX6GQnhUu
	lmBFtK9n5MshTScT2CcNoAr1FBKCDffnpo+nsVUPFYwoYoYa9Ar1MVIG2NS2nnCG
	0Gzl6dUiZSsndvGGOy7He+rDjLoOcWJHiKr6eK2ing7b4SJL6Skvei7T3bVf/col
	Fo+M63xyfc5f0ZyYBLu9jm4AoroO0DNVWpa5/NHXgSpnJZZQFjsw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020128.outbound.protection.outlook.com [52.101.56.128])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n2xdj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Jan 2026 05:33:53 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKNaEklFhG0mPfiphcsYS0s1g/KmU2DbKZ95mXJkjX0kuB9uYkgPPTb0mclGrt7sdCCMvXw6LIclha2i32hgbB0kHg5nqvpM9O7hj2O2BmHYIhFFdJNKCKQibeIP8JbhMUAkiNIyDZ5zu5niP7I1zBBSMQR2C4ATOHsFSnZVPEdEPNICqJNvJVLr9G6/W2Rbj1U/5kdVvK/9+xMVJcKk+TLUDLctSkyK+oOUMVlcNxw5CgrILuU9Blp+U0BHw7BRJzm3Qq375XcsyOqj7dVEfYzNt+AKBiURniQ6jsIpzW+JQQykhFLcoQ0fPtCmBWi2MDEl1oGqC1pa2lNxtzvjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3QfWTz96UAhlKQB672oT/YcXgCn1E6RlRB1RK2vYPY=;
 b=pY+RpFbtCCZAw5m/jDy2T3ViX2StFaMdjqqVkW2Z+LQmLNJJtmakA13wlLupYc4rLCYzFadijOZVMkYHbzISkg0NGrk6IYa2rDJj8PTWMlnke2lNEWd8yS8s6S4nHcwnHigPvNurn8KqG6RuyunlI53++vCJwwd7cRruRl0V77atQfsxEFvFlu4v+6NQaD8sfo3+CoO3h4stE51gy9Tih6cukPOFt1dYSkkZkWpN1j+ug7L6JKiWjeWmsMVZZMJ58/PkN2Qvqbj9c6vEPCVWFRa4zub+3QErgu60ZEqX7QHNiPkHw7GqpLoc/o/X7oUaKXR+qr6hvtsCnvZnIBCQ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3QfWTz96UAhlKQB672oT/YcXgCn1E6RlRB1RK2vYPY=;
 b=kc2MtY4JKt+Aw5LNci0xOZ4s5zW/7xbu+aG57aiL0wQOTl27/p8pgzN5bKFS57iLd4SfkSApU39QVLskKOa3gHDlWzukj1pPmdWrNY4mbp+XM+asJOHshuiF+4g7YtM/EYtWxAJvusIhioghNEW2WntPZhCcr1bqlGGJDDWDHMY=
Received: from SJ0PR05CA0147.namprd05.prod.outlook.com (2603:10b6:a03:33d::32)
 by SJ2PR19MB8095.namprd19.prod.outlook.com (2603:10b6:a03:544::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 11:33:47 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::d6) by SJ0PR05CA0147.outlook.office365.com
 (2603:10b6:a03:33d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 11:33:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Tue, 13 Jan 2026 11:33:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D05B740654A;
	Tue, 13 Jan 2026 11:33:44 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B771C820247;
	Tue, 13 Jan 2026 11:33:44 +0000 (UTC)
Date: Tue, 13 Jan 2026 11:33:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Cole Leavitt <cole@unwrap.rs>
Cc: linux-sound@vger.kernel.org, sbinding@opensource.cirrus.com,
        broonie@kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: sdw_utils: cs42l43: Enable Headphone pin for
 LINEOUT jack type
Message-ID: <aWYtlyLMIpBwigPG@opensource.cirrus.com>
References: <20260113084402.10427-1-cole@unwrap.rs>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113084402.10427-1-cole@unwrap.rs>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|SJ2PR19MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: 56898a90-e776-4ac9-9051-08de52979d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q8EDY7rBQKa3pQqh1VQdyuJqVOTxutJbCnUGxhE9mru51hqUaiXcyBuidk7h?=
 =?us-ascii?Q?qHW+aSD9wER5Obi4PydMzYg4mf+2l4pEmoGZ14uIbRWM75p6AduWSosXiZhG?=
 =?us-ascii?Q?ksqN6lkK5b1Y6S8DjDLoiphSpDmxmZdVDtSge2mjA1FPfLOqD8UKrI6yZRFq?=
 =?us-ascii?Q?NGeUdqP9lHIBgV7NcBmDJG4moene6xFOs9i3/i9higXDsb+MJN/UQgtrfOaA?=
 =?us-ascii?Q?BDS6z+H9a1RbWJhwRrOs6IH8HoSdWtD6Il02j3PDqOumpC8ht9xJxCqTKNU5?=
 =?us-ascii?Q?kswbFKld5QSoKqNaG2mBjNqVyMaUnQYTQcMRsh17FdZqX6ZRtjbTjs6+KRbf?=
 =?us-ascii?Q?EJenGbzZZ1O7YuBaPNTSjn28zQ7Si8CrJgOEYj6N0ko80Qagq2fRuNzrh1CT?=
 =?us-ascii?Q?9bUEtnvvIabMUJkJ7uyLRbbFINigrduWC+eN0WPBZr1FYoW9816pwsOiBeLD?=
 =?us-ascii?Q?K9VMulL5oo34EuzkpqieJL4WtspaKx0rniiUrzHxnFHYWzZzZhj6vovd9vEO?=
 =?us-ascii?Q?t4Vw8Sqqe6z5DK7zpF5fhURtrLpLjOK5os3JGU/VL51LKlc0cE8UaKfGS5rH?=
 =?us-ascii?Q?C40G0SnHhbVh8varAix5Kf1tbNjYg8UoIBZpZZdgslFAQJ9SioABDfiHmklm?=
 =?us-ascii?Q?ilbEYBFbQSQbnLX7Ms9v3D7Dzc7oW6rOqKQJacLO9Uw926tyxJx3taIpUnmd?=
 =?us-ascii?Q?+kC2ZFM3ivXsfAI8leUamTBPfOZRdVb4P+AzpD4IUJsshmmD5mZ2GiAC3B8o?=
 =?us-ascii?Q?FI1OGLTtnRPxw7x1IaKSpbXMxioDfoWLxfUbjtJWkW1nizaq3Hu22Xx+dOl4?=
 =?us-ascii?Q?CmjtO9CQFyKbQi0le57G+hA//yLMOndokrkB4zg8PvmrO4EipbKyjTbeQGyN?=
 =?us-ascii?Q?Fvf2vUSYQJasf3zOH9wZK8Q8APInq7aFWMMHr1jYRS0WoO9kvzMNFq3EOrK4?=
 =?us-ascii?Q?jCh3IAijqiRHvfOqP36A6YBSL8+7nzGwbIuJwmP1o+csh//WGYVn0ILJYWKV?=
 =?us-ascii?Q?OJeYp/jGwWn4iiaMUGrHH7GwzWeqQcGMvvE+LowxrTxIYaSvoi5d4Ydv+SjJ?=
 =?us-ascii?Q?V+WWUlWPn4sOQfxlFN0hiSWwFezjHyz05nGUz+6A3MlBerRSMThiKkYYzm9E?=
 =?us-ascii?Q?GNQEoAowA4DCuucCvAu8SPnITZq/Qm8BN8OLhVN30OBpyk9+2wJsX293XZh0?=
 =?us-ascii?Q?oL6U1SYRw/E5bmoX+zFVy8AiubLYbHywcq3Ktgw7BesRjpEP/lH4J3uHlJ52?=
 =?us-ascii?Q?Dn6tYkFAsH2CuKBU0FkrMfqEMZGC/hulr9VOHVAmUAakXc7kUGrWh6lVsyGY?=
 =?us-ascii?Q?w6mXvdlOrJ9Ca9pcxBtkuiIX/upqgYi9+4Jg/uAz4BFaAcABhBerXtC72xTo?=
 =?us-ascii?Q?Mw+4qH0wRyK11dZfFuo3DYkmfQWs9KSPRoFVtLuoEGaUOZtebb7XeYVUxyvM?=
 =?us-ascii?Q?cc773iYUmvkxVRFPCfgl7so5IxpxCu3+PYFXmozE8RfnLCvN36ygnwKLVcqf?=
 =?us-ascii?Q?8nGRqYIu1pLV2cCBvXsfMq5ELQFw3DR2Wv6LYTX+/weMpY6fELLKn3TaUONt?=
 =?us-ascii?Q?FuaVx6lCKi5FGxGc8UY=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:33:46.7456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56898a90-e776-4ac9-9051-08de52979d9a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8095
X-Proofpoint-GUID: rlFyGgGq9Ck8hdqKVmbK9ayZ_hMpybpF
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69662da1 cx=c_pps
 a=4P4HcNC5cxRy117rOhkqbw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=E01WxMIOFqlTglB8CaoA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5NyBTYWx0ZWRfXzEZkC9NQp+yG
 4zckj8zVA1nWK9SdFuOpfztXV4ngOQ2OyE3jghd6RF+wiAb9QkUH+LB95UTjZrDYBEsWvo1oHAS
 jb+K3jD3Z7vYkzyTA3Q4gKWQrbUQXIIs0OFXGJEwk3i7diEd8+poqqhLrRQkSotmAnBYFrQ32W/
 x6z4zGysxYAFgoX/bapBEoY/NV6DR4ofsd30KTiQEZDvJ6jkvaRUVwizassAOPIdAHJXOVqUTiI
 H/Fgcw98J6Upaxm7pLe1SyKZV2gxIQWEKGw1Qxm7BcQT4nYVSB9ryi9ULJU9rk8UKLD4OMVDOHM
 pD+ht6/7EvdOXR/4i0B66EJ+o418AL0vkMrm5xMwdQM6GYqLe+utHRw1ruKwlOkiXB5+71lQeWZ
 D08gN+eqtIp2ELiG/TYxT69fcio0X8bXknyF/UkmtC/V+go0uCWc4j1/D+D5EycHSceMTZTc2fy
 J0d+q5UEAm5lUm15XWQ==
X-Proofpoint-ORIG-GUID: rlFyGgGq9Ck8hdqKVmbK9ayZ_hMpybpF
X-Proofpoint-Spam-Reason: safe

On Tue, Jan 13, 2026 at 01:44:02AM -0700, Cole Leavitt wrote:
> The CS42L43 codec's load detection can return different impedance values
> that map to either HEADPHONE or LINEOUT jack types. However, the
> soc_jack_pins array only maps SND_JACK_HEADPHONE to the "Headphone" DAPM
> pin, not SND_JACK_LINEOUT.
> 
> When headphones are detected with an impedance that maps to LINEOUT
> (such as impedance value 0x2), the driver reports SND_JACK_LINEOUT.
> Since this doesn't match the jack pin mask, the "Headphone" DAPM pin
> is not activated, and no audio is routed to the headphone outputs.
> 
> Fix by adding SND_JACK_LINEOUT to the Headphone pin mask, so that both
> headphone and line-out detection properly enable the headphone output
> path.
> 
> This fixes no audio output on devices like the Lenovo ThinkPad P16 Gen 3
> where headphones are detected with LINEOUT impedance.
> 
> Fixes: 45b8e93bd0c7 ("ASoC: sdw_utils: Add helper for soc_sdw_cs42l43")
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>
> ---
>  sound/soc/sdw_utils/soc_sdw_cs42l43.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l43.c b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
> index 4c954501e500..2685ff4f0932 100644
> --- a/sound/soc/sdw_utils/soc_sdw_cs42l43.c
> +++ b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
> @@ -44,7 +44,7 @@ static const struct snd_soc_dapm_route cs42l43_dmic_map[] = {
>  static struct snd_soc_jack_pin soc_jack_pins[] = {
>  	{
>  		.pin    = "Headphone",
> -		.mask   = SND_JACK_HEADPHONE,
> +		.mask   = SND_JACK_HEADPHONE | SND_JACK_LINEOUT,

This looks pretty reasonable we don't have any intention to do
different routing for headphone/lineout:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
