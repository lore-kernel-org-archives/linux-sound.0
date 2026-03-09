Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F309936C0BA
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 21:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093286; cv=none; b=SfFU2eZS3cCx53SgqBE+aaMDhs/ZWEVkdebg2yXFO9u7G86CvmLpAzgqRhT0qdlCU+l6tl2g/YA6cLC/32emJqPBcM7NlrVbDZvwFmjceMQlYFBTaejMbXOnVLLC404NjrxUXKwP+HdhWGG0jQcHE6xNpI2CnlO5mruM1N6T6nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093286; c=relaxed/simple;
	bh=C33DOxHImWrnDW6KjCtlo5uItxER0s/IpidwGgDf/KI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G1MaDq/DJo044PoldgtApFWCX8chNfAPjdN/l4RKbLgvgcvzRFaJvqRdHs5F0dOHfXaZpvf629xjwkIh+24JvEJqlmQIH1X9JdXL2pPryWnhhiaqMc2sqkuzPqhs41d6ZQsFCqJnj8nuHaRi6V4gL1lCl897GmC/sZmIGMIrmuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1UR7+KC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1UR7+KC"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852ff06541so24725165e9.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 14:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773093282; x=1773698082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4AKh+0u2hvnYhJKZG8MkqOVX69TGjNVm5i0dGiGa4Q=;
        b=F1UR7+KCU4+fwBHBzwmzlkgmUzYraTwHmJmo234+RCeF4sOdVwfi+cV1zMTcAjVxA+
         4mu7x8ZmqncKBrhC7DIN8lAXOUveFfYJKMEVPFQOb4/YCtyd6OpfiMqDbcECOj9fIEAp
         dvXikGyw8sRe3FvuXi2pzVfAUGyIxxROw+wFkv82mnrd3rS75d+uuC8H9LfwZxVrf4s5
         KjK6vUbO04a2q5g0uY4Qjd52AYRjLHAIULRuwFLWmgCO9K1UgwjhO7HSJ6KVvFNVhwX9
         QZmLNmdbuuPYpTKn3kb1KU/brCiZ47yFlT0uc3KOa7aIa7+e8WGA/ZDWeIECKldr0t/l
         iyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773093282; x=1773698082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s4AKh+0u2hvnYhJKZG8MkqOVX69TGjNVm5i0dGiGa4Q=;
        b=B/5iwFJVBqo1yAHSIYGW3og8G89xBZpvoMdh/JcMkn5d+DySyihtII7zxD3mEr7zPW
         X3VIHvpXahff1qCvqNea4yuduqW/aAsrAqPVsXJ7o7vkWmi2PKJHXABa7GnaD4IiUsTW
         7RlLXsz4WcBCQ7aYvHgqQnRNCBSsMiYVoBith3w4EIDgqn9LfYJInXKEhj9JRGiNDtpn
         IDyKI+KmgmBq0kWMfb/gqlHQiiAzXdmHxxYcyhodsWv/y7qLgBV4vPxOfMQ4Jhr0sW9x
         y6mMdbJn4cTDX+5q/pqfSq2zRtJY2jjXECSB6oTWM77yYeHLjKP1Em/EtJ96ezmKo5dN
         VXXg==
X-Forwarded-Encrypted: i=1; AJvYcCXRQI/dg68frUIBS9QG0cGIXzcdy1zl6/9Srtp9iXxdPq373+jXwV7VGv1F62Z+QYqSluQSh01YCFTGsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5FacqSwHWKrg0MVzqWxuzY9C1je+1UyA9Rlg6u0pO/y78ROSd
	YPara7smH1fXjW7romVGI+s1kh19wMEMWc7hvWDcVjcrAQemcFgaBB0=
