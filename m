Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6536441D
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 03:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715051075; cv=none; b=JzEeTFEBjFv9bO7cRvYAaEk7oBm3q+AhOToZ7d1ALX9wY1ncU0E2QMEtk6sLvvtlFSWeJOTg7Vt9iUsz0Rz1kdnpN/7q0xuDwVmp2tImBNWREf5YenRHSDnMFDrmwZ7cQ3oLAff5DcsuUijXpMnG9jwwPE1PcQo83R2PuvFwUPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715051075; c=relaxed/simple;
	bh=RFrIbXHq78oyh3pXdp49G8MnDiK15gBxJJ+s7kJe088=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvEGftsJ+pht6T9nxW6eEqB8UXy1Zr4Zq5vM6OLd2d528jxrwGVl0F4Ql7mf3qdAfYXCAHAkDt8ho2n9pLZUwmlwzrlryntEJSXp9BeJAEmiWmyDrnEfmk7kJDyqfz9EyASgRwYEZK6yDPRYTNPMTGNqvJLs0nG+FHTRAMZfZ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=gGuuElUN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lph5vYAx; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="gGuuElUN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lph5vYAx"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id B151A1C001AA;
	Mon,  6 May 2024 23:04:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 06 May 2024 23:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1715051072; x=
	1715137472; bh=rtPkYa7xKhzg0ueGgAUuCSlIC42vx+gX3srzBNu9NlA=; b=g
	GuuElUNFGu5pW1vLqKt4u3aeTyuJxkAMCIfvDF19oyQYpTYLJQ3L6AVKUF6bLdl4
	JyBXUg3XLNj32kBB5BhKHVHzH5cEKMEz80fo6XIzQqDwJwx1DXECzHo4pwrU1uB8
	zTo7qCoTAfi5/vgoNbEwK1sMXKEcjwac7jmoPzefB07m2KLpr2bw3Zo8Wu3JaXxQ
	zkKW0PSU/gF4cKDQBZKoZPhTMHOpUHrxz7pv6dm8Gs++TjtrcE+ol+9ROfVvprww
	h5UsEoCPfTLY8pV/VSd4eqE6wEO8AEHuHzBWMcD29A5fzGCIPcRzTz76AMLzMrJL
	QycJbYyQOnGqAyoV9IDbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715051072; x=1715137472; bh=rtPkYa7xKhzg0ueGgAUuCSlIC42v
	x+gX3srzBNu9NlA=; b=Lph5vYAxSuJIhvbEddCIn7ZIC88KiYq4mfuPpypd1AxF
	DO3FIVqcBfia2u7+wyE/pC00l3+pFt/JhRzCrHmwUoIE9r9jv1yG2Y+M2gV5OGcz
	kSolzzWSyUJ66omXsWlTEx8pqTp/zFwjDTDsC3+6HeABTI0VN2evtDlDohPBW5AM
	2zCmd5EaVON5QBxFLd0boYpp443bx4tOckcvopqNA6SSCFcmdIT9BT11MvI+qliO
	05etYBsb9iaolOfou8QBzQ3i/n79DdWzv3TkEK9BqQzvERtCBZrxKOAHL2tvyelR
	JVdVTuVwEJ5e4WfT5T42kKzDo+GMbwGSAUhMkc7dMQ==
X-ME-Sender: <xms:QJo5Zlajjxc7ON1pv26_vTmW5Hlm2xxr95Eo_S6nJhbvKFTNl5YzQw>
    <xme:QJo5ZsbrJYSiU29IHQIzTRrPPQhBy5O7gw53WFgZKsHLYvUbwRq1OyBI9irTQ28IB
    RlUw1ZZMk-BcLss2A0>
