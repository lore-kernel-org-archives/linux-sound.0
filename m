Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795536713;
	b=miXZoNReutOdpAeAKwaQ0QlPHLf4JTldtntwGvdXAT5S1ch4VIJtM+SCSDFx4pBWnlGu
	 Fq2+WParwKxgt4Zh+EoW3r4h7VHV5eEWmVDczlcxGi4cpaMifc+NmtGVi9LQO2jotM7RP
	 s/G5kffwrHgHHQClrPSI7pIicop2tDL2uY4nJHunw/CHFw6jBXf3OSkwC4eb2kFj7yJaj
	 jMbDJdHJwOECBhLP1HGxqOfEqiIrthe+DouuNzJ7Iyx8SDyPW4cNtM7CNpOPhzKF6564V
	 dWmTtQP5Y/vXd5wOAyP8VqcU/mQqdI34kVzv9moQ4yTdYpyTmgKhzvQg+ArR+1LtVIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536713;
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
	bh=5B3UsUq4wlDRk7crRiFeefKtO3MZnhzqqzRAosH9X+4=;
	b=cL7WXNU3yxTgVny/2WpDNzmxj7AYHzHmNFARiwiqSXkyQEWyvUa38ybBneFLyeLuMZfc
	 X3cDVL6Xpe1DgdhvbsEmk9E8xkgrSpth4SrFhUQuJGZ/1v4nGdW27yjUDXwXlstaNd7pX
	 QnY6iFwB5eGVA4CNwNE+tfVRvcF9wpOxp8XI5gG3Oj1+Dt+oEPdR2gUobMWcnP+sHhhI8
	 XO6YQZrlEL1R7iwcwoDkAn6EqJxyWGJEoNlkSTbXa8zkDMfV9CCXS0JidAtH6A2iVdzK4
	 6UPgq5/UiTz3TLEpKj+gofRIGYY9UELe2LlBzaXMcufHSrvBFboxkc17EjuBvQSopvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=KvhFCm+0;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=grNvi3G1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1950B606A338;
	Tue, 24 Nov 2026 16:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1950B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=KvhFCm+0;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=grNvi3G1
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFhQwV2257390;
	Tue, 24 Nov 2026 10:11:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=5B3UsUq4wlDRk7crRiFeefKtO3MZnhzqqzRAosH9X+4=; b=
	KvhFCm+0GdRFyFobMoORSGKrTB+ri5032aqu4SNO4gZJ5l8pX3116N/WN9kKp1yh
	ql/KHeEoL+/ubiE1FBPR7Ia1t9UhVRc8eYA9E/JaaBQcdjm+maDI6sqNxO5VLmxj
	JcD1MLMHylvvsKS0xCYLnRUAwQ9bkE852AVkd1bk73usfAru29dZRv31HEwDAgX5
	K4WngfBkC7SSIdqd6jLGrHI6clUKnx70FrODqqlW/ZDYjv0RN17pjNrjAFxpEoAO
	ngElSttgj7UbqS9BgjJ1T2qrPNS9Cffr2stIkuk42/ufEMFVHfU3qP/FwAZMz6NB
	HPqpsKn2EIBycp8t3iwsqw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020102.outbound.protection.outlook.com [40.93.198.102])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519j90n3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 10:11:29 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLzwkUmRlJvTjeN0s7zPGPLfY1Vz9kouT9l0ugoX82X63zuAvetKD4hydSvIK3l0aL11VNzvPPugXVc0lGSy7qsaiorZrVXVbGEqxkDtPaU1oe5CfXSe3iX6FU2EVUILRVtxT0u3FdVwevls8mimBs3rjmUklxanJ8LVL8/Xe6s+Lc4U5JLE5HZWyDjpqVOMZuzzAVbfPDRyvMfsjkKIG48t+3BeSFG4Dp4uNHdDaAmDMROKwc/WvQgcIVksXrfbcG6ldtj9C1NsZKjlejWE6MObBxh/pYcUtA2e+uTXg72K6Wgo/FaXoAducc2C+F99KsnxN9qenT8Y+WPnc5UzDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5B3UsUq4wlDRk7crRiFeefKtO3MZnhzqqzRAosH9X+4=;
 b=wWzeZyc+i38fHLy680pz1GhKHCmK7J5WDCMGp0G4K5prjCRodRW/G3yfkejmxCkE4Z5K9wU1DgZpbYxXAp6nZZ/snklDRTsOTYqW52++a60A06aUvxsSizw0e2vUIv6X/sSPeglf1fsjxCM6VPqNyU4iTgwYfBvHwwmqkTfjvZ2FaTcpGk7EOXfew7fhnERX0fjk8/ZXj6uHBQkMHmuNHis5r2Mbcd2p21vj7lblc44KKom2J04kio0tx1PbBQBoLCmYTnbjrcKx1REMtwUWvaH0FiUVNqi3XXGZI6sDvrgzNtlRoySm81TH9pTPNsr5el0yYfBl+yYI6KHlYyiFYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5B3UsUq4wlDRk7crRiFeefKtO3MZnhzqqzRAosH9X+4=;
 b=grNvi3G16giBBoBKFLwhLdq28gVgwxo9HbS/ue8A08YBtUL+DlSzuebFRHASH+bqDrNfcv5vhW+Plush/HFN6JIzxe4QL/0S6mYBkU/ibePFdeGLdkIttbjFozK+cpKJ941l5NIPYVcbh6V5j0ij9FQfllbYjBe4hqwKsSsarEI=
