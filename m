Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC19947FAF5
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 19:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005817; cv=none; b=SUB1yoFuW+nZ+u19xa5+E7Alc6lInkSA9HlQBqdDhCeyuOFbxcerCrCIZ8AKjPQdRWvLYGtsv5k2044ParbQOcGLWQSWIjucYA9xuLnayVdcm2cRLya4xvuZaU9iHrQv07bUGfw4S6ijKSvp3Dcutb4Tcw4hclww8mfZy2a8nhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005817; c=relaxed/simple;
	bh=JrkCeigUQ9nhxy4Iz8HWwsNNfRdowuDyaN/d6zvOutI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rJHAPkuzYyW0sI+Q+sm3ml5JudGRdH7VoWD73E+Iby9CQrJQY5HxGdgFf7ema3iNdqTBVaByGdsPQMJPU/SZkNTIztW3aUeFKVBERUPoGKyiiFSV0zxhAN2y3eTBXnxEORu/tBtGDlukJ0SkSz8fk1hnNoXRbEVvdYAjEo0mYxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=Be1SUkZ9; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="Be1SUkZ9"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-157fe9d771bso2102434c88.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 12:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792005809; x=1792610609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGbwhr15/hqX12VrEIuqyIcS9ohxldPnTFrEtZ54fV0=;
        b=Be1SUkZ9MGOSYqsQLjcRR06YcoeXptXtNv2WieZiTiPMlJsaHuThHCrD4/Y2ZFTH5/
         RJUOWPFW9CUcVl8L41tzOiMi18b/oWmbNoryXI09K4icSffJ6qXP5w0Cr5kS36Bb4h2d
         ekqZRXf90TD2ErZPnGAgiMfl3EcymFEtogSrv7jLmpeiXRuAQnj/FHS11hoVvVv2pf2O
         dILFp+rTqyBA15cytmjOdqzQzNSquAayMnDR8Wz9xBs8STkXRmKT0zPtNypuHemdxi20
         i2Gap2lvVanWTTJsxAmJCUbIrbxMm/G0k9+ejAvw/7FqChc4j+eDluMCfPKhadmOEHhO
         fFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005809; x=1792610609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGbwhr15/hqX12VrEIuqyIcS9ohxldPnTFrEtZ54fV0=;
        b=ClIgXcVJxnrdfJWCr0A+PWnrUu2R/2R+hbEd3ha8bDDlvuPych+q46+nKsgysWksbj
         jKcGMZt7sdriT/gBcgLuurYKFiSC0VZHfBlRvzwxddmGjDkSnH2DMPlrBQ1F9sqzGHkA
         UANdYnlrpTFtJdE737vQaS6WdqE/33VTJzpBDnscHps/3T4NR7zQnTSzagnDGecryOKS
         1hpksVlRkF8MsQtTPIOgGDaGPYauf+1Oq8ZkcqNRKcdCiv9sauI+Pds0PcOh1InwoV1w
         DsyCUCfEr8jvkwH79YfsXzA1hxtnozZ2TGAxOCm7VxOJxnK9AKC9KsQcfEmPaUK/px5m
         tfEg==
X-Forwarded-Encrypted: i=1; AKwUvBzNmqCvWHfJ1N+tW4wZ1ZHNiVpiha87bfp2SM9Qa6EPtoJ+bOPtUmINDYzp7b0tNxsTMTSXZGrSNKy9og==@vger.kernel.org
X-Gm-Message-State: AFq9FYLplPA6dEH68eAT2kVY4KH5khNKANaJ6J1PGI0qQil4od8rhb96
	L2EDre0RtN5teyYO+MhyeN/iFI+t7HMOCtOfFdG1+mKVEvA/N90N+PdbIPwTHbQd3mVZMml6sfF
	dAy1YaoqOlQ==
X-Gm-Gg: AYBFou1/c82TGDJhRYIeCj42jOJsgc7GwT7JUOHd7LTlXm497nKVK6jCHdakSXkL3EK
	RQrIG4IyTegOdmUM00W7upji1IVKhFPvhJQrsN6l7Cu1/MxHOiGXTbSEkeLK3eNhStqSzFBA1WH
	PPlkseusakyP2RsWZT9BUZTQZ+VgWU6lBo3KRGcHpvgLFdqaGVqARNNV0/BnwkYCvyJSQ15llMp
	irriZRclraOP4tcxHxdYcsVc3oruY2fTW2tVgmHUeXJ8Za/DzfDYtmChyihtxaIHlmNUJ2EBmoO
	5AG0tpQj8IVTto+G6fxeuLne6iDCq1CexEDLLVQ9nRjyHeXZVBa66BcuZ9EQEfivKhlOtDE9LoQ
	k0p9MoR0t9LfGNTw6hy81Alqsyw8Co8Afpt9NpbHAXjXF7udxaPGX1yZpcEARDff968M55o6cvi
	oGM/30ABFuVXm67A7LGwdgAEmjOvpGUwYjpw8MurUOPguP3a3nsAclKTf09RiS9ggLDCWZXpLA4
	JfJvKb2F/ePX26VTAC+z2JOPtFUvYoS2HAPfFHLoJRSGONjp9DS+Op48PH8r3xTg1Lh39E=
