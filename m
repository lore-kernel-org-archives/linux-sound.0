Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450945;
	b=3HDI1xXeRKpw5VhzEFAYYk4RRF8Mvg1tZJxVS6d7F/Z4GDeC1jn1jko9hM4pE+iQWvv4
	 MiMF1czRlKMviSDzbfzjZ7j0bIWYRORTVcjv5pb+HkD3Evbp9XOcr9uxQUST69xS/kEQH
	 yi8pQBdYdkerQ/KJgbm8Wr8mIBrQK/AdA91/G4aFBlABt3beMyGcoYads/QTahIrmd3VT
	 fSdTfGZ1yhFYghIRwA1aguB7FYmBN1RsF3EdVWTMJ99+9gmBiY2YwGWS6al6HIny2AQKO
	 IWoBr+vkLeBsNJQSeBh1+Kt3a5WV4E66VwVmjwmRVSPt3Vwi19VYh3u1kguiwt9c8xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YMfXJxODms2+O2PZQAEWJu9meH7NzdZRMPqpLmqisyQ=;
	b=4JozRwmTZvSSVPmuIcBPRwrKEnUyBFKhzJR7dNRDlp/elEUNlSBOdyLraQykfrpfXX+b
	 bJa24mCe3dF8rhbJYBtTG3G8hfsiS6SwS42/wtIjR5iwotb5WhchaqVHA7bEkfiCIsLaB
	 7ERX6DmlLrmzHL7ZhNwJ7/8MrXOp/XTeldr4uEwtmpjLqsnGubWpcCj/Dyyd/M0bdsjQV
	 p8/YHV7p1LoSX9qipVH3FKkNIQ3soA985ycclYlWypce1w9qXwgLf2cfyd9OeLiLPD7qL
	 bEOtuQQi9gVtOz4/chCSdEd5RtMvUdhHl1RWACUz1xzmnLzT2+TloPu+wjmoi/qonaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HIlCv+6F;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD11606A328
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 23:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD11606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HIlCv+6F
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4949f037131so1598281fac.3
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 16:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450944; x=1793055744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YMfXJxODms2+O2PZQAEWJu9meH7NzdZRMPqpLmqisyQ=;
        b=HIlCv+6F6NY1gjaaD9dm0im+IGRDoL8KSo9nVlQnUKMrAFTOOBoyUvKaL4H4GE4Uwh
         tcxiP4EVJ5LFIafPVqC+njRiOoj6kdRGmA+F4y4q4LrSkQAi4Qry6IEE17VStBKlVzqx
         ucpwkGv847HuYwsrBklDZQsNiS0LRpICqBP+Q3RtpCHOsaMax1LyNvMrutojqs8VbmWr
         8QsI8aTsSd5c2hM0CTVNd4pEWg7fs+c+IVf/Klr9u7lRGzD4SKtcPJ3UfF5kg1nxAIwf
         9jSxwKY1E64O4fH9ul39v6gHq7/w/f7L+clHHkObyQkbl9qWmmz/8C3R65jmV4qxSsHQ
         idog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450944; x=1793055744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YMfXJxODms2+O2PZQAEWJu9meH7NzdZRMPqpLmqisyQ=;
        b=m6uLwzzgumh+0vZT4/lJi8fYdNjeZGXf8Jaj02XUtdgQcMm5pOo04OwbHRwSZ2uk+g
         ukeW1jDW6/t1WbsjaoIzOKf3OuOhIzu1UIf6bCMKsUpFPVV5jM/5TzcQb4YR51e+xJWN
         vRYr0FPQgBFCQ9cYDBKffl6CLBlWK5ESV9W2sjJKQxsan+/Z1R4w86iYES0ZMWkXr2jx
         SlXvnG7pGHGPnNgE5MZ1KyynmzdxFhDwjDtN72s+HzXAaK2PUox4o2jClrFx3Cm+qw0m
         9lF4ttw2NxD0V0FCEnJC0EG7jBNdJof+MxRBFKrnO8nDXQaRQoriDafZaYCefPyToDxC
         Rlbg==
