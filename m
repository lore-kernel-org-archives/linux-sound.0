Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526C3385A2;
	Fri, 16 Jan 2026 15:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576887; cv=fail; b=tHZp9N/J5cF+nWAsMr9DGmumnA6h8Xp3/tuaOaTU8XHibbY54TghfkKnAtTrvX7nc+HJnI1R3z3jREKDkQUf/ObDF6r8cqAEW07sr2vu+qSbh7xxtKEk1H1unKVhROQt1QMQ9QwOIKk0sxptgAeINCJqNaPLpbfgdHEYgO9iIIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576887; c=relaxed/simple;
	bh=v/olyhkZiy2CrcdwtVCoakkD67lNNHvRGY5a606aSyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tulOM8F6hDYdMOIoymCoaw9kjiKmKm9kfR/vvQTlrkYs43abjzancP7YZmyuSggjK0abnTjpyqDrO1Olva76gZRe76fSSWNKFux2dkecR5abhgN6uyWMeYb+HW0j+VFSQAvUNC9YYY0U1DoHCb/xhCoc+yB2cASKC+ZCD0dzSQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RmgKvHXp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=a6/yVTzr; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RmgKvHXp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="a6/yVTzr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G5HK2N3464332;
	Fri, 16 Jan 2026 09:21:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=kTz0V2dEMf6Hi53XdROZj504EG2pgC6s7fJoi0v2ABM=; b=
	RmgKvHXp1RGDJFgmppQnmQwCmNvYZcwRGAS3y1i6BkBm3f9iAo8yZkjLal+dfPwA
	RKda2NB1LYbLYxCumqHMzOs6RBq135A6rVKAxbQ7tLr2BMoqw+IyPcaB28fE2Vv+
	zAd6jxcwXU4t8nQgTwIWnZGbOAz7eFHsrVzVYcUoy4iR2QZEkjp9EJtmH6YmPhPg
	xh1HREi9rw7tI+Vghu4y+ksbqLJzsiCmz8tO6sfO308q8KUwkanUNG3WLh34FHNF
	bfT0dcLgD7hdDMOi+ZeIxZas1JbhMZjeJsrbMzNQOhCZllsD+JHcfTwlcUKurM5b
	obtsdp5ayZ4safvt0KRb1Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020076.outbound.protection.outlook.com [52.101.85.76])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bkn207ba4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 09:21:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ld0nK8ITQengMr45/TJFlPuiJrtNcdgf587ivhok9Te0FlhrGlHjPEgJLa2fVEjbHZ0IbJBy1r8/w5ChLlg56qRl6A+P2OyzBok35AXtFgVODm8pE1uOz0SEdeiKTvivkw+oW6haersXvamr1HcMFFzBGwHrpiPFaqZqki46yqf38GOBmWrC4aetW1sXzKSiY8SweyLWfjLpZ+xsQ5LhJuDSyhX9UROfUwNqmhOeffx3EuO4ue60YZArG/oj9kBd2IvOGkGV8ebRDgj5mWwzNh9vRbbiAJ7VsswEb+S73BC/u3DAAEH6KYW8gm02rKB6OZukqoADisr7IIXzJs8r+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTz0V2dEMf6Hi53XdROZj504EG2pgC6s7fJoi0v2ABM=;
 b=f94dUkGWrH1VgMBcQ4RNBPqYhn664cZ9/qFKbLGwgB7l/S3ZzSljL2cf61Li6+TiuFGE5zKe8MgO/HIT3x5yUKZcloQUm43VWVirXtqx1ZAzLFb1pDGSw3iA/UDAReTHKmdojTZlV2w6XGmIo1w0O0nxAnUvVR6rABh47UIi5x/MO0OSf4jhzsewqbWBvxzIYag9Vb7ZYMpgmo8vcKv5ivWKDc2jJlr2MNt7gE5p/0bEuJvrvZgOzEcKAj8D/2wy/r+a4HXoj1TSYqNlwCRO4mu3xQWKzFlmJO89hG+ZcsCSXO4YO339qIe/IVcS7vid/ZMoJeAKrSF9Du29quMlgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTz0V2dEMf6Hi53XdROZj504EG2pgC6s7fJoi0v2ABM=;
 b=a6/yVTzrS5h41worCeErmAKXo6kFpEzbLHbSz/hjvcH/rXDlWsXG0JeeQAYwwGma+3HPhVgNV1nUdbi1RdbQ6P2roJX1dKkoYlm6R+wSoFxBgMNxfWtfmyPxXjKNXdc9ifT8kBsaABpJqxOhmgS6k6dMyvoUdRu1cq2oCi+fLBY=
