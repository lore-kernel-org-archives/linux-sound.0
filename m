Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D90450901
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427527; cv=fail; b=fT+3aiWWYrhHonwPbs0hxdTRCm40qZYeIrPvw9kpfPz331Y9BOg0D7CrQWktmFgCOYYns5e6yEszcDa07x+MerEeECVj+CpyGhYQx5nkn6cixC5w2/UKBqKYoIHHY6hpEkZ2lF3kPlSeth0dWRPEigAT3s/ACXQ4pCzzDojSE2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427527; c=relaxed/simple;
	bh=sG8lQjMNQiVfLy71w4S7pUbgRI338JQR8y8LsXrQRck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDLjasdKw+X+6z7D/bZnduE6VKFGRkDm5Uf3i0i2HYYmbazPHclkHgxsQ1Qzp/IIUGoyih9zlx1IhKjZp2I40KAmNfuV7v/HoCn5FlnHhJXilBie4XyOiUHawJmndx5PJWDQrY0gqlrOR69IboaSzOUIXa3BoyRxHL9U7VBEo8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=f/BgMqOT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=stgytQV9; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="f/BgMqOT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="stgytQV9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UF6Oth1626892;
	Thu, 30 Jul 2026 11:04:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=6DFDETciG7tClZlOS1
	EagCD6e4LqdLk+O5xP4Dk5+Xs=; b=f/BgMqOT+iC2N21XXQ0Efplix97vAMHr3t
	VBGLixOLv18tygnnAwqzZTLfe+H4E8a+/+bR1EuJPsVuQQ0REeXrKROxE/cjzxWQ
	vQV1XLTRAy/9yaLjqhRqxsKCdPnVdzJZZawtGi7RAOmluoqvIvU4//KLhBhRlrkX
	Qeah6DHqceUvFtFTQH4l2a67gB5sLq8W4gcPlXmadhChCwILs+XJHmTtryghZ00+
	wfTgPT9YQW2eiKTmr8VMeDpmw8ADzrGbr3rqvz26CYTTdlCerNVKhAdPc/Xe7id5
	O/tmqAJIMtlWDzaMqwf8DHhUdZJvSvjwpFQxBA8sSn099Y0hQd6A==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022106.outbound.protection.outlook.com [40.93.195.106])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fr8y3871v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 11:04:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0NgbuVM2R7ITCZg1p7ubkCPIpPjgcZ4SGcI7lFQDDiOaaazdIr6etOvziTT7BHeioNiH8E3xv7p95WJwzvuhlHTM1fQsdhS8kEIObgSJwuLKRPJ06B4TV3UUe3RtaJBYysXY6MXwzJR1UtkjfCk874jl2oKlmkVAuQb71Ul/eJadP0N42xXx465MaNdDyOPRK8QVmXNkgyqglyeY1qOLqmizs8NEIfO6uetxUv0fajvld7ixrVeQ0v3ODW3hI01l1lRyYLHIbZlk1b/Xl9IsnYflZfT/6VX/ubEQ6poeSdHHQSQ6CSTe5Znlh+uIT/BRN4Vgb9dahWcaaMn25IjpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DFDETciG7tClZlOS1EagCD6e4LqdLk+O5xP4Dk5+Xs=;
 b=OFAVXJdzQ0tVxbVnf9iW6eq9GW4/LNA5L8NidQRbg/GynnlySXG/aMAHFo7UZMSdcO6MaghODcXLHVIS8h+WzMRHIrFzgqHRUMHkQe4ERxyZr9uIeIW/KUOx57L30tVq6faTzRHrr0fkS4xV4QUaP24BZYAQUh3hsY1s/iUGsWRlRIoBNM7P8R6eCcmdJRjukYcttkqO2HQH9TmtcnV3iT8mpB6N/rr93zEE7IyWPRMmBSseWtNcwazjTfbNZVRM0uHBnA/asiwSLHvGSOIHCYqn4qan5v5x4mAHAQZBl05aBaJ21uNDPfcH5z27o1rOIb4TPhmSacN2+wsKjAJ5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DFDETciG7tClZlOS1EagCD6e4LqdLk+O5xP4Dk5+Xs=;
 b=stgytQV9/FcG57EUsHOGEen9rg6bmhjpI7NF6mPVmPIWxAzSV9Po4ZkkVAfFc2Awvn0XD5TUcwdqJ3FsiFrR2DoXnozS7HdiMv3Q6kRG7Gw2pmC0HwkMaeSefbnIAHvcYOqu53NO0jMrumvgkpPUj8mmTA+gdsvl8UwgsvA0SNE=
