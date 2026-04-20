Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2266D214204;
	Mon, 20 Apr 2026 10:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681471; cv=fail; b=VP4IciX5wnFD/yJqVUVndJIKZDesujp2ReZ8MjoZ456a1s0jsQvIWRN9/3mTDuG8o1TAM6sia9zZEki4PNoV3OKeqEecc44JjMZ4/NuGqOY8zHiVMxNZPcoDxXpnDJbDtWA+wRgXudJUmHJ94osAb9HcYUSZpYDTNzHlfvsunLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681471; c=relaxed/simple;
	bh=dwqJs+Exb2Pp8PBLj2+YoTMf+1VLFIc0XDXCbYaFYtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nlOHRw03JWVSA0Iea4P2Mh96K4cQVYCSUvDJ/q+i/CLjHfEdyG++264w2N1e5DsDsbkXns1GqZ5j4cgoRefcAH4RZTrMikAeD5GqXGr3N4fyXwhE4YcCFEG+ctFTCTqpxxJ/oceyEsT/g6LqnAMphvAkk3qQRd4nN3kuG8ntoUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Wwj9rEwk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GvxFsEMq; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Wwj9rEwk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GvxFsEMq"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K6ZnEK112368;
	Mon, 20 Apr 2026 05:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=eZhQF12D1MzgNZlV
	S0D14Dgh1TO9gnUAk4okuPny9jY=; b=Wwj9rEwkV6h90rdQuSRhxp1Q/Pft1lAv
	k3WLpHKL5MGul8eON+Q8Z/nxHOIA7flMJAwXKsVPxkgG9fAB48vU17CEtZWYyxH0
	HnKog55gSfx6HwOBx9l6wRG5jaiwzZ2ZntfXLdQpsIK9e7r9fBt3PJ/uY3v2HX6G
	yS4d8n/7GcfGQHpymK2z47gECY6y0M/JYzWiVU2ZNdynKIrr3fVgPVuzZazgAT51
	S50MvNwMB8aMXU4vwXstX8JcPAioMHQZoeNX/o9Ri+FisBvZJbRFE7+p+TdAJ+Vn
	IxXLvgWZYGp8HrIk7YrKNf+Oab9pyjqAAFYAXJbKT4A7UU9E/U3dOA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021110.outbound.protection.outlook.com [52.101.52.110])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dm7byj103-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 05:37:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTsmZlyVleTDEMi1Lquj6sHrxxC20szoIKCJ/q/j0KSv4EUbikYOSs5I7bACHZltHdicpgKA/ouCsW3dde7YjegMz7Yr0Ilr08B+eZhQF6YoBHUuqjPcjqCrzG2pUyhjn56U9aIsCWrGvYFdtNOzW72dEu+6s4xmJ+Y+x5SM15+rx8DehEzTBNTfOI4foEMpZRAIMmlMx7WcdJii4Gf3yh60cAmFnEFF2t0Rp2qTs2l+W5WCsTtNaMY5PW/Zt28R2C6xNhciB8OxGw3PcbqILt4Vay8HX0STfkNdRKnsq/UWsksX30aZ3zSgTQbX2wRxKhz79xsR2IdrJqLlC9vNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZhQF12D1MzgNZlVS0D14Dgh1TO9gnUAk4okuPny9jY=;
 b=mbgGjW4wvVTRoItk+BEKuLIRO1/Jytp/Oc12HVMVYUXOtCR/aCJNRprH6cWkt7DK5h2G8eoss5Ux17g49AvDiNveXnM9D9A06pc27VmjfVgtNFuWtOXUZ1mCIJ9UFg0O/iiMezq2zAk/0Nww/YbRcoRL83FmX0y7UNYgvPKQJWVeU9BPxlCLmDv097m2F6v8FoXFx5X1pXfey9iaKomdlABR7tIrwsJuLrctmwjT1cFJ8i/AZvlkBNIatlfr8eawdCFnFv8dWYIydEsdIykCNFnnDfAUa4HAaZTraYTZM0noSSg9+ecXcK/id3RIPs1AUSLsWPpriNHzyteyt00fPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=canonical.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZhQF12D1MzgNZlVS0D14Dgh1TO9gnUAk4okuPny9jY=;
 b=GvxFsEMqFPxXf7oJofMpmDfyfsptypDt9OXbJ6njYXAGr+rdEIRMyMZpxgZ2eHOxgdbemsiUJmK2ic2E8HahbGiZWzWZzZfRxYz4dGSDzxxvVY7lkHEUlqXyCqbKQL0L8cK/A0aEBGxUcwDpsoeI3amX8qy0JOeeX/pRfitQSiM=
