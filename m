Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191131;
	b=FEtp/rCJPL0rUDRyj4bI1mmtbhg6RLAAkWklssTRA1UgRMcJIyipBlD2j5KTwHlo4wUa
	 KUI9QYbd2Lc54DUFTc0PLsBB788GnkWHWSLsGrsfPF6zW9+9cv7fmjV9v38SmsrxX/nB+
	 gleS6gsv9AahS6cKbv2nrolK0V6WtIQGJ5rzL8Dchdn6y2zyVkvYjsV9AN7DHvNwn/WHv
	 lKdYNgByf4KW7Stm3AqhD6YlcUw9apZgE6pBhe72jlXtw1hDhJ0XmL8zleN+22rR4BSGc
	 vZEwObzWlhgl4hblDLyKOQrFt8QaPRtl5ufUT/hzIySAR5GAM5XSOW2VMj35B7h4mZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191131;
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
	bh=Y6HTRFCdDzUX62Q4KmwM4Ph4nvODsqy37ikMnTWuDz0=;
	b=n8iuU44mEH5jRmnS/d7ilAO/+hvNE4LzDVxQ5U5W70kltLjwFyl77eH84OC14LxWD5Am
	 1wyGoUl+0wAhzCNPv0vJcOZ4MUbqV4aL/iNxe2qN3Cko/TnLmF5rZBu4Vm14GcYbXwCm9
	 8QGUX9TgQTZmGAitVZvjHvRSGzFKyDm6+q2laudbJhpWE9IBAgJkx5hsI7wNp2llwx7yd
	 JBqW0ie32YzxJRCpTe7IdpwsJhb1qxRXzGF30cS/7oojA3ZZH/+t0AVNet3OVDkDz6gFs
	 1Wj7nMCpG9jXnxDLEm47AbKk5GiK6okx69W9efwTm7f7vQHGouoCYE7RyG7qMBBYD3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=MVi95NDN;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=LMFtZrw7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D373606A320;
	Fri, 20 Nov 2026 16:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D373606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=MVi95NDN;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=LMFtZrw7
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKFqo4P927894;
	Fri, 20 Nov 2026 10:11:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Y6HTRFCdDzUX62Q4KmwM4Ph4nvODsqy37ikMnTWuDz0=; b=
	MVi95NDNfxfgiadfBqg6rgvzwGYsLJlr8LL86XFvl9dpu454XtrtPCnS83DW9Zer
	KbG0b9RIhsKLrW4Sbi4sAh1OIaUT2ntokQQ95DsEnmC4MbUGcbxrKZo7gYbVt72y
	PCXapgRxxcbZewrlBCe+x69JSo2/0X1klacwW0KzT3hJy3JySj05tbOFDiKNyPci
	r1hnwDc5BcYDyQgxHgC34Dx+gfCsEDVudko05/SRp9wIGL6gE7nYPuRWhM9KvsYY
	Z27LR8O5FcG1m3nY5E45AYiRLh96EvnWhDIPet6T4j2DHp07GZfwohCb79dCMmts
	oQmW8pfzXVlYliYDrLw/Xw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022137.outbound.protection.outlook.com [40.93.195.137])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j242mjb3n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 10:11:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0ytz2oox70RpkrypXflMelyxWJXszP954ItoGKg+S4THNjTHQYiRgqgSqOeo0tIkUTAIybe2e/FlIP1E6ZMcKzX53Wr8Nx3t0YWcWwL4NRE6YbGosMmzAv+PAPYtgnJfbLr1ptpCcOAUnJxun6mSrEkk7v4yTuP2xmu6IKTwr0iuZQErmHJPy1+rURger/LKpgtlXAogcyqdVhw7jhaO4IondFSfvWQZ3qAwxpBN/9vkK3SunXVRL/S22mg7mluCPbmax6LTPon3exQGbr9gJ+apJ4yOfOPKMNv+AGPRiVXeYDkvKA+IQL0VL/GtiBtMEgG71yYpqN9VhfBCP2s1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6HTRFCdDzUX62Q4KmwM4Ph4nvODsqy37ikMnTWuDz0=;
 b=UiMqXO7A3VttAo4qLWQ1f8FnjvzLkIoMhyJhKmgXnpPA2j0TVsO1gMWFdBzy4yWelRdCqT+rbg+nqn2xdgLsmfTjfNua/QkkIGPlWc/KrtTjqqzQoBOMjFQt8h5LnG93QJmH/L+B/p1H/c1LmRYDkB4uav+lLYjE3J+lX2PWztgOfgc9Mp6rrA3r1r4QNP78kIz038fFPw3wIH6efOZ6Lx/KN8cX+1kUlzQko+61g7TeVVUVaxU5dnjX3P1pWNQX1yl9X8Ko4TmDXeK4y+R3AtRhs8fAEZ1aoaKtvBWAny24ZEybdRXJFpM1WToWdEvl7MhHTEHUHYSDn88H6HxY+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6HTRFCdDzUX62Q4KmwM4Ph4nvODsqy37ikMnTWuDz0=;
 b=LMFtZrw78/GuCN8I+OH7p2NIoP0s3tcrEljogm7JxrSDp0TuC/d5jCQGgpEzaTED3cihLqebcT9+cWEfN57KOchE2GADaNVBUs7vLw3ocxyqyNj05iRNLBToYULep/tgw1glKE7dahaqRfiLB83tC0kKB73EaQvxaszLIkfjsS4=
