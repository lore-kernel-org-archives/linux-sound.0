Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5B429992B;
	Tue,  6 Jan 2026 14:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767708728; cv=fail; b=blHSc2we4SetcLO/AC9RCtrrN3vnP0nw/QQz85Owqrwhn/BUo0xhUxelcts4znJmsd+vboLwqk9F7Y5Yr6V1TazEoHpMSs4BeGiUtwFXhqoPUNQt+5iTHDV1g7jBp8cgiZt4VnUta/LYS3B8YDv0L/eipDEJy2B0QwfkFY8zVlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767708728; c=relaxed/simple;
	bh=plvhTvd0sAsihLG7VVF0DgEyzxnaNaKv2MKtthTWcKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEtdTngCd5iEhWLjjtVX7S7TDoEJiuuBVljSHxEwK6shKKhkGgD4k+Kn0xwoCyuGrDGTEPvrNzB/8v9d3kDU2ijmB8T7pIbljnM2hJRqBHR9pONj6/Jk3As3kPkovVkvnZEHbwPzs3hdMX+8WOSVHy3NE4yIaJKoJCch+KtH5PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RFwb5+UB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pCX2e1Y2; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RFwb5+UB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pCX2e1Y2"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060VZOq4063230;
	Tue, 6 Jan 2026 08:11:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=GpaUIh9501M35nf9lH
	IanwT8s9owQl7Fpr7jPJZfNb4=; b=RFwb5+UBrpziaJOSG7xKe0QsClZcoXGK+v
	vM+DRHULic3ET6pSI01vA3zccIo6lVziy5yUFUSQfURlKAE92gg7n1l38p4uD8Y9
	gvMaUmEjDhbbVc68rj9maEbxqOJTUBMx/Gz09ljvRk0hGy4bH5XqjAZgiMT8wDMm
	tDdt46H8rwm91vBYkCx7Myo/Bn8KuNiU1dvUUdULNRmjcAzLiYmRx+ngcMycW2uG
	BHxqoW/FJb/tm139Xs2zSR1pwkWQOQdzWsASc+c7Y6nzsogHFWUyu5dwtzY3g+Oi
	fvThJsc8tMvbUhseWtwGCboCHsObgWw+HZxDY5xbTHL3EObTO2wg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020119.outbound.protection.outlook.com [52.101.201.119])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bf0dnu0j2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 08:11:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ctg2bOypo85Zen9tPomjl/9vAgsaXoQl09jcSbjkb9FaP037BczryRqAtSP2E5ig+QITTHCeEeP2lC2vfbmtanfhrMjNIdWM81aoN6c9DhINt4PAFc4iscQFd8q0FvYgKQhc7tcpr01A5XFBWNN/iDB3fVkvxc85aMjEUmuJ2kbkwJALeo/Ifvk7B5p4z7P238s8eZyUDERNxn6v0zga1WCQeoz7mh66oAGGBasCSn48NrEEw7b/4jSI8fBOPzBMMuxcOxoMsXKrOY/GVFI71XIBfTp1+xlMcGjsYtzjqyM0+OCvtRgA2XTHCyOQq0Pispbb0k6OSNUrsrJznAwf2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpaUIh9501M35nf9lHIanwT8s9owQl7Fpr7jPJZfNb4=;
 b=FNNNitS1xfoi710CWRHiG/bbuyOM4dAFCJMJyK+1xySYIHK3UoKY56UwM3uM+mZLw0AipXcLxszlwhKtmun5ysbXhwifMS4Arh2TT6iSgZMxqoa+zndWVG0fYGrb6/VTWMfrWf/v1E4VnXUnv8Ei4TBnfayjDbpAuutmTl05uy1j4DHUgolRh5xkqnN+v5fcP2Ug4R5j5dv9cTokoeKGXKE8IwyrX7LJhYE3lilCPL55X5oU3vgrq8dpZUEyHIIlfo8/aeSenq00Xz24Eb4ns0OdhfHH0xWkaDn8Zv+Ho4FlArGYWFYee4Q0vRath1HuAiSpHyFAZZgsPs48g6aq6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpaUIh9501M35nf9lHIanwT8s9owQl7Fpr7jPJZfNb4=;
 b=pCX2e1Y2qYxeopMlEZbQAGhV1S/5ohH1U3xa+thAwthUK3/9w7pZXIjUZEzyB921sXZ8bXy/BUR5zD8Qz8cGcoT55XVLaTDykk60JUTF1HTuyn8A9C0vpibLUfIsAP66x1c1a6PF9vre2Q8CgUcIOy1/Im6t8raMgR/X+PmZd50=
