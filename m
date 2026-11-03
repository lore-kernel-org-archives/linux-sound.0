Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674038;
	b=mF0zothgZg9uD84IdvH+1tF0qh5NMVOhJ2JXYt6E2ech9xid4JYKd2aIkKP30TtjLBWz
	 d1C/8YMylRl4wtoYhAih2lMPyzbPWQdjpkyOJpsoUbW7wV3JX/uKxkNPXO44PoOGwDMFQ
	 hAwo62AtNk/P+h5159ZYi57NT/BK5XRxjS2CnX3ryVzHNe5zESj7zGXlKVlw5svKDJFCs
	 Vp5H3BJsrWFEcLtQPW6WyvVAYEtkeCBlrj20Cg9U9dXpm1wUoijHjSJJMxAUlyaLqdvao
	 IajCrHcMd0ao9edP876WTlaWwCVCEeqUyuU9uyA2/B4++AdzUPwn47q9C2Nqo4ItlwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vrSlLYKqBTk9lHfoJXvUFx0RvhGbfM69yXRklThhUu0=;
	b=JjQzAW2Zda6hUyPjFTCOuQtQXBPfJ7M9zfway+iVn+PlNOyqw9wK9b245dGvfoao1JOw
	 J2CKzv1ivULthbbe8D6yMQjszZ4dIiZzrDDIpnPsnTpMXpJ/tkbO1OpCJ7x74CzAbkKiw
	 PVJJMXB2bNaGYbxF8hykVZ28By/ot1M6gNu0SnC65u5bLGtOzt/8A/AmVL/scOE5j+2/j
	 TOPUmP9fpPhJifb5gABlQ3NbtKYl1HCZ+Slvk3ARjAoCQWXny+W8+KwM7miDgMn+6rT1c
	 rYUJW6CYGRs4pgHLRhW63sECLxS8aTYY9yUsWsnWUZ0gRI3NjP03KVdsAqYEM4xIT+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nxdVgLv7;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D4C606A326
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 02:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D4C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nxdVgLv7
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-84a248254f4so2577151a34.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 18:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674036; x=1794278836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrSlLYKqBTk9lHfoJXvUFx0RvhGbfM69yXRklThhUu0=;
        b=nxdVgLv7IBC1nyRc9b2chIdr/JbQJ3EfOur0Ekw1+AiE3HQyyGOPNwiB1VBV3zgFw3
         950HwYRCCN6eVrbR7EIxBN5WK25f7AxPWrZd+799ARISopMpNbCdQiga+HrDFCeV5QQv
         g+QukyIqat7Nl07ve5ix9iTLW/xKOVUmOJbt6gG1WTV+R9s2xYMSfDCtNqq3dJS6aFLX
         Gm1A0eaEEPnPzWK2sbEpWsNL26u+WWO78MSVxOWuLB8M0UZQmeaQa2UCATAh5TkteT2u
         kM0F8180vpPlJjbECvrls7HcZKyE1aPKcDJR8eCx7rGoPVolXkjg0SJojB/lA8s+nqr/
         E1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674036; x=1794278836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vrSlLYKqBTk9lHfoJXvUFx0RvhGbfM69yXRklThhUu0=;
        b=Gn6YuNElEID+zNzmlvWnckf17jt5sMWQbTE/zSsAmtYmcQ7WfNidTJmSfwWEJy/CoE
         xj/xA8RwAh20wpnD/FGX/FxzmuyIbe8ISLmwhWfwJhEwfGs+MrO9RMv/gCa1QudQx0Rn
         GTiE92h1k8+6igj1x54WkLQKJTJCC4mUCgw7XaX1tyeyBqouZNwyqxPlRKhYn8UqvBdn
         KnH+5JmHl8rsxh7l/930PxW2nfDdtb0NpZDLMYJU4tfk5Eofvuzl8KeyrWj4Xd65v5Y+
         rWpHQtXt0vaypnXetr5b6KWCVQ6pxFMf/XH8r5LTjirKBVRqOaD55Ls9/cM7PDy1SCj7
         eebQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrfFn9IvARUfTC0eKq9K+9qN6r0ts9nY7U8SKxL31HOCDXwRftIBH72GgNS1fSqIAekqcpG/LFQfsGgw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKDCqfOp4677NOQol8n+Aw5HacOS+11S82C+3xU/5rGrySASHpE
	HNBwjEHeYoUqrMrgM3ADTL8YxLuP4ad1ScoYdwtIOvOpFGMvmvp4CzFz
