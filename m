Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795194576;
	b=UlMLP1TZrDnT8DAN9sokMW5BaidC86W11GCeHKpUGtFwXQ4O5KM+P7ga3rlBTUSGH97J
	 zR8UTE1b02DJ8PlHcLrYHNvn5ICjnzIaHsQmyB61OCh0UFd1KBghW2idvkM9Mhsi3LA1W
	 tXdUdj6Ax1Ihu0RBvvqI5RS/jzUEoNGDMIwTs5usr1Kc6uVg0TQN9cDS0bxL74cyzQFNR
	 pOW8iC1mLuSJb0auzsn726+IIRdlO4r7G14gfBBmEOGJuDFv9LWYETngGTe6xS5d3Urv3
	 z8mAV9cr6eCH+tUiVV2iw95tTD86n+txN9ryxftN8G/PdrHUIPmRCQJoyB75dX1DdFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194576;
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
	bh=hprX23C2cjZFnKp6gU8xdz7CjTixcCkQsL+nAkDQyGQ=;
	b=yisb0IOFC+E2UWaUC6/a3okhPS2nN+wZlPmFKt7x2JPJUiduaKP/xMrN7xSQyrqDlLp8
	 wj8Y26A7JnXuU677dixh41UnpBUe56tK80FJLL+ws6LUX81cBcaVLl+Rx0o7gxS/ihFh8
	 z5LVW6u7wq/SOVcRwcgZj3V2EOda0hRh3XeSY60IV4sz8yZbK0ex5d4vCLf6TvdeCfJBI
	 UCgpFlmc04NckM37/dBZMAwGyuGqXfwU8xjEWLXp0eZ09Gy8j3l9W+jCWODFtix5j/K9+
	 /y+BKoZCSyHFv+4zoSFyZXLnZSPnK7evdV9Em3v890EizCq+js+wLjkWTC1+5M7FLoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="UnRXO/sq";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="EwwcsQ/P";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834F9606A33F;
	Fri, 20 Nov 2026 17:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 834F9606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=UnRXO/sq;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=EwwcsQ/P
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKFllFw918391;
	Fri, 20 Nov 2026 11:09:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=hprX23C2cjZFnKp6gU
	8xdz7CjTixcCkQsL+nAkDQyGQ=; b=UnRXO/sqv8HkU81Zj8DicyJ+HbyDI/y/Bb
	MifqZ5yLWRiurnZO4wp82eWW/FVqfMZ09xA9IebcOvJggVPI9++4w0Hp2yj3u+To
	pE2j4k2Po/y9eka8bWkbqJpfc13gpZS5cwihEuj2FQGGUliQ65u9gxu0t/i8XzFa
	IaKC2uUQGY66UtLDtFnHw/UwwfK+jmikP5CJtCPXqrQ5FcxpvZtRvkt6Dkt/lUQc
	vMNFMOpdqAahqLKkrveNfHcUEYwE/ajcX/607weNnNTuGYOdh/irJ+IDkNyft4mF
	WpNWV2+WaQTLEkOOL831fBJXfHo2bU4VNfUJqjg4P+yYzbkJMaeA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023078.outbound.protection.outlook.com [40.107.201.78])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j242mjev1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 11:09:17 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0zLxVoRvgLQ8VpRWHKjedHlG9bt1WEupcBjKcu1Kgt4LqKTRxHKYgQdueuKpKK/3PxzOYncpNd6hee1vALDABX3AGg1qTXdT8qNCnPF3RSMLCKR6nmu/o4vjawP0dTB+LA1506Low/MoeWXyzySOfa3uFBRfETR+jGXy/nvSa3yroK0Jk5Ko75hDSY9/w/zUMhYjGmKvMkN3mxWCmGN/vZ1Spo86vqU2sP4oz/vqaQh8TrCsUhM1NXQhWyui0xtIftSZhikSWJMtT/f+2nPgqZbzAYChBhQ1hObCDK9vHOmFywqvrJpqyf3iuyKVMIc41hzhJZhER1bMcCXx+HRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hprX23C2cjZFnKp6gU8xdz7CjTixcCkQsL+nAkDQyGQ=;
 b=pFbgaBc421AgXmwuRr7K1farDjmIeNVOIMSfwf/UdzlxvQKE3caQdB9bAHe6CwaRwT+qihpT34rU/BRFlnJAq2HFuEhW8wYl2nfW8aF43wgN9xXGTOZpLNU/GjXNFY6UPWutZvCOlwUJ1atyIaiD1d0+yYZ79zMaRuVHamK+vRJPw5+tihFBy5ew81er1/6T0fwdRNpBpLLhG21NjYAWVph16g0eWn6Z33/UaNveFiMtWKM9MteCg6ow+8fMQZ5oZ5VDhmqtBsWF+k9tR8vyLyrKt1fb2PlBPLtZZavy+3dBJ9WtMPDCUg5n/0rC9XGfudvOgrHVBZVEx4LOd0VyRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hprX23C2cjZFnKp6gU8xdz7CjTixcCkQsL+nAkDQyGQ=;
 b=EwwcsQ/PdxMYPhsygGxO4o9PV7PeZmwhdhRVnvvo749c1LOwsHZaz5XVNC+i3HZUZj9TRYE7+AVUTsc3Xh7mlz9ZuqPEtMlDMrB6NLAtSQB5Wf+41TxSrk6c3MOgeomUs3IHf5Ki2hTSfVR3z2MtoyH3tKfWdw9qDZC32F74lCY=