X-ME-Received: <xmr:QJo5Zn-f4Vv1DAkmygO3sYlgMVFTdpTtv1j5MUkViXawXFc7-si2-gD-1XbgZoLtpfm4dQZJXGaPodkY7iAaiRVdnqriw73m0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvjedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:QJo5ZjpvVERUqQ-hL5DZPg2HwqWxfpOs8OtCAoWHeRD4C8AnLERGnw>
    <xmx:QJo5Zgo8nQWWcrffH4oPSYAMH6fBpwhN50QTHAfzVPbM1iBCJeBNVg>
    <xmx:QJo5ZpQoAi5yb2gSuzS8qRlu0viq-mwFHPKMB_9jKrgfTeoUKj4GEQ>
    <xmx:QJo5ZorQbbpJvhqOGW0YZYXTH5gtvESsbU0imnCumdARtQiYfVoa2A>
    <xmx:QJo5ZrWMh_Sic6OnxrTDhMKBYMCT_C4pxLhCjq8rluk4AahbFvEXXCTA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 May 2024 23:04:31 -0400 (EDT)
Date: Tue, 7 May 2024 12:04:29 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 2/2] ALSA: pcm: optimize and clarify stream
 sychronization ID API
Message-ID: <20240507030429.GB413281@workstation.local>
References: <20240506151218.377580-1-perex@perex.cz>
 <20240506151218.377580-3-perex@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506151218.377580-3-perex@perex.cz>

