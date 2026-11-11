Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387892;
	b=K7/FjaJdDW02rNhCgOPlC1RnQhpTZcQM6iUq9q9RSATAbBwT6Jm5Gs3DvodORVFWHAa+
	 a5QDauxr9Gge3jIq7+Wn7UR5wOdob3PMBY5vBDup0vhZ8RAlWXFMqTh95gkdncO4GuZiL
	 KQBvf/8ttJWgA+Zi3V6Ny967XlFfbNijmpYtrb3A0/xsfuh2uvxLofPQoGkBTw9yGL/Ay
	 juP2H4fI5SYXkqFRmLr5DGTko9HY7WjzUZ2nTIgk2UfLRqwFlioXWljYFVNxjtZcLhHZ9
	 /mTtemNY6BQbFgF86EnNjfmXnImFigkTdt7d1tAYOw7XCDIImiKBJIBpUtpTrWeNHTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iM99u/wwPmE5KLLz4YhFtMNm6JUk93fDNNTlNEo4DKo=;
	b=KhvzF5Kfp94VZFP/CeiRGRo3RQ/zWjn4+cowVA3xtiXh5syt2aavKOwkvTqDX3VKpRzc
	 qqiblG2ZetoyNecNQG2/hb5zqa5pyqLZ4fwM8Nr0NM1spwbk7iLxwMHTUuCQM75UiWbli
	 7kJ6zplgWUHmppXeMVv/go5mk7frw/xNk6cL6xdMm8HFOvSQ/cj5m/4cRJ59AZn55LFdB
	 +SbEsWc0dW7G4QYq6ykoqHK3PcDBL2JtA865R9eLDM1blfQ6vVSQsFFFXPSHvO71bhhdx
	 uivgGIqOolD1jUY3lmAOqDQVkLlGybMVwH4Cql8/mdBixL7N/m/tdLCy6wNeR2JP/hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wmwdv3VI;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2C260A2635
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 09:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C2C260A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wmwdv3VI
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so1499669b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 01:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794387890; x=1794992690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iM99u/wwPmE5KLLz4YhFtMNm6JUk93fDNNTlNEo4DKo=;
        b=wmwdv3VI5m4akzuGKAZPQWZZeDQaxHrrkQIfBa8c5nMeNf6/THhx0+dFVu7QrvdAHT
         14QJfg4i25MVqvWfmIV1e8L9iZSPLnyUfTu5balhj9ftzhmjjpQ2dHjnWfWt86/onNrW
         UF+UpNsTA3oCGS/RbiE0l4dXhs+keHfqdkYLBgdBqV0AD6IgO2JUrR1vDVyQmtoFyNQp
         xCo3/V5b8X0gjAM0H53pASf1WJFgPaBlfCIoELYieMLYa78zXdWokmVBXbqzYWQesRgB
         ct4eSr6vsL6YSpGPtE05RV25BFoy8YCxnH4+PbqK4umryyEolRSWmccus+3ofA0DNOgv
         o+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387890; x=1794992690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iM99u/wwPmE5KLLz4YhFtMNm6JUk93fDNNTlNEo4DKo=;
        b=Z6BlwMvYQWdY5vuqq/Z0kL5iJT479iJBaMNwmfzwfGvHtNbgBsmBc/oORhhBUOUBa6
         CHRoyPSCo1NZSABEsYaHOtP9HLv75SI8pPI4rrTInXot6yz5YCzwn7y1jbESuJEy1gB+
         2mj7klypNXaZKy5HYz+kCOIWUyh9IhWVkbkT5pF5TIC49V+aX5mCa9gVz+VQyhN1Rxau
         P9Qz2/Ujk4FzLVdCWVOVMtjxp5XsCGgAS2pbblnTfp1om8eohBik7qIBD9rpMjebGY5I
         J5bWYbS73m6mbKv4M1S3NKcFcjQDuDCbimtS8SCfj3cSqWzKBHCWK3o5/RE1mCYnHZa+
         xV3Q==
X-Forwarded-Encrypted: i=1; AL+hErEhlB/OUDdplJjyLGSfaQpjyNSZw3/6xp9l5K4+bcA4CNj/LyRl6lS3g/hE2mWfTIHI3TQU2hFPuIj66Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9vdJ7+wS+GRxuWV1nflWVygNHroFwU2xCWpnQkrQxweITGcCxi
	wHdvJJHxHrvbyRoBH3GzSih4HWuF/sHIiB9r1v8pt4Ecz6LBlulRr1fu
