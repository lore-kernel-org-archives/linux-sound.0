Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795779657;
	b=2p1tpLmrzq2VPw52fqDtR89G3eBIKYTnc01vGBU/csSqK798H7WZbwK+vYBQ0zw5LdIn
	 HheoeOZBZqMfaZGo/Flc2L32UDsDLYV1rnF9cI5dAfWMaNG2TrgHU+7EuNhKdTzaTfvtl
	 hp1M7f5lgwY/7hftRZW0a5mjp+O+GivE9HK3Iav89isPnfutwPcQEhYLym+GFV+njXr72
	 tLZV68jsly9Us4g5VXIG1Wb7hPHP+yH1RslWP+nV0DuDENviTBJPYp8SPe2gzFzWA5InZ
	 ie0xiORd0ye138ts9ciRNsh0PTKcdkMBT5yuTYRQpxS9nw+vsS/ef5ZYdA0sYIXYR/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779657;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=LEYchlechmKarttES7durPyWbkLWrKpDuLqOs9ElU6w=;
	b=a3N8WMG/NkvJcyqawrCxtYp1P2pd0Wmnh/LAN+WSJzPj+LlcfMeF9lFMOMBYrB1jY55T
	 aG3r1lqkGWiend3cadkfZvyurZ8Du/pYOgyQqPakXcJakZvaCxBKuU/QDTPCsAt6SNbbe
	 gxx1Y8mi+bjFTDlZtNMOesGirg9eFfFLUaQebZE0OmP+shT/wDRQqdutC7SgAJ4STz31B
	 BZhJgTzRs7I5E47/Z8tKkC5OZvLk1lNdqUe+9Z7ZNsg4FTEckmljtB/u2gZ0ZzbYaxelm
	 XDR9DvvGNAxJzD9SgvD4CTsF2RuG0So9bmMxcXbk/aH2WwwS6ael+7t1zxufSSFitug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="AmpYY2a/";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=TuF4b7wd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FEB606A32D;
	Fri, 27 Nov 2026 11:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3FEB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=AmpYY2a/;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=TuF4b7wd
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARBNDab749506;
	Fri, 27 Nov 2026 05:40:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=LEYchlechmKarttES7durPyWbkLWrKpDuLqOs9ElU6w=; b=
	AmpYY2a/n6reJRjK3tm045w85S50F+azbPS3jaLO8/f/S3E/torecSvN9gw5y9oq
	CpFbz6naFA6ETDlMAQX5bKyu32Pc7iGFra27d46h5Gdr6DkfKdoyJjBCz4CwgC53
	8tn04Nq9VHflnBelhNfQplNGbRuRgW6Roo8gAH7WYqHq6izCUinbJNXXxWIIvO36
	1VVDvzIzukgigGIWZ2nPwdRVbBr5+ydW1Mr1TY9upRBwytVCgeB41dB91RfgfZvj
	MA1cx3mCWTG9T0ve2VbIHQ+arNVnjgGqwYd9fsFiJCi62jXyaOxBfmltT6I49OWN
	7/lP3/Tse09jSvjnnMAKLg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020094.outbound.protection.outlook.com [40.93.198.94])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j78xng0fv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 05:40:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fz41f2EsNEh2oCuEdvLCDEHOG2Mm5Bin/plLAjHVY8+KLCZPDSEYNzmqQaLiNTzHt5F+PYMKEDnHg78Jm4yIdf8RLF1t5+QEGURV0HU61M1358V46AtSSftdQL4l/brTzzXFHIcSpD9pUwYgniruQFzdArU5+uwy5vT8Oa0DbRaVC8VCn2iShNsMNOWK2+fKGUPYOH4iwMDlSbfPjWemOMXxGFlHAggKp7mPzTuaW3D1mnbpOrWRMB2NJlPLTLHYvwDUlBra4mgQpz+FIGkQoci06bbv7U4RL/hKIUZK5oMf8pYEBMB8cq6bX0DpkVl9TofoSMipHqHAHku8YBSFlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEYchlechmKarttES7durPyWbkLWrKpDuLqOs9ElU6w=;
 b=YHFKrW1y8KtYYorSRqMHR7YNh/vqhY0q65H78TNBPBYIvWBd/nTnpPNQAik+qTsjA576YM3R6GdcqR8jiWuyJ0DHOUgv6dczBwm7TAODVEvf77j4e47u+1cNv52ID8NmjksmIfh/vlWGMpiWbT7d0xTPYEbm+MsL0IXKtsPlwys1PmGQuJ+WfcT+pjzdG+fuUkzbmx5eDqKXbkaagIjwXFWH5u1wubizLrdrlGy7mU4SEUXohRdaimlDLn+CDvuAvfRgwOcKGcUa2iomkkP1gIV0EeKRTub8FitCCJa3vOsUG7Got/x58bDbHs4KsAaivBxkhf17RgmbZNxCOLj4/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEYchlechmKarttES7durPyWbkLWrKpDuLqOs9ElU6w=;
 b=TuF4b7wdpXgbQwtsm4zIe5sIFcRt9chpGDvHR87fzAVGIvbijNUozVG+QV9u/CHnhGoxRU3dy5cLxMoZcb1MXWbsO22ikQYWJ54yYsuCxuCsE23lSJ/j48r6X0au7ypqT7b/anbgd86sXDprO21TqmgtHtTD/SKzZ9Ix2cqtkAk=
