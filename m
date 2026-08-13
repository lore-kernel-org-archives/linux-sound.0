Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11020105.outbound.protection.outlook.com [52.101.46.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C299647988A;
	Thu, 13 Aug 2026 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627909; cv=fail; b=KrbmucfrQXprqQYiqBvxWhyfkQLe0vgAVUxwnU/fXH0dAAyjQZfOj1tZ90ij+nbBH9QWvmzbOijjiFt6ZwldtBW4QY4Mu+jdh/yrg4uc1QuWVyb3ASBNlMKJTQQOFw+5dBAZHgC0dtZEWxXbEhq1tOFZylf8fhpBLElOqPq0+sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627909; c=relaxed/simple;
	bh=fUH0Ry+kMCVU0tO97zTOGtBtGAT1KNecJxAU4BJ1lJM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ad8Zpkhv1DhuUPGXdsNRq1hll7AMuj8Q5NK6Qoe09bXreTYNs2jHeDAXYnd2w16tLr4HT7w+TcPV+S+qOqGMQAdXfbQEcVUBSsj0otROEpOfbE7Y9/pB93GeAzf38UBTZbH0o9fX4JKp/XZOgcZ1EOmg+vETIjOKgqB0Y+IFQ/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=Rr0e09zt; arc=fail smtp.client-ip=52.101.46.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="Rr0e09zt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6BYCoPJ3Hn34z01ydMwQIMUayX8JKflic8EP3yRBJg2cirTof/TKRRrOeVAAVgeJh1scNtTVMR4m9Y92+RsBTuGEMBlgZ28UyTeUyH5EQ1GZnW8sJPmv/EcPnWaoW+i2DVUm9Lmq4IplVEmuad8WoN0mV/cKCrVWkRZ5N+JWv1dfR9iisZjR8VyL81XA5zOkFTWvmdxmgEYdCZaVYDOfXLbVl8Al802fWkH0xgCDNaYgtDQnkzrZKVOfCiCgIrWHL1H72KhRxkb0w5swBx2zBZVL9De/xZwwghGlecaAmqUdGVTuoD/ACIItdCIZ0m7kKiis7Pa+JW8oornDTfBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OZpjYynXtwELlQnKddbeg4FGuksAjNFrpBymy855Oc=;
 b=haJeSE7Z5J10vJnF8V9N0Kh+Mw9g6kGNqjHAL6Fzx2J9pFBIoABvAuE0dDlQ8/B4wfUQ+ANfh4w8noZGbfM+yiuc0bDPcOj3/mRiKuB6NbBJsj4YD2k/iWGHstvQrnF6fhHfB2QieVwJaGjZeGhtODG6VjsH6w8UBIgJAya6uKg0Txprh4x8ENrTSFJWqD6P3E6J3dE8tMRYZYrkUDe/Qa+QEvUeKbRC6EP0D/LEg1dE6DPGIYUHjS7gIOV39ibWgQqnLZVBeyueVEBFwTD9phJJ5ALbmfRDERdPFGNH2WkP/KGnN9I6AdRLkld8Hedv3H/FHzbvJa2l1XH5MXfHEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OZpjYynXtwELlQnKddbeg4FGuksAjNFrpBymy855Oc=;
 b=Rr0e09ztFFchS9wOUCYQak49RrwM+cTkSIHLBWom1W1nMrgPiHaX8FQl5PMSyyUCAVsGKnt8A7bXvSScg1jOilbHURmYEHP1HX9rrBbZZdYVntYWrCPVxTshwow81gCyziRjkHQRhtaZGAMvqRX41X8Prsw3AKguTMJt6zLI6j4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from BY1PR08MB10263.namprd08.prod.outlook.com
 (2603:10b6:a03:5ad::14) by MWHPR08MB10303.namprd08.prod.outlook.com
 (2603:10b6:303:282::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 13:31:42 +0000
Received: from BY1PR08MB10263.namprd08.prod.outlook.com
 ([fe80::399d:caec:5af7:cd51]) by BY1PR08MB10263.namprd08.prod.outlook.com
 ([fe80::399d:caec:5af7:cd51%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 13:31:42 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: linux-sound@vger.kernel.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	Zhang Cen <rollkingzzc@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: seq: midi: Serialize input teardown with event_input
Date: Thu, 13 Aug 2026 14:31:27 +0100
Message-ID: <20260813133130.726703-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0622.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::7) To BY1PR08MB10263.namprd08.prod.outlook.com
 (2603:10b6:a03:5ad::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR08MB10263:EE_|MWHPR08MB10303:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be77b55-6821-4dfc-9f2c-08def93f3632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|4022899009|366016|1800799024|23010399003|38350700014|6133799003|18002099003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	eiWyJvn+RIxC2BcsVXy+/yz/4dsUNeqXO3Sc6kZrp1bvbepB3L9ZPb9xRaR/poJJBOjotqeLeRnwcqZQmc4A+09cnLSG1W0HYWuuZZECI4GiYQxopLg92ilIloSxMFGV1O9r+pHwjCY4XP8PuE/IoDVSnkKav//1subRzPjVcMf114lfmm7s+Kwn6rPkaniIDDveYSF99rxaMQGL7y6LvGX0wuYuIwfz0ZvOqZ8GjLcg3qVAUtf/7YRdVNenPQ9nNqo49OQ4SZQ11GffgynQ0PQ4r5Ukc+33maSJ8QEOgxxTThpW2z43EroV/o4QFkhiGOm9p7FIE2kP2lrVmwuBj4W4vpK9myNO9TvfW6lu9RIqmwq8fx2XJCdHI967h6vXhi7ZXkdorgAMT41arZMRRdNsB2vbtzEgycpTe+bcVqrLtkeeIeBWPHqWUmPmQF+THbTun60sQwAhPzflcVXtNYtuae+f2R8jsT8ShAyC73w3D5tibnnBG2YOBlRhFJGRQn4Emaqg4DMeJuYf4kTKR1CzpuqkmufhtNjKXtIrY97FM8MNVl1P76yrIMtTDVLl0BCwPWy5WWM+Y9dRcoZ+bueYUzSDH/vqFjeihnbR0C/qOr0yMbmPG4vEYhuLIJIib4wWVBiZCkUFUGQfUkYlUfNIx1LXgio7yz5X57MnywaDqdeRX9POeyycYANw6oTLub58eDnZ4Mg2jo+Vni8a493COBUDwZoEWEUFmCu/hJs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR08MB10263.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(4022899009)(366016)(1800799024)(23010399003)(38350700014)(6133799003)(18002099003)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UFRcyrv7Q+MtQaTaOeeiQACeytjf3weJJrrRWoeT8jAOeZ7FhKDAbgqtW+nx?=
 =?us-ascii?Q?DuMJFxndcuNfGEL0VY7DP0Df8RayPnXtEQEYExDGX80gsAlBRO8vN0QZ7ENW?=
 =?us-ascii?Q?FNRMlmbDHUU+HU8Nzp7VK65pKHyCTY1WSDqEmZhfJitwWJ6vxXD7JLdpI4TW?=
 =?us-ascii?Q?J6jjKRNgH08cODUSJFry65G3o0yxA/HH7xMJMiB+C6k/eUChFw88Skjqjv0i?=
 =?us-ascii?Q?45u/AXZbD1ShQkedUJbFuwWp9+uqHPRHxW86nsN607OImKI6ffcMQ5TPXiBX?=
 =?us-ascii?Q?RYfnDLKMjWxw0yt/GTR7ObqGOHY9ruT0UpKDzWcNgqr2idJ4hy8qYUOdvvBe?=
 =?us-ascii?Q?VFMzSgUpD+mxIzMJnZvTlzcZyWni76Pu6UxgHGhLcPx8gkkcvbTFpf/KCo/z?=
 =?us-ascii?Q?ZWLk5tKC4Em3sBGVTK4j2j6hx/eTWxzgOO2YjAL0PdIh2xFFfGMfUXDI/dwI?=
 =?us-ascii?Q?AsmOU40GqT6iSc5Ez+bT4eOCYD4d0YR4rl4xF080J9x0MSSUiI5uaNsl751h?=
 =?us-ascii?Q?coQVB+GDShUX9H+nnShu00pd9c9J2+jRpKTMaNGCAvZ4KIft6FK85WkMYxqn?=
 =?us-ascii?Q?Ya8sx7KZhmO40bXk9np3S89Ow3HDyc0yYnPz9Nc8sVzyohGN6LSiLwWd2fLm?=
 =?us-ascii?Q?LmJEVFI57HBeJLtWNnCdNQE7nc7dFUjDzrolBk1/ykW7ED2qstVNrXMPh/im?=
 =?us-ascii?Q?NYfBMAPU43mVxXLXwZWm4exGPsG3s21OrQ64HxHgg8JnwJT321us55gljl/6?=
 =?us-ascii?Q?mxbR/m8CprKbAlr+wVnMUqz4XmCHcMg6FpeXg6biD1PqkftFEXjirroeaPWB?=
 =?us-ascii?Q?X4BO2xorJ8uF5DEPmjoCJpchw8p6Pv1h1XOhR6MhQDm1RT6B8a+c22m8SZ12?=
 =?us-ascii?Q?RhU64KCN5CTZyShRoHOHJwcYDf34bjOZ46xvuriQDwCza7oHQL1usk1hTLN8?=
 =?us-ascii?Q?i/pPbTEA84hopy4t7Es1221Wcqn8hGXWb8Ze1LX1PYy7RbrsbPOsHxP616KZ?=
 =?us-ascii?Q?E3AT3MIwJ8aUWujjlt1B5sgw2v7/qbxyNL0QgXUnXs/yaDQIuVuHR9j0vMKV?=
 =?us-ascii?Q?acF1VM+P/+WD4Z0CpE4YFblRduC5BmsSP66w2k5H9jwuQi2zXvO47VncKGMq?=
 =?us-ascii?Q?FJRKr2zaJYbUH+HHn3pwar7v0xuigBKLqQYunssOd5sy0pMi4A1YXYR/Lbeh?=
 =?us-ascii?Q?rETybT6G/WrDtyKxRIa9lBXRVx/+qIiHMysf9fx+0pdLEzgUl77qDa+oVm2o?=
 =?us-ascii?Q?1Y90gHlGS1sK2OPXW8MKPM8WZvn4zUeFragpv9kdMvNe6IRRDSDiOlH39NE3?=
 =?us-ascii?Q?Er2LBCVab+rUq0pLLdQVmjc761PF/9k2Za+BaiT6WYauQsQehNbF9/uK4hyt?=
 =?us-ascii?Q?+PixCTVu/aUho6+DvedTdi8KGJUaZu2cavZJZYJQPiSoZulN3DAZbaWUJ4Pk?=
 =?us-ascii?Q?HO2K1LMksl0Gawbs7Q84k8w4R6j3DYpIw40wS2v1I4jhCqL6/uRlAi5mRwsR?=
 =?us-ascii?Q?hWrTa/H40vP9yhRJM0XTCfpqjY94sBFZZ8A79cd+KDHemqKh8KD7TQgG7mms?=
 =?us-ascii?Q?S4N1JskC1Q3iNYix8aqkEBaaem9JtARqR7I7mcsvm0YqMiy0+7xFAAMpTENm?=
 =?us-ascii?Q?sPfTe56MCfegz7dWUI/zrqEQM4cg/gWMFOIB/gEktlQfMIqJIeeDVj30o341?=
 =?us-ascii?Q?SkxWCldWJXvwPB8UiQR/fIlKguzq+3u2O+20d8L8kpUax2eLSN6TGKCCEZzo?=
 =?us-ascii?Q?/K6pXS6VveIP8NxDd/ut6fnCbDnS2pw=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be77b55-6821-4dfc-9f2c-08def93f3632
X-MS-Exchange-CrossTenant-AuthSource: BY1PR08MB10263.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 13:31:42.2704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4C6zoM4BjWZ3BTHgWt052vZk9pAbw7CcCbuWm41lE8qcq5vdl6r1ANVYZZ57XqlLHNI/5zU7qdyXghH22sF/WMI5lOgVCpVTj8P7WF4dr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR08MB10303

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

Apply the same approach as commit ef7607ab1c8ad ("ALSA: seq: midi:
Serialize output teardown with event_input") which fixed the same issue
in the output direction.

With this change in place, midisynth_unsubscribe() clears the input file
so snd_midi_input_event() will not re-trigger the stream and will be
quiesced by the cancel_work_sync() in snd_rawmidi_input_trigger().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 sound/core/seq/seq_midi.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
index 2eb12199c92f9..c09c5961a3648 100644
--- a/sound/core/seq/seq_midi.c
+++ b/sound/core/seq/seq_midi.c
@@ -42,6 +42,8 @@ struct seq_midisynth {
 	struct snd_rawmidi *rmidi;
 	int device;
 	int subdevice;
+	spinlock_t input_lock;		/* protects input_rfile publication */
+	snd_use_lock_t input_use_lock;	/* in-flight event_input users */
 	struct snd_rawmidi_file input_rfile;
 	spinlock_t output_lock;		/* protects output_rfile publication */
 	snd_use_lock_t output_use_lock;	/* in-flight event_input users */
@@ -76,6 +78,14 @@ static void snd_midi_input_event(struct snd_rawmidi_substream *substream)
 	msynth = runtime->private_data;
 	if (msynth == NULL)
 		return;
+
+	scoped_guard(spinlock_irqsave, &msynth->input_lock) {
+		if (msynth->input_rfile.input != substream)
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
@@ -177,6 +189,8 @@ static int snd_seq_midisynth_new(struct seq_midisynth *msynth,
 	msynth->card = card;
 	msynth->device = device;
 	msynth->subdevice = subdevice;
+	spin_lock_init(&msynth->input_lock);
+	snd_use_lock_init(&msynth->input_use_lock);
 	spin_lock_init(&msynth->output_lock);
 	snd_use_lock_init(&msynth->output_use_lock);
 	return 0;
@@ -188,28 +202,31 @@ static int midisynth_subscribe(void *private_data, struct snd_seq_port_subscribe
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
+	scoped_guard(spinlock_irqsave, &msynth->input_lock)
+		msynth->input_rfile = rfile;
 	snd_rawmidi_kernel_read(msynth->input_rfile.input, NULL, 0);
 	return 0;
 }
@@ -219,10 +236,18 @@ static int midisynth_unsubscribe(void *private_data, struct snd_seq_port_subscri
 {
 	int err;
 	struct seq_midisynth *msynth = private_data;
+	struct snd_rawmidi_file rfile = {};
 
-	if (snd_BUG_ON(!msynth->input_rfile.input))
+	scoped_guard(spinlock_irqsave, &msynth->input_lock) {
+		rfile = msynth->input_rfile;
+		msynth->input_rfile = (struct snd_rawmidi_file){};
+	}
+
+	if (snd_BUG_ON(!rfile.input))
 		return -EINVAL;
-	err = snd_rawmidi_kernel_release(&msynth->input_rfile);
+
+	snd_use_lock_sync(&msynth->input_use_lock);
+	err = snd_rawmidi_kernel_release(&rfile);
 	return err;
 }
 
-- 
2.55.0

