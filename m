Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423704;
	b=kep7qQO2SXm19+2dWTJOJ6Yd25XC+c02h0YHkLeJXZPKiudvBf4q8xAkUv3QSEY5Cr88
	 i9mxsgQ7uTzcLfzUjngirEeLyg06JC8WoxtI/fh3qvLVD8tlmqUZeq8pbxeT5fiH2oQE+
	 Z236N9DnB3NWCbUxM8ZY/sueVaGOyYSnAwAjp9tL/lzyHCgMs5gi1Fx9D6eTsite1iEBh
	 fKztTz7gKOPeeONF6Ek3IYK6HlN9XYGBGuKoyF9b7vJ8n0mBYa9y6KwhSyqBGYP1/oaB9
	 i5j3s13Nf7t20r/SdaI6GBKMLsYcbuDMCG4mbWWB2m/4UwsfvG1c0GT1JiTl0Z9zPGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lxmVrZBFe7Tii5Gnvpbpq9C2PBprHphcGv9dlcFYOrA=;
	b=avAq8aX7Oo7p6EmVk93Eet5pDRNrPN8Cq7OrZWVbAlPC6+zN3tOv0jmIGOY4KPmtBThc
	 T5+kS2e0vj0jKZyeFgrON7QRa/DpOdoc0bxJn/1QoVq9z9bpt/iY0AWdo3aniHQSpY52w
	 JtZAjB/LCUtySGeL/VqBbbBREztm0sSWt7QII96gLq+IQkFbjkKsEpMAimup1m2bisVVY
	 EQMwLAj5u8U/nT5hSd5b3204dRm46yELKKSes2KNQCFeDjQs0GdnF5SWEr8A62jFjTT3b
	 PWn63Tg/hqryukQU9BxD0GioPPiE9rEqv9/As4N2H7eHhuFt1Txmd0TD5TM0rzgnqDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQ3LKg4T;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4010606A327
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 05:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4010606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQ3LKg4T
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so581774a12.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 22:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793423703; x=1794028503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxmVrZBFe7Tii5Gnvpbpq9C2PBprHphcGv9dlcFYOrA=;
        b=LQ3LKg4TwJ0RS2hjAVD++TUZItD1wQYO618Qx7Jwky16mAxmI3QaiZrpiI/SxUQPJM
         75BzzcyxuRo8g7x3xXGmGPI3qVJ9ejB2UMhGuBw1cHt23FEO6Q6NxdwhtGf6EAYWOYOc
         bbKZ98w/GEm61N5tVw8ay5tRULWnkQkzP+MAV4kZGPnRL006J3Hb46t1LauG73ODdYSA
         9YX+lI1rtQxO5GpSeVjmH2zTtekAB0O4wvllQiKEgUh0tm+tRGsazhcDAGWa3knGbSFL
         8/FAJ0U9N06h2PF6JfDn0JqAR926J/hx3VY39596Rls+r2/rDt5WCdz8zeTVQt3Bo9RP
         3JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793423703; x=1794028503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lxmVrZBFe7Tii5Gnvpbpq9C2PBprHphcGv9dlcFYOrA=;
        b=Fd+G7QmaTijz57rdum9eu8QXTgMfd5b5zCP+oJSjSwt/O6tYNhTltGUtFil7OUF+C3
         eASggrUtmed3c8jwBEUFXlSi9k2tsJXlmwbPJ8OM1hKCrPn7QAJExMhv6HBJAu9jbLsc
         6dTJbD/9s7jDwLYk32uzw3Z9v1fTM8Az2fjgANDA9lAh9a6yc1NSbuyVuUb7wcL/cE/1
         b4noGpVabg4st+vU+ylYW9amCsPNp9PeZdmBrosDl8ye9JwzyiBXhXpjDy5+3hqQeAxT
         n6nCIFMzDOtSix5eIOPMSgJZ4HAWOQHCoZFJggH6elnhlp7OqCD8dXt9GVvHbhynGTKy
         nGEA==
X-Gm-Message-State: AFq9FYLWq7LQ1FruhwKIL+UrKbDbtAhDZsIhCefrDdH01UvY7KyOuVbS
	ZmrsFanjkjtSEXesX+VOA0YLGHpwzNAW/7JcdciUdsGRULEXgHqVu1/n
