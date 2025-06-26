Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2045.outbound.protection.outlook.com [40.107.101.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634A81DE4F3
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 21:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750972600; cv=fail; b=k9AaKIyYw30Cqo3OxU6kG2L0cM642h2RrbAAiPjfr2ED2sYGAYxf5nZixuEpD1n0C5FnPORJcHmgjKSO1GbYoP+N27mHulI4k30xYgUAjbA5U1GKt/nBmwhmfPHUT4C+MhSNK9xjeRXjDXXbtCEPcwbFEYRw4ccKe0KXd4DkhVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750972600; c=relaxed/simple;
	bh=lMzJENaBsrSlHk0hQPHm8Y+OMLRuDc5lWRCJ/zZLnRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=TM6S9MY/UkKme9vTC5RVVIOh1cu7NzvIuAXSzl9mRKXn9/xSgWfeKswNU5l7BidCtwAwhIws1VlnerMrkltxvLNfNnXF+oqpgCKh6/sMVwgeWILb5nRyMFvEg2TToeZ+aZJ2S7g9Cy2lBPIJTYCFDOCSPTBq/TxnqnkbDQKtbL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=anAh/brZ; arc=fail smtp.client-ip=40.107.101.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="anAh/brZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXblXZIbmUxnbl3+6zwH7X2tuEz+UHdBOqoSeVknfprjSsEquIjw6p+io439z1DIkD/xZeDJfRLTq4XceJLJoxpJSTIlR49CXzwSbW4rEYW6k4qi/w2fG6l0Ml3j13CWwLTlY6u1m3nd+IwB/kVSY/dJlXn+JfiqKOvrK1D3zwcs3+Kw6cX2MnjVZ13NR3+3LNNdVXCZhdiJ2UsMRffFIoFsRL6gir9XSnUDm+PR2LCAQTGUkcSZdyQg2+2qdqivuyCb4h83aJMZzW6Q8zXkhE0saYpKAs7biyWXOCy8sXFRau0CxSlJumqp/fLeuFokdEW1RllSsCFzkkO2Ug9n2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RE2A1zdtwxuyUepB2L9ptPflORPbXPi3QuyJnvT+Js=;
 b=qUEvT2F0L27nudM4hJhWU/Qfqc+wvjYygm2wXs1FQJHfwY5pwYNhuN/UG9PliOSKFpxSWW2DoFJRr0+/SROWAr6e0DhPiCjJLQJT7BQnfBdWcWrb5OkSjJ+8RqTcNMb7f01UxbPAXX2GcWo6oo0mydqkJ5Fm4F8LnX+C+wVXhi+NrMSwTYLwvfQ8U/oaPoi6te98X56T2jIA3EYB6PRPVHtkwt782+Cq9hUycSXIY5Daq7ycPAR2pTA4JWk0t+JMxcxVErjcajDIOUiReMWatW9FWp8Z4ymFhh++OXA692+BIL3x/7sILEyOADN4xNsscuQQJaEjjhT6KBDG8xOYKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RE2A1zdtwxuyUepB2L9ptPflORPbXPi3QuyJnvT+Js=;
 b=anAh/brZSUsjT2o3g7x6NLy3fxnhIljlHZaL+NlmyDHD2V2xGAFK/xhyTMzkH88BaFLAiSdV1s2J0+QtwPKRqgIoMXZoMHpv5KnbeaNybU6zwjwmNNxpoTkgSbFHWzOg2gOAnJRGAdR7IpRrpaDU+UQ7Z2fAt83m4rVj9wv2tuPY6fXMMwVLynUQGeOYyq5JcEMjJmr1PImhCS8OpiwASVriwRNGN5M9NaxtxSqZGmzO1SQvFy+tIp/yaPrWD3AojrJ5qqA2raaKdIOvbmlMvT6t16rYA89Zt7uyesVxxEo9DnYs65JZLqhsDKHSve9ahFUg1uydWfilQta2Y0qTZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 26 Jun
 2025 21:16:34 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%6]) with mapi id 15.20.8835.027; Thu, 26 Jun 2025
 21:16:33 +0000
