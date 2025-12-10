Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BD01494DB
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 16:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765384377; cv=fail; b=pyKupUpJmUHYBA8jCHwcWWHZZtjrNuI89BV1fP8tQB0peCIQuuoasEWdOhU4UvOSnDra88dFrXhbnBsxJX9Jy4maqfPJ0v/zWpY9+trCgoNiQnYPiFl7zSxqHsJR01IPkUr5W6nccJMa/UOxsWEKXAVfKURz9WNNDqBQUwa3edM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765384377; c=relaxed/simple;
	bh=BfQ3T1MkptZYUe4NnIrYFTvHB5SpvgzxCiRpw841JXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHQp1IyfWF0//V74dbzd3S7D7typJGyZW3puyYEZN8I2K7uTCTyyFGVRwcDxCdFNnuHMUQhB3WhD7J+iSMgy4PxndV2yLM6947C3upyfgZ5h/eklSHLg1G5YWiIZVjK3trxdPssG1IPfcuS4Eg0BA/pM3muQ3/NPgkwXpLxeIfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cIEXGdhm; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wNU2MaxM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cIEXGdhm";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wNU2MaxM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA1Qqk32242940;
	Wed, 10 Dec 2025 10:31:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=TWRCQ8LkcYB9hhYi+2
	RxaYxfspTLQavFgF6/ol8X3BE=; b=cIEXGdhmroeBj5eoMV/wNte9lI/lPW5vMh
	FDltLX0NZZKElniFspBwjWSDFkEMj5JCXl2d7HO0mjcCRcyD2jDBkgOvH08Xulmf
	6C68/B9KrjVUii3TE6Tt0aDhaGVoK40CKyvCXInGJS818u45cmod5tBx1FWZ48SZ
	pRiR0HGFje4vo62FHemAtVT4LlyUBqhbpb/HQruTCAE26xfVyVclsvIVPX919qVT
	yjbfA4NeOymQXARxawq6EJcfsPtPXdtOjIs8AJjXr9SVWDmlz1fcO6vS+MLNpcMb
	Fc1cyTpwYfR5RcxQ5EZrYiUlwBavbZRBXmGpO3ffZYoxHJko0W8Q==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022086.outbound.protection.outlook.com [40.107.200.86])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4avhskt8wu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 10:31:44 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cE+2BKpV9jhLD7Omd5Ay/mbWaXC+dznBCAbjU7P+Gy+V4pq/9+4zZFHCZWPzhJL7DK7cPSzvI6kh4Wd+Uw/REC59z+KnX5rXufd59sKsfbZR2q4vLUa7zIL7xd4/XadmoM5/w1CsG1Z37qEzF4CFV9ex+y3QYjaGhixTeD3Cjyp0E/gIy6RFfHLFk8mv2A0Y3bcuuHjJyo0osxfw/De83NEK/NcFB3mkRynQH5ejO41mkhuucDxRySjKsRV+ynu5+72OT7ixgiLaRTs7kK7nPJMSHaWx54CvO6DIPR+2VvZcpHPJCgCYy39z4RZX/2hClenb43QJbf7L40BRqlSlgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWRCQ8LkcYB9hhYi+2RxaYxfspTLQavFgF6/ol8X3BE=;
 b=E4Q2iT6q5VSKkapUar28MrjkA02qYOzQRLgxYK20WYGP5ojaTKmAPu1ecJob402Jr1QD15YxajYPHx5XqWLqmFbNZQGwRlyfpr/y6SFCcWjJ6Mh9lZN+AoSfDkCl8apQC7yjMkPpHlPho3CqxPGZrZUyZ5AXRC4qhrg9hIROuXK20u8m5BuXaJHwlU97GqlvOAg9DYr/sAN62KKCUT7KDsHlCHfUMz/JfbFp/jfoCv6b6YfRVV6uoN6R2nRfQZ5S8QmKbnBkKIW+KDYOVVh19WQldErtcClxy8BXIvlvf/BrMxk329uT++ZanHOIwshaZMsANU+WIp7hBsdPIJkOaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWRCQ8LkcYB9hhYi+2RxaYxfspTLQavFgF6/ol8X3BE=;
 b=wNU2MaxM9iGEoQ46hHemLp2Y/fBhsxybC3nwLy7VeMfUY0c2Dyu/3jQsIcQw4x/Mh35Kst9OmM2Yr93mHfUg7qjV7tjFxcdezd2irhgOPCHcKFh7Djzbp/SG82ZjnwepueaTJbhAiQFRgKaLUPvtUov1/VB6LmJVUvRSGXRb/Js=
