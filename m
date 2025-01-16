Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680F417578
	for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737039833; cv=none; b=EpIk5XffTFgOh/ElWmqYJzKQCJX+DQqliirZFexXr1yZTvfSslUE/TJtQ+dd7qF4V18dx+FOjSW7CJs39uEvHekIjrkxWREFQQQc1tAb3nMav22xTThqIKAkxgC0CxkPOXK7J5KsHfE/vgK5mXZ6P0rda3jgovWxMW0RRMRV1kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737039833; c=relaxed/simple;
	bh=no4w979KTWdejLQTTBbGUYLcUNPYq5DoEUEvIJ6z0G4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A38NTEfwdcXOvJRex843CtRjm5pUjgzPgN+r2EvfuChuInypKknXcvswSjZWEfh54onRd4FO7hELb6ZB3cd2jhE3YQmZgfxE+dG7EBqCkyXG+4rvaRi4Vkk1ClI9F53hShQuYUcTyTkUQBQu5PHnju6cKo4IyDwCtlDFX/HLtfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Dv8PGdth; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4DYt4ibb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Dv8PGdth; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4DYt4ibb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dv8PGdth";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4DYt4ibb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dv8PGdth";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4DYt4ibb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7361A211D5;
	Thu, 16 Jan 2025 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737039829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YUFi639i3f1kWvlLPyzOLucpYHIQ7a+7nxa7UE1c/Fo=;
	b=Dv8PGdthS9tSj2cqKM67o+MAmavbNTMSmto7KraBwBwXsVrxL8i/pE/BMXZOMzDcUrTg+J
	QV/hDAqvn41PMb/6VQ6/LQYpDxWl6nhpcd9ObwSxtToMCgmpPSyMNAK3ZkVy56swX5R8GN
	cKiufmyqL5rqZwF/jYJreKhRWJFbFFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737039829;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YUFi639i3f1kWvlLPyzOLucpYHIQ7a+7nxa7UE1c/Fo=;
	b=4DYt4ibbjE9/8G7jD5L8tqCweyY/nPq9bY9j+dRCYPBoPcp61Akz34rXLyMO0+SYLZJGtn
	dGkizmqFYT4QQeDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737039829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YUFi639i3f1kWvlLPyzOLucpYHIQ7a+7nxa7UE1c/Fo=;
	b=Dv8PGdthS9tSj2cqKM67o+MAmavbNTMSmto7KraBwBwXsVrxL8i/pE/BMXZOMzDcUrTg+J
	QV/hDAqvn41PMb/6VQ6/LQYpDxWl6nhpcd9ObwSxtToMCgmpPSyMNAK3ZkVy56swX5R8GN
	cKiufmyqL5rqZwF/jYJreKhRWJFbFFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737039829;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YUFi639i3f1kWvlLPyzOLucpYHIQ7a+7nxa7UE1c/Fo=;
	b=4DYt4ibbjE9/8G7jD5L8tqCweyY/nPq9bY9j+dRCYPBoPcp61Akz34rXLyMO0+SYLZJGtn
	dGkizmqFYT4QQeDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C27113A57;
	Thu, 16 Jan 2025 15:03:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UGxtEdUfiWdGEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 16 Jan 2025 15:03:49 +0000
Date: Thu, 16 Jan 2025 16:03:48 +0100
Message-ID: <878qraiywb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/2] ALSA: FCP: Add Focusrite Control Protocol driver
In-Reply-To: <7355f25d9b57386c280aef651b6ba2b96cf0d5a7.1737017960.git.g@b4.vu>
References: <cover.1737017960.git.g@b4.vu>
	<7355f25d9b57386c280aef651b6ba2b96cf0d5a7.1737017960.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Thu, 16 Jan 2025 10:03:35 +0100,
Geoffrey D. Bennett wrote:
> diff --git a/include/uapi/sound/tlv.h b/include/uapi/sound/tlv.h
> index b99a2414b53d..b6e260e35529 100644
> --- a/include/uapi/sound/tlv.h
> +++ b/include/uapi/sound/tlv.h
> @@ -18,6 +18,8 @@
>  #define SNDRV_CTL_TLVT_CHMAP_VAR	0x102	/* channels freely swappable */
>  #define SNDRV_CTL_TLVT_CHMAP_PAIRED	0x103	/* pair-wise swappable */
>  
> +#define SNDRV_CTL_TLVT_LABELS		0x110	/* channel labels */

