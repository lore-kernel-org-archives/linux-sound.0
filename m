Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51F64562AF;
	Tue, 11 Aug 2026 17:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467993; cv=fail; b=SAIiGCOpzn/xbYk2mL4qsm6tbIdZc6jv+Jbyu3ewEN0V6FihaRSUckeju9xBhd93kjk5raSpEk07VDeahUzEnY/iPpRwqgU5jTzChyZNcfmEqEc7IyqPwYbKgfoDH9HrVNNwQZbv0p8TkhY4WjI3g/FOpKaj+gSpe+0xooc7trc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467993; c=relaxed/simple;
	bh=taAvZZ816zz8fFlQywx93aEfjoKc+ZfqOgAHWjeZkbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TOuMJtICEDOWSjj7T63JBbyuZqWQE5J4nOXP/xOFHsfndAaEVFu+NHpvGtDlKs87n+3L0YwSEYw8H3iDIMrqV/CRHfPneTFEzdVihp5CErLAxw574HSW7kjK/hB06IY+BJ9jNXSsfOpoOHu6wT9juQo3T0UxYagg9TnfR/Ll0OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Aw3vSq51; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Wj9ih1WJ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Aw3vSq51";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Wj9ih1WJ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDEr8b1185736;
	Tue, 11 Aug 2026 12:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=NYkD2mhanVZcgmS0vnjPGFgNj2G8Ee2J9C6s26sXYhU=; b=
	Aw3vSq51qiQTFNRE3GOym4dAMuh3/0t07H0j2/YDRuBejdybBxt5M2ri0/PmT9Ky
	OlYRRjN1eWgtYjDQ/BNX4kvzVq8K9USRxePMad61VDPEtypvN8Aq4C1rjRllmJ6P
	45ON4JmRq6hY/d+Nsaby8zu8oDhPqyCNDuccP/Y52VD2GdhHOcUpK3bUyoCaxuBo
	kyd8v4bEJJooH1+RJ4pBM2zpUlah8eC+THiThGHXrRkOACisTnxtkh/wmRb51X5d
	sXvfizQQEtpY9dRcOk9vamLWyKZKynVSQFpjeGvnEJy6oT0BZlCdyTJSWGeSnKJH
	XkzBCwVEjjXR2pNKiTdAKw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021080.outbound.protection.outlook.com [40.107.208.80])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fx0vg5wr9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 12:06:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvZOU6mpFGO3T04l/GokWtIIEQ0BDWaKioLJJA9tn6ouGjJ4HHTpbHr0ynQ8sugcErGdWvpi17bUbAkKikKb13QwLz//5txNoOewlXbp1jKwVVrauri0Cbz9SHL/srKBajxZPTihNaIamGLaiEy/uUMRJxYMIWwkYS6HgFr0ZScY0apsMkkpeY3z0vVkZ1RGv4tSDXu4+fcywmFpA0LLAeFqQKNXblnW4HPWyBCYlwZ7703ztVbe7laGoyVrHdDzf+DJyxZAVkTR/zFpX3f0cv7ZwNQxaDKza+XxF/fh39YecfDutX2R+W5yn7lu7ON931uFvd+82iPiY3yzwM0aQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYkD2mhanVZcgmS0vnjPGFgNj2G8Ee2J9C6s26sXYhU=;
 b=PgPRS2MAlciam4HIHPFVQoRaJRMC/xDqdU5QtYP+BuDGtcMXUVKDfuc6kOAXGT6hDKjS+xTeWBlKxl9YhIIkeee3XDJhxaxUb/V3iwJpisJD+L+bLW1aDfbrSYbJIaXGuduQbNQVruK6zrDDjt0HHOMh7NUohrjChBa8vwPXKp78JllJ7Ye5NP+TTmMTTAZPKuhFnG8AC51nZs6J4qHFDfSdlHZ7FgWKv/qcWPyEG2NZ78o5CI5G+n5W3j3JyV0LyLCdixE7Uytj9B0kYhuVGq7KFFg2/zF1hNnzZ7VzH+o2UEjeXIxFI7F1q92yI/EMjQI9UkBt+mexaBXZxkDLQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYkD2mhanVZcgmS0vnjPGFgNj2G8Ee2J9C6s26sXYhU=;
 b=Wj9ih1WJZCLd23kyl5GId3vHG3DhdZa8OWHVvj8SYOkIZdIcp3cq7rzkI/aGnqWWR8+DYflG955ZEY1E0vR+bsHFHsNyg1jVows6Hy0SX6u7AmUnHkkhyIQDtbU4IUEhjEUQ1nC8FgBzfs3NPrSBdJFwp1ECh6g+MDT9i+jKgX4=