Received: from CH0PR03CA0386.namprd03.prod.outlook.com (2603:10b6:610:119::29)
 by SA1PR19MB8092.namprd19.prod.outlook.com (2603:10b6:806:384::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 16:10:08 +0000
Received: from LV8PEPF0000005A.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::a4) by CH0PR03CA0386.outlook.office365.com
 (2603:10b6:610:119::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.13 via Frontend Transport; Tue,
 24 Nov 2026 16:10:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 LV8PEPF0000005A.mail.protection.outlook.com (10.167.245.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 16:10:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 32ED1406550;
	Tue, 24 Nov 2026 16:10:05 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 10AF7822554;
	Tue, 24 Nov 2026 16:10:05 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        kai.vehmanen@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 1/4] ASoC: SOF: Intel: Add IRQ chip to distribute the SoundWire IRQ
Date: Tue, 24 Nov 2026 16:09:58 +0000
Message-ID: <20261124161001.702882-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124161001.702882-1-ckeepax@opensource.cirrus.com>
References: <20261124161001.702882-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005A:EE_|SA1PR19MB8092:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f5f79f0b-1ca4-454d-cc35-08df4a4567b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|23010399003|6133799003|16102099003|18002099003|22082099003|11063799006|56012099006|261022075727099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261102123227099003|261021123027099003|261102130727099003|261009223027099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	SFJ18K0oKCJwJuXGwggLXI2Tr1pwwEa8DmuxYZVOyW+tzRmXYBEo8NuE9fC8igL7FYW51Xb7hJQ9OqigepRTQ2TOhOnoMq+5RG0tbGNEzqL2F5G3IUtCLGKj49NOKFzyUdSFogpjPP1TZFTYjxtNcqoKoE5f0cp9CEnnuxbJEUHUG3C+dH4ut+IF6x08IvQ2PElcw5XWB0H7NdFVsBDhyC/+8az2q/WHNrkCdNR4YBwiyCsiyqr3pJoAHxerYTt/ebKFkOO30siP11MuzDQ47PHuvNY+By/no//QyPqil/0rTNY0TdHkwIrpqeZ8nGJjIrOkd7CXzYy+14uQDFEK8zumImB7xQacuMbwHkV5GhagneqPnout6a0L8B0Cm4rJR/8oFlPFQpIKWPUsB2UNicBw6vuJwpKWhnZReG9jw7wJZXrnf5eHGEQhG5ZvDfWnbHAAPJi49bAYbhavtczzKdKgFvasXVWlwRMI6UCXgkxBU2/vrXbrqqV4aBvVtxExexA/kpSmjudvt6jtHYQrYIpzYAu6h54hjFfki0RcjQHpPqyPOztwzwagUubbNnKU+Lbf8qReEHjqUmkm9AcCODp0r8q4AdPkH3uQKRUy+6Y8RbnX8gop5s4vIqolEZMXVGqrcY/ifigjl8BD4AGH6voM2F/e0+r4IlhRVexDAv7EYXx4XV5nOuFL9YgfvlCeULvoZkcw9YbPUV0C+xV4fw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(23010399003)(6133799003)(16102099003)(18002099003)(22082099003)(11063799006)(56012099006)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261102123227099003)(261021123027099003)(261102130727099003)(261009223027099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KfgvRZTK0AloKavqM/6Q+fvtel2LQl66kBsx562uP9bUT+xzlOrNWqD1UHKduf12q6i3KYOrKzih5Y+m5JABXBNABYr+tpPBv1rGJvYuzfg1ugb+K1/amPj57ILvSAHpZWbEpyKUnkKGyIqVR4G5c5WTd7JxXttGJqe0DHtS3c0XLqunsNi6S7kDtPcq4FmbMmBzn3BP3lAKy/JqKsQeIQAJqkfgqNTqGgaZL7gVcE8a0SVnbBAGATTBB5oCfDzcQCfXqkR0+IvmDNTPkPbj++zCa1eWTSnkl3PKUOtP8fMjQJ8r9fO8UoFjAAJ5ZfazREJoDg+8lCKZjlIUNFM8uP5gY0TNYU4SSeav0o7A/mmNK6cps8u7C2sX9f/VUgVB/efvES/Ti7NGPxZ24B7FpxQJffVhEdEuEy089wn6XdeeAF8di5tMTXQiwHD2pd0o
X-Exchange-RoutingPolicyChecked:
	amkTcoVwl34vSHUvwQ6k9zm2a3aUkEu4HHQ7QEHpaqHcaH04Mh4hFJci/gk8JPWl2+1ZR6J4TTZCq2NRr77kstk2CyrdCsTKsaRvgJkNBmn9416uGD5fRq5gIdH9vHwk4oh1UJCk8RWPEi+FRVGCQL9iFNTZ2xMVdOYLGSR2KZ3czMy99Jym+h2hrG1BRvuW2CvkfmK5aBaVyNXtChlQT7oLhoGaDp9w0yb+7ri8im610mIz6O77Yo5sBNsfKLedb8C+FC3iDnoBfiKx3jUpdOCoC0WUqPtZWanvNr7fmm22B0591w8M0Os/ip4nDbaG9RPnwvjTnTFvQRIaKNlUgg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:10:06.0922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f79f0b-1ca4-454d-cc35-08df4a4567b5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-LV8PEPF0000005A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfX64iE6t1EqZCg
 nXSFPNLZYKtaaSBrkILDUnvtfZoKTlcJKQyX93erBqO3SgchJd4ZXj5t9cpXyJFIZZXmKcL6dmT
 kyX19JfPG8+PuyTvXTp6t2BpzvJNgdHV5xt/xLxQwFSZIsEeQ0/H6d8zZZ8tuKWyI34zYfRa09F
 kjospC9O3V4jn8G53dpkEMf6Ou3LTTroyrZTPI1SiD9y/3suGLexmXCozAXOe6KIdYHxeFYwAq4
 nFr8CZKFDEHmqDtMYMSKiCvh8z5erCVQJrLqL23YHwq/2wrE8rvbTNNJzcKLEak9zXze+k7YFqA
 Mn3EeAwhzSbZ7Sl+KWRrHRXZv+5euQwdTXElGxD2kqDj7OH/XInvztRRFvyuTtIHjX/+Dm/T+qy
 RWHSPovbFT835J5lEJH7N+Gie4p35odXSzKA1a8F3W6TGxPXEaBXP1ckvnx7JwbNf8QoPwuRvWI
 Un4SwIG64Kii25izdoA==
X-Proofpoint-GUID: 1Y5YsSBwgQEIzerU8moNhYlzmUp_0Cbt
X-Proofpoint-ORIG-GUID: 1Y5YsSBwgQEIzerU8moNhYlzmUp_0Cbt
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b05b731 cx=c_pps
 a=cPJgcE//urRiG05FhKkhAw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=1-kJ8mu7Czc6wyiOYwoA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfXxxl9rQC2fqmT
 8dmkUSjlOnBC+wA8AFhfdJ+9TYRBFww+gkf2CsQYgeLZZO272zYq2XM2z6uaB+a2ecpVAspi0RW
 IWesCDBmH7BAAuXlGzD4o220Ab7XeiI=
X-Proofpoint-Spam-Reason: safe

Add an IRQ chip into the HDA code that can be used to trigger the
SoundWire IRQ for each link. Currently, only the SoundWire IRQ
is moved over to this IRQ chip, although in time the other IRQ
functions could be too.

This will allow refactoring such that the individual links each
request and free their IRQs locally, rather than having to rely
on looping over a list of links which is tricky to maintain while
destroying the devices.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v3.

 drivers/soundwire/intel_auxdevice.c | 10 +++++++
 drivers/soundwire/intel_init.c      | 16 +++--------
 include/linux/soundwire/sdw_intel.h |  6 +++--
 sound/soc/sof/intel/hda.c           | 42 ++++++++++++++++++++++++-----
 sound/soc/sof/intel/hda.h           |  8 ++++++
 5 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 8bdb2bf1c6446..d84fbe716febc 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -366,6 +366,14 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
 	/* use generic bandwidth allocation algorithm */
 	sdw->cdns.bus.compute_params = sdw_compute_params;
 
+	ret = request_threaded_irq(sdw->link_res->irq, NULL, sdw_cdns_irq,
+				   IRQF_SHARED | IRQF_ONESHOT, dev_name(dev),
+				   cdns);
+	if (ret) {
+		dev_err(dev, "failed to request IRQ: %d\n", ret);
+		return ret;
+	}
+
 	ret = sdw_bus_master_add(bus, dev, dev->fwnode);
 	if (ret) {
 		dev_err(dev, "sdw_bus_master_add fail: %d\n", ret);
@@ -503,6 +511,8 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_bus *bus = &cdns->bus;
 
+	free_irq(sdw->link_res->irq, cdns);
+
 	/*
 	 * Since pm_runtime is already disabled, we don't decrease
 	 * the refcount when the clock_stop_quirk is
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index ad48d67fa9358..d08d79f259629 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -89,6 +89,8 @@ static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *
 
 	link->hbus = res->hbus;
 
+	link->irq = ctx->irq;
+
 	/* now follow the two-step init/add sequence */
 	ret = auxiliary_device_init(auxdev);
 	if (ret < 0) {
@@ -140,18 +142,6 @@ static int sdw_intel_cleanup(struct sdw_intel_ctx *ctx)
 	return 0;
 }
 
-irqreturn_t sdw_intel_thread(int irq, void *dev_id)
-{
-	struct sdw_intel_ctx *ctx = dev_id;
-	struct sdw_intel_link_res *link;
-
-	list_for_each_entry(link, &ctx->link_list, list)
-		sdw_cdns_irq(irq, link->cdns);
-
-	return IRQ_HANDLED;
-}
-EXPORT_SYMBOL_NS(sdw_intel_thread, "SOUNDWIRE_INTEL_INIT");
-
 static struct sdw_intel_ctx
 *sdw_intel_probe_controller(struct sdw_intel_res *res)
 {
@@ -215,6 +205,8 @@ static struct sdw_intel_ctx
 
 	INIT_LIST_HEAD(&ctx->link_list);
 
+	ctx->irq = res->irq;
+
 	for (i = 0; i < count; i++) {
 		if (!(link_mask & BIT(i)))
 			continue;
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 9710f2dc04e29..a23b187df283b 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -5,6 +5,8 @@
 #define __SDW_INTEL_H
 
 #include <linux/acpi.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/irqreturn.h>
 #include <linux/soundwire/sdw.h>
 
@@ -299,6 +301,7 @@ struct hdac_bus;
  * @shim_base: sdw shim base.
  * @alh_base: sdw alh base.
  * @peripherals: array representing Peripherals exposed across all enabled links
+ * @irq: Interrupt line for the SoundWire
  */
 struct sdw_intel_ctx {
 	int count;
@@ -312,6 +315,7 @@ struct sdw_intel_ctx {
 	u32 shim_base;
 	u32 alh_base;
 	struct sdw_peripherals *peripherals;
+	int irq;
 };
 
 /**
@@ -382,8 +386,6 @@ int sdw_intel_startup(struct sdw_intel_ctx *ctx);
 
 void sdw_intel_exit(struct sdw_intel_ctx *ctx);
 
-irqreturn_t sdw_intel_thread(int irq, void *dev_id);
-
 #define SDW_INTEL_QUIRK_MASK_BUS_DISABLE      BIT(1)
 
 struct sdw_intel;
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 9fc95806697e1..06961e5e666ff 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -46,6 +46,22 @@
 /* platform specific devices */
 #include "shim.h"
 
+static int hda_irq_map(struct irq_domain *h, unsigned int virq, irq_hw_number_t hw)
+{
+	struct sof_intel_hda_dev *hdev = h->host_data;
+
+	irq_set_chip_data(virq, hdev);
+	irq_set_chip(virq, &hdev->irq_chip);
+	irq_set_nested_thread(virq, 1);
+	irq_set_noprobe(virq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops hda_domain_ops = {
+	.map = hda_irq_map,
+};
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 /*
@@ -198,7 +214,7 @@ static int hda_sdw_probe(struct snd_sof_dev *sdev)
 		if (chip->hw_ip_version >= SOF_INTEL_ACE_3_0)
 			res.mic_privacy = true;
 	}
-	res.irq = sdev->ipc_irq;
+	res.irq = irq_create_mapping(hdev->domain, HDA_IRQ_SDW);
 	res.handle = hdev->info.handle;
 	res.parent = sdev->dev;
 
@@ -260,6 +276,8 @@ static int hda_sdw_exit(struct snd_sof_dev *sdev)
 		sdw_intel_exit(hdev->sdw);
 	hdev->sdw = NULL;
 
+	irq_dispose_mapping(irq_find_mapping(hdev->domain, HDA_IRQ_SDW));
+
 	hda_sdw_int_enable(sdev, false);
 
 	return 0;
@@ -307,9 +325,9 @@ static bool hda_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
 	return false;
 }
 
-static irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
+static void hda_dsp_sdw_thread(struct sof_intel_hda_dev *hdev)
 {
-	return sdw_intel_thread(irq, context);
+	handle_nested_irq(irq_find_mapping(hdev->domain, HDA_IRQ_SDW));
 }
 
 bool hda_sdw_check_wakeen_irq_common(struct snd_sof_dev *sdev)
@@ -399,9 +417,8 @@ static inline bool hda_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
 	return false;
 }
 
-static inline irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
+static inline void hda_dsp_sdw_thread(struct sof_intel_hda_dev *hdev)
 {
-	return IRQ_HANDLED;
 }
 
 static inline bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
@@ -727,7 +744,7 @@ static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 	if (hda_dsp_check_sdw_irq(sdev)) {
 		trace_sof_intel_hda_irq(sdev, "sdw");
 
-		hda_dsp_sdw_thread(irq, hdev->sdw);
+		hda_dsp_sdw_thread(hdev);
 
 		if (hda_dsp_sdw_check_mic_privacy_irq(sdev)) {
 			trace_sof_intel_hda_irq(sdev, "mic privacy");
@@ -883,6 +900,14 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 		sdev->ipc_irq = pci->irq;
 	}
 
+	hdev->irq_chip.name = dev_name(sdev->dev);
+	hdev->domain = irq_domain_create_linear(NULL, HDA_IRQ_COUNT,
+						&hda_domain_ops, hdev);
+	if (!hdev->domain) {
+		dev_err(sdev->dev, "failed to create IRQ domain\n");
+		goto remove_irq_domain;
+	}
+
 	dev_dbg(sdev->dev, "using IPC IRQ %d\n", sdev->ipc_irq);
 	ret = request_threaded_irq(sdev->ipc_irq, hda_dsp_interrupt_handler,
 				   hda_dsp_interrupt_thread,
@@ -941,6 +966,8 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 free_ipc_irq:
 	hda_dsp_ctrl_stop_chip(sdev);
 	free_irq(sdev->ipc_irq, sdev);
+remove_irq_domain:
+	irq_domain_remove(hdev->domain);
 free_irq_vector:
 	if (sdev->msi_enabled)
 		pci_free_irq_vectors(pci);
@@ -1011,6 +1038,9 @@ void hda_dsp_remove(struct snd_sof_dev *sdev)
 	hda_dsp_ctrl_stop_chip(sdev);
 
 	free_irq(sdev->ipc_irq, sdev);
+
+	irq_domain_remove(hda->domain);
+
 	if (sdev->msi_enabled)
 		pci_free_irq_vectors(pci);
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 43fb11b247740..29b9feb0daef4 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -466,6 +466,10 @@ struct sof_intel_dsp_bdl {
 	__le32 ioc;
 } __attribute((packed));
 
+/* HDA IRQs */
+#define HDA_IRQ_SDW	0
+#define HDA_IRQ_COUNT	1
+
 #define SOF_HDA_PLAYBACK_STREAMS	16
 #define SOF_HDA_CAPTURE_STREAMS		16
 #define SOF_HDA_PLAYBACK		0
@@ -580,6 +584,10 @@ struct sof_intel_hda_dev {
 	 * is received from the DSP for the previous message)
 	 */
 	struct snd_sof_ipc_msg *delayed_ipc_tx_msg;
+
+	/* Used to distribute IRQs */
+	struct irq_domain *domain;
+	struct irq_chip irq_chip;
 };
 
 static inline struct hdac_bus *sof_to_bus(struct snd_sof_dev *s)
-- 
2.47.3

