Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E73319CD1D;
	Mon, 30 Mar 2026 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879285; cv=fail; b=uJTEQGWyto4BzvCLhoEea1jcC5e1emOu1DgJ5GGHfvzr0qC6qXTLKmri0BM5XY5pd5vUYGEG+dPHvaiWJPBUgrm/kSmeh+xJTnphl9h8pYgGOICMEg6qyYU/E822zVRpSDG2AK/DmDPVzmlssF3mQ0s8p/9IYvAMxVxu0PMQMDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879285; c=relaxed/simple;
	bh=4ZyF8cZyf46TwCavP8wvCr616CUf2fJHCjfOvviDekY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TLGP5yEiaP1MJ78kckvF3AbJ+6IqhpVFaFoGz+p54NehbPWfbvWE+IZzkddfjLwwYo8lmsjdwlNLYcpR9keKcCPDj4hTay751j2qbUgf5BedbqPuYRN261N/D6d71AKSZjkW3l3UsgumPAp9jnJ8dCR7HtVt7KAs9zZoVDS2+bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JUawLqiE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=p4NPJoGW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JUawLqiE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="p4NPJoGW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TNfeD43741000;
	Mon, 30 Mar 2026 08:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=0JJ/rzThMMnyJXY2
	sJFEhr3XhQ6RqC8QsvIphQexLS0=; b=JUawLqiE4bnHfBDc7nomRkSj1ZyHgnaG
	N9Ggc16y6dSVXE7jmAM57B+vtvlm9MXrqxEBYJuGbUBJbzzuA+tEcBUpCC8iV34x
	+6/5MyK4qXZUY9jJPZat6+RZGKO6tupv7iwO6JtRKFMOtwhxuIhaOTdyLlSB9uID
	zUpMklDk0j7ROsmxZqoXznR98YufPiuVvYejQnZ9/3Ppm6+07TMjw/sv9z+V4fVh
	jKPYj5FFrG6G9TQJOg4+y7AUt8B9NyvTeCOF4wGNOHRNNEkj/gsbZbUQcRjYbzjf
	kk2TKd9/skCbutzFQJqLGh+nUN3JSCxlzrikJlsLYSjzJQfzRoIa/w==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020074.outbound.protection.outlook.com [40.93.198.74])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d6ccxsvg9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 08:47:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqFcuxOxFwcnlNtB0nvSA0VzOzFdRLwaPyB6muTtvZ7V3Wy9gdXuHaNyXAm2CsrbIi08ccpn1fK9/J2c38BhizMFCLpqaNX6n5fiMqvrIthAa8bH4rvpYmet4G85F3V31CVjDuB/ZAXMNbvGN3siBHIOnfGN/Ae08yNWixXX0UByrjjVqTf42F9WM91SV7y2t1mU7wFvhNzkttQKgaL2+hjHj7CxRGx9PMLCny6o5h16x5JFZVl2QPfjcf10GzXx5Tg1FKomZOkrDZMoKPeVpeacsjCVV8X9/VtSIgl+wb3dg+IQToEkqsU8yoanIRliEuEqW9in6aS8RIKcQH6DDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JJ/rzThMMnyJXY2sJFEhr3XhQ6RqC8QsvIphQexLS0=;
 b=WzRKxrFdRq5iIV+mBdoYK0+TsIv2mnapkwHEBPObuwez+9ulH9EJDSorQVbTG5BQhSQCZ/p6BiS+/wLSRYy7gOj+JN6FGq1q05/LcPCW7xEiIO1D5ifedlHfzhagNJmsIX7RYPGJqJkwaHkXOByzwYWZwVH3+027LFDnoDIvK59wr8iLwfLbmw9BRkQLB/QjjwffiC2Bk1RVBdvEHq2CWezHJw6DQAmWR8tagGeZmLGeQBpozZQfQ8ar7CdcoLI+2Em+8udblIcZ9oJT1oJBv940fYBqorRISuqapOnkI3dr89q1N4lfmFn8t/qBbH3MP54FI75qKz0JMZ34PhtfMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JJ/rzThMMnyJXY2sJFEhr3XhQ6RqC8QsvIphQexLS0=;
 b=p4NPJoGWRIus61v+T61lwpYAXQG44naSFo5aaOZ/gpB6Gctu64VmtgGkskZLLfN3X4dL6vIwfnsJZGooAAfnQt59UdyBoLEwluiltxplO2v/4DfvE1Su3JJKDWT+Xazixm8ig8HGGpkaoPJ4W0d0isu5cKknQ3VPM76hHrt7HTk=
