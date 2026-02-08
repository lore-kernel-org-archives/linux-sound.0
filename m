Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712702DFA2D
	for <linux-sound@vger.kernel.org>; Sun,  8 Feb 2026 17:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770572813; cv=none; b=KKWWUyZdh32lzLM8NAfM+e4f3RuS5AOuFRebqiLJRb8UJAXiH+0K2FJTrs0YL4fsYb44uC5RQRLp5H1Iik2Bz/2LMB61jBS7oYOsrtD9JnPtjGXF8hCiUQOCTX+Mr5gAExur3NbSY1jao6kXVHi6L9cJ9ynZJh/lMoprc6Al73g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770572813; c=relaxed/simple;
	bh=2pcA+r2fHf8d107BA21EY+cPX+UBCltN7HBNk4EjK9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oyXnPXErwKAKf4rr9aEGxlmPilFnUVjO9h/OSy6LBm1cqcNRWDjkpZFz+9cpXMzkdqE0aKocZmhN2m6BYTj8TqTwnyinxLU8qO6SWsko+9V2jcpCNqKhl3zyGvXXkh/IAB7t2jtaT+gVsih1vthSAXoxQykVwlL9W1XASwMov8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0R4Zffd; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0R4Zffd"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6582e8831aeso6120144a12.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Feb 2026 09:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770572812; x=1771177612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1STPksu+iQHTeYb1NED752bbPs9vh7Nsw9UP33wg1So=;
        b=G0R4ZffdYSlPQKJIux/QJzHLej8CsNDdMS7n2F62u6gDYuZc6E9jOpGBOF5r87ehe7
         wrVlbrK1uDMug2PctMs6t0j+54KaEWm77xvb4JyfqTYv1W2dEItyY2dvkp3+bAFN6yhq
         oHIznokc9wygIcg8Dhc10rmqCEem1up72j5+7kDDC/4p2+zWUQ3PoE+mkWVVVgVU9cND
         x4P9wqqdV1KsNVOsmCa7ZIqGFWbddS4y+a0vnDOuSjVaKvKGd7dRIY1U0S/KG430wrdc
         ItEyb6TS4Fyror+FVH25ioJpfzphTw4qNCZWdizX9GzDh2+e5mjWl1yOzvWAnauP3uV4
         npPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770572812; x=1771177612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1STPksu+iQHTeYb1NED752bbPs9vh7Nsw9UP33wg1So=;
        b=rjvgGn5QzyEnkfiK68s6+nAl8J4+TZ09Oco/go3YJDk55+c8AxvLeiY6F+n7evM/be
         QeZFz8aAM8mTVkkTgsO9YX9IZ+rXzjtau7quO5Of+iB/cXAoPd0IsQ/zmUfr61VKZe4y
         MONdOKME2a6xZy6wNEnTvP9OClfQsNkBEQbuSLU5iIixrsWqpomC1Njfx0Edyo3+k12W
         epR01aU4WCptE8t9E2Cs135RJpq/6HPSlxamo8pPav2IOhuA2JURJOFC3MTfQ0aXI2xA
         GPuKT+G7yGth1z10oJ+pYPhfKXO17SSkP4+WCHXZFtBzRLX0BergKWc6Ob+pSqe7eIwC
         ckxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4+NiNCmurkGtBgIfXELp8uAAY1XFgmfvOOYsFDp0dZCH5FWuLgoI8KGVtLf3o6Jwb0dNu63fi95fJSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhOxcS1gO40C6lewsR6JodOG+TBCMHMI6AhDAKz7NkYwMsb49p
	5JD5mTyuWBeif2eXHo4RV1ixqbVTRHf07B6Dssk4IhzQhBvtcRtcgwoz
