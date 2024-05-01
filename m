Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935C079B7E
	for <linux-sound@vger.kernel.org>; Wed,  1 May 2024 11:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714563297; cv=none; b=ailkNhmcO5Fl0xxBcyu0CSsvSR5e8n3JMok1vw1hmBQRDughkd35cKBVxSv94Zds2X65vNYnb6yMltZ5NzNU+WuRD+qEU8LPrq+kbquOkSUb9UNygsu/USAik5QEp/OmOR6n/8YjmZ6qXTX7vjKDtEKi6rj3aSMaW1Ct/R3DTaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714563297; c=relaxed/simple;
	bh=UNSsDWumIfU7vNnjpBqWWSwRpUjG4hqD0OsLHZBSAfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGYF3CpILMaZniX6oxU6WJTFRBvegH3EAICKm1zC4L4okKxsGQZjG0W5vOnBq/2qAu+1j6kH3Fx0jZWA0TeXJEABj9a/nZ6wpAgSgZWN2YkVD3StiyfCyS8H1ZRldE0cJYUKH6CMav0dSTwU+LB4baPIIjZbXDPd1v3q3rQcwlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=HjAFGXIw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JaSR/RzL; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="HjAFGXIw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JaSR/RzL"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id A3CC91C000FE;
	Wed,  1 May 2024 07:34:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Wed, 01 May 2024 07:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1714563293; x=
	1714649693; bh=wesahk9HGev+GQejz5iSDr/88Zglk9ElrGtp8fVX57s=; b=H
	jAFGXIw9KNn8O8zZj//2bCqBRBJm0hx55ZTOqc9+eRhWTt8Jpvuu8vvxYnzweOeD
	p9i1R/80FM/Z2n6tDwTpxPwLU3KBKkNoS7/6XuzZcQfrormhw1V2A8zl+dHR1rNg
	y8fUjNIJRI+M5CNcPPMBiDpRVUtypTowIgO2INcuLHQMCbla/09SKKspFFirBpPg
	MBspYFPTWSafSVg6yIUQ88Io1S1DSj4Zpy8/PwqriQzeL5wPWfQ8uGb2JyIoFmAF
	BDww0jqY46FU8Xxp638EavFFktv+PHpJmy4hu0NVLSUaX4/K7zXYN7TLMDWcODYr
	mW6aENdGHYoyMSFHv9wHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714563293; x=
	1714649693; bh=wesahk9HGev+GQejz5iSDr/88Zglk9ElrGtp8fVX57s=; b=J
	aSR/RzLltq2Rb+43g/8oMJz9V+3CUHS/lki/9UiFChF8+mWt9UfMkVIqvgAGPi7E
	zg303igDur6aFET5p9Rakq/MQmzZe1eCxbjCw/32GZ9lMKMXJEM88H9J4/wc7qp+
	uOhbDWIpUKyUr3wQjkJme9xC0lTX2MOfBzwDN/111en/d/GDvhB+dbWZMjW/31uU
	hYcG+CC/c5uF2tvqsnVzknwnPS3EpIMFsYW8uhoyxRXbeaUZyp9aYBn1s1w/FAXo
	RGP/G8unP7UOyzIB0aSkrv18pjlinvHxBIrd2HpMhL+J7jnzMmF0U2bxBNyyuOJx
	LiOunnL8OEPihj4TB4/6g==
X-ME-Sender: <xms:3CgyZka5Bwm2PHH0jL_oSt3xhcIsLrFeGxhKt1t-3_QnU2rnZ4yxOg>
    <xme:3CgyZvbiPJGmYULyY1FtwqLI_yZMbIOOKu1hxgBeakjnHPnAtZzSorNNMX_DLHDtV
    fm1Cj5Z8C1eklMZ38E>
