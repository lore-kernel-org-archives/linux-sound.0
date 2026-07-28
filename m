Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDDB3EE1D1;
	Tue, 28 Jul 2026 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223911; cv=fail; b=jyvpW8wc5HIJ1kZ1+gLKSmNzQdk2Gm/gMXbTFEppu8ANSoJkJXooAg0wGr2rmPCxKZXn3+O2aN3raYgu10i1ym4UKLGpyLlPavjiGZKAjG8Pr6GNnmHr96fhcu6LekcE1QilRfbMxgpTg0+FDkXqrCiqpPz10xUgqb9KfVcT60E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223911; c=relaxed/simple;
	bh=VEazoXzlcJeEXOz0cUhZoel4D/aDzNetqVZQLnVSndk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cipqNEQ3vsIWacdet+6Dc9hsm4HFJPDydli4kYDTH14wdO+J6XkONYy/Z+eLUhhyYPSk/c7NdeQLBuoBWgo9dhQYQLUls64KSLOtVeBdb5BX+mfcmVmtJSqGNegCWWNpCvIA5efxC0R7ZE3qGUumONG+POsXoc/ZzXhlS3fcpf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ScsKtklL; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aXKEtW1n; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ScsKtklL";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aXKEtW1n"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66S48hcv244105;
	Tue, 28 Jul 2026 02:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VEazoXzlcJeEXOz0cUhZoel4D/aDzNetqVZQLnVSn
	dk=; b=ScsKtklLe2wpHE8xr3RH0fn/RCUADalG8VSX4lRWpmR3uMMKwHEf8CgtG
	h0Y4TgiavsXMCsIW7glXkcdlBOtvoCZ4tElSwg/Pz21nLGtQwrYtomT07iSOnjL/
	h46kKezfxel/9JFiPGhJs+XaB8Lr4WEthkn/icC6IRaRm/llQsxr58MnVEAf8P4R
	GcT/X4teYFo6zktF2Htwh1otkvRMCdfQKuMUYaPgG18TgrbXXcmKxlqW/W5hNVSa
	EURF/rRT/Fh/KXKBtanxCi90q1snPpX3vQoEF1OfgdVYKVh7wpX71eF6tvqAovKH
	DJawhmMvrZkIXyvxx7udZvFlblwqw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012002.outbound.protection.outlook.com [52.101.48.2])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fpn4rgya3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 02:31:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcFP0IdNC3x/JZAeJY+S7ynortFwlv4MM03X5XoJTcI4U2QH7HQ6iAqLAtBb9PZ9mECQ82tQ1+qK5Oo/3Mn1YicXI1+FJyHwg2kA+Swodq8OOrP/FmRiM9vUV5HsWVFnjtjVDXBg3U6QpP5J1mBfDIoWEWhA72DHI6Ta5u7HfpCSb0ryXzEHa5nQb9QTyo2LpYam+3U4hpys3zFxuN0mUvp2XISk/Ph3ggNf+gCPEAz8kUKYbcN+DVPv7QTQt91hIUtXjcAUCy8kTGQUuJceJ6xeu9t4ZiuH0GcCsYbnOzoHlmA+Fb7z5BFBoe5gvFV8FJSubI8Q/PkSOG0zFdAlfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEazoXzlcJeEXOz0cUhZoel4D/aDzNetqVZQLnVSndk=;
 b=qlpRkDEFU9aroDA9Rll3JlB2kPTCl2SulPe/M4VmrtrNXtpQpOZ8zHblVOLNnXdb4LLwNd5xii5fdS54vhjGCPUQWa3WQy5/tR3gNo6/x7cxlSFNd4zGvezNbudRTcxV2gzhC21oyTWZjf7pD7iNzN1vAxEK4iEl6/g82tHyaUyGMzPDoZR4Hr3XEJdgLPbkL3AWfHhdGs4RJfLPYS+LHN7cAWHlhdsOVqG24dFtj6Z1mkZmuKk8hz7TnBOqxOBssaR7746/tw4DH4ZH5yJlllWIyk6ybZsqB9/Hj0r9RkZOylFIhr75AOvVyh6QbVMIYxILWizYSl+ztFDf6lVQsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEazoXzlcJeEXOz0cUhZoel4D/aDzNetqVZQLnVSndk=;
 b=aXKEtW1nRLITqGj2Y8kyzgko7FEXQ6lrb8Y4MN+x67rdBoDLKzy6HENLKWN/RIQezY7VfwaOzVjI0ak7MM1CtOezuYruvXtievhlrK0Qx2cKdPhTvSpFRzFpl3Vfk4v4te8lKawS/Vo9Fd/PxM+qbnvp2YH/2YaEZ2sg1bpmKkc=