Date: Thu, 26 Jun 2025 16:16:30 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de
Subject: [PATCH] ALSA: hda: Add missing NVIDIA HDA codec IDs
Message-ID: <aF24rqwMKFWoHu12@ddadap-lakeline.nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::18) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|CH2PR12MB4262:EE_
X-MS-Office365-Filtering-Correlation-Id: e6675c4a-901f-406d-9ab1-08ddb4f6ba34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jD1+UH4MFPqIVQr4SSM9jsGIj5EsSAbqJwnmyNUCb4W0ImeOmXTCS0521pT3?=
 =?us-ascii?Q?2EyYTJ/+8dr8pR8bcqeDx2+nqwJy2YFOjJ4sdYzzc/JhjvYmuIG/SYWDiN7O?=
 =?us-ascii?Q?T5WxVkB2Avv1lkwU0AKgpKV8jENL7+MWlz39WC99yB8/+D5+GUHsFojdZCJ5?=
 =?us-ascii?Q?FjXRqdvZlY+3BxLSq97uKLnT+Qf6alLc6TMTi9N/tPjnjU98n8FAv8eJeRz5?=
 =?us-ascii?Q?L7UZCiN8K+F0MjxXj9+s08gYVOQmMMKsWgDq6RElikHkuoyZNBf91I7iCpiC?=
 =?us-ascii?Q?TufO/ZZf64e+JxnmR9ESTIR+xED62x9pL1JbTPDYL9XfONOyswci2v2ufaua?=
 =?us-ascii?Q?v9JzsaIjK3oot7nyEqlElxo9dQk6P/aifiPjPg4fBEQ5xY4pElvYMUZuRUnb?=
 =?us-ascii?Q?+CtHI4HO0jR2Atwgm2W1MYKzMZov0lXbAGkqdhLvs/B4+MYW237FSAIQLKyy?=
 =?us-ascii?Q?fZgbuO3rM7eD8PbEkDxoIEk5hRkmodFZAJlYuOxEOsHv/2w+2VN77KAlWdvF?=
 =?us-ascii?Q?TuM5FjdzrlNrX3zCe/pSN0Jsh5AQ4h30XsWbXbMFHncbVR5cGLtn7hqiRHrA?=
 =?us-ascii?Q?Lo8w7iLlgo/3EUQBQ08tTV4QJ2/DXITJiWY3rw7wMvX1/VhFuzoD08MTOd2r?=
 =?us-ascii?Q?FzWLzDIPyRf4YdpVDswxKAXO7O79gjlW+u5MMBdR7uOO/bWkzSDnjEJ0MfnL?=
 =?us-ascii?Q?VskQQxZ9iNYpZTxiRpzP5UQC8L9X6SP5ztzAQvDcOuZ78FBPWpG5MZqcgYs7?=
 =?us-ascii?Q?BxzpYTi5Qf12+TMIwNG6qKSvQjkROZ/Zank4QO/7NFIGlvEkJu2NdepAxteq?=
 =?us-ascii?Q?5ImiMahFaRl6H9yYK+aqyptDL9OJD9TjzCvAYLgpWJHJz0/ySEdyephC115r?=
 =?us-ascii?Q?SAOrvInhIZNp17TZ4FwFSP1CE4eGZguceaJfzLOdjg5sdfAx35uWb28bwzaa?=
 =?us-ascii?Q?xW/TAqtLlwWqk8I/L2pQOBp3FbIt/9fg8Hl7Dcxr7jJVbySt778GzWEAgITg?=
 =?us-ascii?Q?7VHw0BOvTifDzsoo8PfvGOKgqPL5hTTk6hrXBC0Mr8iY+CMQzpUojp/O04Id?=
 =?us-ascii?Q?5zqeRf9ceMP7fp3WDW6Ta3lf+DD98qKWUUVtN0wvIxhACIT8Cj+ynuajQj8l?=
 =?us-ascii?Q?bKLhCAr5CnUZ+GryuLLM5/z+CEHiqWXTx5aXPg3HB6nLuFAXP3meN5d9Qr4/?=
 =?us-ascii?Q?JE98GSq9notetv4DcqFu5hBEueNAUNk8To6R4C26M+hFrqEIF06QtEkj/SlR?=
 =?us-ascii?Q?J76Ixdk2ykkCnxuJ/aMZRo1sedxwYoocdjMW4UjxYARVPYoLCaJBNio3RRM+?=
 =?us-ascii?Q?nuS/gO9kntMGd68dBSKRKs2AqYziNVX91EUtxJk78/MnCfdkp4Os3jaTauHf?=
 =?us-ascii?Q?PQNoz+u6Stt6D/Esc5rJL6zWDk3dvWopZPtO4eICSKLLtqDVy0Advfg1bLQQ?=
 =?us-ascii?Q?6GJcI+C+H90=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SL7oL85crNQ2HY+KdXuCul2DoKNydXaFsx2SNRMcdGT8chjz23RQmHn/g5E1?=
 =?us-ascii?Q?6JlIu6ZoyC8BgHoGh1cBdCsA3G7WEGu04R5ECu/LMeRczDKTh83+eivWT6Iw?=
 =?us-ascii?Q?QAcVoRdJS2jcQxUaSFQOgpK+tQUwl3w+W8p9OWqCQqXaUvjat5/s6b8vtmzP?=
 =?us-ascii?Q?yFZZtBe/vL1rHP2jtiXT5MOfva9cYokTnBLUiGHR+MNh0zWts2ZzHPdYY9VL?=
 =?us-ascii?Q?32eVTMy6CKZAH9JkigoL+iOrNBbyle5QBTnoZe/l8KGIZmgyG2g49ny0f3gN?=
 =?us-ascii?Q?tLQFyWhUcY4wXxOt12V9LVO5O55lEq9jdIzmurbjoKoa2yTk8QR+zJDjH6+R?=
 =?us-ascii?Q?Sw+6r8IwOkpGY/Ds/zzGmg99r+CCAfl69jNhlaiV/OIKKw14KuebgJn3RchO?=
 =?us-ascii?Q?7EFHrLcD9NqOc9dli2KgRMjIP0ueUH0FnIFh8lvexxteMJF+WAkv+4gcvCRl?=
 =?us-ascii?Q?nuvbPTBrmoGhqw392ySOhf0Q9m5hdEREKUV6Gb6maIiEvieJq2xfFANDt/vp?=
 =?us-ascii?Q?Mpr6nfBCXuhyHWUJRyKequD8SBANChlnEM9pxp27n59Ov3qqZ6hglUqpuQGE?=
 =?us-ascii?Q?B3lKy0NMKmQJ12YTdPucbZGAxNq69SAn9aKInKt7mUpIdbo8IftcrYCldi37?=
 =?us-ascii?Q?jR4nUXd12vLX8VsX/E9+botoOmenMqOj35NAFvYI8CKWvvuEm7qa+lvcZplx?=
 =?us-ascii?Q?mDWu4rPGRzwu7OF6lzT4znGQXuX7Z4ausNqPJ0ivTHRbohmjLZjSwwY1UfOI?=
 =?us-ascii?Q?VvEU1TrF9pfuDqem5iPkxB7+M7U0hHsd2BcLUQ7EBLfZRhfxY2Fk8AzkDHF6?=
 =?us-ascii?Q?93hX3EQxy6Hi4UYWo78A8gEZXKJYXTZxEFBWPSjM2zT5+ofiQTaUgY1BT1AV?=
 =?us-ascii?Q?u6fBOIBGMbpMma9uwIyz43nuF31syv0lWDjBng5Qxoa969mvYevvS0mDE1Id?=
 =?us-ascii?Q?OXINUHdiY2Rs/5cylRDzAbc1xW0v/Okv+7mf3aMnFukGyIq8txuCnKVylUMO?=
 =?us-ascii?Q?tTAYutg4spRh4AkQQ2NLA6AlZX1HLUqIamza9REGUVfrnOK0xvruRev3elbZ?=
 =?us-ascii?Q?Oc0AyBQfb1P1zIrueOGVoQDVY0Eqmd/O6pdSoL6WTXAYwMulWcYtqh+1V+PM?=
 =?us-ascii?Q?g2V2RG9byVgUQ0pKwoLQVJILUZNLZyN94QJ2RqMPl40Perz1Rtxs/FPPTzN8?=
 =?us-ascii?Q?bn0tA3WgbEkaXH4cGO8dU3qLsSf6Kfk9s4I1RG3B9809Oe3w78N+1fjuPQiL?=
 =?us-ascii?Q?5ZzMEbNiZrY4bBL5dwp9s2/UYfHbOwYKvgKqhWMsIYj8aT4ju4TqtXjE2LqQ?=
 =?us-ascii?Q?icCeXjutDChJUtEC4Fr+zdiVN58ZZvuf30RdbE8EeRUw1MhIdQLUcMR6AhzH?=
 =?us-ascii?Q?USfjHYQACUK3Yx+LF4tpTeMrfE2VJqoKm/fu8YpOiexy0f0euOs9NcRYNtvR?=
 =?us-ascii?Q?g9MgMLHrmIaXLQ222ehYQ9xksp9hWqRy8dBHA8uo4knr/Kui5QhFdNQY8uVe?=
 =?us-ascii?Q?vuac1ot1OxCqNYqjr8NLNRVkcoZgYmV+gnT9TjHD6th2a/VDhIjqiSc4O5lK?=
 =?us-ascii?Q?kFfKZyfY/y5bMwvDQa+bFaaiZk74Ctj7oTujDF97?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6675c4a-901f-406d-9ab1-08ddb4f6ba34
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 21:16:33.8726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMkRXOa+P3fT29VCWmaZZOJ+tZvkTPiM0oqsn7Rnb50VONABwdiEHZJ8zWSFHgrQE+BHfL7Bs9f1UwdHTFsnTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4262

