Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2532323D7D8
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821449; cv=fail; b=CA3v4NSRUnQFZaDCBRnWcXuRvQ62z24Tq20tbeCaBWKeazKEbRBGf9ydymPYg6NBJK/CGF46VGcfpiQoylfl5r3WCNsLp6/wrXuyAT9FXUQUXzu3/SJtzjTkx8PbBcsH+okxPuorBqPaLXiwN7KldmYoXKsRU8SM6yKfMHVlnJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821449; c=relaxed/simple;
	bh=CkbtzGZrEDsCfBpVqJVqUZ3kl7AtiSCw3EM2/d5Dsuk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gyP4HTn1xwK5JEkmw7eAJaYLGLw4eXjb8KDLZXJqiB5sbxU3yX5PKIbVZCdZ6lu1P4G5CRgXGujdhhhXsLtThG2anNiaqHP5HN2m3q4471nbUslW+ZJOwe3ybPIrwWIdsMoe/us+FPXP+7qOUUuEa1xnHw2NtgwDrMVYAwlFZcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fZfFWsR/; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fZfFWsR/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1egoJ/xOVxBPCBsgMyKDKP2n+rjBPnLc+EPYPleQ832d95hArGKLsE5+YnVowxmCjBD7nywbTaUyVHW32vxVi/J5DenCyYuDjaQOCnRc51PHkdZA2xitFdqsHdZc8PSF3jemifrt9rtxOpOIKusNGFZ61IVbL182vFw6Ze72XTWU2wvtWLrEpDlg7WtRpGQFGm0PZmjnCsjnvC7uQLv2q7AaUyUce09SfrC5CPcHTameFvsVm5qc54PGrbLEsdzAQPJi6rCcE9KS1CTjBcJxUy9n1An/D2fMowN7WDfUwxJyuotwfzrQ4TKJnIVnZ8PL4LvB/I3PahJJdFp+fEEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTkPGhgJB077aheXK6rKOw56pG6fb3YxDDBs1iSEL7o=;
 b=Li/kq/WKBx3qy9QAy6CovmngiNikdbjc4G8qfDYwmLraPVlIMprCzvK/9pRBbVx7kYxvzQfvk5/S4HOA4p8DmzI184qNLDuptbnyiCM8OwYSO661wUHdebBj9aaQu+1jz/0ChDgnhHx0hu77mxnkdDEvD4UJf7dKv/a938na/cCYL1KK2WDIn/em6kO8GrqGLB7FCUv7ZS8hKAsY8kFMePBRxr5gbwyE6XZGuqm9uqBqGP7/ZzIcNxseIaXxV4TZTCeOqJKaQt8bpOuP01QF6GGSF/7w/IcNDNpR5cy3RB4DcNbeAGNfL6XA5APRfjFYhursy2eOr2qCkKAE6SbHEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTkPGhgJB077aheXK6rKOw56pG6fb3YxDDBs1iSEL7o=;
 b=fZfFWsR/L8vKXtstuLEZTAomEiSCNmQs7D6fLMBqftFkcp8nA6ZAwQC5rjEJeHpeOqyJXWCxsDyXa/Cnz1GH2cxbif8VOJZWwmDozYhxVwFACs6rtIDUyBhjjOV87fbqUdVIfyqRzYG8xf5Mv7Oas+JCo5D68vWz/0lBsdMclHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16378.jpnprd01.prod.outlook.com
 (2603:1096:604:342::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.10; Tue, 11 Nov
 2025 00:37:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:37:24 +0000
Message-ID: <87ms4ts8u3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 292/292] ASoC: ux500: mop500_ab8500: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:37:24 +0000
X-ClientProxiedBy: TY4PR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:405:372::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16378:EE_
X-MS-Office365-Filtering-Correlation-Id: d03cd5cb-bd8d-448b-7336-08de20ba7bea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xtXUQN3qDkBRFROl06a9pCwj+c4Syxi+uQ5P5xOj5Lr0JvXqfOr3WjmqHJVD?=
 =?us-ascii?Q?ekxF3jDTdDOrW8B4VQ3WShV8cyqOVM3t/S/Ak9uRVS1jpYPA+U408UYIK+B5?=
 =?us-ascii?Q?4xWwaGgtTWW1Cv4bI+4bH2n1xUvXrd6T8fy4UTbi3SYVdS4Y2S1YRda2Yq3M?=
 =?us-ascii?Q?5Pfxfq7qQLHGBPhgdqqggM+TUOz3PBrSiEirwHwNRUSuug/hmEtQ+rLWOsQ+?=
 =?us-ascii?Q?jSjSm3R+ucg39eNbnCBG4NG0Fj6sGYL/fAc0uCe17HxRfEQu9s4IRJo+GgOx?=
 =?us-ascii?Q?5V8/eG1IpLh1Rc/z2y37JMN3WrWZ/hhvW9kLFjI8YHZaHIeJnLyCnFslYbsG?=
 =?us-ascii?Q?na/T/OqMKO8CXo/H9LKKkp0ZlWlqPFK+TQDG8fmZynufgmkMC4DsV9pJbcTc?=
 =?us-ascii?Q?1LP0R1/mG6Ja0uDZn61zOGnajwbMxCoYqbwj4Lhy/DXfFlNGL9tzccsBF6Gp?=
 =?us-ascii?Q?p8e+kZcucXWA1eZ12jHHdmC63Bw8oU7nvH0FT/aUtdvLfcOc7CT4XYCIhq7d?=
 =?us-ascii?Q?OOa0N2We006xc08I2VGee5tmxS+nNhus8jxhHbjkVUZlJPgvHTu2tHYIcpw+?=
 =?us-ascii?Q?cRKh1SSPqVGKzDln7hsPyz7IXUKgyrFPbs9o7GN9n4KcYpdnkN9qj5RmxgSd?=
 =?us-ascii?Q?IwrLmD1P+zUqYNTNUHcCxSnLAPzCxGsO2R6urN8DgYTgL2RKXV4XNZ4V0Y4f?=
 =?us-ascii?Q?CvWr/ds8A6t5jZcAHKpD0VFfXL9vxyihS2VLTqgqcL0i94DklM91hhO60zVY?=
 =?us-ascii?Q?SG7KG+teGLf5pj1XyqqO4HdNHpjJE1RzdIvPpQ4elDPd9Jq7i/voltnRsSg+?=
 =?us-ascii?Q?33oFQQF8EIBWcMW8/uHyxoO83kc9Q91vTnNZQzSAyILss1NUpWOGDCXJJ7vj?=
 =?us-ascii?Q?0tkS7aHSLRKTeaWySHhR1T26YwuYl/G+j6PJ/L9CPv8NCWFzlsKDbdZ0dJmS?=
 =?us-ascii?Q?37wBUYQQ7w78WLx/qkkyPIDvQaFK6ZElZSRD04UhicrC0jTcWzTs6soNj5Ur?=
 =?us-ascii?Q?aa7E8kuOFEMJWKG3PZFJVwPUbxRkWk3hAQf2jpy/IgXhjeQ+mmPTJ9m4u+tb?=
 =?us-ascii?Q?0fdml0kMUF3BZ3cRG9TU9BFIznKQZlxMDl14MhPHXa9Y89147z0FmAgUVtMG?=
 =?us-ascii?Q?+9jREwTozxRrJ4lMRAGCHqaBAfgpqcnSPsVn51/f5F5OmbvH1oPOIeCTI1kY?=
 =?us-ascii?Q?CTmoJjdE+nCEgm6o2/MtDzLL7Ry7TBB8LKkM9oXnGn1TNebCExBSVwHCF+av?=
 =?us-ascii?Q?5dKfBg6iCc9wYCUGLhDilz5X/Ij0GsBKYaLfxE/ck3/Rvti1fSrls9CIBagC?=
 =?us-ascii?Q?GIAR5aREpoe4xpquCuiSi7NoldVFJjhjm7NbS9FiiwhAatRln7xgN/wgWCHc?=
 =?us-ascii?Q?LAGJhBLdo8MARkYeAVMwIn4JGf3xQrZKb7egMO2T9kfNy575SElj9n/eW1+D?=
 =?us-ascii?Q?Dn6zyyxqYbHsybyn61vV2ZgJdtCdEvZOGpapHTcouiUa2HTSnH2Eb9iUxHM3?=
 =?us-ascii?Q?xEQzcJ+Zi8wOE9/Z+1ss0eW0z+OXBWXcAM50?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PUEtIVu184fWeyLyCpsXTwEGQ4xzDUJIkS4GKQLnQ/teiVMFQfF+BPkK/qep?=
 =?us-ascii?Q?BKEIsq0zFd4bC0A/Fj9dlCmwLX+0MVUW3eFWvRySL8QndRmb2wTg80E/meCm?=
 =?us-ascii?Q?e31ch6BaF23iCATfeEo9wJAKrofAq38SyLEOD4pINCGgVhCVL2DxJ0yqSbaa?=
 =?us-ascii?Q?mmTP6F5YWGBrElHoluggH/zUmrFttA9phHrk61BvH2lyhfl8fU6KHRTeE+SJ?=
 =?us-ascii?Q?9HcodeDKdpsaZiVaPAjLb9zr0lg4QwSXck+F6zjLpuW6llu37S04f26Dfjfk?=
 =?us-ascii?Q?vTg5SBnCAUVf8odUrkrWRh5J+ckMqIXR2dlk6fuaK0ScTF+TrWpL9v1sESju?=
 =?us-ascii?Q?vWT6MKf0wq6xkyvfmPWFSRWEubWhmWet3U/wNWPTsdMk8emprXb1C4QbmuS4?=
 =?us-ascii?Q?tDH3FroLziv9S+2+3nAgEWu280A7k4RaOHONvVwcPye6dppwF+boYCTC0HpL?=
 =?us-ascii?Q?6YGGnl9XCDF7cwHaH/URd3F7eLlBSyfrY+pQ8ZK24n0eX2SSmLM4lRkkIBtt?=
 =?us-ascii?Q?IZ/Xfio175gnBbv3+6+kdJr7TigfdLf6GTsvSEKTwJpaNVZJO21y1VxXNpWY?=
 =?us-ascii?Q?nvi7cttsiV/ZvdRVYjqA+0Ln9eMvSoMWBtqUDaHzZhekogkK3BdRwpGfZy30?=
 =?us-ascii?Q?M9WYKGpWJU78OlIUR+MGs1Wxyvf2SXiDK8zajDU6lNfcfSkXym+prOJcm+vx?=
 =?us-ascii?Q?adBd4M2B6ySXEJTBQbNqFVbfdd87+G+Ap1Tq9hDIijBPK0aJDpsv0lMycmaw?=
 =?us-ascii?Q?Wihjj4err4lBsYKZcFC2dKMxNd2SrbYYVCk5FXj2J1reerVzgwtsMYMsMN7z?=
 =?us-ascii?Q?Jae75gvHkQcVeLH2CyLLFQi6t7vaQaiNnfVafMrO13R9y4GT6Psv67GhNCKK?=
 =?us-ascii?Q?v3QKkE8yF/iEtjRQUSd29/lrij8dL9Kj1oBTD8TJ06AkDaHpvz+AsNQZFJXf?=
 =?us-ascii?Q?awuH+jqm97X/mrzMUGUZn2tHwVHCrzGwq4U8xtENXB1SAQgsaBpyBqgU8JHz?=
 =?us-ascii?Q?7RtGCZIR2qoqrYfYI/rMvU7IozQOSbJevFiQ2qDiJA98fVYPkjgM6Sl2aQAb?=
 =?us-ascii?Q?7nVRwHmDs1iHnIGZQKH0evz7hLLntmLa3IlB+qqDOK8nTTsHQ2QKa5qKeVnr?=
 =?us-ascii?Q?irXLG+ycWgMg3dpI+p1OIJPt0azn+GxnBdE7ncUNZnkDYf+Vl90ZiMIL0ooK?=
 =?us-ascii?Q?O0QLRd9iSSPY10p4J2sQwWORGJfIPUKMOMnHAkzwFl9xS7sNcmZB2uvDfvXH?=
 =?us-ascii?Q?qJDMerCKCPSJ49SLPipagBLhukW6NAh3MOuxHPwQD2nn70jl0XcDn8ay3CDl?=
 =?us-ascii?Q?806+STG5TH0roO/JLUc4KJeCe0WkL3cbLrP+2s0sJQmUq3NlXcgxkp6W96yD?=
 =?us-ascii?Q?IT5Kp+Tp7MG1/iKPSDVxS80yH9NR1UNVQG//nCNnZWwSibkiHIa7ZWxsmp/F?=
 =?us-ascii?Q?xaQnjCnlpgvIWgIQvUK76Tj8VnfZzu9r2FbeEk4sGthP4kzIS/JxXJZqoPzK?=
 =?us-ascii?Q?p804Rm29Xe/UmA8+spr7A7AqpASTXiLnHXf4X7mzhscKbWHR4+pWeaLvcUjK?=
 =?us-ascii?Q?fXEbqBwstyZBSHkWshPRyDb/ASYcL983aKrDWoQSq/mM9gtuTeRiYtnd0Ome?=
 =?us-ascii?Q?SdgjzU+iJIkh96dl596Yhl0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d03cd5cb-bd8d-448b-7336-08de20ba7bea
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:37:24.9390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3eLR+a217n8SHOup/pFMcuJUJtNkWtnEx+xbho0NsOcT9ym+FETIQSIAuk+yu969Qfw++dlKN3zREnf0103hOq6vYRlmaatjNTFmXCSOsX8wIwRgOoaM+3QmmgH4E6N5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16378

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ux500/mop500_ab8500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ux500/mop500_ab8500.c b/sound/soc/ux500/mop500_ab8500.c
index 5246f73ef12e1..2e6ed19a18cdd 100644
--- a/sound/soc/ux500/mop500_ab8500.c
+++ b/sound/soc/ux500/mop500_ab8500.c
@@ -357,7 +357,7 @@ const struct snd_soc_ops mop500_ab8500_ops[] = {
 
 int mop500_ab8500_machine_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
 	struct device *dev = rtd->card->dev;
 	struct mop500_ab8500_drvdata *drvdata;
 	int ret;
-- 
2.43.0