X-ME-Received: <xmr:3CgyZu_-_RDs8gwiP5pgC9gSV6Nfuh9l8DQn_5Sr5crUJEk0X4UY5DUkCISv6vHom_2NE7E5C1YzzVVXlo_Pv_CeHQ4vKdSLAsi1YhRGSoHQxWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduhedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvjefgje
    euvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdffkedvtdenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
    hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:3CgyZuqxZ_rd0o89B4UzZf_JcOhpkNK0j1md1LD4dgm0W446E_3uEw>
    <xmx:3CgyZvrA-vPizBpCZJoPXcZkCd7bq6QQ0ZUqsmwEUG78MJoUdNlthg>
    <xmx:3CgyZsRig177Gb-Lo2H-72-kNPHjzqDAFHgTlt7UI22fkZZmOkLF7g>
    <xmx:3CgyZvq2-r82GkMoZYW34G1Q_o_tPRvNRfdc1Myl4KLZZsxZSqCOjg>
    <xmx:3SgyZuXcQ7F-D3x9XU6jDZWWwXKzUfiGl0tRCkUijnmzyWWDCHSd6fcz>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 May 2024 07:34:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/4] ALSA: pcm: delete snd_pcm_set_sync() in .open callback
Date: Wed,  1 May 2024 20:34:42 +0900
Message-ID: <20240501113445.100817-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240501113445.100817-1-o-takashi@sakamocchi.jp>
References: <20240501113445.100817-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In Linux kernel version 4.13, the data of snd_pcm_sync_id union is not
exposed to user space by a commit e11f0f90a626 ("ALSA: pcm: remove
SNDRV_PCM_IOCTL1_INFO internal command"). Now we have been found no
issues related to it. It means that the data is neither used by any
practical applications nor drivers.

This commit deletes the setter kernel API, snd_pcm_set_sync(). In all of
the cases the API is called in .open callback of PCM operation.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/sound/pcm.h                      |  1 -
 sound/core/pcm_lib.c                     | 17 -----------------
 sound/firewire/bebob/bebob_pcm.c         |  1 -
 sound/firewire/dice/dice-pcm.c           |  1 -
 sound/firewire/digi00x/digi00x-pcm.c     |  1 -
 sound/firewire/fireface/ff-pcm.c         |  1 -
 sound/firewire/fireworks/fireworks_pcm.c |  1 -
 sound/firewire/motu/motu-pcm.c           |  1 -
 sound/firewire/oxfw/oxfw-pcm.c           |  1 -
 sound/firewire/tascam/tascam-pcm.c       |  1 -
 sound/isa/wss/wss_lib.c                  |  2 --
 sound/pci/ali5451/ali5451.c              |  1 -
 sound/pci/asihpi/asihpi.c                |  2 --
 sound/pci/ca0106/ca0106_main.c           |  1 -
 sound/pci/echoaudio/echoaudio.c          |  1 -
 sound/pci/ens1370.c                      |  3 ---
 sound/pci/hda/hda_controller.c           |  1 -
 sound/pci/ice1712/ice1712.c              |  2 --
 sound/pci/ice1712/ice1724.c              |  5 -----
 sound/pci/lx6464es/lx6464es.c            |  1 -
 sound/pci/oxygen/oxygen_pcm.c            |  1 -
 sound/pci/pcxhr/pcxhr.c                  |  1 -
 sound/pci/rme32.c                        |  4 ----
 sound/pci/rme96.c                        |  4 ----
 sound/pci/rme9652/hdsp.c                 |  2 --
 sound/pci/rme9652/hdspm.c                |  1 -
 sound/pci/rme9652/rme9652.c              |  2 --
 sound/pci/sis7019.c                      |  2 --
 sound/pci/trident/trident_main.c         |  2 --
 sound/soc/intel/avs/pcm.c                |  1 -
 sound/soc/intel/skylake/skl-pcm.c        |  1 -
 sound/sparc/cs4231.c                     |  2 --
 32 files changed, 68 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 61c6054618c8..dca5d2177e9b 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1155,7 +1155,6 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *buf, unsigned int
 
 void snd_pcm_set_ops(struct snd_pcm * pcm, int direction,
 		     const struct snd_pcm_ops *ops);
-void snd_pcm_set_sync(struct snd_pcm_substream *substream);
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 6f73b3c2c205..050a43eb6bae 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -515,23 +515,6 @@ void snd_pcm_set_ops(struct snd_pcm *pcm, int direction,
 }
 EXPORT_SYMBOL(snd_pcm_set_ops);
 
-/**
- * snd_pcm_set_sync - set the PCM sync id
- * @substream: the pcm substream
- *
- * Sets the PCM sync identifier for the card.
- */
-void snd_pcm_set_sync(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	
-	runtime->sync.id32[0] = substream->pcm->card->number;
-	runtime->sync.id32[1] = -1;
-	runtime->sync.id32[2] = -1;
-	runtime->sync.id32[3] = -1;
-}
-EXPORT_SYMBOL(snd_pcm_set_sync);
-
 /*
  *  Standard ioctl routine
  */
diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index ce49eef0fcba..07ba3b40d601 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -192,7 +192,6 @@ static int pcm_open(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&bebob->mutex);
 
-	snd_pcm_set_sync(substream);
 
 	return 0;
 err_locked:
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index d64366217d57..ec88e4f8ab79 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -243,7 +243,6 @@ static int pcm_open(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&dice->mutex);
 
-	snd_pcm_set_sync(substream);
 
 	return 0;
 err_locked:
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index 3bd1575c9d9c..e389f0ed33df 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -167,7 +167,6 @@ static int pcm_open(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&dg00x->mutex);
 
-	snd_pcm_set_sync(substream);
 
 	return 0;
 err_locked:
diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index ec915671a79b..301724d4ac52 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -206,7 +206,6 @@ static int pcm_open(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&ff->mutex);
 
-	snd_pcm_set_sync(substream);
 
 	return 0;
 
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index c3c21860b245..2bb8f5f5147a 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -229,7 +229,6 @@ static int pcm_open(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&efw->mutex);
 
-	snd_pcm_set_sync(substream);
 
 	return 0;
 err_locked:
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index d410c2efbde5..08556a62a905 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -184,7 +184,6 @@ static int pcm_open(struct snd_pcm_substream *substream)
 		}
 	}
 