Received: from CH0PR03CA0265.namprd03.prod.outlook.com (2603:10b6:610:e5::30)
 by CO1PR10MB4754.namprd10.prod.outlook.com (2603:10b6:303:91::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 07:31:38 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::8a) by CH0PR03CA0265.outlook.office365.com
 (2603:10b6:610:e5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 07:31:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:31:37 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 02:31:37 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 02:31:36 -0500
Received: from DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf]) by
 DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf%14]) with mapi id
 15.02.2562.037; Tue, 28 Jul 2026 02:31:36 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Andrey Golovko <andrey.golovko@gmail.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Mario Limonciello
	<superm1@kernel.org>,
        Antoine Monnet <antoine@montane.tech>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Pierre-Louis
 Bossart" <pierre-louis.bossart@linux.dev>,
        "Lu, Kevin" <kevin-lu@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>,
        "Xu, Baojun" <baojun.xu@ti.com>, "Wang, Sen" <sen@ti.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: Re: ASoC: tas2783-sdw: port prepare never completes after S0i3, no
 audio and no error (AMD ACP7.0, ASUS ProArt PX13)
Thread-Topic: ASoC: tas2783-sdw: port prepare never completes after S0i3, no
 audio and no error (AMD ACP7.0, ASUS ProArt PX13)
Thread-Index: AQHdHmMf4o92HJOL50GguxBrOuLa8g==
Date: Tue, 28 Jul 2026 07:31:36 +0000
Message-ID: <b863334f983a42888d0de5973a998020@ti.com>
References: <b1bc21c8a403fe15e742b6a6ff30b27f@gmail.com>
 <c6b9b217-3678-42d8-8e01-7fdbf7c67c7a@linux.dev>
