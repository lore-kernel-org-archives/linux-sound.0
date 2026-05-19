Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BC23403F4;
	Tue, 19 May 2026 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198889; cv=fail; b=DxjnXoA3lloZDFyYpVklwtPrQ9sNTo0oAmWKcYQCyn0yB9HsDgmaSQNUuoijWPAETKzNE9tOmBwpwAbDn35ECLbpIoWD8HhKWUrePYYhB7cYsYKMTIMzxb3X9O5ul0J1tb1pUnUQeHr0+Foquw8YviAsbJc94K0eXmtNpKgZKJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198889; c=relaxed/simple;
	bh=/uNGhJg5TLnU3P9IP+fgXMbHv2covS7oDyBlO1b/PHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bz5Ov8ke24F7eHqoXrJsWqdlyA2eCndnvFRiiZYAqMsP/C0kjWPbO5EpvX9i6yyHihRgw8z4YWKW9mBMAjRDqGSOTswqy0AWjf8+V/DmF9M85TsWRNqtAwitBeJYqhRlEnKWHjoJUxDg9+MPrsEWSZAUdyVaChGIpwQR/2dSLyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SroAweRF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ddu11Xh9; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SroAweRF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ddu11Xh9"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4g34w1302649;
	Tue, 19 May 2026 08:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=eUEixoWak+7UWQdf
	3fFidZh2GVDmYPD3ISVGXRYW9Vk=; b=SroAweRFQtgjjZ+kykQAc+AQ0DOA3tuS
	3iTPGpd7ypp/CjyuX3uhzR3x4ONbHNOwLegFW+eerQ6TtC14N0oJYtx6RXgkdU96
	/RhOCcBC9X6hFZwtchd+gvyUO0lq97T+vg2ozUWJrvBmrv0GnfJa2OrgHMbj8Nrj
	CG6DA+x2lgR8IzorfJwYxW8P26fUVotHJWcQpTbsH2zK8rJkO92csGQyP5FQPwp1
	zI3c/e7O2q3o6lueHvkhokEDwJZ1biE9jojie6+95l4AZe7RH267xl2m56wORik9
	uj7bvnSYfBphZrl4dgYFZ723aqtxUldNmpAVbV7kR3awYRCm8P+FNg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021132.outbound.protection.outlook.com [52.101.62.132])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e6p00kpe3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 08:54:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yu+dTInwG6eIFsG9OMESFSAxEEXy0MRAN5NPaIblTYxfDTkmywwJlf5S3V0cvmsvCiLolJf30hTEP6DLoW5j4iS5TzPNOadW8gjsU5vGvHqouf5x7k8R57cynSaqZ591syT8jga8MUzaG0uFpZ6jrcxPqXAhaHpgFHw4sbN3h/230rmpmIyxDo4fBiVMWtsBNfXtK21jdyzsK6gpDGJmrjKxc8lNEGGGI/UqeNtXHiyoHiw4AmZdadYwx9s5LENi6DJSDJ8pkWqnxYTDXZFYyXB3WdGYhMeq/cZDyTlQqEnxcltSkyR3X0vrTEfegu6g07FXJi1hm04+qxZtYabUaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUEixoWak+7UWQdf3fFidZh2GVDmYPD3ISVGXRYW9Vk=;
 b=bxr2O2Mvc/QC2KviV1Qr95yYNB/X6ChHERz0hBELyrWxWXsI+37Xyev3EHEXH/ObY9CjdVtiwdeDfyZED6P6jEv9lIOkmZW0aSuhV0aHQyU1+9ecTf7k9d/0mZWUKnhGimq6qLCgbDmuvz4pqvUPCfwTavEeZWNsJG0e0rQWxcwKoIJmnYlEoW+KMfUYykhNrSeu8LxduaUOAAO0jxaZa4vO/eEVFVDRK7NjtDffOBBGHipX5O1tGB5YmqXB2w1/4VKwPVAq0AjMiyMnRkJI0zkII6z8CbUUMUVyGTM9CcP3uIZwBwf7s9gWmUlT4oPBa0RHGDknX1iUkW9spytl/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUEixoWak+7UWQdf3fFidZh2GVDmYPD3ISVGXRYW9Vk=;
 b=ddu11Xh9M75yDr7g49V1h3VJ7UpDhq2N8kVipSAeDl88ON9QufJd4NbbpFpwBzHkwlnlXNGyFpNrPB6dpjQEREWLZ/euyZrk0IaBoQ4Hf9HdAolyeuw35iyxjzLnu7Hx8HIw5wlireK+k+7VWwz84r36cFnwL0iHVXoMkNfZHbI=
