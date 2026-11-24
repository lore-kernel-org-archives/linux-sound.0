Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530256;
	b=HJkJwxrSerrKxsSdUt7I6IFaDCJZDLg7zYQ6X9glIVAwT6AyaUvH0hKwUFYwJPGgXmju
	 1RGgoWcFuQFoW8GjtVF2kSAKVB4rkOYgJZJCkIBVnxqKEqDMr41ZynEKOk03iXlkZqJqI
	 j7ND1p2orHJfQK4/8QnfqDIlqGzH4E7aEjvkfHwxoOZiFic1Xj9hydhUR0EnA6263LZbL
	 4pZl4oP0rAZVgdE9tV0xROh1FdQrUWhE4P/f+TKxgokj8olb3N8xxC9Up9QIMxSzqPqmV
	 eeb4tanid3LJt848CV03hHdxaSpmKJhYaFjFDjJbH7ljk8kEi9ZLHevMVThNwT/NOIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530256;
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
	bh=mjvHWo/H9ahnje1cDcjOr4CMiaWGIkdF6PUVVWKrd5o=;
	b=l5ZPYZ68uSN8cDQrxNURRKk4PU016ZlTvUWEjhAM4JkEm2uPG3KUz0B5T7DKRa+QJ94j
	 rKg9GrWntOP7oWUX5HTcCptwp8Dt6ZeRQpozUmTdjONxCfnLoejblvEJe+WzsMxFd0rR8
	 JIAzVZ7XDlpgkUU7epT3qvkrdcpxACpJ61Fgx0oeAQo9xHwevEw4TUtqPhEJV/MRSgr0G
	 vCAqDQPCPft1/s3uZEEf71keWisK55ZvncKHwb7LWWPUYMsO4TeSI3fzoPCBC+SUuKr2J
	 mvpfzIgwzyJOCfPdwi3AmY81ZLE25OplVFGCnfKlnIozk/CD7d1kDd8dFGKNcPUpfzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GMrK0okT;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ubbsaUIR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0CE606A32A;
	Tue, 24 Nov 2026 14:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E0CE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GMrK0okT;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ubbsaUIR
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOCLh3O3664576;
	Tue, 24 Nov 2026 08:23:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=mjvHWo/H9ahnje1cDc
	jOr4CMiaWGIkdF6PUVVWKrd5o=; b=GMrK0okTkNSAkGkvwTWJ7FR6H6Bx9yOXIi
	+XUdmnxm8Yk/V1EL1pibSrSnWa/RkaUl/DRJdx+I2fY+BZtjuaG1icm/c9DCsQsK
	uz/b+POefRg4zF8atdyWZog3sDvK3ArRlOQhkp2vR2879L2F9VCkYJfH/gWCX8Te
	xopytTXtMVx4JnncBkUZGYKW0SG1p2nThEET6MqliRBpbC6IN6V2itp8ExQbiexw
	TZXazt6i3Q1tWLLwZ0HRDzRwmsQOwZpf2rxxNBEqOzF88+VbWm+xHb/x/PLZmOaO
	rY2LRmSAhfgNDFD+S8JD6f5tsFmBgb6ACXG52ha2e5fJiqBqNb7Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022099.outbound.protection.outlook.com [40.93.195.99])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j51880ru7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 08:23:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7fErHdAhGDM3A3EUvCJCz2EcsZZRd/ZcyxpkHP6jXprfkEMEGiBa9yInIcmIbXtKfD8GouoICr8XS2DuIhDOQ171VQcRo8lf7ZRgCFDmNKfWd2p/E60peTrdjnt9gInne36TVvpcZPtRg+uHWIQux77KXO5BE/akt4OBbblIFSuMK454g9cD8n16xtF0wpHwQaGmD6gG2bjDj8yHsqZzmcvjzqDWC3aAkNZhr0wWFzjBGOGh6Mro1bbUlfdgb40QGGGtQa+BwHdt8ctTeeVe+2WFkSvCFtYcV+INsryP8u1/zy1thAQGVIxKqXJ9QLDSJ2vMBTCvLyV6ka0fmbEJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjvHWo/H9ahnje1cDcjOr4CMiaWGIkdF6PUVVWKrd5o=;
 b=LSQ1pTOYHWJwwQOMHvqWCKL1JZk0JjI5N+TKE6jk4+x5xoV9YRbnuWK9/GBbGHdzBKqwU5OWT9YRz2S53an9FF29KM8ihHJeJWaHGO5Yn2j8qE0ZLvC7sES0MsPdJumhEbDFafFFzs1CIMsQwsdtyZQqGyIR1ThbGATltU2YvWgOady4VqEQ88oNdIDo1A40xTmKtfjO4CrYM6VaR/QdFwTAFzRp4XvBc3iuZOc/x51tLGm9M2LW0bFvpynT3UMo6bBRdEzZnQvgkI1McnfbdjwZ1WuERnDEIj/WAOhfryBLEovufnCeUsUais5CJ3gGmqEX9eMt8z6WKUga2xhWfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjvHWo/H9ahnje1cDcjOr4CMiaWGIkdF6PUVVWKrd5o=;
 b=ubbsaUIRRIqy9X/klPmz1bW8m6YdqnDCv+M8vEcQtEShndB+gnALvfxTynNAtnPWUayxgePN4Ay8O7TvjTK7BlgywJx3JOKaaXeyRhN/H8MmHDULJgjmQUCVHpVlROuGCipDR80s/dlOoMz8Gxg5ysy7qZ+b2fFLfqmnjnFyODE=