Received: from MW4PR03CA0032.namprd03.prod.outlook.com (2603:10b6:303:8e::7)
 by DS7PR19MB6120.namprd19.prod.outlook.com (2603:10b6:8:83::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:11:48 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:303:8e:cafe::8e) by MW4PR03CA0032.outlook.office365.com
 (2603:10b6:303:8e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 16:11:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 16:11:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3D2EA406556;
	Fri, 20 Nov 2026 16:11:46 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0DF62822540;
	Fri, 20 Nov 2026 16:11:46 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/7] ASoC: cs35l41: Prevent software reset when using SPI
Date: Fri, 20 Nov 2026 16:10:48 +0000
Message-ID: <20261120161136.157593-3-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|DS7PR19MB6120:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a74ab0cd-9f26-48b6-1013-08df4720fa99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|61400799027|376014|36860700016|16102099003|18002099003|22082099003|261009223027099003|13003099007|11063799006|56012099006|261021123027099003|261102130727099003|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022075727099003|261022105027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	eOlIIrgjDFL//PYb7YbBAUePTpaBLDHsK9BpHzuQY0nH3WA7l/bhWUIymUH+ExIEqtHaPTAm/wN0BHwoRbnHMCLCt9Au7S+Q1riFmRkWO+gjVz4MGLgZAfz5e0YFsOS0Dj5lW2MQZRbgP+YPSnkMglZFq+aU/msqcoxtKh3PU0oNm4BRNx4xiev1Ras+G50z9tNvBu3mTh0TkFq1M5vO4gGlDH1yB4qC7pitcW5v+KTyMTeW8cQH+Gcd+U/t0A2WfhtQ50ltOtt5nzIfP+Ytz5ijT94oF/leCkWg3W60cDhWuWjE5wI0Nv+eaEyvOVdG6o64GjEMTy5qLH60lomcSyfCjWGwL1OZ172igFm582hjIW4VWvLXxAptNa11iSVJnR7S0XQemqyOaJzAgVDN21Zt7zEHXAQDwtLyt19DmVL0I1LDJ2wwnPHrbuSFxvI47659s6Ft4Rih8lh5UWcdHHiNgDvwZd6Y/X2RzPau+NuiGot7sfXOdxwcWN1oe3p4l3ntcIVk7O4cWKyp7Ta0QjipCQvd9X1HANYsMkJlTuD7pIIubzY9GN1R1IMxB7vF7ZKkB+5RRlDbvwsQXOHZQ9pJVqOd9a8eG6uISx+JPox5TkJyqxkEXsHtSlvmQl/QefT0mfg0XLrTqvFu5aqMWQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(61400799027)(376014)(36860700016)(16102099003)(18002099003)(22082099003)(261009223027099003)(13003099007)(11063799006)(56012099006)(261021123027099003)(261102130727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022075727099003)(261022105027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cku2WYlLoV0lwEye3GbHci0BGeYSLb3S7I1MUAuBUQYC7P47mO8hJvfpLvlBE1eS9Ax5lvpcKTwOBoeb15oFliG5HwhUpXs3CBOCDMuTf+vikybf90v/HZd8XvpPkkvn6+EqRXHJUsLIG2kMT4ep5iJQRBXVegFUmbwFceP1/7B7xh3Q7U90giopVQYh5VwYfZ7ce5OkhZFIK7ONZeKkM7f2bbgjlxdrG3Jo39J+Ju5Th5xk2btnkbfpUJa+75sIq57aIqs/EwKybfqjNQxPlvaFNG+uylnbGTsbJySYBdNaDclk0Zm3LtnLZwBnY9huhkNCvFlsNt7VLfyBNjIvMl0nLgcuXl+hGx5OUXjlb8W+fBzIpIV45mvDHW6fpJeboCjQe/5ktlTRFILQ+HYRQtPkCTVj7qmPpgzceK98kl+oGALvP6bcm+xm0E72aIjz
X-Exchange-RoutingPolicyChecked:
	dwYWXQD1fpAcWdmlswQPqTtjXentrGyAn0ZKnqJB2mKAJ5NNrN3of8HFEE5ERP4mQILLJgfkYf5tAGFSP5pVUI3YgEIANnSOjS4sTS4XS7IlxYP1FdsNIuDNTwIE49vuzAhluyuWO2kvQUg2xnFnmXsIwlunydboGWBZSGFQpn+UblOc8uQKKEoG9yG+Bzc3Xc1nXe81/n/hk98XTtBDkjkSNT1H97LS0vZyT/KfiwvOf2mRg9dqLPQ5p/8et0u34AFrbnsTPV4yjPKlmiHVe332kpchTgGu1xdZs0fomQZQIQSbbdCWkHzYjv3ze0GSYML7Xqa7khnpNAF3/VwTFA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:11:47.5500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a74ab0cd-9f26-48b6-1013-08df4720fa99
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6120
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfXwzjsfnC3mL7A
 9anGrTWa1LgyW2g+RxS1a99WxORnq/j6cjtfhYZvwluWFugyFfVTlEdNFrBXF9R2SmHQN0GLhad
 79pwV5kqwHRAENnPT4tDsuTursr4+Kp6+dkXJfT1BsF/cvlM6DEGLrMD3Gtk+m4Z7QewxlBSy4v
 uuu500A3q/9RlRQ/SPyB0inF9zyTABu1Q4H1d9VGRDW4vecweECJg3gwZ/1sFp7+XDd60mnlgcU
 Mw3E8C6NvG0YPW/626s/xbnnmP2DVO/psSU+/bjngvMv06JnDKCoED+qixqdi5ZbZB0U2IZ3Ctv
 7lE6+z0A8QNhACSv80dCcEUYMvFJtlb5MBeunAzkCTbcHCeF6UMVriEEly1NfAuYeCAG0NLKhrV
 Tp71fEQqZnHd44fSU7kL3IWSDh4KmTJ6Vu+aRNE7WL9eUbuo0y7HPknNsVscRTsUUgGW91p4avU
 AAJKnoETlVo3MQJM5xw==
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6b00714a cx=c_pps
 a=LmFNP1q1N8XVogtwAr/bmQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=VCxekSB35Xx1IrWNsrAA:9
