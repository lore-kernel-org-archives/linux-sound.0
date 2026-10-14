Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0795E37B036
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 03:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948665; cv=none; b=dEprL4AY4P5ENQpUiZn3qv4SLiFqx0YOW+r9Uc4bUA08tuVP2XgrooBFugRrBifCpkRPoVun3IuXW7QYjYx4jZE4IpHkawgk+dKMGebdWNkiBxsgGmPLD+TtJW5ggLWiQALrnuCM133bpWLW0OMHhOOH2dSw5JLf2U9BBaFWgvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948665; c=relaxed/simple;
	bh=a1zoB4jM644DlD+AKW5E5XGLIlgEJJCaSSnkZ8z3L5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TODGe0FZZWK+7OwZQotcneApmjXudSIzDWCJeOq0AYCBKENF2UFHl9L10nwWmtc0QTrGIJcHgb/t5O4xawQ4ffnWq+n4yco/fwo/TX0OsRF7avGaVVgCD0uYLrtjvpWKYkYtbjJPT9QCPPeQ1kBh3QIo5P1vGmuyVIPlE0Byf14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+dh+Yv3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+dh+Yv3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8455755f3so19076245ad.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 20:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791948663; x=1792553463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5DeSorT59zvpBPNILOX/JRE/fILGH5zaXMNlr01hcWQ=;
        b=A+dh+Yv3JmmtSdgxIu9QQ5nuq9xS5iYHvdqgR+Mn4zbI5zLCdanmdGSbO8/qEAucjv
         EMH8LIeva6Lq6twAJffs89BGGbk7frpZNzrXG0jZBt4LtUbID/cNU/YmO7Brf7sYyI9E
         5GLxtR2bAAHABKstIO5GVdgDIsP0KV0+pvx7jhs74pw6PKndC8G23WNXtidSTEVizXqn
         Xau0EXqwQ0qKwa4S2q6/xdMqx0JhkWvRLFNTRXLPel0Y4WU6EJuKjH6J1SliqPdf7+Mg
         xe5ugGQoTxq+aIOWH0c8N49LhJ4UM3KYlkJ0sKyZz982GhEKXc83hx+PyKo/zLb8kaAu
         vDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791948663; x=1792553463;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DeSorT59zvpBPNILOX/JRE/fILGH5zaXMNlr01hcWQ=;
        b=VroSZR5L9JBCPalwXYfYyJRHSmcZTghdev3nswUylLwk2IJwIxqg12y1uq7qbHlV0E
         qqHwezr57oC3aXfKOnBS+q7g7rJsNy5Qd8DTPm+qKrXEEbaG/XodO+8zCOpNEploZsmE
         24vLcYOAV/4ZMPgwzKNhEZT2Qb2sBPrPzResMpW3dH+l+1pL0MdRnnkSs2P+0znc1cx6
         rbRjkI1XNNQpFDTrmEuxPTm0MAm4zvKBIsstzYJQY8gCfbG9ri4FYozyYJEIP+b+ZPxY
         HRR8lzy3G4nUqCnQP8EJMJq1OnLulPtt2OkQuvuf4CeokbUdoOawWnk8s9lzmsxRyaCv
         aLQQ==
X-Gm-Message-State: AFq9FYKWQRwc4/gyOec3SJwn7SgDv6SH/B8GuZB/Hjhtwh7WZWE1nYYg
	ZHdpEk2xHAtXzPAgg5TIGaEGNf1kiEBMZGCIpd+NDhXCX/hMSDfWHOR2
X-Gm-Gg: AYBFou0zDjvXDjreejrPBPs4E1uKj3BTHwxVToOZ8JsU9aUJpFbsb0qiCcJ8iUovzXm
	r36S5drkCXjbk0RG0hv7pO8er2ANp5z2+HXJCVhTSPSEhqXUis7JWVRLiRyo5/fb/1nwJctbBqj
	MJl66bDvWzmrL00zNsHQm2MCaDa/G6RAva99tYGoloCe/LiiffYAaV45owg8qos97q66m55Y233
	fdNImwNHRg51pQKB8cg+iPm7mCIGNIiFJh+iwm5hzaI2xJniYWyTBkyLaZOwsDBsUE8l3BvP7Wf
	fYWAhi6WguSP9yWOt3fll2m1b+n99j9pYW9dy8eUOIPjClAej27NIDdFfBPrL2Nf6uaxD+Md9dv
	tAE8yvkl0g6XXHFxdND6li0A3U2N+fTvzXCUbG+6Y+/9CNEpQ9+5Z7cttvsNylRWtTgEwmLsMts
	sDMpnLVbsfZt0HqOA4Mp3y1RdJQgbxSOW+xcKtQyKPbLeiw6Np7En1+9cDPv/TPCIy0kQtWv0jN
	jpvClyzym31EcVpm0bnupCA8RgNFKJ8AjwO/of0bRGpugn+6HwciAw1TJeEr3jOmr6t03vCsJtp
	bHJxGBjMsYykIGnz
X-Received: by 2002:a17:903:19e7:b0:2e6:1a6c:abcd with SMTP id d9443c01a7336-2e84280a68fmr143697955ad.3.1791948663377;
        Tue, 13 Oct 2026 20:31:03 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e4ebfsm65008455ad.78.2026.10.13.20.31.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 20:31:01 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH 2/2] ALSA: pcm: refresh capture pointers before drain
Date: Wed, 14 Oct 2026 12:30:57 +0900
Message-ID: <rfc-core-capture-drain-2.112c40f0e9284eaa@gmail.com>
In-Reply-To: <rfc-core-capture-drain-0.112c40f0e9284eaa@gmail.com>
References: <rfc-core-capture-drain-0.112c40f0e9284eaa@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/core/pcm_native.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index defbb2977efe..622ae7be2d04 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2176,14 +2176,32 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 	} else if (substream->f_flags & O_NONBLOCK)
 		nonblock = 1;
 
-	snd_pcm_stream_lock_irq(substream);
-	/* resume pause */
-	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
-		snd_pcm_pause(substream, false);
+	/* Keep linked runtimes alive until the initial drain action completes. */
+	scoped_guard(rwsem_read, &snd_pcm_link_rwsem) {
+		snd_pcm_stream_lock_irq(substream);
+		/* Resume before refreshing capture positions. */
+		if (runtime->state == SNDRV_PCM_STATE_PAUSED)
+			snd_pcm_pause(substream, false);
+		snd_pcm_stream_unlock_irq(substream);
+
+		/* A pointer error may stop the group: hold only this member's lock. */
+		snd_pcm_group_for_each_entry(s, substream) {
+			if (s->stream != SNDRV_PCM_STREAM_CAPTURE)
+				continue;
+			scoped_guard(pcm_stream_lock_irq, s) {
+				if (s->runtime->state == SNDRV_PCM_STATE_RUNNING)
+					result = snd_pcm_update_hw_ptr(s);
+			}
+			if (result < 0)
+				break;
+		}
 
-	/* pre-start/stop - all running streams are changed to DRAINING state */
-	result = snd_pcm_action(&snd_pcm_action_drain_init, substream,
-				ACTION_ARG_IGNORE);
+		snd_pcm_stream_lock_irq(substream);
+		/* Change the stable group to DRAINING only after all refreshes. */
+		if (result >= 0)
+			result = snd_pcm_action(&snd_pcm_action_drain_init,
+						substream, ACTION_ARG_IGNORE);
+	}
 	if (result < 0)
 		goto unlock;
 	/* in non-blocking, we don't wait in ioctl but let caller poll */
