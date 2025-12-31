Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DAE20C001;
	Wed, 31 Dec 2025 16:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767197493; cv=none; b=X2JZ5jMiII8Btiodkr8ifwQXx08LcX6Ay40ARvButtvo1i1snKmyNx9G4+d+D4+Qv4uKIs4Skc0f1DWcTPU2TLR6TeEP4f74cDCsbzf/JGznkIS0qGyOCt2WQOYQoW3RFN93yUNFe9UzZIsEiFdW4PcUI/07c6PmlCOlTeG0HbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767197493; c=relaxed/simple;
	bh=5BiygOw5UNn5YywNE8xU9RXfaS51Avk/RtJNsmgIcfE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ej3wFrvGKvoopcZdiMGXxSEqI7YTY7BPPa+PTBHTJRznS8zuBqb6YAwtyPMTnAHH5OkJx3ruBNNfvB9xjiFm3MfgYXPXNFRaiwwnohL7Mz7qYWsNaxgaEnCbNmxKCTa8HOHNP1AyxF64bMOt2alSThzpDiPGi/lIUjhIKoMqFN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=KRbz9/6A; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="KRbz9/6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OeLFUtBFjTtGUz3AwnZlKFPf8V2epJZinbRJZcB2uRg=;
  b=KRbz9/6A71WArkBMNrrX+OtXqcwYSbdYOLjyqHDgDU6SfGVNZvurIsT+
   iwV+FjdK2FpKITvQxhhzB/y2qpzPOBjL32zD03OAx4jUTHNj7bNYCI01D
   3D47whtsvxsPcQAfPua0XPS2DM/Ex6I6c5vakdNCytgKuHsTrQFysdecu
   w=;
X-CSE-ConnectionGUID: gxcLhT65RAixvqSgYSvLAQ==
X-CSE-MsgGUID: RBX6q09rTVe7AJA8ntVbGQ==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,192,1763420400"; 
   d="scan'208";a="134815114"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 17:11:21 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jaroslav Kysela <perex@perex.cz>
Cc: yunbolyu@smu.edu.sg,
	kexinsun@smail.nju.edu.cn,
	ratnadiraw@smu.edu.sg,
	xutong.ma@inria.fr,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: echoaudio: adjust function name
Date: Wed, 31 Dec 2025 17:11:16 +0100
Message-Id: <20251231161116.141071-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function restore_dsp_rettings sets a lot of things, so change the
name to the more natural restore_dsp_settings.  This name was indeed
already used in a comment above the code in
sound/pci/echoaudio/echoaudio.c.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
v2: change the function name in the code, rather than in the comment

This was tested by compiling sound/pci/echoaudio/darla20.c, which
includes both files.

 sound/pci/echoaudio/echoaudio.c     |    2 +-
 sound/pci/echoaudio/echoaudio_dsp.c |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index f2c8602a1ad7..8b7b6838106f 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -2159,7 +2159,7 @@ static int snd_echo_resume(struct device *dev)
 	 */
 	pipe_alloc_mask = chip->pipe_alloc_mask;
 	chip->pipe_alloc_mask = 0;
-	err = restore_dsp_rettings(chip);
+	err = restore_dsp_settings(chip);
 	chip->pipe_alloc_mask = pipe_alloc_mask;
 	if (err < 0) {
 		kfree(commpage_bak);
diff --git a/sound/pci/echoaudio/echoaudio_dsp.c b/sound/pci/echoaudio/echoaudio_dsp.c
index 2a40091d472c..6e872103305b 100644
--- a/sound/pci/echoaudio/echoaudio_dsp.c
+++ b/sound/pci/echoaudio/echoaudio_dsp.c
@@ -32,7 +32,7 @@
 #error PAGE_SIZE is < 4k
 #endif
 
-static int restore_dsp_rettings(struct echoaudio *chip);
+static int restore_dsp_settings(struct echoaudio *chip);
 
 
 /* Some vector commands involve the DSP reading or writing data to and from the
@@ -666,7 +666,7 @@ static void get_audio_meters(struct echoaudio *chip, long *meters)
 
 
 
-static int restore_dsp_rettings(struct echoaudio *chip)
+static int restore_dsp_settings(struct echoaudio *chip)
 {
 	int i, o, err;
 
@@ -1014,7 +1014,7 @@ static int init_line_levels(struct echoaudio *chip)
 	chip->input_clock = ECHO_CLOCK_INTERNAL;
 	chip->output_clock = ECHO_CLOCK_WORD;
 	chip->sample_rate = 44100;
-	return restore_dsp_rettings(chip);
+	return restore_dsp_settings(chip);
 }
 
 

