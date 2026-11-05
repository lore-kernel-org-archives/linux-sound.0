Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882139;
	b=dUMYyQ4OL+yZ8imm7274GA1FTljPZDgMNefsnuYzzM+g85QrQvjODXQeaymzzTCLa8EG
	 0/xozgRwm33AOM+s5RzMxbfnCH+KtfkFQB38pmeSxj8g+KeUXpTnTZem1s4n0Rjg8Y9N+
	 y3r+qRswBPWskb4KVlYNKcTHhl06KKQR65/ojioEZ2zq/axWHScSy6ViWpKHcnzD27vx+
	 A88k/dcSgRSusu7B2oZ39oCbo0JZOlICARVF6Q+XzfleJBsUrHrUUpbr/9o9OeRSTJoY5
	 e6/gXP8ug8U+COYI6TShY2d+TgvmSzXURM8/4Fi7zXGB2y9c8ZluU9ULkeTMe4bsDZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=syMOQJNZT949tPtaFso8iwjMJ2GFKalrcIxBNtIXXhk=;
	b=cdPPZlobToKaVsYrH1eacwbvA+kVs59lfVm7ws15fOvcLZJj7+6M4YL5aLNicII5sEjC
	 AYFb8UQrN1dJQrsEDvJfyJAqSBk0BTmQrmcu3FSH9ZDJtlc+2O2qlQErMmrHUpZ3uJ2oR
	 YjUwNj5ZEffXbPyrsfGPkEWq85WXjTOACo7CJQ6RCahSfySP1kWj0paQOl6niBNAbRpCV
	 +CSe168d5bqliWJTDnum72qx5TgwWdjgxBVVmcXUVUvIqAAk30Ys7D6U82kymAQuE9KQ+
	 oQGaNDvnLFnwf2tXs70eV2Z27omeUiyfOeODdYJLqZ/K9CIkf45fJ9A1E9OJ3ToNgbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QX4gYcuV;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86997606A326
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 12:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86997606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QX4gYcuV
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4910746eec.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 04:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793882138; x=1794486938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=syMOQJNZT949tPtaFso8iwjMJ2GFKalrcIxBNtIXXhk=;
        b=QX4gYcuVHgwKJCQ9cSDV4cN3M57epP733qL1J/0vOQ5KzMRAKinQQ7bmC/DJmPjdbc
         HNvqdzdagU9G/zWUbofNenZERu6ryiSdNI5Jru6DgJQ9AL+Jrmv8iXbIM3DjZHjGzO0t
         EfutDO+67FHU5UtvJSwPa/HMRlsSu7b2V9Y4JPQW9ESILRyw1+u71Ea5yN10RQJcQ87R
         JDOK9vkCsWS/uFx9qJtH6+S7psryitbPzkrBakk0rB2r6ay0IGFLtQwtgaJR5MYzNpuz
         2oRGW3bSJcZTrZM9OmKxc2ZeENLJHWilUQEjoM5JDFuJcMqSZL1+Ta4scMqEBSIgW7kx
         fJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882139; x=1794486939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=syMOQJNZT949tPtaFso8iwjMJ2GFKalrcIxBNtIXXhk=;
        b=w8RezMDpDmceTVtqzXVig0IhE/SZfmvqoBCKzvZAxYaRaDBDRua3K61WQKCnDB/Vf0
         uqX400u5lCMEGjO5g6ssjdhpnSsrV1leV7uvdiLVXc0Ziem6PMR2lTwxEekUOz2ivDQJ
         B+12mPq0xqzhVK+fRjP73AoEbYE1OopnbkWURkcNdvWjf76/VojqjHm0BySwLM5G+XMa
         5Yu8+h9mm8pvRY7QJHJ8jidyFni/fBVS0DSs7YITU0A7HmDvg8hKBgp0kIF7Oqtu5muF
         8D9QRf5pioeFOoJIHU1j/HyYRTU5g1WDevP8Z2cTgNNXVGDuU3eRNdS/R3S/xrijv6R4
         cW+g==
X-Forwarded-Encrypted: i=1; AKwUvByeHTfoOIfDS1zjpT5MkPVKuOMKMsgXdZSMCBwZA42oZnM4FyB/mWK4Yc/SL9FNZzXnYAKz2vZHbJ98Iw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9XxHAo3rwjH766JDSGXpSNXuZCswE+zyR8J7HLoxdA0Tp9sfSx
	kHcoNCR1syfEZxxyywzGvMl1puz0jGuH8E0eEiom75pu/RO0Bq0n1/8=
