Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.13.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244752;
	b=II6dSzXphPB732iMvbAydibxrKr9AbUkydYq0pRCrS72V5H1rxzQuSYW7v97TnQDKp3T
	 ZiZtsxW/AhNxgOC/5NUYLcNjRePgyqmg4w8WrWVHRtlbeil9EOVygZd8W4tgmAq+xMnYA
	 8ruCuQIu9xBHzp5AM37sDYvdFFpA+yEEEWM+YL42fBASILrXstqMCx3VTdoo+HyQ4YikU
	 QNdEmYbNt1H56p5E3iR9hf0msB4N+B4NH9GQgQ3nZKS8rNPIg8lTfP/YgLp20dHuVwWsV
	 PiYyddpXXYuafho1Em+IdN7QMC6HPx7WZnfmzDBTyMcaWSog/YMDmN8O1ZV3dWNDPog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244752;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=F+yva2Vv4P1sEJOns8MsaKnMdRPWFReUfvBYwMKHoGk=;
	b=Wu6q3oXKcVMm3ad0WR6E4I7m+k9Hhl6QyG6KCAYbcpiU6caMIpjFrCQowbkE1nQxTlAR
	 kuzSLlVr7XV7lp6s4pZceW+So8kOd5KJwEIXDu6GS/C99PjaGfq76aU1pUuo0lp+jI/iy
	 BuA+Q3R2+4TJYKXROyd76dkBCTTHZMuMCyGMEH1MsPb0M8syMXUQw6MqdOmdAQB+86Kg+
	 5vW1wRzk2e28SwfQS+CgPV0CNlPLKgyO3c6fS9dOj8dDOvjkkK9uMG4CAqNiKYt6ZTAOe
	 MPGb5l9hs3s3AXlwxdoIH0o3KJgZglN7YMY4D5tBgUKpqLCQz0anM5HjJYFN+o7stMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=UwrNMxqi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.13.4
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazolkn19010004.outbound.protection.outlook.com [52.103.13.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE53E606A325;
	Sat, 21 Nov 2026 07:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE53E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=UwrNMxqi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZ2VD6uGoczh8GvSGPnToShknEXcq1bSF+BPgXum3wKftV8s0FkgJYMljCHRWExAYh969Cg5WIgUcJ8H7xR9N0y0agt+KRtWkl03Vnuh+T2PWxvh9lWeROQJk7qcQJiwbwHwYjPQ4Gtw7PSL9I6yKAcbfVNduOjPYXHYrcg+mRW5StfknKNnnWJFp7atAbcqLgPm+RnXDoSGibCLKsZwJXZHnVKjMyuB/hBnmd/eGNX7oixOPC0wlOXFXoSDg7H9/82GLvhkCNtbMu3N2opYB0wZI37E75Jfou6WbzOZzeJ7UqjiRegg8f/QDpiI6sGSmqHHEtzmk+OEpRIphyrJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+yva2Vv4P1sEJOns8MsaKnMdRPWFReUfvBYwMKHoGk=;
 b=gOH0ECLpMOJODnZdOF5BxVpXqxdd9PhSDrzt4fW9kgxD4py4rxJAdtecoGQFUCaC3Z2Fdlf6EPdUZjaVrYM83CvgrxUv17iAas+Nty7owvOlxi9+280DIEnEonKz2yy63bztK1kt/eYPTRAkpdTXG9frzShnwdjA+CS6oJsPPg8T963Q18Ia76CENlvU+5RGc9x1GarK7z2Gc9jA87VomHlYKudXZUtosFKXOf+jSD2iFmWXfQQZl2dPyam1aDXaKSGzJPoHuj/jq9rbJB3tIw1Cbo4sOkAlGvTbhxyFFnKbZrOfPwpUFNxOsbQPtzWTStr44MLge4oXvoMtY9gfqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+yva2Vv4P1sEJOns8MsaKnMdRPWFReUfvBYwMKHoGk=;
 b=UwrNMxqiSawmUXRfSnfyLqnUlfrHThR+K6MJrsE6Kw3agkVGvDQbHjUvMcrP71sU0cq80k8+Qu3m2INj1eTgmMv0Jkds8bMs7rX+7sb6qKgepAoF3LwZK/QEaST+m5U0FVZvtLdTPluaKebWvlXdeEyC5HxnT0EnNw44LCry/reez1veN7HjxTtgEe/xZFh5iEWiEzxEkjmsU56h0AHBt5grX6iYFy0Kf80fNTZ/JEUjxQzFpB3kD7K6dXHvqpbQSuNYacG0PqD3wkqBWNHI20opR8j1Ian2VYdQ/1QmWW3AcOK6B5IQLzNkFd4ySAen8d5gayNxQpLUSaC/xVGz2w==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by PH7PR19MB6505.namprd19.prod.outlook.com (2603:10b6:510:1fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:05:26 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:05:26 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH] ASoC: aw88399: fix register used to disable I2S TX
Date: Sat, 21 Nov 2026 08:05:10 +0100
Message-ID:
 <SN6PR19MB23038B66A212CA32A4B6B3CCFC472@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1PEPF00000AD5.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::4af) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261121070510.7202-1-marco_giunta@outlook.it>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|PH7PR19MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: b12efa1e-e249-40a7-3639-08df479dd08f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|24021099003|5062599005|51005399006|15080799012|5072599009|8060799015|19110799012|260925184616899003|25010399006|55001999006|3412199025|440099028|10035399007|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rnMK4SNNecOYcdjsy04mZoCteMe9xd5kNL8erIAbvmd4NtMFA3r3bE4W4Uio?=
 =?us-ascii?Q?vFiioj5fpAi6fKNy7+qf+xQl014GCx6XJelF39zs+EvxPGtED+RxwemL7+2h?=
 =?us-ascii?Q?fm6EO0Y0oHrjd64aa2/I3MI9y1nJVvbj/hdARwNEpcQ+DIOcfNf5QQ6KJ13Q?=
 =?us-ascii?Q?4h+q45+2i+z0cUIRnJZf5O+PIWgW54zw2xi0FavZgbFhMo4EeUQoyjiUHZVM?=
 =?us-ascii?Q?pDrrzQUh49GoVJHzVzyJppwC+jAy2fjNnMVLTpopSTI74wiRxQvyZGOpAQLH?=
 =?us-ascii?Q?fKIwBRivNLo189ZAltjyZzPdpDZzOTbLWVVUuPZdrUnWbGqGRMoLwv5jqXNe?=
 =?us-ascii?Q?9qFc4zveJ3eOwJE8qcMNSw9y5gf2J9hnbJjKfvq+8pPlEYlBrf0uBhPDOWoQ?=
 =?us-ascii?Q?DQB00ZHgTpR1xrTdKzgCLV+SU2+1Dm73OXVoDgyOi2wTiuDulbhZst602ZyB?=
 =?us-ascii?Q?ag6dDYDHB8N//oX3DF/HovUYHMzwyWyandguMz8Q5ewVaSbbzAWXC2q+4lnk?=
 =?us-ascii?Q?d1fhn5lFYv2vAh4Q+98Ing/70N0SmZXZL78yL20rVJlNBNLqzZ1dOSa2heQA?=
 =?us-ascii?Q?TDx4W43T1pkoz7JFXewEceuqRMlC6oVM4V/rtMRYthvjZGef58GgmGSqqOb4?=
 =?us-ascii?Q?DYyrz994UK5nNF/xEtmQaUIm8x8BT1jVRS4nxAajr3TJsfsiDYrSMb1hIga7?=
 =?us-ascii?Q?KIiW2X7m3W43Bhsn258/Qm1MWrveUwZiQg0BANRjOoDNcUZSpWQKRhqEEi3J?=
 =?us-ascii?Q?BgBFtMc/Je3ra+n5WDoutfE5QlrSydnOLYszSqO4yQl7KGylEkaN77rz1qK7?=
 =?us-ascii?Q?B7NRBG3I7CbKs84Ss/YwUloJVZSzC22gSXfDhjyRGbVonFac7RPJyKeNx38T?=
 =?us-ascii?Q?HSmKRiR24IoeaxaiZjv3pGJc7lxPUFZJqse9z8QOdo18oieBgRI8UAk7ww7P?=
 =?us-ascii?Q?YhqH/+HVP8mZfgLJE9FuyKqQfmxvh4s0ndlm7UzZvrPu0zTdU2VgaXiEWHF4?=
 =?us-ascii?Q?efK3?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0YCnS7t+bwha/FF693ZxjQuAuNsqdFndXW1fGKKfQ9nPg8/moAQlUkEEb8Xa?=
 =?us-ascii?Q?JRDK8pdmuiRPj8LexOtYBKxmq3cN7cmR9s0gjrK8hGuWmSFoQS5u6H9ClmHz?=
 =?us-ascii?Q?fFl/pT2Ryl4kdr3QJeoIpbv/SB4BG4OPneoaJ8mCGKJy9+AU35XmrNu4cMG4?=
 =?us-ascii?Q?F/KCaxRAb+eM+2/Dgf31r+LQQ0Qn5T9aXPrEpbyWuvMWjDgYdINUCGHYdFxl?=
 =?us-ascii?Q?XmJz49iC/qIOuy+adoeCAeTpWEOZFo996wqhQ/doa+YN47Ff1nX8bYpLaKfv?=
 =?us-ascii?Q?x9vI3I4qY9GOE2yCGaS5R4LrX79jBrZe86JxHK1yucGv5lvPc8rMXtcyWGSX?=
 =?us-ascii?Q?af7t0kbfYBBbex6tnz9G8d1Kf8KeTVYeZg9SKiwdriiivqkyQvmHeGtN+Z7d?=
 =?us-ascii?Q?OoqfZLc5jutVXb9uScR3pu7n499Z1ev6kosMDlAb7Yy+EvD/7KqdzIimh0Sb?=
 =?us-ascii?Q?VOxwkJGNCVMEAPXJHYwXEgls0vUeaxi/TFxvY/y2HLLV0iPgVB3X73m9cQRt?=
 =?us-ascii?Q?rAGGVPvawdIuzPHa0IZtRDDCsc9p5+OyighLhNzVwn38b8L7hxOgZOl+BJ8H?=
 =?us-ascii?Q?LQ0MMG1IF/VcGDrtc4eSemxe3nYujw3ndVc+5X9wvT28jeu0saODw2zCPbe+?=
 =?us-ascii?Q?v21L3gcNYc8PoP4N4IlX2FCxbb/vmS/K/IdiRKWr6z01mPxyYkLQWlJVtkY6?=
 =?us-ascii?Q?vU+l7X/TGFekFjXKGMourPMxoZCqUTH9DwsNTjFQH+kaTqXxwx5p+wrYzVs2?=
 =?us-ascii?Q?QBvKIzWo4SDB6KFPas4rUuVq3M6doyxfRdDC2sP7mA3MTPzWaDmBw2k/b/7B?=
 =?us-ascii?Q?8eFdf6g6kQlyVr/SNiHzdrieuOfOjQa7BKQB/Fthm6CnL7x9RpMkJZsflg9q?=
 =?us-ascii?Q?nF12GFcphCO60fyoJ/mkI18+DG66k8f8ppg3ytI4rgHM5YAS+a0PrfN72CMQ?=
 =?us-ascii?Q?h6CF/yRdo2cZJx+JvVng06eMSzVFF5LXc9Hz3H1S39QwNRKJQrqc2+Kya67c?=
 =?us-ascii?Q?7TrnUeOSPeMDf5W6VCLENF19+mYOW2xOQVEqEUhx1ikyVCx0k4mm4NIID6Aq?=
 =?us-ascii?Q?owxwLLqyIStnQU5iWaZKFhDIwVEgJbSqWtxcxOsjJIlV8uUdWJnb/jXEg6h7?=
 =?us-ascii?Q?Ky6OZxBttGVMPz/zaxvEFSEng5sBtUXlnWZGBs7wCtczgpeOjvn26KY+irXJ?=
 =?us-ascii?Q?fve1W55fJYlcNdQ3m6d5YDKnZa6cUcF66nt5W7GaJaPT+Sc2zrQYI2WRc/J4?=
 =?us-ascii?Q?rrw38qEHn9p7ZDzvDMMC4XKOMaBsaaUWgxwV1/ox5acwmOyoDx7DUngzqUd8?=
 =?us-ascii?Q?3f4m8iFpY9lMq6CeBmXiKgSbgjn+ZCabdOVLP9N3urnIeqiDCdi8s4dL6fqs?=
 =?us-ascii?Q?Z11HvlE=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b12efa1e-e249-40a7-3639-08df479dd08f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:05:26.1195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6505

