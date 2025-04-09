Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45B58C1E
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 02:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744167452; cv=fail; b=syWn7V5O3nB8qOiOF0Mk9LSCHAKj06uFYWX0evfC2kUEx3rc7U8fB+QReCe0J50spT3FXqX8vtWlvK0+7O6nePz1CRC8soEMD+rqonxIPuvvksQFje6adESczRyTYH8bwfdTefO7e07VA5xXMZ00AGbWUwXjhm3mmdVX34uqoac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744167452; c=relaxed/simple;
	bh=1OmcOy+kuR/nFhCE7WWn2RMdZ4URZ4HxKv4knX9zt7A=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hqAR4DARStDHhYr73AoLfxpJt9sFTxZCGmZcNhj3NZEAsF+DG+De/D+osCB+Fb/aCfkqtS4nBQhs0W3T+xE0Nb8LmNp7K+g2Ut2ZPtdsnLN/ZIPq4MPM6NbpFlg3FG6Mc21+TGtzu2mSMDFaPtXa/vZfGe/0zaqawPdxt2sRIew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NlFqwJsu; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NlFqwJsu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXMNUo1By6Ubf99faEaHrAkISVZT46t5aOpKeoyyUa8NiQWwAfqSmztLQfLYSrRliUQGS04aAFDDhofBp5IdmRNL+Ju4P/lm4VZGPlnpuhEsAHhQlpSH3+8q1VefmV6/AOFpWRwyhA0IBKgmK8vgFbSeB7eMDTI4YERUprU0oxZ7KfwGWrBgFNFXlKYjeAAX8FofkKq2ddewNU6lj79XgbVv1CAlrPQbduMa1qTNG7EkfUAcAanY+kyu6VfJj8B1sLgYbxlHMDhHJt3yx1j5M2mVCmztPC0SF8eFzjjEWEks1f8L4aVlQiU3N5K5/g7KQRTSRoOhIoMBfkp5xxpj7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1S/mYwVvqjoz46ohrjYM68T8kxwqwE1cfZmpEXz87Fc=;
 b=d9qVCuWlL0Uf6T/ORzQJtogvrTQ9hMlLD5JKh19gDIwAWBCS6YnC9Fj5AFHmRErBEG4tpNkgEl/7SOhiEZ0I/Mm3ZmCt4fUQk3hVm5EWXAFmorK06UuddoOwYNMOED2AUW7d8y1216KJnjzB/+kevhQRJqLXz+3t/lFrN9okg98FVMrlo0O8cb+vzDUwjMm/VcWd3tdqGLm034ZKIgqxfCJ05Wg/QwFdUxx1GFhl3Mr4zeX5RsYCgCieq7hLedoym7/4IW2ZZ7+NNGO2p1d0Ti5OLGi09dLER98mIad3gAYq+CQo3zjlH8aGcEhwLaJo8OBR8Q8qWMhroqG3LodmSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1S/mYwVvqjoz46ohrjYM68T8kxwqwE1cfZmpEXz87Fc=;
 b=NlFqwJsuB6u5kl3xywdc9RStiBwgqaHGw7c/d+K2G1tdr/8DL7jPzIggUbQdUWIduCjSF+hlBWxoD1uVYBI6bdRSJUnroF1nJAu/eWBLb7+d5WBxKyXMwdgsDhpwHez2qWhCXzGXWICoM5fDeDoLupOMmm0ggRJu2RjUgHHMHC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11643.jpnprd01.prod.outlook.com
 (2603:1096:400:3dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 02:57:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 02:57:24 +0000
Message-ID: <87jz7u9h4c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/7] ASoC: intel: use snd_soc_dapm_to_component()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Apr 2025 02:57:24 +0000
X-ClientProxiedBy: TYCP286CA0205.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11643:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d0f133a-46ac-4ce3-3923-08dd77124132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BPqrmk73EGEOkra83FH5bunuGJkqslMnpkt6O1vr30kEHnI0mQTFtO0kD79h?=
 =?us-ascii?Q?dmUbUI1DJqCLrjJxK6nm7jByJfZLDIR0DYoWy40LCkxtm9/pdIFvtyr3znj7?=
 =?us-ascii?Q?qXWGOKnjdXCBsiPatTQeD7IvI2m2jdl0CTjggwzvs6/QwjvEFzjN2QC2vHXE?=
 =?us-ascii?Q?Cz7/YMhDw8lvOh1HmyP/PD3ZTZiICUkj/czChaFAQPyiHbi18Jswm3sItUrl?=
 =?us-ascii?Q?aVgos4WzkDWshea6hNLz8fNK2R4fI25OE90LR+QVYazR43suTxPIEp+xeGzr?=
 =?us-ascii?Q?tx4Zfu6cDh5523gfK7dS9H2IYcwI83UtY2XoIe9bsS9ljByU/CNtyqWS6cU6?=
 =?us-ascii?Q?M/EDbzelHIATYLOIuNxXPneGI65VZ9ToK0QoOhYQlO30p6LtVouQWIruPp5A?=
 =?us-ascii?Q?ffDkBjUxYAiEtOadwbZb2zTZBjcHijmdVctjnKKyjIAqdMhA/wLUd5eOb+1m?=
 =?us-ascii?Q?w7fk+xZz39M6rfI/RHq9ciYxPTlawnI281X3WsHUzOzISD40u0CgeLxrp56N?=
 =?us-ascii?Q?ldiDiYJaRRK3WyoVKI5o+GELx4sBfSid9BZV//duDMce7IoaIFClukUnx02x?=
 =?us-ascii?Q?li1Nrkahj4IrDXeYbmXVgDiXOGWXyPk5aXHwql+Ipnx5EMl/f9EgKUxb/ViN?=
 =?us-ascii?Q?D7ghnIUd0Orkcnq2QOl4D9yNX/BhWupEEdRxCos2Y0Ucvblfe73+voxmrOxR?=
 =?us-ascii?Q?nfNkS1266krBbJpky1O44QQkSVDoOKt/cUJF6uayedFRPhJQSmXWcDs4CwGn?=
 =?us-ascii?Q?140WAz9MulDKwnXYrHoF63gbZuD65/6aNUK4UewvuxbTUQ7dU504vtwfynGh?=
 =?us-ascii?Q?PaKv0YSm9XsLDz85AB+ilJeuHZUJaiLuOQKCuBrd11Pb1JzLOFo3nSzrpJiw?=
 =?us-ascii?Q?jMdV5wEX9yTUy9GMKpBKMu3+ZDDELMY4NtbSasJ7nd9twbqlmuJSLZ4sedHD?=
 =?us-ascii?Q?Qz7Ut1N9rG+sQIt85862qSJDR6L67shyAFGdcGGSOioW43ev2Q1QeyY54JlW?=
 =?us-ascii?Q?r+9TsRm42Uq9eJIT8NTGt7nzYI/wXo3fV+QKGXf+ZbHTIBISBuGyAH2dO5w4?=
 =?us-ascii?Q?DziZhgbtauKyvcabgS80NkCmwnEpm5ry4A1yoXlUrK5sj5Hjq0sw+eFZFeMW?=
 =?us-ascii?Q?LOSCgCqYThjHDfytfFPMv5mqbNH6/xaYbjkG8OgBZPcJ2RP8w7928imvldfD?=
 =?us-ascii?Q?iuX4abHj3/UxrUgmFVm86KuIYZGKcUbVhkJvWQQB3xDtlbELpwVGop7numwj?=
 =?us-ascii?Q?sGlH5UdjRWCw+J28DleKcegcnD+uNX/KHLnm45yqZarvmt+r29mCExc3B1Dq?=
 =?us-ascii?Q?fIFSL+kSTilNGgwFoAhGBHCAN7GR3ng5ju+m4yciig0pPeh8chHL5p+BNPw1?=
 =?us-ascii?Q?bAqcGQ02JtX9RTgTeZ4cqFr2qYiBxgtpy3wHsDcO+HH8fDAZ9gAUyIcm/cnf?=
 =?us-ascii?Q?U+A8l+JHOSUX8JUqYk8RBx6OaINIJdvaTVbVUCRc+E1Og5b1f8QLmC50lAQ3?=
 =?us-ascii?Q?mtCo+IPw8oZMDEE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tWyBJ2jFr+Q87VC0SGpI41nC8v+kPZQEfrWdaHt4yHFqLoLFcMn2zL5WQIp6?=
 =?us-ascii?Q?T6GGcXBc/Rlo9ST0+6ryxMHUF9RAwuzzFGtYtNPqnVCzpzvvVQbK/eI4VCgD?=
 =?us-ascii?Q?5E/weN1bAlaVM/DzPxhBRnDxCakWQo76VDRRskWd1e1aDcNJ0NopcfZ716+q?=
 =?us-ascii?Q?4Yn1iKhDeGBd0+A9Ruas6X8ufQKXJFLvTpgaRazywzK5oys1x+rHnHi/bK8J?=
 =?us-ascii?Q?eNEJBSuOhOQSmpLv8UhVzlXDLgzHRE7xQ0K73ofVSzPj8FJVEF2PjjTsCp86?=
 =?us-ascii?Q?ANptlXvgI+lOagWVfbCSTOcTyrhnrxkkJV9Vs7ln6py2ugf6SfiblEfLmXbo?=
 =?us-ascii?Q?TcDNbc1MTpB76cc1UOJ3kxX/zTof1UDNzJ1fjtqUr5B4irR2dLUej6c6U5Yd?=
 =?us-ascii?Q?49qjPB76XkmsKBmrGQTnrG3FcB5scquPPkYSVvar23qM4XYwBzui1sSpRdUZ?=
 =?us-ascii?Q?QS/0W5o7jIP85/Hz/fBLeFZPp8Qaw89jR1SQzSZnEiCjaTJw3u3CU0hA7DPv?=
 =?us-ascii?Q?nr77AWNiAp1jE5lFrySTIjMGNVPutS/duGhkAGJPqz1WwcYaD0ROcKTYfk6X?=
 =?us-ascii?Q?F5ZcyKqrFu58Pxv7/G2+tybHTl5wVGDjqkMiRak29xDbGZD66vs8KA9b4FrT?=
 =?us-ascii?Q?tzxD29hy9n1GqlBuvYlL7OUUNewbIz60Q9ooiFuzaYsjVxRf5t4phwkY50Ua?=
 =?us-ascii?Q?uBRQ4Zy0BFJmzPNwFV9q3MdjJqPy8j51rfvemmX6UXQZTlKru1sVzVV+YoM6?=
 =?us-ascii?Q?BmtwXLpfFeLc0x79lF/9PHu85iGQw8JmrUJ5ShByLh0WRm3KFnA1AnSpHier?=
 =?us-ascii?Q?eAkAyDsV2/bHHS6+w4FWh9w+0URkJ+HDPRoPviS794wwZX7jP0vJB1Cf3l8c?=
 =?us-ascii?Q?70nUk8rSxNK22H9LKFqj07rYv5DbanWSHex2V8FsP/4HuVNJmd7wZZ6sBjpK?=
 =?us-ascii?Q?1rF9DjjIR1rx/EHJO2nEBM5erS2UBXc2tYPwRQjMZbAnwNQoj2labGdKqRqe?=
 =?us-ascii?Q?hDDvSDSfT/e1sA6NwJV+D2+Ksujp7Yk0LfJwOiUXEoVQzTxpZR8Y0SCnQXi6?=
 =?us-ascii?Q?mo8Yw9cTy7CqoDCN2vLfJNHHNh2bG1an9LPgPI75nsO9/M903Fe3OMVy3CWD?=
 =?us-ascii?Q?5lJG7YXAm9eqBRp0G6rYgI+b32vnLWceJPbebAMv5awPpvE6LYlw6yaglvf0?=
 =?us-ascii?Q?g3+UiQ+OMfVlmEqy1vJ2gz3V0pVAfZydYJdEkftkhTZb9nGrVCNXVe2eEfwi?=
 =?us-ascii?Q?0InMwd8AEzRc4KKDWZQfUnYB9jWIgf6C6Q1VnEPtY/57JA4z7Gjf7gy3CUIO?=
 =?us-ascii?Q?V2AQd5D0c/ETZ9OyNTuecsBEWSTwgo/yTg16v7m9TemNWgVzAZOhc2fKJcvk?=
 =?us-ascii?Q?GFxDmzcVoWlBWJHA6JCFJOF4Gs6lchC9/2BPAfCUbDOKFMVLAJ9w15UwYaEc?=
 =?us-ascii?Q?j66DFMCSeMDoBbC30PFnRN1VJ5dldAv5H13Rjzly4GAUnFWsZMTjBcnJs/+M?=
 =?us-ascii?Q?vJFXKUCjQD+cqnqFkRtLILwAZn0+FdMs4RSzpC8Dq2fDJrgDpYWFn3j4kFN8?=
 =?us-ascii?Q?hxQ5rhdyT7zRzIuH0ZdLbSnKM8ZMjYaUrf3TZrdmbBJqEi3inw4I1DhYijYq?=
 =?us-ascii?Q?zxA3DL4vr8hrohdRcyxjxdI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0f133a-46ac-4ce3-3923-08dd77124132
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 02:57:24.4517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YiTczL7Y53ekotvho0w79ckgz8sBnpvmTXPDD8hCA0afYIrR+S084tp6Pf2VMr5/EOo7DxBPcwwPY2khFBYMTdtegzuDgdlpWYeKStE6srhAoTHl6C9UOJTtDwNc4OKj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11643

We can use snd_soc_dapm_to_component(). Let's use it

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/control.c b/sound/soc/intel/avs/control.c
index 2e01dc75a15a..1af270ef0c8b 100644
--- a/sound/soc/intel/avs/control.c
+++ b/sound/soc/intel/avs/control.c
@@ -19,7 +19,7 @@ static struct avs_dev *avs_get_kcontrol_adev(struct snd_kcontrol *kcontrol)
 
 	w = snd_soc_dapm_kcontrol_widget(kcontrol);
 
-	return to_avs_dev(w->dapm->component->dev);
+	return to_avs_dev(snd_soc_dapm_to_component(w->dapm)->dev);
 }
 
 static struct avs_path_module *avs_get_volume_module(struct avs_dev *adev, u32 id)
-- 
2.43.0

