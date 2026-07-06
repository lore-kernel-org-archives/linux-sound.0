Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B961C5799
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304293; cv=fail; b=RHx3OGqdR4yPIunWW1ixYJ8IGqYTnGCtFP6zaPnYxnJ6swN86v7XNQQanQYpGke9RvUpeAjFPXciZEMYHG5ROS0prPPigQmC43E4RjkbHjdiJtjFl2D2oehV4wamzyyFXPVaxfbZgtSkQAduEcDVdPzMwxkoJImia8AYcbiw6XE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304293; c=relaxed/simple;
	bh=/2pB60yvupptTufq87YUZ9FCCJ0l9zBXFZayZNLTKD8=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=HLJA5YswjvBUbqlFYWfZAW4sKQM7JGKuPFFEn6IuG6ClB9+KSVDebvjhgnSb612GBeQCTw+HexSJNTsu77/0lBfHsCdNEwT5d/f1NN00+IZrPxlER1/AIsQJer0NuFz4NPfohOz/llAff9gPll/71Y26afwlGCAxQHacBY+Px6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VBce786d; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VBce786d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYXFwNqC/lYbgdB7Lufw4oUg4LMAeFrqDHvxCEImtVFWmng7TKFpAGF5kZvB2Ka7ZdkzPXj3meRpYLd+lO3mDiR0YR/lDuK2QXqSGc1zWmdxo/0Hk8HnDAEMwIjU0PskwTt1zQy41GHLAd738X4yQXCV2VTczv4vPxT44MtMFNhDvcCL8XLOunTYDXB5mQA/yqgHpRZE/I9zb82ftfzCBn7YjgK4JJIdOMPij7EKgRfKiGIHQNpk/bXe7Al8VnI53ceJPEdFIzsUleGOIVoPUVfUIwhdtIHKC+S7XthE5bXMf0O7pXr3JNYBj02aUZt63eKcYePy0ETdauxkAuUSSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg5qnNUwo/W3Bu5/nm3ELK91XnXu4CoL3e/DUv+6FuM=;
 b=NUGOg9dfOVslX2i+trYLFLmjtuhi45U0WmIFvk/evZhZyib8eZnRRq7MBnhV8UkZGu+HzvczXEHxyV//0Cn5jdZqvjsFvLcYeSnYLxnJjEtYuHWrdwhFOp2KK49VZ/4kXjoOZQmW40OowunQyJApS1xp4zSsK/FbmKG6HAk5d4Ni0T/paX9+I5tUXNamF2njT0BIJdGzuMtyYsXyaHOGhD9+nxPj5Mq4G7wonxMet7afB0HZefhLSMpQb/N5fVehTy1DVz4HMcRHFVOeAxHW+XM/t7gxGoXa6ZylV022HOAvl0x63WOJeYKL54JcM2uZ12Vi3FtHH6mXSHXWZHM4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg5qnNUwo/W3Bu5/nm3ELK91XnXu4CoL3e/DUv+6FuM=;
 b=VBce786d0lJ4LBSxLntC+DnP50bkfuYczdRW8ziN1alH5v4/gABw32cC6e3lV6qevnZd6zGBilScir0nPd2ktAgN45Ml3NYopKtkDAv3dygNlqDgWG75iPFohqCpfZzvH6VFqpX3Z+Co7y4ttRGWzequd2U1Or2LaydaXk4FRrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB18021.jpnprd01.prod.outlook.com (2603:1096:405:39f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:18:10 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:18:10 +0000
Message-ID: <87fr1wc13y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Kirill Marinushkin <k.marinushkin@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH resend v2 0/4] ASoC: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:18:10 +0000
X-ClientProxiedBy: TYCP286CA0221.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB18021:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b54a847-d6c4-41ed-a139-08dedb04d323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|11063799006|6133799003|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ZvQJU1SjFg26KQWClGX7Thn2yGjVFgNBKePHEbpoyiTdNRlVuZvWo2XE5EraPwIeiANO5FP6agOgsNzI32qwRQFqS3D2r1T8TgGpYZmtKPECS7u6iCo6fHKxArMfpnoFJrKT4WCocIynbfHEQTqNn9OtRQ14vBnfei/7TfJefdbdOXPZo7hqTzB+dMMq24YEViUMeJDvZS9aRsIDuCYnjnqE1fJELh1I9sL+Aksz/uHBMz62Fx7pq1PQkmMD2TGeweHHytv8/hOBV7TWD/rqT56BkKhH8FCpY4fsQ5QSZEfaRJOgOcig/TgKz+P62zNeJG78gsbLN2AsQ94ny3kPwqAexkr2Dum1RwyWEUTszDCurdqxQjPE5nThAu9ylihKuia4bjU3uHFnx1wxKFcsO7KD4eH0GGNSd1S9ZUcLaxGgnqWCfdprdR5/wsjeeQqkLUEhm+nhujQs+sYnzxfdtVONuLzPj/6/2UK7NsFKIj9p3pDrYb2/0PicaEsDakbWbLH6J3Olp4vPYtYuccSjYjFaVnybCrjGeJ8d+McLc7cD51opfrg55n4BpCaT544MFdp7WHusUV0BXMnTXwxin2jFeF1jRkekTdqAMyjjWNgd0pW9BEU83lyILcgImO+2+NpyY2SZJ8YWoqvWC6Vk/XmgPBgwyWCiMCU9yVeubydoG+X/1ugf/lhEHbYftOTxjSxS1eRdNhNvLHp06yJoQ7Q12sRux/SykTdyyXWHFho=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(11063799006)(6133799003)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E+aFFTqeV8NB4720GC6waBYzu/maSlKTtLpHekCPHNKcX2xbs+m37+2w1aHo?=
 =?us-ascii?Q?v7NRQpwsoXKUBUTHzCwI9RkRyXE7ke8Gxow3vbStmpWBCseWx11d1mZYo6zZ?=
 =?us-ascii?Q?Z8W0C1QT3B3ZWo0msBJtmtsTXxEJkunriY0Tkw/c3gYKwli+wOR348fRzJxX?=
 =?us-ascii?Q?jq4JP2/wyfuoIDbTI/PMUEc7S6EQynfafGSmsmaRarvxPgJHDrZk5z0lTkML?=
 =?us-ascii?Q?shc+PN9YelLcIXQRym56VdrHFJmjMMQHcG7EuJ8Ph7fGf/fblJlon+sprfcK?=
 =?us-ascii?Q?ncyi7IGIVFsw8OwAWtny1uIHu+HzNrT2q2Pi2FjwqTAZmXnd5X3cTQC/Vp82?=
 =?us-ascii?Q?lq8s8w1TuwTpHW4IscJr3YSYfPKgPNEwckj0B///uetJphuX+dSIdiGbjs9q?=
 =?us-ascii?Q?fewPzT6HMCH2CYg7LOi7qguNzXk5QAUUipHfugUJf7e/19H9v4bEB9VlWhWI?=
 =?us-ascii?Q?6HcicDf/VTwSvbCnPcw33nLXrom6JLWBnoaTWk2ZKkP2ZlozcKzdna+JJ6yL?=
 =?us-ascii?Q?rboB/rlGTQ/9s7i8542AZj4f41exELk4FZwtuHYBZjnLmfsDvlpQT8Bux+Al?=
 =?us-ascii?Q?nmfA25R0eaPY3FqoC+JnWjZCdRoBIxO2UR/aW012d9ji9cFMnp8zI/dFICc3?=
 =?us-ascii?Q?rN58Vt6GvDhk3KvRP81u+83EtVPC40TBPdHEwYtTPyLT+t4sCsyhMXELnLa8?=
 =?us-ascii?Q?oMQyRAk/pGTUamh722MMfPKJvQrzrP/UMke1XM7BnB5lH6vupRkQJHlx9/NP?=
 =?us-ascii?Q?B+JOSZrVRr/fVewGxLXGe3V9M24nhUhfYzXklr+A+8ZRQhoH6+8STPtfVVsr?=
 =?us-ascii?Q?7sHDAdv/tZ1+FyzEirND1gWGNOYw0ORf8I2qVBL+bUDuPQyrqhcUtmVmJQwc?=
 =?us-ascii?Q?wt/kKoWvN36QSuP+Zt+VQ48hccfqt0m9DzSkd9Kh2lpSl/1PPzf3wfFojd83?=
 =?us-ascii?Q?4xOUWdC/MDxkOdkvvU0nakeMSc+qtOxHFf+J9nEz68NBt1C4m0PpcbpxKUlL?=
 =?us-ascii?Q?p6/iQ7EbWsosAPDkzbr5npomJQApCjsH/f8hDCDEFRfvWphnPNu9sbSKYCvK?=
 =?us-ascii?Q?hrKMEVNt/COGief7swSAXeJCA0nZddkbrmFTl23xZTHY363ejrnrhH/a0aU4?=
 =?us-ascii?Q?bevXZGnCpRaEIyraqRM3RFzHEX9Rb2YW/o8GP6O+39A+VClPRZs/z5oKYWHR?=
 =?us-ascii?Q?LmpwfEfRSnDQwZPMGqa+M51n4jXCATAGR0a2pAFt4PDbGaFkEglpxORlZt3L?=
 =?us-ascii?Q?tgvJfC201Wofo7FxHISVhvQy4+4M2gzJBKO4QIWRROlGg9TVI/4N7yx6YfLM?=
 =?us-ascii?Q?yB1gJ7jJ1yKGXWKL5Igi3LP0FehPZw/ahjUSFRBRnVtURDd3z44E6oVFvzAZ?=
 =?us-ascii?Q?cvmtEdzEewhOow/pdvH9YiaiUJz8+gU7eeb25SeDbI5jE9A+z6f9RuiqYwIU?=
 =?us-ascii?Q?f54vZyjUGrNWtbqTMWPvqmhdF81FJXfPnvzNNFAqwIPti6e3aUi+cGjNXcEb?=
 =?us-ascii?Q?jkQbuq8IMS1QKQN7eQGzUPpCljtJgnoUDjd5OUqFieyU7rwVyhg/pamr/AXX?=
 =?us-ascii?Q?RrGsyfpCB5Kzu1gJI6xqfkmjK8bdGJ15AMA9DFMLAbWLuHxobz9oH7Jvrpfb?=
 =?us-ascii?Q?y0mynTMD3+NTxHE9xvNWEDs/TntcltFFROilUOVO6OdKwoob2Au/jZjuOXv6?=
 =?us-ascii?Q?G8tVe4HT6SIL/sVyTwv+dafZ3GbODIyAHveWvhef2mbg/vknBS27/zFO1LmB?=
 =?us-ascii?Q?K3rVwFwthCQKsZqES1UP9PoyoaogXWDSqNOtb3zlP5MpStSIbHTP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b54a847-d6c4-41ed-a139-08dedb04d323
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:18:10.3148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwNzBAPRpiehjjY5n5FXWwUySJuSn4lGIJf4Ta/SVBoNJgYPx3i9QS0TrY0BstDJoFdRv6GkhEFEUE/37n/P4zOl5lAM1rUSS4Engjm1e7DdE28toI9NeAeIH7vDdbmv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB18021