X-Gm-Message-State: AFq9FYKIU2saxWXIDuPdELId4HDkKNlDjIHnQRq2QwPXs6cAtqDadayH
	ZF/nSGK84Wq1Z6qrTlBBNVLwmcF8CuiJd4dNChlZlhPH45iTEGS6NMlK
X-Gm-Gg: AYBFou3GRLmNr73c9n2bg/VNgeNikczvL2SPNSuan2IsyAXTKBOAWh/cPu66EHXqlnr
	FJ3dKk3xxhJZh+28Aaz6gZYui1hNfaYyx49djUzLa7bdI+6AaJyHRbcu0x4G0LVsA0FaC6OGfXv
	IbOdDR8M+s4zFhl1RYSsWOEEdZz5mkU4JCaVuG8DHIn0VgEdPD5P1bARnNAirdabG0DvSpGZziL
	tuW9AEOcTSqh5Gg0fxQBsMcBOGde1I+f9s8xPNvfgKh7S+TAik63NgbHudquJtUs71Y5t/Le0d7
	Xa/bRo7BnEWf/ctn4qQ4HtWs7+Sgn8aWY+/ur0W4RbEaWOALPoN7bctVpqIzYAIe63fIZYc+7T7
	Rcl27LWnVdU13PSYZO3ZuZ7yh3+xtAwO8T1lU5eyZnn/QwkuVXwvPppcc5tBwtRQA/UE8buktqP
	k8ahgtpGJTmxNr8XptYhD2K5X4UhxSmTjuuJBOEe5YJfZOAFFaTi0QU45Ec5ReQzn8vBq79r0VI
	v9WOAlD7hgefx8gbE6nsBp0IvHU1BMQdl6xJRgQczyz1S2cjHEHFhACPC6G9tuHDBfTtegE
X-Received: by 2002:a05:6870:d213:b0:485:d1ab:7933 with SMTP id 586e51a60fabf-4a7578ad126mr7356387fac.20.1792450943756;
        Mon, 19 Oct 2026 16:02:23 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b6d7e0csm9327797fac.12.2026.10.19.16.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:02:23 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 4/5] ALSA: usb-audio: Add Audient iD14 MkI write-only controls
Date: Mon, 19 Oct 2026 18:01:58 -0500
Message-ID: <20261019230159.834954-5-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019230159.834954-1-mrwillporter@gmail.com>
References: <20261019230159.834954-1-mrwillporter@gmail.com>
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

Some MkI controls cannot be read back:
- GET stalls for the input gain boost and polarity (feature unit 11),
  the iD key function and the digital input mode.
- GET of the talkback source answers 0, whatever value a SET wrote.

For FU 11 the generic driver creates "Input Gain Control" and "Phase
Inverter Control" and logs "cannot get min/max values".

Add:
- Mic 1/2 Boost Capture Switch (+10 dB)
- Mic 1/2 and Digi 1/2 Polarity Invert Capture Switch
- iD Key Function Playback Enum (ScrollControl, Mono, Mono + Polarity,
  Dim, Talkback)
- Talkback Source Capture Enum (None, Mic 1-2, Digi 1-8)
- Digital In Mode Capture Enum (ADAT, S/PDIF)

and hide the generic FU 11 controls in the MkI map. The named polarity
switches replace the ten values of "Phase Inverter Control". The
controls follow Audient's iD application. It offers gain boost on the
Mic inputs only, and polarity on the Mic and Digi inputs. The device
refuses polarity on Digi 3-8 with EPIPE, in ADAT and in S/PDIF mode
(no ADAT signal connected). So Digi 3-8 have no polarity control.

These controls show the last value the device accepted. Every put sends
its value, also an unchanged one, so that a restore reaches a device
that was reset. At probe the driver sets each control once, so that the
value it shows is true:
- boost and polarity off, iD key ScrollControl, talkback source None:
  the defaults of the iD application and the manual
- S/PDIF: the MkI's measured power-on mode

If that write fails, the control reads "Unknown" (or off) until a put
succeeds. alsactl store saves that value.

The probe write replaces any value the device kept. The device keeps
its values across a module reload or a rebind. On mains power it also
keeps them across a replug. In each of these cases the controls return
to the probe values (for example from ADAT to S/PDIF) until alsactl
restore runs.

