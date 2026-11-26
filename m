Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795692157;
	b=gjqSsmuj41xusaXKoEF2lGcs2qVeKwPYCbxvwQjmvKiMVPb+aO1gTVcrlNRPXZa8c2cs
	 5FNnVFggh4if6O97AXzPT1eiOlqfBZqUfu6vADTtu7F2jTWRG73Q0boqTYMLQr4RrZifi
	 /UhX4JsmluTpB1+cX0+Xv2HT3wlg5J+Q+7fxSYDoqHoZg/yUgTQV9vWuJqek7Ayfbqs6x
	 tnc+qICwUujI63jX7W1GvvgajMCb9PGTBSQMnGfQtSxSpPCziP3dPTFcekHdKJWGo0lXt
	 shW1VN4hTn34b96H8VUW1cBIvFZPryVTHx7rG0GwgTkxFWFMttvs6edoVw1VYBh1/eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692157;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TGJLGUZL5TdAYp0ot7buukDeqmlNr9nL/LEllHfAOaU=;
	b=qlAqQvmjeSfrdZU1UiZEU4fUrvPZe8sqyyPX3BNro+x5evh84972RRVeJPPYjwNY2HAL
	 Oc7R4+JChlgz0WnLJ7UigA4M1E5Q70WIDc9dcHnq9xS2D6iYvfIDCc81ifjOwrinNFpQq
	 tSHIMmIxHrgnrBJVOghtAOyj1kTQbpvCDuUGSh+tYxMFFCOekqM8LuDhL026WclIoBCLv
	 d+HToQmWYS7hJ+EmmOCuvb0R60ZnF6xBPeyhbj1HDLO+JRV9wt+AJczNFXCkZUGyzivmZ
	 cpXc3UQOMwRHHLzPuNDhCIwJ31PRNV+7iDbYQRkQrm8FQPZNaBzceDMM5tWtKUF9IqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=X8NsmiHZ;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=IYTw205s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F5C606A323;
	Thu, 26 Nov 2026 11:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36F5C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=X8NsmiHZ;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=IYTw205s
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAZbt33001768;
	Thu, 26 Nov 2026 05:22:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=TGJLGUZL5TdAYp0ot7buukDeqmlNr9nL/LEllHfAO
	aU=; b=X8NsmiHZz/1k01HehHqIH9LBlKNUJ4iGP8lYtmTunmWT3dFvcpYD2RLxD
	GkdbnxWFmTth6Xzp148eABsAH/yp4wZHM6w9Shb2eeoJYMXnB4m5z17F4W+/vTCV
	TyrD05YYMUuOvN7EmQCaRjnzHTJReFsCCCACxtVsRZcQou4O4UqaEkl18BOjhch+
	b/W4fhLgGWZpCk7wqwGDWRdSHllCroTglGvs69K4uD6eLUWcfH3DXYIzonHX3sfG
	qKl5kpB7LkdttP1hblrWo5EzW0Ij7JHL76aSOMa74pH30h5hOx38P9eP4GEaozuc
	jinKMaiMXQaxVY/Dv6JdYZg5ZDDzQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j6eq9sp4a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 05:22:06 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4x+6O0QjkUmM9lvuD9uW2QQgx0Cp0WkSYNzyH0O6mhzCgAbqxUEO2T5MJKTIZejFyr/ByCnylHFDLtR1eHvOmrGJA2YCtYtiQbgN7/Odw09gdN6OxzR+yKWGvesZReg1lLUSGh0L5wbci8hYZWmK82h+mr73hoTo7kmBIJKcgYQYyJQLzgFjX/TBLR1mEsmUKEeUbiUMj08ReXRwbIRKd44k0kpkRTT3hY543pvQ/kOxnDL4Lxz7s2kOmHilfUpZQPERjYvMgqqFSTLU8942jZeZsJ5IfziSyA3xDXNERvYl81yl/a4+Um8U5k4Ms4+mUNL0MmN2x+MKrFKUt3uvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGJLGUZL5TdAYp0ot7buukDeqmlNr9nL/LEllHfAOaU=;
 b=WdI2l+0XK21yeeVyzFMl4Xkk8P7cQ3vV4CqcBzqJlCDuJcSJzV9AKPmDliVvQ1zicIL8NGPUNurq5KzX0+j3zUusb7yaDn/zOkP/4pZh5SOwvVKZ6g+H3S97MeWRDU7hi2puaPYILK8v6cPaLNGP0rzqpgpABPIOksswcJOYcbjZKwnINEMd1FcSkxJqxbN4STEkZ9hZtV4SJAl8+xUaccSyE8e24nALLiE7DNRv0qsLqk1lfpDfmQq/ULBhzxssE8PBAuIB3C3ojQKaRtz4SZFs7Hiog4JVOvpQywCK8EUQQWvppkGiAXq1sbQUG7ma8FudrIiB17wR6YllbWAjBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGJLGUZL5TdAYp0ot7buukDeqmlNr9nL/LEllHfAOaU=;
 b=IYTw205sq71seaEz0n1/EHULgQELOOfNPlzVBz7kAU0xNWl2CtInxeRpcY3fPoUr5OHxekE/w9q9WtMI4flWZDmg8DFG9Io6rk0Shs+QOg1o4KZ1X2cLBfryriZYF89pLIDwFyX2PMqc3hEW5F2KMYZ3uQlGyzHrNDg5eppCcf8=