IMHO, the data definition looks too ambiguous here to be put as a
public API.  It can be also a more specific name such as
*_CHANNEL_LABELS, too.


> +static int fcp_meter_ctl_get(struct snd_kcontrol *kctl,
> +			     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct usb_mixer_elem_info *elem = kctl->private_data;
> +	struct usb_mixer_interface *mixer = elem->head.mixer;
> +	struct fcp_data *private = mixer->private_data;
> +	int num_meter_slots, resp_size;
> +	u32 *resp __free(kfree) = NULL;
> +	int i, err = 0;
> +
> +	struct {
> +		__le16 pad;
> +		__le16 num_meters;
> +		__le32 magic;
> +	} __packed req;
> +
> +	guard(mutex)(&private->mutex);
> +
> +	err = fcp_reinit(mixer);
> +	if (err < 0)
> +		return err;
> +
> +	num_meter_slots = private->num_meter_slots;
> +	resp_size = num_meter_slots * sizeof(u32);
> +
> +	resp = kmalloc(resp_size, GFP_KERNEL);
> +	if (!resp)
> +		return -ENOMEM;

It depends on how often this kcontrol gets read, but if it's
frequently read, it might make sense to allocate this buffer
beforehand and keep using it instead of allocating / freeing at each
call.  The call is mutual, hence a common buffer is fine.

> +static int fcp_meter_tlv_callback(struct snd_kcontrol *kctl,
> +				  int op_flag, unsigned int size,
> +				  unsigned int __user *tlv)
> +{
> +	struct usb_mixer_elem_info *elem = kctl->private_data;
> +	struct usb_mixer_interface *mixer = elem->head.mixer;
> +	struct fcp_data *private = mixer->private_data;
> +
> +	if (op_flag == SNDRV_CTL_TLV_OP_READ) {
> +		if (private->meter_labels_tlv_size == 0)
> +			return 0;
> +
> +		if (size > private->meter_labels_tlv_size)
> +			size = private->meter_labels_tlv_size;
> +
> +		if (copy_to_user(tlv, private->meter_labels_tlv, size))
> +			return -EFAULT;

The private->meter_label* stuff can be changed dynamically via ioctl,
hence this call should have the data protection, too.
I didn't check fully, but private->mutex can be taken in this code
path, I suppose.


> +/* FCP initialisation */
> +static int fcp_ioctl_init(struct usb_mixer_interface *mixer,
> +			  struct fcp_init __user *arg)
> +{
> +	struct fcp_init init;
> +	struct usb_device *dev = mixer->chip->dev;
> +	struct fcp_data *private = mixer->private_data;
> +	void *resp __free(kfree) = NULL;
> +	void *step2_resp;
> +	int err, buf_size;
> +
> +	if (usb_pipe_type_check(dev, usb_sndctrlpipe(dev, 0)))
> +		return -EINVAL;
> +
> +	/* Get initialisation parameters */
> +	if (copy_from_user(&init, arg, sizeof(init)))
> +		return -EFAULT;
> +
> +	/* Validate the response sizes */
> +	if (init.step0_resp_size < 1 ||
> +	    init.step0_resp_size > 255 ||
> +	    init.step2_resp_size < 1 ||
> +	    init.step2_resp_size > 255)
> +		return -EINVAL;
> +
> +	private->step0_resp_size = init.step0_resp_size;
> +	private->step2_resp_size = init.step2_resp_size;
> +	private->init1_opcode = init.init1_opcode;
> +	private->init2_opcode = init.init2_opcode;
> +
> +	/* Allocate response buffer */
> +	buf_size = private->step0_resp_size + private->step2_resp_size;
> +
> +	resp = kmalloc(buf_size, GFP_KERNEL);
> +	if (!resp)
> +		return -ENOMEM;

I'd set private->step* and co after allocation of the buffer.
When they are set beforehand, even if the buffer allocation failed,
those values are still set.

> +/* Set the Level Meter labels */
> +static int fcp_ioctl_set_meter_labels(struct usb_mixer_interface *mixer,
> +				      struct fcp_meter_labels __user *arg)
> +{
(snip)
> +	/* Calculate padded data size */
> +	data_size = ((labels.labels_size + sizeof(unsigned int) - 1) &
> +		     ~(sizeof(unsigned int) - 1));

ALIGN() macro can be used nicely here.


thanks,

Takashi
