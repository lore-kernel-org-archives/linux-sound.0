Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592783;
	b=OazEHwXagYgznBOvtgmWq0bdWtWfTXNHuM4IhPHiEiiDMVKm9N4q6zFNOJMePiSb2p2x
	 TH8/JwJzhILqm6pmkhIS1pBvB7PrJxnCjSQd2VbzeDaicKz2g/WqqBOOrtcWESQGVexVG
	 y7KF7uvbcqt2ojk92UGqUgRcOs0ex+IK4OvPdAZ4owWE3HoJgnegsP6Fspn2MjFa36vas
	 ppud98xCiepi7n3JatALgwhJ9ypxsKJu6DSB/UtyyQvPBAvxxsccRf6SxExA39O4TxAEh
	 zjEiNa2lQzksuwfbYvPaxPvvgSHPRBmk8dWoeeATq9ZJCkqk7ok0aNE/3kT/qkHrbng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MlgQ+qJI1EzewWr/GysHup99aMMlWh58UycCkLdP/Cc=;
	b=c4mXS+RPDvj3Zgg1LSP8fZBCv8xrApbfxN64BEL7BvU8cYvxgM81DWOFFIavH1T1TxtI
	 WG92x5G8Ni6N3Fa1VBu53xz0YlZ7HkddBSacGkXckBjLOxfmQnUuLSaFimh5NiDaNoGA1
	 3V85JIp8Ss13MJeJXZzm2h1I0CDcEU4iKE0bwfuumOQXzo95hmNEV6ggX6usB/w5JXyf6
	 sI81mg5C4nFSZRFLPGLEw+MTFOc76z3LzeLouHS6KJ+dWZvBxfAAzxNZqaETm4NfxVqg2
	 zqkdKo/7cnxY6fpvSJrSN4i6Nr0fVr4i8eJ6KCYb6gJQ1t1PtuENeqMsY5X5ABGPKUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dA7QwaU7;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49FF606A319
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 14:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A49FF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dA7QwaU7
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3282db206d3so1785414eec.0
        for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 07:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592782; x=1793197582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MlgQ+qJI1EzewWr/GysHup99aMMlWh58UycCkLdP/Cc=;
        b=dA7QwaU7Axxc1WZbv/9pLzJPv5M9nfUhACdNd4UTRJwTJNp+TROzvqHrpKb/m6JNkh
         OqIYOp5jvZNDnOXls5bJCgTFE/HdLdErhJMP3q56Co92mBYXP/xSbfiGUaTlg7XTfDnC
         azAIactdR8Dq9p2y3q9evoymYPY9cj+r9vHorjr5ZHqz4k6NlWRWWqRIx/FKCHTtI4Fw
         wYjQMlT54uv+ALMQgvnMaosTE0/FQ0oNYxNbd6i7qUslbUAGP/cO6NZ2chhRRk0ZPwr5
         CvYQxqlwBBlBpnKXN5Lh1ZvLKsTW9x/Z+AUeQt5aA62pvJo9y2/czDOu9F6vJ0hxyKcn
         2e+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592782; x=1793197582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlgQ+qJI1EzewWr/GysHup99aMMlWh58UycCkLdP/Cc=;
        b=eXUw17pGsabOO/syBzdVYsdz/i9K0ncjSTHxQFJ+DLqeqW3XebSsqekeFienXxAX62
         zgYmvG9GEWfMQP/rsY/CXCfhto7t+HUWteLon5ixbF08vffVAGbc8L2T1W0Jnq88aQtP
         /kHorw03jyWhDLTx2F9Y9znlikPZTUoCy3ADA0fAatq8mxYl5S7DFpwE4HEpzFcP1EFo
         EtfjMRcSNcLLwIDKeCv2QgWwzNdX8vZvpuS61Bg0w1oGBxPZ33NmiBQXm08gPq0Ycqoj
         5pSwuAQSnGXKZKKr9dpg147DAGCLfzGiOE8znBu5nip5YvBP/7KVEUvi0/V3rzUSb7t+
         gYDw==
X-Forwarded-Encrypted: i=1; AKwUvBxyK5l4fFNuB8/YZ5SMPm2kEYRFdfe/zREscOQY1rHUSS8ZujZl23jWhukNmHARfnT7zGXIA6TNO0kfNw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJdLEPdbeHqg/QD+WJPCNTUitMmuHiT8Eezzdq/iiASpKT4Y81v
	mt1zMbBiK/eB79NFN1HZcHgMQsbA1H1j6bEM6WO6R+gV2WiVUBEikXJs
