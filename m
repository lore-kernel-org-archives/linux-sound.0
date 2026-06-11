Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6D43E5EFF
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179181; cv=none; b=sxRmD47RDC8Q7XguToj+i6efypOiVQ+yM9tRwUQwIgna96Sm7MEciokZqIIZYqpklTeVQdhdFTtGN74XHVHS00vBPV6fMDdR2gPehPZmA0DMDlonXn9u6nsALk0KsdPF5rkThB5KhjJsHC7ins66lD/o78yqmmrkkuSJvaMUgjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179181; c=relaxed/simple;
	bh=BmAR43CX5f431iJb5qoy7czpWLPJm3lXWUw9CAb6xkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3AIpfm+bXowxI4Vf0Skud4RpL1wKz9izNmblSimZ8OdakqKV1IppK8DsF0dV48JqEDB9avzWZ5ooQS6CmxYm8c9qP5modNLSkX6XFijtMijW/0PZRw4gKrd5eMmE/4s0RHBhGYnGEupi+9iJQGD2246YRVcU6ei0vlGsaOtZSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oAtrOk71; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAtrOk71"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so6585373a91.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179178; x=1781783978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pM2zzbB0Km9C7xBAIlu4EKjtbpwzhDFVg4fmvJPFsRg=;
        b=oAtrOk71C2oVLbOUsi++B2jfPBi+CO/egcJrbAnyjIOlspKBB9MgQSkid5rEqfk7pc
         0pk2w3HzPqMY57d42QuZHLpksIpGaQ4f0xww2GQPQfMd4P9MYsiJjiqVEbrWv+4qJB/G
         /9PTzGxBZQrS8Vib7C2WDavNxqGeUwqa/cNY5AjswGfBoKQ9/0KG0UHXNoGuzN2KXGEe
         zikY37z3Omjg8jbo+EIxLhUdo3hUwESdZaZvJEwUzwqO0xjgl3u3dJluzmsR339WT0GS
         V6LkX2rTZfIQ+doXHHGpuo8syZHHGcnMByrx0wx0dAYWi9HNbmxRukfeWi2lImpqXPff
         pZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179178; x=1781783978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pM2zzbB0Km9C7xBAIlu4EKjtbpwzhDFVg4fmvJPFsRg=;
        b=OuOHxsbhhb0+5Xvt4LmTQpEDXn6cYyi3tMmbTfg0hy0xpJmRoWtXuVKMmvXGRUpVpV
         AUJGLoyqG+0cbG53iXtAWCdM7dcCJ3KamAruLbNDx3Vk+VfB34Tuk5FJ7M2ZQTiz0nGc
         vdkEqjyKHVosXo7rEuFOthr4Fsavb8BbXxt9+9ebVxepruxbv2U5RxJYx0SSkWRJ3ASM
         WkqlOkjNowvCgclOq0yWmtbWB8nz9uLyEZgFTFEDSPmVRcczuyk9xP1GV8yNfU/mcNOI
         PBXGrb7M8WTnpJ6TR6PckLNwAlxhYV/Ld/vUoibkihjrpRIOSUFcKVO+P2Z4V0Qq/umC
         EOMA==
X-Forwarded-Encrypted: i=1; AFNElJ9jv4ydhJp2aRlhZfhTqJ1MJ8HKKysijfrWf52ucnPUxOfJ67/PjZWuAZayGf7hUoXrqDqF0TXBRZAb0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR1+SAoze75kfV/FeZsSd0SGME7p7PNz3+q32u2qe+el3Uv3+N
	uuyUSH2/u2VF8L9cdD6R5AiqkMvXpmZPcw07TDoMMDpBQHBPRnmqAtAP
