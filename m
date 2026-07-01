Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012049.outbound.protection.outlook.com [40.93.195.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB657408038;
	Wed,  1 Jul 2026 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899947; cv=fail; b=DwwP4axa+CvGxMiJj+lFKQZgpOxDFVGTJD9r61VfeCU7jhfwpak5jC6T/GRu0dygmKDE0YswXz+DEH2WBdUU+ZUsYk+O5zY76FQLzKPyTNXBe6oJ5sRro2y9a5iP3AYeJ5SbbJvkAxBwVutZs1/FS+FrHtKzDpRmrHjvbfEPhvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899947; c=relaxed/simple;
	bh=Z/nhGkqoiCPlTHqXSqYYn8bkFRs89ZCVP9hQQfgK9TI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pG6uaeH7Qo0MCaYggEJda0JAhTs3b48MZLG6GgUDUn+7pM11SsHfXwRBHa8NpTr2rYuexBIEj9xh4QnkvE6seteYO0lUQFkvy5LPOQlHEoOpGWAIY8zzuq3ViqnaXEuZBHBgtBOw1odC4tLkiUoeOXAdOc6NFNJ5n0q0Gvf+kLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5h7Dso6Y; arc=fail smtp.client-ip=40.93.195.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5h7Dso6Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/VaW4x8/kQTLKhsCOSQ3RJDaRGGGlwCvBwb+jCjOZhVucY/9aE7aUgL4n0cvyflrmtgoVT3NVWY7NdJ9s2r2O83mr8PsBxG+ti7mJf0hk245mwQHDLnCB77HdpI2EU5D1fY7doZCi4CSU5AFTirr5qhkeeTikmczgz9WhDMhKchpzaq5hv9koi1UBo8HhvFzLvGbSWZpjryUmWUa+YmtR8fEZu/osp5uAqkfD0sWRoTVX829b+JfGOVKsfrGLtoipVWMaUXtpHyQPW0gM0bUH3L2VvfGbKcG2VDXJ+O54JTHdV9GKgr1p0axAP5G+hipzEMMaU7vzhTjp0dVQrbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpXWY3UZxyEbSWD/rqvF46n98WSdjj5pbHhYpvGzeoA=;
 b=hxSZeu/YhCaSg08YgP6SEFxW5KhkYa1q2JO1MX4xMWkqogUFzLZWlzwpuVsTx4JgCc+7lVRCPNUBIUfhj8ACzjqCOfGeOa53sK6b12TEtMiDokxejUTExYNqDysVdfD8a2tdGwmgQbkBVQBmhSS1eEHTkZZWsQVR11UAsitMWkcv6zyZfxxvCUrtjyqZvzKS/pZC1yqUj1vq8qbDhwNtShlVn+kntESCprwqq22GBni/89AHP4I66B5s9YCGbfzAA09nPAeVkYFYmT7d/B6G/13O7F/0PsgcWGmjHldj1DYFF2ZDDN9Dsk7vaWOBDA7hQGN24ifJQNAScJgC0eTmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpXWY3UZxyEbSWD/rqvF46n98WSdjj5pbHhYpvGzeoA=;
 b=5h7Dso6YHyUp0XYQX51FykyXL9UVji9ZlfrnmqlYfIopXFCFlYL9hbNxkRLAF9atWfsoYMwKX8HOga4+BorCaO40mvDyvH9bYl0njJn2pEWOb5yZPg2sHpHk/nG2ddjniU7/M8Lk0fTOQrxvTLNGnYsq7qs8hUhOoVtzQA4uanA=
Received: from PH7P220CA0124.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::27)
 by SN7PR12MB7956.namprd12.prod.outlook.com (2603:10b6:806:328::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 09:59:00 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:510:327:cafe::1) by PH7P220CA0124.outlook.office365.com
 (2603:10b6:510:327::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 09:59:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 09:58:59 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 1 Jul
 2026 04:58:55 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<mario.limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 08/16] ASoC: SOF: amd: require full ACP header for ACP7 signed firmware
