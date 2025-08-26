Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07754295516
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 02:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756176773; cv=fail; b=Si1oHwtWBjDLQm0H4BnflFWksFyj2wbVhrVDj4aewptcKcxR7UkGFX+nRUFkaKRuKFZ9YXGKjaOS/JjXL2M6opNUQjOQNR6LplExLhVGP9yzpcrqEayYq8lizkrpf4Y0OFqlqdT2zp/xE3slYJfTe81lu4UtfY+iVwQwSeQxiBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756176773; c=relaxed/simple;
	bh=bVdAJ75GJCQKvK3U5is8nF3jW2vLjnBbB+XcKFe13Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YHoxrcVf0MVcQves/AVAuE0BqirzDGQtHDpF9ce5zhfNX2rjGHcrlRqxU9p3grBuoRVnrSxFZ4P6BAubBOQV81aLXrxNgnNrUfx0PSKN+voS36azunXnUbMK2Pcbb8LV+UqFHygd+bvvuZv3bUFYesr1eEkrrT+JjAdHl1oGXYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tDIY1Zcw; arc=fail smtp.client-ip=40.107.244.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tDIY1Zcw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSScm1w4C+X5Jstfzsisr9WUsNRFBAedo+emFC7MkcORwSOR6AO8WWXE1iMAWCuFC2yXpDf0odQo4CqUrkWYayK3trytrKlSKjorigZs53b7j2FjOVmu52joRbfOnKEaTMgHTnBs3oeY5XY9eM4BIvzWfh5UXgP/fIA7ancAZANfzb+TDOkWg2BtJNlsQWtKEAqJ7QFPKr/iEl8QTkLs9hMauvwF7f8pOnwMvW7a5VHJKSbJ91pDDN7hIF4OOUtb+oDujVUPWtoQAJ1LDkgW3+4oUtWcFqxMjvQ0ylmwIrH4yR5fJ42DduZCAMXHKDsH6wK73u8hT6GpA75TnsoVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iku0rOVnca+fCqJyl+8ysrRseKFkwY0lm/mdEymJ9c=;
 b=xyEFgE3QxtTN51yXKI7Iy1CfWm6tgFfv4Q+MF7LXEPI/tUz/f7c1odi8oRL/y5XZ+9OAo7VDK040gre8vLMbj9SA5fqSv6RYESdAJ+5OZGeUZjJ1QK3GKq/LBCJvad+UQ3CqXpnVPDN8iiDaghBTq7bjZrlWTqLYZABNxeZ/mnqznQgtJ1SZKM5MfaqeElPbnVZ8r3CJqqjxOPClhpS4FY0ulF3e9qwKC9VyVkZofUKBs3gdat+SUIofYgyyGiBG/0wRBDRdnJPTFo1ex4lMVSwdvhX+DOaweqTReAw2+h7PW722VoeurGnD0dYJy5u5pYaMJb9fxwvc9b2EBnJH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iku0rOVnca+fCqJyl+8ysrRseKFkwY0lm/mdEymJ9c=;
 b=tDIY1ZcwZoOKEBwhssvztqNbJfcafx1EPgc3YWIBBLNUmYRjY3jJjcnftHP130RlV9U3stvcfdr+dCsTmx7ci140Uh1AcbfGWjrBtMR+4t2G/qbPB80mT7G2t2gRlCRSdcGeXcOoarWlmJG3vq0NjGVe7GDodrGrRcDXC2gcIjqCsPpsIPNjAkivdHupaPqyvOndriJ8TvxIRoQkMFZsd7K3CULGX5l3AYEidh4lsV4xU34oEWhC+U2957ED1Z+q13sBN/jPzhHMXb9P06U6XQleTA9yeXfVrklrv0cj7H59Wow6po1iYVaJBw1DKN/72VXeJF6ink4jnfDBKLh3jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by SJ0PR12MB6856.namprd12.prod.outlook.com (2603:10b6:a03:47f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 26 Aug
 2025 02:52:48 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 02:52:48 +0000
Date: Mon, 25 Aug 2025 21:52:46 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de
Subject: Re: [PATCH] ALSA: hda/hdmi: Restore missing HDMI codec entries
Message-ID: <aK0hfo9k1BZGVhTE@ddadap-lakeline.nvidia.com>
References: <aK0ghvagXy740rxd@ddadap-lakeline.nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aK0ghvagXy740rxd@ddadap-lakeline.nvidia.com>
X-ClientProxiedBy: DM6PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:5:bc::42) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|SJ0PR12MB6856:EE_
X-MS-Office365-Filtering-Correlation-Id: c310553e-4d45-4ead-3865-08dde44ba3fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZLXx4lkzURvRGEN1kOQAoqmcQB2mOcfzobjL4uFGvI3uYQTh0IRTDH8DpJXP?=
 =?us-ascii?Q?s03CQUykIZN+/5g4aRG+ERvId9lhgGiih1mMdAuWM2uKk1JpoPj5B7SwCqgp?=
 =?us-ascii?Q?YhMfd7iN/h2RJNV1MLWykSjbCxNd1Nvi1zDi5xzs/pjVxkHg+ja3Dk+44R40?=
 =?us-ascii?Q?kG8Jw2L6FJ3XSiIKck2RU0uls2CUjCvLvSwKQR65evnEUbw8PWCcqSukBRld?=
 =?us-ascii?Q?IJ6MxBLJ+EzYEHAmFcCvppy9ALG1/jEUFpz9ds8MSjOjHKuwXMvEHV8z+yUI?=
 =?us-ascii?Q?2Og6T4+bBtW/BV8C0o29K/7+EDptchXDdb7LYxZw3iD1J3BDMo9xnY2qa2wm?=
 =?us-ascii?Q?5g1E9tnUZ0e1VNaQJw5qqbmjHI0gSB746mwbnbowBXwvOiku2xtTVQwjEZx1?=
 =?us-ascii?Q?O4yATkOnKcJK2shv+pk9RS5bC2K8TfN1alFXZhh/3DUMWjN5A3A/WGrK6MGn?=
 =?us-ascii?Q?y1dKwtnolfZzCLqj457Luh1E2qUuEDz2oKBUaZRcsRrg8VZ+HkOQctDUtudu?=
 =?us-ascii?Q?1zx5ME10bAqrBdnErMacCwNq5coig1uVttmoJYgV03I9cV3kssR+uHrOxczb?=
 =?us-ascii?Q?RVGz7QsmVPpVBDP4uddbhIE+YRXPJPAGqac6azuaC1nuE3wSeVQSIUf90/cd?=
 =?us-ascii?Q?HSva3ZXA/CqfFfiWLXhwXNbzbPvHZHtFp/h9ij74RNPMqaWB51qZkOJwA5Mj?=
 =?us-ascii?Q?K4o4zpiYm0PZUhTCBeMichz/MJKtu9TdiwXGAyXEs47yduPE+u6NWYKrfTiE?=
 =?us-ascii?Q?6oAwxo29xI0hXUKqFSgHXdODP3FI+wxXoldDrnhmkai96mcl8IjE2Z/jVXHo?=
 =?us-ascii?Q?r2pAZgF1Vj0iTjCINOsQTlJ4QGAGbXHHMZxk+HUdRPSbN+abTGqfYjyOgvEE?=
 =?us-ascii?Q?Zy3ii2acT64FzsDKFZ8O6t1AY02xPXYx+6AAW7FVGLj3JM8EIAF2Zvi1Ot0R?=
 =?us-ascii?Q?wVeSQ9BTSsF0xpqRsHHTJJhNU9ul+yrLjiTYkaYhm8UNsQIUojx4HM4ClLvx?=
 =?us-ascii?Q?TcXz9pA7qTlzIoRG1wdcZLiui8pNvFWHxf3+WI/dQTPJBdDOBFxVtr2752eo?=
 =?us-ascii?Q?yN/wpYeE3jrpJ7ZotwkkgA8QbCDOuBD1DNLpmTTnEAHI6EpzFAjIakqqiywB?=
 =?us-ascii?Q?mAgwtHbbf0oMxF4PKWD51SfxZUGivKA7YdhguAzfDPQodEYpXm9tVDWZPjkx?=
 =?us-ascii?Q?C5fyekvzSrxEqPTue6oo8Bh7TAL59WwjrKrXO/YnFwAQb3Zk+qDpj8pnb7sJ?=
 =?us-ascii?Q?EFO/Z1dZzQh19xxyPgRdFlD9TYepm1ZS4sMRROj+iKjwdA9IZqQ4fST0OlnC?=
 =?us-ascii?Q?rHFVvidbf9CcnjgA7IMcO1bNU3kwiwHU7DGLNJ+8hXOlh6pcbPjc6qxDd8Cd?=
 =?us-ascii?Q?t5qWeyK2VhFCI3cxQu0opJV5VMiVuYJpo03fWnTOEFcNp9H9aqaD600YkLLP?=
 =?us-ascii?Q?c6HzF7d/wdo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TT+CkBjZ13B58ZJY2YLBP39VboJkQIPEwIciUeKJF9/OizS27+ohdbkwVWpF?=
 =?us-ascii?Q?gXtPiYTm5ypUTwjvcWiKGynOylwvj4jrRiQmkskBc4EaY1PSaAJzQckpS7X3?=
 =?us-ascii?Q?595QfB3lAsWvzsQ/awM8ozMvfDEeKhuEgryZxL+SFehKDn2B55xDjrBiY+VV?=
 =?us-ascii?Q?S8lVlqNTIJE3QeGl+QQ3nhO54R4YAv0AZBALoxHkEIDN5y3CZe+yPdrcPTcw?=
 =?us-ascii?Q?NAHdL28X9a/0DgmSICou6+Nun9IRmpGsoStdNFluSsw3Xk97dcW5K+oespG9?=
 =?us-ascii?Q?QnxAU9VCbIB7rSfCsex3A2TZMfjtcUM/R9zK4P5q9rc8jToy1rqb60EmAdHB?=
 =?us-ascii?Q?bVI9ZZMkIWfeFGOxI1vf1HSV+wmdeJF263eG6u7P9nwqfxoZGS5x08XeAVQX?=
 =?us-ascii?Q?tlc83IpxQxoiU0tnzh9ufzH0AbxpGtCABtjTrTpLkoE+cpMU0yTIEV2MwtMn?=
 =?us-ascii?Q?mi9FFmgSUWUZKBX1I6v7KmsmJWw4z1TFWxYKMHCqjY2UgUk7zQz3xokfdSqe?=
 =?us-ascii?Q?pTbmhcYDfFkeN5qCzLPrC/WjZzwiD/GAq9EZMU0Ncea/cy1/g7LE1X+eZFcq?=
 =?us-ascii?Q?Ug2wT2MqROeuN8o0OHiyVoPXCllNR1faJiwJEaEz1stCT1H0eHYNIkC3wP7f?=
 =?us-ascii?Q?9lxkjaYBd0Sllf0ec6MCsMUDmVB0bWLsZdT2tLmjyG3UXUilGeQpmLjUdoVL?=
 =?us-ascii?Q?PrEJoQ/crGwxbgCkRUb6tc02PkyrqGYY2wGlz63QeDyCSblhoRoyDVDAOmH3?=
 =?us-ascii?Q?tyiaRbJr3PsAC2pFO5Dm3G0LNZ3lmgu7p5lV9/hYJadSZ5OImalxqVhG8Nvl?=
 =?us-ascii?Q?DW/Br/k9hYrq6CrM9tL96aLeSmydDqKfEvAhyPaKmQb3swccG1vuzxq/X1qN?=
 =?us-ascii?Q?ShhBlWJBOvNqG2z3vW0RD49C1odMsyRxh49xtODIDK97eGs0FUK1m2m+IUPk?=
 =?us-ascii?Q?WS/MVq5NOBBaHVgRM8dfKIVBraydP7brdmRyRl+kRfj8zvEQJ/sZMWSeTxwK?=
 =?us-ascii?Q?zNe+Bdt3yg8Pp4LDE8IJLy3VNVApGA3kFPVniBVUWnPvm1Et+ltMlfcWb+k1?=
 =?us-ascii?Q?b7VVSA4EXRdJZbpvigd2ZddcOFzV6IDeq2XWUu4riS+9sUTALn6ez4GQQJtw?=
 =?us-ascii?Q?VuMW/JxJuitSyaZJa/iURVkQ6teb6jRcqlnqQjtfISPtQ2m5847sr3lnhWcV?=
 =?us-ascii?Q?NlxZEXrHgJypMnw7FOOQtmISt8u+CsYeTSK3svugTm5dh7yW1F4oenmZQkyH?=
 =?us-ascii?Q?Ycn7Vkkq6U/QSokOmwzsImGOSxTIPx6CmkGm3GXDDjdnQ/YZt68aQrUbo47S?=
 =?us-ascii?Q?ew8+otuE0TflhcSCxz/eEma2RnNFCkEUv2Wne+P9yLXLzwbUkTrOY7s0aG09?=
 =?us-ascii?Q?QujY1O4PNEnpX0e4tC61uy81RGxMFol7H1dbo6KCsLdcKOFUiyYUaIWWnOnG?=
 =?us-ascii?Q?x5quFr98zIzeUia1T4mp0rnjvtLvI3+nVThMuR9w1LId/pL4H70/zfo05m6Z?=
 =?us-ascii?Q?0W023qf1syBWbQmDTKLMq1XQDwAYqs6PoFmvW2rn6lbxV++rQJ/uS3+/SiHV?=
 =?us-ascii?Q?0MSKH84n6zz7ugi3n0l6lTUeXyhqEdld6u9XWZVa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c310553e-4d45-4ead-3865-08dde44ba3fe
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 02:52:48.2876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KctpKC0mPF2v1MumUJSkSYTOw1FPkAcVmXCwcjqYjdzoFbGc//oVDcdcFvOettXr1sndCebM386CMineQcFd/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6856

