Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035A13EFFD1
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 11:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151292; cv=none; b=V9iKa7LtI8TlL09gDrPxZX+YzsflI4QiyJ9hSfJZh1W/Q9Irg/REFOA2GFiIZfLjME6XnfQl8IDVBMhv2Nvp1jRAKB5Q2xqlj9lMVVm2iqH94fRQ0ZfjvwEDP/UxVcLnoGTKN6C+qQ/a37ApYl0Ja/YfstTyJPNjxg4zulGbw1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151292; c=relaxed/simple;
	bh=LjpwzNllFLtA3zY/6AMDT97WxH1SKAm+I2a28uecxFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WwuwlrnVZ3WmVo2njpzqBqslOymA8KIazzi2jXyKonkRiJf+38DwB4mEbPbr8RVoG7pNLbqlsI6jePDN4YuokpococEj/kfLmVTB7qC4wb6J/oP8vZBfapm6IgHtxiH42DKG9L9xZ7/GUJWSTwql/sRND6c8j6jsu0F0JEM/j80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=montane.tech; spf=pass smtp.mailfrom=montane.tech; dkim=pass (2048-bit key) header.d=montane-tech.20251104.gappssmtp.com header.i=@montane-tech.20251104.gappssmtp.com header.b=goNzypL+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=montane.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=montane.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=montane-tech.20251104.gappssmtp.com header.i=@montane-tech.20251104.gappssmtp.com header.b="goNzypL+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954df200ddso16565325e9.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 04:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=montane-tech.20251104.gappssmtp.com; s=20251104; t=1785151289; x=1785756089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4NFtUi+NlPvRzW/kTWgOs1dOctwR5JBx4s3SqBUDZ8=;
        b=goNzypL+Iv3ybvQovBhFQwTXKLgHxotH6ckzsdgBBIzSB4sp02F4UiD0vovY2IE5TF
         WeVUqfXvRQzUtXq04L4b5dfSV5iuHaF1JRaKyzCZMB4DHolZIZX+3297Ea1yRbDmC0c6
         z9K0P9Na0tQrYuStYHa5sVUVsZGzcT8LQ0TLdH3ElSPTYK+l/2UmJ/xUGoZFlj//BCNG
         OkzL9CJrX4ectw70R2M8xCE5APTf+ySnY4zJvZXccHIc/RbHgNU+P1dQ04nUtHIgPR2w
         9YOaePYSsMnx2eTOMwWp8Lk+Ixawj6unFqwuEIp6kDQ/H//3erS9G/YTHqBDLJMmPoiz
         33DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151289; x=1785756089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4NFtUi+NlPvRzW/kTWgOs1dOctwR5JBx4s3SqBUDZ8=;
        b=ChuKXnwf2nKyklpQmIg3kOyzXqpHuBkFtBXOOM+MY9IoE6sOlk/lkyy62cXjfshAeC
         h+TVpRcZT9k8WdAwntTJZEDNWBn4+YW5danpX+oIXi50g7xNqXGpWpiYM2mwxzlXb5bo
         a0M2028ceNQDbpDqIrOT7QE7wetjxvMNp9QlQJBNc+yLuPTEpreldYEOwt/cd8n7dxCM
         /tm/AvFmGNylNiCkY4e48oDr29sKhhEt8INDXRg3i8za9nb39bBNr2UFF0kC8TgIpOIj
         VkWrUSjoea+3QbDfqeuW0N5V4s2Oha+JTbfijtW3FqtkN8p8wkkMwwx0OYY+GRgMNP3d
         Pdew==
X-Forwarded-Encrypted: i=1; AHgh+RrovmYQ8vJZZaQoLcKS7rKbQJsbJq6J9NxKIGNCfQQ24WOOkOUDubeZmSedsjnd3ly9lJ9iE1RVmPyQcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOHyhWWsXDIoEf8eXrVRahWb7vOe4EkYjbnwOtcbKK+myNpO7x
	P64103CgOGZcoWKzySpBrYeAeJgZ5sIsJlHpI2Di8WJKiZXNAih56z3ULUGQ7F39EF0=
