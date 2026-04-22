Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC233603EC
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 23:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776900451; cv=fail; b=SB3twLCOLnAXt3F735oPpuTpenprFGm12d4DSJftkNU1ckgOpDAkW6HfOG4hM8LubCt983+EjehhVZ7L58I/jtOPl+GWOf7StJmc2cu4rR3cQwLDQKHvwLSE1KRYcWRU+2qUpnE0SZv+Pkp6ryqxs5xLOiMqdUgVzgCLGoipeyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776900451; c=relaxed/simple;
	bh=DofC7qnjQAkM77uXTVCjaTm0rjcaka0Vd6da6a2ud3M=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=EhxWcysHY2sZfq34gy1B3H57OojiRt2WC4KyZIOylO2cKU0jHejO+UbXVBClecPJD8o0DQ27gqwpwh2IWqL/QbuAHEG9BjrrYszz+Tq5krHKEsAWb5Fz5cusKiNecTeP4dqq6Spq53oKD8Bueam3871XuEuOU10rMQPz+WgOiHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OHDEiTZB; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OHDEiTZB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRRW1FkhnRbSIZYBplau4i063KEiOz/iPn+v3baT887jMAeUwhXQuqf+98pdTid1H9/6xq9vPC+nXhkP3xZdM0jRLPqE6ErDXnAQnF4P2s/zZAGDliCe/mu8tMK3di/TBnEpMqZIh5+IV6CZj+17Iq6BR/UI73gT+WibpG4pWUdZLsweO9pBTCJHsygG+m54pmXpODyc3traX2oevEy2YCA/tJCYNu1CyK3+VMvoYqD85Qfmc1z/HoM91JGthsY97HAi1619ZSB+pR25iXzjcPj+Twp5vr6nG1vRzeAz/B24OBELRdGD5wRODdEDXzKfkDFHsuWv3Su/pRg7lefyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sq7m9S8MjTX8BBpSt3NPTnQ+zr+YISjaKhA698lCwUQ=;
 b=iQFPe7Ehwk2+n8ZL/rb2xlb1TVGn1+c1D0mjNaNOs9bSLlK0IVGiGAudHbyenjWDdNiRzBpDXyOokDhrFUTVXZjTcfsSXdepRMHhZqWHD5swqDS08d7zktUzndxmPjFufUu04KGDQvtUQSsunEk+rQtCc1UJ/S6PIY3nLTT4A/VccqfpU92YzDR2ewIObrSERpvffEp4/qCgSl/6XUhWsklleXSnRDotcnmqBBA5WNq7AgBlPGnD/MSibB9wKmc8tv74L+KBIL+ir4feU2ABYQSiObcVO5GICZXQoLmT+e0piBal9rS4GeObrvaZvEshZOPFC57EqEqhW02oTAmW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sq7m9S8MjTX8BBpSt3NPTnQ+zr+YISjaKhA698lCwUQ=;
 b=OHDEiTZBhbSMMM5ZjFmp997pLQmi0g1CNk0XuVLBhZ4ukpCvsWG+/QsQy7201USeGCKWIXJLpJs6dl3oDg+iGkq+ZJ0qMUIbPnwN2KtKpRrHeoFWPzkM65Hv4CB++tRtp6un6i67HULJ7Lhxy580BASqRDC2rmOgUXSDRRAP0kg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB11934.jpnprd01.prod.outlook.com (2603:1096:400:3fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Wed, 22 Apr
 2026 23:27:24 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9846.021; Wed, 22 Apr 2026
 23:27:24 +0000
Message-ID: <871pg6d19f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH RFC v2 0/2] ASoC: move card->pop_time to soc-dapm
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Apr 2026 23:27:24 +0000
X-ClientProxiedBy: TYCP286CA0172.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB11934:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a2d7ba-ac75-471e-0d15-08dea0c6b5ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|56012099003|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info:
	wWxkNY4j1Nl0XaseAyPphACyNfFnGxBNGa//JVA213pT9Bm7xhqRzPgqbjmd5eKjWfodyfB7Ws4HGhohSXvq6eTWrk3vtNoPM7BWugDpSjhgml3VttRTDXnvQHB9hE+gY3pxstT/r2/KMlYtM1RZK+UYv3c1In1BWKCdWF2GBEJNolNtxPYHraQqQ+Mgmx420mlOAA2dqJ775gH/65NyhOjWo6aW1as+XJ5suzlKioZMPrLjIveG4QmDZ8WMwd9puN7juVu+RoWjjeTVMVPStQTlPPHHuMY8h1RAUI/YAIhhyaziLk2nxU/i5JdIcLzz6kmnIJGzJepfxv5KKU+tupsCCdx3rOB3TJked95QssMfPwvHmYwVECoPJuKkQGbZSGtFjFw80xtFGYKsHpdsddEuhTDGMRhfOuux3mIxKgTGckMqJ9Mm66W9aoXMjLsfm/VLvsrBN3GsktJ0pAHFlgjUxfV9meOq+E3E5vI1iBxU/0ghbcRWJf5BX+BxQX8ajekPJqPJs/5aVizoUF7CVTTRhqx02P/ifLlyyX9KVvzDaRqr0Mf/OVazfcQblIoYiIXuiIOWt1Rsx/F0kFg4TSifWHQ+nuGyaGvU2+xkxGnclOFRCV6H9/5Ihm2+4jPsrI4ttrvtmDYlQB+vuaH5sKQhNKlmOX8vnGMfczEWL9MsvUluqHPDbSWwfdb5Sdj3VZMuUmv82qwOyVjFRcmlFaWXfQz/J1vGbCykekXs4AmQyDU6a5hcMzBYFiw+w3KTbyqvEBaMmpgnhhkaZNP/KSB9bWcZxoJaDsgpjUnyUYM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(56012099003)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G6xzIioWt4sVZ293CmHP9Q5Wsty7gGC20pKZznRgAWWRKESTLgnw1pvyB2oC?=
 =?us-ascii?Q?ceU2Mg+dgMSRYegiFGZFfPrQf5RgcLP9w6/XzgennM7+YUFF0D8exKjdlXrf?=
 =?us-ascii?Q?w89MdP0p9msuA8fAGy4WnAvkObd2ND1+R/UCCiZXEgatXEfZNWrfR5rG2+Ag?=
 =?us-ascii?Q?XKJ5YdeW04Z0lkkvFXNriIAriMhxuBXXHvROlP16F1aBxOYIYlrJqkZdo37j?=
 =?us-ascii?Q?QKwdsU120GoMDKPfYiMjrnBvRbaGl+c3bUrZjgFD1kQivCyaXartY7aAWn95?=
 =?us-ascii?Q?fx3LVk3JkQT5ucym2qar/GN3+f46SsFLzoE38BPZIxFHp4b2OYTtRzRTxl5I?=
 =?us-ascii?Q?34EemXVtG7eHDU0+ZmstAiMko0x9UqZrp6+HHC6X9I6H/0XdZOLK0HwJT/ik?=
 =?us-ascii?Q?gkxFj6rUr6ETlfzaZz+3NG0B2QFJlcZYP9eSuuxNtSqhlSkorYrynGB5Cx2x?=
 =?us-ascii?Q?VDmrprAGAu6ROu43tFjEVilY0VR2Xwsomi7bopde4XspCJQZABO6TOSfLtP5?=
 =?us-ascii?Q?6zwfk3yzqzVP+X5JUC8QrrUgNiaoVtBjmAdx92caW6hr3dlq20ner7KYhYhF?=
 =?us-ascii?Q?r0SswR6LRegMoVeaqknZ7dwewxizTrAw3OuIlp3WsRNkfSlnDzY0+II5PSp0?=
 =?us-ascii?Q?vQWevjT11eP3ivqSKPnVFP8OJCYZkQY0IRwqdCFS49spIDIDvAqyHuj1kqIn?=
 =?us-ascii?Q?DMYGi2sphUWdwcT1DSXSrtJzXwBy30LfNRUoQqRNptgRhIck1IjKt+h1ciql?=
 =?us-ascii?Q?+1kwoiAeDjDks9QPtRPsPp1WAoTQh5MRvTRzsGeLKhJyQL9t2k7OswSy57sO?=
 =?us-ascii?Q?BFJgQvRTuK9PmBuReETHQquY6edKMRf/fme2UA5RxlLn6RzN31Fj6r3FQI4b?=
 =?us-ascii?Q?HZ9Bxuu7G6bBNUuuk8KZ21x4VWW3OjTwVNhYm1/xzuQ5xS2RLQ73d6rT5zE8?=
 =?us-ascii?Q?8LMzUxijLHlbqSR6I1ZG406Qp1/Mir4v2VLVX/ueYDmE7ML15i2cHHl1Wa4e?=
 =?us-ascii?Q?GNlQEOvhHrLI+QpxnS+eKk6VFZ00YHZH45gNw4BDtKHFUn021VpsnjeJqZIN?=
 =?us-ascii?Q?BIognM8RQPRiMaU2TOzovjt2UKyk5nHnMM6SnmjyZRnD102bxMwoE8iM/hDT?=
 =?us-ascii?Q?c5IFm/MyLT+OvPwxUQ29TiEcqvFetIx1+Nu9prQwnQav9rkwfRZbUNwP35PN?=
 =?us-ascii?Q?scBtpF3lEkmogH95YPOwDh0J/SC4oQzUA3GGFfh/KIg2KWGUMgFEvFICIr9k?=
 =?us-ascii?Q?UPkQlkMMsEhhUIrfCVUiCVJd4ozcCZTlzb8Gt1incctTiYfK1cOE7kpy7m8H?=
 =?us-ascii?Q?c4iuxh+HR+UHWHuEvlWAXORSNCKdSE6ia6NapXyCRDLQxnUenzyLNZeES7FK?=
 =?us-ascii?Q?Jg2ROibKqOOL7dvCs5eXsnycafdsnbLQ5Ss8JS5FejOnRf6VKPAi5i+S92/4?=
 =?us-ascii?Q?SVP/OUANKxUvSX3NCeMqnCdyI31wvmX1HPagNB1MMt4WKji4Qvnk0idGZtTU?=
 =?us-ascii?Q?p1EZ7s8X2JVLhgq/gjNTEN3kQvh3i05IPoOvrMAy8scsPUyH+QDY+tDAT+Zf?=
 =?us-ascii?Q?4A5Sp5TxuYkKGx5UoRRTn1EXowwyh9LlAJ50jYbJmwv7DztO7zwOO4JoJGY6?=
 =?us-ascii?Q?9Q1iiHi5GiNk5ggMD/FZeCxk2h45u/mJGKha9I9Qe4OcBetQbF1zLH34K66u?=
 =?us-ascii?Q?ipXGQUAek9K+tap03+VrwUCqi2T7BA1c8O4uqbJeeldATK7Z9Bmg2pwHG0cw?=
 =?us-ascii?Q?UYFabSyFf02Iu9QvsBBT5yz9l1uEFR/63alp51ywVOZnqirkzdXT?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a2d7ba-ac75-471e-0d15-08dea0c6b5ad
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 23:27:24.6396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+RoPxEVQy1abb62EJewjJRSjp3mlJnx1jdgk+KCS5tJO0dCxCSizxPiyk9Qe+8LfQdnOmDH6MR+BAVhM+MDh4UszLsgi10PLKBMmvqKm8ahmRg8aSIBt2Xt+jBb8yxX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11934


