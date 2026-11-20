Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191141;
	b=UIIBrIh4edSQvZQCgki3WUEridq4nosmn05C1DlHuBamompF9vsohGBbUexZUP5spKc3
	 pnZh89+SlUMZv5jHvXdiiRRu+gDk/umFBWrx0c213lLZrRYRu5KTe3/T5R6xVYQXYoXmT
	 iUxGe7HmCdesivJ3IsJ3qDXeEGDTE1Vb6LqrQ7Pn+nmDm3f1RfHdikw2A0KL84oJTRq+A
	 JlnKNcTi0WRrrTKaVIX5DAhxi8Gcy8bmvKUMG/6PmTxnr6c8zqHj612dUcYJ/2AtQsuUS
	 jep8H/MaFiKbT+y5xrRzpB+WvX+lNrh5mHw9gmxI7Li+Uig57y0wnbJiJidK6GPDUxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191141;
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
	bh=/KFd5MiQ60uBF3UC60eFTxmCSngWN3R/qdB8PMOamRA=;
	b=zIhI/ZmNsHE9MBailUMwwAL+kgeJiVXh3VCCW1rnFZYCUSw6Syv22EwGVIykgQKsMD3F
	 cnTJdO6AFEndfD+fhoCzozKsvFJ+YZ5bpc//E81rHWYrgGSkoKF5ftZt0+FAft7eXF21e
	 9kM0VdRPNv4v1DXjtf9Dvz/XufD8PJT3bCDQpIx8/kW4ky1aHWesEKh0kdVzLWRztWTkZ
	 5JKw9ch24pXe9+TfxGEyT5tig608zCdbv5Aym3MNEn9jAjfLw5VMGoBMzEE7rOyd5LvhO
	 Apy3l/DUAZfKiOenQcEs78o+ME9p5qc2REIBAKxziO31F8v+0shoXYYn93qYT9eM7NQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=FrfURECA;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Z64WFR7y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63ED606A33B;
	Fri, 20 Nov 2026 16:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B63ED606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=FrfURECA;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Z64WFR7y
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKFll7C918391;
	Fri, 20 Nov 2026 10:11:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/KFd5MiQ60uBF3UC60eFTxmCSngWN3R/qdB8PMOamRA=; b=
	FrfURECA3JcwFv8UmDGgFFKJCdeiXpw4zjFF2JX2wkapXwcZ1E7CqU1Ym3U7QdU5
	jG2avuPKMT+2DRIC2DITl5emNzl9Toq/1jEHyabI43biFha4Nqc1jBbZ3ZvZEhTD
	U0Wlaf7D6gOqLXJojshthmaZoJ9Mql4++YZ86IN/0eG72W731IeT7BosIkcGH7KF
	9GND9E4s/Y8uwHzWPEGtLOlgj5Dzp396xClRPYur0iIZKH9be8eaLBlXZkLOAKr8
	NG+on38nPoRLoGGIIRLHYZoYiW1IjwbprKTaGBSmxq+Bj7ozmn0SpuVanN90oU0z
	j0VQZwTJWe1uCWq3H3IppA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020136.outbound.protection.outlook.com [52.101.201.136])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j242mjb3e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 10:11:52 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVuTa6Kd/n25NiZB5JNC+5e1NWECIxbcaZwZw0cOhiPM5MorAZS2EAn3aPKRgNuipCdGMRu1Xo1ktlSvZsX6sHKSs2QZR4PpJbHofKS3/wLf/WcInRBo0vuPn/7b0Fs4mc+W0JuEnHLV0N+Wr1VlBkLlgtDs5rl68fsg5/fK1T+k2NnzBpDc1rYCBZQM8WQNvYo+GulLBDIjr6EKWcCNOifJ2A8G9Pmzx3aCoWw5tNLK1hRiMTj4ICT74yRJuu0uKHtieC6mG20uJ0gVcP0n6TVDf5016XnIyI4FoVbtt2VQ9el6DCrpEEowvJYmoIFzn2EOF84WP1T1JbtSO3cFeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KFd5MiQ60uBF3UC60eFTxmCSngWN3R/qdB8PMOamRA=;
 b=vHu8fUWaB3Z/rHPBkxA1bjNfUfqxdx/Nld0KSXOln+ndkeEOhyAicKNrXYSosGJUT8h/eXNNxRYZ3n45MKHxvA0aUhpqx0OrkCLyprVJ8aFcrsJnbI5MDmy9wOPKPTWtKeR/i8cnbf1Z5yla2ielt8ctlivAO7uMqd1fAi1s1Qgc3sWVwPYdXqvoXGbwccPpiBU+3/3VckCDPwYn+9yqxsIqS0dEsmvpsJwJ8IXgOfZhFDyQpgUMxa7mAbOVCj5crdp6JsTesl8iZbfzFY4MRipq2F3GPUoqGDUSlLAKW4aF2W9pIgipwGrP/LInmybAHqg+9e6n7HQvEtLUoGhEIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KFd5MiQ60uBF3UC60eFTxmCSngWN3R/qdB8PMOamRA=;
 b=Z64WFR7yj9orPp9TE+HHlgtoDh27zgW+DCoMY7Mxm2M5pTncCzKc44j/0I8lPgMVZP7xTV8tKoimjl4YPGFlXGAxDuivWan8G32ULlZebYtZIjTKMvS2lFFvp0swKV1D46Ew48zd4ZmazhzQcPi0rPizcS7S+I32J7m2TRv4QSI=