Received: from SJ0PR03CA0127.namprd03.prod.outlook.com (2603:10b6:a03:33c::12)
 by SN7PR19MB7576.namprd19.prod.outlook.com (2603:10b6:806:329::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 15:21:06 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::b5) by SJ0PR03CA0127.outlook.office365.com
 (2603:10b6:a03:33c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 15:21:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Fri, 16 Jan 2026 15:21:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 51463406554;
	Fri, 16 Jan 2026 15:21:03 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3677C82255C;
	Fri, 16 Jan 2026 15:21:03 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v2 2/4] ASoC: dt-bindings: cirrus,cs42l43: Add CS42L43B variant
Date: Fri, 16 Jan 2026 15:20:41 +0000
Message-ID: <20260116152054.85990-3-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260116152054.85990-1-mstrozek@opensource.cirrus.com>
References: <20260116152054.85990-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|SN7PR19MB7576:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7f074aa4-ac64-4014-48bd-08de5512ddbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|7416014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YZuXTZzeBityAEBf+8FoTKGOlmcTjExKSZVbT9sJqkOzurv0hnEWxInlWK5V?=
 =?us-ascii?Q?O2esX7U2eAoh/RKfyNUyAtDaQwVvRre73+bMWpLCtpt4lW5forQuYiqVAfCr?=
 =?us-ascii?Q?0iNbWJKNurF3P9TXQsXIJ6AGuN66ibzTDKthZowF/mxSwjiQnw6iQjqKZ1Mr?=
 =?us-ascii?Q?7zOxTboPj5Fn2kBrxkYE6a/35JbrONOD2+/n4Em3fhxYyVaAAM/VvDUa4ERT?=
 =?us-ascii?Q?kvBfKPKePfw6kOSaXVrTNGfuWbgDiCL/wq8nsoDxPYcwfCY65VxUCKSiLpVP?=
 =?us-ascii?Q?MBywRV4fu/5oh9SXLM/AHRJeOvbZlv5ynupIajfuMz9P35ge65s1UwDrmDWR?=
 =?us-ascii?Q?6keMqPCdwQNYWQjy0sV5D8ZhRX5zRpShgHfcNMOsIQBJGLxUVWNdosqYGAAV?=
 =?us-ascii?Q?ig7orjIbRNVk6hv9mL9xotk5O0WTmPivAxib/seo/wP1egaAGrvh6LVGqn9P?=
 =?us-ascii?Q?g0oREcTwB4Bzw/rBrWe2a+WNi4gNI5vuTy9bQ21FPUgfvImXcjgET69n+fMl?=
 =?us-ascii?Q?dQG3Hasnl7Fv11iyLnJQXXgmp/VfvAoTWyzTGEuXhx3Z1MCQpmQUCZyeZPpG?=
 =?us-ascii?Q?nTJipsjQfO3nbPBw5cjnRW7w9BK3WQJ2NNQ/b3krYmEeLBdgarDa+Hal0wtd?=
 =?us-ascii?Q?0eYoQKovMOK+1fnGELfJHOgJQm8ZKhVXkPytX0V/+n27K9j2Zo1EqPKagP6r?=
 =?us-ascii?Q?7/P3ACm2gNuyY74cc7FI6qnDowQuCl+swESMdMDxdUX6IMFMywRGSchQF2MH?=
 =?us-ascii?Q?JArVD6vtz/hiyd83uY3CO7G0Nbgpi9Ymz2tpIlM7NF9hscFkzkTncImcS+T9?=
 =?us-ascii?Q?pcbR2uzpg5G+Y/CRBxRcgWH099+RtN1/07V486KZC923kjxweXXC8EX/UlSq?=
 =?us-ascii?Q?cMbnN0eTUNHh0JAEO2wqzI0ZLo+FypLvPr4aPg0pVImycVkuVonEnV1ssll5?=
 =?us-ascii?Q?NEhrnhO6/z/RgPF/2PUCRSVdjty27vb2Fv78OnsC9XCfDDTU7UkI/g2LGqGT?=
 =?us-ascii?Q?T81zX4sjYYlfUujRc2/3XyP0N10+Dqp5ZBqjDgzZBaWZUuMLsH8j22OpWjjt?=
 =?us-ascii?Q?BDsWAQuOwzGaY6pehLmM/+9Dpm1BFp0TJSQ0FrEYjUZJbq4LiqmLm6q56GA6?=
 =?us-ascii?Q?5a2h311ch59pq/Lf2vcT5qoDvAQKToXRjDi8rYOUapISv1EIHi4xO582Sihp?=
 =?us-ascii?Q?bC+gusucK+Kqm2lZMY1i/nXSNo2C+JfaAJU29oGpaG8j/JSmGcJ6EvIf2ei5?=
 =?us-ascii?Q?UaEIOw0kL4K89/+JddwFA6+cnhlN2G8gbD3RwXrmInDMmKZPCT0YDrkr/b5Y?=
 =?us-ascii?Q?8TaX/sPf0I3KMKGwuozFv7zM2CCb2NF+sOl8fM0xAaRyoTyy/cUn3XV9s7Lv?=
 =?us-ascii?Q?e24ThD8rb99lwwNAbCbUAi4d1pu7wWHuz0rU4yytp1f6mjhI4zdDSAcEDuqS?=
 =?us-ascii?Q?48wBHR6pG5g2fQUzQFi+xxZ7pA7bm0drxYsKUK9g6iUj6caPlGc9evdO/1Kc?=
 =?us-ascii?Q?p3FtSjfm9sermIa7I2AuszRNFd0dR7NIZwtctagx9bAzJkZyK9vN/1tqS0aF?=
 =?us-ascii?Q?Ord5Cc5/N9MUB2A7ioRbEQ8UG7FEx41zG26N/dLjl3i4NMUgo8Kw+HNKxsSA?=
 =?us-ascii?Q?vE1n3A4Fk66KAdg1rGWmrMas3S4uYIb+KOWVKcLBNo9+NP8iLNFjuBmjaAPb?=
 =?us-ascii?Q?IItuwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(7416014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:21:04.7805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f074aa4-ac64-4014-48bd-08de5512ddbc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7576
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEwOSBTYWx0ZWRfX0eLJn2XJaIra
 B0ZwLEqyMmiyxCJrSjEm0NGDXqgMHpPX0hwWmhNRM5i7eK6gjzWqEC4Dyx7nHNyyOpYvfHNWEBB
 MpUxWEuDWJU1RCiMLKgwjsXxvqGW59g9qBvHeULaTcO3vGbmgDHAuv1hLgyAwqaXddkBFKVvewP
 PbM8Uwg25jBJZG8pLViZf7GLdHRe6makQHaS3RqlO3WAqHAVxLbT7G6UpNrooIBo47rvAg9ovfY
 hjAOXlgW6npmozQO4IOPsYe+w9fN2Ai4pV74KfQ4eIxfqkFDCtsft7HYgN3KuIBYGwpFuyS0Y8z
 auJvOGefgBUAb9QEnD5N7IYu3AOyeuZ3v6lK/ky0nOQTE0btwIFiGbnul3Q8v+IFs6RbLTco5Ov
 wi0am/4SPqs9/vYCPm5cPgkxH30uaTZ9sIOX1UduZhLP2h6o57EuyRWk7zaJG1ioV7UMZZ1zyML
 EghMZ2nNG8Iw473Pq+Q==
X-Authority-Analysis: v=2.4 cv=LPVrgZW9 c=1 sm=1 tr=0 ts=696a5767 cx=c_pps
 a=PU2v30DqrLDYHXTVxoobRg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=aSH8VwKN-Jk11-2aqjcA:9
X-Proofpoint-GUID: Pz2NkmsSwsPkTv88GU0MI_8xp9tkp9-x
X-Proofpoint-ORIG-GUID: Pz2NkmsSwsPkTv88GU0MI_8xp9tkp9-x
X-Proofpoint-Spam-Reason: safe

CS42L43B variant adds dedicated PDM interface, SoundWire Clock Gearing
support and more decimators to ISRCs.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
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

