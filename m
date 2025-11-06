Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4164266B66
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 09:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762421767; cv=fail; b=o5WLCuKMJYJhMtgCxMWi7A6apmoonmeKTAGdhf6rZ8y4Vv5rSNUwBkYXBzw1KN105RxN9hzxjvQWVHWypDcBnsqNUwAHxSPf9pe9BJJ+q4nsD11W3uX7gnkgwdYSYoN6+q+mhlu1ML//nKCjDk+XQjeRXMKyKQaytRDLXI6qP98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762421767; c=relaxed/simple;
	bh=nxvya7E7zdHrk6Oar6yfb/+bcqWKGcncN99IHAxsRG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhn0o39PneRdB0M/LmFt3pilppoa/FBEfzma2eVEReel1gAkd/Q5wpi7WA3CLBzheFq+LESuyxnzXtmpVS+wcBRYPXE7RziqpKFKXDfbfgTfCGAQitSIK3i0WkS89ajKt1ryT1E1SAg9J8N3NMelCBedDeSNm1eF098lVXn8kxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mSN+cV9c; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YiVw/Oj+; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mSN+cV9c";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YiVw/Oj+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A65vGYq219643;
	Thu, 6 Nov 2025 03:35:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=iVoqG7j1FDjcd9N1W7DCht3jBkWYUAqCXjMALvOX0lI=; b=
	mSN+cV9c/Sj/TMFKYTgiJVYIlhQY/ZDaSs7ZYn4x9oR7WUTlUI0WS16WX/bDcR9D
	0x6CCD3Tdpab/3I9GlMkIaxbQv5pqyYrU6GLirdxct/8cdQQM5dOuVhO7h4deXe1
	YC17bOBe+rcFeuzvzHOkUb2LcP9qW1iPss7jCuHlx4fcLhxs21MfIx4IIE7OgRMO
	5e0qGoozeKwD6/5dLumM1BjWkrgK4u+O3hGb/jtaiZI/ULXMeEk6X5Fk2GZD2YvA
	1YwAg8wtSX8uNOgqmAu3ijsJJQdC4Rs053sAf/I6VhV83AhwVn5zS1CSLg2DF/ay
	kjqbNUZPmTiIM9wmSd/3qw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022091.outbound.protection.outlook.com [40.107.209.91])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a7bwx379p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 03:35:32 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrvfEBzVFTBZTW7hjQfZXtf78SZEoIXg/FwrCUBLXaUAeXSQMWCfM8ps8QeZhy6zFfrRuMgEdFITnKO3/D23CDX5UwmMVF60SjrL/12vi5KdyDbQLlzbn0+VlZl+EzqrglF2UqjaQatO7HJZMpBG/5NNiOuhwtco10rObyt9QL94nYAv4gk4q2+VLmGwK4Fr47psg7WKPD/vht1nIgbDfCsCkG0AUX5761JwnfxYBtt5T8tN6CijvnxB+gBn03H9dzFsYqpNVH0PuRpDy1oFanD5Qwo1v4Mu+lLsVF9hw5as7VDjOCjwulDwhCm545HAEI0XR5q8rRGrixCd1RyS4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVoqG7j1FDjcd9N1W7DCht3jBkWYUAqCXjMALvOX0lI=;
 b=ZnIKKNBJcVGHyS7C0/NFposZALLDpN+sUua2NcNZ0i5m/fEGEIlMj+ud8IW6Q1NKal3aTmFCqwNVUoR694AIc3gVt9Ys6dRjMVghIYOTXAdsC9YCxg8olsS3t3JdDlqhLnnBwI6SYPKSJtZf3U+PxoE353hhwoc96QKER5BQhIzmlJ0BiFGiRCwlGIIJ/XTEvPSaI9uMIq1Lm8Ea41rmPM0vV0PU4Tfu2DoTuji/+cGMtvnfiEpmVVAq8NHYUyUB4bSbElqBW5lyemuuvUwUX9gyLzS2fYTyv83crmTVv/1/mOhIGHyzNn2rBNtUaw4Eoe3iN3vOJzFayQpDC6Eoeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVoqG7j1FDjcd9N1W7DCht3jBkWYUAqCXjMALvOX0lI=;
 b=YiVw/Oj+L9M3gIZHM/mqYIyoByNNKFF8EPfqRNPePdRnnNSytfIk5ZU8/gdI7Q0OPIytPEKOk2s58J5X2quk48kSAbiSIzVMg5LP0JACyzNfkskaknjC5bGYTk92RpMFtRFnZuilreC6N6JlXyhtk3Jpilx8KdchnxzwZfEKCNY=
