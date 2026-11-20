Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172816;
	b=Azicb355pidKT1VQFfwRyLdb2ufRbaaEPQdvRTeSsB/w1mXaGoKF4tCNVxmPiZ/zQ/96
	 p9bHWFDliQHPEFxWZJnyOLMuHMtlUy6oEWhyeDYK6Rgeeqkm8OdbEV4Hk+qCMyBMySvDG
	 v2FhDe5AzIA2UBVFuobyEa7WSTK6kK8BjnTkbcdFU/a5g3Qymq9jIhXCj452MVUCaLRL7
	 85iHi3yEqlbPeP6xjpgoF6GW4WuVge/a3e+oMVzMJYN9l6vqAq33B2Q6UBQ15IjRZsQNn
	 MYmgZFuKypuBQ/TpGh6HnNmykMrark/R8Ap6Ng5nGCioSNBLWUBg7VkL6D5CQ4z0rvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172816;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=A7sxXGT1RaNP1ebKc5BrfPYn5ME4Di1/G30SAuQliXk=;
	b=mUMQpiDvVI2HTbPfCU2ak0z7JwcTgVfipyub6keIHLtEM9P35yUzGQ9intf4kuLPQbQl
	 I7QjW0Gtigd2XGHeGUYCU2MqkOKSAxaqyIEBBkw0Rc7/bqFss+U/UWgb2WZBh7ZlG3IJR
	 WGSQZzQDiISqrB23laSdAKUkN7YmM51g0WcNikAhBJ/rfbPOni6EO2tq5UWiURulGGypI
	 xTcEEqBFpSiqsj2qdlg8iey3z+1kbMj5RdjtcDyA1U62DCY3X5+aHZUufNyQpCpWn/vOM
	 6y47LHrP/CuYXCOs7ubtI0xShgVamNx16Z4DFBUmV5dysgaER8O28hhIQvlVpKKwjxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ejJ21qpL;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=GBmr3lXn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC1F60A2612;
	Fri, 20 Nov 2026 11:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC1F60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ejJ21qpL;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=GBmr3lXn
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK9LrO9256695;
	Fri, 20 Nov 2026 05:06:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=A7sxXGT1RaNP1ebK
	c5BrfPYn5ME4Di1/G30SAuQliXk=; b=ejJ21qpLTlCTQFMpsRw2jd1DCfX1+6IF
	L94z7H5JJvTNQPn2wL3xEOIYd8PULf5fw+5mqXSaIUHG3WON4e+D/emGZ1llDGl8
	xj0NK5mAELRHZzAZxXltIR4Q4A2q07Bc6rTv3xgE/+yfU+OfFBAnqKtfd9gdcnus
	sEUu8RutrkKdNn+S92DvM/5Ge6liT12Ay6MfFDhEYsnEnl4le3zPAjNIVr5QBvd9
	Pb4kZNhbqfi5Cnw3nNTYgj4j/h5181kFOuymK2Qr7ulMODAKKcIOM/Lt1H4QHY6V
	BvXkievm5WZ9Lwa0BhlZ9dkX46zdfcN8eMnyj/77xFIgxrJVOsdvQw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020114.outbound.protection.outlook.com [52.101.56.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j242mhtts-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 05:06:49 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOa6IyL2EhFOG8YEQdEY8ZwO3wo1ckN2CFlmJWlK4mT0zeebuE+Mbyw4l2R+fG2QEa4uDNOgZCeUFOa/3PeSNLM3+j2yLBhV/xrh71lJIEqx4FWLDokj3WILqtFSbhL7iOtwzxqhJ4MZk1qs14ZzzeFbXItHqtAmratahl8O9+L4Tc/LnUPjvATpfGCIs3VKLXQQ3Czm8wRDfhRizYTNZw44eQMPT52iv3+PtRwCwMmMaiba5hB/BFNgcqNnI63I+/gjOTR7WuABMzUJ9aX2LLleZOLQCvCIFta1OrqUdi6IsGgEo/C1u+zc8Sq0dQ2sfnk95jEfkdEfdd/LxDed7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7sxXGT1RaNP1ebKc5BrfPYn5ME4Di1/G30SAuQliXk=;
 b=uI4opd2sNTLZr62kF7pQzxeYWT3um7ZYnW81fWWQHr6CJUwqe1sZYE9GQyhTDQ9kEZczuBjWGeXU4qgw43XvQHJVtYFu40Op7l7/WBsXRFEd2VoV8sZ23E0NN924JAYWMlRfSR8Y6KHRs/rBa16yUtEaWH3/MrUCD6XoWOBpQtBowSWmfARcn/GyQ1EHXq2RmMq7Ul7I87XJ0ZyyRcovTmXsm/RnrXsMenQjvfBTuGLUV+Nrt4QihPFNcPg7J1V9SKCA/TLOngRbkDHuTajsfj77L/0/6vURWnNq9ia6yhQfBC/XftvElxDQCcUhkYhtjV+VtPhiDPhij0Y7E97vww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7sxXGT1RaNP1ebKc5BrfPYn5ME4Di1/G30SAuQliXk=;
 b=GBmr3lXnAPu59DsmUpV/j0tjwk95xqCVv4RyTlY6/0Ae1lLE/wBpt1zKEs3aiYlXyHsnLiVdVnbjeZq+wi6rH1OQEWRTN9C2w65Fb4TT+ytAO0LSmY45gBoxnArL5sKe459XtHlODQGxatmKL0zoMOmLiezw+v9sypxbwlcGHHQ=
Received: from BN0PR03CA0004.namprd03.prod.outlook.com (2603:10b6:408:e6::9)
 by DM4PR19MB6392.namprd19.prod.outlook.com (2603:10b6:8:a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 11:04:44 +0000
Received: from BN3PEPF00022BCE.namprd03.prod.outlook.com
 (2603:10b6:408:e6:cafe::9f) by BN0PR03CA0004.outlook.office365.com
 (2603:10b6:408:e6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 20
 Nov 2026 11:04:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BCE.mail.protection.outlook.com (10.167.248.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 11:04:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4EBFF406555;
	Fri, 20 Nov 2026 11:04:42 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1BE08822540;
	Fri, 20 Nov 2026 11:04:42 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/4] ASoC: cs35l56: Prepare for SDCA Companion Amp
Date: Fri, 20 Nov 2026 11:04:37 +0000
Message-ID: <20261120110441.2163567-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCE:EE_|DM4PR19MB6392:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 90cbf3dc-f56c-43d7-812c-08df46f614fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|23010399003|261009223027099003|18002099003|16102099003|3023799007|13003099007|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261102123227099003|261028144727099003|261026121527099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	wtjAluGl3zH3EwOVXosBpWAh7pC2GOtgguqdi/Z5f7Av4jWD3fHUM/3FMhK9OSw8LDz8UysdFW7xU+KPBhirLxZXbI0tt8pyqxteSHlzc0FEm+wEmvk3ww9CsjB8gRvIvBlR3q6SU1rea8T+GxpJT4NJEtQoBdgEvsa0iTtgvA3WR8V9pG+nE0BBNlh2FkiasQ4+fEXRLkXbrsZYFKcEnaEgAVXdVZSfN5fb7Ayz3HrYucNYmSdS2fCHCVUzThPSiX0eH/+5i2zyTfApoVfAvp6enMivY6KfGIWiFC8WAh+uFQZHnqNzfy7GOX/QeG47zJPsswiPMnIsfEBiVH4SqVMsxZOW6d0Dw7ZE5XfIZ3ZyZkdGB48odBkf8+Y0KVd2E6WE2Lu/jbkJsPnMCGS/AyWBpqzY5zLLcQOLuJURD8ZFqms4OkulI+F13d6XZW2weuPo+heQWjcD92KIqvCHG2pOxBXEmbiuHl/zEqXUrn/cHC5wsuJZ/Su7uXNrH+Nvq7WV5cJrZJ/bsbqdF8rjczDEvISu1wl7GxDOzZ3yQXSGbiJllwCUPbZ5nwtyY0Zcx/J4MqmDsJp8G3VTdfiXkI8ixArP/sFEOGhMs8Viebi7FBtpILwEialtb6cWwi2Rd45a3H4XSud+2zT2urLDqeMSIUwNekmvMo/DiF2WQwc=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(23010399003)(261009223027099003)(18002099003)(16102099003)(3023799007)(13003099007)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261028144727099003)(261026121527099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bj88JFZqOSULqslF6yml6Gw46JgViGqFRagTD6Lxgqo//zMprvlaTsSqVkOkthISXxzzDRkswfg94MP3AbqoMBsNLS0JZNnwUmeYyDBjFTaSgwUlfk012nqvz7BscBzY9geXB4yDpwNndCHxZR+t/UvWVaPl0pdWIKONpGRtCGm1ABGGev/u7gYQfJuCLhSykFe7+7WPHIeV7f8RlK6ucN4h7hh0aDZw0uNKSZWHEHjX/A3VTHJ+LFaWqc6U/7q/g3Nvk+2QxyVXow/a3aiR8KFEc6qcXNXTk8R9EpclhuOeyBUyg3IKWNjR46VJRHPrp09FaadIFR9fB5NHDHbWO83wvWn8+ncXKRIAiFj9ar0f2sjnMEUq831zYYtMkRg77o4C8mDxZwBelaUrQOkkaeFWLnc1wp6I4D/N+8wOKRwsA3/L+KpReT9v9DFbZtxz
X-Exchange-RoutingPolicyChecked:
	U0mJgpIdZjAzz2C6bkZyfyPeqmircX97QWAtV3Jdm5t1JfvDyG/X4iQbiTpOdtn1W3koIA75D5wi2ps4JQyFkJzaPnwOGwa3QgxwbcyXb922YC0ViD5JSIK427SzozsjtqhBdHXema6MIkOGWCMCjsKK8tPm7H49kbCCTe2Zjd5qQp66/MajUzTVnhuSig2ednbbZul0SngyPsI5QyFTi3Xxiyc1EzYg7Clz/SeaMdLIHuCeChrvDQ+5kCy7a8jU8lMo0233NS1sbzTzBr8/1W3iIQsb1A8qWvCIFjTBvPVjPdvHAlhZi0ogyjZNHID0fRqr6XQM8i8bJcrhrZLaQw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:04:43.5758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cbf3dc-f56c-43d7-812c-08df46f614fc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BCE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6392
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfXzNzgBXoWFeu/
 prRXaUsZDrVAcS2/S9TEe+C9TOQ/UkDI6LjXkU7YgHwOUISLqb9wqTxHKg/yPjusUHP40PW06U+
 fywokLdKkANz+vg1mDVQOT9yHqRjfKnGQm5USVdgkHFzo2nrPp2Z8ZV8i3ZuFz6fgS6rksCp/qg
 jcHV4LwUh7uyAFymIwQLl92Pr6avBT8vCgOrWELUHys6ldzgueYHm2jb4mF+rV7bii5DhYBXF1z
 s6/kpCRaTQ5ZMqR11twAx/bLoOPoKXg5eWd4EvQzGKTRRtZ/nzoSVYaypKpUwZ+5Tedz2FFyiBZ
 X22lysU8ZaBhv6WDwSOQoASlHB8eEzBMClI+NvwIqDVX0nAiGyCfitv+5SLWaetlS1BzURHKktc
 hePON0t9lZ8IF4o7X/19BJeS3c9umisSBEPSn/S+Uyu8FL6Dfo6VyXpBYAdtEh+AqNgGyn9z0ZR
 rHT4yD4Y6WTR9h/wKag==
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6b0029c9 cx=c_pps
 a=+29CLaFxg23VDaVrfDag4g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=1bcy2hEaM4oMrmRvnQUA:9
X-Proofpoint-ORIG-GUID: ygCZVG1YlubR8Gh5Yr97bl0RUj8IPF68
X-Proofpoint-GUID: ygCZVG1YlubR8Gh5Yr97bl0RUj8IPF68
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfXyGMxNjHS5aDf
 JbmXzf1Wbv24cTsPOYnWhFi7nF+IwZocoxyzTJPtS9HRzQmgAEiqHkhQ4Dq7qB73cBB9dXTjPc8
 OkVnV/kmOCda9yrLj1LMwqp3xXqB4Ik=
X-Proofpoint-Spam-Reason: safe

This series removes some unused legacy implementation of the SoundWire DP3
port. This old code conflicts with the actual purpose of DP3 as the SDCA
Companion Amp output.

0001 and 0002 are the two changes to switch the code over to being suitable
for Companion Amp.

0003 cleans up a regmap table that has been made redundant by #1 and #2

0004 is KUnit testing for the changes in #1. This patch depends on code
introduced by the previous pending patch:
"ASoC: cs35l56: Add KUnit test that widget init doesn't write ASP registers"
https://lore.kernel.org/linux-sound/20261117154700.840631-1-rf@opensource.cirrus.com/T/#t

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

