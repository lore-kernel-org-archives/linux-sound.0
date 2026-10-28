Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212420;
	b=k286bX9qGJkxDt4ggrUl8teDTpIWJiED45On5E5om3wkjtz+UW3B+3RnkP3pyKiWcU7O
	 pov+JmY/Pj4vBViVd97KFWM2JUqqlghWqMwTcGqBtsQRIx2UJvulpmmzGnni4ypBUnzJz
	 u2RxGNDdGQjVDsN8vKRwwvW1OGYUHKbC4NbWy8pbTNmcD95f3MXODBxlUGKBtsEzxBZ6A
	 I4qeXOT9eeuKg+YnmytFo+DMtlFAqk36rolLZROZ/gMPGHKz80JMugSm0lSy1bzJqSkos
	 1ugXREgPRtDELY7b4dKAV6WVza1J6hdyxznZNlY/aXvZ5rZFozB+E83mJLFM6d3uMnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TiC3PbdwJQfPnMIMNVlA843dptQ240ok8uM534aU+Jc=;
	b=qbMyqwYZcqWbcU/wzOq5ozZxOG++QBz/8KyfEojH8NDWvEy8oSFAcBDb6QuoHTAiuqaF
	 ADci5sVQy9F5+pAyzwlmmZDeiskg8u2sL5tMruRSNDvUrA+X5OEH94xjjTcfCwTcq+AmK
	 CoKpaJPqXWQTbII9hcWbmjjzkWf81jrzUhCxg7ghYmI/rrRQ3Qj21x/N6x4g/9BRUIhyb
	 7XHRqeYyEQsPtfG4tmk6vsDsspC0bLFB+WuGz/fhc2tdkbb0VL7bfRGsQIFCpZnp4EriV
	 ZU2BGrLqfyPg1qm4OVLYhrsWiSs/vkNtOGa5hofGtVas2Zre9p14p1sfPcBF1ZrcHtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n9PE3Rwx;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EDB606A320
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 18:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76EDB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n9PE3Rwx
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso14359485e9.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 11:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793212419; x=1793817219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TiC3PbdwJQfPnMIMNVlA843dptQ240ok8uM534aU+Jc=;
        b=n9PE3Rwxlh1FLLfomiBMOyWbWXaief7O46raWKJb68gWrP3GzDXfGLQ+0Itp4GKV+G
         0JOo6COAIKcV2PDHGIOfoWTCsA8Zmty/SqA/xH1qKkXrEYXPWKSZmN9fW7n0GlOiC0KR
         CF9MKZb1SgWGTDFOHW+Np5TkdYzCE4HnPuMWpa27ZxLKYtaQ3g+MaIGWPo4pj2+lkAvo
         Skmpr0boGSxGoz9wLxOGunhFU/18si48KvehgTcfsWqHl6oc132I7NeXkfkpTsIvSRDO
         HiHl3zMhKbevjvXptTremiLhaaoNerZDIXgk2GJ2UdbeMHCnU6Bkxc0uil61X6GljwkP
         RK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212419; x=1793817219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TiC3PbdwJQfPnMIMNVlA843dptQ240ok8uM534aU+Jc=;
        b=v/gkoRYoHedlyusgaBIuxe8TjV6LvnA/XExrQHq2+28PLgs/mav+1XsehE1F810F13
         jfxGsfOFSYZYyudQFPE2+T37ukwBskiZdkQsullzsWNpHCPz5ezgFWSWo8v8G1qnthXh
         agZgrC6Md5P0f2KEu4VHaUvncVsnviX6vuis8HB5zHNmg7+umK++L5+y3771bb6iV4z6
         NBtrwaLQFzhYwp/wEP4K95KxbAZUKJ64PaNMR22sYgxWDL8jU1TlKWrfOlcxA2xE34k7
         1GZADCe1SQcxoEywFLu6LFJ3xdfCx8VGoRqgNoNVfCeiOQn5ovi88jq8kw4yML3L2MTN
         9JFQ==
