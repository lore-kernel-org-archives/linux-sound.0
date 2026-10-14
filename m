Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D947A37882B
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970449; cv=pass; b=J6hNeAtZKfkWngCE7KWS6bUpx7UEAFl4oS1hoBacVoU46AZd4RdfWC7XydzUw83OBk0OE0MnDT1XKqrQzL0wgkB6IHKX1M9WSSpKGhzJPfMPg2vNx4oc7y3QhimAHUWEkTYL9gNdAJepSvOetC/Ih3DRN8d9zo3Vg86MKHYf+ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970449; c=relaxed/simple;
	bh=ymaPUYargcs8FQDr+6bZ3PYP5DTi+WnlwiWAqpq10bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nCEclKgFTVknlWaYjoX0zj0HeR2/AOewp2/L6/fV5L6D/nxsKHK0sm6wafRoVvVBQ/Nld+LRg3uXAbrvHV8lPpacmxYF9IU35QhojuOAW5lgbadrO7/bjW4O9vtQeSH5dd/rVDdGPoJzzN4t8IXQzEoAA7Oc0wghjzpZr2d6DOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjHJJDK4; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjHJJDK4"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6776efd4ff1so3408291d50.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970447; cv=none;
        d=google.com; s=arc-20260327;
        b=kixdxl0h9m26HFE6S5rJrq8UEg7C0pkUaA1PAVaN4tG2CrSzDEXiOJCEjJe6E5nC/q
         rQb6LDZo8/1FagkgOML2tD+4/ensI4BlfeXW8Gc1KltvpeLz9dZHZHdViMlzZm3x7K7h
         qDpk3s0GsWDei7bk0WuU12HQ5WO8byoH1YijatGptZXYU514Qu07cHTE8AgurlMniG8+
         a3Sq1iifqy9lL38NhlfcVmdAcyawLXLkpEMMC/uNZ59m4BY5SfXRJqO/xzQx5z/xv5cF
         UkwUQU3CK2cV8zyoc/IMWucOMJK7rGCtWgexny9sQJfT7QeIaOrdtV+g8V1olw6gPq0M
         EaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p1yUYx/ZNgf5tuSLit2Tisfqpid+gK/d62ApUZjCpxE=;
        fh=ZjHJ+UH8o5G3BDeYNSFMfftigJ9hqKrlZVVm5IMNhoI=;
        b=ig2PEdseqJAYB7xgCk2BO+BuodIsMMYO0N6hxNUj6eHcjq4XaFOksqhdCjRVQZ3WrM
         UZHv/uw7JVmRie1W6WakXfGf1sQGcLrzQf4n9zw5c2rGQXu8Dr+v6CkvT/RzC5iPdCpt
         lUqwCyB1K15Sl1ln7pv4yrOE3bsw0bJDOxGm+T+oiYqvZkBQBoc3yacNPU0/64Mom+aZ
         hzZeOX/QZ+whov22TieEQZzFK7cWMtGWdc4tu54Pa4tKC+5UcQExLB3LS/7UGzVphayd
         X4vfQKzy7tv0e2CVEidIEPK1CgFGG6Jfd+XgaOn9VZwhcScTKsmkaFxv4ZBU32rnNQbD
         abDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970447; x=1792575247; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1yUYx/ZNgf5tuSLit2Tisfqpid+gK/d62ApUZjCpxE=;
        b=VjHJJDK45MKZ5+03GjiWbH1xZXLmn/uA43iEAiffMB4MokS6JCCpc/a5HBK3m9Ya5V
         W+cbD9SthUre7wSaWaBUb3e71c/T4xYKSbjtBGuQyLr4LTzpvZnMtiS/sMQN2OToHuAp
         LUefL4Hgc748ODlAL83L/ZQC36Y15t9a4ZRSKk3jyBppKDopwUA/MEex7EWwABsYqokn
         QWXbwZ11Xgxs6LYjvUlXz4yCxC1hJktKUlo4MHqjUm/F2Rx71z2CNLqTn8hmaPR/zio5
         t2A3cepPX0lfN8Qz6oTwkuqHzesjmn3MvHWFmrCBJtB4ysFW3wQ2glAtCMpJkZPbvFAu
         CWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970447; x=1792575247;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p1yUYx/ZNgf5tuSLit2Tisfqpid+gK/d62ApUZjCpxE=;
        b=DReHt9OuM4VbulgEXIyxsNP5/KYg2HTPe3fetWlbA5/OWpk9tIC49Xfbf6ySqJzLC8
         d9SiQaT2Lkth6OoAeOrFtRDif7FY0iU9JuMb3Fh4dCE3dBZdeuEi9G6OBCQGc9YkSOkq
         6Dbq/juuvK+u98Rwn/UxUfJ4s/9t7/rz1xLzBOjllPO27ee/UrFRvavRwKTjGbhoVuUx
         +oscOSfOr+OW4i9SAWfljzx5jw5ZtW5o1yMwNu45y4Ri9GCM/L9ukdQISf9E+KeL9UMP
         6MUj1L6OjmbB1joLGsOqlZWgkeHk2l3IRWBSlglLuFtFzoGlbvDZocqAK4YuTmn4MQf8
         nyDg==