Received: from DM6PR03CA0089.namprd03.prod.outlook.com (2603:10b6:5:333::22)
 by IA0PPF095EED90A.namprd19.prod.outlook.com (2603:10b6:20f:fc04::c87) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 14:23:49 +0000
Received: from CY5PEPF00000E79.namprd02.prod.outlook.com
 (2603:10b6:5:333:cafe::4e) by DM6PR03CA0089.outlook.office365.com
 (2603:10b6:5:333::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 14:23:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY5PEPF00000E79.mail.protection.outlook.com (10.167.247.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 14:23:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EB867406540;
	Tue, 24 Nov 2026 14:23:46 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C7D3E822542;
	Tue, 24 Nov 2026 14:23:46 +0000 (UTC)
Date: Tue, 24 Nov 2026 14:23:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v2 2/4] ASoC: arizona: always parse device properties
 regardless of platform data
Message-ID: <awWd8d9Wt3oY0gFf@opensource.cirrus.com>
References: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
 <20261123-arizona-asoc-v2-2-6323d3c0961a@gmail.com>
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
In-Reply-To: <20261123-arizona-asoc-v2-2-6323d3c0961a@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E79:EE_|IA0PPF095EED90A:EE_
X-MS-Office365-Filtering-Correlation-Id: 8595d3af-9ccf-4210-dd71-08df4a368e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|23010399003|36860700016|82310400026|261028144727099003|10067099003|4143699003|11063799006|56012099006|261021121427099003|261022105027099003|261022075727099003|261026140227099003|261102123227099003|18002099003|22082099003|16102099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	MI2tMpz7hz5U8XIEnGfv+Hxlf+CA7mgelTK08P/xe9rY0tzMn60sDIWgLqao1FqOqo3X+2BVEaHMPTWOpraeY6n1S6KcqXZn4AngUQ49eS32u+fvDkRulJVxjCfZPi0jtjVXWnxDk2EfxpqxVrMjhaQl5Ii/vg1N6NCa/TMNF+HQa8drnqyU2B3+COWjgGfLwC/MHeVxRQs9SfsyrWft7TG4CBIOASWKnK9NKEV1vzBysZ4quuX7pcJhgM73kDJQFuMwya1sqpM3ei98FrP4doGrASOSIyGR19maiWguHl1aEMEDh/R66nifu08SZmObTCDDrPxkjHJfRPTQUV1qVx3NptLwRW2F/4TDRx+4oQQ0pmDorBl4k6Y6hLX78R4qArDl23d55egELBk9Ze4Xh4RJ30fLqMQo4UQRJyRH5oG6vavx4SWRPKBXT6RDGtFgELTl2HSPm+t25Mk+eIr2+npIQ8lKLylvTfuuw/v/HM7M+vzbRKJTXAbh9Zl0Uh+m0u01O6tOj25vDvR6DWTb1qQg5LiVwlvnLH4mYeNqKdV0TVrgE3dDDuOkYZA3nVGOsE/1R+UEvubkvjk5mbvH8VGbQBIVcFnPM36kZE3/UJ6OfxXCQOkuA0XG9LrY8mLyLItAlv86xoWdLTbhFEYDi11X3NH4/pF8s3L1DRrmbo5zyWaoiAiFnr14KArdaDlms8IHsOSFx/EMjBY5bmaFKQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(23010399003)(36860700016)(82310400026)(261028144727099003)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(16102099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g2uiagaZTkIzAvRrfx6bkMKAn7BM+XNtK+VPm3jkWafsJtYncBKDo744B9JOB5l4JfdgLbn+ZLEo3iKPtC3K4tv1WKu6j4StiLwo3tPjjIKQBzgL5KpSU4P3YOjQw5xljb6GxwfpjiNCen4TKtMpdVpCOpnOIGlmc5RtqZuZ1SvPNrQ4U75E9xrnJiLFan/zF7ZCXUHrK7ZoGJR/0XHh3U/Z4xXrDL03wuxZUQ5OyLmGOdQ+f4rgartpszUnTFFCf75Sr0T9MXrXcQnXW5N7j95zeAIOMw3Mx4JhTOnNXYl+EBgqYjNl7oVqTPj3jvxnUi7zFELF/4XhObrJjC3Qx0w94cx5yqNL7pt92rWWoBkfrPk+cEt8Zfldgmo7dBk51pnKp0WqZn+szq4ZI6vZ+7QWWdXUDl4IgFOek6RAnRd0fBkqMZ7Ied1NzSXVbskg
X-Exchange-RoutingPolicyChecked:
	Kt//9PCW8K6CNRM2XCqzs6sM/JLswLy30D11zmxm5rMubkAU1dv6gZxiQXLPTHWTjcwKp+2wY8WpPuEHh3Py1ZHR1LoDaYqN39nPuxjxiFYyuswWjTsL7XVVxuApBYXcInbB9lWix6CGzW4r5wKuYkAL6p2MyE5Ce8SgDurOg/V2aat+0t3kwN9BhnocuMuS5IPIzwW3mZq/4w7HmZqr2cfnbugumPgyMQyoD+x9yGbViEu5zHLyJfZH7rpobSl3eb373J0hbOLdwCG+aZxy6MJ+kCuWHNQZRcbseUhkYN5zB5pF1UhYTi/ZcgyE/WuEwqpcvfCH43tPF0tn3+c5Bg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:23:48.1174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8595d3af-9ccf-4210-dd71-08df4a368e2e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY5PEPF00000E79.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF095EED90A
X-Proofpoint-ORIG-GUID: hcKxQsmYAull0eXJOc6_wmo7F9mbu2eB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXzy+EqCEtfmFs
 7JNvVa2OU1Aq+XwfzCulCrH+xUaHkZykGlVdh6I0338bmgRTWT11Axka2uMKeRxyQ6poYO9v+Y0
 PbaHLJsRYILoUx4lNWUQb6e/VNkFlkVX94o3rloQD+9sk0kZ5d76JED+V/z69ArT2m6JIP0pQP0
 BmsptJz/bS+prl78rEpbZGc0Qll9sqb4rGI2sGYcKMslRyNPz7x0k51blVKrnTCSlEaVIJtydt3
 /VPSrk6JaolFbYoG0RIk3YVCJJzCIontbKrHcsjGbdZsS5KUqISCHOAeIfmiDHEloS1w6S5B0Cl
 V2no58MEz/7OD3IbBtukwdXJL64qPcG8pH/FcI1DaR9hBsDcpGXbTC4lB8ViHAwXMsfSzgOsgdt
 /8ZCm9Dr7Mf3Vi2dUJOqKaBlE1aBUgV85ORExK/M3DfRKFpQqofMAwXJi3fXja8frSZZLzrVavp
 aiajuvyTijvn6166jfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX0aYhpnCiCQH3
 etOMW08NSw3yHrM5Eat0PYhNilnKTRgyKv/jKdQLwMJP5eJSB1pBiex05df/jCQOhBQW3oAxztY
 UQwhpLSEyyxIUqPw2Zljijy4lgGGYJU=
X-Proofpoint-GUID: hcKxQsmYAull0eXJOc6_wmo7F9mbu2eB
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b059dfa cx=c_pps
 a=QfAu5cRUQmedtNjS8psswA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=H73CAQ-HUjEVJ9nzZRIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Mon, Nov 23, 2026 at 03:00:55PM -0800, Dmitry Torokhov wrote:
> Always parse device properties in the Arizona jack detection driver and
> codec drivers even when platform data is provided, allowing DT, ACPI,
> or software node properties to augment platform data configurations.
> 
> In the jack detection driver, only validate and apply the
> wlf,hpdet-channel property when it is present, leaving any existing
> platform data value untouched when the property is absent or invalid,
> and preserve existing boolean flags using bitwise OR assignments.
> 
> Default an unset headphone detection channel (0, corresponding to
> ARIZONA_ACCDET_MODE_MIC and invalid for headphone impedance polling) to
> ARIZONA_ACCDET_MODE_HPL during jack probe.
> Commit 9e86b2ad4c11 ("extcon: arizona: Add support for select
> accessory detect mode when headphone detection") originally placed this
> default only in the OF property parser, inadvertently leaving
> platform-data boards that omit the channel setting at 0.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
