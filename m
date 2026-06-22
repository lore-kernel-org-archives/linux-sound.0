Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13063B9D98;
	Mon, 22 Jun 2026 14:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138558; cv=fail; b=cq23336QZE8A0JO3Wf3AGu3g1I0hs9NgusrvzTDJAVgALhysQjVeeRjizhusCpHzD7xeWPaJCO0mtpciglEKSZAiRUIOv05g/vS+hEMXPF87v7htljN7erz2kkzZ5eIWXSZai0Wg7N4yVAFykobj4fsKaMUs5wk43cF44exFFfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138558; c=relaxed/simple;
	bh=o9RrsWrt5DPxjPu0vtrhHuyEaoxK57YpwccsJ57sQEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbosNxkCw5OdG+aLsBIHcOII90TvNulH3Ce9RSAv/0ph47KULaC/Yotulig5KlKXy3MsoDFyECvgnGQ3sjNzWteXw+GQu9VSzr6e/Lqy7ijM0Db1vD2D8Y+7UICBYXaNWufUOro6aJFGFVZjK6ZV0DbM3Lwh/WKYWWhkjB+MckM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Pz/cwGWD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Wf8rsnui; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Pz/cwGWD";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Wf8rsnui"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MEKx9b3837430;
	Mon, 22 Jun 2026 09:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=6ZZr0eudmyLQSzJ3bX
	N5wpWIbdguNSHHhTM2AqFlCrE=; b=Pz/cwGWD09sl0jBJT6nsY+LHP1xNaq2xt6
	Om75pOxkRyKwaKHZE0CGupyjnFdklezZNP9Ab63lS1wSNloiU3nef5sMRCwnk9wa
	lRtgiK/f6yDmSaKhl8IAwLlrSE7HuSPi3hbFa6GHRvgZqOIrPW0z7sIJNqh9J21v
	1ugDvavyMIMQR0iZVw0Kd/wol0nmCsdziU4RaGv53WRfj8vWWF/83dnzxcwDrZQu
	l7GTX6skJul6CLwwAy78VV2I26xWDHpo80e5clW9z3JdBSgSR3fW85OvMA/IyBLl
	jAuBdMEIIrzDsdkF8LDbHI/V0yRfUf5G7a2dqQjdrCxCNUHwcTjg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021085.outbound.protection.outlook.com [40.107.208.85])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ewq9jj2k2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 09:28:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJLp6+hCudKmFe2o7JtnjaIunDCZcr243mActDeVCwkKV0C9Jcb/3fSmDOL9DX6joe9VW2OZ87fC/7wjzoWShc+XiSqHKq2PYx2wTsDRyF8VrbpeE0gjCPn7kH6lbnsDKRicmOmPHRQqwTI3B5XD07/Jo09eKQZLc3SLqohZrgXyXsszRQfrPomMYEAs5GHu9L7NoFK305F9nZVCnFo2i+FMXepr07jEmWPYt3p/pAR1aEqBXD7m6p2LzKTNSfDpf+7S4LAFki0ELEF0dZ5K0VwgWtiwCgnJv0wFTk7RKg79ur4rNernS5qY1odvcf68KflDQ9wqt5fr0x2b+FKGOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZZr0eudmyLQSzJ3bXN5wpWIbdguNSHHhTM2AqFlCrE=;
 b=EeTb/siQsdnphZNjhr4zBpztlofeoiv3VNZB5H9RNJDF8gpF2lr6VnEmie0xyz+AgtTfCa57AeaeYXeY3EbKIMZ7GJ2ASURiaYgfdrI1TEDv132laeCchcR8bwHv6p2+jw/QPrUDAlOE/KFKNiqceboJyCFPEBnscsjCLMOlhFhCpfc6773d/1AjUaEZhPT+bvAPd6gS994mkQUtJULAXO9kXnygoebAa/FrYMZTKNZn1Kcpcg9VlosqQWxEZ8ScCvmbQaJAA3w66ncg0FQzH2xoy6bvkqe9A95Alvlcx13A99ra62ZZhPeEXIA8JUAClCiaV3WABb1TN2Xto5cNVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZZr0eudmyLQSzJ3bXN5wpWIbdguNSHHhTM2AqFlCrE=;
 b=Wf8rsnui4F9NRnqBoPpDRzJ5g8iMi2zJ7nHMJT6xJFggFMpUxol1n/LEGS2rPwSMBMORUWaucMDoOjua8FMCcFt0J6ZB3Jt/cbgWBrXJDaDXDTorCFs3fD/cWRM18DCIFCKe1YLwMuEG3xdLjY7hmjCB4grgzHbg4Icgsqr+x8s=