Received: from CY5PR15CA0235.namprd15.prod.outlook.com (2603:10b6:930:66::7)
 by DS7PR19MB4454.namprd19.prod.outlook.com (2603:10b6:5:2cd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 17:06:23 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:66:cafe::f) by CY5PR15CA0235.outlook.office365.com
 (2603:10b6:930:66::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 17:06:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 17:06:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7DEBE406544;
	Tue, 11 Aug 2026 17:06:21 +0000 (UTC)
Received: from ausswws06.ad.cirrus.com (ausswws06.ad.cirrus.com [141.131.145.33])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C4F1082025A;
	Tue, 11 Aug 2026 17:06:19 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Introduces MDSYNC support for CS35L45
Date: Tue, 11 Aug 2026 17:06:04 +0000
Message-ID: <cover.1785855013.git.rriveram@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785855013.git.rriveram@opensource.cirrus.com>
References: <cover.1785855013.git.rriveram@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|DS7PR19MB4454:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b66a3000-ec89-4fc2-3343-08def7cadefd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700016|23010399003|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	1fGDNmVqSxQHNdX4DCrR8s2OB2U8A451qPurvtchfV5pRp5Ew+Mv6PwA5LrdSA5jY6Q3Y3AiquEZZNUbcLefOrviqswcpo6DgI6OXxqsNS/2o+IM4VpCj/kaq9G+OAOENONb6++6G62DtmLkXhCxwwKF1Acoe4QEnkcoj0rw3juiY+5pD4CtUsaSe4ZaM9EuhagjYMVPDWwCfd8BVB3uZ/nw9mugTzUbiN7wOGhJdy2NxGMnsKGq/kJjKaZJk96OXXsUMpR3e5cjdIpsrGcOPqhj5CuoxiMaSe6neq0bMuRgOlXEa4dnrbsiuTQwFgm7CxFmW1+aFoPew8ILD7vY2MIATTWFrDE6wGiXEyEzK0C02eyNy6GWB/V5fxAFipskAw8wXQGS2GHNUrPy9Kpcw1vFYJHdJj4ur9TbA8gSECQGslyFxaUm3Oqpv87mIWVNZrmFVVtzd1HPbB9VCTw7y1tv4MpVvaA34wsBCTQCIfFNtC4CsT6fTiZpBN25o9BQTIx8vbzRs/DSga3gvGTGFCHz1TGxUIz/Bcm4XZxfWBn8LzWE9LyYlLuDUgsjhQPHdL0rtbI7YxIcw6jLnkBiPdgIC3KeawsH7ki5/VPB3tvATarKFKQmQTl+c/qkMh1/6BUG5Sf2E8bkMJoxzarbCuDsDOjBWdq/vYV3AGwGO9fVdm0sQMu98HwP/aHSipJYQST2YxmgnBMkWjMiky43Nw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700016)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FojqgyG+xmEfQuQWOVyv97pqRMZK733J+mpa8gP5wMGOuXwTdkElo6MAM4QCqS4oBlp07YqVTIiTcWWxpgzpUyqIXk5syst7YpI3kA0icltLiD7rOhJ6uToSg8X31iXz9LDqn07ppMw/UfPHo1Nqt/mLqKb4y1zOuX/U1Ce3X72YpqIW9kj4kr0STQYXBFjP3mbtSJUPwEX3YGGhlRRRlUvKsSMQkqs0mQVrJ8giWrl0xdq4dXgjQWwLmTNwlQF99bDj6ApyOWblbclsY6AapyBcK/y3sZRQTFuqeXSzAUBTrXLFF8nwjCiXIRN25CGVHprJhkU/UbrYJdKxUfwSO8BKt197TgqMr5itDnIIJjWC3KuOZVvK5v0GkEPUokHvpRcPmqAchOwK0oVd82Xh0PjuTv3htWuFOEHDdVD47tK8iVDwsdiWohLUk2DwUUF5
X-Exchange-RoutingPolicyChecked:
	rAXaRMMQXWjrEZpNEt8/vP7mhNxbO2eatEECqZUaypG9K6lWCewbDY0acBusKtriX97lV9Q47sazZIkPV/wL9xOg4yqiEw3HDDEZ0U9mmZhI4ReOrdVGx+fXLLn3fgcdtWI4y0iZP2jqqT/09Kto0ZGrUXOfakLOyFq5KqlR34kELiyisX06BiUV5RFplFhY1nmk2R/wRHoOcNfXZMvRoO/18cAUb9rj2n9AuXxmzvhonPJRqpfkZmYrKicCuvi+aUS5UAweZiLtABYAfAylNBjrc+C4+Ma4Xvm5QTMzL0EZp3+9qjnVq91crA/+Q6kpmtexvStDRd9nwzjx0rSPQQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 17:06:22.6883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b66a3000-ec89-4fc2-3343-08def7cadefd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4454
