Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792787386;
	b=N+tVaksMRnaZnYTvIIfN/TNZCoXXc3gaqXndAuK5gcgqkXDzVKIlQM4M3m+3JHrTsK1F
	 kJxXu7vMu47kasdYyY4VVwRLz2/35pT4osSH1hj1WHDHaiB9iGoxG2eSIqBXs1nRowSWS
	 sjFX5QsAkOyfls9/c3OrmFelwZOjXAIQ2dN5algTiY7v94nY0ZrFDGBh30Pcsu3O70+Gb
	 XJNWVhEzDn+0h89wB1QAfYEj2vybCGl53CleEHa0DJZI99S/fkvDW2+6MKxFA/nxJaDTF
	 rJypF8RtY2h1tDw1SKosZbnCRrCLejDYxe8wOXMZN+PLXhRfiEwls+HSnO/+VvZcVKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Sn7TlW7LwAqpn6wSyL4lj4tP3Grclism7Y7II4IuzCM=;
	b=Hix0E3WOfFBUcbJRY3sEVkXPBB6R6HFVmeVOjg1Y2/jfAL4cFBP6bZ1hH1eG6rPKJAyw
	 6HKtrmSmtis2CvdMZYc6eZA8yisd23OJmiKhERPgW/VaZOeVxQg9VOgYeEbO0S6OBTKhL
	 mnk0Z6dub2JYq+YMZ8kPE43CIbGFdN6Gn5ZHx/ZN69z5CViZT5ktfzk8u0ByXWemqqa2U
	 OJly+pqr0eNuHzworElsyGSLOuJs66DP0cvJDUCrQLjrGyeB99O368pGZ2CK2Evz5jOS6
	 qDRvTOKL9p9uqAE+IGkhqNZ/cS0P4CZXi3cdkC0Itwl1LRCCaaN+RiEob+c1VHX6fgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=F53dxBLC;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8BF606A31F
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 20:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8BF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=F53dxBLC
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1016040f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 13:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792787384; x=1793392184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sn7TlW7LwAqpn6wSyL4lj4tP3Grclism7Y7II4IuzCM=;
        b=F53dxBLCHQplU0TrQC7sHYSQIScueZ8m5XrTX6PRIHHLt42lEUEtwHq4Fa97qW1eIg
         uy1UoAeCE0kBn2sSO8cvEzKdAewgvmdocKMGFYGEhH7IQrmSwudEtwAKsXjq7IZUG1ws
         UBaJVUHP2u+miU4q2lmZWYSOK4feu9i57uTbpCwmAtX7DdopT4FLUTzbjH5sjDUwE42J
         7W2FE3USw5M2uKULE5qVviPVpAJrZXI7P6JFje6xlUkBlwxbi5td7RB04BLmrVN6kMvQ
         h9B0fi/VULxkTUO1+pJvEImzK7u8Ab6RGBfYvnks9xigdRtW9G0YNW0akRsZ66yiS7mB
         Ar0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792787384; x=1793392184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sn7TlW7LwAqpn6wSyL4lj4tP3Grclism7Y7II4IuzCM=;
        b=KvfJaLi4GR4tCO0hl4kljGC0X5RyNQ8ibv2L3ait+A9xD6q6bbzYtYWKLBkH0Fb6h5
         seDkyxq466C0MgZsesauknupsBMYKmEr06Iz5pn5BbAKxcrHaoeUxZmoVJMGRMSGeHsn
         F8jq8y3e/by0598IeazljToNtlMiS6KVP3YS0k92o5JMkuDNpgjL62A3arlDwr0gYJwG
         g94sQErvTu3MM1/2/vWdRJsAsz0unVeYCF0aq93fcUhTkCdRtqBYU17wE58uNvOO4j4I
         OwUSwzfT0FnPJJhzRuKrSgfotpgjlfzBAEzDJEP3ZhCeS8/fdJ3d+ieEBV0BBNkK6401
         6UuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNSQ0yXnFHR0Uj7+lJj1rMl7PsP89RVifx/c9FSWT9jnJ27BQOOp0VqlN2uMS8dyu17iKbAcXGyPBKfQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIrNjXK5E6HnMT1G4oWBClTodEQptFbwJTSzVm/SkH+FNynDx4l
	AMc3nCDG9u34NlLDTahqHWMHIsbdH9V8lTZ0cAnMszhtZbY5B5Nl5K5Ly4hDyMM4YIU=