On Mon, May 06, 2024 at 05:11:50PM +0200, Jaroslav Kysela wrote:
> Optimize the memory usage in struct snd_pcm_runtime - use boolean
> value for the standard sync ID scheme.
> 
> Introduce snd_pcm_set_sync_per_card function to build synchronization
> IDs.
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> ---
>  include/sound/pcm.h      |  9 +++++++--
>  sound/core/pcm_lib.c     | 28 +++++++++++++++++-----------
>  sound/pci/emu10k1/p16v.c | 16 ++++++++++++----
>  3 files changed, 36 insertions(+), 17 deletions(-)
> 
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index dae41b100517..71c80ad8d4d3 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -397,7 +397,7 @@ struct snd_pcm_runtime {
>  	snd_pcm_uframes_t silence_start; /* starting pointer to silence area */
>  	snd_pcm_uframes_t silence_filled; /* already filled part of silence area */
>  
> -	unsigned char sync[16];		/* hardware synchronization ID */
> +	bool sync_flag;			/* hardware synchronization - standard per card ID */
>  
>  	/* -- mmap -- */
>  	struct snd_pcm_mmap_status *status;
> @@ -1151,7 +1151,12 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *buf, unsigned int
>  
>  void snd_pcm_set_ops(struct snd_pcm * pcm, int direction,
>  		     const struct snd_pcm_ops *ops);
> -void snd_pcm_set_sync(struct snd_pcm_substream *substream);
> +void snd_pcm_set_sync_per_card(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params,
> +			       const unsigned char *id, unsigned int len);
> +static inline void snd_pcm_set_sync(struct snd_pcm_substream *substream)
> +{
> +	substream->runtime->sync_flag = true;
> +}
>  int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
>  		      unsigned int cmd, void *arg);                      
>  void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
> diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> index 84b948db3393..82452c2e4887 100644
> --- a/sound/core/pcm_lib.c
> +++ b/sound/core/pcm_lib.c
> @@ -516,19 +516,23 @@ void snd_pcm_set_ops(struct snd_pcm *pcm, int direction,
>  EXPORT_SYMBOL(snd_pcm_set_ops);
>  
>  /**
> - * snd_pcm_set_sync - set the PCM sync id
> + * snd_pcm_set_sync_per_card - set the PCM sync id with card number
>   * @substream: the pcm substream
> + * @params: modified hardware parameters
> + * @id: identifier (max 12 bytes)
> + * @len: identifier length (max 12 bytes)
>   *
> - * Sets the PCM sync identifier for the card.
> + * Sets the PCM sync identifier for the card with zero padding.
>   */
> -void snd_pcm_set_sync(struct snd_pcm_substream *substream)
> +void snd_pcm_set_sync_per_card(struct snd_pcm_substream *substream,
> +			       struct snd_pcm_hw_params *params,
> +			       const unsigned char *id, unsigned int len)
>  {
> -	struct snd_pcm_runtime *runtime = substream->runtime;
> -	
> -	*(__u32 *)runtime->sync = cpu_to_le32(substream->pcm->card->number);
> -	memset(runtime->sync + 4, 0xff, sizeof(runtime->sync) - 4);
> +	*(__u32 *)params->sync = cpu_to_le32(substream->pcm->card->number);
> +	len = max(12, len);
> +	strncpy(params->sync + 4, id, len);
> +	memset(params->sync + 4 + len, 0, 12 - len);
>  }
> -EXPORT_SYMBOL(snd_pcm_set_sync);
  
As I mentioned to the previous patch, the value of zero in the first
element of array is problematic, since it is not distinguishable from
the card indexed by zero.

Additionally, I'm worried the second, third, and fourth element of array
is kept as zero, against 0xff in the original serialization code.

I think the series of '0x00 0x00 0x00 numeric-card-id' in the first four
elements is more preferable, however I wonder why the data is typed as
character array instead of integer array.

If the intension of API is not the kind of 'forcing-policy', the byte data
passed from drivers to user space application is reasonable. However,
in the call of above kernel API results in the breakage of policy. I think
more sophisticated way should be investigated, instead of the change in
this patch, in a view of programming interface for device driver developers
and user space application developers.

>  /*
>   *  Standard ioctl routine
> @@ -1811,10 +1815,12 @@ static int snd_pcm_lib_ioctl_fifo_size(struct snd_pcm_substream *substream,
>  static int snd_pcm_lib_ioctl_sync_id(struct snd_pcm_substream *substream,
>  				     void *arg)
>  {
> -	struct snd_pcm_hw_params *params = arg;
> +	static unsigned char id[12] = { 0xff, 0xff, 0xff, 0xff,
> +					0xff, 0xff, 0xff, 0xff,
> +					0xff, 0xff, 0xff, 0xff };
>  
> -	if (pcm_sync_empty(params->sync))
> -		memcpy(params->sync, &substream->runtime->sync, sizeof(params->sync));
> +	if (substream->runtime->sync_flag)
> +		snd_pcm_set_sync_per_card(substream, arg, id, sizeof(id));
>  	return 0;
>  }
>  
> diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
> index 773725dbdfbd..36b8a4ce2081 100644
> --- a/sound/pci/emu10k1/p16v.c
> +++ b/sound/pci/emu10k1/p16v.c
> @@ -174,10 +174,6 @@ static int snd_p16v_pcm_open_playback_channel(struct snd_pcm_substream *substrea
>  	if (err < 0)
>                  return err;
>  
> -	*(__u32 *)runtime->sync = cpu_to_le32(substream->pcm->card->number);
> -	memset(runtime->sync + 4, 0, sizeof(runtime->sync) - 4);
> -	strncpy(runtime->sync + 4, "P16V", 4);
> -
>  	return 0;
>  }
>  
> @@ -225,6 +221,17 @@ static int snd_p16v_pcm_open_capture(struct snd_pcm_substream *substream)
>  	return snd_p16v_pcm_open_capture_channel(substream, 0);
>  }
>  
> +static int snd_p16v_pcm_ioctl_playback(struct snd_pcm_substream *substream,
> +				       unsigned int cmd, void *arg)
> +{
> +	if (cmd == SNDRV_PCM_IOCTL1_SYNC_ID) {
> +		static unsigned char id[4] = { 'P', '1', '6', 'V' };
> +		snd_pcm_set_sync_per_card(substream, arg, id, 4);
> +		return 0;
> +	}
> +	return snd_pcm_lib_ioctl(substream, cmd, arg);
> +}
> +

'static const unsigned char id[4]' is preferable, since the data is
immutable during the lifetime of kernel module.

Anyway, as I mentioned to the previous patch, the serialization is not
compatible.

>  /* prepare playback callback */
>  static int snd_p16v_pcm_prepare_playback(struct snd_pcm_substream *substream)
>  {
> @@ -530,6 +537,7 @@ snd_p16v_pcm_pointer_capture(struct snd_pcm_substream *substream)
>  static const struct snd_pcm_ops snd_p16v_playback_front_ops = {
>  	.open =        snd_p16v_pcm_open_playback_front,
>  	.close =       snd_p16v_pcm_close_playback,
> +	.ioctl =       snd_p16v_pcm_ioctl_playback,
>  	.prepare =     snd_p16v_pcm_prepare_playback,
>  	.trigger =     snd_p16v_pcm_trigger_playback,
>  	.pointer =     snd_p16v_pcm_pointer_playback,
> -- 
> 2.43.0
