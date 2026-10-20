Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463373;
	b=R2FbygW9xZwDLMtfDrm+THSwUbehw7k+eU5dHWbProeTLpwIRtPM9CgZ/MClIRjb85hp
	 IDLw5Gsp+7Nc9IPgLk0DToAiK+k0XugeLZJ1ga3KCK6oK7v6xvsyqHT006n4T94Y1d6nB
	 G1vTsGTYEQWg2DMxkC4Aq6S6ic/rqI/qKxtOloUpGS4j5lLBek9sQXtDughtC44d49+m7
	 wGm94ROzN4zowX/7N2g8/vUJ/ax6FN8JqQ/8BycgqbYdN6MV1/khoFQzy6zEQDgmuoBG7
	 2rMKlMq1DCwVR8l0f3JK8hHb7nKBfZsWk749aL07wFd2yG4LIGr175nwa7v9GSM2CKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hxsyEcelzfwAgBR4zNN5oG01/wpUWW34zbIR80jT05k=;
	b=MPMIuVYufNzV+tyTEsO0mb82SxgXVQABQxRsAIrONE1CC8w7SwBpCfvwkNAZ31gFhHao
	 uya2tfja+0r39adxgQ9i2C5x201DQzC5O2AQd7UkQEAXfDhTuouH2eJuqb2WB6BuLeMYR
	 oqP8/9QNLGqAD/icTZs9qcYb4DXM+tyX2F0uNKx1wN2IBWne6UM8wSnQ74LYXzdJ9dUr+
	 Kk6U9UdvLDF2K9WgtL4WMphPby+S1aa9sAiMlP3F0AkCNtg8BUCzjXHCbmoMzO2CAgbZd
	 eQqUh8ZKYYBp+H1R4ukIAcJwtNhzViMjMP1AIwIlTiJIvjPfJ0I0xACJTXQYnCPGfDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kncVHfTR;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974AB606A319
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 02:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 974AB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kncVHfTR
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1604253a91.1
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 19:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792463372; x=1793068172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hxsyEcelzfwAgBR4zNN5oG01/wpUWW34zbIR80jT05k=;
        b=kncVHfTRKCcj1KhIOQ8ENNpt4TZYhM2PX1iQq2AMonZkG8eiNDHgIq4Clu4Wt92HUi
         zxIZIe3WafztLTtIxsRGDvynWF7M7uBl2+BBwgQXOaVQlxvVy1/qmPKHCH9ck1ob5Kow
         Bp1HfBr62bmeTRuiibfA9eB8VXFBlvLuQ7AF2Y5VgCZ+zB+zmGhWFae2QBBlDUUnEXUw
         FwSPL9F1tZVC/UggYKognImwM1j+wrPaoPMJ+mUCeGEnXfiw5tcvaVuJjZ60xyNW1tiL
         NQF6ruKDkdkfAqZSLVcbec9Bt3gMDqE6LqG+1qI5alkn4abHFlp4S9/4dc5PpJQ7t+7Y
         mN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792463372; x=1793068172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxsyEcelzfwAgBR4zNN5oG01/wpUWW34zbIR80jT05k=;
        b=fJCYb0cvYPIjDU6u2PET1AF36fIgwWLNZDk4PjGPfPl4KkxlJ7AhWvdsGn++O5rRlv
         TEM1RKiF3I9Naq2nXZpaWyZjtO6+iHrtGgqpa8hWcl5zfxdjxKKF6u+OtW7FplTKpSy3
         kwM/nmKUNrMJ7vg6wwJ9wWY0GE+73DsO4IegS6jyAa0Xbs715dKZWJ+pnjOKko747dXd
         5lI+XtbJFqzhHa97g5j6qOcyMjVPfWZdhcTxg8q8qgp/WmhCSo8WUFWNExxygRqxwGtT
         H4P1kUyUQZAYwiecAr4SRoB397fulKX6TLFMW9SiuDJW8GbgngYLhDFKnX+eH64E4/Nr
         V2Pg==
X-Gm-Message-State: AFq9FYLsOxyNcRNMFGHDnZaGIRZKJv3YFCr0HwX0ifTmeYLxeAVbmRco
	0NGGWFLa/ajSdYeri/5jeTMB+BXvBFHvA7i++dn0yzDmHc6ZThPI6b4H
