Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB6539B4AF;
	Fri, 14 Aug 2026 22:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786746935; cv=fail; b=aSuIMXuwpBwcvSFqy3slZcDzxMwokXEAmRGAVpgcynDh5DQN7qyKct2XcGW0jZQcimDKqEyfmB3wCVAYgNBDYf63KvGOuowkjvyXPAfFW0xHfiQ+aXYgUgrzmlNLVf9hz/iaN0/XJrijMcz56nGHTtFKnskFMrRCj9ev7hsz/Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786746935; c=relaxed/simple;
	bh=7GJmvnUSUbtbkQQRyT2k8p66FfdJ2bP+jkLXpn1JlEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oS/klDUQscf16bYm9QMpXryyNXM4Kx1IkTwYjdJg8Ao/uxLZRV4PLR7mxJ26APbZTgOUoJ14vLYGiwYerTV+r8qyeVi9VpMANk/FnRssot3lfK5avZvqrm0SRrZ9oW7a+18VDcRRDon4aTWhZ1imfPzO3zTzb6zbd+k3L6qHCPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AnhiwEEZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=it+a7zt7; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AnhiwEEZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="it+a7zt7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EKVGJb1989044;
	Fri, 14 Aug 2026 17:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=67gzB8lS1N6APSfmikM6W8Ig59pE89+1aLAYt1/wJqk=; b=
	AnhiwEEZcBJ051dPtiZoKp5qoKe65R7BXG42GL8zJi/6+DXEcW1Q2wJ/YlrwG9A6
	C/vpJ090ty9dgVglNBC7rM93WEHu+kIQJSbHna3+bPBcIVrLGUjT08yoHilY2BdQ
	QT+XjFbSt5nN6iivgNwpjluWcwRfqT1uJBlR4xmaOR1aGI+GhGCtCwiAhQQcNtgH
	3m/86LkqrGlvRc4nEMDulC/95VXEZqRTMQscY8mUO8BBIZMbWti5N/aYgjb6yj9b
	3OiY9Vqggi3PEURwh5L7ZelnFeqBlEvsM8CCotI8zTvRKYjtyf02Utcmr1fjNFWr
	vv6LQ6GZUPmhZpKfvZ0MjA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020122.outbound.protection.outlook.com [40.93.198.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g0msjvyk5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 17:35:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDbqnHW+trCIf2KJx/mAI2Ldn4DeWW9LKTO8bGdtPVHx2PuOEDNI9NgjRnxZ5tq97sWUz6bft9i5mRybakXtYC4IkIetZCcHzn+lX7Ll6LgM+jS4KE9O99P1BymOtLWz6kpS+OXm7THxaaaJ2W4JWrI6qjwVSZSpfU/nYV/P8eTc6Y9D3HXxPMi35Bf01tKreq44MQSZkQ/VY659CHqPsZn8eqtiAGxdMyKOhEG7x0A1Jw9Lbr0eJljvP1PQ26B41eo9QI09WVZZ9VqxswQ/kbCKv6dnNSYM1awhQWiS1tq5MvTWcoAVbKmzqyydtfXMUcIeqi/6rL3w7iMBfKJ4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67gzB8lS1N6APSfmikM6W8Ig59pE89+1aLAYt1/wJqk=;
 b=fPPug2wWFZX2UdN27ASd0/oFcTrcjXINGv6N+W+nhXZ70FnQNPPFpGjf+XzaBXv4BfX8gsow6zQ5prcyI+YMjDVb78stk4hl9TdYw3HgYtq2SQX5D4YGBHScBwpCXYwqNMoxbgEqlVzXVPiNtgecbQIFcSdc6P/SP+yuZc1bJjG+fpDUpJelfs7y+Ptp/vlWTQdN4aDVDF0DY44HX/8K5AKSGUAYbXmHhFK+LsGwuBstLZo1fdkZjneGezVZ1t/hq840akYNWnHKSFyYGt5q8UCVLzMPfBlY/bVr0lLolDlmeSKrwT0yGwAGREJeMhxeFsCRSQtVxl+oQgNA3M+wdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67gzB8lS1N6APSfmikM6W8Ig59pE89+1aLAYt1/wJqk=;
 b=it+a7zt7crRS+/VnAZAMdUH3odeAF2pgj9MGuh29OacSIcHJstAYi+8/ap9wnzD2e4ITzWDY3rusR4o19QIkpnogOTXOljZDkJ4y7JKkeX+3o4OszWSBBjBuundP0+YQDB7mzItmY0ZYW/719CK07f85/VAO8tbJVYfhe9n9f8M=
Received: from MN0P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::33)
 by IA0PPFB970AB2AD.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cc8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 22:35:15 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:52b:cafe::47) by MN0P223CA0030.outlook.office365.com
 (2603:10b6:208:52b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 22:35:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Fri, 14 Aug 2026 22:35:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5684C40654F;
	Fri, 14 Aug 2026 22:35:13 +0000 (UTC)
Received: from ausswws06.ad.cirrus.com (ausswws06.ad.cirrus.com [141.131.145.33])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 939A282024B;
	Fri, 14 Aug 2026 22:35:11 +0000 (UTC)
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
Subject: [PATCH v2 0/2] Introduces MDSYNC support for CS35L45
Date: Fri, 14 Aug 2026 22:34:54 +0000
Message-ID: <20260814223456.611160-3-rriveram@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814223456.611160-1-rriveram@opensource.cirrus.com>
References: <20260814223456.611160-1-rriveram@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|IA0PPFB970AB2AD:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fbc9613a-0274-446f-622d-08defa544f53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|61400799027|376014|6133799003|56012099006|10067099003|11063799006|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	G6AcunmLWWxJNHNKqcCJTI8VSxazDvU67WzRAn09m6EY6FuwAGkiFEAUuxUDb+06ab+79Hb6/T8ILOiZ2fx62LyeLfcDZYP7OWJpmzCXohanmU4ZKqlkFtzMQTFbB/iHOzt5X6XkWBVXihWxw2PVEJzS1zb1U8lu0WuzchgG7EOTPABv/iDEztBAX6LnU4WU8M7LV/E/sRpvIYNu+exLh//3mKyq4v3CUA/OymNmqxZragrvF4qFVVJJlHs0hAH8UhUo+DOqOOf5Mscx+BC7Y4W4g+DtXegzadx4nmP7K0mmvF8NOszYpKpi0Q6rQhW80EOxqGdEptF54SabAaiodvHQ/GnSmFI43Rxn5J3BQ0+5jlTQnsGCVW/+64KTkrJR9sxnrHlf4w3d73F8aIlz+/iQOyMOL52YnDKk7yC1T5wpWNegF4H6guuJY1dVCBjLFUmdimRnMwg/bayZrrouGzqqEi151kSedL7ZYXDtOS4EYEPDvZ/s7EVLeIZAN9t6ozolxjQ839kcmYarDwfW5e2KujAbWOUiQE7VLqgj16bvJiJ9sONoELzjlkEizdzqfF7o0gFI2PzJl7NYaxl0ub1qr28bRnQWm8hS9s0n/4O64TjVgw5oi2ITcGJ+SfHRUKT1ozkCFarjzkDbAgcMaSBvUJjaAMKenWzTKQiRSM+2uYvr786zKFx6q8VeOQjBx6iQ2D/1nzGs0lr5W5SEHA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(61400799027)(376014)(6133799003)(56012099006)(10067099003)(11063799006)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yjh8gDf6db/eVBOt7Yi/JmuGY5/xGZb+sgrGdiHCxZqm6z0Z8+0e9wGL7WWuA+IIK7GdRZKcRIZabb1EJrCo1UEpiEU/41r6r0OuvDJCVjWgyezkEopYsa18S+rzbwW3+tLn9PdecdbORZPgzYGNgDl1MSGUqKFZfzaHQr2KsdM/KA7bssRVcjGODawy/9j9TFNjX+ASIp34op91VUTst8J2LhzEjZMB2+nCqq+wTdfB13TTQCFl4AGQvK5rSXuH8baFvmOiaEQ4qB5TCZoTqnIljZArk+G9GQTqbN5bvxBqLN0O6fQ9GrtpTGQgfRMF85qdpfm63pwWChCJh19DdERu6nX8405q7vynHd6avVVFjhu1InhY+II/DTfzc4hU7zCy1cKRobGt87aqkifzRp9/7M3C0HtiQ3qvumv4aohtN/Y/KrPihGGQ3WiBXEi1
X-Exchange-RoutingPolicyChecked:
	D2WDDiL3tSPoeASEKFhs8tAox1T+PkoBRC1DKlv1L5PGCIyy00NGAedokvFCrT3OHj/Z7FDqDHOn9/Tp/tCSR7Nw42BUso5xfP6WrEwmo4i8VMMqwvqMz7gHhe0yTCHfEobZg0Yitqk7/xi/Geo0dt/1+m/uWI0N817VtiyUUpAUfa467V8PO5w6A0KL/ThoWEP8iGRscKUxkbHWzxfqJ8u9nA7oUyoZt4feDqFO4ETVprWy7cMFtwBNNpvX85gZlX1WrTE80d38hvtGd3a4iCIiVdM453Z3oxC9J/Y5PJgEH9Aq69OCrcmjM5sd4+YwtjXWIEqDqjwbYtpCtLFPZw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 22:35:14.6186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc9613a-0274-446f-622d-08defa544f53
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFB970AB2AD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE3MyBTYWx0ZWRfX8HLmuQmHyate
 9GA1MlgHRQyzlcvc+f/p6Ji7sXrYpQ/mY7uU0GpjyG4nGPBGyep1ii4QD8Qu5w0CbHkIciMlOfs
 Rmxdqq6rwK7nds5rAcnmHER+1R6eQUO1SCYujj6IvVZE8x1Kv+irtaAyM1uNsIJG3/XfCIN+FZx
 2hNyzbA65Ydj+u4G7ffuYFVPmt6wo670TZfok3LTrqGbB2Pt1naXI9/9mjAzMZ2CY9wE9gvMLU6
 mD69KxbemyIYNu9lL1Rv6gVTDEY43UZbFqr3r9MzWRkD93+FYfW1mNQJYKbhVd0itSl3dBIJ6VT
 98rSQ3xV2Y+nFYN/1tv5CeX2JvUG+U+sVyl/s9rSt37SGjnc5eo6QboBbZi7+nQtNQWK1nQ+Gm9
 5Nk7ASyITsu07Eu4/6/01qiDjFlLO2Au5XFI9wzQGaQRkarJ8Ei5/O2zYJUgLy3/iihtAg1bxUw
 ydrA9vL2PErP6rzowRQ==
X-Proofpoint-GUID: ArdWZx3a9ENRPamUTXG9NLai-00y7sz_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE3MyBTYWx0ZWRfX1YZByjoW+g96
 Rk/VUYKNL6C3ajKqeinnXXBfIBNy58SWSRzDEk3gGpUugtbJazvXSYH3kft1FX3nBWGqIwAXCDm
 cMR02FxNDeQpqBVVIrRaWYBBqILvBEk=
X-Authority-Analysis: v=2.4 cv=VdTH+lp9 c=1 sm=1 tr=0 ts=6a7f9826 cx=c_pps
 a=NDowVQyA5LMHuT8sjPEy7w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=k1UMki-nPKgj7J1UT5cA:9
X-Proofpoint-ORIG-GUID: ArdWZx3a9ENRPamUTXG9NLai-00y7sz_
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

Ricardo Rivera-Matos (2):
  ASoC: dt-bindings: cs35l45: Adds SYNC properties
  ASoC: cs35l45: Adds support for SYNC bus

 .../bindings/sound/cirrus,cs35l45.yaml        | 27 +++++++
 sound/soc/codecs/cs35l45-tables.c             |  4 +
 sound/soc/codecs/cs35l45.c                    | 77 ++++++++++++++++++-
 sound/soc/codecs/cs35l45.h                    | 23 ++++++
 4 files changed, 130 insertions(+), 1 deletion(-)


base-commit: 2792cc1b80b7674cc0751b34a964aad76630c1fa
-- 
2.43.0

