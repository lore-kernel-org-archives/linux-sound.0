Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC22517A2EA;
	Mon,  9 Mar 2026 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773045273; cv=fail; b=reLPpavilAdUT5GQ0LliB4EJQ/Uh0lOa1SP2iyvMx31KoswZf1xJAud3xpi8rAgtF8ZBOQZOm6vAk8Ld7uK0F/1z1RLaSNszFqhpO35LwKa97FfxC6E6qV5zHFpwudr1vQjAbGi0ld5G+Zp9ioOqZzpV5sze1yz1Y/MzSOf2F1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773045273; c=relaxed/simple;
	bh=6a2A0dC7YMH2zeGuAte86NrC65WYnduomHZFfcFiLhI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WgFAj3k9QWnWcYD9F70suohABz/Y+NwUy53nFQqYykz3MJLJOCy7CmRLgKsTAfd3yr2L8Ifbhg+VwjLgdVywogaO+oq7vkpy584eJZkmhBD7/wpyh8w1Accl2pr4cXGUNpRFGF2moZLY3tkH4QrEUohsteXFF7N7LNqrzWAiFFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MElaaKNF; arc=fail smtp.client-ip=52.101.65.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MElaaKNF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8HO/zTRZ5WnRiiqrQe5yWbwqMM8UMamM43YaY/Usw4MIV1CFIZxQjp+tYRtaZHmBCgpN5y1bbi/qttvcUXRZod7OYHK39puqzQpvpwDdYQtHYGBWQG9fWx3DpNwTPn0IWk5C/4UyiGQ535hA72UeIIPDtw2lkjKrHWa2omNg5SEr+97W125AXV/cXh2ZjtjXcTB9uWtQ7bMnVbZPZY5JVA3Jq0+oGaurUZdeRDPHLQU+jyyIP3Ou1qmxc69oboFEvPvN19Gmqhzk/jguPg4b+e08Sm+aApdYYCyeWDncDhKKUp7kbtyQzIZMvKPgdpMHKUL6mu7wlTkO9Ievsafbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNLCAJkY5y9KOlMh40hJZdodo8zWnpYY02Zu6ZApTd4=;
 b=LRmFX7uxU0AVKP4tSfAGP3nX31BR9JWyNVtsT6cDCrbqEncU6VZBL/bpafVme689K0qkA7Mh+YCeRFLed1PUJ5x8NasqUEZjYw3pAcvaZgVKSI4cO8yd5lSNFhRfphjDhZ4W/kf56eSDgHXVBdw6ibbPnhE2ck0Sth5YN6XCXua24bfryH3q2GmRlHm8DcNFKgMCMNIGyXAXSDgvYiNkRA/LM6WnQmRtaG2VcRNi7M2Jh78A1Kqsd1mY+iYU/XRhPcJGiaHPlQChE4Hhl1kv75pAczPJ+fIWGFitiKtNfDOdJkoAhj0eR5GhJi2zhBOQo5wGUNDtg7o9m29i1+Cn1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNLCAJkY5y9KOlMh40hJZdodo8zWnpYY02Zu6ZApTd4=;
 b=MElaaKNFF/vJAL/exvKSbyaksE+FSOpVsOge2QWD1jVz5unIK//LOl9YtwvMGc/DXmoszA1G+DeCFHR/GlBLNlbC+NRli/9cJgqARNEYzb7lpMog9mOIyrHXLRZTnEtWrZ0wLi1xq7MPyhN8vUzUOptoosJzylhOZxVPD71MwVGqC2UJrk6UYXTxDO3ZZFCQgzbphr1K8yQaw5wnTw5KgUoFZpI+FxEMKAc5phI335lYEvaAdlken8bROHCKxjraOYPE+1uoNTgHPG8+dMu3EZ/ZDA2lz629ddKO2zCvq1dxVnE6+ZlOV57KaYGheq0KEf3hGiFfeFnwjfWXdfyEDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM9PR04MB8667.eurprd04.prod.outlook.com (2603:10a6:20b:43e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 08:34:26 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 08:34:26 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] ASoC: fsl_xcvr: add bitcount and timestamp controls
