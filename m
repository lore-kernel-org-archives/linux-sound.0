Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369EB4EDCCD
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 19:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005869; cv=none; b=IP+8rCVaFvAdkzJqs8NkG1e86j9tfHA24k3m1+Rau6qhRIhyxaJASaIA3ZGieySoCAwjCyCYAecoPgmY/v70bwJt1shdMPQemQ9Nd3ESuRHiiqgFSX8+wwrpRrdRN2GKuT8wDcODahNUCp2bT+avA3ydnpZBqKs+8TpbMAM6hQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005869; c=relaxed/simple;
	bh=2E42lORvf/FB6Zjh67A7LA5R+siHl55Im0ft0ES1CO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gkr+ODBhQ1iPi8T5tciY6Ummwnt8Vzsyn44PQvHLuQJFLzmC74uMX9b4HBD5c2yjpSAFdOAey/Ah4R7SbvTGNFovv5enhr9C7pATm6VM2+FZQs3af1b+J3xX7/1ZdpYrrcsti4a8C41uODHQ+ABsyu85USsF+HzZNrDoMI0/lEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=RE8JSakS; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="RE8JSakS"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15943c9c005so1716028c88.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 12:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792005865; x=1792610665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4f9x3r8Zsz/31U4yCLSrw73yUxuAtfeQ9cTPu3hqEsA=;
        b=RE8JSakSETXkv6gYqHRl5W4C+xfp814OFUba4ETKHls6fps0j/jiVw4xfP0+jOjgUp
         GWzmLA7ietB9SAiIgAQ6KHCRa3SoRRBiI3wfSjTC5uY6jxFP7q7T9FjnttX73CTTd86x
         QHPZAniKrqsPKUQ6avFujRGGs+LCOVf+5oJrZACRiiC7d1luqs4A9i9zA64EERVHGLFx
         ljivIIIpffgjcJsS+vUv8skbQzrg+X5Fmb6TZo7y76rJZ8BPDfJa8HbuNBfrUxzj64QH
         H3RbjHMXvXx4N0oLezqj06pXGPksDzBwjiDJZQpB+0GsZMbOmRLQL/Jn8uDIwTQwUdEg
         wpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005865; x=1792610665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4f9x3r8Zsz/31U4yCLSrw73yUxuAtfeQ9cTPu3hqEsA=;
        b=iowkYnJJ/Znp48IlI9zYSnOHc1Kg/Co3uUST254ApKCMc1vGmAKSh4dUDO9pgYpHf3
         X3MUuYvYJM9dDN4hUmeJ48uHbeoc3NzQQpOOzX+YYjNo5wMztSwicqZtdB7d6MNClciv
         AdQe1YLURwu3lJXyqLee5TYwXwMJeaIm54uKRlH8ElT2oIx3mH4bh3mLG77fyIW6lPy7
         emi2t9JYCB0/QsLq/oj+d5ejLm9PEyK/+LA+JglCeeeXSgOlWWjNiK0iugkVD0eGbI3V
         9nBUNcprHJJ8UdXn5D0ls3VIYKLawFj9wQZ/sOdWIMxagZomyMWIJpno6/eMxjondXtP
         8m4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzfyfCDliQfI9kwHdwAjZeVCXpqPM5rlwaS/9sIVATiH1n1gU19zioNt/bKpI/D6lN92DKkkhLRP+zSbg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIfvivRASYnQQ3sj67yNNstbrSUP5MPNjciZr1jlPFovRmRH7hu
	yYCKVMujWi1DSRdmuvqAjgV2t5UqX8gMZBeQ41gvUDUIBHkMol4vCCugXWXpJHxDqX8=
X-Gm-Gg: AYBFou22q2qodbSDkdvd5AB0sApzIjn/zJKOLXy0T62xg6pkjBMos9k2nsAoFT4Cu17
	lDBwz31rjwc9tO+QByMEvd2VB2aej92yDRbpOC6vh9+KYqbxkCfXEkTEE5O5dVm1wfajvSH4i/0
	QnCIexE0g6uBrAyBFHvfbO8eZ3vgh0O+uVBGyTE7wlsZdLYq4bTsFsIv5zrG7n0WqOb6UrYeuUM
	8aeJD+82q1fwYKABnC0Ubw7wDiapptXWoQB9nAAE/N4ws4DbQPjxXqM5Rh58+mV3UJNAQDFf5JM
	1liYefvG/VLiH+NzyXKfLUWDxY4ywvK0HsqhW7ZLLemm4X/TgtiHsPlTrt6QgXkvQQOwOOyE6Z8
	fwvyyOfDeAw9l+9F7voCGzzHt5oPRWpujrI8ydT0rpihFTfcnqdhbKnhm7jQG6QjjDOwha0+1Zu
	abbvibssAB1oCO8AT3g1n19GtsVMLekZKRLZKRsYsllcX5nqVAk9VsQwni4yh9oRpWkEY2pL04T
	h35NnEVWdOS8tADHjZwvFRpN80v6625P3u+oa8+nLJvU4h8JLwsizNPUdj7iPo2wG54y5E=
