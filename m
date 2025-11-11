Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABE521ABB1
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821155; cv=fail; b=preU24/4Nq2bw/5ipr7+tBaWAE7dsATnc7rpEioOtqDQG3I+Pl/WzdpU6cRBido5LZj+g2O0HvJ0tZyGbLkoUnAMh/akYHN9jgLN+qisstnoFmyLsTG/KUcoVY0Zbk2vzMfKap/TmA4WWXA0KkaymC/5SXKd17W2xzxWiEBLCP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821155; c=relaxed/simple;
	bh=23YdHd637r3r07GKoMo/yMTGuAaIBmXmXx543t1pYW0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YSQIse9V5VcfcUiPHai7OF13d2A2nY5zDS6TLI7xxR7Q3b/ATdadiwpzX5EJufOp/kQvArPBXZFk7PdwFx9UE5EJ9co4mkqqgzRdYbwIxd/s1kJ5x0claR+gK5cR7txgiw2pZCYI9CoGiITEw7HpWhY4WeoXyzV9IVc2qjorqEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XtVPhpOP; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XtVPhpOP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k522RmIAKh2cwqCMj/2suxzB/YpCjPdQImsNERwHzU2BfmL8BNirvzEH0+L0m3QZfx8cae9oRa5QXLAfueGCinwa3xEEBiulXikc5hcFBEJLpjykrFgNFeTgrvn8qjW2GgBb4OSmC+XTWCFe7cafq5z8Wr9k3hKDBOiFKfMwFjOyPMkHoc60e30VMLz9/uOxRDNxWJDv/1ajib66Z+NzUMBk573wdio0S3clzeCmKNRFnK4yU7Quk6va8OZGR6+cIb/CSbMw8AYDNWl6kP+u5YkWMilNsBMXX+czfE53n/eb7mp4XmqHQFv6jNWqoq+suE5A2cEdVbsaf2PV2cjhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsKZSgBMRJgl5a7hNCZy+TKXX9+ke0ss+siwi/4VwBY=;
 b=yPmY7RuFpJRiAmBxyxT83XGw215bJJrczEfgacDnmrDaaWqxmt7L1naQH5DrdC+vMKVaZi7sW567IYQNWy0oHWQ1iM+2EEnWFfhl3ltn5XRh2HWtzaZqPLzdR6coaC4pNVcjTW+yF0pyWgf5sfj1FPjSxTdjKHqMiYpxfCSx5EeAi/T3P9ls9RNiCwMJYVDGJKKzL45hZ4KzS1+D6zgiz8sii+6oWrNfT0K9nUTUpHOyjtueRg8bTEGyiyhnoAvae+ulL6eW3yiXz4UmUBNVTd3tIGNcpgClcEwlZPTlTIeQyZDq1zk/SxoocM9+tONXe4TvBsRoLANLmSpl0fdWMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsKZSgBMRJgl5a7hNCZy+TKXX9+ke0ss+siwi/4VwBY=;
 b=XtVPhpOPVdbuZF0aFJXoZkGMADy+1uZYCXMyj6T/so9IU0bNapFCASjm07+fZrqC/hC0OWOSgJPwTtuEL8fIOmXQeCBXfVkXS2M6psVYTtHCXYe4ZcP7IMm8KeeCgAkcOD/2WVzHbhL8JWC4346SuBPu9HR3S5oOMR5+Gmxl7q8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:32:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:32:31 +0000
