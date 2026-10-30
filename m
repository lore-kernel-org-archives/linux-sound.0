Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793380458;
	b=S7Q4LSn3pkJkTx5SsgiMS/i9MP2phzrbVygmdlR/xRRU3VmU8Q6k461LUEMHBgNGpkug
	 U8lINJMtyyoh65JjlTU9lWXivK49RMrrNDYj4iFsPkNaDasirr1WtgE7iPSGAM50LsXj4
	 Yg0nmZk4fDDYMp2Lwkx60JmaHGp0M273Gyxh+0udw3tB3G628PQ4HCHyO+3hira/QJzPd
	 Fmo4VMZSul2eoPn+u0x+hweMzf9ahImCzTh9bAPOAEWawAeJk347TbIdXqojt7+wL10I8
	 5INvOALnf4/12Up4Byb1YfYZmar2j9lzIT6XKRnF6QNuByISJMJPDBIK0aqaCkAqMHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380458;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:References:In-Reply-To:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:Content-Language:Thread-Index:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=dgPwnIzCKNYLXM0zTkn+k00hbxdb3crq0R3ipAKdc/E=;
	b=XfW0iBCWbK6ie12HqcCuGE0iILM4ECZu3Fbz5DHSv2CfKuACmxWpFmFtv9avYRpmbn5Q
	 EkF/P65BofIviUxRXgnBgXW1q6oZ6EfMUXtaOK07ib1GHoznraDj5GSrsNAzGsXArSmuF
	 yFxou7rT/g36WnS+iBgsMqQd6bhqU0FFF2hVSuxjolLpEaUU7jBlNnxqlzYmmGP5OM5e3
	 TzPWMmM5ziI7gUZWoSgKSGEeJw+/OAd2tixsvBGbfCxK1JMKkVPcdQpAjODgbD/DHWTnt
	 RD+9j8yNSUrYexyat4rd1O9tMnyTmHWdDC9VcSnaoiajtjB2QJAMw9I6gWLqTXzrKUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=LzzyIRn+;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="pth/uiXE";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42064606A321
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42064606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=LzzyIRn+;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=pth/uiXE
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UGKHqS549884;
	Fri, 30 Oct 2026 12:14:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=dgPwnIzCKNYLXM0zTkn+k00hbxdb3crq0R3ipAKdc/E=; b=
	LzzyIRn+ISGl7Pl6jixqSmKVTu5tQFSc/dPhs6mAlu+eKqFWiTHazVlB2dPHHssX
	XtcRsh99iU1dP1pFYAU0i6jbKgGWpuVzubl2KvGwgOOVb526XCyAZaxxZ73CSPcg
	KFYIVvh5GIbYK7UVe0Dp9fbC8eJiMBdO9/FXCEfssdbMKZjFvT/dolJ+1PUDF+Jl
	xe2Q10xvVk0GOJpfo1BR/lzTpORgy5CFS2JI5DkBsB8KN1yGVNWr1/JT5BnQxhb6
	N0DYXzD5ynAQmEoYVxZZcDwYnRa5X96Q2FDG5BogatUSVP9MPXDjBMFwFMxhwL7o
	K8IARWG5SUX5B3Rohv1JHQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023094.outbound.protection.outlook.com [40.93.196.94])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hme6ns52f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 12:14:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=un5YcgM7o+Ffkvh/MHVdKULTXir1LJ3cfqLeshkWHJzVVlDH/gGubcvtR8AF/+VWFeExsfUGk0n78ZDT5AYMBInTnbw5wgQVh0QhmMpxMxCDJgDXMDPRcEixCKdP23k0eFG8gVIVx6SYNJDJNBsyW6hb1oyIXtvymFa7XpITmKeEL0P2Rx9sGLR8Xge5zKNjb8/itCCYIlO1qcDEyw0CZou+9l1kLboUagq1CKQNZ/7Ch2T3sfPHoaUEOFoQNLW4tJy8ajNi4BkEnLOpUh6764h2Loi2yQWNQ62pPZPLADoLxj2zPaeDkXqsDM7MkcN1/tRKY/gyrEnfJ6xkCwURvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgPwnIzCKNYLXM0zTkn+k00hbxdb3crq0R3ipAKdc/E=;
 b=MZMt8MQz0f2XZ8DMq3vHQ2DSfCZHF+jXnMcBkousFC2vA4nvGIe5Oui2HzOhJSEtBfapTnSydEn+EOlu6XbLekM7h0qYNLFr8eS5T/LlHbYy6PRmU7zB68oEjoweeHxLoGStCP6F9VCGIjwmj039TQUOImJZrjdmpKdNaa6pJrnyyPeHK0yapEy5Erz2tw2aak9P4LQLja2MPLdLBbFpyg+cVzlaYT/9qT2PJynoNffkjOWs0Kma3/5/zt5ubef3czmk3ZZWCdWqTOxMCHrXuJ0Yto60UJPBK9r45o3NRp1Jw4EYqhooDGKnXd1MWPslQv1GzmhzA8NHiywNITZAsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgPwnIzCKNYLXM0zTkn+k00hbxdb3crq0R3ipAKdc/E=;
 b=pth/uiXEN+LnNyOolikS3OpR8YrzJxdJWbP3j8Zo5630K36YelaWU0v/kMJETO1bD4FRBYvM4I1JFm5UTOaZAbdypT9cxGHIHLC/OHc9fyTCKUPMnp0253Gj8nodcomVtYbsBGz/Xao6EV9tD2qj8z5ytHOKpIe2VCoKFuF/rE8=
