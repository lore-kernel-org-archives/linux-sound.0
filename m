Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309113;
	b=5QxYgUqXWAb1ZnVhwtuQS5mzuZ9fNgzVGC1ly9VhCyX5cXZijeuttbWOB934Ur5Edztf
	 KyGCKrtpL033w7GIbu0hwDWvcFD83Bo3UZ0RIM9uW2ldwizlu+dNE4GuvNgkM3J6WIUXx
	 drT5+Rq4JP5teX2VWKvHeTHUaOBj23RJLt0bcMUKBzzKnm9mmhcdlTpRqAxhcXH4vtTNY
	 hKuwXPF8FsrjK/JsUCpnBo453I3EEExp4qs0BQUpCsgFOQZHHRRrb0AiZqQxf1vEW/xYk
	 ckYPIdCAKv85rcZm5F+9RWyBzeaMSWWpIZAam2Nf/BCC47cwcZBkNBDjaOnqf9h2lbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ea9ON9Wj1DOOIT9igutSk+68F684zXNb1sM1QM4w78w=;
	b=3unjZc9eEJQiZGZEARugpwPgqUQTDR/6c9Gs3i0bnijQxCutB725VJyT2F9X2b4LdFhX
	 wE/2I4gv6ruPbzTkJp0yF0bqeI1/5PlEEvsdn27rp6Wcpc4yZ/sNxbfLe1/44Yd06Yagg
	 Q4NGjdCIv4mk20KYk7sXRvoe+TYd9X1enKXL/iiZHo1FdQsjqjDDinKxJPF5KOrg+4rsG
	 d2DALMiBMHusGRFvoLqTpGLc4AOJuZ2aCo/4j6zMIK2ekIIrM5+7iM3ft+nRHTTZp7CUS
	 3wDHawrw1RGVEj8rpeFHu3K5RpQxpxf67D0e6Fy7kGj9q4FUkKkQzbDnbHWqkFCoshw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DsDj15i4;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F209606A322
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 21:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F209606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DsDj15i4
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so43112f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 14:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793309110; x=1793913910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ea9ON9Wj1DOOIT9igutSk+68F684zXNb1sM1QM4w78w=;
        b=DsDj15i4i7pobUcNAo7yZfc+jhJrDBUAb38Y4HTjIgS3nngX9MIWiQ2XSsffZApjIx
         l56eMN0Q/efpgHszwkK4tA8LBe0QI12lYCgPtgMlWg+/uYHHHVYif63Uirb8EATF84Jo
         wIXilJliUrbfJCwsgJsQJMaNLrRch1wxjKwvRfgKRFXWeMz4mDHe4YyypSNX7v/uQnch
         M7c5GwY4M+tg5BgvfUzclYnIfyfY5Aebu1bNJmzwbKcExnrCF4e7zUTTy1LqUQ4GmSI5
         NdUk6V+OFMcvMA6I0ufg0vcF8ogFnHdWBtBFvGDo+rErIDgcY/dmMcvfUEekm7AAeBy9
         tgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309110; x=1793913910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ea9ON9Wj1DOOIT9igutSk+68F684zXNb1sM1QM4w78w=;
        b=yD2a2CLdmZBvYiaGdDnfqOPVUm2ycFiMjUu6/6wbzdeVrIqPukSGxLLheeWJw7+Txt
         4MAPWZmTCuZEDvfMUeAw9aXrl3mfkaRXE96HqqXpAyhlS7AnHhgXIeQzNTPB7hnSUA1p
         P5FRj912n2qESe98csQboXXO/q2JHjvv75mnzcAc26bfdPC5yaJy/eaWRFrrPl9isE5p
         eqKbVqxJtHyXbtRkbk+nkOlcN4ajPmdfVJ2vsaV33pS5sQxwRNHKBivvxXZP79UIN1E3
         NkfcESL6oq+y1Z4KzPDsSX+gRnXFWnq4oxOKCbIb8kMpSgKiIjVRgV8Q4PdrqbcGbypj
         Z7Tg==
X-Forwarded-Encrypted: i=1; AKwUvByBIbRt4GDNa2Q8SUF1QoLdhYo8hg9zO4xgd3ZFybfXSYraxqOpI4l0LgCs7/w9PjV5MpX0sLbM+/YlXg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIOQd127gLN5eGeq2GpSn7IOQ+eNmI3J/VtNtoCCTnJYaaHsSg9
	U4a3hVgHaA87QWFEeF+yNullsu10zw+vL2LmIOhJS/D3Lpr6BladAfY=
X-Gm-Gg: AYBFou2qPA/5J1VUDDyVgj63LvrdX9n5TBi6YZR3EBZJ6/LVy4BTen7E/WfuOfHjoIz
	9c1hsliEWWQdfWMlLnWVawDZvrQjPQOZ5z0t1/WiNA2wVB8VKBwXvhtJL1iqo2jk0xLX2Ulufus
	V7PrMXqh3oM+Z87GDcYM3ud0oQpHK8aKkeFw34esjL1bpH/rjOFttB1NjKE1Zv4xp2rHqFA/x+l
	DDJDNrtrU12TGZO4yeZwho52vr7N4PNrTYcLzEv8te1uU5xyYMpHQRV2fdCQX4lLA6HVNuoS4wO
	no3C67oz6H8gqvV2a+f6VGane9Irf2AIjph/Xl5iyMy5F1oPV5xj+bYgOzcxl31nQJ81RF2R4ao
	BIx94Q6Jdx57csr1z/meOfxsp4AB9/5f+VuB2VMGM6C+vMAJxGQmkMpH1qnvxLnYMf9nQDH9Faa
	CLTDmJPu66UfCV6nlvONYG3mxrzwnwzkHS+7y5SJrSiKIcER1YUPEkZasqRV+y2K3w9HPnlmVzV
	aFb7XuD9LBz/ZMVrKFig/LxpBJvu8Gw6fzBH0C27BHUulQTICzr5yuXkxjxxLIq+vIUWu3sMg==
X-Received: by 2002:a05:6000:29d9:b0:48a:fe00:ad1 with SMTP id ffacd0b85a97d-48e6e2c1d3cmr762377f8f.6.1793309110486;
        Thu, 29 Oct 2026 14:25:10 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb82584sm714873f8f.27.2026.10.29.14.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:09 -0700 (PDT)
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
Subject: [PATCH v2 1/4] ASoC: rt5668: cancel jack_detect_work on component removal
Date: Thu, 29 Oct 2026 21:25:01 +0000
Message-ID: <20261029212504.2997364-2-tristmd@gmail.com>
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

The rt5668 codec driver initializes two delayed works but only
jd_check_work is cancelled during removal. The jack_detect_work is
never cancelled, which can lead to the work handler accessing freed
memory if the device is unbound while the work is pending.

Add cancel_delayed_work_sync() for jack_detect_work in
rt5668_remove().

Fixes: d59fb28562232 ("ASoC: rt5668: add rt5668B codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristmd@gmail.com>
---
Changes in v2:
- Resend as part of unified series (no code changes from v1)

 sound/soc/codecs/rt5668.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 4154bad276101..0e6594c327311 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2223,6 +2223,8 @@ static void rt5668_remove(struct snd_soc_component *component)
 {
 	struct rt5668_priv *rt5668 = snd_soc_component_get_drvdata(component);
 
+	cancel_delayed_work_sync(&rt5668->jack_detect_work);
+
 	rt5668_reset(rt5668->regmap);
 }
 
-- 
2.47.3

