Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919232D6E5A;
	Thu,  9 Apr 2026 22:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775772419; cv=fail; b=E05mjB5Md3MEleOdYYiGQzspAOvuyLbHoMvOqalM+/71OL4fqwi0BoJd1NZ3j4a7I4JIaIWgdDs08UfFbHylKSaOObY59ec0GYqtllB4Ly8+8dHZPE10KC4chSgPGudE1S8uKiDvoU0F9zDJSXPrn3xKRUdU92Az3E9ZOHZUHsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775772419; c=relaxed/simple;
	bh=fcQnpFw0+gSYvSuFRORaQXm7gPnQxPeb6wwR5sEkNqo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IYEfnVgbdX12eYfETfHOIsB3aqHlcevuCL+Nmx5AsjoKplEzMuQXZ9/gzKFDnHRvzUsnYflzS37bRg0gsGyJ6mdC2MRj/LYxbQJ6ICMANzT+C6d6SIAsOSKXPS9Zd/46Jc3sBzFV1P6hqSBDbs/Lvxxyxwr6WTpthM8HPgBPXwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jwfmH+6t; arc=fail smtp.client-ip=40.107.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jwfmH+6t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbtnDo34Q3B4taPxzFOAf3YqqOqRWgqYGMfdfDKrxasZ9WLLj5fdky3w31IDgOoSNryVa7JglfdHplDHLNUNOCkiDRVzfe/+KXGrSoPv/l84Re7Liq/0ncOOkWFePl+pe3c81HKiHBbgtP2ONgYf4MfXDlLt9yS9xHCjQwd/uzQwn85waEctvjjv2I7cOTl7OuhGEpTwOIgiBq7XnU+pn+Dc1ZCC3CBH22/sUo+U3skpA3V+d9/osV6CIKn3owZyGcYkz1CgZCLHvtbtt5QxEaBl5S4WSpy354O3F4sj142Xuowt2pvvvCFcu5svl5OPZCFIM62pw7NYAfBYTiUUmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO6SNLuNWbwTo4pCLxv5xiMbM44tlbXeo3Mk/SFr8tU=;
 b=ovBVy7PWvoPiN0Sc10fpMVEy2mP51Kmmz3sKzJGkCtsIntCrlixeLjQkRfn5foGsCsUB3xEX4r4e3uIumVwIJllL5Lk6Yco4ZvCoX23uAFkslXFUvIYbmYluZVsoGlPXsl1C83KJzjY+IPWBIfwzxVYy2YASnGMVvrcnmDJZCvc/DsQV7xZvQn+37Kjb4EZVpr40un2wvSjsdMnxGi5Mfauo+VTyvXJZ3w0yotA/cNMWYjlGSEI3Eub3RjS3cSiNzYxaNbF01B8QF90YkaZa6a6B3qasv48wFIvyny+HMjCI5xhKaWf4ZhRK/LGPqw5G7KtW9j5QrXXfYfzD2TZuSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO6SNLuNWbwTo4pCLxv5xiMbM44tlbXeo3Mk/SFr8tU=;
 b=jwfmH+6tyrgBTTTNJiJBIFeSNUy1hfpU3g8dhGVgtUywz0Jr9EgQDPpJHwzuAEBxGh5TM6WM1158REA73nXqrHFDfGkTFsEaQV6ZWKofZrewk1NSnkHbYP8wnGIpoMadmn4LTCPgLbC7idO8mcEfiMdL7oLTpuqTuy2NUplOYDk=
