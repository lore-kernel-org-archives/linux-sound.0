Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795536692;
	b=vGh/r5/UusojXdoa/k3VaOS0SMzXy2kdRHzVSI5wHzVWu0P9TGUGxekZlxWTexairUTX
	 idd6gCtS1P2rozI9B4ooJ59aqQz3hFTbigxCBeTSbT6B67DsU7njKlBZSuMFwrVNjbT4p
	 RmezeFgddH6LGtL323Em5VlZxCK0qIAtPUDqAgb2qaCL+RelicJVqJMAb1c2R9fM0e6Bh
	 9xv+5oqIsABxXVX72YBxrcHAZ1fpFc4NkcwO4sSZV7Oh9SPugDGOH3IVBUgJhjmWpbs8g
	 f/Legl6gXi1SytN/1NCGhMsDgYDcAriJv4/BUK2LnV7P1xsjQXWs4WtoT6f3mSDl5CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536692;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=eqRvvFBXNMITX2WF8Jn5liCxP+Tmvsrqi/rZ0gcaJ9U=;
	b=CRitEaHWyZ6ar0n/Ay+UZXa7h5nPky9/cBi2Xe5Ei8ZfM6PfdBuBLxVdgc7IcRLPuH7q
	 CicAeJlSWmSGof+OWhGe2czAiafXwm0tBR+K9oagod+Q4Xvft4rmsfjaBog8l3s8CIIaP
	 hHZXE+0/CewXedq0b6b4ax9YWQL+DWdUaP/mz8ErhpReBpSqoA+ZJ9Kj5kn8KHBFadbZI
	 2TdAmfhek86cdkEgcOjPg//D6G/Fr8T5KbtCFMYF0QqFSYDYyhHw6aNOLvBENgfdSinAu
	 tZKr+qG2ofPkr+TE2SnagJ4bup41qhG8Rx4u0F1kfBXftN1qVBQqjxBnEdIWKGyBMow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=DeM2KEhu;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=N4eS3RCp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1350606A323;
	Tue, 24 Nov 2026 16:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1350606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=DeM2KEhu;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=N4eS3RCp
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFhZSn3999144;
	Tue, 24 Nov 2026 10:11:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=eqRvvFBXNMITX2WF8Jn5liCxP+Tmvsrqi/rZ0gcaJ9U=; b=
	DeM2KEhuQ2GePcHpGlphKhmlVGQME+IjeTP8dlMxHrQdupt3l4tWecTe308a+Ycy
	GtdEWP0792a16ulUPxCdHD+xcijrFA3skrck0xxEued5FHB2kuPYj3A3Ka4xAPKs
	FyJy0IyIsN7u6sAwcKQiQ06WKwAnHbeCa2HKLPajHRTEOWrnZW2J6BIqKkMURiem
	R8B5DN14XMpwNrV0B2Et1CPhWuP1DC/CtENTHl+U74aKQXg3n86iXqTUE3EVsBOx
	3stAmEKdKn86eT77sy1jgBvVNZ5I4j69YtqhSDIV9/r/2yPj1sSkkK8NVWcFQFtN
	0Was/bOoLDZXq5+cFlg5dA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020076.outbound.protection.outlook.com [52.101.201.76])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j518811df-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 10:11:15 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKIBL+1P+PsHnY5rL3zyqrjGBCkLcu4EpTF0eSeXG5yCB0gmlVeWzJjb+qZUFM9V2C6ecjsJsnzKSCIMKz/Z7fI+BNQW0CVE20oLUSJjI4Us7YZHjykZeUbx4UUpcfAh9RGGqSrpu/K4IICnz3Jvhv/DugMvfDx6wAhpBL0WwDGNPvCBzftaPWg9Cwi6K4dS3SMg1gBoHXaMcfjeXfy6tb3vRR6jlFjN8nxVPDpp0WVhZIISfzXE3XkOB2onDAYCHVSTe4CpfRi1Z8VZO796pFDMLuQvTXHxPgYWztgjNLUPpfINuuijrie26uTG2tM1603ulmAEOjwJr2faIWqaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqRvvFBXNMITX2WF8Jn5liCxP+Tmvsrqi/rZ0gcaJ9U=;
 b=waDr4Pc+LANiBBob0+VmqZ4DZ/NQD6V5DvzWWPpPuMgHCOR9tzDY/N1Wrgd0rg3QRXS5F5UWEOlm/RZIiP8ygUTfky6qInTN3oE3sMG5YIkuY4N+eCm9de1pB2hqUrQfp9SMBWaMAVcHsUoncYrO59qp7/UbutXs2MznIqwPAgr9BigpcC1KJBoUwjwemN97jjTfC3BSFnWfCBmJrPIIeCkHIMteWzSnWmJhTckKIBD9z7Qqi462Q2UjyT1ZqZRAvTGKNDtJEHIYz62a4/hHx3jhe7OEhbKlJOgFTqgsxsKbfMisEAtmEplaPWc/9lpEHcUJWv22OwzGz2TNJu/paA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqRvvFBXNMITX2WF8Jn5liCxP+Tmvsrqi/rZ0gcaJ9U=;
 b=N4eS3RCpYk8cjuKhXnw2GUgNvq4zPl/O7Ej1v9+o43u3Di7H/FSJU2hci7LdosPskvdLcHbJ96uVgImbkKlFx0dkNGbmuo5NCwyKORd+S133iLmfUlOracWBIreEpG/hWhpaWwIQX/eCh1iDtZ6mAGfrsuT8pAwV+GBlM/PFIG4=
