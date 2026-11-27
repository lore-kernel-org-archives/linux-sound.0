Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797834;
	b=MPH6Wey/9vjdsgeYouNwb/8ZUCHKB4P07RNyKmlZ9MtRLYEEppZNgrvJCPBJ72XDq1Bc
	 E+Wc+k/KYj9otDwyTlxesLzSLjbnavrGDbnS7BJWx6KTRxhHJHnfVEllb91lVHa0rd7wf
	 tY3PY06GopPRh/enhFtszRgTIanUuKxYgxUmfZSIXD3HpKW/C5pNzb1AnqdMmWecZdTaS
	 cqVDDl5/rd6tp7MrFZ3VcxvTCIOOgLLqloXVUGpFSeGNAMeKQBBjIMxOwvwS3gvehtcZs
	 AkDV47CXJi/lVEyqmS9rTsGXgJ7c87s+ygc4eXjXmoB2pzkMccJMxckALA4YDe4oVBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797834;
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
	bh=xSMiWe57xdGSw5+ZB7y9MgXvvULZk89bQyzNccwlxHQ=;
	b=uEHS+cfMVtqtymu1VRgoNnZDqYr6r9qY5O40WLxNPipTZe42OzySe9pDLQw0276jEnI/
	 D+brQcWtQaxGcCidsTSc4MkyhGdou+3LBZAeMd213mtgsNmrj1i6mcrTpARQEkI+87L8x
	 qngm4cQr8RCWk0suXa3BZggrHArdb56rAQ9o12nMCom3zIIJdflSg8cEUxaRjmhllA/rc
	 ka/BxL8dJdmGpQolKGoeEf8Yg9SPOPOgBcsJI1PGchz3th+c6DPctdmVlP2tvJUDb9MDf
	 oBG1ky8FTUU74AqMpkXtmcN3OGZ+c7MzPz/M0rGTngsx6n/Njp8cPV8KlAlC3yrrfTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=fZFQKDYf;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=mP5ZLvIm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21787606A31C;
	Fri, 27 Nov 2026 16:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21787606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=fZFQKDYf;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=mP5ZLvIm
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFrTmd2640002;
	Fri, 27 Nov 2026 10:43:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=xSMiWe57xdGSw5+ZB7
	y9MgXvvULZk89bQyzNccwlxHQ=; b=fZFQKDYfDo4977q1VTn5KXxku0FMHoedTo
	K/hXrjVyEqdtgEJoSkwClQnIW6kW4kTxeEwl3IgPdiJZQjoEPsFYaLXT207LbpGK
	1xXNybwxX0K/NIla67KVU7DWzRtYZbNJbNgkkSDwXW/7wYSNp77C2AYhX38jUP4K
	+wUzMlZXPWYZhEDJ6NH0EKu7AJ3zamqmZj6SLU0FS0nIVo66jILjPpygDe8Iaf2B
	0AyKfuDHAmTpQH1f3Hx/53NlKOBWojCFYrqKRAUFPWAkO7OMWY4nCLhjdMDWU1O8
	XwcFC7zNomg4kKLXJSYefO9TrLmsxcTBVQXlHx9PaFUJLP8FTe6w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022130.outbound.protection.outlook.com [52.101.43.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j51885m14-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 10:43:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2rCn9vJcaGIZLy7U4tQthyKe2Zdafv+yi75m+rJHiXOh0betNmJp5GEfg+ssuYnoALHK+0CarYeahw5lijTLJ3YqGayQE6r6qEhBZNf9QFwR+0rhyY2NTWArhfKK3eccQ+FIczeRMKboiIa+tIbGlreyZBr+2l+UUqMe6vM5x9LqGfUxzkuwdSqxhY1SUcGPrIL9krwwab9IGNvKQEbdcewerWU9BBE9IEpPKwPSoYsKcApM9fCAN9fqNWUwq7IiLWwBKl/9WDIuC3FLtEev42Lo+KBbmbkQtQB20ytzomGys1GGwU1YvhCQgspb1hGHlREOaBRKyvL6qHVhuHtEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSMiWe57xdGSw5+ZB7y9MgXvvULZk89bQyzNccwlxHQ=;
 b=x0mVWp6ifbhS9wg4pXzu7gfK457KZWYP0DikaRNVMW5FCixjmwiWTut7BEmECNYIPaQZzxLgFHfvkBB+Ixw8RE7Fty2Pwsuwsx5X88YTl5bha+7twhbIbvaIVJiUvrHy3+M1YNnMnghYbLim4KD1BWhlgW8wW/aYYXee2apcI+d9DiNO5bEvN1gCVmL8taPxdlrjw1l/NCoWhSqNvSRtNdnkbQNuWin/ZWsg9V47Limlgey633WJDnZFol/k2sgD3PhNOlP6uDqPnIIUbFjcY2FP+CBMdDE6/uCQaz/jPz7l3c7I6SV03UailVWYCwZacFhsUcYGPeVc81bePBgSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSMiWe57xdGSw5+ZB7y9MgXvvULZk89bQyzNccwlxHQ=;
 b=mP5ZLvImVLL+vmf01vIVMlB/XaX7s9Lolo8drYU2RoByQiFpmUDYf0ZTOi26uCZgOhbtHpv6n+NIBddooaR2Yc8bTaBAcrD8qaXvdUUl4pz70urIN+BJGP42ExWgHCp/mfstuBHdlMY7VfSVsntGEcSDPJRjpNjufTeoDshtzms=
Received: from BN1PR14CA0021.namprd14.prod.outlook.com (2603:10b6:408:e3::26)
 by DM4PR19MB5906.namprd19.prod.outlook.com (2603:10b6:8:69::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 16:43:27 +0000
Received: from BN2PEPF0000A804.namprd02.prod.outlook.com
 (2603:10b6:408:e3:cafe::8e) by BN1PR14CA0021.outlook.office365.com
 (2603:10b6:408:e3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.10 via Frontend Transport; Fri,
 27 Nov 2026 16:43:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A804.mail.protection.outlook.com (10.167.245.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Fri, 27 Nov 2026 16:43:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5418A406550;
	Fri, 27 Nov 2026 16:43:24 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 449BA822540;
	Fri, 27 Nov 2026 16:43:24 +0000 (UTC)
Date: Fri, 27 Nov 2026 16:43:23 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: (subset) [PATCH v3 2/2] mfd: cs42l43: Move to core detach helper
Message-ID: <awmzK+KuE84o7IPJ@opensource.cirrus.com>
References: <20261116110913.3555209-3-ckeepax@opensource.cirrus.com>
 <179569809495.72708.5920909967925778004.b4-ty@b4>
 <awhFxHHaapoYL3FM@opensource.cirrus.com>
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
In-Reply-To: <awhFxHHaapoYL3FM@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A804:EE_|DM4PR19MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff98d89-1ed2-4e76-0ba0-08df4ca58eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|61400799027|82310400026|376014|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|16102099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	BZUrWr2N5+hdwe5XBqUqUYN7eLDxecOUJJx5lTQ1my/R5mhdmUcqKErjkmwnJDPxpH/p0QsozNlc/NtaPYwIIc50tTwAXxi5vkTwV4jVz3urIqJ4EETQlRO26xtQWTbiWquSVcaTk6cTgamqCpoHcV4a5U7rQIKIMnwmlGlzxlADR9s27PWNM6/Ocw6QxJXFVlvlNxN172irEuaQU2ZF4zYaKXHhRDq4fvTEFa3P3gJcREdxhr59kZ3fbPfnD5i6Y1hvgBRyMHAAbW+4qjbXnPJ87v6eSff0MBm7J414+JQ4J72TaEn3m8HZnFQe7pDrxrUclipRw2GhyIjFaCT/ysvph7nXZvussHyAmGBuAX363AH6Euc4+J5hdWmAwmjpVA4YuFQKetp+FNl9AItIaH9hVPdd0lsPH7xeUHWXZYE4n3zfv3K1W+7/oAbex9qWj0Ra+rxh11Bi2FWPl0k1If2rxZ26W6VrFe8fHKk562k0XeMnJzSGRQPibqhrVHAb5UxSXuUbuhRPyyCPpy1tpdFhp5T3zg7jnmi6ZdPu+LM0FAgCjJLdhEsvR4tDpOpuwIj6VMqf6COBN+ch3stLz8j7n03tmrDDa5z6Mm6HJ5PI03ovazub5XtRUKzHOMGMDNaYCzzX9bOkCgO1OHhATXK9g4jBG/nT9UUMlVbKXkSVAaR2uXWeOJ4JT6T8qLsP7mO8IrFEoXNyauT8PiojYA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(61400799027)(82310400026)(376014)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(16102099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0G7L7qLF6PaxPJmOkY0/yidpE2K7Wt4g8QWgtVrWSdAzCdKgyzieVT96jaBzvkgJIh3pWiQFPuGoeNZMMJr/iEGvDtYOV7Ys7wUovXnxIf0etWqHX5fBZERV4S72aIzmAYwSGlUItYKXJChMaRHbParRDxpfQ+Z9l4VNpu0wU55zfIN7T+CFeqF/P3xKQX/kCiGVtTFUsw6e4o4DMktlYOdXv93yz6yPRp1SQnX8KR3ejFNSc2NmItZejJNQeycwneEfbqea7HtWp8dUdgEH4eCWWwmRhQ/u7ATuoRkD09VBDg6V1urzVGfOIggtqUAaaCXlFAIStv7+YXmHtYD3nC9srRJKPJghS7WEiAt7zA6bG1J6qivObsyNqP0QEGC7m6dnW6Saw6qlbX6bXK1et+yVcdthua0voK5CHFk3BQUkUQ8hMrRe71x6845GlTt7
X-Exchange-RoutingPolicyChecked:
	Onc6EGfOG4+itpFEA61G+f/hgJ+LlUU9rl/x+ndACd5kHnZhXq2gcUr5K2Bx/SWZr6A2qZpTP2pswbhGkdiNXJctKx/uhNz5S+BROWguHvIXEZlrlWYR0nMBnsSWO6f7GFSQRqWvPhrbmwnmlAhnXhyUtDGxC4f9wewtxhy1+enhYUMsnjFrFmT7Jw0p0s2ebHxvd4w29ZKSH/q0lq1PXm/jRWDqqjuJHUAeW31SeBfmlMIRI7fJCPL+6jLsKea4UGpaU/FIIrWxdVZWUOTrkVc0cBrRnPu/2DI+nYoaRXD0L31IwL7DiB3EIxf2AaLiQFU/2xcC1vMiegAMR2pOUA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 16:43:25.8909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff98d89-1ed2-4e76-0ba0-08df4ca58eec
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A804.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5906
X-Proofpoint-ORIG-GUID: TGpKuUXemPLlpYoYvIho250FzZWq0adg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NiBTYWx0ZWRfX+OUVo7+Owiqx
 ThuVSObFO4Lzl6ZX7Cmx+z4SrZpJhLnPRHSePVfmxkM7lG6yi47DXsCj51idwaKBoFADFooJhGH
 YjtJxOn3cfSRFHeThlul7T96RaM6rvNKRTph/bDEmxufcWTx9pqR/GlDZJyqR+5gbvGXNvfyBzs
 XDgif+Oo5n35qYAJJmllJqDCOsO5ujE9jIonx7pYEs+D3eOwvkPPCcHZ9w50+RTAYgmvp++424x
 eciyRLxWnLqtmbmueiuvvnlZxPlGWhaPGUZBuOGir0TI6/GNOAWQSyPnORQC4Ge3scPVVTwN+JT
 4zR6Aj1EA+T7k+bJ7E0Lx1WumBVhYo5uBmgM2yccy8JwRVpGtXnQ881Ev2o63++hs3OreD/GHWL
 IUydi2CYtqLVffXFocVGnArONkxMDol5ZtI+Evqerlk4+uoQkXS9pkv+swjD1nXXYcZ8HhzhBUl
 bfY5BbNN9EQJlBgLgGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NiBTYWx0ZWRfX63zFfiOh+ISy
 OTkO8wKq9PaLUkGv0rFnEcrXVubQYgWfCAf1bb9jjQbI+LjEnd3H4cWT7RIFbT9ZyB51THcjmLf
 TTWT/VUKBxL/NnxWwHusYhmxIDn90zI=
X-Proofpoint-GUID: TGpKuUXemPLlpYoYvIho250FzZWq0adg
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b09b337 cx=c_pps
 a=lRTg7vgTIBoiavhQ3167yQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=kLY81tX9T_sYmklzcx8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 26, 2026 at 02:44:20PM +0000, Charles Keepax wrote:
> On Thu, Nov 26, 2026 at 01:01:34PM +0000, Lee Jones wrote:
> > On Mon, 16 Nov 2026 11:09:13 +0000, Charles Keepax wrote:
> > > Now the core has a helper to signal a device will detach from
> > > the SoundWire bus, there is no need for the cs42l43 driver code
> > > to separately track that. Switch to using the new core helper.
> > 
> > Applied, thanks!
> > 
> > [2/2] mfd: cs42l43: Move to core detach helper
> >       commit: 54b3632c8ec08735d3f6235d80005aa0b648c7dd
> 
> This won't build without the soundwire bit.

This has made it to your mfd-for-next branch, you need to either
pull in the soundwire patch or revert this one.

Thanks,
Charles
