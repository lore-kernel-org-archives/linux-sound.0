Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD3F33506B;
	Fri, 23 Jan 2026 15:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181035; cv=fail; b=Q2BZu/MtuxJwlWT9qscUhrCnEUN/7ubkId84wY1/dkDapXmgQbDr4QLUaXCF+KAXvjYKUMNv5EKhpDc0rHwxFADTj+CXuaRs1Ph1Jp49h1wRUKcG1oJ8UMCPTCtBQczJE6/7ZJieYHX8x9cBCSXDTXw5lPYBkcUriIE3uZJoiM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181035; c=relaxed/simple;
	bh=NITOH1KxCtzbWeD3kapAuPxTYhIVbDz0AsGz4LCsWe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JRq4UXuvx5LMqkZbWzEB740Ecrw1yxFLrRPHOv7oiVZP16TAXZBMnzt/wBxQ1ME0TaJb10NsZFtxmOTNpBj8J+lsw21SI1S2q80bMlEY2G2IAXzwSM7OxwCfGZZUNVGcB+huUwgLgeSRe8zm5NtI8ChaJwPKG3bMLYlxjt7WLeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GaoUFt+5; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Ije4MARW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GaoUFt+5";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Ije4MARW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6oVT73471213;
	Fri, 23 Jan 2026 09:09:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=hcSRshBSZKCkPfP/kfIPJsh60jTz7Xz/jIxxWjqu+J8=; b=
	GaoUFt+5zl6I18abfxNK8/AenIJ9FJv8THr7SQ9McOo0Y9NGdiqJYBBN3h5yMwhj
	rtZ3OXCqPUjUIBD8vk1p0QMjGvu4anI33VX0pztuH1xyrbPAraEyyEUP02A5uKNz
	L7N27jb1YP2fkOQG8Yo1HV7N88O1VhfzlhhtSSJQakJEbDXMy4/2+BWSkrM+NI4X
	nX4+KWs8Fq9SRtvmOS0w7MU033IhKsGSU/qo+7Q1/3ABF2ReG6vXK/p8LXhuHRpi
	Ev/5KR3fDKGaUbVo4vEiOnagAFs+rripUf11E4cDAOrmFFjUWgCwmsSl/RwlkxXI
	6U1i6+XIzzRH0DKBpdzo0w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020072.outbound.protection.outlook.com [52.101.56.72])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4br8q1ypdk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 09:09:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJ337tqnfYpkErPWwMDRKzChwRGFaqigjZAm30lfO8vEadnzsiSt6O+8Ql9BnBFMLHjCgdszI4vh7IqZaC7VmKPGa5vYm/OL7L9FlGmwUZcsbTglZxUT2UhWBIixRq45kggeg9e2EzKRLRDVFXUxUwJp1VKIvfBL1O9Yjx75hHi4+N2BEdBr3daXujCbOLuBfd8PxIBUgJxP2wEibElfOrHtG/bQFQAQc++XWshijjj4mAE3QDdkWQeaiQS/nWV7YyTPbDtKcXcyM7XovcMdlpedq4VrhizvqrtjglLhJKv44AGV1W/En+uzbyVA7fSNZfxtq1mHaiIr/V2UZTNfDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcSRshBSZKCkPfP/kfIPJsh60jTz7Xz/jIxxWjqu+J8=;
 b=O6b/GNlFLHx0l2L9PkeEvf3V102wASSiNs5XqccskcGQzluJqyg2c2d+n/WJXY9bNyMXzZOY+7vr2wDfQboIiAahks1UbG55V9RRdgwm5P5W+DPivi0dazd4/x2NxZlmepmx/GymoBgM0wDc58fzAtxHXs+zLmw7fIGo+rW7Xj8sHpbdZ/nyb7bfX4o7pTST4duLx6X1kiwYvCOdi1BY1z/2oO+9O+16GPLh/UJXbnlfh+e8czsrr3mSBq/BGzUig87QZrMTi3V+yMidw1ycUyXjve/hM753Bfk6Y9v5MShXpdneTMiJmafRFFgQTjObkKn/mTPV3b+xK5QY7ZT11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcSRshBSZKCkPfP/kfIPJsh60jTz7Xz/jIxxWjqu+J8=;
 b=Ije4MARWvxGz1vxrXR87geIjcuH4euh2TaySHp06jyogXGybvSXVqr9mZrB/Rx4SL+s0YSim2Gj7TLp2r2HnplgFncNW7OupHJelMBPT2KcoO6/NPRpeByME/rmL4LXCPs3xnUe/abn8N9y7JUsLj6hK/y/wPNxySToZKxjy9i0=