Received: from MN2PR05CA0066.namprd05.prod.outlook.com (2603:10b6:208:236::35)
 by SA1PR19MB8113.namprd19.prod.outlook.com (2603:10b6:806:38d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 13:54:37 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:208:236:cafe::2f) by MN2PR05CA0066.outlook.office365.com
 (2603:10b6:208:236::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.15 via Frontend Transport; Tue, 19
 May 2026 13:54:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.0 via
 Frontend Transport; Tue, 19 May 2026 13:54:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 58EEA406540;
	Tue, 19 May 2026 13:54:35 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 439A5820244;
	Tue, 19 May 2026 13:54:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 0/3] ASoC: cs35l56: Replace open-coded SoundWire regmap with generic regmap-sdw
Date: Tue, 19 May 2026 14:54:32 +0100
Message-ID: <20260519135435.479949-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|SA1PR19MB8113:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6f1a654e-95e5-4b9c-0498-08deb5ae29d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700016|11063799006|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	t/kzGrJDQ3rEy7OekBD8NOaQIgovLzMiJztw4kZwSC+Y00FFP1kM8L2XKlBeHH334hxHI4LA9eRy0oscT5go9pdhpdt91EFZ6luhUOdEp2f59wLRNLjW9BbHpHPFKii6bUmL8HBfuZXtBQPNiWQ+Xk+Te5/wED2CORhrCx3VSUkUUKB3htcBJCAWQ0wmgceqy7UxCtiUNb3uJup9r8XXtvrn9Tv84xqVVwePg++n+YcwfS8YeT3UCbun1maQxuUOcYaVaoJj62WSPBVJu7NignMs55gzs2txhxlazg5FxsXsY2KKRqnwztt7BXEb30aIQYKAlQskkcFe71rMywxg+hGtf1pqJLRNoHEbFUmNu6FsPQKJqbZQHE2Bi3Ft2nhANZgQUIDrMyR3TeUJFHRlQnbI55wrIla1uSSZi/Y1WsIyq2mboT5/5mOSFRl5ZIV0qzZ9ec8TuiqGdtpv8EMa8nAgzd2ls18nVTlXRppdkAZ4HoBmWZGEczwNwO/OoA+6h+9XY7dF90JX3xXubxoP/8xDzbhMFgq2bUz8v6xIl7l4Y7Ukh4e+lY7Szmn/BdDZYyzieXYoRoAaWtQiE4gYSEsfhEL9w1QX1JjV7e8jBk5qQlzcbKuSHCeKVaJPJMFwIRh0FwEmPcG1naHJNCq8pyn0pmrSnJy/t78QYDGd6QOqK/YqqhamjLWhTN2YP17wUmWm/qaHutPO50CgHHFxv9gpIljUddJ7/9ru/r50Ydo=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700016)(11063799006)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0XKDs2L2Z2t8HQwgWy6fsEvJCjpspN4ET3jlHpKyyRTi0wiGzKBrPIZ70yLeiv3n3Mx64zOAZkZXoNTbUm7l/2mk/p7MNfJY+aXYU+aFmk7/Fiz+yaFii/r+qyDqU2JmO97yWKHT4e2qcjusAyS+Jfmhv7bXVT1C+bjxlVxJ4TuGYxRs/LdsVmhT/NT6IpuK4xxU9CKiZaPsxOVrhlN/+TgNlhJyVdUNTK+BaLFEqEGWRRquYRtGGltKWOmqifRhIlHPlOCS/r9MvAF3ffSNO/ZvZd3mlyVP1vGSLqGMOXaDWtpnGh1Ez2K6K4bYBZy5I8uUAtOalcqJQHe9T4hwfKIrykc4xYXykmrO/P9XJKiUbvP0ETD0vKhOP6AD8KmVgJsL+scTzf6NQd0t6dEe2ZGkb2KyBBhKuKWwQhJIoAKyFSL3zevPeAnVCZXp9c0y
X-Exchange-RoutingPolicyChecked:
	OrFvwrUh2CB2r50Jvzonbix4VQ97LPAPy58ms1xB21zSEptV2PtHFHY8eANUSBQZj32QAsPKh+Kt7d11v+LxwyKjLzUdEM+/4T0oZOs38rf94MCjPfZgUt9vQBds1iEbnfmkzx97bg0pIMKf/VGzuXLnURyuHObAmxkNxZfxIsJJEsHLcsqq3ZNfVl1VEij1av2y/HqhtIWmGGD+HYkwQqbk6jcqh0X5zC1QdB+WgbrHBmbaPnHUpixYUOCwlmVlEQIX3UYciVIYYILbY/z7UDQdqpvRLr/qPIlnjmZ9y+ESD4cHStMVbQr4fe6bfi/a5P1czrwvAQSLSwKo4zw1zg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 13:54:36.1557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1a654e-95e5-4b9c-0498-08deb5ae29d1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8113