Add codec IDs for several NVIDIA products with HDA controllers to the
snd_hda_id_hdmi[] patch table.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 sound/pci/hda/patch_hdmi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 08308231b4ed..9a7793eb16e9 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4551,7 +4551,9 @@ HDA_CODEC_ENTRY(0x10de002e, "Tegra186 HDMI/DP1", patch_tegra_hdmi),
 HDA_CODEC_ENTRY(0x10de002f, "Tegra194 HDMI/DP2", patch_tegra_hdmi),
 HDA_CODEC_ENTRY(0x10de0030, "Tegra194 HDMI/DP3", patch_tegra_hdmi),
 HDA_CODEC_ENTRY(0x10de0031, "Tegra234 HDMI/DP", patch_tegra234_hdmi),
+HDA_CODEC_ENTRY(0x10de0033, "SoC 33 HDMI/DP",	patch_tegra234_hdmi),
 HDA_CODEC_ENTRY(0x10de0034, "Tegra264 HDMI/DP",	patch_tegra234_hdmi),
+HDA_CODEC_ENTRY(0x10de0035, "SoC 35 HDMI/DP",	patch_tegra234_hdmi),
 HDA_CODEC_ENTRY(0x10de0040, "GPU 40 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de0041, "GPU 41 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de0042, "GPU 42 HDMI/DP",	patch_nvhdmi),
