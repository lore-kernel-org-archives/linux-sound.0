Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B971A49362F;
	Fri, 21 Aug 2026 22:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787352109; cv=fail; b=sX7AniB2+xL8KdRBWSlPIgqwjyG48O2tVmT8lbLoPKjJ3HwvZxBzVPpiMx43Pi41xAIl3xXRM6OYl+NK5ABmynZu9PbhWgUY2I78y22894kKysahj8baXGkwt4dPsx8O3Oyel4YwPIsPGtQd5LCudZFF35U3Trnqs+FJtGCeKeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787352109; c=relaxed/simple;
	bh=VTfi3IkbJW273DjI1Yx0TdiPWS1Rth4hNoH9xXFuOKo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A3pYNfFfWTgRHzvRVCG+BzeQxoC0C8EKxGfwESDInQPn2P2NF7G5h7/PxZaE3aZVxEuKaiSMm2rottTNdfPQVgkdPuriVdfgBGtYOLe2aUHV6mpfSIPYKXGxhTkpK3TXkgvRYA4MhX1z7uOrqPhVRyVeVKFLghuGlqnMeWOQv1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YPz21row; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=i4OscI5d; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YPz21row";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="i4OscI5d"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LMRSwP747654;
	Fri, 21 Aug 2026 17:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=b2HSpwVgm3BTX2bT
	A69s02VkrIjTDCbzdY456GVx9zw=; b=YPz21rowA6PpGoJfWuffr6T/DibqIprr
	GK5UChHTPazw9dsLq70uc6r2D7b0Abwf/7tyAvLqHzHnLI/SYNHja5ncXkfO2SSA
	96dGMXocdN7hH7NJU7V+4pb/7c5wEoB2fZT1aQDsOj4gn3u1WCuZc5yhyPV0vWlZ
	xNuUEQwZ3Na07oW4pYCw/0le/6RItDaWOYxMKTvSfe3Za/49pkQ6KiIogS/n7T/G
	LQHGqb8pkIJElledvBGfRHCr4yZsTCcv4J+593bH4CPsYpOoJY1113jjGPNwENgd
	DkTEAv+4SW5XqYIxhqFDhsGwrbBOS+sNoTibD9aEeWQO/1TCSfzd8g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021076.outbound.protection.outlook.com [52.101.52.76])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4g4ydawnm3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 17:41:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcViOwRMlV3aoI4GfedJVCz+6au3OaAIuH/2L5lSoocg9s3TyncPYyJRYtLr3wS2glatHWPKJ7P7hidGGIExTScCAvmZtqmYbVMRvTtLt3mTQ6jCjwoeZxrwj/8L6QLagezouH1/YXmrpk30Ls6Nzvrly4abCdp0XKQHbcefqg9rWr65BPmOyELiBsp/KHPatv3j3NTB0lI12pSrtvxJgK4c0ZkEGYwov/6pagWB40HvkWbwjtUBXIyiLA2Cha2RvGvO7NEw2rLXwBEP9jltp8XP/sMoWqvYJ8oXW6mxLNuuiOMaAY9Z836IlbXchbCFJDlsnmM9Y+Q/FjCdCjkDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2HSpwVgm3BTX2bTA69s02VkrIjTDCbzdY456GVx9zw=;
 b=M3AZIed8twmbWLpVPNz5ZCXktiu9J+bzZdMHDAz+H0TuFn909I7lNI7ie8hA6ko1kGIcqZU/ry1c/g1OtPGfHBzUXH9BB7ZBXls4IaxR42F0jv6fpOJseWsjpdIwEOFt0u82eR9v2xGgLWzEm0sHY/2FlkFdBQ/272oRhfMAE3l8mzueGpQZdSX2PHwpEN3fvBtuc+wtzyNNBTMCwhv+otxKOj0xZCuCqg1erRsbmmfAkEfBvrQu+Dsr2SjKdAuL7/OIH5tuRkYNAqtaLfkcyZAz/XUEA629a5vWqlEn8a3zemU2HTMqogQ0ChEDD2MVEdAyi/OnfDvCOeyOPqUNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2HSpwVgm3BTX2bTA69s02VkrIjTDCbzdY456GVx9zw=;
 b=i4OscI5dAmrxo+KI5o/yK9oNEEZxntKP0/5U6t8drCAI0EERsChAr6tE9zdQjcIgPrdixf44T+c4koI9xb1Q5R6YnMqqsr5/tiovYHyREl9/+bylHUZ77cg/YCqYbIYqeh6jrUL/49cIE3oW9qxUD6cojBhQEtgWLLXTLSKoRME=