-	snd_pcm_set_sync(substream);
 
 	mutex_unlock(&motu->mutex);
 
diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index 5f43a0b826d2..4c555d5e9daa 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -217,7 +217,6 @@ static int pcm_open(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&oxfw->mutex);
 
-	snd_pcm_set_sync(substream);
 
 	return 0;
 err_locked:
diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index f6da571707ac..ca4e7f1f6c36 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -96,7 +96,6 @@ static int pcm_open(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&tscm->mutex);
 
-	snd_pcm_set_sync(substream);
 
 	return 0;
 err_locked:
diff --git a/sound/isa/wss/wss_lib.c b/sound/isa/wss/wss_lib.c
index 026061b55ee9..2909657e1dfc 100644
--- a/sound/isa/wss/wss_lib.c
+++ b/sound/isa/wss/wss_lib.c
@@ -1505,7 +1505,6 @@ static int snd_wss_playback_open(struct snd_pcm_substream *substream)
 		return err;
 	}
 	chip->playback_substream = substream;
-	snd_pcm_set_sync(substream);
 	chip->rate_constraint(runtime);
 	return 0;
 }
@@ -1546,7 +1545,6 @@ static int snd_wss_capture_open(struct snd_pcm_substream *substream)
 		return err;
 	}
 	chip->capture_substream = substream;
-	snd_pcm_set_sync(substream);
 	chip->rate_constraint(runtime);
 	return 0;
 }
diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 31e51e2df655..babcdc664264 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -1468,7 +1468,6 @@ static int snd_ali_open(struct snd_pcm_substream *substream, int rec,
 	runtime->private_free = snd_ali_pcm_free_substream;
 
 	runtime->hw = *phw;
-	snd_pcm_set_sync(substream);
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 				     0, 64*1024);
 	return 0;
diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 001786e2aba1..86765f1381d7 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -1042,7 +1042,6 @@ static int snd_card_asihpi_playback_open(struct snd_pcm_substream *substream)
 
 	if (card->support_grouping) {
 		snd_card_asihpi_playback.info |= SNDRV_PCM_INFO_SYNC_START;
-		snd_pcm_set_sync(substream);
 	}
 
 	/* struct is copied, so can create initializer dynamically */
@@ -1222,7 +1221,6 @@ static int snd_card_asihpi_capture_open(struct snd_pcm_substream *substream)
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 		card->update_interval_frames, UINT_MAX);
 
-	snd_pcm_set_sync(substream);
 
 	return 0;
 }
diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index cf1bac7a435f..8e64c13d2ca8 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -581,7 +581,6 @@ static int snd_ca0106_pcm_open_playback_channel(struct snd_pcm_substream *substr
 	err = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64);
 	if (err < 0)
                 return err;
-	snd_pcm_set_sync(substream);
 
 	/* Front channel dac should already be on */
 	if (channel_id != PCM_FRONT_CHANNEL) {
diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 7484de255a3e..41e5dc30190b 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -287,7 +287,6 @@ static int pcm_open(struct snd_pcm_substream *substream,
 	runtime->hw = pipe->hw;
 	runtime->private_data = pipe;
 	runtime->private_free = audiopipe_free;
-	snd_pcm_set_sync(substream);
 
 	/* Only mono and any even number of channels are allowed */
 	err = snd_pcm_hw_constraint_list(runtime, 0,
diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 18928b905939..6cac72a4c847 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -1100,7 +1100,6 @@ static int snd_ensoniq_playback1_open(struct snd_pcm_substream *substream)
 	ensoniq->mode |= ES_MODE_PLAY1;
 	ensoniq->playback1_substream = substream;
 	runtime->hw = snd_ensoniq_playback1;
-	snd_pcm_set_sync(substream);
 	spin_lock_irq(&ensoniq->reg_lock);
 	if (ensoniq->spdif && ensoniq->playback2_substream == NULL)
 		ensoniq->spdif_stream = ensoniq->spdif_default;
@@ -1123,7 +1122,6 @@ static int snd_ensoniq_playback2_open(struct snd_pcm_substream *substream)
 	ensoniq->mode |= ES_MODE_PLAY2;
 	ensoniq->playback2_substream = substream;
 	runtime->hw = snd_ensoniq_playback2;
-	snd_pcm_set_sync(substream);
 	spin_lock_irq(&ensoniq->reg_lock);
 	if (ensoniq->spdif && ensoniq->playback1_substream == NULL)
 		ensoniq->spdif_stream = ensoniq->spdif_default;
@@ -1146,7 +1144,6 @@ static int snd_ensoniq_capture_open(struct snd_pcm_substream *substream)
 	ensoniq->mode |= ES_MODE_CAPTURE;
 	ensoniq->capture_substream = substream;
 	runtime->hw = snd_ensoniq_capture;
-	snd_pcm_set_sync(substream);
 #ifdef CHIP1370
 	snd_pcm_hw_constraint_ratnums(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
 				      &snd_es1370_hw_constraints_clock);
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 8af5ee1b0ea8..658a9341779d 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -663,7 +663,6 @@ static int azx_pcm_open(struct snd_pcm_substream *substream)
 		runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_LINK_ATIME;
 	}
 
-	snd_pcm_set_sync(substream);
 	mutex_unlock(&chip->open_mutex);
 	return 0;
 
diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 3b0c3e70987b..2103b1700a76 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -1129,7 +1129,6 @@ static int snd_ice1712_playback_pro_open(struct snd_pcm_substream *substream)
 
 	ice->playback_pro_substream = substream;
 	runtime->hw = snd_ice1712_playback_pro;
-	snd_pcm_set_sync(substream);
 	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
 	if (is_pro_rate_locked(ice)) {
@@ -1150,7 +1149,6 @@ static int snd_ice1712_capture_pro_open(struct snd_pcm_substream *substream)
 
 	ice->capture_pro_substream = substream;
 	runtime->hw = snd_ice1712_capture_pro;
-	snd_pcm_set_sync(substream);
 	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
 	if (is_pro_rate_locked(ice)) {
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 1dc776acd637..71e7da7c8070 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -1010,7 +1010,6 @@ static int snd_vt1724_playback_pro_open(struct snd_pcm_substream *substream)
 	runtime->private_data = (void *)&vt1724_playback_pro_reg;
 	ice->playback_pro_substream = substream;
 	runtime->hw = snd_vt1724_playback_pro;
-	snd_pcm_set_sync(substream);
 	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
 	set_rate_constraints(ice, substream);
 	mutex_lock(&ice->open_mutex);
@@ -1043,7 +1042,6 @@ static int snd_vt1724_capture_pro_open(struct snd_pcm_substream *substream)
 	runtime->private_data = (void *)&vt1724_capture_pro_reg;
 	ice->capture_pro_substream = substream;
 	runtime->hw = snd_vt1724_2ch_stereo;
-	snd_pcm_set_sync(substream);
 	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
 	set_rate_constraints(ice, substream);
 	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
@@ -1191,7 +1189,6 @@ static int snd_vt1724_playback_spdif_open(struct snd_pcm_substream *substream)
 		set_rate_constraints(ice, substream);
 	} else
 		runtime->hw = snd_vt1724_spdif;
-	snd_pcm_set_sync(substream);
 	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
 	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 				   VT1724_BUFFER_ALIGN);
@@ -1228,7 +1225,6 @@ static int snd_vt1724_capture_spdif_open(struct snd_pcm_substream *substream)
 		set_rate_constraints(ice, substream);
 	} else
 		runtime->hw = snd_vt1724_spdif;
-	snd_pcm_set_sync(substream);
 	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
 	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 				   VT1724_BUFFER_ALIGN);