Hi Takashi,

I noticed the reorganized HDA codebase (I really like the new structure
BTW) when looking something up in the Linux source tree. It seems that
the reorganized code, including the missing codec ID entries, has landed
in the v6.17 RCs. It would be good to address this before v6.17 to avoid
regressions on the relevant HDAs.

On Mon, Aug 25, 2025 at 09:48:40PM -0500, Daniel Dadap wrote:
> Commit ad781b550f9a ("ALSA: hda/hdmi: Rewrite to new probe method")
> rewrote the HDMI codec ID tables to a new format. In doing so, recently
> added codec IDs from commit e0a911ac868 ("ALSA: hda: Add missing NVIDIA
> HDA codec IDs") were dropped from the tables. These tables had recently
> been split from the unified table that existed in patch_hdmi.c, and did
> contain the entries in question after the split but before the codec ID
> entries were rewritten to the new format.
> 
> Restore the missing codec ID entries to nvhdmi.c and tegrahdmi.c. There
> do not appear to be any additional missing entries in any of the other
> codec ID tables when compared to the patch_hdmi.c at the final revision
> before the split.
> 
> Fixes: ad781b550f9a ("ALSA: hda/hdmi: Rewrite to new probe method")
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ---
>  sound/hda/codecs/hdmi/nvhdmi.c    | 17 +++++++++++++++++
>  sound/hda/codecs/hdmi/tegrahdmi.c |  2 ++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/sound/hda/codecs/hdmi/nvhdmi.c b/sound/hda/codecs/hdmi/nvhdmi.c
> index b513253b1101..94671ad24b5e 100644
> --- a/sound/hda/codecs/hdmi/nvhdmi.c
> +++ b/sound/hda/codecs/hdmi/nvhdmi.c
> @@ -198,15 +198,32 @@ static const struct hda_device_id snd_hda_id_nvhdmi[] = {
>  	HDA_CODEC_ID_MODEL(0x10de0098, "GPU 98 HDMI/DP",	MODEL_GENERIC),
>  	HDA_CODEC_ID_MODEL(0x10de0099, "GPU 99 HDMI/DP",	MODEL_GENERIC),
>  	HDA_CODEC_ID_MODEL(0x10de009a, "GPU 9a HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de009b, "GPU 9b HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de009c, "GPU 9c HDMI/DP",	MODEL_GENERIC),
>  	HDA_CODEC_ID_MODEL(0x10de009d, "GPU 9d HDMI/DP",	MODEL_GENERIC),
>  	HDA_CODEC_ID_MODEL(0x10de009e, "GPU 9e HDMI/DP",	MODEL_GENERIC),
>  	HDA_CODEC_ID_MODEL(0x10de009f, "GPU 9f HDMI/DP",	MODEL_GENERIC),
>  	HDA_CODEC_ID_MODEL(0x10de00a0, "GPU a0 HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00a1, "GPU a1 HDMI/DP",	MODEL_GENERIC),
>  	HDA_CODEC_ID_MODEL(0x10de00a3, "GPU a3 HDMI/DP",	MODEL_GENERIC),
>  	HDA_CODEC_ID_MODEL(0x10de00a4, "GPU a4 HDMI/DP",	MODEL_GENERIC),
>  	HDA_CODEC_ID_MODEL(0x10de00a5, "GPU a5 HDMI/DP",	MODEL_GENERIC),
>  	HDA_CODEC_ID_MODEL(0x10de00a6, "GPU a6 HDMI/DP",	MODEL_GENERIC),
>  	HDA_CODEC_ID_MODEL(0x10de00a7, "GPU a7 HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00a8, "GPU a8 HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00a9, "GPU a9 HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00aa, "GPU aa HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00ab, "GPU ab HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00ad, "GPU ad HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00ae, "GPU ae HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00af, "GPU af HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00b0, "GPU b0 HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00b1, "GPU b1 HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00c0, "GPU c0 HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00c1, "GPU c1 HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00c3, "GPU c3 HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00c4, "GPU c4 HDMI/DP",	MODEL_GENERIC),
> +	HDA_CODEC_ID_MODEL(0x10de00c5, "GPU c5 HDMI/DP",	MODEL_GENERIC),
>  	{} /* terminator */
>  };
>  MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_nvhdmi);
> diff --git a/sound/hda/codecs/hdmi/tegrahdmi.c b/sound/hda/codecs/hdmi/tegrahdmi.c
> index f1f745187f68..5f6fe31aa202 100644
> --- a/sound/hda/codecs/hdmi/tegrahdmi.c
> +++ b/sound/hda/codecs/hdmi/tegrahdmi.c
> @@ -299,7 +299,9 @@ static const struct hda_device_id snd_hda_id_tegrahdmi[] = {
>  	HDA_CODEC_ID_MODEL(0x10de002f, "Tegra194 HDMI/DP2",	MODEL_TEGRA),
>  	HDA_CODEC_ID_MODEL(0x10de0030, "Tegra194 HDMI/DP3",	MODEL_TEGRA),
>  	HDA_CODEC_ID_MODEL(0x10de0031, "Tegra234 HDMI/DP",	MODEL_TEGRA234),
> +	HDA_CODEC_ID_MODEL(0x10de0033, "SoC 33 HDMI/DP",	MODEL_TEGRA234),
>  	HDA_CODEC_ID_MODEL(0x10de0034, "Tegra264 HDMI/DP",	MODEL_TEGRA234),
> +	HDA_CODEC_ID_MODEL(0x10de0035, "SoC 35 HDMI/DP",	MODEL_TEGRA234),
>  	{} /* terminator */
>  };
>  MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_tegrahdmi);
> -- 
> 2.47.2
> 
