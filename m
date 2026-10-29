Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252680;
	b=2uLqbGGvS7k1eEWs65Uh+yLxK/H9L8ccZTzXw2jiUFaJn0k/muXCR/fK7RnOm53lunyF
	 T8kge9qNK45Ou6UAIfUru8AgT93Ga6M2w4CZIAbdemoV/pSD2jGwwJgNaXaZeveyHjury
	 vz1c47oOMxNQX4jf8gyiaxUgQ8emuikUOJoF8Sdom7P/4oXiOnGh5kvBITfm3Nhm13MAP
	 elqvv0F/vKaBWpLJ05p5MfLTdajxaG9wBLOjqdGoLSukePwzg27XETGelCNVav5qncNhp
	 ThjigGtCEnWmk/aWBPjLnCxtJKtUb9uWJ2N74hu/P1I1EdJUKaJOdHBi1dKrmw0djEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z/l4dD/5O5m6RU90kbEhUZI1etATEz4+8y2FIjERE5k=;
	b=cnA3rGueHtuVmVtIizLM81c8pHz+3biP3tZy9Xc9pux/WGfytjzkQJ8GhTSbTsxhk2E/
	 uD+QarMlnsFN0tX5Ws8MElW8Mbyo6vyf5vU3ylyxnlcW6a58NK20TnaZdkvJNL8ISXeog
	 Klu/CiF/d2Nc/cRPRrWBkTU6ps6YSZuTUslBHK6zaqv0MwwRZx4oLcshgJqjngAmdqsLA
	 uyuIpLgBehP8BewPdMtwHhEvrY+qVyOXi0xuFqIScSryr3JGRVg1PiAsK6S44E4qoF5aw
	 phytY/JoWckPscCU8tuUurVFKbWeF4vhYMpQ07J2HjaSALxT9sXKKgOrOcBBVmpaCag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m5LmMDWr;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652B1606A321
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 05:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 652B1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m5LmMDWr
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd3310348d2so160937a12.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 22:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252680; x=1793857480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/l4dD/5O5m6RU90kbEhUZI1etATEz4+8y2FIjERE5k=;
        b=m5LmMDWr+lmuQPV0kt4U9ZIwpIoJlXLOh5g8jZKrwbtU120DE8Aq/3Ly2bk9gwfCT8
         B3vtBQ/Jmi92vaT9EYbs6ZoifELrAilDDP97lLN7U6tcrg2hJOAfM4nI2B1cdRZP83Nu
         55jIgfFx4ajlbt2shZ9M4liRCVwwbVXzxvXJvxc+StesB3Mshg6g7LdvTy8vOkfRWQkW
         AbjNzMniweYZckUj1XChiphsWy+1zO6Wzhrr6nIRqGog0VeGlEuEOJqIgxGY/pN7LO8j
         AE21jMY79c7oLQ+fDHw4vBP8CXE/4HAkypSBWsRiAAm9SBMdJa31s5/wOemC6JUa0JnB
         Fygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252680; x=1793857480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/l4dD/5O5m6RU90kbEhUZI1etATEz4+8y2FIjERE5k=;
        b=XSVz0fOZl5a0WTA2Ez3gYO050AlVHSvQq+k1SsTNJCMyadIwVQEsHTHbokW0xJyAyj
         3WGFYWo7x3htiR9vaPmLmiDhTvVdLNZDj6nt4AHC8u7YxytBKhYU2i1CBpQjmj+SksPd
         3f9pHmztjGxPDgVyFLUZpRshzfgdR4hFnr5FSQiG0EJt+4g8qMnvw9rtvty2duVFijvd
         IVQDUcX47/NZCU+DVJt3OwQJp7s/wbCuGy31fl3PQjJdTA/2kVjkA7HduFQGGUrW5kca
         gkZwJc1I0xvWMadIkmYASgqmijHzhEUCVcgg+hRuPcGIarmhmb6AVdQZBxlyvIKCALX+
         dABg==
X-Gm-Message-State: AFq9FYItHDfPE5qiiy7IiKoH7ndPioAjqG3bmJiwqkSUpbVypu/Ezdlp
	ezlJdRPLO5yR9cpbLaF4UNGRA5mbGAZUQKaVVIi8LBObvvw6JQxT4CDZErro/g==
X-Gm-Gg: AYBFou1WZIxTtTuhXh3i5FbOxKOueHcPOgYbyXbbkSc64iTx+abQpfqbS9gMiRGk7xU
	Ik0kLdyLptwcurCkQlIlMhtoQAH1sxwpl5alPv4PdSC6pHXTfNaQofVC3kcsHaxufDOmbJuKTG/
	hP9xBvFuA8kK5S8vXXjvIyjMkE2dP8ftGxddQuaGSIFwY3LxC8rPIOqonjB8y7pVDwn3ZJsw/L3
	ZrY3bqu6Y/WXtymfXjCfnKPM6mlP03RepeD8GDe/8gtXwTPTI2dYwnfMowyk5JTEHGqJuiyXA8X
	MuscAxPzZuBss1JDWTmNh8cWbolSBef49stS2e96UJXh+eN8XTSQ25MbXxDu8l1vvwc7cDtKb6h
	FpNcdUPycyMUmukfbm0MsMQ9n19ucMQAlRs29yCDZTWwYAiW7qoQIp2T7FJ/WvhcxnrQ7Lr2jiB
	3YxY/aUtAbWEdACcGNs+3jPxqoHki3UgP3oq4/jBBn+I9DxXEanV1jcal1kADiM+cwZgjLphmJs
	oCcPQ5jcIDWdBR26Hzp3rTAs4feCMuaZGHK1INCYqUpntrKbV+pIAVj4Mdef1FYCUsdgAcQJ0N1
	qaumqr5yoNYyt7pILz02Ku+1iGRmoIz/C3S/A/efcQ+kjLmdBg+3ZZ8t7XOpbHNI7tjsxGeS8Pv
	jTrxh7WlNQb2WgFmGaMX8aNAMuf0F9VbtUSgnSMsCE61x6FQ=
X-Received: by 2002:a17:90b:3d83:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae6ed4d633mr905165a91.26.1793252679788;
        Wed, 28 Oct 2026 22:44:39 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:39 -0700 (PDT)
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
Subject: [PATCH v8 10/14] ALSA: virtio: prioritize staged capture period work
Date: Thu, 29 Oct 2026 14:43:50 +0900
Message-ID: <20261029054354.2931-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -146,10 +146,14 @@
 	runtime->stop_operating = true;
 }
 
-/* Use one notification helper for all producers. */
+/* Keep non-staged PCM notifications on schedule_work()'s normal queue. */
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