Date: Mon,  9 Mar 2026 16:35:30 +0800
Message-Id: <20260309083530.2977163-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260309083530.2977163-1-shengjiu.wang@nxp.com>
References: <20260309083530.2977163-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM9PR04MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e61a7b2-172e-4365-2f89-08de7db6ac5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	soHLucR8TN+16NH98qrRiPa/6o037quPL7kodoSNtC9JmC83i1YzwPIMI24QghFyDXCWitxx+it74gsNmptjFA0Xq3TzT0M6X1FRXaFUPgu+A2IhX5iFIXuTLQ2YQ8r2tNMynw2G5OOg/al6uk8ACs7rFE/+NZi1O0geYuFVCS4ZBUcBTP6+dzTBBagZhCqaJryjr8uADNelow2W74d++7xoDxM5IzpaF4rK6lUDv+xyqb3SItdihbCY/NFEdGIWzFAo5MJRCznxOgw70N87f3jC/Eqi6KQ4CRedmD6GzPaupExmCJJFfou/+33kjMcSWJcyIpHdoB/k6Ndyv0U12Q940/M1jvjm2nIVl0D50myvqxwWUHH8yNWkwM+xHCb8IxcbaRpkWT5MKqIbiDOckR9O6k4Fx1Cq4gkdWGXLBY4kLBoQGycfpdh0txeUJ9rmVfl+e1YYWLfOdCYjx+2YcwrnJ3nYwW4r1YvUTJha+J0/hLnl0R3GDsu9FHA8uGIQBMOudgUrHcHVs0NBZLrKF/9dOZu1c6biHaEX2r0UaD39v/qBtIC4ainHkfMaTlc+x4wcRpq81zfaF4+59+87OL28lXpBpBpeOmX/PobqbLn9VCRmqTsBLFHqRB9qQ65LPJQE4gqnRMjC4Supyb/qHsKt6PGtxsSG+acj84tMN9NJwVuiojdNfD51g4SNK/wthYPdAbYsLGtgBUlFYeuBFnUz1c5aLvqXZthKrZSGALhhlwdPRT1KuYqKHaMmADyFmXYedzcs2Fd3DEjn/Mm29AFRC+SgKf5bHGM+CKLSVS4Ah/nYiZ79h9w078mgbq1f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LV61lXcXrEKAPE1tFhaPOZ0uCYlh1Pkhwcmfnkxm2vwXb3OvDbE0N0bJ/gY+?=
 =?us-ascii?Q?M0yGHWdNbLIrxWnH2ds6JCvlgee9LSDOE0wxGTIerG5edCIIAbG9u7GfqOOV?=
 =?us-ascii?Q?plmChdP6w93knfHIVh+ndQrU66XrnRDEy8Q4TjEjbxxLLQfFdTQdz760o9gz?=
 =?us-ascii?Q?TWgAthSngTxVx0A4LJK4UJ8hY6LEkWCLcaurVr1CYFgMi9K5KHmZJJB47f52?=
 =?us-ascii?Q?s8koP2zKzwOBzkCmdDJUB2MDzYWcX6xMsCoZs9Ws3NSyCS7yXJp+4kJTPjCC?=
 =?us-ascii?Q?53Vz39pxD1umi6ySoTMphALO2IsQIcSTtBnZ6BAG4dGvk02EL0AvWZV8dDHq?=
 =?us-ascii?Q?Jba9b/XpLL2CqFYGhvYCZEZ5mFUxnwuXUawdnx/OoN5mMAZVUrIDYagei8Pd?=
 =?us-ascii?Q?XhXw2Dv2u+arbQBvxu9xO2Quu4/WdUrGQ93QSKlV2zxled/MoscsQ4TgHGFf?=
 =?us-ascii?Q?PuQm42RUQoeFcENSgnCEPZq45d9rDhP2japb5DbLnkX8BZBqcc8rNG0Ceska?=
 =?us-ascii?Q?Ad4e/e1RK3MEfuoGLDak6EyqJt7E4S/Z4L59RBmgPLxFb3exNt8sybbZeb9N?=
 =?us-ascii?Q?EOohR/54AjbL2hrpOj9noVm9gSQoXdoj3u4o3JvfnuZeCoyUveu00WJTd8Cy?=
 =?us-ascii?Q?u9+kda5EgbE4tGTtfnMd0SzuBc31G9CzUe15RgMMWeMX2XqPpiyL4iXrYOCv?=
 =?us-ascii?Q?GifnTkHomxZuMmrFGr+aqDWiYwPBLcKEpWdvKZzBPttzDcz3SAzYS74DDBEB?=
 =?us-ascii?Q?1/wtLoE8Efc5I8JkEsTsKPSSeseRcd2Uo1HSGHjI70uhsxTb0884Ahzb8XCQ?=
 =?us-ascii?Q?O74/S2g/81GGT/Zb2leP4EXZlV1zGlOy3WIx84mrv0B6TkfJXFRp+b36gbWB?=
 =?us-ascii?Q?lzHyTzoUrAvmrSSJfPDLm0Ocw4OKuoVyMOEshPr1Ebt7+lOUvaNOTAn3FuJa?=
 =?us-ascii?Q?EjD3PMDUcovSSlUWbWt5bsEiM3LoXP/fn3PfSPsNve+MhJOkl/yqTDDCCGAK?=
 =?us-ascii?Q?v3KfjcIwdfWgNwjsRNfnnPDs/WaFBUf49EX+ezhwPAmUrZhvE7XvCoTFZKuJ?=
 =?us-ascii?Q?/dDPq2AeyeLsvRV8UKO0LB1099B1mMlEI/pH9S1WBLpBISPemjaxnZv7//MP?=
 =?us-ascii?Q?TIgf+mBzxl8s+pk7QtI5SuHbnUQaqjUYG2HJyaPTK+o3gYLcT7KKMbHEHRud?=
 =?us-ascii?Q?tMie1IxcDWsLWF9tAlAuyiP1dpwIJoRzQEEytb4/9tV3MKjifr4WlUKJWZgo?=
 =?us-ascii?Q?MkvWTuQVKtzDUWsi22zNStZ9RlUPqmWAf2VyNfG3Z9hk2I1tgv5gCJMvdKAO?=
 =?us-ascii?Q?F3gQpkFlvkArwseipVcDcwsT2Y7K9C0U6ftGHl6TALGG79/sxDMEUust3AR7?=
 =?us-ascii?Q?qj4sPMCyoLPqj0Q0L/1cVDuIHaruFqzzhLXMzPxkwH2rI0pO38IA18Xo/XZb?=
 =?us-ascii?Q?cEi+xBRfWeyMloYZIQfF2VWZrSYD3sN5D6fHuy1g92Ktbrgii/wXZq3xuCnL?=
 =?us-ascii?Q?3hkU8lHqdGQYYFgEaS8vGXiHIxmOmZmGNhO1FfizKu1eUOywS4i1NSRfuXUP?=
 =?us-ascii?Q?liS3zQeS64nBqc7aWEI751OklPcYZYLB5accHqVTF25KsqMzq6iY/6dxLP+w?=
 =?us-ascii?Q?o+7joaOuhc6EXWIU0tM8UN8TFma8IFg7h0WzET5XvssNe8/grg1SmkzvLLx3?=
 =?us-ascii?Q?SpF1EyOiU+fQUfblRAigT7LomiXpr6TTD6Jrs4AFgDK0+qXKFdgDl6y2ra6R?=
 =?us-ascii?Q?uTSsQrJTDg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e61a7b2-172e-4365-2f89-08de7db6ac5e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 08:34:26.4829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yctj8Ssp8RngVWtVh8V3GDtFIEA0Mh4iNUwvkcICpZhdC3usKsEl1UGezFC8ZzOtzfGy9td/wfmOUPuiRgQ40A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8667

