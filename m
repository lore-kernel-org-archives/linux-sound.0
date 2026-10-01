Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337654E1C76
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 09:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846575; cv=fail; b=US9AkHTq8vktP0Wo6fuaC4+k/vINzwOXfEZ0k/pdF++n3tBADPVbTHy5IegE8tgnnvliM4N9IZi7+CDQS0WPLBXJSRxGooFUvhxCIjcv/rD/O0j7jF4ewLaLofh8wOhw5lazQ+2PY6YLcIB+hGfYmc/Zc8P3La31o8JsT/WDq6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846575; c=relaxed/simple;
	bh=gLF/esdHYTHPJw/C0eZ0Mh8bAfcH8jMay8bqHhD/oTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhFiCcef6m1v3Gisq6GBPXD93ylPp7OIJCYcyYJRCyHUTYT31stLHXcn7Cf0JjRrNN+8xPRzm5V6MIhxww/RlGUWGwLGwSiwQq7qE50asKr/wwXeRkUH4BPL+GgA4aBvs9k069+jmup598Nb7hPCWwycxvahBOXKsaydYq2FeBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cWyguX1A; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=OdBykENd; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cWyguX1A";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="OdBykENd"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6914qwlx3044145;
	Thu, 1 Oct 2026 04:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=tDorEbtiKMgZoQmGyTHdKCaVFsufq4Eg1Drcx58w3L0=; b=
	cWyguX1AKqxmkWJDbUgasvN/OMQubxED8YBE1OUb8qHJONVNPLbZBx8gBbs21DDZ
	lmwMKa+XHkJhiA+/mQ1vfhHr1chT9Tle5Zqwlt92G3bRZRhsdyBJs1Y14iWtIzTN
	fN5HGBD724eR81YBPnTShB9u8g0/Di9VK4Yyobj8kQLzvPmVvIYAQZiwXNQdPFVa
	zhicunvvGdADmIYJ8lRfLZG6FhGWHyvUw9in8HS62gAxV3+BIymba/Vj1LjAb5IS
	ZsK/rnq2FMY259V3S6x0RM63PT5KaKlmCS/SfsfGhKiiozEOTcp63f9tYmBDShDS
	BtfFuoL9ciRdzhn6NiDQwQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021131.outbound.protection.outlook.com [52.101.62.131])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h1gv7g7qs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 04:22:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zy7O7KeJrpMpvOE35XnAzTw+FdJ4DcO40DIubBt7vLNbsStSqKWkG/XB44OQ7sxBRjxxL0R2KgM4lUVwmx8PmV4jB39OydhQedtJhFAFteEg8mxbKfxmD6Zb8WQ0z/wE6gPLXDMd+bYjdDd73OEsd68aoKhEBjlKrdC4fmMQAMHe7MMi1niE2qwugE97EoJXI7sdo62EbBLowTTvj3Jmz9hrwGwteAvrBgMNhXT4wvBxhB4gyv292e5WvXJAefl2FMV840SP2CXHyIYrA007R/rRyQwvzBpojNj0Q4mnPCILq0TjZbw3cHALc6qLXbgsqEhl5BUcWJ3kM3f/EB0oBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDorEbtiKMgZoQmGyTHdKCaVFsufq4Eg1Drcx58w3L0=;
 b=mOIYMC9PBc9bunDyyiR/NCEum40Qhh+eIZidv7jZD+7xPDY6gJ5J/SuCKncZ6Br+zVQgjOE8n/lZXQlXC6Ks7gFdyNjpbTRm/OJcqISar5jb0vhf+1fQ/SRVmgWB41slShYP8ImNcoeJpH4B8ZIL4+9djFDwVvxusenJMITEAUDzpU3IjGvbW6K1QfvWbbiAR4lvB+1F2jlaMDj6Yck0tCCSxx+HR8YDbEkk0adpR4DypjDY6YYRwIGk0esRLX7rnk7EFynaOPd80JQQ3aMbOT8O9wjp/+neQ7j8JHUDjLL2PfUPcCxA1/pnj7fZYuenab0/tcDuttAE6FO4JwpnPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDorEbtiKMgZoQmGyTHdKCaVFsufq4Eg1Drcx58w3L0=;
 b=OdBykENd0KD0Du4u7Q6CymMy4sBhT2UfGI2cTuVXcCrSay1P0pKRyUD73vEdGrDEagCGI8oXhHRXUo5RtJHfZBiqijPohb9cN60ZczdPgXkWyeU6bTBspyubz3YyXPZ0uYB7IAcjjNqbKmEhmDxsbvCWRmGyn96MLUYIGGCZ6g0=
