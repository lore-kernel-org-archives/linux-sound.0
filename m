Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022107.outbound.protection.outlook.com [52.101.126.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C468E351FCF;
	Thu, 30 Oct 2025 11:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822663; cv=fail; b=c2l22+Wj9In0alVBFjaoLfs7RzGgyK7tBFhyRtWWOdXSubqiR0OwFZyZVbLp1HRoGd/dnlKY4ha39Ro7jXWlU4BB7+Aj14kLKCX4dodiAdVzGOfH7TXrbnxFlh1tbDZbugYrSIKbaGfvCL+jvG4ZcBIF6nntd9NWKaVC1CL2Fps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822663; c=relaxed/simple;
	bh=tmw0YCAR7J3hD07w7UIsBQeUlitYgS8Hxn8XlHGO+qo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hBCwO20GCIt5XyEPRRNytrQ7UVDiKv9z6UTWBmYR8zjqfKUbDiKvJzpYDE6r0GGUrzjprr32dOVtIUex0rERDu3G0LhLK6lUy+SpXiKxzz/XMV6IqL3lviRoARkNXmYqvtBmdFtdhMlRaL5I3QShSbXcNs9CyYcNU1MNJkdoTXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUslap7qj90VN2tsulAPeYIPRQ9yNzO5s8FkprpfXI9hFhEYhcr2tSdqwY0FymYg+IOk076NJ4d+dQe03lLnEEl3kq5DyckAoOubE9wdLidR3ipJS6DEkOLqGmmhjpnjQKbZct0T9tyrwJ2OlNcQfYCWGMeCeE7Sf/N237MOr9uqryyhMxD55RKES6hIcGF3rVrRsasFgpkMNiJKHjvwjP5biK5Y3aT5I3PT9HpVLYRYdWxD972V8KMMD5sxf/f+E4BJTY9ogQ9HDQvKobxlt+wqcluVolZQhba5Hfzs+l8QxAqMySCK1BRpL4yeRvcHiHlqqRXKiCfNJ6ilaDxs3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ShH0o3yoVUnkvLfWC96FYgL1+8ya7oBiKc/cHi2f6I=;
 b=QdX/+lJrKBY8VEWkpdSp8rGbA0p2bB9gHa1BG6/u+UdXQsPt6extt3W/c492NNwARTS1TJbbhyERQCYDwrSQMMp+UyRmze6JcuiJ1KF/YFvdPVwhYqd9TQYd9HLtKMBFfPmgYeySsrd6RgN62/zQNaJ25ukljhTOGtlPH32ej35RbywMGGKNGlLj8dHDmqfCJNzF3Bk2aE6SocCUYSx+3bN+7+X061rAVxeQj0dZ7atKCFnV+UbDRKnN58JCk9g1LQawKhGtGZUQl0Nbu/ZSKJpn8cU5szBQOqSV6HDO38P9z8+ifkxHVHl5zutkBtq0YJHOhTs+HjEZwRbzC8TZww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OSAPR01CA0309.jpnprd01.prod.outlook.com (2603:1096:604:2c::33)
 by TYZPR06MB5525.apcprd06.prod.outlook.com (2603:1096:400:28b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 11:10:56 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:604:2c:cafe::a0) by OSAPR01CA0309.outlook.office365.com
 (2603:1096:604:2c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 11:10:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 11:10:55 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5230241C0141;
	Thu, 30 Oct 2025 19:10:54 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH V1 0/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Date: Thu, 30 Oct 2025 19:09:25 +0800
Message-ID: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|TYZPR06MB5525:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 66c1ddcd-e517-4e07-6fe4-08de17a4ff34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tU+0GGoYxf/Feaurih6jkS6mERlkyp1HLYCBPozvIO04sPXu/1rBKNnWqeBE?=
 =?us-ascii?Q?tTwdBW3fh8dfqgbNC8DL/og502Vva0gGNmQRYFBR2VKnHz3Te9iSTrnd4JJg?=
 =?us-ascii?Q?AGyzLwLbgW299uhLTFxfTKfGVaHqUvrm6FsCIkGReXUb1Fs7KWFx5ZYc6VGj?=
 =?us-ascii?Q?CWcDNnttU8usxDPExNfqkPN5phI3daKI9G6JG8IwivakbirQ5tLMIgr0wAhd?=
 =?us-ascii?Q?v1O9AJNgxGtt0CTnE9UWjQ8i5bswc0X09K/EPWuTnApsaNh9fggk7YLvavYy?=
 =?us-ascii?Q?nSSHww8WgKdlocxhKC+xH5jTRs1ODhxe7GGmz4mQ8LhDJHsw9kLSQb4ZieSw?=
 =?us-ascii?Q?FDB29rXj8lQAbk0OpHpVe1T5McUNoN1e5j5D+3y3nDfE3eRdXzBik7SIEmZl?=
 =?us-ascii?Q?2TezdqQqlzYNNYsB3UcveTTiJNckdSwGkHZwogsPcK1ufMM4qR8+ZMFE8Ljf?=
 =?us-ascii?Q?dhqrQnFGx3sRSBW7k00RAsHY0/YaQtV7fZ2O4EFfV6b869TjADeaAcN3kmx2?=
 =?us-ascii?Q?z4NXsTL0JLosOqvvcYb2OEx0ZZRdYxScLwxrEQsWN43jNQM6w3KrdoVSxhYm?=
 =?us-ascii?Q?eyE5F9FI7tFOP68c52zp2uocSGSX9qnnORqULflRNJMgbT7qYx4Dd+5mCves?=
 =?us-ascii?Q?A/YZemQ0Zx50CMEbETpJSqElKx8lTRPkJaryCtYpXES+sz86pYp3aUmemfUV?=
 =?us-ascii?Q?v0rgBJPcyTjjqsQ4TjsKP30uOe3wG7qvqIbFBa1IJoi0yV8scBczC25kOh9a?=
 =?us-ascii?Q?sVTEJ0UcK3UUefGS2ouURcCEdEbCYbRiY6Qt9Ri8b6vsQBEn4g61IMdVXz1M?=
 =?us-ascii?Q?6CFk94OkGhc51iFxvPXgmSubQY7I6mOmg1KFG12B+sCD4rk0YAiH5xfEm2DZ?=
 =?us-ascii?Q?ASfTj5zxvTJqP17FXTe1Q8ZpvzBvgss0wZ8iGk3WDH8kcNMX3vFJlJLy9uEn?=
 =?us-ascii?Q?KoXFNII/tLJHzdOhFC6O/1b7kmE8B+7zd1+hjEFjLAC00S2BhLLtSEnaZ/6k?=
 =?us-ascii?Q?WFNlUtP1J/VOXyIQyKf8CHw2EKo3FH+rnVrFzWyN2NtXMp1+8zW4ejuhGuiZ?=
 =?us-ascii?Q?mUjwWWnfrJNHG5dqDLJKBroGoVny3C4QVUFh73I9ogkOs6eKgTTdHOQdDpfq?=
 =?us-ascii?Q?YcAlom0ctbJyBdFf2hhZNaNw7mvDKOMGZNavW1LwUA5oGw3G5r85pvcFJsMO?=
 =?us-ascii?Q?RQfGwxKly3KGYjrLMlB/8sTzxqOP9hV6W308pq98pu6CwdXQwnhb1Tu8hqA2?=
 =?us-ascii?Q?QzbuHKvUFYmH/SU8eTNyO+pUmE1hcCsLAqRZdK5e1sfbsOm3BWLkx8ak6MKg?=
 =?us-ascii?Q?TEQkscZaFm1Nz5LV7tHs67ZrVD2EfFoHn3pQmqLNslZZWkhF9vJwOyuYCciu?=
 =?us-ascii?Q?6++ay4nJTtx/+zNsgsK5rQ/7+8Z8Amvzv7dqYKttTWPRDw0Xwi7O09WWZqCF?=
 =?us-ascii?Q?EMnqP6hXJloP9mHC073zEbCFgEMC/SnqBk6mCBRmrKhrJ0lOMrg54KWSY0+/?=
 =?us-ascii?Q?bmObqJ//WkhImjgQPUkQNNWBMYTlSjjn4SFGBFRdPsIb3o3UOzbC9U6QRvH/?=
 =?us-ascii?Q?PVreUgdwSEICFsYlfgM=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 11:10:55.4538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c1ddcd-e517-4e07-6fe4-08de17a4ff34
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5525

From: Joakim Zhang <joakim.zhang@cixtech.com>

This patch set adds CIX IPBLOQ HDA controller support.

Joakim Zhang (3):
  dt-bindings: sound: add binding for CIX IPBLOQ HDA controller
  ALSA: hda: add bus callback for address translation
  ALSA: hda: add CIX IPBLOQ HDA controller support

 .../bindings/sound/cix,ipbloq-hda.yaml        |  69 +++
 include/sound/hdaudio.h                       |   3 +
 sound/hda/controllers/Kconfig                 |  13 +
 sound/hda/controllers/Makefile                |   2 +
 sound/hda/controllers/cix-ipbloq.c            | 470 ++++++++++++++++++
 sound/hda/core/controller.c                   |  25 +-
 sound/hda/core/stream.c                       |  17 +-
 7 files changed, 590 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
 create mode 100644 sound/hda/controllers/cix-ipbloq.c

-- 
2.49.0

