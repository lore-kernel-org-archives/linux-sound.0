Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179334;
	b=4W9S+R7V2wEL1ImSfLkMy4JEPVN1HsMRqr8C+O4ymDu1LAIuy8GTrmRGCNpvJphWYo3j
	 VFsQNXCKPxpVsaqLl06iic7IkSv76+aQQsYrCvuVr4qg+jH+RI8Z/txfS/f3dQClzaWru
	 SRa788D/Id3AYoi6YGyuY+pjzr2/y4EkaP/SXrurwP45X2G7Jq2jPlJo2VA5rxiyLzlSd
	 SrGBUeh1NMoeWXOVL0SGaflNiPE8cMYmrrCUPE37//3MCaSKzRHpWmvNSEBVDNI+l683F
	 2KgaSFzDFZG5RJbUJIT7PoZ1jfkw7U7nBelbwRkGkixc6Ic4A7kABLTHag+XtwC0cPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179334;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=a9XbVf4FhnzktWS3qGCIKBfurWHFZpTKRrnVlbTItsk=;
	b=Fix/hX8ICsH82MAo/1OO4ZJdUlFMQnrTIwXOT6DRrS0wQC9q1e2Cg6p4YvSksiGOO5p5
	 pvrK5/Y5ogGoxLexwFjeE3X9pDH6w2F2sjPb/A5keMdkA2H+SSlzLabvLyyngtGY72Nsy
	 dbTM+4/JoUnjI4wBy0PFPhFWi3++kvIIoLYn+5nZokIDdLlQwl8SPSrvUeopJYA4OusSW
	 5hOZjvB1RAEHxXzTP/pbpU9wSlw9fVxbEOYDLAg7O3Xy9vr8r38D7kt3tPsm+sRelklFx
	 XcWcz2Wz9fl/rpYvop9a5TA9sHs7zHbtiw5NoEsmIlMGfTTbyCPy70rP7IHMBgKNN3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ierlH+1y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04D9606A325;
	Fri, 20 Nov 2026 12:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ierlH+1y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA431F000CF;
	Fri, 20 Nov 2026 12:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795179334;
	bh=a9XbVf4FhnzktWS3qGCIKBfurWHFZpTKRrnVlbTItsk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ierlH+1yaKgOGiKDNN4HpqkZHJDN9nGZ6onn+NykctOULAD1baYA6H8n3s0meIiNB
	 GGWS5q5X06phVlVO1pXNSbyepQskwvGrCiI4Ube+oV2AfTwYbuIa7ZWyu2g2ZVbfJf
	 0VQMfsijJ+rlsbA5W8jM09Uwd7H/dv5RLNWr5JdTJGzGXsJ0s7UjbLcdloql+CqNOX
	 a4W/eg+pNFMGJjjofAgaf0I4xYEvEHF9UsxT1ML7e0QpuOQVv4wR2ADWZQuo4wgsTi
	 c7rll+4IOSmbhIayxmCmziPaUd3YjqZiO8+tz5F0PfQMzQlHoyAdiHLM/8sRbYgM/g
	 +wKrsPl/ySjLA==
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
Subject: Re: [PATCH v3 3/3] ASoC: qcom: x1e80100: Allow userspace WSA RX
 chmap override
From: Mark Brown <broonie@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-3-29e06613115f@oss.qualcomm.com>
References: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-0-29e06613115f@oss.qualcomm.com>
 <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-3-29e06613115f@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 12:55:30 +0000
Message-Id: <179517933021.6016.6430816550414163668.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gi4YhkF1nfJuktb0DH/M4fSx8AVY+E8YevyMn12hA+o=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZnJ32iqhqTZt1LvnYvZPaD15/fNnuKLg+5WvWWeZF3
 7b72nDEdZSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAi1qsZ/pk9/fT8cxXr5YCJ
 mkwytjtdZR02ni/urgq6znL9p7CpyDKG/yW7Wj953rnuqtfbmWF9/fii5JPuwsrWlb0Cq+1SFMO
 m8AIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The WSA RX slot mapping is currently computed entirely from the channel
> count in .prepare() and pushed unconditionally via
> snd_soc_dai_set_channel_map(). Userspace has no way to express a
> different channel map, so any map defined in UCM is ignored.

> +
> +static int x1e80100_wsa_chmap_ctl_get(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	unsigned int *map = x1e80100_wsa_chmap_from_kcontrol(kcontrol);
> +	int i;
> +
> +	if (!map)
> +		return -EINVAL;
> +
> +	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
> +		ucontrol->value.integer.value[i] = map[i];

Nothing intialises the default maps AFAICT so this will just return 0s
until the control has been written.

> +static int x1e80100_wsa_chmap_ctl_put(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{

> +	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
> +		map[i] = ucontrol->value.integer.value[i];
> +
> +	return 1;

This just stores the value but doesn't tell the hardware about it, we
only write at prepare() time.  Either the writes should take effect or
we should refuse them while the stream is prepared.

> +static int x1e80100_add_wsa_chmap_ctls(struct snd_soc_pcm_runtime *rtd,
> +				       const char *name)
> +{

> +	/*
> +	 * The core registers a query-only control. Make it writable so that
> +	 * userspace (UCM) can select the WSA channel map. The card is not yet
> +	 * registered at this point, so the control is not visible to
> +	 * userspace while being modified.
> +	 */
> +	for (i = 0; i < info->kctl->count; i++)
> +		info->kctl->vd[i].access |= SNDRV_CTL_ELEM_ACCESS_WRITE;
> +	info->kctl->get = x1e80100_wsa_chmap_ctl_get;
> +	info->kctl->put = x1e80100_wsa_chmap_ctl_put;

The TLV should also advertise SNDRV_CTL_TLVT_CHMAP_VAR.

-- 
Mark Brown <broonie@kernel.org>
