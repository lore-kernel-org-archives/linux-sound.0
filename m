Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010015.outbound.protection.outlook.com [52.101.61.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F43314D13;
	Mon, 30 Mar 2026 07:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774855495; cv=fail; b=comKLF51A1C0f/3eY7XsrQcVOLSO7ZyjGaPZqWBe3jDC71oLT9KjKL/8LJ8BLG2uGSayscntiviHxBL+qpTSKe0ch7rNzfNt8wIU45JXFnZ97EqKyNEwhPZ5J/EwLQuaR2pdi652So7nQZ4copu778WzxxVbH4nvhk84dMePlek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774855495; c=relaxed/simple;
	bh=3UELa5LmxQNFPRUdi/y+Cnyh2iegdtk4xk5Vl+UyFFQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L6p76IjZ0TkPpS8tZ9B3HrKbmJ7Jax+b5lUYznl2lGK4Ne3qq3u7NYSV/Sc9MDk+3FiiDQ6GVyvIRDZXSHrqgxu1STBUUxxqMGlDZ1tLA6TF3CHjMR7ohnF25Q0SAVQDRIFobEQr5n/I6ru3UZMjdhRDLEQjLD5ppwNDwXyfn5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4Ivsx9sQ; arc=fail smtp.client-ip=52.101.61.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4Ivsx9sQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvrtriw6MoWcyiwTfLkLSHD2J+TW+MZRCb/7zcfKJdGf6U1gE0F+eMGV4bY7Pbm/5FZT/FXAhoT4hwe8vIPxAQPv2JNQU6sf3pr8PSeIiZJGImXaDqNXPXt+K2o/Lqjp6s5NNC7mKmjY7TtVGDOTyGzrt+8L0GVwaxx+U1D2djKPegVY3LvhkcA1Ud1v56AB2RmS9zMR2QIwYZARkunbAXCodwtMFRjavCCDNl5RE4pCdFNVaDQOajbNur5JHG94Wi/S7OA1G5MTn7RMJcyCaoIUbT76YISYQnOiDC1EGlwy4E5G9BSFkQ8uAGX5Sk2WKqF+L78llYavzxDBJsdrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJgxk4K81ARZW9JQ5Mmp8aaIbD5cv80jU+OeWpxvDVg=;
 b=NO0bz87cEjh3cD7Pil8ukF9gGLW6OJuX9qMqbPo9Jsidij6PS6/YG0YMF5ydTWlB+mssue/mZP2/JG12K2DpRbSVmEfYjZitBQt4cmqxRSyH+FAQgWVvWKsZ8NtmkZnLtUDZlGHiSNIlZlI7UZz/27pTYwr6/2AbjUtypafnqMGXahvFQPPhITk06A3PRAKnoBPR+LFKyEB25qY8DxoGaUTnahnZkPbdFubzN1ox/vlQyXZb3sX6azzyQ+0u/z8M4f5W4jUwcDwZfZibWufLFx96PO+sjY8Onid7tsk8I8cid0LyG1wrtKaHpiMh0YQxlbXEEhEzJ9J+aPrWPuingg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJgxk4K81ARZW9JQ5Mmp8aaIbD5cv80jU+OeWpxvDVg=;
 b=4Ivsx9sQ9sBSPzZ9F5h0biJm2y5URpFuWVJ40AD8Eo6zfWKmX8cTPv8Bb/Jds/JA88pLnWiMsppin1CYhBvTdwu9so0vzPXxBWUewvT67JSXHg9TqAKcGmxRikgFXvfFBb2SoRBQhRuDZ+djtpaPgq2j8iYKWIMaaAf2bG+4Mvc=
Received: from BL0PR0102CA0018.prod.exchangelabs.com (2603:10b6:207:18::31) by
 MW4PR12MB7439.namprd12.prod.outlook.com (2603:10b6:303:22b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Mon, 30 Mar 2026 07:24:50 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:207:18:cafe::69) by BL0PR0102CA0018.outlook.office365.com
 (2603:10b6:207:18::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 07:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 07:24:49 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 02:24:45 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<superm1@kernel.org>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/2] ASoC: amd: acp: update dmic_num logic for acp pdm dmic
Date: Mon, 30 Mar 2026 12:50:27 +0530
Message-ID: <20260330072431.3512358-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260330072431.3512358-1-Vijendar.Mukunda@amd.com>
References: <20260330072431.3512358-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|MW4PR12MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: aaca6f06-4b94-44a9-7a98-08de8e2d6d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	M7NgNo0Hp2/pk97ocHZwmM//bVl0l2KyydheMFkj1AKiij/GEaJncmmy2m29YBDuWuBz51nhpR+G3o1qkCm3XZVeYwLjzzLOqVSO6FPvj9YWTj0CrEI3sMOgmKn2TFhWjNUFtAAWkXhZhPCQBGpaSjNLRloDMCFwBj4LcqyIHcdUOOWKwcItlxqYmsu7JYkpRPjL7A6p8vTw6wnEYNtcgNAV5ZB2ygg0yyoCuO7F3X8Fy0Nmmh0ruB8KyEE2y0YXkd+6h5V/qM/fo/L3qdcAqwTFjgN7+KUvALV1wsfxD5J2I2w4z2wULKJGAJ04Xqw4leU2XZAZ1mggl+07TTwwqun1AynNbrDN3niXyrzWpmxcKZ/tC4yV5xWRuAmvlzhF43NDyXCF5FFR2gTF1fGKuwmeUAbZ0NoYcZNK9Yq7oIwKaMve3DPTt7iKbR+lZOLQy6MqvdZmLh4yv9oL/MkXbOk57/W2fEXd1Ve/UgdIYYjAIFR/JZdeu3EYVw5GOZ/e86BvzIinoH/+3jV9n7kyNhLPNSHSjI8x1WdPGPM9K6ylDKJ9jCIU+M2yG6T6JDXzEJl2Ya/ZxN/tTOH1sfwB6rV84yLMgq01CbVze/ENp2AJsSpH0c+IAts9SoSGlS8BFCe2oFXZTD2oqAAVX9OD6wM+fnZXXJOVJ+Vr0ykauO0k50PBBpJHCXbJ01/LbJmmVkRAKwCmzFXpKrNWzyfX8Vk8QVaQZnbATnh7PYFI+lBuM8XXgD9u4HFk782AN7FG+1z27HjzsdI444BpAcG7qw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aO8IoRsu7XaIdlo3KEGteMW5AyFm3icmuJIoYsVVNReop/VBiTql+5EQ4+1EBGp7zXsVYt+UZz6RIOVqLsG+csRX+obrXF2yBQmVlhHpvZZccZ4p8ixnZ2t0cQ1V2HQZ5TiMaHKuqkpuiZrUKAxepfleVacvejDb30FbvAqtc5brKEPkfCUHV9UnYXvAnkhy9buKnUVkW+hFzwL9brEMPmagY+OrZNkrlHDZzURhJW4p3kuZMtlDwIubI/Pvfl0dICdgQMoMnWeUuC/Z9sWxVuD7e7xMMgJEr7ubvbsWBHXnnzEKyICGhOoLr/4QOz1/Dp07JTD7dcWwI9EOeuUd73bZ2GpFudjtrGDyp/sqMH9F+JPjdmarEGwGZO7ptob8uxqXnRlFwd9Qk1PQdfjevEI4AVFfiOXGhhUVYFrlh54nj7PzVIEKugJlZGotu4+d
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 07:24:49.4097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaca6f06-4b94-44a9-7a98-08de8e2d6d79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7439

Currently there is no mechanism to read dmic_num in mach_params
structure. In this scenario mach_params->dmic_num check always
returns 0 which fails to add component string for dmic.
Update the condition check with acp pdm dmic quirk check and
pass the dmic_num as 1.

Fixes: 2981d9b0789c ("ASoC: amd: acp: add soundwire machine driver for legacy stack")

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 6388cd7cb28e..fa9b4b994e41 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -535,11 +535,11 @@ static int mc_probe(struct platform_device *pdev)
 					  " cfg-amp:%d", amp_num);
 	if (!card->components)
 		return -ENOMEM;
-	if (mach->mach_params.dmic_num) {
+	if (soc_sdw_quirk & ASOC_SDW_ACP_DMIC) {
 		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 						  "%s mic:dmic cfg-mics:%d",
 						  card->components,
-						  mach->mach_params.dmic_num);
+						  1);
 		if (!card->components)
 			return -ENOMEM;
 	}
-- 
2.48.1