Hi Mark, all

This is resend of v2 to add .auto_selectable_formats to each drivers.
I have posted it for all drivers in v1, but is separated into few parts in v2.

[x]: already applied
[o]: this patch-set
[ ]: will post later

	[x]: convert existing .auto_selectable_formats
	[o]: add .auto_selectable_formats on driver (already got Reviewed-by)
	[ ]: add .auto_selectable_formats on driver


v1: https://lore.kernel.org/r/8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (4):
  ASoC: amd: use .auto_selectable_formats
  ASoC: codecs: pcm*: use .auto_selectable_formats
  ASoC: meson: use .auto_selectable_formats
  ASoC: spacemit: use .auto_selectable_formats

 sound/soc/amd/acp/acp-i2s.c       | 6 ++++++
 sound/soc/amd/raven/acp3x-i2s.c   | 6 ++++++
 sound/soc/amd/vangogh/acp5x-i2s.c | 6 ++++++
 sound/soc/codecs/pcm1681.c        | 7 +++++++
 sound/soc/codecs/pcm1754.c        | 6 ++++++
 sound/soc/codecs/pcm1789.c        | 7 +++++++
 sound/soc/codecs/pcm179x.c        | 6 ++++++
 sound/soc/codecs/pcm186x.c        | 9 +++++++++
 sound/soc/codecs/pcm3060.c        | 8 ++++++++
 sound/soc/codecs/pcm512x.c        | 9 +++++++++
 sound/soc/meson/t9015.c           | 6 ++++++
 sound/soc/spacemit/k1_i2s.c       | 7 +++++++
 12 files changed, 83 insertions(+)

-- 
2.53.0