X-Gm-Gg: ATEYQzwTF3m0asJ5Fqv5MpWHaNCo9uuGoJbDZgNIpJNwECO7OaIuQcWrELDyTOjdEgw
	Nky5GA7vDJU4KOOnW8074AabJgwfWqTHBwsmnv9O4ziDuROAzCOJUcqjZy0HUc0PshKiBF2kbHz
	8tQNw+0TqAQmkKURBSfAidDdIrsQNXC3/TGkWkBLZLEASdXIe8a/jp2mQxMQJaEt2aTKI0hip1U
	bz5YZi9cA8LmwJzIJUUWqLWxcj7BgWSR1DwvbsqvO5otawgnxQZKRSm6JL648HlbaxrOkVGBl8y
	9A7dtrOy2SfLlp+ZI9FNE2+mzZcfV58PZ7FX7pmnA7E4OuGOBPs748BB5p44KVjTIQaL6cbVvD0
	nFoFl/+2v8S9MJ88fvszMAy/2kq8OSMvFIbRKbxuSgzg/6W6sp3QLW+08c8DcKaoVvr1A7+GWqy
	IUhlt/koQri7TeN9+ioecc7eCxu/6Ui+6Uig0E5ZmVRKY=
X-Received: by 2002:a05:600c:c173:b0:485:3812:36dc with SMTP id 5b1f17b1804b1-485381238b3mr107933245e9.9.1773093282075;
        Mon, 09 Mar 2026 14:54:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e11:2401:e440:4d43:1ae9:c232:cc4d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a900easm28183845e9.9.2026.03.09.14.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:54:41 -0700 (PDT)
From: "matteo.cotifava" <cotifavamatteo@gmail.com>
To: broonie@kernel.org
Cc: cotifavamatteo@gmail.com,
	cujomalainey@chromium.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	srini@kernel.org,
	tiwai@suse.com
Subject: [PATCH v2 2/2] ASoC: soc-core: flush delayed work before removing DAIs and widgets
Date: Mon,  9 Mar 2026 22:54:12 +0100
Message-Id: <20260309215412.545628-3-cotifavamatteo@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260309215412.545628-1-cotifavamatteo@gmail.com>
References: <17591222-b9f7-4056-9c13-4a2ccd0788df@sirena.org.uk>
 <20260309215412.545628-1-cotifavamatteo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a sound card is unbound while a PCM stream is open, a
use-after-free can occur in snd_soc_dapm_stream_event(), called from
the close_delayed_work workqueue handler.

During unbind, snd_soc_unbind_card() flushes delayed work and then
calls soc_cleanup_card_resources(). Inside cleanup,
snd_card_disconnect_sync() releases all PCM file descriptors, and
the resulting PCM close path can call snd_soc_dapm_stream_stop()
which schedules new delayed work with a pmdown_time timer delay.
Since this happens after the flush in snd_soc_unbind_card(), the
new work is not caught. soc_remove_link_components() then frees
DAPM widgets before this work fires, leading to the use-after-free.

The existing flush in soc_free_pcm_runtime() also cannot help as it
runs after soc_remove_link_components() has already freed the widgets.

Add a flush in soc_cleanup_card_resources() after
snd_card_disconnect_sync() (after which no new PCM closes can
schedule further delayed work) and before soc_remove_link_dais()
and soc_remove_link_components() (which tear down the structures the
delayed work accesses).

Fixes: e894efef9ac7 ("ASoC: core: add support to card rebind")
Signed-off-by: Matteo Cotifava <cotifavamatteo@gmail.com>
---
 sound/soc/soc-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e5ac8ae1665d..cf826c2a8b59 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2121,6 +2121,9 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 	for_each_card_rtds(card, rtd)
 		if (rtd->initialized)
 			snd_soc_link_exit(rtd);
+	/* flush delayed work before removing DAIs and DAPM widgets */
+	snd_soc_flush_all_delayed_work(card);
+
 	/* remove and free each DAI */
 	soc_remove_link_dais(card);
 	soc_remove_link_components(card);
-- 
2.39.5

