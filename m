Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316083CB2F7;
	Fri,  6 Mar 2026 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810959; cv=fail; b=eFjQBK/rN8AepCiXPuTakvdn14DDZYjmHAYIDlRCGKivRkNT4VPPOzXwS99xPftXASoMKEwqGKoNTgf7tgSDE83/+EaJMz6r+CRQehHXLdum5tGrvrp+VNZCQr3/iDrILgsEafEteHaDpxrLi7Oz37ArlY4nVyT7PsQlszMbzLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810959; c=relaxed/simple;
	bh=/rN5uxM1PTMvBN4+VtjZGbGNIrpAUqIKJG4blnE+nAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nt6nC1NZrrZ0d/Sr+pBuTHLzXGFKhh0X/XfqS1r8RzMcWBh7ucVeTEQLjyai4PTeA9uYawnoA7Gwbc9n3SUeWqKHmNL1MM4c/YcDRefuhlYWZsS2ozcwD0giUX10KcLqhs7dEWhOku40rtLQDZn+cpjWlE3axyvw4PSWNcAuDDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gW5g2ZnW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xCLiX/Fd; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gW5g2ZnW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xCLiX/Fd"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626D4sdl086000;
	Fri, 6 Mar 2026 09:28:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=dJtmk8uUytzv3t3OLXrGmLjQIT1tCNsxmU4wobhGnzw=; b=
	gW5g2ZnW2flx6wv+ZPy3vOqU9gLdyCKYl7i55k49pE+/Mc7hSNp2edNqj8d7unTp
	PYf/8wF2c7h3AJRrbbHImKEvEmP2MGKZgg+9qIIqr0jPe936C3w6pa8Hsl95q5MS
	96Mz24R3E2O7dslcctmBmbfqvqSctp/FOqfHltWY6zvBPhF0u+/FIAoHOw9Vb9jI
	AbrxWmYfV+6Grz0uaw55tUE5k5uQL59SkuD09rpD8ftkeX7ESRUYXn5oyMjGNGmm
	H6BL/cbJcEuq5WhEo1paNuz2ExmZnXCUrmdj/1C4TToI2Cgy1CahlogeEnCSymFS
	NPTip4tXPPrMfP5EwecLjw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022141.outbound.protection.outlook.com [40.93.195.141])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cqyg886eh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 09:28:53 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMTsAXOmiIm2npgxLN9gVS0MtOWlHctd3Vd7eNWzG8qHTIASK9qxY5kyjLE+XAn7uSFlis2eOipLnLT3otI4eqNwuDXqWplPahBg2goQ4Y18r8fpwNtwloMgzNsVZp5KoPbMg8fdjW9MiU/JB0IDN0SAHupCsY3jrd0b/JLWRcmNu3Tfh4KirNcdoqxxFXfOZtRFVqFgSNYpi+X7yQdYpYg1bQbWi+OTIFt7kPa1ryyVsPdNoXKG4lyRJFWkN6aV6LB5XCpxG5Sm/FbnJ2LRHvptb7t6jSdq0zzjfa30+8ARoF6iGqGfqH3q5u6n6hcNnOrd5aCtMqavX995v+jM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJtmk8uUytzv3t3OLXrGmLjQIT1tCNsxmU4wobhGnzw=;
 b=COGmxE29tzZ5VZf8LH/VJ3E/EXKCX0lq0GULsRA1Jttm16fNHbbuvtSS6S1bOqB207iOqUbD+2ss58PPJ0nOtHbQY4zXhXrUUtGZkvgv1LEscITVYUDlEdP4SLTSO2MXDmrx3O1foW7hjIZprSJfCSH3ExS6aH7V1R+3MiYCh+XDujSzPlHXelaENflibV9mYxbB+GfJEFvqRF1eS2TeltJtMLw3mOnmHfeTa6uzKkb+28rK7tSZhf/c03wCweGHX1NRoAd0n7inl2RcovfL5q7nhyDqktV03U0vEgCNRdBqpn/FKlVUwtxIbBxO9zKZ902ttbeJvxS2XPfanPHCrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJtmk8uUytzv3t3OLXrGmLjQIT1tCNsxmU4wobhGnzw=;
 b=xCLiX/FdKNKfx3/FPZWC5Bx/+9+dXejNOOwPScW38hZem87KddHwOsZkuwME350gZQkRx5VuxcxEZBGCfbX6iYHv/2PZhFtiUm8hGCq+z2Y+PGiz09XwuGOjzr+JmHs8N8f1AUNu+47QzGuuOK7LPBu5a5r6csoBa/vYtdLE7jw=
