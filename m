Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942743AE6E0;
	Fri,  6 Mar 2026 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808868; cv=fail; b=nccf6rZ67brteAJ88PDRAhqbj1M/kCqwQZ5ZQBSu4my40ze7tTGDFxNkhjW0101sUM8vq0ho5jGaIRJ3z/CIeVQqQ1ZPl1/bh5SiU6mHrcLAys1wNWE5STlNYO83YGnyYXOvGSuz3DR2LYsrS54QMRhOjP5lhRBiwmeSSOxOw1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808868; c=relaxed/simple;
	bh=Svr5nxUwemzQtW9nOmGvsApsWBN8c62VXtaMs0mZ+sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gjn+BDaggq5vZTS/3Y02HnBGSa8eVXY5+XBH+AwgW/4N3WTYUzwR+d01F46R6FP5dSJjSCFBN0/bWn5+0BzCRF94onUsixSvyKcYa2AlUs4i5tjBkf1Z+RJpw0lX56GkXQkYjf68RLydrklz8HNI9A8eh0v2ZTu/DvvMiAACC0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=f15Bc3OT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NL79Koyc; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="f15Bc3OT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NL79Koyc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62649SVk2181912;
	Fri, 6 Mar 2026 08:53:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=+1NvfkKDufZiCPaEUD
	57Lyid70b7ElEI4XZS+ILu/Bo=; b=f15Bc3OTLMf1Oto9f/9fb1azGyJvw/XD0L
	2+K2eRtgrVMKFtY9scuspSq3l+EXgRM0YQy8oJVcTCywzo50snBeZEXSr7dEd8fk
	U9o5KFNTOIYvQtrLlu+rKpZYA35R/W6nnWPNkOLesmu2zkQIuX4e9rp7UGRAJ3NF
	vS8looAdzDUAKitkCs+WlSqMAzSgmMzWQacYxXbHhlH/EJ10J+CUZxsmDXL79aF3
	MCZodJyUWk6vYnjQQfbQZcrTBfBHGmahU3DxRQqxoTQ+XKkF/XcMaDytDEd0BtQ2
	TPBkZvYIMwKg7RAfGr4CeHQrroZ077xN/elCQPSVD/lhyc2oVxOw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021120.outbound.protection.outlook.com [40.107.208.120])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ckxn08122-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 08:53:59 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7FZKpr5wR61owLD3dzLjk9Eds4VwwwXRe9y7zLS/Awsg2ZssnbGZgb7OxpWq3LClTir1WKeoRT5NvQXdwPBPgFGO/WGR3PO4ITyYXgepDA3GDgP9fplEDN9+qhQtCByN0xP0MPVjnemZABFhHjqpNfkMMmQ9YYA9qPzH85Q6/5mnvpK91YECYPAz/OxaUTJUOZKPkLjTFU+Y644UXK17zO+n1cMCZ7EftMEbS9gPU4uiRq7OU0fRMU1PUl83I7BibDT5Iz8naiNq2u82UO42O7L78qjoYyDq3S2C2Wb62sWl7h4fk2j/yB1jFbh8sF29WVNzYzonX+zEaj3o10OOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1NvfkKDufZiCPaEUD57Lyid70b7ElEI4XZS+ILu/Bo=;
 b=VoMvtGUNqr52SduCken7cNupUmTNkDFblt7+8wkPoXSEIMJQJEOLdn131x90rZYgCxUUF6LYodC5LvsLId6JQhc3lwua9ILSV3UCdRgdBky+XrbkL7kwP0pUzRhFhKBu5C8Ayizrjeg+BnjPeasyq2CZlfWqPYkFEciYzxLwx+yS8ljSJNd2gFQptmJ+682GZHUwSJhn+ykbjTes8dvCG61RhL02k2fNMst9L2t3+jreZM2d3r66+Vnf2tjd4W3fj42iCDvVfLaIyCuR+OwnJ35ZDYKdRlRgTbs6cUj952jU2zqJybLGOdplSDZwQA48mUu8uwS+aOKR7/MCFdr3Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1NvfkKDufZiCPaEUD57Lyid70b7ElEI4XZS+ILu/Bo=;
 b=NL79KoycJlYaHeEpRb6jcQNTH0OqLWis2cgcs7mcR/Ui0vNmpKmZvKIwvMmngIvEY+Lbyzgg6knPXGZ7dPFH4iG5/wrMokApXoqEwBW7y9jX1PIXLOjz8kk5HU5j3o1AJ+Oyq1aPbhXFH15FZZd508PwTxRAYTuetdkL4+Tqxkg=
Received: from BL1PR13CA0394.namprd13.prod.outlook.com (2603:10b6:208:2c2::9)
 by SA3PR19MB9405.namprd19.prod.outlook.com (2603:10b6:806:492::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 14:53:56 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::df) by BL1PR13CA0394.outlook.office365.com
 (2603:10b6:208:2c2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 14:53:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Fri, 6 Mar 2026 14:53:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 344C8406542;
	Fri,  6 Mar 2026 14:53:55 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1D55082024B;
	Fri,  6 Mar 2026 14:53:55 +0000 (UTC)
Date: Fri, 6 Mar 2026 14:53:53 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 RESEND 4/4] ASoC: cs42l43: Add support for the B
 variant
