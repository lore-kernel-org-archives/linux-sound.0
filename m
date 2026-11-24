Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510335;
	b=HHPZfVoci4TJ7SqD2piMLuy7NJquiYk6HMCAePYYPg5Tq8tIxOIfjy+fT614qmg6Pcyn
	 zUPzFyDP/V34rt71kOWNaN7Vs1ERwRMvFO6bN1Ibjfl9KLX7Kq+/deStJPwL/DmWFjwd3
	 hMwNOY7+xhSyvbVjOsMQIFeapRtjMgErpxz9nkE/Dz/kzWRkUvTRQ0I01+d9PZlSOUF/t
	 d9pGnyD5Fd6tv8xWfeG4HVUQct97DPd645y2vaUczkZJRkcVY8NIluDpdYT4K5qLvQKmU
	 98zT+eABvCkx2pX1294Bc4LDrcDAY8GSUe1qMdGeJSXsr1mMXzrij2+cldXtmgn9/5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510335;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	b=vQC8WzdNgBb2imIG1cQI1IaPJvIaY0TqWSdGW88aK6x2euf1k1NBnFSzOdVDE+NVC5CU
	 cZlteEb4ASEx53dAxfTsrI9pvVCdn4eoDzBVnekni8tTutW23sWBOfP0T4MIyIg3f8kQD
	 zrtKMYSJSF+VBAgXx7hUIHyPx3xOVZqVUNkynvvwTqSTBVtzDBtKNTQlDx7nAVwsrRuAO
	 FSgQ1JoAvzZZaZUA/YuN4kC/43k6DbUOsMLS83sYGFvQGfbXXOMu4KRlKc07bsj/X8MrR
	 af9ex9+ZkQJ5vN4F1ndNeGxAnRykVTIHibJpbQeXHQVA5HVnaOhVW0HTbCZtRN1MnVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cz2KTYxV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.31
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82771606A322;
	Tue, 24 Nov 2026 08:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82771606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cz2KTYxV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozkmMDjJG68O40GZlywk2uP6eznV7G/i3+xmsmFU+M+bRiksJ6pLgkmRp4o4KwV8b0PZjd+SmfsOM2NRb5dv6nAUAv5SvVfQplIOVqKcvyEbS02HPwOQSnbtI3+IppJK15qOs7daN25bz5yXF5UvEIqqJAEzJZCZAcxIeN7BqSFQNU4dSxq8VCho5wtDaVOw9fcTfAlIK33cE3mxdg8IpUNAuzTwXbxZqKxYZJFNZLqCHQsiSziUYaXdGP0ufOHQLxFV4FqoyR6KEjP/PSaql+/JWp+FvPjTdwN0VuWEyCBeHCHV8kfv4+Sf5gFk0BSaDrWF2ZGGrHgyRSyqBCLG4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DxTiUk+r404xJF2B2eH9YyqPjPNXh4DuaCT0vkzGhk=;
 b=Jlha+4h60zys2nIzZKyBXz9KKCT/MH4r1iFz18T6ftNjJAWjmvxazejyCuBIGrnqu47/MQJAGRwMI2hY0whCXRub1LBDIIzoLMJaV1Ha8Er6e9qbf92fK6dB+HGCUrWWa0NPEpP81WCKxRdY1HrG/ngCXi0fuNp7P9/1ORKipSAresXchvO2itZBYhRu/ZaH4L56qymgMX8LRB4pKfoFDQucz2LD32co39mMngeJAdInpQCI7YdqEaw/nFEr96dblCLRNlxd2i1L7lWc//qhsyFQt6HBCtXyAzyqfrzE90KYZubpfOzyY6qu8YSnubUGWZ8D0dPnsiT5GVTmCOpa6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DxTiUk+r404xJF2B2eH9YyqPjPNXh4DuaCT0vkzGhk=;
 b=cz2KTYxVbd/zcoLxwlQKg1z7QxfStkymUY/8YprmuiJocBTVK1DvEI84TtX+fXZGjml/I0dlMYk7yLOemsNXgtlFyPDL5XQKogni8+6kjN5QnfGKbxdrmDCPYUMBSse1OrV7Vx/ISvw5GDq7rZmC5Z7RXqASC6WyoqlgLzpV7ns=
