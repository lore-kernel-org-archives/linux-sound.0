Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F44290F
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 00:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736383211; cv=fail; b=aXy1lIH1JOop0Br7crEEx7l3cBZ7NwdJqdUbUaa0PAF9mFmAcFGzopFlzfowZPlmIfSLehz+u5fRkZhssB4Nd8MRDOcyY1114st3crFSfQ+1/FbYyuaX680FLRfmG8UQv/IeVjZXS3UBN0t1coeu0ncm5jl25B9MrIr30mgAINw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736383211; c=relaxed/simple;
	bh=xGRxf0xc22YYu7GJjLQlhqsyYkDNoX81SW8MhwN6A28=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=JpmIhBxgln5E2/I9T3GjfE6leAVA9rE+xOwhqklZI5mlJ7w51kS6cqJst/vFPypVLwqIUIeEpenivTqcrl30qAdsrrEPZ7p4A9rhIdDn2JGK8LelJpEZ0SE994wcxCiI+LYO0PBhwJB8U0vPgzpMC8g3ZQHLDylQLif1b6t7k8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H4S8mYJB; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H4S8mYJB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFIPZIfe1Jzk1PDfbT3q0sqtiFG/DhCILTcqq7LcjB6MiJ3vM1+QguDMprG+2sZaKhAKWTr/ARJNwokNtzDvuPc+pmKIt716ypo9jFzI8/4geddCpY0ChclcU3loEVQm83rEVkMj/LBQVYzMP7KZmlLwFDMKZhlCMOiL0olqV+3rwEp92NTb4t5vzi2xYPGYo1Ee3hM5rGNjyQWdLaEfV0S06rdjB6yYKvljGSu+oL1iTTAerOCuHuQuq4ViAIGCJcd34051+RAzVaKFAAH8ssAYnDkqRrwg6VfjwL5X73hyxyPyCXKdxfMfzkVB60UHW+pDYd8dM1FZ94dYo/GCEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HQlTcug2SkcAvhJiik69/+TKtrzIz16PwKy/VHjDck=;
 b=A6Q0+xZ3jNU8X5676+cmpnI1ldF1ZF0HFCyZe3fZfuZIrHL4NkGvMm6SofOMTa0pr2OR8TJamGy0cVk2klYRRaFEHaJ6yRNaX4Pj4hLFqBz+WNkeNC2r35QFAaoCgOMkXCjdiKKNFJ+pCuCKIteaL9m/YhN2FtU5bDdfWjP6Y81PDUWk5kHyXMXc2Z3SkAWGIBP/4FJFl2IPWJ/rXFi7YIc1rqTp3fjJTSnXzkz9vI25dQONaMLGQFK+KsQrPe6EYcNUBszDkQQusyIHcx2dx/+IO7MaT9h4Lpyvgpr9eiEtcNHUdAMxqF9mUM8vplrmZBSdIqyXIzEJgumdMPq8eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HQlTcug2SkcAvhJiik69/+TKtrzIz16PwKy/VHjDck=;
 b=H4S8mYJB1/w4lbPh9fPSFPse3rdMXwY+NI1qCvugTIgAxuzoeT0a4YOpNopMFky2VS8FuXS8U9uLbNJAQIbdIrc5+wBPEMjv7LkqPknsXK375GT+fBKO667dqj3TlgmcmyyHYop49XWP2pwTyJaYQmLODUmq/urPeNRrgMPyizA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS3PR01MB7080.jpnprd01.prod.outlook.com
 (2603:1096:604:128::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 00:40:05 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 00:40:05 +0000
Message-ID: <87seps2522.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: rsnd: check rsnd_adg_clk_enable() return value
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 Jan 2025 00:40:05 +0000
X-ClientProxiedBy: TYCPR01CA0165.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::18) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS3PR01MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: 7afc54ab-f422-4424-c909-08dd30462955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OBEA14OQ7YUBEFuuYX0sS8Gmz11EPOpRD8NoNyT24pyl702TdBCcZlrRoC6j?=
 =?us-ascii?Q?zvrGzEA/U/UESgnB5Jqup2drBDu+PVJbLCaXKO/T+EvQbOd8P9xEyiNO2cJc?=
 =?us-ascii?Q?fEB0heLyrflnM9kqladvSOxpRa/FaEuPkRiIsY/pQ90wtPCkqKlstiqM9qNm?=
 =?us-ascii?Q?5/ziNzt5nLh5O5AKVkq1rAwpZ2ZxrZDi86/amM+cLolAZhgOo+wBJ9C2RZve?=
 =?us-ascii?Q?wFFK+25ISf3FaYUwEDCOAEyBV6qZ8/IHe/Jx36YzaqPRPBRKjyEfRy2w+HUo?=
 =?us-ascii?Q?eVtT+gV1FPRCJyWkLkIspWUITteZ42mYjp/3X3KkViS19icAWtvknVGVpPV0?=
 =?us-ascii?Q?I7WreL37+NkP9a/i+Izu/97u08P6zH0vAwNkDC9EwnYccZCqfkYmM9VMq0yd?=
 =?us-ascii?Q?dBL8seYR54BlGilWdwLuNUii5mgwB1rSPMqIRsOzjUfwxPMJMlc2ckYioA1V?=
 =?us-ascii?Q?Q+Wk/rtA70DVsU87/w7mfevePL6A3/+IKdA7vmDl/chLVYnGQz8aMvfNUPLs?=
 =?us-ascii?Q?CUGnEQMWl+Xyq+lhCHgVFJ17it1w/0Rv2X0mspYeQTO7dgdrEkNMEFwWVz93?=
 =?us-ascii?Q?wXQyX8uC8IKvyzK6VDeMzOFWCb0sRpIjz+Uy4s4oNUrExsCnlgE2KLwfZhJf?=
 =?us-ascii?Q?HeDsXY9LqS0cqUn0o3KEZIm2pt199RkWq32Tz0pXr4+S8NgH5SC8KYNvq6DU?=
 =?us-ascii?Q?iSzc3fpQ8F6bZsIXDT9dgr6iyu6U8UhwHCQ1cB3VkKPY6EVNOTPtlTexFYq9?=
 =?us-ascii?Q?gLCYzYIfB8DLoDvXl/u+v6vuoxwbbhGTCt1jVAdFr1CTMFE2nmenjz+iF38A?=
 =?us-ascii?Q?ztkLKvfJb/Z9h623V1FFt06VryuVOgVmhS2t4zxia389kaEQqGkt8Rqrqurs?=
 =?us-ascii?Q?Ody8Qa4429T8aT3jfQK0tN1qjExalY3VYIqTsYJOSkJ8mCH2XpELPyuchJ7y?=
 =?us-ascii?Q?ggerzMF7MAaBi9+//3hSQ33xlLDzcwG1BmHnGf9K+UVJcyCU6fvlLRJC7Ius?=
 =?us-ascii?Q?ShccT+BUHaLLJyPk0VgOxjxTzoRQj7UGVspq6pibKZFS0o5K20MJQWgtIMUl?=
 =?us-ascii?Q?mzGL0OmG4mWCgDm6qNoAWGfDl1ymd9OlejOQs9ofpPAzxLkbTflKed5ZffHB?=
 =?us-ascii?Q?CF0V/oS/9JFU0gFEohIL5m+kBEbRGvL7DYghoLY7JKwiCzFlmnoQ5EX9R3mE?=
 =?us-ascii?Q?cj0E/M8bpBjdNC6qRCalGXZBbQ4JHkMxJNRMzxEjPOf4t7hg+fBoNFZgT9S/?=
 =?us-ascii?Q?3adVob5pim8cV78jtDLDFHfl07DZKgIYAEX7SBAId+yPtJKa89Dy/eOH6EGq?=
 =?us-ascii?Q?aWzEZPvSzmmwhW4EKMcHv+yWXesYWbZhV1scwcKMz0s3vzf0/dutqOvoS1Y4?=
 =?us-ascii?Q?zYikW7L3BkxNiQ/r5MWSxYMlbOfO5Tm6PCNjg/z7QHHy5db39pN3DE2SPtH8?=
 =?us-ascii?Q?B7IEGSVK2ffzb88dVPTTgOpD/oHJ+rZH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LG00MP4EtwXzs2y0onGGADE5KBloIlAz3+t3heP9KP4e/VqHlFba38wBwnoR?=
 =?us-ascii?Q?03be1BZL1N5nkdHN0QFK0B8P9nBJOORqYnKprGRxWeJLIRtbI/7zFMDwyLLE?=
 =?us-ascii?Q?FYvqFdr6KQjXyHHzWTdyWerj2Tb7zNwldYaGJakh4CzAsIENlG/vmeQ1EsGS?=
 =?us-ascii?Q?MMd9GOAGUhF+ieuVPtpuz6m2BHaw13ZIDrCj3HVH/8jnHzle4HSNv7pWMh0w?=
 =?us-ascii?Q?mOKQzBnJIW97sdz7b/m2tdjtMeYJ9c30XttpeVj8lNlsuIldAXugAXaJayHk?=
 =?us-ascii?Q?a9BMrsKsOcnS/WOGB4Naw8V2Ez71s9yIyI656FUxuK86T/5Z1StxY9ESBVUK?=
 =?us-ascii?Q?aPN/h7JNXgopmWagOmd0TnTzl7nrzBPl//HLs/rB3tSm93Fd0Blig55cpOyU?=
 =?us-ascii?Q?BOg+6cdvG9ROdsvJ4fwbiQ1edKinXjHr9zEQK3Cso6WCrXiVT4zUVGA2ZJof?=
 =?us-ascii?Q?8aUYCMR2m/kF1qcVEMwqFEdiIMiq9wjDkp8lpQSmw49ycBASzxXrFq/LjRxx?=
 =?us-ascii?Q?osFMaRWAJLIlsCjxA7wHR9e39xtnvK8mK+Mdept+x5CZ37NdvDGysTGHh9By?=
 =?us-ascii?Q?DsjuRK6VglKrL9nWmqXSDb3xYH8xais6ie+vbaX8cUYZdF8vq/p3dOSlbTI4?=
 =?us-ascii?Q?t1OYmeGmeoCCAV0MHmMRaJPOx2Txha3YNZd3lqX4D+a4d53gupKj9pJRQ/T/?=
 =?us-ascii?Q?USuz+mNF2MH7R84f5KNOqfleoSkprSMcvh034928q3QygSbdfA14eIL/bIzS?=
 =?us-ascii?Q?3Z/HzSx+w6c6TGKGwNpkHPzpcPMnpvo9DuhSSuzp6ZSG4ZRDhGIRBEqWVpIY?=
 =?us-ascii?Q?2s8RaEblGXYguoCYyTDSUOjtK/WwpWPLZJxyYj1RZBqV/10raYjiHlHRiykG?=
 =?us-ascii?Q?rLt70vstZgH/m1PheX0ADHjRHo3+nNQUVhheyp2R4fjD9RB1MYbUVLb5zUIu?=
 =?us-ascii?Q?VIbWw/IXS6mhumgaDjie2WsiZv/t39uJDFlKrZjC9zPxyU5IW2CD2ENuRlbS?=
 =?us-ascii?Q?WHaAG1qGinyKayN/oG4pZXQcAG7guUfJK5y/NOXx3HseWxCnN0KdbaqKN6Hu?=
 =?us-ascii?Q?SFfNdVi43W2vJrSRl58MwHlmvNfIq2drkYFWku9sQtPEoswqARgUqLoZ2AYC?=
 =?us-ascii?Q?QNO7VvD2w+u7SC+kQqG1AH009Z7ICRDxN4WrGyYx+XPdzDECR6UsIpQzZd+C?=
 =?us-ascii?Q?Hvhzr1lttksYn5V6atyrhqXnjWmfHYckdz7Qj7NlYslqdaM93zfFQb6Arf/Q?=
 =?us-ascii?Q?tjWKnoCeHA0yPBNmvpRWe29OBc1R3L2JSyPdTm2z6X1B8j68vYZ79R8uWJPj?=
 =?us-ascii?Q?vlemFVqv7ZJhY7eD32JYZr4e4kn8GVjxe435OtQSdnHV7AQBAMdfPiIPyLWJ?=
 =?us-ascii?Q?oJPtOCOjs87Si3tFNlc0t4W+ONfoXtTZqVX1bJ1NXABtVXVgVAMKccWcLWyE?=
 =?us-ascii?Q?aMSKkJgSnAU4R8UFNb9NyctYBJrNjDrHI57jJBOc2KyDAezWgkClbKZwNC7m?=
 =?us-ascii?Q?pcptFZKXHSwN0/Q1jSMglH+T74L7fmMM2/C3c5PbkmdjPhgwRmSL92+iTv+a?=
 =?us-ascii?Q?J75AHlBcmKU6Q/t5LaZVnGPB/A6+PqJ81EeClxiJtmoF/Tib6F5gZdF3hlq6?=
 =?us-ascii?Q?FLj45Q3EBe7cKEqaOBZf8Jk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afc54ab-f422-4424-c909-08dd30462955
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 00:40:05.7242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyPPaKSr0ouiKBiS/MF1Hg6P4Ors6tOrByGxp/NsgKGGlbycO83vr6viOfX7fTtGHiSB5hqwJx+B7K/uWNlsTHLysBQ4bKhe8EHiwl5EoFBq1NgepO+YN0y4m+umehTz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7080