X-Gm-Gg: Acq92OEDgC1fSQfkW2aHSU2QRTGmTk0eLWUi0rQEd1Qz0N6lu/ZaW8gWmimPslBslcV
	Id5aehGmBoOS/YwDPZI5o1neBwHrC0o8OU4wAGSTQ7eWkhIuG8fSEkI7lLwvJyxmMc+Tuww0Wf4
	QxRTMmptoVW4SX0xOPn5XqMMFdySJY6bdRNQ5l3KrteVvFPtgyEKd3Tv1CMJicKebMFa9Egv6H1
	FbfOuptGEWtjZ3ArPWK8d8yzJVr1CiPbAJ9TBxOQ5e5jLnjj1jFwzYTaTYF2CR/hNNjQLfP0rhu
	izL7enBtgTITttPpbA9+L8oKWGtK5r97g8B0+9ZRJMsHorK0GkJBOZaNufZmxu3AAtEZRtwL5f6
	OxzvXcItjhf8cdprPc6rReIJop1PitKOq7ETMm6KlMFH1Fz/rrh9xZqy7LTPP8r+Rs6FKUX++xq
	a1uN8L6U9rHXhd/gRvJEDyh5WXRzkQcK+eIptP36RlWJHCiLBRqHQbR9zE3WVZwiGnGb7Lx6PuY
	El5H7E=
X-Received: by 2002:a17:90b:1e04:b0:36d:b662:708e with SMTP id 98e67ed59e1d1-3779d7a143emr2730317a91.9.1781179178171;
        Thu, 11 Jun 2026 04:59:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.04.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:59:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/20] ASoC: Intel: avs: pcm: Use guard() for mutex & spin locks
Date: Thu, 11 Jun 2026 18:58:46 +0700
Message-ID: <20260611115901.80438-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611115901.80438-1-phucduc.bui@gmail.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/avs/pcm.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 797b9c9163b4..931b74c60a36 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -864,7 +864,6 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 	struct avs_dma_data *data;
 	struct hdac_ext_stream *host_stream;
 	struct hdac_bus *bus;
-	unsigned long flags;
 	int ret = 0;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
@@ -878,9 +877,8 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		spin_lock_irqsave(&bus->reg_lock, flags);
-		avs_hda_stream_start(bus, host_stream);
-		spin_unlock_irqrestore(&bus->reg_lock, flags);
+		scoped_guard(spinlock_irqsave, &bus->reg_lock)
+			avs_hda_stream_start(bus, host_stream);
 
 		/* Timeout on DRSM poll shall not stop the resume so ignore the result. */
 		if (cmd == SNDRV_PCM_TRIGGER_RESUME)
@@ -908,9 +906,8 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 		if (ret < 0)
 			dev_err(dai->dev, "pause FE path failed: %d\n", ret);
 
-		spin_lock_irqsave(&bus->reg_lock, flags);
-		avs_hda_stream_stop(bus, host_stream);
-		spin_unlock_irqrestore(&bus->reg_lock, flags);
+		scoped_guard(spinlock_irqsave, &bus->reg_lock)
+			avs_hda_stream_stop(bus, host_stream);
 
 		ret = avs_path_reset(data->path);
 		if (ret < 0)
@@ -1052,9 +1049,8 @@ static int avs_component_probe(struct snd_soc_component *component)
 	debugfs_create_file("topology_name", 0444, component->debugfs_root, component,
 			    &topology_name_fops);
 
-	mutex_lock(&adev->comp_list_mutex);
-	list_add_tail(&acomp->node, &adev->comp_list);
-	mutex_unlock(&adev->comp_list_mutex);
+	scoped_guard(mutex, &adev->comp_list_mutex)
+		list_add_tail(&acomp->node, &adev->comp_list);
 
 	return 0;
 
@@ -1072,9 +1068,8 @@ static void avs_component_remove(struct snd_soc_component *component)
 
 	mach = dev_get_platdata(component->card->dev);
 
-	mutex_lock(&adev->comp_list_mutex);
-	list_del(&acomp->node);
-	mutex_unlock(&adev->comp_list_mutex);
+	scoped_guard(mutex, &adev->comp_list_mutex)
+		list_del(&acomp->node);
 
 	if (mach->tplg_filename) {
 		ret = avs_remove_topology(component);
-- 
2.43.0

