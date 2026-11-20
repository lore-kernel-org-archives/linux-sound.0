Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795183012;
	b=hURNHZJtDPisCiiipBj5WrNsZIsvO1xAuD/2q1B+I+HTTcIM0ZdWZjmaYDsjVHN6DWRB
	 5iPpZdE7HL+kldOKI6svRPPwAwQLgrNCOak/KVaF5SZpGel4CP5/OadZERtoOm55hOuAN
	 6X0Ti5T5j6uTyDfdOQp30Lf4orCHaPgU5uVvJpwBRUMFWoTY4A04/DWhEVIUeOfCCnRRW
	 oiAlUgIcouhfCiZmLXFGK/7WkqPHTo4msb+APZFKrzuWiKoalSOQXFjpuk46ZtwrnYCn9
	 QyrKVVAjVeVr6SJ1dRE5eepL68cQXb/Yj7GytSJku8YZqj/ufOGf52ntolUp1/CCfqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183012;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Reason;
	bh=TFZGOXm2EtYQ5syWeT8HE5UojkSe722Vm5t+2JzSiRs=;
	b=xgn5X9aCPIH3ARMS86uGfpawvJ7H6Kbk8vAsAPLvE/PbF8yCfNkxGhS6pXjS6QyBFqJY
	 jXm2Ykz2vMthHdUsuVT0LGz0US+aZIgUGayNNFA7fdzUCYtW+wDtzoGsVWq+vOB9pdXhB
	 eIDlc2HdnzKQ8dF4S0HWz6mpQt+//VzJyfyEhkM3o9Y3gO2v6kZhceo2/mTVwiUvtXKGK
	 HcL8zbD+v/fbRGQV5LE3A/ks0n1b9zFhjuNct3GZZkisAH8GYnRwEhnKMmJAmPZj7yb4A
	 zwRT33HBCZwUHQmdIwcmOEXISOw3R1xZrAzzJKNfyLDxLf269IlHsf5DYmmlp8AiodQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=AT9r9VbI;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=nTann5p3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B57E606ABC5;
	Fri, 20 Nov 2026 13:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B57E606ABC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=AT9r9VbI;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=nTann5p3
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKDTE142885874;
	Fri, 20 Nov 2026 07:56:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=TFZGOXm2EtYQ5syW
	eT8HE5UojkSe722Vm5t+2JzSiRs=; b=AT9r9VbIytMyDx4cB1VXvuHFB+OhFXD0
	vACCbeWG6c2Fd1kdkOAqfh8PGQKt3t2tkTJt8otKhSxYbbyJpu9lJUHj4KfiTpPt
	m4FsXWnBDcBFT25YNzimSbraC+TspCXMfK3FAZVeWXvY3euUY96T/VZi7X9U/XNT
	I87pNHoydU/pxdhSHxMJjs4UGC0YXhv/w+KvNGTEwtCrrIsoMz1mZOBfCJipp/9S
	ilmK5E9X7uSgDKWKrxwgmLzWBq+Omk+bS0QPjicgjGtUtbQr7nExSvH/51HQdRgO
	5uF16uPoWga+Xmyce7F98ZCrSOczvHRoJGlfwf9JADngbQDv2Jj+DQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023087.outbound.protection.outlook.com [40.93.196.87])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j24prhmcd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 07:56:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoqeLxRzT3fHbDSveZlXv485lWyoAw2pytX2be0qFa2ApGoNSLaTBRug6U5h9yMtlrqE4ontOc3sj0a2vvqD3Dl8oYwVXyngOwt1KJhlvQW0xeAfcz6YNwA59aY72VLQyMRP/mQZ+0TOUklam8YSrVvVoaiaqwgQlKwz56LpIzRII7vlsGen6xj+cIbYIdW0mLmsPR8MM0N/72pJ8SpCOwjd2xJV7FF5fi30fwHVDfJQuXoVnjFAJeMV8fhUEe9ol4Ksg28G0kylu1omWg2d2EysoQwSPxBTjGeI2xA70RrKcHun3RFSwNkNRAC6ovdqIRO+h19GApPTeCuHP5cQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFZGOXm2EtYQ5syWeT8HE5UojkSe722Vm5t+2JzSiRs=;
 b=KR8LIqp21BXdo8W6xz8Q5pNsisYy16eAKM2hTv2Ucw1/Ctu5XdtCmuhs4QSdmasfwKBSkhz6zkZGAsa/7gosxp8RR2wxBb3WauElJrWQ6ACQ2b/RcKy+Squ7lhHg62Ppqs42Q3Ttq0P0PVrZfuVlpaLztPas1fgzO/UxWyjTLTXVAIFNZEWNL4+sJx2CyuxXIaLm68rzwB0RuFeoLwatEjJrF6Nmjk+uQhD7MvP/OUjHPirzg1jgKe8fR3zjcffC0F7ZLmvtxvNGiOj0Ui1fIVaYRMX2wIOkQZfIB3UmP9LuuJ5IfBxHCSTEmSOnlgRhwKNnlPRTkP7oi3tzn3wt+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFZGOXm2EtYQ5syWeT8HE5UojkSe722Vm5t+2JzSiRs=;
 b=nTann5p3aug691JgnziGy1bNNIK2sduLQizyTluGa2DBYUWKV2vEetgYJzldMcRECibCePcobY3P5TNiLPLmIABOw4m/YHr7KQBdhePXnSPwuqme3ag+VmbwKKHCAr05VJ5QewoWgb3W5tBcJsSp3RxpzbEtI67Nq+DRZxqqeUI=