Received: from PH7P221CA0056.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::30)
 by DSVPR19MB997499.namprd19.prod.outlook.com (2603:10b6:8:3bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 11:40:40 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::41) by PH7P221CA0056.outlook.office365.com
 (2603:10b6:510:33c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.10 via Frontend Transport; Fri,
 27 Nov 2026 11:40:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Fri, 27 Nov 2026 11:40:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0A690406553;
	Fri, 27 Nov 2026 11:40:38 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 061D782024C;
	Fri, 27 Nov 2026 11:40:38 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] firmware: cs_dsp: Store control cache data in struct cs_dsp_coeff_ctl
Date: Fri, 27 Nov 2026 11:40:37 +0000
Message-ID: <20261127114037.2010271-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127114037.2010271-1-rf@opensource.cirrus.com>
References: <20261127114037.2010271-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|DSVPR19MB997499:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 174a1b36-40a0-4708-4b97-08df4c7b42ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|36860700016|82310400026|376014|10067099003|56012099006|261026130827099003|261026135527099003|261026121527099003|261026140227099003|261022115727099003|261028144727099003|261022075727099003|261022113327099003|261022105027099003|261021135927099003|261021121427099003|261021130227099003|261021123027099003|261021133027099003|261102123227099003|261009223027099003|16102099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	e3UWgsqiSnMpHMkVWb5yPQ/3fWslY/NbWlYULtPuVktDRZzzSBEuaeQmKw/UPoGwfujvElK7YuE58uL5KSY14ccRCks5vK7tJajw1lJifge+cOFMCjviNIkstesb+HKGwn/+pzqY2Vmw1Yamj+j1n83LBzo0GnPaZVCUE277/ObSsnPIn/oLOjEbNuaXqSkrnCbyGo77W50RT0b8hUcZmQg24D87bD0XsdiaBVFJmqBGtfLTIQdWjxnWfXvGRfuC15nYz50LAk5eOyWtKBFZ/4sgNhaGcZCBizOPxHEJZIV1jsOFFb+3+8zSHWhHJpEdtW3N+c8xLc8O1CksuSPBEY37RLzNpPetnUuHWgFtakodpueBhqQthyCP00Wph1MCp1YZffWHxdHBC7VFok7cNz2+gTJw20Xqw0Yn9Ec5yCb+Asl2OiJrQREkp9EzgthWTE5COS7O45QAhQysh48ZywV74CEWMWqh0cKV0qNhLZqFVn1ZCC9yHG36n5DUX0PYQ54pgQnFDGLjulyEzHLVY+N+qEWXDniYjIiSv4/0P0F5qSuihAobwJKGvKb1x9Wl8TKQ8nu5I+aj6QyZeU0rPYE8MM1NmX876+WE9brtUUbLSjC0oix8eFQoxE/SkivmtVkJGqYwLOKCzM1QKOII+6mRO7MZcIFkY4QaZm2cPsu1KI3ZurtoNufpRqiJyP1xOFtwVH0oAtCCjcUE7dpaPA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(36860700016)(82310400026)(376014)(10067099003)(56012099006)(261026130827099003)(261026135527099003)(261026121527099003)(261026140227099003)(261022115727099003)(261028144727099003)(261022075727099003)(261022113327099003)(261022105027099003)(261021135927099003)(261021121427099003)(261021130227099003)(261021123027099003)(261021133027099003)(261102123227099003)(261009223027099003)(16102099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3k8aG/DrB+JEcVb8OBeIUFibIBiCo9SLgKu8SxwTl+x/eh75JwQwX6iU5U8bVay61LJ5PlAe2yo8z9skMfInjJ4v30ryd39VTf8/XwM420NszZk0TXOrw5LcVPxZhh/Gp9AOUlox17HG2pG6y2RFUiy+gdlTN0BokQGN9tS5DfjS758XRFgu2gET5DrsBSgI7MIUiL4snuaJ8UxnDe04KAs6v0NhQFlvAYAOCNT7LtX2eC8bBh88ozV8H3qAjasK5MZm6l9R/JIe6VOvZyP4kspE2mB1kdWUmJeCdbi7ZyQeHmTY6J+h6RUjdL2LcAnpOOVO3u7PfinNaVAzwSDz2m3+eVOwZNPdju2uv/hTcMYpXcAupnbWVE9VQJvDq5ZYar3vTI1MSNSvyzghg/bD7XLSffJJvgIPBvKkhj8GN/YABKwnQdnsBHwtXx2MSS7x
X-Exchange-RoutingPolicyChecked:
	lgxsnXeg1WACfSaqwtmhjyH9Da77j9x/rFt1E9/haG6EWhVXFBkupF8oi4iMCs8BXKCJnOx6XFH/RlZFz/6ISAeTnlgh29EztgWejQ7FXfweh9VgxykwnleP78/bwqbXQG0bwvetMVTSVUaFgENLzaBdPVzfg2nrhDP8w37Ngie/Tv2bfWzDirLO5ku6ZttAzbNzJSPm8h7JsdYCFGkoYnJ1glQsVllriruGbEursn9sRQ/lBN1CfQK17F36GO9rJImJKzCBQi58K7dVSPCZqUYwb6BxZM3RbKyI7avdCJiz1W/waKtX+5OUB9GU4R0EmaMunD8i5YUbiBw8949FGQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:40:39.4066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 174a1b36-40a0-4708-4b97-08df4c7b42ea
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR19MB997499
X-Proofpoint-GUID: msGwEF_JBIOyZ6Zwbq9QE3sT5J6eglXP
X-Proofpoint-ORIG-GUID: msGwEF_JBIOyZ6Zwbq9QE3sT5J6eglXP
X-Authority-Analysis: v=2.4 cv=G6qJgNk5 c=1 sm=1 tr=0 ts=6b096c3d cx=c_pps
 a=ABo25xnPk+aZkcFaU7OOpQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=gr1vxWm1LVW3e9slYY4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfXzl2OLqXyiNns
 +y7EgZfBbqXKZBjSlnWmIvLqpqryLBv7v6Fiwk1RNsh7cc28rI5eAD4rkOr5U9OJowAXOPAKpOV
 9pqpUjAAH0nXRlDYyi0csdw4U8nwEkp6zRAAdOYYeRQueg0sauZAoJhUlqTm4jhnzZFhaSMuG6f
 e2xBslM8RhsVULbkeVocKeKE4oYj6Rwc6x3kHDEA1R+ODwhg+2ToJT72TMW/53pP/92O4dKSrgR
 s4BqjgS8mCC1JMvs8SlR6FRPEJ1W0lLVgKwiziwakPpzg+ZAZIz3zXwB1qakSc0y/1zZMW5WmHh
 hgFjrTeKRPi/k57kBQbgBJ5nRzoJ0r5rW9mb6ecAjuoOfl9E/8DUnHo9IOtQOv9833/TH9yEyc5
 r0sy2NwNLlOB0OlBg/v+TUTDVxZSeVx26i0Yp7Vzufy29+yXcssCCn87DYlrrfdaFsGK0/Cb0Go
 jVfAI9be4HBzsBgjFuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfXw+1bMxOXUOYr
 qqZS7C1FRj7CTdkoLM9Z+U8jwYayhbnSGs+Zz7s04zC3Cqh6xW85Ccbg75xNodm3M/Ud8p/mU2l
 u73jx6xumoseyPypFdZavGumi9REa1I=
X-Proofpoint-Spam-Reason: safe

Make the 'cache' member of struct cs_dsp_coeff_ctl a variable-length array
instead of a pointer to another block of memory. This needs a small update
to one KUnit test case to correctly check the expected length of the
allocated memory block.

The code originally allocated a block of memory for the data cache and
stored a pointer to that cache in struct cs_dsp_coeff_ctl. But most
controls are only 4 bytes, so this was wasteful on memory. On 64-bit
machines at least 12 bytes were used to store 4 bytes of data, and there
were extra wasted bytes from alignment and kmalloc block sizes. The data
can be stored directly in the struct cs_dsp_coeff_ctl in a variable-length
array.

On an x86_64 build:
Before:
                                                     total      total
 sizeof(*ctl) ksize(ctl) ctl->len ksize(ctl->cache) requested allocated
     88         96          4            8             92        104

After:
     80         96          4                          84         96

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c              | 19 ++++++-------------
 .../cirrus/test/cs_dsp_test_control_cache.c   |  5 +++--
 include/linux/firmware/cirrus/cs_dsp.h        |  5 +++--
 3 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index b9e4b9283df1..bb8e7c70ea49 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -19,6 +19,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
+#include <linux/overflow.h>
 #include <linux/ratelimit.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
@@ -824,7 +825,7 @@ int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl,
 
 	if (ctl->flags & WMFW_CTL_FLAG_VOLATILE) {
 		ret = -EPERM;
-	} else if (buf != ctl->cache) {
+	} else if (buf != &ctl->cache[0]) {
 		if (memcmp(ctl->cache + off * sizeof(u32), buf, len))
 			memcpy(ctl->cache + off * sizeof(u32), buf, len);
 		else
@@ -933,7 +934,7 @@ int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl,
 		if (!ctl->flags && ctl->enabled && ctl->dsp->running && !ctl->dsp->hibernating)
 			ret = cs_dsp_coeff_read_ctrl_raw(ctl, 0, ctl->cache, ctl->len);
 
-		if (buf != ctl->cache)
+		if (buf != &ctl->cache[0])
 			memcpy(buf, ctl->cache + off * sizeof(u32), len);
 	}
 
@@ -1036,9 +1037,8 @@ static void cs_dsp_signal_event_controls(struct cs_dsp *dsp,
 
 static void cs_dsp_free_ctl_blk(struct cs_dsp_coeff_ctl *ctl)
 {
-	kvfree(ctl->cache);
 	kfree(ctl->subname);
-	kfree(ctl);
+	kvfree(ctl);
 }
 
 static int cs_dsp_create_control(struct cs_dsp *dsp,
@@ -1064,7 +1064,7 @@ static int cs_dsp_create_control(struct cs_dsp *dsp,
 		}
 	}
 
-	ctl = kzalloc_obj(*ctl);
+	ctl = kvzalloc_flex(*ctl, cache, len);
 	if (!ctl)
 		return -ENOMEM;
 
@@ -1086,11 +1086,6 @@ static int cs_dsp_create_control(struct cs_dsp *dsp,
 	ctl->type = type;
 	ctl->offset = offset;
 	ctl->len = len;
-	ctl->cache = kvzalloc(ctl->len, GFP_KERNEL);
-	if (!ctl->cache) {
-		ret = -ENOMEM;
-		goto err_ctl_subname;
-	}
 
 	list_add(&ctl->list, &dsp->ctl_list);
 
@@ -1104,11 +1099,9 @@ static int cs_dsp_create_control(struct cs_dsp *dsp,
 
 err_list_del:
 	list_del(&ctl->list);
-	kvfree(ctl->cache);
-err_ctl_subname:
 	kfree(ctl->subname);
 err_ctl:
-	kfree(ctl);
+	kvfree(ctl);
 
 	return ret;
 }
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_control_cache.c b/drivers/firmware/cirrus/test/cs_dsp_test_control_cache.c
index b03cd7c37f6e..7a9f939fcf6f 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_control_cache.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_control_cache.c
@@ -13,6 +13,7 @@
 #include <linux/firmware/cirrus/cs_dsp_test_utils.h>
 #include <linux/firmware/cirrus/wmfw.h>
 #include <linux/list.h>
+#include <linux/overflow.h>
 #include <linux/random.h>
 #include <linux/regmap.h>
 
@@ -186,9 +187,9 @@ static void cs_dsp_ctl_v2_cache_alloc(struct kunit *test)
 
 	KUNIT_EXPECT_EQ(test, list_count_nodes(&dsp->ctl_list), num_ctls);
 
-	/* Check that the block allocated for the cache is large enough */
+	/* Check that the allocation holds the control and its cache */
 	list_for_each_entry(ctl, &dsp->ctl_list, list)
-		KUNIT_EXPECT_GE(test, ksize(ctl->cache), ctl->len);
+		KUNIT_EXPECT_GE(test, ksize(ctl), struct_size(ctl, cache, ctl->len));
 }
 
 /*
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 16542bdce5c4..b2492c55660c 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -80,7 +80,6 @@ struct cs_dsp_alg_region {
  * struct cs_dsp_coeff_ctl - Describes a coefficient control
  * @list:		List node for internal use
  * @dsp:		DSP instance associated with this control
- * @cache:		Cached value of the control
  * @fw_name:		Name of the firmware
  * @subname:		Name of the control parsed from the WMFW
  * @subname_len:	Length of subname
@@ -92,11 +91,11 @@ struct cs_dsp_alg_region {
  * @enabled:		Flag indicating whether control is enabled
  * @alg_region:		Logical region associated with this control
  * @priv:		For use by the client
+ * @cache:		Cached value of the control
  */
 struct cs_dsp_coeff_ctl {
 	struct list_head list;
 	struct cs_dsp *dsp;
-	void *cache __counted_by_ptr(len);
 	const char *fw_name;
 	/* Subname is needed to match with firmware */
 	const char *subname;
@@ -110,6 +109,8 @@ struct cs_dsp_coeff_ctl {
 	struct cs_dsp_alg_region alg_region;
 
 	void *priv;
+
+	u8 cache[] __counted_by(len);
 };
 
 struct cs_dsp_ops;
-- 
2.47.3

