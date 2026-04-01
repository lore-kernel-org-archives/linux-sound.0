Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0674C3630A3;
	Wed,  1 Apr 2026 02:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775011356; cv=fail; b=m0tZf0BxvosvJKr86F4qY6zfR7U1sV7unI1pI23dJg1m+Ep9sFaGKCa68CbUzcja606s59DXm6uk2E6wX02FvHi1oiyhISl1CzPpkB/z8Iq2i7mmgHhond+NUw7joil+smaX7LNSaBGMvwuKL+BbCjHmf/4eJwV9oWziz03KSM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775011356; c=relaxed/simple;
	bh=zjn8pqjz9lOAP+RD3moRlu9dd7lrbLEEvwcMtLwm8BY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B7NiWUj3P5px07bR0RLr6q9IdXKcQllYcRi/YG4Q61+8tk7Xpnsu5LQ3S0YepRdglsr4btCtbP2lOfZpuI7rLSpq0EeKZwz3kbDKikSywgEekldEhZcQ8K+htGVTedHWvHRpk2NwEYpX5NCezSD97vZdA7G7LB6Ycx1vhWN3MoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jlidRzdi; arc=fail smtp.client-ip=52.101.53.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jlidRzdi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXDIkfg94cBCua9YKr/RIn0EY9ynN8HYmadtBY9Vx3TVsXfdcNhvbGfkFOW6oE23s+8/Pn5K3+2YQpnlCUASDo+gZ6dumxgBESUDgcU0NbgoGoILMR7pHPb7aUwKKE79sa8URjrBpANgaFv9kXgE16W5iQ8A3v78IQQdfRBcsaXk5RKa9lMXMmHc7HYwYX1RYQvR6DJoVhDK6NrT2WrCS1ptLW9kknerl/2kSTq+f7WAKhDDF5xqNbzV6sFkQ3dgzUxFxXxR+MAZeJEEVmfHSggttG+5VhTxdtP5JqUblNlJ8PhJoctZoREun4jDygZ+pNwMYevm11m5BB70nqcUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1O00Uhjkinr1xeMsviQ/h5Iprcg92mjLIrRG9TkxkqQ=;
 b=IBa1WF5s1RlI/SmbMtPNi1RSMduEYHNbnHON+YzIxprDP1eVJQ0wpdiniOlhM6OAC4LvrDZ06dPqhDyBkiCjzqbulEmNi7I63j1l5KXKAj56thXI51l9NTx84A+ok07om8MNNp8ROgEqaIrnsf68yDSifPR2927lZnH9881Do8LD3WK4sgrQUxUKq281SeV11PO3PLqxNSzX34BsLuHLEkZI1lJDfaBgJDgTESyIOs0f2EqpJ5XXlL4cmSFUL0Ta2ltn84AwXZ1bzH/w4uo7LZ/hm0YD0gnQEzq0gaLbFv9za2Fff9Ck7ygYG51hKfZR9zGa34Tx6diLMzPCkD2xYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1O00Uhjkinr1xeMsviQ/h5Iprcg92mjLIrRG9TkxkqQ=;
 b=jlidRzdi+M0Y5g4wjyq6krPP3zX94hZVjDeldASWRzyz1uie01yiNQjcHE2z3l7lUjo46rZa+8xM02lC7SpYrpzWk0jCaBGmapxTcBJh1joCRJYlS/XOQqJKwptt47f/4N818gZP6Ro2ucDZJP+A0w5dYa665H39Y92zot9XuV8=
Received: from SJ0PR13CA0025.namprd13.prod.outlook.com (2603:10b6:a03:2c0::30)
 by IA1PR10MB7310.namprd10.prod.outlook.com (2603:10b6:208:3ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 02:42:17 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::d8) by SJ0PR13CA0025.outlook.office365.com
 (2603:10b6:a03:2c0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.15 via Frontend Transport; Wed,
 1 Apr 2026 02:42:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 1 Apr 2026 02:42:17 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 21:42:14 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 21:42:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 31 Mar 2026 21:42:14 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6312gE7t3899092;
	Tue, 31 Mar 2026 21:42:14 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH RFC 0/4] ASoC: Add TAS675x quad-channel Class-D amplifier driver
