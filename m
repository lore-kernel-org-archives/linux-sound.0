Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.253.219.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938871;
	b=R+ehV9dAqaeSXNRKmV3ZR1p2COr0FNRn6aOe+pLY6VvN6YvwiHpGsoixYvGLuVjqo9Vs
	 6sdIIV1iSogfwmGJdYb+zwei0oa2S6Dy4cc401QFg/VXDo/Kgi2QKg5chJyLPuyhFfjJB
	 Sd4IsgmQNqaQeoUhCfkuCTJuhGWOVK2W0A7S+gVphzFH/K9rsQH2prrJYdUrcGtepc9Wf
	 HflKrzAaVKGTkrfPS6l+ImPiGFWuwJA5/Kc++dhbZOx11OtUidiDmfcZYDq1OMP5AQlpY
	 pSc9R4ydOKkbLVYDtuvfJXUmTvL0ESwIIlXo+JpeTHnoR0iZmwY8yftDHVgcM2fud8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938871;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P67O7I4GaI1afbscu2UsR9JZzFPq1gLV76B3M0E0a50=;
	b=Vu/RsbV0GA02uftCBG7hndF407tPbpT5up6UPbNrT5XN5v1Ca8O8vshU/pD/7t7FHjat
	 xFQDm10cme9xS1q4cYu9tbtmnoOgbjHIOTtC+I4Fm3Sc2ZiKaMWODtjEuB69GqTiCBiK8
	 qUun25LjnQUH3sxL71USKckDtxk97DiZcsVsjGvQQFDSOpkLDoQkPcU8P5emKbbrQwxYD
	 BDUfuIQnHIWdlR8NRwVjhiMUTFEUYWDsqMn6Au856DmLRHnbiQGOCi4dsXTALUPpZdA32
	 LwhaNfNhPeKZkKAdMOI9w6eVWn/oxjtBOlfzf4/WT6dCNPkFXXdGdkdHwQGMuk6c27Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pavel.bz;
	spf=pass smtp.mailfrom=pavel.bz;
	dkim=pass header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=RKn6G6gi;
	arc=none smtp.remote-ip=89.253.219.113