@@ -1377,7 +1373,6 @@ static int snd_vt1724_playback_indep_open(struct snd_pcm_substream *substream)
 	runtime->private_data = (void *)&vt1724_playback_dma_regs[substream->number];
 	ice->playback_con_substream_ds[substream->number] = substream;
 	runtime->hw = snd_vt1724_2ch_stereo;
-	snd_pcm_set_sync(substream);
 	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
 	set_rate_constraints(ice, substream);
 	return 0;
diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index bd9b6148dd6f..e845629d1c6b 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -246,7 +246,6 @@ static int lx_pcm_open(struct snd_pcm_substream *substream)
 	snd_pcm_hw_constraint_step(runtime, 0,
 				   SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 32);
 
-	snd_pcm_set_sync(substream);
 	err = 0;
 
 exit:
diff --git a/sound/pci/oxygen/oxygen_pcm.c b/sound/pci/oxygen/oxygen_pcm.c
index b2a3fcfe31d4..1b0f2d980f5e 100644
--- a/sound/pci/oxygen/oxygen_pcm.c
+++ b/sound/pci/oxygen/oxygen_pcm.c
@@ -168,7 +168,6 @@ static int oxygen_open(struct snd_pcm_substream *substream,
 		if (err < 0)
 			return err;
 	}
-	snd_pcm_set_sync(substream);
 	chip->streams[channel] = substream;
 
 	mutex_lock(&chip->mutex);
diff --git a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
index 242bd7e04b3e..165132a98dcc 100644
--- a/sound/pci/pcxhr/pcxhr.c
+++ b/sound/pci/pcxhr/pcxhr.c
@@ -1059,7 +1059,6 @@ static int pcxhr_open(struct snd_pcm_substream *subs)
 				   SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 32);
 	snd_pcm_hw_constraint_step(runtime, 0,
 				   SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 32);
