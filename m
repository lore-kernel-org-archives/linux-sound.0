Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0903E2751
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583198; cv=none; b=NAIgDmMeVqRlBQySKvVWB4IAqOfwTn04rqJz+Zcd3hr2geIkYACzuu8uOx/JyopH+qjkP9q4O721MBrcSymIwS4k6I/4lqOnS/NdOTiSajHp2kULtNV0REYhhybB1Fj2GmeM+XSWk3tE9VTt83vz1S+EvMhbbCm7oWDaWGiCvuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583198; c=relaxed/simple;
	bh=AgmutPCKALZwQde9yisOX8+mpmlApNI/EPjNcFnSWRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eZ+0MFm/GJnJm5+Huf50m8MbJmOTgkoM5oV8PBkrDyJ5gYDgO96Zd6Z5PGF+klixuidiT3dMPRc1v905xIpdzWsn7CwNtbQwmWiyJtrSWzCwxch7YrcwgeAAzOO0q0SS5uQXGRUBuNsXSi6Kkcs2nhwwtyD0E5v341pfVdOiJSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WugFq4aj; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WugFq4aj"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-517773db4c0so920591cf.2
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780583195; x=1781187995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xvx++o1RWsd4KoVE4D0F/L+3FCt/xFBAfKUh8QKbiJw=;
        b=WugFq4aj4oxnHaZFqbFMEP5weiblx90YRxUgrSxEaKAo7tKbgUJPSH4nlObgW50Htn
         g3s2uGz9+WQlgZKYBlT5513qJ0slC3kAhXm9XAIRRy9lADJD9uuVZrsDzRz935zeUvpX
         ItXQGSBbZpuw8JtjKQj8/b0qV3iI8uEKXEoRJHZiLQYXwMPaoJZi7bdrd+sxsk9suTdx
         dOCJ9nL6eZlCuhU8gItkbmIH1jETCpOZhIMzYZ7/h0UGMnkBVurLTYOCjQysCVQSvwzw
         zl0sMmu5NyAaa3YdOMj1+49m33QoHoqhQeJxQi76x3Q2Kl//n8AumZlWm0F4FWYBJoGy
         NNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780583195; x=1781187995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvx++o1RWsd4KoVE4D0F/L+3FCt/xFBAfKUh8QKbiJw=;
        b=n5Jyb+Ml5oTnhg5AiWvBe8SegoWmvERWCz8Q8y6dMHHZUYz9UdIftLBDoP0+655KNH
         XoVgXE8ksk3XJcn9wolunhVhQDYNBidYqr/erZuy2Z/6u7G7qAOotFkiIhAuPxVm/oKM
         ZM+Yj0+IUj3OduB2PunuIGuLSlXNyr7dbuhcLEaP7bJp52L1WqSkpCINtDKeqjUm5LFb
         d0slBe8FQnW6UgOz8JiaNwjiTQpw3oPKhnx+zMr/SIMbSRHBnC0IyYmzw49aGOePglH6
         QJ+N+wY9jS00IFCnXBUMy3txa1v0zdKJZe9kVz+9cKRmVHiLAFZ4HJTJxTJlnj9HK8BX
         nyTQ==
X-Gm-Message-State: AOJu0YxkbEo4ccjGTOcsTAAtKNlrh7b1z7NGUIZ0DeGQeuKP07nuMI13
	EOcRe7RIK6aCGwt4FM9bNCGp6yxb9RbsOWJZwd9j9v/1DbiiYgiD4pSV5PTcWPeJ/mo=
