Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795536709;
	b=bpPhWmqc7ZV4W88wjRjuiTDcidgXtHXUBGdqSPdWkP1xcFDzwoX7Z/5OQPHmCYCxVUH7
	 mTSsht17XqF3XOu7piDPfPjGpaUAvDfwY/Ux654ekmPLZddbdSaKuR5fBfxiIA7RIWtnr
	 3a8aBy0BHL8XcSguxQSf9wC4BmxB0tPJZCnZEMUIyDUsBCkPu8RPFXFnJICY5qcsunXbI
	 mC3NgKN+XaQ51MbdPEGvPhLRhkIe3TDVPkd7TSCgo1VhzYTNC1SDee8cW3U6mOC2yzcft
	 T1X5br7m51QwlJlXNNYbi9l0LM2WH5wQNBqqobkuQzo/iFAYjfBiPbFxJHeXaezKevQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536709;
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
	bh=0Ug+mg/rb3zTso/LsVosfH/1hW8EWia5ThesUXE9k1M=;
	b=vgGMW7yNRJC5yrnNwLZMR8TyZ4/sTkxQICQiw7CTcokuQLJcppGQTBnFswEShCW6TETL
	 thCzzwfQKUjbwjTfrzvYCZwjRSHMRSODraGi/Vn4YQJw0ccyeESCW5dLvgmCY/pqf83Os
	 FSQKxGKD6ocHbkYXKRKkFObbfVwPzBCi4EyHc9vgXIlavRQBs/8ajiZq3UVBa54rBSfGc
	 +LwZiJRq0rAABYaxjs4aC0nQmERwPan1R+ZE+K1yQHR1B00BwWwxhEIGw5Gwz2oVsTy2N
	 8vu07DZ1iAwThkFFxlPPDG5vqVz7SrZYng0uF9vIb2d73RBS8eXwzKUID7mFUPefeuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=mKrMQOXb;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="Z6S2b/iB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D6C606A32E;
	Tue, 24 Nov 2026 16:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D6C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=mKrMQOXb;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Z6S2b/iB
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFhcPo3999161;
	Tue, 24 Nov 2026 10:10:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=0Ug+mg/rb3zTso/LsVosfH/1hW8EWia5ThesUXE9k1M=; b=
	mKrMQOXb5/VmCWZNg1EFh3oKSAnwJadyZYHb0rUzKU2Z0YVgl8/6ajwhMB+Lmh6N
	GM4NMtRlsGEdWtrMMTggSbpOYD1lRiDvh7ojCZltRAl1fIMEnlW8rtoURLZ5rdpd
	yF6evHypkzlQcp69T2WMokvFw9o6ljoDO8p6qnat93JruFBulOX82cfonW9zoxtM
	HUrCaZE3mr27Qu6fFjovX2FeGn3qq6P5if0ZpeU23axsMFX6bv8svX9bZ/UnVO3R
	yIrewbwBdNR1Yv6s7CETevQHJRpkLOcImXq6a38QfXEsuk3MZlMtmeIweSpndNJb
	CpyvUbpC/0o1tb5Z77ae3Q==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021113.outbound.protection.outlook.com [52.101.57.113])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j5188119t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 10:10:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXEYWnN5V2cs0uJLaJxqn5ABXbv2j7PUJon2aLLldI4cVDfAHNWtHnzVVgI0C4mFqU95Odu/KNJ9ilmEzsTfOY97BV70nrZdgDmi7o585fhHVnIVFMMGoloXU2P2E+fkOngU89QCkw+5QPYSkJrETgEW34nCDlNNB4MqljMklopS1boOASb5oj0bgE0giHjL7uQslOh2xdMN0Au/bPoYPmrhy7/WuCr4XQOT1prxacA5aov+wAmspvujuL3jdjGy2FMo2Tt+79lOhQelWUAr529Y1APGwcM0UwkT5JqxoirVhMThwQwl6ExmUZoswh2sJspyN2HmOb7yJKqP2LpuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Ug+mg/rb3zTso/LsVosfH/1hW8EWia5ThesUXE9k1M=;
 b=VRUEM7OWC1K1//RLDUzatLtOM9K1zU171E4JHzru81jvSU/fYhOo5O2UoKtF75vuiwAEpRsflM8nWRGathWHh5rrd4Hn+puCTZlWaIlTbh1LsdYvmwRxISfPUz2UXUpE2G8AU0fO3UXRYaR9LUANLHbpCkQhhcbMuBCbJoP8yTaC+kzDNd47V8vEE/E5+6MsYm5VAoQgvavei6Cux0QRMXj5fEQl/NbhgQQx7xog9HQpDIr6EkkzqW+3Ud8VPNSI4CfchWXBw57+fEA4ZyC2eNhX3wyqyTM7LIp2VY1mhXJ0G/Dk5xXTDMbolZD3YbxBvlBihSM/jPmLghJIFHCEKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ug+mg/rb3zTso/LsVosfH/1hW8EWia5ThesUXE9k1M=;
 b=Z6S2b/iBbg/o04Z1Y57jB+c+yrkuDiIKCqYshCOxTLCfZZA7rjZL5VuG5k5vW5p3VqwMmC0if1Mdv08OZXxQwH58XmXeaw3x+e5+xWa2HI2/SE2ItA2r93hNynklkTjbGl8340iqtCSOKgcDVRKcN+DYIq5tMp4Fkc9chQJCdg8=