X-Proofpoint-GUID: kOkEe_0DOoKNjTVf5oUgRqthAzjMsqvU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE0MiBTYWx0ZWRfXyqKo6Nwkj6vI
 9XGDN28EUNDl9SyOCovcArKNiynUmSwn8o4DpAzjA7yCuRgtRJJCwS7AqEn/BXvCLDtK84ZQQO0
 Q4Sdb6WYFkf80v4QsEQuiWab0tNZwSc=
X-Authority-Analysis: v=2.4 cv=KaLidwYD c=1 sm=1 tr=0 ts=6a7b5694 cx=c_pps
 a=9Q/W1ZN2ukzrHtYINbwowQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=k1UMki-nPKgj7J1UT5cA:9
X-Proofpoint-ORIG-GUID: kOkEe_0DOoKNjTVf5oUgRqthAzjMsqvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE0MiBTYWx0ZWRfX+cliNRafnLQi
 Gu78YQ29OWpZnDUu2FZrh+21OXos8LOsZsQWZeZr7eehqPZCnv9QLhsjjZe2tS+b2RacSmFXsDF
 aHpMRGmk7kZISWLCWZjIYN/OhVMsu75g+xgeckCzJcYplf+5PcbSJrk8YPXO1DMQd+ysBGUu9rj
 wAhTzuhTfN6wZDsRBUpGQNqVotFrzsztAI45dpEDsrmdAONblcvcUx8wJWHK8hizrg/tapLN0Ah
 3MHPPqjSdhC/gEC7hhUApMXXZFiVUcM35V8s0JqE+dwJfLg1SNTBSu1OXpaLPhY7SPGWSjNxWX9
 kBxr16YbowWRSx4w4k7sQqdAXIDjLoUUk9BsYcrP3IbPn5Y/ZIaLhR3OM4i4tlLAO6dB+cEWY5p
 AtDdZ5bffMrEF1Ptjvtlzi4CqzG9b6HYLM8wafErGfqFboQBUYGrY4BY2bcmIe0dMMG/Q446O+P
 s0zyP1OLzrnFeukYlXQ==
X-Proofpoint-Spam-Reason: safe

The CS35L45 has SYNC pin that can be used as a multi
device synchronization (MDSYNC) bus. This pin can send
various message types between Cirrus devices.

This patch series adds support for long and short DSP
messages between CS35L45 devices. 

Each device on the SYNC bus must have a unique transmitter
identifier per message type as the bus arbitrates message
priority via this identifier. These identifiers are set by
the introduced devicetree properties. The priority 
assignment is intended to be a static system integration
decision.

The relevant receiver controls are introduced as mixer
controls so they are exposed at runtime to be configured
for the appropriate use cases.

Ricardo Rivera-Matos (2):
  ASoC: dt-bindings: cs35l45: Adds SYNC properties
  ASoC: cs35l45: Adds support for SYNC bus

 .../bindings/sound/cirrus,cs35l45.yaml        | 27 +++++++
 sound/soc/codecs/cs35l45-tables.c             |  4 +
 sound/soc/codecs/cs35l45.c                    | 77 ++++++++++++++++++-
 sound/soc/codecs/cs35l45.h                    | 23 ++++++
 4 files changed, 130 insertions(+), 1 deletion(-)

-- 
2.43.0