Received: from SA0PR11CA0174.namprd11.prod.outlook.com (2603:10b6:806:1bb::29)
 by SJ4PPFCBAC41B83.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 20 Apr
 2026 10:37:32 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::61) by SA0PR11CA0174.outlook.office365.com
 (2603:10b6:806:1bb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 10:37:32 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 10:37:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F1910406543;
	Mon, 20 Apr 2026 10:37:29 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D9E3782024A;
	Mon, 20 Apr 2026 10:37:29 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Aaron Ma <aaron.ma@canonical.com>
Cc: Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH] ASoC: sdw_utils: cs42l43: allow spk component names to be combined
Date: Mon, 20 Apr 2026 11:37:14 +0100
Message-ID: <20260420103722.4175356-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|SJ4PPFCBAC41B83:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6329fae0-0a53-4ee1-c36d-08de9ec8d3cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700016|82310400026|13003099007|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	E9QiLi3FC7Phb/2T67BF6E/+2by3z7ocZYzbvMlP2MhPQdJ1V2uaEIDWRzWFsDoIwXGGn3U9g4IZkapggxT2P1P6pivpQWJpIcr97sdkemg07YOvxrSeIqg1ji/x021J+Y4Hmm4OA3NhJR4zb4DFkA5Ui3fBYqpvAElPdUumoGYhRipLDi0eeEVKX14XX7yb7psI12sfOJ0hiGKjWVbjB39WgBS7sVcQiMcFZGm42Mx4iugGAijtB3dK0UB/Zn8R1g+lugYA5Wz6TTyCBC8UigJt3pA8BhW+jeZuoiMIc8w2QUv9JSW5gcylKZIddjYy5qpA2D3TlQJXNuSZjYSDKF2UEBjtVb6ElHtHzB4N/hx2kZRBe5FBSL4fFkJEA5U96WXDwL1d0X/elN0wblKjHR3ifO6Gkpgn4kWTY44Wu5kt6KlEQZ3PN8AwU361F8C7fJ7yJbAgpy7a7r7k4GduaCb5f9OGgFStRezyJv3xMDcHpeKViuymvlOnGqBN5xIaZ4szm/GHVxyvowb9QfBd/R/XE83mrKzDkt+ouNVTAibBZ8GMWQgTI90dF4rXcw2IPgCnW2f8hYlHqvu84vt9h1UhJvgu/FPdVvdS0NEIZwNdihGsc4jmApOEmX3KCbpMsGVS+CT7gE4V949Y//JR/OjElyUE9y63s0wp3HdcasD7dHpBqFOqoN5okIp9UcB1Zy2r0mnVtMQWAFoR6nsaSlvPwuEvx/hA1OmWest7cxwRXqWJPq5xfJC52DOAYfQ5A51xFI8tlrn7PwrfNIhVeQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700016)(82310400026)(13003099007)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NigAd4xFZgcVW2+P3f3+hN953PSnJDKa92WCatVAgnGvpRIv7mxLsimSs1TvKgxMwThCs4Xkwu0kbmfNVS3hvNNzUV6pWuZM9MgHCMxmq1O/frou9FQ3w4GJmrHX/pq35hDXqrwQmbuFMnGqEWvLnuka8DBT+qDe2agwJc5+jTdAEy2WhbtmfOLwUsBlUSpEeD5urQ0reUaZ26ZevYd+iVLRJHR/b01AplvG7a6FXhS7tsRX9hZ6r3MXI9NhY7O1mYIw44dao8bw8Xe6FuAGKtTWuiIKUw/HWJA0e7MIBiZHqeWpEkpgdeMwZO4kDMfrt0NuwRtAKUV/L7TfwuKBwBUpG4KVyO85o23NDZE3AZgAjko9CpSbtAhHAlC/MHFe3sAqNjMMt/j0BXdrLZvyvY+lBhJQgQS5SbytwstlWrekAQffsDxNLjEGgUtKahLY
X-Exchange-RoutingPolicyChecked:
	o/Gf3HdSsSydkS0CbmFhCQWdOZt/7cyIyXgQel+z9IEjkX5mhi2As3uGp80JHHuN6iAejVx1uQJNFhXKpawWuxdQmLEZuYP162Rm191ZQggk0x85KIK1GTYueTEduKLWvUYB4UvzUf9vjO8HYX1PtnVJPF1URohaaYiHoIc92+tcp5uNGJxdK8ntngqgNn5GjIolnMn3Ge3Zbghv9NsIpeAIBrRd/DZKQdV9FlMBvAPys3mwVNim5F56BDc7a8YlHa8oiutynG35FfwPElo3ETY25QSKlMasg+Mw5bYRYNo+CVn/pLGVr1u/CzNfG+5Dz0Sfgn4t65JgQSBfN11YJA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 10:37:31.4642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6329fae0-0a53-4ee1-c36d-08de9ec8d3cf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPFCBAC41B83
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEwMyBTYWx0ZWRfX2wTrpekK/YbI
 IHzhMmlyxwVIiuJKL2liRbE/HSIAI+CsUbAftbeTG86R882VskRcpABm/dnUqmRKAmHZlUjFgDp
 WzOgNEEjhpQWqIREJhh7MAdmA67jmFGq79jWRshFBTpjgiIMH3iqBFTAjx6eIFeAoXRKMH/LxVP
 AM+Vd0ilACCCul1mUKyV/4oe26ibuqoc5lEF0ETOPGTjA+96JAtagNQjIxaSuGnc5f8DQahCRxY
 iwZGkHnqSEJg1ZTzBKHKxN4Jw4kDPu5mZAS1JFXou82n+wFu/zsD84ZxqyELLmMRtBkLAc+haHd
 ibgR1akWHyZtlhxmooaNQhWEjW1sgAX64BsCYu6J3oWTGgzguNFnXB7rIr+EzWmH24LGeo7i/ZX
 JRAF/q+X+ORIKt9pmBuL5U8BH+ysnMoimYJJ9lo6y3CmCtC+Ig3bXZPVqi8Mtf3iFviwviwnYS2
 o6dGUy/24DuKja5NhAg==
