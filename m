Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604958;
	b=FjzB0Xq5B75Hirr2ZWjmHmWBA6GXorcEpZd9ntENpjq/CPRDrEbbXgFbxGkpdhCli3yd
	 WqunK6op5aG1oluSDjFBPswZ4PDeOqUG7XYls05rNCvv57AuoXleNsIufNecY1R5wFDGG
	 RJY73FJe0+suQIVNmqWjo496MjWYvbBWdAUXUzU1lcBFLHtxo3+3lSu3+ICh/3mPQEKvM
	 A/XZr8zHg0cYCFFKwRq7w1H985HdDG6Cjo5U9+HEGkeQuSF5fBN/fk9GBser5hu6oQmZI
	 lBHp4mXg4px/PnsrVTAkhkd9fWY95gQY4m45KBaqN1JqT2NM+q9dWGb7q307KzRHPAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=Fbt9yS98MNKl/o8KaR+FZJd5y0Fn8+veA7RRCMNZMiU=;
	b=lpOe7rvG7TMQz1UwINE3ePNCxkmM84QjxG9gurJ3mrDDMJdJsS53sYXmytKLx7NLHVgM
	 N1ySIvIBtEEKOYWW4Z4zAsejJ6jN3UdUakiCRdBPYvME608cfAzd42dJdbINNCaRColwq
	 P6GbLBwRmvrIWCa9L5L4Lchelq0YO1emmtkF9qGs2q2tjxSV062ci9D1014aIHkW/u1nG
	 w0oM4CWaiapFF4gD56dbrQGi/ZpKNQ22oF0Epcr/G4ZN8uDqUu8ax+po/Ty+1G2l7JT47
	 eUhtxmk3Y4TxjRzWGJGCvfLJpA2RUp+7+72i3NgAQGVlz8Q3gMWF0pEjjEamkNxtT6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=OlrSHKGl;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=QIbkVGeF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82069606A335;
	Wed, 25 Nov 2026 11:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82069606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=OlrSHKGl;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=QIbkVGeF
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APAkYcU003569;
	Wed, 25 Nov 2026 05:09:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Fbt9yS98MNKl/o8K
	aR+FZJd5y0Fn8+veA7RRCMNZMiU=; b=OlrSHKGlZv0gyuGm1Q+1GSdGb5xuefnu
	QeLQ7l57kH5wlXuJDEIdvoaRg19YbLmg1xjEO1PflKrn+1VV+RVTQF4CXgYt1Vk/
	0IOpdJKaUYr+TsjSnZksADZE8lv+417Ol7p8qYssUGUoO8/uyZ0E3YEC4pKVmUf/
	aOW3isu7fBtwz7m/5M8uBFKXy9fMWflokB1vymVE6V84EREwa4ysGroINRKuuzok
	iIztTjCGacchS5ocNBYGx4x6yoRD1kouPB0jK737XLY+J57jXGvuKTDXEsZv9Ns/
	G/halSL+n4bJvj+WjX8XhbYovt2oF1D2F97Q73SlCgd+s+rfm8PHcQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021129.outbound.protection.outlook.com [52.101.57.129])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jah19-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:08:59 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jmu40ZfI+5+6z+NGciC8LI1s5/E54lA/3GsDpWnnSjMxVmxID4fZv+plPaMNJm9bcEZjEKYqyYdjbcntdeMiO9OAPpatn9/DjWd1SgSg4G0BOD4l0qGQ+EElr21XCC7KZ1kOOYx4RZyksZAM2m9gWyV7nsH40PyCWFLWz/Cp5wjuwPgwrbWzIZivk5pbdZzOMMpB/JkTxS1sy+ep9iiLSndpGQ/xlEUDo+JiN8ORuazIB7lnslRjy9N0X7hxmfs3mi95CalHKQ7XBkBIaHfDBpYQr1Wf1SA1j3AvvFXevoBCG3T2YWD5JqUOvIH7ssRiUL2WwePirr0Qndz7/fU9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fbt9yS98MNKl/o8KaR+FZJd5y0Fn8+veA7RRCMNZMiU=;
 b=hP26jALdWP2cHgzYtZkzG3qYBNi1zPX50EFux1iqd0XvXvOj5KWkr65/K7dmudM2oiXbXX9T+m9U5+ju92LxmCg/o6aD3yJfAlCOyoK0DCZHlr7MwxqSKjHfOmOlGmSsEmdz6u7dvFDe3DsPDyojmBxRSxzqwsQr3cBVzNJIPzvktsy5ZaKVp632Poxq/n+AcH7Pqiq6CEjVNVQLMFnBL/8Zy8enlTGnNGmRXiXvyvSs3lkz76O8Iqto/xvzq+gK6zAI0wvm/JGOSlBzaXNCJ9Hrc2i5ZUanVf6EBxA+kpz8yqmofa3DpAyEMxV0xBfCkTI78MNSqUXUXjzflLB04Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fbt9yS98MNKl/o8KaR+FZJd5y0Fn8+veA7RRCMNZMiU=;
 b=QIbkVGeFcP9zM8hPri1hxHQO8pFoItrdPffJO9XsAz9nZGPNldEWEm1yGw5ZViDXnY6h3tIGb4Q8TFNNEg2zFP4DW7ZCvslswnHRtRR5tV4mrG3cjTEGhTFRPdznHW9RWvU4GsfmkOICUUMHXvC2HfuLj/ftzCFCjozKf7PrT5k=