X-Proofpoint-GUID: QKWXyR01iMp6KFkdPkYH06H6A0qNAaLq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzNiBTYWx0ZWRfX136ENPf1NBgs
 gwxaF0obO8qgPWU7ywR/dk9pD6X9jHHKawItOtL8JHobnv1zJbwCuwPrY31TezfOEBcbkMpcrQv
 dneKc9q/tT7Q3t3LXR9RMt9aNEkmytoSSW1P4nbOJ0PsGlvVwNutgsTXGUy8Qgt/1uDy7cFyn+B
 OjzHC9Fe88zk73ji5xjYg4jAZ1oXriE/2hoQDveK3IrjiWkk8XD9jghE2NL9EqObX765VQvRPHq
 /y979rkIo1pyXbtd25r7UzHOeTl3uhvPA7nkLcMfPfXGKc7MmhPR6aYPMAjkjAJ/WTRj+go/WYl
 XfesYOk6bR4/Cfk4crFL2xod2cwcWBKgVhMjKP3KOJzNib4/QxwMgO/JVUdYbQA1yBN2EFGKYKu
 Ci1HjDApR1FED3uHBJ6vOjHTDb4yPxiM2xf+VYBZF2+JP7h9ijvsPm9cQA3IOfM50fQIKarlYj8
 JXkQmAGphWNwNEwsJlg==
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a0c6ba6 cx=c_pps
 a=UMjutioB9FM+JTLeLfO2hw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=aXIz5WGUO8OSZWwI1R4A:9 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: QKWXyR01iMp6KFkdPkYH06H6A0qNAaLq
X-Proofpoint-Spam-Reason: safe

This series replaces the entirely custom SoundWire regmap with the generic
regmap-sdw. The reasons for doing this are:

- Avoid code duplication
- Avoid effort of keeping custom implementation up-to-date
- Prepare for supporting BRA

Changes in V3:
- Change cs35l56-shared-test KUnit test to handle the offset addresses
  passed into its mock regmap bus.

Changes in V2:
- Select REGMAP_SOUNDWIRE

Richard Fitzgerald (3):
  ASoC: cs35l56-shared-test: Subtract reg_base offset in dummy regmap
  ASoC: cs35l56: Use reg_base to offset addresses on SoundWire
  ASoC: cs35l56: Use standard SoundWire regmap implementation

 sound/soc/codecs/Kconfig               |   2 +-
 sound/soc/codecs/cs35l56-sdw.c         | 137 +++++++++----------------
 sound/soc/codecs/cs35l56-shared-test.c |   6 ++
 sound/soc/codecs/cs35l56-shared.c      |   2 +
 sound/soc/codecs/cs35l56.h             |   1 +
 5 files changed, 59 insertions(+), 89 deletions(-)

-- 
2.47.3