Received: from BYAPR07CA0080.namprd07.prod.outlook.com (2603:10b6:a03:12b::21)
 by SN7PR10MB6405.namprd10.prod.outlook.com (2603:10b6:806:26b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 22:06:55 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:12b:cafe::31) by BYAPR07CA0080.outlook.office365.com
 (2603:10b6:a03:12b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.38 via Frontend Transport; Thu,
 9 Apr 2026 22:06:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 9 Apr 2026 22:06:54 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 17:06:53 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 17:06:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 17:06:53 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 639M6rJN295501;
	Thu, 9 Apr 2026 17:06:53 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, <sen@ti.com>
Subject: [PATCH v5 0/4] ASoC: Add TAS67524 quad-channel Class-D amplifier driver
Date: Thu, 9 Apr 2026 17:06:02 -0500
Message-ID: <20260409220607.686146-1-sen@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|SN7PR10MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: 66be7876-00cf-4ca1-ae34-08de96844f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	RQqUs7qlNXqgouXMiuFdPh6wOdsvULGo8B/SVIX01oIej8tUPwCtj8KUEpNd/fM2DAIcLVWbe43NH3mHtf9Se0CmV5fvst1kyDEF54LUZW7wXfdNuSiulvpnFXJ5qiaDdZgIohdPwND9GDCUsTeziCAx3d3sLjluXhqFM/FE6Nl+2S3jwpi+Ks3G7RLJ6A9QMMAXcOggnY7Xi5WnsYjV7148Zn+H4MsSiu5YHcqKLByybWolbL2eSuvMd4+ojgpcGuIBHohnH91WtGujuKjGfOq175xTQZFTeZYGE6TcemLwdDy48kCkW0H+zbe6HiwxJeruEWk7oJveoPqPnp4X4fkAFyTX37GXo4XhfMwmGy7xdc2klQmNnhz+EhGp1wNKjMmmTIfXkJMjzAEygfk6F3f1mRR9bEDdCMJZq9mUFOL+OT5wSrgxhXL3Kzsw2xQ6tsr6ng3iGTMoUFLMsZOuP6JzYlFawrFcVqyYRF2jJNxu7CzzCsfk85ZPLtfwJ7MLUSu51yqEtyGsuKWEbeUTQjCnvoplO0xtQAKI0AChldVl6FJvWlecT1K0tNVcA9DbySzfy+5a6pK1oT7q8etDV2F8rLb67ORTYYD2R1qstJc+A6nHgLT/iWwtDTlIhKZ75OIom1BCBcum3RcZCdpdYnue/o5XubSRTQOKL177jSHW2N2i+Mx4vXZNlN/ULt6ZS+156ZEkNvug62Zr/Oni6miOfJRmIQm13nKb0c+BO5NwqYViKSdoYkv+yoxXWKnESUjNaPrjcsGfgsHRkuVSojc1x4xY3Ipefcg+wjkMYKs=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lQgjYaIZh6DYJhcbQjuLlCohK0qAjMHMegHGTPTi/QrMW8lFfeB9Kj6NtDMlwUqOxf6Yt7F/XI9HadfiMcRfFqP724V9EIOC+aAR/7AgFYP20pB7hV8PrsN/7lXBzSW0PQoIl9pNeJf9OcXKGn46OVWtoj80gpSYjFGkFyQ/EWL5E7kNOdJFAYoWCpDL8HmfNfcptCtzXuQfpH+xIDt4kPr32zNAvov7WtFPvxc57IMbDJQmTADcbdKvoJa0aPT1HV/sUHrTVIyV2EZ0ojscnPTViP0sB9CwrKlbmiFwk1389uuxWkdz6f8Z3jOmDO/uW+8IvH113KcWPPS8nACzZaNT9DQWyS3XMVO+rxXBsLTLsAb6rTszmwqN+GGCLlXN15E9wz3lYKSBAAysFf15csnuAT3gdGdpI8J4CBpZfkm7T9eIxn8DM70kmUg0ZqjX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 22:06:54.4353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66be7876-00cf-4ca1-ae34-08de96844f6d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6405

This series adds support for the TI TAS675x (TAS6754, TAS67524)
quad-channel automotive Class-D amplifiers. The devices have an
integrated DSP and load diagnostics, and are controlled over I2C.

Patch 1 adds the dt-binding, patch 2 the codec driver, patch 3 the
ALSA mixer controls documentation, and patch 4 adds the MAINTAINERS
entry.

Tested on AM62D-EVM with a TAS67CD-AEC daughter card. For setup &
test procedures, refer to the GitHub repository.

GitHub: https://github.com/SenWang125/tas67-linux

Changes in v5:
 - Drop ti,tas6754 device id reference (2/4)
 - Restrict RTLDG threshold max to 24bit (2/4)
 - Complete error checking for set_dcldg_trigger (2/4)
 - Add runtime PM reference in IRQ handler (2/4)
 - Links to v4: https://lore.kernel.org/all/20260408053149.1369350-1-sen@ti.com/

Changes in v4:
 - Corrected dt-binding compatibles (1/4)
 - Reverted v3's change and made tas67524.c back to tas675x.c (2/4)
 - Links to v3: https://lore.kernel.org/all/20260403050627.635591-1-sen@ti.com/

Changes in v3:
 - Renamed ALL tas675x filenames to tas67524, removed tas6754 compatible instance
 - Changed pd-gpios to powerdown-gpios, cleanup unnessary .yaml formatting (1/4)
 - Opt to use disable delayed_work and re-enable on runtime suspend/resume,
 similarly, use disable/enable IRQ on system suspend/resume. (2/4)
 - Include IRQ_NONE on ISR returns. (2/4)
 - Clarify _check_faults() function which now returns need_clear boolean (2/4)
 - Added register section (3/4)
 - Added addintional notes: for clarification (3/4)
 - Links to v2: https://lore.kernel.org/all/20260401223239.1638881-1-sen@ti.com/

Changes in v2:
 - Remove redundant DAPM event function (2/4)
 - Move IRQ request past power_on, so regs can be set in a clean state (2/4)
 - Add delayed_work at probe time to accomdate no PM configs (2/4)
 - Change .set_fmt and .dapm_routes callbacks to the same tas675x_set_fmt name (2/4)
 - Links to v1: https://lore.kernel.org/all/20260401024210.28542-1-sen@ti.com/

Sen Wang (4):
  ASoC: dt-bindings: Add ti,tas67524
  ASoC: codecs: Add TAS67524 quad-channel audio amplifier driver
  Documentation: sound: Add TAS675x codec mixer controls documentation
  MAINTAINERS: add entry for TAS67524 audio amplifier

 .../bindings/sound/ti,tas67524.yaml           |  280 +++
 Documentation/sound/codecs/index.rst          |    1 +
 Documentation/sound/codecs/tas675x.rst        |  686 ++++++
 MAINTAINERS                                   |    4 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tas675x.c                    | 2193 +++++++++++++++++
 sound/soc/codecs/tas675x.h                    |  367 +++
 8 files changed, 3544 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas67524.yaml
 create mode 100644 Documentation/sound/codecs/tas675x.rst
 create mode 100644 sound/soc/codecs/tas675x.c
 create mode 100644 sound/soc/codecs/tas675x.h

--
2.43.0

