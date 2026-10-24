Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792832310;
	b=3vEIMteomQxgVtD0mQgMQF4/KVYyM0spFNETHKW90wkm1vcVGoKEUoRHxQwdbuum+dvD
	 Pmx0r2WAYzX2ve+7OFC33yK1W7DdKylSND8FzW3+5HibIqEs53YH6jKYPJfVDHMAOM+sO
	 CbJ0fmKTVTv6CcS4czveCkU1V4kLYsnGR31p+ChN50Q7+uga8Z1Rho8ZXFjsKKZl6kDV6
	 URpgpRtPtADu5M2eVRwxaSo5G3rsjVJrAn07OHrb/jo1Ufq6EuAyEXsrTXlpUWP5rEPjV
	 kWCbpCHCTF8183aX/9ON3Tou0r0S2/ESOWFUO59P0dl7FvH0cH8SQqTZD5UtKDtRJbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792832310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mmCvhNsu9Cono+UAiNQxrxOxevoJ8Pqx7Hat6gLFEsE=;
	b=2pSkZFyYHCuklXK6+bPSFDHgL+j+Dc4HUrHjK63Ixhu5F8bsVcLUY4vLP9yDhBIFVZey
	 Io44j/9+qDoqDpicsMKP1hZCKW476HkS0DK3ayQ71S0uiNzw7YL0zL2oJSY4+UR6h8kfK
	 cjQhEbhPZ4l6B3EFFYrtgymweBL+KVioWTmuG69nwH/p/AgX/8MA8IUdMHyA1DHwXot4z
	 x9bD95t2DVj2KI9NQBZcZyIW9hqcQNP/8F03QdiFZgcFuMDruglpqjGYEErQ51PeWvT7t
	 Z95F8D+A7v8il08RFHek8bW2ODnwq0A3+c0og01+Gk4mE3/ryVoQ4PxW+g2AtWJld2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="K/qm2Thu";
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E5606A31A
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 08:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D6E5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K/qm2Thu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-917d595138fso10537646d6.3
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 01:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792832308; x=1793437108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmCvhNsu9Cono+UAiNQxrxOxevoJ8Pqx7Hat6gLFEsE=;
        b=K/qm2Thuwad9+FDgoMMR9Mz/sVd6Q5WyL5MWYFHFhS79Femxs0dP5gsMtEGsIwO3Ms
         gz3P6sXrKc7WjF2yHidQq/IZsKbr8lis7+fmDF0wVed/luWooaPZUj2FKRukHPkkZJsm
         +jJSFjMaEhIsYGIqG4UsWK+KXK6x+4nCi+2gYUyFYq6ohana+XJEG02vuLdQr0mkcSLh
         hOejPxO5AdUde8mlL2gClEt1Tdy35MeB73KuS1Ltuz2XJWmFJmsS8QAjkCQwYDVZ6nyA
         vZ7MuxaVhkbVcFhy/KQMW+lGgCjWHWq8cOXNmo/22DtLyxeK9acrmRmCDhEPlf0r5d4v
         crWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792832308; x=1793437108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmCvhNsu9Cono+UAiNQxrxOxevoJ8Pqx7Hat6gLFEsE=;
        b=zje5ZRjRptHzYu4QxHSQokAK6yLi4O0N7ivNlKNPuYDK0BQHsjplug9c7Mfpznmc/+
         0bPUmmR3nLd57Dytd6lVXdY9NpM2J8JC9pTqF/OtFtcu0ZHTc2wkYOZSWwFg0GIQIl43
         YvbM5gF75HVbpMxXOd5LCRiWD6gUXzaa7AEq3g1Acpaq+jRWRTXZOU5oVBe6bxYIadn7
         pj8PnY5f8hcG3C8xIBPVTTim7DHsWnsZvia+OxAEuZ9cQzzbTkTol0VjaRjMaBmWr+3L
         RH7/MGTV/5+4Qj7j/+dhqzK6F8/QWmy06ik0hyxww+0SzKnvmsJtfp/rOKmaGuZ/UeYJ
         tLaw==
X-Forwarded-Encrypted: i=1; AKwUvByesGMLBc0AWHNdeNErxM0sfpy6167BHBd0drnhphKZrXLANDU4ZMW38FxN+0jHsfhGRKNYzgOTGY16eg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLLOmFP1CHzXhNQDjPdOOJlQsYpX17LCehbvh0+rfpLq6RD9BvN
	EGH1tD//7Y4ynkXLGiZpeL+NRoqLutYLGChGyEPqgPOeu3t33yy0QVUW