Message-ID: <aarqgWFwcpqXu7BI@opensource.cirrus.com>
References: <20260227130120.3070893-1-mstrozek@opensource.cirrus.com>
 <20260227130120.3070893-5-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227130120.3070893-5-mstrozek@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|SA3PR19MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a77b819-cd46-41db-d0b0-08de7b90311d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	xt3HtsFFSgxG5wqa2yQBw15pbj9MeBWIgBOZgU32IXrBLT8OL2ETmg1msWO33iVSL7JYR34ScTW+3uMZo5fF3NDTkVB4wJDzvTNqGGxzsd96w5OwRiXZu/auOXkEY7ioMM9hct2k7ykGg22eRD/aUnzDFfIOR3W/rEvRUwhqHhlPeAE0ypk2LUUyssWIuEggHvRCQpIzXjV9C/MatuuBWZdrWX+0m4ofHPNbWctVqUi8Y01rlX5nZP7Hmw+KnQgJjzAJ0vUUcowU9v/9B8E2CQ5gKGW0AbFD1V1HjmpjaUHqEpVKLZE4drSKATFZ8nZvG9remJlEeaJnctX9xphSieUsJaux8bpzmAojZdvGpJRR5wveopTv1rcAnqFfGRo/1QiOSiaikk01ZrLuN4uJayWI25f/8WwgV1F2n9cnPIZ/u32tNhgTlUdTNCjFOTE1wLXT2M80G9atLaIU59VoNQMUjCoUhEr1RposTn0JtrfQOeDXA+K1WdCR2k/cjaxz89ywfSGphdqIU6o6EtwvS4Snm9qjbD44k1YcZexkgsvXTDI6ZvtpTUaOyNbgW8I8cPwdkMBlOMhlYcmyyr/2tOZbiQHy/a0jTkcsfvEACCaxr5tw9+E4KvPcpQIESxIpvaMiMWZPzzGNsVGuv16JlaGlzX+bdsdPaMMfMdRFHG9ev3PDyhOxb45A112hH+E9/e9HraNCOc8p9GrmKH2hOf5GzFBHncvYMsg+MdR7Sfp8WJYm3IrdNwyoRxHFJ+fOJ4eKUvxst/fANzUdfe0YjQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EHDzxIhfcfJhfY+g9kytJWu2ekfw8g5YBbC0mb1GsBVMbAB+ITUsfND9IVwIvYOJcIsUulkNm3s4FUlZyjazhHGEbfRzfqnqybTSLtreef+6qlpFctEXdtW+2DP06iZlKokrY9z2YP84uI6zKKtmJqDRO6ooHHQZKVKPssozksAxvLc/dKl7VdyBgj4SwbT5amJBHZ/92AbX5kk5tvGSwClbzrAvl44QD22+Aer9TCn1t2Z2AmueB1RE0YrsAH7UKQWGXuLTrbRTLmyCUBxyTBfJbvF1f0zLSyMmBfPUqODMg4a4zGNM00FFCsM2WLgEtrRO5h+tlgDROcrstWlB1DSLdDmgX5gqywLxBXyOvLO4vrbLETW72WFSy2jD0b/CKUtt2WclAUTfvFpowGc84GWWr+Px+wSsj/HCJnSB1gseKkPHfPpDwk2+5APVG1W1
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 14:53:56.0662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a77b819-cd46-41db-d0b0-08de7b90311d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9405
X-Proofpoint-GUID: piZucN6LJ71ihtIcVH7u18U4Gz8zJgEo
X-Authority-Analysis: v=2.4 cv=VtQuwu2n c=1 sm=1 tr=0 ts=69aaea87 cx=c_pps
 a=eQAqIyCScLYb0ahyOVIXtg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=Sy-5bNtJiARLi6gc6dcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0MyBTYWx0ZWRfX1kD5Irpg74dp
 Da8uaQSJvqc+vxAsA9q53s3QpvFb7sYAp6mWONNMx8lcEQFexHv9cJoEDGSCVaa/eVR81xXn8jq
 5Gnia/Xpn4Ewamuosaco9qOts10GTKhtDKhZXYkCVEZ1KloB+bEJUl6gwGInyI8qBZRQajElluO
 rBxOn1H/T5f/K4uWYRHs47OeEWey/9XgxF/pGU5MxrNPi2CbvPcB1GO310o4uv5MMpISnz4VkIW
 KtXLqHSdyiL2q2/uoAQGXVKKJ0zxzWpx8PLzM1ZlUM+mbDSLVcJtPi5oqPMUhgKj++zFBRwA0Sa
 12D5CJm+c2+XGVRuTlLzj8hH+RMZyZ4MumLKbWIAe9UNQJNk9R0YCzdoagG2DIDGqgkPuIEuPoT
 mEph3B+sJMQDcd+3DFiWSiNDge7uoLRBf8oZI8jVToTucAchvW74POr/RcA+pk2keDDH8WbuDMW
 gxIXY5OFzuGH7ufmW1A==
X-Proofpoint-ORIG-GUID: piZucN6LJ71ihtIcVH7u18U4Gz8zJgEo
X-Proofpoint-Spam-Reason: safe

On Fri, Feb 27, 2026 at 01:01:01PM +0000, Maciej Strozek wrote:
> Introducing CS42L43B codec, a variant of CS42L43 which can be driven by
> the same driver.
> 
> Changes in CS42L43 driver specific for CS42L43B:
> - Decimator 1 and 2 are dedicated to ADC, can't be selected for PDM
> - Decimators 3 and 4 are connected to PDM1
> - Added Decimator 5 and 6 for PDM2
> - Supports SoundWire Clock Gearing
> - Updated ROM requiring no patching
> - Reduced RAM space
> - Each ISRC has 4 decimators now
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---
>  static int cs42l43_component_probe(struct snd_soc_component *component)
>  {
> +	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);

This needs updated to snd_soc_component_to_dapm.

Thanks,
Charles
