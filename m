Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8871D2E2DDD
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 00:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780880293; cv=fail; b=gJomW6T4Gu29m1NGh100ZuoKnH+/9RV0sj0PSwVCgRoHDrGogoZAUtCwOImxor8bEFrYxz4hnuoHf7CJze863i3P7E3reIjI8LtpfNvjAxalVDHk+meUVFTP8sgDlKlnuw8lpXxIYZqQsgtj5r2NHnQoaV5fXZk23XZJhW1dvG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780880293; c=relaxed/simple;
	bh=QtrsgtHXjWAlOerXnQOQ44XXjUc596IT6K0IEvmAllI=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ItFZtB1CM5TFwn20enkk3CsZlnO+ndVyMuZ3geJ4xB7duOAY/KuUjeOwFfV9ucznX5k+JJltuIXpAk2kjmhskYpOhMqYa6d6NEQk8W97a3m8sWbvVLnls8A81P9XTA+qij5gKqv4EsJvHFL+emvC0+cySX5LQd/fDWBb/T3UY7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=E5U/ixej; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="E5U/ixej"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhFkc9kGd1p1uNvfIc8as8M9975LMZVfkU1t6vUPBjYbCaBC2IPVhl5Wm70PWmouGMiTcARdl9TwxqNy2cisUo1J1koOCb5lpCP+bvQiTT+j+7SdPYVa6Oy+oqzHb+nWg+UXAUNUceOGLLRggoYZG15LT3mcqliQiUTQtzlnmu6pEyoAlDC79i2+wUbJ9YSC6mH6gfhiSTmkNQHG3fLd5h79u6GCrqcknYrVSvDWuwhJbuMNAEgXGjg1rn/7OLLCQ6oDoSeQHF5+TKB6qS0FWx2v9ZtSUQeAtso6tChKdSkSxBAOAHwu6brbhBBJqnTX4lxntV2KK9c3R8PFQG4cLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dibVg0AtH8orxUNkJxy/zB7TmClb+GG2InNi9Rjwyk8=;
 b=i/MWQGTL/L4BvR2G3Nyks1ACbCoT8dsc8K7XJqWGQKtRF17HcS3l+husp34P+MrQa9U7tlWkWacs2hSwWCxCloNkKPDIfUqSe0Rv93+CLQIrAWwsUplCZZ9L+kwAu+7tZ4siPsMjLVAjKfxGlm897W1tLsI+ZjVvZ/HPQID9sUL5A2w68GGZlLbDKpzRfbySu0eNVKkcby2nmY76bGDL+FMAjrTSY7BmYjKpqEohDEI/SPTq1ot77vS0KqjtTaUzma4Nd34N9RmR8bVnsRhpx/STtLQRVupeAw7CokCOd8RcobQl06NEd+BnjQg6lBVhaEoU3bKfuTfvx2pI1T+oSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dibVg0AtH8orxUNkJxy/zB7TmClb+GG2InNi9Rjwyk8=;
 b=E5U/ixej9DqP9H7GlIELlwfinKk0Bm/ehD0+FMhW6L++0uul3XWe4VSRuRBVt0ZhSxabSPUlhZMa0PHv8apRyJ32j3t0CwiRQ6Pd6HGB1SuXpO/J38eES5Fo2Rd8eAEeY4VvxK+NfdJXOPD1OBs7T4aUu+4ptkg+2YYpwN218Zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB17966.jpnprd01.prod.outlook.com (2603:1096:604:478::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 00:58:10 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 00:58:10 +0000
Message-ID: <87o6hletlp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 6/9] ASoC: codecs: pcm3168a: update auto select format
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 00:58:10 +0000
X-ClientProxiedBy: TY4P286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB17966:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f137f2-8608-4f30-4f02-08dec4f902d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AtP+7IeTmm/c240mRtTFtlu3iIAshEr11CiB+JdHqwnNA+8vRR9Q0aNwpZb7Bear8Z0yPmKczm+989Wnh06EXv5/xgK5oNGQfs2IN9Ky7oMH2KGlIdArDBBVVhMeajXO1DFoDhS4JNW63ytOi+AnpbXrmFwVcNiLfQRbgwkiAxgchJnFob6wO9CB7CwnKqVf/v6cnL/uQK1LOLquHVVXlebhXVi33BD0PjaZcC6LcppKgLCDjuCg7CcXvPweD8I8uWpEEwRO4K2CpnfKNXzADf577EoUg8h9YxZeQ3v7j1mGdJvf3JsAfwHcZZBogr7xATirj4e2lvg11pXXtxBgQIPfJ/9RSTi/o3Na04rMdTLNEoEmT8W6izAzCeKxWZ+GT3rBz3EXSXAQBgDGnpvu7Nv59rm+8GW8uDPPeNvOhPxphjtt3qDQUrc+2SJWnkK8fdtq0/Rv3ZHkUfoitgdCznB+w7ofUhS+qMc7p+HXvOwHPh8IpKFqObkN/iiEQsEJw1ENZWmc7L66PQTVBJpsBo5DcvPn2ucyFAHsPATpcU/lVOiVomujs39AwE8OQbhXZSz1b5NIoGg5VNfZcVF9rDRC3/q+CSyB94qaae45Q13z/vZuhNhlQUB0DuPpsKMYAiah5ym8aqpFez2AcKAlHPRJTfnaekixP4ZmFSbWIThCm+IJUaS6/lWh2qOMgAfj8d7+2e/gdW54kR3fpvJ+QkbJDRmpUzgJhjlqlPTZDJS1JpRv5qdga8oWFIbOFvqiSp2S+9v3VoujXkgU390Xog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wWjjIgDcXl6XKkIdae0mJW37UQce9Ro6vT86Yhvpz5+B/vanXcTuf2crzVV8?=
 =?us-ascii?Q?xVz0oL2DEqcBQyc/61h+/YX4hKM2ZUeNDErkWPkF24/FTUjjmDAGWthxL2Mf?=
 =?us-ascii?Q?ZEACUbSCPsu3bLU9cHUepu4Fk2UkBIbJ3hIQVXZI1cXbZAkP8YQszh7rAcxL?=
 =?us-ascii?Q?l6OyWBAMUv9KZkz9tAVVaCZCd75LYbI/H7N/NSjw2b371T2Obzy+5ND7WffM?=
 =?us-ascii?Q?AsVRm9Glv3/LIrgHGF3P9+Sgivzf7OBm/MejUFgAr34v3C+COXl7LEWhZuG8?=
 =?us-ascii?Q?FYyDu88oHhWIjph6aVXGmQTgzdl4Pa7yQzejqWAEgRWJQL5SjykKTPD0R+hU?=
 =?us-ascii?Q?XtRKdNi4n7jCcxojqnD29cd0UibAnZ5NMykjxUHy5UkO1J+KkH8tRw0dKLi2?=
 =?us-ascii?Q?xqU7fQ2QoCnHuHhPBmFvFgD9lZitAhZQgG28omZcB7bE1t8D5uSHt0Za0j1T?=
 =?us-ascii?Q?3+Mr5LMFgtYsyEIhWPUO7Wm5fWJjrYEXYhaXZrSk1mLPZ0tCOiMqB+bq7ZDS?=
 =?us-ascii?Q?AVlmTDzbCLDl3hcvp9OxQQsUfqsslennxeKy4Vs0Rwwwr/OYSSqgPvVVOOxh?=
 =?us-ascii?Q?E0KdCT4ok2XA+MMwzIvgNSxM1NJPNQj8liAQBP1evymUgxVA/CE/uPcIm1za?=
 =?us-ascii?Q?ZFFNfyi+Ye06+g0OxdoGxP0/RQb56wthgCtS08Z1o8O/sVv3KkanYZegOIUH?=
 =?us-ascii?Q?TEDwUO4eDx6Gk/ePJ+5ilecMZ+Q9pI4wHxCG0WedWQErgKED+O4GUTDmiW/Z?=
 =?us-ascii?Q?9WmxFhCk8jUi/Xi0Xt2zBHxA01lAVMYjTGDZFjjdwmzxpqtDyGXXbXH75vpF?=
 =?us-ascii?Q?weiWjPiz5GknzmaxdCUc7ezVrgPkCq/wM1Es8RcBIgwyxeHFnbZ+RcD4Lf7f?=
 =?us-ascii?Q?D15OqC6HXfoZ9T6BAKSqQY+4zi3zEm5FZGG3Qp8AKR7ygV4v4XRkMLtiDQon?=
 =?us-ascii?Q?DLsgOKfwLqHVsVx9Ahsr4PRLPOSZQUgtjRX3LsFVqt+Y8e1vQNpetX0PO4Gq?=
 =?us-ascii?Q?5nNpwvW5x3MN/XtGNGvOHYP7Sm0fXMO47cmoe0TNEPwb3V5bN9XpVXdxbD/u?=
 =?us-ascii?Q?ZosWyHD5y6FxfGxLWQAe6DquxYpZoScdw6xFJRJJKiZpGCIUdvObKmsuJajx?=
 =?us-ascii?Q?EWkGLje+fNmbzCbUr0pzTUtbBxCYGW5/Qbw+lVO3BXC6dXyrwfnLjeQrGwam?=
 =?us-ascii?Q?exEfZ148J2tN7WUWf7stei0Oeq/noQQ7mjvQwouikQm8Y/zPZtMkwBsVOpu1?=
 =?us-ascii?Q?b0WwaZOomJ7Z8Nhe6bbAVpRpJUhHQjhrpFkT3RXt8dJWxbp0Mcs8ulJoowJD?=
 =?us-ascii?Q?S3Mrv68PuakRKP15NE5VYbocWLnBGbtAgKrEIyBHdvdc8KciHyh+7jFP3+uc?=
 =?us-ascii?Q?dJxMaAy+U7180QY2yCTASO6crOkHYRYuQs89KhSJ55PUYf2oy8vmdik/eWjM?=
 =?us-ascii?Q?SjhAHBLqz36Vd5YuM8HZ7GBoiL6BjXBJ+SzymBSP2fH3xmS57/GPTUp1XMaq?=
 =?us-ascii?Q?yOU9JuWsfp5ulhTxYtt9Y3QFibB19wZ7oCnxeBg21fi+3UIFqw01y4mS2Tp7?=
 =?us-ascii?Q?ENRS9iVZmvL7DIVZp28eDJY8DXAlo6EiU+sRApwcXrfjbNU1fR2bMaF/71lt?=
 =?us-ascii?Q?QYZfsBSeuNJ6er1/neYjbhxCewnVbzmh1n6cTj1t3wTWlmb04cD+sXns4AFa?=
 =?us-ascii?Q?EeKZNc4hIuHCkoNWKPsE6uPebuTgGJzpiOqgqkZOa2FOqhJokkZUUUg4v5eg?=
 =?us-ascii?Q?BqWuEmrhwn8i+FS+BFTLg372jtyOQlqshsHuDQhC14qFStlIhbM/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f137f2-8608-4f30-4f02-08dec4f902d6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 00:58:10.8069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eM2OARJNEJYNkvrjDf4ZVN5Ky5xkU94eGPkeqSN04sHWqLAW4PWrs+TchR5wftoa7yyvVdmpDeiMfRuWwu7HYD8na9npqtJlGa1kwfannfwBc/Xnhdwrtb1KBmDhS42E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB17966

Current auto select format start with the highest priority format and
gradually add lower priority formats one by one, and search matched
format. Like A+X -> A+B+X -> A+B+C+X+Y... (a)

But in this method, we can't handle format if HW has some kind of
patterns, like A+X or B+Y etc (b).

Current drivers are using (a) style, this patch switch to use (b) style.
This is needed before update auto select format method.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/pcm3168a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 55a7fd5f9251a..cb6a6f08f2f80 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -575,6 +575,8 @@ static const u64 pcm3168a_dai_formats[] = {
 	 * see
 	 *	pcm3168a_hw_params()
 	 */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
-- 
2.53.0

