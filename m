Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=85.215.255.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793792378;
	b=hHp020SFmNtE3dY+9P4IC8PNsBcyZstCZ2I0otPqZb8spmeAhbINNuHP4A8Si26CQuMz
	 sS1xvcED4hqay6MHpNQDYAM6bfYwN8b7AjU+tFqDMbztFtylGE5RTIfzjO5fUgIL2ldQt
	 WgQW+5ofPyrdGD/dqRqA5jaaZ+4IQFjioDKRWYctUmaY5xs6z4m+5WnlYREC/HstTso76
	 /JZRLqbGBIClkWCtCwSCTTKKsL9MgOqxOk9jy+G166B9V6w+p8ZC+CpDZ4taxil4O9LmV
	 ybZneFnKwzewTp2S23Rj0WX6x9TdPWjtP8RMiqMnuwU1SuHbD3wrQJqqfezOuxmI/KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792378;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Content-Transfer-Encoding:Mime-Version:Subject:
	 From:In-Reply-To:Cc:Date:Message-Id:References:To:X-Mailer;
	bh=EuCRo+isyYYJHR5NCK/nQj3H+m/NNoKnaw/1UxZ9C5w=;
	b=zPwj8jkJfT0cQn0N2Bqv2dxbTXfcayVVn6xvKAQiUMA0W+4azuhEW9a7uuesIccIRwE1
	 Bb2iDMQfcoRp0Wek74H/Ga9BAK54XNDHt+PNDPVCR+m15JYU9rAMDSvBAv25jlP2np4ge
	 PfM9LID4/vNuwDBMIcWo0OaaLYZHAmstzri2bMkreF4F21G0YqhKerv9uFuKP0W0ueXZs
	 H70NDOnDyLlsFcyR415zUEZBfgNPc8nyZDDHjk3wbZjBu1mK9O5E9AgVS4W5oSJQrnDmm
	 E4mlnjtfTOkoYAipcO4GSqjaAyOuvxeCbCZuSK0Mb6TV/r6K5XiEWR18a4/KpMc8zJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xenosoft.de;
	spf=none smtp.mailfrom=xenosoft.de;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=MN+ISlF1;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=M29Z1F3K;
	arc=fail smtp.remote-ip=85.215.255.53
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8357A606A329
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 11:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8357A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=MN+ISlF1;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=M29Z1F3K
ARC-Seal: i=1; a=rsa-sha256; t=1793792342; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=BPROtj+NfhV9fesoFNbwzitpKMuZYvXrz8rfgc5Sd5gVyVLLnfrl4WxjV0l2mibIQ3
    r2rCB5RRx3lzJahA8Vzv26KMLR2O7ovLf0qDPkQJAoy1dST/VqofKSxJHl/Qb3xGhXek
    6aoldSU8Rre2YEA6MHt3ig4D/lifss3CBlhQFr8OHMYigiQpzbR/dIJpI7ZHjhJKXDsL
    T/kmAwJhsv+Hcjl2u/UdmyzeBJpqwWt7jY3wIirv4LxI2+1Tu45yXmOgzQGg0rjL0V6O
    /wrI63tOrPdiPbk6OWgxCOJrIx0v1aWisXzpNTsgnsrmi4FsALx5At9D7Ssi2d5AL2MC
    pfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793792342;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Date:Cc:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=EuCRo+isyYYJHR5NCK/nQj3H+m/NNoKnaw/1UxZ9C5w=;
    b=hebA6WCl4r0RZtdxeaXccKZiqyyezjpuj820iUz65S9Q9Rz0v10eZd8OSSycMyd8xa
    P8Ps3iKE8vAp0xpM5ShHN9NxrQvsXUxJ5uwdcJ3K8gbSHLWhcu2Q2oJt/IwX2Xoct661
    EMCq0pYPCaUwa/gARym31qxHLS+PycKUKLSeKN7PQMlGy+OD7IIlD9wOVkhiXSf8RdmU
    w0y3wyjMveDOO6EQutGG7l1EPJGf7Z4vEVh9hlVbxiqdBNWr9fMosBj3OVH4mcsCtd00
    XVxozObfKqqqpAqgb7uRwtMVCLMcPn9k5jI5ImiNRLfknOcLVHF1OmG3v9Bmg8z3ldbj
    FvKg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793792342;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:References:Message-Id:Date:Cc:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=EuCRo+isyYYJHR5NCK/nQj3H+m/NNoKnaw/1UxZ9C5w=;
    b=MN+ISlF1LyqU0S15iIcosVhxpPJjwPfuOEbb3+cOP6wumB+KjWjZOHL+JS8qc2v1T4
    mzwH9+OU+0xOlknnaUziwcRmzfVgDPulDF62NegnjEmMbQEgSaLqypT2RN6EhjcGoHBy
    LRg0uPH6BO6Bu3KGON3ALX7dUY1XMUuyU3oCPR2UgWhvK3U9zkS8x02UtVWUGUwVrWol
    uc4vNslcNdxFVShT0t1112WSc55m/RYDFN3ZnfMJwIIExV7CvNnuMdeNDKRdOJ5wGR9w
    HuMlWSD9AYM4jbnLiVpcHhdYJqsWFmD/o8WegC0/dvtuTKmTwzJVxWKNYLDSaiRWKihG
    GULQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793792342;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:References:Message-Id:Date:Cc:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=EuCRo+isyYYJHR5NCK/nQj3H+m/NNoKnaw/1UxZ9C5w=;
    b=M29Z1F3KNQQqPDFcutmSaKXP57T9335XYQTuEKKzdYupuMUKxbTxUNFaNJ2nSVjPAM
    rqwU5QocuTNtCbe9P5Bg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5jhsyrNWX/25KwJsIZhNTSzezzvSY/I/f1AQX4="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id e825d92A4Bd2Kr5
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 4 Nov 2026 12:39:02 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] ALSA: pcm: Allow HW_REFINE queries with mapped buffers
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <20261104004113.546712-1-vincent.cloutier@icloud.com>
Cc: Takashi Iwai <tiwai@suse.de>, Vincent Cloutier <vincent@cloutier.co>,
 Zhang Cen <zzzccc427@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>,
 Damien Stewart <hypexed@yahoo.com.au>,
 Christian Zigotzky <info@xenosoft.de>