X-Forwarded-Encrypted: i=1; AKwUvByJjYm64etz2qerJNd3GUaWSjoyK1MpkMsHS0TkTTbfy68WlX2mV9oh4ssFHFw63QAfqjeg/SE6M8q0dA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL6v28UvTzsyWl6lYpFmGDg5bUpsN9LgwKtvDo6ZXIsWOYqFC9b
	LFejoGnGSN5A/7pau1IarDYPJ6kCkHMFzNAhe1L/pNvdfZlJIJ91K/GNp2ZB/sTi6Nd0XSbP3pF
	OeXhEcDRamIWAvgUxuaIhQK22z5csWmE=
X-Gm-Gg: AYBFou2lgLdnx2xGrZts7v9tT1kOPpjeysMe0ZP8e7KdDS38Y5Kh7Ysq1ruCfguiIK6
	9ImbRWkw6u4vDQYpK1Uyu7IaevBKR4AhKtVRYam6GI6iOriw2P7j05qLsUkp8Pq6gGYCMOtm9wV
	fdF3v7pbcAlSICJKvChX0KjzSpyj9FbdePhoZTpwzKSiIq6NsT7VAyxS26/XaSHrjnvoYAx0Ccn
	83ySR/ilTyTOubdHUHFc6S6AmB9niOFdT4MDGFyRPejoiN68jThDuDtzssMnnbnyaeIrIzKPYQR
	ch4gdgCMtFAs2VWCgbTj7Z36SB0dZeLvwEHDMqBsTo5FZriNzuZzC3pYPQ==
X-Received: by 2002:a05:690e:1698:b0:677:c014:29c9 with SMTP id
 956f58d0204a3-67936951bffmr6532230d50.19.1791970446793; Wed, 14 Oct 2026
 02:34:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-9c80f858ccc13b3de84d-v6-d4059ea2910fe5430f5f@gmail.com>
 <877bjkg35f.wl-tiwai@suse.de> <CAFRLqsUH-ehHgXsqFGANE2h0-3WBkeNh7-AOvf5ymWAOH5r5Mw@mail.gmail.com>
 <87v774ejkp.wl-tiwai@suse.de>
In-Reply-To: <87v774ejkp.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Wed, 14 Oct 2026 17:33:54 +0800
X-Gm-Features: AclHuK_eIxhsMAtoY_UEpTCFiq6s9vgosDrs_MSEfEF8fkwQ6lGWgNyJKs8bRgQ
Message-ID: <CAFRLqsX8rqZrJfLPBOhBmuwXHq_wnxiwfxDGevfQ3wMFo2thgg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: dummy: Defer hrtimer data freeing until runtime detach
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, sammiee5311@gmail.com, 
	phucduc.bui@gmail.com, kees@kernel.org, thomas.weissschuh@linutronix.de, 
	tglx@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

>
> That's not what I didn't understand: do both A and B use the same
> device?  The release shouldn't happen until all detached, so the
> prepare and the release can't happen concurrently for the same device.
>
> If A and B are for different devices, they don't interfere with each
> other in the case of dummy driver.
>

Yes, A and B use the same PCM device. The test opens
/dev/snd/pcmC0D0c twice, and SNDRV_PCM_IOCTL_INFO reports:

  A: card=0, device=0, subdevice=0, capture
  B: card=0, device=0, subdevice=1, capture

They are separate substreams with separate runtimes. With the hrtimer
backend selected, dummy_hrtimer_create() allocates a separate dpcm for
each runtime. The test configures both with HW_PARAMS and explicitly
links them with SNDRV_PCM_IOCTL_LINK.

Sorry, I should have been clearer about what is being released. The
PCM device remains alive throughout. The object being freed is A's
runtime->private_data, from A's driver close callback.

snd_pcm_release_substream() checks A's own ref_count. When A's last
file reference is closed, it calls A's driver close before unlinking
A, even while B is still open:

  Final close of A                  PREPARE ioctl on B
  ----------------                  ------------------
  snd_pcm_drop(): group -> SETUP
  do_hw_free(A)
  dummy_pcm_close(A)
    kfree(A's dpcm)
                                    snd_pcm_action_nonatomic(B)
                                      Take link read lock
                                      Walk group: B and A
                                      snd_pcm_do_prepare(A)
                                        dummy_pcm_prepare(A)
                                          Read freed timer_ops
  pcm_release_private(A)
    snd_pcm_unlink(A)
  snd_pcm_detach_substream(A)

B reaches A through the PCM core's linked-group iteration:
snd_pcm_action_group() invokes the prepare action for each member.
A is still linked and in SETUP at that point, which the prepare state
check accepts. The two dummy runtimes do not share their private data;
the group action explicitly invokes A's callback with A's substream.

The final close holds pcm->open_mutex, but the PREPARE path does not
take that mutex. PREPARE holds snd_pcm_link_rwsem for reading and the
members' buffer mutexes; driver close does not hold those locks across
the free. The link write lock is taken at the later unlink.

That is the overlap I meant: A's own backend data can be freed while
A is still reachable by a PREPARE action issued through B.

Best regards,
Cen Zhang
