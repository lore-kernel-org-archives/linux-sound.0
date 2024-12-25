Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEDE14A619;
	Wed, 25 Dec 2024 07:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735111480; cv=fail; b=QuHmSX0mDG7aVWMPm/03epA69vJOjCHdbt/2XgN2LSzeIwbqoYmcBnw5pBnqClHt89BiXiuW0HWGshB3M3Z/Wz5ZZqp2cFltfueYOlL/uF4uQW97GCmW23NKv6GEXlHdjI8N2Z531Vc8MfvuAsxTB3Q41vPQaERah42Jbt1e8C4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735111480; c=relaxed/simple;
	bh=a3Vdvz5mlR1zQHZZ2LWdCCqlFyoeapl/wqXc2VIxCzc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AmLOq6jKhL4VaUggfMXjl4f9C2X3nJooKQVAyQ94lBQrzp0Iksucs5A+uuNxqwxFA1fi2FVdCQyKnb0SPlqnri7C533NXmwKXdFBSeRCJXtBUBUfCr6n/bnCcQZNYxyJN2elRFAHWS1xVMaY/8lGrSNuGMR+vLCBkgaGgZwNsEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=40u0FK22; arc=fail smtp.client-ip=40.107.236.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="40u0FK22"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfcNT8JiIyyzeqmxxg6uCjkD6vORkJ++TQXOZmi0brDmaLvsHxWlqug05CSI7qfN6X87bO2TvX6OczQBj7yH6AExpYlgWCKKAh9BG9O0w3v6SP09ymdxPTAqwN/rBrpqp9Hqp1WgqfluT4vhqzxuIeq6k85APDhgVX9ILGcHdnafVd4RmKupWjxAT4VO6seVGRHAZ8nR1Q0/z0xM+JWaSokvWh1KyOlo9jfG0mmtS4chq0SnusA52H4QOg5++RG2JYg9216oXBYOyNurA4GRddfNaq8pqSW75AQXVmB6r44NF7Xer7TfpwvE7LQ8YKa7z9aMeVmU4TJ98i3uVHMKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZ0hJO6mlcQw07YY5ESgm55Z66kfVeXHiPAi5NF550k=;
 b=kEz7EX0vRNK/aeRop1YaSOFVcTs6rcf7UgQc7tDpPS08fmqLN5mf0/l2q6CpSQe9adKeUqTxCseFpW1Yok8w4oUKd692ngtZQ6xtKm1RgZID6xuBhuX0eizxElFTe8NWmR97mJM0XgeN8GivTpcb+WJ6qZ0xJyAJgVxn/OKixDjlREaUgrslup2ltH7HFOb3RaoAeZFZOGdkCiiKoHpO2lao7z5rrM8r1Vo0vQo8KLJR0h9e/KxfyT7w0LciJMvCkxPT9uM59w2rtV+m1OkD2e7JudLye6GjuCeqP3mzauuPwsnlSfXyNRRZFOXC4i048DJQqBFmkeWMHX7hSpLZMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZ0hJO6mlcQw07YY5ESgm55Z66kfVeXHiPAi5NF550k=;
 b=40u0FK22e65iRX4i1/UzKlc5OZK6xcn39wYfP80fypgESrvHmgcycZQ2iGaVoU8S47lezkpoKYujVrl3HIz/RpahxKiC6J0xngxNpmoLlGShYdrVqDDBq9gIR7TlOGU6MHq9i73L6TrcF38CG4f0EpgmNtoMjayMXNXsJU5TuB4=
Received: from PH8PR07CA0046.namprd07.prod.outlook.com (2603:10b6:510:2cf::24)
 by PH7PR12MB8179.namprd12.prod.outlook.com (2603:10b6:510:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Wed, 25 Dec
 2024 07:24:27 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:510:2cf:cafe::6f) by PH8PR07CA0046.outlook.office365.com
 (2603:10b6:510:2cf::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.13 via Frontend Transport; Wed,
 25 Dec 2024 07:24:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Wed, 25 Dec 2024 07:24:26 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Dec 2024 01:24:22 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<sanyog.r.kale@intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 3/5] soundwire: amd: add support for ACP7.0 & ACP7.1 platforms
