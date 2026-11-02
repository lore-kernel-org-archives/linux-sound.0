Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663747;
	b=1Qsig1PcDqtMGE/hiESRPfxs5coN1HqGUWc0CVa2FgEZehY7oYM5L3x8LQtZ75+rNXme
	 MwXpdw0FyspX8o4XVlwlfuU3DBjfiVFKBNRisSiaCYeL04nNJ8mlm14Rm+VKIxn+a/r5v
	 iCZQFzdhtmw6Y8vngEUAlNNzgLz40sGpwVsfl1CWeREq3gyPXoBMZGT0rlBR09YZwoC4x
	 mLA/NlCMZ4U/2BckulbDBCLFGXNe/Lki1RDqPMr1haA+ngGcUaEf+obKWjT9aPINmhr8C
	 zzdbxlCDYuWKmCfbX2tbn+SHrRWeblkQBwM+UROtB6FXtOan84y4nZt9qK7veGoyxTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663747;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=F4n++keOagJIBuB8PIFrFl3w5ax9Zf0me7QPKabVUgs=;
	b=1+7DGzRY8pQKVSt/0rIrMdBlaVz37H8iSmiYtaGo2f60MPga8ft1wyXeI6lPJfwEmODY
	 OtK2BkXf1wHru34G/KtxMdUrG2IazWvVY/V553edC0Ag0NZYeRVuCecU1iB/ssYFhVOx2
	 96smQjgdyTG9ZgxYmO19/yVuGKttn4fYVnZklprQ7bjI5R0caBJ915Ym9tJ9hCck2sbPJ
	 JaP2RF34BNuIIy/xpGnannE9m8Iy+dOi1aad7SKBLUMwxVTjcXFdScK2xj6HK2AdsKJjP
	 5Lwrl2WuHcC8Oe0Po/UsapVWnQZS9hcIjl7X0Z4l41Pr+2HcXdL1OJPQK7Rt0iK+9Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C57606A327
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 23:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C57606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6798d4ab549so3321100d50.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 15:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793663746; x=1794268546;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F4n++keOagJIBuB8PIFrFl3w5ax9Zf0me7QPKabVUgs=;
        b=ODNr/U27Fwll5OZj2PqDylHukeuHj7SvJ5fcQXPWUsqNseltvc0rBuoWh4NFcEHBCm
         woe0X1RzZGUFFxbN4Ah07g9PXBJNlROBm6AivJakE0G+G/um3K27fdpUMz8TpFPeXfnn
         C32u/11SeWjPMMWWCKc/KOVe9iCYDbgbau3CZmqJMkEdTW95Bm1oQOZ4hl5k/tkHHvVL
         CeCAW5u2/UHRvdA8BjqBLoI6MuKKxvQcvqbOFTaHcG4e7od8ooc32jf8oYYxvO6eXL06
         taI+LBqmh2hSyEwOp+CxhhkH6QOiSAkh5MUxvEevGnyZL8LvzyVfLKd7eW2/5U0tj+3l
         xtng==
X-Gm-Message-State: APuU4Z9k5tbDiFnZvPy27481KhxUlruWNZD8pAbZZEzB+IgKQC6IP1nf
	KU7MFNDnbxx7O3hU2TBa1p9TSTQtorhrfMxA0aWbuQGBUQIli0BjBQv7
X-Gm-Gg: AYBFou1NTnOuQAHZHQj+5+8dqhsaRj43mgU+hWmKXVmm7Pp4z04vqvt7wd9cllmQE9W
	rXQOD0wqD5+5z2pMAmpvkl+IQ0rqZVcuajYgl0o+ZZumT/GMl757Aov6SSTk8Fom6pTO5JNDpga
	NHYFGmmPAQFdrM+xHIWULq9r/4j42q7RTGFoxF6rXguUKkjhXEpoCN63q8IpaPbUT2kGnY0V5WB
	gF1PTT+BlPy8SH0a46lr0i3YYbe7LSHjK9n42rSFpmhL+qe91+r14+OVDKT0JEJGFUfTC7ywoys
	JIAe6tg3tzYYvzv63D8JbBSk0dG8a2FNTnp8hBqYOHrITWWYZb4FTp1XXktpqBp0CXYJUvk/k5P
	Cd4FhImuakAItpqWnUb9n6sQcNJqs2WjMvMD2pFi0avvID3xddFZOaWUdCIeYA5NWahQfDzGydi
	LOMbBUwIfihWy3QFEv5xcLqFPsQNfCauaX+kQ0GEQL6uDcWjfsaWddN4Ng8ayWCejTY/3jLYH3H
	aJiRAscPVz6O9SZ9wcYGftFJloWa8H0MCP/891ZLxnH2eF0No+um5oi4b7fcxKyfRqp98lJtN/W
	Wwkcjd79CbbHLdiMz2ad5/N7ylJwMiODqb03S+R2p9kUDqOxWqSKuafSW9cZxhtNom/fzRBuLd8
	2Ki8gPcumVSJN/D0fTarvdlAg04LxKQgvSrOIWtZkjCzX5LEN4OP6AQMWF7F3tCq8dxqQgHfkiq
	3hcwvgy+YjO9K0qkqEETcGUub/