Received: from BL1PR13CA0137.namprd13.prod.outlook.com (2603:10b6:208:2bb::22)
 by PH7PR19MB6085.namprd19.prod.outlook.com (2603:10b6:510:1dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 14:11:47 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::e) by BL1PR13CA0137.outlook.office365.com
 (2603:10b6:208:2bb::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 14:11:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Tue, 6 Jan 2026 14:11:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D609540654A;
	Tue,  6 Jan 2026 14:11:45 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BC80C820249;
	Tue,  6 Jan 2026 14:11:45 +0000 (UTC)
Date: Tue, 6 Jan 2026 14:11:44 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: sebastian.krzyszkowiak@puri.sm
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH RESEND 4/4] ASoC: wm8962: Don't mark
 WM8962_ADDITIONAL_CONTROL_4 as volatile
Message-ID: <aV0YIN7OxIElQ5dm@opensource.cirrus.com>
References: <20260105-wm8962-l5-fixes-v1-0-f4f4eeacf089@puri.sm>
 <20260105-wm8962-l5-fixes-v1-4-f4f4eeacf089@puri.sm>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-wm8962-l5-fixes-v1-4-f4f4eeacf089@puri.sm>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|PH7PR19MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7eea71-9ac5-47f7-96e5-08de4d2d8757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yJdBuAajmxTn6NTJhEdaCOwOZ0+R8oIaJN7TZ83shP2DSilAhtEiIdOs2sj1?=
 =?us-ascii?Q?GWVR9/Z6TVrp0rCiSBRuh7b6xsH+0HmAzY53609gBPNFOvh/dvhA5KlsexbS?=
 =?us-ascii?Q?NK+7IzGujq5Oz14WZM/amY6tbZK1P3hQFp4hibP/Hu2lIxVxBHDccsbseOzG?=
 =?us-ascii?Q?uA8swINnhwF7ZWFt5DtglVu3VmtTZ4TMc5ymJT/xsheG4mDqQLVVk2SxlA5l?=
 =?us-ascii?Q?2tas/Vsqr3L4Gw6jQJRLZJdE2jX89Lj0slR2eDO22+sd1+jB6h7cKUu1ajJ8?=
 =?us-ascii?Q?xUUFClPr8uxbsdDOjWQzsVv5VhzAkqkVy3qaFdj3+tnxAcXMOsz5nHcmqFc3?=
 =?us-ascii?Q?HbzKHOqN/V+8ohiMk+fNFDUL1lyaxrIxpfBMng1DrKXUOlWIVVNxurgzplmq?=
 =?us-ascii?Q?cYGDavNioO/4sNRpJrOC7LFbKby5U1Yts5CieKgNU5HOUmktEvDCKjMOX6a3?=
 =?us-ascii?Q?nKHxhTz3w/is1CFdJJzWSXM46kodISQ9pwZQL/Ba0mGjWVnUBTAKCB/+psUY?=
 =?us-ascii?Q?NtVuXk9lNN7E079qCmR8FUd4ePaEDPJDlnwhR6nh3b56QUAnDkcY7IClot1Q?=
 =?us-ascii?Q?L+pOZr5u7n9Ok5i0QqJ7rih4pFtpDnEX2+4vFFaizLm1qtctUIOsyqsQEAEY?=
 =?us-ascii?Q?ehAmqqcm4Mccuw/VhCkKOjQx83wkGzA3DU9ZoIuZoLudBTSg40jDjTox177W?=
 =?us-ascii?Q?oSDsBwrPDtNv1IflrJPu+HLTe6+nx2irYN8mKqaS3BPd6XzXTSE5rfXXajs8?=
 =?us-ascii?Q?66ntT5uRHKChBKpcRxVOy3gk302k9ntkYPryencM6es5HFzN0jWxXtoWCYGU?=
 =?us-ascii?Q?4ZV046ZgLd3rRTUXvjuCZgpJDqWiRveHtUjRCCtfl3qGzWKueBc4yh5mkDeu?=
 =?us-ascii?Q?Vaw9mYvD3Hv8fgz5pjDoWZUm4dsDcB+UXk7fYZAwefWmqKtwxuw5lQ+Ut6bE?=
 =?us-ascii?Q?tZ7kuLl5Olp6Jqj0rbM0x95EymnOR9M3bkEFTS3FqWZp35PB2XUSkgg0H+eo?=
 =?us-ascii?Q?UBJJP5S1RzzFRNKqSCsYw/SA6UyJ/Lw5m1auasPPH5/LWD+3PJZI4oO56h4h?=
 =?us-ascii?Q?nVd6Im0i0WFapYyys0FO478ISmcYngs3ZF6qT+9+hnuXlpiO+Xp1hoa7Sypi?=
 =?us-ascii?Q?dkqt7NQmu/lts0tPn5gQlZOf0wo9HhGOcFjo/Nd2/7dRixIvE+FmD4rMKbkx?=
 =?us-ascii?Q?FhSvtHrdFYe6lKo9A//M1/andtfMGyPH9GeHqu7/r7HgIWERajXCCKtm8YnN?=
 =?us-ascii?Q?+EGTr2YKuL/9HeEQtm7C59J+nXxc0p/zxbd22zKe4xfWLy5m/nOoOiwOYEj4?=
 =?us-ascii?Q?ZLAMppxSJ6zaqS67sHKQngqCzgYbpjSdVmvggPCFTSolMiiB1JwJYH2KfkVd?=
 =?us-ascii?Q?7YULnuvE6abLlmQywYW8Syfk7M/cXgGoEdKOwEy8OFa/+pmFpsyhwx5uCnll?=
 =?us-ascii?Q?4lyGH77j8red/JPOsyAQWGJSQ2mOiBVVhhxKKbcSly+jHjU/j2zYuCww+paq?=
 =?us-ascii?Q?cA3F4iPqPeonSWwwojHG2dFWIB8P7FsMYUAybwXhVUpeFX3Y0efZRyV4/g9L?=
 =?us-ascii?Q?SIdJwtGoP6JhphV0uZ4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 14:11:47.0662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7eea71-9ac5-47f7-96e5-08de4d2d8757
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6085
X-Proofpoint-GUID: CZqBsZVTfbFZZRrPIzb3urtU37s3AygJ
X-Proofpoint-ORIG-GUID: CZqBsZVTfbFZZRrPIzb3urtU37s3AygJ
X-Authority-Analysis: v=2.4 cv=FscIPmrq c=1 sm=1 tr=0 ts=695d182b cx=c_pps
 a=j7k210cWVAfXhyiYu0S74w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=76ppxuqP8lH27eAlO6kA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEyMyBTYWx0ZWRfX6/itt41YTBNq
 vTMg+0xLDN2FgAbYmDn1IP1V0eYsFYt3yTKiAo7zfyWGpFhXQGSTV4TzrZnR+aIyl7BNC8Z2Ctc
 hCbruwX6RsvH8bvTcMTSrFTKllSFoYkEuAY1ObAE3rdpw462WU8ZyMtp+Uv00v9XhrHe/8dRuVm
 0FT+ZLmdSUrYlgKN1mr2Q0Q5lN9kmVNSwIKSdncU47+QHH2WC0uF1MUc4uQv4kYQhGyrsrnm5Ih
 qs22HrACE3vHdqHUlB6+9teCdUPny0eh59mkEvSjj69BZZimzbJUwuJ9Twhc6c/uKb5gsAgKcex
 u5mmDsSTQ/3nLtqLoBaFNIKxeybKUygbjqP+EE24Xolg0S0BPQiitE/tcyyfpqcfD68RxFq6XOF
 YqZ+iV3FVj1IjR6sR4uzexVhOpUec2mYgXztCmD77AZRZDza2Ib9WlhQ6Huftvx3krReZn2pOJz
 2n0fUveLe9dfWxcIQ6g==