X-Gm-Gg: AZuq6aK6Hy78VmvncrQP1FgSd2AZsz5FAwE5Uh+0KGFTRIhY3RgWFiKyjYKpu1rQCj1
	E8437E1w8FgZgO0Fk64GqkNh/hMjlxrbjo9h9Hibvy5dW7aTAMnCVywbOqVhNV+nz4yTYHoMdhP
	5GjOx6mWfl6H0BroLQmI62YEByN51sZUZdmOk8kmbxMkhRNj47RUvTVdOcogChAmttEQ4hK5opB
	XS5uygQnPfLPKIn3psBCMw/ofjRhdnd0mMmXU2sVk6yOujjpSK99EvOtakoMJmIjKxN5Ltntoj/
	JOSIVoaGoRWOXKfM3dVWBKgKzkUVSxj8PWt2AcmaipZ8moyLKDMQAzsuBAF7mC9ttDgvpST+zmO
	FmDFVbq25Sa8G6acdFfPz9O2NylsXLyANrDW6jszfFvVTL0ISbyqhpJcXQe+gIaYgZBsG+6HW7s
	Bfoc9yZyWJQcscD2fu3KL/DXeC38ojJB4JuXLy
X-Received: by 2002:a05:6402:40d6:b0:658:cc59:1608 with SMTP id 4fb4d7f45d1cf-6598415c102mr4153303a12.14.1770572811350;
        Sun, 08 Feb 2026 09:46:51 -0800 (PST)
Received: from Andrzej.rolna3517.home (d176-77.icpnet.pl. [109.173.176.77])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65983eaa44dsm2164857a12.7.2026.02.08.09.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 09:46:50 -0800 (PST)
From: Daniel Kamil Kozar <dkk089@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	Daniel Kamil Kozar <dkk089@gmail.com>
Subject: Re: [PATCH RFC] Fix speaker/mic mute LEDs on HP OmniBook 7 AI 14-fr0220nw
Date: Sun,  8 Feb 2026 18:46:27 +0100
Message-ID: <20260208174647.377444-1-dkk089@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87wm0n7i0b.wl-tiwai@suse.de>
References: <87wm0n7i0b.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks Takashi. Unfortunately, the codec does have the exact same SSID as
the one already defined. Here's what I was able to come up with, it's
basically a new SND_PCI_ macro that allows passing in the codec's vendor_id
when matching. This also means that the FIXME: block in alc269_probe is
no longer needed as it seems to be fixing the same problem I'm having
(i.e. machines with duplicate PCI SSIDs).

Let me know what you think.

