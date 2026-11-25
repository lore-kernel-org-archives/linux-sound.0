Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795605066;
	b=IeREx5qI57X5JKlVwz9j9cIdcmnROS2Enn47nExj2FwfNrV5Wvqwl38bHvaPhLk3B9Kt
	 jDs/1LYKbIxsO9OTamo6ZO6OwkvOAUDPAN5Q4DwliHzkt0ZFkRzZxdaOARR6FI3SBnaNB
	 DB5TeeGSem558lYzetSAaSXjfNNkhG1zF558EJdoNP8zTwai3so+4GdL94EdYYaT/zKQp
	 YS771hCifQuE/zmaHGHSq6DrXqC4oIvCKpnSSnmzu6XLVcghDg6GR9Zg6ukFEm3auWa7n
	 bbYcJuJv49j+7QhfzBER7F13uUHXSy/pYIMXXdN+Wbykps3/HOgo/J4Br8DCSTp6csA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605066;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=42F+BKhssca/iZHJJRJgQl2M6JraEfyGsv89xu130Qs=;
	b=gSTIWLlKlqccMvlrfGAL1PoT/QjBJy1LLT8UDuUbKafzZ+ueVPi4GWvooShO1nK2VQJZ
	 pAwUd/XgkI4G3fu7lVRwx2fA8F80DO9tbUgbLjG0ItYNfsghtAGyo1Oqa2xXfVCU/0HsI
	 in8f6Rq0s9gWKElCZT2lVNwgx13+SLfn9IDUNDbJxx5M0Ela+Pyc+7H9ZE4JtiztBKqee
	 ehIcbz+Z/QavVBnB22Y3JspjEiS+V+01nG6PIUT5hRGB/rPeYnKfCCNEKErDeSRjURec1
	 dwcHuT/TYGQ5uGt43LrpY5/4ai9t+Snc7eLW1bV9Lh2tEECM3zGkX2xS7gwdp1Kj0vQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GPT1MFuw;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=HIfx5IMY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA296606A31E;
	Wed, 25 Nov 2026 11:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA296606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GPT1MFuw;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=HIfx5IMY
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APB7AWl040592;
	Wed, 25 Nov 2026 05:10:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=42F+BKhssca/iZHJJRJgQl2M6JraEfyGsv89xu130Qs=; b=
	GPT1MFuwVQBYMmkAWs/+5K6UxEvrrivgGa3N6MSZdqKtMqlZF+Gp780drV8rEMgm
	C5nWvR4YXSqOm38pizRPr15H+nzH7T/Ee43Wd77jiNQ7jGKOVkIxmlZj70N0TzX6
	1qveVcnq3hxAXuUz5TqVpOUxsh/Qu+gnzvx+1Qt7nNKCvZPZVXdY6z/ks7TXKeVU
	C7uTCe7YPSGZ17oigdv8XL9CesxBDT0Qfk1PcUKV2VeLJkj9scafyCPhSkCnHv1n
	brmrzBlFHNEeq6hyIw/rjkITRbRTtRpQpoiGk4tz1vwU1433zpQJupff8EHWbU/2
	tSeNMmKZa1VTlFGttKJU8g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021098.outbound.protection.outlook.com [40.93.194.98])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jah6a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:10:59 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzFmYe6dzcwJ4xzeFSuSOly5ycXLaCOtZzXT8Lf4IM+rqiKIacYRS40HHOOb3kvv9hRf6Z1sIgo0NUSHUXTvibm9vnrJRFTaEoWP0j/R3h2XjNPugl2Y3F7BoT6SPNRjAVfaTsZkUhYwIXOEKXbcs34/iO/VbtIeFCIT5csQbZ6C1zO15zHqk9lENsRcFL2FWQHMpE/YY/HxyVH21lTt+f7OrNA9lSCCj7O+cowBAnFi0Ke/6czwANi4zblxIR3cOwWEv21c7swzvb7hhT7/f4pkuOtA2Y+EP7XOwcS0Tnej9GHcoKkyMpNkAfqHP5R7mPlbCdzGpMdJzeo0BMd0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42F+BKhssca/iZHJJRJgQl2M6JraEfyGsv89xu130Qs=;
 b=SEz0MayB1ulU429Yj30cJrq9ocO75dMS5siEHPq2wAuAYMW0YwfhJzYLmTqXylbF8t7e4Jy8mcaqjbN9QmcGD+naGVBce2LxE9dSMPugBT9yiByqsWgRgprBxJaqrGux8GCxF4ZuhvVtntezd318hqvfxbrB/rlG8u7LAORXoW1HH/1Nng4KzJzyjtHAXaZaHFNYS6X8lkFayLskH2FLd3LNlHYYT+n7yDWAwT8Mn43C5FLuycnLI0Oyvh3syQ+9lBnrTSdjfQX4zAZlLSYw+NlhpOxoSeg5lEhDW32OyJklnF424q86xzEO/Ttt1r+LFAiSxmzebk6yLrYZYx5CRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42F+BKhssca/iZHJJRJgQl2M6JraEfyGsv89xu130Qs=;
 b=HIfx5IMYvx+MmbPinlVKieBaULYNd5DJJHnnvvDLnrGMVprsENN/OwnjTbGN2g4D1oKWqltNdJaV/tDcEnQBZEom8aMXI93ip/5JGLkwTEG8BQyjbqaM0y4O5PPgOTRZhJNNbsjRFDGenIlxljq41f9iVn9heaWHl/xXntUguCY=
