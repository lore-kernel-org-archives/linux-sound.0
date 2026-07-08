Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA6143637A
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519610; cv=none; b=VF6j+PDMNTT8LUCi1eUlIN1i4oDo4PqonZSu0rAm+SlzQiPw4L3CeUpPO1IRRrGaBVS/9V1p0l8bKDZk7ZoTe6d0pRrsx0HZ7FxK9G+NpAMT6NN0frooJ+RPJ/eoNLy9lnaz+b9VHfElxiutB1cJf2Zda9Ok37SXh7A0Yuf8/yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519610; c=relaxed/simple;
	bh=FxwTySsryOMYvWdhoKmCan+T7b2g5/NP/d6BTZBCe60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CBEplzeqM0Y8iaA9XzrPnNHcDjp34Z2F8sinIBkxxNkXGgoPUf9e3ButuvQpvGM5M2G3iYvKw8Q17qbR6jebaI0OReP2GDEdR7Q7uCzh66o2WlE1d+ZcrqXiE6wyYzoh2cUtWj+FlkHRqgY4hx0RoYtXdyqB68eN8gi2GT39HUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RR2pXGBe; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RR2pXGBe"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-380cda7f00cso706474a91.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783519608; x=1784124408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4kHktOYsNaocmgQiv5paoPgtfoQeJHkYFwxlb78Q60=;
        b=RR2pXGBehUEytCZBJkyGhYX6fgIucJ6TmM+SeX1m5rc8ZbPo1R9tjFChKyzILW3m5K
         9RZwlLRRlUZ5X9/iJR6TITjwIVIOxrlDJ2uuTkyDPXhpLKELqKhWS2dasEirwHoq9woe
         h1o0Biva93YDA+1z05euD2CHbYjQmk+0yFTS6QlgPyd/3b9lrO/r2iAOWrsoVlRZ6RTl
         4C36FP0EXJSuuQWV5uqwZulkDEHjCIyaSpY2mdz6BFaQkgUP7o2YMxn2x5t4u/0dxFgg
         Q2WcDssLShITgeZMvOcQcPfHfnm0x6XtsXMFaNQau6p6F3nY38CCGniP/mLC6ETEJicG
         RnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519608; x=1784124408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4kHktOYsNaocmgQiv5paoPgtfoQeJHkYFwxlb78Q60=;
        b=XSxtAgy06MxAaqvHVoX8pPKmotymD07sDQjhZ1XlbAl+I4DcYqU7AXR1LjN6gMc92C
         GVMRmR6ve/M4kqptOukSaa+WSusc7jfpQ2XHuIQaLCK6gfcYV0gZ7MGxwv3Phxqxok3q
         Ov9xp7MvyKL+EnBoGR7YMEvb7r4x9re7ppuB06Wv4ujdtQIbr4UeSZyGOW2B4dpkObHH
         WZ8Fk5o21tqPsfvXGegQTmqJmEZVbLq4rGF1cL56PKbEbqum+dntN/UE2i4AKRqmBECp
         eb9xqt6HBuOaItXCFbtA0GZSEPvFaAEJgiIULoPet5AW8f8Sud5NuxA/GuF9kUKHkJdC
         S+kA==
X-Forwarded-Encrypted: i=1; AHgh+RpTp7ipOOi7g/t874qjvLcny5ruXW4Z7ha1CI/e6qbEx72q5A7M68qv3COcl3Ep4km3KyhyAQ9ff0JW4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv/abMz3f6nRZAT3H01OigdGs1VYqXGj2YK8ksQm5sylsXbpPa
	YVLsfds1Ru4Cr3LcX1Ad+eXVIe3RpaJBfzkP3FXbw3uk/4UEECdsL54Z