Date: Wed, 1 Jul 2026 15:25:09 +0530
Message-ID: <20260701095759.1012929-9-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|SN7PR12MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 159896ba-e8ac-48f2-b206-08ded7575f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|36860700016|1800799024|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	mmE2NAKaa1fg8RDBUC3weDaMiH3PMBSoBu8O+xTC7tDA/Fl/O3iLV+M7wiPeEy55meK/Oc/AZf2ae+YaqOv5UB4okpmoXh9EAJR7XbDaH/GwfCfEe3DU9R/A4EQ479tCiNE27IjsekDdnTE+sJySHZyS/bfiY+5PeymS96I2rUDXLNSuxFCz4pM9ccwiM4avvf5YMluTTzNO67hui+bHA/u58q5htotcURKOOVXXZ3n5O7tdiWoOsf+MtP0vOrAEp9dht+Cos/b0VYRVGp9a7ANBzxA0UZUobC4+giqHK754gZkeAKGEsEJAHVy7C0LN+a2iBBqPZXLQaUJzlhtYutIhuTfv3jQh96HbWWX+KTxWfAol9LMZlU1y7i3Z03N1ciGgb2c/iFpSgjdL/OOE8wEKoX/R7WZiOwytnr73Nono51ZGI346gFPtcIFsLk6Eoh1szwhLeb4Dro9ph2dYDS4TkiemECTcY/dXbwYpjMScfG89SquGrTP5FVmaoyaTo8+0BGoTzLuja/RLBSBysiIMMIZn0SeNHGo0hp1O3OzWldk+8Hjf9n0hh5UC8cMgu1uJcvBiTLRMf+ml6JdfnWmeFzoc+8Doo2984l6YcEps1hi5CseLgIxs4Rkv650oXs9AjQyYTQ+2vv1LnbZrsjYbDcDba2Rpov4qPlRLgfx/gNplrc79Nx46muwVnRwNO3x1UNN1x4lB4g/lDl+bww==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MIYQKwxl0uDacels0NPqC3nBn9lr/u0usAnqwSv2ylNMImtcdO2VKRncksvcdOuRZocoe7biiMUK4bJyBBv1mXNjI5a8FqTu8zi8eqxjrCSKgy1VvtCkngZSzTeBH9s4HWenoGhQbi8Dqk34TE3t+7PqKCLv9WWVcXShQ5tUz42mv2A+EausegehJ2iPcRU4pyY4awlv8DQGi3q+Bmu1OWsCMFPXkxpI/Etd6PAh7ANhiT3/WUt3rzv8pN+z3aY/dqdKEoIJtaljuGIsnFjDSyBQHRf9Uf3BZ+O0N5azi/TWVvyUcWDOs5afd/Rnw+XHq0e0sBomjcfAzaGQoGK4HU4QL01uwBybrrjAWS7bRJXiUtss6z4uyZJ5hPk6Igf7EqzdKsFjI+tBdbH8A82z0tNoBCSKlWAtuBOpioAUxIZzJ/04eYSceZDfn7125Rl4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 09:58:59.8093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 159896ba-e8ac-48f2-b206-08ded7575f91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7956

ACP7.B/7.F signed images read SizeFWSigned from a fixed offset inside
the ACP header. Reject firmware buffers shorter than the header so we
never read past the end of the supplied image.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/acp-loader.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/amd/acp-loader.c b/sound/soc/sof/amd/acp-loader.c
index af04f053fd65..e4a17e6656c0 100644
--- a/sound/soc/sof/amd/acp-loader.c
+++ b/sound/soc/sof/amd/acp-loader.c
@@ -176,6 +176,11 @@ int acp_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 
 	if (adata->pci_rev >= ACP7B_PCI_ID) {
 		if (adata->acp_sof_signed_firmware_image) {
+			if (adata->fw_bin_size <= ACP_IMAGE_HEADER_SIZE) {
+				dev_err(sdev->dev, "Invalid signed firmware size %u\n",
+					adata->fw_bin_size);
+				return -EINVAL;
+			}
 			size_fw = get_unaligned_le32(adata->bin_buf +
 						     ACP_IMAGE_HDR_SIZE_FW_SIGNED_OFF);
 			size_fw += ACP_IMAGE_HEADER_SIZE;
-- 
2.45.2

