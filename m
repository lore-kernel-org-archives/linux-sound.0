Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795170012;
	b=UXx4/4QbFLIp6gCcv3SJ5pz5kkEj9WpNlx3yiqo9t3NeCpoP9ZpCw8KRLSv34Xf1hOmD
	 EDJE2icdfQnKySOXhUFNC0Ig4iWsMu7m1DycsEqskbCDhX3lrd+6CYDj9YmTCgEIZDj0j
	 FU6CFdau08d4DRdBdwgbrOKVZFSkdH5YmmZZ5I8HQM4x+Zp7MvSdczfAL9k0LF3orS7im
	 +7AFB+4pFb5VN14QjBC4C5OZaSZRItzGkFFQbFS4V1OjyPAFVW6BRh5DwpETFa9vIj7oZ
	 Lv9lg5i1Tw9NlrWZ57x6dv4FYag7EgL+pRbwNnB+jhpxUDfUhDfgSQ8cMW40SKgjf5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=vXfRYPaWbj4iEd+lKCvyNmoXkOJ/jkWPBhw7S0JfxVs=;
	b=yGLGSFR/fKW4PMSkyZ2u3xYVOq5LI2AcyvRDbB8xJqB52fmMsv6gj7iH4XRLv3ttecm5
	 ONhAVIJ8xCa1c7WuzcdQlKz5bUt8MYXDMQhfa217O8f4/Ut2R8znUu4RFnt934NN9iLut
	 HefOt1cfCV1YyZdPAXFD4V8gNLm4Ja1zcZiciIlvvgkGJu4+XSDvHVLC+z+m1mu2XByFQ
	 PZl5YBl7GT4HJTuoGsz2wwZpmFpZhrMOZH5w4kOGft6PYbSvNM3kZiqkBZuY/xlvyGhHM
	 rQVsJ0cRZDgSJZ78T+m+YZqiLoGd/vLfWK2HWh9txC3rAhUxfS4E/0an+S6UTsBe/4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=HxkPXll7;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=CVU95TBD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BB8606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 10:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11BB8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=HxkPXll7;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=CVU95TBD
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK9LrK8256695;
	Fri, 20 Nov 2026 04:19:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=vXfRYPaWbj4iEd+lKC
	vyNmoXkOJ/jkWPBhw7S0JfxVs=; b=HxkPXll7XNmKfVGWPj35yA0TNnrdQiG/rr
	6Ifefh09iuXFyv9dQScR/MWkeggrp24fwk7yo2qzjrjnNqHeqYhyvuC5/UDXVXgr
	ki6SXuNaqYObuKt7c2nV3atTGtwNXo/bTrZh8qTFf8x7uD4ASKJG8GlHfDeVGJcX
	7kQcjaMKoqLDZ8TbUkaGVHWeK9T32VtPZSpxHPPnNDH6oot3HF68bAk5qX0vjFXw
	D6YS0L9jeA3zKOs4pE0J+thdGKihvCTM9UrdOb/RnJJ6Ko0RK2fJBaY9lQ1B4fMH
	+AYOeKzgHrcLOCKgFCbnKj+AhtK2h1KKeFnmPyxHXJZF6YGbWhmw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023104.outbound.protection.outlook.com [40.107.201.104])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j242mhs7r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 04:19:44 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFRm65R/DV0DWxd9mzTEbI+t749DcaTGUrlgWjA3wht7SIFf33rVpC2HaVDuhz90jYEeyaxBkgOsuMCJ457D1WbSuS3K5b72mIEURMy7qVpXtYPmoBzXyzIXnwAxWbIMd9cFBnSSDAfY/JXd4JAshUBnNhJtsbDZ6hHytJVSU9RGuUsDnFyAwWwO+iOhkKJf0AWERYnc4xLBHUpSnrWLuzl1uRcOb5uLNnu3UnGM/gU6INIb+dGH3VqFoAdeLReUy3Qno6saewBWbEeTNr0sYxOIfFugAT+IOpKJqoyMZ10rn+Peg9Mq9S2YB5QPD2cysvH6Q/ZI8qbtU50RkKrCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXfRYPaWbj4iEd+lKCvyNmoXkOJ/jkWPBhw7S0JfxVs=;
 b=PcANo6oaw1VMkxdG3PHiGVINqx9djJf9PQf3+TT5XsrquibGBIHv42aCoyABy4zyBkKYrCmw0PD2hsuI05aAhW7EmoH3zMXnyhOGFHOALb8ctxpZsdps9jHR9cJ9yMtEC89dFLJ6gmT8f6P9xPXd+cuqjn2S91zIDAjPCTZcCdwZj/lO3a0drCGmicN05DxzukFl0i7s15YCbXjVhkRXn0ulNc7I9kfe9mFtN3Wpa7o2i0nLhHfPN3iEQme/Hm+xtaYF5d1JftQG16J6OD/M2m6xFK1GHoMB7JUcqmKjEd2FFlWGPpcetEO0dUEdgryIfgROh7SU6IM3NovCaT/4Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXfRYPaWbj4iEd+lKCvyNmoXkOJ/jkWPBhw7S0JfxVs=;
 b=CVU95TBD8uU6vrgC+qhJPAyqnBm6HI5dvOfi9ZQ/DXqNF2vDudEjUEkRBZof8HA518sZRqaN/UM/7nd55gSXsTMSnuv82XjaNR04NhraVGOHHellXkQsOs5z25CSEal7rW4BH2BCuchAEsxPcYxM4RrbOLpGC31+pYIrbHKQaxE=