X-Gm-Gg: AYBFou0gEyMYmE3713MdcHvjoKB7jw1sxLMAhjNkCCf4mh62zKCz1Ke8xrUD/c6YTpf
	B+zD4BPxrhOd9HH1GMV7fUAkQPeyvTTucMjrhKn3xrH3UTOJ2Nefl1IdhwmsSGQsFOu/mYDEOVs
	Rtsm1JqpksRR97fHngx+Nmc1W5loKr4pVqR5O28fvg20MzURh9nItgcYxPVlt6yui0mQKBVvCSg
	Zt3Um+JjKQ3q7DYulJsQmlQiA/Z3FdBhu7uEnf+TTRq2ma4c583l1zO7mtJnXSIkOXCylHHAl/X
	MvQXvfzzd0HZXvMOOSLDzWASIByYQIk7lYGAC2/10A1eJbd089eWQNVthpg6TGTVgn2npLoBPTj
	mt7QKp9qiTuiVZE8XlupJOj6PrMEAZ96+PciBiyk7crYbNfFeqfoBeBfTNCJJYuWGFoJ8qjRwdU
	XBDYWF5B9cPRP2iKxeLnwwjje5HMXRnkXow7f+7/75TM9tLZIvg6FKaBDfmm/PzTy9dPMbHhBNa
	Z4kwecvl+4N6rj3msYwjRQLRonF/GeEbKm1WQJVuCeJVhYzjPbWBMXLHNBmQZmfft9vRaAFNn3k
	svwLk5gCSuRw1Dqf/zs6dLI2PbKOIw/G
X-Received: by 2002:a5d:46c6:0:b0:48e:d3f:c41f with SMTP id ffacd0b85a97d-48e3eb91df7mr144097f8f.26.1792787383507;
        Fri, 23 Oct 2026 13:29:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7c3sm191708f8f.51.2026.10.23.13.29.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 13:29:42 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 2/2] ASoC: cs43130: Mute the PCM path from hw_free() to prepare()
Date: Fri, 23 Oct 2026 22:29:41 +0200
Message-ID: <20261023202941.87999-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023202941.87999-1-olivier@mgcrea.io>
References: <20261023202941.87999-1-olivier@mgcrea.io>
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

The PCM path is unmuted when DAPM powers it up and muted again only when
DAPM powers it down, pmdown_time after the stream closes. Meanwhile the
DAC plays whatever its serial port carries: on a HiBy R1 (CS43131 on an
Ingenic X1600 I2S controller), loud white noise while a stream is open
but stopped, as when paused, and until DAPM powers down after it closes.

Add a mute_stream() op, so that ASoC mutes the path at hw_free() and
unmutes it at prepare(). The op is not run at trigger time, since the
codec sits on I2C.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Changes in v2: rebased on broonie/sound for-next, the ops now sit next to
.auto_selectable_formats. No other change.

Tested on v7.3 on a HiBy R1 (CS43131), by ear: no hiss while paused or
after the stream stops. Build-tested with W=1 on for-next.

 sound/soc/codecs/cs43130.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 7fb23522f081..919280711f8d 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -1624,6 +1624,20 @@ static int cs43130_set_sysclk(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+/*
+ * Mutes the PCM path from hw_free() to the next prepare(). Otherwise it stays
+ * unmuted until DAPM powers it down, pmdown_time after the stream closes, and
+ * plays what the serial port carries meanwhile: white noise on the HiBy R1.
+ */
+static int cs43130_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
+
+	return regmap_update_bits(cs43130->regmap, CS43130_PCM_PATH_CTL_1,
+				  CS43130_MUTE_MASK, mute ? CS43130_MUTE_EN : 0);
+}
+
 static const u64 cs43130_selectable_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
@@ -1640,6 +1654,8 @@ static const struct snd_soc_dai_ops cs43130_pcm_ops = {
 	.hw_free	= cs43130_hw_free,
 	.set_sysclk	= cs43130_set_sysclk,
 	.set_fmt	= cs43130_pcm_set_fmt,
+	.mute_stream	= cs43130_mute_stream,
+	.no_capture_mute = 1,
 	.auto_selectable_formats	= &cs43130_selectable_formats,
 	.num_auto_selectable_formats	= 1,
 };
-- 
2.39.5

