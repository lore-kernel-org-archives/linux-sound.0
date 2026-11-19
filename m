Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795116149;
	b=IV4gXuFhM3F3uf7HyNs1avcl/w7OwqB5xau2i8EpbW1mDgK7HgNyEPf4zMDo2oWLsIlJ
	 i9CYUucBJGgmCfd7lM9g3Tx6qaWziEwUBsSgbF3YhijCb7U28ni1RSutMxM5l7oWkE5Ml
	 HdsIpwgKBpb0JtWCP1gV+D79og7VnMYQT7XYbe7/UMvkgRJKG9i1PxKir/sd6xlsoZ6kp
	 BMSb63UFFiRCm9fQaUxWAdqZqXd8jLZq5Ea2+PEG9nxKyAajEAbEjY1QAsThAKvyqHlNQ
	 Ken65sk7wC+br/ocLQD7K88c1MZlrTSIz1mdtNjyVGwyHrxHC9JTUToCDFsnmoclppQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116149;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=dEDm88GXRZouXR9Kh3NHzslEBF8LONV2DdDkpa7YFjo=;
	b=SwQuiDBboztwhkY5gaP0V/9d8aHjG7cPpvCup/bs4ET4jNeU3X00DgAFS3dDkZs/Oszn
	 GTXHuH/EX4zPCWfWFxQMWO4XagFzM+HsWzm/WU3idSgzjOAQaqm3BrYVnAJqhgq77dRIC
	 sCGpq1HVu1f5anO/sCBwEI/VM0g4FYq2oLXjo60+jF4jDAJD5POQESxKvLg1SKQRwRvQj
	 PFU3D7zujTcu0tzaXoDfFBQFML+27HAPPaE/HhvJd8TZfpkSh8Ry01pyORZvhZpsLhqzR
	 BOrfyQD+Ufa5hOU7qTnQg1i3kxcAdz8IPeYkA/uxhhEGNMKRmPbW62EY1Hqe/yqNpyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkYi5FX4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7FD606A332;
	Thu, 19 Nov 2026 19:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkYi5FX4
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795116149;
	b=HRcM6tB4/S2kT0HgusjVzFeaDjfZXZl+141AcooKqGDvXWg4F/8NMqFCB256+EaEYqy4
	 UbV+gFtaqv+7HbZXcaMsGAS23z18ZFon2ozw8f190GIj5Mqe/AewSLnhL5+FPaliW9LtL
	 2sdMOxq0sfWrevTCwg4J6Ary+L8+K9D9yKpb2e9PqeIw5X9XNnXeweIsQpPCOPab71QkY
	 CQvBa1jzotqUmWAObtfp5BD1eq+cBFBy5AUUq+rPFPe3GV+4TwaFIMmY8DRATbR1SBioK
	 NqKO8xGTfLgAaoR2iN7B8EDKxehllkq6Jo0pHEI25vKvRAS6MLG40jcIAA6C7AAg9eg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795116149;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=dEDm88GXRZouXR9Kh3NHzslEBF8LONV2DdDkpa7YFjo=;
	b=cr7FD1RXgT4ie9rk3kMwpx1j+LVYmb15xscqzmxJIuiZlMKKBlBd2h+O3sGiUIJ1DVLI
	 FE+DfWmtFoxZwqfE/XemNzgFT5GrYYYVl/I68i+Sogu60mRjpMTStGl1XKP16v1g9whoh
	 Q0GjvQWnVyKsDppUF9rtAFqrri94/46n4cM1AmhoDccLTPpW3OH8tsGewN87flNa72+Zl
	 HgzAYa+J3p1yHlEr8J/G/VyLDNIe4LxyrDMmJP22BoNWCkRPNk8a0NsJEhCl+VQe+mu2V
	 E9RyGZvJVHPanP8uGzWSVdOAtqxVk/NI2l3ppaaeGhdMPtgYT3lDFWMC+wCFOuf+a8Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 683661F000CB;
	Thu, 19 Nov 2026 19:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795116149;
	bh=dEDm88GXRZouXR9Kh3NHzslEBF8LONV2DdDkpa7YFjo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=lkYi5FX4QnS7dBbhZ49p/4QeXS6zkfG7STspij+ucepSkYwGOBdak2iyPjQ5eIrMm
	 cz5DeGy+pp+UTNcHI18uaZ82X/NrRjfzOfkZL7ero+r8TnMaxc0zSN1deDy4d/mtji
	 /cjPCTheJROJGzIaexXE4N920X4hbXj5d4omDWByoLGAPECwuZqJBh03joLMa7ohYY
	 riAbt5Dw6T94kpgy331Yrc+QL388nQ0dfQyNOa7ZAnUfgc6iJ5wfEGYgTx2S/kQsK/
	 /az/Ddrky+krNjuopNR40+A8Kedyfo2tgTUVvNIq/Gn7DytMuyx53DXWj35B6Nr9GE
	 Ne2Hlg0gIPt9g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BFB884B3F3;
	Thu, 19 Nov 2026 19:22:27 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 19:22:27 +0000
