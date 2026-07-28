Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248633AA1B5
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 12:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243021; cv=none; b=DWbWYdCJGc6+mywgfROAjRTDcYBsjftgzdXqrGDP21QsdkuSKBygUTs+qlclAdWUUajCB59I/oAU20D5Lc+s0AAZzFoPjCFK3cC4QIO5WIfjJiKX6xAsiq7/rBLWFqYDLZPHswkEDxH0zRxp8e+mS/DGUwD+MgUeNuToPrIfH5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243021; c=relaxed/simple;
	bh=ay6mn3EMDgaN2ArTz95Gq59Al65KZ6+pmAi+am2lQgE=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=FhYstQ8v20VVXLHp3z0TE1qz5f2i1eT6z3EofhtTbrJbyWF1bvdL8ODwzo5lAJ7DtbG9+bZhA31JCbl+gN9eqxgOIHFH2gWljR210waeIrCAeyvuyKaeEf4wFoxLYxo9uctriOAucToh4hJRBAZHro9OeDCZyYkHas4KVRbW2co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=Q3G4OEfl; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="Q3G4OEfl"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so5030709a12.2
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 05:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1785243014; x=1785847814; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBIXF4/zz/g+z8aWGwMT7WCO1eRghUL+VdhwR7SJbBI=;
        b=Q3G4OEflc9f0G3FXTMk915tTIDQ18dgoi4tZ2bCbmMJMc+lFWq9jbwHdnjHed/LZaz
         nAeMI2zNEc6DMAXTDdbQCElWaP29YSl9X+27ZupYQYEVh1X4q8s5FNLu5byq7JKOttW5
         NjH82wCqQI3qUqan3Nor51Qc3+LB/pLQC15VEtqSjlXe2iRKsK/9GVObIuaRiqlUH0d2
         n2VcRMVjMGxXDrhWdWHi+EZNDnA42axZz/D4ux6tQo3D/WPjT862XIWqsMqX15lC8QIX
         LsvHdKB7DseOdfzmvZi4CZ/j/BynXG72BA6Z6I9y8bmSYL6MnPidEuFiFLNu1oU/tRcc
         SCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785243014; x=1785847814;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBIXF4/zz/g+z8aWGwMT7WCO1eRghUL+VdhwR7SJbBI=;
        b=jsvCvW2s6DkQkIRaMkQ8vH7QA8BdHS4rqAhbCOTv27zuu+Q22X4+LAi6isUbS2ObAz
         rBtP5NA1+u2+Wat/6dmZAxcd6c7ON5jMmlIqYcbHTu2hpi17kZFN5jZsSSEgirmXqYL8
         6h4mytaf/jgz6OIp7tjQXP1hHt7fwSjtDA1lsmSxkykWuHpWTRzzBaPSSAjRvmLzW25W
         KmCUdv3eyobS3uPulrj0RedK+yBR0HsNgphS0oSRC3tcT6KMWlIIRcIxgQdhU8M0jfSi
         pcUbIYXv1A0ufyf8eOPAcplVOnic4NrTbFQEMAblbWPlDR6Fx1ypPwOQghCMFtQnvcKC
         QY7Q==
X-Gm-Message-State: AOJu0YzU7cQX7QfugLQdyGiAn59TXSSL7NQVt/tB8H2oFylXAjcqh7lt
	5CKugNxY3ZG5h2LjqcH3EHPzB1wN74CHecGR5kGW7LdfWQdh6/I85rcWR2SDEv+UDIbyirpczqv
	jNxs8cVQ=
