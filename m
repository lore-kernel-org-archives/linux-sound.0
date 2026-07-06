Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92457371049
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303361; cv=fail; b=uYtELRCqVcWYcKjegE8ltpxlkNuojyceQz/2B8SBMMLZG2MUkjWa17fyAkP3BNiEjBVCssC8dWIOYlZWCdtASzy4G9rxWnhPgXADTGfGWFAApwZW1FCwNcsRXLlJLLY4WTMPA5PpEC/mwJEo7Zv74weFqKknQJUsF7TDKm7zgZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303361; c=relaxed/simple;
	bh=MbO6qcotckOB70nLB96aimS7LQjcHa60IRxVUjW6qTo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sjzZCfWoX/0OXO50v2ONkbTv603NomZK1Djzo8VnZzHOBFG5qLVshVyYQudpetlgbPDMQiunpODHC2Q641YGzwqqJW4X+NYVK1/aAKqj5XrV4KbE9VzPE8GJg7snHBSP9FecMV6+VdRtmCQME5bLZKZiqrL/53UUvp7wJw3lNww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UCVcSUn8; arc=fail smtp.client-ip=40.107.74.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UCVcSUn8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o02zsud9//AWykV/XX+H3NhajJHdfL8sQLwjIy5HtoFpAWxk4rKQK/1lPgFiXyzbG1mJbQPao+d+dPEmpYpU5s824OBM673MdAAAwUj9x2R4312PU0n9PJgMxvg0pR2orYXp+HGbMrwBsLcDQOX8PJsvu2BW/5aXOOGXmb45XF/54757HEvPdPVFJ2COjSHUOFWdtjAm8VhMFWgX7eOn7FnMVkOQaeH1Gq69uuJzCivlggr7yqEo9QwmK0UEjvllLSYqBBUz/OCDR74O0lZEMBBeuUSLXgHdJu5uzkx0cnmVzfSuKWaJYMbf4RQcxq8STJbCSORQkYuhDVrzvHUUIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3A5hQ/C0KFaJCnqrNohBw4xcF/qY5slADtIUl4LHFE=;
 b=I5+yLEB0XAWPkuhSt/12GQqntPk8KTvX8EIa5KKU5X7RBDcldjzwnFuvGS55B1k4qEml+Kzx2vAGLq5JapYxazC7eZ10I2v2IVuEDwWWGUZviLZLrGuv8R8jLiEhY1razqG/weZkdMTkdM5NkjYulwcYNOczBbyIZaNe+yWqA40uDfKpdj2akWi3BkCf8swRtr96U6PE3wllA1ZRe0P6+qJOQcUcfAxggN3I8vPBBTq9BJHKCAV+ukGxhOOmu95KGvEy8lW2F1+9y0clTwaB+WXYMFlZSrWt5XjLTa3MME/jY7u2Otqa5+lcTPFLIweMNCJ32aAiNXlGxichkDav2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3A5hQ/C0KFaJCnqrNohBw4xcF/qY5slADtIUl4LHFE=;
 b=UCVcSUn8iJgIhdNmlx+dNO6dnhvdnt48xAaZDK5T6MOwY8Pmy+DMyGxDFEFmUy8QGr+0FkcHef0jmuQ+qKWe7qso/jz2KaHSkNSMXdiYobrSICWv8SDtvMUk1i/Fsf9ANKm5ng0Rc3XsPTPVb6UVUscdEe8mCgf3X7LlMUoK4uA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14075.jpnprd01.prod.outlook.com (2603:1096:405:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:02:34 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:02:34 +0000
Message-ID: <87se5wc1ty.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 05/12] ASoC: soc-component: add snd_soc_component_{set/to}_priv()
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:02:33 +0000
X-ClientProxiedBy: TYCP286CA0149.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14075:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dbd083f-0b5a-4917-84ab-08dedb02a507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XZfclDH8NWAh4UvVxxzeJpkWnaOQ2vp5JWu2QUQv+C5zq8ghOhSZXoJhm0KFVo8NFMTNMBQuU2NlgGItt4j/QY9BCTlHUazIJpLa5Zl1JVMB1vepVKaYvTDgmaJtd49qgvcfg3+mMisqun6O31RDSxT6rsFqt5e++fU1+W+2krIySTXmj7GZlQNsYuOZQDzJlnLKEMzuiT74cri9COMUIQ1dNe1VlukBMKZURC6gUv3xxmKGR25K+euo8wR2v93VXXOplWNWd4hD4s0A+UXtxmBatU88n/+hNGPw2E9yrrfzY5hcrkkn2+WUGC0RbNMX9rX5oZ+qDR3iB92SFWFRvfIlLxBDJHKavGlO18Ep2zJKDtydhn3QKOMM442BcEy++AKMPsxmQugE6h+3FhCCAmprew/qms45VdJBCqGbQvh6ydYTWPQjEIP3DjCJeUCZ4layCCzE4tRg8H5B4gJqh6GCM6VROnb8hFXs6f6tK7lcabEa/fYa89HucrNDNig2Up/uDIjVenEGtPWH89vZopldxjhKsUNBigaMF7CphDswvkTfB3eQ6XVKkP2WPod2RAo42bNQOH8iWwEGb8eFmYLUsEA3YtAaSHBWqJ70uSlDVD9/JJylimXT8OYshgNOPj4remBnix+cZGncvNo4oKw0/i1m+icjOXmmEFRMmXS0vMcVyCMvxvIB18xvs4zvCjuwSah/mVmZZIM9T+gkg63scNY+ADREPLaRrt/XaK0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LWrPNYVNpI+mRN+8dONDQq/OstoG+JN2iKjmSXdAlvXo/FVW5T2ALyY5RuYI?=
 =?us-ascii?Q?+OjkRx/C3KjIgUMwoV+E6y9FFxzHIs2ecsnGtWZsVk34IJ/hwT2zxO8jXmev?=
 =?us-ascii?Q?NWdF1L+vC40qwfVVK9IKE9y/8q8uTm3gFbXVvDLnRyLLqWbPs7mUkU9lNmjI?=
 =?us-ascii?Q?ipn7Ot9x6gO3oK2Fni0cAQXcHAdWo++SFG5RxxQp8Oh6Mv9A6tC1d4KtjoC6?=
 =?us-ascii?Q?2QKv2C8jyHOVThKlmJ+G8sRaD+ylWXACjKChKnEQ0f13cSBHCq8RqGgS4KCl?=
 =?us-ascii?Q?1LuzVrzefN2FP3LvEb2XfC64XYuWSwko+lP5OaARhlx4ruQUO78yDN+q0PyE?=
 =?us-ascii?Q?Hr0wC4BgtSCQBXjFKx2pbEOI4/lR26d2gtFYn2GIG8JHQt7zeoybPx7rfxBD?=
 =?us-ascii?Q?jQr2ZbxP/jucSAuHDgPyRytiZJMnC6FQ6mLMNVjt6t8HXeXjGuONK8994WJX?=
 =?us-ascii?Q?qH6JmNe88J8BmD6vJdFZD3JqXh7TuDNYeihvBsCgPCw5B9X0ueVmLlTiWszc?=
 =?us-ascii?Q?5ThnS+QXidUhspedNUkqDE44hyJ/JuODKLxdDRy1UTLYP3TM0r+jrsclCorx?=
 =?us-ascii?Q?kLtwGbDEbp32VO2+D6qPmXv/xyEYSb/4Vc2aJrDKIK4AFpdl2M301dqJ2LzM?=
 =?us-ascii?Q?dQqmrmxQQ5j0qjac7KcBcR9rQKV5U1AUOAymCOBIap+Jx9G+18WxzFUVWTpu?=
 =?us-ascii?Q?+XPiFTobqgoOrYF9fewPA004U/ToK54SUvo+sO6d5hPrjnvrGCi8b9zJNDcW?=
 =?us-ascii?Q?tNMeKnKTkIuDe1wV6UU4NO+B1GZw7K/OL4BemEymYgCitYbFRn8DJG15uAdJ?=
 =?us-ascii?Q?YWl1XEFCFK0WLfJWMnKi8w350gdx8N+5QHN5eGFRa14DNhc8gi3viVkv7Zvg?=
 =?us-ascii?Q?asKVRa+tX3hPlMQyAumcw40RMpV65R412JcBcI39itMbkvqsVvy8Xxcl7Jbl?=
 =?us-ascii?Q?D776HBZWTLhT/HNajn/lowykBkd4s5ChaD/W1yeLTPaMShpKwGfiC54uvMSm?=
 =?us-ascii?Q?b7K/XwnlIQlVCXshcQvLS59LCDGV3XXphSZJ9GqPSj6vgYNp1djMzpAwx/eY?=
 =?us-ascii?Q?iyOvrwPsrBiApQE7Z4QqoPQUVVfZG0ryxuNgLJe1atqjrr+NCye7vFPWugy3?=
 =?us-ascii?Q?kWhBaybUR9e/kntZo0z2bJmcdUiYAedqZV+oN+sKhIKSo1ea7MUx0klr6Jys?=
 =?us-ascii?Q?reuOd0FnOL79qfd4jdTMFRSb2gjYUnDsS6HjHkekITvYSTc84hBB9yYXdPc7?=
 =?us-ascii?Q?LXwQcSmWkc37NwFPpvgie8xZvIlsXuNS5AajwCCBdFuQ/hdMRVD8ZF/tT2Dq?=
 =?us-ascii?Q?G5e8fSeSZthmAgIxf64UEYmJ9x3tpPYEQyIqUu6HtXwOH2uUuj0jjmszdmux?=
 =?us-ascii?Q?7y3J25D0n/6UW9ui8RiA9lIxa9AHNe4zJMB9Yt+f8TJTZWNXwH1ahBJsPscP?=
 =?us-ascii?Q?gU83l/lOCG9vPjAVtsw0SKvlXqeiWj/gmfDx5s8QNCkewyV+WCbO/t2zKoW1?=
 =?us-ascii?Q?m7kx+I9Ay+zWLTfaUZfPRRTJAlXfUIcgVaKlXzhXZO2u9gPBCgoNo+P3E6a2?=
 =?us-ascii?Q?03HnRySfztinN8w0slEB0Ai5Sn/UpwMc6QowbUl07/U+LLoQebZl0w29q/8s?=
 =?us-ascii?Q?huqO/D17WnC/++pnrXOk+R8k9UU5BO3qKi7EP+aSZ2WNac3MZI7PNPl1Ycss?=
 =?us-ascii?Q?tDZg3SxQkC8F7WFlDDUh0qPBDANu4L5quH4dBdeE6bu2rvIr36rJPywu7jUl?=
 =?us-ascii?Q?cP85hnCvMgnFQTCb0EfIrSk0XzfHsCM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbd083f-0b5a-4917-84ab-08dedb02a507
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:02:34.1099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yayJm5nE3Ao2PDUNgNvSeHCv2BTq4Uc4VmWwZhrcd5uClNLI2wKM1Q+g8yuSXvp0gB3+0W0L8Gdt9gi9IgUlrHwElHtx/W344K40bjmelM/x66TTwW9qiOZScrS+58u9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14075

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Basically, each drivers are using dev_{set/get}_drvdata() to set own data,
but it is not enough. Let's add .priv.