Test setup:
- iD14 MkI, firmware 1.1.1
- Bazzite 44, kernel 7.2.9-ogc3.1.fc44
- snd-usb-audio built out of tree from the v7.2.9 sound/usb sources
  and the complete driver (this commit and the later ones)

Results:
- a loopback cable measured the gain boost (+10.0 dB) and the Mic
  polarity
- listening tests: the iD key set to Dim, talkback from Mic 2
- alsactl restored the controls across a replug
- the optical power-on mode, read on macOS 27.0.1 with no Audient
  software running: S/PDIF
- the device accepts the Digi 1/2 polarity request. Its effect was not
  measured.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient_id.c | 144 +++++++++++++++++++++++++++++++----
 sound/usb/mixer_maps.c       |   1 +
 2 files changed, 129 insertions(+), 16 deletions(-)

diff --git a/sound/usb/mixer_audient_id.c b/sound/usb/mixer_audient_id.c
index 5b38590ce..47e16e572 100644
--- a/sound/usb/mixer_audient_id.c
+++ b/sound/usb/mixer_audient_id.c
@@ -19,8 +19,10 @@
  * The protocol comes from Audient's iD application (version 4.4.5 for
  * macOS). USB captures of the application confirmed it.
  *
- * The controls read the device on every get: the front panel changes
- * several of them.
+ * Most controls read the device on every get. Controls whose GET cannot
+ * report the current state show the last value the device accepted.
+ * Every put to these controls sends the value, even when unchanged, so
+ * that alsactl restore also reaches a device that was reset.
  *
  * Get and put need no lock of their own: the control core runs put with
  * card->controls_rwsem held for writing and get with it held for reading.
@@ -40,12 +42,17 @@
 #include "mixer_audient_id.h"
 
 /* Unit IDs */
+#define ID14_IT_DIGITAL		0x01	/* input terminal: optical and coaxial inputs */
 #define ID14_FU_OUT		0x0a	/* feature unit before the outputs */
+#define ID14_FU_IN		0x0b	/* feature unit on the inputs: CN 1-2 Mic, 3-10 Digi */
 #define ID14_ROUTE		0x33	/* routing XU: CN = destination */
 #define ID14_MON		0x36	/* monitor controller XU */
 #define ID14_MIXER		0x3c	/* mixer unit: 14 inputs x 4 outputs */
 
 /* Control selectors */
+#define ID14_IT_OPTICAL_MODE	0x00	/* u32: 0 ADAT, 1 S/PDIF */
+#define ID14_IN_BOOST		0x0b	/* s16: 0x0a00 = +10 dB, 0 = off */
+#define ID14_IN_POLARITY	0x0d
 #define ID14_ROUTE_SOURCE	0x06	/* u8: source of the destination */
 #define ID14_MON_MONO		0x00
 #define ID14_MON_MONO_MODE	0x01
@@ -54,6 +61,8 @@
 #define ID14_MON_DIM		0x05
 #define ID14_MON_DIM_LEVEL	0x06	/* s16, 1/256 dB */
 #define ID14_MON_TALKBACK	0x07
+#define ID14_MON_TALKBACK_SRC	0x08	/* GET always returns 0 */
+#define ID14_MON_ID_KEY		0x10	/* u16: the selector the iD key toggles */
 #define ID14_MON_VOLUME		0x12	/* s16, 1/256 dB; the knob also sets it */
 
 /*
@@ -68,6 +77,7 @@ enum id_kind {
 	ID_BOOL,	/* u8: 1 = on */
 	ID_BOOL_INV,	/* u8: 1 = cut or mute, shown as a switch that is off */
 	ID_VOL,		/* s16 in 1/256 dB; control value 0 ... ID_VOL_MAX, 1 dB steps */
+	ID_BOOST,	/* s16: on = +10 dB */
 	ID_ENUM,	/* item list with device values (struct id_enum) */
 };
 
@@ -78,6 +88,8 @@ struct id_enum {
 	u8 len;		/* bytes on the wire */
 };
 
