Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180523;
	b=EDpUlcIH+XKMaeumHtfYFav2S6X2N9c8EhTKKjuJwTQGRT5v2wD/BFTWbwPiDGl3xFTB
	 4sokzsFk+iuGcqQXmW2b4skab4Fem2ZcC4zvNytdh2N+Oc+XT1EaC8dgCDaGypYTD5Sdf
	 EeY0N4ZWcXLVg/CdftQ+2G/77k0upIKwiAAiYVUA4n2kTx1rbAcnSEGSFFCvlQb90kKoF
	 vDtLN2ilfq7Aaf0dx+y9q8znmPI8kF3W7jnHuo5kiBHOCW63viWcLAES1TsTc4ypfhlr2
	 JtUfjyOBk4Rb75QjadpSJSvnWLncFQicfff1p4ublPdgi3zVHKk/jzm0VfsU9lOoNfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
	b=EP99V7NnVInMiJeOIXR4zG+3o6wQQeMx/Wib9ugrKbg+v5B3ob5qK5Dlz74xp4EPRHxB
	 Au65VgkVWarYN3Qm4HyzqXYUPLJdlTxu1rhtKI854FesXZ510RMslZ9TaH/OidPgNm76J
	 qG+qG4JzA3BFD4nj3WnYr+oVgbR70DRMNbqPjeOHb1zQF78qr5dn81kUB0LP1PeX1Qgky
	 0SkhOJE6zJISiDlFlIDdCOfVbHfIzYyn1HYLtIJATbZtU+1mHtiQbzESDvTVKbmCQOMsn
	 k1k2jqZc2HAyaF8n9UYj+7yA1UwYFUA6hgGjf5HtgT/yI+PT4qpjo38dlJy/hJm4QuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YOC1+36r;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A759060A2616
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 09:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A759060A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YOC1+36r
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd3310348d2so850727a12.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180522; x=1793785322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=YOC1+36rLFXWQFrgkKLVR4jlr7TSIxKvYgHs5ks7+5SfPdxLWveh0kPrL70Y6G74uh
         tuCBHFUDBEhEcPY8MA4TVpDn48sFxRCwbTgiNEptJ+0xpqhmWIffllbO3BQXPT/kfjdV
         CzXbgEF1RK6AkVs99JZiyegORsNjCFTpR3qFUuFbDRg28Wic83Z/HHzzlbv9JcMlxM21
         QAvDVz8tllJO8soY5MfmtphfTmkuYO6FrZgyYAmfjldFw/nFVIp1prUNoKktPMXMzlBa
         3r8kolQwsKgabFFd7Q3cAhXGrxrCJrCMSHbpKVLfX7AgI+MlRDBYEeE4dDJvcs4tLweR
         5Ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180522; x=1793785322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=2guqCkCjqu/b7YKtMU233BlDxXhxrr5TTOxbPj6Pg2zfyAsauI1lcPMDHsJcKSKM8J
         bGoxiOCHNvQKsT1vJICGQhmAyCcOEK7UXQ3lzl9QwaqFsWMjg0aOaFTQs8XR1fV4fq7z
         PmGSlC7fPbLdomatzdQqTRAZBH9NT7BVVKJJcJlZ92xcWE2do8/Gb6bjX7ZBB4a7fQ4R
         mPsUi/c+W7DyJIAkTR5nkBO0UC/TbwU6XkNv0MmcMtgEw5qWwQHg5Et3BU5/LKopkCcg
         wkiTUXvm+C3ywm9Ry4K4c/b5tgFIiQSNCrpeNHPBymDWyTkiSLE5Ry9FJzeSC/dEbyys
         6vEQ==
X-Gm-Message-State: AFq9FYIFXj2UEmT22u25jiOWZJqaBwOCMBzhRfAj0Sa47GW6rgAu4kWz
	JfvUuNNsXYclwIv7JRO+2ubZVD8UpdaJLSvQh8qmRObla0IN9Fb68Ngq5XXYtA==
X-Gm-Gg: AYBFou2TQcs7WcySGHoebGE5/UU3SgkbpimILYLwWorGOsu/Sal1wc9acNz8jnT7loK
	dZa0bKt0ooWtgFwD+ADu+KTToRIFsCvsPJj8TDKtoW1xcryb8TZwbQdNdus6y81BxmEYOgPzR61
	Mfz5Csy+ewAXaZ61Ikwo3MkSL+xE4mo+nGvab+oBvSXOKGH24oaKxY3y+HqMaRKssG9fyf5UrrR
	UEWeBNoyhk+JxCDqQrpgW7Nd/0EtVmE96GZ8yQerdAXZqTQLIhnNohtgKQ0az+W3if9R4be8WpO
	eOcUuxj5KDUcjL4ZLw9e86Zc8LEiwihHSzVGC+c00Jq8pp0iYVhG6OAwItVoNbFcOevS4QiD8WD
	mFB/iVgUrDxetAaRsn5GvEwyke4PaymS7FIqNNFSAPLnyee5ou7g4DyGMymciC+Lv8GBY3NIl3N
	Hbvf1ATbSBNk+xYDKYxQ5POg+OE+03cTNcxvkN3FE/lcF9UePXU6Wf+NsC9Tt/pL6nel0GiChsJ
	3Q9BNibgPzazLtpXdYgMHCQDMF4DX0KwpEnreUahwDatf25wvfwfhqLOAvVysd3AIqRUl6Rrh5J
	ROoFv6n3uDUcGVVx1t46kQ6rGQfXayf4dvIuZTnHtqrFsj6slyfMIUd2EH7TfnUkX3gLzZiENz0
	uK6C1kcILex+7PiefLEHzz/gmfVGpt2qBqcT2dAak0+qUQUg=
X-Received: by 2002:a17:90b:2587:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3ae5c86a185mr502672a91.23.1793180521633;
        Wed, 28 Oct 2026 02:42:01 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.41.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:01 -0700 (PDT)
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
Subject: [PATCH v7 06/16] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 28 Oct 2026 18:41:22 +0900
Message-ID: <20261028094132.20364-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request is
still pending. A later teardown may then submit another RELEASE before the
first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels the
pending request and wakes the waiter.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/virtio/virtio_ctl_msg.c | 15 ++++++++++++++-
 sound/virtio/virtio_ctl_msg.h |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
index 2e0ff15e729d..e50e6c7f3b8d 100644
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -314,7 +314,20 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 		 */
 		virtsnd_ctl_msg_unref(msg);
 	} else if (!nowait) {
-		rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+		/*
+		 * Teardown must observe completion even with a pending signal.
+		 * Otherwise a subsequent open can retry RELEASE while the device
+		 * is still processing the previous teardown request.
+		 */
+		switch (le32_to_cpu(request->code)) {
+		case VIRTIO_SND_R_PCM_STOP:
+		case VIRTIO_SND_R_PCM_RELEASE:
+			rc = wait_for_completion_timeout(&msg->notify, js);
+			break;
+		default:
+			rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+			break;
+		}
 		if (!rc) {
 			dev_err(&vdev->dev,
 				"control message (0x%08x) timeout\n",
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
index f867b9b9233d..d84f0740fcb0 100644
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.
