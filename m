Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC832798F8
	for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 14:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357006; cv=fail; b=kzGsq18wtHWZsKoiJLSeSEth0NuXMDW3ZgxHqg8pWZen4U+TtCuGClJCfjm3eSs7GPI7MqrcQMrVhxFQBc2LUiKudIpf1S+izqgS+XjQJf8tFTG++0e/P07hMaV2/4M1FnFynZg1QZQoYIcp3jPTjPQwcrodb+zlxZKy4w9UyaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357006; c=relaxed/simple;
	bh=IF0/A5XQQG1nQKuKf4u/KNmrvVd0h4L1QvbtQpffkpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfQUpunprf5VSKz84MCpQfhUdbmHiu1DSVuhRUU75iUPwoY2SyUer5J07PhZCOPdU+sAC49idrlTKhbbS/KoJ7e0u4sNWZvqO87TIIxwPedbZkD8VdQXq1z6sKGoPFEwhmAZO7+K71FZ/YDvnyzB3DPA0no6bJHq7tMqYy6bq9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qj86EcPH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Tw8vJGpc; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qj86EcPH";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Tw8vJGpc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54REgRnD017232;
	Tue, 27 May 2025 09:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=8AvO/kN574+xflNwS3
	r58Rvaka8BtYwaIoOfFaB/edw=; b=qj86EcPHE8dL4RmKDiuXwRztVytUuA8D24
	OnCrNHuhUL4VkxwWYPklz9Zi1Yjuh0vjanWXJ6uyl4FU0jfGQ1HFMAYwapomLHsX
	hHTGreVp41hL3Yc2Uvw4hf9TghNN0a3XthwYfIRnzcuNzWeGFoqeIOCYRqITa0ds
	e5C1e6GkdfcXUXTmlGdu+GqF5LO/PbaQJuYietrlTzMGnhWfVnmu6AhuvlotxeUP
	9DqgAPdn0Vk1bmB82/Cgb3RvsE0VQwbed/kZAHvMLpDKXiUm+NEso8M4/mlefuIl
	gykRvFQbtM4o8u/Sjl9Nvr5JpaBRrVfoOSCPQ4fqRWHjkk7t2MvA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46ubh24v1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 09:43:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzhXNXMrqhjcHGXZTbUYmm5xQVS5UjWYugiQ+28IoHsRLz9pYvz16fRvaxsNVMFWjnJW1QvB+jnDYJLvyJCZak9mCd3tF5ngJS/qMkc2RVojK6lwqE4YCp7LE/g+LDzoo2mZVTGigDmlJBhEp1Hg30ob1qtaUc9DOaO6TzM9y0FBvT5Dmn9WDPhRiIwLXRKZL1RM+7ZuxsmkAvVdpzklUOb+YroHC6cdkQZzrtWxxAUFgZFJSPACnUOJmp01xcEaZXflw3lyOm0y2yvH4Z8V/xeWhd/hXKFnPJoTVcntQ83A+4AiBxRFTSqgMXzoP95GKwnpgSmXRRaeRW3A1Gh1xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AvO/kN574+xflNwS3r58Rvaka8BtYwaIoOfFaB/edw=;
 b=Y506P5j62V1M0cIq4yO5fXhREYe/aWaEsSKavByexNKnSzjV3HzmfCH6tmlByPS4p8yBdPS3tksbQxo1d8GjrIC8gexJnwjqd9cuQRJtaAsxWwDCyV+rCSpH82YYOx5K4T//dJIx1KiamSVfLLNDTT3VKx58a2r64/7LAdCfbOk9U8OYx9Eo5IPOCVpnI5tflV2LtYTQ6ARxZU/jIufcYpvWcQ32SJYjqn+MDGgPKPEEdnySzwfcMTQdU/2xHwW3c1uCWCNX8us6DcGaZySnehMuSoYbAfzNi4ze/DVooqCoKHijPdFGjlPAhJBwpP4Jbi0zI9wJFO7Wslam2uFkPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AvO/kN574+xflNwS3r58Rvaka8BtYwaIoOfFaB/edw=;
 b=Tw8vJGpcYSw6SY9s+q4GfzP/NPLLwC8v8Sjc+y0sBZH3K0OmtkLOPSpHXTf5qMdinv8si2M3k3ybiaYlFAlH6trhdhdT346hX2HLQWtWPVg5HJR9Ebyqlc0r1oC064UbQDFCy1h2ZhrsDKkVAyWD8hPcR7R1ReD7HFBS1xLVUm0=