Hi Mark, Janusz, Peter.

This is v2 to move card->pop_time to soc-dapm.
card->pop_time is used only on TI, and Janusz posted patch which will stop
using it. It was posted at 12 Apr 2026, and [1/2] is it as-is.

[2/2] will move card->pop_time to soc-dapm. We can use it via debugfs.
I have added [RFC] on Subject.

v1 -> v2
	for [1/2]
	- checks cx20442_codec and tty->disc_data on _close()
	- use WARN_ON() on _close() and _receive()

	for [2/2]
	- create dapm_pop_time at top debugfs dir instead of card dir
	- tidyup git-log comment

Janusz Krzysztofik (1):
  ASoC: ti: ams-delta: Stop (ab)using card->pop_time

Kuninori Morimoto (1):
  ASoC: soc-dapm: move card->pop_time to soc-dapm.c

 include/sound/soc-dapm.h   |  1 +
 include/sound/soc.h        |  2 --
 sound/soc/codecs/cx20442.c | 11 ++++++-----
 sound/soc/codecs/cx20442.h |  5 +++++
 sound/soc/soc-core.c       |  4 +---
 sound/soc/soc-dapm.c       | 30 ++++++++++++++++++------------
 sound/soc/ti/ams-delta.c   | 21 ++++++++++++---------
 7 files changed, 43 insertions(+), 31 deletions(-)

-- 
2.43.0

