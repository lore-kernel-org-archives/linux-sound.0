Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550F13B7B91;
	Thu, 14 May 2026 21:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778794164; cv=fail; b=a8Q2aw0s4XNErdXyZuK2FMmR1T0xdC0GSBWeVHyMG/m1Wbpw4aSJt3FWH8Ao8C+r09RL7KguxQrn+zZWjBsZj0JEc/R5QHEqyiTWZxiYmHAsr89V0/BMz6SWjZiepmdNNdAMiWJlqBwRbOHslht07HITiJVMCm+dB1Rj6PH8cKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778794164; c=relaxed/simple;
	bh=eQM9kU4luK/KGBHkAKvdd8iaUWcGG7Qh5WfEFbh04FQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j0Vi9zix7zMUkNddlQA6S1XW0YBMTsPaEPGtxOyo3nGepPTrLI79RQs5Avykh16hKVcsfMwrRRFVUmtqNPGwvx+BuYCcv8gnnFsZCkrdvn+VL9oRSvfT/AlI8d41Tv7Yb1JEoOmvJUZxOi9M/wXbsXoWB+iUwxQQV5JlYyL9XiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=P1RDvP+e; arc=fail smtp.client-ip=52.101.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="P1RDvP+e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mwe3UVqc2PoysAiVagGhUPDP7N60/s5kqd9oHMBVjGYMxcBtVq2o1oHGAPLP1BSjmiPCN8J2YUgIaV5MVrYp86ujko2aJBRron8V7qbZcRqgiDfMuAxe/tr+zKw2M/qu3ng15NM5dt+cJaMgLHitSiR/zun5MVBAYobo+O5UQbPioapJ+yynM1LVqJLxOi8zqNkU2gGcg4CzeJXYnKNNhC4ddOEsMTQTQXAHAmwkrBZubkK5rexlfhXt0HSuIVrLQccktKQ3EnIj17uVd9/yZF4KbINjiGvzIY+qz8811189cE5CSpqvMhXzPh1M0eDDwxre23mNmawyphgfK1Lc6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whSIy9P3v97SrLYIVMjqkYIdWwzaStb3eGJnumF8ibg=;
 b=oTK6fzUwKynf9/GZAb9td/7fe4H+nmMZpPy8MJYmzCZPfkEWu/9rhxgWPAqYwa+2RubNAQOlEFjIbcBGldNWxYDDaZsz/LIxWez5nupILr6NO9axp1CLo/HdLGmURAtlIJpna8EPNaLw+dQmUp6pAmZHKv9MGq1J3qN0jpR4SWz2zF2DKYNV4sL3M9EuNqLlLVJ+EM/sgf5I2L6r9GHMksosGVN9KezIVIW4sCoYC5UGs4/S9WGyNu7MaT+T8beAXj9K/yrcD+BdJLqNlSHYJA3pz4kQTX3QbgrsxzV7oXJDJy8eKsIF7QsjBGZKh8czr4l2Jj8TzvkPnIHu5IQrsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whSIy9P3v97SrLYIVMjqkYIdWwzaStb3eGJnumF8ibg=;
 b=P1RDvP+eDPw0E0HXYVoVvvkQBDygBB2qeyMVurscMYvc9q01DeIZD6SBxOO4/HnRGTYzuQXh0OzQzARKfd2fPeC3vupf/rMoExLaeCUX5VogCXnVKZ/qYcYBwd8IkgwiD50x6PYg2HYzY3VR8rih/PjcLzPbe/smiBnQvt4JNSg=
