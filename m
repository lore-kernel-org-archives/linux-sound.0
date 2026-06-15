Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2972E3D3CFA;
	Mon, 15 Jun 2026 08:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512494; cv=fail; b=b951bVx7SA6D0txgVPl9VSACAKhMHkeT6gueBIrpOb9KFyNnEzyx94c8zH1iq6ypsuz3ddPBG7yKvvus0Evzdw/rUc2/pSbpolobMifSQ1u6GEAVpfzhyPZCUBE6PjD6E1P9dHnL2DVW2s6v2pJJ1C6D3SnRjN0PoWcQDb0F9hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512494; c=relaxed/simple;
	bh=ugfh/WusVoMBBGIEPhrOimOwxHOxoFjcybxnzU9FyXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfLoSDgXnW6LfdIZytGtM1cadqm172Jn6k+fhypZKKor848vMqrL2m2HeIvtXA/uLjKcjycIN/s3AgGM68uKBA0u5jn1ygI4mAX8YqrF3W56+fRiYMRcC1k0APPfUNh5xCTP0YSQEZHGJ+GHbrgHvvTfwd/IhJ8nezwZKXblyvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ny5O5xEO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Sn5dgkM5; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ny5O5xEO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Sn5dgkM5"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F50Dbn2641194;
	Mon, 15 Jun 2026 03:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=MxIJU1I8KoVFMvoWBc
	vr6qVNtthCOc5Mvl3b7xkX7yA=; b=ny5O5xEOZtWlhap8406PIb7gxK5lMoSKBc
	ECieiyITgDXMYincMamckSvk2e5giwg8gr4O3Pgk9CoIwkUo5z7IMiC216dhapEN
	dIqh3ZmU+C0Kl6goFcbNfVTzIGhh5fR4CpULhwvgyYwIgQCeVdfjEkX0sIhGpHoR
	FJawBx0hal3Q2DLoInLsrpqEK7/ij9pczadDYWdJHIHHM0XBZU3D5Xci6EEvqTlx
	CqGMzmFWQf7MuOtH+W8KimUqc1Xy0IkcbZt5RRosatBKE67x6xb7MWcbYwSXplc5
	EP6g819y4NXo3Nf84IvK4GqPRKRX+wAvTD26qY+hy/4F81VVpIgQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022122.outbound.protection.outlook.com [40.107.209.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4es3mft0d0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 03:34:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4a9Hcn61DfV7oRC5Ov3UVsAkjDiGqoTRlPEd97ghuBxLXnBnVtqUAyrCNJDGg6HzFASY1KZmmqMc0Sk24bJiIAWyvHO0nr7IdbVqKfcQgiaHCFcnykmiW9Vn0ouwBs/E2zQu1fMImBn0poHS91y3gN08S3S00cUHhGbftNceZ7YtU/CVa6P27ckxyBjedqeC3v+o8oD0JGd5n0ahWO9UteojTv5Sur/70BBNt5KNh4lzE0/JRg8OXNDqguA278tKJoqe+L5pPw/PxOrRsXO6QFykFATcW24wLWwUV8y8SAhG5q1j5Qqki2dH+RwPdvrWMRv90sd9wioxhGka99T7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxIJU1I8KoVFMvoWBcvr6qVNtthCOc5Mvl3b7xkX7yA=;
 b=YD7lVnpti4lACOJmI+B+Q0Qbcx7levmKyNDl3jHi2W487tirX+fZaj4ea4kQoi+EvXoXfWNsN4jVjiDKzJLiktMAR7ELF/64O/BBSDesARTVNXpvekZO0gEny9l3fChjXScaJFUHRKpY09Jvc2TWPL2838e9U3noDIg4Y8wZofx+DB1HBM98pbQDMAOE2y7A8tuA9ii3nq6YcCgokZ2sRFtZsWc8F/ZZJ42l/as0tXuLErq6Rl8a8MVTVR/sNCmVfxMy8G8HSp6HESLDtjkYq8IPno5vBij4MMBRCbhZ2GG+fheMubwaLhuxJGAq2sGQpT5oEuoLjqS4E80pU48sgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxIJU1I8KoVFMvoWBcvr6qVNtthCOc5Mvl3b7xkX7yA=;
 b=Sn5dgkM55vgnss8VcrbrwgxYBn9XdgDUp/FJ3DdHhH6qjLjAXyeEp91w/j+1xEIsuMVY2Kqz8VOJrVqkPtkV9Fjr2b8oAZ0Zd7UDU/EhugKU0gLOt/l64hu4fW65AAA27W7wDl9y3spHim6WtFoZvyJNPDKMxdZ+yUHFw85+6jI=
Received: from BL1PR13CA0351.namprd13.prod.outlook.com (2603:10b6:208:2c6::26)
 by DS4PPFAE6235B8E.namprd19.prod.outlook.com (2603:10b6:f:fc00::a46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 08:34:21 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::13) by BL1PR13CA0351.outlook.office365.com
 (2603:10b6:208:2c6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Mon,
 15 Jun 2026 08:34:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Mon, 15 Jun 2026 08:34:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F196140654B;
	Mon, 15 Jun 2026 08:34:19 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DA7A482024A;
	Mon, 15 Jun 2026 08:34:19 +0000 (UTC)
Date: Mon, 15 Jun 2026 09:34:18 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        julian.haarmann@student.kit.edu, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] soundwire: dmi-quirks: Disable ghost device on Lenovo
 Yoga 9i
Message-ID: <ai+5CrWRj5lYv4F2@opensource.cirrus.com>
References: <20260608160203.151943-1-ckeepax@opensource.cirrus.com>
 <ai2eWeTlhFtNWpr9@vaman>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai2eWeTlhFtNWpr9@vaman>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|DS4PPFAE6235B8E:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9469ba-5e13-427e-c68a-08decab8e5e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|61400799027|56012099006|11063799006|4143699003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Sl+QwmP5fDwgxL+8oA3otzZDHspK0nhavMIg3uNqAodaxKb1LUq6Fi4h+t1VSUONAfR63M7bVzUcL1z6UR9u7jc00msz7amiqO0iV96nvkfMnJgZ9g2NGhiN7Sgoct5TnK3VXl1G9ww+G3sMJEi7G/ky26Hvc8og5PoTqUKnbf0Lt3EuEtKpd3GKXv7CC4JkoILCQ5Mf0zcDtUaAqie/2kA64urX/rvozO8um4QYP4d6QRCH1/DKJReoiMObfUvL86adzhIylPz3RPdvDaBN+gU6xAanoblnS3tQYJsQm4CbzWDVjUALnjIlbOlOBley5cZmFbO2Ol5M5kbcg45fMPTb89THF7QRZOQoFLxXCuS9+9ZHPFOiJhZYWCPfgBq9jxzJNSZ0GTzq0zIzsfJ8Rw2mjwQgpIkVoYDAYYMPHKca/C0auJ56/oTEIYLJ+VnZq1BjcLIohSAyheXddI2e4brfRvFXNGqIpOjBIdvnPcnaBP3JsivzqHgPAhAR1wxHr4wu1IRQSiuyDtIulTQYou0Nj/0J8ina/V1OQERLJxHC0USXp4do7kdMquoyeRzTSCpwlF9w1lC8l8icXTxnrnVwZtRaihfMinyT+RgRw/YWHZoLa0UBHwernW5KbTeXONarqSAdNPCqLl6P8Fi2/nNONd5zUjoWKPPAkcfB1bUnxIxHKLFq3cgp+7BovWbf0Q8KLbxeQiPOsBQTF2LTwiq+AfAYxvTl9+Q0mmCG8Y4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(61400799027)(56012099006)(11063799006)(4143699003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lBMf7xpZjbFWZrlzEkwCL7Y8AEJd22uCqKMHVoT0CNZjvP045zN67bsZwCv4Mxgyb0XqCOVgKgOrypVReCdyJdQmE1JU/wGlRRwCbH+6OJeN//OVxR0V8pOV6nNRuQ6TXz4YjWQzDiDWjUysRAvaQQhLb+h+B9rKHRYZeAzOa/a4U11MXNo+2p9sFCEptouZWcF+fRFpjaoMX8EfASWk5GCJrrwRpKN8FhlH/Fig8D9wuPBhLonshrTweW3lL5Hr7qXafhurRXaDioBpe25NQlrpUZalzg3MotrTiSiu95WyNK6QI7uQ4/pccGyjnNaBcm138/oV1Bj0OiudGHQY916jSqu5dU3EgHZ9iHUtto4UkvdHdUqTfikLibZJoCpqw1+yS8H2GG9zVI+na0xQjdh8scxVk7RrUUFB6+Yg45NhoAf2GFVKe0/TJtQ4+66V
X-Exchange-RoutingPolicyChecked:
	RKFs7Hnvje/2QdHHXmUg3tCa5xReMQnYmDQYUs1+OxBaD3iM4KCEUxzsFmjuPE0hYKkHTVnEMJLZP5nPHDD+rjmYRRd6kxwPgyKAeKLQqjZJ/Ek3xLHedAjvWy0etc6+RG1FV00z4y8lulGNKqvl7e2VWe+e41tfWE7CJTsVIYAVa1VTH7orN26uh3pkbs13nv6m5ESvwQV/D4FKxjFaFejPtGGqvLyM8HcBKvelyfM6MkxdgjHLG0pogbuYXCNfmUggZPZZ0sfHe0cF1hNdREungWTmeMMDFp5Yp329loYmDYDJhfpdgFGNpdeqMO89cvH3yFXbNZVNzS2ia7kq4Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 08:34:21.0958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9469ba-5e13-427e-c68a-08decab8e5e5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFAE6235B8E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXyJj2SIDrx1gv
 hmYw/dG23QvHLKq7HO7q09oVBrJWlr2wjB/1MNyUF4DK7ms/y81+uDMIdM15XcizNaO+1Q1RLKX
 jb5B9FO2GZdMIavn1j+R9aSMqiuCZko=
X-Authority-Analysis: v=2.4 cv=ZP7nX37b c=1 sm=1 tr=0 ts=6a2fb911 cx=c_pps
 a=Ms9fQC66fVli3+vYcCKl2w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=xKP1u46aveEBxc_myWwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: rq6zSjIe4KnH4HsyEg7Z2up7pCyFrFY-
X-Proofpoint-GUID: rq6zSjIe4KnH4HsyEg7Z2up7pCyFrFY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX4extNoyVlluu
 SP4qes8RNLpOeKbpu+FfPXFU1ZQCfe7TzRCX6/BCYbCCqvoskMqU9GFg/ZKlZNsLqdq2OMlE0s/
 QZ40+mRGwo5zC5heERV73qq0WTAXdRui20alve1nBg95T7Xq4KRpjR82gpH4CLfrwcO/efGII4W
 JZ/J4gZlOzhos5Q/Js4ixJciHfvxPxkRqZII7U6biI3VqfvXGJs32766GURJF/ibDj4OlSVZAzj
 62oioJDHMNz4E+z+5ql+fMx2zFTJUSQeRtwadW3uRiV02SB2EPRzNMC2INXS4Y5aczmRfumieiD
 4APpHnHcmOIAUjoyQWkZFFZDOt5yCoYjFLmZ9+DVFzNNEiCcI/lvGh+0huQ96z0cIrpT7ugmFow
 b+4WjxWqw+QZ5QVLNsaIH0gU1oInkSg+1A4AzHIHRFifYY4qELEKdhyEf/luUpnVPtj5YjumuIS
 Q1OiSUUlYFNvmlpWL8Q==
X-Proofpoint-Spam-Reason: safe

On Sat, Jun 13, 2026 at 11:45:53PM +0530, Vinod Koul wrote:
> On 08-06-26, 17:02, Charles Keepax wrote:
> > There is also a "non-pro" version of the Lenovo Yoga 9i (83SE) which
> > also needs a quirk to disable a non-existent Realtek device. Add this
> > missing quirk.
> > 
> > Co-developed-by: Julian Haarmann <julian.haarmann@student.kit.edu>
> 
> Need sob by Julian.
> 
>  - Co-developed-by: states that the patch was co-created by several developers;
>    it is a used to give attribution to co-authors (in addition to the author
>    attributed by the From: tag) when multiple people work on a single patch.
>    Every Co-developed-by: must be immediately followed by a Signed-off-by: of
>    the associated co-author.

Julian, I assume your happy with me adding your signed off by?

Thanks,
Charles