Received: from DS7PR03CA0075.namprd03.prod.outlook.com (2603:10b6:5:3bb::20)
 by IA0PPF369C4E4C3.namprd19.prod.outlook.com (2603:10b6:20f:fc04::c9a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Wed, 10 Dec
 2025 16:31:39 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::51) by DS7PR03CA0075.outlook.office365.com
 (2603:10b6:5:3bb::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Wed,
 10 Dec 2025 16:31:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Wed, 10 Dec 2025 16:31:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ACE41406540;
	Wed, 10 Dec 2025 16:31:37 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9604082024D;
	Wed, 10 Dec 2025 16:31:37 +0000 (UTC)
Date: Wed, 10 Dec 2025 16:31:36 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com, vkoul@kernel.org,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 1/7] ASoC: SDCA: Factor out jack handling into new c file
Message-ID: <aTmgaKR0/MCBjc29@opensource.cirrus.com>
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-2-ckeepax@opensource.cirrus.com>
 <b4e00b53-c87d-48e5-9e95-18531a23bde8@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4e00b53-c87d-48e5-9e95-18531a23bde8@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|IA0PPF369C4E4C3:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e52f86-f366-40a8-69a4-08de38099824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P3x8RgelW58pkaDqJMR7nbY6HrYvZuLwfPl9g8lFquDALSZ/lRgZjyJNS/D+?=
 =?us-ascii?Q?aouyffakUjewee8hGyVAQFQv9rTzFShRUJ9KEmic13ztdvlXn8KKuPf7v4Dz?=
 =?us-ascii?Q?OGfGsfQ6IXrxKDiEdLbPldQHbhEJDfgblZ/Z4VSEPjaO64osy/RzFmI1XVu0?=
 =?us-ascii?Q?CJaP2mrAdTghXWQ25o7hUeZlCTvQPMuZe9qdcnMIsMBNaCJki2h1tJi259A1?=
 =?us-ascii?Q?jootNPx4ZPlphAlMRQM8JFf8I0g5cxiOu40rYqLoWrbyXOJznzyGH0DcwhwN?=
 =?us-ascii?Q?7tfWiV6VGDp+p64bULjqsMyitics8DQP0HOxW8Kfdw8Cy6MjhYSaZabcYu0J?=
 =?us-ascii?Q?UUrBWJI6xtzVrYp4zpJe0noqGMaSm/usHQcBNT9oUNGbZ6ecRNdE5uFNN9YC?=
 =?us-ascii?Q?Kj9q0D/t1d4Q3tBbWv5iluuNr9GMqRWm3/Z2r3uM4gw2bcZdQ1AOhm2KGUWh?=
 =?us-ascii?Q?gBfpNXL2JLjVKnfZWcm0vXANcUb18bjEns6vl/+f3YWbdbOAukEA7P6ooESL?=
 =?us-ascii?Q?BkgWIOJWUoFAPhR3PRXAmDFPBFYgP+CHNIGYn22fLa/LX36sAErJz9gTz/46?=
 =?us-ascii?Q?Ua8YrPH+pf3qjaGhoV6RjLnr8h8JpdNjsxKyu0xQamRJcfp2MdZt4reH9eWc?=
 =?us-ascii?Q?sh7+rmhMttMp+UCpSlKd3Uwv9OkkUIGdKiYqUAoB6gnFQQ67CN4XryevXZwy?=
 =?us-ascii?Q?JKtTAyRRUNHX4VGczeywBEuDSPojVIhNu8Xqgz+bx6iiWp3T5Gh4YFy/zjzc?=
 =?us-ascii?Q?+JXwU6eAPfjYY1FcAt7LX74N/bK1+ypVHO5A6RaM6WvhCzhLSRj655zuWEgV?=
 =?us-ascii?Q?L+N31SKj92W2gVXUpecr4sYV8oXTFTJbwgpiwejIdhbCE8FFJ/ZCrHxo9s8J?=
 =?us-ascii?Q?PFpsXta/ADOxE8crIxCC70jrcBtq17s4rFSlZH7nKpsw4TTOvyCRBMR6EGrC?=
 =?us-ascii?Q?fLVOs9DERLC7cz/PH7w6qYxwDdU7ijQi3CHzedtdz71tzVa0LgZClHg+IeQJ?=
 =?us-ascii?Q?idIYJBWjz4K7lmHdyGs2N7D0k8u32rXy5yInzhEH9PDfJN5VrfwX4pBFvF4S?=
 =?us-ascii?Q?uNRkx7a+nEoAX+f/GZbiMRpdfclcQFgg+Ci8E7XlcDuPZL9xmKp1abprSSsg?=
 =?us-ascii?Q?gy+EdWkQEZ1EMypuNXwVDgGub5PJtOX3SKpnOj1e68BcE4sr/fqxl2XYU6EC?=
 =?us-ascii?Q?1lDSI94Aqlc4aN3U7m+slTGa1aylKl4LX6YYMpKs2h3GfV3Th679meDf8uES?=
 =?us-ascii?Q?kg++rzBMVArAmFJocWHPFJJEuMGDPlQIXZinSxSV5y9B45Ya9vtceZ6fPSgh?=
 =?us-ascii?Q?dSr0c1sUQtaXl11tbEkvxJZHb2Mafa+O4eLI4j8Zc56RQWZAIY/Wlf1pkSXk?=
 =?us-ascii?Q?jKPBiokecQtD7XDjqiTHFv1b7IxAxDXWGkNpKtS9v/0AE4qEY7+bBAq7FVeF?=
 =?us-ascii?Q?VjoYy0wQitIV/W/zOCjgXMlSUemAYf99oV1blkLgQW/4SnTEHwBtN5weL8Xs?=
 =?us-ascii?Q?kSvQnQCJhGB3p42O5mWauYm/Hl/aohprbqPYDQ68gQfXuCSjmxGPVBD/9hfX?=
 =?us-ascii?Q?NE0FFU9kSI5P6/IJ4c8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 16:31:38.8613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e52f86-f366-40a8-69a4-08de38099824
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF369C4E4C3
X-Proofpoint-ORIG-GUID: j8lR9LMD9gaBkQVuhrwWHjg3bVIeqLdV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEzNCBTYWx0ZWRfX/dTB5qjB0Uyc
 Yq+YHPg1wuEUXeq7tJTlt8Km0nbuPYs7munimlPqcc+GXIKCsSJYKfcsTv3/ONKgqy1R8NXiYAR
 5IXWuetjcTyA5pKG1cPusXPA0iod4iWW40tvJX0+lGIWmfCej2JvjvLV/6mHJF3LNRSiWUQtqht
 xOJWaIriogrirI2Ah4Wb+lqaKEz3qh0r2DphMT+vaJx+ZNOvhtNbB4PjVcaeQaZWAbv6tR5lUod
 cSs81l3Fhly8eYBJQbqMDlSBw6t7Mp6IYbYhRtkr4vOlFHYRL+Kn68tuV3Q1Our3sXn91UO1xbQ
 Jpv16OFnRudUtKJu0KXPG2h8+T992wFXMGZJbc8DEqtxEQnCFh0sNPYKOCLOJK7jgkKLIpTGoZD
 foQaiJQn4KB58zK6oOx/RawAkAzkzw==
