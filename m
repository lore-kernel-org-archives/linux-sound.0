Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66BB307AC6
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 01:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785722133; cv=fail; b=CpqReJBotQusyAh0/aOwROIuSH6hBbWmam6Vh7mxT5d0P0TmGvjKGj08ohhvXC80KN96sEFhzsRwkXnGA5FNTKud392eCAGNQWyWJufL7YQnUoHE9Twa+Y+7v0x5yDW2J37LmzDeiYDtgePDcdKcPfxqTrHbxhzJP8I16F2YhrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785722133; c=relaxed/simple;
	bh=PfsNGbDfh1+kAw7Sg6wtwDt4iM8gu7cLQxDCm7M8MvM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EItPl9/o4YQ25TSUFsMYHs3wTLIlKtchh4a2Wwr80Pw3i2+CkiCmHzMldRPXHutRigQ5vLMNT6ds5HL+HuVpmcRXyFGAYMC4gNS6QoQQGnVHWoBcwSBZjdD4L8qXaXe3cyL5bwOuYs3VUGUrOoCgbJgPwLaw8eLpRb07xNiVbAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QW94bpuP; arc=fail smtp.client-ip=40.107.74.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QW94bpuP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPT+NFieyfF0yFAZ242iRF8M4CguUNa2e54HMvU1ppAHbxByhx63KfafggkGo0LLaXYkhOmE9U0YxAng8domBiXFLDJgyqOZofTOEOBeBlViT3IjmJxCZ0RtyagTNxRQ8LXi8BjpZevX0s1OmSH7OAxFByFUnCneqpTFtBPHFIM2OHcfJ+L9Zyr/ehjU1QCyuRqWWFW9d1B7KkdhkAQ2eCt2qtuiHI/GX4GzkZT7N2FLAGfDLEP2qxO10pKn5o+66bhN/JQIpWIfnbGE99rjfy7k9MsuCT6CGxkbXLIcMQ08KVjAsHUbyV+mltwL9lyQzZxl4zvBEP7gf8H28levvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+iqAXLGMPqRHH4ePEAV8nUwuf3dJDi9n6vP+5qbH9Q=;
 b=XQCr/ztooYftTxlTvsv8I7L2lWQLU+HeeXf26WzyTmQEha6QHNcioQzFKdCAKe0kh0Ma8QR9o4g720eD/hcDrIsJgAvOOe4PvsUYzKUo2kkEc02UMzsndu6Bzr2TYXKKtviQQipQ/UbOofWlJYaFNQZ4vLv1ADJJqJxrx+crf5JkhP5x21vr+mkEPjk7t1tloRTLEGrnnxr/eDTdv6izDzO29fB6ypk2JDY/cMP4h/SWkcL2WK6y+iIDfzqR7XnNkMwfrIKXTZCMNeWbQFNo0ayS0WWhn1VRGOLkbdX3QwlqMd+Kw5LCUwtHml/Ve/rWmlVGfVPiWvQ5r/dE1GvwCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+iqAXLGMPqRHH4ePEAV8nUwuf3dJDi9n6vP+5qbH9Q=;
 b=QW94bpuPjeQet5oJ7KKPAAKkfluSRRtYnRfKWzh595OVmsQCUiEIaNLPrkYcErcKvu22XQDr36KFU1LaKeU1yb4RKyj6MtWTrRcq0df263V7YUOq9xt6sB4Cv+fPoeF83rfBBFsfxD09HEIRWycMRImFu2r/qCiL/ekXH67DJac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB15074.jpnprd01.prod.outlook.com (2603:1096:405:281::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 01:55:29 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 01:55:29 +0000
Message-ID: <87wlu8rmr3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/4] ASoC: renesas: enable COMPILE_TEST for PCM SH7760
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com>
References: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Aug 2026 01:55:29 +0000
X-ClientProxiedBy: TY4P301CA0046.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB15074:EE_
X-MS-Office365-Filtering-Correlation-Id: 37263f40-a602-433a-7d00-08def1024b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	GBQOkUdML0tiWnlaRPr4/bFsXQOo/zdExs0I9lMOT0sJu6WgIhS+pUHT+prbQ7dBWdVh3/nVK2Skz1LnKq5YcQRHvuiHex2V6mODgY+DIpmKNgIbsVWzJGdUWGIzlxY3Xs7q5iQr72UXFxIvK4lZZtCzb0QehZORzCjgB5LCto4Af7nhzqDyOw+zz0kRoI8Ng+TFk+K7GXoT3D9rCeJ0ZIuQV7lICl6fTdPsf+n81FbCBAPa8eTQyoPvCRFfASn3xdrd2ig78AXNKxpcojIfJTfpFhRoaMuXhlnvQih7+1kVVnrd9M1b2yGmHbaD898s91NwSfrOd6DX1rJd4zXTDXqUik7UcyFbs/oPSsbVzerd9nl/IjBZemHsS38JmmVuyuRukGp/lkZeo94JmwRA2yaCfZjzrp90mISGFDpNP6Mq88SMT8LwRLld8cMDhLCGWSuRtQdYqU0ATA+1TXc314f3unQ7qWTKG0VpeX7cLidVZL7BELhHsH3WUcPgFDGOqWom1F6Vv7XYNs88GP1+2aaashrzN5gicSOkJEB97SsqZRMUg+9nPF8IgdpFGc7RHHsD12Daf5QuNdC/BOkXIHjz5dOiTuAvcaRTAOHeAiwL6u/FcV6eVqUbiqZ2ddbNVrmVt1WLuM5Hl5KW5f59YCXyZVF/XKfi0EjqairE6RUQaTmiIVgumhddBegrxu2OIwleECwP2YdPOwzPMH7PAWumeWmPmC5CHxILwn+9poU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VYlEASDpCHTEC7f0v0xfJhSLsKAZNO2iBDvK6+7JCnLdNZRpUAZYuqK8/qyY?=
 =?us-ascii?Q?o887+SnJqfe0uJi2xD+Gg7mhOHflBvwNj1h2kyguTHJOKyWKVP9WAEJnmUI8?=
 =?us-ascii?Q?T5hEzd1OcdyCKEtVyfeYGveBOcny3AhFEI1wKRH61+aEYCFm9npEzBNLLn/9?=
 =?us-ascii?Q?11yC++djEEnMUADtsI7IUEWJr3jmTT50HwQODgKFKvApo2wYRP35VBpJqQmq?=
 =?us-ascii?Q?YQ+bLBF0NJJqghudAv9d+uZs50SgbuSKmkjpPqsXQYMe+n17t5lLtVkO1mzT?=
 =?us-ascii?Q?YdLDPBfSCSgdV3BcaSiUib+n7OBGQqGEa2CB7Y1ApDxNJOcA+S7z9qj8N1Gt?=
 =?us-ascii?Q?tm+soRoUUmCbKdBEj4WvX5weB/KYMT0ZmePBsc6yw9IUGBHmYWIcY65NwxTa?=
 =?us-ascii?Q?OEfoEATdLKxRPACsvAWnG3gMEPqpsx+b3k/3ONMB+F8i1MDbhQMg5mjUlz/r?=
 =?us-ascii?Q?xUDl4st1J2ejw1T2c6knvApgiPM/Lhu0IZA2JLgf6xn+NYU5mjmQTaYHF6IC?=
 =?us-ascii?Q?cyWNX+ltNaSsNQtgcF1U38HH6b/Uov4QGpb9BPCE8eJC9dgJFJOnduCjWdNi?=
 =?us-ascii?Q?P9Zk/Iv7+ZtYPnxZD0KcLw2D/znY9ljdoZF49JfGAhvQ5c0RTPEkhqe5M7gz?=
 =?us-ascii?Q?lJ44vJX05uzLapqxkoZHlcPlGQl21EZiK8K69LHkc/bmbMJtufeY0Oqz3rf0?=
 =?us-ascii?Q?8MSKVoCXm8cYa9+RjZ1ebw4sKZ6AThnUGcEz1pB0GDd6RaULH01uTjy2tGyq?=
 =?us-ascii?Q?EbF8dBKm8JEM5MQWEAaw4QK5ex4RqVpkkSx1SJAXxrCvoXD9r8eXyEYbCSwo?=
 =?us-ascii?Q?sqTSVJuRPK+6K1K+D/NcnYJ6T9BSM0TJYCWaAlf/tnqhoLa4aB7aZo6qbs4w?=
 =?us-ascii?Q?wx2GuVNF4w12RssvCXN/dQ7fgk3C6mKnMjvrEg+k7zr3dmBmVTBed2tcS0qV?=
 =?us-ascii?Q?W9MJSRIn6jZJKiNjydxNvBaB6UBvF38kZwpoHw6eU+p9Dzt9sJ26Laut+gGw?=
 =?us-ascii?Q?0ZdjpDPLXf7K0TamQUTdFuwS5ZNKins+tplsrlAsZ9GB6v2HDnMLDBxU0S4x?=
 =?us-ascii?Q?FLLjlg1AfbFmaZTlScjY+ZIRIfA5lfuUJ0eUoE+PrY7JliMGfsTEYYvyJxSr?=
 =?us-ascii?Q?+ux0CkfIOXGYYKSxakRaLtWSoNcw+7ZkfXmVQ/wwgmgCsB4SOdgqRc3ewhzm?=
 =?us-ascii?Q?6Gnd62Hd7cM7CVscuaCqf/IMfQeK+a4COcdxwXBVpUzTnllIYuhGhVzaGyLv?=
 =?us-ascii?Q?4TpOzuG3VPj9BOnwdnv5+tq0Gsh1vPIDvi/0o3t+8/1aE0RC4ExnGMhMG2Y7?=
 =?us-ascii?Q?jjVRNsVszhlOU0PTaMsSS0+PwR4byODRYoypCCgoQszdAfhJ3sBqxG5h+v+i?=
 =?us-ascii?Q?kr188/3oiZLAJNBrW6dvKeoRc7HI3e0tSfoX6OaXm7uML6QKguBlEb8kDzUA?=
 =?us-ascii?Q?Dt7oi/pSmyVnsMdtzuyJey9KVcXirthFSJdqo+WQih1vOZZqaVs/fN1q8AAQ?=
 =?us-ascii?Q?0nm3j0nKhzK94Gwbr4aPnZgX7TO0SCeUnnnIy/4chKmrqQJcYhcQk7xeWvi4?=
 =?us-ascii?Q?7Pu8Iqeavh8TwSfO/YKZpkWOFJi7zanZvfu9fYYjhJdjDBqShVRqJiWKW+Vn?=
 =?us-ascii?Q?3FHiG2zzUGZfUmjcYMJtlhjK21aOTp4Jt68LrDpEoO7Wy5z2xYRm9xt5BXJR?=
 =?us-ascii?Q?xeJomjQeswbnUMfv6fQe2gAZlFaJ+6TyvRep3mAAqyq4Nze2ZdDrq7R9wmyv?=
 =?us-ascii?Q?WixCExPmYsoiDbtqgIe1NEBetA9Cf08=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37263f40-a602-433a-7d00-08def1024b68
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 01:55:29.1700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7ANJHxg3mqZx3lbhfZ9S9MEnh0RZv4qMCHsUnz8tTW4x7XWES2D7T/7xwVuqCiADfVR/H26Q1rXhvqGiVxU52w6Ze9B6mF2Jbzkqchikodgqoo8+E1JANAZ/kHUb+Tv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15074

PCM SH7760 is not compiled with COMPILE_TEST, and there is no defconfig
which selects it. So it is easy to be overlooked for compile test and/or
ASoC updating.

Let's enable COMPILE_TEST when it was for SuperH / SH-Mobile

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/Kconfig b/sound/soc/renesas/Kconfig
index b7a91e44c2754..bb73e5402e4e0 100644
--- a/sound/soc/renesas/Kconfig
+++ b/sound/soc/renesas/Kconfig
@@ -4,7 +4,8 @@ menu "Renesas"
 
 config SND_SOC_PCM_SH7760
 	tristate "SoC Audio support for Renesas SH7760"
-	depends on CPU_SUBTYPE_SH7760 && SH_DMABRG
+	depends on SUPERH || ARCH_SHMOBILE
+	depends on (CPU_SUBTYPE_SH7760 && SH_DMABRG) || COMPILE_TEST
 	help
 	  Enable this option for SH7760 AC97/I2S audio support.
 
-- 
2.53.0

