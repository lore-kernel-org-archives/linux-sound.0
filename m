Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351285;
	b=01bdOGMhMv/+gcYfsYMxnk3rQhj8bU5udy5oRKl3usJg+aCEeyZPt4x4jFIdi4+f+ZXr
	 LLj5z+lApmMdd2gNYAu2cUPSxq4mib+ehEwBPh2k0OTpu7v+jGgqIKzezg5pVmvRg724y
	 iqpEBWmZvkHLoU7qCOi1QVbNVmG/JOUF+6b462+tTRuSmSpbXkMMrhV2M/kyAv/RgaW2i
	 rgcdbZRjCFJcbbjiJqt5rwF99xMUHHHR+lgVcAiNjpUef7Y4aRvkbp6GUqyUxOXNFTght
	 F3zpaJaBb/Xa76z9/sXm/LdDlx6fwybfLggVg/+b0PYkO23hGv/9G5Y99zOV5ebzQ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351285;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KjnUk5lw1l/4LHrB1CMb9LmGf2MMjhfDx+YPyHG7ROA=;
	b=Uy4AaakS96pab4zOnwVQ42l0H7+kosWX5a5rZhNoobxUk1MXuxK5M8Xi7wo5iBpOHf5j
	 Dbp9/lTXR6cZb3174KQPLRhfV5mQGJti0cSdz8LqWPlT9YfwGbnES74ZY/JsBVY+MVLJj
	 a5HNEsIwSREWv0WjfcLJy5791UmF1oiOhlzcrcmlcrDrMqW1R1CWAA/kG9yV8lknknt3i
	 2RXqCzu61n+xq4A1DD0/lvrfvzvyAMEDMqn2a8gj7LbqiqGo51hn8ZKA/JLNte8W5lKfE
	 Xo8PnLJeEpj59LtGmgqsMIif6J7e+eXxqYfmwt/R0tLRvBct1LxTKixKpJpxHtU1QZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="T/S7iBg8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21D3606A31F
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T/S7iBg8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB8E1F00A1A;
	Fri, 30 Oct 2026 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793351284;
	bh=KjnUk5lw1l/4LHrB1CMb9LmGf2MMjhfDx+YPyHG7ROA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T/S7iBg8cPnga/LHt8aTLzFo1jJuMI7EQxVA7nTDZujaqkR3iH5dbMaKDFMkHGxcb
	 VrLFfSgrar5vEwqKkiCFmpvvIy243tEBhGqQaL1qVorx2f3LL3qROKPX4sHtnKQ4Wv
	 843E0dntx0yrV18/pvCTtRIGT7hgwUN9sBQNrmmByc31MTzsjDUsxo1oDo8OzCyn9s
	 BWvQphHR5YbxJv8FoRGeGnVF8KrGVle49J7VegIRKFHxXiFS5gMf3yBY9uhpZGyaz2
	 Vdzf7FLSfxHM0o/tNzqPXaat2eEDHS+vC6MbqAYIAEIBVOX2U5/IHzfh2pRnmtIpqX
	 g2I1qw8bl32lA==
Message-ID: <sashiko-outbox-190735@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] ASoC: rt721-sdca: handle HID button read errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Avi Weiss" <thnkslprpt@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261030085735.2146047-1-thnkslprpt@gmail.com>
References: <20261030085735.2146047-1-thnkslprpt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 09:08:03 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] ASoC: rt721-sdca: missed jack unplug report in rt721_sdca_jack_d=
etect_handler()
- [Low] ASoC: rt-sdw-common: outdated kernel-doc for rt_sdca_button_detect(=
) errors
--

commit cf6272e44cca067c36577fc836fb60a9747c068e
Author: Avi Weiss <thnkslprpt@gmail.com>

ASoC: rt721-sdca: handle HID button read errors

This commit updates rt_sdca_button_detect() to return negative error codes
on regmap_read() failures instead of zero, and updates
rt721_sdca_jack_detect_handler() to skip reporting button state on read
errors while still reporting jack state changes.