Received: from PH8PR02CA0021.namprd02.prod.outlook.com (2603:10b6:510:2d0::28)
 by DS4PPFE7AD5A94D.namprd19.prod.outlook.com (2603:10b6:f:fc00::a5a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:56:34 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:510:2d0:cafe::61) by PH8PR02CA0021.outlook.office365.com
 (2603:10b6:510:2d0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 13:56:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 13:56:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 64B6C406545;
	Fri, 20 Nov 2026 13:56:30 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 55A17822549;
	Fri, 20 Nov 2026 13:56:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org
Cc: linux-sound@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH] mfd: cs42l43: Stop using legacy SoundWire IRQ callback
Date: Fri, 20 Nov 2026 13:56:26 +0000
Message-ID: <20261120135626.2004361-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DS4PPFE7AD5A94D:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a393ca47-9971-491a-464b-08df470e15a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|61400799027|82310400026|261022075727099003|11063799006|261021123027099003|261009223027099003|261021121427099003|261102123227099003|10067099003|261026121527099003|56012099006|16102099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	dz35KRwnrYgMD4qg1/q2ypFKzXVvtBPiIY15gjIk91OXT0rh9H4EffyVO4rL424d5Y4dw10PupZf0rcKtdsb/04wzNB0w5sJ6tC2+NUzdvNZpHakB32sp8gIB3dtZYg1a96c3SFuF4s/wytJaZbgokWE/98bWAik9w/tX7d7TQfqO1tujO1Htvf0GTbK8Qgf2Uh7A202WDg0Xt3+5AYJSPsAm3CduehQpxrlBrJ1IGqtkorK5EnwbmK/ekgmdjyOkFRwfYvBkXIsyLc8nRmInG6m4DoQGdHRDq4FA2Jbdo0cjUORP23WRNg3o9HiLXQ9aMfYxTPe6r/ENlwz88zybl3e3SYnsp1XZRpv9jSnzmc3YjIhjrnRsCbpo2HH71RMIBy4Oa4vnZ866wkjqCdE0mkD+wbKDE0y3RWnmtqk8JkJwGw47P5hieqzQ1/aoWdBUdfPNbIQngzeq5LHnPd/c0ggrZeHyFSG8NfoUqOwbDufM7MhJjGz5G2ghivbsq7DVNRuIapkPeRDPw4DhAKW2VzrruYW9JrMd9GEuDzWo9WoetEm5uAzVYXzeMzgKf4sV9dAHnkgp2wPWnL+WM9idVoT4tJLcaYhMfZGcq/qTY6gP+/xBeSeC9/FFp08wA3KmdicGooocRWcuFUXK+gy4itJk+gRHiSvcxMaS+n2gn+LPu2OSiawq0f1Kyyi4ZJkeGpqtrLqbHCGlDX91pVmlA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(61400799027)(82310400026)(261022075727099003)(11063799006)(261021123027099003)(261009223027099003)(261021121427099003)(261102123227099003)(10067099003)(261026121527099003)(56012099006)(16102099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kBrPzOkfh8DoALNGkmyTJvrHyU1sW+F+CQQltuos4NZVO3MG3NebeCQ4/Yk3JIGtarAtOVySOeg8VCY/cUdvT5YzBQ85rhfxHC4BSk7Yyh1I2hfIVYTI9e+G4O2N1Gi0CWEMqxjThAW1Fclp6YQWRw4enILMzJmAtueaNnwjCahQLUORt0EitMG/fUNpwTgs10/yIajFTedN2FGk1Gb0a/z8quVPCJQ8spimCCRHpWlmaORCBWw+mnspVK2hxn6Mh3+xVzMU3EnPT+6KbBroyA/aiYqv7KDwC+kY1LAFh1qpSx/TZnFA/GbCXd1m/DNItTcH0K7iav6D4WlfW3BAIloIkPkptaizsas8ArBdKCdxDGJu4QzIYdWVN9yyNWNze1jf0OZHUK70uUY+twq2E9u/YRgHL9abYF80ZV8Hqq7VhzGwWVopMCBQ82tedweU
X-Exchange-RoutingPolicyChecked:
	QP5WH1dk1e3+Veh6VkekogVcNaDRzz8wduFrAsGECIDYu5HxcJhGuEEsVg+KEry1vCS5OdRmzYRUb8Bru1NquZMLhIWdedcPlPVb1y/9SOY2NMIgQ7EL3xwEkDCfHjGQMosTshrbPnG+tRop536v8Lzal+VlTIWFpc9WQdxxosjTvFKcFbxxzFclZpAlsYuNmOCR+p23u8YMJDST3fU1WviHcTc8LxgGrEcqwMRNIS4AE08H5DdOwmPsC3y/LgEIfWHMkO/MPEXPmwFgFVbw6TiBCyS/KF1ltqlNWMs2lszMG2ZrQI7Gkx/eoL91REPEMQbXrzHA/PtnBd+LnVVuyQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:56:32.5086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a393ca47-9971-491a-464b-08df470e15a6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE7AD5A94D
X-Proofpoint-GUID: jgu3fSDsLuoTz0Y5xHo8fbBPpXaIJYpz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NSBTYWx0ZWRfXzNDXpwujjzL+
 5yMFL8Vgbr+N6P1C8u667QYbSwnlGN7Xh+SlKWREaljfRAyh4qdclEwiZTisrKVlP8F5MxO145j
 GR8bnzA1xX631LalK92st8z8wCQjuYg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NSBTYWx0ZWRfXwXh8w3Of7Iqf
 TgctAd4k29eGKAM8wpp8TzGhRChWPu2i0h4MMqG/OQhnvDY2SvxxGKXRz8zcJsfwHpz6CYE60Vs
 kOKJUXekDnLwPC5dCeBqqdvp3JhNYtebbnqur6Rs1zWPGdtV+m5svxibNTn8SdMjGFuNwbSelh8
 bNMFwBO/sA5qMC+VLFa+9CQFk/ZoLrDaMJXlTnv9VRajipzQCcRqeIVeVnST57/Khk0dnv+8imw
 d2FCo8ad4pbYa9HY48abSWzyfqJ29lSoXl17wkW7o0Q0O7k+efpS9rgPSuPD7obudtoNFy9rmW+
 /zKUh2sPQXsOFBWb2TKk2DBarQGQXSco+pNDCRlVf9bWYDVoYqPs2ZEsc/XKKrAr5pCUHAfkkKu
 TDox/HuI5Ft1H1HT1C61b/2DmSzRmq4Vl4eCvqM054Jgtc1E4x8shhgfjsKDhftSGcqNHcxBcvI
 Mri/H5hH/xstwlCThuQ==
X-Authority-Analysis: v=2.4 cv=afr0Dhot c=1 sm=1 tr=0 ts=6b005197 cx=c_pps
 a=DH6uOP27q4GouF/df79YRQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=s2vy8z4VUVnIkbW1dyYA:9
X-Proofpoint-ORIG-GUID: jgu3fSDsLuoTz0Y5xHo8fbBPpXaIJYpz
X-Proofpoint-Spam-Reason: safe

When removing the cs42l43 driver on SoundWire the core will warn of
too many retries on the SoundWire alert. This is caused by the use
of the legacy SoundWire IRQ callback to clear INT_STAT_GEN1. This
implementation defined SoundWire alert bit is used to tie the cs42l43
internal interrupts into the SoundWire alert mechanism. However,
the legacy SoundWire IRQ callback is gated by the probed flag inside
the core and that is cleared before the driver's remove callback
is called. This means that any IRQs triggered during the driver
remove process will not clear INT_STAT_GEN1 leading to the device
being stuck in the alert state until it is removed from the bus.

To fix this issue handling is moved to the regmap IRQ handle_post_irq
callback which ensures that INT_STAT_GEN1 will be cleared right up
until the IRQ itself is cleaned up.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/mfd/cs42l43-sdw.c |  9 ++++++---
 drivers/mfd/cs42l43.c     | 22 ++++++++--------------
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index cd0132e3632be..72833333b73ca 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -112,9 +112,11 @@ static int cs42l43_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_statu
 	return 0;
 }
 
