Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947455;
	b=lVzvepx9fwOgGb0hJ9G0j05EdE4aJa05esi5z8noahcXuLvuczkwz7/v98zBn+e53zEl
	 Yg7pZ5kEFk9UnelC/3+ysqVLhBQfVeATV+FME8/PuVfZoBBhcMoKPyAxisuZrNg9FZ8uF
	 nV8S8GL1nvfyBihWh7/CKIuncYkEnLIFERUJt9Q/LFI8X9alDTvrGozuWpXtteOjamImS
	 kXiPvo5X/mDNsrTIwKGedP3kdPfR+6ONXL/jncZ9LBz4qW2ts9AHXfkceggQwyK3ZUvwt
	 0tmbfMND7j0MGfxT4RESIXbHSUjm8aC+Uc0u2opLOa2W8yTrMJtlezLlHgzV6tnHUMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hVxNmv4NODysBtkUxnOWYZEs/ETH9HFkkGqgOhhLEl4=;
	b=GOJuDg3f9nI8IzNasTKhVm89WokNzMkVFiAHy8KmXmnucynBPnnr+IWYio7OuWVtRm/D
	 i82Pa0qg+g9govcQM+yqEecwxQIrQ1AQVLg3Q6j3QYXL0LherNy94w3rWFr05c4xL0iiN
	 evcGJGm1zA95A5YR8G0cvhbPoe5GP1W/LdM8T2kM0Z4c+wG9C9jEIz7yuUx1w5MMjGjQm
	 YFuwc6L69DQ7A7tXgbaDKUwEcgevqyWtri1p+mfiOIM+kV69tGErY9OfrYeaGF/DgN1wl
	 qo+QQd2o5ZL3km6sZza7gcNJ+zlopA8wKg2Oy6igdE4oVFjV3ghvxg3UlNbIGj2e5qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="d2Ei/vhj";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4E4606A328
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 06:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B4E4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2Ei/vhj
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so608931eec.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 22:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793947454; x=1794552254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVxNmv4NODysBtkUxnOWYZEs/ETH9HFkkGqgOhhLEl4=;
        b=d2Ei/vhjjILcWqCIc+EPg7V1QI1Aa072t+IMKv9H1uv+f6vQmzqFPsvQGpxVC1/mYZ
         F0bseLkJs4Bkm0vkXDljfdr5M0dhPwOrZbhvL/ABrQnGZCi3CrNsGxkOZoAfBFQe7tLR
         yOYOXgMW/DmdPRUbxj4AC2tpxPGyQro4rR7pJOUjRqvQDsHqCJoUuEHCzACZZJExRPUk
         WgE2Oi7jrw4xnugjrom2jk1HDWIFefzNol88dNnmjyMNvGKfWmTsEkm2LjBb19byN5AW
         OYNyYKCn+DUN6f4IF7/NNxbtSjQjSAc+xeOXit5cDrkPPSsq8xtBH5RYfXtreDPzdXGt
         MoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947454; x=1794552254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVxNmv4NODysBtkUxnOWYZEs/ETH9HFkkGqgOhhLEl4=;
        b=IypT59+dbSOSYPJttrY0yuXw5bnl2vXacM0p8LC/HUAuKBV90wC8NS8MByxH6zQi6y
         GwrverN6uJUfd4IVATJRPvMMpJmU0toJar5I/XPI40jXsJaS295osmZEwcDe1ibKyJuQ
         Pt5CYN61frIYYZQfmlcWlR1fZuOwVRdDFB3onbp8f3mAbk5eojtRrJyWb28RMUR+97sP
         tNzPafqEmGQrCFg5KbLc4drAT7C6Nj1ldBWWuR8Mu9idbd6zUOBOWok+cqp7MRmSmNgS
         /J09XyKXnlIk5W4qSSME0YtEQExXaYxQVk+2E+9uPbgPxSX+bW3sC91H1HrviiMth6G3
         mnbw==