X-Gm-Gg: AYBFou1c/seWQ4e1WGe7HI6GFBpSGqRnosjbFtXj4N9Hf2DRMt0Vsldit4efLntndMH
	+ZkXfTkjKn0zMtiSRAzm8TMZoKroJlyvAsaYyw9AbVQk+TNjuqUtDy0NY5EDyN/a0Eemy6NDG+v
	Ro62pNmKQUTYTKudRHvci7Q3L0WlQk0/LIOPuShvGA4a5pj5epDXMDfgL4rz9ZkHZkegFF2A01w
	aL7Vf6upD+wZo/NifsnpdNlFbDUPcYsfCSKpwZ3ZKrveXkWXwNS2LQ/DsqJFlblKCUzS/lSTPU3
	9uAdGhIdejExN7cG896JJZv162rRZDESawmjmU8tP1r6yAClOvB/LF6ML22QwnZeEB/X0/+ifHz
	fvgDge5BjKY6nBBOQ1/GalnaJGBl4kW4X5VY7MM+6gjGQsjjdMlvGPMXKG/LLIWkNG/EVinR5Uu
	EzE6suwuIRcwklTrLBVdGYRNr+VNWj5xcmaRypyyH71te0P8xt0qn5wk2J6DDZJCnYbdbva4VXY
	kEBIwAMhfXCJrQ4Xbk7pVNPSg7GMZBEeIUw1eQ0e+1DzZAzA1JD4sdP6quFTKe282HjHvrRU8iN
	By5UekXn9tEYX2HGw6Zv8lOvNqrO3iuUz1730bSScAp8gxo76pL7Wl1n0KiC8PNYHRT2S/rG770
	XFS0/uWqFhVtnRRDCuidsrFXIzuDylZEzh0c9IFnw
X-Received: by 2002:a05:6a20:160f:b0:3e1:6010:fb16 with SMTP id adf61e73a8af0-3f2fcf9f826mr1765772637.23.1794387890430;
        Wed, 11 Nov 2026 01:04:50 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7cede06sm1929924b3a.7.2026.11.11.01.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:04:49 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	ivan.orlov0322@gmail.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 2/2] ALSA: pcmtest: Add a volume control with event fault injection
Date: Wed, 11 Nov 2026 18:04:29 +0900
Message-ID: <c49e86d563eb751961bd40f4284c2549bf81126b.1794386073.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794386073.git.sammiee5311@gmail.com>
References: <cover.1794386073.git.sammiee5311@gmail.com>
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

The mixer-test selftest checks that a control sends an event when its
value changes, and only then. No virtual driver has a control that
breaks this rule, so without broken hardware nothing shows that these
checks work.

Add a stereo volume control to pcmtest, and two parameters that make
its put callback report the wrong result. With inject_ctl_no_event it
reports no change, and with inject_ctl_spurious_event it reports a
change every time. Document both parameters.

The control is always present. It is named "Test Playback Volume", a
name that the OSS mixer emulation does not map.

With both parameters off, mixer-test passes on the control. With
either one on, only the matching event check fails.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 Documentation/sound/cards/pcmtest.rst | 14 ++++++
 sound/drivers/pcmtest.c               | 68 +++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/sound/cards/pcmtest.rst b/Documentation/sound/cards/pcmtest.rst
index ed0b57f583b7..351f1123b8e7 100644
--- a/Documentation/sound/cards/pcmtest.rst
+++ b/Documentation/sound/cards/pcmtest.rst
@@ -17,6 +17,7 @@ At this moment the driver can do the following things:
 	* Inject delays into the playback and capturing processes
 	* Inject errors during the PCM callbacks
 	* Pause the streams
+	* Report wrong change results from a mixer control
 
 It supports up to 8 substreams and 4 channels. Also it supports both interleaved and
 non-interleaved access modes.
@@ -37,6 +38,8 @@ The driver has several parameters besides the common ALSA module parameters:
 	* inject_hwpars_err (bool)
 	* inject_prepare_err (bool)
 	* inject_trigger_err (bool)
+	* inject_ctl_no_event (bool)
+	* inject_ctl_spurious_event (bool)
 
 
 Capture Data Generation
@@ -100,6 +103,17 @@ Errors can be injected into the following PCM callbacks:
 	* prepare (EINVAL)
 	* trigger (EINVAL)
 
+Control event injection
+-----------------------
+
+The driver has a 'Test Playback Volume' control. Its 'put' callback reports a change
+only when the value changes, so a change event is sent only then.
+
+With 'inject_ctl_no_event' set, the callback reports no change, and no event is sent
+even when the value changes. With 'inject_ctl_spurious_event' set, it reports a change
+on every accepted write. The mixer-test selftest (alsa/mixer-test.c) checks for both.
+If both parameters are set, 'inject_ctl_no_event' wins.
+
 Playback test
 -------------
 
diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 66bee8a2ce34..98685e6158cc 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -34,6 +34,7 @@
 #include <linux/init.h>
 #include <sound/pcm.h>
 #include <sound/core.h>
+#include <sound/control.h>
 #include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
@@ -57,6 +58,8 @@
 
 #define MAX_PATTERN_LEN 4096
 
+#define MAX_VOLUME	100
+
 static int index = -1;
 static char *id = "pcmtest";
 static bool enable = true;
@@ -65,6 +68,8 @@ static bool inject_hwpars_err;
 static bool inject_prepare_err;
 static bool inject_trigger_err;
 static bool inject_open_err;
+static bool inject_ctl_no_event;
+static bool inject_ctl_spurious_event;
 
 static short fill_mode = FILL_MODE_PAT;
 
@@ -109,11 +114,17 @@ module_param(inject_trigger_err, bool, 0600);
 MODULE_PARM_DESC(inject_trigger_err, "Inject EINVAL error in the 'trigger' callback");
 module_param(inject_open_err, bool, 0600);
 MODULE_PARM_DESC(inject_open_err, "Inject EBUSY error in the 'open' callback");
+module_param(inject_ctl_no_event, bool, 0600);
+MODULE_PARM_DESC(inject_ctl_no_event, "Report no change from the control 'put' callback");
+module_param(inject_ctl_spurious_event, bool, 0600);
+MODULE_PARM_DESC(inject_ctl_spurious_event, "Always report a change from the control 'put' callback");
 
 struct pcmtst {
 	struct snd_pcm *pcm;
 	struct snd_card *card;
 	struct platform_device *pdev;
+	spinlock_t mixer_lock;	/* protects volume[] */
+	long volume[2];
 };
 
 struct pcmtst_buf_iter {
@@ -544,6 +555,58 @@ static const struct snd_pcm_ops snd_pcmtst_capture_ops = {
 	.pointer =	snd_pcmtst_pcm_pointer,
 };
 
+static int snd_pcmtst_volume_info(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 2;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = MAX_VOLUME;
+	return 0;
+}
+
+static int snd_pcmtst_volume_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct pcmtst *pcmtst = snd_kcontrol_chip(kcontrol);
+
+	guard(spinlock_irq)(&pcmtst->mixer_lock);
+	ucontrol->value.integer.value[0] = pcmtst->volume[0];
+	ucontrol->value.integer.value[1] = pcmtst->volume[1];
+	return 0;
+}
+
+static int snd_pcmtst_volume_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct pcmtst *pcmtst = snd_kcontrol_chip(kcontrol);
+	long left = ucontrol->value.integer.value[0];
+	long right = ucontrol->value.integer.value[1];
+	bool changed;
+
+	if (left < 0 || left > MAX_VOLUME || right < 0 || right > MAX_VOLUME)
+		return -EINVAL;
+
+	guard(spinlock_irq)(&pcmtst->mixer_lock);
+	changed = pcmtst->volume[0] != left || pcmtst->volume[1] != right;
+	pcmtst->volume[0] = left;
+	pcmtst->volume[1] = right;
+
+	if (inject_ctl_no_event)
+		return 0;
+	if (inject_ctl_spurious_event)
+		return 1;
+	return changed;
+}
+
+static const struct snd_kcontrol_new snd_pcmtst_volume = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Test Playback Volume",
+	.info = snd_pcmtst_volume_info,
+	.get = snd_pcmtst_volume_get,
+	.put = snd_pcmtst_volume_put,
+};
+
 static int snd_pcmtst_new_pcm(struct pcmtst *pcmtst)
 {
 	struct snd_pcm *pcm;
@@ -582,11 +645,16 @@ static int pcmtst_probe(struct platform_device *pdev)
 	pcmtst = card->private_data;
 	pcmtst->card = card;
 	pcmtst->pdev = pdev;
+	spin_lock_init(&pcmtst->mixer_lock);
 
 	err = snd_pcmtst_new_pcm(pcmtst);
 	if (err < 0)
 		return err;
 
+	err = snd_ctl_add(card, snd_ctl_new1(&snd_pcmtst_volume, pcmtst));
+	if (err < 0)
+		return err;
+
 	strscpy(card->driver, "PCM-TEST Driver");
 	strscpy(card->shortname, "PCM-Test");
 	strscpy(card->longname, "PCM-Test virtual driver");
-- 
2.43.0