X-Received: by 2002:a05:701b:2059:10b0:180:2b3d:57b4 with SMTP id a92af1059eb24-1802b3d5801mr256680c88.33.1792005864807;
        Wed, 14 Oct 2026 12:24:24 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm12350251c88.6.2026.10.14.12.24.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:24:24 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH 6.6.y] ALSA: mixer: oss: Add card disconnect checkpoints
Date: Wed, 14 Oct 2026 15:24:20 -0400
Message-ID: <20261014192420.24397-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 084d5d44418148662365eced3e126ad1a81ee3e2 ]

ALSA OSS mixer layer calls the kcontrol ops rather individually, and
pending calls might be not always caught at disconnecting the device.

For avoiding the potential UAF scenarios, add sanity checks of the
card disconnection at each entry point of OSS mixer accesses.  The
rwsem is taken just before that check, hence the rest context should
be covered by that properly.

Link: https://patch.msgid.link/20260209121212.171430-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Assisted-by: LLM
[ Backport to 6.6.y: Replace upstream scoped controls_rwsem release with
  explicit unlocks or existing unlock labels on the added shutdown exits.
  ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-43126 to 6.6.y.

The code changes are identical to upstream, except explicit controls_rwsem
unlocks replace upstream scoped cleanup; see the bracketed backport note
above.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: x86_64 objects
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 sound/core/oss/mixer_oss.c |   32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index abc99ae3332824183298ce329916b1787841dd35..ecb4af6709598c92dde791570a9b9703c8b81d48 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -540,6 +540,10 @@ static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	down_read(&card->controls_rwsem);
+	if (card->shutdown) {
+		up_read(&card->controls_rwsem);
+		return;
+	}
 	kctl = snd_ctl_find_numid_locked(card, numid);
 	if (!kctl) {
 		up_read(&card->controls_rwsem);
@@ -579,6 +583,10 @@ static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	down_read(&card->controls_rwsem);
+	if (card->shutdown) {
+		up_read(&card->controls_rwsem);
+		return;
+	}
 	kctl = snd_ctl_find_numid_locked(card, numid);
 	if (!kctl) {
 		up_read(&card->controls_rwsem);
@@ -645,6 +653,10 @@ static void snd_mixer_oss_put_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	down_read(&card->controls_rwsem);
+	if (card->shutdown) {
+		up_read(&card->controls_rwsem);
+		return;
+	}
 	kctl = snd_ctl_find_numid_locked(card, numid);
 	if (!kctl) {
 		up_read(&card->controls_rwsem);
@@ -688,6 +700,10 @@ static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	down_read(&card->controls_rwsem);
+	if (card->shutdown) {
+		up_read(&card->controls_rwsem);
+		return;
+	}
 	kctl = snd_ctl_find_numid_locked(card, numid);
 	if (!kctl) {
 		up_read(&card->controls_rwsem);
@@ -833,6 +849,10 @@ static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 		goto __free_only;
 	}
 	down_read(&card->controls_rwsem);
+	if (card->shutdown) {
+		err = -ENODEV;
+		goto __unlock;
+	}
 	kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
 	if (! kctl) {
 		err = -ENOENT;
@@ -886,6 +906,10 @@ static int snd_mixer_oss_put_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 		goto __free_only;
 	}
 	down_read(&card->controls_rwsem);
+	if (card->shutdown) {
+		err = -ENODEV;
+		goto __unlock;
+	}
 	kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
 	if (! kctl) {
 		err = -ENOENT;
@@ -937,6 +961,10 @@ static int snd_mixer_oss_build_test(struct snd_mixer_oss *mixer, struct slot *sl
 	int err;
 
 	down_read(&card->controls_rwsem);
+	if (card->shutdown) {
+		up_read(&card->controls_rwsem);
+		return -ENODEV;
+	}
 	kcontrol = snd_mixer_oss_test_id(mixer, name, index);
 	if (kcontrol == NULL) {
 		up_read(&card->controls_rwsem);
@@ -1069,6 +1097,10 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 	if (snd_mixer_oss_build_test_all(mixer, ptr, &slot))
 		return 0;
 	down_read(&mixer->card->controls_rwsem);
+	if (mixer->card->shutdown) {
+		up_read(&mixer->card->controls_rwsem);
+		return -ENODEV;
+	}
 	kctl = NULL;
 	if (!ptr->index)
 		kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