X-Gm-Gg: AYBFou0RYTTBDGA5yXtIrBJ1HRqVCEoseasD4FHO1Y078L0g/SrxVzTmaoEsPrR6OCo
	4kn/Tf/e4epNK7IL4GGFloTyZHnXRCl257QJqTbg71fbfjsiR01hYwm/7qp3yZzTQZ39BGpEemO
	kd+WTrA9JCbbKbBG5fqwRADxtUalHgwFuyvGiIzXCAaeXW+IegOqUg1V1E5gi48IPHTdk9B1GLj
	iqN//OLGRKCQ1OcrU1YHhhG2NedCVy5sog/J6VHkJprOIxBWowE8QPn0NhJYnbI7+skGk6plvUj
	b54fkdNBG0qAo1/sat1Kp2+BBufI2syz+hqpxHbnS7c9GsFWwN97dW/25qaRZtVHhSz2fsTK93S
	6LoOS3Fq/dYtNzxUiFpHGI7e/1Kr39BIVWmmE1GsqslSl/YWCb/IKFCOFSoXCETr2IxVlk5DXPb
	xOcZGa6p6AGpSMCZOjbCHHMwciQr/hDKmpBHAAuaqV1Ngx07f+RUpgy2c7/K+3JrabD90w2wUtL
	At4K19TShw6LCH0xR5iktsrTUaZNhvvU9Iw5l5j2rjlZCA5YL1YmV4XnAkXgymRvwZsJ+136xVW
	P9eQzdK6s1RN2UUpYRS2wCITY9IPaoIDZfJ/5w==
X-Received: by 2002:a05:620a:4542:b0:93f:2bc8:283d with SMTP id af79cd13be357-940ef95fe8bmr174105785a.47.1792832308214;
        Sat, 24 Oct 2026 01:58:28 -0700 (PDT)
