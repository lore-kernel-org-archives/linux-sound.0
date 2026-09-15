Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A64C3B0595
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461918; cv=none; b=kkXWAmSIth5xfZRT86+yT3A+YUNKRKR4g+fBbV1U/nhYYEfurdDs6t9XDZUcoqvuzRRebAgKsU3rxflLGK/QE7gbDYHUFp1z+QKZvTInuqwI8ZJoVAQJto4SsuM7lOK8uqlp8E1JGGQsSm/J2p9Qupps8hPWKF2WT6rBmFiRarM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461918; c=relaxed/simple;
	bh=voXUBxTQFlhO/ruRKWE/wANERiCFiYTPDr8M0VRsiyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o32GQFbBATa9Xu7+chprgyQMNUbBkwqikFpHchY1e0ahY5EzIgK7SzDH9wFvSYG96q6mpw6tNRlFX6FrXELfLElQ+yT4RpQAbtDLe7NsZDDSJ01gCZNjThfgjjCZZ+qNFTjs8sThNKncErHfgAEr5p3jXo11ZqEAXj42KuIq9+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgIBQw7N; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgIBQw7N"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso2985852a91.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461915; x=1790066715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//NjZ5Gv6gZcU0sp0wzzMfVpLXREGk7SX2zQqubPTP4=;
        b=XgIBQw7NrQdfdiNqgLQyZ6t0FblRM20k5icslBJifLr1P1d9G2JcQKURHIvu4AHmt1
         1m1XdltiK3clBbP/7QkwlLduV3LwmqMTdaVWXOjVNKjTWpQfmhtBWtqo8ZtsIws+abPn
         g5Xe86Z5QyqYBEOidBUpixP1+Cn31xBieIRt48IKuErZRThHM4D2wcQ0zmrIi3pJPKY5
         ymJCU7itIPvUxJCcsfyyQVBcQahFF6doMn8BjMd/XInYazGlt00ROl46E+wAL3ULScGX
         3jPChS/D+h3zxJC56FVPdXRRYx+rBV9za6hkBOgkiQKTpbw0WIoBGPfGuqSuZeO/LSH/
         q8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461915; x=1790066715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=//NjZ5Gv6gZcU0sp0wzzMfVpLXREGk7SX2zQqubPTP4=;
        b=G3kqsrWjfXGtfHnQrD7W49CFN8tP+cuhdvssuHIswsQ1PAwkr3AfaRS4vimoqhZMFN
         1hpP8GBsr6H0xJSzaxuEPjLS9dWttyj0NeBYaRy2uDyZkl98M6rUzmhfqclkmNIQKit2
         mo2c39ycSoWXcgqPVuHj6pjaOh4+NMclOxscaruHLF4prKkPbo3yEfP4PAnUMhrSDxsx
         Fk5VFVVnoqm6v7ZEePgVvMHoXrbY8qKHlBgbHEUtMRqE7XKLjXK+68U4sxttzMtQPyGq
         kmplRwvMmdRgxTH1HBholngGAXsqRUn+jj8ppMPjUezufrswdghuR0olJlO+D9dcOfzU
         RY5Q==
X-Gm-Message-State: AFuF++lfRwfwlMwgEZlynLHrA1RDZn1q33e/713T+7wfxpwWs3FJov78
	BBdbExKEauLaLjQ8jDnBXJ8jkT3WmnFubwVO9Hz5C2ZYsskrHBjo/Zb5
X-Gm-Gg: AYBFou2M+NYcJme4Cbtl1X0yc9Ts5JlK5xs1lcdMypXdgomz/mbcgJuojPxFsRdk0iX
	ULgeKh3VbzcZwk3ImNUZBfE070kc2HgKCEKr9zKYTMlIpc6nIIwomOTHGabhd9trQK4gMDPkPuF
	K38dbsewKz6TBNwOd1SQjStRVIYKcJDFCBQgnOeLsmZ7D0OOMmmStOVoacowmm1jNEv/bbLLGHZ
	WYVnYC63O4XBx4mg4z7t7cPk/Yd47mU7VgFfjibtIOwEo5+MHsxkYaJihcevz1d0v2EbG0JIODT
	+9Ram5u8xlxFSTv7q2Ziak4RCHXximGqTaBAqwdZe1hFDo1o0mcxwqLGoVu+m8QM8DTVvgy14c5
	iyfoC+4HwWNFztJ8GKjb7TWvVI2dw11ZnAWUMTh/8WPgi1e1pFViRyKq+e08GC+4IabzJ43Rqm9
	CJHHXl9uGifB2NpriBO8ZzxMZeRR/gOHeFdnlzuSPa16kOBmbhl9mY3wKSVckuNqgE7cTaTz/Ha
	u6FS+eCmqF6EoRxIeu9Tcc9
X-Received: by 2002:a17:90a:d610:b0:39d:f06f:79be with SMTP id 98e67ed59e1d1-39df06f80c8mr13101038a91.15.1789461914624;
        Tue, 15 Sep 2026 01:45:14 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:14 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 16/23] ALSA: echoaudio: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:17 +0530
Message-ID: <20260915084424.1007757-17-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/echoaudio/echoaudio.c | 4 ++--
 sound/pci/echoaudio/echoaudio.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 214d68657707..8b4637231deb 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -270,7 +270,7 @@ static int pcm_open(struct snd_pcm_substream *substream,
 		return -ENOMEM;
 	pipe->index = -1;		/* Not configured yet */
 
-	/* Set up hw capabilities and contraints */
+	/* Set up hw capabilities and constraints */
 	memcpy(&pipe->hw, &pcm_hardware_skel, sizeof(struct snd_pcm_hardware));
 	dev_dbg(chip->card->dev, "max_channels=%d\n", max_channels);
 	pipe->constr.list = channels_list;
@@ -1720,7 +1720,7 @@ static const struct snd_kcontrol_new snd_echo_vumeters = {
 
 
 
-/*** Channels info - it exports informations about the number of channels ***/
+/*** Channels info - it exports information about the number of channels ***/
 static int snd_echo_channels_info_info(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_info *uinfo)
 {
diff --git a/sound/pci/echoaudio/echoaudio.h b/sound/pci/echoaudio/echoaudio.h
index 7a5744bf3155..ac4507b7cc78 100644
--- a/sound/pci/echoaudio/echoaudio.h
+++ b/sound/pci/echoaudio/echoaudio.h
@@ -394,8 +394,8 @@ struct echoaudio {
 
 	u16 digital_modes;		/* Bitmask of supported modes
 					 * (see ECHOCAPS_HAS_DIGITAL_MODE_*) */
-	u16 input_clock_types;		/* Suppoted input clock types */
-	u16 output_clock_types;		/* Suppoted output clock types -
+	u16 input_clock_types;		/* Supported input clock types */
+	u16 output_clock_types;		/* Supported output clock types -
 					 * Layla20 only */
 	u16 device_id, subdevice_id;
 	u16 *dsp_code;			/* Current DSP code loaded,
-- 
2.48.1

