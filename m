Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795003802;
	b=rv+L0jiK7mW3iyuEC89OG6HCG8B4bXmN9+/fwFqliSmqU2SRnVH+PMRY14lLYkniaI6q
	 BTyLXQhIL2OE1CpTFruED5RGqSvPqHYhnK9WQja5Dz/uekVaE/LLr2LgvOCyTr7G/kTYD
	 dYD2u5QCtaCEUJpXWllkg9Fowk72CAKDyq+/YIq744Kps33TpyDG+4wyuwwn/m3ifZ95G
	 1YU1usnx9FWNU7YgCenFHy7/i/9Ig9+9c65ka5F+QA9Eue/f0mGrcOU8q7k2vtq+Rz09t
	 5G1JmRjehmpusDTsYbU6p+Syabifh5JjSUEWhBLLboSdH/q6+MYc8PcXslx7qZ/2SLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003802;
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Reason;
	bh=2sP4fZMEMWSwMXsSzdlv3SI6IgFfbLKQg79Nik+bmQU=;
	b=WaTmbneBE6MFs/zLQIXOy/JEvqte+ecIPvpt6spB5gc8AnxrlUr6+X4xRxhaT3FnTbgr
	 nZ3a5VmIDdK9RO3YtnKnO6DMRlHaFqYxu5KGnkQ20fXge5vKK2tjqlvbUOXAVzOUAufSd
	 bsinMHz829Ikxw4K1o6LvnfzpYdOwInm742XJbZGlIOL/y/3DLlYXjIVi9X66uu5uYnxO
	 D3BS5lLSXR3+CAjwIXfPRII7Tn/TqYjOH1xGFJbrQnUG7gmEoGzdgjwgOz1FHfpVGL9sc
	 81dMMrjedb+mwbgmmq3WO6gqtLs55oDuN9+TolzjPjDLW8246nQlfwzRohzOC1nY0Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=IxAXZ+9L;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=hpmOeQhk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56182606A31C;
	Wed, 18 Nov 2026 12:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56182606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=IxAXZ+9L;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=hpmOeQhk
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBGJhe3891472;
	Wed, 18 Nov 2026 06:09:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=2sP4fZMEMWSwMXsS
	zdlv3SI6IgFfbLKQg79Nik+bmQU=; b=IxAXZ+9LdaL9BAsb61cHCWc1uZJsnwpC
	JX6DcEAxB8Dq5VJHHW7qVlfoN+ikPZQCMrEOObzJW7OXsL7pFFVT01V8Ox+ezAie
	kw4FNGaS1qQ5Ih8/8c2hAyYnL03LXaoVbArkzRIu949Kzml9WAgwN3cXR9vF1C9i
	u2tMGiR+3h34kxK1yo7fZU75cIeOA44FY8fLqXlv4BwBlDUAx4GL3d6phi+Gu/8d
	cvoLbkbf4/F0TESmiqBJIVKQLeL1dCuoSACxTzB1XTmgwL+lI8SuI0URsIpvDqOt
	VA5DfcriInTyH6FewuUQSW5NxJkuY+vI/ZfvQQGSGw3l1PoyZYeoQg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021123.outbound.protection.outlook.com [40.107.208.123])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j0ytsgsup-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 06:09:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmFAkQOg/LsesYprLFeZVZ6XS0XLGvJ5PWyKuBNxpwvYWz92EdbnjONuUoEIlRiON604E0G5nUDRSzfK9LJFZlNI4Wkmfo/evM4UXnH4YvYO7s5oQgnIzQS+Xh/+DyCxrVtrGvC5YIzivD039n10jK4G4g5h+TShEC9oAgC5jO3ROw+/7NhOVyFsZzR/j1pCd7Mrqiit6101iYWGhaVLGmHhJ4pF6q+d6X3FI3HMfwK+SFgc6bvvWJtOZIBqSy1Z1UMPrnFUrBgfoOJkzl3TOeqBhF9x/9GDPKGj6EenWFQdcRNInQuLzquaTYIQGF3NdNuoMVnW1GxY62EfmScwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sP4fZMEMWSwMXsSzdlv3SI6IgFfbLKQg79Nik+bmQU=;
 b=n1APHsPVcTgA2s1i+1YrgswZ6/k6pUewlUhzq180ZYhaYUU0WFttj0Do0eWb31n2mACSqgnhRQje+cgoYfxmoDNweCUfKtyYjvhcM1q93AGIpH+3F7lC64dfTp00naSjX2Eg9ud3Euin1FA9wdM02NKsv6AJqLFz8AxFKJbCAgwwQosdHW/sllc4CJabsnSaI7Qezu8NzVEy5lqgZc/9L2zrc+qGnoz29N1KAz8s3uDDzo3CMeCF8YtXeS/1e+MbtumF2T92DD6LG/1TbpqZMA8yfDmWDA8sM7qXRwFgIiuObufs0VBUNRXc80bhFJPhasoukY4XftD9T70hl5JDpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sP4fZMEMWSwMXsSzdlv3SI6IgFfbLKQg79Nik+bmQU=;
 b=hpmOeQhkI3wsQniRz7Z1RBNzIEEPNL3UvgN8W9E8+7pC//2r93a1tz5U9QvgdDx74vSoUMSVGF8gfovtz06Erf713NOdIQOfq3v0N+fXdUXu8NyFOC4E26rMQEcxjR/wmdA3+XWLL2JOnFXdMDU3T91cTlE+gnunq6Uf6njqw9M=