Received: from DM6PR06CA0090.namprd06.prod.outlook.com (2603:10b6:5:336::23)
 by PH8PR19MB7095.namprd19.prod.outlook.com (2603:10b6:510:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 14:43:19 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::7e) by DM6PR06CA0090.outlook.office365.com
 (2603:10b6:5:336::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Tue,
 27 May 2025 14:43:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Tue, 27 May 2025 14:43:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2F869406545;
	Tue, 27 May 2025 14:43:17 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 1460D820249;
	Tue, 27 May 2025 14:43:17 +0000 (UTC)
Date: Tue, 27 May 2025 15:43:16 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [bug report] ASoC: SDCA: Create DAPM widgets and routes from
 DisCo
Message-ID: <aDXPhD09VI0jrvZQ@opensource.cirrus.com>
References: <aDWOKjGYd4Qye3Co@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDWOKjGYd4Qye3Co@stanley.mountain>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|PH8PR19MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: bb23e716-ad8d-4ecb-c8a2-08dd9d2cd215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j4QeQhJU6tXH8uksWt+M6+XumOCTlqC71RUpboQUxURhTba8rWjx0a6V9bHG?=
 =?us-ascii?Q?EySTe2K1icQuprpmc1DxFOv7Be0/i9W4z1u7V1R1M/bip6DJfmM/Mu0mFhxo?=
 =?us-ascii?Q?xgndh64KckHkbixxlGsjgljbXsi8KVYRtsEOvQmaWejLSCsJrNQ50uPQL3IP?=
 =?us-ascii?Q?Br+z0JFxS7N4MUNqHd0qd7IhZckZT5b9II7NyYEk3zrZArn7XcSzia6NkBWJ?=
 =?us-ascii?Q?quHpKh2dNZUt5PIqZGO6oFHFucQTsh01pq4hPG/l4jIEHV8sxGlNkY9EbHEt?=
 =?us-ascii?Q?UKQ4lSsrksy/NXJ5aXR5GCOKrGEh8TpP90GDQTMP/eJXY63hOxSDURyp9AHY?=
 =?us-ascii?Q?L7nc/ktx3Wfc4Lq/CE32OaSJndaAc124pVkrrZQSBryDBdNQElkpWJpOZt4y?=
 =?us-ascii?Q?bwplmYcFDs3dONBJrosHfeCoZabt8pehxCQ1yDFRmwYvXFc/zv450d6L/w84?=
 =?us-ascii?Q?Fu9P0iIdczuoKIW37wXaDhtCMGSq0upj0zMMFafL5mALhkDqEOsD6wThuxHf?=
 =?us-ascii?Q?EN9hCPKX/L3m23Q3zno9fIs5/fhgxFj/yETs4x8OuOr7A0MTvcX3wLZgeUnB?=
 =?us-ascii?Q?D2Hn8blx+5dbHgfApEyg/+oOlWbAuaRtqVGrOst1rVhfZ8fHDPNJXqvq+oZ7?=
 =?us-ascii?Q?+qsmkFKpvBJ7eNYRO5KBrP6qEWx8b9W2tUbNh9FAuE1ytxF93eNC7ptpNUiT?=
 =?us-ascii?Q?aj1DhPEy5t9jjGNKVwpIvsAHaH8Bp+tthZvrTd1489BTfjCCyMnP/50zXneG?=
 =?us-ascii?Q?VYO79/JhDv1iWeMEs2JaE7yAj/NIvgWCoN5EfR1Y6kzAAzZUyW8bRF1uSP2X?=
 =?us-ascii?Q?yRpasoXli+iMz5bbFKVr8ZBOplcQ1fuRfP3c6JDbb/UaosEvaf7LLV/Qg48Y?=
 =?us-ascii?Q?nyD8uUoCbRWhBqAssu2V1GBY/Slh1/2A610bmDifJYt1mUNaAprjCTC8jgFT?=
 =?us-ascii?Q?oGbz5V3TyFj0xd6Z0fby2auO+Ioys79s/yisJBXb3Z4tG9KFOJCdH4LyMW0Z?=
 =?us-ascii?Q?W7diTIfuUXusKIfWPYPZoSfTNaRo1uvzLZU0GrUgwmUX4rN7hIz5j8OtdFmr?=
 =?us-ascii?Q?6CciTvz+bebq/txvhLMuOzmUcYuzF/m8Zu+KEi2qlBIk+ih4rt8J+EuSQTNR?=
 =?us-ascii?Q?ho2wKsnUKTx5DIWHS0Gnvae8JUZlM0iD7WFub463zsmG+dtI23e80l6OEJIv?=
 =?us-ascii?Q?ldam1Jvf2eSNgNznyPwkCnD2Oe79K9emT6yg+8chSEhKJRImNDX07LRhf1d+?=
 =?us-ascii?Q?0h5HRuCDrn940PfWxRTAb+qwtrZAqLY54Q6f9tXgKDS7OKfQj26hentHYIwD?=
 =?us-ascii?Q?oWtEWTI6lhQfc7/QGL+IF4D8s8b1NqlI9jb+sA9HXnqchujIVjl/S3tfXnhV?=
 =?us-ascii?Q?duEIRQ6O4BrHKChh2gjxrOvpQ/AblzHaaoYkAJQwwdPbao0hY6nAmBqiqISg?=
 =?us-ascii?Q?V13oCWYDkdsUMNRbxOCDK586lcOl+D/gZNmwLD6AvcRF+eJzGVSVVzw5TtUh?=
 =?us-ascii?Q?nYpmFPmvUGgyqDrxykEOA2S764neIPzrU/bv?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 14:43:18.2552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb23e716-ad8d-4ecb-c8a2-08dd9d2cd215
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7095
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEyMSBTYWx0ZWRfX0GTtxBzpZGZN M3TP5OAn4c8Zdwd0Mgs+8YW5lj+dVP6Zou7o5pl5f7gptn9t8qhb/avlMang4gZ5k0rH1NMx+o2 ravK8CGgsfJy9EpCMdIlEX/3zg9ZbobovffNuIApOmIHxA8k8xFhT5VzDfWwivDKe4pet5iD5MW
 wGqrmptMQ54d74n07S6DLTaVYai7sn/Un5WpUSNKK0PBFOBoyPwcNrQQ5ZrDLuUKdFE7ad+0Nnt gtHOR6Ni9H6z5Pp0TTap1QL0Ly+1rYfTB2DUv5i5Xi81Lp32bou5KrwOJ8EpCKmBKBBpRK/o+qY J+C9WpDYQT/1J4ITQTi+oT5OUclOtiNgaQEWe5C+vWO5LNTsPkwibYjVhFX86WrdpIgUDnIB4iI
 5TmkUFGZbNy1ff9U+DZljQULiAAsmttmGBIiOZPDPc3M4k9riACSs9QhhQi2INOJGiKgQAqn
X-Authority-Analysis: v=2.4 cv=MtxS63ae c=1 sm=1 tr=0 ts=6835cf8a cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=nvYfozEr8CBd6-XN0UoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: nNDvzyfuy_7Wu3qYErXSSV6U_8uqFx-s
X-Proofpoint-GUID: nNDvzyfuy_7Wu3qYErXSSV6U_8uqFx-s
X-Proofpoint-Spam-Reason: safe

On Tue, May 27, 2025 at 01:04:26PM +0300, Dan Carpenter wrote:
> sound/soc/sdca/sdca_asoc.c
>     377 static int entity_pde_event(struct snd_soc_dapm_widget *widget,
>     378                             struct snd_kcontrol *kctl, int event)
>     379 {
>     380         struct snd_soc_component *component = widget->dapm->component;
>     381         struct sdca_entity *entity = widget->priv;
>     382         static const int polls = 100;
>     383         unsigned int reg, val;
>     384         int from, to, i;
>     385         int poll_us;
>     386         int ret;
>     387 
>     388         if (!component)
>     389                 return -EIO;
>     390 
>     391         switch (event) {
>     392         case SND_SOC_DAPM_POST_PMD:
>     393                 from = widget->on_val;
>     394                 to = widget->off_val;
>     395                 break;
>     396         case SND_SOC_DAPM_POST_PMU:
>     397                 from = widget->off_val;
>     398                 to = widget->on_val;
>     399                 break;
> 
> Smatch does a fairly naive analysis of the callers and thinks that
> event could be 1-2,4,8,16,32,64,128.

This should actually be safe as the widget that uses this
callback only registers for these two events, that said it is
probably nicer to have a default case anyway incase things change
later. I will fire out a patch shortly.

Thanks,
Charles