Received: from BN0PR08CA0011.namprd08.prod.outlook.com (2603:10b6:408:142::33)
 by DS7PR19MB7628.namprd19.prod.outlook.com (2603:10b6:8:ef::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.15; Thu, 1 Oct 2026 09:20:14 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::6d) by BN0PR08CA0011.outlook.office365.com
 (2603:10b6:408:142::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 09:20:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Thu, 1 Oct 2026 09:20:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2AC92406544;
	Thu,  1 Oct 2026 09:20:12 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 171F382254B;
	Thu,  1 Oct 2026 09:20:12 +0000 (UTC)
Message-ID: <5583ae55-f8b1-4d4a-a087-104d2086f888@opensource.cirrus.com>
Date: Thu, 1 Oct 2026 10:20:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cs35l56: ThinkBook 16p G6 IAX (17aa:3921) requests firmware
 without spkid, linux-firmware only ships spkid1
To: Sander van Delden <s.h.vandelden@gmail.com>, linux-sound@vger.kernel.org,
        linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com,
        Simon Trimmer <simont@opensource.cirrus.com>
References: <CAPdpv3xfQiW-Fmn2ydPYSztbm7KV+f=E4dSAD=sT7TACugc-Ew@mail.gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <CAPdpv3xfQiW-Fmn2ydPYSztbm7KV+f=E4dSAD=sT7TACugc-Ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|DS7PR19MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: cf46165e-89e9-43c9-d242-08df1f9d3312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|82310400026|36860700016|11063799006|5023799004|56012099006|10067099003|3023799007|6133799003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9JhCCZJkqfqC/WnFTMHFaX8404h6qnUo5AAB3MS1WjWB/4nt7Xz3CIt2YZWGt84jqpQPd9OyiDLxZVESzPCOAN/mpd4Qxo4mGT2SIefGVRcXHh/5ywmmm5uPybQDIewPFlNNP/uiu9gGgPmCOmX7+EpxcMlMvYxXnHO3YEU7yUY7VS0H/HXp1kJaqpDlkzIuYxHDWZbTr+8o/Iv0VO468QAex3lSvg/gzz/D89zWWq44D2Cn1IeBRHGQFcXrKCtJGPQWMksfuT8cdwzm5ZJVaeTZM10lgNWXxydLk1SCuj/3bePX5uLt4YMGnDLGYhborGZKi+wb6LB3Ov009E6vL2N1KqnlrWRTNAQC0dk7WM06kKBDr1TqkoGbZYjknozbiEYFhnB94NJCeNQEaiPJpYkLGtUfMRJ+Wny9MSNvu8tc3Fl2+lSm5y1utluFbaEug0LgtEkX8RCDjOgXYCNKf7NM2JDEpAVz67Zr35O9RJr4SbgC62WvBcjxmxv495Ek2c5AKZRDDIRKmJtGDl6IrndSS+j1WfySi40Rcav7iOEx1Dh4CzloiqbeGKHll1L/ZIV8QgXjJk/FT9YqgnFkkOMI58QtsDijRC6s95683smyO3LdYg9mhUq4xr6pJPyokYEQ8j94MNjgImd6beS4s6e+dtPQqcS32P7DMRFfcTGP8HWi1keAFw99AzI7pfmbPPO70PasriqV5WaijMVlcg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(82310400026)(36860700016)(11063799006)(5023799004)(56012099006)(10067099003)(3023799007)(6133799003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3q2lZY2E8PQWGZxyWfvmHD/9ptb/BvMXNxNq97FIEUbVGNAhnHJ7XCfQEyWsQugzY8nUvfyWR4/Dd+IQf6YCFAh6btT3jzk0tGqxZAxOTmm0BEufmiN3DMNvTmA7BPfMi+hFqaAwZH1GSqzKDsvCOGNMZH1ptNom+4RuofkKw8BGcjWcYDRguCy1IY62fKde9HV/HaVj/sNnvmIqh7lI2wlkWj7a0bbUWS/3rxMu9RUmoLGKWcb+K7ZkwaPjCcyd1ZPwyABEbQ+mR8f1JzdaUvJfC5rHo42kud07blLeR6b6s+KCdDBGODukD1CgVQNcd85NfeBTE0hG9WoSzkFmxEGtxRNaYKpqVtqqLFRLnlOxzGdnUzf1nGPrZlOzZn4EgGCQ42xlpYKOc9/0o3RMPJWrBT+mE+NFcLO9rJKWFftcktI/vjP0lx8WtznLfrHV
X-Exchange-RoutingPolicyChecked:
	4ov/BMsjjOhMTpmzGhGtXX+Gu/mMRXMaA5JB7XZsKYHDPqoQmtkzOxW5Gw9kxtucF2oWEKMY7y3RhE8An8c+cXRphey3OHk2ns6JZ4McmTkPy7Y+gGjzlvVEOnByrJGfbLe1wIKpCoVnv5QrX+eOAeRRgBPxROQafk63l0j8Ddj0rotEGHKOQmm1xLi9K3ADNslx9Cbu9Yp3WSsOdZ7k9ROc0eSPrFlj56+AYyVfwocGNGAEfPrE0+1l/yCHyUTb9zWvHJRK6QIQhfm2DudS0pwfj6oAryLyuBWK+KU4dOGiGYqN10rnFPIWV+5eafqVyRhwWzZrM2x7KyJ1eyE5Gw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 09:20:13.4958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf46165e-89e9-43c9-d242-08df1f9d3312
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB7628
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6abe266a cx=c_pps
 a=06hTPglMN0yABrG4rHRHsA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=-jYgOTq7QW8nhFufeI4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNyBTYWx0ZWRfX/tV999yHNlJ1
 tSwvaJnSiNNfjTUlaW+iYXZc5WLRyyYJ+6bEE8DBW9encn2X8XWunw4KxQykKX7kQpVqmNtTS2U
 Rhd5dpNgPzH1s3jkkwmORT44riUvrDP6oLWHaWqYKe9e1dIFSUV9IG1wf1UfCdCV4t4BENfTyY5
 ru/86iNNAqPg11PXIhxKXNJjagVJ6k8RL+KeZtgFvAO48uBv+sv5G2Gu3Q4PlFWDxeNH/rOkykY
 mpbT5MbtvYRRo8GJgIRzoCNCo8ZzLKXg9kqM43bKkDHA1W/5uOoK8Npu3kMX2/c2+ErVTpM6clm
 V1CtTJzikeYTU/Tn0scIaDA0q4PQ8cf0NyKBNcfZUBdDDVd4KWYyc8YfwK6A++XyQjL+ZHCwUBG
 PbWNsisYljk8imyICzZ/rPGAr3h7MeDpyOqZTTSEqEEtqwG9ACrjG4cEO//VuWfyaDI99xXSqIV
 YiYERNqCHChiPb6tZAw==
X-Proofpoint-ORIG-GUID: LqiBQPRmP5ACUbyhLCYr2d6FWhf0XzG4
X-Proofpoint-GUID: LqiBQPRmP5ACUbyhLCYr2d6FWhf0XzG4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNyBTYWx0ZWRfX0bts6ItUuFqa
 nCcVN3OSOE2DrvYTL7Abk/N5nTD7LrN0JznLnunar1fv6+7ciMRLfwTKSBXQMmHetErdZDHcW0q
 BSrDcAV6NmPjq8Pxe41Uz/MEKsblpr0=
X-Proofpoint-Spam-Reason: safe

On 28/09/2026 8:55 pm, Sander van Delden wrote:
> Hello,
> 
> On a Lenovo ThinkBook 16p G6 IAX the CS35L56 driver requests firmware
> names without a speaker-ID suffix, but linux-firmware only ships the
> spkid1 variants for this SSID. Out of the box, no firmware file matching
> the requested names exists.

It appears that there is an error in the ACPI on this model.
It should have a spk-id-gpios property in _DSD, but seems to have
shipped without it.

If you could provide the output of acpidump we can see exactly what is
in the shipping ACPI.
