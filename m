Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464753;
	b=KneIjIE5MYx+/4kgpIAApMtLIIQnO2wwwvZ9qHyefbT9tQxpOa5qK4w3NakwIHZwV2zz
	 4tQpSk87d8+sdPK7ALe4eaYlLUVwcXlwpXmNAEYJVn+cpDJ6SvzGA4yCb4Wgm7KDVzKjv
	 401IbpnYi6qY/mLiRNl90KBD+1W6hb30p5CABzbzjmgnhEaC7WqoYsoeabtg4rtZjcfpA
	 vl3fZu4of9GRcQktnrk7OoNi4wpWDxO89rObvq5ajR1WLney2ES8YQbhwQL8rM85GSKjK
	 hq42XnuWpBBwOxVqpJlwf2qXLEBB/BwcojRT/Y5eyG6RO37Jo93Ne4OYxJiluLIY/yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=beYL64Hvss3ccbKiP4QdnBm6FCAZ/FIYaHu7x4+Sa1MUBqn9+3mbuDAPlHVk3oOSw2G8
	 fwCpTE5qhagIVI+w7PeLU7GTj6Y3zvLDf54VEr6lPoLRiBM2+fwIq+f3QFxYvW6jEb+Lh
	 dT4h+GTnPX+axkFCLDKx3FZCGreRJGhNzZcXCMnF3xscxk4CWNf6Kp7Po3fcydxahQm/1
	 wBfRBdxNsCr7BxHykwkg554XHil9vn+dHqYZiq/s//SVK34/x5r1FzHYbvWW7SfvgkHAM
	 S/jzL212vNz1vybmNPsiBm//DkEAILP/DZrXoRZQgjwsl53stf93w+UFcr3iHECvyJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG4NX0ko;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA97460A5BD7
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA97460A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG4NX0ko
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ed39646f04so14941895ad.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464752; x=1795069552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=AG4NX0kofxyTGWkr7ZMsHsHJMtcdFPkZT3aA4nGIL5e/N2nyEbZ6jN4euwhkSZs6fT
         yCbeX8SacyNQ9bFadQ9anb/qkHtHPdVD6GxC8TmPe+Y4S1RBP3oZIvwJ70dLYE+zJLru
         6SgykBvc9O/2rJsll2pFG8PTdplmiQsV0f23VBLOlXWLaih2FVqsZxHVzV+B4NPPWGAV
         DTYArBAGm1ismZfucfAJKs2+J0GJxkI85Ma3krHNELWR7ybpBJN3rSlzE4Y/vNxf/iCs
         VikcK6FD7SxFAyWMv/4Up2VfWjhUA87KWJULtPkKcLUqQzPwy0LBPNuVOzQ2WHebwVuj
         Yl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464752; x=1795069552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=XbKu0EKKXp8b/3U7mVaNXDdEI9IyuvFADYjC/KaD8ujdMeea85zs1J59y+2emhzrN/
         Kai4u7Mjqgv8K1PtCHHeUaxQbcUeeHtw/iLCWXXGVrGW7gCXPoJQl39M6BFCCdzo1bG+
         fuiy4pwuwXjUfNRsMlY0QQ4cbpmKjOUqE4dicf2mywiIK1CHupIWmVciX05zFZGmiMCq
         Rgr0k/uKgQsw67rIWd/cv/9+iA9AXaVtfh+tod2o2OLSOlxXRL5dpto92UaB5//WBExV
         Fh9Y+exJcvXc/iySNt9/5f70mJYH5etYiaDR00AHLn8mBFggaE6vYwQevSFD222ZojH5
         uEVg==
X-Gm-Message-State: APuU4Z+AKj9LCccyKTZiC3rn9Sh9QwkQyGIrIZSoScyDb2GGU72IxxmD
	v3FtYmSBhzFFb5yYxW7o1gRYeAXjLHi5DgXHNl9e1LhRSegt+bmVNWO1yWLhHw==