X-Received: by 2002:a05:7022:7f14:b0:14b:992f:c168 with SMTP id a92af1059eb24-16a56c9d73emr24145402c88.4.1792005809104;
        Wed, 14 Oct 2026 12:23:29 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm12341237c88.6.2026.10.14.12.23.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:23:28 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: jjy600901@snu.ac.kr,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH 6.6.y] ALSA: pcm: oss: Fix data race at accessing runtime.oss.trigger
Date: Wed, 14 Oct 2026 15:23:25 -0400
Message-ID: <20261014192325.24338-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 901ac0ff15edf9503162e2cf6579bd11a30f1ed4 ]

Currently the runtime.oss.trigger field may be accessed concurrently
without protection, which may lead to the data race.  And, in this
case, it may lead to more severe problem because it's a bit field; as
writing the data, it may overwrite other bit fields as well, which
confuses the operation completely, as spotted by fuzzing.

Fix it by covering runtime.oss.trigger bit fled also with the existing
params_lock mutex in both snd_pcm_oss_get_trigger() and
snd_pcm_oss_poll().

Reported-and-tested-by: Jaeyoung Chung <jjy600901@snu.ac.kr>
Closes: https://lore.kernel.org/20260423145330.210035-1-jjy600901@snu.ac.kr
Cc: <stable@vger.kernel.org>
Link: https://patch.msgid.link/20260424112205.123703-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Assisted-by: LLM
[ Backport to 6.6.y: Replace upstream mutex guards with explicit
  params_lock operations and matching unlocks; the target has no scoped
  locking helpers. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-46157 to 6.6.y.

The code changes are identical to upstream, except explicit params_lock
operations replace upstream mutex guards; see the bracketed backport note
above.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: x86_64 objects
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 sound/core/oss/pcm_oss.c |   32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 23ecbd70ccf653aa70a2b08aecf781a194afcc66..ce63fe4ecf707670a1a4daab307f2258b00697d8 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2161,10 +2161,18 @@ static int snd_pcm_oss_get_trigger(struct snd_pcm_oss_file *pcm_oss_file)
 
 	psubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
 	csubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
-	if (psubstream && psubstream->runtime && psubstream->runtime->oss.trigger)
-		result |= PCM_ENABLE_OUTPUT;
-	if (csubstream && csubstream->runtime && csubstream->runtime->oss.trigger)
-		result |= PCM_ENABLE_INPUT;
+	if (psubstream && psubstream->runtime) {
+		mutex_lock(&psubstream->runtime->oss.params_lock);
+		if (psubstream->runtime->oss.trigger)
+			result |= PCM_ENABLE_OUTPUT;
+		mutex_unlock(&psubstream->runtime->oss.params_lock);
+	}
+	if (csubstream && csubstream->runtime) {
+		mutex_lock(&csubstream->runtime->oss.params_lock);
+		if (csubstream->runtime->oss.trigger)
+			result |= PCM_ENABLE_INPUT;
+		mutex_unlock(&csubstream->runtime->oss.params_lock);
+	}
 	return result;
 }
 
@@ -2839,6 +2847,18 @@ static int snd_pcm_oss_capture_ready(struct snd_pcm_substream *substream)
 						runtime->oss.period_frames;
 }
 
+static bool need_input_retrigger(struct snd_pcm_runtime *runtime)
+{
+	bool ret;
+
+	mutex_lock(&runtime->oss.params_lock);
+	ret = runtime->oss.trigger;
+	if (ret)
+		runtime->oss.trigger = 0;
+	mutex_unlock(&runtime->oss.params_lock);
+	return ret;
+}
+
 static __poll_t snd_pcm_oss_poll(struct file *file, poll_table * wait)
 {
 	struct snd_pcm_oss_file *pcm_oss_file;
@@ -2871,11 +2891,11 @@ static __poll_t snd_pcm_oss_poll(struct file *file, poll_table * wait)
 		    snd_pcm_oss_capture_ready(csubstream))
 			mask |= EPOLLIN | EPOLLRDNORM;
 		snd_pcm_stream_unlock_irq(csubstream);
-		if (ostate != SNDRV_PCM_STATE_RUNNING && runtime->oss.trigger) {
+		if (ostate != SNDRV_PCM_STATE_RUNNING &&
+		    need_input_retrigger(runtime)) {
 			struct snd_pcm_oss_file ofile;
 			memset(&ofile, 0, sizeof(ofile));
 			ofile.streams[SNDRV_PCM_STREAM_CAPTURE] = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
-			runtime->oss.trigger = 0;
 			snd_pcm_oss_set_trigger(&ofile, PCM_ENABLE_INPUT);
 		}
 	}
