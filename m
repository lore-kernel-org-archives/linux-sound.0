Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117488;
	b=Kym1MpA01IgvGMIQePK6jjs07UMRomS2UAcfi3QLcCb7N0i2rZEB8x64nDtzd11Vb7lm
	 JGYzcbTd5zmRyEXG8FtlvDG4tA205Kvss4NDpyo/Xz06BXl9pHnP2IxCEL1xpDxVOENqT
	 xFy0KTtBiHVazv+QJVuY6NT33LX5hOqexJ+/vcpdw5HWBq3UKSWj8njBryv6FrKl3up8V
	 FQGFgryiJqhOpNPnCTwrZuJQilYpV8+8AEd7o+OHNOeR8dHUYLW3UCMT0nC+SC9ALX9Oo
	 1MXH9V5XWXjg4nydRV7SKHkghtp/0ZJ7aJroWh4M4gj7rdXTgYOAeAMqd4Rkz8p6grA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117488;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3WTdTnF0JVYbxqSowMBqWcsMAu+J2ITBZyyZou4yRaw=;
	b=nf+dWtYmEoaTdmXg57et24ZCUv8PT0ZeCOazOgbEb1wiAI465fWoedHSHOTrdb3f3Tjr
	 xw8/GVvjfjFElA6VKqFaylcJkQr4RX/jjEWkU+grdWZDibVrN48ck5oWerygT34Tq3flI
	 fQy09dPuK6D5s8mVz0tz0jPW9sBQRVA/Z8EOJPwT1tmodel/DU9gRbdifO0KKF7UpMOXM
	 +dpZsPxjPQE0/gIYGPrbLx9Eav83Hexy49yn0JJIlv8jqgYmt84OjuQqUtTt13S8P44No
	 IAl7RGp/tUIalhZlS3OKIKMoiat+i9vJeJ0DoiU4jfpB8Eb2tp6eQUSZldPeSP+615g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CrmFyb47;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69612606A320
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 19:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CrmFyb47
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A081F000C7;
	Thu, 19 Nov 2026 19:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117488;
	bh=3WTdTnF0JVYbxqSowMBqWcsMAu+J2ITBZyyZou4yRaw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CrmFyb47H7JsIUFEODPV5vyGtSzN/GIaY6EwMt3/VJBOM3QBBX0pIHz0xUBKJsgct
	 55N0noK1/RasuL8NR4sXFc7NvAdqzIoNaNTnXUufsk11x1Hx5nHjxZwwmsWVrCZye1
	 mhQcwzFK3BOp9xI6SQYUMAy53z9J5ckKZMdukhY1Cak15u9zxty8b45ZRAOffkzKoB
	 MBlDFH8mj72DUGvMfw60z03qR4eVb3NGw5Zx26gIlxPhbHxQ0OhzxQ4LkN6uGZTc4m
	 m/O14zHBL8v+LDWdiPwts6ZfrcQ+T3lYEgcpTL8IrM0Yb8RTFTs0kzsd5wDQysApq6
	 r+ExVnV8kMAiw==
Message-ID: <sashiko-outbox-223965@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: soc-pcm: Track BE pause per FE-BE link
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suyuan Wang" <shyckless@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261119-asoc-dpcm-pause-link-v1-1-5b97347b5771@gmail.com>
References: <20261119-asoc-dpcm-pause-link-v1-1-5b97347b5771@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 19:44:47 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] ASoC: soc-pcm: duplicate PAUSE_PUSH sent on STOP in
  dpcm_be_dai_trigger()
- [Medium] ASoC: soc-pcm: stale pause count after prepare/hw_free in
  dpcm_be_dai_trigger()
- [Medium] ASoC: soc-pcm: BE left in PAUSED state on close in
  dpcm_be_dai_stop()
--

commit 30a052e7da7505ef9d19e12059b179dfd9931fe2
Author: Suyuan Wang <stevewong@hust.edu.cn>

ASoC: soc-pcm: Track BE pause per FE-BE link

This commit replaces the per-FE fe_pause boolean with a per-link paused
flag in struct snd_soc_dpcm so that BE pause refcounting and trigger rollba=
cks
are tracked per FE-BE link.

> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index ef8ccf52798eb..cb8d23756b1e0 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1685,6 +1685,17 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *=
fe, int stream,
>  		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
>  			continue;
> =20
> +		/*
> +		 * A pause may survive until close, e.g. after system suspend.
> +		 * Drop the pause this link still holds.
> +		 */
> +		if (dpcm->paused) {
> +			snd_pcm_stream_lock_irq(be_substream);
> +			dpcm->paused =3D false;
> +			be->dpcm[stream].be_pause--;
> +			snd_pcm_stream_unlock_irq(be_substream);
> +		}
> +
>  		if (be->dpcm[stream].users =3D=3D 0) {
>  			dev_err(be->dev, "ASoC: no users %s at close - state %s\n",
>  				snd_pcm_direction_name(stream),

[Severity: Medium]
Can this leave the BE stuck in SND_SOC_DPCM_STATE_PAUSED when another idle =
FE
still has the shared BE open?

If FE1 is paused on a shared BE across system suspend and then closed while
FE2 is still open (be->dpcm[stream].users > 1), dpcm_be_dai_stop() drops
be->dpcm[stream].be_pause to 0 and returns early after decrementing users.
That leaves be->dpcm[stream].state at SND_SOC_DPCM_STATE_PAUSED with
be_start =3D=3D 0 and be_pause =3D=3D 0, causing later dpcm_be_dai_hw_param=
s() calls
for FE2 to skip the BE because its state is not OPEN, HW_PARAMS, or HW_FREE.

> @@ -2220,7 +2231,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime =
*fe, int stream,
>  			       int cmd)
>  {
>  	struct snd_soc_pcm_runtime *be;
> -	bool pause_stop_transition;
> +	bool was_paused;
>  	struct snd_soc_dpcm *dpcm;
>  	unsigned long flags;
>  	int ret =3D 0;
> @@ -2248,6 +2259,16 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime=
 *fe, int stream,
>  			    (be->dpcm[stream].state !=3D SND_SOC_DPCM_STATE_PAUSED))
>  				goto next;
> =20
> +			/*
> +			 * A stream suspended while paused and prepared again
> +			 * starts without a PAUSE_RELEASE: drop its pause here.
> +			 */
> +			was_paused =3D dpcm->paused;
> +			if (was_paused) {
> +				dpcm->paused =3D false;
> +				be->dpcm[stream].be_pause--;
> +			}
> +
>  			be->dpcm[stream].be_start++;
>  			if (be->dpcm[stream].be_start !=3D 1)
>  				goto next;
> @@ -2260,6 +2281,10 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime=
 *fe, int stream,
>  						      SNDRV_PCM_TRIGGER_START);
>  			if (ret) {
>  				be->dpcm[stream].be_start--;
> +				if (was_paused) {
> +					dpcm->paused =3D true;
> +					be->dpcm[stream].be_pause++;
> +				}
>  				goto next;
>  			}

[Severity: Medium]
Does deferring pause cleanup until SNDRV_PCM_TRIGGER_START leave a stale
be->dpcm[stream].be_pause count after a suspended stream is prepared or
hw_freed?

When a paused FE is suspended and then recovered with snd_pcm_prepare() or
snd_pcm_drop() + snd_pcm_hw_free(), the FE transitions to PREPARE or HW_FREE
without sending PAUSE_RELEASE or STOP.  Until that FE either starts or clos=
es,
dpcm->paused remains true and be->dpcm[stream].be_pause stays elevated (and=
 is
restored if SNDRV_PCM_TRIGGER_START fails).  If another FE sharing the BE
starts and stops in the meantime, its STOP sees be_pause !=3D 0 and sends
SNDRV_PCM_TRIGGER_PAUSE_PUSH instead of SNDRV_PCM_TRIGGER_STOP, leaving the=
 BE
in SND_SOC_DPCM_STATE_PAUSED when no stream is paused.

[ ... ]

> @@ -2307,30 +2338,32 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtim=
e *fe, int stream,
>  			    (be->dpcm[stream].state !=3D SND_SOC_DPCM_STATE_PAUSED))
>  				goto next;
> =20
> -			if (be->dpcm[stream].state =3D=3D SND_SOC_DPCM_STATE_START)
> +			/*
> +			 * A paused FE left be_start when it paused and only
> +			 * holds a pause on this BE.
> +			 */
> +			was_paused =3D dpcm->paused;
> +			if (was_paused) {
> +				dpcm->paused =3D false;
> +				be->dpcm[stream].be_pause--;
> +			} else if (be->dpcm[stream].state =3D=3D SND_SOC_DPCM_STATE_START) {
>  				be->dpcm[stream].be_start--;
> +			}
> =20
>  			if (be->dpcm[stream].be_start !=3D 0)
>  				goto next;
> =20
> -			pause_stop_transition =3D false;
> -			if (fe->dpcm[stream].fe_pause) {
> -				pause_stop_transition =3D true;
> -				fe->dpcm[stream].fe_pause =3D false;
> -				be->dpcm[stream].be_pause--;
> -			}
> -
>  			if (be->dpcm[stream].be_pause !=3D 0)
>  				ret =3D soc_pcm_trigger(be_substream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
>  			else
>  				ret =3D soc_pcm_trigger(be_substream, SNDRV_PCM_TRIGGER_STOP);

[Severity: Medium]
Can SNDRV_PCM_TRIGGER_STOP send a duplicate SNDRV_PCM_TRIGGER_PAUSE_PUSH to=
 a
BE that is already in SND_SOC_DPCM_STATE_PAUSED?

When be->dpcm[stream].state is already SND_SOC_DPCM_STATE_PAUSED,
be->dpcm[stream].be_start is 0.  If two paused FEs share the BE (be_pause =
=3D=3D 2)
and one of them is stopped, be_pause drops to 1 and execution falls through=
 to
soc_pcm_trigger(be_substream, SNDRV_PCM_TRIGGER_PAUSE_PUSH) on the
already-paused BE.  The same duplicate PAUSE_PUSH happens if STOP runs for =
an
unpaused FE (was_paused =3D=3D false) while another FE holds the BE in
SND_SOC_DPCM_STATE_PAUSED, such as when snd_pcm_undo_start() sends STOP aft=
er a
failed start.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-asoc-dpcm-=
pause-link-v1-1-5b97347b5771@gmail.com?part=3D1
