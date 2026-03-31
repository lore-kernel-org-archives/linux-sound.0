Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCF141B36B
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 21:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991665; cv=none; b=egq/YQpsnXsS2IGkMY5VtXp8WiiCRwtWiA5dPc4KSqIE8qyF8jd1Ql+Qlnerp4GTLAl96kwMDnO3b0zvxbMBSysjYr43L+tSw/d0qCaZDGyQW1Hd6i3LsB0+fDfxzUin/vS5ytTywxLmMB0iPs0DUBHSIH6IJElXmLNEdQPNZ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991665; c=relaxed/simple;
	bh=cEbTkyoIGc+4FGvanw1ToTAF9VBzhvD48F9X5JgbIgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kXX/rCmcERVvo7gyvKXlOiiImxKysZk4GWATeu8Xa1+YXhAiFwRr7Lw7ALXUeF0nuJBQHgh4YhT2LI3rBQcASGBuiYiFrqY1z+dVeRMss5i3IVl3lNol+Xlyl8tsXbRwTQf4+wAfMYmUgWGX/gTdHG9w6ciojc/egNYFw0CQ3qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o5KsyktZ; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o5KsyktZ"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c88992d77dso170116eec.1
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774991661; x=1775596461; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BP58qPqPxGlCUhciznkv7Din9R33uAXsesYeu9BIBzw=;
        b=o5KsyktZ9GbRkYQNLVK28RkMj4QWcOXtdHjjqYQGEQ89C1CwJOY+P2h3dWFnW3yk0L
         AwN2w1JiFqyNDmdhmJj3cuEtPSVuA7nPVS3Skq81f4IMYCDwiZmAx4EFRmejy+k0YCR4
         +P23dD88gp7LCePYZp/3M8MBr9tB9Co+tTpKhkVRNC5GTlOBn+yQQlYuWIbwDyxWhDoX
         DWc2n0waqYrd7Uj8+0qftMhzReC1daE45C7qbqayHT2YTxyBgbXtROxuH3iqaUbKPqbZ
         Sg8wHIAvHPj0W7g9WZ4orm7+NA/wn6sCK6wIBc039fNPHTZHYgB3EgjlI/7RTvveWRJB
         fSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991661; x=1775596461;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BP58qPqPxGlCUhciznkv7Din9R33uAXsesYeu9BIBzw=;
        b=RSvpAx/84G7p+FDpFUxnv234hAtlxzI7+GukYKgGy59jpS0ep15to8lgPBEWOvYxtf
         7z6mGtybvrS1V6daiDxfIc7KHnw6aSA3LeRK29KmcA3m+66SLA0ayQwro76+4OiCE/ii
         YgmnfNYoUYCG2T+JcgCl1/UfZkAfKn1Qjetvb/DKbfFsp7vWq9Jlib1UbcwlquO4W6We
         sqoQWkUz0nMGtrs7yle1qUQTB0DH/vvHZyzSkJUt4quoAMAwH8tH1IfsB26QRNOwpZMT
         XLcUliG9sYG2FJuhdB0ySTHYRd0dYmDn5n27Hy8pNeV42ymWK95ziz34CQcxQE8Mou1X
         BVNg==
X-Forwarded-Encrypted: i=1; AJvYcCXbJkQan/i1Dg2X3kE0CWOqMePiOlw2/b6JpNb9JLWH/ubjeHocA3/rX5zI8aYsde+a/BxKonWwi8VCQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL4atCMW5W7RKOQDIckXGIG3Rp/6kJvdOEmh4DWnh7znrcYz4V
	tpnYuxIlDTHo3JjQaok8FG8Po9JC+nVG9B3OjAdRXKgTCKxEQp+Nhf8u
X-Gm-Gg: ATEYQzy5KBU3rniW0a+xgY+oTU24M6Xcl4Cs4lO6OVuFnVkQc2yMyAfCU+fmDXZlkvD
	70qcG5RxeuPiZ3uSdgS4FhZy+ANVvKW03yd/DeUyLtv4A3QE0xI1JXNObQYSdYwnHIQEncYv/z6
	mfG3tq4078h3rSxHyacnTQQypPAUNsTa++oW7ef1g/wmKwmlxdjixkLg84Uci7tCiJwEQc+ZteL
	gLTjdyds7SK7rKOVlbblnzxo/xtNl2wfOBv0zE+VQVyMSTLUcUy9OfzZYsoPB1wRRqqBHrPtEo6
	5nqNsOCOhsF4dwr6XN2LJ7Z/fMGPB7HvYbZUZjiO5uOxQIN4F+XbV4LTxAhb6sd5SNczal6yxnB
	tdoqmzowowrssonXqcvsx7N3cO68xHjwVHiMV/Xeg4IDajdEdYXw39e/52HAGf+v0gHyXcgsCxf
	N0Gh7EPy+H87OiIv+SqMYcBKmKDJwoDN6zXBlJSi05YTkKsJtTSyM+avRMzeN7oZszEYueAn1jh
	3c=