The transmitter and receiver implement separate timestamp counters and
bit counters. The bit counter increments at the end of each bit in a
frame whenever the transmitter or receiver is enabled. The bit counter
can be reset by software. The timestamp counter increments on the bus
interface clock whenever it is enabled. The current value of the
timestamp counter is latched whenever the bit counter increments.
Reading the bit counter register will cause the latched timestamp
value to be saved in the bit counter timestamp register. The timestamp
counter can be reset by software, this also resets the latched timestamp
value and the bit counter timestamp register.

The timestamp counter and bit counter can be used by software to track
the progress of the transmitter and receiver. It can also be used to
calculate the relative frequency of the bit clock against the bus
interface clock.

As there are three regmap handlers defined in this driver, explicitly
call the snd_soc_component_init_regmap() to init regmap handler for the
component.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 64 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h | 18 +++++++++++
 2 files changed, 82 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index a268fb81a2f8..a945defa8b3f 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -62,6 +62,58 @@ struct fsl_xcvr {
 	u32 spdif_constr_rates_list[SPDIF_NUM_RATES];
 };
 
+static const char * const inc_mode[] = {
+	"On enabled and bitcount increment", "On enabled"
+};
+
+static SOC_ENUM_SINGLE_DECL(transmit_tstmp_enum,
+			    FSL_XCVR_TX_DPTH_CNTR_CTRL,
+			    FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC_SHIFT, inc_mode);
+static SOC_ENUM_SINGLE_DECL(receive_tstmp_enum,
+			    FSL_XCVR_RX_DPTH_CNTR_CTRL,
+			    FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC_SHIFT, inc_mode);
+
+static const struct snd_kcontrol_new fsl_xcvr_timestamp_ctrls[] = {
+	SOC_SINGLE_EXT("Transmit Timestamp Control Switch", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_ENUM_EXT("Transmit Timestamp Increment", transmit_tstmp_enum,
+		     fsl_asoc_get_enum_double, fsl_asoc_put_enum_double),
+	SOC_SINGLE_EXT("Transmit Timestamp Reset", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_SINGLE_EXT("Transmit Bit Counter Reset", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Timestamp Counter", FSL_XCVR_TX_DPTH_TSCR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Bit Counter", FSL_XCVR_TX_DPTH_BCR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Bit Count Timestamp", FSL_XCVR_TX_DPTH_BCTR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Latched Timestamp Counter", FSL_XCVR_TX_DPTH_BCRR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	SOC_SINGLE_EXT("Receive Timestamp Control Switch", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_ENUM_EXT("Receive Timestamp Increment", receive_tstmp_enum,
+		     fsl_asoc_get_enum_double, fsl_asoc_put_enum_double),
+	SOC_SINGLE_EXT("Receive Timestamp Reset", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_SINGLE_EXT("Receive Bit Counter Reset", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Timestamp Counter", FSL_XCVR_RX_DPTH_TSCR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Bit Counter", FSL_XCVR_RX_DPTH_BCR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Bit Count Timestamp", FSL_XCVR_RX_DPTH_BCTR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Latched Timestamp Counter", FSL_XCVR_RX_DPTH_BCRR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+};
+
 static const struct fsl_xcvr_pll_conf {
 	u8 mfi;   /* min=0x18, max=0x38 */
 	u32 mfn;  /* signed int, 2's compl., min=0x3FFF0000, max=0x00010000 */
@@ -1070,8 +1122,20 @@ static struct snd_soc_dai_driver fsl_xcvr_dai = {
 	},
 };
 
+static int fsl_xcvr_component_probe(struct snd_soc_component *component)
+{
+	struct fsl_xcvr *xcvr = snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_init_regmap(component, xcvr->regmap);
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver fsl_xcvr_comp = {
 	.name			= "fsl-xcvr-dai",
+	.probe			= fsl_xcvr_component_probe,
+	.controls		= fsl_xcvr_timestamp_ctrls,
+	.num_controls		= ARRAY_SIZE(fsl_xcvr_timestamp_ctrls),
 	.legacy_dai_naming	= 1,
 };
 
diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
index dade3945cc0c..0cc7945b1d9f 100644
--- a/sound/soc/fsl/fsl_xcvr.h
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -233,6 +233,24 @@
 #define FSL_XCVR_TX_DPTH_CTRL_CLK_RATIO		BIT(29)
 #define FSL_XCVR_TX_DPTH_CTRL_TM_NO_PRE_BME	GENMASK(31, 30)
 
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN_SHIFT	0
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN		BIT(0)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC_SHIFT	1
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC	BIT(1)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC_SHIFT	8
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC		BIT(8)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC_SHIFT	9
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC		BIT(9)
+
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN_SHIFT	0
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN		BIT(0)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC_SHIFT	1
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC	BIT(1)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC_SHIFT	8
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC		BIT(8)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC_SHIFT	9
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC		BIT(9)
+
 #define FSL_XCVR_PHY_AI_CTRL_AI_RESETN		BIT(15)
 #define FSL_XCVR_PHY_AI_CTRL_AI_RWB		BIT(31)
 
-- 
2.34.1