Subject: [PATCH] ASoC: soc-pcm: Track BE pause per FE-BE link
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-asoc-dpcm-pause-link-v1-1-5b97347b5771@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHJM/2oC/yXMQQ6CMBBA0auQWTtJy6JYr2JclGHQUShNBwgJ4
 e5UXb7F/zsoZ2GFW7VD5lVUplhgLxXQK8Qno3TFUJvaWWs9Bp0Iu0QjprAo4yDxgz0Z471rGr4
 6KGnK3Mv2294ff+vSvpnm7wuO4wQ3U+OfeAAAAA==
X-Change-ID: 20261119-asoc-dpcm-pause-link-fc0099677e86
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 ranjani.sridharan@linux.intel.com, tiwai@suse.com, perex@perex.cz, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795116146; l=8746;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=4C650DEg2dJcUQXRO0XqGJGwNuJChmHAgof5km+wyL4=;
 b=yZaAU6IjISW/kzA1PSfK1RYPX/RodjpeACTUg/mMBrEeJVjBpz9MOM2EUu3l7V9B41HG3XCqL
 cys3fHgoH5hCG5kuzJLq9sVTKks4ukbfV/HJ6GnXZ0YajwPh1WVrFGu
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

Commit 9995c1d096c8 ("ASoC: soc-pcm: improve BE transition for
PAUSE_RELEASE") counts paused FEs in be_pause and remembers in
fe->dpcm[stream].fe_pause that a FE is paused. But fe_pause is one
flag for the FE, while the pause it records is counted in each of its
BEs separately, and nothing tells which BEs hold this FE's pause. The
counts go wrong when a BE trigger fails or a FE has several BEs:

 - When the BE PAUSE_RELEASE fails, fe_pause and be_pause are left
   updated. The BE is still PAUSED, so the PAUSE_PUSH the PCM core
   sends to undo the release skips it. After a retried release
   be_pause is -1, and the next STOP sends PAUSE_PUSH to the BE instead
   of STOP.

 - When the BE PAUSE_PUSH fails, the PCM core undoes it with
   PAUSE_RELEASE, which increments be_start although this FE never
   left it. be_start ends up at 2 and STOP never stops the BE.

 - When the release of one BE fails, the PAUSE_PUSH undo is also
   applied to BEs that the release had not reached yet. For a BE shared
   with a running FE that pauses it under the other FE.

 - Compress offload can stop a paused stream directly. When two FEs
   share a BE and the paused one is stopped while the other is
   running, STOP takes the paused FE out of be_start a second time and
   stops the BE under the running FE.

Keep the pause in struct snd_soc_dpcm, which links one FE to one BE,
instead:

 - PAUSE_PUSH marks the link and skips a link that is already marked;
 - PAUSE_RELEASE only releases a marked link;
 - STOP drops the pause of a marked link instead of touching be_start;
 - a failed BE trigger rolls back just that link.

When a suspended stream that was previously paused is prepared or
closed without first being resumed, no PAUSE_RELEASE or STOP trigger
is sent for that stream. START therefore consumes any pause left on
its link, and closing the link drops any remaining pause under the
BE stream lock.

Found with a static analysis tool and checked by hand.

Fixes: 9995c1d096c8 ("ASoC: soc-pcm: improve BE transition for PAUSE_RELEASE")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested on arm with clang (sound/soc builds, W=1 clean for
soc-pcm.c); not run on hardware.

I checked the bookkeeping with a model of the START, PAUSE_PUSH,
PAUSE_RELEASE and STOP branches, BE prepare/startup/close, and the
callers (single-substream undo, retries of the failed linked-group
member, and compressed streams without automatic undo, including
compress STOP from PAUSED). The model runs 14
sequences; with this patch every one ends with the BEs stopped and
be_start/be_pause back at 0. These sequences send the same BE commands
as before: start/pause/release/stop, pause then stop, the shared-BE
sequence from 9995c1d096c8, pause + system suspend + prepare + start +
stop, and pause + system suspend + close + reopen + start + stop. It is
a model of the counters, not a test on a device.
---
 include/sound/soc-dpcm.h |  4 ++-
 sound/soc/soc-pcm.c      | 69 +++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 57 insertions(+), 16 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index af24665e37e8..801ad83abfe8 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -73,6 +73,9 @@ struct snd_soc_dpcm {
 	/* link state */
 	enum snd_soc_dpcm_link_state state;
 
+	/* FE paused this BE: counted in be_pause, not in be_start */
+	bool paused;
+
 	/* list of BE and FE for this DPCM link */
 	struct list_head list_be;
 	struct list_head list_fe;
@@ -100,7 +103,6 @@ struct snd_soc_dpcm_runtime {
 
 	int be_start; /* refcount protected by BE stream pcm lock */
 	int be_pause; /* refcount protected by BE stream pcm lock */
-	bool fe_pause; /* used to track STOP after PAUSE */
 };
 
 #define for_each_dpcm_fe(be, stream, _dpcm)				\
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ef8ccf52798e..cb8d23756b1e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1685,6 +1685,17 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
 		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
+		/*
+		 * A pause may survive until close, e.g. after system suspend.
+		 * Drop the pause this link still holds.
+		 */
+		if (dpcm->paused) {
+			snd_pcm_stream_lock_irq(be_substream);
+			dpcm->paused = false;
+			be->dpcm[stream].be_pause--;
+			snd_pcm_stream_unlock_irq(be_substream);
+		}
+
 		if (be->dpcm[stream].users == 0) {
 			dev_err(be->dev, "ASoC: no users %s at close - state %s\n",
 				snd_pcm_direction_name(stream),
@@ -2220,7 +2231,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			       int cmd)
 {
 	struct snd_soc_pcm_runtime *be;
-	bool pause_stop_transition;
+	bool was_paused;
 	struct snd_soc_dpcm *dpcm;
 	unsigned long flags;
 	int ret = 0;
@@ -2248,6 +2259,16 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				goto next;
 
+			/*
+			 * A stream suspended while paused and prepared again
+			 * starts without a PAUSE_RELEASE: drop its pause here.
+			 */
+			was_paused = dpcm->paused;
+			if (was_paused) {
+				dpcm->paused = false;
+				be->dpcm[stream].be_pause--;
+			}
+
 			be->dpcm[stream].be_start++;
 			if (be->dpcm[stream].be_start != 1)
 				goto next;
@@ -2260,6 +2281,10 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 						      SNDRV_PCM_TRIGGER_START);
 			if (ret) {
 				be->dpcm[stream].be_start--;
+				if (was_paused) {
+					dpcm->paused = true;
+					be->dpcm[stream].be_pause++;
+				}
 				goto next;
 			}
 
@@ -2287,7 +2312,11 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				goto next;
 
-			fe->dpcm[stream].fe_pause = false;
+			/* nothing to release if this FE didn't pause this BE */
+			if (!dpcm->paused)
+				goto next;
+
+			dpcm->paused = false;
 			be->dpcm[stream].be_pause--;
 
 			be->dpcm[stream].be_start++;
@@ -2297,6 +2326,8 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret) {
 				be->dpcm[stream].be_start--;
+				dpcm->paused = true;
+				be->dpcm[stream].be_pause++;
 				goto next;
 			}
 
@@ -2307,30 +2338,32 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				goto next;
 
-			if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_START)
+			/*
+			 * A paused FE left be_start when it paused and only
+			 * holds a pause on this BE.
+			 */
+			was_paused = dpcm->paused;
+			if (was_paused) {
+				dpcm->paused = false;
+				be->dpcm[stream].be_pause--;
+			} else if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_START) {
 				be->dpcm[stream].be_start--;
+			}
 
 			if (be->dpcm[stream].be_start != 0)
 				goto next;
 
