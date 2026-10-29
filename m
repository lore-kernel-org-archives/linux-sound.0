Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309115;
	b=hH80yuv0kT4EXXjzmOqjiRv/U9UAXDXPixLTe/n7LuDOrdgkCgrpOHB6plWT417Fmxhv
	 XNxMlllxwX7tgu6tweuH4KKBAit0p6tjPUPs2Dz9gYSCKU6Emt24arNmmmB8L2ctMK0L1
	 eWlS0c0pX+WZyfHrtE1GYPnCR6iURrIqNl0CDNDR0bNZb4ElenjvZ9S32X10cEh4/Z5G2
	 KcuhX1cI8eFPa8kJTIzeqZ66DkYh5EzDgH8aOIESdgW7Z/ogZl7XaBm2spAhIA86+rRRC
	 veLPBzPqB4pMptC8udLaFoKd6AoOqi6Bd88TWGRoK0OswE47CwuyeiFMcPaJurqeMKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CrBgGQGqJWx1uEEiW4SUMnU3kVwTxs6ZeaQFQV+W7qU=;
	b=XKnHO00abIfopvdoyhY91ax8EFhTh0/90SylS7UffyFH8K2w7eprY0T52llV+4Vgyq9T
	 si63nS3DNqjtTVTFrUGHxj2c0IzwP8C95hydWlfBBSwoE26fyRlpG0ii0AwByQpWAQ+X8
	 JejR2gW1F7IBhO/0JerPPkf/evt0+Y19j9F5geFOMJuOXxKMLaF2vWeYqoONqY4D5F97G
	 3hPGi4ed1d3MwqffgAraJzKPsVTbYa9/17gh5pteTWxezMm8ZJZb0WrnpbEEdANaFcVu0
	 kcA9V45yKUGddRiq/hAVGnNtsDZ/uGEfCPPmBjMfBj3TEnoL7sNK09Z+j5JhtRjGNVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NvBz9EMb;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9201C606A320
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 21:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9201C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NvBz9EMb
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so45472f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 14:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793309114; x=1793913914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrBgGQGqJWx1uEEiW4SUMnU3kVwTxs6ZeaQFQV+W7qU=;
        b=NvBz9EMbBNWMWUtdMwyCKGDsrgIhnBkizGABdNpwiy7me54e1kGo6lnvZhmOZAoSe5
         QnnmQVCKoS/n33QU34KyZjVYMJ9D0hwFQMsbSVeXOFXyPjQinn5oAXHxd8wpzuMh1oyr
         jGMEmweXumAnzR9wuxPmCpfycogCixBtEoF4zN6yqmhJwZYClX4EjAm8lUUmx8Flg6G0
         LHaFklDzpmPbheMMRXZV/2tIacv52V0CmSQYevr37KUYX9Zd/epIVaIAZF/xkdo3lKrs
         j67487t24sXSxn8L112RH9S3a1UU3CTuKp30/t0zJaW7P+qeWxhvpLyNUsFmEIux0nFX
         XtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309114; x=1793913914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrBgGQGqJWx1uEEiW4SUMnU3kVwTxs6ZeaQFQV+W7qU=;
        b=Lu0FHTXODUIoIs0gkD6cj2kFZcBKVd8IeSjLnbM0JVL0scztWmGnyd/xdzFQ7LRKEW
         1bqKkCS819ll11TGRwgotZkqCEzruMb1u63Ia7joptcdZQ9QP89cu2lfc16baE9DsE0z
         OwgPFG4puV35e1HPGyA0jxTA/CgygiB5rWf3DbdI5EqFf4x9EOhyEI7oIYfTrixKP5k5
         KdTDRMEdoLztWBmM6ooTqjV4E9PetFg0jSjYSOfIMBDe6aQtHknkt+EhqELGPz5aNjjT
         4CW47xnraog1HFE4T2kazEFkn71JhdLCtd0yjupMomykevFSLYX3e3OkHmiwQKj4ps0y
         s39g==
X-Forwarded-Encrypted: i=1; AKwUvBxZieFWKxMMFnBMfD40JTjLr/K9Vldd4FhUWnImtugUFfkGJJBNA9ACwNKNTxu6nxFToZUYIlc7jmYJJw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK1+NT0xNB5cQklqrm+O7PV4skhO+Et0WkmoD7ItnZRPPEDmrmX
	i7cZi+sy0RbDrmKmz8PHsDcMg6siYiUhzwE4qGWOjzYw/J06XKAJ8KM=
X-Gm-Gg: AYBFou2PrFb7p51mVdcusKy396FcMyzsBS4rD0mtoJXIASfORBnh3evSBwfPTLqvmpV
	E9YhUNfh9V/S858/FBltJHmlIf5DMXPDkAklK6PZ4KgO09BjTTLuK/D/8Ix/8kmU4JPZDOMeSEn
	kKRjtu7TstbELeNu+VYgKYcWhmDqk+i650uwuGfhoBZvapq/nDdN1f9dge8tPI0rGB0NF1dFNHP
	0e1bSxe0ZKHKnUWStHyXbjE7aWSdM56xtBAWFnbxVUKOlXLDXIEUgtH/8BW/nT4PKrkz74ZI0+B
	zmKrvtvdfRZD0NNoXBNUrJqxP6j6lrMWVtsWuIcTaFPWLZxOehW6yO9xv7yV3eCzdCK3kww5iuz
	bLGGQ/rAlWjUBnY25DZY1x84dPkvEHb4nFRay6hdIjzBC+PLZ3i6iHdBVdqiRioKXobyFtbNGAD
	L5P0Ev3xkY3ytCR4VBVenJw945r1kniSuieR+p6iGDI1srk+TXeUjhNDTIkAivKxWcidhUmeSsR
	QaLgGV26CwueaQ5MCusKcI6CGoNWzw1UYLLT86lEII0HPpZB0F6ffMJePe5axp7dzNhE2a0Ig==
X-Received: by 2002:a05:6000:719:b0:48d:fbf4:895d with SMTP id ffacd0b85a97d-48e6e2e7552mr1275586f8f.19.1793309113574;
        Thu, 29 Oct 2026 14:25:13 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb82584sm714873f8f.27.2026.10.29.14.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:13 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] ASoC: twl6040: cancel headset jack work on component removal
Date: Thu, 29 Oct 2026 21:25:03 +0000
Message-ID: <20261029212504.2997364-4-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029212504.2997364-1-tristmd@gmail.com>
References: <20261029212504.2997364-1-tristmd@gmail.com>
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

The twl6040 codec driver initializes a delayed work for headset jack
detection (hs_jack.work) but the component remove callback only frees
the plug IRQ without cancelling the pending work. If the IRQ fires and
schedules the work shortly before removal, it can execute on freed
memory.

Add cancel_delayed_work_sync() in twl6040_remove() before freeing the
IRQ to ensure no stale work remains queued.

Fixes: a2d2362edf9f ("ASoC: twl6040: Add jack support for headset and handset")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristmd@gmail.com>
---
Changes in v2:
- Resend as part of unified series (no code changes from v1)

 sound/soc/codecs/twl6040.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index 650836f9615fb..43feb660b635b 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -1135,6 +1135,7 @@ static void twl6040_remove(struct snd_soc_component *component)
 {
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 
+	cancel_delayed_work_sync(&priv->hs_jack.work);
 	free_irq(priv->plug_irq, component);
 }
 
-- 
2.47.3

