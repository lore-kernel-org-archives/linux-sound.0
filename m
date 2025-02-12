Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6703818D65E
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 02:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327061; cv=fail; b=uaNus5OV4Y/5rly3TPeeQe2ptC+8A00iJeoWKUwOQSweCFlUbmihazOp/T+BvwEWkjg6FuYtULFplAZP4Qy5ud0hY2zBFHYqzV7nyL6B61S/YM8+GtqRMWl2v7Vdabg2FLYqBeyDJErXfdgL7r5z7w6fBKyzr1wxnVXh7TEDgWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327061; c=relaxed/simple;
	bh=4WEd2a/U5jkSaY1Cy8/9vZ/9k/KPdJj9C6DK3eTHWyo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WL1/ynw3vi9rMMMiOKbTqjgkQn9QFip/FwvlUXCcEnjQPKJ1atGLudn3QwkUmgEkJKT/l3S0kiYGeUJR8NoMuShxGnTlyvaEc4nzxgI6CHGWpEmL9d3WCWZG/rMxqe/wGi3YDEQmTI0ASTYtr0mLGp8qaIj/YkBYBwb1RIY6k+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Zjj97W6c; arc=fail smtp.client-ip=40.107.74.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Zjj97W6c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tycxbiKM8DUCWgKJJh9uSq5IH3Ujj+Gs+UgaDIYltK4SDVQ2iRFc4f3sIU4KE5dkunS5NqLjkOb7oefE/irPDS5q7K8jTYmS5Yx7olSn5X79o1B1y/c1ZrmnnOI0iGCtlrQHLdwgJmhIp9TgT0UvlXl4a9H6goVilbFcq/GSf3h5K++SeclsPGpEvBlAbrjpGwaov0YlsHHd6DCWROWSUaJpUd3Um5yFkz6qHXm2qbTNZmJJB316n5KML/UIGhqL+bWg7j9Z1bbmQ2ph2V2+ORXpF2inFfaVvN+b6a8dVlqUeB4U0n1lZgLSx/ivdSz4xoswTgxvdYLlWHkSA3V3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+/y9cXmsUz3VIQGT9hx4pO+/XcNDsEXXs9imZXN+Dc=;
 b=gc/MlYhvx1z+GJL5lq51U86zaSOCzdOtBLQ06bGvallQNqPVXAtIVo+0cjXEKAEJsVnw2c+O0hR2rlWnTU03N1qYoWauCAkq2IVGW6+OJPS54920rDvS4tPC7lfGyggG84o3Kz2gCVSSvhACNthwM1iTFO+SPK5mCf4YXQn2L7841hQZgMAXxGfIfkknR6EVbqbezL5BVD7DuSsYTyxLJ0oPVK5wacyo8pzxxYZCG2WnJSv7iC31WpNrmG/fKLi/3CDhSMVw555EVXWRdVkNKox8cf7cKtHDasnDMegK459F8ENsHscQvZDKruDOG+l0k+Cb+dreuPjJGN34h9LZ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+/y9cXmsUz3VIQGT9hx4pO+/XcNDsEXXs9imZXN+Dc=;
 b=Zjj97W6csBwp7XOKKobquZ/MYUBzR2z9wIH/iEcdLl6foCiZyhM7jQmkwInkXlT28ncs2Riqo4slSzkb8W4Jb+H7XQh4flRQl6FKHHk04o2txhfdBNxoKJ0ij82ahMK8KwKGQejyQwCF2Qn8ENafKoQZwv0bqJ1xOoSM5Y2KRFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB13706.jpnprd01.prod.outlook.com
 (2603:1096:405:1ed::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 02:24:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 02:24:17 +0000
Message-ID: <87seojyk6m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/12] ASoC: soc-pcm: makes dpcm_dapm_stream_event() void
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Feb 2025 02:24:17 +0000
X-ClientProxiedBy: TYAPR01CA0151.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB13706:EE_
X-MS-Office365-Filtering-Correlation-Id: 7513486a-d7fc-489d-f394-08dd4b0c59c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xobESGLDVrd7aIbEZcrasCLRqkd1bPkZx0FntH/Ui+4xY3i64EUDOOHs7noE?=
 =?us-ascii?Q?XNQliskqgspJ7+OSkSncNE7xLzHzLC8ie4Dq5rvIhyZ7lA6e61NwDjXI8nJT?=
 =?us-ascii?Q?WZVJK3coYYvpdyTYvsVd6JhV0h1BFZgYYUzi+3+pXZGktThZ3xIrhW6reGsy?=
 =?us-ascii?Q?1KaJw4zoYGLqMDnGkEFYzjn9p+peL/GDWnm2VqBf45rym/N7hQH0cDAOG1om?=
 =?us-ascii?Q?Dy/iYkJsc1CsW+3/USURF26Z263q9MPSxezRA0yBUmRCWuY882HDen7C6mqz?=
 =?us-ascii?Q?kHnhiYNCb6YlQGXpNQss8kumf9u2zdzIgWY8OxvYJb5ofYY1D3fEohfYPlb3?=
 =?us-ascii?Q?w8lQQ7Vb5nJ+LMm85b/ye0QjeRePAFQCDiMWWT599hE7UZJzCuyX6udLVwl4?=
 =?us-ascii?Q?JCXp/Ptagm1L8lUVjKLoXb5+9tcVe86cpSlyeGO1Nmax7mutK1Z+NrZwAdH7?=
 =?us-ascii?Q?9+aHL2+mFSveLF/MW4dIWXQc9bHNHf8YrKFO7788tsYgWFXwo89XAwvlyqv2?=
 =?us-ascii?Q?zPR/jB7f/VwjxSpHVygmS7iJUeng9nV/VmBMKvACwuAyL+2Svm2s9ekhpzeo?=
 =?us-ascii?Q?f08fGkKnCixufL+gRNpEgrEPsVcQu8fhocGoM7nQF0RgjEFic+B4ell/OHzB?=
 =?us-ascii?Q?9WuMp5K0GSPu3yLjGg7oQB4T6DNJEDVWl7b8nSoIOy1hryvoJQN33/OKHsHx?=
 =?us-ascii?Q?5DJo744eemEqjsYtzYxrEyNPvMmoqf5IFuk9ikX6mjXdQb3turzQSAkYexSB?=
 =?us-ascii?Q?47/hofsoqwZPP/qlu+d7d5zzsT96yjB7BxeVmwLGN3JBBiKTBQFakTLzyDvz?=
 =?us-ascii?Q?aToVJV8bLHEsMJ4I6AO2p56ttDXOSYcz1gT0UNZNishfW1WnudoL/B0Qbsj+?=
 =?us-ascii?Q?NnEjdW0fARdZ2TCOdV6NZ/IBVWj3cYGicr6shtfIgAt2w9UglkXn+N+6T9s4?=
 =?us-ascii?Q?WFK9xlZFBlUN+GOAWrji/FvAH4zUzDTuiZAE9lM136FziNvnU6M+EHmIhvYT?=
 =?us-ascii?Q?r1PLEHLIYxZvXAmQnfZWs3q8BSSYPW5O5vQ71lO5cbnxkoVUjce5Ymax/Pvs?=
 =?us-ascii?Q?xPjwqCaxpJKoIGruk+noOj6dAga24LIIixcCavoTmNcW87cbggr1IxvpHprc?=
 =?us-ascii?Q?gSvf8Mzn/gT45Q2oXs7b2frzSL0cLC9cnInaTXdtHdFWtUvG1HSAPyKiJbhD?=
 =?us-ascii?Q?bKbN/H4/b+O0ipPZrFjbZMuGOGyHPP4TsMylFBP75iCsAW63MkL+XOz1Q1e0?=
 =?us-ascii?Q?nerUfTNiwp8g1bxzfLYgFxTCzseGUxDmGZYlBoIiuneSuP3tVfILxrMQ6tWw?=
 =?us-ascii?Q?L1876iYeabK0xBgGH2AcU7H6ZgwV5d3QAJpxUKA0jEptoWRmqUVKzPLFbfMz?=
 =?us-ascii?Q?wfJNsjR0zLDNdFWWhnxyXXDLlTZt2gzU1kIOjaNW9Exqv5q9atKDz4aBRIlQ?=
 =?us-ascii?Q?tFXifoLR5DBocd/5M0AMggAfdCnDHCls?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5KtdU181Q/YQcZLm+Swl7reqMUtLTp+rrN3PqYeK2EYCx3KVJVnKroRteJog?=
 =?us-ascii?Q?UYVSp3LeIwG6tUBNTVQxgQOJxIokDlAB8GWrQ6VQGWW2C9J7p/Y0hPzADWbL?=
 =?us-ascii?Q?92kJl8ZwXTSu3iPAPYqF332rDfrb3nF4x7BCxmB9lTJbN/LxA/QMYUjOCepV?=
 =?us-ascii?Q?bClTEMN9PrPt9aNlrJWKttw+tlAcA01Fj2X7re4TWWV80Qv+XJe84llej9+Q?=
 =?us-ascii?Q?SiLD5ngUCq5S1hsiB1R/ns0yrpipdvrK5ij5X7DR5cU03/BsC57QGcjNtDrQ?=
 =?us-ascii?Q?QMNBpi/0qGANUTIuVZNiGuEqctUjHp+hY2nyzDOS3Hhz8oZyz9SyqR5Y1B1t?=
 =?us-ascii?Q?tBMZRwVXTrxSl5zDrJlC8ExmggA2IkTF9EjjYaC7qVGy/S8HF6BhKB0xxpby?=
 =?us-ascii?Q?HmXXNgHDZo0Pbmy9Dp+1lLEzAuVqx+761/mKeLt/EdwmgbcdLyffiRR/qibS?=
 =?us-ascii?Q?H9s0YdQdNf/n+8Q6EpTJMsHK0ZPXfgIQs2x2gp26kloIZOBh3VctejNHXbS0?=
 =?us-ascii?Q?52FhkXKtQyimLd76bcwEZXw1v6QfS/RIWq3qmY1mV9+AGnulsNEZ2cKErabg?=
 =?us-ascii?Q?V0CW8Cx4I4XJMyJN1RmNOo7pboxG+qAtB0LzcOuKKrbOobTFW6ot6YVNKODS?=
 =?us-ascii?Q?npQ95wGGbXATQ+c+dBfQUfKjwD/hRc2JmvdbkSM+tq9rIRC7ocY4wkmJl1Gy?=
 =?us-ascii?Q?mdnlq9/s+I9/9/vk4/kShBtwdHSB19QgMvNROpbEkQt6D/x9/0xuYcckWQAY?=
 =?us-ascii?Q?g3zEfW4Da2OzTQPBgdR6IxSmWy7ivPpvo2WwXlkQjTAyQhyu6k8r6UJdHsbu?=
 =?us-ascii?Q?mleosnpbpEGP9z3kXtfNFjT82jdz7WscEgWaKy/1e2zV43t9iNGolPCz5jJO?=
 =?us-ascii?Q?lyTz9+7i/rE7L0zWwMMGalLk+6fql3J2YTTSCXEbLkIn9qUURYKvgeOp2xml?=
 =?us-ascii?Q?hpNbuTympOofH4ttaAVrBWBZ1UWG5+ZB4WOAqauxmVJfdQ+USpCeWbqVUYWX?=
 =?us-ascii?Q?dpTRHGwD/Q4kQZsuSwvOuzJb3zPa2tbHcJDig0pm0o5zpzZQcTJPY2NL+fRs?=
 =?us-ascii?Q?6AEkwAtd3Q+P8A8qdSCBeqBj8HG1LMTa4pqP0cITifdsSqJXACYZeC2BW/Dv?=
 =?us-ascii?Q?S8BgHSED98z0Fn6aeMY8F3fWhkbpIPJ9ejap/QaneZLMihv5e1fdCv7Pbigs?=
 =?us-ascii?Q?BpnPj87ezJN59u19dO1SFsx3B/PIKOXGqVfTyss9MqXhrquJJmXpVGYxQ9Eu?=
 =?us-ascii?Q?VLH1bja4+NyWctQhiHTPtlHPmaz7DGFTUxnzrphlTIO2iO7/Umc+v9COQdBr?=
 =?us-ascii?Q?SYjpKYtb5xhUjZ+Ug21WqID/33cWcoZQCbKJrdlVVAPAng/ThoE+dHzrzyM9?=
 =?us-ascii?Q?wtM58zRk8uo4KEAEXQLNfMFxUzKRB6cFb+o5os/ry1UF6bAyKVb4xlapU+02?=
 =?us-ascii?Q?4JVvgWZBFem/Ztna0gOrxZ5YS3Z1cKfnqOEGrRZZ0HwUrVOWr1feDvsfr5jP?=
 =?us-ascii?Q?+99Vqu9rNItlh6rpVntYstqIW/LEoHjQWIFfkA6XS+7RLBci2irZpYOYB873?=
 =?us-ascii?Q?3xkzU8rJJj1eIX2T7P6GGMJq3ZmPAL1QhUl5PzgcLmxpowK5xFuqlsnuRG5t?=
 =?us-ascii?Q?+9tZzPl0KVTEGYJkZmGT9hI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7513486a-d7fc-489d-f394-08dd4b0c59c3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:24:17.5386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdNuTcYuaExNtfC2iqUFjCyjD5iR7SL0IjRYoUf+1qdJg+9aQelIJ+A3H+Hl8fvfKlU+Bq5FK4bfkO5KKAYqC9TAfTvHhsygxV0ZQWbixjtVzhImQy/1gii2zgFUInG/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13706

