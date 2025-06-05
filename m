Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010015.outbound.protection.outlook.com [52.101.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFB86F073
	for <linux-sound@vger.kernel.org>; Thu,  5 Jun 2025 01:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749087822; cv=fail; b=JIAxcrXnrGr6jbGB1csR5Nu3Hhmit0m9YLPKWAa41vdPqerG+On8OdyiU3luAEVABRWuLeYCskarUuhp5mYBTgg6HZSgkkWoqq4nRYzx31JUidoyy4yeAQJWbnnmVxIg5BUMltvVWZRkCK0N6KBmGrCs4isLOaonD8S8Po7E1zA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749087822; c=relaxed/simple;
	bh=r5KfuTraC+0eju0L1rj0uS5V8yAx/+dZVDyQkZEmsLs=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=EM8wpDY+EXbwQ00IofgaV39uoN+hxztNe43dIDDCZ9HWJbSR6XCInB9LxXDimJBSUmln/MFRIyF9Joh4ivbvCRpcCPg1fWh0ZqOoBweQBv65TDo0K2ri78n+5EwbEC8zljpHf4Ltjhp6O5ls2A0kK14U2sGil4r4zEtwB821Dhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hBxuFm4Q; arc=fail smtp.client-ip=52.101.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hBxuFm4Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTWmpLnrZDc3ABpB7t0em4LcEJ/VvRJjRbRucx417j53zeoT3wtysyGKtHK2jcvPwLHUzaEO5SU2bHTJg8F0gdBDqlUxJfAUh7pmkaDba7qF4W+6eA8BvE/cw854rliws/tmFB1+VCxhBJUT9LFJMHHrxMGtIuK+TRtyNgM3tSfPf5GyY2uWbQ5zY9kzu3sny6R+019IKed75k82Wj9P4LD9S5NrzqsVzJx4lglz1Kq1Q6c8bz1FpY3gCnyCZNEkZ9iTrAYcmSW+pELBX0kA4HwT5Gjp7OpvtOTTMKtZopf8aqIxSY9QK+eIYhjd6McKdTx2ELJzXc9X07CN8urrcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nf756ZgQUILgdP2a1cJURImICl/Yhcz7Ra0PqYS+cHU=;
 b=D93OEgZR9xG3ZCF2rLlxJTrDQXmOPYbVXQ1yogkpBFUS2F+N42xfZNgGB0/UYajVljD3xtt6pKNp/6k2sI/GFP0Q5GxQ8CqqlpAGYrkKIxzgBe1xE2SgJP2jOuhLFuusMPdCMfFZlWsFUahXZxp2gRFtxmRDAr111LudTpRdy8ViuLFOdPXJIjqneMKFt5gLVkbVH/WY/vnvmZiRRqVc3Z47JCRfM/7tpAfYA54mc4fD50N6cyaXj3/+U2fosSZ1t4DwbhmOcrUU5VZrM4o+MbaTcqkPtnb1CNiv4aH0ZlTPNc6QFxn84JEAKkVYT5yXKC+UVs1CH9QonZod/+D+6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf756ZgQUILgdP2a1cJURImICl/Yhcz7Ra0PqYS+cHU=;
 b=hBxuFm4QRc0LT+txUStemBdmEMO37CsFKb/uRf8vuuUBb9equUvnR5PhZm5JVsnG6R9cEj/UulrMZ8CHd+YKjLrS7rHoOJ6sWqp8vViSTzbsEM1x7IyXShJEUPZ37pZ16wBRi0vEfmMHN6fY0ZWKJCHNPbyNrCSlbwRQmrw0Wos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6231.jpnprd01.prod.outlook.com
 (2603:1096:604:f6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 01:43:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 01:43:37 +0000
Message-ID: <87o6v3j73q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: hdac_hdmi: remove hdac_hdmi_jack[_port]_init()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 5 Jun 2025 01:43:37 +0000
X-ClientProxiedBy: TYAPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:404:28::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e441e1d-a380-4546-488a-08dda3d26442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QtDNnDm2EQI/RQpW8vBJc8f3EzwEU1AxgRK9EVqpWmrUw3zuUf2LCeIx93qX?=
 =?us-ascii?Q?z+tbpqVfkoGLsq0TxmXfBJPsFjGrtPwZ4k9LQ4t9KOE8uJdnZ+7S93Jo4NRa?=
 =?us-ascii?Q?EEeA+MRuCYxTRbG+jxbq/tTLSCCz/e5zwZJBoWw9l+YYucoACVaVGrL6ZxBH?=
 =?us-ascii?Q?Zb7rV9tK2VvWlr+en4sFYJYaEtLzeJelwMbnsZsdqoM+l3+20ywqelLWFytj?=
 =?us-ascii?Q?e7KmVUt8Cj2Svt+Qsm+YEtPEVGC7rQsGB/L5qGwOM4Fz+m48+4mPY2fKwQ9c?=
 =?us-ascii?Q?Hgz3RS4IGZYVW9eyi4nPX+MgtYbFQMcVwYI6wOuyNXu5dHm5hrubIpJs5BN7?=
 =?us-ascii?Q?pq0raJZz62De4yfKQ/8dFb/64B049mXq7hZHlhwxLss2WEPCj2GgyPMGd9pU?=
 =?us-ascii?Q?wuoRWP68IrY2lsk+uXOypZxDpE8L8btQwEawVvFYovBLNwtJNqxQKB1dYCgw?=
 =?us-ascii?Q?3151NjUT7kOONVvuNsnvwyPy24Tz32FVfW5Pha9nxUBOJYbFXQDuHyL5tqH6?=
 =?us-ascii?Q?hL9PT3ErDyiaHeqYQwS0lYVottbFMxR5rQAMzHaXrv2L26TcNPm/HwHu8kEW?=
 =?us-ascii?Q?RKGkJhf1N1DTRrztV+v5GcOGvUzxHvUpet6+En6CfOaijo+f+XdY98wS78Sx?=
 =?us-ascii?Q?ROYJ2IDzuk3tw0f1YhhoC3i72bEDW6/I4aRfe0k+QvQ9eoj/ZmGEMeSoWR/F?=
 =?us-ascii?Q?n/3Va3dzhUVQMU1KCsybQzN7wdKDkyH8PIOYYnjlDaNSsRZ4Ysuz6Cy3ihV9?=
 =?us-ascii?Q?a5yeZAyyt4XxIozt/b1RztiSl+WXh5Gshbb7zBlrkw8UJdFz07xnRmwMltrw?=
 =?us-ascii?Q?O3AhrnddU6Cvrku3uv6Cm7twsQRgrRD6s3ChOIdPNMpDoOcmMpL+5KXHpSaS?=
 =?us-ascii?Q?G2th3jRFVCEETt/TlTWl3cVw0v2rh0kAiBRvYK1p4cyY4sgzsRSMlafLVnJD?=
 =?us-ascii?Q?UW3ZJuoMxK8RiDAoxiguNfq0KzHEkuPZgQqn5lie7nRxjVRd5IBlL7uzeaH1?=
 =?us-ascii?Q?bgEbYltGKRSFgFnHGEsQyUbBJjpbHvFXDIpMldFLQAopFP/fqBJbn3b+UVCH?=
 =?us-ascii?Q?tdJRfo6NpuKmZVaTfS0fZfMa+KVptV284rJesWWGtNDQk6yuQ4YFVMKw41jB?=
 =?us-ascii?Q?Ue0BxQkDyveNZXZ0TAUMa/STpRe2epeewFQ3+Qzi2waKj4isyxrT0js5Qjmd?=
 =?us-ascii?Q?H/1yNuNALiEJxH5MXV1OBzi2pJ5Yhr8p+zY77fjoUKt5gK8pEEjgECyKDNG5?=
 =?us-ascii?Q?55PhgnnhKt3mF5LoNq+tjVT9mKupS+0iQ2bB9onWDTB+Y0rxxhRS9vTFVy3X?=
 =?us-ascii?Q?UoXIP8wOf1/TxzoobDS3cj4SsQBrjCtBBlrEA8D5N6x4xR78TZycM6kyWPE8?=
 =?us-ascii?Q?M2L+FuR/nYs5fpaivpuEWmrDArt3gz+8XUI5FRyld60UOuSK55OAoMX1UwFe?=
 =?us-ascii?Q?Q8M+PkJczX7CPfJv0L0K9RzyGThMZOdor7kMeEevs0hNMo4a2yRj0ml0TQHe?=
 =?us-ascii?Q?sSyVf1X86YtXzHA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UoUReL/NX8QVEMm2DH3U9CQM2RQsH3/BefcKeTImNsum6uZs+OaUjCOhiPWX?=
 =?us-ascii?Q?XJlwYmruIxDan6AW2t4nh8AR1kJbkzpptChIQiKc//GdCu0RD9W8a2/WkucR?=
 =?us-ascii?Q?pAyXjxWeyqGnpnosxCGxa07Q9f7zBymi2LkvTE2EFsgO+7r9703YiGG5KsHR?=
 =?us-ascii?Q?cHWlJWgZp8O4zSIJnqGjumfJUQ5rTqB8qYVbh5mINdKAB6/g9V02toeO4ULJ?=
 =?us-ascii?Q?HNd7lx78AwsWlQx95cbPkHqQCqqHV8Bq3vuXXSFeYzVT+ei5UGTt7DRee/5e?=
 =?us-ascii?Q?kfyHMLbhwbJt9oFygG+o62oM7IbRSNGM2nohzD6WvE/Da1Fhhn+s3ULMcb6U?=
 =?us-ascii?Q?f/DoLSUN/TIpo7t0P6wcFMP3HQCGmDKR1w2nK+zyl2e82Xy4JPbvMkkQw2qa?=
 =?us-ascii?Q?sohzGG4a/k68RUvk9eIn4KnIaJpbw2DMTY1xb9hxnMfPjsXXArn5ociDfaFl?=
 =?us-ascii?Q?8xSkDwKg1bWhg+EjTQELmzKyKCsQP0yaqRzR6Due0z3Kpt9YF85BNfJj2opc?=
 =?us-ascii?Q?Gt+8l6uqHr7HBTfZJxXYXMBKB0oSTqQsk9uBih27IBLWszoWCr4MeJXvbioY?=
 =?us-ascii?Q?GIIUcHgUwOL9JAeu8sWKTwfSGxkt27JICpLhhg//L3KB0bCK5t5rfMFJSJ0h?=
 =?us-ascii?Q?6cL6w17cg1bhiYN8hG471VnRYe5yd72yVUXXYAj9M/4pOOD8grzjOBnKcd9K?=
 =?us-ascii?Q?Va/Jh0M0XBdUxJg5JqaL0ftZN0gqYrhTvoUkPC6fynrX+tFEBdZ/qs7Hq8pX?=
 =?us-ascii?Q?j7CldCqkjGTfWNcRSvS0lYYMRBnSC9A1IYb3T3p7QrzuxsxBx74R9osPlZeL?=
 =?us-ascii?Q?1hx0sCC9zsXKZWm57MXZHXrzkz61MFvTcig+201/RiS+f30xmmrVYGddjTJ6?=
 =?us-ascii?Q?eKL5/MBUc3IT/eLSbC1Fu9pNcdp8Vjn18ZR9DaotcVq3o760yc8gChY23ZWQ?=
 =?us-ascii?Q?MKSU1R3FYq5ha+EU0bH10Tz/DYi6ovp08E4swSWfG9ONbFs9QzpNa0IgDgVY?=
 =?us-ascii?Q?AHBnc6+CXm7iyCTftkSGFsjGG6Ln+FJwLob7AzSZmaudcYAL3jQbk8b2bIRm?=
 =?us-ascii?Q?qYWS2WM6hFJKYFnNMqMHpCce1T7xXIcBEKfApw+v3JHZhmhQ9HzO8wBLKwbi?=
 =?us-ascii?Q?JJoGnpWlbRkQtadhtn0kgILzyeqDt7+qFGu9DfTad+18V1W04tlSArmuzJvn?=
 =?us-ascii?Q?puZxh1WJtCw2IuuHMIgVjDuwvgl5MkUc+LRwQw0RCAVRF6tHJ7a4bbZ9t2DK?=
 =?us-ascii?Q?oropuo4Tul0jvUA9z3dIzjbcEscrMDJ5stg120JtLdLbgfgJjJg7mKA4THpV?=
 =?us-ascii?Q?fDvVi40fWmDslLXdViikvQUvQG/l/nHLTx+iVmWN+MeVHQg6LDKAOrOiBlsf?=
 =?us-ascii?Q?2CxVYOFw/OxFnOygvwnf6nJ1lLUzGeCSJWwCCwVgE+zq1wgbwm14sP4h9Dgx?=
 =?us-ascii?Q?44v3l2cBhHnt/FSZ47c/hbUvNUZ6sGJqJSPMfsSJb1WBdOcAdreIDGx6y0bq?=
 =?us-ascii?Q?aNEfPu9LAjK2gmzY0GJnNC9J3DwtJ0bgEverGqEFD8kURhrFnHmXc6nP4x4K?=
 =?us-ascii?Q?wMrX64HU7IFe3eqqSsN/rSxqUdyjRDmP8k2/FZPaN8UOAK3Md9OmqYLOswXR?=
 =?us-ascii?Q?09HrPxd3Bd8Z93WwDoxgCRY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e441e1d-a380-4546-488a-08dda3d26442
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 01:43:37.8591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdWKnpV+xNg2kP2YLrEjVKmV+tpv6G4HYzUYjWTkKu6hQZ7VSh5t950qrKlbr+nBtTyqMi64yz8naIwIwMiFVv5upV+xTzD0BVfRscS8zWinwruESQqUBS6/JcTwC7HS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6231

No one is using hdac_hdmi_jack[_port]_init(). Remove it and its
related functions.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- remove code instead of using #if 0

 sound/soc/codecs/hdac_hdmi.c | 297 -----------------------------------
 sound/soc/codecs/hdac_hdmi.h |  10 --
 2 files changed, 307 deletions(-)
 delete mode 100644 sound/soc/codecs/hdac_hdmi.h

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 1139a2754ca3..e05f0bf91fa5 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -25,7 +25,6 @@
 #include <sound/pcm_drm_eld.h>
 #include <sound/hda_chmap.h>
 #include "../../hda/local.h"
-#include "hdac_hdmi.h"
 
 #define NAME_SIZE	32
 
@@ -1431,122 +1430,6 @@ static void hdac_hdmi_skl_enable_dp12(struct hdac_device *hdev)
 
 }
 
-static int hdac_hdmi_eld_ctl_info(struct snd_kcontrol *kcontrol,
-			     struct snd_ctl_elem_info *uinfo)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct hdac_hdmi_priv *hdmi = snd_soc_component_get_drvdata(component);
-	struct hdac_hdmi_pcm *pcm;
-	struct hdac_hdmi_port *port;
-	struct hdac_hdmi_eld *eld;
-
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
-	uinfo->count = 0;
-
-	pcm = get_hdmi_pcm_from_id(hdmi, kcontrol->id.device);
-	if (!pcm) {
-		dev_dbg(component->dev, "%s: no pcm, device %d\n", __func__,
-			kcontrol->id.device);
-		return 0;
-	}
-
-	if (list_empty(&pcm->port_list)) {
-		dev_dbg(component->dev, "%s: empty port list, device %d\n",
-			__func__, kcontrol->id.device);
-		return 0;
-	}
-
-	mutex_lock(&hdmi->pin_mutex);
-
-	list_for_each_entry(port, &pcm->port_list, head) {
-		eld = &port->eld;
-
-		if (eld->eld_valid) {
-			uinfo->count = eld->eld_size;
-			break;
-		}
-	}
-
-	mutex_unlock(&hdmi->pin_mutex);
-
-	return 0;
-}
-
-static int hdac_hdmi_eld_ctl_get(struct snd_kcontrol *kcontrol,
-			    struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct hdac_hdmi_priv *hdmi = snd_soc_component_get_drvdata(component);
-	struct hdac_hdmi_pcm *pcm;
-	struct hdac_hdmi_port *port;
-	struct hdac_hdmi_eld *eld;
-
-	memset(ucontrol->value.bytes.data, 0, sizeof(ucontrol->value.bytes.data));
-
-	pcm = get_hdmi_pcm_from_id(hdmi, kcontrol->id.device);
-	if (!pcm) {
-		dev_dbg(component->dev, "%s: no pcm, device %d\n", __func__,
-			kcontrol->id.device);
-		return 0;
-	}
-
-	if (list_empty(&pcm->port_list)) {
-		dev_dbg(component->dev, "%s: empty port list, device %d\n",
-			__func__, kcontrol->id.device);
-		return 0;
-	}
-
-	mutex_lock(&hdmi->pin_mutex);
-
-	list_for_each_entry(port, &pcm->port_list, head) {
-		eld = &port->eld;
-
-		if (!eld->eld_valid)
-			continue;
-
-		if (eld->eld_size > ARRAY_SIZE(ucontrol->value.bytes.data) ||
-		    eld->eld_size > ELD_MAX_SIZE) {
-			mutex_unlock(&hdmi->pin_mutex);
-
-			dev_err(component->dev, "%s: buffer too small, device %d eld_size %d\n",
-				__func__, kcontrol->id.device, eld->eld_size);
-			snd_BUG();
-			return -EINVAL;
-		}
-
-		memcpy(ucontrol->value.bytes.data, eld->eld_buffer,
-		       eld->eld_size);
-		break;
-	}
-
-	mutex_unlock(&hdmi->pin_mutex);
-
-	return 0;
-}
-
-static int hdac_hdmi_create_eld_ctl(struct snd_soc_component *component, struct hdac_hdmi_pcm *pcm)
-{
-	struct snd_kcontrol *kctl;
-	struct snd_kcontrol_new hdmi_eld_ctl = {
-		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
-			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
-		.iface	= SNDRV_CTL_ELEM_IFACE_PCM,
-		.name	= "ELD",
-		.info	= hdac_hdmi_eld_ctl_info,
-		.get	= hdac_hdmi_eld_ctl_get,
-		.device	= pcm->pcm_id,
-	};
-
-	/* add ELD ctl with the device number corresponding to the PCM stream */
-	kctl = snd_ctl_new1(&hdmi_eld_ctl, component);
-	if (!kctl)
-		return -ENOMEM;
-
-	pcm->eld_ctl = kctl;
-
-	return snd_ctl_add(component->card->snd_card, kctl);
-}
-
 static const struct snd_soc_dai_ops hdmi_dai_ops = {
 	.startup = hdac_hdmi_pcm_open,
 	.shutdown = hdac_hdmi_pcm_close,
@@ -1754,186 +1637,6 @@ static struct drm_audio_component_audio_ops aops = {
 	.pin_eld_notify	= hdac_hdmi_eld_notify_cb,
 };
 
-static struct snd_pcm *hdac_hdmi_get_pcm_from_id(struct snd_soc_card *card,
-						int device)
-{
-	struct snd_soc_pcm_runtime *rtd;
-
-	for_each_card_rtds(card, rtd) {
-		if (rtd->pcm && (rtd->pcm->device == device))
-			return rtd->pcm;
-	}
-
-	return NULL;
-}
-
-/* create jack pin kcontrols */
-static int create_fill_jack_kcontrols(struct snd_soc_card *card,
-				    struct hdac_device *hdev)
-{
-	struct hdac_hdmi_pin *pin;
-	struct snd_kcontrol_new *kc;
-	char *name;
-	int i = 0, j;
-	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
-	struct snd_soc_component *component = hdmi->component;
-
-	kc = devm_kcalloc(component->dev, hdmi->num_ports,
-				sizeof(*kc), GFP_KERNEL);
-
-	if (!kc)
-		return -ENOMEM;
-
-	list_for_each_entry(pin, &hdmi->pin_list, head) {
-		for (j = 0; j < pin->num_ports; j++) {
-			name = devm_kasprintf(component->dev, GFP_KERNEL,
-					      "hif%d-%d Jack",
-					      pin->nid, pin->ports[j].id);
-			if (!name)
-				return -ENOMEM;
-
-			kc[i].name = devm_kasprintf(component->dev, GFP_KERNEL,
-						    "%s Switch", name);
-			if (!kc[i].name)
-				return -ENOMEM;
-
-			kc[i].private_value = (unsigned long)name;
-			kc[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-			kc[i].access = 0;
-			kc[i].info = snd_soc_dapm_info_pin_switch;
-			kc[i].put = snd_soc_dapm_put_pin_switch;
-			kc[i].get = snd_soc_dapm_get_pin_switch;
-			i++;
-		}
-	}
-
-	return snd_soc_add_card_controls(card, kc, i);
-}
-
-int hdac_hdmi_jack_port_init(struct snd_soc_component *component,
-			struct snd_soc_dapm_context *dapm)
-{
-	struct hdac_hdmi_priv *hdmi = snd_soc_component_get_drvdata(component);
-	struct hdac_device *hdev = hdmi->hdev;
-	struct hdac_hdmi_pin *pin;
-	struct snd_soc_dapm_widget *widgets;
-	struct snd_soc_dapm_route *route;
-	char w_name[NAME_SIZE];
-	int i = 0, j, ret;
-
-	widgets = devm_kcalloc(dapm->dev, hdmi->num_ports,
-				sizeof(*widgets), GFP_KERNEL);
-
-	if (!widgets)
-		return -ENOMEM;
-
-	route = devm_kcalloc(dapm->dev, hdmi->num_ports,
-				sizeof(*route), GFP_KERNEL);
-	if (!route)
-		return -ENOMEM;
-
-	/* create Jack DAPM widget */
-	list_for_each_entry(pin, &hdmi->pin_list, head) {
-		for (j = 0; j < pin->num_ports; j++) {
-			snprintf(w_name, sizeof(w_name), "hif%d-%d Jack",
-						pin->nid, pin->ports[j].id);
-
-			ret = hdac_hdmi_fill_widget_info(dapm->dev, &widgets[i],
-					snd_soc_dapm_spk, NULL,
-					w_name, NULL, NULL, 0, NULL, 0);
-			if (ret < 0)
-				return ret;
-
-			pin->ports[j].jack_pin = widgets[i].name;
-			pin->ports[j].dapm = dapm;
-
-			/* add to route from Jack widget to output */
-			hdac_hdmi_fill_route(&route[i], pin->ports[j].jack_pin,
-					NULL, pin->ports[j].output_pin, NULL);
-
-			i++;
-		}
-	}
-
-	/* Add Route from Jack widget to the output widget */
-	ret = snd_soc_dapm_new_controls(dapm, widgets, hdmi->num_ports);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_dapm_add_routes(dapm, route, hdmi->num_ports);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_dapm_new_widgets(dapm->card);
-	if (ret < 0)
-		return ret;
-
-	/* Add Jack Pin switch Kcontrol */
-	ret = create_fill_jack_kcontrols(dapm->card, hdev);
-
-	if (ret < 0)
-		return ret;
-
-	/* default set the Jack Pin switch to OFF */
-	list_for_each_entry(pin, &hdmi->pin_list, head) {
-		for (j = 0; j < pin->num_ports; j++)
-			snd_soc_dapm_disable_pin(pin->ports[j].dapm,
-						pin->ports[j].jack_pin);
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(hdac_hdmi_jack_port_init);
-
-int hdac_hdmi_jack_init(struct snd_soc_dai *dai, int device,
-				struct snd_soc_jack *jack)
-{
-	struct snd_soc_component *component = dai->component;
-	struct hdac_hdmi_priv *hdmi = snd_soc_component_get_drvdata(component);
-	struct hdac_device *hdev = hdmi->hdev;
-	struct hdac_hdmi_pcm *pcm;
-	struct snd_pcm *snd_pcm;
-	int err;
-
-	/*
-	 * this is a new PCM device, create new pcm and
-	 * add to the pcm list
-	 */
-	pcm = devm_kzalloc(&hdev->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-	pcm->pcm_id = device;
-	pcm->cvt = hdmi->dai_map[dai->id].cvt;
-	pcm->jack_event = 0;
-	pcm->jack = jack;
-	mutex_init(&pcm->lock);
-	INIT_LIST_HEAD(&pcm->port_list);
-	snd_pcm = hdac_hdmi_get_pcm_from_id(dai->component->card, device);
-	if (snd_pcm) {
-		err = snd_hdac_add_chmap_ctls(snd_pcm, device, &hdmi->chmap);
-		if (err < 0) {
-			dev_err(&hdev->dev,
-				"chmap control add failed with err: %d for pcm: %d\n",
-				err, device);
-			return err;
-		}
-	}
-
-	/* add control for ELD Bytes */
-	err = hdac_hdmi_create_eld_ctl(component, pcm);
-	if (err < 0) {
-		dev_err(&hdev->dev,
-			"eld control add failed with err: %d for pcm: %d\n",
-			err, device);
-		return err;
-	}
-
-	list_add_tail(&pcm->head, &hdmi->pcm_list);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(hdac_hdmi_jack_init);
-
 static void hdac_hdmi_present_sense_all_pins(struct hdac_device *hdev,
 			struct hdac_hdmi_priv *hdmi, bool detect_pin_caps)
 {
diff --git a/sound/soc/codecs/hdac_hdmi.h b/sound/soc/codecs/hdac_hdmi.h
deleted file mode 100644
index 493fa3b4ef75..000000000000
--- a/sound/soc/codecs/hdac_hdmi.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __HDAC_HDMI_H__
-#define __HDAC_HDMI_H__
-
-int hdac_hdmi_jack_init(struct snd_soc_dai *dai, int device,
-				struct snd_soc_jack *jack);
-
-int hdac_hdmi_jack_port_init(struct snd_soc_component *component,
-			struct snd_soc_dapm_context *dapm);
-#endif /* __HDAC_HDMI_H__ */
-- 
2.43.0

