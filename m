Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BD03DA7E0
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 05:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869439; cv=none; b=Pv6StRMQiKQpXgF2wNbcKUlwtzxDHkGsr2vRc5GMwcx6BiVjLbWBteHsADQkRSQ1/yb5pDyQ9BTkbBoRQFXfHI7vQTLl6aVoJ+joQLIjca8MaxxNuuaUefTNuvTOofgmCKzsID01d07miL9h596P41uAh9srbk1gjq1jzh2DMdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869439; c=relaxed/simple;
	bh=//JVc5042SnZ4J1QXXHRBNb2grzQD9C+5eviInwfEK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJoyR3gkLO7OVKTtdJI1kJ2sUq551GzUhE0yA9+uh++XwS9Lc/i5ZdmPybdHTzZMNZirggGaA2SW8qoKH38WoCIH9xLHRAKR0SxaYBXir8ZONmddAl7yHnE4+HePVV/BFboBF+BAu1mck8Be0gCQHvg6aX6yWGiABlvDjKyFkP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIMKJsRb; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIMKJsRb"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1596000a12.3
        for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 22:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791869437; x=1792474237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BAdT0WoMnU7Kn2Xlp7z7rIayKbwBnbkOfvghprU0fMA=;
        b=fIMKJsRbTmC6StjC448aaZ9ejISUW1kOU7GoamfbtZN0IdrTc19AeypRxavD8kbPLE
         YJUJl9cpKkKNbCj8j0nNRk8qwKCUh7Y9s9vGL5EYT84f6qNnJjK2PWdOm8fRLd6A+INL
         ncya19lXUP1vAsM2hRuX21qGVxPfz7rqmdumNV6WazuKfemDAvQaqigWYuQ3w9tyBk9l
         soRTcvxS1C2SiQkJdTzpn8ZWNHmy8ykH44tzjqlbXJ6ebjxpShIr1ZB0BzeMtip0EbSl
         ePo/xKaw6j1jBUe6aleSECY0BI9WIRR0Zutaryz5J3DqkV6MoNX0bIP9kpZbODzlT9pS
         Uo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869437; x=1792474237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BAdT0WoMnU7Kn2Xlp7z7rIayKbwBnbkOfvghprU0fMA=;
        b=Nw3rG/3VghJ+g1dv7rKaD+VZ8OAMpRIqS9crSjTU+tBtNCSIf09cFKNoRVybDOAjws
         VEWW/RxCSxHJ8QT7e+lu99/E+ADgDyRnoH9NX7AUBsKqSSw3bdExy5lQH8JtdtlwEU22
         Zj21sB2O5YOJ8whfauIb98KXZ9i8uo26i4Oqrt7kET6yP85SDw/y/fuGwJlbwYnVaDIz
         0y5KQgPWeK7gW4XuKV4MwdPUYTuZZlqG7OahuaMGA6Tbn1z8KQ4gTHpTos3oD7yi35eB
         BFKNYOCLkTgJOsUaUA2G5TWE7EaiaBTFFLq6FwoSDgtHkS7fUCGpki0cSr32x4iDLACU
         uAUw==
X-Forwarded-Encrypted: i=1; AKwUvBwsZcvB+BL2/0LSmJdmcMMUAmp09oFVTE0hphbDGdpam8nIBYsYoYC2NzANV64/krOk3LRPoA81lMfaLw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJTCNRGS7Cnww7T4RJ0N3e4UGcdAeaDrnvszCjxpLU6/J6dyz6L
	rWd1I42AsTovxjDFc4iQOZtlE0YlIaeXSdWQREAFzUoXQ6qNNxs7rOXd
X-Gm-Gg: AYBFou2dBC7JCNBnsJcrmK/iEFtL1iBf0QHtcDjr94S8d2Yi2B6plcH86y69WmGmh/E
	WsHX2Z/BE3q6YPJlD9KfrmZURH3x/0zCmIDN0+ZLajv+2pyNk87vvwF9YFstxLe3PK+/HLb6L7h
	m2HLrq9AgV8y93iUGj0rHM0ia5usoQAlYI0ACKjjaLtIqXYq+t8JCEZlZwoWDYBuwSzD6H92rUH
	qS9jh/lzabwAEDGH536tTPiG94E0Pkgolmj/8ewrrJSfImNK1WzPzpLXiR2F7pdXwEOaMCWS96V
	jrkW62vKDWfAxYOkKhFWLZb6kplbNiOLVRzGMOUD1Y7XW2SPez4RwGvcSlmtxdHA5HCI9PwSMrR
	RAtxO6PYhmX2C22nlKuKuoYQJrj3zi65Ro7UQJkfAuG3VkgUOWMvv/i97baY6bao7JVzwBMMZjs
	wT6cFwOdBrA9rFIl9QoF9p9V+kXRgRhmZKJ80EZfC8FRLnq6Imt4+n671n4q3qILvIPrxzYmj7C
	vH5n08P0aIBYoph3Ggot4eQnn62Djv7mVeUkNuw9lvrDZbEzMmugOHKNTDSB83OsjQ9nTffB1FN
	wp60yqqD7ykRrDia
X-Received: by 2002:a17:902:ccca:b0:2e8:486b:104c with SMTP id d9443c01a7336-2e8486b1346mr97312665ad.30.1791869437352;
        Mon, 12 Oct 2026 22:30:37 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cb6sm50820915ad.60.2026.10.12.22.30.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 22:30:34 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: Joonho Lee <mynameisjune111@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH v1 1/5] ALSA: virtio: Notify queued PCM messages after send errors
Date: Tue, 13 Oct 2026 14:30:22 +0900
Message-ID: <01fd635f9ccd48594864e6e3858389060cdf2aa2.1791867377.git.mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791867377.git.mynameisjune111@gmail.com>
References: <cover.1791867377.git.mynameisjune111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtsnd_pcm_msg_send() advances a message length before adding it to
the virtqueue. If a later add fails, the error path returns without
restoring that length or notifying the device about earlier messages
added by the same call. The device can therefore leave successfully
queued messages unprocessed, while the failed message appears
already submitted.

Restore the failed message's length increment and notify the device
about any earlier messages added by this call before returning the
error. Keep the polling feature path unchanged.

Fixes: fe981e67568c ("ALSA: virtio: use ack callback")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
Validation: source-extracted ASan/UBSan partial-enqueue and polling
checks; included in the W=1 builds through patches 3 and 5. This commit
was not separately kernel-built.

 sound/virtio/virtio_pcm_msg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 72103f606716..5371f4985fd0 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -260,6 +260,18 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
 				dev_err(&vdev->dev,
 					"SID %u: failed to send I/O message\n",
 					vss->sid);
+				msg->length -= n;
+
+				/*
+				 * Do not leave earlier messages queued without notifying
+				 * the device when a later message could not be added.
+				 */
+				if (msg_count != vss->msg_count &&
+				    !(vss->features &
+				      (1U << VIRTIO_SND_PCM_F_MSG_POLLING)) &&
+				    virtqueue_kick_prepare(vqueue))
+					virtqueue_notify(vqueue);
+
 				return rc;
 			}
 
-- 
2.54.0 (Apple Git-157)

