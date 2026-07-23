Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558603CBE6D
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788491; cv=fail; b=W0ljFbl9pRvXoAL1DkE8GY6gCaMea2cwPYJG+KemDcBG9WIrrm8736/QhEH8pGUV5fs5tiTjjG4ktYfVBOLdsEK0BEVMjhlsk8kJzsBUFtalTXXab0fvYujjW9rY0LmUo8YVH8vyqPUnpL5EUJzIfU+mZZqR1uhnrxT/+tZymc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788491; c=relaxed/simple;
	bh=pZ44mozhaRFTN0rFOCYswNushfx5fk4BQOuUtlglNwI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=K98kBw7253OFxNd5WgK8Kw59UTmIA+GqW3F12nzpSA6cA6AT/0G8L002Ev8EAWrR8k6xd1NqM6rwVaB9VQaEcl5enqzig/Twxxwuozfut9ah395paeUE+tWYoOvfaqXRFyGJs7OhlFWKZAeR55kmI2nyWpKTarZEYZ8fOssPyZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KPolI9zk; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KPolI9zk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvNBHpvR8jLL7iswyXO2PCQDSGc+JFOcsN7stvE+DWtgvIegEpUnAgLaJbMk1haGPR4iu+CufJpol7k/5fx09ZiLVbjfxGZGCvTBAMm6bUNDYxTzB2GUHK+iTofa9eNHTTgrfD0mZqDOnokVnBWbg7sJ+CTOpNZ2LNLOzk0OII8Tot+Y7SE+kdBeMkX8SuEEOjWxjKdDG+XHbpm11tjXVqfWv8bNQXVZSCYSpo25HC8e9IVsctFKOo6GgG583jCiAIFkFlFW8jMno54/1DGODwYocPig4jQuDk+Bt6kEjPRGutOsJJJO0dELUNJZ2m2BGiMMp5znVignXI1ZrMc7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoZVNSagdtnqmVLjZEgk+sWoAGbjgR4tRtR098BpxZI=;
 b=BvF9kvW0NETDG2XALhoAWAr/rVNHxf8b0q0odKUyxzpAZBBtt1aMbl2PGulVWpzBOXdeHoaujLVucvYeu0urEPH/sAnzfwX+V8TOMpEtsxeWZLYWSKZB4BPZ8q+u+GZxr0++QQ0+TYXZulzsS7GahdeD+ZdIXKMJS8KIYI//ZGLe2c98Fqzh1QUYuT2wiG/BttO7Hivz8/TPxKW1FNJg7r5O4xNwYRXFXuz1IGvqcVMJ+S75pOdP3GGYSSnckOFLod1MytLyTlDmsw7MdmMiiQhOECu77NzbttFo6m/+Bh396JPWvf0SN2tgZ1DqDTz339VeH3A4O2GRHsSAmnSHsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoZVNSagdtnqmVLjZEgk+sWoAGbjgR4tRtR098BpxZI=;
 b=KPolI9zko9MXVXAPUDUtNkp4m1VUpNHtZoO/Gihk2RGcNU6Ir0r7XvWtAFr8XI31wkq8VhglH/U5IaG7OBugX7DBmxGy4CKf8UDvIgIRHv4MRLqV5MUpBhwP0lu3m1qkBu8L6d5cLy4hOiyNb2rXQQe51pIV4fnKDPCOs59J9NM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:34:43 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:34:43 +0000