X-Authority-Analysis: v=2.4 cv=DJ6CIiNb c=1 sm=1 tr=0 ts=6939a070 cx=c_pps
 a=9PhP5jdPzEAvW1dfnTQ6sQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=4rvIqQ-dTLMN0e9XIH4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: j8lR9LMD9gaBkQVuhrwWHjg3bVIeqLdV
X-Proofpoint-Spam-Reason: safe

On Tue, Dec 09, 2025 at 12:00:24PM +0000, Pierre-Louis Bossart wrote:
> > +	switch (val) {
> > +	case SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS:
> > +	case SDCA_DETECTED_MODE_JACK_UNKNOWN:
> > +		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
> > +				   interrupt->entity->id,
> > +				   SDCA_CTL_GE_SELECTED_MODE, 0);
> > +
> > +		/*
> > +		 * Selected mode is not normally marked as volatile register
> > +		 * (RW), but here force a read from the hardware. If the
> > +		 * detected mode is unknown we need to see what the device
> > +		 * selected as a "safe" option.
> > +		 */
> > +		regcache_drop_region(interrupt->function_regmap, reg, reg);
> > +
> > +		ret = regmap_read(interrupt->function_regmap, reg, &val);
> > +		if (ret) {
> > +			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
> > +			return ret;
> > +		}
> 
> The detected_mode is reported by hardware and copied into the
> selected_mode, but that's not the end of it.
> We should capture with at least a comment that the intent of
> the SDCA design was to let the user or additional vendor-specific
> override the selected mode. If/when we have to deal with the
> complicated multi-jack topologies it'll be required.

So the theory is we are already supporting this. The jack handler
here will report the "safe" accessory type returned by the device.
But the detected mode and selected mode are exposed as ALSA
controls to user-space, so if the user wants to adjust the
accessory type they can just set the selected mode control. If
vendors want to do in driver vendor magic they will need to
register their own IRQ handler for the detected mode control, but
we provide for that through the sdca_irq_request() API.

Thanks,
Charles