Message-ID: <87tsz1wgrk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 212/292] ASoC: intel: boards: bytcr_wm5102: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:32:31 +0000
X-ClientProxiedBy: TYCP286CA0179.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: f62b29a2-6864-4877-91c5-08de20b9cd0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5TwSkEAvAl64XXMVMu7KpR8WQW07SEIpaRvbdPLu4aio9C0TJwSwRsz/bMK3?=
 =?us-ascii?Q?mH09z98I1K8MyEKlDCkKgX4uHhiWjC9CzDTHqBU3u/bnNUy/mWqiC7qO7pZ1?=
 =?us-ascii?Q?x/9dND05oB8e5Kl7AMAdTDyE2DuyUIJgnsopi3uD9z7Of9899vSjHyRnhwKY?=
 =?us-ascii?Q?4ikSWdKtfv/LOeb5LmjpDde4vzOapDnZKsvZJYCYMf/U1TZrYsgW3V6fkPvU?=
 =?us-ascii?Q?5Etf+kNEUyCcviKM0wD6efL7DpodIDe4fmPyBUMm9g9aduL+AARKtQrS452T?=
 =?us-ascii?Q?AZd8nrjx1rz0KpyVScFXh5pqH9+FFMZB7C8m/xQhTu9/k8uvdDmfOYJSJh6g?=
 =?us-ascii?Q?Dp9qgj56tE0COpRskt9sQGQ1VDTK8jKDROSGpkmiRqhumPufE+R/ECB1oCf+?=
 =?us-ascii?Q?DwzVVxqpoXDlUZTBx4ur2D+Mvv2AU1Wn3A8jlTevzx47vKA9Wy03STpVKrlP?=
 =?us-ascii?Q?Q5wibYGiaFFMN9AUzw8IbnR47/NesxJzC+kFwN8MG3Exi+1P/2QSu1y/pq6f?=
 =?us-ascii?Q?ii1gI7ENVOu6mgxCvN2iEy/cB2X302aBuzWmuz4piZytzwzUUtEIREIZbcx0?=
 =?us-ascii?Q?JMphwzVGl4V6PuArJwqw7qEmT4Xt4wvOvE/mTxPADVOPL0aJlSYRWgJT6hma?=
 =?us-ascii?Q?FvkW5F+NLv7Bj9ARBN9AKS5kpuR4Wc14XtZM3xjovmp20+rq/Cq/dCW5EhdF?=
 =?us-ascii?Q?M8BHnifrc0EoXr2xx6f65GtVpEVN7KJlXnwr4Y5wEWuIxzGlo4KudlmpIQbg?=
 =?us-ascii?Q?fNWPLcvWWc7Zmag5qTRzdKRnB5uMYmr+AiSHVPdaLBsH1hItaRLH5WvsKgrS?=
 =?us-ascii?Q?bal4+3SPKEsursehDh6zP8yjH5d/f289XYL1VcenromcJEzwZixK8uOiIuvJ?=
 =?us-ascii?Q?yv7YJklMV9FIkp47X48Ca5XxIQPh9JoDur1pRR1VOPQ/HDj73EBAZqHH86ae?=
 =?us-ascii?Q?fmZn6ZTGZW3jKe6J57reHhobMB1kKQrs0kUio/aZP+QlMvkPOUhxF8INbvVw?=
 =?us-ascii?Q?os/IOfT7WiR1aV3OAdtKf7A6rLsFosLRf9Y6nDapgbqtpjJiXKtMz6vJrehO?=
 =?us-ascii?Q?vDXi7Fl7O5AXKHhddzuyaaxWuUskj0Icn6TbOBO9nOvNZ88l4DhMWCMUMZBK?=
 =?us-ascii?Q?Gz4Fog0J6twTSg7VY7ckr/QvH+aR88zJypnCf2jq0aSgPEr7uuXiD0UAs56d?=
 =?us-ascii?Q?gLlsrshXiN+v3czg8ptZf8aVdCnx1JHQqh2Fre6+DFPXLyQQGqAiWWr9dJRS?=
 =?us-ascii?Q?Prdk0UIBgdNyG2N/9uAH5vgajxcCjnQD+aXtJ5vEIIrrW0CZIUNfr8ADi7Oj?=
 =?us-ascii?Q?12L0QKP14Eeam9VxvXwclnLCNXHqUP9Mxv5TXt+b3cx20okyshTb6xkypY8M?=
 =?us-ascii?Q?iDAlVzqZFOeJIUDK3TBDPhslwgE1o9peT47pRfCyzM34HBlhbGr4fZFOTtaH?=
 =?us-ascii?Q?w3dYQ8mwH4RtIDT4Du+59axpySvL1w7RlVDMsNNIceyLmjxpfR8pm6rv60Tl?=
 =?us-ascii?Q?uvZbTxrj9xKZxsHllgeSRaRAHBl46ADkUYNk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oD+wdbWtvmU6mliG4yupRyqaWSbGlPlkabWgQ2kcY7cXkDa2yqNsl6nNepFB?=
 =?us-ascii?Q?udS+V2HN2eLtsyLB0hVSgWMf1bDmluSxZDZ1W5Ncq3O+f2PdPqI+BeJol220?=
 =?us-ascii?Q?ZGkYsT+eexMkuPRp+TzemCT71+jiNeITRh7vV4pOEGsnNeXGPKEj/xLZTNUZ?=
 =?us-ascii?Q?8WFgjsbuB+iPD7DqT7vcrZBBRaRXmYTF0tKdp4Hkv9tNBfV8ce0ElPBB1OV8?=
 =?us-ascii?Q?DhWMjggZG8FLpQtnwziKas1UHT1XgmoG91MGCcO0jWz1kctmJJrXgTP4Jd88?=
 =?us-ascii?Q?oM6ZPsO2kKSruwxJwZKoHsvLJ6X3ECSOSWqfu9CxGfWcBxBgxkTcMtS6QQgg?=
 =?us-ascii?Q?Ji+OrbLVxOLBe0UJb6tIOdZ9u5GIkugHteDF4NLKh3Z5IQmfmWepWUWJub7V?=
 =?us-ascii?Q?W3G8gC82upFV/u+nU7PilCfGo09d9q8LPO9IJqr9HJF3dafB9SgGCDaJ+MZj?=
 =?us-ascii?Q?kZzkpMkt1qH+/NUKw4w/lxl7K/TrRakWeYmaQ+YhWnNWNx/x/2hGzXXTNGbi?=
 =?us-ascii?Q?C7JZ7aTIjjxstOSKxZYuEJeJmUvPQX0RrYsiKRT2HubiklIa8SIH9ZYof2a3?=
 =?us-ascii?Q?rqStwsoyHGe04lQa3HKiZsE7I/gsHyVvW/FzAhrtYxuuJ3Jf29bREbbVALzq?=
 =?us-ascii?Q?VFHFao9ZeBl4Jx4qcWQW/9mMLi9V1STKAgTZV+G3xr57/V3eXWFoMGMW1QJE?=
 =?us-ascii?Q?Gy30y1UZ023DHO+tn1G9ak04lhPYTDbP3V/abguMOjXs9tT6Fa70CX3TYs/j?=
 =?us-ascii?Q?6P9GGMSzh4DN/LfrNbeUJUSoI5g1UMyCh2BaNLnf4/mjd+z/6BmjHHnltCrS?=
 =?us-ascii?Q?VDaq78ZAYCfjRrRGdhsrL34+dciUcwfyc4StGyP+6+dx7hcELZvIkEBoIREG?=
 =?us-ascii?Q?ijDpT0oSAURv8OBsxyvFNiOAnOXyR4NROmjQ6F4IJM6NlKH0hDSjhBXVUqC0?=
 =?us-ascii?Q?OjqllbUJUT8JaqDiU20RhbtCAEsu8q/CKnmtQnUteo+CdK3szKd8eVLmHpZl?=
 =?us-ascii?Q?mdZ/eIsp950YkLsHU62558bVq7LHdT+OY8SmYiLwxtyBKXHfh/LQUH94dX+8?=
 =?us-ascii?Q?jcX/Rek6BPeuj9cZHtW3dBOKPuq9ro/UlGf0zX3VYIWtve9h/4qBo9w3+OS1?=
 =?us-ascii?Q?xm/aS7DU+Bgqy8nsknsyOPtw2QsB/Z2NV6QyqBGvOl448pse4GII/6yPTVKF?=
 =?us-ascii?Q?A+DKxn2NA+RB3VoJgPt8sSaRwxuMiMeYlmQ4JpuRq4nRzL3HwXsLzMOHVK53?=
 =?us-ascii?Q?4WSP5jdv+Owf8Slz4H9ImkUPNfHGexMm+WPfSnS3KPPoR8g9jbPVxrhQZgER?=
 =?us-ascii?Q?uPpD7MRCoiOQTDSB330GoMEP+n1wyMj6+HNJLYbzzgs9Hw9e9+Q/42ZpwqtF?=
 =?us-ascii?Q?1WbqWftRRCRWrK3SP9fTlwKQ4FXOptEga3dVzIeI1RPx7XZ6ZFhNVI2+vbo5?=
 =?us-ascii?Q?wEKuxpsBGrMqAg8eUJ9TTwVLHhKT+B1C3L5WcIhndRlHMNtxLEYvldHaMlzx?=
 =?us-ascii?Q?ftUQRr+dmkZErOlGyE+J0JTmCI+m+RsIpcG30eU18qi/JnUEkvGMGZ4mPadS?=
 =?us-ascii?Q?abpjXGaSPt9eb2KbjBkyApXk/i/oWiPLbvUrRUVS0vBWvQZ3vCc/B7NqveZ+?=
 =?us-ascii?Q?U8Az3+tzRoPwj37N/ejSPwg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62b29a2-6864-4877-91c5-08de20b9cd0c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:32:31.5801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAp7/p2jGjWrA/U0O6O2qlQ+gnQLLqUisnMiST9TGkO3pSz6ezdaLdpRHl9zA3gqnqD57FFP1hutF3SnSN0hwRe91fKn/McKIZX6dFVdr+eTKtRwQ0ZTY4Xr1rSNPdrw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

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
 sound/soc/intel/boards/bytcr_wm5102.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 02b84c877e5f3..4879f79aef292 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -99,7 +99,7 @@ static void log_quirks(struct device *dev)
 static int byt_wm5102_spkvdd_power_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_card *card = w->dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct byt_wm5102_private *priv = snd_soc_card_get_drvdata(card);
 
 	gpiod_set_value_cansleep(priv->spkvdd_en_gpio,
@@ -150,8 +150,7 @@ static int byt_wm5102_prepare_and_enable_pll1(struct snd_soc_dai *codec_dai, int
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
 				  struct snd_kcontrol *k, int event)
 {
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct snd_soc_dai *codec_dai;
 	struct byt_wm5102_private *priv = snd_soc_card_get_drvdata(card);
 	int ret;
@@ -283,12 +282,13 @@ static struct snd_soc_jack_pin byt_wm5102_pins[] = {
 static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct byt_wm5102_private *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
 	const struct snd_soc_dapm_route *custom_map = NULL;
 	int ret, jack_type, num_routes = 0;
 
-	card->dapm.idle_bias = false;
+	snd_soc_dapm_set_idle_bias(dapm, false);
 
 	ret = snd_soc_add_card_controls(card, byt_wm5102_controls,
 					ARRAY_SIZE(byt_wm5102_controls));
@@ -307,7 +307,7 @@ static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 		num_routes = ARRAY_SIZE(byt_wm5102_intmic_in1l_hsmic_in2l_map);
 		break;
 	}
-	ret = snd_soc_dapm_add_routes(&card->dapm, custom_map, num_routes);
+	ret = snd_soc_dapm_add_routes(dapm, custom_map, num_routes);
 	if (ret)
 		return ret;
 
@@ -321,7 +321,7 @@ static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 		num_routes = ARRAY_SIZE(byt_wm5102_spk_hpout2_map);
 		break;
 	}
-	ret = snd_soc_dapm_add_routes(&card->dapm, custom_map, num_routes);
+	ret = snd_soc_dapm_add_routes(dapm, custom_map, num_routes);
 	if (ret)
 		return ret;
 
@@ -332,7 +332,7 @@ static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 		custom_map = bytcr_wm5102_ssp0_map;
 		num_routes = ARRAY_SIZE(bytcr_wm5102_ssp0_map);
 	}
-	ret = snd_soc_dapm_add_routes(&card->dapm, custom_map, num_routes);
+	ret = snd_soc_dapm_add_routes(dapm, custom_map, num_routes);
 	if (ret)
 		return ret;
 
-- 
2.43.0