Received: from SJ0PR13CA0100.namprd13.prod.outlook.com (2603:10b6:a03:2c5::15)
 by DS7PR19MB8962.namprd19.prod.outlook.com (2603:10b6:8:24e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 16:04:39 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::a8) by SJ0PR13CA0100.outlook.office365.com
 (2603:10b6:a03:2c5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.10 via Frontend Transport; Thu,
 30 Jul 2026 16:04:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 16:04:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E5CE4406541;
	Thu, 30 Jul 2026 16:04:35 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D050D82024C;
	Thu, 30 Jul 2026 16:04:35 +0000 (UTC)
Date: Thu, 30 Jul 2026 17:04:34 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH v2 1/3] ASoC: SDCA: export sdca_find_entity_by_label()
 helper
Message-ID: <amt2Eqoe38E1Q/J3@opensource.cirrus.com>
References: <20260729032227.3750770-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729032227.3750770-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|DS7PR19MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: b3033fd6-9aa6-44d0-364b-08deee54417b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|82310400026|36860700016|376014|16102099003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	qYPxCgmBFD3o0avhXQvZFF3h9BMWw9bZYty0srCg21U6zw5M/KSbATquk3QJoqtbRWG+u3thTyhnOWyXi/Eqol8NUhBhDua4Bv3YfFdWZol+ehc3A4HbH5MvlaC0yZom/eeeuJU5oOyS+mSJjxnf4c9bIIj1UZG+s192gdkFpSYdmMHdzTkmcIuk7wRPmSsCKhVSITOw66BCG/j2WecW1qVgBAOG6VSHDz6rmKhjXVaEPDNJ+W5ahc8a32XpS3IS8Qsyb/Wf9G+v6ttsIt07fKKVm4cVWDPgB1MQrdSZ4zLggRCbrylIMu83xPTtDsnh7AGk5i7+itjZ+GbB03ikC9rJEjk1IyNMb8mPW4oMtSMH+0GZugd6MmQIUoMEG+N1tMZ1CtiL6wKP6Bxp6aRkU9D2f9yWWFAL2HEgYANM17cBM5qip/dPojgJxXImaBi+WiyF4EPE2I5HLK6HUokfQzWhhwRy6eC3GQOrF1BYbOjvmG12fvBvulsjIQSObaDIEVmmMldLGecispbj0hRcOrintZUtFrw2OkDBb7U9vGtaqwSp3oBAq/b04HDJx2jRUq/H1NfyrCei2dFQiILY0WcAlp4eVABdI0O0i9uYdTCFk8Yqineci1w1w0WYSodmtFU62tIJ0ngw0+iDTc/7xUcMLKgX/8W/TDuxmucJZQWSFFWOAa1/EcMGMBQMQO6PcAj6K8bSEOdWVBVN1MZPVw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(82310400026)(36860700016)(376014)(16102099003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RRU2pWJSogGk56eAj/XpuBSgb8gE/zQqem13Kz7eed5apoMzQhzPm8OWfw+NmFM/69MEzXAEDqgp2wLWg2xt/EBbEAgWq1ZtggHj+jdPl90pgzi4ph41Ar8rHqOZ9xlqwtbiMumFavBiYxJTGdRNxPO/Jkg9/OWAA2QLOJy/N0QEZAnc+CyTT7O59KmxsutpZiECmqnYuC05iIZYrsjDidJwuA8WaguFkpbnFC8+nsyddgru1RMRyi+a1moMYU4tcd1B0Tc4ETT7ciaiYqNbTz1kN+fOmMq21z5G/dzQbCIkoRw7tD73d0JRfBzpPkCzpXmR2n4SSuX0Y2nZEY8P7KQTgVKjywrzSYV1ymckJw1OEShaFXHIZHzg3Z5RzOFxwwJpyFNpprotr+eHyrtKr7y5To862a8h0G2Zv98C69gawBVpIR11j4b0GQknBMDG
X-Exchange-RoutingPolicyChecked:
	QNn+BT98PV/OCU86cHH0D+8VHPqHBefRKKw+d9GbePzJu9odwF6ub7s9brA7QNV/PZN9hpYZC5PeCt69PlW/537Dh/3Q5eykDyCvof/GQ01SJU2fp0m8kCg0gCNm3UhLB+9xzM/KHVbvS7diXAjyvNFfojIef41y9rv3skpzlYMfJ3rjYPbfUc4wqbizWRAoVT5Lql83YY7WC+4VxjY/sqIM2OwFxy6i3iw4SLyU4oHsETBlXqeQRzu525I75HSzGdzX9UWSrmOSM5SoevnE2UONSWf7LS4gm5EsNdAxJHPF6BBp1vk5omY5H5mUOr2xa13ybyjbSQAdIBX/31Ij9Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 16:04:37.3204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3033fd6-9aa6-44d0-364b-08deee54417b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB8962
X-Authority-Analysis: v=2.4 cv=CrKPtH4D c=1 sm=1 tr=0 ts=6a6b761f cx=c_pps
 a=njBiJbAQTUgP4Zm4Bb3rbQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=ebMaPuPUoUjlNWkDwooA:9 a=CjuIK1q_8ugA:10
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMSBTYWx0ZWRfXwcfkTq5anCbi
 lYsMSUOuuRe/kzK1dMUqIG5rkrtgjLCyQ2udeyfPnXG3LzckbB/krc9UIZWf2cswJl0ca7q2ca+
 1cvCwloHAyDfUOaUuU2grNOaKJCqHYr0LSLogweWXfWALDrNqbqR4DHgmY2C1e9T6TT6grhBdMW
 bs+TDxSfnve3KQaosmGluFxPDjctU3tbNhTYuVakKN2oc0MvQsJDgHymLwO72OvgE2iL/VQYt3Y
 zJIPQSyriZqM8FS1x13HjjhKe353Sbtd4kWmKFgA+53B2SAFKAq/Kg3bigbxnpR2fH8wK8DwpxN
 dKqi1TrQAGJnYwdVNNih9ttahB8fknR50GN7T57+qcWcO1YzoNsYhMchlbFvpVURXt+cxLFQ9Pj
 3FVX3bwGKa74eKB+q8ceIcZMh+gOZsga7TVBxVObbF09y+U4OJtsj3q8jjb9N/4p3QgUat6tzuf
 i1wXzXXmr148qop/Tlw==
X-Proofpoint-GUID: 25yc1ESjcMKmc6WSf2fHa5oVkGK9xrGH
X-Proofpoint-ORIG-GUID: 25yc1ESjcMKmc6WSf2fHa5oVkGK9xrGH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMSBTYWx0ZWRfXwZG86QE0rZ4D
 H8usGtexQZN+t6nZKHCLhkGtBmOPBXBJR5uCUrt7w4GXaZvV2clUHyYSSwhe24hwsZi2QYF0zkd
 Po+mg0sl9h6HcwnBTnFiGUcOQZMN01w=
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 29, 2026 at 11:22:27AM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> Export the sdca_find_entity_by_label() helper so that codec drivers can
> locate SDCA entities by their labels.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---

Be good to make sure you are CCing at least
patches@opensource.cirrus.com on SDCA patches, safer that I don't
miss them on the list that way.

But the patch looks good:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
