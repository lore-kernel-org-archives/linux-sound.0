Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295905;
	b=zAgIqlyg3cIEbFE67nIMp0rl4U7ENxuE5IDQLQyx4/koYQmorb4aN71J3oC6TuypcBn+
	 NaHIZ4JHtzSpXoBfEBfFRIpUqf5z9lN9FTmKUBLTRHbNFAg3hg1Fu73NYHIFYpiiP10LH
	 pgf6EXCoaQcQxnD5rsBG8/Yoj04pJm3cBj2NCeuS0o18uXXLS+a0aguwG4JOAazGdSy7d
	 m/UcABif08477semANYWBl5HllIBokL7iULOnn55Su9+nI8HiPzWV5pBcXeNjIwbOfoaJ
	 e7232tECORUN/WJGqqILZ9rGc55B1XWfPzpUi59PHmATCzmJj0/3xWztRdllDFXsphQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Iihqh3jg1Fo/JG4K+1inwvG2PsMwLH1y1X5y2K/lrO8=;
	b=aJFAX/V5W4Xq57Im6F9+7GAa2ZCxrw2HVKQymtuYbp1kbBg8kHhMDmMQIj+s5rhVlisI
	 nMLCxWib077Efzyt+eU0RwwDAXCsBqkx+ahA2LjCqi5aq2zgySrpWmfyKJLtLPHnoCgG5
	 xqOIPpWw7gYkvd9b9gQ8cIXVT2gfkb5x17dptftbszXc/+l4K5QhgBtX825h7RThf7bkC
	 h2E8sM2x0TQwLnbPABdme7y3rKYpOxJ75NYxf8DZlYI9m7J/Eyqz8VKzTWrwX39utd3fO
	 RmyRy1+uRuRCQfMi/t7vLI97l0s+w6rAAnlTaGsxLJko53iJGh3/qyZaSujexDGo1eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gaZnpUqo;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D5E606A31C
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 17:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43D5E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gaZnpUqo
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so14775995e9.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793295902; x=1793900702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iihqh3jg1Fo/JG4K+1inwvG2PsMwLH1y1X5y2K/lrO8=;
        b=gaZnpUqosYh+K+C2b7hl2OXB2Pjdz/S0be0v6Ir/6w7DFyiIgNpxEM/CB8Cy7Xnalw
         cciI30agk6PFN7EFNYifjlZkrbxafO3INk/rVvGDfu+u0lUdhfkiJvCDezUxVXtwi2Kc
         CtN2Y1ps1JlQisSUhNoVscoOyj5ZWfjfnEpj5Kxan6knpRgdDWYQF3LgUV+gBI6vths/
         2iq7uFunhsKJ/CjiQnByjbdvAXb7TMOCO/jnEmryRhoaxnKO4eNKA52UKiXVCK0EwLls
         UtABCJ2yn2vXEmeK4rOmfKSYGcuP/dLWbmVUXq+pFnbYqd8p3WsVGU1kKBESZEiIHgTb
         yCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295902; x=1793900702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iihqh3jg1Fo/JG4K+1inwvG2PsMwLH1y1X5y2K/lrO8=;
        b=lBsvPEyrNi9PFe9I9AyWNzs29NWpLRTHF4gQpp7mbL+ambF4JQKGcOs0SAkaVLh4+4
         0OLUO52/pQ/F5I66JeSSwyfIMOoE7JukIFKBfQrxyccjnidRNLdnRKw2cmjROyfq2UjR
         qQmgUneKfoC879HBD2QU9M3kGG8xsKwaAH73IcSVccNKaIv9f6376o+j6Wrg0Y6RDoip
         AHJokEBsi1h7DWSXNJ7XusqWeil9VX5GtUKkhOZ5pzgQjpg4Ov6eYZZKGad9TOuPzz0n
         DOy6l+8rFzALzujGLxzO2uX9bEOsCBwLUW1Muirt01kavEHoiCl3n9zqOh97N0KUlFHK
         yerg==
X-Gm-Message-State: AFq9FYI2H0zkjhfVAWikP7d0GplAH3ft1hYWmQB3x8Ox34HXz558kr3z
	DKFfXWvKCqkSRu8ijdo7NSAOamiEEqDqeqxUDK2pTJlnauPti8YyzzLo
X-Gm-Gg: AYBFou05sp9PXTn5DX7quIwJl496Uw39e87aIF1soTqH93BCTksQ3kUziHkmvgVGjsk
	iL71Jclo8nwElR2skS4iZtXltayYbdiBhFeGpt0aXH3r/BCaCnGUfo55zeFbpE/ms7TL9afwW9Q
	cG3IAmIpg26BSg9F0u8ZMqzxSdXYeuLW/Pes+e/3uG6UGIPE9qW33v4deO16lsuD97dFplSUr25
	Kf18Nplc2RhcSpgMXdyQyHBQl2q/CgKTZjMDsz6+PT61fmuff2ZgkpdDAPHNZt/4EBwhM8QlSGl
	8xdMKUMMyf8qm2o7yAg0k6nHDO1sLzYuRCFYbVLd9NRsUvGx9Hz3lA1FNwrBIn/+y9NUdIOJ4Qg
	KpFM5a1RMgTpBQl3NsMc8Io5K6dWHBh7HFrgIph0jLhy6uUDFbmlukB8PmFBpHxbXh+Ny2czvwU
	3xvVydMho4KY7tSJwVj7+gDXtP5GPrGALRLo3lBHK6/YD+0C4VFp0QoRSd91EhyiyygexxEbN5y
	lNpRLT5DVcY3wHsay2kkjqfmJcQNixvCv4PAaPfYFZUJ5WbxSuchaj8/GD2Ffnetqb3HpT9Aa/r
	2z/tohPXeNBW3mzX29D6SWt5Z3y3mXvatAs8vH0pGm0ZTImsAkFQ6LKRcHygzi2n3GX4qFFCrOs
	=