X-Gm-Gg: AYBFou1sCdydJuwF+WDOD8oFehBJx5zscAtzdmzXmdAxl0gqckWd9AMmBeXNjwQzDZS
	XHmUnsc1hVKEImNeJpiL859D3r9VmCr7wY3USQBkHi7jHcEpZ4AdOMAM94eBji2z34IT9E0MKrA
	1eocLhI4VHFHv+F9/I7A7DOY0ytJOD5MdzhkZWCNmPVQ/9U5YnFbgusJJ1Ht5ixK3Szz4gGymES
	XnFSA1jjzh39TvmoFhCboFtlP5SbCLt7AUtoD96Lf7CuvO/Uo3DyC47KhIhc18DWDjdT4hpRi5v
	EgtWmZqXS5xFQVBnY9JvfUx/lmMearq4DpBdeS2ZorUx0nitvYJvmpK0NyT3z0uMOD/UivWW3Ni
	BxaWpokQ0AtdXacvXXr5lM28EgsUZrCp3SoDC0IHCBJPbGPrkFYjq/Q1QREPnzV24xkLS3DyJQ/
	uQoo5GBVIMrOHSa4QQ5hXeotfTruQw5hrFmgJk1x9xpdlWaECULc+Ob8/8M2/itL5dZA==
X-Received: by 2002:a17:90b:2ec3:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3acef51e29dmr7744767a91.42.1792463371828;
        Mon, 19 Oct 2026 19:29:31 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5c72df56sm1973136a91.0.2026.10.19.19.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:29:29 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: pcm: Drain proc writers before freeing preallocated buffers
Date: Tue, 20 Oct 2026 10:29:24 +0800
Message-Id: <pm-pmb-2439c851f82c443c3600-v4-9e7df0ea42c36afe6171@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The prealloc proc write callback changes a substream's DMA buffer under
pcm->open_mutex. Final PCM cleanup frees that buffer without the mutex,
before removing the stream proc entries. A pending callback can therefore
race the free or allocate a replacement after the final buffer cleanup.

This is reachable through codec-only HDA sysfs unbind while the card
remains registered. With CONFIG_SND_VERBOSE_PROCFS, HDA creates writable
prealloc files with a nonzero maximum. Buffer a valid size different from
the current preallocation and leave the file open, without a PCM runtime.
Cleanup reaches snd_pcm_free() through hda_codec_driver_remove(),
snd_hda_codec_cleanup_for_unbind(), codec_release_pcms() and
snd_device_free(). The proc file pins the card module, not a codec PCM
reference, so it does not prevent this component cleanup.

The text write is applied at file release, rather than by write(2).
A close in the gap can leave a replacement buffer behind:

  PCM component cleanup           prealloc file close
  ---------------------           -------------------
  snd_pcm_free()
    free preallocated buffers
                                  snd_info_text_entry_release()
                                    snd_pcm_lib_preallocate_proc_write()
                                      allocate replacement buffer
                                      replace dma_buffer
    snd_pcm_free_stream()
      remove and drain proc files
      free substream

The same late allocation can occur without a concurrent close: the later
proc rundown itself invokes the buffered write callback. In either case,
there is no final buffer free after the callback installs its replacement.

Move each substream's preallocation free into snd_pcm_free_stream(),
after snd_pcm_stream_proc_done() has removed the proc entries and drained
their callbacks. Keep rundown outside open_mutex, which the callback needs
to finish. Both stream directions and construction-error cleanup still
free their preallocations before destroying the substreams.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/core/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 1e4e0ecb3dbd..ce577c303a1c 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -825,6 +825,7 @@ static void snd_pcm_free_stream(struct snd_pcm_str * pstr)
 	substream = pstr->substream;
 	while (substream) {
 		substream_next = substream->next;
+		snd_pcm_lib_preallocate_free(substream);
 		snd_pcm_timer_done(substream);
 		kfree(substream);
 		substream = substream_next;
@@ -861,7 +862,6 @@ static int snd_pcm_free(struct snd_pcm *pcm)
 	}
 	if (pcm->private_free)
 		pcm->private_free(pcm);
-	snd_pcm_lib_preallocate_free_for_all(pcm);
 	snd_pcm_free_stream(&pcm->streams[SNDRV_PCM_STREAM_PLAYBACK]);
 	snd_pcm_free_stream(&pcm->streams[SNDRV_PCM_STREAM_CAPTURE]);
 	kfree(pcm);
-- 
2.43.0

