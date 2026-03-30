Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012025.outbound.protection.outlook.com [40.107.200.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3628839F185;
	Mon, 30 Mar 2026 07:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774855563; cv=fail; b=a6TxIab9OZw8oFGzk4Yin330sRmrR/IkllQYQJE1Dw7G7C8fkDcz0J1InQrf25YNuZus1jKi2TCMm70HnZThlyhNJ8dLkIMqhMW4puL4nzYZakhR1XuUvoPt+tSt87XURXW34rE5zLjT6Zx/d1vSj4LHARtAaUVc9H603nhYFFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774855563; c=relaxed/simple;
	bh=syiJK0HEofgGNnN0C+4pIw0X0VHQOu9rY6Mo0nz4a8M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Lghokq/RcVcoLOKF0v9ACY06WZLfF1kqheDJbKkxEyzEfVlCQ2jF51vImLIPNVcv5dttVUqkCiFTxO5MKNg9tUR7bc4xDmb4gN3Zrz57PldE+q1eSWKSxomGVXB6yVpxSb0uPdB6HGdaDXYhWIhqbC544MNxGKwh29g+OX/L1TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZPYkJLwQ; arc=fail smtp.client-ip=40.107.200.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZPYkJLwQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcJoNplbOZzTjGK/hKInDZYmGe3Xthcrf812GBdkuIVdQenEMKrtXLRITVufplpEuqJUykK760kmqVfv0Zxbe/MDh/Wb2rbFxYc/gpv+L7qhwJEwGWFrjiacjPInWpFqRoX4omrxSoROOU01+iNWF5s0gBjZEVX1KQrm8XGomW4MSQ+58NGin9OHEknxUJEtkz2HJBMq1hFlJ/W3kIUyuNNtYeJfzC23n4BGER9Wo4/Swfm/6q9yx28cjBCLjlcRADY1F50nmsF+yN/r8Kcb+vVNE/l/1CgVzM8LFYaWGsIhrosl9sbOKmXf4Vdun3ppTejCz5KLjZCVvhhGTvInJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0ZJglVz9cl4lBa+zBT1Ts7VhSl6XaJ8BTik2duMK+g=;
 b=aAD/vY0bsHEQW03xeC2HGzsmnUvvO5c4glbMK+jQjyfl1rFp/phfZgV8Ko5M9HMtTkORRkb+ZM7brHDDvU1TmRmZ4moWgAe44yaHVOL0gqBpCuvsobiQHagXk2g/rLpFDfIg6pkypH+jJOzAF72vuDiAUMkUmgd9dGEICdcXyL2QGlQD6zEFDopQqaGUrgY+J+oA/ofazlXQmitm3KgQUa6b5mW9KUfGLIbx+oD014yzkl+QR93XSJIYdEJ8T1y1w/ayZlLMw+M5UIWrvFsz5MCauIxPWun9f3uMkHDK8t2W8Czls+ZziM64qKtAk1HRm+yxPwOHzsBd9QGYyoENow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0ZJglVz9cl4lBa+zBT1Ts7VhSl6XaJ8BTik2duMK+g=;
 b=ZPYkJLwQtVOOnLrdOdgIjDrFkGn51sG83B+Z1bo31vNJ8VrOUSZnjqqDaDdUqqmc3QjGlO/LHVw96KanNOn50mSM5ioCdfoompqeGngAIIWkUiR90IIAJASQms8b9V5dU2kWlwB+jcbjZpKzVA2LlUmK5ZQX6yIkaJPaR9gE5AU=
Received: from BLAPR05CA0029.namprd05.prod.outlook.com (2603:10b6:208:335::10)
 by LVXPR12MB999197.namprd12.prod.outlook.com (2603:10b6:408:3dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 07:24:46 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:335:cafe::b5) by BLAPR05CA0029.outlook.office365.com
 (2603:10b6:208:335::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 07:24:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 07:24:45 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 02:24:42 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<superm1@kernel.org>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 0/2] ASoC: amd: acp: update dmic_num logic for acp pdm dmic
Date: Mon, 30 Mar 2026 12:50:26 +0530
Message-ID: <20260330072431.3512358-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|LVXPR12MB999197:EE_
X-MS-Office365-Filtering-Correlation-Id: 2245176d-d4b1-4b69-edea-08de8e2d6b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uAXcXU7lV5PtQnQh18EiChkbcEjrBm71insUVDXpU86+aMhUYMrQ0H2O+Bqcq7T/tsVnvrduJZz2lntJ7q6DRqPeoIYp+M5A8yuroQ5j5PGQuu/r37HPicPD/WrdgDPwJ4TwYpLT2vAj7aRlaY3JiuzWh6EO2VBaYtnUwD0SBmBe0RSI5QBhRSI5Sq9jSJeB/oz6DrPlGu7Cjt+ry0i1706nKv3sQPQipa5UIFZmrgLq9/d9LAKl1Y18YZ9QI9sAehOwj/yH65maDHrW8J+XbN4+1pEL1t8gyCj2JeJX6FFlJRu0Q60d6WqfdS2Mx1uqbiwQFwV6YTjTlpBcooo+toOzCt+ZRl0jPnSTrql48ennCuqBN+w5NwXQAfkLl6hncPsXqzaX+jX4a+jrGa9nAXWmJTeidnn8wHtkHQI6c/P4ioLmGbmRmc4hqL9rRM3Izei6JnkKTvwlHTEHUuQo3LoekV5xayhcZMSFLGDgythmcB8e9aKMotKvEYQuV4uIoYD8MTwZLh8DSo6A1GoEXalT2E+9gjrWMAAoJ5mX0SyibWrRb4SPCf9DuLASpaYdLmqkd+EUGM7a+hJRwlxRm6H2doDMiye/uSZqrSby7yYwvTJoxgi2SGSyXyKetQlOBDYbBthjTsyOuht2fr1VvMjztgRqu+aw5bzIGqDO/i4Fnmy82nD3/B0QHnB+/k2pyS+sGwibUftJw2GhblAPyNGJCqGznXoT9feUAx/cXtRgn+gk1cE8ujp8t8dZwl783H5FowWXdS/Yad6RuF0dBA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YRyqiMZawgmUrtmWlDVF4Ym/iaWX0qbq4V7p9XED/QimA8vKg7/lUFwm5fqu8ZmZ346lXGtlCoXEiDbUg8oWvObQxeEI68ZJ/mdOmN73YYodQx5WLwozriP+z86WNwVFtiWqfMQytzUL7qRgzutmcWe2LF4qDEtgDWn+jwyDGS9FVwnlIBrSL5z1liaxVi39WFVPFYMypS2opMWVhcdU/Hp0nfl71j81h88DRcEiQeO9soItolL1PWpHc1bMKsIyMyeuiKM3WqADRxuheZvKGKVwbQhWljU/tQwwofwS8t/0oSASNFYDoEpb+EvLUVEYMr+n8QqvHnUvyFSQqY9oTjZz6MwNlypNV9gm35MRvcVLusrkPbKK99CTNzCH1GCXlEBqec/tEKLlfwtcMJvvk2jj8CpIzM75SkkJm7ybxZ3pcIt9e6mgjT34wyhOXNvA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 07:24:45.9063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2245176d-d4b1-4b69-edea-08de8e2d6b62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR12MB999197

This patch series updates the dmic_num logic for acp pdm dmic and
renames the dmic component name in acp soundwire legacy machine driver.

Vijendar Mukunda (2):
  ASoC: amd: acp: update dmic_num logic for acp pdm dmic
  ASoC: amd: acp-sdw-legacy: rename the dmic component name

 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.48.1