X-Gm-Gg: AYBFou0RpoMdsUgk/09jZhlvrCJ0sMo4fWAs2DavG3NWcJBpbSFaSbHufTnGwPYnDQC
	EXz06oy/Jom90PnU59QRrk1zGyxsbcJihApplDa6PCCk6yfnTcBrH00D9rgvg6++9AsB4Fyc70s
	4KPZiIdY/gbGA9U/viDk0wKkEA3xmg4p/9VtqyMYzjAfnO2MCZ57w8YAxFk6OtudatxTetL1kpw
	GLIZWxYvq0NHv7m0Ww5OWSXMFGDepksB/EI0/gHzcvW+MKHsPk90W/RVjg5I83SdMxXuGXUas3u
	jHSHFFbIh+En/B/SFlPBu08p2WXDN3ssbHiooe+JQziG8hOGL+vg+3CAsCxGnvpQ2ZtAYNozZa9
	8lRL+oWPqpYCERcxCILqItgyL/wAOfjuT81vkBlCa8tvmgsKv3eHcEqXOwYzftWqZWr+LoQb8OU
	nivWbcRA5riob9qQpw9EZU0nnr0n7DtXnq6r3248oaqC46QtHlhsLWoaTYQkAoGvz0IfNYbX40v
	DZSWxu+TmnucpZcVulFOoiy5omS1TxGbOphzpKJz4AVK7EzB4ZaJClFCWOs1ZFwu5Au5YirVFv4
	VIs5TXmBcpQ5TL0eovB3lTNY
X-Received: by 2002:a17:90b:28c5:b0:3ac:8897:7b9f with SMTP id 98e67ed59e1d1-3ae897a8842mr3196174a91.43.1793423703089;
        Fri, 30 Oct 2026 22:15:03 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm6216305a91.14.2026.10.30.22.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:15:02 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 5/5] ALSA: hda: Wait for the files of the codec PCMs before freeing them
Date: Sat, 31 Oct 2026 13:14:30 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
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

The codec remove waits for codec->pcm_ref, which only counts the streams
opened through the HD-audio PCM ops. A file uses the PCM before that:
snd_pcm_open() takes pcm->open_mutex, and an OSS open walks the setup
list of the PCM, before a substream is opened. snd_pcm_release() also
still takes pcm->open_mutex after the close callback has dropped the
reference. When a codec is unbound through sysfs while the card stays
registered, the remove can free the PCMs under such a file:

  PCM open                           codec unbind
  --------                           ------------
  snd_lookup_minor_data()
  snd_card_file_add()
                                     snd_hda_codec_disconnect_pcms()
                                     snd_refcount_sync(&codec->pcm_ref)
                                     snd_hda_codec_cleanup_for_unbind()
                                       snd_pcm_free()
  mutex_lock(&pcm->open_mutex)

Opening the PCM while the codec is unbound and bound in a loop triggers
it:

  BUG: KASAN: slab-use-after-free in mutex_spin_on_owner+0x94/0x2b0
  Read of size 8 at addr ffff888005d52a58 by task hdatest/90
  Call Trace:
   __mutex_lock+0x16a4/0x24a0
   snd_pcm_open+0x230/0x600
   snd_pcm_playback_open+0x5e/0xb0
  Freed by task 94:
   kfree+0x2e5/0x510
   snd_pcm_free+0x9d/0x150
   __snd_device_free+0x121/0x370
   snd_hda_codec_cleanup_for_unbind+0x219/0x920
   hda_codec_driver_remove+0x1a7/0x2b0
   unbind_store+0xd1/0xf0

An open can also get past the wait and call into the codec driver after
the remove has cleared its state, which ends in a NULL pointer
dereference in playback_pcm_open().

After disconnecting the PCMs, wait until the files opened on them are
closed. Do the same on the probe error path, which frees PCMs that a
late probe may already have registered.

Fixes: bcd96557bd0a ("ALSA: hda - Build PCMs and controls at codec driver probe")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/hda/common/bind.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
index de867f34f290..66949c4ff21f 100644
--- a/sound/hda/common/bind.c
+++ b/sound/hda/common/bind.c
@@ -84,6 +84,20 @@ int snd_hda_codec_set_name(struct hda_codec *codec, const char *name)
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_set_name);
 
+/*
+ * A file opened on a codec PCM can use the PCM until it is closed, also
+ * after the PCM was disconnected.  Wait for those files.
+ */
+static void hda_codec_sync_pcm_files(struct hda_codec *codec)
+{
+	struct hda_pcm *cpcm;
+
+	list_for_each_entry(cpcm, &codec->pcm_list_head, list) {
+		if (cpcm->pcm)
+			snd_card_file_sync(codec->card, cpcm->pcm);
+	}
+}
+
 static int hda_codec_driver_probe(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
@@ -152,6 +166,8 @@ static int hda_codec_driver_probe(struct device *dev)
  error_module:
 	snd_hdac_device_disable_unsol(&codec->core);
 	cancel_delayed_work_sync(&codec->jackpoll_work);
+	snd_hda_codec_disconnect_pcms(codec);
+	hda_codec_sync_pcm_files(codec);
 	if (probed && driver->ops->remove)
 		driver->ops->remove(codec);
  error_module_put:
@@ -182,6 +198,7 @@ static int hda_codec_driver_remove(struct device *dev)
 	guard(mutex)(&codec->bus->core.codec_bind_lock);
 	snd_hda_codec_disconnect_pcms(codec);
 	snd_hda_jack_tbl_disconnect(codec);
+	hda_codec_sync_pcm_files(codec);
 	snd_refcount_sync(&codec->pcm_ref);
 	snd_power_sync_ref(codec->bus->card);
 
