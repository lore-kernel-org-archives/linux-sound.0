Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7615B1DE3BF;
	Mon,  6 Jan 2025 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172830; cv=none; b=j9vU1w1wKKtwzT317Dwi4yiawzfTefEa3ITC8F70upIBL3Oio6yV9Qn5iWUyMeaS8dMbP+pEJJgT1Mz5m6mMx3p6xwmlLm09tYHgVdu9kf4VMJPfqqHoomEYVrvI3ojtMz7J1esB4klVstPbMgVly1BLnRbF32a0iOn1nfDzVrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172830; c=relaxed/simple;
	bh=YSOS9enDOKE1gkAqjpzLPjwZK0vkXvLtm90+s/qmGtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LU0lLTDjkQsFbxXO5xQ9ZITXZYQH6qWkoK7P0pZmnGekeTSLGHopKJiysy/6rUW+vRU/QHSLhOrLgouGW44T1BgzaJ45AiuoU25K/Z4MQVLvgqnek6o3h1n3elvfgAMunhkCwNo+9Cq/zUGVryQtJksVYFEA6j+3gVijPvz6Yrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=HDQAfZTY; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HDQAfZTY"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so2396606966b.2;
        Mon, 06 Jan 2025 06:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736172826; x=1736777626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJsdF/HqDSazQeuRYtol4zBsSURNokKA1EzOunr3pJI=;
        b=HDQAfZTY88bZ50SU7yY5yZMKwkB96wL1OyPItCVQRYhYjKf0kWL8ip2GaXlblqrT1D
         yM37abZoWVuEfZQERyAeoH63WE4TZevvv4pDCXa5Kwly/eqttc53k8Vreu+3nipLZsxy
         11hHOxGCihNpS1fguzFUwToJfSjAX4eWjnsuBDqtSAHcBtuD7+ceQO76B7mIJ8DwMEO9
         vjVxiXiS0HjYngaqZF6N0IdwNfBfj9RVI8TkrekeP4gp91jU7n9RnKpwyeO1yyHOpSJO
         geRdYjf+7kLl46HgtIZdJ3gAI/bl4vTQBGQiXXplQLcgSA4Jq53TwamNtm30ms9FPhV2
         bYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172826; x=1736777626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJsdF/HqDSazQeuRYtol4zBsSURNokKA1EzOunr3pJI=;
        b=X6hYeTu2gkMqJ6RsqYLqMd9ua0IK61MnNIeXLwS/NnZ186PL72bkdp+A0aze8Y1MXK
         KwMZ718nPOokKAILLYixL6Q5FnjojMacoYFQcJTAy6y58q5zqCOqyA9CnSRHtfpGkq4o
         0rRfQ1evxByhalBaBETmW4/WvK3zqcBloLJfH1W6LlVfJNqMoBU1dMV31OIU5uPmWdqj
         afIv927JI/qgxWi1vYoMPBp64mXj+Zlr6LHnou9EVRSmc3r1NHl55hpsGh3/b9wufZ1p
         gC1B/9efo5ISapxvI8ICEuRkRox6qOZoKdwyy8Egz/Ii6NdGeUuoTS2bufUMm0Jtp5Am
         pqHg==
X-Forwarded-Encrypted: i=1; AJvYcCV6AmGReCoZ29ZTUKVl+UfOurbJhYgB1pH7MRcqUFMb3TZYmmGdt0RJ/sgBCIBQXYI8LOiaD9xTzNgZUWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzytDE9Bvan/s1lcJ7FRRPCsuUbp2PMo3JqO0IKB06jBcUdM01
	qgMzPylVUnouTgOcwT2jlLFBogGggUKv7sCnfAPmrzgyA3FE8/UvPAlVVw==
X-Gm-Gg: ASbGncuL3FfasPZ7lZX9rM3BCwGWYgc/jib5d6VAwMkaBowYK38SYkJ8ji275z91UYn
	Ty7T3F+aQ2midOKIikgKDZRZO42K1C4lPcM3kNvLmaOwRyvh7EdJ9N8XOLWXHquomwxxdvSXwP8
	tIJAXjW0HCpb5ffKdE0cDb7FOtgAFUmA79aYvBH8B2FYA/ogLIDEGIydW2KS2fCJ5ghu6xzr4wv
	xklQAVoZT/RBHvO7Y7nA3O+1mfgiYPtByvuLLIK7yntMjJfMj4cUUxMYe49FVStQ1yfG0f051GL
	cwkSAXyPLVGXv9TmQslndwc3+ACLvYtPb8DMRTqcjGqovVksZ6RP8/4732LW6FD5HlToj3WQMSj
	DUiquMA==
X-Google-Smtp-Source: AGHT+IHIuepFynI4A05OgDhT0oqn0GIfPBMm7sdjUOMILAaYgE1oj9VYbYzk1jxK2bfrwjvAPu4g8Q==
X-Received: by 2002:a17:907:6e90:b0:aa6:5d30:d974 with SMTP id a640c23a62f3a-aac2d3286bfmr6068129366b.28.1736172826189;
        Mon, 06 Jan 2025 06:13:46 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a9f2-7d00-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:a9f2:7d00::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aaede7ef3cfsm1811342766b.77.2025.01.06.06.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:13:45 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH v1 2/2] ASoC: dapm: add support for preparing streams
Date: Mon,  6 Jan 2025 15:13:16 +0100
Message-ID: <20250106141316.375984-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
References: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Codec driver can implement .hw_params and/or .prepare from struct
snd_soc_dai_ops. For codec-to-codec links only the former (.hw_params)
callback has been called.

On platforms like Amlogic Meson8/8b/8m2 the SoC's sound card
(sound/soc/meson/gx-card.c) uses a codec-to-codec link for the HDMI
codec output because further digital routing is required after the
backend. The new DRM HDMI (audio) codec framework (which internally
uses sound/soc/codecs/hdmi-codec.c) relies on the .prepare callback
of the hdmi-codec to be called. Implement a call to
snd_soc_dai_prepare() so the .prepare callback of the hdmi-codec is
called on those platforms.

For platforms or sound cards without a codec-to-codec link with
additional parameters (which applies to most hardware) this changes
nothing as the .prepare callback is already called via
snd_pcm_do_prepare() (as well as dpcm_fe_dai_prepare() and
dpcm_be_dai_prepare()) on those.

Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 sound/soc/soc-dapm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 99521c784a9b..ac8eef217dc4 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4013,6 +4013,13 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		break;
 
 	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_dapm_widget_for_each_sink_path(w, path) {
+			sink = path->sink->priv;
+
+			snd_soc_dai_prepare(sink, substream);
+			ret = 0;
+		}
+
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
 
-- 
2.47.1