Received: from SJ0PR03CA0117.namprd03.prod.outlook.com (2603:10b6:a03:333::32)
 by SA1PR19MB5134.namprd19.prod.outlook.com (2603:10b6:806:18a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 13:47:20 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::75) by SJ0PR03CA0117.outlook.office365.com
 (2603:10b6:a03:333::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 13:47:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Mon, 30 Mar 2026 13:47:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5B95840654A;
	Mon, 30 Mar 2026 13:47:16 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1E159820247;
	Mon, 30 Mar 2026 13:47:16 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/2] Add support for various HP and ASUS laptops using CS35L41 HDA
Date: Mon, 30 Mar 2026 14:46:16 +0100
Message-ID: <20260330134651.443439-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|SA1PR19MB5134:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 28c13b42-2286-4d15-4a2e-08de8e62dc3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|61400799027|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A18T9Hgko9/7izsw+emYAm8kC+JTYuXEEZLlhVNgTZqDAPRCeQ+VECJOAAHDVp8H9mTUYNiHllWbCWXzpU084J0TlVXSbZBSqiXLnTm4Z/IDP9W+HfTiu9jHo6OaM4yGZn9weAL52wAsBEmmQP9gfZc5UyvMxm/eP6tISjP4fsAo0mseakuUDjOHJJ1TXGjaR4/9usU5GdYkZyIZ+ghzs2pzh3kyDTPEToxK0V5TRzrNdY4op9KXpPHGSl4PTaXJghOKy36w6d1cfxUpZgiskjxh9CK5+qp0EMUCDc/WN11xrAIRCL3MV/WKpSl/XyVpOsnAf2zyhGq3EtSvHISUPJCJs6pPwuKqolJv9mMXBW4LMGFgUfURcdb56sUQvEI/A/qQbgcrvyz4tPbyEhnZuNjQXpHJiVxYS+iWRMZpYBjS4Kj3wqSJ7Mr/xyPl3OUPMAffZOsFRmF+I45Ol5Vb8PFkmwpvSaR14GTXiIsY2Lkc4BcaQDncVFC62Nq5ctGsmYmgcCBh68rXXjmTCt78F8h/PUY0ieUKyMIk9/eRkpla4mjoU8xgNVS8y/IEY84fuj/PJaZqwAfwCzlpuN2841o4RHZIpCxEK1f5YOksVJX4T4+uBGBMtv4B5I1tdpcQBJRpOHiiVsoZGxga8F21stZMIbHK7uVbgfiyVXmJt3xSb1UYwWLoQ3cYEjlZtDjz7FJPd46dJh2VkqkLPf4CjcNnz3CIHnRjdD7orr+kYp7TqwJkhaf5ZnN9AkPOdPfLWfql4o0taI0qNl4DKbDxAA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(61400799027)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nW9qp8gEg83yRPcrEoxrNeOGQnq8851JEtn5rqiYOTccjTpM2hhfZ+EGK7ZV6g8GxKvGD50k1EC0UaLAdoYVtmtLt2pKqAOGr3HtmzRDcY4rsNngcfqCug9vLSoPPY+sskzVe5KS6Nb3UWCkiaj2O49i4nV+tWGCpvqtsYB2NbPxuHyQAD1cPkAfit5hA3UFF+tVtO0jw4Hp908hdZGV//+BTa9gmUDZVXZ9vGlHCoiolC3QcUnzCgm31P7IOA+lvjZBW/OxzdE8Q02ntIrbX8iEaRTAjhV0LZwutBOTBlHGg5sMUb/ro/QyFTKE3Kahb8nGMQV/Ca6vajUygLIrAlTX6sWUxXlTkBQ1Mo1pNX0aPpfu43uqKN36SxbPDIDuE2u80pL19rQC+D4/rEDm9W9AnyHsNw/1kLy5dWcONMG53utbivBrQLBrfk9SAr6+
X-Exchange-RoutingPolicyChecked:
	WY3AhsrdcbOhVdMwr0zi3bMZrlyl5KFAHqWX92/Ix4ZK4/bhyFdAyPVhRbEsNa+Wv/NbqS/4xb8MV6dx4+5MsB112lkbg6382+3HFdFU6XfWkg/RDcjE4vwjBtbN9DpZ/NuLoCl/960PkZgSbMIZO1JxqY5IApC0/ehV29+ZocR71PxllY50jR7MPdwM02SkxWGGixSL6lxHuHdHefSsyR3oE2M1+BgW0C7jhzlGAEtIB1giXge6+Lj4Z/S5IDPNVX7fYyPHNbPO4UtM65x+msZl5cAyIp4/cCYsuQ2nIUtrbfJHlNVslw5GhQZ/zd8/rj8dwitKS0Z4okC15mo7Nw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 13:47:18.2720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c13b42-2286-4d15-4a2e-08de8e62dc3e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5134
