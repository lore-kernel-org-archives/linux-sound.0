Received: from mail-40137.protonmail.ch (mail-40137.protonmail.ch [185.70.40.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1BC18E76D
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 21:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722289345; cv=none; b=CTPFiKJRvdB3IEYksIAq6qty6ML9Tf4FLRsFEDbhl9vkI4TheqxawE6Mqgar7LFgryQCLQIh+0PbdyWRPWwOGJpBhia8fwWBL6HXi7bOyHQf0IPwRH6/MCU+zHlyQwZ6FMCQlYDm5iUaiuPLAM49QDYquzuR/VfSUVUV/W/sd5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722289345; c=relaxed/simple;
	bh=jC/KhaJqTmeXOybIabumropkSzYE0inJWgtzdauR0uY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C7BTA5r+XIw/6dRi9Ir5vmo2LyyXDg4gcqkTBavcU+CZoyNnBgHaEaB1mSCxrPzBejUU6YVgUXl6yc/yXbAkR2qEm+VJ5+rzCgy6Uw4+ITygtGZMVB92mspdSyUC7PvQ070OEV6n+PlvvcZbh+VE7pO3oOHXGVLweiH55Tz33Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=PGAhNV8+; arc=none smtp.client-ip=185.70.40.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="PGAhNV8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1722289336; x=1722548536;
	bh=0qv70E0VnYWx518cQ856tZOi8XtGafmVVQLWE08yAXM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PGAhNV8+QoY6wSrpGHnI0EmFTa50atee4UlSqQYnGlrBHiYPtWG1/ynQXWj3D8K9t
	 TaasUrFwsuLg0nj7420s5KCYUFV3GqpBK7QrI20CbToKBxW7BpVAw78ccMY9TT7Caq
	 Y7iLTeiLeSLeokU8gCsxlel+Rwbv/UeRodI/kYOjbDI49heKGzClgaLpsmKJp4Q6m/
	 k3aQJIuuVrBbYnx9lxU7wQ0Eoei0dJoZkPZKjLCUCrPPpkrZIDu1pBjKENutufch+x
	 Rv3iI3f+3PgV8xf6MKLy/VjkTCh7i3WLQDb1QwEBsyRohKXVezFQ5L8DMz8JEVGeQa
	 4WA3U/XBP2hmw==
Date: Mon, 29 Jul 2024 21:42:11 +0000
To: o-takashi@sakamocchi.jp, clemens@ladisch.de
From: Edmund Raile <edmund.raile@protonmail.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v3 1/3] Revert "ALSA: firewire-lib: obsolete workqueue for period update"
Message-ID: <20240729214149.752663-2-edmund.raile@protonmail.com>
In-Reply-To: <20240729214149.752663-1-edmund.raile@protonmail.com>
References: <20240729214149.752663-1-edmund.raile@protonmail.com>
Feedback-ID: 43016623:user:proton
X-Pm-Message-ID: ef79e849b7a2927f46f7a6f6a07e5d260af1f69f
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

prepare resolution of AB/BA deadlock competition for substream lock:
restore workqueue previously used for process context:

revert commit b5b519965c4c ("ALSA: firewire-lib: obsolete workqueue for
period update")

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/kwryofzdmjvzkuw6j3clftsxmoolynljztxqwg76hze=
o4simnl@jn3eo7pe642q/
Signed-off-by: Edmund Raile <edmund.raile@protonmail.com>
---
 sound/firewire/amdtp-stream.c | 15 +++++++++++++++
 sound/firewire/amdtp-stream.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index d35d0a420ee0..31201d506a21 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -77,6 +77,8 @@
 // overrun. Actual device can skip more, then this module stops the packet=
 streaming.
 #define IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES=095
=20
+static void pcm_period_work(struct work_struct *work);
+
 /**
  * amdtp_stream_init - initialize an AMDTP stream structure
  * @s: the AMDTP stream to initialize
@@ -105,6 +107,7 @@ int amdtp_stream_init(struct amdtp_stream *s, struct fw=
_unit *unit,
 =09s->flags =3D flags;
 =09s->context =3D ERR_PTR(-1);
 =09mutex_init(&s->mutex);
+=09INIT_WORK(&s->period_work, pcm_period_work);
 =09s->packet_index =3D 0;
=20
 =09init_waitqueue_head(&s->ready_wait);
@@ -347,6 +350,7 @@ EXPORT_SYMBOL(amdtp_stream_get_max_payload);
  */
 void amdtp_stream_pcm_prepare(struct amdtp_stream *s)
 {
+=09cancel_work_sync(&s->period_work);
 =09s->pcm_buffer_pointer =3D 0;
 =09s->pcm_period_pointer =3D 0;
 }
@@ -624,6 +628,16 @@ static void update_pcm_pointers(struct amdtp_stream *s=
,
 =09}
 }
=20
+static void pcm_period_work(struct work_struct *work)
+{
+=09struct amdtp_stream *s =3D container_of(work, struct amdtp_stream,
+=09=09=09=09=09      period_work);
+=09struct snd_pcm_substream *pcm =3D READ_ONCE(s->pcm);
+
+=09if (pcm)
+=09=09snd_pcm_period_elapsed(pcm);
+}
+
 static int queue_packet(struct amdtp_stream *s, struct fw_iso_packet *para=
ms,
 =09=09=09bool sched_irq)
 {
@@ -1910,6 +1924,7 @@ static void amdtp_stream_stop(struct amdtp_stream *s)
 =09=09return;
 =09}
=20
+=09cancel_work_sync(&s->period_work);
 =09fw_iso_context_stop(s->context);
 =09fw_iso_context_destroy(s->context);
 =09s->context =3D ERR_PTR(-1);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index a1ed2e80f91a..775db3fc4959 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -191,5 +191,6 @@ struct amdtp_stream {
=20
 =09/* For a PCM substream processing. */
 =09struct snd_pcm_substream *pcm;
+=09struct work_struct period_work;
 =09snd_pcm_uframes_t pcm_buffer_pointer;
 =09unsigned int pcm_period_pointer;
--=20
2.45.2