Received: from DS7PR05CA0008.namprd05.prod.outlook.com (2603:10b6:5:3b9::13)
 by LV9PR19MB9158.namprd19.prod.outlook.com (2603:10b6:408:2f3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Fri, 6 Mar
 2026 15:28:51 +0000
Received: from DM2PEPF00003FC8.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::d) by DS7PR05CA0008.outlook.office365.com
 (2603:10b6:5:3b9::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Fri,
 6 Mar 2026 15:28:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM2PEPF00003FC8.mail.protection.outlook.com (10.167.23.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Fri, 6 Mar 2026 15:28:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 181DE406542;
	Fri,  6 Mar 2026 15:28:49 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EFC0E820258;
	Fri,  6 Mar 2026 15:28:48 +0000 (UTC)
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
Subject: [PATCH v5 2/4] ASoC: dt-bindings: cirrus,cs42l43: Add CS42L43B variant
Date: Fri,  6 Mar 2026 15:28:09 +0000
Message-ID: <20260306152829.3130530-3-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306152829.3130530-1-mstrozek@opensource.cirrus.com>
References: <20260306152829.3130530-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC8:EE_|LV9PR19MB9158:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2df8f8ba-eab3-4fba-6ec4-08de7b95115d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|61400799027|36860700016|54012099003;
X-Microsoft-Antispam-Message-Info:
	dVjDGhiS/qKki9tPixMTxG16Pq2D3r40lJ5glBMXk9vzFy1zQOBAbIrnHIck2dbVxwlR66NuojNpT2g3VCkBLwOkcPAf3K4xwQZMhkjwKouhyuViCql18UeTkl8NDyQjmn50e6Hizt/vaJMqg+RXYXAo7A9ugLw3T6WneetQhjd0EjfAyt7uGQhDcb02dq62GEm+tK4OVUUrazGBYlUaWT1zDIbdKvAUjBJXozCwTXoR5UHt1efdsE5LgddHITqoEpB3VYShe03mGYUCimTi0ngNEHE6U8NTDqB64fokKbh4a0xO6ei1tAwngXdtDi3jRvLHlGsR7IzQbAQYjLm1Fm0mhsM4l+2Eg5zYCh0GO1Syh6iyOs3qYUP5TCWqon5pPIJPWKyqShMaIyzCCqNpBWg0653lMr3omUOPpEb/nRQ+UdiHJg4jK6G4IXgD14Gi+STW1uFvJpIjYQh49DLObgt9WitUq6Ka5Ksm7yVhjc4z1KhLXnUgvWD/JUzylkq2+S16jSRgAXUrVewD/yFajKaCBVE3spLK4tTXGTd62aj7IzMEzC7hbs2fmyhLArvAhiVnknou+WO3+RKyeGY/+6RLGZRObRTCHqxAyRMOX8UuknUvkMSC2iRXkvAItAmiiz729zFJeyiIp4W9BS2/86GqFCUYNG1H15cTKVTdX0gzps7T7XC8sIpMyilKf5vlWoor0m0hGS0UarsmEBTOM/33UPNswRMOasPVqK/kW1ujhqAiFbo7g4OFdSPRy8+36QqHh3ikXs17FK4dhmcH2g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(61400799027)(36860700016)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vn19lpl0cc62s+6pAQeSHbnoTlwFYu2jCdFMTgCWK35KlIYrUJO5CMT2hoyaSoSrYhNR2xlrIC8WvyBbLGCcTMh5n5f27rSAIsOoZC9hJFwRvi9L1DWuLaZ5VMsgdOpaGD23Hv+ZTa12g1mSUJB6SJnutUZTdRfT+k36LGgRzNhM0N6hrEhG1IcKHi9ICpTsCR2DjvyH7h1ON/LighKa1qMnr7TcPI0I3PLb24iz3Q8MMfIjfqBmWD2m+MTPfWDSmiRdvO4ZMCWzXzIL87oxvf/ythvzXp8m+NH6p7JKi7p35qYRYTiLACimN0R5LWDAbPO6ut2gcRA2pua+gr9zyVuTEFEwDhOp7IQNtiBuUrhYMn0wxIRavEB9tlfWMPMUtyoil6VxVz2fKdiWr9aXJxeHBiwxgww5WTWi+U7DjHbI7XTTVn1zcWYnJIW7yW6S
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:28:50.2001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df8f8ba-eab3-4fba-6ec4-08de7b95115d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM2PEPF00003FC8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR19MB9158
X-Proofpoint-GUID: RJrqSkn91GfTFjGNiflHRi90ynBrA9p6
X-Proofpoint-ORIG-GUID: RJrqSkn91GfTFjGNiflHRi90ynBrA9p6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NyBTYWx0ZWRfXwMVYyvw+6ct9
 QkHRCuHZ5ATSnZoMBlldy7SkEtIcEt7j5nVvOn5Qibasiu9eQ608ocOehKU5F4EkkrvWohyKbPk
 wppnnAEuHpcxmVUNlTbDbUNWm3C42EltnNX7eyHfYpjIEr5f88QYsi4t1lW0qOR34VgMe3R7OLa
 S8hZZrMZ8uddgGQcfCD1j1z74wu2+KzlXtioAR4vxqNu+Ktrcoh9rvs0TgoTEz9mQa0N0Z2gFby
 E7sewAhx5R4UGg7F6dH6BU+AAxtYdXiqLy5fm1EfpdI0RIC9Mnuq99GQc8FGS0Wwt9VAPBDY/Ci
 OmwqZxhhlahjGd7sXObzSk7vWTT+biNkVa3JCz1MYgcm3qWVvHmBlEgoc6eVy5ppDVn8h37GrGa
 YMieJWuCt0Q+hQ+M4syEIomHSAfSh0hRMDSDV81HEe9Er//1dmnocZ7527VX1T6SrgQsB4HLuPX
 8xGhAH4PwFIhC84487A==
X-Authority-Analysis: v=2.4 cv=IIwPywvG c=1 sm=1 tr=0 ts=69aaf2b5 cx=c_pps
 a=grR+JLqVfS8Y5b128bbGRQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=aSH8VwKN-Jk11-2aqjcA:9
X-Proofpoint-Spam-Reason: safe

CS42L43B variant adds dedicated PDM interface, SoundWire Clock Gearing
support and more decimators to ISRCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
No changes in v4, v5
v3: added Acked-by from Krzyszto
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
index 99a536601cc7e..376928d1f64bf 100644
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
2.47.3