X-Gm-Gg: AYBFou1jtO6LIcsEmbXEegcHlHPIs2brGrIIjFvVZokAp/bt8NcFJl4xadYHL/0saIs
	aQyMjhu7bZKbr3+y+u1vuFq3em2Ty637N/Nb9E2QRFDjOjLI+mcJ7LiivnsmQZLiejWfxs7xPW2
	3iF1suGhVHb3B4E/PslxZ5Q80pT6a6IxllfCGdhJl2tGG7mEoEbRUsHT8uRhsRb5HWYmLriDyWu
	20WjL06UnlI6f8oJ4dNcOvd1j3XWy4a0y1v5rVWGIBHggI24ccyKBFk+lFH5WWzFoZpxXJncC/Y
	wJmZyZDIHXzu5aDGNU1MGMr9QaOmvqnzBCQp15aFokhqlDcqeAhLQbpbwV8BRJgaIsrtpOP3JZE
	TY8HkZ3LVfkMSxj3d9zuIh5PWa1xQ9OL3YyBtz/BORzp2i8SARjZiY3MoXKHz/nrT07k/SU9GOZ
	WcJPhgXSDrbsFJB6q3r8QtbZE3UlCvovEqGquEw+h0A+OGV7JIkyoVYKvqyXlgsLAxVhrrw2egk
	w1no8piLoPf5YJYsMExONSvtzMSpCsCIF+BA5td8IQP28wzEN+E85KZVuPg9+xZIKHYMvFNTVHY
	HY6wa3cP8WdWUwKoNuq3dmq8hvjgQSGGJd7ONEXQq+XR1awA8nG12St6U7VGsDlHQQY=
X-Received: by 2002:a05:6830:a1d2:20b0:85d:4ed7:1cb0 with SMTP id 46e09a7af769-85d4ed7219cmr3495647a34.27.1793674036476;
        Mon, 02 Nov 2026 18:47:16 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545bfebsm10427454a34.4.2026.11.02.18.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:47:14 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: Re: [RFC V2 PATCH 00/11] Re: ALSA: usb-audio: Audient iD14 MkI vendor
Date: Mon,  2 Nov 2026 20:45:18 -0600
Message-ID: <20261103024518.948089-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102003257.10134-1-arc@gmx.li>
References: <20261102003257.10134-1-arc@gmx.li>
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

Hi Christian,

Thanks for RFC V2, and for folding everything in so quickly.

On Mon, Nov 02, 2026 at 01:32:46AM +0100, Christian Ruppert wrote:
> Makes sense. Added to RFC V2 (in patch 10 where the cache is added).
> Please double-check if the logic reflects what you had in mind.

Yes, that is what I had in mind: a put of the cached value still
writes it, but returns 0, so alsactl restore sends no change events.
On an iD14 MkI, a put of the held value sent no change event on a
write-only switch, a volume or a matrix control. A put of a new value
on the write-only switch sent one.

One question on the same function. A FORCE_SET control without CACHE
now reads the device before each write; in RFC v1 the put skipped
that read. If the device refuses the read, the put fails before it
writes. No table uses FORCE_SET without CACHE today, so nothing
breaks now.

Should that combination work? If yes, the put could skip the read
when the control has no cache slot, as the diff below does. If not,
a comment or a check in snd_audient_add_ctrl() would say so, and you
can drop the diff.

> I don't think this is necessary as it should be rather obvious to
> everyone touching the driver that the u32 argument can't carry more
> than 4 bytes. Added a comment to the parameter definition.

Fine with me.

checkpatch --strict on the 11 patches gives no errors or warnings,
only CHECK-level style notes, mostly unneeded parentheses (04, 05,
07, 10) and alignment (01, 05). I'll leave those to your discretion.

iD14 patches on RFC V2

I rebased my iD14 patch series on RFC V2. Three of my patches are now
part of yours, so seven remain:

  1. a step size for integer controls
  2. enumerated controls
  3. a separate mixer map for the iD14 MkI
  4. iD14 MkI monitor and routing controls
  5. iD14 MkI mixer matrix
  6. iD14 MkI write-only controls
  7. the iD14 MkI FU 12 control

All 18 patches build one by one with W=1 without warnings.
On an iD14 MkI (7.2.11 stable), the controls passed the same read and
write checks as on RFC v1.

Next steps

As agreed, I'll send the final series: your 11 patches, then the
seven iD14 patches. Two questions first:

- Your four mixer_evo fixes ("ALSA: mixer_evo: minor fixes and tlv
  addition") are still open on Patchwork. Should they still go in
  separately, before this series? Then I'd base the final series on
  sound for-next once Takashi applies them. Or should I put them at
  the front of the final series?
- If the diff below looks right to you, shall I fold it into patch
  10 when I send, or would you prefer to take it into your own tree
  first?

Thanks,
Will

-- >8 --
From: Will Porter <mrwillporter@gmail.com>
Subject: [RFC PATCH] ALSA: mixer_audient: Skip the read for an uncached FORCE_SET put

A FORCE_SET put without a cache slot reads the device before the
write, and fails without writing if that read fails. Skip the read
in that case, as RFC v1 did. Puts on cached controls keep their
change reporting.

Also fix a typo in a comment and drop a blank line.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
Proposed change to patch 10.

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 483ab8f..33c2d1f 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -329,11 +329,12 @@ static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixer,
 	int ret;
 	u32 val;
 
-	if (force) {
+	if (force ||
+	    (!slot && (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET))) {
 		val = !value;		/* just make it different */
 	} else {
 		ret = snd_audient_raw_get_one(mixer, ctype, slot, cidx, &val);
-		if (ret == -ENODATA)	/* FORCED_SET and not cached yet */
+		if (ret == -ENODATA)	/* FORCE_SET and not cached yet */
 			val = !value;	/* just make it different */
 		else if (ret < 0)
 			return ret;
@@ -352,7 +353,6 @@ static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixer,
 			slot->value = value;
 			slot->valid = true;
 		}
-
 	}
 
 	return val != value;