Received: from CH0PR04CA0018.namprd04.prod.outlook.com (2603:10b6:610:76::23)
 by DS0PR19MB7718.namprd19.prod.outlook.com (2603:10b6:8:fb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 17:13:58 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::7c) by CH0PR04CA0018.outlook.office365.com
 (2603:10b6:610:76::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.10 via Frontend Transport; Fri,
 30 Oct 2026 17:13:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Fri, 30 Oct 2026 17:13:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5C7CA406544;
	Fri, 30 Oct 2026 17:13:56 +0000 (UTC)
Received: from LONNCK4V044 (LONNCK4V044.ad.cirrus.com [198.61.68.159])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2DB76822561;
	Fri, 30 Oct 2026 17:13:56 +0000 (UTC)
From: "Stefan Binding \(Opensource\)" <sbinding@opensource.cirrus.com>
To: "'Mads'" <mhbn@proton.me>, "'David Rhodes'" <david.rhodes@cirrus.com>,
        "'Richard Fitzgerald'" <rf@opensource.cirrus.com>
Cc: "'Takashi Iwai'" <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <dD5GFAprPRxWfPbbbrhD_wor9MMiT3a4ONaybCd3jr7tBR5xKw2oIcpfDhFtSiXUOsmHcUUUH_UNMBMvm57yTY1MMHqjriZRLAP4XvHrdmY=@proton.me>
In-Reply-To: <dD5GFAprPRxWfPbbbrhD_wor9MMiT3a4ONaybCd3jr7tBR5xKw2oIcpfDhFtSiXUOsmHcUUUH_UNMBMvm57yTY1MMHqjriZRLAP4XvHrdmY=@proton.me>
Subject: RE: [BUG] ALSA: hda: cs35l41: stale cs_dsp.name after component unbind breaks firmware load
Date: Fri, 30 Oct 2026 17:13:55 -0000
Message-ID: <009c01dd6892$0bc18a10$23449e30$@opensource.cirrus.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJ3sUJWekDDOe1bhvvnYiK12y5SwbXhwNtw
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|DS0PR19MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 655da1be-9fc8-4076-6689-08df36a92f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|23010399003|82310400026|261026121527099003|11063799006|56012099006|261021121427099003|261022105027099003|261009223027099003|261022075727099003|10067099003|18002099003|22082099003|16102099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	b6jWf1LGqpp8psXbiMLgo+PkjaOOutaqrDbMi2Nz7CPrLDVEHC0GWkDL1H2Oszcpj97+jvKu7UjnqDdf9CKMWlG8emSAGiZAj6eOcLVBtVXiND0wXZt0KdRmDSDOAIk/54mK4iXGm0MRCN15h/tJrWLFCR6+VwyvP8if0eyE8P062PBX5zW/RF0XIJQhsNJvTuZf7WaIfFPGWSNUzhgzZ6p7jwom+n2xdRn0n/iS9l14a7sZ02X2X70gQPg75L380g5Xhi3WxSHhteBT5i30MRhzOVEHkjg6aEllUv5tLMmTZJsaQF/zyGaE9gfmZukX1yNHMhHUxQrOCL1e39rpvIpYq+s+cttbxgOOcP7izGbdPa19R6f9dPXjYSj15Ula7Pf4jY2Qi3lLkmOQdyHMiaIuhp76Xk4zVwqbeQVpNVc32mZo/4DCYTzo2thF/mXfUl1LnCEuVFiLbJvgrRMYCC6RmOCRjJ1/rg7usVtSMj4EDFSRi5I7yZ3Por/hVK7XXnCEg/oOrkl0vuRazcWZwOQiujESu0d6QbkbYzfmnmj8niDXrIPpn7jiQNo/6l0Wr6q5Yy2/gmk1BSwrAtuFZUmnt/GvjpRMJSVTwM0CtJ5h4e1iK2qoaFtcv6ByTF0y9lZOdBIKeI4684neAaC/dT3Opn3OJxvudOscdKkiDE3y/IWeablhlqPwcubGfk2OxE6vwZ6OuZjgM8gzenyDVQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(23010399003)(82310400026)(261026121527099003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(16102099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6aUN8TehuF59x+42dZAUwh3XxsYPNllCJGvvXkl9ZOo2I+Cp+sI9enrY0N8nPGpGmBZ020w2j09sHGjF3zwh++r+pJF5iphEKQcgDiHu1cEwQIqoTwpIlZ3EcXbdpuUJtZ86knFMXwCYynzXbyp95gQmJ8WyF6g15c2Quul8kk6O4Hu4Cq1JERcFlm3NU3hS+9FIGW7ujCVwOvRquW4S3DD25V52HIjpfNPJHV1IOHixjr4fzGgSQpRBvK6FdfzTHoZYiPfZH20383HkFR0heA7zdoHaBuDZD80kFGtvuiiBMx/H8bJ87F0HhPmb9FaI9aEvCMztBh23dWMYduLXb9BP7lmZEEMY61YjkIRFfpgHLKHGmvSntSqb4bFfJ3c6ECmBrAtn1LAnwO6C5vFwB8vz9z3z+12vlRWqaGH0ZZBWTdveX/K/dFXni8gdmuvw
X-Exchange-RoutingPolicyChecked:
	BGYQwDf7mB/BsZQRxCLoRoHMAQQx+zAQ2YuBER8yzhctcR7iLz4rWJnACm908WVwAlDF5MOnGUqt0u/Tn5KoT5P7GUAjg9aLTeYV1iUrPaBsRESr23i2t9xEWQUKDdOfP9+x46jZfv8DJ0qxOyzBRiRvh1TODaQMKVMtWEqVEBTuW1V5q18ZB6BxXX1vaUinWKIRDqfnLTRUqIg/WOQplAh7Of4IqVFjtEPC74niahe0R7GQpgQ9zxsYHOsozyDutpQyuNis4otZALRi9T3C5Ciid65EUncBP884KNgn6nBQz65I5dvaLQ/6UD97y9PwNyd+yRif4ffQxQSeZb2/KA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:13:57.3673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 655da1be-9fc8-4076-6689-08df36a92f02
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7718
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX093JBHcqtYKF
 pX3lXJkgUpRtkldzw8xE5YdWwrD4S0kSQytctWG2ecJy+OgKIOkW3VWuK4EFOQT+t9VhIlCC1oS
 p3l+YjewsVkkvlMmRBrt+BbAiaCTgPo=
X-Authority-Analysis: v=2.4 cv=PdhqFShd c=1 sm=1 tr=0 ts=6ae4d05d cx=c_pps
 a=/amG0fyRPKkAi6MGe1IgeA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=OUIRPXp8w93U7_vnzoAA:9
 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: DGCaWsbLCiEizt2sq8n8wKGMYqxDpcka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX4/rr4UtqUDyU
 49OO5iIlx6fm0nQCGRSaI6Dg6Kn/Y3o0pZQsOvZzLv2+xVpiKWBIUMsyC7JuvbsyDplMALn7aoY
 YukZWNgmvBYMcFXd1qCjKbDS5FKSErGax9tzKP16RXqD307Ei8F6CfJQiThjx5ttWKxR7HRbWDN
 yrHKAvhapgOvx96bO58s9vyHzl5slFPJIZ15cFjli3kHZWAwEzEZIcpY6ZDpCpjSRFECv/vzqH0
 WHXWvmvNQpiVyDYt2wRRc0+o+ctIQD+IUpuLyUWV1W59IZJfy9wa3hUkuZ+r4f3noLHzZKaobWC
 ejIbJ5WkvUoOrI1Q3oHAs4mijQF0drt6Uxe4rK64J8LF4PkP+r0TdVQ8uFj1v0lwnLFUPAJwWDw
 IQk7ckJ/1T3NtUdL2AYakq5s82QN9ebnkaLTQfRbDeQnnpXauBRx3LExAyT9Cij6Meh+7bDEWKN
 dF9UzkelcYfAzDdUgVw==
X-Proofpoint-GUID: DGCaWsbLCiEizt2sq8n8wKGMYqxDpcka
X-Proofpoint-Spam-Reason: safe

Hi,

I have not been able to reproduce this on mainline kernel v7.3.
The Omarchy kernel seems to be based on, but not identical to the =
mainline kernel.
Are you able to reproduce this on a mainline kernel?

Thanks,
Stefan

> -----Original Message-----
> From: Mads <mhbn@proton.me>
> Sent: Thursday, October 29, 2026 8:46 AM
> To: David Rhodes <david.rhodes@cirrus.com>; Richard Fitzgerald
> <rf@opensource.cirrus.com>
> Cc: Takashi Iwai <tiwai@suse.com>; linux-sound@vger.kernel.org;
> patches@opensource.cirrus.com
> Subject: [BUG] ALSA: hda: cs35l41: stale cs_dsp.name after component
> unbind breaks firmware load
>=20
> Hi,
>=20
> Same machine and kernel as my report "amp dead until reboot after one =
failed
> system resume (shared reset)": HP Spectre x360 14-eu0xxx, SSID =
103C8C15,
> 2x CS35L41 on I2C, kernel 7.2.5 (Omarchy distro kernel). The code =
below is
> unchanged in mainline as of 75c1cb8178fe.
>=20
> To recover the stuck right amp without a reboot, I unbound and rebound =
only
> .1:
>=20
>   echo i2c-CSC3551:00-cs35l41-hda.1 > /sys/bus/i2c/drivers/cs35l41-
> hda/unbind
>   echo i2c-CSC3551:00-cs35l41-hda.1 > /sys/bus/i2c/drivers/cs35l41-
> hda/bind
>=20
> .1 came back fine after a fresh probe. But .0, which was only unbound =
and
> rebound as a component, could no longer load firmware:
>=20
>   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Falling back to default
> firmware.
>   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Unable to find firmware =
and
> tuning
>   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cannot Initialize =
Firmware.
> Error: -2
>   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cannot Run Firmware,
> reverting to dsp bypass...
>   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SSID:
> 103C8C15, BST: 0, VSPK: 0, CH: L, FW EN: 0, SPKID: 0
>=20
> The files exist, and .1 loaded the same .wmfw a moment later. Toggling
> "L0 DSP1 Firmware Load" off and on gave the same -2. Only a reboot =
fixed it.
>=20
> >From reading the code, I think it goes like this. With
> firmware_autostart, the first cs35l41_hda_bind() calls
> cs35l41_smart_amp() -> cs35l41_init_dsp() -> cs_dsp_halo_init(), and
> cs_dsp_create_name() allocates dsp->name with devm_kasprintf(dsp->dev,
> ...). Because that happens inside component_bind(), the allocation =
lands in
> the component's devres group, and component_unbind() releases that =
group.
> cs35l41_hda_unbind() does not reset halo_initialized; only
> cs35l41_remove_dsp() does, and that runs from remove. So the next bind
> skips cs_dsp_halo_init() and builds the firmware file names from the =
freed
> dsp->name, which is a use-after-free. The freed name also shows in =
.1's own
> messages during its unbind ("DSP1:" becomes empty):
>=20
>   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: : Failed to read SCRATCH0: =
-16
>=20
> I have not confirmed this with KASAN. Possible fixes: tear the DSP =
down in
> cs35l41_hda_unbind() (cs35l41_remove_dsp(), or at least clear
> halo_initialized and dsp->name), or keep the name allocation out of =
the bind
> devres group.
>=20
> I'm happy to test patches.
>=20
> Thanks,
> Mads