X-Proofpoint-ORIG-GUID: U20x8CzWRYiRX5p_q5n_DuSL2HNrvLBy
X-Proofpoint-GUID: U20x8CzWRYiRX5p_q5n_DuSL2HNrvLBy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX0X12EttH8uk1
 L6/zDAYpNF2Xn+Xug7izSU+P5EIApbO474NbE2/PnOc1EdT4ub4FfxlwCcUAzQMjGsPrEyfZABk
 QOxZg/Wn3gOaHzvincaRCGlTIBShN4A=
X-Proofpoint-Spam-Reason: safe

If there is any SPI Bus activity during a software reset, even if the
chip select is not set for that Amp, the amp may not boot.

This affects both CS35L41 ASoC and HDA drivers. For HDA this also
affects system resume.

Whilst the driver needs the amp to be reset when coming out of system
suspend, the driver will always toggle the reset GPIO off and on to
ensure this occurs. If a reset GPIO is not defined for the amplifier,
the amplifier will not probe - unless the amp is using a shared reset.
In the case of a shared reset, the GPIO will control resets for both
amps anyway.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221161

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-lib.c | 51 ++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 9e6bed22fbdb..0ea6e9c87da1 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -13,6 +13,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/firmware/cirrus/wmfw.h>
+#include <linux/spi/spi.h>
 
 #include <sound/cs35l41.h>
 