-	snd_pcm_set_sync(subs);
 
 	mgr->ref_count_rate++;
 
diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 02144bbee6d5..eaf7d4850634 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -819,7 +819,6 @@ static int snd_rme32_playback_spdif_open(struct snd_pcm_substream *substream)
 	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	snd_pcm_set_sync(substream);
 
 	spin_lock_irq(&rme32->lock);
 	if (rme32->playback_substream != NULL) {
@@ -864,7 +863,6 @@ static int snd_rme32_capture_spdif_open(struct snd_pcm_substream *substream)
 	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	snd_pcm_set_sync(substream);
 
 	spin_lock_irq(&rme32->lock);
         if (rme32->capture_substream != NULL) {
@@ -904,7 +902,6 @@ snd_rme32_playback_adat_open(struct snd_pcm_substream *substream)
 	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	
-	snd_pcm_set_sync(substream);
 
 	spin_lock_irq(&rme32->lock);	
         if (rme32->playback_substream != NULL) {
@@ -955,7 +952,6 @@ snd_rme32_capture_adat_open(struct snd_pcm_substream *substream)
                 runtime->hw.rate_max = rate;
         }
 
-	snd_pcm_set_sync(substream);
         
 	spin_lock_irq(&rme32->lock);	
 	if (rme32->capture_substream != NULL) {
diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index d50ad25574ad..1c2260647f8a 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -1161,7 +1161,6 @@ snd_rme96_playback_spdif_open(struct snd_pcm_substream *substream)
 	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	snd_pcm_set_sync(substream);
 	spin_lock_irq(&rme96->lock);	
 	if (rme96->playback_substream) {
 		spin_unlock_irq(&rme96->lock);
@@ -1199,7 +1198,6 @@ snd_rme96_capture_spdif_open(struct snd_pcm_substream *substream)
 	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	snd_pcm_set_sync(substream);
 	runtime->hw = snd_rme96_capture_spdif_info;
 	if (snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG) {
 		rate = snd_rme96_capture_getrate(rme96, &isadat);
@@ -1231,7 +1229,6 @@ snd_rme96_playback_adat_open(struct snd_pcm_substream *substream)
 	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;        
 	
-	snd_pcm_set_sync(substream);
 	spin_lock_irq(&rme96->lock);	
 	if (rme96->playback_substream) {
 		spin_unlock_irq(&rme96->lock);
@@ -1265,7 +1262,6 @@ snd_rme96_capture_adat_open(struct snd_pcm_substream *substream)
 	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	snd_pcm_set_sync(substream);
 	runtime->hw = snd_rme96_capture_adat_info;
         if (snd_rme96_getinputtype(rme96) == RME96_INPUT_ANALOG) {
                 /* makes no sense to use analog input. Note that analog
diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index e7d1b43471a2..dbf544798980 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -4481,7 +4481,6 @@ static int snd_hdsp_playback_open(struct snd_pcm_substream *substream)
 
 	spin_lock_irq(&hdsp->lock);
 
-	snd_pcm_set_sync(substream);
 
         runtime->hw = snd_hdsp_playback_subinfo;
 	snd_pcm_set_runtime_buffer(substream, &hdsp->playback_dma_buf);
@@ -4557,7 +4556,6 @@ static int snd_hdsp_capture_open(struct snd_pcm_substream *substream)
 
 	spin_lock_irq(&hdsp->lock);
 
-	snd_pcm_set_sync(substream);
 
 	runtime->hw = snd_hdsp_capture_subinfo;
 	snd_pcm_set_runtime_buffer(substream, &hdsp->capture_dma_buf);
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 267c7848974a..0acf788878b1 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6051,7 +6051,6 @@ static int snd_hdspm_open(struct snd_pcm_substream *substream)
 	bool playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
 
 	spin_lock_irq(&hdspm->lock);
-	snd_pcm_set_sync(substream);
 	runtime->hw = (playback) ? snd_hdspm_playback_subinfo :
 		snd_hdspm_capture_subinfo;
 
diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index d066c70ae160..78ae4a796605 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -2229,7 +2229,6 @@ static int snd_rme9652_playback_open(struct snd_pcm_substream *substream)
 
 	spin_lock_irq(&rme9652->lock);
 
-	snd_pcm_set_sync(substream);
 
         runtime->hw = snd_rme9652_playback_subinfo;
 	snd_pcm_set_runtime_buffer(substream, &rme9652->playback_dma_buf);
@@ -2288,7 +2287,6 @@ static int snd_rme9652_capture_open(struct snd_pcm_substream *substream)
 
 	spin_lock_irq(&rme9652->lock);
 
-	snd_pcm_set_sync(substream);
 
 	runtime->hw = snd_rme9652_capture_subinfo;
 	snd_pcm_set_runtime_buffer(substream, &rme9652->capture_dma_buf);
diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 53206beb2cb5..17c8cc5e0c67 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -480,7 +480,6 @@ static int sis_playback_open(struct snd_pcm_substream *substream)
 						9, 0xfff9);
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 						9, 0xfff9);
-	snd_pcm_set_sync(substream);
 	return 0;
 }
 
@@ -669,7 +668,6 @@ static int sis_capture_open(struct snd_pcm_substream *substream)
 						9, 0xfff9);
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 						9, 0xfff9);
-	snd_pcm_set_sync(substream);
 	return 0;
 }
 
diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index e98eea1e6d81..1134a0a8a44b 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -1820,7 +1820,6 @@ static int snd_trident_playback_open(struct snd_pcm_substream *substream)
 	runtime->private_data = voice;
 	runtime->private_free = snd_trident_pcm_free_substream;
 	runtime->hw = snd_trident_playback;
-	snd_pcm_set_sync(substream);
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 0, 64*1024);
 	return 0;
 }
@@ -1948,7 +1947,6 @@ static int snd_trident_capture_open(struct snd_pcm_substream *substream)
 	runtime->private_data = voice;
 	runtime->private_free = snd_trident_pcm_free_substream;
 	runtime->hw = snd_trident_capture;
-	snd_pcm_set_sync(substream);
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 0, 64*1024);
 	return 0;
 }
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 2cafbc392cdb..8ea1fc0bc5b2 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -491,7 +491,6 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 	if (ret < 0)
 		goto err;
 
-	snd_pcm_set_sync(substream);
 
 	dev_dbg(dai->dev, "%s fe STARTUP tag %d str %p",
 		__func__, hdac_stream(host_stream)->stream_tag, substream);
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 613b27b8da13..3cf900801339 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -242,7 +242,6 @@ static int skl_pcm_open(struct snd_pcm_substream *substream,
 	dev_dbg(dai->dev, "stream tag set in dma params=%d\n",
 				 dma_params->stream_tag);
 	skl_set_suspend_active(substream, dai, true);
-	snd_pcm_set_sync(substream);
 
 	mconfig = skl_tplg_fe_get_cpr_module(dai, substream->stream);
 	if (!mconfig) {
diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index c2ad3fa2f25a..96a8684f2a69 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -1140,7 +1140,6 @@ static int snd_cs4231_playback_open(struct snd_pcm_substream *substream)
 		return err;
 	chip->playback_substream = substream;
 	chip->p_periods_sent = 0;
-	snd_pcm_set_sync(substream);
 	snd_cs4231_xrate(runtime);
 
 	return 0;
@@ -1159,7 +1158,6 @@ static int snd_cs4231_capture_open(struct snd_pcm_substream *substream)
 		return err;
 	chip->capture_substream = substream;
 	chip->c_periods_sent = 0;
-	snd_pcm_set_sync(substream);
 	snd_cs4231_xrate(runtime);
 
 	return 0;
-- 
2.43.0

