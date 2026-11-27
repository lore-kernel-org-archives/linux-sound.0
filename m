Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795753796;
	b=xjkEERnG5BrB9EL921SjMRW33BnbkJDRd5E0NZUqp/gI4+2y9qgH9eX7o5vVVJC5beOU
	 kQUnwHj76FVa/fj08e/vwGqPw9ietDBaWxb55O8VK1FuPQaOCkhTW025UoOsaRdA9e+FC
	 ICiG65IS6xWGMqaEGY3wo+CqFqttk3Y5UEdZ3g5axMVUHozR910bqHYmm931mbkadWN/k
	 Pc7NAi5ve4P4w8eD+mEmNF96eYacAWUp1DOSWS9C6kDV7deyWyFBp5v1t0ETgwjFEzA7g
	 lHDQOc9c2aZbUWdt3q/p0CumEcj1BJML+C+t96baJWm/7rNMDOMPMM8qp+8fpE1PzbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yTk8erd/3e6MITpi7S5tB3d8Hf+e34ebQN8cz87cMSw=;
	b=baZ0tZVhoJvBdKwySbUZnaQptEy2dnPP0ziP3QDf9FhauFDx8c1n5dAR43+cppwDJFNC
	 bD4rLhOTKpIiORFPe5AmBqqlWfpAqLMFwQdOSTHo1d919vZ2E6kbricBOGCA9nDS8AX/s
	 5ngmdybE2sBzaf3rypyo9LggeTwAjc77cQxpI9oEzwD61QNXov30vs1QSirBy9ebUlV1e
	 gnRWos12j6kDpGeA+VHbeuT7HzS9Pc0c9JDmJntgEtQHO+L2gOHOoLqFsmAebRsXRfuGh
	 QE4g4U5XL2n3P6aE86SuTKl2YMTA0z9GfqTGpyTJJkbs68dDi1Eh2CsO31jFgKeCVbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=IVtPLKyk;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=ZmBXSrco;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5830B606A31C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 04:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5830B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=IVtPLKyk;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=ZmBXSrco
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR4R67I806110;
	Thu, 26 Nov 2026 22:29:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=yTk8erd/3e6MI
	Tpi7S5tB3d8Hf+e34ebQN8cz87cMSw=; b=IVtPLKykStagkuyvNrEWHCorMGS3G
	Wi/i/HnuqPdc6VgaulbBgHaHGkTDT1gq0pav+ncgg1gHE5QW9i/ud9sEYexEZRvW
	lZup3GS/PzMDxE/N6iL/3DSgBj1M1/UWAb94wMsgb34bSTSG/TvzUPsoo7US1Rtv
	NHu74kFCNZVW61oiNk9WIFUPhapnJS4MyN2x3hkXHTttyxGolK5VDBA1LdqVO8Zj
	fsgGD7gSnRG7mrvlu/sTFmp8eEsCK+Y4LI4iJ6apzQXbIPe4Eo+xQLINm3el817u
	Cp/IM3TArzOf2nonakQ5fToUaR2Gr4QvGPSVEcD7w9iTJoo1wma1Qr15w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010069.outbound.protection.outlook.com [52.101.56.69])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j72ujr07x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 22:29:32 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUoKBjOoYBpbcluic9sSsAeZ7dFnH7xVPiD32owoKpT9HwDTecNHj+m1VvX83uXIKDYbH/wJY5P8qTC+yItpz2LSoBgnn7aCFSnLrB93c1tXcqR4H1AsnqJRbkfSpQpqyW2hqq8KebYyckkQbPz+7C7GiMizIiZpuiYldaNO06SxwoaCX++21pkZNv+hkEamTzLtxN//rw0bLWrWyVzQtFOJqWicGxQNRiYK4iFVsKouVCFURVLYTrSGHvs00bhbeJg2grzKWc2NfbWsX85I9YVe6AQqW4Fn2PeF7PQF0urrnAF8Ah3qxRs6rGVoaIbqQxs+xH3yUMNwM3NGnzIu7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTk8erd/3e6MITpi7S5tB3d8Hf+e34ebQN8cz87cMSw=;
 b=E/WOJnbvJA2Q+dcaoA/hz3juj4BD/GjyVactOtcTVHDsUoG55LBJ0O/D3kpfXU/CQ+TFhLcD1EJILbZRAjEmHk3CeFTbXVhDL8gN4sbmu5ZlvzQ/z6xSEeSvNtsSnQHKi4/VuWgrR1qQ7rJqZFbG/KRpQ/TCaCNRmubu89+tSOJnVnLKK250F/k6FFvXobEg8iJwarYvcPrIC4qAG5w6n66ypXV91bOh435Rg/uAjBSkjR8SYRamUiYANlFLO31/+1MyxXQg3gB4cpmRGLbzUh1DMHkoswgApRTETIMkxRPWJtJeZOYqxlbM6RI6t1JX/Jv0tKQOGbEmoEaIS0aUyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTk8erd/3e6MITpi7S5tB3d8Hf+e34ebQN8cz87cMSw=;
 b=ZmBXSrco9+F+vDF11PeFKaDdqfIvWSuDguh9tHfrHb5mOEGxO+tMKiNcl0gJAGa7PdUAxWZyZY47CFT5uZmfRkuk0w/bjPigvi7FyMAb1BmWnecjOSSlNkciC2bcPU9LDwKjFNQ+zXn+R0PR9J0eIvh46XRGwMIh8oFNIc6naEo=