X-Gm-Gg: AYBFou2JepL8+gn4tMs0gb7/08MHDbyosV92vdF3381FZzivjxB1IHyXXgHuztoUeMA
	cIbdUURwdLThmExxVLOMotcSS2f1sW+MzxZuVqG2Rks2kIam71c94f+j88gS0rY0JcXDe1GY3SZ
	HosCHg+0y/mWl+OgJbJHpdedj0ZyYb68TCUaL6qkJEBeOIGbepeuKVFYJIbtyphwsY3q7t356Zb
	GwKrYVikbeEz5AzLsASKH+nipBx0RLEBwW+gTV5CQfNAG2u00eACWstNFblky85JA8OzEO8K7H9
	3M5vuwyuDsKk9uHqc26nVPSia5sjexLs3x/t63Ps2UzH8cH4OqsLwe7sDS8OL09eoQH7O9elHrL
	a5BN9P9OYEuIGR17iEqlLN9Ruow1vu6eGgwE77UsBfj83uKGjZ+48PVlJEj/o0WwqWh7qJxIcx+
	y8xA+djOCHNkUv2gHzKXg/1NmqYSpdE5jOk8YSVCccTALkJOxZ3A438YtF93M0kolTGbkVFAMf5
	UT4+MNWghQ72BvtFKq1tzmyU3LtiF4z2Km05EphW2BPKL20TShTWJnvAcyF58usXKFGlAeUGjcK
	btzQhg==
X-Received: by 2002:a05:7301:19af:b0:35c:707b:acba with SMTP id 5a478bee46e88-3674a40df15mr5149141eec.3.1792592781362;
        Wed, 21 Oct 2026 07:26:21 -0700 (PDT)
Received: from CachingPlasma ([45.117.246.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411b4145sm9133554eec.15.2026.10.21.07.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:26:20 -0700 (PDT)
From: Ajanesh Lal <ajaneshlal3@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajanesh Lal <ajaneshlal3@gmail.com>
Subject: [PATCH v3] ALSA: hda/realtek: Add mute and mic-mute LEDs for HP ENVY 16 (103c:8be5)
Date: Thu, 22 Oct 2026 02:24:53 +1200
Message-ID: <20261021142453.177174-1-ajaneshlal3@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The HP ENVY Laptop 16-h1xxx (PCI SSID 103c:8be5) uses an ALC245 codec
with CS35L41 I2C speaker amplifiers. No LED fixup is applied for this
subsystem ID, so the speaker mute LED and the microphone mute LED are
never driven and do not follow their keys.

Add a fixup that calls the existing ALC245 mute LED COEF helper and the
GPIO mic-mute LED helper directly, then chains to the CS35L41 I2C
amplifier setup so the speakers keep working. Use it for 103c:8be5.

Tested on an HP ENVY Laptop 16-h1xxx running kernel 7.2.11: the
hda::mute and hda::micmute LEDs appear and follow their keys, and the
speaker amplifiers still bind (CS35L41 Bound in dmesg). The mic LED
GPIO pin and polarity are not verified on other hardware.

Fixes: aa8e3ef4fe53 ("ALSA: hda/realtek: Add quirks for various HP ENVY models")
Assisted-by: Claude:claude-haiku-5-5
Signed-off-by: Ajanesh Lal <ajaneshlal3@gmail.com>
---
Changes in v3:
- Use real name in Signed-off-by and From.
- Add Fixes tag for the commit that added the quirk.
- Rebase onto sound.git for-next.

 sound/hda/codecs/realtek/alc269.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f2ef2b265..23aa175fa 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1642,6 +1642,14 @@ static void alc245_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
 	}
 }
 
+/* mute LED via COEF bit and mic-mute LED via GPIO, called directly */
+static void alc245_fixup_cs35l41_mute_micmute(struct hda_codec *codec,
+					      const struct hda_fixup *fix, int action)
+{
+	alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
+	alc245_fixup_hp_gpio_led(codec, fix, action);
+}
+
 static void alc245_fixup_hp_mute_led_v1_coefbit(struct hda_codec *codec,
 					  const struct hda_fixup *fix,
 					  int action)
@@ -4526,6 +4534,7 @@ enum {
 	ALC245_FIXUP_BASS_HP_DAC,
 	ALC245_FIXUP_ACER_MICMUTE_LED,
 	ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED,
+	ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED,
 	ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO,
 	ALC256_FIXUP_HONOR_DRA_XX_SPEAKERS,
 	ALC256_FIXUP_HONOR_DRA_XX_HEADSET_MODE,
@@ -7333,6 +7342,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC287_FIXUP_CS35L41_I2C_2,
 	},
+	[ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_cs35l41_mute_micmute,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_CS35L41_I2C_2,
+	},
 	[ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -7922,7 +7937,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8be1, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be2, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be3, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8be5, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8be5, "HP Envy 16", ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8be6, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be7, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be8, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS),
-- 
2.56.0