Received: from SJ0PR13CA0016.namprd13.prod.outlook.com (2603:10b6:a03:2c0::21)
 by DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 08:52:06 +0000
Received: from CO1PEPF00018862.namprd02.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::6d) by SJ0PR13CA0016.outlook.office365.com
 (2603:10b6:a03:2c0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:52:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00018862.mail.protection.outlook.com (10.167.249.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:04 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:03 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:00 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 06/24] soundwire: amd: fix IRQ thread dropping STATUS_0TO7 on simultaneous wake
Date: Tue, 24 Nov 2026 14:18:12 +0530
Message-ID: <20261124085033.682755-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
References: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00018862:EE_|DS4PR12MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d61fbc-fc92-4b57-200f-08df4a0836a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|22082099003|18002099003|56012099006|11063799006|261102123227099003|261028144727099003|261021123027099003|261009223027099003|261021121427099003|261022105027099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	6uHzXbgJ2iROiwHbdsbWSRT1fmAjXxQ5EYPTaqVNCUNIh7R487Qj9v/fDSMU3r605dxK58YkcChPivcXx0koscWkD+FQUCUvYPneGppdMV1rCu6kwcFM7HtuYT4YzPFSFCQaReO8h1SXA/3RSlRggDylD5zXFnqcrFpsh1wgVQjWMH5kfHDJw5Giy8lgC7useoXhjWi9epDxAghBPAu+lpcGGAFHNL0G6cEXe/BKxNWLUBOjFuWEzX1GlzA04qUzD4U/7T4/Qy6LDgDKYB5Dp7NacQ2vJ5H4T2rrwiwNC96jvUAJTOhRTmEbEsjbEaaU+LbFAx2V8qQnHfGMyXlGAm6bZ1Ymo+OVXPMpOSJrEvN5Bzj8cpHx4+SMSNUuB92QyoTqTCIgW+/kJt3bJwll+CBrAsrXPtWTGh8wF2SIKHCncs3VNYBnIy9qT/cTvTq3E2uRSD44p44r6AbmHaZHVMOfDAPEiP4s1YB00arQexPCS33CTiZeLvTAYxpILM0ZMvmXuI8AIRaM9jRBm/5DAr7Fh+aspItm1Qing9O5IuCE+V4en8TAuJMStRUTG04kgW6NzLmb1VCU6AAF/5lYRrWnECyXgh41FB6B/8pK4lThCEhI5j1AvwqHe1ROkwBRwswDMxChys76uWQngtnV1hUv9+03vrIimuAlLteqGOWGPlylimd5lfXeN9ZUHzVS09z7qVRiaFqgu3hwpL0qsQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261021123027099003)(261009223027099003)(261021121427099003)(261022105027099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Dg1qiOky5V87XSH2KPRtL2uTt8cr+ZfyKuZLX15O4MITsPkqYT0/Md9inzjUDRw+2/L6YcrM4q2u7Bea8jewzIHSwkraubgVP6yy3wYRMY3GC6IAABhqoJ3+Tw0Z3SQdTOUzc92JMNiCJITNp6BiU81L8tDpH/YMZ7lDiLA+43FuGkBMpfg6yeIgz0METLT37VYxS9RBKtdXbsv1phlvv3izmyyKMLSSSHLTPkQjQruFJGJGwqMhZsd8Pbg8Ls30hrxX0kXHpDZWXFX7z2JwaFxiQq49iwR7BDaEGgPibwyyqcToyUCzS9PMn5PtVMvGQfTX7fwdpnqNfXHWkNlNGejFa1TJmj3po9lW3A2BULVN5qm2YFbuVOT11PSrRsVLgpeqgIc43W+oYgkRIPZ1Vex+MvY+P5bXqgtHKiEvLmqFwuJmEZKV6S79NSHLM45B
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:04.6051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d61fbc-fc92-4b57-200f-08df4a0836a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018862.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9660

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

