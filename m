Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ED94C8C54
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792332462; cv=none; b=GkopaSftGlJWyTQNhxbjFWHbAO0b2Qbskdrfq3U2yVYxUZS60ue1vd1taTmLCr0FlnvSJVpo3b6WW/FJDAZ7gXw9a4+2bwxJ3A9C8Um7G0oRoorgdCV+hr9Zwz+4677hr8perDb/wtPnSih+/IAoQdIVLFlHjfncdbOSBzNkgU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792332462; c=relaxed/simple;
	bh=mMFfeUxQvrpdjn2pvtWISoAHAJiRpUINF+yoqcZa5mg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kTZ/JJkR7jupKI+XEinL7poU9mhaO18WYlSyMPJadlzSC3oW4XTAgDYmGqwpsNYQLNLvqY16aSI5J+QTK/rXUnUd2b09sFGOXo6pOOjrdwc/bL15TsPGyOOwQW3bphsiG/TYBVs+xmjlKUcY4SBh0COctA6ANIyRzeXo7XatGps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4iafOFw; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4iafOFw"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1042848a91.1
        for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792332460; x=1792937260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPf6l4y+cy+Q8bAp0fDF0UgnBCAMPqYN/MBc5iRL+As=;
        b=o4iafOFwssRjGH+GiIe3CXLokK33liwJ1Z6xljFVkRN/nbhbgLcMLGThNyaVISF0Nw
         ojC6VDzuPF6kcVH3oLr0pi+bmM+FqxAeRcbua6n7gW4uuI3nKajazBdl+fS+6CMrRYNJ
         WlwR7k+15cJ4tcvTvuzbnJB6rK2vnG3k7+NOwPsdV689/snl8ZM3HHSR0W28AytGsgi7
         TsqSAmwqUPzfWE0lPQF0gxjX5Z/YoD7j7DPNHWxPe2wxMZfIomml69adw4ao8hjiwgI2
         CZd8dh0qPzB2us5qGPy+DZn7KhASOfm4f8CbTCeKkN/zQJTt2QFFDIQfinFWI5A1yXSt
         R1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792332460; x=1792937260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MPf6l4y+cy+Q8bAp0fDF0UgnBCAMPqYN/MBc5iRL+As=;
        b=iFRdPqyF5o3unXVYWcmWfzzNgUiB7Pzc2M0lTCAbc+N2Yy7NdxGqaAhyy18EDsg2vU
         vloCNsLlObjYBdoDrmKt9qC4fH8Dc9wc0Nnyt2kBkCGnBS9l0j8K+WUoFt7YW2N5ysfb
         Db0pyMrQSC0d1ikssNq5dT2KZwYDiUoagxqeKR/soi987isWp1/YuxFvN90jvU6/QffN
         u3u3kisQD2w87HD+GPesNw3yaJ4wNduzc/ijhZQNYrTZHCKcD7yyJdGunXj4y4I+vBxG
         fUF7FigV/m6EPYWfGbdSNdxTm68LOtBC/RrFqu8nfjl8yeGn8iwrpsKyPX4c31foECQH
         bJ/w==
X-Gm-Message-State: AFq9FYKQAopfvzxZ1snM6SdijApafTk43jO9d+oGSYU+XgI+VMLQhtHF
	28MXqo1+GdhskMuDQnpuDeAOjZggMGbR3H1DJMr/um635ObNEXdr1V9cDrUHXNnebi17KQ==
X-Gm-Gg: AYBFou1dd4QhhEJcZmB1ZM2TtJYM/yAlS8lbw5da0vSxc5aZlzaYPvoMYuMcKnK3yDm
	DoatMpeeRPPwJe5wWSCW8aWLXGLDRO2ZHe+PYTt3mhNAxOYZjD6R/ULrw4aW03nQzptVYwzg7MW
	tMgC5LreMSpfYFwe9xpPv2MKsSE9f461MyMlg6fQHqzHpgWgGPKtgQIWZmr/nmRIuapCfjK7zh3
	sMQeNvdWqvKI/LuX2+b8NpwXSORn5YM/rKKDwG3OfjffFwryyTvrjoqn2BGspyGFwjP7jj9XWuk
	Fg/uqNOvARa7S1AEMIDFfP6SieF00zlrIOxAc0EOx4TCR7a5CdqZkNdKKMcAy+Db0oh2VTKB9jc
	506rUUn1WABD4avEJ/8VTAEsI1WrrZ08SuEzOTWs5OTELqSfz5JDxmCuGN90seiJapeqnlyyTYn
	dFA0jKM7p9FOCyJbaGdP7OrNBYRRp5D2WJtFtlHXW7PggzkI5ZDcj5uBBfiJbT9jMlM3faFIG4x
	yn9
X-Received: by 2002:a17:90b:388c:b0:3ac:a521:959 with SMTP id 98e67ed59e1d1-3acef1881camr5015453a91.29.1792332460158;
        Sun, 18 Oct 2026 07:07:40 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acddc37958sm10149338a91.14.2026.10.18.07.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:07:39 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 1/2] ALSA: pcm: Protect the unregister notifier traversal
Date: Sun, 18 Oct 2026 22:07:26 +0800
Message-Id: <pm-pmb-26d66390a25fec9fad6c-v6-5be251a3ac8832955a31-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-26d66390a25fec9fad6c-v6-5be251a3ac8832955a31-0@gmail.com>
References: <pm-pmb-26d66390a25fec9fad6c-v6-5be251a3ac8832955a31-0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_pcm_free() traverses snd_pcm_notify_list and calls n_unregister
without register_mutex, although snd_pcm_notify() takes that mutex to
add and remove notifiers. PCM disconnect releases the mutex before the
free callback runs, so it does not protect this later traversal.

With no open OSS file, normal snd-pcm-oss removal can overlap PCM card
teardown, for example when unbinding snd-dummy:

  PCM card teardown                     snd-pcm-oss unload
  -----------------                     ------------------
  snd_pcm_dev_disconnect()
    remove PCM under register_mutex
    unlock register_mutex
  snd_pcm_free()
    fetch notifier
                                        snd_pcm_notify(..., 1)
                                          unlink notifier under mutex
                                        free module storage
    read notifier->n_unregister
    invoke callback

The free path can then read the notifier from released module storage
or call its unloaded code.

Hold register_mutex across the unregister traversal and its callbacks.
Notifier removal must wait until both have finished. This also protects
the traversal if a callback releases the last module reference: module
exit cannot unlink its notifier until the free path releases the mutex.
Drop the mutex before private_free and the remaining stream cleanup.

Fixes: c461482c8072 ("[ALSA] Unregister device files at disconnection")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/core/pcm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index c133f23418fe..35ece386d1a2 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -853,8 +853,10 @@ static int snd_pcm_free(struct snd_pcm *pcm)
 {
 	if (!pcm)
 		return 0;
-	if (!pcm->internal)
-		pcm_call_notify(pcm, n_unregister);
+	if (!pcm->internal) {
+		scoped_guard(mutex, &register_mutex)
+			pcm_call_notify(pcm, n_unregister);
+	}
 	if (pcm->private_free)
 		pcm->private_free(pcm);
 	snd_pcm_lib_preallocate_free_for_all(pcm);

base-commit: f6e8d5ebde5ceb7d3c0eef6e9e4d82862b503ade
-- 
2.43.0