@@ -4590,15 +4592,32 @@ HDA_CODEC_ENTRY(0x10de0097, "GPU 97 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de0098, "GPU 98 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de0099, "GPU 99 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de009a, "GPU 9a HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de009b, "GPU 9b HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de009c, "GPU 9c HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de009d, "GPU 9d HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de009e, "GPU 9e HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de009f, "GPU 9f HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de00a0, "GPU a0 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00a1, "GPU a1 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de00a3, "GPU a3 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de00a4, "GPU a4 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de00a5, "GPU a5 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de00a6, "GPU a6 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de00a7, "GPU a7 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00a8, "GPU a8 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00a9, "GPU a9 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00aa, "GPU aa HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00ab, "GPU ab HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00ad, "GPU ad HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00ae, "GPU ae HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00af, "GPU af HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00b0, "GPU b0 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00b1, "GPU b1 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00c0, "GPU c0 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00c1, "GPU c1 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00c3, "GPU c3 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00c4, "GPU c4 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00c5, "GPU c5 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de8001, "MCP73 HDMI",	patch_nvhdmi_2ch),
 HDA_CODEC_ENTRY(0x10de8067, "MCP67/68 HDMI",	patch_nvhdmi_2ch),
 HDA_CODEC_ENTRY(0x67663d82, "Arise 82 HDMI/DP",	patch_gf_hdmi),
-- 
2.39.5