Date: Tue, 31 Mar 2026 21:42:05 -0500
Message-ID: <20260401024210.28542-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|IA1PR10MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a62d74-8fe3-4b5e-0200-08de8f984a13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	HjDK1wOqw2Knui+3Dh6y8SZg9aLcB0daD8JOGS3QYjDGdvcTQpIc9dYs+OoV8jiw2XcLjJEXbRnscZY4lWx1Iw5x08QlCRzt+RKIJXUWjrXO5Nq1KXPkYVW7NyddHoxn5aJiEDnY1ZPy8dHlc5o7Sq/3dY3z8OCYawB2aapeFfDM0m55v4e473BuZyGnbDZzYXuVQ93nRhqtb3wy14kVHpV6BZlroLACOlwCzw9FDCj+2J+sXM5dFyBuajkJQayDA/WgD/GSR6ta4rbnfPLwyHETtTYNl58mqhTjVBQRlSSuwrDcNGxdjgNwgIMR4zqm51S285kP1/uBFhEHcTK7b9Qwcr+bvRac+kqc1J45WDhAfeVNL5TU9kZGlYYLzTqdZsl/BzU/hqdmK+ImXGoK3XmR4DJqeCFBR0bdULRPfqv/CCzhNGY42kwF5KY6hARJJUO545a/gjsUj+D+3ch/ZkaSIylNfU5cT9H2vrZSnhGsiOxSrfYsl/lEo0UOK79Xty59WDLEh5Dcs+q0AuB0qkqTjC1nXH5gjrQw49XLDQKd0rbsi+3BzIVe43ngqyCZkioq3oQ2dQClZzyZPhBopu7kc+2zC6HAQKOAd1c+KFnyUvWKJ7+dUpG91iet11hjft7GGFPdnmcYMMk5wABqKywu8biZU6j7BChK2GB+6/iQQ3NzlUhgbHuDSepVjUpDRIG+mx1dZ7KX1RqHu/UPxJQxZe3CSMNp/+S1S1vfA23kqy1oVEjVrESPY8XqEVYtPi0ZK46GHUCfi0vdFoTjCQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xmxtxgcK4MqlcWnnH305aQzd7LAIN7iF3w5jG4DnXF40eCJPc5qPraoECHH9vA7mXtPvi+cEhd+IB6eKoQKAkAfTMVJS6AaKKICmQ0BC3LS6rIRRk3/rxCNVTAiNXYIS/9uVcNqgyGeOyJXsyPV50O2UErTNpxChc0Re8sYU6WdaGzE8vUxdEEyLI2z9qBzn6LRfI/iZkth2uNCzEui5XVZlZLK1/F05nULS60v/cz2cWB3w4cHMSl5rugDAWFBTIImZ+z202grsR2xbr4T0P+PAtmgvgvoSFdxjbJyEH1c6qzcozvNogjlMAG0GBKvUT3TgqObqpMQtoFgbeVu+ZuWyZ7PjiPS6boEwEnyOrE5W6DarVjJGzENDUYlAPwD8N69GLKryzLmO5Q2uAGFVvy9pICwk+00zln23JCfEKeHNkisAybZ+/Hlbmw79Fm7W
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 02:42:17.2418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a62d74-8fe3-4b5e-0200-08de8f984a13
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7310

This series adds support for the TI TAS675x (TAS6754, TAS67524)
quad-channel automotive Class-D amplifiers. The devices have an
integrated DSP and load diagnostics, and are controlled over I2C.

Patch 1 adds the dt-binding, patch 2 the codec driver, patch 3 the
ALSA mixer controls documentation, and patch 4 adds the MAINTAINERS
entry.

Tested on AM62D-EVM with a TAS67CD-AEC daughter card, on setups &
test procedures, refer to the Github repository.

GitHub: https://github.com/SenWang125/tas67-linux

Sen Wang (4):
  dt-bindings: sound: Add ti,tas675x
  ASoC: codecs: Add TAS675x quad-channel audio amplifier driver
  Documentation: sound: Add TAS675x codec mixer controls documentation
  MAINTAINERS: add entry for TAS675x audio amplifier

 .../devicetree/bindings/sound/ti,tas675x.yaml |  278 +++
 Documentation/sound/codecs/index.rst          |    1 +
 Documentation/sound/codecs/tas675x.rst        |  618 +++++
 MAINTAINERS                                   |    4 +
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tas675x.c                    | 2172 +++++++++++++++++
 sound/soc/codecs/tas675x.h                    |  367 +++
 8 files changed, 3454 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas675x.yaml
 create mode 100644 Documentation/sound/codecs/tas675x.rst
 create mode 100644 sound/soc/codecs/tas675x.c
 create mode 100644 sound/soc/codecs/tas675x.h

-- 
2.43.0