Date: Wed, 4 Nov 2026 12:38:51 +0100
Message-Id: <9C6C53B0-39AB-41A6-AD6C-9E6EBAC045BF@xenosoft.de>
References: <20261104004113.546712-1-vincent.cloutier@icloud.com>
To: Vincent Cloutier <vincent.cloutier@icloud.com>
X-Mailer: iPhone Mail (24B119)

On 04 November 2026 at 01:41 am, Vincent Cloutier <vincent.cloutier@icloud.c=
om> wrote:

=EF=BB=BFFrom: Vincent Cloutier <vincent@cloutier.co>

PulseAudio 16.1 queries supported formats after configuring and mapping
a PCM buffer. Sharing HW_PARAMS' state checker with HW_REFINE causes
these queries to fail with -EBADFD because a non-OSS stream has active
buffer mappings. PulseAudio then fails to create its sinks and sources.

Make the mmap restriction optional in the shared state checker. Keep it
for HW_PARAMS, which can reconfigure the mapped buffer, but skip it for
HW_REFINE, which only refines the caller's constraint structure. Keep
the stream-state checks and buffer access locking for native, compat
and legacy refinement ioctls rather than bypassing their wrapper.
Leave the accepted stream states unchanged.

On Librem 5, both L5 and Modem cards reproduce the failure for playback
and capture: refinement succeeds before setup and after RW setup, but
fails after MMAP setup in PREPARED state. With this change, all eight
cases pass, PulseAudio starts normally and audible playback works.
The reproducer does not start streams or transfer audio data.

Fixes: ad28d2f607d1 ("ALSA: pcm: Serialize and check HW_REFINE ioctls")
Link: https://lore.kernel.org/linux-sound/41a2e39a-5637-8afa-f84f-f79e63b3b5=
6e@xenosoft.de/
Link: https://lore.kernel.org/linux-sound/874idyx9n6.wl-tiwai@suse.de/
Assisted-by: OpenCode:GPT-6.1 Sol
Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
---
sound/core/pcm_native.c | 10 ++++++----
1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 5cbf88da7626..01d9f5ad4ea9 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -776,14 +776,15 @@ static void pcm_qos_req_update(struct snd_pcm_substrea=
m *substream, int usecs)
                      usecs);
}

-static int hw_params_state_check(struct snd_pcm_substream *substream)
+static int hw_params_state_check(struct snd_pcm_substream *substream,
+                 bool check_mmap)
{
  guard(pcm_stream_lock_irq)(substream);
  switch (substream->runtime->state) {
  case SNDRV_PCM_STATE_OPEN:
  case SNDRV_PCM_STATE_SETUP:
  case SNDRV_PCM_STATE_PREPARED:
-        if (!is_oss_stream(substream) &&
+        if (check_mmap && !is_oss_stream(substream) &&
          atomic_read(&substream->mmap_count))
          return -EBADFD;
      return 0;
@@ -806,7 +807,7 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *s=
ubstream,
  err =3D snd_pcm_buffer_access_lock(runtime);
  if (err < 0)
      return err;
-    err =3D hw_params_state_check(substream);
+    err =3D hw_params_state_check(substream, true);
  if (err)
      goto unlock;

@@ -944,7 +945,8 @@ static int snd_pcm_hw_refine_with_lock(struct snd_pcm_su=
bstream *substream,
  err =3D snd_pcm_buffer_access_lock(runtime);
  if (err < 0)
      return err;
-    err =3D hw_params_state_check(substream);
+    /* Refinement queries constraints without changing the mapped buffer. *=
/
+    err =3D hw_params_state_check(substream, false);
  if (err)
      goto unlock;


base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
--
2.56.0

- - -

Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>

The issue from the thread =E2=80=9CVoid PPC: PulseAudio issue with sound upd=
ates 7.4-rc1=E2=80=9D has been fixed with this patch.

Thanks

