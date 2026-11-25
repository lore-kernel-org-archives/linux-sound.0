Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795628518;
	b=RxP7YAhl4+AKFZoW2aNh57oJJpCEUUlcCS6w0wCp6VFim3UtL3N2oNCWMQg6woi4mqBm
	 yQqGBbvLZbQi5CTvxN7MVY0T/o1upw0ZvWGkCLxCuoRqN3HojgKmKahe7PR0aao2jFegq
	 wnCojLy2dV+eVhUa4w5E0wLTcWXtrUrSvXSE/LOO+ehVgIhZ0MXCnK/xjiQb3El53KDmz
	 T4So7XQWv8hZylx2sgjueu3jixShkTDpyhT/yukmNJUSJZUshQ81URrydVjUKKTl63sZ2
	 s0YeXnWRb2imtiVAR5B9cD4cZ2Z8bKoOgALzdZFrXjmPCnY/Mm1kvtxEb9tg9CC3YQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628518;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=6bgIxvSC6lng2qXKDPBHQX5MMrg4a7h0k7rljApoI/I=;
	b=j/4/TzlRzTHG0aXGKIJXFj7PvnmvK9HBIkJ6lh9GS4m/+TAaSFYm9cq8uFg6eSXKhRNL
	 TNbFiOEyrd4SCRDNJRIh0Q0Urpd63n9XRMJAk4NB3rqQQQev4sxBgbgCN8lDcf22NC+EN
	 rlWREVeQ776FW8HWkmfwNC8+e1AIHeNXOtZVhlRzzOHNe1fCKNepKIsagDdZyuG7OcdKw
	 ue+RHrV27X58L6H0UH2zhTk+Lfh7LnP47gZlO+AEaGEfj0Anb1gmvkBPD9ddozF1+9THz
	 oTafIsRCsRx7zNAL/AXUn56Mr3Vdl2mYYZj2ugLjIDzUpl1TYtSNEf93kGxDD6APl4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=kiPYayR8;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=OQHjAU0k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D47606A31E;
	Wed, 25 Nov 2026 17:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D47606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=kiPYayR8;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=OQHjAU0k
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGg8Wb2244408;
	Wed, 25 Nov 2026 11:41:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=6bgIxvSC6lng2qXKDP
	BHQX5MMrg4a7h0k7rljApoI/I=; b=kiPYayR8j+1mImXhbpPuAGNgY4HwMvySv3
	hFO+0jo5aThqHSMnVhMUHOKTKAuYo9BzLnd4nzYseFCi1OYqUeQrrHAJ82rBo4p0
	jBrSZM6C79ZevZLtFvWyILnL0HoG7FElhmO1CabJTGDqtyBLmNDvIE0DcMBA8yDQ
	Zeb/G6eUZArHTH2QLxNRJLVCGPsE+J2VsK6VI/A+i49r7OwSWCfHiuNeYFdUo3wz
	2o571bviWU/O9KTcoTzlWuWNvNtR+jjUN+MBtORjLcUh7L4ySIGaqOiOQN1leMyP
	g5pUcT1ytkpFwdAZIfsUBh8Y+7ilOa+21E6vWi+4jWFJ6Nt6AaHw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020093.outbound.protection.outlook.com [52.101.56.93])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j518832s7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 11:41:31 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZ1v8E1MMvIeC+c/GJ0qo4Br4osfvTz5/O8jta91zEBILAvNVSWdIHcJ2DFbQUoHDzeqlwmz7ThCPn2gbCdNfkzW9QdXGMgBxdMOeP1tWMbTGyni6dBIEMryV84OTUyoVMgDV7L9VEK8Js789pd1WZ9IXE72X4FiC8vigRbpR3IdTHB6yMjQLa2XKZiPFEYvCPRZ2WsgICbvI++zJa/h4N0dFdD2AJh4Dlak4teYWkkvCpiJwDbVIPV7DpCyKc7LmWiEuA7VsJnRPzhtW7/ymlkyyFdjIag19/9WXbSEsArzVgeHu4DkwafRfiBHqzTETm9oXAzSQKIhBAgPaVUgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bgIxvSC6lng2qXKDPBHQX5MMrg4a7h0k7rljApoI/I=;
 b=DbPxZFGif50K4eZouD6UCa1cZPzqJuSS7o80xpvs36QMhVjHQ60usox83K3X9fwHuw4lyizRcn9Ev6s71GNzAWiN93Sg7SF7DIot6eU5g6stZC9aMpw/m9i8wkV5Y0gZo2C4WBCrjuKLl84EKaN50ublei5Z2nCl2uNvuNIqrI5pUTA6RenRrKD2pQ8m8lNf/ov4TNPvKDFtNuZwPlZGUHeSg+NdWS+QSxr/onwBf0ROqxOwcUUZw3qcCMO9o6h87BkehDX6amgDLrwCTodPoDDHDA2MByR2ihI+jXOma3RuRqsWUsjWZF1w39WPuwlS6tWIoJrLws7UTYZaCcgdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bgIxvSC6lng2qXKDPBHQX5MMrg4a7h0k7rljApoI/I=;
 b=OQHjAU0kWQ+wwfPXtit5FuIPvPXS4MC0J8gemM+5q9laCIo33opfuolZWVWCWgrZA9SGR72lsN+vk7Vf6JmDB06JH/KJBK9jRBJXhdwcJnOWX6T+RU38jP65bZpMNWNQQr8hvrREF4XFFzWrTAtFHw7gKq+AGht2S1DRNCAkyiA=
