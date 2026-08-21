Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC83C4C8FE6;
	Fri, 21 Aug 2026 16:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328629; cv=fail; b=LRxjmYgIkbMlsyIykuSaWMdvXPI35+JXeDOffVvZzKKk5i0JKCEC7KcD16BjcgKccZ+d0B1z4gEx2nM3UBnKrMwqiq4SCXNnFHgAW5TbDNrhPn2PIS6Ul/JKZL4tHT19fQSsfxMgz5XVRnKeVlSXbyPZeu2BXBimRApSFZeWm2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328629; c=relaxed/simple;
	bh=y3IL1C9qYRmHjS1NqueFvNo36RVJeR69RphClzXMoko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oB0ejttD0bOB1czEw7ERd7mXoJt5zgucBxd7jcQZggbgVlcLCKKpdaVlIaMaBJtPaJ8V1+whASvjk3NFRHzPXXwk2IaP5SEi4rA33ubn6DMVQaRBJj71hJ2UIr3FZSQZ45zHsRTYlq3uTLU6itDOAf+aq2IHQIX6GU6VckKoljM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RcN6HZKa; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Lgdm9+BQ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RcN6HZKa";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Lgdm9+BQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCuJec4001337;
	Fri, 21 Aug 2026 11:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=UqOZECDK6UzoDA4Qs3WG9Ejhpk/T+IVfmPYPaQzzEs4=; b=
	RcN6HZKaiaav+mq5fLJA8aJhnz7lIQZ5kJ7SFu7ZPlAEqwgeu53G7I5yNH1/70Sn
	g1SAaWuR2XD2gIsB4WIu69e+YaDwXa7NAqRwpnw7L0p58rDQRcxsGmGBWcVaHOZj
	YsOvZhfMQAq5WnPZf2faD/2wOMUCvwVQKXFN7bI7ZBuiKih8z0BOpY18sVikUaSJ
	Gw3MGAXDOSwLup87GwKA2TItnz0tWIla4EAgvwK8v5F9H7ocZEokBuVmIh6HlfJw
	zX3R+W4kuOvOsFTd8xm5/y94F2ec3UzlGE9k6erfaEvulX8ZqxOFott21TQJPZSz
	1hqs+vu+qvmluEdlNRCT5w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022122.outbound.protection.outlook.com [40.107.209.122])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4g4ydaw4t8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 11:10:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIq54hGJFCTRDojMQcnZVBpiEdjvG4HDopPg4JpmwM/FO/xP8foG5gh/m3iXYdg8vA/sXFRSnDDhLQ3EmCCsraeh0MnaEr9TZeyLNbj6VPZIAoH4mOe1CKgPLbcxwqxL9acTQxeqPCR87zigvHdBri5pQDtP3PRa5mxuBbKlib0JAuvA47A/IS1MVYcqovAweL8IaDSYRxaTDW4twht0lehMV3ll7LPUZc7TwYFc+h5oqxAvC0i9kBuC61eGpwStpS5h7aEWu55H0tq9D8wp4WZt4LKq5JaE4bu3fZz/Pc/W4rTdqr6Vdk1manKIae6Ko4O5+v0+C/UKOgSAvndTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqOZECDK6UzoDA4Qs3WG9Ejhpk/T+IVfmPYPaQzzEs4=;
 b=IUDhOBW+LH2mNbjljEKUniisOCa8jm98/8C58G7vCQQHYSh8AyBmmsEKcoeMiwJZEBNuzE+u7S5p02kau+XBT5Y7CgziYkR3/fYD3HNGEbEN/6+YrziFtqbHSuOh3eSGa6fImLitAd7ZA3FX7kqJre/XdHERcdX1Fm7Z07Zgq1Ti+ss/g0Lg6QhSi/Iv85KhoDmpyF07pk9y9sCXTEwGqokBeWCzpHmRXvXGGHlmvt4cZKjQy9pIVVN6AHioQR14+3kdHbAKVAIJ+2USfc36C/BwVk9kXsZgReo2T3SCgnLOMnF3FY2pIoqj3XJM4hRMNCOd5D2W4utqCBUKG4UQjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqOZECDK6UzoDA4Qs3WG9Ejhpk/T+IVfmPYPaQzzEs4=;
 b=Lgdm9+BQshhKWcnDH0dbQ3S6tj+n9tVFsoE0gLGs10KtGj9w6cUa4j6Cx5fBUyBe634b4ItWRHW5yD1UPrS97u2AvY/7PE+WOdlu7Ygs+qarUrnjHVWYtqoMEZXshlNfEPzxumlHec+EdIx2Evob7lyJ0MaC/jNkr8d7x3cjQSw=