@@ -1588,6 +1589,18 @@ int cs35l41_exit_hibernate(struct device *dev, struct regmap *regmap)
 }
 EXPORT_SYMBOL_GPL(cs35l41_exit_hibernate);
 
+static bool cs35l41_is_spi_regmap(struct regmap *regmap)
+{
+	struct device *dev = regmap_get_device(regmap);
+
+	if (!dev) {
+		dev_err(dev, "Failed to get device from regmap\n");
+		return false;
+	}
+
+	return (IS_ENABLED(CONFIG_SPI) && dev->bus == &spi_bus_type);
+}
+
 int cs35l41_wait_boot_done(struct device *dev, struct regmap *regmap)
 {
 	ktime_t timeout;
@@ -1627,27 +1640,35 @@ int cs35l41_reset_and_boot(struct device *dev, struct regmap *regmap)
 {
 	int ret;
 
-	ret = regmap_write(regmap, CS35L41_SFT_RESET, CS35L41_SOFTWARE_RESET);
-	if (ret) {
-		dev_warn(dev, "Failed to write software reset: %d\n", ret);
-
+	if (cs35l41_is_spi_regmap(regmap)) {
 		/*
-		 * If the write failed, it is likely because the chip is still booting after a
-		 * reset. Wait for boot, then retry the software reset. If the initial write failed
-		 * for another reason, then either waiting for boot, or the second write will fail,
-		 * So we can return the error then.
+		 * If there is any SPI Bus activity during a software reset, even if the
+		 * chip select is not set for that Amp, the amp may not boot.
 		 */
-		ret = cs35l41_wait_boot_done(dev, regmap);
-		if (ret)
-			return ret;
-
+		dev_dbg(dev, "Preventing Software Reset on SPI\n");
+	} else {
 		ret = regmap_write(regmap, CS35L41_SFT_RESET, CS35L41_SOFTWARE_RESET);
 		if (ret) {
-			dev_err(dev, "Failed to write software reset on retry: %d\n", ret);
-			return ret;
+			dev_warn(dev, "Failed to write software reset: %d\n", ret);
+
+			/*
+			 * If the write failed, it is likely because the chip is still booting after
+			 * a reset. Wait for boot, then retry the software reset. If the initial
+			 * write failed for another reason, then either waiting for boot, or the
+			 * second write will fail, so we can return the error then.
+			 */
+			ret = cs35l41_wait_boot_done(dev, regmap);
+			if (ret)
+				return ret;
+
+			ret = regmap_write(regmap, CS35L41_SFT_RESET, CS35L41_SOFTWARE_RESET);
+			if (ret) {
+				dev_err(dev, "Failed to write software reset on retry: %d\n", ret);
+				return ret;
+			}
 		}
+		usleep_range(2000, 2100);
 	}
-	usleep_range(2000, 2100);
 
 	return cs35l41_wait_boot_done(dev, regmap);
 }
-- 
2.43.0