+#define ID_WO		BIT(0)	/* write-only: GET stalls or does not report writes */
+
 struct id_ctl {
 	const char *name;
 	enum id_kind kind;
@@ -85,12 +97,15 @@ struct id_ctl {
 	u8 cs;
 	u8 cn;		/* first channel number */
 	u8 channels;
+	u8 flags;
+	int init;	/* ID_WO: value written at probe */
 	const struct id_enum *e;
 };
 
 /*
  * The texts have one item more than the values. A put cannot select the last
- * item, "Other": it shows a device value outside the list.
+ * item: a readable control shows it for a device value outside the list
+ * ("Other"), a write-only control while its value is not known ("Unknown").
  */
 #define ID_ENUM_TEXTS(name, texts_, len_, ...)					\
 	static const u32 name##_values[] = { __VA_ARGS__ };			\
@@ -102,11 +117,35 @@ struct id_ctl {
 	ID_ENUM_TEXTS(name, name##_texts, len_, __VA_ARGS__);			\
 	static_assert(ARRAY_SIZE(name##_texts) == ARRAY_SIZE(name##_values) + 1)
 
+/*
+ * iD key function: the value is the monitor-controller selector the key
+ * toggles. ScrollControl (0xffff) toggles nothing: the knob then scrolls
+ * through the HID interface.
+ */
+static const char *const id14_id_key_texts[] = {
+	"ScrollControl", "Mono", "Mono + Polarity", "Dim", "Talkback", "Unknown",
+};
+
+ID_ENUM_DEF(id14_id_key, 2, 0xffff, ID14_MON_MONO, ID14_MON_POLARITY, ID14_MON_DIM,
+	    ID14_MON_TALKBACK);
+
 /* Mono mode: one-speaker sum (Left, Right) or phantom centre. */
 static const char *const id14_mono_mode_texts[] = { "Left", "Centre", "Right", "Other" };
 
 ID_ENUM_DEF(id14_mono_mode, 1, 1, 0, 2);
 
+/* Talkback source: the routing source of the input; none = 0xff. */
+static const char *const id14_talkback_texts[] = {
+	"None", "Mic 1", "Mic 2", "Digi 1", "Digi 2", "Digi 3", "Digi 4", "Digi 5", "Digi 6",
+	"Digi 7", "Digi 8", "Unknown",
+};
+
+ID_ENUM_DEF(id14_talkback, 1, 0xff, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13);
+
+static const char *const id14_optical_texts[] = { "ADAT", "S/PDIF", "Unknown" };
+
+ID_ENUM_DEF(id14_optical, 4, 0, 1);
+
 /*
  * Routing sources for each destination. DAW Thru plays the USB stream
  * directly and bypasses the volume knob: full scale. Main Mix is 0x14/0x15
@@ -122,6 +161,16 @@ ID_ENUM_TEXTS(id14_route_hl, id14_route_texts, 1, 0x18, 0x10, 0x02);
 ID_ENUM_TEXTS(id14_route_hr, id14_route_texts, 1, 0x19, 0x11, 0x03);
 static_assert(ARRAY_SIZE(id14_route_texts) == ARRAY_SIZE(id14_route_ml_values) + 1);
 
+/*
+ * The iD application offers polarity on the Mic and Digi strips, not on
+ * DAW. The MkI accepts it on Digi 1-2 only: CN 5-10 stall in both optical modes
+ * (tested without an ADAT signal).
+ */
+#define ID14_DIGI_POLARITY(n)							\
+	{ .name = "Digi " #n " Polarity Invert Capture Switch", .kind = ID_BOOL,	\
+	  .unit = ID14_FU_IN, .cs = ID14_IN_POLARITY, .cn = 2 + (n), .channels = 1,	\
+	  .flags = ID_WO, .init = 0 }
+
 static const struct id_ctl id14_mk1_ctls[] = {
 	{ .name = "Monitor Speaker Playback Volume", .kind = ID_VOL, .unit = ID14_MON,
 	  .cs = ID14_MON_VOLUME, .channels = 1 },
@@ -152,6 +201,26 @@ static const struct id_ctl id14_mk1_ctls[] = {
 	  .cs = ID14_ROUTE_SOURCE, .cn = 2, .channels = 1, .e = &id14_route_hl },
 	{ .name = "Headphone R Source Playback Enum", .kind = ID_ENUM, .unit = ID14_ROUTE,
 	  .cs = ID14_ROUTE_SOURCE, .cn = 3, .channels = 1, .e = &id14_route_hr },
+	/* Write-only: GET stalls. The probe writes the iD application defaults. */
+	{ .name = "Mic 1 Boost Capture Switch", .kind = ID_BOOST, .unit = ID14_FU_IN,
+	  .cs = ID14_IN_BOOST, .cn = 1, .channels = 1, .flags = ID_WO, .init = 0 },
+	{ .name = "Mic 2 Boost Capture Switch", .kind = ID_BOOST, .unit = ID14_FU_IN,
+	  .cs = ID14_IN_BOOST, .cn = 2, .channels = 1, .flags = ID_WO, .init = 0 },
+	{ .name = "Mic 1 Polarity Invert Capture Switch", .kind = ID_BOOL, .unit = ID14_FU_IN,
+	  .cs = ID14_IN_POLARITY, .cn = 1, .channels = 1, .flags = ID_WO, .init = 0 },
+	{ .name = "Mic 2 Polarity Invert Capture Switch", .kind = ID_BOOL, .unit = ID14_FU_IN,
+	  .cs = ID14_IN_POLARITY, .cn = 2, .channels = 1, .flags = ID_WO, .init = 0 },
+	ID14_DIGI_POLARITY(1), ID14_DIGI_POLARITY(2),
+	{ .name = "iD Key Function Playback Enum", .kind = ID_ENUM, .unit = ID14_MON,
+	  .cs = ID14_MON_ID_KEY, .channels = 1, .flags = ID_WO, .init = 0, .e = &id14_id_key },
+	/* Write-only: GET returns 0 whatever was written. */
+	{ .name = "Talkback Source Capture Enum", .kind = ID_ENUM, .unit = ID14_MON,
+	  .cs = ID14_MON_TALKBACK_SRC, .channels = 1, .flags = ID_WO, .init = 0,
+	  .e = &id14_talkback },
+	/* Write-only: GET stalls. The probe writes the power-on mode, S/PDIF. */
+	{ .name = "Digital In Mode Capture Enum", .kind = ID_ENUM, .unit = ID14_IT_DIGITAL,
+	  .cs = ID14_IT_OPTICAL_MODE, .channels = 1, .flags = ID_WO, .init = 1,
+	  .e = &id14_optical },
 	{ }
 };
 
@@ -159,6 +228,8 @@ static const struct id_ctl id14_mk1_ctls[] = {
 struct id_elem {
 	struct usb_mixer_elem_list list;
 	const struct id_ctl *ctl;
+	long val[2];	/* ID_WO: the last value the device accepted */
+	u8 valid;	/* ID_WO: bit per channel, set when val[] is that value */
 };
 
 /* 0 = -128 dB (mute), 1 dB per step: ID_VOL_MAX = 0 dB. */
@@ -192,6 +263,7 @@ static int id_len(const struct id_ctl *c)
 	case ID_ENUM:
 		return c->e->len;
 	case ID_VOL:
+	case ID_BOOST:
 		return 2;
 	default:
 		return 1;
@@ -203,11 +275,12 @@ static bool id_valid(const struct id_ctl *c, long val)
 	switch (c->kind) {
 	case ID_BOOL:
 	case ID_BOOL_INV:
+	case ID_BOOST:
 		return val == 0 || val == 1;
 	case ID_VOL:
 		return val >= 0 && val <= ID_VOL_MAX;
 	case ID_ENUM:
-		return val >= 0 && val < c->e->items;	/* never "Other" */
+		return val >= 0 && val < c->e->items;	/* never "Other" or "Unknown" */
 	}
 	return false;
 }
@@ -234,6 +307,9 @@ static int id_read(struct usb_mixer_interface *mixer, const struct id_ctl *c,
 	case ID_BOOL_INV:
 		*val = !buf[0];
 		break;
+	case ID_BOOST:
+		*val = raw != 0;
+		break;
 	case ID_VOL:
 		/* the knob moves in whole dB; round anything else to the nearest step */
 		*val = clamp_t(long, DIV_ROUND_CLOSEST(raw, ID_DB(1)) + ID_VOL_MAX,
@@ -262,6 +338,9 @@ static int id_write(struct usb_mixer_interface *mixer, const struct id_ctl *c,
 	case ID_BOOL_INV:
 		buf[0] = !val;
 		break;
+	case ID_BOOST:
+		put_unaligned_le16(val ? ID_DB(10) : 0, buf);
+		break;
 	case ID_VOL:
 		put_unaligned_le16(ID_DB(val - ID_VOL_MAX), buf);
 		break;
@@ -319,9 +398,14 @@ static int id_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *v)
 	int err;
 
 	for (i = 0; i < c->channels; i++) {
-		err = id_read(e->list.mixer, c, i, &val);
-		if (err < 0)
-			return err;
+		if (c->flags & ID_WO) {
+			/* No last value (the probe write failed): "Unknown", or off. */
+			val = e->valid & BIT(i) ? e->val[i] : c->kind == ID_ENUM ? c->e->items : 0;
+		} else {
+			err = id_read(e->list.mixer, c, i, &val);
+			if (err < 0)
+				return err;
+		}
 		id_set_value(c, v, i, val);
 	}
 	return 0;
@@ -346,15 +430,25 @@ static int id_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *v)
 
 	for (i = 0; i < c->channels; i++) {
 		val = id_get_value(c, v, i);
-		err = id_read(mixer, c, i, &cur);
-		if (err < 0)
-			return err;
-		if (cur == val)
-			continue;
-		changed = 1;
+		if (c->flags & ID_WO) {
+			/* Always send: the device may have been reset since the last write. */
+			if (!(e->valid & BIT(i)) || e->val[i] != val)
+				changed = 1;
+		} else {
+			err = id_read(mixer, c, i, &cur);
+			if (err < 0)
+				return err;
+			if (cur == val)
+				continue;
+			changed = 1;
+		}
 		err = id_write(mixer, c, i, val);
 		if (err < 0)
-			return err;
+			return err;	/* a write-only channel keeps its last accepted value */
+		if (c->flags & ID_WO) {
+			e->val[i] = val;
+			e->valid |= BIT(i);
+		}
 	}
 	return changed;
 }
@@ -364,15 +458,19 @@ static int id_add_ctl(struct usb_mixer_interface *mixer, const struct id_ctl *c)
 	struct snd_kcontrol_new knew = {
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = c->name,
-		/* The front panel changes values: user space must not cache them. */
-		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 		.info = id_info,
 		.get = id_get,
 		.put = id_put,
 	};
 	struct snd_kcontrol *kctl;
 	struct id_elem *e;
+	unsigned int i;
+	int err;
 
+	/* The front panel changes readable values: user space must not cache them. */
+	if (!(c->flags & ID_WO))
+		knew.access |= SNDRV_CTL_ELEM_ACCESS_VOLATILE;
 	if (c->kind == ID_VOL) {
 		knew.access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
 		knew.tlv.p = id_vol_tlv;
@@ -385,6 +483,20 @@ static int id_add_ctl(struct usb_mixer_interface *mixer, const struct id_ctl *c)
 	e->list.id = c->unit;
 	e->ctl = c;
 
+	/* A write-only control needs a known value. On failure it reads "Unknown" (or off). */
+	if (c->flags & ID_WO) {
+		for (i = 0; i < c->channels; i++) {
+			err = id_write(mixer, c, i, c->init);
+			if (err < 0) {
+				usb_audio_warn(mixer->chip, "iD14: cannot set '%s' (%d)\n",
+					       c->name, err);
+				continue;
+			}
+			e->val[i] = c->init;
+			e->valid |= BIT(i);
+		}
+	}
+
 	kctl = snd_ctl_new1(&knew, e);
 	if (!kctl) {
 		kfree(e);
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index e147c1a48..63a77f3eb 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -528,6 +528,7 @@ static const struct usbmix_name_map audient_id14_map[] = {
 
 /* Audient iD14 MkI: model-specific control map. */
 static const struct usbmix_name_map audient_id14_mk1_map[] = {
+	{ 11, NULL },			/* FU, see mixer_audient_id.c */
 	{ 12, "Monitor Mix Playback" },	/* FU, partial coverage */
 	{ 60, NULL },			/* MU, see mixer_audient_id.c */
 	{}
-- 
2.47.3