X-Gm-Message-State: AFq9FYKPq66/zRRgp1g00uai3uaH3D6zhYtpXBA2mkb+VHnS1UiTsVFF
	5cwcpLwPhjwsVB1T30laqYDxzRm7L30UpdMCmV3wReRRSvOs4wNGRQ7TuCNlQoLMwXg=
X-Gm-Gg: AYBFou15vNGh90j3AGxOz99RDo1LxXRWJoRwEid/DRVYuUXk4GICPoNJwgbgdz+mZEM
	YIrTOzmE67hn4IqLbUMbhCfZDUOQCVwJ5AT3LrZuzccguhHxSdhZ2Y0zALTzzyKWnDepcUHB1ZH
	upVONX/N+s/4/wkeGT1bgGTV6QBa1oTqa/P/GQwkV9OboZ3EGMwIWxCp4UvNOjY4fI/jE75zcZV
	vvsrYfIa/c9KfgonsccfTc6cBeWr4CUSLuzZqT1yhEopDoQgkwnhKs1OCeb9IM/rsbqP6sWPPFR
	PdUyEnhLfWfbceL0NxLBJoPBlgKlJPThAVk1+xxF/IgAGkaRAGaWqV/bOIksB5PGRPdsiLanJnd
	xwssu5MRYNzbg0EBS3xzvd3D2XPBlZqZmE7cl/i2oUD7JKCmK8a/DzqtqhE96PlH2yf2yM96h4f
	mDe01lYmaAo/PHhWeNOu7mKcvlKxbK2o3A2xUln4FX4OMs9P3TlOsZrJvHigbTVThFx/hk3BVz7
	M0JgRVGB5ibW+LJA+SPKbCv7DL8lWeK5lP7vvaoAoGYl+RcTRgPNL4KUEiQtzttSgW+fdj5Zno1
	C46CmL3de5OH/MMqE/rMJoYFrA91XIZzAQAuuIucY0z80D6hn8cUKVbQ//qj17FJmq+WjWfBAQj
	v7yvjt5c=
X-Received: by 2002:a05:600c:3c98:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4a96695f0e5mr70871295e9.16.1793212418555;
        Wed, 28 Oct 2026 11:33:38 -0700 (PDT)
