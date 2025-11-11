Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011052.outbound.protection.outlook.com [40.107.74.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035EA1E3DDB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820978; cv=fail; b=GA/MNrSAWs653RW7nc+cCO28lREvzT6s/v2eijMCzzaZBdJiGIx0orlbjU+dT6EQIFvb4erGRFOpUV9nX0cEsWFKyw2O9jljLyjvTAaXqo72YISq0mHe6BjM+4wq6zSRSf4YNflEoLoVSUTLcdaD6EzJGt0mKq9y2dJLA7TR2s8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820978; c=relaxed/simple;
	bh=oMKRiappNwsJasBlQ9C0EhtyrWaTulhwbgbwQwvGoQw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=klLnjYteAFV0BTCzv1653O9SQbDlYxswvqVN2XoJUAZ8H5X6LI/z6HtXbSNhC9vAaO4MmqPGIvlpaHLYHmFGDP2unA8E4nMrz9J0J6xAp3jk6K5Wk0kcr5MuLHgqroHLeTWm8SP53gRM1uky4KcCw2NJngteZnIe9UsxhoIxNkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PdslnRni; arc=fail smtp.client-ip=40.107.74.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PdslnRni"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBna0uffjYjNVxBkKAWPMpwUiDfEJz9/fpyJO/2GqBHfpE+MqTuStn6KlFVXo1Z7t5o2HX8ry4X18jOmXf1tcH4E8Sc7oZIBIyJGBzAZ58wn57Vsab25U4uOcWxkKyr4NnmSYAGJzaCrIOhH8K9VRFyUPGAz7328Ltdo0CWvoDU5SLldgP/uXqfyEkYTkJM972kKN+DmWqlT4UW1emd1BrlrgY2BASHohuo6+Hgvt8DT94YACi3qEvH4DIG7xEHVAXEIwQE58lDOaeL2HZbMI4748IhygR3KP9PgNvvBjVMA0fR+p4u0H4UXguzfOr28v7rN0VHDeQPxeCWVl6VADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gt2vDGT5JuBhJFNQb9fUhncJLcgpKYaaaR7GNs6pzAI=;
 b=WKLHis1q5ju3i77rcBTOqAqX8EQ7FwvMv9Y1IXjXAZjG7YHLiX1CQbKrm8/Dyz2U4WVZgoR0ecrt7fUMhkH1HzfL2dC1L2kXQvm3arvB3JMW8aPZCC6+7o0IgmxyHr/Z4vVsLSrfHEk8R+MCofTAX+qbu5V4bqrYgv/UdWyAcVLGSxnm72MtAye8ApcNvXgrWZ3re2XpNQjsIHVy4+9oml1WpwHBon/fIVLhJRCG980EINmThEshQeRRguT7yKA/KYk4W6ygL3XfALc6hsQwga9wtOy8jfh7+oWvoRVA2vBzDoYsUDkLAvGShyV4Ap3Wer7U5Mn4BR0BBVyrRc7gsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gt2vDGT5JuBhJFNQb9fUhncJLcgpKYaaaR7GNs6pzAI=;
 b=PdslnRniYeSnu2jWVnVlg1oKhlKIJLTuq3j27faLtaiYQpRFviNsB9Mp3fdy+VYktsZiTGjnFMSY0ShVuRlwxlPIlVPiAIhWMomEIa/pzK8yFICP6Me/lDtN7qGV8uX+z9CoKHVF8sOkrX2OW25w6YLAs05BzrRQ/i5q7tGhJTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:29:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:34 +0000
Message-ID: <878qgdza1d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 177/292] ASoC: codecs: wm8978: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:34 +0000
X-ClientProxiedBy: TY4P301CA0018.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: 402ba664-86ec-4e74-220a-08de20b963c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZGTh0lWAG+i94cLQ5Mgoanl16EhudugZagbrRUkkMuTp0WyXB3ahqF+Af+Ru?=
 =?us-ascii?Q?hHpoeIpcCyrabu8NA1OY1HAGg6ujzdBM1WqLAx0TjHZEf4k7xUzxMP5w/cDf?=
 =?us-ascii?Q?ZbyHNlV93pzVoj+Dj46NSDR/z+l7+yV8kPDJFS44Ja6bNanr4Ha+iQejvCDZ?=
 =?us-ascii?Q?QNvF+QzzShTHOyGMJu80DIMy2Gm8pHveyOHErb5xedLI6ZEIhc1sgXq9YjFR?=
 =?us-ascii?Q?l73QYwokWqCHVKotsDf9qJ3RaPSTGg5BeS7wGXFXGuC0mOJHTmLaDN1qcyt/?=
 =?us-ascii?Q?5xP2bjFdxC5swQe9X6/9+p2N//GN36CqrM+KWCfA9WlOCAf6SYkGPZZ6W2HV?=
 =?us-ascii?Q?8ny+OzzzjiwvIYAu33Z+f29IfA7q8xbK08CDn1057PapX5B7lV3bTgkaqFCI?=
 =?us-ascii?Q?18yjA7IbdNSw9iLLIBJdPps5rFa4nIhLUHEqCG9e+BbjF9qw5TrTEU9xzZZM?=
 =?us-ascii?Q?W+3v5sG0Zwl+VLf0/0D5tlZGDcBycOKbWOQiOiojsrzJfISbkhbGNh2FTgHN?=
 =?us-ascii?Q?eOYuzht7mgHrNnP83si8moNhb8O7ia0n8idonEE4YQQDtefjlEC8FQOp3zQ8?=
 =?us-ascii?Q?InCPPQW/zUTMi2b3ewg45Oo8Es0Me+CyWst949X4dAQY698Z7XbcalDH3qp6?=
 =?us-ascii?Q?Xcu0q2jbVPNW9Bq8txsNjTa3Kn9BHzqqz9MA8Tu8S+pRAfBMeaLQ8Wj4T5BN?=
 =?us-ascii?Q?xrMH4rfSDjksiSh4ydbbmFh3JnB56fctBZOcd0FNoJdkt7jTpx0P40/onfCA?=
 =?us-ascii?Q?gXySrOc4TUSd5SZ+2qY9phrfSC8rgNJeHHPjZI8B8cOfqAyaF1Tts0hmww7u?=
 =?us-ascii?Q?3PG3TRrMCy9JNLC0ZTaZZXPVRsVlf6FIvlIBBzjGqeE7P+XCQWkzkg1b7DhX?=
 =?us-ascii?Q?jkNZk8MYSSg/zVSF3WnuL4fGvZo3HfuWNunOx8yvWAq6Z+Oo3/qqQlbM4zmM?=
 =?us-ascii?Q?8cSkBoTnUNW6OqbSVU8ZIQ4SsNo4Zc9PiOgz2tvzyU3DGCBPpvpqGCJC4Wiy?=
 =?us-ascii?Q?qkVrFiQxqz9xgP4/b19O/hdQ115syF+/jLSzV/fjqbtvGdAZC/EaaTMXEo0N?=
 =?us-ascii?Q?eaFpv6ziK/7JSLDOPeY1W9pZdzKhUNoC0aDW5siXc/0NXXdIe34beVv4lqkS?=
 =?us-ascii?Q?wZY9PI5LYfeRvL+WYZ7z8qu4tr53vHYMYsW3buHGILbXWmMQz+QtOjXEH53k?=
 =?us-ascii?Q?g7mKnPb7pavPaB80pYPsFOtd28fuPC1H3eDpfcnkyblCyzipAyzMyDVNE/m8?=
 =?us-ascii?Q?+YsMoSCbybj/R4XfyRoaNe32antt2lhdk9gK/gqVZCKnOWjE4W2C5K7NQpnh?=
 =?us-ascii?Q?no9DNKzHZv8lLoELDe+riHyFPjKrVg1gaLcBYZnufvNpchylUuQD+AlahabH?=
 =?us-ascii?Q?QjXIh6bmDO3xyvWXT5fqGWLIPius+VkU6zu9VqH0OF4tfprftSBsz8SUriUe?=
 =?us-ascii?Q?E0j6tHVFJw1sBrtzN/Dm/dhzfMsNDGz+WJgR41lU253eS0HBui1tzUvzgakz?=
 =?us-ascii?Q?e45TmURda5XjGgHVgsP9fxlasX7masNLcIMe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ck+L4kAizMrDufLWwCF+6x4u3b2Pl7wW6bfbfyZasVjitcBQ3CxYYb8LKiaG?=
 =?us-ascii?Q?EcPsZ0C8wDWRN+hWsbJSvhx4naaXl+OrekcYvS1E8Tu3vTl1cp0zMhemURbm?=
 =?us-ascii?Q?oQnNnHm52JIORPPkc683ovB9AB2E9ZebLKto49L5V85NMZ5kCgS03MoSeBST?=
 =?us-ascii?Q?SMaTttT6AgcM4SlI9Rc6ulC7kAL5b9/4PUAvvPzM9uPLKEh6YWnE/a2P2PEv?=
 =?us-ascii?Q?2Fb14dW9b4BpEPFkr2DMQRPOjskAejuR9ZJfKEacsB59RLjKV4pxyErGWHiN?=
 =?us-ascii?Q?hlepSQxb4MI4BA1/a73Gu6QPoXRo0Ze7gU2Ywwah1n4WxOmCLKpdeNAyIm06?=
 =?us-ascii?Q?Yh6QX23G1R2Sbiv8FWJKNgskOvLHDmxZ4Kmp2Ptl/L5AmNRsHLAYS/022sgw?=
 =?us-ascii?Q?tQVyKWQSM+Li64qpXWclkwshUeJsGE3KY/fvKO884DQ2D301bGzO93lirrB1?=
 =?us-ascii?Q?PDQdCLslXwCWiXCPf2W7tdHNSOsn+/doOxnAiIZ8I06iQI6J+T0ZoloSBgbD?=
 =?us-ascii?Q?IhB2WBo1zqxAjO4VRke8pCXs8tilpPu4/Lz1xHr9ckYyjHxQZXRJp0c9ffD6?=
 =?us-ascii?Q?/hBg5E4DfqLpWw2eN6EnzasH8h+fichh5GaF3v5OlmDdkGysj4d11z4aAZSX?=
 =?us-ascii?Q?A1SIDt9qNYM9TDilJDipt7+f+a9VMPuYwYK8vfHbSZN4flBYAeD4zYMfKnEU?=
 =?us-ascii?Q?OjCHX/uJNn4BOd12OZqkqfikGov3U1AvSO8502Rfhxmno71HbTFKGif36Mvj?=
 =?us-ascii?Q?+AkWOSzWOmy8uqyWGoq0gdGEvKkQ7dP/v9g0MFTYgbB8rXYf5VhAwo5u5AGL?=
 =?us-ascii?Q?H2BNskTd2B6fkYSU6Eh7MVceNBLXG38JGwSTF6LSjgwYmrkZXjyfrvQ+U3qF?=
 =?us-ascii?Q?qKObG99UwF/PWmlzd0tk0n13dsadf7pqwqc0ArLHaOV2DJ1y73AZmAzsWl/r?=
 =?us-ascii?Q?pzZDxXaTGOga9GxAWDKspykNgN5xWGRZuLLeotznSaEW+hjfuOi/QOzUafJj?=
 =?us-ascii?Q?glAJP4GG/cOimb7GRG84ULTFWrNwZBqy30NfYTXCTntTe8Wi8KRffPzUChov?=
 =?us-ascii?Q?mzS8Uaj7eUi7lKjTLvIIkuvwr+DGvaeG8G9lTTAopMqTwj7sgRXcoRJprQAI?=
 =?us-ascii?Q?8eAfq36S0Ch8j9XUZfCiCCvkQ713OjH2sRWQ+ZfEM+yiJOI13qpwc6Mcw03C?=
 =?us-ascii?Q?mgAHNPPqfu2O6KeUXIH0eU8sp6YVpC8JNYkgBfQZUJULlZsl5zi12M/8bQHX?=
 =?us-ascii?Q?NP5ZPk3sgan6ozfJhpNGgtnXg0Pi8o90SdnnzHj0dxVqkJurS8+pDeEkgX1t?=
 =?us-ascii?Q?rEY8UM/647zgwoPVI2+Qz+sa5ypPui1TubEIe0a/ug6JNd/n1HmjCQ6ox+e9?=
 =?us-ascii?Q?Yt/ko2yDGrvijFd6GnqnwHxm4DkI8YXTsE6HnWAikPr5H3LVdwMOCqA4utNp?=
 =?us-ascii?Q?yigArcH6nGktf/tgyCWaSE8oXmmaXmpDiMIVlcbm9tdUcZIHAffmlG7cfVa3?=
 =?us-ascii?Q?gcpv9IB/cq9C99bI1KLwFad2Imr9MfnRuFHDwQ7eMyQe8O+u12K+PsV2uV8A?=
 =?us-ascii?Q?ctoxlIvWBirSI4yFL6yvcXCZy0PXW+z5txaQXtndrUTEZfXosf6AyzyOD8mh?=
 =?us-ascii?Q?ptEdxT70Pradjn39eZOU0a4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 402ba664-86ec-4e74-220a-08de20b963c6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:34.9192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuJnsBb0cten6Dq2z/7SyJKNQrdlXzQ1pXcw13Fp0eLtSOqQAf6Cpw62kyvLgEn6bT3GTaMgMv0Fy3aSAcMm6HMn3X3FvWEARK+3HM/4+CHPlX+0ARDB1GaID5H+8glV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11220

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
 sound/soc/codecs/wm8978.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 8c45ba6fc4c3a..935761e508650 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -853,6 +853,7 @@ static int wm8978_mute(struct snd_soc_dai *dai, int mute, int direction)
 static int wm8978_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 power1 = snd_soc_component_read(component, WM8978_POWER_MANAGEMENT_1) & ~3;
 
 	switch (level) {
@@ -865,7 +866,7 @@ static int wm8978_set_bias_level(struct snd_soc_component *component,
 		/* bit 3: enable bias, bit 2: enable I/O tie off buffer */
 		power1 |= 0xc;
 
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/* Initial cap charge at VMID 5k */
 			snd_soc_component_write(component, WM8978_POWER_MANAGEMENT_1,
 				      power1 | 0x3);
@@ -924,8 +925,9 @@ static struct snd_soc_dai_driver wm8978_dai = {
 static int wm8978_suspend(struct snd_soc_component *component)
 {
 	struct wm8978_priv *wm8978 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
 	/* Also switch PLL off */
 	snd_soc_component_write(component, WM8978_POWER_MANAGEMENT_1, 0);
 
@@ -937,11 +939,12 @@ static int wm8978_suspend(struct snd_soc_component *component)
 static int wm8978_resume(struct snd_soc_component *component)
 {
 	struct wm8978_priv *wm8978 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	/* Sync reg_cache with the hardware */
 	regcache_sync(wm8978->regmap);
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	if (wm8978->f_pllout)
 		/* Switch PLL on */
-- 
2.43.0