Received: from DS1P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:44c::16) by
 DM4PR10MB6085.namprd10.prod.outlook.com (2603:10b6:8:bd::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 11:22:03 +0000
Received: from DM3PEPF000265BC.namprd04.prod.outlook.com
 (2603:10b6:8:44c:cafe::1a) by DS1P220CA0023.outlook.office365.com
 (2603:10b6:8:44c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 11:22:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DM3PEPF000265BC.mail.protection.outlook.com (10.167.23.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 11:22:02 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 05:21:22 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 05:21:21 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 26 Nov 2026 05:21:21 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.250.64.62])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AQBKwHX1596498;
	Thu, 26 Nov 2026 05:21:18 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 5/5] ASoC: tac5xx2-sdw: drop DSP algo re-enable from port post-prepare
Date: Thu, 26 Nov 2026 20:20:23 +0900
Message-ID: <20261126112023.29054-5-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20261126112023.29054-1-niranjan.hy@ti.com>
References: <20261126112023.29054-1-niranjan.hy@ti.com>
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BC:EE_|DM4PR10MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: 0155151d-4ca2-4a47-ab15-08df4baf7e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|23010399003|10067099003|56012099006|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	T7reEPsZFivYkWbsyf+Rkwi1cXy57a4kvmh0n1ZQ9uWS1oEqJBrXfCiWa3grZyXH6DdcEyL3YEqI8PVAxddmRz/H1ftQkdko4VUEr+2oXsyyh5QNxBRQo2q6aGcaVo5BWogk7jogn2TX18SeG78bubGFcLp7MdehiSVB4DaGUuf0AAsh3QncgZG7ZWhDsw6TcAj71rdZQkDdsjeNReEVMjXwUjNVyO5ghFN8zcMWTxtnbw/WmTBp5202brtWAqztKQyyT2yFDpGEMYCrcHw52J0X6/1PXpXZquLxNwRHk/S8jEvVVc2fXXuAOuWTYJib9MeNqTDsPvdyA7dUqaVDNx1t+W0ZNCgCtX9aTXzu3CFDeyLjR0CpJTZQCteHFjUMkZ/jIyUhgwy+n3Gak6LaK632FFVNQ750d8T11VyqjwCeK2wJwxSF2Svx1pWp0h5RO6Ln4ord8jPMXDLNQIO00ZEquTJ+HahuPEKx2o1q3zzHPA09erjuclcmhRpwy7itfk8U1aKUwWda1CxKujsLXiiJFVD2FGcWpcX+jfwyOH7482cKbCu7aMfDbOOdKo4C0ryVAEEncSCrRyiQX23m5Qwu8vlXT7/DnEsENEjkmO5GEdUylz9Ziq3yTHthW2ccnCy/87QtAB0lU0g1SgCsVFd3iiBUXn8ZN+alywoPcI8Z1zVKAHFo/tPxxajSCUAWECTVXAtD8KyHOz1y7RZ1iA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(23010399003)(10067099003)(56012099006)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ilbvbjYEFm8rIZcN7dktDdA97DFDwMR+P2fSyDrkV+FlwTAqnHYyGpya+Bcn5rLc2w//ufBPGrEDZ0wKovHcQakzP92LxEwHid61T0Mg4cHZSXAcEsV7LX7BlRk0w4cx/zMjGdYkKzUH3YT8et8zwZHbBA3NkMcfgX/ZDh/FumMhX1ZFDXG3FqgJ51znklCMWMZyw4vrd609BG/32iDngOFLSRd6JtXv+IXVLkGSVkEjoU/w0nMFMTtvDCPSJxgypYdj60/nR3vJLkj5BSVXoOaK11+cfDzI28MDEcsDwvyG5OqFeboyg0iPckh3fw3pNWF5v/7+MIo4Rf+PaoWlQkoacKQaDf2GSFEF+mcNRoRStRhXx/8fczXT23ag5t7An2WBprxrpL/dAGwcLnctsBM2oCBKloelgFDZuGPDqOYrvlZjZP2CPso4Qi0x0m5i
X-Exchange-RoutingPolicyChecked:
	nVXnKKD1sThykN46Gm/Fm8CL7rbIUkGhIWIwnBnGqFD1Tv455QHGgRTlugHJW5YShG2E5e+Xc8T1tr3mk8LDFSU7ri0XY22rHUiZZRrPsfaXPC8OQUsnjIJCwVCjQTTJGT9JbDcp/HDpElzaKFCGFqPVoi2QjcJzBCzYLxEVwQSBkYPU5pZPtfq6uFQdyxvRwr4BMgJy8wdvsjDZrpisjNbHDI9Pbm5g0mNs4hFULWTO6lkqA85P+MLZ3lqxbAeJ+/0wZnmMEM6Gi+yuUm9Y4lDWZOCOny4lDYsmDo2JbjrqVSZGkqQQJLc88vmtcYIRRk5oKxMOfaAuFNn1BIdA0Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 11:22:02.1453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0155151d-4ca2-4a47-ab15-08df4baf7e6e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6085
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NCBTYWx0ZWRfX1l/005gZXpLC
 9RvxCJkaC8o8g31ESKdl7GRh8/ZmCukmQD9k+FCHPaFWtHZowFMlyCHFW8YtWu7uBTwtTbQAWgj
 D3BsMVrwtNL2+pFyCq1LRqiv/BfzG0k=
