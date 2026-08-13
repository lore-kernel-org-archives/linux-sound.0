Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11020096.outbound.protection.outlook.com [52.101.56.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A577947FB10;
	Thu, 13 Aug 2026 15:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633711; cv=fail; b=j4BZvxHP9mJHfUkUeyWtYgi5JTdTsy1leHEY/jbO2U9rNa2ii/D2NV5eQiYQBKGSgq3WvWpayGHqVpMF3f3ArPpY5SQ1B28FoNtnexqeh5x2Ce9ea51ZMKQ53MNKh4YzRhOUXR7MszJLbBi8+OIr1V33ziYN5XvdwGrK155q1cU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633711; c=relaxed/simple;
	bh=oDANRHmevvwMl+jWZ1HKk40czmM9pfyl85L7oO4dk8s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TPY0QXsHK/Q7xtkZQ04jZZE50lTrKrSm5cxmqociyyTEhADc0hTdKcs9sVd11RNZrE5ziipk7x3Df2Naf6tUAzKruEM2O3WMOKQ78w0oVyuegECGziy36ASx+EomMZ7n9k9p9566ZUoy5KWBW7Z+ZqWRkCek3ALpZNGO6P/YX4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=NPgcLjgC; arc=fail smtp.client-ip=52.101.56.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="NPgcLjgC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tubVC8bZFkMz/zpLl48pdwhZs3++CyC4QRBGg6DeUB/wQaie7MwiJYeMzqoktMD7rZXBoJj/8Q23l70kvp0J7LmzFxB4mLXWs7nxC+gA+5Y+KCvZ4h3xqhxfEzaLNzLynWggs/hox7y4Oe6dy7YmHIxv53pgItvkvnuQqC0aFHgxm7qajkbn4BscYN/dhSVT01p7fv/Lgd5l8ops7TT9vPDXBvp4Fp9KxbuvjjW3z3T17wSYGIwlbUzmFVL49oSfEDIpl/IAOj8qnxcXUpV1Wc08ERsR1zxaLH+Yy59nzPwPKfQPEdkmXS3k5MtunFhecm74pHlilhB8oTkA8S0zoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQVVP+n8aCzmanD/wuYIDWDqkw2eGDd0Hd6yHpH5pcw=;
 b=Azq5aE/Nna93ImrLT1Px7q1DpKUsDJVvwI5ghEUw76XNn7ynAkIzMfnQjWB6uJMqJzF+n5j0XEdCeLq0XbmfseOl/GWZ3Q+k8vUb8HS3MwL4eUbU8jvJErIotC5T05F9KTP5Kmu5TnrS1y502iaLvtc3MLS1qhZxa87sfxfVRnBoTHLJRbo2Pl837da1XP/ef/wn3yBngLnTysfS7E71EIhOk+U8QbDm6pY7238iGFZP+5lkrBLvBpVqdzhIEApxcpIPqp46CDX5C2+rTsam2CX+vwpIFyHUqXsarSq9kCaNbKBdnxql6g9J+mTTl1IN36z0sqnDARQzKCo1d5xo1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQVVP+n8aCzmanD/wuYIDWDqkw2eGDd0Hd6yHpH5pcw=;
 b=NPgcLjgCJ18AFEz+9iggSQjcvCPosUwVmRde8rV/yQYj19juhNlheFy8fqFENQNdigSZc0vlrQcXyt8obdwznBpmLEivhOJXVhwVT94agfByU0aCeNVOfzNBRjbqy0+AA23UmRINqNDZQpR2tTYqvH69Zs2zpIn3uJmfLy4jxM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from BY1PR08MB10263.namprd08.prod.outlook.com
 (2603:10b6:a03:5ad::14) by BN0PR08MB6967.namprd08.prod.outlook.com
 (2603:10b6:408:116::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 15:08:24 +0000
Received: from BY1PR08MB10263.namprd08.prod.outlook.com
 ([fe80::399d:caec:5af7:cd51]) by BY1PR08MB10263.namprd08.prod.outlook.com
 ([fe80::399d:caec:5af7:cd51%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 15:08:24 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Zhang Cen <rollkingzzc@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: seq: midi: Serialize input teardown with event_input
Date: Thu, 13 Aug 2026 16:08:08 +0100
Message-ID: <20260813150810.795393-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::13) To BY1PR08MB10263.namprd08.prod.outlook.com
 (2603:10b6:a03:5ad::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR08MB10263:EE_|BN0PR08MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: 358f9351-abfc-4a35-3f04-08def94cb876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|4022899009|38350700014|6133799003|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	qWwRg0krdyee6BBaGtZ6lUNLPMpqHmaeBxIuxfdxr9t3tv6nDqxk/p9cmGIGGjbHssNqrZjFd3OFOcqZ5ovO2ddl8QVBcMQw4ye7TI/MSQRyoZI8AVkJQ6cr6hAjp9G93+CwsL8J8UKgX5Ce3vZ3vXkDnByAGo8R0PotTpGFt1R9q4x5sPKrz0O4qXx9zz3aMGOcA/+2MFwNgC9XhgD0IWoEnRdIO/msRfrMV1ATzktZ5CKxHa+OyoeTTAMgsDre7vkQu05ECIyTGCxNkXnE5W8wg07vtrvEqSDsIqMRtJEcmNdFKw085Utup2Xz/FStpOwfMkTcugpaeJq36V17Y+IJWOLjapZ2JZ9cpCYVToD3e3DgWDhrJ/9aggIC0wm1FvEAgn+YR8pt12yLpVeBhny75+yDw9iR6YQFA2qj904wYtU8R1rx4utXXGOV9CZqoKPrrqSE0llpW5ZlwlY3aAtp5tEOpSv9Qjg+b6bOEGqCAzsFFhv1ujayvcgqmA/rU1bNCeY7SEyfImMXRLjrInXbtUs6oa1kyoPrvRc00inH3+VMArHL/0MTbGDwyJAyr/4ATiLyBYDEFIhWEYhvffcdYHdouXm9TlJHm/ex5eoZV9oHj7HNzvq4Y4vGRnk5JxkRGWXMUPYidN+g6PJK732C/c4uk1HJ8S7xCymYjCw+4Ir5xgJAm7nPUpBp1Ejy5QlZFsaTM/xDC9hgJYuP8sOWgzabnxMeQPkkTvIjzn8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR08MB10263.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(4022899009)(38350700014)(6133799003)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6WE83rvTJOAKuPaGdnT63gk6AqeLvGVUoCoe6xbe020GlUR+8/XeWkmJNrso?=
 =?us-ascii?Q?k1Ly3eJ1FFHZPcwJ/b4tjgvEdcp3s8nPEDQPeJKVj+amXHm5RC9E+xhI+hb4?=
 =?us-ascii?Q?iPeoioyazlnX8QHpCIma/75mqAVXdEqX1fheUaqXcUyiuw9beGYo9MPF3Eeu?=
 =?us-ascii?Q?9Eq+esHOY0i8ol+y21RnrecsYu//XUZrjYWthBNDe8Tu7Ra5+Bm831WLJDyI?=
 =?us-ascii?Q?TJ9INLo1iqzJUxEjBJd4we9FaggbyWRNOctpBaInGBh7gmsk9lIGju08WERo?=
 =?us-ascii?Q?HB5Us+x7qIliqJxyqQALKC4zm3s777PhTBG8wjXtDiBVaPX5wpAl3nrRQwJo?=
 =?us-ascii?Q?cdFO4vwQ+bwPBpLBLwkEIqgWqkJ4m6ECoCujbMMtMWLjNxHGkb2QdDeL1kzb?=
 =?us-ascii?Q?TaPkcUL8sEuOk+s20IDtPXsQkh0NzykExQ12dabFJI5vORV0dIZyN6U2lFDY?=
 =?us-ascii?Q?8rE3LGEbz8w6292WTPXwI0bYewBCuYV6ilzOJY/Pvf77PMz/TF/EACoOEsN9?=
 =?us-ascii?Q?oTHkaKany6saTgHJzplF7tC/knHpC2Uwuhw0hpx+r+Ng7PdjYvrBWZXtyzQK?=
 =?us-ascii?Q?ttKtckAnJe1DQGBzNJJthyxM6icyD6gHTvt1p8c+FALEq7KGbXBqiUWrjUlH?=
 =?us-ascii?Q?W/khGGaGTuNBaGe/6Yup3M322OoxNBZw14J3cCagvJQTr1GyqDDZmqUHr7q0?=
 =?us-ascii?Q?1+UmVbbjxYG1h3YhR4kZ/eaCgY1x9WZi7J3a0w+Qq2sHcHK48X9azOhr1P55?=
 =?us-ascii?Q?YOxvS/P+tYougQ7eekMw1ndRaPIXa50+7HfOWhomrkT/TEJk3tfHobaBYWhO?=
 =?us-ascii?Q?5HXIAi4WxXUfVNl3YPAZKBPUP8lmt1EF7MUac9Pk8UWlTacNl68UqbNujry3?=
 =?us-ascii?Q?gaMsy0QPshtPrMSc4QqwUXien7SSAuLG4Oq0qGaSJKC8X08SWdXo0K8kAePU?=
 =?us-ascii?Q?kRFCsC5gChTQG7XWxiImIIhk12zuhfsEJ52f3CcvzLchKlcpmqAwhycTn9th?=
 =?us-ascii?Q?eMOd3LhR7Io3Z6nfN3Fy6LGA2mr6cluYZ6iTCE3GQbSrsDZOAE9/fbeZBt5X?=
 =?us-ascii?Q?72l8woV2ck5159izOzbIXOzbN5Ja7IBdBlTUFHU0WK2gXKL70y+arMDCjkvr?=
 =?us-ascii?Q?pg9O+19CS8PmjXk+Sb55V+B4U7E2RZ/w/TA6rEBPIEhNunUUjc7J/ruyIxk7?=
 =?us-ascii?Q?4gCwg+cJKjbg3dmmK+U/6KSafq/AhCuAMe7P+Msg2qIzqUbZ9x9JYi88xMDs?=
 =?us-ascii?Q?OTdoFPmr0PdtdxA0m3QJ3JKyW/PhIe8MfyhopNSig7Emaa1+EHuYENcQEjKk?=
 =?us-ascii?Q?lsLWitKOEIkuhCgvABoKYoagSmb5kr3raBuREMJccOyxkQDzzh3zR0xKnomi?=
 =?us-ascii?Q?QEolZuzbF3YBdWyx1CJ38GOyqWCSfnTh7+I+fMhczqzzRpdGXVNM//A4pRFN?=
 =?us-ascii?Q?vO08Y/HBgwiJqPLOrsmgzx8bxsH8gZKvlOph7jMCc/NS6WtN/92xZgt1A4iK?=
 =?us-ascii?Q?L9pusUNGMd9CQet4K6pDnqHSH0mELU/dzLH39rn8ImT0RdbTQ6XIQeteRKlx?=
 =?us-ascii?Q?P31AJx8i3obWD3+8GNuwuanuAkJzhmtcR0EeeOjq11y1QxfRC3LA9d7hG2/7?=
 =?us-ascii?Q?uYuOymNQUmGAH2KvjbUmmhzK52Om08w4rypgt+Ik+CCYt3hoaNRlyo/0qX5u?=
 =?us-ascii?Q?CPjJgFWlaDfszHVs16PxUmGsfYoZueO86e5ORPiix4YTgRSjQHjB4gKtcdGa?=
 =?us-ascii?Q?5KmjKf9nE0poTxDWHVCtHKM2bh498Uc=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358f9351-abfc-4a35-3f04-08def94cb876
X-MS-Exchange-CrossTenant-AuthSource: BY1PR08MB10263.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 15:08:24.2375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VL7kjzyUMEQJkDzPoV3d3JHEJ1BAARBsapyQNJBt6S8VSgvXk8o6D9jCnscUsekx6jkr/dEA546Boj3Tgc9ySzFBrXYIy5nDECm67oxV6wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB6967

snd_midi_input_event() must not be running while a rawmidi substream is
closing, since this can lead to the trigger state becoming out-of-step
through this sequence in snd_rawmidi_input_trigger():

	snd_rawmidi_input_trigger(up=0)
					snd_midi_input_event()
					 -> snd_rawmidi_kernel_read()
					     -> snd_rawmidi_input_trigger(up=1)
	  -> cancel_work_sync()

which ends with the underlying device being active unexpectedly.

When this is called from close_substream(), further input can re-trigger
the input event leaving it running after rawmidi_release_priv() has set
rfile->rmidi to NULL which leads to:

	Unable to handle kernel NULL pointer dereference at virtual address 00000000000000b0
	Call trace:
	 snd_midi_input_event+0x3c/0x134 [snd_seq_midi] (P)
	 snd_rawmidi_input_event_work+0x1c/0x2c
	 process_one_work+0x150/0x3a4
	 worker_thread+0x190/0x318

Apply a similar approach to commit ef7607ab1c8ad ("ALSA: seq: midi:
Serialize output teardown with event_input") which fixed the same issue
in the output direction, but updated to use RCU following Takashi Iwai's
proposed follow-on patch [1].

With this change in place, midisynth_unsubscribe() clears the input file
so snd_midi_input_event() will not re-trigger the stream and will be
quiesced by the cancel_work_sync() in snd_rawmidi_input_trigger().

[1] https://lore.kernel.org/linux-sound/20260813144224.753399-1-tiwai@suse.de/

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
Changes in v2:
- Switch to using RCU following Takashi's suggestion

 sound/core/seq/seq_midi.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
index 2eb12199c92f9..28a78c72a5315 100644
--- a/sound/core/seq/seq_midi.c
+++ b/sound/core/seq/seq_midi.c
@@ -42,6 +42,8 @@ struct seq_midisynth {
 	struct snd_rawmidi *rmidi;
 	int device;
 	int subdevice;
+	struct snd_rawmidi_substream __rcu *input_substream;
+	snd_use_lock_t input_use_lock;	/* in-flight event_input users */
 	struct snd_rawmidi_file input_rfile;
 	spinlock_t output_lock;		/* protects output_rfile publication */
 	snd_use_lock_t output_use_lock;	/* in-flight event_input users */
@@ -76,6 +78,14 @@ static void snd_midi_input_event(struct snd_rawmidi_substream *substream)
 	msynth = runtime->private_data;
 	if (msynth == NULL)
 		return;
+
+	scoped_guard(rcu) {
+		if (rcu_dereference(msynth->input_substream) != substream)
+			return;
+
+		snd_use_lock_use(&msynth->input_use_lock);
+	}
+
 	memset(&ev, 0, sizeof(ev));
 	while (runtime->avail > 0) {
 		res = snd_rawmidi_kernel_read(substream, buf, sizeof(buf));
@@ -95,6 +105,8 @@ static void snd_midi_input_event(struct snd_rawmidi_substream *substream)
 			memset(&ev, 0, sizeof(ev));
 		}
 	}
+
+	snd_use_lock_free(&msynth->input_use_lock);
 }
 
 static int dump_midi(struct snd_rawmidi_substream *substream, const char *buf, int count)
@@ -177,6 +189,7 @@ static int snd_seq_midisynth_new(struct seq_midisynth *msynth,
 	msynth->card = card;
 	msynth->device = device;
 	msynth->subdevice = subdevice;
+	snd_use_lock_init(&msynth->input_use_lock);
 	spin_lock_init(&msynth->output_lock);
 	snd_use_lock_init(&msynth->output_use_lock);
 	return 0;
@@ -188,28 +201,31 @@ static int midisynth_subscribe(void *private_data, struct snd_seq_port_subscribe
 	int err;
 	struct seq_midisynth *msynth = private_data;
 	struct snd_rawmidi_runtime *runtime;
+	struct snd_rawmidi_file rfile = {};
 	struct snd_rawmidi_params params;
 
 	/* open midi port */
 	err = snd_rawmidi_kernel_open(msynth->rmidi, msynth->subdevice,
 				      SNDRV_RAWMIDI_LFLG_INPUT,
-				      &msynth->input_rfile);
+				      &rfile);
 	if (err < 0) {
 		pr_debug("ALSA: seq_midi: midi input open failed!!!\n");
 		return err;
 	}
-	runtime = msynth->input_rfile.input->runtime;
+	runtime = rfile.input->runtime;
 	memset(&params, 0, sizeof(params));
 	params.avail_min = 1;
 	params.buffer_size = input_buffer_size;
-	err = snd_rawmidi_input_params(msynth->input_rfile.input, &params);
+	err = snd_rawmidi_input_params(rfile.input, &params);
 	if (err < 0) {
-		snd_rawmidi_kernel_release(&msynth->input_rfile);
+		snd_rawmidi_kernel_release(&rfile);
 		return err;
 	}
 	snd_midi_event_reset_encode(msynth->parser);
 	runtime->event = snd_midi_input_event;
 	runtime->private_data = msynth;
+	msynth->input_rfile = rfile;
+	rcu_assign_pointer(msynth->input_substream, rfile.input);
 	snd_rawmidi_kernel_read(msynth->input_rfile.input, NULL, 0);
 	return 0;
 }
@@ -219,10 +235,19 @@ static int midisynth_unsubscribe(void *private_data, struct snd_seq_port_subscri
 {
 	int err;
 	struct seq_midisynth *msynth = private_data;
+	struct snd_rawmidi_file rfile;
+
+	rcu_assign_pointer(msynth->input_substream, NULL);
+	synchronize_rcu();
+	snd_use_lock_sync(&msynth->input_use_lock);
 
-	if (snd_BUG_ON(!msynth->input_rfile.input))
+	rfile = msynth->input_rfile;
+	msynth->input_rfile = (struct snd_rawmidi_file){};
+
+	if (snd_BUG_ON(!rfile.input))
 		return -EINVAL;
-	err = snd_rawmidi_kernel_release(&msynth->input_rfile);
+
+	err = snd_rawmidi_kernel_release(&rfile);
 	return err;
 }
 
-- 
2.55.0