> diff --git a/sound/soc/codecs/rt-sdw-common.c b/sound/soc/codecs/rt-sdw-c=
ommon.c
> index ad61943ce75ff..e4139e6393b1c 100644
> --- a/sound/soc/codecs/rt-sdw-common.c
> +++ b/sound/soc/codecs/rt-sdw-common.c
> @@ -199,7 +199,7 @@ int rt_sdca_button_detect(struct regmap *map, unsigne=
d int entity_id,
>  	ret =3D regmap_read(map, SDW_SDCA_CTL(SDCA_NUM_HID, entity_id,
>  			RT_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), &owner);
>  	if (ret < 0)
> -		return 0;
> +		return ret;

[Severity: Low]
This isn't a bug, but since rt_sdca_button_detect() in
sound/soc/codecs/rt-sdw-common.c now returns negative error codes when
regmap_read() fails, should its kernel-doc comment above the function:

	 * A button type will be returned regarding to buffer,
	 * it returns zero if buffer cannot be recognized.

also be updated to note that a negative errno is returned on error,
similar to rt_sdca_headset_detect()?

>  	/* if owner is device then there is no button event from device */
>  	if (owner =3D=3D 1)
> @@ -229,6 +229,9 @@ int rt_sdca_button_detect(struct regmap *map, unsigne=
d int entity_id,
>  			SDW_SDCA_CTL(SDCA_NUM_HID, entity_id,
>  				RT_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
> =20
> +	if (ret < 0)
> +		return ret;
> +
>  	return btn_type;
>  }
>  EXPORT_SYMBOL_GPL(rt_sdca_button_detect);
> diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
> index 9f567caecb70a..95c028efec01c 100644
> --- a/sound/soc/codecs/rt721-sdca.c
> +++ b/sound/soc/codecs/rt721-sdca.c
> @@ -248,6 +248,19 @@ static void rt721_sdca_jack_detect_handler(struct wo=
rk_struct *work)
>  					RT721_SDCA_ENT_HID01, RT721_BUF_ADDR_HID1,
>  					RT721_SDCA_HID_ID);
> =20
> +	if (btn_type < 0) {
> +		if (rt721->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_0) {
> +			unsigned int mask =3D SND_JACK_HEADSET;
> +
> +			if (rt721->jack_type !=3D SND_JACK_HEADSET)
> +				mask |=3D SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +					SND_JACK_BTN_2 | SND_JACK_BTN_3;
> +
> +			snd_soc_jack_report(rt721->hs_jack, rt721->jack_type, mask);
> +		}
> +		return;
> +	}

[Severity: Medium]
Can this leave rt721->hs_jack out of sync with rt721->jack_type on RT721_S
when a headset is unplugged without SDW_SCP_SDCA_INT_SDCA_0 set in
rt721->scp_sdca_stat1?

In sound/soc/codecs/rt721-sdca-sdw.c:rt721_sdca_interrupt_callback(), if a
pending jack_detect_work scheduled by an unplug interrupt
(SDW_SCP_SDCA_INT_SDCA_0) is cancelled by a subsequent button interrupt
(SDW_SCP_SDCA_INT_SDCA_8) from contact bounce, only scp_sdca_stat2 is
preserved while scp_sdca_stat1 is overwritten with a fresh read of
SDW_SCP_SDCA_INT1 (which was already cleared):

	if (cancel_delayed_work_sync(&rt721->jack_detect_work)) {
		dev_warn(&slave->dev, "%s the pending delayed_work was cancelled", __func=
__);
		/* avoid the HID owner doesn't change to device */
		if (rt721->scp_sdca_stat2)
			scp_sdca_stat2 =3D rt721->scp_sdca_stat2;
	}
	...
	ret =3D sdw_read_no_pm(rt721->slave, SDW_SCP_SDCA_INT1);
	if (ret < 0)
		goto io_error;

	rt721->scp_sdca_stat1 =3D ret;

Then, when rt721_sdca_jack_detect_handler() runs on RT721_S, it checks
RT721_JD_1PIN_GAT_STA1 and unconditionally resets the driver's jack state
(setting rt721->jack_type =3D 0) regardless of SDW_SCP_SDCA_INT_SDCA_0:

	if (rt721->wf_id =3D=3D RT721_S) {
		...
		rt_sdca_index_read(rt721->mbq_regmap, RT721_JD_CTRL,
			RT721_JD_1PIN_GAT_STA1, &real_JD);
		real_JD &=3D 0x1;
		if (real_JD =3D=3D 0x0)
			rt721_sdca_jack_reset_state(rt721);

If rt_sdca_button_detect() then fails and returns a negative error while
SDW_SCP_SDCA_INT_SDCA_0 is clear in rt721->scp_sdca_stat1, this new error
path returns early without calling snd_soc_jack_report(), leaving
rt721->hs_jack stuck reporting the headset as connected and any previously
active buttons as pressed even though rt721->jack_type was reset to 0.

Should the error path also report the jack state when rt721->jack_type =3D=
=3D 0
(or preserve scp_sdca_stat1 across cancelled work)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030085735.2146=
047-1-thnkslprpt@gmail.com?part=3D1
