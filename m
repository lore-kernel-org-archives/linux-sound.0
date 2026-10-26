Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792973450;
	b=YRC3SvXbgZu6RP82czb/qvTG29heG0GlGDhjOcaNTjJDVJ8QHItwkrxnfq1qXBk7nAUT
	 11rchHWgRBsB8LdnPMcmHju9eE4W81A3AGgdJxVJLLtcI4NIuZ1lLPY0Rvg9+nWJ9gBzN
	 pJ6w2cb4SmCbzZVLwjIkE3Z9hU7FU/WkbG2O80wMT7vVvPAsOJr+e9ZbKdv39VMeBm6ZZ
	 zZxbtb0xAjQECsUQ3aj3mkdFVXL2mvt4tPAufNXApDibbtTeIy2ZkOJvz+7Ak3n4QdiEl
	 45lgmzatH3bPBEtaI/C+vSHXbN13vz+AcdsYEA3bRhO4VF6yIUSUCYB1d2h5NkCb9fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792973450;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=rEBKyEzDVraLXKxaOkha7Wx1jCRXe3d3QWz8EKrntEU=;
	b=Mkv+JEMpNBuoKuhY/4WWm+3LP2zWuybJBC9boZPdDIqd/s0wL+N20xRl1crDye0Wsewi
	 1JJtVagiv+qxpZJ6mFdkwGxge0wskwo+yRFq6CQSjoNSH1gdOLzfLOqkzGA7F1FA21yUj
	 Om5cdEHBcNGN/kD7S9LdMaH7eZag/VhlIsxLmpxNQ5X+2x+zuiaXiS87zE+on+9nVILI1
	 xvlz7SkCRSrZq5qGWIhalx7emVFmrI8QCtAL5B4fbKOJ+QXewPMc0WwdrkP3JteqUDAF5
	 5nG08DLIP1OjspjDdWtC0qqFdLYay1xqv1UzZeWAz4vmdCoxwf0g6FqXIvCJ9nHbjHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=jQpJ4cdv;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE4D606A31A
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 00:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEE4D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=jQpJ4cdv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792973447; x=1793232647;
	bh=rEBKyEzDVraLXKxaOkha7Wx1jCRXe3d3QWz8EKrntEU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jQpJ4cdvnvsmElw7QdxKU5eLPOnna5FTAJgEpeWXOPw7rbos6ieDjtsC6Dmnu1zWa
	 VyPyqWwuL8qSowi2c8vOLIzEpwfjWxOUBG2tn2eSGEy9m0/HgWDanoehFSF684osja
	 IGYRzUJRwjbHgqG+CA8Xjqsm3gPBTCV0rOzgXdviUzijeBb0cyTbtxTmey7ODVCzmf
	 kn2kgDV1RrnGpMy3/4CrqehVlbSl1fp78Asx+wZYptzJJB8HfWvwBQ0egyo6eZieRP
	 6FtCE50FvVYGCksKw/SL8OG8+UtkDnjHwodU9Dih5/A7L8eL561xRh1xHqSVDtt6I7
	 V8cDDoZT542kw==
Date: Mon, 26 Oct 2026 00:10:43 +0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Clemens Ladisch <clemens@ladisch.de>
From: x8svc <enscrpt@pm.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 1/2] ALSA: usb-audio: Bound packet copies by the PCM buffer size
Message-ID: <20261026001003.1067-2-enscrpt@pm.me>
In-Reply-To: <20261026001003.1067-1-enscrpt@pm.me>
References: <20261026001003.1067-1-enscrpt@pm.me>
Feedback-ID: 48393780:user:proton
X-Pm-Message-ID: a35d86fe96ad780fa77230ffd5c431b2b44aa77d
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

retire_capture_urb() and prepare_playback_urb() assume that one USB
packet never carries more data than the whole ALSA ring buffer. Nothing
enforces that: the packet size comes from the device (wMaxPacketSize,
and curpacksize =3D=3D maxpacksize when the class-specific endpoint
descriptor sets MaxPacketsOnly), while the PCM hardware constraints only
require 64-byte periods, two periods and a period time of one data
interval. An 8 kHz mono U8 stream on a 128-byte buffer is legal, and a
full-speed device can send 1023-byte packets into it.