No one uses dpcm_dapm_stream_event() return value, and it always
return 0. Let's makes it void.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dpcm.h | 4 ++--
 sound/soc/soc-pcm.c      | 5 +----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index c6fb350b4b062..c1b88c3b78356 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -143,8 +143,8 @@ void dpcm_be_dai_hw_free(struct snd_soc_pcm_runtime *fe, int stream);
 int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int tream);
 int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream, int cmd);
 int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream);
-int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
-	int event);
+void dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir, int event);
+
 bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget, enum snd_soc_dapm_direction dir);
 int widget_in_list(struct snd_soc_dapm_widget_list *list,
 		   struct snd_soc_dapm_widget *widget);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 0d556d3505602..a206a25451f7c 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -400,8 +400,7 @@ bool snd_soc_runtime_ignore_pmdown_time(struct snd_soc_pcm_runtime *rtd)
 }
 
 /* DPCM stream event, send event to FE and all active BEs. */
-int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
-	int event)
+void dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir, int event)
 {
 	struct snd_soc_dpcm *dpcm;
 
@@ -422,8 +421,6 @@ int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
 	}
 
 	snd_soc_dapm_stream_event(fe, dir, event);
-
-	return 0;
 }
 
 static void soc_pcm_set_dai_params(struct snd_soc_dai *dai,
-- 
2.43.0