Received: from [192.168.1.216] (static-acs-24-154-158-10.zoominternet.net. [24.154.158.10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c0ffd4sm16551106d6.16.2026.10.24.01.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 01:58:27 -0700 (PDT)
Message-ID: <1ca10bd0-0452-4411-8577-9753ea50f56c@gmail.com>
Date: Sat, 24 Oct 2026 04:58:26 -0400
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker dropouts on MSI GE66
 Raider 11UE
To: Takashi Iwai <tiwai@suse.de>
Cc: Andrew Udvare <audvare@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260909193104.26508-1-audvare@gmail.com>
 <2bcdce5d-aa6c-4789-ab50-68dad16127b1@gmail.com>
 <87fqxv8pif.wl-tiwai@suse.de>
Content-Language: en-US
From: Benjamin Pryor <programmer2514@gmail.com>
In-Reply-To: <87fqxv8pif.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Could you submit a proper patch for upstreaming?

My bad; I'm still new to this. Hopefully this one's formatted correctly.

- Ben

---
  sound/hda/codecs/realtek/alc269.c | 50 +++++++++++++++++++++++++++++++
  1 file changed, 50 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 1623cf926c71..d18bbe9dce04 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1840,6 +1840,48 @@ struct alc298_samsung_amp_desc {
  	unsigned short init_seq[2][2];
  };
  
+/*
+ * The MSI GE66 Raider 11UE drives its speakers through a Realtek ALC1316 smart
+ * amplifier, reached over the ALC298 coefficient tunnel. Left unconfigured the
+ * amplifier's silence detection mutes the speaker path after about 0.2 s of
+ * quiet and takes about 0.4 s to reopen, so the start of every sound that
+ * follows a pause is lost. Headphones do not pass through the amplifier and are
+ * unaffected.
+ *
+ * Tunnel layout for ALC286/ALC298: coefficient 0x22 selects the amplifier, 0x23
+ * carries the 16-bit register, 0x24 and 0x25 the value's high and low halves,
+ * and 0x26 commits. Bit 4 of the commit word is a self-clearing go bit.
+ */
+static void alc298_fixup_alc1316_amp(struct hda_codec *codec,
+				     const struct hda_fixup *fix, int action)
+{
+	static const unsigned short init_seq[][2] = {
+		{ 0x0000, 0x01 }, { 0xc001, 0x14 }, { 0xc003, 0x00 }, { 0xc004, 0x11 },
+		{ 0xc005, 0x00 }, { 0xc006, 0x00 }, { 0xc007, 0x11 }, { 0xc008, 0x11 },
+		{ 0xc009, 0x00 }, { 0xc730, 0x06 }, { 0xc612, 0x16 }, { 0xc00f, 0xf7 },
+		{ 0xc00a, 0xd8 }, { 0xc00b, 0xb7 }, { 0xc60b, 0xff }, { 0xc60c, 0x37 },
+		{ 0xc605, 0xf0 }, { 0xc020, 0x00 }, { 0xc022, 0xd6 }, { 0xc023, 0x00 },
+		{ 0xc025, 0xd6 }, { 0xc602, 0x07 }, { 0xc603, 0x07 }, { 0xd101, 0x00 },
+		{ 0xc093, 0x80 }, { 0xc090, 0x87 }, { 0xc091, 0x11 }, { 0xc614, 0x20 },
+		{ 0xc615, 0x0a }, { 0xc616, 0x02 }, { 0xc617, 0x00 }, { 0xc050, 0x80 },
+		{ 0xc051, 0x7f }, { 0xc052, 0x00 }, { 0xc053, 0x70 }, { 0xc054, 0x00 },
+		{ 0xc0a2, 0x01 }, { 0xc09d, 0x80 }, { 0xc09c, 0x71 }
+	};
+	int i;
+
+	if (action != HDA_FIXUP_ACT_INIT)
+		return;
+
+	alc_write_coef_idx(codec, 0x22, 0x0010);
+
+	for (i = 0; i < ARRAY_SIZE(init_seq); i++) {
+		alc_write_coef_idx(codec, 0x23, init_seq[i][0]);
+		alc_write_coef_idx(codec, 0x24, 0x0000);
+		alc_write_coef_idx(codec, 0x25, init_seq[i][1]);
+		alc_write_coef_idx(codec, 0x26, 0xb031);
+	}
+}
+
  static void alc298_fixup_samsung_amp(struct hda_codec *codec,
  				     const struct hda_fixup *fix, int action)
  {
@@ -4241,6 +4283,7 @@ enum {
  	ALC236_FIXUP_HP_15_FD0XXX,
  	ALC236_FIXUP_LENOVO_INV_DMIC,
  	ALC298_FIXUP_SAMSUNG_AMP,
+	ALC298_FIXUP_MSI_GE66_ALC1316_AMP,
  	ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS,
  	ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS,
  	ALC298_FIXUP_LG_GRAM_STYLE_14,
@@ -6055,6 +6098,10 @@ static const struct hda_fixup alc269_fixups[] = {
  		.type = HDA_FIXUP_FUNC,
  		.v.func = alc295_fixup_hp_pavilion_mute_led_1b,
  	},
+	[ALC298_FIXUP_MSI_GE66_ALC1316_AMP] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc298_fixup_alc1316_amp,
+	},
  	[ALC298_FIXUP_SAMSUNG_AMP] = {
  		.type = HDA_FIXUP_FUNC,
  		.v.func = alc298_fixup_samsung_amp,
@@ -8031,6 +8078,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
  	SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
  	SND_PCI_QUIRK(0x1458, 0x900e, "Gigabyte G5 KF5 (2023)", ALC2XX_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1462, 0x12fb, "MSI GE66 Raider 11UE", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
+	SND_PCI_QUIRK(0x1462, 0x1305, "MSI GE76 Raider 11UG", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
  	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x152d, 0x1082, "Quanta NL3", ALC269_FIXUP_LIFEBOOK),
@@ -8616,6 +8665,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
  	{.id = ALC298_FIXUP_HUAWEI_MBX_STEREO, .name = "huawei-mbx-stereo"},
  	{.id = ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE, .name = "alc256-medion-headset"},
  	{.id = ALC298_FIXUP_SAMSUNG_AMP, .name = "alc298-samsung-amp"},
+	{.id = ALC298_FIXUP_MSI_GE66_ALC1316_AMP, .name = "alc298-alc1316-amp"},
  	{.id = ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS, .name = "alc298-samsung-amp-v2-2-amps"},
  	{.id = ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS, .name = "alc298-samsung-amp-v2-4-amps"},
  	{.id = ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc256-samsung-headphone"},
-- 
2.43.0