X-Received: by 2002:a05:600c:621a:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4aa871e8be0mr84272155e9.7.1793295902519;
        Thu, 29 Oct 2026 10:45:02 -0700 (PDT)
Received: from ahmad-HP-ZBook-17-G3 ([5.208.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm86776545e9.13.2026.10.29.10.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:45:01 -0700 (PDT)
From: ahmad baghereslami <ahmad.b1995@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ahmad baghereslami <ahmad.b1995@gmail.com>
Subject: [PATCH] ALSA: hda/conexant: Add mute LED quirk for HP ZBook 17 G3
Date: Thu, 29 Oct 2026 21:14:46 +0330
Message-ID: <20261029174446.1412118-1-ahmad.b1995@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The HP ZBook 17 G3 (PCI SSID 103c:80d6, codec CX20724 with SSID
103c:80f8) has a speaker-mute LED wired to GPIO0 of the codec, the same
as HP's other Conexant laptops of that generation. HP's Windows driver
for this model sets EnableGPIO0MuteSignal. The mic-mute key's LED is not
connected to the codec: toggling each of GPIO0-6, the EAPD of the unused
pins 0x1d and 0x22, and the VREF of pins 0x18 and 0x1d only ever lit the
speaker-mute LED (GPIO0). CXT_FIXUP_MUTE_LED_GPIO would also register a
mic-mute LED on GPIO1, which drives nothing here, so add a fixup that
only sets up the mute LED on GPIO0.

Tested on an HP ZBook 17 G3 with Ubuntu's 7.0.0 kernel and this change
applied to its conexant.c: hda::mute follows the master mute, sound and
the microphone keep working, and the mic-mute key still mutes the mic.

The GPIO and pin tests, reading HP's driver and this patch were done with
the help of an AI coding assistant (Claude); I verified the LED behaviour
on the machine.

Signed-off-by: ahmad baghereslami <ahmad.b1995@gmail.com>
---
 sound/hda/codecs/conexant.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index a141c94ee..525a6d0d1 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -305,6 +305,7 @@ enum {
 	CXT_FIXUP_ACER_ASPIRE_GO_MUTE_LED,
 	CXT_FIXUP_HP_ELITEONE_OUT_DIS,
 	CXT_FIXUP_HP_ZBOOK_MUTE_LED,
+	CXT_FIXUP_MUTE_LED_GPIO0,
 	CXT_FIXUP_HEADSET_MIC,
 	CXT_FIXUP_HP_MIC_NO_PRESENCE,
 	CXT_PINCFG_SWS_JS201D,
@@ -810,6 +811,13 @@ static void cxt_fixup_hp_zbook_mute_led(struct hda_codec *codec,
 		cxt_setup_mute_led(codec, 0x10, 0x20);
 }
 
+static void cxt_fixup_mute_led_gpio0(struct hda_codec *codec,
+				     const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		cxt_setup_mute_led(codec, 0x01, 0);
+}
+
 static void cxt_fixup_acer_aspire_go_mute_led(struct hda_codec *codec,
 					      const struct hda_fixup *fix, int action)
 {
@@ -1089,6 +1097,10 @@ static const struct hda_fixup cxt_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cxt_fixup_hp_zbook_mute_led,
 	},
+	[CXT_FIXUP_MUTE_LED_GPIO0] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cxt_fixup_mute_led_gpio0,
+	},
 	[CXT_FIXUP_HEADSET_MIC] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cxt_fixup_headset_mic,
@@ -1193,6 +1205,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x1025, 0x1937, "Acer Aspire Go 16", CXT_FIXUP_ACER_ASPIRE_GO_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8079, "HP EliteBook 840 G3", CXT_FIXUP_HP_DOCK),
 	SND_PCI_QUIRK(0x103c, 0x807C, "HP EliteBook 820 G3", CXT_FIXUP_HP_DOCK),
+	SND_PCI_QUIRK(0x103c, 0x80d6, "HP ZBook 17 G3", CXT_FIXUP_MUTE_LED_GPIO0),
 	SND_PCI_QUIRK(0x103c, 0x80FD, "HP ProBook 640 G2", CXT_FIXUP_HP_DOCK),
 	SND_PCI_QUIRK(0x103c, 0x8115, "HP Z1 Gen3", CXT_FIXUP_HP_GATE_MIC),
 	SND_PCI_QUIRK(0x103c, 0x814f, "HP ZBook 15u G3", CXT_FIXUP_MUTE_LED_GPIO),
-- 
2.53.0