X-Received: by 2002:a05:690e:4085:b0:67a:86a1:69a5 with SMTP id 956f58d0204a3-67ba510e5e9mr8454213d50.97.1793663745568;
        Mon, 02 Nov 2026 15:55:45 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf3303ebsm6006920d50.18.2026.11.02.15.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:55:45 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 02 Nov 2026 18:55:23 -0500
Subject: [PATCH] ALSA: hda/generic: Add indep_dig_outs hint
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-indep-dig-outs-v1-1-b468f76bdd2e@telaak.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMTQ5AMBBA4avIrE2i9Ze4ili0OhiLkg4iEXdXL
 L/FexcIBSaBJrkg0MHCi49QaQL9ZPxIyC4adKYrpTKN7B2t6HjEZd8EjXVWlfWQF7qEGK2BBj6
 /Ydv9lt3O1G/vBe77AQCRXo9yAAAA
X-Change-ID: 20261102-indep-dig-outs-abdb157f3425
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

The generic parser gives a codec one digital playback PCM. Any further
digital output pin is set up as a follower of the first: it gets the
same stream tag, so every digital jack plays the same stream. That is
the right default for a codec with, say, a coax and an optical jack.

Some boards wire two digital converters to different places instead.
On the Control4 HC-800, an ALC888 has converter 0x10 driving pin 0x11,
which feeds an HDMI transmitter, and converter 0x06 driving pin 0x1e,
the S/PDIF coax jack. These are two outputs that should play different
streams at the same time. The follower setup cannot express that, and
userspace cannot split one stream tag in two.

Add an "indep_dig_outs" hint. Like indep_hp does for the headphone DAC,
it gives the second digital output pin its own stream: its own
hda_multi_out and its own PCM, "Alt Digital", typed from its pin and
with its own IEC958 controls. The digital playback ops pick the
multiout by the stream's NID. The analog "IEC958 Default PCM"
duplication stays on the first digital output only. Unlike indep_hp,
the split is fixed at parse time; there is no mixer switch. A codec
driver can also set spec->indep_dig_outs itself. Without the hint or
the flag nothing changes.

The new PCM takes the next free device number of its type. With an
HDMI-typed first output and an S/PDIF-typed second one, as on the
HC-800, the HDMI output stays the "Digital" PCM (device 3) and the
coax output becomes "Alt Digital" (device 1), with its IEC958 controls
at index 16.

Assisted-by: LLM
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
Tested on a Control4 HC-800 (Atom D525, ALC888-VD) with this patch on 7.1.8,
with [hint] indep_dig_outs = yes in an hda patch file: HDMI and coax run at
the same time on separate stream tags, also at different rates (48 kHz and
44.1 kHz) and alongside the analog output. Each IEC958 switch affects only
its own converter, and closing or reopening one output leaves the other
running. The HDMI transmitter fed from pin 0x11 (an ADV7513) decodes the
sample rate of the Digital PCM in every combination, and never the Alt
Digital one. With the coax output connected to an external S/PDIF receiver,
the coax carries the Alt Digital PCM bit-exact and never the Digital one, at
equal and at different rates. Built on sound.git for-next with W=1, with no
new warnings.

The HC-800 turns this on with a patch file, and the patch adds no quirk for
it. It is meant as a generic option for any board whose digital outputs go
to different places.
---
 Documentation/sound/hd-audio/notes.rst |  5 +++
 sound/hda/codecs/generic.c             | 63 +++++++++++++++++++++++++++++-----
 sound/hda/codecs/generic.h             |  7 +++-
 3 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/Documentation/sound/hd-audio/notes.rst b/Documentation/sound/hd-audio/notes.rst
index c16f83875..c618bb2d7 100644
--- a/Documentation/sound/hd-audio/notes.rst
+++ b/Documentation/sound/hd-audio/notes.rst
@@ -486,6 +486,11 @@ inv_dmic_split (bool)
 indep_hp (bool)
     provide the independent headphone PCM stream and the corresponding
     mixer control, if available
