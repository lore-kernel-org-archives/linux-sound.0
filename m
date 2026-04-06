Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011010.outbound.protection.outlook.com [52.101.57.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053BF2EAB6F;
	Mon,  6 Apr 2026 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775466389; cv=fail; b=QJ8Ce/miM4QIHY8IP6s3ssF3Bvua2UC/MA1/HDlC/IboiADxR6UfGKTjmZpkMh5fcKBqRkezoD+kASq+6A1vkhtygr8mQ1Bge8VxdT3uEVSrOIJUeW5dqJgeHUI40j6rnknLnlmVLaVSDO8I3MtK503K4FBhvpn5KnblOCcLGQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775466389; c=relaxed/simple;
	bh=miMDuIPey5hZt4JkOSGBaDE5LnlCWRYonOgYo7Dw6Fc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aCDaAITVAelm7J6oRqkmcDG1SKygYgdQV2m6k8bQ+EiiALmzK0qp123JRNUgwVih3fw5AwjDXHo/TzaZjCgjqFP811NJekzED0qWxgy+PJs6M3ncX4VYEPr8DeaugR+H8IXE43IQheFcnY2rRu7MB4qrX/cuotCzC73ObaCW++o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rW1e+7n/; arc=fail smtp.client-ip=52.101.57.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rW1e+7n/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r00j+m4T1kF7bGw6Ixznxh35+grPjEB+eza6k+pJ9rprSgLe1xHecOSkctuCwnlPNi+G6jF27Y2Vo8RH1j6YuMCelAqg6EVQ7I/wLFOIcKCML7aXKcT42YQjr3L/OUS8VtjovotAjibgRu73cMAH1Hm7395jLtr4Wd4mDbxSFyvoN/oXu2YMHnK97l6h1wZu1pRwsJ6emkkpkiJUV0i9Z1JWdKHCKT6vxbCe94LFpImL9XU0xfEojqKkTXQDv3bEIoAS4M685sp9J+Zb4cBB5EGGyLAza4+YeAECZab3J1D7dqrkYCeW0MqKGhJ8W3SLjh9NjWEF4cBwb+zuTsNxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfqIalIMmVa+a6qkyHGuBnIEkwauKKydFK0bSrCEEqs=;
 b=RVRPGu2ZDhyc7E/L/1o30ifK/CROzYWfo+CxQfuL0S6lPb7qIXK/WuOu4115QSAfASukaEoWB+ZG9TSHyu9pQybdebxNE8f8Zm8quBQOd1X/52mpkFSm6etKICPB69UCKHAE/SbwwPtLc89jQGFSJatyq0wyiN2thHGrQeCsj3q+TUVpPyC5HNACSi7PjdTW+LACuYSLYV70LSfT+NJgPzYAGxbeYJr/gHyn78w1YEgwyMb3gsC2Y/Ciyok2RLok7WHCXwPGg/JCRqHG3T5cUzc2zVWvawEriVD2SbG8VGhUouROoPNDLDbkPkV93GqC/ZxQeMZgvDHy52zC6aVjKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=realtek.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfqIalIMmVa+a6qkyHGuBnIEkwauKKydFK0bSrCEEqs=;
 b=rW1e+7n/zot/gWRsqPsm/5w2mHv/4dozrL1YIDMPMDFRM9YQ/kcarXY0/mNBbL2f4MaKJPfo1w9Dp3zZ1RCblTzNQaNeD4YI9afVVHYrY45w3iAWkfV4cPv6O4wkA5zG0TKIFP5AM1ErHi1wXpKQgMYmj5EuOO51/CY/nGGufEcjfP6FjL9/SyNvjo65UDYX1XRdOM9nx8j4vqdpbYkWPi2T+NPgAXviNoiqUf6PULTJDGZwf+G9grF2hGz8UqUwFEO2N4Lgxb2t4gzpsX0CXKt5E4DogfdQgRcLZde/8YqpfCoSGZhkIajfwn85vocLdzaaUHgRjHSQAcmdr+sOOw==
Received: from BY3PR05CA0043.namprd05.prod.outlook.com (2603:10b6:a03:39b::18)
 by DM4PR12MB6543.namprd12.prod.outlook.com (2603:10b6:8:8c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Mon, 6 Apr 2026 09:06:22 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::23) by BY3PR05CA0043.outlook.office365.com
 (2603:10b6:a03:39b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Mon,
 6 Apr 2026 09:06:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 6 Apr 2026 09:06:21 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Apr
 2026 02:06:08 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Apr
 2026 02:06:08 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 6 Apr 2026 02:06:08 -0700
From: Sheetal <sheetal@nvidia.com>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Sameer
 Pujar" <spujar@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH] ASoC: rt5640: Handle 0Hz sysclk during stream shutdown
Date: Mon, 6 Apr 2026 09:05:47 +0000
Message-ID: <20260406090547.988966-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|DM4PR12MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: daeee15a-7725-48e2-cc94-08de93bbc5ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	kaTUmdWvWEiq44PHiyLv4Ji52E2zYfi7i9O4FwyAqexfGLQ/AfC4C/uL/m4ZqHTsUcEaZudSmOSevPmZeXLIY9HIOfApVaK8awncOZyrLQ97DRCFjCsmvqygifE5IZXBiyMpmeJuyZoX1C+4RfcvI6DWDgv0ZPDKmC4/AJzbsj1+odzEjkyzeiE3mDdIhBa9njQ3b0rbDgKZJk8YIfryETi4KbaIQ2zw1EwJkcegY5sWgdCCFvOuXBIJM76zpKCTOhUOFaXkc2WsTTjfsi6k2nIKOoAJo42r73stQ5OLIpjbJEKhhL8HWKbMWVR18pL9hgR1F7GUzHemo8JIG+INSkSqpGKb9VqGMv/6/J0ahaP7P6qDuAbkeqTNTzsKdBzInX0G9H4cdOMu4HIpLUTn6ilAo3E3LMxhk+ryWzxcUdi7NLWdkLd8NJfWXBZRRl0859xE4mJGcTfYsZornem7kgSnv4Wa/nVOxbmsVstSXFSrWkesMlcs9zi5GX6evZlec+J+9dvruA63try/FxNvqD7gvoMC38BKWtNMUZi6HjvZdnuXnO3Ov2RvZxeyHVXzdGRTpE4uVIyM4snCcEVCAJ7txaUN8aYxCj1kx3rivXWxj3Lc244jhRN+SEdOmC9zoWOvL/la2y9k3x3eMvcILlW9hDuU+wraduWl4LtV9fMeTtY1SUl7iHjvv+K21yEcKfVtMdlAudtebND4sv860s+eYp1YZGLikQ0dVT2gkdN6ysm0FtaoEIc/YvLZsElgdY/FG9ve8vLTgALUYWbMgg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oaeArM03RM1EroaHacG6enB0aI6oNU9+8bEKU4n404m5iRLIR0pcAwf+nSeejmCKxgJkpPZbkA4LMgHF+VbZUM17oRM99dqtxKAAO4Yziz+5OymmvDnaylpv6NYoFASfObLovxKTK8UU0jqwOxDwr4kQR6L7320njnCw52jtAxt5bADilnpE7Ky4HPTgxSeHwYXRKxZe9I2L8RkQMK92VgOM/sOXAPlza+jsQZjg0yhoQYnD7NzARzfCnukeSMv4CkVfk476NXM4jQl1gDBYZRQ4Ic8KhRAO/AY2dlKGM6IxfJk1qLNSMKdzxPIzPjEbiEzYNs2FM6VRLji+51KyrlmfSZAZcEawyYchQMfQbSJpwXwL23+85H6ZWutPaP8L2F2Lg3LBk7qMqDpAf8mAVv4gFMCsJ0VubmAbDfTzd/kvPLsoMHpp8l/42BLQ9HDK
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 09:06:21.7447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daeee15a-7725-48e2-cc94-08de93bbc5ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6543

Commit 2458adb8f92a ("SoC: simple-card-utils: set 0Hz to sysclk when
shutdown") sends a 0Hz sysclk request during stream shutdown to clear
codec rate constraints. The rt5640 codec forwards this 0Hz to
clk_set_rate(), which can cause clock controller firmware faults on
platforms where MCLK is SoC-driven (e.g. Tegra) and 0Hz falls below
the hardware minimum rate.

Handle the 0Hz case by clearing the internal sysclk state and
returning early, avoiding the invalid clk_set_rate() call.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
This is a follow-up to the discussion on the ignore_zero_sysclk flag:
https://patchwork.ozlabs.org/project/linux-tegra/patch/20260317094910.1582011-2-sheetal@nvidia.com/

Instead of adding a framework flag, handle 0Hz directly in the codec
as suggested by the reviewers.
---
 sound/soc/codecs/rt5640.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index db2222e6f2e7..f6c6294e1588 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -1838,6 +1838,11 @@ static int rt5640_set_dai_sysclk(struct snd_soc_dai *dai,
 	unsigned int pll_bit = 0;
 	int ret;
 
+	if (!freq) {
+		rt5640->sysclk = 0;
+		return 0;
+	}
+
 	switch (clk_id) {
 	case RT5640_SCLK_S_MCLK:
 		ret = clk_set_rate(rt5640->mclk, freq);
-- 
2.17.1