Received: from PH8P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::28)
 by SA6PR19MB8676.namprd19.prod.outlook.com (2603:10b6:806:41b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 14:28:31 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:510:2db:cafe::ad) by PH8P223CA0018.outlook.office365.com
 (2603:10b6:510:2db::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 14:28:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Mon, 22 Jun 2026 14:28:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 62BC1406544;
	Mon, 22 Jun 2026 14:28:29 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4B7CD82025A;
	Mon, 22 Jun 2026 14:28:29 +0000 (UTC)
Date: Mon, 22 Jun 2026 15:28:27 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SDCA: fix __leXX types in find_sdca_control_range
Message-ID: <ajlGi2t4YwsYK2Fk@opensource.cirrus.com>
References: <20260622134247.465275-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622134247.465275-1-ben.dooks@codethink.co.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|SA6PR19MB8676:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d271a2-d0a9-4106-a27f-08ded06a8891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|23010399003|36860700016|376014|6133799003|56012099006|11063799006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ugDLe/s8cXioG5lXpySk2+SgQ3RbGojvimV41IH6G4HmH0D2HOWm2EB50gL3cTMbPAJY01XuXC84u+KB6mvOclYzSYzwf3SImlLrHGELG0ERBREBmT2JSlAzu0h9vkEz3SFcdho+XYT0xKW1zK8tz7ADkObA48tTUgeCfXsl7f7FqUDHBjljoKZkjdkaJ7UPMcDgK6iTRoPRGHf1XejIKY9QrnX2y43LuTJ6wewZOeJI8udHJ9W4pYPTOxgsjsafeaIpAGIpQVYuxgtAutq8kXKvPzKnaQ1VJkTElqlZXyQSj9MUUYEE0TCQDKcMcVhatokXiusqf0CNmDgT1e7P6mpLmCNprolrpC222Ekf5dhzEb3BuIGlu+G/jlhbOQoU4JUZfP97bBI5dY/rWdyVIwnD8bFnP0TeLmdUnytmFQVjfJuLu0pHGwGHAIVpVZQUpCLsRfT4bNWsZ2mEuduUWip9FeXNsIJtcFPBDmu/OrIGdg9v10Qov623hp3LjzKZJj/b7SANbMdo4/SeYT9/B/OkP/oRosHyfqIldDm95dK0qshuqdVvfFyJUzFtOQ2csBqtXSRdryynUNzeKzeEl262gu+qZVuX38T7WerI6ihGfzI/J2kOraGo8TS7F1duSh0nMec3n1GBGW8pSKOBVGJLZBIynRSNJRMEN6izUM7mpfLhqTQImScxUrjnzYHc1v3KmCt5+8RQcP1xTyNn/g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(23010399003)(36860700016)(376014)(6133799003)(56012099006)(11063799006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3yCksuGJ/4MbQDklfGp54odwgf4Igii8hemlNN9wN/cwvGNNgtzGHloTxTOhaGTZv3Cj8v3MOqv8uF9si+cWYBhmcXGOTMFDbX70BMqMaCgFA6EPnsJg9OFjI6WIa7vdkYGsibERjeCBtw97/jMPT+VbUKtc+gVkLXGTAfXPOpK+Lk55fdWIIO9aSiVDUgdKrl+HQHRud3KZnMC3BiN5wzYOx+NTIZjrC1HKW7uz8bPvU4p4TSUoY3+nbA3BLs7DRDDASXk7UDYwMsxPG3kjkH5FBva2XqeEgdzl9htCcL2F4Vo7wEuY2ncBskgPch/tYsrFDYR4nXYTButTe/6kGU8k6AeVukebTL+nkHq3dscSn1auMnsGa5JmeM4g1/zrMol3mz0RPBJWYHA4zDWV94jJzWYmGHeKQMSrASjID3gPb/F+GqNBO7VXaPQDIWhM
X-Exchange-RoutingPolicyChecked:
	lYi5q+UYj8cFk+8k9ZXds9H6tYF6qUEcX1aoHy9zwHPCbjsStn4+5nxUvKHmdCjuRXLeo7605VXFKoFBnR5fB9zKiItleNmRzpv5I4Nm2srIVIwsNcVE/BVjGCgNAqHKtH413tCWzSjhZI9EZFXZ/kryG0Sb8hzmpqrDSn/2dnAei+RA/KWN/Ck2ZR0jNcu7PCaTvdUV/HTaxUkTid0JrtQehLtdg5uLvPd756Gwmm70DE+QDWE1Bo2ep5VsTXb/JB6ngAwnQw4Vd7E6jsxNqJk7+LW6GRJ35ab8dutp6Y7UwSZxOdrsLs3NqzWFEjqWeJMLhaQZhZSa+oL9PjBF6A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 14:28:30.6591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d271a2-d0a9-4106-a27f-08ded06a8891
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8676
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0MyBTYWx0ZWRfX/kvcYD78hR0j
 1mcvWJwgYG+kTnlFbOEMyipi7pRNTw7rBCE9yBa+r/iqGzOwZqMRjJCppkh2MzyAJXlYnCunoT+
 aaB+mei1Yais373b/z6h9be5rU56My+f/VPWzRAJ358Kio3v4WAd1FIUnmYQJU0vBUNIsI5oRPF
 ESDJT0CrXhtI1A/dq4Ybn07J276SNG71ihZPLZnbv5FeoQM4pxNrw0mxxKSyZ5z5Zz+ThTJgWiD
 TwmuOZbhaCA1z26BIvraUly+xC9EoNuRJWBrx96NWvaX+LQB2bw+C+w7W7Ua134qiGHlmJwSFAc
 pUsLFzDCufd7cGfHhsN1Zz/JenWRAotguUV3+zIAV3cmNLaH3JTHDSwP9sMrVXuAUemvIx7aEPv
 qb8PmpLUjmw+0HjshyXCckkdd3fa+wV3on/uD/kXO3fi14ZMUMrI/ULwmfWcO9jQiV61nsTZtj4
 hEBgHR8KKY9uhgQf5pg==
X-Proofpoint-ORIG-GUID: t636v8PrG-IhnX3y2Acy5ttRNplxBGT8
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a394699 cx=c_pps
 a=XA5JAPkejx3wACcd+9zdpQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=1EsaE_6oAAAA:8 a=w1d2syhTAAAA:8 a=YbfLUP8R8AE7ztt51FIA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=3ZumFrijQQ-2J9H5h8ct:22
X-Proofpoint-GUID: t636v8PrG-IhnX3y2Acy5ttRNplxBGT8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0MyBTYWx0ZWRfX/ke6H7EVpure
 O0uE/sfPHl9Iq0opY55CjP10JWpbQvK8LqqBtAT5En/UuqtopxIW4aCl+5hPCuhbIgWGwSa8/ee
 0Oq4jgz1Wr7ZMko96vGBykM+ocDlgXE=
X-Proofpoint-Spam-Reason: safe

On Mon, Jun 22, 2026 at 02:42:47PM +0100, Ben Dooks wrote:
> The find_sdca_control_range passes u16 and u32 values to the
> leXX_to_cpu() functions. Change this type and for the data
> loop use the le32_to_cpup() to convert the value using a
> pointer.
> 
> Fixes the following sparse warnings:
> sound/soc/sdca/sdca_functions.c:868:23: warning: cast to restricted __le16
> sound/soc/sdca/sdca_functions.c:869:23: warning: cast to restricted __le16
> sound/soc/sdca/sdca_functions.c:877:34: warning: cast to restricted __le32
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