X-Proofpoint-Spam-Reason: safe

On Mon, Jan 05, 2026 at 04:02:11AM +0100, Sebastian Krzyszkowiak via B4 Relay wrote:
> From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> 
> Only some bits of that register are actually volatile, so to prevent issues
> with caching let's simply bypass the cache explicitly when we access these
> particular bits.
> 
> This fixes mic-cfg value not being reapplied after runtime resume.
> 
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
>  sound/soc/codecs/wm8962.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index dd73b4dc1b97..22101284c095 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -793,7 +793,6 @@ static bool wm8962_volatile_register(struct device *dev, unsigned int reg)
>  	case WM8962_CLOCKING1:
>  	case WM8962_SOFTWARE_RESET:
>  	case WM8962_THERMAL_SHUTDOWN_STATUS:
> -	case WM8962_ADDITIONAL_CONTROL_4:
>  	case WM8962_DC_SERVO_6:
>  	case WM8962_INTERRUPT_STATUS_1:
>  	case WM8962_INTERRUPT_STATUS_2:
> @@ -3074,7 +3073,9 @@ static void wm8962_mic_work(struct work_struct *work)
>  	int irq_pol = 0;
>  	int reg;
>  
> +	regcache_cache_bypass(wm8962->regmap, true);
>  	reg = snd_soc_component_read(component, WM8962_ADDITIONAL_CONTROL_4);
> +	regcache_cache_bypass(wm8962->regmap, false);

Ah the glory of registers with a mix of configuration and status
bits, love those :-)

Alas I don't think this is safe, the trouble is the cache bypass
applies to the whole register map, so any alsa control write can
slip into the window where you have the cache bypassed and
accidentally be done as a bypassed write.

Fortunately, Richard added a regmap_read_bypassed() fairly recently
which does everything under the regmap lock, so update to use
that and you should be good.

Thanks,
Charles