X-Gm-Gg: AfdE7cnZUgxNm1v3r/7cHhsHiZ2L2hsfgDPjtITwdKIhk78MM9BFDOKzxlVWSHq81qK
	sjaPzarH9Thn9oj+HvHwYpOeSytFDdYxqByLxx7/AOn7MQvGBrxVzyAsF2Xa+7hY4NlnsXgGn36
	1lgtwOeJvcLbEEcea6lFFOdNiFOxRUBcpAhMcAZCgnGMlsGCjdZ4plv1ouLpH6t/+8g0KezxXVW
	nWsy6cgjQTvdw4fDA0gggYIITpEcveueq+dO3ElTMmOpJ4PkO/9V6MypTdGIHEj/AW4YWhYQ3Pw
	qVupYYvTV4p5u/zkR7B/1oxecNxC4NbGDPrnEXcAnuMeeNFQ+nReAJRMNVcLImJeZBoSFq48jmA
	mteX+/b8gPe0LZPL34Etv6N2D6rEJHyxW5ZWNrf91Hn40cTmBeEqrLGJ+nKPXF1iDxbxE23elC1
	ijEAmxpYPd0V8Kir11k2L1oxPP7ToaE+ch4adBQJ9aHt/2ErI=
X-Received: by 2002:a17:90b:5845:b0:37f:9cdf:f037 with SMTP id 98e67ed59e1d1-389417e50afmr2516228a91.26.1783519607777;
        Wed, 08 Jul 2026 07:06:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d12fcd99sm2843214a91.2.2026.07.08.07.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:06:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com
Cc: Ziqing Chen <chenziqing@xiaomi.com>,
	Kees Cook <kees@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Len Bao <len.bao@gmx.us>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	Mehul Rao <mehulrao@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Dewei Meng <mengdewei@cqsoftware.com.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: core: Clean up file_operations definitions
