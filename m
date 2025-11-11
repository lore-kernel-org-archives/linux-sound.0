Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B4622259F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821252; cv=fail; b=IlVhHV9wCo2PBE5FFxZtfGMKcjQKytkK4Sju6bGLrrmqy9p5CAa014iU0/E5QdkqRWFNE9WyPUzKMYn/ej6RgQveRhkXsbbLkicq9i88lkw7W31uPFR0mES6uftiBF8i0R1c72JxCCvrzpbLen+IfZVtsr9LFQIC7kIAvYdFPDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821252; c=relaxed/simple;
	bh=HC569Gtn5+OFuCvSuwaHHzm57poz6E9IJ4E2P8QFO6o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tMMF7bHbseA3J2T3v51K8GAAZKN8iRdN+ya1OXjYaaJ0Iu+gsEBGulsQ00yVbebSfN1p3dofab1gu2cxrdCF/8ySxaKw4oLfqzUKy4nTuYMZN0hm9guMPWlmmLNieUSPfelBFN8m+Ku/k079Ir6xTHsvwSPnM02xNfVPh+pdWFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=F0Ya73Dg; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="F0Ya73Dg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fp5AdN63FhF6YJwLAArdru1Toi4TuPYtPGNvzS0dTAcuR8d2yWtsOX+0Y+nf2qeu8EJzxr7485NLZ8WfZa7KDwm+F9bKTLg79wVU5xqdKiCP4ndN9xKMYcQ2baVR5KoZvkJ81uQ/sfJ7uxvocJt2lI0Td2B5Q+rKNTK6G5xDFkewnu2Pi4A5kVVwlkJbo8nEjPGRA3Vzfx3NG/to4VFYsgR6rndW3zfKXc+TsU+5d/AAhtsg9vytIKNdLSb8nefKLr9puGt+lYHP2nb8/PzmMNgbmlicGrx1Bumb+A0ygyzkSJskYa/a6ewkXByNwg9zVrqs2JByOv09NG5KPKh7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pbwDXH9IIXfVG6f9tcjhso49zGgxuKgFrFpSqBHF4o=;
 b=ZMtgFFRFlT6IcdoviTXYiPfZ+J2fmHpwhxnfmhfpEarKGLqENU88HVV35jjIHZYt9pxSfP5kw8ViOfuKhqkwjZIqXlWqEvEGtpIu8ZIcKZlIIDSQE9a1y9+xct88aYHFEk+N41MWeWN4RU3sq5/ge0u6cF6UQlXQNZ8cjAmHUGh+jVSEQxg/JHFecCewhAhjZQWREGO8SiwO2Y7vhlltsTsJpXZhkV8ApnZEtHNNjnHinxJpcGk1mXBi6oPNnbLfJVMf0Yn9KWM372Dm54gidA5RW5AofG5GYxLG5Dmu5KwqlMZ9mNREwv/OOwUlfnlQJ6imPTlP/pzlFjCcv4mM1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pbwDXH9IIXfVG6f9tcjhso49zGgxuKgFrFpSqBHF4o=;
 b=F0Ya73DgAjoGUbu+Po924mWEtYbTwxPL5EY/qiZXUMrL6ovPrRNAEHdnYSs0SjL5lvfncsOQgSAHXp5QW8FWFv2JNN9xCXdjk5mvyEr8c04tDuERNvKpbTUYkgXjSUoDbWPau78LG3hP5SqDUnVxDR/+ksXku9VDNyCEU4zljqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:34:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:04 +0000