Message-ID: <87o6fyrz7h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 07/12] ASoC: intel: avs: probes: use snd_soc_register_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
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
In-Reply-To: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 06:34:43 +0000
X-ClientProxiedBy: TYCP301CA0081.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB15042:EE_
X-MS-Office365-Filtering-Correlation-Id: cced51a9-66fd-4f84-8261-08dee8847b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|52116014|376014|7416014|921020|38350700014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UqYP+jWorhgkqu90rJER9zWGCnTB7xL1K4PV3AHmazXveWRCakQXBGRWR4irD/Vpp+zD38r63dc942/Vv3n51Ax2tl/YhJqs8S28nHZchbO86wdP2M+/qVMNl39qK7gCzbw62+QkWL6UNWilXqdsOFLlZyyYgEjLboQMx6q6K/QZam5DfkpBW+dueoukvjVH/2cTYCkBpAeremT49m/SBqmlxbNE8zDEwNbP3+FTYanRcpVWraymYH0QpkV9blgt816iQk2g2e0E1GNNk8Qjqt1vE2HvU3f4kVOzgRX5TWxL+/n3Ti3+ZvTxUmk4o9LD0NX4lduSQtT3x+croVVwc7m6Wb8zCKMwqOGjvdOKGdalYxWyJJqIBZetz9+zAb2Z2fIk7lo457C5i9bZt55PftRj88CnJeTDUFYH2pP33Utq91LIa0ySDVQKi+k1lvskYJpL1EJaBer46Tya9UIGovHvY1ifM6bptiJwcwZXCM5I9dFuYWstnHmQ/wB7tAcanTtAAC/FtzSL4ZSSUv2RpDFoUvbYpnG3Shr1ckRjU+YaDOIqmzZkL3rVnFaiKZAgRPFkfKtB5B56pJ1/GJHZeOUET6QOZj0A1f9OTIICgIUn4A08WV0kOlWICODs3pgZHzlkWeZwinwIj5lLpWD8JpmTeR/XLaSUvHF00BTgTpPck5yepABj+qkEWb3wy29q4wYYIrUjZXoHGqssy07aAx6epj6+ATnzSDn91tYejwc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(52116014)(376014)(7416014)(921020)(38350700014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ijzhiCTk2OqCY8dYx11Hwy2BHBzgIxxVG1wf99J68PNPizJXFEHL8vbSVqVn?=
 =?us-ascii?Q?4desuNitUey8so4zg+rJ0Q+3aOIiYIbijS/cqiGwn5+BpsNOayYgaWlvOGPh?=
 =?us-ascii?Q?dlApoofM9XSK1b1QJC2EufcUxS0cbsEfBUy31subDkIS7A+oYCKWihFspmCg?=
 =?us-ascii?Q?1kbJ12BvBkax5s248lkoNSALFG4UsH/0u4oDtclpVnCV3q0Y2+P9+f893QSK?=
 =?us-ascii?Q?GseyJyw7Z4ciWvHYbwFPOAZz1O14duvmdK++jqE/jU2i8R2k3jCynb7QJGkL?=
 =?us-ascii?Q?CAz6zfTtiLNt5Wz6FTGt00Bye5BglDrJpOQaGrfXg8gilgzjz0p7hdeMTjpU?=
 =?us-ascii?Q?YDgzdp0p6sZEfTGXWehGDXxFjxs2u/ObVqevQJzEcdckor9rj4/0svK4NQrD?=
 =?us-ascii?Q?0Q/xUU0Yhfg4DtRSJrZgcfaF/lK2yO7PoaK3GTjka+ABa0uvBQ55f5vCMOII?=
 =?us-ascii?Q?w7hUfU9J4aBZUd5+WapJvk5kiWtoutf/17LbzcIhNmjDp8+w3M0arvtrBRj/?=
 =?us-ascii?Q?zkDDXQWHlQr/+6hjav5HfNr0yvXlfbzV4xdMp6EYjx20QmTAspTmMOf9IiXH?=
 =?us-ascii?Q?PAvQ2SJXTNsgDb3vGAR9oZZvqdH7FRSWojFjMVEi9SOxNH/iPMt2VhEAlAuJ?=
 =?us-ascii?Q?uJbpthSjYEo664Fez9prtFbTds5Or5CFlRWeZOJiJqIGtBlzICowgAvlYHqy?=
 =?us-ascii?Q?NpZ/jsqhUlAdpMM+uRjonulLuxwsg8yF+lqJJjDPhEV39LX9Q+H6krs60UcS?=
 =?us-ascii?Q?DPbPYDSN28GITj3GSvu59Q++t3YOB2HLaeU87BHLsvn21YhBjQ/BOiPTPmG3?=
 =?us-ascii?Q?T20NtEpqKfUn0zFEAR86I7Q8C5IDAh4nDqivX1WEBFKu8tm4yXj4pOEYrcfX?=
 =?us-ascii?Q?Ln3WWGPKt6ciTFUfLs5igrnfbOWArIRFfD/XwQQ2Xt1jGguQoxvKLNV7PAsJ?=
 =?us-ascii?Q?xp577IScaoAl2fzjlYhNv37WYD5WskYxosh7eby0tSCYIH75UvpzEpQx6qBS?=
 =?us-ascii?Q?+N+hRiOFPqN0RIp8e0RSnFHl8U6g4l95atslSUzEiBxNEZuzrdJ8gG8Mt9rS?=
 =?us-ascii?Q?vBRGxJtSjf4sKtB9hDhfVurTJV800FEeQvbq5LjkKWcobV7t4o00L5MF2lo7?=
 =?us-ascii?Q?CG2n+cd+1ytHZlIUPY58OK7D6PDxg1a8JtentOTbctHEcASfZFpvsiejxwSY?=
 =?us-ascii?Q?WqEeTYUwRebg3xw8voX4V/lwh0nx19AE9QBEP3aKdoykN/zl/TEBVhrBdfHq?=
 =?us-ascii?Q?0ypHWlXr5izKXfXFWqHWdAJDPMbnmlwcPwfAAOvfVhEEjC0FY35nHmdUuseo?=
 =?us-ascii?Q?29pRACBlLQQUr/J4pmoy/KpMVi9V+anNvULjGWgaIeAYMSonIB3LvjLHDCad?=
 =?us-ascii?Q?bPa6rlYY7SaPOeaiD6ReoctR2x8d6jrb8Ote8X9uerLGvOoicj4hixYmME8x?=
 =?us-ascii?Q?Fzy701wLbsF5WcNqeq/CUT9ue7ffkJid+vcsZm5psjqGnVxBMu7CQFx29kYo?=
 =?us-ascii?Q?nGifcyjcfjZAE/iQeHbH0btSWGD8t/D2xj+Q+IglXZG+Cr+44xKFCgFboVil?=
 =?us-ascii?Q?2GHOy4/Yta4fK15NpA811Cv38AOEMhjTpSXXe4SZq2galpS6UMdbkD3TlEPt?=
 =?us-ascii?Q?U1Px33VcX5V2CYoZYNiq02HXUh8mcaisoOVFtUJ2begslz8JOEbdz5eUE3ua?=
 =?us-ascii?Q?qGfaK6i1jgWbE21liwdyfbgYui09maAezePGbjYZXWucu6ZbdnZfEh5EizBF?=
 =?us-ascii?Q?uDIpGbWXdOwqRNaN9PkAYgZFnMJDv4cFFMdEC4HDmS2QmhgLIO2v?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cced51a9-66fd-4f84-8261-08dee8847b2c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:34:43.4082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olbLehe6wDm/GQBSFqbQAeAm4LgO5p8RvN4E/KqycuDjH9z3rIpjamrbbqRItFBM/WNrv3tCIF6TS1iylg2+UFrwcj9cO4x3fPP8QrCKXAfHC2fx5S2zxCDS/LiW2ghd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

It is calling snd_soc_component_initialize() / snd_soc_add_component().
We can now use snd_soc_register_component() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/probes.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 099119ad28b3c..e957ef46198a6 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -296,19 +296,19 @@ static const struct snd_soc_component_driver avs_probe_component_driver = {
 int avs_register_probe_component(struct avs_dev *adev, const char *name)
 {
 	struct snd_soc_component *component;
-	int ret;
+	const char *comp_name;
 
-	component = devm_kzalloc(adev->dev, sizeof(*component), GFP_KERNEL);
+	component = snd_soc_component_alloc(adev->dev);
 	if (!component)
 		return -ENOMEM;
 
-	component->name = devm_kstrdup(adev->dev, name, GFP_KERNEL);
-	if (!component->name)
+	comp_name = devm_kstrdup(adev->dev, name, GFP_KERNEL);
+	if (!comp_name)
 		return -ENOMEM;
 
-	ret = snd_soc_component_initialize(component, &avs_probe_component_driver, adev->dev);
-	if (ret)
-		return ret;
+	snd_soc_component_set_name(component, comp_name);
 
-	return snd_soc_add_component(component, probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
+	return snd_soc_register_component(component,
+					  &avs_probe_component_driver,
+					  probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
 }
-- 
2.53.0