X-Forwarded-Encrypted: i=1; AL+hErFPvtQ0MWDyQaBKTVbrUUQ/vDjdKMqL47vw/xWzAcs0wBK6uMUj016ubR5x8QKgsWZu+J+6UvR3jS9vug==@vger.kernel.org
X-Gm-Message-State: APuU4Z97AMrvHff2WyVtbBdmiKAoWces+XVOMwC3Fq9zW9/sw9cBG770
	ViajSwRp0scvL/nxvJDNGzQfKwDZAm4ZyfejY8ibbPYgqK7mmaE2GlVA
X-Gm-Gg: AYBFou1OoKPBjKrB2khfMF1BBGG9yZwdpJeyi/QGeJYhNJWILPvu6+7mpg/D5N0YD4k
	EUNyuB5ZIWTYRWN5YiLitYI5gkzacWDxoD2aq5XbaPbTjOyUxmd20ByAdJ7rPn5MQ8yoO5jf5WB
	+LQ42ynU8HNzI0/85mfLsM7jDbeWahUadpFugeRFzqwllihW9OBUEj4J1hptPzpHbtJaJ5xbWP8
	l+3tytcGUJGchLZB+LT1K8cLVdHNUqZbPdKdnZ3cuKoPEZkPG8ow7zH2/+A8AKZ8npLl/iaQ26f
	mGlc6cpRCb0zISXmiuVDpPifBTWlrL82uCrRJVpcrRbtJNgYW8l0WKV9GENF8Buwa4SH5JZ780n
	QixzWE7OAU6WS8I0OCXvqpJ/tQopVwe4i4Bjry3KUeDJWsGExdXglxIRq8NfhyhropRoyG1nBIq
	xe6jc4IJY3jOPsFwmvxkYFXBMY60poO2Lk+BbM4DIWYK+5g8fw8TWxLB8l/Y3XukoAzGOD7o/Xm
	VymXs27ElFm+yIZpfcEzeiK+1kdNzBANXfTK3CB/xUuGvgWNqxU27uRviWhoaFN6KVHVng+pggz
	ny8FI9ejrOVIKMB/Jal0RC+RXvBvvTsQqK65U/+SnezOIKLHOnWl8GtRTpzE7TmJls2+bXw/Mpb
	UtePNN6rj0rlV9mOM2Ws3MLD14gP2pYs2DEW42dSE
X-Received: by 2002:a05:693c:87c7:10b0:36f:26a7:968e with SMTP id 5a478bee46e88-36f770062cfmr2114771eec.40.1793947454399;
        Thu, 05 Nov 2026 22:44:14 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm4157057eec.10.2026.11.05.22.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:44:13 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ASoC: Intel: sof_sdw: Add quirk for Dell Latitude 9420
Date: Fri,  6 Nov 2026 15:44:08 +0900
Message-ID: <20261106064408.2224910-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The Dell Latitude 9420 (SKU 0A5B) is missing from the quirk table, so
it gets the default RT711_JD1 jack detection source. With JD1 the
rt711-sdca reports a headset with nothing plugged in, and the
Headphone Jack and Headset Mic Jack controls stay on.

Add the SKU with the same quirks as the other Dell Tiger Lake SKUs,
SOF_SDW_TGL_HDMI and RT711_JD2.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Tested on a Latitude 9420 (BIOS 1.39.1) with this entry on top of
sound/for-next:
- with the jack empty, both jack controls read off (on without the
  entry)
- a 4-pole headset is reported on insertion and cleared on removal
- mixer-test and pcm-test give the same results as without the entry

Booting a kernel without the entry with snd_soc_sof_sdw.quirk=0x22
gives the same jack state. With quirk=0x23 (RT711_JD2_100K) a headset
plug-in is not detected at all, so RT711_JD2 is the setting that works
on this machine.

Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64.

 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 72fe013fffe8..41cc0969a428 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -139,6 +139,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					RT711_JD2),
 	},
+	{
+		/* Dell Latitude 9420 */
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A5B")
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2),
+	},
 	{
 		/* Dell XPS 9710 */
 		.callback = sof_sdw_quirk_cb,
-- 
2.43.0