Received: from SJ0PR05CA0191.namprd05.prod.outlook.com (2603:10b6:a03:330::16)
 by DM4PR19MB5833.namprd19.prod.outlook.com (2603:10b6:8:64::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:09:54 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::c4) by SJ0PR05CA0191.outlook.office365.com
 (2603:10b6:a03:330::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.4 via Frontend Transport; Fri,
 23 Jan 2026 15:09:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Fri, 23 Jan 2026 15:09:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9680F406542;
	Fri, 23 Jan 2026 15:09:51 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6AD0A82024B;
	Fri, 23 Jan 2026 15:09:51 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/4] ASoC: dt-bindings: cirrus,cs42l43: Add CS42L43B variant
Date: Fri, 23 Jan 2026 15:09:37 +0000
Message-ID: <20260123150945.100038-3-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260123150945.100038-1-mstrozek@opensource.cirrus.com>
References: <20260123150945.100038-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|DM4PR19MB5833:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 05322026-7dd0-48ca-4bfa-08de5a917625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|7416014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v/cQxDp1SiKoIQ3HWtrj7itQC2MoBSIrC2gbZLqgT3hlltDyqyHC/3B+5zEo?=
 =?us-ascii?Q?M3O+G8+QX6tx9iIu36PVvdb1I6cAiveBJQ6U+XIvor6kcygv/+oC3+GfwC6k?=
 =?us-ascii?Q?x2FDAkltqtbJzr0AnvvVV++y1Z6U+YfG8TpE0yl83MhDAQImRP5nihJoK+bX?=
 =?us-ascii?Q?ElyEn1RtQcMSqUWN3CEVlSyAJwlfBZjjTq9D3xLfCVQrriaQYil4vaJil4z1?=
 =?us-ascii?Q?8aLqvxdnEJY4yewJ3hekngRr5SO5W4as/cVyu7vQ0Jo7BBBOhjvkmUQMO83/?=
 =?us-ascii?Q?+0ocbqbvvrdJudANvB4if4tz74SEmfeD1aTbTAZ+2zUDonSaa1KqVsRjbLg8?=
 =?us-ascii?Q?OX6mS/qQSKLlH20+AVin3nDTGa9jJyU5+Acu3QMLAZqz5c3hlj/mqfyMKwpt?=
 =?us-ascii?Q?RD3PHK8Lez1oRPxEfB2YU8pL3aGzEByezp0LFQOt5yk6zheX4e+Uop8WuRbN?=
 =?us-ascii?Q?VF4dy4rQeI3zcQN5vES8Xg3QRAusD3xihAhSojjwjVNIZ2J4ObFu6KE2511R?=
 =?us-ascii?Q?D51RTL2i1Cl47XxO8fGkMBjSG0dY8ceuimaAU6VePk3MP8JJGB7BZD2BYnUm?=
 =?us-ascii?Q?wjixqLA9NXxIVaIvNd9UPcbmZ0HtFc6m6RfGyWg5aajlCeUIXHv6v1vP1fKS?=
 =?us-ascii?Q?fwJc56r6Nj//cITxsGmyk/ccuwMu+HtTZYY5xqmcbkWHQC+bcBqFAi5xx2Iz?=
 =?us-ascii?Q?0moRRuKByKHzFilkSc0Vq4XEBU6pQNcZy5strK6WzYTOyBrWp18kMlVcjjOr?=
 =?us-ascii?Q?X77a1pK9XD494SbsFpml53uQlFGI19drQxEe7UES+Z4RZjdh4BDLTzb4qeX8?=
 =?us-ascii?Q?gtgw3fzw6MtgC9wTuhUZLIQO2iQ8zU9n6neZXLQIykDeegonMNwAAmlngMTi?=
 =?us-ascii?Q?NqBZd50TvdksCDNpnejy3CywhlRXD2o3SD7M+gKKqnA3CTFd37Vu50e9imc/?=
 =?us-ascii?Q?3kJnqmbC7RoQYGnSkDxJuK3C+lichBeT28H4ie9jYnsk+Mux4M7ooYATb4ZZ?=
 =?us-ascii?Q?cMPF96N/07uZkJsK26/knskBVm1J8wbdQp18xC3G/R3F0EP8uzRSaKoyQ826?=
 =?us-ascii?Q?1AIhb3ngaLT/V2vDd3VV3F4/SCAXSrJLBbh22ryZXmprArGyOzenpP3gQc0D?=
 =?us-ascii?Q?rfaWfs+Cb6fNs2y/PWNKEAmF5vRr9KVx9mj9K/b/sBo6+gXGJwA0rugITSJp?=
 =?us-ascii?Q?A7f1flods4EAUm5QKTjB60CfmNZ71ev01gVvOyIL3nO53SnqFl9OAtQrmdtL?=
 =?us-ascii?Q?91W1TxC0As/PHgUA/z6ekihGAOB3uXq280R7PRTSDsvrZmYlO2IfFawKJyh8?=
 =?us-ascii?Q?1y6Bjsx5l+G8FkBzMV6zdngUDqJcy5tpEMQYeNKwxjg1J2LVw1oDdE2GiW7m?=
 =?us-ascii?Q?I53Td4GPhZQGjaBJ5G48Fc2jgPMdZRghZNZ/hKEr/LYLCB6fTwQwsBv2zGPp?=
 =?us-ascii?Q?U8r+4jMm+WDdySRxszbal5s2ZLN7iWg57EcC2C/R0aI+beQdo1NH/B7alt0K?=
 =?us-ascii?Q?Bwnhgn7QMIR1W7o6TQJTDKQVIFsZGLOxk6npssEmxStRmi3Z0QPnbKSXM+iQ?=
 =?us-ascii?Q?LMkwogKr1EqiPI9lzc//I4X+/Yjx+BIs4R1Zny15MBC//hsOBNN/QWE2zDBh?=
 =?us-ascii?Q?+7+UnD/9tTQBN9r+82S7JjYwxgUbMd0kziN92UV08zCpIguA3NM4bI55KVcw?=
 =?us-ascii?Q?Mi72jg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(7416014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:09:52.8942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05322026-7dd0-48ca-4bfa-08de5a917625
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5833
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExOCBTYWx0ZWRfXx/zK85mgm1jS
 qc6K/RW4UVqbWSlErvkagcWOR02ugQXCIYSxpuyKR+mjiL6+9KjZpTW8Y4iO/389DVnw8MpVzOo
 +iD+HqwbBh2UKG5kTVgM0Mje+K3bJh7vrL2QOQRshSZsl1ia16qdjJdpKp2NurjK08jgkJtg+lz
 So1c+498YXaH19FAQhzDuAKmPlnpGWy2YALhpn8UbDEcB+dMta+WiRKGLdooSVX/t/E80bKt6IT
 fdpiH+qW9jROM09Z5JIQtO3i2eYRkmk5jI48TIPGFT7+/redlYw6i31Z71t8MgcR7YTKhkVlw39
 GMfCFxOrmXwxvZLgm3mgEOraCcOd/NZ/9yg2HbEJijJ7TWTUsxJkQYqDf8tBI77CUeT9YAI623A
 F1rCJwJL0z2siPW0Jt/hLiwAtdlHVNldho6yAnyKksa9ed93arHcgRJGY4WoglD0YbGdNgcWCJg
 2H5SAonvX2ULlc9GQww==
X-Proofpoint-GUID: DlZHUJ2fLXwR8RVoN_QyrrxfwUTQZWe5
X-Proofpoint-ORIG-GUID: DlZHUJ2fLXwR8RVoN_QyrrxfwUTQZWe5
X-Authority-Analysis: v=2.4 cv=JbmxbEKV c=1 sm=1 tr=0 ts=69738f46 cx=c_pps
 a=EuzLu2ZwJ/NCzAOim5xawA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8
 a=aSH8VwKN-Jk11-2aqjcA:9
X-Proofpoint-Spam-Reason: safe

CS42L43B variant adds dedicated PDM interface, SoundWire Clock Gearing
support and more decimators to ISRCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
v3: added Acked-by from Krzysztof
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
index 99a536601cc7..376928d1f64b 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
@@ -16,6 +16,8 @@ description: |
   DAC for headphone output, two integrated Class D amplifiers for
   loudspeakers, and two ADCs for wired headset microphone input or
   stereo line input. PDM inputs are provided for digital microphones.
+  CS42L43B variant adds dedicated PDM interface, SoundWire Clock Gearing
+  support and more decimators to ISRCs.

 allOf:
   - $ref: dai-common.yaml#
@@ -24,6 +26,7 @@ properties:
   compatible:
     enum:
       - cirrus,cs42l43
+      - cirrus,cs42l43b

   reg:
     maxItems: 1
--
2.48.1