Add snd_soc_component_{set/to}_priv() to access priv.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  6 ++++++
 sound/soc/soc-component.c     | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 61aa6523f2f75..f00a6a809b169 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -252,6 +252,9 @@ struct snd_soc_component {
 	void *mark_pm;
 
 	struct dentry *debugfs_root;
+
+	/* Component private data */
+	void *priv;
 };
 
 #define for_each_component_dais(component, dai)\
@@ -287,6 +290,9 @@ struct snd_soc_component *snd_soc_component_alloc(struct device *dev);
 void snd_soc_component_set_name(struct snd_soc_component *component, const char *name);
 const char *snd_soc_component_name(struct snd_soc_component *component);
 
+void snd_soc_component_set_priv(struct snd_soc_component *component, void *priv);
+void *snd_soc_component_to_priv(struct snd_soc_component *component);
+
 void snd_soc_component_set_aux(struct snd_soc_component *component,
 			       struct snd_soc_aux_dev *aux);
 int snd_soc_component_init(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 625714293fbb4..dc00891b64cdc 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -54,6 +54,18 @@ const char *snd_soc_component_name(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_name);
 
+void snd_soc_component_set_priv(struct snd_soc_component *component, void *priv)
+{
+	component->priv = priv;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_set_priv);
+
+void *snd_soc_component_to_priv(struct snd_soc_component *component)
+{
+	return component->priv;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_priv);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
-- 
2.53.0

