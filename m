Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6230B30AD15
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416028; cv=fail; b=ktQHhTU1t9tNezmI43+FQNvRknX8yfB2auHaUr4Q/Gm9T29Ke/nYY8CJP62kRbpe5ncuFYMFbwR4H3L+lZYQY06ATi80q01Qp7b0eWqFsjxG/8qQBbklenYAGIvkvu/zDwC2Wk7G0sBYbn4UquG+YzpUpWpCJ2bA+LkJXAeJrwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416028; c=relaxed/simple;
	bh=RXrUicxXA7bC/9fzClQlH3ouZcsCsbrjArelwYJFIDY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=u4K+IvYyulVRLC8Ugd8ISVBF6Pslw1e0NR8Va5ppxQnFDkuZ90tGJh7ZbEFeXPfomUoWQE1mtajjfNfAAdWxUo6YGBBzAqhaoPakZHRam6v3yNvWY53070vCsCCiqNXdWWKl32BW89dhNswMKcwJ5z7i9d7CZ0A41VoIpBBZV9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZeieeJR+; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZeieeJR+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpNUnjkCxaGm5KdL7WET7hbMxMC6lCW+6swixcz5F73AeOO1SwmDfIrfEVDtCnWxB/4z/IS2Hg0CY7XZOgS0jBAuI/+s8IAKAh7tBAgcOp7qeIxknk7/Ieu9rII+udOjK1aEVGEl+4xH+63qxilXW+ev9KmHk4KdQLza8A4tgONBK7bpkm6Zawa9fUw2IxtuYJNdR4YAcsvSN4gzoXZr2gzzz2w7t7Q28HApkHZS+avKhQX/UYulXchgCoS38KM+hk3kt9B2hs5eYa4rwK9ZrvYRgFfxOmvtBWKyTCnjVHojn+4TGO1L7iZXt+T/DzuCaEPCnMNB26chBD9umYtvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHLBjBqbOhOHQjS6ec8vb/6CZ1wisDEQ/DcHK6LKV8c=;
 b=GJ1e4DDnlV+FAT91q9VDyF5rbijAQs5NpwFSmUheAb8x5Yifx1zTXtxvs3JVnwITBxI4IPX1TsGjKq4vVmYyw0dqAw1+j6heb0M4MKvqNVHyvH6D3NKcgmZBJtaJaYeLuJ9wE+eUkoKTdfdIdqREfyTv5frWwEl3foyH0LwIU5GuH+PQypTnHGxIYI6h6pmmdxt7Bi/Q9ZRuRXyostE8fSXQ+1NrGpZuJp9hkEhuavrrta4gW0VXglcmw876WRQYPP/eHRI8uB1asBOMfqnBXRQoN3BPp1eexAymqZujkNdg+00M4K7f+sllm9Lssj27XjjgSzPIubfJZRuJJuEy1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHLBjBqbOhOHQjS6ec8vb/6CZ1wisDEQ/DcHK6LKV8c=;
 b=ZeieeJR+dcVwoF4qu+3rSeedfQReVlpsDFPs/qkGKYKdEVGbAWwCCpMJRNGlQk5WiFZ/+UOMWpgVisivbcDQirLgbswzJw9vRUKLqfhdaDvwAadh+DDv03/fzbVf+koE9c7WoarmrEgvlrBV40xKk6B+6LknDSvthBwuSaL4Dc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:02 +0000
