Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2A21FFC41
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 02:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756176525; cv=fail; b=furJhoC7/N3k9Osb7kMzQEW/8G5WAfxjqO6Sk6B8lCwaH5jSNvzkDz65OTXD3u83eKR9JTiO8ryRXOzz3cDSnU5oPjovjSFIJIqoswJWq2V4Zps7UF1Jty1cOOK/BqGAPGh+Ecw8Azj+s2mC3yXgoyvfKBjzgbJVLpY8Qq4H0j4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756176525; c=relaxed/simple;
	bh=ksxNzgyun4acN2hPCGgkJjNNGwPpXKGwGyaGq2SrEB8=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=AQxU5/2fy11Zd5CTuXRKoMyq3evk0QJyq+wg1hYyGRWdV51r8vRXWVAlbTDCLaP4AJFG7a9b8PeNZSdGZWZJRIWpaLRTozEj+xZPtsfepN6XlilpiJ9LcFTVYodV+57JjEI2eXwPBSsNwt8Ds/q5Q1lJTf78jVVqs20lxxhqxlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZpEMBzq8; arc=fail smtp.client-ip=40.107.92.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZpEMBzq8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfgCF8YmOHsF4fiyW7GBIu2ywwsZiv9Mf4YhLANYrcpN6EHlDvDKTHKCHKHqa4zBGjS+NhWcRyC9Dg4eQpinzi9lllc0NhZhNZiFrrp5RnKEMb8yYzucZjOXWgccPlbGET31bP74lkrCSaRXjUbl55AiHVlFCLBv0Wqsp4aKs0uDB7mkbykLoBInJVlMM4o/+6XFoRun/YjQDiz5QOpjQaBx9G/Oufo5J1jl9qadkqY4/MKjyP46d2erSokVqR19XNxHm1NAJzSkB15rh/e2i9LhisdOA6jTbDDhvb0T7AAVkyAFoDGeXkjlNIjcDVf5GGXQKqAzb/YiOJqt1HaZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwFpF207FvcQ9zxNOiQDBwWnwecbRSgPqmcKF1Vd8IY=;
 b=dYmZ/UOlzJlrSJeVRuxMLheSg9ECIqVJ9Vfx7TFU4Hafv1gprl3vi7OvADProlcwDPJHPULnmavM8Q+7yc42nsI7+c1fdMGCLH6AtZf60HHigBOXxFgcM1YyWt79DrNWufA7EUUO6HBDuJzyD+RFq8YdYIJPz+kSH2+CvUtSP+WzlLE2UciYDFJhKeMqi1tZi2cW1LZFAWFpSApGbagEs28gE5ewyAX0FOf7xltFEHLxBK6kWyPnHVEJaYdMhB78kDHpJbyPWw1dCh1pFzs29kMHei4iLgD88yIIgb75HUxSk8PVbA8T7U138LOPBZ5JoRfxz9f9if9LSlwLXddZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwFpF207FvcQ9zxNOiQDBwWnwecbRSgPqmcKF1Vd8IY=;
 b=ZpEMBzq8o/8tZL6pS3mZ4RSehMMbqsC0tKtRbW9Ns288t7bHTMn56FkFP4UnHqNVYvtK4MJUR5qlMLhpcYKRtUw6hZi24n0HY9xuW9zR6YDDp+kXQWhVqBIz/S6gluPnGd/4wthi7eetUnJQ+ZIzRRrDBBKtztV/Ir1IHS4VWXL0lMsZLRzsEl3fcpn2+HUZk90q2b9P6haO2aM2p2l3wMbi9Iky0Rx99bWV5FU0TNFxaq5AgVzxbwnT+4o14OnP3Pofswod735V3hNhYemnIcBgECogAwJljdDw/n+fbBg7yiMQUH53cyEe1POUFRurCqfZe2k9BMIfJvMMEpLfuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by IA0PR12MB7507.namprd12.prod.outlook.com (2603:10b6:208:441::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 02:48:40 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 02:48:40 +0000
Date: Mon, 25 Aug 2025 21:48:38 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de
Subject: [PATCH] ALSA: hda/hdmi: Restore missing HDMI codec entries
Message-ID: <aK0ghvagXy740rxd@ddadap-lakeline.nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: DM6PR01CA0010.prod.exchangelabs.com (2603:10b6:5:296::15)
 To IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|IA0PR12MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 30768079-c3f9-4b09-9a0a-08dde44b1058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7VX11pSKdakF7rqsonX2ieNjAIdnLkENachd7mw2a7+UkwJEPNgr/++EGhYg?=
 =?us-ascii?Q?4NZKDK97YJP68HWmwWWlotiL4pueLM9FmF5lqnuMrbQfS6A85bCGVL880PQ4?=
 =?us-ascii?Q?Jj/gRg+vaj1ivyM7k3gQ7gp+gpmHERp5dXpudPeh704x+a/xSPEQ/rPc6J0b?=
 =?us-ascii?Q?77PuUfdtaJVOCeqNS2ssJESnUX51xzyrNQzR2VKC3vE9OqQzww5kLqN6bp/v?=
 =?us-ascii?Q?UCkyooDrY9PrqPWLnL+dLowgoxR7M0ncOvSBM0uxK6i0JEGdE2xtke9gEMKs?=
 =?us-ascii?Q?oIkZgQlZD6eUX4u/moowhCKXUi80y2cSg3dAlSN1X138Xs/S04sJnRwqGiFT?=
 =?us-ascii?Q?hMBq9kyyFNSGD61B+rnhVHseqYPqPk0DlwfXIy+aTdyJkEIEsQQ2yug8JAg2?=
 =?us-ascii?Q?WGmGArwt4CDtz04HmdgLkpna54u54UuEnB2heKAj1FA0TS4VFbwLEXBYCAZe?=
 =?us-ascii?Q?e02XlthxCKsz63W7jjk6Q1C7uGJIVW0KRhvN9DDPUoHdHBvfzCmjg0xj3ebQ?=
 =?us-ascii?Q?J4XBzGYeOgG97ncRlETZK+lRe/elLAZ3lWXO6/epxVoBunnJyJduW6H3KHCZ?=
 =?us-ascii?Q?UtpL0Ezwyj3WoWuIjlWlgaF9fXWroDWRYxj9RqHycyxb6eSNljdSyh6DO5WN?=
 =?us-ascii?Q?E6J5Njg9Ii+YPDeHIUY5x0s1wvqxm2XBAqyMrE4c0pz2XVVTt19hSRbetrHV?=
 =?us-ascii?Q?PJ0ZPAtCCoP9mQzdbH65otoOdmp3FnVYj9RwtzSPdfSVKI1IL8DN1ugB7WuQ?=
 =?us-ascii?Q?Oy4IugAI6eLAoRbLD+9EN/egNEtTOqVjsq5giYXhkhh6kkyJr5WU49pt/K49?=
 =?us-ascii?Q?m9icutd3ZSJJzXjjr7VYkNWYxqKVwnOqeSeFCTtSfaq0EvgM0lY3ZzrcOWow?=
 =?us-ascii?Q?Xzos+8qVTAtJB5KAAlUXGNJ4si7MwqjVlWbcjgQNBdY5+jDxt/SuqZ4Phtdv?=
 =?us-ascii?Q?9yc035bo093t/cXszHMzQWOWLJ15SQ+NFfuCv1Ah7hdc6rB8vHJ0P6uQ4fdl?=
 =?us-ascii?Q?xd2R91dh582We5MX+zGIcwsKiWzW8RT/P/r9OkiAEO/5pDT9b/rd/dF6u9SP?=
 =?us-ascii?Q?dsTqf3BYs7Y6OkXfVtAvLSCPLgXrXtbOpweP8vdk+kn5eT/Ygz+oAXKGmDBb?=
 =?us-ascii?Q?2Yy74M8XvFH9O3zqVMCbLm+u7zRyOOKwkuqgpSu+Fe+Dpf4eSBGuqFkSL0Yt?=
 =?us-ascii?Q?tbGmcvcVzEutUAxm7+NtwzxIRND5vBz3v6OOI2cwc7Qfj1L2sPgjmp18koM6?=
 =?us-ascii?Q?ZCqkKB2BCPbF/5uu6F39xerVPNinMwrXeVNBVAsxMy6rFHMXxIWc4zT4/r4m?=
 =?us-ascii?Q?3ABQcwRsktEcCtmls+1ZCS3+E4ilhakLD3tKDg/RmiYU3zST0sPwvaYoX+XZ?=
 =?us-ascii?Q?/kC5M9nHnyWytICfk5bWHP/0uCOI94oLiaX7e1uPPZ8teViAax/JedQsH1nC?=
 =?us-ascii?Q?iSmBKElyJ6A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QlaAeicgY1evy/H3E3B7UzI1qeRTWonkpxYPuX2rE5HkbntcCdQ7mHzfy3rC?=
 =?us-ascii?Q?f+/dsK23vk2V9dMOuZ1F2cZ7ZebJyjlXhZVII8B2mJc2irdmkAG3ntDg5MLJ?=
 =?us-ascii?Q?rmzLekkyI9F1poqLbeoUflNsEqaYQUh0CmFLHbs7CMza2AMOVUZzRbmfbX+0?=
 =?us-ascii?Q?/ZlIA8LEXGP7PYYnNrAsNbrB6CCnKuixsIHC0QPO+Jq8mju3fMLs29bzx9Pe?=
 =?us-ascii?Q?EnCasWEkbFl9EVoGXfXucaDsY0OltsYoczqn1/RSuc1iUUx7jnwALD+PearB?=
 =?us-ascii?Q?XeFdrDLyEZHTwOnZMRLRbKIITfYMQkkRFikAi41Nl/qmJhQoj15YdgJjMiRc?=
 =?us-ascii?Q?r3dZ1QFKMYtL6u1gfZH9NT2DBpsT/tYzS4X6upM5QtKdtFSyHoIkKTiKeZag?=
 =?us-ascii?Q?HmeAqv6Rpv9N7Ir2xzzJhAcnHw0hi9UHMYOkn094l8Tw52h/4EJQ8opXyywc?=
 =?us-ascii?Q?5faDCsqTQ7fycfh5FFlUDlVY5TY0+zjDBFXik4FPH9SL6rSunKjHISLEBlwb?=
 =?us-ascii?Q?XkqjTAz70LFsyH7Wxa1dYAL9vw0VE1Gi1PHbXvMgq1WtyPvEheFHbudTKrOD?=
 =?us-ascii?Q?K5nhVW1pKmq5lhcmWe8zlwhh0bedee4NPheqnYOkSo2VVBSEgSpizIr5kqV2?=
 =?us-ascii?Q?NZRoGKIlbJDGFKzzi0cQQ7LMDNcvsFITC3gyo/XXtiRb7VeXxO9xj/u8gyA0?=
 =?us-ascii?Q?WpqTA/dc7PQQVtUocWWhpSc5T64JPRVyP3aZGHCOExWEjdwxSMbVNJuk/PY6?=
 =?us-ascii?Q?9vPnlL2vlvjyKbDk7wmvnAiCvaRP8EoUOv8kMU1VUhtyChOaHlKwHLWANylO?=
 =?us-ascii?Q?jrxOLG/MflxOrK72107SEBjMVvWktsoBSvTYrMFgyf7WYtrgbbjMU3wl8lnO?=
 =?us-ascii?Q?D1/FSPFwRwe/I0YHNEHGGbTx13XFE9b0WBdJu77XhCAHjQ0wxGZYuIbG2mIa?=
 =?us-ascii?Q?vGbb95upl/JRHgDI6YzhwoGR9EA8JLpjFp5GNLZBHfOD0Sbw6MxblDvZt2GN?=
 =?us-ascii?Q?Q7NsrqAGyDW9ly6unZmtT5+HSoGkpzg+nkgM///30F+BwkcReORmshAwrkEQ?=
 =?us-ascii?Q?qDD77wDmmg9UgjHMTWyiDszemOEymBOHM7DvH+xW0PJL1CqdD7cVUqo0Vy2E?=
 =?us-ascii?Q?IhQ5X/fL+Ke1joEy5S3CmglYw558WrOsk3vmK2ZJO6GbxjYBIMmUaCY59M+H?=
 =?us-ascii?Q?Eh/dTjzMY1o/fND+kwa2k3oQ/+MFRcqoMZLJNArdisKZhAVN9timnshp1d1b?=
 =?us-ascii?Q?Ve6TRDF96ajv8jyFwebmGB4GWUhwZPHqM2QaZ/RTfJq3lF3ObN+6Tn6o60hE?=
 =?us-ascii?Q?vQhgIYoiV4+7/7aYRTvdeX7lpxnmZHqte7bHoxwnH0ypiNT1K7S9WkTynOVt?=
 =?us-ascii?Q?EeTxH9aRrumv3ChvQu5aeZNF3F609NyTYSDtHkHW9n2Kzkb6g6AdGuvoX0dU?=
 =?us-ascii?Q?WnXYKwHJf8u0pxB+d/a8sL7oVRgHwRIpWIMCE7p4pvoPBBvl2xxoS3QmB4ct?=
 =?us-ascii?Q?BGR6o3m6BuGxiKmm7EaIbf+JPmKYG6LNHIpDAvVGT8gxfzktMe7MxB32Xq8K?=
 =?us-ascii?Q?Vsttour4w0QMLgMlR3ZJ4oKhJFlq3EbE8MMr+Fcp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30768079-c3f9-4b09-9a0a-08dde44b1058
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 02:48:40.6104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4k5Xwa2y9LptWTR0M+v2OLi0kvNUnNJwAc3eyhXWvLvnUdkaYlOQr29HpImbNil/d1eLrKl0EWaTXQvubFx/iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7507

Commit ad781b550f9a ("ALSA: hda/hdmi: Rewrite to new probe method")
rewrote the HDMI codec ID tables to a new format. In doing so, recently
added codec IDs from commit e0a911ac868 ("ALSA: hda: Add missing NVIDIA
HDA codec IDs") were dropped from the tables. These tables had recently
been split from the unified table that existed in patch_hdmi.c, and did
contain the entries in question after the split but before the codec ID
entries were rewritten to the new format.

Restore the missing codec ID entries to nvhdmi.c and tegrahdmi.c. There
do not appear to be any additional missing entries in any of the other
codec ID tables when compared to the patch_hdmi.c at the final revision
before the split.

Fixes: ad781b550f9a ("ALSA: hda/hdmi: Rewrite to new probe method")
Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 sound/hda/codecs/hdmi/nvhdmi.c    | 17 +++++++++++++++++
 sound/hda/codecs/hdmi/tegrahdmi.c |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/sound/hda/codecs/hdmi/nvhdmi.c b/sound/hda/codecs/hdmi/nvhdmi.c
index b513253b1101..94671ad24b5e 100644
--- a/sound/hda/codecs/hdmi/nvhdmi.c
+++ b/sound/hda/codecs/hdmi/nvhdmi.c
@@ -198,15 +198,32 @@ static const struct hda_device_id snd_hda_id_nvhdmi[] = {
 	HDA_CODEC_ID_MODEL(0x10de0098, "GPU 98 HDMI/DP",	MODEL_GENERIC),
 	HDA_CODEC_ID_MODEL(0x10de0099, "GPU 99 HDMI/DP",	MODEL_GENERIC),
 	HDA_CODEC_ID_MODEL(0x10de009a, "GPU 9a HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de009b, "GPU 9b HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de009c, "GPU 9c HDMI/DP",	MODEL_GENERIC),
 	HDA_CODEC_ID_MODEL(0x10de009d, "GPU 9d HDMI/DP",	MODEL_GENERIC),
 	HDA_CODEC_ID_MODEL(0x10de009e, "GPU 9e HDMI/DP",	MODEL_GENERIC),
 	HDA_CODEC_ID_MODEL(0x10de009f, "GPU 9f HDMI/DP",	MODEL_GENERIC),
 	HDA_CODEC_ID_MODEL(0x10de00a0, "GPU a0 HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00a1, "GPU a1 HDMI/DP",	MODEL_GENERIC),
 	HDA_CODEC_ID_MODEL(0x10de00a3, "GPU a3 HDMI/DP",	MODEL_GENERIC),
 	HDA_CODEC_ID_MODEL(0x10de00a4, "GPU a4 HDMI/DP",	MODEL_GENERIC),
 	HDA_CODEC_ID_MODEL(0x10de00a5, "GPU a5 HDMI/DP",	MODEL_GENERIC),
 	HDA_CODEC_ID_MODEL(0x10de00a6, "GPU a6 HDMI/DP",	MODEL_GENERIC),
 	HDA_CODEC_ID_MODEL(0x10de00a7, "GPU a7 HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00a8, "GPU a8 HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00a9, "GPU a9 HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00aa, "GPU aa HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00ab, "GPU ab HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00ad, "GPU ad HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00ae, "GPU ae HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00af, "GPU af HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00b0, "GPU b0 HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00b1, "GPU b1 HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00c0, "GPU c0 HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00c1, "GPU c1 HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00c3, "GPU c3 HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00c4, "GPU c4 HDMI/DP",	MODEL_GENERIC),
+	HDA_CODEC_ID_MODEL(0x10de00c5, "GPU c5 HDMI/DP",	MODEL_GENERIC),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_nvhdmi);
diff --git a/sound/hda/codecs/hdmi/tegrahdmi.c b/sound/hda/codecs/hdmi/tegrahdmi.c
index f1f745187f68..5f6fe31aa202 100644
--- a/sound/hda/codecs/hdmi/tegrahdmi.c
+++ b/sound/hda/codecs/hdmi/tegrahdmi.c
@@ -299,7 +299,9 @@ static const struct hda_device_id snd_hda_id_tegrahdmi[] = {
 	HDA_CODEC_ID_MODEL(0x10de002f, "Tegra194 HDMI/DP2",	MODEL_TEGRA),
 	HDA_CODEC_ID_MODEL(0x10de0030, "Tegra194 HDMI/DP3",	MODEL_TEGRA),
 	HDA_CODEC_ID_MODEL(0x10de0031, "Tegra234 HDMI/DP",	MODEL_TEGRA234),
+	HDA_CODEC_ID_MODEL(0x10de0033, "SoC 33 HDMI/DP",	MODEL_TEGRA234),
 	HDA_CODEC_ID_MODEL(0x10de0034, "Tegra264 HDMI/DP",	MODEL_TEGRA234),
+	HDA_CODEC_ID_MODEL(0x10de0035, "SoC 35 HDMI/DP",	MODEL_TEGRA234),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_tegrahdmi);
-- 
2.47.2