X-Gm-Gg: Acq92OFNzKzLd7YBLOF7fIWJG0Ct84IjqBTM5Q7DjgkCXI+GlVRx+BHQl8PpKYr4o0o
	31c3r1zdJUldLMCZ37A+qiC3MJgHNVYEDisq4IuUxrtWB9OFDFDI1MnKrGFvgIyHoHXkHPAg2bU
	ed2TZUQXS2y4mbupi/FS7HyU/riFGoUBqx/SZoCKMLajEXdiN8RkoFgbCSXQCNHRIxbDYV/as19
	NArLcfW5iWYXhtpwTtTpFyGdXCL0EmuZMyFCspZVJzAvG+TNitKaQnA+7vCESXESsRZBB9ehX4e
	yui8pZ7LWrvbUCAwy7aTyfuWQuy41lzeis81zswzwmjcffhHfw9i1CZJ0sgo4x/MdsPAYEVcDaT
	N9iNay5p0qh9RxC3k76d3hVDrsBdc9QvvFs01ex7zMoI+ZHLQL52qYgq/bGfBKm1zreZpxLwH+T
	E4g14nnI6KHdfVL7uGjEDMIfBBJTza35kbbnyNBHJn1pISlEFNQ/KY9usf/IHyQ6g3GWDLyx6jL
	BLrG2oJEpx1XWRLHqL0thomNi2aPWr5FnIRSi7gVSs=
X-Received: by 2002:a05:622a:28b:b0:517:6a56:accf with SMTP id d75a77b69052e-51789ef64e8mr22716911cf.1.1780583194864;
        Thu, 04 Jun 2026 07:26:34 -0700 (PDT)
Received: from localhost.localdomain ([47.246.98.82])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775dd2e53sm52509581cf.24.2026.06.04.07.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:26:34 -0700 (PDT)
From: Ji'an Zhou <eilaimemedsnaimel@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	Ji'an Zhou <eilaimemedsnaimel@gmail.com>
Subject: [PATCH] ALSA: PCM: Fix wait queue list corruption in snd_pcm_drain() on linked streams
Date: Thu,  4 Jun 2026 14:25:59 +0000
Message-ID: <20260604142559.3840881-1-eilaimemedsnaimel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_pcm_drain() uses init_waitqueue_entry which does not clear
entry.prev/next, and add_wait_queue with a conditional
remove_wait_queue that is skipped when to_check is no longer
in the group after concurrent UNLINK.  The orphaned wait entry
remains on the unlinked substream sleep queue.  On the next
drain iteration, add_wait_queue adds the entry to a new queue
while still linked on the old one, corrupting both lists.  A
subsequent wake_up dereferences NULL at the func pointer
(mapped from the spinlock at offset 0 of the misinterpreted
wait_queue_head_t), causing a kernel panic.

Replace init_waitqueue_entry/add_wait_queue/conditional
remove_wait_queue with init_wait_entry/prepare_to_wait/
finish_wait.  init_wait_entry clears prev/next via
INIT_LIST_HEAD on each iteration and sets
autoremove_wake_function which auto-removes the entry on
wake-up.  finish_wait safely handles both the already-removed
and still-queued cases.

Fixes: 9b1dbd69ba6f ("ALSA: pcm: fix use-after-free on linked stream runtime in snd_pcm_drain")
Signed-off-by: Ji'an Zhou <eilaimemedsnaimel@gmail.com>
---
 sound/core/pcm_native.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index a541bb235cfa..302643c1c192 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2199,9 +2199,8 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 		drain_no_period_wakeup = to_check->no_period_wakeup;
 		drain_rate = to_check->rate;
 		drain_bufsz = to_check->buffer_size;
-		init_waitqueue_entry(&wait, current);
-		set_current_state(TASK_INTERRUPTIBLE);
-		add_wait_queue(&to_check->sleep, &wait);
+		init_wait_entry(&wait, 0);
+		prepare_to_wait(&to_check->sleep, &wait, TASK_INTERRUPTIBLE);
 		snd_pcm_stream_unlock_irq(substream);
 		if (drain_no_period_wakeup)
 			tout = MAX_SCHEDULE_TIMEOUT;
@@ -2219,7 +2218,7 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 		group = snd_pcm_stream_group_ref(substream);
 		snd_pcm_group_for_each_entry(s, substream) {
 			if (s->runtime == to_check) {
-				remove_wait_queue(&to_check->sleep, &wait);
+				finish_wait(&to_check->sleep, &wait);
 				break;
 			}
 		}
-- 
2.43.0