Received: from DS1PR06CA0001.namprd06.prod.outlook.com (2603:10b6:8:458::11)
 by CH8PR19MB841479.namprd19.prod.outlook.com (2603:10b6:610:318::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 17:09:12 +0000
Received: from CY7PEPF000000F1.namprd05.prod.outlook.com
 (2603:10b6:8:458:cafe::a0) by DS1PR06CA0001.outlook.office365.com
 (2603:10b6:8:458::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 17:09:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY7PEPF000000F1.mail.protection.outlook.com (10.167.247.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 17:09:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AC478406545;
	Fri, 20 Nov 2026 17:09:09 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9546A822540;
	Fri, 20 Nov 2026 17:09:09 +0000 (UTC)
Date: Fri, 20 Nov 2026 17:09:08 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: SDCA: Use Function Extension info for FDL
Message-ID: <awB+tGOXJTmek01J@opensource.cirrus.com>
References: <20261120162807.1568409-1-mstrozek@opensource.cirrus.com>
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
In-Reply-To: <20261120162807.1568409-1-mstrozek@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F1:EE_|CH8PR19MB841479:EE_
X-MS-Office365-Filtering-Correlation-Id: 2900af41-ee5a-49a5-74fc-08df4728ff05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|82310400026|23010399003|11063799006|261021121427099003|261102123227099003|261022075727099003|56012099006|261026121527099003|10067099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	67UKrZfHNK3asHmKY+VcdoK9pURaFUYsvY3Mxp0M5LS6PCTXq75KwwrbYvVhU6p8SQ/6mwLUZmOQ09N+OwX5G6F6mgsLBFZko6LDLIeG6IfaH3F4JBog69zRQSvDmFT57T/btoXX+ctbPiWnrVOzVmPUJZ1GV7EberwDXc7byd6u5D6EeeyJqlQrnLaDBEdIcfpsklsuIMA2+o/G/e3mkFE5fKdCNgm7OnIjLpjeFFrsTUGJc27IOXEuZqD1KmwPZL9zllAaAN42It0G37FRj39xDNMElDg/lHIP2L84feLJjfEEu0gnzvESpw3FKuW10LqhKV3xaZEyiq53ROVibjUuHCe8yxQ+8gNnc5YZ5miQZacQ0oyWcvkmq8/4hWMKeyrDCNDcNVFU6NjdHINqBg4WHp1k13rZFkeELsCGOWosf6rb0ihk6wPk7r/sriW0fHJHHuwAYDJSEhUn86EriaLR8Vg1RgRnu69PFr5ZvxU+mwVN1SYL2+7y4lQ4gi7ws3L1vqBO+LadF3yXC+WpJwV3NX6/vvAjOBeXhFtQgwT0/PwCRIoDVacT8lxyehHqZsP/zHwSGB249nNATlso/DHgzktFQCJFwJx4TwBhOCq5Bd0Y09y/OGN6TMDEM8l3qjrzA1kJ5frFD7SRkdsA7SA9W0DKjYtNwMbsR2bKCpuOtJgP5I9K0j0rRdYwWi+7usIGzMqW3eKOjr/ZbBU2rg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(82310400026)(23010399003)(11063799006)(261021121427099003)(261102123227099003)(261022075727099003)(56012099006)(261026121527099003)(10067099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cAVMqHgk/qtG7qF9IQx6esJ9Ng0mR9p520Ig+zLjDVDkJ+vPwerc5xd0wJP6QRQU/EeYeGU0yUXF2mDJzi1PuRgdQlhfp3FXPI1oDUHOHCW5YI0zqtd0dgyB5OwN80NaJh9/VMp8G8JcORxug5eY3WOJjOLmz2zOyG+Ojv7E4qybiMWWIN4qg+RAP17CSDgBvXshZb/pPYas41Cxtx25D6IGEP37vzNY/nwpU31ClpsbPDe4FWW/Uf5bt4/BlxaFi/RgdEEH7qzvwr91wvYgnIcgTBtyw/VchVfu6YkmUSYnT0ov0PZzdNLsYI5l2XaMbFzK4jezGas4t+59mXpo06y1ioVSIu9aEQk8HDmRvBnMfmrryUV5pGUIL0HhukGB4Ew7QvsDk/3cgM9oyrLL6Snd+uvMX7uObCm6q16NdjVYKzn6gRk/SKFRcvRjNVMt
X-Exchange-RoutingPolicyChecked:
	mtvQjezzpZPpcuRe4jTprWA+DVTkRbw/irG+Udcr9tpAqlyWj5q175LkEDpF0I2GINfOt+i8eakE8o2uBQ4SN9WsMEu39wY8+CoBhQ48bLCvzojbMoNcQuQkY4uLgiz6Vi93N+YhHWk8u/klh/JdBMl5TgldM+SKgVGcFzJPhh978gV4AXRfT1kgl4ana2QxMCTMlV00/cncSF48MDO1+q0vYXyufs/k9SZiV1HIoR0SA9VKic2kZkC2yVWyNWfSd1ut5qRFqd9lDRnGWCNAF5DjyYDevo+282CIdjHX0QjHVqZSodcLX9cCmXhizl/5DHkyjqHXttqLiZpSL9AIiA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:09:10.9761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2900af41-ee5a-49a5-74fc-08df4728ff05
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY7PEPF000000F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR19MB841479
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2OCBTYWx0ZWRfX5BMwvuRWqPjg
 l6WdI+EE59LI6cOCfs81aZR3XN0vMi9hnsTRdioK4ngLlRvgihtX9VzHdsNknjPwhEys6uepzov
 uUbBy3bB2MeGsGqGspByqDnHQUJ+1TV03C/jMPMSY2Lnh4fERGWRKpzW00uHp4XJVj63yr74Vr/
 YOlpRpJfKagC5+yIyAAMXFoWGesUok7trY64gkyuWr+qNj1I0zEN54ZwPMwZSdnhlVpmEBSZF2A
 m5HGznXsPeVMaI7zz8GJf5XrPgqG+na37RI7Rn9tA+Xys4D3Pc3vwNB1tYKhW3Dn6BkodOvCkNP
 Vobsdl+JgbaMTBPpJI3XoJzi/kUry11ZAVVeTmAXwFToGp0c1VisrlTNuqHaRIDAvIpcSLyXYy3
 p3M18+5gswKxasnX55yz6e3Rd9vrIsw04VSM+A/KK4UWHMzQeeail7UXk6nW/vDZktsBAAlJd4R
 iAYpISc+7jUnBkFjnJg==
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6b007ebd cx=c_pps
 a=vZ2NHEoT5gtGO0BECTCC2A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=n6rYSBNEkjOjkzvipiMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: wkqtiDnqMRkDVB23DxQCIp8RSab2nWKz
X-Proofpoint-GUID: wkqtiDnqMRkDVB23DxQCIp8RSab2nWKz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2OCBTYWx0ZWRfXz8hTFtq0kjxr
 rr/OBppaS9ufsy9mrlU9HIgTKm+0AMRTmgS/m+o5NpqGfBYUfQzFVk5TRFFQa62RrViZdLAFt0I
 PgSphHQk1XnwNbjK5uiuC0YDFz563S4=
X-Proofpoint-Spam-Reason: safe

On Fri, Nov 20, 2026 at 04:28:07PM +0000, Maciej Strozek wrote:
> Add additional way of selecting files for FDL using Function Extension
> ID and Function Extension Version, following Windows' SDCA driver usage
> of those controls for FDL.
> Make sure the introduced FEID/FEV search path is separate from the
> 'legacy' SSID-only search path in case some vendors choose to re-use
> SSIDs for different SKUs and identify them by Function Extension
> controls instead.
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