Received: from BN9PR03CA0318.namprd03.prod.outlook.com (2603:10b6:408:112::23)
 by PH0PR19MB5019.namprd19.prod.outlook.com (2603:10b6:510:98::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 11:08:55 +0000
Received: from LV8PEPF00000067.namprd03.prod.outlook.com
 (2603:10b6:408:112:cafe::9) by BN9PR03CA0318.outlook.office365.com
 (2603:10b6:408:112::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Wed, 25
 Nov 2026 11:08:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 LV8PEPF00000067.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Wed, 25 Nov 2026 11:08:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 13DBE406559;
	Wed, 25 Nov 2026 11:08:54 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 03705822546;
	Wed, 25 Nov 2026 11:08:54 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH RESEND 4/4] ASoC: cs35l56: Add test that probe() doesn't write SDW mux registers
Date: Wed, 25 Nov 2026 11:08:53 +0000
Message-ID: <20261125110853.741337-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125110853.741337-1-rf@opensource.cirrus.com>
References: <20261125110853.741337-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF00000067:EE_|PH0PR19MB5019:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 71cb138e-91f6-4a9a-3ce0-08df4ae47ed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|30052699003|376014|61400799027|82310400026|261028144727099003|261021121427099003|261102123227099003|261026121527099003|261022075727099003|261026140227099003|56012099006|11063799006|261022105027099003|10067099003|16102099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2vHlKjK7Pahp4wl/tH/OZY1h3UpEDR0htIo0zBFi0Cv4xAEjpAKw5DXfzU3v5gvXEXpoWQ/V1uUfFxPF1tBsB1LoYYzdGfe9oFTAUD/f7mjMftI/fpwTSVP5AViJd9ESxqGTgFGFqboQYsuXLSiCbhbwPrrb7AgN/SeyKB6zATnZL2Vyo6fgNY3ennVHop2nvDQJ9KG62OsHaCVCCDBUR4BFg5oSXsyW3xFA070M7ljNDWQajoFK1Rr5cXCjwNYtNR9Wv+kAYmCyYsGb9iDa4e+W8s42K/U8KTumgmbWgdSuCxAlYgILPB970+PEIVruc7nTFsxiD/iGzp36ViPphZpwHnOjx17xIBUBNNNXxoxcnTtQK/2/24WhoTYotLqHPZ3j9DABzRVrEeuh7effcNHRsC01rzTWTqoRGu7kR7KMxgn0/pe0xBu8C1zaTg4a+UPhueWRu5HJY4jSIOenw/dEPqsPjON0dqlpt0WU9qGWN6/Dxq+oowY3lN2Iij3NYg0wtBfhn+7fZk9KdykXvP+d4bjG3wd81qGTKi9QWyLDD4W43chz10Df9El32HkClspOsdFBZs9wfdDS36FBAZp7qwumdWVnvL74zT+1LeJ+ZTcGtuDq6IKt8F3W3UPeiOy0/w6aCSAAeBOkdtCjPrtmPV8PSZSnvh/dVLIgdZaR/1D6Mocs/UVRRFzStzL2L0WKTv6Tk4sduVKjWiFVNA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(30052699003)(376014)(61400799027)(82310400026)(261028144727099003)(261021121427099003)(261102123227099003)(261026121527099003)(261022075727099003)(261026140227099003)(56012099006)(11063799006)(261022105027099003)(10067099003)(16102099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E3C51pHaRPOaYlqTdkBP/O72wCnG5aLt9ydhn7KRSw9V/Ly3rdtzWH5sf1qu3+DheppPwuK1gjeUCNDpK/xEVFARGS62834joxoSZO/x9rpMd10YPWdSc3EhR82OlnSdj6L185nQ5bwzfSiOSVQS6Dp/W7gVRGTbiOgYJoRmtCtf/JBwxmnN5PqaP6nDEEGjagpnjejQySYOujNxGRz4jMzlhIOiuaQ+glHKmiVmDARwhCmUtetX5Zq+S8qzz+N+Abv9su5B53TkHxLdTDG2TtDNcnq8grCZdWFk/cQZYgdKo7eCrn6vDYPq5jqTspTDC8g1zr8Whn9/RkkqiD/qxPXgqnUQ721WalQxL+uKnF6C8ZG5iTb4aYoZdd7g9n9naOVLgZOMheU2CF5Z/EpnJ1zOleud7RHm0qovK2WOd0C3jDuppPkcoYSywiK9ywKW
X-Exchange-RoutingPolicyChecked:
	SJRJcjoUY2YPbcuNtjIgC39MEAaPDdWb/lHHy5YJoRnU//wE7smJzniOVzppJhl09wqMerS8Ed5TNmqKzFnA4xkSlt7XmKZpDW+9V8k/RgoZ+weqLD5wD/7RVewI5SY4J30djoFAqqrgcZEcNjnC3zIyh2TxT/W4MXSVQNVWf1Cb4ZgX5I9AFk6li+BMy27R+54Y2XzsGfunPSj85IxcgDW5ZKZjyuHWzFAbUNQJJ7XFSzXTCnKeAqvo/YkphNYoHXeLNq6E2f8ClzRlYI/1UGIX8UX52CN4lkpCQV31bIJk7w+EQZSbfuLf+Xedl3tqar/zMeEpu3wGtt6pWjYLIA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:08:54.8870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cb138e-91f6-4a9a-3ce0-08df4ae47ed8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-LV8PEPF00000067.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5019
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX30wDSg+9pNBR
 DCn5xrms4RJY3hgDaLLLUY4702tuUykDDz14WwwRD/8Kp/cvjC/bMwx8Se3kWFCWZNEAkHaFxak
 r/HuWvnxT10hgrxJe60ggMa2qYGnYj4VqK0mnh9enBOU185/oN+wP4pf61IwAPRzKU4JGy16EvR
 nDs2K3UUmzrILpBBl1LsCKF7NblQVk9A2/nSF0J8vdlBwQCiC1gF6z6QLXfPfBSVXyOnWgFIL9i
 Pew8n6Dh7yPVj36xP5DQSSXqawECSAdchQHXVoWquExa9LBD9tqGAqGM0aDuI/97hqw1slaoePq
 3w/geW3j+DzVb/iZwsIGSqrgOiwJCwY5JPitVgZqqtAxS5WkpKrdgmwn5CRjo0DqmQhjFiwPWvv
 MA66dm1rU+IGlH+YHezSf34VvD3vOLnMnuPauG7YNtM0Z1EvXlr+vvNv/niXsG8eNsWCLM8nrSF
 C5tY12g8UTP0cNUfYMQ==
X-Proofpoint-GUID: LosvEbZffSWmY4w68Dyq49JgskZ-GJrF
X-Proofpoint-ORIG-GUID: LosvEbZffSWmY4w68Dyq49JgskZ-GJrF
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06c243 cx=c_pps
 a=+Hy52UGsyZjcAHjLWYz0zA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=yhNiKUgXxidkoSnXdJ0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX/gLl6ZMIL18l
 TA/Ih/a2u/3HoBoMhCQ/GKmNll2z5JL/Hl8cuf0/1xMEVrTxkiND2OzkvGyORBSyhf2/QizgD6Y
 ajt84WA2Is1ta13vCalsSiwInAinLxw=
X-Proofpoint-Spam-Reason: safe

The driver cannot assume that it owns control of the
CS35L56_SWIRE_DP3_CH?_INPUT registers so it must not do anything
during probe() or component_probe() that could result in a write
to these registers. Add a test case for this.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-test.c | 84 +++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-test.c b/sound/soc/codecs/cs35l56-test.c
index b422d19ba0b2..362da30b949e 100644
--- a/sound/soc/codecs/cs35l56-test.c
+++ b/sound/soc/codecs/cs35l56-test.c
@@ -63,6 +63,7 @@ struct cs35l56_test_priv {
 
 	bool asp_config_regs_written;
 	bool asp_mixer_regs_written;
+	bool sdw_mux_regs_written;
 };
 
 struct cs35l56_test_param {
@@ -124,6 +125,11 @@ static const struct range cs35l56_test_asp_mixer_registers_range = {
 	.end = CS35L56_ASP1TX4_INPUT,
 };
 
+static const struct range cs35l56_test_sdw_mux_registers_range = {
+	.start = CS35L56_SWIRE_DP3_CH1_INPUT,
+	.end = CS35L56_SWIRE_DP3_CH4_INPUT,
+};
+
 static int cs35l56_test_mock_registers_read(void *context,
 					    const void *reg_buf, size_t reg_size,
 					    void *val_buf, size_t val_size)
@@ -200,6 +206,9 @@ static int cs35l56_test_mock_registers_write(void *context, const void *data, si
 	if (range_overlaps(&addr_range, &cs35l56_test_asp_mixer_registers_range))
 		priv->asp_mixer_regs_written = true;
 
+	if (range_overlaps(&addr_range, &cs35l56_test_sdw_mux_registers_range))
+		priv->sdw_mux_regs_written = true;
+
 	for (i = 0; i < count; i += sizeof(u32)) {
 		val = get_unaligned_be32(buf + i);
 		ret = regmap_write(priv->registers, reg + i, val);
@@ -929,6 +938,79 @@ static void cs35l56_test_component_probe_omits_asp(struct kunit *test)
 	KUNIT_EXPECT_FALSE(test, priv->asp_mixer_regs_written);
 }
 
+/*
+ * Probing the component must not write the SoundWire TX mux registers,
+ * either directly or through a subsequent regcache_sync().
+ */
+static void cs35l56_test_component_probe_omits_sdw_mux(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+	struct snd_soc_card *card = cs35l56->component->card;
+	struct snd_soc_aux_dev *aux;
+	struct faux_device *card_dev;
+
+	cs35l56_test_create_mock_supplies(test);
+	cs35l56_test_create_mock_device_registers(test);
+
+	KUNIT_ASSERT_NOT_NULL(test, priv->regmap_config);
+	cs35l56->base.regmap = devm_regmap_init(cs35l56->base.dev,
+						&cs35l56_test_mock_registers_client_regmap_bus,
+						test, priv->regmap_config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cs35l56->base.regmap);
+
+	KUNIT_ASSERT_EQ(test, 0, cs35l56_common_probe(cs35l56, 0));
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, cs35l56_remove_wrapper, cs35l56));
+
+	/* Prevent real dsp_work */
+	INIT_WORK(&cs35l56->dsp_work, cs35l56_test_dummy_dsp_work);
+
+	/* Simulate first attachment and re-attachment after the soft reset. */
+	regcache_cache_only(cs35l56->base.regmap, false);
+	KUNIT_ASSERT_EQ(test, 0, cs35l56_init(cs35l56));
+	KUNIT_ASSERT_EQ(test, 0, cs35l56_init(cs35l56));
+	KUNIT_ASSERT_TRUE(test, cs35l56->base.init_done);
+	flush_work(&cs35l56->component_register_work);
+	KUNIT_ASSERT_TRUE(test, cs35l56->component_registered);
+
+	card_dev = faux_device_create("cs35l56_test_card", NULL, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, card_dev);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, faux_device_destroy_wrapper, card_dev));
+
+	/* Bind as an auxiliary component so the ASP DAI is never probed. */
+	aux = kunit_kzalloc(test, sizeof(*aux), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, aux);
+	aux->dlc.name = dev_name(cs35l56->base.dev);
+	card->name = "cs35l56-test";
+	card->dev = &card_dev->dev;
+	card->owner = THIS_MODULE;
+	card->aux_dev = aux;
+	card->num_aux_devs = 1;
+	KUNIT_ASSERT_EQ(test, 0, snd_soc_register_card(card));
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, snd_soc_unregister_card_wrapper, card));
+	KUNIT_ASSERT_TRUE(test, card->instantiated);
+	KUNIT_EXPECT_FALSE(test, priv->sdw_mux_regs_written);
+
+	/*
+	 * Flush cache to ensure there aren't cached values for the SoundWire muxes.
+	 * The first case without regcache_mark_dirty() tests flushing when
+	 * hardware registers have not reset, and requires a dummy write to
+	 * the cache to make it dirty.
+	 */
+	regcache_cache_only(cs35l56->base.regmap, true);
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(cs35l56->base.regmap,
+					      CS35L56_DSP_VIRTUAL1_MBOX_1, 0));
+	regcache_cache_only(cs35l56->base.regmap, false);
+	KUNIT_ASSERT_EQ(test, 0, regcache_sync(cs35l56->base.regmap));
+	regcache_mark_dirty(cs35l56->base.regmap);
+	KUNIT_ASSERT_EQ(test, 0, regcache_sync(cs35l56->base.regmap));
+
+	KUNIT_EXPECT_FALSE(test, priv->sdw_mux_regs_written);
+}
+
 static int cs35l56_test_case_init_common(struct kunit *test)
 {
 	struct cs35l56_test_priv *priv;
@@ -1233,6 +1315,8 @@ static struct kunit_case cs35l56_test_cases_soundwire[] = {
 	KUNIT_CASE(cs35l56_test_set_fw_name_preserves_spkid_without_onchip_gpios),
 	KUNIT_CASE_PARAM(cs35l56_test_component_probe_omits_asp,
 			 cs35l56_test_type_rev_all_gen_params),
+	KUNIT_CASE_PARAM(cs35l56_test_component_probe_omits_sdw_mux,
+			 cs35l56_test_type_rev_all_gen_params),
 
 	{ } /* terminator */
 };
-- 
2.47.3

