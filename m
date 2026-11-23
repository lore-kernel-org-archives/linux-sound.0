Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453638;
	b=3G62DEj4svXKk80eIgUxal0GkGvLh3sQMe2xkY02JZfJ0c+vuVN7fNhBcAYdEB7YB4bB
	 Q+BF9zoOk1fjkcVrgNWE8+zyPfFAq2nii6YCiTX3hkBDk7h62Y34wzyq+jiXvtJTyhGhp
	 0Y9VkV6tCWH3T/JQFuZEM6sFAy8scQlIj7JsxFSLOxFjOY5Rc+ijuqs+4CKnHu5rf5blm
	 5661s/6Sq8XYyd7SpM9rZGSzHcQsdtILVcXGOo76e8nsBuZIZqtqxJev/FRGD1Abq4Jzt
	 tvPMnHsYkr5et2pd67PO5j2YOjlrg5VQ4B4KSGn88oH9KvPLkrYAfo8dCvRzUZILmdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453638;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+DxTiUk+r404xJF2B2eH9YyqPjPNXh4DuaCT0vkzGhk=;
	b=fQxgI6bBU/B0hi7knS5Gjdof0dxDd9J+SoH44hPJ2pAtCxVtwkxEYa9b+pMMoiAuNg24
	 /vrOb12FkUpZxyKUku66jNfB9HchIGneBwhQs7EgA8JqZyeS7AOhiIumieF2zFsfQYaYM
	 3LhD41758WUk89MI8NY6Gm2h1qxH/vvtOHHuSXCowMiIVMYsuzq2sfX6pgkCPG/dRDdkO
	 SUByQPvatj7UmodxWINzXULG4FNmhYM73/NTFa94zP/rn/1eEfIbktWccWOyHhWiCGitq
	 S1CDzw0g/c0oSLyDwEPP/1uzeK2ogijrBA4lZxJ+/MOHsoU/GJEoVe76llF0f5tjLZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=E0ht+1uN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.51
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010051.outbound.protection.outlook.com [52.101.46.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3406606A33C;
	Mon, 23 Nov 2026 17:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3406606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=E0ht+1uN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpTz0IQQU8Z7VdtE44HpHh8il9BsjVF2pG+Wzaz0B3kR/hg5JO+E/jQPjyBLK8GnaE5sPJec+uyBDrJW1foqGyXEY98ZrkLhlZhnbIj8jqs6aueZSBY+ElXKnLTNQncFAkoVQG3XTk3xtHl2SxCEve8nwg0TJwpTye3ZaHz9NhPaMABvizmmh66csC60lbwGG/af3neoWnfSrM805CtL5VqredJ3ONW5WnyDh/iVK02VPZMODGcy+dY87KQoip9yE2SALhZhE6vePwtHf+XwU+SDxmFmAAg+x9EjDa2IPvCrnrPYfutYQhH3yO/mu3k5yvYa7Qc4ivjaFLqi3Eg23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DxTiUk+r404xJF2B2eH9YyqPjPNXh4DuaCT0vkzGhk=;
 b=ZSUhoLEG6werT4k2RVC53QJtuM9QeZ4x0W8cGxwze2rEHUOYwdHXnhqd3dt8ZVJGP+hAqjq6Fe2N1dtMlYWheinjXQkE/ZC2cMSUvCjvcIQF8ciZuuVyY36ERZjqYmxksNXDZJHBd2t7t9bF85ETUDgoEQZJgz8qcD/7Bxfl3tfnxTnKtDryobDzLZjcgV8BFY0nYGOsDumytX1dzB1bA5BnBeNMk4Ptv0bA+dZ9+tZLMk8MmLwnlShIenlWyfOInwcynHNcaKaRF30M6NOgJyaxO3GmqHsD/xFjXfmW/zwMT7Z8YO2CN/hy9IUVclLdy7X4qYxBjZRFcnWKZFp20g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DxTiUk+r404xJF2B2eH9YyqPjPNXh4DuaCT0vkzGhk=;
 b=E0ht+1uNhCJKIzbsUk1UlJoIztpldesX61XVf5XRP8Q45tOKxxw/BjN4gXG6zy1pkMVBBeg1bQo8ZIdCVz1fYxekXmnle6VjQTUD8uTZvpq5JHUkGgd0JbSG+FnGRwNliIIYHnzYOMFHUY2lxPhNEOOYAAVotlN3CfFdoSI3DDI=
Received: from LV3P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::8)
 by LV3PR12MB9142.namprd12.prod.outlook.com (2603:10b6:408:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:07:12 +0000
Received: from BN3PEPF00022BD9.namprd03.prod.outlook.com
 (2603:10b6:408:234:cafe::2) by LV3P220CA0029.outlook.office365.com
 (2603:10b6:408:234::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:07:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD9.mail.protection.outlook.com (10.167.248.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:07:12 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:07:04 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:06:52 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:06:48 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 06/24] soundwire: amd: fix IRQ thread dropping STATUS_0TO7 on simultaneous wake
Date: Mon, 23 Nov 2026 22:27:27 +0530
Message-ID: <20261123170520.1380924-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
References: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD9:EE_|LV3PR12MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e11e22-cf46-46e8-13ba-08df4984379c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BUpYze5VtVyCQ7wrDVRTAPyibQui2YGkkt5KMiPzu/9lQdctDtBrzzsAcTdslYLFiHq8p5Q7BsscwazLsW4dtoEZGk07+s/AELO1H0SnZQlhVuAS6hVeiJGrmOEau2lZhRGvo/IgJr/1q1LCF4dsunSOjODw3v3kC2+KSwyIPqxiOub3oBZnge9kPwtXL+pb0XGX5bW+7PXeQg+h0YhifCOun1IDkILtM+CzxjR9Nsbb80rQF17djR9oSgG+lTj9bCG8IPyFeHdWX4F+cIdhRu4/s6cSuj/qjOwLKdKwZXJU2iAFyUVyUnED7jIeNkCpTCHH7KtzfYJ2F3HyaXwsYu7Dq+EqabyLLEf8vGHZufQbcodItugJYyIocaAaC+Oyax5DqfaUbrzpiJXa0VUulFc7esIEOtjk4aW8AjrgtSpPI8Pa+LVRq9r/GtoQGJgCOXOW3DiL88ALI+7Km81Ego31oipgNDXJZezMtQytQogyJMnNDnx22V9tixv8fhFWihQrQJmTRfvjsjxWZcPyg7xR1mw/cBBYkCjOGSV1X0bott1y2Sc4UoCpqr/srkU2aafzNzj4rUmH4UOGFdXnLe92QufxjVtbByZYOQJdq1DcqBY613BmzFobPh3v2ejyCHfDIldHzA7ZxCjDX565iEOnBm4eYE2GlghkXXAJTEP95VCpA+YbCPw1GRUZEnQ5q+V+LIpLoPqwUDcca4JwCA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6lvq2IX989mQKaZUdlAwfGmviM1e+6QQXC5HbuooW7MZv+4gVHHKOJibcdUtzUHoPWDpD69eRu1kpV7vCUNZNDeGhmPkQvHIsskiKYsGTqYJmUgMV7wuAXrAPIMqWkV77V1CnT5eKBAxK2XxYgyRug9dVehn66ax+/bELyRlNqgAKMRem/84F5Gfo/qJmb23C8r30jPM7bdRBcFPGydpFv7UL0FylvEYKc08HqIwRnCbYjmqo6W3V1s8kKYceSxW1luBD9ftvgM3JLKjx5ZN4iVVAOZm/z5AYEUe5JsaZ98Hoeic8WuHmXMIfI2XdI8ey2PR8qU1ui7sd+wkBnznpDS5MX1w/juBO2rMSbax39pXbGX+m76qQZA1GiSzBGTefeDtXRoJe1zQOb4pkdJC87LTMebEng7VZaJX/bCRmOyuGn4W+ALsYJDKogeSzdHQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:07:12.6951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e11e22-cf46-46e8-13ba-08df4984379c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9142

When a wake interrupt and a device-state change arrived simultaneously,
amd_sdw_irq_thread() returned early after the wake path, silently
discarding the STATUS_0TO7 bits.

Remove the early return and fall through to the normal slave-status
processing path. Clear the wake bit from the local status_change_8to11
copy before proceeding so the remaining status checks are not confused
by the wake bit.

Fixes: 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interrupt")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 3d60bea82792..65626ca590c9 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1110,8 +1110,11 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 
 	dev_dbg(amd_manager->dev, "[SDW%d] SDW INT: 0to7=0x%x, 8to11=0x%x\n",
 		amd_manager->instance, status_change_0to7, status_change_8to11);
-	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK)
-		return amd_sdw_process_wake_event(amd_manager);
+
+	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK) {
+		amd_sdw_process_wake_event(amd_manager);
+		status_change_8to11 &= ~AMD_SDW_WAKE_STAT_MASK;
+	}
 
 	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
 		amd_sdw_read_and_process_ping_status(amd_manager);
-- 
2.53.0