aw_dev_i2s_tx_enable() uses I2SCTRL3 when enabling the I2S transmitter
but I2SCFG1 when disabling it. Per the datasheet, the I2STXEN bit lives
in I2SCTRL3.

As a result, the I2S transmitter is never disabled when the device is
stopped.

Use I2SCTRL3 in both cases, as the vendor Android driver (aw883xx) and
aw88166 (which is also derived from aw883xx) do.

Fixes: 8ade6cc7e261 ("ASoC: codecs: Add aw88399 amplifier driver")
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
Tested on a Lenovo Legion Pro 7 16AFR10H by reading I2SCTRL3 via
regmap debugfs: without the fix bit 9 (I2STXEN) in register 8 (I2SCTRL3)
remains set after playback ends and the device returns to idle;
with this patch, it is cleared once playback stops.

Link to aw883xx: https://www.awinic.com/en/driver/AW88399QNR/832

 sound/soc/codecs/aw88399-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88399-lib.c b/sound/soc/codecs/aw88399-lib.c
index f2e2c88f5ec0..a6303f32e2cf 100644
--- a/sound/soc/codecs/aw88399-lib.c
+++ b/sound/soc/codecs/aw88399-lib.c
@@ -552,7 +552,7 @@ static void aw_dev_i2s_tx_enable(struct aw_device *aw_dev, bool flag)
 		ret = regmap_update_bits(aw_dev->regmap, AW88399_I2SCTRL3_REG,
 			~AW88399_I2STXEN_MASK, AW88399_I2STXEN_ENABLE_VALUE);
 	else
-		ret = regmap_update_bits(aw_dev->regmap, AW88399_I2SCFG1_REG,
+		ret = regmap_update_bits(aw_dev->regmap, AW88399_I2SCTRL3_REG,
 			~AW88399_I2STXEN_MASK, AW88399_I2STXEN_DISABLE_VALUE);
 
 	if (ret)

base-commit: 7884221ca9857a317bf4bd81ac3bf5528f266feb
-- 
2.56.1