Received: from SN7PR04CA0059.namprd04.prod.outlook.com (2603:10b6:806:120::34)
 by SABPR19MB997549.namprd19.prod.outlook.com (2603:10b6:806:50b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 22:41:32 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:120:cafe::aa) by SN7PR04CA0059.outlook.office365.com
 (2603:10b6:806:120::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 22:41:32 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 22:41:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DC49A406541;
	Fri, 21 Aug 2026 22:41:29 +0000 (UTC)
Received: from [172.17.0.2] (unknown [141.131.136.144])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B8AF982254B;
	Fri, 21 Aug 2026 22:41:27 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Subject: [PATCH v4 0/2] Introduces MDSYNC support for CS35L45
Date: Fri, 21 Aug 2026 17:41:11 -0500
Message-Id: <20260821-sound-for-next-cs35l45-sync-v4-v4-0-20d3a07c3b8d@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfUiGoC/1XNQQ6CMBBA0auYWTsESlvBlfcwLuowSBNpyRQIh
 nB3G3cu3+b/HRKL5wTX0w7Cq08+hgx9PgENLrwYfZcNqlS2bFSFKS6hwz4KBt5mpFSbtzaYPoF
 w1UjKWu0uz87UFnJkEu799hvcH9m9xBHnQdj9ZStbttoWrVGmwQpF/MrixlucOOSjEBfkRZZUU
 BzhOL7EBX36uAAAAA==
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787352087; l=1838;
 i=rriveram@opensource.cirrus.com; s=20260821; h=from:subject:message-id;
 bh=VTfi3IkbJW273DjI1Yx0TdiPWS1Rth4hNoH9xXFuOKo=;
 b=kuReZ+h7m4GBGtG6ZQgG33Sw10TAqj6rAt7OCgGoQc3SlrNj8IRJ3jUTZOwHYXp2KUVouW9JG
 d8kmIsMlqKSBNUnX4v2+KGxA2uIEFtptbagO3kQQjPDOSwbWklOvKZk
X-Developer-Key: i=rriveram@opensource.cirrus.com; a=ed25519;
 pk=PWYAqW73jQepp6ORjx3V81remQilskf6ccMx0Wc1wUA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|SABPR19MB997549:EE_
X-MS-Office365-Filtering-Correlation-Id: 117e0d16-9a33-478a-191d-08deffd558d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|7416014|23010399003|36860700016|6133799003|18002099003|16102099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	O6Ijvz+rOvdNBhdziDXywZWkObdp2P3g2hffQ5s6Chj/efIy3YL3gmuYL5cNAnE/+AtUr2C904EJnkR6Jd0Wr4Tmi68HkIVOZzU9KcyWk/oMS11GE6o9NjmvoUHL7SS1XH3NFcmDGAYHpFKRCjBp5UE2V9JfaEtCmrbBLrGeLIraRBgndgp/W8WH0/7Iu7icIwockxqmJdpWIXCrgGb0nM264SpITOl8z14pi/uVeeTPl6L4CZsmBRQAdqozBoFeZ4vlpEG7R/daJTOLf9Fle1chLkQIdvPgVClfEHwVdQvaiZYYqym/lF5QzWwLxklD4yWinzTpVp/knTd5oaLddoAcviREL1vnZe9N0ze3ttakP0OJ5EuHXBLM5yxcz8bP5OXsduFBjToGOKsJEOnGhuY1bILWrU9cYmEWQGR7R6drHCwfLlEtRN3nQ6n7FrdM6efyM+T1vZhV1snht0HhZSXYjY3L6eO2MWDxeH1fWo0Mdn4JolBIQjbihxZ2Tqqg94PDL2PddlMwZS4nhuNmWEOtr9jOeqnH4oiL8ytoOW9+t/wNsrNVsV5+fLSPCvthPRI424U9W1K3s053ntHyp4g+w/eipuZ+DY3l1n46LcD/uk38sV1GV7y7YY96GwRpkKdTW6PD+El+biBvc9ScLm/JqszarGsussRdBMsmWRfJhyPPg5ZUp5GDZ0Wzi/2DJ7bkCAQM5DrJvcE4tkiojw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(7416014)(23010399003)(36860700016)(6133799003)(18002099003)(16102099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FsJkKzNL4ylFHNqpGkrN8pNmzYRAZr0Aqt1yRWJD+RgkANsUfCS/zhdEGtKLZCUiNwVgO563rjVOmBDMG3AEttQLmsN6nMfupz0y0mm+vchF8yzzJMgbVOfnvSJQyMn0TNh2KfMjx46d3va3s638pVWh/57876rY35J+2ReuGPetdHsuu+q50L2vGKGaHWqVRhbBO92oJB6ZJ+iFCPsQA6RHu+evA0WjF2ImJFXsCK+G+WJU0UhdL3BR3MYEtGuYWOhu3ZuPZkH0Df8rcPLxz0aM9K8xeYNoWZjgPvF6YVtYh2yfpkwzO88gzs5JgpbnQpvUOMAWeEg+AQQ168AuWfEg3NcG5DKElGJCuvo4jcCGhBaeYgwgN9JtlhsNg7wAw3e8q1F06/xmuDZ2wM5RUM33tiE7gNIDhVA0QyALXPxcpYuuXAudazvy5ZBWmjaT
X-Exchange-RoutingPolicyChecked:
	iizKyzWg6QoxdOu2Zp4iuV/+Gv0Z1JM5/IKpsdThx0Y1KnTUeUUlZx2LZBDpwLUr2pGSydjRhjT5MB5tnkHbIFsqrKkckPUrwZdtHl18ccLe4DpxGUdldX/1rV0YTbC60yzAwhP0U+Frw0OrgeUnopkcxD5GIo6Ai897Ft8Jtrv8K3FTovOAjxu2PB71MXTrzx6yFkaXcDonpYnaQLj2tv42mTYqfx4eEfpRD9yd9aUxPsrcWB+IPtIkmDvVE+EDzk0J8bmyAhTg8dZcWcrAo2cT6ewyK5eUAUFp1NyRMkfJjHYlZKry2gADmvmN2K7N/YWL7Wm86DT/fxFCrCySyw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 22:41:31.4147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 117e0d16-9a33-478a-191d-08deffd558d8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR19MB997549
X-Proofpoint-GUID: uWBja8KEctAuinhSAqy3-QCua9Zhp9Oa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDE4MiBTYWx0ZWRfX7O6zX3ZJQFqI
 Ic6RsZDC+TESHmOrwoBt+zQC1CE54E5Agj2WLxO33s8Xh0sSWth4+eUZWU72FfCnO/pJISap/cg
 rm9qLBTjZpf1FWLgc1FY5/e6pWNGLB0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDE4MiBTYWx0ZWRfX5Aod9ex9ALvz
 RcxZDkdEqcmIwbETM/5NZbv0/nNBJ+RL064y9kLqS0sfaEEwlHH8+C6rTUSEqz6+3jmZnhmo4fu
 b/zJ5oPOJsS5nrPz5hWvu3iQlu8JfJdcjEYQXHqQs2i8r8x3GvFbhrdSfhagMXqLcupsNvxuGol
 asRoAQCSctcOV+fjIUABtNsOqyCCXcb/BCdrml9E5cACT0xmNPPsnbZvWA4NQIHJKfW2VI0WjoD
 si6KpH170kd0Q8ZxLwSaJ3Wl58bYkjGwam7hAVet14YToSVWhpabLt9UcLTNHdu9NIuw7jzWOIA
 Xlv2RpElX/8luoDHPsc8byeLI8ySOzrnTejz9A0WDKuiLdTCCnV5jwlMRJDR4SkoQNVMvus2SBY
 RGT30BrkjX6F2UMhn6rO1Sxc9Be8gLPrLRm0NrObRB0dQZVpbjyjwF740iS5kyciIbG0GDtLKN/
 Z6U5UmduXqIhRfKmW6Q==
X-Proofpoint-ORIG-GUID: uWBja8KEctAuinhSAqy3-QCua9Zhp9Oa
X-Authority-Analysis: v=2.4 cv=Hb4kiCE8 c=1 sm=1 tr=0 ts=6a88d420 cx=c_pps
 a=iImJYxtVBKilH24NLj+lVw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=k1UMki-nPKgj7J1UT5cA:9 a=QEXdDO2ut3YA:10
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

Changes since v3:
 - return 0 when controls are unchanged
 - adds locking to cs35l45_sync_en_put
 - Enable -> Switch

Changes since v2:
 - snd_soc_kcontrol_component -> snd_kcontrol_chip
 - only register sync controls if GPIO mux selects SYNC
 - return 1 on cs35l45_sync_en_put success
 - drop | in dt property description

Changes since v1:
 - Fixed property parsing namespace issue

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
Ricardo Rivera-Matos (2):
      ASoC: dt-bindings: cs35l45: Adds SYNC properties
      ASoC: cs35l45: Adds support for SYNC bus

 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  |  27 ++++++
 sound/soc/codecs/cs35l45-tables.c                  |   4 +
 sound/soc/codecs/cs35l45.c                         | 101 ++++++++++++++++++++-
 sound/soc/codecs/cs35l45.h                         |  23 +++++
 4 files changed, 151 insertions(+), 4 deletions(-)
---
base-commit: 2792cc1b80b7674cc0751b34a964aad76630c1fa
change-id: 20260821-sound-for-next-cs35l45-sync-v4-c2664a7bd536

Best regards,
-- 
Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>