Received: from mail.pavel.bz (mail.pavel.bz [89.253.219.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3141E606A337;
	Tue, 17 Nov 2026 18:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3141E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pavel.bz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pavel.bz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=RKn6G6gi
Received: from p-745-g5.pavel.bz (unknown [182.52.139.49])
	by mail.pavel.bz (Postfix) with ESMTPSA id 3DC0A616EA;
	Tue, 17 Nov 2026 18:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.pavel.bz 3DC0A616EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pavel.bz; s=primary;
	t=1794938863; bh=P67O7I4GaI1afbscu2UsR9JZzFPq1gLV76B3M0E0a50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RKn6G6gi6ZJMbeGlIAghz/FlYqT9bmaUqBcNdg+nolEnGyXj6uIxN8GZN5zsFxa72
	 lu5tQO8PY+mjAuytIRD1OkWRLRr55eMH8FmrOvxYK+d0wERStg2+S6AXCfo8VPFNOp
	 4yWR5Zr3n6eJlz6YIRxGKELuMHs7zJerHLGmkt2wXYC2/o9JCuyMHWsf+hh8+fdw8p
	 3bBztRBMrJRAkeyFUZEsTcfCLxJkVI+JbHMkoO/p/LgUMMrG0RgO2dzUKBlr1N1XVA
	 qmvAFPVx/039qu9mIFcsBIRDCe95T+s0yu73+QE/XfEraoktHFiJkTUAlrmkpDfJv2
	 uOsuEoVuHDwnw==
From: Pavel Artemev <a@pavel.bz>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: usb-audio: add MIXER_STATE_REPUSH quirk flag
Date: Wed, 18 Nov 2026 01:07:28 +0700
Message-ID: <20261117180728.117915-3-a@pavel.bz>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117180728.117915-1-a@pavel.bz>
References: <20261117180728.117915-1-a@pavel.bz>
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

Some USB audio devices silently drop Feature Unit control writes in
the first seconds after USB enumeration, and occasionally drop
individual writes at any later time as well.  When GET_CUR on such a
device is broken there is no way to detect the divergence by reading
back, so the state the host believes in silently drifts from the
hardware state: a channel left at a stale value is never corrected.

The Windows driver of one such chipset (Weltrend/XiiSound, 040b:0897)
handles this by never reading back at all.  USBPcap captures of it
show a single source of truth for the whole channel picture, every
channel of a control written in one short burst - master first, then
the channels - and the complete state re-pushed at every device open.
That every-open re-push is the load-bearing mechanism: it repairs
whatever writes were swallowed around enumeration.

Add QUIRK_FLAG_MIXER_STATE_REPUSH, which replicates that write
discipline in the driver:

  * volume and mute puts only record values; the cache is defined as
    "what user space last asked for" and is never read back from the
    device, and never invalidated by device status notifications;

  * a single deferred flush (30 ms quiescence) writes each touched
    feature unit in one burst, master first, derived as the loudest
    channel - never asserted from its own possibly stale cache.  The
    last writer owns the master: an explicit master put stops
    derivation for that unit until user space requests a volume
    channel write of it again, unchanged values included (alsactl
    restores channels before the master, so ownership must not
    survive the audio server's first no-op channel write), and an
    unflushed explicit value is dropped with the ownership together
    with its cache entry, so it can neither be flushed over newer
    channel writes nor poison the raw-max re-assert skip.  A master
    put arriving while the transfer dropped the cache entry is
    recorded unconditionally instead of read back: on broken-GET
    master controls that read would fail until the next derive
    re-caches;

  * a PCM stream open and a resume re-push all cached volume values
    through the same timer - the every-open repair the Windows stack
    relies on.  A resume re-push also re-asserts cached mute
    switches, taking over the job restore_mixer_value() usually does
    at resume: restore runs without the mixer lock, so writing the
    deferred controls there could clobber values a concurrent
    deferred put just recorded, and would re-send a derived master
    from a cache that lags its channels.

The flush runs under the mixer lock, like the write path of the put
callback it replaces, so a put can never interleave with a burst.
Re-push requests are lock-free atomic bits, because neither PM
callback may block on that lock: a control write inside a flush can
trigger the runtime resume whose callback then runs on the very
thread holding it.  Suspend marks the mixer and cancels the flush
timer without waiting - a flush in flight may be blocked in
runtime-PM resume, waiting for the suspend callback to finish, so
waiting for it there would deadlock the PM worker against the flush
worker - and a flush already running stops at the next unit, with
writes that failed mid-suspend kept pending for retry.  Resume
requests a re-push and arms the worker without taking the lock; the
worker re-checks the request bits after every run, so a request
raised while it runs is never lost, and the disarm ordering against
disconnect (disconnected flag under the mixer lock before the
synchronizing cancel, and checked under the same lock by the
deferred put callback before it arms the timer, because free()
cancels the work before the controls are unregistered) keeps the
teardown race-free.

Only controls written through mixer_ctl_feature_put() with a volume
or mute selector are deferred.  Mixer unit controls share that put
callback but store an input channel number in the selector field and
are excluded (num_outputs is only ever set for mixer units); other
feature unit controls (AGC, tone) keep the direct write path, as do
the caches of non-deferred controls on notification; and read-only
channels are neither written nor cached, matching the direct write
path.  The master is re-asserted on every flush and re-push,
including unchanged values, except when it sits at the control's raw
maximum: that re-send would only trigger the in-headset limit
notification (nothing moved), while power-up leaves the master at
raw max anyway, so the skip is quiet and correct at once.  An
  ownership transfer empties the master cache, so the next re-push
  re-derives and writes the master even at the raw maximum - never
  as a lone write: it shares the burst with the channel re-pushes.
  A
sporadically dropped master write below raw max is therefore healed
by the next re-push; at raw max it self-evidences as a missing
arrival notification and heals at the next gesture.  The vendor
driver has no readback either.

Mute switches are only written when user space changed them, or at a
resume re-push: a lost re-assert can at worst fail to mute (power-up
is unmuted), and mute writes during playback audibly chop the stream
on these devices.  Volume writes are delayed by the quiescence
window, which is not perceptible for a volume control.

The flag is enabled for 040b:0897, whose loss window was measured on
the wire at 6.5-9 s after enumeration with a ragged tail (beep-ACKed
limit-write probes at increasing delays).

Testing: ran on the device as a locally built DKMS module (7.2 tree,
daily use over 10 days) and wire-verified: 21 volume gestures produced
21 bursts of exactly one write per channel in the master-first order,
no readbacks, no re-sends; endpoint limit notifications fire only on
user arrivals at a limit; no stream chops during playback; replug,
suspend/resume, balance and mute pass end to end.  The same mechanism
also ran on the device as a DKMS module against 7.3.4, wire-verified:
volume gestures each produced exactly one burst of one write per
channel in the master-first order, with no readbacks and no writes to
the capture unit.  The changes over the v3 revision were also
wire-verified against 7.3.4: a deferred put issued while the device
is runtime-suspended produces no bus traffic and its value is
delivered by the resume re-push, which re-asserts the cached volume
and mute controls; a stream-open re-push re-sends volumes only; an
explicit master put is followed again by derivation once user space
writes a volume channel of the unit; and the derived master equal to
the cached value is not re-sent in that tree (no endpoint
notification without a user arrival).  The changes over the v4
revision are also wire-verified against 7.3.4: an explicit master put
superseded by a channel put in the same flush window produces one
derived burst, and the superseded explicit value never reaches the
wire; a stream-open re-push at a non-limit volume re-asserts the
derived master (present on the wire, where v4 skipped it); parked at
the raw maximum the re-push keeps the master absent; the runtime-PM
paths (zero bus traffic for a put on a suspended device, resume
re-push delivering the pending gesture, mutes and mic) behave as in
v4.  The changes over the v5 revision are wire-verified against 7.3.4:
master ownership transfers on any volume-channel write request,
unchanged values included (a no-op write after an explicit master put
makes the next re-push derive the master instead of re-asserting the
explicit value), an unflushed explicit master superseded by a channel
put is dropped with its cache entry, so a supersession at the raw
maximum still produces the full derived burst including the master,
and a master put arriving while the transfer dropped the cache entry
is recorded without reading the device back; the baseline gesture
discipline, the raw-maximum re-assert skip and the runtime-PM paths
behave as in v5.

Closes: https://github.com/alsa-project/alsa-ucm-conf/issues/760
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221401
Link: https://lore.kernel.org/linux-sound/20261117143314.41853-3-a@pavel.bz
Assisted-by: LLM
Signed-off-by: Pavel Artemev <a@pavel.bz>
---
 Documentation/sound/alsa-configuration.rst |   6 +
 sound/usb/mixer.c                          | 570 ++++++++++++++++++++-
 sound/usb/mixer.h                          |  19 +
 sound/usb/pcm.c                            |   4 +
 sound/usb/quirks.c                         |   2 +
 sound/usb/usbaudio.h                       |  19 +
 6 files changed, 605 insertions(+), 15 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index ea7f5aa31..4b4cdadf2 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2417,6 +2417,12 @@ quirk_flags
           Initialize the volume control channels to the maximum value instead
           of the minimum at mixer creation.  For devices that silence their
           audio path while a volume channel sits at the minimum value.
+        * bit 35: ``mixer_state_repush``
+          Defer volume and mute writes into one burst per feature unit, and
+          re-push the cached volume values at every PCM stream open and
+          after resume (a resume additionally re-asserts cached mute
+          switches).  For devices that silently drop control writes
+          around enumeration and whose controls cannot be read back.
 
 This module supports multiple devices, autoprobe and hotplugging.
 
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index ad96371ad..b0e799149 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -37,6 +37,7 @@
 #include <linux/usb/audio.h>
 #include <linux/usb/audio-v2.h>
 #include <linux/usb/audio-v3.h>
+#include <linux/workqueue.h>
 
 #include <sound/core.h>
 #include <sound/control.h>
@@ -584,13 +585,22 @@ static int set_cur_ctl_value(struct usb_mixer_elem_info *cval,
 	return snd_usb_mixer_set_ctl_value(cval, UAC_SET_CUR, validx, value);
 }
 
+/* read-only indication of one channel of a control (channel 0 = master);
+ * read-only channels are not written and not cached
+ */
+static unsigned int mixer_ch_readonly(const struct usb_mixer_elem_info *cval,
+				      int channel)
+{
+	if (channel == 0)
+		return cval->master_readonly;
+	return cval->ch_readonly & BIT(channel - 1);
+}
+
 int snd_usb_set_cur_mix_value(struct usb_mixer_elem_info *cval, int channel,
 			     int index, int value)
 {
 	int err;
-	unsigned int read_only = (channel == 0) ?
-		cval->master_readonly :
-		cval->ch_readonly & BIT(channel - 1);
+	unsigned int read_only = mixer_ch_readonly(cval, channel);
 
 	if (read_only) {
 		usb_audio_dbg(cval->head.mixer->chip,
@@ -1608,18 +1618,369 @@ static int mixer_ctl_feature_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+/*
+ * Atomic mixer write bursts (QUIRK_FLAG_MIXER_STATE_REPUSH).
+ *
+ * Some devices silently drop mixer writes issued in the first seconds
+ * after USB enumeration, and can drop individual writes at any later
+ * time as well; GET_CUR is broken on them, so the divergence cannot
+ * be detected by reading back.  The vendor's Windows driver never
+ * reads either: it collects the whole channel picture at a single
+ * source of truth and writes every channel of a control in one short
+ * burst (master first), re-pushing the complete state at every device
+ * open.
+ *
+ * User space applies one logical volume change as multiple fragmented
+ * control writes (one per channel, the first carrying stale siblings),
+ * so the stock write-per-put path cannot produce that burst.  Puts
+ * therefore only record values - the cache is defined as "what user
+ * space last asked for" and is never read back from the device - and
+ * a single flush timer coalesces the fragments.  When it fires, each
+ * touched feature unit is written in the Windows order: the master,
+ * derived as the loudest channel, first, then the changed channels,
+ * one write each.  A stream open requests a full-state re-push
+ * (healing writes lost in the post-enumeration window), merged into
+ * the same timer so a burst never observes a half-applied gesture
+ * (user space opens streams mid-gesture for UI feedback sounds).
+ *
+ * The flush runs under the mixer lock, like the write path of the put
+ * callback it replaces: snd_usb_set_cur_mix_value() completes its USB
+ * transfer before updating the cache, so an unlocked flush could
+ * clobber values recorded concurrently by a put.  The PM callbacks
+ * must not block on that lock, though: a control write inside a flush
+ * can trigger the runtime resume whose callback then runs on the very
+ * thread holding it.  Re-push requests are therefore lock-free atomic
+ * bits; whoever cannot take the lock (the resume callback) only sets
+ * them and arms the worker, and the worker re-checks the bits after
+ * every run so no request is lost.
+ */
+
+/* quiescence window for the flush; user space applies a stereo change
+ * as two control writes 5..20 ms apart
+ */
+#define MIXER_FLUSH_DELAY	msecs_to_jiffies(30)
+
+/* mixer->flush_flags bits */
+#define MIXER_FLUSH_FULL	0	/* re-push all cached volume values */
+#define MIXER_FLUSH_RESUME	1	/* resume: also re-assert cached mutes */
+#define MIXER_FLUSH_SUSPENDED	2	/* suspend in flight: stop writing */
+
+/* flush levels latched from the flags by the worker */
+enum {
+	FLUSH_TOUCHED,		/* only channels user space changed */
+	FLUSH_FULL_STATE,	/* plus every cached volume value */
+	FLUSH_RESUME_STATE,	/* plus every cached mute switch */
+};
+
+static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol);
+
+static bool is_feature_volume_mute_ctl(struct usb_mixer_elem_info *cval)
+{
+	if (!cval->head.kctl || !cval->head.kctl->put)
+		return false;
+	/* the info callback is shared with processing unit controls, whose
+	 * put writes through a different path and does not manage the
+	 * shared cache; the put callback is unique to feature unit and
+	 * mixer unit controls, which the cache does cover
+	 */
+	if (cval->head.kctl->put != mixer_ctl_feature_put)
+		return false;
+	/* mixer unit controls share that put callback but store the
+	 * 1-based input channel in cval->control, not a UAC_FU_* selector;
+	 * num_outputs is only ever set for mixer units, so it tells the
+	 * two apart
+	 */
+	if (cval->num_outputs)
+		return false;
+	return cval->control == UAC_FU_VOLUME || cval->control == UAC_FU_MUTE;
+}
+
+/* Re-send every cached channel of one control, unchanged values
+ * included
+ */
+static void repush_ctl_cached(struct usb_mixer_elem_info *cval)
+{
+	int c, err, idx = 0;
+
+	if (cval->cmask) {
+		for (c = 0; c < MAX_CHANNELS; c++) {
+			if (!(cval->cmask & BIT_ULL(c)))
+				continue;
+			if (test_bit(c + 1, cval->cached)) {
+				err = snd_usb_set_cur_mix_value(cval, c + 1,
+								idx, cval->cache_val[idx]);
+				if (err < 0)
+					usb_audio_dbg(cval->head.mixer->chip,
+						      "repush ctl %d ch %d failed (%d)\n",
+						      cval->control, c + 1, err);
+			}
+			idx++;
+		}
+	} else {
+		/* master channel */
+		if (test_bit(0, cval->cached)) {
+			err = snd_usb_set_cur_mix_value(cval, 0, 0,
+							*cval->cache_val);
+			if (err < 0)
+				usb_audio_dbg(cval->head.mixer->chip,
+					      "repush ctl %d ch 0 failed (%d)\n",
+					      cval->control, err);
+		}
+	}
+}
+
+/* Write one control's pending (changed-since-last-flush) channels.
+ * Pending bits are only set together with cache_val by a put, so the
+ * value is written unconditionally; the cache bit may have been
+ * cleared under us, and snd_usb_set_cur_mix_value() sets it again.
+ */
+static void flush_ctl_pending(struct usb_mixer_elem_info *cval)
+{
+	int c, err, idx = 0;
+
+	for (c = 0; c < MAX_CHANNELS; c++) {
+		if (!(cval->cmask & BIT_ULL(c)))
+			continue;
+		if (test_bit(c + 1, cval->pending)) {
+			clear_bit(c + 1, cval->pending);
+			err = snd_usb_set_cur_mix_value(cval, c + 1,
+							idx, cval->cache_val[idx]);
+			if (err < 0) {
+				/* keep the channel pending so the next
+				 * flush (stream open, resume) retries it
+				 */
+				set_bit(c + 1, cval->pending);
+				usb_audio_dbg(cval->head.mixer->chip,
+					      "flush ctl %d ch %d failed (%d)\n",
+					      cval->control, c + 1, err);
+			}
+		}
+		idx++;
+	}
+	if (!cval->cmask && test_bit(0, cval->pending)) {
+		/* master channel */
+		clear_bit(0, cval->pending);
+		err = snd_usb_set_cur_mix_value(cval, 0, 0,
+						*cval->cache_val);
+		if (err < 0) {
+			set_bit(0, cval->pending);
+			usb_audio_dbg(cval->head.mixer->chip,
+				      "flush ctl %d ch 0 failed (%d)\n",
+				      cval->control, err);
+		}
+	}
+}
+
+/*
+ * One atomic write burst per touched feature unit, Windows-style.
+ * level FLUSH_FULL_STATE re-pushes every cached volume value (the
+ * stream-open heal); FLUSH_RESUME_STATE additionally re-asserts
+ * cached mute switches (restore_mixer_value() leaves them to the
+ * flush under this quirk, and nothing is playing yet at resume, so
+ * the write cannot chop a stream).  Otherwise only the channels user
+ * space changed since the last flush are written.  The master is
+ * written first and derived as the loudest cached channel - never
+ * asserted from its own (possibly stale) cache.  An explicit master
+ * put owns the master until user space requests a volume channel
+ * write of the unit again, unchanged values included.
+ * The master is re-asserted whenever the derived value differs from
+ * the cached one, and unchanged as well unless it sits at the
+ * control's raw maximum: re-sending an unchanged raw-max value makes
+ * these devices emit their in-headset limit notification with no
+ * user action nearby, while power-up leaves the master at raw max
+ * anyway, so the skip is quiet and correct at the same time.  A
+ * sporadically dropped master write is thus healed by the next
+ * re-push unless the value is raw max, where it self-evidences as a
+ * missing arrival notification and heals at the next gesture.
+ * Mute switches are only written when user space changed them (or at
+ * resume re-push): a lost re-assert can only fail to mute (power-up
+ * is unmuted), and mute writes during playback audibly chop the
+ * stream on these devices.
+ *
+ * Called with mixer->lock held.
+ */
+static void snd_usb_mixer_flush_pending(struct usb_mixer_interface *mixer,
+					int level)
+{
+	struct usb_mixer_elem_list *list;
+	struct usb_mixer_elem_info *cval, *master;
+	int id, c, idx, max_val;
+	bool have_ch, touched, master_pending;
+
+	lockdep_assert_held(&mixer->lock);
+
+	if (mixer->disconnected)
+		return;
+
+	for (id = 0; id < MAX_ID_ELEMS; id++) {
+		if (test_bit(MIXER_FLUSH_SUSPENDED, &mixer->flush_flags)) {
+			/* A suspend landed mid-run: stop writing (the
+			 * writes would race the port suspend, and a
+			 * failed one only stays pending anyway) and
+			 * request the strongest re-push, which the
+			 * resume path delivers.
+			 */
+			set_bit(MIXER_FLUSH_RESUME, &mixer->flush_flags);
+			return;
+		}
+		master = NULL;
+		max_val = 0;
+		have_ch = false;
+		touched = false;
+		master_pending = false;
+		for_each_mixer_elem(list, mixer, id) {
+			cval = mixer_elem_list_to_info(list);
+			if (!is_feature_volume_mute_ctl(cval) ||
+			    cval->control != UAC_FU_VOLUME)
+				continue;
+			if (!cval->cmask) {
+				if (!master) {
+					master = cval;
+					master_pending =
+						test_bit(0, cval->pending);
+				}
+				continue;
+			}
+			if (!bitmap_empty(cval->pending, MAX_CHANNELS + 1))
+				touched = true;
+			idx = 0;
+			for (c = 0; c < MAX_CHANNELS; c++) {
+				if (!(cval->cmask & BIT_ULL(c)))
+					continue;
+				if (test_bit(c + 1, cval->cached)) {
+					/* seed from the first cached value:
+					 * raw volume ranges can be signed
+					 * and all-negative
+					 */
+					if (!have_ch ||
+					    cval->cache_val[idx] > max_val)
+						max_val = cval->cache_val[idx];
+					have_ch = true;
+				}
+				idx++;
+			}
+		}
+		/* master first (the Windows burst order).  Re-asserted
+		 * even unchanged, unless the value is the control's raw
+		 * maximum: that re-send would only trigger the in-headset
+		 * limit notification, and the device sits at raw max
+		 * after every reset anyway.
+		 */
+		if (master && !master_pending && !master->master_explicit &&
+		    have_ch &&
+		    (touched || level != FLUSH_TOUCHED) &&
+		    (!test_bit(0, master->cached) ||
+		     *master->cache_val != max_val ||
+		     max_val != master->max)) {
+			int err = snd_usb_set_cur_mix_value(master, 0, 0,
+							    max_val);
+			if (err < 0)
+				usb_audio_dbg(mixer->chip,
+					      "derive ctl %d ch 0 failed (%d)\n",
+					      master->control, err);
+		}
+		if (master && level != FLUSH_TOUCHED && !master_pending &&
+		    (master->master_explicit || !have_ch) &&
+		    !(test_bit(0, master->cached) &&
+		      *master->cache_val == master->max))
+			/* user-owned master, or a unit without per-channel
+			 * data: re-assert the cached master value, except
+			 * the unchanged raw maximum (same notification /
+			 * reset-at-max reasoning as the derive above)
+			 */
+			repush_ctl_cached(master);
+		for_each_mixer_elem(list, mixer, id) {
+			cval = mixer_elem_list_to_info(list);
+			if (!is_feature_volume_mute_ctl(cval))
+				continue;
+			if (cval->control == UAC_FU_VOLUME && cval->cmask &&
+			    level != FLUSH_TOUCHED) {
+				bitmap_zero(cval->pending, MAX_CHANNELS + 1);
+				repush_ctl_cached(cval);
+				continue;
+			}
+			if (cval->control == UAC_FU_MUTE &&
+			    level == FLUSH_RESUME_STATE) {
+				bitmap_zero(cval->pending, MAX_CHANNELS + 1);
+				repush_ctl_cached(cval);
+				continue;
+			}
+			if (!bitmap_empty(cval->pending, MAX_CHANNELS + 1))
+				flush_ctl_pending(cval);
+		}
+	}
+}
+
+static void snd_usb_mixer_flush_work(struct work_struct *work)
+{
+	struct usb_mixer_interface *mixer =
+		container_of(work, struct usb_mixer_interface,
+			     flush_work.work);
+	int level;
+
+	scoped_guard(mutex, &mixer->lock) {
+		level = FLUSH_TOUCHED;
+		if (test_and_clear_bit(MIXER_FLUSH_FULL,
+				       &mixer->flush_flags))
+			level = FLUSH_FULL_STATE;
+		if (test_and_clear_bit(MIXER_FLUSH_RESUME,
+				       &mixer->flush_flags))
+			level = FLUSH_RESUME_STATE;
+		if (mixer->disconnected)
+			return;
+		if (level != FLUSH_TOUCHED)
+			usb_audio_dbg(mixer->chip,
+				      "re-pushing mixer state (level %d)\n",
+				      level);
+		snd_usb_mixer_flush_pending(mixer, level);
+	}
+	/* A request may have arrived while we ran - from a stream open,
+	 * or from the resume callback, which cannot take this lock (see
+	 * the comment in snd_usb_mixer_resume()).  Re-arm so it gets
+	 * its own run; arming here is safe against teardown because the
+	 * disconnect path cancels this work only after this function
+	 * has returned.  While suspended, the resume callback does the
+	 * arming: re-arming here would only loop on failing writes.
+	 */
+	if (!test_bit(MIXER_FLUSH_SUSPENDED, &mixer->flush_flags) &&
+	    (test_bit(MIXER_FLUSH_FULL, &mixer->flush_flags) ||
+	     test_bit(MIXER_FLUSH_RESUME, &mixer->flush_flags)))
+		mod_delayed_work(system_wq, &mixer->flush_work,
+				 MIXER_FLUSH_DELAY);
+}
+
+/* Arm the deferred flush - unless the mixer is being torn down:
+ * free() cancels the work before the controls are unregistered, so
+ * a put must never arm the timer after the disconnect mark (which
+ * disconnect sets under the mixer lock the put already holds).
+ */
+static void mixer_arm_flush(struct usb_mixer_interface *mixer)
+{
+	if (!mixer->disconnected)
+		mod_delayed_work(system_wq, &mixer->flush_work,
+				 MIXER_FLUSH_DELAY);
+}
+
 /* put the current value to feature/mixer unit */
 static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *cval = snd_kcontrol_chip(kcontrol);
+	bool deferred;
 	int max_val;
 	int c, cnt, val, oval, err;
 	int changed = 0;
 
+	deferred = (cval->head.mixer->chip->quirk_flags &
+		    QUIRK_FLAG_MIXER_STATE_REPUSH) &&
+		   is_feature_volume_mute_ctl(cval);
+
 	guard(mutex)(&cval->head.mixer->lock);
 	max_val = get_max_exposed(cval);
 	if (cval->cmask) {
+		bool ch_seen = false;
+
 		cnt = 0;
 		for (c = 0; c < MAX_CHANNELS; c++) {
 			if (!(cval->cmask & BIT(c)))
@@ -1632,16 +1993,87 @@ static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 				return -EINVAL;
 			val = get_abs_value(cval, val);
 			if (oval != val) {
-				err = snd_usb_set_cur_mix_value(cval, c + 1,
-								cnt, val);
-				if (err < 0)
-					return filter_error(cval, err);
+				if (deferred) {
+					/* record only; one flush writes the
+					 * whole unit in a single burst.
+					 * Read-only channels keep the
+					 * direct-path behaviour: no write,
+					 * no cache update.
+					 */
+					if (!mixer_ch_readonly(cval, c + 1)) {
+						set_bit(c + 1, cval->cached);
+						cval->cache_val[cnt] = val;
+						set_bit(c + 1, cval->pending);
+						mixer_arm_flush(cval->head.mixer);
+					}
+				} else {
+					err = snd_usb_set_cur_mix_value(cval, c + 1,
+									cnt, val);
+					if (err < 0)
+						return filter_error(cval, err);
+				}
 				changed = 1;
 			}
+			/* any volume-channel write request - unchanged
+			 * values included - claims master ownership (see
+			 * below); read-only channels are not user-driven
+			 */
+			if (deferred && cval->control == UAC_FU_VOLUME &&
+			    !mixer_ch_readonly(cval, c + 1))
+				ch_seen = true;
 			cnt++;
 		}
+		/* The last writer owns the master: a volume channel
+		 * write request (the way audio servers drive this unit;
+		 * alsactl restores channels before the master, so the
+		 * master put would otherwise own every boot until the
+		 * first changed gesture) re-claims master derivation.
+		 * An unflushed explicit master value is dropped along
+		 * with the ownership: the pending bit is cleared so the
+		 * flush re-derives the master instead of writing the
+		 * superseded value, and the cached bit follows it - or
+		 * the raw-max skip in the flush would mistake the
+		 * never-written value for device state and swallow
+		 * every later derive.
+		 */
+		if (ch_seen) {
+			struct usb_mixer_elem_list *ml;
+
+			for_each_mixer_elem(ml, cval->head.mixer,
+					    cval->head.id) {
+				struct usb_mixer_elem_info *m =
+					mixer_elem_list_to_info(ml);
+
+				if (is_feature_volume_mute_ctl(m) &&
+				    m->control == UAC_FU_VOLUME && !m->cmask) {
+					m->master_explicit = false;
+					clear_bit(0, m->pending);
+					clear_bit(0, m->cached);
+				}
+			}
+		}
 	} else {
 		/* master channel */
+		if (deferred && !test_bit(0, cval->cached)) {
+			/* an ownership transfer dropped the cache entry:
+			 * the device value is unknown and, on broken-GET
+			 * controls, unreadable - record the request
+			 * unconditionally instead of reading it back (the
+			 * cache holds what user space last asked for)
+			 */
+			val = ucontrol->value.integer.value[0];
+			if (val < 0 || val > max_val)
+				return -EINVAL;
+			val = get_abs_value(cval, val);
+			if (!mixer_ch_readonly(cval, 0)) {
+				set_bit(0, cval->cached);
+				cval->cache_val[0] = val;
+				set_bit(0, cval->pending);
+				cval->master_explicit = true;
+				mixer_arm_flush(cval->head.mixer);
+				return 1;
+			}
+		}
 		err = snd_usb_get_cur_mix_value(cval, 0, 0, &oval);
 		if (err < 0)
 			return filter_error(cval, err);
@@ -1650,9 +2082,24 @@ static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 			return -EINVAL;
 		val = get_abs_value(cval, val);
 		if (val != oval) {
-			err = snd_usb_set_cur_mix_value(cval, 0, 0, val);
-			if (err < 0)
-				return filter_error(cval, err);
+			if (deferred) {
+				/* record only; one flush writes the whole
+				 * unit in a single burst.  Read-only
+				 * masters keep the direct-path behaviour:
+				 * no write, no cache update.
+				 */
+				if (!mixer_ch_readonly(cval, 0)) {
+					set_bit(0, cval->cached);
+					cval->cache_val[0] = val;
+					set_bit(0, cval->pending);
+					cval->master_explicit = true;
+					mixer_arm_flush(cval->head.mixer);
+				}
+			} else {
+				err = snd_usb_set_cur_mix_value(cval, 0, 0, val);
+				if (err < 0)
+					return filter_error(cval, err);
+			}
 			changed = 1;
 		}
 	}
@@ -3259,6 +3706,8 @@ static void snd_usb_mixer_free(struct usb_mixer_interface *mixer)
 	/* kill pending URBs */
 	snd_usb_mixer_disconnect(mixer);
 
+	cancel_delayed_work_sync(&mixer->flush_work);
+
 	/* Unregister controls first, snd_ctl_remove() frees the element */
 	if (mixer->id_elems) {
 		for (id = 0; id < MAX_ID_ELEMS; id++) {
@@ -3685,8 +4134,14 @@ void snd_usb_mixer_notify_id(struct usb_mixer_interface *mixer, int unitid)
 		if (!list->is_std_info)
 			continue;
 		info = mixer_elem_list_to_info(list);
-		/* invalidate cache, so the value is read from the device */
-		if (!info->get_cur_broken)
+		/* invalidate cache, so the value is read from the device;
+		 * under QUIRK_FLAG_MIXER_STATE_REPUSH the deferred controls
+		 * own their cache as the host-side truth and are never
+		 * invalidated
+		 */
+		if (!info->get_cur_broken &&
+		    !(mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_STATE_REPUSH &&
+		      is_feature_volume_mute_ctl(info)))
 			bitmap_zero(info->cached, MAX_CHANNELS + 1);
 		snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &list->kctl->id);
@@ -3783,8 +4238,14 @@ static void snd_usb_mixer_interrupt_v2(struct usb_mixer_interface *mixer,
 
 		switch (attribute) {
 		case UAC2_CS_CUR:
-			/* invalidate cache, so the value is read from the device */
-			if (!info->get_cur_broken) {
+			/* invalidate cache, so the value is read from the
+			 * device; under QUIRK_FLAG_MIXER_STATE_REPUSH the
+			 * deferred controls own their cache as the
+			 * host-side truth and are never invalidated
+			 */
+			if (!info->get_cur_broken &&
+			    !(mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_STATE_REPUSH &&
+			      is_feature_volume_mute_ctl(info))) {
 				if (channel)
 					clear_bit(channel, info->cached);
 				else /* master channel */
@@ -3914,6 +4375,7 @@ int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif)
 	if (!mixer)
 		return -ENOMEM;
 	mixer->chip = chip;
+	INIT_DELAYED_WORK(&mixer->flush_work, snd_usb_mixer_flush_work);
 	mixer->ignore_ctl_error = !!(chip->quirk_flags & QUIRK_FLAG_IGNORE_CTL_ERROR);
 	mixer->id_elems = kzalloc_objs(*mixer->id_elems, MAX_ID_ELEMS);
 	if (!mixer->id_elems) {
@@ -3976,13 +4438,51 @@ void snd_usb_mixer_disconnect(struct usb_mixer_interface *mixer)
 {
 	if (mixer->disconnected)
 		return;
+	/* Every mod_delayed_work() call site either holds this lock and
+	 * re-checks ->disconnected inside it, or runs from a PM callback
+	 * (which completes before the USB core calls driver->disconnect),
+	 * or is the flush worker itself before it returns.  Marking the
+	 * mixer disconnected under the lock before cancelling therefore
+	 * guarantees no flush can be armed after the cancel returns.
+	 */
+	scoped_guard(mutex, &mixer->lock) {
+		mixer->disconnected = true;
+	}
+	cancel_delayed_work_sync(&mixer->flush_work);
 	if (mixer->urb)
 		usb_kill_urb(mixer->urb);
 	if (mixer->rc_urb)
 		usb_kill_urb(mixer->rc_urb);
 	if (mixer->private_free)
 		mixer->private_free(mixer);
-	mixer->disconnected = true;
+}
+
+/**
+ * snd_usb_mixer_stream_opened - notify mixers of a PCM stream open
+ * @chip: the USB audio chip
+ *
+ * Called from the PCM open path.  Devices flagged
+ * QUIRK_FLAG_MIXER_STATE_REPUSH request a full-state re-push (the
+ * vendor driver's every-open write pattern, healing writes swallowed
+ * in the post-enumeration loss window), merged into the flush timer
+ * so the burst never observes a half-applied gesture.
+ */
+void snd_usb_mixer_stream_opened(struct snd_usb_audio *chip)
+{
+	struct usb_mixer_interface *mixer;
+
+	if (!(chip->quirk_flags & QUIRK_FLAG_MIXER_STATE_REPUSH))
+		return;
+
+	list_for_each_entry(mixer, &chip->mixer_list, list) {
+		scoped_guard(mutex, &mixer->lock) {
+			if (mixer->disconnected)
+				continue;
+			set_bit(MIXER_FLUSH_FULL, &mixer->flush_flags);
+			mod_delayed_work(system_wq, &mixer->flush_work,
+					 MIXER_FLUSH_DELAY);
+		}
+	}
 }
 
 /* stop any bus activity of a mixer */
@@ -4007,6 +4507,16 @@ static int snd_usb_mixer_activate(struct usb_mixer_interface *mixer)
 
 int snd_usb_mixer_suspend(struct usb_mixer_interface *mixer)
 {
+	/* Do not wait for an in-flight flush here: its control writes can
+	 * be blocked in runtime-PM resume, waiting for this very suspend
+	 * callback to finish - cancel_delayed_work_sync() would deadlock
+	 * the PM worker against the flush worker.  Cancel without waiting
+	 * and mark the mixer suspended; a flush already in flight stops
+	 * at the next unit (failed writes keep their values pending),
+	 * and the resume path re-pushes the complete state.
+	 */
+	set_bit(MIXER_FLUSH_SUSPENDED, &mixer->flush_flags);
+	cancel_delayed_work(&mixer->flush_work);
 	snd_usb_mixer_inactivate(mixer);
 	if (mixer->private_suspend)
 		mixer->private_suspend(mixer);
@@ -4021,6 +4531,17 @@ static int restore_mixer_value(struct usb_mixer_elem_list *list)
 	if (cval->val_type == USB_MIXER_BESPOKEN)
 		return 0;
 
+	/* Deferred controls belong to the flush mechanism: restore runs
+	 * without the mixer lock, so writing them here could clobber
+	 * values a concurrent deferred put just recorded, and it would
+	 * re-send a derived master from a cache that lags its channels.
+	 * The resume path requests a re-push that re-derives and
+	 * re-asserts all of them instead.
+	 */
+	if (cval->head.mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_STATE_REPUSH &&
+	    is_feature_volume_mute_ctl(cval))
+		return 0;
+
 	if (cval->cmask) {
 		idx = 0;
 		for (c = 0; c < MAX_CHANNELS; c++) {
@@ -4067,6 +4588,25 @@ int snd_usb_mixer_resume(struct usb_mixer_interface *mixer)
 
 	snd_usb_mixer_resume_quirk(mixer);
 
+	/* A suspend may have cancelled a flush that had not fired yet,
+	 * and restore_mixer_value() leaves the deferred controls to the
+	 * flush: request the re-push that re-derives and re-asserts all
+	 * of them.  No lock is taken here, not even trylock: a flush
+	 * whose control write triggered this very resume holds the lock
+	 * and must not be blocked or silently skipped - the worker
+	 * re-checks the request bits after every run, so this never
+	 * gets lost.  Arming without the lock is safe against teardown:
+	 * the USB core autoresumes the device before calling the
+	 * driver's disconnect, so this callback always runs before the
+	 * flush work is cancelled for good.
+	 */
+	if (mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_STATE_REPUSH) {
+		clear_bit(MIXER_FLUSH_SUSPENDED, &mixer->flush_flags);
+		set_bit(MIXER_FLUSH_RESUME, &mixer->flush_flags);
+		mod_delayed_work(system_wq, &mixer->flush_work,
+				 MIXER_FLUSH_DELAY);
+	}
+
 	return snd_usb_mixer_activate(mixer);
 }
 
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index c40f83285..813a1694c 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -41,6 +41,15 @@ struct usb_mixer_interface {
 
 	bool disconnected;
 
+	/* atomic write bursts (QUIRK_FLAG_MIXER_STATE_REPUSH) */
+	struct delayed_work flush_work;
+	/* flush requests, atomic bit ops only (see mixer.c):
+	 * 0 - re-push all cached volume values at the next flush
+	 * 1 - resume: also re-assert cached mute switches
+	 * 2 - suspend in flight: stop writing, retry after resume
+	 */
+	unsigned long flush_flags;
+
 	void *private_data;
 	void (*private_free)(struct usb_mixer_interface *mixer);
 	void (*private_suspend)(struct usb_mixer_interface *mixer);
@@ -95,6 +104,14 @@ struct usb_mixer_elem_info {
 	int dBmin, dBmax;
 	DECLARE_BITMAP(cached, MAX_CHANNELS + 1);
 	int cache_val[MAX_CHANNELS];
+	/* channels changed since the last flush
+	 * (QUIRK_FLAG_MIXER_STATE_REPUSH); same bit layout as cached
+	 */
+	DECLARE_BITMAP(pending, MAX_CHANNELS + 1);
+	/* user space has put this master explicitly: stop deriving it from
+	 * the channels (QUIRK_FLAG_MIXER_STATE_REPUSH)
+	 */
+	bool master_explicit;
 	u8 initialized;
 	u8 min_mute;
 	u8 get_cur_broken;
@@ -129,6 +146,8 @@ int snd_usb_mixer_vol_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 int snd_usb_mixer_suspend(struct usb_mixer_interface *mixer);
 int snd_usb_mixer_resume(struct usb_mixer_interface *mixer);
 
+void snd_usb_mixer_stream_opened(struct snd_usb_audio *chip);
+
 int snd_usb_set_cur_mix_value(struct usb_mixer_elem_info *cval, int channel,
                              int index, int value);
 
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 57a26492d..ec8ad7bd7 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -24,6 +24,7 @@
 #include "power.h"
 #include "media.h"
 #include "implicit.h"
+#include "mixer.h"
 
 #define SUBSTREAM_FLAG_DATA_EP_STARTED	0
 #define SUBSTREAM_FLAG_SYNC_EP_STARTED	1
@@ -1271,6 +1272,9 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		goto err_resume;
 
+	/* may re-push the cached mixer state (write-loss recovery) */
+	snd_usb_mixer_stream_opened(chip);
+
 	return 0;
 
 err_resume:
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 6ef6d4410..5328faa3d 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2504,6 +2504,7 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
 	DEVICE_FLG(0x040b, 0x0897, /* XiiSound/Weltrend Temple and rebranded headsets */
 		   QUIRK_FLAG_MIXER_INIT_VOLUME_MAX |
+		   QUIRK_FLAG_MIXER_STATE_REPUSH |
 		   QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL |
 		   QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL),
 	DEVICE_FLG(0x041e, 0x3000, /* Creative SB Extigy */
@@ -2984,6 +2985,7 @@ static const char *const snd_usb_audio_quirk_flag_names[] = {
 	QUIRK_STRING_ENTRY(ALWAYS_SET_RATE),
 	QUIRK_STRING_ENTRY(SWAP_RATES),
 	QUIRK_STRING_ENTRY(MIXER_INIT_VOLUME_MAX),
+	QUIRK_STRING_ENTRY(MIXER_STATE_REPUSH),
 	NULL
 };
 
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 61794fdc4..641bc968e 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -271,6 +271,23 @@ extern bool snd_usb_skip_validation;
  *  Initialize the volume control channels to the maximum instead of
  *  the minimum; the controls remain writable and the hardware volume
  *  operates normally afterwards.
+ * QUIRK_FLAG_MIXER_STATE_REPUSH
+ *  Some devices silently drop mixer writes issued in the first seconds
+ *  after USB enumeration, and can drop individual writes at any later
+ *  time as well, so the state the host believes in never reaches the
+ *  hardware (and GET_CUR is typically broken on these devices, so the
+ *  divergence cannot be detected by reading back).  The vendor's own
+ *  Windows driver never reads back either: it collects the whole
+ *  channel picture at a single source of truth and writes every
+ *  channel of a control in one short burst, re-pushing the complete
+ *  state at every device open.  Record volume and mute control writes
+ *  instead of issuing them directly, and write each touched feature
+ *  unit in one burst from a deferred flush (the master volume first,
+ *  derived from the loudest channel); a PCM stream open or a resume
+ *  requests a re-push of the cached volume values through the same
+ *  timer, and a resume additionally re-asserts cached mute switches.
+ *  Under this flag the cache holds what user space last asked for and
+ *  is never invalidated by device status notifications.
  */
 
 enum {
@@ -309,6 +326,7 @@ enum {
 	QUIRK_TYPE_ALWAYS_SET_RATE		= 32,
 	QUIRK_TYPE_SWAP_RATES			= 33,
 	QUIRK_TYPE_MIXER_INIT_VOLUME_MAX	= 34,
+	QUIRK_TYPE_MIXER_STATE_REPUSH		= 35,
 /* Please also edit snd_usb_audio_quirk_flag_names and alsa-configuration.rst */
 };
 
@@ -349,5 +367,6 @@ enum {
 #define QUIRK_FLAG_ALWAYS_SET_RATE		QUIRK_FLAG(ALWAYS_SET_RATE)
 #define QUIRK_FLAG_SWAP_RATES			QUIRK_FLAG(SWAP_RATES)
 #define QUIRK_FLAG_MIXER_INIT_VOLUME_MAX	QUIRK_FLAG(MIXER_INIT_VOLUME_MAX)
+#define QUIRK_FLAG_MIXER_STATE_REPUSH		QUIRK_FLAG(MIXER_STATE_REPUSH)
 
 #endif /* __USBAUDIO_H */
-- 
2.56.1