Received: from PH0P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::32)
 by PH3PPFDFB037F57.namprd19.prod.outlook.com (2603:10b6:518:1::c58) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:11:48 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::ac) by PH0P220CA0019.outlook.office365.com
 (2603:10b6:510:d3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 16:11:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 16:11:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0A13F406555;
	Fri, 20 Nov 2026 16:11:46 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CDC60822542;
	Fri, 20 Nov 2026 16:11:45 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/7] ALSA: hda: cs35l41: Remove redundant lock_system_sleep() calls
Date: Fri, 20 Nov 2026 16:10:47 +0000
Message-ID: <20261120161136.157593-2-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|PH3PPFDFB037F57:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: efe7b513-2d6c-411e-8a23-08df4720fa72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|61400799027|82310400026|10067099003|11063799006|56012099006|261009223027099003|261021123027099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	Ix05ITdQYgol4xiMdIqwyqS9AeGWk5QjlnBZZ11rz6pBZ0FJaVVSHyHBK+y5t2NJV5oAG7t8m8JfxzMNABK6TCwt6aDJFx2mHc/MenJgYU/o6VMHKYxjZSuODIQETExWyoy1CXW2/DI+2DXQemoEsUOgtqHV9o6lsy3+3Rlx7kw3mAcFPAgRNvEE7IQH8xUpI6ADIo8NEb6I/CqU/l7+Fn54tQXnyVEFwjUWGHjEljzZNJCRrK/SiZKw0EzBejVEPQ2nrbYk75oUEN4UZd+PCqM1Ocz6TF/44reK7yOgvWgCDYzoAxg7YqscQ22onWS88cqhDPoXIALWq0joeyzmEZXrNiUSclS5YBWhCTOQaxTTzQcbbADchLv0WILT8A1PVERsVkTQYzBy5pf5R0vKkPpVFpVTHmezzuazQE8g8y3Fgd2mcDpgB8ibwYS+uCPUzJ+KQvVDRBmTAXxG+5ElbuyMOY5+PKz61Xs6FSi4S3/hGu31Tkj+JmzkzC3iuvqPauxBmE9xcR7j7ZpQpxGWiIlVsA3SzYdcWeZPM5aD8PSWfi8/zfw/Oenw83LO2TpJFgfrmosweio5sprtF5K+fUhvNIQwmwMhRRCvr36QhB14uHQm0tSKdBMpSLTw04MHMRBH+OaKn3CwcJaFZZUg3pNTkkTLAG+HC9yn6vGw3sCuquWmSk0rBoywwU7Z592DFHuZ0K0IaOYrTxmyMJ6YRQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(61400799027)(82310400026)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wv8bPQkzsNCqkbXOkxxh5tclE51sXBkTbRKinIY7Vm21MvRJKKezliKggPp4lR1smHIALYBGxRIssvWpeb+P+2CYCikU5XHV8C8+PCKAkxRzxQ8fTlSeB6Q9BD3ivTRpbXwpH5hq+SSvyi5699DCLc6RaE2TZCMMCorsFTuODY09WIVYx4cFXVC7kZ27kKVciVroCZKEJBISXphmdBT6fxAm18iLZMV7YM0QQc92IMFrmwL9oLdWeXfat5JuS8WegGEVJVjVeDdrzADIoLMVS07V7nXs5bA0vJ4DrUIytUwUDhmaSf+eqAqxCc5AtGaPbbt6uZ3ZQometBzZTnKNwNKOmSbPXYTE2lLkMghwMowyo2RkyCBJNStE0sDze19R9T2+9h4/BeNBEYXpUYRV4wAvdoLymDOLmOFJ56zMXiIF7UAaQ+NwJBkg61UQPP3J
X-Exchange-RoutingPolicyChecked:
	e713PkMZ7Be4t3Je52csGRvWJsaEbSoMXES7+SehiU1k3IZOPr7IxsMK7dO8OsD1upUT1BU9Qre+wcRqT8hEg9hUpiqVoRvRNWuyQMbBZ7pzZ5eCMwanypCNQ+OyZvSx8U67KDOBRk9NJFu2jGBc7FrCSSbWqmVtxzVMa7d5uVbb/h14ogyrcfqTVpV3zqGhZXCcNTOiHFFL5oxeBdSh31IXit4ZBz8DrTp01rEsYLlyhMu1AphydZ773s6X+GolMCKvhByyurFkbMbDJo2+H1lVRqW+wuhtbl1MSbiLFj6g8NBm80UMuZNWKRwiLpUFjxjC/AP+DCcnaJesHAqJNg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:11:47.3075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efe7b513-2d6c-411e-8a23-08df4720fa72
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFDFB037F57
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfXyddFNw+kq+oc
 BF5/bIvntvx7OvU4UOXbqtLrYOA0o9Rt5EQSSWzbchYkVb+APgSpYUFHNAZ8kSVfsBQo/ye98g/
 IUTc+1Inw8pzzMh0IDG1gb0JBLoPAikK4G4DbYOMKugfDIA48t+Djln3GWJQmi7mkrx/PYpV/KY
 0c42aAdLKI1FKrXv4ulx219+AsY+n4i9OpTUQeubUrWCWKhRScOtPsrsTHaokW8sAI9sNGuSUqg
 DvZVS4BbxHZCOkA2w37WMJxm1mJcDrwxM+O37rwp5G9WF/ozhCDqo1cHeorg1A+hFSEFrztBt7V
 TpMv+fMp+Yma/nECu91qNdBNXEyC2EKJ8lw7joCs50sb8Zb7CY7OZjexrpUri2szKE36agUsenM
 7qHrVsuFQzVFMXpHIUn3gV6LRrE9sO3d+BH4sJ3gA9YFzZECBL+IqWkPw92lJlDeP8zBNNKDE4D
 HFrE6XwuiKZ6pR8rHIA==
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6b007148 cx=c_pps
 a=SjKxu3n00dGHhKqS4WZ18w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=Zas6cWl2SmAYx1GdacIA:9