On the first oversized packet hwptr_done is wrapped once and stays
beyond buffer_bytes (895 for 1023 bytes into 128). On the next packet
the wrap arithmetic in the copy path computes

    bytes1 =3D subs->buffer_bytes - oldptr

with oldptr > buffer_bytes, so bytes1 wraps to about 4 GB and memcpy()
runs off the end of the URB buffer and of the vmalloc'd DMA buffer:

  BUG: KASAN: slab-out-of-bounds in retire_capture_urb+0x251/0x870
  Read of size 4294966529 at addr ffff88800c1e2800 by task vhci_rx/82

and for playback, where copy_to_urb() has the same shape:

  BUG: KASAN: vmalloc-out-of-bounds in copy_to_urb.isra.0+0x188/0x430
  Read of size 4294966529 at addr ffffc9000004537f by task vhci_rx/79
   prepare_playback_urb+0x98a/0x1fc0

Truncate an oversized capture packet to the buffer size, and stop
filling a playback URB once it holds a whole buffer. With bytes <=3D
buffer_bytes the single wrap of hwptr_done and the two-part memcpy()
in both copy paths stay inside the buffer. A device whose packets do
not fit the buffer at all was never going to play correctly anyway.

Reproduced on 7.3-rc7 with a USB/IP device (dummy_hcd cannot carry
isochronous data) advertising a UAC1 endpoint with MaxPacketsOnly and
wMaxPacketSize 1023, and a PCM client using period_size 64, periods 2.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: x8svc <enscrpt@pm.me>
---
 sound/usb/pcm.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 682b6c1fe76..c2f7b08607a 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1343,6 +1343,18 @@ static void retire_capture_urb(struct snd_usb_substr=
eam *subs,
 =09=09=09bytes -=3D adj;
 =09=09=09subs->stream_offset_adj -=3D adj;
 =09=09}
+=09=09/*
+=09=09 * A packet can be as large as the endpoint's maxpacksize, which
+=09=09 * the device chooses, while the ring buffer can be as small as
+=09=09 * two 64-byte periods. The hwptr_done wrap below handles one
+=09=09 * wrap only, so never take more than one buffer from a packet.
+=09=09 */
+=09=09if (unlikely(bytes > subs->buffer_bytes)) {
+=09=09=09dev_warn_ratelimited(&subs->dev->dev,
+=09=09=09=09=09     "%u-byte packet exceeds %u-byte buffer, truncating\n",
+=09=09=09=09=09     bytes, subs->buffer_bytes);
+=09=09=09bytes =3D subs->buffer_bytes;
+=09=09}
 =09=09frames =3D bytes / stride;
 =09=09if (!subs->txfr_quirk)
 =09=09=09bytes =3D frames * stride;
@@ -1553,8 +1565,14 @@ static int prepare_playback_urb(struct snd_usb_subst=
ream *subs,
=20
 =09=09for (i =3D 0; i < ctx->packets; i++) {
 =09=09=09counts =3D snd_usb_endpoint_next_packet_size(ep, ctx, i, avail);
+=09=09=09/*
+=09=09=09 * Bound by the ring buffer as well as by the URB:
+=09=09=09 * copy_to_urb() wraps hwptr_done once, so one URB must
+=09=09=09 * never carry more than the whole buffer.
+=09=09=09 */
 =09=09=09if (counts < 0 ||
-=09=09=09    (frames + counts) * stride > ctx->buffer_size)
+=09=09=09    (frames + counts) * stride > ctx->buffer_size ||
+=09=09=09    (frames + counts) * stride > subs->buffer_bytes)
 =09=09=09=09break;
 =09=09=09/* set up descriptor */
 =09=09=09urb->iso_frame_desc[i].offset =3D frames * stride;
--=20
2.56.0