rsnd_adg_clk_enable() might be failed for some reasons, but it doesn't
check return value for now. In such case, we might get below WARNING from
clk_disable() during probe or suspend. Check rsnd_adg_clk_enable() return
value.

    clk_multiplier already disabled
    ...
    Call trace:
     clk_core_disable+0xd0/0xd8 (P)
     clk_disable+0x2c/0x44
     rsnd_adg_clk_control+0x80/0xf4

According to Geert, it happened only 7 times during the last 2 years.
So I have reproduced the issue and created patch by Intentionally making
an error.

Link: https://lore.kernel.org/r/CAMuHMdVUKpO2rsia+36BLFFwdMapE8LrYS0duyd0FmrxDvwEfg@mail.gmail.com
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/adg.c  | 28 +++++++++++++++++++++++-----
 sound/soc/renesas/rcar/core.c |  4 +---
 sound/soc/renesas/rcar/rsnd.h |  2 +-
 3 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 0f190abf00e75..191f212d338c2 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -374,12 +374,12 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 	return 0;
 }
 
-void rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
+int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
 {
 	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
 	struct rsnd_mod *adg_mod = rsnd_mod_get(adg);
 	struct clk *clk;
-	int i;
+	int ret = 0, i;
 
 	if (enable) {
 		rsnd_mod_bset(adg_mod, BRGCKR, 0x80770000, adg->ckr);
@@ -389,18 +389,33 @@ void rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
 
 	for_each_rsnd_clkin(clk, adg, i) {
 		if (enable) {
-			clk_prepare_enable(clk);
+			ret = clk_prepare_enable(clk);
 
 			/*
 			 * We shouldn't use clk_get_rate() under
 			 * atomic context. Let's keep it when
 			 * rsnd_adg_clk_enable() was called
 			 */
+			if (ret < 0)
+				break;
+
 			adg->clkin_rate[i] = clk_get_rate(clk);
 		} else {
-			clk_disable_unprepare(clk);
+			if (adg->clkin_rate[i])
+				clk_disable_unprepare(clk);
+
+			adg->clkin_rate[i] = 0;
 		}
 	}
+
+	/*
+	 * rsnd_adg_clk_enable() might return error (_disable() will not).
+	 * We need to rollback in such case
+	 */
+	if (ret < 0)
+		rsnd_adg_clk_disable(priv);
+
+	return ret;
 }
 
 static struct clk *rsnd_adg_create_null_clk(struct rsnd_priv *priv,
@@ -753,7 +768,10 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 	if (ret)
 		return ret;
 
-	rsnd_adg_clk_enable(priv);
+	ret = rsnd_adg_clk_enable(priv);
+	if (ret)
+		return ret;
+
 	rsnd_adg_clk_dbg_info(priv, NULL);
 
 	return 0;
diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index e2234928c9e88..d3709fd0409e4 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -2086,9 +2086,7 @@ static int __maybe_unused rsnd_resume(struct device *dev)
 {
 	struct rsnd_priv *priv = dev_get_drvdata(dev);
 
-	rsnd_adg_clk_enable(priv);
-
-	return 0;
+	return rsnd_adg_clk_enable(priv);
 }
 
 static const struct dev_pm_ops rsnd_pm_ops = {
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 3c164d8e3b16b..a5f54b65313c4 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -608,7 +608,7 @@ int rsnd_adg_set_cmd_timsel_gen2(struct rsnd_mod *cmd_mod,
 				 struct rsnd_dai_stream *io);
 #define rsnd_adg_clk_enable(priv)	rsnd_adg_clk_control(priv, 1)
 #define rsnd_adg_clk_disable(priv)	rsnd_adg_clk_control(priv, 0)
-void rsnd_adg_clk_control(struct rsnd_priv *priv, int enable);
+int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable);
 void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m);
 
 /*
-- 
2.43.0

