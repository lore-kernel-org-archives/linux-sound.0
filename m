Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011021.outbound.protection.outlook.com [40.93.194.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1671928CF6F;
	Wed,  1 Jul 2026 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899978; cv=fail; b=lyAixwt7BjM7a41c8utPR8vIBsdjt6fj85EhpxEvUVZJFpsTeNfp1HE/VUAS/LBdqUT0Zw5t5bqrfu60I5OC2ntbc2i3xmCqHiEwI8dQ0CJiviPvjuyUqOaJH0dBM/8XMV+JbmXPZE+cEkLIPkPdQIjwRlB6wCw7DBGDgTtC55s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899978; c=relaxed/simple;
	bh=aXXU4sTyEmoJ47rL5Cl7PLAEvhAXwg+cRyTzsoMapyM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JyywM19vRspxaqv2QfootS4gNp7ioSvgH78vGI606SZiEvBgDWN/KYPgMOs9B8Y361Y3/+sVm+c39nVg82iSG9IKba97uiq71dotz57KSbNyLLbz2+xKSYgPvZfyG88KPb2giNJ5YXXvKwKbecJ5/JRukKx/AfN5IZv7gaBId0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BlTuUNVQ; arc=fail smtp.client-ip=40.93.194.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BlTuUNVQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+ljaKKSC+fvRLiFnqELHeIngoOrfnIu4ViVot/sD21NfnmIBNicQS5rmruzsb9kOPgAHCZ0mxu+POM4WKNtwKsfmx3gfqPdgubRKZWkZCF+P0Mgrdz3+NqRs7IjgiEiW7ODHr1A/a9NSnpjuOapS2vpiMUnNJfCELaOg9m1o5lyz7gBGlgp8/Y0ubH+XBaGXi1zhmS9HpC3Zmw/ZJfmIfRIRwBd2lWblzzmKb6o6Kul8QCOt8842OOLhASKFBFaS/6s4n4AOfnfHm1ePT726hCS1w1l6eZNtTronyAAN7w4+/VOYbU8OnU/4/OHjBUpY0bFNc0x1SiinEGhdG/0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqfJhD7x7rSwH1LwvM0kDtAkDyIGoxgvIQq6bhqgwUc=;
 b=QA9pZbG8mEoZvDtl/X4w+uJhHCtk69fd2sYbslbrlZ+1qjqE6i2WhcLHS2f8R+IS9Exvhb3ZT+I4Cq+GjTKC8ifxpsS9dSfCQ5VSmg8GuY/sRbk3lRBR6anSFa3Dl08/9oaFe9DdFK9a/8AQWfsWKP62jOgOOW7pyg9ETq29Rjvsl2u+MifxMLxiUt1kINWDyzNBnnMyuVUZTmqqIBp1Ox8twyIfAXqnFFnuY7HfvJwHNukg2IkdDs1OmRhAkFdNSoEskCYNBQ3Vj4JKDBlswt0dIdIx/pfpZI5LA7H18C4CPJUx9J5KiNEKcycxdnEhSXI9Vx5kP4vikfJ4NDASMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqfJhD7x7rSwH1LwvM0kDtAkDyIGoxgvIQq6bhqgwUc=;
 b=BlTuUNVQCRn+avdzUgQ8NsCxetGAGPfCVwd2A2zXPBbQeb1+fuquu17fkVzekZ4/wwK2iDdixmBwtggiGp6e10MxsLGkoJiCARdvlQ9rq4QvrqcqoStCE4lcrzBFUtQaGJQsL9L1XJUAlOHauKLL0MqE5C9u0yLI/IcjxG7CjAM=
Received: from PH8PR07CA0022.namprd07.prod.outlook.com (2603:10b6:510:2cd::21)
 by CYYPR12MB8655.namprd12.prod.outlook.com (2603:10b6:930:c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 09:59:28 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:510:2cd:cafe::86) by PH8PR07CA0022.outlook.office365.com
 (2603:10b6:510:2cd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 09:59:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 09:59:27 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 1 Jul
 2026 04:59:23 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<mario.limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 15/16] ASoC: SOF: amd: add ACP7x I2S DAI type and topology support
Date: Wed, 1 Jul 2026 15:25:16 +0530
Message-ID: <20260701095759.1012929-16-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260701095759.1012929-1-Vijendar.Mukunda@amd.com>
References: <20260701095759.1012929-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|CYYPR12MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: d8514a66-e597-4e9f-a1ff-08ded7577013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|1800799024|376014|23010399003|56012099006|11063799006|18002099003|3023799007|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	iGDO3tUQXLAg+jpv1mE+2JVN4He1FGoy/gqMiYbg0VrXtwEJdYHNH93kF2CfHDjmTaCOqbdqpvfI3d8QmcZ5cK8UHogHMKoae9XwlsPOToKcLb6ERykdTiXcWR9URGJ3G3+zC6JEsojva2vbeAkwZ5w7W8WJC3nHDIsB6Rb5aT7ciPuY2MZuiZ5GOkXPC5hEVhNnpvBotUOrHky97l9giUJeNRmyTpbEAQ29wA5ZgoNjAgZAZuAqPJ+NPQPGs4JjTNEtsheTCDADJpwhZr03C9cwcAGykZJfhmXuTeqLVA3Prcrq5TqrYpNsjNQRiAnTYGijxKzkEr5sbcft7g+7lCj50Eso6iqmjSOiSOqSsj6sDD7jqh0gv2lzf66o3p4eg24Atl0secTgA7uwPd0VfEC6NqiyiEHRzTLNFI+gpEwYCyQp4MitEo1t9VSYiRIWcpx9x8LTwf7+oY8M8OG2qspkTgeiE1KuJaaDG6nz8hE1N3auHqIu6slEDBhOfIrPMgECSBx+ltuLRZjkfO8o9YqYXgs2pbpmHD0DI7VgFP1IFh8xUpUiVK3QkxrpARyPI9OXkZAOS8YTx3B/0eyo8182b+/CxAzUkKZYZULGYlU6IHXj47AzPSvA9S9jU4vhhxFRKTopi4wRfN1Pxy2eABXPEH3ZwkxxXs+YVxQoQUsT0tVppVJGMtHrcZbPaXET9QA4eUP0fb9tftIVALYMmw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(18002099003)(3023799007)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MHc28PpKgkYPl2jvOLigYSlwPJZPflLJYDa/rsIfEua9HxQkHccn3XBFoK3yIu9Y0ySG73o7bGEA5PHvzC7Q3Q+foJoRsN0Rh/jqIab8Fjyec61o1TzC2rNRnd2frcflbTGMvcsqskyl384tXpp+XJD1Ew+i6QpRkExzmlfnXdtg5gktiGFJHniiySf8VpC0vMwo80ILblpC/61a7QtmJKZ/y8sLasCqqL2we2peJ+aEsro6uK/piCb5AWP+rQ1HjTvJsMtTmbweKoOOK5chL+Z1X8Jd1hBiXGbjJBVdEyIw5iKiECWbbJnropqQTsTHw+LRvNfQswgsQpFya5fpusPM6psOdcAXBhEqYsRR3jXmmVZnCUmzL0WqeYgD0yiqmpSL34CWJgZ/NtW6gMvX72B7WHzoP3uqJ89Dp1yHXNBAiN9vJmj7QZDSzzUNkRnG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 09:59:27.5293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8514a66-e597-4e9f-a1ff-08ded7577013
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8655

Add SOF_DAI_AMD_I2S DAI type for ACP7.B/7.F I2S/TDM interfaces.
Register the ACPTDM topology DAI name and map it to SOF_DAI_AMD_I2S;
IPC3 continues to parse ACP I2S link parameters through SOF_ACPI2S_TOKENS
(including the format token from the prior commit), not a new token
group named after ACPTDM. Add sof_link_acp_i2s_load() and the
SOF_DAI_AMD_I2S PCM dai link fixup path.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/sof/dai.h       |  2 ++
 sound/soc/sof/ipc3-pcm.c      |  6 ++++++
 sound/soc/sof/ipc3-topology.c | 32 ++++++++++++++++++++++++++++++++
 sound/soc/sof/topology.c      |  3 ++-
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 0b6a6ba6489a..e3fe492e78f5 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -91,6 +91,7 @@ enum sof_ipc_dai_type {
 	SOF_DAI_IMX_MICFIL,		/** < i.MX MICFIL PDM */
 	SOF_DAI_AMD_SDW,		/**< AMD ACP SDW */
 	SOF_DAI_INTEL_UAOL,		/**< Intel UAOL */
+	SOF_DAI_AMD_I2S,		/**< AMD ACP I2S */
 };
 
 /* general purpose DAI configuration */
@@ -122,6 +123,7 @@ struct sof_ipc_dai_config {
 		struct sof_ipc_dai_mtk_afe_params afe;
 		struct sof_ipc_dai_micfil_params micfil;
 		struct sof_ipc_dai_acp_sdw_params acp_sdw;
+		struct sof_ipc_dai_acp_params acp_i2s;
 	};
 } __packed;
 
diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index 90ef5d99f626..143bf0fe8dd9 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -421,6 +421,12 @@ static int sof_ipc3_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		dev_dbg(component->dev, "AMD_SDW channels_min: %d channels_max: %d\n",
 			channels->min, channels->max);
 		break;
+	case SOF_DAI_AMD_I2S:
+		rate->min = private->dai_config->acp_i2s.fsync_rate;
+		rate->max = private->dai_config->acp_i2s.fsync_rate;
+		channels->min = private->dai_config->acp_i2s.tdm_slots;
+		channels->max = private->dai_config->acp_i2s.tdm_slots;
+		break;
 	default:
 		dev_err(component->dev, "Invalid DAI type %d\n", private->dai_config->type);
 		break;
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 9eb8335a3c07..26d85ca9be26 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -1368,6 +1368,35 @@ static int sof_link_acp_sdw_load(struct snd_soc_component *scomp, struct snd_sof
 	return 0;
 }
 
+static int sof_link_acp_i2s_load(struct snd_soc_component *scomp, struct snd_sof_dai_link *slink,
+				 struct sof_ipc_dai_config *config, struct snd_sof_dai *dai)
+{
+	struct snd_soc_tplg_hw_config *hw_config = slink->hw_configs;
+	struct sof_dai_private_data *private = dai->private;
+	u32 size = sizeof(*config);
+	int ret;
+
+	/* handle master/slave and inverted clocks */
+	sof_dai_set_format(hw_config, config);
+
+	/* init IPC */
+	memset(&config->acp_i2s, 0, sizeof(config->acp_i2s));
+	config->hdr.size = size;
+
+	ret = sof_update_ipc_object(scomp, &config->acp_i2s, SOF_ACPI2S_TOKENS, slink->tuples,
+				    slink->num_tuples, size, slink->num_hw_configs);
+	if (ret < 0)
+		return ret;
+
+	dai->number_configs = 1;
+	dai->current_config = 0;
+	private->dai_config = kmemdup(config, size, GFP_KERNEL);
+	if (!private->dai_config)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int sof_link_afe_load(struct snd_soc_component *scomp, struct snd_sof_dai_link *slink,
 			     struct sof_ipc_dai_config *config, struct snd_sof_dai *dai)
 {
@@ -1697,6 +1726,9 @@ static int sof_ipc3_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 		case SOF_DAI_AMD_SDW:
 			ret = sof_link_acp_sdw_load(scomp, slink, config, dai);
 			break;
+		case SOF_DAI_AMD_I2S:
+			ret = sof_link_acp_i2s_load(scomp, slink, config, dai);
+			break;
 		default:
 			break;
 		}
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index f709935593ef..92a1005a4ebb 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -309,7 +309,7 @@ static const struct sof_dai_types sof_dais[] = {
 	{"ACPHS_VIRTUAL", SOF_DAI_AMD_HS_VIRTUAL},
 	{"MICFIL", SOF_DAI_IMX_MICFIL},
 	{"ACP_SDW", SOF_DAI_AMD_SDW},
-
+	{"ACPTDM", SOF_DAI_AMD_I2S},
 };
 
 static enum sof_ipc_dai_type find_dai(const char *name)
@@ -1994,6 +1994,7 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 	case SOF_DAI_AMD_HS:
 	case SOF_DAI_AMD_SP_VIRTUAL:
 	case SOF_DAI_AMD_HS_VIRTUAL:
+	case SOF_DAI_AMD_I2S:
 		token_id = SOF_ACPI2S_TOKENS;
 		num_tuples += token_list[SOF_ACPI2S_TOKENS].count;
 		break;
-- 
2.45.2