Received: from BYAPR21CA0019.namprd21.prod.outlook.com (2603:10b6:a03:114::29)
 by DS5PR19MB923373.namprd19.prod.outlook.com (2603:10b6:8:47d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 10:19:40 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:114:cafe::2c) by BYAPR21CA0019.outlook.office365.com
 (2603:10b6:a03:114::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3 via Frontend Transport; Fri, 20
 Nov 2026 10:19:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 10:19:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 83F5D406545;
	Fri, 20 Nov 2026 10:19:37 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6141982024C;
	Fri, 20 Nov 2026 10:19:37 +0000 (UTC)
Date: Fri, 20 Nov 2026 10:19:36 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Rafael Diniz <rafael@riseup.net>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: wm8731: power the converters together, activate
 the interface last
Message-ID: <awAeuPsyk0iKu1wk@opensource.cirrus.com>
References: <20261120080825.2078162-1-rafael@riseup.net>
 <awAc35H1iSr7fk5Z@opensource.cirrus.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awAc35H1iSr7fk5Z@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|DS5PR19MB923373:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b1d076-a33e-4f19-5e82-08df46efc8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|82310400026|23010399003|4143699003|11063799006|56012099006|261026121527099003|10067099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sOv9q71Q6X5wSo524SW+HdTxHUXaJzdjXsPYYfQPQnhTEYYRyLzic7So/p3lJt7XGtweg4sddR435W304qcceegzBvwicjtZZa9JMYq2REEpdAqHAcYKZsbHNg0tJeSfgJJ40T/qHVbnBuj9gRN04jmm5ZYpnv2bVK50hfce/KoF1lOnW3ZxuMg4zPXnFJeFvgyBz1jCgB/JBYFZB/4H3QFFNTkAmgRkg1xQ7lMiOiXyjmzr/IPoTA+c/eD6xVvhc/VjquIPoigvtb3q731mEXtOrHrklZ0TMNKhV6ehFP/BLImOsCUqXLut1QN+qlrJR7MSLnHp4i0fYd576AdJI9Y0gRmoNSlTzR1A2cgUd2kTdZEP/QiLQ3ysfM5fwd7Kzu7+23UPmBjEFKu85t3/fgaEqmb+8HXmVv90UPCPgLkdPupIiWTOCNfwmqcQ0yi0K/D0AA85QjO9lEIDzZrYtc9CmEKHhf9oJMVrOEvtvR7wlH/8r1WuzUHdf4vpL3++aZpIgGcazdmOh5JdL/H4r+oFIAe6VtmcFzwqsFuttKAzJY+ixhuAJlfRbE5DOJGrYjWunFaMub3GsWtX6Y1wECtwjSKnbFOb6dB0+BMxrLNvJtBIG9cvuxHKooKeAib3m8P2KIslxqwcQZ6cZ7e5PAE5ShD/jPBPlOXG78OooMiNHUUCWG2GxB5sxegYujI8+C0dmTZImatOwQfjzI9WRg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(82310400026)(23010399003)(4143699003)(11063799006)(56012099006)(261026121527099003)(10067099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iblUPuqvp97pdSf1iQYt5Ha1vix8/QHCg1CZrCznNXWwBIruipIIJtn1DnxJQxICQ21E1d7rFL7coNY+NfkQrvU3eEycGcogbwTR8PfTUrA11WMIrPXPsxWBQbii+eUBl1ABZ01F1g54qqKs9ykcPBsxTsjQ0ifAMDNgkl8cff/KpuXv28XHjmeUuheA2rj2LMb+kmFi1MWPIVTt+LkGQj4zlT9VIgtM2VXk4Wf74RYrU/crcJ72t84XEejpSaAagRMnoKz+fZeifrWhtMFhlZNkZJxMWWkeC0U081NMvTBSmuyjhS3o0OiRB+v7XrgjYVborlkCZRKZ9c4GmX6spfmZKvMCUuvE7464Hew5jWZLPWRewf4e1YHHxfj4ttYUCj+zHvNLv+xOoPLGexCEDKpT5ntf9jt4QBl/LZxAk6aBCm8fyPDqF+HyWiB2iQkP
X-Exchange-RoutingPolicyChecked:
	lRHvZ8WfuLmeLw9ny8BrLce7q1fnw47YL69qPORLUTD9STA8XDqmnCi0dx4QjkzgWCPl0LeoAIPuqWJ006hPhnIAMSnKQVimiVJVhOkMk6URSPjNGRRw/VscqTYT4O1zMT0iWLSwCHBqxUqdax6V7LpREC7eizLHC6A5zGxNv5DNJn+mmeVEHYAm/qmBS1DmAXwbef6m/zIR/9ANa4tkaCDx0f1n4iXSWcD9n7PPFQhD0xBUDS0uZq/Zqc8Va77NiYpv7b2ncZXH4yCSjASnLJLQ4Zv31aNpQSvggKp9Gb35k7CRMW8pNI0OGwrbGXJrmTX3d77tNq3sSTf0f+Tr5A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 10:19:38.9587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b1d076-a33e-4f19-5e82-08df46efc8f9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR19MB923373
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX0JDYWtVh/PDk
 8i4Tl5ziv3oqFznXtF/+ZLAjW+EwQq7vMZCv2AYQtbai9nn59ugBsJK4cSkvBaog5n99Gcm6IVs
 Va4bWLf6wh4vW9Ud9AnWQHUF7169SU4da/dlSS5G47EUd/PuYmctbHU/N4BfnHZrq1kogxLVnUi
 sPZDT2FH1LpO46MwXFGOQb8PsiaJMOEuCDjgHC1er36B0azm6T+AR0Y4fHPmIzULOnFkElt8EX0
 RFpolmcVFFxS2mor7nGBKpzmXmLoVe6e/Ru9wZnhahaE0C8pK70gl5jdGhGcMLXq+q3iBGVgJ0W
 MX/Efoz8ZWwFiMIX1ZMEV/CgazaCwwlgQMJXdKEzJs5AbKzHwTS77FaHT/xAsHxdAXfnM5pp5Hc
 u6L8HrOpcadp0binHVO49roZRBhP+1/QvEC5Oiur+a7yTNib7Djkk8Grm0fMrrSZDH9LMo0HOKq
 yO5vaqbwFZz2lDlxXCg==
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6b001ec0 cx=c_pps
 a=0aASrZ1Sr5nz2ag1/hSaPw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=1SuUnzspEy8sBb79ldAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: GovCJh7qZ42QvZFesVMVy3gr207mSi8I
X-Proofpoint-GUID: GovCJh7qZ42QvZFesVMVy3gr207mSi8I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX7FSnwkDZS4Mw
 B1nPy0DIbfpWc0jWqMqi1YZpFBVEPy47Dp32W46vcox68CVPCFLbk2l8y0+ElxCaJz0aC6VUVdG
 pc9Qrcq7giRvS2mGXpV5J04HxqijJoY=
X-Proofpoint-Spam-Reason: safe

On Fri, Nov 20, 2026 at 10:11:43AM +0000, Charles Keepax wrote:
> On Fri, Nov 20, 2026 at 08:07:55AM +0000, Rafael Diniz wrote:
> Would it be slightly neater to use an OUT_DRV widget instead?
> The wm8731 doesn't have any of the widgets that run after it (nor
> is it likely to acquire any) and it would allow for a slightly
> more symmetrical handling of the ACTIVE bit rather than splitting
> it across two widgets.

Ah nuggets, missed that ADC widgets are weirdly powered down
before OUT_DRVs. Let me rethink that.

Thanks,
Charles