In-Reply-To: <c6b9b217-3678-42d8-8e01-7fdbf7c67c7a@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|CO1PR10MB4754:EE_
X-MS-Office365-Filtering-Correlation-Id: d51de4b8-c564-4774-a694-08deec7a424a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|7416014|30052699003|82310400026|376014|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lwyqfOsrrUbAcFePHWh3qrDQfDbWIzwTvxFixMFWtAnZJ4AFJBiZjj6bHwyy9oUglW2wG7j0e5epKfQbpA+zl3st1Tsp6V2NdzdWWGz62OWCjNQDiE22l6Qu2atEneNDvxWAIszHxjjZzu0XGcIOG2RGGGrBu/bZ/2vRaj/QGGGJPeMwmc3scOZAmT+p5O7CQqIK/Q95cpOPsol358dbSZ0B/BsLWWpTaCbLGrL36FU35wWNpd/JarMxULQRK5Js6N9wH6sVuvq/UMfKUcYLVp/6sVmCXYL6WhUrYv5xGQw8j3n2rmAW1k8cBL+mrq8mM/CvZUdFAmyfYS3NKqWO+1gZRCpLN2S/wRVCUazQCAgP97L6iYbiEFwXt+kddmvHooFjBxp5dLKseSt7qk59XcGk92oXEk0eZleL+5iZFIBVeoTRC3dH9+QE7WRnbjRAqavsWgNXvsI9pT+3u9obRcyHIV1LiPkqx891epdTxy//y8S2kGBIrQCb72lpbKMM+ak2Ce0/4K9ntlZr62yABHvRxHMpsHN/tUdUX/eVW3b+jmVL4bWMk8dpmdmbCfpca7Ygtski77SoGYJSLTeBbLEv+8fBKamxdMga+AgmCfMN2bmQ2ob2YAw6Xs4CK+YfAGe68twxef10AuL4Pd11ZonPXtGuNOH3/AflUpCpm1aHDT7A3DYDdE+LBtySvz7xRA2NPbT8WeP8qXcG0b3ZPA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(7416014)(30052699003)(82310400026)(376014)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/V8EVGJrzwW2SybCTP4hUycWqx7HlOFLVs4s3Tz32GCYYWr4pO7yejL3mA9/0mhAKRhHWhKoEMbBuXT9fnQbEIXoHgBlMATjN4k7kMrLCGsy/nVg66OLSXpjwj4SN6M+vIxwLl+PNCljBECIOlKzWGSCr8XhvHOxNSuC7trWF/2shOfEt7Vo6UKj47mACQgqGVGOUqs9eJfDIPnYtYmaPicRsK2rLYtQ5X38np13rpz/PZL2qNGNNke6nNwzpANVb5w9qnyiQF2t9pcSZayOjmoitOhzBWezgrnKK8JE2zezg7jSAim186sw1GuJZGTymzv8J2h5rpioMoj3ecBrvUbvvMah2rFWEJE29Nj7aHp51Df2cF+p4Uo3VFg7d4VuNmwYrgraAdnbvSXoKT4l+yNoSVW6kaChiMre2pLzGoG3ejPWWofrLos4JK3SiJAF
X-Exchange-RoutingPolicyChecked:
	Be69o4+yu6FsV20ULBDJm0SeFJIdwvQmy5zt4DUSoI6+krAPGeb0u5SoNP+UFQk9c8XJZ3937N29otMuZnkAX5QI0XqTxPOR7FzWy7Mgf1zi0kBBpzSEV9HoLVyV2/hpFwJ61j6kLhG9r0tgdgqPWcymfFv6+hteCoCh4Svu0uEgD+YwvawN45y/3tdoG1DhPA1pe0uuAAR5AdeIc/6DNL/mdqSa61AHjM4hw2nzGC46MF+zR38VZqq/16avfj49zDPaVs5eobKLnrJa7Pw83gkd/pn4IklpZScNQG9mDSCim8VL+NKXLhWkh3e7uCjzQmpQepJmXwArPJyaWpLiYQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:31:37.4589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d51de4b8-c564-4774-a694-08deec7a424a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4754
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX1vcTUVhElgm5
 CyhvOWT2YjTPE10Nn/zAUCjVrcuhXraBlD216uni8r3m2PThXxzsBV8/wB/qTk3gLsXxComX4Z+
 lYEHyUws8FXsqtcArXMJwY9P4PUv9SncjH9o4UGK9DHYOeziSO5NhrO4UHfeoxSMHD4rVtSs5ja
 mZroX8GAQJkK7aXyi8XfZsDfK8BraaCkv8U034+/jUHmoEuwvDLQkguiCRw0uSXBqQi4IyQpmOp
 2IyErhTZi9kh8Ps59Qdn65HDTFG1fQS6MLCmHeZ+9pshZTqSI05UYapS1JAw3d8vZur7EUPIXtj
 5rrO3Sb9tXLHSq5CFsbZSxcHXw4ifLzBRZ67ByUXL4Hs3BTS96+aulyeY7Ne/T0m+iWICE4fUR/
 WU4s2nmtKACkuNmJF0HexsnELIKnrNLilJmhM1kG+OVkO5WGUY2v45urmVWY+IIMhVeiDH8fJe3
 T5IPZ6dXdOvfSP2pi7Q==
X-Authority-Analysis: v=2.4 cv=GfsnWwXL c=1 sm=1 tr=0 ts=6a685adc cx=c_pps
 a=wMiyO8M9v1WpSot1jLKY+A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=xqWC_Br6kY4A:10 a=hd59Zx_pdMwA:10
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=X0-F50vwD2wpsZR9vbIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfXyOC8NiKG5Pgu
 hmkfhPQpQ0Y7HggEvlLl8C71aGrax5lgW4kYiZqBR1v+kSOPFmj/lh7je24OHiolNeuiM5eSZry
 OwsqtPA4m13qUKQGk+O2622A1ONe8lo=
X-Proofpoint-GUID: vL2CIpQd1ABPW4OjSk1qQRhWU3KC7YyQ
X-Proofpoint-ORIG-GUID: vL2CIpQd1ABPW4OjSk1qQRhWU3KC7YyQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 impostorscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280063

