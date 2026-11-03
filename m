Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693335;
	b=l2HcWDWmlaVaKVG5TNrZkokZDXC5f4HBR8CtsM3QGbdeevP/crdiRqbWLdLuAU0QZ5Dw
	 9IwkD+0ix/VEfQpf8scdXnp74MxRw2wr0K9+/vXZ/jtH8rE/6tiPiSKLZMIfhfGfbxzEk
	 6Dr8KAPhkv8RfsfwYv4ZhtD0aK7W/rGo1NniK+Ad2qLg/1m4lhFcwzZsZffpKHddr1Rv1
	 x1gYbp7yX9SmspTAe/deMTqPhoXOaR2JBsbL1W7v9BaeIwObI7EuX9wOLqt1Jt1mrlIhF
	 FLPKDgtnW1a6xjHQXb97bfXC+NIweQZSSDDSUWTp9nDZaA/2Tn7bOhGko6up9p4NLHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s/Zxo1I+8S4n5i1RRZUqfT8IwOehGqzQiN0Xdf27+bI=;
	b=QEfm2dVE1hWSIYvED12YgFmZCQnSP4jH0wcb5FzILwfG3ET6Io1DQVrJAlzelKDWSOhL
	 +ZtG4IRFeXbWrPRNL/qWQrGI1jpHJgSmq2TaawlB9/RJ85Pe6/ln3fSEWmCa6RVRwchSz
	 DQXXCVKH2b7E0EWjlA14eq4W6Vqo2D8BRMx45Djj+1q6yy8iftGfxAH++e9c0pWhHR7fc
	 oYZt6+4aP4awXuim2uhedsx8MlLdoWD8jT96EPH1VSx+lmt5jexU0C0zVZ2LXUTTyfjwc
	 FX4tuBe1zMAQBctVPWQ5pZZp4gaxPAXfnoKn9Px5xNPwR5caP2J2LoaMlul1jMWj3ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tX2oUrlf;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DD3606D82C
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 08:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56DD3606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tX2oUrlf
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35829219da8so510339eec.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 00:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693334; x=1794298134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/Zxo1I+8S4n5i1RRZUqfT8IwOehGqzQiN0Xdf27+bI=;
        b=tX2oUrlfxCV8QeTfT3iFk7m4ZNqzuUqxh98YNYbb9RSBJOBoFK9Ssmtc+isC1v0oWI
         l/PX80ngqmAGgMHbUhtNqyIjrioj64XjdJPSrFRd3rU85W9X2ATKucFSbBFlfHrPhOB5
         fX8n/sdGIfmpVAxnYXamb/XRijIHmmTs9LPwgFa6tRx/uxwV+EfafQ4LvabU00mDtIr4
         FiRu3QJXucLnAtnkmMe/DtC5s54fU2JfsZ0JzstXUWIIskxdHJUMZbRAucNtOTfT8dBt
         wfdjYymBSa4XfZKkJIoQyEq61FxlF4K8F+zcdGpwUZzVcaC40FserKAr8Lox1G2F+zMJ
         FdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693334; x=1794298134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/Zxo1I+8S4n5i1RRZUqfT8IwOehGqzQiN0Xdf27+bI=;
        b=pVUsMJFJGQm2vS7PoeGC4Fov0o3zDg9qHknq9cA/O/Q7Bhqd6lj8gcvX+14VUWuHLz
         5BdGUyIsQAJL6tbbfVCG29LHzhMfmIgUe7PpU2T5lchDx+F11ETrUBCg4Rkk5Lsntq5X
         E3RiJ9UMNe+3+3SAci8+eAe49zihGqsjYEkToAe/JRDmQK1HoPUqehOgwSMqejPRjvPL
         5sXkZvP1CRGopRGAfSm5mJhSwt+m7XkyZKZxcX26L2e2hCCIPG8SjNfZpSz51/TK6nQI
         IrmZua7x6yo3ZaEe816e32kHcekn0MCLHQZjw72wWumNoq4SLRhYO6OXdpVWO7yyfUXC
         fe5w==
X-Gm-Message-State: APuU4Z+JSW88FOh0JVjhZdvcIAubPOgcv+I4ZBjXg/r0v6+m+J9B8gag
	QP1V9rMMY0C1KY7C1Xx0v/KROIYxUVoQV30D711EGZ0u2L8tYwZgWqKXVvrSkA==
X-Gm-Gg: AYBFou35i5raol77MZarb4jsgZBIfxU3D6hbamkIGta20z68IdHfcurWzwwRdtr6zpf
	zTrW5m5x3frAp54oSnulmI0OhINKXMlA3BEcbSHnZKMgur/TiaTjL+BlZxAMCdyptx0WAp9sVkj
	NCO3z9jVuwAZ+0Vr+QbUa+grCKtp34oPPmBsQXofwtoVMom+OeumsszLRys2B4DFCutOFaM8dmI
	H3jMaa1rt9RSH4RMi6PfSm+LTo5xgHs3u8D/lJcW+i0UbpusutBMpKW9/0GPNg78XRsdrTi3NuB
	W1hVoTHHBWCiAMlU5ajVL/vIn5VVMKFTYrg34515qie5eQyjyc4ebc6kCAqYAZRUVNN9oTl5nUu
	3e2EMO3LjzjQ4tnYBKIjIkM0W/wzvmg5xVnbERELW07cAXJxBDf65zYN0oWbKRNsgDoxL1taPkQ
	nbxPcRV5x8i0W32/AvfgW4qzIbK9a3gjNZchUOsst/wtaHXCNTLAc3doIkxOJR4XWI9uvbqA8/1
	a/canq/8u056bfylE9ZarKXMGmJWq9cDW2lx7IOfq2hZGpZDG7VvWVvVMuC/uOJ+vK3bYHm6/kP
	swb/fzKyWbIbdIfo73EutWI1ZuDZi7VndsV1uDXXxDn588EHc2I7W1lebirSf7VZ5OoOCP+5ozJ
	LNDRgvkXhHf/FQW90hG6GzyT3oqqwXJjb2OIT2Zj40nviFbs=
X-Received: by 2002:a05:7300:fe87:b0:36b:c4a0:47b8 with SMTP id 5a478bee46e88-36bc4a04a45mr1387296eec.11.1793693334448;
        Tue, 03 Nov 2026 00:08:54 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:53 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v13 08/12] ALSA: pcm: report partial progress under the stream lock
Date: Tue,  3 Nov 2026 17:08:17 +0900
Message-ID: <20261103080821.16983-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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

Staged capture can make readable data available before a complete period
has elapsed. Skipping notification leaves a blocked reader asleep, while
using the period-interrupt path for this event can infer a false ring wrap
when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM timer.
The driver must release its pointer and trigger locks before calling it.
Existing period notification callers keep their current behavior.

Atomic and nonatomic synthetic PCM tests reproduced the missing wakeup
and false-wrap alternatives. The new helper delivered 64 final frames and
reported four available frames after delayed partial progress without XRUN.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1919,6 +1919,25 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Unlike
+ * a period notification, this does not imply an elapsed period or tick the PCM
+ * timer. The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream) || !snd_pcm_running(substream))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.