---
 sound/hda/codecs/realtek/alc269.c | 12 ++----------
 sound/hda/common/auto_parser.c    | 14 +++++++++++---
 sound/hda/common/hda_local.h      | 15 ++++++++++++++-
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b66965a52107..b53d8ff42988 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6821,6 +6821,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e36, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e37, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e3a, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_HDA_VENDOR_ID_QUIRK(0x103c, 0x8e3b, 0x10ec0245, "HP OmniBook 7 AI 14-fr0220nw", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
@@ -6857,6 +6858,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1032, "ASUS VivoBook X513EA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1034, "ASUS GU605C", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
+	SND_PCI_HDA_VENDOR_ID_QUIRK(0x1043, 0x103f, 0x10ec0294, "ASUS ROG Strix G17", HDA_FIXUP_ID_NOT_SET),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x1054, "ASUS G614FH/FM/FP", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
@@ -8253,16 +8255,6 @@ static int alc269_probe(struct hda_codec *codec, const struct hda_device_id *id)
 
 	snd_hda_pick_fixup(codec, alc269_fixup_models,
 		       alc269_fixup_tbl, alc269_fixups);
-	/* FIXME: both TX300 and ROG Strix G17 have the same SSID, and
-	 * the quirk breaks the latter (bko#214101).
-	 * Clear the wrong entry.
-	 */
-	if (codec->fixup_id == ALC282_FIXUP_ASUS_TX300 &&
-	    codec->core.vendor_id == 0x10ec0294) {
-		codec_dbg(codec, "Clear wrong fixup for ASUS ROG Strix G17\n");
-		codec->fixup_id = HDA_FIXUP_ID_NOT_SET;
-	}
-
 	snd_hda_pick_pin_fixup(codec, alc269_pin_fixup_tbl, alc269_fixups, true);
 	snd_hda_pick_pin_fixup(codec, alc269_fallback_pin_fixup_tbl, alc269_fixups, false);
 	snd_hda_pick_fixup(codec, NULL,	alc269_fixup_vendor_tbl,
diff --git a/sound/hda/common/auto_parser.c b/sound/hda/common/auto_parser.c
index 8923813ce424..8369eec455bb 100644
--- a/sound/hda/common/auto_parser.c
+++ b/sound/hda/common/auto_parser.c
@@ -1000,7 +1000,8 @@ hda_quirk_lookup_id(u16 vendor, u16 device, const struct hda_quirk *list)
  * The function tries to find the matching model name at first, if given.
  * If the model string contains the SSID alias, try to look up with the given
  * alias ID.
- * If nothing matched, try to look up the PCI SSID.
+ * If nothing matched, try to look up the PCI SSID, optionally matching
+ * against the codec's vendor_id too.
  * If still nothing matched, try to look up the codec SSID.
  */
 void snd_hda_pick_fixup(struct hda_codec *codec,
@@ -1065,8 +1066,15 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
 
 	/* match primarily with the PCI SSID */
 	for (q = quirk; q->subvendor || q->subdevice; q++) {
-		/* if the entry is specific to codec SSID, check with it */
-		if (!codec->bus->pci || q->match_codec_ssid) {
+		/* if the entry is specific to vendor_id, check it first */
+		if (q->codec_vendor_id && q->codec_vendor_id == codec->core.vendor_id) {
+			if (codec->bus->pci && hda_quirk_match(pci_vendor, pci_device, q)) {
+				type = "PCI SSID + codec vendor_id";
+				goto found_device;
+			}
+		}
+		/* otherwise try codec and PCI SSIDs */
+		else if (!codec->bus->pci || q->match_codec_ssid) {
 			if (hda_quirk_match(codec_vendor, codec_device, q)) {
 				type = "codec SSID";
 				goto found_device;
diff --git a/sound/hda/common/hda_local.h b/sound/hda/common/hda_local.h
index a7e53277a0fe..9ff7e9a89799 100644
--- a/sound/hda/common/hda_local.h
+++ b/sound/hda/common/hda_local.h
@@ -297,12 +297,15 @@ struct hda_fixup {
 /*
  * extended form of snd_pci_quirk:
  * for PCI SSID matching, use SND_PCI_QUIRK() like before;
- * for codec SSID matching, use the new HDA_CODEC_QUIRK() instead
+ * for codec SSID matching, use the new HDA_CODEC_QUIRK() instead;
+ * use SND_PCI_HDA_VENDOR_ID_QUIRK() for cases with duplicated PCI SSIDs which
+ * can be distinguished based on the codec's vendor_id.
  */
 struct hda_quirk {
 	unsigned short subvendor;	/* PCI subvendor ID */
 	unsigned short subdevice;	/* PCI subdevice ID */
 	unsigned short subdevice_mask;	/* bitmask to match */
+	unsigned int codec_vendor_id;	/* codec's vendor_id if nonzero */
 	bool match_codec_ssid;		/* match only with codec SSID */
 	int value;			/* value */
 #ifdef CONFIG_SND_DEBUG_VERBOSE
@@ -320,6 +323,16 @@ struct hda_quirk {
 			.match_codec_ssid = true }
 #endif
 
+#ifdef CONFIG_SND_DEBUG_VERBOSE
+#define SND_PCI_HDA_VENDOR_ID_QUIRK(vend, dev, codec_vend_id, xname, val) \
+	{ _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
+			.codec_vendor_id = (codec_vend_id) }
+#else
+#define SND_PCI_HDA_VENDOR_ID_QUIRK(vend, dev, codec_vend_id, xname, val) \
+	{ _SND_PCI_QUIRK_ID(vend, dev), .value = (val), \
+			.codec_vendor_id = (codec_vend_id) }
+#endif
+
 struct snd_hda_pin_quirk {
 	unsigned int codec;             /* Codec vendor/device ID */
 	unsigned short subvendor;	/* PCI subvendor ID */
-- 
2.53.0

