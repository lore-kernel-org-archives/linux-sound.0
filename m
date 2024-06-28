Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2077.outbound.protection.outlook.com [40.107.114.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3347EF;
	Fri, 28 Jun 2024 00:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719533634; cv=fail; b=M/yXjwE6d/PcGVphD3XrvjOD8wO9Iikpz5tSwqhx0Ya7fCev3o+f4QrFsi+gZjFk49z1fQC3R/C5lMPb8czQGBM36aQ4ehRfBa17XshO+pUWzAsiPH+0kO3WvypLB3BlTPTJ8FhY7ymOuqlCJDXdjOz+/91sZTU3VXeqovxjdWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719533634; c=relaxed/simple;
	bh=tOOdleLJiKBqNSw4MX0TDv8QfM39JG/zbnDmCW0e1uY=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=V+FBHtcW1KKu/ro27OK5+4OTagxCsGp+lUmkRFGHdX9PwEI9A7+bDurqLmG3YBhtZ+IK3km4jIo4BURbARM/PZ1aCJqhWYVTULgaxezq9VKzBLZBCiTg5dexp8JrQH82Era5OeqkzbMWqs3W7bOH3/KT02JBXL77By9WwMRL0ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ajZBbZFU; arc=fail smtp.client-ip=40.107.114.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ajZBbZFU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCi9O5jUp1Tlq9P8xfvkRy8ECYQAfh6q7yLinna3Zz/uLZoWwcAruinG1QlmtXUXHVPSSTMMEVbCLP8PO6Wwmla512k6gvcOqFKd34fEGM4SKXvs/APIfy6mnpVWPzht2eJSig3VGPpM6F78er5puUoi9F4+L4KRDMH/n0VIqvKpwTxZEWNW7eNo49AfWGxFaIFx0lG2wYtztHXAVDXEcrwvYImF4nOZ+AZN27yk2wYPZ5kH5dijVLBFKSabjCyl+Ri/hxzYY+XNp8e0BIbh6EBVPQRVcF2CaCsQ4lT0ntjHhLH0XKyhTgcwaDoauLXzHa9LK2QJpYw2zguXfVtung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAlGD5fvn5/1tjBy3adO8KsZeNB9R2hrYKymKsGW62g=;
 b=O8RNTFDcA6W1BsOq+0aePMl9xl+L8XVh7oC3h6ALuGOnxGdx6TtlBgSLg/ntP95WNo4mkPEmF+1LHVDSIXUQr+ngWrZoGIVlcKti3w5lfHwDuaoO6YxQzPgWDLj89wt9xlmuAT/AOeFYP4wf5ZiCR7Va/HrqjPT5VEab4Dbgomd3ZUOZZVVC8QNVkCPhAKCnbjj9eUjz/BH/r7CBKDnbtmqh3YuHErlpyv3o9EOX3vjXnNAqo7O0dD8pXVA7tKviRFLvMS3undN08s/f5RXp2XIJrXIxIpvtAwaZvqPWpjEI7g2o/Rgv91dxVox/X8s7FGZ6voSx6OZKf7rWJmWhFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAlGD5fvn5/1tjBy3adO8KsZeNB9R2hrYKymKsGW62g=;
 b=ajZBbZFU4cmroe7Wp+UGu7f+X7pHpCJUOQGdeQ67iHQIZrb1SfD1dX9u04U/y5VoC3LX3H1yzXUcA+/0lbrMLANbzTLTAXLgBk4rOPyzAMjmeZ40EZsTHm1ygIFX7FQD8/L2xB2x1lY+8xzKuAsbNo4bj0pN6GVwQ9D+Rt3l4MA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8013.jpnprd01.prod.outlook.com
 (2603:1096:400:186::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 00:13:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 00:13:48 +0000
Message-ID: <87pls1apqb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/2] ASoC: dt-bindings: simple-audio-mux: add mux-names property
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Alexandre Belloni <aleandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87sewxapr5.wl-kuninori.morimoto.gx@renesas.com>
References: <87sewxapr5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Jun 2024 00:13:48 +0000
X-ClientProxiedBy: TYCP286CA0122.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 51bc14ff-0ef2-4c5c-62c0-08dc97072ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gPN1M9X9Ugc0maTyxnG0v883b3HofYjyNMBJU2w/Y0iOqhJn+HzHu3w0nv77?=
 =?us-ascii?Q?nqpqplTm8M62b+YYcb5S4YsipNvLpsHXC5Lovd0YLiLFGxPSrdbbQeb2Tz3Y?=
 =?us-ascii?Q?iBQTrLnmqBRlArm5sq/IsYgDhcgCBt+jf3RRg3vQzRznvoMI/IYoc4978lyv?=
 =?us-ascii?Q?CQC5zUgLPksgkBRrYzDcLxfhSHjx+gySYbF3OIoky+BlEfBUoPuBvhZGc8xK?=
 =?us-ascii?Q?UrtcX/8qYGH/1/vqhCEp43JHmFL70AjF9jAk6dMgRplKbMlXqAppMfC+lCni?=
 =?us-ascii?Q?PI5yeRwN5mfEa9dW3hUszG+8vxAYJyV89gPmb7x4DswdWIHUf4GYKKsa/RBB?=
 =?us-ascii?Q?KxxRomRxCiz/Qugo7jjEKKJ4Y/9xm4QcQusx1kZQOLe6v3aZoOINZEDoxFvj?=
 =?us-ascii?Q?yYZGlgr3ENXIz8CW2bKZY1AcmPP2ihz4FA1o6BqMQY/jKVL+KJq15noc8Hq1?=
 =?us-ascii?Q?ZWL6QFzfL4fnMpmZgtayj0ZcldNRi3NvynIzKIiGYqiDqRovlQGB53wv7PSb?=
 =?us-ascii?Q?Kv6VNVTE3i/jMnc+xyVfmhH+yF0ZNLmoOFYgsJzEmjD/7cOygZ3zvieaSg+i?=
 =?us-ascii?Q?VmtLJWjD2mOxoweP4izxBkyS+SevK3E1iSgrLFXCNa9n+/54/qwkUhHIYYpF?=
 =?us-ascii?Q?/lo7KuKQEqfzF4+c7plt7zYRKvxdCQhboM6hYe2rBuuR2VOFYew8Vq+bwrZD?=
 =?us-ascii?Q?3Op/0o5SB0pChXwINQbiXcwEfWMt3aptPllTOwWoO9lUiasuuSxl9UqRvu9b?=
 =?us-ascii?Q?VmffZ7Cx2h/cZp1DM3AZoi93Roz0yF+wpI3swJIRsxpt+cfdQ7akwOe39PCI?=
 =?us-ascii?Q?IOgv2hrdJJ60nSndiIFKzt7tCksaV52qZ8GzKPi/Jo7Ync2ICZiM7SD3sNtS?=
 =?us-ascii?Q?F90LHKPyQVd5oQWRkKWjPVSS5buBYYISweQY0qwcS0NtUU8q3bXgEezaTfwa?=
 =?us-ascii?Q?qpdiEGMoWBhNrA0kxunOV1LQm1oF9o/ehpM6H03b381JhXEzmi4/tnLZXLy5?=
 =?us-ascii?Q?iDwM+8N4wRPL4oB+Z/QJIliwgaTZKjoBaz9LC9SeJa3HC2GnKNRepGq086Jv?=
 =?us-ascii?Q?C8nhqrO9/THYt7BHyh56jIyuy9asF8Qu32sngWjldaMTA10NbUJew9/xihpp?=
 =?us-ascii?Q?ldx0Jr0OdaxK0QHeICxjwqCzpVBi7eiw4bAtdl4QRfzJqh2zoBiWkS4dDUsV?=
 =?us-ascii?Q?xvsV0ux4sGc36yzqHCqg8kYaPFVELfXJTFJeTisuZTBcGU/1jSxV5D5ivxej?=
 =?us-ascii?Q?CSyWQHZCHE8l2kkqo3mDwl2vqGaAGL2KLksrBOmUgpY/ze/bP7Uk+Hh1uHpp?=
 =?us-ascii?Q?lfzyI1DanNMpAoZTZwk0X/F5si5GEgCoA64juaXMBxaG8zwAKBegtwoOUubE?=
 =?us-ascii?Q?SjaW32mx0MJV3fvkE0EP8hXpakehBFDBTUBIFvguIjSJWCZSpzSI8rOgpDD4?=
 =?us-ascii?Q?Sisy275TYJ8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?74CuyTIrY7Jcn7D01gDkyKqNkd8KKM8JUw8U4IpSx+MYgxN5B1q8mJm6c/iZ?=
 =?us-ascii?Q?osH4jJEcQSxWGKnuzVw8myppwStjqh2anuKBg8whZfs4XNTCQbt4P3xSo2J6?=
 =?us-ascii?Q?+Awe15Ziyjp3QHhS+6xCy1Sa9vVF2XTZbIfsdJmwvnhO8Ez0sHhuJilORLlg?=
 =?us-ascii?Q?8oCubA3a7pqfFGzws6B1Oa1FU8W1fpbM+6xRIQ8+vypR0guNQJ1RfVDDQPQs?=
 =?us-ascii?Q?0vqJ5UT1/ckO7HY0mLwlrhw3+U23hsgvHvNamll5YIeGWD1NyM/rBAswFsRo?=
 =?us-ascii?Q?5GUf/Vt3GWBt008bbbPDhGiVwGLFElU74c9UGWI2b9LNAPmz09p5Dt2qL3LM?=
 =?us-ascii?Q?7aVA2txSvmTSH3apIrZ7jwvRbLhQz7QEgUFm6EcN+Bt9E82QbKShZ1rNVhqY?=
 =?us-ascii?Q?Fy1g5Mb+++2wwtl6Y/c6q7DRK6jA5oHsN3qS0tc8zDq89Pzsx+4RgLyrlF2P?=
 =?us-ascii?Q?oupIQ2YPc5mQv9rMtYk8zzrm4A+hbOAQev7r08ptYzTRvjl063nHGXS4LTck?=
 =?us-ascii?Q?r9I5s+dbK1xa/1PAt6o9vylxpkkCjssQq1nAORM3jjotn3os9QgAsIpIL9AE?=
 =?us-ascii?Q?pAtoPyFb9m5bxGmLe4K0JqN7QWCWmCkTgZOxfhZkvLHZv8Ug3Ch2cOOZJMiZ?=
 =?us-ascii?Q?ET9V50P55fRe9Vvk+aQbVXQkcohZ+knHr1NA3MeIHwtKl2mXHMfk0oeadjEm?=
 =?us-ascii?Q?Z7n0qSyQq+LWeX8Glk8IPmqE1IrvgdpKoVYeCL5Q7AGSEcFE5PyQfo6OO23Z?=
 =?us-ascii?Q?UwdITin5yfxheQkTfJ2IU2eXrd791B3qqo+tDRyud56R3bkauj+sWP7FlLFN?=
 =?us-ascii?Q?vQVCAWv3rDxRqsfGoNCvFYTT0NvqF42Bnc3Uq5ePwEzBCxdMXHZkJd2Rk/g1?=
 =?us-ascii?Q?NyMiupVcqziIoW+0X7pupleYLsLBVtafzTsZuh0tBWUXwrbq3z4C/cl/6RSa?=
 =?us-ascii?Q?/nDt2mMhWRtDxcFS8R66Yl9kO6IsxsTpiXBPbiFYisoH2tyiIIpUmr6m/rmq?=
 =?us-ascii?Q?3HzR2moaLaanG/RHQy0bQ5TDoDrZRQTKrvpLnSTgugJljGi1Z4SphWCgSnvy?=
 =?us-ascii?Q?eaEYdBZQIO+ek+Bfldu9Z38NYy5AnnjHXbXr0qzFswiwX7+9w9hdibLmt+8O?=
 =?us-ascii?Q?mre3s8B/h3wdhl58WeQ4abHZkHJdxynJCVqH0Kf4dVCkXnjBrIJraZb2a9tb?=
 =?us-ascii?Q?Dzscap3kG9+7wepaKI5u2xLL03BTVb98dApx+A8/+Wl1PSQLDIdT8QrmG0wR?=
 =?us-ascii?Q?wKM9I98Gl+zupV4t812jiy+g2iS8lxUVLMgnXIWoZSBJp5q+e6ANmrLxqAm8?=
 =?us-ascii?Q?KTUsp7f0E/+nyMka82Y4WYFAMg7+H7CZNWwbiP3HfBEJJ6Kkr9SuaqBAVBAk?=
 =?us-ascii?Q?Jonkdbg+P2ZTsmne2lkcE3+LJSwMOPMvoMYb6bh72WQWpFleL9PwJ2PaeSDD?=
 =?us-ascii?Q?wC1Vp2LdIjXbTp4pOsqrN9kKOsGsPA340fj3OALa0Uwamf3PM/qCJeCOtFnA?=
 =?us-ascii?Q?jN33LtGMcurzxwQQaK5rFJKryHpffbNKzGeyz3CiVoTkhkEh7nBXYlxnSQ8F?=
 =?us-ascii?Q?Asxlks5HZDAqmhKZuaHrIMlnnbvfywsJ27bo8GAorDLU5bFQCC2c2vB7Fvnr?=
 =?us-ascii?Q?kfD+7W7baWC5Z9W0gbBI+w0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51bc14ff-0ef2-4c5c-62c0-08dc97072ec1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 00:13:48.6217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xzu50/fahf/vbEmiPv9JIrD+9KeBQmCptsOpwFF0vug7UshLB3gbjCDtLOhhc+x79zz59AQdlV1bYZpVv9m/MKjwREFTUpX8GB1qa0+U9z7e4k6lFE835LAyAxDeVwUB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8013

simple-audio-mux is designed to be used generally, thus "Input 1" or
"Input 2" are used to selecting MUX input. This numbered inputs would
work, but might be not user friendly in some case, for example in case
of system hardware design has some clear labels.
Adds new "state-labels" property and enable to select MUX by own state
names.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/simple-audio-mux.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
index 9f319caf3db74..8884f085a5c02 100644
--- a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
@@ -24,6 +24,10 @@ properties:
     description: |
       GPIOs used to select the input line.
 
+  state-labels:
+    description: |
+      State of input line. default is "Input 1", "Input 2"
+
   sound-name-prefix: true
 
 required:
-- 
2.43.0

