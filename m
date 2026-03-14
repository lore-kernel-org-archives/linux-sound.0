Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A6717B43F
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 03:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773459308; cv=none; b=tx7+6VTs1VMwLo0BDrMHRUif4+mSk7tTy6zLdrtOYFSZhJuayJA15Qn5Uhb2yR759qzn2Cprh/R/5UAnh5kQJ3L2s0BWcPeWrtOh4Hftz00A1SDQphD+aTOrarhidL3hOsRVatXHaO2FSHdNw/iaKaPclzK5fjD5+mE9kgDmTNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773459308; c=relaxed/simple;
	bh=bCPDrfSIHgTotXmiaMzTBzeP1LSsPbI6BJ3CRFCDXwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WnI+OgOKA1BjAsvbLD1QTrb9qyw1qbM/M3xKfcFVWITtBFn1HpunUMWYhTz5skbA3NSVHgS/86QgfR7TS3YMjVxraMVGnXvMQxGprvrFSNqLz4/1z37NBgzGRE12YhVsEBNC8yEUmrkhUim5Ro6AQU4SAWueuhtc0/JHd02N4VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYUlaAV0; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYUlaAV0"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2beb0246931so1696359eec.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 20:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773459305; x=1774064105; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JqNMCmmqJDcsaA0VdbH9eNtu9b3dBl63iWS6KS2e2D0=;
        b=RYUlaAV0bMpoTf486ZptLYTUHpWlSDRqTGG7OYYARYGBOt18DM/swXDxssmRPA/oww
         6NdAI99kMM3iRFbh3jMRG23HqMA7MhT6LaDpDnTD5iC8+w8vlZTTphgd2f/IT6fgXadc
         YGnTiPwVWr/3pJ4ovVan67CErLM+ZUq7iR4KexdmEy04VQq+VWJ6Dg+fK94Dow3FHfhc
         5Weug4HkLu14AHEu5dRtsnCTH9muUhkiMUzQJf5+HSg03LkIog9VRh2IlTz3bcS4+DA1
         rNsCv/NUTZMBpBpsY/DC5NbxiN2muKR1EOKBMWaBjd6dxGltzN60X7zXrQ+NlfaMtgit
         /Qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773459305; x=1774064105;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqNMCmmqJDcsaA0VdbH9eNtu9b3dBl63iWS6KS2e2D0=;
        b=GoL+LA0YgqE9Pa8w2OzbIDX020kCZ0uHOh96EMMtz1BhAlrtCoQjbTM4AewW5Hyu7D
         X1BJ9CDaExCkxZOZwbHLYETHz4z0pCQcl00dP7f3U83YWnoQ5G0xL2GdJnHcCcA8Yk2B
         G9I7dqHLvJh3SQoZA2Ugi9GvB4GV3Y3Zf2STleeteK6Q93MoIsOSTzX54Mj1pQmoofiq
         6f7GsHhQCFVRwiDGLNf8LunGRh+6JuJYugxUVuSwUcPJLwCGw7+bp5OWYGFirst2Or/L
         nfgHHgRw0rqzwPiwUDmnRdocCkFq5/sHUgYXhXY4Vw46CA+aYO0wPpR5PcMhX7NxENH6
         up2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1EQbfH7mguB4Qbvi4w9D6K8TPl0dZZUoSjnW8/LJccfMGTzMnq3UgkC6ndbQj6hOlQ3llPHkPKgK/1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi2tXNT/+fnToYHY64pFuyRggkcX6Wf6wbqW8nJhrAtI3T7YFa
	jZI02bd4nKHZh5HXD1+rk2TFGheiD+MeL/rOaqJgkUs+1+kZpN8vOL3j
X-Gm-Gg: ATEYQzylmjvrBYL5DPNF42BbuCsPWmHGLZOeNcgSPAFsyQh12Zw8i1AKI18GKc2sUjY
	iE//5ZxIlV5htjhBmqXatAOx+/2Frxyz1oc6FFVpKmE76k6vchz96/hMsofHP7qZzGy3ff3QTWK
	9cnyh+e80mRciuNG/il2yyU7ORP6Ou5k5sCe3CRllwIUCGjqz1t8aWoH1jDR/6mPn1FAtRPT57w
	yIcltsGCxt7Z5tBR5Q/pwiSDJEm176JGFoLgowZl0wFsQWutqJxWstC7roVW/ciYLCWC5NbmwOX
	koTZ4jP55ninWETx2emXh79hz50zAmtXnVoO8bgNDaiDbBDDV6BZVJuEPLX9zP/aQiE70QE/Ivz
	tU/M+asWx/NOQfnP5vahouWiWKQ9/Fq1Vpn9kfQvAHMyLnuMt+3fAIy4paEOhcpehnNIxVH4t2q
	EtFLMQJbhhv2WhxwKCtMlI/IIWo85J0ANtcyDkuhqHtC3JoylkLZiUZE/TpoMvGUa7JAt23uZAm
	zaNxiNbAFJ3+Cc=