Received: from BY5PR03CA0006.namprd03.prod.outlook.com (2603:10b6:a03:1e0::16)
 by PH7PR10MB6378.namprd10.prod.outlook.com (2603:10b6:510:1a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 04:29:28 +0000
Received: from CO1PEPF00018861.namprd02.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::7d) by BY5PR03CA0006.outlook.office365.com
 (2603:10b6:a03:1e0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 04:29:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00018861.mail.protection.outlook.com (10.167.249.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 04:29:27 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 22:29:04 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 22:29:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 26 Nov 2026 22:29:04 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.66.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AR4T02h2982291;
	Thu, 26 Nov 2026 22:29:01 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: read TAS2573 status registers by entry length
Date: Fri, 27 Nov 2026 12:28:56 +0800
Message-ID: <20261127042856.1672-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00018861:EE_|PH7PR10MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5a5d6b-e075-4d32-4975-08df4c3f0601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|6133799003|261009223027099003|18002099003|3023799007|10067099003|56012099006|261022075727099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	X+pc1Guj1pfX6bccv43h7n8b2LM8l/5pUYUbO/so7n1KvOleU7pyHbAA3Nz6LbAagvcnrNBa5OG8JZpfwAvvhSr4qdg95WloA8DGXWBECSwTUm+hnAd4Dfv/E03/3g0FXnvl3U4126xbfQ637Ll76Nsn1eafS0yH4o9XvpuMmWcJ1UFnVKSNT6ahUl/8hFkVijjqYlGML3zsYqfDVULOhnk1mXC7KwHQ7sWECjpJh1NzoveCXW8edEBRieJVbtYtoEhmpDuQJl//W1P3s7ohctmEkI8EwP3pF+mxrb+P0CHAEl9H5v8Jtu+1kPuisxONw7WXKdEhZikimGL+/KTuze1seryJ1+1YA8eOpU3Ex2rQIT0mH8RXJgQACxpgWamehXzggrrXYOM4etNkOP6Sn0sQjDzfyFBG3UMtLvd5CmC/I0M4SncOGDW4383Rps59MUaRWg0B+KJGyA84ZiOweGFJ+s/KhPRhDyJCIGSORqSB1IoUfBhoISzBQo5Fe7eh1OcpOZ4ATrDAlVsMWGZxXa2nYuYIpjaxfJTAsQgFqCUuRK9585+Jj9uoz7Q5ZBkIX/inRVFsJPZY1T22fq886F3sV8gZkq7Wu45rFMHRcfFPaPYPyrQtdJ0xJ3z6aRb50zsgLqDqpig8H7iD3CLGXO2aG78FYjOUl3KqnZRvgSgD6FuLxPa/+qNvWhMdDs4YbdtC5Pq0HLuBIlR4WQehqg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(6133799003)(261009223027099003)(18002099003)(3023799007)(10067099003)(56012099006)(261022075727099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3ZPS5KwhVZ08IVbmnDihWGYA5zn+ScbigRfNRxffCqejUW9x+1r1NbeZQ4WDtdwwx44h9fJPPBCDdKVWF6vUSbOAE/KWb7g3FCI5kIDQchWgU3wM8eq19wJOLBJ8X1r6duO7jR7uzQbofiDtJLWXDQEBR822zNaYHj+bAefV3LxdwMA7mC5wxmN46tXXpzH0obg+Y2bDacF5PlcgvAGRIqmI1rrYrAIrzDUfBh9OCiinIyChJF6nAHnfnTSGin1p2GZU9y5sCnoEiFnnvIsQFCHn2XzzhjO6RTQy6ZfcaPhTGNvOJexc0fE1wKIm+XmaVQqIrAZcvbXnJ5+Yav4LnYQnetk77DJqv6vtCcbq260MK//qu26RTNboM6UlScgLU9QTegDQce/GWBePih0EJy2dsktbbpicNuA5+c1tcbDTLSVeD3AjtWuC93q8mufs
X-Exchange-RoutingPolicyChecked:
	PydhjF447EI+YpF6ADF5uymD3JIDZ5dsvB3Wme5W1eU0DwFNIWfLuOGnsZDwGI/X0833slyKNNVT9uMSA3Nyanvcpa66oFG5cF0DzqmeMGyzYDBiJybjQi0x9zoAf+U6GwrE+9OssVzbgBV+gNrXHFLRmIGKn6tZ3O9hMIziwiRb25XR/fna3DRuTDfebUToFb7HXKrM2PKvJ31dKEpmBroKAbmPHyjsimr9CxunPF9FRyGkKmUsXP+t6kFSuVgGSm48jgu7jFNvrOdyDiafdVT8+5Y2IckNs/HJ3sS81X0UgsAS+BBRA3N5L4XVjhz8oFKGJspVhqHJmBOo0F0y9g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 04:29:27.5889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5a5d6b-e075-4d32-4975-08df4c3f0601
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018861.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6378
X-Proofpoint-GUID: 7AKW2tqZrPGDTImzLdCMBhn8ejPyzHYS
X-Authority-Analysis: v=2.4 cv=N/y8hG9B c=1 sm=1 tr=0 ts=6b09072c cx=c_pps
 a=vVq7UQVwO1zAg9gY0+x7SQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=XHAq13cZMEaqRE7jc6IA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxNyBTYWx0ZWRfX3qxczGQmLQhP
 EH1Bnz/j+0W6Vzt1b0mJc4yicHKwaCUdK1qbK2XnKOnx0yWtwVHdgH+YicqDtlQh3Y7ZNb4HshQ
 Mwg0yT5m9RvlNz630SIntXXtRbz6JzREFgk1YSxH88OKuYhbhdjXVXDGU7h/GKkzF5VgTUMBxYK
 OxEHZuNDXn1ny8wT+IuP+oP+G0V7mydhddFuvcDoDZsDcSvM53va6dCxxOgusyzolVlKsk6TVTB
 YL1SMn8GSGr1Hkd9u6fQcHfJJ7BOo2KePQp1t2Qx44wnZRM+qnvNSnJTF+6Bv2vAQDl8qgxFPD+
 6X7UlGoqPXG6U+TTuZMGSe4FlmaJHfQuCOvAqCs/n6sFwhCcBJiifANwOHQ6FQTD06PM8IbEtZr
 X0zi38aMbaHy1bBBx3tap7UIuZqRY7AYnS/RktJtbJXI4KrypvJADEZevK3mguiIaO4fjkyzM1e
 97gsDRLTBSbI6mAaHmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxNyBTYWx0ZWRfX5ZEKTOSigwDX
 4Usz+2r+26ua/JbJCz9lnrCTT39dcP89jmHSOvwHZh6lCWzF/m+UnbLJMzC1P4P4cj8gYDZcY44
 51+Z2ZljypA4qhptSF5/yTb8tXeevlU=
X-Proofpoint-ORIG-GUID: 7AKW2tqZrPGDTImzLdCMBhn8ejPyzHYS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270017

The TAS2573 status kcontrols read registers through a shared descriptor
that assumes the first register is one byte and all others are four
bytes. The assumption is position dependent, so a one-byte register can
only be described by moving it to the front of the table.

Make the width explicit by replacing the address array with entries
that carry their own access width.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
v1:
 - Convert the register descriptor used by the TAS2573 calibration and
   real-time speaker protection kcontrols from a plain array of register
   addresses into an explicit table of entries that carry their own access
   width.
 - Two helper macros, TASDEV_REG_ENTRY() and TASDEV_REG_ENTRY_B1(), keep
   the tables readable for 4-byte and 1-byte entries respectively.
 - Now that each register entry knows its access width, drop the implicit
   "the first register is one byte, all the rest are four bytes" rule in
   tas2573_status_get_common() and select the access method per entry from
   val_len.
---
 include/sound/tas2573-reg.h    | 78 +++++++++++++++++++---------------
 sound/soc/codecs/tas2781-i2c.c | 66 +++++++++++++++-------------
 2 files changed, 80 insertions(+), 64 deletions(-)

diff --git a/include/sound/tas2573-reg.h b/include/sound/tas2573-reg.h
index 6f8411c695eb..b23d14b93319 100644
--- a/include/sound/tas2573-reg.h
+++ b/include/sound/tas2573-reg.h
@@ -14,16 +14,25 @@
 #ifndef __TAS2573_REG_H__
 #define __TAS2573_REG_H__
 
+/* Descriptor of a single register field: address plus value length. */
+struct tasdev_reg_entry {
+	const unsigned int reg;
+	const unsigned char val_len;
+};
+
 /*
- * Register map descriptor: binds the register table, its length, and the log
- * tag together into a single argument.
+ * A named group of register fields accessed together. Each entry occupies
+ * a fixed 4-byte slot in the userspace report, regardless of val_len.
  */
-struct tasdev_reg_map {
-	const unsigned int *regs;
-	unsigned int nregs;
+struct tasdev_reg_table {
+	const struct tasdev_reg_entry *entries;
+	unsigned int nentries;
 	const char *tag;
 };
 
+#define TASDEV_REG_ENTRY(regid)		{ .reg = (regid), .val_len = 4 }
+#define TASDEV_REG_ENTRY_B1(regid)	{ .reg = (regid), .val_len = 1 }
+
 #define TAS2573_TDM_DET_REG		TASDEVICE_REG(0x00, 0x00, 0x14)
 #define TAS2573_FCT_INT_LATCH		TASDEVICE_REG(0x00, 0x00, 0x67)
 /* YM57 */
@@ -59,41 +68,42 @@ struct tasdev_reg_map {
 /* YM955 */
 #define TAS2573_SHORTCKT		TASDEVICE_REG(0x00, 0x83, 0x6C)
 
-/* Registers for the speaker calibration */
-static const __maybe_unused unsigned int fct_status_regs[] = {
-	TAS2573_FCT_INT_LATCH,
-	TAS2573_FCT_STATUS_CTRL,
-	TAS2573_FCT_STATUS_BINNING,
-	TAS2573_SILENCE_DETECTED,
-	TAS2573_OPEN_CIRCUIT,
-	TAS2573_SHORTCKT,
-	TAS2573_FCT_OUTPUT_R0,
-	TAS2573_FCT_OUTPUT_R0_LOW,
-	TAS2573_FCT_OUTPUT_INV_R0,
-	TAS2573_FCT_OUTPUT_POWERTOT,
-	TAS2573_FCT_OUTPUT_F0,
-	TAS2573_RE_OUT,
+/* Register Array for the speaker calibration */
+static const __maybe_unused struct tasdev_reg_entry fct_status_regs[] = {
+	TASDEV_REG_ENTRY(TAS2573_FCT_INT_LATCH),
+	TASDEV_REG_ENTRY(TAS2573_FCT_STATUS_CTRL),
+	TASDEV_REG_ENTRY(TAS2573_FCT_STATUS_BINNING),
+	TASDEV_REG_ENTRY(TAS2573_SILENCE_DETECTED),
+	TASDEV_REG_ENTRY(TAS2573_OPEN_CIRCUIT),
+	TASDEV_REG_ENTRY(TAS2573_SHORTCKT),
+	TASDEV_REG_ENTRY(TAS2573_FCT_OUTPUT_R0),
+	TASDEV_REG_ENTRY(TAS2573_FCT_OUTPUT_R0_LOW),
+	TASDEV_REG_ENTRY(TAS2573_FCT_OUTPUT_INV_R0),
+	TASDEV_REG_ENTRY(TAS2573_FCT_OUTPUT_POWERTOT),
+	TASDEV_REG_ENTRY(TAS2573_FCT_OUTPUT_F0),
+	TASDEV_REG_ENTRY(TAS2573_RE_OUT),
 };
 
-static const __maybe_unused struct tasdev_reg_map calib_status_map = {
-	.regs  = fct_status_regs,
-	.nregs = ARRAY_SIZE(fct_status_regs),
+static const __maybe_unused struct tasdev_reg_table calib_status_map = {
+	.entries  = fct_status_regs,
+	.nentries = ARRAY_SIZE(fct_status_regs),
 	.tag   = "fct_status_regs",
 };
 
-/* Registers for the realtime (RT) speaker protection data */
-static const __maybe_unused unsigned int tas2573_rt_data_regs[] = {
-	TAS2573_TDM_DET_REG,
-	TAS2573_SPK_COIL_TEMPERATURE,
-	TAS2573_RE_OUT,
-	TAS2573_A1_OUT,
-	TAS2573_A2_OUT,
-	TAS2573_EXCURSION_GAIN,
-	TAS2573_THERMAL_GAIN,
+/* Register Array for the realtime (RT) speaker protection data */
+static const __maybe_unused struct tasdev_reg_entry tas2573_rt_data_regs[] = {
+	TASDEV_REG_ENTRY_B1(TAS2573_TDM_DET_REG),
+	TASDEV_REG_ENTRY(TAS2573_SPK_COIL_TEMPERATURE),
+	TASDEV_REG_ENTRY(TAS2573_RE_OUT),
+	TASDEV_REG_ENTRY(TAS2573_A1_OUT),
+	TASDEV_REG_ENTRY(TAS2573_A2_OUT),
+	TASDEV_REG_ENTRY(TAS2573_EXCURSION_GAIN),
+	TASDEV_REG_ENTRY(TAS2573_THERMAL_GAIN),
 };
-static const __maybe_unused struct tasdev_reg_map tas2573_rt_data_map = {
-	.regs  = tas2573_rt_data_regs,
-	.nregs = ARRAY_SIZE(tas2573_rt_data_regs),
+
+static const __maybe_unused struct tasdev_reg_table tas2573_rt_data_map = {
+	.entries  = tas2573_rt_data_regs,
+	.nentries = ARRAY_SIZE(tas2573_rt_data_regs),
 	.tag   = "tas2573_rt_data_regs",
 };
 #endif
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 2dbbd13f5e81..f59be9d7ac31 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1549,7 +1549,8 @@ static int create_tas2781_cali_start_ktrl(struct tasdevice_priv
  * pack the results into a report.
  */
 static int tas2573_status_get_common(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol, const struct tasdev_reg_map *map)
+	struct snd_ctl_elem_value *ucontrol,
+	const struct tasdev_reg_table *map)
 {
 	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
@@ -1565,40 +1566,45 @@ static int tas2573_status_get_common(struct snd_kcontrol *kcontrol,
 	dst[i++] = 'r';
 
 	/* Emit book/page/reg triplets for every register in the map */
-	for (j = 0; j < map->nregs; j++) {
-		dst[i++] = TASDEVICE_BOOK_ID(map->regs[j]);
-		dst[i++] = TASDEVICE_PAGE_ID(map->regs[j]);
-		dst[i++] = TASDEVICE_PAGE_REG(map->regs[j]);
+	for (j = 0; j < map->nentries; j++) {
+		dst[i++] = TASDEVICE_BOOK_ID(map->entries[j].reg);
+		dst[i++] = TASDEVICE_PAGE_ID(map->entries[j].reg);
+		dst[i++] = TASDEVICE_PAGE_REG(map->entries[j].reg);
 	}
 	dst[i++] = 'D';
 
 	guard(mutex)(&priv->codec_lock);
 
 	/*
-	 * Read each channel: first register via single read, the rest
-	 * via bulk read (4 bytes each).
+	 * Dump per-channel status to dst: channel index followed by one
+	 * 4-byte slot per entry, bulk read when val_len is 4, single-byte
+	 * read otherwise.
 	 */
 	for (j = 0; j < priv->ndev; j++) {
 		dst[i++] = j;
-		dst[i++] = 0;
-		dst[i++] = 0;
-		dst[i++] = 0;
-
-		rc = tasdevice_dev_read(priv, j, map->regs[0], &val);
-		if (rc < 0)
-			dev_err(priv->dev,
-				"chn %d %s[0] rd err = %d\n",
-				j, map->tag, rc);
-		else
-			dst[i++] = val;
-
-		for (k = 1; k < map->nregs; k++, i += 4) {
-			rc = tasdevice_dev_bulk_read(priv, j, map->regs[k],
-						     &dst[i], 4);
-			if (rc < 0)
-				dev_err(priv->dev,
-					"chn %d %s[%u] bulk_rd err = %d\n",
-					j, map->tag, k, rc);
+		for (k = 0; k < map->nentries; k++, i += 4) {
+			dst[i] = 0;
+			dst[i + 1] = 0;
+			dst[i + 2] = 0;
+			dst[i + 3] = 0;
+
+			if (map->entries[k].val_len == 4) {
+				rc = tasdevice_dev_bulk_read(priv, j,
+					map->entries[k].reg,  &dst[i], 4);
+				if (rc < 0)
+					dev_err(priv->dev,
+						"chn %d %s[%u] bulk_read err = %d\n",
+						j, map->tag, k, rc);
+			} else {
+				rc = tasdevice_dev_read(priv, j,
+					map->entries[k].reg, &val);
+				if (!rc)
+					dst[i] = val;
+				else
+					dev_err(priv->dev,
+						"chn %d %s rd err = %d\n", j,
+						map->tag, rc);
+			}
 		}
 	}
 
@@ -1638,8 +1644,8 @@ static int create_tas2573_cali_status_ktrl(struct tasdevice_priv
 	 *		Sine gain for Device #i (48 bytes)
 	 *	}
 	 */
-	ext_cali_start->max = calib_status_map.nregs * 3 + 3 +
-		priv->ndev * (calib_status_map.nregs * 4 + 1);
+	ext_cali_start->max = calib_status_map.nentries * 3 + 3 +
+		priv->ndev * (calib_status_map.nentries * 4 + 1);
 	cali_ctrl->name = cali_start_name;
 	cali_ctrl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	cali_ctrl->info = snd_soc_bytes_info_ext;
@@ -1685,8 +1691,8 @@ static int create_tas2573_rt_spk_data_ktrl(struct tasdevice_priv
 	 *		real-time spk data for Device #i (28 bytes)
 	 *	}
 	 */
-	ext_cali_start->max = tas2573_rt_data_map.nregs * 3 + 3 +
-		priv->ndev * (tas2573_rt_data_map.nregs * 4 + 1);
+	ext_cali_start->max = tas2573_rt_data_map.nentries * 3 + 3 +
+		priv->ndev * (tas2573_rt_data_map.nentries * 4 + 1);
 	cali_ctrl->name = cali_start_name;
 	cali_ctrl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	cali_ctrl->info = snd_soc_bytes_info_ext;
-- 
2.53.0

