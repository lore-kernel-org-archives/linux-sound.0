Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010057.outbound.protection.outlook.com [40.93.198.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA083451DA;
	Tue,  9 Jun 2026 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016137; cv=fail; b=Ltfd+K4cebgTO7D6Ecpj0DRHJ1BmBbEI+W+uEivUh2CcM6ZePAP1xct4ERv0jvfAghORqD+rOkHqd/S3AEOYbJx09GXRJYwDk2HQwcNt92bhT56oLnI2WIvYBEKdNKl6rU1O0iIh8s+NDbd26rqszugy6kSY+ZLzlb4wGrD8e0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016137; c=relaxed/simple;
	bh=QvAineENTnjAKFwXdpO+x/hAGusGm2XkLsBL02DvjJE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YOroW8ty/UNo0IDdYmcg5PDChH8irqQriWnGwodAVOADWyY3HA0AJ8xRTCBTNt8370mm5lPutlqSdLIH2D/JmpqVHUU3LRuhpfFfsRX/miM4SRMI2nVGfoJIEUCrleyv1C4f5VTnmiCX93/oklPwe/HhcxGc9y39BHjbTIcdDyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5sQH9AID; arc=fail smtp.client-ip=40.93.198.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5sQH9AID"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=US1nZOThknHO2EU7j7EWGExSGKdxIz56P5IaHF4QBCSCJRI9jMLSRoKV5EpN2UFc7Jkr2iPOzhsNfCaCi0CDn1KFL7oefmGEXNMT24FIy1jCrCtba1nHc+8IGS9MAwmPp3uMfd/7DcG8m26H9Nv8MsOMYA2ZKYR7h4iz300Iapv+J4PxuyD0K24Z8abRUxkkFuHQ8KqSyDVfb2VUuuP1UyCsGl2KYWlnK2n/0ae0bE4FxdE6VWTsDBH8ElnjKwGeUtCQpEeodUlnNVufZksfFqr4jt4D/jFuXRBK6hwiRBZyldcvq9Tg3YpoZo+mmcrvHQZUE82JeB1Qj1GZP9d6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vA6x8DZsbMISUDz+pkFZruNEtkOXpj9Fwu7YxarvQZY=;
 b=Y/02FDhZLVU9uE2cuqnIgI+JU3bFYOcvAIoV5TD29kyjI7mC6m69O0eQ4ck/OWY1mWJe5gZ0a9DMgScQLRK2vMR2Cp4JjNRaWmfAh587z0TQxmkRYaMO1aSc7sIImodFbNoVKLQa7KRRyA7JU4Fp/ykPZ2+Pjh+6bRSZfONeOFceLKlJDGQYC5sqelBQU3KYv3D21aJmyYd+8P2SsVef8M5yxkbuy5Md1Kju7LaDOPTZuBDaq7XOtNVJYpOUnMFeZPTibM9Af3nPX8L5m9GnE99rtrOUirV+7EWIwGvDD6ekOsqtcmYv1l2TAevSQ3pBoMDUhlMPJ/n02vNJAfC0JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vA6x8DZsbMISUDz+pkFZruNEtkOXpj9Fwu7YxarvQZY=;
 b=5sQH9AIDJzaj20ohLcqSoLYoJudpGXFVTP9hw2rW+yCE7l6uOCP+pnQzESHXsq4QEkstKaFOWhydqUkQ3AKzAGV8g0pAe3sIY5VbhVTSAI+Plx2U+WNlbmBabqMWRv1+BtJB48sVnPyJFSdpoaMIhGwceoX2f2DSrVBXo/2EGms=
Received: from DS7PR03CA0083.namprd03.prod.outlook.com (2603:10b6:5:3bb::28)
 by MW6PR12MB8706.namprd12.prod.outlook.com (2603:10b6:303:249::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 14:42:09 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::57) by DS7PR03CA0083.outlook.office365.com
 (2603:10b6:5:3bb::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 14:42:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 14:42:08 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 09:42:06 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41
 via Frontend Transport; Tue, 9 Jun 2026 09:42:02 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<mario.limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: SOF: amd: honor machine_check in SoundWire machine select
Date: Tue, 9 Jun 2026 20:10:00 +0530
Message-ID: <20260609144146.3311301-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|MW6PR12MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d63e24a-8b94-4935-047a-08dec635488d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	BThfu65Bk24RqTrQMfgHbKjS6wpa3NpQCsiwOeESvtgFZvaXiBxyKig4E90omtVEDeJLvMZIyaULGpMY1svxkLCHRlXLZX+5DPL76yO2iMTjJa9QCKDtwiZtpKVKzXltlNoOOfCTC4lvVudfDEXvyiRhMuwwiiCtixZ6NLndRFNXO5ukdEBkN6hykb9NeKZn5d5tFy/8YNq+Hc3WQzA/LcMNXOiwVU0Sfzx1+N1zgPLaUvjGJGBxgMGY+zCmF+rY8fYt316qamdg2bmzTmhhcLIKrKsOOPGikJAHp4DCIC1sAnau/LSUNC2yOM4FxHkWsu2Ilzx3IwNo1jhnjfjRcvp+Ap6v0KEXxQJxA/ysd8FZMyZPFWG8qqj6e/P3p36WDuBafVxI93Ee44gEh+mQNwgrlpa2+0J1GMtxEWsLamZTz7l7kn6H8Ig2DTsEr+ptqPfk8UJzXfTUhoUmiwPkAC8xIj3rktomqHXDfJtafvXHJkZICbd9BeEqDBjNHq1N9+VD7VTfQ/GlPWHlExzUP1mQ/KuNYL4VaC18u8UDpYGIzTZAZzgerULWhTXfgkdxeOYn+iVvgYETmLTfvtBJvSgxEhc8XfbhExD3fthzQ4rVw5x4kzGm7p0G6Znt2f8/+S2kLTssZr+tMgYmrZvMXGfE+JDAQZcdHRQU5st306i6l+se/wFHdUy3cstJ/k9iLr20Ieat7l+T3C0uZzL37U91k5DhPn5lCN/inAnf8mo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kwmkDH+ny3mXYTrx1RNc6bmzQ6JU5iGmWyn5UtVj3WvrcABvU1mQJca61EIlEGPu8OMbZiVQTzMevId/DYA13fYRj0g53xnpW71Ndd2zlzkRnBTnIit5ctqgmw2FufE59riI3f/BuZMZMIkTj0LUVZW8qvKHFWSXUp2cngC3mgnf6Y8YURq8hqmGh6FM+cHKosH5R0Qd/fPcLRVUEzXBzzYwllvws4v5KA9QzzGl8FZvCK1P9lxU4jiV5o7vcggJJk+mBLl9UqgkiKmqYb3oz4vpanXZaZK3ta+X21OgnAth3yYj3mCkmuFOKHSrjfxdrZRbA5KEnDPm8oldsVpzaKFV/CoYdMqYDHqgYovGif5z0Jjocuk2YBVxbzH6Uk6kOouPMxA8FxCjxxMyeHAw2b0wMUeHTdOpYQuhpZZxvm0WPjR8CV2LKrqzXH42/nWV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:42:08.5146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d63e24a-8b94-4935-047a-08dec635488d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8706

Only accept an ACPI machine table entry when machine_check is absent
or returns true, matching other AMD SoundWire machine select paths.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp-common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp-common.c b/sound/soc/sof/amd/acp-common.c
index 0c3a92f5f942..df656cdc1527 100644
--- a/sound/soc/sof/amd/acp-common.c
+++ b/sound/soc/sof/amd/acp-common.c
@@ -149,7 +149,8 @@ static struct snd_soc_acpi_mach *amd_sof_sdw_machine_select(struct snd_sof_dev *
 					break;
 			}
 			if (i == acp_data->info.count || !link->num_adr)
-				break;
+				if (!mach->machine_check || mach->machine_check(acp_data->sdw))
+					break;
 		}
 		if (mach && mach->link_mask) {
 			mach->mach_params.subsystem_rev = acp_data->pci_rev;
-- 
2.48.1