Received: from BY3PR04CA0016.namprd04.prod.outlook.com (2603:10b6:a03:217::21)
 by DS7PR19MB8830.namprd19.prod.outlook.com (2603:10b6:8:250::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 09:35:28 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::48) by BY3PR04CA0016.outlook.office365.com
 (2603:10b6:a03:217::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 09:35:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 09:35:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BFA6A406540;
	Thu,  6 Nov 2025 09:35:25 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AB8C9820247;
	Thu,  6 Nov 2025 09:35:25 +0000 (UTC)
Date: Thu, 6 Nov 2025 09:35:24 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: SDCA: support Q7.8 volume format
Message-ID: <aQxr3E3BxwjdFgQV@opensource.cirrus.com>
References: <20251105091122.495561-1-shumingf@realtek.com>
 <aQteVxu1gLyzbfLs@opensource.cirrus.com>
 <c61adef5f21141d99b20182bac6216e6@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c61adef5f21141d99b20182bac6216e6@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|DS7PR19MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: f5ee2002-a7b0-4f12-cc2e-08de1d17d22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUV1azBRSTBFWmxib2NWRjh6T1YyektYcEd5UUp0OWd5a0l3blZuaE1Vd2NZ?=
 =?utf-8?B?YW4zdjN1Qis1ZTJkMHNrRDJBb1I4aVd5T0Y3aThxWGFONmdNaG4xOU4wVk9X?=
 =?utf-8?B?MDU3cW04N2hFaitRd3IzcU9ZUVhHR3lwMmw0SUx2NkR3azZqdFFSY0toSVpX?=
 =?utf-8?B?RkpYTThQYVV3V3Z0Y0dTNHJ5NkpCWi92cmhDUGVPZDBQVkJTOE9sTjBtWUVJ?=
 =?utf-8?B?ZDRITXpJbnhFZGVTMjM0aC9OclhwcWswVmppRTErUmY0Q0xQc3BiT2pvVm5u?=
 =?utf-8?B?M0Zzb3I5OWxydWVEL1oydEs2QjhENzVqeG9CY1pZQ0dkeFkzV0tJR0hxdyt2?=
 =?utf-8?B?cXAyNHloS3R6TDBIdzVDWXhVb3ZmN1FaNmlUYUpXMnJ3dExVOWphWTV6OEZC?=
 =?utf-8?B?dGx4ZXBvVXEyQTc1ZzVwamNZMzUzRTljWkFPZS9mQTZ4R0dxUFA4TVJUTWR6?=
 =?utf-8?B?dEFyQ3h2YkZZWEpVc3NXb25BaUpncUhZa1V0QTdxdkpIVy81VzhOSmpZY1dW?=
 =?utf-8?B?Sk9NV2MyNGJ2NlpOLzFyUXFRVHVjR05KT2dnTFhxRE9tN081Z0ZabFpRdnJG?=
 =?utf-8?B?YkxXRTRDZzRvZURJam5hMC9jclRMSlVIKyt6VURPTzZXTDluVnphQ3NUNjM4?=
 =?utf-8?B?N2xOSDVDRTZFTkd6a2QvM0VxamY2TGdwTlVHQk1BbzN2L2dXWkNXSFZRdVNQ?=
 =?utf-8?B?Q0JlMitUakpqQUI3bEdQeVMwTlgyeUh1RStRZXlURXZXd3VFc0NQZ1ZMWDU0?=
 =?utf-8?B?WXhmaXlBL1FkUEx3TXpzZDNQN2pxakUxdmZ4MzJ2MW03NjluRkxaRkIzb3hU?=
 =?utf-8?B?NDlITkJqUHJ1UnlXTkN4dXlXalp6cG4yempEbFF6WGt1MmpYaFVqQjlROFFL?=
 =?utf-8?B?cGpjODltTEV3RkF6akd2UE9vaTE2bHR3Q3JMQTVUajV6bXNOK2VNT3pDaGx2?=
 =?utf-8?B?b2ljYXg1ek1vWlcxcmd2ZXJTRmxaTUlSUnduRnlVdEg3MjhmMUlJUzNlZito?=
 =?utf-8?B?blh5NmR6L2NJRmFSZmt3elpyM2tCWkZFaks0TjRNaFdrNjBZeE5oMWdOdm5o?=
 =?utf-8?B?ZWFqZjB5bjRveUlVMGhPeCtLUkxRM2E1UHh3M3g4aTJ1akJoNzFqeWhZM050?=
 =?utf-8?B?alFYa3Y2TjNQNkVxK3Qvbi9BV3EyNFNjRzJRTTBjL2pYQ01TVDJONzF4bVFB?=
 =?utf-8?B?cmF2c0E4L3ZBMWIzbGFXSzBuV2tDL1Q5MWRycFlNQ3BoeWxRL3VXck51aU5j?=
 =?utf-8?B?YzY5QlZKa2IvaG5INHRHbDcyY1VmNWVKUk9oNlJEZWdQMm5iaERvOUhxUVcy?=
 =?utf-8?B?TGJ2QWdkNENJaFNVRCtlRlp0eGxSbisrTFE5ZU5uVzd0Y1ZpdGJTS0JoVStq?=
 =?utf-8?B?SFBlVnNQL0xIUWFzTS9iMzZzOGdod3ZtK0hqYXVwdkdiMnJGeU1iNno5NzZD?=
 =?utf-8?B?c2NFNUIzU2xQc3l4NW5zdlViVkNYSlA3WEhNZDQrRXZjN2VRRFBpamM2MXM4?=
 =?utf-8?B?Q1Awd3RJaXVmMGVxcnFjTS9tQkw0aFNVZmZJT3ROMW9iVWt3bDJZQUVhTDJh?=
 =?utf-8?B?cFFjMmhMMTIxeUdqVkNuZGgyaFhFNGNyREZqblNyT2VQVi9DUEs3anU2elZQ?=
 =?utf-8?B?TVVFVFZRb3owdkpBNlVIQ1BYdzdYdFpsMitwRk1nNzdWS2ljN2F5RXV2WWk5?=
 =?utf-8?B?eTlBQzJ4azdtMjFEV2ZLNGVpK1JiT2s2eUQxbi9OMWZVbStHNko0S2lmZWI0?=
 =?utf-8?B?UFN4VHRoM0Vaa1RTNG5oMHZLMzRjY1lUSFVONGtVMVhNSFk0SktIb05oaW52?=
 =?utf-8?B?T0g0ZUZvMVB1K1RneWNVQ0NTalpBRGpndDE5b285MUVoSEczYlk1TVBmUTFT?=
 =?utf-8?B?WVV2Znhud0RXYjFrdXZ2QVM4TDRMTDJaQzZtdXVPTlA5TXVqcy81eGZuNXJs?=
 =?utf-8?B?bUFBZTl0OHNpdENsNVdlZWhNOEptZm40R2JpQmFoS0djSDIzRlB4VEFleUZI?=
 =?utf-8?B?d0o2eWloTkorR0VKaHI5SWY0Ynd2UmdhQ3pZVUZMc3R5SnQ2T0N6VnZJOGFn?=
 =?utf-8?B?V0hkelIvaDRyTmViUE1tR09rWktxbk90VkZIcFM2WUNQMmhRSFB1c0c0b0xD?=
 =?utf-8?Q?rSuM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 09:35:27.7378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ee2002-a7b0-4f12-cc2e-08de1d17d22c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB8830
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA3NyBTYWx0ZWRfX72xV6ja+/D6C
 LT613IpuCCWMevMnRlMFbUuBJw5MJGb3x9lh4nBOQAd5f/4xp3xWBgLePx7yIbLFlLO8zA/QXjZ
 UcGY/n/2Mc2+jPcg8u+2+Zka3amN8oILKNQvr0UNQqeGxCaickxlea85THE+wxs+Wrq+1dj0lW7
 AlYeCMe7sMHMtYmwMYzwcbjFqil81/lpzmIllke8HUWa4fkOij8fgUOLali0cEoNFDHqbciKwrR
 llTh9eJ67hnkIh0BtwUpmjV2HL9EYOfhol/AfeJC4sklfne7KUfDQTcug3lzgWbmcyUALd8d4/A
 ligyL98IGY3u7dBV8BugPO050k0CGai42jlAB0XAbTlfTMnqnONruAUMLxUtWHVIphXc3ilmXSw
 Xsa/NbZms2tCdRro8hsoxZbvfzl9Jw==
X-Proofpoint-ORIG-GUID: 71RcDhdRbfSzbGR7sApX_TM7NiwiyYHL
X-Proofpoint-GUID: 71RcDhdRbfSzbGR7sApX_TM7NiwiyYHL
X-Authority-Analysis: v=2.4 cv=FpcIPmrq c=1 sm=1 tr=0 ts=690c6be4 cx=c_pps
 a=MYP/rumDVsRFgfoFHJYHXQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=E9PreofKB9Ku8QRQz64A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 06, 2025 at 02:30:17AM +0000, Shuming [范書銘] wrote:
> > > +static int sdca_soc_q78_reg_to_ctl(struct soc_mixer_control *mc, unsigned
> > int reg_val,
> > > +                             unsigned int mask, unsigned int shift,
> > > +int max) {
> > > +     int val = reg_val;
> > > +
> > > +     if (WARN_ON(!mc->shift))
> > 
> > We should use the function argument for shift in these functions.
> 
> It is intentional to do this. 
> The patch only uses the 'shift' field to store the step value and the 'rshift' field remains zero.
> Therefore, we could reuse the function 'soc_put_volsw' and generate the correct result for stereo volume.

Ah ok that does make sense, perhaps a comment for this would be
good.

> > >  static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int
> > reg_val,
> > >                               unsigned int mask, unsigned int shift,
> > > int max)  { @@ -202,14 +232,22 @@ static int soc_put_volsw(struct
> > > snd_kcontrol *kcontrol,
> > >       unsigned int val2 = 0;
> > >       bool double_r = false;
> > >       int ret;
> > > +     unsigned int (*ctl_to_reg)(struct soc_mixer_control *, int,
> > > + unsigned int, unsigned int, int);
> > 
> > Would be nice to put this at the top of the variable list, given the length.
> 
> Will fix

Thanks,
Charles
