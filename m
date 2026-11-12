Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444484;
	b=JM5MU93haa2okn85EowoVqjC/w7yw1cH/c4ecvYh/g+zk5OovVTvqijFZ8waGuVVpCSC
	 138m7IPcmM0Mvs7bgz+5LUriczMkiSMMiKD0APdGNELrRQjV75ypiQL7DdZjXj/cR1PMD
	 Cf98HDoZdYbZCaRUP0GbF99UayaHtW4CnuukPdXpKTsQB4F9mketTMrkJWEKCdEwX3mxC
	 j2UaD+/n2FDSKnHNTXFogIaXn4e3I4Dl+BZ/P62Uo9nUGnmtBMdvhXvI+57viwySuonEW
	 4TpKvZ5e6YvVTNav15LHdP5ogqGA8+D7A7AU+xAI3vLEndMoQOV6U0dC0vil8g8h4PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
	b=LM2BytcCvLg9LJonqquCP+6nWTVRBm/8wrqlOem4kMWchzFffpXzhKzLtNoUS9hTRLOY
	 1ujG4SKgrE/RIEh5hxRm/LCeE7fvTOJX4WvsmINzMLGUGZmtuKGmUYgcjqcJV1bPhh8hj
	 cpQsAUYrRGkCfm7/uKWacY0lvtZoYSgx1IpoVaFlV8LW6jOO5maoeJo17qobqRvuuykc+
	 lD6wnc1wCONxAtzMp2irAXDZ1UqU98aohMGGfJj5fkIMNwu+j/T736eRPkQe9/ZRnnyOm
	 fnLUgsixGhnrPeMpNcc9zMrrS1yth4l6/Qz243J8wrf9JC3ZFtSvknE8SwvZUK1xNqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzqTg4+t;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F39606C769
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F39606C769
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzqTg4+t
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2af4c8d00so3700435c88.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 16:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444483; x=1795049283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=HzqTg4+twpA8lDsegIEbvtSBpr03NTvCLivNU5L3xONBpBEQtRvcW8xM3WKsr6muWN
         QKdtzb0IPs90xKV0eEz1qinAzmwhnTsu0WWCJWsqX0cDBZ57J+WR6u2QWNqR8nH/T1IG
         Qi5zhVfQLDfRU7zFsscrhL/EauUpHuG4XqubL2blZx7/tHDUXoa14381n5cHUOcx7bac
         +KdvLwrH6GkRaNhXJJzXmlKacBPL8WVknPMQfbq2T1CTZbGHHMz90yYrky810Dh6/2Kv
         dIo/ZYMMbe+cRufkbWybT1vkvdXi8L6p47/XpZZh4ZwgqrJnT19kp+5DDx6r15pd0x2h
         H2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444483; x=1795049283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=rcVPwDYL+0o4QjPgjQnTzs18vLKTBgkJLohCDx02rAyo75z4if1kXADSOzftOXpOJ8
         3aRZ13QlzS6eU7Sui4uSJaUgReBxv/AubqLxA9WaD7jeIzXHTe6YvRGTno9EELCJzcA5
         y4pwODsNO6VQwHLVPqiZ6hrOOg6jB357rTaT6b1RMXTFQrSuJcy2qE4cglSZ0EKzBQan
         14f7Xzlkr5Jp2m0KwzdjEpBet117Z4ZaugTOR/ed4cToM9XR9K6FW7A1eUES6e+PZJNi
         f79Wmy6QO+4gIjtm4TxIuzUR/1YLvdL+JxWdsSU54a8WB7lan8eaol27xshXq+sw8YMO
         dRBg==
X-Gm-Message-State: APuU4Z/O7Y0PiFJlCG2AFEHwyAv0mf2SiHEl7LBWkWx/S2sWy4xoc2eu
	kJAmZTCI6VyZDquoFIrcP8Mu8TDTyu1Goyp6cOjlxzsp3EQeexsWiTRTVfRwrg==
X-Gm-Gg: AYBFou0c7o/zXNgSLXrxnzHk4bZ/RVvfFM0Ku7xG+5SJB5DTN+AekeZJj6/ntBTBYeg
	QWeC3XwtH5TLtJV8ZTINVSoQe4FpktpSUzhI3vRBlHmRjENXCLXCUQEBtBFeI2UvrgkqjS+wRQf
	KnL7uj78LWRw1bXxRqF5fvdbDj3W2gteAIQXqV56iB+sSkHedk5aujl1MVHSRXiGzm8FZbuUcLY
	48ur8LZpde1RdQ2cJ43DGsZHK2J4DSvD/Mmdhe9hkV5cLNM9ufPiEmkFLaKydX4j3hdZRPtKzfH
	JNV96FdS+U+8xDt0jWToJgnxth0RlzqUekjYlz2VofWOIcp21y+KALEhK8nmI2a2rY3djCm980U
	GNAYT7h1ywZ9v5Txnzp/JMmi48SHWXu3bwN+55t16B5Zhj1f55h0GSPFBYEAXK74i1AyMBeRmiZ
	k5Cu39525bUhsmzwwqHJJqDadu7xwtGubv0azsKkx+2A4NNMJQXY1JrhSyaiI+Uvjd65KNgxD5G
	nvYDMxBCVA0D60lKlHPl+5UgCgq8fjYhO1SxZAcNtxzaQczusyaZcyZJPPhY8Yuh8VklQiXzD2j
	c0kwtqyGdVnlEp/QUHN9DOviLkDHVcTAaKiFW4W5ygJxKrayZxY6HoG5SvnkGRcMfjyuI8DJGJR
	nbj9eX852Dh45ZJM80oSYhsQ8VsVOzzfO2xGiE0EgisqnxFo=
X-Received: by 2002:a05:7022:1706:b0:1b3:bdd9:cc6d with SMTP id a92af1059eb24-1b3c034619amr3483867c88.32.1794444482628;
        Wed, 11 Nov 2026 16:48:02 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:48:02 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
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
Subject: [PATCH v27 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 09:47:02 +0900
Message-ID: <20261112004704.49758-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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

A TX completion currently advances the hardware position even when the
used length is malformed or the device reports an error. Validate the
fixed status response before publishing progress. Retire the request
once, latch XRUN and schedule error delivery while preparation is
active. Keep malformed or failed transfers out of successful playback
byte accounting.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm_msg.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -980,6 +980,17 @@
 
 	/* Playback requests point directly at the ALSA ring. */
 	guard(spinlock)(&vss->lock);
+	if (written_bytes != sizeof(*msg->status) ||
+	    le32_to_cpu(msg->status->status) != VIRTIO_SND_S_OK) {
+		vss->xfer_xrun = true;
+		msg->length = 0;
+		vss->msg_count--;
+		if (!vss->msg_count)
+			wake_up_all(&vss->msg_empty);
+		if (vss->prepared && !vss->preparing)
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		return;
+	}
 	completed_bytes = msg->length;
 	latency_bytes = le32_to_cpu(msg->status->latency_bytes);
 	vss->hw_ptr += completed_bytes;