Received: from BN9PR03CA0485.namprd03.prod.outlook.com (2603:10b6:408:130::10)
 by IA4PR10MB8376.namprd10.prod.outlook.com (2603:10b6:208:55e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Thu, 14 May
 2026 21:29:17 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:130:cafe::97) by BN9PR03CA0485.outlook.office365.com
 (2603:10b6:408:130::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 21:29:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 21:29:17 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 14 May
 2026 16:29:16 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 14 May
 2026 16:29:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 14 May 2026 16:29:16 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64ELTGeB2503237;
	Thu, 14 May 2026 16:29:16 -0500
From: Sen Wang <sen@ti.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sen Wang
	<sen@ti.com>
Subject: [RFC PATCH] ASoC: simple-card-utils: support system-clock-id DT property
Date: Thu, 14 May 2026 16:28:02 -0500
Message-ID: <20260514212802.3569643-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|IA4PR10MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c134b3f-e13a-4c26-368e-08deb1ffda86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZBL3ZLfh7ppsPPXCOtmaKOYZwhPWI92SsXFSRsk7ozEOkcjt+CLMgj6pSE/ihuJhJFrtVB5eURmk38XZ1iQqEIIoPx43rNyEfAnElJ6TWnbVSXvf32CUWk5OpXz+EhUwV0qG5OZssZcDnFWoQgNJwn2kL3QD5ZmDMbdjEQxeo2I2ljvpMHnSHxj3JmpLHSep/AeVPzd+dr6RjMMwt29B1anwQHOisF1g0M5t7ilKhfLXOx+OKf0wlf8DVGqGWTZulLNFymXWBqEpw7BtGWA/wcjqxJt5FAgY2P0ENI6r2IECurFeq4c1Bmn3ZFO9kWvdyRoSvaslSUkeZwpdb490jHjESHfv+WrKpRyaCLnTi1MoSLwIREBKu6Gk3craf57uA8WCveYssBeohesPrEoaHBzypnDCbf1AydaGk6iM1m0WyzdW/muQTq4n7Qf0sA/uwMq4i8QNTjPQ1pTQwToJOa8XDM7R4l0mA5vsE6BAlfmBznH+/qKk0Y0tRQuLnru+lpn4oTJSONZFam2DXmYHOYM6/ZDphjBn0D3L+mfm5Yye/J6JhGjo+TrKvkDheH0AB2sEbgRwpKP6PPwDxsoYEsd8c3sXmHJF//FwBZ8CVc3lBfbBrHoZgPMJlBcI2wB+9lZ0jQQrzRKCQYM8RRlqc5BO4+EN9WJlDlwXnkRF2Tb+zKf9awIpCCqZJQAiWbDKe1DIUsDKGPW1QRUcQTs1+YkCBglF2J3OxMjAvWk00fE=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VcC08W0FRZ4wTep+nGuHT3TwlLRcT0CxIPXszx5WI9XxPrZ0Ly82JgozWwB+hHUtrHKkVG058GhjaGCw+FE+lI0MO1EZQdcHJSggZZAYtB8PRUh0Zqf8/PdaGnba/g+2Wb2UrYjPJKEtYK+GkjwqiNd6jJcYUJ8BXP+bSE6r8yf+26LxsgVOy2oBmfa7q9IfBH8Z/z7dm9gaIwQZcx8jcf4/50YuRAEArsWWubfHC4DQMZ0pAzTk/1Lx9rcXaGZhe2o7Yk0PiSmfsi8B9v9+2JwQavGyZ4Mw/5wL8WXMN+Npz3ZQ0SIqIhLe+9XVAqXc70XfG+UNaDtRIiqxOLet2/29OVxA3w8syC6qHeYmG5yGZyvIabcHtjyaH9yr23Rl2ElhGZvjTduWNSwq2yvU1wc3H1eN84ns7SA23UU65l+8FuXs4mTsGNn09/4DUwq4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 21:29:17.3009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c134b3f-e13a-4c26-368e-08deb1ffda86
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8376

Looking for feedbacks & on this before I draft a proper series w/
dt-binding.

The generic machine driver never had a mechanism to adjust for various
clk_ids that is tailored for individual codec & cpu peripherial driver.
simple_util_dai_init() has hardcoded 0, thus making non-default clock IDs
unreachable from DTS. Boards needing a specific clk_id have had no choice
but to write dedicated machine drivers.

This adds an optional "system-clock-id" u32 property to the cpu/codec
sub-node. When absent clk_id stays 0, preserving identical behaviour
for all existing boards.

Signed-off-by: Sen Wang <sen@ti.com>
---
 include/sound/simple_card_utils.h      | 1 +
 sound/soc/generic/simple-card-utils.c | 6 +++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index XXXXXXX..XXXXXXX 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -25,6 +25,7 @@ struct simple_util_dai {
 	const char *name;
 	unsigned int sysclk;
 	int clk_direction;
+	int clk_id;
 	int slots;
 	int slot_width;
 	unsigned int tx_slot_mask;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index XXXXXXX..XXXXXXX 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -290,6 +290,10 @@ int simple_util_parse_clk(struct device *dev,
 	if (of_property_read_bool(node, "system-clock-direction-out"))
 		simple_dai->clk_direction = SND_SOC_CLOCK_OUT;

+	if (!of_property_read_u32(node, "system-clock-id", &val))
+		simple_dai->clk_id = val;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(simple_util_parse_clk);
@@ -589,7 +593,7 @@ static int simple_init_dai(struct simple_util_priv *priv,

 	if (simple_dai->sysclk) {
-		ret = snd_soc_dai_set_sysclk(dai, 0, simple_dai->sysclk,
+		ret = snd_soc_dai_set_sysclk(dai, simple_dai->clk_id,
+					     simple_dai->sysclk,
 					     simple_dai->clk_direction);
 		if (ret && ret != -ENOTSUPP) {
 			dev_err(dai->dev, "simple-card: set_sysclk error\n");
--
2.43.0