PiBPbiAxOTozOS0yMDI2MDcyNywgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6DQo+IFN1Ympl
Y3Q6IFJlOiBBU29DOiB0YXMyNzgzLXNkdzogcG9ydCBwcmVwYXJlIG5ldmVyIGNvbXBsZXRlcyBh
ZnRlciBTMGkzLCBubyBhdWRpbyBhbmQgbm8gZXJyb3IgKEFNRCBBQ1A3LjAsIEFTVVMgUHJvQXJ0
IFBYMTMpDQo+IA0KPiA+T24gNy8yNy8yNiAxMTozMywgQW5kcmV5IEdvbG92a28gd3JvdGU6DQoN
Cj4gPiBRdWVzdGlvbnMNCj4gPiAtLS0tLS0tLS0NCj4gPiAgLSBTaG91bGQgVEFTMjc4MyBkZWNs
YXJlIHNpbXBsZV9jaF9wcmVwX3NtIGF0IGFsbD8gVGhlIHBvcnQgZXZpZGVudGx5DQo+ID4gICAg
ZG9lcyBub3QgcHJlcGFyZSBpbnN0YW50YW5lb3VzbHksIHdoaWNoIGlzIHRoZSBwcmVtaXNlIG9m
IHRoYXQNCj4gPiAgICBwcm9wZXJ0eTsgbGV0dGluZyB0aGUgY29yZSBkbyBpdHMgbm9ybWFsIHdy
aXRlLWFuZC1wb2xsIHdvdWxkIGF0IGxlYXN0DQo+ID4gICAgdHVybiB0aGlzIGludG8gYSB2aXNp
YmxlIGVycm9yIGluc3RlYWQgb2Ygc2lsZW5jZS4NCj4gPiAgLSBJZiB0aGUgcHJvcGVydHkgaXMg
Y29ycmVjdCwgc2hvdWxkIHRhc19wb3J0X3ByZXAoKSBwb2xsDQo+ID4gICAgRFBuX1ByZXBhcmVT
dGF0dXMgYWZ0ZXIgd3JpdGluZyBEUG5fUHJlcGFyZUN0cmwsIG1pcnJvcmluZyB3aGF0IHRoZQ0K
PiA+ICAgIGNvcmUgZG9lcz8NCg0KV2UgbmVlZCB0byB1c2UgdGhlIHNhbWUgQklPUyBiZXR3ZWVu
IFdpbmRvd3MgYW5kIExpbnV4LCB0aGUgQklPUyBzZXRzIHRoZSBkZXZpY2UgYXMgU2ltcGxpZmll
ZF9DUF9TTS4NCg0KVGhlIGRldmljZSBleHBlY3RzIHRoZSBEUG5fUHJlcGFyZUN0cmwgYml0cyB0
byBiZSBzZXQgdG8gYmUgZnVuY3Rpb25hbCAtIGJ1dCBkb2Vzbid0IHVwZGF0ZSBEUG5fUHJlcGFy
ZVN0YXR1cy4NCg0KSWYgdGhlIGRldmljZSBpcyBjb25maWd1cmVkIGFzIGdlbmVyaWMgQ1BfU00s
IHRoZSBEUG5fUHJlcGFyZVN0YXR1cyBiaXRzIHdpbGwgbm90IGJlIHVwZGF0ZWQuDQpIZW5jZSB3
ZSBlbmQgdXAgd2l0aCBwb3J0IHByZXBhcmUgZmFpbCBlcnJvcnMgZXZlbiBmb3Igbm9ybWFsIHNj
ZW5hcmlvIHdoZXJlIGl0IGNvdWxkIHByb2R1Y2UgYXVkaW8uDQpTbywgdGhlIGNoYW5nZXMgd2Vy
ZSBhZGRlZCBpbiB0aGUgY29kZWMgZHJpdmVyIHRvIGV4cGxpY2l0bHkgd3JpdGUgRFBuX1ByZXBh
cmVDdHJsIGV2ZW4gaW4gc2ltcGxpZmllZCBDUF9TTQ0KYW5kIGlnbm9yZSB0aGUgRFBuX1ByZXBh
cmVTdGF0dXMuIA0KDQpSZWdhcmRzDQpOaXJhbmphbg0K