X-Proofpoint-ORIG-GUID: 9jGQw63pdGvsgVTvlh0RKu1oClBvucbd
X-Proofpoint-GUID: 9jGQw63pdGvsgVTvlh0RKu1oClBvucbd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX6SnJggN12OGd
 U60WwBJbN7HrJlB9iYzMoU8dHl+y5sGV68DCvmHWyHWm73+nIwMPKQOrrA9DruXWMQDObBAdMiM
 79vZjiKeZ6Z9j04lz0+FKEDdo8GQ7Vw=
X-Proofpoint-Spam-Reason: safe

These calls are there to prevent sleep when adding or removing device
links in the bind/unbind calls. However, since these calls occur in
probe and remove calls, where sleep is blocked, this is unnecessary.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index 919630c11018..f6910916ad47 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -1443,7 +1443,6 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 	struct hda_component_parent *parent = master_data;
 	struct hda_component *comp;
-	unsigned int sleep_flags;
 	int ret = 0;
 
 	comp = hda_component_from_index(parent, cs35l41->index);
@@ -1492,10 +1491,8 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	mutex_unlock(&cs35l41->fw_mutex);
 
-	sleep_flags = lock_system_sleep();
 	if (!device_link_add(&cs35l41->codec->core.dev, cs35l41->dev, DL_FLAG_STATELESS))
 		dev_warn(dev, "Unable to create device link\n");
-	unlock_system_sleep(sleep_flags);
 
 	dev_info(cs35l41->dev,
 		 "CS35L41 Bound - SSID: %s, BST: %d, VSPK: %d, CH: %c, FW EN: %d, SPKID: %d\n",
@@ -1512,16 +1509,13 @@ static void cs35l41_hda_unbind(struct device *dev, struct device *master, void *
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 	struct hda_component_parent *parent = master_data;
 	struct hda_component *comp;
-	unsigned int sleep_flags;
 
 	comp = hda_component_from_index(parent, cs35l41->index);
 	if (!comp)
 		return;
 
 	if (comp->dev == dev) {
-		sleep_flags = lock_system_sleep();
 		device_link_remove(&cs35l41->codec->core.dev, cs35l41->dev);
-		unlock_system_sleep(sleep_flags);
 		memset(comp, 0, sizeof(*comp));
 
 		cs35l41_remove_controls(cs35l41);
-- 
2.43.0