Date: Wed,  8 Jul 2026 21:06:24 +0700
Message-ID: <20260708140624.562403-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Align file_operations initializers with tabs to match the standard
kernel coding style and improve readability.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/compress_offload.c  | 18 +++++++-------
 sound/core/control.c           | 19 +++++++--------
 sound/core/hwdep.c             | 23 +++++++++---------
 sound/core/init.c              | 23 +++++++++---------
 sound/core/jack.c              | 38 ++++++++++++++---------------
 sound/core/oss/mixer_oss.c     | 13 +++++-----
 sound/core/oss/pcm_oss.c       | 21 ++++++++--------
 sound/core/pcm_native.c        | 44 +++++++++++++++++-----------------
 sound/core/rawmidi.c           | 16 ++++++-------
 sound/core/seq/oss/seq_oss.c   | 21 ++++++++--------
 sound/core/seq/seq_clientmgr.c | 19 +++++++--------
 sound/core/sound.c             |  9 ++++---
 sound/core/timer.c             | 25 ++++++++++---------
 13 files changed, 140 insertions(+), 149 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index fd63d219bf86..f48cba92183d 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1388,17 +1388,17 @@ static long snd_compr_ioctl_compat(struct file *file, unsigned int cmd,
 #endif
 
 static const struct file_operations snd_compr_file_ops = {
-		.owner =	THIS_MODULE,
-		.open =		snd_compr_open,
-		.release =	snd_compr_free,
-		.write =	snd_compr_write,
-		.read =		snd_compr_read,
-		.unlocked_ioctl = snd_compr_ioctl,
+		.owner		=	THIS_MODULE,
+		.open		=	snd_compr_open,
+		.release	=	snd_compr_free,
+		.write		=	snd_compr_write,
+		.read		=	snd_compr_read,
+		.unlocked_ioctl	=	snd_compr_ioctl,
 #ifdef CONFIG_COMPAT
-		.compat_ioctl = snd_compr_ioctl_compat,
+		.compat_ioctl	=	snd_compr_ioctl_compat,
 #endif
-		.mmap =		snd_compr_mmap,
-		.poll =		snd_compr_poll,
+		.mmap		=	snd_compr_mmap,
+		.poll		=	snd_compr_poll,
 };
 
 static int snd_compress_dev_register(struct snd_device *device)
diff --git a/sound/core/control.c b/sound/core/control.c
index 5e51857635e6..df66aa90a089 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -2341,16 +2341,15 @@ EXPORT_SYMBOL_GPL(snd_ctl_disconnect_layer);
  *  INIT PART
  */
 
-static const struct file_operations snd_ctl_f_ops =
-{
-	.owner =	THIS_MODULE,
-	.read =		snd_ctl_read,
-	.open =		snd_ctl_open,
-	.release =	snd_ctl_release,
-	.poll =		snd_ctl_poll,
-	.unlocked_ioctl =	snd_ctl_ioctl,
-	.compat_ioctl =	snd_ctl_ioctl_compat,
-	.fasync =	snd_ctl_fasync,
+static const struct file_operations snd_ctl_f_ops = {
+	.owner		=	THIS_MODULE,
+	.read		=	snd_ctl_read,
+	.open		=	snd_ctl_open,
+	.release	=	snd_ctl_release,
+	.poll		=	snd_ctl_poll,
+	.unlocked_ioctl	=	snd_ctl_ioctl,
+	.compat_ioctl	=	snd_ctl_ioctl_compat,
+	.fasync		=	snd_ctl_fasync,
 };
 
 /* call lops under rwsems; called from snd_ctl_dev_*() below() */
diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
index 973d11732bfd..ce4093ab7e9c 100644
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -323,18 +323,17 @@ static int snd_hwdep_control_ioctl(struct snd_card *card,
 
  */
 
-static const struct file_operations snd_hwdep_f_ops =
-{
-	.owner = 	THIS_MODULE,
-	.llseek =	snd_hwdep_llseek,
-	.read = 	snd_hwdep_read,
-	.write =	snd_hwdep_write,
-	.open =		snd_hwdep_open,
-	.release =	snd_hwdep_release,
-	.poll =		snd_hwdep_poll,
-	.unlocked_ioctl =	snd_hwdep_ioctl,
-	.compat_ioctl =	snd_hwdep_ioctl_compat,
-	.mmap =		snd_hwdep_mmap,
+static const struct file_operations snd_hwdep_f_ops = {
+	.owner		=	THIS_MODULE,
+	.llseek		=	snd_hwdep_llseek,
+	.read		=	snd_hwdep_read,
+	.write		=	snd_hwdep_write,
+	.open		=	snd_hwdep_open,
+	.release	=	snd_hwdep_release,
+	.poll		=	snd_hwdep_poll,
+	.unlocked_ioctl	=	snd_hwdep_ioctl,
+	.compat_ioctl	=	snd_hwdep_ioctl_compat,
+	.mmap		=	snd_hwdep_mmap,
 };
 
 static void snd_hwdep_free(struct snd_hwdep *hwdep)
diff --git a/sound/core/init.c b/sound/core/init.c
index 0c316189e947..cd0cae534d33 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -466,20 +466,19 @@ static int snd_disconnect_fasync(int fd, struct file *file, int on)
 	return -ENODEV;
 }
 
-static const struct file_operations snd_shutdown_f_ops =
-{
-	.owner = 	THIS_MODULE,
-	.llseek =	snd_disconnect_llseek,
-	.read = 	snd_disconnect_read,
-	.write =	snd_disconnect_write,
-	.release =	snd_disconnect_release,
-	.poll =		snd_disconnect_poll,
-	.unlocked_ioctl = snd_disconnect_ioctl,
+static const struct file_operations snd_shutdown_f_ops = {
+	.owner		=	THIS_MODULE,
+	.llseek		=	snd_disconnect_llseek,
+	.read		=	snd_disconnect_read,
+	.write		=	snd_disconnect_write,
+	.release	=	snd_disconnect_release,
+	.poll		=	snd_disconnect_poll,
+	.unlocked_ioctl	=	snd_disconnect_ioctl,
 #ifdef CONFIG_COMPAT
-	.compat_ioctl = snd_disconnect_ioctl,
+	.compat_ioctl	=	snd_disconnect_ioctl,
 #endif
-	.mmap =		snd_disconnect_mmap,
-	.fasync =	snd_disconnect_fasync
+	.mmap		=	snd_disconnect_mmap,
+	.fasync		=	snd_disconnect_fasync
 };
 
 /**
diff --git a/sound/core/jack.c b/sound/core/jack.c
index 5e8a2f3f4196..988219512d4f 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -306,41 +306,41 @@ static ssize_t jack_type_read(struct file *file,
 }
 
 static const struct file_operations jack_type_fops = {
-	.open = simple_open,
-	.read = jack_type_read,
-	.llseek = default_llseek,
+	.open	=	simple_open,
+	.read	=	jack_type_read,
+	.llseek	=	default_llseek,
 };
 #endif
 
 static const struct file_operations sw_inject_enable_fops = {
-	.open = simple_open,
-	.read = sw_inject_enable_read,
-	.write = sw_inject_enable_write,
-	.llseek = default_llseek,
+	.open	=	simple_open,
+	.read	=	sw_inject_enable_read,
+	.write	=	sw_inject_enable_write,
+	.llseek	=	default_llseek,
 };
 
 static const struct file_operations jackin_inject_fops = {
-	.open = simple_open,
-	.write = jackin_inject_write,
-	.llseek = default_llseek,
+	.open	=	simple_open,
+	.write	=	jackin_inject_write,
+	.llseek	=	default_llseek,
 };
 
 static const struct file_operations jack_kctl_id_fops = {
-	.open = simple_open,
-	.read = jack_kctl_id_read,
-	.llseek = default_llseek,
+	.open	=	simple_open,
+	.read	=	jack_kctl_id_read,
+	.llseek	=	default_llseek,
 };
 
 static const struct file_operations jack_kctl_mask_bits_fops = {
-	.open = simple_open,
-	.read = jack_kctl_mask_bits_read,
-	.llseek = default_llseek,
+	.open	=	simple_open,
+	.read	=	jack_kctl_mask_bits_read,
+	.llseek	=	default_llseek,
 };
 
 static const struct file_operations jack_kctl_status_fops = {
-	.open = simple_open,
-	.read = jack_kctl_status_read,
-	.llseek = default_llseek,
+	.open	=	simple_open,
+	.read	=	jack_kctl_status_read,
+	.llseek	=	default_llseek,
 };
 
 static int snd_jack_debugfs_add_inject_node(struct snd_jack *jack,
diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index 591cff800329..82cd2b3d1f26 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -407,13 +407,12 @@ static long snd_mixer_oss_ioctl_compat(struct file *file, unsigned int cmd,
  *  REGISTRATION PART
  */
 
-static const struct file_operations snd_mixer_oss_f_ops =
-{
-	.owner =	THIS_MODULE,
-	.open =		snd_mixer_oss_open,
-	.release =	snd_mixer_oss_release,
-	.unlocked_ioctl =	snd_mixer_oss_ioctl,
-	.compat_ioctl =	snd_mixer_oss_ioctl_compat,
+static const struct file_operations snd_mixer_oss_f_ops = {
+	.owner		=	THIS_MODULE,
+	.open		=	snd_mixer_oss_open,
+	.release	=	snd_mixer_oss_release,
+	.unlocked_ioctl	=	snd_mixer_oss_ioctl,
+	.compat_ioctl	=	snd_mixer_oss_ioctl_compat,
 };
 
 /*
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 746eaf93e1a5..d94ca2db4cf3 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -3129,17 +3129,16 @@ static inline void snd_pcm_oss_proc_done(struct snd_pcm *pcm)
  *  ENTRY functions
  */
 
-static const struct file_operations snd_pcm_oss_f_reg =
-{
-	.owner =	THIS_MODULE,
-	.read =		snd_pcm_oss_read,
-	.write =	snd_pcm_oss_write,
-	.open =		snd_pcm_oss_open,
-	.release =	snd_pcm_oss_release,
-	.poll =		snd_pcm_oss_poll,
-	.unlocked_ioctl =	snd_pcm_oss_ioctl,
-	.compat_ioctl =	snd_pcm_oss_ioctl_compat,
-	.mmap =		snd_pcm_oss_mmap,
+static const struct file_operations snd_pcm_oss_f_reg = {
+	.owner		=	THIS_MODULE,
+	.read		=	snd_pcm_oss_read,
+	.write		=	snd_pcm_oss_write,
+	.open		=	snd_pcm_oss_open,
+	.release	=	snd_pcm_oss_release,
+	.poll		=	snd_pcm_oss_poll,
+	.unlocked_ioctl	=	snd_pcm_oss_ioctl,
+	.compat_ioctl	=	snd_pcm_oss_ioctl_compat,
+	.mmap		=	snd_pcm_oss_mmap,
 };
 
 static void register_oss_dsp(struct snd_pcm *pcm, int index)
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 302643c1c192..711dd82a4942 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -4227,29 +4227,29 @@ static unsigned long snd_pcm_get_unmapped_area(struct file *file,
 
 const struct file_operations snd_pcm_f_ops[2] = {
 	{
-		.owner =		THIS_MODULE,
-		.write =		snd_pcm_write,
-		.write_iter =		snd_pcm_writev,
-		.open =			snd_pcm_playback_open,
-		.release =		snd_pcm_release,
-		.poll =			snd_pcm_poll,
-		.unlocked_ioctl =	snd_pcm_ioctl,
-		.compat_ioctl = 	snd_pcm_ioctl_compat,
-		.mmap =			snd_pcm_mmap,
-		.fasync =		snd_pcm_fasync,
-		.get_unmapped_area =	snd_pcm_get_unmapped_area,
+		.owner			=	THIS_MODULE,
+		.write			=	snd_pcm_write,
+		.write_iter		=	snd_pcm_writev,
+		.open			=	snd_pcm_playback_open,
+		.release		=	snd_pcm_release,
+		.poll			=	snd_pcm_poll,
+		.unlocked_ioctl		=	snd_pcm_ioctl,
+		.compat_ioctl		=	snd_pcm_ioctl_compat,
+		.mmap			=	snd_pcm_mmap,
+		.fasync			=	snd_pcm_fasync,
+		.get_unmapped_area	=	snd_pcm_get_unmapped_area,
 	},
 	{
-		.owner =		THIS_MODULE,
-		.read =			snd_pcm_read,
-		.read_iter =		snd_pcm_readv,
-		.open =			snd_pcm_capture_open,
-		.release =		snd_pcm_release,
-		.poll =			snd_pcm_poll,
-		.unlocked_ioctl =	snd_pcm_ioctl,
-		.compat_ioctl = 	snd_pcm_ioctl_compat,
-		.mmap =			snd_pcm_mmap,
-		.fasync =		snd_pcm_fasync,
-		.get_unmapped_area =	snd_pcm_get_unmapped_area,
+		.owner			=	THIS_MODULE,
+		.read			=	snd_pcm_read,
+		.read_iter		=	snd_pcm_readv,
+		.open			=	snd_pcm_capture_open,
+		.release		=	snd_pcm_release,
+		.poll			=	snd_pcm_poll,
+		.unlocked_ioctl		=	snd_pcm_ioctl,
+		.compat_ioctl		=	snd_pcm_ioctl_compat,
+		.mmap			=	snd_pcm_mmap,
+		.fasync			=	snd_pcm_fasync,
+		.get_unmapped_area	=	snd_pcm_get_unmapped_area,
 	}
 };
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 3b1034a44938..401faef18d3f 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1784,14 +1784,14 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
  */
 
 static const struct file_operations snd_rawmidi_f_ops = {
-	.owner =	THIS_MODULE,
-	.read =		snd_rawmidi_read,
-	.write =	snd_rawmidi_write,
-	.open =		snd_rawmidi_open,
-	.release =	snd_rawmidi_release,
-	.poll =		snd_rawmidi_poll,
-	.unlocked_ioctl =	snd_rawmidi_ioctl,
-	.compat_ioctl =	snd_rawmidi_ioctl_compat,
+	.owner		=	THIS_MODULE,
+	.read		=	snd_rawmidi_read,
+	.write		=	snd_rawmidi_write,
+	.open		=	snd_rawmidi_open,
+	.release	=	snd_rawmidi_release,
+	.poll		=	snd_rawmidi_poll,
+	.unlocked_ioctl	=	snd_rawmidi_ioctl,
+	.compat_ioctl	=	snd_rawmidi_ioctl_compat,
 };
 
 static int snd_rawmidi_alloc_substreams(struct snd_rawmidi *rmidi,
diff --git a/sound/core/seq/oss/seq_oss.c b/sound/core/seq/oss/seq_oss.c
index 021cd70f90db..2835576040ed 100644
--- a/sound/core/seq/oss/seq_oss.c
+++ b/sound/core/seq/oss/seq_oss.c
@@ -206,17 +206,16 @@ odev_poll(struct file *file, poll_table * wait)
  * registration of sequencer minor device
  */
 
-static const struct file_operations seq_oss_f_ops =
-{
-	.owner =	THIS_MODULE,
-	.read =		odev_read,
-	.write =	odev_write,
-	.open =		odev_open,
-	.release =	odev_release,
-	.poll =		odev_poll,
-	.unlocked_ioctl =	odev_ioctl,
-	.compat_ioctl =	odev_ioctl_compat,
-	.llseek =	noop_llseek,
+static const struct file_operations seq_oss_f_ops = {
+	.owner		=	THIS_MODULE,
+	.read		=	odev_read,
+	.write		=	odev_write,
+	.open		=	odev_open,
+	.release	=	odev_release,
+	.poll		=	odev_poll,
+	.unlocked_ioctl	=	odev_ioctl,
+	.compat_ioctl	=	odev_ioctl_compat,
+	.llseek		=	noop_llseek,
 };
 
 static int __init
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 5719637575a9..66a9ec60c0cb 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -2635,16 +2635,15 @@ void snd_seq_info_clients_read(struct snd_info_entry *entry,
  *  REGISTRATION PART
  */
 
-static const struct file_operations snd_seq_f_ops =
-{
-	.owner =	THIS_MODULE,
-	.read =		snd_seq_read,
-	.write =	snd_seq_write,
-	.open =		snd_seq_open,
-	.release =	snd_seq_release,
-	.poll =		snd_seq_poll,
-	.unlocked_ioctl =	snd_seq_ioctl,
-	.compat_ioctl =	snd_seq_ioctl_compat,
+static const struct file_operations snd_seq_f_ops = {
+	.owner		=	THIS_MODULE,
+	.read		=	snd_seq_read,
+	.write		=	snd_seq_write,
+	.open		=	snd_seq_open,
+	.release	=	snd_seq_release,
+	.poll		=	snd_seq_poll,
+	.unlocked_ioctl	=	snd_seq_ioctl,
+	.compat_ioctl	=	snd_seq_ioctl_compat,
 };
 
 static struct device *seq_dev;
diff --git a/sound/core/sound.c b/sound/core/sound.c
index 8d05fe0d263b..a0fe9bac083a 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -167,11 +167,10 @@ static int snd_open(struct inode *inode, struct file *file)
 	return err;
 }
 
-static const struct file_operations snd_fops =
-{
-	.owner =	THIS_MODULE,
-	.open =		snd_open,
-	.llseek =	noop_llseek,
+static const struct file_operations snd_fops = {
+	.owner	=	THIS_MODULE,
+	.open	=	snd_open,
+	.llseek	=	noop_llseek,
 };
 
 #ifdef CONFIG_SND_DYNAMIC_MINORS
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 57583dec3974..ae12e86d7b6d 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -2103,9 +2103,9 @@ static long snd_utimer_ioctl(struct file *file, unsigned int ioctl, unsigned lon
 }
 
 static const struct file_operations snd_utimer_fops = {
-	.llseek = noop_llseek,
-	.release = snd_utimer_release,
-	.unlocked_ioctl = snd_utimer_ioctl,
+	.llseek		=	noop_llseek,
+	.release	=	snd_utimer_release,
+	.unlocked_ioctl	=	snd_utimer_ioctl,
 };
 
 static int snd_utimer_start(struct snd_timer *t)
@@ -2457,16 +2457,15 @@ static __poll_t snd_timer_user_poll(struct file *file, poll_table * wait)
 #define snd_timer_user_ioctl_compat	NULL
 #endif
 
-static const struct file_operations snd_timer_f_ops =
-{
-	.owner =	THIS_MODULE,
-	.read =		snd_timer_user_read,
-	.open =		snd_timer_user_open,
-	.release =	snd_timer_user_release,
-	.poll =		snd_timer_user_poll,
-	.unlocked_ioctl =	snd_timer_user_ioctl,
-	.compat_ioctl =	snd_timer_user_ioctl_compat,
-	.fasync = 	snd_timer_user_fasync,
+static const struct file_operations snd_timer_f_ops = {
+	.owner		=	THIS_MODULE,
+	.read		=	snd_timer_user_read,
+	.open		=	snd_timer_user_open,
+	.release	=	snd_timer_user_release,
+	.poll		=	snd_timer_user_poll,
+	.unlocked_ioctl	=	snd_timer_user_ioctl,
+	.compat_ioctl	=	snd_timer_user_ioctl_compat,
+	.fasync		=	snd_timer_user_fasync,
 };
 
 /* unregister the system timer */
-- 
2.43.0