-static int cs42l43_sdw_interrupt(struct sdw_slave *sdw,
-				 struct sdw_slave_intr_status *status)
+static int cs42l43_sdw_interrupt(void *data)
 {
+	struct cs42l43 *cs42l43 = data;
+	struct sdw_slave *sdw = cs42l43->sdw;
+
 	/*
 	 * The IRQ itself was handled through the regmap_irq handler, this is
 	 * just clearing up the additional Cirrus SoundWire registers that are
@@ -155,7 +157,6 @@ static int cs42l43_sdw_bus_config(struct sdw_slave *sdw,
 static const struct sdw_slave_ops cs42l43_sdw_ops = {
 	.read_prop		= cs42l43_read_prop,
 	.update_status		= cs42l43_sdw_update_status,
-	.interrupt_callback	= cs42l43_sdw_interrupt,
 	.bus_config		= cs42l43_sdw_bus_config,
 };
 
@@ -172,6 +173,8 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 	cs42l43->sdw = sdw;
 	cs42l43->variant_id = (long)id->driver_data;
 
+	cs42l43->irq_chip.handle_post_irq = cs42l43_sdw_interrupt;
+
 	cs42l43->regmap = devm_regmap_init_sdw(sdw, &cs42l43_sdw_regmap);
 	if (IS_ERR(cs42l43->regmap))
 		return dev_err_probe(cs42l43->dev, PTR_ERR(cs42l43->regmap),
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index a83b62064dae6..d36628e8dc279 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -515,19 +515,6 @@ static const struct regmap_irq cs42l43_regmap_irqs[] = {
 	CS42L43_IRQ_REG(HP_LOADDET_DONE,			HPOUT),
 };
 
-static const struct regmap_irq_chip cs42l43_irq_chip = {
-	.name = "cs42l43",
-
-	.status_base = CS42L43_DECIM_INT,
-	.mask_base = CS42L43_DECIM_MASK,
-	.num_regs = 16,
-
-	.irqs = cs42l43_regmap_irqs,
-	.num_irqs = ARRAY_SIZE(cs42l43_regmap_irqs),
-
-	.runtime_pm = true,
-};
-
 static const char * const cs42l43_core_supplies[] = {
 	"vdd-a", "vdd-io", "vdd-cp",
 };
@@ -917,7 +904,14 @@ static int cs42l43_irq_config(struct cs42l43 *cs42l43)
 	if (cs42l43->sdw)
 		cs42l43->irq = cs42l43->sdw->irq;
 
-	cs42l43->irq_chip = cs42l43_irq_chip;
+	/* Manually fill so extra settings from bus are preserved */
+	cs42l43->irq_chip.name = "cs42l43",
+	cs42l43->irq_chip.status_base = CS42L43_DECIM_INT,
+	cs42l43->irq_chip.mask_base = CS42L43_DECIM_MASK,
+	cs42l43->irq_chip.num_regs = 16,
+	cs42l43->irq_chip.irqs = cs42l43_regmap_irqs,
+	cs42l43->irq_chip.num_irqs = ARRAY_SIZE(cs42l43_regmap_irqs),
+	cs42l43->irq_chip.runtime_pm = true,
 	cs42l43->irq_chip.irq_drv_data = cs42l43;
 
 	irq_data = irq_get_irq_data(cs42l43->irq);
-- 
2.47.3