+indep_dig_outs (bool)
+    give the second digital output pin (in parsing order) its own PCM
+    stream, "Alt Digital", instead of making it follow the first one's
+    stream. The PCM takes the next free device number of its type, so
+    two S/PDIF outputs need dynamic minors. Default false
 add_stereo_mix_input (bool)
     add the stereo mix (analog-loopback mix) to the input mux if
     available
diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index ca780b7f6..12e40c382 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -168,6 +168,9 @@ static void parse_user_hints(struct hda_codec *codec)
 	val = snd_hda_get_bool_hint(codec, "indep_hp");
 	if (val >= 0)
 		spec->indep_hp = !!val;
+	val = snd_hda_get_bool_hint(codec, "indep_dig_outs");
+	if (val >= 0)
+		spec->indep_dig_outs = !!val;
 	val = snd_hda_get_bool_hint(codec, "add_stereo_mix_input");
 	if (val >= 0)
 		spec->add_stereo_mix_input = !!val;
@@ -4000,7 +4003,9 @@ static void parse_digital(struct hda_codec *codec)
 	int i, nums;
 	hda_nid_t dig_nid, pin;
 
-	/* support multiple SPDIFs; the secondary is set up as a follower */
+	/* support multiple SPDIFs; the secondary is set up as a follower,
+	 * or as an independent PCM with the indep_dig_outs hint
+	 */
 	nums = 0;
 	for (i = 0; i < spec->autocfg.dig_outs; i++) {
 		pin = spec->autocfg.dig_out_pins[i];
@@ -4018,6 +4023,10 @@ static void parse_digital(struct hda_codec *codec)
 		if (!nums) {
 			spec->multiout.dig_out_nid = dig_nid;
 			spec->dig_out_type = spec->autocfg.dig_out_type[0];
+		} else if (spec->indep_dig_outs) {
+			/* autocfg gives at most two digital outs */
+			spec->alt_dig_multiout.dig_out_nid = dig_nid;
+			spec->alt_dig_out_type = spec->autocfg.dig_out_type[i];
 		} else {
 			spec->multiout.follower_dig_outs = spec->follower_dig_outs;
 			if (nums >= ARRAY_SIZE(spec->follower_dig_outs) - 1)
@@ -5228,6 +5237,14 @@ int snd_hda_gen_build_controls(struct hda_codec *codec)
 			spec->multiout.share_spdif = 1;
 		}
 	}