Message-ID: <87zf9um7l6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 122/139] ASoC: codecs: wm_hubs: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:02 +0000
X-ClientProxiedBy: TYCPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:405:1::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a27da96-629e-4c53-b92f-08de0ad9ec5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uWVbwqvQ8UqiPLfNUskCsvz3UNqFsMOCf6X+EaiMIxvO+HVXQLt0WwNmpBYF?=
 =?us-ascii?Q?6QgjiXovh3nYhwEIGNEbpl5ec6KmLKh6x89woh9JdeBYEcFMhry67+VLspo3?=
 =?us-ascii?Q?5R2JstqsbLmMdrf7mf7904Kx6iwQ+o/miXD4/89xjLXKMOsm5LxmyfQa7Ydx?=
 =?us-ascii?Q?dkkAl/2w8DGSVwIe+hViEDLcqa4K7LpHxjMUUUfjqsZbn/GoP04mrn++UHTo?=
 =?us-ascii?Q?v+WJvEqxVw4/sHjcDw0hrG+9l93HiqLiRGCjcW5uVBfe4mWRwGn4ghUwTYW0?=
 =?us-ascii?Q?d7c9AS9h0+4LxCDn7fCFlOUOA8aZyXHRfXlsmUnZHD8BUUemzUNdJOOuZWpP?=
 =?us-ascii?Q?VXNrVL2/C7tiA2fqwQc0BQBOqkBFcWc7VHLDpiKgHXIzhNaOGh9VoY9ARdWm?=
 =?us-ascii?Q?QhQLGDnmxhVsrYPTDI0uWgYzhzHjRVOQh1GbdNUHx7E5ME20xspeG8bwApnp?=
 =?us-ascii?Q?2FlAzpCAFSjIZbkA5ykJGyH7q1mbpAtIWLHUdGCuldlUIpiIwt6MiT0ObtC8?=
 =?us-ascii?Q?ce8XaFWXAAKWjWBbY7CzH3K02VVPjJSi+k5M9unRwE28a6S/VM1JJA/pCcO2?=
 =?us-ascii?Q?5pfFucDZJ5uo787gUwYjeoqMLW8mHGh7UuBs+eXAXF05RbHxaY06NaeYlHBR?=
 =?us-ascii?Q?8J9x8yh/02Ec1+3M22ROLGD9QkN+ebFn+I3RR5rSwwl5wAkI9xrLx23gzBnS?=
 =?us-ascii?Q?4PSHNxtV+g4J8+xCPxoXsSc5C6G+AZ/T9BwgmkBDcmey9HezUmLjAkw+yOwC?=
 =?us-ascii?Q?VMvi1iJejw8Qqdh6y5VOORkuu47zyvoqc/szhQaPh5KV+IoDfKM7/zX4wwYZ?=
 =?us-ascii?Q?/CxMa6pxZRxT2s8i1BOhbpWUijwmNK+4UzasuicFh/yEqh5BShrNkIFvz9aS?=
 =?us-ascii?Q?DDXmYhB4E8VpQ/G7AJXGTs3AYrVeDJOxnCAL+2/Mj4E/yrBNNK7QsNnlKTLy?=
 =?us-ascii?Q?1Z0V94gVf/TBBZPYnNz/sbfxN85vEJn6BelTd9rzwL76BCnEvW4FOncEWu0U?=
 =?us-ascii?Q?2VDAc54N5GC1GUN504/SxbDlZ4SngoWhyPOIhzZg6gWjDyu7bXZhVUpBarb7?=
 =?us-ascii?Q?qAQ7PqYfcS6dcMJmzGDISKmCMXWMOZVxESvRv8i7A4VNzh3ld3YN/ib7SAYZ?=
 =?us-ascii?Q?mR0yNea993uOv2o+23838wBaAT7O9K7W/7wml1ymEjdyvbxFoUl/SJ6VwB4S?=
 =?us-ascii?Q?a8Fvxfijdj1TQnHRhtXqdG3bCJJadJVwKHdyj+xG90KXTNRPb3ABl3h5QXvi?=
 =?us-ascii?Q?EHPAjYPBeJ69R5vh6Hu8LuIvclMe/wkRDYqh2RWYOn+gnyYEFu2AeKA4fKzL?=
 =?us-ascii?Q?uff50GQAIJtO2VjnYYu2DwMIsZJohbOGExy8txORYNUt5b0fCDpNUW1O1FW+?=
 =?us-ascii?Q?gqRLCmFvkhK74NNYgzyAPQDMYJW960gcZxE9Qq4d5IfTBoCe3GbwGIuQ0Sfs?=
 =?us-ascii?Q?ZVAp2QZr3FDsBGtiwSTh0thr8ViCQz9KUL9R1nCrY7s0lH4IPIUporb9UeaO?=
 =?us-ascii?Q?pm0NPqPCzgoNbfEoU54fRgm50LCsJLd7HYZL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ntP7kScfKtuDDeJCRWW8RhGUZUmQCvLI9CQj8zsHttwDrnqihRRCuD6nxWX8?=
 =?us-ascii?Q?lwa/zFEZvneRW/hAyTUPuxfl4exfXhl/DUGIao/MCDzZOq279oV0kiN4JwyX?=
 =?us-ascii?Q?wmNXByezqwpesvS3Byu6JF6UXApDY0wGIgv6BXBf/A/elej1H81B/3jloNr+?=
 =?us-ascii?Q?WwyJjT/uhf8Uqesg29yeKyovT5/tY+DL0jxpSku+GeaOx4IpV5V5z/tn20KA?=
 =?us-ascii?Q?EUnqXcj1YGhzhEwebTBADjtnpVkX3or1JObH9zHJT8jczYpka/P2u3btPozP?=
 =?us-ascii?Q?iazmrVbHbPW45tqsqBNOpExF4fq9wAB3WDzt5Xz6nTjLHnvr7MguceH36N8I?=
 =?us-ascii?Q?itXZMnioq7ziKvqcJC8H+MeNVupJsk7i/KyxKSov1LOzLLpDY/Q1W/YJKlud?=
 =?us-ascii?Q?wyeGriA4t0uskWWyeig5QMV1o+fwinrN7TVNeXNBXL9YZm0og8LHWO0RyDZe?=
 =?us-ascii?Q?KosVXpYaOx8QRtgrGohA3lQWL1IhhQ6d94KV2KgJsHN658uYQRqko4gVQTst?=
 =?us-ascii?Q?CscG3i0VnCNsVTe+QB4IJ6m8verqxgm3M9HVh8a0TAMP/D/McvNXjoq8rb2F?=
 =?us-ascii?Q?nyb+WgT+MuDoXbfJm3KhphYUKU9ohS/l7a5r7Z2HgsIZ7CUfVSzOPuOQVNE7?=
 =?us-ascii?Q?hJoFEkvPKrdxfCyJqsc5R0l77T0JOQx1LbouwuqG05LwJnq+9rSfWcVCvRGG?=
 =?us-ascii?Q?7qdVpvlrAojtt0oYZh9mYpfR05nZXg4ozy9IJAzq8gd1VmXu8ViYvvQLTWFn?=
 =?us-ascii?Q?SQcOUj4wq9F6j2+gBJQvvl0/ZJyzZqH6sPp1haCzN0GkQG+XEILenFqEwlk6?=
 =?us-ascii?Q?kObYwDY+i37CIdkZ09EaMjfvVz99nLe1yPVFKhopeUKzVOZLW9zrJhQBNX3u?=
 =?us-ascii?Q?8cPy5iFs5IZy7OZCKb+Z/g/56L1MlXe6uwP1WLlVgnfZQsvEqKr+Ik4q5yKi?=
 =?us-ascii?Q?apxVdIQ9hRkkiYrz+4qdM8kEG4haKJIH5sP2Z57usFmc0vOMbrVUzm39whyg?=
 =?us-ascii?Q?wUh5DMnE7MZnQoGuy7E9nuWUSOobY5hOq8wZIdlJzryvtzwJff1UlpJKyOBH?=
 =?us-ascii?Q?hXsQ1xBDqRo7plkakNromN9pnINMeK0InHkruCqpqksOFijFoFuha6fEcOBW?=
 =?us-ascii?Q?PU9yD606mPZ9jHd829gjExJWThwZ9BcPjOiKnh8NGhPJkSUPVO4LuS5GTDVq?=
 =?us-ascii?Q?q1SACqT0sMXmHvnDSh/1/DEcLlwJoJwMlBQUVPkP5rOGYf7+XEqxmcsSeuHF?=
 =?us-ascii?Q?5ETgtFei8n86QmhDszEkA3WH3BRdR/bK+iUgXUnax2jjDDojmoZ8yTAnGTrp?=
 =?us-ascii?Q?Gft23Jy203V9q8iG5FuYNIY2pi5vhOKxiPkHqsffXalMU1QCaPH0f2jvhqhI?=
 =?us-ascii?Q?oapsNebzSwfgd/zqR4iGDDUSnFnOE6Li189Z5qU0mqzqh1oWIkv2nY/xc4fK?=
 =?us-ascii?Q?MVM1+tjDG+Jb9fICJ8Q/yvQKMDTzbUeej8Gp9Me16q/feKycImXpZvNt6vaj?=
 =?us-ascii?Q?Jlms2lq6NTjTQ/jlGMcbAYvGENoydd9VaFvuFSBGBbBHdgh9o4iJkLpJHxy/?=
 =?us-ascii?Q?Z6DkaykriaSYgYIZVf9Tk1bu76tj48s7AVJ1NcgWv6gqRznXzvyzSnUIRJa1?=
 =?us-ascii?Q?Gigl5QNXPpBBJ5bKstMicRM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a27da96-629e-4c53-b92f-08de0ad9ec5e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:02.4022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpNEKw+BKlqx+30DRdKvQikT+AxGzcuD75XmQpMEVdHZmJ/F4rIPRY+Twgs+QDLjnabatMrTDSljGpzSK2N+Ry8le6vRnWo5onvYfOHmTbbTPJR5MhD6+yq21V5uhcRC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10584

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
 sound/soc/codecs/wm_hubs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_hubs.c b/sound/soc/codecs/wm_hubs.c
index 196ddb224e6dc..ecc4835a7ecd5 100644
--- a/sound/soc/codecs/wm_hubs.c
+++ b/sound/soc/codecs/wm_hubs.c
@@ -331,7 +331,7 @@ static void enable_dc_servo(struct snd_soc_component *component)
 static int wm8993_put_dc_servo(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm_hubs_data *hubs = snd_soc_component_get_drvdata(component);
 	int ret;
 
-- 
2.43.0