X-Gm-Gg: AR+sD13NAUbQ9PLnwJmeW48GKPg4O8BfCFKySST8iXNCZnXW2jDfBWgOwriDK12uE40
	007lxsy0sENFzl1th6XE/1yuMTFgvEafG+DSxxmdKT0PF+yshDvjZav/4hfH/Nytrqz640JK72i
	IldyvOcQT7YOj7dc+zhI9nYCktcnUKyCEX/lSj0V9iMegQJvL/xeY37YjYsMPheA+d1VaSKuxK0
	Vc1ewQ2xdzbOKceeqkjhrgl4DDRtnwPd4iSzppmUkrjpTd5pfTEgwtf6EBM2lFa1M4f6LV0U6bV
	Fg6mqgQtP1TXk77H9swj5HfdEgHmi0xy+Lxq0Um17Pnop+eMh5B7ABxjxkrgjwieYBcz45L/h6d
	efJWUPRmLUBaaYethLjKntENNhp6v6e3J/+zGzh03VCdsOpga1VNqL0N/WwsxNLVoorVTYPWTsw
	Diwm6H3M+uFJ43K7SKvHBhbnydiwt4PZnjtONeGY7vjgOtSaOy
X-Received: by 2002:a05:600c:8715:b0:495:4cb6:71c3 with SMTP id 5b1f17b1804b1-496b5736d24mr104705365e9.39.1785151288987;
        Mon, 27 Jul 2026 04:21:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f07:9aa0:a8b3:4e3f:e36b:e90a? ([2a01:e0a:f07:9aa0:a8b3:4e3f:e36b:e90a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f33b73sm209360385e9.14.2026.07.27.04.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 04:21:28 -0700 (PDT)
Message-ID: <778f017a-e1c2-4ab6-9968-6e4c6285180b@montane.tech>
Date: Mon, 27 Jul 2026 13:21:27 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: tas2783-sdw: no stereo channel split for two mono amps ->
 mono output (AMD ACP SoundWire, ASUS ProArt PX13)
To: Andrey Golovko <andrey.golovko@gmail.com>, linux-sound@vger.kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 linux-kernel@vger.kernel.org
References: <29e8c08b-9475-4aba-bce0-6d4a45a26d3b@gmail.com>
 <20b6c100ec50c0b9eb1dd31a338dbc9e@gmail.com>
Content-Language: en-US
From: Antoine Monnet <antoine@montane.tech>
In-Reply-To: <20b6c100ec50c0b9eb1dd31a338dbc9e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

(Apologies — I sent that from the wrong identity. 
monnet.antoine@gmail.com and antoine@montane.tech are the same person)

Hi Andrey,

Thanks for the second-machine confirmation and for spelling out the
mechanism - I went with exactly your suggestion and keyed the channel off
the machine-assigned component prefix rather than unique_id.

I logged name_prefix against the resulting ch_mask and got tas2783-1 = 0x8
= left, tas2783-2 = 0xb = right; the split is correct by ear and by per-amp
mixer mute. Since your unit is the same HN7306EAC the prefix ordering is
identical, so this should give correct L/R for you too - a Tested-by from
the second machine would be welcome if you get a chance, but nothing needs
re-deriving.

On the ch_maps alternative you raised: since asoc_sdw_hw_params() hands
every codec the full mask for playback, dai_link->ch_maps doesn't carry a
per-amp selection there, so I took the prefix-index route. Happy to switch
to ch_maps if the machine layer is taught to fill per-amp maps first -
that's really the TI question below.

Patch below, against broonie/sound for-next.

  sound/soc/codecs/tas2783-sdw.c | 18 ++++++++++++++++++
  1 file changed, 18 insertions(+)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -216,6 +216,24 @@ static s32 tas_sdw_hw_params(struct 
snd_pcm_substream *substream,
       /* SoundWire specific configuration */
       snd_sdw_params_to_config(substream, params,
                                &stream_config, &port_config);
+
+     /*
+      * The two mono amps each render one channel of the stereo stream:
+      * snd_sdw_params_to_config() hands every codec the full mask for
+      * playback, so without a per-amp channel selection only one amp would
+      * output. Derive the channel from the machine-assigned component
+      * prefix rather than the SoundWire address (which is board-specific):
+      * soc_sdw_ti_amp.c maps tas2783-1/-3 to the Left speaker and
+      * tas2783-2/-4 to the Right, so odd-indexed amps take the left
+      * channel and even-indexed the right.
+      */
+     if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+         params_channels(params) == 2 && component->name_prefix) {
+             const char *idx_str = strrchr(component->name_prefix, '-');
+             unsigned long idx;
+
+             if (idx_str && !kstrtoul(idx_str + 1, 10, &idx) && idx)
+                     port_config.ch_mask = (idx & 1) ? BIT(0) : BIT(1);
+     }
+
       /* port 1 for playback */
       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
               port_config.num = 1;
--
2.53.0


On 7/27/26 10:48, Andrey Golovko wrote:
> Hi Antoine,
>
> Confirmed on a second machine: ASUS ProArt PX13 HN7306EAC (Ryzen AI MAX+
> 395), Ubuntu 26.04, 7.2-rc4 based kernel, same two TAS2783 at unique_id
> 0x8 / 0xB plus RT721 on SoundWire link 1.
>
> Rather than judging by ear, I used the per-amp mixer controls, which
> makes the result unambiguous. Both amps at full scale ('tas2783-1/-2 Amp
> Volume' = 20, 'Speaker Volume' = 200), all four 'Left/Right Spk[2]
> Switch' on:
>
>    speaker-test -Dpipewire -c2 -s1 (left channel only)
>      - audible
>      - 'tas2783-2 Speaker Volume' = 0  -> complete silence
>      - 'tas2783-1 Speaker Volume' = 0  -> no audible change
>
>    speaker-test -Dpipewire -c2 -s2 (right channel only)
>      - silent, with both amps unmuted at full scale
>
> So exactly your picture: one amp (tas2783-2) renders audio and it renders
> the *left* channel, the other amp contributes nothing, and the right
> channel is never reproduced. Both amps do load their own per-address
> blob here (1714-1-8.bin / 1714-1-B.bin, via the fallback naming path
> after the 0x-prefixed names miss), so this is not a case of the wrong
> configuration being downloaded.
>
> On the "proper mechanism" question: a good part of the plumbing already
> exists, and it does not need unique_id at all.
>
>   - The machine layer already knows which amp is which. In
>     sound/soc/sdw_utils/soc_sdw_ti_amp.c, asoc_sdw_ti_spk_rtd_init() maps
>     the component name prefix to a speaker widget: tas2783-1 -> "Left
>     Spk", tas2783-2 -> "Right Spk", tas2783-3/-4 -> "Left/Right Spk2".
>     That is where the four 'Left/Right Spk[2] Switch' controls on this
>     board come from.
>
>   - asoc_sdw_hw_params() (sound/soc/sdw_utils/soc_sdw_utils.c) fills
>     dai_link->ch_maps, but for playback it deliberately hands every codec
>     the full mask ("Identical data will be sent to all codecs in
>     playback"), leaving the per-amp channel selection to the amp itself.
>     acp-sdw-legacy-mach, which drives this board, uses both.
>
> So the driver could derive the channel from the same prefix index the
> DAPM routing already uses, or from its entry in dai_link->ch_maps,
> instead of hard-coding SoundWire addresses.
>
> Which raises the question for TI: on TAS2783 is the channel selection
> meant to come from the per-device .bin (in which case it is evidently
> not taking effect on this board), or is the driver expected to program a
> per-amp channel mask? Depending on the answer, either the firmware
> description or tas_sdw_hw_params() needs fixing - and in the latter case
> the amp's channel should come from the machine-level mapping rather than
> from unique_id, which as you say is board-specific.
>
> Happy to test patches on this hardware; I can also collect register
> dumps from both amps if that helps.
>
> Thanks,
> Andrey