Received: from PH8PR02CA0001.namprd02.prod.outlook.com (2603:10b6:510:2d0::19)
 by PH3PPFA470FD931.namprd19.prod.outlook.com (2603:10b6:518:1::c3f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 17:41:27 +0000
Received: from BY1PEPF000264AF.namprd02.prod.outlook.com
 (2603:10b6:510:2d0:cafe::25) by PH8PR02CA0001.outlook.office365.com
 (2603:10b6:510:2d0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 17:41:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF000264AF.mail.protection.outlook.com (10.167.242.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Wed, 25 Nov 2026 17:41:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B807B406550;
	Wed, 25 Nov 2026 17:41:23 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A3A9D822540;
	Wed, 25 Nov 2026 17:41:23 +0000 (UTC)
Date: Wed, 25 Nov 2026 17:41:22 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SDCA: skip port channel mask for Output Terminals
Message-ID: <awcdwnW0fyJFOzaM@opensource.cirrus.com>
References: <20261123165612.440542-1-srinivas.kandagatla@oss.qualcomm.com>
 <awR2ML/nYeYHrUpB@opensource.cirrus.com>
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
In-Reply-To: <awR2ML/nYeYHrUpB@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264AF:EE_|PH3PPFA470FD931:EE_
X-MS-Office365-Filtering-Correlation-Id: c981c095-64a4-4184-4c7e-08df4b1b53f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|23010399003|376014|6133799003|4143699003|18002099003|16102099003|22082099003|3023799007|261022075727099003|10067099003|261102123227099003|56012099006|11063799006|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	TRJQ519sRL8sy0/us0fpRuOlzpBbrWXxQ/Gw7F7Gj808UUDTdak114iqTSV0vwMWUrvNG9o4sAEUd3a4QEozOtJSCddOQuG08RFYrhwvVc45u1J3C9q7TKNUiDJVDPjXq/PCE49N+zRryYc78fVX3nBKRDKAk+ViN5fnEvqDrfwUoUJgpgnep6UJ+iwA1pvEbWBsDXC/4NaYU0QpMTLnRlAtHkxoeQEmBoExG6N9NfXmWSYXEE7/JzIs3II3CCenpavAaYJsUAQ0FmLjZiWyAO7fS+14nfSwKBIMN//yO5DkKYRg2ABAEfa+ue3rMKmvieYNYbO5vasmjPipMrHsaLPg2krTBKq0YqAwa767QoVgWNCStkzp1RmSSviopNlMxArlzbV96L77cBxuuEChnSWs3vUxNG8HTZQ3EK0FxY9aqD1tGgAacRdkSt7FDuMBGQMIlLulKolWF5asnQWPSE/DDsFg2iL7gzPpI3LJr+jFq3HnQsSgNqqdRLhUwEs+S1Gfwi0y7k2LTNbxZN72mIV+EbfivG+eFPO8qH2YXqvY585ey0RhA9X0xgS7xbVRcGmsgs9rZCnQp9O92xZS6ukJwYQVx4quyiF6Rmf2EViFqhLHTvEv90Gy8k24+g4WFF6iSDJDmAAqaadSpzrgYoy0pgs+qJQ4b3Chaym05XAUsj44I4aaqlHh2R1POYsWcNc+AOeSoL+p665K1WNUUA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(23010399003)(376014)(6133799003)(4143699003)(18002099003)(16102099003)(22082099003)(3023799007)(261022075727099003)(10067099003)(261102123227099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WA+3y5Jy+Bl+IctRMJTNgS4GYXwkPmD7y1jSoLhqHAWXFlD8Hzwt//Ie5NSS3IoBZFxmmNoqP229U6d2RwERe8yEqh8REZu4kfThwXz2C+7AOpwHF+NbfF+2+8xhVLsA529U+w+z2oYtSw4SCN368KEVKq4Ekufj4XDGQorbMlSMjLIpTpXKCQuxf1o86ckOAlZ3KCIRJF6NJiwNju9IIf4zQK1YwSw9kcfWvwz8kJIben99JZCAQx26J87fGiV6Cse8sp7xz1uP1r3XdBmu4hKmN2MimLlUAJCnNDTkPDHZ1Y8nMvipS0S3Zv9PNweLe7qo/B55YPh8pQv43i/8+PQs2S2mhljI0gGFvQl5g6BCj9ma0/h6jpaM6psRRupWwW+lRvXBTxA75L8ZSvmD/OnsyI1c14PSQJXJ3SVRs9xqWJmwENbrdZoxLF34bCOW
X-Exchange-RoutingPolicyChecked:
	o630BT58EPdhBWZryry+RGtYxC5DXtw0qp+43gl0pEa+/wPpm5+J7ZEnX6VvTh7kUbQ9ie++fm+EFpYj2wLQUmYIGkeFBEqhr97vZebeBYyNUdVUylhA9iH+OAP8UGbMcx+ORdOonKnKIwgrPwgQVxzXIdcPFywK6gJSQs0xmFoYxLM3Sr3MeElBNJ3ZQgETB2Jy8HSWoPP5MtlssaBFiA3Z0SstfaNv9cxlAUVvcA+uVM6Vb/rxne99NRYwE8bA4jR2o6MaN5i46LVrZqySeT0IbyP7IhhiXQ9iiv1glhtdOZiJa1IVxw1Jo+Hq6nVmzwiVIp1nP5WPKxCXPcCL1w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:41:25.1698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c981c095-64a4-4184-4c7e-08df4b1b53f8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF000264AF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA470FD931
X-Proofpoint-ORIG-GUID: IKL1EROBvieEWJHZv6QDhZEBhGSLn4GU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MCBTYWx0ZWRfXzAuwZwQ9Bt5k
 3iwRBi+DwDHYRzEZinyMAuhFTrYsGLANm8XUrEr0RZh8K1PnfF3WGYXvjy5nxnrIL54Nuz49GVv
 yarrWu+2R+66HXFcftjXiqGXK8NxezVqqYdc8YxTww4lnMCaJPuuIcMGw4SRMm0dz12FF5R3+d1
 DikNB/hPSsfiN+qRUuONc7PiLPObJD4LTnXM988Dwn7xjL8O+pTNlXJ0Lq/BZofPr+VndEukujH
 VZkbbSHX2GleHI6Geh5Oa3X7EjGLF3zPh6Y2lbvHwlMzaOwTcUSdTjMAA1y2EeLF24pYfMEV4xL
 hdyUVDqhZnEnAHfWSFh6JfCL1tPdeTBmqldpW3CrAJOAgGamzixRbPw0o6aM/CSpZ35oy1wrhbr
 yzlDs7FHo0DM0hOsIhnk7M5X2RC3nNebnsqXHxSzSAa7f/xJrAd9kUTjTe2e5JzGhWb5zBwo8WG
 tPSSjN7pqWeNpXRNuqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MCBTYWx0ZWRfXwarFCTUv2EqC
 ICBzH2/UP1dSxZ9OY9uwgsL1HsdTpbDeJJ9YZlTuRzscfbhXlWebXcOagCYRsK6QEZl2TAPAc4r
 SwWKQSXsBQ8Zp/fTpR7ZXXy+c3vmq44=
X-Proofpoint-GUID: IKL1EROBvieEWJHZv6QDhZEBhGSLn4GU
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b071dcb cx=c_pps
 a=BVZXAR9urkJIT3zY0dPXyQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=IQCkmDhhI02qCFDC9ccA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Mon, Nov 23, 2026 at 05:21:53PM +0000, Charles Keepax wrote:
> On Mon, Nov 23, 2026 at 04:56:12PM +0000, Srinivas Kandagatla wrote:
> > Only intersect with port_ch_mask for Input Terminals and leave
> > Output Terminals on the cluster mask, restoring the behaviour
> > there to what it was before 8bb24d87078f.
> 
> Ah the joys of DPCM. It feels problematic that the backend
> constraints are duplicated to the frontend, when a significant
> part of of DPCM is that these can differ.
> 
> The "correct" fix here is probably a bit of DPCM working,
> although not sure how significant that ends up being. I have not
> spent a lot of time working on DPCM.

Quite tricky this, at least on the DPCM systems I have (Intel
based) the primary CPU side DAI ops seem to live on the backend
DAIs. So likely we really do want the backends to use the same
runtime, but that makes it quite hard to know what to do with
those constraints.

The params on the DAI driver are folded into the
snd_pcm_hardware struct, so maybe we could update that rather
than using a constraint in the class driver. The DPCM core then
has flags to decide whether to process the backend codec DAI
drivers. This also comes with limitations that it only handles
min/max.

Or maybe we could do something like an ASoC wrapper for the
constraint functions that no-ops if it is on a DPCM backend.

Both of those approaches do have the slight ick they basically
require you to do special things in the codec driver for DPCM
which feels like it should be transparent to the codec driver
though.

Thanks,
Charles