Date: Wed, 25 Dec 2024 12:53:58 +0530
Message-ID: <20241225072400.912445-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241225072400.912445-1-Vijendar.Mukunda@amd.com>
References: <20241225072400.912445-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|PH7PR12MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: 61416223-5a60-4d29-955f-08dd24b52a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pH/WhKe6Y1v7p532cnILa6koGAS9gDJ+cxpwBCwbGJ2BJm9e3nH6oEd9dB5e?=
 =?us-ascii?Q?lZDp/TRuTs/KtOOBYggYrmcEoRpuX7/z5/h96L+6+GwgKfpWrEEH3/wjTASH?=
 =?us-ascii?Q?wZUuX/z/llg5D+QQGYCkm63TpNQZYe0C5HOFOq3LASlsxKKoH3x0fo1IttlQ?=
 =?us-ascii?Q?Kl87HaF820mpK+zvzFwFshH8eDso73jjskHKc80Bpdk9Wjl0X3UII8bIA4ei?=
 =?us-ascii?Q?XZHuQ0ysLy9NXr9k+ESH467asgByyMn7qewAp8uBMA/MVpAAEkLIi+oM5F53?=
 =?us-ascii?Q?l2Z7fg9WjYdhaTziRlkWJnn//8AX9mPC2zAvYfcFKMg56/eqeVAAgA6WOdin?=
 =?us-ascii?Q?K7svDUEah5GfkSwj32m+jqZVTiq1LvfmtydmKKxmD0J+BXHLNCJku4rRjAzw?=
 =?us-ascii?Q?yFhCQkoyU2oyxo/FqqoviBsanIgAeDxk7VriKLXpUUzjJejFRIml5WbEXv8z?=
 =?us-ascii?Q?D2Ggfhcm9sJ4/9zcIuZB1O2bTustRsZseWzieXGkHJlRDCHcUihByNFYSkL3?=
 =?us-ascii?Q?pYFYdxoQeiMXuL7A7S/JZTAlx3bxFJAP1I+T4xq07xsvVx1OL72PoEl3AGDq?=
 =?us-ascii?Q?l2QLn4olz++18ZwEYvPncZmaxqKP6VhkX+fHMkGYdJF00n6hr94hSFVVMmbU?=
 =?us-ascii?Q?Arp/bczFrnheznrDcFbMDLwMkSALxy9iX5YPUEngTfXCQBy4oXm9dXhObPpl?=
 =?us-ascii?Q?lB4Xb2CUJszUW4Rp9fo/QHSyDFxxT5zHApq8DQ1o+/gcqtLAYJrVUm9H3tGm?=
 =?us-ascii?Q?9Df8/jlw9LO01SC6gOioHIP6rjpfKbCVtpslXBUdaKi+8kHhD8Iua4rS/on0?=
 =?us-ascii?Q?V24YtgIsCD/H59QqCbVEbzkfdmBPVsU1ao5UfKtWJaoQEql5Xbs+JgyROGmf?=
 =?us-ascii?Q?QhhrcgArcDx+TRn4r9s7VMeT0iI7lNQEu2pp/1rbjEE9Zzd+TH7rliRuOVFT?=
 =?us-ascii?Q?OVhn2va9093IS+jsfcgPkSA95z+C7FWI3gWWhbqY1huZ1IzSWWHhBfNOnCBr?=
 =?us-ascii?Q?1ogqrYRutw9FdiP7tFTmptjAzCBj11gAWOVIo/aZG/VqipvVlVlHYb20BL73?=
 =?us-ascii?Q?BDY6Pznfq4gfMmIDsSKpvQy2Vw2m88myyyk9G+vYp2OxbFsJxQg6O7B692Zw?=
 =?us-ascii?Q?bdR1SimSTM2DJ/lct6QTEGCtUoJ3c2hUkBkgJ0dKhwZATUHNyv+/Wl5Hcmyn?=
 =?us-ascii?Q?sOJDosIiHnxIjF6QzJZXOy/ccqgEHm3Rr/sV42dUxJ/5gsXPQ4Ddkj/B4ywl?=
 =?us-ascii?Q?+IyANcTr8jt/hfgvJEsFRcvgE6q5hNySw2OdVV4aNYaUbYm3Rk+RtFlyKllp?=
 =?us-ascii?Q?0cis060VuMtXTN9QLSYevHFj0IwrB9RrOmy5STkP//aUM1S5FJejcYu+8mR+?=
 =?us-ascii?Q?PaxtAaKFqk0B1jdkzixrXYPTbBnsckmflAVdW7pcIusIW7yOM0fFrH34k0zL?=
 =?us-ascii?Q?BNdAXG8q14d3iXx3z2hNcFYKOw+bAycyYAf2zDuuai6tx2kpKH2WrRY18m3s?=
 =?us-ascii?Q?O38CXImSe6G2cV4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 07:24:26.9178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61416223-5a60-4d29-955f-08dd24b52a1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8179

Add SoundWire support for ACP7.0 and ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 23 +++++++++++++++++++++++
 drivers/soundwire/amd_manager.h   | 18 ++++++++++++++++++
 include/linux/soundwire/sdw_amd.h |  2 ++
 3 files changed, 43 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 60be5805715e..9eb8d345b527 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -446,6 +446,10 @@ static int amd_sdw_port_params(struct sdw_bus *bus, struct sdw_port_params *p_pa
 			return -EINVAL;
 		}
 		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+		frame_fmt_reg = acp70_sdw_dp_reg[p_params->num].frame_fmt_reg;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -494,6 +498,14 @@ static int amd_sdw_transport_params(struct sdw_bus *bus,
 			return -EINVAL;
 		}
 		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+		frame_fmt_reg = acp70_sdw_dp_reg[params->port_num].frame_fmt_reg;