X-Proofpoint-GUID: ykhet-7UI3M-kYGYDBDf-QyjbUgE1I2W
X-Authority-Analysis: v=2.4 cv=SffHsPRu c=1 sm=1 tr=0 ts=69e601f2 cx=c_pps
 a=Fop6EJdm3JO4gNsOK7pFUA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=NEAV23lmAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=lDUFhbT0FZI9Q2P5P-oA:9
X-Proofpoint-ORIG-GUID: ykhet-7UI3M-kYGYDBDf-QyjbUgE1I2W
X-Proofpoint-Spam-Reason: safe

Move handling of cs42l43-spk component string into SOF mechanism [1]
which will allow it to be aggregated with other speakers.
Likewise handle the cs35l56-bridge special case which should not be
combined to keep compatibility with UCM.

Link: https://github.com/thesofproject/linux/pull/5445 [1]
Link: https://github.com/alsa-project/alsa-ucm-conf/pull/747
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
Changes in v2: use dai->component instead of snd_soc_rtd_to_codec(rtd, 0)->component
---
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c |  6 ------
 sound/soc/sdw_utils/soc_sdw_cs42l43.c        | 12 +-----------
 sound/soc/sdw_utils/soc_sdw_utils.c          | 20 ++++++++++++++++----
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
index 2a7109d53cbe3..e0e32a279787c 100644
--- a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
+++ b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
@@ -40,12 +40,6 @@ static int asoc_sdw_bridge_cs35l56_asp_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai;

-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s spk:cs35l56-bridge",
-					  card->components);
-	if (!card->components)
-		return -ENOMEM;
-
 	ret = snd_soc_dapm_new_controls(dapm, bridge_widgets,
 					ARRAY_SIZE(bridge_widgets));
 	if (ret) {
diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l43.c b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
index 4a451b9d4f137..e99ea3c4e5dde 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs42l43.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
@@ -107,21 +107,11 @@ EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_hs_rtd_init, "SND_SOC_SDW_UTILS");

 int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
-	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = dai->component;
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	int ret;

-	if (!(ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS)) {
-		/* Will be set by the bridge code in this case */
-		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-						  "%s spk:cs42l43-spk",
-						  card->components);
-		if (!card->components)
-			return -ENOMEM;
-	}
-
 	ret = snd_soc_limit_volume(card, "cs42l43 Speaker Digital Volume",
 				   CS42L43_SPK_VOLUME_0DB);
 	if (ret)
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 2807f536eef0c..1637cc3f3d598 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -758,6 +758,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.codec_name = "cs42l43-codec",
+				.component_name = "cs42l43-spk",
 				.dai_name = "cs42l43-dp6",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
@@ -1104,6 +1105,7 @@ static int asoc_sdw_find_codec_info_dai_index(const struct asoc_sdw_codec_info *
 int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct asoc_sdw_codec_info *codec_info;
 	struct snd_soc_dai *dai;
@@ -1179,16 +1181,26 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 		/* Generate the spk component string for card->components string */
 		if (codec_info->dais[dai_index].dai_type == SOC_SDW_DAI_TYPE_AMP &&
 		    codec_info->dais[dai_index].component_name) {
+			const char *component;
+
+			/*
+			 * For the special case of cs42l43 with sidecar amps, use only
+			 * "cs35l56-bridge" as the component name in card->components
+			 */
+			if (ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS &&
+			    !strcmp(codec_info->dais[dai_index].component_name, "cs42l43-spk"))
+				component = "cs35l56-bridge";
+			else
+				component = codec_info->dais[dai_index].component_name;
+
 			if (strlen (spk_components) == 0)
 				spk_components =
-					devm_kasprintf(card->dev, GFP_KERNEL, "%s",
-						       codec_info->dais[dai_index].component_name);
+					devm_kasprintf(card->dev, GFP_KERNEL, "%s", component);
 			else
 				/* Append component name to spk_components */
 				spk_components =
 					devm_kasprintf(card->dev, GFP_KERNEL,
-						       "%s+%s", spk_components,
-						       codec_info->dais[dai_index].component_name);
+						       "%s+%s", spk_components, component);
 		}

 		codec_info->dais[dai_index].rtd_init_done = true;
--
2.47.3

