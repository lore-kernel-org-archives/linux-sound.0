Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191132;
	b=pZvMEH0uJsAnonOeUUq5Rp3S5UNd9uXkzriJpW/82gqBaa9aUodLyvq6nGBUVGNbfJ5L
	 uOx2kBdzGqkNfGgzb63uWiPxyEoZMP5ep2Hp3SA7ADpGddSEnLDpm5nafyDhdkLOwJOi7
	 mrwrIu3ylQArwSVvCb5DxLqlpZUGHNBFFV2ssHUpBezGbidgnvd0D33crILPA5q7CCK+H
	 OYF6NKMF4TOkH9wZLStZKkyYMGOEz0DKwtS8nrnsUibd0bHuBeiovFuBIKD3Yqek809b9
	 FxEK8Jo5nAX035SzOJTVODumRMYwjXuq0oAFRinnDm7tGDPYi3HXs42+R8Y4/mNrfUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=J3tRc0SRTdodV4db8vQrAeW3sAHukzTP4UY6ZJquXuQ=;
	b=J6opkJaQDqUOJDTNDgpKTT5HC926wbMZ/PtbYv5rpvWNfJwjIsDyRdjF7lCfDc/6TQ6G
	 WczrZXdsqthnUDGexZIakArqJT4B12MrUVo8SVoU6rlgWRb3RluGZB4hOxnGvyfsYybRG
	 GBQAzjguS7eOKnDvezoZwUgzXsjAeoNy7PZ6qqwVAsnSyKURgrodNOASzf/gsfVxCc3Ig
	 nYHHVxXO9b7qgUJgpCaWza3aKnBM6/P+z3+Iq8TIQjLOxIIT8py5kVNFqPZ6rRw6DYL97
	 8NoKBAE8hXLYVWZyaxRAao7HWvdzNcn8pomJ0B0/UW4ptVf/V29/8l6ay0Y1qJ8ekCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=HdyVJ5cF;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=LXIcvkRg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42307606A32C;
	Fri, 20 Nov 2026 16:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42307606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=HdyVJ5cF;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=LXIcvkRg
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKFll7D918391;
	Fri, 20 Nov 2026 10:11:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=J3tRc0SRTdodV4db8vQrAeW3sAHukzTP4UY6ZJquXuQ=; b=
	HdyVJ5cF6T+mve5eGws1poGIw4213AShKh7wMGAos4du9pBv+kCbrpKwUA6M49rJ
	XLWU05qQ6WbRzVuVnZSTN9bi6whtIDUGwAiap16PnDwkZwiICPbk3LF67mFW2FX0
	lSAC440Acxaj8slC6g4Pxe53h5pF56EKcxMp1S9Yo6blesGJ4+L2T4Tc0JPrBY0f
	jHmI9/uhoA26vookcOh4m2xgS40rHxmVMaUPxVz1AOnLBc4AVH4xRd2NvkqIEgLN
	NWl2+H6XZbtg12SvlN4S4oLPy7cJ1ppGnLD4UMvfZElsaE/XyPXbhV4fvicQWb7W
	YUni+iNomPLOPngPuYfeqg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020122.outbound.protection.outlook.com [52.101.85.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j242mjb3k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 10:11:53 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFTIQffnHhSRGYjuLUf4XB9lb4KVPx2ICF2ncf/zmtY4anTvnG09jwzP4rshtDwv9MKbjjwM1NEqg5NIHx8dtAqg+cmpdhW2L+TaSIZ3N5tEPmDwttoCn19deQYgVUxzjl17VDzL3cJ+P4wEDnDLX+DK1RW5SPDX1eSZhCfhQuzbXtEnsmFzO0k+0rTR9Pf7QQBvJSguf/i7z50Dof428RxpqxUN8LRPozR5Th6H5AraEZNxIwtWoD0xNQR+vATyLwulaJxcHNILb4w4rJ+lA+H40wIES8NZTa70KKf320zwndhUU48OMSpjTBOrcY7K3K0XKx2EPmCWr5YD0dG76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3tRc0SRTdodV4db8vQrAeW3sAHukzTP4UY6ZJquXuQ=;
 b=dvGL3y+UCKYxkFd5jdRaHFIlqggrEBqi7Gtf6/Q3sZoo4yaDGtsoI3Nin3S/43Mbb/ebg5bb1jHu39xDJz90rSBTlEaBip8RooSiaNvNXoIONsmd9Ltt1n71p00YywU7u85WoKeIdS8J+66nkbNugl4H418psRg2xE4e1vAune5CEsLGyyxWzthDm6yXLkh5JL6l3r0OhYLHHGnvYwT0hVg3CS5WQFPNWYhPDAcc96zFsJ6QvKjo+jwRjl/dzGGqQBAybOJJ8s64LKx2qyhmNPeIE4MOgUEEc9r3XM+JUt7gnz/9yi/NT8xVxZoDzEN6wnEa8+NdOglc5U7qn2RWKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3tRc0SRTdodV4db8vQrAeW3sAHukzTP4UY6ZJquXuQ=;
 b=LXIcvkRgqol8VjCdozC4nm+n9biC0agPGHRopjrMiC0PryQ1Bj5rGr7CjfFWaf+2sZmdkoI3RgsUJsyImflTOAC8pM0tLeXerKwweOi9sFEVHH3o0kd6tS78QmcGZIDXBih1QZiczowMjcG3hMJBBTQTqjaAG3ivG0PjO8qBP4E=
Received: from MW3PR05CA0023.namprd05.prod.outlook.com (2603:10b6:303:2b::28)
 by CY8PR19MB6987.namprd19.prod.outlook.com (2603:10b6:930:5c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 16:11:49 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:303:2b:cafe::57) by MW3PR05CA0023.outlook.office365.com
 (2603:10b6:303:2b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.2 via Frontend Transport; Fri, 20
 Nov 2026 16:11:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 16:11:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A6CD0406558;
	Fri, 20 Nov 2026 16:11:46 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 788DD822542;
	Fri, 20 Nov 2026 16:11:46 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 4/7] ALSA: hda/cs35l41: Split System Suspend/Resume callbacks
Date: Fri, 20 Nov 2026 16:10:50 +0000
Message-ID: <20261120161136.157593-5-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120161136.157593-1-sbinding@opensource.cirrus.com>
References: <20261120161136.157593-1-sbinding@opensource.cirrus.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|CY8PR19MB6987:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dc5feb9b-5fd5-42bc-7fe7-08df4720fae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|23010399003|36860700016|82310400026|261022105027099003|56012099006|261021121427099003|261102130727099003|261026121527099003|11063799006|10067099003|261021123027099003|261026140227099003|261022075727099003|261102123227099003|261028144727099003|22082099003|18002099003|6133799003|16102099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	h+L2pQQNHYO3sRfWO1pUmQIZEYbSNcVPKhPZ/Qz18RF7jTBUaTureJtNTvTPojnkPrKMqckhwfA7ClwbvWzfh485R4cwoEog8aDI65R8P0CcwUXfnkN6ZNYQys0hojxgKIYjN+ZKBM2K1iXULHefXMtuabniyTHzUj94wyveIrYQt7rsJrZIN8Ff11CUxD67pxvD/HxR2Hngnje0vsaA4LXVa4qvPFkuxzrpqI9BTqDqFz3Yfzz3Gdug2tVJJKB+iO8+01cFZm+ttfSdcPpdwHZMZAgzPgKGn512L9Zro4pk6bislEcIxPG6PeMQbCegRjD3DtSsmg7vkHnN5eAHsQoddEjQ3H0pXp8BpmkDZSrQyjAxATRf71h+YUalDkCa5veCURL8Qe12UfIoa55ybN94IZhgLS6dGM4dHsiTn9BJVgz4rGmTLIXb1KxVuITVPvtbJzbPLG2nNxr2Ph0hiypcO0NBe4Tmz0KZHeM2dcU0GybpEwQoof2Dl/FdppFx9SCdNZPwUhbt9tJZrq4sUwVJu2ZZR8VtuBdcUcdcD7Cj9aa8RAsgQ9NumDLR8EaeK2xNWyj34sDaqNE43hJe1/qfmrI+/vM9BlEOJbDewfoa/krbn60MAcflbqUWfUwTdn3o1fRizUTf0NWjsQ1C09DuTLmldLLGJ4Rpchiy7w90kSIde3M5vmP+EEb81tWbR1qhdKF/HpWZ9z5DAQbBzA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(61400799027)(23010399003)(36860700016)(82310400026)(261022105027099003)(56012099006)(261021121427099003)(261102130727099003)(261026121527099003)(11063799006)(10067099003)(261021123027099003)(261026140227099003)(261022075727099003)(261102123227099003)(261028144727099003)(22082099003)(18002099003)(6133799003)(16102099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nI1SPvTCrv/bkRyQ2qHB4Q3LEZPxnPtuzTDewcsHJnbK/0HaiWyMFk7VF/bSm3tVht8JJCMrR3VzTHrxQ//J2nopzUWbRa79ftaRWo+FfhrgcKXfK61X5fiIWvqpJH4KCCzZ5iwmX2tHld1RDNGNwtDB4xZwl32Z0myYDYalG9oFqBvcyiQUJoWgrhF8DgAjdh0zKzfprUrrDxZ5bMddAmomjkeeQNLLgNbpjS+2mcBbVgPiMNKK39oFZbqnlqXl3me8f9B9M/hL7xa/tHKtLCN5Mn6oJAWzacONkkW4jmAd/kE/kCPJnGM6vE7IfoDej3LxOSky2nHhSX2Y88vgFuSwnV937RBXVAB5v3Y9fDiaPgN1y8ypC/TuIEJlCqGfWzjvPcAZ2b97/VbBSoOaGp+EYYj6rVHCJLy9Runfbc4qbbY1kcLTBaT1pC7WZpxC
X-Exchange-RoutingPolicyChecked:
	FuHsJlFQa3lqCtLizWT8H8cAzvnVTrKV1vmBpYs29+CzLzDs9MFXwskSsNGEBUQMZuUAy7Mk9gUTGdtfMMbjgIui0C58sAdQ9xiZC5l3hzViJ+QMkvcIiNS6/Iw87iQpBOypnEI4Rh+Cg/3ogS1FHkWs1csuJpXcdsRZOg/lPRkDkP35biU78bePQNUga2NbXI+dw+gPzyW0lhG+hC2N47WUVx5Sd+LHkjzoknDY2j1o1DCMa/sPkbTFFshmvI+qosUKZPWu9uuXlIVcZrNhVm0fbbDB7XG+2QgNmPdCnGzDPGejoOpE9CFi6DiFoKpq89NrQClo7W9Pb4z1jKsTSg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:11:48.0858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5feb9b-5fd5-42bc-7fe7-08df4720fae9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB6987
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX9HZ657eRpNQf
 hfZsSFsXklCJFy0fW+J3Ld1rfXkYcR5KXl8wD8bVtv4JkW9IIMhSKh9/qyL5hepA8urMlx3v1Xn
 ZEdgSuKXx8wfDhFvDSK2B4CAFu9UcqyIhexsrCm8AmcUHEKh9G7aI0J/hBgFHwfF42qUyWDh30d
 eF09fI9cHURGSHgfrdfPEwVZmirtvCv0xpVSyGYBsLSo3G+Kczag4tdscIrCkLFigOy0hrduUwE
 QRTE5tuGFWYr6R9Rp6ejV0uI6+7ntSRxSvihBGrX859v+2A8DCwFUVOalkbrgsfsJD4KUTcHvLR
 7REU9qshYrZCA0bgRfUcC0K8vQ3ss1EgUBWmMRiBxleOq8YoWsudJHJ2k5oNiKmPleqfXZB8Pkb
 B/jLKFEd4YkOxt9dEPbEVQUzExWVlRB3ewDjdkJmF1ecU0qgHRPNbyPYgBObCv5ZEEF9QfeWitx
 LlRKg0mx6ZLTUAmmgSw==
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6b007149 cx=c_pps
 a=Qdo7Ea4lwGWRD8/XiwST5A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=4G-YAcXtrgmQQg5zniUA:9
X-Proofpoint-ORIG-GUID: rPjBojjJ7psj-s9TVBKNBuGuwhTdMJpj
X-Proofpoint-GUID: rPjBojjJ7psj-s9TVBKNBuGuwhTdMJpj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX7CUAdTulv1kB
 8QepSNCtGYmSNfvoDBX/wcMRir2KX3O0uE/jmxqhOx2HNhAHHWFw0VKPXaMirhEeop5CQJ4KqFB
 COO4OdfgOKt6vT8T1SjcFTYbnyTJLuE=
X-Proofpoint-Spam-Reason: safe

Currently, the CS35L41 driver does most of its system suspend and
resume functions inside single suspend and resume callbacks.

Ensure IRQs are correctly disabled and enabled at the right times
during the System Suspend and Resume process, to ensure we don't get
spurious interrupts which cause issues.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 91 ++++++++++++++++++----
 1 file changed, 78 insertions(+), 13 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index 2e2bf231d3fc..1a192749c7b0 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -942,10 +942,8 @@ static int cs35l41_system_suspend(struct device *dev)
 
 	dev_dbg(cs35l41->dev, "System Suspend\n");
 
-	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH) {
-		dev_err_once(cs35l41->dev, "System Suspend not supported\n");
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
 		return 0; /* don't block the whole system suspend */
-	}
 
 	scoped_guard(mutex, &cs35l41->fw_mutex) {
 		if (cs35l41->playback_started)
@@ -963,15 +961,75 @@ static int cs35l41_system_suspend(struct device *dev)
 	if (ret)
 		dev_err(dev, "System Suspend Failed, not ready for Reset: %d\n", ret);
 
+
+	/*
+	 * The interrupt line is normally shared, but after we start suspending
+	 * we can't check if our device is the source of an interrupt, and can't
+	 * clear it. Prevent this race by temporarily disabling the parent irq
+	 * until we reach _noirq.
+	 */
+	if (cs35l41->irq)
+		disable_irq(cs35l41->irq);
+
+	dev_dbg(cs35l41->dev, "System Suspended\n");
+
+	return ret;
+}
+
+static int cs35l41_system_suspend_late(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
+		return 0; /* don't block the whole system suspend */
+
+	/*
+	 * RESET is usually shared by all amps so it must not be asserted until
+	 * all driver instances have done their suspend() stage.
+	 */
 	if (cs35l41->reset_gpio) {
 		dev_info(cs35l41->dev, "Asserting Reset\n");
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 		usleep_range(2000, 2100);
 	}
 
-	dev_dbg(cs35l41->dev, "System Suspended\n");
+	return 0;
+}
 
-	return ret;
+static int cs35l41_system_suspend_noirq(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
+		return 0; /* don't block the whole system suspend */
+
+	/* Handlers are now disabled so the parent IRQ can safely be re-enabled. */
+	if (cs35l41->irq)
+		enable_irq(cs35l41->irq);
+
+	return 0;
+}
+
+static int cs35l41_system_resume_noirq(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH) {
+		dev_err_once(cs35l41->dev, "System Resume not supported\n");
+		return 0; /* don't block the whole system resume */
+	}
+
+	/*
+	 * WAKE interrupts unmask if the CS35L41 resets, which can cause
+	 * spurious interrupts, and the interrupt line is normally shared.
+	 * We can't check if our device is the source of an interrupt, and can't
+	 * clear it, until it has fully resumed. Prevent this race by temporarily
+	 * disabling the parent irq until we complete resume().
+	 */
+	if (cs35l41->irq)
+		disable_irq(cs35l41->irq);
+
+	return 0;
 }
 
 static int cs35l41_system_resume(struct device *dev)