X-Gm-Gg: AYBFou34jb5tRIObJ2xGHocnfnsdvInzdEwSli/76DMZgYqmpYcp+SUIttgwb8hvxkS
	Ilx7ltu+86hLNAuV6BG7b9RgHJJRxOZWVIqt6t3P8cJwWtAQEgUDq0Pb+Lj6nbTCKWW24hhx2oW
	mvh7Ak31OjCxuOBYR6WjhH7Nm6Ce2uQALooij5XwOXpeHy8I4cArnZnOJTHewyyiyFOK/hxIs3I
	L/wP5kDYRG82xBBkWhzg9GP/SS/pAUYJO1fdaglcfKRmYU8sroXUqOakYT1Bv/eS7BxrVCMAKzt
	AWezBegbgq7l1ERI7ylNOAKjXEdtIvKPVxT/V1jXQf3NJbwpDFOhaiTzEJbmuAsSJAjvAkOQm91
	9MDsBdFcYfCE2IMSa5XWgIixK7HZSvJ4t3qJZUi9Kw4XYa96fCEDCLAgqxhYUbbQYwk0cfgcIJD
	j3wu/C31JJYuyfSgYXW4iuLVZn64nq2eKnu/IvFhXQHAiE/QEbE9JhzLzniE/Nb1jNnOfZ4ECV9
	s0uGUT5sC8eqBjSZi90Kv27jLnbvjr/LW3Ztt1n2IF0mwzlKZ+N7Fr8BfMCjkCGwLUTWg/ywlaP
	MXjBCi1Zp4FRpdxMWRCrWnCJKRWl0Q3a4RNiwdXV84Y84H3LfE7Imbq+pg==
X-Received: by 2002:a05:7301:6199:10b0:36e:3a0a:2953 with SMTP id 5a478bee46e88-36e3a0a2afdmr2828151eec.41.1793882138307;
        Thu, 05 Nov 2026 04:35:38 -0800 (PST)
Received: from localhost.localdomain ([202.51.247.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm22384893eec.27.2026.11.05.04.35.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 04:35:36 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: brgl@kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-sound@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: cpcap: use the platform OF node setter
Date: Thu,  5 Nov 2026 20:32:28 +0800
Message-ID: <rc-review-20261105-v2-28-d7877b3f9c24@gmail.com>
X-Mailer: git-send-email 2.50.1
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

cpcap_codec_probe() gets the audio-codec child node and assigns it
only to dev.of_node. Platform device release now puts dev.fwnode,
so the acquired node reference is never returned.

Use platform_device_set_of_node() to synchronize both fields and
give the device its own reference. Use __free(device_node) to release
the local lookup reference when probe returns. The device keeps the
node until it is replaced or the platform device is released; a probe
retry also drops the old device-owned reference.

Fixes: 7b5b51b2b05c ("driver core: platform: count references to all kinds of firmware nodes")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Changes in v2:
- Use __free(device_node) for the local lookup reference instead of
  an explicit of_node_put(), as suggested by Bartosz Golaszewski.
- Remove the Assisted-by trailer and keep a plain-text AI disclosure.

v1: https://lore.kernel.org/r/rc-review-20261103-28-afc55c614a25@gmail.com

Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and v2 target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance was used for analysis and patch preparation.

 sound/soc/codecs/cpcap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index eaaf141dea57e3d14078c47350c1c4daaa0662b6..0e7c05f5bab607f8c4fb17d493e578b831a32f84 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1754,14 +1754,14 @@ static const struct snd_soc_component_driver soc_codec_dev_cpcap = {
 
 static int cpcap_codec_probe(struct platform_device *pdev)
 {
-	struct device_node *codec_node =
+	struct device_node *codec_node __free(device_node) =
 		of_get_child_by_name(pdev->dev.parent->of_node, "audio-codec");
 	struct cpcap_audio *cpcap;
 
 	if (!codec_node)
 		return -ENODEV;
 
-	pdev->dev.of_node = codec_node;
+	platform_device_set_of_node(pdev, codec_node);
 
 	cpcap = devm_kzalloc(&pdev->dev, sizeof(*cpcap), GFP_KERNEL);
 	if (!cpcap)

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