Received: from BN9PR03CA0143.namprd03.prod.outlook.com (2603:10b6:408:fe::28)
 by PH9PR19MB967235.namprd19.prod.outlook.com (2603:10b6:510:3f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:10:15 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::5e) by BN9PR03CA0143.outlook.office365.com
 (2603:10b6:408:fe::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:10:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.0
 via Frontend Transport; Fri, 21 Aug 2026 16:10:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4C47E406541;
	Fri, 21 Aug 2026 16:10:14 +0000 (UTC)
Received: from ausswws06.ad.cirrus.com (ausswws06.ad.cirrus.com [141.131.145.33])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9394782024C;
	Fri, 21 Aug 2026 16:10:12 +0000 (UTC)
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
Subject: [PATCH v3 0/2] Introduces MDSYNC support for CS35L45
Date: Fri, 21 Aug 2026 16:09:44 +0000
Message-ID: <20260821160946.95258-3-rriveram@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821160946.95258-1-rriveram@opensource.cirrus.com>
References: <20260821160946.95258-1-rriveram@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|PH9PR19MB967235:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ed9f03b7-55ef-43c3-5516-08deff9eafd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|376014|23010399003|16102099003|22082099003|18002099003|56012099006|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	d1wnPU9Phk2KXpWjDqNGHJ5W+1gPdn97RzwhETOw5wQtbCdg1uZKZDt+Kf/YeUrRFo74NPC57dhlmjb5Z9ySUprLDvIZwSNuRRKXm+BcJVTjCkdn8P9A/JHI/8AfYSsGDR6D7Zqlxik+D33Ea0OUbkJuDTLhL6F7EgXKusgSVb46u25LFddRSPf2kFndoEf6sXXH8NTIt5gUL0TeUnPfHaVZkqm/v/V31hBUz0ASNHKbmmsmYAEkhzAmH1FxKJiXilxSQnYXDET5MhCU71sBAD2R2huO3Nbh9+vbzR6G3B3eoP8IRoDxbBBc2YbpHYkXkFpGAmCSaaFqT9GGo0ir6qKP0kLHfagWLZHOgHse9iQk5JYQASOjHTi+bzWGxB5O6X7/vMEt+z1Jf9AJ/n15Tv7Fn1cnPwskWLZcmXqNa68MrQGDH4f9Txm28bEt+8ma+eB8eDFw1HUADvCDZBrGEMW31JyWC7OuFDJLRFF/dOzI1GmHOItOpjEWsuPkizhyymG5C61K1rXF6KOLxiVqAQBbPc/+x3lWEJ+Jf9iJaglsmFG98ycitvNcoMcBnLxNsKiex5u22lhzfeNJFkO7kGkEQ+uJs0RU+Jdc7SvA5aLc/kJD/Q2OwPFWhl40JVV33JfDKuaNpyu7ZMh3BPkhxaAKS6bQTGVdPljHkkWxje/S6hdcvL+PMhd8r267PK2KhcvjxBQpiQ//icPBEbsxbw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(376014)(23010399003)(16102099003)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dEmuxHREpWquzm8gTdD8P0SWm38WnNNDoZjuyOvcd+L85cQLVhF8KVZwTHAIp8ecKSSU7xfpBhfztkGBWDlffwC00+BlZVUSjblB4NdjNxoDUzpl16ExAKeTfyK0q/w97glMo4zov4+qa22J+12rmPf6J4fA/GDib8N75lkz8KTtbllpVUXcl5BXPzIhU1y78ltdfHBh1u11egyzYE4cOILAspUpFDULI9url3vw1RS2AK1GqD7Mozm5GztIIjWyw718eZVVhrCid3v4MuFejcCM/x4CheGz0XU+qGiuS9XaAc01EtsmmThvYup2Bx3CD/Y0LPCESP8L6LJbirYG/K5nOcYgCiVs2vR46OWtp1dpFKlH1KOJ+uVOSjT/jQkbHrERja0sRwG6AoPwhedzaHQjEWS76LBVfCeVuA0GTkFwlplCboneq/t8q7OcK7L/
X-Exchange-RoutingPolicyChecked:
	MEDXJ6toJhsyXzD2ksBL1XEe5uqmQUquJ795q3sEgmeLXwAGugRzEQfu6oCdEfSgtggVgPjFuvtQcymxKxrA7ySua6Y3aS3zFPiNrk5sUCaWWm5VFEbhE+x7jk+CNqHiUaiNifHlK2mL5p+c7ANTmo5Ez/tkGEmg8Qjaz3fS0DovezWejsWVi05564AhMVdLyz3V1eEeMEEhkiQIQGkF2/YioWjA4qeVhzisOH2w3dFwWFmbeaE/jlGQZuvsWw+cJVum/n/9K/Z0wcCB8MbaLSjIL0nGNSU25sb6ndKHuadLr3wdulR4Ka+wIBgE3NvQz9c8KUiNorOlsPlDeTmFMA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:10:15.1161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9f03b7-55ef-43c3-5516-08deff9eafd8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR19MB967235
X-Proofpoint-GUID: kb4ALY0bZj6GnnF2Px4NeXYncpWeIqmB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX4iYsbMWrgBN/
 YU3MPLLse/k3/hQ8s83SsDmwo+a1OotAXxIZ83XOZGNzHrGbsaoNp1gOGO0euGd8RB2H2qGJ21q
 FFSeQFwAuQC3hlN0cIDGAjzHgDUm1Hw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXzGRrm8Vm+PqR
 pkSQ3JtjqWOTTJMt/0Fsod9Zb11EK/O/qDLeYdpqiFjS+k/xgtSyt87irYHVCyZnripKq8vswAB
 m5bv6O50SN9Fp6zTCNRbdR9ZOVia42A24TeP9jm+HG0HnxqGcu7r/yklYkISftqwe+HxS3ezgKa
 SuKcVIvrCILPh61OXTW38TZ0gSFQXRBfFWKk80qVDnURl+HJDH7+BBO5Hnk1zAb+jl7y6V0gwlb
 cQz0hm2EEB9Ld38V/BFKbd1wTTQlvAIZiBpUd9CWctt9kSC9FzwEasVL6gMjN3HiRneUpX5J1xn
 M/sGxkJouwgVS3M/qgm+bn769ItDq39Mupp4/eRidMMSPDaB4V1dlVnd85ZsCqJqxqOzxlqCGyD
 3kwkiwRf+GX2Txa5NFLhDqL3iZuoizF1PytvB5n3OV7gzvoDHLNfgo6C+UUz8t8KPWWq8jiU28A
 F8rEa6fH8RaRyIZJDZg==
X-Proofpoint-ORIG-GUID: kb4ALY0bZj6GnnF2Px4NeXYncpWeIqmB
X-Authority-Analysis: v=2.4 cv=Hb4kiCE8 c=1 sm=1 tr=0 ts=6a88786b cx=c_pps
 a=Ms9fQC66fVli3+vYcCKl2w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=k1UMki-nPKgj7J1UT5cA:9
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

Changes since v1:
 - Fixed property parsing namespace issue

Changes since v2:
 - snd_soc_kcontrol_component -> snd_kcontrol_chip
 - only register sync controls if GPIO mux selects SYNC
 - return 1 on cs35l45_sync_en_put success
 - drop | in dt property description

Ricardo Rivera-Matos (2):
  ASoC: dt-bindings: cs35l45: Adds SYNC properties
  ASoC: cs35l45: Adds support for SYNC bus

 .../bindings/sound/cirrus,cs35l45.yaml        | 27 ++++++
 sound/soc/codecs/cs35l45-tables.c             |  4 +
 sound/soc/codecs/cs35l45.c                    | 93 ++++++++++++++++++-
 sound/soc/codecs/cs35l45.h                    | 23 +++++
 4 files changed, 143 insertions(+), 4 deletions(-)


base-commit: 2792cc1b80b7674cc0751b34a964aad76630c1fa
-- 
2.43.0

