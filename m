Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C3A4A4985
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965756; cv=none; b=FBVqxnm9T7MqGT7AJH6kOL+iAtL8J2QSDFRSHl2PHV/x//7hDncTDahYyM+V2YUcQnu9yHDwe6keMcRJHsHVPbzZxv25+6S62aFSQOHugwfU5lAFRENlllG2Aim8G1I/0+myc6Qdcy+irjWkQSLVYbCMEnhAyRMjXIE/pP/Uu+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965756; c=relaxed/simple;
	bh=zEQPV2lpDdrKh8MYrhmPIHVTn/gyRcVcSODlK+MQT+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BEc3z3NgpjiV+nzH3ParD4Ku9EcB7LZt3fusokZdZZrE9sXG+lWA0HdKX6JVMFwjcs0UmhhFd1uYbjSvbNhopoNkCt0JRGp5BFrg2v326oFU26WN3SxhDucykdsymP0bopkESDgKAZSlB3BEhXCV4cD/d+hBibkX+S14Y34neoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtIgUhR0; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtIgUhR0"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a706146559so2324594a91.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 01:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791965754; x=1792570554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AfArBK3+cusn3HmvPaqcUDFD2wL+m3gUZKnXKnxPxrE=;
        b=UtIgUhR0JCgsRkozU2ohGmvQWGv24rRrhxmQZR9KKgMRcB4pnpUyytIkEBlHaYkYw+
         +D5fqGiytoq1DAYIoL5AfNlmE3qEWMWYYpsLBixfraWreW3Ff5eWW86tbE8fJ4HYiwG+
         kiBPQtalZwN8vfac8jHT57cLFmOd/bv1VF92rIxs9YzX/oZAP9zw+bVJhkPpR6rjtoGI
         OfhzfyVWFvDGzaEGMF5z3N7e7JeHYC0VSR2ika2aIBHO4h2zo71dcUeBcDSjS8zpPvTc
         dN7PGerP3fyg2zM5KO1j4O/BGblTslCk2+m9F3JVw8kOvbrm3xNUyyI7Ho71Agl1AZK4
         igmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791965754; x=1792570554;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AfArBK3+cusn3HmvPaqcUDFD2wL+m3gUZKnXKnxPxrE=;
        b=dhkOeTYkb/tgmm5ixQkFcXSbWgfbcTYje9cfl+grNGWXoHFN28okbQVrzNO0FVoXEb
         FuikwqQE2QQ8YVmpTe3tnPHXfDfa6XWcc0yB0llLgvH1l0FeTmUnBKzF9Nk5RJUiqMlA
         Y/PLTsYxo5GY2EaflyDYfIYl7f7S1LlFp778WFENZ9J/M+xqWScYNcajRtEVrbLo13lB
         WfHLChQALGu8ekofS/Zh4CGz6c3m0VHTTaOnHEiV+u7mRItI0dKgh4vfBoFW1dJzRj8K
         Z96OJ9/It+H73k3c1Wao1Up6LdWYpCgZf9Ldq+ratQ6F5RK3Cs4Lwa/vSS05TYl1p5ux
         I89A==
X-Gm-Message-State: AFq9FYL7TsY9K9exbaIhfxzBa4+YBf4qBmS4hGXMA/DqwHN+ptzxqvpu
	GxnZguZsysFiZxLw9tLT4TWDiduYMrvxHirGKhltrlJgXfn0TGgYhkXf