X-Received: by 2002:a05:693c:3618:b0:2b6:aeb8:3d8c with SMTP id 5a478bee46e88-2bea55b2a69mr2536272eec.32.1773459304431;
        Fri, 13 Mar 2026 20:35:04 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-109.user3p.v-tal.net.br. [177.4.161.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab5702e5sm5917833eec.29.2026.03.13.20.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 20:35:03 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sat, 14 Mar 2026 00:34:46 -0300
Subject: [PATCH] ALSA: usb-audio: validate full match when resolving quirk
 aliases
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M3QpAQBBGX0VzbWrZEl5FLgaDifzstFLy7iaX5
 +t85wHlIKxQJw8EvkRl3wyyNIF+pm1ilMEYcpcXzmceaVXCqB2OcuMZJSw2CSly1ZfeuY5KX4D
 dj8Cm/Ommfd8PW9tq8GoAAAA=
X-Change-ID: 20260313-alsa-usb-fix-quirk-alias-e9c8300ba836
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=bCPDrfSIHgTotXmiaMzTBzeP1LSsPbI6BJ3CRFCDXwU=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlbrqdu/3TEWDb21XOHnc5MfF2fPGX9V3vZNt1RzJ3Vn
 fLv93HjjlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZjIVU+Gv2KRrqb5Mhzfrl9x
 OiLTfmbFH4VNz7+deTk7qGrR/zDL9omMDEvVb5QoJvoFJUu6rew57WEq55OQrLZH1DhC5NxC++5
 bHAA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
usb_audio_ids[], but it currently checks only the vendor/product pair.

This can make an aliased ID pick the first entry with a matching
vid:pid even when that entry also depends on interface descriptor
fields that do not match the actual device or interface.

Fix it by re-checking each aliased candidate with usb_match_one_id()
against the real interface before returning the quirk.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/card.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 270dad84d825..ff4418017763 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -870,17 +870,28 @@ static void find_last_interface(struct snd_usb_audio *chip)
 
 /* look for the corresponding quirk */
 static const struct snd_usb_audio_quirk *
-get_alias_quirk(struct usb_device *dev, unsigned int id)
+get_alias_quirk(struct usb_interface *intf, unsigned int id)
 {
 	const struct usb_device_id *p;
+	struct usb_device_id id_alias;
 
 	for (p = usb_audio_ids; p->match_flags; p++) {
-		/* FIXME: this checks only vendor:product pair in the list */
 		if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) ==
 		    USB_DEVICE_ID_MATCH_DEVICE &&
 		    p->idVendor == USB_ID_VENDOR(id) &&
-		    p->idProduct == USB_ID_PRODUCT(id))
-			return (const struct snd_usb_audio_quirk *)p->driver_info;
+		    p->idProduct == USB_ID_PRODUCT(id)) {
+			/*
+			 * Re-check the aliased entry against the actual
+			 * interface descriptors instead of matching only
+			 * the vendor/product pair.
+			 */
+			id_alias = *p;
+			id_alias.idVendor = USB_ID_VENDOR(id);
+			id_alias.idProduct = USB_ID_PRODUCT(id);
+
+			if (usb_match_one_id(intf, &id_alias))
+				return (const struct snd_usb_audio_quirk *)p->driver_info;
+		}
 	}
 
 	return NULL;
@@ -931,7 +942,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 	id = USB_ID(le16_to_cpu(dev->descriptor.idVendor),
 		    le16_to_cpu(dev->descriptor.idProduct));
 	if (get_alias_id(dev, &id))
-		quirk = get_alias_quirk(dev, id);
+		quirk = get_alias_quirk(intf, id);
 	if (quirk && quirk->ifnum >= 0 && ifnum != quirk->ifnum)
 		return -ENXIO;
 	if (quirk && quirk->ifnum == QUIRK_NODEV_INTERFACE)

---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260313-alsa-usb-fix-quirk-alias-e9c8300ba836

Best regards,
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>

