Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022140.outbound.protection.outlook.com [52.101.126.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91299305047;
	Mon,  1 Dec 2025 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586634; cv=fail; b=piP774rEMUAsNV57xucyDChiCgkD3LQ+bbkKnSOJ9BE1zsW6FI+405KqbgNN74sJ+NhePs3bnG0pHowonSzX+n2X6RtuQE1nAZ1MlLjY/CarThGXEsbDHUaCvJWRJfC/vCzciuww0nlZ1K8pbGOCJKSQj+WUFAAYJW0EQVJaPto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586634; c=relaxed/simple;
	bh=324ea6lCMPrewNlwJZ8vR3+I5oI96NQxLrlwaAxylvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RsoMEzdOEAh5JHyiZg9JdAmwq1YKgdwfFH0rlLGSWjCrE3XaVfUenNVjOQO+QSDe9oboQftpPhjat1sIJWEOsflKU+fU8xldpT5rs8Cxx2rDi13hRDa/3SraMr1PGEFu9d3BucWd7SJHQcZHvsaRqrro/6FHQjPqiwwppO/R09I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpBkVvNmes9fUU3paGhtjp1wqDYy4RsiaelATFDYcSRnOKAN0JjR/eDZsar94VB13mmvs5Eu24RzktAFKCALy84ICT6dKvF9UvWt/TZ/OjHuopuDjS9eQif6H8/5yBMZtbQkZNaMN31DvDJw6/Vyn3RzbSicwvX+1zDTrB0BzJaQTQv7VAT1h9eOT5+PyKyz5jtT7sHwh7hJRgksb3stzS1eA7fXVVkJKhAUD6BSK3dljUdXWqJAvRuECJWvzKcSpRpqvJsfsMsJ9ckA/4oA9/ObwYKtvbRchxWq/hn6RCUWcIk5M9wCK3WssWAt6juIfdcHFlYRgHg0do2OmmE3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+Do98GYWfYa4m/JO79lJqdbOsS02hliX8zBmH7syxg=;
 b=MBwigP3YdvkNqwNP3lL7OnbwOkTTGC+L4x7et7soV+IsXRv1mrntxaXh6wSvUs3cffZ9ZRf9yD/yJH1PEbzReTedXe2WhteuA59T8BUEgL8xcVS0AFICRStZPHId4YG5n+SfbhspxPrASvHumK/je/JNE0qZyTnVuoNm4s6jvY07vcX2adRTHeiw2svJ2m2rMtI4bm7/ksG27yS+0Th92neoDbIOehX4gr60wZQasAEEc8zRFePvW/jFzlkMczmXIv+BZXECh6Uiclm1y2uJggoHlulTYlBKvkqaw1U87iQevr5gchb5kaA92qEgOP/aEXsqxq0fA13hvq0UJqlZrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0151.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:383::8)
 by SG2PR06MB5311.apcprd06.prod.outlook.com (2603:1096:4:1ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 10:57:04 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:400:383:cafe::20) by TYCP286CA0151.outlook.office365.com
 (2603:1096:400:383::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 10:57:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 10:57:03 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D1FA541604E0;
	Mon,  1 Dec 2025 18:57:02 +0800 (CST)
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
Subject: [PATCH v3 0/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Date: Mon,  1 Dec 2025 18:56:57 +0800
Message-ID: <20251201105700.832715-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|SG2PR06MB5311:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: edb6a2e8-b97b-431a-44a6-08de30c85cb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fmb/l4SguHfTRy0pvc9UjJlWP6d3hHvM+dK/8oVlzzNh8sYytyZBbGsv+EdP?=
 =?us-ascii?Q?v7bGzsINzPpVx/KDvrlersAv7RrqgDrjNn9wm209UZEvOtEwnSQlU5GWbNd7?=
 =?us-ascii?Q?Ass2MsLmn/yIY5d1b84Q2zFV4EdB7QGyBHdnzP7GpNVpxxeliJKGgHvS7jJz?=
 =?us-ascii?Q?ONUE6ykOAF2sBQy8NZ3fnuY2t5nguy8cyEESdzmZzkTKZfGR5ZMipLgWHgkP?=
 =?us-ascii?Q?F8QZZ0ejfSIAsBg84AwwCAV5InhcyWlfxrLDlffVoEdQI5vtIMnNXr93u+vM?=
 =?us-ascii?Q?R15HtAprhwj4p1d0gr+PiyJP1Ajp2BSBJ8eH2pTjjI1SfSM47RJ1kH7pnM/i?=
 =?us-ascii?Q?CFQJ7ZCnMT4nwXHe1liq5bng3kkd+oYhXvPGIoky3nomHgxSPIzybGX4AtIE?=
 =?us-ascii?Q?NXG5G4yqsaOSblwA/3mzr+g32Kylf0v7sT0eQdaZ8NQADujKtYbjCdQMua8E?=
 =?us-ascii?Q?8afIN0ZUbF2Tj5OZtr8CXnxrNXimxHlm+kZPma87gZqUB7ShdxIH60v/kEGi?=
 =?us-ascii?Q?dm/KteRlnk2n2g1WH7ixoUyLOVwU8EGIj0PV+3oboG+MynasIjQqx7cToonn?=
 =?us-ascii?Q?5jctVp0mBILYoKyNr4H0IhOCU+VYHcSNVQNgH9aH58j/+TgU44UtlKtW9oqP?=
 =?us-ascii?Q?Dz7gpIT+DV9R+R5L3LzOhjPnX/ERicFa9VwUE9g4Q6bdLfogyB0mEFOwRZMh?=
 =?us-ascii?Q?UaaJCXZ2/RyOM0AfkTJ5rpMnWtgTsD80csqNtQ+95hCs7SigTJhCTcafVYsZ?=
 =?us-ascii?Q?EoBItzJ7gRrJEwnIMfD1my5A27vlthy4FHtMr+RQK7PLREmUFM2XqV+1pz/S?=
 =?us-ascii?Q?I4YizMRbZJyV9Z6RpZ57TRGsCQy9Xl+q3Q20k1+BU1Z6MdcMsv+ORDRNKdvx?=
 =?us-ascii?Q?CMxieLpFfqzRJG2DZxw993ducLfnOtHK/0yuYyEKDJE7BBcegcGWiMroK8+8?=
 =?us-ascii?Q?z+9H0UcnzL40k8Mo0UekjA1nlZfxdmfqvKJ38Y+HWHCt1y1upaOLkO1DFPLl?=
 =?us-ascii?Q?NhgCbgq8Q7tqFRZeNWqxS7Pv0pCMyAei6Tr9t91FBaOGaL5cc/S1eqNgod+j?=
 =?us-ascii?Q?nphTh1yB4GyZO6vnhMaoPQFDz7iVT7UzK1TOXnACPEFjo6MNVEyhnngoKBUF?=
 =?us-ascii?Q?iASv4oXM0cfvPuJsHDcX8J809BxwzD3wvrfmIrfFAle12XUbUq1YHVtmWocR?=
 =?us-ascii?Q?OkLJhUmxj4GUo15EnCf8bn0vF7311j496mqMHqUj8MDHUI6pM6usfUU71KZp?=
 =?us-ascii?Q?wA3MOJ/Htk15wE9tnwgv/6dwaMOd3lDxu80W0ww6QYj2gvQyrZTQrew9oRVQ?=
 =?us-ascii?Q?+dnOfvRWn1H8j+PJXYCMQcMhjCtTEdcJLQqPnTxRz6pCpxZAG3FOj0jkOxez?=
 =?us-ascii?Q?T7g9vCNw3pWup0Yzh/NKxWniVRqztgXVxSbieV9kUGxg6fuUPwlpoWBFK+be?=
 =?us-ascii?Q?CqUm4iqtsR6hKvF9LmxZVZ8rNthq9ktWhK5VyI3vAgi5atfZW1bmBN3f1hby?=
 =?us-ascii?Q?iDUNbAQ+Gixkwc4J4eGaN2Spa3yOKPFH03VI45Eml2bC4Qsz+GvfBCZ0L/zz?=
 =?us-ascii?Q?HQWPnmyadUYgMwI+CSE=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 10:57:03.7918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edb6a2e8-b97b-431a-44a6-08de30c85cb9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5311

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add CIX IPBLOQ HDA controller support.

---
ChangeLogs:
v1->v2:
  - fix dt-binding issues
  - remove delayed work for probing
  - refine dma address traslation
v2->v3:
  - update dt-binding commit title and message
    - ASoC: dt-bindings: -> ALSA: hda: dt-bindings
    - use full sentences for commit message
  - rename cix,ipbloq-hda.yaml to cix,sky1-ipbloq-hda.yaml
  - update compatible cix,ipbloq-hda to cix,sky1-ipbloq-hda
  - "cix,model" to generic "model"
  - change the addr_host_to_hdac bus callback to addr_offset field

Joakim Zhang (3):
  ALSA: hda: dt-bindings: add CIX IPBLOQ HDA controller support
  ALSA: hda/core: add addr_offset field for bus address translation
  ALSA: hda: add CIX IPBLOQ HDA controller support

 .../bindings/sound/cix,sky1-ipbloq-hda.yaml   |  72 +++
 include/sound/hdaudio.h                       |   3 +
 sound/hda/controllers/Kconfig                 |  14 +
 sound/hda/controllers/Makefile                |   2 +
 sound/hda/controllers/cix-ipbloq.c            | 438 ++++++++++++++++++
 sound/hda/core/bus.c                          |   1 +
 sound/hda/core/controller.c                   |  12 +-
 sound/hda/core/stream.c                       |  10 +-
 8 files changed, 541 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
 create mode 100644 sound/hda/controllers/cix-ipbloq.c

-- 
2.49.0