+		sample_int_reg = acp70_sdw_dp_reg[params->port_num].sample_int_reg;
+		hctrl_dp0_reg = acp70_sdw_dp_reg[params->port_num].hctrl_dp0_reg;
+		offset_reg = acp70_sdw_dp_reg[params->port_num].offset_reg;
+		lane_ctrl_ch_en_reg = acp70_sdw_dp_reg[params->port_num].lane_ctrl_ch_en_reg;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -549,6 +561,10 @@ static int amd_sdw_port_enable(struct sdw_bus *bus,
 			return -EINVAL;
 		}
 		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+		lane_ctrl_ch_en_reg = acp70_sdw_dp_reg[enable_ch->port_num].lane_ctrl_ch_en_reg;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -895,6 +911,7 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 		ret = amd_enable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
+
 		amd_sdw_set_frameshape(amd_manager);
 	}
 	/* Enable runtime PM */
@@ -966,6 +983,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+		amd_manager->num_dout_ports = AMD_ACP70_SDW_MAX_TX_PORTS;
+		amd_manager->num_din_ports = AMD_ACP70_SDW_MAX_RX_PORTS;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1172,6 +1194,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
+
 		return amd_deinit_sdw_manager(amd_manager);
 	}
 	return 0;
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index cc2170e4521e..30244a31c21c 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -159,8 +159,11 @@
 #define AMD_ACP63_SDW0_MAX_RX_PORTS		3
 #define AMD_ACP63_SDW1_MAX_TX_PORTS		1
 #define AMD_ACP63_SDW1_MAX_RX_PORTS		1
+#define AMD_ACP70_SDW_MAX_TX_PORTS		3
+#define AMD_ACP70_SDW_MAX_RX_PORTS		3
 #define AMD_ACP63_SDW0_MAX_DAI		6
 #define AMD_ACP63_SDW1_MAX_DAI		2
+#define AMD_ACP70_SDW_MAX_DAI		6
 #define AMD_SDW_SLAVE_0_ATTACHED	5
 #define AMD_SDW_SSP_COUNTER_VAL		3
 
@@ -244,6 +247,21 @@ static struct sdw_manager_dp_reg acp63_sdw1_dp_reg[AMD_ACP63_SDW1_MAX_DAI] =  {
 	 ACP_SW_AUDIO1_RX_OFFSET, ACP_SW_AUDIO1_RX_CHANNEL_ENABLE_DP0}
 };
 
+static struct sdw_manager_dp_reg acp70_sdw_dp_reg[AMD_ACP70_SDW_MAX_DAI] =  {
+	{ACP_SW_AUDIO0_TX_FRAME_FORMAT, ACP_SW_AUDIO0_TX_SAMPLEINTERVAL, ACP_SW_AUDIO0_TX_HCTRL_DP0,
+	 ACP_SW_AUDIO0_TX_OFFSET_DP0, ACP_SW_AUDIO0_TX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO1_TX_FRAME_FORMAT, ACP_SW_AUDIO1_TX_SAMPLEINTERVAL, ACP_SW_AUDIO1_TX_HCTRL,
+	 ACP_SW_AUDIO1_TX_OFFSET, ACP_SW_AUDIO1_TX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO2_TX_FRAME_FORMAT, ACP_SW_AUDIO2_TX_SAMPLEINTERVAL, ACP_SW_AUDIO2_TX_HCTRL,
+	 ACP_SW_AUDIO2_TX_OFFSET, ACP_SW_AUDIO2_TX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO0_RX_FRAME_FORMAT, ACP_SW_AUDIO0_RX_SAMPLEINTERVAL, ACP_SW_AUDIO0_RX_HCTRL_DP0,
+	 ACP_SW_AUDIO0_RX_OFFSET_DP0, ACP_SW_AUDIO0_RX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO1_RX_FRAME_FORMAT, ACP_SW_AUDIO1_RX_SAMPLEINTERVAL, ACP_SW_AUDIO1_RX_HCTRL,
+	 ACP_SW_AUDIO1_RX_OFFSET, ACP_SW_AUDIO1_RX_CHANNEL_ENABLE_DP0},
+	{ACP_SW_AUDIO2_RX_FRAME_FORMAT, ACP_SW_AUDIO2_RX_SAMPLEINTERVAL, ACP_SW_AUDIO2_RX_HCTRL,
+	 ACP_SW_AUDIO2_RX_OFFSET, ACP_SW_AUDIO2_RX_CHANNEL_ENABLE_DP0},
+};
+
 static u32 sdw_manager_reg_mask_array[AMD_SDW_MAX_MANAGER_COUNT] =  {
 		AMD_SDW0_EXT_INTR_MASK,
 		AMD_SDW1_EXT_INTR_MASK
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 799f8578137b..6b839987f14c 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -28,6 +28,8 @@
 #define ACP_SDW1	1
 #define AMD_SDW_MAX_MANAGER_COUNT	2
 #define ACP63_PCI_REV_ID		0x63
+#define ACP70_PCI_REV_ID		0x70
+#define ACP71_PCI_REV_ID		0x71
 
 struct acp_sdw_pdata {
 	u16 instance;
-- 
2.34.1