X-Gm-Gg: AR+sD12XiYbLncjyFTjZ3sapXarD4rg69cqE9Mqw6GgJ8rw8WX7cvBVOjBn9Uh24vdx
	Wf+nfsaDfFgU+8BeMgImV0779yrv5SiqPk5bjDO5DQrmpoPLxM4amrPA9wBSbeDNji65LBAUJUM
	AOeTG1/kIC04Ntf5zjmAh5W0RGNyBEWfH9o14M15kJdcmcn30KWYKdGonlNfunBfnxRCv+rPu0D
	FrNtBHP8KCeatzcaOnmFFZv9oj1OpAlR9i0u1h5c4WrcivbYSCJ45ezb5PIXX5QxCTwrrDS4nW3
	RbH4U7Hv0vJK77F+Sl+fuNpPP3gcYSBfiLct6HJX8aC+/baHxe4DxtVFNEGbVytsZeHXXT5NG5g
	eNsb2b+6kMIxPeUjySXUesH8JC8TMskwKaKLBi1nXHzoIL16KZI0+Y4ucNqg4RXsMynUUQACApW
	scwyN7EimMUqytRnS5tIhrvuYKuAr0ZB55zeufZJGdoVJnMlQt8w4XZzfUw50+ZPtPQUTKpY1Lo
	Yhyt6qWyAYUX4VvRlIL6nEgvF0EyTfx8sQ1MIqE1mtPWp4=
X-Received: by 2002:a05:6402:44d5:b0:69f:b166:ea0c with SMTP id 4fb4d7f45d1cf-6a034a71abfmr951532a12.27.1785243013695;
        Tue, 28 Jul 2026 05:50:13 -0700 (PDT)
Received: from smtpclient.apple (83.10.16.193.ipv4.supernova.orange.pl. [83.10.16.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543ab7sm3933219a12.17.2026.07.28.05.50.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:50:13 -0700 (PDT)
From: Norbert Szetei <norbert@doyensec.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: [PATCH] ALSA: pcm: wake linked drain waiters on unlink
Message-Id: <A0705100-D10B-4286-9980-0142ABEEAD51@doyensec.com>
Date: Tue, 28 Jul 2026 14:50:01 +0200
Cc: Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
To: linux-sound@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.4)

snd_pcm_drain() on a linked stream parks an on-stack wait entry on the
drained peer's runtime->sleep, and after schedule_timeout() removes it
only if that peer is still found in the caller's group.  If group
membership changes during the wait and the sleep ends by signal or
timeout (so autoremove_wake_function() does not run), finish_wait() is
skipped and snd_pcm_drain() returns with the entry still queued on that
stream's sleep list; a later wake_up() then walks a freed stack frame.
This is reachable by unlinking either the drained or the draining =
stream.

Unlike the close path (snd_pcm_drop() -> snd_pcm_post_stop()),
snd_pcm_unlink() never wakes the sleep queues.  Wake every group member
under the group lock before the membership change, so a linked drainer =
is
released and drops its entry while the streams are still grouped.

The window was opened when snd_pcm_link_rwsem stopped being held across
the wait and the removal became conditional on group membership (see
Fixes). The later switch to finish_wait() kept that conditional removal,
so the signal/timeout case remained.

Fixes: f57f3df03a8e ("ALSA: pcm: More fine-grained PCM link locking")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
 sound/core/pcm_native.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 7dc0060617f1..c9d0c2bb55b2 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2367,6 +2367,7 @@ static void relink_to_local(struct =
snd_pcm_substream *substream)

 static int snd_pcm_unlink(struct snd_pcm_substream *substream)
 {
+	struct snd_pcm_substream *s;
 	struct snd_pcm_group *group;
 	bool nonatomic =3D substream->pcm->nonatomic;
 	bool do_free =3D false;
@@ -2379,6 +2380,12 @@ static int snd_pcm_unlink(struct =
snd_pcm_substream *substream)
 	group =3D substream->group;
 	snd_pcm_group_lock_irq(group, nonatomic);

+	/* release drain waiters before changing membership, else =
snd_pcm_drain()
+	 * leaves its on-stack wait entry queued on a member's sleep =
list
+	 */
+	snd_pcm_group_for_each_entry(s, substream)
+		wake_up(&s->runtime->sleep);
+
 	relink_to_local(substream);
 	refcount_dec(&group->refs);

--
2.55.0=