+	if (spec->alt_dig_multiout.dig_out_nid) {
+		err = snd_hda_create_dig_out_ctls(codec,
+						  spec->alt_dig_multiout.dig_out_nid,
+						  spec->alt_dig_multiout.dig_out_nid,
+						  spec->pcm_rec[3]->pcm_type);
+		if (err < 0)
+			return err;
+	}
 	if (spec->dig_in_nid) {
 		err = snd_hda_create_spdif_in_ctls(codec, spec->dig_in_nid);
 		if (err < 0)
@@ -5450,12 +5467,24 @@ static int alt_playback_pcm_cleanup(struct hda_pcm_stream *hinfo,
 /*
  * Digital out
  */
+
+/* the independent second digital out has its own multiout */
+static struct hda_multi_out *dig_multiout(struct hda_codec *codec,
+					  struct hda_pcm_stream *hinfo)
+{
+	struct hda_gen_spec *spec = codec->spec;
+
+	if (spec->alt_dig_multiout.dig_out_nid &&
+	    hinfo->nid == spec->alt_dig_multiout.dig_out_nid)
+		return &spec->alt_dig_multiout;
+	return &spec->multiout;
+}
+
 static int dig_playback_pcm_open(struct hda_pcm_stream *hinfo,
 				 struct hda_codec *codec,
 				 struct snd_pcm_substream *substream)
 {
-	struct hda_gen_spec *spec = codec->spec;
-	return snd_hda_multi_out_dig_open(codec, &spec->multiout);
+	return snd_hda_multi_out_dig_open(codec, dig_multiout(codec, hinfo));
 }
 
 static int dig_playback_pcm_prepare(struct hda_pcm_stream *hinfo,
@@ -5464,8 +5493,7 @@ static int dig_playback_pcm_prepare(struct hda_pcm_stream *hinfo,
 				    unsigned int format,
 				    struct snd_pcm_substream *substream)
 {
-	struct hda_gen_spec *spec = codec->spec;
-	return snd_hda_multi_out_dig_prepare(codec, &spec->multiout,
+	return snd_hda_multi_out_dig_prepare(codec, dig_multiout(codec, hinfo),
 					     stream_tag, format, substream);
 }
 
@@ -5473,16 +5501,14 @@ static int dig_playback_pcm_cleanup(struct hda_pcm_stream *hinfo,
 				    struct hda_codec *codec,
 				    struct snd_pcm_substream *substream)
 {
-	struct hda_gen_spec *spec = codec->spec;
-	return snd_hda_multi_out_dig_cleanup(codec, &spec->multiout);
+	return snd_hda_multi_out_dig_cleanup(codec, dig_multiout(codec, hinfo));
 }
 
 static int dig_playback_pcm_close(struct hda_pcm_stream *hinfo,
 				  struct hda_codec *codec,
 				  struct snd_pcm_substream *substream)
 {
-	struct hda_gen_spec *spec = codec->spec;
-	return snd_hda_multi_out_dig_close(codec, &spec->multiout);
+	return snd_hda_multi_out_dig_close(codec, dig_multiout(codec, hinfo));
 }
 
 /*
@@ -5775,6 +5801,25 @@ int snd_hda_gen_build_pcms(struct hda_codec *codec)
 					 spec->dig_in_nid);
 	}
 
+	/* independent second digital out, stream index #3 */
+	if (spec->alt_dig_multiout.dig_out_nid) {
+		fill_pcm_stream_name(spec->stream_name_alt_digital,
+				     sizeof(spec->stream_name_alt_digital),
+				     " Alt Digital", codec->core.chip_name);
+		info = snd_hda_codec_pcm_new(codec, "%s",
+					     spec->stream_name_alt_digital);
+		if (!info)
+			return -ENOMEM;
+		spec->pcm_rec[3] = info;
+		if (spec->alt_dig_out_type)
+			info->pcm_type = spec->alt_dig_out_type;
+		else
+			info->pcm_type = HDA_PCM_TYPE_SPDIF;
+		setup_pcm_stream(&info->stream[SNDRV_PCM_STREAM_PLAYBACK],
+				 &pcm_digital_playback, NULL,
+				 spec->alt_dig_multiout.dig_out_nid);
+	}
+
 	if (spec->no_analog)
 		return 0;
 
diff --git a/sound/hda/codecs/generic.h b/sound/hda/codecs/generic.h
index 524591821..e6971ff66 100644
--- a/sound/hda/codecs/generic.h
+++ b/sound/hda/codecs/generic.h
@@ -93,6 +93,7 @@ struct hda_gen_spec {
 	const struct hda_pcm_stream *stream_analog_capture;
 
 	char stream_name_alt_analog[32]; /* alternative analog PCM stream */
+	char stream_name_alt_digital[32]; /* independent 2nd digital PCM */
 	const struct hda_pcm_stream *stream_analog_alt_playback;
 	const struct hda_pcm_stream *stream_analog_alt_capture;
 
@@ -112,6 +113,9 @@ struct hda_gen_spec {
 	hda_nid_t alt_dac_nid;
 	hda_nid_t follower_dig_outs[3];	/* optional - for auto-parsing */
 	int dig_out_type;
+	/* the 2nd digital out with the indep_dig_outs hint */
+	struct hda_multi_out alt_dig_multiout;
+	int alt_dig_out_type;
 
 	/* capture */
 	unsigned int num_adc_nids;
@@ -148,7 +152,7 @@ struct hda_gen_spec {
 	int const_channel_count;	/* channel count for all */
 
 	/* PCM information */
-	struct hda_pcm *pcm_rec[3];	/* used in build_pcms() */
+	struct hda_pcm *pcm_rec[4];	/* used in build_pcms() */
 
 	/* dynamic controls, init_verbs and input_mux */
 	struct auto_pin_cfg autocfg;
@@ -226,6 +230,7 @@ struct hda_gen_spec {
 	unsigned int vmaster_mute_led:1; /* add SPK-LED flag to vmaster mute switch */
 	unsigned int mic_mute_led:1; /* add MIC-LED flag to capture mute switch */
 	unsigned int indep_hp:1; /* independent HP supported */
+	unsigned int indep_dig_outs:1; /* 2nd digital out has its own PCM */
 	unsigned int prefer_hp_amp:1; /* enable HP amp for speaker if any */
 	unsigned int add_stereo_mix_input:2; /* add aamix as a capture src */
 	unsigned int add_jack_modes:1; /* add i/o jack mode enum ctls */

---
base-commit: 3f2882212c558336d0bf3b1c03b8e1a6b348a6e0
change-id: 20261102-indep-dig-outs-abdb157f3425

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>