Received: from BN9PR03CA0868.namprd03.prod.outlook.com (2603:10b6:408:13d::33)
 by CY8PPFE5A1B3DAB.namprd19.prod.outlook.com (2603:10b6:93f:fff6::60b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 16:10:07 +0000
Received: from LV8PEPF0000005C.namprd02.prod.outlook.com
 (2603:10b6:408:13d:cafe::c) by BN9PR03CA0868.outlook.office365.com
 (2603:10b6:408:13d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 16:10:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 LV8PEPF0000005C.mail.protection.outlook.com (10.167.245.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 16:10:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3B47C406555;
	Tue, 24 Nov 2026 16:10:05 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1564B822555;
	Tue, 24 Nov 2026 16:10:05 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        kai.vehmanen@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 2/4] soundwire: bus: Don't unassign dev_num before unregistering device
Date: Tue, 24 Nov 2026 16:09:59 +0000
Message-ID: <20261124161001.702882-3-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005C:EE_|CY8PPFE5A1B3DAB:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7c0f0d98-961b-4131-5440-08df4a4567d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|23010399003|82310400026|10067099003|11063799006|56012099006|261021135927099003|261021121427099003|261021123027099003|261102123227099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XY+k8grG8s9Yjd9v62mDMA3p0+wTnrIHnaHP1pRF/hEi7sXZcBA3ZY9XNTQFwUZkHrxdG/QHIVKXuUDAOU8h/tsx9cE8gYLy8Ule85OOlNPVEUbYc9a8KrNPudhy+wy5bbdYquDhbRze80kxYfqq4gEAGhoqpqeCureuylwILqTc81z3T6IGtELMSjIdl2yxokaXEvMouQ89r7qyOK1D0jRhE4XvaYU0YpR6NPGdIMvWyGDUiAJO4Pt2gHJx88YZCsrv3XEagWFLZ/XBBdDlXGchQqKe0NsrvzqRI369bUbmBnhLJL4LMv1aixB0mRggRNoiSXfIWrGwDcu5D6EvlhDnC8rU5A65AWZfKprtztmYyaffdV/ZAwaB+uzqgvjsezo6WmYqienRY9pRwxdRpFSgU3Pn0kcOr+R0xdC7VM9GXm+fOlhI1tPiVfN5hCVXtF9gaDmTVvHc42Z5D52oaGpLW/jnLw9tTBxzLUa/CQIbeDOx9Lg0wOtyZfV2kDhAnu7rddK6XIGyCe1spekbvDirs0WyxYr+kzQkChR3OFVzbKvL6Va1SNgSjHDE04ChfsYkYVMbKsGdqImejpj5WCkAR6CzkkY+VRnl/ujmeFQpTitZ2/ARKyff+km+hSYpjz5pfzqedVXeHN7tKvT2G2O+vXA6qbSx0Cj49p0afiB4Bmgsk2PgqhnzpHH7UugDTZIMDQzK3xYkcCFL+DdW/w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021135927099003)(261021121427099003)(261021123027099003)(261102123227099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hnFpt2syvbPMTQ56S5WZYN1xeh2yULwcnyovIaS9RvNsZRIQBSmTCroq5lrf3rDJ86wK47TwLZNktzSj6xg/v/X5huxdiNqnLFkTB1arNQ3jcvYavk+Xkl6HBwruK9m29GlSPdzAFjz32xUna0hGLqftqEVnbNhKKgNAp0yvrDkLPQZDcJRDPtgLg6g2jtlFIUMbgKxiBmKNpzSWdoyDLvvlo8mkFVeVFrclnUQzvCCrHkXrrbjUPGxl1ppYeudMOtWned36DqKrlWtaucj1yiW9fytyYxnThQZACtXJu+Lm+I43PKY/Tk7Ckbrk8h3MlwjRQVNMA749f0OttFKKKOYdvx3ojfiiLWpFZaWAgIU8jcZgV4Ke2HcrmWH+ohcoHDovOhx/p9BLnUs0uYEKOt5oZHENGiQ+OZcigVHFIIM+etGUp8urlws7KUxgApH+
X-Exchange-RoutingPolicyChecked:
	H1y1scJFLxQu/oFvgo1Fujq5OkIZ9HtuQzGWTr5Ra9u1xnDrYr47FeTR+NHNQxE6AZpfyddkT9qWgnuJvuQVTr4wCu76DkrvheALij8kUS2io5pt4WgAqzhi7FPjGk7UVSWHJAa1E59SuOEtYl3+Rs6hS8D7HJ5n9DHVBvVbhM6ji36ieBWKw+75Tcr5nM6jCflGST3C1FBzUoYZ76GKEvDwXd8naYwjmJvqd1DHZh136kwkhgLooJMR9dy8FcnDl/xjoEaspk7xkDjXQ5ptzWZUXx7KbA7NrwqkUnOmoL1PwRC1XW6d27L1puLrbeEztwLa2tmvarddCH52VkuOsg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:10:06.1203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0f0d98-961b-4131-5440-08df4a4567d2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-LV8PEPF0000005C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PPFE5A1B3DAB
X-Proofpoint-ORIG-GUID: 09Y89x3eE-Rw7y2ge1gH5_cFqRje_JPf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfXz/3XbEDA5rKp
 39Dw1+DGS+v8hlF2xhp5jpqQaGEYfG+uWH4Mp1et4b/5O6ZRqk2gNyI2hddMcAggtF+uRjj8Gju
 XSslJHHZPQkyGzu4GDO3x2rKAkbD+IRrEZi7zFlOmdh/UIzik2tgiLPAMIHBwiNpXxxbcWAjzOD
 aYHJdEwKQtw15gcK08IzYhIHBXKAFW+uMTckNsmL4HFsTiUZeA9IeSz9BT3jo8bZ2oftRuCKGhS
 VFr98XjOS/+ywIHPyTchYTMr8ZvYSio4bsK1auIYyKGonQS8QGAYYR3JZEc56IY2lwRYOLV5tv8
 cQtSGPQaa8uTSJpcxYCS9REdNam2HLNt/5xm2mLcSOMdeAyS7iL0iUP5H9nHbQdAMsvJtag3WfB
 Ac7Hi8Y63+UsjLjbfapo8TnmGIU78x2dUtOIyCoKvaxiXZ8ElV+lIAYpECxJ+b8Jm+eB6S+KGGH
 OTe+PMBpTfvL0bZe3ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfX/e8M5AWpkiVH
 57p0VBtAY/dXoUaeH2GJ0jFFOECf7bkzfZScbONQArD2A/A4rHZDqn/Hy7tWS2U97m7qZtjLkly
 Dtflu9+09r+jKBIQB4fjrymoZNfKLWQ=
X-Proofpoint-GUID: 09Y89x3eE-Rw7y2ge1gH5_cFqRje_JPf
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b05b6e5 cx=c_pps
 a=I4gKhz1MVFc1Ib3WWZpdnQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=gYybnV_sw2No2sUOuNwA:9
X-Proofpoint-Spam-Reason: safe

Don't mark dev_num as unassigned until after the driver remove has
been called. The driver may want to communicate with the device
as part of the driver remove operation, so the dev_num should
remain assigned until that has completed. This requires moving from
device_unregister() to manually calling device_del() and device_put()
to ensure that the slave struct isn't freed too early.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 drivers/soundwire/bus.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 15c66effbf4f4..001407fa50ddc 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -175,8 +175,18 @@ static int sdw_delete_slave(struct device *dev, void *data)
 
 	sdw_slave_debugfs_exit(slave);
 
-	mutex_lock(&bus->bus_lock);
+	/*
+	 * Split device_unregister(), the framework level needs to access
+	 * members of the slave structure after the slave driver has been
+	 * removed, thus the device_put() needs to be delayed. The device
+	 * number needs to be marked as unused and the slave needs to be
+	 * removed from the slave list. These can't be done before the
+	 * drivers remove callback as the remove callback should still
+	 * be able to communicate with the device.
+	 */
+	device_del(dev);
 
+	mutex_lock(&bus->bus_lock);
 	if (slave->dev_num) { /* clear dev_num if assigned */
 		clear_bit(slave->dev_num, bus->assigned);
 		if (bus->ops && bus->ops->put_device_num)
@@ -185,7 +195,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
 	list_del_init(&slave->node);
 	mutex_unlock(&bus->bus_lock);
 
-	device_unregister(dev);
+	put_device(dev);
+
 	return 0;
 }
 
-- 
2.47.3