X-Gm-Gg: AYBFou2qKqKUF6nA9V77LbhImnX9qyAdCaI1s3ypte65Njf5X5DHRsgxBtVioxBVEDT
	N3Fv0FNRGy6v2HwuBfUC8pPCdmu9LesGSRV7ah+5aMmWidPlJgymeXmKw4y8G5ZU3ny8OobLP0l
	JAI12kCBsCTBEWjz5ZGjPWRORRAVKPz9ELNksEExsXUrIQ61C/agAHBq3O2PYyO5uzJvTiNAmyY
	++zAta/UGNIdFE66eHs9CrXtV8rWTsWBCqzxgsCZEPHzMkgq6F7j0+2cdP8IGs6izwIVd/QfPQq
	aIwMGJgpFapWnHZ41HA/ekAPQsGiHM0bBbO6NV4peYmrKXTdu+DqITQgmVTmvHYUFMO/gj4tgXf
	WWTkXxhXcCPK1L5Q2NC3jYgkeIgQj2ybxEf9UZT6H1tNeNJA144t9Kf/vlEkTREhRL7y4F2jJVf
	gvsIL5y1bqGTWav7Kh8jVKxVoTeMSrYqEnTO7z4m/g8tCYL7AYU/eSC6K18tcJhK+1+cnmapcjh
	1nV80CClaRqmAxRo1vUDSn2B8dyvkWYG7l4kyCNf8M2u++MWPt2lyss5KG1Kby0FjBQH2vUI7gj
	qRw1MPquX81/XcTv9qeJ4LcPLZAXwBY6YhEc09tzZTyNrKlTHKmip/INCJSQSFL2LQegRVuc+Wd
	79nLgywUvKncxxoytktaaIWuqz7WwHbCz9z+GS0rhZbElb14=
X-Received: by 2002:a17:902:f546:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2edd7a20edemr51204535ad.31.1794464752290;
        Wed, 11 Nov 2026 22:25:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:51 -0800 (PST)
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
Subject: [PATCH v30 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 15:24:45 +0900
Message-ID: <20261112062446.159-17-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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

The indirect playback transfer helper samples runtime->control->appl_ptr
internally. A driver that needs to refill already committed data from a
pointer callback cannot pass the application-pointer snapshot used for
ACK validation.

Add snd_pcm_indirect_playback_transfer_appl_ptr() so callers can supply
that snapshot. Keep snd_pcm_indirect_playback_transfer() as a wrapper
that samples the runtime pointer as before, preserving existing callers.

The explicit-pointer form lets virtio refill accepted data without
accepting new application progress while the ALSA buffer-access gate is
closed.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm-indirect.h |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/sound/pcm-indirect.h b/include/sound/pcm-indirect.h
--- a/include/sound/pcm-indirect.h
+++ b/include/sound/pcm-indirect.h
@@ -28,15 +28,17 @@
 					struct snd_pcm_indirect *rec, size_t bytes);
 
 /*
- * helper function for playback ack callback
+ * Playback transfer using a caller-supplied application pointer snapshot.
+ * Passing rec->appl_ptr refills previously accepted data without accepting
+ * additional application progress.
  */
 static inline int
-snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
-				   struct snd_pcm_indirect *rec,
-				   snd_pcm_indirect_copy_t copy)
+snd_pcm_indirect_playback_transfer_appl_ptr(struct snd_pcm_substream *substream,
+					    struct snd_pcm_indirect *rec,
+					    snd_pcm_indirect_copy_t copy,
+					    snd_pcm_uframes_t appl_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	snd_pcm_uframes_t appl_ptr = runtime->control->appl_ptr;
 	snd_pcm_sframes_t diff = appl_ptr - rec->appl_ptr;
 	int qsize;
 
@@ -72,6 +74,18 @@
 		rec->sw_ready -= bytes;
 	}
 	return 0;
+}
+
+/* Preserve the application pointer sampling of the ordinary ACK helper. */
+static inline int
+snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
+				   struct snd_pcm_indirect *rec,
+				   snd_pcm_indirect_copy_t copy)
+{
+	snd_pcm_uframes_t appl_ptr = substream->runtime->control->appl_ptr;
+
+	return snd_pcm_indirect_playback_transfer_appl_ptr(substream, rec, copy,
+							  appl_ptr);
 }
 
 /*