X-Received: by 2002:a05:7022:f10e:b0:12a:8122:24a9 with SMTP id a92af1059eb24-12bde008650mr2430073c88.22.1774991661386;
        Tue, 31 Mar 2026 14:14:21 -0700 (PDT)
Received: from [192.168.1.8] (177-4-161-218.user3p.v-tal.net.br. [177.4.161.218])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97cb08csm17870444c88.3.2026.03.31.14.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 14:14:21 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 31 Mar 2026 18:14:04 -0300
Subject: [PATCH v2] ALSA: aoa: i2sbus: clear stale prepared state
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260331-aoa-i2sbus-clear-stale-active-v2-1-3764ae2889a1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOyw6CMBBFf4V07ZjSEgiu/A/DYhgGGcPDtKXRE
 P5dQPcuT3Jzzl2UZyfs1SVZlOMoXqZxA3NKFHU43hmk2VgZbXJtTQk4IYjx9eyBekYHPmDPgBQ
 kMmSNrQudE2lu1eZ4Om7ldfhv1Zf9XD+Ywi7dF534MLn3cSCm++7XsvpPK6aQQlZgThotUsnX+
 4DSn2kaVLWu6webS2Hb3AAAAA==
X-Change-ID: 20260329-aoa-i2sbus-clear-stale-active-4d3b706cc0ef
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6526;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=cEbTkyoIGc+4FGvanw1ToTAF9VBzhvD48F9X5JgbIgU=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlnLFU7quq+64lsub+v5Efv3SXNjJbfvlywyZl1w2XvT
 qPskm7djlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZhI5FVGhqeX3GLnHpsxTfYF
 c0DFpQjOiFxGueJDc5Yc9N2/X1lqkz4jw1QTy3O+6T8r5e1eHJyyobzJ/OCXjV+KzIraWB/bL7o
 uygoA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The i2sbus PCM code uses pi->active to constrain the sibling stream to
an already prepared duplex format and rate in i2sbus_pcm_open().

That state is set from i2sbus_pcm_prepare(), but the current code only
clears it on close. As a result, the sibling stream can inherit stale
constraints after the prepared state has been torn down.

Clear pi->active when hw_params() or hw_free() tears down the prepared
state, and set it again only after prepare succeeds.

Replace the stale FIXME in the duplex constraint comment with a description
of the current driver behavior: i2sbus still programs a single shared
transport configuration for both directions, so mixed formats are not
supported in duplex mode.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604010125.AvkWBYKI-lkp@intel.com/
Fixes: f3d9478b2ce4 ("[ALSA] snd-aoa: add snd-aoa")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v2:
- Drop the extra clear of pi->active at the beginning of i2sbus_pcm_prepare()
- Keep the state reset in hw_params() and hw_free() only.
- Fix the newly added .hw_params callbacks to use the proper ALSA prototype
  with struct snd_pcm_hw_params *params, addressing the kernel test robot
  build failure.
- Update the changelog to match the reduced scope of the fix.
- Link to v1: https://patch.msgid.link/20260330-aoa-i2sbus-clear-stale-active-v1-1-47a6c0a3ac9e@gmail.com
---
 sound/aoa/soundbus/i2sbus/pcm.c | 55 ++++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 11 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/pcm.c b/sound/aoa/soundbus/i2sbus/pcm.c
index 97c807e67d56..63004ece94f9 100644
--- a/sound/aoa/soundbus/i2sbus/pcm.c
+++ b/sound/aoa/soundbus/i2sbus/pcm.c
@@ -165,17 +165,16 @@ static int i2sbus_pcm_open(struct i2sbus_dev *i2sdev, int in)
 	 * currently in use (if any). */
 	hw->rate_min = 5512;
 	hw->rate_max = 192000;
-	/* if the other stream is active, then we can only
-	 * support what it is currently using.
-	 * FIXME: I lied. This comment is wrong. We can support
-	 * anything that works with the same serial format, ie.
-	 * when recording 24 bit sound we can well play 16 bit
-	 * sound at the same time iff using the same transfer mode.
+	/* If the other stream is already prepared, keep this stream
+	 * on the same duplex format and rate.
+	 *
+	 * i2sbus_pcm_prepare() still programs one shared transport
+	 * configuration for both directions, so mixed duplex formats
+	 * are not supported here.
 	 */
 	if (other->active) {
-		/* FIXME: is this guaranteed by the alsa api? */
 		hw->formats &= pcm_format_to_bits(i2sdev->format);
-		/* see above, restrict rates to the one we already have */
+		/* Restrict rates to the one already in use. */
 		hw->rate_min = i2sdev->rate;
 		hw->rate_max = i2sdev->rate;
 	}