Received: from CY5PR19CA0054.namprd19.prod.outlook.com (2603:10b6:930:1a::15)
 by PH7PR19MB5726.namprd19.prod.outlook.com (2603:10b6:510:1d1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 11:08:56 +0000
Received: from CY5PEPF00000E88.namprd05.prod.outlook.com
 (2603:10b6:930:1a:cafe::61) by CY5PR19CA0054.outlook.office365.com
 (2603:10b6:930:1a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:08:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY5PEPF00000E88.mail.protection.outlook.com (10.167.247.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Wed, 25 Nov 2026 11:08:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F1038406550;
	Wed, 25 Nov 2026 11:08:53 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DC5EA822542;
	Wed, 25 Nov 2026 11:08:53 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH RESEND 0/4] ASoC: cs35l56: Prepare for SDCA Companion Amp
Date: Wed, 25 Nov 2026 11:08:49 +0000
Message-ID: <20261125110853.741337-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E88:EE_|PH7PR19MB5726:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7480f0fa-8ec8-4004-f1c3-08df4ae47f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|30052699003|376014|61400799027|36860700016|16102099003|18002099003|3023799007|56012099006|11063799006|261028144727099003|261102123227099003|261022075727099003|261021123027099003|261026121527099003|261021121427099003|261009223027099003|261022105027099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	5zSvh1KaTYat1/D9nOtB8lED7+ZduSyit1riSnqeAyahBRWQTnDoTjn2gwPniXX7oweWx8USoJQpSNuHB5DXSdLkxtBsV9cMgPzGzDdZIowTdNXWs9TK4g7f90hzRgbkFuT98pajq+cmqgOy8cpoTdmGE+8XSJz+SAcfPoxR1UFUjnwQTE5jdpML6dfZa7E7TFGONGkYWUuZgzc3mA9AebZBLwiZV8wOKa6w+MQa2YOaHJeeOW6pELm4YncX2zJc44ObcTZFJlQLv2vNDr3FlaKZobkoku4+jvcoWJfeUeKrhe2fgMcU3OnGWbbwhVYVhQI6UNidzQfHykPlROhoxKiLxMC5qYnq55RAngFMCgLmjH1wAZxFsBsNTW7GkHPOcE6PU978MqRPcb2DaEsWPz2eNm3ZRM6t3RGJslG4YeODKrYcWt+N3dj4c++mPfcSNwhVSaK6fGQuSotVEtTWFNOrqOUpriDMqEeowAgTwoFUMEgXnWKZ2qjSbCHrMLp+3tFE2hgW5q+raNaFdm7QUVq7Uu6sC+Od4zN+QEH92cyQjMJ/NjHwkMrMjyHJWADK2tUvlpsStRENZW/pGssmFN3k8cBJVbMSkLQyFieZu5xfJhFVYRy9BsJki8a3o31umZ7LmGllfOVOB+GN9Bpj/j7mW1/TLuB3swIRdJQuRDB1wVcr93+E+VNXSVb6qjy5KqrTej87bFJ73/KABzhkZg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(30052699003)(376014)(61400799027)(36860700016)(16102099003)(18002099003)(3023799007)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261022075727099003)(261021123027099003)(261026121527099003)(261021121427099003)(261009223027099003)(261022105027099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1AhXYnzEVw1UfGXlNqSVe3D6sX/Rq+0fNtLyA8P0TY9sM8+Ga2sdr+waZpkprMq4XHSfZyFUJ72mq2sKg9gt6tjLX/OWqZ8oEvBMmaP+7TD2xCwUzxaZvpFYJz+EHs9o0nAn3BpQjEUrZLAj+ls+uYz4mv/P7Jev8lUaui0x5+eujCej2ntUYYgXlK14XgN+6NZyYjNN7KVMQIN+lZdY4bpPr98o/Hq6vgh9LRTAQo7h3dzQsGLRtZxfHelBhtzjtuHNWJ753IwdLbamYg2scMuWBGhleUG2ejXBTpHr1Jzw3kU2mXMlqXjBjOrvFu2DF1W5CHrIwrKWlT4nVRWTcMO3mGnMDY+G4ODkx3cbYFTyKkmD9uTIZUhJ/tr6xEB9SLxKLysUWZKiHLXMxn8/lX79yMWfX51OIQ6sWUA79n6uYM0xlZpnlRXwh7J8Ip7c
X-Exchange-RoutingPolicyChecked:
	Wsaryc2WUa7uVQgB7GGMx+Dx3DcdPEcOdANJxhefsWj6E1jMsSiHw2nO4BDlWZGXwGqGVnJuNqEzkI67pujR4kGm0en4HVMpQDS8RzJCwvLtuyqWUS4XH9itzweO7b60p4GppSbWfs51rVg2BYz8bDQ9D7G7qQObc+xvZuXJQn/pf7Dxd1UbiAXAlE2pgWjml4wo98rXBUAWWA0++gqbx5tJNyqubROtH5g3D83x7E+ZBj9ujko0qGOOhSUZGVOCj8I1drfTA2XFXvGjmQ0/eglcn3IYFgUgeaVUoDXAimdPr2dwTQE7aAs9IsOaXxQq2llthj3ESALehdoA7+rKaQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:08:55.2689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7480f0fa-8ec8-4004-f1c3-08df4ae47f1e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY5PEPF00000E88.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5726
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfXzZi20u0SWLrv
 l/sl/W9zk5GUXxzp9x73VizyJGp+uQsTGb6pYJyjgTAFQK6qI2L8j0twYeUBJ7+1yenNYlLDUO6
 wEAM0GL80XAM0keK0LBQ5FBZofI4Vmqur0FImRzFOt0VPRLfbjaKBo5S3wxVKpUAELim7uK5W3e
 S0PnccuGIjUt6Ui+vmcT1GlPLRFkzQ9QvnetK99EO/gTpiF+swjLP8YEHDgcFutzRJhk+YXYAsV
 BF0AIVD/f/c4qbCbAFg2r9kImyjoM/vc7mO5g5h4G1oIjiK4EN8KU8crmvnFG8Z50wlr/VLARdz
 k99dFcExKg5xoEDUBDkwRbHOd7xRKU/5ubc7LwpQBqu7mWk71i0xhYWnuUY8whsudinO3D2P97m
 7xOgr3N/8zfn3HRHIJYGDBbNyGgJS/D16YDCp3sXUWmeKuJn45Haoa6lz57zwGtdG1DRDeBCt10
 nwkkGqBz+RrtLq0d9xQ==
X-Proofpoint-GUID: DwpRTbH7j1GlfuJJOdh9sGxx-yDabPaB
X-Proofpoint-ORIG-GUID: DwpRTbH7j1GlfuJJOdh9sGxx-yDabPaB
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06c1cb cx=c_pps
 a=0kdhZxwYHPUST2xGnFlr3w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=PxYrg1Jr0SCDMdasFgAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX2SSkeHtgQ07y
 MmfZeA6wxtw1t/Ib0L375psce3DQX7+I6czfj363t3iTPi1qJji/xf8sDgRp27r3QXX61X0gcC2
 qMYbFkNOoZ/mA7lodtFU4h74+veYHQ8=
X-Proofpoint-Spam-Reason: safe

This series removes some unused legacy implementation of the SoundWire DP3
port. This old code conflicts with the actual purpose of DP3 as the SDCA
Companion Amp output.

0001 and 0002 are the two changes to switch the code over to being suitable
for Companion Amp.

0003 cleans up a regmap table that has been made redundant by #1 and #2

0004 is KUnit testing for the changes in #1.
---
Resending because the dependencies have been applied to for-next so these
patches all apply now.

Richard Fitzgerald (4):
  ASoC: cs35l56: Remove SDW1 TX source controls and widgets
  ASoC: cs35l56: Rename the DP3 DAI to cs35l56-ot127
  ASoC: cs35l56: Eliminate trivial regmap patch
  ASoC: cs35l56: Add test that probe() doesn't write SDW mux registers

 sound/soc/codecs/cs35l56-shared.c | 44 +++-------------
 sound/soc/codecs/cs35l56-test.c   | 84 +++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.c        | 55 ++------------------
 3 files changed, 95 insertions(+), 88 deletions(-)

-- 
2.47.3