X-Proofpoint-GUID: I2cg9iivkXSlrX_IRzfCFUGi7frPSmlW
X-Proofpoint-ORIG-GUID: I2cg9iivkXSlrX_IRzfCFUGi7frPSmlW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NCBTYWx0ZWRfXwolnPgPFA02R
 onKvv76I+/77S2V87eG9/58OnlWBga1HuX1Smqb1mjIeR0YxbAa1f/h30nBoQiuKzovLTZ/Cfhz
 Kl6YVBVfkrn26S16wnC6p8pH/5yzhpeWwPd1WprDHxJ4137saa9maYeXcpgwLxNJEDoEs+iNI6A
 RStWaOZTgp6rI/MrkiEDi5FbiGXYhMdYswRf4JrT/HQzTBHY9HfpMn5ZvDPptZHXOOoKzFYG5kU
 bhrXN6dUOLsUKwXLRR3ZDFKUAnUeCvh4iocSmOnqHnzBoxoMdn+pWNbAmHnBhO2evnibRA2gMIM
 N0kqt+biE5JJWsyPjYLCCzLlMYpjJJEsSMhcvqDoQpvR2x4rAM0xrYuQLKaYpHvwn49UF/FRF/3
 L+0nBy5qqbXUxrYUjukxxSrnJvCEXSlW7Mp+/leX2YzB1MmsW8ZCWAwOihkvk6aUeQUM+DaxQA1
 Xy3SCp0bf6O06KiACfw==
X-Authority-Analysis: v=2.4 cv=d7JgWhjE c=1 sm=1 tr=0 ts=6b08165e cx=c_pps
 a=GeWWyO5P+zJVL7v3m8oIig==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8 a=zoeuGXUjLV_baAm5KpgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260044

The post port prepare callback was re-enabling the DSP algorithm by
writing TAC_DSP_ALGO_STATUS_RUNNING if the algo was found not running.
This is not needed as the algorithm state is managed independently of
the stream prepare sequence.

Remove tac_port_prep() and clear the .port_prep ops entry.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
changes since v1:
* newly added patch

 sound/soc/codecs/tac5xx2-sdw.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index d679a4194..7140cc111 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -1984,44 +1984,10 @@ static int tac5xx2_sdw_read_prop(struct sdw_slave *peripheral)
 	return 0;
 }
 
-static int tac_port_prep(struct sdw_slave *slave, struct sdw_prepare_ch *prep_ch,
-			 enum sdw_port_prep_ops pre_ops)
-{
-	struct device *dev = &slave->dev;
-	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);
-	unsigned int val;
-	int ret;
-
-	if (pre_ops != SDW_OPS_PORT_POST_PREP)
-		return 0;
-
-	if (!tac_dev->fw_dl_success)
-		return 0;
-
-	ret = regmap_read(tac_dev->regmap, TAC_DSP_ALGO_STATUS, &val);
-	if (ret) {
-		dev_err(dev, "Failed to read algo status: %d\n", ret);
-		return ret;
-	}
-
-	if (val != TAC_DSP_ALGO_STATUS_RUNNING) {
-		dev_dbg(dev, "Algo not running (0x%02x), re-enabling\n", val);
-		ret = regmap_write(tac_dev->regmap, TAC_DSP_ALGO_STATUS,
-				   TAC_DSP_ALGO_STATUS_RUNNING);
-		if (ret) {
-			dev_err(dev, "Failed to re-enable algo: %d\n", ret);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
 static const struct sdw_slave_ops tac_sdw_ops = {
 	.read_prop = tac5xx2_sdw_read_prop,
 	.update_status = tac_update_status,
 	.interrupt_callback = tac_interrupt_callback,
-	.port_prep = tac_port_prep,
 };
 
 static s32 tac_sdw_probe(struct sdw_slave *peripheral,
-- 
2.34.1