-			pause_stop_transition = false;
-			if (fe->dpcm[stream].fe_pause) {
-				pause_stop_transition = true;
-				fe->dpcm[stream].fe_pause = false;
-				be->dpcm[stream].be_pause--;
-			}
-
 			if (be->dpcm[stream].be_pause != 0)
 				ret = soc_pcm_trigger(be_substream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
 			else
 				ret = soc_pcm_trigger(be_substream, SNDRV_PCM_TRIGGER_STOP);
 
 			if (ret) {
-				if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_START)
-					be->dpcm[stream].be_start++;
-				if (pause_stop_transition) {
-					fe->dpcm[stream].fe_pause = true;
+				if (was_paused) {
+					dpcm->paused = true;
 					be->dpcm[stream].be_pause++;
+				} else if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_START) {
+					be->dpcm[stream].be_start++;
 				}
 				goto next;
 			}
@@ -2361,7 +2394,11 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
 				goto next;
 
-			fe->dpcm[stream].fe_pause = true;
+			/* this FE's pause is already counted on this BE */
+			if (dpcm->paused)
+				goto next;
+
+			dpcm->paused = true;
 			be->dpcm[stream].be_pause++;
 
 			be->dpcm[stream].be_start--;
@@ -2371,6 +2408,8 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret) {
 				be->dpcm[stream].be_start++;
+				dpcm->paused = false;
+				be->dpcm[stream].be_pause--;
 				goto next;
 			}
 