Received: from CH2PR19CA0028.namprd19.prod.outlook.com (2603:10b6:610:4d::38)
 by LV3PR19MB8626.namprd19.prod.outlook.com (2603:10b6:408:272::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 12:09:50 +0000
Received: from MN1PEPF000793FA.namprd05.prod.outlook.com
 (2603:10b6:610:4d:cafe::89) by CH2PR19CA0028.outlook.office365.com
 (2603:10b6:610:4d::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 12:09:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF000793FA.mail.protection.outlook.com (10.167.249.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 18 Nov 2026 12:09:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 56F44406540;
	Wed, 18 Nov 2026 12:09:48 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 211A082025A;
	Wed, 18 Nov 2026 12:09:48 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1] ALSA: hda: cs35l41: Correct Boost values for several laptops with overridden ACPI
Date: Wed, 18 Nov 2026 12:09:27 +0000
Message-ID: <20261118120932.61495-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FA:EE_|LV3PR19MB8626:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 65c16fa3-3382-4c56-b7a0-08df456cd86b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|23010399003|376014|18002099003|16102099003|261009223027099003|11063799006|56012099006|261102123227099003|261021121427099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nk5GZi2QZp+tc6nN/CZwHOMOGC38g2+z3XSnnr9roh9BREcpRI9a48hRchrLb3NihjZeXCurDHAmgk5L76w8yTb4ykJcKm5L2lSQZZw4V0D3Tom/t0JihabIVtjljudrRzqGzWTd1HKxnf3yDvS8wzV+CFINPqDvYhMgslgFXV8s3bwEm3q1hn8BkuC4bDW3CAFQJVZQkMCsyCeOTtZQUfrKxrZgUO9N8jq+dTL9htwmGradk6mrOxTu9PAhfVU8rM/j/775cTP8/JCVJxDKPUzwH+seRzudApuLoaAmdyTpAwS+kH4feoZWlpeaj/EqELYrJR2zi6sWutcrRzLu8CmNruyMweYWYCYEz9ALhrwoMfMmm57QxLvYPHryKMxkAbLpg1c2N0B2JgBgdUmHt23a3G7+OjzwciOKVIs8FazjUmi+k/DM9hkQ+j9DirRYOtVIXV4O5qNESSHVjntIdA1q5843FAtny8T4YhfTZKU9rqvCOTNesFmvOmRPf0g/rLwGJsEyEgi+gaT0LTI3SicVNrQO7VzaIvSWPp9nXPNz0ybd7A/EMkkDi8zwTsNzzIDdFr238Inxh7MIpyT8p4AbEx23EiiuceQyJkZSZ6RS2ApKbExQVk2rjcMbgUD1M6wHkioJfSrDAq2O4vgFwTo56d6Vx3uNkhYNswsFaRq3aEzSNCEtE5fRoibVDNqAi779dUIOTyAAbhw5YId2zQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(23010399003)(376014)(18002099003)(16102099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+R9E76ywspB7TvsD6w7pKmbTEJh4dncX84DP7yLwSOIrFOFUJx42WqvpqRELBPgm5vxquWZYZlmwXV9MHo51O1nfpQqe9dyyoSh/tLJoH7ew5EMXrrlEdKGbqDRzSK3uiAC48duJBDYmsOhlXvfdSfwu/XGiEWN52kd/kKqMa49VU2SsN+/yaZiXwlFwr0VhTZ/w717Jd3+2rg1Ym+gS2D1i3Ket6rAceifdgfo9FFQbsoFirhB39jUNnrqkpjrdOFGmjcz+ul0z94Lc5g/J3codTduSs+/p3q0LR9xE+VGU8La9ZwvIDXCFxLjLVKkxWawaB41yqa7x/I9DCk4mNcJ1MPXZ84Cl2Dys3e0fRBCO42v9nEjDLMcfswwYCvzfGILMcX8MZybjbeNorcLnVxaE0R88uYVIiMIkOoymOWusDOGmAj/sFoFf0v5RWJDy
X-Exchange-RoutingPolicyChecked:
	t+hkCiHJUCFomuu8V1WxcjKd4ccLGDJhwwcYDyoWoPgWjMaLBpmv8i2JfwoO3+N0vY8cKY+W5OgAJE9NOHg2AbbFArHg0fjIcN4yh8s5MIYMxprArFvanLXJ2fz6vrcec3IHbNUV0q8rv6TIIHWHc4jCnUrDI+Fuv/QKalsKrB093GahGafe/TNaGLrPpNeNn/dYF5Z53ISBOawto/dZQlsHi4tf9XjUsK2WsIAjKvUrJx+jb2E0FfjLYO3+cl0lSswDs535k4fe28Wv0BmclKWXFz+n4+ziZ2CNUDxX5aR134xVOr46xeHgDmCIKhkvc8t968ZWUCE6b50ZBGJT/g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 12:09:49.7392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c16fa3-3382-4c56-b7a0-08df456cd86b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF000793FA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8626
X-Proofpoint-GUID: HI3UB62KPZ4pXn9AEueU0etsieb2SOS9
X-Proofpoint-ORIG-GUID: HI3UB62KPZ4pXn9AEueU0etsieb2SOS9
X-Authority-Analysis: v=2.4 cv=V4ToQuni c=1 sm=1 tr=0 ts=6afd9593 cx=c_pps
 a=CxbFE7Xfbix2UyL9/Td2hg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=vZshzO_aZGI9vsOVCRMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX6O5CNSMaT7Kh
 36mrMMe+nvNmc18iQpblDJosfB9xx/l1FRkHTiRKRFLJRbhDkWMek7PiHfJUtdWFVs/cf4PIRuN
 Sz0YcSiRAK9JBM/LX5vv7nU+IeRdNS4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX8pnLZKC48CXJ
 1Hf8M6Lp2jifX6sYB8Drqfq/a/iVNSM/vBeHd9sd0PR0N7eM01UtxEK1Q05qMlHyEqqd30cYsXG
 ujufz0HN4AKBq4L3dVTO1/5dpB3h/oURXjQrQW7dIDn1h9XR+JIVPk2ob5SpK2CQqhR6mnqr7AO
 xizWftEcjFwWtmSKHDolSzNWnzODA7m34jVxFqx0klNqs6d/05Rm2UYpp/Js383XvLXAsRxWD0J
 2XASy13lx/cfdUl4duW9QXYshAzIBjQ6nMNGmm1KcwZnaDGIVtWZmEaHfD52I3zHoLvuyKj+/VS
 vbuwz8t6B4p5NZa1EdYJOggO62PQ0FTcqWVbCXFlRn8jVToiWOMninlzHu8D+QojcaDIt9PF8Sf
 ikNQ84TPfe1pIYu25hr0aUNSNXV54Q71bs/Fo+Dl3IcjFYUjurBHFwNHEsnS5oTXfQ39MWSmaZE
 l+ORBqmwImXzqlkkW5A==
X-Proofpoint-Spam-Reason: safe

Four laptops have incorrect Peak Boost values:
- 103C8CDD
- 103C8CDE
- 103C8E60
- 103C8F07

Update the values to the correct settings.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index a2e6b3024820..5ab19b1351af 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -83,18 +83,18 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "103C8C4F", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8C50", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
-	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
-	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
+	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
 	{ "103C8E11", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
 	{ "103C8E12", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
 	{ "103C8E13", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
 	{ "103C8E3A", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
 	{ "103C8E3B", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
-	{ "103C8E60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+	{ "103C8E60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3500, 24 },
 	{ "103C8E61", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
 	{ "103C8E62", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
 	{ "103C8E75", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
- 	{ "103C8F07", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
+	{ "103C8F07", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
 	{ "103C8F57", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
 	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
-- 
2.43.0

