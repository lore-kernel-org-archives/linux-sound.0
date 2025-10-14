Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C0330B50C
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416081; cv=fail; b=qlUZ2hiRmJ3BJzz/sE6JuJRlfhhX4TxkZ1uhoZ/jnxc2Zcysr4iI5BXtiNIYzzA6ILMR1VPQR33slkNtyOCuN4MJc1SWUyqUzmHkJN+HWup6UcmoQz9hnG7YEG5PSaZKKuCfVGew0bBR5dICxDUkc96UHCc2PIm5y0W0C8KKiDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416081; c=relaxed/simple;
	bh=TaHyiWrtMH92V6qPlmSion2+8mbZBo0YbYe2MQjfCgM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ohcsy4XZv1LaomZKWtZloqyknhY/0OAtGOS0nj0zcM9EuczSFLzoeeL1Z47qcHo57Ta5CZ65ubDJMNAa2R0BQctRBE3bEbTsWq/ZArixOzmEpkhjWxAXTJI2UhoaX0+paHNkbaNIhmJhqz0/e2Ow4RIb4ZEVMzh6L5iMiivonNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pp8lMVnx; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pp8lMVnx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQDDD/S9kQSfdIjCrj5T/MyNOqHO+HU5ev4M0ZZ6fAp3jzMjvt3Vnf2dfJ/Sp2dCiWp605wqLDruuWjwIwegxNsE1x8bCiUdrdcC039BzkbHXD3MaBPpqXySK8vYqIP24/YM0pxd/d0IVLwpTRfEaZEcUYVzBHGyfQOHu+rldSEq424/qSg3BtTjXKUNnY5btv+ppm0khbLgeQZSQEo6cEs2XhV8BB/N2lPDfyMxZgoyJ6m8Da5aJ+o2+20cEMp8lxc2orbFC4kwTseOqDS7qdJN6SwnkdTH8KvWoq3d43cpwqIzQknnjWNxqNhRnvBam0/ybX8ANs9XkXs5mvwEiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SywZN7ao2gzADcHrbs+tARdBEBBY5V0QP1PkEHhheIk=;
 b=Bj2GF5H7dKD1Jk2BogF78WfnkwBD/4CNRiokgCjwUuaz/vg1eRk09ArHd5tDlkZGcHhdg+nEVm/OqGFoJRAnXUJsJAsyAoFY6adpdrUwD54WwXx8OJQfLhe0uEW0aYfIgnABrml1xxtJg6o5yIm71+jf5cLPPI7bgt7KeCgtryCwAUdKRI1uMRgiJZo62paAEQtNpIW7ApPE901UGxHpVOn6HbLLS/C1Kptk/Ohg0F1f2wD1gn3+gxefuXBd1jzSoc12LWSEaQOmMlaovCnFqwaRR21q69ueQwk3Qt0l9t2s3FI6tNmf61gIQVEodd6GR5LyxpJa4abmmZlEyvuY6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SywZN7ao2gzADcHrbs+tARdBEBBY5V0QP1PkEHhheIk=;
 b=pp8lMVnxvXwn8KMbsinnVdYD5cOE96yYbD3DpHIcdYxugOIFwku+/dOsSj7+AeJVETUBxnwV5X3tQsO/dk5XCJBMwjh4NuV/4pADym8U10zvQES23nSLWu9EcxMPKD6EdigZvjZaBFQTCNs38wzGI3I44e5edB0NjHHPg0TP6zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7268.jpnprd01.prod.outlook.com
 (2603:1096:400:f3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:56 +0000
Message-ID: <87ecr6m7jn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 137/139] ASoC: tegra: tegra210: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:56 +0000
X-ClientProxiedBy: TYXPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:403:a::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 939f1d42-9b10-48f3-91ba-08de0ada0ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vvw9d5zLxexEgePafbdXtRS8TRjKiT2Fk+t4KNo7HFhE8HCvBEHv9sQZSrSl?=
 =?us-ascii?Q?CMILlsUGXrJ22tu4+iYTbZuvo2Vk4Es/P+UjbPPHZtdeV1koMRnKe0thdri4?=
 =?us-ascii?Q?ogLmM5VS8zm922FLehZEI4GcFmxRQIEDr358yp1TZIP+KIkjSWKBNtj/wZ9s?=
 =?us-ascii?Q?w0KKi7ESpNdCahYXgiEcVrF1P31ra5jU9QOJcxumPuYIpizhRN3mCt/ogDSg?=
 =?us-ascii?Q?YnYuAKEK29zJZhFR+Y8HFH5AwNTw1dpNkdWF01Re/Ecw+tM2mI5flraIATii?=
 =?us-ascii?Q?rkjUO9rUJquVTL5pwFsjmKBnPOMajC6Op7pqkCA6ATolQRac3pG6ZEND3VPF?=
 =?us-ascii?Q?OYh95knKWI2tDPgUYC2oI7aC3zAsknFnD8JPceBoX7R8/y3tTRcqYJ6BVJww?=
 =?us-ascii?Q?beDjxnMxS9KbqLYmcMELHTSOmNzMiNzni8ndTxqzvq/hJJDNYCb9yN9bRPmT?=
 =?us-ascii?Q?T/JwqpaRByujf9ix+PI20Flt3Nb6KnOG/NpkQYWPi+5lJdScBkGqa83kKI+o?=
 =?us-ascii?Q?WsNZel9Xhj0Vm2VPWGh4ObXODlPMku/RKJg23MLMSd6dxJIl3MPoFAZisO9q?=
 =?us-ascii?Q?xcbPkKeCa/UieRg0y6W8cuU6D8yChvrDqvXu5HJF4HFvt+SyoZNUIJf4tbiq?=
 =?us-ascii?Q?a+yUZgtSEKkna5lRScQtJ9DKuUuJHMTTWfRfj3TD9Xx2QNmyql2E0THr4ZYw?=
 =?us-ascii?Q?fPWasyOJCG9dn7zhhEisLVADFURotBE2IRgle97ZSYNkrbJHjQ2Xna0SHEuc?=
 =?us-ascii?Q?wPlMk1dXPESe/On7vF27AbA9lB1J2mFzQV6GtLJTXpj6XGxjObKb8ONzjEXe?=
 =?us-ascii?Q?T0iCwXIs/tS+R8GN4JIN27Ub+6ZT5MLB1JMsCpDQ48hWC52aTHws5NDOjt10?=
 =?us-ascii?Q?Xmy9nAgRdlzLM41DBMyy7/6aYPfm5GEWdAJmX252XJ9l+Qr+Aopw7WIM8G2Q?=
 =?us-ascii?Q?DZpGlh0fvdg64fHREpzjY1jMIOzMFuRfuNu7ZL449lsIVQUq8/9dZay0Ma+2?=
 =?us-ascii?Q?boj07GQVYZfpTiEJaNnnAv889eATzfoTD+9NtvUcuu6X2H4sLKmxHte8DBNe?=
 =?us-ascii?Q?H2cSrVmFdpqW1jZM/Il7pvKtnpWPDtuGnE83zo7te5O4CtglmOjPXL5WqHXH?=
 =?us-ascii?Q?v233ZYHCvGYMfhpwLS8oirAyY1q54gAZGpwsOgyJuF1rlAAW62WOadLeeMmK?=
 =?us-ascii?Q?/i4hdNF48oD4ceaaotjmH3map6OZTWkniXkGQzPLnZjO2YL2RQPBzc8D2Kp/?=
 =?us-ascii?Q?hTGW83rinKTHCM1QBYgYK/p2dI9U6JPuVCUVQnPG4J178CjcL0bie7OJ1exO?=
 =?us-ascii?Q?zclAENI4C/L6LLSZVlNW7ZspiZnsbEQ4qOwbGvSFApgG0x2Va38optCQr/yl?=
 =?us-ascii?Q?Rj37gC/Sdm/3ZJ2xix5o2J+zliRqJnlYr3mKvDCYLlO6mJQOLl+bf6R1a54K?=
 =?us-ascii?Q?QH8sBotHEhJfaOUKAikP1VnMGunFFvKk6I4v7Qi5sjVqAqVuO5hOPiW2Vks8?=
 =?us-ascii?Q?gYTnN/2jXcGSRz67bw7+uPDqcS+wsWOc1xOA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tjqCvqA68q66zjd5XvfluVnfqhxNxlkiuoy6eS6pvZDdm1DeWWn+zkCI1NcU?=
 =?us-ascii?Q?zv+WHIK/hZls9ylxAGOCXEwupzKM9yYfcPJGU7r2ELpm1aeXbB4zYuK6XSp5?=
 =?us-ascii?Q?LRn7uVqHO+j4s9bugO6YOdS5x/fBK58yxDV5av0T3naxfdl8s2JSpeALsjok?=
 =?us-ascii?Q?irnIKxHOp7Lu98vf1thWllaK3Tk1nONBlsbR06n8y+DpWa0XwfebxnxHlwWp?=
 =?us-ascii?Q?1vDpt8p1tEsiOgp8PStJANLk/lhX5dV419MDkfYpTa9vPZYp3+chaWdUK7fT?=
 =?us-ascii?Q?CHUmNRSQLedeAb1UN7+3y+pDCPwbGfd8iJHGizNsOFEgoQ741kZMOAyfxvW6?=
 =?us-ascii?Q?xLvnlVvz6JbUC/Qx21R350q6Hlc8b+sipE6Hu+BE1tknX55VkqEWK+/l3ica?=
 =?us-ascii?Q?Lof4ZUipeyZadWH6aYYwZQI+oNMrhS8H1WzW7lj0CFBxlDMJMLCCuoDcMEwl?=
 =?us-ascii?Q?DDYegrBMHL8AFTh3V8Be6Wg0BDyp52yGEdD4Qrz3dvCu5i8IGmQILArLNHVf?=
 =?us-ascii?Q?oMHhnMyLs8+FGPVhqAgDoicXLR1hy9z9mZewgxcmJdl2kQKpdWPzo6x0QLZF?=
 =?us-ascii?Q?fR3AR+DuZoMY1GSUcuCmkuVMTusHcXaR9kYQbGTAaVZkySLWVlkkrU5/cD1f?=
 =?us-ascii?Q?6LxaXyKBEBGpSgB+NDLjEtEGvDPDigHU25aavnqDrtVRRBw/sUgO8y7o0XuP?=
 =?us-ascii?Q?IgA3bYE8f8JqqJGuKtSmYTk4IXgC14dnByQ9mA5yN//yZHCH16LYnPqHxSIO?=
 =?us-ascii?Q?7qCxniKXlA4b40kOfe4DmwUkiJoL8UJFqpr8nNosJPx76vRzA+mga9GAysRS?=
 =?us-ascii?Q?PqfqDEN48fpcCrAHW1oA1mJh9EdcxIMRfF8wtYvJ27PG1BIEMjRZTlhIVVb1?=
 =?us-ascii?Q?LBUIymxi4hDapOz/tEYkxLnNRDB34luBdEmAASd/xLspycZiTlGrDXO301FS?=
 =?us-ascii?Q?/j7tmlc+5gSllZis3LLX/z94kNknv482va2aYLId9qjoMAlbEO+wjeQpOk2F?=
 =?us-ascii?Q?blrrsuBoK/5IRiTGCvy6HIHhDEcvz16hJFY5ldLT+MLtSHy8Y5RcprrA1Com?=
 =?us-ascii?Q?K3Pt90B6Y7/XdMtBFhVGzt3fXApJD+IAUXAJot98EE4q8D4G0FnZXfvVNADx?=
 =?us-ascii?Q?iQ6zsrfm/WzFpwkvXaEma1Gdekk1OZcKWSEe89L0/lt+uM/lEVDRm2degjwI?=
 =?us-ascii?Q?y6KZDZUj8YdCZvNSNmisT5zfjA2tl7fvrk6ZEBaxs169Yn1c/udu9atIVl6H?=
 =?us-ascii?Q?g1dmfQN35HyG6AjIAZLz1rAacJFAaiMQ3hFVgCgWacKM0PLCGy2taixQyCO5?=
 =?us-ascii?Q?tZlSnfqhTlGve3tlGhaD6Q3nWpzmWkn66mqjJhJyKVhMfyGLqjX5hYw6LRpQ?=
 =?us-ascii?Q?49z+osFo+Bs2Dj3fewecZlN3FaY59VS5BG0SC0yo+ah+ZBxqoXX/nENt2M0F?=
 =?us-ascii?Q?+JuP+iEq+MSkhMUkSyt4J6d01BJh6s07AVdLtiQf3UyV5o8xu9A/vWzyM4P1?=
 =?us-ascii?Q?1lDOjnz6C4Ch5AoZzuj0N0yPMsXdZXV0Bsw+YKnvE0IUNVcSj1uyDmq5DaID?=
 =?us-ascii?Q?7VMnNACzOS4BVPtTaHrOmYCHo4Yf32txnpu4tfdA0jUlZ0cnrc/YPphUnCKk?=
 =?us-ascii?Q?o24aIYnV4jahdrrXYbreYVg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939f1d42-9b10-48f3-91ba-08de0ada0ca2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:56.5424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAIYgnzch+OZe5OwsYfULvQez9yb3N5wZs9WOO8jTOtt1JzWTxIfaa5ZzQECu2yWr2n84hD/AhZLDZX2puGCF1UZQmVM+uYcysVHD+MapBaC6suSs8z+EpaqCW+oIIGP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7268

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra210_admaif.c | 16 ++++++++--------
 sound/soc/tegra/tegra210_adx.c    |  4 ++--
 sound/soc/tegra/tegra210_amx.c    |  4 ++--
 sound/soc/tegra/tegra210_dmic.c   | 24 +++++++++++------------
 sound/soc/tegra/tegra210_i2s.c    | 32 +++++++++++++++----------------
 sound/soc/tegra/tegra210_mbdrc.c  | 24 +++++++++++------------
 sound/soc/tegra/tegra210_mixer.c  |  4 ++--
 sound/soc/tegra/tegra210_mvc.c    | 12 ++++++------
 sound/soc/tegra/tegra210_ope.c    |  4 ++--
 sound/soc/tegra/tegra210_peq.c    |  8 ++++----
 sound/soc/tegra/tegra210_sfc.c    | 16 ++++++++--------
 11 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index f88d6a2356e07..f9f6040c4e346 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -493,7 +493,7 @@ static int tegra_admaif_trigger(struct snd_pcm_substream *substream, int cmd,
 static int tegra210_admaif_pget_mono_to_stereo(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
 
@@ -506,7 +506,7 @@ static int tegra210_admaif_pget_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra210_admaif_pput_mono_to_stereo(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
 	unsigned int value = ucontrol->value.enumerated.item[0];
@@ -522,7 +522,7 @@ static int tegra210_admaif_pput_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra210_admaif_cget_mono_to_stereo(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
 
@@ -535,7 +535,7 @@ static int tegra210_admaif_cget_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra210_admaif_cput_mono_to_stereo(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
 	unsigned int value = ucontrol->value.enumerated.item[0];
@@ -551,7 +551,7 @@ static int tegra210_admaif_cput_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra210_admaif_pget_stereo_to_mono(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
 
@@ -564,7 +564,7 @@ static int tegra210_admaif_pget_stereo_to_mono(struct snd_kcontrol *kcontrol,
 static int tegra210_admaif_pput_stereo_to_mono(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
 	unsigned int value = ucontrol->value.enumerated.item[0];
@@ -580,7 +580,7 @@ static int tegra210_admaif_pput_stereo_to_mono(struct snd_kcontrol *kcontrol,
 static int tegra210_admaif_cget_stereo_to_mono(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
 
@@ -593,7 +593,7 @@ static int tegra210_admaif_cget_stereo_to_mono(struct snd_kcontrol *kcontrol,
 static int tegra210_admaif_cput_stereo_to_mono(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
 	unsigned int value = ucontrol->value.enumerated.item[0];
diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index ad7cd86550478..6c9a410085bc5 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -186,7 +186,7 @@ static int tegra210_adx_in_hw_params(struct snd_pcm_substream *substream,
 static int tegra210_adx_get_byte_map(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_adx *adx = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_mixer_control *mc;
 	unsigned char *bytes_map = (unsigned char *)adx->map;
@@ -216,7 +216,7 @@ static int tegra210_adx_get_byte_map(struct snd_kcontrol *kcontrol,
 static int tegra210_adx_put_byte_map(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_adx *adx = snd_soc_component_get_drvdata(cmpnt);
 	unsigned char *bytes_map = (unsigned char *)adx->map;
 	int value = ucontrol->value.integer.value[0];
diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index 7f558c40e097b..c94f8c84e04f4 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -208,7 +208,7 @@ static int tegra210_amx_out_hw_params(struct snd_pcm_substream *substream,
 static int tegra210_amx_get_byte_map(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct tegra210_amx *amx = snd_soc_component_get_drvdata(cmpnt);
@@ -241,7 +241,7 @@ static int tegra210_amx_put_byte_map(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_amx *amx = snd_soc_component_get_drvdata(cmpnt);
 	unsigned char *bytes_map = (unsigned char *)amx->map;
 	int reg = mc->reg;
diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index e4a1445712659..66fff53aeaa69 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -160,7 +160,7 @@ static int tegra210_dmic_hw_params(struct snd_pcm_substream *substream,
 static int tegra210_dmic_get_boost_gain(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 
 	ucontrol->value.integer.value[0] = dmic->boost_gain;
@@ -171,7 +171,7 @@ static int tegra210_dmic_get_boost_gain(struct snd_kcontrol *kcontrol,
 static int tegra210_dmic_put_boost_gain(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 	int value = ucontrol->value.integer.value[0];
 
@@ -186,7 +186,7 @@ static int tegra210_dmic_put_boost_gain(struct snd_kcontrol *kcontrol,
 static int tegra210_dmic_get_ch_select(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 
 	ucontrol->value.enumerated.item[0] = dmic->ch_select;
@@ -197,7 +197,7 @@ static int tegra210_dmic_get_ch_select(struct snd_kcontrol *kcontrol,
 static int tegra210_dmic_put_ch_select(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -212,7 +212,7 @@ static int tegra210_dmic_put_ch_select(struct snd_kcontrol *kcontrol,
 static int tegra210_dmic_get_mono_to_stereo(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 
 	ucontrol->value.enumerated.item[0] = dmic->mono_to_stereo;
@@ -223,7 +223,7 @@ static int tegra210_dmic_get_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra210_dmic_put_mono_to_stereo(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -238,7 +238,7 @@ static int tegra210_dmic_put_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra210_dmic_get_stereo_to_mono(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 
 	ucontrol->value.enumerated.item[0] = dmic->stereo_to_mono;
@@ -249,7 +249,7 @@ static int tegra210_dmic_get_stereo_to_mono(struct snd_kcontrol *kcontrol,
 static int tegra210_dmic_put_stereo_to_mono(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -264,7 +264,7 @@ static int tegra210_dmic_put_stereo_to_mono(struct snd_kcontrol *kcontrol,
 static int tegra210_dmic_get_osr_val(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 
 	ucontrol->value.enumerated.item[0] = dmic->osr_val;
@@ -275,7 +275,7 @@ static int tegra210_dmic_get_osr_val(struct snd_kcontrol *kcontrol,
 static int tegra210_dmic_put_osr_val(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -290,7 +290,7 @@ static int tegra210_dmic_put_osr_val(struct snd_kcontrol *kcontrol,
 static int tegra210_dmic_get_pol_sel(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 
 	ucontrol->value.enumerated.item[0] = dmic->lrsel;
@@ -301,7 +301,7 @@ static int tegra210_dmic_get_pol_sel(struct snd_kcontrol *kcontrol,
 static int tegra210_dmic_put_pol_sel(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 100277c390017..b91e0e6cd7fe2 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -319,7 +319,7 @@ static int tegra210_i2s_set_tdm_slot(struct snd_soc_dai *dai,
 static int tegra210_i2s_get_loopback(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 
 	ucontrol->value.integer.value[0] = i2s->loopback;
@@ -330,7 +330,7 @@ static int tegra210_i2s_get_loopback(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_put_loopback(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 	int value = ucontrol->value.integer.value[0];
 
@@ -348,7 +348,7 @@ static int tegra210_i2s_put_loopback(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_get_fsync_width(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 
 	ucontrol->value.integer.value[0] = i2s->fsync_width;
@@ -359,7 +359,7 @@ static int tegra210_i2s_get_fsync_width(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_put_fsync_width(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 	int value = ucontrol->value.integer.value[0];
 
@@ -386,7 +386,7 @@ static int tegra210_i2s_put_fsync_width(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_cget_stereo_to_mono(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 
 	ucontrol->value.enumerated.item[0] = i2s->stereo_to_mono[I2S_TX_PATH];
@@ -397,7 +397,7 @@ static int tegra210_i2s_cget_stereo_to_mono(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_cput_stereo_to_mono(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -412,7 +412,7 @@ static int tegra210_i2s_cput_stereo_to_mono(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_cget_mono_to_stereo(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 
 	ucontrol->value.enumerated.item[0] = i2s->mono_to_stereo[I2S_TX_PATH];
@@ -423,7 +423,7 @@ static int tegra210_i2s_cget_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_cput_mono_to_stereo(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -438,7 +438,7 @@ static int tegra210_i2s_cput_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_pget_stereo_to_mono(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 
 	ucontrol->value.enumerated.item[0] = i2s->stereo_to_mono[I2S_RX_PATH];
@@ -449,7 +449,7 @@ static int tegra210_i2s_pget_stereo_to_mono(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_pput_stereo_to_mono(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -464,7 +464,7 @@ static int tegra210_i2s_pput_stereo_to_mono(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_pget_mono_to_stereo(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 
 	ucontrol->value.enumerated.item[0] = i2s->mono_to_stereo[I2S_RX_PATH];
@@ -475,7 +475,7 @@ static int tegra210_i2s_pget_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_pput_mono_to_stereo(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -490,7 +490,7 @@ static int tegra210_i2s_pput_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_pget_fifo_th(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 
 	ucontrol->value.integer.value[0] = i2s->rx_fifo_th;
@@ -501,7 +501,7 @@ static int tegra210_i2s_pget_fifo_th(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_pput_fifo_th(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 	int value = ucontrol->value.integer.value[0];
 
@@ -516,7 +516,7 @@ static int tegra210_i2s_pput_fifo_th(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_get_bclk_ratio(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 
 	ucontrol->value.integer.value[0] = i2s->bclk_ratio;
@@ -527,7 +527,7 @@ static int tegra210_i2s_get_bclk_ratio(struct snd_kcontrol *kcontrol,
 static int tegra210_i2s_put_bclk_ratio(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *compnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 	int value = ucontrol->value.integer.value[0];
 
diff --git a/sound/soc/tegra/tegra210_mbdrc.c b/sound/soc/tegra/tegra210_mbdrc.c
index eeacb12202685..09fe3c5cf540d 100644
--- a/sound/soc/tegra/tegra210_mbdrc.c
+++ b/sound/soc/tegra/tegra210_mbdrc.c
@@ -235,7 +235,7 @@ static int tegra210_mbdrc_get(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int val;
 
@@ -251,7 +251,7 @@ static int tegra210_mbdrc_put(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int val = ucontrol->value.integer.value[0];
 	bool change = false;
@@ -267,7 +267,7 @@ static int tegra210_mbdrc_put(struct snd_kcontrol *kcontrol,
 static int tegra210_mbdrc_get_enum(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int val;
@@ -282,7 +282,7 @@ static int tegra210_mbdrc_get_enum(struct snd_kcontrol *kcontrol,
 static int tegra210_mbdrc_put_enum(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	bool change = false;
@@ -305,7 +305,7 @@ static int tegra210_mbdrc_band_params_get(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	u32 *data = (u32 *)ucontrol->value.bytes.data;
 	u32 regs = params->soc.base;
@@ -326,7 +326,7 @@ static int tegra210_mbdrc_band_params_put(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	u32 *data = (u32 *)ucontrol->value.bytes.data;
 	u32 regs = params->soc.base;
@@ -351,7 +351,7 @@ static int tegra210_mbdrc_threshold_get(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	u32 *data = (u32 *)ucontrol->value.bytes.data;
 	u32 regs = params->soc.base;
@@ -379,7 +379,7 @@ static int tegra210_mbdrc_threshold_put(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	u32 *data = (u32 *)ucontrol->value.bytes.data;
 	u32 regs = params->soc.base;
@@ -412,7 +412,7 @@ static int tegra210_mbdrc_biquad_coeffs_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	u32 *data = (u32 *)ucontrol->value.bytes.data;
 
 	memset(data, 0, params->soc.num_regs * cmpnt->val_bytes);
@@ -424,7 +424,7 @@ static int tegra210_mbdrc_biquad_coeffs_put(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	u32 reg_ctrl = params->soc.base;
 	u32 reg_data = reg_ctrl + cmpnt->val_bytes;
@@ -452,7 +452,7 @@ static int tegra210_mbdrc_vol_get(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	int val;
 
@@ -469,7 +469,7 @@ static int tegra210_mbdrc_vol_put(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	int val = ucontrol->value.integer.value[0];
 	bool change = false;
diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index 95d69a7e027f5..ff8e9f2d7abfd 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -178,7 +178,7 @@ static int tegra210_mixer_get_gain(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int reg = mc->reg;
 	unsigned int i;
@@ -197,7 +197,7 @@ static int tegra210_mixer_apply_gain(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int reg = mc->reg, id;
 	int err;
diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 35b14c8396f43..779d4c199da93 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -109,7 +109,7 @@ static void tegra210_mvc_conv_vol(struct tegra210_mvc *mvc, u8 chan, s32 val)
 
 static u32 tegra210_mvc_get_ctrl_reg(struct snd_kcontrol *kcontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
 	u32 val;
 
@@ -194,7 +194,7 @@ static int tegra210_mvc_update_mute(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol,
 				    bool per_chan_ctrl)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
 	u32 mute_val = ucontrol->value.integer.value[0];
 	u32 per_ch_ctrl_val;
@@ -260,7 +260,7 @@ static int tegra210_mvc_get_vol(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
 	u8 chan = TEGRA210_MVC_GET_CHAN(mc->reg, TEGRA210_MVC_TARGET_VOL);
 	s32 val = mvc->volume[chan];
@@ -289,7 +289,7 @@ static int tegra210_mvc_update_vol(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
 	u8 chan = TEGRA210_MVC_GET_CHAN(mc->reg, TEGRA210_MVC_TARGET_VOL);
 	int old_volume = mvc->volume[chan];
@@ -394,7 +394,7 @@ static void tegra210_mvc_reset_vol_settings(struct tegra210_mvc *mvc,
 static int tegra210_mvc_get_curve_type(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
 
 	ucontrol->value.enumerated.item[0] = mvc->curve_type;
@@ -405,7 +405,7 @@ static int tegra210_mvc_get_curve_type(struct snd_kcontrol *kcontrol,
 static int tegra210_mvc_put_curve_type(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int value;
 
diff --git a/sound/soc/tegra/tegra210_ope.c b/sound/soc/tegra/tegra210_ope.c
index 5036bcfe08289..27db70af27469 100644
--- a/sound/soc/tegra/tegra210_ope.c
+++ b/sound/soc/tegra/tegra210_ope.c
@@ -202,7 +202,7 @@ static const struct soc_enum tegra210_ope_data_dir_enum =
 static int tegra210_ope_get_data_dir(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 
 	ucontrol->value.enumerated.item[0] = ope->data_dir;
@@ -213,7 +213,7 @@ static int tegra210_ope_get_data_dir(struct snd_kcontrol *kcontrol,
 static int tegra210_ope_put_data_dir(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
diff --git a/sound/soc/tegra/tegra210_peq.c b/sound/soc/tegra/tegra210_peq.c
index bd8007cc49e1c..9a05e6913276c 100644
--- a/sound/soc/tegra/tegra210_peq.c
+++ b/sound/soc/tegra/tegra210_peq.c
@@ -100,7 +100,7 @@ static int tegra210_peq_get(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int mask = (1 << fls(mc->max)) - 1;
 	unsigned int val;
@@ -123,7 +123,7 @@ static int tegra210_peq_put(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int mask = (1 << fls(mc->max)) - 1;
 	bool change = false;
@@ -146,7 +146,7 @@ static int tegra210_peq_ram_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	u32 i, reg_ctrl = params->soc.base;
 	u32 reg_data = reg_ctrl + cmpnt->val_bytes;
@@ -169,7 +169,7 @@ static int tegra210_peq_ram_put(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
 	u32 i, reg_ctrl = params->soc.base;
 	u32 reg_data = reg_ctrl + cmpnt->val_bytes;
diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index a0bd36f12c68f..d6341968bebee 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3276,7 +3276,7 @@ static int tegra210_sfc_init(struct snd_soc_dapm_widget *w,
 static int tegra210_sfc_iget_stereo_to_mono(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
 
 	ucontrol->value.enumerated.item[0] = sfc->stereo_to_mono[SFC_RX_PATH];
@@ -3287,7 +3287,7 @@ static int tegra210_sfc_iget_stereo_to_mono(struct snd_kcontrol *kcontrol,
 static int tegra210_sfc_iput_stereo_to_mono(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -3302,7 +3302,7 @@ static int tegra210_sfc_iput_stereo_to_mono(struct snd_kcontrol *kcontrol,
 static int tegra210_sfc_iget_mono_to_stereo(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
 
 	ucontrol->value.enumerated.item[0] = sfc->mono_to_stereo[SFC_RX_PATH];
@@ -3313,7 +3313,7 @@ static int tegra210_sfc_iget_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra210_sfc_iput_mono_to_stereo(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -3328,7 +3328,7 @@ static int tegra210_sfc_iput_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra210_sfc_oget_stereo_to_mono(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
 
 	ucontrol->value.enumerated.item[0] = sfc->stereo_to_mono[SFC_TX_PATH];
@@ -3339,7 +3339,7 @@ static int tegra210_sfc_oget_stereo_to_mono(struct snd_kcontrol *kcontrol,
 static int tegra210_sfc_oput_stereo_to_mono(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -3354,7 +3354,7 @@ static int tegra210_sfc_oput_stereo_to_mono(struct snd_kcontrol *kcontrol,
 static int tegra210_sfc_oget_mono_to_stereo(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
 
 	ucontrol->value.enumerated.item[0] = sfc->mono_to_stereo[SFC_TX_PATH];
@@ -3365,7 +3365,7 @@ static int tegra210_sfc_oget_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra210_sfc_oput_mono_to_stereo(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
-- 
2.43.0

