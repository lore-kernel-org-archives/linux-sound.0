Received: from smtp153-170.sina.com.cn (smtp153-170.sina.com.cn [61.135.153.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A762DECA0
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 03:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770175792; cv=none; b=LAwjX9gAKvHRzl89x/pDlEDvexS/2MtWoExKTsjJ5OEUaj5ad9JUkzjN+cYA1pG57x+ufp11caxfDbUFQNGq5Ed5efu2yU6A1Loy3b1f0Lo5v5SYG4NzThNRvPcn+IW6AWvzOcIT/ZmYAkvIAnScFoUwmv78xbFCWqsKPKRiv9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770175792; c=relaxed/simple;
	bh=F9Qt1wfFC7Ba3vJzr0Ym//4RmAZHMvJJqFwP0NYoq4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+aC1ZRJ+SRxTTv/FMysF+8/3dB053K+ZmRsz2fIym1p8Bkr1+3Q8blMBP3NFsNK0yde8MxX/RIHQ1cb88nKs4iC/OvAw4JU7igS0hsQ9SI2+cVsrsjTtvSKNKe8HaG2GAP1a1DgUA6WYELr+me8AY9JinNWswEqpaeyRO7wCIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=ScBssuTd; arc=none smtp.client-ip=61.135.153.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="ScBssuTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1770175785;
	bh=I6Ri0PlzddtPBlD3SkRYoP3ZNw44hg7FVwwnfdTVPIE=;
	h=From:Subject:Date:Message-ID;
	b=ScBssuTdItxNbjNWzPelmV5Wz9NMnqrQnSmku3hbRJst1nADOMB1w1pA0sXg03wC7
	 4QfPVH8UpT5RGFtjh4LACbXffrgQwNozmSrNRh/QO80C/QU48u8vtNXVUbT87aBUkm
	 MP2eej2o5M9QZD9+rg3jAAh09fGOKu8Xn8XLFtA4=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
	by sina.com (10.54.253.34) with ESMTP
	id 6982BD0000002116; Wed, 4 Feb 2026 11:29:06 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3888686292007
X-SMAIL-UIID: CA987CA45AFA48E2B9CF2172C72217C6-20260204-112906-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+5f8f3acdee1ec7a7ef7b@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com,
	stable@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [syzbot] [sound?] KASAN: slab-use-after-free Read in snd_pcm_stop
Date: Wed,  4 Feb 2026 11:28:55 +0800
Message-ID: <20260204032856.2561-1-hdanton@sina.com>
In-Reply-To: <69783ba1.050a0220.c9109.0011.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Mon, 26 Jan 2026 20:14:25 -0800
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    63804fed149a Linux 6.19-rc7
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=13bbb05a580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=151a39927f1e10b4
> dashboard link: https://syzkaller.appspot.com/bug?extid=5f8f3acdee1ec7a7ef7b
> compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13f7abfa580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11040322580000

#syz test

From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: aloop: Fix racy access at PCM trigger

The PCM trigger callback of aloop driver tries to check the PCM state
and stop the stream of the tied substream in the corresponding cable.
Since both check and stop operations are performed outside the cable
lock, this may result in UAF when a program attempts to trigger
frequently while opening/closing the tied stream, as spotted by
fuzzers.

For addressing the UAF, this patch changes two things:
- It covers the most of code in loopback_check_format() with
  cable->lock spinlock, and add the proper NULL checks.  This avoids
  already some racy accesses.
- In addition, now we try to check the state of the capture PCM stream
  that may be stopped in this function, which was the major pain point
  leading to UAF.

Reported-by: syzbot+5f8f3acdee1ec7a7ef7b@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/69783ba1.050a0220.c9109.0011.GAE@google.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 62 +++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 64ef03b2d579..aa0d2fcb1a18 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -336,37 +336,43 @@ static bool is_access_interleaved(snd_pcm_access_t access)
 
 static int loopback_check_format(struct loopback_cable *cable, int stream)
 {
+	struct loopback_pcm *dpcm_play, *dpcm_capt;
 	struct snd_pcm_runtime *runtime, *cruntime;
 	struct loopback_setup *setup;
 	struct snd_card *card;
+	bool stop_capture = false;
 	int check;
 
-	if (cable->valid != CABLE_VALID_BOTH) {
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-			goto __notify;
-		return 0;
-	}
-	runtime = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->
-							substream->runtime;
-	cruntime = cable->streams[SNDRV_PCM_STREAM_CAPTURE]->
-							substream->runtime;
-	check = runtime->format != cruntime->format ||
-		runtime->rate != cruntime->rate ||
-		runtime->channels != cruntime->channels ||
-		is_access_interleaved(runtime->access) !=
-		is_access_interleaved(cruntime->access);
-	if (!check)
-		return 0;
-	if (stream == SNDRV_PCM_STREAM_CAPTURE) {
-		return -EIO;
-	} else {
-		snd_pcm_stop(cable->streams[SNDRV_PCM_STREAM_CAPTURE]->
-					substream, SNDRV_PCM_STATE_DRAINING);
-	      __notify:
-		runtime = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->
-							substream->runtime;
-		setup = get_setup(cable->streams[SNDRV_PCM_STREAM_PLAYBACK]);
-		card = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->loopback->card;
+	scoped_guard(spinlock_irqsave, &cable->lock) {
+		dpcm_play = cable->streams[SNDRV_PCM_STREAM_PLAYBACK];
+		dpcm_capt = cable->streams[SNDRV_PCM_STREAM_CAPTURE];
+
+		if (cable->valid != CABLE_VALID_BOTH) {
+			if (stream == SNDRV_PCM_STREAM_CAPTURE || !dpcm_play)
+				return 0;
+		} else {
+			if (!dpcm_play || !dpcm_capt)
+				return -EIO;
+			runtime = dpcm_play->substream->runtime;
+			cruntime = dpcm_capt->substream->runtime;
+			if (!runtime || !cruntime)
+				return -EIO;
+			check = runtime->format != cruntime->format ||
+			runtime->rate != cruntime->rate ||
+			runtime->channels != cruntime->channels ||
+			is_access_interleaved(runtime->access) !=
+			is_access_interleaved(cruntime->access);
+			if (!check)
+				return 0;
+			if (stream == SNDRV_PCM_STREAM_CAPTURE)
+				return -EIO;
+			else if (cruntime->state == SNDRV_PCM_STATE_RUNNING)
+				stop_capture = true;
+		}
+
+		setup = get_setup(dpcm_play);
+		card = dpcm_play->loopback->card;
+		runtime = dpcm_play->substream->runtime;
 		if (setup->format != runtime->format) {
 			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 							&setup->format_id);
@@ -389,6 +395,10 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
 			setup->access = runtime->access;
 		}
 	}
+
+	if (stop_capture)
+		snd_pcm_stop(dpcm_capt->substream, SNDRV_PCM_STATE_DRAINING);
+
 	return 0;
 }
 
--
2.52.0