@@ -283,6 +282,23 @@ void i2sbus_wait_for_stop_both(struct i2sbus_dev *i2sdev)
 }
 #endif
 
+static void i2sbus_pcm_clear_active(struct i2sbus_dev *i2sdev, int in)
+{
+	struct pcm_info *pi;
+
+	guard(mutex)(&i2sdev->lock);
+
+	get_pcm_info(i2sdev, in, &pi, NULL);
+	pi->active = 0;
+}
+
+static inline int i2sbus_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params, int in)
+{
+	i2sbus_pcm_clear_active(snd_pcm_substream_chip(substream), in);
+	return 0;
+}
+
 static inline int i2sbus_hw_free(struct snd_pcm_substream *substream, int in)
 {
 	struct i2sbus_dev *i2sdev = snd_pcm_substream_chip(substream);
@@ -291,14 +307,27 @@ static inline int i2sbus_hw_free(struct snd_pcm_substream *substream, int in)
 	get_pcm_info(i2sdev, in, &pi, NULL);
 	if (pi->dbdma_ring.stopping)
 		i2sbus_wait_for_stop(i2sdev, pi);
+	i2sbus_pcm_clear_active(i2sdev, in);
 	return 0;
 }
 
+static int i2sbus_playback_hw_params(struct snd_pcm_substream *substream,
+				     struct snd_pcm_hw_params *params)
+{
+	return i2sbus_hw_params(substream, params, 0);
+}
+
 static int i2sbus_playback_hw_free(struct snd_pcm_substream *substream)
 {
 	return i2sbus_hw_free(substream, 0);
 }
 
+static int i2sbus_record_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	return i2sbus_hw_params(substream, params, 1);
+}
+
 static int i2sbus_record_hw_free(struct snd_pcm_substream *substream)
 {
 	return i2sbus_hw_free(substream, 1);
@@ -335,7 +364,6 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 		return -EINVAL;
 
 	runtime = pi->substream->runtime;
-	pi->active = 1;
 	if (other->active &&
 	    ((i2sdev->format != runtime->format)
 	     || (i2sdev->rate != runtime->rate)))
@@ -444,9 +472,11 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 
 	/* early exit if already programmed correctly */
 	/* not locking these is fine since we touch them only in this function */
-	if (in_le32(&i2sdev->intfregs->serial_format) == sfr
-	 && in_le32(&i2sdev->intfregs->data_word_sizes) == dws)
+	if (in_le32(&i2sdev->intfregs->serial_format) == sfr &&
+	    in_le32(&i2sdev->intfregs->data_word_sizes) == dws) {
+		pi->active = 1;
 		return 0;
+	}
 
 	/* let's notify the codecs about clocks going away.
 	 * For now we only do mastering on the i2s cell... */
@@ -484,6 +514,7 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 		if (cii->codec->switch_clock)
 			cii->codec->switch_clock(cii, CLOCK_SWITCH_SLAVE);
 
+	pi->active = 1;
 	return 0;
 }
 
@@ -728,6 +759,7 @@ static snd_pcm_uframes_t i2sbus_playback_pointer(struct snd_pcm_substream
 static const struct snd_pcm_ops i2sbus_playback_ops = {
 	.open =		i2sbus_playback_open,
 	.close =	i2sbus_playback_close,
+	.hw_params =	i2sbus_playback_hw_params,
 	.hw_free =	i2sbus_playback_hw_free,
 	.prepare =	i2sbus_playback_prepare,
 	.trigger =	i2sbus_playback_trigger,
@@ -796,6 +828,7 @@ static snd_pcm_uframes_t i2sbus_record_pointer(struct snd_pcm_substream
 static const struct snd_pcm_ops i2sbus_record_ops = {
 	.open =		i2sbus_record_open,
 	.close =	i2sbus_record_close,
+	.hw_params =	i2sbus_record_hw_params,
 	.hw_free =	i2sbus_record_hw_free,
 	.prepare =	i2sbus_record_prepare,
 	.trigger =	i2sbus_record_trigger,

---
base-commit: 5a8ba15bcbf0cd70cc89d1e1a3d4037b2ab5ccdd
change-id: 20260329-aoa-i2sbus-clear-stale-active-4d3b706cc0ef

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