Message-ID: <87tsz1v24k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 237/292] ASoC: meson: g12a-toacodec: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:04 +0000
X-ClientProxiedBy: TY4PR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce12359-aa1f-48ba-b2b4-08de20ba0457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7aXwqjB3kr88/nH1tNXxtTBBeJbGcIB9ExYRNBUhQSdFWoTnCu3/y2rjr4dQ?=
 =?us-ascii?Q?orJOjtpSisPMdpCTBUQD8nS72Ca4I7kl881+yUpwRC6WUd+jkpCv6R3JMUq0?=
 =?us-ascii?Q?wG20oIeVlV4nmsELqkH/eDiAzuf3AeR7iskv5zrav1mgeIyxuU6Xu01NBHSF?=
 =?us-ascii?Q?krFi0Vq34BTxmgQfVv8cs1Ui6NZcOzY+yODBFUZaHxrqzUhmwjgRw8iwCdCu?=
 =?us-ascii?Q?As5jhUCo1tFL4akr/h3Im3c83+30kGgLiPrcvSQubtYkhgxEjZySZc7Fc1u5?=
 =?us-ascii?Q?MkXAHUBeOaTdnZ20Iu86qNtmvRYY2UmNAvBe4RyyQHVqy5UANlGGuIAPDYZM?=
 =?us-ascii?Q?gHhhJwJ/+cOF4vc2+bUp5JnxmwbbNh6UWVQtU6lDH7ruVVREGlAo14SIRq/+?=
 =?us-ascii?Q?HXXZeYI1ifG2OGDvGIv0jkIusPtMzMarYIwDHQBFumHQH+Vj9aCl7VBvbbkG?=
 =?us-ascii?Q?sEfTT55Njg2ALgsmSeuY3qx221513KmL/sirLSZr/jpDr3r1ct5EN1Uhbrp6?=
 =?us-ascii?Q?+Zx3xm3zM+tpapupi3RolMR00ubB34rJV22tvtovG+705K0/bG/DTMfvUrn4?=
 =?us-ascii?Q?s4fopE/K1sr+q+GJUhcy7tFJIzC9e4ZE4hi8yx+anLN5uGKjNbtZl8VDtpQE?=
 =?us-ascii?Q?R3BCA/AjzV7Jz4fooGIZBF8W4eya27Hio/CtvTL2OB7+M7VU6wmE+JJ8ru0i?=
 =?us-ascii?Q?BcUo4rzFvnpM1aeOKrTvzGNN/oP5ZVJiqkXmaJ+zrZwwDAeXJ2YlQB1Tcbd2?=
 =?us-ascii?Q?Jj8cxxAhKjTAhAvPXlax6a70dLlr1uN6XxCVr2JNY7wMkeKTeM2QwnYAcjPO?=
 =?us-ascii?Q?820GmwexWKowkEKMAfR/gHfw4qHCfaxGolbY7h5O6Nfb7s9OH/kMYnnjAyC5?=
 =?us-ascii?Q?QrrscssHDGm/5okHk0CQAV/BUJDR1TeKdZxNfAwkst5RMn0ylPqD6Jzch1kM?=
 =?us-ascii?Q?wgh0odijZ4lmqETV8zUsyWuqqYlNon1e4Lm/2rZM2N9WmlYj1kLL1+tdA79P?=
 =?us-ascii?Q?HMwSavZNkinDlM8VAVV8VNWlFwgGSgjua0uWCZnFiWWUvDFLKlLGiNlZ6LnE?=
 =?us-ascii?Q?RuNL0WUJL+S24+WWKUEYWchvVWAj1gpUczL5S+06A10gA2xN/y48f+6thsgF?=
 =?us-ascii?Q?mFQRZW7m5y+qjlwTNnoov2GRxBf2JtdwjuURfcq6jyP0iHVdL2+hrEIKmytO?=
 =?us-ascii?Q?30k4sloxELE/V9JV/xI+bRstena/aWzHHf2lSd9nP4AGbkRriN4Qr0k2jy4l?=
 =?us-ascii?Q?2CxFKsbyCvtorR8Cc77ZIEZgejVn2KazF1OaAN/9UGprSItDvVql2w66VqZw?=
 =?us-ascii?Q?u6V7f5FDnZUcYFtcN8nWfEkVxvwt3sv/eSU7uaJC4sLCQdXZi5o5b1QEIpSq?=
 =?us-ascii?Q?2M7eEmfcCVame49UiTT/XSJyNpIh9S1DSWgybq7yOydfF5ayl6j6kBmneG17?=
 =?us-ascii?Q?ktVoZJLPBxXaPjUjelJtKBiQaVM5Kfoho9l4b+jHFSWXonfA307jcqJA6Oux?=
 =?us-ascii?Q?d8zj8qAXy///5y/F79tf90v6UUWPYy1xvM5N?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CdMkzqakc9u4trZirDgDiOMTr22aMg0s24ewP7LFlCdhzwW+08zO4Q4lUPLP?=
 =?us-ascii?Q?a2tMTV6Q4d0/el+QxPN2/B9RAsC/8JnRagntMPJFqgxPiBEQCmmN4Fit8kCg?=
 =?us-ascii?Q?A43lxzhil0zV67iPa46u4GcrGcYx/YJpJvgYpq3708Jw5fzrIVwm3zecuVf2?=
 =?us-ascii?Q?z3GgFaXpa7vyW7n4exFI58DXPDq6LjsKgHtNsElbiyUyeSxXlZ8roRDaE1DY?=
 =?us-ascii?Q?ATwu1W3xVtGOMQxA4XAOpDOA1AIckuHeIlQTOSSeHSOtZQ5UFkIZV1zmVX6l?=
 =?us-ascii?Q?9kJpfOS5M22r1EL+lZt0OaZIRhYvlh5unZQcdd5eawmRR0AGmcw1cY3s/0U7?=
 =?us-ascii?Q?Ql+W3ZkqWgUaHhMw6wCbckJv8nXRhnq7Mv1rttMcWM2M/deeJxVm8ww0ZXPv?=
 =?us-ascii?Q?JQXf7H9RmkaTu0QsM+PN9aGBAYfBn2Oq57sJUg6HbYg//BrHaGBWEjwVJR/3?=
 =?us-ascii?Q?CnPRpV8EBV9KBE14rUW7Oef13+QTEbTnIwp66phbN8QUDxH8Y/r6b2QqPsGS?=
 =?us-ascii?Q?ckW5rbTmxD+iLa1BLhLmFRKBX/dJy88JRy+jAgmV56mBIzkerPAaLAg8gjJ4?=
 =?us-ascii?Q?eDXkl6/KBxgqCvatH/nmiCm53rdtnXrAXGxLjVpqYf8OpQMTzmZd8pknwmDv?=
 =?us-ascii?Q?TPH/0yfx73Un+zNpfBbDereaKIsebzoPI46aHVSkIAQ+4ajtUx8rDFu70KPE?=
 =?us-ascii?Q?+QlPriPme7BIyxvylki+o8rqe1PwkLnK84yy1+nvNlRADkGxpPhOCTXsQNiy?=
 =?us-ascii?Q?6zx6z6nTAjXntvgv6O+S98p/JFJ7MorqdtGzABdocMuosLai9AyfQJ5Cwvz6?=
 =?us-ascii?Q?bYiEGVWWzAgkAK0lvcMdpUQS5Z6jI1H1lgotR8gKjxgBn4S48K3nQVvHeYu0?=
 =?us-ascii?Q?M288eIwwgfVdvG1TG4TS60NbQpxDsRy2sLbgrZUs6Gzz9VmswGKAzpFDP/2i?=
 =?us-ascii?Q?FINXrZF3fTozHKFhmLktGgJHAEiXqJ1uvh8V+TwcJ0vxG3p1sxClZVrKeCtZ?=
 =?us-ascii?Q?epMygIm8U6THFoVHZ/SaUDuafTLvPJnWR3ppyfnkhEPLyjrsz+3dXcaDFo5e?=
 =?us-ascii?Q?0KMF2iyiI+2tzSRhc2WYcah02/2PvyjuDplbYlWnyKvAN7OBhyIBt+xGMaLn?=
 =?us-ascii?Q?yrKw15GQErqKradRAbBRfGD9WVsvXCg3krPE+wDKekEeKpUjjHD+S8JNZcdT?=
 =?us-ascii?Q?YTClmIAF3tCcJhRUcset/007fC6pfZCLrCYkOrvSlszhpBa5ww2RNre1xt2p?=
 =?us-ascii?Q?B43iQLVaZ9z/WFR3UxXLg9JZGv+1RH9ykKiGoJUzb1+Jsqi4qV5xBR6JhHhX?=
 =?us-ascii?Q?LbY/m1xKJscUW69aT+nK66xkjxbFgaPh9Jo+1c0vxvgYSRjKaELVFoHBskYJ?=
 =?us-ascii?Q?KBG6aZRqfCb3SQ4JupqFknrmoOcctWB0v1xogXsx87s6GgLLsvN24rQ4MOFg?=
 =?us-ascii?Q?xkhtVjTsBMZ/QGj6aPIQHK1Pq8UuszOPGJLhHVToCvoGsxgk4lD2OHhbgRub?=
 =?us-ascii?Q?xtvcEnyrAjJmiOpub3ZLa6QAlmCc8QuurpeSVpjXStGkN/nI0818m/4yt/tv?=
 =?us-ascii?Q?p30C+qkjmaex8w2XIc9bzZiVO6S7ZmGSkdnfS76wUYKeY2EqOhjmLeXQjBB6?=
 =?us-ascii?Q?mBFobsvtNEB0uwW86s+vreQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce12359-aa1f-48ba-b2b4-08de20ba0457
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:04.3276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+4E7akcTfOvhDCeTjB5SDuXry9EW934PPYQGGThVhUp1XiIZF6w/8h6PLjghMlASlO2n/G64mxzVMj8IqWdFfhFmONTtDxectDKNEWtv3OHaKkof3mUUd8aBxpLMc0K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

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
 sound/soc/meson/g12a-toacodec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 531bb8707a3ec..a95375b53f0a3 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -63,11 +63,9 @@ static const char * const g12a_toacodec_mux_texts[] = {
 static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct g12a_toacodec *priv = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, reg;
 
-- 
2.43.0