Received: from PH0PR07CA0077.namprd07.prod.outlook.com (2603:10b6:510:f::22)
 by PH9PR19MB118808.namprd19.prod.outlook.com (2603:10b6:510:3e7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 16:10:07 +0000
Received: from MW2PEPF00014679.namprd04.prod.outlook.com
 (2603:10b6:510:f:cafe::31) by PH0PR07CA0077.outlook.office365.com
 (2603:10b6:510:f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 16:10:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW2PEPF00014679.mail.protection.outlook.com (10.167.249.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 16:10:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3B2D2406553;
	Tue, 24 Nov 2026 16:10:05 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 18879822558;
	Tue, 24 Nov 2026 16:10:05 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        kai.vehmanen@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 3/4] soundwire: bus: Expose a helper to remove devices from the bus
Date: Tue, 24 Nov 2026 16:10:00 +0000
Message-ID: <20261124161001.702882-4-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MW2PEPF00014679:EE_|PH9PR19MB118808:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4d14705b-1453-4613-20ab-08df4a456815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|23010399003|30052699003|56012099006|261102130727099003|261028144727099003|10067099003|11063799006|261009223027099003|261026140227099003|261021123027099003|261026121527099003|261021121427099003|261102123227099003|261022105027099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DxihxZYCknXJ9+kyO1SvxkO6OFwwryCW7yxJk8RkEFV6BRTkde+MozklsWBubaFfyFjKtKjp3u3aICQ6b8TvHbXqG8R9UlAi2u9P2SkcalazJx9b4KpqKX7VhTZoWBGILL6i6t/vwMMZtB3Pfxjt69owkuUPAbqKus9IIZ6VnfiSkvZ7rNFLZAYXCWKEwECFYMhVZhT5ZCGkwafhuId7zRZpt51smfzF2mQk/b2hToI8plgrdBh8WGCbhW0zq2O4Z7dOXhG2Fm4mklgF7MzD1o3lDDvLLG/GT42chqlkAMpJBI29mrOA8xQ6nlvNTith6sqsrKL5rLn6DxW10QgKmkPD827JKWfM8sIoPzcfCOM5WOsNY1Fu2O12tZt+u8jurK0lk9lN1cl7Mgqz+CO0f75OSxvR7XZgzAvGsu4LPW+6kYYBH58frEGAextwBCmfVh1+TSQu1ozmiZ/7tm+7bJvudpFhwcPFegb+kOVIJK0hoW1Etz1gz+j3LRDu96MVeSUR7xpjwOJLD1AWo2C9DV42MDb1yjn+HQKm1NODEgliDmD8dVWdzCJsW0Qf7c2IgzwCfXSpt/7j9C1IcNz4dlydekYdYiIbtx2G3pr1TKxBbzPxC6ZAnp0FvGlCiR/+Cha6vkXJ3oXPLXUBibM+oizu91QFhpF6GQdBFFjyubCvpEJ/YuyhkysckSFzPgh+k0jJuQetcEOroEMvLDP94Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(23010399003)(30052699003)(56012099006)(261102130727099003)(261028144727099003)(10067099003)(11063799006)(261009223027099003)(261026140227099003)(261021123027099003)(261026121527099003)(261021121427099003)(261102123227099003)(261022105027099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X300/bLZfH7EOYyoEXgW7E4Zb1ewAuCRm6QeY3JwlMySBmAMFVyiKWLO7Ke98qmnWBFEQrCwFe+21oiofh+tLz0FTdq2eOhh53ylZ0IJV5JGvg8/EgW8l/bR5pdbUOsDpmkSbA0ClKDLNKw/tlqO/gOfZh6OOg+P/6kJu26beV96RhOqoheRWjsaWiVFHtxwnDS8QUpVBCzKHkdLQWVrN4KkzR+aFcCqH/yoJFTFaHYFsMYkrI8e1MiMtZhKl1V5XXl1Fr723yxMZhbkL6Qq4N21uH6PDE40LtrlkAr4PGF7eJ3PGaBSKo01+onZx5zu9rUxoVdWCuQSR1fvrB4qa+aDseNAHti3cC7dFoAUyt6AXBLdvzpp0Lgnb2Sn6226R5q7YR0gt9RT1TnpN/TWhqRoXNsu3ZDPFZuQ27SvSw0pGYQy/EtjbBbd14+WnSE4
X-Exchange-RoutingPolicyChecked:
	HnQxjyyEQxenkP1qy9tLjb0xVbJ0e5VPLpkuGg42mNvmVH2Uqg21YiEUzYIv6wYUlQDe9Z6NDKA/6S8q1QfTTJXeRsG4fVPVbGXimChfr/mZS3HnD6ELTDCMG28Pmo5UulvKxjotax2hVNqxrSMNXBD2SCTR01I/rtNPYUjoBlKrtgaEe81dzq4E2HN2lRuI95YPcaUX7N0qqKaqE6wBtKhU4kGmFYSIeibkLCe+uPEdbKWYKDcSQdCjUSjPJxGZAUzECq+bFFbXHwKX4pyZP2KpkMk13RouTErsyY9H9TlGI+sQtHF5EQwdDnTr0vl/hU9k3I0rGkiPzG3ErvzDEg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:10:06.6045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d14705b-1453-4613-20ab-08df4a456815
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2PEPF00014679.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR19MB118808
X-Proofpoint-ORIG-GUID: BAbfgdWGDw-YfodS-G3DHcDD34UNKS60
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfX9MViflnWm69u
 GeDrz2jZC7ltQ1+SykoqF+Uo8jeNYGXdkEYwipOKtm5tchVvRlE41njQvYkdpS26xYR3QNbZcOp
 VmhMI5arisUrZh9+nYZDzzoFAmik9Mi409KESbOe39xqfmGZsbLPCWYx260KWnF6bZwqhKU4c57
 jvRn0tqldo8MUPjSktXwkCNyDt0SHOENfY6yGs8KKrUbfpgwz2DtW2RcD5xj+jdBMK7Q7cml5BK
 6wFFU0hwYy9+KuRoPxflIV5Gu5M157ltox3C842urlIJuXFLJyDMrJ41pof33RpimAmwR5Vu9FA
 UTrnBijG+7Bfy2Ly84uXYFfV5n2rA6OYdEiKz0vIxd+x4GgrjBXUHdvhJFFDg10nELDGn8dt4Ed
 nznibHaeSZimX/2uBkJMKgd12rjD9FVS4OrGqeW4q0dGU3qaoWBS3yGLafefb7Tq8HuHzHq6gYU
 N5oQYPkW5YgqLM4BXiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfX0yHg9ccM03RB
 Xc664Q2JSbFjQq8X4OpiuywWM9fPuxrtQUmhbnfbAajVp5uOWnTX/I2//XbHBxw8YC2xXmEQGYy
 /CI1LvQU4uFqmg35zkkpCjWDi+zIDkc=
X-Proofpoint-GUID: BAbfgdWGDw-YfodS-G3DHcDD34UNKS60
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b05b723 cx=c_pps
 a=wcWRxBclbL8OLrndhT266g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=gQeVhbwXa6W6SovQ:21 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=1N7ZiyxPLO-s3Sfvc6UA:9
X-Proofpoint-Spam-Reason: safe

Some SoundWire controllers may have features such as IRQs that are
needed to support peripheral operation, it is desirable to continue
to support these whilst peripheral drivers are removed. However,
the current sdw_bus_master_delete() monolithically removes the
peripherals and destroys the controller giving no chance for the
controller driver to perform clean up after the slaves are removed,
but before it is itself destroyed.

Split out a separate helper function that only removes the
peripherals, this will allow drivers that require this to sequence
things appropriately. The functionality of the current helper is
left as is, if the peripherals have already been removed the call
to do this is a no-op which allows drivers that don't need this
functionality to remain untouched.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 drivers/soundwire/bus.c       | 44 +++++++++++++++++++++++++----------
 include/linux/soundwire/sdw.h |  1 +
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 001407fa50ddc..5baae0bedaf09 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -169,7 +169,6 @@ EXPORT_SYMBOL(sdw_bus_master_add);
 static int sdw_delete_slave(struct device *dev, void *data)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
-	struct sdw_bus *bus = slave->bus;
 
 	pm_runtime_disable(dev);
 
@@ -186,18 +185,38 @@ static int sdw_delete_slave(struct device *dev, void *data)
 	 */
 	device_del(dev);
 
-	mutex_lock(&bus->bus_lock);
-	if (slave->dev_num) { /* clear dev_num if assigned */
-		clear_bit(slave->dev_num, bus->assigned);
-		if (bus->ops && bus->ops->put_device_num)
-			bus->ops->put_device_num(bus, slave);
-	}
-	list_del_init(&slave->node);
-	mutex_unlock(&bus->bus_lock);
+	return 0;
+}
 
-	put_device(dev);
+/**
+ * sdw_bus_slaves_delete() - delete all peripherals on a bus
+ * @bus: bus with peripherals to be deleted
+ *
+ * Delete the child devices.
+ */
+void sdw_bus_slaves_delete(struct sdw_bus *bus)
+{
+	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
+}
+EXPORT_SYMBOL(sdw_bus_slaves_delete);
 
-	return 0;
+static void sdw_bus_slaves_put(struct sdw_bus *bus)
+{
+	struct sdw_slave *slave, *tmp;
+
+	list_for_each_entry_safe(slave, tmp, &bus->slaves, node) {
+		mutex_lock(&bus->bus_lock);
+		if (slave->dev_num) { /* clear dev_num if assigned */
+			clear_bit(slave->dev_num, bus->assigned);
+			if (bus->ops && bus->ops->put_device_num)
+				bus->ops->put_device_num(bus, slave);
+		}
+		list_del_init(&slave->node);
+		mutex_unlock(&bus->bus_lock);
+
+		/* See comment in sdw_delete_slave() */
+		put_device(&slave->dev);
+	}
 }
 
 /**
@@ -208,7 +227,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
  */
 void sdw_bus_master_delete(struct sdw_bus *bus)
 {
-	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
+	sdw_bus_slaves_delete(bus);
+	sdw_bus_slaves_put(bus);
 
 	sdw_irq_delete(bus);
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index b8f5ad39e9b37..f83b7f622288a 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -899,6 +899,7 @@ struct sdw_master_ops {
 
 int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 		       struct fwnode_handle *fwnode);
+void sdw_bus_slaves_delete(struct sdw_bus *bus);
 void sdw_bus_master_delete(struct sdw_bus *bus);
 
 void sdw_show_ping_status(struct sdw_bus *bus, bool sync_delay);
-- 
2.47.3