@@ -981,28 +1039,32 @@ static int cs35l41_system_resume(struct device *dev)
 
 	dev_dbg(cs35l41->dev, "System Resume\n");
 
-	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH) {
-		dev_err_once(cs35l41->dev, "System Resume not supported\n");
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
 		return 0; /* don't block the whole system resume */
-	}
 
 	if (cs35l41->reset_gpio) {
+		dev_info(cs35l41->dev, "Deasserting Reset\n");
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 		usleep_range(2000, 2100);
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 1);
+		usleep_range(2000, 2100);
 	}
 
-	usleep_range(2000, 2100);
-
 	regcache_cache_only(cs35l41->regmap, false);
 
 	ret = cs35l41_reset_and_boot(cs35l41->dev, cs35l41->regmap);
-	if (ret)
-		return ret;
 
 	regcache_cache_only(cs35l41->regmap, true);
+	if (ret) {
+		dev_err(cs35l41->dev, "System Resume Failed: Boot Failed: %d\n", ret);
+		if (cs35l41->irq)
+			enable_irq(cs35l41->irq);
+		return ret;
+	}
 
 	ret = pm_runtime_force_resume(dev);
+	if (cs35l41->irq)
+		enable_irq(cs35l41->irq);
 	if (ret) {
 		dev_err(dev, "System Resume Failed: Unable to runtime resume: %d\n", ret);
 		return ret;
@@ -1015,7 +1077,7 @@ static int cs35l41_system_resume(struct device *dev)
 		schedule_work(&cs35l41->fw_load_work);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int cs35l41_runtime_idle(struct device *dev)
@@ -2083,6 +2145,9 @@ const struct dev_pm_ops cs35l41_hda_pm_ops = {
 		       cs35l41_runtime_idle)
 	.prepare = cs35l41_system_suspend_prep,
 	SYSTEM_SLEEP_PM_OPS(cs35l41_system_suspend, cs35l41_system_resume)
+	LATE_SYSTEM_SLEEP_PM_OPS(cs35l41_system_suspend_late, NULL)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs35l41_system_suspend_noirq,
+				  cs35l41_system_resume_noirq)
 };
 EXPORT_SYMBOL_NS_GPL(cs35l41_hda_pm_ops, "SND_HDA_SCODEC_CS35L41");
 
-- 
2.43.0