X-Gm-Gg: AYBFou3ArTy5IpuuVL5VNQR0W51lKn3UsMIAtQvPQuUWSh1Nrewf0b1/RpRGgDx2Ddq
	ubQnhenlh1Czl4MDO58mSMeqAro8iGL5BrIHZCPZ3pQMxUZNqA862+fp+fjOFuwHu57tx4eqrM8
	KRAvHlBcsPSO224DaDKeGxdqcII0BoGl+M8zv+9yQhr40avYE7PaudfMRtfUN6mEjFYZqJG+kxZ
	X22rmh6yJqZAiIKsF6kMwvjznI3LOgeNQ1QyhELsuvHdyCMgqA5/kJot2YDuapmUC/H6Ui5Xvzu
	VjuYzcqPciIj+UvFvjsmvBa9WCvV+9igW3UEaoi8e7LbOBy+sC3OHGOCI4F1NqRrXML6Z+iQmF8
	VcjQPwT47B7QhjZaFXH7dAPl68jaUgC5Ze8bA+ylhjfLkmkiEo8+ffThdRyFvduXK/kecQUrjKu
	YfTgBAywTNpZL6AH5dAhspOm7oNkH+38ZRAbB3rnJ+23bpre+V06igXhx9TUdM2LdX6SutZUe9E
	6j8+7yLXzbvX9T8NwCGejBO+nRBEik94fQiG3etVh3BIfya0RPMlds7+Fj6bvuXVGw9eXj2nonQ
	81Y/2Z8Qwt209ersnD1wA7nZog==
X-Received: by 2002:a17:90b:50:b0:3a8:272a:a328 with SMTP id 98e67ed59e1d1-3ab3a33dc22mr12692532a91.9.1791965753741;
        Wed, 14 Oct 2026 01:15:53 -0700 (PDT)
Received: from localhost.localdomain ([121.137.86.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac752d590csm1628301a91.2.2026.10.14.01.15.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 01:15:52 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH v2 2/2] ALSA: pcm: refresh capture pointers before drain
Date: Wed, 14 Oct 2026 17:15:48 +0900
Message-ID: <rfc-v2-core-capture-drain-2.2eddd58a796e497f@gmail.com>
In-Reply-To: <rfc-v2-core-capture-drain-0.2eddd58a796e497f@gmail.com>
References: <rfc-v2-core-capture-drain-0.2eddd58a796e497f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refresh active capture pointers before the drain transition so the final
captured tail is accounted before reads finish.

Keep the link rwsem held through pointer refresh and the drain action.
Release the initiating stream lock while refreshing, lock each running
capture member only while updating its pointer, then reacquire the
initiating lock before the state transition. Pair the rwsem on every
exit and retain the existing error cleanup path.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/core/pcm_native.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index defbb2977efe..5375f8f931d9 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2176,14 +2176,32 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 	} else if (substream->f_flags & O_NONBLOCK)
 		nonblock = 1;
 
+	/* Keep linked runtimes alive until the initial drain action completes. */
+	down_read(&snd_pcm_link_rwsem);
 	snd_pcm_stream_lock_irq(substream);
-	/* resume pause */
+	/* Resume before refreshing capture positions. */
 	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
 		snd_pcm_pause(substream, false);
+	snd_pcm_stream_unlock_irq(substream);
+
+	/* A pointer error may stop the group: hold only this member's lock. */
+	snd_pcm_group_for_each_entry(s, substream) {
+		if (s->stream != SNDRV_PCM_STREAM_CAPTURE)
+			continue;
+		snd_pcm_stream_lock_irq(s);
+		if (s->runtime->state == SNDRV_PCM_STATE_RUNNING)
+			result = snd_pcm_update_hw_ptr(s);
+		snd_pcm_stream_unlock_irq(s);
+		if (result < 0)
+			break;
+	}
 
-	/* pre-start/stop - all running streams are changed to DRAINING state */
-	result = snd_pcm_action(&snd_pcm_action_drain_init, substream,
-				ACTION_ARG_IGNORE);
+	snd_pcm_stream_lock_irq(substream);
+	/* Change the stable group to DRAINING only after all refreshes. */
+	if (result >= 0)
+		result = snd_pcm_action(&snd_pcm_action_drain_init,
+					substream, ACTION_ARG_IGNORE);
+	up_read(&snd_pcm_link_rwsem);
 	if (result < 0)
 		goto unlock;
 	/* in non-blocking, we don't wait in ioctl but let caller poll */