X-Proofpoint-ORIG-GUID: YrTPZ3rIxB562vnTDOBWlXRylLRPGFfC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNyBTYWx0ZWRfXxYpu+9ySUS+H
 bxCM92QCI2KVU7iLIzBm7+QVWUO0jTlNEBD0VbC8eGOKLC0cJxn6WLVMTE1COCmnauftwJxVaFD
 gcCrXjcn/e4/d1QPHeza+m6c5GG5loqKR4ATPhvINpxHYTMlig9Qne58DYHVTdC23eMyz1KrGx6
 1BdT2UggVv8OWCpjLnV4p/7sgkOmrvpb/OV1PbvtKNzwVc7z/QjMLhvYvemRFBQSQXtyhXkzkJq
 kueFg85p8cr/8K7JG0lEezx82nDdGfxmlcxDPDhCxMZ7Um7lU2MqZqgpRSl7ofjfE4Qw4wgkR54
 +IJhdEVDoldv4JKFOveK2PiQcrFhdP+N4d5og7j11rVJHSb5TQb/Ehl/r3gmhQnRIsxf+ls3gBa
 sW7cYp/DYi5MzjdEtDgw1rZD8D2OJ4uTACcqJq800ynnZ2BWnbZmOK4RFOzwh04/hR6+wmdzpUc
 xED5Lo7UxcNfZ2e45qA==
X-Proofpoint-GUID: YrTPZ3rIxB562vnTDOBWlXRylLRPGFfC
X-Authority-Analysis: v=2.4 cv=Xvb3+FF9 c=1 sm=1 tr=0 ts=69ca7eed cx=c_pps
 a=ydTOzwc5oh0TSxJkn1Qoyg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=FKE9zLaCZN0bA_lPnvEA:9
X-Proofpoint-Spam-Reason: safe

Add support for several HP and ASUS laptops using CS35L41 HDA.
These laptops use Internal boost, with SPI or I2C.

Stefan Binding (2):
  ALSA: hda/realtek: Add support for HP Laptops
  ALSA: hda/realtek: Add support for ASUS 2026 Commercial laptops using
    CS35L41 HDA

 sound/hda/codecs/realtek/alc269.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.43.0