Received: from gmail.com (dynamic-adsl-84-221-247-128.clienti.tiscali.it. [84.221.247.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f52e2sm11723035e9.9.2026.10.28.11.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:33:37 -0700 (PDT)
From: Davide Gironi <davide.gironi@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	Davide Gironi <davide.gironi@gmail.com>
Subject: [PATCH v2 1/2] ALSA: ice1712: add a board-specific EEPROM initialization hook
Date: Wed, 28 Oct 2026 19:24:09 +0100
Message-ID: <20261028183155.787599-2-davide.gironi@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028183155.787599-1-davide.gironi@gmail.com>
References: <87y0bk6gfn.wl-tiwai@suse.de>
 <20261028183155.787599-1-davide.gironi@gmail.com>
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

Add an eeprom_init callback to card info and call it after reading the
EEPROM but before generic chip setup. Move the existing DMX6Fire fixup
into the EWS driver.

Assisted-by: Pi:gpt-6-luna
Signed-off-by: Davide Gironi <davide.gironi@gmail.com>
---
 sound/pci/ice1712/ews.c     | 14 ++++++++++++++
 sound/pci/ice1712/ice1712.c | 31 ++++++++++++++++++++++---------
 sound/pci/ice1712/ice1712.h |  1 +
 3 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ice1712/ews.c b/sound/pci/ice1712/ews.c
index 1dffcb0..62574c3 100644
--- a/sound/pci/ice1712/ews.c
+++ b/sound/pci/ice1712/ews.c
@@ -1012,6 +1012,19 @@ static int snd_ice1712_ews_add_controls(struct snd_ice1712 *ice)
 }
 
 
+static int snd_ice1712_ews_eeprom_init(struct snd_ice1712 *ice)
+{
+	if (ice->eeprom.subvendor == ICE1712_SUBDEVICE_DMX6FIRE &&
+	    !ice->dxr_enable) {
+		/* Set EEPROM value to limit active ADCs and DACs to 6;
+		 * also disable AC'97 as no hardware in standard 6fire card/box.
+		 * DXR extensions are not currently supported.
+		 */
+		ice->eeprom.data[ICE_EEP1_CODEC] = 0x3a;
+	}
+	return 0;
+}
+
 /* entry point */
 struct snd_ice1712_card_info snd_ice1712_ews_cards[] = {
 	{
@@ -1060,6 +1073,7 @@ struct snd_ice1712_card_info snd_ice1712_ews_cards[] = {
 		.subvendor = ICE1712_SUBDEVICE_DMX6FIRE,
 		.name = "TerraTec DMX6Fire",
 		.model = "dmx6fire",
+		.eeprom_init = snd_ice1712_ews_eeprom_init,
 		.chip_init = snd_ice1712_ews_init,
 		.build_controls = snd_ice1712_ews_add_controls,
 		.mpu401_1_name = "MIDI-Front DMX6fire",
diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 376df1a..6cc38ee 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2283,19 +2283,28 @@ static int snd_ice1712_read_eeprom(struct snd_ice1712 *ice,
 
 
 
+static int snd_ice1712_init_eeprom(struct snd_ice1712 *ice)
+{
+	const struct snd_ice1712_card_info * const *tbl, *c;
+
+	for (tbl = card_tables; *tbl; tbl++) {
+		for (c = *tbl; c->subvendor; c++) {
+			if (c->subvendor != ice->eeprom.subvendor)
+				continue;
+			if (c->eeprom_init)
+				return c->eeprom_init(ice);
+			return 0;
+		}
+	}
+	return 0;
+}
+
 static int snd_ice1712_chip_init(struct snd_ice1712 *ice)
 {
 	outb(ICE1712_RESET | ICE1712_NATIVE, ICEREG(ice, CONTROL));
 	udelay(200);
 	outb(ICE1712_NATIVE, ICEREG(ice, CONTROL));
 	udelay(200);
-	if (ice->eeprom.subvendor == ICE1712_SUBDEVICE_DMX6FIRE &&
-	    !ice->dxr_enable)
-		/*  Set eeprom value to limit active ADCs and DACs to 6;
-		 *  Also disable AC97 as no hardware in standard 6fire card/box
-		 *  Note: DXR extensions are not currently supported
-		 */
-		ice->eeprom.data[ICE_EEP1_CODEC] = 0x3a;
 	pci_write_config_byte(ice->pci, 0x60, ice->eeprom.data[ICE_EEP1_CODEC]);
 	pci_write_config_byte(ice->pci, 0x61, ice->eeprom.data[ICE_EEP1_ACLINK]);
 	pci_write_config_byte(ice->pci, 0x62, ice->eeprom.data[ICE_EEP1_I2SID]);
@@ -2502,8 +2511,12 @@ static int snd_ice1712_create(struct snd_card *card,
 	card->sync_irq = ice->irq;
 	card->private_free = snd_ice1712_free;
 
-	if (snd_ice1712_read_eeprom(ice, modelname) < 0)
-		return -EIO;
+	err = snd_ice1712_read_eeprom(ice, modelname);
+	if (err < 0)
+		return err;
+	err = snd_ice1712_init_eeprom(ice);
+	if (err < 0)
+		return err;
 	if (snd_ice1712_chip_init(ice) < 0)
 		return -EIO;
 
diff --git a/sound/pci/ice1712/ice1712.h b/sound/pci/ice1712/ice1712.h
index cd02710..6e9c13b 100644
--- a/sound/pci/ice1712/ice1712.h
+++ b/sound/pci/ice1712/ice1712.h
@@ -509,6 +509,7 @@ struct snd_ice1712_card_info {
 	const char *name;
 	const char *model;
 	const char *driver;
+	int (*eeprom_init)(struct snd_ice1712 *ice);
 	int (*chip_init)(struct snd_ice1712 *);
 	void (*chip_exit)(struct snd_ice1712 *);
 	int (*build_controls)(struct snd_ice1712 *);
